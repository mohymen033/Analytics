-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 10, 2012 at 08:55 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `feature_tree`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `feature`
--

INSERT INTO `feature` (`id`, `name`, `description`, `is_active`) VALUES
(1, 'Strong Password Generation', 'This is a feature where you can generate strong password.', 1),
(2, 'Strong Password Generation Guide', 'Here you will get how to generate strong and secure password by using strong password generator feature.', 1),
(3, 'Password generation guideline (extra)', 'Password generation guideline (extra)', 0),
(4, 'Combined Features (extra) ', 'Combination of all Features', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `guielement`
--

INSERT INTO `guielement` (`id`, `requirement_id`, `name`, `description`) VALUES
(16, '1', 'ddlLength', 'From this element user can select the length of password.'),
(27, '3', 'btnGenerate', NULL),
(29, '2', 'chkSymbols', NULL),
(30, '4', 'StrongPasswordGuidelines', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=106 ;

--
-- Dumping data for table `gui_element_visit`
--

INSERT INTO `gui_element_visit` (`visitorid`, `visitoriformation`, `visitelementname`, `elementvisitcount`, `elementlastvisittime`, `elementvisitsessionid`, `visitoraddress`, `elementfirstvisittime`, `ipaddress`) VALUES
(20, 'Anonymous', 'btnGenerate', 2, '2012-09-20 01:53:26', '33bce4815db64fd7171f9349cbc0', 'Blekinge Institute of Technology (main campus), SÃ¶kvÃ¤gen 5, 371 41 Karlskrona, Sweden', '2012-09-20 01:43:14', '193.11.181.180'),
(21, 'Anonymous', 'btnGenerate', 1, '2012-09-20 02:53:40', '386acc21ad0f2064e8b3d9569afc', 'Blekinge Institute of Technology (main campus), SÃ¶kvÃ¤gen 5, 371 41 Karlskrona, Sweden', '2012-09-20 01:53:40', '193.11.181.180'),
(22, 'Anonymous', 'btnGenerate', 15, '2012-09-25 01:58:20', '38a9ca1184fe4d46604d1db84aae', 'Blekinge Institute of Technology (main campus), SÃ¶kvÃ¤gen 5, 371 41 Karlskrona, Sweden', '2012-09-20 01:57:59', '193.11.181.180'),
(23, 'Anonymous', 'ddForOutputPassword', 1, '2012-09-20 02:01:55', '38a9ca1184fe4d46604d1db84aae', 'Blekinge Institute of Technology (main campus), SÃ¶kvÃ¤gen 5, 371 41 Karlskrona, Sweden', '2012-09-20 02:01:55', '193.11.181.180'),
(24, 'Anonymous', 'chkSymbols', 2, '2012-09-20 02:36:58', '38e5c94116e09c5005a169a235fa', 'Blekinge Institute of Technology (main campus), SÃ¶kvÃ¤gen 5, 371 41 Karlskrona, Sweden', '2012-09-20 02:35:59', '193.11.181.66'),
(49, 'Anonymous', 'btnGenerate', 1, '2012-10-09 02:41:34', '58b59e41cfc19036a8f172d0ebc3', 'gfgfg', '2012-10-09 02:41:34', '193.11.181.43'),
(50, 'Anonymous', 'btnGenerate', 1, '2012-10-09 02:47:19', '5909bddcd3eb707efcc1a5e09dc2', 'gfgfg', '2012-10-09 02:47:19', '193.11.181.43'),
(51, 'Anonymous', 'btnGenerate', 1, '2012-10-09 02:52:00', '594eec6846c6e0902c51415420ba', 'SÃ¶kvÃ¤gen 5, Blekinge Institute of Technology (main campus), 371 41 Karlskrona, Sweden', '2012-10-09 02:52:00', '193.11.181.43'),
(52, 'Anonymous', 'btnGenerate', 20, '2012-10-15 03:45:50', '5c6151f63319609da0942e5b6291', 'SÃ¶kvÃ¤gen 5, Blekinge Institute of Technology (main campus), 371 41 Karlskrona, Sweden', '2012-10-09 03:45:45', '193.11.181.43'),
(53, 'Anonymous', 'btnGenerate', 1, '2012-10-25 03:46:32', '5c6d7f6e8a3b0006ab520774d274', 'SÃ¶kvÃ¤gen 5, Blekinge Institute of Technology (main campus), 371 41 Karlskrona, Sweden', '2012-10-09 03:46:32', '193.11.181.43'),
(54, 'Anonymous', 'btnGenerate', 12, '2012-10-09 03:57:58', '5d0da18d16c180087d87ae7cea86', 'SÃ¶kvÃ¤gen 5, Blekinge Institute of Technology (main campus), 371 41 Karlskrona, Sweden', '2012-10-25 03:57:29', '193.11.181.43'),
(55, 'Anonymous', 'ddlLength', 6, '2012-11-04 05:22:37', 'bb00c8ba934d703ff8cb9e426ef2', 'null', '2012-11-04 02:52:15', '193.11.183.224'),
(56, 'Anonymous', 'btnGenerate', 8, '2012-11-04 05:22:41', 'bb00c8ba934d703ff8cb9e426ef2', 'null', '2012-11-04 02:52:22', '193.11.183.224'),
(57, 'Anonymous', 'chkSymbols', 4, '2012-11-04 05:22:39', 'bb00c8ba934d703ff8cb9e426ef2', 'null', '2012-11-04 02:52:25', '193.11.183.224'),
(58, 'Anonymous', 'ddlLength', 4, '2012-11-10 01:30:53', 'a4ce69ad2bef708b2b0e55b0f1eb', 'null', '2012-11-10 01:30:41', '192.168.0.103'),
(59, 'Anonymous', 'chkSymbols', 2, '2012-11-10 01:30:51', 'a4ce69ad2bef708b2b0e55b0f1eb', 'null', '2012-11-10 01:30:46', '192.168.0.103'),
(60, 'Anonymous', 'btnGenerate', 4, '2012-11-10 01:30:55', 'a4ce69ad2bef708b2b0e55b0f1eb', 'null', '2012-11-10 01:30:47', '192.168.0.103'),
(61, 'Anonymous', 'StrongPasswordGuidelines', 2, '2012-11-10 07:32:19', 'a641aad7275ed0a363929d3be9fa', 'null', '2012-11-10 01:56:06', '192.168.0.103'),
(62, 'Anonymous', 'btnGenerate', 3, '2012-11-10 07:32:15', 'a641aad7275ed0a363929d3be9fa', 'null', '2012-11-10 07:32:13', '192.168.0.103'),
(63, 'Anonymous', 'btnGenerate', 2, '2012-11-10 08:20:41', 'bc3dcab6d97da0f189071e2a65f1', 'null', '2012-11-10 08:20:27', '192.168.0.102'),
(64, 'Anonymous', 'fNodeProduct', 1, '2012-11-10 08:38:53', 'bd4a1ed10e08252d4d36600c9049', 'null', '2012-11-10 08:38:53', '192.168.0.102'),
(65, 'Anonymous', 'fTreeProduct1', 1, '2012-11-10 08:44:53', 'bda5fef3fa08707cb5d5b8f12689', 'null', '2012-11-10 08:44:53', '192.168.0.102'),
(66, 'Anonymous', 'fTreeFeature1_1', 1, '2012-11-10 08:44:57', 'bda5fef3fa08707cb5d5b8f12689', 'null', '2012-11-10 08:44:57', '192.168.0.102'),
(67, 'Anonymous', 'fTreeFeature1_2', 1, '2012-11-10 08:45:01', 'bda5fef3fa08707cb5d5b8f12689', 'null', '2012-11-10 08:45:01', '192.168.0.102'),
(68, 'Anonymous', 'fTreeProduct2', 1, '2012-11-10 08:45:05', 'bda5fef3fa08707cb5d5b8f12689', 'null', '2012-11-10 08:45:05', '192.168.0.102'),
(69, 'Anonymous', 'fTreeFeature2_1', 1, '2012-11-10 08:45:08', 'bda5fef3fa08707cb5d5b8f12689', 'null', '2012-11-10 08:45:08', '192.168.0.102'),
(70, 'Anonymous', 'fTreeFeature2_2', 1, '2012-11-10 08:45:12', 'bda5fef3fa08707cb5d5b8f12689', 'null', '2012-11-10 08:45:12', '192.168.0.102'),
(71, 'Anonymous', 'sig1_3', 1, '2012-11-10 08:49:34', 'bde906fabb57f0aab694649e14b2', 'null', '2012-11-10 08:49:34', '192.168.0.102'),
(72, 'Anonymous', 'sig1_4', 1, '2012-11-10 08:49:38', 'bde906fabb57f0aab694649e14b2', 'null', '2012-11-10 08:49:38', '192.168.0.102'),
(73, 'Anonymous', 'sig1_1', 1, '2012-11-10 08:49:43', 'bde906fabb57f0aab694649e14b2', 'null', '2012-11-10 08:49:43', '192.168.0.102'),
(74, 'Anonymous', 'sig3_3', 1, '2012-11-10 08:49:48', 'bde906fabb57f0aab694649e14b2', 'null', '2012-11-10 08:49:48', '192.168.0.102'),
(75, 'Anonymous', 'sig3_1', 1, '2012-11-10 08:49:51', 'bde906fabb57f0aab694649e14b2', 'null', '2012-11-10 08:49:51', '192.168.0.102'),
(76, 'Anonymous', 'tVisualAnalytics', 1, '2012-11-10 08:51:44', 'be0ab81d07e5a0a6843c13b42b47', 'null', '2012-11-10 08:51:44', '192.168.0.102'),
(77, 'Anonymous', 'tVisualAnalytics', 1, '2012-11-10 08:52:29', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:52:29', '192.168.0.102'),
(78, 'Anonymous', 'fTreeProduct1', 1, '2012-11-10 08:52:33', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:52:33', '192.168.0.102'),
(79, 'Anonymous', 'fTreeProduct2', 1, '2012-11-10 08:52:36', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:52:36', '192.168.0.102'),
(80, 'Anonymous', 'fTreeFeature2_1', 1, '2012-11-10 08:52:39', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:52:39', '192.168.0.102'),
(81, 'Anonymous', 'fTreeFeature2_2', 1, '2012-11-10 08:52:43', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:52:43', '192.168.0.102'),
(82, 'Anonymous', 'fTreeFeature1_1', 1, '2012-11-10 08:52:46', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:52:46', '192.168.0.102'),
(83, 'Anonymous', 'menu1_1', 1, '2012-11-10 08:52:55', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:52:55', '192.168.0.102'),
(84, 'Anonymous', 'menu1_2', 1, '2012-11-10 08:53:03', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:53:03', '192.168.0.102'),
(85, 'Anonymous', 'fTreeFeature1_2', 1, '2012-11-10 08:53:10', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:53:10', '192.168.0.102'),
(86, 'Anonymous', 'sig1_3', 1, '2012-11-10 08:53:13', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:53:13', '192.168.0.102'),
(87, 'Anonymous', 'sig2_4', 1, '2012-11-10 08:53:17', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:53:17', '192.168.0.102'),
(88, 'Anonymous', 'fTreeFeature1_1', 1, '2012-11-10 08:53:22', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:53:22', '192.168.0.102'),
(89, 'Anonymous', 'sig2_14', 1, '2012-11-10 08:53:27', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:53:27', '192.168.0.102'),
(90, 'Anonymous', 'gtg2_1', 1, '2012-11-10 08:53:30', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:53:30', '192.168.0.102'),
(91, 'Anonymous', 'fromG2', 1, '2012-11-10 08:53:35', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:53:35', '192.168.0.102'),
(92, 'Anonymous', 'toG2', 1, '2012-11-10 08:53:43', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:53:43', '192.168.0.102'),
(93, 'Anonymous', 'gtg2_2', 1, '2012-11-10 08:53:51', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:53:51', '192.168.0.102'),
(94, 'Anonymous', 'sig2_1', 1, '2012-11-10 08:53:55', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:53:55', '192.168.0.102'),
(95, 'Anonymous', 'content1_1_2', 1, '2012-11-10 08:54:01', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:54:01', '192.168.0.102'),
(96, 'Anonymous', 'fromG2', 1, '2012-11-10 08:54:08', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:54:08', '192.168.0.102'),
(97, 'Anonymous', 'toG3', 1, '2012-11-10 08:54:25', 'be145df99219c0c091dc5d03fa3d', 'null', '2012-11-10 08:54:25', '192.168.0.102'),
(98, 'Anonymous', 'fTreeFeature1_1', 1, '2012-11-10 09:33:05', 'c0688fe48942605299d7863d37ca', 'null', '2012-11-10 09:33:05', '192.168.0.102'),
(99, 'Anonymous', 'fTreeFeature1_2', 1, '2012-11-10 09:33:07', 'c0688fe48942605299d7863d37ca', 'null', '2012-11-10 09:33:07', '192.168.0.102'),
(100, 'Anonymous', 'fTreeProduct1', 1, '2012-11-10 09:38:45', 'c0b93d41493ec03df033145984bd', 'null', '2012-11-10 09:38:45', '192.168.0.102'),
(101, 'Anonymous', 'fTreeFeature1_1', 1, '2012-11-10 09:38:55', 'c0b93d41493ec03df033145984bd', 'null', '2012-11-10 09:38:55', '192.168.0.102'),
(102, 'Anonymous', 'fTreeProduct1', 1, '2012-11-10 09:39:55', 'c0ca2034cca8b02faca33bac9338', 'null', '2012-11-10 09:39:55', '192.168.0.102'),
(103, 'Anonymous', 'fTreeProduct1', 1, '2012-11-10 09:44:50', 'c1143e21f053c39fb900486d98de', 'null', '2012-11-10 09:44:50', '192.168.0.102'),
(104, 'Anonymous', 'fTreeFeature1_1', 1, '2012-11-10 09:45:21', 'c11bce016bf21bfaa9e011e4e4eb', 'null', '2012-11-10 09:45:21', '192.168.0.102'),
(105, 'Anonymous', 'fTreeFeature1_1', 1, '2012-11-10 09:54:40', 'c195a50a37b810ef9965dc9669c0', 'null', '2012-11-10 09:54:40', '192.168.0.102');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `requirement`
--

INSERT INTO `requirement` (`id`, `feature_id`, `name`, `description`) VALUES
(1, '1', 'Select password length', 'Here user can select password length for password generation.'),
(2, '1', 'Select Punctuation enable and disable for password generation', 'User can use punctuation for password generation by enable and disable option.'),
(3, '1', 'Generate Strong password', 'By pressing button new strong password will be generated.'),
(4, '2', 'Guidance  for strong  password generation', 'Following guidance user will be able to know how strong password can be generate.'),
(5, 'NULL', 'Password generation output', 'Password generation output');

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
(1, 1, 'VisitCount', 'http://localhost:8080/featureTree/graphTest', 'Count User Visit', 1),
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
