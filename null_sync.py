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
# L'URL sera chargée dynamiquement au lancement
SPREADSHEET_URL = "" 
SHEET_URL_FILE = "sheet_url.txt"
CREDENTIALS_FILE = "credentials.json"
TRAINERS_FILE = "trainers.json"
FRAGS_FILE = "frags_by_trainer.json"
BOX_FILE = "box_data.txt"

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
    print("▶ Importation de la Box en cours...")
    try:
        with open(BOX_FILE, 'r', encoding='utf-8') as f:
            raw_data = f.read()
    except FileNotFoundError:
        print("  Fichier box_data.txt introuvable. Ignoré.")
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
        print(f"  ✔ {len(updates)} Pokémon importés avec succès !")
    else:
        print("  Aucun nouveau Pokémon à importer.")

def log_traceback(message):
    """Affiche une erreur et l'écrit dans un fichier de log horodaté."""
    print(message)
    try:
        with open("sync_traceback.txt", "a", encoding="utf-8") as f:
            now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            f.write(f"[{now}] {message}\n")
    except Exception as e:
        print(f"Impossible d'écrire dans le fichier de traceback : {e}")

# ==========================================
# FONCTION 2 : UPDATE DES FRAGS
# ==========================================
def update_frags(sheet):
    print("▶ Mise à jour des Frags en cours...")
    frags_data = load_json(FRAGS_FILE)
    trainers_map = load_json(TRAINERS_FILE)

    if not frags_data or "encounters" not in frags_data:
        print("  Aucune donnée de frags trouvée.")
        return

    tracker_sheet = sheet.worksheet("Trainer Tracking")
    col_a = tracker_sheet.col_values(1)
    
    aggregated_frags = {}
    
    for encounter in frags_data["encounters"]:
        t_id = str(encounter["trainerId"])
        trainer_name = trainers_map.get(t_id)

        if not trainer_name:
            log_traceback(f"❌ [Avertissement] Le dresseur ID {t_id} n'a pas de nom défini dans trainers.json.")
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
            log_traceback(f"❌ [Erreur Sheet] Dresseur ID {ids_str} ('{trainer_name}') est introuvable dans la Google Sheet.")
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
        print(f"  ✔ Frags mis à jour pour {len(updates)} dresseur(s) regroupé(s) !")

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
        self.root.geometry("600x500")
        self.root.configure(padx=20, pady=20)

        self.is_auto_sync_running = False
        self.auto_sync_job = None
        
        self.setup_ui()

        sys.stdout = PrintLogger(self.log_area, self.root)

        print("Bienvenue dans le Null Tracker Sync !")
        print("L'outil est connecté à ta Google Sheet et prêt.\n")

    def setup_ui(self):
        title_label = tk.Label(self.root, text="Google Sheets Auto-Sync", font=("Helvetica", 16, "bold"))
        title_label.pack(pady=(0, 15))

        self.btn_manual = tk.Button(self.root, text="🔄 Synchroniser Maintenant", font=("Helvetica", 12), 
                                    bg="#4CAF50", fg="white", activebackground="#45a049", 
                                    command=self.run_sync_thread)
        self.btn_manual.pack(fill=tk.X, pady=5)

        frame_auto = tk.LabelFrame(self.root, text="Synchronisation Automatique", font=("Helvetica", 10), padx=10, pady=10)
        frame_auto.pack(fill=tk.X, pady=15)

        tk.Label(frame_auto, text="Intervalle (minutes) :").pack(side=tk.LEFT)
        
        self.entry_minutes = tk.Entry(frame_auto, width=5, justify="center")
        self.entry_minutes.insert(0, "5")
        self.entry_minutes.pack(side=tk.LEFT, padx=5)

        self.btn_auto = tk.Button(frame_auto, text="▶ Activer Auto-Sync", bg="#2196F3", fg="white", 
                                  command=self.toggle_auto_sync)
        self.btn_auto.pack(side=tk.RIGHT)

        self.lbl_status = tk.Label(self.root, text="Statut : En attente", fg="gray", font=("Helvetica", 10, "italic"))
        self.lbl_status.pack(pady=5)

        self.log_area = scrolledtext.ScrolledText(self.root, wrap=tk.WORD, height=12, font=("Consolas", 9), state=tk.DISABLED)
        self.log_area.pack(fill=tk.BOTH, expand=True)

    def toggle_auto_sync(self):
        if self.is_auto_sync_running:
            self.is_auto_sync_running = False
            if self.auto_sync_job:
                self.root.after_cancel(self.auto_sync_job)
            self.btn_auto.config(text="▶ Activer Auto-Sync", bg="#2196F3")
            self.lbl_status.config(text="Statut : Auto-Sync Désactivé", fg="gray")
            print("\n⏹️ Mode Automatique arrêté.")
            self.entry_minutes.config(state=tk.NORMAL)
        else:
            try:
                self.minutes = int(self.entry_minutes.get())
                if self.minutes <= 0: raise ValueError
            except ValueError:
                messagebox.showerror("Erreur", "Veuillez entrer un nombre entier positif.")
                return

            self.is_auto_sync_running = True
            self.entry_minutes.config(state=tk.DISABLED)
            self.btn_auto.config(text="⏹ Arrêter Auto-Sync", bg="#f44336")
            self.lbl_status.config(text=f"Statut : Auto-Sync Actif (toutes les {self.minutes} min)", fg="#2196F3")
            print(f"\n▶️ Mode Automatique activé. Prochaine synchro dans {self.minutes} minute(s).")
            
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
        print("\n--- DÉBUT DE LA SYNCHRONISATION ---")
        try:
            scope = ["https://spreadsheets.google.com/feeds", "https://www.googleapis.com/auth/drive"]
            creds = ServiceAccountCredentials.from_json_keyfile_name(CREDENTIALS_FILE, scope)
            client = gspread.authorize(creds)
            sheet = client.open_by_url(SPREADSHEET_URL)

            import_box(sheet)
            update_frags(sheet)
            
        except Exception as e:
            print(f"❌ Erreur lors de la synchronisation : {e}")
            log_traceback(f"❌ Erreur critique de synchronisation : {e}")
            
        print("--- FIN DE LA SYNCHRONISATION ---")
        self.root.after(0, lambda: self.btn_manual.config(state=tk.NORMAL))

# ==========================================
# POINT D'ENTRÉE ET VÉRIFICATIONS
# ==========================================
if __name__ == "__main__":
    root = tk.Tk()
    root.withdraw() # Cache la fenêtre pendant les vérifications

    missing_files = []

    # Vérification 1 : Les identifiants Google
    if not os.path.exists(CREDENTIALS_FILE):
        missing_files.append(CREDENTIALS_FILE)

    # Vérification 2 : Le dictionnaire des dresseurs
    if not os.path.exists(TRAINERS_FILE):
        missing_files.append(TRAINERS_FILE)

    # Vérification 3 : Le fichier contenant le lien (on le crée s'il manque)
    if not os.path.exists(SHEET_URL_FILE):
        with open(SHEET_URL_FILE, "w", encoding="utf-8") as f:
            f.write("COLLE_LE_LIEN_DE_TA_SHEET_ICI")
        missing_files.append(SHEET_URL_FILE)

    if missing_files:
        msg = "Le programme ne peut pas démarrer car certains fichiers obligatoires sont introuvables :\n\n"
        for f in missing_files:
            msg += f"- {f}\n"
        msg += "\nComment les récupérer/configurer :\n"
        msg += "1. credentials.json : Crée une clé via Google Cloud (voir tutoriel GitHub).\n"
        msg += "2. sheet_url.txt : Ce fichier vient d'être créé ! Ouvre-le avec le Bloc-notes et colle le lien de ta Google Sheet dedans.\n"
        msg += "3. trainers.json : Utilise le script fourni pour le générer ou télécharge-le.\n\n"
        msg += "Place tous ces fichiers dans le même dossier que cet exécutable (.exe) et relance l'application."
        
        messagebox.showerror("Fichiers manquants", msg)
        sys.exit()

    # Si tous les fichiers sont là, on lit l'URL
    with open(SHEET_URL_FILE, "r", encoding="utf-8") as f:
        url = f.read().strip()
        if not url.startswith("http"):
            messagebox.showerror("Lien invalide", f"Le fichier '{SHEET_URL_FILE}' ne contient pas un lien valide.\n\nOuvre ce fichier avec le Bloc-notes, supprime tout, et colle le lien direct vers ta Google Sheet (qui commence par https://...).")
            sys.exit()
        SPREADSHEET_URL = url

    # Affichage de l'interface graphique
    root.deiconify() 
    app = TrackerApp(root)
    root.mainloop()
