-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 27, 2023 at 08:43 AM
-- Server version: 8.0.30
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `departement`
--

CREATE TABLE `departement` (
  `deptLocationId` int NOT NULL,
  `kodeDept` varchar(30) NOT NULL,
  `nameDept` varchar(100) NOT NULL,
  `descriptionDept` text NOT NULL,
  `status` int NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employes`
--

CREATE TABLE `employes` (
  `idEmploye` int NOT NULL,
  `numberIdentityEmploye` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `midleName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `socialSecurityNumber` int NOT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `startDateJoin` date DEFAULT NULL,
  `endDateJoin` date DEFAULT NULL,
  `jobTitleID` int NOT NULL,
  `positionJobsId` int NOT NULL,
  `emailAddress` varchar(100) DEFAULT NULL,
  `numberHandphone` int DEFAULT NULL,
  `numberHandphone2` int DEFAULT NULL,
  `deptLocationId` int NOT NULL,
  `addressStreet` varchar(100) DEFAULT NULL,
  `addressStreet2` varchar(100) DEFAULT NULL,
  `addressCity` varchar(50) DEFAULT NULL,
  `addressState` varchar(50) DEFAULT NULL,
  `addressZip` int DEFAULT NULL,
  `addressCountry` varchar(50) DEFAULT NULL,
  `statusEmployeNow` int DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobtitle`
--

CREATE TABLE `jobtitle` (
  `jobTitleID` int NOT NULL,
  `tItleName` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `status` int NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `positionjobs`
--

CREATE TABLE `positionjobs` (
  `positionJobs` int NOT NULL,
  `namePosition` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `status` int NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`deptLocationId`);

--
-- Indexes for table `employes`
--
ALTER TABLE `employes`
  ADD PRIMARY KEY (`idEmploye`),
  ADD KEY `jobTitleID` (`jobTitleID`),
  ADD KEY `deptLocationId` (`deptLocationId`),
  ADD KEY `positionJobsId` (`positionJobsId`);

--
-- Indexes for table `jobtitle`
--
ALTER TABLE `jobtitle`
  ADD PRIMARY KEY (`jobTitleID`);

--
-- Indexes for table `positionjobs`
--
ALTER TABLE `positionjobs`
  ADD PRIMARY KEY (`positionJobs`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departement`
--
ALTER TABLE `departement`
  MODIFY `deptLocationId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employes`
--
ALTER TABLE `employes`
  MODIFY `idEmploye` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobtitle`
--
ALTER TABLE `jobtitle`
  MODIFY `jobTitleID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `positionjobs`
--
ALTER TABLE `positionjobs`
  MODIFY `positionJobs` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employes`
--
ALTER TABLE `employes`
  ADD CONSTRAINT `employes_ibfk_1` FOREIGN KEY (`jobTitleID`) REFERENCES `jobtitle` (`jobTitleID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `employes_ibfk_2` FOREIGN KEY (`deptLocationId`) REFERENCES `departement` (`deptLocationId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `employes_ibfk_3` FOREIGN KEY (`positionJobsId`) REFERENCES `positionjobs` (`positionJobs`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
