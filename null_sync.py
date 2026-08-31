import os
import json
import re
import difflib
import sys
import threading
import tkinter as tk
from tkinter import scrolledtext, messagebox
from datetime import datetime

import gspread
from oauth2client.service_account import ServiceAccountCredentials

# ==========================================
# CONFIGURATION
# ==========================================
SPREADSHEET_URL = "" 
SHEET_URL_FILE = "sheet_url.txt"
CREDENTIALS_FILE = "credentials.json"
TRAINERS_FILE = "trainers.json"
FRAGS_FILE = "frags_by_trainer.json"
BOX_FILE = "box_data.txt"

CURRENT_LANG = "FR"

# Dictionnaire de traduction
TXT = {
    "FR": {
        "title": "Google Sheets Auto-Sync",
        "sync_now": "🔄 Synchroniser Maintenant",
        "auto_sync": "Synchronisation Automatique",
        "interval": "Intervalle (minutes) :",
        "enable_auto": "▶ Activer Auto-Sync",
        "disable_auto": "⏹ Arrêter Auto-Sync",
        "status_wait": "Statut : En attente",
        "status_auto_off": "Statut : Auto-Sync Désactivé",
        "status_auto_on": "Statut : Auto-Sync Actif (toutes les {} min)",
        "err_num": "Veuillez entrer un nombre entier positif.",
        "welcome": "Bienvenue dans le Null Tracker Sync !\nL'outil est connecté à ta Google Sheet et prêt.\n",
        "auto_stop_log": "\n⏹️ Mode Automatique arrêté.",
        "auto_start_log": "\n▶️ Mode Automatique activé. Prochaine synchro dans {} minute(s).",
        "sync_start": "\n--- DÉBUT DE LA SYNCHRONISATION ---",
        "sync_end": "--- FIN DE LA SYNCHRONISATION ---",
        "import_box": "▶ Importation de la Box en cours...",
        "no_box": "  Fichier box_data.txt introuvable. Ignoré.",
        "box_success": "  ✔ {} Pokémon importé(s) avec succès !",
        "box_empty": "  Aucun nouveau Pokémon à importer.",
        "update_frags": "▶ Mise à jour des Frags en cours...",
        "no_frags": "  Aucune donnée de frags trouvée.",
        "frags_success": "  ✔ Frags mis à jour pour {} dresseur(s) regroupé(s) !",
        "err_sheet": "❌ [Erreur Sheet] Dresseur ID {} ('{}') est introuvable dans la Google Sheet.",
        "err_sync": "❌ Erreur lors de la synchronisation : {}",
        "err_crit": "❌ Erreur critique de synchronisation : {}",
        "err_tb": "Impossible d'écrire dans le fichier de traceback : {}"
    },
    "EN": {
        "title": "Google Sheets Auto-Sync",
        "sync_now": "🔄 Sync Now",
        "auto_sync": "Automatic Synchronization",
        "interval": "Interval (minutes):",
        "enable_auto": "▶ Enable Auto-Sync",
        "disable_auto": "⏹ Stop Auto-Sync",
        "status_wait": "Status: Waiting",
        "status_auto_off": "Status: Auto-Sync Disabled",
        "status_auto_on": "Status: Auto-Sync Active (every {} min)",
        "err_num": "Please enter a positive integer.",
        "welcome": "Welcome to Null Tracker Sync!\nThe tool is connected to your Google Sheet and ready.\n",
        "auto_stop_log": "\n⏹️ Automatic Mode stopped.",
        "auto_start_log": "\n▶️ Automatic Mode enabled. Next sync in {} minute(s).",
        "sync_start": "\n--- SYNC STARTED ---",
        "sync_end": "--- SYNC FINISHED ---",
        "import_box": "▶ Importing Box...",
        "no_box": "  box_data.txt file not found. Ignored.",
        "box_success": "  ✔ {} Pokémon successfully imported!",
        "box_empty": "  No new Pokémon to import.",
        "update_frags": "▶ Updating Frags...",
        "no_frags": "  No frag data found.",
        "frags_success": "  ✔ Frags updated for {} grouped trainer(s)!",
        "err_sheet": "❌ [Sheet Error] Trainer ID {} ('{}') not found in the Google Sheet.",
        "err_sync": "❌ Sync error: {}",
        "err_crit": "❌ Critical sync error: {}",
        "err_tb": "Cannot write to traceback file: {}"
    }
}

# ==========================================
# LOGIQUE MÉTIER
# ==========================================
def load_json(filepath):
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            return json.load(f)
    except FileNotFoundError:
        return {}

def find_best_trainer_row(target_name, col_a):
    candidates = {name.strip(): i for i, name in enumerate(col_a) if name.strip()}
    target_lower = target_name.strip().lower()
    
    for name, index in candidates.items():
        if name.lower() == target_lower:
            return index + 1
            
    matches = difflib.get_close_matches(target_name, candidates.keys(), n=5, cutoff=0.6)
    if not matches:
        return None
        
    best_match = matches[0]
    if len(matches) > 1 and "split" not in target_lower:
        non_split_matches = [m for m in matches if "split" not in m.lower()]
        if non_split_matches:
            best_match = non_split_matches[0]
            
    return candidates[best_match] + 1

def import_box(sheet):
    print(TXT[CURRENT_LANG]["import_box"])
    try:
        with open(BOX_FILE, 'r', encoding='utf-8') as f:
            raw_data = f.read()
    except FileNotFoundError:
        print(TXT[CURRENT_LANG]["no_box"])
        return

    pokemon_sheet = sheet.worksheet("Pokémon")
    met_locations_data = pokemon_sheet.get('E5:E87')
    met_locations = [row[0].strip() if row else "" for row in met_locations_data]

    entries = raw_data.split("Name:")
    mons_to_import = []

    for entry in entries:
        if not entry.strip(): continue
        entry = "Name:" + entry
        
        name_match = re.search(r'Name:\s*([^\n\r]+)', entry)
        nick_match = re.search(r'Nickname:\s*([^\n\r]+)', entry)
        met_match = re.search(r'Met Location:\s*([^\n\r]+)', entry)
        nature_match = re.search(r'Nature:\s*([^\n\r]+)', entry)
        ability_match = re.search(r'Ability:\s*([^\n\r]+)', entry)
        iv_match = re.search(r'IVs:\s*HP\s*(\d+)\s*\/\s*Atk\s*(\d+)\s*\/\s*Def\s*(\d+)\s*\/\s*SpA\s*(\d+)\s*\/\s*SpD\s*(\d+)\s*\/\s*Spe\s*(\d+)', entry)

        if not name_match or not met_match: continue

        met_loc = met_match.group(1).strip()
        if met_loc == "(Fateful Encounter)": met_loc = "Starter"

        mons_to_import.append({
            "loc": met_loc,
            "data": [
                name_match.group(1).strip(),
                nick_match.group(1).strip() if nick_match and nick_match.group(1).strip() != "None" else "",
                "", 
                ability_match.group(1).strip() if ability_match else "",
                nature_match.group(1).strip() if nature_match else "",
                iv_match.group(1) if iv_match else "",
                iv_match.group(2) if iv_match else "",
                iv_match.group(3) if iv_match else "",
                iv_match.group(4) if iv_match else "",
                iv_match.group(5) if iv_match else "",
                iv_match.group(6) if iv_match else ""
            ]
        })

    updates = []
    used_rows = {}
    
    for mon in mons_to_import:
        loc = mon["loc"]
        if loc not in used_rows:
            used_rows[loc] = 0
            
        matching_indices = [i for i, x in enumerate(met_locations) if x == loc]
        
        if used_rows[loc] < len(matching_indices):
            row_num = matching_indices[used_rows[loc]] + 5
            cell_range = f"J{row_num}:T{row_num}"
            updates.append({"range": cell_range, "values": [mon["data"]]})
            used_rows[loc] += 1

    if updates:
        pokemon_sheet.batch_update(updates)
        print(TXT[CURRENT_LANG]["box_success"].format(len(updates)))
    else:
        print(TXT[CURRENT_LANG]["box_empty"])

def log_traceback(message):
    print(message)
    try:
        with open("sync_traceback.txt", "a", encoding="utf-8") as f:
            now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            f.write(f"[{now}] {message}\n")
    except Exception as e:
        print(TXT[CURRENT_LANG]["err_tb"].format(e))

def update_frags(sheet):
    print(TXT[CURRENT_LANG]["update_frags"])
    frags_data = load_json(FRAGS_FILE)
    trainers_map = load_json(TRAINERS_FILE)

    if not frags_data or "encounters" not in frags_data:
        print(TXT[CURRENT_LANG]["no_frags"])
        return

    tracker_sheet = sheet.worksheet("Trainer Tracking")
    col_a = tracker_sheet.col_values(1)
    
    aggregated_frags = {}
    
    for encounter in frags_data["encounters"]:
        t_id = str(encounter["trainerId"])
        trainer_name = trainers_map.get(t_id)

        if not trainer_name or "!!!" in trainer_name:
            continue

        if trainer_name not in aggregated_frags:
            aggregated_frags[trainer_name] = {"ids": [], "frags": {}}
            
        if t_id not in aggregated_frags[trainer_name]["ids"]:
            aggregated_frags[trainer_name]["ids"].append(t_id)
            
        for pkm, kills in encounter["frags"].items():
            if pkm not in aggregated_frags[trainer_name]["frags"]:
                aggregated_frags[trainer_name]["frags"][pkm] = 0
            aggregated_frags[trainer_name]["frags"][pkm] += kills

    updates = []
    
    for trainer_name, data in aggregated_frags.items():
        row_index = find_best_trainer_row(trainer_name, col_a)

        if not row_index:
            ids_str = ", ".join(data["ids"])
            log_traceback(TXT[CURRENT_LANG]["err_sheet"].format(ids_str, trainer_name))
            continue

        row_data = []
        
        for pkm, kills in list(data["frags"].items())[:6]:
            row_data.append(pkm)
            row_data.append(kills)
            
        while len(row_data) < 12:
            row_data.append("")

        updates.append({
            "range": f"B{row_index}:M{row_index}",
            "values": [row_data]
        })

    if updates:
        tracker_sheet.batch_update(updates)
        print(TXT[CURRENT_LANG]["frags_success"].format(len(updates)))

# ==========================================
# GESTIONNAIRE D'AFFICHAGE CONSOLE -> GUI
# ==========================================
class PrintLogger:
    def __init__(self, text_widget, root):
        self.text_widget = text_widget
        self.root = root

    def write(self, text):
        self.root.after(0, self._insert_text, text)

    def _insert_text(self, text):
        self.text_widget.config(state=tk.NORMAL)
        self.text_widget.insert(tk.END, text)
        self.text_widget.see(tk.END)
        self.text_widget.config(state=tk.DISABLED)

    def flush(self):
        pass

# ==========================================
# INTERFACE GRAPHIQUE (GUI)
# ==========================================
class TrackerApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Null Nuzlocke Auto-Sync")
        self.root.geometry("620x500")
        self.root.configure(padx=20, pady=20)

        self.is_auto_sync_running = False
        self.auto_sync_job = None
        
        self.setup_ui()

        sys.stdout = PrintLogger(self.log_area, self.root)
        print(TXT[CURRENT_LANG]["welcome"])

    def setup_ui(self):
        top_frame = tk.Frame(self.root)
        top_frame.pack(fill=tk.X, pady=(0, 15))
        
        self.title_label = tk.Label(top_frame, text=TXT[CURRENT_LANG]["title"], font=("Helvetica", 16, "bold"))
        self.title_label.pack(side=tk.LEFT)
        
        lang_frame = tk.Frame(top_frame)
        lang_frame.pack(side=tk.RIGHT)
        
        # Ajout des drapeaux emojis (police Segoe UI Emoji pour compatibilité maximale)
        tk.Label(lang_frame, text="🇫🇷", font=("Segoe UI Emoji", 14)).pack(side=tk.LEFT)
        self.lang_scale = tk.Scale(lang_frame, from_=0, to=1, orient=tk.HORIZONTAL, showvalue=0, sliderlength=20, length=40, command=self.change_lang)
        self.lang_scale.pack(side=tk.LEFT, padx=5)
        tk.Label(lang_frame, text="🇺🇸", font=("Segoe UI Emoji", 14)).pack(side=tk.LEFT)

        self.btn_manual = tk.Button(self.root, text=TXT[CURRENT_LANG]["sync_now"], font=("Helvetica", 12), 
                                    bg="#4CAF50", fg="white", activebackground="#45a049", 
                                    command=self.run_sync_thread)
        self.btn_manual.pack(fill=tk.X, pady=5)

        self.frame_auto = tk.LabelFrame(self.root, text=TXT[CURRENT_LANG]["auto_sync"], font=("Helvetica", 10), padx=10, pady=10)
        self.frame_auto.pack(fill=tk.X, pady=15)

        self.lbl_interval = tk.Label(self.frame_auto, text=TXT[CURRENT_LANG]["interval"])
        self.lbl_interval.pack(side=tk.LEFT)
        
        self.entry_minutes = tk.Entry(self.frame_auto, width=5, justify="center")
        self.entry_minutes.insert(0, "5")
        self.entry_minutes.pack(side=tk.LEFT, padx=5)

        self.btn_auto = tk.Button(self.frame_auto, text=TXT[CURRENT_LANG]["enable_auto"], bg="#2196F3", fg="white", 
                                  command=self.toggle_auto_sync)
        self.btn_auto.pack(side=tk.RIGHT)

        self.lbl_status = tk.Label(self.root, text=TXT[CURRENT_LANG]["status_wait"], fg="gray", font=("Helvetica", 10, "italic"))
        self.lbl_status.pack(pady=5)

        self.log_area = scrolledtext.ScrolledText(self.root, wrap=tk.WORD, height=12, font=("Consolas", 9), state=tk.DISABLED)
        self.log_area.pack(fill=tk.BOTH, expand=True)

    def change_lang(self, val):
        global CURRENT_LANG
        CURRENT_LANG = "EN" if int(val) == 1 else "FR"
        
        self.title_label.config(text=TXT[CURRENT_LANG]["title"])
        self.btn_manual.config(text=TXT[CURRENT_LANG]["sync_now"])
        self.frame_auto.config(text=TXT[CURRENT_LANG]["auto_sync"])
        self.lbl_interval.config(text=TXT[CURRENT_LANG]["interval"])
        
        if self.is_auto_sync_running:
            self.btn_auto.config(text=TXT[CURRENT_LANG]["disable_auto"])
            self.lbl_status.config(text=TXT[CURRENT_LANG]["status_auto_on"].format(self.minutes))
        else:
            self.btn_auto.config(text=TXT[CURRENT_LANG]["enable_auto"])
            if hasattr(self, 'minutes'):
                self.lbl_status.config(text=TXT[CURRENT_LANG]["status_auto_off"])
            else:
                self.lbl_status.config(text=TXT[CURRENT_LANG]["status_wait"])

    def toggle_auto_sync(self):
        if self.is_auto_sync_running:
            self.is_auto_sync_running = False
            if self.auto_sync_job:
                self.root.after_cancel(self.auto_sync_job)
            self.btn_auto.config(text=TXT[CURRENT_LANG]["enable_auto"], bg="#2196F3")
            self.lbl_status.config(text=TXT[CURRENT_LANG]["status_auto_off"], fg="gray")
            print(TXT[CURRENT_LANG]["auto_stop_log"])
            self.entry_minutes.config(state=tk.NORMAL)
        else:
            try:
                self.minutes = int(self.entry_minutes.get())
                if self.minutes <= 0: raise ValueError
            except ValueError:
                messagebox.showerror("Erreur / Error", TXT[CURRENT_LANG]["err_num"])
                return

            self.is_auto_sync_running = True
            self.entry_minutes.config(state=tk.DISABLED)
            self.btn_auto.config(text=TXT[CURRENT_LANG]["disable_auto"], bg="#f44336")
            self.lbl_status.config(text=TXT[CURRENT_LANG]["status_auto_on"].format(self.minutes), fg="#2196F3")
            print(TXT[CURRENT_LANG]["auto_start_log"].format(self.minutes))
            
            self.run_sync_thread()
            self.schedule_next_sync()

    def schedule_next_sync(self):
        if self.is_auto_sync_running:
            self.auto_sync_job = self.root.after(self.minutes * 60000, self._auto_sync_tick)

    def _auto_sync_tick(self):
        self.run_sync_thread()
        self.schedule_next_sync()

    def run_sync_thread(self):
        self.btn_manual.config(state=tk.DISABLED)
        threading.Thread(target=self.perform_sync, daemon=True).start()

    def perform_sync(self):
        print(TXT[CURRENT_LANG]["sync_start"])
        try:
            scope = ["https://spreadsheets.google.com/feeds", "https://www.googleapis.com/auth/drive"]
            creds = ServiceAccountCredentials.from_json_keyfile_name(CREDENTIALS_FILE, scope)
            client = gspread.authorize(creds)
            sheet = client.open_by_url(SPREADSHEET_URL)

            import_box(sheet)
            update_frags(sheet)
            
        except Exception as e:
            print(TXT[CURRENT_LANG]["err_sync"].format(e))
            log_traceback(TXT[CURRENT_LANG]["err_crit"].format(e))
            
        print(TXT[CURRENT_LANG]["sync_end"])
        self.root.after(0, lambda: self.btn_manual.config(state=tk.NORMAL))

# ==========================================
# POINT D'ENTRÉE ET VÉRIFICATIONS
# ==========================================
if __name__ == "__main__":
    root = tk.Tk()
    root.withdraw() 

    missing_files = []

    if not os.path.exists(CREDENTIALS_FILE): missing_files.append(CREDENTIALS_FILE)
    if not os.path.exists(TRAINERS_FILE): missing_files.append(TRAINERS_FILE)

    if not os.path.exists(SHEET_URL_FILE):
        with open(SHEET_URL_FILE, "w", encoding="utf-8") as f:
            f.write("COLLE_LE_LIEN_DE_TA_SHEET_ICI")
        missing_files.append(SHEET_URL_FILE)

    if missing_files:
        msg = (
            "Le programme ne peut pas démarrer car certains fichiers obligatoires sont introuvables :\n"
            "The program cannot start because some required files are missing:\n\n"
        )
        for f in missing_files:
            msg += f"- {f}\n"
        msg += (
            "\nComment les récupérer/configurer (How to fix):\n"
            "1. credentials.json : Crée une clé via Google Cloud / Create a key via Google Cloud.\n"
            "2. sheet_url.txt : Ouvre-le et colle le lien direct de ta Sheet dedans. / Open it and paste your Google Sheet link inside.\n"
            "3. trainers.json : Génère-le avec le script fourni. / Generate it with the provided script.\n\n"
            "Place tous ces fichiers dans le même dossier que l'exécutable et relance.\n"
            "Place all these files in the same folder as the executable and restart."
        )
        messagebox.showerror("Fichiers manquants / Missing files", msg)
        sys.exit()

    with open(SHEET_URL_FILE, "r", encoding="utf-8") as f:
        url = f.read().strip()
        if not url.startswith("http"):
            msg_url = (
                f"Le fichier '{SHEET_URL_FILE}' ne contient pas un lien valide.\n"
                f"The '{SHEET_URL_FILE}' file does not contain a valid link.\n\n"
                "Ouvre ce fichier avec le Bloc-notes, supprime tout, et colle le lien direct vers ta Google Sheet (qui commence par https://...).\n"
                "Open this file with Notepad, delete everything, and paste the direct link to your Google Sheet (starting with https://...)."
            )
            messagebox.showerror("Lien invalide / Invalid link", msg_url)
            sys.exit()
        SPREADSHEET_URL = url

    root.deiconify() 
    app = TrackerApp(root)
    root.mainloop()
