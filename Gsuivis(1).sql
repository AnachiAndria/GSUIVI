-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 25, 2024 at 03:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Gsuivis`
--

-- --------------------------------------------------------

--
-- Table structure for table `CahierTexte`
--

CREATE TABLE `CahierTexte` (
  `IdCahier` int(11) NOT NULL,
  `idProf` int(11) NOT NULL,
  `IdParc` int(11) NOT NULL,
  `Hdebut` time NOT NULL,
  `Hfin` time NOT NULL,
  `date` date NOT NULL,
  `matiere` varchar(50) NOT NULL,
  `Information` varchar(250) NOT NULL,
  `semestre` varchar(10) NOT NULL,
  `Classe` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Chapitre`
--

CREATE TABLE `Chapitre` (
  `idChap` int(11) NOT NULL,
  `IdSyl` int(11) NOT NULL,
  `TitreChap` int(11) NOT NULL,
  `detail` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `EC`
--

CREATE TABLE `EC` (
  `idEC` int(11) NOT NULL,
  `idUE` int(11) NOT NULL,
  `idProf` int(11) NOT NULL,
  `nomEC` varchar(250) NOT NULL,
  `semestre` varchar(20) NOT NULL,
  `horaireET` int(11) NOT NULL,
  `horaireED` int(11) NOT NULL,
  `horaireEP` int(11) NOT NULL,
  `tHoraire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Mentions`
--

CREATE TABLE `Mentions` (
  `IdMentions` int(11) NOT NULL,
  `nomMentions` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Parcours`
--

CREATE TABLE `Parcours` (
  `IdParc` int(11) NOT NULL,
  `IdMentions` int(11) NOT NULL,
  `nomParcours` varchar(50) NOT NULL,
  `description` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Prof`
--

CREATE TABLE `Prof` (
  `idProf` int(11) NOT NULL,
  `nomProf` int(11) NOT NULL,
  `prenomProf` int(11) NOT NULL,
  `sexe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Progression`
--

CREATE TABLE `Progression` (
  `IdProg` int(11) NOT NULL,
  `idSyl` int(11) NOT NULL,
  `progression` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SousChap`
--

CREATE TABLE `SousChap` (
  `idSous` int(11) NOT NULL,
  `idChap` int(11) NOT NULL,
  `titreSousChap` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Syllabus`
--

CREATE TABLE `Syllabus` (
  `idSyl` int(11) NOT NULL,
  `idProf` int(11) DEFAULT NULL,
  `idEc` int(11) NOT NULL,
  `evaluation` int(11) NOT NULL,
  `objectif` varchar(250) NOT NULL,
  `ET` int(11) NOT NULL,
  `ED` int(11) NOT NULL,
  `EP` int(11) NOT NULL,
  `horaireTotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UE`
--

CREATE TABLE `UE` (
  `idUE` int(11) NOT NULL,
  `nomUE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Utilisateur`
--

CREATE TABLE `Utilisateur` (
  `idUser` int(11) NOT NULL,
  `nom` varchar(250) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `mdp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CahierTexte`
--
ALTER TABLE `CahierTexte`
  ADD PRIMARY KEY (`IdCahier`),
  ADD KEY `ProfCahierT` (`idProf`),
  ADD KEY `parcoursCahierT` (`IdParc`);

--
-- Indexes for table `Chapitre`
--
ALTER TABLE `Chapitre`
  ADD PRIMARY KEY (`idChap`),
  ADD KEY `IdSyl` (`IdSyl`);

--
-- Indexes for table `EC`
--
ALTER TABLE `EC`
  ADD PRIMARY KEY (`idEC`),
  ADD KEY `EC_UE` (`idUE`),
  ADD KEY `idProf` (`idProf`);

--
-- Indexes for table `Mentions`
--
ALTER TABLE `Mentions`
  ADD PRIMARY KEY (`IdMentions`);

--
-- Indexes for table `Parcours`
--
ALTER TABLE `Parcours`
  ADD PRIMARY KEY (`IdParc`),
  ADD KEY `ParcoursMentions` (`IdMentions`);

--
-- Indexes for table `Prof`
--
ALTER TABLE `Prof`
  ADD PRIMARY KEY (`idProf`);

--
-- Indexes for table `Progression`
--
ALTER TABLE `Progression`
  ADD PRIMARY KEY (`IdProg`),
  ADD KEY `progSyl` (`idSyl`);

--
-- Indexes for table `SousChap`
--
ALTER TABLE `SousChap`
  ADD PRIMARY KEY (`idSous`),
  ADD KEY `chapSousChap` (`idChap`);

--
-- Indexes for table `Syllabus`
--
ALTER TABLE `Syllabus`
  ADD PRIMARY KEY (`idSyl`),
  ADD KEY `syllabEC` (`idEc`);

--
-- Indexes for table `UE`
--
ALTER TABLE `UE`
  ADD PRIMARY KEY (`idUE`);

--
-- Indexes for table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `CahierTexte`
--
ALTER TABLE `CahierTexte`
  MODIFY `IdCahier` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Chapitre`
--
ALTER TABLE `Chapitre`
  MODIFY `idChap` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `EC`
--
ALTER TABLE `EC`
  MODIFY `idEC` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Mentions`
--
ALTER TABLE `Mentions`
  MODIFY `IdMentions` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Parcours`
--
ALTER TABLE `Parcours`
  MODIFY `IdParc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Prof`
--
ALTER TABLE `Prof`
  MODIFY `idProf` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Progression`
--
ALTER TABLE `Progression`
  MODIFY `IdProg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SousChap`
--
ALTER TABLE `SousChap`
  MODIFY `idSous` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Syllabus`
--
ALTER TABLE `Syllabus`
  MODIFY `idSyl` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UE`
--
ALTER TABLE `UE`
  MODIFY `idUE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CahierTexte`
--
ALTER TABLE `CahierTexte`
  ADD CONSTRAINT `parcoursCahierT` FOREIGN KEY (`IdParc`) REFERENCES `Parcours` (`IdParc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Chapitre`
--
ALTER TABLE `Chapitre`
  ADD CONSTRAINT `Chapitre_ibfk_1` FOREIGN KEY (`IdSyl`) REFERENCES `Syllabus` (`idSyl`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `EC`
--
ALTER TABLE `EC`
  ADD CONSTRAINT `EC_UE` FOREIGN KEY (`idUE`) REFERENCES `UE` (`idUE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Parcours`
--
ALTER TABLE `Parcours`
  ADD CONSTRAINT `ParcoursMentions` FOREIGN KEY (`IdMentions`) REFERENCES `Mentions` (`IdMentions`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Progression`
--
ALTER TABLE `Progression`
  ADD CONSTRAINT `progSyl` FOREIGN KEY (`idSyl`) REFERENCES `Syllabus` (`idSyl`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SousChap`
--
ALTER TABLE `SousChap`
  ADD CONSTRAINT `chapSousChap` FOREIGN KEY (`idChap`) REFERENCES `Chapitre` (`idChap`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Syllabus`
--
ALTER TABLE `Syllabus`
  ADD CONSTRAINT `syllabEC` FOREIGN KEY (`idEc`) REFERENCES `EC` (`idEC`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
