-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 16, 2018 at 09:08 AM
-- Server version: 5.6.34-log
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `ID` int(10) NOT NULL,
  `Imagename` varchar(30) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Date` varchar(30) NOT NULL,
  `Source` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`ID`, `Imagename`, `Username`, `Date`, `Source`) VALUES
(0, 'Pizza', 'qi', '2018-4-6 12:10:40', 'pizza.jpg'),
(0, 'Double Cheese Burger', 'qi', '2018-4-6 12:57:57', 'burger.jpg'),
(0, 'Salmon', 'lei', '2018-4-6 15:52:37', 'salmon.jpg'),
(0, 'Fruit', 'small', '2018-4-13 11:24:17', 'fruit.png');

-- --------------------------------------------------------

--
-- Table structure for table `username`
--

CREATE TABLE `username` (
  `ID` int(11) NOT NULL,
  `Firstname` varchar(30) NOT NULL,
  `Surname` varchar(30) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `username`
--

INSERT INTO `username` (`ID`, `Firstname`, `Surname`, `Username`, `Password`) VALUES
(1, 'niuniu', 'wang', 'niu', 123456),
(2, 'qiqi', 'zhang', 'qi', 121212),
(0, 'undefined', 'undefined', 'undefined', 0),
(0, 'undefined', 'undefined', 'undefined', 0),
(0, 'xi', 'ha', 'xixihaha', 123),
(0, 'Ning', 'Wang', 'niu', 0),
(0, 'Ning', 'Wang', 'niuniu', 0),
(0, 'Ning', 'Wang', 'niuniu', 123),
(0, 'lei', 'wang', 'lei', 123),
(0, 'qq', 'zhang', 'small', 123);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
