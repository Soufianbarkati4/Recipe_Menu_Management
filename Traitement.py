import json
import xml.etree.ElementTree as ET

# Charger et analyser le fichier XML
tree = ET.parse('recette.xml')
root = tree.getroot()

# Initialiser le dictionnaire de sortie
sortie = {
    "Recettes": [],
    "Menus": [],
    "Commandes": [],
    "Clients": [],
    "Livreurs": [],
    "Commentaires": []
}

# Extraire et traiter les données de chaque section du XML
for recette in root.findall('Recette'):
    sortie["Recettes"].append({
        "ID_Recette": recette.find('ID_Recette').text,
        "Nom": recette.find('Nom').text,
        "Description": recette.find('Description').text,
        "Type": recette.find('Type').text,
        "Ingredients": [{"Nom": ing.find('Nom').text, "Quantite": ing.find('Quantite').text, "Unite": ing.find('Unite').text} for ing in recette.findall('Ingredients')]
    })

for menu in root.findall('Menu'):
    sortie["Menus"].append({
        "ID_Menu": menu.find('ID_Menu').text,
        "Nom": menu.find('Nom').text,
        "Prix": menu.find('Prix').text,
        "Recettes": [recette.find('ID_Recette').text for recette in menu.findall('Recettes')]
    })

for commande in root.findall('Commande'):
    sortie["Commandes"].append({
        "ID_Commande": commande.find('ID_Commande').text,
        "Total": commande.find('Total').text,
        "Mode_paiement": commande.find('Mode_paiement').text,
        "ID_Client": commande.find('ID_Client').text,
        "ID_Livreur": commande.find('ID_Livreur').text,
        "Menus": [menu.find('ID_Menu').text for menu in commande.findall('Menus')]
    })

for client in root.findall('Client'):
    sortie["Clients"].append({
        "ID_Client": client.find('ID_Client').text,
        "Nom": client.find('Nom').text,
        "Prenom": client.find('Prenom').text,
        "Adresse": client.find('Adresse').text,
        "Telephone": client.find('Telephone').text
    })

for livreur in root.findall('Livreur'):
    sortie["Livreurs"].append({
        "ID_Livreur": livreur.find('ID_Livreur').text,
        "Prenom": livreur.find('Prenom').text
    })

for commentaire in root.findall('Commentaire'):
    sortie["Commentaires"].append({
        "ID_Commentaire": commentaire.find('ID_Commentaire').text,
        "Texte": commentaire.find('Texte').text,
        "Note": commentaire.find('Note').text,
        "ID_Client": commentaire.find('ID_Client').text,
        "ID_Recette": commentaire.find('ID_Recette').text
    })

# Écrire le résultat dans un fichier JSON
with open('output.json', 'w') as output_file:
    json.dump(sortie, output_file, indent=2, ensure_ascii=False)
