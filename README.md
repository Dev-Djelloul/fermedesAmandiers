# README – Projet "Ferme des Amandiers"

Ce dépôt contient le code source du projet vitrine de la Ferme des Amandiers.
L'objectif est de présenter la ferme et ses produits de saison disponibles à la vente, avec un affichage dynamique selon le jour.

---

## Fichiers principaux

### Pages principales

* `index.php` : page d’accueil. Elle contient les sections principales du site (présentation, à propos, fonctionnement). À compléter avec du HTML et CSS.
* `produits.php` : page qui affiche dynamiquement les produits depuis la base de données. Elle contient la requête SQL et le rendu HTML. Le filtrage par jour est à implémenter en JavaScript.

### Fichiers réutilisables

* `partials/header.php` : en-tête du site contenant le logo et la navigation.
* `partials/footer.php` : pied de page avec les coordonnées de la ferme.

### Connexion à la base

* `data/db.php` : fichier de connexion à la base de données via PDO. À vérifier selon la configuration locale (localhost, XAMPP).

### Styles et ressources

* `assets/css/style.css` : fichier CSS de base avec reset, variables de couleurs, typographies Google Fonts et styles de composants.
* `assets/images/produits/` : dossier d’images. Chaque image est nommée en snake\_case selon le produit (ex : `carottes_jaunes.png`).

### Données

* `fermedesamandiers.sql` : script SQL permettant de créer et peupler les tables nécessaires (`produits`, `saisons`, `jours`, `produit_jour`).

---

## Arborescence simplifiée

```
ferme-des-amandiers/
├── index.php
├── produits.php
├── partials/
│   ├── header.php
│   └── footer.php
├── data/
│   └── db.php
├── assets/
│   ├── css/style.css
│   └── images/produits/
├── wireframe/
│   ├── index.html
│   └── produits.html
└── fermedesamandiers.sql
```
