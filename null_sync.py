import json
import re
import difflib

def clean_macro(m):
    """Transforme TRAINER_GRUNT_AQUA_HIDEOUT_1 en Grunt Aqua Hideout 1"""
    return m.replace("TRAINER_", "").replace("_", " ").title()

def clean_class(c):
    """Transforme TRAINER_CLASS_TEAM_AQUA en Team Aqua"""
    return c.replace("TRAINER_CLASS_", "").replace("_", " ").title()

def word_in_string(word, text):
    """Vérifie si un mot exact est présent dans le texte (ignore la casse)"""
    pattern = r'\b' + re.escape(word.lower()) + r'\b'
    return bool(re.search(pattern, text.lower()))

def get_match_score(g_trainer, sheet_name):
    """
    Calcule la probabilité que le dresseur du jeu corresponde au nom de la sheet.
    """
    score = 0
    s_lower = sheet_name.lower()
    
    g_name = g_trainer['name']
    g_class = g_trainer['class']
    g_macro = clean_macro(g_trainer['macro'])
    
    # 1. Nom exact (Très fort). On exclut "Grunt" car trop générique.
    if g_name.lower() != "grunt" and word_in_string(g_name, s_lower):
        score += 2.0
        
    # 2. Classe exacte (Fort)
    if word_in_string(g_class, s_lower):
        score += 1.0
        
    # 3. Mots-clés du nom de code (Ex: "Hideout", "Museum", "Woods", "1")
    ignore_words = {'trainer', 'class', 'team', 'aqua', 'magma', 'grunt', 'elite'}
    macro_words = g_macro.split()
    for w in macro_words:
        if w.lower() not in ignore_words:
            if word_in_string(w, s_lower):
                score += 1.5 # Bonus si le lieu ou le numéro correspond

    # 4. Ratio de similarité globale (Fuzzy matching pour départager)
    rich_str = f"{g_class} {g_name} {g_macro}".lower()
    ratio = difflib.SequenceMatcher(None, s_lower, rich_str).ratio()
    score += ratio
    
    return score

def main():
    print("▶ Extraction des IDs (opponents.h)...")
    macro_to_id = {}
    try:
        with open('opponents.h', 'r', encoding='utf-8') as f:
            for line in f:
                match = re.search(r'#define\s+(TRAINER_\w+)\s+(\d+)', line)
                if match:
                    macro_to_id[match.group(1)] = match.group(2)
    except FileNotFoundError:
        print("❌ opponents.h introuvable.")
        return

    print("▶ Extraction des données de combat (trainers.h)...")
    game_trainers = []
    current_macro = None
    current_data = {}
    
    try:
        with open('trainers.h', 'r', encoding='utf-8') as f:
            for line in f:
                macro_match = re.search(r'\[(TRAINER_\w+)\]', line)
                if macro_match:
                    if current_macro:
                        game_trainers.append(current_data)
                    current_macro = macro_match.group(1)
                    current_data = {'macro': current_macro, 'class': "", 'name': ""}
                    continue
                
                if not current_macro: continue
                
                class_match = re.search(r'\.trainerClass\s*=\s*(TRAINER_CLASS_\w+)', line)
                if class_match: 
                    current_data['class'] = clean_class(class_match.group(1))
                
                name_match = re.search(r'\.trainerName\s*=\s*_\("([^"]+)"\)', line)
                if name_match: 
                    current_data['name'] = name_match.group(1)

        if current_macro:
            game_trainers.append(current_data)
    except FileNotFoundError:
        print("❌ trainers.h introuvable.")
        return

    print("▶ Chargement de la liste Google Sheets (sheet_trainers.txt)...")
    try:
        with open('sheet_trainers.txt', 'r', encoding='utf-8') as f:
            # On enlève les séparateurs visuels de ta sheet
            sheet_trainers = [
                line.strip() for line in f 
                if line.strip() and "split" not in line.lower() and "badge" not in line.lower()
            ]
    except FileNotFoundError:
        print("❌ sheet_trainers.txt introuvable.")
        return

    print("▶ Mapping intelligent en cours...")
    mapped_dict = {}
    matched_sheet_names = set()

    for g in game_trainers:
        t_id = macro_to_id.get(g['macro'])
        if not t_id: continue
        
        best_sheet_name = None
        best_score = 0
        
        for s_name in sheet_trainers:
            score = get_match_score(g, s_name)
            if score > best_score:
                best_score = score
                best_sheet_name = s_name
                
        # Si le score est >= 1.0 (ce qui signifie qu'au moins la classe ou un mot clé fort a matché)
        if best_score >= 1.0:
            mapped_dict[t_id] = best_sheet_name
            matched_sheet_names.add(best_sheet_name)
        else:
            # On tag le dresseur pour que tu le voies s'il n'a pas matché
            mapped_dict[t_id] = f"!!! À CORRIGER !!! {g['class']} {g['name']} ({g['macro']})"

    # Exportation du JSON
    with open("trainers.json", "w", encoding="utf-8") as f:
        json.dump(mapped_dict, f, indent=4, ensure_ascii=False)

    # Identifier les dresseurs de la Sheet qui n'ont reçu AUCUN ID
    unmatched_sheet = [name for name in sheet_trainers if name not in matched_sheet_names]
    
    with open("unmatched_trainers.txt", "w", encoding="utf-8") as f:
        for name in unmatched_sheet:
            f.write(name + "\n")

    print("\n✔ Opération terminée avec succès !")
    print(f"📁 Fichier 'trainers.json' généré ({len(mapped_dict)} dresseurs en jeu analysés).")
    print(f"⚠️ Dresseurs de la Sheet non assignés : {len(unmatched_sheet)} (voir 'unmatched_trainers.txt').\n")

if __name__ == "__main__":
    main()
