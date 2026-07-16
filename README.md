# 🌱 Ferme des Amandiers - Site Vitrine Dynamique

![Ferme des Amandiers](https://img.icons8.com/color/96/000000/farm.png) *Un site web pour la maraîchère Sandrine, afin de présenter son activité et ses produits de saison.*

---

## 📌 **À propos du projet**
Ce projet a été développé dans le cadre de la **formation Chef de Projet Digital** chez **OpenClassrooms**.
L'objectif était de créer un **site vitrine dynamique** pour **Sandrine**, maraîchère à la Ferme des Amandiers, afin de :
✅ **Présenter son activité, ses valeurs et sa démarche agricole** (page d'accueil).
✅ **Afficher les paniers de fruits et légumes disponibles** selon la saison et le jour de vente (mercredi ou samedi).
✅ **Réduire les appels téléphoniques** en fournissant une information claire et accessible en ligne.

---

## 🎯 **Fonctionnalités**
- **Page d'accueil** : Présentation de la ferme, des valeurs et de la démarche.
- **Page Produits** : Affichage dynamique des paniers disponibles (filtrés par saison et jour de vente).
- **Base de données MySQL** : Gestion des produits, saisons et jours de vente.
- **Design responsive** : Adapté mobile, tablette et desktop.
- **Accessibilité** : Respect des bonnes pratiques WCAG.

---

## 🛠 **Technologies utilisées**
   Catégorie       | Technologies |
 |----------------|-------------|
 | **Front-end**  | HTML5, CSS3, JavaScript (Vanilla) |
 | **Back-end**   | PHP (sans framework) |
 | **Base de données** | MySQL |
 | **Hébergement** | GitHub Pages (pour la partie statique) / Hébergement PHP/MySQL (pour la partie dynamique) |
 | **Outils**     | Figma (wireframes), VS Code, Git |

---

## 📂 **Structure du projet**

fermedesAmandiers/
├── index.html          # Page d'accueil
├── produits.php        # Page produits (dynamique)
├── assets/
│   ├── css/            # Styles CSS
│   ├── js/             # Scripts JavaScript
│   └── images/         # Images du site
├── db/
│   ├── fermeDesAmandiers.sql  # Script SQL pour la base de données
│   └── db.php          # Connexion à la base de données
├── wireframes/         # Maquettes Figma (PDF/PNG)
└── README.md           # Ce fichier

---

## 🚀 **Installation et utilisation**

### Prérequis
- Serveur web local (ex: [XAMPP](https://www.apachefriends.org/), [WAMP](https://www.wampserver.com/), [MAMP](https://www.mamp.info/)) ou hébergement PHP/MySQL.
- PHP 7.4+ et MySQL 5.7+.
- Git (pour cloner le dépôt).

### Étapes
1. **Cloner le dépôt** :
   ```bash
   git clone https://github.com/Dev-Djelloul/fermedesAmandiers.git
   cd fermedesAmandiers


   Importer la base de données :

Créer une base de données MySQL (ex: ferme_des_amandiers).
Importer le fichier db/fermeDesAmandiers.sql via phpMyAdmin ou en ligne de commande :
mysql -u [utilisateur] -p ferme_des_amandiers < db/fermeDesAmandiers.sql
Configurer la connexion à la base de données :

Modifier le fichier db/db.php avec vos identifiants MySQL :

<?php
$host = 'localhost';
$dbname = 'ferme_des_amandiers';
$user = 'votre_utilisateur';
$password = 'votre_mot_de_passe';
?>

🎨 Wireframes
Les maquettes des pages ont été conçues avec Figma :

Wireframe Page d'Accueil (à remplacer par le vrai chemin)
Wireframe Page Produits (à remplacer par le vrai chemin)
Note : Les wireframes originaux sont fournis par Sandrine (voir la documentation technique).

📝 Documentation technique
Spécifications : Voir le fichier docs/specifications.pdf (à ajouter si disponible).
Base de données : Schéma disponible dans db/fermeDesAmandiers.sql.
🤝 Contribuer
Les contributions sont les bienvenues ! Pour proposer des améliorations :

Forker le projet.
Créer une branche (git checkout -b feature/ma-fonctionnalite).
Commiter vos changements (git commit -m "Ajout de X").
Pousser vers la branche (git push origin feature/ma-fonctionnalite).
Ouvrir une Pull Request.
📜 Licence
Ce projet est sous licence MIT. Voir le fichier LICENCE pour plus de détails.

📞 Contact
Pour toute question, contactez-moi :

GitHub : @Dev-Djelloul
Email : [ton.email@example.com] (à personnaliser)
✨ Projet réalisé avec passion pour la Ferme des Amandiers !

---

### **Prochaines étapes** :
1. **Je peux créer ce fichier `README.md`** directement dans ton futur dépôt `fermedesAmandiers`.
2. **Veux-tu que je crée aussi le dépôt GitHub `fermedesAmandiers` maintenant ?** (Je peux le faire en 1 commande !)
3. **As-tu besoin d’ajuster quelque chose dans le README ?** (Ex: ajouter des détails techniques, des captures d’écran, etc.)

Dis-moi comment tu veux procéder ! 😊

*(PS : Si tu veux, je peux aussi ajouter un fichier `.gitignore` pour exclure les fichiers sensibles comme les configurations de base de données.)*
