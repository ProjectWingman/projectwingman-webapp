delimiter $$

CREATE DATABASE `wingman_db` /*!40100 DEFAULT CHARACTER SET latin1 */$$

delimiter $$

CREATE TABLE `Customer_Details` (
  `FirstName` varchar(500) DEFAULT NULL,
  `LastName` varchar(500) DEFAULT NULL,
  `Age` int(100) DEFAULT NULL,
  `Email` varchar(500) DEFAULT NULL,
  `Phone` varchar(500) DEFAULT NULL,
  `DOB` varchar(500) DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `Username` varchar(500) NOT NULL,
  `Password` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

delimiter $$

CREATE TABLE `login_session` (
  `username` varchar(500) NOT NULL,
  `sessionid` varchar(300) NOT NULL,
  `time_of_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `sessioonIdUnique` (`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

delimiter $$

CREATE TABLE `sender_details` (
  `Name` varchar(500) NOT NULL,
  `Ddate` varchar(500) DEFAULT NULL,
  `Email` varchar(500) DEFAULT NULL,
  `Phone` varchar(500) DEFAULT NULL,
  `Weight` int(100) DEFAULT NULL,
  `Source` varchar(500) DEFAULT NULL,
  `Destination` varchar(500) DEFAULT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Name`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

delimiter $$

CREATE TABLE `traveller_details` (
  `Name` varchar(500) NOT NULL,
  `Ddate` varchar(500) DEFAULT NULL,
  `Email` varchar(500) DEFAULT NULL,
  `Phone` varchar(500) DEFAULT NULL,
  `Flightno` varchar(500) DEFAULT NULL,
  `Source` varchar(500) DEFAULT NULL,
  `Destination` varchar(500) DEFAULT NULL,
  `Weight` int(100) unsigned zerofill NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Name`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1$$

