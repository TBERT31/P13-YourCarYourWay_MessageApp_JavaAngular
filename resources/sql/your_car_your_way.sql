-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 31 juil. 2024 à 18:03
-- Version du serveur : 8.0.36
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `your_car_your_way`
--

-- --------------------------------------------------------

--
-- Structure de la table `agencies`
--

CREATE TABLE `agencies` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `code` varchar(1) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`code`, `description`) VALUES
('C', 'Compact'),
('D', 'Compact Elite'),
('E', 'Economy'),
('F', 'Fullsize'),
('G', 'Fullsize Elite'),
('H', 'Economy Elite'),
('I', 'Intermediate'),
('J', 'Intermediate Elite'),
('M', 'Mini'),
('N', 'Mini Elite'),
('O', 'Oversize'),
('P', 'Premium'),
('R', 'Standard Elite'),
('S', 'Standard'),
('U', 'Premium Elite'),
('W', 'Luxury Elite'),
('X', 'Special');

-- --------------------------------------------------------

--
-- Structure de la table `discussions`
--

CREATE TABLE `discussions` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `discussions`
--

INSERT INTO `discussions` (`id`, `title`, `status_name`, `created_at`, `updated_at`) VALUES
(1, 'Error with my reservation', 'New', '2024-07-31 15:17:20', '2024-07-31 15:29:57'),
(2, 'Need to postpone my reservation', 'New', '2024-07-31 15:19:08', '2024-07-31 15:19:08');

-- --------------------------------------------------------

--
-- Structure de la table `discussion_participants`
--

CREATE TABLE `discussion_participants` (
  `discussion_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `discussion_participants`
--

INSERT INTO `discussion_participants` (`discussion_id`, `user_id`) VALUES
(1, 4),
(2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `discussion` int NOT NULL,
  `author` int NOT NULL,
  `direct` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `content`, `discussion`, `author`, `direct`, `created_at`, `updated_at`) VALUES
(1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 4, 1, '2024-07-31 15:37:08', '2024-07-31 15:37:08');

-- --------------------------------------------------------

--
-- Structure de la table `offers`
--

CREATE TABLE `offers` (
  `id` int NOT NULL,
  `departure_agency_id` int NOT NULL,
  `return_agency_id` int NOT NULL,
  `departure_date` timestamp NOT NULL,
  `return_date` timestamp NOT NULL,
  `vehicle_category` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `price` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `rate` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `agency_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

CREATE TABLE `status` (
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `status`
--

INSERT INTO `status` (`name`) VALUES
('Closed'),
('In Progress'),
('New');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `admin` bit(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `firstname`, `lastname`, `birth_date`, `address`, `admin`, `created_at`, `updated_at`) VALUES
(1, 'thomas.berteau@test.com', 'Test!1234', 'thomas', 'berteau', '1995-07-16', '2 rue du Stade, Cuxac d\'Aude 11590', b'1', '2024-07-31 15:05:53', '2024-07-31 15:05:53'),
(2, 'lea.minniti@test.com', 'Test!1234', 'lea', 'minniti', '1997-06-12', '2 rue du Stade, Cuxac d\'Aude 11590', b'1', '2024-07-31 15:05:53', '2024-07-31 15:05:53'),
(3, 'kaya.kai@test.com', 'Test!1234', 'kaya', 'kai', '2016-06-27', '2 rue du Stade, Cuxac d\'Aude 11590', b'1', '2024-07-31 15:05:53', '2024-07-31 15:05:53'),
(4, 'john.doe@test.com', 'Test!1234', 'john', 'doe', '2014-01-01', '10 rue de l\'invention, Paris 70123', b'0', '2024-07-31 15:05:53', '2024-07-31 15:05:53');

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `registration` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `storage agency` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `video_participants`
--

CREATE TABLE `video_participants` (
  `video_slot_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `video_slots`
--

CREATE TABLE `video_slots` (
  `id` int NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`code`);

--
-- Index pour la table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_status_name` (`status_name`);

--
-- Index pour la table `discussion_participants`
--
ALTER TABLE `discussion_participants`
  ADD UNIQUE KEY `discussion_id` (`discussion_id`,`user_id`),
  ADD KEY `fk_participants_user_id` (`user_id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_messages_author` (`author`),
  ADD KEY `fk_messages_discussion` (`discussion`);

--
-- Index pour la table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_offers_return_agency_id` (`return_agency_id`),
  ADD KEY `fk_offers_departure_agency_id` (`departure_agency_id`),
  ADD KEY `fk_offers_category_vehicle` (`vehicle_category`);

--
-- Index pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reviews_user_id` (`user_id`),
  ADD KEY `fk_reviews_agency_id` (`agency_id`);

--
-- Index pour la table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`registration`),
  ADD KEY `fk_vehicles_agency_id` (`storage agency`),
  ADD KEY `fk_vehicle_category` (`category`);

--
-- Index pour la table `video_participants`
--
ALTER TABLE `video_participants`
  ADD UNIQUE KEY `video_slot_id` (`video_slot_id`,`user_id`),
  ADD KEY `fk_video_participants_user_id` (`user_id`);

--
-- Index pour la table `video_slots`
--
ALTER TABLE `video_slots`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agencies`
--
ALTER TABLE `agencies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `video_slots`
--
ALTER TABLE `video_slots`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `fk_status_name` FOREIGN KEY (`status_name`) REFERENCES `status` (`name`);

--
-- Contraintes pour la table `discussion_participants`
--
ALTER TABLE `discussion_participants`
  ADD CONSTRAINT `fk_participants_discussion_id` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_participants_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_messages_author` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_messages_discussion` FOREIGN KEY (`discussion`) REFERENCES `discussions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `fk_offers_category_vehicle` FOREIGN KEY (`vehicle_category`) REFERENCES `categories` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_offers_departure_agency_id` FOREIGN KEY (`departure_agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_offers_return_agency_id` FOREIGN KEY (`return_agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_reviews_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_reviews_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Contraintes pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `fk_vehicle_category` FOREIGN KEY (`category`) REFERENCES `categories` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vehicles_agency_id` FOREIGN KEY (`storage agency`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `video_participants`
--
ALTER TABLE `video_participants`
  ADD CONSTRAINT `fk_video_participants_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_video_participants_video_slot_id` FOREIGN KEY (`video_slot_id`) REFERENCES `video_slots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
