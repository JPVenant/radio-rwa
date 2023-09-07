-- phpMyAdmin SQL Dump
-- version 4.9.6
-- https://www.phpmyadmin.net/
--
-- Hôte : aj3nk.myd.infomaniak.com
-- Généré le :  lun. 15 août 2022 à 10:20
-- Version du serveur :  10.4.22-MariaDB-1:10.4.22+maria~stretch-log
-- Version de PHP :  7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `aj3nk_le_tchat`
--

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pseudo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `pseudo`) VALUES
(1, 'contact@jpvenant.fr', '$2y$10$LGArg5ZaSrbTSupvZGGNi.UkfhFhkeqScz1AdiBhAA3RKivkRmbDm', 'Jean-Philippe'),
(2, 'radio.rwa@gmail.com', '$2y$10$hh3DHwwGCWCw.8JsfHfplu0qJunXHgN8tLV7letatRtFMeXS0DLaa', 'steff'),
(3, 'snycks@msn.com', '$2y$10$IuRFpQ1u2jfTlo4Hv044DuYoGJnchZTjSDXn3JW7NmOOQLGtjnAbG', 'Niko'),
(5, 'roger-t@hotmail.fr', '$2y$10$CNG77tqh2c6Po2o6T.BfZ.Wdp3eKf86TgRwWs1EGyC7BtRDHROBMi', 'Dj Dja'),
(6, 'henry.steff33@gmail.com', '$2y$10$hwqvC1Q.1CTvyxg10F9tie.s8V8Mqw6HAkO3rSoX41DXu1S2E60km', 'steff RWA'),
(7, 'mel33_ange@hotmail.com', '$2y$10$NTz9lfeb9O6Y.GM22hdooe9DN7f91moyDCrWf8KD2SXIw6tFs7Us2', 'Melnarnia'),
(8, 'x_romainejoe33_x@hotmail.fr', '$2y$10$34roT8LXMII6CXEhC8IVd.ZKL7C6czleDTmUKr2zd0SrErufr/7qi', 'Jo'),
(10, 'tootsie33@free.fr', '$2y$10$O3O6jFGv9Ohw/yHjXJ1t7OgAF.1WsI7RskCmSu/Vz8hDoVP2.IleS', 'Fred'),
(14, 'audreylacoste00@gmail.com', '$2y$10$4DCKykY1zSpUaWxGRwXxDehyXHH5D2PM81JNwhgEaNLDN/ygrj1XO', 'didouaudrey'),
(15, 'contact.leroidelafete@gmail.com', '$2y$10$uPzMdGn95FvUdwvql89s7ebpVWwsFRChKdUYCORIub3FnVfYV8JMK', 'raphy'),
(16, 'jpvenant78@gmail.com', '$2y$10$BZJnUA6OkuYgSekpJ/Mikuchs8SSBGXp8D/gV1CQ902MpbTv5BHka', 'Valérie'),
(17, 'virginiezanabos@gmail.com', '$2y$10$bC0DBTFQJ5ZeIOTowLWt8O27cbvL0AwZaBPC7hFnfl4oVx4txgdLS', 'Moï'),
(18, 'aurelie-moinard@hotmail.fr', '$2y$10$VWLbqUpC6qp9na8LLP72reEdu1JwtWZr.7sytlVSfLvvnaawKjjQK', 'La caissière préféré'),
(19, 'jaylie@live.fr', '$2y$10$A0Z5ZQQyRyhkRRcwmd1FPe8xORfAzuV1wKPVoIhY5M0CpT.0K4lFO', 'Alexandra ');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=617;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
