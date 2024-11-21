-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 21, 2024 at 03:12 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abc_company`
--

-- --------------------------------------------------------

--
-- Table structure for table `table_01`
--

DROP TABLE IF EXISTS `table_01`;
CREATE TABLE IF NOT EXISTS `table_01` (
  `PO_No` int NOT NULL,
  `PO_Date` date NOT NULL,
  `Emp_Code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Supp_No` int NOT NULL,
  PRIMARY KEY (`PO_No`),
  KEY `Supp_No` (`Supp_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_02`
--

DROP TABLE IF EXISTS `table_02`;
CREATE TABLE IF NOT EXISTS `table_02` (
  `Supp_No` int NOT NULL,
  `Supp_Name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Supp_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_03`
--

DROP TABLE IF EXISTS `table_03`;
CREATE TABLE IF NOT EXISTS `table_03` (
  `Part_No` int NOT NULL,
  `Part_descp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Part_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_04`
--

DROP TABLE IF EXISTS `table_04`;
CREATE TABLE IF NOT EXISTS `table_04` (
  `PO_No` int NOT NULL,
  `Part_No` int NOT NULL,
  `Part_Qty` int NOT NULL,
  PRIMARY KEY (`PO_No`,`Part_No`),
  KEY `PO_No` (`PO_No`),
  KEY `Part_No` (`Part_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `table_02`
--
ALTER TABLE `table_02`
  ADD CONSTRAINT `table_02_ibfk_1` FOREIGN KEY (`Supp_No`) REFERENCES `table_01` (`Supp_No`);

--
-- Constraints for table `table_04`
--
ALTER TABLE `table_04`
  ADD CONSTRAINT `table_04_ibfk_1` FOREIGN KEY (`PO_No`) REFERENCES `table_01` (`PO_No`),
  ADD CONSTRAINT `table_04_ibfk_2` FOREIGN KEY (`Part_No`) REFERENCES `table_03` (`Part_No`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
