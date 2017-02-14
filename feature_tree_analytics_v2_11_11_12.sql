-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 11, 2012 at 01:12 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `gui_element_visit`
--

INSERT INTO `gui_element_visit` (`visitorid`, `visitoriformation`, `visitelementname`, `elementvisitcount`, `elementlastvisittime`, `elementvisitsessionid`, `visitoraddress`, `elementfirstvisittime`, `ipaddress`) VALUES
(1, 'Anonymous', 'fTreeProduct1', 1, '2012-11-11 01:22:55', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:22:55', '192.168.0.102'),
(2, 'Anonymous', 'fTreeFeature1_1', 2, '2012-11-11 01:23:11', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:22:57', '192.168.0.102'),
(3, 'Anonymous', 'fTreeFeature1_2', 1, '2012-11-11 01:23:01', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:23:01', '192.168.0.102'),
(4, 'Anonymous', 'gtg1_2', 1, '2012-11-11 01:23:08', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:23:08', '192.168.0.102'),
(5, 'Anonymous', 'fromG1', 1, '2012-11-11 01:23:14', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:23:14', '192.168.0.102'),
(6, 'Anonymous', 'toG1', 1, '2012-11-11 01:23:22', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:23:22', '192.168.0.102'),
(7, 'Anonymous', 'gtg1_1', 1, '2012-11-11 01:23:28', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:23:28', '192.168.0.102'),
(8, 'Anonymous', 'sig2_3', 1, '2012-11-11 01:23:35', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:23:35', '192.168.0.102'),
(9, 'Anonymous', 'gtg2_1', 1, '2012-11-11 01:23:40', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:23:40', '192.168.0.102'),
(10, 'Anonymous', 'fromG2', 1, '2012-11-11 01:23:41', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:23:41', '192.168.0.102'),
(11, 'Anonymous', 'toG2', 1, '2012-11-11 01:23:46', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:23:46', '192.168.0.102'),
(12, 'Anonymous', 'fTreeFeature2_2', 2, '2012-11-11 01:24:02', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:23:53', '192.168.0.102'),
(13, 'Anonymous', 'fTreeFeature2_1', 2, '2012-11-11 01:23:57', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:23:56', '192.168.0.102'),
(14, 'Anonymous', 'fTreeProduct2', 1, '2012-11-11 01:24:00', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:24:00', '192.168.0.102'),
(15, 'Anonymous', 'sig3_7', 1, '2012-11-11 01:24:05', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:24:05', '192.168.0.102'),
(16, 'Anonymous', 'fromG3', 1, '2012-11-11 01:24:12', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:24:12', '192.168.0.102'),
(17, 'Anonymous', 'toG3', 1, '2012-11-11 01:24:14', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:24:14', '192.168.0.102'),
(18, 'Anonymous', 'sig4_3', 1, '2012-11-11 01:24:24', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:24:24', '192.168.0.102'),
(19, 'Anonymous', 'gtg4_1', 1, '2012-11-11 01:24:27', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:24:27', '192.168.0.102'),
(20, 'Anonymous', 'fromG4', 1, '2012-11-11 01:24:28', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:24:28', '192.168.0.102'),
(21, 'Anonymous', 'toG4', 1, '2012-11-11 01:24:34', 'f6bab0b14cb8e16c44a56b566138', 'Blekinge County', '2012-11-11 01:24:34', '192.168.0.102'),
(22, 'Anonymous', 'fTreeFeature1_2', 2, '2012-11-11 01:31:36', 'f73a9071479c9720c1c0a76a19f6', 'Blekinge County', '2012-11-11 01:31:14', '192.168.0.102'),
(23, 'Anonymous', 'fTreeFeature2_2', 2, '2012-11-11 01:31:40', 'f73a9071479c9720c1c0a76a19f6', 'Blekinge County', '2012-11-11 01:31:17', '192.168.0.102'),
(24, 'Anonymous', 'fTreeFeature1_1', 1, '2012-11-11 01:31:35', 'f73a9071479c9720c1c0a76a19f6', 'Blekinge County', '2012-11-11 01:31:35', '192.168.0.102'),
(25, 'Anonymous', 'fTreeFeature2_1', 1, '2012-11-11 01:31:39', 'f73a9071479c9720c1c0a76a19f6', 'Blekinge County', '2012-11-11 01:31:39', '192.168.0.102'),
(26, 'Anonymous', 'sig3_3', 1, '2012-11-11 01:31:55', 'f73a9071479c9720c1c0a76a19f6', 'Blekinge County', '2012-11-11 01:31:55', '192.168.0.102'),
(27, 'Anonymous', 'sig1_3', 1, '2012-11-11 01:32:01', 'f73a9071479c9720c1c0a76a19f6', 'Blekinge County', '2012-11-11 01:32:01', '192.168.0.102'),
(28, 'Anonymous', 'gtg1_2', 1, '2012-11-11 01:32:06', 'f73a9071479c9720c1c0a76a19f6', 'Blekinge County', '2012-11-11 01:32:06', '192.168.0.102'),
(29, 'Anonymous', 'fTreeFeature1_2', 3, '2012-11-11 01:44:22', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:41:53', '192.168.0.102'),
(30, 'Anonymous', 'sig1_3', 2, '2012-11-11 01:42:37', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:41:59', '192.168.0.102'),
(31, 'Anonymous', 'sig1_4', 2, '2012-11-11 01:42:36', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:42:10', '192.168.0.102'),
(32, 'Anonymous', 'sig1_5', 2, '2012-11-11 01:42:34', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:42:12', '192.168.0.102'),
(33, 'Anonymous', 'sig1_7', 3, '2012-11-11 01:43:17', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:42:13', '192.168.0.102'),
(34, 'Anonymous', 'sig1_8', 1, '2012-11-11 01:42:17', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:42:17', '192.168.0.102'),
(35, 'Anonymous', 'fTreeFeature1_1', 5, '2012-11-11 01:45:10', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:42:27', '192.168.0.102'),
(36, 'Anonymous', 'sig1_1', 2, '2012-11-11 01:45:16', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:42:40', '192.168.0.102'),
(37, 'Anonymous', 'sig2_3', 1, '2012-11-11 01:43:04', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:43:04', '192.168.0.102'),
(38, 'Anonymous', 'sig2_7', 1, '2012-11-11 01:43:13', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:43:13', '192.168.0.102'),
(39, 'Anonymous', 'fTreeFeature2_2', 1, '2012-11-11 01:45:11', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:45:11', '192.168.0.102'),
(40, 'Anonymous', 'sig2_1', 1, '2012-11-11 01:45:21', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:45:21', '192.168.0.102'),
(41, 'Anonymous', 'fromG1', 1, '2012-11-11 01:45:31', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:45:31', '192.168.0.102'),
(42, 'Anonymous', 'toG1', 1, '2012-11-11 01:45:41', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:45:41', '192.168.0.102'),
(43, 'Anonymous', 'fromG2', 1, '2012-11-11 01:45:47', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:45:47', '192.168.0.102'),
(44, 'Anonymous', 'toG2', 1, '2012-11-11 01:45:52', 'f7d1962838a05025dec594cb7eef', 'Blekinge County', '2012-11-11 01:45:52', '192.168.0.102'),
(45, 'Anonymous', 'fTreeFeature1_1', 1, '2012-11-11 01:53:26', 'f87dd10dab14107a2af042aee8cb', 'Blekinge County', '2012-11-11 01:53:26', '192.168.0.102'),
(46, 'Anonymous', 'sig1_3', 1, '2012-11-11 01:53:35', 'f87dd10dab14107a2af042aee8cb', 'Blekinge County', '2012-11-11 01:53:35', '192.168.0.102'),
(47, 'Anonymous', 'sig1_4', 1, '2012-11-11 01:53:53', 'f87dd10dab14107a2af042aee8cb', 'Blekinge County', '2012-11-11 01:53:53', '192.168.0.102'),
(48, 'Anonymous', 'sig1_5', 1, '2012-11-11 01:53:55', 'f87dd10dab14107a2af042aee8cb', 'Blekinge County', '2012-11-11 01:53:55', '192.168.0.102'),
(49, 'Anonymous', 'sig1_7', 1, '2012-11-11 01:53:57', 'f87dd10dab14107a2af042aee8cb', 'Blekinge County', '2012-11-11 01:53:57', '192.168.0.102'),
(50, 'Anonymous', 'sig1_8', 1, '2012-11-11 01:53:59', 'f87dd10dab14107a2af042aee8cb', 'Blekinge County', '2012-11-11 01:53:59', '192.168.0.102'),
(51, 'Anonymous', 'sig1_12', 1, '2012-11-11 01:54:17', 'f87dd10dab14107a2af042aee8cb', 'Blekinge County', '2012-11-11 01:54:17', '192.168.0.102'),
(52, 'Anonymous', 'sig1_15', 1, '2012-11-11 01:54:18', 'f87dd10dab14107a2af042aee8cb', 'Blekinge County', '2012-11-11 01:54:18', '192.168.0.102'),
(53, 'Anonymous', 'gtg1_2', 1, '2012-11-11 01:54:20', 'f87dd10dab14107a2af042aee8cb', 'Blekinge County', '2012-11-11 01:54:20', '192.168.0.102'),
(54, 'Anonymous', 'sig1_1', 1, '2012-11-11 01:54:40', 'f87dd10dab14107a2af042aee8cb', 'Blekinge County', '2012-11-11 01:54:40', '192.168.0.102'),
(55, 'Anonymous', 'fromG1', 1, '2012-11-11 01:54:44', 'f87dd10dab14107a2af042aee8cb', 'Blekinge County', '2012-11-11 01:54:44', '192.168.0.102'),
(56, 'Anonymous', 'toG1', 1, '2012-11-11 01:55:02', 'f87dd10dab14107a2af042aee8cb', 'Blekinge County', '2012-11-11 01:55:02', '192.168.0.102');

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
