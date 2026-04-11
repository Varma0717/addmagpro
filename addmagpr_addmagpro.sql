-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 11, 2026 at 06:55 PM
-- Server version: 8.0.40
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `addmagpr_addmagpro`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_users`
--

CREATE TABLE `active_users` (
  `active_id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `active_users`
--

INSERT INTO `active_users` (`active_id`, `user_id`, `user_name`, `created_at`) VALUES
(1, 378, '7702381784', '2024-06-05 10:16:41'),
(2, 278, 'Puli Madhukar', '2024-06-05 11:23:21'),
(3, 336, 'D Shivalal', '2024-06-06 04:40:38'),
(4, 148, 'K KUMARASWAMY', '2024-06-12 11:04:20'),
(5, 256, 'D BIKSHAPATHI', '2024-06-13 15:02:33'),
(6, 424, 'DURGA PRASAD CHALLA', '2024-06-29 05:42:09'),
(7, 210, 'NADIMPELLI SATHISH', '2024-07-12 15:03:46'),
(8, 259, 'NAGARJUNA REDDY', '2024-07-12 15:04:21'),
(9, 213, 'SWAROOP MARUPUDI', '2024-07-12 15:04:55'),
(10, 219, 'N VENKTESH', '2024-07-12 15:05:27'),
(11, 183, 'N BHAVANI', '2024-07-27 06:01:47'),
(12, 340, 'Kuchana hymavathi', '2024-07-27 08:18:10'),
(13, 611, 'Suresh Padavala', '2024-07-27 10:40:50'),
(14, 619, 'D.V RAGHAVA RAO', '2024-07-31 10:21:47'),
(15, 254, 'KOOCHANA CHANDU', '2024-08-03 04:50:58'),
(16, 253, 'RAMU KOLANUPAKA', '2024-08-03 06:13:51'),
(17, 249, 'TEMBERENI  ANIL', '2024-08-03 08:36:20'),
(18, 246, 'RAYES SHOBHAN', '2024-08-03 08:36:38'),
(19, 245, 'PRABHAKAR VESTAGE', '2024-08-03 08:36:52'),
(20, 181, 'G ESWARA CHARI', '2024-08-03 08:37:10'),
(21, 175, 'SARANGAPANI', '2024-08-03 08:37:36'),
(22, 430, 'HYMAVATHI', '2024-08-03 08:37:49'),
(23, 410, 'Anand', '2024-08-03 08:38:36'),
(24, 154, 'NIMMANAGOTI VENKANNA', '2024-08-03 08:38:49'),
(25, 270, 'D SRILATHA', '2024-08-03 08:42:10'),
(26, 267, 'P NAGARAJU KOLLUR', '2024-08-03 08:42:27'),
(27, 262, 'KHAYYUM', '2024-08-03 08:42:39'),
(28, 261, 'SWAMIDAS', '2024-08-03 08:42:51'),
(29, 258, 'K RAMANI', '2024-08-03 08:43:04'),
(30, 674, 'VEMULA PARVATHI', '2024-08-18 08:48:46'),
(31, 659, 'Suresh Padavala', '2024-08-28 10:20:04'),
(32, 670, 'Lakshmi kumari Thota', '2024-08-29 05:26:31'),
(33, 250, 'AVM SATYANARAYANA', '2024-09-04 17:17:53'),
(34, 716, 'VAJID KHAN', '2024-09-13 09:17:05'),
(35, 722, '9441226834', '2024-09-14 11:14:41'),
(36, 548, 'Satish Kumar', '2024-09-17 03:26:32'),
(37, 627, 'KURRA ANITHA', '2024-09-21 01:38:43'),
(38, 731, 'Thanmai', '2024-09-22 12:26:51'),
(39, 735, 'SKY SAY', '2024-09-23 06:12:04'),
(40, 252, 'K KISHAN RAO', '2024-09-24 05:09:13'),
(41, 748, 'Mohd Abdul Rahman', '2024-10-02 06:05:59'),
(42, 791, 'PRASHANTH CHIKKULAPALLY', '2024-10-29 15:46:54'),
(43, 789, 'R S VASU', '2024-11-07 11:45:13'),
(44, 514, 'Surya', '2024-11-12 08:39:57'),
(45, 809, 'Manthena Ramadevi', '2024-11-19 03:44:04'),
(46, 813, 'Srikanth', '2024-11-19 08:23:39'),
(47, 754, 'RAMAKRISHNA P', '2024-11-20 06:12:31'),
(48, 755, 'PARAMJYOTHI V B', '2024-11-20 06:13:46'),
(49, 857, 'Chenna Raju', '2024-11-25 06:48:16'),
(50, 820, 'Gudelli Archana', '2024-12-03 18:08:46'),
(51, 832, 'Govardhani Kodavali', '2024-12-03 18:09:48'),
(52, 873, 'Srinivasarao k', '2024-12-03 18:11:08'),
(53, 889, 'Anil Kumar', '2024-12-03 18:14:47'),
(54, 819, 'Suresh Yarraboina', '2024-12-06 03:10:45'),
(55, 875, 'M PARSHURAM', '2024-12-06 08:41:52'),
(56, 838, 'Gajjelli Bhaskar', '2024-12-06 08:48:58'),
(57, 821, 'Laxmipathi Pabboju', '2024-12-06 09:12:34'),
(58, 921, 'BOLLU SEETHA DEVI', '2024-12-08 13:19:25'),
(59, 1001, 'DURGA SRINIVASA RAO', '2024-12-18 16:39:00'),
(60, 1006, 'G. Babugoud', '2025-01-03 10:38:04'),
(61, 1019, 'TAMATAM INDRAJA', '2025-01-03 10:49:03'),
(62, 1010, 'e.krishnaveni', '2025-01-03 10:51:08'),
(63, 1009, 'Avala ashok goud', '2025-01-03 10:51:34'),
(64, 1008, 'Akala sampath kumar goud', '2025-01-03 10:51:57'),
(65, 968, 'Rayalaseema Ali', '2025-01-12 07:41:31'),
(66, 1032, 'k.Raghavendhar', '2025-01-17 14:55:07'),
(67, 1025, 'KONIKI VEERANJANEYULU', '2025-01-31 04:43:43'),
(68, 1088, 'GANUGAPETA  SHARADA', '2025-03-24 04:46:50'),
(69, 1178, 'Geluka Prameela', '2025-04-01 05:59:14'),
(70, 1347, 'Revathi M', '2025-07-03 04:39:24'),
(71, 1542, 'Y Nageshwar Rao', '2025-11-30 10:00:50'),
(72, 1600, 'G BHASKAR', '2025-12-11 08:49:30'),
(73, 1577, 'Vodyala Pradeep Kumar', '2025-12-11 08:50:47'),
(74, 1603, 'Y Satyanarayana', '2025-12-11 14:43:05'),
(75, 1609, 'P.B.Mahendra', '2025-12-19 15:32:37'),
(76, 1606, 'S Nagarju', '2025-12-19 15:33:48'),
(77, 1608, 'T Mohan Goud', '2025-12-19 15:35:57'),
(78, 1624, 'Sai karthik', '2025-12-20 09:47:09'),
(79, 1626, 'V Raghu Ram', '2025-12-21 06:22:09'),
(80, 1655, 'Neela Mallesh', '2025-12-25 05:11:31'),
(81, 1654, 'Gummadi Praveen Reddy', '2025-12-25 05:11:54'),
(82, 1629, 'Srinivas Rao', '2025-12-27 16:53:56'),
(83, 1656, 'CH MALATHI', '2025-12-27 16:55:40'),
(84, 1567, 'Dr SUBBA RAO', '2025-12-27 17:00:08'),
(85, 1623, 'Likitha', '2025-12-30 11:24:29'),
(86, 1677, 'Mididam MuralidharRao', '2025-12-30 12:09:29'),
(87, 1675, 'Manga', '2025-12-30 12:32:49'),
(88, 1674, 'B prevean', '2025-12-30 12:34:19'),
(89, 1678, 'SUNIL KUMAR KANDI', '2025-12-30 12:55:14'),
(90, 1630, 'Poluguram Mahender', '2025-12-31 04:53:41'),
(91, 1679, 'MANJULA', '2025-12-31 06:28:56'),
(92, 168, 'BUDHI SHARATH KUMAR', '2026-01-02 10:27:33'),
(93, 1659, 'Vision Board Ramesh', '2026-01-02 11:27:19'),
(94, 1696, 'A. Aruna', '2026-01-03 10:27:22'),
(95, 1694, 'Edgi mahesh kumar', '2026-01-03 16:28:38'),
(96, 1682, 'Soma Pushpalatha', '2026-01-03 16:29:20'),
(97, 1569, 'Tekmal jyoti', '2026-01-04 16:52:51'),
(98, 1620, 'VIDIYALA SRINIVAS', '2026-01-06 09:30:02'),
(99, 1706, 'A sagar babu', '2026-01-06 09:32:47'),
(100, 1621, 'Ravi varma', '2026-01-06 12:07:18'),
(101, 1613, 'K Padma', '2026-01-06 14:07:24'),
(102, 1580, 'Majeeda begum', '2026-01-07 09:01:26'),
(103, 1747, 'N FIRUDHIEN', '2026-01-08 18:02:35'),
(104, 1746, 'N SHAMSHUDHEEN', '2026-01-08 18:03:04'),
(105, 1745, 'N MUNTAJ BEGUM', '2026-01-08 18:03:32'),
(106, 1744, 'SK RAMJANBI', '2026-01-08 18:03:59'),
(107, 1743, 'SK MASTANVALI', '2026-01-08 18:04:24'),
(108, 1742, 'N BASHIROON', '2026-01-08 18:04:56'),
(109, 1737, 'T S RAO', '2026-01-08 18:05:26'),
(110, 1739, 'K M Kishore Kumar', '2026-01-08 18:06:01'),
(111, 1740, 'K . JHANSI', '2026-01-08 18:06:26'),
(112, 1730, 'MD KHAMRUDDIN', '2026-01-08 18:06:59'),
(113, 1612, 'Kavitha', '2026-01-08 18:14:50'),
(114, 1724, 'Shaheen begum', '2026-01-08 18:19:26'),
(115, 1733, 'MAHENDERKAR RAJESWARI', '2026-01-09 12:22:47'),
(116, 1749, 'E Bhagha', '2026-01-09 12:23:33'),
(117, 1750, 'Maradikonda Anitha', '2026-01-09 12:24:21'),
(118, 1748, 'Gundrathi venugopal goud', '2026-01-09 12:24:57'),
(119, 1758, 'SRAVANTHI MIDIDAM', '2026-01-09 15:12:27'),
(120, 1697, 'GAGULOTH KRISHNA', '2026-01-09 17:11:22'),
(121, 1759, 'MARCHETTY SURYAPRAKASH RAO', '2026-01-09 17:22:12'),
(122, 1683, 'M. Shyamala', '2026-01-09 20:02:03'),
(123, 629, 'POILA CHITTI BABU', '2026-01-10 05:48:39'),
(124, 1780, 'C MALLIKARJUN', '2026-01-11 16:38:04'),
(125, 1768, 'CH VENKATESHWAR RAO', '2026-01-12 04:19:23'),
(126, 1804, 'CHERALA SADANANDAM', '2026-01-13 13:40:55'),
(127, 1790, 'O.apparao', '2026-01-13 13:41:50'),
(128, 1791, 'Shaik sattar', '2026-01-13 13:42:20'),
(129, 1792, 'R Samuel', '2026-01-13 13:42:43'),
(130, 1797, 'Kuchana Akhil', '2026-01-13 13:43:41'),
(131, 1808, 'M Saadhwini', '2026-01-16 09:54:48'),
(132, 1810, 'GUDURU KALAVATHI', '2026-01-17 04:04:55'),
(133, 1045, 'G. Madhavi', '2026-01-18 06:09:03'),
(134, 1046, 'G. Laxmangoud', '2026-01-18 06:09:21'),
(135, 1048, 'D. Aparna', '2026-01-18 06:09:33'),
(136, 1050, 'S.k.shaker', '2026-01-18 06:09:46'),
(137, 1063, 'R SHANKER', '2026-01-18 06:10:00'),
(138, 1064, 'P.yadhagiri', '2026-01-18 06:10:13'),
(139, 1102, 'Bodappa.', '2026-01-18 06:10:24'),
(140, 1814, 'G. Manoj goud', '2026-01-18 06:10:37'),
(141, 1815, 'G. Bhavani', '2026-01-18 06:10:49'),
(142, 1816, 'G. Babugoud', '2026-01-18 06:11:01'),
(143, 1817, 'Saikumer', '2026-01-18 06:11:15'),
(144, 1818, 'B. Jayasri', '2026-01-18 06:11:29'),
(145, 1821, 'P vasu', '2026-01-18 06:40:16'),
(146, 1820, 'K srinivas', '2026-01-18 06:40:35'),
(147, 1832, 'Varahalu.Rani', '2026-01-20 05:01:17'),
(148, 1834, 'Sandhya', '2026-01-20 09:06:30'),
(149, 1833, 'Annthamma', '2026-01-20 09:07:00'),
(150, 1826, 'Pushpa', '2026-01-20 09:13:15'),
(151, 1844, 'Jagadish babu p', '2026-01-22 13:17:47'),
(152, 1857, 'MEENAKSHI', '2026-01-24 07:16:26'),
(153, 1862, 'P.Rajkumar', '2026-01-25 14:05:25'),
(154, 1861, 'K.shyam', '2026-01-25 14:06:27'),
(155, 1858, 'B Nirmala', '2026-01-26 09:26:41'),
(156, 1860, 'A. Archana', '2026-01-26 09:33:46'),
(157, 1872, 'P.Sandhya Rani', '2026-01-30 11:46:35'),
(158, 1871, 'DrPURUSHOTHAM  JERIPOTHULA', '2026-01-30 11:47:00'),
(159, 1873, 'Suraj vision foundation', '2026-01-30 13:54:07'),
(160, 1878, 'Md gousuddin', '2026-02-01 06:02:07'),
(161, 1879, 'Manchala Suraj Raj', '2026-02-01 06:02:29'),
(162, 1877, 'S jalees ur rahman', '2026-02-01 06:03:32'),
(163, 860, 'R. Sriram Reddy', '2026-02-02 03:21:35'),
(164, 1885, 'Venkatesh', '2026-02-02 15:56:03'),
(165, 1882, 'Vallabhapurapu Durga sukanya', '2026-02-02 15:57:10'),
(166, 1892, 'Kakkerla vidya', '2026-02-03 18:50:39'),
(167, 1888, 'P. Ramadevi', '2026-02-03 18:52:01'),
(168, 1889, 'P. RAJU', '2026-02-03 18:53:06'),
(169, 1787, 'Kommu renukarani', '2026-02-06 11:25:20'),
(170, 1920, 'Ramesh goud', '2026-02-06 13:51:59'),
(171, 1925, 'Mosesraj', '2026-02-06 13:52:27'),
(172, 1924, 'Sunitha', '2026-02-06 13:52:48'),
(173, 1923, 'Jayamma', '2026-02-06 13:53:09'),
(174, 1943, 'A D ARUN', '2026-02-09 11:29:51'),
(175, 1657, 'CH SRIKANTH', '2026-02-09 11:31:38'),
(176, 1939, 'Boya surendar', '2026-02-09 11:48:45'),
(177, 1949, 'Sunitha Thadula', '2026-02-10 04:33:34'),
(178, 1875, 'Zareena Sultana', '2026-02-10 04:36:05'),
(179, 1953, 'Kanakamma', '2026-02-10 04:37:06'),
(180, 1952, 'Srinu b', '2026-02-10 10:03:32'),
(181, 1957, 'M basu', '2026-02-10 10:04:54'),
(182, 1883, 'Chinthakindi Sravanthi', '2026-02-10 10:06:32'),
(183, 1971, 'B Kavya Reddy', '2026-02-12 11:42:24'),
(184, 1978, 'Pradeep', '2026-02-15 07:32:38'),
(185, 1975, 'P Kalpana', '2026-02-15 07:33:14'),
(186, 1933, 'Ravi chandra', '2026-02-15 13:11:56'),
(187, 1990, 'P kumari', '2026-02-17 16:59:27'),
(188, 1989, 'P kumari', '2026-02-17 17:00:04'),
(189, 1988, 'Satyanarayana ramani', '2026-02-17 17:00:24'),
(190, 1886, 'Y srinivasarao', '2026-02-17 17:01:08'),
(191, 1936, 'Lakshmi sprouts', '2026-02-18 07:32:59'),
(192, 1996, 'Harika', '2026-02-21 02:52:10'),
(193, 1999, 'Aruna', '2026-02-21 02:52:34'),
(194, 1429, 'S PRAKASH REDDY', '2026-02-21 02:54:11'),
(195, 1571, 'Rainbow happy life', '2026-02-21 02:55:40'),
(196, 2000, 'R GOPALA KRISHNA', '2026-02-21 08:41:25'),
(197, 1903, 'K Hymavathi', '2026-02-21 08:43:37'),
(198, 2010, 'J Manjula', '2026-02-23 11:48:35'),
(199, 2009, 'RAVI RAJANI', '2026-02-25 04:57:05'),
(200, 2012, 'Syed hussain', '2026-02-25 08:26:48'),
(201, 2011, 'Shoukath sb madarsa', '2026-02-25 08:27:25'),
(202, 2004, 'Ganta lakshmi', '2026-02-25 08:27:54'),
(203, 2013, 'B VIJAYA LAKSHMI', '2026-02-25 09:32:00'),
(204, 2015, 'Domala Srinivasu', '2026-02-26 13:22:33'),
(205, 2017, 'Khaja bee', '2026-02-26 13:22:52'),
(206, 2019, 'Dr. Murali Krishna Kishore N', '2026-02-28 01:43:36'),
(207, 756, 'Thota kishore', '2026-02-28 01:45:15'),
(208, 2022, 'G SRINIVAS', '2026-03-02 14:54:46'),
(209, 2018, 'D THIRUMALA', '2026-03-04 13:47:09'),
(210, 1998, 'JAYALAKSHMI', '2026-03-07 05:28:21'),
(211, 2031, 'Neelufar', '2026-03-07 05:29:33'),
(212, 2032, 'Mahadevi', '2026-03-07 05:29:58'),
(213, 2033, 'Sandhya', '2026-03-07 05:30:27'),
(214, 1572, 'c.Bhavani Prasad', '2026-03-07 08:35:17'),
(215, 2050, 'P SIVATEJA', '2026-03-09 15:26:08'),
(216, 2049, 'P SWAMY', '2026-03-09 15:26:26'),
(217, 2048, 'P SRINIVASA RAO', '2026-03-09 15:26:42'),
(218, 2044, 'Ravi Sridhar', '2026-03-09 15:27:25'),
(219, 2052, 'Sheik Mastan Shaakier', '2026-03-11 15:53:17'),
(220, 1752, 'Ashok sir', '2026-03-11 15:54:44'),
(221, 2055, 'Ammulu', '2026-03-12 12:39:36'),
(222, 1323, 'K Manoj Kumar', '2026-03-13 09:22:56'),
(223, 2054, 'Amrutha Reddy', '2026-03-13 11:49:00'),
(224, 1596, 'ANARASI SREERAMULU', '2026-03-19 04:12:04'),
(225, 1980, 'Dr. Jayarama Reddy Kummathi', '2026-03-19 04:18:23'),
(226, 2070, 'M Venkateshwr Rao', '2026-03-19 04:22:23'),
(227, 2046, 'Ravi Ganesh', '2026-03-19 04:23:15'),
(228, 2080, 'B LINGAIAH', '2026-03-22 12:07:16'),
(229, 1940, 'Ramesh  tailor', '2026-03-24 05:59:00'),
(230, 1848, 'Venkat reddy p', '2026-03-25 08:22:03'),
(231, 2097, 'Gajula Krishna', '2026-03-29 11:59:21'),
(232, 2096, 'K Gopalrao', '2026-03-29 11:59:38'),
(233, 2095, 'Y UMA MAHESWAR RAO', '2026-03-29 11:59:55'),
(234, 2099, 'Manjula', '2026-04-02 10:33:20'),
(235, 2109, 'Premalatha', '2026-04-03 06:12:33'),
(236, 2036, 'B v subbarao, 4 th , czech', '2026-04-03 15:09:38'),
(237, 2120, 'B G REDDY', '2026-04-09 06:09:29'),
(238, 2084, 'Satish  bondalu', '2026-04-09 06:10:08'),
(239, 2124, 'Yesu vsecurity  czech', '2026-04-09 06:11:34'),
(240, 2126, 'Mullashaikshavali', '2026-04-09 10:48:26'),
(241, 2132, 'V Srinivas ayurveda', '2026-04-09 10:48:55');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@gmail.com', 'admin', NULL, '5ff1c3531ed3f1609679699.jpg', 'admin', NULL, '2021-05-07 07:54:06');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT '0',
  `click_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` int NOT NULL,
  `back_two_back` int NOT NULL,
  `charity` int NOT NULL,
  `monthly_pool` int NOT NULL,
  `company` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `back_two_back`, `charity`, `monthly_pool`, `company`, `created_at`) VALUES
(8, 0, 10, 0, 690, '2024-08-21 05:59:57'),
(9, 0, 10, 0, 690, '2024-08-21 05:59:57'),
(10, 0, 10, 0, 690, '2024-08-21 05:59:57'),
(11, 0, 10, 0, 690, '2024-08-21 05:59:57'),
(12, 0, 10, 0, 690, '2024-08-21 05:59:57'),
(13, 0, 10, 0, 690, '2024-08-21 05:59:57'),
(14, 0, 10, 0, 690, '2024-08-21 05:59:57'),
(15, 0, 10, 0, 690, '2024-08-21 05:59:57'),
(16, 0, 30, 0, -1080, '2024-09-24 04:26:39'),
(17, 0, 8, 0, -283, '2024-09-24 04:26:39'),
(18, 0, 6, 0, -225, '2024-09-24 04:26:39'),
(19, 0, 8, 0, -281, '2024-09-24 04:26:39'),
(20, 0, 39, 0, -1386, '2024-09-24 04:26:39'),
(21, 0, 36, 0, -1278, '2024-09-24 04:26:39'),
(22, 0, 33, 0, -1188, '2024-09-24 04:26:39'),
(23, 0, 43, 0, -1539, '2024-11-03 15:58:03'),
(24, 0, 34, 0, -1218, '2024-11-03 15:58:03'),
(25, 0, 18, 0, -663, '2024-11-03 15:58:03'),
(26, 0, 0, 0, -1245, '2024-11-03 15:58:03'),
(27, 0, 0, 0, 99, '2024-12-10 05:50:18'),
(28, 0, 10, 0, 640, '2024-12-10 05:50:18'),
(29, 0, 0, 0, 90, '2025-11-29 14:49:04'),
(30, 0, 0, 0, 90, '2025-11-29 14:49:04'),
(31, 0, 0, 0, 90, '2025-11-29 14:49:04'),
(32, 0, 0, 0, 90, '2025-11-29 14:49:04'),
(33, 0, 0, 0, 90, '2025-11-29 14:49:04'),
(34, 0, 10, 0, 640, '2025-11-29 14:49:19'),
(35, 0, 10, 0, 640, '2025-11-29 14:49:19'),
(36, 0, 10, 0, 640, '2025-11-29 14:49:19'),
(37, 0, 10, 0, 640, '2025-11-29 14:49:19'),
(38, 0, 10, 0, 640, '2025-11-29 14:49:19'),
(39, 0, 10, 0, 640, '2026-01-02 11:27:46'),
(40, 0, 0, 0, 92, '2026-01-02 11:27:46'),
(41, 0, 0, 0, 20, '2026-01-02 11:27:46'),
(42, 0, 0, 0, 390, '2026-01-11 06:03:45'),
(43, 0, 0, 0, 91, '2026-01-11 06:03:45'),
(44, 0, 0, 0, 390, '2026-01-11 06:03:45'),
(45, 0, 0, 0, 180, '2026-01-25 14:13:51'),
(46, 0, 0, 0, 90, '2026-01-25 14:13:51'),
(47, 0, 0, 0, 90, '2026-01-25 14:13:51'),
(48, 0, 0, 0, 90, '2026-01-25 14:13:51'),
(49, 0, 0, 0, 90, '2026-01-25 14:13:51'),
(50, 0, 0, 0, 90, '2026-03-26 04:26:18'),
(51, 0, 0, 0, 90, '2026-03-26 04:26:18'),
(52, 0, 0, 0, 90, '2026-03-26 04:26:18'),
(53, 0, 0, 0, 91, '2026-03-26 04:26:18'),
(54, 0, 0, 0, 90, '2026-03-26 04:26:18'),
(55, 0, 0, 0, 90, '2026-03-26 04:26:18'),
(56, 0, 0, 0, 90, '2026-03-26 04:26:18'),
(57, 0, 0, 0, 390, '2026-03-26 04:26:18'),
(58, 0, 0, 0, 90, '2026-03-26 04:26:18'),
(59, 0, 0, 0, 390, '2026-03-26 04:26:18'),
(60, 0, 0, 0, 90, '2026-03-26 04:26:18'),
(61, 0, 0, 60, 90, '2026-03-31 09:34:44'),
(62, 0, 0, 60, 90, '2026-03-31 09:34:44'),
(63, 0, 0, 500, 750, '2026-04-06 10:25:06');

-- --------------------------------------------------------

--
-- Table structure for table `ads_banners`
--

CREATE TABLE `ads_banners` (
  `ads_banner_id` int NOT NULL,
  `ads_banner_name` varchar(50) NOT NULL,
  `ads_banner_url` varchar(250) NOT NULL DEFAULT 'addmagpro.com',
  `ads_banner_image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ads_banners`
--

INSERT INTO `ads_banners` (`ads_banner_id`, `ads_banner_name`, `ads_banner_url`, `ads_banner_image`, `created_at`) VALUES
(10, 'Adsbanner1', 'https://addmagpro.com/', 'assets/galley_images/68ff41448206a.WhatsApp Image 2025-10-27 at 11.13.18 AM.jpeg', '2025-10-27 09:54:12'),
(11, 'Adsbanner2', 'https://addmagpro.com/', 'assets/galley_images/68989d5553b18.a.jpeg', '2025-08-10 13:23:33'),
(12, 'Adsbanner3', 'https://addmagpro.com/', 'assets/galley_images/69019821d9e6d.14.png', '2025-10-29 04:29:22'),
(13, 'Adsbanner4', 'https://addmagpro.com/', 'assets/galley_images/6657351849f53.ambn.jpg', '2024-08-13 06:57:57'),
(14, 'Adsbanner5', 'https://addmagpro.com/', 'assets/galley_images/667ad23e9b983.Untitled design.jpg', '2024-08-13 06:58:51'),
(15, 'Adsbanner6', 'https://addmagpro.com/', 'assets/galley_images/67f3605843bff.Tower Fan (1).png', '2025-04-07 05:19:20'),
(16, 'Adsbanner7', 'https://addmagpro.com/', 'assets/galley_images/6900610a15770.WhatsApp Image 2025-10-28 at 11.51.30.jpeg', '2025-10-28 06:22:02'),
(17, 'Adsbanner8', 'https://addmagpro.com/', 'assets/galley_images/6677a2f9d231b.jaya b.jpg', '2024-08-13 06:59:13'),
(18, 'Adsbanner9', 'https://addmagpro.com/', 'assets/galley_images/69215ae5b2ced.65 incs Strip AD (1).png', '2025-11-22 06:40:37'),
(19, 'Adsbanner10', 'https://addmagpro.com/', 'assets/galley_images/679c59abd1022.27.png', '2025-01-31 05:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `backtwoback_wallet`
--

CREATE TABLE `backtwoback_wallet` (
  `wallet_id` int NOT NULL,
  `user_id` int NOT NULL,
  `balance` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `backtwoback_wallet`
--

INSERT INTO `backtwoback_wallet` (`wallet_id`, `user_id`, `balance`, `created_at`) VALUES
(1, 148, 480, '2026-04-06 10:25:05'),
(2, 149, 581, '2026-04-06 10:25:05'),
(3, 150, 372, '2026-04-06 10:25:05'),
(4, 151, 601, '2026-04-06 10:25:05'),
(5, 152, 601, '2026-04-06 10:25:05'),
(6, 153, 601, '2026-04-06 10:25:05'),
(7, 160, 203, '2026-04-06 10:25:05'),
(8, 161, 238, '2026-04-06 10:25:05'),
(9, 162, 203, '2026-04-06 10:25:05'),
(10, 163, 238, '2026-04-06 10:25:05'),
(11, 164, 143, '2026-04-06 10:25:05'),
(12, 165, 238, '2026-04-06 10:25:05'),
(13, 166, 238, '2026-04-06 10:25:05'),
(14, 167, 238, '2026-04-06 10:25:05'),
(15, 169, 238, '2026-04-06 10:25:05'),
(16, 171, 238, '2026-04-06 10:25:05'),
(17, 172, 238, '2026-04-06 10:25:05'),
(18, 173, 238, '2026-04-06 10:25:05'),
(19, 177, 238, '2026-04-06 10:25:05'),
(20, 182, 601, '2026-04-06 10:25:05'),
(21, 184, 125, '2026-04-06 10:25:05'),
(22, 185, 108, '2026-04-06 10:25:05'),
(23, 186, 125, '2026-04-06 10:25:05'),
(24, 187, 125, '2026-04-06 10:25:05'),
(25, 189, 125, '2026-04-06 10:25:05'),
(26, 190, 601, '2026-04-06 10:25:05'),
(27, 195, 363, '2026-04-06 10:25:05'),
(28, 196, 363, '2026-04-06 10:25:05'),
(29, 197, 363, '2026-04-06 10:25:05'),
(30, 198, 363, '2026-04-06 10:25:05'),
(31, 199, 601, '2026-04-06 10:25:05'),
(32, 201, 188, '2026-04-06 10:25:05'),
(33, 202, 601, '2026-04-06 10:25:05'),
(34, 203, 601, '2026-04-06 10:25:05'),
(35, 204, 125, '2026-04-06 10:25:06'),
(36, 205, 601, '2026-04-06 10:25:06'),
(37, 206, 125, '2026-04-06 10:25:06'),
(38, 207, 601, '2026-04-06 10:25:06'),
(39, 208, 238, '2026-04-06 10:25:06'),
(40, 209, 238, '2026-04-06 10:25:06'),
(41, 211, 238, '2026-04-06 10:25:06'),
(42, 212, 143, '2026-04-06 10:25:06'),
(43, 214, 238, '2026-04-06 10:25:06'),
(44, 220, 238, '2026-04-06 10:25:06'),
(45, 221, 238, '2026-04-06 10:25:06'),
(46, 222, 238, '2026-04-06 10:25:06'),
(47, 223, 238, '2026-04-06 10:25:06'),
(48, 224, 170, '2026-04-06 10:25:06'),
(49, 225, 238, '2026-04-06 10:25:06'),
(50, 226, 238, '2026-04-06 10:25:06'),
(51, 227, 238, '2026-04-06 10:25:06'),
(52, 228, 238, '2026-04-06 10:25:06'),
(53, 229, 238, '2026-04-06 10:25:06'),
(54, 230, 143, '2026-04-06 10:25:06'),
(55, 231, 143, '2026-04-06 10:25:06'),
(56, 232, 601, '2026-04-06 10:25:06'),
(57, 233, 426, '2026-04-06 10:25:06'),
(58, 234, 238, '2026-04-06 10:25:06'),
(59, 235, 426, '2026-04-06 10:25:06'),
(60, 236, 238, '2026-04-06 10:25:06'),
(61, 237, 238, '2026-04-06 10:25:06'),
(62, 238, 238, '2026-04-06 10:25:06'),
(63, 239, 238, '2026-04-06 10:25:06'),
(64, 242, 601, '2026-04-06 10:25:06'),
(65, 243, 601, '2026-04-06 10:25:06'),
(66, 244, 601, '2026-04-06 10:25:06'),
(67, 250, 302, '2026-04-06 10:25:06'),
(68, 251, 125, '2026-04-06 10:25:06'),
(69, 263, 125, '2026-04-06 10:25:06'),
(70, 264, 143, '2026-04-06 10:25:06'),
(71, 265, 238, '2026-04-06 10:25:06'),
(72, 266, 143, '2026-04-06 10:25:06'),
(73, 616, 238, '2026-04-06 10:25:06'),
(74, 670, 157, '2026-04-06 10:25:06'),
(75, 156, 64, '2026-04-06 10:25:05'),
(76, 157, 64, '2026-04-06 10:25:05'),
(77, 158, 64, '2026-04-06 10:25:05'),
(78, 159, 64, '2026-04-06 10:25:05'),
(79, 168, 135, '2026-04-06 10:25:05'),
(80, 176, 64, '2026-04-06 10:25:05'),
(81, 191, 64, '2026-04-06 10:25:05'),
(82, 192, 64, '2026-04-06 10:25:05'),
(83, 193, 64, '2026-04-06 10:25:05'),
(84, 194, 64, '2026-04-06 10:25:05'),
(85, 215, 64, '2026-04-06 10:25:06'),
(86, 216, 64, '2026-04-06 10:25:06'),
(87, 217, 64, '2026-04-06 10:25:06'),
(88, 218, 64, '2026-04-06 10:25:06'),
(89, 246, 60, '2026-04-06 10:25:06'),
(90, 260, 64, '2026-04-06 10:25:06'),
(91, 268, 64, '2026-04-06 10:25:06'),
(92, 269, 64, '2026-04-06 10:25:06'),
(93, 627, 72, '2026-04-06 10:25:06'),
(94, 252, 157, '2026-04-06 10:25:06'),
(95, 270, 214, '2026-04-06 10:25:06'),
(96, 735, 62, '2026-04-06 10:25:06'),
(97, 748, 137, '2026-04-06 10:25:06'),
(98, 219, 122, '2026-04-06 10:25:06'),
(99, 813, 58, '2026-04-06 10:25:06'),
(100, 340, 486, '2026-04-06 10:25:06'),
(101, 836, 57, '2026-04-06 10:25:06'),
(102, 1178, 57, '2026-04-06 10:25:06'),
(103, 1088, 191, '2026-04-06 10:25:06'),
(104, 1322, 228, '2026-04-06 10:25:06'),
(105, 1347, 52, '2026-04-06 10:25:06'),
(106, 1567, 213, '2026-04-06 10:25:06'),
(107, 1569, 48, '2026-04-06 10:25:06'),
(108, 629, 43, '2026-04-06 10:25:06'),
(109, 1656, 191, '2026-04-06 10:25:06'),
(110, 1006, 76, '2026-04-06 10:25:06'),
(111, 1730, 113, '2026-04-06 10:25:06'),
(112, 1733, 63, '2026-04-06 10:25:06'),
(113, 1857, 164, '2026-04-06 10:25:06'),
(114, 860, 30, '2026-04-06 10:25:06'),
(115, 1697, 28, '2026-04-06 10:25:06'),
(116, 2000, 27, '2026-04-06 10:25:06'),
(117, 1572, 11, '2026-04-06 10:25:06'),
(118, 1542, 99, '2026-04-06 10:25:06'),
(119, 1980, 18, '2026-04-06 10:25:06'),
(120, 1999, 18, '2026-04-06 10:25:06'),
(121, 2054, 153, '2026-04-06 10:25:06'),
(122, 1677, 11, '2026-04-06 10:25:06');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `banner_id` int NOT NULL,
  `banner_name` varchar(50) NOT NULL,
  `banner_url` varchar(250) NOT NULL DEFAULT 'addmagpro.com',
  `banner_image` text NOT NULL,
  `type` enum('MainSlider','Banner') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`banner_id`, `banner_name`, `banner_url`, `banner_image`, `type`, `created_at`) VALUES
(16, 'mainslider1', 'https://www.addmagpro.com/services_list', 'assets/banner_images/684bcc085f5d2.main AD Banners.png', 'MainSlider', '2025-06-13 06:58:16'),
(17, 'mainslider2', 'https://addmagpro.com/products_grid_view/53', 'assets/banner_images/6656fa35a4849.main_banner2.png', 'MainSlider', '2024-08-12 07:45:11'),
(18, 'mainslider3', 'https://www.addmagpro.com/products_list', 'assets/banner_images/665733717e5f7.1.png', 'MainSlider', '2024-08-11 06:53:25'),
(19, 'mainslider4', 'https://www.addmagpro.com/welcome_page', 'assets/banner_images/66422901440ac.server_mainslider4.png', 'MainSlider', '2024-08-11 06:56:37'),
(20, 'mainslider5', 'https://www.addmagpro.com/products_grid_view/39', 'assets/banner_images/6642291671991.server_mainslider5.png', 'MainSlider', '2024-08-11 06:53:54'),
(22, 'banner1', 'https://www.addmagpro.com/products_grid_view/39', 'assets/banner_images/67fe00d09082f.Purple and Pink Bold Business LinkedIn Article Cover Image.png', 'Banner', '2025-04-15 06:46:40'),
(23, 'banner2', 'https://www.addmagpro.com/index', 'assets/banner_images/665734b52bd35.discounts poster.png', 'Banner', '2024-08-09 09:12:31'),
(24, 'banner3', 'https://addmagpro.com/products_list', 'assets/banner_images/66600c0b407f7.luxury AD Banners.png', 'Banner', '2024-08-12 07:46:29'),
(25, 'banner4', 'https://addmagpro.com/products_list', 'assets/banner_images/666010aaa3935.electronic AD Banners.png', 'Banner', '2024-08-12 07:46:16');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `vendor_id` int NOT NULL,
  `ImageURL` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `vendor_id`, `ImageURL`, `created_at`) VALUES
(15, 'Samsung', 10, 'assets/vendor_assets/brand_images_admin/66273ec1c0b31.samsung_brand.png', '2024-04-23 04:53:30'),
(16, 'Iphone', 10, 'assets/vendor_assets/brand_images_admin/662231338e87b.iphone_brand.png', '2024-04-19 08:54:11'),
(17, 'Iqoo', 10, 'assets/vendor_assets/brand_images_admin/662757a877d36.iqoo_z6.jpeg', '2024-04-23 06:39:36'),
(18, 'Redmi', 10, 'assets/vendor_assets/brand_images_admin/6627587263758.redmi_k50.jpeg', '2024-04-23 06:42:58'),
(19, 'Boat', 10, 'assets/vendor_assets/brand_images_admin/66275db196970.boat.jpeg', '2024-04-23 07:05:21'),
(20, 'Haier', 10, 'assets/vendor_assets/brand_images_admin/66275f8f4b3c8.haier.png', '2024-04-23 07:13:19'),
(21, 'Godrej', 10, 'assets/vendor_assets/brand_images_admin/66275fa7d8073.godrej.jpeg', '2024-04-23 07:13:43'),
(22, 'Interior', 10, 'assets/vendor_assets/brand_images_admin/6627627132d9a.interior.png', '2024-04-23 07:25:37'),
(23, 'Samsung', 10, 'assets/vendor_assets/brand_images_admin/663716932b06f.ac_service.jpeg', '2024-05-05 05:18:11'),
(24, 'Samsung', 28, 'assets/vendor_assets/brand_images/28/6656c9b027f4d.samsung_brand.png', '2024-05-29 06:22:40'),
(25, 'Samsung', 36, 'assets/vendor_assets/brand_images/36/6656f7be97197.samsung_brand.png', '2024-05-29 09:39:10'),
(32, 'BENFITS', 37, 'assets/vendor_assets/brand_images/37/665807af69943.HEALTH N WELLNES.png', '2024-05-30 04:59:27'),
(33, 'LIC', 38, 'assets/vendor_assets/brand_images/38/66580af067af1.4.png', '2024-05-30 05:13:20'),
(34, 'Samsung', 35, 'assets/vendor_assets/brand_images/35/66585464b9069.samsung_brand.png', '2024-05-30 10:26:44'),
(35, 'CARE HEALTH', 38, 'assets/vendor_assets/brand_images/38/66585ae5f1cb8.3.png', '2024-05-30 10:54:30'),
(36, 'GENARAL INSURENCE', 38, 'assets/vendor_assets/brand_images/38/66585b216f0d0.2.png', '2024-05-30 10:55:29'),
(37, 'TOUR', 37, 'assets/vendor_assets/brand_images/37/66588d9235602.Trours & Travels.png', '2024-05-30 14:30:42'),
(38, 'PERSONAL CARE', 37, 'assets/vendor_assets/brand_images/37/6658a0135b1a8.Beauty.png', '2024-05-30 15:49:39'),
(39, 'BIOENERGY Products', 37, 'assets/vendor_assets/brand_images/37/6658a03db5b53.bioenergy products.png', '2024-05-30 15:50:21'),
(41, 'Fashion', 37, 'assets/vendor_assets/brand_images/37/6658a24412f13.Fashion.png', '2024-05-30 15:59:00'),
(43, 'Grocery', 37, 'assets/vendor_assets/brand_images/37/6658a2e542d7a.Grocery.png', '2024-05-30 16:01:41'),
(46, 'Advertisments', 37, 'assets/vendor_assets/brand_images/37/6658a364bc874.Advertisments.png', '2024-05-30 16:03:48'),
(47, 'BOOKS', 40, 'assets/vendor_assets/brand_images/40/6661776ee102c.11.png', '2024-06-06 08:46:38'),
(48, 'RAYE HEALTH SCIENCES', 41, 'assets/vendor_assets/brand_images/41/66619e842ec15.RAYE HEALTH.png', '2024-06-06 11:33:24'),
(51, 'indipunkstreets', 37, 'assets/vendor_assets/brand_images/37/6672bcef306e7.indipunk.png', '2024-06-19 11:11:43'),
(52, 'SAREES', 37, 'assets/vendor_assets/brand_images/37/667a4a96be656.23.jpg', '2024-06-25 04:41:58'),
(53, 'PARVATHI SAREE HOUSE', 42, 'assets/vendor_assets/brand_images/42/667a5ea90c630.29.jpg', '2024-06-25 06:07:37'),
(56, 'CONTRY CLUB', 43, 'assets/vendor_assets/brand_images/43/667b8e7f7228e.cc2.jpeg', '2024-06-26 03:43:59'),
(57, 'CARDS', 45, 'assets/vendor_assets/brand_images/45/667bf52ce29f6.2.png', '2024-06-26 11:02:04'),
(59, 'TRAVEL', 44, 'assets/vendor_assets/brand_images/44/667eebdba3628.TRAVELS.png', '2024-06-28 16:59:07'),
(61, 'EZYKLE', 46, 'assets/vendor_assets/brand_images/46/667fdd1deaa9b.EZykle vendor.png', '2024-06-29 10:08:29'),
(66, 'BENEFIT PLUS', 48, 'assets/vendor_assets/brand_images/48/668d4fb26a105.BENEFIT PLUS.jpg', '2024-07-09 14:56:50'),
(67, 'TIRANGA', 49, 'assets/vendor_assets/brand_images/49/6697751c203be.Epic_1.jpg', '2024-07-17 07:39:08'),
(68, 'MAC', 49, 'assets/vendor_assets/brand_images/49/669788c5c3293.mac impact.webp', '2024-07-17 09:03:01'),
(69, 'CALENDER', 37, 'assets/vendor_assets/brand_images/37/6697a8c24525f.1.png', '2024-07-17 11:19:30'),
(71, 'ADDMAGPRO APP INSIDE DISPLAY ADS', 37, 'assets/vendor_assets/brand_images/37/6697adca6ff2c.furnitur.jpg', '2024-07-17 11:40:58'),
(72, 'DAIRY', 37, 'assets/vendor_assets/brand_images/37/6697b12f4b30a.Black-A5-2025.jpg', '2024-07-17 11:55:27'),
(73, 'AYURVEDA', 50, 'assets/vendor_assets/brand_images/50/66b0f2ecad842.39.png', '2024-08-05 15:42:36'),
(74, 'Insurance', 54, 'assets/vendor_assets/brand_images/54/66b6dcfae6ebe.product-jpeg.jpg', '2024-08-10 03:22:34'),
(75, 'HOMECARE', 37, 'assets/vendor_assets/brand_images/37/66b9e48b03af0.download.jpg', '2024-08-12 10:31:39'),
(79, 'Academic Education', 55, 'assets/vendor_assets/brand_images/55/66bb0f4225924.6.jpg', '2024-08-13 07:46:10'),
(80, 'Competitive Education', 55, 'assets/vendor_assets/brand_images/55/66bb0f609d6be.7.jpg', '2024-08-13 07:46:40'),
(81, 'IT Education', 55, 'assets/vendor_assets/brand_images/55/66bb0f7a129a2.8.jpg', '2024-08-13 07:47:06'),
(82, 'Non IT Education', 55, 'assets/vendor_assets/brand_images/55/66bb0f8fcd1b4.9.jpg', '2024-08-13 07:47:27'),
(83, 'Special Education', 55, 'assets/vendor_assets/brand_images/55/66bb0fa41fa4f.10.jpg', '2024-08-13 07:47:48'),
(84, 'GROCERY', 56, 'assets/vendor_assets/brand_images/56/66f79caa5d8b3.Grocery.jpg', '2024-09-28 06:05:30'),
(85, 'HOME CARE', 56, 'assets/vendor_assets/brand_images/56/66f79d008d9f0.blog-homecare-14-12-2022-691340_l.png', '2024-09-28 06:06:56'),
(86, 'PERSONAL CARE', 56, 'assets/vendor_assets/brand_images/56/66f79d2f72a70.depositphotos_126693854-stock-photo-set-of-body-care-products.jpg', '2024-09-28 06:07:43'),
(91, 'Rs 1050/- JOINING KIT', 37, 'assets/vendor_assets/brand_images/37/67322157c708f.2.png', '2024-11-11 15:23:03'),
(92, '3000/-  GROCERY KIT', 37, 'assets/vendor_assets/brand_images/37/67324bf77a97e.1.png', '2024-11-11 18:24:55'),
(93, 'BULK WHATSAPP SINGLE', 57, 'assets/vendor_assets/brand_images/57/674ac97b3807d.6749df5db413c.031-copy.webp', '2024-11-30 08:14:51'),
(94, 'WHATSAPP BUTTON SENDER', 57, 'assets/vendor_assets/brand_images/57/674ac9a1c3dae.6749dfce5b61a.041-copy-1-300x300~2.jpg', '2024-11-30 08:15:29'),
(95, 'Print and More', 37, 'assets/vendor_assets/brand_images/37/674acc7f2bb3e.Print and More.png', '2024-11-30 08:27:43'),
(96, 'DEMO TENTS', 59, 'assets/vendor_assets/brand_images/59/674ddb4f1f36c.Print and More.png', '2024-12-02 16:07:43'),
(97, 'Haniis Specialized', 60, 'assets/vendor_assets/brand_images/60/675dba6e5f50e.Specialized.png', '2024-12-14 17:03:42'),
(98, 'HOME APPLIANCES', 37, 'assets/vendor_assets/brand_images/37/67a3047ff3e85.Home-Appliance-Background-PNG.png', '2025-02-05 06:26:08');

-- --------------------------------------------------------

--
-- Table structure for table `business_listing_users`
--

CREATE TABLE `business_listing_users` (
  `user_id` int NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `service_user_id` int NOT NULL,
  `member_phone` varchar(13) NOT NULL,
  `password` text NOT NULL,
  `pan_number` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `state` varchar(30) NOT NULL,
  `district` varchar(30) NOT NULL,
  `pincode` int NOT NULL,
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `description` text NOT NULL,
  `profession` varchar(20) NOT NULL,
  `coupon_code` varchar(20) DEFAULT NULL,
  `business_image` text NOT NULL,
  `bank_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cumulative_gross` varchar(20) NOT NULL,
  `commission_percentage` int NOT NULL,
  `account_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `business_listing_type` int NOT NULL COMMENT '0:service 1:store 2:classified',
  `currency` varchar(20) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `enrolled_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0:inactive 1:active',
  `referral_id` varchar(20) NOT NULL,
  `referral_by` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `business_listing_users`
--

INSERT INTO `business_listing_users` (`user_id`, `member_name`, `service_user_id`, `member_phone`, `password`, `pan_number`, `address`, `state`, `district`, `pincode`, `location`, `description`, `profession`, `coupon_code`, `business_image`, `bank_name`, `cumulative_gross`, `commission_percentage`, `account_number`, `business_listing_type`, `currency`, `payment_status`, `payment_method`, `enrolled_date`, `status`, `referral_id`, `referral_by`, `created_at`) VALUES
(28, 'K KISHAN RAO', 252, '9490534100', '$2y$10$//1alrEMoCeNaWvihwUSZ.yFPFxveA71U6mf7tLzSUT5VjSqKV/1m', 'AFWPK8546E', 'WARANGAL', 'Telangana', '19', 505468, '', '', '22', NULL, 'assets/business_listing_images/6656b541c581b.kishanrao.jpeg', 'HDFC', '0', 8, '2236110000054', 0, '', '', '', '2024-07-27 07:12:40', '1', '9490534100', '7730099707', '0000-00-00 00:00:00'),
(33, 'Nerella Ramesh', 429, '9948541315', '$2y$10$xqwF95nUsszeRvnnr7V0i.H48dREvwoA661c2IumlUPa4DYyobrHK', 'AP0PN2963E', 'Hanamkonda', 'Telangana', 'Warangal (Rural)', 506001, 'Hanamkonda', 'All type of groceries are Available', '87', NULL, 'assets/business_listing_images/6684e3a47f67c.WhatsApp Image 2024-07-02 at 9.50.16 PM.jpeg', 'HDFC', '0', 8, '50100054958702', 1, 'INR', 'captured', 'RazorPay', '2024-07-03 06:04:12', '1', '9948541315', '7702381784', '0000-00-00 00:00:00'),
(34, 'MOHAMMAAD SHAKIL', 268, '9949954792', '$2y$10$LV8FZsbxqwZXeeWoTyr7.ejDHxhOqboNs/JiWQxtZucsx0HQcbUSy', 'ARFPV7413A', 'Hyderabad', 'Telangana', 'Hyderabad', 500032, 'MADHURANAGAR', 'PANSHOP', '66', NULL, 'assets/business_listing_images/66850a5b32b16.WhatsApp Image 2024-07-03 at 13.45.56 (1).jpeg', 'ICICI', '0', 8, '111101515304', 1, 'INR', 'captured', 'RazorPay', '2024-07-03 08:24:43', '1', '9949954792', '8341236520', '0000-00-00 00:00:00'),
(35, 'PORIKA VIJAY KUMAR', 441, '9849158487', '$2y$10$MUMGj4v7r/6I4RdBh8okDeZ78LF5flsIzqaqlLq17xRSQJ2Nq1gh.', 'FOQPB2007K', 'WARANGAL', 'Telangana', 'Warangal (Urban)', 506001, 'HANAMAKONDA', 'LIC DEVELOPMENT OFFICER', '73', NULL, 'assets/business_listing_images/6686a6c800f86.vijay.jpeg', 'SBI', '0', 8, '62447191370', 0, 'INR', 'captured', 'RazorPay', '2024-07-04 13:43:06', '1', '9849158487', '7730099707', '0000-00-00 00:00:00'),
(36, 'AVM SATYANARAYANA', 250, '8019592844', '$2y$10$kcwzxNS6WgOrFIgfG5.yFeuKV7uLTKhh0JMnlZuufG8WXobtjp2VO', 'AEVPA5076R', 'HYDERABAD', 'Telangana', 'Hyderabad', 500085, 'KPHB KUKATPALLY', 'REAL ESTATE', '108', NULL, 'assets/business_listing_images/6688e6bdcfb67.avm.jpeg', 'SBI', '0', 8, '52002010363', 0, 'INR', 'captured', 'RazorPay', '2024-07-06 06:41:15', '1', '8019592844', '7730099707', '0000-00-00 00:00:00'),
(37, 'K SRNIVAS', 461, '9177958146', '$2y$10$P/aVq/pB91EMVuPPoCPoyuSKesNyb69pkTOTgOAXB.6tI7dermUXq', 'GKQPK1943A', 'HUZURABAD', 'Telangana', 'Karimnagar', 505468, 'HUZURABAD', 'MARKETING', '83', NULL, 'assets/business_listing_images/6688eb849f045.SRINU.jpeg', 'INDIAN BANK', '0', 8, '6587204887', 0, 'INR', 'captured', 'RazorPay', '2024-07-06 07:00:44', '1', '9177958146', '7702381784', '0000-00-00 00:00:00'),
(38, 'THOUTAM MARKANDEYA', 155, '9381477148', '$2y$10$IQwayudj8ESVp7YrxZN2xeE9oERQH5Ch97Ay8cpuCpqgWqQxopXiK', 'AEJPT9698E', 'WARANGAL', 'Telangana', 'Warangal (Urban)', 506002, 'WARANGAL', 'MARRIAGE BEAURO', '57', NULL, 'assets/business_listing_images/66891de8d46f7.markandeya.jpeg', 'CANARA BANK', '0', 8, '0621101052064', 1, 'INR', 'captured', 'RazorPay', '2024-07-06 10:35:47', '1', '9381477148', '7702381784', '0000-00-00 00:00:00'),
(39, 'anand', 482, '9347619484', '$2y$10$8ZrkAG8B95mNMULmMJAnrunZq6UYy8PYE14TXFIBDmin2DlRatzN.', 'agypn3448f', 'hyderabad', 'Telangana', 'Medchal–Malkajgiri', 500085, 'nizampet', 'we are leading loan n insurance providers from DSA through all Banks', '30', NULL, 'assets/business_listing_images/6689e9d1b5d9c.Screenshot 2024-04-21 112529.png', 'kvb', '0', 8, '4802155000003733', 1, 'INR', 'captured', 'RazorPay', '2024-07-18 04:40:50', '1', '9347619484', 'admin', '0000-00-00 00:00:00'),
(40, 'Gongidi Narsimhulu', 486, '9573115806', '$2y$10$KpN4m9F9z3na4i6O7z.mxujxWLHQUZIY00Dv5Vl1m76bHTtRDnkyW', 'CHXPG3467M', 'Jangaon', 'Telangana', 'Jangaon', 506167, 'Jangaon', 'Hi am very happy', '72', NULL, 'assets/business_listing_images/668a067bbad87.1000038193.jpg', 'State Bank of India', '0', 8, '62302449861', 0, 'INR', 'captured', 'RazorPay', '2024-07-07 03:07:42', '0', '9573115806', '7702381784', '0000-00-00 00:00:00'),
(41, 'ASHOK E', 488, '6302159932', '$2y$10$P1a9XUiwTrjRz7NDHhyA4.pQNzeQQ3PMpcjPMf0iw.hkJOe2K9HpC', 'CYOPA3335C', 'Mahbubnagar', 'Telangana', 'Narayanpet', 509205, 'Mahbubnagar', 'Ghbn', '42', NULL, 'assets/business_listing_images/668a695caa213.1000017744.jpg', 'SBI', '0', 8, '62142101880', 0, 'INR', 'captured', 'RazorPay', '2024-07-07 10:11:25', '1', '6302159932', 'admin', '0000-00-00 00:00:00'),
(42, 'I SATYANARAYANA', 497, '9293238677', '$2y$10$NnGr0q/A6oJEwEnhD0y3pupnCVfhrDJM8Z3RpZtO.uoezYj0Z4x6e', 'BGTPS1651K', 'bhimavaram', 'Andhra pradesh', 'West Godavari (Eluru)', 534235, 'bhimavaram', 'We provide all types of Online Services- BUS/Train/Flight Ticket booking,HOTEL booking, PAN CARD, CAR/BYKE Insurence,Star Health insurence, Online shopping,,etc', '81', NULL, 'assets/business_listing_images/668aa1be6ee86.Shitikantha Onlines.jpg', 'CANARA BANK', '0', 8, '2775101001364', 1, 'INR', 'captured', 'RazorPay', '2024-07-18 04:39:04', '1', '9293238677', 'admin', '0000-00-00 00:00:00'),
(43, 'Kuruba govindarajulu', 503, '9390485997', '$2y$10$Z7GEYVx7LF6z8jQqGZhuu.z1ZcC/7Y0O3EQcIhIFAuwcDdHCUhX3e', 'BCLPK4017R', 'R.c.puram', 'Telangana', 'Sangareddy', 502032, 'Srinivas nagar colony .R C.puram', 'Flex visiting cards Facebook ads', '66', NULL, 'assets/business_listing_images/668bbe4335695.IMG_20240708_155202.jpg', 'Hsbc bank', '0', 8, '082575333006', 0, 'INR', 'captured', 'RazorPay', '2024-07-10 05:57:11', '1', '9390485997', 'admin', '0000-00-00 00:00:00'),
(44, 'SRINIVASA RAO', 505, '9000787596', '$2y$10$G/myHM2kbqAjPMnCnZ7DRO47.5xIewY4HcHP5WU4X8dIrV.mTse4O', 'BFCPS7073F', 'Beeramguda hyd', 'Telangana', 'Hyderabad', 502032, 'BEERAMGUDA', 'MARKETING', '83', NULL, 'assets/business_listing_images/668c1548cefe8.b srinivas.jpeg', 'UNION BANK', '0', 8, '052110100056185', 0, 'INR', 'captured', 'RazorPay', '2024-07-08 17:02:13', '1', '9000787596', 'admin', '0000-00-00 00:00:00'),
(45, 'PRASADA RAO G', 230, '9291290683', '$2y$10$b9Y8jNM2oEhcBy1z2ZDlFO1M2SITbXpRfhJl5Aw/wCF6I3pCt9rae', 'BGSPG6560L', 'GUNTUR', 'Andhra Pradesh', 'Guntur', 522001, 'OLD GUNTUR', 'MARKETING', '83', NULL, 'assets/business_listing_images/668fe338b8315.WhatsApp Image 2024-07-11 at 19.09.44.jpeg', 'SBI', '0', 8, '31286669644', 0, 'INR', 'captured', 'RazorPay', '2024-07-11 13:51:29', '1', '9291290683', '9246484468', '0000-00-00 00:00:00'),
(46, 'AKula Venkateswarlu', 536, '9866089575', '$2y$10$j3U1Txjmov5Jk7O83ZqZjeN4c5GCi2Tf5JeqiAwXb9J.8tl9JPVJK', 'ATCPA4276F', 'Bhadrachalam', 'Telangana', 'Bhadradri Kothagudem', 507111, 'Bhadrachalam', 'Marketing', '83', NULL, 'assets/business_listing_images/6693999ccc16f.IMG_20240714_144618.jpg', 'SBI', '0', 8, '62242485454', 0, 'INR', 'captured', 'RazorPay', '2024-07-14 09:37:04', '1', '9866089575', '7702381784', '0000-00-00 00:00:00'),
(47, 'N RAMAKRISHNA', 537, '9848905979', '$2y$10$n9pHxVg3REgvrPUdKGwP1OdhGbfvP8I.NUC0eGPSpfsti6q5lKJ6m', 'AIXPN7358K', 'Bhadrachalam', 'Telangana', 'Bhadradri Kothagudem', 507111, 'Bhadrachalam', 'Marketing', '83', NULL, 'assets/business_listing_images/66939bb484422.Screenshot_20240714-145759_WhatsApp.jpg', 'SBI', '0', 8, '30138319110', 0, 'INR', 'captured', 'RazorPay', '2024-07-14 09:36:50', '1', '9848905979', '9866089575', '0000-00-00 00:00:00'),
(48, 'S vijay kumar', 491, '9685950793', '$2y$10$CFc2KUbz1kYVN7wm3su65.obkW73qf./GIM6vKbcrHO32nDDyo03u', 'BLIPK7261H', 'Raipur', 'Telangana', 'Hyderabad', 500050, 'CHANDANAGAR', 'MEMORY TRAINER', '9', NULL, 'assets/business_listing_images/6694d64e30488.vijay.jpeg', 'ESAF SMALL FINANCE BANK', '0', 8, '50190008063719', 0, 'INR', 'captured', 'RazorPay', '2024-07-15 07:57:39', '1', '9685950793', 'admin', '0000-00-00 00:00:00'),
(49, 'Kommu.Mohan rao', 554, '8985379195', '$2y$10$cRIGkrghmdYhzm7WbEUVC.RWG4WfdMG7ReSFLrkoVn/MiL/dPBfM2', 'BLPPK4429L', 'Bhadrachalam', 'Telangana', 'Bhadradri Kothagudem', 507111, 'Bhadrachalam', 'Wellness Entrepreneur,(Health & Wellness products) financial Advisor at SBI Life,&Star Health insurance', '83', NULL, 'assets/business_listing_images/669a30cde94b0.1000332578.png', 'State Bank of India', '0', 8, '33318178253', 0, 'INR', 'captured', 'RazorPay', '2024-07-19 16:26:48', '1', '8985379195', '9866089575', '0000-00-00 00:00:00'),
(50, 'KANUKUNTLA RAJENDER', 248, '9014858329', '$2y$10$yUv5EuAWCdh.3adz6OLd2umIqJMVHcyYYH5S4d87JvyLNiYnW0QjS', 'AQRPK3717H', 'HYDERABAD', 'Telangana', 'Hyderabad', 500043, 'BOURAMPET HYD', 'PLOTS SALES', '103', NULL, 'assets/business_listing_images/669a8cfe18602.RAJENDER.jpeg', 'PUNJAB NATIONAL BANK', '0', 8, '4632000100029023', 0, 'INR', 'captured', 'RazorPay', '2024-07-19 16:26:20', '1', '9014858329', '7730099707', '0000-00-00 00:00:00'),
(51, 'P LAXMANASWAMY', 247, '8919793099', '$2y$10$92xTxH2uZ0CdHaDTmzOBq.BbjOC6v7KmW5ORJ0N9s/9FygOduiOhG', 'ANSPP69M', 'HYDERABAD', 'Telangana', 'Hyderabad', 500018, 'BORABANDA HYD', 'ACCUPUNTURE', '23', NULL, 'assets/business_listing_images/669a8f354576c.LAXMANASWAMY.png', 'INDIAN BANK', '0', 8, '6959297827', 0, 'INR', 'captured', 'RazorPay', '2024-07-19 16:26:33', '1', '8919793099', '7730099707', '0000-00-00 00:00:00'),
(52, 'S RAJA RAO', 257, '9642190501', '$2y$10$ROGaHyJoZmk5kgMwyqooUOYSYa.Hehzlfjbt4dyOeUluJhOOwz8Hi', 'CBQPR4461P', 'GUNTUR', 'Andhra Pradesh', 'Prakasam (Ongole)', 523316, 'MARKAPUR', 'TUTIONS', '126', NULL, 'assets/business_listing_images/669a936b03e91.rajarao.png', 'UNION BANK', '0', 8, '763502010000336', 0, 'INR', 'captured', 'RazorPay', '2024-07-19 16:26:41', '1', '9642190501', '7730099707', '0000-00-00 00:00:00'),
(53, 'SYAM RAJSHEKAR', 170, '9553396070', '$2y$10$y8sYgqb.fVoFnscZHzamQe7gXrtltV5JDNlMG3mpUEyEeNVyfDKMi', 'AJTPC9470C', 'KHAMMAM', 'Telangana', 'Khammam', 507002, 'KHAMMAM', 'ADVOCATE', '15', NULL, 'assets/business_listing_images/669a9ad534192.SYAM R.jpeg', 'INDIAN OVERSEAS BANK', '0', 8, '352701000004550', 0, 'INR', 'captured', 'RazorPay', '2024-07-19 16:57:05', '1', '9553396070', '7702381784', '0000-00-00 00:00:00'),
(54, 'K V N VIKRAM', 560, '9989145115', '$2y$10$x1kP9cZwSHJvHAe5z7XwRew3n9B1YQ.L2GQ86kpFR98wSLvXG5hoy', 'AENPV6824N', 'Hyderabad', 'Telangana', 'Hyderabad', 500061, 'PADMARAONAGAR HYD', 'ALL TYPES OF LOANS', '98', NULL, 'assets/business_listing_images/669b635c85919.vikram.jpeg', 'UNION BANK', '0', 8, '003110027001254', 0, 'INR', 'captured', 'RazorPay', '2024-07-20 07:12:56', '1', '9989145115', '7702381784', '0000-00-00 00:00:00'),
(55, 'G.SATHISH REDDY', 440, '9700345863', '$2y$10$TIM/kfPx/bPpxwhuBbb.ZepHbmHe9mwJedYuTFTbI7B/oyNeGxtLy', 'AYOPG1890L', 'HANAMAKONDA', 'Telangana', 'Warangal (Urban)', 506001, 'HANAMAKONDA', 'OPTICAL HUB', '64', NULL, 'assets/business_listing_images/669b791bc31ba.WhatsApp Image 2024-07-20 at 05.08.21.jpeg', 'SBI', '0', 8, '20245208014', 1, 'INR', 'captured', 'RazorPay', '2024-07-20 08:56:09', '1', '9700345863', 'admin', '0000-00-00 00:00:00'),
(56, 'MUDANGULA SRINIVAS', 561, '9032224566', '$2y$10$MytqJxWtqpr.QVxAxxONBOfdee04ZoVlKdUTPWABqqnJXqw822/7y', 'ANYPM7279G', 'BORABANDA HYD', 'Telangana', 'Hyderabad', 500018, 'BORABANDA HYD', 'REAL ESTATE', '108', NULL, 'assets/business_listing_images/669b7a9ebe2d9.srinivas.png', 'IDBI', '0', 8, '1057104000155151', 0, 'INR', 'captured', 'RazorPay', '2024-07-20 08:56:02', '1', '9032224566', '7702381784', '0000-00-00 00:00:00'),
(57, 'M PRAKASH', 260, '8297818858', '$2y$10$iQpM8jNGhA4UzWkqpYlDEuwNVQZZs5p3TLeDbLwixC1BXA8axm/vS', 'AHVPM4589L', 'HYDERABAD', 'Telangana', 'Hyderabad', 500074, 'LB NAGAR', 'NETWORK MARKETING', '83', NULL, 'assets/business_listing_images/669b7b81ccc44.prakash.png', 'SBI', '0', 14, '20086127484', 0, 'INR', 'captured', 'RazorPay', '2024-07-20 08:56:14', '1', '8297818858', '9989225258', '0000-00-00 00:00:00'),
(58, 'Arvind Kumar Dundigalla', 566, '9885251200', '$2y$10$fINB0VAX.38EXGc5kGxCa.GXj.r33Kw07EZMo9BofQEofuKmKUwuu', 'ABVPD6510G', 'Ecil Hyderabad', 'Telangana', 'Hyderabad', 500062, 'Bhavani Nagar Colony Road 11-S kushaiguda Hyderabad', 'Deals in all kind of loans and also Real Estate', '71', NULL, 'assets/business_listing_images/7845432_home_loan.jpeg', 'State Bank Of India', '0', 8, '30063795502', 0, 'INR', 'captured', 'RazorPay', '2024-07-22 04:14:45', '1', '9885251200', '9989145115', '0000-00-00 00:00:00'),
(59, 'P V PRAVEEN KUMAR', 570, '9502714591', '$2y$10$H14Sn6og2PPAh06x3Fy6lOhw6qwbKTPrvvtqx7eZUJ0U0J/ThQWbG', 'BDOPP2598E', 'SAFILGUDA HYD', 'Telangana', 'Hyderabad', 500047, 'SAFILGUDA HYD', 'REAL ESTATE', '108', NULL, 'assets/business_listing_images/669ccee9d9ba4.PRAVEEN.jpeg', 'SBI', '0', 8, '42138065380', 0, 'INR', 'captured', 'RazorPay', '2024-07-21 09:04:11', '1', '9502714591', '7702381784', '0000-00-00 00:00:00'),
(60, 'Gugulothu Ravinaik', 572, '9493888949', '$2y$10$2XQK5MyQZmFbQV6OoHWdnelF2J3jTmSBHun3K66wJnnbnOsOuk95u', 'EFFPG9802A', 'Garakunta thanda', 'Telangana', '1', 508201, 'Garakunta thanda', 'Ok', '52', NULL, 'assets/business_listing_images/76886699_driver_image_service.jpeg', 'Sbi', '0', 8, '62251581893', 0, 'INR', 'captured', 'RazorPay', '2024-07-27 10:26:29', '1', '9493888949', '7702381784', '0000-00-00 00:00:00'),
(61, 'Satya', 562, '9642579000', '$2y$10$iLCLb1sfEIFZrP2tkVTq.O7eOuz96WANv1K8ofzSrSyCNo4x2mQY.', 'AUMPK7235P', 'Secunderabad', 'Telangana', 'Hyderabad', 500061, 'Secunderabad', 'SAVINGS ACCPUNT', '73', NULL, 'assets/business_listing_images/669fa6c165052.Satya - photo.jpg', 'HDFC', '0', 8, '50100434404321', 0, 'INR', 'captured', 'RazorPay', '2024-07-27 10:29:23', '1', '9642579000', 'admin', '0000-00-00 00:00:00'),
(62, 'GORE VIJAY KUMAR', 606, '7981872912', '$2y$10$MfBRJTLXJBKyYJU3KXbVHOwXYmnz8Eqv1Bu03xA0ptMBvK7TBeUha', 'AQRPG1245J', 'BEERAMGUDA', 'Telangana', 'Sangareddy', 502032, 'BEERAMGUDA HYD', 'REAL ESTATE', '108', NULL, 'assets/business_listing_images/66a1f20c9c0a2.vijaykumar.jpeg', 'SBI', '0', 8, '62147188336', 0, 'INR', 'captured', 'RazorPay', '2024-07-25 06:35:12', '1', '7981872912', 'admin', '0000-00-00 00:00:00'),
(63, 'Rakesh', 393, '9515932113', '$2y$10$UKzIaO0U4Iw3mWp8ZepdC.a490KKzWJCzER6snja.a/UwHW53UgBa', 'APOPN2963E', 'Hyd', 'Telangana', '473', 506001, 'HYDERABAD', 'catering', '36', NULL, 'assets/business_listing_images/66a4bab20dd5a.IMG-20230802-WA0034.jpg', 'HDFC', '0', 8, '50100054958702', 0, 'INR', 'captured', 'RazorPay', '2024-08-05 06:35:39', '1', '9515932113', '7207462300', '0000-00-00 00:00:00'),
(64, 'P VIJAY SEKHAR LIC POLICY', 201, '8106024624', '$2y$10$wWvFsyCq4X1kJIRVK2pczOVXOHlUeLs73U3bkfW1/KMzYW5glnJG.', 'AZGPP2196K', 'KHAMMAM', 'Telangana', '480', 507003, 'khammam', 'KODI PULAO and BIRYANI  Rs.69  Rs.99  Rs. 149', '51', NULL, 'assets/business_listing_images/66a62ef9f076c.Screenshot_20240728_170250.jpg', 'HDFC', '0', 8, '50100304027860', 1, 'INR', 'captured', 'RazorPay', '2024-08-05 06:35:43', '1', '8106024624', '8522881144', '0000-00-00 00:00:00'),
(65, 'Varaka Vishnu', 615, '8897124132', '$2y$10$FGu/c.JCrNee/tKu0AyWuu5wntsI1k1dDa79.rjEbLdgPxKn3SGIy', 'BMUPV5037K', 'Bhadrachalam', 'Telangana', '472', 507111, 'Bhadrachalam', 'Digi seva pay ,pan card services, passphotos , aadhar card downlond, aadhar utdate, voter id,', '96', NULL, 'assets/business_listing_images/66a65b6e3577a.VISHNU.jpg', 'STATE BANK OF INDIA', '0', 8, '34201429053', 0, 'INR', 'captured', 'RazorPay', '2024-08-05 06:35:50', '1', '8897124132', '8985379195', '0000-00-00 00:00:00'),
(66, 'dilip talluri', 616, '8121112228', '$2y$10$uM3Ovx7YakL0vkezdNzVK.zo9QFrBePzIPdjya22EWfaO8Mt/2k0y', 'AGGPT6882P', 'Khammam', 'Telangana', '480', 507002, 'Khammam city', 'I am an advocate at khammam city', '15', NULL, 'assets/business_listing_images/66a65b8db305f.Screenshot_20220104-110957_Facebook.jpg', 'HDFC', '0', 8, '50100406136081', 0, 'INR', 'captured', 'RazorPay', '2024-08-05 06:36:13', '1', '8121112228', '7674992736', '0000-00-00 00:00:00'),
(67, 'Anitha', 612, '7729058545', '$2y$10$emJEiAWq7sw.EvUC3UnX2.RvCxkTxACu9dDg0BhQQetBCM1BXiphG', 'EJZPK1897K', 'Hyderabad', 'Telangana', '473', 500061, 'SECUNDERABAD', 'GST', '67', NULL, 'assets/business_listing_images/66a9f59c99086.anitha.jpeg', 'TS CO OPERATIVE BANK APEX', '0', 8, '990800360013098', 0, 'INR', 'captured', 'RazorPay', '2024-08-05 06:36:04', '1', '7729058545', '9642579000', '0000-00-00 00:00:00'),
(68, 'D.V RAGHAVA RAO', 619, '9652239129', '$2y$10$d4mK779tHeAfGm8fZBKKTeNnU5awNjGZzQYpxxD8KcT1Anxo94NPW', 'AENPD5263K', 'CHIKKDAPALLY', 'Telangana', '473', 500020, 'CHIKKADAPALLY HYD', 'MARKETING', '83', NULL, 'assets/business_listing_images/66aa6d96db3aa.RAGHAVARAO 1.jpeg', 'UNION BANK', '0', 8, '007610011375929', 0, 'INR', 'captured', 'RazorPay', '2024-08-05 06:36:09', '1', '9652239129', 'admin', '0000-00-00 00:00:00'),
(69, 'KURRA ANITHA', 627, '6302822638', '$2y$10$w.vEVGYQTEqtAjXvTB8PiOL/V9WjQp3bEzNXg9YCsnJSligdJyS6S', 'DWPPK6102P', 'ECIL HYD', 'Telangana', '473', 500047, 'HYDERABAD', 'DAILY CHITS,    AND   GROUPS', '30', NULL, 'assets/business_listing_images/66ab92ac627a4.WhatsApp Image 2024-08-01 at 19.07.51.jpeg', 'CANARA BANK', '0', 8, '30462010189046', 1, 'INR', 'captured', 'RazorPay', '2024-08-16 05:08:16', '1', '6302822638', '7702381784', '0000-00-00 00:00:00'),
(70, 'Venugopala Chary Arroju', 640, '8121401401', '$2y$10$RK7Zn/qgbQ4ADEvag39WuuCB/3IjLMwrORrXVvlbO4RJS7khsg9Zu', 'AEVPA4209E', 'Boduppal', 'Telangana', '473', 500092, 'Boduppal', 'Out door Advertising', '14', NULL, 'assets/business_listing_images/66b06640aef41.1000507164.jpg', 'IDBI Bank', '0', 8, '0446104000144254', 0, 'INR', 'captured', 'RazorPay', '2024-08-05 06:35:54', '1', '8121401401', '8522881144', '0000-00-00 00:00:00'),
(71, 'ARUN RAJ DHARAMSUTH', 647, '9100234406', '$2y$10$/qNKAGAw2BONwDUjZby/ReLtr5F3O38gvTeT3dLGzuNlSj2uWwpiS', 'BJWPD3937K', 'Warangal', 'Telangana', '493', 506001, 'HANAMAKONDA', 'INSURENCE ADVISOR', '73', NULL, 'assets/business_listing_images/66b0a84f08085.WhatsApp Image 2024-08-05 at 15.46.26.jpeg', 'BANK OF BARODA', '0', 8, '42170100004586', 0, 'INR', 'captured', 'RazorPay', '2024-08-05 10:24:49', '1', '9100234406', '6302822638', '0000-00-00 00:00:00'),
(72, 'POILA CHITTI BABU', 629, '9491443072', '$2y$10$9NlFdBB0OB2IwcnYg8DQRurnH8ypOTjkyM23XTmVeAsXTXKfdAjpy', 'BIBP0810P', 'Hydrabad', 'Telangana', '473', 500047, 'THUKARAM GATE HYD', 'PERSONAL  LOANS', '98', NULL, 'assets/business_listing_images/66b0b752b4e27.WhatsApp Image 2024-08-05 at 16.04.59.jpeg', 'IDFC', '0', 8, '10175647487', 0, 'INR', 'captured', 'RazorPay', '2024-08-05 11:28:38', '1', '9491443072', '6302822638', '0000-00-00 00:00:00'),
(73, 'JILLA ANJANEYULU', 657, '9908396899', '$2y$10$rWmIsNs8XUDoM26TgjbUOOIhMbNfF/3dK9E5Kw0V/ih6MguubJ546', 'AHHPJ9473C', 'Hyderabad', 'Telangana', '473', 501301, 'NAGARAM HYD', 'LIC', '77', NULL, 'assets/business_listing_images/66b5be1c2411b.anjaneyulu.jpeg', 'INDIAN BANK', '0', 8, '6527272973', 0, 'INR', 'captured', 'RazorPay', '2024-08-09 06:59:05', '1', '9908396899', 'admin', '0000-00-00 00:00:00'),
(74, 'KURRA NARSIMHA', 628, '7075075689', '$2y$10$.JAro8ZMQqTGmg2BrXWJMehq.VgGQk7Xt2tizIyTGmsollTRB6fv6', 'BGQPK6049C', 'NEW MIRJALGUDA   SECUNDERABAD', 'Telangana', '473', 500047, 'SECUNDERABAD', 'DR AYURVEDIC', '22', NULL, 'assets/business_listing_images/66b5c0118dd1e.KURRA NARSIMHA.jpeg', 'HDFC', '0', 8, '50200065262416', 0, 'INR', 'captured', 'RazorPay', '2024-08-09 07:07:19', '1', '7075075689', '6302822638', '0000-00-00 00:00:00'),
(75, 'K.KOUSHIK KUMAR', 153, '9666386006', '$2y$10$EiqSGUKsqaJA4iBAuR59gOwNVVlv.N0LbU7IkaiTtyQ5ndxXybUjC', 'CDOPK9305F', 'HYDERABAD', 'Telangana', '473', 500073, 'Ameerpet', 'jhkh', '74', NULL, 'assets/business_listing_images/66b6284041a66.Screenshot_2.jpg', 'Axis Bank', '0', 20, '918010110225910', 0, 'INR', 'captured', 'RazorPay', '2024-08-09 14:32:40', '1', '9666386006', 'admin', '0000-00-00 00:00:00'),
(76, 'Shamala yadagiri', 701, '7396977505', '$2y$10$AFstSlXO21Vav6AY2TU1b.nASrfUe6leISBeY.lbdi5Q6DMDFr8P6', 'CSBPS6632K', 'Kapra', 'Telangana', '473', 500062, 'KAPRA HYDERABAD', 'MOSQUITO NETS', '60', 'sures2', 'assets/business_listing_images/66d964b58f8bf.WhatsApp Image 2024-09-05 at 13.14.35.jpeg', 'SBI', '0', 8, '30220849347', 1, 'INR', 'captured', 'RazorPay', '2024-09-05 07:59:21', '1', '7396977505', 'admin', '0000-00-00 00:00:00'),
(77, 'ADLURI SRIKANTH', 720, '9848073605', '$2y$10$plF58gDBLIKx1rwAqARoEeYUtX4MEbOa9PJMutkqPi2oH6X6ddmYO', 'ABAPA0046K', 'WARANGAL', 'Telangana', '493', 506002, 'HNO 11-28-228  GAYATRI NAGAR ,NEAR 2ND BANK COLONY  WARANGAL', 'HOME LOANS, PERSONAL LOANS, AND ALL LOANS SERVICE AVALABLE', '77', NULL, 'assets/business_listing_images/66e2eb37a45f5.WhatsApp Image 2024-09-12 at 18.46.19.jpeg', 'AXIS BANK', '0', 8, '292010100003957', 0, 'INR', 'captured', 'RazorPay', '2024-09-12 13:24:23', '1', '9848073605', 'admin', '0000-00-00 00:00:00'),
(78, 'Rajendraprasad martha', 767, '9948077369', '$2y$10$Gid8FavY.a5uOANcwzMv9usxXx9ZZQJtTdQlZ1.fC.ToFEEoB/SXy', 'AHHPM1963A', 'Hyderabad', 'Telangana', '473', 500073, 'Ameerpet', 'Marketing', '83', 'asdfg1', 'assets/business_listing_images/67091573ba0b2.1005279910.jpg', 'SBI', '0', 8, '32065922569', 0, 'INR', 'captured', 'RazorPay', '2024-10-11 12:11:15', '1', '9948077369', 'admin', '0000-00-00 00:00:00'),
(79, 'K RAMANI', 258, '9703219936', '$2y$10$0VCJsBoOgJmWjZoEjel7ru1CyY9/KPiIMO8urGTkdrotIu8g9Y1Ja', 'CGKPR0974C', 'HYDERABAD', 'Telangana', '473', 500072, 'HYDERABAD', 'ASTROLOGER', '20', 'asra12', 'assets/business_listing_images/671885cba301b.Ramani.png', 'SBI', '0', 8, '62491103731', 0, 'INR', 'captured', 'RazorPay', '2024-10-23 05:13:47', '1', '9703219936', '7730099707', '0000-00-00 00:00:00'),
(80, 'PRASHANTH CHIKKULAPALLY', 791, '9494036032', '$2y$10$Ufc5XRPrYInwadGmlP4FFu.nBB16mrAnrhoriOyInOXp0TSdSAkeq', 'ARDPC5885D', 'Warangal', 'Telangana', '493', 506002, 'https://maps.app.goo.gl/DvssU3Wr8Waas9rd7?g_st=iw', 'Parvatham Developers, Red Sandal Plantation.', '57', NULL, 'assets/business_listing_images/672096d4dba4b.f710f083-fc11-46f1-ae52-0b2449e49348.jpeg', 'HDFC BANK', '0', 8, '50100547050870', 0, 'INR', 'captured', 'RazorPay', '2024-11-04 05:59:17', '1', '9494036032', '8522881144', '0000-00-00 00:00:00'),
(81, 'Ravi kiran', 396, '9676959538', '$2y$10$5JXiQRIRwghRU4gNAFT2huh5fNHzurT/9iZU8gEhOg731h/BEgcem', 'NNPPK45420', 'Hyd', 'Telangana', '490', 500018, 'madhapur Gayathri nagar park', 'Interior, modular, constructions', '74', 'asdfg3', 'assets/business_listing_images/6735a78851a7b.WhatsApp Image 2024-11-14 at 12.45.46 PM.jpeg', 'federal bank', '3000', 8, '13320100091997', 0, 'INR', 'captured', 'RazorPay', '2024-11-14 07:33:19', '1', '9676959538', '8522881144', '2024-11-14 07:32:26'),
(82, 'Chenna Raju', 857, '9963355333', '$2y$10$9Fuv9jkwUDTFPx2HfGmgZO0r1MZ4XQ4.FfpwlRwzJr775x0SCLHFG', 'AENPV6824N', 'Hyd', 'Telangana', '473', 500013, 'HYDERABAD', 'abroad consultant', '12', 'Asdfg4', 'assets/business_listing_images/67441f1ac6d60.chenna raju.jpeg', 'UNION BANK', '0', 8, '50200065262416', 0, 'INR', 'captured', 'RazorPay', '2024-11-25 06:54:57', '1', '9963355333', '7702381784', '2024-11-25 06:54:21'),
(83, 'YUGANDHAR TAMATAM', 836, '7869456369', '$2y$10$D4aBQSvCfttZwpQMSs0W0.TsUmoJrLxe72qvg2kz4iFjiS9rGzBpW', 'BBAPT4905P', 'Miyapur', 'Telangana', '473', 500049, 'MIYAPUR', 'REAL ESTATE', '108', 'asdfg5', 'assets/business_listing_images/6745a9f357a10.yughander.jpeg', 'KOTAK MAHINDRA BANK', '0', 8, '3691234369', 0, 'INR', 'captured', 'RazorPay', '2024-11-26 10:59:41', '1', '7869456369', '9348963999', '2024-11-26 10:59:03'),
(84, 'A GOVARDHAN GOUD', 868, '9705096369', '$2y$10$VHSGfHVQdOJxIvhwuGpbCOppHcQRL9UrBOKyoTW9aqDjtUNki.mkW', 'DLWPG5991Q', 'MIYAPUR', 'Telangana', '473', 500049, 'MIYAPUR', 'CAR HIRE', '32', 'asdfg6', 'assets/business_listing_images/6748a8e3d25c5.govardhan.jpeg', 'BANK OF BARODA', '0', 8, '79260100009164', 0, 'INR', 'captured', 'RazorPay', '2024-11-28 17:31:51', '1', '9705096369', '7869456369', '2024-11-28 17:31:19'),
(85, 'Govardhani Kodavali', 832, '7674045621', '$2y$10$uoyyrwgKjC5zMUm4CECNze.IfG5LsHhC.lQ9SHi3eAL0y5BXanJEy', 'EQPPK7938Q', 'Kukatpally', 'Telangana', '473', 500072, 'KUKATPALLY HYD', 'Unique Selling Points (USPs) of Your Business: One Stop solution for Men\'s, women\'s & kids outfits (maggamwork blouses, longfrocks, croptop,designer blouses,Pattulanga voni,Ready to wear  saree,suits, blazers,Sherwani,dhothi,designer shirts with Name letter logo\'s,Kids birthday frocks, Dhothi kurtha, photo shoot outfits)we do any kind of customization for the client requirements based on their budgets .  We do  online bookings from Any where', '58', 'asdfg7', 'assets/business_listing_images/67507fc67e0f7.WhatsApp Image 2024-12-04 at 21.38.36.jpeg', 'PUNJAB NATIONAL BANK', '0', 8, '4857000100035289', 0, 'INR', 'captured', 'RazorPay', '2024-12-04 16:14:37', '1', '7674045621', '9348963999', '2024-12-04 16:14:02'),
(86, 'Gudelli Archana', 820, '6301452656', '$2y$10$92zqD9OyjAoFLsA5Kd4VsunD1OkR2kEBMrH2hOUkE6kZCWJLmOhvS', 'DTWPA1399N', 'JNTU', 'Telangana', '473', 500072, 'HYDERABAD', 'please contact for life insurance', '73', 'asdfg8', 'assets/business_listing_images/675080f01bb36.WhatsApp Image 2024-12-04 at 14.02.47.jpeg', 'Union Bank of India', '0', 8, '034822010000327', 0, 'INR', 'captured', 'RazorPay', '2024-12-04 16:20:00', '1', '6301452656', '9348963999', '2024-12-04 16:19:00'),
(87, 'TEMBERENI  ANIL', 249, '9989225258', '$2y$10$XHNzKC5NuvTYVTKljmnX9.wq/XahhYo1fq.C2bp6nSGEOOFSMdYhu', 'AMGPT8011Q', 'WARANGAL', 'Telangana', '493', 506001, 'HANAMKONDA', 'ACUPUNCTURE CONSULTANT', '1', 'asdfg9', 'assets/business_listing_images/675146aaec9c8.ANIL PHOTO.jpg', 'SBI', '1000', 8, '20110021426', 0, 'INR', 'captured', 'RazorPay', '2024-12-05 06:23:45', '1', '9989225258', '7730099707', '2024-12-05 06:22:38'),
(88, 'DURGA SRINIVASA RAO', 1001, '8978997070', '$2y$10$Ipu73kBHrj2VlalADTpXNuZJHzjP1apL2ZhOCWQbg09Q40FQADQl.', 'ABVPD6623Q', '123456', 'Telangana', '473', 500049, 'MIYAPUR', 'REAL ESTATE', '108', 'Qwert2', 'assets/business_listing_images/6762fcafa87f2.WhatsApp Image 2024-12-18 at 22.10.53.jpeg', 'SBI', '0', 8, '10725237273', 0, 'INR', 'captured', 'RazorPay', '2024-12-18 16:48:04', '1', '8978997070', '9348963999', '2024-12-18 16:47:47'),
(89, 'Gajjelli Bhaskar', 838, '9441439371', '$2y$10$in9BQp2abVDOx.Vn0/ng8eFYnuJDb.wdg7QlvjfjOjSYpPQeVvTGG', 'BQVPG3211M', 'Paradise', 'Telangana', '473', 500090, 'PARADISE, HYDERABAD', 'Photography and Event Management', '100', 'QWERT1', 'assets/business_listing_images/67653dc0f309e.IMG-20241021-WA0049.jpg', 'KOTAK MAHINDRA BANK', '0', 8, '4649-550742', 0, 'INR', 'captured', 'RazorPay', '2024-12-21 04:43:40', '1', '9441439371', '9348963999', '2024-12-20 09:49:56'),
(90, 'Suresh Yarraboina', 819, '9948012244', '$2y$10$/nuSPS3dPrErZw7dtoqdHua6BxO3ndmZH0TewXOGMXQ3He3RyDJG6', 'AGNPY7586Q', 'Vanasthalipuram', 'Telangana', '473', 500070, 'Vanasthalipuram', 'Residential gated community Villa Plots', '103', 'suresh', 'assets/business_listing_images/6777deb9620c7.1000954203.jpg', 'Axis Bank', '0', 8, '915010040017394', 0, 'INR', 'captured', 'RazorPay', '2025-01-03 18:03:10', '1', '9948012244', '9348963999', '2025-01-03 12:57:34'),
(91, 'Sekhar mingi', 1011, '9154150777', '$2y$10$0jFXDz/N.u6ntaAoqeYL7e7RLWSfg2UgHpUDUZVwhQ97Q6TmK86gC', 'BQWPM6614B', 'Kompally, Hyderabad', 'Telangana', '473', 500100, 'HYDERABAD', 'PERSONAL  LOANS', '98', 'Sekhar', 'assets/business_listing_images/677d1bd41741d.WhatsApp Image 2025-01-07 at 5.40.49 PM.jpeg', 'SBI', '0', 8, '33129283954', 0, 'INR', 'captured', 'RazorPay', '2025-01-07 12:20:13', '1', '9154150777', '7869456369', '2025-01-07 12:19:35'),
(92, 'Mr Prem Raj', 951, '9391922022', '$2y$10$WkEnJ/xGgv/3RZKjwaMYeO1ICpSOrcQLMkAXVLICcE/KBWBtJdQ2S', 'CAHPM9951K', 'Miyapur x road', 'Telangana', '473', 500049, 'MIYAPUR', 'FLEX PRINTING', '55', 'Premji', 'assets/business_listing_images/678a0e9184c94.WhatsApp Image 2025-01-17 at 13.26.51.jpeg', 'SBI', '0', 8, '39229187526', 1, 'INR', 'captured', 'RazorPay', '2025-01-17 08:04:54', '1', '9391922022', '7869456369', '2025-01-17 08:02:29'),
(93, 'C VENKATARAMANA REDDY', 1168, '7893644509', '$2y$10$TBn2t/5fqFP/TcQ4Wcr2q.riN6W2CdC7eAwwXm3LSJV.HUIfHCymi', 'AQQPR2240H', 'KARKHANA HYD', 'Telangana', '473', 500015, 'KARKHANA HYD', 'NAVYASAI RED SANDLE FARMLAND PROJECTS,', '108', 'cvredy', 'assets/business_listing_images/67c846f3104c9.CVREDDY.jpeg', 'IDFC', '0', 8, '10204391022', 0, 'INR', 'captured', 'RazorPay', '2025-03-05 12:44:24', '1', '7893644509', 'admin', '2025-03-05 12:43:34'),
(94, 'M SURESH KUMAR', 1320, '9000650307', '$2y$10$5cqoj.AdTvJz7x0LvY36QuthS7gK0TZZyd4BH/qyYPjP4hseDP8GK', 'ABVPM2937N', 'Bachupally', 'Telangana', '473', 500090, 'HYDERABAD', 'Refer your children, brothers and sisters planning for higher education and study abroad', '12', 'knnknn', 'assets/business_listing_images/68496b7c2996b.KNN.png', 'State Bank of India', '0', 8, '20061036662', 0, 'INR', 'captured', 'RazorPay', '2025-06-11 11:42:34', '1', '9000650307', '9348963999', '2025-06-11 11:41:52'),
(95, 'NIKKU BABU RAO', 1319, '9985084617', '$2y$10$aL6COK.XnFxskUT0RRY81uZek1XdhmLb4aT0ezjTIAjuCrniF.Znm', 'FYCPB3458J', 'Musheerabad', 'Telangana', '473', 500080, 'Musheerabad', 'LIC AGENT RECRUITER', '73', 'bnikku', 'assets/business_listing_images/684a470359b6e.z - Baburao Nikku.jpg', 'SBI', '0', 8, '35023290681', 0, 'INR', 'captured', 'RazorPay', '2025-06-12 03:19:46', '1', '9985084617', '9348963999', '2025-06-12 03:18:31'),
(96, 'G V S Prasad', 1327, '7675910589', '$2y$10$wYE5cuipyN4apvxvLijmt.eve6/na21Mm5VZpZgxgY6d/jO1nX0v2', 'AIVPG7348A', 'Chandhanagar', 'Telangana', '473', 500050, 'CHANDANAGAR', 'REAL ESTATE', '108', 'gvspra', 'assets/business_listing_images/684a694a4bfdd.20240728_144832 - g.v.s prasad.jpg', 'ICICI', '0', 8, '058801514249', 0, 'INR', 'captured', 'RazorPay', '2025-06-12 05:45:29', '1', '7675910589', '9348963999', '2025-06-12 05:44:46'),
(97, 'M LAKSHMI NADH', 1156, '9959821128', '$2y$10$gcNUBq3L5xbFpvkFgmKBzOP90Ct3qIVOQifnHh8vXrbhVt5BhS3f6', 'AUWPM9917G', 'HYDERABAD', 'Telangana', '473', 500015, 'Alwal', 'One Stop Solution for all your Loan requirements', '141', 'lakshm', 'assets/business_listing_images/684a707457154.IMG-20240420-WA0228 - lakshmi nadh munnaluri.jpg', 'HDFC', '0', 8, '50100067482911', 0, 'INR', 'captured', 'RazorPay', '2025-06-12 06:16:19', '1', '9959821128', 'admin', '2025-06-12 06:15:20'),
(98, 'Kanchi Rajendra Kumar', 1333, '9160488882', '$2y$10$dnJ1JprHnjvEY9nkO5xmY.FexuUZ5a/xX8xSLsHa1D90XALuOgk26', 'ACFPK6406R', 'Manikonda', 'Telangana', '473', 500089, 'MANIKONDA', 'Real Estate Advisor.. with RERA Licence...Dealing in open plots and High Raise Apts..', '108', 'kanchi', 'assets/business_listing_images/684ad7837ecf7.K.Rajendhar kumar01 - KANCHI RAJENDRA KUMAR.jpg', 'Indian Overseas Bank', '0', 8, '043301000454545', 0, 'INR', 'captured', 'RazorPay', '2025-06-12 13:35:38', '1', '9160488882', '9348963999', '2025-06-12 13:35:03'),
(99, 'Annadatha Murali Manohar', 1303, '8688763287', '$2y$10$6sRiI9VekyIJnHx155Ppwu0Dk4ApfzUjd3tWLhAA6S0XXQw2P9Zpi', 'AHCPA8932E', 'Hyderabad', 'Telangana', '473', 500045, 'NEAR YOUSUFGUDA METRO STATION', 'anadta', '142', 'anadta', 'assets/business_listing_images/684b19770c1d4.Photo AVMM - Murali Manohar Annadatha.jpeg', 'ICICI', '0', 8, '038201536812', 0, 'INR', 'captured', 'RazorPay', '2025-06-12 18:16:52', '1', '8688763287', '7702381784', '2025-06-12 18:16:27'),
(100, 'Ganji Eswaralingam', 1332, '9550894940', '$2y$10$F6Sa8rDj0LocgrNFnygvleZsArCT9YuS5Ra6OyhTD9lTY/uetY8K.', 'AGGPG8975L', 'KPHB Hyd', 'Telangana', '473', 500072, 'HYDERABAD', 'SOCIAL WORKER', '119', 'eswara', 'assets/business_listing_images/684bc1d149188.WhatsApp Image 2025-06-13 at 11.34.22.jpeg', 'SBI', '0', 8, '38704005544', 0, 'INR', 'captured', 'RazorPay', '2025-06-13 06:15:36', '1', '9550894940', '9348963999', '2025-06-13 06:14:45'),
(101, 'S.lakshmi', 1342, '7981424258', '$2y$10$85Jj77gheOjnzlczIR70hOytWQdnuRlC85VCz1v99PuTUCtDY2H8u', 'BJLPL7054G', 'HYD', 'Telangana', '473', 500096, 'FILMNAGAR', 'Senior Sales Development Director', '108', 'slaxmi', 'assets/business_listing_images/684bfc3636c8b.WhatsApp Image 2025-06-13 at 15.43.12.jpeg', 'SBI', '0', 8, '34520352211', 0, 'INR', 'captured', 'RazorPay', '2026-03-04 05:31:04', '1', '7981424258', '9348963999', '2025-06-13 10:23:54'),
(102, 'Vudatha Nagaraju', 1334, '9951211704', '$2y$10$cLcT7DnbP2gkAM7OuOGDIOeHR6iSX4NNXj.ATPbREBi6n5ZLYqZru', 'AGVPG6044M', 'Kukatpally', 'Telangana', '473', 500090, 'HYDERABAD', 'Apparel Manufacturer', '143', 'vuduta', 'assets/business_listing_images/685040ab80df5.IMG-20240820-WA0144 - Nagaraj Gupta.jpg', 'ICICIBANK', '0', 8, '777705211704', 0, 'INR', 'captured', 'RazorPay', '2025-06-16 16:32:05', '1', '9951211704', '9348963999', '2025-06-16 16:05:03'),
(103, 'P santhi priya', 1343, '9493078866', '$2y$10$S3xUbqELKCzR5k2DLwkBqOExJxZeIfCu3u1YjsdZUMF5sRUd8SZBG', 'DZDPP8294N', 'HYDERABAD', 'Andhra Pradesh', '8', 523169, 'Jagarlamudi', 'Need Insurence advisors', '73', 'shanti', 'assets/business_listing_images/685042e1b5160.Untitled design (2).png', 'Union bank of india', '0', 8, '065512010000140', 0, 'INR', 'captured', 'RazorPay', '2025-06-16 16:32:16', '1', '9493078866', 'admin', '2025-06-16 16:14:29'),
(104, 'A Hema Ch Venkata Kumar', 1348, '9491071229', '$2y$10$gaW41kvb4M.U2lnL1U/WGOOsBUk49d1Yy2YvdE6nrwcAbe1mqtIJO', 'ADGPA3288F', 'Thumkunta', 'Telangana', '473', 500078, 'Thumkunta', 'Fundamental Analysis, Technical Analysis, Swing Trading, Future and Options, Intraday trading, commodities trading, Mutual funds investment, Portfolio management services, IPO investments', '139', 'Avvary', 'assets/business_listing_images/685045dbbd386.WhatsApp Image 2025-06-14 at 18.45.56 - AHCV Kumar.jpeg', 'HDFC Bank', '0', 8, '05451140154801', 0, 'INR', 'captured', 'RazorPay', '2025-06-16 16:32:22', '1', '9491071229', '7702381784', '2025-06-16 16:27:12'),
(105, 'John William Myle', 1322, '9849639995', '$2y$10$BDkeV6aRwE73EZg4DSgQau26W0Z8C1C.UYpb6JJYEbGiifgDoJeye', 'AIMPM3632L', 'Secunderabad', 'Telangana', '473', 500015, 'Tirumalagiri, Secunderabad', 'In the Solar industry for 15  years', '74', 'jhonwi', 'assets/business_listing_images/68504740dbf2e.John - Pic - John William.jpg', 'HDFC', '0', 8, '50200028418440', 1, 'INR', 'captured', 'RazorPay', '2025-06-16 16:33:44', '1', '9849639995', '9348963999', '2025-06-16 16:33:08'),
(106, 'Dr M  kirankumar', 1353, '9063761343', '$2y$10$R2gmi61QHtgfqtljZL/RZuqG2UyKJ082PigbIVqO.tNInQOW0kO8u', 'AXBPM5189L', 'Rajendranagar', 'Telangana', '473', 500030, 'RAJENDRANAGAR  HYDERABAD', 'DR NATUROPATHY', '144', 'drkirn', 'assets/business_listing_images/6853c0e1ad0e1.WhatsApp Image 2025-06-19 at 13.07.18.jpeg', 'PUNJAB NATIONAL BANK', '0', 8, '10912041012362', 0, 'INR', 'captured', 'RazorPay', '2025-06-19 07:49:12', '1', '9063761343', '9014970133', '2025-06-19 07:48:54'),
(107, 'GANGADHARAM PALLIPATTU', 225, '9441557447', '$2y$10$TA4vYH1/6flGyqgKmYyMcO4tOE/84SXtmDzAjsFBHlp9VOG70N2tW', 'AKJPP0114F', 'GUNTUR', 'Andhra Pradesh', '2', 517501, 'CHITTOR', 'REAL ESTATE', '108', 'gangdr', 'assets/business_listing_images/68553aa088cb0.WhatsApp Image 2025-06-20 at 16.05.23.jpeg', 'BANK OF BARODA', '0', 8, '30560100013761', 0, 'INR', 'captured', 'RazorPay', '2025-06-20 10:42:07', '1', '9441557447', '8074208767', '2025-06-20 10:40:36'),
(108, 'K. Suresh kumar Goud', 1326, '8897148717', '$2y$10$yKwRYG02Ov4CPdbO5QZgz.KTjDEpAWbTrNJ4CsvJ/h0QmTXfSHE5e', 'AVSPK7066K', 'Kothapet', 'Telangana', '473', 500035, 'NAGOLE', 'REAL ESTATE', '108', 'Ksures', 'assets/business_listing_images/suresh goud.jpeg', 'SBI', '0', 8, '62288584892', 0, 'INR', 'captured', 'RazorPay', '2025-12-28 12:18:22', '1', '8897148717', '9348963999', '2025-06-26 07:57:36'),
(109, 'SHAIK YOUSUF JOHN', 1357, '7569544580', '$2y$10$LpNqaLu9tBGFMhP3oUPZTeBfNovra8t1hgnnJX/cwcGF4VoQ0iB/W', 'FBOPS6692J', 'Uppal Hyd', 'Telangana', '473', 500039, 'Uppal Hyd', 'Advocate', '15', 'yousuf', 'assets/business_listing_images/685d72127811b.1009072464.jpg', 'SBI', '0', 8, '62268935427', 0, 'INR', 'captured', 'RazorPay', '2025-06-26 16:16:07', '1', '7569544580', '9348963999', '2025-06-26 16:15:18'),
(110, 'YAQOOB', 1358, '8328419693', '$2y$10$5VkqIEUEzraNAsIxr3W0Q.WuAgpnwsiRqEh4RdWOT5.5vmXj2TRwG', 'FBOPS6692J', 'Uppal Hyd', 'Telangana', '473', 500039, 'Uppal Hyd', 'Real Estate', '108', 'shaiky', 'assets/business_listing_images/685d757980f7d.1009072510.jpg', 'SBI', '0', 8, '62268935427', 0, 'INR', 'captured', 'RazorPay', '2025-06-26 16:30:23', '1', '8328419693', '7569544580', '2025-06-26 16:29:49'),
(111, 'G.SRINIVAS GOUD', 1450, '9849235288', '$2y$10$Ll8g6A.gTO0MrHMLs0t7K.PD7DkxKKcQxdFXzMzUCzhkdyQa8uPkK', 'APIPG8575K', 'NAGOLE HYD', 'Telangana', '473', 500035, 'NAGOLE HYD', 'AKR INFRA DEVELOPERS PVT LTD Red Sandal Farm Lands with low investment and High Returns in Prakasham District near Adhanki.  Price start from Rs.699 to Rs.1000 per sqyrd. High Returns Rs.1 cr to Rs.8 cr', '108', 'srinvs', 'assets/business_listing_images/688887e7b512f.srinivas.jpg', 'Union Bank of India', '0', 8, '532102010054521', 0, 'INR', 'captured', 'RazorPay', '2025-07-29 08:42:37', '1', '9849235288', 'admin', '2025-07-29 08:35:55'),
(112, 'Capt Uday Ratnalikar', 1449, '8106926711', '$2y$10$ozqiR25Jzus407XuJ0g44udTxerLbwl8yQcuN28c96Lyj8ODVYYoy', 'AEUPR2338N', 'HYDERABAD', 'Telangana', '491', 500050, 'HYDERABAD', 'Save your valuable money through understanding of material and connecting to right manufacturers', '62', 'ratnlk', 'assets/business_listing_images/6888895821c20.ratnalikar.jpg', 'SBI', '0', 8, '64045287767', 0, 'INR', 'captured', 'RazorPay', '2025-07-29 08:42:48', '1', '8106926711', 'admin', '2025-07-29 08:42:04'),
(113, 'G Swamy', 1451, '9032251199', '$2y$10$zxE0R/lPF4WIkcUfyjIkQuKnnYYKQ9L2LCT6f6q1SSQ35fIDLpNGK', 'BYRPG5081P', 'Malkajgiri', 'Telangana', '473', 500047, 'HYDERABAD', 'REAL ESTATE', '108', 'gorkha', 'assets/business_listing_images/68889106a1d4c.WhatsApp Image 2025-07-29 at 14.33.31.jpeg', 'SBI', '0', 8, '62417116149', 0, 'INR', 'captured', 'RazorPay', '2025-07-29 09:16:40', '1', '9032251199', '7702381784', '2025-07-29 09:14:50'),
(114, 'Laxmiveeresh Marthi', 1398, '9951164521', '$2y$10$/2odd1la6SsIzG2mKtZD..H7YH3IGyADyPkb9IVAeaACbCsyKWQg6', 'BOHPM9717G', 'HYDERABAD', 'Telangana', '473', 500020, 'HYDERABAD', 'PERSONAL LOANS,BUSINESS LOANS,HOME LOANS,MORTGAGE LOANS', '141', 'veresh', 'assets/business_listing_images/688b55fa302e3.WhatsApp Image 2025-07-31 at 16.54.29.jpeg', 'SBI', '0', 8, '62361359592', 0, 'INR', 'captured', 'RazorPay', '2025-07-31 11:40:08', '1', '9951164521', '7730099707', '2025-07-31 11:39:41'),
(115, 'Siva J', 1409, '6281994649', '$2y$10$OMccYbtlCuKWBocWWgMJb.QJPXlRk7kKkkqs99KEanQliTmQt/ON6', 'AAJFJ7867R', 'HYDERABAD', 'Telangana', '473', 500081, 'MADHAPUR HYD', 'Get job-ready with JALA Academy\'s 1-on-1 live online project training on the latest technologies. World\'s lowest fee, job guarantee programs for software job seekers. Launch your career today', '44', 'jalasi', 'assets/business_listing_images/688f780e5e782.WhatsApp Image 2025-08-03 at 20.11.16.jpeg', 'ICICI', '0', 8, '000405657876', 0, 'INR', 'captured', 'RazorPay', '2025-08-03 14:55:19', '1', '6281994649', '8522881144', '2025-08-03 14:54:10'),
(116, 'Narayana', 1428, '8143413434', '$2y$10$Pa3ipgucJjj3T8woBP.rPOz1jxj2mZGEK40avw1q/OUv6ZYwVH.A2', 'ARXPG9681K', 'Secundrabad', 'Telangana', '473', 500011, 'HYDERABAD', 'REAL ESTATE', '1', 'narayn', 'assets/business_listing_images/6891e729854fd.WhatsApp Image 2025-08-05 at 15.25.10.jpeg', 'SBI', '0', 8, '30120435227', 0, 'INR', 'captured', 'RazorPay', '2025-08-05 11:15:04', '1', '8143413434', 'admin', '2025-08-05 11:12:45'),
(117, 'TEMBARENI ANILKUMAR', 1472, '9346934266', '$2y$10$IiVYljHdfw0A8Q3LfJARgeu0.Vt2YmT6WD1UnttH/hNw2J2YgWo26', 'AMGPT8011Q', 'hanamkonda', 'Telangana', '493', 506001, 'Kishanpura, Hanumakonda', 'Acupuncture, Acupressure Treatment & Training', '23', 'dranil', 'assets/business_listing_images/689896909bb13.1000430742.jpg', 'STATE BANK OF INDIA', '0', 8, '20110021426', 0, 'INR', 'captured', 'RazorPay', '2025-08-10 12:56:04', '1', '9346934266', '9989225258', '2025-08-10 12:54:44'),
(118, 'Boini Mayuri', 1476, '7893237874', '$2y$10$UkPoXsmzewXHUEwzPiVi6OcReJaxjU80lPOosscGAzfoSWjh2MmYG', 'CADPA5019G', 'Karimnagar', 'Telangana', '479', 505001, 'KR colony road no 2 . Back side of Sri kodhanda ramalayam temple thigalaguttapalli karimnagar', 'Specialized in Accupanchar Ayurvedic.', '23', 'mayuri', 'assets/business_listing_images/689aee935be79.1000927124.jpg', 'Canara Bank', '0', 8, '110235663582', 0, 'INR', 'captured', 'RazorPay', '2025-08-12 07:40:58', '1', '7893237874', '9989225258', '2025-08-12 07:34:46'),
(119, 'Sai Swathi Kalavala', 1481, '9985969782', '$2y$10$fpHRxDgafUXYz6KNKNpkMO25n96C3gVq0vsFrHF/bDXEZs53j5A5i', 'BAWPK8542C', 'Hyderabad, Moulali ali', 'Telangana', '473', 500040, 'MOULALI HYD', 'Specialist in Bridal & Party Makeovers, Bridal Makeup training Classes.', '7', 'swathi', 'assets/business_listing_images/689b729ccff6d.WhatsApp Image 2025-08-12 at 10.15.58 PM.jpeg', 'KOTAK MAHINDRA BANK', '0', 8, '6445452442', 0, 'INR', 'captured', 'RazorPay', '2025-08-12 16:58:31', '1', '9985969782', '7702381784', '2025-08-12 16:58:08'),
(120, 'HARINATH NEELA', 1439, '7680803119', '$2y$10$MvcJVVMBoKh9ErwuIe0PkO3SuhE3DyhGug9eJMHNzI3NxlSid6lpa', 'ALEPH6323A', 'KACHIGUDA HYD', 'Telangana', '473', 500027, 'HYDERABAD', 'We specialize in delivering world-class medical care at home across Hyderabad, ensuring comfort, compassion, and professional support.', '93', 'harnth', 'assets/business_listing_images/68a730d9ea804.WhatsApp Image 2025-08-21 at 19.53.36.jpeg', 'INDUS', '0', 8, '100061493323', 0, 'INR', 'captured', 'RazorPay', '2025-08-21 14:45:06', '1', '7680803119', 'admin', '2025-08-21 14:44:46'),
(121, 'NAVEEN KUMAR', 1380, '9059597787', '$2y$10$d.cOlEtXUJw7sY4JNNHMv.vTyeRSQyJzkqNmqT0MQCt0fZLGNQC52', 'CIHPS5578N', 'HYDERABAD', 'Telangana', '473', 500098, NULL, 'Organic and Natural Mart', '147', 'My1234', 'assets/business_listing_images/68b701873d1f7.WhatsApp Image 2025-08-26 at 09.19.45.jpeg', NULL, '7000', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2025-09-02 15:03:03', '1', '9059597787', '8184988999', '2025-09-02 14:39:07'),
(122, 'Sweta', 1446, '7674068579', '$2y$10$qVA4gxMCh4uEYVbLnusQDuFQp3bhhmZXylD2fiYnjEob7R1Xgu6tq', 'BRYPS5608G', 'Hyderabad', 'Telangana', '473', 500049, NULL, 'As an NLP Life Coach, I empower individuals to break free from stress, anxiety, and limiting beliefs that hold them back. Using powerful Neuro-Linguistic Programming (NLP) techniques, I help you rewire negative thought patterns, boost confidence, and unlock your true potential.  Whether you’re seeking personal growth, improved relationships, or career success, my coaching provides practical tools and deep mindset shifts that create lasting change. Together, we’ll design a customized action plan that aligns with your goals so you can live with clarity, balance, and purpose.', '9', 'swetha', 'assets/business_listing_images/68b7eded59470.WhatsApp Image 2025-09-03 at 12.53.16.jpeg', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2025-09-03 07:28:08', '1', '7674068579', 'admin', '2025-09-03 07:27:45'),
(123, 'RAVIKUMAR', 1502, '7032552304', '$2y$10$QlfhMpqMNFT6AENspGNRUuV2eZU/OF9cAZP2/Oe38YfUmNgAckCJu', 'APRPA4068E', 'SHAMSHABAD', 'Telangana', '473', 500005, NULL, 'Shamshabad Tukkuguda Area. Open plots,HMDA,DTDC,Layout ,RERA Aproved Plots.   AND  Licenced CIVIL Contractor', '108', 'ravkmr', 'assets/business_listing_images/68b7f3aeb6b35.Untitled design (7).png', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2025-09-03 07:52:40', '1', '7032552304', '9705910096', '2025-09-03 07:52:18'),
(124, 'M Yadagiri', 1518, '8688528988', '$2y$10$WBjUuqDZMH0AlPSJeTYRw.xIOsVruxEhFj2b/FSXJ1uXI97N.21Jm', 'DCUTY8981P', 'Shamshabad Hyd', 'Telangana', '473', 500005, NULL, 'Shamshabad Tukkuguda Area. Open plots,HMDA,DTDC,Layout ,RERA Aproved Plots.', '108', 'yadgir', 'assets/business_listing_images/68b7f5e478fd4.WhatsApp Image 2025-09-01 at 16.12.02.jpeg', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2025-09-03 08:01:57', '1', '8688528988', '7032552304', '2025-09-03 08:01:44'),
(125, 'KP Lingareddy', 1519, '9963055128', '$2y$10$1E4b1FpGy.KphfdXMrmcF.pg.p5ky6D/qISPkaoqB1rrL0RKzDx/6', 'ALNPK0142M', 'Attapur hyd', 'Telangana', '473', 500048, NULL, 'Shamshabad Tukkuguda Area. Open plots,HMDA,DTDC,Layout ,RERA Aproved Plots.', '108', 'ligrdy', 'assets/business_listing_images/68b7f721e9360.WhatsApp Image 2025-09-03 at 13.33.38.jpeg', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2025-09-03 08:07:19', '1', '9963055128', '7032552304', '2025-09-03 08:07:01'),
(126, 'Prasanthi', 1318, '9581530189', '$2y$10$iRqNnVAQWtlNbeJ2nciyfeidJSbMjXLmE2rbpyddAiirnMDaq8Xam', 'BULPM1409D', 'Nizampet', 'Telangana', '473', 500090, NULL, 'Arha Boutique , we design customised computer embroidery, designer outfits. We design  all outfits for ladies and kurtas for gents we take online orders, offline orders free home delivery for around 5 kilometres from our shop', '27', 'Prsnti', 'assets/business_listing_images/68ba6f64b82b1.WhatsApp Image 2025-09-04 at 16.54.32.jpeg', NULL, '0', 8, NULL, 1, 'INR', 'captured', 'RazorPay', '2025-09-05 05:05:05', '1', '9581530189', '9348963999', '2025-09-05 05:04:40'),
(127, 'P Anil Kumar', 1376, '9951552424', '$2y$10$ynT.ll93m3BlIWWtCc6UFu0ZsADJMOWaaO5oU8G7ahOOypCMP1S9u', 'AJPPA6550M', 'Hyderabad', 'Telangana', '473', 500074, NULL, 'REAL ESTATE', '108', 'pothna', 'assets/business_listing_images/68bff22003da2.NSP Anil.png', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2025-09-09 09:24:12', '1', '9951552424', '8184988999', '2025-09-09 09:23:48'),
(128, 'RADHARAM ANJANEYULU', 1151, '9550127916', '$2y$10$C3iJbLMvQM1rwWbd6i2zs.ZmiMlLyFCbfizB6/mOu3pUT6t.BkaVm', 'ANDPR4692P', 'Ghatkesar', 'Telangana', '473', 501301, NULL, 'REAL ESTATE', '108', 'radhap', 'assets/business_listing_images/68c0197245a04.WhatsApp Image 2025-09-09 at 17.05.57.jpeg', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2025-09-09 12:11:55', '1', '9550127916', '8522881144', '2025-09-09 12:11:34'),
(129, 'G Narasaiah', 1453, '7780705639', '$2y$10$640./.E50B1qijvaJPrDs.WL2q9jl0BhjRL7O27fKWR8W2ppvTivu', 'AHAPG0780C', 'Hyderabad', 'Telangana', '473', 500090, NULL, 'REAL ESTATE', '108', 'narsah', 'assets/business_listing_images/68c3df0b3ec15.NARSAIAH.jpeg', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2025-09-25 06:23:23', '1', '7780705639', '9246351657', '2025-09-12 08:51:27'),
(130, 'Gummidiyala Nishindra', 1531, '7396777731', '$2y$10$kYzJi9DXcOkpL6xN.VOp/e/sxc0QSohgiUngitYP80C0QzIekN4Vi', 'CKVPG9499N', 'Nizampet', 'Telangana', '473', 500090, NULL, '“I’m a photographer who captures weddings, birthdays, pre-weddings, fashion, food, and product shoots. I  love travel and nature photography and enjoy telling stories through my pictures.”', '100', 'nisndr', 'assets/business_listing_images/68c3e0387c12a.nishindra.jpeg', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2025-09-25 06:23:29', '1', '7396777731', '7780705639', '2025-09-12 08:56:28'),
(131, 'M S Goud', 1530, '8977677569', '$2y$10$VJV9tTweabtuRD5tWRNF8ecpCIh2pmEM5uLdgNHUqbi4b9HTghn/e', 'AIYPM4687R', 'Madhuranagar', 'Telangana', '473', 500038, NULL, 'REAL ESTATE', '108', 'msgoud', 'assets/business_listing_images/68d4dfc002908.WhatsApp Image 2025-09-25 at 11.33.15.jpeg', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2025-09-25 06:23:34', '1', '8977677569', 'admin', '2025-09-25 06:22:58'),
(132, 'Kuraku Mallikarjuna Reddy', 1576, '9848654416', '$2y$10$8ba7hqEXnXaCITJwkYpl7eVybEMVIgPeuZnnoH6vjZlXPbaF1cNdi', 'GSQPK3938F', 'Hyderabad', 'Telangana', '473', 500073, NULL, 'REAL ESTATE', '108', 'mallik', 'assets/business_listing_images/6932b8374a2b5.WhatsApp Image 2025-12-05 at 16.05.55.jpeg', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2025-12-05 10:48:00', '1', '9848654416', '8639974381', '2025-12-05 10:47:23'),
(133, 'c.Bhavani Prasad', 1572, '8639974381', '$2y$10$c2/1JuS2HqxHpBWcBNuoNOFd0dN599f79cdWhO0qqyy.WbfR1SPvK', 'BHYPC4229B', 'HYDERABAD', 'Telangana', '473', 500045, NULL, 'ALL  cinama and searial actors avilabule entertainment in functions and part\'s', '54', 'bhavan', 'assets/business_listing_images/6932bdb8d0ab1.WhatsApp Image 2025-12-05 at 16.24.07.jpeg', NULL, '1000', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2025-12-05 11:11:19', '1', '8639974381', '8522881144', '2025-12-05 11:10:52'),
(134, 'Y Nageshwar Rao', 1542, '9665156355', '$2y$10$iyA9QHXsoZd09yp7b9uAleYy5XbWG4MftTdIR9kqKok7xAR6oNiKW', 'ADAPY4777F', 'Hyderabad', 'Telangana', '473', 500072, NULL, 'abroad consultant', '12', 'global', 'assets/business_listing_images/69437af43b2ed.R1Global - Red.png', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2025-12-18 03:54:50', '1', '9665156355', '9951552424', '2025-12-18 03:54:32'),
(135, 'SATHWIK KOOCHANA', 150, '8522881144', '$2y$10$p/FolQyYEIwiJH0AzCk4/uQAul25sZgZH0SCFfKdxzE2QP70xPpiK', 'DLZPK8211G', 'HYDERABAD', 'Telangana', '473', 500038, NULL, 'We are hiring Executives and Telecallers , Ameerpet', '3', NULL, 'assets/business_listing_images/6948f370d434f.1.png', NULL, '508100', 20, NULL, 2, 'INR', 'captured', 'RazorPay', '2025-12-22 07:29:56', '0', '8522881144', 'admin', '2025-12-22 07:29:56'),
(136, 'Krishna', 1622, '9550306333', '$2y$10$0lbvFa/mtXjtrGd.AW7Ve.Y5MOkAeTVb0KeGvbvE2AReJV7FL2Ghi', 'AQQPC5940F', 'Hyderabad', 'Telangana', '473', 500020, NULL, 'customized songs for any occasion', '149', 'krishn', 'assets/business_listing_images/69490336b0db7.WhatsApp Image 2025-12-22 at 1.54.04 PM.jpeg', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2025-12-22 08:40:46', '1', '9550306333', '8639974381', '2025-12-22 08:37:14');
INSERT INTO `business_listing_users` (`user_id`, `member_name`, `service_user_id`, `member_phone`, `password`, `pan_number`, `address`, `state`, `district`, `pincode`, `location`, `description`, `profession`, `coupon_code`, `business_image`, `bank_name`, `cumulative_gross`, `commission_percentage`, `account_number`, `business_listing_type`, `currency`, `payment_status`, `payment_method`, `enrolled_date`, `status`, `referral_id`, `referral_by`, `created_at`) VALUES
(137, 'Vision Board Ramesh', 1659, '9966591915', '$2y$10$F/1yFS1JY0OFFwZc.4e0Cu/dJQYegUzd/J3.FfnxOnYWtE5wcqqda', 'AFFPV1441N', 'Hyderabad', 'Telangana', '473', 500038, NULL, 'A Vision Board is a visual tool that shows your goals, dreams, and desired life using images, words, and affirmations—so you can see them every day and stay focused.', '152', 'viison', 'assets/business_listing_images/695f5fe031394.WhatsApp Image 2026-01-02 at 19.14.13.jpeg', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2026-01-08 08:15:33', '1', '9966591915', '9550306333', '2026-01-08 07:42:28'),
(138, 'Siriyapag Swapna', 1756, '7032915528', '$2y$10$YBQk3y/PkWj9rU88mcjQMe6NbDnZhy.i7L6kBrySEL.TJvktIdSzK', 'AXHPM6614J', 'Hyderabad', 'Telangana', '473', 500072, NULL, 'marketing', '83', 'swapna', 'assets/business_listing_images/696111563aae2.WhatsApp Image 2026-01-09 at 19.49.08.jpeg', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2026-01-09 14:32:41', '1', '7032915528', '8639974381', '2026-01-09 14:31:54'),
(139, 'Dr Murali N', 2019, '9043632463', '$2y$10$mb4PbFqONAjkiSP35eiUpe08hryeGlRg/6nLcEq4PMjwOPAIY22AO', 'BKLPG8529C', 'Hyderabad', 'Telangana', '473', 500094, NULL, 'We are providing engineering Services in 2D drawings and 3D model creations, FE simulations and CFD simulations related to Mechanical, electrical engineering domains and also performing Staad Pro analysis for the Civil engineering structures.. Also, providing training and certifications to the corporate people and engineering students.', '154', 'Drmura', 'assets/business_listing_images/69a6513cc69b8.WhatsApp Image 2026-03-02 at 20.25.20.jpeg', NULL, '2000', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2026-03-04 14:06:07', '1', '9043632463', '8341257474', '2026-03-03 03:10:56'),
(140, 'Dr.Kanchana Laxmi', 2030, '9959236170', '$2y$10$lKL/p4LiQoi3cgLfHYO9QOMlDyqq5V2vdmgDjK66XKwxwRIRpVN1W', 'CSBPK3255J', 'Hyderabad', 'Telangana', '473', 500082, NULL, 'I AM AN AYURVEDA PHYSICIAN ,I TREAT ALL TYPES OF CHRONIC PROBLEMS LIKE ARTHRITIS, JOINT PAINS,SINUS,MIAGRAINE,BACK ACHE,SPONDILOSIS,FEMALE HEALTH PROBLEMS, SKIN ISSUES ETC', '22', 'Kanchn', 'assets/business_listing_images/69a8318c28fd5.WhatsApp Image 2026-03-04 at 18.41.45.jpeg', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2026-03-04 13:21:08', '1', '9959236170', '8639974381', '2026-03-04 13:20:16'),
(141, 'Thota kishore', 756, '8341257474', '$2y$10$s2TCU7oBKPftVT0cU5Aj8uW/cW7keytPJeDjve5xZoNb47TrAZnrK', 'AGJPT3926F', 'Hyderabad', 'Telangana', '473', 500062, NULL, 'DIAGNOSTIC SERVICE CENTRE', '153', 'Thotak', 'assets/business_listing_images/69b15eb5ea004.Untitled design (3).png', NULL, '3000', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2026-03-11 12:24:01', '1', '8341257474', '7229812345', '2026-03-11 12:23:21'),
(142, 'Sheik Mastan Shaakier', 2052, '8178973971', '$2y$10$3bOEGCOFAMxmlefoZ3XAfuwc2OXe3v6V/ZQHtNXoEvPY6PdiZ/G1m', 'CCGPS3833M', 'Telangana', 'Telangana', '473', 500032, NULL, 'Well Qualified Civil Engineer with 15+ years of experience in both Structural Design and Turnkey projects', '10', 'SMasta', 'assets/business_listing_images/69b4375d43f3d.Photo.jpg', NULL, '0', 8, NULL, 0, 'INR', 'captured', 'RazorPay', '2026-03-13 16:35:35', '1', '8178973971', '8639974381', '2026-03-13 16:12:17');

-- --------------------------------------------------------

--
-- Table structure for table `cart_products`
--

CREATE TABLE `cart_products` (
  `cart_id` int NOT NULL,
  `service_user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart_products`
--

INSERT INTO `cart_products` (`cart_id`, `service_user_id`, `product_id`, `quantity`, `created_at`) VALUES
(83, 392, 25, 1, '2024-06-14 11:11:06'),
(93, 416, 41, 3, '2024-06-24 07:03:07'),
(94, 416, 37, 2, '2024-06-24 07:03:15'),
(98, 251, 152, 1, '2024-06-24 09:44:33'),
(115, 439, 129, 2, '2024-07-03 09:36:10'),
(119, 490, 40, 1, '2024-07-07 13:12:51'),
(120, 490, 34, 1, '2024-07-07 13:13:10'),
(122, 500, 57, 1, '2024-07-07 15:36:14'),
(125, 508, 36, 1, '2024-07-09 03:41:27'),
(127, 508, 226, 2, '2024-07-09 10:35:13'),
(132, 278, 85, 1, '2024-07-14 04:44:39'),
(133, 278, 89, 1, '2024-07-14 04:44:48'),
(137, 515, 96, 1, '2024-07-14 15:12:36'),
(138, 540, 190, 1, '2024-07-15 07:04:52'),
(142, 254, 256, 1, '2024-07-17 10:37:26'),
(151, 393, 99, 1, '2024-07-27 08:25:08'),
(152, 393, 89, 1, '2024-07-27 08:25:12'),
(153, 393, 87, 1, '2024-07-27 08:25:14'),
(156, 393, 102, 1, '2024-07-27 08:27:55'),
(161, 619, 243, 1, '2024-08-01 12:18:35'),
(168, 653, 304, 1, '2024-08-07 01:31:23'),
(189, 698, 407, 1, '2024-08-29 17:30:17'),
(190, 698, 398, 2, '2024-08-29 17:30:26'),
(200, 706, 398, 1, '2024-09-04 05:33:36'),
(201, 706, 407, 1, '2024-09-04 05:33:44'),
(204, 715, 407, 1, '2024-09-04 17:47:09'),
(216, 728, 368, 1, '2024-09-17 07:01:45'),
(221, 150, 305, 1, '2024-09-21 11:23:45'),
(232, 742, 390, 3, '2024-09-25 17:13:49'),
(233, 747, 380, 1, '2024-09-26 08:58:21'),
(234, 747, 119, 2, '2024-09-26 08:58:25'),
(235, 747, 305, 2, '2024-09-26 08:58:37'),
(237, 747, 369, 1, '2024-09-26 08:59:21'),
(261, 767, 380, 1, '2024-10-11 12:23:06'),
(277, 759, 265, 1, '2024-10-26 16:00:19'),
(278, 259, 436, 1, '2024-10-31 11:07:32'),
(286, 802, 436, 1, '2024-11-13 03:47:04'),
(299, 807, 461, 1, '2024-11-15 13:29:51'),
(303, 809, 490, 1, '2024-11-18 15:49:19'),
(307, 200, 24, 2, '2024-11-19 10:26:31'),
(321, 252, 260, 1, '2024-11-27 06:30:06'),
(329, 809, 492, 1, '2024-12-05 15:11:57'),
(334, 943, 375, 1, '2024-12-06 13:43:32'),
(335, 943, 313, 2, '2024-12-06 13:43:42'),
(351, 977, 489, 1, '2024-12-13 09:59:18'),
(365, 1031, 486, 1, '2024-12-23 05:39:44'),
(375, 836, 457, 3, '2025-01-17 08:35:38'),
(380, 952, 508, 1, '2025-01-20 07:53:01'),
(386, 836, 433, 1, '2025-01-29 08:00:12'),
(387, 873, 453, 1, '2025-01-30 10:52:47'),
(395, 1090, 569, 1, '2025-02-05 09:46:25'),
(396, 1104, 570, 1, '2025-02-08 06:12:10'),
(397, 1109, 494, 1, '2025-02-10 12:53:05'),
(402, 264, 334, 1, '2025-02-12 07:22:37'),
(403, 264, 313, 1, '2025-02-12 07:23:27'),
(404, 264, 314, 1, '2025-02-12 07:23:30'),
(405, 264, 315, 1, '2025-02-12 07:23:39'),
(406, 264, 376, 1, '2025-02-12 07:24:07'),
(407, 264, 561, 1, '2025-02-12 07:24:30'),
(408, 264, 489, 1, '2025-02-12 07:25:18'),
(409, 264, 534, 1, '2025-02-12 07:27:03'),
(410, 264, 536, 1, '2025-02-12 07:27:20'),
(411, 264, 542, 1, '2025-02-12 07:27:42'),
(412, 264, 544, 1, '2025-02-12 07:27:53'),
(413, 264, 550, 1, '2025-02-12 07:28:12'),
(414, 264, 557, 1, '2025-02-12 07:28:33'),
(415, 264, 559, 1, '2025-02-12 07:28:59'),
(416, 1141, 565, 1, '2025-02-18 16:36:30'),
(417, 1141, 569, 1, '2025-02-18 16:36:40'),
(418, 1159, 494, 1, '2025-02-25 02:07:14'),
(422, 735, 565, 1, '2025-03-01 07:12:31'),
(423, 735, 572, 1, '2025-03-01 07:13:11'),
(440, 1088, 380, 10, '2025-04-15 10:24:03'),
(441, 1088, 389, 6, '2025-04-15 10:25:22'),
(462, 1257, 205, 1, '2025-06-02 15:42:49'),
(469, 1299, 363, 1, '2025-06-05 01:56:48'),
(470, 1299, 361, 1, '2025-06-05 01:56:57'),
(472, 1299, 420, 1, '2025-06-05 01:57:23'),
(473, 1299, 567, 1, '2025-06-05 01:57:32'),
(474, 1299, 360, 1, '2025-06-05 01:58:08'),
(476, 1299, 396, 1, '2025-06-05 01:58:19'),
(478, 1299, 392, 1, '2025-06-05 01:58:35'),
(479, 1299, 397, 1, '2025-06-05 01:58:42'),
(481, 1331, 63, 1, '2025-06-11 15:09:45'),
(483, 1332, 506, 1, '2025-06-16 14:11:18'),
(488, 1373, 564, 1, '2025-07-15 09:50:05'),
(491, 380, 417, 1, '2025-07-21 15:24:22'),
(499, 1445, 476, 1, '2025-07-27 10:05:06'),
(500, 1445, 457, 1, '2025-07-27 10:05:14'),
(503, 1448, 216, 1, '2025-07-29 09:12:20'),
(517, 789, 442, 1, '2025-08-04 11:27:17'),
(518, 1364, 467, 1, '2025-08-09 03:24:08'),
(519, 1364, 470, 1, '2025-08-09 03:28:13'),
(520, 1364, 477, 1, '2025-08-09 03:31:50'),
(521, 1364, 457, 10, '2025-08-09 03:32:51'),
(526, 1487, 430, 1, '2025-08-15 15:41:43'),
(527, 1364, 442, 1, '2025-08-22 05:10:10'),
(534, 1380, 76, 1, '2025-09-02 14:48:29'),
(535, 723, 393, 1, '2025-09-02 15:33:28'),
(536, 723, 392, 1, '2025-09-02 15:33:53'),
(537, 723, 411, 2, '2025-09-02 15:34:36'),
(541, 1376, 309, 1, '2025-11-24 09:24:45'),
(542, 813, 152, 1, '2025-11-29 14:53:15'),
(543, 813, 150, 1, '2025-11-29 14:53:20'),
(545, 813, 309, 1, '2025-11-30 06:52:21'),
(550, 1602, 150, 1, '2025-12-09 14:44:25'),
(552, 1602, 595, 1, '2025-12-10 04:17:24'),
(553, 1619, 315, 1, '2025-12-20 06:24:48'),
(554, 1619, 372, 1, '2025-12-20 06:25:07'),
(555, 1619, 374, 1, '2025-12-20 06:25:08'),
(556, 1619, 376, 1, '2025-12-20 06:25:10'),
(557, 1619, 378, 1, '2025-12-20 06:25:11'),
(558, 1619, 377, 1, '2025-12-20 06:25:13'),
(582, 1612, 485, 1, '2026-01-02 06:20:59'),
(589, 1682, 636, 1, '2026-01-03 09:14:08'),
(595, 1694, 440, 1, '2026-01-04 07:19:45'),
(598, 1620, 576, 1, '2026-01-06 10:15:35'),
(599, 1620, 633, 1, '2026-01-06 10:15:49'),
(605, 1663, 385, 1, '2026-01-07 12:40:23'),
(606, 1663, 395, 1, '2026-01-07 12:41:35'),
(607, 1663, 437, 1, '2026-01-07 12:43:45'),
(608, 1663, 590, 2, '2026-01-07 12:45:00'),
(609, 1663, 608, 1, '2026-01-07 12:46:27'),
(610, 1663, 619, 2, '2026-01-07 12:47:41'),
(611, 1663, 618, 1, '2026-01-07 12:48:02'),
(612, 1663, 621, 2, '2026-01-07 12:49:12'),
(621, 1797, 380, 1, '2026-01-12 13:31:46'),
(622, 1797, 381, 1, '2026-01-12 13:31:54'),
(623, 1797, 383, 1, '2026-01-12 13:32:09'),
(624, 1797, 387, 1, '2026-01-12 13:34:20'),
(626, 1769, 383, 1, '2026-01-13 10:45:04'),
(635, 1804, 485, 1, '2026-01-16 11:53:11'),
(642, 1822, 470, 1, '2026-01-18 07:28:20'),
(661, 1880, 362, 1, '2026-02-01 17:35:18'),
(667, 1882, 384, 1, '2026-02-02 06:21:34'),
(668, 1882, 382, 1, '2026-02-02 06:21:55'),
(669, 1882, 383, 1, '2026-02-02 06:22:25'),
(670, 1882, 415, 1, '2026-02-02 06:25:04'),
(674, 1892, 151, 1, '2026-02-03 13:51:24'),
(679, 1902, 381, 1, '2026-02-08 05:39:24'),
(683, 1903, 383, 1, '2026-02-10 09:17:45'),
(684, 1903, 410, 1, '2026-02-10 09:18:37'),
(686, 1903, 412, 1, '2026-02-10 09:19:01'),
(687, 1903, 413, 1, '2026-02-10 09:19:25'),
(688, 1903, 415, 1, '2026-02-10 09:19:37'),
(690, 1927, 621, 1, '2026-02-10 16:03:29'),
(692, 1927, 608, 1, '2026-02-10 16:06:53'),
(694, 1927, 428, 1, '2026-02-10 16:08:59'),
(695, 1927, 611, 1, '2026-02-10 16:10:28'),
(696, 1927, 589, 1, '2026-02-10 16:11:56'),
(697, 1927, 430, 1, '2026-02-10 16:13:27'),
(698, 1927, 399, 1, '2026-02-10 16:16:09'),
(699, 1927, 397, 1, '2026-02-10 16:16:47'),
(700, 1927, 395, 1, '2026-02-10 16:17:16'),
(701, 1927, 390, 1, '2026-02-10 16:19:21'),
(702, 1927, 393, 1, '2026-02-10 16:19:57'),
(703, 1927, 585, 1, '2026-02-10 16:21:10'),
(704, 1927, 627, 1, '2026-02-10 16:23:37'),
(705, 1927, 404, 1, '2026-02-10 16:26:12'),
(710, 1975, 642, 1, '2026-02-13 11:51:10'),
(714, 701, 384, 2, '2026-02-17 00:07:02'),
(715, 701, 409, 1, '2026-02-17 00:07:42'),
(716, 701, 404, 1, '2026-02-17 00:08:01'),
(718, 701, 410, 1, '2026-02-17 00:08:21'),
(719, 701, 412, 1, '2026-02-17 00:08:28'),
(720, 701, 415, 1, '2026-02-17 00:08:37'),
(722, 701, 584, 1, '2026-02-17 00:09:21'),
(723, 701, 592, 1, '2026-02-17 00:09:36'),
(724, 701, 601, 1, '2026-02-17 00:09:50'),
(725, 701, 608, 1, '2026-02-17 00:10:18'),
(726, 701, 618, 1, '2026-02-17 00:10:49'),
(727, 1429, 522, 2, '2026-02-20 10:06:49'),
(728, 1429, 576, 1, '2026-02-20 10:07:02'),
(729, 1429, 633, 1, '2026-02-20 10:07:14'),
(731, 1429, 643, 1, '2026-02-20 10:07:38'),
(732, 1429, 644, 1, '2026-02-20 10:07:58'),
(733, 1429, 638, 1, '2026-02-20 10:08:16'),
(734, 703, 577, 1, '2026-02-20 15:51:22'),
(760, 1939, 669, 1, '2026-02-22 16:58:47'),
(767, 2024, 626, 1, '2026-03-03 12:12:30'),
(770, 2023, 576, 1, '2026-03-09 12:21:54'),
(771, 2023, 522, 1, '2026-03-09 12:22:03'),
(772, 2023, 527, 1, '2026-03-09 12:22:26'),
(773, 2023, 528, 1, '2026-03-09 12:22:34'),
(774, 2023, 578, 1, '2026-03-09 12:22:48'),
(775, 2023, 633, 1, '2026-03-09 12:22:57'),
(776, 2023, 634, 1, '2026-03-09 12:23:06'),
(778, 2023, 636, 1, '2026-03-09 12:23:20'),
(779, 168, 594, 2, '2026-03-12 07:10:28'),
(784, 2009, 75, 1, '2026-03-13 16:21:30'),
(785, 1583, 205, 1, '2026-03-18 06:15:40'),
(790, 2082, 411, 1, '2026-03-23 00:01:48'),
(791, 2073, 637, 1, '2026-03-25 04:53:50'),
(792, 2073, 643, 1, '2026-03-25 04:54:42'),
(793, 2073, 651, 1, '2026-03-25 04:55:48'),
(795, 572, 420, 1, '2026-03-27 12:54:53'),
(797, 2094, 307, 1, '2026-03-28 07:04:55'),
(798, 2103, 633, 1, '2026-03-30 16:50:02'),
(799, 2103, 635, 1, '2026-03-30 16:50:25'),
(800, 2103, 643, 2, '2026-03-30 16:51:47'),
(801, 2103, 676, 1, '2026-03-30 16:53:25'),
(802, 2103, 677, 1, '2026-03-30 16:53:48'),
(803, 2103, 576, 1, '2026-03-30 16:55:37'),
(804, 2103, 526, 1, '2026-03-30 17:01:27'),
(805, 2103, 527, 1, '2026-03-30 17:02:51'),
(806, 2103, 637, 1, '2026-03-30 17:03:35'),
(808, 148, 307, 1, '2026-04-03 11:46:55'),
(809, 1569, 657, 1, '2026-04-06 09:46:30'),
(810, 1569, 259, 1, '2026-04-06 09:53:22'),
(812, 2123, 340, 1, '2026-04-06 15:22:07');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `CategoryName` varchar(100) NOT NULL,
  `Vendor_id` int NOT NULL,
  `ImageURL` varchar(255) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `CategoryName`, `Vendor_id`, `ImageURL`, `CreatedAt`) VALUES
(37, 'Laptops Category', 28, 'assets/vendor_assets/category_images_admin/6656cd2b949b6.laptop_category.jpeg', '2024-05-29 06:37:31'),
(39, 'GROCERY', 37, 'assets/vendor_assets/category_images/39/6969f12e0dca5.addmagpro Products  (2).png', '2024-05-29 10:09:34'),
(41, 'Tours-Travels', 37, 'assets/vendor_assets/category_images/41/6969f1ba9408c.addmagpro Products .png', '2024-05-29 10:14:54'),
(43, 'Nutrition Health', 37, 'assets/vendor_assets/category_images/43/6969f3f749fce.addmagpro Products  (1).png', '2024-05-29 10:15:31'),
(44, 'Ads', 37, 'assets/vendor_assets/category_images/44/6969f79a232de.addmagpro Products  (4).png', '2024-05-29 10:23:06'),
(45, 'LIFE INSURENCE', 38, 'assets/vendor_assets/category_images/45/66585c0b1141b.4.png', '2024-05-29 16:05:10'),
(49, 'CARE HEALTH', 38, 'assets/vendor_assets/category_images_admin/66585c6189805.3.png', '2024-05-30 11:00:49'),
(50, 'GENARAL INSURENCE', 38, 'assets/vendor_assets/category_images_admin/66585c8f57867.2.png', '2024-05-30 11:01:35'),
(51, 'BIOENERGY', 37, 'assets/vendor_assets/category_images/51/696a779a865c1.addmagpro Products  (11).png', '2024-05-30 15:43:29'),
(52, 'Personal Care', 37, 'assets/vendor_assets/category_images/52/696a729d9de6c.addmagpro Products  (6).png', '2024-05-30 15:47:53'),
(53, 'Men Fashion', 37, 'assets/vendor_assets/category_images/53/696a70efc46e8.addmagpro Products  (3).png', '2024-05-30 15:58:17'),
(56, 'BOOKS', 40, 'assets/vendor_assets/category_images_admin/6661775b5823a.11.png', '2024-06-06 08:46:19'),
(57, 'NUTRITION', 41, 'assets/vendor_assets/category_images/57/6663162615347.213.jpg', '2024-06-06 11:32:28'),
(63, 'SAREES', 42, 'assets/vendor_assets/category_images_admin/667a5e6c403e5.29.jpg', '2024-06-25 06:06:36'),
(64, 'MEMBRSHIP', 43, 'assets/vendor_assets/category_images_admin/667b8e46de4a2.cc2.jpeg', '2024-06-26 03:43:02'),
(65, 'BEST CARE', 45, 'assets/vendor_assets/category_images_admin/667bf3e0cc1e4.2.png', '2024-06-26 10:56:32'),
(66, 'TRAVEL', 44, 'assets/vendor_assets/category_images_admin/667eebc134edd.TRAVELS.png', '2024-06-28 16:58:41'),
(67, 'E ZYKLE', 46, 'assets/vendor_assets/category_images_admin/667fdcee55e50.EZykle vendor.png', '2024-06-29 10:07:42'),
(68, 'BENEFIT PLUS', 48, 'assets/vendor_assets/category_images_admin/668d4f34b889d.BENEFIT PLUS.jpg', '2024-07-09 14:54:44'),
(69, 'EV VEHICLE', 49, 'assets/vendor_assets/category_images_admin/669774e655c3f.Epic_1.jpg', '2024-07-17 07:38:14'),
(70, 'AYURVEDA', 50, 'assets/vendor_assets/category_images_admin/66b0f285077e5.39.png', '2024-08-05 15:40:53'),
(71, 'Insurance', 54, 'assets/vendor_assets/category_images_admin/66b6d70291f5f.product-jpeg.jpg', '2024-08-10 02:57:06'),
(72, 'Women Fashion', 37, 'assets/vendor_assets/category_images/72/696a71fb6a98f.addmagpro Products  (5).png', '2024-08-11 07:40:02'),
(82, 'HOMECARE', 37, 'assets/vendor_assets/category_images/82/696a73345bc83.addmagpro Products  (7).png', '2024-08-12 10:31:17'),
(83, 'Smart Classes', 55, 'assets/vendor_assets/category_images/83/66bb07a412ee9.4.jpg', '2024-08-13 06:04:17'),
(84, 'Books/Material', 55, 'assets/vendor_assets/category_images/84/66bb07b14eccd.5.jpg', '2024-08-13 06:04:48'),
(85, 'GROCERY', 56, 'assets/vendor_assets/category_images_admin/66f79b7cc760d.Grocery.jpg', '2024-09-28 06:00:29'),
(86, 'HOME CARE', 56, 'assets/vendor_assets/category_images_admin/66f79b9504ef0.blog-homecare-14-12-2022-691340_l.png', '2024-09-28 06:00:53'),
(87, 'PERSONAL CARE', 56, 'assets/vendor_assets/category_images_admin/66f79c6b55fa6.depositphotos_126693854-stock-photo-set-of-body-care-products.jpg', '2024-09-28 06:04:27'),
(89, 'Rs 1050/- JOINING KIT', 37, 'assets/vendor_assets/category_images/89/699b1540e6e60.1050.png', '2024-11-11 13:43:40'),
(90, 'Rs 3000/-  GROCERY KIT', 37, 'assets/vendor_assets/category_images_admin/67324bd65f35f.1.png', '2024-11-11 18:24:22'),
(91, 'Bulk WhatsApp software', 57, 'assets/vendor_assets/category_images_admin/6749df5db413c.031-copy.webp', '2024-11-29 15:35:57'),
(92, 'Multi Device Button Bulk WhatsApp', 57, 'assets/vendor_assets/category_images_admin/6749dfce5b61a.041-copy-1-300x300~2.jpg', '2024-11-29 15:37:50'),
(93, 'ABG', 58, 'assets/vendor_assets/category_images_admin/674d4b81074a5.ABG.png', '2024-12-02 05:54:09'),
(94, 'DEMO TENTS', 59, 'assets/vendor_assets/category_images/94/674ddc1ae58c3.Demo Tents.jpg', '2024-12-02 16:07:23'),
(95, 'Monsoon Umbrella', 59, 'assets/vendor_assets/category_images_admin/674ddc3f75ed7.Monsoon Umbrella.jpg', '2024-12-02 16:11:43'),
(96, 'Auto Ads', 59, 'assets/vendor_assets/category_images_admin/674ddc5d02e8f.Auto Ads.jpg', '2024-12-02 16:12:13'),
(97, 'Rollup Standee', 59, 'assets/vendor_assets/category_images_admin/674ddc7455781.Rollup Standee.jpg', '2024-12-02 16:12:36'),
(98, 'T-Shirt Printing', 59, 'assets/vendor_assets/category_images_admin/674ddc913d483.T-Shirt Printing.jpg', '2024-12-02 16:13:05'),
(99, 'Promotion Table', 59, 'assets/vendor_assets/category_images_admin/674ddcb8bd9e1.Table1.jpg', '2024-12-02 16:13:44'),
(100, 'Designer studio', 60, 'assets/vendor_assets/category_images_admin/675db96e464df.Specialized.png', '2024-12-14 16:59:26'),
(101, 'HOME APPLIANCES', 37, 'assets/vendor_assets/category_images/101/696a7968b919c.addmagpro Products  (12).png', '2025-02-05 06:25:06');

-- --------------------------------------------------------

--
-- Table structure for table `classifieds`
--

CREATE TABLE `classifieds` (
  `id` int NOT NULL,
  `classified_name` varchar(50) NOT NULL,
  `classified_image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `classifieds`
--

INSERT INTO `classifieds` (`id`, `classified_name`, `classified_image`, `created_at`) VALUES
(1, 'Matrimony', 'assets/vendor_assets/classified_images_admin/6657f55614685.MATRIMONY.png', '2024-05-30 03:41:10'),
(2, 'Second Sales', 'assets/vendor_assets/classified_images_admin/6657f5699aa42.SECOUND SALE 2.png', '2024-05-30 03:41:29'),
(3, 'Jobs', 'assets/vendor_assets/classified_images_admin/6657f5789673d.JOBS.png', '2024-05-30 03:41:44'),
(4, 'Realestate', 'assets/vendor_assets/classified_images_admin/6657f5840b20a.REAL ESTATE.png', '2024-05-30 03:41:56'),
(5, 'To Let', 'assets/vendor_assets/classified_images_admin/6657f5938c88e.TO-LET.png', '2024-05-30 03:42:11');

-- --------------------------------------------------------

--
-- Table structure for table `commission_wallet`
--

CREATE TABLE `commission_wallet` (
  `wallet_id` int NOT NULL,
  `user_id` int NOT NULL,
  `balance` int DEFAULT '0',
  `purchase_income` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `commission_wallet`
--

INSERT INTO `commission_wallet` (`wallet_id`, `user_id`, `balance`, `purchase_income`, `created_at`) VALUES
(201566, 207, 280, 0, '2026-01-25 04:45:40'),
(201567, 188, 60, 0, '2026-01-25 04:46:12'),
(201569, 165, 80, 0, '2026-01-25 04:46:30'),
(201570, 188, 120, 0, '2026-01-25 04:47:50'),
(201571, 554, 80, 0, '2026-01-25 04:47:59'),
(201573, 148, 2652, 0, '2026-03-19 14:23:29'),
(201575, 627, 305, 462, '2026-01-10 05:48:39'),
(201576, 188, 60, 0, '2026-01-25 04:48:07'),
(201577, 627, 180, 0, '2026-01-25 04:48:16'),
(201578, 188, 60, 0, '2026-01-25 04:48:25'),
(201579, 659, 0, 197, '2024-08-30 06:18:51'),
(201580, 246, 0, 0, '2026-01-25 14:01:55'),
(201581, 152, 1779, 0, '2026-01-25 04:48:37'),
(201582, 670, 0, 308, '2024-08-31 11:44:46'),
(201583, 188, 94, 0, '2024-08-29 06:02:25'),
(201584, 188, 75, 0, '2024-08-29 06:42:27'),
(201585, 188, 94, 0, '2024-08-30 06:18:51'),
(201586, 188, 462, 0, '2024-08-31 11:44:46'),
(201587, 250, 0, 278, '2024-09-04 17:17:53'),
(201588, 252, 0, 630, '2024-10-12 17:48:06'),
(201589, 748, 0, 261, '2024-11-04 06:52:53'),
(201590, 735, 360, 420, '2026-01-24 14:23:39'),
(201591, 188, 244, 0, '2024-10-02 07:10:38'),
(201592, 188, 197, 0, '2024-11-04 06:52:53'),
(201593, 150, 4458, 0, '2026-01-11 05:59:29'),
(201594, 813, 640, 240, '2026-01-23 13:59:59'),
(201595, 755, 840, 0, '2025-02-24 04:33:57'),
(201596, 188, 180, 0, '2024-12-10 06:03:20'),
(201597, 836, 660, 240, '2026-01-23 13:59:59'),
(201598, 1088, 0, 800, '2026-01-23 14:25:02'),
(201599, 188, 200, 0, '2025-06-16 16:32:16'),
(201600, 188, 200, 0, '2025-06-16 16:32:22'),
(201601, 188, 200, 0, '2025-07-29 08:42:48'),
(201602, 1453, 80, 0, '2025-09-25 06:23:29'),
(201603, 188, 120, 0, '2025-09-25 06:23:29'),
(201604, 188, 200, 0, '2025-09-25 06:23:34'),
(201605, 1542, 0, 0, '2026-03-10 04:46:09'),
(201606, 188, 200, 0, '2025-12-05 11:11:19'),
(201607, 188, 615, 0, '2025-12-28 11:09:37'),
(201608, 168, 320, 480, '2026-03-31 04:08:10'),
(201609, 1567, 0, 0, '2026-01-07 04:25:04'),
(201610, 1569, 0, 240, '2026-01-23 14:32:25'),
(201611, 629, 0, 0, '2026-01-10 05:48:39'),
(201612, 188, 305, 0, '2026-01-10 05:48:39'),
(201613, 1656, 0, 0, '2026-01-11 05:59:29'),
(201614, 1006, 0, 480, '2026-01-23 14:11:10'),
(201615, 1730, 0, 960, '2026-03-31 04:06:40'),
(201616, 1677, 300, 240, '2026-03-31 04:05:05'),
(201617, 1733, 0, 480, '2026-03-07 08:58:46'),
(201618, 860, 0, 240, '2026-02-02 04:05:26'),
(201619, 1697, 0, 240, '2026-02-16 06:03:47'),
(201620, 188, 240, 0, '2026-02-16 05:12:16'),
(201621, 2000, 0, 0, '2026-02-21 08:45:32'),
(201622, 188, 604, 0, '2026-02-21 08:45:32'),
(201623, 188, 0, 0, '2026-02-25 14:16:07'),
(201624, 1572, 0, 0, '2026-03-07 11:05:01'),
(201625, 1810, 0, 0, '2026-03-07 08:42:23'),
(201626, 188, 360, 0, '2026-03-07 08:35:17'),
(201627, 188, 240, 0, '2026-03-07 08:57:29'),
(201628, 1376, 1040, 0, '2026-03-10 04:53:32'),
(201629, 188, 1560, 0, '2026-03-10 04:55:27'),
(201630, 1999, 0, 240, '2026-03-12 15:41:49'),
(201631, 1780, 0, 0, '2026-03-12 15:41:10'),
(201632, 188, 240, 0, '2026-03-12 15:34:23'),
(201633, 2055, 13105, 0, '2026-03-13 12:34:43'),
(201634, 2054, 0, 1961, '2026-04-06 10:02:00'),
(201635, 1980, 1237, 300, '2026-04-06 10:18:01'),
(201636, 188, 0, 0, '2026-03-19 14:15:40'),
(201637, 188, 240, 0, '2026-03-31 03:37:35'),
(201638, 188, 180, 0, '2026-03-31 04:05:05'),
(201639, 188, 1500, 0, '2026-04-06 10:02:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer_ordered_products`
--

CREATE TABLE `customer_ordered_products` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `email` text NOT NULL,
  `mobile_no` varchar(12) NOT NULL,
  `address` text NOT NULL,
  `zip_code` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `oredered_products` text NOT NULL,
  `total_amount` int NOT NULL,
  `ordered_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('Packing','Shipping','Delivered') NOT NULL DEFAULT 'Packing',
  `confirmation_status` int NOT NULL DEFAULT '0' COMMENT '0:confirmed 1:pending',
  `location` varchar(200) NOT NULL,
  `unique_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_ordered_products`
--

INSERT INTO `customer_ordered_products` (`id`, `user_id`, `first_name`, `email`, `mobile_no`, `address`, `zip_code`, `city`, `state`, `oredered_products`, `total_amount`, `ordered_date`, `status`, `confirmation_status`, `location`, `unique_id`) VALUES
(6, 393, 'Rakesh', 'admin@gmail.com', '9515932113', 'DURGA BHAVANI KIRANAM, BHAVANI NAGAR.HANAMAKONDA', '506001', 'WARANGAL', 'India', '[{\"product_id\":99,\"product_name\":\"Bello Onion Hair Oil\",\"purchase_price\":300,\"unit_price\":300,\"quantity\":1},{\"product_id\":89,\"product_name\":\"Bello Gold Face Wash\",\"purchase_price\":260,\"unit_price\":260,\"quantity\":1},{\"product_id\":87,\"product_name\":\"Bello Aloevera Shampoo\",\"purchase_price\":270,\"unit_price\":270,\"quantity\":1},{\"product_id\":102,\"product_name\":\"Bello Face Pack\",\"purchase_price\":210,\"unit_price\":210,\"quantity\":1}]', 1227, '2024-07-27 08:29:19', 'Packing', 0, 'Hyd', 83901),
(8, 612, 'Anitha', 'satyan1910@gmail.com', '7729058545', '12-10-407/26 NAMALAGUNDU SITHAPHALMANDI SECUNDERABAD TELANGANA-500061', '500061', 'HYDERABAD', 'TELANGANA', '[{\"product_id\":120,\"product_name\":\"Amla pickle\",\"purchase_price\":199,\"unit_price\":199,\"quantity\":1}]', 235, '2024-08-08 03:10:40', 'Packing', 0, 'Hyderabad', 12450),
(10, 246, 'RAYES SHOBHAN', 'sobhurao473@gmail.com', '7396783499', 'Flot no : 83,84 , Plot no :202 , Shiva sai residency,Pragathi nagar, Meerpet , hyderabad ,Telangana -500097', '500097', 'Hyderabad', 'telangana', '[{\"product_id\":137,\"product_name\":\"RAYE-12\",\"purchase_price\":1212,\"unit_price\":1212,\"quantity\":1},{\"product_id\":133,\"product_name\":\"RAYE-4\",\"purchase_price\":1999,\"unit_price\":1999,\"quantity\":1}]', 3211, '2024-08-21 06:03:05', 'Packing', 0, 'meerpet', 48196),
(11, 246, 'RAYES SHOBHAN', 'addmaginfo@gmail.com', '07702381784', 'HYDERABAD', '500098', 'Hyderabad', 'India', '[{\"product_id\":323,\"product_name\":\"DOLA SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":3}]', 3000, '2024-08-21 06:13:30', 'Packing', 1, 'HYDERABAD', 8123),
(13, 148, 'KUMARASWAMY  KOOCHANA', 'kkswamy5858@gmail.com', '7702381784', 'FLAT NO 501,AMEERPET', '500073', 'HYDERABAD', 'TELANGANA', '[{\"product_id\":323,\"product_name\":\"DOLA SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":322,\"product_name\":\"SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":321,\"product_name\":\"TUSSER SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1}]', 3000, '2024-08-28 07:35:18', 'Packing', 0, 'HYDERABAD', 65975),
(31, 670, 'THOTA LAKSHMI KUMARI', 'tklakshmikumari@gmail.com', '9848420393', 'DOOR NO A/8 LIC COLONY , OPP:SARAN JUTE BAGS. MEHEDIPATNAM', '500028', 'Hyderabad', 'Telangana', '[{\"product_id\":323,\"product_name\":\"DOLA SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":6},{\"product_id\":85,\"product_name\":\"Bello Acne Pimple Cream\",\"purchase_price\":240,\"unit_price\":240,\"quantity\":2},{\"product_id\":395,\"product_name\":\"GARAM MASALA\",\"purchase_price\":40,\"unit_price\":40,\"quantity\":1},{\"product_id\":391,\"product_name\":\"RASAM POWDER\",\"purchase_price\":60,\"unit_price\":60,\"quantity\":1}]', 6680, '2024-08-30 12:57:38', 'Packing', 0, 'Mehdipatnam', 60197),
(37, 250, 'AVM SATYANARAYANA', 'avmsatyanarayana@gmail.com', '8019592844', 'PLOT NO 36 MIG-II 9TH PHASE,KPHB COLONY KUKATPALLY', '500072', 'HYDERABAD', 'TELANGANA', '[{\"product_id\":322,\"product_name\":\"SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":3},{\"product_id\":92,\"product_name\":\"Bello Onion Hair Oil\",\"purchase_price\":550,\"unit_price\":550,\"quantity\":1}]', 3650, '2024-09-04 17:17:53', 'Packing', 1, 'HYDERABAD', 76829),
(38, 148, 'KUMARASWAMY  KOOCHANA', 'Kkswamy@gmail.com', '7702381784', 'FLAT NO 501,AMEERPET', '500073', 'HYDERABAD', 'TELANGANA', '[{\"product_id\":322,\"product_name\":\"SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":321,\"product_name\":\"TUSSER SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":123,\"product_name\":\"KESH WEALTH HAIR OIL\",\"purchase_price\":129,\"unit_price\":129,\"quantity\":1}]', 2229, '2024-09-12 08:24:57', 'Packing', 0, 'HYDERABAD', 80346),
(39, 627, 'KURRA ANITHA', 'vijay@gmail.com', '07702381784', 'HYDERABAD', '500073', 'Hyderabad', 'India', '[{\"product_id\":321,\"product_name\":\"TUSSER SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":3},{\"product_id\":91,\"product_name\":\"Bello Ice Cool Hair Oil\",\"purchase_price\":300,\"unit_price\":300,\"quantity\":1}]', 3400, '2024-09-21 01:33:33', 'Packing', 0, 'ECIL HYD', 54943),
(40, 627, 'KURRA ANITHA', 'vijay@gmail.com', '07702381784', 'HYDERABAD', '500073', 'Hyderabad', 'India', '[{\"product_id\":321,\"product_name\":\"TUSSER SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":3},{\"product_id\":91,\"product_name\":\"Bello Ice Cool Hair Oil\",\"purchase_price\":300,\"unit_price\":300,\"quantity\":1}]', 3400, '2024-09-21 01:35:56', 'Packing', 0, 'ECIL HYD', 94034),
(41, 627, 'KURRA ANITHA', 'vijay@gmail.com', '07702381784', 'HYDERABAD', '500073', 'Hyderabad', 'India', '[{\"product_id\":321,\"product_name\":\"TUSSER SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":3},{\"product_id\":91,\"product_name\":\"Bello Ice Cool Hair Oil\",\"purchase_price\":300,\"unit_price\":300,\"quantity\":1}]', 3400, '2024-09-21 01:38:43', 'Packing', 1, 'ECIL HYD', 37144),
(42, 252, 'K KISHAN RAO', 'KISHANRAO@GMAIL.COM', '9490534100', 'vill; GODISHALA    MDL; SAIDAPUR', '505468', 'HUZURABAD', 'TELANGANA', '[{\"product_id\":316,\"product_name\":\"JIMMY CHOO SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":4},{\"product_id\":119,\"product_name\":\"Fresh tea\",\"purchase_price\":175,\"unit_price\":175,\"quantity\":1},{\"product_id\":310,\"product_name\":\"HERITAGE BASMATHI RICE\",\"purchase_price\":200,\"unit_price\":269,\"quantity\":1}]', 4475, '2024-09-24 05:05:36', 'Packing', 0, 'HUZURABAD', 63346),
(43, 252, 'K KISHAN RAO', 'KISHANRAO@GMAIL.COM', '9490534100', 'vill; GODISHALA    MDL; SAIDAPUR', '505468', 'HUZURABAD', 'India', '[{\"product_id\":316,\"product_name\":\"JIMMY CHOO SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":4},{\"product_id\":119,\"product_name\":\"Fresh tea\",\"purchase_price\":175,\"unit_price\":175,\"quantity\":1},{\"product_id\":368,\"product_name\":\"PARRY SUGAR\",\"purchase_price\":60,\"unit_price\":60,\"quantity\":1},{\"product_id\":379,\"product_name\":\"BLACK PEPPER\",\"purchase_price\":40,\"unit_price\":40,\"quantity\":1}]', 4375, '2024-09-24 05:09:13', 'Packing', 1, 'HUZURABAD', 77912),
(44, 748, 'Mohd Abdul Rahman', 'abrahmanabid1@gmail.com', '9676808468', 'H no 16_2_638 paltan street no 2 ground floor , Malakpet opposite Sai Chandra apartment', '500036', 'Hyderabad', 'Telangana', '[{\"product_id\":321,\"product_name\":\"TUSSER SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":3},{\"product_id\":417,\"product_name\":\"PARACHUTE  COCONUT OIL\",\"purchase_price\":273,\"unit_price\":273,\"quantity\":1},{\"product_id\":307,\"product_name\":\"TOMATO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1}]', 3483, '2024-10-02 07:10:38', 'Packing', 1, 'Malakpet', 96067),
(45, 252, 'K KISHAN RAO', 'kalakotikishanrao@g.mail.com', '9490534100', 'vill; GODISHALA    MDL; SAIDAPUR', '505468', 'HUZURABAD', 'TELANGANA', '[{\"product_id\":362,\"product_name\":\"RED CHILLI POWDER\",\"purchase_price\":86,\"unit_price\":86,\"quantity\":4},{\"product_id\":379,\"product_name\":\"BLACK PEPPER\",\"purchase_price\":40,\"unit_price\":40,\"quantity\":4},{\"product_id\":387,\"product_name\":\"GREEN ELACHI\",\"purchase_price\":120,\"unit_price\":120,\"quantity\":4},{\"product_id\":413,\"product_name\":\"SUGAR\",\"purchase_price\":60,\"unit_price\":60,\"quantity\":2},{\"product_id\":428,\"product_name\":\"CLOVES\",\"purchase_price\":100,\"unit_price\":100,\"quantity\":2},{\"product_id\":361,\"product_name\":\"GINGER PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":2},{\"product_id\":306,\"product_name\":\"MANGO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":381,\"product_name\":\"AJWAIN\",\"purchase_price\":13,\"unit_price\":13,\"quantity\":5},{\"product_id\":384,\"product_name\":\"MENTHULU\",\"purchase_price\":9,\"unit_price\":9,\"quantity\":6},{\"product_id\":385,\"product_name\":\"SHAJEERA\",\"purchase_price\":30,\"unit_price\":30,\"quantity\":3}]', 1943, '2024-10-03 22:40:50', 'Packing', 1, 'HUZURABAD', 31703),
(47, 149, 'G RAMBABU', 'kkswamy5858@gmail.com', '9493142434', 'Dhnm', '855668', 'Bbmm', 'Gjmbc', '[{\"product_id\":264,\"product_name\":\"DIA CARE VATI\",\"purchase_price\":300,\"unit_price\":300,\"quantity\":9},{\"product_id\":265,\"product_name\":\"DIA CARE CHURNA\",\"purchase_price\":350,\"unit_price\":350,\"quantity\":1}]', 3150, '2024-10-05 14:51:02', 'Packing', 0, 'Eluru', 30428),
(48, 148, 'KUMARASWAMY  KOOCHANA', 'Kkaswamy5858@gmail.com', '7702381784', 'FLAT NO 501,AMEERPET', '500073', 'HYDERABAD', 'TELANGANA', '[{\"product_id\":306,\"product_name\":\"MANGO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":3},{\"product_id\":313,\"product_name\":\"Freshall\",\"purchase_price\":130,\"unit_price\":130,\"quantity\":4}]', 950, '2024-10-10 09:09:22', 'Packing', 0, 'HYDERABAD', 45409),
(49, 252, 'K KISHAN RAO', 'KISHANRAO@GMAIL.COM', '9490534100', 'vill; GODISHALA    MDL; SAIDAPUR', '505468', 'HUZURABAD', 'India', '[{\"product_id\":322,\"product_name\":\"SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":3},{\"product_id\":394,\"product_name\":\"PAVBAJI MASALA\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":2},{\"product_id\":433,\"product_name\":\"BESAN (SENAGAPAINDI)\",\"purchase_price\":173,\"unit_price\":173,\"quantity\":1}]', 3343, '2024-10-12 17:48:06', 'Packing', 1, 'HUZURABAD', 19115),
(50, 252, 'K KISHAN RAO', 'Kkswamy5858@gmail.com', '9490534100', 'vill; GODISHALA    MDL; SAIDAPUR', '505468', 'HUZURABAD', 'TELANGANA', '[{\"product_id\":306,\"product_name\":\"MANGO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":366,\"product_name\":\"TURMERIC POWDER\",\"purchase_price\":84,\"unit_price\":84,\"quantity\":1},{\"product_id\":412,\"product_name\":\"MOONG DAL\",\"purchase_price\":220,\"unit_price\":220,\"quantity\":1},{\"product_id\":433,\"product_name\":\"BESAN (SENAGAPAINDI)\",\"purchase_price\":173,\"unit_price\":173,\"quantity\":1}]', 687, '2024-10-16 11:49:07', 'Packing', 0, 'HUZURABAD', 44896),
(51, 659, 'Suresh Padavala', 'sureshpadavala0998@gmail.com', '7993912966', 'Ameerpeta', '500873', 'Hyderabad', 'Telangana', '[{\"product_id\":173,\"product_name\":\"Mandala Oversized T-Shirt\",\"purchase_price\":999,\"unit_price\":1999,\"quantity\":1},{\"product_id\":404,\"product_name\":\"TOOR DAL\",\"purchase_price\":250,\"unit_price\":250,\"quantity\":1}]', 1349, '2024-10-17 11:57:42', 'Packing', 0, 'Razole City', 30039),
(52, 148, 'KUMARASWAMY  KOOCHANA', 'addmaginfo@gmail.com', '07702381784', 'HYDERABAD', '500073', 'Hyderabad', 'India', '[{\"product_id\":306,\"product_name\":\"MANGO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":3},{\"product_id\":313,\"product_name\":\"Freshall\",\"purchase_price\":130,\"unit_price\":130,\"quantity\":4},{\"product_id\":431,\"product_name\":\"MALAYSIAN COFFEE\",\"purchase_price\":3000,\"unit_price\":3887,\"quantity\":1}]', 3950, '2024-10-21 08:46:00', 'Packing', 0, 'HYDERABAD', 46022),
(53, 148, 'KUMARASWAMY  KOOCHANA', 'addmaginfo@gmail.com', '07702381784', 'HYDERABAD', '500073', 'Hyderabad', 'India', '[{\"product_id\":306,\"product_name\":\"MANGO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":3},{\"product_id\":313,\"product_name\":\"Freshall\",\"purchase_price\":130,\"unit_price\":130,\"quantity\":4},{\"product_id\":431,\"product_name\":\"MALAYSIAN COFFEE\",\"purchase_price\":3000,\"unit_price\":3887,\"quantity\":1}]', 3950, '2024-10-21 08:46:39', 'Packing', 0, 'HYDERABAD', 14985),
(54, 252, 'K KISHAN RAO', 'kkswamy5858@gmail.com', '9490534100', 'vill; GODISHALA    MDL; SAIDAPUR', '505468', 'HUZURABAD', 'TELANGANA', '[{\"product_id\":306,\"product_name\":\"MANGO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":366,\"product_name\":\"TURMERIC POWDER\",\"purchase_price\":84,\"unit_price\":84,\"quantity\":1},{\"product_id\":412,\"product_name\":\"MOONG DAL\",\"purchase_price\":220,\"unit_price\":220,\"quantity\":1},{\"product_id\":433,\"product_name\":\"BESAN (SENAGAPAINDI)\",\"purchase_price\":173,\"unit_price\":173,\"quantity\":1},{\"product_id\":316,\"product_name\":\"JIMMY CHOO SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":321,\"product_name\":\"TUSSER SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1}]', 2687, '2024-10-23 10:20:26', 'Packing', 0, 'HUZURABAD', 63038),
(55, 252, 'K KISHAN RAO', 'kkswamy5858@gmail.com', '9490534100', 'vill; GODISHALA    MDL; SAIDAPUR', '505468', 'HUZURABAD', 'TELANGANA', '[{\"product_id\":306,\"product_name\":\"MANGO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":366,\"product_name\":\"TURMERIC POWDER\",\"purchase_price\":84,\"unit_price\":84,\"quantity\":1},{\"product_id\":412,\"product_name\":\"MOONG DAL\",\"purchase_price\":220,\"unit_price\":220,\"quantity\":1},{\"product_id\":433,\"product_name\":\"BESAN (SENAGAPAINDI)\",\"purchase_price\":173,\"unit_price\":173,\"quantity\":1},{\"product_id\":316,\"product_name\":\"JIMMY CHOO SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":321,\"product_name\":\"TUSSER SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1}]', 2687, '2024-10-23 10:22:06', 'Packing', 0, 'HUZURABAD', 29456),
(56, 153, 'K.KOUSHIK KUMAR', 'koochanaholidays@gmail.com', '9666386006', 'Ameerpet', '500073', 'Hyderabad', 'Telangana', '[{\"product_id\":322,\"product_name\":\"SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":323,\"product_name\":\"DOLA SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":324,\"product_name\":\"SATIN SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1}]', 3100, '2024-10-24 05:15:38', 'Packing', 0, 'HYDERABAD', 80670),
(57, 252, 'K KISHAN RAO', 'koochanaholidays@gmail.com', '9490534100', 'vill; GODISHALA    MDL; SAIDAPUR', '505468', 'HUZURABAD', 'TELANGANA', '[{\"product_id\":306,\"product_name\":\"MANGO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":366,\"product_name\":\"TURMERIC POWDER\",\"purchase_price\":84,\"unit_price\":84,\"quantity\":1},{\"product_id\":412,\"product_name\":\"MOONG DAL\",\"purchase_price\":220,\"unit_price\":220,\"quantity\":1},{\"product_id\":433,\"product_name\":\"BESAN (SENAGAPAINDI)\",\"purchase_price\":173,\"unit_price\":173,\"quantity\":1},{\"product_id\":316,\"product_name\":\"JIMMY CHOO SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":321,\"product_name\":\"TUSSER SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1}]', 2687, '2024-10-24 05:17:42', 'Packing', 0, 'HUZURABAD', 66766),
(58, 252, 'K KISHAN RAO', 'kkswamy5858@gmail.com', '9490534100', 'vill; GODISHALA    MDL; SAIDAPUR', '505468', 'HUZURABAD', 'TELANGANA', '[{\"product_id\":306,\"product_name\":\"MANGO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":366,\"product_name\":\"TURMERIC POWDER\",\"purchase_price\":84,\"unit_price\":84,\"quantity\":1},{\"product_id\":412,\"product_name\":\"MOONG DAL\",\"purchase_price\":220,\"unit_price\":220,\"quantity\":1},{\"product_id\":433,\"product_name\":\"BESAN (SENAGAPAINDI)\",\"purchase_price\":173,\"unit_price\":173,\"quantity\":1},{\"product_id\":316,\"product_name\":\"JIMMY CHOO SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":321,\"product_name\":\"TUSSER SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1}]', 2687, '2024-10-26 07:09:05', 'Packing', 0, 'HUZURABAD', 67960),
(59, 748, 'Mohd Abdul Rahman', 'addmaginfo@gmail.com', '9676808468', 'HYDERABAD', '500073', 'Hyderabad', 'India', '[{\"product_id\":322,\"product_name\":\"SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":3},{\"product_id\":389,\"product_name\":\"HING\",\"purchase_price\":74,\"unit_price\":74,\"quantity\":1},{\"product_id\":308,\"product_name\":\"RED CHILLI\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":428,\"product_name\":\"CLOVES\",\"purchase_price\":100,\"unit_price\":100,\"quantity\":1}]', 3384, '2024-11-04 06:52:53', 'Packing', 1, 'Malakpet', 18402),
(60, 252, 'K KISHAN RAO', 'kkswamy5858@gmail.com', '9490534100', 'vill; GODISHALA    MDL; SAIDAPUR', '505468', 'HUZURABAD', 'TELANGANA', '[{\"product_id\":149,\"product_name\":\"ALIEN EMPIRE HOODIE\",\"purchase_price\":1999,\"unit_price\":2499,\"quantity\":2},{\"product_id\":151,\"product_name\":\"Vibe Oversized T-Shirt\",\"purchase_price\":999,\"unit_price\":1499,\"quantity\":1},{\"product_id\":150,\"product_name\":\"WHITEOversized T-Shirt\",\"purchase_price\":599,\"unit_price\":799,\"quantity\":1}]', 5696, '2024-11-15 14:38:05', 'Packing', 0, 'HUZURABAD', 85344),
(61, 252, 'K KISHAN RAO', 'kkswamy5858@gmail.com', '9490534100', 'vill; GODISHALA    MDL; SAIDAPUR', '505468', 'HUZURABAD', 'TELANGANA', '[{\"product_id\":151,\"product_name\":\"Vibe Oversized T-Shirt\",\"purchase_price\":999,\"unit_price\":1499,\"quantity\":1},{\"product_id\":150,\"product_name\":\"WHITEOversized T-Shirt\",\"purchase_price\":599,\"unit_price\":799,\"quantity\":1}]', 1698, '2024-11-15 14:39:19', 'Packing', 0, 'HUZURABAD', 82138),
(62, 659, 'kiran babu', 'sureshpadavala09@gmail.com', '7995278856', 'hyderabad', '500026', 'Miyapur', 'india', '[{\"product_id\":306,\"product_name\":\"MANGO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":307,\"product_name\":\"TOMATO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":309,\"product_name\":\"LIME\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":362,\"product_name\":\"RED CHILLI POWDER\",\"purchase_price\":86,\"unit_price\":86,\"quantity\":1},{\"product_id\":308,\"product_name\":\"RED CHILLI\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":364,\"product_name\":\"MIRCH POWDER\",\"purchase_price\":190,\"unit_price\":190,\"quantity\":1}]', 4700, '2024-11-22 06:04:12', 'Packing', 0, 'miyapur', 80790),
(63, 659, 'Suresh Padavala', 'test@test.com', '7993912966', 'Ameerpeta', '500873', 'Hyderabad', 'Telangana', '[{\"product_id\":306,\"product_name\":\"MANGO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":307,\"product_name\":\"TOMATO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":309,\"product_name\":\"LIME\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":362,\"product_name\":\"RED CHILLI POWDER\",\"purchase_price\":86,\"unit_price\":86,\"quantity\":1},{\"product_id\":308,\"product_name\":\"RED CHILLI\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":364,\"product_name\":\"MIRCH POWDER\",\"purchase_price\":190,\"unit_price\":190,\"quantity\":1}]', 816, '2024-11-22 09:00:32', 'Packing', 0, 'Razole City', 59271),
(64, 813, 'Srikanth', 'addmaginfo@gmail.com', '9348963999', 'A Srikanth   Flat no102 Sailasree Residency Balayya Basthi Mahadevapuram Gajularamaram', '500055', 'Quthbullapur', 'Telangana', '[{\"product_id\":483,\"product_name\":\"PEPSODENT Gum Care + Toothpaste\",\"purchase_price\":300,\"unit_price\":300,\"quantity\":1},{\"product_id\":458,\"product_name\":\"Tamarind\\/Imli (Chinthapandu)\",\"purchase_price\":160,\"unit_price\":160,\"quantity\":1},{\"product_id\":456,\"product_name\":\"Red Chilli Powder 500 gm\",\"purchase_price\":250,\"unit_price\":250,\"quantity\":1},{\"product_id\":462,\"product_name\":\"RED CHILLI\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":467,\"product_name\":\"Parry\'s  Toor Dal (Kandi Pappu)\",\"purchase_price\":280,\"unit_price\":280,\"quantity\":1},{\"product_id\":469,\"product_name\":\"Priya Fortified & Refined Rice Bran Oil Pouch\",\"purchase_price\":210,\"unit_price\":210,\"quantity\":1},{\"product_id\":465,\"product_name\":\"BASMATHI RICE\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":1}]', 1610, '2024-12-10 05:53:17', 'Packing', 0, 'Kukatpally', 97000),
(65, 813, 'Srikanth', 'addmaginfo@gmail.com', '9348963999', 'A Srikanth   Flat no102 Sailasree Residency Balayya Basthi Mahadevapuram Gajularamaram', '500055', 'Quthbullapur', 'Telangana', '[{\"product_id\":483,\"product_name\":\"PEPSODENT Gum Care + Toothpaste\",\"purchase_price\":300,\"unit_price\":300,\"quantity\":1},{\"product_id\":458,\"product_name\":\"Tamarind\\/Imli (Chinthapandu)\",\"purchase_price\":160,\"unit_price\":160,\"quantity\":1},{\"product_id\":456,\"product_name\":\"Red Chilli Powder 500 gm\",\"purchase_price\":250,\"unit_price\":250,\"quantity\":1},{\"product_id\":462,\"product_name\":\"RED CHILLI\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":467,\"product_name\":\"Parry\'s  Toor Dal (Kandi Pappu)\",\"purchase_price\":280,\"unit_price\":280,\"quantity\":1},{\"product_id\":469,\"product_name\":\"Priya Fortified & Refined Rice Bran Oil Pouch\",\"purchase_price\":210,\"unit_price\":210,\"quantity\":1},{\"product_id\":465,\"product_name\":\"BASMATHI RICE\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":1},{\"product_id\":480,\"product_name\":\"Henko Detergent Liquid Top Load  Detergent\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":1},{\"product_id\":457,\"product_name\":\"Cumin  (jilakara)\",\"purchase_price\":160,\"unit_price\":160,\"quantity\":1},{\"product_id\":322,\"product_name\":\"SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1}]', 2970, '2024-12-10 05:54:46', 'Packing', 0, 'Kukatpally', 39512),
(66, 813, 'Srikanth', 'addmaginfo@gmail.com', '9348963999', 'A Srikanth   Flat no102 Sailasree Residency Balayya Basthi Mahadevapuram Gajularamaram', '500055', 'Quthbullapur', 'Telangana', '[{\"product_id\":483,\"product_name\":\"PEPSODENT Gum Care + Toothpaste\",\"purchase_price\":300,\"unit_price\":300,\"quantity\":1},{\"product_id\":458,\"product_name\":\"Tamarind\\/Imli (Chinthapandu)\",\"purchase_price\":160,\"unit_price\":160,\"quantity\":1},{\"product_id\":456,\"product_name\":\"Red Chilli Powder 500 gm\",\"purchase_price\":250,\"unit_price\":250,\"quantity\":1},{\"product_id\":462,\"product_name\":\"RED CHILLI\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":467,\"product_name\":\"Parry\'s  Toor Dal (Kandi Pappu)\",\"purchase_price\":280,\"unit_price\":280,\"quantity\":1},{\"product_id\":469,\"product_name\":\"Priya Fortified & Refined Rice Bran Oil Pouch\",\"purchase_price\":210,\"unit_price\":210,\"quantity\":1},{\"product_id\":465,\"product_name\":\"BASMATHI RICE\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":1},{\"product_id\":480,\"product_name\":\"Henko Detergent Liquid Top Load  Detergent\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":1},{\"product_id\":457,\"product_name\":\"Cumin  (jilakara)\",\"purchase_price\":160,\"unit_price\":160,\"quantity\":1},{\"product_id\":322,\"product_name\":\"SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":97,\"product_name\":\"Bello Onion Shampoo\",\"purchase_price\":130,\"unit_price\":130,\"quantity\":1}]', 3100, '2024-12-10 05:55:51', 'Packing', 0, 'Kukatpally', 69164),
(67, 813, 'Srikanth', 'addmaginfo@gmail.com', '9348963999', 'A Srikanth   Flat no102 Sailasree Residency Balayya Basthi Mahadevapuram Gajularamaram', '500055', 'Quthbullapur', 'Telangana', '[{\"product_id\":483,\"product_name\":\"PEPSODENT Gum Care + Toothpaste\",\"purchase_price\":300,\"unit_price\":300,\"quantity\":1},{\"product_id\":458,\"product_name\":\"Tamarind\\/Imli (Chinthapandu)\",\"purchase_price\":160,\"unit_price\":160,\"quantity\":1},{\"product_id\":456,\"product_name\":\"Red Chilli Powder 500 gm\",\"purchase_price\":250,\"unit_price\":250,\"quantity\":1},{\"product_id\":462,\"product_name\":\"RED CHILLI\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":467,\"product_name\":\"Parry\'s  Toor Dal (Kandi Pappu)\",\"purchase_price\":280,\"unit_price\":280,\"quantity\":1},{\"product_id\":469,\"product_name\":\"Priya Fortified & Refined Rice Bran Oil Pouch\",\"purchase_price\":210,\"unit_price\":210,\"quantity\":1},{\"product_id\":465,\"product_name\":\"BASMATHI RICE\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":1},{\"product_id\":480,\"product_name\":\"Henko Detergent Liquid Top Load  Detergent\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":1},{\"product_id\":457,\"product_name\":\"Cumin  (jilakara)\",\"purchase_price\":160,\"unit_price\":160,\"quantity\":1},{\"product_id\":322,\"product_name\":\"SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":97,\"product_name\":\"Bello Onion Shampoo\",\"purchase_price\":130,\"unit_price\":130,\"quantity\":1}]', 3100, '2024-12-10 06:03:20', 'Packing', 1, 'Kukatpally', 31415),
(68, 605, 'Hemadrirao.P', 'hemadri559@gmail.com', '9553799533', 'Flat No 565. Block A5, phase V. , Janapriya Appt', '500049', 'Miyapur Hyderabad', 'India', '[{\"product_id\":452,\"product_name\":\"MALAYSIAN COFFEE\",\"purchase_price\":1050,\"unit_price\":1196,\"quantity\":1}]', 1150, '2024-12-14 04:49:49', 'Packing', 0, 'Miyapur, Hyderabad', 9793),
(69, 813, 'Srikanth', 'addmaginfo@gmail.com', '9348963999', 'A Srikanth   Flat no102 Sailasree Residency Balayya Basthi Mahadevapuram Gajularamaram', '500055', 'Quthbullapur', 'Telangana', '[{\"product_id\":513,\"product_name\":\"Tailoring Course\",\"purchase_price\":5000,\"unit_price\":5000,\"quantity\":1}]', 5100, '2024-12-15 05:31:20', 'Packing', 0, 'Kukatpally', 14138),
(70, 836, 'YUGANDHAR TAMATAM', 'addmaginfo@gmail.com', '7869456369', 'HYDERABAD', '500049', 'Miyapur', 'Telangana', '[{\"product_id\":493,\"product_name\":\"Mangaldeep Puja Agarbattis\",\"purchase_price\":120,\"unit_price\":120,\"quantity\":3},{\"product_id\":457,\"product_name\":\"Cumin  (jilakara)\",\"purchase_price\":160,\"unit_price\":160,\"quantity\":3},{\"product_id\":460,\"product_name\":\"TOMATO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":3},{\"product_id\":462,\"product_name\":\"RED CHILLI\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":3},{\"product_id\":306,\"product_name\":\"MANGO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":3},{\"product_id\":366,\"product_name\":\"TURMERIC POWDER\",\"purchase_price\":84,\"unit_price\":84,\"quantity\":3},{\"product_id\":409,\"product_name\":\"URAD DAL (WHOLE)\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":3}]', 2782, '2025-01-29 07:58:06', 'Packing', 0, 'Miyapur', 16614),
(71, 836, 'YUGANDHAR TAMATAM', 'addmaginfo@gmail.com', '7869456369', 'HYDERABAD', '500049', 'Miyapur', 'Telangana', '[{\"product_id\":493,\"product_name\":\"Mangaldeep Puja Agarbattis\",\"purchase_price\":120,\"unit_price\":120,\"quantity\":3},{\"product_id\":457,\"product_name\":\"Cumin  (jilakara)\",\"purchase_price\":160,\"unit_price\":160,\"quantity\":3},{\"product_id\":460,\"product_name\":\"TOMATO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":3},{\"product_id\":462,\"product_name\":\"RED CHILLI\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":3},{\"product_id\":306,\"product_name\":\"MANGO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":3},{\"product_id\":366,\"product_name\":\"TURMERIC POWDER\",\"purchase_price\":84,\"unit_price\":84,\"quantity\":3},{\"product_id\":409,\"product_name\":\"URAD DAL (WHOLE)\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":3},{\"product_id\":389,\"product_name\":\"HING\",\"purchase_price\":74,\"unit_price\":74,\"quantity\":2},{\"product_id\":433,\"product_name\":\"BESAN (SENAGAPAINDI)\",\"purchase_price\":173,\"unit_price\":173,\"quantity\":1}]', 3103, '2025-01-29 08:00:33', 'Packing', 0, 'Miyapur', 77435),
(74, 873, 'Srinivasarao k', 'mailtosrinuk@gmail.com', '8885586684', 'Flat no 609, 6 th floor,, Annapurna Block, Aditya enclave, Amerrpet', '500016', 'Hyderabad', 'Telangana', '[{\"product_id\":453,\"product_name\":\"CHIKEN PICKLE\",\"purchase_price\":1050,\"unit_price\":1200,\"quantity\":1}]', 1150, '2025-01-30 10:59:44', 'Packing', 0, 'Hyderabad', 36246),
(75, 148, 'KUMARASWAMY  KOOCHANA', 'addmaginfo@gmail.com', '7702381784', 'FLAT NO 501,AMEERPET', '500073', 'HYDERABAD', 'TELANGANA', '[{\"product_id\":322,\"product_name\":\"SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":2},{\"product_id\":321,\"product_name\":\"TUSSER SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":323,\"product_name\":\"DOLA SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":324,\"product_name\":\"SATIN SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1}]', 5100, '2025-02-02 13:34:44', 'Packing', 0, 'HYDERABAD', 83566),
(76, 735, 'SKY SAY', 'JKTECHBEE@GMAIL.COM', '9346234899', '6-5-405, Plot no 26, Flat no 202, Vanasthalipuram', '500070', 'Hyderabad', 'India', '[{\"product_id\":308,\"product_name\":\"RED CHILLI\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":565,\"product_name\":\"RK MULTIGRAIN\",\"purchase_price\":180,\"unit_price\":180,\"quantity\":1},{\"product_id\":572,\"product_name\":\"U.S. Polo Assn\",\"purchase_price\":9899,\"unit_price\":10999,\"quantity\":1}]', 10289, '2025-03-01 07:13:49', 'Packing', 0, 'Hyderabad,Telangana', 8563),
(77, 1088, 'GANUGAPETA  SHARADA', 'addmaginfo@gmail.com', '8332821881', 'DOOR NO 187/B .FIRST PHASE AIWYN COLONY , KUKATPALY', '500072', 'DIST MEDCHAL', 'Telangana', '[{\"product_id\":327,\"product_name\":\"CHIFFON SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":323,\"product_name\":\"DOLA SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":331,\"product_name\":\"MEENA COTTON\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1}]', 3100, '2025-03-24 04:54:23', 'Packing', 0, 'HYDERABAD', 30985),
(78, 1088, 'GANUGAPETA  SHARADA', 'ganu@gmail.com', '8332821881', 'DOOR NO 187/B .FIRST PHASE AIWYN COLONY , KUKATPALY', '500072', 'DIST MEDCHAL', 'Telangana', '[{\"product_id\":307,\"product_name\":\"TOMATO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":362,\"product_name\":\"RED CHILLI POWDER\",\"purchase_price\":86,\"unit_price\":86,\"quantity\":1},{\"product_id\":379,\"product_name\":\"BLACK PEPPER\",\"purchase_price\":40,\"unit_price\":40,\"quantity\":1},{\"product_id\":364,\"product_name\":\"MIRCH POWDER\",\"purchase_price\":190,\"unit_price\":190,\"quantity\":1},{\"product_id\":380,\"product_name\":\"CLOVE\",\"purchase_price\":50,\"unit_price\":50,\"quantity\":10},{\"product_id\":389,\"product_name\":\"HING\",\"purchase_price\":74,\"unit_price\":74,\"quantity\":6}]', 1470, '2025-04-15 10:27:38', 'Packing', 0, 'HYDERABAD', 5781),
(84, 1380, 'NAVEEN KUMAR', 'addmaginfo@gmail.com', '9059597787', 'HYDERABAD', '500073', 'Hyderabad', 'India', '[{\"product_id\":322,\"product_name\":\"SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":323,\"product_name\":\"DOLA SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":324,\"product_name\":\"SATIN SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1}]', 3100, '2025-08-28 09:30:27', 'Packing', 0, 'NALGONDA', 70018),
(85, 723, 'Bollam Hemanth', 'addmaginfo@gmail.com', '9490334681', 'HYDERABAD', '500073', 'Hyderabad', 'India', '[{\"product_id\":76,\"product_name\":\"LAKSHA DWEEP\",\"purchase_price\":82000,\"unit_price\":82000,\"quantity\":1},{\"product_id\":306,\"product_name\":\"MANGO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":307,\"product_name\":\"TOMATO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":309,\"product_name\":\"LIME\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":3}]', 82650, '2025-09-02 15:18:44', 'Packing', 0, 'HYDERABAD', 69399),
(86, 723, 'Bollam Hemanth', 'addmaginfo@gmail.com', '9490334681', 'HYDERABAD', '500073', 'Hyderabad', 'India', '[{\"product_id\":76,\"product_name\":\"LAKSHA DWEEP\",\"purchase_price\":82000,\"unit_price\":82000,\"quantity\":1},{\"product_id\":309,\"product_name\":\"LIME\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":3}]', 82430, '2025-09-02 15:31:36', 'Packing', 0, 'Hyderabad', 49126),
(87, 723, 'Bollam Hemanth', 'addmaginfo@gmail.com', '9490334681', 'HYDERABAD', '500073', 'Hyderabad', 'India', '[{\"product_id\":393,\"product_name\":\"CHOLE MASALA\",\"purchase_price\":65,\"unit_price\":65,\"quantity\":1},{\"product_id\":392,\"product_name\":\"CHAT MASALA\",\"purchase_price\":65,\"unit_price\":65,\"quantity\":1},{\"product_id\":411,\"product_name\":\"BASMATHI RICE\",\"purchase_price\":220,\"unit_price\":269,\"quantity\":2}]', 670, '2025-09-02 15:34:59', 'Packing', 0, 'Hyderabad', 1847),
(88, 813, 'Srikanth', 'addmaginfo@gmail.com', '9348963999', 'A Srikanth   Flat no102 Sailasree Residency Balayya Basthi Mahadevapuram Gajularamaram', '500055', 'Quthbullapur', 'Telangana', '[{\"product_id\":152,\"product_name\":\"ALIEN HOODIE\",\"purchase_price\":1999,\"unit_price\":2499,\"quantity\":1},{\"product_id\":150,\"product_name\":\"WHITEOversized T-Shirt\",\"purchase_price\":599,\"unit_price\":799,\"quantity\":1},{\"product_id\":409,\"product_name\":\"URAD DAL (WHOLE)\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":1},{\"product_id\":309,\"product_name\":\"LIME\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1}]', 3008, '2025-11-30 06:52:58', 'Packing', 0, 'Kukatpally', 43883),
(89, 813, 'Srikanth', 'addmaginfo@gmail.com', '9348963999', 'A Srikanth   Flat no102 Sailasree Residency Balayya Basthi Mahadevapuram Gajularamaram', '500055', 'Quthbullapur', 'Telangana', '[{\"product_id\":152,\"product_name\":\"ALIEN HOODIE\",\"purchase_price\":1999,\"unit_price\":2499,\"quantity\":1},{\"product_id\":150,\"product_name\":\"WHITEOversized T-Shirt\",\"purchase_price\":599,\"unit_price\":799,\"quantity\":1},{\"product_id\":409,\"product_name\":\"URAD DAL (WHOLE)\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":1},{\"product_id\":309,\"product_name\":\"LIME\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1}]', 3008, '2025-11-30 08:57:27', 'Packing', 0, 'Kukatpally', 89075),
(90, 813, 'Srikanth', 'addmaginfo@gmail.com', '9348963999', 'A Srikanth   Flat no102 Sailasree Residency Balayya Basthi Mahadevapuram Gajularamaram', '500055', 'Quthbullapur', 'Telangana', '[{\"product_id\":152,\"product_name\":\"ALIEN HOODIE\",\"purchase_price\":1999,\"unit_price\":2499,\"quantity\":1},{\"product_id\":150,\"product_name\":\"WHITEOversized T-Shirt\",\"purchase_price\":599,\"unit_price\":799,\"quantity\":1},{\"product_id\":409,\"product_name\":\"URAD DAL (WHOLE)\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":1},{\"product_id\":309,\"product_name\":\"LIME\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":307,\"product_name\":\"TOMATO PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1}]', 3118, '2025-11-30 08:59:36', 'Packing', 0, 'Kukatpally', 85182),
(91, 1663, 'Kanmankalva Rajeshwar Goud', 'kalmakalraju@gmail.com', '7330685959', 'Plot no 288 new nandhi hills road no13 near SBI bank meerpet road', '500097', 'RANGA REDDY', 'Telangana', '[{\"product_id\":420,\"product_name\":\"GINNI ELACHI TEA\",\"purchase_price\":98,\"unit_price\":98,\"quantity\":1},{\"product_id\":313,\"product_name\":\"Freshall\",\"purchase_price\":130,\"unit_price\":130,\"quantity\":1},{\"product_id\":518,\"product_name\":\"GINGER PICKLE\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1},{\"product_id\":576,\"product_name\":\"HEALTHY HART RB OIL\",\"purchase_price\":185,\"unit_price\":185,\"quantity\":1},{\"product_id\":578,\"product_name\":\"TURMERIC POWDER\",\"purchase_price\":45,\"unit_price\":45,\"quantity\":1}]', 668, '2025-12-28 00:03:22', 'Packing', 0, 'B n reddy nagar meerpet road', 2956),
(92, 148, 'KUMARASWAMY  KOOCHANA', 'addmaginfo@gmail.com', '7702381784', 'FLAT NO 501,AMEERPET', '500073', 'HYDERABAD', 'TELANGANA', '[{\"product_id\":322,\"product_name\":\"SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":323,\"product_name\":\"DOLA SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":324,\"product_name\":\"SATIN SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":389,\"product_name\":\"HING\",\"purchase_price\":74,\"unit_price\":74,\"quantity\":1}]', 3174, '2025-12-28 10:35:24', 'Packing', 0, 'HYDERABAD', 42108),
(93, 148, 'KUMARASWAMY  KOOCHANA', 'addmaginfo@gmail.com', '7702381784', 'FLAT NO 501,AMEERPET', '500073', 'HYDERABAD', 'TELANGANA', '[{\"product_id\":322,\"product_name\":\"SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":323,\"product_name\":\"DOLA SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":324,\"product_name\":\"SATIN SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":389,\"product_name\":\"HING\",\"purchase_price\":74,\"unit_price\":74,\"quantity\":1}]', 3174, '2025-12-28 11:09:37', 'Packing', 1, 'HYDERABAD', 21982),
(94, 168, 'BUDHI SHARATH KUMAR', 'addmaginfo@gmail.com', '9390596123', 'HYDERABAD', '500083', 'Hyderabad', 'Telangana', '[{\"product_id\":636,\"product_name\":\"GROUND NUT (PEANUT)\",\"purchase_price\":225,\"unit_price\":225,\"quantity\":1},{\"product_id\":635,\"product_name\":\"URAD DAL (WHOLE)\",\"purchase_price\":185,\"unit_price\":185,\"quantity\":1},{\"product_id\":634,\"product_name\":\"CHANA DAL\",\"purchase_price\":140,\"unit_price\":140,\"quantity\":1},{\"product_id\":527,\"product_name\":\"CUMMIN\",\"purchase_price\":108,\"unit_price\":108,\"quantity\":1}]', 758, '2026-01-02 10:27:33', 'Packing', 1, 'HYDERABAD', 77038),
(95, 1567, 'Dr SUBBA RAO', 'addmaginfo@gmail.com', '9346502362', 'HYDERABAD', '500072', 'Hyderabad', 'Telangana', '[{\"product_id\":628,\"product_name\":\"MEMBERSHIP FEE\",\"purchase_price\":13000,\"unit_price\":20000,\"quantity\":1}]', 13100, '2026-01-07 04:18:47', 'Packing', 0, 'HYDERABAD', 5727),
(96, 1567, 'Dr SUBBA RAO', 'addmaginfo@gmail.com', '9346502362', 'HYDERABAD', '500072', 'Hyderabad', 'Telangana', '[{\"product_id\":628,\"product_name\":\"MEMBERSHIP FEE\",\"purchase_price\":13000,\"unit_price\":20000,\"quantity\":1}]', 13100, '2026-01-07 04:25:04', 'Packing', 1, 'HYDERABAD', 85317),
(97, 1663, 'Kanmankalva Rajeshwar Goud', 'kalmakalraju@gmail.com', '7330685959', 'Plot no 288 new nandhi hills road no13 near SBI bank', '500097', 'RANGA REDDY', 'Telangana', '[{\"product_id\":428,\"product_name\":\"TATA SALT\",\"purchase_price\":50,\"unit_price\":50,\"quantity\":1},{\"product_id\":384,\"product_name\":\"MENTHULU (Fenugreek)\",\"purchase_price\":9,\"unit_price\":9,\"quantity\":4},{\"product_id\":385,\"product_name\":\"SHAJEERA\",\"purchase_price\":30,\"unit_price\":30,\"quantity\":1},{\"product_id\":395,\"product_name\":\"GARAM MASALA\",\"purchase_price\":40,\"unit_price\":40,\"quantity\":1},{\"product_id\":437,\"product_name\":\"MOONG DAL WHOLE\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":1},{\"product_id\":590,\"product_name\":\"SAUNF \\/ SOMPU\",\"purchase_price\":30,\"unit_price\":30,\"quantity\":2},{\"product_id\":608,\"product_name\":\"SUJI RAVVA \\/BOMBAY\",\"purchase_price\":85,\"unit_price\":85,\"quantity\":1},{\"product_id\":619,\"product_name\":\"THIN POHA \\/ ATUKULU\",\"purchase_price\":55,\"unit_price\":55,\"quantity\":2},{\"product_id\":618,\"product_name\":\"SOYACHUNKS \\/ MILMEKER\",\"purchase_price\":55,\"unit_price\":55,\"quantity\":1},{\"product_id\":621,\"product_name\":\"STAR FLOWER\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":2}]', 836, '2026-01-07 12:50:39', 'Packing', 0, 'B n reddy nagar', 20625),
(98, 1663, 'Kanmankalva Rajeshwar Goud', 'kalmakalraju@gmail.com', '7330685959', 'Plot no 288 new nandhi hills road no13 near SBI bank', '500097', 'RANGA REDDY', 'Telangana', '[{\"product_id\":428,\"product_name\":\"TATA SALT\",\"purchase_price\":50,\"unit_price\":50,\"quantity\":1},{\"product_id\":384,\"product_name\":\"MENTHULU (Fenugreek)\",\"purchase_price\":9,\"unit_price\":9,\"quantity\":4},{\"product_id\":385,\"product_name\":\"SHAJEERA\",\"purchase_price\":30,\"unit_price\":30,\"quantity\":1},{\"product_id\":395,\"product_name\":\"GARAM MASALA\",\"purchase_price\":40,\"unit_price\":40,\"quantity\":1},{\"product_id\":437,\"product_name\":\"MOONG DAL WHOLE\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":1},{\"product_id\":590,\"product_name\":\"SAUNF \\/ SOMPU\",\"purchase_price\":30,\"unit_price\":30,\"quantity\":2},{\"product_id\":608,\"product_name\":\"SUJI RAVVA \\/BOMBAY\",\"purchase_price\":85,\"unit_price\":85,\"quantity\":1},{\"product_id\":619,\"product_name\":\"THIN POHA \\/ ATUKULU\",\"purchase_price\":55,\"unit_price\":55,\"quantity\":2},{\"product_id\":618,\"product_name\":\"SOYACHUNKS \\/ MILMEKER\",\"purchase_price\":55,\"unit_price\":55,\"quantity\":1},{\"product_id\":621,\"product_name\":\"STAR FLOWER\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":2},{\"product_id\":413,\"product_name\":\"SUGAR\",\"purchase_price\":60,\"unit_price\":60,\"quantity\":3}]', 1016, '2026-01-07 12:53:04', 'Packing', 0, 'B n reddy nagar', 32544),
(99, 629, 'POILA CHITTI BABU', 'addmaginfo@gmail.com', '9491443072', 'HYDERABAD', '500073', 'Hyderabad', 'India', '[{\"product_id\":152,\"product_name\":\"ALIEN HOODIE\",\"purchase_price\":1999,\"unit_price\":2499,\"quantity\":1},{\"product_id\":151,\"product_name\":\"Vibe Oversized T-Shirt\",\"purchase_price\":999,\"unit_price\":1499,\"quantity\":1},{\"product_id\":428,\"product_name\":\"TATA SALT\",\"purchase_price\":50,\"unit_price\":50,\"quantity\":1}]', 3148, '2026-01-10 05:48:39', 'Packing', 1, 'Hydrabad', 73641),
(100, 1656, 'CH MALATHI', 'addmaginfo@gmail.com', '7396021536', '8-3-940, Yella Reddy Guda Rd', '500033', 'Hyderabad', 'Telangana', '[{\"product_id\":628,\"product_name\":\"MEMBERSHIP FEE\",\"purchase_price\":13000,\"unit_price\":20000,\"quantity\":1}]', 13100, '2026-01-11 05:59:29', 'Packing', 1, 'HYDERABAD', 86909),
(101, 1006, 'G. Babugoud', 'addmaginfo@gmail.com', '9948197000', 'HYDERABAD', '500049', 'Hyderabad', 'Telangana', '[{\"product_id\":504,\"product_name\":\"PROMOTION TABLE WITH VINYL STICKER\",\"purchase_price\":3600,\"unit_price\":3900,\"quantity\":1},{\"product_id\":501,\"product_name\":\"PREMIUM WITH BLACKOUT FLEX\",\"purchase_price\":1800,\"unit_price\":2300,\"quantity\":1},{\"product_id\":429,\"product_name\":\"URAD DAL {SPLIT)\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":1},{\"product_id\":412,\"product_name\":\"MOONG DAL\",\"purchase_price\":200,\"unit_price\":200,\"quantity\":1},{\"product_id\":413,\"product_name\":\"SUGAR\",\"purchase_price\":60,\"unit_price\":60,\"quantity\":1},{\"product_id\":414,\"product_name\":\"MASOOR DAL\",\"purchase_price\":140,\"unit_price\":140,\"quantity\":1}]', 6100, '2026-01-17 09:21:22', 'Packing', 0, 'Miyapur', 73074),
(102, 1730, 'MD KHAMRUDDIN', 'addmaginfo@gmail.com', '9398859163', 'Flat no 307, sarada divine apartment ments', '500018', 'HYDERABAD', 'Telangana', '[{\"product_id\":328,\"product_name\":\"MOSS GEORGETTE SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":322,\"product_name\":\"SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":321,\"product_name\":\"TUSSER SILK SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1}]', 3100, '2026-01-21 05:49:08', 'Packing', 1, 'HYDERABAD', 22963),
(103, 1730, 'MD KHAMRUDDIN', 'addmaginfo@gmail.com', '9398859163', 'Flat no 307, sarada divine apartment ments', '500018', 'HYDERABAD', 'Telangana', '[{\"product_id\":342,\"product_name\":\"RAW SILK\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":338,\"product_name\":\"GEORGETTE SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1},{\"product_id\":334,\"product_name\":\"BANARAS PRINT SAREE\",\"purchase_price\":1000,\"unit_price\":1000,\"quantity\":1}]', 3100, '2026-01-21 05:58:53', 'Packing', 1, 'HYDERABAD', 44465),
(104, 1006, 'G. Babugoud', 'addmaginfo@gmail.com', '9948197000', 'HYDERABAD', '500049', 'Hyderabad', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-01-23 13:51:33', 'Packing', 0, 'Miyapur', 98703),
(105, 1006, 'G. Babugoud', 'addmaginfo@gmail.com', '9948197000', 'HYDERABAD', '500049', 'Hyderabad', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-01-23 13:54:43', 'Packing', 0, 'Miyapur', 8751),
(106, 1006, 'G. Babugoud', 'addmaginfo@gmail.com', '9948197000', 'HYDERABAD', '500049', 'Hyderabad', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-01-23 13:59:22', 'Packing', 0, 'Miyapur', 93267),
(107, 860, 'R. Sriram Reddy', 'addmaginfo@gmail.com', '8919939629', 'H. No. 12-281/6/3', '505468', 'Huzurabad', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-02-02 04:02:48', 'Packing', 1, 'Huzurabad', 64971),
(108, 168, 'BUDHI SHARATH KUMAR', 'addmaginfo@gmail.com', '9390596123', 'HYDERABAD', '500083', 'Hyderabad', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-02-03 18:56:34', 'Packing', 0, 'HYDERABAD', 19260),
(109, 168, 'BUDHI SHARATH KUMAR', 'addmaginfo@gmail.com', '9390596123', 'HYDERABAD', '500083', 'Hyderabad', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-02-04 04:46:15', 'Packing', 0, 'HYDERABAD', 40062),
(110, 168, 'BUDHI SHARATH KUMAR', 'addmaginfo@gmail.com', '9390596123', 'HYDERABAD', '500083', 'Hyderabad', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-02-04 04:47:35', 'Packing', 0, 'HYDERABAD', 95962),
(111, 168, 'BUDHI SHARATH KUMAR', 'addmaginfo@gmail.com', '9390596123', 'HYDERABAD', '500083', 'Hyderabad', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-02-04 04:48:58', 'Packing', 1, 'HYDERABAD', 47433),
(112, 1903, 'K Hymavathi', 'hymavathi.enterprenuer@gmail.com', '8008814915', 'JOOKAL VILLAGE, 1-28,MONDAL CHITYALA,BHUPALPALLY', '506356', 'JAYASHANKAR BHUPALPALLY', 'Telangana', '[{\"product_id\":419,\"product_name\":\"GOLD DROP OIL\",\"purchase_price\":185,\"unit_price\":200185,\"quantity\":1},{\"product_id\":383,\"product_name\":\"JILAKARA (JEERA)\",\"purchase_price\":65,\"unit_price\":65,\"quantity\":1},{\"product_id\":410,\"product_name\":\"CHANA DAL\",\"purchase_price\":140,\"unit_price\":145,\"quantity\":1},{\"product_id\":409,\"product_name\":\"URAD DAL (WHOLE)\",\"purchase_price\":185,\"unit_price\":200,\"quantity\":1},{\"product_id\":412,\"product_name\":\"MOONG DAL\",\"purchase_price\":190,\"unit_price\":190,\"quantity\":1},{\"product_id\":413,\"product_name\":\"SUGAR\",\"purchase_price\":60,\"unit_price\":60,\"quantity\":1},{\"product_id\":415,\"product_name\":\"GROUND NUT (PEANUT)\",\"purchase_price\":225,\"unit_price\":225,\"quantity\":1}]', 1150, '2026-02-10 09:35:40', 'Packing', 0, 'Hyderabad', 8640);
INSERT INTO `customer_ordered_products` (`id`, `user_id`, `first_name`, `email`, `mobile_no`, `address`, `zip_code`, `city`, `state`, `oredered_products`, `total_amount`, `ordered_date`, `status`, `confirmation_status`, `location`, `unique_id`) VALUES
(113, 1927, 'M V L DURGARAO', 'mvldrao@gmail.com', '8187021297', 'Amma appartments, Block-33,ff-1', '533440', 'SAMALKOT  , KAKINADA DISTRICT', 'ANDHRAPRADESH', '[{\"product_id\":621,\"product_name\":\"STAR FLOWER\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":1},{\"product_id\":608,\"product_name\":\"SUJI RAVVA \\/BOMBAY\",\"purchase_price\":85,\"unit_price\":85,\"quantity\":1},{\"product_id\":428,\"product_name\":\"TATA SALT\",\"purchase_price\":50,\"unit_price\":50,\"quantity\":1},{\"product_id\":611,\"product_name\":\"WHEAT FOLUR \\/ GODHUMAPINDI\",\"purchase_price\":80,\"unit_price\":80,\"quantity\":1},{\"product_id\":589,\"product_name\":\"PUTNALU\",\"purchase_price\":87,\"unit_price\":87,\"quantity\":1},{\"product_id\":430,\"product_name\":\"Coriander\\/Dhaniya\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":1},{\"product_id\":399,\"product_name\":\"JEERA POWDER\",\"purchase_price\":30,\"unit_price\":30,\"quantity\":1},{\"product_id\":397,\"product_name\":\"CHIKEN MASALA\",\"purchase_price\":39,\"unit_price\":39,\"quantity\":1},{\"product_id\":395,\"product_name\":\"GARAM MASALA\",\"purchase_price\":40,\"unit_price\":40,\"quantity\":1},{\"product_id\":390,\"product_name\":\"SAMBAR POWDER\",\"purchase_price\":60,\"unit_price\":60,\"quantity\":1},{\"product_id\":393,\"product_name\":\"CHOLE MASALA\",\"purchase_price\":65,\"unit_price\":65,\"quantity\":1},{\"product_id\":585,\"product_name\":\"FLAX SEEDS\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":1},{\"product_id\":627,\"product_name\":\"LEMON SALT\",\"purchase_price\":25,\"unit_price\":25,\"quantity\":1},{\"product_id\":404,\"product_name\":\"SUGAR PARRYS\",\"purchase_price\":60,\"unit_price\":60,\"quantity\":1},{\"product_id\":419,\"product_name\":\"GOLD DROP OIL\",\"purchase_price\":185,\"unit_price\":200185,\"quantity\":2}]', 1196, '2026-02-10 17:36:16', 'Packing', 0, 'Amma apartments', 16102),
(114, 1697, 'GAGULOTH KRISHNA', 'addmagpro@gmail.com', '7286963204', 'Plotno 9 kalyanpuri colony near kandiguda xroad sainkpuri', '500086', 'Hyderabad', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-02-16 05:12:16', 'Packing', 1, 'Kapra - Secunderabad', 72787),
(116, 701, 'Shamala yadagiri', 'Valabojusrinivasulu19@gmail.com', '7396977505', 'ADDRESS: S/O: SATTAIAH, 11-69, HANUMAN STREET, KOLANUPAKA, KOLANUPAKA, NALGONDA, KOLANPAKA, ANDHRA PRADESH, 508101', '500083', 'Medchal malkajgiri', 'India', '[{\"product_id\":401,\"product_name\":\"KASHMIRI CHILLI POWDER\",\"purchase_price\":93,\"unit_price\":93,\"quantity\":1},{\"product_id\":384,\"product_name\":\"MENTHULU (Fenugreek)\",\"purchase_price\":9,\"unit_price\":9,\"quantity\":2},{\"product_id\":409,\"product_name\":\"URAD DAL (WHOLE)\",\"purchase_price\":185,\"unit_price\":200,\"quantity\":1},{\"product_id\":404,\"product_name\":\"SUGAR PARRYS\",\"purchase_price\":60,\"unit_price\":60,\"quantity\":1},{\"product_id\":414,\"product_name\":\"MASOOR DAL\",\"purchase_price\":140,\"unit_price\":140,\"quantity\":1},{\"product_id\":410,\"product_name\":\"CHANA DAL\",\"purchase_price\":140,\"unit_price\":145,\"quantity\":1},{\"product_id\":412,\"product_name\":\"MOONG DAL\",\"purchase_price\":190,\"unit_price\":190,\"quantity\":1},{\"product_id\":415,\"product_name\":\"GROUND NUT (PEANUT)\",\"purchase_price\":225,\"unit_price\":225,\"quantity\":1},{\"product_id\":419,\"product_name\":\"GOLD DROP OIL\",\"purchase_price\":185,\"unit_price\":200185,\"quantity\":1},{\"product_id\":584,\"product_name\":\"TURMERIC POWDER\",\"purchase_price\":90,\"unit_price\":90,\"quantity\":1},{\"product_id\":592,\"product_name\":\"JILAKARA (JEERA)\",\"purchase_price\":108,\"unit_price\":108,\"quantity\":1},{\"product_id\":601,\"product_name\":\"TOOR DAL\",\"purchase_price\":185,\"unit_price\":185,\"quantity\":1},{\"product_id\":608,\"product_name\":\"SUJI RAVVA \\/BOMBAY\",\"purchase_price\":85,\"unit_price\":85,\"quantity\":1},{\"product_id\":618,\"product_name\":\"SOYACHUNKS \\/ MILMEKER\",\"purchase_price\":55,\"unit_price\":55,\"quantity\":1}]', 1859, '2026-02-17 00:13:02', 'Packing', 0, 'Kapra', 97053),
(117, 2000, 'R GOPALA KRISHNA', 'addmagpro@gmail.com', '9908089999', 'HYDERABAD', '500045', 'Hyderabad', 'India', '[{\"product_id\":409,\"product_name\":\"URAD DAL (WHOLE)\",\"purchase_price\":185,\"unit_price\":200,\"quantity\":1},{\"product_id\":411,\"product_name\":\"BASMATHI RICE\",\"purchase_price\":160,\"unit_price\":160,\"quantity\":1},{\"product_id\":415,\"product_name\":\"GROUND NUT (PEANUT)\",\"purchase_price\":225,\"unit_price\":225,\"quantity\":1},{\"product_id\":430,\"product_name\":\"Coriander\\/Dhaniya\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":2},{\"product_id\":655,\"product_name\":\"GOLD STONE TEA\",\"purchase_price\":155,\"unit_price\":155,\"quantity\":1},{\"product_id\":595,\"product_name\":\"CHILLI POWDER\",\"purchase_price\":80,\"unit_price\":80,\"quantity\":1},{\"product_id\":412,\"product_name\":\"MOONG DAL\",\"purchase_price\":190,\"unit_price\":190,\"quantity\":1},{\"product_id\":413,\"product_name\":\"SUGAR\",\"purchase_price\":60,\"unit_price\":60,\"quantity\":1},{\"product_id\":592,\"product_name\":\"JILAKARA (JEERA)\",\"purchase_price\":108,\"unit_price\":108,\"quantity\":1},{\"product_id\":602,\"product_name\":\"BAJRA MILLET \\/ sajjalu\",\"purchase_price\":50,\"unit_price\":50,\"quantity\":1},{\"product_id\":616,\"product_name\":\"NUTMEG \\/ JAJIKAYA\",\"purchase_price\":87,\"unit_price\":87,\"quantity\":1},{\"product_id\":608,\"product_name\":\"SUJI RAVVA \\/BOMBAY\",\"purchase_price\":85,\"unit_price\":85,\"quantity\":1},{\"product_id\":609,\"product_name\":\"IDLI RAVVA\",\"purchase_price\":70,\"unit_price\":70,\"quantity\":1},{\"product_id\":601,\"product_name\":\"TOOR DAL\",\"purchase_price\":185,\"unit_price\":185,\"quantity\":1},{\"product_id\":606,\"product_name\":\"FINGER MILLET \\/ RAGULU\",\"purchase_price\":70,\"unit_price\":70,\"quantity\":1},{\"product_id\":617,\"product_name\":\"FENUGREEK \\/ MENTHULU\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":1},{\"product_id\":658,\"product_name\":\"HARPIC (blue)\",\"purchase_price\":225,\"unit_price\":225,\"quantity\":1},{\"product_id\":626,\"product_name\":\"MUSTERD\",\"purchase_price\":50,\"unit_price\":50,\"quantity\":1},{\"product_id\":663,\"product_name\":\"SANTOOR PUREGLO\",\"purchase_price\":250,\"unit_price\":250,\"quantity\":1}]', 2440, '2026-02-21 07:10:53', 'Packing', 0, 'HYDERABAD', 44522),
(118, 2000, 'R GOPALA KRISHNA', 'addmagpro@gmail.com', '9908089999', 'HYDERABAD', '500045', 'Hyderabad', 'India', '[{\"product_id\":409,\"product_name\":\"URAD DAL (WHOLE)\",\"purchase_price\":185,\"unit_price\":200,\"quantity\":1},{\"product_id\":411,\"product_name\":\"BASMATHI RICE\",\"purchase_price\":160,\"unit_price\":160,\"quantity\":1},{\"product_id\":415,\"product_name\":\"GROUND NUT (PEANUT)\",\"purchase_price\":225,\"unit_price\":225,\"quantity\":1},{\"product_id\":430,\"product_name\":\"Coriander\\/Dhaniya\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":2},{\"product_id\":655,\"product_name\":\"GOLD STONE TEA\",\"purchase_price\":155,\"unit_price\":155,\"quantity\":1},{\"product_id\":595,\"product_name\":\"CHILLI POWDER\",\"purchase_price\":80,\"unit_price\":80,\"quantity\":1},{\"product_id\":412,\"product_name\":\"MOONG DAL\",\"purchase_price\":190,\"unit_price\":190,\"quantity\":1},{\"product_id\":413,\"product_name\":\"SUGAR\",\"purchase_price\":60,\"unit_price\":60,\"quantity\":1},{\"product_id\":592,\"product_name\":\"JILAKARA (JEERA)\",\"purchase_price\":108,\"unit_price\":108,\"quantity\":1},{\"product_id\":602,\"product_name\":\"BAJRA MILLET \\/ sajjalu\",\"purchase_price\":50,\"unit_price\":50,\"quantity\":1},{\"product_id\":616,\"product_name\":\"NUTMEG \\/ JAJIKAYA\",\"purchase_price\":87,\"unit_price\":87,\"quantity\":1},{\"product_id\":608,\"product_name\":\"SUJI RAVVA \\/BOMBAY\",\"purchase_price\":85,\"unit_price\":85,\"quantity\":1},{\"product_id\":609,\"product_name\":\"IDLI RAVVA\",\"purchase_price\":70,\"unit_price\":70,\"quantity\":1},{\"product_id\":601,\"product_name\":\"TOOR DAL\",\"purchase_price\":185,\"unit_price\":185,\"quantity\":1},{\"product_id\":606,\"product_name\":\"FINGER MILLET \\/ RAGULU\",\"purchase_price\":70,\"unit_price\":70,\"quantity\":1},{\"product_id\":617,\"product_name\":\"FENUGREEK \\/ MENTHULU\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":1},{\"product_id\":658,\"product_name\":\"HARPIC (blue)\",\"purchase_price\":225,\"unit_price\":225,\"quantity\":1},{\"product_id\":626,\"product_name\":\"MUSTERD\",\"purchase_price\":50,\"unit_price\":50,\"quantity\":1},{\"product_id\":663,\"product_name\":\"SANTOOR PUREGLO\",\"purchase_price\":250,\"unit_price\":250,\"quantity\":1},{\"product_id\":659,\"product_name\":\"HARPIC (Red)\",\"purchase_price\":219,\"unit_price\":219,\"quantity\":1},{\"product_id\":660,\"product_name\":\"LIZOL (YELLOW)\",\"purchase_price\":232,\"unit_price\":232,\"quantity\":1}]', 2891, '2026-02-21 07:13:24', 'Packing', 0, 'HYDERABAD', 19734),
(119, 2000, 'R GOPALA KRISHNA', 'addmagpro@gmail.com', '9908089999', 'HYDERABAD', '500045', 'Hyderabad', 'India', '[{\"product_id\":409,\"product_name\":\"URAD DAL (WHOLE)\",\"purchase_price\":185,\"unit_price\":200,\"quantity\":1},{\"product_id\":411,\"product_name\":\"BASMATHI RICE\",\"purchase_price\":160,\"unit_price\":160,\"quantity\":1},{\"product_id\":415,\"product_name\":\"GROUND NUT (PEANUT)\",\"purchase_price\":225,\"unit_price\":225,\"quantity\":1},{\"product_id\":430,\"product_name\":\"Coriander\\/Dhaniya\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":2},{\"product_id\":655,\"product_name\":\"GOLD STONE TEA\",\"purchase_price\":155,\"unit_price\":155,\"quantity\":1},{\"product_id\":595,\"product_name\":\"CHILLI POWDER\",\"purchase_price\":80,\"unit_price\":80,\"quantity\":1},{\"product_id\":412,\"product_name\":\"MOONG DAL\",\"purchase_price\":190,\"unit_price\":190,\"quantity\":1},{\"product_id\":413,\"product_name\":\"SUGAR\",\"purchase_price\":60,\"unit_price\":60,\"quantity\":1},{\"product_id\":592,\"product_name\":\"JILAKARA (JEERA)\",\"purchase_price\":108,\"unit_price\":108,\"quantity\":1},{\"product_id\":602,\"product_name\":\"BAJRA MILLET \\/ sajjalu\",\"purchase_price\":50,\"unit_price\":50,\"quantity\":1},{\"product_id\":616,\"product_name\":\"NUTMEG \\/ JAJIKAYA\",\"purchase_price\":87,\"unit_price\":87,\"quantity\":1},{\"product_id\":608,\"product_name\":\"SUJI RAVVA \\/BOMBAY\",\"purchase_price\":85,\"unit_price\":85,\"quantity\":1},{\"product_id\":609,\"product_name\":\"IDLI RAVVA\",\"purchase_price\":70,\"unit_price\":70,\"quantity\":1},{\"product_id\":601,\"product_name\":\"TOOR DAL\",\"purchase_price\":185,\"unit_price\":185,\"quantity\":1},{\"product_id\":606,\"product_name\":\"FINGER MILLET \\/ RAGULU\",\"purchase_price\":70,\"unit_price\":70,\"quantity\":1},{\"product_id\":617,\"product_name\":\"FENUGREEK \\/ MENTHULU\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":1},{\"product_id\":658,\"product_name\":\"HARPIC (blue)\",\"purchase_price\":225,\"unit_price\":225,\"quantity\":1},{\"product_id\":626,\"product_name\":\"MUSTERD\",\"purchase_price\":50,\"unit_price\":50,\"quantity\":1},{\"product_id\":663,\"product_name\":\"SANTOOR PUREGLO\",\"purchase_price\":250,\"unit_price\":250,\"quantity\":1},{\"product_id\":659,\"product_name\":\"HARPIC (Red)\",\"purchase_price\":219,\"unit_price\":219,\"quantity\":1},{\"product_id\":660,\"product_name\":\"LIZOL (YELLOW)\",\"purchase_price\":232,\"unit_price\":232,\"quantity\":1},{\"product_id\":665,\"product_name\":\"Mangaldeep Puja Agarbattis\",\"purchase_price\":120,\"unit_price\":120,\"quantity\":1},{\"product_id\":666,\"product_name\":\"ROCK SALT\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1}]', 3121, '2026-02-21 08:25:50', 'Packing', 0, 'HYDERABAD', 47032),
(120, 2000, 'R GOPALA KRISHNA', 'addmagpro@gmail.com', '9908089999', 'HYDERABAD', '500045', 'Hyderabad', 'India', '[{\"product_id\":409,\"product_name\":\"URAD DAL (WHOLE)\",\"purchase_price\":185,\"unit_price\":200,\"quantity\":1},{\"product_id\":411,\"product_name\":\"BASMATHI RICE\",\"purchase_price\":160,\"unit_price\":160,\"quantity\":1},{\"product_id\":415,\"product_name\":\"GROUND NUT (PEANUT)\",\"purchase_price\":225,\"unit_price\":225,\"quantity\":1},{\"product_id\":430,\"product_name\":\"Coriander\\/Dhaniya\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":2},{\"product_id\":655,\"product_name\":\"GOLD STONE TEA\",\"purchase_price\":155,\"unit_price\":155,\"quantity\":1},{\"product_id\":595,\"product_name\":\"CHILLI POWDER\",\"purchase_price\":80,\"unit_price\":80,\"quantity\":1},{\"product_id\":412,\"product_name\":\"MOONG DAL\",\"purchase_price\":190,\"unit_price\":190,\"quantity\":1},{\"product_id\":413,\"product_name\":\"SUGAR\",\"purchase_price\":60,\"unit_price\":60,\"quantity\":1},{\"product_id\":592,\"product_name\":\"JILAKARA (JEERA)\",\"purchase_price\":108,\"unit_price\":108,\"quantity\":1},{\"product_id\":602,\"product_name\":\"BAJRA MILLET \\/ sajjalu\",\"purchase_price\":50,\"unit_price\":50,\"quantity\":1},{\"product_id\":616,\"product_name\":\"NUTMEG \\/ JAJIKAYA\",\"purchase_price\":87,\"unit_price\":87,\"quantity\":1},{\"product_id\":608,\"product_name\":\"SUJI RAVVA \\/BOMBAY\",\"purchase_price\":85,\"unit_price\":85,\"quantity\":1},{\"product_id\":609,\"product_name\":\"IDLI RAVVA\",\"purchase_price\":70,\"unit_price\":70,\"quantity\":1},{\"product_id\":601,\"product_name\":\"TOOR DAL\",\"purchase_price\":185,\"unit_price\":185,\"quantity\":1},{\"product_id\":606,\"product_name\":\"FINGER MILLET \\/ RAGULU\",\"purchase_price\":70,\"unit_price\":70,\"quantity\":1},{\"product_id\":617,\"product_name\":\"FENUGREEK \\/ MENTHULU\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":1},{\"product_id\":658,\"product_name\":\"HARPIC (blue)\",\"purchase_price\":225,\"unit_price\":225,\"quantity\":1},{\"product_id\":626,\"product_name\":\"MUSTERD\",\"purchase_price\":50,\"unit_price\":50,\"quantity\":1},{\"product_id\":663,\"product_name\":\"SANTOOR PUREGLO\",\"purchase_price\":250,\"unit_price\":250,\"quantity\":1},{\"product_id\":659,\"product_name\":\"HARPIC (Red)\",\"purchase_price\":219,\"unit_price\":219,\"quantity\":1},{\"product_id\":660,\"product_name\":\"LIZOL (YELLOW)\",\"purchase_price\":232,\"unit_price\":232,\"quantity\":1},{\"product_id\":665,\"product_name\":\"Mangaldeep Puja Agarbattis\",\"purchase_price\":120,\"unit_price\":120,\"quantity\":1},{\"product_id\":666,\"product_name\":\"ROCK SALT\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1}]', 3121, '2026-02-21 08:29:10', 'Packing', 0, 'HYDERABAD', 34476),
(121, 2000, 'R GOPALA KRISHNA', 'addmagpro@gmail.com', '9908089999', 'HYDERABAD', '500045', 'Hyderabad', 'India', '[{\"product_id\":409,\"product_name\":\"URAD DAL (WHOLE)\",\"purchase_price\":185,\"unit_price\":200,\"quantity\":1},{\"product_id\":411,\"product_name\":\"BASMATHI RICE\",\"purchase_price\":160,\"unit_price\":160,\"quantity\":1},{\"product_id\":415,\"product_name\":\"GROUND NUT (PEANUT)\",\"purchase_price\":225,\"unit_price\":225,\"quantity\":1},{\"product_id\":430,\"product_name\":\"Coriander\\/Dhaniya\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":2},{\"product_id\":655,\"product_name\":\"GOLD STONE TEA\",\"purchase_price\":155,\"unit_price\":155,\"quantity\":1},{\"product_id\":595,\"product_name\":\"CHILLI POWDER\",\"purchase_price\":80,\"unit_price\":80,\"quantity\":1},{\"product_id\":412,\"product_name\":\"MOONG DAL\",\"purchase_price\":190,\"unit_price\":190,\"quantity\":1},{\"product_id\":413,\"product_name\":\"SUGAR\",\"purchase_price\":60,\"unit_price\":60,\"quantity\":1},{\"product_id\":592,\"product_name\":\"JILAKARA (JEERA)\",\"purchase_price\":108,\"unit_price\":108,\"quantity\":1},{\"product_id\":602,\"product_name\":\"BAJRA MILLET \\/ sajjalu\",\"purchase_price\":50,\"unit_price\":50,\"quantity\":1},{\"product_id\":616,\"product_name\":\"NUTMEG \\/ JAJIKAYA\",\"purchase_price\":87,\"unit_price\":87,\"quantity\":1},{\"product_id\":608,\"product_name\":\"SUJI RAVVA \\/BOMBAY\",\"purchase_price\":85,\"unit_price\":85,\"quantity\":1},{\"product_id\":609,\"product_name\":\"IDLI RAVVA\",\"purchase_price\":70,\"unit_price\":70,\"quantity\":1},{\"product_id\":601,\"product_name\":\"TOOR DAL\",\"purchase_price\":185,\"unit_price\":185,\"quantity\":1},{\"product_id\":606,\"product_name\":\"FINGER MILLET \\/ RAGULU\",\"purchase_price\":70,\"unit_price\":70,\"quantity\":1},{\"product_id\":617,\"product_name\":\"FENUGREEK \\/ MENTHULU\",\"purchase_price\":35,\"unit_price\":35,\"quantity\":1},{\"product_id\":658,\"product_name\":\"HARPIC (blue)\",\"purchase_price\":225,\"unit_price\":225,\"quantity\":1},{\"product_id\":626,\"product_name\":\"MUSTERD\",\"purchase_price\":50,\"unit_price\":50,\"quantity\":1},{\"product_id\":663,\"product_name\":\"SANTOOR PUREGLO\",\"purchase_price\":250,\"unit_price\":250,\"quantity\":1},{\"product_id\":659,\"product_name\":\"HARPIC (Red)\",\"purchase_price\":219,\"unit_price\":219,\"quantity\":1},{\"product_id\":660,\"product_name\":\"LIZOL (YELLOW)\",\"purchase_price\":232,\"unit_price\":232,\"quantity\":1},{\"product_id\":665,\"product_name\":\"Mangaldeep Puja Agarbattis\",\"purchase_price\":120,\"unit_price\":120,\"quantity\":1},{\"product_id\":666,\"product_name\":\"ROCK SALT\",\"purchase_price\":110,\"unit_price\":110,\"quantity\":1}]', 3121, '2026-02-21 08:45:32', 'Packing', 1, 'HYDERABAD', 99923),
(122, 1730, 'MD KHAMRUDDIN', 'addmagpro@gmail.com', '9398859163', 'Flat no 307, sarada divine apartment ments', '500018', 'HYDERABAD', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-02-25 14:01:15', 'Packing', 1, 'HYDERABAD', 82957),
(123, 1572, 'c.Bhavani Prasad', 'addmagpro@gmail.com', '8639974381', 'Yousaf guda', '500045', 'Hyderabad', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-03-07 08:35:17', 'Packing', 1, 'HYDERABAD', 7583),
(124, 1733, 'MAHENDERKAR RAJESWARI', 'addmaginfo@gmail.com', '8106560969', 'Neredmet', '500032', 'Hyderabad', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-03-07 08:57:29', 'Packing', 1, 'Neredmet', 88991),
(125, 1542, 'Y Nageshwar Rao', 'addmaginfo@gmail.com', '9665156355', 'KPHB HYDERABAD', '500085', 'Hyderabad', 'Telangana', '[{\"product_id\":628,\"product_name\":\"MEMBERSHIP FEE\",\"purchase_price\":13000,\"unit_price\":20000,\"quantity\":1}]', 13100, '2026-03-10 04:42:51', 'Packing', 0, 'Hyderabad', 21698),
(126, 1542, 'Y Nageshwar Rao', 'addmaginfo@gmail.com', '9665156355', 'KPHB HYDERABAD', '500085', 'Hyderabad', 'Telangana', '[{\"product_id\":628,\"product_name\":\"MEMBERSHIP FEE\",\"purchase_price\":13000,\"unit_price\":20000,\"quantity\":1}]', 13100, '2026-03-10 04:46:09', 'Packing', 1, 'Hyderabad', 53314),
(127, 1999, 'Aruna', 'addmagpro@gmail.com', '7702485136', 'NAMALAGUNDU', '500061', 'Hyderabad', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-03-12 15:34:23', 'Packing', 1, 'Namalgudu', 87559),
(128, 2054, 'Amrutha Reddy', 'addmagpro@gmail.com', '9347946485', 'HYDERABAD', '500038', 'Hyderabad', 'Telangana', '[{\"product_id\":628,\"product_name\":\"MEMBERSHIP FEE\",\"purchase_price\":13000,\"unit_price\":20000,\"quantity\":1}]', 13100, '2026-03-19 14:11:30', 'Packing', 1, 'Vengalarao Nagar', 58029),
(129, 1980, 'Dr. Jayarama Reddy Kummathi', 'addmagpro@gmail.com', '9581495766', 'HYDERABAD', '500038', 'Hyderabad', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-03-19 14:23:29', 'Packing', 1, 'Vengalarao Nagar', 44313),
(130, 1677, 'Mididam MuralidharRao', 'addmagpro@gmail.com', '8333077851', 'HYDERABAD', '500055', 'Hyderabad', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-03-31 03:37:35', 'Packing', 1, 'Suraram Hyderabad', 72485),
(131, 1730, 'MD KHAMRUDDIN', 'addmagpro@gmail.com', '9398859163', 'Flat no 307, sarada divine apartment ments', '500018', 'HYDERABAD', 'Telangana', '[{\"product_id\":657,\"product_name\":\"GROCERY\",\"purchase_price\":3000,\"unit_price\":3000,\"quantity\":1}]', 3100, '2026-03-31 04:05:05', 'Packing', 1, 'HYDERABAD', 92380),
(132, 2054, 'Amrutha Reddy', 'addmagpro@gmail.com', '9347946485', 'HYDERABAD', '500038', 'Hyderabad', 'Telangana', '[{\"product_id\":257,\"product_name\":\"CALENDER\",\"purchase_price\":25000,\"unit_price\":25000,\"quantity\":1}]', 25100, '2026-04-06 09:58:03', 'Packing', 0, 'Vengalarao Nagar', 44665),
(133, 2054, 'Amrutha Reddy', 'addmagpro@gmail.com', '9347946485', 'HYDERABAD', '500038', 'Hyderabad', 'Telangana', '[{\"product_id\":257,\"product_name\":\"CALENDER\",\"purchase_price\":25000,\"unit_price\":25000,\"quantity\":1}]', 25100, '2026-04-06 10:02:00', 'Packing', 1, 'Vengalarao Nagar', 20291);

-- --------------------------------------------------------

--
-- Table structure for table `discount_store_purchases`
--

CREATE TABLE `discount_store_purchases` (
  `purchase_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `store_name` varchar(200) NOT NULL,
  `purchase_amount` int NOT NULL,
  `discount_margin` int NOT NULL,
  `total_amount` int NOT NULL,
  `vendor_commision` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `discount_store_purchases`
--

INSERT INTO `discount_store_purchases` (`purchase_id`, `vendor_id`, `customer_id`, `store_name`, `purchase_amount`, `discount_margin`, `total_amount`, `vendor_commision`, `created_at`) VALUES
(4, 2, 611, 'Ratnadeep', 500, 10, 450, 400, '2024-09-20 09:44:01'),
(5, 2, 611, 'Ratnadeep', 500, 10, 450, 400, '2024-09-20 09:57:23'),
(6, 2, 611, 'Ratnadeep', 500, 10, 450, 400, '2024-09-20 10:39:56'),
(7, 2, 611, 'Ratnadeep', 1000, 10, 900, 800, '2024-09-20 10:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `discount_vendors`
--

CREATE TABLE `discount_vendors` (
  `vendor_id` int NOT NULL,
  `user_id` int NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `member_phone` varchar(20) NOT NULL,
  `shop_name` varchar(30) NOT NULL,
  `gst_number` varchar(20) NOT NULL,
  `shop_description` text NOT NULL,
  `address` text NOT NULL,
  `location` varchar(200) NOT NULL,
  `banner_image` text NOT NULL,
  `state` varchar(20) NOT NULL,
  `district` varchar(10) NOT NULL,
  `pincode` int NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `ifsc_code` varchar(50) NOT NULL,
  `discount_margin` int NOT NULL,
  `withdrawal_amount` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `discount_vendors`
--

INSERT INTO `discount_vendors` (`vendor_id`, `user_id`, `member_name`, `member_phone`, `shop_name`, `gst_number`, `shop_description`, `address`, `location`, `banner_image`, `state`, `district`, `pincode`, `bank_name`, `account_name`, `ifsc_code`, `discount_margin`, `withdrawal_amount`, `created_at`) VALUES
(2, 0, 'Super Grocery', '7993912966', 'Meta Grocery Store', '78974645', 'Ratnadeep store with 5 % discount', 'Ameerpet ,Road no 1', 'Ameerpet Metro', 'assets/vendor_assets/discount_vendor_banners/66bb286aacbb3.ratnadeep_discount_vendor.png', 'Telangana', 'Hyderabad', 533250, 'union bank', '2484159442', '898965', 20, 0, '2024-11-05 06:02:33'),
(3, 753, 'Vegetable Madhapur', '8520086300', 'Kishore Vegetables', '78974645', 'Vijetha Store in Madhapur Offers u 11 % Discount with Addmagpro', 'Madhapur Hyderabad', 'Near Bus Stop', 'assets/vendor_assets/discount_vendor_banners/66fa77dc6f37b.vijetha_banner.jpeg', 'Telangana', 'Hyderabad', 541120, 'union bank', '2484159442', '898965', 20, 40, '2024-11-05 06:02:48');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `district_id` int NOT NULL,
  `state_id` int NOT NULL,
  `district_name` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`district_id`, `state_id`, `district_name`, `created_at`) VALUES
(1, 1, 'Anantapur', '2024-07-25 06:14:06'),
(2, 1, 'Chittoor', '2024-07-25 06:14:06'),
(3, 1, 'East Godavari', '2024-07-25 06:14:06'),
(4, 1, 'Guntur', '2024-07-25 06:14:06'),
(5, 1, 'Krishna', '2024-07-25 06:14:06'),
(6, 1, 'Kurnool', '2024-07-25 06:14:06'),
(7, 1, 'Nellore', '2024-07-25 06:14:06'),
(8, 1, 'Prakasam', '2024-07-25 06:14:06'),
(9, 1, 'Srikakulam', '2024-07-25 06:14:06'),
(10, 1, 'Visakhapatnam', '2024-07-25 06:14:06'),
(11, 1, 'Vizianagaram', '2024-07-25 06:14:06'),
(12, 1, 'West Godavari', '2024-07-25 06:14:06'),
(13, 1, 'YSR Kadapa', '2024-07-25 06:14:06'),
(14, 1, 'Adilabad', '2024-07-25 06:14:06'),
(15, 1, 'Bhadradri Kothagudem', '2024-07-25 06:14:06'),
(16, 1, 'Hyderabad', '2024-07-25 06:14:06'),
(17, 1, 'Jagtial', '2024-07-25 06:14:06'),
(18, 1, 'Jangaon', '2024-07-25 06:14:06'),
(19, 1, 'Jayashankar Bhupalpally', '2024-07-25 06:14:06'),
(20, 1, 'Jogulamba Gadwal', '2024-07-25 06:14:06'),
(21, 1, 'Kamareddy', '2024-07-25 06:14:06'),
(22, 1, 'Karimnagar', '2024-07-25 06:14:06'),
(23, 1, 'Khammam', '2024-07-25 06:14:06'),
(24, 1, 'Mahabubabad', '2024-07-25 06:14:06'),
(25, 1, 'Mahabubnagar', '2024-07-25 06:14:06'),
(26, 1, 'Mancherial', '2024-07-25 06:14:06'),
(27, 1, 'Medak', '2024-07-25 06:14:06'),
(28, 2, 'Tawang', '2024-07-25 06:18:46'),
(29, 2, 'West Kameng', '2024-07-25 06:18:46'),
(30, 2, 'West Siang', '2024-07-25 06:18:46'),
(31, 2, 'Papum Pare', '2024-07-25 06:18:46'),
(32, 2, 'Lower Subansiri', '2024-07-25 06:18:46'),
(33, 2, 'Upper Subansiri', '2024-07-25 06:18:46'),
(34, 2, 'East Siang', '2024-07-25 06:18:46'),
(35, 2, 'Siang', '2024-07-25 06:18:46'),
(36, 2, 'Changlang', '2024-07-25 06:18:46'),
(37, 2, 'Longding', '2024-07-25 06:18:46'),
(38, 2, 'Namsai', '2024-07-25 06:18:46'),
(39, 2, 'Kurung Kumey', '2024-07-25 06:18:46'),
(40, 2, 'Kra Daadi', '2024-07-25 06:18:46'),
(41, 2, 'Lower Dibang Valley', '2024-07-25 06:18:46'),
(42, 2, 'Upper Dibang Valley', '2024-07-25 06:18:46'),
(43, 2, 'Anjaw', '2024-07-25 06:18:46'),
(44, 2, 'Lohit', '2024-07-25 06:18:46'),
(45, 3, 'Baksa', '2024-07-25 06:18:46'),
(46, 3, 'Barpeta', '2024-07-25 06:18:46'),
(47, 3, 'Bongaigaon', '2024-07-25 06:18:46'),
(48, 3, 'Cachar', '2024-07-25 06:18:46'),
(49, 3, 'Darrang', '2024-07-25 06:18:46'),
(50, 3, 'Dhemaji', '2024-07-25 06:18:46'),
(51, 3, 'Dhubri', '2024-07-25 06:18:46'),
(52, 3, 'Dibrugarh', '2024-07-25 06:18:46'),
(53, 3, 'Goalpara', '2024-07-25 06:18:46'),
(54, 3, 'Golaghat', '2024-07-25 06:18:46'),
(55, 3, 'Hailakandi', '2024-07-25 06:18:46'),
(56, 3, 'Hojai', '2024-07-25 06:18:46'),
(57, 3, 'Karbi Anglong', '2024-07-25 06:18:46'),
(58, 3, 'Karimganj', '2024-07-25 06:18:46'),
(59, 3, 'Kokrajhar', '2024-07-25 06:18:46'),
(60, 3, 'Lakhimpur', '2024-07-25 06:18:46'),
(61, 3, 'Majuli', '2024-07-25 06:18:46'),
(62, 3, 'Morigaon', '2024-07-25 06:18:46'),
(63, 3, 'Nagaon', '2024-07-25 06:18:46'),
(64, 3, 'Nalbari', '2024-07-25 06:18:46'),
(65, 3, 'Sivasagar', '2024-07-25 06:18:46'),
(66, 3, 'Sonitpur', '2024-07-25 06:18:46'),
(67, 3, 'Tinsukia', '2024-07-25 06:18:46'),
(68, 3, 'Udalguri', '2024-07-25 06:18:46'),
(69, 3, 'Chirang', '2024-07-25 06:18:46'),
(70, 4, 'Aurangabad', '2024-07-25 06:18:46'),
(71, 4, 'Banka', '2024-07-25 06:18:46'),
(72, 4, 'Begusarai', '2024-07-25 06:18:46'),
(73, 4, 'Bhagalpur', '2024-07-25 06:18:46'),
(74, 4, 'Bhojpur', '2024-07-25 06:18:46'),
(75, 4, 'Buxar', '2024-07-25 06:18:46'),
(76, 4, 'Darbhanga', '2024-07-25 06:18:46'),
(77, 4, 'Gaya', '2024-07-25 06:18:46'),
(78, 4, 'Gopalganj', '2024-07-25 06:18:46'),
(79, 4, 'Jamui', '2024-07-25 06:18:46'),
(80, 4, 'Jehanabad', '2024-07-25 06:18:46'),
(81, 4, 'Kaimur', '2024-07-25 06:18:46'),
(82, 4, 'Katihar', '2024-07-25 06:18:46'),
(83, 4, 'Kishanganj', '2024-07-25 06:18:46'),
(84, 4, 'Lakhisarai', '2024-07-25 06:18:46'),
(85, 4, 'Madhepura', '2024-07-25 06:18:46'),
(86, 4, 'Madhubani', '2024-07-25 06:18:46'),
(87, 4, 'Munger', '2024-07-25 06:18:46'),
(88, 4, 'Muzaffarpur', '2024-07-25 06:18:46'),
(89, 4, 'Nalanda', '2024-07-25 06:18:46'),
(90, 4, 'Nawada', '2024-07-25 06:18:46'),
(91, 4, 'Patna', '2024-07-25 06:18:46'),
(92, 4, 'Purnia', '2024-07-25 06:18:46'),
(93, 4, 'Rohtas', '2024-07-25 06:18:46'),
(94, 4, 'Saharsa', '2024-07-25 06:18:46'),
(95, 4, 'Samastipur', '2024-07-25 06:18:46'),
(96, 4, 'Saran', '2024-07-25 06:18:46'),
(97, 4, 'Sheikhpura', '2024-07-25 06:18:46'),
(98, 4, 'Sheohar', '2024-07-25 06:18:46'),
(99, 4, 'Sitamarhi', '2024-07-25 06:18:46'),
(100, 4, 'Siwan', '2024-07-25 06:18:46'),
(101, 4, 'Supaul', '2024-07-25 06:18:46'),
(102, 4, 'Vaishali', '2024-07-25 06:18:46'),
(103, 4, 'West Champaran', '2024-07-25 06:18:46'),
(104, 5, 'Balod', '2024-07-25 06:18:46'),
(105, 5, 'Baloda Bazar', '2024-07-25 06:18:46'),
(106, 5, 'Balrampur', '2024-07-25 06:18:46'),
(107, 5, 'Bastar', '2024-07-25 06:18:46'),
(108, 5, 'Bemetara', '2024-07-25 06:18:46'),
(109, 5, 'Bilaspur', '2024-07-25 06:18:46'),
(110, 5, 'Dantewada', '2024-07-25 06:18:46'),
(111, 5, 'Dhamtari', '2024-07-25 06:18:46'),
(112, 5, 'Durg', '2024-07-25 06:18:46'),
(113, 5, 'Gariaband', '2024-07-25 06:18:46'),
(114, 5, 'Janjgir-Champa', '2024-07-25 06:18:46'),
(115, 5, 'Jashpur', '2024-07-25 06:18:46'),
(116, 5, 'Kabirdham', '2024-07-25 06:18:46'),
(117, 5, 'Kanker', '2024-07-25 06:18:46'),
(118, 5, 'Kondagaon', '2024-07-25 06:18:46'),
(119, 5, 'Korba', '2024-07-25 06:18:46'),
(120, 5, 'Koriya', '2024-07-25 06:18:46'),
(121, 5, 'Mahasamund', '2024-07-25 06:18:46'),
(122, 5, 'Raigarh', '2024-07-25 06:18:46'),
(123, 5, 'Raipur', '2024-07-25 06:18:46'),
(124, 5, 'Rajnandgaon', '2024-07-25 06:18:46'),
(125, 5, 'Sukma', '2024-07-25 06:18:46'),
(126, 5, 'Surajpur', '2024-07-25 06:18:46'),
(127, 5, 'Surguja', '2024-07-25 06:18:46'),
(128, 6, 'North Goa', '2024-07-25 06:18:46'),
(129, 6, 'South Goa', '2024-07-25 06:18:46'),
(130, 7, 'Ahmedabad', '2024-07-25 06:18:46'),
(131, 7, 'Amreli', '2024-07-25 06:18:46'),
(132, 7, 'Anand', '2024-07-25 06:18:46'),
(133, 7, 'Aravalli', '2024-07-25 06:18:46'),
(134, 7, 'Banaskantha', '2024-07-25 06:18:46'),
(135, 7, 'Bharuch', '2024-07-25 06:18:46'),
(136, 7, 'Bhavnagar', '2024-07-25 06:18:46'),
(137, 7, 'Botad', '2024-07-25 06:18:46'),
(138, 7, 'Chhota Udepur', '2024-07-25 06:18:46'),
(139, 7, 'Dahod', '2024-07-25 06:18:46'),
(140, 7, 'Dangs', '2024-07-25 06:18:46'),
(141, 7, 'Gir Somnath', '2024-07-25 06:18:46'),
(142, 7, 'Jamnagar', '2024-07-25 06:18:46'),
(143, 7, 'Junagadh', '2024-07-25 06:18:46'),
(144, 7, 'Kutch', '2024-07-25 06:18:46'),
(145, 7, 'Mahisagar', '2024-07-25 06:18:46'),
(146, 7, 'Mehsana', '2024-07-25 06:18:46'),
(147, 7, 'Narmada', '2024-07-25 06:18:46'),
(148, 7, 'Navsari', '2024-07-25 06:18:46'),
(149, 7, 'Panchmahal', '2024-07-25 06:18:46'),
(150, 7, 'Patan', '2024-07-25 06:18:46'),
(151, 7, 'Porbandar', '2024-07-25 06:18:46'),
(152, 7, 'Rajkot', '2024-07-25 06:18:46'),
(153, 7, 'Sabarkantha', '2024-07-25 06:18:46'),
(154, 7, 'Surat', '2024-07-25 06:18:46'),
(155, 7, 'Surendranagar', '2024-07-25 06:18:46'),
(156, 7, 'Tapi', '2024-07-25 06:18:46'),
(157, 7, 'Vadodara', '2024-07-25 06:18:46'),
(158, 7, 'Valsad', '2024-07-25 06:18:46'),
(159, 8, 'Ambala', '2024-07-25 06:18:46'),
(160, 8, 'Bhiwani', '2024-07-25 06:18:46'),
(161, 8, 'Charkhi Dadri', '2024-07-25 06:18:46'),
(162, 8, 'Faridabad', '2024-07-25 06:18:46'),
(163, 8, 'Fatehabad', '2024-07-25 06:18:46'),
(164, 8, 'Gurugram', '2024-07-25 06:18:46'),
(165, 8, 'Hisar', '2024-07-25 06:18:46'),
(166, 8, 'Jind', '2024-07-25 06:18:46'),
(167, 8, 'Kaithal', '2024-07-25 06:18:46'),
(168, 8, 'Karnal', '2024-07-25 06:18:46'),
(169, 8, 'Mahendragarh', '2024-07-25 06:18:46'),
(170, 8, 'Panchkula', '2024-07-25 06:18:46'),
(171, 8, 'Panipat', '2024-07-25 06:18:46'),
(172, 8, 'Rewari', '2024-07-25 06:18:46'),
(173, 8, 'Rohtak', '2024-07-25 06:18:46'),
(174, 8, 'Sirsa', '2024-07-25 06:18:46'),
(175, 8, 'Sonipat', '2024-07-25 06:18:46'),
(176, 8, 'Yamunanagar', '2024-07-25 06:18:46'),
(177, 9, 'Bilaspur', '2024-07-25 06:18:46'),
(178, 9, 'Chamba', '2024-07-25 06:18:46'),
(179, 9, 'Hamirpur', '2024-07-25 06:18:46'),
(180, 9, 'Kangra', '2024-07-25 06:18:46'),
(181, 9, 'Kinnaur', '2024-07-25 06:18:46'),
(182, 9, 'Kullu', '2024-07-25 06:18:46'),
(183, 9, 'Lahaul and Spiti', '2024-07-25 06:18:46'),
(184, 9, 'Mandi', '2024-07-25 06:18:46'),
(185, 9, 'Shimla', '2024-07-25 06:18:46'),
(186, 9, 'Sirmaur', '2024-07-25 06:18:46'),
(187, 9, 'Solan', '2024-07-25 06:18:46'),
(188, 9, 'Una', '2024-07-25 06:18:46'),
(189, 10, 'Bokaro', '2024-07-25 06:18:46'),
(190, 10, 'Chatra', '2024-07-25 06:18:46'),
(191, 10, 'Deoghar', '2024-07-25 06:18:46'),
(192, 10, 'Dhanbad', '2024-07-25 06:18:46'),
(193, 10, 'Dumka', '2024-07-25 06:18:46'),
(194, 10, 'East Singhbhum', '2024-07-25 06:18:46'),
(195, 10, 'Garhwa', '2024-07-25 06:18:46'),
(196, 10, 'Giridih', '2024-07-25 06:18:46'),
(197, 10, 'Godda', '2024-07-25 06:18:46'),
(198, 10, 'Gumla', '2024-07-25 06:18:46'),
(199, 10, 'Hazaribagh', '2024-07-25 06:18:46'),
(200, 10, 'Jamtara', '2024-07-25 06:18:46'),
(201, 10, 'Khunti', '2024-07-25 06:18:46'),
(202, 10, 'Koderma', '2024-07-25 06:18:46'),
(203, 10, 'Latehar', '2024-07-25 06:18:46'),
(204, 10, 'Lohardaga', '2024-07-25 06:18:46'),
(205, 10, 'Pakur', '2024-07-25 06:18:46'),
(206, 10, 'Palamu', '2024-07-25 06:18:46'),
(207, 10, 'Ranchi', '2024-07-25 06:18:46'),
(208, 10, 'Sahibganj', '2024-07-25 06:18:46'),
(209, 10, 'Saraikela-Kharsawan', '2024-07-25 06:18:46'),
(210, 10, 'Simdega', '2024-07-25 06:18:46'),
(211, 10, 'West Singhbhum', '2024-07-25 06:18:46'),
(212, 11, 'Bagalkote', '2024-07-25 06:18:46'),
(213, 11, 'Ballari', '2024-07-25 06:18:46'),
(214, 11, 'Belagavi', '2024-07-25 06:18:46'),
(215, 11, 'Bellary', '2024-07-25 06:18:46'),
(216, 11, 'Bidar', '2024-07-25 06:18:46'),
(217, 11, 'Chamarajanagar', '2024-07-25 06:18:46'),
(218, 11, 'Chikballapur', '2024-07-25 06:18:46'),
(219, 11, 'Chikkamagaluru', '2024-07-25 06:18:46'),
(220, 11, 'Chitradurga', '2024-07-25 06:18:46'),
(221, 11, 'Dakshina Kannada', '2024-07-25 06:18:46'),
(222, 11, 'Davangere', '2024-07-25 06:18:46'),
(223, 11, 'Dharwad', '2024-07-25 06:18:46'),
(224, 11, 'Gadag', '2024-07-25 06:18:46'),
(225, 11, 'Gulbarga', '2024-07-25 06:18:46'),
(226, 11, 'Hassan', '2024-07-25 06:18:46'),
(227, 11, 'Haveri', '2024-07-25 06:18:46'),
(228, 11, 'Kodagu', '2024-07-25 06:18:46'),
(229, 11, 'Kolar', '2024-07-25 06:18:46'),
(230, 11, 'Koppal', '2024-07-25 06:18:46'),
(231, 11, 'Mandya', '2024-07-25 06:18:46'),
(232, 11, 'Mysuru', '2024-07-25 06:18:46'),
(233, 11, 'Raichur', '2024-07-25 06:18:46'),
(234, 11, 'Ramanagara', '2024-07-25 06:18:46'),
(235, 11, 'Shimoga', '2024-07-25 06:18:46'),
(236, 11, 'Tumkur', '2024-07-25 06:18:46'),
(237, 11, 'Udupi', '2024-07-25 06:18:46'),
(238, 11, 'Uttara Kannada', '2024-07-25 06:18:46'),
(239, 11, 'Yadgir', '2024-07-25 06:18:46'),
(240, 12, 'Alappuzha', '2024-07-25 06:18:46'),
(241, 12, 'Ernakulam', '2024-07-25 06:18:46'),
(242, 12, 'Idukki', '2024-07-25 06:18:46'),
(243, 12, 'Kannur', '2024-07-25 06:18:46'),
(244, 12, 'Kasaragod', '2024-07-25 06:18:46'),
(245, 12, 'Kottayam', '2024-07-25 06:18:46'),
(246, 12, 'Kollam', '2024-07-25 06:18:46'),
(247, 12, 'Kochi', '2024-07-25 06:18:46'),
(248, 12, 'Malappuram', '2024-07-25 06:18:46'),
(249, 12, 'Palakkad', '2024-07-25 06:18:46'),
(250, 12, 'Pathanamthitta', '2024-07-25 06:18:46'),
(251, 12, 'Thiruvananthapuram', '2024-07-25 06:18:46'),
(252, 12, 'Thrissur', '2024-07-25 06:18:46'),
(253, 12, 'Wayanad', '2024-07-25 06:18:46'),
(254, 13, 'Ashoknagar', '2024-07-25 06:18:46'),
(255, 13, 'Balaghat', '2024-07-25 06:18:46'),
(256, 13, 'Barwani', '2024-07-25 06:18:46'),
(257, 13, 'Betul', '2024-07-25 06:18:46'),
(258, 13, 'Bhind', '2024-07-25 06:18:46'),
(259, 13, 'Bhopal', '2024-07-25 06:18:46'),
(260, 13, 'Burhanpur', '2024-07-25 06:18:46'),
(261, 13, 'Chhindwara', '2024-07-25 06:18:46'),
(262, 13, 'Damoh', '2024-07-25 06:18:46'),
(263, 13, 'Datia', '2024-07-25 06:18:46'),
(264, 13, 'Dewas', '2024-07-25 06:18:46'),
(265, 13, 'Dhar', '2024-07-25 06:18:46'),
(266, 13, 'Guna', '2024-07-25 06:18:46'),
(267, 13, 'Gwalior', '2024-07-25 06:18:46'),
(268, 13, 'Harda', '2024-07-25 06:18:46'),
(269, 13, 'Hoshangabad', '2024-07-25 06:18:46'),
(270, 13, 'Indore', '2024-07-25 06:18:46'),
(271, 13, 'Jabalpur', '2024-07-25 06:18:46'),
(272, 13, 'Jhabua', '2024-07-25 06:18:46'),
(273, 13, 'Katni', '2024-07-25 06:18:46'),
(274, 13, 'Khandwa', '2024-07-25 06:18:46'),
(275, 13, 'Khargone', '2024-07-25 06:18:46'),
(276, 13, 'Mandla', '2024-07-25 06:18:46'),
(277, 13, 'Mandsaur', '2024-07-25 06:18:46'),
(278, 13, 'Morena', '2024-07-25 06:18:46'),
(279, 13, 'Narsinghpur', '2024-07-25 06:18:46'),
(280, 13, 'Neemuch', '2024-07-25 06:18:46'),
(281, 13, 'Panna', '2024-07-25 06:18:46'),
(282, 13, 'Raisen', '2024-07-25 06:18:46'),
(283, 13, 'Rajgarh', '2024-07-25 06:18:46'),
(284, 13, 'Ratlam', '2024-07-25 06:18:46'),
(285, 13, 'Rewa', '2024-07-25 06:18:46'),
(286, 13, 'Sagar', '2024-07-25 06:18:46'),
(287, 13, 'Satna', '2024-07-25 06:18:46'),
(288, 13, 'Sehore', '2024-07-25 06:18:46'),
(289, 13, 'Sidhhi', '2024-07-25 06:18:46'),
(290, 13, 'Singrauli', '2024-07-25 06:18:46'),
(291, 13, 'Tikamgarh', '2024-07-25 06:18:46'),
(292, 13, 'Ujjain', '2024-07-25 06:18:46'),
(293, 13, 'Vidisha', '2024-07-25 06:18:46'),
(294, 14, 'Ahmednagar', '2024-07-25 06:18:46'),
(295, 14, 'Akola', '2024-07-25 06:18:46'),
(296, 14, 'Amravati', '2024-07-25 06:18:46'),
(297, 14, 'Aurangabad', '2024-07-25 06:18:46'),
(298, 14, 'Beed', '2024-07-25 06:18:46'),
(299, 14, 'Bhandara', '2024-07-25 06:18:46'),
(300, 14, 'Buldhana', '2024-07-25 06:18:46'),
(301, 14, 'Chandrapur', '2024-07-25 06:18:46'),
(302, 14, 'Dhule', '2024-07-25 06:18:46'),
(303, 14, 'Gadchiroli', '2024-07-25 06:18:46'),
(304, 14, 'Gondia', '2024-07-25 06:18:46'),
(305, 14, 'Jalgaon', '2024-07-25 06:18:46'),
(306, 14, 'Jalna', '2024-07-25 06:18:46'),
(307, 14, 'Kolhapur', '2024-07-25 06:18:46'),
(308, 14, 'Latur', '2024-07-25 06:18:46'),
(309, 14, 'Mumbai City', '2024-07-25 06:18:46'),
(310, 14, 'Mumbai Suburban', '2024-07-25 06:18:46'),
(311, 14, 'Nagpur', '2024-07-25 06:18:46'),
(312, 14, 'Nanded', '2024-07-25 06:18:46'),
(313, 14, 'Nandurbar', '2024-07-25 06:18:46'),
(314, 14, 'Nashik', '2024-07-25 06:18:46'),
(315, 14, 'Osmanabad', '2024-07-25 06:18:46'),
(316, 14, 'Parbhani', '2024-07-25 06:18:46'),
(317, 14, 'Pune', '2024-07-25 06:18:46'),
(318, 14, 'Raigad', '2024-07-25 06:18:46'),
(319, 14, 'Ratnagiri', '2024-07-25 06:18:46'),
(320, 14, 'Sangli', '2024-07-25 06:18:46'),
(321, 14, 'Satara', '2024-07-25 06:18:46'),
(322, 14, 'Sindhudurg', '2024-07-25 06:18:46'),
(323, 14, 'Solapur', '2024-07-25 06:18:46'),
(324, 14, 'Thane', '2024-07-25 06:18:46'),
(325, 14, 'Wardha', '2024-07-25 06:18:46'),
(326, 14, 'Washim', '2024-07-25 06:18:46'),
(327, 14, 'Yavatmal', '2024-07-25 06:18:46'),
(328, 15, 'Bishnupur', '2024-07-25 06:18:46'),
(329, 15, 'Chandel', '2024-07-25 06:18:46'),
(330, 15, 'Churachandpur', '2024-07-25 06:18:46'),
(331, 15, 'Imphal East', '2024-07-25 06:18:46'),
(332, 15, 'Imphal West', '2024-07-25 06:18:46'),
(333, 15, 'Senapati', '2024-07-25 06:18:46'),
(334, 15, 'Tamenglong', '2024-07-25 06:18:46'),
(335, 15, 'Thoubal', '2024-07-25 06:18:46'),
(336, 15, 'Ukhrul', '2024-07-25 06:18:46'),
(337, 16, 'East Garo Hills', '2024-07-25 06:18:46'),
(338, 16, 'East Khasi Hills', '2024-07-25 06:18:46'),
(339, 16, 'North Garo Hills', '2024-07-25 06:18:46'),
(340, 16, 'Ri-Bhoi', '2024-07-25 06:18:46'),
(341, 16, 'South Garo Hills', '2024-07-25 06:18:46'),
(342, 16, 'South West Garo Hills', '2024-07-25 06:18:46'),
(343, 16, 'South West Khasi Hills', '2024-07-25 06:18:46'),
(344, 16, 'West Garo Hills', '2024-07-25 06:18:46'),
(345, 16, 'West Khasi Hills', '2024-07-25 06:18:46'),
(346, 17, 'Aizawl', '2024-07-25 06:18:46'),
(347, 17, 'Champhai', '2024-07-25 06:18:46'),
(348, 17, 'Kolasib', '2024-07-25 06:18:46'),
(349, 17, 'Lawngtlai', '2024-07-25 06:18:46'),
(350, 17, 'Lunglei', '2024-07-25 06:18:46'),
(351, 17, 'Mamit', '2024-07-25 06:18:46'),
(352, 17, 'Serchhip', '2024-07-25 06:18:46'),
(353, 18, 'Dimapur', '2024-07-25 06:18:46'),
(354, 18, 'Kiphire', '2024-07-25 06:18:46'),
(355, 18, 'Kohima', '2024-07-25 06:18:46'),
(356, 18, 'Longleng', '2024-07-25 06:18:46'),
(357, 18, 'Mokokchung', '2024-07-25 06:18:46'),
(358, 18, 'Mon', '2024-07-25 06:18:46'),
(359, 18, 'Peren', '2024-07-25 06:18:46'),
(360, 18, 'Phek', '2024-07-25 06:18:46'),
(361, 18, 'Tuensang', '2024-07-25 06:18:46'),
(362, 18, 'Wokha', '2024-07-25 06:18:46'),
(363, 18, 'Zunheboto', '2024-07-25 06:18:46'),
(364, 19, 'Angul', '2024-07-25 06:18:46'),
(365, 19, 'Bargarh', '2024-07-25 06:18:46'),
(366, 19, 'Baudh', '2024-07-25 06:18:46'),
(367, 19, 'Balangir', '2024-07-25 06:18:46'),
(368, 19, 'Balasore', '2024-07-25 06:18:46'),
(369, 19, 'Boudh', '2024-07-25 06:18:46'),
(370, 19, 'Cuttack', '2024-07-25 06:18:46'),
(371, 19, 'Dhenkanal', '2024-07-25 06:18:46'),
(372, 19, 'Gajapati', '2024-07-25 06:18:46'),
(373, 19, 'Ganjam', '2024-07-25 06:18:46'),
(374, 19, 'Jagatsinghpur', '2024-07-25 06:18:46'),
(375, 19, 'Jajpur', '2024-07-25 06:18:46'),
(376, 19, 'Jharsuguda', '2024-07-25 06:18:46'),
(377, 19, 'Kalahandi', '2024-07-25 06:18:46'),
(378, 19, 'Kandhamal', '2024-07-25 06:18:46'),
(379, 19, 'Kendrapara', '2024-07-25 06:18:46'),
(380, 19, 'Kendujhar', '2024-07-25 06:18:46'),
(381, 19, 'Khurda', '2024-07-25 06:18:46'),
(382, 19, 'Koraput', '2024-07-25 06:18:46'),
(383, 19, 'Malkangiri', '2024-07-25 06:18:46'),
(384, 19, 'Nabarangpur', '2024-07-25 06:18:46'),
(385, 19, 'Nayagarh', '2024-07-25 06:18:46'),
(386, 19, 'Nuapada', '2024-07-25 06:18:46'),
(387, 19, 'Rayagada', '2024-07-25 06:18:46'),
(388, 19, 'Sambalpur', '2024-07-25 06:18:46'),
(389, 19, 'Subarnapur', '2024-07-25 06:18:46'),
(390, 19, 'Sundargarh', '2024-07-25 06:18:46'),
(391, 20, 'Amritsar', '2024-07-25 06:18:46'),
(392, 20, 'Barnala', '2024-07-25 06:18:46'),
(393, 20, 'Bathinda', '2024-07-25 06:18:46'),
(394, 20, 'Faridkot', '2024-07-25 06:18:46'),
(395, 20, 'Fatehgarh Sahib', '2024-07-25 06:18:46'),
(396, 20, 'Fazilka', '2024-07-25 06:18:46'),
(397, 20, 'Firozepur', '2024-07-25 06:18:46'),
(398, 20, 'Gurdaspur', '2024-07-25 06:18:46'),
(399, 20, 'Hoshiarpur', '2024-07-25 06:18:46'),
(400, 20, 'Jalandhar', '2024-07-25 06:18:46'),
(401, 20, 'Kapurthala', '2024-07-25 06:18:46'),
(402, 20, 'Ludhiana', '2024-07-25 06:18:46'),
(403, 20, 'Mansa', '2024-07-25 06:18:46'),
(404, 20, 'Moga', '2024-07-25 06:18:46'),
(405, 20, 'Muktsar', '2024-07-25 06:18:46'),
(406, 20, 'Patiala', '2024-07-25 06:18:46'),
(407, 20, 'Rupnagar', '2024-07-25 06:18:46'),
(408, 20, 'Sangrur', '2024-07-25 06:18:46'),
(409, 20, 'SAS Nagar', '2024-07-25 06:18:46'),
(410, 20, 'Sri Muktsar Sahib', '2024-07-25 06:18:46'),
(411, 20, 'Tarn Taran', '2024-07-25 06:18:46'),
(412, 21, 'Ajmer', '2024-07-25 06:18:46'),
(413, 21, 'Alwar', '2024-07-25 06:18:46'),
(414, 21, 'Banswara', '2024-07-25 06:18:46'),
(415, 21, 'Baran', '2024-07-25 06:18:46'),
(416, 21, 'Barmer', '2024-07-25 06:18:46'),
(417, 21, 'Bhilwara', '2024-07-25 06:18:46'),
(418, 21, 'Bikaner', '2024-07-25 06:18:46'),
(419, 21, 'Bundi', '2024-07-25 06:18:46'),
(420, 21, 'Chittorgarh', '2024-07-25 06:18:46'),
(421, 21, 'Churu', '2024-07-25 06:18:46'),
(422, 21, 'Dausa', '2024-07-25 06:18:46'),
(423, 21, 'Dungarpur', '2024-07-25 06:18:46'),
(424, 21, 'Hanumangarh', '2024-07-25 06:18:46'),
(425, 21, 'Jaisalmer', '2024-07-25 06:18:46'),
(426, 21, 'Jalore', '2024-07-25 06:18:46'),
(427, 21, 'Jhalawar', '2024-07-25 06:18:46'),
(428, 21, 'Jhunjhunu', '2024-07-25 06:18:46'),
(429, 21, 'Jodhpur', '2024-07-25 06:18:46'),
(430, 21, 'Karauli', '2024-07-25 06:18:46'),
(431, 21, 'Nagaur', '2024-07-25 06:18:46'),
(432, 21, 'Pali', '2024-07-25 06:18:46'),
(433, 21, 'Rajsamand', '2024-07-25 06:18:46'),
(434, 21, 'Sawai Madhopur', '2024-07-25 06:18:46'),
(435, 21, 'Sikar', '2024-07-25 06:18:46'),
(436, 21, 'Sirohi', '2024-07-25 06:18:46'),
(437, 21, 'Tonk', '2024-07-25 06:18:46'),
(438, 21, 'Udaipur', '2024-07-25 06:18:46'),
(439, 22, 'East Sikkim', '2024-07-25 06:18:46'),
(440, 22, 'North Sikkim', '2024-07-25 06:18:46'),
(441, 22, 'South Sikkim', '2024-07-25 06:18:46'),
(442, 22, 'West Sikkim', '2024-07-25 06:18:46'),
(443, 23, 'Chengalpattu', '2024-07-25 06:18:46'),
(444, 23, 'Kanchipuram', '2024-07-25 06:18:46'),
(445, 23, 'Cuddalore', '2024-07-25 06:18:46'),
(446, 23, 'Dharmapuri', '2024-07-25 06:18:46'),
(447, 23, 'Dindigul', '2024-07-25 06:18:46'),
(448, 23, 'Erode', '2024-07-25 06:18:46'),
(449, 23, 'Kallakurichi', '2024-07-25 06:18:46'),
(450, 23, 'Karur', '2024-07-25 06:18:46'),
(451, 23, 'Madurai', '2024-07-25 06:18:46'),
(452, 23, 'Nagapattinam', '2024-07-25 06:18:46'),
(453, 23, 'Namakkal', '2024-07-25 06:18:46'),
(454, 23, 'Perambalur', '2024-07-25 06:18:46'),
(455, 23, 'Pudukottai', '2024-07-25 06:18:46'),
(456, 23, 'Ramanathapuram', '2024-07-25 06:18:46'),
(457, 23, 'Ranipet', '2024-07-25 06:18:46'),
(458, 23, 'Salem', '2024-07-25 06:18:46'),
(459, 23, 'Sivaganga', '2024-07-25 06:18:46'),
(460, 23, 'Tenkasi', '2024-07-25 06:18:46'),
(461, 23, 'Thanjavur', '2024-07-25 06:18:46'),
(462, 23, 'Theni', '2024-07-25 06:18:46'),
(463, 23, 'Thoothukudi', '2024-07-25 06:18:46'),
(464, 23, 'Tiruchirappalli', '2024-07-25 06:18:46'),
(465, 23, 'Tirunelveli', '2024-07-25 06:18:46'),
(466, 23, 'Tirupathur', '2024-07-25 06:18:46'),
(467, 23, 'Tiruppur', '2024-07-25 06:18:46'),
(468, 23, 'Vellore', '2024-07-25 06:18:46'),
(469, 23, 'Villupuram', '2024-07-25 06:18:46'),
(470, 23, 'Virudhunagar', '2024-07-25 06:18:46'),
(471, 24, 'Adilabad', '2024-07-25 06:18:46'),
(472, 24, 'Bhadradri Kothagudem', '2024-07-25 06:18:46'),
(473, 24, 'Hyderabad', '2024-07-25 06:18:46'),
(474, 24, 'Jagtial', '2024-07-25 06:18:46'),
(475, 24, 'Jangaon', '2024-07-25 06:18:46'),
(476, 24, 'Jayashankar Bhupalpally', '2024-07-25 06:18:46'),
(477, 24, 'Jogulamba Gadwal', '2024-07-25 06:18:46'),
(478, 24, 'Kamareddy', '2024-07-25 06:18:46'),
(479, 24, 'Karimnagar', '2024-07-25 06:18:46'),
(480, 24, 'Khammam', '2024-07-25 06:18:46'),
(481, 24, 'Mahabubabad', '2024-07-25 06:18:46'),
(482, 24, 'Mahabubnagar', '2024-07-25 06:18:46'),
(483, 24, 'Mancherial', '2024-07-25 06:18:46'),
(484, 24, 'Medak', '2024-07-25 06:18:46'),
(485, 24, 'Nagarkurnool', '2024-07-25 06:18:46'),
(486, 24, 'Nalgonda', '2024-07-25 06:18:46'),
(487, 24, 'Nirmal', '2024-07-25 06:18:46'),
(488, 24, 'Nizamabad', '2024-07-25 06:18:46'),
(489, 24, 'Peddapalli', '2024-07-25 06:18:46'),
(490, 24, 'Ranga Reddy', '2024-07-25 06:18:46'),
(491, 24, 'Sangareddy', '2024-07-25 06:18:46'),
(492, 24, 'Warangal Rural', '2024-07-25 06:18:46'),
(493, 24, 'Warangal Urban', '2024-07-25 06:18:46'),
(494, 24, 'Yadadri Bhuvanagiri', '2024-07-25 06:18:46'),
(495, 25, 'Dhalai', '2024-07-25 06:18:46'),
(496, 25, 'Khowai', '2024-07-25 06:18:46'),
(497, 25, 'North Tripura', '2024-07-25 06:18:46'),
(498, 25, 'Sepahijala', '2024-07-25 06:18:46'),
(499, 25, 'South Tripura', '2024-07-25 06:18:46'),
(500, 25, 'Unakoti', '2024-07-25 06:18:46'),
(501, 25, 'West Tripura', '2024-07-25 06:18:46'),
(502, 26, 'Agra', '2024-07-25 06:18:46'),
(503, 26, 'Aligarh', '2024-07-25 06:18:46'),
(504, 26, 'Allahabad', '2024-07-25 06:18:46'),
(505, 26, 'Ambedkar Nagar', '2024-07-25 06:18:46'),
(506, 26, 'Auraiya', '2024-07-25 06:18:46'),
(507, 26, 'Azamgarh', '2024-07-25 06:18:46'),
(508, 26, 'Badaun', '2024-07-25 06:18:46'),
(509, 26, 'Baghpat', '2024-07-25 06:18:46'),
(510, 26, 'Bahraich', '2024-07-25 06:18:46'),
(511, 26, 'Ballia', '2024-07-25 06:18:46'),
(512, 26, 'Balrampur', '2024-07-25 06:18:46'),
(513, 26, 'Banda', '2024-07-25 06:18:46'),
(514, 26, 'Barabanki', '2024-07-25 06:18:46'),
(515, 26, 'Bareilly', '2024-07-25 06:18:46'),
(516, 26, 'Basti', '2024-07-25 06:18:46'),
(517, 26, 'Bijnor', '2024-07-25 06:18:46'),
(518, 26, 'Budaun', '2024-07-25 06:18:46'),
(519, 26, 'Bulandshahr', '2024-07-25 06:18:46'),
(520, 26, 'Chandauli', '2024-07-25 06:18:46'),
(521, 26, 'Chitrakoot', '2024-07-25 06:18:46'),
(522, 26, 'Deoria', '2024-07-25 06:18:46'),
(523, 26, 'Etah', '2024-07-25 06:18:46'),
(524, 26, 'Etawah', '2024-07-25 06:18:46'),
(525, 26, 'Faizabad', '2024-07-25 06:18:46'),
(526, 26, 'Farrukhabad', '2024-07-25 06:18:46'),
(527, 26, 'Fatehpur', '2024-07-25 06:18:46'),
(528, 26, 'Firozabad', '2024-07-25 06:18:46'),
(529, 26, 'Gautam Buddha Nagar', '2024-07-25 06:18:46'),
(530, 26, 'Ghaziabad', '2024-07-25 06:18:46'),
(531, 26, 'Ghazipur', '2024-07-25 06:18:46'),
(532, 26, 'Gonda', '2024-07-25 06:18:46'),
(533, 26, 'Gorakhpur', '2024-07-25 06:18:46'),
(534, 26, 'Hamirpur', '2024-07-25 06:18:46'),
(535, 26, 'Hapur', '2024-07-25 06:18:46'),
(536, 26, 'Hardoi', '2024-07-25 06:18:46'),
(537, 26, 'Hathras', '2024-07-25 06:18:46'),
(538, 26, 'Jalaun', '2024-07-25 06:18:46'),
(539, 26, 'Jaunpur', '2024-07-25 06:18:46'),
(540, 26, 'Jhansi', '2024-07-25 06:18:46'),
(541, 26, 'Jhansi', '2024-07-25 06:18:46'),
(542, 26, 'Kannauj', '2024-07-25 06:18:46'),
(543, 26, 'Kanpur Dehat', '2024-07-25 06:18:46'),
(544, 26, 'Kanpur Nagar', '2024-07-25 06:18:46'),
(545, 26, 'Kushinagar', '2024-07-25 06:18:46'),
(546, 26, 'Lakhimpur Kheri', '2024-07-25 06:18:46'),
(547, 26, 'Lalitpur', '2024-07-25 06:18:46'),
(548, 26, 'Lucknow', '2024-07-25 06:18:46'),
(549, 26, 'Maharajganj', '2024-07-25 06:18:46'),
(550, 26, 'Mahoba', '2024-07-25 06:18:46'),
(551, 26, 'Manpuri', '2024-07-25 06:18:46'),
(552, 26, 'Mathura', '2024-07-25 06:18:46'),
(553, 26, 'Mau', '2024-07-25 06:18:46'),
(554, 26, 'Meerut', '2024-07-25 06:18:46'),
(555, 26, 'Mirzapur', '2024-07-25 06:18:46'),
(556, 26, 'Moradabad', '2024-07-25 06:18:46'),
(557, 26, 'Muzaffarnagar', '2024-07-25 06:18:46'),
(558, 26, 'Pilibhit', '2024-07-25 06:18:46'),
(559, 26, 'Pratapgarh', '2024-07-25 06:18:46'),
(560, 26, 'Raebareli', '2024-07-25 06:18:46'),
(561, 26, 'Rampur', '2024-07-25 06:18:46'),
(562, 26, 'Saharanpur', '2024-07-25 06:18:46'),
(563, 26, 'Sant Kabir Nagar', '2024-07-25 06:18:46'),
(564, 26, 'Shahjahanpur', '2024-07-25 06:18:46'),
(565, 26, 'Shamli', '2024-07-25 06:18:46'),
(566, 26, 'Shravasti', '2024-07-25 06:18:46'),
(567, 26, 'Siddharthnagar', '2024-07-25 06:18:46'),
(568, 26, 'Sitapur', '2024-07-25 06:18:46'),
(569, 26, 'Sonbhadra', '2024-07-25 06:18:46'),
(570, 26, 'Sultanpur', '2024-07-25 06:18:46'),
(571, 26, 'Unnao', '2024-07-25 06:18:46'),
(572, 26, 'Varanasi', '2024-07-25 06:18:46'),
(573, 27, 'Almora', '2024-07-25 06:18:46'),
(574, 27, 'Bageshwar', '2024-07-25 06:18:46'),
(575, 27, 'Bhimtal', '2024-07-25 06:18:46'),
(576, 27, 'Champawat', '2024-07-25 06:18:46'),
(577, 27, 'Haridwar', '2024-07-25 06:18:46'),
(578, 27, 'Nainital', '2024-07-25 06:18:46'),
(579, 27, 'Pauri Garhwal', '2024-07-25 06:18:46'),
(580, 27, 'Pithoragarh', '2024-07-25 06:18:46'),
(581, 27, 'Rudraprayag', '2024-07-25 06:18:46'),
(582, 27, 'Tehri Garhwal', '2024-07-25 06:18:46'),
(583, 27, 'Udham Singh Nagar', '2024-07-25 06:18:46'),
(584, 27, 'Uttarkashi', '2024-07-25 06:18:46'),
(585, 28, 'Bankura', '2024-07-25 06:18:46'),
(586, 28, 'Bardhaman', '2024-07-25 06:18:46'),
(587, 28, 'Birbhum', '2024-07-25 06:18:46'),
(588, 28, 'Bhowanipore', '2024-07-25 06:18:46'),
(589, 28, 'Howrah', '2024-07-25 06:18:46'),
(590, 28, 'Jalpaiguri', '2024-07-25 06:18:46'),
(591, 28, 'Jhargram', '2024-07-25 06:18:46'),
(592, 28, 'Kolkata', '2024-07-25 06:18:46'),
(593, 28, 'Murarai', '2024-07-25 06:18:46'),
(594, 28, 'Nadia', '2024-07-25 06:18:46'),
(595, 28, 'North 24 Parganas', '2024-07-25 06:18:46'),
(596, 28, 'Paschim Medinipur', '2024-07-25 06:18:46'),
(597, 28, 'Purba Medinipur', '2024-07-25 06:18:46'),
(598, 28, 'Purulia', '2024-07-25 06:18:46'),
(599, 28, 'South 24 Parganas', '2024-07-25 06:18:46'),
(600, 28, 'Uttar Dinajpur', '2024-07-25 06:18:46');

-- --------------------------------------------------------

--
-- Table structure for table `events_banners`
--

CREATE TABLE `events_banners` (
  `event_banner_id` int NOT NULL,
  `event_banner_name` varchar(250) NOT NULL,
  `event_banner_image` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `events_banners`
--

INSERT INTO `events_banners` (`event_banner_id`, `event_banner_name`, `event_banner_image`, `created_at`) VALUES
(3, 'Eventsbanner1', 'assets/events_banner_images/668d74361a7a6.puri 1.jpg', '2024-07-09 17:32:38'),
(4, 'Eventsbanner2', 'assets/events_banner_images/668d77b995942.narahari event2.JPG', '2024-07-09 17:47:37'),
(5, 'Eventsbanner3', 'assets/events_banner_images/668d791b78415.narahari event1.JPG', '2024-07-09 17:53:31'),
(6, 'Eventsbanner4', 'assets/events_banner_images/668d74e2047df.puri2.jpg', '2024-07-09 17:35:30'),
(7, 'Eventsbanner5', 'assets/events_banner_images/668d795493cad.addmag sudheer babu.JPG', '2024-07-09 17:54:28'),
(8, 'Eventsbanner6', 'assets/events_banner_images/668d78e53e47d.Chandrabhos2.jpg', '2024-07-09 17:52:37'),
(9, 'Eventsbanner7', 'assets/events_banner_images/668d74d0a8a9b.addmag sudeer babu 2.jpg', '2024-07-09 17:35:12'),
(10, 'Eventsbanner8', 'assets/events_banner_images/66b9bf9c0e5f7.corporate-events-3.jpg', '2024-08-12 07:54:04'),
(11, 'Eventsbanner9', 'assets/events_banner_images/66b9bfb019dde.Untitled-design-2023-03-16T112342.403.webp', '2024-08-12 07:54:24'),
(12, 'Eventsbanner10', 'assets/events_banner_images/66b9bfbcc450f.1661390515341.avif', '2024-08-12 07:54:36');

-- --------------------------------------------------------

--
-- Table structure for table `franchises`
--

CREATE TABLE `franchises` (
  `franchise_id` int NOT NULL,
  `franchise_name` varchar(30) NOT NULL,
  `franchise_owner` varchar(30) NOT NULL,
  `franchise_location` varchar(30) NOT NULL,
  `franchise_phone` varchar(10) NOT NULL,
  `franchise_email` text NOT NULL,
  `franchise_type` text NOT NULL,
  `franchise_start_date` datetime NOT NULL,
  `franchise_status` int NOT NULL DEFAULT '0' COMMENT '0:inactive 1:active 2:pending',
  `franchise_revenue` bigint NOT NULL,
  `franchise_expenses` bigint NOT NULL,
  `franchise_profit` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `franchises`
--

INSERT INTO `franchises` (`franchise_id`, `franchise_name`, `franchise_owner`, `franchise_location`, `franchise_phone`, `franchise_email`, `franchise_type`, `franchise_start_date`, `franchise_status`, `franchise_revenue`, `franchise_expenses`, `franchise_profit`) VALUES
(1, 'FreshBite Café', 'santosh', 'hyderabad', '9491001123', 'santosh232@gmail.com', 'basic', '2024-04-18 11:34:54', 1, 45000, 26546, 5000),
(2, 'TechTrend', 'bargav', 'hyderabad', '9491450112', 'bargav453@gmail.com', 'advance', '2024-04-18 11:34:54', 2, 45000, 87879, 5000),
(3, 'BakeBliss', 'vinay', 'Chennai', '9491785113', 'vinay787@gmail.com', 'advance', '2024-04-18 11:34:54', 0, 45000, 14000, 6500),
(4, 'Playzone', 'kareem', 'hyderabad', '9491450112', 'kareem453@gmail.com', 'medium', '2024-04-18 11:34:54', 1, 84000, 14000, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `gadget_gallery`
--

CREATE TABLE `gadget_gallery` (
  `gadget_gallery_id` int NOT NULL,
  `gadget_gallery_name` varchar(50) NOT NULL,
  `gadget_gallery_url` varchar(250) DEFAULT NULL,
  `gadget_gallery_image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gadget_gallery`
--

INSERT INTO `gadget_gallery` (`gadget_gallery_id`, `gadget_gallery_name`, `gadget_gallery_url`, `gadget_gallery_image`, `created_at`) VALUES
(3, 'gallery1', 'https://addmagpro.com/products_grid_view/80', 'assets/gadget_gallery_images/665f6b936e64d.1.png', '2024-08-12 07:25:04'),
(4, 'gallery2', 'https://addmagpro.com/products_grid_view/75', 'assets/gadget_gallery_images/665f6ba0d6b90.2.png', '2024-08-12 07:24:34'),
(5, 'gallery3', 'https://addmagpro.com/products_grid_view/72', 'assets/gadget_gallery_images/665f6baf82c16.3.png', '2024-08-12 07:24:10'),
(6, 'gallery4', 'https://addmagpro.com/products_grid_view/74', 'assets/gadget_gallery_images/665f6bc0e2db1.4.png', '2024-08-12 07:25:30'),
(7, 'gallery5', 'https://addmagpro.com/products_grid_view/79', 'assets/gadget_gallery_images/665f6bcda430a.5.png', '2024-08-12 07:25:50'),
(8, 'gallery6', 'https://addmagpro.com/products_grid_view/78', 'assets/gadget_gallery_images/665f6c00ef406.6.png', '2024-08-12 07:26:12'),
(9, 'gallery7', 'https://addmagpro.com/products_grid_view/81', 'assets/gadget_gallery_images/665f6c0d3b245.7.png', '2024-08-12 07:33:28'),
(10, 'gallery8', 'https://addmagpro.com/products_grid_view/39', 'assets/gadget_gallery_images/665f6c1785dd7.8.png', '2024-08-12 07:31:35'),
(11, 'gallery9', 'https://addmagpro.com/products_grid_view/42', 'assets/gadget_gallery_images/665f6c24dc512.9.png', '2024-08-12 07:30:05'),
(12, 'gallery10', 'https://addmagpro.com/products_grid_view/73', 'assets/gadget_gallery_images/665f6c3e3ffba.10.png', '2024-08-12 07:33:51'),
(13, 'gallerymini1', 'https://addmagpro.com/products_grid_view/53', 'assets/gadget_gallery_images/665f5da18db9a.6.png', '2024-08-12 07:35:02'),
(14, 'gallerymini2', 'https://addmagpro.com/products_grid_view/72', 'assets/gadget_gallery_images/665f5db187a7b.7.png', '2024-08-12 07:34:42'),
(15, 'gallerymini3', 'https://addmagpro.com/products_grid_view/61', 'assets/gadget_gallery_images/665f5dbe0187c.9.png', '2024-08-12 07:34:19'),
(16, 'gallerymini4', 'https://addmagpro.com/products_grid_view/42', 'assets/gadget_gallery_images/665f5dc94a702.8.png', '2024-08-12 07:30:22');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int NOT NULL,
  `gallery_name` varchar(50) NOT NULL,
  `gallery_url` varchar(250) DEFAULT NULL,
  `gallery_image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`gallery_id`, `gallery_name`, `gallery_url`, `gallery_image`, `created_at`) VALUES
(2, 'gallery1', NULL, 'assets/galley_images/66421372d2d2a.haier.png', '2024-05-13 13:19:46'),
(3, 'gallery2', NULL, 'assets/galley_images/6670641f1807c.3pd.webp', '2024-06-17 16:28:15'),
(4, 'gallery3', NULL, 'assets/galley_images/664213960a6db.asus_laptop.jpeg', '2024-05-13 13:20:22'),
(5, 'gallery4', NULL, 'assets/galley_images/667062d656932.IPHONE-15.jpeg', '2024-06-17 16:22:46'),
(6, 'gallery5', NULL, 'assets/galley_images/66706431b058e.Octave3-Black.webp', '2024-06-17 16:28:33'),
(7, 'gallery6', NULL, 'assets/galley_images/664213d3317fd.iqoo_z7.jpeg', '2024-05-13 13:21:23'),
(8, 'gallery7', NULL, 'assets/galley_images/664213e65111e.mi_lite_11.jpeg', '2024-05-13 13:22:07'),
(9, 'gallery8', NULL, 'assets/galley_images/6670643d198c4.PlaySpeaker-Black.webp', '2024-06-17 16:28:45'),
(10, 'gallery9', NULL, 'assets/galley_images/66421429cf8b4.samsung_galaxy_s21.jpeg', '2024-05-13 13:22:49'),
(11, 'gallery10', NULL, 'assets/galley_images/66421444953a3.samsung_brand.png', '2024-05-13 13:23:16');

-- --------------------------------------------------------

--
-- Table structure for table `home_page_headings`
--

CREATE TABLE `home_page_headings` (
  `id` int NOT NULL,
  `home_page_name` varchar(50) NOT NULL,
  `heading` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `home_page_headings`
--

INSERT INTO `home_page_headings` (`id`, `home_page_name`, `heading`, `created_at`) VALUES
(4, 'HeadingName1', 'Offer Products', '2024-06-27 14:23:20'),
(5, 'HeadingName2', 'Popular Vendors', '2024-05-31 11:49:32'),
(6, 'HeadingName3', 'Popular Discounts', '2024-05-31 11:49:48'),
(7, 'HeadingName4', 'Latest Products', '2024-05-31 11:50:10'),
(8, 'HeadingName5', 'Top Categories', '2024-05-31 11:50:29'),
(9, 'HeadingName6', 'ADD MAG LUXURY', '2024-06-04 17:43:06'),
(10, 'HeadingName7', 'Our Speciality Stores', '2024-05-31 11:51:03'),
(11, 'HeadingName8', 'Gadget Gallery', '2024-06-04 17:42:11'),
(12, 'HeadingName9', 'Events', '2024-06-07 14:48:30');

-- --------------------------------------------------------

--
-- Table structure for table `kycverification`
--

CREATE TABLE `kycverification` (
  `userid` int NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `kyc_status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `approved_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kycverification`
--

INSERT INTO `kycverification` (`userid`, `full_name`, `kyc_status`, `approved_date`) VALUES
(1, 'Suresh', 'Pending', '2024-04-02 08:20:03'),
(2, 'Santosh', 'Approved', '2019-04-04 11:50:17'),
(3, 'gireesh', 'Rejected', '2024-04-02 08:20:17'),
(4, 'Kareem', 'Pending', '2024-04-02 08:20:56'),
(5, 'Phani', 'Approved', '2024-04-02 08:20:56'),
(6, 'Vamsi', 'Rejected', '2017-04-13 11:51:33'),
(7, 'Bunny', 'Approved', '2024-04-02 08:21:33');

-- --------------------------------------------------------

--
-- Table structure for table `orders_list`
--

CREATE TABLE `orders_list` (
  `order_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `product_id` int NOT NULL,
  `amount` int NOT NULL,
  `order_date` datetime NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pin_system`
--

CREATE TABLE `pin_system` (
  `pin_system_id` int NOT NULL,
  `user_id` int NOT NULL,
  `total_pins` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pin_system`
--

INSERT INTO `pin_system` (`pin_system_id`, `user_id`, `total_pins`, `created_at`) VALUES
(4, 659, 4200, '2024-08-13 05:40:05'),
(5, 148, 0, '2026-03-13 10:19:16'),
(6, 836, 50400, '2025-01-07 12:06:27'),
(7, 150, 5251, '2025-09-02 14:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `pool_commision_wallet`
--

CREATE TABLE `pool_commision_wallet` (
  `wallet_id` int NOT NULL,
  `user_id` int NOT NULL,
  `balance` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pool_commision_wallet`
--

INSERT INTO `pool_commision_wallet` (`wallet_id`, `user_id`, `balance`, `created_at`) VALUES
(1, 148, 176, '2026-03-26 04:26:18'),
(2, 149, 365, '2026-03-26 04:26:18'),
(3, 150, 364, '2026-03-26 04:26:18'),
(4, 151, 524, '2026-03-26 04:26:18'),
(5, 152, 524, '2026-03-26 04:26:18'),
(6, 153, 524, '2026-03-26 04:26:18'),
(7, 207, 298, '2026-03-26 04:26:18'),
(8, 340, 298, '2026-03-26 04:26:18'),
(9, 809, 235, '2026-03-26 04:26:18'),
(10, 754, 222, '2026-03-26 04:26:18'),
(11, 755, 222, '2026-03-26 04:26:18'),
(12, 813, 222, '2026-03-26 04:26:18');

-- --------------------------------------------------------

--
-- Table structure for table `productsboughtbyusers`
--

CREATE TABLE `productsboughtbyusers` (
  `PurchaseID` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `PurchaseDate` datetime DEFAULT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `ProductPrice` decimal(10,2) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `PaymentStatus` enum('paid','pending','refunded') DEFAULT NULL,
  `ShippingAddress` varchar(255) DEFAULT NULL,
  `ShippingStatus` enum('shipped','pending','delivered') DEFAULT NULL,
  `DiscountApplied` decimal(10,2) DEFAULT NULL,
  `CouponCode` varchar(50) DEFAULT NULL,
  `OrderStatus` enum('processing','completed','cancelled') DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `TrackingNumber` varchar(50) DEFAULT NULL,
  `ReturnStatus` enum('requested','processing','completed','cancelled') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `productsboughtbyusers`
--

INSERT INTO `productsboughtbyusers` (`PurchaseID`, `UserID`, `ProductID`, `PurchaseDate`, `ProductName`, `ProductPrice`, `Quantity`, `TotalPrice`, `PaymentMethod`, `PaymentStatus`, `ShippingAddress`, `ShippingStatus`, `DiscountApplied`, `CouponCode`, `OrderStatus`, `DeliveryDate`, `TrackingNumber`, `ReturnStatus`) VALUES
(1, 10, 1, '2024-04-07 11:52:33', 'Samsung S23', 45000.00, 1, 46000.00, 'UPI', 'paid', 'mumbai', 'pending', 100.00, '100', 'processing', '2024-04-12', '547810658', 'processing'),
(2, 11, 2, '2024-04-07 11:52:33', 'Lg Fridge', 25000.00, 1, 26000.00, 'COD', 'refunded', 'mumbai', 'shipped', 100.00, '100', 'completed', '2024-04-12', '547810658', 'cancelled'),
(3, 10, 1, '2024-04-07 11:52:33', 'Samsung S23', 45000.00, 1, 46000.00, 'UPI', 'pending', 'mumbai', 'delivered', 100.00, '100', 'processing', '2024-04-12', '547810658', 'completed'),
(4, 10, 1, '2024-04-07 11:52:33', 'Samsung S23', 45000.00, 1, 46000.00, 'Card', 'refunded', 'chennai', 'pending', 100.00, '100', 'cancelled', '2024-04-12', '547810658', 'processing'),
(5, 10, 1, '2024-04-07 11:52:33', 'Samsung S23', 45000.00, 1, 46000.00, 'COD', 'pending', 'Delhi', 'shipped', 100.00, '100', 'completed', '2024-04-12', '547810658', 'processing'),
(6, 10, 1, '2024-04-07 11:52:33', 'Samsung S23', 45000.00, 1, 46000.00, 'UPI', 'paid', 'Kolkata', 'delivered', 100.00, '100', 'processing', '2024-04-12', '547810658', 'requested');

-- --------------------------------------------------------

--
-- Table structure for table `products_list`
--

CREATE TABLE `products_list` (
  `product_id` int NOT NULL,
  `product_name` varchar(180) NOT NULL,
  `product_description` text NOT NULL,
  `vendor_id` int NOT NULL,
  `category_id` int NOT NULL,
  `brand_id` int NOT NULL,
  `item_code` varchar(30) NOT NULL,
  `unit_price` int NOT NULL,
  `purchase_price` int NOT NULL,
  `product_images` varchar(255) NOT NULL DEFAULT '''assets/vendor_assets/images/user.png''',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products_list`
--

INSERT INTO `products_list` (`product_id`, `product_name`, `product_description`, `vendor_id`, `category_id`, `brand_id`, `item_code`, `unit_price`, `purchase_price`, `product_images`, `created_at`) VALUES
(48, 'DIACARE', 'DIACARE', 37, 43, 32, '75484', 1999, 1999, 'assets/vendor_assets/product_lists/37/6658081317348.DIABETIC CARE.jpg', '2024-07-18 06:44:55'),
(49, 'JOINT CARE', 'JOINT CARE', 37, 43, 32, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/37/665808f4ce935.JOINT CARE.jpg', '2024-05-30 05:04:52'),
(50, 'JEEVAN UMANG', 'JEEVAN UMANG', 38, 45, 33, '12345', 10000, 10000, 'assets/vendor_assets/product_lists/38/66580b36a61c1.jeevan umang.png', '2024-05-30 05:14:30'),
(53, 'JEEVAN ANAND', 'JEEVAN ANAND', 38, 45, 33, '12345', 10000, 10000, 'assets/vendor_assets/product_lists/38/66585ea0b4f36.jeevan anand.png', '2024-05-30 11:10:24'),
(54, 'CHILDREN POLICY', 'CHILDREN POLICY', 38, 45, 33, '12345', 10000, 10000, 'assets/vendor_assets/product_lists/38/665860263e7b7.children,s policy.png', '2024-05-30 11:16:54'),
(55, 'ENDOWMENT PLUS', 'ENDOWMENT PLUS', 38, 45, 33, '12345', 10000, 10000, 'assets/vendor_assets/product_lists/38/6658608531705.endowment plus.png', '2024-05-30 11:18:29'),
(56, 'MONEY BACK', 'MONEY BACK', 38, 45, 33, '12345', 10000, 10000, 'assets/vendor_assets/product_lists/38/665860d8b74d2.money back policy.png', '2024-05-30 11:19:52'),
(57, 'CARE ADVANTAGE', 'CARE ADVANTAGE', 38, 49, 35, '12345', 20000, 20000, 'assets/vendor_assets/product_lists/38/66587e4a241e2.CARE ADVANTAGE.png', '2024-05-30 13:25:30'),
(58, 'CARE CLASSIC', 'CARE CLASSIC', 38, 49, 35, '12345', 20000, 20000, 'assets/vendor_assets/product_lists/38/66587ec73ad30.CARE CLASSIC.png', '2024-05-30 13:27:35'),
(59, 'DIABETES BMI', 'DIABETES BMI', 38, 49, 35, '12345', 20000, 20000, 'assets/vendor_assets/product_lists/38/66587f07b1083.DIABETES BMI.png', '2024-05-30 13:28:39'),
(60, 'ENHANCE', 'ENHANCE', 38, 49, 35, '12345', 20000, 20000, 'assets/vendor_assets/product_lists/38/66587f54b20f1.ENHANCE.png', '2024-05-30 13:29:56'),
(61, 'CARE FAMILY', 'CARE FAMILY', 38, 49, 35, '12345', 20000, 20000, 'assets/vendor_assets/product_lists/38/66587f9cd09ea.FAMILY.png', '2024-05-30 13:31:08'),
(62, 'GLOBAL', 'GLOBAL', 38, 49, 35, '12345', 20000, 20000, 'assets/vendor_assets/product_lists/38/66587fcb74ed0.GLOBAL.png', '2024-05-30 13:31:55'),
(63, 'JOY', 'JOY', 38, 49, 35, '12345', 20000, 20000, 'assets/vendor_assets/product_lists/38/66587ffbb3330.JOY.png', '2024-05-30 13:32:43'),
(64, 'PERSONAL ACCIDENT', 'PERSONAL ACCIDENT', 38, 49, 35, '12345', 20000, 20000, 'assets/vendor_assets/product_lists/38/665880353b805.PERSONAL ACCIDENT.png', '2024-05-30 13:33:41'),
(65, 'SENIOR', 'SENIOR', 38, 49, 35, '12345', 20000, 20000, 'assets/vendor_assets/product_lists/38/665880618db87.SENIOR.png', '2024-05-30 13:34:25'),
(66, 'STUDENT', 'STUDENT', 38, 49, 35, '12345', 20000, 20000, 'assets/vendor_assets/product_lists/38/665882ce777bf.STUDENT.png', '2024-05-30 13:44:46'),
(67, 'SUPER HERO', 'SUPER HERO', 38, 49, 35, '12345', 20000, 20000, 'assets/vendor_assets/product_lists/38/665883348d70b.SUPER HERO.png', '2024-05-30 13:46:28'),
(68, 'TRAVEL', 'TRAVEL', 38, 49, 35, '12345', 20000, 20000, 'assets/vendor_assets/product_lists/38/6658837ded9c4.TRAVEL.png', '2024-05-30 13:47:42'),
(69, 'NIGELLA', 'NIGELLA', 37, 43, 32, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/37/66588b72a642e.NIGELLA.png', '2024-05-30 14:21:39'),
(70, 'SOLUTION', 'SOLUTION', 37, 43, 32, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/37/66588bad382bf.SOLUTION7.jpg', '2024-05-30 14:22:37'),
(71, 'THUNDER BLASTER', 'THUNDER BLASTER', 37, 43, 32, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/37/66588bdf8184e.THUNDER BLASTER.jpg', '2024-05-30 14:23:27'),
(72, 'WIGHT LOSS', 'WIGHT LOSS', 37, 43, 32, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/37/66588c1cacf84.WIGHT LOSS.jpg', '2024-05-30 14:24:28'),
(73, 'EXTRA', 'EXTRA', 37, 43, 32, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/37/66588c5d77ecf.EXTRA.jpg', '2024-05-30 14:25:33'),
(75, 'GOA', 'GOA', 37, 41, 37, '12345', 15000, 15000, 'assets/vendor_assets/product_lists/37/6658964235206.4.png', '2024-05-30 15:07:46'),
(76, 'LAKSHA DWEEP', 'LAKSHA DWEEP', 37, 41, 37, '12345', 82000, 82000, 'assets/vendor_assets/product_lists/37/66589a0576596.1.png', '2024-05-30 15:23:49'),
(77, 'DUBAI', 'DUBAI', 37, 41, 37, '12345', 90000, 90000, 'assets/vendor_assets/product_lists/37/66589a58c3d6a.2.png', '2025-11-24 12:41:33'),
(78, 'BANKOK THAILAND', 'BANKOK THAILAND', 37, 41, 37, '12345', 66000, 66000, 'assets/vendor_assets/product_lists/37/66589ae66c733.3.png', '2024-05-30 15:27:34'),
(79, 'KEDARNATH', 'KEDARNATH', 37, 41, 37, '12345', 65000, 65000, 'assets/vendor_assets/product_lists/37/66589b3005296.5.png', '2024-07-27 05:32:03'),
(80, 'KASHI', 'KASHI', 37, 41, 37, '12345', 23000, 23000, 'assets/vendor_assets/product_lists/37/66589b64250c5.6.png', '2024-05-30 15:29:40'),
(81, 'SRI LANKA', 'SRI LANKA', 37, 41, 37, '12345', 90000, 90000, 'assets/vendor_assets/product_lists/37/66589bb2ec35f.7.png', '2024-05-30 15:30:58'),
(82, 'AMARNATH YATRA', 'AMARNATH YATRA', 37, 41, 37, '12345', 68000, 68000, 'assets/vendor_assets/product_lists/37/66589bfe6013f.8.png', '2024-07-27 05:32:55'),
(83, 'CHARDHAM YATRA', 'CHARDHAM YATRA', 37, 41, 37, '12345', 90000, 90000, 'assets/vendor_assets/product_lists/37/66589c6ba3a61.9.png', '2024-07-27 05:32:28'),
(84, 'NEPAL MUKTINATH', 'NEPAL MUKTINATH', 37, 41, 37, '12345', 54000, 54000, 'assets/vendor_assets/product_lists/37/66589cbfbe927.10.png', '2024-07-27 05:30:50'),
(125, 'MOBILE ENVIRO CHIP', 'ANTI RADIATION CHIP', 37, 51, 39, '12345', 660, 660, 'assets/vendor_assets/product_lists/37/6661440836f6c.Untitled design (4).png', '2024-06-06 05:07:20'),
(126, 'BOOK NO 1', 'NANNU VIJETHANU CHESINA KONNI NIJAALU', 40, 56, 47, '12345', 100, 100, 'assets/vendor_assets/product_lists/40/66617824b7a47.8.png', '2024-06-06 08:49:40'),
(127, 'BOOK NO 2', 'NANNU VIJETHANU CHESINA KONNI NIJAALU', 40, 56, 47, '12345', 100, 100, 'assets/vendor_assets/product_lists/40/666195b813f13.9.png', '2024-06-06 10:55:52'),
(128, 'BOOK NO 3', 'GATHA SMRUTHULU', 40, 56, 47, '12345', 100, 100, 'assets/vendor_assets/product_lists/40/666195eb3ed21.10.png', '2024-06-06 10:56:43'),
(129, 'BOOK NO 4', 'GONGADI    KAVSANKALANAMITHA', 40, 56, 47, '12345', 100, 100, 'assets/vendor_assets/product_lists/40/6661964143af0.7.png', '2024-06-06 10:58:09'),
(130, 'RAYE-1', '500g VITAL FOOD NUTRITION', 41, 57, 48, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/41/6661a66ae2846.RAYE 01.png', '2024-06-06 13:05:56'),
(131, 'RAYE-2', '60 TAB MULTI VITAMIN', 41, 57, 48, '12345', 999, 999, 'assets/vendor_assets/product_lists/41/6661a76255bd0.RAYE 02.png', '2024-06-06 12:20:44'),
(132, 'RAYE-3', '60g ENERGY DRINK MIX', 41, 57, 48, '12345', 999, 999, 'assets/vendor_assets/product_lists/41/6661a97d107d0.RAYE 03.png', '2024-06-06 13:06:18'),
(133, 'RAYE-4', '60TAB POSITIVE LIFE', 41, 57, 48, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/41/6661a9f266e3a.RAYE 04.png', '2024-06-06 12:22:10'),
(134, 'RAYE-5', '200 ml  HAIR OIL', 41, 57, 48, '12345', 639, 639, 'assets/vendor_assets/product_lists/41/6661aa577dab1.RAYE 05.png', '2024-06-06 12:23:53'),
(135, 'RAYE-6', '500g KIDS NUTRITION', 41, 57, 48, '12345', 1212, 1212, 'assets/vendor_assets/product_lists/41/6661aabeec396.RAYE 06.png', '2024-06-06 12:25:35'),
(136, 'RAYE-11', '500 ml ALOE VERA JUICE', 41, 57, 48, '12345', 507, 507, 'assets/vendor_assets/product_lists/41/6661ae4d173c9.RAYE 11.png', '2024-06-06 12:40:45'),
(137, 'RAYE-12', '30Tab TAB SPIRULINA', 41, 57, 48, '12345', 1212, 1212, 'assets/vendor_assets/product_lists/41/6661aea13fbad.RAYE 12.png', '2024-06-06 13:06:49'),
(138, 'RAYE-15', '200 g PROTEIN SUPPORT', 41, 57, 48, '12345', 1212, 1212, 'assets/vendor_assets/product_lists/41/6661af2d17dfa.RAYE 15.png', '2024-06-06 12:44:29'),
(139, 'RAYE-16', '60TAB RAYE CALCIUM', 41, 57, 48, '12345', 1212, 1212, 'assets/vendor_assets/product_lists/41/6661b0f66be1f.RAYE 16.png', '2024-06-06 12:52:06'),
(140, 'RAYE-17', '30TAB CURCUMIN', 41, 57, 48, '12345', 1212, 1212, 'assets/vendor_assets/product_lists/41/6661b146d762b.RAYE 17.png', '2024-06-06 12:53:27'),
(141, 'RAYE-18', '60TAB MORINGA', 41, 57, 48, '12345', 2147, 2147, 'assets/vendor_assets/product_lists/41/6661b18f574b3.RAYE 18.png', '2024-06-06 12:54:39'),
(142, 'RAYE-19', '60TAB OMEGA-3', 41, 57, 48, '12345', 2147, 2147, 'assets/vendor_assets/product_lists/41/6661b1d8e713b.RAYE 19.png', '2024-06-06 12:55:53'),
(143, 'RAYE-20', '150g FIBER', 41, 57, 48, '12345', 999, 999, 'assets/vendor_assets/product_lists/41/6661b233d17c5.RAYE 20.png', '2024-06-06 12:57:23'),
(144, 'ADVANCE', '120 CAP', 37, 43, 32, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/37/666e87c0d80b3.advance.jpeg', '2024-06-16 06:35:44'),
(148, 'SHAKTI SAMRAT', 'COMBO PACK', 37, 43, 32, '12345', 4500, 4500, 'assets/vendor_assets/product_lists/37/6672d1510d60c.shakti samrat.jpeg', '2024-06-19 12:38:41'),
(149, 'ALIEN EMPIRE HOODIE', 'Size\r\nS M L XL', 37, 53, 51, '7777', 2499, 1999, 'assets/vendor_assets/product_lists/37/6673ba5d873a1.alian .png', '2024-06-20 05:40:31'),
(150, 'WHITEOversized T-Shirt', 'Size\r\nS M L XL', 37, 53, 51, '7777', 799, 599, 'assets/vendor_assets/product_lists/37/6673be87b2353.x4.webp', '2024-06-20 05:30:47'),
(151, 'Vibe Oversized T-Shirt', 'Size\r\nS M L XL\r\n\r\nColor\r\nRED, BLUE', 37, 53, 51, '7777', 1499, 999, 'assets/vendor_assets/product_lists/37/6673bf01ab898.vibe12.webp', '2024-06-20 05:32:50'),
(152, 'ALIEN HOODIE', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 2499, 1999, 'assets/vendor_assets/product_lists/37/6673c22bde341.Untitled-3.webp', '2024-06-20 05:46:19'),
(153, 'Area 51 Oversized T-Shirt', 'Size\r\nS M L XL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673c28be35d6.7.webp', '2024-06-20 05:47:55'),
(154, 'Alien meditating Oversized T-Shirt', 'Size\r\nS M L XL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673c2e9a4c02.a14.webp', '2024-06-20 05:49:29'),
(155, 'Artist Oversized T-Shirt', 'Size\r\nSmall Medium Large XL XXL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673c349a7113.28.webp', '2024-06-20 05:51:05'),
(156, 'ASTRO BONG HOODIE', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 2499, 1999, 'assets/vendor_assets/product_lists/37/6673c75470311.2_cf144fcf-841d-4f5b-94f9-c9895089effd.webp', '2024-06-20 06:08:20'),
(157, 'Astrobong Oversized T-Shirt', 'Size\r\nS M L XL xxl', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673c7a9805ee.4.webp', '2024-06-20 06:09:45'),
(158, 'BLACK Oversized T-Shirt', 'Size\r\nS M L XL', 37, 53, 51, '7777', 1299, 899, 'assets/vendor_assets/product_lists/37/6673c84d865df.x1.webp', '2024-06-20 06:12:29'),
(159, 'Change Your Thoughts Oversized T-Shirt', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673c8f0b57d4.30.webp', '2024-06-20 06:15:12'),
(160, 'Compassion Oversized T-Shirt', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673c941a0ec9.2_d0197b3d-5bc9-41f4-9cf4-51f8504bfb5e.webp', '2024-06-20 06:16:33'),
(161, 'CONQUER YOUNG HOODIE', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 2499, 1999, 'assets/vendor_assets/product_lists/37/6673c989a1b24.red1.webp', '2024-06-20 06:17:45'),
(162, 'Cosmos Oversized T-Shirt', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673ca1276373.1_dc9f7b2a-b81b-434a-93ad-a80afc388cf8.webp', '2024-06-20 06:20:02'),
(163, 'Desi Swag Oversized T-Shirt', 'Size\r\nSmall Medium Large XL XXL\r\n\r\nColor\r\nWHITE RED', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673ca8237101.ledy.webp', '2024-06-20 06:21:54'),
(164, 'Dragon Oversized T-Shirt', 'Size\r\nS M L XL XXL\r\nColor\r\nBLACK WHITE', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673cd8579be6.2.webp', '2024-06-20 06:34:45'),
(165, 'Dreaming Oversized T-Shirt', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673ce2753a9e.3_1dee5857-a7da-4e09-8eef-b5773e738d10.webp', '2024-06-20 06:37:27'),
(166, 'Explore space Oversized T-Shirt', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673ce79af35a.2_96a7f6d2-e6bf-4b85-b200-90cd0bd63ca6.webp', '2024-06-20 06:38:49'),
(167, 'Fcuking Young Oversized T-Shirt', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673cef0d331a.1_e0f2c042-4399-49b8-b1ee-293a7d9b6396.webp', '2024-06-20 06:40:48'),
(168, 'FINE SHIT HOODIE', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 1799, 'assets/vendor_assets/product_lists/37/6673cf4425b57.q1.webp', '2024-06-20 06:42:12'),
(169, 'Fine shit Oversized T-Shirt', 'Size\r\nS M L XL\r\n\r\nColor\r\nwhite blue neon green', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673cff45c47a.21_06fe8274-b424-451d-97cc-21ccc2e1024e.webp', '2024-06-20 06:45:08'),
(170, 'I need my space Oversized T-Shirt', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673d04385461.1_bf046a64-c4aa-4a04-a622-55dd7fecdeb8.webp', '2024-06-20 06:46:27'),
(171, 'Magic Mushroom Oversized T-Shirt', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673d09a62d3b.1_e5168ea3-5847-4703-8e9c-51df0770d0ee.webp', '2024-06-20 06:47:54'),
(172, 'MANDALA HOODIE', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 1799, 'assets/vendor_assets/product_lists/37/6673db77083b2.1_c508cbb8-fefb-4c8f-b1d0-99a1ce3073fb.webp', '2024-06-20 07:34:15'),
(173, 'Mandala Oversized T-Shirt', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673de613ed44.2_3589d512-eae8-4a47-a492-6999f234e0c9.webp', '2024-06-20 07:46:41'),
(174, 'Matrix Oversized T-Shirt', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673debfb57c2.1_759641e5-6731-438b-b03c-876e03714b1c.webp', '2024-06-20 07:48:15'),
(175, 'MERCY HOODIE RED', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 1499, 'assets/vendor_assets/product_lists/37/6673df14489cc.mercy1.webp', '2024-06-20 07:49:40'),
(176, 'Mercy Trumps Oversized T-Shirt', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 1299, 'assets/vendor_assets/product_lists/37/6673df69ea0d6.1_61f28c4b-e346-4d82-a528-7aa79f318d28.webp', '2024-06-20 07:51:05'),
(177, 'METAL LEGACY HOODIE', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 1499, 'assets/vendor_assets/product_lists/37/6673dffc45af2.1_fea9fc82-413b-428e-a576-39d2b2448448.webp', '2024-06-20 07:53:32'),
(178, 'Money talk Oversized T-Shirt', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1499, 999, 'assets/vendor_assets/product_lists/37/6673e06f47f8f.1_2851091a-1534-489f-8572-33811a044a5c.webp', '2024-06-20 07:55:27'),
(179, 'Moon Oversized T-Shirt', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 1299, 'assets/vendor_assets/product_lists/37/6673e0d488223.5_e58ad411-c5bf-491f-8a1e-5b50d5cbd5e8.webp', '2024-06-20 07:57:08'),
(180, 'MUSHROOM HOODIE', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 1499, 'assets/vendor_assets/product_lists/37/6673e14d3ec8d.mushc.webp', '2024-06-20 07:59:09'),
(181, 'Octopus Ride Oversized T-Shirt', 'Size\r\nS M L XL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673e1a2f0d95.3_868939ab-39d3-4f65-8c43-9268440fa484.webp', '2024-06-20 08:00:34'),
(182, 'Punkman Oversized T-Shirt', 'Size\r\nS M L XL', 37, 53, 51, '7777', 1999, 1299, 'assets/vendor_assets/product_lists/37/6673e28258def.1_8969ff9f-a638-4975-89a6-d04fcb10bd93.webp', '2024-06-20 08:04:18'),
(183, 'Roses & skull Oversized T-Shirt', 'Size\r\nS M L XL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673e2d46082f.1_eb2d9f25-9b10-40dd-a30e-dcfb27a084c2.webp', '2024-06-20 08:05:40'),
(184, 'snakes & stones Oversized T-Shirt', 'Size\r\nS M L XL', 37, 53, 51, '7777', 1999, 1299, 'assets/vendor_assets/product_lists/37/6673e31bece0a.1_6dc11337-6d79-4070-a517-1a7ceb32df3d.webp', '2024-06-20 08:06:51'),
(185, 'SOCIAL SHIT SWEATSHIRT', 'Size\r\nS M L XL XXL', 37, 53, 51, '7777', 1999, 1299, 'assets/vendor_assets/product_lists/37/6673e3752b9e4.1_cbb584cf-603b-4ca0-8bef-2a95b6349e48.webp', '2024-06-20 08:08:21'),
(186, 'Spiral Waves Oversized T-Shirt', 'Size\r\nS M L XL', 37, 53, 51, '7777', 1999, 999, 'assets/vendor_assets/product_lists/37/6673e3de63ab1.20.webp', '2024-06-20 08:10:06'),
(187, 'Venom Oversized T-Shirt', 'Size\r\nS M L XL\r\n\r\nColor\r\nblue red', 37, 53, 51, '7777', 1999, 1499, 'assets/vendor_assets/product_lists/37/6673e441cbad2.venom2.webp', '2024-06-20 08:11:45'),
(189, 'SAREE', 'GL-01', 42, 63, 53, '12345', 900, 900, 'assets/vendor_assets/product_lists/42/667a61d34ae78.26.jpg', '2024-06-25 06:21:07'),
(190, 'SAREE', 'SLC-229', 42, 63, 53, '12345', 900, 900, 'assets/vendor_assets/product_lists/42/667a6240c2d41.24.jpg', '2024-06-25 06:22:56'),
(191, 'SAREE', 'SLC-114-A', 42, 63, 53, '12345', 900, 900, 'assets/vendor_assets/product_lists/42/667a628057d7a.25.jpg', '2024-06-25 06:24:00'),
(192, 'SAREE', 'SLC-236-A', 42, 63, 53, '12345', 900, 900, 'assets/vendor_assets/product_lists/42/667a62c2bbeb0.27.jpg', '2024-06-25 06:25:06'),
(193, 'SAREE', 'SLC-332', 42, 63, 53, '12345', 900, 900, 'assets/vendor_assets/product_lists/42/667a630fad549.28.jpg', '2024-06-25 06:26:23'),
(194, 'SAREE', '1', 42, 63, 53, '12345', 900, 900, 'assets/vendor_assets/product_lists/42/667ac052a8a02.29.jpg', '2024-06-25 13:04:18'),
(195, 'SAREE', '2', 42, 63, 53, '12345', 900, 900, 'assets/vendor_assets/product_lists/42/667ac093e2319.30.jpg', '2024-06-25 13:05:23'),
(196, 'SAREE', '3', 42, 63, 53, '12345', 900, 900, 'assets/vendor_assets/product_lists/42/667ac0c976566.31.jpg', '2024-06-25 13:06:17'),
(197, 'SAREE', '4', 42, 63, 53, '12345', 900, 900, 'assets/vendor_assets/product_lists/42/667ac0f547e33.32.jpg', '2024-06-25 13:07:01'),
(198, 'SAREE', '5', 42, 63, 53, '12345', 900, 900, 'assets/vendor_assets/product_lists/42/667ac11addacd.33.jpg', '2024-06-25 13:07:39'),
(199, 'SAREE', '6', 42, 63, 53, '12345', 900, 900, 'assets/vendor_assets/product_lists/42/667ac773d289f.10.jpg', '2024-06-25 13:34:43'),
(200, 'SAREE', '7', 42, 63, 53, '12345', 900, 900, 'assets/vendor_assets/product_lists/42/667ac7b462790.13.jpg', '2024-06-25 13:35:48'),
(201, 'SAREE', '8', 42, 63, 53, '12345', 900, 900, 'assets/vendor_assets/product_lists/42/667ac81590c7c.2.jpg', '2024-06-25 13:37:25'),
(202, 'SAREE', 'SLC-75', 42, 63, 53, '12345', 900, 900, 'assets/vendor_assets/product_lists/42/667ac8776a388.16.jpg', '2024-06-25 13:39:31'),
(203, 'HEALTH CARD', '2 MEMBERS', 45, 65, 57, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/45/667bf579e5344.4.png', '2024-06-26 11:03:21'),
(204, 'HEALTH CARD', '4 MEMBERS', 45, 65, 57, '12345', 1850, 1850, 'assets/vendor_assets/product_lists/45/667bf5a84616f.5.png', '2024-06-26 11:04:08'),
(205, 'HEALTH CARD', '6 MEMBERS', 45, 65, 57, '12345', 2250, 2250, 'assets/vendor_assets/product_lists/45/667bf5d142181.3.png', '2024-06-26 11:04:49'),
(206, 'MEMBERSHIP', '5 Years', 43, 64, 56, '999', 125000, 40000, 'assets/vendor_assets/product_lists/43/667d3f20178e8.1.png', '2024-06-27 10:29:52'),
(207, 'MEMBERSHIP', '10 YEARS', 43, 64, 56, '999', 250000, 60000, 'assets/vendor_assets/product_lists/43/668eb5ee5a55c.2.png', '2024-07-10 16:25:18'),
(208, 'Venice Faux Suede Recliner Chair In Light Brown Colour', 'Color: Dark Brown', 37, 54, 58, '9', 30400, 9999, 'assets/vendor_assets/product_lists/37/667e8a4c72ca8.vn20190010-2-1_500x.webp', '2024-06-28 10:02:52'),
(209, 'Sora Fabric Rocker Manual Blue Recliner', 'Color: Grey', 37, 54, 58, '9', 32000, 11999, 'assets/vendor_assets/product_lists/37/667e8c9c56aff.2_18d44b3a-5c98-47c5-b32d-fd1c2f2ba543_600x (1).webp', '2024-06-28 10:12:44'),
(210, 'Hikari Push Back Grey Recliner', 'Every household has a designated remote control holder.', 37, 54, 58, 'fur9', 18999, 9999, 'assets/vendor_assets/product_lists/37/667eb0a68470e.Greyrecliner_600x.webp', '2024-06-28 12:46:30'),
(211, 'TOUR', 'KEDARNATH YATRA', 44, 66, 59, '12345', 65000, 65000, 'assets/vendor_assets/product_lists/44/667eef47869f2.5.png', '2024-07-25 04:41:37'),
(212, 'TOUR', 'LAKSHDWEEP', 44, 66, 59, '12345', 82000, 82000, 'assets/vendor_assets/product_lists/44/667eec5b2c132.1.png', '2024-06-28 17:01:15'),
(213, 'TOUR', 'DUBAI', 44, 66, 59, '12345', 105000, 105000, 'assets/vendor_assets/product_lists/44/667eec837d856.2.png', '2024-06-28 17:01:55'),
(214, 'TOUR', 'BANKOK THAILAND', 44, 66, 59, '12345', 66000, 66000, 'assets/vendor_assets/product_lists/44/667eecbed55dc.3.png', '2024-06-28 17:02:54'),
(215, 'TOUR', 'GOA', 44, 66, 59, '12345', 15000, 15000, 'assets/vendor_assets/product_lists/44/667eef6aa6671.4.png', '2024-06-28 17:14:18'),
(216, 'TOUR', 'KASHI', 44, 66, 59, '12345', 23000, 23000, 'assets/vendor_assets/product_lists/44/667eed16b6894.6.png', '2024-06-28 17:04:22'),
(217, 'TOUR', 'SRI LANKA', 44, 66, 59, '12345', 90000, 90000, 'assets/vendor_assets/product_lists/44/667eed40b0636.7.png', '2024-06-28 17:05:04'),
(218, 'TOUR', 'AMARNATH YATRA', 44, 66, 59, '12345', 68000, 68000, 'assets/vendor_assets/product_lists/44/667eed70a2c47.8.png', '2024-07-25 04:40:51'),
(219, 'TOUR', 'CHARDHAM YATRA', 44, 66, 59, '12345', 90000, 90000, 'assets/vendor_assets/product_lists/44/667eed9d9eae5.9.png', '2024-07-25 04:40:28'),
(220, 'TOUR', 'NEPAL MUKTINATH', 44, 66, 59, '12345', 54000, 54000, 'assets/vendor_assets/product_lists/44/667eedceb989e.10.png', '2024-07-25 04:40:11'),
(221, 'Metro Manual Push Back Recliner With Cup Holder', 'Dimensions	H 41 x W 35x D 30; Seating Height - 20 (All dimension in inches)\r\nAssembly	Carpenter Assembly\r\nSecondary Material	Metal\r\nPrimary Material	Fabric', 37, 54, 58, 'fur9', 24998, 19899, 'assets/vendor_assets/product_lists/37/667f9271e9d1c.mlm-111015-1_600x.webp', '2024-06-29 04:49:53'),
(222, 'Sakura Upholstered Manual Push Grey Recliner', 'Bring plush, classic style to your living room or nursery with this reclining armchair. Crafted with a solid and engineered wood frame, it features a traditional silhouette with pillow-top arms and a channel-tufted back.', 37, 54, 58, 'fur9', 28800, 10999, 'assets/vendor_assets/product_lists/37/667f931571502.1_600x.webp', '2024-06-29 04:52:37'),
(223, 'Bantia Stratus Manual Recline Mechanism With Clip', 'Manual Recline Mechanism With Clip', 37, 54, 58, 'fur9', 19999, 14999, 'assets/vendor_assets/product_lists/37/667f939925b7a.111433-silo--3_600x.webp', '2024-06-29 04:54:49'),
(224, 'Sakura Upholstered Manual Push Beige Recliner', 'Bring plush, classic style to your living room or nursery with this reclining armchair.', 37, 54, 58, 'fur9', 28800, 10999, 'assets/vendor_assets/product_lists/37/667f94259598c.1_1_600x.webp', '2024-06-29 04:57:09'),
(225, 'Heated Recliner Massage Chair', 'Massage Chair', 37, 54, 58, 'fur9', 45999, 39999, 'assets/vendor_assets/product_lists/37/667f94d4d5ef1.7_9223b361-11cf-4d6d-9635-dc292bdb8f45_600x.webp', '2024-06-29 05:00:04'),
(226, 'Classy 1 seater Manual Recliner with cupholders in Brown Colour', 'Brown Colour', 37, 54, 58, 'fur9', 24998, 19899, 'assets/vendor_assets/product_lists/37/667f97b530613.fn1897907-s-pm31462_7_600x.webp', '2024-06-29 05:12:21'),
(227, 'Sofi Print Fabric with Bronze Nail head Trim Push Back Recliner', 'multi color', 37, 54, 58, 'fur9', 18999, 13667, 'assets/vendor_assets/product_lists/37/667f983927d65.1_024ed404-370f-479f-8fbd-04bf251636ec_600x.webp', '2024-06-29 05:14:33'),
(228, 'Commander 1 Seater Recliner Sofa', 'Art Leather', 37, 54, 58, 'fur9', 69998, 34999, 'assets/vendor_assets/product_lists/37/667f995f867a9.bantiacommander4_600x.webp', '2024-06-29 05:19:27'),
(229, 'Candy 1 Seater Recliner', 'H 38 x W 33x D 20; Seating Height -17 (All dimension in inches)', 37, 54, 58, 'fur9', 53998, 26999, 'assets/vendor_assets/product_lists/37/667f99f344242.candy-image-1_600x.webp', '2024-06-29 05:21:55'),
(230, 'Bunny 1 Seater Recliner', 'Recliner', 37, 54, 58, 'fur9', 119998, 21999, 'assets/vendor_assets/product_lists/37/667fb365cb88f.bunny-image-3_600x.webp', '2024-06-29 07:10:29'),
(231, 'Pisa Solid Wood 3 Seater Micro Fibre Leather Sofa in Dark Brown Colour', '3 Seater Micro Fibre Leather Sofa', 37, 54, 60, 'fur9', 22999, 11999, 'assets/vendor_assets/product_lists/37/667fb57204dc2.bsbrw03seater1new_600x.webp', '2024-06-29 07:19:14'),
(233, 'E ZYKLE', 'COSMO', 46, 67, 61, '12345', 56000, 56000, 'assets/vendor_assets/product_lists/46/667fe8dec5089.1.png', '2024-06-29 10:58:38'),
(234, 'E ZYKLE', 'RAZE', 46, 67, 61, '12345', 53400, 53400, 'assets/vendor_assets/product_lists/46/667fe930cd1e7.2.png', '2024-06-29 11:00:00'),
(235, 'E ZYKLE', 'RAZE PRO', 46, 67, 61, '12345', 52800, 52800, 'assets/vendor_assets/product_lists/46/667fe9b8adf33.3.png', '2024-06-29 11:02:16'),
(236, 'E ZYKLE', 'LIDO', 46, 67, 61, '12345', 53400, 53400, 'assets/vendor_assets/product_lists/46/667fe9e1550e5.4.png', '2024-06-29 11:02:57'),
(237, 'E ZYKLE', 'LARC', 46, 67, 61, '12345', 48000, 48000, 'assets/vendor_assets/product_lists/46/667fea229a7ae.5.png', '2024-06-29 11:04:03'),
(238, 'E ZYKLE', 'LARC LITE', 46, 67, 61, '12345', 40000, 40000, 'assets/vendor_assets/product_lists/46/667fea5802613.6.png', '2024-06-29 11:04:56'),
(239, 'E ZYKLE', 'ELIX', 46, 67, 61, '12345', 38800, 38800, 'assets/vendor_assets/product_lists/46/667fea999ff2c.7.png', '2024-06-29 11:06:01'),
(240, 'E ZYKLE', 'EZEN', 46, 67, 61, '12345', 34600, 34600, 'assets/vendor_assets/product_lists/46/667feac87b51a.8.png', '2024-06-29 11:06:48'),
(241, 'E ZYKLE', 'ROOK', 46, 67, 61, '12345', 67000, 67000, 'assets/vendor_assets/product_lists/46/667feaf6ccdc2.9.png', '2024-06-29 11:07:34'),
(242, 'BENEFITS', 'SHAKTI SAMRAT', 48, 68, 66, '12345', 4500, 4500, 'assets/vendor_assets/product_lists/48/668d505043571.shakti samrat.jpeg', '2024-07-09 14:59:28'),
(243, 'BENEFITS', 'DIACARE', 48, 68, 66, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/48/668d508038a15.DIABETIC CARE.jpg', '2024-07-09 15:00:16'),
(244, 'BENEFITS', 'JOINT CARE', 48, 68, 66, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/48/668d50a208e28.JOINT CARE.jpg', '2024-07-09 15:00:50'),
(245, 'BENEFITS', 'NIGELLA', 48, 68, 66, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/48/668d50c545c0a.NIGELLA.png', '2024-07-09 15:01:25'),
(246, 'BENEFITS', 'SOLUTION', 48, 68, 66, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/48/668d50eb83f86.SOLUTION7.jpg', '2024-07-09 15:02:03'),
(247, 'BENEFITS', 'THUNDER BLASTER', 48, 68, 66, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/48/668d511173c9d.THUNDER BLASTER.jpg', '2024-07-09 15:02:41'),
(248, 'BENEFITS', 'WEIGHT LOSS', 48, 68, 66, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/48/668d514238ed9.WIGHT LOSS.jpg', '2024-07-09 15:03:30'),
(249, 'BENEFITS', 'BENEFITS PLUS', 48, 68, 66, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/48/668d516eb72f4.EXTRA.jpg', '2024-07-09 15:04:14'),
(250, 'BENEFITS', 'ADVANCE', 48, 68, 66, '12345', 1999, 1999, 'assets/vendor_assets/product_lists/48/668d519a99773.advance.jpeg', '2024-07-09 15:04:58'),
(251, 'BENEFITS', 'AARLAC HB-BEST', 48, 68, 66, '12345', 240, 240, 'assets/vendor_assets/product_lists/48/668d524c1779d.HB BEST.jpg', '2024-07-09 15:07:56'),
(252, 'BENEFITS', 'AARLAC JC-BEST', 48, 68, 66, '12345', 1180, 1180, 'assets/vendor_assets/product_lists/48/668d527c73a12.JC BEST.jpg', '2024-07-09 15:08:44'),
(253, 'EPIC 2.O', 'TIRANGA EPIC 2.O', 49, 69, 67, '12345', 83400, 83400, 'assets/vendor_assets/product_lists/49/6697889722662.Epic .png', '2024-07-17 09:02:15'),
(254, 'MAC', 'MAC IMPACT', 49, 69, 68, '12345', 100000, 100000, 'assets/vendor_assets/product_lists/49/66978964e2db8.mac impact.webp', '2024-07-17 09:05:40'),
(255, 'MAC', 'MAC SPARC', 49, 69, 68, '12345', 91800, 91800, 'assets/vendor_assets/product_lists/49/66978999b0e61.mac-spark-r-pic-1.jpg', '2024-07-17 09:06:33'),
(256, 'EPIC 2.O', 'EPIC 2.O', 49, 69, 67, '12345', 83400, 83400, 'assets/vendor_assets/product_lists/49/66978a05a0276.Epic 2.0.png', '2024-07-17 09:08:21'),
(257, 'CALENDER', 'DISPLAY AD 13\'X10.cm, free calenders 100', 37, 44, 69, '12345', 25000, 25000, 'assets/vendor_assets/product_lists/37/6697a968859a7.3.png', '2026-04-06 09:57:08'),
(258, 'CALENDER', 'DISPLAY AD 13\'X5\'cm,  free calenders 50', 37, 44, 69, '12345', 12000, 12000, 'assets/vendor_assets/product_lists/37/6697a9d0568fa.1.png', '2024-07-17 11:36:09'),
(259, 'CALENDER', 'STRP AD 26\'X5  cm , 100 free calendrs', 37, 44, 69, '12345', 20000, 20000, 'assets/vendor_assets/product_lists/37/6697aa88b47e6.2.png', '2024-07-17 11:27:05'),
(260, 'CALENDER', 'SIDE AD 5\'X8\' cm,  30 calenders free', 37, 44, 69, '12345', 10000, 10000, 'assets/vendor_assets/product_lists/37/6697ab0aaf5f2.4.png', '2024-07-17 11:29:14'),
(262, 'DAIRY', 'DAIRY HALF PAGE 12\'X9\' cm   free dairy 25', 37, 44, 71, '12345', 15000, 15000, 'assets/vendor_assets/product_lists/37/6697ac46638fc.6.png', '2024-07-19 05:12:54'),
(263, 'APP DISPLAY ADS', 'SIDE BANNER 2240X1260 FOR 1 MONTH', 37, 44, 71, '12345', 10000, 10000, 'assets/vendor_assets/product_lists/37/6697ae5eb41d7.furnitur.jpg', '2024-07-17 11:43:26'),
(264, 'DIA CARE VATI', '80 TAB', 50, 70, 73, '12345', 300, 300, 'assets/vendor_assets/product_lists/50/66b214153b01c.1.png', '2024-08-06 12:16:21'),
(265, 'DIA CARE CHURNA', '175 gm', 50, 70, 73, '12345', 350, 350, 'assets/vendor_assets/product_lists/50/66b2151c88d3e.2.png', '2024-08-06 12:20:44'),
(266, 'SLIM FIT VATI', '80 TAB', 50, 70, 73, '12345', 300, 300, 'assets/vendor_assets/product_lists/50/66b216091d4c5.3.png', '2024-08-06 12:24:41'),
(267, 'SLIM FIT CHURNA', '175 gm', 50, 70, 73, '12345', 350, 350, 'assets/vendor_assets/product_lists/50/66b2167011798.4.png', '2024-08-06 12:26:24'),
(268, 'VATAHAR PAIN OIL', '60 ml', 50, 70, 73, '12345', 199, 199, 'assets/vendor_assets/product_lists/50/66b216f833ed8.5.png', '2024-08-06 12:28:40'),
(269, 'VATAHAR VATI', '60 TAB', 50, 70, 73, '12345', 300, 300, 'assets/vendor_assets/product_lists/50/66b2177926f92.6.png', '2024-08-06 12:30:49'),
(270, 'TRIPHALA', '60 TAB', 50, 70, 73, '12345', 180, 180, 'assets/vendor_assets/product_lists/50/66b217c699562.7.png', '2024-08-06 12:32:06'),
(271, 'URAD SUVARNA VATI', '80 TAB', 50, 70, 73, '12345', 300, 300, 'assets/vendor_assets/product_lists/50/66b218b6102cc.9.png', '2024-08-06 12:36:06'),
(272, 'CHARMARAKSHAK VATI', '80 TAB', 50, 70, 73, '12345', 300, 300, 'assets/vendor_assets/product_lists/50/66b21916643c2.10.png', '2024-08-06 12:37:42'),
(273, 'ARTHORIGHT VATI', '80 TAB', 50, 70, 73, '12345', 300, 300, 'assets/vendor_assets/product_lists/50/66b21957d57cc.11.png', '2024-08-06 12:38:47'),
(274, 'KHASI RAHAT VATI', '80 TAB', 50, 70, 73, '12345', 300, 300, 'assets/vendor_assets/product_lists/50/66b2199f0e6e4.12.png', '2024-08-06 12:39:59'),
(275, 'THYRO NIL KANTA VATI', '80 TAB', 50, 70, 73, '12345', 300, 300, 'assets/vendor_assets/product_lists/50/66b219fe88724.13.png', '2024-08-06 12:41:34'),
(276, 'RAKTASHODINI VATI', '80 TAB', 50, 70, 73, '12345', 300, 300, 'assets/vendor_assets/product_lists/50/66b21a41ecf9b.14.png', '2024-08-06 12:42:41'),
(277, 'GILOY GHANVATI', '60 TAB', 50, 70, 73, '12345', 130, 130, 'assets/vendor_assets/product_lists/50/66b21a8d7527e.15.png', '2024-08-06 12:43:57'),
(278, 'STONE NIL VATI', '80 TAB', 50, 70, 73, '12345', 300, 300, 'assets/vendor_assets/product_lists/50/66b21ad71d13f.16.png', '2024-08-06 12:45:11'),
(279, 'CASTOR OIL', '180 ml', 50, 70, 73, '12345', 190, 190, 'assets/vendor_assets/product_lists/50/66b21be4219e0.18.png', '2024-08-06 12:49:40'),
(280, 'NEEM OIL', '180 ml', 50, 70, 73, '12345', 190, 190, 'assets/vendor_assets/product_lists/50/66b21c1e5afc6.19.png', '2024-08-06 12:50:38'),
(281, 'METHI GOLD SHAMPOO', '300 ml', 50, 70, 73, '12345', 290, 290, 'assets/vendor_assets/product_lists/50/66b21c726ead8.20.png', '2024-08-06 12:52:02'),
(282, 'ONION GOLD SHAMPOO', '300 ml', 50, 70, 73, '12345', 320, 320, 'assets/vendor_assets/product_lists/50/66b21cc871a28.21.png', '2024-08-06 12:53:28'),
(283, 'KESHBAL ANTI-DUNDRUF SHAMPOO', '300 ML', 50, 70, 73, '12345', 300, 300, 'assets/vendor_assets/product_lists/50/66b21d4bdc2af.22.png', '2024-08-06 12:55:39'),
(284, 'KESHBAL ANTI-DANDURF OIL', '180 ml', 50, 70, 73, '12345', 400, 400, 'assets/vendor_assets/product_lists/50/66b21dc31c2f2.23.png', '2024-08-06 12:57:39'),
(285, 'MANDARA TAILAM', '180 ml', 50, 70, 73, '12345', 240, 240, 'assets/vendor_assets/product_lists/50/66b21e891bff0.25.png', '2024-08-06 13:00:57'),
(286, 'BRINGAR TAILAMJ', '180 ml', 50, 70, 73, '12345', 240, 240, 'assets/vendor_assets/product_lists/50/66b21ec3a987c.26.png', '2024-08-06 13:01:55'),
(287, 'YUVA X GOLD', '30 CAP', 50, 70, 73, '12345', 799, 799, 'assets/vendor_assets/product_lists/50/66b21f20d8693.27.png', '2024-08-06 13:03:28'),
(288, 'YUVA X GOLD LING OIL', '30 ml', 50, 70, 73, '12345', 499, 499, 'assets/vendor_assets/product_lists/50/66b2200da3c75.27.png', '2024-08-06 13:07:25'),
(289, 'ASHWAGANDHA', '60 TAB', 50, 70, 73, '12345', 240, 240, 'assets/vendor_assets/product_lists/50/66b2208cbed09.28.png', '2024-08-06 13:09:32'),
(290, 'SUNNIPINDI SOAP', '75 gm', 50, 70, 73, '12345', 50, 50, 'assets/vendor_assets/product_lists/50/66b22127d4ffa.30.png', '2024-08-06 13:12:08'),
(291, 'WHEAT GRASS POWDER', '100 gm', 50, 70, 73, '12345', 320, 320, 'assets/vendor_assets/product_lists/50/66b221ae2db6c.31.png', '2024-08-06 13:14:22'),
(292, 'FAIR GLOW SOAP', '75 gm', 50, 70, 73, '12345', 50, 50, 'assets/vendor_assets/product_lists/50/66b2220302d0c.32.png', '2024-08-06 13:15:47'),
(293, 'KUMKUMADI TAILAM', '60 ml', 50, 70, 73, '12345', 299, 299, 'assets/vendor_assets/product_lists/50/66b2224e40f4f.33.png', '2024-08-06 13:17:02'),
(294, 'BRISAH COOL SOAP', '100 gm', 50, 70, 73, '12345', 60, 60, 'assets/vendor_assets/product_lists/50/66b223b756617.34.png', '2024-08-06 13:23:03'),
(295, 'CHARCOL SOAP', '100 gm', 50, 70, 73, '12345', 60, 60, 'assets/vendor_assets/product_lists/50/66b223f7881a0.35.png', '2024-08-06 13:24:07'),
(296, 'PAPAYA SOAP', '100 gm', 50, 70, 73, '12345', 60, 60, 'assets/vendor_assets/product_lists/50/66b2243140086.36.png', '2024-08-06 13:25:05'),
(297, 'TULASI GHANAVATI', '60 TAB', 50, 70, 73, '12345', 180, 180, 'assets/vendor_assets/product_lists/50/66b22495dd7a5.37.png', '2024-08-06 13:26:45'),
(298, 'VATAHAR PAIN OIL', '30 ml', 50, 70, 73, '12345', 110, 110, 'assets/vendor_assets/product_lists/50/66b225923e3cc.5.png', '2024-08-06 13:30:58'),
(299, 'CASTOR OIL', '100 ml', 50, 70, 73, '12345', 110, 110, 'assets/vendor_assets/product_lists/50/66b226015f661.18.png', '2024-08-06 13:32:49'),
(300, 'NEEM OIL', '100 ml', 50, 70, 73, '12345', 110, 110, 'assets/vendor_assets/product_lists/50/66b2262f74b7f.19.png', '2024-08-06 13:33:35'),
(301, 'METHI GOLD SHAMPOO', '200 ml', 50, 70, 73, '12345', 200, 200, 'assets/vendor_assets/product_lists/50/66b22676ad878.20.png', '2024-08-06 13:34:46'),
(302, 'ONION GOLD SHAMPOO', '180 ml', 50, 70, 73, '12345', 200, 200, 'assets/vendor_assets/product_lists/50/66b226c82841a.21.png', '2024-08-06 13:36:08'),
(303, 'KESHBAL ANTI-DUNDRUF SHAMPOO', '180 ml', 50, 70, 73, '12345', 200, 200, 'assets/vendor_assets/product_lists/50/66b2270cf1241.22.png', '2024-08-06 13:37:16'),
(304, 'ASTAMANGAL VATI', '80 TAB', 50, 70, 73, '12345', 300, 300, 'assets/vendor_assets/product_lists/50/66b22a7aef35e.38.png', '2024-08-06 13:51:54'),
(306, 'MANGO PICKLE', '300 gm', 37, 39, 43, '12345', 83, 83, 'assets/vendor_assets/product_lists/37/66b9dc28d71b1.download.jpg', '2026-01-09 19:58:49'),
(307, 'CUT MANGO PICKLE', '300 gm', 37, 39, 43, '12345', 83, 83, 'assets/vendor_assets/product_lists/37/696b0551223b1.images.jpg', '2026-01-17 03:43:13'),
(308, 'RED CHILLI', '300 gm', 37, 39, 43, '12345', 83, 83, 'assets/vendor_assets/product_lists/37/66b9dd088fa1f.download (3).jpg', '2026-01-09 20:00:29'),
(309, 'LIME', '300 gm', 37, 39, 43, '12345', 83, 83, 'assets/vendor_assets/product_lists/37/66b9dd2c926bf.download (2).jpg', '2026-01-09 19:59:26'),
(316, 'JIMMY CHOO SAREE', 'AVAILABLE Colour Type (5)\r\nAny One', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66b9f8a758a08.Price₹600 JIMMY CHOO SAREE - SVSK0245.jpg', '2024-08-20 14:00:03'),
(319, 'JNVST Online Classes', 'Enroll Last  : Aug31,2024\r\nClass Start : Sep 05,2024\r\nClass End   : Jan15,2025', 55, 83, 80, 'SC-JNVST', 30000, 15000, 'assets/vendor_assets/product_lists/55/66bb11571e3e9.2.jpg', '2024-08-13 09:20:41'),
(320, 'Jawahar Navodaya Vidyalaya Pravesha Pareeksha Darshini-2025', 'Eligible    :  5th Class\r\nMedium  :  TM/EM\r\nFormat    :  Book/Material', 55, 84, 80, 'PB-JNVST', 1000, 500, 'assets/vendor_assets/product_lists/55/66bb1215b7f59.3.jpg', '2024-08-13 09:21:51'),
(321, 'TUSSER SILK SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c1bf39d144a.2.jpg', '2024-08-18 09:30:33'),
(322, 'SILK SAREE', '6.3 LENGTH WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a3628bba5.3.jpg', '2024-08-20 14:08:34'),
(323, 'DOLA SILK SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a3c976d6e.4.jpg', '2024-08-20 14:10:17'),
(324, 'SATIN SILK SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a40f97e6e.5.jpg', '2024-08-20 14:11:27'),
(325, 'DOLA SILK SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a453f138f.6.jpg', '2024-08-20 14:12:35'),
(326, 'DOLA SILK SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a49ed5410.7.jpg', '2024-08-20 14:13:50'),
(327, 'CHIFFON SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a5816364a.10.jpg', '2024-08-20 14:17:37'),
(328, 'MOSS GEORGETTE SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a64150d1c.11.jpg', '2024-08-20 14:20:49'),
(329, 'GREY MEENA COTTON', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a698e8ef5.12.jpg', '2024-08-20 14:22:17'),
(330, 'GREY MEENA COTTON', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a6cfeedfb.13.jpg', '2024-08-20 14:23:11'),
(331, 'MEENA COTTON', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a757eff46.14.jpg', '2024-08-20 14:25:27'),
(332, 'BANARAS PRINT SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a796207a1.15.jpg', '2024-08-20 14:26:30'),
(333, 'CHANDERI SILK', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a7d3b9e3d.16.jpg', '2024-08-20 14:27:31'),
(334, 'BANARAS PRINT SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a873eca97.17.jpg', '2024-08-20 14:30:11'),
(335, 'BHAGALPURI SILK', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a8c72d914.18.jpg', '2024-08-20 14:31:35'),
(336, 'VENKATAGIRI COTTON', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a920bcae5.19.jpg', '2024-08-20 14:33:04'),
(337, 'SEQUENCE SILK', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a9597ea1c.20.jpg', '2024-08-20 14:34:01'),
(338, 'GEORGETTE SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a997d4aa1.21.jpg', '2024-08-20 14:35:03'),
(339, 'CHIFFON SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4a9fcb342c.22.jpg', '2024-08-20 14:36:44'),
(340, 'CHIFFON SAREE SATIN BORDER', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4aa3d5ef0b.23.jpg', '2024-08-20 14:37:49'),
(341, 'DOLA SILK SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4aa733bc68.24.jpg', '2024-08-20 14:38:43'),
(342, 'RAW SILK', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4aab5b9244.25.jpg', '2024-08-20 14:39:49'),
(343, 'KALANKARI SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4aaefcc5eb.26.jpg', '2024-08-20 14:40:47'),
(344, 'ORGANZA SILK', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4ab2ff32cf.27.jpg', '2024-08-20 14:41:52'),
(345, 'RAW SILK', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4ab61deacb.28.jpg', '2024-08-20 14:42:41'),
(346, 'CHIFFON SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4ab9e43d37.29.jpg', '2024-08-20 14:43:42'),
(347, 'CHIFFON SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4abcb8e6dc.30.jpg', '2024-08-20 14:44:27'),
(348, 'RAW SILK', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4abfc9398d.31.jpg', '2024-08-20 14:45:16'),
(349, 'GEORGETTE SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4ac272f889.32.jpg', '2024-08-20 14:45:59'),
(350, 'CHANDERI SILK', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4ac577c503.33.jpg', '2024-08-20 14:46:47'),
(351, 'BANARAS DIGITAL PRINT SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4ac93930d1.34.jpg', '2024-08-20 14:47:47'),
(352, 'BANARAS DIGITAL PRINT SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4acbe1db09.35.jpg', '2024-08-20 14:48:30'),
(353, 'BANARAS DIGITAL PRINT SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4ad1f1ad7f.36.jpg', '2024-08-20 14:50:07'),
(354, 'ART DOLA SILK', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4ad507b7df.38.jpg', '2024-08-20 14:50:56'),
(355, 'BANARAS DIGITAL PRINT SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4ad7d9c6ba.39.jpg', '2024-08-20 14:51:41'),
(356, 'MALMAL SILK', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4adc5752d5.40.jpg', '2024-08-20 14:52:53'),
(357, 'MEENA COTTON', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4af92663d1.-O2ZjSgtA-3tWIEOlixl.jpg', '2024-08-20 15:00:34'),
(358, 'KALANKARI SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4afdf5f730.-O4_8yqAzmP_Azv0oLYG.jpg', '2024-08-20 15:01:51'),
(359, 'FANCY GEORGETTE SAREE', '6.3 M WITH BLOUSE', 37, 72, 52, '12345', 1000, 1000, 'assets/vendor_assets/product_lists/37/66c4b043dfe85.-O084xgIbJquVWraBEmX.jpg', '2024-08-20 15:03:31'),
(362, 'RED CHILLI POWDER', '200 gm', 37, 39, 43, '12345', 86, 86, 'assets/vendor_assets/product_lists/37/66c6d4cb6efde.3.webp', '2024-08-22 06:03:55'),
(364, 'MIRCH POWDER', '200 gm', 37, 39, 43, '12345', 190, 190, 'assets/vendor_assets/product_lists/37/66c6d63685e54.2.webp', '2024-08-22 06:09:58'),
(365, 'LAL KADAK', '500 gm', 37, 39, 43, '12345', 242, 242, 'assets/vendor_assets/product_lists/37/66c6d69f66935.1.webp', '2024-08-22 06:11:43'),
(366, 'TURMERIC POWDER', '200 gm', 37, 39, 43, '12345', 84, 84, 'assets/vendor_assets/product_lists/37/66c6d71201282.4.webp', '2024-08-22 06:13:38'),
(367, 'CORIANDER POWDER', '100 gm', 37, 39, 43, '12345', 32, 32, 'assets/vendor_assets/product_lists/37/66c6d75eeed4d.5.webp', '2024-08-22 06:14:54'),
(372, 'HENKO MATIC TOP LOAD LIQUID', '2 lt', 37, 82, 75, '12345', 430, 430, 'assets/vendor_assets/product_lists/37/66c77d42908dd.-original-imagmphzcbbdsmbb.webp', '2024-08-23 03:33:53'),
(374, 'HENKO FRONT LOAD DETERGENT POWDER', '2 kg', 37, 82, 75, '12345', 600, 600, 'assets/vendor_assets/product_lists/37/66c77e6e81867.-original-imaggvvjrb8reqwv.webp', '2024-08-22 18:07:42'),
(375, 'HENKO TOP LOAD DETERGENT POWDER', '2 kg', 37, 82, 75, '12345', 540, 540, 'assets/vendor_assets/product_lists/37/66c77ef31f634.2-top-load-detergent-powder-henko-matic-original-imahfsz3ejfshggc.webp', '2024-08-22 18:09:55'),
(376, 'HENKO MATIC FRONT LOAD LIQUID', '2 ltr', 37, 82, 75, '12345', 490, 490, 'assets/vendor_assets/product_lists/37/66c80308108cc.-original-imagmphzuwxxecm2.webp', '2024-08-23 03:33:28'),
(377, 'HENKO SATIN TOP LOAD DETERGENT LIQUID', '2 Ltr', 37, 82, 75, '12345', 400, 400, 'assets/vendor_assets/product_lists/37/66c80527299a1.-original-imah3apbvz6pwzma.webp', '2024-08-23 03:42:31'),
(379, 'BLACK PEPPER', '25 gm', 37, 39, 43, '12345', 40, 40, 'assets/vendor_assets/product_lists/37/66cbf04220910.black_pepper_50g_ws_front_1.webp', '2024-08-26 03:02:26'),
(380, 'CLOVE', '25 gm', 37, 39, 43, '12345', 50, 50, 'assets/vendor_assets/product_lists/37/66cbf07f98704.cloves_50g_ws_front.webp', '2024-08-26 03:03:27'),
(381, 'AJWAIN', '25 gm', 37, 39, 43, '12345', 13, 13, 'assets/vendor_assets/product_lists/37/66cbf11e37179.ajwain_25g_front_1.webp', '2024-08-26 03:06:06'),
(382, 'DHANIYA(WHOLE)', '100 gm', 37, 39, 43, '12345', 25, 25, 'assets/vendor_assets/product_lists/37/66cbf1a512a61.coriander_seed_50g_ws_front.webp', '2024-08-26 03:08:21'),
(383, 'JILAKARA (JEERA)', '100 gm', 37, 39, 43, '12345', 65, 65, 'assets/vendor_assets/product_lists/37/66cbf1f930c6a.cumin_50g_ws_front.webp', '2024-10-07 08:38:47'),
(384, 'MENTHULU (Fenugreek)', '50 gm', 37, 39, 43, '12345', 9, 9, 'assets/vendor_assets/product_lists/37/66cbf2538832f.fenugreek_25g_front.webp', '2024-10-07 08:41:23'),
(385, 'SHAJEERA', '25 gm', 37, 39, 43, '12345', 30, 30, 'assets/vendor_assets/product_lists/37/66cbf29d38635.shajeera_25g_front_1.webp', '2024-08-26 03:12:29'),
(387, 'GREEN ELACHI', '25 gm', 37, 39, 43, '12345', 120, 120, 'assets/vendor_assets/product_lists/37/66cbf421cfd77.green_cardamom_50g_ws_front.webp', '2024-08-26 03:18:57'),
(388, 'STAR ANISE', '25 gm', 37, 39, 43, '12345', 44, 44, 'assets/vendor_assets/product_lists/37/66cbf4765b0c7.star_anise_25g_front.webp', '2024-08-26 03:20:22'),
(389, 'HING', '40 gm', 37, 39, 43, '12345', 74, 74, 'assets/vendor_assets/product_lists/37/66cbf4d3bfd38.hing_front_1_.webp', '2024-08-26 03:21:55'),
(390, 'SAMBAR POWDER', '100 GM', 37, 39, 43, '12345', 60, 60, 'assets/vendor_assets/product_lists/37/66cbf64a87e8c.sambar-powder_2.webp', '2024-08-26 03:28:10'),
(391, 'RASAM POWDER', '100 gm', 37, 39, 43, '12345', 60, 60, 'assets/vendor_assets/product_lists/37/66cbf687ad76b.rasam-pouch_1.webp', '2024-08-26 03:29:11'),
(392, 'CHAT MASALA', '100 gm', 37, 39, 43, '12345', 65, 65, 'assets/vendor_assets/product_lists/37/66cbf6cd00550.chat-masala-front_1.webp', '2024-08-26 03:30:21'),
(393, 'CHOLE MASALA', '100 GM', 37, 39, 43, '12345', 65, 65, 'assets/vendor_assets/product_lists/37/66cbf70f83bb0.chhole-masala-1_1.webp', '2024-08-26 03:31:27'),
(394, 'PAVBAJI MASALA', '100 GM', 37, 39, 43, '12345', 35, 35, 'assets/vendor_assets/product_lists/37/66cbf755dfb66.pavbaji-front-image_1.webp', '2024-08-26 03:32:37'),
(395, 'GARAM MASALA', '50 GM', 37, 39, 43, '12345', 40, 40, 'assets/vendor_assets/product_lists/37/66cbf7ad76159.garam-masala-1_2.webp', '2024-08-26 03:34:05'),
(396, 'KICHEN KING', '100 GM', 37, 39, 43, '12345', 65, 65, 'assets/vendor_assets/product_lists/37/66cbf7ef9b86f.kitchenking-masala-1_1.webp', '2024-08-26 03:35:11'),
(397, 'CHIKEN MASALA', '50 GM', 37, 39, 43, '12345', 39, 39, 'assets/vendor_assets/product_lists/37/66cbf82f6a989.chicken-masala-100g_1.webp', '2024-08-26 03:36:15'),
(398, 'MUTTON MASALA', '50 GM', 37, 39, 43, '12345', 39, 39, 'assets/vendor_assets/product_lists/37/66cbf864ec6a4.mutton-masala-1_1.webp', '2024-08-26 03:37:08'),
(399, 'JEERA POWDER', '50 GM', 37, 39, 43, '12345', 30, 30, 'assets/vendor_assets/product_lists/37/66cbf8d4bcd51.cumin_50g_box_3_4th_02_1.webp', '2024-08-26 03:39:00'),
(400, 'BLACK PEPPER POWDER', '100 GM', 37, 39, 43, '12345', 125, 125, 'assets/vendor_assets/product_lists/37/66cbf92b762a8.black-pepper-1_1.webp', '2024-08-26 03:40:27'),
(401, 'KASHMIRI CHILLI POWDER', '100 GM', 37, 39, 43, '12345', 93, 93, 'assets/vendor_assets/product_lists/37/66cbf96e31103.kashmiri_chilli_powder_100g_3_4th_right.webp', '2024-08-26 03:41:34'),
(402, 'RAI MUSTERD POWDER', '200 GM', 37, 39, 43, '12345', 42, 42, 'assets/vendor_assets/product_lists/37/66cbfa03afb4c.tm-rai_1.webp', '2024-08-26 03:44:03'),
(404, 'SUGAR PARRYS', '1 Kg', 37, 39, 43, '12345', 60, 60, 'assets/vendor_assets/product_lists/37/69243402b0876.SU.webp', '2025-11-24 10:31:30'),
(406, 'ARIEL', '4 kg', 37, 82, 75, '12345', 1600, 1280, 'assets/vendor_assets/product_lists/37/66cd7f94ca690.-original-imagk28zhv5tzkm6.webp', '2024-08-27 07:26:12'),
(407, 'TIDE DETERGENT POWDER', '4 +1  kG', 37, 82, 75, '12345', 650, 650, 'assets/vendor_assets/product_lists/37/66cd80232e1f2.-original-imagueee9envgxsz.webp', '2024-08-27 07:28:35'),
(408, 'SANTOOR PUREGLO', '3X125gm', 37, 52, 38, '12345', 250, 250, 'assets/vendor_assets/product_lists/37/66f5379257bae.1-1-pureglo-glycerine-soap.webp', '2025-12-30 17:51:06'),
(409, 'URAD DAL (WHOLE)', '1 KG', 37, 39, 43, '12345', 200, 185, 'assets/vendor_assets/product_lists/37/66f9625cb26b1.WhatsApp Image 2024-09-29 at 19.49.34 (1).jpeg', '2025-12-20 05:00:49'),
(410, 'CHANA DAL', '1 KG', 37, 39, 43, '12345', 145, 140, 'assets/vendor_assets/product_lists/37/68e4c417eac29.OIP (1).jpeg', '2025-12-20 05:02:10'),
(411, 'BASMATHI RICE', '1 KG', 37, 39, 43, '12345', 160, 160, 'assets/vendor_assets/product_lists/37/68e4c656f2319.OIP (4).jpeg', '2025-11-22 17:56:17'),
(412, 'MOONG DAL', '1 KG', 37, 39, 43, '12345', 190, 190, 'assets/vendor_assets/product_lists/37/66f962e5c51ab.WhatsApp Image 2024-09-29 at 19.49.34.jpeg', '2026-01-30 03:20:07'),
(413, 'SUGAR', '1 KG', 37, 39, 43, '12345', 60, 60, 'assets/vendor_assets/product_lists/37/692434de89213.SUGAR.jpeg', '2025-11-24 10:35:10');
INSERT INTO `products_list` (`product_id`, `product_name`, `product_description`, `vendor_id`, `category_id`, `brand_id`, `item_code`, `unit_price`, `purchase_price`, `product_images`, `created_at`) VALUES
(414, 'MASOOR DAL', '1 KG', 37, 39, 43, '12345', 160, 160, 'assets/vendor_assets/product_lists/37/68e50f0d87d9e.OIP (5).jpeg', '2026-03-05 08:24:52'),
(415, 'GROUND NUT (PEANUT)', '1 Kg', 37, 39, 43, '12345', 225, 225, 'assets/vendor_assets/product_lists/37/692435b87031d.raw peanut.jpeg', '2025-12-20 04:53:42'),
(417, 'PARACHUTE  COCONUT OIL', '600 ML', 37, 52, 38, '12345', 273, 273, 'assets/vendor_assets/product_lists/37/66fd570037aff.COCO.jpg', '2024-10-02 14:21:52'),
(418, 'TAMRAIND (IMLI)', '1 KG', 37, 39, 43, '12345', 260, 260, 'assets/vendor_assets/product_lists/37/68e5e67a976c0.OIP (10).jpeg', '2025-10-08 04:20:10'),
(419, 'GOLD DROP OIL', '1 Ltr', 37, 39, 43, '12345', 231, 231, 'assets/vendor_assets/product_lists/37/6924356fc836b.GOLD.jpg', '2026-02-21 16:40:06'),
(420, 'GINNI ELACHI TEA', '250 GM', 37, 39, 43, '12345', 98, 98, 'assets/vendor_assets/product_lists/37/68e5e7d6a8362.Ginni Elaichi tea.jpg', '2025-10-08 04:25:58'),
(421, 'GINNI MASALA TEA', '500 gm', 37, 39, 43, '12345', 368, 368, 'assets/vendor_assets/product_lists/37/66f95781e2bcd.G 160.webp', '2024-10-07 08:38:17'),
(422, 'DUST TEA', '250 GM', 37, 39, 43, '12345', 110, 110, 'assets/vendor_assets/product_lists/37/66f95815a8cbc.dust 50.webp', '2024-09-29 13:37:25'),
(423, 'TATA COFFEE', '45 GM', 37, 39, 43, '12345', 160, 160, 'assets/vendor_assets/product_lists/37/66f958fb80efc.COF 74.webp', '2024-09-29 13:41:15'),
(424, 'LEVISTA COFFEE', '50 GM', 37, 39, 43, '12345', 190, 190, 'assets/vendor_assets/product_lists/37/66f9596fc0f76.L 74.webp', '2024-09-29 13:43:11'),
(425, 'SUGAR FREE RICE', '1 KG', 37, 39, 43, '12345', 250, 250, 'assets/vendor_assets/product_lists/37/66f95ba6f1c67.S 152.webp', '2024-09-29 13:52:38'),
(426, 'DABUR BROKEN BASMATHI', '1 KG', 37, 39, 43, '12345', 200, 200, 'assets/vendor_assets/product_lists/37/66f95cb151a09.Q 73.webp', '2024-09-29 13:57:05'),
(427, 'EASTERN RED CHILLI POWDER', '500 GM', 37, 39, 43, '12345', 250, 250, 'assets/vendor_assets/product_lists/37/66f95da8282ee.E 121.webp', '2024-09-29 14:01:12'),
(428, 'TATA SALT', '1 Kg', 37, 39, 43, '12345', 50, 50, 'assets/vendor_assets/product_lists/37/692430d264349.salt 32.webp', '2025-11-24 10:17:54'),
(429, 'URAD DAL {SPLIT)', '1 KG', 37, 39, 43, '12345', 200, 200, 'assets/vendor_assets/product_lists/37/68e50fec90911.OIP (6).jpeg', '2025-10-27 08:34:56'),
(430, 'Coriander/Dhaniya', '200 gm', 37, 39, 43, '12345', 80, 80, 'assets/vendor_assets/product_lists/37/692431e37cfb2.coriander.jpeg', '2026-03-07 05:44:53'),
(431, 'MALAYSIAN COFFEE', '5X10 gm =1 BOX - 10B +3B =13 BOXESS', 37, 88, 87, '12345', 3887, 3000, 'assets/vendor_assets/product_lists/37/67015cab36ed1.BOX.jpeg', '2024-10-05 15:39:13'),
(435, 'Mangaldeep Puja Agarbattis', '1 BOX', 56, 86, 85, '12345', 120, 120, 'assets/vendor_assets/product_lists/56/6708af00c775e.Mangaldeep-Sandal-Agarbatti_01.webp', '2024-10-11 04:52:16'),
(436, 'MALAYSIAN COFEE', '10 gm x 5 pc= 1 box', 37, 88, 87, '123', 1196, 1050, 'assets/vendor_assets/product_lists/37/67189af37f45a.malaysian coffe.jpeg', '2024-10-23 06:44:14'),
(437, 'MOONG DAL WHOLE', '1 KG', 37, 39, 43, '12345', 200, 200, 'assets/vendor_assets/product_lists/37/6921f33c8249c.pesallu.jpeg', '2025-11-22 17:30:36'),
(438, 'KABULI CHANA', '1 Kg', 37, 39, 43, '12345', 200, 200, 'assets/vendor_assets/product_lists/37/68e515197a59a.OIP (8).jpeg', '2025-11-22 17:51:22'),
(439, 'Classic White Peas (Pachhi Batani)', '200 gm', 37, 39, 43, '12345', 35, 35, 'assets/vendor_assets/product_lists/37/6921f4d8731b1.white peas.jpeg', '2025-11-22 18:05:30'),
(440, 'FORTUNE Sunlite Refined SF oil', '2 LTR', 37, 39, 43, '12345', 430, 430, 'assets/vendor_assets/product_lists/37/67289afac9bfb.2.png', '2024-11-04 09:59:22'),
(441, 'COCONUT POWDER', '100 gm', 37, 39, 43, '12345', 76, 76, 'assets/vendor_assets/product_lists/37/692429d13b686.coconut powder.jpeg', '2025-11-24 09:48:01'),
(485, 'LAKSHMI GANESHA IDOL', '24K Gold Plated', 37, 89, 91, '12345', 1899, 1050, 'assets/vendor_assets/product_lists/37/673380bbabb8b.WhatsApp Image 2024-11-12 at 18.53.39.jpeg', '2024-11-12 16:22:20'),
(486, 'RAM DARBAR IDOL', '24K Gold Plated', 37, 89, 91, '12345', 2199, 1050, 'assets/vendor_assets/product_lists/37/673381c0a50e2.WhatsApp Image 2024-11-12 at 18.53.38.jpeg', '2024-11-12 16:26:40'),
(487, 'LAKSHMI GANESHA IDOL', '24K Gold Plated', 37, 89, 91, '12345', 2199, 1050, 'assets/vendor_assets/product_lists/37/6733821dcc0db.WhatsApp Image 2024-11-12 at 18.53.39 (1).jpeg', '2024-11-12 16:28:13'),
(494, 'BULK WHATSAPP SINGLE QR', '1 YEAR Validity', 57, 91, 93, '12345', 6000, 5000, 'assets/vendor_assets/product_lists/57/674ac9f4b4401.6749df5db413c.031-copy.webp', '2025-01-12 08:54:47'),
(495, 'BULK WHATSAPP MULTI QR', '(10-25-50-100-QR)', 57, 92, 94, '123456', 7500, 6500, 'assets/vendor_assets/product_lists/57/674aca962f6bb.6749dfce5b61a.041-copy-1-300x300~2.jpg', '2025-01-12 09:14:52'),
(496, 'ECONOMY ROLLUP', 'Quantity (1-100) Machine only', 37, 44, 95, '12345', 1600, 1100, 'assets/vendor_assets/product_lists/37/674ad353ee705.printed-roll-up-standee-roll-up-banner-stand.jpg', '2024-11-30 08:56:51'),
(497, 'ECONOMY WITH NORMAL FLEX', 'Quantity (1-50) with Fixing', 37, 44, 95, '12345', 1800, 1500, 'assets/vendor_assets/product_lists/37/674ad45168676.promotional-roll-up-standee.jpg', '2024-11-30 09:01:05'),
(498, 'ECONOMY WITH BLACKOUT FLEX', 'Quantity (1-50) with fixing', 37, 44, 95, '12345', 2000, 1600, 'assets/vendor_assets/product_lists/37/674ad4cb65e98.Rollup Standee.jpg', '2024-11-30 09:03:07'),
(499, 'PREMIUM ROLLUP (BLACK)', 'Quantity (1-100) Machine only', 37, 44, 95, '12345', 1500, 1320, 'assets/vendor_assets/product_lists/37/674bddf0194bf.Rollup Black1.jpg', '2024-12-01 03:54:24'),
(500, 'PREMIUM WITH NORMAL FLEX', 'Quantity (1-50) with Fixing', 37, 44, 95, '12345', 2200, 1700, 'assets/vendor_assets/product_lists/37/674be039a56da.41CABsasFFL._SL1301_.jpg', '2024-12-01 04:04:09'),
(501, 'PREMIUM WITH BLACKOUT FLEX', 'Quantity (1-50) with Fixing', 37, 44, 95, '12345', 2300, 1800, 'assets/vendor_assets/product_lists/37/674be1f220405.Rollup Black.jpg', '2024-12-01 04:11:30'),
(502, 'LUXURY ROLLUP', '(3 x 6 ft) Without Flex Banner', 37, 44, 95, '12345', 7000, 3999, 'assets/vendor_assets/product_lists/37/674be1db6fe79.Luxury Rollup Standee1.jpg', '2024-12-01 04:11:07'),
(503, 'PROMOTION TABLE PLAIN', 'Show Display Table', 37, 44, 95, '12345', 3200, 2800, 'assets/vendor_assets/product_lists/37/674be3f7c420e.Table4.jpg', '2024-12-01 04:20:07'),
(504, 'PROMOTION TABLE WITH VINYL STICKER', 'without fixing', 37, 44, 95, '12345', 3900, 3600, 'assets/vendor_assets/product_lists/37/674be4cf29816.Table2.jpg', '2024-12-01 04:23:43'),
(505, 'PROMOTION TABLE', 'with sticker fixing', 37, 44, 95, '12345', 4899, 3800, 'assets/vendor_assets/product_lists/37/674be5a92443f.Table1.jpg', '2024-12-01 04:27:21'),
(506, 'ECONOMY ROLLUP', 'Quantity (1-100) Machine only', 59, 97, 96, '12345', 1600, 1100, 'assets/vendor_assets/product_lists/59/674dde9837561.printed-roll-up-standee-roll-up-banner-stand.jpg', '2024-12-02 16:21:44'),
(507, 'ECONOMY WITH NORMAL FLEX', 'Quantity (1-50) with Fixing', 59, 97, 96, '12345', 1800, 1500, 'assets/vendor_assets/product_lists/59/674ddee476ad7.promotional-roll-up-standee.jpg', '2024-12-02 16:23:00'),
(508, 'ECONOMY WITH BLACKOUT FLEX', 'Quantity (1-50) with fixing', 59, 97, 96, '12345', 2000, 1600, 'assets/vendor_assets/product_lists/59/674ddf21c2548.Rollup Standee.jpg', '2024-12-02 16:24:01'),
(509, 'PREMIUM ROLLUP (BLACK)', 'Quantity (1-100) Machine only', 59, 97, 96, '12345', 1500, 1320, 'assets/vendor_assets/product_lists/59/674ddf6da0acf.Rollup Black1.jpg', '2024-12-02 16:25:17'),
(510, 'PREMIUM WITH NORMAL FLEX', 'Quantity (1-50) with Fixing', 59, 97, 96, '12345', 2200, 1700, 'assets/vendor_assets/product_lists/59/674ddfb287a0a.41CABsasFFL._SL1301_.jpg', '2024-12-02 16:26:26'),
(511, 'PREMIUM WITH BLACKOUT FLEX', 'Quantity (1-50) with Fixing', 59, 97, 96, '12345', 2300, 1800, 'assets/vendor_assets/product_lists/59/674de00006d54.Rollup Black.jpg', '2024-12-02 16:27:44'),
(512, 'LUXURY ROLLUP', '(3 x 6 ft) Without Flex Banner', 59, 97, 96, '12345', 7000, 3999, 'assets/vendor_assets/product_lists/59/674de03cbd91d.Luxury Rollup Standee1.jpg', '2024-12-02 16:28:44'),
(513, 'Tailoring Course', 'Tailoring material', 60, 100, 97, '1234', 5000, 5000, 'assets/vendor_assets/product_lists/60/675e68eba1c23.WhatsApp Image 2024-12-15 at 10.35.00.jpeg', '2024-12-15 05:28:11'),
(522, 'BASMATHI RICE', '1 kg', 37, 89, 91, '12345', 160, 160, 'assets/vendor_assets/product_lists/37/6954140608b9b.basmathi.jpeg', '2025-12-30 18:03:50'),
(525, 'MOBILE ENVIRO CHIP', '1', 37, 89, 91, '12345', 660, 660, 'assets/vendor_assets/product_lists/37/678a7da865942.Untitled design (4).png', '2025-01-17 15:56:24'),
(526, 'ATTA', '1 KG', 37, 89, 91, '12345', 102, 102, 'assets/vendor_assets/product_lists/37/678a809709224.(Godhuma Pindi).webp', '2025-09-09 10:12:40'),
(527, 'CUMMIN', '200 gm', 37, 89, 91, '12345', 108, 108, 'assets/vendor_assets/product_lists/37/6954144a7fdb2.jeera.jpeg', '2025-12-30 18:04:58'),
(528, 'RED CHILLI POWDER', '500 gm', 37, 89, 91, '12345', 200, 200, 'assets/vendor_assets/product_lists/37/695414cdc2cfd.chilli powder.jpeg', '2025-12-30 18:07:09'),
(556, 'SANTOOR PUREGLO', '3x125 gm', 37, 89, 91, '12345', 250, 250, 'assets/vendor_assets/product_lists/37/678b7e37c9c2f.1-1-pureglo-glycerine-soap.webp', '2025-12-30 18:08:36'),
(570, 'ALKALISER (alkaline water) FLASK', '2.5 Ltr  storage ,8000 Ltr dispence 3years warranty', 37, 101, 98, '12345', 7500, 6000, 'assets/vendor_assets/product_lists/37/67aae3f26ad59.WhatsApp_Image_2025-01-26_at_11.24.24_AM-removebg-preview (1).png', '2025-02-11 05:45:22'),
(571, 'TOWER FAN', 'ROOM COOLER', 37, 101, 98, '12345', 7500, 6000, 'assets/vendor_assets/product_lists/37/67aae378219f2.tower-fan.png', '2025-02-11 05:43:20'),
(572, 'U.S. Polo Assn', 'Strolley Cabin Luggage, Medium Hard Luggage', 37, 101, 98, '12345', 10999, 9899, 'assets/vendor_assets/product_lists/37/67aae759acc1d.Untitled design.png', '2025-02-11 05:59:53'),
(574, 'BIO MAGNETIC BED', '5X6 SIZE', 37, 51, 39, '12345', 7500, 7500, 'assets/vendor_assets/product_lists/37/67ea70f83c560.619kVf0RQRL._AC_UF894,1000_QL80_.jpg', '2025-03-31 10:39:52'),
(576, 'GOLDDROP S F OIL', '1 Ltr', 37, 89, 91, '12345', 231, 231, 'assets/vendor_assets/product_lists/37/695417373a35f.GOLD.jpg', '2026-02-21 16:40:27'),
(577, 'FORTUNE RICEBRAN OIL', '1 Ltr', 37, 89, 91, '12345', 200, 200, 'assets/vendor_assets/product_lists/37/68c00245511d4.WhatsApp Image 2025-09-09 at 15.57.22.jpeg', '2025-12-30 18:21:47'),
(578, 'TURMERIC POWDER', '200 gm', 37, 89, 91, '12345', 90, 90, 'assets/vendor_assets/product_lists/37/695415dff1e93.turmeric.jpeg', '2026-01-30 03:14:14'),
(583, 'AJWAN (VAMU)', '50gm', 37, 39, 43, '12345', 30, 30, 'assets/vendor_assets/product_lists/37/6921f4394cf58.ajwain.jpeg', '2025-11-22 17:34:49'),
(584, 'TURMERIC POWDER', '200 gm', 37, 39, 43, '12345', 90, 90, 'assets/vendor_assets/product_lists/37/6921f5797e50b.turmeric.jpeg', '2026-01-30 03:13:03'),
(585, 'FLAX SEEDS', '100 gm', 37, 39, 43, '12345', 35, 35, 'assets/vendor_assets/product_lists/37/6921f5caef2f2.flax seeds.jpeg', '2025-11-22 17:41:31'),
(586, 'BARLEY', '500 gm', 37, 39, 43, '12345', 107, 107, 'assets/vendor_assets/product_lists/37/692427d767a53.barlee.jpeg', '2025-11-24 09:39:35'),
(587, 'SHBUDANA /SAGO', '500 gm', 37, 39, 43, '12345', 108, 108, 'assets/vendor_assets/product_lists/37/6924288402c5d.shabudana.jpeg', '2025-11-24 09:42:28'),
(588, 'JOWAR WHITE', '500 gm', 37, 39, 43, '12345', 65, 65, 'assets/vendor_assets/product_lists/37/692428cda74cd.jowar wihte.jpeg', '2026-03-05 11:43:56'),
(589, 'PUTNALU', '500 gm', 37, 39, 43, '12345', 90, 90, 'assets/vendor_assets/product_lists/37/69242954aca46.putnalu.jpeg', '2026-03-05 11:27:58'),
(590, 'SAUNF / SOMPU', '50 gm', 37, 39, 43, '12345', 30, 30, 'assets/vendor_assets/product_lists/37/69242a972524e.saunf.jpeg', '2025-11-24 09:51:19'),
(591, 'BLACK PEPPER', '50 gm', 37, 39, 43, '12345', 80, 80, 'assets/vendor_assets/product_lists/37/69242acfc9f1f.peppr.jpeg', '2025-11-24 09:52:15'),
(592, 'JILAKARA (JEERA)', '200 gm', 37, 39, 43, '12345', 108, 108, 'assets/vendor_assets/product_lists/37/69242b1e92364.jeera.jpeg', '2025-11-24 09:53:34'),
(593, 'WHITE TILL', '100 gm', 37, 39, 43, '12345', 45, 45, 'assets/vendor_assets/product_lists/37/69242b59c135b.nuvvulu.jpeg', '2025-11-24 09:54:33'),
(594, 'GREENPEAS / BATANI', '200 gm', 37, 39, 43, '12345', 76, 76, 'assets/vendor_assets/product_lists/37/69242d8adf018.green peas.jpeg', '2025-11-24 10:03:54'),
(595, 'CHILLI POWDER', '200 gm', 37, 39, 43, '12345', 80, 80, 'assets/vendor_assets/product_lists/37/69242ed6406c0.chilli powder.jpeg', '2025-12-22 08:12:06'),
(596, 'CHIA SEEDS', '100 gm', 37, 39, 43, '12345', 60, 60, 'assets/vendor_assets/product_lists/37/69242f7e41acf.chiya seeds.jpeg', '2025-11-24 10:12:14'),
(597, 'GREEN ELACHI', '20 gm', 37, 39, 43, '12345', 130, 130, 'assets/vendor_assets/product_lists/37/6924300d48d0d.green cardamom.jpeg', '2025-11-24 10:14:37'),
(598, 'WATERMELON SEEDS', '50 gm', 37, 39, 43, '12345', 76, 76, 'assets/vendor_assets/product_lists/37/6924328608d79.watermelon.jpeg', '2025-11-24 10:25:10'),
(599, 'PUMPKIN SEEDS', '100 gm', 37, 39, 43, '12345', 75, 75, 'assets/vendor_assets/product_lists/37/692432c439b04.pumpkin.jpeg', '2025-11-24 10:26:12'),
(600, 'SHAJEERA', '20 gm', 37, 39, 43, '12345', 47, 47, 'assets/vendor_assets/product_lists/37/69243314c41b4.sajeera.jpeg', '2025-11-24 10:27:32'),
(601, 'TOOR DAL', '1 Kg', 37, 39, 32, '12345', 185, 185, 'assets/vendor_assets/product_lists/37/69243618e2bb3.toor dal.jpeg', '2026-01-30 03:18:10'),
(602, 'BAJRA MILLET / sajjalu', '500 gm', 37, 39, 43, '12345', 50, 50, 'assets/vendor_assets/product_lists/37/6924371953845.millet bajra.jpeg', '2025-11-24 10:44:41'),
(603, 'LITTLE MILLT / SAMELU', '500 gm', 37, 39, 43, '12345', 140, 140, 'assets/vendor_assets/product_lists/37/692438cb77d77.millet little.jpeg', '2025-11-24 10:51:55'),
(604, 'BROWNTOP MILLT /ANDRU KORRALU', '500 gm', 37, 39, 43, '12345', 125, 125, 'assets/vendor_assets/product_lists/37/692445bdd0744.andru korralu.jpeg', '2025-11-24 11:47:09'),
(605, 'KUDO MILLET / ARIKELU', '500 gm', 37, 39, 43, '12345', 100, 100, 'assets/vendor_assets/product_lists/37/6924398c37b79.millet kudo.jpeg', '2025-11-24 10:55:08'),
(606, 'FINGER MILLET / RAGULU', '500 gm', 37, 39, 43, '12345', 70, 70, 'assets/vendor_assets/product_lists/37/69243a0525b7c.millet ragulu.jpeg', '2026-01-26 06:06:53'),
(607, 'RAGI FLOUR', '1 Kg', 37, 39, 43, '12345', 110, 110, 'assets/vendor_assets/product_lists/37/69243a5d9a606.ragi flour.jpeg', '2025-11-24 10:58:37'),
(608, 'SUJI RAVVA /BOMBAY', '1 Kg', 37, 39, 43, '12345', 80, 80, 'assets/vendor_assets/product_lists/37/69243c730bcf7.SUJI BOMBAY RAVVA.jpeg', '2026-03-11 05:11:13'),
(609, 'IDLI RAVVA', '1 Kg', 37, 39, 43, '12345', 70, 70, 'assets/vendor_assets/product_lists/37/69243d18a94d4.IDLI RAVVA.jpeg', '2025-11-24 11:10:16'),
(610, 'SHANGALU', '500 gm', 37, 39, 43, '12345', 75, 75, 'assets/vendor_assets/product_lists/37/69243dffb18ae.shanagalu.jpeg', '2026-01-30 03:44:19'),
(611, 'WHEAT FOLUR / GODHUMAPINDI', '1 Kg', 37, 39, 43, '12345', 80, 80, 'assets/vendor_assets/product_lists/37/69243f974c66c.wheet flour.jpeg', '2025-11-24 11:20:55'),
(612, 'MAIDA PINDI', '1 Kg', 37, 39, 43, '12345', 80, 80, 'assets/vendor_assets/product_lists/37/69243fec8e1c2.maida.jpeg', '2026-03-07 05:47:46'),
(613, 'RICE FLOUR', '1 KG', 37, 39, 43, '12345', 55, 55, 'assets/vendor_assets/product_lists/37/6924407a4d78d.RICE FLOUR.jpeg', '2025-11-24 11:24:42'),
(614, 'FOXTAIL MILLET / korralu', '500 gm', 37, 39, 43, '12345', 65, 65, 'assets/vendor_assets/product_lists/37/692445375c66f.millet korralu.jpeg', '2025-11-24 11:50:09'),
(615, 'BARNYARD MILLET /OODALU', '500 Kg', 37, 39, 43, '12345', 78, 78, 'assets/vendor_assets/product_lists/37/69244635b6f2f.millet baryard.jpeg', '2025-11-24 11:49:09'),
(616, 'NUTMEG / JAJIKAYA', '50 gm', 37, 39, 43, '12345', 87, 87, 'assets/vendor_assets/product_lists/37/692446f280f2b.nutmeg jajikaya.jpeg', '2025-11-24 11:52:18'),
(617, 'FENUGREEK / MENTHULU', '200 gm', 37, 39, 43, '12345', 35, 35, 'assets/vendor_assets/product_lists/37/6924475ed9320.fenugreek.jpeg', '2026-03-07 05:56:27'),
(618, 'SOYACHUNKS / MILMEKER', '300 gm', 37, 39, 43, '12345', 55, 55, 'assets/vendor_assets/product_lists/37/692447f3c4fc0.MEALMAKER.jpeg', '2026-01-01 17:45:52'),
(619, 'THIN POHA / ATUKULU', '500 gm', 37, 39, 43, '12345', 65, 65, 'assets/vendor_assets/product_lists/37/6924484fcbfff.thin atukulu.jpeg', '2026-01-26 06:08:46'),
(620, 'KASURI METHI', '50 gm', 37, 39, 43, '12345', 25, 25, 'assets/vendor_assets/product_lists/37/692448ba3655e.kasuri methi.jpeg', '2025-11-24 11:59:54'),
(621, 'STAR FLOWER', '20 gm', 37, 39, 43, '12345', 35, 35, 'assets/vendor_assets/product_lists/37/692448fc83d9a.star flower.jpeg', '2025-11-24 12:01:00'),
(622, 'CINNAMON / DALCHINA', '20 gm', 37, 39, 43, '12345', 20, 20, 'assets/vendor_assets/product_lists/37/69244959cb701.dalchina.jpeg', '2025-11-24 12:02:33'),
(623, 'JAVITRI', '20 gm', 37, 39, 43, '12345', 90, 90, 'assets/vendor_assets/product_lists/37/692449a38f3da.javitri.jpeg', '2025-11-24 12:03:47'),
(624, 'BAY LEAF / BIRYANI AKU', '20 gm', 37, 39, 43, '12345', 20, 20, 'assets/vendor_assets/product_lists/37/69244a021abde.bay leaf.jpeg', '2025-11-24 12:05:22'),
(626, 'MUSTERD', '200 gm', 37, 39, 43, '12345', 50, 50, 'assets/vendor_assets/product_lists/37/69244b761a637.musterd.jpeg', '2026-02-21 06:58:54'),
(627, 'LEMON SALT', '50 gm', 37, 39, 43, '12345', 25, 25, 'assets/vendor_assets/product_lists/37/69244c672236f.lemon salt.jpeg', '2025-11-24 12:15:35'),
(628, 'MEMBERSHIP FEE', '1 Year', 37, 44, 46, '12345', 20000, 13000, 'assets/vendor_assets/product_lists/37/692c13d1857d7.Expand Your (9).png', '2025-11-30 09:52:18'),
(633, 'TOOR DAL', '1Kg', 37, 89, 91, '12345', 185, 185, 'assets/vendor_assets/product_lists/37/69541b566a1ec.toor dal.jpeg', '2025-12-30 18:35:02'),
(634, 'CHANA DAL', '1Kg', 37, 89, 91, '12345', 140, 140, 'assets/vendor_assets/product_lists/37/69541b973400a.chana dal.jpeg', '2025-12-30 18:36:07'),
(635, 'URAD DAL (WHOLE)', '1 Kg', 37, 89, 91, '12345', 185, 185, 'assets/vendor_assets/product_lists/37/69541bca04521.URAD WHOLE.jpeg', '2025-12-30 18:36:58'),
(636, 'GROUND NUT (PEANUT)', '1 Kg', 37, 89, 91, '12345', 225, 225, 'assets/vendor_assets/product_lists/37/69541c081f781.raw peanut.jpeg', '2025-12-30 18:38:00'),
(637, 'SOYACHUNKS / MILMEKER', '300 Gm', 37, 89, 91, '12345', 55, 55, 'assets/vendor_assets/product_lists/37/6956b3653e55e.MEALMAKER.jpeg', '2026-01-01 17:48:21'),
(638, 'MOONG DAL', '1Kg', 37, 89, 91, '12345', 190, 190, 'assets/vendor_assets/product_lists/37/6956b3aa6753a.moong dal.jpeg', '2026-01-30 03:17:19'),
(640, 'MOKSH Agarbathi', '1 pocket', 37, 89, 91, '12345', 70, 70, 'assets/vendor_assets/product_lists/37/6956b612205c2.moksh-agarbatti-wholesalers-1000x1000.jpg', '2026-01-01 17:59:46'),
(641, 'Dr WASH DETWRGENT', '200 Gm x 4+1', 37, 89, 91, '12345', 150, 150, 'assets/vendor_assets/product_lists/37/6956b6e982972.WhatsApp Image 2026-01-01 at 23.23.13.jpeg', '2026-01-01 18:04:32'),
(642, 'SARVOTHAM RICEBRAN OIL', '815 Gm', 37, 89, 91, '12345', 189, 189, 'assets/vendor_assets/product_lists/37/69744309e6402.oil-1.jpg', '2026-01-24 03:56:57'),
(643, 'IDLI RAVVA', '1 Kg', 37, 89, 91, '12345', 70, 70, 'assets/vendor_assets/product_lists/37/6956b856087be.IDLI RAVVA.jpeg', '2026-01-01 18:09:26'),
(644, 'WHEAT FOLUR / GODHUMAPINDI', '1 Kg', 37, 89, 91, '12345', 80, 80, 'assets/vendor_assets/product_lists/37/6956b91fd33ee.wheet flour.jpeg', '2026-01-01 18:12:47'),
(645, 'UPMA RAVVA', '1 Kg', 37, 89, 91, '12345', 80, 80, 'assets/vendor_assets/product_lists/37/695cafcbb75a0.SUJI BOMBAY RAVVA.jpeg', '2026-03-11 05:12:01'),
(646, 'HARPIC (Red)', '1 Ltr', 37, 89, 91, '12345', 219, 219, 'assets/vendor_assets/product_lists/37/695ca9836758c.OIP (1).jpg', '2026-01-06 06:19:47'),
(647, 'LIZOL (YELLOW)', '1 Ltr', 37, 89, 91, '12345', 232, 232, 'assets/vendor_assets/product_lists/37/695ca9cfb63b8.OIP (2).jpg', '2026-01-06 06:21:03'),
(648, 'LIZOL (red)', '1 Ltr', 37, 89, 91, '12345', 232, 232, 'assets/vendor_assets/product_lists/37/695ca9fceaa5a.OIP (3).jpg', '2026-01-06 06:21:48'),
(649, 'HARPIC (blue)', '1 Ltr', 37, 89, 91, '12345', 225, 225, 'assets/vendor_assets/product_lists/37/695cb0008a3b2.OIP.jpg', '2026-01-06 06:47:28'),
(650, 'LIME pickle', '300 gm', 37, 89, 91, '12345', 83, 83, 'assets/vendor_assets/product_lists/37/69615922306dc.download (2).jpg', '2026-01-09 19:38:10'),
(651, 'MANGO PICKLE', '300 Gm', 37, 89, 91, '12345', 83, 83, 'assets/vendor_assets/product_lists/37/69615a50ed17b.MANGO.jpg', '2026-01-09 19:43:12'),
(652, 'MANGO tokku', '300 Gm', 37, 89, 91, '12345', 83, 83, 'assets/vendor_assets/product_lists/37/69615b5ee86b6.mango tokku.webp', '2026-01-09 19:47:42'),
(653, 'GOLD STONE TEA', '250 Gm', 37, 89, 91, '12345', 155, 155, 'assets/vendor_assets/product_lists/37/696b06d9ba11e.WhatsApp_Image_2026-01-09_at_12.36.23-removebg-preview.png', '2026-01-17 03:49:45'),
(654, 'SAVERA TEA', '250 Gm', 37, 89, 91, '12345', 150, 150, 'assets/vendor_assets/product_lists/37/696b06f763536.WhatsApp_Image_2026-01-09_at_12.36.22-removebg-preview.png', '2026-01-17 03:50:15'),
(655, 'GOLD STONE TEA', '250 Gm', 37, 39, 43, '12345', 155, 155, 'assets/vendor_assets/product_lists/37/696b066542cbd.WhatsApp_Image_2026-01-09_at_12.36.23-removebg-preview.png', '2026-01-17 03:47:49'),
(656, 'SAVERA TEA', '250 Gm', 37, 39, 43, '12345', 150, 150, 'assets/vendor_assets/product_lists/37/696b0696e1a01.WhatsApp_Image_2026-01-09_at_12.36.22-removebg-preview.png', '2026-01-17 03:48:38'),
(657, 'GROCERY', '3000', 37, 90, 92, '12345', 3000, 3000, 'assets/vendor_assets/product_lists/37/6974438b8f1d4.Grocery.jpg', '2026-01-24 03:59:07'),
(658, 'HARPIC (blue)', '1 Ltr', 37, 82, 75, '12345', 225, 225, 'assets/vendor_assets/product_lists/37/69758ff4446b3.OIP.jpg', '2026-01-25 03:37:24'),
(659, 'HARPIC (Red)', '1 Ltr', 37, 82, 75, '12345', 219, 219, 'assets/vendor_assets/product_lists/37/6975902b1207c.OIP (1).jpg', '2026-01-25 03:38:19'),
(660, 'LIZOL (YELLOW)', '1 Ltr', 37, 82, 75, '12345', 232, 232, 'assets/vendor_assets/product_lists/37/69759064d91c7.OIP (2).jpg', '2026-01-25 03:39:16'),
(661, 'LIZOL (red)', '1 Ltr', 37, 82, 75, '12345', 232, 232, 'assets/vendor_assets/product_lists/37/6975909d59230.OIP (3).jpg', '2026-01-25 03:40:13'),
(662, 'Dr WASH DETWRGENT', '5 X 200 Gm', 37, 82, 75, '12345', 150, 150, 'assets/vendor_assets/product_lists/37/6975915303d17.Dr wash.jpeg', '2026-01-25 03:43:15'),
(663, 'SANTOOR PUREGLO', '3x1 box', 37, 82, 75, '12345', 250, 250, 'assets/vendor_assets/product_lists/37/6999597721841.da3f8b6e-1a69-4454-8c80-ef0cbaef28c1.webp', '2026-02-21 07:06:31'),
(664, 'Mangaldeep Puja Agarbattis', '1 BOX', 37, 89, 91, '12345', 120, 120, 'assets/vendor_assets/product_lists/37/69996aab51502.Mangaldeep-Sandal-Agarbatti_01.webp', '2026-02-21 08:19:55'),
(665, 'Mangaldeep Puja Agarbattis', '1 BOX', 37, 82, 75, '12345', 120, 120, 'assets/vendor_assets/product_lists/37/69996ae3e204a.Mangaldeep-Sandal-Agarbatti_01.webp', '2026-02-21 08:20:51'),
(666, 'ROCK SALT', '1 Kg', 37, 39, 43, '12345', 110, 110, 'assets/vendor_assets/product_lists/37/69996bcc44072.images.jpg', '2026-02-21 08:24:44'),
(667, 'ROCK SALT', '1 Kg', 37, 89, 91, '12345', 110, 110, 'assets/vendor_assets/product_lists/37/69996bf11ba1d.images.jpg', '2026-02-21 08:25:21'),
(669, 'BELLAM (JAGREE)', '900 Gm', 37, 89, 91, '12345', 137, 137, 'assets/vendor_assets/product_lists/37/6999deff4bd52.download.jpg', '2026-02-21 16:36:15'),
(670, 'BELLAM (JAGREE)', '900 Gm', 37, 39, 43, '12345', 137, 137, 'assets/vendor_assets/product_lists/37/6999df83b611d.download.jpg', '2026-02-21 16:38:27'),
(671, 'FINGER PAPAD', '400 Gm', 37, 39, 43, '12345', 50, 50, 'assets/vendor_assets/product_lists/37/69a93c0714cac.WhatsApp Image 2026-03-05 at 13.42.51.jpeg', '2026-03-05 08:17:11'),
(672, 'WHEEL PAPAD', '400 Gm', 37, 39, 43, '12345', 55, 55, 'assets/vendor_assets/product_lists/37/69a93c3dcaebf.WhatsApp Image 2026-03-05 at 13.42.45.jpeg', '2026-03-05 08:18:05'),
(673, 'FINGER PAPAD', '400 Gm', 37, 89, 91, '12345', 50, 50, 'assets/vendor_assets/product_lists/37/69a93c6c19e2d.WhatsApp Image 2026-03-05 at 13.42.51.jpeg', '2026-03-05 08:18:52'),
(674, 'WHEEL PAPAD', '400 Gm', 37, 89, 91, '12345', 55, 55, 'assets/vendor_assets/product_lists/37/69a93c92e88b2.WhatsApp Image 2026-03-05 at 13.42.45.jpeg', '2026-03-05 08:19:30'),
(675, 'MASOOR DAL', '1 Kg', 37, 89, 91, '12345', 160, 160, 'assets/vendor_assets/product_lists/37/69a93e5c6b6de.masoor dal.jpeg', '2026-03-05 08:27:08'),
(676, 'FENUGREEK / MENTHULU', '200 Gm', 37, 89, 91, '12345', 35, 35, 'assets/vendor_assets/product_lists/37/69a93f0a0c444.fenugreek.jpeg', '2026-03-05 08:30:02'),
(677, 'MUSTERD', '200 Gm', 37, 89, 91, '12345', 50, 50, 'assets/vendor_assets/product_lists/37/69a93f3b4333e.musterd.jpeg', '2026-03-05 08:30:51'),
(678, 'YELLOW JOWAR', '500 Gm', 37, 39, 92, '12345', 70, 70, 'assets/vendor_assets/product_lists/37/69a9699ce3385.download (1).jpg', '2026-03-05 11:31:40'),
(679, 'KABULI CHANA SMALL', '500 Gm', 37, 39, 92, '12345', 90, 90, 'assets/vendor_assets/product_lists/37/69a96a1b85e19.kabuli chana.jpeg', '2026-03-05 11:33:47'),
(680, 'MOONG DAL chilka', '500 Gm', 37, 39, 92, '12345', 110, 110, 'assets/vendor_assets/product_lists/37/69a96ab92b973.download (2).jpg', '2026-03-05 11:36:25'),
(681, 'YELLOW JOWAR', '500 Gm', 37, 89, 91, '12345', 70, 70, 'assets/vendor_assets/product_lists/37/69a96b2a3da4b.download (1).jpg', '2026-03-05 11:38:18'),
(682, 'KABULI CHANA SMALL', '500 Gm', 37, 89, 91, '12345', 90, 90, 'assets/vendor_assets/product_lists/37/69a96b6ce2e0f.kabuli chana.jpeg', '2026-03-05 11:39:24'),
(683, 'MOONG DAL chilka', '500 Gm', 37, 89, 91, '12345', 110, 110, 'assets/vendor_assets/product_lists/37/69a96ba12d2a0.download (2).jpg', '2026-03-05 11:40:17'),
(684, 'MAIDA PINDI', '1 Kg', 37, 89, 91, '12345', 80, 80, 'assets/vendor_assets/product_lists/37/69b0f6c390279.maida.jpeg', '2026-03-11 04:59:47'),
(685, 'DHANIYA WHOLE', '250 Gm', 37, 89, 92, '12345', 100, 100, 'assets/vendor_assets/product_lists/37/69b0f731c6bfe.coriander.jpeg', '2026-03-11 05:01:37'),
(686, 'PESARLU', '500 Gm', 37, 89, 91, '12345', 105, 105, 'assets/vendor_assets/product_lists/37/69b0f7ab21499.pesallu.jpeg', '2026-03-11 05:03:39'),
(687, 'PUTNALU', '500 Gm', 37, 89, 91, '12345', 90, 90, 'assets/vendor_assets/product_lists/37/69b0f7f8b229d.putnalu.jpeg', '2026-03-11 05:04:56'),
(688, 'RAGULU', '500 Gm', 37, 89, 91, '12345', 70, 70, 'assets/vendor_assets/product_lists/37/69b0f8c2b9998.millet ragulu.jpeg', '2026-03-11 05:08:18'),
(689, 'ATUKULU', '500 Gm', 37, 89, 91, '12345', 65, 65, 'assets/vendor_assets/product_lists/37/69b0f91fb1268.thin atukulu.jpeg', '2026-03-11 05:09:51');

-- --------------------------------------------------------

--
-- Table structure for table `product_wallet`
--

CREATE TABLE `product_wallet` (
  `wallet_id` int NOT NULL,
  `user_id` int NOT NULL,
  `balance` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_wallet`
--

INSERT INTO `product_wallet` (`wallet_id`, `user_id`, `balance`, `created_at`) VALUES
(1, 149, 20, '2024-08-22 07:31:47'),
(2, 250, 11, '2024-08-23 05:57:30'),
(3, 185, 17, '2024-10-10 15:21:14'),
(4, 252, 3, '2024-10-12 17:39:33'),
(5, 160, 35, '2024-10-23 16:21:28'),
(6, 162, 35, '2024-10-23 16:21:44'),
(7, 150, 13, '2025-12-28 11:40:12'),
(8, 1088, 37, '2026-01-08 18:27:20');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_wallet`
--

CREATE TABLE `purchase_wallet` (
  `wallet_id` int NOT NULL,
  `user_id` int NOT NULL,
  `balance` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_wallet`
--

CREATE TABLE `reward_wallet` (
  `wallet_id` int NOT NULL,
  `user_id` int NOT NULL,
  `balance` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int NOT NULL,
  `service_name` varchar(50) NOT NULL,
  `service_image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `service_image`, `created_at`) VALUES
(2, 'MECHANIC', 'assets/vendor_assets/service_images_admin/662626210f46d.mechanic_service.jpeg', '2024-09-30 06:53:12'),
(3, 'TV REPAIR', 'assets/vendor_assets/service_images_admin/662245be78486.tv_repair_service.jpeg', '2024-09-30 06:53:38'),
(7, 'BRIDAL MAKEUP', 'assets/vendor_assets/service_images_admin/6646fdb55e830.BRIDAL MAKEUP.png', '2024-05-17 06:48:21'),
(8, 'BUILDING LEAKAGES', 'assets/vendor_assets/service_images_admin/6646fdc502e78.BUILDING LEAKAGES.png', '2024-05-17 06:48:37'),
(9, 'LIFE COACHING', 'assets/vendor_assets/service_images_admin/6646fdd344abc.COACHING.png', '2025-07-29 05:29:08'),
(10, 'CIVIL ENGINEER', 'assets/vendor_assets/service_images_admin/6646fde102f88.civil engineer.png', '2024-09-30 06:54:41'),
(11, 'DOCUMENT WRITER', 'assets/vendor_assets/service_images_admin/6646fdee316fe.DOCUMENT WRITER.png', '2024-05-17 06:49:19'),
(12, 'ABROAD CONSULTANT', 'assets/vendor_assets/service_images_admin/6646fe2b93d39.ABROAD CONSULTANT.png', '2024-05-17 06:50:19'),
(13, 'AC SERVICE', 'assets/vendor_assets/service_images_admin/6646fe60be867.AC SERVICE.png', '2024-05-17 06:51:12'),
(14, 'AD AGENCY', 'assets/vendor_assets/service_images_admin/6646fe94709f5.ad.png', '2024-05-17 06:52:04'),
(15, 'ADVOCATE', 'assets/vendor_assets/service_images_admin/6646feb7f1960.ADVOCATE.png', '2024-05-17 06:52:40'),
(16, 'AEROBICS', 'assets/vendor_assets/service_images_admin/6646fedb46a1b.AEROBICS.png', '2024-05-17 06:53:15'),
(17, 'AMBULANCE', 'assets/vendor_assets/service_images_admin/6646ff0aed1b0.AMBULANCE.png', '2024-05-17 06:54:02'),
(18, 'ANIMAL TRANSPORTER', 'assets/vendor_assets/service_images_admin/6646ff3a6e3a2.ANIMAL TRANSPORTER.png', '2024-05-17 06:54:50'),
(19, 'ARCHITECHTURE', 'assets/vendor_assets/service_images_admin/6646ff54a668f.ARCHITECHTURE.png', '2024-05-17 06:55:17'),
(20, 'ASTROLOGERS', 'assets/vendor_assets/service_images_admin/6646ff71568fe.ASTROLOGERS.png', '2024-05-17 06:55:45'),
(21, 'AUDITORS', 'assets/vendor_assets/service_images_admin/6646ff8b00492.AUDITORS.png', '2024-05-17 06:56:11'),
(22, 'DR AYYUYRVEDIC', 'assets/vendor_assets/service_images_admin/6646ffbb8168c.AYYUYRVEDIC DR.png', '2024-05-17 06:56:59'),
(23, 'DR ACCUPUNCTURE', 'assets/vendor_assets/service_images_admin/6646ffe2b990c.DR ACCUPUNCTURE.png', '2024-05-17 06:57:38'),
(24, 'DR.HOMEOPATHY', 'assets/vendor_assets/service_images_admin/66470022540e3.DR.HOMEOPATHY.png', '2024-05-17 06:58:42'),
(25, 'DR DERMATOLOGISTS', 'assets/vendor_assets/service_images_admin/6647004ac8071.DERMATOLOGISTS DR.png', '2024-05-17 06:59:22'),
(26, 'BEAUTY SERVICES', 'assets/vendor_assets/service_images_admin/664700c50e2c2.BEAUTY SERVICES.png', '2024-05-17 07:01:25'),
(27, 'BIKE REPAIR', 'assets/vendor_assets/service_images_admin/664700d9964f2.BIKE REPAIR.png', '2024-05-17 07:01:45'),
(28, 'BODYGUARDS', 'assets/vendor_assets/service_images_admin/664700ed03500.BODYGUARDS.png', '2024-05-17 07:02:05'),
(29, 'BOREWELL', 'assets/vendor_assets/service_images_admin/66470109b641d.BOREWELL.png', '2024-05-17 07:02:33'),
(30, 'CAR AC', 'assets/vendor_assets/service_images_admin/6647012500d98.CAR AC.png', '2024-05-17 07:03:01'),
(31, 'CAR DECORS', 'assets/vendor_assets/service_images_admin/6647013b170a5.CAR DECORS.png', '2024-05-17 07:03:23'),
(32, 'CAR HIRE', 'assets/vendor_assets/service_images_admin/66470151ba2bc.CAR HIRE.png', '2024-05-17 07:03:45'),
(33, 'CAR REPAIR', 'assets/vendor_assets/service_images_admin/66470174809fc.CAR REPAIR.png', '2024-05-17 07:04:20'),
(34, 'CAR WASH', 'assets/vendor_assets/service_images_admin/664701889f80b.CAR WASH.png', '2024-05-17 07:04:40'),
(35, 'CARPENTERS', 'assets/vendor_assets/service_images_admin/6647019cc1c82.CARPENTERS.png', '2024-05-17 07:05:00'),
(36, 'CATERERING', 'assets/vendor_assets/service_images_admin/664701d8c98e3.CATERERING.png', '2024-05-17 07:06:00'),
(37, 'CCTV CAMERA', 'assets/vendor_assets/service_images_admin/664701f0a4c94.CCTV CAMERA.png', '2024-05-17 07:06:24'),
(38, 'CHARTERED ACCOUNTANT', 'assets/vendor_assets/service_images_admin/6647020f4d11c.CHARTERED ACCOUNTANT.png', '2024-05-17 07:06:55'),
(39, 'CHEF', 'assets/vendor_assets/service_images_admin/664702266e51d.CHEF.png', '2024-05-17 07:07:18'),
(40, 'CIVIL CONTRACTORS', 'assets/vendor_assets/service_images_admin/664702430fa24.CIVIL CONTRACTORS.png', '2024-05-17 07:07:47'),
(41, 'CLEANING SERVICES', 'assets/vendor_assets/service_images_admin/66470b2a44126.CLEANING SERVICES.png', '2024-05-17 07:45:46'),
(42, 'COMPUTER HARDWARE TRAINING', 'assets/vendor_assets/service_images_admin/66470b480d892.COMPUTER HARDWARE TRAINING.png', '2024-05-17 07:46:16'),
(43, 'COMPUTER NETWORKING TRAINING', 'assets/vendor_assets/service_images_admin/66470b75b5398.COMPUTER NETWORKING TRAINING.png', '2024-05-17 07:47:01'),
(44, 'COMPUTER TRAINING', 'assets/vendor_assets/service_images_admin/66470ba16b6ad.COMPUTER TRAINING.png', '2024-05-17 07:47:45'),
(45, 'COUNSELLING CENTRE', 'assets/vendor_assets/service_images_admin/66470bb36f168.COUNSELLING CENTRE.png', '2024-05-17 07:48:03'),
(46, 'COURIER SERVICES', 'assets/vendor_assets/service_images_admin/66470bc480b6c.COURIER SERVICES.png', '2024-05-17 07:48:20'),
(47, 'DANCE CLASSES', 'assets/vendor_assets/service_images_admin/66470bd56a8df.DANCE CLASSES.png', '2024-05-17 07:48:37'),
(48, 'DATABASE TRAINING', 'assets/vendor_assets/service_images_admin/66470be6868a0.DATABASE TRAINING.png', '2024-05-17 07:48:54'),
(49, 'DR DENTIST', 'assets/vendor_assets/service_images_admin/66470bf9938fa.DENTISTS DR.png', '2024-09-30 06:56:42'),
(50, 'DETECTIVES', 'assets/vendor_assets/service_images_admin/66470c0b711ea.DETECTIVES.png', '2024-05-17 07:49:31'),
(51, 'DRAWING CLASSES', 'assets/vendor_assets/service_images_admin/66470c4bbe016.DRAWING CLASSES.png', '2024-05-17 07:50:35'),
(52, 'DRIVERS', 'assets/vendor_assets/service_images_admin/66470c880b5ce.DRIVERS.png', '2024-05-17 07:51:36'),
(53, 'ELECTRICIANS', 'assets/vendor_assets/service_images_admin/66470ca3deaaa.ELECTRICIANS.png', '2024-05-17 07:52:03'),
(54, 'EVENT ORGANIZER', 'assets/vendor_assets/service_images_admin/66470cb56760d.EVENT ORGANIZER.png', '2024-05-17 07:52:21'),
(55, 'FABRICATORS', 'assets/vendor_assets/service_images_admin/66470cc852f47.FABRICATORS.png', '2024-05-17 07:52:40'),
(56, 'FALSE CEILING', 'assets/vendor_assets/service_images_admin/66470cdccc50e.FALSE CEILING.png', '2024-05-17 07:53:00'),
(57, 'FARMLANDS', 'assets/vendor_assets/service_images_admin/66470cf373429.FARMLANDS.png', '2024-05-17 07:53:23'),
(58, 'FASHION DESIGNING', 'assets/vendor_assets/service_images_admin/66470d03e8e43.FASHION DESIGNING.png', '2024-05-17 07:53:39'),
(59, 'FLATS', 'assets/vendor_assets/service_images_admin/66470d1d4268e.flats.png', '2024-05-17 07:54:05'),
(60, 'FLOORING CONTRACTORS', 'assets/vendor_assets/service_images_admin/66470d2f6ebfe.FLOORING CONTRACTORS.png', '2024-05-17 07:54:23'),
(61, 'FLOWERIST', 'assets/vendor_assets/service_images_admin/66470d4c2d4aa.FLOWERIST.png', '2024-05-17 07:54:52'),
(62, 'FURNITURE CONTRACTORS', 'assets/vendor_assets/service_images_admin/66470d6290a11.FURNITURE CONTRACTORS.png', '2024-05-17 07:55:14'),
(63, 'FURNITURE REPAIR', 'assets/vendor_assets/service_images_admin/66470d7907dd6.FURNITURE REPAIR.png', '2024-05-17 07:55:37'),
(64, 'GARDENERS', 'assets/vendor_assets/service_images_admin/66470d95131eb.GARDENERS.png', '2024-05-17 07:56:05'),
(65, 'GAS STOVE REPAIR', 'assets/vendor_assets/service_images_admin/66470da9af55f.GAS STOVE REPAIR.png', '2024-05-17 07:56:25'),
(66, 'GRAPHIC DESINER', 'assets/vendor_assets/service_images_admin/66470dbdea2f6.GRAPHIC DESINER.png', '2024-05-17 07:56:45'),
(67, 'GST', 'assets/vendor_assets/service_images_admin/66470dd2e8ee4.GST.png', '2024-05-17 07:57:06'),
(68, 'GYM COCHE', 'assets/vendor_assets/service_images_admin/66470debd33bd.GYM COCHE.png', '2024-05-17 07:57:31'),
(69, 'GYM CENTERE', 'assets/vendor_assets/service_images_admin/66470dfc8a6e7.gym.png', '2024-09-30 06:58:34'),
(70, 'HOBBIES&COLLECTIONS', 'assets/vendor_assets/service_images_admin/66470e1476a42.HOBBIES&COLLECTIONS.png', '2024-05-17 07:58:12'),
(71, 'HOME LOANS', 'assets/vendor_assets/service_images_admin/66470e5db98db.HOME LOANS (2).png', '2024-05-17 07:59:25'),
(72, 'HOUSE KEEPING', 'assets/vendor_assets/service_images_admin/66470e777f47e.HOUSE KEEPING.png', '2024-05-17 07:59:51'),
(73, 'INSURANCE ADVISOR', 'assets/vendor_assets/service_images_admin/66470ea1402d4.insurance advisor .png', '2024-05-17 08:00:33'),
(74, 'INTERIOR DESIGNERS', 'assets/vendor_assets/service_images_admin/66470ebab0653.INTERIOR DESIGNERS.png', '2024-05-17 08:00:58'),
(75, 'JEWELLERY', 'assets/vendor_assets/service_images_admin/66470edd04457.JEWELLERY.png', '2024-05-17 08:01:33'),
(76, 'LABOUR SERVICE', 'assets/vendor_assets/service_images_admin/66470efacceb8.labour.png', '2024-05-17 08:02:02'),
(77, 'LIC AGENT', 'assets/vendor_assets/service_images_admin/66470f17960da.LIC AGENT.png', '2024-05-17 08:02:31'),
(78, 'LIFT SERVICE', 'assets/vendor_assets/service_images_admin/66470f29eea07.LIFT SERVICE.png', '2024-05-17 08:02:49'),
(79, 'LOCK REPAIR', 'assets/vendor_assets/service_images_admin/66470f3e2f4de.LOCK REPAIR.png', '2024-05-17 08:03:10'),
(80, 'MAGGAM WORKS', 'assets/vendor_assets/service_images_admin/66470f53c1016.MAGGAM WORKS.png', '2024-05-17 08:03:31'),
(81, 'MAGICIAN', 'assets/vendor_assets/service_images_admin/66470f925ad29.MAGICIAN.png', '2024-05-17 08:04:34'),
(82, 'MAIDS', 'assets/vendor_assets/service_images_admin/66470fa448105.MAIDS.png', '2024-05-17 08:04:52'),
(83, 'MARKETING', 'assets/vendor_assets/service_images_admin/66470fbbd32f2.Marketing.png', '2024-05-17 08:05:15'),
(84, 'MARSHAL ARTS', 'assets/vendor_assets/service_images_admin/66470fd3bfa85.MARSHAL ARTS.png', '2024-05-17 08:05:39'),
(85, 'MEDICAL', 'assets/vendor_assets/service_images_admin/66470ff25eb0f.medical.png', '2024-05-17 08:06:10'),
(86, 'MEHANDI', 'assets/vendor_assets/service_images_admin/66471009425a4.MEHANDI.png', '2024-05-17 08:06:33'),
(87, 'MOBILE REPAIR', 'assets/vendor_assets/service_images_admin/664710380750e.MOBILE REPAIR.png', '2024-05-17 08:07:20'),
(88, 'MULTIMEDIA', 'assets/vendor_assets/service_images_admin/664710517e48e.multimedia.png', '2024-05-17 08:07:45'),
(89, 'MUSIC CLASSES', 'assets/vendor_assets/service_images_admin/6647106669f77.MUSIC CLASSES.png', '2024-05-17 08:08:06'),
(90, 'NUTRITION', 'assets/vendor_assets/service_images_admin/6647107c8ea77.newrtician.png', '2024-09-30 07:01:14'),
(91, 'NOTERY', 'assets/vendor_assets/service_images_admin/66471098584a5.NOTERY.png', '2024-05-17 08:08:56'),
(92, 'NUMEROLOGIST', 'assets/vendor_assets/service_images_admin/664710c2e257a.NUMEROLOGIST.png', '2024-05-17 08:09:38'),
(93, 'NURSING SERVICES', 'assets/vendor_assets/service_images_admin/664710d670fac.NURSING SERVICES.png', '2024-05-17 08:09:58'),
(94, 'PACKERS & MOVERS', 'assets/vendor_assets/service_images_admin/664710edad78c.PACKERS & MOVERS.png', '2024-05-17 08:10:21'),
(95, 'PAINTERS', 'assets/vendor_assets/service_images_admin/664711020912a.PAINTERS.png', '2024-05-17 08:10:42'),
(96, 'PAN ADHAR SERVICE', 'assets/vendor_assets/service_images_admin/6647111467574.PAN ADHAR SERVICE.png', '2024-05-17 08:11:00'),
(97, 'PC AND LAPTOP REPAIR', 'assets/vendor_assets/service_images_admin/66471128d3d3d.PC AND LAPTOP REPAIR.png', '2024-05-17 08:11:20'),
(98, 'PERSONAL LOANS', 'assets/vendor_assets/service_images_admin/6647113b5c5fc.PERSONAL LOANS.png', '2024-05-17 08:11:39'),
(99, 'PEST CONTROL', 'assets/vendor_assets/service_images_admin/6647115019ac3.PEST CONTROL.png', '2024-05-17 08:12:00'),
(100, 'PHOTOGRAPHER', 'assets/vendor_assets/service_images_admin/664711641842b.PHOTOGRAPHER.png', '2024-05-17 08:12:20'),
(101, 'PHYSIOTHERAPY', 'assets/vendor_assets/service_images_admin/66471178cb5f8.PHYSIOTHERAPY.png', '2024-05-17 08:12:40'),
(102, 'PLACEMENT SERVICES', 'assets/vendor_assets/service_images_admin/664711a995ae1.PLACEMENT SERVICES.png', '2024-05-17 08:13:29'),
(103, 'PLOTS', 'assets/vendor_assets/service_images_admin/664711bd1e714.plots.png', '2024-05-17 08:13:49'),
(104, 'PLUMBER', 'assets/vendor_assets/service_images_admin/664711d0e05df.PLUMBER.png', '2024-05-17 08:14:08'),
(105, 'POSTAL AGENT', 'assets/vendor_assets/service_images_admin/664711e627a8e.POSTAL AGENT.png', '2024-05-17 08:14:30'),
(106, 'PRINTING', 'assets/vendor_assets/service_images_admin/664711fb3830f.PRINTING.png', '2024-05-17 08:14:51'),
(107, 'PUROHITH', 'assets/vendor_assets/service_images_admin/6647121610e2a.purohith.png', '2024-05-17 08:15:18'),
(108, 'REAL ESTATE', 'assets/vendor_assets/service_images_admin/6647122ca5b49.REAL ESTATE.png', '2024-05-17 08:15:40'),
(109, 'REFRIGIRATION', 'assets/vendor_assets/service_images_admin/664712428d56d.REFRIGIRATION.png', '2024-05-17 08:16:02'),
(110, 'REGISTRATION CONSULTANTS', 'assets/vendor_assets/service_images_admin/6647129731de5.REGISTRATION CONSULTANTS.png', '2024-05-17 08:17:27'),
(111, 'REHABILITATION', 'assets/vendor_assets/service_images_admin/664712acdfb39.REHABILITATION.png', '2024-05-17 08:17:48'),
(112, 'REPORTER', 'assets/vendor_assets/service_images_admin/664712ce556a9.Reporter.png', '2024-05-17 08:18:22'),
(113, 'ROCK DRILLS', 'assets/vendor_assets/service_images_admin/664712e577693.ROCK DRILLS.png', '2024-05-17 08:18:45'),
(114, 'SALONS', 'assets/vendor_assets/service_images_admin/664712fb6f3de.SALONS.png', '2024-05-17 08:19:07'),
(115, 'SCRAP BUYERS', 'assets/vendor_assets/service_images_admin/66471331495c8.SCRAP BUYERS.png', '2024-05-17 08:20:01'),
(116, 'SCREEN PRINTER', 'assets/vendor_assets/service_images_admin/664713472327d.SCREEN PRINTER.png', '2024-05-17 08:20:23'),
(117, 'SECURITY SERVICES', 'assets/vendor_assets/service_images_admin/6647135eebfab.SECURITY SERVICES.png', '2024-05-17 08:20:46'),
(118, 'SEPTIC TANK CLEANER', 'assets/vendor_assets/service_images_admin/664713c3994c8.SEPTIC TANK CLEANER.png', '2024-05-17 08:22:27'),
(119, 'SOCIAL WORKER', 'assets/vendor_assets/service_images_admin/664713da75224.SOCIAL WORKER.png', '2024-05-17 08:22:50'),
(120, 'STAMP VENDOR', 'assets/vendor_assets/service_images_admin/664713f44042c.STAMP VENDOR.png', '2024-05-17 08:23:16'),
(121, 'STONE CRUSHER', 'assets/vendor_assets/service_images_admin/6647160a6c59a.STONE CRUSHER.png', '2024-05-17 08:32:10'),
(122, 'SURVEYOR', 'assets/vendor_assets/service_images_admin/6647162005497.SURVEYOR.png', '2024-05-17 08:32:32'),
(123, 'TAILOR', 'assets/vendor_assets/service_images_admin/664716648d232.TAILOR.png', '2024-05-17 08:33:40'),
(124, 'TAX CONSULTANT', 'assets/vendor_assets/service_images_admin/664716790c23b.TAX CONSULTANT.png', '2024-05-17 08:34:01'),
(125, 'TRANSPORTERS', 'assets/vendor_assets/service_images_admin/66471690c45b7.TRANSPORTERS.png', '2024-05-17 08:34:24'),
(126, 'TUTIONS', 'assets/vendor_assets/service_images_admin/664716a4a52c9.TUTIONS.png', '2024-05-17 08:34:44'),
(127, 'VALUERS', 'assets/vendor_assets/service_images_admin/664716ba6bfee.VALUERS.png', '2024-05-17 08:35:06'),
(128, 'VASTU', 'assets/vendor_assets/service_images_admin/664716d653a85.VASTU.png', '2024-05-17 08:35:34'),
(129, 'VEHICLES TRANSPORTERS', 'assets/vendor_assets/service_images_admin/664716ebcdacd.VEHICLES TRANSPORTERS.png', '2024-05-17 08:35:55'),
(130, 'VIDEOGRAPHER', 'assets/vendor_assets/service_images_admin/664717005a942.VIDEOGRAPHER.png', '2024-05-17 08:36:16'),
(131, 'VILLA', 'assets/vendor_assets/service_images_admin/664717120f3f8.villa.png', '2024-05-17 08:36:34'),
(132, 'VOCATIONAL TRAINING', 'assets/vendor_assets/service_images_admin/6647172b094f1.VOCATIONAL TRAINING.png', '2024-05-17 08:36:59'),
(133, 'WASHING MACHINE REPAIR', 'assets/vendor_assets/service_images_admin/6647175f35dc5.WASHING MACHINE REPAIR.png', '2024-05-17 08:37:51'),
(134, 'WATER TANKER', 'assets/vendor_assets/service_images_admin/664717730ab94.water tanker.png', '2024-05-17 08:38:11'),
(135, 'WEB TECHNOLOGY TRAINING', 'assets/vendor_assets/service_images_admin/6647178ae8235.WEB TECHNOLOGY TRAINING (2).png', '2024-05-17 08:38:34'),
(136, 'WEBSITE DESIGNERS', 'assets/vendor_assets/service_images_admin/664717a51d745.WEBSITE DESIGNERS.png', '2024-05-17 08:39:01'),
(137, 'WEDDING DECORS', 'assets/vendor_assets/service_images_admin/664717bb54c87.wedding decors.png', '2024-05-17 08:39:23'),
(138, 'YOGA TEACHER', 'assets/vendor_assets/service_images_admin/664717d72c8ec.YOGA TEACHER.png', '2024-05-17 08:39:51'),
(139, 'SHARE  CONSULTANCY', 'assets/vendor_assets/service_images_admin/685048aa6c615.pngtree-online-trading-stock-market-in-flat-png-image_6847830.png', '2025-06-16 16:39:06'),
(140, 'ACCOUNTANT', 'assets/vendor_assets/service_images_admin/668a9e1c87a29.AUDITORS.png', '2024-07-07 13:54:36'),
(141, 'LOANS', 'assets/vendor_assets/service_images_admin/684a6e5834abf.Financial Advisor 2.png', '2025-06-12 13:53:13'),
(142, 'FINANCIAL ADVISOR', 'assets/vendor_assets/service_images_admin/684b17bea40f5.revenue-agency-illustration-exclusive-design-inspiration_566886-454.avif', '2025-06-12 18:09:02'),
(143, 'APPAREL MANUFACTURER', 'assets/vendor_assets/service_images_admin/684fbb1196068.Apparel Manufacturer 1.png', '2025-06-16 06:34:57'),
(144, 'DR NATUROPATHY', 'assets/vendor_assets/service_images_admin/6853b5b303a4f.DR_Nachuropaty.png', '2025-06-19 07:01:07'),
(145, 'NETWORKER MLM', 'assets/vendor_assets/service_images_admin/6899a5bb56150.networker.jpg', '2025-08-11 08:11:39'),
(147, 'ORGANIC NATURAL', 'assets/vendor_assets/service_images_admin/68b44d29cadb9.ORGANIC NATURAL.png', '2025-08-31 13:24:57'),
(148, 'COOKWARE', 'assets/vendor_assets/service_images_admin/68c01122c7eca.OIP.jpeg', '2025-09-09 11:36:02'),
(149, 'AI SERVICES', 'assets/vendor_assets/service_images_admin/694901c9c2c0a.AI Services.jpg', '2025-12-22 08:31:05'),
(152, 'VISION BOARD', 'assets/vendor_assets/service_images_admin/6957eb74c2965.Untitled design (2).png', '2026-01-02 15:59:48'),
(153, 'DIAGNOSTIC', 'assets/vendor_assets/service_images_admin/69a1b7657e459.diagnostic centre F.png', '2026-02-27 15:25:25'),
(154, 'ENGINEERING SERVICES', 'assets/vendor_assets/service_images_admin/69a1b9e2236c4.ENGINEERING SERVICES FF.png', '2026-02-27 15:36:02');

-- --------------------------------------------------------

--
-- Table structure for table `servicesusers`
--

CREATE TABLE `servicesusers` (
  `SubscriptionID` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `ServiceID` int DEFAULT NULL,
  `SubscriptionStartDate` date DEFAULT NULL,
  `SubscriptionEndDate` date DEFAULT NULL,
  `ServiceName` varchar(255) DEFAULT NULL,
  `ServiceProvider` varchar(255) DEFAULT NULL,
  `ServiceType` enum('subscription','one-time') DEFAULT NULL,
  `SubscriptionPlan` varchar(100) DEFAULT NULL,
  `SubscriptionStatus` enum('active','expired','cancelled') DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `PaymentStatus` enum('paid','pending','refunded') DEFAULT NULL,
  `PaymentAmount` decimal(10,2) DEFAULT NULL,
  `RenewalFrequency` varchar(50) DEFAULT NULL,
  `AutoRenewal` tinyint(1) DEFAULT NULL,
  `NextRenewalDate` date DEFAULT NULL,
  `UsageHistory` text,
  `SubscriptionCancellationDate` date DEFAULT NULL,
  `CancellationReason` varchar(255) DEFAULT NULL,
  `ServiceStatus` enum('active','suspended','discontinued') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `servicesusers`
--

INSERT INTO `servicesusers` (`SubscriptionID`, `UserID`, `ServiceID`, `SubscriptionStartDate`, `SubscriptionEndDate`, `ServiceName`, `ServiceProvider`, `ServiceType`, `SubscriptionPlan`, `SubscriptionStatus`, `PaymentMethod`, `PaymentStatus`, `PaymentAmount`, `RenewalFrequency`, `AutoRenewal`, `NextRenewalDate`, `UsageHistory`, `SubscriptionCancellationDate`, `CancellationReason`, `ServiceStatus`) VALUES
(1, 10, 1, '2018-04-04', '2018-05-03', 'Posting Ads', 'Admin', 'subscription', '1050', 'active', 'UPI', 'pending', 1050.00, '1400', 10, '2015-04-02', NULL, NULL, NULL, 'active'),
(2, 10, 1, '2018-04-04', '2018-05-03', 'Posting Ads', 'Employee', 'subscription', '1050', 'expired', 'UPI', 'pending', 1050.00, '1400', 10, '2015-04-02', NULL, NULL, NULL, 'active'),
(3, 10, 1, '2018-04-04', '2018-05-03', 'Posting Ads', 'Admin', 'subscription', '1050', 'expired', 'UPI', 'pending', 1050.00, '1400', 10, '2015-04-02', NULL, NULL, NULL, 'discontinued'),
(4, 10, 1, '2018-04-04', '2018-05-03', 'Posting Ads', 'Manager', 'subscription', '1050', 'active', 'UPI', 'pending', 1050.00, '1400', 10, '2015-04-02', NULL, NULL, NULL, 'suspended'),
(5, 10, 1, '2018-04-04', '2018-05-03', 'Posting Ads', 'Product Servicer', 'subscription', '1050', 'active', 'UPI', 'pending', 1050.00, '1400', 10, '2015-04-02', NULL, NULL, NULL, 'discontinued'),
(6, 10, 1, '2018-04-04', '2018-05-03', 'Posting Ads', 'Admin', 'subscription', '1050', 'cancelled', 'UPI', 'pending', 1050.00, '1400', 10, '2015-04-02', NULL, NULL, NULL, 'suspended');

-- --------------------------------------------------------

--
-- Table structure for table `service_users`
--

CREATE TABLE `service_users` (
  `service_id` int NOT NULL,
  `member_name` varchar(30) NOT NULL,
  `member_phone` varchar(13) NOT NULL,
  `password` text NOT NULL,
  `open_password` varchar(200) NOT NULL,
  `user_profile_pic` text,
  `location` text NOT NULL,
  `cumulative_gross` varchar(20) NOT NULL,
  `commission_percentage` int NOT NULL DEFAULT '8',
  `back_two_back_balance` int NOT NULL DEFAULT '0',
  `referral_id` varchar(20) NOT NULL,
  `referral_by` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `joined_date` datetime DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `pincode` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `service_users`
--

INSERT INTO `service_users` (`service_id`, `member_name`, `member_phone`, `password`, `open_password`, `user_profile_pic`, `location`, `cumulative_gross`, `commission_percentage`, `back_two_back_balance`, `referral_id`, `referral_by`, `created_at`, `joined_date`, `address`, `city`, `state`, `pincode`) VALUES
(148, 'KUMARASWAMY  KOOCHANA', '7702381784', '$2y$10$UVSh6nbdpq1P7tAHFOtUYO.NTYxPMohGmg1zYgGb6zEQ3R2hcvvWq', '7702381784', 'assets/user_assets/images/69437dd6d8e71.IMG_20230120_101220.jpg', 'HYDERABAD', '600106', 20, 28074, '7702381784', 'admin', '2026-04-06 10:01:56', NULL, 'FLAT NO 501,AMEERPET', 'HYDERABAD', 'TELANGANA', '500073'),
(149, 'G RAMBABU', '9493142434', '$2y$10$nrBvCRn6duRCnV9fYqj9.uq1/6Cfr3j1SC1IPrON/GUiKluAnkdvC', '', '', 'ELURU', '500000', 20, 25000, '9493142434', 'admin', '2026-04-02 05:30:17', NULL, '', '', '', ''),
(150, 'SATHWIK KOOCHANA', '8522881144', '$2y$10$xZxe2Cx1Q.EZGtCkBvNGnuxaF.2SBxN7J9GM98v6xt0KsaakNmYJK', '8522881144', 'assets/user_assets/images/67381d50d41b0.9BC74D60-F5C8-4DAC-8F8A-F16275971B06.jpeg', 'HYDERABAD', '537200', 20, 25000, '8522881144', 'admin', '2026-04-02 05:30:17', NULL, 'HYDERABAD', 'Hyderabad', 'Telangana', '500073'),
(151, 'ADDMAGINDIA', '8522852201', '$2y$10$79MwHQ5euyvo3WKtYrd6kOAkCw0eX2s6KCp2QPs5CTc7g5MT6kJz6', '', '', 'HYDERABAD', '501000', 20, 25000, '8522852201', 'admin', '2026-04-02 05:30:17', NULL, '', '', '', ''),
(152, 'K SUCHARITHA VANI', '7730099707', '$2y$10$evQg5WAzEtys4AAXYEL8O.aBXKEZYAsAvMOMxiIOdTUGN1WDW2ob6', '', '', 'HYDERABAD', '520911', 20, 25000, '7730099707', 'admin', '2026-04-02 05:30:17', NULL, '', '', '', ''),
(153, 'K.KOUSHIK KUMAR', '9666386006', '$2y$10$qcDXsoNuYT1Y6gv/NqWQSegXLWBtZtGRjwokW4B18tctqjhiASRz2', '9666386006', '', 'HYDERABAD', '500000', 20, 25000, '9666386006', 'admin', '2026-04-02 05:30:17', NULL, 'Ameerpet', 'Hyderabad', 'Telangana', '500073'),
(154, 'NIMMANAGOTI VENKANNA', '9705403403', '$2y$10$cv9HHPsFOIYq6U0jK58d2eW5yKqsfGq/K8tGsZvUev8c.YGUUT.TK', '', '', 'SURYAPET', '0', 8, 0, '9705403403', '7702381784', '2026-04-02 05:30:17', NULL, '', '', '', ''),
(155, 'THOUTAM MARKANDEYA', '9381477148', '$2y$10$ee122KFB3vyiVaJG3/YfJed2g7xljAOLJFwNad.VXwd4n458iz2BW', '', '', 'WARANGAL', '0', 8, 0, '9381477148', '7702381784', '2026-04-02 05:30:17', NULL, '', '', '', ''),
(156, 'GUNDA NARENDER', '8341236520', '$2y$10$yWpLG8CiDrwbt2fv04Yg6.p/12V48HH4UN0yM5rX37BO1GfDu835S', '', '', 'HYDERABAD', '0', 8, 3000, '8341236520', '7702381784', '2026-04-02 05:30:17', NULL, '', '', '', ''),
(157, 'CHANDRA SHEKAR ANTS', '9122444111', '$2y$10$nlVcHzI8a1iOLHOCebqeYewcYb1Dn9dDr4K.icIJ2VACo2jI63YZe', '', '', 'HYDERABAD', '0', 8, 3000, '9122444111', '7702381784', '2026-04-02 05:30:17', NULL, '', '', '', ''),
(158, 'PASULA SRINIVAS', '8185043756', '$2y$10$AgQT0Ay5Ttjs7YixzYkbBeEDQZgWm19p6FZ/MsUIpbOqS3g3Q57eu', '', '', 'HYDERABAD', '0', 8, 3000, '8185043756', '7702381784', '2026-04-02 05:30:17', NULL, '', '', '', ''),
(159, 'RAVI KUMAR KMM', '9848158964', '$2y$10$Btk.HtJkbwfDxYq/kZhiDOeO/a4B8/m9zDC/gL8T/i4DkQKnChAlS', '', '', 'KHAMMAM', '0', 8, 3000, '9848158964', '7702381784', '2026-04-02 05:30:17', NULL, '', '', '', ''),
(160, 'SIDDOJU MANOJ KUMAR', '9963699888', '$2y$10$KIJY6woCpVAeLg5VVYFiVe/LN8vPfrWMMe5NPP92yyc2MxzAcWleq', '', '', 'WARANGAL', '0', 8, 10000, '9963699888', '7702381784', '2026-04-02 05:30:17', NULL, '', '', '', ''),
(161, 'SARIPALLI RAMAKRISHNA', '9291333857', '$2y$10$C5jVL7JfR5HWAIuIEq0pqOCbb.k8VcdiZIAnrmhNNBt5sEAsQ019O', '', '', 'HYDERABAD', '0', 8, 10000, '9291333857', '7702381784', '2026-04-02 05:30:17', NULL, '', '', '', ''),
(162, 'VENKATANARAYANA', '9963699889', '$2y$10$upi9p.SGG2hghxqw5QUtSOROA7jqpauO0gqrHlh8oy1M621duJV2a', '', '', 'WARANGAL', '0', 8, 10000, '9963699889', '7702381784', '2026-04-02 05:30:17', NULL, '', '', '', ''),
(163, 'VEERAGONI RAMESH GOUD', '9963685349', '$2y$10$DfTper.E3cv7m1V8B69bDu8.GROQbuyeyBA9xtD7qi.ayMyHRtwmy', '', '', 'HYDERABAD', '0', 8, 10000, '9963685349', '7702381784', '2026-04-02 05:30:17', NULL, '', '', '', ''),
(164, 'VEENA SARASWATHI 1', '9866698653', '$2y$10$oxi770FUNRcUfpyxUPzDVu5KT21JT/jYQ.BZZjGR6B6BjajlTocdO', '', '', 'HYDERABAD', '0', 8, 6000, '9866698653', '7702381784', '2026-04-02 05:30:17', NULL, '', '', '', ''),
(165, 'MEESA RAJESWARRAO', '7674992736', '$2y$10$TfddJAWhAEpbtT2GEZrZPOpQUwZcKThp3Hy4lbPkh3/pITlqFkiUu', '', '', 'KHAMMAM', '1000', 8, 10000, '7674992736', '7702381784', '2026-04-02 05:30:18', NULL, '', '', '', ''),
(166, 'BOMMIDI MURALI', '6281973379', '$2y$10$lfpRHp3eymzeUPI3zFHic./tMa4iji.OaYFKGRDwGPnkLNkO4XKoe', '', '', 'KHAMMAM', '0', 8, 10000, '6281973379', '7702381784', '2026-04-02 05:30:18', NULL, '', '', '', ''),
(167, 'SHAIBA UNNISA', '9052124786', '$2y$10$Eq/dmzSwT106oiguQG3sveKvidhAZkEDlbAcTSEPfDu1CaxBOjhP6', '', '', 'HYDERABAD', '0', 8, 10000, '9052124786', '7702381784', '2026-04-02 05:30:18', NULL, '', '', '', ''),
(168, 'BUDHI SHARATH KUMAR', '9390596123', '$2y$10$qAryx6xgwRVQFCgApSe0kemdSRZwpJl2Fl2bVcttoxw35UZ7GeXt2', '9390596123', '', 'HYDERABAD', '42000', 14, 9000, '9390596123', '7702381784', '2026-04-02 05:30:18', NULL, 'HYDERABAD', 'Hyderabad', 'Telangana', '500083'),
(169, 'N V NARAYANA RAO', '9110540771', '$2y$10$zlCeFA8PMFqZkao9hdGXdu4Ovjr6Cu7ouNCtEnhap0YhIxCUze3gi', '', '', 'KHAMMAM', '0', 8, 10000, '9110540771', '7702381784', '2026-04-02 05:30:18', NULL, '', '', '', ''),
(170, 'SYAM RAJSHEKAR', '9553396070', '$2y$10$NSP8CKNc..yo.h5oWUzu0ue4dlPyHn6kZLH/Dn/Di6VUFM5TSeHee', '', '', 'KHAMMAM', '0', 8, 0, '9553396070', '7702381784', '2026-04-02 05:30:18', NULL, '', '', '', ''),
(171, 'A.NARAYANA', '9000914844', '$2y$10$bpRTFwc6eWiXi9PDPy5R7u9I2L.gySHQwTBix8XTqQsVsjhbWnQgq', '', '', 'SURYAPET', '0', 8, 10000, '9000914844', '9705403403', '2026-04-02 05:30:18', NULL, '', '', '', ''),
(172, 'BENJARAPU NAGARAJU', '9985267112', '$2y$10$QX7tOAxvoDmA9Bom.QRhuud5suH71xroyO5HKQ3027DyHUOuAmJci', '', '', 'SURYAPET', '0', 8, 10000, '9985267112', '9705403403', '2026-04-02 05:30:18', NULL, '', '', '', ''),
(173, 'YELAKANTI BALAKRIISHHNA', '7799673173', '$2y$10$.lz5sKpHXjXqZI8HdwJKaOoZVSpi4dK4dE3G0qqftg25/k/DXPDpC', '', '', 'SURYAPET', '0', 8, 10000, '7799673173', '9705403403', '2026-04-02 05:30:18', NULL, '', '', '', ''),
(175, 'SARANGAPANI', '9390109778', '$2y$10$9cvjvuD6/JEc/OXxY4dbxOwMXcDJqZHwal8MdnlZEk4b3j82fu9ra', '', '', 'WARANGAL', '0', 8, 0, '9390109778', '9381477148', '2026-04-02 05:30:18', NULL, '', '', '', ''),
(176, 'BAIAH SRIDHAR', '9676748117', '$2y$10$bgypTg7FDTShQ2PoSDmY1O8FLzGOSQdosgvIAN4HyFQ6L52UJhGcq', '', '', 'WARANGAL', '0', 8, 3000, '9676748117', '9885569568', '2026-04-02 05:30:18', NULL, '', '', '', ''),
(177, 'PERUMANDLA SRIDEVI', '9494783202', '$2y$10$ZcPcwPhdbfMX8S3ZeQjar.su4ogtiyRhx/A3N1g4vqs4E9JrTmjpu', '', '', 'WARANGAL', '0', 8, 10000, '9494783202', '9885569568', '2026-04-02 05:30:18', NULL, '', '', '', ''),
(181, 'G ESWARA CHARI', '9502777559', '$2y$10$3p259YPqPSF9d3F4M8Ptsefm7tSlgAs8OqSuVYVayeTki77ZcbMNi', '', '', 'ELURU', '0', 8, 0, '9502777559', '9493142434\r\n', '2026-04-02 05:30:18', NULL, '', '', '', ''),
(182, 'G JYOTSNARANI', '9441142434', '$2y$10$qX8wzBE8tVaaeKroPB3pfOAgEyAmduEMI/wn9H144TWuEPqXTjaCG', '', '', 'ELURU', '0', 8, 25000, '9441142434', '9493142434', '2026-04-02 05:30:18', NULL, '', '', '', ''),
(183, 'N BHAVANI', '8328204155', '$2y$10$bONnGEyoHEZ1wN/uI.KcNud1d8Ylb2lp9SVBZdFnEtztjpxbK7gtS', '', '', 'ELURU', '0', 8, 0, '8328204155', '9493142434', '2026-04-02 05:30:19', NULL, '', '', '', ''),
(184, 'K.ANIL KUMAR LIC POLICY', '8861787387', '$2y$10$4EgeTsZyhHaWyb68.zeAfug0QQED2kbYYG1aJlFttEGjr/Qdnh5fe', '', '', 'WARANGAL', '0', 8, 5000, '8861787387', '8522881144', '2026-04-02 05:30:19', NULL, '', '', '', ''),
(185, 'ADEPU KIRANKUMARI LIC POLICY', '7013085763', '$2y$10$Aj1.K7h6A39DvUy.xz/C5O5OSGyLCvTfiLmbX8bKThzaDb5Bg9n/a', '', '', 'WARANGAL', '0', 8, 5000, '7013085763', '8522881144', '2026-04-02 05:30:19', NULL, '', '', '', ''),
(186, 'VEMULA SRIVISHNU LIC POLICY', '7036929452', '$2y$10$PXHbsG10ABfswdB/dOMImeF0pWHe8kVEnkBSx5IH/eMF0xJNmEMtC', '', '', 'WARANGAL', '0', 8, 5000, '7036929452', '8522881144', '2026-04-02 05:30:19', NULL, '', '', '', ''),
(187, 'KOOCHANA SATHISH', '8978747504', '$2y$10$7ed9HVLBviKoPbzCKPbUZ.XzWTHkLAsu.kdxDX/XdebU.9t0sOp12', '', '', 'WARANGAL', '0', 8, 5000, '8978747504', '8522881144', '2026-04-02 05:30:19', NULL, '', '', '', ''),
(188, 'Admin', '99999', '$2y$10$Z83UwO82.H5wuy973R2QeOJX50BvFGFEPxIOEDSYkwBSeWcwwnYh2', '', '', 'Hyderabad', '334167', 8, 0, 'admin', 'admin', '2026-04-06 10:01:56', NULL, '', '', '', ''),
(189, 'AKHIL BASANI LIC PLOICY', '7396700181', '$2y$10$cDkl4BTfSD0B3eHk0rC9ueW6ENMjQDmEwIqpe/2OzpS3OUP796g7u', '', '', 'WARANGAL', '0', 8, 5000, '7396700181', '8522881144', '2026-04-02 05:30:19', NULL, '', '', '', ''),
(190, 'K KANAKA RATNAM NOVA', '9121933877', '$2y$10$SVAQBBCj6SKbeOkXl7KtbOHAAk5FHW2YMUq5ssT0B1HsNwSVuRfN.', '', '', 'WARANGAL', '0', 8, 25000, '9121933877', '8522881144', '2026-04-02 05:30:19', NULL, '', '', '', ''),
(191, 'VENGALA SATYANARAYAN', '9705217097', '$2y$10$kTYlhbfjCLT4tm64VhiIAuSBPY75IDuTOgiQXngyliuYlIq9fynsC', '', '', 'WARANGAL', '0', 8, 3000, '9705217097', '8522881144', '2026-04-02 05:30:19', NULL, '', '', '', ''),
(192, 'SHESHAGIRI RAO', '9705065946', '$2y$10$FCMbWjaQfZQH62DitkblquJmpgSrOYYJYsELxniCeJ4.TODM/gpnS', '', '', 'HYDERABAD', '0', 8, 3000, '9705065946', '8522881144', '2026-04-02 05:30:19', NULL, '', '', '', ''),
(193, 'EAGA RAMESH', '9704217615', '$2y$10$KJxdqyPc/QvySWzmEwGGjOlpfPWARsh4dm/ZAhCpxOFkS/2OTRr7e', '', '', 'WARANGAL', '0', 8, 3000, '9704217615', '8522881144', '2026-04-02 05:30:19', NULL, '', '', '', ''),
(194, 'MD.SHAKEELUDDIN', '8919378055', '$2y$10$sKFOY4gcCQpH72FlRyYq.ep0R1GrNdIJXdJAKVYug5kOm6cR2YTTm', '', '', 'HYDERABAD', '0', 8, 3000, '8919378055', '8522881144', '2026-04-02 05:30:19', NULL, '', '', '', ''),
(195, 'CHENNAMANENI', '9652571234', '$2y$10$kzJ4Eoag7wLp.6jjpgAG7OdGNm0qqGdJtXXPDK7coNxRKWmpxIMje', '', '', 'HYDERABAD', '0', 8, 15000, '9652571234', '8522881144', '2026-04-02 05:30:19', NULL, '', '', '', ''),
(196, 'CHENNAMANENI SRILATHA', '9010702476', '$2y$10$9Mpaf0mwn2oU8ZJ47Mjfc./XO4EKlfIey/EsnEl46U4hlldXGigEi', '', '', 'HYDERABAD', '0', 8, 15000, '9010702476', '8522881144', '2026-04-02 05:30:19', NULL, '', '', '', ''),
(197, 'CHENNAMANENI SRILA', '9966066662', '$2y$10$eKo/e2j6kw1RHV5OCMAzUu70eSEiCcb2KWDwjInX0ho4M2AT.VCMi', '', '', 'HYDERABAD', '0', 8, 15000, '9966066662', '8522881144', '2026-04-02 05:30:19', NULL, '', '', '', ''),
(198, 'CH BHARATHI ADITHYA', '7447105920', '$2y$10$oacHYaB6GF/ZhsHov02b4e8ohUIsibQfY7.emhzx8.r4z2sLyvopC', '', '', 'HYDERABAD', '0', 8, 15000, '7447105920', '8522881144', '2026-04-02 05:30:19', NULL, '', '', '', ''),
(199, 'G.LAXMAN', '9603525231', '$2y$10$O1pRiXAshlyF1m1GYWaaxu.oj.UbCM8UlRl.sKOEXiT1IklQa0vkO', '', '', 'Hyderabad', '0', 8, 25000, '9603525231', '9493142434', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(201, 'P VIJAY SEKHAR LIC POLICY', '8106024624', '$2y$10$Pjd.0izfEQFTPZSLL/0uwe4r2ZSyirw55VJ8TAd4i9Yr6SzlwzpPK', '', '', 'KHAMMAM', '0', 8, 8000, '8106024624', '8522881144', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(202, 'GANAPURAM RAMESH', '9390054229', '$2y$10$diDpw28vYcmTXG2Jyr/f1eHevu35vbDSrmebWqa3KDyPL.PTUx1Zm', '', '', 'WARANGAL', '0', 8, 25000, '9390054229', '8522881144', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(203, 'GANAPURAM SRIDEVI', '9391054229', '$2y$10$XVTtvfSrkqzc8iXqHH7iYuD3qFJZyapMKwFQiYNXzeU/Y9qzy.b2q', '', '', 'WARANGAL', '0', 8, 25000, '9391054229', '8522881144', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(204, 'K.ANNAPURNA LIC POLICY', '9553612355', '$2y$10$95FUL1iVRpFUuHoJO4lAzONR8RsgG1qdsMvRVTRuXuXWsaVaba/Ti', '', '', 'WARANGAL', '0', 8, 5000, '9553612355', '8522881144', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(205, 'GANAPURAM KRANTHI', '9849671203', '$2y$10$9TrL.fOQHnAWMlqb2CcFp.5PdoLN0dVZh6hScXd2VhFT2OlgzCMqS', '', '', 'WARANGAL', '0', 14, 25000, '9849671203', '8522881144', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(206, 'ANIL BOMBAY LIC PLOICY', '9167780797', '$2y$10$BEqu8PldJELKuYw7i1RB7u9f0iB/RVdrxHyF2KhDmmWMoKpwB/UOm', '', '', 'MUMBAI', '0', 8, 5000, '9167780797', '8522881144', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(207, 'SAIKRISHNA', '7207462300', '$2y$10$2YGCuRgw6/UzpyIIYqPG4.FeGwt07Joml/7RDXH2hF7l21RV8sx9S', '', '', 'HYDERABAD', '1000010', 20, 25000, '7207462300', '8522881144', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(208, 'MUNNANGI NARANDRA REDDY', '9849093509', '$2y$10$8LzIxYyGNL4eyibYUay15uVoFdLuLAri23ZpDWHQYOHUBxX.Aszhe', '', '', 'VIJAYAWADA', '0', 8, 10000, '9849093509', '8522852201', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(209, 'R SRINU', '9912485445', '$2y$10$3P9dpfLhvnybPoBho0TwYuhMBgUZnHPMNbE2C8Qw5pPzPf6Smj78.', '', '', 'SURYAPET', '0', 8, 10000, '9912485445', '8522852201', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(210, 'NADIMPELLI SATHISH', '8500083680', '$2y$10$jV.YFCNloaYCodJoLOBRQ.UxH2Pf83gt5QPA9l.89rj9hfywnHe0m', '', '', 'VIJAYAWADA', '1000', 8, 0, '8500083680', '8522852201', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(211, 'Kambampati Sheela', '8500415019', '$2y$10$IGHmtusI2kKAipyXW63/sOrts.T18NXkxXvLDEc02KoyvwIp2u3.6', '', '', 'VIJAYAWADA', '0', 8, 10000, '8500415019', '8522852201', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(212, 'EEMANI SRINIVASARAO', '7013427287', '$2y$10$4OLT8KnWO/EDsbT293CEz.MvHp9bqm/gSA4TrOn1Mca.sHK9kse1S', '', '', 'VIJAYAWADA', '0', 8, 6000, '7013427287', '8522852201', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(213, 'SWAROOP MARUPUDI', '9246492585', '$2y$10$cgV5QAQ69UDX/MoD6BNqVeeGQnH6Q5XaNX4529cqSXfFRmbVzqaJO', '', '', 'VIJAYAWADA', '1000', 8, 0, '9246492585', '8500083680', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(214, 'KUNDAM DANIEL MATHEW', '8639659080', '$2y$10$jHNGlYm.58Ns9JjPStLY5OJBOGJGAkUe6uicdt6tydD0nxWKlYMgu', '', '', 'VIJAYAWADA', '0', 8, 10000, '8639659080', '8500083680', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(215, 'KATTULA RAJESH', '9030090605', '$2y$10$QtMCYDWjPXgrW/NSQnT4XuWv7fAFO6L5L80HARJwZosA3kPCUHfzC', '', '', 'VIJAYAWADA', '0', 8, 3000, '9030090605', '8500083680', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(216, 'GUMMALLA ANNAPURNA', '6300987728', '$2y$10$5b0VbU7zcOiZYDN0Xibx2.FV.SzEqGsnt4N3PcrTQSlTpkBYr2xZ6', '', '', 'VIJAYAWADA', '0', 8, 3000, '6300987728', '8500083680', '2026-04-02 05:30:20', NULL, '', '', '', ''),
(217, 'KONA KUMARI', '9912048630', '$2y$10$mJ6RAQnY91uZYHtXb6NBhuHee/FhVmVD3qmxVttNnrNdU.tWK07LK', '', '', 'VIJAYAWADA', '0', 8, 3000, '9912048630', '8500083680', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(218, 'GUJJALA APPA RAO', '9912484668', '$2y$10$c20Mz5MPxv8o.PvX5ex8/eV7iJxLsqguUKRSJxopUM1j1QH4dHVFy', '', '', 'VIJAYAWADA', '0', 8, 3000, '9912484668', '8500083680', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(219, 'N VENKTESH', '9246484468', '$2y$10$OBinDSOmm./bQa8Cc3W2Ie1D0OiNGpnVxEPFkAyEEuLydcFcBxOIK', '', '', 'GUNTUR', '0', 8, 6000, '9246484468', '9246492585', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(220, 'SANKA LAKSHMI SYAMALA', '8074208767', '$2y$10$aIVTvGCaSNYfA1jDvRm2W.M12ea1ZYm7b.aRp13L4NZUuObPQ8eSG', '', '', 'GUNTUR', '1000', 8, 10000, '8074208767', '9246492585', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(221, 'RAVI BUSI', '9059115854', '$2y$10$RxHGP3fO0hNr33d7Qb865O6jrHZh0ZdxrCBqraTb2TNE.lA10rizK', '', '', 'GUNTUR', '0', 8, 10000, '9059115854', '8074208767', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(222, 'CH.V.V.BRAHMESWARA RAO', '9493153279', '$2y$10$JAViMGDdeeTGML7enMPvuuujvqp1e0XEfjvp94oWxfj0DvPCFod/K', '', '', 'GUNTUR', '0', 8, 10000, '9493153279', '8074208767', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(223, 'CHALASANI KAMALA KUMARI', '8179583685', '$2y$10$J9u3BmcZ5KXgAEPPnFlCceKfouGz6wOkNRrpyVqNDL5B7RjJwwpea', '', '', 'VIJAYAWADA', '0', 8, 10000, '8179583685', '8074208767', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(224, 'GARIGIPATI YEKANADH', '7989983472', '$2y$10$n2LZD9O/D.jqIYjmkV3jXeFPm8HNaXEiqj7kwMKYrn3UgZw/jrzfi', '', '', 'VIJAYAWADA', '0', 8, 7000, '7989983472', '8074208767', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(225, 'GANGADHARAM PALLIPATTU', '9441557447', '$2y$10$mE4UEKH04zczlOqEAQyQAuTnF4NmX4R1L3/jEJTKUCRWv8rv6.jLW', '', '', 'GUNTUR', '1000', 8, 10000, '9441557447', '8074208767', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(226, 'ANIL REPRESENTATIVE', '7989442292', '$2y$10$6GKVSzrxJQGE6uwNl9FbR.gOMipsE.ZDw7qiL1chtT.tAq2hn8EzK', '', '', 'GUNTUR', '0', 8, 10000, '7989442292', '9246484468', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(227, 'RAMAKRISHNA REDDY', '9063665148', '$2y$10$RbTTtw4H5.FtARTrk4wZDuLqdiB3Hgy2FB7MnZlfpMsO7zdPofeWC', '', '', 'GUNTUR', '0', 8, 10000, '9063665148', '9246484468', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(228, 'BALAVARMA KAMINENI', '8341183101', '$2y$10$VXVz1w2bFFoYWztQbYYYQewfO0ePn4oY4iXZVm5NUO/Y6WSJbG1L6', '', '', 'GUNTUR', '0', 8, 10000, '8341183101', '9246484468', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(229, 'GANAPATHI REDDY', '7799658856', '$2y$10$bfMOAO31x40xEoYgEg91Yeuq5HJxvYysU9nPwTTEm6btW//2rm5s2', '', '', 'GUNTUR', '0', 8, 10000, '7799658856', '9246484468', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(230, 'PRASADA RAO G', '9291290683', '$2y$10$zRBlBaCeY2/mAPwFZZ/HXuH/Pb4QQIcGDOnJKamYTgl/GYO3WzFce', '', '', 'GUNTUR', '0', 8, 6000, '9291290683', '9246484468', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(231, 'G CHANDRA SHEKAR', '9010054126', '$2y$10$xIClb.EUlAcdvywtvkINWOsyRvagW/p61NLc7No8ReBIBgN5c75DW', '', '', 'GUNTUR', '0', 8, 6000, '9010054126', '9291290683', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(232, 'KRISHNA SUNDEEP B', '9292202223', '$2y$10$R/j./cWJxcJrNBBSdUxg9O07HUCCtUlstMrMt6bwoiIfzGdOsFsAq', '', '', 'GUNTUR', '0', 8, 25000, '9292202223', '9291290683', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(233, 'SRIDEVI GUNTUR', '9246464844', '$2y$10$GTlerH0KrMSqO4G5Y3dO9.EXkKysGSNw.Z5aBbR7x4Yu2ftJXBVce', '', '', 'GUNTUR', '0', 8, 18000, '9246464844', '9291290683', '2026-04-02 05:30:21', NULL, '', '', '', ''),
(234, 'ZAMEER SK 1', '9948708158', '$2y$10$2YF60AijOk6QQ5Pw0zeUQ.30ofzWoRV5cMMHlUVQ/731/6rhZqtI2', '', '', 'GUNTUR', '0', 8, 10000, '9948708158', '9291290683', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(235, 'DEVI SHANKAR HDFC', '9000970908', '$2y$10$GvtTp4JFzKBgk0XnRRsxZ.4ATqoH8qNtTO.Au0IBWAyrvK4Ro7YCW', '', '', 'VIJAYAWADA', '0', 8, 18000, '9000970908', '9291290683', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(236, 'PONNAPALLI LAASYA RAAGAMAALIKA', '8688070075', '$2y$10$zDp4yAdeBfO6lC/jubFpYukIlblrKWx6IThvkIAZVas/1CAk/FRnq', '', '', 'VIJAYAWADA', '0', 8, 10000, '8688070075', '7013427287', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(237, 'GADAGOTI SRINIVASARAO', '7382904573', '$2y$10$.E9UhOAUL5tVNNjXL7jsQOBif7fd8dRwhVZS7wjfi9aO/6/miM9ie', '', '', 'VIJAYAWADA', '0', 8, 10000, '7382904573', '7013427287', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(238, 'R. RAJASEKHAR', '9866662791', '$2y$10$MY7beO7W5BsnFZELAZszye2m6SjDo224BZYTQwR4hAlzycj39B8yi', '', '', 'VIJAYAWADA', '0', 8, 10000, '9866662791', '7013427287', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(239, 'POTHAKAMURI JEJIBABU', '7377793777', '$2y$10$0WemBZJVLomiNxkzN8SLuOc8eBWsmjwOjEeCmt.8TtrAFPOAIvFey', '', '', 'VIJAYAWADA', '0', 8, 10000, '7377793777', '7013427287', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(240, 'R L NAGARANI', '9652657722', '$2y$10$eFzCDRhb8qLkFMpSq4odu..17rz.sUm85KtM19ojHV0zPsv8eSFY.', '', '', 'VIJAYAWADA', '0', 8, 0, '9652657722', '9866662791', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(241, 'R. AJAY', '8328093037', '$2y$10$RP3nl6Cr1WspYBBfYS/ZruxIpGij.K8B94BsxmJt8eppiErN9dj5a', '', '', 'VIJAYAWADA', '0', 8, 0, '8328093037', '9866662791', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(242, 'VINAY SUJATHAKKA', '9880858162', '$2y$10$HMaNhmGFfrw8yUNT2ggXjet/q6CNVAvrcZrWTnjlH4/gjk/8mf1wm', '', '', 'WARANGAL', '0', 8, 25000, '9880858162', '7730099707', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(243, 'KOOCHANA ARUNA', '9642467880', '$2y$10$MNU9KO8gfHh2SGk9vND0Vuq9XXANWB3pzSLgj4sue9/KCJLCclEYy', '', '', 'WARANGAL', '0', 8, 25000, '9642467880', '7730099707', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(244, 'KOOCHANA DEVENDER', '9390100602', '$2y$10$EjM2b0INAt9yzK0b5G003OGeDv1SpUHZAca3ultEL8C9bvx56.vxO', '', '', 'WARANGAL', '0', 8, 25000, '9390100602', '7730099707', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(245, 'PRABHAKAR VESTAGE', '9390785865', '$2y$10$1eewyMSfOSuy8HgjHgiQIOIh60/0AR4R4CiCqob2fdZI1KIDaTqZy', '', '', 'WARANGAL', '0', 8, 0, '9390785865', '7730099707', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(246, 'RAYES SHOBHAN', '7396783499', '$2y$10$Pxex76eVfg/brh3QSP14EOEpb1mV5dkGNJx3kvCPe0IoF5HKSaHa6', '', '', 'HYDERABAD', '3000', 8, 3000, '7396783499', '7730099707', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(247, 'P LAXMANASWAMY', '8919793099', '$2y$10$pVA5iIeRkIBXJJNOWLOxsuBOACUDqcq2uePPJAvw50nCfZszz3m5q', '', '', 'HYDERABAD', '0', 8, 0, '8919793099', '7730099707', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(248, 'KANUKUNTLA RAJENDER', '9014858329', '$2y$10$EgMhSRZfPluQp9DmNaa2xuTpzUfvOqE9zKzeWy7pKK8cYJNWjt8mm', '', '', 'HYDERABAD', '0', 8, 0, '9014858329', '7730099707', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(249, 'TEMBARENI ANIL KUMAR', '9989225258', '$2y$10$TEipyrhqTT7fdxlsJa/b4eLkJY1iGfQvxx0ILEF/dr61uLRLODsIG', '9989225258', '', 'WARANGAL', '4000', 8, 0, '9989225258', '7730099707', '2026-04-02 05:30:22', NULL, 'H. NO .5-9-106, KISHANPURA ,', 'HANAMKONDA', 'TELANGANA', '506001'),
(250, 'AVM SATYANARAYANA', '8019592844', '$2y$10$/udWuF5Vynziae2HiLIaSOKj3wiumwbJoFcSFQZLOkR5GsBZhsgmi', '', '', 'HYDERABAD', '100010', 14, 13550, '8019592844', '7730099707', '2026-04-02 05:30:22', NULL, '', '', '', ''),
(251, 'ADUPA LAXMAN RAO', '9346005330', '$2y$10$vBX.u9tqYCs.N4kiEMkgkO7SuYFynNTdazy6P/a775utpEv/P07wy', '', '', 'WARANGAL', '0', 8, 5000, '9346005330', '7730099707', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(252, 'K KISHAN RAO', '9490534100', '$2y$10$RfsH7djWM14PzoTiICsxjOgXwTdrEmcB/.mOwGCnxLgcNENtulKYy', '9490534100', 'assets/user_assets/images/66f247e35e2af.kishanrao.png', 'HUZURABAD', '9461', 8, 7518, '9490534100', '7730099707', '2026-04-02 05:30:23', NULL, 'vill; GODISHALA    MDL; SAIDAPUR', 'HUZURABAD', 'TELANGANA', '505468'),
(253, 'RAMU KOLANUPAKA', '9849855489', '$2y$10$.m87Av3WucqK3Cw12CPwHungcIWFNC3694ibBZB1aexfvQBjccYFO', '', '', 'HYDERABAD', '0', 8, 0, '9849855489', '7730099707', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(254, 'KOOCHANA CHANDU', '9494970151', '$2y$10$K.X5jM1WS3ZzsucMuwalqOTve4P7O8cqLKNBlqA.d3SJQ.Ej6ygxi', '', '', 'WARANGAL', '0', 8, 0, '9494970151', '7730099707', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(255, 'K SRINIVAS  HUZBAD', '8177958146', '$2y$10$/K7yDi59dHEhIqlr2tktNe9HNwQCL9jKF8H5CX0.ClFLh9SbZUR5.', '', '', 'WARANGAL', '0', 8, 0, '8177958146', '7730099707', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(256, 'D BIKSHAPATHI', '9908983137', '$2y$10$BC38Pd2VkLJNTygNgwiMHuJx2J3lkTosR11FeO1W8dzA2OZnuhPYG', '', '', 'WARANGAL', '0', 8, 0, '9908983137', '7730099707', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(257, 'S RAJA RAO', '9642190501', '$2y$10$lKA6MwuNH4BTbX6k8bQ2yeVFtYptta1pPUD0QEDzaxEsiHbAJp326', '', '', 'GUNTUR', '0', 8, 0, '9642190501', '7730099707', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(258, 'K RAMANI', '9703219936', '$2y$10$PMUw.U8XKSsAHlxmDuMwEufpVu1beoeY7x7A0E6Hz1nYM3Kie3OYC', '', '', 'HYDERABAD', '1000', 8, 0, '9703219936', '7730099707', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(259, 'NAGARJUNA REDDY', '9032311355', '$2y$10$EGCx0vpa1bNmy.qialhOj.F.q0O0u4PFbCcFDDQDz6E9iY/fNaQzG', '', '', 'HYDERABAD', '0', 8, 0, '9032311355', '9989225258', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(260, 'M PRAKASH', '8297818858', '$2y$10$ChLp6xqvCTaE.OjLtuJtYuq4Z9WFj8t5hRA.F0mgpIQXPhmRbXlSO', '', '', 'HYDERABAD', '0', 8, 3000, '8297818858', '9989225258', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(261, 'SWAMIDAS', '8331012516', '$2y$10$aTaBWmXubWUvNpxmh84hK.Idr2VlR7rkgwIwOsDvABC6nQxfIgWsm', '', '', 'HYDERABAD', '0', 8, 0, '8331012516', '8297818858', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(262, 'KHAYYUM', '9849440534', '$2y$10$3gGGdW/jEPf41pxJ7B1ZmO9yUwocKDrclA1gPs.GDAQBOhTvxAq2S', '', '', 'HYDERABAD', '0', 8, 0, '9849440534', '8297818858', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(263, 'MEKALA PRASANNA KUMAR', '9553534657', '$2y$10$y8yhYm8AfgZcm5j9BPhTJefE9V0orfS/ey34o21YiVn1hhy5te6Ge', '', '', 'KHAMMAM', '0', 8, 5000, '9553534657', '9912485445', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(264, 'V VIJAYA KUMARI c/o ANIL', '9848417974', '$2y$10$5IJOd9Sd2I/DdkeK0qPPE.CS.Z2zgFIkBJQCq.KG8Jj43gu2EpJbu', '', '', 'GUNTUR', '0', 8, 6000, '9848417974', '9441557447', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(265, 'BALARAM V', '9618023249', '$2y$10$YUkJDqL1Wxc.HmKh2PfLCuVk1plrA0UqG/g2u3P852X4YB1krJauW', '', '', 'GUNTUR', '0', 8, 10000, '9618023249', '9010054126', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(266, 'MOVVA CHANDRA SEKHAR', '9392133849', '$2y$10$C2WWs5mOXSjwRmhJOEL6G.x8R1qjoAAmDmx/QBLJOjsMxoh/aViMe', '', '', 'GUNTUR', '0', 8, 6000, '9392133849', '9000970908', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(267, 'P NAGARAJU KOLLUR', '9440579917', '$2y$10$EkJNFSgwSYIIkxIHiP0Zyu/y7z404fC60aqN/e6j.SRusHJsC6aGK', '', '', 'HYDERABAD', '0', 8, 0, '9440579917', '8919793099', '2026-04-02 05:30:23', NULL, '', '', '', ''),
(268, 'MOHAMMAAD SHAKIL', '9949954792', '$2y$10$ZCcFgJ99NrJd7Mww2UFcIOV8spPBuAAvJtUwOdjhsT9N2XPpPzQeO', '', '', 'Hyderabad', '0', 8, 3000, '9949954792', '8341236520', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(269, 'JAMALPURI SAI KUMAR', '8184876229', '$2y$10$4qTWx5VEipEtTYW9xD5iY.h.uP/pUBjsAMgCAuOxf587EHIWR9z0C', '', '', 'Hyderabad', '0', 8, 3000, '8184876229', '8341236520', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(270, 'D SRILATHA', '9885569568', '$2y$10$LlbBtvPq3eq/LTs7QchxW.M1IrfHDZTsz46QN5VCFTsfmatySoA72', '', '', 'Hyderabad', '0', 8, 10000, '9885569568', '9381477148', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(271, 'Hanmandlu', '8247624486', '$2y$10$yCGRrMh9CTfZA1WVVGq9iehyATNK0.qFZ3.bzdMFHU0gwVvleuU7e', '', '', 'Rudrur', '0', 8, 0, '8247624486', '7702381784', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(272, 'M.PRABHAKAR', '9392222117', '$2y$10$XL/jcUf0r8amies1B/DhUu/jJUwsDmkdZkPjvjMvxCnBlamBGLIAC', '', '', 'Viveknagar chikkadpally', '0', 8, 0, '9392222117', '7702381784', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(273, 'G Sudheer Kumar', '7207010600', '$2y$10$0.QE6RE334W3WF2/l2mceeOHkj28Ecyb9jgcBQN4IV3ioQPvVjhBy', '', '', 'Banswada', '0', 8, 0, '7207010600', '7702381784', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(274, 'Dadavali', '8886851356', '$2y$10$nx35IGRmino0688QcQyXUu6C5ji9MgSiZv15XNogUNkQuMM2Ajjg2', '', '', 'Kurnool', '0', 8, 0, '8886851356', '9666386006', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(275, 'Balakishan', '9494722040', '$2y$10$6MaGPs3JUnXP5Dq1PNcq8uHn2.6BwOjvw88W3GBV7a.ovc.2O1ICK', '', '', 'Sircilla', '0', 8, 0, '9494722040', '7702381784', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(276, 'Matla Dinesh', '9985346743', '$2y$10$fKFSza0mll5jl5.KjFyVF.w5RS/s7VkpUEMgB0zDU6ckLy0mV45aC', '', '', 'Kamalapur', '0', 8, 0, '9985346743', '7702381784', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(277, 'Vidyasagar', '9966486145', '$2y$10$6DH3BRfdDGBW3ySZhYFA5.1DrZkg07Xw2fNibQOpRlTxzhCDApMfu', '', '', 'Kamareddy', '0', 8, 0, '9966486145', '7702381784', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(278, 'Puli Madhukar', '7893741751', '$2y$10$Wkx.ivZkDjXaqVftKiSgkuqCtvojmTHf7CiwNUtMflysGDKTRluBa', '', '', 'Marupaka Rajaanna Siricilla Telangana 505302', '0', 8, 0, '7893741751', '7702381784', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(279, 'Santoshkumar', '8309841812', '$2y$10$4UVHSSuX4wxAN8A0flFUC.7ZiYU9uXnKKllhlJc5C/1Qm0vHwSrhm', '', '', 'Palakonda', '0', 8, 0, '8309841812', '7702381784', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(281, 'Mylaram mahesh', '6302068518', '$2y$10$FmpnkNOZuW0Q9fO9iZr4E.NHRttCASLTYWCQBAl8vJcBy92.//Hky', '', '', 'Palkapplly', '0', 8, 0, '6302068518', '7702381784', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(282, 'Bhanu ch rao gamparai', '7569631909', '$2y$10$Lzbo78nbA/qENGNAgfafwePMoIPqQX66T1/H0mnQWRgZpUnYfpIW2', '', '', 'Paderu', '0', 8, 0, '7569631909', '7702381784', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(283, 'Sandeep', '9392171846', '$2y$10$5KP.6/1Bm3QS9xeaZw3DYOc8qb2dbQIorENxMn6wZ4438pdCnTzFe', '', '', 'Pachanta', '0', 8, 0, '9392171846', '7702381784', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(284, 'Kothapally Suresh', '9666579530', '$2y$10$2ybvhUn6thePxYIUxMbZCu./REXFdy0HFOyExN3nNXDcwSYV51cYq', '', '', 'Hyd', '0', 8, 0, '9666579530', '7702381784', '2026-04-02 05:30:24', NULL, '', '', '', ''),
(285, 'M Srinivas', '9441954609', '$2y$10$QxwzbG.VUWBVp7hVQewv7uvFMR1InmWinYrrW5ZeHqaa5xvBStdJ.', '', '', 'Hyderabad', '0', 8, 0, '9441954609', '7702381784', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(286, 'Setti venkatesh', '9542522611', '$2y$10$Vx/gOWQxEX/5yc7RkRANBODR9XLsBL.AYVt4H55bzrb1eUUTzuqpG', '', '', 'Hydrabad', '0', 8, 0, '9542522611', '9666386006', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(288, 'Shaik Kareem', '9490235674', '$2y$10$PbUpeQ4KqdW.qXZS2XqVnu3E82.ARrcKPLX/vZ6WRLYZskf7lIntG', '', '', 'Bapatla', '0', 8, 0, '9490235674', '7702381784', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(290, 'A.sivasankaramurthy', '7732099159', '$2y$10$JDv1.PgKiV.GrhHNGFrM7OnUXJJouSAHaA1WyZ0XTexxaw1Hy3tiW', '', '', '123456', '0', 8, 0, '7732099159', '9666386006', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(291, 'BOLUKONDA PRASHANTH', '9030584180', '$2y$10$wHgsxNlDk2cnuZfAKsk5AOQL7B7HqTf2DE0JqtKgpZYtx1slRK6dy', '', '', 'Warangal', '0', 8, 0, '9030584180', '7702381784', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(292, 'Esam. Venkateswarlu', '9704131547', '$2y$10$BcZgaLNmafbHJx3IHuUEbemJSWT0krhTDdsRUI2tfTlDt1zQDgi8i', '', '', 'Dammapeta', '0', 8, 0, '9704131547', '7702381784', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(293, 'Nagesh', '9948473703', '$2y$10$hw2pl5CP.RqETRzDAet9COOQKMPUfp9bMzg22xLa0BoED/S/tddS6', '', '', 'Hyderabad', '0', 8, 0, '9948473703', '7702381784', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(295, 'Gurijala Lakshmi Prasad', '7702616928', '$2y$10$H1Jg86K0qqBvEsBoMu5OYeN5XHclDtqcwVaT.BwiYQ36sjvCZoJJS', '', '', 'PULLURU', '0', 8, 0, '7702616928', '7702381784', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(296, 'Koppula Buchiramulu Patel', '8885846025', '$2y$10$366vsxvSWFXzMGNq46KypumTlzO5NmICz4tm/bSFdGiHYjJk3S2tW', '', '', 'Vemulavada', '0', 8, 0, '8885846025', '7702381784', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(297, 'Doddi aravind', '9440879366', '$2y$10$ua0Jc..iYCweeH6aNdyad.O77pHO1baBL0DyoPllpq4I23eVSisG6', '', '', 'Eluru', '0', 8, 0, '9440879366', '7702381784', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(298, 'Sudhakar yadav', '8919229865', '$2y$10$HNUV7gZzq0/7GyrWdraf/.lkJd1YKncDDFpWxRUuOJG1igfz8KPxG', '', '', 'Vikarabad', '0', 8, 0, '8919229865', '7702381784', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(299, 'Saidulu', '9701231209', '$2y$10$Hf/0VcgpcuVvPrWWAF66xuSknm0qZCe5vtOxvAzhIzEIwnY8Oe9LW', '', '', 'Nlg', '0', 8, 0, '9701231209', '7702381784', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(301, 'Sudharshenreddy', '8897161523', '$2y$10$.bjL53y3LkKqyQFyLVc8J.tIHkBwv8tKTZBBMS5KJgeoGbg3lTxuG', '', '', 'Yerragondapalem', '0', 8, 0, '8897161523', '7702381784', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(302, 'Sudheer reddy', '9989700660', '$2y$10$a7Uavz7ezQjpPtkLpYopYOx52T1/fpzxNhl1rk0Qdgzf0emzXgIhy', '', '', 'Siddipet', '0', 8, 0, '9989700660', '7702381784', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(303, 'M.Narayana Reddy', '9505995482', '$2y$10$qXzO9Lnzu3k4b3NsjOYBIOe8fm6Yeb6EVCH6M255yzX7.EM77zBge', '', '', 'Gooty', '0', 8, 0, '9505995482', '7702381784', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(306, 'రామకృష్ణ', '8074960897', '$2y$10$cX8DYwXjpv2wkeVf5h5NW.Q2e/7JbF2nOHah76Cmy8xy1OdcJwPou', '', '', 'Reporter', '0', 8, 0, '8074960897', '7702381784', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(307, 'Mohammad Akram', '9948413498', '$2y$10$FC2C767poKGRHhNhA9Opo.UrlfMG7Flz4aMy/V48okT2qA9GghmmO', '', '', 'admin123', '0', 8, 0, '9948413498', '9666386006', '2026-04-02 05:30:25', NULL, '', '', '', ''),
(308, 'S.balram', '9951078276', '$2y$10$3t/tKLauZpxrp82mtoU62u6qJozwyvCbxVROYJbBYy773/QyOflsy', '', '', 'Khairtabad', '0', 8, 0, '9951078276', '7702381784', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(309, 'CHARUGUNDLA PURNACHANDRARAO', '9505212998', '$2y$10$TkvLFgMOOtUwZquDm/P7HumXi.rux.ULptx.DopjLMxFao1IM4mpu', '', '', 'YELLANDU', '0', 8, 0, '9505212998', '7702381784', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(310, 'srk', '9700706123', '$2y$10$hhWBAShzXfzT/jFaMjat1.eN7DD/wlUTl7rWVstUQDz4t3fGRil/2', '', '', 'Hyderabad', '0', 8, 0, '9700706123', '9666386006', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(311, 'Chittem kistanna', '9908972573', '$2y$10$TX10pThcMI7nev92B7EXouNnXZW.sJnkQa7HR9hrS9cwhY.c0cXIq', '', '', 'IEEJA', '0', 8, 0, '9908972573', '7702381784', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(312, 'Mogal shamsar baig', '9059495745', '$2y$10$I2yZEFtYOzgi8I1mTW9YA.PFx2mIf9lIvKemzMLDOm.JpUyybBx8m', '', '', 'Cumbum', '0', 8, 0, '9059495745', '7702381784', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(313, 'Thanneeru bhanuchandar', '8121285202', '$2y$10$qJspPP.Pg3nyi6Mn2nLqEOdUfdqqlTOBhXrrxNTgZF.mo4dbVaJOu', '', '', 'Siricilla', '0', 8, 0, '8121285202', '7893741751', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(314, 'Aditya', '9030903097', '$2y$10$SyXLpVTOlMfFHbByEAv7gOM5anfXn56VID9ANafLw.AQSgSdX4yD2', '', '', 'Kukatpally', '0', 8, 0, '9030903097', 'admin', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(315, 'Gopi Srinivas', '9177934082', '$2y$10$yb3B2Zx7AjwlwxgtRLk1je.3Do09/QuR5vSTc2nTyijMhVi5d46MW', '', '', 'Rajugari street', '0', 8, 0, '9177934082', '7702381784', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(316, 'Garnepudi Saiman', '8499900478', '$2y$10$N9leNjFAtw6MAerlmuc3sO6ckw3LiumXJT9.GVR9mp5guEpD/gPRe', '', '', 'Ongole', '0', 8, 0, '8499900478', 'admin', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(317, 'BATTULA VISWESWARA', '8688383889', '$2y$10$1T8Z02buJamonbI2FU8U0uM5zFWHRLsiO41CvFwPV.IfJjTT9Wj8y', '', '', 'Madanapalli', '0', 8, 0, '8688383889', '7702381784', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(318, 'C Rajender', '9441254160', '$2y$10$a4Oa9QzX0ne1n/JNu79gcu2pLRCDJVMZeq8xzySE8Qh3Okukt4d5i', '', '', 'Nirmal', '0', 8, 0, '9441254160', '7702381784', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(319, 'Bhanu14325', '7989655405', '$2y$10$i/9dlNOd1ynSD6NrmPysIueq.OoloQ0/.MAsz6JxPOv4dyQCQHoo.', '', '', 'Bhanu14325', '0', 8, 0, '7989655405', 'admin', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(320, 'miriyala umanaheshwar', '9182095432', '$2y$10$KW7gfoDPt3I5IhbtF.P2K.SP.1DdisIqM2OHvtFu7ItU3Fb4F4zDO', '', '', 'Bhel lig', '0', 8, 0, '9182095432', '7702381784', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(322, 'Chinnamnaiduchalumuri', '7032032255', '$2y$10$RyEUMpUFPEfvLNbj0XapSelNb85tvnaIupx6b95Lxu.Eho97cUNAO', '', '', 'Gurla village', '0', 8, 0, '7032032255', 'admin', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(323, 'EERLA SAGAR', '7660996668', '$2y$10$0amX6kp4w6CMcAG3/VKyVeuTSZoyAQTAraRT/C0Mhewx30EV5/Lyy', '', '', 'PARAJALA WARANGAL', '0', 8, 0, '7660996668', 'admin', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(325, 'Kuna Aravind', '9989621457', '$2y$10$5JlEe48/iX3dUuJ/iuwyKeSZwdegaa7LqcDxGkVfjIlBnF/g0n9qa', '', '', 'Karimnagar', '0', 8, 0, '9989621457', '7702381784', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(326, 'BANOTH HANUMA', '9000357462', '$2y$10$/hYEeT184qgt9b6UM8q4JemUf/ohN7AvkieKLiS6W7fkCsdH8raGG', '', '', 'HYDERABAD', '0', 8, 0, '9000357462', '7702381784', '2026-04-02 05:30:26', NULL, '', '', '', ''),
(327, 'Sunil K', '9985737516', '$2y$10$nML3ucOxfFm2iB4bkyCUKOba6F08sRkLNuoJtYeLZk99hu54zO5Gq', '', '', 'Hyderabad', '0', 8, 0, '9985737516', 'admin', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(329, 'Ravana kumari', '8639203610', '$2y$10$K.AFm4PeILv4HVHXaB9RE.JtTfjl16gQCB9YDgKMzqk06bC4Jys.q', '', '', 'Visakhapatnam', '0', 8, 0, '8639203610', '7702381784', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(330, 'Pothana Venu', '9666648525', '$2y$10$T3Tq0ise5gS6bhz.vkusnuqKL46wvbCaJMZm1YP8hh.1qOjcNSk12', '', '', 'Sircilla', '0', 8, 0, '9666648525', '7893741751', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(331, 'Kodam Pradeep', '9491470676', '$2y$10$qPEmEph2i55fFBrK1rYZ5uPyPW5bNAaq.xsHPvOgnkf3bp11B.2Lq', '', '', 'Sircilla', '0', 8, 0, '9491470676', '7893741751', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(332, 'Kanikarapu Rajaram', '9959373436', '$2y$10$bOiFNm/EDNrSZ6YcWlZ/huRKLZcnNbn7PG0PDFMaca0iJahWb1ev6', '', '', 'Vemulawada', '0', 8, 0, '9959373436', '7893741751', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(335, 'Thirumalesh', '9502234663', '$2y$10$G.4crBsgajMWc6KBZC5gzOpdUtORttFAPxtZM/n7SQPvcN2KxbXSe', '', '', 'Karimnagar', '0', 8, 0, '9502234663', '7893741751', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(336, 'D Shivalal', '7396818308', '$2y$10$s.nn1qk8jPWbmBCVIRIbEOHdx1gC9ygm2pOaoaMSFdTLfPEBIXt4S', '', '', 'hyderabad', '0', 8, 0, '7396818308', '7702381784', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(337, 'Rohith', '9700257319', '$2y$10$2WAFuxfog3ouy11GZqTZY.wY5d874wSh3p6Gihh7SItVUS4f0UiU.', '', '', 'Hyderabad', '0', 8, 0, '9700257319', '8522881144', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(338, 'RAMESH KORADALA', '9110715034', '$2y$10$G7i9sQObNDF3D/Xm5ssXveOqIH4fxzodp2PoXA6CAm.4CZvkTTlHq', '', '', 'Hyderabad', '0', 8, 0, '9110715034', '7702381784', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(340, 'Kuchana hymavathi', '9618941313', '$2y$10$eRk.XSDRy7JyddOvkW3.texBa9dC16SjyXsuaRGUN/bczg7eAu3du', '', '', 'Warangal', '0', 20, 25000, '9618941313', '7702381784', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(341, 'Akhil Chandra', '7386139591', '$2y$10$I1rPe/5qn6/HQzZEVbuetugrS8.mmT6AHBfitFojyIfIMcA3zqz2C', '', '', 'Warangal', '0', 8, 0, '7386139591', 'admin', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(342, 'Puli vara prasad', '8639310827', '$2y$10$QPwqVcepHO4Ynbe/H3iZ3uNpdw0nwaCxyPfiW8pnwx9xm8tyMoDwS', '', '', 'Hyderabad', '0', 8, 0, '8639310827', '7702381784', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(343, 'Leela', '9949993056', '$2y$10$0N4/SjsWOk5W4j8D21m7cOsaiEPDZ9A2ghawjBe24jVr7t6KE6x/S', '', '', 'Ap', '0', 8, 0, '9949993056', '7702381784', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(344, 'Maroju Bhaasker', '9949816949', '$2y$10$Erw7mnh2t85s462DgdvNyeabjOPtFZjKFMc7qFpmcPJo97ijyyGkO', '', '', 'Hanamkonda', '0', 8, 0, '9949816949', '7702381784', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(345, 'GALLELA SOMESH KUMAR', '7981039324', '$2y$10$GJ3Nde6xjpKmK67clW5zquLZdRg0n50GFsnMaZdfy0XfLSP8JLP96', '', '', 'Thangula', '0', 8, 0, '7981039324', '7702381784', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(347, 'Bachu shivakumar', '9949547888', '$2y$10$bV7HW0Sb2Sazu9AWWF0VdOy0C.q2.cuptsnnvgEoYp.Tl23HbOHpK', '', '', 'Hubsiguda, st.8, Hyderabad.', '0', 8, 0, '9949547888', '7702381784', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(348, 'Mallu', '9951514679', '$2y$10$Pg0lQ2LD2VQ/MWp40CQ.b.mdCFOuiHix4JPTA7s1f52cLTr.X1ARO', '', '', 'Telangana', '0', 8, 0, '9951514679', '7702381784', '2026-04-02 05:30:27', NULL, '', '', '', ''),
(349, 'Sathyam', '9908304044', '$2y$10$.XERrK/yhhC5qsj8wiB8RuFj7/fcE4EJWCxF2LwLQxplGfmtPyE3q', '', '', 'Jannaram manchiryal', '0', 8, 0, '9908304044', '7702381784', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(350, 'Sandeep Kumar', '7013964644', '$2y$10$XsCmFQ/j/90S8wfZdhOlhefE6kPjlVV1qzBVTI8MNP6dBGCEfu1M6', '', '', 'Bhupalpally', '0', 8, 0, '7013964644', '7702381784', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(351, 'Shalu basha', '9182222389', '$2y$10$2Nb.5Zsk/pROrTXxdi5ia.Avg7v17PnTYJhvAdM4rPIBMCZ7nVAma', '', '', 'Kurnool', '0', 8, 0, '9182222389', '7702381784', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(352, 'RAJKUMMAR S', '8235556916', '$2y$10$3gSTTJYy8naaUixu5vpx3ukLTngLZ/1CwKEpNGDGxgapcRJSHIafW', '', '', 'Kacharam', '0', 8, 0, '8235556916', '7702381784', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(353, 'Srinivas sankoju', '9493884104', '$2y$10$5epK3Ic87ofrzOH2WWxcEutQt7h6MfcYvbCywh6JtkW/3N7NDabiC', '', '', 'Dilsukh nager', '0', 8, 0, '9493884104', '7702381784', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(354, 'Arvind vijay', '9989667007', '$2y$10$PAVixDNzGP6D7bHnWrZvteA/sKYryXNxgcNWbdRz5aQ6.ltsUEDJi', '', '', 'Sangareddy', '0', 8, 0, '9989667007', '7702381784', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(355, 'Ramesh', '9985294637', '$2y$10$qxJ96O/B8cqF1.x4s80Ivei6.ATdsSqbJchLjdqRBtvHjg0B5QQKG', '', '', 'Nellore', '0', 8, 0, '9985294637', '7702381784', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(356, 'Pureti Jayaraju', '9989193301', '$2y$10$mO4hJouo1AHfV8278GU0eOBbg6MCrLQdj7WeIeyed5t.ZwafZPDbS', '', '', 'Khammam', '0', 8, 0, '9989193301', 'admin', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(357, 'Rehan', '8919912226', '$2y$10$uB.82neQt.QqH0sSOYixwug7uItGX7UeXJogEyRqswdHd4VUpocoq', '', '', 'Godavarikhani', '0', 8, 0, '8919912226', '7702381784', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(358, 'Chandu', '9989837645', '$2y$10$6rP2Oaa4xPfYYcZTYnBLRues5BznFR1iPzMDCRGUJy3UDKEfOmQAW', '', '', 'Ramana Pat', '0', 8, 0, '9989837645', '7702381784', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(362, 'Chennakesavulu Thumati', '9014271806', '$2y$10$I/7NN6VSa8Xpn3RWv3gPveUJSU38XvPEA/TBEeQeWwCpaKLe9rSWm', '', '', 'Yerragondapalem', '0', 8, 0, '9014271806', '7702381784', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(363, 'VURE BHASKAR', '9703301383', '$2y$10$3ClumOMt3.xoobkTgvFxs.a1nddx4mkBq04t/YencTFGW6FHbRTDy', '', '', 'Hyderabad', '0', 8, 0, '9703301383', '7702381784', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(364, 'N Md Rafi', '9985221331', '$2y$10$0K8l5ZP/Na/vcjePqOGN.u2QG0QR8b8niJNR79qvEh.xOuE8qFPzC', '', '', 'Nandyal', '0', 8, 0, '9985221331', '7702381784', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(366, 'K balarajachari', '7731896456', '$2y$10$e6rhSNnXDqxdFs9EbUgQY.hIOBegy7lOkhIKe/BSODipzOXDQxHqi', '', '', 'Ramayampet', '0', 8, 0, '7731896456', '7702381784', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(367, 'NAGENDRA BABU', '8144486592', '$2y$10$ZO9.Y76T9eAZd1ObWGNLHOiAe0Ye1SmASftkobGy5tZ0e/JYjYzWy', '', '', 'chirala', '0', 8, 0, '8144486592', '7702381784', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(368, 'Srinivasu', '9581144287', '$2y$10$HoZQ/azBfu3lrREBVc2Or.c6OvFHFVmK8zo/hpRxDv6BY..qbOfoi', '', '', 'Hyderabad', '0', 8, 0, '9581144287', 'admin', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(369, 'Narava Veera venkata ramana', '9603332166', '$2y$10$d0wUqf668FEhoM2v8Dz/2OhZjcyGCmquElZtzeAytdubLigM9GXim', '', '', 'Tallarevu', '0', 8, 0, '9603332166', '7702381784', '2026-04-02 05:30:28', NULL, '', '', '', ''),
(370, 'Chendi srinivas goud', '9010144816', '$2y$10$TbruKsuJen8Ag7JzAaISS.KUDdFm5pivV5JRn0lx5UoLq8Y8QZeCC', '', '', 'Narsapur', '0', 8, 0, '9010144816', '7702381784', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(375, 'Sravan Kumar', '8142832026', '$2y$10$Rvff6HIspaZh8Z.Z844aY.DQIOp5zm8dlwdWYXVfReYob3yQqHgtC', '', '', 'Karimnagar', '0', 8, 0, '8142832026', 'admin', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(377, 'Bhimireddy siva varaprasad', '9885811282', '$2y$10$Y5SzvVHPm32bsCNtrCsCe.Fe95VfqKK.X73VOA8XlHc4wlpefEwRq', '', '', 'Rowthulapidi', '0', 8, 0, '9885811282', '7702381784', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(379, 'Raghu', '8500316203', '$2y$10$HzhI6s25Deeapk.su1QYf.JSIkwlrXVVmwcG3Rksx4aoK5ELahrY6', '', '', 'Hyderabad', '0', 8, 0, '8500316203', 'admin', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(380, 'CH RAGHAVA CHARY', '7013026159', '$2y$10$lYQH0QLtX.WUVFiRq7ugVu8tUKRqHiEJOMgjwDLsc67/TuDLm6N6e', '', '', 'Jaggayyapet', '0', 8, 0, '7013026159', '7702381784', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(381, 'Bhimireddy siva varaprasad', '9581811282', '$2y$10$1a0qgpj9axvQyU4zr4Ks.uVFVH5.HfkLG8o2x48oPR.iFqQ6z7KA6', '', '', 'Rowthulapidi', '0', 8, 0, '9581811282', '9885811282', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(382, 'Harika Yadav', '9133752177', '$2y$10$XNoX8kKjh3NTc26KRvRSVuSLzRtvEL0IQFVhB0M1gxOIbgqlMlFxS', '', '', 'Hyderabad', '0', 8, 0, '9133752177', '8522881144', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(383, 'Prasanthi', '8309182258', '$2y$10$9V2gVkmpEZ7sfKMgUrbfH.bFAorwjZQDB3/SM8D4Qeo5qrgnnPyJy', '', '', 'Prashu@7703', '0', 8, 0, '8309182258', '8522881144', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(384, 'sobhurao473@gmail.com', '9912156698', '$2y$10$4gEaY.cqXfvlz30V8K8A9.sM8mgakJw0jYX2n8phG3PlxBdd/e.Ci', '', '', 'hyderabad', '0', 8, 0, '9912156698', '7396783499', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(385, 'V LAXMIVARAPRASAD', '7013143737', '$2y$10$S9kW6UEaFHHK2vbDr7aYDu2/GBXkqphQ3RLESScR867i4iL/rr/Ce', '', '', 'Wanaparthy', '0', 8, 0, '7013143737', '7702381784', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(386, 'Dayyalasrinivas', '9963571277', '$2y$10$3gBfCp.8HpuLxdbwb/Higus/kKldNAL9fLAUkjAtkYpcF1mFiFKRe', '', '', 'Hyd', '0', 8, 0, '9963571277', '7702381784', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(387, 'Yadaiah', '9949504071', '$2y$10$Ly6E4p1M5W1pvfBNMIyJmulBtG4rksVmKXN0P3uoJRqo7g08Oj6KC', '', '', 'Tekmal', '0', 8, 0, '9949504071', 'admin', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(388, 'Srinivas d', '9000357668', '$2y$10$8Fj8T9Gr6rzRspEb6IvF7ukTa7AaqgakeNTcQAx9ou7LfsjzgU5p.', '', '', 'Hyderabad', '0', 8, 0, '9000357668', '7702381784', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(389, 'Kongari Sai Krushna Reddy', '9493983973', '$2y$10$kmwVpkd0hdDSPkPjbsBtkObzQb1jtTjULxgh4mSzAIFnIFknou/uW', '', '', 'Nirmal', '0', 8, 0, '9493983973', 'admin', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(390, 'Chintakayala govindu', '9948558653', '$2y$10$CIWMZYnOPOi0dSJB4TqBNOaugqAFNgiAj2FTD23KV/tXlpqxHxz86', '', '', 'Tuni', '0', 8, 0, '9948558653', '9885811282', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(391, 'G PREETHI', '7569372947', '$2y$10$ug9liE4cOx83yLPcVQHwie8Z1W5M5I6z3RZjhxiz5jscU.QCG70xa', '', '', 'HYDERABAD', '0', 8, 0, '7569372947', 'admin', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(392, 'Balaji', '9550957225', '$2y$10$4AUjpYOY6.miMFmbYCFXreVTCHuf0wW8XWSwiYvU9KPAMeycf4lG6', '', '', 'hyderabad', '0', 8, 0, '9550957225', 'admin', '2026-04-02 05:30:29', NULL, '', '', '', ''),
(393, 'Rakesh', '9515932113', '$2y$10$3qAeDKAeaOniHoJKqhiGX.sZpr8VMfZpTNy4S/DP/R.2yqN/calXa', '', '', 'Hyd', '0', 8, 0, '9515932113', '7207462300', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(394, 'Miryala anusha', '7671869591', '$2y$10$qSNBBgP//edt4LMoqmnV5OkoB17BLrPl/ozELAEo/8Nnxjs//9nre', '', '', 'BHELhyd', '0', 8, 0, '7671869591', '8522852201', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(395, 'Mohammad feroz', '9100686185', '$2y$10$WA4YOeAQmLDPgsgbovLwCO/tfaSkIiKPpRtez8XwELIMxpVD9i4QO', '', '', 'Hyderabad', '0', 8, 0, '9100686185', '7207462300', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(396, 'Ravi kiran', '9676959538', '$2y$10$nPMJHch3cCAxBxz8llsSLuspkFERxP/pNMHw/J6bqinygcSyj/VQ6', '', '', 'Hyd', '4000', 8, 0, '9676959538', '8522881144', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(397, 'Ramachandra Raju', '9247438639', '$2y$10$7yF5nzJwAa.U0iSUWIjMzuARli6LgA6kh0CNfkemfXYpOhu0ifyu6', '', '', 'Visakhapatnam', '0', 8, 0, '9247438639', '8522852201', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(398, 'G.Srinivasarao', '9652049573', '$2y$10$aJkI5IFRkDYRu4fefbOYo.MDM.mWsWH5oBCgK1d/L7YdHzp1k9PVK', '', '', 'Waranal', '0', 8, 0, '9652049573', '7702381784', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(399, 'Garadas Prasad', '7382116336', '$2y$10$BMNf.N5A5cwSjG3IFZn3ae1Pn19aqs/eYZjoQM.2ww5MK4zpm6Z7q', '', '', 'Sircilla', '0', 8, 0, '7382116336', '7702381784', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(400, 'Vishnuvardhan', '9347901004', '$2y$10$D3pCmwL7o7jal197BWcagedOPK8H55Hca72zqCsOT58Y3g.L2HGme', '', '', 'Rock town colony', '0', 8, 0, '9347901004', '8522881144', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(401, 'Anusree', '9963613189', '$2y$10$0F8Dik32g2bC4ZaEQmAi3.RlBx41eXMQQys0W7Pp3ue/ey0yJySOW', '', '', 'Lingampally', '0', 8, 0, '9963613189', '8522881144', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(402, 'Supriya', '8125033722', '$2y$10$DDkRTueMBZTW3phktJpnm.WJS8TyELYLpi9c.yxsX7etrrFCt56nu', '', '', 'Ferozguda balanagar', '0', 8, 0, '8125033722', '8522881144', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(403, 'Vemula kondal goud', '6304898897', '$2y$10$rUJHtx6E1kjq4BXPpqJc0eMCGSvCb3yKbUrIiG9Uj/pn4ijXRbUXm', '', '', 'Lb nagar', '0', 8, 0, '6304898897', '9347901004', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(404, 'Chippalapelly Ramesh', '9052879359', '$2y$10$QPigMAuffgZv07XUR9ia9O8sOg4N4vM693khA9z3bIiwnFzEUxtYK', '', '', 'Road no 1 Sai Nagar colony Nagole Hyderabad', '0', 8, 0, '9052879359', '9347901004', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(405, 'Chippalapalli  Nagesh', '6304346170', '$2y$10$7eNg.p6MqWeOufCdlvy2Meqq3Z0F82adyj8uv06rdwxuRC4CaPxH.', '', '', 'RAKESH', '0', 8, 0, '6304346170', '9347901004', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(406, 'Kondeti vishnupriya', '9502058511', '$2y$10$jrrBPb.9g70ZJPMuiyfUq.28CAxkABbrkbfXTLo/jc/2yu/F6bzju', '', '', 'Hyderabad', '0', 8, 0, '9502058511', '8522881144', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(407, 'm srinivas', '6300524425', '$2y$10$z39KSGcEqWyGg.xtt1danOK2VMAlYNaOmsXrQeOANJrBqCCIl/gVG', '', '', 'GHATKESAR HYD', '0', 8, 0, '6300524425', '9346005330', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(408, 'Pendyala Vikram Rao', '9398543939', '$2y$10$eWpzm7xhlqwT/9EszZpM3.0pg4f9fjGP/gGc.hlGAZPLmn2oFkube', '', '', 'Tirumalagiri', '0', 8, 0, '9398543939', '9346005330', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(409, 'Navneeth', '8523095642', '$2y$10$zEti08OLVNLqyR6RsMWixOXZThtMYMJ701WkghW4I50JyGnFkrk5O', '8523095642', '', 'Kakinada', '0', 8, 0, '8523095642', '7702381784', '2026-04-02 05:30:30', NULL, '', '', '', ''),
(410, 'Anand', '9640342152', '$2y$10$tBbA9vmKItKN1CBSYAvfzeN7DuLjuyIWyzILGo9SBTUkIQCyiLhUW', 'anand123', '', 'hyderabad', '0', 8, 0, '9640342152', '7702381784', '2026-04-02 05:30:31', NULL, '', '', '', ''),
(411, 'Ambati Yellesh', '9848728062', '$2y$10$TiQIC013S.2SUF8LoeO3gugZxTTR2nqCEz9.k1Eobk5oyU79AEVUu', 'Abt@yel1', '', 'Nakrekal', '0', 8, 0, '9848728062', '9652049573', '2026-04-02 05:30:31', NULL, '', '', '', ''),
(412, 'K balarajachari', '9032215946', '$2y$10$TOVnPwMH5KhElqGCXLMbO.pvz2cI7ppwLL0U4Gw7KnqK/UFKQah1K', 'Vedha@456', '', 'Ramayampet', '0', 8, 0, '9032215946', '7702381784', '2026-04-02 05:30:31', NULL, '', '', '', '');
INSERT INTO `service_users` (`service_id`, `member_name`, `member_phone`, `password`, `open_password`, `user_profile_pic`, `location`, `cumulative_gross`, `commission_percentage`, `back_two_back_balance`, `referral_id`, `referral_by`, `created_at`, `joined_date`, `address`, `city`, `state`, `pincode`) VALUES
(413, 'Nayeem', '9573196505', '$2y$10$dS/udI7bW7wIzaVYPKgEIO.kk.ZLYqkmb3HesZrWzi9dupjP5Ejh2', 'A3c@89Ad', '', 'Khammam', '0', 8, 0, '9573196505', '7702381784', '2026-04-02 05:30:31', NULL, '', '', '', ''),
(414, 'Gudelli Bhaskar', '8008308175', '$2y$10$JkyMT8SfDfz7RGXYNsPVUOPThTdTSb1ZJY.S2NXQFOlRaEc8uX8RG', '12345678', '', 'Choullaramaram', '0', 8, 0, '8008308175', '7702381784', '2026-04-02 05:30:31', NULL, '', '', '', ''),
(415, 'lakshmiprasannakumar', '9701391747', '$2y$10$p/52hl54hWHdwMmPzeyFRuJS8oUMSJf4RijeIGP9oTAB9NnallQmW', 'Ahfl@123', '', 'Nandyal', '0', 8, 0, '9701391747', '7702381784', '2026-04-02 05:30:31', NULL, '', '', '', ''),
(416, 'Kumar Swamy', '8552385521', '$2y$10$vgjgrw0JAibRk91.Yvrfw.VKjyKE23V3.AcNiCqQVgunDJhQtHETe', '8552385521', '', 'Kakinada', '0', 8, 0, '8552385521', '7702381784', '2026-04-02 05:30:31', NULL, 'Ameerpeta', 'Hyderabad', 'Telangana', '500873'),
(417, 'Vaidyanath', '9014607236', '$2y$10$UOjDPu26t5piXD7Y/.6Ki.VVpYlZwM05eH92sTQqPTVLQ5d/K/Oei', '1244', '', 'Zaheerabad', '0', 8, 0, '9014607236', '7702381784', '2026-04-02 05:30:31', NULL, NULL, NULL, NULL, NULL),
(418, 'Narendra', '7386983955', '$2y$10$BqxZgUMFR/4jajkbfjQnbeXiAmpy5Er13fpK9X1ZZ4EgqSf15WUta', '984858', '', 'Vijayawada', '0', 8, 0, '7386983955', '9347901004', '2026-04-02 05:30:31', NULL, NULL, NULL, NULL, NULL),
(419, 'Sivaramakumari pamarthi', '7883892332', '$2y$10$.eNI6xZt.PxGRVm./8gBfe0Tcr/oQdCh53VLTNHsJAxP0M5obVpTS', '7993892332', '', 'Hydrabad', '0', 8, 0, '7883892332', '8522881144', '2026-04-02 05:30:31', NULL, NULL, NULL, NULL, NULL),
(420, 'Sivaramakumari pamarthi', '7993892332', '$2y$10$FUHORfLtXg3RafrpYFhaseoD5mILUyKQE/Klj78W3SzIWRBaxdILe', '7993892332', '', 'Hydrabad', '0', 8, 0, '7993892332', '8522881144', '2026-04-02 05:30:31', NULL, NULL, NULL, NULL, NULL),
(421, 'Ritesh', '9849755431', '$2y$10$/jfKeceRB1rcss0E8o.gV.K4/ABtdPgY56eJk5JfqZgcsb8WG4Dh6', 'ritesh3327', '', 'Hyderabad', '0', 8, 0, '9849755431', '9515932113', '2026-04-02 05:30:31', NULL, NULL, NULL, NULL, NULL),
(422, 'Ramesh', '9908864404', '$2y$10$44BsWn59xP3qGfqJ7H53le2SAA45ByGq5BnU2mgxwRLAZQYNy9DsW', '9908864404a.', '', 'Regunta, Mallapur, Jagitial', '0', 8, 0, '9908864404', '7702381784', '2026-04-02 05:30:31', NULL, NULL, NULL, NULL, NULL),
(423, 'Shaik Jaffer', '7989683203', '$2y$10$fvcaOTF75cTBuTum68eM6uOkkfDBTuOceLbt7Uf301KLnjdhoFmxG', 'Reshu@2617', '', 'Hyderabad', '0', 8, 0, '7989683203', '7207462300', '2026-04-02 05:30:31', NULL, NULL, NULL, NULL, NULL),
(424, 'DURGA PRASAD CHALLA', '9581202101', '$2y$10$mulXdnILTuIh3mVebiPZq.CcApcTvCad.Fh2e0je9nJmMDRkZicvW', '9581202101', '', 'Beeramguda, Hyderabad', '0', 8, 0, '9581202101', '7702381784', '2026-04-02 05:30:31', NULL, NULL, NULL, NULL, NULL),
(425, 'Mohd Arafat', '9912399840', '$2y$10$UymVzJmEH8PEBGqFID6lDO1Vm3OrJ.RpNqWxD.B4kwq2RxMFGSn2G', 'Arafath123@', '', 'Arafath123@', '0', 8, 0, '9912399840', '7702381784', '2026-04-02 05:30:31', NULL, NULL, NULL, NULL, NULL),
(426, 'Naga Phani kandula', '9494038978', '$2y$10$.DMPSKQ9jYUGkys2nKmBduPN8g51MQrZpdhhBT998WZFcVW8vI.Pm', '1234', '', 'Palnadu', '0', 8, 0, '9494038978', '7993892332', '2026-04-02 05:30:31', NULL, NULL, NULL, NULL, NULL),
(427, 'Sajjanarao', '9966920916', '$2y$10$NWF5kqaeH/1gzt6L0vK3KuZ.QUU3GJlQbW5dku6KejJYMerc3GuAS', 'Saidulu@916', '', 'ibrahimpatnam vijayawada, 8-74/1, V.t.p.s road', '0', 8, 0, '9966920916', '7702381784', '2026-04-02 05:30:32', NULL, NULL, NULL, NULL, NULL),
(428, 'RAMISETTI BHARGAV', '7981638148', '$2y$10$MShmTClZlLSvZBFRMCltce6sABB.aOFmzaod7HewB6WSGmlrtOSMy', 'bhargav1234', '', 'Chandrugonda', '0', 8, 0, '7981638148', '7702381784', '2026-04-02 05:30:32', NULL, NULL, NULL, NULL, NULL),
(429, 'Nerella Ramesh', '9948541315', '$2y$10$wkgftH7XvQfUEbd43e.pLebika9rFikL9eirDsQDKfAkeBiUxegfi', 'ramesh', '', 'Hanamkonda', '0', 8, 0, '9948541315', '7702381784', '2026-04-02 05:30:32', NULL, 'DURGA BHAVANI KIRANAM, BHAVANI NAGAR.HANAMAKONDA', 'WARANGAL', 'TELANGANA', '506001'),
(430, 'HYMAVATHI', '9502006371', '$2y$10$P9aHOOKnfT9pt7hw/zwSwOquDTWv3wQ/2UFzhkDcXDgp/iXMohyMC', '9502006371', '', 'HYDERABAD', '0', 8, 0, '9502006371', '7730099707', '2026-04-02 05:30:32', NULL, NULL, NULL, NULL, NULL),
(431, 'Bunny', '7780623200', '$2y$10$by4MaZmasC7k870aPS79keTrPWtVG8CvNKyLq0fDEQ9JPiTEM8jjq', 'BUNNY@@NAIDU', '', 'Vijayawada', '0', 8, 0, '7780623200', 'admin', '2026-04-02 05:30:32', NULL, NULL, NULL, NULL, NULL),
(432, 'Vinath Kumar', '9014648222', '$2y$10$gmyIMaGTZYwdP/bPnYg.eOkg4H3z2zcjGmp3HbuDoNWlLXbfJUnVa', '9014648222', '', 'Nalgonda', '0', 8, 0, '9014648222', 'admin', '2026-04-02 05:30:32', NULL, NULL, NULL, NULL, NULL),
(433, 'Rajireddy', '9505785801', '$2y$10$qZAaYfXYIhtKrw6dIq7U/egk8tNUagESSiA8yX6DkOIy.8rHT7snG', '5362', '', 'Raorukula', '0', 8, 0, '9505785801', 'admin', '2026-04-02 05:30:32', NULL, NULL, NULL, NULL, NULL),
(434, 'SYED FEROZ HUSSAIN', '9700672780', '$2y$10$mt91NBzf4CdoboN2TtwPUOzuf18GQMR1dwXjWUGUWM2oOBpnTWu1G', 'Honda@2024', '', 'Secunderabad', '0', 8, 0, '9700672780', 'admin', '2026-04-02 05:30:32', NULL, NULL, NULL, NULL, NULL),
(435, 'Ashok Kumar Vaddepally', '7569194252', '$2y$10$YZpUmbVf4/r.JK9dHvD/MuLDiIPpeP.ucKhOjhjgHF5eIaHB7IK1y', '798951', '', 'Nagole', '0', 8, 0, '7569194252', 'admin', '2026-04-02 05:30:32', NULL, NULL, NULL, NULL, NULL),
(436, 'satish v', '6302502071', '$2y$10$SUYAa/AxLSdPqj1knKzLMumdvpU7idI9d/y4Y6apeDNhwTqemVMC.', 'Satishhe_2929', '', 'Hyderabad', '0', 8, 0, '6302502071', 'admin', '2026-04-02 05:30:32', '2024-07-02 06:55:29', NULL, NULL, NULL, NULL),
(437, 'Rahman', '6301093936', '$2y$10$KbnELQAgyxQAlrUZd.N0ueJR/PxFIrmXPjd02vJKFeGSA1urODVfu', 'Ra271811', '', 'Hyderabad,Telangana', '0', 8, 0, '6301093936', 'admin', '2026-04-02 05:30:32', '2024-07-02 06:59:25', NULL, NULL, NULL, NULL),
(438, 'Naresh', '9154183243', '$2y$10$ldh5KAUky.Afzs8q4B9WfeRLdXgaJpNAqDswbeuzVQ2ylY1pwz0TK', 'naresh', '', 'Hyderabad', '0', 8, 0, '9154183243', 'admin', '2026-04-02 05:30:32', '2024-07-02 08:35:09', NULL, NULL, NULL, NULL),
(439, 'Charan kumar', '8551496526', '$2y$10$79yDv4h7q7IDKhQbei1vbuCvNGcgNE5HUvU0/Lf1cTNQIDHL8YglK', '8551496526', '', 'hyderabad', '0', 8, 0, '8551496526', 'admin', '2026-04-02 05:30:32', '2024-07-03 08:46:05', NULL, NULL, NULL, NULL),
(440, 'G.SATHISH REDDY', '9700345863', '$2y$10$awhQf35qJoaNb2MMVZWvjOy6QhJ18kyqED0lau5GVHT4Gbo7Pe3J2', '9700345863', '', 'HANAMAKONDA', '0', 8, 0, '9700345863', 'admin', '2026-04-02 05:30:32', '2024-07-03 13:49:05', NULL, NULL, NULL, NULL),
(441, 'PORIKA VIJAY KUMAR', '9849158487', '$2y$10$GKV2h9o.w2yk8AFKkVlnN.0pSwWmABQLXLa/wI1xT21QOj/R8foTK', '9849158487', '', 'WARANGAL', '0', 8, 0, '9849158487', '7730099707', '2026-04-02 05:30:32', '2024-07-04 04:26:56', NULL, NULL, NULL, NULL),
(442, 'Subbu chitirala', '8074510695', '$2y$10$uPIerQHOAIREkbow.OkIp.MwZk86Fwbg1s4zVDRpNjd8SnyNRMHbG', 'subbu123', '', 'Vijayawada', '0', 8, 0, '8074510695', '9347901004', '2026-04-02 05:30:32', '2024-07-04 07:12:35', NULL, NULL, NULL, NULL),
(443, 'VIJAY', '9010776290', '$2y$10$bs5MpjISgjTIvJ78eCNhBuFfT/Wfo//LsFnpvJ/N0KShOpvHa1J32', 'Gvk@90', '', 'Kothaguda', '0', 8, 0, '9010776290', 'admin', '2026-04-02 05:30:32', '2024-07-04 08:32:49', NULL, NULL, NULL, NULL),
(444, 'Jairam goud', '8074852657', '$2y$10$BthihZar94AUbZVUevGjcOSm1dKBqx.VJY9//LEuRlTlBpJ5FmZcG', '123456789@', '', 'Hydernagar', '0', 8, 0, '8074852657', 'admin', '2026-04-02 05:30:33', '2024-07-04 08:33:12', NULL, NULL, NULL, NULL),
(445, 'PAYAM NARASIMHARAO', '9948351390', '$2y$10$UPHE4Y9mhX5XFQ0eXGVkIun00gfzqaAlpyu0ai3om3lcLgM9wuEPq', '9948351390', '', 'Mulakalapalli', '0', 8, 0, '9948351390', '7702381784', '2026-04-02 05:30:33', '2024-07-04 08:41:07', NULL, NULL, NULL, NULL),
(446, 'Mogal nagesh', '8247775163', '$2y$10$AqvMwN4MJOgAOk40f9v5AevP7NNOSHHbggVZCjy/U2JZfc3lrtC6m', '808812@Mn', '', 'Hyderabad', '0', 8, 0, '8247775163', 'admin', '2026-04-02 05:30:33', '2024-07-04 08:42:54', NULL, NULL, NULL, NULL),
(447, 'Bathini Ushakiran gowd', '9666015151', '$2y$10$dKIm3ci35fyb8GSBGXOFJ.BPrQ0pHi.ETz0zdlI/EV6DH0G6MetHi', 'ukgowd22', '', 'Suryapet', '0', 8, 0, '9666015151', 'admin', '2026-04-02 05:30:33', '2024-07-04 08:54:19', NULL, NULL, NULL, NULL),
(448, 'Rajamoni kalyan', '9701562996', '$2y$10$wdSYPdwFgYpRwVRlnBSl4OKowWSSGVkxi41qy2YcQy6evnu3q94dS', 'kalyan1234', '', 'Wanaparthy', '0', 8, 0, '9701562996', 'admin', '2026-04-02 05:30:33', '2024-07-04 09:00:29', NULL, NULL, NULL, NULL),
(449, 'M KISHORE', '9704628932', '$2y$10$mI/sd4BWw9sXFQ8V4fVSUOxBOXos79J0OGAP/7.kBRcjijKAjlfD2', 'Abcd6666@', '', 'warangal', '0', 8, 0, '9704628932', 'admin', '2026-04-02 05:30:33', '2024-07-04 09:16:29', NULL, NULL, NULL, NULL),
(450, 'Sreenath', '9177198539', '$2y$10$CU.eYeONdfaRGgh5nZXi4.9sgfL00zHFIWJErt6lDPraH0s0aWOFO', 'Manusree@123', '', 'Warangal', '0', 8, 0, '9177198539', '9948541315', '2026-04-02 05:30:33', '2024-07-04 09:39:37', NULL, NULL, NULL, NULL),
(451, 'Rajamoni hariKrishna', '7799864174', '$2y$10$IB5it9hng908qwbWMNC/BeUOr3K7r554hqxQ7MWnXN68.EqB7sTgy', '963871 miya', '', '963871 miya', '0', 8, 0, '7799864174', 'admin', '2026-04-02 05:30:33', '2024-07-04 09:41:15', 'Kanchiraopally', 'Wanaparthy District', 'Telangana', '509120'),
(452, 'Tikka balraj', '9581404314', '$2y$10$P4T4LXld2rkg7bPPt6Fv2OSLWFQD4KzPsuVlgcsc9AwW/YVxhTeIC', 'balraj958', '', 'Pebbair', '0', 8, 0, '9581404314', 'admin', '2026-04-02 05:30:33', '2024-07-04 09:56:44', NULL, NULL, NULL, NULL),
(453, 'Nerella Sathish', '9966113963', '$2y$10$0TniDO1Z8ZDOqnE8EPIvdud1AAnA87wZPBvDgJ1NxgLHnZ62hkL4y', 's@742010', '', 'Jayashankar Bhupalapally', '0', 8, 0, '9966113963', '9948541315', '2026-04-02 05:30:33', '2024-07-04 14:15:47', NULL, NULL, NULL, NULL),
(454, 'B. Ramu', '9391441469', '$2y$10$Rc/hMkjo8WBXh1N9yAU67upoYWxdp5NbbrvDmq7Z65KW7Rj1poiwS', 'Ram@123', '', 'Bhadrachalam', '0', 8, 0, '9391441469', 'admin', '2026-04-02 05:30:33', '2024-07-04 15:01:33', NULL, NULL, NULL, NULL),
(455, 'A. Krishna', '9248482045', '$2y$10$h5xOXGX3Yhg.aKAms4XELOdkpYW20H2i16RWY.8jEh/chctPlxp16', '9248482045', '', 'Medak', '0', 8, 0, '9248482045', 'admin', '2026-04-02 05:30:33', '2024-07-05 05:54:16', NULL, NULL, NULL, NULL),
(456, 'Srikanth', '9182070608', '$2y$10$fayOn4c6GUU/bzOsFs0iputzniBnwYiUsqRhx.B2WBq8shfosvqWS', 'srikanth', '', 'Thorrur, mahabubad', '0', 8, 0, '9182070608', '7702381784', '2026-04-02 05:30:33', '2024-07-05 06:31:23', NULL, NULL, NULL, NULL),
(457, 'Sri vardhan', '9182986938', '$2y$10$QbPSYGR8xbG8XM0FXlBv1Ov.g1jaqeQwwh6dKfykku7uPe83NennS', 'tillugoud', '', 'Hyderabad', '0', 8, 0, '9182986938', 'admin', '2026-04-02 05:30:33', '2024-07-05 11:21:40', NULL, NULL, NULL, NULL),
(458, 'R chakri', '9010193291', '$2y$10$BKZS6/Z.IarDjGlnw7AT6equIW73CCCISLQGxXtwsHss8NNcM/uBm', 'swathi143', '', 'Mahabub nagar', '0', 8, 0, '9010193291', 'admin', '2026-04-02 05:30:33', '2024-07-05 13:14:17', NULL, NULL, NULL, NULL),
(459, 'Saiteja', '9581493492', '$2y$10$SSZcNX8IX4jsaxsbXkCGp.o1Hrk445LsABxx8XM4TCtuWKqYulE7e', 'Sai1234@', '', 'BEGUMPET', '0', 8, 0, '9581493492', 'admin', '2026-04-02 05:30:33', '2024-07-06 05:46:14', NULL, NULL, NULL, NULL),
(460, 'Jandakadi Sandeep goud', '9059726136', '$2y$10$G/Mwg82EIj67hAabUQSY5ex1JGUAFmaq0BsxDl5fQdD52/l9XI3gG', 'chitti@8179', '', 'Medak', '0', 8, 0, '9059726136', 'admin', '2026-04-02 05:30:33', '2024-07-06 06:04:19', NULL, NULL, NULL, NULL),
(461, 'K SRNIVAS', '9177958146', '$2y$10$GX72V34GazjKW19s37xrkuZ0d7GxrKF3sPX6V1wV16Ds5TV5y4bhS', '9177958146', '', 'HUZURABAD', '0', 8, 0, '9177958146', '7702381784', '2026-04-02 05:30:34', '2024-07-06 06:56:55', NULL, NULL, NULL, NULL),
(462, 'CH VIJAY KUMAR', '8978876766', '$2y$10$FtiwC4r5SLlvLsa6.o/uPed7R2JYQzCyMZ5Sqt1sA2mEyOOMvf4Fa', '4520', '', 'Mancherial', '0', 8, 0, '8978876766', '7702381784', '2026-04-02 05:30:34', '2024-07-06 11:20:57', NULL, NULL, NULL, NULL),
(463, 'L. Srinivas', '9908796071', '$2y$10$scMlV.zjZ9WSb/XNFkcHLuws1gOspnYAUzEAizVbGnupnKvp/fM5W', '5885', '', 'Rajaram thanda', '0', 8, 0, '9908796071', '7702381784', '2026-04-02 05:30:34', '2024-07-06 12:34:37', NULL, NULL, NULL, NULL),
(464, 'Dappu Raju', '6304915993', '$2y$10$gj6sZQFuXqsPGMUrGcWYr.KEHGoAjh2DiUuEwP9VIqZUVTZWuhsq.', '915993', '', 'Paravathapur', '0', 8, 0, '6304915993', '7702381784', '2026-04-02 05:30:34', '2024-07-06 13:00:35', NULL, NULL, NULL, NULL),
(465, 'P KIRAN KUMAR', '8897368210', '$2y$10$nSPoB/WOFEh8zxHaWLG7beG8c/57S/6yx8HgUt8eUs3sJo4cRHq5m', 'asdf1234', '', 'NAGOLE Hyderabad', '0', 8, 0, '8897368210', '7702381784', '2026-04-02 05:30:34', '2024-07-06 13:01:18', NULL, NULL, NULL, NULL),
(466, 'Ponnala Yadaiah', '9398125622', '$2y$10$a0pkr8OcabvckAZKhVnF1um49djNEqPrYgY096JN9DkK4ObxPO2de', 'SurendaR@007', '', 'Hyderabad', '0', 8, 0, '9398125622', '7702381784', '2026-04-02 05:30:34', '2024-07-06 13:54:37', NULL, NULL, NULL, NULL),
(467, 'Aravind Maknoor', '9848107208', '$2y$10$MP3cI97yBooo3gS1Uk8P2uN/kduXHv84AXK5R4a./DvY8DIgBoBTi', 'Addmag@9825', '', 'Hyderabad', '0', 8, 0, '9848107208', '7702381784', '2026-04-02 05:30:34', '2024-07-06 14:36:29', NULL, NULL, NULL, NULL),
(468, 'Venkatesh', '9640282463', '$2y$10$yiQaCcShgJIuf2O.jLVg8.hAIt5BUkx.jBoQY/cbcYca3vRRMxKtW', '781978', '', 'Armoor', '0', 8, 0, '9640282463', '7702381784', '2026-04-02 05:30:34', '2024-07-06 14:44:48', NULL, NULL, NULL, NULL),
(469, 'Mohammad shaibaaz', '9492447725', '$2y$10$/vBIo15k6nXborvVhfHlLeB2Od1zueWmvsEhw7joJJHjU6FVjXpuy', '1712', '', 'Vikarabad', '0', 8, 0, '9492447725', '7702381784', '2026-04-02 05:30:34', '2024-07-06 14:45:41', NULL, NULL, NULL, NULL),
(470, 'Srinivasa Rao', '9908312343', '$2y$10$8OL0nAKmgxGyz7sN1NBRxOwcQQlCQFICl7MH.OTsvVqwjzr.qHItm', '6767', '', 'Bhavani Colony.5-4-117/3.hyd..30', '0', 8, 0, '9908312343', '7702381784', '2026-04-02 05:30:34', '2024-07-06 15:17:55', NULL, NULL, NULL, NULL),
(471, 'M. Prakash', '9381309444', '$2y$10$bthqIMqeU27eQfqmbq6sI.Qpu5HTNRSU18WeiR1Yly6M.sDcFbEqS', 'roj938', '', 'Sugoor', '0', 8, 0, '9381309444', 'admin', '2026-04-02 05:30:34', '2024-07-06 15:29:32', NULL, NULL, NULL, NULL),
(472, 'KOILAKONDA RAMESH', '9666797654', '$2y$10$lp/9cIvMgQJOBIRs6QLfHe5T5/NdYrVd.GShYL28EoObLmE0oBKnG', '9505', '', 'Kurnool', '0', 8, 0, '9666797654', '7702381784', '2026-04-02 05:30:34', '2024-07-06 15:51:13', NULL, NULL, NULL, NULL),
(473, 'Selvaraj', '9951494726', '$2y$10$iAjy.ZsqAhzbrMcF80AgcujWuMtL4/iiHxHT1js9xSv6ZqIUnhCza', 'selva@123', '', 'Khammam', '0', 8, 0, '9951494726', '7702381784', '2026-04-02 05:30:34', '2024-07-06 17:12:10', NULL, NULL, NULL, NULL),
(474, 'Muvvala Mahesh', '9492463326', '$2y$10$RMHDUaaJuhuKI38JfXZwSuhq.5/bWzWyR5CYDaQ5rVqWjMtTTB9Wq', 'Mahesh225', '', 'Bangarumetta vanugupalli Paderu alluri seetha ramaraju', '0', 8, 0, '9492463326', '7702381784', '2026-04-02 05:30:34', '2024-07-06 17:16:49', NULL, NULL, NULL, NULL),
(475, 'Afifa naaz', '7095745552', '$2y$10$xCqy73y2E4UjKLykXQpYgOlli3LvYZRYngKy8j25MKxIDds44IcWC', 'bhavitha', '', 'Pebbair', '0', 8, 0, '7095745552', 'admin', '2026-04-02 05:30:34', '2024-07-06 17:23:28', NULL, NULL, NULL, NULL),
(476, 'Chinna', '7799004255', '$2y$10$qsX.3QDdtlCl77/FTIFZcuw3ztvq81FJKUEUI17iKrnHFeIWf2zz2', 'shirisa 27', '', 'Kanchara palem', '0', 8, 0, '7799004255', 'admin', '2026-04-02 05:30:34', '2024-07-06 18:09:16', NULL, NULL, NULL, NULL),
(477, 'Nalupothula Suresh', '7799418729', '$2y$10$ts3ZsuG9RCEL8kHAL5D7J.33NgfN5t5MHSvyWAyFRrujECjj1Y7sy', 'reshma begum', '', 'Kamalapur', '0', 8, 0, '7799418729', 'admin', '2026-04-02 05:30:34', '2024-07-06 18:24:49', NULL, NULL, NULL, NULL),
(478, 'R Karthik', '8142194308', '$2y$10$sEcH8FghpZ3Zejb1f1NCLuhtjIF5WAS/Z5NDeUcuvtigXu1qn5acG', 'meghana smily', '', 'Kanchiraopally', '0', 8, 0, '8142194308', 'admin', '2026-04-02 05:30:35', '2024-07-06 18:30:40', NULL, NULL, NULL, NULL),
(479, 'Pallemoni krishna', '9505496014', '$2y$10$0Z0ykeSl8SnHt90oecz7lOQInk9VWXoyaJ6qoEL.pZbVfgx7f3mIq', 'nandhini 014', '', 'Kanchiraopally', '0', 8, 0, '9505496014', 'admin', '2026-04-02 05:30:35', '2024-07-06 18:34:03', NULL, NULL, NULL, NULL),
(480, 'Muralidhar Annam', '9948581676', '$2y$10$gl7dbSx9OhNT.wZ4eY7xne9vB6xjfmg8PoSTn4gbhLhL.IwoiGDPi', '9948581676', '', 'Hyderabad', '0', 8, 0, '9948581676', 'admin', '2026-04-02 05:30:35', '2024-07-06 18:38:05', NULL, NULL, NULL, NULL),
(481, 'KUSU KARNA KUMAR', '6301693200', '$2y$10$A/a6RW8.JGJByT8v9O1lKe7A35TEYXKP6CZNw3HvWD6sVFOyW.I8G', 'Karna@8376', '', 'Khammam', '0', 8, 0, '6301693200', 'admin', '2026-04-02 05:30:35', '2024-07-06 23:45:18', NULL, NULL, NULL, NULL),
(482, 'anand', '9347619484', '$2y$10$g2txrqZG73Ic8Zyx6xeVg.Y9TWCLgEeg7uyVDuFqhpj2BE8OamSt.', 'anand1979', '', 'hyderabad', '0', 8, 0, '9347619484', 'admin', '2026-04-02 05:30:35', '2024-07-07 00:56:36', NULL, NULL, NULL, NULL),
(483, 'Venkat', '9703454947', '$2y$10$u4aK4B3l.ZfiFV6yOkSNYuIPicZU8TAVSSTEfit/YenEAVY4oV0iK', 'sairaM583', '', 'Ashok nagar', '0', 8, 0, '9703454947', '7702381784', '2026-04-02 05:30:35', '2024-07-07 01:43:00', NULL, NULL, NULL, NULL),
(484, 'SRINIVAS RAO K', '9441790038', '$2y$10$iJqf39D.AV8VldoAawqYmumWo5RIDzca.YrE6wBw4Hqt8l2.eHvZe', 'kota6669', '', 'GUNTUR', '0', 8, 0, '9441790038', '7702381784', '2026-04-02 05:30:35', '2024-07-07 02:09:32', NULL, NULL, NULL, NULL),
(485, 'Singampalli Devakumar', '6301354851', '$2y$10$/Nld0fH2apGOu7B0bDm9jeCEY/UEQxAm7czXMtahA1f1Tz9Hae/3S', 'devakumar6301', '', 'Guntur', '0', 8, 0, '6301354851', 'admin', '2026-04-02 05:30:35', '2024-07-07 02:26:40', NULL, NULL, NULL, NULL),
(486, 'Gongidi Narsimhulu', '9573115806', '$2y$10$X.LA/nX4c9AoDStJ.opzauc0ZTf7PsET/pTT0k42SELhzKOEWDeSK', '9573115806', '', 'Jangaon', '0', 8, 0, '9573115806', '7702381784', '2026-04-02 05:30:35', '2024-07-07 02:50:50', NULL, NULL, NULL, NULL),
(487, 'Suresh Babu', '9392483993', '$2y$10$Bm4.BFd5Ly8iUhdRUqOtpOG8tsrdJHXcqRf8OKF1D6epCGjXMiBO6', 'Suresh143@', '', 'Nagole', '0', 8, 0, '9392483993', 'admin', '2026-04-02 05:30:35', '2024-07-07 03:45:45', NULL, NULL, NULL, NULL),
(488, 'ASHOK E', '6302159932', '$2y$10$t7fl4McmLBKWaIPXZe/HaulOXrjGyBOhJs.jZv2q5Jen6E48PTMz.', '12345#@', '', 'Mahbubnagar', '0', 8, 0, '6302159932', 'admin', '2026-04-02 05:30:35', '2024-07-07 03:47:46', NULL, NULL, NULL, NULL),
(489, 'Rajashekar', '8639140781', '$2y$10$7Im6dzFtdqtzb7iBD5acsuNn7/D8IXXXR4Ct9qHHORgaa264B6Waq', 'raju_roxzz2003', '', 'New mothinagar mahabubnagar telangana', '0', 8, 0, '8639140781', 'admin', '2026-04-02 05:30:35', '2024-07-07 03:47:49', NULL, NULL, NULL, NULL),
(490, 'Veerababu', '9959595710', '$2y$10$qxFvjfKEnXJoS32/9n8hhOH7wofE9joayinUK/IeOOcak.Nin4ON.', 'veera1234', '', 'Hyderabad', '0', 8, 0, '9959595710', 'admin', '2026-04-02 05:30:35', '2024-07-07 04:25:04', NULL, NULL, NULL, NULL),
(491, 'S vijay kumar', '9685950793', '$2y$10$qb/ejpjIMsdG7E0m.8aJR.5FSoQ/TJMqyzX6DfP/nlIeB4/ljBSku', 'Svijay@83', '', 'Raipur', '0', 8, 0, '9685950793', 'admin', '2026-04-02 05:30:35', '2024-07-07 05:23:14', NULL, NULL, NULL, NULL),
(492, 'PGK RAO', '9393308578', '$2y$10$CV6gcXLZkpI6ZxZh8D4L7.VjxlYBFgJQKxT0VYUOCH1doYlsVBsOm', '123mahesh', '', 'malkajgiri', '0', 8, 0, '9393308578', 'admin', '2026-04-02 05:30:35', '2024-07-07 08:14:46', NULL, NULL, NULL, NULL),
(493, 'G SUDARSHAN', '7780121644', '$2y$10$FgkmiYVUOUGt274XDqZaN.8e6NkO0uBCrlYKxDctc0tDzUiZsUnWa', '7780121644', '', 'BORABANDA HYD', '0', 8, 0, '7780121644', 'admin', '2026-04-02 05:30:35', '2024-07-07 09:23:03', NULL, NULL, NULL, NULL),
(494, 'N Paramesh', '9652555125', '$2y$10$msjajzEj6opzsRyNHp16qODMxDNShMQBelOHk3H59Zw72VxqVZO3i', 'Nani@143', '', 'Hyderabad', '0', 8, 0, '9652555125', '7702381784', '2026-04-02 05:30:36', '2024-07-07 11:23:12', NULL, NULL, NULL, NULL),
(495, 'Kamal Yadav', '8374882151', '$2y$10$8g3K3qp4ST1KVXYJ/Lc3mOplQZqyLApgM.FDhrFDj/uQpnBa3PiCK', 'kamalyadav25', '', 'Hyderabad', '0', 8, 0, '8374882151', '9515932113', '2026-04-02 05:30:36', '2024-07-07 11:39:30', NULL, NULL, NULL, NULL),
(496, 'K.vijayabharathi', '9391278540', '$2y$10$c8lfATS62Mt9GI.1NPmsAeLRteX2Gw5vu92mqzSZUlNYIM80ejrG2', 'bharathi1922', '', 'MAHABUBNAGER', '0', 8, 0, '9391278540', '6302159932', '2026-04-02 05:30:36', '2024-07-07 12:57:20', NULL, NULL, NULL, NULL),
(497, 'I SATYANARAYANA', '9293238677', '$2y$10$6opg5BnsHJbAv1Hvpxd4meaM5z/V.1DRpMUSrWvgtqKtGmgYI1wNS', 'ABCDe1234&', '', 'bhimavaram', '0', 8, 0, '9293238677', 'admin', '2026-04-02 05:30:36', '2024-07-07 13:15:01', NULL, NULL, NULL, NULL),
(498, 'Mohd mastan', '9948321186', '$2y$10$xN7Y5ZjYiMEDKs4IRMsmWuPi4B71eGRMpa1MyVdB/bCO4LWnFaeii', 'ak128good***', '', 'Hyderabad', '0', 8, 0, '9948321186', 'admin', '2026-04-02 05:30:36', '2024-07-07 13:18:52', NULL, NULL, NULL, NULL),
(499, 'G V GURU NARAYANA', '9440423295', '$2y$10$7D9tuj1kYsI6I7.Ytl2Y.utxYKIuYX/ARZ6mo72ACY4KuO.pLifTW', 'Guru@1973', '', 'GUDIVADA', '0', 8, 0, '9440423295', '7702381784', '2026-04-02 05:30:36', '2024-07-07 14:21:05', NULL, NULL, NULL, NULL),
(500, 'SHIVA', '7386714626', '$2y$10$uK6On4UiN/ntuNv9Daig.uIldt5lyED./2sKGigK9W5cWv4HE2Ucy', '181106', '', 'malkajgiri, hyderabad', '0', 8, 0, '7386714626', 'admin', '2026-04-02 05:30:36', '2024-07-07 15:01:17', NULL, NULL, NULL, NULL),
(501, 'Rahul', '9848022338', '$2y$10$i3AACdMZPFNsaM5cFT916eiex145rnf45yy6PMWNwfGbADielb/6m', 'qwertyuiop', '', 'Vijayawada', '0', 8, 0, '9848022338', 'admin', '2026-04-02 05:30:36', '2024-07-07 17:59:15', NULL, NULL, NULL, NULL),
(502, 'Potu Siva krishna', '9885617129', '$2y$10$imo5QNcaRwf9e11IJ0VNxuX78A0vAPxU9mEFI1r4xp8NpXGWS0kcm', '7129', '', 'Khammam', '0', 8, 0, '9885617129', '6301693200', '2026-04-02 05:30:36', '2024-07-07 18:31:57', NULL, NULL, NULL, NULL),
(503, 'Kuruba govindarajulu', '9390485997', '$2y$10$0pKsyNJjfT.QZyOhYStt/.CfdVEZgiLV3i6EpV19fP7WK95EIV1z6', 'govind@2024', '', 'R.c.puram', '0', 8, 0, '9390485997', 'admin', '2026-04-02 05:30:36', '2024-07-08 08:38:27', NULL, NULL, NULL, NULL),
(504, 'GUNDU BHASKAR', '6305641650', '$2y$10$JObtFsNusmSRBkgot37jP.yp/gTorYBk4XDQ0lV1b/uEzY70eWRtW', 'Kavyasri12345', '', 'Valigonda', '0', 8, 0, '6305641650', '7702381784', '2026-04-02 05:30:36', '2024-07-08 08:46:46', NULL, NULL, NULL, NULL),
(505, 'SRINIVASA RAO', '9000787596', '$2y$10$hNgAOZJnbTTBWIEy/2kCgOB9.QhFRmJoT.ZCdoPB2q8nc6mpp5GZ6', '9000787596', '', 'Beeramguda hyd', '0', 8, 0, '9000787596', 'admin', '2026-04-02 05:30:36', '2024-07-08 11:17:34', NULL, NULL, NULL, NULL),
(506, 'S. Ramesh', '9652919522', '$2y$10$i4goB01WJSO4zi8GUKcfyusnUROMAztH2zJ.sqKzOcyHlg54bNXge', '9652919522', '', 'LB. Nagar', '0', 8, 0, '9652919522', '9000787596', '2026-04-02 05:30:36', '2024-07-08 11:36:28', NULL, NULL, NULL, NULL),
(507, 'G VENKATESHA', '6360245900', '$2y$10$sdzE8KNLCz29QgL2nlxZieeYD2KBs6TeK8pMyET5cCGr.SiH78.4O', 'Mourya@1971', '', 'Bangalore south', '0', 8, 0, '6360245900', '7702381784', '2026-04-02 05:30:36', '2024-07-08 16:36:48', NULL, NULL, NULL, NULL),
(508, 'Taniru Parvathi', '8520924381', '$2y$10$he6UUxdoLvrQ0E.Rq9l92.bjQWjVwXY2ffKEcdzeVuHawg8BtT03u', '123456789ammu', '', 'Hyderabad', '0', 8, 0, '8520924381', '7207462300', '2026-04-02 05:30:36', '2024-07-09 03:38:37', NULL, NULL, NULL, NULL),
(509, 'Shiva', '9347615656', '$2y$10$DxTKBLKcqzxXERU7.VAU4eWixBHmBSLUcb0PN.c00h22Gylp8m/lC', '321321', '', 'Hyderabad', '0', 8, 0, '9347615656', 'admin', '2026-04-02 05:30:36', '2024-07-09 06:11:08', NULL, NULL, NULL, NULL),
(510, 'Naveen Kumar Ch', '9553982296', '$2y$10$LgoLGbUdzi81WbDUpw3Tme/Gf4AwZaRsg7unPBy8IKmF5gVh3v/SC', 'npgs4023', '', 'Hyderabad', '0', 8, 0, '9553982296', 'admin', '2026-04-02 05:30:36', '2024-07-09 16:06:37', NULL, NULL, NULL, NULL),
(511, 'Prashant Reddy', '9866338539', '$2y$10$KafQ.VD32iWjz/pMtkarTOvAS8MbkZ..RBzKnLeChKOGbOIOK5SMe', '9866', '', 'Hanamkonda', '0', 8, 0, '9866338539', '9948541315', '2026-04-02 05:30:37', '2024-07-10 04:51:44', NULL, NULL, NULL, NULL),
(512, 'M. P. V.Devendra kumar', '7795577455', '$2y$10$n4RkQI24fujBOS20L5Bqtu9WXOp0jYvoQCr5gElleCf5uuYI351e6', '7795577455', '', 'Guntur', '0', 8, 0, '7795577455', 'admin', '2026-04-02 05:30:37', '2024-07-10 09:44:38', NULL, NULL, NULL, NULL),
(513, 'Sruthy', '6301442318', '$2y$10$zVJ7zvV8v4MCWzZQSNfROuaY/4k.k3rB.2.0Cnol/UhATrxcuY8y2', 'sruthyart.06', '', 'Kondapur', '0', 8, 0, '6301442318', 'admin', '2026-04-02 05:30:37', '2024-07-10 11:15:12', NULL, NULL, NULL, NULL),
(514, 'Surya', '7416946599', '$2y$10$ODWKd/sfgsk5yM3Sx9CkpuVwmClpjjnoQERMjKQ0f3S.8G919XaGe', 'S123456', '', 'Hyderabad', '0', 8, 0, '7416946599', 'admin', '2026-04-02 05:30:37', '2024-07-11 05:09:46', NULL, NULL, NULL, NULL),
(515, 'Rampelli Mallesham', '9640457520', '$2y$10$MwZPoi7uBBhJK9y4tKpqkOqKO1znGSaqfWFmITnVNI8Vqr2i00sFO', 'Mallesham@123', '', 'Jangaon', '0', 8, 0, '9640457520', '9948541315', '2026-04-02 05:30:37', '2024-07-11 12:02:08', NULL, NULL, NULL, NULL),
(516, 'Vijayalakshmi', '9515324515', '$2y$10$cBggMdksv1deO4X//KEpduEq5Gl92bUsNwvn1982X4pqjkHj3.L2q', 'srilu1419', '', 'Vijayawada', '0', 8, 0, '9515324515', '9291290683', '2026-04-02 05:30:37', '2024-07-11 14:14:40', NULL, NULL, NULL, NULL),
(517, 'Ricky kumar', '9949989707', '$2y$10$e.ioEYVXLN.WSwKj90aO0.QfF2J.oRZxUTj8uRiK6r939EYcpUaOq', 'ricxee.25', '', 'Hyderabad', '0', 8, 0, '9949989707', '9515932113', '2026-04-02 05:30:37', '2024-07-12 07:19:16', NULL, NULL, NULL, NULL),
(518, 'Srihari Marepalli', '8341123780', '$2y$10$uQ4UI4Scc794VA.8IB6NUOvKkv8n4D65Q5A85mOHRH7Ixe/9/UYtu', 'hari120708', '', 'Hyderabad', '0', 8, 0, '8341123780', '9515932113', '2026-04-02 05:30:37', '2024-07-12 12:15:00', NULL, NULL, NULL, NULL),
(519, 'Mahesh', '8121709735', '$2y$10$4AG2kmXqaPHvi0gu8BEuluFz4ag94LwMK4uzYKLAKqy5Ug/3Pb3Cy', '9063027886', '', 'Hyderabad', '0', 8, 0, '8121709735', '9515932113', '2026-04-02 05:30:37', '2024-07-12 12:18:56', NULL, NULL, NULL, NULL),
(520, 'Thammuluri suresh babu', '6301487614', '$2y$10$Gl/n6l2gCsbiK4SC2R2Mo.zvKCcYPwyXNKInMvB9sBZpyQ8pBGCC6', 'sasank99', '', 'Martur', '0', 8, 0, '6301487614', '7702381784', '2026-04-02 05:30:37', '2024-07-12 17:54:42', NULL, NULL, NULL, NULL),
(521, 'Vamshi', '9494842767', '$2y$10$w48GskzBCM8rc/bIRgz9QuRLd6ova3sv11v4QuIEMMV0k3HPNz1Bi', 'vam903010', '', 'Hanmakoda', '0', 8, 0, '9494842767', '9948541315', '2026-04-02 05:30:37', '2024-07-13 02:01:30', NULL, NULL, NULL, NULL),
(522, 'S.Ravi', '6301444701', '$2y$10$ZkxFgLTq4f4/n9go6EtuFu8jyZIdEanH49KBjvtaNuNxIQ5uMoAjW', '6301444701', '', 'Sulthanabad', '0', 8, 0, '6301444701', '9948541315', '2026-04-02 05:30:37', '2024-07-13 04:12:01', NULL, NULL, NULL, NULL),
(523, 'Paidi Akhila Reddy', '9010119617', '$2y$10$e4Uaqyd/QjC8Wpu6uwencO4eA1Ld3lWydbWUZ2tfdngRJOlpAPw46', 'akkireddy@123', '', 'Chaithanyapuri (hyderabad), 500060', '0', 8, 0, '9010119617', '7416946599', '2026-04-02 05:30:37', '2024-07-13 10:45:27', NULL, NULL, NULL, NULL),
(524, 'Madhu', '8341282890', '$2y$10$9Oo3enZ.pFMz0AhpT7hkXuymy1O54f8JN6zrfs1cO.mGwuqz0TL4O', 'Madhu@123', '', 'Hyderabad', '0', 8, 0, '8341282890', '7416946599', '2026-04-02 05:30:37', '2024-07-13 10:48:02', NULL, NULL, NULL, NULL),
(525, 'Mahin', '8074778047', '$2y$10$oHUJRHoaanYoswDGh4/jz.NfVfg1dxVOs8L/Kv3I3.l054GMN8g.G', 'mahinjasim', '', 'Chanchalguda', '0', 8, 0, '8074778047', '7416946599', '2026-04-02 05:30:37', '2024-07-13 11:05:41', NULL, NULL, NULL, NULL),
(526, 'Kamireddy surekha', '9059992834', '$2y$10$.Mp4PKJ6J.qcuSTKsanCt.WPkWoUgnQ5XSD1FPBFiqa2cHr1wzf6y', 'rekhareddy135', '', 'Hyderabad, chaitanyapuri', '0', 8, 0, '9059992834', '7416946599', '2026-04-02 05:30:37', '2024-07-13 11:06:00', NULL, NULL, NULL, NULL),
(527, 'AGATAMUDI SAITEJA', '9100812339', '$2y$10$uH/ReGW.nWVW0cvTku2xYebieREwDy8lnWW4ltpBZ3jVD7t.bYaFW', 'Sai@1234', '', 'L.b nagar', '0', 8, 0, '9100812339', '7416946599', '2026-04-02 05:30:37', '2024-07-13 11:06:33', NULL, NULL, NULL, NULL),
(528, 'Poojitha', '9014331089', '$2y$10$8N5xqwzvye0KRS6aYdsEhubfPsbt/xiVnP.aJRDC0Lr2/MiK73y12', 'pooji4647', '', 'Lb nagar Hyderabad', '0', 8, 0, '9014331089', '7416946599', '2026-04-02 05:30:38', '2024-07-13 11:06:41', NULL, NULL, NULL, NULL),
(529, 'eslavath shirisha', '9182606585', '$2y$10$Hd1ze4gWLDvtfZDT6gmVZO2j86cXdDAca.DNh1iLeenYZFevIEC3a', 'shirisha', '', 'Lb nagar hyd', '0', 8, 0, '9182606585', '7416946599', '2026-04-02 05:30:38', '2024-07-13 11:06:56', NULL, NULL, NULL, NULL),
(530, 'Rathlavath Saritha', '9391417719', '$2y$10$EA5dSCy1yi4HHI53atTVjO0UxrmKZoLvGsii3/SzcwTATaEAJwmAy', '12345678', '', 'TKR', '0', 8, 0, '9391417719', '7416946599', '2026-04-02 05:30:38', '2024-07-13 11:07:28', NULL, NULL, NULL, NULL),
(531, 'Maheshawari', '7093940771', '$2y$10$8rs.kkj0c3N3pjCaBG3wE.4JgSXuvwAJGyPfcwiB7PVOTp5Y6QxMm', 'Mounika', '', 'L.b nagar', '0', 8, 0, '7093940771', '7416946599', '2026-04-02 05:30:38', '2024-07-13 11:08:59', NULL, NULL, NULL, NULL),
(532, 'Maheshwari', '9663379889', '$2y$10$4HdtlyVJvNLS9ribB6KyteevreXjfX2fyIICsGbwW.U5f5XiacKfy', 'mahi098', '', 'Dilsukhnagar', '0', 8, 0, '9663379889', 'admin', '2026-04-02 05:30:38', '2024-07-13 11:17:05', NULL, NULL, NULL, NULL),
(533, 'R Rajesh', '7013301897', '$2y$10$y12on3FeSh/3jtZciu1xk.jq.Q539ON8DQRVRF6jAFcvhibpKT5du', 'Rajesh@123', '', 'Uppal', '0', 8, 0, '7013301897', '7416946599', '2026-04-02 05:30:38', '2024-07-13 12:33:06', NULL, NULL, NULL, NULL),
(534, 'Chandrashekhar', '9346579702', '$2y$10$VeTWaj1pL3mpFZ8dEDdZl.61ZqKYMVgeuOpwAgafr4U0l0SAUAdCG', '8096471949', '', 'Hyderabad', '0', 8, 0, '9346579702', '7416946599', '2026-04-02 05:30:38', '2024-07-13 13:49:27', NULL, NULL, NULL, NULL),
(535, 'Abhimanyu', '9603999957', '$2y$10$5B1t88fjls1/NtfXApZP8eCLP1/.gqYyJq1NUVW7JKFPT53WhNFeK', 'Blsy8154', '', 'Hyderabad', '0', 8, 0, '9603999957', '9515932113', '2026-04-02 05:30:38', '2024-07-13 14:16:45', NULL, NULL, NULL, NULL),
(536, 'AKula Venkateswarlu', '9866089575', '$2y$10$/5rkQtEfoIeEiprm0njbhOGsJ5upsSAj9LRLOdko7H5p4A6zZQd8O', 'venkat@1234', '', 'Bhadrachalam', '2000', 8, 0, '9866089575', '7702381784', '2026-04-02 05:30:38', '2024-07-14 08:25:24', NULL, NULL, NULL, NULL),
(537, 'N RAMAKRISHNA', '9848905979', '$2y$10$TJg0ScuPsJNqV4saEQjHUOTYY2iGB8tJou2lKOHK5yculbTrvK4PC', '123456', '', 'Bhadrachalam', '0', 8, 0, '9848905979', '9866089575', '2026-04-02 05:30:38', '2024-07-14 09:09:40', NULL, NULL, NULL, NULL),
(538, 'Dr ELAGAM ASHOK SIVA KUMAR', '9849213534', '$2y$10$K.V9oXxEZnv1HWLhfvTZFeTPsUzAWcW9qixArwezD5EWNuXdIttyW', 'Ashoksiva@9849', '', 'BHADRACHALAM', '0', 8, 0, '9849213534', '9866089575', '2026-04-02 05:30:38', '2024-07-14 13:56:48', 'H.No: 15-1-71, BHAGAVAN DAS COLONY', 'BHADRACHALAM', 'Telangana', '507111'),
(539, 'Parsika sampath kumar', '9985839192', '$2y$10$fX77lMdm7WOIZ0n9p5oWCeUIFfkbd9gEET5Yke7EYJldId2VcJ/Cy', 'sampu', '', 'Bhadrachalam', '0', 8, 0, '9985839192', '9866089575', '2026-04-02 05:30:38', '2024-07-15 04:38:50', NULL, NULL, NULL, NULL),
(540, 'PULLAIAH KOLAGANI', '9908796769', '$2y$10$.jQOc//ZV3TpAOoRgiBr.eG.ryHXUQHbNDaSxIgVkEPW.G96OSzZW', '123456', '', 'BHADRACHALAM', '0', 8, 0, '9908796769', '9866089575', '2026-04-02 05:30:38', '2024-07-15 04:58:58', NULL, NULL, NULL, NULL),
(541, 'Ch lenin', '8247699975', '$2y$10$yOth3wrjvu.2jcOjKJa3FOGZpg7S.CxICwvQl6hLHE8KdU59P0z4W', 'lenin75', '', 'Sathupalli', '0', 8, 0, '8247699975', '9848905979', '2026-04-02 05:30:38', '2024-07-15 05:06:46', NULL, NULL, NULL, NULL),
(542, 'Akula sai prasad', '6303264395', '$2y$10$1znZLOMDp6qI/EQ5QEO6pOslGx57lro78uaflC1LIbrqg72/C8IsW', '1757', '', 'Dummugudem', '0', 8, 0, '6303264395', '9866089575', '2026-04-02 05:30:38', '2024-07-15 05:53:11', NULL, NULL, NULL, NULL),
(543, 'Banothu Rambabu', '7702335508', '$2y$10$jvx47JFZaWuf/rj.Uut3CuFRJxIChXqEtS2UwtJV6TGohH37010va', 'ram123456', '', 'Bhadrachalam', '0', 8, 0, '7702335508', '9866089575', '2026-04-02 05:30:38', '2024-07-15 06:09:04', NULL, NULL, NULL, NULL),
(544, 'Shruthy', '6303270697', '$2y$10$UP0xROFNXUNPLTl27e0VYeIPNy7UUvLo1IeiCvceiYsOFa3XOpNN2', 'Sm@rt2023', '', 'Hyderabad', '0', 8, 0, '6303270697', 'admin', '2026-04-02 05:30:39', '2024-07-15 06:31:37', NULL, NULL, NULL, NULL),
(545, 'Korsa Narashiharao', '9652307816', '$2y$10$uJ6XPjSC5s41.PJwG0iOZeRXLu6YFogl7H/4u80M1ZYTCVlcLXItq', 'Ammu@1431', '', 'Bhadrachalam', '0', 8, 0, '9652307816', '9866089575', '2026-04-02 05:30:39', '2024-07-15 06:33:54', NULL, NULL, NULL, NULL),
(546, 'Rai Shyamsunder Rao', '9666537165', '$2y$10$tKsZKdshoNc4BK5nDzfh5O487zkP7d/4THDR7NjJeIPneeIRvLykG', 'R1234567', '', 'Bhadrachalam', '0', 8, 0, '9666537165', '9866089575', '2026-04-02 05:30:39', '2024-07-15 06:51:50', NULL, NULL, NULL, NULL),
(547, 'P RAKESH', '8919633188', '$2y$10$U8B3ChpmBTpsGaUACuc4culACL8dzWN5zJqBxXFOQPERBh2rwGs.W', '8919633188', '', 'KARMANGHAT HYD', '0', 8, 0, '8919633188', '7702381784', '2026-04-02 05:30:39', '2024-07-15 07:30:02', NULL, NULL, NULL, NULL),
(548, 'Satish Kumar', '8639928191', '$2y$10$iS3JwUXC1aXU9ISWeVRG3.vZJPN20Ysow9gywKCvEbX3vA6rUXdSm', 'airapapa2019', '', 'Warangal', '0', 8, 0, '8639928191', '9866089575', '2026-04-02 05:30:39', '2024-07-15 09:22:33', NULL, NULL, NULL, NULL),
(549, 'Akula. Guru Syam Naidu', '9700131399', '$2y$10$chhWptgeXwg9v.oSF3lzGu0R.4wVbWA9ZPwswXWRwC0JveE57ZM9G', '@guru$naidu93', '', 'D.no.1-174, 2 floor 202fleet,Behind Sivalayam , Srinivasam Building. Gudavalli - Velpuru Road,  VIJAYAWADA RURAL.', '0', 8, 0, '9700131399', '9866089575', '2026-04-02 05:30:39', '2024-07-15 12:13:52', NULL, NULL, NULL, NULL),
(550, 'A .Rughved patel', '9666697515', '$2y$10$XEm0eTjbv/TbeIkZYVifyeq4A6ZD/58q92mz9Whg3ahzrBcQgwwfi', 'ruggved@9999', '', 'Hyderabad', '0', 8, 0, '9666697515', '9866089575', '2026-04-02 05:30:39', '2024-07-15 13:50:04', NULL, NULL, NULL, NULL),
(551, 'akula mallesh', '9652336864', '$2y$10$eUKdpNiF4CqVJjzO9vGbkuk/EmyVhgWwbUjOebz6/VjBnXE/INiMG', 'a965233m', '', 'Karimnagar', '0', 8, 0, '9652336864', '9866089575', '2026-04-02 05:30:39', '2024-07-15 14:08:01', 'H-no7-13 Gokulnagar Bommakal', 'Karimnagar', 'Telangana', '505001'),
(552, 'Kishan nayak', '9700773390', '$2y$10$EybXD5Ps1fscD5Qo4mbX0O3eEwTj.3tLcxIp3KMypogOaYe4ldmJK', 'bunny', '', 'Balapur', '0', 8, 0, '9700773390', '9866089575', '2026-04-02 05:30:39', '2024-07-15 14:46:36', NULL, NULL, NULL, NULL),
(553, 'Vivek', '7995385370', '$2y$10$tagG7V4ddoHLR.aFhcaig.gKACB9qrJ7mo2R21N2YI7/FJ4DjMDT.', 'Teddy@12345', '', 'Malkajgiri', '0', 8, 0, '7995385370', '7416946599', '2026-04-02 05:30:39', '2024-07-15 17:39:29', NULL, NULL, NULL, NULL),
(554, 'Kommu.Mohan rao', '8985379195', '$2y$10$tZ7RIAsLvYdXDBpv5PZSXu3hQvvWF52ELlpQUxvRlebzWzjcgYNTi', 'ADD MAGpro@1', '', 'Bhadrachalam', '1000', 8, 0, '8985379195', '9866089575', '2026-04-02 05:30:39', '2024-07-16 13:45:18', NULL, NULL, NULL, NULL),
(555, 'Hasan farista', '9390100190', '$2y$10$IX1kwoeO3xRrZN5Iy3VEHOYkpxHMQ.VZHgYOI5LamtBYACPiV29u.', 'samkaren', '', 'Warangal', '0', 8, 0, '9390100190', 'admin', '2026-04-02 05:30:39', '2024-07-17 09:42:08', NULL, NULL, NULL, NULL),
(556, 'Venkatesh', '8897461646', '$2y$10$Iipu893XbxGtyuo3mLiRx.NAQCRO17icX3GaEjWbR9S5TxjZmzBp6', '12345', '', 'Balnagar hdrabad', '0', 8, 0, '8897461646', '7416946599', '2026-04-02 05:30:39', '2024-07-18 04:29:16', NULL, NULL, NULL, NULL),
(557, 'SkAmir', '9133941845', '$2y$10$jP9Y3JMIHZho/Ls9nHS2G.2biXYG.7rQ8l6I0RvgzJ3JRqaujUE0i', 'amir12300', '', 'Hyderabad', '0', 8, 0, '9133941845', '8522881144', '2026-04-02 05:30:39', '2024-07-18 06:50:02', NULL, NULL, NULL, NULL),
(558, 'G.sanjay', '8121316048', '$2y$10$ab2N8aYQbK2sgF0OdaChseIeRE1OQ6VFADfp.wfAvJ3cjRrej3J16', '123456', '', 'Hyderabad', '0', 8, 0, '8121316048', '9685950793', '2026-04-02 05:30:39', '2024-07-19 09:11:54', NULL, NULL, NULL, NULL),
(559, 'Jawahar', '7569493015', '$2y$10$ODn5OhpeTddVNk.lZssbyOeAiicryIsb8oL.ZwhJX3mmsFmyHDANu', '7569493015@j', '', 'Hyderabad', '0', 8, 0, '7569493015', 'admin', '2026-04-02 05:30:39', '2024-07-19 14:37:55', NULL, NULL, NULL, NULL),
(560, 'K V N VIKRAM', '9989145115', '$2y$10$APX3TcMqo.dJ8nnvkiALCOOnYefsbxBvPEtOYrmmn9gC9/T3ZcvzK', 'Meena123*', '', 'Hyderabad', '0', 8, 0, '9989145115', '7702381784', '2026-04-02 05:30:39', '2024-07-20 06:08:29', NULL, NULL, NULL, NULL),
(561, 'MUDANGULA SRINIVAS', '9032224566', '$2y$10$2VLf8A71XfTsVDNDKlU.DuUxJH4kugJVZqXB.hXOxd95gT1Rzg5kK', '9032224566', '', 'BORABANDA HYD', '0', 8, 0, '9032224566', '7702381784', '2026-04-02 05:30:39', '2024-07-20 08:47:49', NULL, NULL, NULL, NULL),
(562, 'Satya', '9642579000', '$2y$10$q19aVQOTjb/17JihoNGoCeyq6UhB3DvnnhCSsMSSlIS62NBj30nCS', 'Addmag@9870', '', 'Secunderabad', '0', 8, 0, '9642579000', 'admin', '2026-04-02 05:30:40', '2024-07-21 05:01:29', NULL, NULL, NULL, NULL),
(563, 'Asadi.ramireddy', '8121991921', '$2y$10$DPc5gZoR1r84hwkIh2.gZuYioKzcXj9dcoTGz/zV6MasSqmqspKSm', '8121991921', '', 'Chirala', '0', 8, 0, '8121991921', '7702381784', '2026-04-02 05:30:40', '2024-07-21 07:19:19', NULL, NULL, NULL, NULL),
(564, 'Kondra srikanth goud', '8688007154', '$2y$10$Y6oPpmCcEGkZv/aGyQlRvua11N/GjpQ6EqXO9T2P1eErBQ9JdrkMa', '112233', '', 'Salugupally', '0', 8, 0, '8688007154', '7702381784', '2026-04-02 05:30:40', '2024-07-21 07:41:15', NULL, NULL, NULL, NULL),
(565, 'Ramu G', '8099095432', '$2y$10$5VOisBvEmI0xrUFmkXWLiOcty6QKnd8H4qjZ0H3BJSR003xrwJR.C', '8522852201', '', 'hyd', '0', 8, 0, '8099095432', 'admin', '2026-04-02 05:30:40', '2024-07-21 07:47:53', NULL, NULL, NULL, NULL),
(566, 'Arvind Kumar Dundigalla', '9885251200', '$2y$10$ayokRLHxDOBhr5nmbQy4nerSWTl8LPjsaLBx9n3l3zf15kmpbSQ1K', '2865', '', 'Ecil Hyderabad', '0', 8, 0, '9885251200', '9989145115', '2026-04-02 05:30:40', '2024-07-21 07:48:59', NULL, NULL, NULL, NULL),
(567, 'Imandi ramaswamy', '9866937161', '$2y$10$5v/KOnsF6Y6QDLGoyY4owee7zaRnW9Yf3cSeJRf2gG.Qm5hM5tz9q', 'sriram09', '', 'Mangalagiri', '0', 8, 0, '9866937161', '7702381784', '2026-04-02 05:30:40', '2024-07-21 07:51:01', NULL, NULL, NULL, NULL),
(568, 'Naveen Balla', '9908145262', '$2y$10$mcUQJmQCIbB3b/bodTn8Xu8GHe1ZhhGvhMAUR42G1jKFTzZ/64iXa', '123456', '', 'Hyderabad', '0', 8, 0, '9908145262', '7702381784', '2026-04-02 05:30:40', '2024-07-21 07:54:18', NULL, NULL, NULL, NULL),
(569, 'Nakka sheshaiah', '9505228060', '$2y$10$cqPekBgzkvYaRB4xIIZcAuvAmLO4N0BADNACIXCSChrfX6St/jLni', '9505228060', '', 'Kollapur', '0', 8, 0, '9505228060', '7702381784', '2026-04-02 05:30:40', '2024-07-21 08:09:08', NULL, NULL, NULL, NULL),
(570, 'P V PRAVEEN KUMAR', '9502714591', '$2y$10$5dwC0O0WFWv6dyASbBNn9.9wV0jwqaM4uMKtrkuIcXYdVClhHsvaO', '9502714591', '', 'SAFILGUDA HYD', '0', 8, 0, '9502714591', '7702381784', '2026-04-02 05:30:40', '2024-07-21 08:32:06', NULL, NULL, NULL, NULL),
(571, 'Srikanth', '9885666085', '$2y$10$xtTP4wpVSSnpPeban9LB3OMqg/4e0qL25ZG1430qzYoqSSf.j8swG', '123456789', '', 'Tadvai', '0', 8, 0, '9885666085', '7702381784', '2026-04-02 05:30:40', '2024-07-21 08:56:35', NULL, NULL, NULL, NULL),
(572, 'Gugulothu Ravinaik', '9493888949', '$2y$10$9HlTZaWroEgOb/aiwI58R.7M5LbVarpZw36n4H1wElG9cepn3Om1q', 'Ravi@1983', '', 'Garakunta thanda', '0', 8, 0, '9493888949', '7702381784', '2026-04-02 05:30:40', '2024-07-21 12:15:02', NULL, NULL, NULL, NULL),
(573, 'Lingala mogulaiah', '7207915465', '$2y$10$cxhETBIXOGQKe4f1cZmIWejajLw9jwyUZpFu90gv5CTBp8X3v28RS', '5024', '', 'Kompalli', '0', 8, 0, '7207915465', '7702381784', '2026-04-02 05:30:40', '2024-07-21 12:18:32', NULL, NULL, NULL, NULL),
(574, 'V.Chandu', '9966262253', '$2y$10$A8Cs72L4E8FSZuWBV4Q9fugRXJwQEPR7oMe17ATXGSZmMnGlQd4vK', 'chansu7111', '', 'Hanamkonda', '0', 8, 0, '9966262253', '7702381784', '2026-04-02 05:30:40', '2024-07-21 12:21:22', NULL, NULL, NULL, NULL),
(575, 'Saicharan', '9100318759', '$2y$10$iUp2yiK5jh7TLcda8PoZKewhWE76umh1qonDFmYb4Awvtjyut5s7i', 'sai123456', '', 'Kothagudem', '0', 8, 0, '9100318759', '7702381784', '2026-04-02 05:30:40', '2024-07-21 12:24:57', NULL, NULL, NULL, NULL),
(576, 'Swamy', '9177206862', '$2y$10$5iDRVPX5j2uzjC3LxG1Tt.o2eCJMM5zszmM3Eym6Dg8kegEC3K4QG', '55555', '', 'Balnepally', '0', 8, 0, '9177206862', '7702381784', '2026-04-02 05:30:40', '2024-07-21 12:29:17', NULL, NULL, NULL, NULL),
(577, 'KUMMARI Govardhan', '9908643884', '$2y$10$ZR3T2xTJoDWceQBLwHvq9.UyYwRaiWkYGq96DbIsahy6dGlZlH6dq', '9908643884', '', 'khammam', '0', 8, 0, '9908643884', '7702381784', '2026-04-02 05:30:40', '2024-07-21 12:30:08', NULL, NULL, NULL, NULL),
(578, 'Naser khan', '8080052206', '$2y$10$PCPHVvEHAT9MfAxmKmnW2eR6S39CaPcDqYSXm9xReBhzMsQ2tZ3Ia', 'nk455654', '', 'Parbhani maharashtra', '0', 8, 0, '8080052206', '7702381784', '2026-04-02 05:30:40', '2024-07-21 12:32:33', NULL, NULL, NULL, NULL),
(579, 'Balasubramanyam', '9290530485', '$2y$10$RXOcNT5EuJyABThGeaQphO6beDdriTewCB3vcQEspG8pxd8J5Q5nu', 'Bala@1962', '', 'Hyderabad', '0', 8, 0, '9290530485', 'admin', '2026-04-02 05:30:41', '2024-07-21 13:11:07', NULL, NULL, NULL, NULL),
(580, 'Satelli.Shivakumar', '9676470366', '$2y$10$za9cNwwZuVt7qNvvjw6ODOUonf4boyFiRhRbEzRB88k.GeKQyCE9.', '565657', '', 'Medak', '0', 8, 0, '9676470366', '7702381784', '2026-04-02 05:30:41', '2024-07-21 13:46:50', NULL, NULL, NULL, NULL),
(581, 'Balaji', '7659036968', '$2y$10$8K0m/WpiacOqzuK9wrm.oeuUXkNTf4NDe2UrkUN9yt8jpGFrMoJym', '2626rbjn', '', 'Nalgonda district Telangana state', '0', 8, 0, '7659036968', '7702381784', '2026-04-02 05:30:41', '2024-07-21 13:50:22', NULL, NULL, NULL, NULL),
(582, 'Kanaka jyothiram', '8688561331', '$2y$10$HzbzQLASo229UN5smy3MtOp9GZavNp9tSWK7lWAzmZgTmO0EaO/Si', 'RKJRAM5673', '', 'Jainoor', '0', 8, 0, '8688561331', '7702381784', '2026-04-02 05:30:41', '2024-07-21 13:50:39', NULL, NULL, NULL, NULL),
(583, 'P Arun Kumar', '9849338874', '$2y$10$oBFkFANaEfKYzordWPzMNup0R3E.DTzZP0ktaBFDDeANzWXNn5Zo6', 'arun@123', '', 'Kakinada', '0', 8, 0, '9849338874', '9866089575', '2026-04-02 05:30:41', '2024-07-21 13:55:58', NULL, NULL, NULL, NULL),
(584, 'BHASHYAM RAJESH KUMAR GOUD', '9052299724', '$2y$10$ToQObW1bLhis0X59Z3u31eXoGspXheLXCrsM8bTpN/2hcZF6uKv3G', '90522997@', '', 'Atmakur', '0', 8, 0, '9052299724', '7702381784', '2026-04-02 05:30:41', '2024-07-21 14:59:45', NULL, NULL, NULL, NULL),
(585, 'Sriram Laxman', '9247868752', '$2y$10$vF3vG/gVW.O6WZ6l3AMmgO7asQj7SCrLXtYBlLORzXgEJJ5yfH.PO', '97081552980', '', 'Hyderabad', '0', 8, 0, '9247868752', 'admin', '2026-04-02 05:30:41', '2024-07-21 15:27:37', NULL, NULL, NULL, NULL),
(586, 'arun kumar', '8106719482', '$2y$10$MAje9ZNlPmQrD3RD6BHSI.GjucE2e3eyem9s.Uw/Q.SmEYyasNy0C', '810671ga@', '', 'Karimnagar', '0', 8, 0, '8106719482', '7702381784', '2026-04-02 05:30:41', '2024-07-21 15:32:40', NULL, NULL, NULL, NULL),
(587, 'arun kumar', '8639756353', '$2y$10$BD7WcgoLoBnbW7YYYbndiONax8Fs2xd2CkIuzxLwvQETqcwTCd7fe', '810671', '', 'Karimnagar', '0', 8, 0, '8639756353', 'admin', '2026-04-02 05:30:41', '2024-07-21 15:35:58', NULL, NULL, NULL, NULL),
(588, 'Krishnamachari', '9848454487', '$2y$10$P2ooTRWVwes1bMmVEXPTiuiI3I0IlNdYR2NkKny38wbhrEMgfR.Ga', 'QLn6hD4QujFNRLH', '', 'Disukhnagar', '0', 8, 0, '9848454487', '7702381784', '2026-04-02 05:30:41', '2024-07-21 15:54:47', NULL, NULL, NULL, NULL),
(589, 'Kanna', '8897455391', '$2y$10$q9IvfDmJ8kJj28WE3xVEeOZWthba5grDSwx78DaicljnZm5hGohd.', 'Kanna@2024', '', 'Eluru', '0', 8, 0, '8897455391', 'admin', '2026-04-02 05:30:41', '2024-07-21 16:40:22', NULL, NULL, NULL, NULL),
(590, 'E,balachary', '7893559125', '$2y$10$Ze/OaA.lMYXrD7.sYYcK.uQsTaUSw1jE2MSnjFBDkehWZnY5cBN.K', '789355', '', 'Bibipet', '0', 8, 0, '7893559125', '7702381784', '2026-04-02 05:30:41', '2024-07-21 18:57:42', NULL, NULL, NULL, NULL),
(591, 'DAGGULA BALRAM', '7093483212', '$2y$10$gQi.3qD3U9yZ21uBwaCcIe8oJUca8ZmwK0rTliT7YKXqivKOMmjSy', '12345', '', 'Godavari khani', '0', 8, 0, '7093483212', '7702381784', '2026-04-02 05:30:41', '2024-07-22 01:03:39', NULL, NULL, NULL, NULL),
(592, 'Subhanjee', '9550681175', '$2y$10$kgSVqcIFArN0FK2/IbfZ8Oi5lSR4lypMfNKXU9umRXdkIo/hv9CJe', '3366', '', 'Dharur M. Vikarabad dist', '0', 8, 0, '9550681175', '7702381784', '2026-04-02 05:30:41', '2024-07-22 04:06:46', NULL, NULL, NULL, NULL),
(593, 'SHAIK PEERSAHEB', '7780185005', '$2y$10$hzJCyT5M3xM.ujtxHHA.sOpkx2oqm5077UaRuNZ7589sMcPkp4vF2', 'Basha@786', '', 'VIJAYAWADA', '0', 8, 0, '7780185005', '7702381784', '2026-04-02 05:30:41', '2024-07-22 06:01:49', NULL, NULL, NULL, NULL),
(594, 'S A BALA KRISHNA', '9550872614', '$2y$10$KiM47hZWP.226quYfDop3OtPh2ebXGkKF..zlSCphORqjDGYF5zh6', 'Harsha@009', '', 'Hyderabad', '0', 8, 0, '9550872614', 'admin', '2026-04-02 05:30:41', '2024-07-22 10:27:38', NULL, NULL, NULL, NULL),
(595, 'Humyum kabeer', '9652959621', '$2y$10$sWUMU4EBziMYEeIhtXhIdOoP2OeabiJFbMkE99ezMnn78G5t87Hdy', '123456', '', 'Adarsha Nagar Hyderabad', '0', 8, 0, '9652959621', 'admin', '2026-04-02 05:30:41', '2024-07-22 11:06:09', NULL, NULL, NULL, NULL),
(596, 'Manthri ravikumar', '9948635135', '$2y$10$xZbODS7iDRcIuKXYo0rAHOE0Uzb.nexjKJ0iR8aVpeWgAoHhDyXES', '1234', '', 'సూర్యాపేట', '0', 8, 0, '9948635135', '7702381784', '2026-04-02 05:30:42', '2024-07-22 11:07:44', NULL, NULL, NULL, NULL),
(597, 'Ks  chakravarti', '9934192939', '$2y$10$zfyw48gkBaz6ITu2jUf22u29XkOvBuVxwu2N8r3OKwrateh98BPuu', '1234', '', 'Guntur', '0', 8, 0, '9934192939', '7702381784', '2026-04-02 05:30:42', '2024-07-22 12:33:32', NULL, NULL, NULL, NULL),
(598, 'Y V LAXMANA SAI', '8374771405', '$2y$10$lPNaj..bkemEyCpDeHJNzeDLXPt8GA1ZjvBFKvsOG1QuZnMQO12zS', '8374771045', '', 'HYDERABAD', '0', 8, 0, '8374771405', '9502714591', '2026-04-02 05:30:42', '2024-07-22 12:57:13', NULL, NULL, NULL, NULL),
(599, 'Srikanth', '7671916793', '$2y$10$irQqtOVHrfgT6yvPgrNOd.wI8m99X8sDJW6qHaE2sOk.gBSdZFp8a', 'APplesred*9092', '', 'Hyderabad', '0', 8, 0, '7671916793', 'admin', '2026-04-02 05:30:42', '2024-07-22 15:04:18', NULL, NULL, NULL, NULL),
(600, 'Mamidi Kalamma', '7286913813', '$2y$10$aW01z9WirHuEjtxNWony4.nfkLHZCDJMhFMzTHxltWIy/ZZIIH3za', '1985', '', '11-14-252/b new Haripuricolonyroad no 3lbnagar SAROOR NAGAR RR dist  pin 500074', '0', 8, 0, '7286913813', '9347901004', '2026-04-02 05:30:42', '2024-07-22 15:21:21', NULL, NULL, NULL, NULL),
(601, 'Dharavath mohan', '9642464464', '$2y$10$.qul2tB8yvYczwjiSCKcteMSUbnkJW/bu2TrgOG0Vy/CELrTA0FIC', '7893283117', '', 'Khammam', '0', 8, 0, '9642464464', 'admin', '2026-04-02 05:30:42', '2024-07-23 01:30:19', NULL, NULL, NULL, NULL),
(602, 'RAJKUMAR', '9128245456', '$2y$10$fVtdT6j0/T3c9zNtNgIaxuCK5tjRsBbt5iJ1/ijQBdX2dqzKaV0y.', '654321', '', 'Hyderabad', '0', 8, 0, '9128245456', 'admin', '2026-04-02 05:30:42', '2024-07-23 03:00:46', NULL, NULL, NULL, NULL),
(603, 'MS SEKHAR', '8919093375', '$2y$10$avOWYYjZ1BU30YeczawZW.uDDlbgkv0ylGUyhuqKZDvyuSF0hYHou', 'SwapnaS3khar15', '', 'Bhadrachalam', '0', 8, 0, '8919093375', '9866089575', '2026-04-02 05:30:42', '2024-07-23 07:37:57', NULL, NULL, NULL, NULL),
(604, 'Medaboina Venkanna', '8121324918', '$2y$10$qjO.aJYqYMgbfnTeid0It.T5TbjgaiNHC3HTYERSMYTkMbtAsUnOi', 'Venkat@4918', '', 'Thirumalagiri', '0', 8, 0, '8121324918', 'admin', '2026-04-02 05:30:42', '2024-07-23 11:54:08', NULL, NULL, NULL, NULL),
(605, 'Hemadrirao.P', '9553799533', '$2y$10$o1tFBlskDo3alwWmE2YITuo.jTRZnW1adf/fcHa5leb40OM.o01EG', 'naga999', '', 'Miyapur', '1050', 8, 0, '9553799533', 'admin', '2026-04-02 05:30:42', '2024-07-24 05:36:44', NULL, NULL, NULL, NULL),
(606, 'GORE VIJAY KUMAR', '7981872912', '$2y$10$qkyjbYfXmVX8FhD.cFtCgu.Q1jqZlNT9FfnXxeMPstvqtkyualsWS', '7981872912', '', 'BEERAMGUDA', '0', 8, 0, '7981872912', 'admin', '2026-04-02 05:30:42', '2024-07-24 08:42:49', 'Beeramguda', 'Hyderabad', 'Telangana', '502032'),
(607, 'Quadeer Mirza', '7013217737', '$2y$10$SgHEf/0PArUCgofePByxtOXe9jbNQ73W.i/1IguxZR1oCvBlYlRdy', 'Adilabad', '', 'Adilabad', '0', 8, 0, '7013217737', '9866089575', '2026-04-02 05:30:42', '2024-07-25 05:11:27', NULL, NULL, NULL, NULL),
(608, 'S v ramana', '9490369676', '$2y$10$uwEcmMg18vBKyP31n7aCoOEME6sMQRGo6q7cZSpXv9Cp89Rz4RZz6', '6300025891', '', 'Manuguru', '0', 8, 0, '9490369676', '9866089575', '2026-04-02 05:30:42', '2024-07-26 09:54:14', NULL, NULL, NULL, NULL),
(609, 'shravan m', '9573011223', '$2y$10$ra9i7SmdxdC5Lw2QWpqgoOshN/6NZDATiudY9v7AwkSQetobzzAsC', '9573011223', '', 'sircilla', '0', 8, 0, '9573011223', '7702381784', '2026-04-02 05:30:42', '2024-07-26 14:42:20', NULL, NULL, NULL, NULL),
(610, '6281799675', '6281799675', '$2y$10$xTZDgMfPQKJI47E6FpgQGe5zOHTL95qmPb2n7JvrQRz.lZSq/Ns8W', '12345678', '', 'Vartoor', '0', 8, 0, '6281799675', '7702381784', '2026-04-02 05:30:42', '2024-07-27 07:16:42', NULL, NULL, NULL, NULL),
(612, 'Anitha', '7729058545', '$2y$10$BfHS2CScOM4BZFZKFyW3HemVVZC8FDak.oHGtbQpGjJZfkoOJNZGa', 'Anitha@231', '', 'Hyderabad', '0', 8, 0, '7729058545', '9642579000', '2026-04-02 05:30:42', '2024-07-28 03:54:34', NULL, NULL, NULL, NULL),
(613, 'Hari Krishna Devineni', '9000039569', '$2y$10$ddaSfKfuiFzRaolewEzeDuMNin/LBCCHHzy4QzI1kNd6iACRXhZe6', 'Devineni@4453', '', 'Hyderabad', '0', 8, 0, '9000039569', 'admin', '2026-04-02 05:30:43', '2024-07-28 06:05:57', NULL, NULL, NULL, NULL),
(614, 'RAMESH DURGA', '8886285518', '$2y$10$iQF1BhrLr9ZakQxSzlLMRul6FrqQh2RSo208aQ4Zk.WyuSxi3TZKW', 'Ramesh@87', '', 'Khammam', '0', 8, 0, '8886285518', '7674992736', '2026-04-02 05:30:43', '2024-07-28 10:49:32', NULL, NULL, NULL, NULL),
(615, 'Varaka Vishnu', '8897124132', '$2y$10$fxftdzohIjs3PodabQbjceX1frAEfcTR417V7q/JDC/SiwxF5SA8m', '8897124132', '', 'Bhadrachalam', '0', 8, 0, '8897124132', '8985379195', '2026-04-02 05:30:43', '2024-07-28 14:28:37', NULL, NULL, NULL, NULL),
(616, 'dilip talluri', '8121112228', '$2y$10$/OLpwI8IVBavOI5gSEmx5usRTCBpi1snYbMDLZSPP6TY.xVFatqIu', 'talluriS3', '', 'Khammam', '0', 8, 10000, '8121112228', '7674992736', '2026-04-02 05:30:43', '2024-07-28 14:46:46', NULL, NULL, NULL, NULL),
(617, 'Lakshminarayana', '8523857763', '$2y$10$U6nWe8Q0gOzDcem1klnVkepGhYl/2sOJlTlAcQP61W2jeMZeNWhLW', 'lnforlion', '', 'Vanasthalipuram, Hyderabad', '0', 8, 0, '8523857763', 'admin', '2026-04-02 05:30:43', '2024-07-29 12:54:58', NULL, NULL, NULL, NULL),
(618, 'Pithani Ramu', '8374318026', '$2y$10$kHSHnVB.QgKhqyVvZ6XhCuZsYkN50Blx3rQNqD3/TEKpUqz8OOW8G', '8374318026', '', 'Ameerpet', '0', 8, 0, '8374318026', '8522881144', '2026-04-02 05:30:43', '2024-07-30 09:14:57', NULL, NULL, NULL, NULL),
(619, 'D.V RAGHAVA RAO', '9652239129', '$2y$10$r0HkDfJqxuyj2Hd/RqgZLu8Q09KmX7UJ5cu8CRvOtYnOc5zTX7JiK', '9652239129', '', 'CHIKKDAPALLY', '0', 8, 0, '9652239129', 'admin', '2026-04-02 05:30:43', '2024-07-31 10:20:31', NULL, NULL, NULL, NULL),
(620, 'P. SURYANARAYANA', '9030194180', '$2y$10$Wa94OoNqGE15P5jdU.cz/.AqAsHA4Y2fbVU1hwvLFUXVDT1J1ieMe', '9030194180', '', 'GUNTUR-522004', '0', 8, 0, '9030194180', '9291290683', '2026-04-02 05:30:43', '2024-07-31 16:49:53', NULL, NULL, NULL, NULL);
INSERT INTO `service_users` (`service_id`, `member_name`, `member_phone`, `password`, `open_password`, `user_profile_pic`, `location`, `cumulative_gross`, `commission_percentage`, `back_two_back_balance`, `referral_id`, `referral_by`, `created_at`, `joined_date`, `address`, `city`, `state`, `pincode`) VALUES
(621, 'Y  Sathish', '9177253668', '$2y$10$r5NdOHzGoKfs7Vs89bRLG.yHV3zFl2Om0ZGVa4guChku/9mRyRhrG', '9177253668', '', 'Vijayawada', '0', 8, 0, '9177253668', '9291290683', '2026-04-02 05:30:43', '2024-07-31 18:00:36', NULL, NULL, NULL, NULL),
(622, 'G Venkateswarao', '9494460822', '$2y$10$bGyOYc7ZWEntyZH0Nsss.Oe4so2uzhatu5jcaWUFnj6Q7t31IvHM2', '9494460822', '', 'Guntur', '0', 8, 0, '9494460822', '9291290683', '2026-04-02 05:30:43', '2024-07-31 18:09:17', NULL, NULL, NULL, NULL),
(623, 'M.M. Basha', '9989237692', '$2y$10$.gceANLvHl.ZyrpOxjtYb.IJO93ekMsm2wZveu8DVM5p2HzsecCsq', 'realestate', '', 'Safilguda', '0', 8, 0, '9989237692', '9502714591', '2026-04-02 05:30:43', '2024-08-01 12:28:32', NULL, NULL, NULL, NULL),
(624, 'T. Shankar Rao', '9642327282', '$2y$10$X2jxfqI7OOhgU1mlV.Hqne2HdhVEeRv3PqhMCn5ZMqYP/wmVJav3G', 'realestate', '', 'sithaphalmandi', '0', 8, 0, '9642327282', '9502714591', '2026-04-02 05:30:43', '2024-08-01 12:30:25', NULL, NULL, NULL, NULL),
(625, 'P. Dheeraj Himendra', '9885449729', '$2y$10$KF5soVd1Ktjb9Wsni7YU6e/84Gh5XPgvkKgJHYR4q6RkeMi3STXx.', 'realestate', '', 'Uppal', '0', 8, 0, '9885449729', '9502714591', '2026-04-02 05:30:43', '2024-08-01 12:34:38', NULL, NULL, NULL, NULL),
(626, 'K. Maheswar', '9912962717', '$2y$10$Dhpq9J7HJrNR/nzQrE5wJOGMnSTkndtipoMjlev5Wyq1tBGxqQQ2a', 'realestate', '', 'Banjara hills', '0', 8, 0, '9912962717', '9502714591', '2026-04-02 05:30:43', '2024-08-01 12:45:48', NULL, NULL, NULL, NULL),
(627, 'KURRA ANITHA', '6302822638', '$2y$10$ht67GaxeEBQjLiUJ/31kM.HEZeDXsyIs1fUJd/01MsXLDtbQhf5pO', 'AXLEBOX', '', 'ECIL HYD', '12348', 10, 3300, '6302822638', '7702381784', '2026-04-02 05:30:43', '2024-08-01 13:07:22', NULL, NULL, NULL, NULL),
(628, 'KURRA NARSIMHA', '7075075689', '$2y$10$0ezduaDVc3kGE0K3YBlbV.wd.52pKOvI76EtiZ/Oqi4afQ3rHL24C', '7075075689', '', 'NEW MIRJALGUDA   SECUNDERABAD', '0', 8, 0, '7075075689', '6302822638', '2026-04-02 05:30:43', '2024-08-01 14:21:13', NULL, NULL, NULL, NULL),
(629, 'POILA CHITTI BABU', '9491443072', '$2y$10$klPqvi40WJkZlpzN94gnJedLDNwIn9AQ5udpvlJpPPAkf5/LHpjAO', '949144', '', 'Hydrabad', '7048', 8, 3048, '9491443072', '6302822638', '2026-04-02 05:30:43', '2024-08-01 15:55:22', NULL, NULL, NULL, NULL),
(630, 'M raju', '9676178290', '$2y$10$j15RwGARFbUTXFVFMTo18OkQDjYMUUSA9ND1bCra9VQ3F/3E9BcrS', '8290', '', 'Zaheerabad', '0', 8, 0, '9676178290', '9491443072', '2026-04-02 05:30:43', '2024-08-02 02:27:24', NULL, NULL, NULL, NULL),
(631, 'Goutam', '9985806676', '$2y$10$.hZqt.tIE1PT7CmVZAdMRePqeAr7NmvlUpkME2TpR80cmMBC8DSLO', '9985806676', '', 'Yellareddyguda', '0', 8, 0, '9985806676', '8522881144', '2026-04-02 05:30:44', '2024-08-02 05:57:14', NULL, NULL, NULL, NULL),
(632, 'Asra begum', '9908934456', '$2y$10$Tr64BUg8tZJci9qeQZHsg.jk6G0t6fGJdCPKk680NuYqp0TviktgW', '786786', '', 'Hyderabad', '0', 8, 0, '9908934456', '9491443072', '2026-04-02 05:30:44', '2024-08-02 07:08:38', NULL, NULL, NULL, NULL),
(633, 'MD sadiq', '9133965787', '$2y$10$fHlD3bCGq0jBvGrAct.Yt.7GDrystuSoZCiSokkDWAyEtfG2RGwIy', '9133965787', '', 'Moosapet', '0', 8, 0, '9133965787', '7702381784', '2026-04-02 05:30:44', '2024-08-02 14:01:57', NULL, NULL, NULL, NULL),
(634, 'Vijay kumar', '9391050359', '$2y$10$EMT.4UtBlpsA1sSHndBga.B1.zuLCMH.EdDKNvelwjy1GbX4OQQau', 'Kurra123', '', 'Hyderabad', '0', 8, 0, '9391050359', '6302822638', '2026-04-02 05:30:44', '2024-08-02 16:45:56', NULL, NULL, NULL, NULL),
(635, 'U Ashok', '9391738024', '$2y$10$MhOAgMrAacUQN/ZnJYNcAOoLdEmK3uomBN2eSOMJ/uF0uvpQ7yhf.', '93917338024', '', 'Ameerpet', '0', 8, 0, '9391738024', '8522881144', '2026-04-02 05:30:44', '2024-08-03 12:50:05', NULL, NULL, NULL, NULL),
(636, 'Bala krishna', '8309467554', '$2y$10$u9SWeW5v70xQqDINO0hvQON.500oxlqCC7FeuXMlMrTQVmLz2Dxsy', '23july23', '', 'Ameerpet', '0', 8, 0, '8309467554', '8522881144', '2026-04-02 05:30:44', '2024-08-03 13:29:54', NULL, NULL, NULL, NULL),
(637, 'AILIGONDA manohar goud', '8074218460', '$2y$10$248jgzUEZntI25XUmGWvjuHXg.1uVuEy4ihSTp6awdnOUXvBPxo..', '807421', '', 'Siddipet', '0', 8, 0, '8074218460', '7702381784', '2026-04-02 05:30:44', '2024-08-04 06:19:38', NULL, NULL, NULL, NULL),
(638, 'Santhosh', '9603395952', '$2y$10$pYyF76wn0jcitcli7LYn9uIpABmF0IqBHyU14uQmvuZQWj/w0yxma', 'santhosh', '', 'తెలంగాణ', '0', 8, 0, '9603395952', '7702381784', '2026-04-02 05:30:44', '2024-08-04 06:24:30', NULL, NULL, NULL, NULL),
(639, 'VUKE MUTTAIAH', '7702268188', '$2y$10$I8bCcXdTxHKJ6JLzJqJyX.0nbXzDIxl/4uFuh/e33Pzj4jnJlPV7O', '555000', '', 'Manuguru', '0', 8, 0, '7702268188', '7702381784', '2026-04-02 05:30:44', '2024-08-04 06:35:50', NULL, NULL, NULL, NULL),
(640, 'Venugopala Chary Arroju', '8121401401', '$2y$10$lKHS3G/AzPjYgt5hYAHZV.TonKHLzSfpu9DItSHZJ4GqZZzOseYCO', 'saiDeep2009@', '', 'Boduppal', '0', 8, 0, '8121401401', '8522881144', '2026-04-02 05:30:44', '2024-08-04 11:43:32', NULL, NULL, NULL, NULL),
(641, 'M Venkata Rajeswari', '9640062790', '$2y$10$9gDiXMptllAKE6rh3hMoKeTzTuYNSQVpDMsrx2G7RWGKePVkn6TK.', 'Bhavyasree@1234', '', 'Kanigiri', '0', 8, 0, '9640062790', '7702381784', '2026-04-02 05:30:44', '2024-08-04 12:08:20', NULL, NULL, NULL, NULL),
(642, 'Vikas umarvaishya', '6392427557', '$2y$10$ygWbppNDKoor4QBNHdAh5uhRhboC0Wf24bvH6NxpRvy5UtHJNFyLW', 'Vikas@77400', '', 'Ameerpet', '0', 8, 0, '6392427557', '9391738024', '2026-04-02 05:30:44', '2024-08-04 12:25:48', NULL, NULL, NULL, NULL),
(643, 'Venugopal sirikonda', '7780220392', '$2y$10$1ZHCdwmrG06GDVSC9SIQmOnTbsa8Yr.44Y5eWOTmiLXYE15MsA9vW', 'venus@69', '', 'Hanamkonda', '0', 8, 0, '7780220392', '7702381784', '2026-04-02 05:30:44', '2024-08-04 12:40:02', NULL, NULL, NULL, NULL),
(644, 'Sugandhi A', '8125402402', '$2y$10$kFFX3BtJPuAPXheZxMXrU./oUqeX5cJrs0G/odMYGtfH0aJQEgHki', 'saiDeep2009@', '', 'Boduppal', '0', 8, 0, '8125402402', 'admin', '2026-04-02 05:30:44', '2024-08-04 17:06:02', NULL, NULL, NULL, NULL),
(645, 'M.Bheemrao', '9493906135', '$2y$10$4IyWxsbuWwUHK1nnwlv0K.e6x7idvFuoV.IbrCMabeCMiwzuy3h8G', 'chinna', '', 'Gadiguda', '0', 8, 0, '9493906135', '7702381784', '2026-04-02 05:30:44', '2024-08-04 17:42:19', NULL, NULL, NULL, NULL),
(646, 'Sai Deep', '8555806046', '$2y$10$YM6S9hHpCYs9MRfvukQlf.Mm6kkTkyob64q8j6Yj9rmj00kvIl5p.', 'saiDeep2009@', '', 'Boduppal', '0', 8, 0, '8555806046', '8121401401', '2026-04-02 05:30:44', '2024-08-05 08:07:51', NULL, NULL, NULL, NULL),
(647, 'ARUN RAJ DHARAMSUTH', '9100234406', '$2y$10$NqEoDK6yuKb6pGMLkrnx7udR/fgFPpZx/Fico4Jzb4.p8kdLMyBFS', 'Arunraj4@', '', 'Warangal', '0', 8, 0, '9100234406', '6302822638', '2026-04-02 05:30:44', '2024-08-05 10:03:00', NULL, NULL, NULL, NULL),
(648, 'Parameshwar pasupuleti', '9705439608', '$2y$10$YxWyMNtVjPMjjtJCuFYmoORJ8TvJ.UVDNPeaXf9KYAT8yMZcb2gaC', 'prppatel', '', 'Hyd', '0', 8, 0, '9705439608', '7702381784', '2026-04-02 05:30:45', '2024-08-06 02:12:06', NULL, NULL, NULL, NULL),
(649, 'NAGULA KRISHNA RAO', '7801063045', '$2y$10$QLlbGDALakvMnA1MZa1lzOQ6QYDx8F3eXxM1UgPVON.oMjY0Bdfbi', 'Hemish@2024', '', 'HYDERABAD', '0', 8, 0, '7801063045', '8121401401', '2026-04-02 05:30:45', '2024-08-06 03:12:45', NULL, NULL, NULL, NULL),
(650, 'VEERANKI SURESH', '9494428937', '$2y$10$.Kj98V.9IU7iOzLklJnsi.f0jyqZmTLckkPWTQq0844x/BPTOczvu', '9948249978', '', 'Hyderabad vrrcolony', '0', 8, 0, '9494428937', '7801063045', '2026-04-02 05:30:45', '2024-08-06 06:07:01', NULL, NULL, NULL, NULL),
(651, 'VARADAPUREDDI DEMUDU BABU', '9966447787', '$2y$10$6asHohJxSZFm6Uz/SOArwu6iswc1x9nMWErU6eZB9GfvrBsw/AGaa', 'vdb@7787', '', 'DEVARAPALLI(vi)(po)&(mandal)  ANAKAPALLI (dt)', '0', 8, 0, '9966447787', '7801063045', '2026-04-02 05:30:45', '2024-08-06 06:42:29', NULL, NULL, NULL, NULL),
(652, 'VARADAPUREDDI VENKATA LAKSHMI', '6302173599', '$2y$10$FwbTNhy80gV3wdJH0gI7gORVhWQS5jLmQLDBZ6LhHyHWhahawF2Vq', 'vvl@3599', '', 'DEVARAPALLI(VI)(PO)&(MANDAL),ANAKAPALLI(dt)', '0', 8, 0, '6302173599', '9966447787', '2026-04-02 05:30:45', '2024-08-06 10:37:34', NULL, NULL, NULL, NULL),
(653, 'Ramya Nagula', '7801063044', '$2y$10$EgSr4mi7d/YbCG9CEXOA7OOGEBe93VYh/hWy/Ki7/jMtbEr6.T4L6', 'Hemish@2013', '', 'Hyderabad', '0', 8, 0, '7801063044', '7801063045', '2026-04-02 05:30:45', '2024-08-07 01:17:20', NULL, NULL, NULL, NULL),
(654, 'Ajaykumar', '9966129369', '$2y$10$JAWQbvnYWY88BaRrRoTjBeu7oRNlzifIlH41IFqhha7AHy6g6Fipm', 'Ajay@123', '', 'Hyderabad', '0', 8, 0, '9966129369', 'admin', '2026-04-02 05:30:45', '2024-08-08 02:02:50', NULL, NULL, NULL, NULL),
(655, 'Sandeep', '9392376547', '$2y$10$zToXLRbJi6YJWK.Hs7Zls.AUU7nLi4NqYTa6SP4pDjn5RXuHMViSG', 'Sai Sandeep', '', 'Domalguda', '0', 8, 0, '9392376547', 'admin', '2026-04-02 05:30:45', '2024-08-08 05:24:20', NULL, NULL, NULL, NULL),
(656, 'Madhukar.R', '9441226834', '$2y$10$QNH28e7o1v8XeLb7r/Ao8.28iGP0iOT72uB1yIvyYxfoNcSd2PBgi', '9441226834', 'assets/user_assets/images/66bb13b9d5b3f.unnamed.jpg', 'WARANGAL', '0', 8, 0, '9441226834', 'admin', '2026-04-02 05:30:45', '2024-08-08 10:32:14', '#3-2,Jookal,Mdl Chityal,Dist Jayashankar Telangana', 'Telangana', 'Telangana', '506356'),
(657, 'JILLA ANJANEYULU', '9908396899', '$2y$10$6fMKPtDiidp2fElKVDt5YOiLsV/2fqKJXMddHx9NC8.px38DQYf4a', '4706', '', 'Hyderabad', '0', 8, 0, '9908396899', 'admin', '2026-04-02 05:30:45', '2024-08-09 05:39:16', NULL, NULL, NULL, NULL),
(659, 'Suresh Padavala', '7993912966', '$2y$10$FZ20dbeAv3.gUWJqJComgeep5A/emIf8HQeYU5mNUiGohW2lEAdqO', '7993912966', 'assets/user_assets/images/66b5f415e5b0c.Photo.jpeg', 'Razole City', '24192', 12, 0, '7993912966', 'admin', '2026-04-02 05:30:45', '2024-08-09 10:42:43', 'Ameerpeta', 'Hyderabad', 'Telangana', '500873'),
(660, 'Mohammad parvez hussain', '9100696393', '$2y$10$F6uDr1DjMxklRHjuxt6FCOKxxJlMAuT9TtEQwRXj61ZVDGgyhiSw.', 'parvez@123', NULL, 'Vikarabad', '0', 8, 0, '9100696393', '9491443072', '2026-04-02 05:30:45', '2024-08-10 06:38:33', NULL, NULL, NULL, NULL),
(661, 'Harikrishna Avancha', '9042358933', '$2y$10$Xd9eWtG5Ke6AuanH0T0sQO5isrJIq.KE0wo1OAdnl.MRVJYvAkKAq', 'Hari*11595', NULL, 'Attapur', '0', 8, 0, '9042358933', '7702381784', '2026-04-02 05:30:45', '2024-08-10 07:41:37', NULL, NULL, NULL, NULL),
(662, 'VIJAY', '9966181751', '$2y$10$bLQ/Epyi4RBUXWxPic1sCeHCa6HyBsUm7egrET9vRPWZJeUQXVgLW', '9966181751', NULL, 'HYDERABAD', '0', 8, 0, '9966181751', 'admin', '2026-04-02 05:30:45', '2024-08-12 14:11:32', NULL, NULL, NULL, NULL),
(663, 'Mohammad Rafi', '9177662593', '$2y$10$wL1gcj77JDPubx7aKytBE.3xf/fc9oC6sTmpfkYU3zl895HnZdfgG', '143143', NULL, 'Karimnagar', '0', 8, 0, '9177662593', '7702381784', '2026-04-02 05:30:45', '2024-08-14 18:04:59', NULL, NULL, NULL, NULL),
(664, 'CHANDHU', '8332026020', '$2y$10$Bzj2hhe/bUEfBepRnX9Jxe.DBISjmKa3NAdiQQg3yLjVBAxb2nibC', '210576', NULL, 'Visakhapatnam', '0', 8, 0, '8332026020', '7702381784', '2026-04-02 05:30:45', '2024-08-14 18:18:06', NULL, NULL, NULL, NULL),
(665, 'Kanakamamidi Gnaneshwar Goud', '9640623555', '$2y$10$4PLDGHGuPuO5tbQ5nBtFluCTw.iX7eQa.Q9Gnd212MX.T5IQbRFGa', 'Gnaneswar@1234', NULL, 'Miyapur', '0', 8, 0, '9640623555', '7702381784', '2026-04-02 05:30:45', '2024-08-15 00:14:53', NULL, NULL, NULL, NULL),
(666, 'K.Nookaraju', '9701351661', '$2y$10$aaZxi/rGdPdjZoTIOgfPEef8GBmyLl/afSaGLk3C9eUGJ8i5R1SQK', '431380', NULL, 'Sarabha aram', '0', 8, 0, '9701351661', '7702381784', '2026-04-02 05:30:46', '2024-08-15 01:34:53', NULL, NULL, NULL, NULL),
(667, 'Shiva', '9390385768', '$2y$10$cxN2HUBay7kasO/NFdsL6e9QPIyuGzufciaNj5ltW.8BoZ1WC8wD2', '123456', NULL, 'Rayapuram gattu mandalam', '0', 8, 0, '9390385768', '7702381784', '2026-04-02 05:30:46', '2024-08-15 02:08:17', NULL, NULL, NULL, NULL),
(668, 'Suresh kumar', '7328058289', '$2y$10$LDdthw9MCe4YDFJcfXIUlOObkdjrbmDzVbLWU6Y8LpGU.bshN09ga', 'nanda8282', NULL, 'Hyderabad', '0', 8, 0, '7328058289', '7702381784', '2026-04-02 05:30:46', '2024-08-15 04:49:53', NULL, NULL, NULL, NULL),
(669, 'Sangu Venu', '7989104609', '$2y$10$VdEoE7wXKB6HEYYMVrxcUuQ5Vavoh6vwMLRVdXiEJ7t06yF3yatC.', '798910460=', NULL, 'Hyderabad', '0', 8, 0, '7989104609', '7702381784', '2026-04-02 05:30:46', '2024-08-15 06:24:10', NULL, NULL, NULL, NULL),
(670, 'THOTA LAKSHMI KUMARI', '9848420393', '$2y$10$DhgEThMIXNE8o3v/PMGjD.3CYB0mTD82Ibg8XBU/yjp2ZNXoqUscW', 'lakshmi', NULL, 'Mehdipatnam', '3850', 8, 6850, '9848420393', 'admin', '2026-04-02 05:30:46', '2024-08-15 09:11:45', 'DOOR NO A/8 LIC COLONY , OPP:SARAN JUTE BAGS. MEHEDIPATNAM', 'Hyderabad', 'Telangana', '500028'),
(671, 'Gulla Eswar rao', '7893669676', '$2y$10$AtlzAKZwkhEtApObTjphoeha20fKOJjMGaGwfW0LHioJww9oyx7QC', 'gulla9', NULL, 'Bhadradri kothagudem district', '0', 8, 0, '7893669676', '7702381784', '2026-04-02 05:30:46', '2024-08-15 12:44:53', NULL, NULL, NULL, NULL),
(672, 'P udayakumar', '9951865351', '$2y$10$8bUh6uBmCdzZNAmeSxmSHeoHuYXjH7m6qTVhEIpHd/lLQfc04fgAO', '12345678', NULL, 'Nagari', '0', 8, 0, '9951865351', '7702381784', '2026-04-02 05:30:46', '2024-08-15 13:49:47', NULL, NULL, NULL, NULL),
(673, 'Shekar', '8886424365', '$2y$10$NH.r78h3TgG3HYSeI4zOH.wwBaNlzLNr4myuvIUtdD2aqKVaQghN2', 'Addmagpro@9366', NULL, 'Addmagpro@9366', '0', 8, 0, '8886424365', 'admin', '2026-04-02 05:30:46', '2024-08-16 13:35:21', NULL, NULL, NULL, NULL),
(674, 'VEMULA PARVATHI', '9959210662', '$2y$10$REC16gBNBKilzVVcc2SRUO9JpBivmOIX7eYkYLpMOYJy4w8xQpU/m', '9959210662', NULL, 'KASHIBUGGA WARANGAL', '0', 8, 0, '9959210662', '7702381784', '2026-04-02 05:30:46', '2024-08-18 05:15:39', NULL, NULL, NULL, NULL),
(675, 'RAMA CHANDER', '9849017999', '$2y$10$5HkpUeO9f2es95ldv9sThO.MigkbIjNHdtGh3AGFHUhqsry0xjxry', '9849017999', NULL, 'WARANGAL', '0', 8, 0, '9849017999', 'admin', '2026-04-02 05:30:46', '2024-08-21 05:12:26', NULL, NULL, NULL, NULL),
(676, 'NERELLA SUJATHA', '9177817800', '$2y$10$UoeAx2Kl3S1KdNJsg7V2TeW9AjGqf2CCVJjlX5ht9mKNgrkpQJxKO', '9177817800', NULL, 'WARANGAL', '0', 8, 0, '9177817800', '7730099707', '2026-04-02 05:30:46', '2024-08-21 15:08:57', NULL, NULL, NULL, NULL),
(677, 'B suresh kumar', '9618338805', '$2y$10$9fYYf3tJuC/le0V7BRxgmOuSjJZTlLRdLP9fwmrQjoEsZ1hmNsen6', '2220', NULL, 'Vikarabad', '0', 8, 0, '9618338805', '7702381784', '2026-04-02 05:30:46', '2024-08-23 07:46:47', NULL, NULL, NULL, NULL),
(678, 'Gaddam Bhagath', '8125641698', '$2y$10$U/EL8EwkY6AHrDMn8Vl1cuHOEbFiV38.D6YhP5fQL/9oBb8lxQtm.', 'bhagath22', NULL, 'Bheemaram hasanparthy hanmakonda', '0', 8, 0, '8125641698', '7702381784', '2026-04-02 05:30:46', '2024-08-23 07:52:06', NULL, NULL, NULL, NULL),
(679, 'Shaik allabakshu', '8074522294', '$2y$10$.XhhxkRM8Q7N1nq/PSyAleNfETJbpzcpnZzxrTsnnJnGqEKgaYZd.', '0908013', NULL, 'Vinjamour', '0', 8, 0, '8074522294', '7702381784', '2026-04-02 05:30:46', '2024-08-23 08:52:47', NULL, NULL, NULL, NULL),
(680, 'Radhakrishna.manchala.', '9912919659', '$2y$10$BIsS309WwGX.mfEWnRT8se0Rg0tiVDoX/uEWDJLzxLzvDLxHAOD7S', '9569', NULL, 'Mahabubabad', '0', 8, 0, '9912919659', '7702381784', '2026-04-02 05:30:46', '2024-08-23 09:29:29', NULL, NULL, NULL, NULL),
(681, 'Benguluri hanuman singh', '9951165132', '$2y$10$OrP0NY4UG6GY3sGTvyt60uOoJMUWM.Yn8gmaFFeiCOBTiFqaeMS2e', 'Singh@12345', NULL, 'Singh@12345', '0', 8, 0, '9951165132', '7702381784', '2026-04-02 05:30:46', '2024-08-23 09:31:17', NULL, NULL, NULL, NULL),
(682, 'Vijay kumar singathi', '9949665771', '$2y$10$IQO7azN7VOz/8RgjNGdqUOWM1ObSZQNPYq.wPPHeqoqTbrLDFdMAG', '1122334455', NULL, 'Dist Manchirail mandal bellampalli vellage perkapalli', '0', 8, 0, '9949665771', '7702381784', '2026-04-02 05:30:46', '2024-08-23 10:18:36', NULL, NULL, NULL, NULL),
(683, 'Naresh Kumar', '8187852291', '$2y$10$HTcO6W2baGarCJmZvfXvhOgVvhSkTo7kNfWU7sbFIOlr2brhwSJEO', '610610', NULL, 'Armoor', '0', 8, 0, '8187852291', '7702381784', '2026-04-02 05:30:47', '2024-08-23 10:26:37', NULL, NULL, NULL, NULL),
(684, 'B SRINIVAS REDDY', '9515312900', '$2y$10$X2yXA7pFBlilgjN2oyMeVu349QFY/M5bSMfVi8tkEOSI7ACZGj.ZC', '9515312900', NULL, 'NAGOLE HYD', '0', 8, 0, '9515312900', '7702381784', '2026-04-02 05:30:47', '2024-08-25 04:07:50', NULL, NULL, NULL, NULL),
(685, 'NAB choudary', '9502678222', '$2y$10$9CKdcjzuV8pMsf6mLr7/PO580B4BRw5pz3bu9fIrCJq5ctrLlPMTy', '9502678222', NULL, 'Hitech city', '0', 8, 0, '9502678222', 'admin', '2026-04-02 05:30:47', '2024-08-25 05:01:30', NULL, NULL, NULL, NULL),
(686, 'B. Somesh Goud', '9110755878', '$2y$10$U4FOvOeOnTxVRikUmkq1Oujw9dG/ndRRLFZ1ep0M6aIPxO6uDBVg6', 'bsgoud123', NULL, 'Uppal', '0', 8, 0, '9110755878', '7702381784', '2026-04-02 05:30:47', '2024-08-25 05:55:10', NULL, NULL, NULL, NULL),
(687, 'Venkatesh', '7702841008', '$2y$10$mm.PSFlYb4Y24sEXgC.XLOpq3l0dXOCRkJ7JhWqLUcv1Dx48xCULS', 'venkat@123789', NULL, 'Hyderabad', '0', 8, 0, '7702841008', 'admin', '2026-04-02 05:30:47', '2024-08-25 06:28:21', NULL, NULL, NULL, NULL),
(688, 'D. Prabhakar', '8247506883', '$2y$10$wkCs5BDJjgvRJmu.NAehiuCBXiz7X8i5aOEKpJC9uB5hFYS7yFMQe', '220158', NULL, 'Uppal', '0', 8, 0, '8247506883', '9110755878', '2026-04-02 05:30:47', '2024-08-25 06:32:20', NULL, NULL, NULL, NULL),
(689, 'A SRINIVAS', '9652165228', '$2y$10$KQpdNKfN6M2WX9gJnOH8teLccVyJop2m8y66eNbgg4PczHi6VhY2y', '9652165228', NULL, 'ECIL HYD', '0', 8, 0, '9652165228', '7702381784', '2026-04-02 05:30:47', '2024-08-25 08:38:31', NULL, NULL, NULL, NULL),
(690, 'Rajender Rao Pampati', '8341683456', '$2y$10$x.l8KK0Rb7Q5pOf0dhOrkuKiTq32xcPywrumNEIDhK14Y/SRK6X5W', 'Raj@1997', NULL, 'Ngo\'s colony, vanasthlipuram, Hyderabad 500070', '0', 8, 0, '8341683456', 'admin', '2026-04-02 05:30:47', '2024-08-26 03:40:08', NULL, NULL, NULL, NULL),
(691, 'PVRKS SOMAYAJULU', '9553979804', '$2y$10$AL6kJRVjELm8d8K6QnKu/.GAApCLFjX3lztStP8rRDI0NW27Q7bC.', 'pvrks@69', NULL, 'Hyderabad', '0', 8, 0, '9553979804', 'admin', '2026-04-02 05:30:47', '2024-08-26 09:18:56', NULL, NULL, NULL, NULL),
(692, 'THALLA PANDU', '9849973847', '$2y$10$Mv0KYVzFikq0f0x0DbmwsOHNMIHVGO6TDQrexXAmiVnLLt1lMwane', '9849973847', NULL, 'GAJWEL MEDAK', '0', 8, 0, '9849973847', '7702381784', '2026-04-02 05:30:47', '2024-08-27 07:15:11', NULL, NULL, NULL, NULL),
(693, 'నాగవత్ సురేష్ నాయక్', '9666491691', '$2y$10$uSqyS4WbxFCM.gxPKfK9YeinR6tf8SA2ID2HYE57p39N9LN5a.jSW', '12345', NULL, 'కడo  జిల్లా నిర్మల్ pin 504202  ts', '0', 8, 0, '9666491691', '7702381784', '2026-04-02 05:30:47', '2024-08-27 10:49:28', NULL, NULL, NULL, NULL),
(694, 'Yarrapothu Ramprasad', '9440317178', '$2y$10$fQ7EUJCAlK.uQZvkderhze5lwfTd4W20e3ZPVUCy3m6SU4xEhlrf2', 'Ramu@1439', NULL, 'Vijayawada', '0', 8, 0, '9440317178', '7702381784', '2026-04-02 05:30:47', '2024-08-27 11:56:22', NULL, NULL, NULL, NULL),
(695, 'SRIDHAR', '7901001111', '$2y$10$ce6QiNDmQYSS79beX/tlY.ZZ/ZD.rnNJ1isLU3JOkSsnWYFUl7Qnu', 'Siri@199189', NULL, 'Hyd', '0', 8, 0, '7901001111', 'admin', '2026-04-02 05:30:47', '2024-08-29 12:53:37', NULL, NULL, NULL, NULL),
(696, 'Narayana Adimulam', '9440386500', '$2y$10$2l8wkxqyY/COGej5cEJEDuB/OwKltHU4qI9BIsziEL1mGAuHExZMy', '1968', NULL, 'Gajwel', '0', 8, 0, '9440386500', 'admin', '2025-11-15 21:08:00', '2024-08-29 13:22:27', NULL, NULL, NULL, NULL),
(697, 'Taj baba shiak', '9553344678', '$2y$10$hkjQoyYkA27tMTLAAAytGOMuGhpb9PbfrBZkVrdJnO0pRRQpOR0Jm', '1234', NULL, 'Godavarikhani', '0', 8, 0, '9553344678', 'admin', '2025-11-15 21:08:00', '2024-08-29 14:14:38', NULL, NULL, NULL, NULL),
(698, 'Game off', '9392434241', '$2y$10$ANZfjwbgvj/zJhZi1Fh90u6KptbdX1Kpt5gvbZdLdWC6QxbBEa1b.', 'Life@3434', NULL, 'Hyderabad', '0', 8, 0, '9392434241', 'admin', '2024-12-23 19:21:20', '2024-08-29 17:28:05', NULL, NULL, NULL, NULL),
(699, 'B Venkataramana', '8897177717', '$2y$10$gHUe.6K63JKvM/qTdhpY4.FKSYRs01YpQEN4zx6gyZrD64SvpJW7m', 'venkatramana123', NULL, 'Madanapalli', '0', 8, 0, '8897177717', 'admin', '2024-12-23 19:21:20', '2024-08-30 03:52:33', NULL, NULL, NULL, NULL),
(700, 'PVRKS SOMAYAJULU', '9908916007', '$2y$10$4Zv25IW385dF.OCJCgQyKuTFmwWnLWQhQDdFOT5NpbYnY77c4yx76', 'pvrks@69', NULL, 'Hyderabad', '0', 8, 0, '9908916007', 'admin', '2024-11-14 13:20:30', '2024-08-30 10:31:14', NULL, NULL, NULL, NULL),
(701, 'Shamala yadagiri', '7396977505', '$2y$10$MPWeW2nCVSvg85pp7relsOTgVroMb3VzdRX4IdLDJMZtmBD/.sveq', '7396977505', NULL, 'Kapra', '1000', 8, 0, '7396977505', '9390596123', '2026-01-20 13:36:27', '2024-09-01 04:59:59', NULL, NULL, NULL, NULL),
(702, 'K sanjeev reddy', '9949290932', '$2y$10$vpHrZPMAQ0Z/oCzEToVLIuBZ6DB8.WNv5bAdvpUkZVGi4ayuoslD.', 'priyas@7777', NULL, 'Hyderabad', '0', 8, 0, '9949290932', '7396977505', '2024-11-14 13:20:30', '2024-09-01 09:55:19', NULL, NULL, NULL, NULL),
(703, 'Praveen', '6302877567', '$2y$10$io2LqSHU9KiJ3uEY6XJahuoz4PZ77rWoohidGgVvBHF8ws3yzo2XC', '804805', NULL, 'Cherlapally', '0', 8, 0, '6302877567', '7396977505', '2024-11-14 13:20:30', '2024-09-02 07:35:35', NULL, NULL, NULL, NULL),
(704, 'Kavali anjaneyulu', '9000062829', '$2y$10$yh/I7TBZhvysSGXkR/CBM.vuo4NVo3ckb6/iImHB/GuA09GynXxtO', '804805', NULL, 'Sairam Nagar', '0', 8, 0, '9000062829', '6302877567', '2024-11-14 13:20:30', '2024-09-02 07:43:15', NULL, NULL, NULL, NULL),
(705, 'RAMPALLY ANJANEYULU', '9848840128', '$2y$10$puzLQu4fn397ewJiWehDRuLjGmsn8TTHGMkTtzLGgQO/VK31czsiC', '9848840128', NULL, 'Bhongir', '0', 8, 0, '9848840128', '7702381784', '2024-11-14 13:20:30', '2024-09-03 12:52:36', NULL, NULL, NULL, NULL),
(706, 'GUGULOTHU.SATHISH', '8790242135', '$2y$10$Cj..qZKAb7gjL935yh8TGONn/azEoYHMbKstWwTPJMKXyCgkOtG/a', 'Sonu@123', NULL, 'Hyderabad', '0', 8, 0, '8790242135', 'admin', '2024-11-14 13:20:31', '2024-09-04 05:31:44', NULL, NULL, NULL, NULL),
(707, 'Shivasagar', '9573192406', '$2y$10$8D6DLjfMyto4.ooUS.SAAO4IZAsfxOoyHzyRDjEGgAl889CEK5a7q', 'Sagar@1171994', NULL, 'Manuguru', '0', 8, 0, '9573192406', 'admin', '2024-11-14 13:20:31', '2024-09-04 05:48:51', NULL, NULL, NULL, NULL),
(708, 'Raju gentyal', '9552297333', '$2y$10$CAvzKb/KU8fkaS4cem8ljO/AzCCge7KZsXWpdEfm.NCuIvgFck24e', '1251972', NULL, 'Bhiwandi, narpoli gaon', '0', 8, 0, '9552297333', 'admin', '2024-11-14 13:20:31', '2024-09-04 08:18:49', NULL, NULL, NULL, NULL),
(709, 'Sane Anand', '9963996784', '$2y$10$7SCEA82qrg6FbFXDs9/hrO/pJXSPc96FGuq5xkJPuPFKnCyWHl4w.', '12345', NULL, 'Shivampet', '0', 8, 0, '9963996784', 'admin', '2024-11-14 13:20:31', '2024-09-04 08:20:36', NULL, NULL, NULL, NULL),
(710, 'Suresh Reddy', '9393545400', '$2y$10$GR1rF24VjBljuQwbBqRAS.uirU3jd8Z64UL0tgH/vhunU9pHFBT5C', 'anurag@15', NULL, 'Boduppal', '0', 8, 0, '9393545400', 'admin', '2024-11-14 13:20:31', '2024-09-04 08:30:13', NULL, NULL, NULL, NULL),
(711, 'S.Mahaboob Hussain Nizami', '7989979956', '$2y$10$p5AH9K1f3i4U0K.g4Ik7T.dWkRnDusS1o58AGVFw3b.OPH4.ESbSS', '7867867867', NULL, 'Salim Nagar. Sure grand Hotel', '0', 8, 0, '7989979956', 'admin', '2024-11-14 13:20:31', '2024-09-04 08:32:46', NULL, NULL, NULL, NULL),
(712, 'Dayla . venkateswara reddy', '9848093736', '$2y$10$6hPYFnxlsoFYi99rT/eh/.M9BwQu.XSZYrzpjZ50oIeIDK7GBKbsS', '123456', NULL, 'Banaganapalli', '0', 8, 0, '9848093736', 'admin', '2024-11-14 13:20:31', '2024-09-04 08:56:27', NULL, NULL, NULL, NULL),
(713, 'Mohammad Wadeed', '9963757104', '$2y$10$Wk91kFEoJiNSCeju3hBDiuma7qe1PaduO05VG73HsEDOkj6LzrYuS', 'waheedneha001', NULL, 'Hyderabad,Telangana pitlam', '0', 8, 0, '9963757104', 'admin', '2024-11-14 13:20:31', '2024-09-04 12:31:54', NULL, NULL, NULL, NULL),
(714, 'Nagesh', '9705292651', '$2y$10$Sbpn7MiXwFJWlA4YVP1WYeLRd3Tg5K.yXOwZp2Ncx2gjSUccCJO1a', '182818', NULL, 'GADWAL', '0', 8, 0, '9705292651', 'admin', '2024-11-14 13:20:31', '2024-09-04 15:05:10', NULL, NULL, NULL, NULL),
(715, 'Shaik Raheem', '9493687860', '$2y$10$GKnIJtEAgdCJN37yLJ.ivevoWedaeqoBuflmqo2TJ89BIkugL2eIS', '985660', NULL, 'Kondapalli, NTR District, mylavarm constituency, Ibrahimpatnam mandal , Andhra Pradesh', '0', 8, 0, '9493687860', 'admin', '2024-11-14 13:20:31', '2024-09-04 17:38:54', NULL, NULL, NULL, NULL),
(716, 'VAJID KHAN', '7842951111', '$2y$10$sBY5AjWDBtDmsQ0QzGf0tO4war7HMsHBZVtT9/AAcZvyzBC8e8JwK', '7842951111', NULL, 'NALGONDA', '0', 8, 0, '7842951111', 'admin', '2024-11-14 13:20:31', '2024-09-06 04:26:49', NULL, NULL, NULL, NULL),
(717, 'Reuel Emmanuel', '9491621745', '$2y$10$JI.8vKbL7pvQYDQajJH24OPnJf.U9SqjnFCbHf92tbsuJxBm7Zva6', 'a2flxnyd', NULL, 'Hyderabad/Secunderabad', '0', 8, 0, '9491621745', 'admin', '2024-11-14 13:20:31', '2024-09-06 05:22:09', NULL, NULL, NULL, NULL),
(718, 'Ganjikuntla Gopinath', '9247171176', '$2y$10$BBHZsyh8SFZkEYy.jBHZ0OfRlW4a9GuMPWn12BbxGqZCnwCnHUkry', '622722', NULL, 'Chennaram', '0', 8, 0, '9247171176', '9908643884', '2024-11-14 13:20:31', '2024-09-07 11:05:25', NULL, NULL, NULL, NULL),
(719, 'Patel. Sudhakar reddy', '8555985923', '$2y$10$PDJny6Ht/ei3ugHLunsXwu2P/xz83FPrNq5.Vlh.lsy932dLseTKC', '14667', NULL, 'Thimmapurm', '0', 8, 0, '8555985923', 'admin', '2024-11-14 13:20:31', '2024-09-11 09:16:32', NULL, NULL, NULL, NULL),
(720, 'ADLURI SRIKANTH', '9848073605', '$2y$10$Fk67Dg69YnZ7BlOafHB5F.oVqW6PHqFaxr7lD.7RnHT3GvtLTJURK', '01128228', 'assets/user_assets/images/672f00f075180.WhatsApp Image 2024-10-14 at 19.22.58.jpeg', 'WARANGAL', '1000', 8, 0, '9848073605', 'admin', '2025-05-13 03:39:05', '2024-09-12 12:42:31', 'HNO  11-28-228 GAYATRI NAGAR WARANGAL', 'WARANGAL', 'TELANGANA', '506002'),
(721, '9866277948', '9866277948', '$2y$10$E02VSDFZTAP7.s85oyXy7.pfJ3g8gBxa22Dg2Eq6SH7gPzTHTIoHi', '1234', NULL, 'Godavari khani', '0', 8, 0, '9866277948', 'admin', '2024-11-14 13:20:31', '2024-09-13 09:52:35', NULL, NULL, NULL, NULL),
(722, '9441226834', '9491504405', '$2y$10$oAELYZc0NowOiAeo53wEeuyuH/dGRlBVNM4q89XNulPuJBmlomj/y', '9441226834', NULL, 'Hyderabad', '0', 8, 0, '9491504405', 'admin', '2024-11-14 13:20:31', '2024-09-14 09:57:07', NULL, NULL, NULL, NULL),
(723, 'Bollam Hemanth', '9490334681', '$2y$10$4QRCCWX71d6QiL4qnl7.eudhc/uGAJRV3KJmls8LVD9788Qd4T106', 'Hemanth@3796', NULL, 'Hyderabad', '0', 8, 0, '9490334681', '8522881144', '2024-11-14 13:20:31', '2024-09-16 08:11:56', NULL, NULL, NULL, NULL),
(724, 'Asdfghhh', '4556654447', '$2y$10$Yw4eckycQUBrEfYczKEkVutaisB4tVDH3XiO573P6khzutc3uqM9m', 'qaedfg', NULL, 'Asfghhhu', '0', 8, 0, '4556654447', 'admin', '2024-11-14 13:20:31', '2024-09-16 16:50:42', NULL, NULL, NULL, NULL),
(725, 'Valluri', '1234567890', '$2y$10$07AMiSYvJugwJoDPRE/Nfenqn22V95VrUCfRh5Pn6x4C3/6UkiLKy', 'Valluri@123', NULL, 'Hyderabad', '0', 8, 0, '1234567890', 'admin', '2024-11-14 13:20:31', '2024-09-16 19:22:57', NULL, NULL, NULL, NULL),
(726, '123456789', '0123456789', '$2y$10$J7RbDsC/2wW2dydZyjpqtu9V3btXYldHCynNytWXMbyIZ1iHdl/J6', '0123456789', NULL, 'Hyderabad', '0', 8, 0, '0123456789', 'admin', '2024-11-14 13:20:31', '2024-09-16 19:27:19', NULL, NULL, NULL, NULL),
(727, 'Vemula Shankaraiah', '8328140615', '$2y$10$7tUny8Z87OOAme1jFlWBW.q0hSE2mrCdEiDuQn04ZcGLrKm/SgA0u', 'Bhanu@123', NULL, 'Mahabubnagar', '0', 8, 0, '8328140615', 'admin', '2024-11-14 13:20:31', '2024-09-17 05:56:49', NULL, NULL, NULL, NULL),
(728, 'Sandhya', '8555800072', '$2y$10$jHw/iEkW1G/UcBY/XCG6ROA7oh/4ydMc.PU5SrCI2gX/TQs1dvm7e', '3131', NULL, 'D.no.1-146 veeravalli  kadavakollu, vuyyuru.', '0', 8, 0, '8555800072', '9440317178', '2024-11-14 13:20:31', '2024-09-17 06:56:18', NULL, NULL, NULL, NULL),
(729, 'Hari Prasad', '9985319431', '$2y$10$CuQZmuSOHshY/ZJU12BYAebfER0WoUMdnjIMbQQ8V52qWXoABapvO', 'HariprasadAO@2', NULL, 'Hyderabad', '0', 8, 0, '9985319431', '8522881144', '2024-11-14 13:20:31', '2024-09-18 09:15:45', NULL, NULL, NULL, NULL),
(730, 'Karibandi Ramu', '9866570038', '$2y$10$ipXpiKq3Ny7hGl3/uL3Jceg9dMY51JTVzvdIOl3Z15v9Og8XuoAHa', '12345678', NULL, 'Eluru', '0', 8, 0, '9866570038', 'admin', '2024-11-14 13:20:32', '2024-09-19 15:09:53', NULL, NULL, NULL, NULL),
(731, 'Thanmai', '7036674959', '$2y$10$KcSXO5YOcIhqhLAde.3frO5kEVWGcwjhOTWLuw8CF8uJ5oGoV8Nje', 'Thanmai@8', NULL, 'Warangal', '0', 8, 0, '7036674959', '7702381784', '2024-11-14 13:20:32', '2024-09-21 07:43:59', NULL, NULL, NULL, NULL),
(732, 'KANTHALA BALAKRISHNA', '9182342466', '$2y$10$uMHL3L04rzptoP0US6nwc.rBUumy81AUIRuS7VyNwG/9j0YWTa.D6', 'Honeyindra@16', NULL, '500068', '0', 8, 0, '9182342466', '9491443072', '2024-11-14 13:20:32', '2024-09-22 12:28:04', NULL, NULL, NULL, NULL),
(733, 'KANTHALA BALAKRISHNA', '9247646491', '$2y$10$tAxKe7xjbh1QEmHEcpZps.tfHNQ5Z6Ves1.OJxMFt1vw.Hz5SoRde', 'Honeyindra@16', NULL, '500068', '0', 8, 0, '9247646491', '6302822638', '2024-11-14 13:20:32', '2024-09-22 12:32:02', NULL, NULL, NULL, NULL),
(734, 'Golla Veeresh', '9392120626', '$2y$10$ZsYIWMBhKJ./Owv8ecTgz.TLNOPTOY4XnorqC7uXLp5gRhlOYTP9S', '9392', NULL, 'MothiNagar', '0', 8, 0, '9392120626', '9491443072', '2024-11-14 13:20:32', '2024-09-23 04:17:59', NULL, NULL, NULL, NULL),
(735, 'SKY SAY', '9346234899', '$2y$10$VOWvi2/O4qWzybuBGhUJj.dQbE9DEMvqjKPUx01HlcyJ3sQIKqY2a', 'skysay93462', NULL, 'HYDERABAD', '110342', 14, 3059, '9346234899', 'admin', '2026-01-23 14:36:58', '2024-09-23 06:07:41', NULL, NULL, NULL, NULL),
(736, 'Akinapally ranjith', '9700861430', '$2y$10$dJSfkLRRdpvciaggE2JiO.nUDPq8u6SYR0feYmFTUZbY4EUM.iar6', '123456', NULL, 'Huzurabad', '0', 8, 0, '9700861430', 'admin', '2024-11-14 13:20:32', '2024-09-24 06:21:25', NULL, NULL, NULL, NULL),
(737, 'PANJALA PRAHAKAR', '9849196323', '$2y$10$hijJPh9vTLwEFEwWJ5Glmu3/bTX7DCxfxEoCRgYy6rLhbXKLFjBjC', '05051967', NULL, 'Huzurabad', '0', 8, 0, '9849196323', '9490534100', '2024-11-14 13:20:32', '2024-09-24 06:34:17', NULL, NULL, NULL, NULL),
(738, 'N Rajasekhar Goud', '9440596006', '$2y$10$xv2GK7ykkXHVChVM8nsHLudocVs6/lcziVjDQ58NB.dM/Y0rTjtLi', '210146', NULL, 'Adoni', '0', 8, 0, '9440596006', '9346234899', '2024-11-14 13:20:32', '2024-09-25 12:45:29', NULL, NULL, NULL, NULL),
(739, 'Dr.R.S.Gupta', '7995164206', '$2y$10$vorrD9DElmtInwleR4La5Os0we3Kdrd7LzzxKA8jTt6klxlFZeccu', 'India@123', NULL, 'Hyderabad', '0', 8, 0, '7995164206', '9493142434', '2024-11-14 13:20:32', '2024-09-25 13:15:36', NULL, NULL, NULL, NULL),
(740, 'RAPARTHI Anjaniyulu', '9392575619', '$2y$10$HaDqdnoKHge37Qhyastdqe/ledlNkZW8gswv818JtcZpei1f6Pl8G', 'Navya@2014', NULL, 'Navya@2014', '0', 8, 0, '9392575619', '7995164206', '2024-11-14 13:20:32', '2024-09-25 13:21:39', NULL, NULL, NULL, NULL),
(741, 'Bandari Bhargavi', '7680866622', '$2y$10$UL0.lrBRbahcKXio0ZzA7eUmMJQPfnsBjEtB0WddgWcYYxeYK921y', '7680866622', NULL, 'Hyderabad', '0', 8, 0, '7680866622', '7730099707', '2024-11-14 13:20:32', '2024-09-25 14:26:25', NULL, NULL, NULL, NULL),
(742, 'Y shivaranjani', '9390820778', '$2y$10$iAMg3WME4zNHweMwJpEpquKN1yCCcKchGy.aExKhHcBwMLSDnlKEi', '1234', NULL, 'Warangal shivanagar near metla bavi', '0', 8, 0, '9390820778', '7680866622', '2024-11-14 13:20:32', '2024-09-25 17:10:50', NULL, NULL, NULL, NULL),
(743, 'Rupesh Renukuntla', '8886612128', '$2y$10$dmaXNn7RyBqI66CYIc5Go.jhNYJZ9kW7nA4E4GMbarkSsH28F0mN2', 'madhavi123', NULL, 'Saroornagar', '0', 8, 0, '8886612128', '9392575619', '2024-11-14 13:20:32', '2024-09-26 04:03:57', NULL, NULL, NULL, NULL),
(744, 'LIC ERC JANGAON', '1234567891', '$2y$10$75DXwruxFJBbGJ8dw.r27eWDbra3WGRovGtUxMqu6cVz38Dq1i40O', '1234567891', NULL, 'JANGAON', '0', 8, 0, '1234567891', 'admin', '2024-11-14 13:20:32', '2024-09-26 04:28:27', NULL, NULL, NULL, NULL),
(745, 'Gotte bhasker', '9177945318', '$2y$10$gDqOaPDfH5dBlIr3FZtFZuztz9CV3b1X8dejtuY.tuUvH1dOs.C2m', 'Bha143bha@', NULL, 'Huzurabad', '0', 8, 0, '9177945318', '9490534100', '2024-11-14 13:20:32', '2024-09-26 06:07:12', NULL, NULL, NULL, NULL),
(746, 'Achyuth', '7416210841', '$2y$10$9HDvALoiWKIcPgHjUMGt7.Rrx1aZPWPKB6Aqd1nqmmQpuws30fnGm', 'zipnaC-8gomxa-zawmiz', NULL, 'Jammikunta', '0', 8, 0, '7416210841', '9490534100', '2024-11-14 13:20:32', '2024-09-26 08:10:32', NULL, NULL, NULL, NULL),
(747, 'Vishesh', '9121822484', '$2y$10$RA4rYcxKN6sZ9g/DOXBLUOp1vLtc8MMRAP/GLBPGD7Ib/baUdYLHS', 'kishanrao', NULL, 'Jammikunta, Karimnagar.', '0', 8, 0, '9121822484', '9490534100', '2024-11-14 13:20:32', '2024-09-26 08:54:00', NULL, NULL, NULL, NULL),
(748, 'Mohd Abdul Rahman', '9676808468', '$2y$10$HRRv3/XDjNVydu1ncZQgweQvqwQdupLfeH8wbNTl1E53PzeLqRSIi', '100276', NULL, 'Malakpet', '6667', 8, 6667, '9676808468', '9346234899', '2024-11-14 13:20:32', '2024-09-26 09:18:17', 'H no 16_2_638 paltan street no 2 ground floor , Malakpet opposite Sai Chandra apartment', 'Hyderabad', 'Telangana', '500036'),
(749, 'Naveen devulapally', '9392281614', '$2y$10$rJpA4/wJcVRW.PbbKcOkeuZ0N71I/GA6jfrYlonuN6t6O7ACug3fW', 'laddu123', NULL, 'Jammikunta', '0', 8, 0, '9392281614', '9490534100', '2024-11-14 13:20:32', '2024-09-26 09:45:46', NULL, NULL, NULL, NULL),
(750, 'BANDARI VEERALINGAM', '9440760001', '$2y$10$y8WFeEmjEKaYjZlzB7buru3z1fF3rQKbipx2TJexP1VgEF6aIvReW', '558336', NULL, 'HYDERABAD', '0', 8, 0, '9440760001', 'admin', '2024-11-14 13:20:32', '2024-09-26 12:34:09', NULL, NULL, NULL, NULL),
(751, 'Padala Thirupathi', '9542551194', '$2y$10$eN/J3sc.C6MdcLmp3NVRkO8H/.qPC7J5MUBRqn6nWkLXcyXPL0tXe', '9542551194', NULL, 'Chelpur', '0', 8, 0, '9542551194', '9490534100', '2024-11-14 13:20:32', '2024-09-28 07:05:54', NULL, NULL, NULL, NULL),
(752, 'Shyam Kalakoti', '8341133293', '$2y$10$6mJfAXSkGZwIdq6mOaM.1eW8Y0lxZuRY.4n6iQM5KUwsSNvW36w/i', 'idea!@1234', NULL, 'Huzurabad', '0', 8, 0, '8341133293', '9490534100', '2024-11-14 13:20:32', '2024-09-30 02:20:32', NULL, NULL, NULL, NULL),
(753, 'Vijetha Madhapur', '8520086300', '$2y$10$daNmDyWxHvUNXbqq5rvCUO4ED1vX4rfdSo3Ua49SLmOG1Fla1s90S', '8520086300', NULL, 'Madhapur', '0', 8, 0, '8520086300', 'admin', '2024-11-14 13:20:33', '2024-09-30 10:02:27', NULL, NULL, NULL, NULL),
(754, 'RAMAKRISHNA P', '9052658798', '$2y$10$HBOfP/whBOscgsQM6OyFUO1i4reDXQBS7DME.HmsbF5K45rZ0Pocu', '9052658798', 'assets/user_assets/images/673d883ed9474.WhatsApp Image 2024-11-20 at 12.15.51.jpeg', 'HYDERABAD', '166678', 16, 0, '9052658798', 'admin', '2026-03-11 12:23:17', '2024-10-01 11:19:22', 'HYDERABAD', 'Hyderabad', 'Telangana', '500073'),
(755, 'PARAMJYOTHI V B', '7229812345', '$2y$10$g5oP4xQqwQofyKwRen9lLeauxJErDWkJj4xemiBw6EDpsGEe33iXe', '7229812345', NULL, 'MALKAJGIRI', '166678', 16, 0, '7229812345', '9052658798', '2026-03-11 12:23:17', '2024-10-01 11:27:01', NULL, NULL, NULL, NULL),
(756, 'Thota kishore', '8341257474', '$2y$10$s2TCU7oBKPftVT0cU5Aj8uW/cW7keytPJeDjve5xZoNb47TrAZnrK', '8341257474', NULL, 'Hyderabad', '4000', 8, 0, '8341257474', '7229812345', '2026-03-11 12:23:17', '2024-10-01 11:47:47', '1-1-296/93, Arul Colony, Dr A S Rao Nagar, Kapra, ECIL', 'Hyderabad', 'Telangana', '500062'),
(757, 'jadav jagan', '9160503922', '$2y$10$Ky9068KuzVaxA5UP2bnPTeIgAmhAwEtt.LC0CZDOHUAfBmFVUKbc6', 'jagan12345', NULL, 'ameerpet', '0', 8, 0, '9160503922', '8522881144', '2024-11-14 13:20:33', '2024-10-03 08:36:28', NULL, NULL, NULL, NULL),
(758, 'Sankar', '7075963970', '$2y$10$NZrKedSc008M18c/gsTQQ.D0UfdstsEXSSoZoSNmQzvwViGVDr/b.', 'asdfghjkl', NULL, 'Hyderabad', '0', 8, 0, '7075963970', '8522881144', '2024-11-14 13:20:33', '2024-10-03 10:45:59', NULL, NULL, NULL, NULL),
(759, 'S BAGI REDDY', '7207891976', '$2y$10$oyPjQh3.5aZmmO1fS2R1MeE1rXdxqza8SC.aNjRMynRDSRuuD/YZW', '7207891976', NULL, 'SUCHITRA HYD', '0', 8, 0, '7207891976', 'admin', '2024-11-14 13:20:33', '2024-10-03 11:46:57', NULL, NULL, NULL, NULL),
(760, 'Swathi', '9391873704', '$2y$10$ltcvXWB/1Pbu5Ig1qon1FO3yn1aBmIqljmbM7uH2UCXR8Y6m9IZ.m', '2525', NULL, '6-2-188/1 , shamal nagar, Shivrampalli, rajendranagar, Ranga Reddy district, hyd, Telangana', '0', 8, 0, '9391873704', '9491443072', '2024-11-14 13:20:33', '2024-10-06 04:44:21', NULL, NULL, NULL, NULL),
(761, 'Chakrapu murali', '9866311843', '$2y$10$PdE93/Z5vVi.bVoBpCMCzeoWVhU8ggyrm3SJUXhj8KlyKcxeSFgPe', 'chakrapu', NULL, 'Endapalli', '0', 8, 0, '9866311843', '9493142434', '2024-11-14 13:20:33', '2024-10-07 10:25:23', NULL, NULL, NULL, NULL),
(762, 'ANJITH KUMAR', '9642145159', '$2y$10$YfyZgfZz1Ccx4pqGGzNe1Okfrspk.K/Xy21C523Xf3qPmPB2qSsp2', '*642145159', NULL, 'VIJAYAWADA', '0', 8, 0, '9642145159', '9493142434', '2024-11-14 13:20:33', '2024-10-07 15:38:00', NULL, NULL, NULL, NULL),
(763, 'BHARATHA RAJANIKANTH', '9959259241', '$2y$10$MMYu1w7PlF06sei9vQZVq.7KUgFFL41JwZVgO0WSYstGtQNfCWXEy', 'surajb@2009', NULL, 'Huzurabad', '0', 8, 0, '9959259241', '9490534100', '2024-11-14 13:20:33', '2024-10-08 10:01:05', NULL, NULL, NULL, NULL),
(764, 'SHIVASAI', '8688525642', '$2y$10$NIu5xvEpuZjFndE83m5ZeOA/TjtGoYBPYbwQSnB4vICe7Oor.E3rW', 'sais@2404', NULL, 'Huzurabad', '0', 8, 0, '8688525642', '9700861430', '2024-11-14 13:20:33', '2024-10-10 13:57:44', NULL, NULL, NULL, NULL),
(765, 'Nikhil', '9666009484', '$2y$10$WFLKfuveCA9PkNKYYpQbmOTJFhURaQRa/ruL4X2z2mlB4qbWvLdnW', 'nikhil.9666', NULL, 'Huzurabad', '0', 8, 0, '9666009484', '9700861430', '2024-11-14 13:20:33', '2024-10-10 13:59:26', NULL, NULL, NULL, NULL),
(766, 'Korlam likhil chandra', '7731091007', '$2y$10$Y7rHrSBYGSNnULPEKu94Tukg3p6yFkxjEvfFlYu4o1sjWfy.JE.b6', 'Likhil@1234', NULL, 'Huzurabad', '0', 8, 0, '7731091007', '9700861430', '2024-11-14 13:20:33', '2024-10-10 14:00:01', NULL, NULL, NULL, NULL),
(767, 'Rajendraprasad martha', '9948077369', '$2y$10$.JKdfOukKguquMW3Z2jCke4X7knohEpdRXngbXZGCRN9V/YIxy8Ge', 'mrp@1968', NULL, 'Hyderabad', '1000', 8, 0, '9948077369', 'admin', '2024-11-14 13:20:33', '2024-10-11 10:46:59', NULL, NULL, NULL, NULL),
(768, 'VELISHALA BHADRAIAH', '7569413489', '$2y$10$.t7jMIQv3/jWHV8XjD8Q5OdpVSmqtc5mOHHMgh.t4ED2Q8OKfGmRS', '984848', NULL, 'WARANGAL', '0', 8, 0, '7569413489', 'admin', '2024-11-14 13:20:33', '2024-10-13 08:19:53', NULL, NULL, NULL, NULL),
(769, 'Bhavani p', '9701413165', '$2y$10$h2VEbM6CMB/zxTB9ol05l.qvKp17CIevNl5Z0PhGEp4eou73xYoXu', '798951', NULL, 'Nagole', '0', 8, 0, '9701413165', '7569194252', '2024-11-14 13:20:33', '2024-10-14 12:38:03', NULL, NULL, NULL, NULL),
(770, 'Tharun', '8639197437', '$2y$10$qoMuh2mzrlpGnFtLi..r8.puGA8EPZKlpjVazfqQ879VcirDRdbFW', 'Tharun@123', NULL, 'Bengaluru', '0', 8, 0, '8639197437', '9441226834', '2024-11-14 13:20:33', '2024-10-16 14:23:39', NULL, NULL, NULL, NULL),
(771, 'Gowthami', '9010131320', '$2y$10$BVvJ1rXDkUPiMz9RhRXI.eAoGkp.Rn5yKTq.m7tPiP411sLx7z6SW', 'madhuguru', NULL, 'Shayampet', '0', 8, 0, '9010131320', '9441226834', '2024-11-14 13:20:33', '2024-10-17 03:36:38', NULL, NULL, NULL, NULL),
(772, 'Chintham Rajesh', '9908716495', '$2y$10$3Eoox8y2wELpkjqJDLnyDu3jZ9T/n6CYBdWzJ6ky/wLT/kzxUaSoG', '9908716495', NULL, 'Warangal', '0', 8, 0, '9908716495', '7702381784', '2024-11-14 13:20:33', '2024-10-18 12:20:36', NULL, NULL, NULL, NULL),
(773, 'Routhu Nithin', '8247511706', '$2y$10$omX3/E89.rdjbarUzCWvs.OIcEz6THaOcEeJn3MW54zVSZYmO5x2i', 'Mummy 123', NULL, 'Godavaikhani Ramagundam  peddapaill', '0', 8, 0, '8247511706', '9441226834', '2024-11-14 13:20:33', '2024-10-19 05:16:22', NULL, NULL, NULL, NULL),
(774, 'Routhu Nithin', '9963598814', '$2y$10$UkpyPWimdD99ZeIgAZYSnulyUAde9uY94EhsyZFV31FLtmuwITOva', 'mummy@143', NULL, 'Godavaikhani Ramagundam peddapaill', '0', 8, 0, '9963598814', 'admin', '2024-11-14 13:20:33', '2024-10-19 14:05:23', NULL, NULL, NULL, NULL),
(775, 'KUSU KARNA KUMAR', '9492326294', '$2y$10$wUCunVF7ieZPyIwKnaEzoeRj67yoiBKuE7afR26ST3/mwoOtdJ7zm', 'Karna@8376', NULL, 'KHAMMAM', '0', 8, 0, '9492326294', '7702381784', '2024-11-14 13:20:34', '2024-10-19 17:44:23', NULL, NULL, NULL, NULL),
(776, 'B RAMESH', '9491890545', '$2y$10$K.RuqumNYYa8Zv/OnJ8VAOPofA0LZDVtRAH9ncf.iBQSgipXWZbU.', 'Ram#-1234', NULL, 'MADHIRA', '0', 8, 0, '9491890545', '9110540771', '2024-11-14 13:20:34', '2024-10-20 12:44:54', NULL, NULL, NULL, NULL),
(777, 'Namburu Narasimha Rao', '9059422515', '$2y$10$95MTw3WvlOB7WG2Q4u3IweuZSulxiM5K5h1MZedWmnpb0ibxueOG6', '4147', NULL, 'KHAMMAM', '0', 8, 0, '9059422515', '9110540771', '2024-11-14 13:20:34', '2024-10-20 13:34:08', NULL, NULL, NULL, NULL),
(778, 'RAMESH MASANA', '9949749618', '$2y$10$T921Fo4BgmFmMCLWsJXhyeFSMPfahk5LFBLwwqbG/Hr7423GQqglS', 'Sunrise@1970', NULL, 'Hyderabad', '0', 8, 0, '9949749618', '9110540771', '2024-11-14 13:20:34', '2024-10-20 16:08:20', NULL, NULL, NULL, NULL),
(779, 'JOGU VENUSAGAR', '9885935414', '$2y$10$HT5.r.0mY0Rv0Yf2Ikfam.VKYDSgqoRJfdUFJRwIITHzOIdg4b9BO', 'Venu@474', NULL, 'WANAPARTHY', '0', 8, 0, '9885935414', '9110540771', '2024-11-14 13:20:34', '2024-10-20 16:56:27', NULL, NULL, NULL, NULL),
(780, 'SHAIK HUSSAIN MIYA', '9490777685', '$2y$10$a8kDlIcH1YtZC32CBNOfBe2EwCuFymF4NhJzzWY/tHgYtQ2wxn5tS', 'Riyan@1984', NULL, 'KHAMMAM', '0', 8, 0, '9490777685', '9110540771', '2024-11-14 13:20:34', '2024-10-21 02:52:39', NULL, NULL, NULL, NULL),
(781, 'Venkatesh', '8639069046', '$2y$10$xDyNA0q3P20Jm4w0EMd2ZO.7El0koG20yYA.kgE2Jrkk/OlSDZqrq', '69046', NULL, 'Khammam', '0', 8, 0, '8639069046', '9110540771', '2024-11-14 13:20:34', '2024-10-21 06:41:54', NULL, NULL, NULL, NULL),
(782, 'V KOTESHWAR', '9347066700', '$2y$10$ruqSSPs.0D4Bcu1u.RHeFuGvMMWaSjsnjrbnfWemtmO9ZHqw7aRsq', '9347066700', NULL, 'SHADHNAGAR', '0', 8, 0, '9347066700', '9032224566', '2024-11-14 13:20:34', '2024-10-21 16:02:55', NULL, NULL, NULL, NULL),
(783, 'CHINTALAPATI VENKATRAMANA', '7893119159', '$2y$10$b0gdqmYGRHIEkVrQLU7Jdejy6If7iRC2YST8pLMjRd93kAeMPcFqO', 'Ch@12345', NULL, '5', '0', 8, 0, '7893119159', '9110540771', '2024-11-14 13:20:34', '2024-10-22 08:14:51', NULL, NULL, NULL, NULL),
(784, 'Naga Raju', '9542868208', '$2y$10$KI35XubGtIKhSDIRF0SG.uO2g384r1weDFdoYmzwxFWkmnzWxrSHq', '123456', NULL, 'Hyderabad', '0', 8, 0, '9542868208', '9346234899', '2024-11-14 13:20:34', '2024-10-23 11:17:52', NULL, NULL, NULL, NULL),
(785, 'Anusha', '8790729378', '$2y$10$yaWajISpKNBXgpkLjxv/IOgbfE.iJ57z1y5O/uJVK3KX4.wfkaI5W', '5858', 'assets/user_assets/images/6719fdfdac50d.ai-generated-ambitious-corporate-indian-businesswoman-photo.jpg', 'HYDERABAD', '0', 8, 0, '8790729378', '8522881144', '2024-11-14 13:20:34', '2024-10-24 07:40:32', 'Flat no 401', 'Hyderabad', 'Telangana', '500038'),
(786, 'Lavanya', '9963747640', '$2y$10$.20ZXMO06Wv3FOp/YEADJOKMjbilPgVO7/TFoKh5uB7UYm.UspHDa', 'jesus143', NULL, 'Hyderabad', '0', 8, 0, '9963747640', '9291290683', '2024-11-14 13:20:34', '2024-10-24 13:28:48', NULL, NULL, NULL, NULL),
(787, 'Ramya', '9908911536', '$2y$10$hHTUCPy3v37f.AWXoEL6gO5W9f2f49rXVp2.aZADgbcZMBRs5dQwC', 'rrr112233', NULL, 'Hyderabad', '0', 8, 0, '9908911536', 'admin', '2024-11-14 13:20:34', '2024-10-26 09:15:51', NULL, NULL, NULL, NULL),
(788, 'Giri mannem', '9848345437', '$2y$10$iXf8L4KaKIv.9CX0Dc8HSOiP1KJX5qoqbSS2E4eMSbS8IF.2Ej9t.', '9848345437', NULL, 'Hyderabad', '0', 8, 0, '9848345437', '7229812345', '2024-11-14 13:20:34', '2024-10-26 14:03:07', NULL, NULL, NULL, NULL),
(789, 'R S VASU', '8309735119', '$2y$10$2GhQyX/EFvp27gFCdptn6ul6Nc3xX8DB5RbpTIMHQzyhSKLVWvRhe', '8309735119', NULL, 'Hyderabad', '0', 8, 0, '8309735119', '8341257474', '2024-11-14 13:20:34', '2024-10-28 12:48:05', NULL, NULL, NULL, NULL),
(790, 'Balusupati kotaiah', '8143347999', '$2y$10$Cbpi7jBxFG8MXNcXcDQ4FuO.BKQaz5uGWKUGTSFbKoEmBgC2bZxPy', '8143347999', NULL, 'Sathenapally', '0', 8, 0, '8143347999', '7702381784', '2024-11-14 13:20:34', '2024-10-28 13:11:04', NULL, NULL, NULL, NULL),
(791, 'PRASHANTH CHIKKULAPALLY', '9494036032', '$2y$10$UoCFjmnSwT7JLrR5KVPpT.6jJsED9.lEnAvirY9/zZwj/hSwCgL5y', 'iwontsayu', 'assets/user_assets/images/6720930c61881.f710f083-fc11-46f1-ae52-0b2449e49348.jpeg', 'Warangal', '100', 8, 0, '9494036032', '8522881144', '2024-11-14 13:20:34', '2024-10-29 07:30:29', 'Door No.16-3-808, Ekashila Nagar, Opp. Wallmart,', 'Warangal', 'Telangana', '506002'),
(792, 'Krishna Kumar', '8522386223', '$2y$10$k10vTnJxe9/hbprRRSs7dueiv4d4VFsApbOzRr9HGZFXctvMuHZRm', 'krishna', NULL, 'krishna', '0', 8, 0, '8522386223', 'admin', '2024-11-14 13:20:34', '2024-10-30 06:04:04', NULL, NULL, NULL, NULL),
(793, 'Hari charan', '9849206595', '$2y$10$yfYeW.eczT8s7d0MvjxzwubnZd9ikvXljEHrUg/62PCYsHJULEJIW', '206595', NULL, 'Armoor', '0', 8, 0, '9849206595', 'admin', '2024-11-14 13:20:34', '2024-10-31 11:43:03', NULL, NULL, NULL, NULL),
(794, 'Ramesh Routhu', '9390295998', '$2y$10$l9N2PM7oquYBUgFAsL/lV.5RnsLubhDzsr/2u.3pjbzMpA8UJWSDm', 'Aparna@123', NULL, 'Sattenapalli', '0', 8, 0, '9390295998', '8143347999', '2024-11-14 13:20:34', '2024-11-02 17:24:34', NULL, NULL, NULL, NULL),
(795, 'qwertyuioyui', '9578612345', '$2y$10$tuLU6CPIfkh9QtshBmN6ZezGZFZ5IsJ6vQvP085xKVCrLQiMhHcCS', 'asdfghjk', NULL, '957862', '0', 8, 0, '9578612345', 'admin', '2024-11-14 13:20:34', '2024-11-05 10:24:00', NULL, NULL, NULL, NULL),
(796, 'SHANMUKH', '6300741586', '$2y$10$qaGM5ld3CI.owq7ziJdHf.FghLUbgy1R/oykYKqLL6V9kwtlycpNO', '6300741586', NULL, 'KUKATPALLY HYD', '0', 8, 0, '6300741586', '8522881144', '2024-11-14 13:20:34', '2024-11-05 12:28:53', NULL, NULL, NULL, NULL),
(797, 'Koklipara ramadevi', '9866022933', '$2y$10$IasmV3QFuP5al393NA0IveS7yB2bj3Xk1wnweXn3c2NGyRb.wazaW', '2001', NULL, 'Pattabipuram', '0', 8, 0, '9866022933', '9246464844', '2024-11-14 13:20:34', '2024-11-06 07:01:39', NULL, NULL, NULL, NULL),
(798, 'Nerella .Lakshmi kumari', '9052695224', '$2y$10$RAy6O2HTPVEOzYCeQSBPjee/0kxfGnSvEUzG2ngjZ0Aseak2IqQyS', '99999', NULL, 'Guntur', '0', 8, 0, '9052695224', '9246464844', '2024-11-14 13:20:35', '2024-11-06 07:01:53', NULL, NULL, NULL, NULL),
(799, 'Vishwa kalyan', '9010491909', '$2y$10$sP4f0CM/p7bGKOCygbwJVe9dTVqFAgk9EfHSonRJ7BmnvLUZINoz2', 'Vish!1204', NULL, 'Kukatpally, Hyderabad', '0', 8, 0, '9010491909', '6300741586', '2024-11-14 13:20:35', '2024-11-08 04:34:22', NULL, NULL, NULL, NULL),
(800, 'Dr b siva Subrahmanyam', '9849179178', '$2y$10$L0WForuGpk8qaukwE1PLxeYZztTKbAvpuvFKQetefmMpUgZ3v3bUC', '18Ssbrd@81', NULL, 'Warangal', '0', 8, 0, '9849179178', '9848073605', '2024-11-14 13:20:35', '2024-11-11 09:58:06', NULL, NULL, NULL, NULL),
(801, 'Kandi Bandeppa', '9492785511', '$2y$10$XVjVpk3ND0LN7cZ8f/oHz.QQM6cCkB.GFHP7E7rNKNf5LjNentV/O', 'Bandeppa@123', NULL, 'Sangareddy', '0', 8, 0, '9492785511', '9491443072', '2024-11-14 13:20:35', '2024-11-12 05:36:17', NULL, NULL, NULL, NULL),
(802, 'SANDA LAXMI', '9848772161', '$2y$10$nkLh13rljZfInvGtgo1cl.5bwbTTdaYR49lB.EeJTwG87DvlK8m7O', 'Sanda789', NULL, 'Hyderabad', '0', 8, 0, '9848772161', '7416946599', '2024-11-14 13:20:35', '2024-11-12 14:03:12', NULL, NULL, NULL, NULL),
(803, 'Bhaskar M', '9110555471', '$2y$10$pKjfMXahSfwUhKIQBxbqcON2u7hRWCit8bGqNZOVKs.Y85jt82wgi', 'Jathin123456', NULL, 'Suryapet', '0', 8, 0, '9110555471', '7416946599', '2024-11-14 13:20:35', '2024-11-12 16:00:13', NULL, NULL, NULL, NULL),
(804, 'Jagadish K', '9014433939', '$2y$10$8tMWqqQmCNql9GvfxNhspuPcitgemhX14ycuExsrMnyIYorcHEJym', 'Jagadish789', NULL, 'Nizamabad', '0', 8, 0, '9014433939', '7416946599', '2024-11-14 13:20:35', '2024-11-13 07:23:20', NULL, NULL, NULL, NULL),
(805, 'Bandi Raju', '9493110757', '$2y$10$x7aVPPY68.OjO5sOsmoMcuoCROIrHXIrc87/m6/ES3YZSYk1rpQUq', 'Braju789', NULL, 'Kamareddy', '0', 8, 0, '9493110757', '7416946599', '2024-11-14 13:20:35', '2024-11-13 07:28:08', NULL, NULL, NULL, NULL),
(806, 'R.Subba Rao', '9848626146', '$2y$10$bZRivFZP3Uy83TrhpgRuf.v4fk70UVNB8Cv5WLGOTOf9jo9zALJRy', 'Raghava888', NULL, 'Mothi Nagar', '0', 8, 0, '9848626146', '9502006371', '2024-11-14 15:11:46', '2024-11-14 15:11:46', NULL, NULL, NULL, NULL),
(807, 'Rajesh', '9492432486', '$2y$10$i/Hwk0A0JmukzwGSMbeLEezyiJkCGZrGQPRLBK4z4VBAywuPzgUn2', 'Success@09', NULL, 'Hyderabad', '0', 8, 0, '9492432486', 'admin', '2024-11-15 13:23:57', '2024-11-15 13:23:57', NULL, NULL, NULL, NULL),
(808, 'Gudipudi ramakrishna', '9703717761', '$2y$10$pULB.i8xUqVRmhXua/MYjOaAhkvOErgra.FPGh67nyn/cF2.9L/KG', '9703717761', NULL, 'Suryapet near jangam croos road', '0', 8, 0, '9703717761', 'admin', '2024-11-16 06:50:16', '2024-11-16 06:50:16', NULL, NULL, NULL, NULL),
(809, 'Manthena Ramadevi', '9000224879', '$2y$10$I2i6brE0cBga0S5KBSr6puCqZemlMPmxv/o1aIVp4iFFCFUT4NBLi', '9000224879', NULL, 'Warangal', '1000010', 20, 0, '9000224879', '7702381784', '2024-11-19 03:45:03', '2024-11-18 15:27:38', NULL, NULL, NULL, NULL),
(810, 'Battini venkataeshgoud', '9440563465', '$2y$10$wVhw5um7vPr7RDmTgroS1eEQAblQMGq9t6W68MirRfQAuObQuKUhm', '381969', NULL, 'Hanamkonda', '0', 8, 0, '9440563465', '9000224879', '2024-11-18 16:50:01', '2024-11-18 16:50:01', NULL, NULL, NULL, NULL),
(811, 'J.Yellaswamy', '9849484672', '$2y$10$NqrHiKsfknQ8J1T0IXqeFu8Qp3pED1U8t4rlSCx0mujkYyqKAFFVK', '9849484672', NULL, 'Parakala', '0', 8, 0, '9849484672', '9000224879', '2024-11-18 17:11:55', '2024-11-18 17:11:55', NULL, NULL, NULL, NULL),
(812, 'Manju naragani', '9701673029', '$2y$10$NOkw2JjgNcCJAvQrMtwcTeQdtCRMEY3/GVjNutJgNwqP3NpFDARbS', '1985@.com', NULL, 'Hanmakonda ramanagar janda subadra apartment', '0', 8, 0, '9701673029', '9000224879', '2024-11-19 03:38:13', '2024-11-19 03:38:13', NULL, NULL, NULL, NULL),
(813, 'Srikanth', '9348963999', '$2y$10$RVM3r4FvSmUokZaM.gQ9C.tL7sdzVzA7zltTzWcGyaQ/nzFaknVA.', '123456', NULL, 'Kukatpally', '162678', 16, 3000, '9348963999', '7229812345', '2026-01-23 14:02:06', '2024-11-19 06:46:09', 'A Srikanth   Flat no102 Sailasree Residency Balayya Basthi Mahadevapuram Gajularamaram', 'Quthbullapur', 'Telangana', '500055'),
(816, 'Sriteja', '7702710885', '$2y$10$g7gcnEqqbEfKY148jRp6aeu3/nESLvn72D2rgS/eYFjR2S89R3YwO', '8247', NULL, 'Hyderabad', '0', 8, 0, '7702710885', '9348963999', '2024-11-19 08:38:21', '2024-11-19 08:38:21', NULL, NULL, NULL, NULL),
(817, 'Cherlagudem Shivakumar Goud', '9542950073', '$2y$10$UxjqFDgfE2rw7cPowphGcO4P6/F66Owu0KoFjr.LeMlS1r8UCIU3K', '954295', NULL, 'Nagaram, keesara mandal, medchal malkajgiri district, Hyderabad- 500083', '0', 8, 0, '9542950073', '9348963999', '2024-11-19 10:17:19', '2024-11-19 10:17:19', NULL, NULL, NULL, NULL),
(818, 'Laxmi', '9398123168', '$2y$10$bZlEg3lOJuq2ccLzTMCSbuYv8a7nSDmeqBmQZvKpZESTZAJ8JIVh2', '9398123168', NULL, 'Hyderabad', '0', 8, 0, '9398123168', '7702381784', '2024-11-19 10:30:09', '2024-11-19 10:30:09', NULL, NULL, NULL, NULL),
(819, 'Suresh Yarraboina', '9948012244', '$2y$10$/nuSPS3dPrErZw7dtoqdHua6BxO3ndmZH0TewXOGMXQ3He3RyDJG6', '123456', NULL, 'Vanasthalipuram', '1000', 8, 0, '9948012244', '9348963999', '2025-01-03 12:57:29', '2024-11-19 11:08:40', NULL, NULL, NULL, NULL),
(820, 'Gudelli Archana', '6301452656', '$2y$10$92zqD9OyjAoFLsA5Kd4VsunD1OkR2kEBMrH2hOUkE6kZCWJLmOhvS', '123456', NULL, 'JNTU', '1000', 8, 0, '6301452656', '9348963999', '2024-12-04 16:18:56', '2024-11-19 11:15:25', NULL, NULL, NULL, NULL),
(821, 'Laxmipathi Pabboju', '9553146376', '$2y$10$u9z3ExJkkmVQZ.Crmzwlg./SsnTXQdMy3vMznFlgif7r3u8HCWwVq', '123456', NULL, 'Kukatpally', '0', 8, 0, '9553146376', '9348963999', '2024-11-19 12:56:42', '2024-11-19 12:56:42', NULL, NULL, NULL, NULL),
(822, 'Chenuramesh', '8008152895', '$2y$10$3btZ5bsetDLFOHLfDG/1juTpnjSfFUNYy/TDP2g5pkhxhAxntJVtK', '8008152895', NULL, 'Singhrayakonda', '0', 8, 0, '8008152895', 'admin', '2024-11-19 14:36:43', '2024-11-19 14:36:43', NULL, NULL, NULL, NULL);
INSERT INTO `service_users` (`service_id`, `member_name`, `member_phone`, `password`, `open_password`, `user_profile_pic`, `location`, `cumulative_gross`, `commission_percentage`, `back_two_back_balance`, `referral_id`, `referral_by`, `created_at`, `joined_date`, `address`, `city`, `state`, `pincode`) VALUES
(823, 'Ramanjaneyulu BARAKAM', '9014506189', '$2y$10$r5GhDB.Fgcyh2B875IvF4OK1lJpKnrZzXerRYCJgejjoarj14.BpO', 'swasa@12345', NULL, 'Madeenaguda', '0', 8, 0, '9014506189', '9348963999', '2024-11-20 04:01:50', '2024-11-20 04:01:50', NULL, NULL, NULL, NULL),
(824, 'Kannan', '6304693360', '$2y$10$YN1YVUhz7kDr6UR.iXeJAeKBOHYKzO9AghQYl5v9UmNrToRsmoGki', 'sanju@29', NULL, 'Begumpet', '0', 8, 0, '6304693360', '9348963999', '2024-11-20 04:01:54', '2024-11-20 04:01:54', NULL, NULL, NULL, NULL),
(825, 'RAMBABU D', '9848835551', '$2y$10$aeAy9svpJk4j/oULi9/OUOX/psYk6P0IsvP/TCdBC0oGWixwsvJRK', '123456', NULL, 'Kphb9th phase', '0', 8, 0, '9848835551', '9348963999', '2025-02-07 11:06:52', '2024-11-20 04:03:17', NULL, 'Hyderabad', 'Telangana', '500038'),
(826, 'Bhanu Prakash', '9912189900', '$2y$10$uEd8p02ViO7A/EVu1ThMR.Ea.0a7KaqgWD.VNO3fhjDw7.a7e9iaW', '15apr1982', NULL, 'Kukatpally, Hyd', '0', 8, 0, '9912189900', '9348963999', '2024-11-20 04:04:28', '2024-11-20 04:04:28', NULL, NULL, NULL, NULL),
(827, 'Ramu mandala', '7569742328', '$2y$10$CUfPJSWPwK0529DTctlRcuoZZxy9wqW.3XEIkVvZD7DkfhB1Sq5sO', '040419', NULL, 'Hyderabad', '0', 8, 0, '7569742328', '8522881144', '2024-11-20 05:17:31', '2024-11-20 05:17:31', NULL, NULL, NULL, NULL),
(828, 'NAGENDDRRA', '7382961519', '$2y$10$KM6O6wDgn5WCt6uiusH5XOfgpn5MmDHr1zA1dHVyXtSsBcdNxAX9i', '123456', NULL, 'Kukatpally', '0', 8, 0, '7382961519', '9348963999', '2024-11-20 05:25:34', '2024-11-20 05:25:34', NULL, NULL, NULL, NULL),
(829, 'Surya Prakash', '9866925632', '$2y$10$.WDBbmofu9JW0utMqkippeMrv64bJ3CQCa9ZFHJeIZGXffiVUTVa6', 'surya@123', NULL, 'Kukatpally', '0', 8, 0, '9866925632', '9348963999', '2024-11-20 05:26:30', '2024-11-20 05:26:30', NULL, NULL, NULL, NULL),
(830, 'Venkatesh', '9182416546', '$2y$10$1jQ7gU3Y4G47qRW3xbKMnulQ28ltdfseijk06vy/sS76PaJafL6Cy', '123456', NULL, 'Filmnagar', '0', 8, 0, '9182416546', '9348963999', '2024-11-20 05:32:12', '2024-11-20 05:32:12', NULL, NULL, NULL, NULL),
(831, 'Shiva Shankar', '6300796670', '$2y$10$LFm2DghW38Ort8Ee5GQdfec1jqkx0tZvvH.rIf2GcGoH965Xfq48m', '123456', NULL, 'Hyderabad', '0', 8, 0, '6300796670', '9348963999', '2024-11-20 05:51:30', '2024-11-20 05:51:30', NULL, NULL, NULL, NULL),
(832, 'Govardhani Kodavali', '7674045621', '$2y$10$uoyyrwgKjC5zMUm4CECNze.IfG5LsHhC.lQ9SHi3eAL0y5BXanJEy', '123456', NULL, 'Kukatpally', '1000', 8, 0, '7674045621', '9348963999', '2024-12-04 16:13:58', '2024-11-20 09:32:00', NULL, NULL, NULL, NULL),
(833, 'Rahaman shaik', '9848439942', '$2y$10$ccr1BliVfIN.fcUyOJZXF.Sib8y6rCSkBkhO2qRcdw/ZYJ2PIpgsy', 'Abcd1234', NULL, 'Kukatpally', '0', 8, 0, '9848439942', '9348963999', '2024-11-21 04:05:09', '2024-11-21 04:05:09', NULL, NULL, NULL, NULL),
(834, 'Nishta Reddy Vem', '7013454948', '$2y$10$rN323Zi6ktoFbIaf8MMKcuDjM.77Ctikrn8iyFL.0Gt5Cmngv/2IO', 'N81522', NULL, 'Hanamkonda', '0', 8, 0, '7013454948', '8522881144', '2024-11-22 02:44:30', '2024-11-22 02:44:30', NULL, NULL, NULL, NULL),
(835, 'Vagdevi', '7731950319', '$2y$10$C7/QOr1wN.7h6bYpLgQ0NuFubPR6HF0CuaOTE2CTyOVXiveTdHuNS', 'devi@123', NULL, 'Hyderabad', '0', 8, 0, '7731950319', '9348963999', '2024-11-22 03:56:05', '2024-11-22 03:56:05', NULL, NULL, NULL, NULL),
(836, 'YUGANDHAR TAMATAM', '7869456369', '$2y$10$DebL4pDdwb6KrD2VUAbCI.NgEcw3QicinDCnTHFskbCO8bs1T1jrm', '123456', 'assets/user_assets/images/676109b32e1cf.IMG_20241217_104736.jpg', 'Miyapur', '27009', 12, 3000, '7869456369', '9348963999', '2026-01-23 14:02:06', '2024-11-22 04:05:01', NULL, 'Miyapur', 'Telangana', '500049'),
(837, 'Anil Kumar', '9000289863', '$2y$10$wNN5cFtLLn7lU0PziBtbq.4lU.8BgfouyQumvJPgz1uXksY7Oyqti', 'Anil@123', NULL, 'Hyderabad', '0', 8, 0, '9000289863', '9348963999', '2024-11-22 04:33:43', '2024-11-22 04:33:43', NULL, NULL, NULL, NULL),
(838, 'Gajjelli Bhaskar', '9441439371', '$2y$10$in9BQp2abVDOx.Vn0/ng8eFYnuJDb.wdg7QlvjfjOjSYpPQeVvTGG', '@Creative007', NULL, 'Paradise', '1000', 8, 0, '9441439371', '9348963999', '2024-12-20 09:49:52', '2024-11-22 04:34:22', NULL, NULL, NULL, NULL),
(839, 'Hardhi', '9570143999', '$2y$10$vzlWbEz3zzddQzE2uPKeUexhoweEzEUmO3CgoHMdkOxWMPHduMHR.', '999999', NULL, 'Kphb', '0', 8, 0, '9570143999', '9348963999', '2024-11-22 04:54:41', '2024-11-22 04:54:41', NULL, NULL, NULL, NULL),
(840, 'Gollapalli Kiran Raj', '9505505057', '$2y$10$9Frs1thwxmcnrtAQsTWfL.hx7emS1KQFVD7KLACRS7F7gdpoD0wha', '123456', NULL, 'Dilsukhnagar', '0', 8, 0, '9505505057', '9348963999', '2024-11-22 05:17:41', '2024-11-22 05:17:41', NULL, NULL, NULL, NULL),
(841, 'Sonam', '7093360131', '$2y$10$mn1Yzk1wXtYD.LN8U.vS6eGgfukAwkoVQiZyxz1ej7E0G1MiyEqVS', '123456', NULL, 'Hyderabad', '0', 8, 0, '7093360131', '9348963999', '2024-11-22 05:18:45', '2024-11-22 05:18:45', NULL, NULL, NULL, NULL),
(842, 'Y. Madhusudhan rao', '9052051923', '$2y$10$.VFoxU4g3gBh8VeJnzqLGek.SYNx8aGQ0wLkmpNu64KuaNefZTi3G', '2212', NULL, 'Kukkatpally', '0', 8, 0, '9052051923', '9348963999', '2024-11-22 05:23:04', '2024-11-22 05:23:04', NULL, NULL, NULL, NULL),
(843, 'N veeramma', '6305114499', '$2y$10$6LX60g2Dja3f6XhRebAxqu996lRBjttjttJmRjnrI2NERYVX7Q11C', '051977', NULL, 'Hyderabad', '0', 8, 0, '6305114499', '9348963999', '2024-11-22 11:39:52', '2024-11-22 11:39:52', NULL, NULL, NULL, NULL),
(844, 'Vamsi', '9182385833', '$2y$10$j8fEyxwnt7iFiVNFsQdi7OEb4kE/TkxyQ/nc27tc0Vf93glr6Syr.', 'Raghu@1993', NULL, 'Kphb', '0', 8, 0, '9182385833', '9348963999', '2024-11-22 11:54:50', '2024-11-22 11:54:50', NULL, NULL, NULL, NULL),
(845, 'Kurre Srinivasa reddy', '8374876687', '$2y$10$HHcld1zP2S1A73YIl0fOg.KeDbvsDBAK2qaONRi3zNtYwPlrnKIHW', 'Kurre@1134', NULL, 'Hyderabad', '0', 8, 0, '8374876687', '9348963999', '2024-11-22 12:06:32', '2024-11-22 12:06:32', NULL, NULL, NULL, NULL),
(846, 'Rama devi .k', '9705935123', '$2y$10$dw8zWm/9kMVY9ZuJKSf2keDxU17D3AmK66K.VC/MtupPcepMko0zq', '9879', NULL, 'Kukatpally', '0', 8, 0, '9705935123', '9348963999', '2024-11-22 12:09:16', '2024-11-22 12:09:16', NULL, NULL, NULL, NULL),
(847, 'Umesh Kumar', '9948933369', '$2y$10$0RGPeimYr2QoVr4Y4OFkzOgatmVfvy8W8Ckono1gtniArR2xyxT5m', 'Add@9366', NULL, 'Add@9366', '0', 8, 0, '9948933369', '9348963999', '2024-11-22 12:13:43', '2024-11-22 12:13:43', NULL, NULL, NULL, NULL),
(848, 'Rajanikanth', '9700066651', '$2y$10$wQufNPBu06IxwwUKnwIU6efuz0F/q6EnrjNS3nCZzM.Xk81g1n2bq', '9700066651', NULL, 'HMT HILLSA', '0', 8, 0, '9700066651', '9348963999', '2024-11-22 12:15:41', '2024-11-22 12:15:41', NULL, NULL, NULL, NULL),
(849, 'Harika', '9848333169', '$2y$10$6BhNX4ZDvkpbWsHXM4zjvOACFrkxfvtGGbX81.J.GyktyE9a5aBoO', 'Harika$1', NULL, 'Gachibowli', '0', 8, 0, '9848333169', '9348963999', '2024-11-22 12:18:42', '2024-11-22 12:18:42', NULL, NULL, NULL, NULL),
(850, 'KUDIPUDI HARSHAVARDHAN', '7036237001', '$2y$10$0P6JB/AKRtirvfR64pRzWeptAx7/ryup3fE4eQUf.zTgkWpNUBuy2', 'Harsha@2258', NULL, 'Balanagar', '0', 8, 0, '7036237001', '9348963999', '2024-11-22 12:18:51', '2024-11-22 12:18:51', NULL, NULL, NULL, NULL),
(851, 'Kiran babu', '9885683033', '$2y$10$kbwVH9rFmSOob5LdOgjL5uYfIGJiyjyjQ6VJFsGQgecAe9S4GrBhu', '123456', NULL, 'Hyderabad', '0', 8, 0, '9885683033', '9348963999', '2024-11-22 12:41:25', '2024-11-22 12:41:25', NULL, NULL, NULL, NULL),
(852, 'Gopichand', '7036001100', '$2y$10$Fm2jn7In7Y4Z9zhUcWCiB.W1ifUV6qtGqkV.BxvNlt7zZRkL10o3m', 'Gopichand@1', NULL, 'Hyderabad', '0', 8, 0, '7036001100', '9348963999', '2024-11-22 12:49:45', '2024-11-22 12:49:45', NULL, NULL, NULL, NULL),
(853, 'Uday Bhaskar Ghanta', '9391299855', '$2y$10$CZVCXaGOvLOpz3pkrbR5Vu20uKEHZWNke4tQ6xIECY4w/32yIZgQS', 'Uday@116', NULL, 'Gopal nagar', '0', 8, 0, '9391299855', '9348963999', '2024-11-22 13:12:03', '2024-11-22 13:12:03', NULL, NULL, NULL, NULL),
(854, 'Rakshith', '9100177511', '$2y$10$fQj.eEKxWgmQAfwHoVzN9elegVkoTFS7DafcsWRKWU26b/JpUidcK', 'rakshith11', NULL, 'Ghanpur,Jangoan,Telangana', '0', 8, 0, '9100177511', '7013454948', '2024-11-24 01:48:35', '2024-11-24 01:48:35', NULL, NULL, NULL, NULL),
(855, 'Chintam Mohan Sai', '9948838934', '$2y$10$qK3KcveubadEmGIw9nLROO9o8R5jGvZfYthLNQjDJzwWokavfGMAS', 'Mohan@78', NULL, 'Warangal', '0', 8, 0, '9948838934', '8522881144', '2024-11-24 06:42:54', '2024-11-24 06:42:54', NULL, NULL, NULL, NULL),
(856, 'Krishnaveni', '8977180681', '$2y$10$stEXJbXsNFQ0wvZMVEEGZe.P5hOGDDV0f5MPvZf21CN1/MR18MHrG', 'Krishnavenis@123', NULL, 'Kphb 9th phase , akhila residency ,gokul plotd', '0', 8, 0, '8977180681', '7674045621', '2024-11-25 04:50:47', '2024-11-25 04:50:47', NULL, NULL, NULL, NULL),
(857, 'Chenna Raju', '9963355333', '$2y$10$9Fuv9jkwUDTFPx2HfGmgZO0r1MZ4XQ4.FfpwlRwzJr775x0SCLHFG', '9963355333', NULL, 'Hyd', '1000', 8, 0, '9963355333', '7702381784', '2024-11-25 06:54:18', '2024-11-25 06:36:32', NULL, NULL, NULL, NULL),
(858, 'Vinay', '9848132081', '$2y$10$HH7ykBxldMgtf9Ep3ccxTeZvNq9lHpulfm9byJwoPrWrRFC7DlYS.', 'vinay123', NULL, 'Kakinada, Andhra Pradesh', '0', 8, 0, '9848132081', '9490334681', '2024-11-25 08:47:02', '2024-11-25 08:47:02', NULL, NULL, NULL, NULL),
(859, '37969606', '8790139997', '$2y$10$pG5cO93L/osBaOxU6yRFN.WjXliYd5kiQJuF7PG0eNtC40Dpjdpwq', '432016', NULL, 'Vishakapatnam', '0', 8, 0, '8790139997', '7702381784', '2024-11-27 04:01:01', '2024-11-27 04:01:01', NULL, NULL, NULL, NULL),
(860, 'R. Sriram Reddy', '8919939629', '$2y$10$RFVNY8BeocPp9CavFnILvuxxj3cAKnl9UmBxh7Ya/hGepCiLdONmS', '114268', 'assets/user_assets/images/6958ff6fd6d6d.1000230455.jpg', 'Huzurabad', '3000', 8, 3000, '8919939629', '7702381784', '2026-02-02 04:02:48', '2024-11-27 09:31:24', 'H. No. 12-281/6/3', 'Huzurabad', 'Telangana', '505468'),
(861, 'Ramnivas', '7032130564', '$2y$10$J59IhjWR035wjcMPC/eNluEPa4rVPEfAgZ.tcaaGBcI4s6zY3Fxmy', '7032130564', NULL, 'Aswaraopeta', '0', 8, 0, '7032130564', '8522881144', '2024-11-28 05:08:18', '2024-11-28 05:08:18', NULL, NULL, NULL, NULL),
(862, 'Alekhya komarraju', '7286019621', '$2y$10$QHYmfATwvlETZoPsBOhp0uFjR1zTJkJ.hYfI/9geZg.SYDIDhXU8u', 'Alekhya@1911', NULL, 'Kukatpally', '0', 8, 0, '7286019621', '8309735119', '2024-11-28 05:33:20', '2024-11-28 05:33:20', NULL, NULL, NULL, NULL),
(863, 'Dayakar', '9000585133', '$2y$10$9k6xBYVrS3rWOjrMj4pn1OW0daB3knUP.UgndiHXWPAofls.14cum', 'cdr@1980', NULL, 'Warangal', '0', 8, 0, '9000585133', 'admin', '2024-11-28 05:38:18', '2024-11-28 05:38:18', NULL, NULL, NULL, NULL),
(864, 'Bochu kishan', '9989910012', '$2y$10$5kZPcMYKFXSYHZtcmz4q7uW0.F7ErmmB49jbB88I7uk73SaSawtge', '7363', NULL, 'Parkal', '0', 8, 0, '9989910012', '8522881144', '2024-11-28 10:58:21', '2024-11-28 10:58:21', NULL, NULL, NULL, NULL),
(865, 'P.RAVINDRA', '9063259665', '$2y$10$Aybt2MvFxLKe8tx2cnmA4udJ6lAU5xHCEuQRuT3.3eVNm1G9Ygq/K', 'Penna@123', NULL, 'Miyapur', '0', 8, 0, '9063259665', '9348963999', '2024-11-28 14:35:01', '2024-11-28 14:35:01', NULL, NULL, NULL, NULL),
(866, 'Swathi', '7095508999', '$2y$10$4WhYRWlg3Ks9ZocH5tVtb.TppLlf68uFOJdiVLL8i/tM6b4GTQw2e', '123456', NULL, 'Kukatpally', '0', 8, 0, '7095508999', '9348963999', '2024-11-28 15:16:27', '2024-11-28 15:16:27', NULL, NULL, NULL, NULL),
(867, 'Joganolla Anandam', '9492908709', '$2y$10$UPHG5rqcnuEXbGB1Uv1yFuk2HMFpolQ74NjLq0gwbHSAIonigy0.2', '9492908709', NULL, 'Village borancha', '0', 8, 0, '9492908709', '7702381784', '2024-11-28 15:52:42', '2024-11-28 15:52:42', NULL, NULL, NULL, NULL),
(868, 'A GOVARDHAN GOUD', '9705096369', '$2y$10$VHSGfHVQdOJxIvhwuGpbCOppHcQRL9UrBOKyoTW9aqDjtUNki.mkW', '123456', NULL, 'MIYAPUR', '1000', 8, 0, '9705096369', '7869456369', '2024-11-28 17:31:15', '2024-11-28 17:15:37', NULL, NULL, NULL, NULL),
(869, 'Vinod bairwa', '8005859395', '$2y$10$Bl5orcS6fzprLsC4tjkYKeTv98Y1xIaVaU1a2UiMyGrkWwm.tng8m', 'Sarita7975', NULL, 'Jaipur', '0', 8, 0, '8005859395', '7702381784', '2024-11-28 20:49:18', '2024-11-28 20:49:18', NULL, NULL, NULL, NULL),
(870, 'Gulshan Kumar', '7006879253', '$2y$10$aMoGHmK0EcASD8rlKJLTmukA/9FRrvHwTh3b27GiBbAVGDObnX5xe', '185203', NULL, 'Reasi', '0', 8, 0, '7006879253', '8522881144', '2024-11-29 05:02:35', '2024-11-29 05:02:35', NULL, NULL, NULL, NULL),
(871, 'Md shabbar Ahmed', '9177560945', '$2y$10$DoKd7VYK8JRzoKGrxA.1lerqed6wV44WmI/AjdO.i8E0ry4eIXGj6', '2345', NULL, 'New look optical shop No.8-3-3/6/8/A.Beside vijaya diagnostic center Engineers colony. Main Road.yousufguda metro pillar no 1488 hyderabad 45', '0', 8, 0, '9177560945', '8522881144', '2024-11-29 11:14:57', '2024-11-29 11:14:57', NULL, NULL, NULL, NULL),
(872, 'Arshiya Syed', '9393940271', '$2y$10$SexSyJVlPqEq.SIzrgAH/.Mf5bJnYpHh7pM4I2Uf5Qa.u0J1t5/CS', 'abc@123456', NULL, 'Hyderabad', '0', 8, 0, '9393940271', 'admin', '2024-11-29 15:43:36', '2024-11-29 15:43:36', NULL, NULL, NULL, NULL),
(873, 'Srinivasarao k', '8885586684', '$2y$10$cbNGBdzJOczEFvQ1f2Yyu.oOec4j/pSpTAlRNd9Ox.bedH8Rf/RKq', '123456', NULL, 'Ameerpet', '0', 8, 0, '8885586684', '9348963999', '2024-11-30 01:51:10', '2024-11-30 01:51:10', NULL, NULL, NULL, NULL),
(874, 'Suresh', '9989585220', '$2y$10$d6C7bTIozAFHKuy4me8Uce9rH3zXTAt4UFirnJFuLAdI8pCbl5XUm', 'mnbvcxz123', NULL, 'Peddapalli district', '0', 8, 0, '9989585220', '8522881144', '2024-11-30 07:38:05', '2024-11-30 07:32:10', 'Mulasala', 'PEDDAPALLI DISTRICT', 'Telangana', '505162'),
(875, 'M PARSHURAM', '9966333367', '$2y$10$uwv5NmGMgNTIEFohoSAaLe.7jzVGzJwpFt73be0Qht/tqWzqeB3Gy', '123456', NULL, 'Hyderabad', '0', 8, 0, '9966333367', '9348963999', '2024-11-30 09:07:17', '2024-11-30 09:07:17', NULL, NULL, NULL, NULL),
(876, 'Haribabu', '9989829040', '$2y$10$MEiwHUWD15zRBpfKj.HFyO2LfQGrA6rXShXUHkt/z1en2C88xFj0a', '452124', NULL, 'Samalkot', '0', 8, 0, '9989829040', '8522881144', '2024-11-30 13:54:21', '2024-11-30 13:54:21', NULL, NULL, NULL, NULL),
(877, 'PATTI SRINIVASA REDDY', '7680035198', '$2y$10$QLaTgLktm9SIdFL1Uq9QLeFnG..M1.8OuP2pYxU6fJ4Wp9Kj0Tife', 'Srinu@2352', NULL, 'SIDDIPET', '0', 8, 0, '7680035198', '8919939629', '2024-11-30 23:58:31', '2024-11-30 23:58:31', NULL, NULL, NULL, NULL),
(878, 'Ramsingh', '9705811424', '$2y$10$gpWpfHUdEJuFfMQPpqrTlOuqdDVFB0HR0FrYmY/R1nruRLlen9loC', '123456', NULL, 'Kukatpally', '0', 8, 0, '9705811424', '9348963999', '2024-12-01 01:43:46', '2024-12-01 01:43:46', NULL, NULL, NULL, NULL),
(879, 'P,ravi', '6305693775', '$2y$10$ZcSKGZN0cBK.BM075JX/HOgyjkBzdeMSVmkChmABluXOO5zvOk1Ba', '123456789', NULL, 'Ravi', '0', 8, 0, '6305693775', '7702381784', '2024-12-01 06:54:19', '2024-12-01 06:54:19', NULL, NULL, NULL, NULL),
(880, 'Venugopal sirikonda', '9618338534', '$2y$10$O6s1.RHcIB8hNTG9eO2GxeZuPUX2b7HO2da3tF.mYHEWuJrcl5f0m', 'venus@69', NULL, 'Hanamkonda', '0', 8, 0, '9618338534', 'admin', '2024-12-15 02:25:09', '2024-12-01 15:44:16', 'H.No. 2-1-114, saraswathi nagar, gopalpur Road. HANAMKONDA', 'Hanamkonda', 'Telangana', '506009'),
(881, 'Hanuman', '9618246446', '$2y$10$yW5E6yAafJ036MTJEbKSn.eXpWUslXCemqffz.Qlz/rgOc7z5ojuW', '123456', NULL, 'Hubsiguda', '0', 8, 0, '9618246446', '9491443072', '2024-12-02 05:36:27', '2024-12-02 05:36:27', NULL, NULL, NULL, NULL),
(882, 'Bharani savara', '7702386533', '$2y$10$zR3bccwuLs7FOXx2JOhTuewOGymr5JYBAAh6CRWYnBJU6lPsVFNGC', '14302211', NULL, 'Indian', '0', 8, 0, '7702386533', '8522881144', '2024-12-03 04:53:28', '2024-12-03 04:53:28', NULL, NULL, NULL, NULL),
(883, 'Gabby', '8097088340', '$2y$10$MCRXPgFIiiMWnh3UD.gw/O4eoHyrbkpohrQwVhVH6mEoZwkDnDRea', 'NGK@7860ngk', NULL, 'Mumbai', '0', 8, 0, '8097088340', '7702381784', '2024-12-03 08:06:34', '2024-12-03 08:06:34', NULL, NULL, NULL, NULL),
(884, 'Sajida', '7993284783', '$2y$10$XYlRE8eVcbpRlSYnJfVw2el/6BOQ0Gnuy56U.w0rNx6qyFprlOcFe', 'sajida@799', NULL, 'Hyderabad', '0', 8, 0, '7993284783', '9346234899', '2024-12-03 08:50:06', '2024-12-03 08:50:06', NULL, NULL, NULL, NULL),
(885, 'lingarao chilaka', '7680047369', '$2y$10$X9BwZoce2oSnmN4uAbyEL./iJ42yINKp1KL0uniRMlAdEAF8MxYra', 'March@19', NULL, 'Vijayawada', '0', 8, 0, '7680047369', '8522881144', '2024-12-03 11:32:12', '2024-12-03 11:32:12', NULL, NULL, NULL, NULL),
(886, 'lingarao chilaka', '7036014307', '$2y$10$6DXFVaKv.8Y.DM5Hn9RWWebWNfQZf1nmW4Vav15goQ0SlHSGqHRty', 'March@19', NULL, 'Vijayawada', '0', 8, 0, '7036014307', 'admin', '2024-12-03 11:34:07', '2024-12-03 11:34:07', NULL, NULL, NULL, NULL),
(887, 'RADHA SEENU', '9360450649', '$2y$10$l77zNTTwmuUltZ8VFq9HNuYlhhq0BpbOj4v56Jg2Sjqjj/sGPTsCC', '123456', NULL, 'Hyderabad', '0', 8, 0, '9360450649', '9348963999', '2024-12-03 12:41:49', '2024-12-03 12:41:49', NULL, NULL, NULL, NULL),
(888, 'Jai karthikeya', '8143197919', '$2y$10$Fk6/yvlA3iLd21Z1FyqfA.o/o/uM6j8z5Ox10QJ8d2N3vMPp/2NWm', 'Karthik@2009', NULL, 'Kphb', '0', 8, 0, '8143197919', '9348963999', '2024-12-03 12:42:08', '2024-12-03 12:42:08', NULL, NULL, NULL, NULL),
(889, 'Anil Kumar', '8889918899', '$2y$10$m1ZHAITbB3/HlEdDOF1Ne.Rj.QV4ccj2nGZBb60iZkPNpbS7TQqIi', '123456', NULL, 'Hyderabad', '0', 8, 0, '8889918899', '9348963999', '2024-12-03 12:43:07', '2024-12-03 12:43:07', NULL, NULL, NULL, NULL),
(890, 'Ramu Kavididevi', '8790798999', '$2y$10$Wn0EOcu7eAYfDmJmmZOvqupUTwFCHBKIqXMXZsj3f0tNfsDWeKLYC', 'Shivesh@2007', NULL, 'Hyderabad', '0', 8, 0, '8790798999', '9553146376', '2024-12-03 17:05:46', '2024-12-03 17:05:46', NULL, NULL, NULL, NULL),
(891, 'Kalpana', '7032020532', '$2y$10$5mn3xRtQUKHIFWXjz3umou9m5ssDrceHyqExSvEydIdMEX0KKjdmW', '123456', NULL, 'Kphb', '0', 8, 0, '7032020532', '6301452656', '2024-12-04 04:38:35', '2024-12-04 04:38:35', NULL, NULL, NULL, NULL),
(892, 'Kalyan b', '9177478855', '$2y$10$GIXNtCgEHqW61DOvQ8DIrewFR0CuaN7nq6NTt1hl8EthrRmr8UjJK', 'navyak7799', NULL, 'Hyd', '0', 8, 0, '9177478855', 'admin', '2024-12-04 05:07:30', '2024-12-04 05:07:30', NULL, NULL, NULL, NULL),
(893, 'Peramsaraswathi', '9963155138', '$2y$10$x5dqi5GT17VAazjve1xNc.r73Ip4IVlIgz7RlKEqr1kQ4C8tNslOO', 'priya123@', NULL, 'Vanastalipuram', '0', 8, 0, '9963155138', '7674045621', '2024-12-04 05:18:11', '2024-12-04 05:18:11', NULL, NULL, NULL, NULL),
(894, '9440761574', '9440761574', '$2y$10$/1vDzS53W7CfoU7u5V.0ce0Emw0CURyur1WpyeX2W75sbAnCuBQUu', '123456', NULL, 'Kphb', '0', 8, 0, '9440761574', '9348963999', '2024-12-04 06:05:50', '2024-12-04 06:05:50', NULL, NULL, NULL, NULL),
(895, 'Vineeth goud Pulicharla', '7993422325', '$2y$10$G26iUdbPI5ODHwGmn2LkUe9GY2WklBTl/RYgcBOPNOBUybxwHxI7a', 'Addmag@909', NULL, 'Ameenpur', '0', 8, 0, '7993422325', '9348963999', '2024-12-04 06:06:27', '2024-12-04 06:06:27', NULL, NULL, NULL, NULL),
(896, 'Gudelli lakshman', '9493431950', '$2y$10$OXool2pQeUBH.sgxcx/2m.sCZvr5lE.la5w8W3TbFQ7mevKZnSOAa', 'Lucky@8573', NULL, 'Hyderabad', '0', 8, 0, '9493431950', '6301452656', '2024-12-04 06:09:04', '2024-12-04 06:09:04', NULL, NULL, NULL, NULL),
(897, 'D.shobha', '7674012316', '$2y$10$3kEKJiY48QXr2oHAKIIr3.rKFf8lo88Xd3qNB3iMaXY/sEdsVWmVi', '12345', NULL, 'Bonakal', '0', 8, 0, '7674012316', '6301452656', '2024-12-04 06:14:33', '2024-12-04 06:14:33', NULL, NULL, NULL, NULL),
(898, 'Kannepogu lokesh', '6309071610', '$2y$10$Eppnbhe.ehya9Ll7s6FLnuiAJNsXmGR4zwvgz/STYWhuu9yHi6cuq', 'kukkapilla', NULL, 'Khammam', '0', 8, 0, '6309071610', '6301452656', '2024-12-04 06:16:02', '2024-12-04 06:16:02', NULL, NULL, NULL, NULL),
(899, 'L.siva kumar', '9866413509', '$2y$10$s3cZu5C35IauF04kfxrKzuaLdr8bMaHgAscneMhJgX8gqTv7hxNyW', '123456', NULL, 'Koderu', '0', 8, 0, '9866413509', '8889918899', '2024-12-04 07:04:03', '2024-12-04 07:04:03', NULL, NULL, NULL, NULL),
(900, 'K sudeshna', '6301377680', '$2y$10$4Ycy28VLSX2eUtvolWwx8.jSMiSQcbdqNFmHXZIU/TTEAAveZede6', 'jaikarthikeya', NULL, 'Tirupati', '0', 8, 0, '6301377680', '8143197919', '2024-12-04 08:39:11', '2024-12-04 08:39:11', NULL, NULL, NULL, NULL),
(901, 'K.akshaya', '9346200501', '$2y$10$ijtJc2zLvkqhxR.wIt4W7OqsBg/IT0m9Y2bXVhl1GEyK3/xS5vSe.', '9876543210', NULL, 'M.C.R colony tirupati', '0', 8, 0, '9346200501', '8143197919', '2024-12-04 09:04:37', '2024-12-04 09:04:37', NULL, NULL, NULL, NULL),
(902, 'K.lalithadevi', '9885027787', '$2y$10$0BZViMQd8yxfTXZqtI3.euiDjje8z329FZxZbb0JKeSuHoY4OADkq', '1234567890', NULL, 'Mcr colony', '0', 8, 0, '9885027787', '8143197919', '2024-12-04 09:37:40', '2024-12-04 09:37:40', NULL, NULL, NULL, NULL),
(903, 'Nagalakshmi', '9985049449', '$2y$10$3zLyxe9DVq9sY120vsYryujkc4UiEeFdqFA/Kjg2xlWj0B0WD6.He', 'lakshmi@123', NULL, '471alladas Srinivasa enclave ,bagath singh nagar', '0', 8, 0, '9985049449', '7674045621', '2024-12-04 11:01:18', '2024-12-04 11:01:18', NULL, NULL, NULL, NULL),
(904, 'Harika', '9390606109', '$2y$10$4eHaBvAFIkfOBDDUciprqOybDC7isvLA4kN74epwB6Ki2J1iTo6hi', 'harika143', NULL, 'Rajamundry', '0', 8, 0, '9390606109', 'admin', '2024-12-04 11:35:03', '2024-12-04 11:35:03', NULL, NULL, NULL, NULL),
(905, 'Phani', '9666412389', '$2y$10$3.LqnoabzcRLP6xHa0bTsOsRJQEDtoeWjKry4JBTuJTEGXHJsWx.C', 'Bala@123', NULL, 'Palakollu', '0', 8, 0, '9666412389', '8889918899', '2024-12-04 13:23:31', '2024-12-04 13:23:31', NULL, NULL, NULL, NULL),
(906, 'SOMA AMAR', '9949905957', '$2y$10$cUKe1mDZQRBKeYf8Mx0QKOWJZ/cbiR7SiKW2uyPSAjHMcpPSilC1i', '9949905957', NULL, 'WARANGAL', '0', 8, 0, '9949905957', '9989225258', '2024-12-05 06:06:13', '2024-12-05 06:06:13', NULL, NULL, NULL, NULL),
(907, 'Bommagani Rajashekar', '9701559208', '$2y$10$hDQr1b5xMG7jajtoOy5/sOQfSyJGnifkQE6CmMka/qWTdEx4WIPtO', '123456', NULL, 'Madhapur', '0', 8, 0, '9701559208', '9948012244', '2024-12-05 07:14:56', '2024-12-05 07:14:56', NULL, NULL, NULL, NULL),
(908, 'Vishal', '9177592103', '$2y$10$Sj/sU/5wBPYLjewijsNRdeMhExK8VPqWj0uCFPJbcPRCW4VgUFc2i', '9177592103', NULL, 'Warangal', '0', 8, 0, '9177592103', '8522881144', '2024-12-05 07:29:02', '2024-12-05 07:29:02', NULL, NULL, NULL, NULL),
(909, 'RAJUPALEM MURALI MOHAN', '9676167899', '$2y$10$NU/O0KaaAxJRqnSkvZFDTOo9UuNB/rx8D7EGT3O5xIkVV234CvyHC', '786786', NULL, '786786', '0', 8, 0, '9676167899', '9348963999', '2024-12-05 07:57:28', '2024-12-05 07:57:28', NULL, NULL, NULL, NULL),
(910, 'I M B', '9391242276', '$2y$10$.RHx8lKcTWo.rJH3cWPj3.SE5hMsEIJo.kNgX0orhl2mqhfFLT.V.', 'Hansy123', NULL, 'Warangal Telangana', '0', 8, 0, '9391242276', '8522881144', '2024-12-05 08:17:57', '2024-12-05 08:17:57', NULL, NULL, NULL, NULL),
(911, 'Deepika', '9851298786', '$2y$10$WHCOS6IAoM9RX8uht2fO5OfWw66ujvLVlyiOwsy.Nr11vYoCL7Ghm', '123456', NULL, 'Kphb', '0', 8, 0, '9851298786', '7674045621', '2024-12-05 10:01:59', '2024-12-05 10:01:59', NULL, NULL, NULL, NULL),
(912, 'Deepika', '9701810671', '$2y$10$3q88QqLkVfBhNMAKziyDN.leJBsdCobbTD.yeZz7PVQGq/mGPtzEy', '123456', NULL, 'Bachupally', '0', 8, 0, '9701810671', '7674045621', '2024-12-05 11:29:03', '2024-12-05 11:29:03', NULL, NULL, NULL, NULL),
(913, 'Gopal', '8179392877', '$2y$10$TNB1FIGxWck9cfoLQJi65uiUm43zx.0XfaodyUMAFcD3rVwSNLSMq', 'Gopal naidu', NULL, 'Nagaylanka', '0', 8, 0, '8179392877', '8143197919', '2024-12-05 13:02:31', '2024-12-05 13:02:31', NULL, NULL, NULL, NULL),
(914, 'PATIBANDA S SAI TEJASWI', '9030085192', '$2y$10$x1xs5VX1FKNcreTQLHMnIujwJpughrOwibhS1WvxzpHFoFhXhNuDO', '123456', NULL, 'Kphb', '0', 8, 0, '9030085192', '7674045621', '2024-12-05 14:34:55', '2024-12-05 14:34:55', NULL, NULL, NULL, NULL),
(915, 'Aswani kumar', '9848053322', '$2y$10$0257VM41ACe6Lt..JE6dkuz5X4RcZCn8G.SiZoIHRnDYfSxW/sLay', '123456', NULL, 'Kphb', '0', 8, 0, '9848053322', '7674045621', '2024-12-05 15:13:39', '2024-12-05 15:13:39', NULL, NULL, NULL, NULL),
(916, 'Vinnu', '9030443000', '$2y$10$FCpXit7jHIQ689cqRqhQYe7V1vpH8NtRz.Nxq0qbGsNnfDTFDYsA2', '123456', NULL, 'Kphb', '0', 8, 0, '9030443000', '7674045621', '2024-12-05 15:20:29', '2024-12-05 15:20:29', NULL, NULL, NULL, NULL),
(917, 'Nimmadadda mahesh', '9642426202', '$2y$10$cwDWQhTeea0zSXcHPKj3zum88FvjzvVVcg9QI/bKFCWFzWlqRNYSu', '123456', NULL, 'KPHB GOKUL PLOTS', '0', 8, 0, '9642426202', '7674045621', '2024-12-05 15:55:54', '2024-12-05 15:55:54', NULL, NULL, NULL, NULL),
(918, 'Banda bhagya', '8106255669', '$2y$10$heTqCgWgPrO2MJ/GjHG.q.P5mK7ACW3d5ZVc2J0olquyeCxdDRrrK', 'bp', NULL, 'Korapally mondal jammikunta', '0', 8, 0, '8106255669', '9701673029', '2024-12-05 16:17:40', '2024-12-05 16:17:40', NULL, NULL, NULL, NULL),
(919, 'Bhuma sai chandana supreethi', '9347922278', '$2y$10$I1QWXuW/FznG4FCDuuzHm.8kcyy5PTHEsbsNLFSLGSm2BrLlqR8NO', 'Preethi1109@', NULL, 'Hyderabad', '0', 8, 0, '9347922278', '7674045621', '2024-12-05 16:50:44', '2024-12-05 16:50:44', NULL, NULL, NULL, NULL),
(920, 'BOLLU SEETHA DEVI', '9160362369', '$2y$10$e0je/IfXN7XopTjJej0GGO8TbaPojKjK1L0B0no/Pyi6Qw54zsijq', '362369', NULL, 'HMT SWARNAPURI COLONY', '0', 8, 0, '9160362369', '7869456369', '2024-12-06 04:43:58', '2024-12-06 04:43:58', NULL, NULL, NULL, NULL),
(921, 'BOLLU SEETHA DEVI', '9160227369', '$2y$10$m3PLy0bc/YE7iDk0cFcn5uoxKDGjRY7RKcbSa5Q1FBDUKXvxpBoDS', '362369', NULL, 'HMT SWARNAPURI COLONY', '0', 8, 0, '9160227369', '7869456369', '2024-12-06 04:44:27', '2024-12-06 04:44:27', NULL, NULL, NULL, NULL),
(922, 'VELPULA NARENDER', '9949095095', '$2y$10$fypr4rfd1gaOUjRw9syixun0jWggRJEaJIA5j1KTUKlaeC4YQnUA2', '123456', NULL, 'Sr Nagar', '0', 8, 0, '9949095095', '9348963999', '2024-12-06 05:45:27', '2024-12-06 05:45:27', NULL, NULL, NULL, NULL),
(923, 'Bysani umabala tripura sundari', '9550562062', '$2y$10$XL7ezermU20XbJOmropn/.XInmoXqYwUQ4moa6PQ9LdrN5Nm./jT.', 'Bdgupta@5', NULL, 'Hyderabad', '0', 8, 0, '9550562062', '9553146376', '2024-12-06 07:47:05', '2024-12-06 07:47:05', NULL, NULL, NULL, NULL),
(924, 'M.srinivasa.rao yadav', '9390632305', '$2y$10$nkXZRo74VBMTBDhp9pJNe.tbV69D7E1xVl5xPNXCjQvELpxM4rI5O', '123456', NULL, 'Goalposts kphb', '0', 8, 0, '9390632305', '7674045621', '2024-12-06 08:16:24', '2024-12-06 08:16:24', NULL, NULL, NULL, NULL),
(925, 'Sreenivas L S', '9059766369', '$2y$10$ASe9z9u/F3.2e7bfYHqXT.MdXWl6iR/f8MdhXoK9898TbWTu19An.', '123456', NULL, 'Saidabad', '0', 8, 0, '9059766369', '9348963999', '2024-12-06 08:52:20', '2024-12-06 08:52:20', NULL, NULL, NULL, NULL),
(926, 'Vinod Reddy.gujjula', '9676086502', '$2y$10$KUC/uJnLBxq/rQOXGLvF2ubc6RPr5il/B0ikn8O79rou4x9wii6YW', '123456', NULL, 'Suchitra', '0', 8, 0, '9676086502', '9348963999', '2024-12-06 11:24:30', '2024-12-06 11:24:30', NULL, NULL, NULL, NULL),
(927, 'Anushmaan', '9848285705', '$2y$10$aCWVLEu3.RWpLQ9b4WvKNurU3mvFpsCJRYT/8kp9g3u0BXu1uSAvG', '1233456', NULL, 'Kphp', '0', 8, 0, '9848285705', '9553146376', '2024-12-06 11:24:33', '2024-12-06 11:24:33', NULL, NULL, NULL, NULL),
(928, 'Ashwin kumar', '9989706810', '$2y$10$M08mHpo5oJetcNoOBcHc2OTxDojsrb61a1.xy5hAlYBSASpKQ1qU2', 'Ashwin@addmagpro', NULL, 'Bowenpally', '0', 8, 0, '9989706810', '9348963999', '2024-12-06 11:50:22', '2024-12-06 11:50:22', NULL, NULL, NULL, NULL),
(929, 'Raghu', '9030097784', '$2y$10$V0cy2BEp90CSkkiz8ah/wOQTvpSrYJV7XqLcZCO65LfRuU5btXkW2', 'lucky1316', NULL, 'Hyderabad', '0', 8, 0, '9030097784', '9348963999', '2024-12-06 11:50:57', '2024-12-06 11:50:57', NULL, NULL, NULL, NULL),
(930, 'Umesh', '9000383310', '$2y$10$McftPeMF6rysa2dQAgkgf.bgPxW7CpdPaMDmtJ/yyEg9NL1RBcdg6', '1234567', NULL, 'Saidabad', '0', 8, 0, '9000383310', '9348963999', '2024-12-06 11:51:58', '2024-12-06 11:51:58', NULL, NULL, NULL, NULL),
(931, 'Umesh', '9701666022', '$2y$10$1ahB6VIyneVAZJtNmxtb7OaoKUOqvEpLBI/fL8/GJCDY5dp9gJOq2', '9701666022', NULL, 'Saidabad', '0', 8, 0, '9701666022', 'admin', '2024-12-06 12:02:36', '2024-12-06 12:02:36', NULL, NULL, NULL, NULL),
(932, 'Anitha Soma', '9052250006', '$2y$10$qwcdN.fdQQvZVTcwbs9ND.0AbRTlsGgS/Wdw5itEt4NXdBd0zxw5.', '123456', NULL, 'Kphb 6\'th phase', '0', 8, 0, '9052250006', '9348963999', '2024-12-06 12:04:46', '2024-12-06 12:04:46', NULL, NULL, NULL, NULL),
(933, 'Latha Sridhar', '9491935788', '$2y$10$FnzWArfXofSrQN95x5yPv.S1nv8H4K.CDB/KqhwmoUsv0j4XC1p9q', 'Google@321', NULL, 'Delhi', '0', 8, 0, '9491935788', '9348963999', '2024-12-06 12:21:37', '2024-12-06 12:21:37', NULL, NULL, NULL, NULL),
(934, 'M.B.Karun Kumar', '7780757226', '$2y$10$4LYhaym2BIvOU9ifU1fCS.fV4QldeXzFhb3JwhBAL5IrEgLJ1C1UO', '789789', NULL, 'Hyderabad', '0', 8, 0, '7780757226', '9348963999', '2024-12-06 12:23:10', '2024-12-06 12:23:10', NULL, NULL, NULL, NULL),
(935, 'Bramheswararao', '8074071147', '$2y$10$I2y1WAi8J37Lr7.xR79TGeUBKqUV6aJQs6jYOYmnmGnhUYxu2H1U6', '0786', NULL, 'Kukatpally', '0', 8, 0, '8074071147', '9348963999', '2024-12-06 12:34:48', '2024-12-06 12:34:48', NULL, NULL, NULL, NULL),
(936, 'Prakash', '7396429337', '$2y$10$NpQEdKySGWxulfzaRIr3CuaG./mKlX2Sb5OMc3Kf2KFw/gAsC8DIK', 'pcash@4478', NULL, 'Chantal', '0', 8, 0, '7396429337', '9348963999', '2024-12-06 12:36:28', '2024-12-06 12:36:28', NULL, NULL, NULL, NULL),
(937, 'Rajesh Pudi', '9889882024', '$2y$10$4VFb7IJODLiIJaNRjAL/YO4SlR/aYgR2nU5Zf4d5FK.AykyaEdkHG', '123456', NULL, 'Kukatpally', '0', 8, 0, '9889882024', '9553146376', '2024-12-06 12:43:13', '2024-12-06 12:43:13', NULL, NULL, NULL, NULL),
(938, 'Kumar', '9704662065', '$2y$10$CsCcUT3lMCnsG3eHEvICIeJjFH9bcXEL2.wbgkcta2vYmmY.RXQ4i', 'Kumard6', NULL, 'Hyderabad', '0', 8, 0, '9704662065', '9000289863', '2024-12-06 12:48:25', '2024-12-06 12:48:25', NULL, NULL, NULL, NULL),
(939, 'CH Madhu', '9398862113', '$2y$10$dtn/9oWHpFlf.rhvmvfCu.5UlrVaUxR4YRRiRvDqhA.UtToE4ZkXu', '123456', NULL, 'Hyderabad', '0', 8, 0, '9398862113', '9348963999', '2024-12-06 12:52:08', '2024-12-06 12:52:08', NULL, NULL, NULL, NULL),
(940, 'Dumpeti nirosha', '8179144196', '$2y$10$bVc6LsEJP2uCQltJSiONjupqWs.ZhCisI6E/4aSdKgl7uvuAdfbiK', 'lasyasri', NULL, 'hyderabad', '0', 8, 0, '8179144196', '9000289863', '2024-12-06 12:53:42', '2024-12-06 12:53:42', NULL, NULL, NULL, NULL),
(941, 'Vijay', '6301347307', '$2y$10$kRx8V7N48LyQDs8XaZt.y.F0u.x0Gzk/9mVxAdDArlj94m.g0pYgS', '22688', NULL, 'Hyd', '0', 8, 0, '6301347307', '9553146376', '2024-12-06 12:54:04', '2024-12-06 12:54:04', NULL, NULL, NULL, NULL),
(942, 'Siva Chowdary Ayinala', '8374999926', '$2y$10$VzjSYprNrFKKzbVvMMIb9.2/VMsHghZZrvSAv9yMz8MKJGlCpZVXG', '12345', NULL, 'Kukatpally', '0', 8, 0, '8374999926', '9553146376', '2024-12-06 12:55:36', '2024-12-06 12:55:36', NULL, NULL, NULL, NULL),
(943, 'Ram Nampally', '9948408230', '$2y$10$Kgp/Wqbua/MAPY5Af9jWneY7DekIoAgevm8jdYy0IuEC5SWwbAl1i', 'next@321', NULL, 'Ameerpet, Hyderabad', '0', 8, 0, '9948408230', '9553146376', '2024-12-06 13:35:32', '2024-12-06 13:35:32', NULL, NULL, NULL, NULL),
(944, 'Racharla Vijay Kiran', '9393336979', '$2y$10$ovvrQCFNzxCHervn5krVdu8QMSKtsouofHJW/jDqnevr8tehVhmte', 'Rsrao$518', NULL, 'KPHB', '0', 8, 0, '9393336979', '9553146376', '2024-12-06 13:36:09', '2024-12-06 13:36:09', NULL, NULL, NULL, NULL),
(945, 'Raj Trinath', '7899855999', '$2y$10$YdTkNml.JLx4e/spXN2t3u9jYZp9/djROIeedFyRNbdT6P1Vkwz.O', 'BuJjI786', NULL, 'Hyderabad', '0', 8, 0, '7899855999', 'admin', '2024-12-06 13:38:53', '2024-12-06 13:38:53', NULL, NULL, NULL, NULL),
(946, 'Dr LSREDDY', '9948889593', '$2y$10$fLYB/wk2LDpGjkcZ.dxlxuzKf3V62lozkXdqXcpksxmnQ0WCdCeYK', 'Lohitha@1', NULL, 'HYDERABAD', '0', 8, 0, '9948889593', '7330748009', '2026-03-22 07:11:43', '2024-12-06 13:39:56', NULL, NULL, NULL, NULL),
(947, 'Hariharan R', '9553620079', '$2y$10$tV840O4zFqxThoqmZ53voOVny/EmrAjyhi6VOgoPsnuuf/ZS4Dbia', '123456789', NULL, 'Kphb', '0', 8, 0, '9553620079', '9553146376', '2024-12-06 15:04:33', '2024-12-06 15:04:33', NULL, NULL, NULL, NULL),
(948, 'G.SIDDHARTHA', '9703597673', '$2y$10$lkTcjS709oaisb8Dm6AG7OPRN8hXXE7D9eq02AzAamHck9sqW6HUy', '123456', NULL, 'Kukatpalli', '0', 8, 0, '9703597673', '9553146376', '2024-12-06 15:12:33', '2024-12-06 15:12:33', NULL, NULL, NULL, NULL),
(949, 'Charan kumar.l', '8374732351', '$2y$10$A6l/q0do2cxRrbiQa7PB4Ow3YueS1jm2XuWl.4EtAOZ6ADD18uB9K', '123456', NULL, 'Kphb', '0', 8, 0, '8374732351', '7674045621', '2024-12-07 09:09:28', '2024-12-07 09:09:28', NULL, NULL, NULL, NULL),
(950, 'Deepika', '9247658883', '$2y$10$ZMwGPyjn0ifEAgtZVi295.ebY3f0cGwWFHm3DwvCVdxLkwVLYiVcG', 'deepika@143', NULL, 'Hyderabad', '0', 8, 0, '9247658883', '7674045621', '2024-12-07 09:24:40', '2024-12-07 09:24:40', NULL, NULL, NULL, NULL),
(951, 'Mr Prem Raj', '9391922022', '$2y$10$yLiXOPzw5w0wJAbs35PDbO0lfKTDWcLMVyHsT0nFdOCUA7GIi7hqi', '369369', 'assets/user_assets/images/678a104824f6d.WhatsApp Image 2025-01-17 at 13.26.51.jpeg', 'Miyapur x road', '1000', 8, 0, '9391922022', '7869456369', '2025-01-17 08:09:44', '2024-12-08 05:59:22', 'HYDERABAD', 'Hyderabad', 'Telangana', '500049'),
(952, 'Kamarapu Satyanarayana', '7330696465', '$2y$10$2fzq2XlmxIhuHuVDRqVIN.LyOSHU7vRl0BffJ9Rhl14/T5gjxSgoe', '7330696465', NULL, 'Karimnagar', '0', 8, 0, '7330696465', '7702381784', '2024-12-09 07:30:27', '2024-12-09 07:30:27', NULL, NULL, NULL, NULL),
(953, 'Dinesh', '8121341415', '$2y$10$ee76Oz7bINYEo/mudSrfnu4gR5J4J703UrSIfyOgCp3wd/FxQM0eG', '12345', NULL, 'Hyd', '0', 8, 0, '8121341415', '7702381784', '2024-12-09 07:52:37', '2024-12-09 07:52:37', NULL, NULL, NULL, NULL),
(954, 'DHARIPELLI SURESH', '9666137587', '$2y$10$.Yri7YukBxvvk65lyR/s6.h209JqQfYQ5nwSD2AZJlC8/wCVl2KYy', 'Dsuresh@123', NULL, 'Srirampur colony', '0', 8, 0, '9666137587', '8919939629', '2024-12-09 09:36:32', '2024-12-09 09:36:32', NULL, NULL, NULL, NULL),
(955, 'Erukala Maheshbabu', '9949217875', '$2y$10$hB/zMJk5X8NYNvbnv.9pzOoTH6iWgpwYU8LhDTSGvRNgRv1yl.haO', '217875', NULL, 'Godavarikhani', '0', 8, 0, '9949217875', '8919939629', '2024-12-09 09:45:51', '2024-12-09 09:45:51', NULL, NULL, NULL, NULL),
(956, 'Chinni.venkata laxmi', '9290089027', '$2y$10$mlRw56Euwyze6yFsp35PweHF4Po9cLGhPm4vD1OhwuXmqIx/F9zjy', '1544', NULL, 'Godavarikhani 8 in cline colony', '0', 8, 0, '9290089027', '8919939629', '2024-12-09 10:15:10', '2024-12-09 10:15:10', NULL, NULL, NULL, NULL),
(957, 'Dasari ramesh', '9963311041', '$2y$10$96NkEEfN1L9pWt83sn5QpOZ8nfK7igQTLBdOgezXOzm0gbhRbLJwm', '31939', NULL, 'Tirumala Nagar Hanuman temple Godavarikhani', '0', 8, 0, '9963311041', '8919939629', '2024-12-09 10:27:10', '2024-12-09 10:27:10', NULL, NULL, NULL, NULL),
(958, 'Bogam Ramesh', '9866404129', '$2y$10$hIXwQ9mdZUBPZATgaCWB8uKtNlztAODgTesT375HunTvLLcOMTsiq', 'Ramesh@123', NULL, 'Karimnagar', '0', 8, 0, '9866404129', '8919939629', '2024-12-09 10:28:56', '2024-12-09 10:28:56', NULL, NULL, NULL, NULL),
(959, 'Maruti sharadha', '8341161613', '$2y$10$OetVL2X42x8KtQ0vIusPXeezT04H/f5UYY/.Y6ORNz3pWXEi.dqS6', '217875', NULL, 'Peddapalli', '0', 8, 0, '8341161613', '9949217875', '2024-12-09 11:13:19', '2024-12-09 11:13:19', NULL, NULL, NULL, NULL),
(960, 'P. Durga Bhavani', '8886388222', '$2y$10$hOR3CacRCfry0twBV8RiMOm9MHdKX02eZOVIjhpW.n6oMW/uNjhT.', '123456', NULL, 'Kukatpally', '0', 8, 0, '8886388222', '9348963999', '2024-12-10 04:40:38', '2024-12-10 04:40:38', NULL, NULL, NULL, NULL),
(961, 'Kamalakar', '9393824074', '$2y$10$j2ew35qoRXGbeqqKMOCxT.DD9ELez2jglAvAa5izNJenjp3LWp6tG', 'K@mal9392', NULL, 'Huzurabad', '0', 8, 0, '9393824074', '8919939629', '2024-12-10 06:45:36', '2024-12-10 06:45:36', NULL, NULL, NULL, NULL),
(962, 'Kareeshma', '9392956734', '$2y$10$7uXnISJaCs.2ip9rwUEWeeKuOw8ZZC2qgdhIZletklTdSjlbCD5ES', 'karish', NULL, 'Repalle', '0', 8, 0, '9392956734', '8143197919', '2024-12-10 09:19:38', '2024-12-10 09:19:38', NULL, NULL, NULL, NULL),
(963, 'Ch jyothi', '9392242038', '$2y$10$NEZ.7v8jlzz9TMxwUUnEDODk.n6ZkTmxNh7Eqh2zVTSoIwzfS/I6y', '123456', NULL, 'Kukatpally', '0', 8, 0, '9392242038', '9348963999', '2024-12-10 10:47:13', '2024-12-10 10:47:13', NULL, NULL, NULL, NULL),
(964, 'PURNA CHANDER', '9701298143', '$2y$10$9YZ556GX8D3qWzaCnouVw.nAryOM.qWWxo6SYMdbA/S1NyYXAvMbK', 'Purnagoud7', NULL, 'Hanmakonda', '0', 8, 0, '9701298143', '9000224879', '2024-12-10 13:38:18', '2024-12-10 13:38:18', NULL, NULL, NULL, NULL),
(965, 'Harish oruganti', '9676121935', '$2y$10$kpB712yxST7FcmhDrJObx.6dgUYRzjYlsoml6qQhImgAt8aoV4zCa', 'H@rish9676121935', NULL, 'Hanamkonda', '0', 8, 0, '9676121935', '9000224879', '2024-12-10 13:40:22', '2024-12-10 13:40:22', NULL, NULL, NULL, NULL),
(966, 'Emmadi Uday', '9391897446', '$2y$10$b7jzX7EsQNNpz2z5lOmO8uuyNTCwUP0FyfW30JkdwhtOMNozlwwAC', '9391897446@123', NULL, 'Warangal', '0', 8, 0, '9391897446', '9000224879', '2024-12-10 13:41:55', '2024-12-10 13:41:55', NULL, NULL, NULL, NULL),
(967, 'Ravi.ch', '9642330320', '$2y$10$Gb79N/IaFlJLmHvKTl2IkuaTUui2ng4IHQx28TiR.fSlkD8o7TK7C', 'ravisiri', NULL, 'Hanmakonda', '0', 8, 0, '9642330320', '9000224879', '2024-12-10 13:58:59', '2024-12-10 13:58:59', NULL, NULL, NULL, NULL),
(968, 'Rayalaseema Ali', '9347666333', '$2y$10$uCoMmrdE99P.qY.Ld5dQAema7RNszJW0NlguAlzXYuqMznDMTH6iG', 'abc@123456', NULL, 'Hyderabad', '0', 8, 0, '9347666333', '7702381784', '2025-04-01 06:03:37', '2024-12-11 09:59:03', NULL, NULL, NULL, NULL),
(969, 'Harika', '9901101334', '$2y$10$qz0GM0TQEcQ6q7lMmlLAFu8DenKp2uOQDHv7UG2GURqo29K7pojUi', 'Sweety@1', NULL, 'Hyderabad, Andhra Pradesh', '0', 8, 0, '9901101334', '7674045621', '2024-12-11 12:48:22', '2024-12-11 12:48:22', NULL, NULL, NULL, NULL),
(970, 'Vamshi k mohan tattari', '9885574142', '$2y$10$b5/zoI.6FjvBHBB746On5.IaB.3VG8tdpp.xYBzk2MQaWDMMMT4Se', 'Tipu@123', NULL, 'Hyderabad', '0', 8, 0, '9885574142', '9348963999', '2024-12-11 14:07:10', '2024-12-11 14:07:10', NULL, NULL, NULL, NULL),
(971, 'Thatikonda Ramesh', '8801070444', '$2y$10$2D.pqI4Cxv2brPTgus4tWO3Lmdu6eBN7g3wVqyPk6tW.jJdQgclP.', 'Ravi@2019', NULL, 'Godavarikhani', '0', 8, 0, '8801070444', '9949217875', '2024-12-12 01:19:56', '2024-12-12 01:19:56', NULL, NULL, NULL, NULL),
(972, 'Vaibhav', '7330652791', '$2y$10$TOFHdvINyTT9VCrc48YfYenmrkOrmuOW9B//SMDC6YFtMJ8YCPQ.y', '123456', NULL, 'Ghatkesar, NFC nagar', '0', 8, 0, '7330652791', '8522881144', '2024-12-12 12:48:39', '2024-12-12 12:48:39', NULL, NULL, NULL, NULL),
(973, 'Praveen Reddy', '8501838762', '$2y$10$8WdorBoE2ccBmkK2luH4YueBOolKqGFYppQUxsZwrl1eumOdDplYi', 'qwerty', NULL, 'Kphb', '0', 8, 0, '8501838762', '7869456369', '2024-12-12 13:23:57', '2024-12-12 13:23:57', NULL, NULL, NULL, NULL),
(974, 'G.Tripureshwar', '9908802108', '$2y$10$ttwTGpDAR78u9xMy9xJYteSoPxUchQcu6iN6P3LRhUwbeD2ItCPoy', 'Gattu@123', NULL, 'Bachupally', '0', 8, 0, '9908802108', '8522881144', '2024-12-12 13:54:51', '2024-12-12 13:54:51', NULL, NULL, NULL, NULL),
(975, 'Venkat reddy', '7780784287', '$2y$10$KYOGxPwFEvTPC3Ub/e8ZP.W.6TTtQkD71Op4D6QDJrzkuHlm.PifO', 'vebkat@1234', NULL, 'Hyderabad', '0', 8, 0, '7780784287', '7674045621', '2024-12-12 14:10:26', '2024-12-12 14:10:26', NULL, NULL, NULL, NULL),
(976, 'Vijaya', '9951216606', '$2y$10$np1uhlYVriy0GwZ0uQadXeCx4BJI8XVH/OqZ8aUFqmJwIPfMndu72', 'Cherry@2024', NULL, 'Kphb', '0', 8, 0, '9951216606', '7674045621', '2024-12-13 06:56:51', '2024-12-13 06:56:51', NULL, NULL, NULL, NULL),
(977, 'Mounika jaiswal', '8605430225', '$2y$10$Sch5qbbxefJ7IIhyLcJGE.APCW..34mwJ/3iSkjHnFwdshlmDEq9G', '1234567', NULL, 'Attapur', '0', 8, 0, '8605430225', 'admin', '2024-12-13 09:56:37', '2024-12-13 09:56:37', NULL, NULL, NULL, NULL),
(978, 'Dikshitha', '9381776824', '$2y$10$byg9hKo2GIqVixXGS4rmb.thW0OWBZmLLpx6XmDt5BSksn7MvthPe', '123456', NULL, 'Attapur', '0', 8, 0, '9381776824', '8605430225', '2024-12-13 10:10:44', '2024-12-13 10:10:44', NULL, NULL, NULL, NULL),
(979, 'Sriharsha Nannapaneni', '8886989898', '$2y$10$0xjpvag17wVWgPlK4q3./ezXwku8G/f6WfeaNAgJb5pbR7n63VEce', 'harsha123', NULL, 'Hyderabad', '0', 8, 0, '8886989898', 'admin', '2024-12-13 11:45:14', '2024-12-13 11:45:14', NULL, NULL, NULL, NULL),
(980, 'Srinivasareddy', '9553900663', '$2y$10$cBsW.hK2xznncBGJU0VSTeSIFHBcYmvK9R85qN0aoIzA9Yqn8E1ta', 'Srinu@1234', NULL, 'Ongole', '0', 8, 0, '9553900663', 'admin', '2024-12-13 12:02:54', '2024-12-13 12:02:54', NULL, NULL, NULL, NULL),
(981, 'CH.VENKAT', '9618689493', '$2y$10$ijtbTPXO682BZoTaqu7uk.fBYEqqwAFh715d8PvGsHwOAeZb6bmk2', '123456', NULL, 'Kukatpally', '0', 8, 0, '9618689493', '9553146376', '2024-12-13 15:31:29', '2024-12-13 15:31:29', NULL, NULL, NULL, NULL),
(982, 'Mallikarjunarao', '8712977075', '$2y$10$Fgh0ARxH60iqPIKVOu.do.Z8xv3HEEeH4YieHZbyaZBgTv7W6aRdm', '123456', NULL, 'Ameerpeat', '0', 8, 0, '8712977075', '8522881144', '2024-12-14 07:58:05', '2024-12-14 07:58:05', NULL, NULL, NULL, NULL),
(983, 'P Sri ramana', '9989443767', '$2y$10$wybefzfekSPJNXKpasIH4.IuFXl97e.1WOAPH3YTHr.CGIza411Dy', '123456', NULL, 'Ameerpet', '0', 8, 0, '9989443767', '8522881144', '2024-12-14 08:11:23', '2024-12-14 08:11:23', NULL, NULL, NULL, NULL),
(984, 'Panduranga', '9959818521', '$2y$10$dtXNB6.c8RgH3ba85AAJAeHF4RASb46SNALRfvOkKDGQDdg/92i.K', '123456', NULL, 'hyderabad', '0', 8, 0, '9959818521', '9347666333', '2024-12-14 09:02:37', '2024-12-14 09:02:37', NULL, NULL, NULL, NULL),
(985, 'Mukund', '9000154238', '$2y$10$dZqpc0PpLDwjk80Rivlu5uXKOh9LgtLg1IWTqn75Nz4XhCd92aRvK', '9000154238', NULL, 'Hyderabad', '0', 8, 0, '9000154238', '8522881144', '2024-12-14 12:12:03', '2024-12-14 12:12:03', NULL, NULL, NULL, NULL),
(986, 'Hanumappa S N', '8970638090', '$2y$10$.35mBsNcy./t7yEOtAQJQuVXNJtgs5Cpfu9YgtAjJIawNyd/y7OX6', 'Hanu@123', NULL, 'Chintamani', '0', 8, 0, '8970638090', '9347666333', '2024-12-14 14:15:08', '2024-12-14 14:15:08', NULL, NULL, NULL, NULL),
(987, 'Praneeth Sai', '8801451182', '$2y$10$IQ0.X2XpSsb4G6Jj2zzLpeY3a6xwn2324yXvkKg1i1fY9a3/o3ure', 'Sai@3456', NULL, 'Hyderabad', '0', 8, 0, '8801451182', '7382961519', '2024-12-16 06:34:02', '2024-12-16 06:34:02', NULL, NULL, NULL, NULL),
(988, 'Vishnu Priya', '7899365585', '$2y$10$L2FugdWKWbl9c/NF/y7RBe4045SVAvJfbebk.jjHEX/ra1txSGnUu', 'Himansh', NULL, 'Hyderabad', '0', 8, 0, '7899365585', '8801451182', '2024-12-16 08:02:47', '2024-12-16 08:02:47', NULL, NULL, NULL, NULL),
(989, 'Nallaguntla Sandeep', '9966223036', '$2y$10$cbuzCYv7YjjxEVDy40svjewM3F9e2p9p5rLBTkZOqimJ0V.9m0RuO', '9396821431', NULL, 'Suryapet', '0', 8, 0, '9966223036', 'admin', '2024-12-16 08:34:05', '2024-12-16 08:34:05', NULL, NULL, NULL, NULL),
(990, 'Tattikota Venuugopal', '7013111642', '$2y$10$f.k2GSxC1FDfdfr6Iqggj.CwN4DJD6OTKVaTkaUaozS9QldSQ4Nm6', 'Eepsi@2000', NULL, 'Kukatpally', '0', 8, 0, '7013111642', '8801451182', '2024-12-16 08:44:21', '2024-12-16 08:44:21', NULL, NULL, NULL, NULL),
(991, 'Jagannath', '9988998549', '$2y$10$molTY3yaBMvhTJb2PkR4gOnYuB5qZysN28ujRrhiKG.QNNOV70xZO', '123456', NULL, 'Hyderabad', '0', 8, 0, '9988998549', '9348963999', '2024-12-16 14:49:11', '2024-12-16 14:49:11', NULL, NULL, NULL, NULL),
(992, 'Karthik', '8309576727', '$2y$10$Q7SDi3pddzgGR.xiaTs5HOmuXvs6ngeFW/EC18QODSe8Ojo5EvZSS', 'Karthik@57', NULL, 'L b nagar, Hyderabad', '0', 8, 0, '8309576727', '9348963999', '2024-12-16 15:07:57', '2024-12-16 15:07:57', NULL, NULL, NULL, NULL),
(993, 'Koushik', '9959221842', '$2y$10$ziUdxKDnHeutkRgJDXGtielrhfeOOghIvrz.damjir0QxnNbo3C/2', '123456', NULL, 'Gachibowli', '0', 8, 0, '9959221842', '9348963999', '2024-12-16 15:26:11', '2024-12-16 15:26:11', NULL, NULL, NULL, NULL),
(994, 'Vinay surya', '9866265550', '$2y$10$yzVSM7zb83X/kA9OeHcR2O2J9Ef5RfCjbFR7v4rxL0c0j9kqMS9Tq', 'Vinay@123', NULL, 'Hyderabad', '0', 8, 0, '9866265550', 'admin', '2024-12-17 06:03:16', '2024-12-17 06:03:16', NULL, NULL, NULL, NULL),
(995, 'Gowri sankar', '8142118833', '$2y$10$Nfl5OCel./0N3BMOxy4RBeUCdobm4W9m2KMaS2RJk.pONwWvX5t46', '123456', NULL, 'Ameerpet', '0', 8, 0, '8142118833', '9348963999', '2024-12-17 06:17:35', '2024-12-17 06:17:35', NULL, NULL, NULL, NULL),
(996, 'Suresh Babu Yendluri', '9611130115', '$2y$10$nIqSogyuHeiNfZS.bPgUjOJpszLYpxxhoWqr1aXuwwl7oyWtMNUqm', '123456', NULL, 'Miyapur', '0', 8, 0, '9611130115', '7869456369', '2024-12-17 09:50:06', '2024-12-17 09:50:06', NULL, NULL, NULL, NULL),
(997, 'NALLAMOTHU RAMU', '9885420103', '$2y$10$oS2u8/QB5giNN7SMjWbFEO1/7JPj874dj.rHP.NFy7KOpqiNBC0EG', '123456', NULL, 'VANASTALIPURAM', '0', 8, 0, '9885420103', '7869456369', '2024-12-17 09:57:35', '2024-12-17 09:57:35', NULL, NULL, NULL, NULL),
(998, 'K Raju kumar', '7799515077', '$2y$10$iG.gPM2IgwB9Eh6aIE0ldOgmh8p12TZ2/pnwyrR/uFwycLmFWmaxm', 'Raj@12345', NULL, 'Hyderabad', '0', 8, 0, '7799515077', '7382961519', '2024-12-17 10:40:34', '2024-12-17 10:40:34', NULL, NULL, NULL, NULL),
(999, 'G naresh', '9985500207', '$2y$10$xBsS.PTCrsRoeciZxcCTyuPX77t8u1X5P0bT9qp9cT.6gQ2I/DDxa', '123456', NULL, 'Panjagutta', '0', 8, 0, '9985500207', 'admin', '2024-12-17 10:44:47', '2024-12-17 10:44:47', NULL, NULL, NULL, NULL),
(1000, 'Raghuram Basava', '9866661106', '$2y$10$xTbAKdhX4ZdGtUPrB/4sO.R0jEpMdbg6RyccbWRnIF9RO13wuwRm.', '123456', NULL, 'Ammerpet', '0', 8, 0, '9866661106', '8522881144', '2024-12-17 13:28:21', '2024-12-17 13:28:21', NULL, NULL, NULL, NULL),
(1001, 'DURGA SRINIVASA RAO', '8978997070', '$2y$10$Ipu73kBHrj2VlalADTpXNuZJHzjP1apL2ZhOCWQbg09Q40FQADQl.', 'miyapur', NULL, '123456', '1000', 8, 0, '8978997070', '9348963999', '2024-12-18 16:47:43', '2024-12-17 16:50:46', NULL, NULL, NULL, NULL),
(1002, 'SUrya', '8074199876', '$2y$10$he3BLPRGIuqbPBjSxRgOTOMu6uEr3LHD3f.TcJtVUZ/marHAQ5.fm', 'Surya@123', NULL, 'Hyderabad', '0', 8, 0, '8074199876', '9347666333', '2024-12-18 06:07:32', '2024-12-18 06:07:32', NULL, NULL, NULL, NULL),
(1003, 'Sharath teja', '7997078375', '$2y$10$A8z4pN2bhvHiMopn.HQ9euEZ/Q7PqCg2utL93mdpq88KfEBrjhWDi', 'Lokesh@9989', NULL, 'Hyderabad', '0', 8, 0, '7997078375', '9347666333', '2024-12-18 06:37:03', '2024-12-18 06:37:03', NULL, NULL, NULL, NULL),
(1004, 'M Nagarjuna reddy', '8247318575', '$2y$10$4Uzzj.nRjwPcleZfLcT.Muhm9NovYNuDPlwmFXKVlNuCQAyuXTvKC', 'mnr1234@', NULL, 'Nizampet', '0', 8, 0, '8247318575', '9348963999', '2024-12-18 06:54:21', '2024-12-18 06:54:21', NULL, NULL, NULL, NULL),
(1005, 'Shiva Kumar Mekala', '9346202030', '$2y$10$rtfvNpkXRQBat1aHU/svCOOm8BIYseF0vf.oIx9Z8ibEcoS1nG4Ke', 'Jesus@2355', NULL, 'Sainikpuri', '0', 8, 0, '9346202030', '9348963999', '2024-12-19 10:15:17', '2024-12-19 10:15:17', NULL, NULL, NULL, NULL),
(1006, 'G. Babugoud', '9948197000', '$2y$10$w6CR4fHHFBl43NwHEE/WMucfpCJTEUCXjL5ZN22tTC7jrgoSI2E1O', '123456', NULL, 'Miyapur', '6000', 8, 6000, '9948197000', '7869456369', '2026-01-23 14:13:15', '2024-12-19 14:03:00', 'HYDERABAD', 'Hyderabad', 'Telangana', '500049'),
(1007, 'Mingi santhosh', '9154260369', '$2y$10$RbK1BIX8GSD/NMh3p91A7eYBf0WKPZOFwlZZAAA9jCSkjd8xUBg8S', '369369', NULL, 'Miyapur', '0', 8, 0, '9154260369', '7869456369', '2024-12-19 14:11:45', '2024-12-19 14:11:45', NULL, NULL, NULL, NULL),
(1008, 'Akala sampath kumar goud', '6303708940', '$2y$10$CwSgWET8Jyg6cHutpGoK1e78MRzaV9iB/jYVrFO7q3MW0grs5D1ti', '123456', NULL, 'Miyapur', '0', 8, 0, '6303708940', '9705096369', '2024-12-19 15:36:00', '2024-12-19 15:36:00', NULL, NULL, NULL, NULL),
(1009, 'Avala ashok goud', '8499828082', '$2y$10$fn8xIZ5SVEVzDh7DgYqs9eELEppWirkpe35x2Dmu7hulP/CwkwHR6', '123456', NULL, 'Miyapur', '0', 8, 0, '8499828082', '9705096369', '2024-12-19 16:26:12', '2024-12-19 16:26:12', NULL, NULL, NULL, NULL),
(1010, 'e.krishnaveni', '9492966369', '$2y$10$qrwbcwadiGQzJCuc96h8O.zh6g7c66X4kuwcKPHcT6cNRzLpb66Y6', '369369', NULL, 'Hmt colony', '0', 8, 0, '9492966369', '9705096369', '2024-12-19 16:32:17', '2024-12-19 16:32:17', NULL, NULL, NULL, NULL),
(1011, 'Sekhar mingi', '9154150777', '$2y$10$0jFXDz/N.u6ntaAoqeYL7e7RLWSfg2UgHpUDUZVwhQ97Q6TmK86gC', '123456', NULL, 'Kompally, Hyderabad', '1000', 8, 0, '9154150777', '7869456369', '2025-01-07 12:19:32', '2024-12-20 03:26:46', NULL, NULL, NULL, NULL),
(1012, 'Spice of Tiranga', '7032137156', '$2y$10$/JQw3yOyk/2wKSUHS3uOfOv/7qWMrglzMRbQlpeEYmQgw9XGTMDWG', '123456', NULL, 'Kphb', '0', 8, 0, '7032137156', '9348963999', '2024-12-20 11:24:47', '2024-12-20 11:24:47', NULL, NULL, NULL, NULL),
(1013, 'Etla Chandrashekhar', '9849651607', '$2y$10$FArHtKYLmp7FOmmxQiYVYeR/yAcekRaZRjfLBQVsGc06yvqMQbLdK', '123456', NULL, 'Kukatpally', '0', 8, 0, '9849651607', '9348963999', '2024-12-20 11:28:41', '2024-12-20 11:28:41', NULL, NULL, NULL, NULL),
(1014, 'KAVADI  RAJASEKHAR', '9856295629', '$2y$10$hkpPc4QVIA1U/kL/rRPpDupZtk9cfd2fqZohdLf2wIJxto.EjJxvu', '123456', NULL, 'Kphb', '0', 8, 0, '9856295629', '9348963999', '2024-12-20 11:33:06', '2024-12-20 11:33:06', NULL, NULL, NULL, NULL),
(1015, 'Bandi Anusha', '9849778387', '$2y$10$3DwMX8TVpfrSRf7sQmYA0OgRqUgv4p2am3CLnw44RAfTDjrGNmOxa', '123456', NULL, 'Secundrabad', '0', 8, 0, '9849778387', '9348963999', '2024-12-20 11:58:44', '2024-12-20 11:58:44', NULL, NULL, NULL, NULL),
(1016, 'Ramesh Tumu', '8889995389', '$2y$10$TWP0oMP1xA/eSZsp9OKiK.rhWzmODamV2qVny2N7GADjDm3dnPRl.', '123456', NULL, 'Kphb', '0', 8, 0, '8889995389', '9348963999', '2024-12-20 12:00:51', '2024-12-20 12:00:51', NULL, NULL, NULL, NULL),
(1017, 'Banishetty lokesh', '9550933397', '$2y$10$.kwMcF0W0xwQmXQan7PKxOhsEaHMjmx.50lgQVdRtEjXpP1xUXFJK', 'lokesh@1234', NULL, 'Kphb', '0', 8, 0, '9550933397', '9348963999', '2024-12-20 12:01:46', '2024-12-20 12:01:46', NULL, NULL, NULL, NULL),
(1018, 'Ramesh', '8977125777', '$2y$10$lWg.2Zndm8qxyzlblIxT4uXlqVufTzHXu5G68AzoDDK7tVBWVeqci', '133456', NULL, 'Suchitra', '0', 8, 0, '8977125777', '9348963999', '2024-12-20 12:04:10', '2024-12-20 12:04:10', NULL, NULL, NULL, NULL),
(1019, 'TAMATAM INDRAJA', '9705159369', '$2y$10$PhIcyPuqQyJDWaMCjH7aKOMUVa/.4NIR4YnQVYgKXmAlR2aLVcUva', '369369', NULL, 'HMT swarnapuri colony', '0', 8, 0, '9705159369', '7869456369', '2024-12-20 12:13:44', '2024-12-20 12:13:44', NULL, NULL, NULL, NULL),
(1020, 'Neelima', '7032676274', '$2y$10$77yBROVuf13oyJpv9wPUfuqtbvq0jfBvDiy0ftzWFzGE95E3nYEdW', 'neelima', NULL, 'Kphb', '0', 8, 0, '7032676274', '7674045621', '2024-12-20 12:23:12', '2024-12-20 12:23:12', NULL, NULL, NULL, NULL),
(1021, 'Ravi prakash goud', '9703032740', '$2y$10$bIOhPsmV0w2R3UlBmNcOnOm/pE77KPqVzZKvSPt1TqeuUN8Ta3r6.', 'ravi@2507', NULL, 'Miyapur', '0', 8, 0, '9703032740', '7869456369', '2024-12-21 02:23:17', '2024-12-21 02:23:17', NULL, NULL, NULL, NULL),
(1022, 'Boya peddaiah', '8555847361', '$2y$10$qpUXDUZxB.nPSAfCgQOGnuXyU7qXukZ1INpvsHSh/fZyCPd9OWlzq', '458082', NULL, 'Nandikotkur', '0', 8, 0, '8555847361', '7869456369', '2024-12-21 04:54:17', '2024-12-21 04:54:17', NULL, NULL, NULL, NULL),
(1023, 'M Anjaneyulu', '9849816712', '$2y$10$cbAaQvpUOo3cyc9GdgeRPu85ZPTW2oCKKWxmCeMnsWbKo/gvbDSL6', '816712', NULL, 'Nandikotkur', '0', 8, 0, '9849816712', '8555847361', '2024-12-21 08:12:58', '2024-12-21 08:12:58', NULL, NULL, NULL, NULL),
(1024, 'M.vankatalingamaiah', '9908625167', '$2y$10$1sA2rFp11MyaIc1pHJRimOwR8VUdf17lq9tQyuDjUSNF3ekZxUwfq', '625167', NULL, 'Nandikotkur', '0', 8, 0, '9908625167', '8555847361', '2024-12-21 08:27:22', '2024-12-21 08:27:22', NULL, NULL, NULL, NULL),
(1025, 'KONIKI VEERANJANEYULU', '9700016888', '$2y$10$fVgtnKXtbh7fMEKVrBeLA.J9Vzgxd0OL1Ge8/Y/mrp4WdWDQJCf2W', '123456', NULL, 'BALAPUR', '0', 8, 0, '9700016888', '7702381784', '2024-12-23 19:28:18', '2024-12-21 13:34:06', NULL, 'HYDERABAD', 'TELANGANA', '500005'),
(1026, 'Akkala Santhosh', '8466964737', '$2y$10$r.HcpX714m5YrqQky6pGmeMVFxh1q9l9uF1FsQ6ouuN/7ah/PDCcm', '369369', NULL, 'Miyapur', '0', 8, 0, '8466964737', '7869456369', '2024-12-22 04:18:29', '2024-12-22 04:18:29', NULL, NULL, NULL, NULL);
INSERT INTO `service_users` (`service_id`, `member_name`, `member_phone`, `password`, `open_password`, `user_profile_pic`, `location`, `cumulative_gross`, `commission_percentage`, `back_two_back_balance`, `referral_id`, `referral_by`, `created_at`, `joined_date`, `address`, `city`, `state`, `pincode`) VALUES
(1027, 'S YASHWANTH', '7036200568', '$2y$10$nRBcra0KltxpTPJ7Hty7VO4pUSQpp7cUrOn9raO.Xav07/i9l6Uj6', '369369', NULL, 'Jogulamba gadwal', '0', 8, 0, '7036200568', '8466964737', '2024-12-22 04:45:43', '2024-12-22 04:45:43', NULL, NULL, NULL, NULL),
(1028, 'Bollu Bharathi', '8121682005', '$2y$10$lJILJ2BuxWSkeiP6tv8vgeVmkvFoXOWiSyoFbY459leXJunbr7XU.', '369369', NULL, 'Hmt swarnapuri colony', '0', 8, 0, '8121682005', '7869456369', '2024-12-22 05:05:12', '2024-12-22 05:05:12', NULL, NULL, NULL, NULL),
(1029, 'G. Somasekhar', '9347523521', '$2y$10$ur1eW048umCKKj07mNTV8.9jrS7xeUI7u2tc2K2mrqviEQsLmrneq', '523522', NULL, 'Nandikotkur', '0', 8, 0, '9347523521', '8555847361', '2024-12-22 09:06:36', '2024-12-22 09:06:36', NULL, NULL, NULL, NULL),
(1030, 'Kumari.vanktesh', '9030869720', '$2y$10$oS3h5WdARA5s17H1KpDfzuLLpRuSXwI7RxMFDl8jZjnojiOeDEWn.', '123456', NULL, 'Miyapur', '0', 8, 0, '9030869720', '9705096369', '2024-12-23 03:37:45', '2024-12-23 03:37:45', NULL, NULL, NULL, NULL),
(1031, 'B.sumithra', '9849785025', '$2y$10$E6Lui7gp5EC67kb6ZVfFFu36EtDcrmYS1M8x5d5xYRyE.qC.l5ucu', '458082', NULL, 'Nandikotkur', '0', 8, 0, '9849785025', '8555847361', '2024-12-23 05:37:05', '2024-12-23 05:37:05', NULL, NULL, NULL, NULL),
(1032, 'k.Raghavendhar', '9492502778', '$2y$10$yCFpcja8yPxZkOG4T4BU2..O.rp8bdYyeiijycg2oODdH13La492O', 'gutskr', NULL, 'HYDERABAD', '0', 8, 0, '9492502778', '8297818858', '2024-12-23 09:24:31', '2024-12-23 09:24:31', NULL, NULL, NULL, NULL),
(1033, 'Nalla Jaya Surya Prasad', '9396526328', '$2y$10$DsueLc/z9deYs913SnHgN.2lc9Maq5ER5Zy7dLPLpxHEQU9lB07AC', 'Prrasad123', NULL, 'Motinagar', '0', 8, 0, '9396526328', '8297818858', '2024-12-23 11:46:47', '2024-12-23 11:46:47', NULL, NULL, NULL, NULL),
(1034, 'Kishore', '9871155421', '$2y$10$S.7Jzu017mWuDjv.Fz9uvegDDv4Ne2G0993lFWIeBcVoXgT6HORtC', 'Skoda@321', NULL, 'hyd', '0', 8, 0, '9871155421', 'admin', '2024-12-26 05:58:42', '2024-12-26 05:58:42', NULL, NULL, NULL, NULL),
(1035, 'N rajya Lakshmi', '8374433725', '$2y$10$4g8HKobDtb7JFiWmG5CXHeX..vfs.N4X5XCz1D9AhevWRezaI0nke', '123456', NULL, 'Kphb', '0', 8, 0, '8374433725', '9348963999', '2024-12-27 11:42:48', '2024-12-27 11:42:48', NULL, NULL, NULL, NULL),
(1036, 'Vijay Bhasker G', '8985801239', '$2y$10$4CzmWo2qlYxWXUmtxnt6TOl45rjhoTqqOmVQCRM0cXzsIOacO6pFa', '@HasiniJul09', NULL, 'Kphb', '0', 8, 0, '8985801239', '9348963999', '2024-12-27 12:47:28', '2024-12-27 12:47:28', NULL, NULL, NULL, NULL),
(1037, 'Sachin', '9821344674', '$2y$10$R715BN0yjU896D4zory.UeQh.K84mqJutNnGVzhk2IRFj8bLKVaHq', 'Veersachin2', NULL, 'Thane', '0', 8, 0, '9821344674', '9347666333', '2024-12-29 10:55:13', '2024-12-29 10:55:13', NULL, NULL, NULL, NULL),
(1038, 'Amrutha', '8519910438', '$2y$10$a4cW96SK6gDTzMC0kFJeW.JjUwRLaKb2tW4GG2blajMWCWBUVS2CC', '7893461270', NULL, 'Hyderabad', '0', 8, 0, '8519910438', '8885586684', '2025-01-09 07:22:02', '2025-01-09 07:22:02', NULL, NULL, NULL, NULL),
(1039, 'Pavan Kalyan', '6305444476', '$2y$10$ueA5aaPXLWFb7qWu1L5ebekm8Lvwipa2oJXrQ0AAgzYeFYLFYqBHe', 'Pooja@12', NULL, 'Pooja@12', '0', 8, 0, '6305444476', '8522881144', '2025-01-09 10:42:57', '2025-01-09 10:42:57', NULL, NULL, NULL, NULL),
(1040, 'Abcdefg', '9988998899', '$2y$10$cRDUJmfxueaCZlioKz5jVOmZ1CaT7PPAoqNsHMfDNOri5VOHtvdXC', 'Password@2k6', NULL, 'Hyderabad', '0', 8, 0, '9988998899', '8522881144', '2025-01-10 13:32:53', '2025-01-10 13:32:53', NULL, NULL, NULL, NULL),
(1041, 'Bhaskar', '8328044104', '$2y$10$XyIOAc.B7YxsOz24JEE37ud05tiDDGN7DbjXEtrn/Fz8g1./H/eyi', 'SACHIN@123', NULL, 'Hyderabad', '0', 8, 0, '8328044104', '8885586684', '2025-01-11 06:19:32', '2025-01-11 06:19:32', NULL, NULL, NULL, NULL),
(1042, 'Mandela vijaya sarveswararao', '9392377377', '$2y$10$T7kuNI8ykZtVR.kKtULZVOFWxNQ2G1G2g216.Cx91G5uybpYn1gDu', '12345678', NULL, 'Chinchinada', '0', 8, 0, '9392377377', '8885586684', '2025-01-11 09:53:28', '2025-01-11 09:53:28', NULL, NULL, NULL, NULL),
(1043, 'RAJESH KUMAR', '9704222960', '$2y$10$6iSNrPH4uEfwo/2Zcr4jt.pPEBWie3WVKnjawzD8c7UfQ/n6xUZ72', 'Sribhanu@123', NULL, 'Hyderbad', '0', 8, 0, '9704222960', '9848285705', '2025-01-11 10:04:11', '2025-01-11 10:04:11', NULL, NULL, NULL, NULL),
(1044, 'shaikh mehtab', '9951871199', '$2y$10$Bb3I7xZqLWHih0NdHG5lZu/22frimta1bzwV1RsFfIGQeVFndJsqO', 'mahir@1234', NULL, 'Hyderabad', '0', 8, 0, '9951871199', '7702381784', '2025-01-13 12:36:42', '2025-01-13 12:36:42', NULL, NULL, NULL, NULL),
(1045, 'G. Madhavi', '9666756055', '$2y$10$/ngsTbNWZzG18B0el4GwcelDGUMOg.EfRPEm1bQiXjTC9ZoudXCQO', '123456', NULL, 'Miyapur', '0', 8, 0, '9666756055', '9948197000', '2025-01-17 08:24:52', '2025-01-17 08:24:52', NULL, NULL, NULL, NULL),
(1046, 'G. Laxmangoud', '8688222258', '$2y$10$/o/Zk9Fc89rr/MQ8rmg5OubF.hs3A.j2pEBMHMTk9iIqArcVwcpo6', '123456', NULL, 'Miyapur', '0', 8, 0, '8688222258', '9948197000', '2025-01-17 08:38:12', '2025-01-17 08:38:12', NULL, NULL, NULL, NULL),
(1047, 'kumar', '9618000414', '$2y$10$eHvXYM.ndWjnmfWZZPFAKurZOIhQgPRFuSsjfQ207woGnE1iGk4NG', '$Vijay360', NULL, 'hyderabad', '0', 8, 0, '9618000414', 'admin', '2025-01-17 12:25:15', '2025-01-17 12:25:15', NULL, NULL, NULL, NULL),
(1048, 'D. Aparna', '8555944438', '$2y$10$bl0CH6d.sZAF93POIXlldOJmAOW0vMf.zJHsV2xdTdedjhrEY3bnm', '123456', NULL, 'H.no. 7-100/9 ,Dammaiguda Ayappa colony', '0', 8, 0, '8555944438', '9948197000', '2025-01-17 13:41:05', '2025-01-17 13:41:05', NULL, NULL, NULL, NULL),
(1049, 'V Praveen Kumar', '9848154567', '$2y$10$hVGOK1ReY2Vz0ikaNkJtaOj1bl9dc0Zm9ukrnre75TEZAJ2XaBn/q', 'vaishu4567', NULL, 'L B Nager', '0', 8, 0, '9848154567', '8297818858', '2025-01-17 17:14:39', '2025-01-17 17:14:39', NULL, NULL, NULL, NULL),
(1050, 'S.k.shaker', '8187822007', '$2y$10$6f8HgLuuItvDlYCppaVBXOaYbNE6tRhw2h.CD87IR/vByiBNaiMUG', '123456', NULL, 'Miyapu', '0', 8, 0, '8187822007', '9948197000', '2025-01-18 05:52:30', '2025-01-18 05:52:30', NULL, NULL, NULL, NULL),
(1051, 'Vivek', '9642114449', '$2y$10$lCVpUr/n/mF5NzYp.zGBzOt5ttIX16BAEDXE6OgKgsBn3SJdDMtTW', '123456', NULL, 'Madhura Nagar', '0', 8, 0, '9642114449', '8522881144', '2025-01-19 07:10:25', '2025-01-19 07:10:25', NULL, NULL, NULL, NULL),
(1052, 'L triveni', '9912535993', '$2y$10$aUhIjzgkhhoSIWNhGpaCxuapq7wDisQE8BkWJ0kb5SqDJvGZvEsM2', '123456', NULL, 'Lb nagar', '0', 8, 0, '9912535993', '9348963999', '2025-01-20 06:49:53', '2025-01-20 06:49:53', NULL, NULL, NULL, NULL),
(1053, 'Hamed basha', '9949148142', '$2y$10$182Jq2s2VmG7bgZA.kROaub9rhjE92QwigAQ3o7C/eyvGnf8oCaAW', '458082', NULL, 'Nandikotkur', '0', 8, 0, '9949148142', '8555847361', '2025-01-20 07:07:59', '2025-01-20 07:07:59', NULL, NULL, NULL, NULL),
(1054, 'Vidya', '9775547999', '$2y$10$wjsaJDhrFhLwgAEWWPfVke/o7HyamdG54D1hTJ5M.ETB2Rzf/iHjC', 'vidyasree@12', NULL, 'Ananya Residency nizampet', '0', 8, 0, '9775547999', 'admin', '2025-01-24 17:28:40', '2025-01-24 17:28:40', NULL, NULL, NULL, NULL),
(1055, 'Srikanth', '9133433452', '$2y$10$tuMpkJ6RaaHPGmN96gdKneo7LCIXAc1Kf2TuEvuWNX1FdloFWIDeq', 'naturalfreshfood501', NULL, 'Nizamabad', '0', 8, 0, '9133433452', 'admin', '2025-01-25 07:24:20', '2025-01-25 07:24:20', NULL, NULL, NULL, NULL),
(1056, 'Srinivasa', '9246895248', '$2y$10$JxWNYT76m0hm.ohxJQ8bZ.bz1aiFrid8mMpddBLCUncbYTQH5uYyq', 'srinivasa@9246895248', NULL, 'Hanumakonda', '0', 8, 0, '9246895248', '8522881144', '2025-01-25 07:26:44', '2025-01-25 07:26:44', NULL, NULL, NULL, NULL),
(1057, 'M.Gnanendra goud', '8074220198', '$2y$10$oZRwLLqN1LQS3z9/n.fzguYS.2gDxcnBPiWRUUegUDHnlHZg5hqdG', '990862', NULL, 'Mayapur', '0', 8, 0, '8074220198', '9705096369', '2025-01-26 04:07:01', '2025-01-26 04:07:01', NULL, NULL, NULL, NULL),
(1058, 'pAGIDIMUNTALA MURALI', '9398373645', '$2y$10$ydhPJK18jrLiQI9JT6xV9eezqFOEKukv0L5SkkuEbBi/jwTDZ8ksq', '9398373645', NULL, 'SIDDIPET', '0', 8, 0, '9398373645', 'admin', '2025-01-26 15:17:49', '2025-01-26 15:17:49', NULL, NULL, NULL, NULL),
(1059, 'Syed Ziya Uddin', '7075819555', '$2y$10$H1hIlntf39HNSPXoRUigE.zYQyS6RALlWa0ggYV3Ce6esDaLTQa16', 'MeriMaa143', NULL, 'Hyderabad', '0', 8, 0, '7075819555', 'admin', '2025-01-27 05:30:54', '2025-01-27 05:30:54', NULL, NULL, NULL, NULL),
(1060, 'Chandragiri Somaraju', '9849226474', '$2y$10$cWlCAF0yj3nCn9aigzQRxO75eHjtz1jSEZL3inwwD2Ha/VTk1UezC', 'somaraju2020', NULL, 'Jangaon', '0', 8, 0, '9849226474', '8522881144', '2025-01-27 13:34:31', '2025-01-27 13:34:31', NULL, NULL, NULL, NULL),
(1061, 'MOHAMMED ABDUL ALI', '7793923796', '$2y$10$IQY6A.xi8DJn2Qj3q0iJr.VXIFlRQ3GFGgab1Jd2NSQ0mHKg2ch9C', 'Anas@1234', NULL, 'Hyderabad', '0', 8, 0, '7793923796', '7382961519', '2025-01-27 15:00:17', '2025-01-27 15:00:17', NULL, NULL, NULL, NULL),
(1062, 'Farheen Sultana', '9885200903', '$2y$10$KOpIFSaTai1staapXKaq2O5BrM0HjHV5XauCDjH4tpm9MTssFVhrm', 'Nazeer8495$', NULL, 'Hyderabad', '0', 8, 0, '9885200903', '7793923796', '2025-01-27 15:15:16', '2025-01-27 15:15:16', NULL, NULL, NULL, NULL),
(1063, 'R SHANKER', '9948308293', '$2y$10$k1K8sBwqHE2zHhpCbeD7ROcw5nBALCuOC2BekU8KYNGKsNN5BNSBW', '123456', NULL, 'Miyapur', '0', 8, 0, '9948308293', '9948197000', '2025-01-28 05:22:53', '2025-01-28 05:22:53', NULL, NULL, NULL, NULL),
(1064, 'P.yadhagiri', '9866440795', '$2y$10$iP58ex2Pv8xOvLxpZEc0leTIQZdAGeXw7XjUY44ZnzAbmghLuXW9G', '123456', NULL, 'Miyapur', '0', 8, 0, '9866440795', '9948197000', '2025-01-28 05:31:44', '2025-01-28 05:31:44', NULL, NULL, NULL, NULL),
(1065, 'G Santosh Kumar', '8500890849', '$2y$10$Zo7cT520TbBzJAavj97yCe7ixYsa646cTWUI41cQlPDmRD9IBqeZO', '123456', NULL, 'Hyderabad', '0', 8, 0, '8500890849', '9885200903', '2025-01-28 14:28:14', '2025-01-28 14:28:14', NULL, NULL, NULL, NULL),
(1066, 'Kiran kanth ragolu', '7541972348', '$2y$10$za68T93ZScWM4weZunyEXuJdHuOCWZaWWdLbp3PUFiP/I9PPLrdq6', 'Kiran@11259', NULL, 'Hyderabad', '0', 8, 0, '7541972348', '7869456369', '2025-01-29 13:45:16', '2025-01-29 13:45:16', NULL, NULL, NULL, NULL),
(1067, 'Vijay Kumar', '6303829201', '$2y$10$nrmtlbjwwfWJW5.5xf5.peiIbD88xI06Te1EwzNlYPeo2qCOxZ.eu', '123456', NULL, 'Ngri', '0', 8, 0, '6303829201', '9348963999', '2025-01-30 05:04:12', '2025-01-30 05:04:12', NULL, NULL, NULL, NULL),
(1068, 'Vijitha Rani Karanapu', '9989123110', '$2y$10$5PEyPfmAknVGLEeibUQLEeeBQ/OLrx/IYuArgUUX2UWK6rVi1kiL.', '9989123110', NULL, 'Hyderabad', '0', 8, 0, '9989123110', '9700016888', '2025-01-31 10:02:54', '2025-01-31 10:02:54', NULL, NULL, NULL, NULL),
(1069, 'MOGILI VIJAYABABU', '9247460330', '$2y$10$C.mentVk1Q9h4nwAVJ2/vOBoQ/ky.fc3NLfmH7u68fr1eQWMJsInC', '123456', NULL, 'THIRUPATHI', '0', 8, 0, '9247460330', '7702381784', '2025-01-31 10:15:10', '2025-01-31 10:15:10', NULL, NULL, NULL, NULL),
(1070, 'Vamsi', '7675009433', '$2y$10$GP1acZz7SS2HZRZnitIOduLktal3lT5RIQtZNai/GdaoEEUDW8GKe', 'Vamsi_1988', NULL, 'Hyderabad', '0', 8, 0, '7675009433', 'admin', '2025-01-31 13:57:12', '2025-01-31 13:57:12', NULL, NULL, NULL, NULL),
(1071, 'TONANGI SRINIVASA RAO', '7032018461', '$2y$10$mlhZ.78JQ.0iFftJNuWdLO6VTJHFZZbj2QNQq9FMBVljX6m3gFsHq', 'TSR1981', NULL, 'TANUKU', '0', 8, 0, '7032018461', '7702381784', '2025-02-01 07:08:43', '2025-02-01 07:08:43', NULL, NULL, NULL, NULL),
(1072, 'Abhinay', '8639026517', '$2y$10$KV0vtha6HLwI0kZGlmAeNeyWWwTarvGVZYzOacr7QK9uApQd2oZqC', 'Addmag@9049', NULL, 'Hyderabad', '0', 8, 0, '8639026517', 'admin', '2025-02-01 17:34:14', '2025-02-01 17:34:14', NULL, NULL, NULL, NULL),
(1073, 'MVV & LNS CONSTRUCTIONS', '8500263947', '$2y$10$KoXC1naLoNebXICxTKz7Iu/bUAPP2pAlm3XsCXsFz0NYQYApkN7/C', 'lOVE@1TIME', NULL, 'tIRUPATI', '0', 8, 0, '8500263947', '9347666333', '2025-02-02 11:38:04', '2025-02-02 11:38:04', NULL, NULL, NULL, NULL),
(1074, 'Durga Avinash', '9160352751', '$2y$10$8lhW2N1Xt/CgmHX799VTfO5rbCFw9Ml2xXnWjy0AgDEeSlQyMWcQi', 'Lucky4u.', NULL, 'hyderabad', '0', 8, 0, '9160352751', 'admin', '2025-02-03 05:07:16', '2025-02-03 05:07:16', NULL, NULL, NULL, NULL),
(1075, 'Kaveli govardhan', '9493798991', '$2y$10$VOTmts2.KcnS45DtgzzesOwVNzdddOrb7EwvNTLqWoHGsd13h33jW', '9493798991', NULL, 'Abmbetkar satu', '0', 8, 0, '9493798991', '7702381784', '2025-02-03 05:35:44', '2025-02-03 05:35:44', NULL, NULL, NULL, NULL),
(1076, 'Rajkumar R', '6302828100', '$2y$10$lPHYclThlka2v1mOcjQzhuKMRooq3nThQKYBny7DNAUqACW/zTRPS', '12345@23', NULL, 'Jangaon', '0', 8, 0, '6302828100', '7702381784', '2025-02-03 06:46:06', '2025-02-03 06:46:06', NULL, NULL, NULL, NULL),
(1077, 'Bosi Narasimha Yadav', '9019971852', '$2y$10$PO4oIJEcTlwm/lbxoEGLAOVs0qoQvibgqd03bFY8j5/kO783pu1vS', 'Nandha@1947', NULL, 'Venkatagiri,  Tirupati', '0', 8, 0, '9019971852', '7702381784', '2025-02-03 09:17:11', '2025-02-03 09:17:11', NULL, NULL, NULL, NULL),
(1078, 'Sunitha', '7601024088', '$2y$10$qVhuJCr3YR3YN600ftFTD.0JWfVEqzRld1lr1ghHzp4WCF4Gnbcoe', 'Sweety@8008', NULL, 'Sweety@8008', '0', 8, 0, '7601024088', '9700016888', '2025-02-03 11:53:43', '2025-02-03 11:53:43', NULL, NULL, NULL, NULL),
(1079, 'Mohammad Rafi', '6281882582', '$2y$10$rpTkBlFZGImopPUeALOR3.0WXpSArphRKhQ7Spe/qKG/VHFgIKUYa', 'rafiknr12345@', NULL, 'Karimnagar', '0', 8, 0, '6281882582', '9700016888', '2025-02-03 12:02:36', '2025-02-03 12:02:36', NULL, NULL, NULL, NULL),
(1080, 'Nikitha', '7680034625', '$2y$10$OhUnAVNkHLqeOPQNDVk7z.4zmH8rYiyHn2Ig9qJZkft6p1fFcsVdC', 'getlost', NULL, 'Karmikanagar,Yousufguda,hyd', '0', 8, 0, '7680034625', '9700016888', '2025-02-03 12:28:41', '2025-02-03 12:28:41', NULL, NULL, NULL, NULL),
(1081, 'Buduga shirisha', '9381023341', '$2y$10$l9Z2gQZsTKhX1PQhmNrc0uV8dFiaRG0wIEvJlISMeocLCwL9rJYj2', 'siriyadav23341', NULL, 'Lingampally', '0', 8, 0, '9381023341', '9700016888', '2025-02-03 12:29:06', '2025-02-03 12:29:06', NULL, NULL, NULL, NULL),
(1082, 'Kokki shailaja', '8639483804', '$2y$10$ZQ6XpIkeB5E87WKhcJRX9.Jn15rJZ9kSKalVL1h3zU.SllgjxaGW2', 'Shailu@2000', NULL, 'Hyderabad', '0', 8, 0, '8639483804', '9700016888', '2025-02-03 12:29:11', '2025-02-03 12:29:11', NULL, NULL, NULL, NULL),
(1083, 'Gowthami', '7675982190', '$2y$10$3MekqBc7meejpfLIy.B3seClF0iANtsS0FWqH7u8E11iBhRcYNRMy', 'Reddy@012', NULL, 'Madhapur', '0', 8, 0, '7675982190', '9700016888', '2025-02-03 12:29:20', '2025-02-03 12:29:20', NULL, NULL, NULL, NULL),
(1084, 'N. Satya', '7780597056', '$2y$10$4mivvmY6bhPShHsy0eg5ju0Z7YcPinQD1C15PjAUS//lHPbODKiOe', 'satya 7780', NULL, 'Madhapur', '0', 8, 0, '7780597056', '9700016888', '2025-02-03 12:29:21', '2025-02-03 12:29:21', NULL, NULL, NULL, NULL),
(1085, 'T.Shireesha', '7702352347', '$2y$10$JkDSb1BveL1FapzsGMqC6uMjFwKKSYuNfFjNpHclNzZ93nV53X9cy', '717171', NULL, 'Madhapur', '0', 8, 0, '7702352347', '9700016888', '2025-02-03 12:29:27', '2025-02-03 12:29:27', NULL, NULL, NULL, NULL),
(1086, 'B.Kumari', '8886076180', '$2y$10$pony4HK57dcDlQ3mFzNyvusUM0Wwxq8v2ZM6lQevFGd9ZsUB86yTW', '008474', NULL, 'Boraband', '0', 8, 0, '8886076180', '9700016888', '2025-02-03 12:29:31', '2025-02-03 12:29:31', NULL, NULL, NULL, NULL),
(1087, 'Gopi nadh', '6303721369', '$2y$10$n84yJDysnyaEs/qM4KMcu.pefeQjtAm9JVOFDXJGHmx9nBZAA5ema', '12345Gopi', NULL, 'Huzurnagar, Suryapet, Telangana, IND', '0', 8, 0, '6303721369', '9700016888', '2025-02-03 12:30:00', '2025-02-03 12:30:00', NULL, NULL, NULL, NULL),
(1088, 'GANUGAPETA  SHARADA', '8332821881', '$2y$10$qg3g6DE/qL45YnuyT.SG2eYwvfcNSvbZGp.12s3LeevgvUwKIcTbC', '123456', NULL, 'HYDERABAD', '13000', 8, 13000, '8332821881', '9348963999', '2025-05-13 03:37:40', '2025-02-04 10:49:36', 'DOOR NO 187/B .FIRST PHASE AIWYN COLONY , KUKATPALY', 'DIST MEDCHAL', 'Telangana', '500072'),
(1089, 'Vadde Sudha Rani', '9293948110', '$2y$10$QiowPQx7ccWplrkr5qgKou1on/Tuc.uYdeYqJtE94O3R.Sc/3d2te', '123456', NULL, 'Hyderabad', '0', 8, 0, '9293948110', '8332821881', '2025-02-04 11:39:05', '2025-02-04 11:39:05', NULL, NULL, NULL, NULL),
(1090, 'suresh', '7428730894', '$2y$10$0dcigZZZt9F3Si0ZF5TmA.zE8o0llgAxdeiYcLUJHRIOfCGwCX2Lq', 'Suresh123', NULL, 'hyderabad', '0', 8, 0, '7428730894', 'admin', '2025-02-05 09:43:08', '2025-02-05 09:43:08', NULL, NULL, NULL, NULL),
(1091, 'sruthi', '7428730892', '$2y$10$7VmfKgMsn/ufFAgeEKmLUeeTxE9Q7uXGWHgaxRarROHCnrLn2F0mW', 'Sruthi26', NULL, 'hyd', '0', 8, 0, '7428730892', 'admin', '2025-02-05 10:12:38', '2025-02-05 10:12:38', NULL, NULL, NULL, NULL),
(1092, 'sruthi', '6304132609', '$2y$10$pmcIWlM5nq1VNvH8x78OAes6egeb.PRFEOdqUQAb7tM3LJ4Wp/uqm', 'Sruthi26', NULL, 'Hyd', '0', 8, 0, '6304132609', 'admin', '2025-02-05 10:13:35', '2025-02-05 10:13:35', NULL, NULL, NULL, NULL),
(1093, 'sruthi', '6304132612', '$2y$10$3tjyme6aKW9pUx6Spmr8wuxwZjNqYkENHpgW3tGKZbNZz9gTIRWGm', 'Sruthi26', NULL, 'Hyd', '0', 8, 0, '6304132612', 'admin', '2025-02-05 10:14:32', '2025-02-05 10:14:32', NULL, NULL, NULL, NULL),
(1094, 'mahesh', '7428723247', '$2y$10$g9XAudU3yt3qevqOV9BywukhaPgl.XMGW5kMDUFHXR73124FAWSSS', 'mahesh123', NULL, 'hyderabad', '0', 8, 0, '7428723247', 'admin', '2025-02-05 13:57:29', '2025-02-05 13:57:29', NULL, NULL, NULL, NULL),
(1095, 'Sreedhar k', '9948352341', '$2y$10$WMER1Nv5M5kqRKFEX8EBkeqkDQww9.ika4TLWKyZzail8PSFmclmy', 'sreedhar12', NULL, 'Hyderabad', '0', 8, 0, '9948352341', 'admin', '2025-02-06 09:25:45', '2025-02-06 09:25:45', NULL, NULL, NULL, NULL),
(1096, 'Shirisha', '7207894221', '$2y$10$5.7D25.iGq0HHxsnzeyFxuyzxd4P0sH0vFmEWCvjp1572weNeL8VS', '7207894221', NULL, 'Uppal, Hyderabad', '0', 8, 0, '7207894221', '8522881144', '2025-02-06 09:51:56', '2025-02-06 09:51:56', NULL, NULL, NULL, NULL),
(1097, 'Krithika.arutla', '9390122872', '$2y$10$jTKqmjvfLAWrIpKLsmFzBe5tzrQBli3TOfhrUTBAmME.gPyXF1viS', 'bappalysm', NULL, 'RTC xroads, Musheerabad, Hyderabad', '0', 8, 0, '9390122872', '8522881144', '2025-02-06 10:25:38', '2025-02-06 10:25:38', NULL, NULL, NULL, NULL),
(1098, 'Shweta', '8544659770', '$2y$10$PhmzSMLDjZlpeioVbc1oz.JqPToF8CaXq.UTuUNzj23xPKogfuxny', 'shwetaravi1234', NULL, 'New Delhi', '0', 8, 0, '8544659770', '8522881144', '2025-02-06 10:34:39', '2025-02-06 10:34:39', NULL, NULL, NULL, NULL),
(1099, 'MVN.TULASIRAO', '9292251577', '$2y$10$UnTB00vGn51nCZZtA/k.Ou.6/eEc.amknSCCul6slW4ehfIyjNdx.', '1469', NULL, 'Narasaraopet', '0', 8, 0, '9292251577', '7702381784', '2025-02-06 10:57:26', '2025-02-06 10:57:26', NULL, NULL, NULL, NULL),
(1100, 'Kavithasrinivas konkata', '7396977665', '$2y$10$eSjkGSyF2PaJP9s7IQEVnuLcRDD2URBIUtFnI5a0JVoTDjS8RQkeC', '7396977665', NULL, 'Vanasthlipuram', '0', 8, 0, '7396977665', '8309735119', '2025-02-07 07:54:29', '2025-02-07 07:54:29', NULL, NULL, NULL, NULL),
(1101, 'Rishu', '7093709685', '$2y$10$oLKctYQ2JM7SOYgp6bRXt.qN/cWcW9zjJpdj4bmiPXXv.yI13/dKO', 'anusree345', NULL, 'Kukatpally', '0', 8, 0, '7093709685', '9963613189', '2025-02-07 11:03:07', '2025-02-07 11:03:07', NULL, NULL, NULL, NULL),
(1102, 'Bodappa.', '9021215845', '$2y$10$MO7/jV.xk1z54dBX7qaZtOvlZiT.gf1QyOwxAmaVFhnPbK4gC4vpm', '123456', NULL, 'Miyapur', '0', 8, 0, '9021215845', '9948197000', '2025-02-07 11:43:26', '2025-02-07 11:43:26', NULL, NULL, NULL, NULL),
(1103, 'Ayesha', '8143537582', '$2y$10$0fRrVneaC62MnUTLc8ycne09Pj1r9HN.GeeT2zIWAlObMIQICWjBi', '9989688', NULL, 'Shaikpet Hyderabad', '0', 8, 0, '8143537582', '8522881144', '2025-02-07 14:02:28', '2025-02-07 14:02:28', NULL, NULL, NULL, NULL),
(1104, 'Shivakumar', '9966777006', '$2y$10$Q1rCt5GzVkMXkFrixNBfXO93cG75jiTvtGpv5cbCKZmaWipbdsLGC', 'shiva@777', NULL, 'Hyderabad', '0', 8, 0, '9966777006', 'admin', '2025-02-08 06:07:35', '2025-02-08 06:07:35', NULL, NULL, NULL, NULL),
(1105, 'Naresh kumar Gamidi', '9398185779', '$2y$10$Ok1VcfqMoNR7ulg4MppfauAD314XunLjLmFa1wpdfmd/9.nx.FI2O', 'mokshith143G@', NULL, 'Hyderabad', '0', 8, 0, '9398185779', '7702381784', '2025-02-08 08:57:47', '2025-02-08 08:57:47', NULL, NULL, NULL, NULL),
(1106, 'Shiva', '9701767717', '$2y$10$3h3WQBdQMMpbiRc/RvnUz.ExQiCk1ReGKLDvQDgLzFr5PQOOzdK1i', 'kpd1985', NULL, 'Hyderabad', '0', 8, 0, '9701767717', 'admin', '2025-02-08 12:45:11', '2025-02-08 12:45:11', NULL, NULL, NULL, NULL),
(1107, 'Vegireddi ganesh', '9908045792', '$2y$10$nFoCFEslYiTPllA6eUXQAOdV/hLLobJLgOVIYYTLu4mpT.l/jS5/S', '258077', NULL, 'Hydarabaad', '0', 8, 0, '9908045792', '8522881144', '2025-02-08 14:50:29', '2025-02-08 14:50:29', NULL, NULL, NULL, NULL),
(1108, 'Shiva Abhinay', '9676666260', '$2y$10$mg/eH3Goky4ldryv4z6oouYT/ePgm0eqMKLPs5SzINEezTZ5pqdSi', 'Shiv@b1993', NULL, 'Hyderabad', '0', 8, 0, '9676666260', 'admin', '2025-02-08 15:10:08', '2025-02-08 15:10:08', NULL, NULL, NULL, NULL),
(1109, 'Raveendra', '9989356699', '$2y$10$5DOIxkOGtGmJOfMSrA1jVuy5nH84yyZTAxY/D2tBseaLqC3z0MjHe', 'Welcome123#', NULL, 'Hyderabad', '0', 8, 0, '9989356699', '7702381784', '2025-02-10 12:48:55', '2025-02-10 12:48:55', NULL, NULL, NULL, NULL),
(1110, 'ENDHRALA NARENDER', '8801231457', '$2y$10$TnMbzl6aTox.GBYhu5mbNeqOrMD3wRNRROEppDtW77dp6v11ZUq/6', '4597643', NULL, 'NAMPALLY HYDERABAD', '0', 8, 0, '8801231457', 'admin', '2025-02-10 15:00:01', '2025-02-10 15:00:01', NULL, NULL, NULL, NULL),
(1111, 'Chakrapani', '9985032005', '$2y$10$XFy4G.tmolQdAvP3XWTfYOyycc8FJBfqod0.wuHrtxc0Qxn4ahhuK', '223Chakri', NULL, 'Hyderabad', '0', 8, 0, '9985032005', 'admin', '2025-02-11 06:28:29', '2025-02-11 06:28:29', NULL, NULL, NULL, NULL),
(1112, 'Swetha', '7680862032', '$2y$10$539OYvuq8RaFpf0peJlrD.9k54Gg11rLDQ7Z2xnpDPSULh4nPxqp6', 'Dr Swetha@#2003', NULL, 'Kukatpally', '0', 8, 0, '7680862032', '8522881144', '2025-02-11 08:06:14', '2025-02-11 08:06:14', NULL, NULL, NULL, NULL),
(1113, 'జ్యోతి ప్రకాష్ శ్రీపాద', '8500991250', '$2y$10$fitln9VaFqTWVh/H1EqRVOYKzyRLm7jsNwzsaXn8z/3dcifCLRrHu', 'prakash52', NULL, 'బండ్లగూడ, నాగోల్, హైదరాబాద్ 50006', '0', 8, 0, '8500991250', '7702381784', '2025-02-11 10:11:10', '2025-02-11 10:11:10', NULL, NULL, NULL, NULL),
(1114, 'Arun Kumar', '9985945428', '$2y$10$CESeabx/7jLCD1DeO9bgJetJq8/hJSG7mVEHYnIwb5t8dQegfXed.', 'Arun@4789', NULL, 'Hyderabad', '0', 8, 0, '9985945428', '7416946599', '2025-02-12 07:39:00', '2025-02-12 07:39:00', NULL, NULL, NULL, NULL),
(1115, 'Prakash Allam', '7013826979', '$2y$10$rTpCk2ewNXXpZf.sbbTAROGgzNM6iAxAe6R.xkOSA7NB7dizXqyBW', '7013826979', NULL, 'Kamareddy', '0', 8, 0, '7013826979', '7416946599', '2025-02-12 07:50:29', '2025-02-12 07:50:29', NULL, NULL, NULL, NULL),
(1116, 'Korimelli ravi kumar', '8019474758', '$2y$10$ppbB55oHl6LAIn4kNwAjhuAq/EiFWbPOI/bTv92Hx8xpZC3FiP5Oe', 'monalisa1006', NULL, 'Ramakrishnapur mancherial', '0', 8, 0, '8019474758', '7416946599', '2025-02-12 08:49:03', '2025-02-12 08:49:03', NULL, NULL, NULL, NULL),
(1117, 'Prasanna Kumar', '8885051788', '$2y$10$DsDo7/aV/G6zW/6vyZMWGuHsxie.EfpmJgFWvADNhFlIFQM8.Ddcy', 'Lashyd@555', NULL, 'Nizampet', '0', 8, 0, '8885051788', '8522881144', '2025-02-13 09:37:28', '2025-02-13 09:37:28', NULL, NULL, NULL, NULL),
(1118, 'Amulya Jena', '7330803116', '$2y$10$n1JnADAdEDAJPsXTD9Oz9.HZQ770L0bA3JSY3f7uHlh0B32ApKb6y', 'Amulya@2k25', NULL, 'Visakhapatnam', '0', 8, 0, '7330803116', 'admin', '2025-02-14 06:33:59', '2025-02-14 06:33:59', NULL, NULL, NULL, NULL),
(1119, 'Shree', '7984771123', '$2y$10$GmpcxPpIiP21qSPPJLkik.guJNCMPWZX6pchxVfCiIdjQrT.bvrNi', 'harsh122', NULL, 'Ahmedabad', '0', 8, 0, '7984771123', '7702381784', '2025-02-14 08:50:45', '2025-02-14 08:50:45', NULL, NULL, NULL, NULL),
(1120, 'Mohammed Nayeem Pasha', '9032320614', '$2y$10$H0z5fXXB1wLbwpINVHdR8OY2lKQBXeyptLKfldS.3d1RHkLP7qSPS', '7869', NULL, 'NARSAMPET', '0', 8, 0, '9032320614', '7702381784', '2025-02-16 08:15:22', '2025-02-16 08:15:22', NULL, NULL, NULL, NULL),
(1121, 'K Suresh', '8074562351', '$2y$10$vtvwSN8FodUBSmhdefLAYu04yBJwy3qj5z1ccX4Ica.xGp9nFHpXW', 'Suresh@123', NULL, 'Hyderabad', '0', 8, 0, '8074562351', '8121341415', '2025-02-17 07:56:52', '2025-02-17 07:56:52', NULL, NULL, NULL, NULL),
(1122, 'Sai Kumar chary', '7013931323', '$2y$10$vzSXk/8FqDMQL/Z8jI3pm.pBXILu1UkankAClqVMCwZsdskUlbGUC', 'sai143', NULL, 'Shapur nagar', '0', 8, 0, '7013931323', '8121341415', '2025-02-17 08:11:10', '2025-02-17 08:11:10', NULL, NULL, NULL, NULL),
(1123, 'G nagaraju', '9391037514', '$2y$10$VRyvVTI5oDK7cK/DN07kuO25R9fQ/hh2gs92j/XCAaGXRa9OBH1H2', 'kingnag12', NULL, 'Ameerpet', '0', 8, 0, '9391037514', '8121341415', '2025-02-17 08:56:56', '2025-02-17 08:56:56', NULL, NULL, NULL, NULL),
(1124, 'DASARI SHRUTHI', '8179395337', '$2y$10$5TtDMT3PpuoiV00yRGWez.PP9e8A65ItRVCQGDIDhvRG/offBm7RS', 'shruthisadhi', NULL, 'Ameerpet', '0', 8, 0, '8179395337', '9391037514', '2025-02-17 09:26:02', '2025-02-17 09:26:02', NULL, NULL, NULL, NULL),
(1125, 'MALAKONDAREDDY', '7013336778', '$2y$10$QT6p38xn8C990WaD2li0OeFikJK/w/GabbPcrdaNJm4BBERJI1V3e', '123456', NULL, 'Vanastalipuram', '0', 8, 0, '7013336778', 'admin', '2025-02-17 12:55:57', '2025-02-17 12:55:57', NULL, NULL, NULL, NULL),
(1126, 'Venky', '7659839086', '$2y$10$uUequxdg7YErHrXYuVwtwOuaGvcOGqaKS9POIepmj8SlA.dq8m9by', '2525', NULL, 'Tholukodu', '0', 8, 0, '7659839086', 'admin', '2025-02-17 13:34:02', '2025-02-17 13:34:02', NULL, NULL, NULL, NULL),
(1127, 'V S RAGHAVA', '9912854922', '$2y$10$o6VFZb0YoUe3Z7KOGQRcCucoXpdtx0Zoney0w7ZwVU0Yt.Lmph0/q', 'Addmag4me!', NULL, 'Hyderabad', '0', 8, 0, '9912854922', '7702381784', '2025-02-17 13:49:57', '2025-02-17 13:49:57', NULL, NULL, NULL, NULL),
(1128, 'VARUKOLU RAMESH', '8885089991', '$2y$10$.GAc.I7K9raO0KTl6VSoOe8GfZdd1x5B1stKbt0N.0Uyr4.wANSNq', '123456', NULL, '123456', '0', 8, 0, '8885089991', '7702381784', '2025-02-17 15:46:43', '2025-02-17 15:46:43', NULL, NULL, NULL, NULL),
(1129, 'Ch swarna deepa', '9133677517', '$2y$10$bxNuskwJkQ9PRXutMo.bvu7buC6fQVaI115b5o0DdsjKt98tUS4IC', '55555', NULL, 'Sarapaka', '0', 8, 0, '9133677517', '7702381784', '2025-02-17 16:31:17', '2025-02-17 16:31:17', NULL, NULL, NULL, NULL),
(1130, 'D. S. R. Prasad', '7207876621', '$2y$10$H/SihmdEIVBNqcydyGoT2e5m9.7.Lyk1jUUk1CVWDQmSfJjilv3Em', 'Prasad@21', NULL, 'Andhrapradesh', '0', 8, 0, '7207876621', 'admin', '2025-02-17 16:43:22', '2025-02-17 16:43:22', NULL, NULL, NULL, NULL),
(1131, 'Shiva Reddy', '9167610788', '$2y$10$T4fgwgH8kTHz/9rNfUbMd.3y27XixLwtJoO4JQLWstmDux656XPh.', 'spr@123', NULL, 'Flat 312, sanvi Sri abode apartment, bachupalli , opposite Krishna reddy complex', '0', 8, 0, '9167610788', '7702381784', '2025-02-17 17:13:48', '2025-02-17 17:13:48', NULL, NULL, NULL, NULL),
(1132, 'Chinni maheshwari', '8143710037', '$2y$10$b5J7w6Dd6EW8sMtUgMwhq.i0j.ubPMDCpIZvih96O6ZMZvS9axMQ6', 'chinni123', NULL, 'Road no 02 banjarahills', '0', 8, 0, '8143710037', '8522881144', '2025-02-18 06:02:29', '2025-02-18 06:02:29', NULL, NULL, NULL, NULL),
(1133, 'వెంకటేశ్వరరావు దాసరి', '9676181485', '$2y$10$oS/dZYH7o71SfiUR7I8HpukDE2vUcSaKWCP.OpiP4Sxipl1K/tBne', 'dasarivenkat', NULL, 'Sri Lakshmi towers 2ndfloor moghal raj puram kilaru bucchibabu street', '0', 8, 0, '9676181485', '7702381784', '2025-02-18 07:41:19', '2025-02-18 07:41:19', NULL, NULL, NULL, NULL),
(1134, 'Veeru V', '9398835837', '$2y$10$u0dkwNymwr99yiqAopdvseD6JvHthxZX8FDryRayLDDlecy/2QSZS', 'Veeru@2029', NULL, 'hyd', '0', 8, 0, '9398835837', 'admin', '2025-02-18 08:28:02', '2025-02-18 08:28:02', NULL, NULL, NULL, NULL),
(1135, 'Satyam', '9010034448', '$2y$10$n3OmjfOXXdNDqcrda3j6luBzSw/H1eB.b.qtae3.1hggNIBZiRPkq', 'Satyam@123', NULL, 'Hyderabad', '0', 8, 0, '9010034448', '7702381784', '2025-02-18 09:30:41', '2025-02-18 09:30:41', NULL, NULL, NULL, NULL),
(1136, 'GANTE SUMAN', '7036109541', '$2y$10$ljDSllji1AJYqwtT045TWe2o8lv9IN3CbkEFwiLbfx2.wDNndvZ6K', '991256', NULL, 'Kazipet', '0', 8, 0, '7036109541', '7702381784', '2025-02-18 09:36:57', '2025-02-18 09:36:57', NULL, NULL, NULL, NULL),
(1137, 'GANTE SUMAN', '9912564993', '$2y$10$RYJJhQG.Z0BsvUarYXiNHu9.GQMded.Gwvx72y2/Ib8M.yhV608Pa', '991256', NULL, 'Kazipet', '0', 8, 0, '9912564993', '7702381784', '2025-02-18 09:53:22', '2025-02-18 09:53:22', NULL, NULL, NULL, NULL),
(1138, '9948180377', '9948180377', '$2y$10$vOH/jRpQFjO4m.F7ngaUPetY1lUS6IAEjsJ39Ei8AVBfl79G/Pr/a', '996633', NULL, '996633', '0', 8, 0, '9948180377', '7702381784', '2025-02-22 15:49:04', '2025-02-18 10:22:45', '6-14raghavapur', 'Siddipet', 'TELANGANA', '502107'),
(1139, 'Adla srinivas', '9849439482', '$2y$10$Wqx4DuYR0u.Xb8M0wyUtkeBd7AYPvHeDBmz1cswUU8IChhVveRAxm', '984943', NULL, 'Ghanpur stn', '0', 8, 0, '9849439482', '7702381784', '2025-02-18 14:24:34', '2025-02-18 14:24:34', NULL, NULL, NULL, NULL),
(1140, 'M.SUMANTH', '9849258618', '$2y$10$yfMjuJxerIiAiFewqZW5l.sGL8QIKBLRg6oYtNMzwPheqWYCdhJpW', 'sumanth123', NULL, 'Hyderabad', '0', 8, 0, '9849258618', '7702381784', '2025-02-18 14:39:05', '2025-02-18 14:39:05', NULL, NULL, NULL, NULL),
(1141, 'Jagapathibabu', '8978760670', '$2y$10$fJcpY.uOxcO32i7rKCOax.TBfqj3qxCZSJif6XiluM64yVFKdAhzK', '123456', NULL, 'Khammam', '0', 8, 0, '8978760670', '7702381784', '2025-02-18 16:34:24', '2025-02-18 16:34:24', NULL, NULL, NULL, NULL),
(1142, 'Harini', '6305333269', '$2y$10$hNfEDXrvZ6tWpU6VlDBaMONzi7fF8M/tjxRpcNMp0mYYryGreVa3K', '123456', NULL, 'Mulugu', '0', 8, 0, '6305333269', '8978760670', '2025-02-18 16:40:23', '2025-02-18 16:40:23', NULL, NULL, NULL, NULL),
(1143, 'Pakki gopinadh', '8179797908', '$2y$10$kwnlWYg0SP8A.Q1Tud0.E.bwg7I6EInf6rpUd61SoRWDj9ga0FinO', 'gopi7978', NULL, 'Tagarapuvalasa', '0', 8, 0, '8179797908', 'admin', '2025-02-18 17:10:00', '2025-02-18 17:10:00', NULL, NULL, NULL, NULL),
(1144, 'Pakki ramesh', '9908442512', '$2y$10$wQQVUyweTNBELHqxntYO6.mJTWh3aV/2S.9801zbLf9hi7FzRJPPO', 'ramesh2512', NULL, 'Ameya world school.nammivanipeta colany', '0', 8, 0, '9908442512', 'admin', '2025-02-18 17:16:43', '2025-02-18 17:16:43', NULL, NULL, NULL, NULL),
(1145, 'Peddinti prasad', '9849551893', '$2y$10$H/lsi/xG/jGB1KJaCDQSg.z03y3OWCKoYMlJqC270cRb6m/jebNHW', '984955', NULL, 'DEVARAPALI', '0', 8, 0, '9849551893', 'admin', '2025-02-19 02:40:44', '2025-02-19 02:40:44', NULL, NULL, NULL, NULL),
(1146, 'Suman', '6300856134', '$2y$10$TGVJFybTZDzBmvsQ5IahqOLF9LUjEoKI40x07w9HThTViOXhS8qCS', 'Beyrue#123', NULL, 'Betrue#123', '0', 8, 0, '6300856134', 'admin', '2025-02-19 07:48:40', '2025-02-19 07:48:40', NULL, NULL, NULL, NULL),
(1147, 'aravind reddy', '9000166691', '$2y$10$gRKhs0kQ1pS.KYASGCgTGOxHZ3qOhuMhZ0/9sqfeHwGuwn10u0e.y', 'millionair@2025', NULL, 'hyderabad', '0', 8, 0, '9000166691', 'admin', '2025-02-19 11:15:51', '2025-02-19 11:15:51', NULL, NULL, NULL, NULL),
(1148, 'Ram Maruri', '8985850073', '$2y$10$rGIP0Jxpt4NIvosplX/AGuzEH6dixNc3p/VsqoLdbAZYaafNOmvTO', 'Rammaruri@123', NULL, 'Hyderabad', '0', 8, 0, '8985850073', 'admin', '2025-02-19 11:38:22', '2025-02-19 11:38:22', NULL, NULL, NULL, NULL),
(1149, 'Rohith Kumar', '9505819517', '$2y$10$cyRUTaYZnmv.JPL23iPIsOOnV.Res3mWd4slByO14SogogNecBcQK', 'Addmagpro@123', NULL, 'Hyderabad', '0', 8, 0, '9505819517', 'admin', '2025-02-19 14:23:05', '2025-02-19 14:23:05', NULL, NULL, NULL, NULL),
(1150, 'Rohith Kumar', '9505819547', '$2y$10$2QHvKj0hTgA1ZoMUnI40uObXXwNopvsb1INQ7eLQ8r/xMiqKhP/KC', 'Addmagpro@123', NULL, 'Hyderabad', '0', 8, 0, '9505819547', 'admin', '2025-02-19 14:24:11', '2025-02-19 14:24:11', NULL, NULL, NULL, NULL),
(1151, 'RADHARAM ANJANEYULU', '9550127916', '$2y$10$C3iJbLMvQM1rwWbd6i2zs.ZmiMlLyFCbfizB6/mOu3pUT6t.BkaVm', '00748213', NULL, 'Ghatkesar', '1000', 8, 0, '9550127916', '8522881144', '2025-09-09 12:11:30', '2025-02-19 16:45:44', NULL, NULL, NULL, NULL),
(1152, 'SATISH KUMAR CHERIYALA', '9912770600', '$2y$10$DAB0bVagqEGHc.AqDrn4nuCacvKhewPmxfLaupXXFveunwIJHIDka', '124456', NULL, 'Bolarum', '0', 8, 0, '9912770600', 'admin', '2025-02-20 06:21:37', '2025-02-20 06:21:37', NULL, NULL, NULL, NULL),
(1153, 'Anirudh.G', '9154173734', '$2y$10$6Vw4/.1HRLwDHJ1RKKXgQ.vIDAkGeM/3DcX9uRUUADKKvM9tI/uJa', 'cosTym-rygwuw-1bofro', NULL, 'Hyderabad', '0', 8, 0, '9154173734', '8522881144', '2025-02-21 08:56:18', '2025-02-21 08:56:18', NULL, NULL, NULL, NULL),
(1154, '9885153405', '9885153405', '$2y$10$iEMMuLU2I2MuO0k.KoC9buNVVPrytafYUjQ3Ha7F4y5Ps1c3XXk12', 'Hello@123', NULL, 'Hyderabad', '0', 8, 0, '9885153405', 'admin', '2025-02-21 10:25:49', '2025-02-21 10:25:49', NULL, NULL, NULL, NULL),
(1155, 'SAMALA RANJTH KUMAR', '9989415581', '$2y$10$tkWt6FJ0NKYeUyx9XRL9p.4BdLW3P2ipBnWg5.eA9.HqYvGyhjF3C', 'Ranjith@7569', NULL, 'Warangal', '0', 8, 0, '9989415581', '7702381784', '2025-02-22 08:26:41', '2025-02-22 08:26:41', NULL, NULL, NULL, NULL),
(1156, 'M LAKSHMI NADH', '9959821128', '$2y$10$gcNUBq3L5xbFpvkFgmKBzOP90Ct3qIVOQifnHh8vXrbhVt5BhS3f6', '9959821128', NULL, 'HYDERABAD', '1000', 8, 0, '9959821128', 'admin', '2025-06-12 06:15:16', '2025-02-22 10:32:06', NULL, NULL, NULL, NULL),
(1157, 'THATIKAYALA KUMARA SWAMY', '9550872502', '$2y$10$cc58MX8WRsy9U4MkdyQwC.qURQmeD.QDBlo.encosBFF.0prCl0bW', 'kumarT@2025', NULL, 'Gokul Nagar, 2-4-912/A, Hanamkonda', '0', 8, 0, '9550872502', '7702381784', '2025-02-22 12:01:29', '2025-02-22 12:01:29', NULL, NULL, NULL, NULL),
(1158, 'Chandra Sekhar', '9951080605', '$2y$10$MenawxZ7JXNpH/.mzCwDq.Op3RSiFkgmhF9YzICriqRvXiSbHNkXO', 'Prasu@143', NULL, 'Hyderabad', '0', 8, 0, '9951080605', 'admin', '2025-02-23 07:03:40', '2025-02-23 07:03:40', NULL, NULL, NULL, NULL),
(1159, 'Mounika', '9493487904', '$2y$10$gmqApEPGiuSCqYAr4ip4U.LmWL9FZ5GrP2u/jXqalMdasP5IinNEu', 'Surya@1238', NULL, 'Hyd', '0', 8, 0, '9493487904', 'admin', '2025-02-24 08:31:06', '2025-02-24 08:31:06', NULL, NULL, NULL, NULL),
(1160, 'Sandesh Kanapuram', '9885843173', '$2y$10$RipsDpUk3X5GUBOAotXyV.K3p4p/udlWL9uJwBAx/bbZe.hsYhC8u', 'Sandy@369', NULL, 'Hyderabad', '0', 8, 0, '9885843173', '8332821881', '2025-02-25 06:52:36', '2025-02-25 06:52:36', NULL, NULL, NULL, NULL),
(1161, 'Murali Krishna K', '9440460631', '$2y$10$mWmy5Fs/YVH.mPiUCDNPa.sy5R7cmbmXq6t9f.XfZynE9cHHa.Xru', 'diamond', NULL, 'Hyderabad', '0', 8, 0, '9440460631', 'admin', '2025-02-25 07:03:31', '2025-02-25 07:03:31', NULL, NULL, NULL, NULL),
(1162, 'Narayana', '9000432672', '$2y$10$PSjVM4PvQWfmwcGxMHYKTeqo54CmxzxesAgNlafM99Udcd94HP6Dy', '1234567', NULL, 'Ts', '0', 8, 0, '9000432672', 'admin', '2025-02-25 07:05:26', '2025-02-25 07:05:26', NULL, NULL, NULL, NULL),
(1163, 'Kothapalli Rajesh', '9703611119', '$2y$10$l/8CFidpi12yVw9R48xDueKdfY54v4ZViTNyEsyBGw/K3sNL0xiZC', 'nandan12', NULL, 'Eluru 5', '0', 8, 0, '9703611119', '7702381784', '2025-02-26 12:29:50', '2025-02-26 12:29:50', NULL, NULL, NULL, NULL),
(1164, 'Thota narayana swamy', '8374240653', '$2y$10$uz1fYshvybRxqJzj3dBJvODBTT1Y941mo.76YjVnO.WcsgNSaoGzG', 'swamy1122', NULL, 'Guntur', '0', 8, 0, '8374240653', '7702381784', '2025-02-26 15:44:04', '2025-02-26 15:44:04', NULL, NULL, NULL, NULL),
(1165, 'Surya Ravikumar', '9014916056', '$2y$10$Ocbd1uZCvSktC/GzgCq5UuMCssgoKX5CzcHOu5ji1jHvtUWd1LMd2', 'qwerty', NULL, 'qwerty', '0', 8, 0, '9014916056', 'admin', '2025-02-27 06:08:53', '2025-02-27 06:08:53', NULL, NULL, NULL, NULL),
(1166, 'Battini Sagar', '9052377782', '$2y$10$Q8kNkP39aw4269CLgSaUUe17r3dKr.10rl02p0O41GUEsW8BUN1a2', 'Sagaranu2@', NULL, 'Karimnagar', '0', 8, 0, '9052377782', '7702381784', '2025-03-03 13:45:22', '2025-03-03 13:45:22', NULL, NULL, NULL, NULL),
(1167, 'CHENNAMSETTY RAVIBABU', '9494849529', '$2y$10$ZkqGCabFdeo5xtFPJPEocOmNS6oI5K5JOYA/ccbdQFXNMCVoEOcQ6', 'PawaN@6461#', NULL, 'CHILAKALURIPET', '0', 8, 0, '9494849529', '8522881144', '2025-03-05 01:18:15', '2025-03-05 01:18:15', NULL, NULL, NULL, NULL),
(1168, 'C VENKATARAMANA REDDY', '7893644509', '$2y$10$TBn2t/5fqFP/TcQ4Wcr2q.riN6W2CdC7eAwwXm3LSJV.HUIfHCymi', '@1234', NULL, 'KARKHANA HYD', '1000', 8, 0, '7893644509', 'admin', '2025-03-05 12:43:31', '2025-03-05 08:30:40', NULL, NULL, NULL, NULL),
(1169, 'Ashique', '9600048104', '$2y$10$44hwbiRnNuyTq04gfzZw7upyxbcbqOvcn0YcaQxg1k0rQ.R9f.75i', 'Ashiwue@14', NULL, 'Chennai', '0', 8, 0, '9600048104', 'admin', '2025-03-07 02:39:26', '2025-03-07 02:39:26', NULL, NULL, NULL, NULL),
(1170, 'Ashique', '7397467433', '$2y$10$5FjtyH/wsczJ4JH/Pdwt6uUO1Sv9sr8h0WTKx1.iAUpx8aHWDgrr6', 'Ashique@14', NULL, 'Chennai', '0', 8, 0, '7397467433', 'admin', '2025-03-07 02:47:04', '2025-03-07 02:47:04', NULL, NULL, NULL, NULL),
(1171, 'BPO CHANDU', '1123456789', '$2y$10$SXkP6lTPYmdidYGchijAvuh5rr9q0rv2X4qa8eMUp1DAM6cp3OgKi', '123456', NULL, 'Hyderabad', '0', 8, 0, '1123456789', 'admin', '2025-03-07 05:48:06', '2025-03-07 05:48:06', NULL, NULL, NULL, NULL),
(1172, 'Shivakumar', '9742775487', '$2y$10$KqyiqjAmRqLVKbmHL34BYepGeHWAjVtRjxoHnIf2Wu4rZEQJPgX82', '$hivHema9742', NULL, 'Hyderabad', '0', 8, 0, '9742775487', '9360450649', '2025-03-10 16:15:16', '2025-03-10 16:15:16', NULL, NULL, NULL, NULL),
(1173, 'BACHALAKOORA SAIDULU', '9618473101', '$2y$10$iThMP1ERzwSZM2QVZzeq4.j9b.yazd6cLfIqU58h6c403FT1U.MLS', 'Bs@198101', NULL, 'Suryapet', '0', 8, 0, '9618473101', 'admin', '2025-03-12 06:30:05', '2025-03-12 06:30:05', NULL, NULL, NULL, NULL),
(1174, 'SABAB GOURAV PRASAD', '7725924037', '$2y$10$N7aXUE4h3UjbTXawfhEE2egx4lSitMlwgA82LEoeOLPHEyONyZ3dW', 'Openbaby02', NULL, 'Hyderabad', '0', 8, 0, '7725924037', 'admin', '2025-03-17 06:22:57', '2025-03-17 06:22:57', NULL, NULL, NULL, NULL),
(1175, 'V SANDEEP KUMAR', '9121795272', '$2y$10$MPMptJUv.7i3P3KQw81e9.07/hvFCMotbcRUT34etm03TlFA01//m', 'Smercato@2025', NULL, 'HYDERABAD', '0', 8, 0, '9121795272', 'admin', '2025-03-17 11:20:28', '2025-03-17 11:20:28', NULL, NULL, NULL, NULL),
(1176, 'Jyothi', '9392883745', '$2y$10$TQuAI/Ha.aPMs5dgAFduoO5h0QVvCp6KjRxrtsAuLqRu4Hgv/JtIG', 'jyothi1982', NULL, 'Hyderabad', '0', 8, 0, '9392883745', '8332821881', '2025-03-22 13:03:25', '2025-03-22 13:03:25', NULL, NULL, NULL, NULL),
(1177, 'Jyothi', '9573697572', '$2y$10$j6XykYynjjtCorj46cUNf.hlVMIMnyU/38HBgDkX9M6IfInqeVkrq', 'jyothi1982', NULL, 'Hyderabad', '0', 8, 0, '9573697572', '8332821881', '2025-03-22 13:13:29', '2025-03-22 13:13:29', NULL, NULL, NULL, NULL),
(1178, 'Geluka Prameela', '6300013433', '$2y$10$.polMhTgqOZIF7ydxG9Nh.XI13bzUcEWZb.kowFHA.gBMDCmIxcoi', '123456', NULL, 'Vidya nagar,ou road, Hyderabad 500044, Telangana India', '0', 8, 3047, '6300013433', '8332821881', '2025-04-01 06:00:10', '2025-03-26 06:50:44', NULL, NULL, NULL, NULL),
(1179, 'Shivaram', '7658997968', '$2y$10$OnvVe1J..DIsgpSHcBlsH.V6IkiNlNk2UupAZnlPXMASeW0l0/xk.', 'Shiv@r@m', NULL, 'Hyderabad', '0', 8, 0, '7658997968', '8332821881', '2025-03-26 10:18:23', '2025-03-26 10:18:23', NULL, NULL, NULL, NULL),
(1180, 'Satya vathi', '9398676631', '$2y$10$uX/5DvDLP32iuOceEK935eqxF0b.rK.86tCUr9Dd./urB4hTjfgAO', 'nehasatyasrij', NULL, 'Allwyn colony , Sai nagar phase ii water tank H.NO.4-32-1741 plot No. B-63', '0', 8, 0, '9398676631', '9348963999', '2025-03-26 14:48:56', '2025-03-26 14:48:56', NULL, NULL, NULL, NULL),
(1181, 'Vanitha kaparthi', '8886377369', '$2y$10$wRs74quIfME0ddAnA.XwZ.WbWjPJIkW7uo1TcBDP8.OXa0fkaj3Qu', 'smiling16', NULL, 'Hyderabad', '0', 8, 0, '8886377369', '7702381784', '2025-03-27 16:39:25', '2025-03-27 16:39:25', NULL, NULL, NULL, NULL),
(1182, 'Sudharshan Gokolkonda', '8008447578', '$2y$10$ts30mCNgmTYhTc7Dc4EUVOkQe472eeBzHOySzwo0ZaKQDl6hxt6pu', 'CKQPG9997L', NULL, 'Boduppal', '0', 8, 0, '8008447578', '8522881144', '2025-04-02 13:43:38', '2025-04-02 13:43:38', NULL, NULL, NULL, NULL),
(1183, 'M Ramakrishna', '9908023715', '$2y$10$.xXYaljTgG6qTnSGmDIQbe3UJ0hi1MQx666Tn0iDDBKQn/oZC8WrK', '123456', NULL, 'Hyderabad uppal', '0', 8, 0, '9908023715', 'admin', '2025-04-02 14:20:07', '2025-04-02 14:20:07', NULL, NULL, NULL, NULL),
(1184, 'Mandadi Swathi', '9705381873', '$2y$10$jR6zQRWSmMaWnIXA30/GyOjA.B/Dl36uquEEELJjJ0AFfVYumJVE2', '121993', NULL, 'Hyderabad Uppal', '0', 8, 0, '9705381873', '9908023715', '2025-04-03 02:21:35', '2025-04-03 02:21:35', NULL, NULL, NULL, NULL),
(1185, 'V. Renuka', '6301207783', '$2y$10$Y4UWIis8nf96lmD/BJVnMO79LHz9Jn6YJELgZRDbfcg52.pH2HElK', '5566', NULL, 'Medipally', '0', 8, 0, '6301207783', '9908023715', '2025-04-03 11:46:04', '2025-04-03 11:46:04', NULL, NULL, NULL, NULL),
(1186, 'Namindla latha', '7337410803', '$2y$10$EL3DFNcRYF7Xt7DyTk7LV.K/ELXGcAj23iGUEsnCYFmGJP7d/vKu.', 'vyshu@0412', NULL, 'Boduppal', '0', 8, 0, '7337410803', '9908023715', '2025-04-04 05:44:57', '2025-04-04 05:44:57', NULL, NULL, NULL, NULL),
(1187, 'Namindla latha', '9618388323', '$2y$10$UfiM6bQO6h5IaDp2DG4ILu.iB.9GLbK/OdcgO8CGxyAyng.6YVndC', 'vyshu@0412', NULL, 'Boduppal', '0', 8, 0, '9618388323', '9908023715', '2025-04-04 05:46:16', '2025-04-04 05:46:16', NULL, NULL, NULL, NULL),
(1188, 'vagana premkalyan', '9032513846', '$2y$10$fZxx77KYxWmcDsm4K3M3LOFs5HdDPS3mxUmot8IiylwJZL8mGRdWy', 'Prem@1356', NULL, 'uppal,hyderabad', '0', 8, 0, '9032513846', 'admin', '2025-04-07 08:28:28', '2025-04-07 08:28:28', NULL, NULL, NULL, NULL),
(1189, 'Sudhakar Reddy', '9008621072', '$2y$10$uUsmzEUrviq/YLuy.j4.CO.z7n6f2eJwTFoDRsgXr1Ti9xt1lf78.', 'Rambabet', NULL, 'Kadapa', '0', 8, 0, '9008621072', '9291290683', '2025-04-11 05:00:54', '2025-04-11 05:00:54', NULL, NULL, NULL, NULL),
(1190, 'Raghu', '9398854167', '$2y$10$qLRH6wNU2ByZCYRyQ6O8G.EQvfw5bMHVeegGuyJPJc1nIcxAaxOHG', '123456789', NULL, 'Warangal', '0', 8, 0, '9398854167', '8522881144', '2025-04-11 08:09:58', '2025-04-11 08:09:58', NULL, NULL, NULL, NULL),
(1191, 'N krishna reddy', '9951119284', '$2y$10$qeoEwdHb1t7E0VHHlIqnVerAA71Op43OOyJqK3UlKyaSVH54dFYva', 'nkr123', NULL, 'Karmanghat', '0', 8, 0, '9951119284', 'admin', '2025-04-12 03:45:42', '2025-04-12 03:45:42', NULL, NULL, NULL, NULL),
(1192, 'Kavitha Reddy', '7095241356', '$2y$10$OpjgBg47DraT7gPF7/2NseOu17DfawD9w/GUFn8NjlCzpBegps07a', '123456', NULL, 'Hyderabad', '0', 8, 0, '7095241356', 'admin', '2025-04-12 04:01:27', '2025-04-12 04:01:27', NULL, NULL, NULL, NULL),
(1193, 'Boda Srinivasa Rao', '9010106399', '$2y$10$kkuZiVui17Y69BqNVzx2ueOPZjg6ZUvx4s.3FmGoIKr2oy44YaNXO', '123456', NULL, 'Hyderabad', '0', 8, 0, '9010106399', '9348963999', '2025-04-12 09:56:42', '2025-04-12 09:56:42', NULL, NULL, NULL, NULL),
(1194, 'Pushpa', '7989494006', '$2y$10$vLsYyiOoiDzfsvW4tdd9ueO9juXBaPCCx8fbgT32gbnOjP9lg4.hW', 'buddi@2015', NULL, 'Hyderabad', '0', 8, 0, '7989494006', '9491443072', '2025-04-15 08:44:07', '2025-04-15 08:44:07', NULL, NULL, NULL, NULL),
(1195, 'Hemani', '7671886148', '$2y$10$3TQdoMmSDQ3mkjRHnccBGuMiQwfMuKMvUzChHUOFFeKWYKrWX1Yse', 'Hemani@28', NULL, 'Hyderabad', '0', 8, 0, '7671886148', 'admin', '2025-04-15 10:11:16', '2025-04-15 10:11:16', NULL, NULL, NULL, NULL),
(1196, 'Priya', '6281170719', '$2y$10$1Uu0y6KZGesYbFfyYXOahehUE/swUA7.eZzT67Ktdh48G.8ZaeiU2', '123456', NULL, 'Ameerpet', '0', 8, 0, '6281170719', '9348963999', '2025-04-17 10:07:44', '2025-04-17 10:07:44', NULL, NULL, NULL, NULL),
(1197, 'RAVI KUMAR REDDY CHILLA', '8333014956', '$2y$10$S8cm85482aPuMNqkyLPn7OL5x9yUfSi5bDrZaxMu9EekUdUAI5Pcm', 'care@1234', NULL, 'Hyderabad', '0', 8, 0, '8333014956', '7095241356', '2025-04-20 08:43:43', '2025-04-20 08:43:43', NULL, NULL, NULL, NULL),
(1198, 'Mahesh', '9110701739', '$2y$10$mS0loinkhhXpXkGPpTYdxuQGhW87jffDzjWO5ev6pkrQdR8HtemSi', '123456', NULL, 'Palakurthy', '0', 8, 0, '9110701739', 'admin', '2025-04-21 07:29:56', '2025-04-21 07:29:56', NULL, NULL, NULL, NULL),
(1199, 'Yata Someshwar', '7702952439', '$2y$10$p5zNdcgX7pwxJe7p8uQ5DufGk92BJ.KSUgGVRkNkRmp8KxAZVg34q', '1234', NULL, 'Palakurthi', '0', 8, 0, '7702952439', 'admin', '2025-04-21 07:40:21', '2025-04-21 07:40:21', NULL, NULL, NULL, NULL),
(1200, 'Guggilla Sampoorna', '7396625020', '$2y$10$7Z5CmZqPIRG0VEqDyzyLG.x5/UpZd/tlVAG7VMVfOyxyqtVJqZFNC', '123456', NULL, 'Gopalapuram post Gudur mandal: palakurthi dist: Jangaon state : Telangana', '0', 8, 0, '7396625020', 'admin', '2025-04-21 07:53:34', '2025-04-21 07:53:34', NULL, NULL, NULL, NULL),
(1201, 'Thalli pallu annapurna', '8688678534', '$2y$10$w5k0ssbM6DiAbmimhV8LbuP8hl5cjaRjyYKFQtzwsAerWQ2x6AscG', '123456', NULL, 'Vli mallapmally m palakurthy Di janagam', '0', 8, 0, '8688678534', 'admin', '2025-04-21 07:54:37', '2025-04-21 07:54:37', NULL, NULL, NULL, NULL),
(1202, 'Sheela ravinder', '9701815846', '$2y$10$S6XjmIsyFcC/Z0wHciqs1edAR0exagiSG.nLD7ONKUcIOqm/MmWwq', '123456', NULL, 'Ramannagudem', '0', 8, 0, '9701815846', 'admin', '2025-04-21 08:02:16', '2025-04-21 08:02:16', NULL, NULL, NULL, NULL),
(1203, 'షీలా mallesh', '9346093035', '$2y$10$K2AEYv43xnE4HfvSa/p.jOBF81vRk1dkhzPpOP/xaeTpztj69n75G', '123456', NULL, 'Ramannagudem', '0', 8, 0, '9346093035', 'admin', '2025-04-21 08:02:58', '2025-04-21 08:02:58', NULL, NULL, NULL, NULL),
(1204, 'Mudavath Ganesh', '7702623754', '$2y$10$qWKx3N7NeMm4ZiMVXr6GP.7r0jOVNAQSoHFP5kkfO8d09RitMCwdG', '123456789', NULL, 'Palakurthy', '0', 8, 0, '7702623754', 'admin', '2025-04-21 08:42:12', '2025-04-21 08:42:12', NULL, NULL, NULL, NULL),
(1205, 'M,renuka', '9010829106', '$2y$10$HT7t6YmDvJB7dEiW0UKGmukQ2CnEs5PB4l/FDNwxphNk7ALP.2AW2', '123456', NULL, 'Ayyangaripally', '0', 8, 0, '9010829106', 'admin', '2025-04-21 08:49:54', '2025-04-21 08:49:54', NULL, NULL, NULL, NULL),
(1206, 'Pareedula shirisha', '6303805874', '$2y$10$4oh/e0BORnpuAjq5vWogf.7DjhUyWGRT7mNlhEbsjggRB2TpsZsMi', '123456', NULL, 'Jangaon', '0', 8, 0, '6303805874', 'admin', '2025-04-21 08:56:55', '2025-04-21 08:56:55', NULL, NULL, NULL, NULL),
(1207, 'SHANIGARAM RADHIKA', '7416873891', '$2y$10$DZMRC8A.qEwz8/TxAey74utLhA7cJRgKr/oH16dgRz2rHjXNqLsse', '1234', NULL, 'Jeedikal', '0', 8, 0, '7416873891', 'admin', '2025-04-21 08:57:02', '2025-04-21 08:57:02', NULL, NULL, NULL, NULL),
(1208, 'Anumandla Pavan Kalyan', '9703804453', '$2y$10$QUEs6yeLrKdeuN9rWWAABOUSQXNWMqi.asM4PDfz2iNc2FNTGsYZm', 'Pavan@8334', NULL, 'Warangal', '0', 8, 0, '9703804453', 'admin', '2025-04-21 09:04:07', '2025-04-21 09:04:07', NULL, NULL, NULL, NULL),
(1209, 'MITHUN CHAKRAVARTHI TALLURI', '8121866880', '$2y$10$A2TO6F7TFYwDE0fZQoFmI.kZghGxwtJVH.53SavpXDpUGi9dvEXku', 'Mithun@1995', NULL, 'Mithun@1995', '0', 8, 0, '8121866880', 'admin', '2025-04-23 05:54:01', '2025-04-23 05:54:01', NULL, NULL, NULL, NULL),
(1210, 'Md thanveer anjum', '7780572705', '$2y$10$sOIkrgglYavlYhGuueRpoO1OpbrBQQZMxA7GmwRPZXivt2UQDMuyK', '786786', NULL, 'Hyderabad', '0', 8, 0, '7780572705', '7730099707', '2025-04-23 08:08:54', '2025-04-23 08:08:54', NULL, NULL, NULL, NULL),
(1211, 'KOMALI', '8977644269', '$2y$10$83wOJrCFcO8lYgDXfBm9GuuYRb/o6sMdUbkyAk2yjqY0mDWIw7Jry', 'pass1234', NULL, 'vijayawada', '0', 8, 0, '8977644269', 'admin', '2025-04-23 10:46:21', '2025-04-23 10:46:21', NULL, NULL, NULL, NULL),
(1212, 'Nagasheshu Kumar', '7013692393', '$2y$10$U/GxZt8nifhVz1eiGhRoeu3fMHDX778FNgiqSj6GeFKNoKcFu6yvm', 'Hitha@123', NULL, 'Hyderabad', '0', 8, 0, '7013692393', '9348963999', '2025-04-24 12:44:12', '2025-04-24 12:44:12', NULL, NULL, NULL, NULL),
(1213, 'E INDRA KARNA GOUD', '8985997877', '$2y$10$ekmLywBAgdNc.71Rq2fFIu0Zhn.vRXW6BgvSOn5Gn0I9VPARcBvUy', 'Password@123', NULL, 'Hyderabad', '0', 8, 0, '8985997877', 'admin', '2025-04-24 15:53:50', '2025-04-24 15:53:50', NULL, NULL, NULL, NULL),
(1214, 'SRAVAN KUMAR', '6302265302', '$2y$10$bju36JufYNeDKQl6.9ls2uWCed7s4WHP0qNGE9w3yFAd5hxX9IUEi', 'Asdf@2025', NULL, 'Hyderabad', '0', 8, 0, '6302265302', '7702381784', '2025-04-27 11:22:32', '2025-04-27 11:22:32', NULL, NULL, NULL, NULL),
(1215, 'N SHIVAPRASAD', '6302715993', '$2y$10$9lKK/Niact8YN61hMvnU/OCdr6.zBVBdlBAS8GTXTzftnby3/ZGZW', 'Mounika@143', NULL, 'Hyderabad', '0', 8, 0, '6302715993', '7702381784', '2025-04-27 18:13:57', '2025-04-27 18:13:57', NULL, NULL, NULL, NULL),
(1216, 'Veluri latheef', '7013954910', '$2y$10$bX6OwqEIuXjoFHF/.5IYcu52Oo29dvwy4JLb4PyflUdWnu4g2l6xu', 'Latheeflg', NULL, 'Kakinda', '0', 8, 0, '7013954910', 'admin', '2025-04-28 02:27:10', '2025-04-28 02:27:10', NULL, NULL, NULL, NULL),
(1217, 'Manjunath K', '9449646064', '$2y$10$3Sx/ALwfnGg85TpCU6FKcemUh2oIoY701CIeXrItDhnvfaCk4qkLy', 'manju46064', NULL, 'Bangalore', '0', 8, 0, '9449646064', 'admin', '2025-04-28 16:26:46', '2025-04-28 16:26:46', NULL, NULL, NULL, NULL),
(1218, 'Teja537', '9291236644', '$2y$10$BUbrVhZvP2pmg65vojO7m.MIzJKOlbqq8CRgF2cBZqP88ga5yit/m', 'W@537#', NULL, 'Vijayawada', '0', 8, 0, '9291236644', 'admin', '2025-04-28 16:50:41', '2025-04-28 16:50:41', NULL, NULL, NULL, NULL),
(1219, 'Rajesh', '9032999979', '$2y$10$b.t6eNm/5yoGL/VEw0pjGeAnYaGa1PV2JDf7HC0sbwkiSRIFKzeNW', 'Sahish', NULL, 'Hyderabad', '0', 8, 0, '9032999979', 'admin', '2025-04-29 16:43:01', '2025-04-29 16:43:01', NULL, NULL, NULL, NULL),
(1220, 'ASHOK KUMAR GOSHIKA', '9121926354', '$2y$10$fp2FriPOpEcGkdCKKkCTPuOmANKue4CoPH/9PAgT573tazxNOfi.S', 'Ashok@31051977', NULL, 'hyderabad', '0', 8, 0, '9121926354', 'admin', '2025-05-02 07:06:05', '2025-05-02 07:06:05', NULL, NULL, NULL, NULL),
(1221, 'Maddipudi BrahmajiRao', '8074507650', '$2y$10$z0/pyHPRXIz1jrF.OMMacut6fx9mLK6p/zsTl9Er6bbhl9j953qYO', '8074507650', NULL, 'Hyderabad', '0', 8, 0, '8074507650', '7702381784', '2025-05-04 15:12:24', '2025-05-04 15:12:24', NULL, NULL, NULL, NULL),
(1222, 'Kotni Suhasini', '9491321034', '$2y$10$MIN1ZdGHAg8vnpVXo0jliOCSD8/kGCajc68IX9lk/JEeACBaaW7Ua', '123456', NULL, 'Hyderabad', '0', 8, 0, '9491321034', '9348963999', '2025-05-06 08:55:42', '2025-05-06 08:55:42', NULL, NULL, NULL, NULL),
(1223, 'Venkatesh', '9581176686', '$2y$10$HOdL2rtxnmm5dAsX/pUhreQoz/fH1P.E9f47mGSJ2VH7Coial2ciC', 'addmag123', NULL, 'Hyderabad', '0', 8, 0, '9581176686', 'admin', '2025-05-06 14:49:20', '2025-05-06 14:49:20', NULL, NULL, NULL, NULL),
(1224, 'karthik@gmail.com', '9381235196', '$2y$10$Jiy7zpw54Nw8xXL4cNA1S./eoXDv/0dmKffNvY1/6vGituUbrMXI2', 'Kittu1053@', NULL, 'tandur', '0', 8, 0, '9381235196', 'admin', '2025-05-13 09:15:44', '2025-05-13 09:15:44', NULL, NULL, NULL, NULL),
(1225, 'J v Praveen Kumar', '9381287493', '$2y$10$EMO9snkeh6Y2ocWjMGpn9O32qDFGufXePXlgQatRkNQuc/WnjvU6G', 'guptajvpk', NULL, 'Anantapur', '0', 8, 0, '9381287493', 'admin', '2025-05-15 06:14:50', '2025-05-15 06:14:50', NULL, NULL, NULL, NULL),
(1226, 'Raman Gajender', '9346255428', '$2y$10$2i3iQZUYEsvLgxJAboK2YeWChPxkl5GPxy3QfBrvFpe6TboFyTR52', 'kutty79', NULL, 'Chinthal Hyderabad', '0', 8, 0, '9346255428', 'admin', '2025-05-16 07:06:30', '2025-05-16 07:06:30', NULL, NULL, NULL, NULL),
(1227, 'Raman Gajender', '9346255728', '$2y$10$aslt.sfJPapb7/CzfZsWveIiIiAFoCiWOfSb9ur.RQWiV97BcmXAa', 'kutty1979', NULL, 'Chinthal Hyderabad', '0', 8, 0, '9346255728', 'admin', '2025-05-16 07:07:24', '2025-05-16 07:07:24', NULL, NULL, NULL, NULL),
(1228, 'P VIJAYABHASKARREDDY', '9346022055', '$2y$10$m/ZIkxnLXz/bMDTQoS4lDeWUrJDfB9HDJtVkCjyXUS2uKQG.5P4uy', '336699', NULL, 'SURARAM', '0', 8, 0, '9346022055', '7702381784', '2025-05-16 08:54:26', '2025-05-16 08:54:26', NULL, NULL, NULL, NULL),
(1229, 'Renuka', '9652489238', '$2y$10$HC/v4Y0K/WDGPQMMLCxLkOuh8/q7KlQUJxyHi0V48tYp7eeM0FECi', 'renuka123456789', NULL, 'Palakurthi', '0', 8, 0, '9652489238', '7702381784', '2025-05-19 06:29:35', '2025-05-19 06:29:35', NULL, NULL, NULL, NULL),
(1230, 'Niharika', '9666821581', '$2y$10$0kOJm6fv75M4tlIhpgojKuChuwYCN5vHVKyMhQXd6y2bgHVzLK5yG', 'Niharika966690832011', NULL, 'Idpl hyderabad', '0', 8, 0, '9666821581', '9652489238', '2025-05-19 06:33:41', '2025-05-19 06:33:41', NULL, NULL, NULL, NULL);
INSERT INTO `service_users` (`service_id`, `member_name`, `member_phone`, `password`, `open_password`, `user_profile_pic`, `location`, `cumulative_gross`, `commission_percentage`, `back_two_back_balance`, `referral_id`, `referral_by`, `created_at`, `joined_date`, `address`, `city`, `state`, `pincode`) VALUES
(1231, 'Sharmila', '9505473129', '$2y$10$7n7IKiOHdoY0ZB2AShVMV.MjfWZSL.5lZDEtmxid26OruC.MFO.4S', 'shalom485', NULL, 'Idpl hyderabad', '0', 8, 0, '9505473129', '9666821581', '2025-05-19 07:55:37', '2025-05-19 07:55:37', NULL, NULL, NULL, NULL),
(1232, 'Padma', '9398664924', '$2y$10$Kc2DJ5QaSVXp9W4mWg8RG.uoINjl6MukXWdFTM7Eu02Tn71F0O4X.', '9876', NULL, 'Idpl', '0', 8, 0, '9398664924', '9666821581', '2025-05-19 12:46:16', '2025-05-19 12:46:16', NULL, NULL, NULL, NULL),
(1233, 'Bhagya', '8247038495', '$2y$10$Se41sfDuwNMpuDNfZ83F5OyOzqKqxTd5SEGzKIBIVDgVcoMkouacO', 'bhagya', NULL, 'Idpl hyderabad', '0', 8, 0, '8247038495', '9505473129', '2025-05-19 13:03:35', '2025-05-19 13:03:35', NULL, NULL, NULL, NULL),
(1234, 'Satyanarayan', '9618112383', '$2y$10$R1mEiNyRHv2ao9ZlLE..RORvUrtoq8fco0RZxRNJFzodcT9Z1/GdC', 'Niharika', NULL, 'Idpl', '0', 8, 0, '9618112383', '9666821581', '2025-05-19 13:31:43', '2025-05-19 13:31:43', NULL, NULL, NULL, NULL),
(1235, 'Satyanarayana', '9573589346', '$2y$10$902k.8lvUoNi7medvo13lumdLxe9fgXdnzlROtxjTFW1ffzcF3SqS', '9618112383', NULL, 'Idpl', '0', 8, 0, '9573589346', '9666821581', '2025-05-20 14:55:15', '2025-05-20 14:55:15', NULL, NULL, NULL, NULL),
(1236, 'Sowmyasri', '8143953326', '$2y$10$wd3U9kh5TBYDPE91jvKNOeMiuEymcJq/Mtt/JK.N2r4.Kj1h2CvgS', 'deepaksowmya', NULL, 'Hyderabad', '0', 8, 0, '8143953326', 'admin', '2025-05-23 16:08:39', '2025-05-23 16:08:39', NULL, NULL, NULL, NULL),
(1237, 'JALA Academy', '7989057123', '$2y$10$U8Qc3R0gZdX4qMMYI5/Mi.WiDbheCEa1GNMUdO4070iP2WIRVrtqa', 'jala academy', NULL, 'Madhapur', '0', 8, 0, '7989057123', 'admin', '2025-05-24 06:16:20', '2025-05-24 06:16:20', NULL, NULL, NULL, NULL),
(1238, 'Anitha', '9346690832', '$2y$10$tyac5jeOR6xvN9imXyGgjeUX7P55q48eL0/qWMdFmmugoFAzRwJfe', 'anitha', NULL, 'Idpl', '0', 8, 0, '9346690832', '9666821581', '2025-05-25 02:15:12', '2025-05-25 02:15:12', NULL, NULL, NULL, NULL),
(1239, 'BTS SOLOMON RAJ', '9052470899', '$2y$10$5aPmrOYsNB0iJHOd9izLd.LUAnDGxHqBSW.vNmLbCbnyPCKIZV8ti', '981959', NULL, 'Kothagudem', '0', 8, 0, '9052470899', '7702381784', '2025-05-26 15:52:53', '2025-05-26 15:52:53', NULL, NULL, NULL, NULL),
(1240, 'Yoganand', '9652535311', '$2y$10$wqcdgYYrKgmD58plDew9le02TB3BZqLAvLKjgxdi.x1P7zNIbWoV6', 'Anand@1973', NULL, 'Hyderabad', '0', 8, 0, '9652535311', 'admin', '2025-05-28 01:57:43', '2025-05-28 01:57:43', NULL, NULL, NULL, NULL),
(1241, 'Sri Sai Venkatesh Bondu', '9100167773', '$2y$10$5LZsfl8tspVHUBpbeFUZFOF7Vzo0zuqCBEicmlId03GxvnK0I7mx.', 'Life@123', NULL, 'Hyderabad', '0', 8, 0, '9100167773', 'admin', '2025-05-30 05:03:09', '2025-05-30 05:03:09', NULL, NULL, NULL, NULL),
(1242, '8688815404', '8688815404', '$2y$10$illDT9IKmhBXYIMx6tk5ZegzpVcZnrJMl4Dtfgreybk1rEUuTllzO', '12345678@', NULL, 'KAKINADA', '0', 8, 0, '8688815404', 'admin', '2025-05-31 02:42:43', '2025-05-31 02:42:43', NULL, NULL, NULL, NULL),
(1243, 'M BARNABAS', '8885055502', '$2y$10$u/oH2TYxAVHk6W17/bFJYOcCI20nPJ6YY/HrHi7V0wdeGGUrOgdBi', 'Relangi02*', NULL, 'BALANAGAR, HYDERABAD', '0', 8, 0, '8885055502', 'admin', '2025-05-31 23:17:59', '2025-05-31 23:17:59', NULL, NULL, NULL, NULL),
(1244, 'Siva sankara rao', '9440362729', '$2y$10$R4J5i2MIuRvUtgOiwONf/./8C806PcgHHCZDQR5PPM2Pm3jbvce9G', '8500960056', NULL, 'Chirala', '0', 8, 0, '9440362729', 'admin', '2025-06-01 07:30:03', '2025-06-01 07:30:03', NULL, NULL, NULL, NULL),
(1245, 'G Rameh babu', '9494292893', '$2y$10$dQoLEx7kU9hlYUP5BHRPaOsJMpcIE8UAg8dcZE7y/2mepNuz93Rli', 'Ramesh@91', NULL, 'Nellore', '0', 8, 0, '9494292893', 'admin', '2025-06-01 10:14:56', '2025-06-01 10:14:56', NULL, NULL, NULL, NULL),
(1246, 'E swarup', '8328229684', '$2y$10$HTbGuYUOP.OtvSy9f0AO2uJ2zCxLCi3kkOt0D4m/x9JWeKpaVYvpe', '12345', NULL, 'Kakinada', '0', 8, 0, '8328229684', 'admin', '2025-06-01 10:36:36', '2025-06-01 10:36:36', NULL, NULL, NULL, NULL),
(1247, 'E prem', '7981420815', '$2y$10$xlSPS/S7uHMIz7/Z.gr6zumM/wwJ0bR2YfCHUusPyVS.SHWAFt5Q6', '1234567', NULL, 'Kakinada', '0', 8, 0, '7981420815', 'admin', '2025-06-01 10:39:01', '2025-06-01 10:39:01', NULL, NULL, NULL, NULL),
(1248, 'B Rama Krishnam Raju', '8712323456', '$2y$10$BzHwrH8ay2VkFllKibWo7OjSMUJ4TGEOFeyuuNg1qNHONpTPEcQrC', 'Brkr@1708', NULL, 'Ravulapalem', '0', 8, 0, '8712323456', 'admin', '2025-06-01 13:04:20', '2025-06-01 13:04:20', NULL, NULL, NULL, NULL),
(1249, 'Gatla Naresh', '9440129992', '$2y$10$0uuLrAnL4G4.htjzNly6zuf35fPX4CdJza2JWc2ilkWHWraskE2DS', 'Xx11xx11', NULL, 'Bhainsa', '0', 8, 0, '9440129992', 'admin', '2025-06-01 13:45:52', '2025-06-01 13:45:52', NULL, NULL, NULL, NULL),
(1250, 'TK Anil Mohan', '9059111177', '$2y$10$/20kuFOX9KlWjIoA2Q4vn.Qb8jBOmqV8l8d4tRXJCenPs0.p58JTW', 'anil1702', NULL, 'NMDC hyderabad telangana', '0', 8, 0, '9059111177', 'admin', '2025-06-01 15:37:48', '2025-06-01 15:37:48', NULL, NULL, NULL, NULL),
(1251, 'Mastan.shaik', '9676019667', '$2y$10$Q087r893A5ZJQX/3iki1feZ3lek2sdQ/3hCFbeQJD2yCEaWe91ARm', 'shaik9676', NULL, 'Kadapa', '0', 8, 0, '9676019667', 'admin', '2025-06-02 05:00:01', '2025-06-02 05:00:01', NULL, NULL, NULL, NULL),
(1252, 'B satish babu', '9849631795', '$2y$10$C59UtuHqXauwyvdLQIEdV.ijoTjqBUVm7L5HAmlu.kAro8pqdTUCO', 'Kalyan@123', NULL, 'Kalyan@123', '0', 8, 0, '9849631795', 'admin', '2025-06-02 08:40:20', '2025-06-02 08:40:20', NULL, NULL, NULL, NULL),
(1253, 'Nageswara Rao', '9666647477', '$2y$10$9LLnQRMDIr9lRneaB/8lWuCtRDKAn/nny0wV/W/Nj42XUYyxtWKea', 'Chanti@77', NULL, 'Chanti@77', '0', 8, 0, '9666647477', 'admin', '2025-06-02 11:57:29', '2025-06-02 11:57:29', NULL, NULL, NULL, NULL),
(1254, 'Bacha Santosh', '9849295146', '$2y$10$aEY2jMo04kTjH3eWhNRl3uqdpDyEJyWN0kZrYEBkkSOU1SnoKyGIm', 'Jaisriram@7313', NULL, 'Jukkal', '0', 8, 0, '9849295146', 'admin', '2025-06-02 14:05:33', '2025-06-02 14:05:33', NULL, NULL, NULL, NULL),
(1255, 'Kanta Ravikumar', '9989840222', '$2y$10$WaHZIIexxetQHZQmra0OkevqmKrf.mCqVdt/7Jew9whi/cuZPEHiG', 'Pandu@2011', NULL, 'Hyderabad', '0', 8, 0, '9989840222', 'admin', '2025-06-02 14:57:34', '2025-06-02 14:57:34', NULL, NULL, NULL, NULL),
(1256, 'Samuel', '9490777444', '$2y$10$0orP2fxKqL7Lj8mkgQpC9OnzL9YmttsgpNwhDptjYC0JidYl4mF12', 'kanuri', NULL, 'P rajavaram', '0', 8, 0, '9490777444', 'admin', '2025-06-02 15:22:44', '2025-06-02 15:22:44', NULL, NULL, NULL, NULL),
(1257, 'Vijay kumar', '9989292920', '$2y$10$oLoeg88KVwTQ.hdtzgUbheXrnREYrCSOTZzahfdL9ixAbkXnFRuKe', 'Vijay@9989', NULL, 'Warangal', '0', 8, 0, '9989292920', 'admin', '2025-06-02 15:36:04', '2025-06-02 15:36:04', NULL, NULL, NULL, NULL),
(1258, 'KASTURI SATHAIAH', '9985531685', '$2y$10$OfWWu08khPLKbzIcpDNJOON5a/j3RjZRWiM.rqOZdn1lFJ8hDUOiW', 'Addmagpro1234$', NULL, 'Jagityal', '0', 8, 0, '9985531685', 'admin', '2025-06-02 16:02:01', '2025-06-02 16:02:01', NULL, NULL, NULL, NULL),
(1259, 'Chinnakore indrasena reddy', '9849885672', '$2y$10$E0ekLL38JtHFY63fRKR/yu5.Ez8l16UMcVmKR9DPM0epiRlh9C10e', '050422', NULL, 'Anantapur', '0', 8, 0, '9849885672', 'admin', '2025-06-02 16:21:15', '2025-06-02 16:21:15', NULL, NULL, NULL, NULL),
(1260, 'BVV SATYANARAYANA', '9885619116', '$2y$10$LcW67KJqHdPtp27F/wE7vuLWXyTferjhy/HDXV43L8x.qsKCEcxwG', '$ethu$atish@12B', NULL, 'Hyderabad', '0', 8, 0, '9885619116', 'admin', '2025-06-02 18:07:49', '2025-06-02 18:07:49', NULL, NULL, NULL, NULL),
(1261, '5505mrk@gmail.com', '6281663089', '$2y$10$TRyPNhj28oQd9v/fBuJBVefFyGdF5esbCA1jpGB5kkQUmL5kRjN7G', '123mrk5505', NULL, 'Cheepurupalli', '0', 8, 0, '6281663089', 'admin', '2025-06-02 19:06:22', '2025-06-02 19:06:22', NULL, NULL, NULL, NULL),
(1262, 'Manohar', '7013154415', '$2y$10$GDiuaz3yU09tWb6rU/rM9umjg1Yj7I0KKbX/fDGPw.ROEQiBQUwaG', 'a.12345678..', NULL, 'Karimnagar', '0', 8, 0, '7013154415', 'admin', '2025-06-02 21:36:16', '2025-06-02 21:36:16', NULL, NULL, NULL, NULL),
(1263, 'Sambireddy', '9848174101', '$2y$10$4wWiplxsy70Bv8Mq85T.C.gwvEjJxV9nSnw3di5jDlDsow.vQbfoC', '99Rupa99@', NULL, 'Tadipalli', '0', 8, 0, '9848174101', 'admin', '2025-06-02 23:57:47', '2025-06-02 23:57:47', NULL, NULL, NULL, NULL),
(1264, 'Anilcheruku', '9014884422', '$2y$10$7Odvy6b4CxIcpcQcwEGMauC8b69f2zibDxYLWlmg/41yHVYaqR/Nu', 'Anil@9503', NULL, 'Amalupuram', '0', 8, 0, '9014884422', 'admin', '2025-06-03 00:22:24', '2025-06-03 00:22:24', NULL, NULL, NULL, NULL),
(1265, 'LUCKY', '9133445561', '$2y$10$7NKLzTAR5b0Jh.nRJk81Fu8OaFvIMezfL6Lxh9Wjvr7dTJaS8P7tq', 'Lucky@28', NULL, 'Hanamkonda', '0', 8, 0, '9133445561', 'admin', '2025-06-03 00:36:21', '2025-06-03 00:36:21', NULL, NULL, NULL, NULL),
(1266, 'Swaroop', '8374849164', '$2y$10$Nx06LKfQ.g2yCr5GuKfpEeCXToZ4vLbDARzUStPGwV8o7TAQ7z4CS', 'Kanna@swaroop1', NULL, 'Visakhapatnam', '0', 8, 0, '8374849164', 'admin', '2025-06-03 01:08:31', '2025-06-03 01:08:31', NULL, NULL, NULL, NULL),
(1267, 'Suresh Dasu', '9032457181', '$2y$10$WbzI4tfkg3zVm9mmXUdmMOrAHDQ43YsBThGb0Ut/JreIa3hD3Bvg2', 'Dasu@1977', NULL, 'Vuyyuru', '0', 8, 0, '9032457181', 'admin', '2025-06-03 02:18:03', '2025-06-03 02:18:03', NULL, NULL, NULL, NULL),
(1268, 'Srinivas s', '9059595335', '$2y$10$YNDHneiWjS1bS77TXNHrkeMWUAk4KbVruPPhtlobolX.x8tO45WBG', '3545', NULL, 'Anantapur', '0', 8, 0, '9059595335', 'admin', '2025-06-03 02:27:59', '2025-06-03 02:27:59', NULL, NULL, NULL, NULL),
(1269, 'Lourduraju pamisetty', '9642555535', '$2y$10$n2x9Ll3IJsCbQ7Hb1b/EYOtzI6SNacTAJJldhwRgDA2TIJXXrtkvy', 'Annamma#123', NULL, 'Nalgonda', '0', 8, 0, '9642555535', 'admin', '2025-06-03 02:32:04', '2025-06-03 02:32:04', NULL, NULL, NULL, NULL),
(1270, 'Ravi kanth', '9494539192', '$2y$10$ttd4IXIBZNYzZqy/2oCKQOeeOaws.PqrQbxwb5XfgnHpZuRgxLyxu', '9908252316', NULL, 'Secendrabad and hyderabad', '0', 8, 0, '9494539192', 'admin', '2025-06-03 02:43:43', '2025-06-03 02:43:43', NULL, NULL, NULL, NULL),
(1271, 'Venu.chunchu', '9885131919', '$2y$10$VdsiCZnWzkynUjkuHKBXcuJ9.uyE8EGgkjoY85wdNbPyBx8nrJ9by', 'Venu@007', NULL, 'కందుకూరు', '0', 8, 0, '9885131919', 'admin', '2025-06-03 03:10:43', '2025-06-03 03:10:43', NULL, NULL, NULL, NULL),
(1272, 'Madhav', '9966445269', '$2y$10$qhjRdcRo1T2r4UJlx/LADujAoQMAvYRLYCU6IuTg7pyTM4/5TmcKa', 'CHsunny@9966', NULL, 'Charla', '0', 8, 0, '9966445269', 'admin', '2025-06-03 03:54:53', '2025-06-03 03:54:53', NULL, NULL, NULL, NULL),
(1273, 'Vadde Madhavaraju', '9441478705', '$2y$10$Tp4JYmR6i.1oqNSeTPp04.nqIb.dAzDXU4JPyVKd3gxwhjRwUchtW', 'M9441478705r@', NULL, 'Dhone', '0', 8, 0, '9441478705', 'admin', '2025-06-03 05:24:11', '2025-06-03 05:24:11', NULL, NULL, NULL, NULL),
(1274, 'Mukka Bhasker', '9866037323', '$2y$10$d5NVn/9qkZhmcFBodAoxNO.vwCB8lW9i/rSsuNEcx4/UgSNtYrQ0S', '651880', NULL, 'Jangaon', '0', 8, 0, '9866037323', 'admin', '2025-06-03 07:05:10', '2025-06-03 07:05:10', NULL, NULL, NULL, NULL),
(1275, 'Udayram', '7989818110', '$2y$10$75RwTFeSSk.2mFKLgnwrB.Vg.rprSZUJ6bAoRdbku/wZa.wyih7cu', '8688868882ur', NULL, 'India', '0', 8, 0, '7989818110', 'admin', '2025-06-03 07:12:10', '2025-06-03 07:12:10', NULL, NULL, NULL, NULL),
(1276, 'Venugopal v', '7306456781', '$2y$10$v6l75pcF3q/FsfTaSfCK3.iztOFoCpVfhxmdYw7vQ/gjMYomPbUE2', 'Bishwakarma@99', NULL, 'Hyderabad', '0', 8, 0, '7306456781', 'admin', '2025-06-03 08:08:33', '2025-06-03 08:08:33', NULL, NULL, NULL, NULL),
(1277, 'MADHAVA REDDY', '9494444416', '$2y$10$JqoLGdSr21ZO1JC1IETQjuw5paTS0pQ9vT7Qjd.C/WS/8H9LMyhEi', '9494444416', NULL, '9494444416', '0', 8, 0, '9494444416', 'admin', '2025-06-03 08:51:01', '2025-06-03 08:51:01', NULL, NULL, NULL, NULL),
(1278, 'Kongali srikanth', '9985227707', '$2y$10$JYvyFVbN74L2v5Nwp6bTBee7szn4UZk4406.5IXMxL8dI4ty00/.O', '123456', NULL, 'Jadcherla', '0', 8, 0, '9985227707', 'admin', '2025-06-03 09:21:27', '2025-06-03 09:21:27', NULL, NULL, NULL, NULL),
(1279, 'D sumathi', '7730812356', '$2y$10$5A3lKO0LyDOva9DwVQdZBeLExg.EmL8RcBSn.4Qtlv6tU9TTU1Kfi', '123456', NULL, 'Wanaparthi', '0', 8, 0, '7730812356', 'admin', '2025-06-03 09:23:01', '2025-06-03 09:23:01', NULL, NULL, NULL, NULL),
(1280, 'B. Shailaja', '8121284142', '$2y$10$uWTNkqWkczwDmHbrCvEJOu6IzvYIReCj/22I79/AXZ2wc2Glwx0mO', '123456', NULL, 'Jadcherla', '0', 8, 0, '8121284142', '9985227707', '2025-06-03 09:23:04', '2025-06-03 09:23:04', NULL, NULL, NULL, NULL),
(1281, 'V RAMBABU', '9704544288', '$2y$10$hsHkbZ1yYZRRm9.8GOdfJ.W2kVVkfVKEkYHEJswR7/oQFwmolZgXC', '@2Rambabu', NULL, 'Vijayawada', '0', 8, 0, '9704544288', 'admin', '2025-06-03 09:42:37', '2025-06-03 09:42:37', NULL, NULL, NULL, NULL),
(1282, 'Krishnaveni r', '9290102631', '$2y$10$s1PsC3JZQ0R.XDgpUhyOhuH/k5187IQry03Znwts4ZCYBlDPXCYAG', '9290102631', NULL, 'Tirupati', '0', 8, 0, '9290102631', 'admin', '2025-06-03 12:02:43', '2025-06-03 12:02:43', NULL, NULL, NULL, NULL),
(1283, 'jlclement1971@gmail.com', '9652618257', '$2y$10$1tpxwAXM5CbHC9YVPRsBsewrn2kLImXsyYUHNm1eoCe/9k5LedkY.', 'jshanthi1978', NULL, 'Raghavendra nagar colony, Neredumet, Hyderabad', '0', 8, 0, '9652618257', 'admin', '2025-06-03 12:20:19', '2025-06-03 12:20:19', NULL, NULL, NULL, NULL),
(1284, 'Kishore', '7981323770', '$2y$10$0xfBwWrLVJ6v.5U1Qm4o3uf8TQigj1YVJTea2W5gOo5j/fTfxXxfK', 'Adithya@123', NULL, 'Hyderabad', '0', 8, 0, '7981323770', 'admin', '2025-06-03 12:45:01', '2025-06-03 12:45:01', NULL, NULL, NULL, NULL),
(1285, 'M.Tirupathireddy', '7989144792', '$2y$10$45z7AQ6uAnlhW/SjyPmdAeeiQQvz3USw6gSLCzxJbjM/hSjHFAcei', 'Mtreddy@143', NULL, 'Sathupall', '0', 8, 0, '7989144792', 'admin', '2025-06-03 13:31:49', '2025-06-03 13:31:49', NULL, NULL, NULL, NULL),
(1286, 'PRAKASH RAO', '9949048491', '$2y$10$fe/bKhcqAZvXpwRx9d.Rx.qKDGvH4/IkPoyqsQtFPzuu/fUPqHT5q', 'sdjpr1601', NULL, 'sdjpr1601', '0', 8, 0, '9949048491', 'admin', '2025-06-03 15:43:35', '2025-06-03 15:43:35', NULL, NULL, NULL, NULL),
(1287, 'Dr. Veerla. Srinivas', '9441897260', '$2y$10$X5.HE3.sgigkMW9bdcNsA.f1jQ2sleuVa3KSax/UBscv/ki0qjkOi', 'greate1', NULL, 'MEDAK', '0', 8, 0, '9441897260', 'admin', '2025-06-03 16:24:57', '2025-06-03 16:24:57', NULL, NULL, NULL, NULL),
(1288, 'ramana naik g v', '9849147572', '$2y$10$ly7PkO2Cww6xTY/GVTUovOhAAe2ucPLEg6OH.2e/lcVMFA8aacQqK', '9493142757', NULL, 'kurnool', '0', 8, 0, '9849147572', 'admin', '2025-06-03 19:32:11', '2025-06-03 19:32:11', NULL, NULL, NULL, NULL),
(1289, 'S SRINIVASA REDDI', '7013690622', '$2y$10$LaFzjEcYLpxrYEZ/hUqgm.UhWJobWLhT4Y0PNn17LGlQgYfuKXYf6', '7013690622', NULL, 'Hyderabad', '0', 8, 0, '7013690622', 'admin', '2025-06-03 23:15:35', '2025-06-03 23:15:35', NULL, NULL, NULL, NULL),
(1290, 'T Suresh', '7013101276', '$2y$10$vJicAd/FAhwe16elBWa/AethbJoQQM5uuiFp5Gmnk9/Pwr0OcuV2q', 'Sahithi@123', NULL, 'Parvathipuram', '0', 8, 0, '7013101276', 'admin', '2025-06-04 07:35:22', '2025-06-04 07:35:22', NULL, NULL, NULL, NULL),
(1291, 'Sriyansh', '9502131484', '$2y$10$cbsfOkAhyONtWjBoQftob.kk1eHtDFC/XXQGoUWKBiGqyKZCliz7a', '123456', NULL, 'Jadcherla', '0', 8, 0, '9502131484', '9985227707', '2025-06-04 10:39:45', '2025-06-04 10:39:45', NULL, NULL, NULL, NULL),
(1292, 'Prathap', '8464011025', '$2y$10$Y2ZLGp4YYZbWt7Ba2mxhZO0DBjQv6M1WX4UNddmxwTcku09lWBM0.', 'winz@Kmm25', NULL, 'Hyderabad', '0', 8, 0, '8464011025', 'admin', '2025-06-04 14:09:39', '2025-06-04 14:09:39', NULL, NULL, NULL, NULL),
(1293, 'Ashok Palavarapu', '7396090405', '$2y$10$UPajDH4bcMS/nY12LKhq3.D1Dwnxp6sMwqPY7KGVc/mVJgSj4Xjr2', 'BUR@123', NULL, 'Hyderabad', '0', 8, 0, '7396090405', 'admin', '2025-06-04 14:48:12', '2025-06-04 14:48:12', NULL, NULL, NULL, NULL),
(1294, 'Uday Gupta', '9110550699', '$2y$10$tw4lrUjTGtW0QcafAWBBc.5oWtJqZ1kXhSQ855RNx4TorVimhWKla', 'Omsai@1976', NULL, 'Suchitra', '0', 8, 0, '9110550699', 'admin', '2025-06-04 15:19:07', '2025-06-04 15:19:07', NULL, NULL, NULL, NULL),
(1295, 'kumareddysk@gmail.com', '9177524801', '$2y$10$H9HOUT/IJ7vlkoKfFVc/f.xQXultrlhaGxNT8QKSA/EyWswm0cE.W', '939@Reddy', NULL, 'Hyderabad', '0', 8, 0, '9177524801', 'admin', '2025-06-04 15:19:16', '2025-06-04 15:19:16', NULL, NULL, NULL, NULL),
(1296, 'Srinivas', '8074552448', '$2y$10$LwUzOjk02.hqaX54MVz6OujUR5jAO3bTEfPoZQE4GgZfAvDE0h5lG', 'Asdf@654', NULL, 'Asdf@654', '0', 8, 0, '8074552448', 'admin', '2025-06-04 16:40:32', '2025-06-04 16:40:32', NULL, NULL, NULL, NULL),
(1297, 'A Rakesh yadav', '9052960456', '$2y$10$.i6zi0OUd7e4BFguBB/Q6u9Bd1h3cILCGcBcA8.51N4iCVYU4LkNq', 'Aavyan@2224', NULL, 'Hyderabad Telangana', '0', 8, 0, '9052960456', 'admin', '2025-06-04 16:49:37', '2025-06-04 16:49:37', NULL, NULL, NULL, NULL),
(1298, 'srinivas', '9347101709', '$2y$10$.wlskRu12dhzl8uOBsAvQODb1T2Y3bEGKuoymyQkd9CUOm24ocHY6', 'vasu2abu', NULL, 'nellord', '0', 8, 0, '9347101709', 'admin', '2025-06-04 22:51:52', '2025-06-04 22:51:52', NULL, NULL, NULL, NULL),
(1299, 'chelamanipraveen', '9700121521', '$2y$10$wrvNh/unNuN6zn1M2nfOduyjmkLoDdpKBrop.Ruxo2ZSqJ3EiRcay', 'Pra@9700121521', NULL, 'hyderabad', '0', 8, 0, '9700121521', 'admin', '2025-06-05 01:55:18', '2025-06-05 01:55:18', NULL, NULL, NULL, NULL),
(1300, 'B SREEKNATH', '9014606506', '$2y$10$FHKQpp0fepcgjWLqj4WG1Ob7YtsMGNKczYFWnAgOnr2caLMDgNb4e', 'karbon13B', NULL, 'tanuku', '0', 8, 0, '9014606506', 'admin', '2025-06-06 15:39:40', '2025-06-06 15:39:40', NULL, NULL, NULL, NULL),
(1301, 'B SREEKNATH', '8688621900', '$2y$10$PQlLDLvDw3y.2FOMUi5yGuZeHSIQ0SprHfHdsCRGzAaG1U/Ge27/O', 'karbon13B', NULL, 'tanuku', '0', 8, 0, '8688621900', 'admin', '2025-06-06 15:40:49', '2025-06-06 15:40:49', NULL, NULL, NULL, NULL),
(1302, 'JILLA ASHOK', '9059091959', '$2y$10$2RnU4NIQkd0fi29MPT.jpuAIeMCicFK6zPopr3kThXrM.1UvhShWO', 'ashjay#9', NULL, 'Warangal', '0', 8, 0, '9059091959', 'admin', '2025-06-07 01:10:57', '2025-06-07 01:10:57', NULL, NULL, NULL, NULL),
(1303, 'Annadatha Murali Manohar', '8688763287', '$2y$10$6sRiI9VekyIJnHx155Ppwu0Dk4ApfzUjd3tWLhAA6S0XXQw2P9Zpi', 'avmm@2668', NULL, 'Hyderabad', '1000', 8, 0, '8688763287', '7702381784', '2025-06-12 18:16:23', '2025-06-07 13:18:29', NULL, NULL, NULL, NULL),
(1304, 'Neela Prasad Babu', '9642509307', '$2y$10$UgNnBcjWZfPIgXhIz03Ulex7rRIlSnIUcQR9EjQ2Ec/M..JxQ60KW', 'Loisbobby@2013', NULL, 'Tenali', '0', 8, 0, '9642509307', 'admin', '2025-06-08 21:09:31', '2025-06-08 21:09:31', NULL, NULL, NULL, NULL),
(1305, 'Sai kumar', '9440752582', '$2y$10$Gj8JXa9u987C/G6bUqK6VODltlJ1hiRTKaGYNuls8IdygKGXDunBS', 'jeevan@2009', NULL, 'Hyderabad', '0', 8, 0, '9440752582', 'admin', '2025-06-09 00:47:08', '2025-06-09 00:47:08', NULL, NULL, NULL, NULL),
(1306, 'Raja promodh', '9885777699', '$2y$10$SUHv5dW86nNNvE/5goDLK.prm.rzmfMTedVDSRJgzyDqFwtoeDJwq', 'raja1234', NULL, 'Vijayawada', '0', 8, 0, '9885777699', 'admin', '2025-06-09 08:48:18', '2025-06-09 08:48:18', NULL, NULL, NULL, NULL),
(1307, 'J m raj kumar', '9441530875', '$2y$10$q7rInIPx8QRPqlyZjT486uqeLB2ZFyw164IRQDYxx5Cv1nYOIt7mW', 'Crissy@123', NULL, 'Hyderabad', '0', 8, 0, '9441530875', 'admin', '2025-06-09 08:52:34', '2025-06-09 08:52:34', NULL, NULL, NULL, NULL),
(1308, 'kavithachary@gmail.com', '9849395931', '$2y$10$DxyzeCxn8/oYmbItaC1NzORWL1WTnlrOLzkv9FQgGgJecojV0.zJa', 'gkavitha@25', NULL, 'Secunderabad', '0', 8, 0, '9849395931', 'admin', '2025-06-09 16:22:39', '2025-06-09 16:22:39', NULL, NULL, NULL, NULL),
(1309, 'Moka raga vyshnavi', '9501324489', '$2y$10$XNGRyBK3q68wQWrJgnB/Jeku.lAvBQSI.HP582Pto7EPVISNO3Y5m', 'Raga1234', NULL, 'Hanamkonda', '0', 8, 0, '9501324489', 'admin', '2025-06-09 16:32:05', '2025-06-09 16:32:05', NULL, NULL, NULL, NULL),
(1310, 'Sowlahalli janardhana reddy', '9959590506', '$2y$10$.57Q8l1B3dAmbS0c8qmtLefFocS2iZdEaApUQvgS6NeV38.sOwggO', 'appu@2424', NULL, 'Kurnool', '0', 8, 0, '9959590506', 'admin', '2025-06-10 10:10:56', '2025-06-10 10:10:56', NULL, NULL, NULL, NULL),
(1311, 'Balakrishna Mogiligidda', '9393735393', '$2y$10$SBVEAzpwbT4MJH5/icfxKuFbQVC3S4UbjAlf9rwLgR9et/LrbOCuG', 'Addmag@001', NULL, 'Addmag@001', '0', 8, 0, '9393735393', '9348963999', '2025-06-10 11:41:34', '2025-06-10 11:41:34', NULL, NULL, NULL, NULL),
(1312, 'Anil kumar Kusume', '7569480462', '$2y$10$TBqThCPYPHgMLbdggNtVeeIAl0K9UdnigDE5zXLm7K/cisOK8KmL6', 'Zaq1xsw2@', NULL, 'Hyderabad', '0', 8, 0, '7569480462', '9348963999', '2025-06-10 11:45:01', '2025-06-10 11:45:01', NULL, NULL, NULL, NULL),
(1313, 'Kiran', '9505050899', '$2y$10$MVlrwlQfjIAFwblOdJCHtexQqErtFHWtDgBvkqZP98pUvvbsrY0dG', '12345', NULL, 'Kukatpally', '0', 8, 0, '9505050899', '9348963999', '2025-06-10 11:51:15', '2025-06-10 11:51:15', NULL, NULL, NULL, NULL),
(1314, 'Kumbaji.ravindar', '9441356519', '$2y$10$c1htOfevuuCsMJgchZ9Z8ussqZh.ojqtJzFBIJDLhctCbeq8Bc2SG', 'kr12356', NULL, 'Ncl', '0', 8, 0, '9441356519', '9348963999', '2025-06-10 11:51:29', '2025-06-10 11:51:29', NULL, NULL, NULL, NULL),
(1315, 'Vijay Krishhnaw', '8886113699', '$2y$10$zA633NCvGpTAdDTNpCEFoOAb6zK4Jj6lPFjcGket9kDLgbhywWIj2', 'Vijay@3456', NULL, 'Hyderabad', '0', 8, 0, '8886113699', '9348963999', '2025-06-10 11:57:25', '2025-06-10 11:57:25', NULL, NULL, NULL, NULL),
(1316, 'Sai Jagan', '9515705561', '$2y$10$Mga.pKYWONHLKfvteuUmk.gMqT..A5IwK/lMnY5Gl9Z98PEcuG1le', 'Iwonttellu19', NULL, 'Nizampet', '0', 8, 0, '9515705561', '9348963999', '2025-06-10 11:58:36', '2025-06-10 11:58:36', NULL, NULL, NULL, NULL),
(1317, 'Chitta Prasad', '9097599996', '$2y$10$OuJmfgjZr0sf7U0ecbim5ekggxF1LYyuWDXGFpFXrku.PV0A1t1DS', 'abc123', NULL, 'Uppal', '0', 8, 0, '9097599996', '9348963999', '2025-06-10 12:04:19', '2025-06-10 12:04:19', NULL, NULL, NULL, NULL),
(1318, 'Prasanthi', '9581530189', '$2y$10$iRqNnVAQWtlNbeJ2nciyfeidJSbMjXLmE2rbpyddAiirnMDaq8Xam', 'Nithya@30', NULL, 'Nizampet', '1000', 8, 0, '9581530189', '9348963999', '2025-09-05 05:04:36', '2025-06-10 12:04:54', NULL, NULL, NULL, NULL),
(1319, 'NIKKU BABU RAO', '9985084617', '$2y$10$aL6COK.XnFxskUT0RRY81uZek1XdhmLb4aT0ezjTIAjuCrniF.Znm', 'Babloo@542131', NULL, 'Musheerabad', '1000', 8, 0, '9985084617', '9348963999', '2025-06-12 03:18:27', '2025-06-10 12:12:28', NULL, NULL, NULL, NULL),
(1320, 'M SURESH KUMAR', '9000650307', '$2y$10$5cqoj.AdTvJz7x0LvY36QuthS7gK0TZZyd4BH/qyYPjP4hseDP8GK', 'Iwilldo*99', NULL, 'Bachupally', '1000', 8, 0, '9000650307', '9348963999', '2025-06-11 11:41:48', '2025-06-10 12:53:14', NULL, NULL, NULL, NULL),
(1321, 'Md Mahamood Pasha', '9666609812', '$2y$10$LL3ECVx8qDEvsKNZlYG3k.Jkw5vmW87Q6tjC4EkP0/igTp/dQ4TG.', 'Mrmint$$987', NULL, 'Basheer Bagh', '0', 8, 0, '9666609812', 'admin', '2025-06-10 12:56:47', '2025-06-10 12:56:47', NULL, NULL, NULL, NULL),
(1322, 'John William Myle', '9849639995', '$2y$10$BDkeV6aRwE73EZg4DSgQau26W0Z8C1C.UYpb6JJYEbGiifgDoJeye', 'Business_321', NULL, 'Secunderabad', '13000', 8, 13000, '9849639995', '9348963999', '2025-11-29 14:42:48', '2025-06-10 13:03:42', NULL, NULL, NULL, NULL),
(1323, 'K Manoj Kumar', '9100115604', '$2y$10$ViuWxxQere1tAn5rN1SS8ecZ/qe9jdjJlRtnbG7z0me41XLl7hE1e', 'Kevna1973', NULL, 'Kukatpally, Hyderabad', '0', 8, 0, '9100115604', 'admin', '2025-06-10 13:13:17', '2025-06-10 13:13:17', NULL, NULL, NULL, NULL),
(1324, 'RAMPRASAD', '9666996150', '$2y$10$am7hqHRrZHThxafuXw7DA.UelR6DWNqBaKx.qIzGyN7q9877b4Bfm', '9666996150Rr', NULL, 'Kurnool', '0', 8, 0, '9666996150', '9348963999', '2025-06-10 13:13:55', '2025-06-10 13:13:55', NULL, NULL, NULL, NULL),
(1325, 'G PRAVEEN KUMAR', '9396662235', '$2y$10$FN9EAUSjbpKIslHLlEpcCe5vAcNlkwv5CP304m7r.ZPNFW30EJODy', 'sweety22e5', NULL, 'Kphb colony', '0', 8, 0, '9396662235', 'admin', '2025-06-10 13:14:36', '2025-06-10 13:14:36', NULL, NULL, NULL, NULL),
(1326, 'K. Suresh kumar Goud', '8897148717', '$2y$10$vagh59R5VCwCpi06VcavDeqFl1iW5gS0Yqq0Tl66C8VT1hSIxL14e', '8897148717', 'assets/business_listing_images/suresh goud.jpeg', 'Kothapet', '1000', 8, 0, '8897148717', '9348963999', '2025-12-28 12:13:56', '2025-06-10 13:14:49', 'KOTHAPET', 'Hyderabad', 'Telangana', '500049'),
(1327, 'G V S Prasad', '7675910589', '$2y$10$wYE5cuipyN4apvxvLijmt.eve6/na21Mm5VZpZgxgY6d/jO1nX0v2', '8335', NULL, 'Chandhanagar', '1000', 8, 0, '7675910589', '9348963999', '2025-06-12 05:44:42', '2025-06-10 13:15:44', NULL, NULL, NULL, NULL),
(1328, 'Sri associates CA Firm', '9573171978', '$2y$10$7030anGW5cWpz2r6Z/Bh0.E0Hvk9qJJEyj8kZeHUWSTSPWK1u32oa', 'addmag', NULL, 'Hyderabad', '0', 8, 0, '9573171978', 'admin', '2025-06-10 13:18:45', '2025-06-10 13:18:45', NULL, NULL, NULL, NULL),
(1329, 'Tested', '9876987600', '$2y$10$zH0QT4O/5EjDv5.QpSIQKOCW8snn0HPWh5jLJKQ6RwN6bubkM6JBu', 'Test@123', NULL, 'Test@123', '0', 8, 0, '9876987600', 'admin', '2025-06-11 06:33:59', '2025-06-11 06:33:59', NULL, NULL, NULL, NULL),
(1330, 'Sheshhu', '9704566833', '$2y$10$XGBuZI8DJzvbl3cJI5MAzOWV0oE2f/8S0i8/jOYL2iKHw14z7VkkK', 'Mag@456', NULL, 'Hyderabad', '0', 8, 0, '9704566833', '9348963999', '2025-06-11 09:49:36', '2025-06-11 09:49:36', NULL, NULL, NULL, NULL),
(1331, 'Srikanth', '9666652224', '$2y$10$RPzZMtthj0fLEOvGITfDLOTu8TBPIuPJxkkXxS8rAHmt7Hdi6o.Be', '9666652224', NULL, 'Siddipet', '0', 8, 0, '9666652224', 'admin', '2025-06-11 15:04:32', '2025-06-11 15:04:32', NULL, NULL, NULL, NULL),
(1332, 'Ganji Eswaralingam', '9550894940', '$2y$10$F6Sa8rDj0LocgrNFnygvleZsArCT9YuS5Ra6OyhTD9lTY/uetY8K.', '123456', NULL, 'KPHB Hyd', '1000', 8, 0, '9550894940', '9348963999', '2025-06-13 06:14:41', '2025-06-12 04:34:36', NULL, NULL, NULL, NULL),
(1333, 'Kanchi Rajendra Kumar', '9160488882', '$2y$10$dnJ1JprHnjvEY9nkO5xmY.FexuUZ5a/xX8xSLsHa1D90XALuOgk26', 'Amc@1002', NULL, 'Manikonda', '1000', 8, 0, '9160488882', '9348963999', '2025-06-12 13:34:59', '2025-06-12 07:54:36', NULL, NULL, NULL, NULL),
(1334, 'Vudatha Nagaraju', '9951211704', '$2y$10$cLcT7DnbP2gkAM7OuOGDIOeHR6iSX4NNXj.ATPbREBi6n5ZLYqZru', 'Laasya@123', NULL, 'Kukatpally', '1000', 8, 0, '9951211704', '9348963999', '2025-06-16 16:04:59', '2025-06-12 07:56:03', NULL, NULL, NULL, NULL),
(1335, 'Naresh G', '9666597459', '$2y$10$XtWa4czjyvsXu4IwRjSDo.jbNdDnGqYcrYf0T0BQBdYWUTcBPntoi', 'Ekshu@1313', NULL, 'Vanasthalipuram', '0', 8, 0, '9666597459', 'admin', '2025-06-12 10:41:49', '2025-06-12 10:41:49', NULL, NULL, NULL, NULL),
(1336, 'SATYA N L N V BAYYANA', '9701001972', '$2y$10$CqdrYGfM2DQQRnBWBWDFmuE6qIFe8jWLlTmj/xRZrRId5Gv.ITgSS', 'Vyshu1506', NULL, 'HYDERABAD', '0', 8, 0, '9701001972', 'admin', '2025-06-12 13:07:21', '2025-06-12 13:07:21', NULL, NULL, NULL, NULL),
(1337, 'Krishna G', '9886188488', '$2y$10$JwJiHyuTCSBq9PnlukQEE.kbNPMN3z5a2RcauRfiiW71FbrC6RVZe', 'Roopag@123', NULL, 'Tirupathi', '0', 8, 0, '9886188488', 'admin', '2025-06-12 13:35:05', '2025-06-12 13:35:05', NULL, NULL, NULL, NULL),
(1338, 'Munaiah', '6304269255', '$2y$10$QvaxQEbaFjIK4lLe/4cPnePyOyvziVJHrlMKaxPbIqZc55mck0Kqe', '123456', NULL, 'Renigunta road ankura hospital opposite national car studio in tirupathi', '0', 8, 0, '6304269255', '7702381784', '2025-06-12 14:12:03', '2025-06-12 14:12:03', NULL, NULL, NULL, NULL),
(1339, 'G.Venkat Rao', '7981649037', '$2y$10$g30kq1VSbz3y6N.SMP1EBupwKBoktbIQ3eP.MUtpsPWxFdUROcwFq', '19670810', NULL, 'Hyderabad', '0', 8, 0, '7981649037', 'admin', '2025-06-12 14:46:32', '2025-06-12 14:46:32', NULL, NULL, NULL, NULL),
(1340, 'Sureshgoud', '8897148714', '$2y$10$kJaWARHPLygfwzUerqSQMeyGkoMvyM/P0uRWnChC3IJx0IxhoAyti', '889714', NULL, 'Kottapet', '0', 8, 0, '8897148714', '9348963999', '2025-06-12 15:48:18', '2025-06-12 15:48:18', NULL, NULL, NULL, NULL),
(1341, 'Shaik Yusuf Shariff', '9848666391', '$2y$10$5m35jDqO.I/fGrutccqqPOgieDccbBevfDtAQXTJkKt6H1IdT1kue', 'Shariff3@', NULL, 'Jangareddygudem', '0', 8, 0, '9848666391', 'admin', '2025-06-13 02:58:42', '2025-06-13 02:58:42', NULL, NULL, NULL, NULL),
(1342, 'S.lakshmi', '7981424258', '$2y$10$PHgQ48sU8cIDhcB0xBJyFuZTX0.4zlV/m./SRvUiEShKGwjLYCU7e', '987654', NULL, 'HYD', '1000', 8, 0, '7981424258', '9348963999', '2025-08-05 09:47:31', '2025-06-13 08:48:21', 'HYDERABAD', 'Hyderabad', 'Telangana', '500073'),
(1343, 'P santhi priya', '9493078866', '$2y$10$S3xUbqELKCzR5k2DLwkBqOExJxZeIfCu3u1YjsdZUMF5sRUd8SZBG', '123456', NULL, 'HYDERABAD', '1000', 8, 0, '9493078866', 'admin', '2025-06-16 16:14:25', '2025-06-14 07:09:56', NULL, NULL, NULL, NULL),
(1344, 'Hemanth Akkeni', '9390389616', '$2y$10$rCuGWVD8WSordT1tsu/ILuH8oUOgOThyx13HgOh42WbM3xameTZe6', 'Pandu@123', NULL, 'Hyderabad', '0', 8, 0, '9390389616', 'admin', '2025-06-14 14:58:21', '2025-06-14 14:58:21', NULL, NULL, NULL, NULL),
(1345, 'Satya Sreenivas', '6301524787', '$2y$10$GMdkS4gtxiWII17KIwsfq.7VkjuYMeiqz8S7B0GJIf17XsCakEML2', 'Ganesh@2011', NULL, 'Visakhapatnam', '0', 8, 0, '6301524787', 'admin', '2025-06-15 05:05:08', '2025-06-15 05:05:08', NULL, NULL, NULL, NULL),
(1346, 'L devi Tripura', '8897289653', '$2y$10$qjWc7snEBQwSYtpTASEnKOGpRQVqW.ntnF2/Z8ph43iMYXiOMZh5K', 'syam@1234', NULL, 'Peddinti vari Street, kothapeta, Eluru', '0', 8, 0, '8897289653', 'admin', '2025-06-15 06:55:01', '2025-06-15 06:55:01', NULL, NULL, NULL, NULL),
(1347, 'Revathi M', '9059213281', '$2y$10$AYcYMqp1rIOd3qAi/DrABelH0RYrdLGiZuElLi7Lt.iR/839nuH3u', 'Reva@570', NULL, 'Bachupally', '3000', 8, 3000, '9059213281', '9348963999', '2025-11-29 14:46:09', '2025-06-16 14:34:16', NULL, NULL, NULL, NULL),
(1348, 'A Hema Ch Venkata Kumar', '9491071229', '$2y$10$gaW41kvb4M.U2lnL1U/WGOOsBUk49d1Yy2YvdE6nrwcAbe1mqtIJO', '123456', NULL, 'Thumkunta', '1000', 8, 0, '9491071229', '7702381784', '2025-06-16 16:27:07', '2025-06-16 16:21:33', NULL, NULL, NULL, NULL),
(1349, 'M Anil', '9182841515', '$2y$10$g9B.7ZKL9BqzXT1qFlKpUeJN///nwm8zgkZO20QA0wL1dN4DOGkti', 'Anil264', NULL, 'Balapur', '0', 8, 0, '9182841515', 'admin', '2025-06-17 09:54:55', '2025-06-17 09:54:55', NULL, NULL, NULL, NULL),
(1350, 'Srinivas', '7799999449', '$2y$10$QIlLTtJUW5XFW631zjZiJOlYA.EQGSLOyv0UEeeP99x/1ttVzE.mm', 'Sak@1122', NULL, 'Karimnagar', '0', 8, 0, '7799999449', '7702381784', '2025-06-18 08:24:50', '2025-06-18 08:24:50', NULL, NULL, NULL, NULL),
(1351, 'N VENKATESH', '9014970133', '$2y$10$7hY.NqiDmrIVVfCq/eWQWunIR3NQQ9NcWSjfsRxWU828ayQ9NnM1m', '123456', NULL, 'RAJENDRANAGAR', '1000', 8, 0, '9014970133', '9491443072', '2025-06-19 07:48:49', '2025-06-18 12:06:52', NULL, NULL, NULL, NULL),
(1352, 'Dr M  kirankumar', '9177603413', '$2y$10$N5jo7kqx4ArHakoWIGxshOcPecx.1uNxUIlJ77zSqupQNNXdNadQC', 'kiran123', NULL, 'Rajendranagar', '0', 8, 0, '9177603413', '9014970133', '2025-06-19 07:13:03', '2025-06-19 07:13:03', NULL, NULL, NULL, NULL),
(1353, 'Dr M  kirankumar', '9063761343', '$2y$10$R2gmi61QHtgfqtljZL/RZuqG2UyKJ082PigbIVqO.tNInQOW0kO8u', 'kiran123', NULL, 'Rajendranagar', '1000', 8, 0, '9063761343', '9014970133', '2025-06-19 07:48:49', '2025-06-19 07:19:19', NULL, NULL, NULL, NULL),
(1354, 'ANeela Kanta Swamy', '9014170973', '$2y$10$FKgPbq0.vzO.u/z1YkGGjeXPFIuC3lv97k0hKYh62WhimKzW/Kzum', 'swamy@561', NULL, 'Hyderabad', '0', 8, 0, '9014170973', '7702381784', '2025-06-19 12:04:49', '2025-06-19 12:04:49', NULL, NULL, NULL, NULL),
(1355, 'Vasu ch', '8125869839', '$2y$10$/GM6xtd3mgWjoUSII4UibOuSFMcD27oBDL1x/uBsv08FZEGwz7YXa', 'Srini@123', NULL, 'Hyderabad', '0', 8, 0, '8125869839', 'admin', '2025-06-19 13:03:59', '2025-06-19 13:03:59', NULL, NULL, NULL, NULL),
(1356, 'Murali vaddi', '9291294522', '$2y$10$d5V1/8INqrcuPBD1apHJTe1fNT0CCmQQCVyyjB7sR4ZJVQemo7jhy', 'ideal2008', NULL, 'Motinagar', '0', 8, 0, '9291294522', '9063761343', '2025-06-21 09:51:20', '2025-06-21 09:51:20', NULL, NULL, NULL, NULL),
(1357, 'SHAIK YOUSUF JOHN', '7569544580', '$2y$10$LpNqaLu9tBGFMhP3oUPZTeBfNovra8t1hgnnJX/cwcGF4VoQ0iB/W', '123456', NULL, 'Uppal Hyd', '2000', 8, 0, '7569544580', '9348963999', '2025-06-26 16:29:45', '2025-06-26 15:47:21', NULL, NULL, NULL, NULL),
(1358, 'YAQOOB', '8328419693', '$2y$10$5VkqIEUEzraNAsIxr3W0Q.WuAgpnwsiRqEh4RdWOT5.5vmXj2TRwG', '123456', NULL, 'Uppal Hyd', '1000', 8, 0, '8328419693', '7569544580', '2025-06-26 16:29:45', '2025-06-26 16:25:07', NULL, NULL, NULL, NULL),
(1359, 'Vaddepally Bikshapathi', '8885130542', '$2y$10$1/xSwcUcIbVlN5qZtRobwu31vIMj3SjC48/qxWuFNSTb9ZwG8JMAi', '2010', NULL, 'East marredpally secunderabad', '0', 8, 0, '8885130542', '8309735119', '2025-06-28 08:25:16', '2025-06-28 08:25:16', NULL, NULL, NULL, NULL),
(1360, 'Mekala Shiva Kumar', '9393012334', '$2y$10$9dpj6ABdWEAdtfh8GeU.A.Z1YpwzPzdjgtANiaig7LMKCKJaY7RNe', '9393012334', NULL, 'Sainikpuri', '0', 8, 0, '9393012334', '8309735119', '2025-06-28 10:13:57', '2025-06-28 10:13:57', NULL, NULL, NULL, NULL),
(1361, 'M Krishna Murthy', '9246874439', '$2y$10$gIpEAKT/NPz1fqmsAPLld.d/y9az2tr6qjq2nxzkEAeIw/3sNsUHO', '9246874439', NULL, 'Ameerpet', '0', 8, 0, '9246874439', '8309735119', '2025-06-28 10:16:47', '2025-06-28 10:16:47', NULL, NULL, NULL, NULL),
(1362, 'Thota Kishore', '9848460745', '$2y$10$7PK9i3brZRKM3Nt59P.kAuvau0hP1e0mwqMIhd/Qxt4982dHWYaKG', '9848460745', NULL, 'As Rao nager', '0', 8, 0, '9848460745', '8309735119', '2025-06-28 10:20:37', '2025-06-28 10:20:37', NULL, NULL, NULL, NULL),
(1363, 'Indra', '8074500348', '$2y$10$BeothxdgdEAycVtNFNviTuSzGa/o.G2gD0OvFHXl/XILyv6pQoMbe', 'indra', NULL, 'Hyderabad', '0', 8, 0, '8074500348', 'admin', '2025-06-29 12:34:27', '2025-06-29 12:34:27', NULL, NULL, NULL, NULL),
(1364, 'shyam kumar allam', '7013894856', '$2y$10$ngXHlL4.fpKAOh1niLIR6.UIw58TmuEerVttfD9eysrjTmHME7juG', '123456', NULL, 'bachupally hyd', '0', 8, 0, '7013894856', 'admin', '2025-06-30 14:56:26', '2025-06-30 14:56:26', NULL, NULL, NULL, NULL),
(1365, 'Sai Raj Dhegavath', '7989770804', '$2y$10$6ahjJkuM9EfNKeL0TPZ56eUt1YCcF0JRyIwUmfnj4Wt6xHproQqA2', '504307', NULL, 'Hyderabad', '0', 8, 0, '7989770804', '9348963999', '2025-07-05 15:25:39', '2025-07-05 15:25:39', NULL, NULL, NULL, NULL),
(1366, 'Madasu Sambasivarao', '9030104775', '$2y$10$XM325YCSgyl5i.nLG3KLG.mhyCpNIZ5e0qfZIZeLKsDgF5pamzSfW', 'Sivajyoti@99', NULL, 'Guntur', '0', 8, 0, '9030104775', 'admin', '2025-07-08 14:12:21', '2025-07-08 14:12:21', NULL, NULL, NULL, NULL),
(1367, 'K SAMRAT', '9246351657', '$2y$10$RclP39b88IHe2KLuEXLO/.vaHr/xAWYheTqaeARPt2s52ihqa6DKS', '123456', NULL, 'Ramnagar hyd', '2000', 8, 0, '9246351657', 'admin', '2025-09-12 08:56:24', '2025-07-10 07:05:23', NULL, NULL, NULL, NULL),
(1368, 'J RAMYA', '9391037593', '$2y$10$m0ejM4Q18g1Tg5t99gsvkOBu3HCL/SeqFKAEv3CJzWCAawkXhb/Bm', '123456', NULL, 'Hyd', '0', 8, 0, '9391037593', '9246351657', '2025-07-10 07:23:10', '2025-07-10 07:23:10', NULL, NULL, NULL, NULL),
(1369, 'Dr. P Srinivas Kumar', '9849411451', '$2y$10$DwvuMb38Ckv.PIDgvcDip.RAVtZgIWwmsW/n1wYtz0QgZwPvFSG7C', 'karthi123', NULL, 'Hyderabad', '0', 8, 0, '9849411451', 'admin', '2025-07-11 04:32:30', '2025-07-11 04:32:30', NULL, NULL, NULL, NULL),
(1370, 'ADIRAJU SUBRAHMANYAM', '9395563366', '$2y$10$HJYeSdLB0gYG6sYVX/N1ZeJkruR1VkidTYo7FLQEvWxnIv9831MJS', 'Babu@1963', NULL, 'Kismatpur Bandlaguda jagir', '0', 8, 0, '9395563366', '8688763287', '2025-07-12 13:12:56', '2025-07-12 13:12:56', NULL, NULL, NULL, NULL),
(1371, 'Adapa Sivasankar Durgaprasad', '9014248548', '$2y$10$vDJB80F//O2SCXXLbKuPWuXZwhcz.zzskeVvnwUQ6VYlMsMIC7O42', '!271911Sh', NULL, 'Hyderabad', '0', 8, 0, '9014248548', 'admin', '2025-07-12 19:06:23', '2025-07-12 19:06:23', NULL, NULL, NULL, NULL),
(1372, 'Shaik Amjad', '7396425533', '$2y$10$UT0C0IkGetNaUnt44sleYeOFMNLp9r05RLoVu7vfMHbDs7bmBG5yi', '12345678', NULL, 'Khammam, Telangāna, INDIA', '0', 8, 0, '7396425533', 'admin', '2025-07-14 01:46:12', '2025-07-14 01:46:12', NULL, NULL, NULL, NULL),
(1373, 'Raffi Shaik', '9966585958', '$2y$10$sGfEBDVczBODzyiPg7DsE.CxoxOOZ84JWEtQc/joHHXIUH.v1cFqy', 'Pareena@123', NULL, 'hyderabad', '0', 8, 0, '9966585958', 'admin', '2025-07-15 09:19:07', '2025-07-15 09:19:07', NULL, NULL, NULL, NULL),
(1374, 'Anjaneyulu', '9849634495', '$2y$10$M92MKXqcPQEH88k8/bfCeOt6l96O4DENZ3gFna9k/fjNkYeAOGk02', '296697', NULL, 'Ecil', '0', 8, 0, '9849634495', '8309735119', '2025-07-15 11:56:11', '2025-07-15 11:56:11', NULL, NULL, NULL, NULL),
(1375, 'Madhu ponugoti', '8184988999', '$2y$10$9DebooNtQig.OHlpuE6WxOsrC1nbQ18VTuaschsv8nqBSWU1TpPSK', '123456', NULL, 'Hyd', '10000', 10, 0, '8184988999', 'admin', '2025-12-18 03:54:28', '2025-07-15 12:33:00', NULL, NULL, NULL, NULL),
(1376, 'P Anil Kumar', '9951552424', '$2y$10$ynT.ll93m3BlIWWtCc6UFu0ZsADJMOWaaO5oU8G7ahOOypCMP1S9u', 'Anil@5524', NULL, 'Hyderabad', '15000', 10, 0, '9951552424', '7702381784', '2026-03-10 04:46:05', '2025-07-15 12:34:05', NULL, NULL, NULL, NULL),
(1377, 'K Sumanth', '7331120829', '$2y$10$Kf9t88rruVmpSXA6C2DFAOOkB36qDgz6hrYO68XVXNwF2cTpwy42i', 'Mummy@143', NULL, 'Vanastalipuram', '0', 8, 0, '7331120829', '8309735119', '2025-07-15 13:24:19', '2025-07-15 13:24:19', NULL, NULL, NULL, NULL),
(1378, 'Hariprasad V', '9885883600', '$2y$10$PkRoDgcMY95RpJBJpLzqxe6PpVoRDeIbf92d2yfINbs0Ow2OVTCHC', '123456', NULL, 'ECIL hyd', '0', 8, 0, '9885883600', '8309735119', '2025-07-15 13:26:21', '2025-07-15 13:26:21', NULL, NULL, NULL, NULL),
(1379, 'Sri Vasavi Homes', '9059102066', '$2y$10$iio/WzW.Jk6f9Hp/9Bfg2./PPxtQ8jDwKot7jdR4sUlxVbYwoPuQu', 'madhoo', NULL, 'Hyderabad', '0', 8, 0, '9059102066', '8309735119', '2025-07-15 13:27:32', '2025-07-15 13:27:32', NULL, NULL, NULL, NULL),
(1380, 'NAVEEN KUMAR', '9059597787', '$2y$10$d.cOlEtXUJw7sY4JNNHMv.vTyeRSQyJzkqNmqT0MQCt0fZLGNQC52', '123456', NULL, 'HYDERABAD', '0', 0, 0, '9059597787', '8184988999', '2026-01-14 04:38:59', '2025-07-15 17:40:20', NULL, NULL, NULL, NULL),
(1381, 'NARENDER', '9160367222', '$2y$10$NSUeDML9WTqwFRSO3fFgZeWQ8Do80ZXVRT1d0v.zNFAmI3uwj5Lna', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9160367222', '8184988999', '2025-07-15 17:42:19', '2025-07-15 17:42:19', NULL, NULL, NULL, NULL),
(1382, 'RAVI RAJA', '7799976613', '$2y$10$Fy8xNDwSk6U3IrA.iUcYX.c/lrCnAGYYxaWKP2Ly2kTEiXd2aMRJe', '123456', NULL, 'HYDERABAD', '0', 8, 0, '7799976613', '8184988999', '2025-07-15 17:44:36', '2025-07-15 17:44:36', NULL, NULL, NULL, NULL),
(1383, 'SRINIVAS GOUD', '9346932668', '$2y$10$IvLYovueafhk3IRdcl4wveGTA1iasFtutz16K7n1y.2tJsOnJhJfK', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9346932668', '8309735119', '2025-07-15 17:58:37', '2025-07-15 17:58:37', NULL, NULL, NULL, NULL),
(1384, 'N PAVAN KUMAR', '9100918002', '$2y$10$YsV6Xvn0hqJd5jFsS4NlhOYt78Xd4jy4cY6xKFUTj2V6LbqrhuD1O', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9100918002', '8309735119', '2025-07-15 17:59:36', '2025-07-15 17:59:36', NULL, NULL, NULL, NULL),
(1385, 'S USHASHREE', '7207382429', '$2y$10$agZRURxH8V/Lbe3PPsIl2uo23XjQd6AvXtdN1gBipl9q7g7TaXWGm', '123456', NULL, 'HYDERABAD', '0', 8, 0, '7207382429', '8309735119', '2025-07-15 18:01:15', '2025-07-15 18:01:15', NULL, NULL, NULL, NULL),
(1386, 'NARESH', '9700324813', '$2y$10$blgREqkUoMd0gdrtje.fcOZrXKxEK5xjRPo74Q.Fy5QgSs.nx26oG', 'ADMIN', NULL, 'HYDERABAD', '0', 8, 0, '9700324813', '8309735119', '2025-07-15 18:02:22', '2025-07-15 18:02:22', NULL, NULL, NULL, NULL),
(1387, 'KISHOR AAJU BAAJU', '7207817237', '$2y$10$mVAELXi2mMqhnXC5pMipZezA8a/cndX35Ki7YsWITT5vc47Vnxlai', 'ADMIN', NULL, 'HYDERABAD', '0', 8, 0, '7207817237', '8309735119', '2025-07-15 18:03:37', '2025-07-15 18:03:36', NULL, NULL, NULL, NULL),
(1388, 'KISTAIAH', '9395166375', '$2y$10$.b1hTUvDXXxilB3eydDs8evN2kNtxBCEMSnrfJOT.5K66SvnZZiCu', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9395166375', '7702381784', '2025-07-15 18:06:37', '2025-07-15 18:06:37', NULL, NULL, NULL, NULL),
(1389, 'CH RAMCHANDER', '9705910096', '$2y$10$eMMxrR0hrH89B1585HjliuHEK8fqOvVw/tNbKYdC9mhE29/PNdyxC', '123456', NULL, 'ARAAMGHAR HYD', '3000', 8, 0, '9705910096', '9491443072', '2025-09-03 08:06:57', '2025-07-18 12:46:29', NULL, NULL, NULL, NULL),
(1390, 'P SRINIVAS', '9010732668', '$2y$10$jdt/FUdisapJZ9O/0grJ3e3lfeHWx7ZG892Q7qJuSRhKyZz8qERgu', '123456', NULL, 'CHOWDARYGUDA', '0', 8, 0, '9010732668', '9705910096', '2025-07-18 12:51:25', '2025-07-18 12:51:25', NULL, NULL, NULL, NULL),
(1391, 'M RAMESH', '9848478813', '$2y$10$u2q6jvLMOb.mE07P34xArO/d5Tet7gzUJPIuboU3MrnR6XtLYpMiC', '123456', NULL, 'CHOWDARYGUDA', '0', 8, 0, '9848478813', '9705910096', '2025-07-18 12:59:45', '2025-07-18 12:59:45', NULL, NULL, NULL, NULL),
(1392, 'M RAVI', '6302874558', '$2y$10$SJ0q4cMTNivfKmjYlvzDlO8hhAE7i8Ko/RhsEfu18jdgMMwSPUcWG', '123456', NULL, 'CHOWDARYGUDA', '0', 8, 0, '6302874558', '9848478813', '2025-07-18 13:01:24', '2025-07-18 13:01:24', NULL, NULL, NULL, NULL),
(1393, 'G MADHU', '8142563253', '$2y$10$XZlQLk5Oi1LQTsf.43tIV.08HD0GCDbAInr09zatNp6FnSOfyXnJa', '123456', NULL, 'CHOWDARYGUDA', '0', 8, 0, '8142563253', '9010732668', '2025-07-18 13:37:53', '2025-07-18 13:37:53', NULL, NULL, NULL, NULL),
(1394, 'Dr Raghu', '9000383608', '$2y$10$f7S8CmK/TlwBcVT.PEwFnutAPp0RB/ZOtYvmQJhBaG3iCAFN759vO', '123456', NULL, 'Miyapur hyd', '0', 8, 0, '9000383608', '7702381784', '2025-07-19 03:17:45', '2025-07-19 03:17:45', NULL, NULL, NULL, NULL),
(1395, 'Diwakar', '9966985858', '$2y$10$Y/loVQLXhae3bQDtKaXwyOV1O6QaYWUNF0RTf.cD8dY/cVTLnUEZu', '123456', NULL, 'Hydrabad', '0', 8, 0, '9966985858', '7702381784', '2025-07-19 03:19:41', '2025-07-19 03:19:41', NULL, NULL, NULL, NULL),
(1396, 'saikiran', '9705652999', '$2y$10$TeATKGStwbd06.G/LQpJC.erIIvrkU6PsEYdCeKoilhF6Ph4Z/9sa', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9705652999', '7730099707', '2025-07-20 14:28:37', '2025-07-20 14:28:37', NULL, NULL, NULL, NULL),
(1397, 'K Hari Prasad', '9908279312', '$2y$10$Jr479AMQv634xLsAasMxve.i6FTeyRSePsE.eo67qZ7K0O6uUPb6.', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9908279312', '7730099707', '2025-07-20 14:31:25', '2025-07-20 14:31:25', NULL, NULL, NULL, NULL),
(1398, 'Laxmiveeresh Marthi', '9951164521', '$2y$10$/2odd1la6SsIzG2mKtZD..H7YH3IGyADyPkb9IVAeaACbCsyKWQg6', '123456', NULL, 'HYDERABAD', '1000', 8, 0, '9951164521', '7730099707', '2025-07-31 11:39:38', '2025-07-20 14:32:47', NULL, NULL, NULL, NULL),
(1399, 'Vicky', '9160992916', '$2y$10$tRBn6Ufe0T8tWrIk0MpWQegWfXXLXfQtf.1r.Amou6WzwJysqSja2', 'Honey@22', NULL, 'Hyderabad', '0', 8, 0, '9160992916', 'admin', '2025-07-21 03:05:57', '2025-07-21 03:05:57', NULL, NULL, NULL, NULL),
(1400, 'Sameer', '9030387947', '$2y$10$U3q.Ks.UV7y1270eCcBnmeeKCX2V4gYc37jj2ageuDkYWj24JInQu', 'Sam@12345', NULL, 'Sam@12345', '0', 8, 0, '9030387947', 'admin', '2025-07-21 03:44:39', '2025-07-21 03:44:39', NULL, NULL, NULL, NULL),
(1401, 'B ANIL', '6300599075', '$2y$10$XU2x8/ygR7tVOiGIzw3oMOyPMn9cEpuj9U620VH7gy9tj4HWIfj2G', '123456', NULL, 'LB NAGAR', '0', 8, 0, '6300599075', '7702381784', '2025-07-21 07:29:24', '2025-07-21 07:29:24', NULL, NULL, NULL, NULL),
(1402, 'Sai...', '8801043004', '$2y$10$J1nT6ekxX7E/mgMztySs9uJ4QHrBocu9YctyNIN9L8pOwkuJXnBo.', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8801043004', '7730099707', '2025-07-21 12:25:55', '2025-07-21 12:25:55', NULL, NULL, NULL, NULL),
(1403, 'Vrajesh Kumar', '9849007359', '$2y$10$6XJc46hqfgOPTldF.5iWHup1cfC./kwzBQ6oD5WoCQOAb4WqxZVbG', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9849007359', '7730099707', '2025-07-21 12:28:35', '2025-07-21 12:28:35', NULL, NULL, NULL, NULL),
(1404, 'Ravi Kumar', '9849112208', '$2y$10$67KKaASFbXauSGo0Ckzby.h4M3yI.s1t3WMmtHJIO49HBOZTEEfoC', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9849112208', '7730099707', '2025-07-21 12:30:45', '2025-07-21 12:30:45', NULL, NULL, NULL, NULL),
(1405, 'Sai Kiran SR', '9959777829', '$2y$10$qFalKUNbR2Hqypq9YlgbOu0cWhk.gmc9HD79u.LEjVJnagiaddciG', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9959777829', '7730099707', '2025-07-21 12:32:21', '2025-07-21 12:32:21', NULL, NULL, NULL, NULL),
(1406, 'Krishna', '7760225959', '$2y$10$Y8sNKqwtKKHEeRlL6LMbLuheaAiHcS7cLQb8lYCk/rKMi/u9TcPi.', '123456', NULL, 'HYDERABAD', '0', 8, 0, '7760225959', '7730099707', '2025-07-21 12:33:54', '2025-07-21 12:33:54', NULL, NULL, NULL, NULL),
(1407, 'Srinivad', '9246544986', '$2y$10$vbB8OO2BC.kYC4XzBA0C7.pK7RYLBHXCJ6n67E30Ow7doBXHlUm.W', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9246544986', '7730099707', '2025-07-21 12:36:52', '2025-07-21 12:36:52', NULL, NULL, NULL, NULL),
(1408, 'Philomena', '7993506076', '$2y$10$ypk.Ew9tTAda7CGeDKKt..VesowuyBsth68otYXdYxFcS9bAqmday', '123456', NULL, 'HYDERABAD', '0', 8, 0, '7993506076', '8522881144', '2025-07-21 12:48:14', '2025-07-21 12:48:14', NULL, NULL, NULL, NULL),
(1409, 'BCH India', '6281994649', '$2y$10$cZFallMSAFWffM9nLwOm8OY/QD/bhVY7d4qHbW2MO93As7WB35v9e', '123456', NULL, 'HYDERABAD', '1000', 8, 0, '6281994649', '8522881144', '2025-08-03 16:00:11', '2025-07-21 13:02:28', 'Madhapur', 'Hyderabad', 'Telangana', '500081'),
(1410, 'AMAIRA SHAIKH', '8019733874', '$2y$10$UAmLQdLuAU/.an1VSigbL.2KNhgQfSkAC2b3j45qs4muNng71j4V6', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8019733874', '8522881144', '2025-07-21 13:03:15', '2025-07-21 13:03:15', NULL, NULL, NULL, NULL),
(1411, 'Venkatesham P', '9246370899', '$2y$10$M0bjesU1ppH9f4KleoAqjeBB.Isy/ylAC.Ye1c/jNdVCHeidlyQfO', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9246370899', '8522881144', '2025-07-21 13:06:21', '2025-07-21 13:06:21', NULL, NULL, NULL, NULL),
(1412, 'Ravindra Lal J', '8686584668', '$2y$10$j/qnDSAWA/FINd7qj7OsPO5xVbt5yN4oPy2nQ0jX8XfeK9Xeuxsm.', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8686584668', '8522881144', '2025-07-21 13:07:18', '2025-07-21 13:07:18', NULL, NULL, NULL, NULL),
(1413, 'G Parameshwat', '8919372692', '$2y$10$T86nlkiZAFvC2tLjALXzWu4yY1PyMeLRznJhbHxD.zXyjqKtLCona', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8919372692', '8522881144', '2025-07-21 13:09:56', '2025-07-21 13:09:56', NULL, NULL, NULL, NULL),
(1414, 'T Anand kumar', '9247424216', '$2y$10$Ki369vXI2YlTkojIGJgjGOFCUZZ.vByRfSy6SdWO0GAUkGmOt3cle', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9247424216', '8522881144', '2025-07-21 13:10:52', '2025-07-21 13:10:52', NULL, NULL, NULL, NULL),
(1415, 'Rajesh', '8143050505', '$2y$10$yEN8quanC1jmCTHmEeAIXuSwbxEbecxjpsFsEc8rMw4IQM0wGETHS', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8143050505', '8522881144', '2025-07-21 13:13:34', '2025-07-21 13:13:34', NULL, NULL, NULL, NULL),
(1416, 'Ashwin Kumar Chena', '9848081999', '$2y$10$5b2YuPivTC8OAWwQ660WD.8cnZuGc1Nqhag.F5vs8KoewJvKEy4NO', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9848081999', '8522881144', '2025-07-21 13:14:20', '2025-07-21 13:14:20', NULL, NULL, NULL, NULL),
(1417, 'Ramana Murty', '9381594964', '$2y$10$A.DC/hHXX.Ns/mekHdhq6eQRZNStUCYch9G9v8nPw4vplUJpiETSm', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9381594964', '7702381784', '2025-07-21 13:22:50', '2025-07-21 13:22:50', NULL, NULL, NULL, NULL),
(1418, 'Mani Sharma', '9440969362', '$2y$10$LDbpFJqSuKy7R0z3qj/onuWjRghiPsqyKfkgPFKhY2jb7Rp0bt4o6', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9440969362', '7702381784', '2025-07-21 13:23:31', '2025-07-21 13:23:31', NULL, NULL, NULL, NULL),
(1419, 'RAVEE GUPTA', '9866154333', '$2y$10$/0c2SJYn546ESZXfuBaifeLE.BagdEYl8P6q43FWBUnT9Bn8z1Sci', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9866154333', '7702381784', '2025-07-21 13:29:02', '2025-07-21 13:29:02', NULL, NULL, NULL, NULL),
(1420, 'Money Sairam', '8185065069', '$2y$10$04VsrUo55nOufPBZZ03EFOrTPj8y.GlEJDrRh3US/99JmLu0VOk6K', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8185065069', '7702381784', '2025-07-21 13:37:04', '2025-07-21 13:37:04', NULL, NULL, NULL, NULL),
(1421, 'Shankar Kamble', '9949612538', '$2y$10$SLInf6ela08G.kqEsN7k1O7yFiO777KYhjSmGQDj8twdqjShYoYQ2', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9949612538', '7702381784', '2025-07-21 13:49:04', '2025-07-21 13:49:04', NULL, NULL, NULL, NULL),
(1422, 'Kodandapani', '8520008752', '$2y$10$l2VN5W7zXpIXW3ybsRwkuORe6b9fzLLF.VzOK3n4MgyBCv2W.i0Iy', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8520008752', '7702381784', '2025-07-21 13:51:06', '2025-07-21 13:51:06', NULL, NULL, NULL, NULL),
(1423, 'Uday  Gupta', '8712783881', '$2y$10$v6sqCv.CYaLxloRoZ1Pe2u3q0IU.I.d8ZsHVbbEhZXCB1qA4SGK7O', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8712783881', '7702381784', '2025-07-21 14:04:53', '2025-07-21 14:04:53', NULL, NULL, NULL, NULL),
(1424, 'Naresh Galidevara', '8977969697', '$2y$10$h9TN42nDy.xhrYdqUTxB4O8osNzSSI536jZKx1WnGfNYzON5Y3O8e', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8977969697', '8522881144', '2025-07-21 14:06:45', '2025-07-21 14:06:45', NULL, NULL, NULL, NULL),
(1425, 'Srikar', '9999999999', '$2y$10$cGUbU7Rng7v4va0rryfFSeA/nD9VsYuSIqAQHQJKOpaMdeurs4xJa', '123456', NULL, '123456', '0', 8, 0, '9999999999', 'admin', '2025-07-22 16:53:10', '2025-07-22 16:53:10', NULL, NULL, NULL, NULL),
(1426, 'Upender', '9392266092', '$2y$10$ApEb.OSVbAhPSe2fRRrWs.lCL9c0ECZrrlwn7cAWFj3CxDLoApwHS', 'srinivascharan', NULL, 'Hyatnagar near new vision school', '0', 8, 0, '9392266092', 'admin', '2025-07-23 04:14:02', '2025-07-23 04:14:02', NULL, NULL, NULL, NULL),
(1427, 'Deepthi Gutlapalli', '9133098999', '$2y$10$SBpBWrrWUN3SaNPIr6p0XuBiBBMMK0tN9ISG8UBsu8.qcP2vajb66', 'Deepthi@2003', NULL, 'Kphb', '0', 8, 0, '9133098999', 'admin', '2025-07-23 09:49:07', '2025-07-23 09:49:07', NULL, NULL, NULL, NULL),
(1428, 'Narayana', '8143413434', '$2y$10$Pa3ipgucJjj3T8woBP.rPOz1jxj2mZGEK40avw1q/OUv6ZYwVH.A2', '8143413434', NULL, 'Secundrabad', '1000', 8, 0, '8143413434', 'admin', '2025-08-05 11:12:41', '2025-07-23 09:50:19', NULL, NULL, NULL, NULL),
(1429, 'S PRAKASH REDDY', '9885045327', '$2y$10$RpWUwjZd5cAXr3HYkBEYGuZ9m7bSKfPraZZpTQRfJIoqv0zNc157.', 'reddy@1818', NULL, 'SAIDABAD', '0', 8, 0, '9885045327', '9177534011', '2026-02-21 03:01:37', '2025-07-23 09:51:32', NULL, NULL, NULL, NULL),
(1430, 'Shankar reddy', '9032233306', '$2y$10$gVtHvUYbJNTP.gmQehEx..gkX6GThFE5EMl76WkDWJa.r9alFDoau', 'Hiiamshankar1@', NULL, 'Kphb', '0', 8, 0, '9032233306', 'admin', '2025-07-23 09:52:06', '2025-07-23 09:52:06', NULL, NULL, NULL, NULL),
(1431, 'Ravichandra kosuru', '9398536745', '$2y$10$I6qvGgwpEWaaFgTGVIV6dOYMx8HizkpuZxurWoVKmJh6ysDms1gVO', 'Rr@9989852436', NULL, 'Hyderabad', '0', 8, 0, '9398536745', 'admin', '2025-07-23 12:53:04', '2025-07-23 12:53:04', NULL, NULL, NULL, NULL),
(1432, 'T Rajasekhar', '9502981059', '$2y$10$8kZwCLjG6zLyN9AiDj4j2.d/C3p7WlNo8EgHhYhni8hbyUa00o23K', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9502981059', '7013894856', '2025-07-24 04:11:31', '2025-07-24 04:11:31', NULL, NULL, NULL, NULL),
(1433, 'A Jagadeesh Babu', '9290094490', '$2y$10$I2M3q92MDTc9PSYR50BH9.mvyE.dt5T0fCTM.YIX/36VLDcpiSwaK', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9290094490', '7013894856', '2025-07-24 04:13:23', '2025-07-24 04:13:23', NULL, NULL, NULL, NULL),
(1434, 'Chitta Prasad', '9032919291', '$2y$10$DP8DkQWA06SJlZ5fPFhqEu6Ifg5r7g7eZ7OaUvHj4J9vAFwwMbHIq', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9032919291', '8522881144', '2025-07-24 04:19:42', '2025-07-24 04:19:42', NULL, NULL, NULL, NULL),
(1435, 'Sanvika', '8519837818', '$2y$10$XlkfGwMJli.zYba/zOscPu5KIYxcRNOdXcj1gdl9pHPWS7Ptz.dca', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8519837818', '8522881144', '2025-07-24 04:21:11', '2025-07-24 04:21:11', NULL, NULL, NULL, NULL),
(1436, 'Raghavender', '8639167818', '$2y$10$qH5QlDAp9Gk0ULK0De6rv.HO8cs3FjOsc.5mR7sep9rtZXmii6i06', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8639167818', '8522881144', '2025-07-24 04:22:35', '2025-07-24 04:22:35', NULL, NULL, NULL, NULL);
INSERT INTO `service_users` (`service_id`, `member_name`, `member_phone`, `password`, `open_password`, `user_profile_pic`, `location`, `cumulative_gross`, `commission_percentage`, `back_two_back_balance`, `referral_id`, `referral_by`, `created_at`, `joined_date`, `address`, `city`, `state`, `pincode`) VALUES
(1437, 'Brahma Prakash', '9985396789', '$2y$10$UJw8/ZIfcTi0WYFVRXcQSe8duuENs0FrIiQBrdZqJvsFkhURaJb7m', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9985396789', '8522881144', '2025-07-24 04:45:46', '2025-07-24 04:45:46', NULL, NULL, NULL, NULL),
(1438, 'IMRAN DAWOOD SHAIKH', '9657537755', '$2y$10$OmwgMASka.//p9V23dzYqeUsXwmLWUE095wBvk.mTyyFuPu9YCwhG', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9657537755', '8522881144', '2025-07-24 04:46:59', '2025-07-24 04:46:59', NULL, NULL, NULL, NULL),
(1439, 'HARINATH NEELA', '7680803119', '$2y$10$MvcJVVMBoKh9ErwuIe0PkO3SuhE3DyhGug9eJMHNzI3NxlSid6lpa', '123456', NULL, 'KACHIGUDA HYD', '1000', 8, 0, '7680803119', 'admin', '2025-08-21 14:44:41', '2025-07-24 08:55:42', NULL, NULL, NULL, NULL),
(1440, 'Satyavathi kosuru', '9493010456', '$2y$10$ylNxbhdz3Qwz6uaPl6R0KOnGQY/qE6SvyY6DDMZxUXgk/RFZ4IdUe', 'Rr@9989852436', NULL, 'Nuzvid', '0', 8, 0, '9493010456', '9398536745', '2025-07-25 06:54:46', '2025-07-25 06:54:46', NULL, NULL, NULL, NULL),
(1441, 'Ganta Naga sirisha', '9441237620', '$2y$10$EUOHv88ELO9zn9uVU0tXNeuzSjinwP8Bmgqh65jwI.7yShHZLxzHm', '123456', NULL, 'Hyderabad', '0', 8, 0, '9441237620', '9398536745', '2025-07-25 07:23:26', '2025-07-25 07:23:26', NULL, NULL, NULL, NULL),
(1442, 'Ch Naga Durga Prasad', '7842492612', '$2y$10$TPEGSn5kdxl6rc3NmfRbTex81L4tnQ.GTiDxXZpvsl1PAXE/ghOLm', '123456', NULL, 'JNTU', '0', 8, 0, '7842492612', '7013894856', '2025-07-25 08:53:22', '2025-07-25 08:53:22', NULL, NULL, NULL, NULL),
(1443, 'Jhnapika', '7207141470', '$2y$10$ms3pco102SvGHNg9nLDdKe0jWSRiQzD51h2TJVaD3QQzsJQ5vkOQ2', 'TanushaSree1436', NULL, 'Vijayawada', '0', 8, 0, '7207141470', '7013894856', '2025-07-25 18:51:12', '2025-07-25 18:51:12', NULL, NULL, NULL, NULL),
(1444, 'kiran singh', '9866269296', '$2y$10$.fMOnPRX/VThKXCpNZI3D.H4Ln/PzOafJqGMgFjS1qotZE61MutjG', 'Kiran@151985', NULL, 'Kiran@151985', '0', 8, 0, '9866269296', 'admin', '2025-07-26 10:57:20', '2025-07-26 10:57:20', NULL, NULL, NULL, NULL),
(1445, 'amdraeozn', '9998887776', '$2y$10$JnaC9cKuq7NejFrZp8JAYO8NmGnUdI2MohGQMAwbSmMuPoJ.EGyrG', '123456', NULL, 'hyderabad', '0', 8, 0, '9998887776', 'admin', '2025-07-27 09:59:34', '2025-07-27 09:59:34', NULL, NULL, NULL, NULL),
(1446, 'Sweta', '7674068579', '$2y$10$qVA4gxMCh4uEYVbLnusQDuFQp3bhhmZXylD2fiYnjEob7R1Xgu6tq', 'Swetha_mdd1@', NULL, 'Hyderabad', '1000', 8, 0, '7674068579', 'admin', '2025-09-03 07:27:41', '2025-07-28 10:23:13', NULL, NULL, NULL, NULL),
(1447, 'Lingampali.venkatesh', '9533524011', '$2y$10$AdEUq8zJCQy1VCWL0Mngde4EslYSNZF1KDpnGNNevZXA94yLBr1b6', '123456', NULL, 'North lallaguda', '0', 8, 0, '9533524011', '8143413434', '2025-07-28 13:47:51', '2025-07-28 13:47:51', NULL, NULL, NULL, NULL),
(1448, 'Ashok', '8688399447', '$2y$10$kEX5AHHXXKb6kC6cwltdKedQhsvkluuzgYTygNp7JhUXbZH0yQNmK', 'zxcvbnmas', NULL, 'hyderbad', '0', 8, 0, '8688399447', 'admin', '2025-07-29 08:16:47', '2025-07-29 08:16:47', NULL, NULL, NULL, NULL),
(1449, 'Capt Uday Ratnalikar', '8106926711', '$2y$10$ozqiR25Jzus407XuJ0g44udTxerLbwl8yQcuN28c96Lyj8ODVYYoy', '123456', NULL, 'HYDERABAD', '1000', 8, 0, '8106926711', 'admin', '2025-07-29 08:42:00', '2025-07-29 08:30:29', NULL, NULL, NULL, NULL),
(1450, 'G.SRINIVAS GOUD', '9849235288', '$2y$10$Ll8g6A.gTO0MrHMLs0t7K.PD7DkxKKcQxdFXzMzUCzhkdyQa8uPkK', '123456', NULL, 'NAGOLE HYD', '1000', 8, 0, '9849235288', 'admin', '2025-07-29 08:35:51', '2025-07-29 08:31:35', NULL, NULL, NULL, NULL),
(1451, 'G Swamy', '9032251199', '$2y$10$zxE0R/lPF4WIkcUfyjIkQuKnnYYKQ9L2LCT6f6q1SSQ35fIDLpNGK', '123456', NULL, 'Malkajgiri', '1000', 8, 0, '9032251199', '9032224566', '2025-12-28 13:11:24', '2025-07-29 09:05:12', NULL, NULL, NULL, NULL),
(1452, 'Tarun', '9502044763', '$2y$10$Cb2dLtznS5z1kEyKsP/51euPhGle6PsKCOxCaYxXuSfDQ23BcKRg6', 'Sai91825#', NULL, 'Hyderabad', '0', 8, 0, '9502044763', '8522881144', '2025-07-29 18:39:59', '2025-07-29 18:39:59', NULL, NULL, NULL, NULL),
(1453, 'G Narasaiah', '7780705639', '$2y$10$640./.E50B1qijvaJPrDs.WL2q9jl0BhjRL7O27fKWR8W2ppvTivu', '123456', NULL, 'Hyderabad', '2000', 8, 0, '7780705639', '9246351657', '2025-09-12 08:56:24', '2025-07-30 06:57:01', NULL, NULL, NULL, NULL),
(1454, 'Gummidiyala Laxmi', '9059882660', '$2y$10$bHsO/5odWbOsfqH2TwuPB.D7zu1BRDvGLIigZlHVmE8rWvacVTAnC', 'Laxmi@1972', NULL, 'Nizampet', '0', 8, 0, '9059882660', '7780705639', '2025-07-30 07:21:11', '2025-07-30 07:21:11', NULL, NULL, NULL, NULL),
(1455, 'Srinivas', '8106127902', '$2y$10$clpUjHa1HhRD./ntVmSg3ObrsHoD5GtE8iL0K5odnxrONSYKncXLS', 'Abhi@123', NULL, 'Karimnagar', '0', 8, 0, '8106127902', '7780705639', '2025-07-30 10:57:33', '2025-07-30 10:57:33', NULL, NULL, NULL, NULL),
(1456, 'Adhunuri Anjanna', '7989023894', '$2y$10$fkdRm133KeGI0xlr2tTc2.NZcKVJD/soqrlsRCi.KDVmdU3AFYAIK', 'adhunuri2010', NULL, 'Bejjur 5-56', '0', 8, 0, '7989023894', '8522881144', '2025-07-31 09:58:23', '2025-07-31 09:58:23', NULL, NULL, NULL, NULL),
(1457, 'Butchi Prasad', '6304810065', '$2y$10$AdJOnjhImuDWi000NciVMO3aIjUH5z0.bhBC1Eu6U.Xy02/qIDkU2', 'Vaishnavi123', NULL, 'Hyderabad', '0', 8, 0, '6304810065', 'admin', '2025-07-31 15:06:02', '2025-07-31 15:06:02', NULL, NULL, NULL, NULL),
(1458, 'Priyanka Vemisetty', '8897486887', '$2y$10$SMKs2AuZY0U1t0qaa4SFjuoKfAf4wXLlTsrR8253Xds2digDoxsaO', 'Priyanka2612#', NULL, 'Kondapur', '0', 8, 0, '8897486887', 'admin', '2025-08-03 04:59:25', '2025-08-03 04:59:25', NULL, NULL, NULL, NULL),
(1459, 'SARAPU BIRLA', '9246337858', '$2y$10$5UFNhKSO9YFKXQ13VFJc.enfDT./KjJJ5ywovKvlgXqwZHGUg9wUq', 'Krishika@2018', NULL, 'Hyderabad', '0', 8, 0, '9246337858', 'admin', '2025-08-03 05:15:58', '2025-08-03 05:15:58', NULL, NULL, NULL, NULL),
(1460, 'T Govind gupta', '9885456671', '$2y$10$fyylRRHoVlN2wEN12MsjqeIcfi7DXATh/6dZ5WXTi7blzzBREULS2', '123456', NULL, 'Hyderabad', '0', 8, 0, '9885456671', '8143413434', '2025-08-05 10:09:47', '2025-08-05 10:09:47', NULL, NULL, NULL, NULL),
(1461, 'M Raju', '8019077108', '$2y$10$uieBphL4V0DeeHxuJWHcMeuNlIK.t2DLhjGac87Z7ZInLIcRo/nqK', '3753', NULL, 'Kukatpally', '0', 8, 0, '8019077108', '8143413434', '2025-08-05 12:59:19', '2025-08-05 12:59:19', NULL, NULL, NULL, NULL),
(1462, 'Raju sampangi', '8008866085', '$2y$10$RnP2wKpzkUTceFarQMNfROesTvGzW0523tAcbqZyFCzMve52t/oqe', '101712', NULL, 'Madhapur', '0', 8, 0, '8008866085', '8143413434', '2025-08-05 15:59:32', '2025-08-05 15:59:32', NULL, NULL, NULL, NULL),
(1463, 'Uma Manojkumar', '9030765920', '$2y$10$08uhDDsHdC0C5YF87IelBOnMV3PDcKp68BX5xJw79.656OGhl9LQW', '20230w', NULL, 'Hyderabad', '0', 8, 0, '9030765920', '9849411451', '2025-08-05 18:48:32', '2025-08-05 18:48:32', NULL, NULL, NULL, NULL),
(1464, 'V JAYA SHANKAR', '9394755633', '$2y$10$.cOWRqffYMiI8ZKkqKiBYOvVYFZjuNcKi8lj07afMRzD3QPTNwe1K', 'king', NULL, 'Hyderabad', '0', 8, 0, '9394755633', '7013894856', '2025-08-06 06:23:50', '2025-08-06 06:23:50', NULL, NULL, NULL, NULL),
(1465, 'Anjaneyulu', '9676237903', '$2y$10$jLhC23oEAV0yUb5ZflfVbOwV.0XZxRK8FcyTJ1LvMQwHyjffdZVpq', 'Anji@237903', NULL, 'Dilsukhnagar', '0', 8, 0, '9676237903', 'admin', '2025-08-06 09:06:50', '2025-08-06 09:06:50', NULL, NULL, NULL, NULL),
(1466, 'Soma santhosh', '8884449876', '$2y$10$c.slCRekF2QFt6xxJ80IDuEDIqZ.8eokgtx4yZtLotaQ.iWbDMEca', '123456', NULL, 'Makthal', '0', 8, 0, '8884449876', '8522881144', '2025-08-07 07:11:52', '2025-08-07 07:11:52', NULL, NULL, NULL, NULL),
(1467, 'srikanth', '9010119846', '$2y$10$WeZLdlbWtIcJnGbecpShS.meskMo169CLjt/icBKGLpBiXrmFIL.S', '9010119846', NULL, 'kukatpally', '0', 8, 0, '9010119846', '8143413434', '2025-08-07 14:00:17', '2025-08-07 14:00:17', NULL, NULL, NULL, NULL),
(1468, 'Naga rani', '9948782084', '$2y$10$aSYMVhl0buMl3mhMESOwG.FpmOcnnwHoWdoeMFYzfjUzELJSun3IC', '2304', NULL, 'Kukatpally', '0', 8, 0, '9948782084', '9951164521', '2025-08-10 04:37:34', '2025-08-10 04:37:34', NULL, NULL, NULL, NULL),
(1469, 'P.Veerabhadra rao', '8978575738', '$2y$10$rGahUESiaphZq1oE2TW5CeUJh8fTrjmw/4H/dMV/3pPVdHxP2dSn2', '2304', NULL, 'hyd', '0', 8, 0, '8978575738', '9951164521', '2025-08-10 04:49:51', '2025-08-10 04:49:51', NULL, NULL, NULL, NULL),
(1470, 'P Nageswarrao', '9176092368', '$2y$10$MamUxbYlL37HnyD01Oh1buybgTuMfU4pCHQIvPi/YXu4/m7VHej.S', 'power@2025', NULL, 'Manikonda', '0', 8, 0, '9176092368', '9951164521', '2025-08-10 07:21:52', '2025-08-10 07:21:52', NULL, NULL, NULL, NULL),
(1471, 'Srinivas', '8501968853', '$2y$10$I9eOTo1JqniEKXetJozi8.JeRqOJAHNCMcBos5MHxl4ZtDUiNo1Rq', '12345', NULL, 'Kusumanchi', '0', 8, 0, '8501968853', '9951164521', '2025-08-10 07:24:30', '2025-08-10 07:24:30', NULL, NULL, NULL, NULL),
(1472, 'TEMBARENI ANILKUMAR', '9346934266', '$2y$10$IiVYljHdfw0A8Q3LfJARgeu0.Vt2YmT6WD1UnttH/hNw2J2YgWo26', '9989225258', NULL, 'hanamkonda', '1000', 8, 0, '9346934266', '9989225258', '2025-08-10 12:54:40', '2025-08-10 12:39:50', NULL, NULL, NULL, NULL),
(1473, 'PRAMOD', '9676167696', '$2y$10$KUCRTl8i1Eq8cmqWKAqAP.ZgGeaEdFJV7UgIGh7gQjP9QDjgR4CJS', 'Pammu@7770', NULL, 'Hyderabad', '0', 8, 0, '9676167696', '7702381784', '2025-08-10 14:41:22', '2025-08-10 14:41:22', NULL, NULL, NULL, NULL),
(1474, 'Gunda Manoj Kumar', '9849299381', '$2y$10$wO59rjjmkId8C2e2Wjl67uIs1vEDXfK3nCdi5NsvwigHaDeqVOmSu', 'Manoj@123', NULL, 'Manoj@123', '0', 8, 0, '9849299381', '9989225258', '2025-08-11 04:38:25', '2025-08-11 04:38:25', NULL, NULL, NULL, NULL),
(1475, 'Sambari Ashok kumar', '9885433824', '$2y$10$U3ncQWpEEMjqRZN29CuE7ekKu42H5rCo4SiMoJZsZetr6HqJVxrei', '9885433824', NULL, 'KORUTLA', '0', 8, 0, '9885433824', '9989225258', '2025-08-11 04:48:05', '2025-08-11 04:48:05', NULL, NULL, NULL, NULL),
(1476, 'Boini Mayuri', '7893237874', '$2y$10$UkPoXsmzewXHUEwzPiVi6OcReJaxjU80lPOosscGAzfoSWjh2MmYG', '7893237874', NULL, 'Karimnagar', '1000', 8, 0, '7893237874', '9989225258', '2025-08-12 07:34:43', '2025-08-11 04:50:46', NULL, NULL, NULL, NULL),
(1477, 'Mekala Chakravarthi', '9550255943', '$2y$10$NmEYLiHcSGnN8KmRhYGk6OqdujJGNeqOJMviNkLHQ/brFhISbYVNS', 'Cc@12345', NULL, 'Vissannapeta', '0', 8, 0, '9550255943', '9989225258', '2025-08-11 05:17:32', '2025-08-11 05:17:32', NULL, NULL, NULL, NULL),
(1478, 'Mogili Naresh', '9059420207', '$2y$10$zi/TpY0E9pSXAonzEwfsCeG1u.0gcAofnXvp9u3wMijTfPnbkd68G', '1269', NULL, 'Khammam', '0', 8, 0, '9059420207', '9989225258', '2025-08-11 06:52:49', '2025-08-11 06:52:49', NULL, NULL, NULL, NULL),
(1479, 'santhosh kumar', '8309644032', '$2y$10$d4VxU0Hjtepf9Fc7M7TiyOqlDQ2qtMw4zN0jDlZqwc5eBIiQFj6Y6', '12345', NULL, 'ghatkesar', '0', 8, 0, '8309644032', '9989225258', '2025-08-11 06:54:49', '2025-08-11 06:54:49', NULL, NULL, NULL, NULL),
(1480, 'P.KIRAN KUMAR', '8639827394', '$2y$10$BZR3dk5wEIOpJT5BA5tEMeBQbv8HKfLkwtoJRBNvnCEs6B1igQKAW', '181818', NULL, 'Hyderabad', '0', 8, 0, '8639827394', '9989225258', '2025-08-11 11:57:45', '2025-08-11 11:57:45', NULL, NULL, NULL, NULL),
(1481, 'Sai Swathi Kalavala', '9985969782', '$2y$10$fpHRxDgafUXYz6KNKNpkMO25n96C3gVq0vsFrHF/bDXEZs53j5A5i', 'siri@1205', NULL, 'Hyderabad, Moulali ali', '1000', 8, 0, '9985969782', '7702381784', '2025-08-12 16:58:04', '2025-08-12 16:20:24', NULL, NULL, NULL, NULL),
(1483, 'Aravind Kalavala', '9949167966', '$2y$10$cjzPjvscldQNF9YwyPmX.eS04zO6ToK3C3eWvhYriFDIqy9.mICr.', 'siri@1205', NULL, 'Moulaali, Hyderabad', '0', 8, 0, '9949167966', '9985969782', '2025-08-12 17:08:08', '2025-08-12 17:08:08', NULL, NULL, NULL, NULL),
(1484, 'TEMBARENI SAMATHA', '8688825108', '$2y$10$QihOdzKkud2AoEssVqXi0uBVcsaaaXbOby8BZkDCHluWTkkyTR9g.', '8688825108', NULL, 'Hanumakonda', '0', 8, 0, '8688825108', '9989225258', '2025-08-14 05:06:26', '2025-08-14 05:06:26', NULL, NULL, NULL, NULL),
(1485, 'Puchakayala Ravikumar', '7095696555', '$2y$10$cKH.zkMcfxXs1JQ1CCQmteLNbYhZ8cH.hzzlEwH4KD/6s6waBn0XC', '12341663', NULL, 'Khammam', '0', 8, 0, '7095696555', '9989225258', '2025-08-14 05:06:48', '2025-08-14 05:06:48', NULL, NULL, NULL, NULL),
(1486, 'Dr.purushothan JERIPOTHULA', '9849295916', '$2y$10$K92rv/eSGnTT4hn9U8amFuZYM.RHrBcaw.CNSl73VR4tSpx0j0H7K', '9700675350', NULL, 'Hyderabad', '0', 8, 0, '9849295916', '9989225258', '2025-08-14 06:20:05', '2025-08-14 06:20:05', NULL, NULL, NULL, NULL),
(1487, 'MIRYALA PURUSHOTHAM', '9010522456', '$2y$10$CM5EZKX34CQMCHubPRjnSuz/Qory0c2hkBrFMnucbeRNjN3XGWbQ6', 'a6814bMP@', NULL, 'GHATTUPPAL', '0', 8, 0, '9010522456', '9989225258', '2025-08-15 15:29:59', '2025-08-15 15:29:59', NULL, NULL, NULL, NULL),
(1488, 'Veera', '8977037929', '$2y$10$hUPd0Dto4nnsoyhnJ7Uq6OR0BdyD3ciLmRLkUK1XlGZ/vPIMA/636', 'Veera007', NULL, 'Hyderabad', '0', 8, 0, '8977037929', '8143413434', '2025-08-16 05:46:38', '2025-08-16 05:46:38', NULL, NULL, NULL, NULL),
(1489, 'Suryaprasad Durgavajjula', '9441946111', '$2y$10$SU.Ib01C3UAalhV8meRUHeDDHiNroYY4MXDUNzFVjRS1Kc14r4.hO', '381968', NULL, 'KPHB', '0', 8, 0, '9441946111', '8143413434', '2025-08-16 06:50:36', '2025-08-16 06:50:36', NULL, NULL, NULL, NULL),
(1490, 'JONNALA VIJAY SAGAR', '9347955872', '$2y$10$7E0AdIKPnJ/.ThS628r.eegjA1blUIJcdT2ypWOjtzLzRcKxPwPzC', '3891vijay3061', NULL, 'Hyderabad', '0', 8, 0, '9347955872', '9398536745', '2025-08-16 12:40:37', '2025-08-16 12:40:37', NULL, NULL, NULL, NULL),
(1491, 'Swetha S', '8341001259', '$2y$10$bGo43LI55OXF8c5kFsz6BOw17j1g7qGmKoaDsQ1eClgzM4t1fEN1y', 'Swetha@164', NULL, 'Swetha@164', '0', 8, 0, '8341001259', '8143413434', '2025-08-17 08:02:14', '2025-08-17 08:02:14', NULL, NULL, NULL, NULL),
(1492, 'Koorabhargavi', '9553752813', '$2y$10$2YoAgTUHkmrJcws4pHqSpOIwfWVIa0MCAojXfhMbR8CdRi2bekHPe', 'bhargavi', NULL, 'Bhel township', '0', 8, 0, '9553752813', '8143413434', '2025-08-17 08:02:33', '2025-08-17 08:02:33', NULL, NULL, NULL, NULL),
(1493, 'Punnam Saidulu', '9505477840', '$2y$10$97iqmMAzGmFyf2uJkSyesOJMXcDc7qhgKjn9wrdNy6fRMqgSLiNu2', '123456', NULL, 'Warangal', '0', 8, 0, '9505477840', '9989225258', '2025-08-18 02:12:30', '2025-08-18 02:12:30', NULL, NULL, NULL, NULL),
(1494, 'Mohammed Yahiya Khan', '8686365483', '$2y$10$FMu9yUcyzBpjmtyn3B6aOuwRCLh5BP0L72j6yVyWatCU7daI3nKsC', 'Money2money', NULL, 'Hyderabad', '0', 8, 0, '8686365483', 'admin', '2025-08-18 06:16:35', '2025-08-18 06:16:35', NULL, NULL, NULL, NULL),
(1495, 'SHALOM HOME CARE SERVICE', '9700115542', '$2y$10$YESWsrsySGUJ290EmgyR2ukJSQTdCYQEKZhJzaIPArzDACQe57MSS', 'arun4321', NULL, 'Warangal', '0', 8, 0, '9700115542', '9989225258', '2025-08-18 06:27:04', '2025-08-18 06:27:04', NULL, NULL, NULL, NULL),
(1496, 'siva jadam', '8106512347', '$2y$10$5mW0AmLa3A9AzWHYmKEwwOEJlz2/smZlE/5YtgXnosbk32EDwhVVK', 'Lakshman@1984', NULL, 'Jangareddygudem', '0', 8, 0, '8106512347', '9989225258', '2025-08-18 10:15:48', '2025-08-18 10:15:48', NULL, NULL, NULL, NULL),
(1497, 'Ashok damera', '9908166991', '$2y$10$FFh.reGhzRX0IKh0/iLcH.tATVcPv.CZ7the.T7pnKg9X5w7LhwUq', '4477', NULL, 'Palakurthy', '0', 8, 0, '9908166991', '9989225258', '2025-08-18 11:32:29', '2025-08-18 11:32:29', NULL, NULL, NULL, NULL),
(1498, 'V Kumar Reddy', '9885290090', '$2y$10$ZlFkOWIMUowt/pVbO9bXKeMVvD3PHGW4sBBTXBFjW.I0iWfEpQoI.', '123456', NULL, 'Hyderabad', '0', 8, 0, '9885290090', '9032224566', '2025-08-19 13:48:25', '2025-08-19 13:48:25', NULL, NULL, NULL, NULL),
(1499, 'Jajala. Sudarshan Reddy', '9949222255', '$2y$10$9mcZSiB6vEbGfydFDXPw0uHnhm2H.pjX1MjtfZ.V5Ssc.zW4GCQOi', 'rani@143', NULL, 'Hydrabad', '0', 8, 0, '9949222255', 'admin', '2025-08-20 12:12:38', '2025-08-20 12:12:38', NULL, NULL, NULL, NULL),
(1500, 'KOYYANI VENKATA GIRI', '8105211981', '$2y$10$CFE77J3apSzWMTBPoWkuteHt26kHuyPt1e7JOj01/l0ZlXWyaNjmq', '12345678', NULL, 'GAJULARAMARAM', '0', 8, 0, '8105211981', '9052658798', '2025-08-20 15:24:33', '2025-08-20 15:24:33', NULL, NULL, NULL, NULL),
(1501, 'SANKA THUSHARA SYAMALA GUPTA', '9246878796', '$2y$10$Hw64Yrzc6hEQOnMdqZiNKuXjEzlKfR2JE.O0Yttale0wxBAA7bJqm', '1964', NULL, 'Hyderabad', '0', 8, 0, '9246878796', '8143413434', '2025-08-22 12:53:10', '2025-08-22 12:53:10', NULL, NULL, NULL, NULL),
(1502, 'RAVIKUMAR', '7032552304', '$2y$10$QlfhMpqMNFT6AENspGNRUuV2eZU/OF9cAZP2/Oe38YfUmNgAckCJu', '123456', NULL, 'SHAMSHABAD', '3000', 8, 0, '7032552304', '9705910096', '2025-09-03 08:06:57', '2025-08-22 13:11:54', NULL, NULL, NULL, NULL),
(1503, 'G. SIDDI LINGAPPA', '9912245579', '$2y$10$eivIFxSxVb75cz3bjRDmruhW7ez5Ne22HCrak/U9Bvz.rw0UFGG8.', '123456', NULL, 'Hyderabad', '0', 8, 0, '9912245579', '9885290090', '2025-08-23 08:29:19', '2025-08-23 08:29:19', NULL, NULL, NULL, NULL),
(1505, 'Pranay Reddy', '9908361266', '$2y$10$0ctXYnYwa5ZiMU2rO4LlsOw3pk6xeuKJXAi4OgH7aK2tyAZ33L/A6', 'Pranay@143', NULL, 'Hyderabad', '0', 8, 0, '9908361266', '8143413434', '2025-08-24 07:03:47', '2025-08-24 07:03:47', NULL, NULL, NULL, NULL),
(1506, 'Abhishek', '8919431135', '$2y$10$zngekwUG8YdZNQiJFVprPOLEKeld5ImekbGc.s8RVYxHCyNAYY/X.', 'Hesoyam$1', NULL, 'Miyapur', '0', 8, 0, '8919431135', '8143413434', '2025-08-24 09:40:18', '2025-08-24 09:40:18', NULL, NULL, NULL, NULL),
(1507, 'S.PRADEEP KUMAR', '7396380500', '$2y$10$WazikFR6H2PAlN7pZsnNfO9Ivu8TwtMiDWVGUcbhTHGwmW5cGHoAa', '5754', NULL, 'HANAMKONDA', '0', 8, 0, '7396380500', '9989225258', '2025-08-26 05:40:10', '2025-08-26 05:40:10', NULL, NULL, NULL, NULL),
(1510, 'qwerty', '9638527410', '$2y$10$TNn7.SPc7Pcd1gm4lKY86.hHxrzSX2NiFD9H2j3Yt5xQWovEeG/R2', 'QWERT!@#$%', NULL, 'awsedrfgth', '0', 8, 0, '9638527410', 'admin', '2025-08-26 12:18:55', '2025-08-26 12:18:55', NULL, NULL, NULL, NULL),
(1511, 'ZXCVBNM', '9638527412', '$2y$10$URRjrDKR.gNvY/QAw.90NeB.QcXjT.BINHJpeTLLnDUkyRfzcMH1e', '9638527412', NULL, 'ind', '0', 8, 0, '9638527412', 'admin', '2025-08-26 12:22:09', '2025-08-26 12:22:09', NULL, NULL, NULL, NULL),
(1512, 'Swamy', '9949441797', '$2y$10$j38DqXlWa/WrPjbYC3G/qe5cbyAruua.jTGwX66VIFmZbGTM49hGC', '994944', NULL, 'Godavarikhani', '0', 8, 0, '9949441797', '7702381784', '2025-08-27 06:35:12', '2025-08-27 06:35:12', NULL, NULL, NULL, NULL),
(1513, 'Mogil', '8500251656', '$2y$10$C87f6ylT9EmXcNAYeZejPecKtyTtb4g3qdIPl1j7sP31YWsU3u8f6', '251656', NULL, 'Darmaram', '0', 8, 0, '8500251656', '9949441797', '2025-08-27 08:06:12', '2025-08-27 08:06:12', NULL, NULL, NULL, NULL),
(1514, 'RAJASEKHAR GUBBALA', '9963888243', '$2y$10$3GphgbtDVhKWPj0WBu3OF.0jRKfxpypVSZ23b1.uMeSEAH3vQY0Ou', 'lory1234', NULL, 'lory1234', '0', 8, 0, '9963888243', 'admin', '2025-08-28 11:41:45', '2025-08-28 11:41:45', NULL, NULL, NULL, NULL),
(1515, 'Rakesh Kumar L', '9908785925', '$2y$10$.lLcpw6KM8UAlQ0gp.xRdu0y47CbWgtRMGCtrw6qlTF8GNIPkNj.6', 'Rakesh@18', NULL, 'Hyderabad', '0', 8, 0, '9908785925', 'admin', '2025-08-28 13:41:07', '2025-08-28 13:41:07', NULL, NULL, NULL, NULL),
(1516, 'Syed Zoheb', '9989616210', '$2y$10$TTToeDXdEzE6LXWtrCHWx.76TJNfQQMMcze4yQZPXCblJ.Ans2Nsm', 'Zohaib786', NULL, 'Hyderabad', '0', 8, 0, '9989616210', '8143413434', '2025-08-28 13:46:27', '2025-08-28 13:46:27', NULL, NULL, NULL, NULL),
(1517, 'Alagani Foods', '9032325232', '$2y$10$XJUL5vVdb9rubwsj4vJAluYqzA60wy6JGwEaVyRxBix9dVZX85CsG', 'chaipani', NULL, 'Moulali, Hyderabad', '0', 8, 0, '9032325232', 'admin', '2025-08-29 10:36:29', '2025-08-29 10:36:29', NULL, NULL, NULL, NULL),
(1518, 'M Yadagiri', '8688528988', '$2y$10$WBjUuqDZMH0AlPSJeTYRw.xIOsVruxEhFj2b/FSXJ1uXI97N.21Jm', '123456', NULL, 'Shamshabad Hyd', '1000', 8, 0, '8688528988', '7032552304', '2025-09-03 08:01:40', '2025-09-01 10:46:11', NULL, NULL, NULL, NULL),
(1519, 'KP Lingareddy', '9963055128', '$2y$10$1E4b1FpGy.KphfdXMrmcF.pg.p5ky6D/qISPkaoqB1rrL0RKzDx/6', '123456', NULL, 'Attapur hyd', '1000', 8, 0, '9963055128', '7032552304', '2025-09-03 08:06:57', '2025-09-01 11:27:06', NULL, NULL, NULL, NULL),
(1520, 'A BALARAJU', '9030972378', '$2y$10$RlSmd1XNtzAK9C3l0Q1j0.wyPAHa9GlMxbekNL13kg641q9uBRGOy', '123456', NULL, 'Attapur Hyd', '0', 8, 0, '9030972378', '9491443072', '2025-09-01 16:38:37', '2025-09-01 16:38:37', NULL, NULL, NULL, NULL),
(1521, 'M A ALEEM', '9985001214', '$2y$10$YWDleGdzKsUNpb8oFQR3Ye/1flKwUnuiZBw2k3YY3.VWxyoVQEacC', 'aleem', NULL, 'Hyderabad', '0', 8, 0, '9985001214', '8143413434', '2025-09-02 13:23:38', '2025-09-02 13:23:38', NULL, NULL, NULL, NULL),
(1522, 'CA DEVAKI KRISHNA', '6300536424', '$2y$10$BKOh2Vp.twj6ZCXG5oqZeeDZsUU3YgnOFhO6cC3fh5/h3CbsPXukK', 'Deva123*', NULL, 'Hyderabad', '0', 8, 0, '6300536424', '8143413434', '2025-09-02 15:59:58', '2025-09-02 15:59:58', NULL, NULL, NULL, NULL),
(1523, 'K.buchibabu', '9642808087', '$2y$10$XqRD1Q9Nzp3oy5HSwRRSQuiK60kEKjzuhyFxVgWoCcqRFZ.P6NfHi', '8087', NULL, 'Nidadavole D muppavaram main rood saibaba temple', '0', 8, 0, '9642808087', '7842492612', '2025-09-03 07:56:55', '2025-09-03 07:56:55', NULL, NULL, NULL, NULL),
(1524, 'Sandeep', '8712720300', '$2y$10$0AjoKmYxT8faJI6lDBUsreWJUan9noqjedqquDrKYnmV/VVg03zeq', 'millenium1', NULL, 'Hyderabad', '0', 8, 0, '8712720300', '8143413434', '2025-09-03 08:51:53', '2025-09-03 08:51:53', NULL, NULL, NULL, NULL),
(1525, 'Shravan Kumar', '8519985860', '$2y$10$1XlLPEMB4lm.ugGDo/4iB.XCyW32NNoLa9X3hTxVV0StAphEwp2.S', '12345', NULL, 'Hyderabad', '0', 8, 0, '8519985860', '8143413434', '2025-09-03 12:29:48', '2025-09-03 12:29:48', NULL, NULL, NULL, NULL),
(1526, 'G. Balaji', '9652332546', '$2y$10$2L8WU2kBdYDOy9dKzYtIjeFK15MSlYJzTI9czGBvD2o6Y2HziTUFW', '123456789', NULL, 'Ravulapalem', '0', 8, 0, '9652332546', '7842492612', '2025-09-04 05:54:48', '2025-09-04 05:54:48', NULL, NULL, NULL, NULL),
(1527, 'N Ch Venkateswarlu', '9989606387', '$2y$10$s0u2dkypSi4OsWjjDvr8a.eLlNjKXEOnzOWN.HaqMOARV20sTk93y', '1207', NULL, 'MPP 2 school', '0', 8, 0, '9989606387', '7842492612', '2025-09-05 03:25:25', '2025-09-05 03:25:25', NULL, NULL, NULL, NULL),
(1528, 'M b p n varma', '9966626979', '$2y$10$KBoMCKC/4vf8qOkg16oGReLA02AFjo68NNekiTVoJranApn9qPHlq', 'bhanu123', NULL, 'Ainavalli', '0', 8, 0, '9966626979', 'admin', '2025-09-05 12:11:07', '2025-09-05 12:11:07', NULL, NULL, NULL, NULL),
(1529, 'Mohammadabdul. Khaisar', '8977502411', '$2y$10$v5QB601b0fOI03lNfBEQb.quffObTU04Ss0OxjuTsMhSPw/rWFBWa', '767142@', NULL, 'Telangana', '0', 8, 0, '8977502411', 'admin', '2025-09-08 04:14:35', '2025-09-08 04:14:35', NULL, NULL, NULL, NULL),
(1530, 'M S Goud', '8977677569', '$2y$10$VJV9tTweabtuRD5tWRNF8ecpCIh2pmEM5uLdgNHUqbi4b9HTghn/e', '123456', NULL, 'Madhuranagar', '1000', 8, 0, '8977677569', 'admin', '2025-09-25 06:22:56', '2025-09-08 14:27:25', NULL, NULL, NULL, NULL),
(1531, 'Gummidiyala Nishindra', '7396777731', '$2y$10$kYzJi9DXcOkpL6xN.VOp/e/sxc0QSohgiUngitYP80C0QzIekN4Vi', 'Laxmi@1972', NULL, 'Nizampet', '1000', 8, 0, '7396777731', '7780705639', '2025-09-12 08:56:24', '2025-09-12 07:00:02', NULL, NULL, NULL, NULL),
(1532, 'Varaprasad janagama', '7729000952', '$2y$10$Ywk90GKnMCyeXraV3RiAHeM3qaZ4qkF8j7/tjHgCnmkaF.9RwBRey', '772266', NULL, 'Manchirial', '0', 8, 0, '7729000952', 'admin', '2025-09-16 08:25:34', '2025-09-16 08:25:34', NULL, NULL, NULL, NULL),
(1533, 'Margam Srinivasulu', '9666339074', '$2y$10$X4lAOud0yYMUu84v7xNsseSDVT/.x1YCfrOrttxEYt8zL70RbJ5vO', 'SrinuW1234', NULL, 'Hanumakonda', '0', 8, 0, '9666339074', '7702381784', '2025-09-27 05:06:38', '2025-09-27 05:06:38', NULL, NULL, NULL, NULL),
(1534, 'T LAKSMINARAYANA', '9346919293', '$2y$10$I/UWg6kEGYXe9aVLSqSjXO4ddgg0Hx7RIvzPfPXh32NTeDWo1wotu', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9346919293', 'admin', '2025-09-27 06:15:46', '2025-09-27 06:15:46', NULL, NULL, NULL, NULL),
(1535, 'Harish Chintu', '7993940954', '$2y$10$8WQPViiVmMVo0R4YuUDbvuieltRcT10uL1iz9CRGxuFIPbH/Abfoq', 'harish1377', NULL, 'Mallapur', '0', 8, 0, '7993940954', '8522881144', '2025-09-27 14:07:05', '2025-09-27 14:07:05', NULL, NULL, NULL, NULL),
(1536, 'Usha devi Usha devi', '9356060976', '$2y$10$0gkzNzoc..aWZig/Qd0z8utAz3CxtihGhPXWfg8VimDf6wxICy5ly', '885566', NULL, 'U.p.', '0', 8, 0, '9356060976', '8522881144', '2025-10-03 04:22:37', '2025-10-03 04:22:37', NULL, NULL, NULL, NULL),
(1537, 'UTTHAM REDDY K', '8978515246', '$2y$10$GsYYwezL.wzjXuQQtnRem.2TMft41NwlEmVzEys55cr6ALxSzIxXu', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8978515246', '7095241356', '2025-10-07 07:24:43', '2025-10-07 07:24:43', NULL, NULL, NULL, NULL),
(1538, 'G PRASANNA', '9739754335', '$2y$10$6mSKqUkHv1xvk8EwzEkiYOQFiIIri8NsMUV5BYc4Ip0F8l9hPry2.', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9739754335', '9440969362', '2025-10-17 09:07:36', '2025-10-17 09:07:36', NULL, NULL, NULL, NULL),
(1539, 'T CHANDU', '8897223073', '$2y$10$h24F6DzmpFZDyhMUxBIW/eg7RxOxB.uGfNxHmEMmNU9h0NrVAWpXy', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8897223073', 'admin', '2025-10-21 13:02:13', '2025-10-21 13:02:13', NULL, NULL, NULL, NULL),
(1540, 'D SUDHEER KUMAR', '6301751182', '$2y$10$kU5JlY3JJZqPL0B8U8gCg.SMtq2bwt33Oba0ek4KRVwlcU7hNqVwO', 'Sudheer@123', NULL, 'Isnapur', '0', 8, 0, '6301751182', '8522881144', '2025-10-22 08:42:04', '2025-10-22 08:42:04', NULL, NULL, NULL, NULL),
(1541, 'J Siva Prasad', '9989545626', '$2y$10$RgJVf9NN0ZGstzQfnnNCI.7srJAlBdon4HDUtynLZ4EEmdGnz4Uje', 'Siva@1135', NULL, 'Srikalahasti', '0', 8, 0, '9989545626', 'admin', '2025-10-24 04:00:35', '2025-10-24 04:00:35', NULL, NULL, NULL, NULL),
(1542, 'Y Nageshwar Rao', '9665156355', '$2y$10$YT8q6bkfGqMW5wZ8Ol5yyOFC2LJuPlR0YmRebpYpBPorGI4XORZWK', '123456', 'assets/user_assets/images/69af9ebf7f547.R1Global - Red.png', 'Hyderabad', '14000', 8, 13000, '9665156355', '9951552424', '2026-03-11 15:56:11', '2025-10-27 09:35:23', 'KPHB HYDERABAD', 'Hyderabad', 'Telangana', '500085'),
(1543, 'A Srinivas', '7386885498', '$2y$10$0h8YTeyf2Ynz98baZLd0BuKC6VuYIYa5HJSRsS4si/SZaL7Y32Mae', '123456', NULL, 'Sircilla', '0', 8, 0, '7386885498', '9032224566', '2025-11-02 12:40:42', '2025-11-02 12:40:42', NULL, NULL, NULL, NULL),
(1544, 'Shripuja', '9246155955', '$2y$10$6Xquxe8pEe4G.MgQVx3iIuC/5fNAmJskQw9LOjLDTeVjfcuvF18Oq', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9246155955', '9133098999', '2025-11-03 20:44:17', '2025-11-03 19:42:32', 'H', 'Hyderabad', 'Telangana', '500073'),
(1546, 'S V KAMALAKAR', '9989690773', '$2y$10$ETmoytJ3LMBXPRsM263YOu4GYz.59WxGRgahebL.6t9UyMvnZX0K6', '123456789', NULL, 'NAGOLE HYD', '0', 8, 0, '9989690773', '8522951414', '2025-11-05 13:58:33', '2025-11-05 13:58:33', NULL, NULL, NULL, NULL),
(1547, 'S Y RAO', '8522921414', '$2y$10$Ez7u9uf7Ohav703UqsVXWeV.RFEEMJBn4FlU7ix1Qaywfvi6GQz8G', '123456789', NULL, 'NAGOLE HYD', '0', 8, 0, '8522921414', 'admin', '2025-11-05 14:04:36', '2025-11-05 14:04:36', NULL, NULL, NULL, NULL),
(1548, 'Ch Ramessh Kumar', '9247269421', '$2y$10$fW6PoC/dHdoZQePqX7cB.ufLQnsDyNfc2sbOnEPo/8bGVxck7PQwO', 'Miracle@64', NULL, 'Hyderabad', '0', 8, 0, '9247269421', 'admin', '2025-11-11 04:48:00', '2025-11-11 04:48:00', NULL, NULL, NULL, NULL),
(1549, 'Puram Setty Sai Vikram Kumar', '9177424004', '$2y$10$r05FHOxSt8S7Z0l.FXxaTOB2BJZO6Ttkm.OOsNLcBQpc/pn2B1kyC', 'vikranthi@123', NULL, 'Hyderabad', '0', 8, 0, '9177424004', '9665156355', '2025-11-15 07:54:36', '2025-11-15 07:54:36', NULL, NULL, NULL, NULL),
(1550, 'H SUNEETHA BAI', '8328679830', '$2y$10$bFWnpGn1pvpHGgs0b0fLMOwyX8res9hw4goEUBM.4ADvYyPYz/t4.', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8328679830', '9912854922', '2025-11-15 15:03:53', '2025-11-15 15:03:53', NULL, NULL, NULL, NULL),
(1551, 'H RUPESH KUMAR', '8297648966', '$2y$10$GD3bumkMkVUp0n56.0QLIuqmAV08GmnyQImnTGlJqNWM1xg7oSOya', '123456', NULL, 'Hyderabad', '0', 8, 0, '8297648966', '8328679830', '2025-11-15 17:45:22', '2025-11-15 17:45:22', NULL, NULL, NULL, NULL),
(1552, 'PARLAPATI THIRUPALAIAH', '7013275906', '$2y$10$ghEE7itX6wJRSb0SNWia3OxPY74beFJSv5qqvnSMgt5g0yHAiInT2', '123456', NULL, 'Proddatur', '0', 8, 0, '7013275906', '8297648966', '2025-11-15 17:51:25', '2025-11-15 17:51:25', NULL, NULL, NULL, NULL),
(1553, 'SAYYAD MASUM BASHA', '9110356293', '$2y$10$3tJk6NqCMyf.6N1QXskS2.waB3oZmNqmfbgnz/btwqRH1jm28Ntdq', '123456', NULL, 'Nandikotkur', '0', 8, 0, '9110356293', '8297648966', '2025-11-15 18:33:39', '2025-11-15 18:33:39', NULL, NULL, NULL, NULL),
(1554, 'mahalaxmi akella', '9885168605', '$2y$10$eMcWvBDqq8sfKTp4GpiH9.LMaFBGxLVtICqdxQAcN5UaT3INu50A2', 'maha77', NULL, 'Rajeev nagar', '0', 8, 0, '9885168605', 'admin', '2025-11-16 09:17:38', '2025-11-16 09:17:38', NULL, NULL, NULL, NULL),
(1555, 'Ambati Yellesh', '9398436157', '$2y$10$VMX.H6JHN7iH7IhwFC0z6eoBGBcR/cDUmWUKbsZFStrsJqY3U/tj.', 'Abt@yel1', NULL, 'Nakrekal', '0', 8, 0, '9398436157', 'admin', '2025-11-19 10:16:43', '2025-11-19 10:09:58', 'CHANDUPATLA NAKREKAL NALGONDA TELANGANA', 'NAKREKAL', 'Telangana', '508211'),
(1556, 'SREENIVAS SANGISETTY', '9618078288', '$2y$10$O/0KD7h6fyRwwSkTz3U/xepY1VS6mEavaYXuJ9BVUgg46dMgoZ7Ba', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9618078288', '6300599075', '2025-11-19 11:22:44', '2025-11-19 11:22:44', NULL, NULL, NULL, NULL),
(1557, 'M Ramana Murthy', '7799938101', '$2y$10$k0pyGUQBuSVcenzY3PD3/OqNYrnE7/JT1VYA.y5NKY6u5jW6NuIlW', 'matam@1964', NULL, 'Hyderabad', '0', 8, 0, '7799938101', '9618078288', '2025-11-20 11:33:46', '2025-11-20 11:33:46', NULL, NULL, NULL, NULL),
(1558, 'B SHIREESHA', '9963830568', '$2y$10$Gpb0vFJP/ndDo/POxWEdIuBveg7p9PX.vGS.RJSjg/TD2XqjVTY9.', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9963830568', 'admin', '2026-01-09 16:23:01', '2025-11-22 13:05:27', NULL, 'Hyderabad', 'Telangana', '500018'),
(1559, 'Subramanyam', '9849233155', '$2y$10$sdHQsCl/MGsmNn3gPSRmx.mRHlRb3PhMbzRYh.AyxSfBIc7nsGeaq', 'rujgu5-koTbyk-wedger', NULL, 'Hyderabad', '0', 8, 0, '9849233155', '9963830568', '2025-11-22 13:29:28', '2025-11-22 13:29:28', NULL, NULL, NULL, NULL),
(1560, 'Keran sai', '8367343434', '$2y$10$DfkXgjuIDgWdp7uXYPfD0.DFaI09GLUfIyEeMrQRLGk3tzUsRO5eS', 'Mittu1234', NULL, 'Kompally Hyderabad', '0', 8, 0, '8367343434', '9963830568', '2025-11-22 13:37:59', '2025-11-22 13:37:59', NULL, NULL, NULL, NULL),
(1561, 'Devipriya', '6300363414', '$2y$10$3dhkuTJpyCB5pHyPDe/JVeab/kgaifcsn2s0Zh3WjoiwQrAQ00O3C', 'Devi@2811', NULL, 'Chittoor', '0', 8, 0, '6300363414', '9963830568', '2025-11-23 11:54:32', '2025-11-23 11:54:32', NULL, NULL, NULL, NULL),
(1562, 'Pinnam Venkatesh', '8008018640', '$2y$10$t6hMUCSAogtbM66i4qK8AOfvu1wumj.HTahlK/Kq7kM4JbJ/..3nO', 'Venky800', NULL, 'Venky800', '0', 8, 0, '8008018640', '9963830568', '2025-11-25 13:56:08', '2025-11-25 13:56:08', NULL, NULL, NULL, NULL),
(1563, 'Venkataravi', '8886432427', '$2y$10$d4HOeMtK4gBjtnoJrjmlGeewI.yYCSE063hVYbUfcgP6vrPNcxD3K', '8886432427', NULL, 'Kurnool', '0', 8, 0, '8886432427', '8522881144', '2025-11-27 09:32:17', '2025-11-27 09:32:17', NULL, NULL, NULL, NULL),
(1564, 'Durga bhavani', '7989932154', '$2y$10$eoeGJT37QwYEUoLJHwYxO.QbRXc1uhd94TrT2TRoPWsBmaQA.eyVO', 'durga143', NULL, 'Kovvali', '0', 8, 0, '7989932154', '8522881144', '2025-11-28 10:25:50', '2025-11-28 10:25:50', NULL, NULL, NULL, NULL),
(1565, 'Chukka sharada', '9490008857', '$2y$10$ebyeSQ2D2UClYZCVjYFs4.6c.xTALZAETqPReZOnn60m1CAkZ7sna', '123456', NULL, 'Sainikpuri HYD', '0', 8, 0, '9490008857', '9963830568', '2025-11-28 10:40:02', '2025-11-28 10:40:02', NULL, NULL, NULL, NULL),
(1566, 'Varahala deepika', '7730007828', '$2y$10$lyfmmw5rwk7159l9eqJpp.h0HlOeV0Ee/6E4Y.qmXS/IqE2mVfTX2', '152947', NULL, 'Defence colony', '0', 8, 0, '7730007828', '9963830568', '2025-11-28 13:35:15', '2025-11-28 13:35:15', NULL, NULL, NULL, NULL),
(1567, 'Dr SUBBA RAO', '9346502362', '$2y$10$RU3493SWXF4bNvlkvC/Svezs1eXaS3U/TsStXgdla/RgfRsI1JdeK', '123456', NULL, 'HYDERABAD', '13000', 8, 13000, '9346502362', '8522881144', '2026-01-14 04:40:40', '2025-11-30 09:44:14', 'HYDERABAD', 'Hyderabad', 'Telangana', '500072'),
(1568, 'MOHAMMED MUNEER AHAMMAD', '7013918476', '$2y$10$NuCSbl1ITwjd8jDCLGTChOcdsyId5A3jVLxKpaMrN3/.Ibk6KMtRW', '777999', NULL, '777999', '0', 8, 0, '7013918476', '9491443072', '2025-12-01 08:02:13', '2025-12-01 08:02:13', NULL, NULL, NULL, NULL),
(1569, 'Tekmal jyoti', '6301373342', '$2y$10$3nBaeuGpifCz/h0vNSarZeWL7lf0d6WwkrfpdqPtVbnJul0q6NMDi', '123456', NULL, 'Santhosh nagar', '3000', 8, 3000, '6301373342', '9963830568', '2026-01-04 16:54:35', '2025-12-02 05:25:55', NULL, NULL, NULL, NULL),
(1570, 'Abdul Rahman', '9505839529', '$2y$10$5wjMznAKAzJ6ytZY/FYj9eg2aUOtMTwBpbjbSxgmONpaBqwp21agS', '8919638822', NULL, '8919638822', '0', 8, 0, '9505839529', '9491443072', '2025-12-02 11:21:12', '2025-12-02 11:21:12', NULL, NULL, NULL, NULL),
(1571, 'Rainbow happy life', '9177534011', '$2y$10$aJyliQoGJ3OJ919MMC9Yc.xXtP4Sq0RwrHLFQMGdH98SV2Iyq.r.W', '123456', NULL, 'Boduppal', '0', 8, 0, '9177534011', '8522881144', '2026-02-20 09:35:51', '2025-12-03 06:18:24', NULL, NULL, NULL, NULL),
(1572, 'c.Bhavani Prasad', '8639974381', '$2y$10$JiBOEPMKkYkXBTzqGwrz0.sGCmsGreS4pwSGHJyatT2AagiAOgOpy', '036999', NULL, 'HYDERABAD', '4000', 8, 3000, '8639974381', '7702381784', '2026-03-13 16:12:13', '2025-12-03 07:27:33', 'Yousaf guda', 'Hyderabad', 'Telangana', '500045'),
(1573, 'Chandra sekhara reddy.medapati', '8179545111', '$2y$10$ltGvKUuG.aXwwEtln.1BvOBz/7GAGqO2k/vuw7n4vqs1EC5XwZRFm', 'kphb#2040', NULL, 'Kphb', '0', 8, 0, '8179545111', 'admin', '2025-12-04 06:43:02', '2025-12-04 06:43:02', NULL, NULL, NULL, NULL),
(1574, 'PABBA SRINIVAS', '9030572369', '$2y$10$f3MvUGWworhY5cKbJlAm0.YLWtY6yLHSQb6YOpkyDvA4Jw6XeaICG', '123456', NULL, 'JAGTIAL', '0', 8, 0, '9030572369', '8522881144', '2025-12-04 16:38:18', '2025-12-04 16:38:18', NULL, NULL, NULL, NULL),
(1575, 'Gangadhar', '8688853631', '$2y$10$wP8PNCNCJdr84VEEA/icpuaTNatEA8.J2XZIXeeFoSUV0ZsnvfYFe', '123456', NULL, 'Isnapure Hyd', '0', 8, 0, '8688853631', '8639974381', '2025-12-05 09:33:34', '2025-12-05 09:33:34', NULL, NULL, NULL, NULL),
(1576, 'Kuraku Mallikarjuna Reddy', '9848654416', '$2y$10$uZBfIvAmhYx0EK7whOmoTuQnnGil4z8SNsrvg6W1pms/.7f6P.lSe', 'Malli@1432', 'assets/user_assets/images/6932bf7612815.IMG_20251205_160509.png', 'Hyderabad', '1000', 8, 0, '9848654416', '8639974381', '2025-12-05 11:18:14', '2025-12-05 09:36:52', '00,gunthapallib.kodur', 'Badvel', 'Andhra Pradesh', '516228'),
(1577, 'Vodyala Pradeep Kumar', '9391349667', '$2y$10$cLfSHA1fZXmGngolARhs1O3MO7nspQu4ZBd3hX9Y.xbmYl7ibB2bC', 'pnsspnss1A*', NULL, 'Hyderabad', '0', 8, 0, '9391349667', '8639974381', '2025-12-05 09:39:26', '2025-12-05 09:39:26', NULL, NULL, NULL, NULL),
(1578, 'Pandori Shirisha reddy', '9652515865', '$2y$10$wqgNoLN2Dl8AIh11/O0B3uq/22zH1YoK7OZLBtn4wyMPHrgm1hqWy', '123456', NULL, 'Beeramguda', '0', 8, 0, '9652515865', 'admin', '2026-02-24 08:45:08', '2025-12-05 12:51:37', NULL, NULL, NULL, NULL),
(1579, 'Thadem  Jayaraj', '7075497133', '$2y$10$hsTqCAp/Ja0COfPOa6m79.fqM/6N/TRc86rqsD0sHwdmhune.fx1S', 'raj437reddy', NULL, 'Yousufguda, Hyderabad', '0', 8, 0, '7075497133', '9652515865', '2025-12-05 14:32:17', '2025-12-05 14:32:17', NULL, NULL, NULL, NULL),
(1580, 'Majeeda begum', '8790710271', '$2y$10$Nmbn0UYLeWOwRWKzGeOvb.kN7h5cKHa.jI3w1I/jT7onYMOpCeAaq', '8790710271', NULL, 'Aasif nagar', '0', 8, 0, '8790710271', '9491443072', '2025-12-06 07:17:39', '2025-12-06 07:17:39', NULL, NULL, NULL, NULL),
(1581, 'Kalyani', '7793992522', '$2y$10$3UWeVIvYZ26OyFPe0zUd5ebjKuhsdRhlkGKCTcneofeO3Xhg2L1i6', '7793992522', NULL, 'Kairathabad', '0', 8, 0, '7793992522', '8790710271', '2025-12-06 15:40:06', '2025-12-06 15:40:06', NULL, NULL, NULL, NULL),
(1582, 'Krishna', '6303522231', '$2y$10$jz7JNk2fUbxkdOODxaGg4urjbrAlxw5qE9NP1cnxdZPUsMz1nbf5C', 'Divya@12345', NULL, 'Hyderabad', '0', 8, 0, '6303522231', 'admin', '2025-12-07 03:39:46', '2025-12-07 03:39:46', NULL, NULL, NULL, NULL),
(1583, 'MADUGU RAMBABU', '7032693310', '$2y$10$cpcNnzp.WwGotCez3zzAF.P.tYZKERmQfNfxNaWUmMlMrlnsturnG', '123456', NULL, 'AMEERPET HYD', '0', 8, 0, '7032693310', '6301373342', '2025-12-07 06:55:01', '2025-12-07 06:55:01', NULL, NULL, NULL, NULL),
(1584, 'Madugumanjula', '7569492091', '$2y$10$Uc/Fpby4xojt.HJUliKJUuicN50Kv4liJDK5IOCj6dd2smqzwevmK', '1234567', NULL, 'Ameerpet', '0', 8, 0, '7569492091', '7032693310', '2025-12-07 07:02:53', '2025-12-07 07:02:53', NULL, NULL, NULL, NULL),
(1585, 'Nazim', '8688163397', '$2y$10$BzvMdfQV1n2/teM1QzMQVOOdYGEfdza0iLeECIu/pOdLhtINYISWy', '143naz', NULL, 'Ameerpet vardhaman bank', '0', 8, 0, '8688163397', '7032693310', '2025-12-07 07:45:29', '2025-12-07 07:45:29', NULL, NULL, NULL, NULL),
(1586, 'Divya', '8919858293', '$2y$10$3jB.LB.aAFpGgeRy6YGLYeyqHCIK2ZFZpzVdop2vxYMvVnAH./es2', 'Divya@123', NULL, 'Hyderabad', '0', 8, 0, '8919858293', 'admin', '2025-12-07 08:34:23', '2025-12-07 08:34:23', NULL, NULL, NULL, NULL),
(1587, 'Mahesh', '8008781703', '$2y$10$JT9ah5mWsdSopyr.aTNEQedE1XM9mTjJVUyilcpDiZcnkzBOm8BIe', 'Mahesh@123', NULL, 'Jangaon', '0', 8, 0, '8008781703', '7032693310', '2025-12-07 08:36:28', '2025-12-07 08:36:28', NULL, NULL, NULL, NULL),
(1588, 'Puli mallikarjuna', '9542587413', '$2y$10$zo417yA7wtFdkT2FX7pabe6e/GSdlTYZbDamZY8D/8aPF05LCoNaW', 'malli123', NULL, 'Andrapradesh kadapa ,annamayya (dist) obili pengaluru', '0', 8, 0, '9542587413', '7032693310', '2025-12-07 08:55:30', '2025-12-07 08:55:30', NULL, NULL, NULL, NULL),
(1589, 'Karthik Bodagala', '8328511271', '$2y$10$mUN81nwlbpdnkAryshZ7duqqhMgs3v32hzOdnaIIthwWOblqQY8xu', '8328511271', NULL, 'Vontimitta konda machu palli Andhra Pradesh', '0', 8, 0, '8328511271', '7032693310', '2025-12-07 09:11:33', '2025-12-07 09:11:33', NULL, NULL, NULL, NULL),
(1590, 'Bodagala KARTHIK', '8639210162', '$2y$10$ULLyo3mHcA4FIVYt3BQTg.g1G50DmWMNZOEfysnTBvW6TWPamDj3W', '8639210162', NULL, 'Kondamachupalli Vontimitta kadapa', '0', 8, 0, '8639210162', 'admin', '2025-12-07 09:16:54', '2025-12-07 09:16:54', NULL, NULL, NULL, NULL),
(1591, 'Rahul', '7093927988', '$2y$10$f7VeAMzJU.QGIKoDxmvjFet/4QqG5xNZVT67eCLynE3wkoqY2li3O', 'In hul123456', NULL, 'Ontimitta', '0', 8, 0, '7093927988', '7032693310', '2025-12-07 09:46:44', '2025-12-07 09:46:44', NULL, NULL, NULL, NULL),
(1592, 'K.abinzer', '9391208363', '$2y$10$FOVLLSZ7tv/XMhX3jW2EHuwpEC50KfyuMnVDNuWwgajBh58YWTA3.', '12@456789', NULL, 'Mahendra showroom near by airport', '0', 8, 0, '9391208363', '7032693310', '2025-12-07 12:42:27', '2025-12-07 12:42:27', NULL, NULL, NULL, NULL),
(1593, 'G BABJI', '9666053423', '$2y$10$V4ccwMQNKA4dzoPBVKeqxufjMHJMpa/S4kXysmA/7Xl36i3W.y/q.', '123456+', NULL, 'HYDERABAD', '0', 8, 0, '9666053423', '8522881144', '2025-12-08 04:17:19', '2025-12-08 04:17:19', NULL, NULL, NULL, NULL),
(1594, 'B KOTAIAH', '9347278139', '$2y$10$QeB6O2vGTBoHcgQFsLLaP.zw.hJl6oTlylYoAJQnGYPC1AOJNADOq', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9347278139', '9666053423', '2025-12-08 04:21:30', '2025-12-08 04:21:30', NULL, NULL, NULL, NULL),
(1595, 'B. Venkatesh', '8309562155', '$2y$10$RKQwEy89aqyxDGhFD78k8OuqnOVFgcB482aYg0oFNLcKanV8hcVVS', 'Venkat@1998', NULL, 'Hyderabad', '0', 8, 0, '8309562155', '8639974381', '2025-12-08 10:38:27', '2025-12-08 10:38:27', NULL, NULL, NULL, NULL),
(1596, 'ANARASI SREERAMULU', '6281625195', '$2y$10$5/y1GB15eQ/jAw0pTidLcOG6J32u66M4N4K0osEJLSLgNzVmtoEVe', '123456', NULL, 'GHATKESAR', '0', 8, 0, '6281625195', '8522852201', '2026-03-19 04:10:40', '2025-12-08 11:35:27', NULL, NULL, NULL, NULL),
(1597, 'SANTHOSH LEGEND', '9505895059', '$2y$10$.upXZWVW1aQN5FD4XcrM.OPh.KLrOfVm1rmmlKxpIvyiOe5rorKO6', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9505895059', '8522881144', '2025-12-09 06:01:11', '2025-12-09 06:01:11', NULL, NULL, NULL, NULL),
(1598, 'Anuradha P', '9703628224', '$2y$10$9/focxWPr52SfeD3cmzDfOyiJcUIM26BVeRoSPYva4BqJA8nqXH0K', 'anuradha123!@#', NULL, 'Hyderabad', '0', 8, 0, '9703628224', '8522881144', '2025-12-09 08:01:00', '2025-12-09 08:01:00', NULL, NULL, NULL, NULL),
(1599, 'GUTUMADUGU KUMAR', '9052711122', '$2y$10$OGSfc0GpHbzw/MwyIX8HxOyYPWSwHZr8FF9nf2hmRqTJtCNaQCJ3e', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9052711122', '9391349667', '2025-12-09 11:38:48', '2025-12-09 11:38:48', NULL, NULL, NULL, NULL),
(1600, 'G BHASKAR', '9100910096', '$2y$10$s/nbIFXg//emDnzOASeUbel4YuvxMT.N6jdeW4WNfC50MeJE9MM7e', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9100910096', '9391349667', '2025-12-09 11:39:34', '2025-12-09 11:39:34', NULL, NULL, NULL, NULL),
(1602, 'saibhargavachaitanya', '6304568639', '$2y$10$7PgqSVO0Hbz9TY09uYKSQu97rd6yw6wUT6YbG3YuQzsb.GBTbBzeC', 'Sai@1997', NULL, 'Moula ali', '0', 8, 0, '6304568639', '9391349667', '2025-12-09 14:31:53', '2025-12-09 14:31:53', NULL, NULL, NULL, NULL),
(1603, 'Y Satyanarayana', '9848116679', '$2y$10$CUwPBYKRS07Ao8sBHYpcbuifNUhxnlnIVDh5v4LRRJvHGF/WjlaoW', '123456', NULL, 'Nizampet HYD', '0', 8, 0, '9848116679', '9100910096', '2025-12-11 09:50:04', '2025-12-11 09:50:04', NULL, NULL, NULL, NULL),
(1604, 'Dudduka Balaraju', '7207701333', '$2y$10$u/4sb8evSIRp/AC/hnHYrOFJ6qCfOjoDxz2wtzHksbPsPaza/qHE.', 'Dbalu9raj@', NULL, 'Nagole', '0', 8, 0, '7207701333', '8522881144', '2025-12-15 11:39:01', '2025-12-15 11:39:01', NULL, NULL, NULL, NULL),
(1605, 'K S RAO', '7893338383', '$2y$10$Sy/W3dmHH2KYvG6wk9YbguBoBOZAd/4CXwKpgnQlv4fCkAt0bUfLS', 'SRINI123', NULL, 'HYDERABAD', '0', 8, 0, '7893338383', 'admin', '2025-12-17 07:34:45', '2025-12-17 07:34:45', NULL, NULL, NULL, NULL),
(1606, 'S Nagarju', '6304619455', '$2y$10$aQ3YBmih15H/K.lVaagrVuHSJut9uBqxcDbP53T6utf7RqG/QgOQi', '6304619455', NULL, 'Hyderabad', '0', 8, 0, '6304619455', '6301373342', '2025-12-17 11:23:49', '2025-12-17 11:23:49', NULL, NULL, NULL, NULL),
(1607, 'T Tejaswi', '9381685994', '$2y$10$1ME.dDxUM.B642ToKBJ.Y.qwSgeaR4Iui1C/GvneVoBZyCm.nlUg.', '123456', NULL, 'Hyderabad', '0', 8, 0, '9381685994', '6301373342', '2025-12-17 12:28:20', '2025-12-17 12:28:20', NULL, NULL, NULL, NULL),
(1608, 'T Mohan Goud', '8639045822', '$2y$10$qu2GJGJjkVwQecpqckc7KeVVmK6ZgcMeJtl4L1dt5Gm2SZ4rLdme.', '8639045822', NULL, 'Hyderabad', '0', 8, 0, '8639045822', '6304619455', '2025-12-17 12:49:43', '2025-12-17 12:49:43', NULL, NULL, NULL, NULL),
(1609, 'P.B.Mahendra', '7330891221', '$2y$10$xcnP0D67IlldeCJoheJlwuFpyP02xRobdgEqaY.WAel6IMhghuGOG', '369963', NULL, 'Dilshuk nagar', '0', 8, 0, '7330891221', '6304619455', '2025-12-17 12:51:36', '2025-12-17 12:51:36', NULL, NULL, NULL, NULL),
(1610, 'Umadevi', '8500773114', '$2y$10$4eVThPVLY51MCjw9b2Mpt.HYZBotdAhE8Cljif3FP/AWkgiktzMEO', '123456', NULL, '12-13-790/2, opp dall mill tarnaka hyd 500017', '0', 8, 0, '8500773114', '8639045822', '2025-12-17 14:31:14', '2025-12-17 14:31:14', NULL, NULL, NULL, NULL),
(1611, 'Ravi Kumar', '7396173769', '$2y$10$elcs/E95jb6WjXol677kOevEWFdSYjb97/mav8t47G9lkLFZi9wN.', 'Ait009@', NULL, 'Hyderabad', '0', 8, 0, '7396173769', '6304619455', '2025-12-18 08:05:38', '2025-12-18 08:05:38', NULL, NULL, NULL, NULL),
(1612, 'Kavitha', '8309746911', '$2y$10$FNK7DbJhUoQ74m/kyY/Ke.EinbsZqYqeGY7aB7IfFxFiDnivKLr3e', '123456', NULL, '123456', '0', 8, 0, '8309746911', '9542003748', '2025-12-28 13:12:41', '2025-12-18 08:54:39', NULL, NULL, NULL, NULL),
(1613, 'K Padma', '9866517708', '$2y$10$eMmkMp62dk/Qe3bmuvhoLes/0fYRuzKrIAAcHLmcyUSstqbQ7AspO', '123456', NULL, 'Hyderabad', '0', 8, 0, '9866517708', '8639045822', '2026-01-20 13:41:09', '2025-12-18 10:17:53', NULL, NULL, NULL, NULL),
(1614, 'Uday kiran darugupalli', '9912411055', '$2y$10$cQ0xtfwepS9NA9d/w8xm1ebo1D4Q0RatXljQYs.EQqWcQivX6t09i', 'Ud@y11055', NULL, 'Hyderabad', '0', 8, 0, '9912411055', '7330891221', '2025-12-18 11:12:33', '2025-12-18 11:12:33', NULL, NULL, NULL, NULL),
(1615, 'Vattepu Ramu', '9133076076', '$2y$10$Lp7v16ngK/9g7X/W5gs8z.8A473ALoJ1yXFO.l1OcjDlRsddGiXvy', 'Ra.u@1234567', NULL, 'Ramu@1234567', '0', 8, 0, '9133076076', 'admin', '2025-12-18 12:10:15', '2025-12-18 12:10:15', NULL, NULL, NULL, NULL),
(1616, 'P.ANITHA', '9346193908', '$2y$10$mPrGnqS2ByGMo4.cU8Ekmu05N9lfJmBhYkui6vWh.7tXxyHOypVHu', '123456', NULL, 'Hyderabad', '0', 8, 0, '9346193908', '6301373342', '2025-12-18 12:33:03', '2025-12-18 12:33:03', NULL, NULL, NULL, NULL),
(1617, 'kavitha', '8555979890', '$2y$10$kPD7EMSkNbC8ue7T/czW.OR8RKX.L3VI91hzdEZnI6.Zc.ORYDkz2', '123456', NULL, 'Hyderabad', '0', 8, 0, '8555979890', '9346193908', '2025-12-18 12:39:05', '2025-12-18 12:39:05', NULL, NULL, NULL, NULL),
(1618, 'Pushpanjali', '9133167625', '$2y$10$b/6xLIfoDGhh3KZYcxpQZucl/UjwMfm0b9yJKCcmwyulQIM0A4nSq', '9133167625', NULL, 'Kohapet', '0', 8, 0, '9133167625', '8639045822', '2025-12-19 04:16:57', '2025-12-19 04:16:57', NULL, NULL, NULL, NULL),
(1619, 'ganesh pamar', '8657924197', '$2y$10$oCwj0EIWhgTYNHF4.fIX1.poAT8B448kJUnKucyw7zVaft0YcDEEu', 'Ganesh@321', NULL, 'Mumbai', '0', 8, 0, '8657924197', 'admin', '2025-12-19 06:58:33', '2025-12-19 06:58:33', NULL, NULL, NULL, NULL),
(1620, 'VIDIYALA SRINIVAS', '6281559694', '$2y$10$fKpD8B2K4VXD3fLl8hswPeQiGDo181mbeDOTuGP6uVVxe4pL1Ai3m', '459999', NULL, 'HYDERABAD', '0', 8, 0, '6281559694', '9133167625', '2025-12-19 07:27:26', '2025-12-19 07:27:26', NULL, NULL, NULL, NULL),
(1621, 'Ravi varma', '7013426879', '$2y$10$5djV0UHVZ.kwcMFhuRDZOuarF5VI/23vzngehMy5dQ1.sQLYhPM3y', '7013426879', NULL, 'Kothapet', '0', 8, 0, '7013426879', '6281559694', '2025-12-19 07:40:37', '2025-12-19 07:40:37', NULL, NULL, NULL, NULL),
(1622, 'Krishna', '9550306333', '$2y$10$0lbvFa/mtXjtrGd.AW7Ve.Y5MOkAeTVb0KeGvbvE2AReJV7FL2Ghi', '1234', NULL, 'Hyderabad', '2000', 8, 0, '9550306333', '8639974381', '2026-01-08 07:42:24', '2025-12-19 12:55:46', NULL, NULL, NULL, NULL),
(1623, 'Likitha', '9542003748', '$2y$10$Smu4ov3Z325vPePmxUQmO.8XpzNHh8cGiCbvP6OKnH.o5A0bsiHFi', '123456', NULL, 'Hyderabad', '0', 8, 0, '9542003748', '6301373342', '2025-12-20 06:40:33', '2025-12-20 06:40:33', NULL, NULL, NULL, NULL),
(1624, 'Sai karthik', '9966618556', '$2y$10$Npz3tyuHvJEakXAF2YYGPeqbsiMTr15SukYqHa7RBv3fsFStkZ3b.', '123456', NULL, 'Hyderabad', '0', 8, 0, '9966618556', '9390596123', '2025-12-28 12:30:31', '2025-12-20 07:28:47', NULL, NULL, NULL, NULL),
(1625, 'Anil Kumar', '7799226456', '$2y$10$xwMUjY16uoj8Q0aD0bR4xuPkAq8qjqkQY13psgoiFUFilcJG1aT6O', '123456', NULL, 'Hyderabad', '0', 8, 0, '7799226456', '9966618556', '2025-12-20 07:45:24', '2025-12-20 07:45:24', NULL, NULL, NULL, NULL),
(1626, 'V Raghu Ram', '9490754079', '$2y$10$4KxrhMER49ciKhX1e8fFZerQSxxA5pHEQm32xM6GJR2jagKcYYJda', '961196', NULL, 'Hyderabad', '0', 8, 0, '9490754079', '7330891221', '2025-12-20 14:41:36', '2025-12-20 14:41:36', NULL, NULL, NULL, NULL),
(1627, 'Balanarsimha', '8639999012', '$2y$10$z4RhlqMnEyBU6gpIBOhzR.5pjGa0LRnB61NhEJFI1ubyGT8ZCeEyK', '123456', NULL, 'Hyderabad', '0', 8, 0, '8639999012', '9348902555', '2025-12-28 13:14:10', '2025-12-21 09:11:56', NULL, NULL, NULL, NULL),
(1628, 'Srinivas gupta', '9348902555', '$2y$10$qWBHNvkhag3DfRLdYMiSz.PhVZglGDPWsgZOlNF5rvaTjsikbMhBW', '123456', NULL, 'Hyderabad', '0', 8, 0, '9348902555', '8639045822', '2025-12-21 09:17:42', '2025-12-21 09:17:42', NULL, NULL, NULL, NULL),
(1629, 'Srinivas Rao', '7288003534', '$2y$10$LuDyiQf7ChTQPhs72tepMu/4mLoZPpOoLwkZ3hWtwCppQ7xfgiWgC', '123456', NULL, 'Hyderabad', '0', 8, 0, '7288003534', '8639999012', '2025-12-21 09:22:23', '2025-12-21 09:22:23', NULL, NULL, NULL, NULL),
(1630, 'Poluguram Mahender', '9391920638', '$2y$10$gRnz/uAppfgZi00Qa4IYuO6mbLy3xOJx3nr9VOT0VeLyuQhYxQOvC', '123456', NULL, 'Ghatkesar HYD', '0', 8, 0, '9391920638', '9390596123', '2025-12-28 12:31:25', '2025-12-21 10:47:05', NULL, NULL, NULL, NULL),
(1631, 'Haritha', '7013303614', '$2y$10$t8ivIT4JDAuLYUXmgtXE5uZyDN/e1QSsMXiRiPmDGUa99ECLTae12', 'ashi12521', NULL, 'Vemula village, jogulambha Gadwal distric', '0', 8, 0, '7013303614', '7330891221', '2025-12-22 07:12:36', '2025-12-22 07:12:36', NULL, NULL, NULL, NULL),
(1632, 'Shashank Kumar', '9866077460', '$2y$10$vxNzDYkwmgE9m44Co0vNOOcIWFtylNDhLDMJq45/46xqkphjVOiOW', 'shashank@2025', NULL, 'Hyderabad, Telangana, India', '0', 8, 0, '9866077460', '8639974381', '2025-12-22 09:40:57', '2025-12-22 09:40:57', NULL, NULL, NULL, NULL),
(1633, 'Vasudha', '7981578742', '$2y$10$g1G.yB3aYQGDHacRem6Hr.FwM/G.8p0FdBlbchy4bLwOpMDHlU7fm', '0310', NULL, 'TKR COLLEGE', '0', 8, 0, '7981578742', '8639974381', '2025-12-22 13:30:39', '2025-12-22 13:30:39', NULL, NULL, NULL, NULL),
(1634, 'R.venkatramreddy', '9392353185', '$2y$10$sngwHNduROOi4/mto9G47.u4hODL4jdSskwKqz1doNrd.ZICD.kji', '123456', NULL, '500062', '0', 8, 0, '9392353185', '9491443072', '2025-12-22 14:09:09', '2025-12-22 14:09:09', NULL, NULL, NULL, NULL),
(1635, 'Sandeep Kumar Sammeta', '7337200733', '$2y$10$JGf0jfdT71/3h.yp30s.xuHWXDGRhhkZy9DLFxIz6Mx95PL9.ZN9G', '1234567', NULL, 'Medipally', '0', 8, 0, '7337200733', '9550306333', '2025-12-22 15:02:55', '2025-12-22 15:02:55', NULL, NULL, NULL, NULL),
(1636, 'Gaddam venu', '9948655502', '$2y$10$HJxuZB2r5xKaNu2EOkZPxe5KkGn/8iBC9VukTJahGYLyu0fRnqosC', '2013', NULL, 'KAPRA, Hyderabad', '0', 8, 0, '9948655502', '9550306333', '2025-12-22 15:30:54', '2025-12-22 15:30:54', NULL, NULL, NULL, NULL),
(1637, 'Sowmya Navaneetam', '9391115169', '$2y$10$Rfw18TpSZ8OjOYEo1cPSSeT/EWuxWSShhoLxfoHjMVaOznHpc.i5O', 'Sowmya@24', NULL, 'Kukatpally', '0', 8, 0, '9391115169', '8639974381', '2025-12-23 05:37:34', '2025-12-23 05:37:34', NULL, NULL, NULL, NULL),
(1638, 'Divya', '9133959377', '$2y$10$La9pmI5swLF/.YexxZIrYuG/P848pa5VdTAAdpJ2BL1qWfObDT0q.', 'Divya@2025', NULL, 'Kukatpally', '0', 8, 0, '9133959377', '8639974381', '2025-12-23 05:40:27', '2025-12-23 05:40:27', NULL, NULL, NULL, NULL),
(1639, 'G. Aanand', '7095525517', '$2y$10$Y/7ddj0fZlfFMaqab1FmxuPXo3RoSkJ.Nad6UstcjfWcrtUbkF71W', 'Aanand@2025', NULL, 'Hydernagar', '0', 8, 0, '7095525517', '8639974381', '2025-12-23 05:44:19', '2025-12-23 05:44:19', NULL, NULL, NULL, NULL),
(1640, 'A Karthik', '9032376355', '$2y$10$pbTF8H.l.qCGNXnk1PZ1U.XaDJHN9UV2ic3KhXWBwi1RJQWCNRnz2', '123456*-+', NULL, 'Hyderabad', '0', 8, 0, '9032376355', '8639974381', '2025-12-23 07:16:36', '2025-12-23 07:16:36', NULL, NULL, NULL, NULL),
(1641, 'Satish', '9010557766', '$2y$10$It6eyIa8FOLkJ190.VryFeVmISY1CnZiHWY0v5mJzaD44wQCeyNbq', 'satish@#557766', NULL, 'Yousfguda', '0', 8, 0, '9010557766', '7330891221', '2025-12-23 08:00:40', '2025-12-23 08:00:40', NULL, NULL, NULL, NULL),
(1642, 'harish.kankatala@gmail.com', '9951799518', '$2y$10$t0Zz34MVGMnz.Q8xwaSZOuMac8rPyy.ImvVnl.K61V3nPkIF6P69m', 'amma123@', NULL, 'Ameerpet', '0', 8, 0, '9951799518', '8639974381', '2025-12-23 09:55:20', '2025-12-23 09:55:20', NULL, NULL, NULL, NULL),
(1643, 'Manohar', '9390736524', '$2y$10$t.AjeZ0eNoeArQoXDl6RQujNb1NOrFzpBcZir06jNi9SbgASEmEQm', 'A1234567', NULL, 'Hy', '0', 8, 0, '9390736524', '8639974381', '2025-12-23 11:11:28', '2025-12-23 11:11:28', NULL, NULL, NULL, NULL),
(1644, 'Charani', '9381880682', '$2y$10$OAPwRJPNGmlTwhZIjkDri.hc5F6uYNOty4DI7pxG3ZeUpvcA.tksK', '12335', NULL, 'Hyderabad', '0', 8, 0, '9381880682', '8639974381', '2025-12-23 11:33:35', '2025-12-23 11:33:35', NULL, NULL, NULL, NULL),
(1645, 'Suma latha', '9299995509', '$2y$10$IRKcw6MJIT4F4I9.QKYEKOsyVS/Qswa/2P3yS.kQg/Ya0oUlbn8iK', '12345', NULL, 'Hyderabad', '0', 8, 0, '9299995509', '8639974381', '2025-12-23 11:38:23', '2025-12-23 11:38:23', NULL, NULL, NULL, NULL);
INSERT INTO `service_users` (`service_id`, `member_name`, `member_phone`, `password`, `open_password`, `user_profile_pic`, `location`, `cumulative_gross`, `commission_percentage`, `back_two_back_balance`, `referral_id`, `referral_by`, `created_at`, `joined_date`, `address`, `city`, `state`, `pincode`) VALUES
(1646, 'Nagaraju', '9441634618', '$2y$10$A4TFu0yZfRtpT/7sa6NrGedOHg51YXwDin41hU2w1ongfG0x.yiyS', 'Naga@125', NULL, 'Uppal Hyderabad', '0', 8, 0, '9441634618', '9948413855', '2026-01-23 12:59:57', '2025-12-23 11:42:54', NULL, NULL, NULL, NULL),
(1647, 'Sandeep Kumar', '9963311235', '$2y$10$mgxQe5YzTmfz9W5zfGRu9e.yklVwt.qGRGaIeyZSqjPlJ.Mxxz1ue', 'Sandeep123!@#', NULL, 'Hyderabad', '0', 8, 0, '9963311235', '9703628224', '2025-12-23 13:17:01', '2025-12-23 13:17:01', NULL, NULL, NULL, NULL),
(1648, 'Mahendar', '7396963464', '$2y$10$K/RxU4UtShG1GtEGt.DjNu3gOiHek5RMna9Djs8NcLdlgziRdpYcy', '1988', NULL, 'Secunderabad', '0', 8, 0, '7396963464', '8639974381', '2025-12-23 13:40:15', '2025-12-23 13:40:15', NULL, NULL, NULL, NULL),
(1649, 'Banoth Prabhakar', '6281892018', '$2y$10$A.72YrBqIwFC/bhs/dj9m.FOpMJhO90uVSZKRO4WdX5DF1mH1gUTu', 'Nupass#1212', NULL, 'Ameerpet Hyderabad', '0', 8, 0, '6281892018', 'admin', '2025-12-23 14:18:51', '2025-12-23 14:18:51', NULL, NULL, NULL, NULL),
(1650, 'Veerender M', '7416692562', '$2y$10$2mN431Io1MmlMbNqM4JxROrLmKLPzNWSn5Hi2T/IqOA5BorgECN6a', '123456', NULL, 'Hyderabad', '0', 8, 0, '7416692562', '8639974381', '2025-12-23 15:05:08', '2025-12-23 15:05:08', NULL, NULL, NULL, NULL),
(1651, 'Belle Malleshwar', '9989096588', '$2y$10$6eTDRYZK0Yj9qkAmaXjI2enG3KeMiuh50v/7/FHm6KPu1rWsBN5ny', '123456', NULL, 'Hyderabad', '0', 8, 0, '9989096588', '9912411055', '2025-12-24 04:30:08', '2025-12-24 04:30:08', NULL, NULL, NULL, NULL),
(1652, 'B.Sreenivas Rao', '9848468789', '$2y$10$Mc.FqQMmVJOLwX0xM/YfousbTtXxUpyOuwrHJBNuK.r4gTH.9iAcO', 'Sreenu@7909', NULL, 'Dammaiguda', '0', 8, 0, '9848468789', '8919939629', '2025-12-24 07:14:33', '2025-12-24 07:14:33', NULL, NULL, NULL, NULL),
(1653, 'Anand', '8008680834', '$2y$10$lgvir/JNWg4OZSmqCT.EpOAykcE6y7a11t9G6t77eKSL7AnitUDpq', '1234', NULL, 'Hyderabad', '0', 8, 0, '8008680834', '8639974381', '2025-12-24 11:58:43', '2025-12-24 11:58:43', NULL, NULL, NULL, NULL),
(1654, 'Gummadi Praveen Reddy', '8019021322', '$2y$10$uBqYgXW32CopVFF9oAAJvOHwMitI2e4qa4aT4jyctPQ1uC1SikKDm', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8019021322', '9390596123', '2025-12-28 12:31:49', '2025-12-25 04:21:38', NULL, NULL, NULL, NULL),
(1655, 'Neela Mallesh Kurma', '9492432459', '$2y$10$CVRTFCayyXK.gvOpS27aa.KjK77BrpTIH.NG7hHFmWD7p0tqfxJGu', '123456', 'assets/user_assets/images/694d09fb154ce.IMG_20251219_163342.jpg', 'HYDERABAD', '0', 8, 0, '9492432459', '9390596123', '2025-12-28 12:32:13', '2025-12-25 04:27:32', 'Moosapet', 'Hyderabad', 'Telangana', '500018'),
(1656, 'CH MALATHI', '7396021536', '$2y$10$XuzyInIvNaJvUW0NHoJca.SV6pksFyySGo3Ar/jbmElsnrzbpKMBa', '123456', NULL, 'HYDERABAD', '13000', 8, 13000, '7396021536', '8522881144', '2026-01-14 04:40:57', '2025-12-25 05:50:01', '8-3-940, Yella Reddy Guda Rd', 'Hyderabad', 'Telangana', '500033'),
(1657, 'CH SRIKANTH', '8309877417', '$2y$10$hcfHvlgcc8yiUQFQwTki5OKdMcerPXTrjfVkEfF6eVrzt7eHt2O6.', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8309877417', '7396021536', '2025-12-25 05:53:27', '2025-12-25 05:53:27', NULL, NULL, NULL, NULL),
(1658, 'K SAI PRIYA', '9133410890', '$2y$10$ydBZokjc0wNLIQUYOqEyv.x.DCsSvR6lMy9sAB2deKNXLmoPjkOFq', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9133410890', '7730099707', '2025-12-25 06:04:33', '2025-12-25 06:04:33', NULL, NULL, NULL, NULL),
(1659, 'Vision Board Ramesh', '9966591915', '$2y$10$F/1yFS1JY0OFFwZc.4e0Cu/dJQYegUzd/J3.FfnxOnYWtE5wcqqda', '123456', NULL, 'Hyderabad', '1000', 8, 0, '9966591915', '9550306333', '2026-01-08 07:42:24', '2025-12-25 10:27:42', 'Balanagar', 'Hyderabad', 'Telangana', '500042'),
(1660, 'P Vijayalaxmi', '8977739929', '$2y$10$SkzU3vuJ.97o5GLpFx8.jesUqoLJi1mc7VRQM6FcEUrn7fQNJiL8.', '123456', NULL, 'Hyderabad', '0', 8, 0, '8977739929', '6301373342', '2025-12-26 09:33:05', '2025-12-26 09:33:05', NULL, NULL, NULL, NULL),
(1661, 'Macha mahesh kumar', '9441326287', '$2y$10$8Cmx3t1wLMOKKkMiAG43VOBYXJA3teRmHwQ1rvBqnAzR.YNvVAutK', 'Macha@123', NULL, 'Peddapalli', '0', 8, 0, '9441326287', '8919939629', '2025-12-27 06:34:59', '2025-12-27 06:34:59', NULL, NULL, NULL, NULL),
(1662, 'Shivaprasad', '8374412396', '$2y$10$uOZaiTbWaewNVS5arAChBuc9P2uhN6sg8Jik6sJHoxzLmZf2sYWe.', 'Online ', NULL, 'Hyderabad', '0', 8, 0, '8374412396', '9492432459', '2025-12-27 07:16:10', '2025-12-27 07:16:10', NULL, NULL, NULL, NULL),
(1663, 'Kanmankalva Rajeshwar Goud', '7330685959', '$2y$10$kq2CHE3zFgizTVxjfm6BEuVSPBmbJL6KkvFNuwtW4X/UbJvNmf4B6', 'Rajugoud@69', 'assets/user_assets/images/695318c59b58f.1000116566.jpg', 'B n reddy nagar', '0', 8, 0, '7330685959', '8309746911', '2025-12-30 00:11:49', '2025-12-27 07:41:18', 'Plot no 288 new nandhi hills road no13 near SBI bank', 'RANGA REDDY', 'Telangana', '500097'),
(1664, 'A sushma', '9100530664', '$2y$10$lK6gVzkoTJBUn98sU9D0YuCK0HPiqAWttpCXOgahUlOhE97OxMgFC', 'Rishu@1203', NULL, 'Jammikunta', '0', 8, 0, '9100530664', '8919939629', '2025-12-27 11:17:36', '2025-12-27 11:17:36', NULL, NULL, NULL, NULL),
(1665, 'LAGISHETTY. LAXMINARAYANA', '9704223295', '$2y$10$K4ZCc/BNdoa3ZDqv02DusO03woZpQXpLANAbd8SkkEyR8rc7M5nOK', 'L3295', NULL, 'Jangaon', '0', 8, 0, '9704223295', '8309746911', '2025-12-27 13:05:32', '2025-12-27 13:05:32', NULL, NULL, NULL, NULL),
(1666, 'Bandi Shirisha', '6304819631', '$2y$10$gD7R.ElePJh9jJOmzTVc9etuu2luILWSM6scIcY1c7QHm/hex7VR6', 'siri1989', NULL, 'Hanamkonda', '0', 8, 0, '6304819631', '8919939629', '2025-12-29 06:45:05', '2025-12-29 06:45:05', NULL, NULL, NULL, NULL),
(1667, 'Sanjeevareddy katam', '7396144914', '$2y$10$4STG2wQcUZfUbvaTTrhF6.WC0y.3eJrD6OsHMqApWW3qOnIRrzZ7W', '123123', NULL, 'Huzurabad', '0', 8, 0, '7396144914', '8919939629', '2025-12-29 09:10:16', '2025-12-29 09:10:16', NULL, NULL, NULL, NULL),
(1668, 'Krishnareddy', '9701945753', '$2y$10$ITnp7mndjN1AT.wyHaHxY.h1eexTIc5t.hNZJUmzDVIoQSCHAHfdy', '7093768027', NULL, 'Kachapoor', '0', 8, 0, '9701945753', '8919939629', '2025-12-29 09:44:05', '2025-12-29 09:44:05', NULL, NULL, NULL, NULL),
(1669, 'Vennelareddy', '8919735512', '$2y$10$aIHn/fcgreICOVwfyYwtO.7oz06wW7BXICxt0MEjrpCmNZ.EulA.m', 'Nishu@24', NULL, 'Huzrabad', '0', 8, 0, '8919735512', '8919939629', '2025-12-29 09:55:11', '2025-12-29 09:55:11', NULL, NULL, NULL, NULL),
(1670, 'CHILUKA MALLESH', '8519922900', '$2y$10$CBzF2MbxWDQP7sFUqVJLfePm3FDc0Yrjs.f8eCPT9PaOnoktuR1b.', '20131576', NULL, '20131576', '0', 8, 0, '8519922900', '8919939629', '2025-12-29 10:03:27', '2025-12-29 10:03:27', NULL, NULL, NULL, NULL),
(1671, 'GIKKI RANADHEER KUMAR', '9676241565', '$2y$10$NPZ2pT87sOPdkbs3dYNbr.uptivx7GzeS2bc.CDR22xqcpr8svfj2', 'Ranadheer@1981', NULL, 'KPHB COLONY', '0', 8, 0, '9676241565', '9705910096', '2025-12-29 13:24:15', '2025-12-29 13:24:15', NULL, NULL, NULL, NULL),
(1672, 'Kanmankalva sabitha', '9000617753', '$2y$10$DelrI7lXuVNRjgE7l2XTLeBQ1x3d3u5DhfCpL4OGoXkG4//9RkkjO', '123456', NULL, 'B n reddy nagar', '0', 8, 0, '9000617753', '7330685959', '2025-12-29 23:57:30', '2025-12-29 23:57:30', NULL, NULL, NULL, NULL),
(1673, 'Murali Krishna Singu', '9912344134', '$2y$10$NPGt7J9BX389V4Mv1OJDjOpQ4ZszwQAAfjYoNtHZ8QBuvLgcIaph2', 'bujji1973', NULL, 'Hydarabad', '0', 8, 0, '9912344134', '9390596123', '2025-12-30 02:12:59', '2025-12-30 02:12:59', NULL, NULL, NULL, NULL),
(1674, 'B prevean', '9640985324', '$2y$10$wcDJao4XqvDminxP4MjmCuvKwHIOYeBvBvzxS1Nd/AEi/AxetC2x6', '123456', NULL, 'Rajendranagar', '0', 8, 0, '9640985324', '6301373342', '2025-12-30 10:23:28', '2025-12-30 10:23:28', NULL, NULL, NULL, NULL),
(1675, 'Manga', '8179126545', '$2y$10$rk2lTKpG7/zrOJmdFzidaeEVzyg59Bc0BKPtHi8Xt7WARemqzinle', '123456', NULL, 'Rajendranagar', '0', 8, 0, '8179126545', '9640985324', '2025-12-30 10:25:47', '2025-12-30 10:25:47', NULL, NULL, NULL, NULL),
(1676, 'Yepuri Nagalakshmi', '8919793255', '$2y$10$IMPM8sPRlVhp4PaHklQ3c.TY1qROFNeUJyvdG9SIk6ZQKSJIvuahi', '5756', NULL, 'Y. N LAKSHMI,flat no:-301, Vagdevi residency Padma Nagar phase -2 chintal', '0', 8, 0, '8919793255', '6301373342', '2025-12-30 10:58:50', '2025-12-30 10:58:50', NULL, NULL, NULL, NULL),
(1677, 'Mididam MuralidharRao', '8333077851', '$2y$10$fd0oypNh11fc7iOjXWxU9.Zwsn.cxAW1NvV9wpjSGaEv8yl2eu/FW', '123456', NULL, 'Suraram Hyderabad', '15000', 10, 3000, '8333077851', '9390596123', '2026-03-31 04:05:01', '2025-12-30 11:56:33', 'HYDERABAD', 'Hyderabad', 'Telangana', '500055'),
(1678, 'SUNIL KUMAR KANDI', '9908634412', '$2y$10$nC4P9PUTRV3fkEH/rtv8zOfmQWCv/WEusDoLz2TLasTcuD7SuljQC', '123456', NULL, 'Dammaiguda', '0', 8, 0, '9908634412', '9390596123', '2025-12-30 12:25:42', '2025-12-30 12:25:42', NULL, NULL, NULL, NULL),
(1679, 'MANJULA', '9848083214', '$2y$10$RgDVmRDEHSFX.Wel3H5jXeeqv02v59oWmZSwCwIQnESdy4Noz5nO6', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9848083214', '8309746911', '2025-12-31 06:27:26', '2025-12-31 06:27:26', NULL, NULL, NULL, NULL),
(1680, 'Suram Venkatesh', '7660054449', '$2y$10$gXA/bRNTYqWDdnYSVCptgOcL.i/nP24VcrfEsBJ4aHiZFRSCwvg26', '123456', NULL, 'Hyderabad', '0', 8, 0, '7660054449', '6301373342', '2025-12-31 13:26:05', '2025-12-31 13:26:05', NULL, NULL, NULL, NULL),
(1681, 'Mohana chary Gannoju', '9949589932', '$2y$10$qxb7iKobT2A09iLBy5WZteMy8aTeiVdoG2jgpL7Uqg1yqQDTdAGu6', 'Gmohan@123', NULL, 'Hyderabad', '0', 8, 0, '9949589932', 'admin', '2025-12-31 19:32:11', '2025-12-31 19:32:11', NULL, NULL, NULL, NULL),
(1682, 'Soma Pushpalatha', '7780313225', '$2y$10$PWP81npE9EqYJYtLDcZ08O9NdP/D7KrvpI2HD23YbKVWHNKAZ5UPK', '123456', NULL, 'Hyderabad', '0', 8, 0, '7780313225', '6301373342', '2026-01-01 10:52:01', '2026-01-01 10:52:01', NULL, NULL, NULL, NULL),
(1683, 'M. Shyamala', '9398914677', '$2y$10$d.6JNWJ7kDzKJ106vDq2o.Pc6q/ZkUjn2wlBRouDGkbqKOkqkoR4.', '123456', NULL, 'Hyderabad', '0', 8, 0, '9398914677', '6301373342', '2026-01-02 06:43:12', '2026-01-02 06:43:12', NULL, NULL, NULL, NULL),
(1684, 'REHANA BEGUM', '8886489720', '$2y$10$IZl.iH6zqM8cDzzPX4BJR.xz60D5E7qygmt4G.P9yVzOAn6UWJiom', '8886489720', NULL, 'Hyderabad', '0', 8, 0, '8886489720', '8790710271', '2026-01-02 09:14:38', '2026-01-02 09:14:38', NULL, NULL, NULL, NULL),
(1685, 'FARZANA BEGUM', '7095383042', '$2y$10$uRcA0F1OjTykkZkKIhHvCecejsARXvsaNnQQt5Km3gRAO5GikdFP.', '7095383042', NULL, 'Hyderabad', '0', 8, 0, '7095383042', '8790710271', '2026-01-02 09:19:16', '2026-01-02 09:19:16', NULL, NULL, NULL, NULL),
(1686, 'Raisa.  Begum', '8340080698', '$2y$10$iM/6oirlzL2BZX63FvT5A./MTwsSov11spY/m9nDZT4BcuWWpgh3e', '8340080698', NULL, 'Hyderabad', '0', 8, 0, '8340080698', '8790710271', '2026-01-02 09:24:00', '2026-01-02 09:24:00', NULL, NULL, NULL, NULL),
(1687, 'Yasmeen sultana', '8688860402', '$2y$10$t6mKc58mYGyW8bZh42ixzOsaN.BvWbIclhYygH51VDHQSQ3KwGT/e', '8688860402', NULL, 'Hyderabad', '0', 8, 0, '8688860402', '8790710271', '2026-01-02 09:33:30', '2026-01-02 09:33:30', NULL, NULL, NULL, NULL),
(1688, 'Anjum sultana', '7659867868', '$2y$10$koy1nvPYfut5ltShjdLRPeVmzYE/IONBVrp91fyKJzFXSOEseON9C', '7659867868', NULL, 'Hyderabad', '0', 8, 0, '7659867868', '8790710271', '2026-01-02 09:41:56', '2026-01-02 09:41:56', NULL, NULL, NULL, NULL),
(1689, 'Mohd Masood', '9948913114', '$2y$10$Xoi3ZKRjU6fhz6TJcJFh/udqj6JrkLsEtRj22hPvnPjIAi8Lq7TLO', '9948913114', NULL, 'Hyderabad', '0', 8, 0, '9948913114', '8790710271', '2026-01-02 09:50:21', '2026-01-02 09:50:21', NULL, NULL, NULL, NULL),
(1690, 'SURAJ VYAS', '7893739677', '$2y$10$3IthJHygT8xqF5raNz/yfO3CgTOWAQQBPMctj3008kVt/84.OnFcK', '123456', NULL, 'HYDERABAD', '0', 8, 0, '7893739677', '9390596123', '2026-01-02 12:56:38', '2026-01-02 12:56:38', NULL, NULL, NULL, NULL),
(1691, 'Yogesh Konda', '8143190828', '$2y$10$XiMJkOTvA1gfkIMjFRFlIOYPsXVTypmTvWGfFpRGVarWg7.aVB7Ya', 'ADDmag', NULL, 'ADDmag', '0', 8, 0, '8143190828', 'admin', '2026-01-03 02:55:45', '2026-01-03 02:55:45', NULL, NULL, NULL, NULL),
(1692, 'RATNAN GANGADHAR GOUD', '9951841382', '$2y$10$0xVFnKmGOYn6cW1BHDZhYONK08oxgUfYLnoPrw6WYKUBR/C7GYBRe', '123456', NULL, 'Nagole - Hyderabad', '0', 8, 0, '9951841382', '9390596123', '2026-01-03 06:30:57', '2026-01-03 06:30:57', NULL, NULL, NULL, NULL),
(1693, 'Ajay Kumar Yadgiri', '8008790469', '$2y$10$VdL9iocePH1LVwBwA.Oq2.vRzQESqXYy4epwZdxDC6XKWCay8IbGC', '123456', NULL, 'Banjara hills', '0', 8, 0, '8008790469', '8019021322', '2026-01-03 06:45:43', '2026-01-03 06:45:43', NULL, NULL, NULL, NULL),
(1694, 'Edgi mahesh kumar', '7036580576', '$2y$10$0jl3iqCPYJib3.oWCXy3F.ohUgpsGJQZVcIOcXAf6.myDYSZiUZOC', '123456', NULL, 'Hyderabad', '0', 8, 0, '7036580576', '7330685959', '2026-01-03 08:39:37', '2026-01-03 08:39:37', NULL, NULL, NULL, NULL),
(1695, 'Stivan', '9505486802', '$2y$10$0ND4uSZMHNYXtUGDlUHC5.ROhLptVzTCLbvdo8C7A.BfRB1I0D0q.', '123456', NULL, 'Boduppal', '0', 8, 0, '9505486802', '7036580576', '2026-01-03 08:46:11', '2026-01-03 08:46:11', NULL, NULL, NULL, NULL),
(1696, 'A. Aruna', '9490643935', '$2y$10$CQ1jf.Lb4HUVw3CrZCYZKu44sRlJWaB4sVsi6mpQMEMv2mHduGUjW', '123456', NULL, 'Hyderabad', '0', 8, 0, '9490643935', '6301373342', '2026-01-03 08:48:59', '2026-01-03 08:48:59', NULL, NULL, NULL, NULL),
(1697, 'GAGULOTH KRISHNA', '7286963204', '$2y$10$yM6riZFzXVC0KWXkiZlZBOGlXJ3my.OnHWVEC4fkbiEA9QHE8LTxm', '123456', NULL, 'Kapra - Secunderabad', '3000', 8, 3000, '7286963204', '9390596123', '2026-02-16 05:12:16', '2026-01-03 08:59:34', 'Plotno 9 kalyanpuri colony near kandiguda xroad sainkpuri', 'Hyderabad', 'Telangana', '500086'),
(1698, 'Yasmeen Sultana', '8333956966', '$2y$10$QMmoMhxVAB/c8mJ5hTw.x.azXXQbenF10f5Pkrwg/0/HC0yntfLK.', 'ZAhoor@786', NULL, 'Hyderabad', '0', 8, 0, '8333956966', '8790710271', '2026-01-03 09:10:12', '2026-01-03 09:10:12', NULL, NULL, NULL, NULL),
(1699, 'j sreedevi', '9959528086', '$2y$10$qNB0WplLTYqKIxNcs.XxW.NAzMN6Nhov608CKJHYrOImMvH0g1VKq', '99595228086', NULL, 'Hyderabad', '0', 8, 0, '9959528086', '9491443072', '2026-01-03 10:24:14', '2026-01-03 10:24:14', NULL, NULL, NULL, NULL),
(1700, 'Divya Sree', '9550822714', '$2y$10$YloA649kHolT9DB28BP7GOhoqsJpf9Fc0y/i4Ms9XyvaAm7V6/j5.', '9550822', NULL, 'Hyderabad', '0', 8, 0, '9550822714', '8019021322', '2026-01-03 10:25:55', '2026-01-03 10:25:55', NULL, NULL, NULL, NULL),
(1701, 'Aleti Chandrakala', '8125108500', '$2y$10$nErbc5h8/UCtr8Ju5lE4K.A3Sy.SkH3GHCyD8s4q4H1r3EQ5Nb7V2', '8125108500', NULL, 'Hyderabad', '0', 8, 0, '8125108500', '9491443072', '2026-01-03 11:07:21', '2026-01-03 11:07:21', NULL, NULL, NULL, NULL),
(1702, 'BITCHALA CHANDRASHEKHAR', '9440759449', '$2y$10$i4wfIxsYF3d96cqix43tUuEI2ZZHiafuUsf8RPkkp05GVKPkfd7xa', '1989', NULL, 'Chitrapuri colony manikonda', '0', 8, 0, '9440759449', '7330685959', '2026-01-04 05:20:05', '2026-01-04 05:20:05', NULL, NULL, NULL, NULL),
(1703, 'Panuganti anjaneyulu', '9963103790', '$2y$10$/Bz4ntcRggnFyPjLY6L.T.X1Fd2drBUtdePsGE34Oj7c57QOud1M2', '123456', NULL, 'Chowdapur', '0', 8, 0, '9963103790', '7330685959', '2026-01-04 07:54:24', '2026-01-04 07:54:24', NULL, NULL, NULL, NULL),
(1704, 'Anand', '9030644131', '$2y$10$NHRnrGtT6A97pA/G2ZBAq.qq258CZ1mZqv7IINDEoFadzMK8LGITS', '123456', NULL, 'Shadnagar', '0', 8, 0, '9030644131', 'admin', '2026-01-04 08:53:37', '2026-01-04 08:53:37', NULL, NULL, NULL, NULL),
(1705, 'Yasmeen sultana', '9063786278', '$2y$10$.5aUQYLaDR5AaxTS.tLDH.MLKrbwzEwCn816CWXrca8B5yRt0bT0e', '1984', NULL, 'Hyderabad', '0', 8, 0, '9063786278', '8790710271', '2026-01-04 10:45:40', '2026-01-04 10:45:40', NULL, NULL, NULL, NULL),
(1706, 'A sagar babu', '9700877999', '$2y$10$UTFc.MkKE/6c5XLnXRqb4uEHXhubrOX/LZZci10iewo8lYWkEfuYm', '341997', NULL, 'Tirupati', '0', 8, 0, '9700877999', '8639045822', '2026-01-04 13:45:20', '2026-01-04 13:45:20', NULL, NULL, NULL, NULL),
(1707, 'Alite Karnakar', '8555029198', '$2y$10$40dS30JcW.1rkrs9bOjYeuqi04rtfrJcLU1f3HHFxbEYIBphFfOLa', '123456', NULL, 'Hyderabad', '0', 8, 0, '8555029198', '7330685959', '2026-01-05 06:15:56', '2026-01-05 06:15:56', NULL, NULL, NULL, NULL),
(1708, 'Goghikar Mahesh', '8096297677', '$2y$10$cVIawEw5tt0oWVCwyXZTpuxAgdyTQ3uyVtBfSc24AerJU6o2GjwZa', '197608', NULL, 'Nawabpet', '0', 8, 0, '8096297677', '8309746911', '2026-01-05 10:45:45', '2026-01-05 10:45:45', NULL, NULL, NULL, NULL),
(1709, 'Vaasudev', '8978584843', '$2y$10$T0LSRsNDLuxlEpbaUYJFXOCkFnsiAFZTRF75a5qgZHin1r.g839GW', '654321', NULL, '654321', '0', 8, 0, '8978584843', '7330685959', '2026-01-05 11:55:58', '2026-01-05 11:55:58', NULL, NULL, NULL, NULL),
(1710, 'POILA SUNITHA', '8143484085', '$2y$10$bRJIq8szO73x08H0L8Mj..OnPMpEXg0PUfn4pNwvOilf58qALmDyW', '9000354258', NULL, 'Secunderabad', '0', 8, 0, '8143484085', '9491443072', '2026-01-05 12:29:17', '2026-01-05 12:29:17', NULL, NULL, NULL, NULL),
(1711, 'VIJAY KUMAR GIDI', '8977176767', '$2y$10$E30a4XRGJ9ecm4AMoHeB3uHo10pIQVSkK0CkPiim9/Sh/MqhnZbMe', 'up55555', NULL, 'HYDERABAD', '0', 8, 0, '8977176767', '6301373342', '2026-01-05 15:01:32', '2026-01-05 15:01:32', NULL, NULL, NULL, NULL),
(1712, 'Aruna', '8125800411', '$2y$10$tWkmr8ev4s7dBr1zqPktgeLeTsKK0fRSnmWoYwgp8nIMZB/17XMye', 'sona', NULL, 'Upperpally', '0', 8, 0, '8125800411', '7330685959', '2026-01-06 01:39:31', '2026-01-06 01:39:31', NULL, NULL, NULL, NULL),
(1713, 'Mallesh Ramagundam', '7780440593', '$2y$10$t5sPwBrWIsR3kRg2hm0Bgevyd01P7xOVxASgHI6FLF/x2IUX/32.e', '123456', NULL, 'Hyderabad', '0', 8, 0, '7780440593', '6301373342', '2026-01-06 04:42:21', '2026-01-06 04:42:21', NULL, NULL, NULL, NULL),
(1714, 'Sadanandam jangam', '6303556739', '$2y$10$jDgl/EOMvY8EP5rUodbgxOmeiZqJHYcWgr7YAuVTFl/gSp/aeDKmu', '123456', NULL, 'Hyderabad', '0', 8, 0, '6303556739', '6301373342', '2026-01-06 04:43:31', '2026-01-06 04:43:31', NULL, NULL, NULL, NULL),
(1715, 'Jayanthi RS brothar', '7036653637', '$2y$10$KZyuGzQ0m6bcQ5r.DnR0kufBnYWyU2gk65Y6OxDLUMAcD6FChuryO', '123456', NULL, 'Hyderabad', '0', 8, 0, '7036653637', '6301373342', '2026-01-06 04:45:32', '2026-01-06 04:45:32', NULL, NULL, NULL, NULL),
(1716, 'D CHAKRAVARTHY', '6303291050', '$2y$10$aVywFYkWAaTNTIydFRJ0SO127SicTqYKPcTmlcNLzC1IK1R/WfVHa', 'chakri@86', NULL, 'Kodair', '0', 8, 0, '6303291050', '7330685959', '2026-01-06 07:37:32', '2026-01-06 07:37:32', NULL, NULL, NULL, NULL),
(1717, 'Sakina begum', '9014611041', '$2y$10$q8BNmv6BlX3xqH4WNpz2GuiVpuKkM56SCjNNi1u2aYx/TNhi2QgTG', '9014611041', NULL, 'Malakpet', '0', 8, 0, '9014611041', '7989494006', '2026-01-06 07:56:12', '2026-01-06 07:56:12', NULL, NULL, NULL, NULL),
(1718, 'Farzana  begum', '9603879326', '$2y$10$oHRjzL4tgaNhPw43lZf8ueRZ8uZSPaKMw0b6bqybsMnh0r5KXTFVq', '123678', NULL, 'Barkas', '0', 8, 0, '9603879326', '9014611041', '2026-01-06 08:16:51', '2026-01-06 08:16:51', NULL, NULL, NULL, NULL),
(1719, 'Laxmi', '9059775709', '$2y$10$qsl3eaxcB98RUhAM6wzSyurMAJaQbmAPsy5W2FbvB/8ca0plodT.6', '1 90597 75709', NULL, 'Malakpet', '0', 8, 0, '9059775709', '9014611041', '2026-01-06 09:03:24', '2026-01-06 09:03:24', NULL, NULL, NULL, NULL),
(1720, 'Wajida', '8341890686', '$2y$10$UXdyYME3sQ8khwNIbvcO9ebF3llPMz7K9eXvZtUE25YNdvO20PSue', '8341890686', NULL, 'Malakpet', '0', 8, 0, '8341890686', '9014611041', '2026-01-06 09:05:41', '2026-01-06 09:05:41', NULL, NULL, NULL, NULL),
(1721, 'Mohammad', '9110535937', '$2y$10$pO96tp273iSa6VYKWYCS.OgZkSoOPA2DX9rr0OdHTp.NvB.hC0klK', '9110535937', NULL, 'Malakpet', '0', 8, 0, '9110535937', '9014611041', '2026-01-06 09:09:52', '2026-01-06 09:09:52', NULL, NULL, NULL, NULL),
(1722, 'RAMACHANDRAN GOVINDAN NAIR', '8606340503', '$2y$10$D7aBsSF0a0GmBdsq4.EhEOU1JNS5RStkd4bYtf.4J/YRnbs95zLzy', '12121212', NULL, 'Thrissur Kerala', '0', 8, 0, '8606340503', '7013918476', '2026-01-06 11:09:51', '2026-01-06 11:09:51', NULL, NULL, NULL, NULL),
(1723, 'Jyothi Bodupal', '8317643061', '$2y$10$sTX8sIZ8mAbaTXNDaW45fe4vytbdHhdCmRiAjWyjL.QL1JrppAe6K', '123456', NULL, 'Hyderabad', '0', 8, 0, '8317643061', '6301373342', '2026-01-07 06:17:16', '2026-01-07 06:17:16', NULL, NULL, NULL, NULL),
(1724, 'Shaheen begum', '8309785940', '$2y$10$fuHZ3WVnvRloAfWSEeuMAu/BDcEfGlWyjhiDECyfFkpSaI4PyObuy', '8309', NULL, 'Syed nagar', '0', 8, 0, '8309785940', '8790710271', '2026-01-07 06:49:38', '2026-01-07 06:49:38', NULL, NULL, NULL, NULL),
(1725, 'Rayees unnisa', '6304720057', '$2y$10$6Rk2CxDKkn1kWxrAyt/bWOrp9VHIX6FeBJdJ37RuKuaBrAEdK/McC', '12345', NULL, 'Edi bazar kumar wadi colony hyderabad', '0', 8, 0, '6304720057', '8790710271', '2026-01-07 07:10:32', '2026-01-07 07:10:32', NULL, NULL, NULL, NULL),
(1726, 'shanaazbegum', '8247667302', '$2y$10$4tKpE3lFHTWhQAK.ea1.LOwB1KgQ03PjjLojQ2inDOS34mS7SLsdi', '8247667302', NULL, 'Syed nagar', '0', 8, 0, '8247667302', '7095383042', '2026-01-07 09:08:12', '2026-01-07 09:08:12', NULL, NULL, NULL, NULL),
(1727, 'WAHEED UNNISA', '9581522078', '$2y$10$CPINAR2QXZkH75EhZyMyseZ80j0tdqjLNqVhu0tvqrLjXR5Rgszp6', '123456', NULL, 'Thalabkatta', '0', 8, 0, '9581522078', '8790710271', '2026-01-07 09:58:45', '2026-01-07 09:58:45', NULL, NULL, NULL, NULL),
(1728, 'Majid khan', '8125196431', '$2y$10$RqksuaxEVwdvQGyU8GauMOzQ/EI1iOfIW7TbXkY.BrcEOVxOPD5XG', '8439', NULL, 'Banjra haills 12', '0', 8, 0, '8125196431', '8309785940', '2026-01-07 10:13:54', '2026-01-07 10:13:54', NULL, NULL, NULL, NULL),
(1729, 'T pachya naik', '6302006627', '$2y$10$O8J.TKTQJfRcFWhpw5Km6.ApXKHCJzmpj/20dNHwHCWHaDfNuhEqe', '123456', NULL, 'ida uppal', '0', 8, 0, '6302006627', '8639045822', '2026-01-07 11:33:11', '2026-01-07 11:33:11', NULL, NULL, NULL, NULL),
(1730, 'MD KHAMRUDDIN', '9398859163', '$2y$10$msb0ZxShPbJIiJZyRtOvfOBd6zH6rD9q/dumVH2uH1TlGZETH2AiO', 'shabnam', NULL, 'HYDERABAD', '12000', 10, 12000, '9398859163', '8333077851', '2026-03-31 04:05:05', '2026-01-07 11:57:12', 'Flat no 307, sarada divine apartment ments', 'HYDERABAD', 'Telangana', '500018'),
(1731, 'U Naveen Kumar', '9963655495', '$2y$10$fnAUQyZc2xmrAXH0UgoBk.HSEfQBrVhcFHxYj1V/lafT8gnrboX06', 'Navi1234', NULL, 'Shadnagar', '0', 8, 0, '9963655495', '9959528086', '2026-01-07 12:03:34', '2026-01-07 12:03:34', NULL, NULL, NULL, NULL),
(1732, 'SANJAY NAIK', '8106034105', '$2y$10$1dW6A7zbh4YH0wUwc.8rZeZ7dN6NaPD6do6dKu13RC6MWC1WP4aXi', 'Sanjay1997@', NULL, 'Shadnager', '0', 8, 0, '8106034105', '9959528086', '2026-01-07 12:06:33', '2026-01-07 12:06:33', NULL, NULL, NULL, NULL),
(1733, 'MAHENDERKAR RAJESWARI', '8106560969', '$2y$10$lNeN1wo5zhvw4vQvGrLSyetd1gWUBbDXhUquPL50YfzaMcJSQpku6', '123456', NULL, 'Neredmet', '3000', 8, 6000, '8106560969', '9390596123', '2026-03-07 08:57:29', '2026-01-07 12:08:34', 'Neredmet', 'Hyderabad', 'Telangana', '500032'),
(1734, 'Dappu prasad', '7702542491', '$2y$10$lrUhG6Zcp9wIDRvtTcTCgOyirbwRT/2h2XW66YmKkkfFcdHYcCiK2', 'prasad12', NULL, 'Shadnagar', '0', 8, 0, '7702542491', '9959528086', '2026-01-07 12:09:16', '2026-01-07 12:09:16', NULL, NULL, NULL, NULL),
(1735, 'NAKE BHASKAR', '8008030657', '$2y$10$27uTpQfpJ4dxiNS.nRuTGeWC1dKxacW1ETBhl.Puwa78g4RQEOKX6', '123456', NULL, 'HYDERABAD', '0', 8, 0, '8008030657', '8639045822', '2026-01-07 12:26:02', '2026-01-07 12:26:02', NULL, NULL, NULL, NULL),
(1736, 'Husna', '7095217291', '$2y$10$o6SSxayNf6AHJlC0FRv5beHIg..g6V1UahQECcPJ183X2M.z1Kugm', '789h', NULL, 'Telengana', '0', 8, 0, '7095217291', '6304720057', '2026-01-07 16:40:57', '2026-01-07 16:40:57', NULL, NULL, NULL, NULL),
(1737, 'T S RAO', '9346949299', '$2y$10$3RVT5DSoOI7dBSrhZCvOluSZSzW/DKkhdgCVLCQ5hNdaaBAikGEVW', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9346949299', '9398859163', '2026-01-08 07:45:59', '2026-01-08 07:45:59', NULL, NULL, NULL, NULL),
(1738, 'Akram pasha', '6309031972', '$2y$10$clMD8nU94809OhYr6PfNzOTNZ.p9DYdHoJaTru7OnVVNnoL8hflRe', 'AKRAMpasha@1124', NULL, 'Sanathnagar', '0', 8, 0, '6309031972', '9346949299', '2026-01-08 08:58:16', '2026-01-08 08:58:16', NULL, NULL, NULL, NULL),
(1739, 'K M Kishore Kumar', '8919461772', '$2y$10$BFa1j9OgUAo9B9gpiD.H2eRKHML1yxFVHD/stfZUjHJiItX8ed/VC', '123456', NULL, 'Hyderabad', '0', 8, 0, '8919461772', '9542003748', '2026-01-08 10:48:43', '2026-01-08 10:48:43', NULL, NULL, NULL, NULL),
(1740, 'K . JHANSI', '9398228464', '$2y$10$.ErOCGu3wtxJ9EycJIu7GuUrqusbRuvhbtDEJNtjaZpi213hrMVLS', '123456', NULL, 'UPPAL HYDERABAD', '0', 8, 0, '9398228464', '9381685994', '2026-01-20 13:34:41', '2026-01-08 11:55:58', NULL, NULL, NULL, NULL),
(1741, 'Vidiyala swetha', '7995053045', '$2y$10$cktFum.CGSe8llyJYxebg.XtGrXo9ntWX2gNcAcDwyZ.3uvqBGU5a', '123456', NULL, 'Hyderabad', '0', 8, 0, '7995053045', '6281559694', '2026-01-08 15:43:26', '2026-01-08 15:43:26', NULL, NULL, NULL, NULL),
(1742, 'N BASHIROON', '9392178957', '$2y$10$kQ7R.Rw78i/kYoV3ZI.iUOneH7vYGEK2A9qcR6wPs9/sPi6QdmQDq', '123456', NULL, 'TADIKONDA AP', '0', 8, 0, '9392178957', '9398859163', '2026-01-08 16:03:45', '2026-01-08 16:03:45', NULL, NULL, NULL, NULL),
(1743, 'SK MASTANVALI', '7075764267', '$2y$10$NTXmNokYIbv.3f0AGZwvo.sEv5Ua0QV2I1fgjgSXZ.iDUcqPjNm/K', '123456', NULL, 'VEMUR AP', '0', 8, 0, '7075764267', '9398859163', '2026-01-08 16:04:45', '2026-01-08 16:04:45', NULL, NULL, NULL, NULL),
(1744, 'SK RAMJANBI', '8142826147', '$2y$10$a66iwx8rUnNL4.HkdutlMu9bkmFh6PyLXv/cx1AD5IRQVUjaWbap2', '123456', NULL, 'YANMADLA AP', '0', 8, 0, '8142826147', '9398859163', '2026-01-08 16:06:07', '2026-01-08 16:06:07', NULL, NULL, NULL, NULL),
(1745, 'N MUNTAJ BEGUM', '7569038567', '$2y$10$slxCAtsmt.Z.75mz81Uz1u5.q4XMk.UI6IUivsZE4BuLyP0kTtl52', '123456', NULL, 'TADIKONDA AP', '0', 8, 0, '7569038567', '9398859163', '2026-01-08 16:07:08', '2026-01-08 16:07:08', NULL, NULL, NULL, NULL),
(1746, 'N SHAMSHUDHEEN', '7569332659', '$2y$10$ZH5nkupCzH/1GRYoFQQ6ke5/GpYWOf/2BzJZNegUMXsGWXc5Yw9iu', '123456', NULL, 'KOLLUR AP', '0', 8, 0, '7569332659', '9398859163', '2026-01-08 16:08:03', '2026-01-08 16:08:03', NULL, NULL, NULL, NULL),
(1747, 'N FIRUDHIEN', '9494124526', '$2y$10$E/Jc08qyBfiHK3umWnMHuegiLFQxupFBV7sJgxeaqLmosD0SYC9pm', '123456', NULL, 'GUNTUR AP', '0', 8, 0, '9494124526', '9398859163', '2026-01-08 16:08:57', '2026-01-08 16:08:57', NULL, NULL, NULL, NULL),
(1748, 'Gundrathi venugopal goud', '9603383367', '$2y$10$XmHy4STUhCfOYdq9ZV7wB.NpcVw7N85pAec4e6MNn.YI2hYfHWysq', '123456', NULL, 'Suraram', '0', 8, 0, '9603383367', '6281559694', '2026-01-09 02:32:17', '2026-01-09 02:32:17', NULL, NULL, NULL, NULL),
(1749, 'E Bhagha', '8096074576', '$2y$10$EU5nwbUPMzzMG7R5PCXH3Oae3eoNWiQHY7cTCpiAtCuy.tVoh25BG', '123456', NULL, 'Neredmet', '0', 8, 0, '8096074576', '8106560969', '2026-01-09 07:59:37', '2026-01-09 07:59:37', NULL, NULL, NULL, NULL),
(1750, 'Maradikonda Anitha', '9100494938', '$2y$10$RyDCxwJtBEcTaxKhF8QOruZvuEq.dKtzDiY/48/Ntl9xmNlVZ6MAy', '123456', NULL, 'Neredmet', '0', 8, 0, '9100494938', '8106560969', '2026-01-09 08:11:39', '2026-01-09 08:11:39', NULL, NULL, NULL, NULL),
(1751, 'A  Nirmala', '8106943236', '$2y$10$qbIKUFGnzx54kjZ4JCthgu15TBT43vuziCoV1G.ivM5rjWnFJhJDa', '123456', NULL, 'Vinayak nagar', '0', 8, 0, '8106943236', '9381685994', '2026-01-26 10:22:49', '2026-01-09 08:46:20', NULL, NULL, NULL, NULL),
(1752, 'Ashok sir', '9848489720', '$2y$10$hX2UY6d25xp6a8Q90PSNve8RgLlnyZa3xEbwHtD4GSwTapMxS.flK', '123456', NULL, 'Hyderabad', '0', 8, 0, '9848489720', '9381685994', '2026-01-09 10:12:57', '2026-01-09 10:12:57', NULL, NULL, NULL, NULL),
(1753, 'R.Kavitha', '7981688492', '$2y$10$fH9/DsftVuGeoRGIKyhOaeQ1HXqS9iDuxU1rZAZKCjV724DaZ.nPm', '123456', NULL, 'Hyderabad', '0', 8, 0, '7981688492', '9381685994', '2026-01-09 11:40:24', '2026-01-09 11:40:24', NULL, NULL, NULL, NULL),
(1754, 'Ashok', '9948489720', '$2y$10$pXjszUgqvXn3hgoBDU5DOunedDfaQzLRTkD9EsFvhXljQNje8J1IC', '123456', NULL, 'Secbad', '0', 8, 0, '9948489720', '8639045822', '2026-01-09 11:42:32', '2026-01-09 11:42:32', NULL, NULL, NULL, NULL),
(1755, 'K swarupa', '7330987406', '$2y$10$5SivbGoch.2f8mlRQFBCRehDS8R5IET3MdGhGTmYz7KCgAcphOZiK', '123456', NULL, 'Uppl', '0', 8, 0, '7330987406', '8639045822', '2026-01-09 11:49:19', '2026-01-09 11:49:19', NULL, NULL, NULL, NULL),
(1756, 'Siriyapag Swapna', '7032915528', '$2y$10$YBQk3y/PkWj9rU88mcjQMe6NbDnZhy.i7L6kBrySEL.TJvktIdSzK', '123456', NULL, 'Hyderabad', '1000', 8, 0, '7032915528', '8639974381', '2026-01-09 14:31:50', '2026-01-09 13:43:08', NULL, NULL, NULL, NULL),
(1757, 'G Siddeswar Rao', '8247472219', '$2y$10$LD//rocpcUSHFD59ZkMkM.Gdi8Q5j.h9ESFlNarbkZo7zclYx6axy', 'IMC@2026', NULL, 'Hyderabad', '0', 8, 0, '8247472219', '8639045822', '2026-01-09 14:03:48', '2026-01-09 14:03:48', NULL, NULL, NULL, NULL),
(1758, 'SRAVANTHI MIDIDAM', '9550520501', '$2y$10$oB1gvjbXCBoICLUcSV5kteFZH/YWpDxBNUZ4ymHDSmXmWtf70FNa6', '123456', NULL, 'Hyderabad', '0', 8, 0, '9550520501', '8333077851', '2026-01-09 15:02:57', '2026-01-09 15:02:57', NULL, NULL, NULL, NULL),
(1759, 'MARCHETTY SURYAPRAKASH RAO', '9290142822', '$2y$10$JZafLoFAC.WFX74aLppiBuxsQs6mXVgJ3ccm1bKVEZDC2HM45DBHi', '456789', NULL, 'NEREDMET - HYD', '0', 8, 0, '9290142822', '9390596123', '2026-01-09 15:31:47', '2026-01-09 15:31:47', NULL, NULL, NULL, NULL),
(1760, 'G PREMKUMAR', '9059985599', '$2y$10$UXEIi68OyJQR.beMMJqxL.GMXTp13EriAtabvMeW39S1E2ugxsWT2', 'prem8899', NULL, 'Secunderabad', '0', 8, 0, '9059985599', '9398914677', '2026-01-09 16:17:42', '2026-01-09 16:17:42', NULL, NULL, NULL, NULL),
(1761, 'GUMMADI', '9490572320', '$2y$10$HBDo1JTRM7c1YzjC7zOJEuRWWO.6PPjhfcfAv0lBx0YIfYCpfn12S', '123457', NULL, 'Secunderabad', '0', 8, 0, '9490572320', '9398914677', '2026-01-09 16:29:17', '2026-01-09 16:29:17', NULL, NULL, NULL, NULL),
(1762, 'Lakshmi', '7799998689', '$2y$10$5QEr8ZV6R7CIyGPuKU3Lsuhb.lq0dh/U6F.R58dhOpVvOM24knv6m', '4545', NULL, 'Habsiguda', '0', 8, 0, '7799998689', '7032915528', '2026-01-10 06:49:20', '2026-01-10 06:49:20', NULL, NULL, NULL, NULL),
(1763, 'P. Narasimha', '9553132534', '$2y$10$9k/Jpj.OviOhBfmTgnFgNeKPObxAAm05p3X7kTcAKJoJ9DjL72olW', 'pnr@1980', NULL, 'Hyderabad', '0', 8, 0, '9553132534', '8639045822', '2026-01-10 08:38:16', '2026-01-10 08:38:16', NULL, NULL, NULL, NULL),
(1764, 'N Narasimharao', '9581349046', '$2y$10$4Oyh8APWeSAl1Wieddvkt.afkJ2ROqPtv29du01aYUpokdDR49Koy', 'Satwik2010*', NULL, 'Uppal', '0', 8, 0, '9581349046', '8639045822', '2026-01-10 12:10:29', '2026-01-10 12:10:29', NULL, NULL, NULL, NULL),
(1765, 'M sudheer', '6302474700', '$2y$10$9RZX5tzSVNSo1V7zMYnEwe3ayp0h1pVSHZ49F56.ki2d6pq/wCjMS', '123456', NULL, 'Tj', '0', 8, 0, '6302474700', '8639045822', '2026-01-10 15:40:04', '2026-01-10 15:40:04', NULL, NULL, NULL, NULL),
(1766, 'Saikumar', '7416524266', '$2y$10$5y.X5CyB0/dnPsFFWJckheMcvjjrWpWlSqeTILgf54bj/iLQgILOi', '123456', NULL, 'Hyderabad', '0', 8, 0, '7416524266', '9398228464', '2026-01-11 09:06:29', '2026-01-11 09:06:29', NULL, NULL, NULL, NULL),
(1767, 'S. Padmavathi', '9705907109', '$2y$10$ztR/aKVn54igeR5gNy1f/e1P1xTx2YB/2nuXwxYn4t8fxrE1./Eym', '1234', NULL, 'S.Padmavathi Phone number:9705907109 Beeramguda,vadana puri colony,  road number 11,srinivasa residency  plat num-104, Near Sai Baba temple.   Ameenpur , Sangareddy (Dt),pin code -502032, Hyd   .', '0', 8, 0, '9705907109', '9398228464', '2026-01-11 09:18:37', '2026-01-11 09:18:37', NULL, NULL, NULL, NULL),
(1768, 'CH VENKATESHWAR RAO', '9959041669', '$2y$10$6RCwlvedSuUaMyDQVy06u.V4tVunA0cQ3aseel6pWJbbO57.tsZtm', '123456', NULL, 'Suraram - Hyderabad', '0', 8, 0, '9959041669', '8333077851', '2026-01-11 09:19:04', '2026-01-11 09:19:04', NULL, NULL, NULL, NULL),
(1769, 'Mounika rajanala', '8978617408', '$2y$10$5.E.3kqmgDPC2XxZDw5ViOXFOYaJPhMt2MZVSusbs4yuMGNoqSf7.', 'mounika@12', NULL, 'Siddipet', '0', 8, 0, '8978617408', '9398228464', '2026-01-11 09:26:57', '2026-01-11 09:26:57', NULL, NULL, NULL, NULL),
(1770, 'M.mahalakshmi', '8897195160', '$2y$10$VzLICwpcB9z.SiGL6F73bO7JeLLAqdnXzILYG9TU.H4eFUoZGg8DC', 'loukya@2015', NULL, 'Proddatur', '0', 8, 0, '8897195160', '9398228464', '2026-01-11 09:42:50', '2026-01-11 09:42:50', NULL, NULL, NULL, NULL),
(1771, 'kallagunta srihari', '9177171535', '$2y$10$broVPWUntp1Yb2s.yBr.juSrF4uJNZyYdocUXglia31nS44j3eQS6', 'Ksrihari999', NULL, 'Sanath nagar hyderabad', '0', 8, 0, '9177171535', '9398859163', '2026-01-11 14:59:06', '2026-01-11 14:59:06', NULL, NULL, NULL, NULL),
(1772, 'HEMALATHA', '8179206067', '$2y$10$zKf23SwtfXY1rqGBhuVGjOrmANp0cfzpbzCBKf8x8VpVIWonCG4Sy', 'Chary@123', NULL, 'Hyderabad', '0', 8, 0, '8179206067', '9398228464', '2026-01-11 15:01:02', '2026-01-11 15:01:02', NULL, NULL, NULL, NULL),
(1773, 'Vaheed basha', '6302992654', '$2y$10$tGnVWkLnxTLSKsloM5a8eOs.gIIv/LhS1OpUAkCGg1DNI4uX6528S', 'zxcvhjkl', NULL, 'Nandikotkur', '0', 8, 0, '6302992654', '9398228464', '2026-01-11 15:04:54', '2026-01-11 15:04:54', NULL, NULL, NULL, NULL),
(1774, 'K Jyothi', '8309285899', '$2y$10$2YGKvKBuUqs9rSMVSx4vDen773VKX5KvLRt/fAswu95xE/gAKhS7K', 'sanju@sanjay#', NULL, 'Venkatagiri', '0', 8, 0, '8309285899', '9398228464', '2026-01-11 15:11:16', '2026-01-11 15:11:16', NULL, NULL, NULL, NULL),
(1775, 'Mamatha', '8328177906', '$2y$10$qE63S97ctsp15J1R8mb9DuNpYb5bsY/Kr/mG0l3dOSDmTCeUk.uLq', 'Sandeep@12', NULL, 'Khammam', '0', 8, 0, '8328177906', '9398228464', '2026-01-11 15:23:16', '2026-01-11 15:23:16', NULL, NULL, NULL, NULL),
(1776, 'Vanaja', '9391585593', '$2y$10$iJE8xJM8gfKWSVxu3XJPGeu4kplOvl27KAHmBk2y6NwHo3yYJQznO', 'vk9591kv', NULL, 'Ananthapur', '0', 8, 0, '9391585593', '9398228464', '2026-01-11 15:27:05', '2026-01-11 15:27:05', NULL, NULL, NULL, NULL),
(1777, 'K. JHSNSI', '9640947074', '$2y$10$1tz842DqiwuUcTMsGHMnlOMVC.v/c06KcF.ysKlIf6Sb42K3dIrRK', '3345', NULL, 'Pargi', '0', 8, 0, '9640947074', '9398228464', '2026-01-11 15:27:41', '2026-01-11 15:27:41', NULL, NULL, NULL, NULL),
(1778, 'N. Nagaraju', '9963556289', '$2y$10$8hSL0T1nGx3favi10nQZ..DdOcRKLWL0Gy0Cmxjnhs0A2LE1mTMPu', '556289', NULL, 'Kandi. Sangareddy', '0', 8, 0, '9963556289', '9398228464', '2026-01-11 15:42:48', '2026-01-11 15:42:48', NULL, NULL, NULL, NULL),
(1779, 'M chaitanya', '8712816987', '$2y$10$JCG1JlX6BZzeecoFw6ITQeHi1UNKz0rEOQTRIgMbP.7XmbV.rSLO.', '123456', NULL, '11- 145 Janapada Road', '0', 8, 0, '8712816987', '9398228464', '2026-01-11 15:50:56', '2026-01-11 15:50:56', NULL, NULL, NULL, NULL),
(1780, 'C MALLIKARJUN', '7330748009', '$2y$10$uu7iST6.ojPoHyxPNiOH.uvO/E.7DMLwFuqG95IUGGDqlvrWucXE2', '123456', NULL, 'Hyderabad', '3000', 8, 0, '7330748009', '9390596123', '2026-03-22 05:28:11', '2026-01-11 15:58:04', 'HYDERABAD', 'Hyderabad', 'Telangana', '500007'),
(1781, 'R sasikala', '9000253371', '$2y$10$msbx9j2al2msBzn6FYWPjeTsKF68YQQASqjvOI8n.UV7LYZuzLkKu', '234', NULL, 'Pulivendu', '0', 8, 0, '9000253371', '9398228464', '2026-01-11 16:46:25', '2026-01-11 16:46:25', NULL, NULL, NULL, NULL),
(1782, 'Balasaraswathi', '9494294394', '$2y$10$a5nty8/.smO0yZKcHOmfY.MIo/2aYNpgNXAuydrLCYAFxyHZHuEw2', '123456789', NULL, 'Machilīpatnam, Krishna, Andhra Pradesh, IND', '0', 8, 0, '9494294394', '9398228464', '2026-01-11 16:55:19', '2026-01-11 16:55:19', NULL, NULL, NULL, NULL),
(1783, 'Gaddam Venkatesh', '9959979760', '$2y$10$/rwu2fMnQXKARclRUx0iJOAH7PVrYVdOrPQ1SQf3v9MxPgxt5cBme', 'Gaddam@1987', NULL, 'Mahabubnagar', '0', 8, 0, '9959979760', '9398228464', '2026-01-11 18:25:10', '2026-01-11 18:25:10', NULL, NULL, NULL, NULL),
(1784, 'Chukkanagarigayathri', '8688267238', '$2y$10$ChSRe9Q4uoaebHpcT10creuTvxD5X6Zwu5FhgSUIiVdt8fCkIgcDS', 'jasvikreddy', NULL, 'Hyderabad', '0', 8, 0, '8688267238', '9398228464', '2026-01-12 01:18:48', '2026-01-12 01:18:48', NULL, NULL, NULL, NULL),
(1785, 'K bhavani', '9032636320', '$2y$10$I0diuBcHfYrQqYPCeipkVuONOZaxU7NmX77/.xFiw1JbEI8CecLMy', '17021995', NULL, 'Secunderabad', '0', 8, 0, '9032636320', '9398228464', '2026-01-12 02:34:41', '2026-01-12 02:34:41', NULL, NULL, NULL, NULL),
(1786, 'Jabeena Begum s', '8050446586', '$2y$10$o89B/0Nx6nKu.VsAtigsFe97Mt8/DEB4BnRf3rtjlMTSYSpXDJLxW', 'sonusimran@1234', NULL, '14th ward ambedkar Nagar nishini camp near marriyamma temple t.b.dam Hospet vijaynagar dist karnataka', '0', 8, 0, '8050446586', '9398228464', '2026-01-12 06:02:18', '2026-01-12 06:02:18', NULL, NULL, NULL, NULL),
(1787, 'Kommu renukarani', '9908263153', '$2y$10$2mIQsixJQiyfCngWKwJ5qes9N/EzPl2kLvU3iBoaRbov6V24hftwW', 'renuka@123', NULL, 'Bandaravirala', '0', 8, 0, '9908263153', '9398228464', '2026-01-12 06:38:11', '2026-01-12 06:38:11', NULL, NULL, NULL, NULL),
(1788, 'Sandhya rani', '9502302728', '$2y$10$5WklIDHtSZPvM903QuMNluRUJ3LlIgsE9zpvmxIW30s4zzFu9PzhW', 'Sandhya@123', NULL, 'Hyderabad Suchitra', '0', 8, 0, '9502302728', '9398228464', '2026-01-12 06:49:16', '2026-01-12 06:49:16', NULL, NULL, NULL, NULL),
(1789, 'Srinivas Rao', '9849994111', '$2y$10$tZT5mSSfpd4UEVSCatgFe.gaIzVa.xkeYWME8VdaobM3iTI0mGLDC', '123456', NULL, 'Hyderabad', '0', 8, 0, '9849994111', '9618078288', '2026-01-12 07:09:51', '2026-01-12 07:09:51', NULL, NULL, NULL, NULL),
(1790, 'O.apparao', '9949087679', '$2y$10$WCvJ.Q8ZAPCzunWMs39oZeFu6qW8QHLnn192hiD/e3/muguG03PZi', '123456', NULL, 'Hyderabad', '0', 8, 0, '9949087679', '9398859163', '2026-01-12 07:25:48', '2026-01-12 07:25:48', NULL, NULL, NULL, NULL),
(1791, 'Shaik sattar', '9866481151', '$2y$10$l/GDGVDUKV2LQcPLkWTRtePAGLT8PLU2wMkq69g1mDcM2JkYjGfGi', '123456', NULL, 'Tenali AP', '0', 8, 0, '9866481151', '9398859163', '2026-01-12 07:26:53', '2026-01-12 07:26:53', NULL, NULL, NULL, NULL),
(1792, 'R Samuel', '9989395843', '$2y$10$gnD0ocbLcGTdEDdqZnwhoum2O2q4.hSNrk.kAOTOCs0QxSxrj//VK', '123456', NULL, 'Hyderabad', '0', 8, 0, '9989395843', '9398859163', '2026-01-12 07:27:57', '2026-01-12 07:27:57', NULL, NULL, NULL, NULL),
(1793, 'G swathi', '9963591959', '$2y$10$p2R9iHsb.Cqpj/uBKHKCUOTWvI.K6QBkD9mSXGZjI50RV73psALE.', 'Swathi@9966', NULL, 'Hyderabad', '0', 8, 0, '9963591959', '6281559694', '2026-01-12 08:08:17', '2026-01-12 08:08:17', NULL, NULL, NULL, NULL),
(1794, 'Kolipaka raju', '9885736058', '$2y$10$5T6CRAkabreWZeR3RkZSwOALIq1gYHqXnnYpx67n2ze5sCm.3St8a', 'raju1984@', NULL, 'Hyderabad', '0', 8, 0, '9885736058', '6281559694', '2026-01-12 08:15:32', '2026-01-12 08:15:32', NULL, NULL, NULL, NULL),
(1795, 'BIRUDHARAJU PRUDHVI RAJU', '9550030618', '$2y$10$LJBWw4WGJaKqDVnUy57TR.GlvnVrmppzOh9e/j0IczfBA8hHb.puC', 'Prudhvi@143', NULL, 'Hyderabad', '0', 8, 0, '9550030618', '6281559694', '2026-01-12 08:27:45', '2026-01-12 08:27:45', NULL, NULL, NULL, NULL),
(1796, 'KUDUDULA SRINIVAS', '9052897777', '$2y$10$.t4B9YZaUSpCbPsqs58dRusdXISHnH1RSiGu88hRlI9aWLNqRBM4a', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9052897777', '6281559694', '2026-01-12 09:21:54', '2026-01-12 09:21:54', NULL, NULL, NULL, NULL),
(1797, 'Kuchana Akhil', '9177679370', '$2y$10$vX3HpJ9mTLvlOCI3cw9gCOJhg7Fsd69Dyit3DJMVXFmg7eKhG52EW', '9177679370', NULL, 'Warangal', '0', 8, 0, '9177679370', '8522881144', '2026-01-12 11:03:41', '2026-01-12 11:03:41', NULL, NULL, NULL, NULL),
(1798, 'Jhansi chelapareddy', '9391218018', '$2y$10$cY/NgmfyaH.FbdzF0ZT6j.7WxlHl.mGgZksxWPNFTfQyFNNmC0BUC', 'Jhansi@123', NULL, 'Rajamundry', '0', 8, 0, '9391218018', '9398228464', '2026-01-12 11:07:08', '2026-01-12 11:07:08', NULL, NULL, NULL, NULL),
(1799, 'Shirisha M', '8328024131', '$2y$10$IjbknokI7aLTdeWpnfa/G.YE.2.GzwxZIDzNZkiSeVEVD933YnXPC', '123shiri', NULL, 'Vemukawada', '0', 8, 0, '8328024131', '9398228464', '2026-01-12 14:23:38', '2026-01-12 14:23:38', NULL, NULL, NULL, NULL),
(1800, 'Lalitha', '9133713490', '$2y$10$.57/Ksu2RynHvXoXngGqueKpyn4s5mS4cPlugrMmfa07Q1OR0VuUe', 'LalliammU94', NULL, 'Guntakal', '0', 8, 0, '9133713490', '9398228464', '2026-01-13 03:33:59', '2026-01-13 03:33:59', NULL, NULL, NULL, NULL),
(1801, 'Serisha raja', '9032016699', '$2y$10$R5kWrHiekeZFABPvY0CW5./MBXUKEwt8gsCwqxO8t4adKn0E/mrrO', 'IamMom@2025', NULL, 'Hyderabad', '0', 8, 0, '9032016699', '9398228464', '2026-01-13 04:13:16', '2026-01-13 04:13:16', NULL, NULL, NULL, NULL),
(1802, 'Rutba', '9110350422', '$2y$10$yKet2Mhn53ohE4sVF6hEgeeqKSQKR04pccji6uGhdRkn.aICc6fZS', 'data@data', NULL, 'Andhra Pradesh', '0', 8, 0, '9110350422', '9398228464', '2026-01-13 06:46:13', '2026-01-13 06:46:13', NULL, NULL, NULL, NULL),
(1803, 'CN SRINIVASASAGAR', '9154179878', '$2y$10$d/YW/WeiVYegoNDkuVpZg.Dh3SSwTkHIf4o8gEfDvEbfyHIw1b2o.', '123456', NULL, 'Lb nagar', '0', 8, 0, '9154179878', '8639045822', '2026-01-13 11:22:21', '2026-01-13 11:22:21', NULL, NULL, NULL, NULL),
(1804, 'CHERALA SADANANDAM', '9949092812', '$2y$10$14ddcNRtA1wvYzhfnC6EdeTfDSNGjXZy4LimFD.zwUO4KfMqostL2', '123456', NULL, 'JANAGAON', '0', 8, 0, '9949092812', '9381685994', '2026-01-13 12:49:58', '2026-01-13 12:49:58', NULL, NULL, NULL, NULL),
(1805, 'Dr.Suresh kumar Pendem', '9346713539', '$2y$10$5TDxTmPeqKynpwouj19IUuDj49pxlpf55s4/YwxP4.FEHxkGDK4Dq', 'Meena@123', NULL, 'Hyderabad', '0', 8, 0, '9346713539', '7330748009', '2026-01-14 11:50:16', '2026-01-14 11:50:16', NULL, NULL, NULL, NULL),
(1806, 'Aishwarya K', '6362778302', '$2y$10$eTsFuW/vbWXjr2YzM2Kis.K4o1ki8FFk17u4aXLcQ50BzkEnzrNb6', 'aishu1234', NULL, 'Uppal', '0', 8, 0, '6362778302', '9346713539', '2026-01-14 13:04:47', '2026-01-14 13:04:47', NULL, NULL, NULL, NULL),
(1807, 'Roshni', '8247382856', '$2y$10$fRbRn6MNYeh6E3P5pFJhxu30bYbXxyX.XLPUMfRjlY9uQ6H6l56PC', '123456', NULL, 'Hyderabad', '0', 8, 0, '8247382856', '9346713539', '2026-01-14 13:10:52', '2026-01-14 13:10:52', NULL, NULL, NULL, NULL),
(1808, 'M Saadhwini', '8801172482', '$2y$10$XYdtAfDZ7zl/s8S.bDXpQu8JL2IEh7mP2o3/7761ubsmrSSbu2a9C', '1991', NULL, 'Chintal', '0', 8, 0, '8801172482', '8333077851', '2026-01-14 15:50:08', '2026-01-14 15:50:08', NULL, NULL, NULL, NULL),
(1809, 'G.Padma', '7780737390', '$2y$10$XOp8/fbf7.eg.QKXIEdZSOTTi6LH6kVwT9mTlYDVRX9ncFLNOcvoG', '1978', NULL, 'Petlaburj', '0', 8, 0, '7780737390', '9346193908', '2026-01-15 13:19:00', '2026-01-15 13:19:00', NULL, NULL, NULL, NULL),
(1810, 'GUDURU KALAVATHI', '7075759491', '$2y$10$gAwjHVgcJcDM3g9ItwSP0.e5Dud5DSWkv/8FXUK8N/2tMaOOUAGG.', '123456', NULL, 'ISNAPUR HYD', '4000', 8, 0, '7075759491', 'admin', '2026-03-07 08:35:13', '2026-01-16 11:06:40', NULL, NULL, NULL, NULL),
(1811, 'B.K.Anand Reddy', '8688436882', '$2y$10$K1mmobfhRJHWxjtoEZOqH.gOmJYDbtikUQ.OphbUhxildHg8VaC56', 'Hanvi@1987', NULL, 'Patancheru', '0', 8, 0, '8688436882', '7075759491', '2026-01-16 11:37:02', '2026-01-16 11:37:02', NULL, NULL, NULL, NULL),
(1812, 'Dasari Chandra', '9730285773', '$2y$10$lquLh88zRQKtr.FmLbyPCOf85K2hlVcOY1pod11cp8/.J6RQnRBOe', '501313', NULL, 'Anantapur', '0', 8, 0, '9730285773', '8688436882', '2026-01-16 11:44:39', '2026-01-16 11:44:39', NULL, NULL, NULL, NULL),
(1813, 'Swamy goud', '9493868762', '$2y$10$r3C16OwrA7ka1Vt4CxmmX.jv6CC4cl46DmV0MoRP/Cqs7bQ12Cbl6', '123456', NULL, 'Ali cafe', '0', 8, 0, '9493868762', '8639045822', '2026-01-16 13:41:46', '2026-01-16 13:41:46', NULL, NULL, NULL, NULL),
(1814, 'G. Manoj goud', '8143526820', '$2y$10$jsfcLTG7Sn6jUrusyVLisO24Jziom2hl8S50fm9hw5XWPgM59obla', '123456', NULL, 'Miyapur', '0', 8, 0, '8143526820', '9948197000', '2026-01-17 08:29:07', '2026-01-17 08:29:07', NULL, NULL, NULL, NULL),
(1815, 'G. Bhavani', '9666197199', '$2y$10$ZILrangZDPIha77WKTnFWOsV/IufyXOWlGLLEt7wsi7gVbRr7N4UG', '123456', NULL, 'Miyapur', '0', 8, 0, '9666197199', '9948197000', '2026-01-17 08:31:11', '2026-01-17 08:31:11', NULL, NULL, NULL, NULL),
(1816, 'G. Babugoud', '8341500198', '$2y$10$Dby8.xuGfWTincSdAOZL8OVjV8OvDAM3AC2XbmXHO6F.EVfaR/6S2', '123456', NULL, 'Miyapur', '0', 8, 0, '8341500198', '9948197000', '2026-01-17 08:34:36', '2026-01-17 08:34:36', NULL, NULL, NULL, NULL),
(1817, 'Saikumer', '9640377646', '$2y$10$x7qvkfJXjhfGIu62jazSleDmA11m7ooNw7kBx6Y4IRM2la5KkuXWO', '123456', NULL, 'Miyapur', '0', 8, 0, '9640377646', '9948197000', '2026-01-17 08:38:22', '2026-01-17 08:38:22', NULL, NULL, NULL, NULL),
(1818, 'B. Jayasri', '9533111089', '$2y$10$.N4o5VeXExv6izHydzJ5w.1RQGEsuTy6l4COLya3tkPwMANlA/n/i', '123456', NULL, 'Miyapur', '0', 8, 0, '9533111089', '9948197000', '2026-01-17 09:28:41', '2026-01-17 09:28:41', NULL, NULL, NULL, NULL),
(1819, 'Divya', '7093059518', '$2y$10$1CZky85Vs4EKdXT1C4VfQeyvI8Nfoq65VkHg4Q0jLCBjkH1N5.BIG', 'Dnk@112211', NULL, 'Hyderabad', '0', 8, 0, '7093059518', '9666386006', '2026-02-26 01:57:24', '2026-01-18 04:09:41', NULL, NULL, NULL, NULL),
(1820, 'K srinivas', '9912573796', '$2y$10$RjrmfoUuUhAxwYjH30IEPu1KzSM9U7tJpWz/qfHq2O2MImrd2uf1q', '12345', NULL, 'Hyd', '0', 8, 0, '9912573796', '9398859163', '2026-01-18 06:01:12', '2026-01-18 06:01:12', NULL, NULL, NULL, NULL),
(1821, 'P vasu', '9348987576', '$2y$10$DUo2mmxGsVwPUVj2BzMKUu1zbnrXFvS/XKTr/mlFb75K8pbLJeyzy', '12345', NULL, 'Hyd', '0', 8, 0, '9348987576', '9398859163', '2026-01-18 06:02:47', '2026-01-18 06:02:47', NULL, NULL, NULL, NULL),
(1822, 'Akhil Asuri', '9000259564', '$2y$10$IVTiVAsvGxUUyLz6aaxrlOG9ek0LqpkoopspF4rFyHEx6OkEjw/2e', 'Akhil@9977', NULL, 'Hyderabad', '0', 8, 0, '9000259564', '8019592844', '2026-01-20 13:44:55', '2026-01-18 07:27:43', NULL, NULL, NULL, NULL),
(1823, 'R sasikala', '9573048970', '$2y$10$rlLoDkQbOEVB32gvStYQReSiTXQihQiBZIl3CPl8NGnWJgj3rKTN2', 'sasikala', NULL, 'Pulivendula', '0', 8, 0, '9573048970', '9398228464', '2026-01-18 12:28:54', '2026-01-18 12:28:54', NULL, NULL, NULL, NULL),
(1824, 'Maheshwari', '7386425389', '$2y$10$76NzLBPd.RvLdH8JhaaZ.eJwKoD3EMwvooJ8badU2vDwmDQzPmPqe', '12345678', NULL, 'Hyderabad', '0', 8, 0, '7386425389', '6301373342', '2026-01-19 06:39:40', '2026-01-19 06:39:40', NULL, NULL, NULL, NULL),
(1825, 'N Ramanjaneyulu', '9866429324', '$2y$10$0hAm9s/kNp68lZSmvy5MyORQjPyHScteWHaaF5D982mGwBhTnV3Uu', '555999', NULL, 'Hyderabad', '0', 8, 0, '9866429324', '7330748009', '2026-01-19 07:02:07', '2026-01-19 07:02:07', NULL, NULL, NULL, NULL),
(1826, 'Pushpa', '9866503762', '$2y$10$f8K2RnJ3Bnet5CawuW7GkuZwSR0umnu9tvUpI5hP8O1XFQuYhRJ2u', '123456', NULL, 'Neredmet', '0', 8, 0, '9866503762', '8106560969', '2026-01-19 07:03:13', '2026-01-19 07:03:13', NULL, NULL, NULL, NULL),
(1827, 'CH Maheshwar Rao', '9700025758', '$2y$10$CUPWOWIEZizaD3ZyvhIukeQUUEmzsfLE7mx1Nmkixsew9yVKyGrLG', '123456', NULL, 'Hyderabad', '0', 8, 0, '9700025758', '7330748009', '2026-01-19 07:08:27', '2026-01-19 07:08:27', NULL, NULL, NULL, NULL),
(1828, 'SUNKARA VENKATESWRAO', '7075428624', '$2y$10$zPbQCXpdnJ/vL.YBHCnzGu1miaRFkXtas4/lA1KdWCnLW67pAVwki', '5504444', NULL, 'Borabanda', '0', 8, 0, '7075428624', '9700025758', '2026-01-19 07:16:08', '2026-01-19 07:16:08', NULL, NULL, NULL, NULL),
(1829, 'Srilatha', '7995539863', '$2y$10$Gw6KDUcgvx3n37um4jzAiOF/RhJaBuCtLJP7Jbr9BFiZcq1c7i02O', '29261323', NULL, 'Saroornagar', '0', 8, 0, '7995539863', '9398914677', '2026-01-19 07:48:04', '2026-01-19 07:48:04', NULL, NULL, NULL, NULL),
(1830, 'U Balaswamy', '7780578805', '$2y$10$52Inrz.ZyLJyYlXY4KwhVOeEAXNshxQ8AoWOyekJdJsj3b3p.Pv3m', '123456', NULL, 'Hyderabad', '0', 8, 0, '7780578805', '7330748009', '2026-01-19 08:09:27', '2026-01-19 08:09:27', NULL, NULL, NULL, NULL),
(1831, 'M d. Shadulla', '9848233486', '$2y$10$BlQC.OSyeMBpe4rf8twm7eqQ6hPqfjKnoWkgS5uSLRQLnIsFhpKcu', '123456', NULL, 'Hydernagar', '0', 8, 0, '9848233486', '8019592844', '2026-01-19 08:13:09', '2026-01-19 08:13:09', NULL, NULL, NULL, NULL),
(1832, 'Varahalu.Rani', '9182252656', '$2y$10$baS2P0.7ok.1sYsr3JdJpu4q7We8ciiyAAuMHXEQ.crhrv2lZ/a9q', '123456', NULL, 'Neredmet', '0', 8, 0, '9182252656', '8106560969', '2026-01-19 08:36:17', '2026-01-19 08:36:17', NULL, NULL, NULL, NULL),
(1833, 'Annthamma', '9704420523', '$2y$10$7fyQGsrYAUv643Dv5nkGL.poO38WErzWAP6Jabtc3/f8mECYbfXTG', '123456', NULL, 'Neredmet', '0', 8, 0, '9704420523', '8106560969', '2026-01-19 08:38:21', '2026-01-19 08:38:21', NULL, NULL, NULL, NULL),
(1834, 'Sandhya', '9059209914', '$2y$10$w2wrB8ym2oFiVzJrExj7KOXype/q2JN74xrmGgwpWiM/0k0Wm.BZe', '123456', NULL, 'Neredmet', '0', 8, 0, '9059209914', '8106560969', '2026-01-19 09:16:23', '2026-01-19 09:16:23', NULL, NULL, NULL, NULL),
(1835, 'Shylaja', '8184854396', '$2y$10$AWze/m1PlIreJ1iL.S7sDOTftR8PuaBxEpXAEJxds1mMaP0E.3nJi', '8184854396', NULL, 'Krishanagar yousufguda', '0', 8, 0, '8184854396', '7330748009', '2026-01-19 10:43:37', '2026-01-19 10:43:37', NULL, NULL, NULL, NULL),
(1836, 'Dorothy', '9848765739', '$2y$10$1rdBbubZmte1rBCkmSUL/umRPp188J3rE8T/VRxPFJsaTq.SPxiu6', '905969D', NULL, 'Borabanda', '0', 8, 0, '9848765739', '9666386006', '2026-02-26 01:58:05', '2026-01-19 11:12:53', NULL, NULL, NULL, NULL),
(1837, 'Dorothy', '9059524033', '$2y$10$Zr3JGyx4x1qr2yett8sLVu7IcgPZHB4HVooG4FM/PPjcWqS3LVvta', '905969D', NULL, 'Borabanda', '0', 8, 0, '9059524033', '9666386006', '2026-02-26 01:58:14', '2026-01-19 11:14:16', NULL, NULL, NULL, NULL),
(1838, 'Anjali Devi', '9620476743', '$2y$10$nyH30nu3Q/z72OoCgcpJx.llvoV0.Uv3j/PEgBj3W6aCWkT9FcsrO', '123456', NULL, 'Karnataka', '0', 8, 0, '9620476743', '9398228464', '2026-01-19 13:50:04', '2026-01-19 13:50:04', NULL, NULL, NULL, NULL),
(1839, 'Akula MADHAVI', '9848728620', '$2y$10$SQIUSIdsFVc5oWDjTJPJWuQz5o11Lvw7yQqHkKUXZfh714rskTGse', '123456', NULL, 'Nagole hyd', '0', 8, 0, '9848728620', '9392178957', '2026-01-20 13:43:40', '2026-01-19 13:50:18', NULL, NULL, NULL, NULL),
(1840, 'Ch. Shailaja', '9703203392', '$2y$10$l4tdPp9fbrODkGf5IvOKfujolw4eCvyYPPj/n7AMEnpg04FVXBy.u', '143143', NULL, 'Miryalaguda', '0', 8, 0, '9703203392', '9398228464', '2026-01-20 04:40:06', '2026-01-20 04:40:06', NULL, NULL, NULL, NULL),
(1841, 'Aallaji', '7702664749', '$2y$10$AjbTQydWvBAywTsMAGZtX.6ckkkAWVqZiRDXHydISJagBbr6wLHqe', '123456', NULL, 'Hyderabad', '0', 8, 0, '7702664749', '8639974381', '2026-01-20 09:42:50', '2026-01-20 09:42:50', NULL, NULL, NULL, NULL),
(1842, 'Pavan Kumar', '6302156277', '$2y$10$PDGga2iWPOiat8DcL6gL9eRLyd5KOo2TzVa/.wg9oVY1q3uwFAhbK', 'Pavan@11567', NULL, 'Vinayak nagar,neredmet,Malkajgiri, HYD', '0', 8, 0, '6302156277', '9866503762', '2026-01-20 09:58:07', '2026-01-20 09:58:07', NULL, NULL, NULL, NULL),
(1843, 'VENKATA RAJU MUDUNURI', '9959211567', '$2y$10$k0R6pbB9LdTcemwj5gfTiOG4C7d.QX43NdcQkSsPSv9yykzZaVzg2', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9959211567', '8639974381', '2026-01-20 13:23:36', '2026-01-20 13:23:36', NULL, NULL, NULL, NULL),
(1844, 'Jagadish babu p', '9391989878', '$2y$10$ymsd9Ml0VN.YSKH9KUbs1O1Xo9L6k/Vj7YmnzKDCVvzy6cx6MmGPy', 'Mahaan@1', NULL, 'Hyderabad', '0', 8, 0, '9391989878', '7893338383', '2026-01-21 21:24:25', '2026-01-21 09:10:01', '2B , Sree nilayam Apt , opp sri vasista school sai saradhi nagar , yellareddyguda', 'Hyderabad', 'Telengana', '500073'),
(1845, 'Sharada', '7659901985', '$2y$10$FFP4fDLrkZ0YE0oKIDUWPu5IDa8znGABBVW1HkY5KEXlCjasEj7/K', '123456', NULL, 'Uppal', '0', 8, 0, '7659901985', '9391989878', '2026-01-21 11:24:23', '2026-01-21 11:24:23', NULL, NULL, NULL, NULL),
(1846, 'Umadevi reddy P', '9866061392', '$2y$10$9wA9pRTXi8eDxgp1gk1os.377KLEP3iB/bljnQXw7AyR.tKynLyMe', '123457', NULL, 'Kismathpur', '0', 8, 0, '9866061392', '9391989878', '2026-01-21 11:36:19', '2026-01-21 11:36:19', NULL, NULL, NULL, NULL),
(1847, 'Ramakrishna M', '9182995011', '$2y$10$zfTrqhNMy3Y1oRYPQZ/wKeOlDl1bj0Ti1KEqG21FUDppg.YrbF3Eq', '123456', NULL, 'Chaithanyapuri', '0', 8, 0, '9182995011', '9391989878', '2026-01-21 11:39:18', '2026-01-21 11:39:18', NULL, NULL, NULL, NULL);
INSERT INTO `service_users` (`service_id`, `member_name`, `member_phone`, `password`, `open_password`, `user_profile_pic`, `location`, `cumulative_gross`, `commission_percentage`, `back_two_back_balance`, `referral_id`, `referral_by`, `created_at`, `joined_date`, `address`, `city`, `state`, `pincode`) VALUES
(1848, 'Venkat reddy p', '7416495999', '$2y$10$5oWpDteg3aqFC/NoDCBHdOITKd9oI1Evqz70hzZ9kyTk21UM0WSEW', '123456', NULL, 'Srinagar colony', '0', 8, 0, '7416495999', '9391989878', '2026-01-21 11:50:48', '2026-01-21 11:50:48', NULL, NULL, NULL, NULL),
(1849, 'ramesh', '7659988741', '$2y$10$dmCCbYlYnVhMf9w9dfp1EOd7CuVgx7Z.onzA19FicIihcH7S2PPoG', '123456789', NULL, 'Hyderabad', '0', 8, 0, '7659988741', '9666386006', '2026-02-26 01:59:25', '2026-01-21 11:51:53', NULL, NULL, NULL, NULL),
(1850, 'Dr swarna latha Vallurupalli', '7702829829', '$2y$10$EV8j8XZ54EGzApydfscOruSHbSvU/IIQvByzyOvY15M96BEZLeWYy', '829829', NULL, 'Kphb', '0', 8, 0, '7702829829', '9391989878', '2026-01-21 13:27:28', '2026-01-21 13:27:28', NULL, NULL, NULL, NULL),
(1851, 'Abhinav v', '9398854969', '$2y$10$KM5dVJ1QfKEgbi/E2yzsfuOsuN6jygy9sNjfOqVmoIbxdI54XyroW', '123456', NULL, 'Kphb', '0', 8, 0, '9398854969', '9391989878', '2026-01-21 14:54:59', '2026-01-21 14:54:59', NULL, NULL, NULL, NULL),
(1852, 'Swarna kumari', '9618637613', '$2y$10$gXc5kvzRNOEbwdJiOdrAlOvsILo9YN5UJuh5IsWkZ7tomo6K/dCQK', '123456', NULL, 'Madhura nagar', '0', 8, 0, '9618637613', '9182995011', '2026-01-21 15:26:23', '2026-01-21 15:26:23', NULL, NULL, NULL, NULL),
(1853, 'THARA BEGUM', '6304092716', '$2y$10$PG4TYuDIHSvEX4MX3R512uWwQsG2OFvA/Bbj2Hc5PXI0J/zmXj1T6', '123456', NULL, 'Yusufguda', '0', 8, 0, '6304092716', '7659901985', '2026-01-21 15:35:32', '2026-01-21 15:35:32', NULL, NULL, NULL, NULL),
(1854, 'RADHIKA P', '9394572881', '$2y$10$TFpeQ9yRx6tzrVenb6reku0SO7FxKicvEZ1JiGa0jJPMCF3rvljWG', '123456', NULL, 'Yellareddyguda Hyd', '0', 8, 0, '9394572881', '9391989878', '2026-01-22 02:48:35', '2026-01-22 02:48:35', NULL, NULL, NULL, NULL),
(1855, 'Thota swamy', '9059097054', '$2y$10$ATPo4E70XdCF9qQWAplFf..VtVN5E0WeEmt3Hb9a8b2PewnL04iku', '112244', NULL, 'Tenali', '0', 8, 0, '9059097054', '9666386006', '2026-02-26 01:59:45', '2026-01-22 08:16:05', NULL, NULL, NULL, NULL),
(1856, 'E Anand', '9948413855', '$2y$10$/NHBg23BwIMDryitkzY13OR/LQ5IQAwLrre9tq7e6Vq6lrOk737n2', '9948413855', NULL, 'hy', '0', 8, 0, '9948413855', '8522881144', '2026-01-23 09:57:11', '2026-01-23 09:57:11', NULL, NULL, NULL, NULL),
(1857, 'MEENAKSHI', '9848877361', '$2y$10$o3jJPjdHC4wfI479AquxOOeiPT/a4k86ZAac3M6ljQq7g5RGs/xHO', '123456', NULL, 'Hyderabad', '0', 8, 13000, '9848877361', '8522881144', '2026-01-24 07:16:50', '2026-01-24 07:15:41', NULL, NULL, NULL, NULL),
(1858, 'B Nirmala', '9177871094', '$2y$10$FOQYGwXl8YSGcvyIfcR/HeAI6XyFo39dxuNqYw62F3zmDZc/642Hu', '123456', NULL, 'Hyderabad', '0', 8, 0, '9177871094', '9848489720', '2026-01-24 09:14:16', '2026-01-24 09:14:16', NULL, NULL, NULL, NULL),
(1859, 'Shankara chary', '7569430892', '$2y$10$uv4FU1wJTcuw4FtD1NPXdOb0he0/AqVawzWauygfhCgDvGlAmzUNm', '123456', NULL, 'HYDERABAD', '0', 8, 0, '7569430892', '8639974381', '2026-01-24 14:23:30', '2026-01-24 14:23:30', NULL, NULL, NULL, NULL),
(1860, 'A. Archana', '9951597615', '$2y$10$fUv7vhUpTGu6tZCJ8SNk8OsZSri6weSgQHfySfgZvbNUSX/jMUKMi', 'Siva', NULL, 'Mohannagar', '0', 8, 0, '9951597615', '9177871094', '2026-01-26 10:14:31', '2026-01-24 15:43:14', NULL, NULL, NULL, NULL),
(1861, 'K.shyam', '8686099981', '$2y$10$gqzmEG/MtlBzm9cTeQ6A5ut0.JY2oHuskkOqO5i0cpsZdcACCL0LS', '9866592624', NULL, 'Meerpet chintalakunta', '0', 8, 0, '8686099981', '6281745359', '2026-01-25 12:27:07', '2026-01-25 07:46:03', NULL, NULL, NULL, NULL),
(1862, 'P.Rajkumar', '6281745359', '$2y$10$K6vlLabqc3DAwFk30h6L1OSb1X4eZbyK.NjTQf.ZSF9e9nooRlVBW', '1977', NULL, 'Meerpet. Brundavan colony.', '0', 8, 0, '6281745359', '7330748009', '2026-01-25 08:08:33', '2026-01-25 08:08:33', NULL, NULL, NULL, NULL),
(1863, 'M.GNANA PRAKASH', '9963192159', '$2y$10$2D.UOhkihh1f4fgdaAOGk.HGGVINEUbDtL6DWDvmVY6UWx4TscoaK', '123456', NULL, 'Hyderabad', '0', 8, 0, '9963192159', '7569430892', '2026-01-26 11:32:55', '2026-01-26 11:32:55', NULL, NULL, NULL, NULL),
(1864, 'Somanna', '9849572597', '$2y$10$ppFK1jcImbf./g9mn9ogAeZNgNzyKc9hGSdBzNByG3jBGrDKuDGeW', '121314', NULL, 'Nagole', '0', 8, 0, '9849572597', '9951597615', '2026-01-26 12:02:49', '2026-01-26 12:02:49', NULL, NULL, NULL, NULL),
(1865, 'Venkata Siva', '9030126436', '$2y$10$kCsgmKFrztJ7IJOw17BFgeSND0X6CegHAPJZWbTGJMfUwATEXBvAC', 'Pra i@2006', NULL, 'Mohan nagar', '0', 8, 0, '9030126436', '9951597615', '2026-01-26 12:45:19', '2026-01-26 12:45:19', NULL, NULL, NULL, NULL),
(1866, 'KANDIKONDA RAJESHWAR', '9849627725', '$2y$10$PYkgKy2MuX2YRemnpCGrd.MXEwrNIeGabpi2BS0MJSOSFBeTUS/SG', '984962', NULL, 'Uppal', '0', 8, 0, '9849627725', '9951597615', '2026-01-27 07:40:33', '2026-01-27 07:40:33', NULL, NULL, NULL, NULL),
(1867, 'Ganta Devadas', '9866474331', '$2y$10$hWJxRIzt6OxDK4SYJjrvrOzFmhBr5UbEEw0.4d2YuQH28YoR/AQ.C', '9866', NULL, '24-1133Arundathinagar Jawahar Nag', '0', 8, 0, '9866474331', '9177871094', '2026-01-27 13:30:11', '2026-01-27 13:30:11', NULL, NULL, NULL, NULL),
(1868, 'Syed jameel ur rahman', '9505443306', '$2y$10$5ZUMEoDmBjtaqt.QKD//V.ldsSGJedWBXp4M180PtWvsnHuEbr9qG', '123456', NULL, 'Tolichowki, hyd', '0', 8, 0, '9505443306', '9398859163', '2026-01-27 15:37:43', '2026-01-27 15:37:43', NULL, NULL, NULL, NULL),
(1869, 'Mohd burhan ali', '9346458548', '$2y$10$/q0Hnn9l.WcdDxdTTVdt9uVnVIxhdOl5c6k47SvKNkk5I5/e5tXyG', '12345', NULL, 'Ramanthapur', '0', 8, 0, '9346458548', '9177871094', '2026-01-27 22:58:47', '2026-01-27 22:58:47', NULL, NULL, NULL, NULL),
(1870, 'P.VASAVI', '9133066242', '$2y$10$MaUNmrYIdn4Kin.Wgu7JW.UBENMCRhRljBTqVJFXN7IHE3RBvhWoy', '123456', NULL, 'Mohan nagar', '0', 8, 0, '9133066242', '9951597615', '2026-01-29 07:02:32', '2026-01-29 07:02:32', NULL, NULL, NULL, NULL),
(1871, 'DrPURUSHOTHAM  JERIPOTHULA', '9700675350', '$2y$10$LmRfWbvZlYRHNoF/ZJKoVe/pYVrbt1sZnNJ35gLU/MMSF4hqLuKgm', '984929', NULL, 'Hyderabad', '0', 8, 0, '9700675350', '9390596123', '2026-01-30 07:15:00', '2026-01-30 07:15:00', NULL, NULL, NULL, NULL),
(1872, 'P.Sandhya Rani', '8096685217', '$2y$10$96Sbk.Y1p1eHWdeYCrhIvu4U19VeagMDLoCh5mid17Sl7ENLQ6q7m', '12345', NULL, 'Hyderabad', '0', 8, 0, '8096685217', '9700675350', '2026-01-30 07:30:41', '2026-01-30 07:30:41', NULL, NULL, NULL, NULL),
(1873, 'Suraj vision foundation', '9550002898', '$2y$10$GaYF/jBjlDIeOVvB1uobauVXWuWJc5z66Evzly1K642ICMZGbxDAC', 'Suraj@2026', NULL, 'Hyderabad', '0', 8, 0, '9550002898', '7330748009', '2026-01-30 09:16:33', '2026-01-30 09:16:33', NULL, NULL, NULL, NULL),
(1874, 'Vijaykumar', '8790474467', '$2y$10$FxIM1k2QQid/s28cUIPPIuS5./ywFfcqgL1MvFUad9PH9E4U4M.by', '879077', NULL, 'Medipally', '0', 8, 0, '8790474467', '9550002898', '2026-01-30 11:10:16', '2026-01-30 11:10:16', NULL, NULL, NULL, NULL),
(1875, 'Zareena Sultana', '7893721927', '$2y$10$rpvwxc7Ip15Juy/es8aZjOiAt.TLgoh2m2YpkpR8gvhKhCOOlJJD.', '12345', NULL, 'Vinayak nager', '0', 8, 0, '7893721927', '8106560969', '2026-01-30 13:30:28', '2026-01-30 13:30:28', NULL, NULL, NULL, NULL),
(1876, 'Y.DURGA PRASAD', '9014034105', '$2y$10$SXuEuPp7TOHz0MxYCGFmSuMuzRx.d8.f8manBZJESZYvwEz0SVo9.', 'Prasad@944440', NULL, 'Godavarikhani, peddapalli district', '0', 8, 0, '9014034105', '9848489720', '2026-02-26 02:01:22', '2026-01-31 06:06:39', NULL, NULL, NULL, NULL),
(1877, 'S jalees ur rahman', '8790104932', '$2y$10$pdAZVXFkdhuvs7I8Eiwj.ujrZJGsde1erhzstSa.MaYMSoVnIufsm', 'shabnam123456', NULL, 'Hyd', '0', 8, 0, '8790104932', '9398859163', '2026-01-31 06:27:46', '2026-01-31 06:27:46', NULL, NULL, NULL, NULL),
(1878, 'Md gousuddin', '9346822796', '$2y$10$3otLeZPlMnBMSMdpME8ukemoYSzpMe/XCH.YzxS6NuPvEgm7zG04u', '123456', NULL, 'Hyd', '0', 8, 0, '9346822796', '9398859163', '2026-01-31 06:35:16', '2026-01-31 06:35:16', NULL, NULL, NULL, NULL),
(1879, 'Manchala Suraj Raj', '9492350947', '$2y$10$.FBhl3g9lXo5BEzrWao3quoBX4PuO./H1VEKi77CBVfrW6sT75gIK', 'Suraj@2026', NULL, 'Hyderabad, Telangana, India', '0', 8, 0, '9492350947', '9550002898', '2026-01-31 09:54:45', '2026-01-31 09:54:45', NULL, NULL, NULL, NULL),
(1880, 'Y.DURGA PRASAD', '9398145424', '$2y$10$7VMuvnkxuj63VaBiwzE5QO/ap4gh0kJ1a2zlA6ZqmIkA3nmpnDwpa', '944440', NULL, 'Godavarikhani, peddapalli district', '0', 8, 0, '9398145424', '9848489720', '2026-02-01 17:20:17', '2026-02-01 17:20:17', NULL, NULL, NULL, NULL),
(1881, 'prasannakrishna ch', '9963315158', '$2y$10$rNFuhszgurK0B0RG4A209.Z7GFMidodbkfuTM6QM4UVvX5aIBOOfq', 'Prasi@412', NULL, 'Hyderabad', '0', 8, 0, '9963315158', '9492350947', '2026-02-02 05:43:05', '2026-02-02 05:43:05', NULL, NULL, NULL, NULL),
(1882, 'Vallabhapurapu Durga sukanya', '7981360149', '$2y$10$Li58Pw7nPS4LaZgbFxB1w.YH1FLA3yCM3XsxpbIpxFZecKWlFk5XK', 'durga@123', NULL, 'Kukatpalli', '0', 8, 0, '7981360149', '9908263153', '2026-02-02 06:14:41', '2026-02-02 06:14:41', NULL, NULL, NULL, NULL),
(1883, 'Chinthakindi Sravanthi', '8977779883', '$2y$10$UqGo80nB9R5oxmC2QC13iOg.WYAlhQMQlEPqbtcO5n8xdVoFMYeNK', 'chatura sree', NULL, 'Cherlapally', '0', 8, 0, '8977779883', '9908263153', '2026-02-02 08:28:24', '2026-02-02 08:28:24', NULL, NULL, NULL, NULL),
(1884, 'William', '7569385242', '$2y$10$ZiHzxt3WcEFuMRG/SyHFvu10zDe7EQMQLPIWEcKFfJepBltZhEnQu', '12345jabamani', NULL, 'Trimulgherry, Secunderabad', '0', 8, 0, '7569385242', '7286963204', '2026-02-02 11:11:06', '2026-02-02 11:11:06', NULL, NULL, NULL, NULL),
(1885, 'Venkatesh', '9390777391', '$2y$10$sljiiWE6aoKES1k4UgTaQeXWYaKD0qxapNGaYA.0V14sBTXr7vY6y', '12345', NULL, 'Lbnagar', '0', 8, 0, '9390777391', '7286963204', '2026-02-02 11:58:09', '2026-02-02 11:58:09', NULL, NULL, NULL, NULL),
(1886, 'Y srinivasarao', '9989134353', '$2y$10$runc/vFL0ALUb4L/J0wdROCRGE7Tcn7.JjVQyOZ98fSRr/MvHeYza', 'shabnam123456', NULL, 'Motinagar hyd', '0', 8, 0, '9989134353', '9398859163', '2026-02-02 13:45:18', '2026-02-02 13:45:18', NULL, NULL, NULL, NULL),
(1887, 'Mahadev Narumalla', '8099977990', '$2y$10$cafFENohFJEGZhfrIcgBZuekf4ujj0JM7utkU/CGlhcUwoANeq0cO', 'Addmag@123', NULL, 'Hyderabad', '0', 8, 0, '8099977990', '9492350947', '2026-02-03 01:07:19', '2026-02-03 01:07:19', NULL, NULL, NULL, NULL),
(1888, 'P. Ramadevi', '8187800481', '$2y$10$QYTU5T2oXiZ1OzBNYZYzfe.Gvnpr2ITqdMo0RXmxEXIbOBp9ffE7a', '175@549', NULL, 'Choutuppal', '0', 8, 0, '8187800481', '7330748009', '2026-02-03 04:46:58', '2026-02-03 04:46:58', NULL, NULL, NULL, NULL),
(1889, 'P. RAJU', '9392388314', '$2y$10$kYoAfkCKXvsIErPTwgIC9uH/kGTLq9Zq3ZwjQetUE0eNPIOyBy3Ym', '236@762', NULL, 'Choutuppal', '0', 8, 0, '9392388314', '8187800481', '2026-02-03 05:08:03', '2026-02-03 05:08:03', NULL, NULL, NULL, NULL),
(1890, 'Raju J', '8074747376', '$2y$10$aBMiBdHDMyDvaqhhR10q/.zztipfdbU6Fdt/EEElfwuYvOSk1JWnu', '1234', NULL, 'Warangal', '0', 8, 0, '8074747376', '8522881144', '2026-02-03 06:06:19', '2026-02-03 06:06:19', NULL, NULL, NULL, NULL),
(1891, 'SHEELAM ALEKHYA', '9573739838', '$2y$10$t8tNtNQocvIWPfJT67egWOLQNQ0c9H./Slv8hpXFOlW9fy0xQzkD.', 'Sheelam@123', NULL, 'nakrekal', '0', 8, 0, '9573739838', 'admin', '2026-02-03 12:33:10', '2026-02-03 12:33:10', NULL, NULL, NULL, NULL),
(1892, 'Kakkerla vidya', '8978462245', '$2y$10$Zh5YzKWuligTR0LhLZN2ouziDix8uorQ0w68MDqy5P/N0O25yZqMK', '160619', NULL, 'Hanamkonda', '0', 8, 0, '8978462245', '8522881144', '2026-02-03 13:27:23', '2026-02-03 13:27:23', NULL, NULL, NULL, NULL),
(1893, 'Gaddamedi Maramma', '7730838622', '$2y$10$FL49upzBvXgGAYSogyIQ0uBC6NXEFk0yaT5ghwXDI2lK6DzP5qb8i', '123456', NULL, 'Chityal', '0', 8, 0, '7730838622', '8096685217', '2026-02-04 06:03:32', '2026-02-04 06:03:32', NULL, NULL, NULL, NULL),
(1894, 'M Sidharth', '8500520898', '$2y$10$gruXAX7GILbVXD.NAymQXeOqcnar4oz11f.ZzN/uf/lzC5vnaZwXy', 'Sidharth@2016', NULL, 'Uppal Hyderabad', '0', 8, 0, '8500520898', '9550002898', '2026-02-05 13:52:29', '2026-02-05 13:52:29', NULL, NULL, NULL, NULL),
(1895, 'Yaseen', '6305601984', '$2y$10$DxrR1kc2ZpnxF33Q4ai6n.TiEMjEdZknDB5VvK4g8owzQs.33tcBy', '123456', NULL, 'Motinagar hyd', '0', 8, 0, '6305601984', '9398859163', '2026-02-05 15:50:05', '2026-02-05 15:50:05', NULL, NULL, NULL, NULL),
(1896, 'Susila', '7416507295', '$2y$10$xcRvHjhuVsFfwpDTxZ2ue.PA9khBGtl.YhvTZf65cHOkB394YXace', '123456', NULL, 'Sanathnagar hyd', '0', 8, 0, '7416507295', '9398859163', '2026-02-05 16:09:43', '2026-02-05 16:09:43', NULL, NULL, NULL, NULL),
(1897, 'Pradeep', '9908003456', '$2y$10$npSUp4rq7SYfmoe/pKajzuObsd9OKuYtqs.jMQlp0gtMCeJSpVjAu', '123456', NULL, 'Sanathnagar , hyd', '0', 8, 0, '9908003456', '9398859163', '2026-02-06 04:56:37', '2026-02-06 04:56:37', NULL, NULL, NULL, NULL),
(1898, 'Veera swamy', '9000418123', '$2y$10$cQoNuX/ArugUhSqFtRTcAe1ljTVWe3SP6pMLHOaSKmTsL0kgVAPAi', '124456', NULL, 'Motinagar hyd', '0', 8, 0, '9000418123', '9398859163', '2026-02-06 05:00:39', '2026-02-06 05:00:39', NULL, NULL, NULL, NULL),
(1899, 'Ch srinivasarao', '8106457322', '$2y$10$dvasLZ.eCvkLY8UYvCLGHujtxM42XX/Djr7g98dxd2J0/cdTj/7Q.', '123456', NULL, 'Chintal hyd', '0', 8, 0, '8106457322', '9398859163', '2026-02-06 05:04:03', '2026-02-06 05:04:03', NULL, NULL, NULL, NULL),
(1900, 'AMBALLA KUMAARASWAAMY', '9063432247', '$2y$10$S/N3T8wY2V92M2uOu9I/ouRCChzCUOvBuuCdpe6yZACqPy9U.867W', 'Kumar@999', NULL, 'RAJAHMUNDRY', '0', 8, 0, '9063432247', '9381685994', '2026-02-06 05:53:10', '2026-02-06 05:53:10', NULL, NULL, NULL, NULL),
(1901, 'Murali', '9951445683', '$2y$10$GL3JFsD/Vy0hbs.m/2iyseTtG1LEZx5QDgFEAEA7FAhuF9IQPpF16', '123456', NULL, 'Hyd Czech colony', '0', 8, 0, '9951445683', '9398859163', '2026-02-06 06:34:28', '2026-02-06 06:34:28', NULL, NULL, NULL, NULL),
(1902, 'Javaji Alivelu', '8463903541', '$2y$10$lIJSpJj8EdHYk/AYO/NgQ.X5WA5Iibf3rFNhJU9UV7HqzUfBMqJWS', 'Suraj@2026', NULL, 'Hyderaba', '0', 8, 0, '8463903541', '9550002898', '2026-02-06 08:58:08', '2026-02-06 08:58:08', NULL, NULL, NULL, NULL),
(1903, 'K Hymavathi', '8008814915', '$2y$10$4e.uYEiijw3o88WgW9DIPOzjyq6UTKXIsfYK8/mDBrM57oK.7rZCK', 'hymavathi', NULL, 'Hyderabad', '0', 8, 0, '8008814915', '9550002898', '2026-02-06 09:02:05', '2026-02-06 09:02:05', NULL, NULL, NULL, NULL),
(1904, 'Ramakrishna Vinjamoori', '9966292620', '$2y$10$GJxp2NyjA.3.4U7V0VzWcOaKUHVolW7i87/yjrohTxX.Ch9g36.1S', 'Rkv@969696', NULL, 'Hyderabad', '0', 8, 0, '9966292620', '9550002898', '2026-02-06 09:05:44', '2026-02-06 09:05:44', NULL, NULL, NULL, NULL),
(1905, 'Sangapolla Sangameshwar', '7674808128', '$2y$10$ZJaV38wryN4A1yAcXsPQIOAtsJKc0NeorFTbFNKPO1DjVJdmuVrkC', 'bunny_128', NULL, 'Hyderabad', '0', 8, 0, '7674808128', '8790474467', '2026-02-06 09:12:06', '2026-02-06 09:12:06', NULL, NULL, NULL, NULL),
(1906, 'Sakhi', '6305987683', '$2y$10$gnXReFz/xo3TW5lQK9pK0OsSGAD6zDT3dzJ7TQRagevmToFMzIAbO', 'Bujji1234', NULL, 'Hyderabad', '0', 8, 0, '6305987683', '8790474467', '2026-02-06 09:12:07', '2026-02-06 09:12:07', NULL, NULL, NULL, NULL),
(1907, 'Nimma rachana', '7995275782', '$2y$10$1f6bi/9TAJumYMxFMvhBz.k7ioAorh4EBBpOyk87bO2YUEMMqksXq', 'rachan', NULL, 'Hyderabad', '0', 8, 0, '7995275782', '8790474467', '2026-02-06 09:12:15', '2026-02-06 09:12:15', NULL, NULL, NULL, NULL),
(1908, 'Kotigalla Soundarya', '9390428708', '$2y$10$D0r/5On6xOgw3QBPMBJkVees6AbwCMQOJtZ2IuZI3TXx/eU/jLZ/y', 'SR9390', NULL, 'Hyderabad', '0', 8, 0, '9390428708', '8790474467', '2026-02-06 09:12:22', '2026-02-06 09:12:22', NULL, NULL, NULL, NULL),
(1909, 'Muthyala Shiva', '9441310063', '$2y$10$cy7/XLlw2xZsUJhdIxX0IeksgDcomo8wuDT4SRBLyK.MfyMcM/Wqu', 'shiva143', NULL, 'Hyderabad', '0', 8, 0, '9441310063', '8790474467', '2026-02-06 09:15:02', '2026-02-06 09:15:02', NULL, NULL, NULL, NULL),
(1910, 'Nimma rachana', '8019244871', '$2y$10$dllh02u0E6JrF/15hYCgwOZVWCRWWhtnvxpwX.WazwvHVIHkz45Xe', 'Rachana', NULL, 'Hyderabad', '0', 8, 0, '8019244871', 'admin', '2026-02-06 09:27:40', '2026-02-06 09:27:40', NULL, NULL, NULL, NULL),
(1911, '967619472, vijaya', '9676194724', '$2y$10$IqLEfbgxa5JH.995bXCdDuB.ig/gh0UIwOBIp8/wpT37d6yaIxInK', '1234', NULL, 'hyd', '0', 8, 0, '9676194724', '9441310063', '2026-02-06 09:29:35', '2026-02-06 09:29:35', NULL, NULL, NULL, NULL),
(1912, 'P. Amani', '9177451643', '$2y$10$5obJwz89sfpTa9PyhO1hNeumN8F9ypuc1NZel7X/8C8M6cQBxvGxi', 'pasulaamani@gamil.com', NULL, 'Peerzadiguda', '0', 8, 0, '9177451643', '8790474467', '2026-02-06 09:38:53', '2026-02-06 09:38:53', NULL, NULL, NULL, NULL),
(1913, 'Madhu Nomula', '8985682145', '$2y$10$39kHdVjkjLteGyTZNmX6O.ZOSapoLTCQgyjP99QQ.Sp05KQfoZMn2', 'Madhu@123', NULL, 'Uppal', '0', 8, 0, '8985682145', '9492350947', '2026-02-06 09:46:38', '2026-02-06 09:46:38', NULL, NULL, NULL, NULL),
(1914, 'Sharanya', '8008206554', '$2y$10$SZ8uobUK28vt2lZs8bo6NOTWYumFxQewHI9ubT6Xfy43ODR0zo6gW', 'sharanya', NULL, 'Morthad', '0', 8, 0, '8008206554', '8019244871', '2026-02-06 10:00:50', '2026-02-06 10:00:50', NULL, NULL, NULL, NULL),
(1915, 'Ankam bikshapathi', '9701135220', '$2y$10$N4VwQAMpNBZtCiiclViuoOE1oWDxZmnY.7Jx/kD2q81vpX8yZSKbC', 'ankamshivansh', NULL, 'Hyderbad', '0', 8, 0, '9701135220', '8008814915', '2026-02-06 10:41:04', '2026-02-06 10:41:04', NULL, NULL, NULL, NULL),
(1916, 'Basani.  Sathyanarayana', '8985782308', '$2y$10$JkSCWLx3OamSgKspQiFSN.WJ.QFaJUPpbvQMPuHEqU3phzWZXxPlC', '123456', NULL, 'Warangal', '0', 8, 0, '8985782308', '9381477148', '2026-02-06 10:41:46', '2026-02-06 10:41:46', NULL, NULL, NULL, NULL),
(1917, 'Ollala rajitha', '9652717919', '$2y$10$4bq5eVow0h6VPuMAnZRzz.SFYABwcEB67TmTKCI7eyfoDIWRkj0OS', 'rajitha', NULL, 'Par kala', '0', 8, 0, '9652717919', '8008814915', '2026-02-06 10:47:45', '2026-02-06 10:47:45', NULL, NULL, NULL, NULL),
(1918, 'V Gouthami', '9346805606', '$2y$10$AlvA/10u4pSICKOax5qGnO/77QfFZNjrenBDMqvXPghtLI0PTlnr.', '140718', NULL, 'Khajipur', '0', 8, 0, '9346805606', '8019244871', '2026-02-06 11:07:11', '2026-02-06 11:07:11', NULL, NULL, NULL, NULL),
(1919, 'Murali kishore', '8341920149', '$2y$10$hKHsvLo2FPTZOgyozBwGmuLM9FV60QCB/5fs9DASbcGvmk2J.VtBG', '124456', NULL, 'Sanathnagar hyd', '0', 8, 0, '8341920149', '9398859163', '2026-02-06 12:16:53', '2026-02-06 12:16:53', NULL, NULL, NULL, NULL),
(1920, 'Ramesh goud', '9618601810', '$2y$10$RkIlWdTIk.AKEms9aRHNX.2HTHfecoMmmu2AOXpra/T7m/3/mJeRO', '12345', NULL, 'Hyderabad', '0', 8, 0, '9618601810', '7286963204', '2026-02-06 12:38:27', '2026-02-06 12:38:27', NULL, NULL, NULL, NULL),
(1921, 'Katakam Navatha', '8320079459', '$2y$10$NlHjBz2.TAtE15lgm2G0dui8Pds6P0Z9KtpfN64CldD/XYez7MTj2', '9723071002', NULL, 'Challagariga', '0', 8, 0, '8320079459', '8008814915', '2026-02-06 12:38:40', '2026-02-06 12:38:40', NULL, NULL, NULL, NULL),
(1922, 'Katakam Navatha', '8320079759', '$2y$10$ebiq8xhz8Ra9txCc.uYd8u1wFAhrSfWAUdRR8wyXs1P8cdLA78grG', '9723071002', NULL, 'Challagariga', '0', 8, 0, '8320079759', 'admin', '2026-02-06 12:41:06', '2026-02-06 12:41:06', NULL, NULL, NULL, NULL),
(1923, 'Jayamma', '9948691781', '$2y$10$P3NtvmHwrayBIE5fFGLk0u3m59N/KpBV6BK8dGsuh0VDKPTDb0o4S', '12345', NULL, 'Hyd', '0', 8, 0, '9948691781', '7286963204', '2026-02-06 12:42:44', '2026-02-06 12:42:44', NULL, NULL, NULL, NULL),
(1924, 'Sunitha', '9652521549', '$2y$10$E/1u6rWvb01eRPSQKBlPWuFQJGG5OmK5sRN.hBUgbVwQn/GtOVn6G', '12345', NULL, 'Htd', '0', 8, 0, '9652521549', '7286963204', '2026-02-06 12:43:41', '2026-02-06 12:43:41', NULL, NULL, NULL, NULL),
(1925, 'Mosesraj', '9391184147', '$2y$10$umSJikm1xH4Bwc8cSlv7iOEzL9H4gVfMQ/4Q04I1wsjVsTxoDcu.W', '12345', NULL, 'Hyd', '0', 8, 0, '9391184147', '7286963204', '2026-02-06 12:56:21', '2026-02-06 12:56:21', NULL, NULL, NULL, NULL),
(1926, 'Girmaji Keerthana', '9676268545', '$2y$10$6uYOJka/gxnlYmwPELo39e1w6QbZSlRBqo8rYdufYP2fYG2uwIyqC', '123456', NULL, 'Nizamabad', '0', 8, 0, '9676268545', '8019244871', '2026-02-07 02:37:44', '2026-02-07 02:37:44', NULL, NULL, NULL, NULL),
(1927, 'M V L DURGARAO', '8187021297', '$2y$10$QouycmuodgUTJle6SjgnxuHNibf5gULhQahDtDo5XnXd0jebK2kTm', '654321', NULL, 'Samalkot', '0', 8, 0, '8187021297', '8639045822', '2026-02-07 04:14:34', '2026-02-07 04:14:34', NULL, NULL, NULL, NULL),
(1928, 'Mamidala ramesh', '9010529449', '$2y$10$yyW77C8uO9n2ObBDZKpQbuzbjvZ7nnVLspyPX0eyP0PBwU7bPbDYK', '701313', NULL, 'Sv Nagar Mallapur 500076', '0', 8, 0, '9010529449', '8008814915', '2026-02-07 09:44:54', '2026-02-07 09:44:54', NULL, NULL, NULL, NULL),
(1929, 'Mani Kumar', '9705541865', '$2y$10$zKAV.xQn9buTPo8lYxewVeALuGMlUqxr.mPGTkvUt2j58maEfnvm6', '9705541865', NULL, 'Jaggaiahpet', '0', 8, 0, '9705541865', '8008814915', '2026-02-07 10:59:21', '2026-02-07 10:59:21', NULL, NULL, NULL, NULL),
(1930, 'P Laxman', '8019413846', '$2y$10$yu5dQCXUFxq55qE3gqmDMuXxoMvX1lBU3OU5zeGlai4eJAsSRT2Oa', 'laxman@123', NULL, 'Bodupal', '0', 8, 0, '8019413846', '9492350947', '2026-02-07 11:07:25', '2026-02-07 11:07:25', NULL, NULL, NULL, NULL),
(1931, 'Radha Muda', '7075904339', '$2y$10$Rkgr/RWL/mVGWcCx.vPbmO.88OdPhdwxSGM8PWdowaW2Aa5P1vYJi', 'radhamuda123', NULL, 'Hyderabad Secunderabad mallapur Telangana', '0', 8, 0, '7075904339', '8008814915', '2026-02-07 13:26:56', '2026-02-07 13:26:56', NULL, NULL, NULL, NULL),
(1932, 'Navya', '9100368300', '$2y$10$fG/eZMcPARqbGzH2naj.puMtxi5nle3YflNp3DcO77Fwtz7n.w47G', 'navya123', NULL, 'Hyderabad', '0', 8, 0, '9100368300', '8463903541', '2026-02-08 05:47:00', '2026-02-08 05:47:00', NULL, NULL, NULL, NULL),
(1933, 'Ravi chandra', '9866723626', '$2y$10$Uy5lo3rwiB/wgMvwq92HduTNAsXWHsC4OKxkNiJGZp9Pf6wNWKbD2', '123456', NULL, 'Sanathnagar hyd', '0', 8, 0, '9866723626', '9398859163', '2026-02-09 00:29:32', '2026-02-09 00:29:32', NULL, NULL, NULL, NULL),
(1934, 'Nadeem', '9949039939', '$2y$10$nsxp1Eg2Mz/PZ/gj4.X/QOPIhpX0i1MZ.XtSejuXU5B90.EoObLci', '123456', NULL, 'Hyd, sanathnagar', '0', 8, 0, '9949039939', '9398859163', '2026-02-09 01:15:27', '2026-02-09 01:15:27', NULL, NULL, NULL, NULL),
(1935, 'Mujeeb', '8179874573', '$2y$10$AGqVJA0YFQHM4TRDrudCre41wH6lrxhEu2RoqgEdOCRVYvtyqgFuS', '123456', NULL, 'Hyd', '0', 8, 0, '8179874573', '9398859163', '2026-02-09 05:48:37', '2026-02-09 05:48:37', NULL, NULL, NULL, NULL),
(1936, 'Lakshmi sprouts', '9951911321', '$2y$10$Pmy4bH0MkPhBKJFxEkAemeK6fNto333crLahNQfnb8G3CsELGp4OO', '123456', NULL, 'Sanathnagar', '0', 8, 0, '9951911321', '9398859163', '2026-02-09 05:52:31', '2026-02-09 05:52:31', NULL, NULL, NULL, NULL),
(1937, 'Annavaram', '7993971723', '$2y$10$mWLrXeiIi2UPPEls/9frE.Ar7U1iRj/S6/s4lyHbvCpJQGDaBpmLK', 'shabnam', NULL, 'Hyd', '0', 8, 0, '7993971723', '9398859163', '2026-02-09 06:30:15', '2026-02-09 06:30:15', NULL, NULL, NULL, NULL),
(1938, 'C gopal', '8179171615', '$2y$10$/rM3IS2qlZx4htF2MRd7puezGHpprWK82Z3KUVUu.whk57jEYZo0S', '123456', NULL, 'Sanathnagar', '0', 8, 0, '8179171615', '9398859163', '2026-02-09 07:13:56', '2026-02-09 07:13:56', NULL, NULL, NULL, NULL),
(1939, 'Boya surendar', '9912458293', '$2y$10$PcJHoQ8dU3ZQzCTKtKpq8.fdoXaysGq/bfgghLESixwgvRv549M4W', '12345', NULL, 'Hyd', '0', 8, 0, '9912458293', '7286963204', '2026-02-09 07:34:33', '2026-02-09 07:34:33', NULL, NULL, NULL, NULL),
(1940, 'Ramesh  tailor', '8686349744', '$2y$10$NFMlsumljYBXjGl0iFkHEuPgtVx7tzMeAhcN3.LWvtToRxrAePOAK', '123456', NULL, 'Sanathnagar hyd', '0', 8, 0, '8686349744', '9398859163', '2026-02-09 07:50:37', '2026-02-09 07:50:37', NULL, NULL, NULL, NULL),
(1941, 'Mallesh fish', '9392373243', '$2y$10$eSgulOY8bss.AHbsjDUwdeRluvbbSt84MugvCppPbGurbpXPKQlAS', '123456', NULL, 'Sanathnagar hyd', '0', 8, 0, '9392373243', '9398859163', '2026-02-09 07:53:54', '2026-02-09 07:53:54', NULL, NULL, NULL, NULL),
(1942, 'Thallapally lingam', '6301621594', '$2y$10$opGY93uO8cp7UezzskyctOMfay4N0JEUhXfbZdGlwtoxxWTj/cDc2', 'thalla', NULL, 'Hyderabad', '0', 8, 0, '6301621594', '7330748009', '2026-02-09 08:37:42', '2026-02-09 08:37:42', NULL, NULL, NULL, NULL),
(1943, 'A D ARUN', '9849821138', '$2y$10$17mvpAWj5BVS6zDl6nJRIe4lMlVJi/2HH.R39iW48Qh6IfBbVn0na', 'Aarush@123', NULL, 'Moosapet Hyderabad', '0', 8, 0, '9849821138', '8309877417', '2026-02-09 09:32:03', '2026-02-09 09:32:03', NULL, NULL, NULL, NULL),
(1944, 'Ramanjamma', '9912522473', '$2y$10$fGU3FIJhUoDOQt4BTUbpZ.MiTYcepDF/mlGOw39nqQLrCj4NbJIvO', 'ram123', NULL, 'Deverakonda', '0', 8, 0, '9912522473', 'admin', '2026-02-09 09:39:16', '2026-02-09 09:39:16', NULL, NULL, NULL, NULL),
(1945, 'M anji', '8500083261', '$2y$10$KvpUD1rvnHjSl7hX0HKDQ.yeBc.x3CoJNLd5T50w27V6fcLCFYCIG', 'anji123', NULL, 'Deverakonda', '0', 8, 0, '8500083261', 'admin', '2026-02-09 09:42:30', '2026-02-09 09:42:30', NULL, NULL, NULL, NULL),
(1946, 'M anji', '9441219228', '$2y$10$fS47QqwABbHI7dwb.gWkFuFoGoH6j1IoT7I2lVgDFazgY.57oVFxG', 'anji123', NULL, 'Gurramguda', '0', 8, 0, '9441219228', 'admin', '2026-02-09 09:44:51', '2026-02-09 09:44:51', NULL, NULL, NULL, NULL),
(1947, 'Eshwer', '9490038874', '$2y$10$lSr.Sc5BHff3xFO9KpeKm.opSqiV3nDdpycdtcWL7/1GLMMo7CciS', 'eshwer123', NULL, 'Lb nagar', '0', 8, 0, '9490038874', '9441310063', '2026-02-09 09:47:17', '2026-02-09 09:47:17', NULL, NULL, NULL, NULL),
(1948, 'Naveen', '9010144190', '$2y$10$llnE4qZy1txDkvDbSEkYZOCisPa5Uds7aMEMplc8o70IKc0GNsrQq', 'navven123', NULL, 'Rtc cross road', '0', 8, 0, '9010144190', '9441310063', '2026-02-09 09:50:13', '2026-02-09 09:50:13', NULL, NULL, NULL, NULL),
(1949, 'Sunitha Thadula', '9581433404', '$2y$10$OUiajQn1ipF1xyf0RddzkeUR2mcCUvK8DLGDOnDnMXjjAtpprlwbG', '123456', NULL, 'Vinayak nagar', '0', 8, 0, '9581433404', '8106560969', '2026-02-09 09:50:53', '2026-02-09 09:50:53', NULL, NULL, NULL, NULL),
(1950, 'B anji', '9490043354', '$2y$10$hDRyfnjwXX0dopYfagauhOjOLJpNM142eOALCC4vfxjFpc7Ts6qq2', 'anji123', NULL, 'Karmanghnt', '0', 8, 0, '9490043354', '9441310063', '2026-02-09 10:23:30', '2026-02-09 10:23:30', NULL, NULL, NULL, NULL),
(1951, 'Lava kumar', '8499931599', '$2y$10$XkM2xdbSS26t4BZzB10ba.5HvQHnJ1FsI9s2aBA5B.TrrrKo6gk4K', 'lava123', NULL, 'Dilskunager', '0', 8, 0, '8499931599', '8522881144', '2026-03-24 04:03:55', '2026-02-09 10:25:46', NULL, NULL, NULL, NULL),
(1952, 'Srinu b', '9959613142', '$2y$10$UqfWg36kr6.hqH7PfDbzpeXLmMOSBPmExE./j08SAzOItriRICHUG', '3160', NULL, '14-1-209/701 parvath nagar', '0', 8, 0, '9959613142', '9908263153', '2026-02-09 11:16:41', '2026-02-09 11:16:41', NULL, NULL, NULL, NULL),
(1954, 'Mohd nasar', '9346318349', '$2y$10$FbURhCz2poS61CorwltvMOCr0WBpjcVJYvnwBn77ssxLbdm.T1hqC', '123456', NULL, 'Sanathnagar hyd', '0', 8, 0, '9346318349', '9398859163', '2026-02-10 02:41:38', '2026-02-10 02:41:38', NULL, NULL, NULL, NULL),
(1955, 'PARRE RAVI KUMAR', '9912641594', '$2y$10$93N4t/NG42R2sdxX5YG0ReKJV7QmvhUFMVFAfx8ur8yFnidMupB0y', '991264', NULL, 'Aler', '0', 8, 0, '9912641594', '9492350947', '2026-02-10 05:12:00', '2026-02-10 05:12:00', NULL, NULL, NULL, NULL),
(1956, 'P lilly victoriya', '9704089360', '$2y$10$p4.9wvjqST.pqKq50SGg7OuDSwpXcxC.nUszHWxZ2RHA9CEV14LjG', 'lilly@123', NULL, 'Lb nagar', '0', 8, 0, '9704089360', '9908263153', '2026-02-10 06:10:39', '2026-02-10 06:10:39', NULL, NULL, NULL, NULL),
(1957, 'M basu', '9963007720', '$2y$10$fXOJ/dOUrvGsuixRrH0l.urUExoE2kRyRl63yp6yp1Xg7fgPRw9.q', 'basunaik', NULL, '14-1-209/701 paravath nagr', '0', 8, 0, '9963007720', '9908263153', '2026-02-10 08:16:36', '2026-02-10 08:16:36', NULL, NULL, NULL, NULL),
(1958, 'M.saidulu', '8499846877', '$2y$10$219EaTObKbzTitqe4xSakuiWqN.qf58bFz9syFBJ8KCSu.JYF7DqW', '667474', NULL, 'Hyd', '0', 8, 0, '8499846877', '7286963204', '2026-02-10 09:21:58', '2026-02-10 09:21:58', NULL, NULL, NULL, NULL),
(1959, 'P.mallesh', '9133523670', '$2y$10$T8gjWBbrBdEZXR1SdTvdIub4VOxqhNoI1T0KR5.9pWqkKxCQaBh0y', 'malli2001', NULL, 'Hyd', '0', 8, 0, '9133523670', '8499846877', '2026-02-10 09:37:49', '2026-02-10 09:37:49', NULL, NULL, NULL, NULL),
(1960, 'Ganesh nenavath', '7286914603', '$2y$10$Dj0GispUob7vZ5ucZgSk7O3F/xnaiOC6WEc7Su64Y9rmGGB2eqzJK', 'Gani@123', NULL, 'Mannanaur village Amrabad mandal Nagar Kurnool district 509201', '0', 8, 0, '7286914603', '8499846877', '2026-02-10 10:18:01', '2026-02-10 10:18:01', NULL, NULL, NULL, NULL),
(1961, 'Sarayi sujatha', '9866655414', '$2y$10$Y1BlK5PTkWYdOGhDxB7SpuFSkNMUcVY146.Y4yWa7AjpD7ZEP2Se.', '12345', NULL, 'Karnool', '0', 8, 0, '9866655414', '9912458293', '2026-02-10 11:19:35', '2026-02-10 11:19:35', NULL, NULL, NULL, NULL),
(1962, 'Kummari muniswamy', '8523056722', '$2y$10$CgwzZzN4kLVmavHlty83Ou75nm7lou/Yf2SKMBtIicFF/RUiM3gHC', '12345', NULL, 'Karnool', '0', 8, 0, '8523056722', '9912458293', '2026-02-10 11:27:09', '2026-02-10 11:27:09', NULL, NULL, NULL, NULL),
(1963, 'Uppal sanjeevaiah', '9032133450', '$2y$10$C3NIrCaWnpzecdsypT5jM.SuFUnZbbEkA9asfui93raA3swsLN.ge', '12345', NULL, 'Hyd', '0', 8, 0, '9032133450', '9912458293', '2026-02-10 11:29:19', '2026-02-10 11:29:19', NULL, NULL, NULL, NULL),
(1964, 'B.Sandeepkumar', '8341119944', '$2y$10$LcCfLJrbYIsrhaJrGpM8U.Tq7nMFem3fk6QTH.QRrV62BGyYu8xF.', '12345', NULL, 'Hyd', '0', 8, 0, '8341119944', '9912458293', '2026-02-10 11:34:16', '2026-02-10 11:34:16', NULL, NULL, NULL, NULL),
(1965, 'Muthyala krishnamraju', '9989113714', '$2y$10$JyWZGOBtfZwG/Vqww7SqceYemn5Vj1jmNF3yWYX.71LeKS7OwDzr6', 'Krish@1518', NULL, 'Hayathnagar', '0', 8, 0, '9989113714', '9441310063', '2026-02-11 09:23:29', '2026-02-11 09:23:29', NULL, NULL, NULL, NULL),
(1966, 'Gundala naveen', '9963475918', '$2y$10$ExedsDfXsaodgP9cfIwwrOsaUEHv4O4QHhXzTx8HEiygbCgKRpa1y', '9963475918', NULL, 'Nandyala', '0', 8, 0, '9963475918', '9441310063', '2026-02-11 09:24:01', '2026-02-11 09:24:01', NULL, NULL, NULL, NULL),
(1967, 'Vinnu', '9652598045', '$2y$10$bkFj6P2dnjLzjiUftIoXn.EnU1FtULNYHaPraWqSvdrG9Mbgp9cRK', 'hayan', NULL, 'Khishapur', '0', 8, 0, '9652598045', '8019244871', '2026-02-11 10:38:33', '2026-02-11 10:38:33', NULL, NULL, NULL, NULL),
(1968, 'Keerthana', '6301542063', '$2y$10$bJSzkUmY9afCWePY2hFTQuMgZejaZOgbGD/XkoH/ZLXIyf6a3wNge', 'sweety', NULL, 'Soanpet', '0', 8, 0, '6301542063', '8019244871', '2026-02-11 11:11:14', '2026-02-11 11:11:14', NULL, NULL, NULL, NULL),
(1969, 'Renuka', '9966001906', '$2y$10$PhBopu8qy28hCRwMVJ3.vee78sI0UTDL/UEHyr7ws.8BLKXY2nj4m', '123456', NULL, 'Millet cafe', '0', 8, 0, '9966001906', '8639045822', '2026-02-11 16:09:10', '2026-02-11 16:09:10', NULL, NULL, NULL, NULL),
(1970, 'Vijay kumar', '9381655061', '$2y$10$utMVLe5Z4xhDCKBorOmnYeRrozuwI63NK3gLpug0poFEUWsu3NWjy', '8790077', NULL, 'H Y D', '0', 8, 0, '9381655061', '9492350947', '2026-02-12 07:20:30', '2026-02-12 07:20:30', NULL, NULL, NULL, NULL),
(1971, 'B Kavya Reddy', '7416125875', '$2y$10$g7ptROxa8ab8rP.2egYc2.MRmQrLcDwzXDKruWp56BO8obltSyRnm', '123456', NULL, 'Almasguda HYD', '0', 8, 0, '7416125875', '9490643935', '2026-02-12 11:03:52', '2026-02-12 11:03:52', NULL, NULL, NULL, NULL),
(1972, 'G Venkatesh', '8008441845', '$2y$10$.sDWn3KIWRwLwsWC.F25GutWAdxwGM0jtKTk5C7JmHFKW5y/wLv8a', 'Venkatesh@1845', NULL, 'Hyd', '0', 8, 0, '8008441845', '9381655061', '2026-02-13 06:28:18', '2026-02-13 06:28:18', NULL, NULL, NULL, NULL),
(1973, 'A. Rajenderprasad.', '8500761456', '$2y$10$N1MWTxGVHWwDSwop03vmeudrgphbCDMX0ema07ime.9eYX3goXxDu', '123456', NULL, 'Warangal', '0', 8, 0, '8500761456', '9381477148', '2026-02-13 08:53:11', '2026-02-13 08:53:11', NULL, NULL, NULL, NULL),
(1974, 'bhaskarmamidi157@gmail.com', '7396266654', '$2y$10$5dAkCv5ktHVdcLmiyjBkdOqjQtVi3.doI2Vcykbc.VFWAjPp00vpu', '124456', NULL, 'Warangal', '0', 8, 0, '7396266654', '9381477148', '2026-02-13 08:53:54', '2026-02-13 08:53:54', NULL, NULL, NULL, NULL),
(1975, 'P Kalpana', '7013969916', '$2y$10$aPlFE7tJsmUMzjA5AdzFpOr2nf92UTObeckJyLQmqPfpdKujwxO7O', '123456', NULL, 'Hanamkonda', '0', 8, 0, '7013969916', '9390054229', '2026-02-13 11:46:02', '2026-02-13 11:46:02', NULL, NULL, NULL, NULL),
(1976, 'Komaravelly ravikumar', '9573099450', '$2y$10$SNxjU9gqv9Y38omsR1/08.2/Bx3c3ReXRuuK58satgPHS3qr6Dc9e', '9573099450', NULL, 'Shivanagar warangal', '0', 8, 0, '9573099450', '8500761456', '2026-02-14 06:09:16', '2026-02-14 06:09:16', NULL, NULL, NULL, NULL),
(1977, 'K.Rajamani.', '8106257917', '$2y$10$gs4Xag5m8ZlJzqIJ/vU3lOs1NXRetPJZZGXbpd9uNBBVYbdAnJ5NS', '123456', NULL, 'Hanamkonda, Warangal.', '0', 8, 0, '8106257917', '7013969916', '2026-02-14 12:17:44', '2026-02-14 12:17:44', NULL, NULL, NULL, NULL),
(1978, 'Pradeep', '9177407847', '$2y$10$u6nVw1SF.C1oi3LpQqvchu8Kd/JLr9HBU89WIQTXR153qq0lwHH5G', '123456', NULL, 'Hyderabad', '0', 8, 0, '9177407847', '8333077851', '2026-02-15 07:27:47', '2026-02-15 07:27:47', NULL, NULL, NULL, NULL),
(1979, 'Bhargavi', '7702195169', '$2y$10$frNCl1g6cZ9Rnwj/m6wb0ee2UZzj8aDqSKWTMfjYkTZtey7RFi6yi', '123456', NULL, 'Hyderabad', '0', 8, 0, '7702195169', '9866723626', '2026-02-15 16:31:25', '2026-02-15 16:31:25', NULL, NULL, NULL, NULL),
(1980, 'Dr. Jayarama Reddy Kummathi', '9581495766', '$2y$10$9bNHlVtP.DGEHzfHXARTWuo52xn/Uw3DzCP./EEichGEAYAPPr/vy', 'Maithreya6^', NULL, 'Vengalarao Nagar', '41000', 10, 3000, '9581495766', '7702381784', '2026-04-09 17:02:56', '2026-02-16 11:33:04', 'HYDERABAD', 'Hyderabad', 'Telangana', '500038'),
(1981, 'Parvathaiah pathakamuri', '9440231802', '$2y$10$ihqNMm973No56B/Ehtob8eig.0cVbL69Y7.kr/6CPt9SJIQIeytBu', 'lakshminnu', NULL, 'Ameerpet', '0', 8, 0, '9440231802', '9581495766', '2026-02-16 11:38:18', '2026-02-16 11:38:18', NULL, NULL, NULL, NULL),
(1982, 'Sharfuddin', '9154716085', '$2y$10$bevuz.e61g5kwvt5kY5KoON.RXN.KGtJFtUusr3GS0ZOEaB3YV33G', '123456', NULL, 'Motinagar', '0', 8, 0, '9154716085', '9398859163', '2026-02-16 12:13:23', '2026-02-16 12:13:23', NULL, NULL, NULL, NULL),
(1983, 'Kareem  civil', '9441509636', '$2y$10$aIr8FsfFBJtaD4DhknMha.VUIPQu9FXi7idXVFnrEtRNL.GZTrgou', '123456', NULL, 'Balanagar', '0', 8, 0, '9441509636', '9398859163', '2026-02-16 14:44:19', '2026-02-16 14:44:19', NULL, NULL, NULL, NULL),
(1984, 'Sk mastanvali  108 vamsi', '9032270396', '$2y$10$HBBiInJvjApnT7iaopmHDuPhA3AR1peixz7YyIJj.p90frqbASiRy', '123456', NULL, 'Motinagar hyd', '0', 8, 0, '9032270396', '9398859163', '2026-02-16 14:53:52', '2026-02-16 14:53:52', NULL, NULL, NULL, NULL),
(1985, 'Sk Ameeruddin', '7680044435', '$2y$10$0q3gdO0NIMCbS6yPIAyGdON7PalOiF0zi4Kq9W/GjTX8vvcYgbwZe', '123456', NULL, 'Kollur', '0', 8, 0, '7680044435', '9398859163', '2026-02-17 00:19:13', '2026-02-17 00:19:13', NULL, NULL, NULL, NULL),
(1986, 'Md.Ameenuddin', '9293555260', '$2y$10$pPjScRgLH8TbFIVJSDsbXeJn1Me//nmPNMxRYX/qYDUTGlHJeFnSi', '123456', NULL, 'Moosapet hyd', '0', 8, 0, '9293555260', '9398859163', '2026-02-17 00:22:55', '2026-02-17 00:22:55', NULL, NULL, NULL, NULL),
(1987, 'Boya Muniswamy', '9391121603', '$2y$10$bYPgm7KxaKwykb8acNnB7uzN0wY4nUjqVVoVMJ.YnAAOiR9q.ijBq', '12345', NULL, 'Gonegandla', '0', 8, 0, '9391121603', '9912458293', '2026-02-17 06:11:56', '2026-02-17 06:11:56', NULL, NULL, NULL, NULL),
(1988, 'Satyanarayana ramani', '9948440035', '$2y$10$5HwGxjXRqAbnTtGDeefHKuQJoeSfP5378AUpbVOVNElXrjH10NnFC', '123456', NULL, 'Motinagar hyd', '0', 8, 0, '9948440035', '9398859163', '2026-02-17 12:03:50', '2026-02-17 12:03:50', NULL, NULL, NULL, NULL),
(1989, 'P ARUNA KUMARI', '6302025967', '$2y$10$/JaSo4hKNCMbnxSrIUtPEOL.fDNTCjkbiL2rimYAQUqzIKR2flrqe', '123456', NULL, 'Motinagar', '0', 8, 0, '6302025967', '9398859163', '2026-02-23 11:59:12', '2026-02-17 12:05:35', NULL, NULL, NULL, NULL),
(1990, 'P kumari', '9885069069', '$2y$10$54Bmc1P.R5WHx1bg/NbLY.B8cnaB75e9pcSCd4hBKUYd5qOzjqOWW', '123456', NULL, 'Motinagar', '0', 8, 0, '9885069069', '9398859163', '2026-02-17 12:16:51', '2026-02-17 12:16:51', NULL, NULL, NULL, NULL),
(1991, 'Bhavani', '7416748003', '$2y$10$V1JBh72vLuKfoDmVBKgMRu2jD.QiB.42Dky6guoR4HhmkhjGAN5XO', '12345678', NULL, 'Kln reddy colony', '0', 8, 0, '7416748003', '7013969916', '2026-02-18 03:05:22', '2026-02-18 03:05:22', NULL, NULL, NULL, NULL),
(1992, 'Kishore', '9030169462', '$2y$10$X23DwmZe1hNVMriqlGlNc.UomcS/1ctzKEX4TpkLs7oZBrzO3k.4a', 'Svkishore@1234', NULL, 'Hyderabad', '0', 8, 0, '9030169462', '8639045822', '2026-02-18 05:41:51', '2026-02-18 05:41:51', NULL, NULL, NULL, NULL),
(1993, 'Karthik, cnc hal', '8985257831', '$2y$10$wr4wEJa47wgNGNxIa9PKqu6SmjtVaXATsbuMAB.IeWMgDMsTh2Xja', '123456', NULL, 'Balanagar , hyd', '0', 8, 0, '8985257831', '9398859163', '2026-02-19 08:00:22', '2026-02-19 08:00:22', NULL, NULL, NULL, NULL),
(1994, 'Hanumanth', '7675967258', '$2y$10$e8E4ZmC4xHuamyT2DWpm6O3H30q5bJdCAoW/HIgt4RwBuV6eOeVn2', '12345', NULL, 'Hyd', '0', 8, 0, '7675967258', '9948691781', '2026-02-19 10:34:09', '2026-02-19 10:34:09', NULL, NULL, NULL, NULL),
(1995, 'K. Narender reddy', '9912643732', '$2y$10$GP/a5Eo2j.hRuUKvVqV/K.rTR9AMdrRxNmL5oFWB0HTQhRnshq9G2', '123456', NULL, 'Gajwel', '0', 8, 0, '9912643732', '9885045327', '2026-02-20 09:50:43', '2026-02-20 09:50:43', NULL, NULL, NULL, NULL),
(1996, 'Harika', '8331803248', '$2y$10$m0qdo6qZPhJE/tKbyodHr.GtweFnJLA3zekMEjY1WVZJTSv2q.Wgi', '12345', NULL, 'Alwal', '0', 8, 0, '8331803248', '7330748009', '2026-02-20 11:35:50', '2026-02-20 11:35:50', NULL, NULL, NULL, NULL),
(1997, 'M.R.Vinod Kumar', '8019272391', '$2y$10$ssjtlhKOxOADfbzNHldo/uRBj9LtCL.Y1dutcuvGUAm2z3E1GYqXC', '12345', NULL, 'Hyderabad', '0', 8, 0, '8019272391', '7330748009', '2026-02-20 11:39:29', '2026-02-20 11:39:29', NULL, NULL, NULL, NULL),
(1998, 'JAYALAKSHMI', '9866918009', '$2y$10$kVgg1dShQSjWkLXNTCq1uOanZWEPJHRT.3AZzb3KDDxu1ve1GAYDe', 'honey', NULL, 'Krupa complex Safilguda', '0', 8, 0, '9866918009', '8106560969', '2026-03-04 15:46:39', '2026-02-20 14:52:29', NULL, NULL, NULL, NULL),
(1999, 'Aruna', '7702485136', '$2y$10$GD0x6EDHCrAaXeLYpnueQOBT899Y3ideg/KrfTnYo94qufyMx8Xey', 'Aruna@123', NULL, 'Namalgudu', '3000', 8, 3000, '7702485136', '7330748009', '2026-03-12 15:34:23', '2026-02-21 02:14:07', 'NAMALAGUNDU', 'Hyderabad', 'Telangana', '500061'),
(2000, 'R GOPALA KRISHNA', '9908089999', '$2y$10$2zH3ZYfz0i9p5qRJa3BrY.ryBum0TsaGq62C9mZ2ODKs2OFn2EU.K', 'dHINAKAR1@', NULL, 'HYDERABAD', '3121', 8, 3021, '9908089999', '8522881144', '2026-03-24 04:03:00', '2026-02-21 06:27:39', NULL, NULL, NULL, NULL),
(2001, 'Prasadh', '9392469424', '$2y$10$roNdiuU7ShsiYCtueqIBuuWwaheMEvlWSD8aqf4x5b/yl4D2bpkPe', '123456', NULL, 'ECIL', '0', 8, 0, '9392469424', '8522881144', '2026-02-21 06:37:48', '2026-02-21 06:37:48', NULL, NULL, NULL, NULL),
(2002, 'Md shafi', '7780574944', '$2y$10$6qwwWNoyJ7h8ETZz/UTtX.vwFernI6vJqdLJgGTPQ9hu4I4XKdffe', 'MDsh123@#', NULL, 'Hyderabad', '0', 8, 0, '7780574944', '7702381784', '2026-02-21 07:25:34', '2026-02-21 07:25:34', NULL, NULL, NULL, NULL),
(2003, 'Orsu Ranjith Kumar', '7993537229', '$2y$10$D26lL5FfJjlJ9P0lUcpjyODJi9ne/Bsb5kkaSNMye5nixvlO8OjCi', 'ranjith$143', NULL, 'Uppal narapally', '0', 8, 0, '7993537229', '7702381784', '2026-02-21 07:38:20', '2026-02-21 07:38:20', NULL, NULL, NULL, NULL),
(2004, 'Ganta lakshmi', '9502941829', '$2y$10$YTZGshyP9o0wKOBXzhFS8eGfmU7ABomJMamDIB2vCP5/FEmiF/tx.', '123456', NULL, 'Kalyan nagar  motinagar, hyd', '0', 8, 0, '9502941829', '9398859163', '2026-02-21 07:42:47', '2026-02-21 07:42:47', NULL, NULL, NULL, NULL),
(2005, 'Punyavati', '7893709190', '$2y$10$KZ1.7Unl/uKs/BdE36leEu7FpIPpeYLbbp62gh49Jeh3CEMGOUPtS', '123456', NULL, 'Patancheru hyd', '0', 8, 0, '7893709190', '9398859163', '2026-02-21 07:53:17', '2026-02-21 07:53:17', NULL, NULL, NULL, NULL),
(2006, 'Musthaq Ahmed', '9391680678', '$2y$10$ZkFuRJY9S2DlJQukbC8uN.vZ8iqf9UhS3omoCoszNJz3iDDapACLS', '123456', NULL, 'Erragadda hyd', '0', 8, 0, '9391680678', '9398859163', '2026-02-21 13:31:24', '2026-02-21 13:31:24', NULL, NULL, NULL, NULL),
(2007, 'Syed Pasha', '9949912266', '$2y$10$YLlaBxj2prJo7a9T98M0R.oyGakojOpNc/Tgyra5i5ci4z760YkLu', 'Pasha@2266', NULL, 'Dilsukhnagar', '0', 8, 0, '9949912266', '7702381784', '2026-02-21 15:28:35', '2026-02-21 15:28:35', NULL, NULL, NULL, NULL),
(2008, 'Ch Srinivasulu', '8686350800', '$2y$10$Zjz7rg4sSw0t8fseNZwOWufXhkw9Z1uOKmk0K8b2yW6fmw63hypXO', '3863', NULL, 'నెల్లూరు', '0', 8, 0, '8686350800', '7702381784', '2026-02-22 05:05:17', '2026-02-22 05:05:17', NULL, NULL, NULL, NULL),
(2009, 'RAVI RAJANI', '7702222510', '$2y$10$BmVf9gPSFA6W3a7J9uobSeZ1MSZHVD4IkLFWWCBqQNxs4azjnkEt6', '123456', NULL, 'HYDERABAD', '0', 8, 0, '7702222510', '7702485136', '2026-02-23 10:26:58', '2026-02-23 10:26:58', NULL, NULL, NULL, NULL),
(2010, 'J Manjula', '9347433969', '$2y$10$iW2Uq/CF215rPPow1KnoH.pSb/b1WyPQVqHTlIHo8brzG5q6D.WDu', '123456', NULL, 'LB Nagar Hyderabad', '0', 8, 0, '9347433969', '7702485136', '2026-02-23 10:57:53', '2026-02-23 10:57:53', NULL, NULL, NULL, NULL),
(2011, 'Shoukath sb madarsa', '9949033790', '$2y$10$rcnCQULatGvv8i3nvY7Df.sfGApd4HQjNTOAqjNCAATpKe0xA8852', '123456', NULL, 'Balanagar , hyd', '0', 8, 0, '9949033790', '9398859163', '2026-02-25 08:01:13', '2026-02-25 08:01:13', NULL, NULL, NULL, NULL),
(2012, 'Syed hussain', '9346896672', '$2y$10$5nMJ.c3Tu0FoOsrbzqDUEuD8WaLooUfL/pvGZ/T/J4BOINmnSrSJy', '123456', NULL, 'Chintal HYD', '0', 8, 0, '9346896672', '9398859163', '2026-02-25 08:05:31', '2026-02-25 08:05:31', NULL, NULL, NULL, NULL),
(2013, 'B VIJAYA LAKSHMI', '9704216044', '$2y$10$4blAsJyQhifyju0dQpTLTuXVuSwh/hTOtbX.c07Q7Sy0Rs/Zdn5hq', '123456', NULL, 'BOLLARAM HYD', '0', 8, 0, '9704216044', '7702485136', '2026-02-25 09:18:30', '2026-02-25 09:18:30', NULL, NULL, NULL, NULL),
(2014, 'IPPA NARESH', '9490684656', '$2y$10$s.IER5r0dtvVzxFO3vKjTuZhwuP6Q6iq6QPy0jifqHBpnEt7JdjKO', '12345', NULL, 'Hyderabad', '0', 8, 0, '9490684656', '9032133450', '2026-02-25 17:14:32', '2026-02-25 17:14:32', NULL, NULL, NULL, NULL),
(2015, 'Domala Srinivasu', '9618112829', '$2y$10$QKCxVNwT8cTY5TPTz0xkXeez5eldMUv3uv2LOuxvpgxd90MsZtB1a', '123456', NULL, 'Hyderabad', '0', 8, 0, '9618112829', '9177871094', '2026-02-26 12:27:39', '2026-02-26 12:27:39', NULL, NULL, NULL, NULL),
(2016, 'Ganga sunithi', '6301968212', '$2y$10$ewZaWvTuVMBF8MniYR5zIOcAFdvm4zrzJTYVT54BIETTzRriV2mym', '123456', NULL, 'BHEL', '0', 8, 0, '6301968212', '9177871094', '2026-02-26 12:30:27', '2026-02-26 12:30:27', NULL, NULL, NULL, NULL),
(2017, 'Khaja bee', '6281855479', '$2y$10$DVt61wW8CtpiaLR3V3UhFemxKrkbZv2Fw9Xi0iynAfn/VsHLQgUrS', '123456', NULL, 'Hyderabad', '0', 8, 0, '6281855479', '9177871094', '2026-02-26 13:08:08', '2026-02-26 13:08:08', NULL, NULL, NULL, NULL),
(2018, 'D THIRUMALA', '6281593781', '$2y$10$GBfH1yVfPqjiTHoM72qgoOZJjaXeimMkQnqUGJCxFX1wRsTVXHXhO', '123456', NULL, 'HABSIGUDA HYD', '0', 8, 0, '6281593781', '7702485136', '2026-02-27 08:18:14', '2026-02-27 08:18:14', NULL, NULL, NULL, NULL),
(2019, 'Murali Krishna Kishore N', '9043632463', '$2y$10$mb4PbFqONAjkiSP35eiUpe08hryeGlRg/6nLcEq4PMjwOPAIY22AO', 'Dattha@2026', NULL, 'Hyderabad', '3000', 8, 0, '9043632463', '8341257474', '2026-03-04 05:23:11', '2026-02-27 12:57:24', NULL, NULL, NULL, NULL),
(2020, 'G.Subakta.', '8341390867', '$2y$10$ihxJX7Vyp1xG3AbZWrTAMeYFxHSGfBXkU8XNNX3MrXNjuRSl2t1F6', '12345', NULL, 'Gopalpur, Hanamkonda, Warangal.', '0', 8, 0, '8341390867', '7013969916', '2026-02-27 13:51:51', '2026-02-27 13:51:51', NULL, NULL, NULL, NULL),
(2021, 'GUGULOTHU MOTHILAL', '8186843821', '$2y$10$U2/mtAQicrIHrI9e1/MoJuCmM6Iq30aQC6pgIC7ZTUKkvtGOZexAi', '123456', NULL, 'Telangana , kodada', '0', 8, 0, '8186843821', '8187021297', '2026-03-02 10:03:22', '2026-03-02 10:03:22', NULL, NULL, NULL, NULL),
(2022, 'G SRINIVAS', '9553683015', '$2y$10$yslgYNCPth0Ugk9MkCAPcuRbsSTI.vjs0ODgsINGuPe0QZKqzWvpq', '123456', NULL, 'UPPAL HYDERABAD', '0', 8, 0, '9553683015', '7702485136', '2026-03-02 14:47:27', '2026-03-02 14:47:27', NULL, NULL, NULL, NULL),
(2023, 'Jala Rani', '6302434485', '$2y$10$E3cb4qQQI94numwIKBFCy.Y3BRyRUBsr7L39z3H8Su5u4CHy1J3OK', 'Rani@1993', NULL, 'Uppal', '0', 8, 0, '6302434485', '9553683015', '2026-03-02 16:29:12', '2026-03-02 16:29:12', NULL, NULL, NULL, NULL),
(2024, 'Kolakanishivakrishna', '9010983124', '$2y$10$Ij/wAJPaOLvSvVeMWoaQzOYH4Z6d7McJmnzefW2WlZqq6zHsQYe4u', 'Shiva@9010', NULL, 'Uppal', '0', 8, 0, '9010983124', '9553683015', '2026-03-02 22:38:08', '2026-03-02 22:38:08', NULL, NULL, NULL, NULL),
(2025, 'Saibaba   nagarjuna school', '9908141988', '$2y$10$YO8.RepeEbY/1NnKlaTON.LrIaiHD/08LqG5B3/qoOjKveTARzkGy', '123456', NULL, 'S r nagar , hyd', '0', 8, 0, '9908141988', '9398859163', '2026-03-03 04:59:34', '2026-03-03 04:59:34', NULL, NULL, NULL, NULL),
(2026, 'Shiva  esi bkpet', '9948131763', '$2y$10$ymPfL2LYKefC.ybX2vwoN.drrvXo.FT3A65Qdfe2KmGiVUJ4T57.2', '123456', NULL, 'Esi  bkpet , hyd', '0', 8, 0, '9948131763', '9398859163', '2026-03-03 05:22:54', '2026-03-03 05:22:54', NULL, NULL, NULL, NULL),
(2027, 'Bhuvana  vijaya diagno ameerpe', '8143274560', '$2y$10$DMKkeT1hVHn9hJ.jw1Wr7uBYKGdJaBivTThjXsjSPiVh58CYqQa8m', '123456', NULL, 'Ameerpet , hyd', '0', 8, 0, '8143274560', '9398859163', '2026-03-03 09:01:36', '2026-03-03 09:01:36', NULL, NULL, NULL, NULL),
(2028, 'M.Bhargavi', '8099941341', '$2y$10$c4D0OhMwgwalURtHRoQ6kuBeI2OmjwtDmN0IYLN0Lo.gvk92SfFCK', 'sai@2005', NULL, 'Hyderabad', '0', 8, 0, '8099941341', '9866723626', '2026-03-04 05:17:00', '2026-03-04 05:17:00', NULL, NULL, NULL, NULL),
(2029, 'Banoth Suresh', '9381510366', '$2y$10$BhY2fGuGFaKdh4mHXUltlOJp6IC097E4i2dPjznpOCrKn6cv70C3.', 'Banith123', NULL, 'Maithrivanam', '0', 8, 0, '9381510366', '7330748009', '2026-03-04 10:13:31', '2026-03-04 10:13:31', NULL, NULL, NULL, NULL),
(2030, 'Dr.Kanchana Laxmi', '9959236170', '$2y$10$lKL/p4LiQoi3cgLfHYO9QOMlDyqq5V2vdmgDjK66XKwxwRIRpVN1W', 'HarinI@2211', NULL, 'Hyderabad', '1000', 8, 0, '9959236170', '8639974381', '2026-03-04 13:20:12', '2026-03-04 13:06:05', NULL, NULL, NULL, NULL),
(2031, 'Neelufar', '9032407934', '$2y$10$SPu4KR2O4qjQI22kf9E8zOUAw9l5Zb0L1D0.SSLJjkhAiC4MO.ADy', '123456', NULL, 'Vinayak nagar', '0', 8, 0, '9032407934', '8106560969', '2026-03-05 07:23:41', '2026-03-05 07:23:41', NULL, NULL, NULL, NULL),
(2032, 'Mahadevi', '7013534426', '$2y$10$ZEolMQNxYSz3AdFpGmf1qeHrPr.qXAfQjDXh2PbTA45ZjHlAAyO22', '123456', NULL, 'Vinayak nagar', '0', 8, 0, '7013534426', '8106560969', '2026-03-05 07:25:10', '2026-03-05 07:25:10', NULL, NULL, NULL, NULL),
(2033, 'Sandhya', '9010171500', '$2y$10$uWD9.nJwWAWU1Uz4tmFp4eil2KQ0b8SuZbsF5qzIXhths5eU47COO', '123456', NULL, 'Vinayak nagar', '0', 8, 0, '9010171500', '8106560969', '2026-03-05 07:27:12', '2026-03-05 07:27:12', NULL, NULL, NULL, NULL),
(2034, 'Srilatha', '8341504869', '$2y$10$0bQBxv9e7o7AzaKh8osWcOGLhLtJfZfm5VnJnIhtazWqbjqpU1TAi', '123456', NULL, 'Hyderabad', '0', 8, 0, '8341504869', '9182252656', '2026-03-05 08:06:46', '2026-03-05 08:06:46', NULL, NULL, NULL, NULL),
(2035, 'S Manohar', '9100055185', '$2y$10$EQTnoGeIKmzYTZdqZbZvuOzLnWeSiteU2NMUf1kCeBSiSgHRhw4XO', 'Manu@143', NULL, 'Bowrampet', '0', 8, 0, '9100055185', '8008814915', '2026-03-06 07:44:19', '2026-03-06 07:44:19', NULL, NULL, NULL, NULL),
(2036, 'B v subbarao, 4 th , czech', '9440136054', '$2y$10$RpKigXWCKQcSg8dQBRIF4egItwslbxOQO1D1OVMNAQ7/zvGs1tXGW', '123456', NULL, 'Sanathnagar hyd', '0', 8, 0, '9440136054', '9398859163', '2026-03-06 09:56:29', '2026-03-06 09:56:29', NULL, NULL, NULL, NULL),
(2037, 'Suresh bapanapalli', '8886338867', '$2y$10$c.adTnwvSzz0RVlR5BHLl.fVKMgyuQwQrsm6xD.lYP7ro4os86z0W', '123456', NULL, 'Kphb hyd', '0', 8, 0, '8886338867', '9398859163', '2026-03-06 10:07:31', '2026-03-06 10:07:31', NULL, NULL, NULL, NULL),
(2038, 'Harika', '8374392766', '$2y$10$qqHbu3IVs4PRTSBoJypOxe/nqY8BQqKL5ENUzc8tRavQ3xSlKx7Yi', '123456', NULL, 'Vinakaya nagar', '0', 8, 0, '8374392766', '9182252656', '2026-03-07 07:40:28', '2026-03-07 07:40:28', NULL, NULL, NULL, NULL),
(2039, 'Mahender Barigela', '8374940601', '$2y$10$gX9HAq1bJewC8epvSCjzZO2nr4mvIc1dO3fweDGYFsIKJP5y48yhm', 'Ammanaanna@5', NULL, 'Hyderabad', '0', 8, 0, '8374940601', '8639974381', '2026-03-07 10:06:18', '2026-03-07 10:06:18', NULL, NULL, NULL, NULL),
(2040, 'Chari   esi klnpark', '9849178956', '$2y$10$1iniYzST4R.FvnZmLiJPTu7nJ7u/SWsk4DST5qrgZH0UY8QCm20cu', '123456', NULL, 'Sanathnagar hyd', '0', 8, 0, '9849178956', '9398859163', '2026-03-07 16:33:46', '2026-03-07 16:33:46', NULL, NULL, NULL, NULL),
(2041, 'Sahu klnpark( s r nagar)', '7075857839', '$2y$10$o57V7XeJ862UiQZreilkN.esYxWbmRHm7rXwpD8MC6XsCfUPTodby', '123456', NULL, 'S r nagar , hyd', '0', 8, 0, '7075857839', '9398859163', '2026-03-08 05:40:26', '2026-03-08 05:40:26', NULL, NULL, NULL, NULL),
(2042, 'Saakshi&srinivasrao bkguda', '9014508555', '$2y$10$9Xq/GUR8QvByIaFs.dXZo.tTr28lp.oUX80lC4CztxnzmLU3DwiXG', 'shabnam', NULL, 'B k guda , hyd', '0', 8, 0, '9014508555', '9398859163', '2026-03-08 05:47:13', '2026-03-08 05:47:13', NULL, NULL, NULL, NULL),
(2043, 'Srinivasrao beramguda', '9848720006', '$2y$10$7/BQ5xStUAyj1JkSh20IKuTkFI8hTLdOAWvanW8w6K7aiiEQxOsSy', 'shabnam', NULL, 'Beeram guda , hyd', '0', 8, 0, '9848720006', '9398859163', '2026-03-08 05:48:52', '2026-03-08 05:48:52', NULL, NULL, NULL, NULL),
(2044, 'Ravi Sridhar', '7093107940', '$2y$10$kXU33Qx3keKC01pc5gdexO3xswlXQHtDiq7TQeJKsD7veu6dciTy.', '123456', NULL, 'Hyderabad', '0', 8, 0, '7093107940', '7702222510', '2026-03-08 11:55:50', '2026-03-08 11:55:50', NULL, NULL, NULL, NULL),
(2045, 'B Kavitha', '9603863342', '$2y$10$py1/4N17dU0BtOwtjIlUb.yO0STjsmlaffL2zeYkKkhqCH2RkxyVG', '123456', NULL, 'Hyderabad', '0', 8, 0, '9603863342', '7702485136', '2026-03-08 12:49:58', '2026-03-08 12:49:58', NULL, NULL, NULL, NULL),
(2046, 'Ravi Ganesh', '8686249088', '$2y$10$cdR6MY8vBO9UutWdlIfcP.s0nP3GETf3VP2cr9tfzDLJ4/ugJj0V2', '123456', NULL, 'Hyderabad', '0', 8, 0, '8686249088', '7702222510', '2026-03-09 10:50:19', '2026-03-09 10:50:19', NULL, NULL, NULL, NULL),
(2047, 'korrasrinivas1987@gmail.com', '7702723846', '$2y$10$2KZISspLLJYzWna426VUn.QJ0KS/P1qrVgYaHlv0qKGI.xsxPWW.K', '112233', NULL, 'Lb nagar', '0', 8, 0, '7702723846', '7702381784', '2026-03-09 12:47:40', '2026-03-09 12:47:40', NULL, NULL, NULL, NULL),
(2048, 'P SRINIVASA RAO', '9676576596', '$2y$10$ovJcVfgqgHAnPyZTQ4jQk.0fg0K2j402tqwHCRo9fyeQiqPJDT2Xa', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9676576596', '9052658798', '2026-03-09 15:15:32', '2026-03-09 15:15:32', NULL, NULL, NULL, NULL),
(2049, 'P SWAMY', '9397084699', '$2y$10$TEbALWUHUXPOFVN4z4QrXeJR5jm3Ebknz59x8VUV51FzU06Jfz22e', '123456', NULL, 'CHANDANAGAR HYD', '0', 8, 0, '9397084699', '9052658798', '2026-03-09 15:16:37', '2026-03-09 15:16:37', NULL, NULL, NULL, NULL),
(2050, 'P SIVATEJA', '7337373522', '$2y$10$8uT05IiNZAab10QDdt9GzuaPc9Cr0lSLvduDByxIS17L2JKPpeS2m', '123456', NULL, 'CHANDANAGAR HYD', '0', 8, 0, '7337373522', '9052658798', '2026-03-09 15:17:17', '2026-03-09 15:17:17', NULL, NULL, NULL, NULL),
(2051, 'U.S.V.SRINIVAS', '9701340877', '$2y$10$a5PQFCj9kt02cJ0cUSQAuujOWPZqjMCcnprWV6iVkDioBibSJUJ3a', '1965', NULL, 'Begumpeta..', '0', 8, 0, '9701340877', '7330748009', '2026-03-10 07:05:34', '2026-03-10 07:05:34', NULL, NULL, NULL, NULL),
(2052, 'Sheik Mastan Shaakier', '8178973971', '$2y$10$3bOEGCOFAMxmlefoZ3XAfuwc2OXe3v6V/ZQHtNXoEvPY6PdiZ/G1m', '1653Mastan$!', NULL, 'Telangana', '1000', 8, 0, '8178973971', '8639974381', '2026-03-13 16:12:13', '2026-03-10 13:03:51', NULL, NULL, NULL, NULL);
INSERT INTO `service_users` (`service_id`, `member_name`, `member_phone`, `password`, `open_password`, `user_profile_pic`, `location`, `cumulative_gross`, `commission_percentage`, `back_two_back_balance`, `referral_id`, `referral_by`, `created_at`, `joined_date`, `address`, `city`, `state`, `pincode`) VALUES
(2053, 'Lalitha', '9059129224', '$2y$10$Ld2SEoSOn6WUeoHpZbVxk.XZGpU8LRBadYh4VpK6MjJpaIKxe1gBO', 'lalitha@123', NULL, 'Hyderabad', '0', 8, 0, '9059129224', '8639974381', '2026-03-10 14:23:59', '2026-03-10 14:02:19', NULL, NULL, NULL, NULL),
(2054, 'Amrutha Reddy', '9347946485', '$2y$10$pM/gxueIAcxkmgJt5SiZU.noQeELnyPK8uYqfkRldc8/395kJKAtO', '574556', NULL, 'Vengalarao Nagar', '38000', 10, 38000, '9347946485', '9581495766', '2026-04-10 04:03:10', '2026-03-12 08:02:22', 'HYDERABAD', 'Hyderabad', 'Telangana', '500038'),
(2055, 'Ammulu', '6309273826', '$2y$10$3kFwrz2MPLOM8OQx3b7mhuz2TOJVz4TsCbsnW9CYUndfE/DpS9mVS', 'Ammulu@1985', NULL, 'Hyderabad', '0', 8, 0, '6309273826', '7702485136', '2026-03-12 12:20:06', '2026-03-12 12:20:06', NULL, NULL, NULL, NULL),
(2056, 'RVS SHOPPING & MARKETING', '9959831330', '$2y$10$xcm83/uHunTVONEBnzJG3uOslKtIPv8TcreZHZ3kigezHHXL/lPhq', '123124', NULL, 'NIZAMABAD', '0', 8, 0, '9959831330', '9121795272', '2026-03-14 06:33:18', '2026-03-14 06:03:26', NULL, NULL, NULL, NULL),
(2057, 'Srinivas', '7794085705', '$2y$10$b5pdlEO5TZV5xxuGdVBF0.n6KqVHUUFPDDklyIaKJNgd1jqmlvTYy', 'Password@22', NULL, 'HYDERABAD', '0', 8, 0, '7794085705', '9912411055', '2026-03-14 14:32:34', '2026-03-14 14:32:34', NULL, NULL, NULL, NULL),
(2058, 'Mahesh', '7672004551', '$2y$10$fL/eVow2h8kUPNyJum/kdOuB30.eHFJDpkLC1rHkwKfb5diDgbsMG', 'Stalin@123', NULL, 'Shamshabad', '0', 8, 0, '7672004551', '9912411055', '2026-03-14 14:56:27', '2026-03-14 14:56:27', NULL, NULL, NULL, NULL),
(2059, 'sadhyarani.3456@gmail.com', '9177578433', '$2y$10$7FtAOjXtVVMGJz5BRXWiyuL.pC/sSTSAHZv.luCNj4HjlcZK8w2iK', 'sandhya', NULL, '1-5-83/94 budvel   teacher colony ranjedranagar', '0', 8, 0, '9177578433', '9912411055', '2026-03-14 16:11:21', '2026-03-14 16:11:21', NULL, NULL, NULL, NULL),
(2062, 'Arra vinod kumar', '7013058445', '$2y$10$d0fW2sXsDJCYcjcEeN7W.eld3ZIBrulVFTqEXBb7XLx6Q524oo7/W', '020779', NULL, 'Reddy colony Rajmohalla', '0', 8, 0, '7013058445', '7330748009', '2026-03-17 07:38:08', '2026-03-17 07:38:08', NULL, NULL, NULL, NULL),
(2063, 'Vishal kumar', '8520914141', '$2y$10$zZIiTIvE9OBUuFJf98hz8elaOIioWOQkzcD4bXDK9nq2Qh7MIiiKi', '93905538', NULL, 'Nizamabad', '0', 8, 0, '8520914141', '9959831330', '2026-03-17 07:42:33', '2026-03-17 07:42:33', NULL, NULL, NULL, NULL),
(2064, 'Nagendra Prasad', '8096940464', '$2y$10$lIMOlevfSXWUHnAGIORhIefEZ//IIfcFHkVUSlvVEuDUiAKOpCr9O', 'nagendra40464', NULL, 'Kadapa', '0', 8, 0, '8096940464', '9959831330', '2026-03-17 09:20:25', '2026-03-17 09:20:25', NULL, NULL, NULL, NULL),
(2065, 'SHILPA REDDY', '6305494794', '$2y$10$fzQbIfNRInkx8WdjGuhXL.U.gX/JyWAGjv0q2o7rfdDyRMo2xdUXO', 'Marshal7', NULL, 'Hyderabad', '0', 8, 0, '6305494794', '9912411055', '2026-03-17 09:41:51', '2026-03-17 09:41:51', NULL, NULL, NULL, NULL),
(2066, 'mysari srinivas', '9515949700', '$2y$10$eRlhh0zTRe7ZDfg.EP4oO.NzYLtX1IxZqxAbxboIW/JVfJma82KUe', 'SHRINIWAS', NULL, 'ramanthapur', '0', 8, 0, '9515949700', '8639974381', '2026-03-17 10:59:20', '2026-03-17 10:59:20', NULL, NULL, NULL, NULL),
(2067, 'B Manish', '9550272931', '$2y$10$SIZXugfBQA6JK9cg0ruZQ.CDReM1AQ5f8rvwg9kxBLQGEvIwVFkHS', '2004@mjain', NULL, 'Hyderabad, Telangana, India', '0', 8, 0, '9550272931', '9951552424', '2026-03-19 04:33:11', '2026-03-17 11:21:10', NULL, NULL, NULL, NULL),
(2068, 'Dasari Sampath Reddy', '9951919711', '$2y$10$eYdvFunP4gt7D/C3DpEJm.B4ViqjwU1nG7WhgOF2HiPWtLe22x0uS', '329329', NULL, 'Hyderabad', '0', 8, 0, '9951919711', '9959831330', '2026-03-17 11:31:09', '2026-03-17 11:31:09', NULL, NULL, NULL, NULL),
(2069, 'Mamidi Aravind', '9700107053', '$2y$10$0cd.kdyF5CWODN.9/KlJB.7q9TpLI9qJ7jdnq/4xabkjrmYuyaAjq', 'Mamidi@1996', NULL, 'Lb Nagar', '0', 8, 0, '9700107053', '8639974381', '2026-03-18 07:48:59', '2026-03-18 07:48:59', NULL, NULL, NULL, NULL),
(2070, 'M Venkateshwr Rao', '7989454123', '$2y$10$6qrBD4LAzECTK8tf4hf02.3iehkcOUPbUblOpFX3qF2fHRVQKBVq6', '123456', NULL, 'Saket kapra Hyderabad', '0', 8, 0, '7989454123', '8333077851', '2026-03-18 07:57:21', '2026-03-18 07:57:21', NULL, NULL, NULL, NULL),
(2071, 'Rajendar Narra', '9963687846', '$2y$10$8B.Z8zDnUKRdpOvZogT3mu8ktV/9thCweQ3NqjpfEQlZo.Fd7LEde', '123124', NULL, 'Nalgonda', '0', 8, 0, '9963687846', '9959831330', '2026-03-19 15:15:23', '2026-03-19 15:15:23', NULL, NULL, NULL, NULL),
(2072, 'Venkat Allanki', '7989367438', '$2y$10$CW.3dh1WDpOHp0DewC.8pe5gph6sS03adXRGu3y617nAcFrBRlVc6', '@Venkat1', 'assets/user_assets/images/69bd5f896b2a4.1000592594.jpg', 'ECIL', '0', 8, 0, '7989367438', '7702381784', '2026-03-24 04:01:39', '2026-03-20 12:11:13', NULL, 'Hyderabad', 'Telangana', '500056'),
(2073, 'LADDIPALLY ANNAPURNA', '9014744873', '$2y$10$FlND/sG3OBdVTKpixH7dDOml42GPBOq6qTgeFS.7AAm8b2AiJ94pi', '123456', NULL, 'Keesara', '0', 8, 0, '9014744873', '6281625195', '2026-03-21 07:22:21', '2026-03-21 07:22:21', NULL, NULL, NULL, NULL),
(2074, 'KALLEM LAXMI', '8523009180', '$2y$10$Pr/.KrKg9050furTOol6L.co7Pr2kqpFmPo1APvy88gJoRU.H7aGi', '123456', NULL, 'THOKKAPUR', '0', 8, 0, '8523009180', '6281625195', '2026-03-21 07:23:44', '2026-03-21 07:23:44', NULL, NULL, NULL, NULL),
(2075, 'PATHI SRINIVAS', '7989689293', '$2y$10$1.bLoH1HcrxtPVAZGG3a/OeosllAD4ozcK1aUSTK0sCqIXeEtfJ6.', '123456', NULL, 'KONDAMADUGU V,BB NAGER M, YADADRI D.', '0', 8, 0, '7989689293', '6281625195', '2026-03-21 08:19:06', '2026-03-21 08:19:06', NULL, NULL, NULL, NULL),
(2076, 'PATHI GOURAMMA', '6303338331', '$2y$10$IDedTYKuuW4U7SfvLiPpX.H9aGY6oGlYcYfps.oyS7vJ0leTHphGy', '123456', NULL, 'JAMEELAPET V,BB NAGER M, YADADRI D.', '0', 8, 0, '6303338331', '6281625195', '2026-03-21 08:56:28', '2026-03-21 08:56:28', NULL, NULL, NULL, NULL),
(2077, 'PATHI GANGAMMA', '8328171328', '$2y$10$T/lBkP3lxu.pBBGHhfqvbeP2L4G/WfX8WiVjDrNXZvMhkgcwi56Nm', '123456', NULL, 'KONDAMADUGU V,BB NAGER M, YADADRI D.', '0', 8, 0, '8328171328', '6281625195', '2026-03-21 08:57:34', '2026-03-21 08:57:34', NULL, NULL, NULL, NULL),
(2078, 'MIRYALA SWAPNA', '9949508521', '$2y$10$M/UYq180wuD8G5iTi9ltN.4s4l83JjBVLTzjB63dE3WgjnNiw7u5e', '123456', NULL, 'PILAIPALLY M, POCHAMPALLY M, YADADRI D.', '0', 8, 0, '9949508521', '6281625195', '2026-03-21 09:00:16', '2026-03-21 09:00:16', NULL, NULL, NULL, NULL),
(2079, 'MEKALA ANURADHA', '8074899471', '$2y$10$IVDFQENRdb7Eawqn9I6ekegIRVG/BF2XuqB..UIZBEBoJTQMM3WmW', '123456', NULL, 'RAIGIRI V, BHONGIR M, YADADRI D', '0', 8, 0, '8074899471', '8523009180', '2026-03-21 09:04:36', '2026-03-21 09:04:36', NULL, NULL, NULL, NULL),
(2080, 'B LINGAIAH', '9849064933', '$2y$10$CBYTSAT4aovrprhEU02OTOvIFgt/HqWrAsZfG/arM5IbzqWjGkn2W', '123456', NULL, 'DSNR HYD', '0', 8, 0, '9849064933', '7330748009', '2026-03-22 06:59:08', '2026-03-22 06:59:08', NULL, NULL, NULL, NULL),
(2081, 'Medudhula anil yadav', '9666722445', '$2y$10$Cd.g4qcu2mUhtsaPDWZEG.KvLGSvAyn7lIRCmrzlE091jxVkYQT..', 'Anil8117@', NULL, 'Hyderabad', '0', 8, 0, '9666722445', '9948889593', '2026-03-22 11:21:53', '2026-03-22 11:21:53', NULL, NULL, NULL, NULL),
(2082, 'Repaka Bhaskar', '9948313974', '$2y$10$38erKnijPmYmS435IIhW0.2UgYUskWoZhp4GaII3g9CqkeoPkKWw6', '2032', NULL, 'Siddipet', '0', 8, 0, '9948313974', '9948889593', '2026-03-22 16:56:35', '2026-03-22 16:56:35', NULL, NULL, NULL, NULL),
(2083, 'Veerabhadrappa k', '7349701418', '$2y$10$/3h7BpPqkBKGGGSpBQ8hi.Xv1ZDn6muLwagRjz8y55NwcdSNduybu', '123456', NULL, 'Teacher colony penukonda road p. Roppa pavagada taluk Tumkur district Karnataka pin code 561202', '0', 8, 0, '7349701418', '9948889593', '2026-03-23 01:24:09', '2026-03-23 01:24:09', NULL, NULL, NULL, NULL),
(2084, 'Satish  bondalu', '9966166428', '$2y$10$DVwd9wh9QqgqarqcG9oPGOfbkBoI5UqaFIdvsxW8Vhr2GZraJ/2Ji', '123456', NULL, 'Sanathnagar hyd', '0', 8, 0, '9966166428', '9398859163', '2026-03-23 09:07:44', '2026-03-23 09:07:44', NULL, NULL, NULL, NULL),
(2085, 'DIWAKAR GAJULA', '9959091681', '$2y$10$.m8LNoeWzOWqc20KrpXMWO6PXP/HriuY4GKQuiZILzz3DQSS3JoxC', '123456', NULL, 'HYDERABAD', '0', 8, 0, '9959091681', '9246351657	', '2026-03-29 12:03:52', '2026-03-23 14:38:50', NULL, NULL, NULL, NULL),
(2086, 'B Krishna Reddy', '9347364850', '$2y$10$/eDCXTe27HIkbiJhFsJd6ehzlO7MFmS7c/gSaMiEtac8/77r7yL9S', '123456', NULL, 'Piduguralla', '0', 8, 0, '9347364850', '7416495999', '2026-03-25 08:24:38', '2026-03-25 08:24:38', NULL, NULL, NULL, NULL),
(2087, 'Datrika simham', '9391027767', '$2y$10$pHcbI9jY0Up9ixAr1.Fbl.08PEc66y4TH0q7SyeAoxm6EwzmlNPs2', '123456', NULL, 'Indira Nagar Hyderabad', '0', 8, 0, '9391027767', '7330748009', '2026-03-26 06:42:07', '2026-03-26 06:42:07', NULL, NULL, NULL, NULL),
(2088, 'Srinivash', '9550065553', '$2y$10$Nm0FJDszvOcfVrOQqiz5se9CXprU5pwpuNXszjyOYpwGovUeaDiJ2', '123456', NULL, 'LB Nagar', '0', 8, 0, '9550065553', '9391027767', '2026-03-26 08:35:19', '2026-03-26 08:35:19', NULL, NULL, NULL, NULL),
(2089, 'Ramji nayak', '8186886672', '$2y$10$pLAnokrFFHUg7ZZTjHJIruEcz13gz/S9KUs7HvGvU9eyUasmuQv3W', '123456', NULL, 'Matchel', '0', 8, 0, '8186886672', '9391027767', '2026-03-26 08:42:42', '2026-03-26 08:42:42', NULL, NULL, NULL, NULL),
(2090, 'Kanithi Brahma Achari', '9290415979', '$2y$10$tJP3X4pjgR61wpHFrKjzIOYiEHOhf9F5bVdo325PPooRhm9.MxRGa', '7171', NULL, 'Medchal', '0', 8, 0, '9290415979', '9391027767', '2026-03-26 09:10:25', '2026-03-26 09:10:25', NULL, NULL, NULL, NULL),
(2091, 'P Ramesh', '9177660050', '$2y$10$ZdrUivJ4eFftMVgltWscDOLTPynevclw3nVNtdclIiAJ0o1eXork.', '123456', NULL, 'Medchal', '0', 8, 0, '9177660050', '9391027767', '2026-03-29 12:07:24', '2026-03-26 09:25:30', NULL, NULL, NULL, NULL),
(2092, 'V Kasi viswanadham', '9703191713', '$2y$10$/OkmA1nwYZFC4lJ/uPauwOrRdfviKXuBdx.6IaYJjLVKdWaX48ceu', 'Viswa@2909', NULL, '501203', '0', 8, 0, '9703191713', '9948889593', '2026-03-27 07:57:34', '2026-03-27 07:57:34', NULL, NULL, NULL, NULL),
(2093, 'Bhavya Sree', '9966272121', '$2y$10$9rOW0RZm3u6oOV7qMU/r0eb8osjDUtMYZuA7xo7wHaNvFI5USrcde', 'Mlpsoft@29209', NULL, 'HYDERABAD', '0', 8, 0, '9966272121', '8522881144', '2026-03-29 12:01:55', '2026-03-27 15:07:51', NULL, NULL, NULL, NULL),
(2094, 'Rajasekhar', '8123306926', '$2y$10$caS3s8TqA7nXBLERUrcueOPqCpdR/iFgnSAb4sdDQPbE/zlf99YyS', '#Rshappy1234', NULL, 'Bangalore', '0', 8, 0, '8123306926', '9966272121', '2026-03-28 06:02:01', '2026-03-28 06:02:01', NULL, NULL, NULL, NULL),
(2095, 'Y UMA MAHESWAR RAO', '8801060160', '$2y$10$aHnKmqKPJcalXipGRGwOseHWT6GZ.FlZHXM0pVX0.42roavkIgSvq', '123456@Uma', 'assets/user_assets/images/69d245940ac13.UMAPHOTOADV.jpg', 'Hyderabad', '0', 8, 0, '8801060160', '7330748009', '2026-04-05 11:20:52', '2026-03-29 08:34:22', 'NACHARAM', 'HYDERABAD', 'Telangana', '500076'),
(2096, 'K Gopalrao', '9441440800', '$2y$10$GFrfoh/.Dnf.hjmleqF3JOgsD4./yLYWg0WbrTpxYXgt2ZaYJh5Ka', '673381', NULL, 'Old Alwal secunderabad', '0', 8, 0, '9441440800', '8801060160', '2026-04-03 06:15:41', '2026-03-29 09:11:07', NULL, NULL, NULL, NULL),
(2097, 'Gajula Krishna', '8179191804', '$2y$10$ZxQPO.uTcl9SVpSeJ1DIL.zGRhudC0jF22POBP8hQyRwzMG5Hsq9u', '611975', NULL, 'Karmangat', '0', 8, 0, '8179191804', '8801060160', '2026-04-09 10:40:15', '2026-03-29 09:19:53', NULL, NULL, NULL, NULL),
(2098, 'Tellam Chandraiah', '7337598530', '$2y$10$rWbMSgIr6FTWXXgNZdKpneJSqkE44xIaDyOtuyhX.R4BG9CdgBBB.', 'Amos@123', NULL, 'Assam ,Bongaigaon', '0', 8, 0, '7337598530', '9948889593', '2026-03-29 14:26:07', '2026-03-29 14:26:07', NULL, NULL, NULL, NULL),
(2099, 'Manjula', '9553808053', '$2y$10$AFn3dMPGy1aeCElTnvvt8eri7GsBnM7oRcGv6UME6iEACFcD0mCL.', 'manjula', NULL, 'Boraband', '0', 8, 0, '9553808053', '7330748009', '2026-03-30 05:53:08', '2026-03-30 05:53:08', NULL, NULL, NULL, NULL),
(2100, 'Sailed rani', '9491179549', '$2y$10$xj9EBW3fiNjUdxSmfp9HvuQ68e06NgTmaxbXdNZDR1kXNF7aZ/c5W', 'ranirani', NULL, 'Mallapur', '0', 8, 0, '9491179549', '7330748009', '2026-03-30 06:11:18', '2026-03-30 06:11:18', NULL, NULL, NULL, NULL),
(2101, 'B. Roja', '9032692982', '$2y$10$6j6cR4WIDYQx56oom/yKbeff93H4MoOuztYKITMqbI3L3Uo7yYPk2', '2023', NULL, 'Alwa', '0', 8, 0, '9032692982', '8331803248', '2026-03-30 12:37:17', '2026-03-30 12:37:17', NULL, NULL, NULL, NULL),
(2102, 'Maithreya K', '9550062868', '$2y$10$EJzudwL7UoFMFTAfh1Hvvuio/l9ryg9AlE71cBxaM/77ag/Jf/tBG', 'Maithreya6^', NULL, 'Vengalarao Nagar', '0', 8, 0, '9550062868', '9347946485', '2026-03-30 12:53:57', '2026-03-30 12:53:57', NULL, NULL, NULL, NULL),
(2103, 'Allanki Satya roja', '8790871986', '$2y$10$V7Y3i4NXW2JgUwFjT1zdi.TkMwP1eUWtEmbJwolxRLO.493yfiEdi', 'karthikeya', NULL, 'Neredmet', '0', 8, 0, '8790871986', '7989367438', '2026-03-30 15:41:07', '2026-03-30 15:41:07', NULL, NULL, NULL, NULL),
(2104, 'Dr mitta sreenivasa Reddy', '9908078999', '$2y$10$3MkbYLJ8mDzKM8ZUsqR9s.FcnWotNcmqe660z23QgckTXaQKJntJe', '123456', NULL, 'Hyderabad', '0', 8, 0, '9908078999', '9581495766', '2026-03-31 08:53:51', '2026-03-31 08:53:51', NULL, NULL, NULL, NULL),
(2105, 'Naresh kumar', '9491031654', '$2y$10$MrhlNzCRqvhuhAXTsxUrEuznsyt0bsufEvO1ezfB0Wz52byGB3SlW', 'ammu@1996', NULL, 'Kamareddy', '0', 8, 0, '9491031654', '9948889593', '2026-03-31 16:56:13', '2026-03-31 16:56:13', NULL, NULL, NULL, NULL),
(2106, 'Raghav Dharmacharla', '7416575657', '$2y$10$L/8vXOZsUkNEKUdipgYoBOqbz5FgxdNuK/qGN0osxI907zNjFmWhe', 'Asgeya@2026', NULL, 'Hydershakote', '0', 8, 0, '7416575657', '9912411055', '2026-04-01 16:40:36', '2026-04-01 16:40:36', NULL, NULL, NULL, NULL),
(2107, 'Anil Hyd', '9010664139', '$2y$10$Hkq8cNEu92Qy3nhy13cMTOhGSuXBfLa//9iJkDae7v19/u6TwkP9a', '123456', NULL, 'Chengicherla', '0', 8, 0, '9010664139', '7286963204', '2026-04-02 11:05:27', '2026-04-02 11:05:27', NULL, NULL, NULL, NULL),
(2108, 'keshava', '7780720358', '$2y$10$y5NM/u8/9ocuOgaDxsOKPufFDwfmK9zg2qV/Semmn5fWLmtZt6xCm', '123456', NULL, 'ECIL', '0', 8, 0, '7780720358', '7286963204', '2026-04-02 11:07:41', '2026-04-02 11:07:41', NULL, NULL, NULL, NULL),
(2109, 'Premalatha', '8374636324', '$2y$10$GlQppVuqATnRciu2ab9hlOJl.bSmQAZUiHdzQ49p/J5kkzGqogVii', '270389', NULL, 'Borabanda', '0', 8, 0, '8374636324', '9553808053', '2026-04-02 11:57:18', '2026-04-02 11:57:18', NULL, NULL, NULL, NULL),
(2110, 'Abhishek Gouru', '9493973027', '$2y$10$Qc4tRMFObwBc8SiLx0CRgeyoWyzHIo./s.D6853q7VxWKVhZh9uJm', 'Saianna@2121', NULL, 'Hyderabad', '0', 8, 0, '9493973027', '8639974381', '2026-04-03 06:41:24', '2026-04-03 06:41:24', NULL, NULL, NULL, NULL),
(2111, 'M rekha', '9246062370', '$2y$10$rTadisCt0CaVZpxtGBGsReSLbJWpllqbn4cIc/s5mnzjQu2DdHSoe', '123456', NULL, 'Secunderabad', '0', 8, 0, '9246062370', '8801060160', '2026-04-06 11:30:48', '2026-04-03 12:50:15', 'Flat no 204 prameela towers kakaguda kharkhana', 'Telangana', 'Telangana', '500015'),
(2112, 'Bhaskar', '9686966220', '$2y$10$kvZjktmDxTsWiwqzJS.Yru9JBmnJvVmf.QYJIo3Bjxe3NkEs3D4ju', 'Newuser@001', NULL, 'Hyderabad', '0', 8, 0, '9686966220', 'admin', '2026-04-04 02:54:42', '2026-04-04 02:54:42', NULL, NULL, NULL, NULL),
(2113, 'MD.MUJEEB', '8121802856', '$2y$10$NtWD/C3DYui/cHLUDPbv7.NUL7Yoy6LgdvI156icF5.YhfJxqclOC', '123456', NULL, 'SHADNAGAR', '0', 8, 0, '8121802856', '9246062370', '2026-04-04 19:25:35', '2026-04-04 19:25:35', NULL, NULL, NULL, NULL),
(2114, 'Suresh', '8585856232', '$2y$10$kDaf7CopYpd6kHsxuOHkKuLf//Xks4XHoj8.HXh4J99iGDqohdsv6', '123456', NULL, 'Haryana', '0', 8, 0, '8585856232', '9246062370', '2026-04-05 07:57:29', '2026-04-05 07:57:29', NULL, NULL, NULL, NULL),
(2115, 'Suresh', '8585856231', '$2y$10$jnc1nAI24xb2BONqfVBxue6I7ae8ZHihcUaRmxrlFndn.WSxwv6xe', '123456', NULL, 'Haryana', '0', 8, 0, '8585856231', '9246062370', '2026-04-05 07:58:14', '2026-04-05 07:58:14', NULL, NULL, NULL, NULL),
(2116, 'A MURALI KRISHNA', '8985313122', '$2y$10$HvkfDwkBxBR3o0EZ/Hwgre0BoqBI2tamY36jzVZAx1hK8zHk5SGPu', 'Amk123456@', NULL, 'Vijayawada', '0', 8, 0, '8985313122', '8801060160', '2026-04-05 11:52:48', '2026-04-05 11:52:48', NULL, NULL, NULL, NULL),
(2117, 'Y Naga Raju', '7013284754', '$2y$10$euZMasKDOt12TnoaT456VeXYSnfVcoKKcduOoTs8OxlLwn32kVHOW', 'Ynr123456@', NULL, 'Mallepally  Hyderabad', '0', 8, 0, '7013284754', '8801060160', '2026-04-06 04:46:36', '2026-04-05 11:58:45', NULL, NULL, NULL, NULL),
(2118, 'Deepak Bhanushali', '9768676666', '$2y$10$faiaj.wyH5/fP93MMZJ0eerbtCA1GP1VEYog/jCIxradR8lMIKJRq', 'zigzag123', NULL, 'Mumbai', '0', 8, 0, '9768676666', '8801060160', '2026-04-05 13:15:41', '2026-04-05 13:15:41', NULL, NULL, NULL, NULL),
(2119, 'S Satyanarayana', '9491652665', '$2y$10$LAl0UNRALJu6i6szBEwo..r/fkmfeEr7zjO6dEUNGYGgAvuMjySt.', 'Sangee@1980', NULL, 'Kalamadugu', '0', 8, 0, '9491652665', '9948889593', '2026-04-05 15:37:06', '2026-04-05 15:37:06', NULL, NULL, NULL, NULL),
(2120, 'B G REDDY', '9493848989', '$2y$10$fOIdCEdTOBiq0CQ4Aa18ieVeKT8JZzxlSYNPeA4n4/UykWaW6HhRu', '54895489', NULL, 'Hyderabad', '0', 8, 0, '9493848989', '9246062370', '2026-04-06 08:51:16', '2026-04-06 08:51:16', NULL, NULL, NULL, NULL),
(2121, 'VEMULA NAGARAJU', '9912923944', '$2y$10$qV4bAxs5RIgEN2cw7cOg3emoEc7ZEnkBFPIIY0L04BCKYFkDlZRoq', '9618165444', NULL, 'Alwal', '0', 8, 0, '9912923944', '9246062370', '2026-04-06 11:12:01', '2026-04-06 11:12:01', NULL, NULL, NULL, NULL),
(2122, 'SUJATHA', '9959638283', '$2y$10$8FnpeJOuhxZ5zhvmnb187.c/5hWeBdtTOPN0ilF/bbgMlEEgUFeUy', 'sujatha@123', NULL, 'Sujatha', '0', 8, 0, '9959638283', '9246062370', '2026-04-06 12:32:22', '2026-04-06 12:32:22', NULL, NULL, NULL, NULL),
(2123, 'Ravi Kumar', '9515127639', '$2y$10$kRz.sQPpaEJy6ZIH0z.h9O9UCCfjyGXkscLPTP/tZlVxchluXkdhm', 'Ravi@1962', NULL, 'Madhapur', '0', 8, 0, '9515127639', '9550272931', '2026-04-06 14:04:33', '2026-04-06 14:04:33', NULL, NULL, NULL, NULL),
(2124, 'Yesu vsecurity  czech', '9849229776', '$2y$10$.W9nHOk6rbVn9.OEypI6OOUWgaNlQxyhoh79hy.GPuL7NmUdLB7Vy', '123456', NULL, 'Sanathnagar', '0', 8, 0, '9849229776', '9398859163', '2026-04-07 05:28:10', '2026-04-07 05:28:10', NULL, NULL, NULL, NULL),
(2125, 'P.sita maha Lakshmi', '6304306771', '$2y$10$gxIYbQmh2p5f8dNb0bxnROo16RP2tQVg0Xui50Z8RXVKuXw0C5XbK', '547547', NULL, 'Kothapet', '0', 8, 0, '6304306771', '7330748009', '2026-04-07 06:04:20', '2026-04-07 06:04:20', NULL, NULL, NULL, NULL),
(2126, 'Mullashaikshavali', '7386892137', '$2y$10$xHYMvoQ0J/OV0lw/KcUazei6E9JiiKTsCzEC1tSrrfoQhS3bruUfG', '7386892137', NULL, 'Saibabacalani.polt.no.9.10.dondathota.jwahawaharnagar.kapra', '0', 8, 0, '7386892137', '7330748009', '2026-04-07 07:45:25', '2026-04-07 07:45:25', NULL, NULL, NULL, NULL),
(2127, 'b.santhoshkumar999@gmail.com', '9948984290', '$2y$10$0w4F1A5k848gq125etcjvu4BbyfzTiaKi6xhpFJRN13qMRCRdEJqq', '12345', NULL, '12345', '0', 8, 0, '9948984290', '8639974381', '2026-04-07 08:45:31', '2026-04-07 08:45:31', NULL, NULL, NULL, NULL),
(2128, 'Talla Bhaskarsri', '8712188242', '$2y$10$Hj0HfZiSn7bdGaGRbIUrvO/8h7qE0tdoy7vWaEfvLLeKuKQcY8rFi', 'sri@1123', NULL, 'Visakhapatnam', '0', 8, 0, '8712188242', 'admin', '2026-04-07 09:05:20', '2026-04-07 09:05:20', NULL, NULL, NULL, NULL),
(2129, 'DHREDDY', '9803489489', '$2y$10$m2bdWS7LW/EXV5Op80VRCOZmLzh0.EvkpxKIk8OkJVdxy861Fx0Oe', '54895489', NULL, 'Hyderabad', '0', 8, 0, '9803489489', '9493848989', '2026-04-07 09:41:01', '2026-04-07 09:41:01', NULL, NULL, NULL, NULL),
(2130, 'MADDI NARAYANA REDDY', '9908918926', '$2y$10$s03991kAKnuX67sl7YLRXedKHKFt662XiKMvDA2xW/ngNyuyfZa1i', '6146', NULL, 'Pragathi Nagar', '0', 8, 0, '9908918926', '9581495766', '2026-04-08 07:20:32', '2026-04-08 07:20:32', NULL, NULL, NULL, NULL),
(2131, 'buntyvarma', '9154670246', '$2y$10$ydbpwjKuflIqqcI1nfRwJ.RjmpGvhORp18u.UkgHWGXlf.pw3/h7y', 'Varma@0717', NULL, 'hyderabad', '0', 8, 0, '9154670246', 'admin', '2026-04-08 18:02:05', '2026-04-08 18:02:05', NULL, NULL, NULL, NULL),
(2132, 'V Srinivas ayurveda', '8790326885', '$2y$10$p1cfO5QpBIrlJQMcER9yZ.y/aKE4VeKesdInPqffBmRm.BkdmQdje', '123456', NULL, 'Hyderabad', '0', 8, 0, '8790326885', '7330748009', '2026-04-09 10:42:56', '2026-04-09 10:42:56', NULL, NULL, NULL, NULL),
(2133, 'Koochana Family', '9123456789', '$2y$10$QyVoBHMYnf/pN6p82KJPC.BX62UF3m8u/.YvAGExBLWGWCpiJSlO6', '123456', NULL, 'Warangal', '0', 8, 0, '9123456789', 'admin', '2026-04-10 05:04:20', '2026-04-10 05:04:20', NULL, NULL, NULL, NULL),
(2134, 'Koochana Anil ashalapally', '8074061596', '$2y$10$M0fBnFKseG7rL305ntpDm.TgAOfmIHMc6O.pAg6hu1ezRRdnDLYhO', '123456', NULL, 'Warangal', '0', 8, 0, '8074061596', '9123456789', '2026-04-10 05:10:06', '2026-04-10 05:10:06', NULL, NULL, NULL, NULL),
(2135, 'Koochana Ashok kailasm', '9890312363', '$2y$10$9v.lGKapl4GI7HI7T1hPYeUeFX2ttGcCAzIkrKOXmouN8cjfLywZa', '123456', NULL, 'Warangal', '0', 8, 0, '9890312363', '9123456789', '2026-04-10 05:11:49', '2026-04-10 05:11:49', NULL, NULL, NULL, NULL),
(2136, 'Koochana Bhaskar', '9849211974', '$2y$10$UDrWR2OwUSduzvNMLLcbtewB3RrOPftD4JWALBc17e2PUidBoDjaW', '123456', NULL, 'Warangal', '0', 8, 0, '9849211974', '9123456789', '2026-04-10 05:13:09', '2026-04-10 05:13:09', NULL, NULL, NULL, NULL),
(2137, 'Koochana Cheralu', '9391526453', '$2y$10$F4rbZbkQ/ZXgoDCHB4OD2.8cCKoHheX.FFmKCAuubHjb2altx1Hq6', '123456', NULL, 'Warangal', '0', 8, 0, '9391526453', '9123456789', '2026-04-10 05:15:54', '2026-04-10 05:15:54', NULL, NULL, NULL, NULL),
(2138, 'Koochana Hari Krishna', '9491030225', '$2y$10$kSlzef6kbzbibYs4NlAxtOv7VZqOR3dMsu2n4m3bfr02V3S4XWxTW', '123456', NULL, 'Warangal', '0', 8, 0, '9491030225', '9123456789', '2026-04-10 05:17:23', '2026-04-10 05:17:23', NULL, NULL, NULL, NULL),
(2139, 'Koochana Nagajyothi', '8801452559', '$2y$10$lEcmcfeLnGu5kyULBqJvneHZdCrWs0tuUWpoCz9hQuefHOwrXpxuG', '123456', NULL, 'Warangal', '0', 8, 0, '8801452559', '9123456789', '2026-04-10 06:32:54', '2026-04-10 06:32:54', NULL, NULL, NULL, NULL),
(2140, 'koochana Naveen kumar', '6300838220', '$2y$10$f5glTm936ydT4i/uDqQmAejdc7akUAw/hpQMExgLXguO7GF08UC8K', '123456', NULL, 'Warangal', '0', 8, 0, '6300838220', '9123456789', '2026-04-10 13:21:06', '2026-04-10 13:21:06', NULL, NULL, NULL, NULL),
(2141, 'koochana Raju adthi', '9989766892', '$2y$10$v3uuKVHpkKY7CZ7tTBnX4eiWmo7MfISZ.fzIhZ7OxAHHx3cAUYZ56', '123456', NULL, 'Warangal', '0', 8, 0, '9989766892', '9123456789', '2026-04-10 13:22:19', '2026-04-10 13:22:19', NULL, NULL, NULL, NULL),
(2142, 'koochna Ramesh swasthik', '9849427499', '$2y$10$W.b.pZo5.Wuefr7DsujRmutZnz0iTN2I6JJFRnwxsXRo0xiEl4K8K', '123456', NULL, 'Warangal', '0', 8, 0, '9849427499', '9123456789', '2026-04-10 13:31:48', '2026-04-10 13:31:48', NULL, NULL, NULL, NULL),
(2143, 'koochnana Sammaiah', '9849066635', '$2y$10$tEJmpD0ObZbVKOKwrWd8mOGUZPFue5sjKesqr6ACuGsEC506qwZBG', '123456', NULL, 'Warangal', '0', 8, 0, '9849066635', '9123456789', '2026-04-10 13:33:09', '2026-04-10 13:33:09', NULL, NULL, NULL, NULL),
(2144, 'koochana kumar chinna', '9908944094', '$2y$10$O7PVA0cyA74RGwGtVq/YFOZCeVcigcZcL4U2X5B3oJybUa8kqKSnS', '123456', NULL, 'Warangal', '0', 8, 0, '9908944094', '9123456789', '2026-04-10 14:50:47', '2026-04-10 14:50:47', NULL, NULL, NULL, NULL),
(2145, 'koochana Ramesh suranna', '9700809385', '$2y$10$caBExs1vyKKXGmJKxc56XOM0IGCc4sh1cGJIsh3FAvr3QGiB4QEn2', '123456', NULL, 'Warangal', '0', 8, 0, '9700809385', '9123456789', '2026-04-10 14:53:56', '2026-04-10 14:53:56', NULL, NULL, NULL, NULL),
(2146, 'NAGESWARAREDDY', '9885577332', '$2y$10$2d6Fg8TcNo4wQrtwGwur0esTBluFAwotnHfNxXJxh3HAlaAE7hJyO', '7777', NULL, 'ANATHAPURAM', '0', 8, 0, '9885577332', '7702381784', '2026-04-11 08:05:26', '2026-04-11 08:05:26', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `speciality_store_images`
--

CREATE TABLE `speciality_store_images` (
  `store_id` int NOT NULL,
  `store_name` varchar(50) NOT NULL,
  `store_image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `speciality_store_images`
--

INSERT INTO `speciality_store_images` (`store_id`, `store_name`, `store_image`, `created_at`) VALUES
(1, 'store1', 'assets/store_images/6656fbde0d652.speciality_store1.png', '2024-05-29 09:56:46'),
(2, 'store2', 'assets/store_images/6656fbe6f2bbe.speciality_store2.png', '2024-05-29 09:56:54'),
(3, 'store3', 'assets/store_images/6656fbefdce3e.speciality_store3.png', '2024-05-29 09:57:03'),
(4, 'store4', 'assets/store_images/6656fbf90daf6.speciality_store4.png', '2024-05-29 09:57:13'),
(5, 'store5', 'assets/store_images/6656fc0463fe3.speciality_store5.png', '2024-05-29 09:57:24'),
(6, 'store6', 'assets/store_images/66576a3b08627.FASHION.png', '2024-05-29 17:47:39'),
(7, 'store7', 'assets/store_images/66576a4a270fb.FOOTWEAR.png', '2024-05-29 17:47:54'),
(8, 'store8', 'assets/store_images/66576a5675b8a.BEAUTY PRODUCT.png', '2024-05-29 17:48:06'),
(9, 'store9', 'assets/store_images/66576a6e6a31a.JEWELLARY.png', '2024-05-29 17:48:30'),
(10, 'store10', 'assets/store_images/66576a7a7733f.ELECTRONIC.png', '2024-05-29 17:48:42'),
(11, 'storemini1', 'assets/store_images/6660145fa5567.11.png', '2024-06-05 07:31:43'),
(12, 'storemini2', 'assets/store_images/6660146f359f5.10.png', '2024-06-05 07:31:59'),
(13, 'storemini3', 'assets/store_images/666015a980c7f.Products H360xW626.png', '2024-06-05 07:37:13'),
(14, 'storemini4', 'assets/store_images/66601486ed1eb.13.png', '2024-06-05 07:32:22');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `state_id` int NOT NULL,
  `state_name` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`state_id`, `state_name`, `created_at`, `updated_at`) VALUES
(1, 'Andhra Pradesh', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(2, 'Arunachal Pradesh', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(3, 'Assam', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(4, 'Bihar', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(5, 'Chhattisgarh', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(6, 'Goa', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(7, 'Gujarat', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(8, 'Haryana', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(9, 'Himachal Pradesh', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(10, 'Jharkhand', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(11, 'Karnataka', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(12, 'Kerala', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(13, 'Madhya Pradesh', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(14, 'Maharashtra', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(15, 'Manipur', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(16, 'Meghalaya', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(17, 'Mizoram', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(18, 'Nagaland', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(19, 'Odisha', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(20, 'Punjab', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(21, 'Rajasthan', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(22, 'Sikkim', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(23, 'Tamil Nadu', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(24, 'Telangana', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(25, 'Tripura', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(26, 'Uttar Pradesh', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(27, 'Uttarakhand', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(28, 'West Bengal', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(29, 'Andaman and Nicobar Islands', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(30, 'Chandigarh', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(31, 'Dadra and Nagar Haveli and Daman and Diu', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(32, 'Lakshadweep', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(33, 'Delhi', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(34, 'Puducherry', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(35, 'Ladakh', '2024-07-25 05:50:07', '0000-00-00 00:00:00'),
(36, 'Jammu and Kashmir', '2024-07-25 05:50:07', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `StoreID` int NOT NULL,
  `StoreName` varchar(100) NOT NULL,
  `store_image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`StoreID`, `StoreName`, `store_image`, `created_at`) VALUES
(8, 'MECHANIC SHOP', 'assets/vendor_assets/store_images_admin/6625f1edbd43d.mechanic_service.jpeg', '2024-09-30 07:13:59'),
(9, 'BANGLE STORE', 'assets/vendor_assets/store_images_admin/66471bb46a61c.BANGLE STORE.png', '2024-09-30 07:14:32'),
(10, 'BATTERY SHOP', 'assets/vendor_assets/store_images_admin/66471bc3be0a7.BATTERY SHOP.png', '2024-09-30 07:15:03'),
(11, 'BEAUTY PARLOUR', 'assets/vendor_assets/store_images_admin/66471bce099e4.BEAUTY PORLOUR.png', '2024-09-30 07:15:35'),
(12, 'BAKERY', 'assets/vendor_assets/store_images_admin/66471bdd85c77.BAKERY.png', '2024-09-30 07:16:08'),
(13, 'BONQUET HALL', 'assets/vendor_assets/store_images_admin/66471bea7e944.BONQUET HALL.png', '2024-09-30 07:16:37'),
(14, 'CAR DECORS', 'assets/vendor_assets/store_images_admin/66471bf6b79d3.CAR DECORS.png', '2024-09-30 07:17:02'),
(15, 'CAR WASH', 'assets/vendor_assets/store_images_admin/66471c0537c98.CAR WASH.png', '2024-09-30 07:17:26'),
(16, 'WHEEL ALIGNMENT', 'assets/vendor_assets/store_images_admin/66471c120a7f4.CAR WHEELS.png', '2024-09-30 07:19:28'),
(17, 'CLOTHE STORE', 'assets/vendor_assets/store_images_admin/66471c2ddc0f4.CLOTH SHOP.png', '2024-09-30 07:20:19'),
(18, 'COACHING CENTER', 'assets/vendor_assets/store_images_admin/66471c3e9f4f8.COCHING CENTERS.png', '2024-09-30 07:20:49'),
(19, 'COLLEGES', 'assets/vendor_assets/store_images_admin/66471c4d1480a.COLLEGES.png', '2024-09-30 07:21:15'),
(20, 'DJ SOUNDS', 'assets/vendor_assets/store_images_admin/66471c5d3ed00.DJ SOUNDS.png', '2024-09-30 07:21:42'),
(21, 'DRIVING SCHOOL', 'assets/vendor_assets/store_images_admin/66471c69f2ca7.DRIVING SCHOOL.png', '2024-09-30 07:23:57'),
(22, 'AIR COOLERS', 'assets/vendor_assets/store_images_admin/66471c8adc95b.AIR COOLERS.png', '2024-05-17 08:59:54'),
(23, 'AIR TICKETING', 'assets/vendor_assets/store_images_admin/66471c9c6d944.AIR TICKETING.png', '2024-05-17 09:00:12'),
(24, 'AUTOMOBILES', 'assets/vendor_assets/store_images_admin/66471caaaf138.AUTOMOBILES.png', '2024-05-17 09:00:26'),
(25, 'AYURVEDIC STORE', 'assets/vendor_assets/store_images_admin/66471cb92fdef.AYURVEDIC STORE.png', '2024-05-17 09:00:41'),
(26, 'BAR & RESTARENT', 'assets/vendor_assets/store_images_admin/66471ccacc5f1.BAR & RESTARENT.png', '2024-05-17 09:00:58'),
(27, 'BOUTIQUE', 'assets/vendor_assets/store_images_admin/66471d0d9fc3f.BOUTIQUE.png', '2024-05-17 09:02:05'),
(28, 'BUS BOOKINGS', 'assets/vendor_assets/store_images_admin/66471dbf0f576.BUS BOOKINGS.png', '2024-05-17 09:05:03'),
(29, 'CARE CENTERS', 'assets/vendor_assets/store_images_admin/66471dd9c0c44.CARE CENTERS.png', '2024-05-17 09:05:29'),
(30, 'CHIT FUND', 'assets/vendor_assets/store_images_admin/66471deac129a.CHIT FUND.png', '2024-05-17 09:05:46'),
(31, 'DRY CLEANERS', 'assets/vendor_assets/store_images_admin/66471dfc9b98f.DRY CLEANERS.png', '2024-05-17 09:06:04'),
(32, 'DRY FRUITS SHOP', 'assets/vendor_assets/store_images_admin/66471e092605b.DRY FRUITS SHOP.png', '2024-05-17 09:06:17'),
(33, 'DTH', 'assets/vendor_assets/store_images_admin/66471e1e11dea.DTH SERVICES.png', '2024-05-17 09:06:38'),
(34, 'EARTH MOVERS', 'assets/vendor_assets/store_images_admin/66471e3092791.EARTH MOVERS.png', '2024-05-17 09:06:56'),
(35, 'ELECRTICALS', 'assets/vendor_assets/store_images_admin/66471e46b783b.ELECRTICALS.png', '2024-05-17 09:07:18'),
(36, 'FERTILISER', 'assets/vendor_assets/store_images_admin/66471e53a157a.FERTILISER.png', '2024-05-17 09:07:31'),
(37, 'FLEX PRINTING', 'assets/vendor_assets/store_images_admin/66471e6265517.FLEX PRINTING.png', '2024-05-17 09:07:46'),
(38, 'FLOUR MILL', 'assets/vendor_assets/store_images_admin/66471e71cda77.FLOUR MILL.png', '2024-05-17 09:08:01'),
(39, 'FLOWER SHOP', 'assets/vendor_assets/store_images_admin/66471e7f55ff1.FLOWER SHOP.png', '2024-05-17 09:08:15'),
(40, 'FOOTWEAR', 'assets/vendor_assets/store_images_admin/66471e8e1feee.FOOTWEAR.png', '2024-05-17 09:08:30'),
(41, 'FURNITUR SHOP', 'assets/vendor_assets/store_images_admin/66471e9bb7d76.FURNITUR SHOP.png', '2024-05-17 09:08:43'),
(42, 'GEMS&PEARLS', 'assets/vendor_assets/store_images_admin/66471ead49d53.GEMS&PEARLS.png', '2024-05-17 09:09:01'),
(43, 'GIFT SHOP', 'assets/vendor_assets/store_images_admin/66471ec00cadb.GIFT SHOP.png', '2024-05-17 09:09:20'),
(44, 'GLASS MART', 'assets/vendor_assets/store_images_admin/66471ed39dd2c.GLASS MART.png', '2024-05-17 09:09:39'),
(45, 'GOLD SHOP', 'assets/vendor_assets/store_images_admin/66471fcdbf20b.GOLD SHOP.png', '2024-05-17 09:13:49'),
(46, 'GRANITE', 'assets/vendor_assets/store_images_admin/66471fdbc98ed.GRANITE.png', '2024-05-17 09:14:04'),
(47, 'GYM CENTERS', 'assets/vendor_assets/store_images_admin/66471fea6f349.GYM CENTERS.png', '2024-05-17 09:14:18'),
(48, 'HOME DECORS', 'assets/vendor_assets/store_images_admin/66471ff76b9c7.HOME DECORS.png', '2024-05-17 09:14:31'),
(49, 'HORDWARE SHOP', 'assets/vendor_assets/store_images_admin/66472006cf4b5.HORDWARE SHOP.png', '2024-05-17 09:14:47'),
(50, 'HOSPITAL', 'assets/vendor_assets/store_images_admin/664720172f107.HOSPITAL.png', '2024-05-17 09:15:04'),
(51, 'HOTEL', 'assets/vendor_assets/store_images_admin/664720279bf92.HOTEL.png', '2024-05-17 09:15:19'),
(52, 'INTERIORS', 'assets/vendor_assets/store_images_admin/66472037183f8.INTERIORS.png', '2024-05-17 09:15:35'),
(53, 'JEWELLERY', 'assets/vendor_assets/store_images_admin/664720460c1c5.JEWELLERY.png', '2024-05-17 09:15:50'),
(54, 'KITCHEN GALLERY', 'assets/vendor_assets/store_images_admin/664720597a3d5.KICHEN GALLERY.png', '2024-05-17 09:16:09'),
(55, 'LODGE', 'assets/vendor_assets/store_images_admin/66472069b087f.LODGE.png', '2024-05-17 09:16:25'),
(56, 'MARBLE STORE', 'assets/vendor_assets/store_images_admin/664720808c3ea.MARBLE STORE.png', '2024-05-17 09:16:48'),
(57, 'MARRIAGE BEAURO', 'assets/vendor_assets/store_images_admin/6647208f2b566.MARRIAGE BEAURO.png', '2024-05-17 09:17:03'),
(58, 'MEDICAL STORE', 'assets/vendor_assets/store_images_admin/6647209c89dd0.MEDICAL STORE.png', '2024-05-17 09:17:16'),
(59, 'MESS', 'assets/vendor_assets/store_images_admin/664720adce5c2.MESS.png', '2024-05-17 09:17:33'),
(60, 'MOSQUITO NETS', 'assets/vendor_assets/store_images_admin/664720be2212d.MOSQUITO NETS.png', '2024-05-17 09:17:50'),
(61, 'NOVELTY STORE', 'assets/vendor_assets/store_images_admin/664720e26277c.NOVELTY STORE.png', '2024-05-17 09:18:26'),
(62, 'OLD FURNITUR', 'assets/vendor_assets/store_images_admin/664720f5e652d.OLD FURNITUR.png', '2024-05-17 09:18:45'),
(63, 'OLDEGE HOMES', 'assets/vendor_assets/store_images_admin/664721048bfcb.OLDEGE HOMES.png', '2024-05-17 09:19:00'),
(64, 'OPTICALS', 'assets/vendor_assets/store_images_admin/664721149134d.OPTICALS.png', '2024-05-17 09:19:16'),
(65, 'PAINTS SHOP', 'assets/vendor_assets/store_images_admin/66472125cb30c.PAINTS SHOP.png', '2024-05-17 09:19:33'),
(66, 'PAN SHOP', 'assets/vendor_assets/store_images_admin/66472164a37d3.PAN SHOP.png', '2024-05-17 09:20:36'),
(67, 'PET SHOPS', 'assets/vendor_assets/store_images_admin/6647217506e55.PET SHOPS.png', '2024-05-17 09:20:53'),
(68, 'PHOTO FRAMES', 'assets/vendor_assets/store_images_admin/66472184e3134.PHOTO FRAMES.png', '2024-05-17 09:21:09'),
(69, 'PLYWOOD SHOP', 'assets/vendor_assets/store_images_admin/664721993d0b4.PLYWOOD SHOP.png', '2024-05-17 09:21:29'),
(70, 'POOJA STORE', 'assets/vendor_assets/store_images_admin/664721b6f134d.POOJA STORE.png', '2024-05-17 09:21:59'),
(71, 'RESORTS', 'assets/vendor_assets/store_images_admin/664721cb01ef4.RESORTS.png', '2024-05-17 09:22:19'),
(72, 'SANITARY SHOP', 'assets/vendor_assets/store_images_admin/664721dabeda9.SANITARY SHOP.png', '2024-05-17 09:22:34'),
(73, 'SCHOOLS', 'assets/vendor_assets/store_images_admin/664721ec5a750.SCHOOLS.png', '2024-05-17 09:22:52'),
(74, 'SOLAR SYSTEMS', 'assets/vendor_assets/store_images_admin/664721fc29ffc.SOLAR SYSTEMS.png', '2024-05-17 09:23:08'),
(75, 'SPORTS SHOP', 'assets/vendor_assets/store_images_admin/6647220e6c65a.SPORTS SHOP.png', '2024-05-17 09:23:26'),
(76, 'SUPER MARKET', 'assets/vendor_assets/store_images_admin/6647222402ba5.SUPER MARKET.png', '2024-05-17 09:23:48'),
(77, 'SURGICLES', 'assets/vendor_assets/store_images_admin/6647223a53b67.SURGICLES.png', '2024-05-17 09:24:10'),
(78, 'SWEET SHOP', 'assets/vendor_assets/store_images_admin/664722539978f.SWEET SHOP.png', '2024-05-17 09:24:35'),
(79, 'TENT HOUSE', 'assets/vendor_assets/store_images_admin/6647226066d5b.TENT HOUSE.png', '2024-05-17 09:24:48'),
(80, 'TIFFIN CENTRE', 'assets/vendor_assets/store_images_admin/6647226d8cfe1.TIFFIN CENTRE.png', '2024-05-17 09:25:01'),
(81, 'TOURS & TRAVELS', 'assets/vendor_assets/store_images_admin/6647227c3e3f6.TOURS & TRAVELS.png', '2024-05-17 09:25:16'),
(82, 'TRUST & CHARITY', 'assets/vendor_assets/store_images_admin/6647228975734.TRUST & CHARITY.png', '2024-05-17 09:25:29'),
(83, 'TYRE RETRADER', 'assets/vendor_assets/store_images_admin/66472297ed949.TYRE RETRADER.png', '2024-05-17 09:25:43'),
(84, 'WATCH SHOP', 'assets/vendor_assets/store_images_admin/664722a5f161b.WATCH SHOP.png', '2024-05-17 09:25:58'),
(85, 'WHOLESALE SHOPS', 'assets/vendor_assets/store_images_admin/664722b80be3d.WHOLESALE SHOPS.png', '2024-05-17 09:26:16'),
(86, 'YOGA CENTRE', 'assets/vendor_assets/store_images_admin/664722c41ae01.YOGA CENTRE.png', '2024-05-17 09:26:28'),
(87, 'KIRANA GENERAL', 'assets/vendor_assets/store_images_admin/6683c89600ede.grocery-store.jpg', '2024-09-30 07:27:41');

-- --------------------------------------------------------

--
-- Table structure for table `users_commission_wallets`
--

CREATE TABLE `users_commission_wallets` (
  `wallet_id` int NOT NULL,
  `user_id` int NOT NULL,
  `back_two_back` int NOT NULL DEFAULT '0',
  `pool_commission` int NOT NULL DEFAULT '0',
  `cashback` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_bank_details`
--

CREATE TABLE `user_bank_details` (
  `bank_id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `account_number` varchar(30) NOT NULL,
  `ifsc` varchar(20) NOT NULL,
  `pancard_number` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_bank_details`
--

INSERT INTO `user_bank_details` (`bank_id`, `user_id`, `user_name`, `bank_name`, `account_number`, `ifsc`, `pancard_number`, `created_at`) VALUES
(1, 252, 'K KISHAN RAO', 'HDFC', '2236110000054', 'HDF3432', '', '2024-06-02 16:22:06'),
(2, 165, 'MEESA RAJESWARRAO', 'Union', '878745646747', 'UBIN3432', '', '2024-06-03 07:32:47'),
(3, 148, 'K KUMARASWAMY', 'SBI', '3991666466', 'SBIN0016293', 'ALWPK0977F', '2024-06-24 07:18:45'),
(4, 150, 'kumaraswamy', 'SBI', '33986753083', 'SBIN0016293', 'DLZPK8211G', '2024-06-24 08:42:25'),
(5, 378, 'sai kumar', 'union bank', '123045678912', 'UBIN000074312', '', '2024-06-05 10:16:33'),
(9, 392, 'Balaji', 'Union', '232435464658', 'UBIN3432', 'NNPPS4468R', '2024-06-14 05:53:03'),
(10, 392, 'Balaji', 'Union', '232435464658', 'UBIN3432', 'NNPPS4468R', '2024-06-14 05:54:32'),
(11, 392, 'Balaji', 'Union', '232435464658', 'UBIN3432', 'NNPPS5868R', '2024-06-14 05:55:49'),
(12, 392, 'Balaji', 'Union', '232435464658', 'UBIN3432', '1NPPS4468R', '2024-06-14 06:15:30'),
(13, 392, 'Balaji', 'Union', '232435464658', 'UBIN3432', 'NNPPS4468R', '2024-06-14 06:16:51'),
(14, 392, 'Balaji', 'Union', '232435464658', 'UBIN3432', 'NNPPS5668R', '2024-06-14 10:17:50'),
(15, 154, 'NIMMANAGOTI VENKANNA', 'union bank', '123045678912', 'UBIN000074312', 'NNPS4554332', '2024-06-15 14:31:17'),
(17, 416, 'Naveen', 'union bank', '257382922022', 'UBIN000074312', 'NNPS0054332', '2024-06-24 06:10:20'),
(18, 429, 'Nerella Ramesh', 'HDFC', '50100054958702', 'HDFC0002423', 'APOPN2963E', '2024-07-03 05:55:49'),
(19, 268, 'MOHAMMAAD SHAKIL', 'ICICI', '111101515304', 'ICIC0001111', 'ARFPV7413A', '2024-07-03 08:22:53'),
(20, 441, 'PORIKA VIJAY KUMAR', 'SBI', '62447191370', 'SBIN0020716', 'FOQPB2007K', '2024-07-04 13:42:34'),
(21, 250, 'AVM SATYANARAYANA', 'SBI', '52002010363', 'SBIN0032241', 'AEVPA5076R', '2024-07-06 06:40:00'),
(22, 461, 'K SRNIVAS', 'INDIAN BANK', '6587204887', 'IDIB000H058', 'GKQPK1943A', '2024-07-06 07:00:23'),
(23, 155, 'THOUTAM MARKANDEYA', 'CANARA BANK', '0621101052064', 'CNRB0000621', 'AEJPT9698E', '2024-07-06 10:35:23'),
(24, 482, 'anand', 'kvb', '4802155000003733', 'kvbl0004802', 'agypn3448f', '2024-07-07 01:05:24'),
(25, 486, 'Gongidi Narsimhulu', 'State Bank of India', '62302449861', 'SBIN0011087', 'CHXPG3467M', '2024-07-07 03:07:42'),
(26, 488, 'ASHOK E', 'SBI', '62142101880', 'SBIN0021043', 'CYOPA3335C', '2024-07-07 10:09:35'),
(27, 497, 'I SATYANARAYANA', 'CANARA BANK', '2775101001364', 'CNRB0002775', 'BGTPS1651K', '2024-07-07 14:10:11'),
(28, 503, 'Kuruba govindarajulu', 'Hsbc bank', '082575333006', 'Hsbc0509992', 'BCLPK4017R', '2024-07-08 10:24:06'),
(29, 505, 'SRINIVASA RAO', 'UNION BANK', '052110100056185', 'UBIN0805211', 'BFCPS7073F', '2024-07-08 16:35:24'),
(30, 508, 'Taniru Parvathi', 'union bank', '123045678912', 'UBIN000074312', 'NNPS4554332', '2024-07-09 10:35:46'),
(31, 230, 'PRASADA RAO G', 'SBI', '31286669644', 'SBIN0004758', 'BGSPG6560L', '2024-07-11 13:50:51'),
(32, 536, 'AKula Venkateswarlu', 'SBI', '62242485454', 'SBIN0010685', 'ATCPA4276F', '2024-07-14 09:25:51'),
(33, 537, 'N RAMAKRISHNA', 'SBI', '30138319110', 'SBIN0006113', 'AIXPN7358K', '2024-07-14 09:34:47'),
(34, 538, 'ELAGAM ASHOK SIVA KUMAR', 'State Bank of India', '62003716327', 'SBIN0020163', 'AAKPEO953G', '2024-07-14 14:27:23'),
(35, 515, 'Rampelli Mallesham', 'Union Bank of India', '0100101001725', 'UBIN0801208', 'BJHPR5916', '2024-07-14 15:25:08'),
(36, 491, 'S vijay kumar', 'ESAF SMALL FINANCE BANK', '50190008063719', 'ESMF0001245', 'BLIPK7261H', '2024-07-15 07:57:04'),
(37, 551, 'akula mallesh', 'The Karimnagar Dist.Co-Operative Central Bank Ltd', '205522010005981', 'TSAB0020055', 'AOAPA9459H', '2024-07-15 14:23:36'),
(38, 261, 'SWAMIDAS', 'KARUR VYSYA BANK', '12355666', 'KVBL0001446', 'AAICK5714A', '2024-07-17 08:36:03'),
(39, 254, 'KOOCHANA CHANDU', 'union bank', '123045678912', 'UBIN000074312', 'NNPS4554332', '2024-07-17 10:39:35'),
(40, 554, 'Kommu.Mohan rao', 'State Bank of India', '33318178253', 'SBIN0010685', 'BLPPK4429L', '2024-07-19 09:24:33'),
(41, 248, 'KANUKUNTLA RAJENDER', 'PUNJAB NATIONAL BANK', '4632000100029023', 'PUNB046320', 'AQRPK3717H', '2024-07-19 15:57:52'),
(42, 247, 'P LAXMANASWAMY', 'INDIAN BANK', '6959297827', 'IDIB000V012', 'ANSPP69M', '2024-07-19 16:07:20'),
(43, 257, 'S RAJA RAO', 'UNION BANK', '763502010000336', 'UNIB0810673', 'CBQPR4461P', '2024-07-19 16:25:17'),
(44, 170, 'SYAM RAJSHEKAR', 'INDIAN OVERSEAS BANK', '352701000004550', 'IOBA0003527', 'AJTPC9470C', '2024-07-19 16:56:55'),
(45, 560, 'K V N VIKRAM', 'UNION BANK', '003110027001254', 'UBIN0800317', 'AENPV6824N', '2024-07-20 07:12:31'),
(46, 440, 'G.SATHISH REDDY', 'SBI', '20245208014', 'SBIN0017893', 'AYOPG1890L', '2024-07-20 08:45:18'),
(47, 561, 'MUDANGULA SRINIVAS', 'IDBI', '1057104000155151', 'IBKL0001057', 'ANYPM7279G', '2024-07-20 08:51:45'),
(48, 260, 'M PRAKASH', 'SBI', '20086127484', 'SBIN0011746', 'AHVPM4589L', '2024-07-20 08:55:32'),
(49, 566, 'Arvind Kumar Dundigalla', 'State Bank Of India', '30063795502', 'SBIN0004361', 'ABVPD6510G', '2024-07-21 08:24:02'),
(50, 570, 'P V PRAVEEN KUMAR', 'SBI', '42138065380', 'SBIN0020758', 'BDOPP2598E', '2024-07-21 09:03:41'),
(51, 572, 'Gugulothu Ravinaik', 'Sbi', '62251581893', 'SBIN002159', 'EFFPG9802A', '2024-07-22 02:48:53'),
(52, 562, 'Satya', 'HDFC', '50100434404321', 'HDFC0000368', 'AUMPK7235P', '2024-07-23 12:49:07'),
(53, 606, 'GORE VIJAY KUMAR', 'SBI', '62147188336', 'SBIN0020075', 'AQRPG1245J', '2024-07-25 06:34:56'),
(54, 393, 'Rakesh', 'KARUR VYSYA BANK', '12355666', 'KVBL0001446', 'AAICK5714A', '2024-07-27 08:26:34'),
(55, 609, 'shravan m', 'union bank', '123045678912', 'UBIN000074312', 'NNPS0054332', '2024-07-27 08:40:07'),
(56, 393, 'Rakesh', 'HDFC', '50100054958702', 'HDFC0002423', 'APOPN2963E', '2024-07-27 09:15:33'),
(57, 201, 'P VIJAY SEKHAR LIC POLICY', 'HDFC', '50100304027860', 'HDFC0000375', 'AZGPP2196K', '2024-07-28 11:43:56'),
(58, 615, 'Varaka Vishnu', 'STATE BANK OF INDIA', '34201429053', 'SBINOO10685', 'BMUPV5037K', '2024-07-28 14:53:36'),
(59, 616, 'dilip talluri', 'HDFC', '50100406136081', 'HDFC0004146', 'AGGPT6882P', '2024-07-28 14:54:09'),
(60, 612, 'Anitha', 'TS CO OPERATIVE BANK APEX', '990800360013098', 'TSAB0000108', 'EJZPK1897K', '2024-07-31 08:28:16'),
(61, 619, 'D.V RAGHAVA RAO', 'UNION BANK', '007610011375929', 'UBIN0800767', 'AENPD5263K', '2024-07-31 17:00:09'),
(62, 627, 'KORRA ANITHA', 'CANARA BANK', '30462010189046', 'CNRB0000616', 'DWPPK6102P', '2024-08-01 13:50:39'),
(63, 640, 'Venugopala Chary Arroju', 'IDBI Bank', '0446104000144254', 'Ibkl0000446', 'AEVPA4209E', '2024-08-05 05:42:28'),
(64, 647, 'ARUN RAJ DHARAMSUTH', 'BANK OF BARODA', '42170100004586', 'BARB0SANHYD', 'BJWPD3937K', '2024-08-05 10:24:17'),
(65, 629, 'POILA CHITTI BABU', 'IDFC', '10175647487', 'IDFB0080219', 'BIVPB0810P', '2026-01-20 13:16:26'),
(66, 657, 'JILLA ANJANEYULU', 'INDIAN BANK', '6527272973', 'IDIB000N172', 'AHHPJ9473C', '2024-08-09 06:58:40'),
(67, 611, 'Kumar Swamy', 'union bank', '257382922022', 'UBIN000074312', 'NNPS4554332', '2024-08-09 06:59:44'),
(68, 628, 'KURRA NARSIMHA', 'HDFC', '50200065262416', 'HDFC0009611', 'BGQPK6049C', '2024-08-09 07:07:01'),
(69, 659, 'Suresh Padavala', 'union bank', '257382922022', 'UBIN000074312', 'NNPS4554332', '2024-08-09 10:48:53'),
(70, 153, 'K.KOUSHIK KUMAR', 'Axis Bank', '918010110225910', 'UTIB0000027', 'CDOPK9305F', '2024-08-09 11:03:58'),
(71, 153, 'K.KOUSHIK KUMAR', 'Axis Bank', '918010110225910', 'UTIB0000027', 'CDOPK9305F', '2024-08-09 14:31:31'),
(72, 656, 'Madhukar.R', 'Bank of baroda', '57750100000766', 'BARB0QUTHBA', 'BNVPR2341N', '2024-08-13 08:05:13'),
(73, 246, 'RAYES SHOBHAN', 'HDFC', '50200026456171', 'HDFC0001228', 'AHKPY4701B', '2024-08-21 06:03:05'),
(74, 670, 'addmagpro.com', 'SBI', '64071466653', 'SBIN0040771', 'ADFPT6198J', '2024-08-30 12:42:08'),
(75, 701, 'Shamala yadagiri', 'SBI', '30220849347', 'SBIN0012739', 'CSBPS6632K', '2024-09-05 07:58:48'),
(76, 720, 'ADLURI SRIKANTH', 'AXIS BANK', '292010100003957', 'UTIB0000292', 'ABAPA0046K', '2024-09-12 13:23:06'),
(77, 748, 'Mohd Abdul Rahman', 'Canara bank', '30542600000364', 'CNRB0000033', 'AKWPR5706Q', '2024-10-02 06:41:23'),
(78, 748, 'Mohd Abdul Rahman', 'Canara bank', '30542600000364', 'CNRB0000033', 'AKWPR5706Q', '2024-10-02 06:41:42'),
(79, 756, 'Thota kishore', 'AXIS BANK', '008010101519523', 'UTIB0000008', 'AERPT5275R', '2024-10-05 07:59:52'),
(80, 149, 'G RAMBABU', 'Hdfc', '789965412236998', 'Xbbv0008548', 'Shhjjfv', '2024-10-05 14:51:02'),
(81, 767, 'Rajendraprasad martha', 'SBI', '32065922569', 'SBIN0007952', 'AHHPM1963A', '2024-10-11 12:09:26'),
(82, 258, 'K RAMANI', 'SBI', '62491103731', 'SBIN0021831', 'CGKPR0974C', '2024-10-23 05:12:46'),
(83, 785, 'Sathwik koochana', 'sbi', 'xxx', 'xxx', 'xxx', '2024-10-24 07:57:49'),
(84, 791, 'PRASHANTH CHIKKULAPALLY', 'HDFC BANK', '50100547050870', 'HDFC0007357', 'ARDPC5885D', '2024-10-29 07:47:24'),
(85, 791, 'PRASHANTH CHIKKULAPALLY', 'HDFC BANK', '50100547050870', 'HDFC0007357', 'ARDPC5885D', '2024-10-29 08:03:35'),
(86, 396, 'Ravi kiran', 'federal bank', '13320100091997', 'fdrl0001332', 'NNPPK45420', '2024-11-14 07:32:26'),
(87, 754, 'RAMAKRISHNA P', 'UNION BANK', '054310100030947', 'UBIN0805432', 'ACJPP5631P', '2024-11-20 06:57:02'),
(88, 857, 'Chenna Raju', 'UNION BANK', '50200065262416', 'UBIN0800317', 'AENPV6824N', '2024-11-25 06:54:21'),
(89, 836, 'YUGANDHAR TAMATAM', 'KOTAK MAHINDRA BANK', '3691234369', 'KKBK0007502', 'BBAPT4905P', '2024-11-26 10:59:03'),
(90, 868, 'A GOVARDHAN GOUD', 'BANK OF BARODA', '79260100009164', 'BARB0VJMIYA', 'DLWPG5991Q', '2024-11-28 17:31:19'),
(91, 874, 'Suresh', 'State Bank of India', '34672140145', 'SBIN0012945', 'GANPS4085L', '2024-11-30 07:38:05'),
(92, 832, 'Govardhani Kodavali', 'PUNJAB NATIONAL BANK', '4857000100035289', 'PUNB0485700', 'EQPPK7938Q', '2024-12-04 16:14:02'),
(93, 820, 'Gudelli Archana', 'Union Bank of India', '034822010000327', 'UBIN0903485', 'DTWPA1399N', '2024-12-04 16:19:00'),
(94, 249, 'TEMBERENI  ANIL', 'SBI', '20110021426', 'SBIN0003422', 'AMGPT8011Q', '2024-12-05 06:22:38'),
(95, 813, 'Srikanth', 'HDFC', '50100153932080', 'HDFC0009087', 'AWWPA4485F', '2024-12-08 16:05:43'),
(96, 605, 'Hemadrirao.P', 'Union Bank', '060710025053811', 'UBIN0813087', 'DKXPP1125F', '2024-12-14 04:49:49'),
(97, 880, 'Venugopal sirikonda', 'IDBI BANK', '0210104000059893', 'IBKL0000210', 'CJQPS6264K', '2024-12-15 02:25:09'),
(98, 1001, 'DURGA SRINIVASA RAO', 'SBI', '10725237273', 'SBIN0000847', 'ABVPD6623Q', '2024-12-18 16:47:47'),
(99, 838, 'Gajjelli Bhaskar', 'KOTAK MAHINDRA BANK', '4649-550742', 'KKBK0007488', 'BQVPG3211M', '2024-12-20 09:49:56'),
(100, 1025, 'KONIKI VEERANJANEYULU', 'SBI', '62054186933', 'SBIN0000915', 'BJHPK9364E', '2024-12-23 19:28:18'),
(101, 819, 'Suresh Yarraboina', 'Axis Bank', '915010040017394', 'UTIB0000289', 'AGNPY7586Q', '2025-01-03 12:57:34'),
(102, 1011, 'Sekhar mingi', 'SBI', '33129283954', 'SBIN0022110', 'BQWPM6614B', '2025-01-07 12:19:35'),
(103, 951, 'Mr Prem Raj', 'SBI', '39229187526', 'SBIN0011081', 'CAHPM9951K', '2025-01-17 08:02:29'),
(104, 873, 'Srinivasarao k', 'KOTAK MAHINDRA BANK', '765010179479', 'KkBK0007453', 'ALFPK5527L', '2025-01-30 10:59:44'),
(105, 825, 'RAMBABU D', 'Xxxx', 'Xxxx', 'Xxxx', 'Xxxx', '2025-02-07 11:06:52'),
(106, 1138, '9948180377', 'Kotak mahindra bank', '3046087486', 'KKBK0008379', '9948180377', '2025-02-22 15:47:31'),
(107, 1138, '9948180377', 'Kotak mahindra bank', '3046087486', 'KKBK0008379', '9948180377', '2025-02-22 15:49:04'),
(108, 1088, 'GANUGAPETA  SHARADA', 'SBI', '65294258512', 'SBIN0005153', 'CLUPG1151K', '2025-02-24 10:08:25'),
(109, 735, 'SKY SAY', 'Kotak Mahindra Bank', '0014256165', 'Kyjsjsksk78', 'AAZCS0733J', '2025-03-01 07:13:49'),
(110, 1168, 'C VENKATARAMANA REDDY', 'IDFC', '10204391022', 'IDFB00080218', 'AQQPR2240H', '2025-03-05 12:43:34'),
(111, 716, 'VAJID KHAN', 'SBI', '50200026456171', 'KVBL0001446', 'AFWPK8546E', '2025-05-05 12:13:49'),
(112, 1320, 'M SURESH KUMAR', 'State Bank of India', '20061036662', 'SBIN00018848', 'ABVPM2937N', '2025-06-11 11:41:52'),
(113, 1319, 'NIKKU BABU RAO', 'SBI', '35023290681', 'SBIN0001441', 'FYCPB3458J', '2025-06-12 03:18:31'),
(114, 1327, 'G V S Prasad', 'ICICI', '058801514249', 'ICIC0000588', 'AIVPG7348A', '2025-06-12 05:44:46'),
(115, 1156, 'M LAKSHMI NADH', 'HDFC', '50100067482911', 'HDFC0000696', 'AUWPM9917G', '2025-06-12 06:15:20'),
(116, 1333, 'Kanchi Rajendra Kumar', 'Indian Overseas Bank', '043301000454545', 'IOBA0003230', 'ACFPK6406R', '2025-06-12 13:35:03'),
(117, 1303, 'Annadatha Murali Manohar', 'ICICI', '038201536812', 'ICIC0000382', 'AHCPA8932E', '2025-06-12 18:16:27'),
(118, 1332, 'Ganji Eswaralingam', 'SBI', '38704005544', 'SBIN004275', 'AGGPG8975L', '2025-06-13 06:14:45'),
(119, 1342, 'S.lakashami', 'SBI', '34520352211', 'SBIN0006130', 'BJLPL7054G', '2025-06-13 10:23:54'),
(120, 1334, 'Vudatha Nagaraju', 'ICICIBANK', '777705211704', 'ICIC0002799', 'AGVPG6044M', '2025-06-16 16:05:03'),
(121, 1343, 'P santhi priya', 'Union bank of india', '065512010000140', 'UBIN0806552', 'DZDPP8294N', '2025-06-16 16:14:29'),
(122, 1348, 'A Hema Ch Venkata Kumar', 'HDFC Bank', '05451140154801', 'HDFC0004231', 'ADGPA3288F', '2025-06-16 16:27:12'),
(123, 1322, 'John William Myle', 'HDFC', '50200028418440', 'HDFC0001555', 'AIMPM3632L', '2025-06-16 16:33:08'),
(124, 1353, 'Dr M  kirankumar', 'PUNJAB NATIONAL BANK', '10912041012362', 'PUNB0109110', 'AXBPM5189L', '2025-06-19 07:48:54'),
(125, 225, 'GANGADHARAM PALLIPATTU', 'BANK OF BARODA', '30560100013761', 'BARB0KUKATP', 'AKJPP0114F', '2025-06-20 10:40:36'),
(126, 1326, 'K. Suresh kumar Goud', 'SBI', '62288584892', 'SBIN0021140', 'AVSPK7066K', '2025-06-26 07:57:36'),
(127, 1357, 'SHAIK YOUSUF JOHN', 'SBI', '62268935427', 'SBIN0020596', 'FBOPS6692J', '2025-06-26 16:15:18'),
(128, 1358, 'YAQOOB', 'SBI', '62268935427', 'SBIN0020596', 'FBOPS6692J', '2025-06-26 16:29:49'),
(129, 1450, 'G.SRINIVAS GOUD', 'Union Bank of India', '532102010054521', 'UBIN0552356', 'APIPG8575K', '2025-07-29 08:35:55'),
(130, 1449, 'Capt Uday Ratnalikar', 'SBI', '64045287767', 'SBIN0040950', 'AEUPR2338N', '2025-07-29 08:42:04'),
(131, 1451, 'G Swamy', 'SBI', '62417116149', 'SBIN0010097', 'BYRPG5081P', '2025-07-29 09:14:50'),
(132, 1398, 'Laxmiveeresh Marthi', 'SBI', '62361359592', 'SBIN0020095', 'BOHPM9717G', '2025-07-31 11:39:41'),
(133, 1409, 'Siva J', 'ICICI', '000405657876', 'icic0002366', 'AAJFJ7867R', '2025-08-03 14:54:10'),
(134, 1428, 'Narayana', 'SBI', '30120435227', 'SBIN0006300', 'ARXPG9681K', '2025-08-05 11:12:45'),
(135, 1472, 'TEMBARENI ANILKUMAR', 'STATE BANK OF INDIA', '20110021426', 'SBIN0003422', 'AMGPT8011Q', '2025-08-10 12:54:44'),
(136, 1476, 'Boini Mayuri', 'Canara Bank', '110235663582', 'CNRB0006653', 'CADPA5019G', '2025-08-12 07:34:46'),
(137, 1481, 'Sai Swathi Kalavala', 'KOTAK MAHINDRA BANK', '6445452442', 'KKBK0000565', 'BAWPK8542C', '2025-08-12 16:58:08'),
(138, 1439, 'HARINATH NEELA', 'INDUS', '100061493323', 'INDB0001493', 'ALEPH6323A', '2025-08-21 14:44:46'),
(139, 1380, 'NAVEEN KUMAR', 'HDFC', '50200026456171', 'HDFC0000375', 'CLUPG1151K', '2025-08-28 09:30:27'),
(140, 723, 'Bollam Hemanth', 'SBI', '65294258512', 'HDFC0000375', 'CLUPG1151K', '2025-09-02 15:18:44'),
(141, 1544, 'Shripuja', 'Oo', 'Oo', 'Oo', 'Oo', '2025-11-03 20:43:25'),
(142, 1555, 'Ambati Yellesh', 'AIRTEL PAYMENTS BANK', '9848728062', 'AIRP0000001', 'BKSPA6811J', '2025-11-19 10:16:43'),
(143, 1576, 'Kuraku Mallikarjuna Reddy', 'STATE BANK OF INDIA', '33427003627', 'SBIN0015970', 'GSQPK3938F', '2025-12-05 11:18:14'),
(144, 1655, 'Neela Mallesh Kurma', 'SBI', '62111772379', 'SBIN0020471', 'ALNPN4264B', '2025-12-25 09:55:07'),
(145, 1663, 'Kanmankalva Rajeshwar Goud', 'STATE BANK OF INDIA', '62252745875', 'SBIN0021394', 'CUTPK4658R', '2025-12-27 11:08:51'),
(146, 168, 'BUDHI SHARATH KUMAR', 'SBI', '41158597421', 'SBIN0021052', 'AOTPB3557J', '2026-01-02 10:25:46'),
(147, 1567, 'Dr SUBBA RAO', 'BANK OF INDIA', '862920110000156', 'BKID0008629', 'BALPS7458E', '2026-01-02 11:24:41'),
(148, 1659, 'Vision Board Ramesh', 'HDFC', '50100535305542', 'hdfc0000621', 'affpv1441n', '2026-01-02 13:21:39'),
(149, 860, 'R. Sriram Reddy', 'Kotak mahindra bank', '5612096311', 'KKBK0008356', 'Azopr5839h', '2026-01-03 11:37:19'),
(150, 1558, 'B SHIREESHA', 'Sbi', '40507829944', 'SBIN0005153', 'BTLPB1783L', '2026-01-09 16:23:01'),
(151, 1656, 'CH MALATHI', 'HDFC', '50100311034560', 'HDFC0000317', 'AJEPR0113Q', '2026-01-11 05:55:45'),
(152, 1006, 'G. Babugoud', 'CANARA BANK', '622110100117', 'CNRB0006221', 'BHLPB0293F', '2026-01-17 09:20:06'),
(153, 1730, 'MD KHAMRUDDIN', 'SBI', '30020023849', 'Sbin0001676', 'AHCPM5233E', '2026-01-18 06:05:12'),
(154, 1730, 'MD KHAMRUDDIN', 'SBI', '30020023849', 'Sbin0001676', 'AHCPM5233E', '2026-01-18 06:05:48'),
(155, 1844, 'Jagadish babu p', 'SBIsbi', '32168212338', 'SBIN0013271', 'AIXPP4588R', '2026-01-21 21:24:25'),
(156, 1697, 'GAGULOTH KRISHNA', 'Bank of Baroda', '32900100012014', 'BARB0ASRAON', 'APSPG0773K', '2026-02-10 06:04:21'),
(157, 1903, 'K Hymavathi', 'SBI BANK', '34552506083', 'SBIN002097', 'BYQPH8125N', '2026-02-10 09:35:40'),
(158, 1927, 'MUNASA VENKATA LAKSHMI DURGARAO', 'ICICI BANK', '067801504007', 'ICIC0000678', 'AXSPM2600D', '2026-02-10 17:36:16'),
(159, 2000, 'R GOPALA KRISHNA', 'SBI', '20003225808', 'SBIN0004156', 'AGVPR6416Q', '2026-02-21 07:10:53'),
(160, 1572, 'c.Bhavani Prasad', 'Union Bank', '115810100080757', 'UBIN0800333', 'BHYPC4229B', '2026-03-07 08:32:55'),
(161, 1733, 'MAHENDERKAR RAJESWARI', 'SBI', '62361075600', 'SBIN0021814', 'EOEPM9451R', '2026-03-07 08:53:56'),
(162, 1542, 'Y Nageshwar Rao', 'INDIAN BANK', '620636246', 'IDIB0005257', 'ADAPY4777F', '2026-03-10 04:31:59'),
(163, 1999, 'Aruna', 'SBI', '62386222138', 'SBIN0020070', 'CRYPA3887J', '2026-03-12 15:19:48'),
(164, 2054, 'Amrutha Reddy', 'Union Bank', '080210100188794', 'UBIN0808024', 'BAQPA9330L', '2026-03-19 04:15:43'),
(165, 1980, 'Dr. Jayarama Reddy Kummathi', 'Union Bank', '080210011006913', 'UBIN0808024', 'AHUPK8557D', '2026-03-19 04:20:22'),
(166, 2072, 'Venkat Allanki', 'IDDC', '10085430724', 'IDFB0080221', 'BKRPD4891E', '2026-03-20 14:54:01'),
(167, 1780, 'C MALLIKARJUN', 'SBI', '35290506944', 'SBIN0006854', 'BTAPC5184P', '2026-03-22 05:28:11'),
(168, 1677, 'Mididam MuralidharRao', 'SBI', '10442367927', 'Sbin0001676', 'ALVPM8959Q', '2026-03-31 03:35:41'),
(169, 1677, 'Mididam MuralidharRao', 'SBI', '10442367927', 'Sbin0001676', 'ALVPM8959Q', '2026-03-31 03:36:04'),
(170, 2095, 'Y UMA MAHESWAR RAO', 'HDFC BANK', '16331050013926', 'HDFC0000368', 'AGKPY3062E', '2026-04-05 11:16:51'),
(171, 2111, 'M rekha', 'State Bank of India', '40980632560', 'SBIN0020766', 'EWKPR2778Q', '2026-04-06 11:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_coupon_codes`
--

CREATE TABLE `user_coupon_codes` (
  `coupon_id` int NOT NULL,
  `user_id` int NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `status` enum('Active','Expired') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_coupon_codes`
--

INSERT INTO `user_coupon_codes` (`coupon_id`, `user_id`, `coupon_code`, `status`, `created_at`) VALUES
(2, 659, 'jkhj76', 'Expired', '2024-08-13 05:27:08'),
(3, 659, 'sures2', 'Expired', '2024-09-05 07:58:45'),
(4, 148, 'asdfg1', 'Expired', '2024-10-11 12:09:23'),
(5, 148, 'asra12', 'Expired', '2024-10-23 05:12:43'),
(6, 148, 'asdfg2', 'Expired', '2024-11-12 12:32:39'),
(7, 148, 'asdfg3', 'Expired', '2024-11-14 07:32:24'),
(8, 148, 'Asdfg4', 'Expired', '2024-11-25 06:54:18'),
(9, 148, 'asdfg5', 'Expired', '2024-11-26 10:58:59'),
(10, 148, 'asdfg6', 'Expired', '2024-11-28 17:31:15'),
(11, 148, 'asdfg7', 'Expired', '2024-12-04 16:13:58'),
(12, 148, 'asdfg8', 'Expired', '2024-12-04 16:18:56'),
(13, 148, 'asdfg9', 'Expired', '2024-12-05 06:22:34'),
(14, 148, 'Qwert1', 'Expired', '2024-12-20 09:49:52'),
(15, 148, 'Qwert2', 'Expired', '2024-12-18 16:47:43'),
(16, 148, 'suresh', 'Expired', '2025-01-03 12:57:29'),
(17, 836, 'Premji', 'Expired', '2025-01-17 08:02:25'),
(18, 836, 'Sekhar', 'Expired', '2025-01-07 12:19:32'),
(19, 148, 'cvredy', 'Expired', '2025-03-05 12:43:31'),
(20, 148, 'anadta', 'Expired', '2025-06-12 18:16:23'),
(21, 148, 'knnknn', 'Expired', '2025-06-11 11:41:48'),
(22, 148, 'bnikku', 'Expired', '2025-06-12 03:18:27'),
(23, 148, 'gvspra', 'Expired', '2025-06-12 05:44:42'),
(24, 148, 'lakshm', 'Expired', '2025-06-12 06:15:16'),
(25, 148, 'kanchi', 'Expired', '2025-06-12 13:34:59'),
(26, 148, 'eswara', 'Expired', '2025-06-13 06:14:41'),
(27, 148, 'slaxmi', 'Expired', '2025-06-13 10:23:50'),
(28, 148, 'vuduta', 'Expired', '2025-06-16 16:04:59'),
(29, 148, 'shanti', 'Expired', '2025-06-16 16:14:25'),
(30, 148, 'Avvary', 'Expired', '2025-06-16 16:27:07'),
(31, 148, 'jhonwi', 'Expired', '2025-06-16 16:33:04'),
(32, 148, 'drkirn', 'Expired', '2025-06-19 07:48:49'),
(33, 148, 'gangdr', 'Expired', '2025-06-20 10:40:32'),
(34, 148, 'Ksures', 'Expired', '2025-06-26 07:57:32'),
(35, 148, 'yousuf', 'Expired', '2025-06-26 16:15:14'),
(36, 148, 'shaiky', 'Expired', '2025-06-26 16:29:45'),
(37, 148, 'srinvs', 'Expired', '2025-07-29 08:35:51'),
(38, 148, 'ratnlk', 'Expired', '2025-07-29 08:42:00'),
(39, 148, 'Gorkha', 'Expired', '2025-07-29 09:14:46'),
(40, 148, 'veresh', 'Expired', '2025-07-31 11:39:38'),
(41, 148, 'jalasi', 'Expired', '2025-08-03 14:54:06'),
(42, 148, 'narayn', 'Expired', '2025-08-05 11:12:41'),
(43, 148, 'dranil', 'Expired', '2025-08-10 12:54:40'),
(44, 148, 'mayuri', 'Expired', '2025-08-12 07:34:43'),
(45, 148, 'swathi', 'Expired', '2025-08-12 16:58:04'),
(46, 148, 'harnth', 'Expired', '2025-08-21 14:44:41'),
(47, 148, 'gokulm', 'Expired', '2025-08-31 10:15:32'),
(48, 148, 'Naveen', 'Expired', '2025-08-31 10:19:51'),
(49, 148, 'Organc', 'Expired', '2025-08-31 10:23:25'),
(50, 150, 'Sathwk', 'Expired', '2025-09-02 13:47:05'),
(51, 150, 'Hemant', 'Expired', '2025-09-02 14:04:01'),
(52, 150, 'Organi', 'Expired', '2025-09-02 14:23:37'),
(53, 150, 'Na5858', 'Expired', '2025-09-02 14:31:34'),
(54, 150, 'My1234', 'Expired', '2025-09-02 14:39:03'),
(55, 148, 'swetha', 'Expired', '2025-09-03 07:27:41'),
(56, 148, 'yadgir', 'Expired', '2025-09-03 08:01:40'),
(57, 148, 'ravkmr', 'Expired', '2025-09-03 07:52:14'),
(58, 148, 'ligrdy', 'Expired', '2025-09-03 08:06:57'),
(59, 148, 'Prsnti', 'Expired', '2025-09-05 05:04:36'),
(60, 148, 'pothna', 'Expired', '2025-09-09 09:23:44'),
(61, 148, 'radhap', 'Expired', '2025-09-09 12:11:30'),
(62, 148, 'narsah', 'Expired', '2025-09-12 08:51:22'),
(63, 148, 'nisndr', 'Expired', '2025-09-12 08:56:24'),
(64, 148, 'cookwr', 'Active', '2025-09-12 08:49:15'),
(65, 148, 'msgoud', 'Expired', '2025-09-25 06:22:56'),
(66, 148, 'mallik', 'Expired', '2025-12-05 10:47:19'),
(67, 148, 'bhavan', 'Expired', '2025-12-05 11:10:48'),
(68, 148, 'global', 'Expired', '2025-12-18 03:54:28'),
(69, 148, 'krishn', 'Expired', '2025-12-22 08:37:10'),
(70, 148, 'viison', 'Expired', '2026-01-08 07:42:24'),
(71, 148, 'swapna', 'Expired', '2026-01-09 14:31:50'),
(72, 148, 'Thotak', 'Expired', '2026-03-11 12:23:17'),
(73, 148, 'Murali', 'Expired', '2026-03-01 12:53:39'),
(74, 148, 'drmura', 'Expired', '2026-03-03 03:10:52'),
(75, 148, 'Kanchn', 'Expired', '2026-03-04 13:20:12'),
(76, 148, 'mastan', 'Active', '2026-03-13 10:14:01'),
(77, 148, 'SMasta', 'Expired', '2026-03-13 16:12:13');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `vendor_id` int NOT NULL,
  `vendor_name` varchar(50) NOT NULL,
  `vendor_phone` varchar(10) DEFAULT NULL,
  `vendor_email` text,
  `password` text,
  `open_password` varchar(250) NOT NULL,
  `business_name` varchar(100) NOT NULL,
  `business_type` varchar(100) DEFAULT NULL,
  `business_address` varchar(200) DEFAULT NULL,
  `business_location` varchar(30) NOT NULL,
  `reference_id` varchar(14) NOT NULL,
  `reference_by` varchar(20) NOT NULL,
  `profile_image` varchar(255) NOT NULL DEFAULT 'assets/vendor_assets/images/user.png',
  `pancard_number` varchar(20) NOT NULL,
  `gst_number` varchar(15) NOT NULL,
  `commission_percentage` int NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `ifsc` varchar(20) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `vendor_wallet` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`vendor_id`, `vendor_name`, `vendor_phone`, `vendor_email`, `password`, `open_password`, `business_name`, `business_type`, `business_address`, `business_location`, `reference_id`, `reference_by`, `profile_image`, `pancard_number`, `gst_number`, `commission_percentage`, `bank_name`, `account_number`, `ifsc`, `status`, `vendor_wallet`, `created_at`) VALUES
(37, 'Admin Vendor', '9704411784', 'adminvendor343@gmail.com', '$2y$10$9x8xDjdahyya8NNM9N6r4.x44m9A5PzHJfIMINGk3MsQ.Y0v7mJ7S', '', 'Home Products', 'Products', 'Ameerpet', '', 'admin', 'admin', 'assets/vendor_assets/images/user.png', 'NNPPS6868R', '78932645', 0, '', '', '', 'Rejected', 28221, '2024-05-29 10:08:16'),
(38, 'SATHWIK K', '8522881144', 'koochanakumar39@gmail.com', '$2y$10$4SB2idMypA/61Xt9CiezregLQaPss97bkUV.kfkeqLrx4rckGfHoy', '', 'LIC', 'POLICYS', 'HYDERABAD', '', '8522881144', '7702381784', 'assets/vendor_assets/images/user.png', 'DLZPK8211G', '4445651S', 0, '', '', '', 'Approved', 0, '2024-05-29 16:02:41'),
(40, 'KISHAN RAO', '9490534100', 'KISHANRAO@GMAIL.COM', '$2y$10$7TrJJIp7xKPxxixk4IbDvuI66q42SSBGI5.HkUwQKcQnc5RYjwx.u', '', 'AUTHER', 'PUBLISHER', '3-56  VILL SAIDAPUR', 'HUZURABAD', '9490534100', '7702381784', 'assets/vendor_assets/images/user.png', 'AFWPK8546E', '123456789123456', 45, 'HDFC', '2236110000054', 'HDFC0002236', 'Approved', 0, '2024-06-06 08:09:29'),
(41, 'Sobhan', '9912156698', 'sobhurao473@gmail.com', '$2y$10$Gz.nD1i2KasppEwlJ2.z.euPHSECDjlQu/2RKA6Mn2aZYVANr08dC', '', 'Raye health Sciences', 'Marketing', 'Hyderabad', '402,Svss Nivas,Sanath Nagar', '9912156698', '7702381784', 'assets/vendor_assets/images/user.png', 'HXAPK7925S', '36AAICR3712PIZY', 50, 'HDFC', '50200026456171', 'HDFC0001228', 'Approved', 0, '2024-06-06 11:21:46'),
(42, 'PARVATHI', '9959210662', 'vemulaparvathi22@gmail.com', '$2y$10$oEGzq.XqRsD9B6Rlrb4ncOoLgjNDWBE4jTvTaT2Kd0yDSB6l.eDaa', '', 'parvathi saree house', 'retail', '11/19/28,kashibugga', 'WARANGAL', '9959210662', '7702381784', 'assets/vendor_assets/images/user.png', 'ARFPV7413A', '123456789123457', 40, 'UNION BANK', '129210100068214', 'UBIN0001292', 'Approved', 0, '2024-06-25 04:36:41'),
(43, 'ADDMAGPRO', '8522852201', 'ADDMAGPRO@GMAIL.COM', '$2y$10$NGITOg8fyzwGp6R61nLvg.yA2CucnbAcpYLacoTaCf3sapol.zm22', '', 'CONTRY CLUB', 'SERVICE', 'HYDERABAD', 'HYDERABAD', '8522852201', 'admin', 'assets/vendor_assets/images/user.png', 'AAICK5714A', '36AAICK5714A1ZU', 40, 'KARUR VYSYA BANK', '1446135000012589', 'KVBL0001446', 'Approved', 0, '2024-06-26 03:40:17'),
(44, 'KOOCHANA HOLIDAYS', '8522852201', 'koochanaholidays@gmail.com', '$2y$10$wDR7OM6SvXQ7fjloslJBZu3E.BR41.JcM3jl1McZ6mybyn69wQ3wu', '', 'TRAVELS', 'TRAVELLER', 'HYDERABAD', 'HYDERABAD', '8522852201', 'admin', 'assets/vendor_assets/images/user.png', 'AAICK5714A', '36AAICK5714A1ZU', 40, 'KARUR VYSYA BANK', '1446135000012589', 'KVBL0001446', 'Approved', 0, '2024-06-26 10:17:39'),
(45, 'SATHWIK K', '8522881144', 'koochanakumar39best@gmail.com', '$2y$10$NoX6/GzDpTCm7PQP8Sw0aOlJW0Bbf8OOdKqeoloUb.pHOYFCWELKO', '', 'BEST CARE', 'HEALTH CARDS', 'HYDERABAD', 'HYDERABAD', '8522881144', 'admin', 'assets/vendor_assets/images/user.png', 'DLZPK8211G', '123456789123458', 40, 'UNION BANK', '129210100068214', 'UBIN0001292', 'Approved', 0, '2024-06-26 10:54:34'),
(46, 'SRINIVAS D', '9154675146', 'srini@ezykle.com', '$2y$10$.Rj1BRyrxGnNvtCMVzrR0e0p7UNoHLJWiChun28HCQpOhRz8SuW9O', '', 'E ZYKLE', 'RETAILER', 'HYDERABAD', 'HYDERABAD', '9154675146', 'admin', 'assets/vendor_assets/images/user.png', 'AAHCE5535E', '36AAHCE5535E1ZQ', 40, 'ICICI', '180405007964', 'ICIC0001804', 'Approved', 0, '2024-06-26 12:35:04'),
(47, 'CH.RAJESH', '9963001165', 'jayahearingcenters@gmail.com', '$2y$10$tj.OMHPFT0iFtUelCkjtO.EEbz3uSoEwmfQLSwfu96EC0WjcO5PZC', '', 'JAYA HEARING CARE CENTRE', 'RETAIL', '7-1-313,BESIDE HANUMAN TEMPLE NEW BUS STAND ROAD HANAMAKONDA', 'HANAMAKONDA', '9963001165', 'admin', 'assets/vendor_assets/images/user.png', 'AIYPC8359C', '36AIYPC8359C1ZV', 40, 'CANARA BANK', '125001898351', 'CNRB0002450', 'Approved', 0, '2024-07-04 03:15:21'),
(48, 'ADDMAGPRO', '8522852201', 'koochanabenefits@gmail.com', '$2y$10$rXzHOePAw11YN2u3nAomUebF94bIE8/9gi8Rj93c2.c1BqAblpyIW', '', 'SUPPLIMENTS', 'RETAIL', 'HYDERABAD', 'AMEERPET', '8522852201', 'admin', 'assets/vendor_assets/images/user.png', 'AAICK5714A', '36AAICK57141ZU', 40, 'KARUR VYSYA BANK', '1446135000012589', 'KVBL0001446', 'Approved', 0, '2024-07-09 14:51:07'),
(49, 'Hasan farista', '9390100190', 'samfarista@gmail.com', '$2y$10$mhTJhOdEADvjt1SVC3x/hu6XRljauejcCSIb37nGXvcAKPXILRZhu', '', 'Sam\'s automobiles', 'Retail', '7-7-369 mulugu road opp Omega hospital', 'Warangal', '9390100190', '7702381784', 'assets/vendor_assets/images/user.png', 'ACFPK6258F', '36ACFPK6258F1ZJ', 40, 'HDFC bank', '99909390100190', 'Hdfc0002096', 'Approved', 0, '2024-07-15 07:37:39'),
(50, 'Biovivasvaa Ayurveda', '7680808999', 'akheeradc@gmail.com', '$2y$10$HDl/lhbyEMV7nBOPWFwyDOa3jPkkAOhpFd5CWueBlOovqeswSTdX6', 'Kmsrp0s@', 'Biovivasvaa Ayurveda', 'Ayurveda', 'Kukatpally', 'Kukatpally', '7680808999', '7702381784', 'assets/vendor_assets/images/user.png', 'DMUPP7040E', '36DMUPP7040E', 50, 'SBI', '38199808485', 'SBIN0011659', 'Approved', 0, '2024-07-26 06:30:43'),
(52, 'Narlapuram Rohith kumar', '9700257319', 'narlapuramrohith@gmail.com', '$2y$10$RSq2PDUoj1A6TA/KZQ6NGe6k/XbM1TvX8WsUyv5JJUTvAqpdd.hna', '9700257319', 'INDIPUNK', 'Fashion', '14-1-88/2/38,flat no.101', 'Hyderabad', '9700257319', '8522881144', 'assets/vendor_assets/images/user.png', 'GATPR7398M', 'GATPR7398M1Z6', 50, 'HDFC bank', '50200079762761', 'HDFC0003974', 'Approved', 0, '2024-08-06 09:18:34'),
(54, 'koushik kumar', '9666386006', 'koushikkoochana@gmail.com', '$2y$10$d3W6H6EBlxoYC9eHK8rfCuVG0XVb0/w/Ct/QKIzX5Iih3Hpx47sTy', '9666386006', 'GENARAL insurence', 'insurence', 'HYDERABAD', 'AMEERPET', '9666386006', 'admin', 'assets/vendor_assets/images/user.png', 'CDOPK9305F', '36CDOPK9305F1ZU', 40, 'SBI', '32738730340', 'SBIN0016293', 'Approved', 0, '2024-08-09 16:59:19'),
(55, 'ROUTHU MADHUKAR', '9441226834', 'aksharamadhuguru@gmail.com', '$2y$10$GIlxogsqbgfufyjqEHbezODVTaKu2UZl31l9TUYnEzBKjxS4Q5WIO', '9441226834', 'MADHUGURU SERVICES', 'EDUCATION', 'HYDERABAD', 'HYDERABAD', '9441226834', 'admin', 'assets/vendor_assets/profile_images/55/66bb1283a7d35.IMG-20200421-WA0002.jpg', 'BNVPR4321N', '36BNVPR4321N1ZU', 40, 'INDIAN BANK', '7470118631', 'IDIB000S457', 'Approved', 0, '2024-08-12 15:30:20'),
(56, 'Akinapally Ranjith', '9700861430', 'ranjithakinapally@gmail.com', '$2y$10$YTUU7OdewV3zmrGw1HmjwOsyVnEdx7ZXnVRrKa7uzGzAnPX6Yqsvm', '123456', 'SUPER MARKET HUZURABAD', 'Super market', 'Opp hanuman temple', 'Huzurabad', '9700861430', 'admin', 'assets/vendor_assets/images/user.png', 'AUMPA7195G', '36AUMPA7195G', 40, 'State bank of india', '31081572586', 'SBIN0020143', 'Approved', 0, '2024-09-24 06:47:43'),
(57, 'Syed Faruq Ali', '9347666333', 'syed666333@gmail.com', '$2y$10$CZY418Hsgdn3Vo2uglEyVelbrXLl0cRuswXN1ufPSX9LJHdsJACRa', 'abc@123456', 'NICE Tecnologys', 'Service', '124/3, Moosharam Bhag', 'Malak Pet', '9347666333', '7702381784', 'assets/vendor_assets/images/user.png', 'BCBPS4802E', 'BCBPS4802E', 40, 'Bank of Baroda', '33368100000001', 'BARB0VJDILS', 'Approved', 0, '2024-11-29 15:30:12'),
(58, 'Add Business Group', '8522881144', 'abn2024network@gmail.com', '$2y$10$pLPqEL4UgseSNNnDQADBi.zSYly3cPTVuPG9qA571axDgfrR2899u', '8522881144', 'ADD BUSINESS GROUP', 'NETWORK MEETING', 'Flat no 501,Thirumala shah residency', 'Hyderabad', '8522881144', 'admin', 'assets/vendor_assets/images/user.png', 'XXXXXXXXXX', 'xxxx', 40, 'sbi', 'xxx', 'xxx', 'Approved', 0, '2024-12-02 05:50:59'),
(59, 'addmagpro.com', '8522852201', 'printpramotion@gmail.com', '$2y$10$SmAAbVeaaXq5k8v/erCjGubwwlAy6191eqfKnTj6HxvfjN/ww01bu', '558338', 'DEMO TENTS', 'Print Pramotion', 'HYDERABAD', 'HYDERABAD', '8522852201', 'admin', 'assets/vendor_assets/images/user.png', 'AHKPY4701B', '36CDOPK9305F1ZX', 40, 'KARUR VYSYA BANK', '1446135000012589', 'KVBL0001446', 'Approved', 0, '2024-12-02 16:05:51'),
(60, 'Govardhani Kodavali', '7674045621', 'haniisdesignerstudio1@gmail.com', '$2y$10$xaJJt86pinDeMmrllV6G2ujY7QWoJ0P6kFOs13V8VGpP.ZvDuQOQ.', 'gova3325', 'Haniis Designer studio', 'Boutique and training center', 'Gokul plots kphb 9th phase', 'Hyderabad', '7674045621', '7702381784', 'assets/vendor_assets/images/user.png', 'EQPPK7938Q', '36EQPPK7938Q1ZK', 40, 'Punjab National Bank', '4857000100035289', 'PUNB0485700', 'Approved', 0, '2024-12-14 09:38:43'),
(63, 'K.Surya Babu', '9154704002', 'info@wavpe.com', '$2y$10$yoxDjCrciuLm6zQjeTywq.C6uEtftCifb5DytJ4bUpSG1k9XdblFG', 'Chakra@2017', 'Wavpe', 'Digital Visiting Card', '3rd Floor, Gowri Arcade, HIG-A-85, Jayabheri Enclave, Gachibowli, Hyderabad, Telangana 500032', 'Hyderabad', '9154704002', 'admin', 'assets/vendor_assets/images/user.png', 'AAGCC8626F', '36AAGCC8626F1ZL', 40, 'Federal Bank', '23780200001154', 'FDRL0002378', 'Rejected', 0, '2024-12-27 07:17:47'),
(65, 'Alagani Foods', '9032325232', 'alagani.foods@gmail.com', '$2y$10$7WHTFp.7zuHD3na5blvI5u5k0smMd4Y.Tky2oMeUhpALQfZEdrHZ.', '123456', 'Alagani Food', 'Manufacturing', '#42-518/1/1 ChaiPani Street', 'Moulali', '9032325232', '7702381784', 'assets/vendor_assets/images/user.png', 'AAPFA3716L', '36AAPFA3716L2Z5', 40, 'BANK OF BARODA', '05120500000048', 'BARBOSECUND', 'Approved', 0, '2025-09-02 13:12:49'),
(66, 'Y.DURGAPRASAD', '9014034105', 'iamobazaar2021@gmail.com', '$2y$10$F91tPUL.ujntyeXFxE29NO56WYD3hPb1eFpiLi9qKHKT6myYAIZWW', 'prasad@944440', 'General kirana store', 'General kirana store', '9-5-200, vittal Nagar, Godavarikhani', 'Godavarikhani', '9014034105', '9848489720', 'assets/vendor_assets/images/user.png', 'AEIPY3896E', '686233956981', 40, 'State Bank of India', '43249720346', 'SBIN0020956', 'Pending', 0, '2026-01-31 06:13:45'),
(67, 'K MANOJ KUMAR', '9100115604', 'askenterprises0917@gmail.com', '$2y$10$EtV/qJ1EChrJgpKOxaYqLe.IvJp.yBtIVFxrk3g0z3eX4m1m37/6y', 'askenterprises', 'ASK ENTERPRISES', 'RETAIL', 'GAJULARAMARAM', 'HYDERABAD', '9100115604', '8522881144', 'assets/vendor_assets/images/user.png', 'CZEPK3893G', '36CZEPK3893G2Z1', 40, 'AXIS', '922020001628079', 'UTIB0000027', 'Pending', 0, '2026-03-13 09:32:13');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_banners`
--

CREATE TABLE `vendor_banners` (
  `vendor_banner_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `ImageURL` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vendor_banners`
--

INSERT INTO `vendor_banners` (`vendor_banner_id`, `vendor_id`, `ImageURL`, `created_at`) VALUES
(4, 37, 'assets/vendor_assets/vendor_banner/667bf2248c56b.back2back offer.png', '2024-06-26 10:49:09'),
(5, 38, 'assets/vendor_assets/vendor_banner/667ce40d97229.insurance vendor.png', '2024-06-27 04:01:17'),
(7, 40, 'assets/vendor_assets/vendor_banner/6661774300909.11.png', '2024-06-06 08:45:55'),
(8, 41, 'assets/vendor_assets/vendor_banner/6661a565e9f47.213.png', '2024-06-06 12:02:45'),
(9, 42, 'assets/vendor_assets/vendor_banner/667a5c03a47eb.Parvathi sarees.png', '2024-06-25 05:56:19'),
(10, 43, 'assets/vendor_assets/vendor_banner/667d4073ca897.country club.png', '2024-06-27 10:35:31'),
(11, 44, 'assets/vendor_assets/vendor_banner/667beaea8dce0.WhatsApp Image 2024-06-26 at 15.07.21.jpeg', '2024-06-26 10:18:18'),
(12, 45, 'assets/vendor_assets/vendor_banner/667bf3ac55f1a.1.jpg', '2024-06-26 10:55:40'),
(13, 46, 'assets/vendor_assets/vendor_banner/667cdf68641e1.EZykle vendor.png', '2024-06-27 03:41:28'),
(14, 47, 'assets/vendor_assets/vendor_banner/66863d6b5a4db.jaya b.jpg', '2024-07-04 06:12:59'),
(15, 48, 'assets/vendor_assets/vendor_banner/668d4e8aedfd0.WELLNESS.png', '2024-07-09 14:51:54'),
(16, 49, 'assets/vendor_assets/vendor_banner/6697740a3c01d.sam1.jpeg', '2024-07-17 07:34:34'),
(18, 50, 'assets/vendor_assets/vendor_banner/66b084ad62df7.BioVivasvaA.png', '2024-08-05 07:52:13'),
(19, 52, 'assets/vendor_assets/vendor_banner/66b1eb3c628c6.imp.jpg', '2024-08-06 09:22:04'),
(21, 54, 'assets/vendor_assets/vendor_banner/66b6d43d9fc44.general-insurance-1704357882882.jpg', '2024-08-10 02:45:17'),
(22, 55, 'assets/vendor_assets/vendor_banner/66bb0789d6493.1.jpg', '2024-08-13 07:13:13'),
(24, 57, 'assets/vendor_assets/vendor_banner/678385e87a57a.1B1BA59473A4F700427817157EF0F326B11F8318', '2025-01-12 09:05:44'),
(25, 58, 'assets/vendor_assets/vendor_banner/674d4f8e43043.ABG Vender.png', '2024-12-02 06:11:26'),
(26, 59, 'assets/vendor_assets/vendor_banner/674ddaf725dfc.Print and More.png', '2024-12-02 16:06:15'),
(27, 60, 'assets/vendor_assets/vendor_banner/675dab0261f9f.vender image.png', '2024-12-14 15:57:54'),
(30, 63, 'assets/vendor_assets/vendor_banner/676e552538c99.WP Logo.jpg', '2024-12-27 07:20:05'),
(32, 65, 'assets/vendor_assets/vendor_banner/68b6ef91b6d8f.WhatsApp Image 2025-09-02 at 6.51.32 PM.jpeg', '2025-09-02 13:22:25'),
(33, 66, 'assets/vendor_assets/vendor_banner/6656f46a71a68.vendor_banner_common.jpg', '2026-01-31 06:13:45'),
(34, 67, 'assets/vendor_assets/vendor_banner/69b3ec222104d.Blue Simple Car Wash Instagram Post.png', '2026-03-13 10:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_withdraw_requests`
--

CREATE TABLE `vendor_withdraw_requests` (
  `request_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `user_id` int NOT NULL,
  `vendor_name` varchar(200) NOT NULL,
  `mobile_number` varchar(13) NOT NULL,
  `withdraw_amount` bigint NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vendor_withdraw_requests`
--

INSERT INTO `vendor_withdraw_requests` (`request_id`, `vendor_id`, `user_id`, `vendor_name`, `mobile_number`, `withdraw_amount`, `status`, `created_at`) VALUES
(1, 3, 753, 'Vijetha Madhapur', '8520086300', 200, 'approved', '2024-10-01 11:08:32'),
(3, 3, 753, 'Vijetha Madhapur', '8520086300', 10, 'pending', '2024-10-01 11:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_products`
--

CREATE TABLE `wishlist_products` (
  `wishlist_id` int NOT NULL,
  `service_user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `wishlist_products`
--

INSERT INTO `wishlist_products` (`wishlist_id`, `service_user_id`, `product_id`, `created_at`) VALUES
(3, 4, 2, '2024-04-29 02:27:35'),
(4, 14, 7, '2024-05-05 16:29:55'),
(5, 14, 25, '2024-05-05 16:56:21'),
(6, 341, 21, '2024-06-02 02:37:12'),
(7, 148, 21, '2024-06-05 09:01:57'),
(8, 392, 8, '2024-06-14 11:16:36'),
(9, 152, 25, '2024-06-15 14:22:53'),
(10, 278, 7, '2024-06-17 03:23:23'),
(11, 400, 1, '2024-06-19 02:15:20'),
(12, 429, 211, '2024-07-01 05:05:42'),
(13, 490, 206, '2024-07-07 04:33:21'),
(15, 267, 75, '2024-08-15 16:22:31'),
(16, 701, 253, '2024-09-04 16:40:08'),
(17, 267, 206, '2024-09-19 06:49:37'),
(18, 738, 319, '2024-09-26 07:28:17'),
(19, 779, 319, '2024-10-23 07:59:21'),
(20, 809, 253, '2024-11-18 18:03:24'),
(21, 822, 242, '2024-11-19 15:06:27'),
(22, 716, 319, '2024-11-29 08:37:10'),
(23, 148, 513, '2025-02-02 13:25:32'),
(24, 150, 513, '2025-02-14 10:24:02'),
(25, 716, 513, '2025-05-05 12:23:30'),
(26, 1233, 513, '2025-05-19 14:18:06'),
(27, 1257, 50, '2025-06-02 15:40:32'),
(28, 1278, 513, '2025-06-03 09:42:08'),
(29, 1364, 494, '2025-07-19 03:56:41'),
(30, 1663, 513, '2026-01-07 13:01:49'),
(31, 1860, 513, '2026-01-24 15:46:25'),
(32, 1787, 513, '2026-01-31 08:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawalrequests`
--

CREATE TABLE `withdrawalrequests` (
  `RequestID` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `RequestDate` datetime DEFAULT NULL,
  `Status` enum('pending','approved','rejected') DEFAULT NULL,
  `CompletionDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `withdrawalrequests`
--

INSERT INTO `withdrawalrequests` (`RequestID`, `UserID`, `Amount`, `Currency`, `PaymentMethod`, `RequestDate`, `Status`, `CompletionDate`) VALUES
(10, 150, 100.00, NULL, NULL, '2024-08-08 09:07:01', 'rejected', '2024-08-09 12:27:59'),
(11, 148, 320.00, NULL, NULL, '2024-08-08 17:49:26', 'rejected', '2024-08-09 12:28:36'),
(12, 150, 100.00, NULL, NULL, '2024-08-09 12:30:29', 'rejected', '2024-08-09 12:32:10'),
(13, 150, 220.00, NULL, NULL, '2024-08-09 12:31:18', 'rejected', '2024-08-09 12:32:17'),
(14, 246, 244.00, NULL, NULL, '2024-10-25 13:36:14', 'pending', NULL),
(15, 150, 500.00, NULL, NULL, '2025-09-02 10:31:00', 'approved', '2026-01-10 05:59:37'),
(16, 150, 1000.00, NULL, NULL, '2026-01-09 08:48:56', 'rejected', '2026-01-10 06:00:25'),
(17, 1572, 242.00, NULL, NULL, '2026-03-07 11:05:01', 'pending', NULL),
(18, 1572, 12.00, NULL, NULL, '2026-03-25 06:41:37', 'pending', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_users`
--
ALTER TABLE `active_users`
  ADD PRIMARY KEY (`active_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads_banners`
--
ALTER TABLE `ads_banners`
  ADD PRIMARY KEY (`ads_banner_id`);

--
-- Indexes for table `backtwoback_wallet`
--
ALTER TABLE `backtwoback_wallet`
  ADD PRIMARY KEY (`wallet_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_listing_users`
--
ALTER TABLE `business_listing_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classifieds`
--
ALTER TABLE `classifieds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_wallet`
--
ALTER TABLE `commission_wallet`
  ADD PRIMARY KEY (`wallet_id`);

--
-- Indexes for table `customer_ordered_products`
--
ALTER TABLE `customer_ordered_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_store_purchases`
--
ALTER TABLE `discount_store_purchases`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indexes for table `discount_vendors`
--
ALTER TABLE `discount_vendors`
  ADD PRIMARY KEY (`vendor_id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `events_banners`
--
ALTER TABLE `events_banners`
  ADD PRIMARY KEY (`event_banner_id`);

--
-- Indexes for table `franchises`
--
ALTER TABLE `franchises`
  ADD PRIMARY KEY (`franchise_id`);

--
-- Indexes for table `gadget_gallery`
--
ALTER TABLE `gadget_gallery`
  ADD PRIMARY KEY (`gadget_gallery_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Indexes for table `home_page_headings`
--
ALTER TABLE `home_page_headings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycverification`
--
ALTER TABLE `kycverification`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `orders_list`
--
ALTER TABLE `orders_list`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `pin_system`
--
ALTER TABLE `pin_system`
  ADD PRIMARY KEY (`pin_system_id`);

--
-- Indexes for table `pool_commision_wallet`
--
ALTER TABLE `pool_commision_wallet`
  ADD PRIMARY KEY (`wallet_id`);

--
-- Indexes for table `productsboughtbyusers`
--
ALTER TABLE `productsboughtbyusers`
  ADD PRIMARY KEY (`PurchaseID`);

--
-- Indexes for table `products_list`
--
ALTER TABLE `products_list`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_wallet`
--
ALTER TABLE `product_wallet`
  ADD PRIMARY KEY (`wallet_id`);

--
-- Indexes for table `purchase_wallet`
--
ALTER TABLE `purchase_wallet`
  ADD PRIMARY KEY (`wallet_id`);

--
-- Indexes for table `reward_wallet`
--
ALTER TABLE `reward_wallet`
  ADD PRIMARY KEY (`wallet_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `servicesusers`
--
ALTER TABLE `servicesusers`
  ADD PRIMARY KEY (`SubscriptionID`);

--
-- Indexes for table `service_users`
--
ALTER TABLE `service_users`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `speciality_store_images`
--
ALTER TABLE `speciality_store_images`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`StoreID`);

--
-- Indexes for table `users_commission_wallets`
--
ALTER TABLE `users_commission_wallets`
  ADD PRIMARY KEY (`wallet_id`);

--
-- Indexes for table `user_bank_details`
--
ALTER TABLE `user_bank_details`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `user_coupon_codes`
--
ALTER TABLE `user_coupon_codes`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`vendor_id`);

--
-- Indexes for table `vendor_banners`
--
ALTER TABLE `vendor_banners`
  ADD PRIMARY KEY (`vendor_banner_id`);

--
-- Indexes for table `vendor_withdraw_requests`
--
ALTER TABLE `vendor_withdraw_requests`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `wishlist_products`
--
ALTER TABLE `wishlist_products`
  ADD PRIMARY KEY (`wishlist_id`);

--
-- Indexes for table `withdrawalrequests`
--
ALTER TABLE `withdrawalrequests`
  ADD PRIMARY KEY (`RequestID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active_users`
--
ALTER TABLE `active_users`
  MODIFY `active_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `ads_banners`
--
ALTER TABLE `ads_banners`
  MODIFY `ads_banner_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `backtwoback_wallet`
--
ALTER TABLE `backtwoback_wallet`
  MODIFY `wallet_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `banner_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `business_listing_users`
--
ALTER TABLE `business_listing_users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `cart_products`
--
ALTER TABLE `cart_products`
  MODIFY `cart_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=819;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `classifieds`
--
ALTER TABLE `classifieds`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `commission_wallet`
--
ALTER TABLE `commission_wallet`
  MODIFY `wallet_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201640;

--
-- AUTO_INCREMENT for table `customer_ordered_products`
--
ALTER TABLE `customer_ordered_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `discount_store_purchases`
--
ALTER TABLE `discount_store_purchases`
  MODIFY `purchase_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `discount_vendors`
--
ALTER TABLE `discount_vendors`
  MODIFY `vendor_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `district_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=601;

--
-- AUTO_INCREMENT for table `events_banners`
--
ALTER TABLE `events_banners`
  MODIFY `event_banner_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `franchises`
--
ALTER TABLE `franchises`
  MODIFY `franchise_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gadget_gallery`
--
ALTER TABLE `gadget_gallery`
  MODIFY `gadget_gallery_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `home_page_headings`
--
ALTER TABLE `home_page_headings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kycverification`
--
ALTER TABLE `kycverification`
  MODIFY `userid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders_list`
--
ALTER TABLE `orders_list`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pin_system`
--
ALTER TABLE `pin_system`
  MODIFY `pin_system_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pool_commision_wallet`
--
ALTER TABLE `pool_commision_wallet`
  MODIFY `wallet_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `productsboughtbyusers`
--
ALTER TABLE `productsboughtbyusers`
  MODIFY `PurchaseID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products_list`
--
ALTER TABLE `products_list`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=690;

--
-- AUTO_INCREMENT for table `product_wallet`
--
ALTER TABLE `product_wallet`
  MODIFY `wallet_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchase_wallet`
--
ALTER TABLE `purchase_wallet`
  MODIFY `wallet_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_wallet`
--
ALTER TABLE `reward_wallet`
  MODIFY `wallet_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `servicesusers`
--
ALTER TABLE `servicesusers`
  MODIFY `SubscriptionID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_users`
--
ALTER TABLE `service_users`
  MODIFY `service_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147;

--
-- AUTO_INCREMENT for table `speciality_store_images`
--
ALTER TABLE `speciality_store_images`
  MODIFY `store_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `state_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `StoreID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `users_commission_wallets`
--
ALTER TABLE `users_commission_wallets`
  MODIFY `wallet_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_bank_details`
--
ALTER TABLE `user_bank_details`
  MODIFY `bank_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `user_coupon_codes`
--
ALTER TABLE `user_coupon_codes`
  MODIFY `coupon_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `vendor_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `vendor_banners`
--
ALTER TABLE `vendor_banners`
  MODIFY `vendor_banner_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `vendor_withdraw_requests`
--
ALTER TABLE `vendor_withdraw_requests`
  MODIFY `request_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist_products`
--
ALTER TABLE `wishlist_products`
  MODIFY `wishlist_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `withdrawalrequests`
--
ALTER TABLE `withdrawalrequests`
  MODIFY `RequestID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
