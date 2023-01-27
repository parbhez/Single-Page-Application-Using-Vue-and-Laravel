-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2022 at 03:12 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vue-spa`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(3) NOT NULL,
  `created_by` int(5) DEFAULT NULL,
  `updated_by` int(5) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'News', 0, 0, 0, '2022-10-01 09:14:01', NULL),
(2, 'International', 0, 0, 0, '2022-10-01 09:14:01', NULL),
(3, 'dasvas', 1, NULL, NULL, '2022-10-01 06:17:24', '2022-10-01 06:17:24'),
(4, 'vasdf', 1, NULL, NULL, '2022-10-01 06:17:24', '2022-10-01 06:17:24'),
(5, 'dfagag', 1, NULL, NULL, '2022-10-02 00:20:05', '2022-10-02 00:20:05'),
(6, 'vasdfa', 1, NULL, NULL, '2022-10-02 00:20:05', '2022-10-02 00:20:05'),
(7, 'ghsdhs', 1, NULL, NULL, '2022-10-02 00:21:50', '2022-10-02 00:21:50'),
(8, 'gfsa', 1, NULL, NULL, '2022-10-02 00:22:32', '2022-10-02 00:22:32'),
(9, 'fdba', 1, NULL, NULL, '2022-10-02 00:22:32', '2022-10-02 00:22:32'),
(10, 'masud  parbhez', 1, NULL, NULL, '2022-10-02 03:27:13', '2022-10-02 03:27:13'),
(11, 'dfa', 1, NULL, NULL, '2022-10-02 05:23:28', '2022-10-02 05:23:28'),
(12, 'fatema', 1, NULL, NULL, '2022-10-02 05:24:01', '2022-10-02 05:24:01'),
(13, 'gsdh', 1, NULL, NULL, '2022-10-02 05:24:31', '2022-10-02 05:24:31'),
(14, 'dfgn', 1, NULL, NULL, '2022-10-02 05:24:32', '2022-10-02 05:24:32'),
(15, 'Masud Parbhez', 1, NULL, NULL, '2022-10-02 05:27:48', '2022-10-02 05:27:48'),
(16, 'fatemazzz', 1, NULL, NULL, '2022-10-02 06:39:44', '2022-10-02 06:39:44'),
(17, 'masud  parbhezzzz', 1, NULL, NULL, '2022-10-02 06:40:20', '2022-10-02 06:40:20'),
(18, 'fatemagfasba', 1, NULL, NULL, '2022-10-02 06:47:36', '2022-10-02 06:47:36'),
(19, 'cvsdavavab', 1, NULL, NULL, '2022-10-02 06:50:42', '2022-10-02 06:50:42'),
(20, 'cdsavas', 1, NULL, NULL, '2022-10-02 06:51:33', '2022-10-02 06:51:33'),
(21, 'cdasvavgb', 1, NULL, NULL, '2022-10-02 06:52:38', '2022-10-02 06:52:38'),
(22, 'csadf', 1, NULL, NULL, '2022-10-02 06:56:02', '2022-10-02 06:56:02'),
(23, 'vsdfa', 1, NULL, NULL, '2022-10-02 06:56:02', '2022-10-02 06:56:02'),
(24, 'vsvdasvav', 1, NULL, NULL, '2022-10-02 07:01:22', '2022-10-02 07:01:22'),
(25, 'cvszdvasbv', 1, NULL, NULL, '2022-10-02 07:01:38', '2022-10-02 07:01:38'),
(26, 'vzsfab', 1, NULL, NULL, '2022-10-02 07:01:38', '2022-10-02 07:01:38'),
(27, 'vsb fa', 1, NULL, NULL, '2022-10-02 07:01:38', '2022-10-02 07:01:38'),
(28, 'cvdsvafbaba', 1, NULL, NULL, '2022-10-02 07:02:50', '2022-10-02 07:02:50'),
(29, 'cdSVs', 1, NULL, NULL, '2022-10-02 07:03:31', '2022-10-02 07:03:31'),
(30, 'cdAVafg', 1, NULL, NULL, '2022-10-02 07:06:49', '2022-10-02 07:06:49'),
(31, 'vdsagvasg', 1, NULL, NULL, '2022-10-02 07:08:54', '2022-10-02 07:08:54'),
(32, 'fdssbs', 1, NULL, NULL, '2022-10-02 23:41:47', '2022-10-02 23:41:47'),
(33, 'gfsdhvfdsa', 1, NULL, NULL, '2022-10-02 23:43:21', '2022-10-02 23:43:21'),
(34, 'vsdavas', 1, NULL, NULL, '2022-10-02 23:44:20', '2022-10-02 23:44:20'),
(35, 'rrtwqy', 1, NULL, NULL, '2022-10-02 23:45:25', '2022-10-02 23:45:25'),
(36, 'bvsdbda', 1, NULL, NULL, '2022-10-03 00:00:08', '2022-10-03 00:00:08'),
(37, 'czsvsAV', 1, NULL, NULL, '2022-10-03 02:10:59', '2022-10-03 02:10:59'),
(38, 'fasgvas', 1, NULL, NULL, '2022-10-03 02:21:35', '2022-10-03 02:21:35'),
(39, 'vscas', 1, NULL, NULL, '2022-10-03 04:03:54', '2022-10-03 04:03:54'),
(40, 'vsdfvba', 1, NULL, NULL, '2022-10-03 04:06:12', '2022-10-03 04:06:12'),
(41, 'vzsbvafba', 1, NULL, NULL, '2022-10-03 04:06:47', '2022-10-03 04:06:47'),
(42, 'vfdsa', 1, NULL, NULL, '2022-10-03 04:10:16', '2022-10-03 04:10:16'),
(43, 'vsfda', 1, NULL, NULL, '2022-10-03 04:11:14', '2022-10-03 04:11:14'),
(44, 'vas', 1, NULL, NULL, '2022-10-03 04:13:47', '2022-10-03 04:13:47'),
(45, 'dfagg', 1, NULL, NULL, '2022-10-03 04:14:41', '2022-10-03 04:14:41'),
(46, 'sdafasfagvfvsaa', 1, NULL, NULL, '2022-10-03 04:17:11', '2022-10-03 04:17:11'),
(47, 'vasvdvasvasv', 1, NULL, NULL, '2022-10-03 04:18:51', '2022-10-03 04:18:51'),
(48, 'vcasvasvcca', 1, NULL, NULL, '2022-10-03 04:19:40', '2022-10-03 04:19:40'),
(49, 'sdfasvfga', 1, NULL, NULL, '2022-10-03 04:21:23', '2022-10-03 04:21:23'),
(50, 'sdafdafafg', 1, NULL, NULL, '2022-10-03 04:23:38', '2022-10-03 04:23:38'),
(51, 'rtwywy', 1, NULL, NULL, '2022-10-03 04:25:31', '2022-10-03 04:25:31'),
(52, 'cdsafasfasf', 1, NULL, NULL, '2022-10-03 04:27:48', '2022-10-03 04:27:48'),
(53, 'asfasga', 1, NULL, NULL, '2022-10-03 04:29:25', '2022-10-03 04:29:25'),
(54, 'cvdfafaf', 1, NULL, NULL, '2022-10-03 04:30:46', '2022-10-03 04:30:46'),
(55, 'cvdfafafdfamp', 1, NULL, NULL, '2022-10-03 04:31:03', '2022-10-03 04:31:03'),
(56, 'cdsafas', 1, NULL, NULL, '2022-10-03 04:34:56', '2022-10-03 04:34:56'),
(57, 'vsavag', 1, NULL, NULL, '2022-10-03 04:35:49', '2022-10-03 04:35:49'),
(58, 'cdsafafadafppp', 1, NULL, NULL, '2022-10-03 04:38:40', '2022-10-03 04:38:40'),
(59, 'vdsafagsag', 1, NULL, NULL, '2022-10-03 04:41:56', '2022-10-03 04:41:56'),
(60, 'sdfafadf', 1, NULL, NULL, '2022-10-03 04:43:49', '2022-10-03 04:43:49'),
(61, 'vsdfas', 1, NULL, NULL, '2022-10-03 04:49:42', '2022-10-03 04:49:42'),
(62, 'sfagag', 1, NULL, NULL, '2022-10-03 04:49:58', '2022-10-03 04:49:58'),
(63, 'dsfvsagaaaaa', 1, NULL, NULL, '2022-10-03 04:50:09', '2022-10-03 04:50:09'),
(64, 'sadfvav', 1, NULL, NULL, '2022-10-03 04:50:22', '2022-10-03 04:50:22'),
(65, 'vsdavasfab', 1, NULL, NULL, '2022-10-03 04:50:22', '2022-10-03 04:50:22'),
(66, 'vsadvasdfb', 1, NULL, NULL, '2022-10-03 04:50:22', '2022-10-03 04:50:22'),
(67, 'cvszdfag', 1, NULL, NULL, '2022-10-03 04:52:44', '2022-10-03 04:52:44'),
(68, 'vczsvsagva', 1, NULL, NULL, '2022-10-03 04:52:49', '2022-10-03 04:52:49'),
(69, 'vsfvasgv', 1, NULL, NULL, '2022-10-03 04:52:53', '2022-10-03 04:52:53'),
(70, 'vdsavfas', 1, NULL, NULL, '2022-10-03 04:53:02', '2022-10-03 04:53:02'),
(71, 'vcsvfas', 1, NULL, NULL, '2022-10-03 04:53:02', '2022-10-03 04:53:02'),
(72, 'vszvab', 1, NULL, NULL, '2022-10-03 04:53:02', '2022-10-03 04:53:02'),
(73, 'cdsaf', 1, NULL, NULL, '2022-10-03 04:54:20', '2022-10-03 04:54:20'),
(74, 'cvszvasv', 1, NULL, NULL, '2022-10-03 04:54:25', '2022-10-03 04:54:25'),
(75, 'vv asvf', 1, NULL, NULL, '2022-10-03 04:54:29', '2022-10-03 04:54:29'),
(76, 'vsfgsag', 1, NULL, NULL, '2022-10-03 05:00:21', '2022-10-03 05:00:21'),
(77, 'vafsba', 1, NULL, NULL, '2022-10-03 05:00:21', '2022-10-03 05:00:21'),
(78, 'bsdfbad', 1, NULL, NULL, '2022-10-03 05:00:21', '2022-10-03 05:00:21'),
(79, 'fbdn', 1, NULL, NULL, '2022-10-03 05:02:18', '2022-10-03 05:02:18'),
(80, 'vsadg', 1, NULL, NULL, '2022-10-03 06:59:15', '2022-10-03 06:59:15'),
(81, 'fdsgsg', 1, NULL, NULL, '2022-10-03 07:07:43', '2022-10-03 07:07:43'),
(82, 'vfsdga', 1, NULL, NULL, '2022-10-03 07:09:13', '2022-10-03 07:09:13'),
(83, 'vsdfasg', 1, NULL, NULL, '2022-10-03 07:16:42', '2022-10-03 07:16:42'),
(84, 'vfasdah', 1, NULL, NULL, '2022-10-03 22:58:39', '2022-10-03 22:58:39'),
(85, 'vasva', 1, NULL, NULL, '2022-10-03 22:59:16', '2022-10-03 22:59:16'),
(86, 'vasdf', 1, NULL, NULL, '2022-10-03 22:59:35', '2022-10-03 22:59:35'),
(87, 'vasgavfgasd', 1, NULL, NULL, '2022-10-03 23:00:19', '2022-10-11 06:33:59'),
(88, 'gsfdhsbsfmpvbfsdaba', 1, NULL, NULL, '2022-10-03 23:10:11', '2022-10-11 06:52:57');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
