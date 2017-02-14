-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 10, 2012 at 08:54 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `feature_tree_analytics`
--

-- --------------------------------------------------------

--
-- Table structure for table `feature`
--

CREATE TABLE IF NOT EXISTS `feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `is_active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `feature`
--

INSERT INTO `feature` (`id`, `name`, `description`, `is_active`) VALUES
(1, 'Product Feature Tree1', 'Product Feature Tree (Left Top)', 1),
(2, 'Product Feature Tree2', 'Product Feature Tree (Left Bottom)', 1),
(3, 'Statistics Of Graph1', 'Statistics Of Graph1 (Right Left Top)', 1),
(4, 'Statistics Of Graph2', 'Statistics Of Graph2 (Right Right Top)', 1),
(5, 'Statistics Of Graph3', 'Statistics Of Graph3 (Right Left Bottom)', 1),
(6, 'Statistics Of Graph4', 'Statistics Of Graph4 (Right Right Bottom)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `guielement`
--

CREATE TABLE IF NOT EXISTS `guielement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requirement_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `guielement`
--

INSERT INTO `guielement` (`id`, `requirement_id`, `name`, `description`) VALUES
(1, '1', 'fTreeProduct1', NULL),
(2, '2', 'fTreeFeature1_1', NULL),
(3, '3', 'fTreeFeature1_2', NULL),
(4, '4', 'fTreeProduct2', NULL),
(5, '5', 'fTreeFeature2_1', NULL),
(6, '6', 'fTreeFeature2_2', NULL),
(7, '7', 'sig1_3', NULL),
(8, '7', 'sig1_1', NULL),
(9, '7', 'sig1_4', NULL),
(10, '7', 'sig1_5', NULL),
(11, '7', 'sig1_7', NULL),
(12, '7', 'sig1_8', NULL),
(13, '8', 'sig1_12', NULL),
(14, '8', 'sig1_14', NULL),
(15, '9', 'sig1_15', NULL),
(16, '9', 'sig1_16', NULL),
(17, '10', 'gtg1_2', NULL),
(18, '10', 'gtg1_1', NULL),
(19, '11', 'fromG1', NULL),
(20, '11', 'toG1', NULL),
(21, '12', 'sig2_3', NULL),
(22, '12', 'sig2_1', NULL),
(23, '12', 'sig2_4', NULL),
(24, '12', 'sig2_5', NULL),
(25, '12', 'sig2_7', NULL),
(26, '12', 'sig2_8', NULL),
(27, '13', 'sig2_12', NULL),
(28, '13', 'sig2_14', NULL),
(29, '15', 'gtg2_1', NULL),
(30, '15', 'gtg2_2', NULL),
(31, '16', 'fromG2', NULL),
(32, '16', 'toG2', NULL),
(33, '17', 'sig3_3', NULL),
(34, '17', 'sig3_1', NULL),
(35, '17', 'sig3_4', NULL),
(36, '17', 'sig3_5', NULL),
(37, '17', 'sig3_7', NULL),
(38, '17', 'sig3_8', NULL),
(39, '18', 'sig3_12', NULL),
(40, '18', 'sig3_14', NULL),
(41, '19', 'sig3_15', NULL),
(42, '19', 'sig3_16', NULL),
(43, '20', 'gtg3_1', NULL),
(44, '20', 'gtg3_2', NULL),
(45, '21', 'fromG3', NULL),
(46, '21', 'toG3', NULL),
(47, '22', 'sig4_1', NULL),
(48, '22', 'sig4_3', NULL),
(49, '22', 'sig4_4', NULL),
(50, '22', 'sig4_5', NULL),
(51, '22', 'sig4_7', NULL),
(52, '22', 'sig4_8', NULL),
(53, '23', 'sig4_12', NULL),
(54, '23', 'sig4_14', NULL),
(55, '24', 'sig4_15', NULL),
(56, '24', 'sig4_16', NULL),
(57, '25', 'gtg4_1', NULL),
(58, '25', 'gtg4_2', NULL),
(59, '26', 'fromG4', NULL),
(60, '26', 'toG4', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gui_element_visit`
--

CREATE TABLE IF NOT EXISTS `gui_element_visit` (
  `visitorid` int(11) NOT NULL AUTO_INCREMENT,
  `visitoriformation` varchar(255) NOT NULL,
  `visitelementname` varchar(255) NOT NULL,
  `elementvisitcount` int(11) NOT NULL,
  `elementlastvisittime` datetime NOT NULL,
  `elementvisitsessionid` varchar(255) NOT NULL,
  `visitoraddress` varchar(255) DEFAULT NULL,
  `elementfirstvisittime` datetime DEFAULT NULL,
  `ipaddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`visitorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `indicator`
--

CREATE TABLE IF NOT EXISTS `indicator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `indicator`
--

INSERT INTO `indicator` (`id`, `name`, `description`) VALUES
(1, 'Usability', 'Usability of SAAS Application'),
(2, 'Reliability', 'Reliability of SAAS Application'),
(3, 'Performance', 'Performance of SAAS Application');

-- --------------------------------------------------------

--
-- Table structure for table `requirement`
--

CREATE TABLE IF NOT EXISTS `requirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `requirement`
--

INSERT INTO `requirement` (`id`, `feature_id`, `name`, `description`) VALUES
(1, '1', 'Click Product from Feature Tree1', 'Click Product from Feature Tree1'),
(2, '1', 'Click Feature1 from Feature Tree1', 'Click Feature1 from Feature Tree1'),
(3, '1', 'Click Feature2 from Feature Tree1', 'Click Feature2 from Feature Tree1'),
(4, '2', 'Click Product from Feature Tree2', 'Click Product from Feature Tree2'),
(5, '2', 'Click Feature1 from Feature Tree2', 'Click Feature1 from Feature Tree2'),
(6, '2', 'Click Feature2 from Feature Tree2', 'Click Feature2 from Feature Tree2'),
(7, '3', 'Click Usability Sub-Indicators of Graph1', 'Click Usability Sub-Indicators of Graph1'),
(8, '3', 'Click Reliability Sub-Indicators of Graph1', 'Click Reliability Sub-Indicators of Graph1'),
(9, '3', 'Click Performance Sub-Indicators of Graph1 ', 'Click Performance Sub-Indicators of Graph1'),
(10, '3', 'Click Graph1 Type', 'Click Graph1 Type'),
(11, '3', 'Filter Graph1 Date Range', 'Filter Graph1 Date Range'),
(12, '4', 'Click Usability Sub-Indicators of Graph2', 'Click Usability Sub-Indicators of Graph2'),
(13, '4', 'Click Reliability Sub-Indicators of Graph2', 'Click Reliability Sub-Indicators of Graph2'),
(14, '4', 'Click Performance Sub-Indicators of Graph2', 'Click Performance Sub-Indicators of Graph2'),
(15, '4', 'Click Graph2 Type', 'Click Graph2 Type'),
(16, '4', 'Filter Graph2 Date Range', 'Filter Graph2 Date Range'),
(17, '5', 'Click Usability Sub-Indicators of Graph3', 'Click Usability Sub-Indicators of Graph3'),
(18, '5', 'Click Reliability Sub-Indicators of Graph3', 'Click Reliability Sub-Indicators of Graph3'),
(19, '5', 'Click Performance Sub-Indicators of Graph3', 'Click Performance Sub-Indicators of Graph3'),
(20, '5', 'Click Graph3 Type', 'Click Graph3 Type'),
(21, '5', 'Filter Graph3 Date Range', 'Filter Graph3 Date Range'),
(22, '6', 'Click Usability Sub-Indicators of Graph4', 'Click Usability Sub-Indicators of Graph4'),
(23, '6', 'Click Reliability Sub-Indicators of Graph4', 'Click Reliability Sub-Indicators of Graph4'),
(24, '6', 'Click Performance Sub-Indicators of Graph4', 'Click Performance Sub-Indicators of Graph4'),
(25, '6', 'Click Graph4 Type', 'Click Graph4 Type'),
(26, '6', 'Filter Graph4 Date Range', 'Filter Graph4 Date Range');

-- --------------------------------------------------------

--
-- Table structure for table `sub_indicator`
--

CREATE TABLE IF NOT EXISTS `sub_indicator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indicator_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` text,
  `is_active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `sub_indicator`
--

INSERT INTO `sub_indicator` (`id`, `indicator_id`, `name`, `url`, `description`, `is_active`) VALUES
(1, 1, 'VisitCount', '#', 'Count User Visit', 1),
(2, 1, 'User Click Stream', '#', '', 0),
(3, 1, 'VisitTime', '#', '', 1),
(4, 1, 'VisitDuration', '#', '', 1),
(5, 1, 'VisitorLocation', '#', '', 1),
(6, 1, 'User Visit Referrers', '#', '', 0),
(7, 1, 'TotalVisitors ', '#', '', 1),
(8, 1, 'PageVisit', '#', '', 1),
(9, 1, 'NewVisitors', '#', '', 0),
(10, 1, 'Returning Users', '#', '', 0),
(11, 2, 'Availability', '#', '', 0),
(12, 2, 'Downtime', '#', '', 1),
(13, 2, 'HTTP Error', '#', '', 0),
(14, 2, 'Throughput', '#', '', 1),
(15, 3, 'Service Response Time', '#', '', 1),
(16, 3, 'Service Load Time', '#', '', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
