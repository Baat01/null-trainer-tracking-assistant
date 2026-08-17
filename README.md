# Pokémon Null - Nuzlocke Auto-Tracker & Google Sheets Sync

Ce dépôt contient un ensemble d'outils (Lua et Python) permettant d'automatiser entièrement le suivi de vos runs (Nuzlocke, etc.) sur **Pokémon Null** (ou d'autres hacks basés sur la décompilation *pokeemerald-expansion*). 

Le système détecte automatiquement les Pokémon de votre équipe, les captures dans le PC, et surtout les **KOs (frags) par dresseur**, pour tout synchroniser en temps réel sur votre Google Sheet !

## 📁 Contenu du dépôt

*   `Baat Tracking Script V1.2.3.lua` : Script principal gérant la lecture de la RAM de la GBA (données des Pokémon, équipes, objets, natures, etc.).
*   `Baat frag counter assistant V1.2.3.lua` : Script secondaire chargé du tracking en direct des combats, de la détection des KOs, de la gestion des relances, et de l'export des fichiers de données.
*   `null_sync.py` : Application Python (avec interface graphique) faisant le pont entre les fichiers locaux générés par l'émulateur et l'API de Google Sheets.
*   `trainers.json` : Fichier de configuration associant l'ID interne des dresseurs en jeu à leur nom exact dans votre Google Sheet.

---

## 🛠️ Prérequis

1.  **Émulateur :** [mGBA version 0.10.0](https://mgba.io/) ou supérieure (le scripting Lua n'est pas supporté sur les versions antérieures).
2.  **Python :** [Python 3](https://www.python.org/downloads/) installé sur votre machine.
3.  **Google Sheet :** Une copie de la [Frag Sheet "Advanced Frag Sheet Terra Emerald V1.2.1"](https://docs.google.com/spreadsheets/d/17SsoACBANl5g-iQghpHbQPkRDyR59ujOs0aZHsIaIAU/edit?gid=1682547405#gid=1682547405) (ou un modèle similaire) avec les onglets "Pokémon" et "Trainer Tracking".

---

## ⚙️ Installation et Configuration

### Étape 1 : Préparer l'environnement Python
Ouvrez une invite de commande (ou un terminal) et installez les dépendances requises pour le script de synchronisation :
```bash
pip install gspread oauth2client

```

*(Note : le module `tkinter`, utilisé pour l'interface graphique, est généralement inclus nativement avec l'installation de Python).*

### Étape 2 : Configuration de l'API Google Sheets

Pour que le script Python puisse modifier votre feuille de calcul de façon autonome, vous devez lui générer un accès sécurisé :

1. Allez sur la [Google Cloud Console](https://console.cloud.google.com/).
2. Créez un nouveau projet (ex: "Null-Tracker").
3. Allez dans **API et services > Bibliothèque** et activez la **Google Sheets API** ainsi que la **Google Drive API**.
4. Allez dans **Identifiants > Créer des identifiants > Compte de service**. Remplissez les informations de base.
5. Cliquez sur le compte de service nouvellement créé, allez dans l'onglet **Clés > Ajouter une clé > Créer une clé** et choisissez le format **JSON**.
6. Renommez le fichier téléchargé en `credentials.json` et placez-le dans le même dossier que vos scripts.
7. ⚠️ **Très Important :** Ouvrez `credentials.json`, copiez l'adresse email technique indiquée à la ligne `"client_email"`, allez sur votre Google Sheet, et **partagez le document avec cette adresse email** en lui donnant les droits d'"Éditeur".

### Étape 3 : Configurer le script Python

Ouvrez `null_sync.py` avec un éditeur de texte et remplacez l'URL au début du fichier par le lien de votre propre Google Sheet :

```python
SPREADSHEET_URL = "[https://docs.google.com/spreadsheets/d/VOTRE_ID_DE_DOCUMENT/edit](https://docs.google.com/spreadsheets/d/VOTRE_ID_DE_DOCUMENT/edit)"

```

### Étape 4 : Configurer le dictionnaire des Dresseurs

Assurez-vous que le fichier `trainers.json` associe bien les ID des dresseurs affrontés en jeu au nom correspondant dans la colonne A de l'onglet **Trainer Tracking** de la Sheet.
*(Note : L'algorithme Python est doté d'une recherche approximative. Il pardonnera les petites fautes de frappe).*

```json
{
  "57": "Leader Roxanne [Boss]",
  "112": "Bug Catcher Jose"
}

```

---

## 🚀 Utilisation (Comment lancer l'outil)

Pour que les deux environnements communiquent correctement, l'ordre de chargement est important.

### 1. Du côté de mGBA (Les Scripts Lua)

Ouvrez mGBA et lancez votre partie de Pokémon.
Allez dans le menu **Tools -> Scripting**, puis **File -> Load script**.

⚠️ **L'ORDRE DE CHARGEMENT EST CRUCIAL :**

1. Chargez **d'abord** `Baat Tracking Script V1.2.3.lua`.
2. Chargez **ensuite** `Baat frag counter assistant V1.2.3.lua`.

*Explication :* L'assistant utilise des fonctions d'analyse mémoire (`readPartyMon`, les tables de noms, etc.) qui doivent d'abord être initialisées par le script principal. Une fois le second chargé, une console mGBA nommée "Frags & Live Tracker" apparaîtra pour confirmer le bon fonctionnement.

### 2. Du côté du PC (La Synchronisation Python)

Lancez l'interface graphique en double-cliquant sur le script Python ou via le terminal :

```bash
python null_sync.py

```

Une fenêtre s'ouvrira avec deux options :

* **Synchroniser Maintenant :** Lit instantanément les fichiers locaux et met à jour la Box et les KOs sur la Google Sheet. Idéal après une capture ou un combat de boss.
* **Activer Auto-Sync :** Définissez un intervalle (ex: 5 minutes) : le programme tournera silencieusement en arrière-plan pour synchroniser vos avancées sans que vous n'ayez à y penser.

---

## 💡 Sous le capot

* **Export de la Box :** Dès qu'un combat s'engage, le Lua exporte silencieusement l'état de votre équipe et de vos 14 boîtes PC dans `box_data.txt`.
* **Tracking des Frags :** Le script surveille en continu les HP de l'équipe adverse en RAM. Dès qu'un ennemi tombe à 0, le kill est attribué au Pokémon allié actif sur le terrain et consigné dans `frags_by_trainer.json`.
* **Gestion des Resets :** Si vous relancez un combat contre un dresseur précis (en chargeant une *Save State* par exemple), le script Lua effacera proprement l'historique récent de ce dresseur et des suivants pour éviter de dupliquer les scores !


# Pokémon Null - Nuzlocke Auto-Tracker & Google Sheets Sync

This repository contains a set of tools (Lua and Python) allowing you to fully automate the tracking of your runs (Nuzlocke, etc.) on **Pokémon Null** (or other ROM hacks based on the *pokeemerald-expansion* decompilation). 

The system automatically detects your party Pokémon, PC box catches, and most importantly **KOs (frags) per trainer**, syncing everything in real-time to your Google Sheet!

## 📁 Repository Contents

*   `Baat Tracking Script V1.2.3.lua`: Main script handling the GBA RAM reading (Pokémon data, parties, items, natures, etc.).
*   `Baat frag counter assistant V1.2.3.lua`: Secondary script responsible for live battle tracking, KO detection, rollback management, and data file exporting.
*   `null_sync.py`: Python application (with a GUI) acting as a bridge between the local files generated by the emulator and the Google Sheets API.
*   `trainers.json`: Configuration file linking the internal in-game trainer IDs to their exact names in your Google Sheet.

---

## 🛠️ Prerequisites

1.  **Emulator:** [mGBA version 0.10.0](https://mgba.io/) or higher (Lua scripting is not supported on older versions).
2.  **Python:** [Python 3](https://www.python.org/downloads/) installed on your machine.
3.  **Google Sheet:** A copy of the "Null" Frag Sheet (or a similar template) containing the "Pokémon" and "Trainer Tracking" tabs.

---

## ⚙️ Installation and Configuration

### Step 1: Prepare the Python environment
Open a command prompt (or terminal) and install the required dependencies for the sync script:
```bash
pip install gspread oauth2client

```

*(Note: the `tkinter` module, used for the GUI, is usually included natively with your Python installation).*

### Step 2: Google Sheets API Configuration

For the Python script to autonomously modify your spreadsheet, you need to generate secure access:

1. Go to the [Google Cloud Console](https://console.cloud.google.com/).
2. Create a new project (e.g., "Null-Tracker").
3. Go to **APIs & Services > Library** and enable the **Google Sheets API** as well as the **Google Drive API**.
4. Go to **Credentials > Create Credentials > Service account**. Fill in the basic information.
5. Click on the newly created service account, go to the **Keys** tab **> Add Key > Create new key** and choose the **JSON** format.
6. Rename the downloaded file to `credentials.json` and place it in the same folder as your scripts.
7. ⚠️ **Very Important:** Open `credentials.json`, copy the technical email address located at the `"client_email"` line, go to your Google Sheet, and **share the document with this email address**, granting it "Editor" permissions.

### Step 3: Configure the Python script

Open `null_sync.py` with a text editor and replace the URL at the top of the file with the link to your own Google Sheet:

```python
SPREADSHEET_URL = "[https://docs.google.com/spreadsheets/d/YOUR_DOCUMENT_ID/edit](https://docs.google.com/spreadsheets/d/YOUR_DOCUMENT_ID/edit)"

```

### Step 4: Configure the Trainers dictionary

Ensure that the `trainers.json` file accurately maps the IDs of the trainers fought in-game to their corresponding names in column A of the **Trainer Tracking** tab in your Sheet.
*(Note: The Python algorithm features fuzzy matching. It will forgive minor typos and automatically ignore the word "Split").*

```json
{
  "57": "Leader Roxanne [Boss]",
  "112": "Bug Catcher Jose"
}

```

---

## 🚀 Usage (How to run the tool)

To ensure the two environments communicate correctly, the load order is very important.

### 1. On the mGBA side (Lua Scripts)

Open mGBA and load your Pokémon ROM.
Go to the **Tools -> Scripting** menu, then **File -> Load script**.

⚠️ **LOAD ORDER IS CRUCIAL:**

1. Load `Baat Tracking Script V1.2.3.lua` **first**.
2. Load `Baat frag counter assistant V1.2.3.lua` **second**.

*Explanation:* The assistant uses memory analysis functions (`readPartyMon`, name tables, etc.) that must first be initialized by the main script. Once the second script is loaded, an mGBA console named "Frags & Live Tracker" will appear to confirm everything is working properly.

### 2. On the PC side (Python Synchronization)

Launch the GUI by double-clicking the Python script or running it via the terminal:

```bash
python null_sync.py

```

A window will open with two options:

* **Synchroniser Maintenant (Sync Now):** Instantly reads the local files and updates the Box and KOs on the Google Sheet. Ideal after a catch or a boss fight.
* **Activer Auto-Sync (Enable Auto-Sync):** Set an interval (e.g., 5 minutes): the program will run silently in the background to sync your progress without you having to think about it.

---

## 💡 Under the hood

* **Box Export:** As soon as a battle starts, the Lua script silently exports the state of your party and your 14 PC boxes into `box_data.txt`.
* **Frag Tracking:** The script continuously monitors the opponent's party HP in the RAM. As soon as an enemy drops to 0, the kill is credited to the active allied Pokémon on the field and recorded in `frags_by_trainer.json`.
* **Rematch Management:** If you restart a battle against a specific trainer (e.g., by loading a *Save State*), the Lua script will cleanly wipe the recent history for that trainer and any subsequent ones to prevent score duplication!


