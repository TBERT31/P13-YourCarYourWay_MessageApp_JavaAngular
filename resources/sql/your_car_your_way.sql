-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 16 août 2024 à 16:15
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
  `city` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
  `direct` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `discussions`
--

INSERT INTO `discussions` (`id`, `title`, `status_name`, `direct`, `created_at`, `updated_at`) VALUES
(1, 'Error with my reservation', 'New', 1, '2024-07-31 15:17:20', '2024-08-03 19:02:07'),
(2, 'Need to postpone my reservation', 'In Progress', 1, '2024-07-31 15:19:08', '2024-08-02 17:37:45'),
(3, 'Can I upgrade my Car for August Holidays ?', 'Closed', 1, '2024-08-02 17:25:19', '2024-08-02 17:37:44'),
(4, 'I need to cancel my reservation for tomorrow, can I be reimburse ?', 'New', 1, '2024-08-02 17:53:18', '2024-08-03 11:45:50');

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
(2, 4),
(3, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE `locations` (
  `id` int NOT NULL,
  `vehicle_id` int NOT NULL,
  `agency_id` int NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 4, 1, '2024-07-31 15:37:08', '2024-07-31 15:37:08'),
(2, 'Hello John effectively! \nPrimis litora dapibus senectus fermentum tortor ad; nisi sed. Quis magnis molestie scelerisque eu sit nec vulputate duis condimentum. Praesent quis commodo quisque class sociosqu suspendisse.', 1, 1, 1, '2024-08-03 12:24:01', '2024-08-03 12:24:01'),
(3, 'Nibh laoreet a commodo venenatis diam et litora. Elit convallis platea nisl quis convallis lacus ornare lobortis maximus. Cras eu torquent libero tempus curae. Tellus erat massa tortor risus erat curabitur.', 1, 1, 1, '2024-08-03 12:24:29', '2024-08-03 12:24:29'),
(4, 'Ok ok I understand...\nMaximus velit tempor conubia vel etiam pellentesque libero. Quis cras consequat libero per adipiscing eu. Per fames ipsum dapibus aliquam neque. Dictumst vehicula nunc sagittis sapien; ac odio litora. Nullam fringilla pulvinar ante habitant odio maximus vivamus.', 1, 4, 1, '2024-08-03 12:26:10', '2024-08-03 12:26:10'),
(5, 'Leo placerat blandit eros proin commodo diam. Lacinia per curae nibh conubia habitant quisque vivamus luctus. Fermentum tellus ad pellentesque posuere luctus netus est. Tortor orci rhoncus natoque ultrices nulla nunc volutpat fermentum suspendisse. Cursus potenti adipiscing justo rhoncus proin euismod maecenas. Rutrum eget amet turpis eleifend praesent, nisi urna montes. Duis proin euismod risus primis odio.', 1, 4, 1, '2024-08-03 12:26:27', '2024-08-03 12:26:27'),
(6, 'Leo placerat blandit eros proin commodo diam. Lacinia per curae nibh conubia habitant quisque vivamus luctus. Fermentum tellus ad pellentesque posuere luctus netus est. Tortor orci rhoncus natoque ultrices nulla nunc volutpat fermentum suspendisse. Cursus potenti adipiscing justo rhoncus proin euismod maecenas. Rutrum eget amet turpis eleifend praesent, nisi urna montes. Duis proin euismod risus primis odio.', 1, 4, 1, '2024-08-03 12:26:31', '2024-08-03 12:26:31'),
(7, 'Hello, I\'m Kaya from the support department too, and I\'m repeating what Thomas said:\nQuisque elit vestibulum velit himenaeos ipsum ridiculus tempus felis ridiculus. Conubia sagittis cubilia nam consectetur tortor est finibus. Imperdiet risus rutrum vitae torquent venenatis nibh placerat. Ullamcorper augue lobortis mus orci lacinia blandit consectetur faucibus pretium. Diam himenaeos litora ullamcorper eros egestas nibh. Cubilia facilisi felis; quisque id viverra cras. Libero tempus fusce semper magnis justo posuere quisque. Etiam habitant nibh velit fermentum maximus fusce adipiscing felis. Blandit class lectus pulvinar non; dis ad.', 1, 3, 1, '2024-08-03 12:27:51', '2024-08-03 12:27:51'),
(8, 'Lorem ipsum odor amet, consectetuer adipiscing elit. Tincidunt fusce tempor aptent duis convallis montes nascetur. Cursus duis sit ipsum fames; adipiscing habitant netus? ', 1, 3, 1, '2024-08-03 12:28:58', '2024-08-03 12:28:58'),
(9, 'Hello, I\'m Kaya from the support department too, and I\'m repeating what Thomas said: Quisque elit vestibulum velit himenaeos ipsum ridiculus tempus felis ridiculus. Conubia sagittis cubilia nam consectetur tortor est finibus. Imperdiet risus rutrum vitae torquent venenatis nibh placerat. Ullamcorper augue lobortis mus orci lacinia blandit consectetur faucibus pretium. Diam himenaeos litora ullamcorper eros egestas nibh. Cubilia facilisi felis; quisque id viverra cras. Libero tempus fusce semper magnis justo posuere quisque. Etiam habitant nibh velit fermentum maximus fusce adipiscing felis. Blandit class lectus pulvinar non; dis ad.Hello, I\'m Kaya from the support department too, and I\'m repeating what Thomas said: Quisque elit vestibulum velit himenaeos ipsum ridiculus tempus felis ridiculus. Conubia sagittis cubilia nam consectetur tortor est finibus. Imperdiet risus rutrum vitae torquent venenatis nibh placerat. Ullamcorper augue lobortis mus orci lacinia blandit consectetur faucibus pretium. Diam himenaeos litora ullamcorper eros egestas nibh. Cubilia facilisi felis; quisque id viverra cras. Libero tempus fusce semper magnis justo posuere quisque. Etiam habitant nibh velit fermentum maximus fusce adipiscing felis. Blandit class lectus pulvinar non; dis ad.Hello, I\'m Kaya from the support department too, and I\'m repeating what Thomas said: Quisque elit vestibulum velit himenaeos ipsum ridiculus tempus felis ridiculus. Conubia sagittis cubilia nam consectetur tortor est finibus. Imperdiet risus rutrum vitae torquent venenatis nibh placerat. Ullamcorper augue lobortis mus orci lacinia blandit consectetur faucibus pretium. Diam himenaeos litora ullamcorper eros egestas nibh. Cubilia facilisi felis; quisque id viverra cras. Libero tempus fusce semper magnis justo posuere quisque. Etiam habitant nibh velit fermentum maximus fusce adipiscing felis. Blandit class lectus pulvinar non; dis ad.', 1, 3, 1, '2024-08-03 18:21:51', '2024-08-03 18:21:51'),
(10, 'Hello world', 1, 1, 1, '2024-08-06 11:27:44', '2024-08-06 11:27:44');

-- --------------------------------------------------------

--
-- Structure de la table `offers`
--

CREATE TABLE `offers` (
  `id` int NOT NULL,
  `departure_agency` int NOT NULL,
  `return_agency` int NOT NULL,
  `vehicle_id` int NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `method_type` enum('card','paypal','bank transfer','') COLLATE utf8mb4_general_ci NOT NULL,
  `details` json NOT NULL,
  `is_default` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `offer_id` int NOT NULL,
  `status` enum('booked','cancelled','completed') COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  `price` decimal(10,2) NOT NULL
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
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` int NOT NULL,
  `status` enum('pending','completed','failed','') COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'thomas.berteau@test.com', '$2a$10$jMDf1OsiCVeyMf6PEywhu.kE/4cZhwGRJW891byr.Y/B0PI5xEAOW', 'thomas', 'berteau', '1995-07-16', '2 rue du Stade, Cuxac d\'Aude 11590', b'1', '2024-07-31 15:05:53', '2024-07-31 15:05:53'),
(2, 'lea.minniti@test.com', '$2a$10$jMDf1OsiCVeyMf6PEywhu.kE/4cZhwGRJW891byr.Y/B0PI5xEAOW', 'lea', 'minniti', '1997-06-12', '2 rue du Stade, Cuxac d\'Aude 11590', b'1', '2024-07-31 15:05:53', '2024-07-31 15:05:53'),
(3, 'kaya.kai@test.com', '$2a$10$jMDf1OsiCVeyMf6PEywhu.kE/4cZhwGRJW891byr.Y/B0PI5xEAOW', 'kaya', 'kai', '2016-06-27', '2 rue du Stade, Cuxac d\'Aude 11590', b'1', '2024-07-31 15:05:53', '2024-07-31 15:05:53'),
(4, 'john.doe@test.com', '$2a$10$jMDf1OsiCVeyMf6PEywhu.kE/4cZhwGRJW891byr.Y/B0PI5xEAOW', 'john', 'doe', '2014-01-01', '10 rue de l\'invention, Paris 70123', b'0', '2024-07-31 15:05:53', '2024-07-31 15:05:53'),
(5, 'jane.doe@test.com', '$2a$10$jMDf1OsiCVeyMf6PEywhu.kE/4cZhwGRJW891byr.Y/B0PI5xEAOW', 'Jane', 'Doe', '1990-01-01', '56 rue Ernest Renan, Île-de-France 94600', b'0', '2024-07-31 19:07:59', '2024-07-31 19:07:59');

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int NOT NULL,
  `registration` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('available','in_service','rented') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
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
-- Index pour la table `locations`
--
ALTER TABLE `locations`
  ADD KEY `fk_locations_vehicle_id` (`vehicle_id`),
  ADD KEY `fk_locations_agency_id` (`agency_id`);

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
  ADD KEY `fk_offers_departure_agency_id` (`departure_agency`),
  ADD KEY `fk_offers_return_agency_id` (`return_agency`),
  ADD KEY `fk_offers_vehicle_id` (`vehicle_id`);

--
-- Index pour la table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_paument_methods_user_id` (`user_id`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reservations_user_id` (`user_id`),
  ADD KEY `fk_reservations_offer_id` (`offer_id`);

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
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_transactions_user_id` (`user_id`),
  ADD KEY `fk_transactions_payment_method` (`payment_method`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `registration` (`registration`),
  ADD KEY `fk_vehicles_category_code` (`category`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

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
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `fk_locations_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_locations_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_offers_departure_agency_id` FOREIGN KEY (`departure_agency`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_offers_return_agency_id` FOREIGN KEY (`return_agency`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_offers_vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD CONSTRAINT `fk_paument_methods_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `fk_reservations_offer_id` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reservations_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_reviews_agency_id` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_reviews_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Contraintes pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_transactions_payment_method` FOREIGN KEY (`payment_method`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transactions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `fk_vehicles_category_code` FOREIGN KEY (`category`) REFERENCES `categories` (`code`) ON DELETE CASCADE ON UPDATE CASCADE;

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
