-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 21, 2017 at 06:39 PM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wingman_db`
--
CREATE DATABASE IF NOT EXISTS `wingman_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `wingman_db`;

-- --------------------------------------------------------

--
-- Table structure for table `Customer_Details`
--

CREATE TABLE IF NOT EXISTS `Customer_Details` (
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `DOB` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer_Details`
--

INSERT INTO `Customer_Details` (`FirstName`, `LastName`, `Age`, `Email`, `Phone`, `DOB`, `Address`, `Username`, `Password`) VALUES
('sho', 'aib', 12, 'sd@gs.com', '134567890', '30/1/95', '234yhjmjmntj', 'shoaib', '123');

-- --------------------------------------------------------

--
-- Table structure for table `login_session`
--

CREATE TABLE IF NOT EXISTS `login_session` (
  `username` varchar(100) NOT NULL,
  `sessionid` varchar(300) NOT NULL,
  `time_of_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `sessioonIdUnique` (`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_session`
--

INSERT INTO `login_session` (`username`, `sessionid`, `time_of_login`) VALUES
('shoaib', '4FAE09BCC9C464B7EAAFF1C1F2E68D83', '2017-01-21 13:06:58'),
('shoaib', 'casvdsavbdbadbgfafd', '2017-01-21 12:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `receiver_details`
--

CREATE TABLE IF NOT EXISTS `receiver_details` (
  `Name` int(11) NOT NULL,
  `Ddate` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Flightno` varchar(45) DEFAULT NULL,
  `Weight` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sender_details`
--

CREATE TABLE IF NOT EXISTS `sender_details` (
  `Name` varchar(100) DEFAULT NULL,
  `Ddate` varchar(45) DEFAULT NULL,
  `Email` varchar(45) NOT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
