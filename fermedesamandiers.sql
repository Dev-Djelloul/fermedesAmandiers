-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 06 mai 2025 à 21:56
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `fermedesamandiers`
--

-- --------------------------------------------------------

--
-- Structure de la table `jours`
--

CREATE TABLE `jours` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `jours`
--

INSERT INTO `jours` (`id`, `nom`) VALUES
(1, 'mercredi'),
(2, 'samedi');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `saison_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `description`, `image_url`, `saison_id`) VALUES
(1, 'Tomates anciennes', 'Tomates rouges et jaunes, cultivées en plein champ', 'assets/img/produits/tomates_anciennes.jpg', 2),
(2, 'Carottes nouvelles', 'Carottes croquantes de printemps', 'assets/img/produits/carottes_nouvelles.jpg', 1),
(3, 'Salades variées', 'Mesclun, laitue, batavia', 'assets/img/produits/salades_variees.jpg', 2),
(4, 'Courgettes', 'Courgettes vertes et jaunes de saison', 'assets/img/produits/courgettes.jpg', 2),
(5, 'Aubergines', 'Aubergines violettes, parfaites pour la ratatouille', 'assets/img/produits/aubergines.jpg', 2),
(6, 'Pommes de terre', 'Pommes de terre à chair ferme', 'assets/img/produits/pommes_de_terre.jpg', 3),
(7, 'Oignons', 'Oignons jaunes et rouges', 'assets/img/produits/oignons.jpg', 3),
(8, 'Épinards', 'Feuilles vertes riches en fer', 'assets/img/produits/epinards.jpg', 1),
(9, 'Poireaux', 'Poireaux pour potage ou cuisson vapeur', 'assets/img/produits/poireaux.jpg', 4),
(10, 'Basilic', 'Feuilles fraîches pour assaisonner vos plats', 'assets/img/produits/basilic.jpg', 2),
(11, 'Persil', 'Herbe aromatique incontournable', 'assets/img/produits/persil.jpg', 1),
(12, 'Radis', 'Radis croquants de printemps', 'assets/img/produits/radis.jpg', 1),
(13, 'Choux de Bruxelles', 'Petits choux verts à cuire vapeur ou à rôtir', 'assets/img/produits/choux_de_bruxelles.jpg', 4),
(14, 'Topinambours', 'Légume racine au goût d’artichaut, parfait en purée', 'assets/img/produits/topinambours.jpg', 4),
(15, 'Panais', 'Racine blanche au goût légèrement sucré', 'assets/img/produits/panais.jpg', 4),
(16, 'Chou vert frisé', 'Parfait pour les soupes, farcis ou plats mijotés', 'assets/img/produits/chou_vert_frise.jpg', 4),
(17, 'Navets', 'Légume ancien à consommer en soupe ou en poêlée', 'assets/img/produits/navets.jpg', 4);

-- --------------------------------------------------------

--
-- Structure de la table `produit_jour`
--

CREATE TABLE `produit_jour` (
  `produit_id` int(11) NOT NULL,
  `jour_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produit_jour`
--

INSERT INTO `produit_jour` (`produit_id`, `jour_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2),
(4, 2),
(5, 1),
(6, 1),
(6, 2),
(7, 2),
(8, 1),
(9, 1),
(9, 2),
(10, 2),
(11, 1),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 2),
(15, 1),
(16, 1),
(16, 2),
(17, 2);

-- --------------------------------------------------------

--
-- Structure de la table `saisons`
--

CREATE TABLE `saisons` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `saisons`
--

INSERT INTO `saisons` (`id`, `nom`) VALUES
(1, 'Printemps'),
(2, 'Été'),
(3, 'Automne'),
(4, 'Hiver');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `jours`
--
ALTER TABLE `jours`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saison_id` (`saison_id`);

--
-- Index pour la table `produit_jour`
--
ALTER TABLE `produit_jour`
  ADD PRIMARY KEY (`produit_id`,`jour_id`),
  ADD KEY `jour_id` (`jour_id`);

--
-- Index pour la table `saisons`
--
ALTER TABLE `saisons`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `jours`
--
ALTER TABLE `jours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `saisons`
--
ALTER TABLE `saisons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`saison_id`) REFERENCES `saisons` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `produit_jour`
--
ALTER TABLE `produit_jour`
  ADD CONSTRAINT `produit_jour_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produit_jour_ibfk_2` FOREIGN KEY (`jour_id`) REFERENCES `jours` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
