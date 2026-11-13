-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2026 at 05:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_identity`
--

-- --------------------------------------------------------

--
-- Table structure for table `unified_accounts`
--

CREATE TABLE `unified_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identity_id` bigint(20) UNSIGNED NOT NULL,
  `system_key` enum('outpatient','smart_queueing') NOT NULL,
  `local_user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unified_accounts`
--

INSERT INTO `unified_accounts` (`id`, `identity_id`, `system_key`, `local_user_id`, `created_at`) VALUES
(1, 1, 'outpatient', 1, '2026-10-11 14:29:59'),
(2, 2, 'outpatient', 2, '2026-10-11 14:29:59'),
(3, 3, 'outpatient', 3, '2026-10-11 14:29:59'),
(4, 4, 'outpatient', 4, '2026-10-11 14:29:59'),
(5, 5, 'outpatient', 5, '2026-10-11 14:29:59'),
(6, 6, 'outpatient', 6, '2026-10-11 14:29:59'),
(7, 7, 'outpatient', 7, '2026-10-11 14:29:59'),
(8, 8, 'outpatient', 8, '2026-10-11 14:29:59'),
(9, 9, 'outpatient', 9, '2026-10-11 14:29:59'),
(10, 10, 'outpatient', 10, '2026-10-11 14:29:59'),
(16, 16, 'smart_queueing', 1, '2026-10-11 14:29:59'),
(17, 37, 'smart_queueing', 31, '2026-10-11 14:29:59'),
(18, 41, 'smart_queueing', 37, '2026-10-11 14:29:59'),
(19, 43, 'smart_queueing', 39, '2026-10-11 14:29:59'),
(20, 30, 'smart_queueing', 23, '2026-10-11 14:29:59'),
(21, 22, 'smart_queueing', 7, '2026-10-11 14:29:59'),
(22, 32, 'smart_queueing', 25, '2026-10-11 14:29:59'),
(23, 24, 'smart_queueing', 9, '2026-10-11 14:29:59'),
(24, 21, 'smart_queueing', 6, '2026-10-11 14:29:59'),
(25, 34, 'smart_queueing', 27, '2026-10-11 14:29:59'),
(26, 19, 'smart_queueing', 4, '2026-10-11 14:29:59'),
(27, 28, 'smart_queueing', 21, '2026-10-11 14:29:59'),
(28, 39, 'smart_queueing', 35, '2026-10-11 14:29:59'),
(29, 27, 'smart_queueing', 12, '2026-10-11 14:29:59'),
(30, 26, 'smart_queueing', 11, '2026-10-11 14:29:59'),
(31, 25, 'smart_queueing', 10, '2026-10-11 14:29:59'),
(32, 42, 'smart_queueing', 38, '2026-10-11 14:29:59'),
(33, 36, 'smart_queueing', 30, '2026-10-11 14:29:59'),
(34, 23, 'smart_queueing', 8, '2026-10-11 14:29:59'),
(35, 33, 'smart_queueing', 26, '2026-10-11 14:29:59'),
(36, 31, 'smart_queueing', 24, '2026-10-11 14:29:59'),
(37, 29, 'smart_queueing', 22, '2026-10-11 14:29:59'),
(38, 35, 'smart_queueing', 28, '2026-10-11 14:29:59'),
(39, 17, 'smart_queueing', 2, '2026-10-11 14:29:59'),
(40, 38, 'smart_queueing', 34, '2026-10-11 14:29:59'),
(41, 40, 'smart_queueing', 36, '2026-10-11 14:29:59'),
(42, 18, 'smart_queueing', 3, '2026-10-11 14:29:59'),
(43, 20, 'smart_queueing', 5, '2026-10-11 14:29:59'),
(49, 49, 'outpatient', 11, '2026-10-12 15:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `unified_identities`
--

CREATE TABLE `unified_identities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seed_system` enum('outpatient','smart_queueing') NOT NULL,
  `seed_user_id` bigint(20) UNSIGNED NOT NULL,
  `display_name` varchar(150) NOT NULL,
  `merged_into_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unified_identities`
--

INSERT INTO `unified_identities` (`id`, `seed_system`, `seed_user_id`, `display_name`, `merged_into_id`, `created_at`) VALUES
(1, 'outpatient', 1, 'System Administrator', NULL, '2026-10-11 14:29:59'),
(2, 'outpatient', 2, 'Dr. John Santos', NULL, '2026-10-11 14:29:59'),
(3, 'outpatient', 3, 'Dr. Maria Reyes', NULL, '2026-10-11 14:29:59'),
(4, 'outpatient', 4, 'Dr. Anna Cruz', NULL, '2026-10-11 14:29:59'),
(5, 'outpatient', 5, 'Dr. Robert Lim', NULL, '2026-10-11 14:29:59'),
(6, 'outpatient', 6, 'Front Desk - General', NULL, '2026-10-11 14:29:59'),
(7, 'outpatient', 7, 'Front Desk - Pediatrics', NULL, '2026-10-11 14:29:59'),
(8, 'outpatient', 8, 'Front Desk - OB-Gyne', NULL, '2026-10-11 14:29:59'),
(9, 'outpatient', 9, 'Front Desk - Internal Med', NULL, '2026-10-11 14:29:59'),
(10, 'outpatient', 10, 'Mark Adrian Lumongsod', NULL, '2026-10-11 14:29:59'),
(16, 'smart_queueing', 1, 'System Administrator', NULL, '2026-10-11 14:29:59'),
(17, 'smart_queueing', 2, 'Registration Staff', NULL, '2026-10-11 14:29:59'),
(18, 'smart_queueing', 3, 'Vital Signs Staff', NULL, '2026-10-11 14:29:59'),
(19, 'smart_queueing', 4, 'Lab Technician', NULL, '2026-10-11 14:29:59'),
(20, 'smart_queueing', 5, 'X-Ray Technician', NULL, '2026-10-11 14:29:59'),
(21, 'smart_queueing', 6, 'ECG Technician', NULL, '2026-10-11 14:29:59'),
(22, 'smart_queueing', 7, 'Dentist', NULL, '2026-10-11 14:29:59'),
(23, 'smart_queueing', 8, 'Optometrist', NULL, '2026-10-11 14:29:59'),
(24, 'smart_queueing', 9, 'General Practitioner', NULL, '2026-10-11 14:29:59'),
(25, 'smart_queueing', 10, 'Nurse Maria', NULL, '2026-10-11 14:29:59'),
(26, 'smart_queueing', 11, 'Nurse Jose', NULL, '2026-10-11 14:29:59'),
(27, 'smart_queueing', 12, 'Nurse Ana', NULL, '2026-10-11 14:29:59'),
(28, 'smart_queueing', 21, 'johnber', NULL, '2026-10-11 14:29:59'),
(29, 'smart_queueing', 22, 'inday bejona', NULL, '2026-10-11 14:29:59'),
(30, 'smart_queueing', 23, 'inday bejona', NULL, '2026-10-11 14:29:59'),
(31, 'smart_queueing', 24, 'inday bejona', NULL, '2026-10-11 14:29:59'),
(32, 'smart_queueing', 25, 'inday bejona', NULL, '2026-10-11 14:29:59'),
(33, 'smart_queueing', 26, 'inday bejona', NULL, '2026-10-11 14:29:59'),
(34, 'smart_queueing', 27, 'inday bejona', NULL, '2026-10-11 14:29:59'),
(35, 'smart_queueing', 28, 'inday bejona', NULL, '2026-10-11 14:29:59'),
(36, 'smart_queueing', 30, 'opthal staff', NULL, '2026-10-11 14:29:59'),
(37, 'smart_queueing', 31, 'officer admin', NULL, '2026-10-11 14:29:59'),
(38, 'smart_queueing', 34, 'mark adrian', NULL, '2026-10-11 14:29:59'),
(39, 'smart_queueing', 35, 'mark adrian', NULL, '2026-10-11 14:29:59'),
(40, 'smart_queueing', 36, 'test', NULL, '2026-10-11 14:29:59'),
(41, 'smart_queueing', 37, 'kram dosngomu', NULL, '2026-10-11 14:29:59'),
(42, 'smart_queueing', 38, 'kram dosngomu', NULL, '2026-10-11 14:29:59'),
(43, 'smart_queueing', 39, 'mark adrian', NULL, '2026-10-11 14:29:59'),
(49, 'outpatient', 11, 'GenMed Doctor', NULL, '2026-10-12 15:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `unified_login_attempts`
--

CREATE TABLE `unified_login_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `succeeded` tinyint(1) NOT NULL DEFAULT 0,
  `attempted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unified_login_attempts`
--

INSERT INTO `unified_login_attempts` (`id`, `username`, `ip_address`, `succeeded`, `attempted_at`) VALUES
(1, 'admin', '::1', 0, '2026-10-11 14:37:04'),
(2, 'admin', '::1', 0, '2026-10-11 14:38:03'),
(3, 'dr.general', '::1', 0, '2026-10-11 14:38:12'),
(4, 'dr.general', '::1', 1, '2026-10-11 14:38:20'),
(5, 'reg_staff', '::1', 1, '2026-10-11 14:38:41'),
(6, 'admin', '::1', 0, '2026-10-11 14:39:15'),
(7, 'adminoutpatient', '::1', 1, '2026-10-11 14:41:20'),
(8, 'admin', '::1', 1, '2026-10-11 14:41:36'),
(9, 'adminoutpatient', '::1', 1, '2026-10-11 14:42:24'),
(10, 'adminoutpatient', '::1', 1, '2026-10-11 14:44:00'),
(11, 'admin', '::1', 1, '2026-10-11 14:44:12'),
(12, 'adminoutpatient', '::1', 1, '2026-10-11 14:45:53'),
(13, 'admin', '::1', 1, '2026-10-11 14:46:07'),
(14, 'adminoutpatient', '::1', 1, '2026-10-11 14:51:23'),
(15, 'dr.mark', '::1', 1, '2026-10-11 14:52:21'),
(16, 'admin', '::1', 0, '2026-10-11 14:53:44'),
(17, 'admin', '::1', 1, '2026-10-11 14:53:50'),
(18, 'dr.mark', '::1', 1, '2026-10-11 14:55:59'),
(19, 'adminoutpatient', '::1', 1, '2026-10-11 14:58:04'),
(20, 'admin', '::1', 1, '2026-10-11 14:58:13'),
(21, 'reg_staff', '::1', 1, '2026-10-11 14:58:22'),
(22, 'dr.general', '::1', 0, '2026-10-11 14:58:33'),
(23, 'dr.general', '::1', 1, '2026-10-11 14:58:36'),
(24, 'dr.mark', '::1', 1, '2026-10-11 14:58:50'),
(25, 'fd.general', '::1', 0, '2026-10-11 15:25:14'),
(26, 'fd.general', '::1', 1, '2026-10-11 15:25:23'),
(27, 'dr.obgyn', '::1', 0, '2026-10-11 15:32:26'),
(28, 'dr.obgyne', '::1', 0, '2026-10-11 15:32:34'),
(29, 'dr.obgyne', '::1', 0, '2026-10-11 15:32:37'),
(30, 'dr.obgyn', '::1', 1, '2026-10-11 15:32:42'),
(31, 'reg_staff', '::1', 1, '2026-10-11 15:42:19'),
(32, 'fd.general', '::1', 0, '2026-10-11 15:44:21'),
(33, 'fd.general', '::1', 1, '2026-10-11 15:44:27'),
(34, 'dr.mark', '::1', 0, '2026-10-11 15:45:29'),
(35, 'dr.mark', '::1', 1, '2026-10-11 15:45:34'),
(36, 'adminoutpatient', '::1', 1, '2026-10-11 15:48:27'),
(37, 'admin', '::1', 1, '2026-10-11 15:50:09'),
(38, 'reg_staff', '::1', 1, '2026-10-11 16:00:33'),
(39, 'adminoutpatient', '::1', 1, '2026-10-11 16:31:43'),
(40, 'admin', '::1', 1, '2026-10-11 16:33:31'),
(41, 'adminoutpatient', '::1', 1, '2026-10-11 16:36:36'),
(42, 'fd.general', '::1', 1, '2026-10-11 17:01:14'),
(43, 'dr.mark', '::1', 0, '2026-10-11 17:03:36'),
(44, 'dr.mark', '::1', 1, '2026-10-11 17:03:45'),
(45, 'adminoutpatient', '::1', 1, '2026-10-11 17:09:08'),
(46, 'admin', '::1', 1, '2026-10-11 17:12:35'),
(47, 'adminoutpatient', '::1', 1, '2026-10-11 17:12:56'),
(48, 'fd.general', '::1', 1, '2026-10-11 17:20:24'),
(49, 'dr.general', '::1', 1, '2026-10-11 17:21:03'),
(50, 'dr.mark', '::1', 0, '2026-10-11 17:21:11'),
(51, 'dr.mark', '::1', 1, '2026-10-11 17:21:16'),
(52, 'admin', '::1', 1, '2026-10-11 17:36:12'),
(53, 'reg_staff', '::1', 1, '2026-10-11 17:37:24'),
(54, 'admin', '::1', 1, '2026-10-11 17:38:08'),
(55, 'fd.general', '::1', 1, '2026-10-11 17:55:36'),
(56, 'adminoutpatient', '::1', 1, '2026-10-12 15:26:47'),
(57, 'dr.peds', '::1', 0, '2026-10-12 15:31:19'),
(58, 'dr.peds', '::1', 1, '2026-10-12 15:31:32'),
(59, 'dr.mark', '::1', 1, '2026-10-12 15:32:48'),
(60, 'adminoutpatient', '::1', 1, '2026-10-12 15:33:41'),
(61, 'admin', '::1', 1, '2026-10-12 15:41:24'),
(62, 'fd.general', '::1', 1, '2026-10-12 15:56:14'),
(63, 'dr.mark', '::1', 1, '2026-10-12 16:02:41'),
(64, 'adminoutpatient', '::1', 1, '2026-10-13 03:23:45'),
(65, 'fd.general', '::1', 1, '2026-10-13 03:25:43'),
(66, 'dr.general', '::1', 1, '2026-10-13 03:26:03'),
(67, 'dr.mark', '::1', 0, '2026-10-13 03:26:18'),
(68, 'dr.mark', '::1', 1, '2026-10-13 03:26:24'),
(69, 'admin', '::1', 1, '2026-10-13 03:27:29'),
(70, 'admin', '::1', 1, '2026-10-13 06:18:57'),
(71, 'adminoutpatient', '::1', 1, '2026-10-13 06:22:02'),
(72, 'adminoutpatient', '::1', 1, '2026-10-13 10:17:42'),
(73, 'admin', '10.164.139.195', 1, '2026-10-13 10:26:48'),
(74, 'fd.general', '::1', 0, '2026-10-13 10:37:06'),
(75, 'fd.general', '::1', 0, '2026-10-13 10:37:12'),
(76, 'fd.general', '::1', 0, '2026-10-13 10:37:22'),
(77, 'fd.general', '::1', 1, '2026-10-13 10:37:51'),
(78, 'fd.general', '::1', 1, '2026-10-13 10:39:33'),
(79, 'dr.general', '::1', 1, '2026-10-13 11:18:31'),
(80, 'dr.mark', '::1', 0, '2026-10-13 11:19:00'),
(81, 'dr.mark', '::1', 1, '2026-10-13 11:19:05'),
(82, 'admin', '::1', 1, '2026-10-13 11:20:59'),
(83, 'adminoutpatient', '::1', 1, '2026-10-13 11:25:58'),
(84, 'fd.general', '::1', 1, '2026-10-13 11:27:17'),
(85, 'admin', '::1', 1, '2026-10-13 11:29:46');

-- --------------------------------------------------------

--
-- Table structure for table `unified_two_factor_attempts`
--

CREATE TABLE `unified_two_factor_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identity_id` bigint(20) UNSIGNED NOT NULL,
  `system_key` enum('outpatient','smart_queueing') NOT NULL,
  `succeeded` tinyint(1) NOT NULL DEFAULT 0,
  `attempted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unified_two_factor_attempts`
--

INSERT INTO `unified_two_factor_attempts` (`id`, `identity_id`, `system_key`, `succeeded`, `attempted_at`) VALUES
(1, 16, 'smart_queueing', 1, '2026-10-11 14:41:54'),
(2, 16, 'smart_queueing', 0, '2026-10-11 14:44:23'),
(3, 16, 'smart_queueing', 1, '2026-10-11 14:44:33'),
(4, 16, 'smart_queueing', 1, '2026-10-11 14:46:18'),
(5, 1, 'outpatient', 1, '2026-10-11 14:51:33'),
(6, 16, 'smart_queueing', 1, '2026-10-11 14:55:23'),
(7, 1, 'outpatient', 1, '2026-10-11 15:48:44'),
(8, 16, 'smart_queueing', 1, '2026-10-11 15:50:26'),
(9, 1, 'outpatient', 0, '2026-10-11 16:31:55'),
(10, 1, 'outpatient', 0, '2026-10-11 16:32:09'),
(11, 1, 'outpatient', 0, '2026-10-11 16:32:31'),
(12, 16, 'smart_queueing', 1, '2026-10-11 16:33:44'),
(13, 1, 'outpatient', 1, '2026-10-11 16:36:46'),
(14, 1, 'outpatient', 1, '2026-10-11 17:09:18'),
(15, 16, 'smart_queueing', 0, '2026-10-11 17:12:46'),
(16, 1, 'outpatient', 1, '2026-10-11 17:13:02'),
(17, 16, 'smart_queueing', 1, '2026-10-11 17:36:39'),
(18, 16, 'smart_queueing', 1, '2026-10-11 17:38:18'),
(19, 1, 'outpatient', 1, '2026-10-12 15:26:57'),
(20, 1, 'outpatient', 1, '2026-10-12 15:33:51'),
(21, 16, 'smart_queueing', 1, '2026-10-12 15:41:34'),
(22, 1, 'outpatient', 1, '2026-10-13 03:23:53'),
(23, 16, 'smart_queueing', 1, '2026-10-13 03:27:38'),
(24, 16, 'smart_queueing', 1, '2026-10-13 06:19:11'),
(25, 1, 'outpatient', 1, '2026-10-13 06:22:11'),
(26, 1, 'outpatient', 0, '2026-10-13 10:18:01'),
(27, 1, 'outpatient', 1, '2026-10-13 10:18:10'),
(28, 16, 'smart_queueing', 1, '2026-10-13 10:27:10'),
(29, 16, 'smart_queueing', 1, '2026-10-13 11:21:13'),
(30, 1, 'outpatient', 1, '2026-10-13 11:26:05'),
(31, 16, 'smart_queueing', 1, '2026-10-13 11:29:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `unified_accounts`
--
ALTER TABLE `unified_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_unified_account_local` (`system_key`,`local_user_id`),
  ADD KEY `idx_unified_account_identity` (`identity_id`);

--
-- Indexes for table `unified_identities`
--
ALTER TABLE `unified_identities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_unified_identity_seed` (`seed_system`,`seed_user_id`),
  ADD KEY `idx_unified_identity_merged_into` (`merged_into_id`);

--
-- Indexes for table `unified_login_attempts`
--
ALTER TABLE `unified_login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_unified_login_attempts_username_time` (`username`,`attempted_at`),
  ADD KEY `idx_unified_login_attempts_ip_time` (`ip_address`,`attempted_at`);

--
-- Indexes for table `unified_two_factor_attempts`
--
ALTER TABLE `unified_two_factor_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_unified_2fa_identity_system_time` (`identity_id`,`system_key`,`attempted_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `unified_accounts`
--
ALTER TABLE `unified_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `unified_identities`
--
ALTER TABLE `unified_identities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `unified_login_attempts`
--
ALTER TABLE `unified_login_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `unified_two_factor_attempts`
--
ALTER TABLE `unified_two_factor_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `unified_accounts`
--
ALTER TABLE `unified_accounts`
  ADD CONSTRAINT `fk_unified_account_identity` FOREIGN KEY (`identity_id`) REFERENCES `unified_identities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `unified_identities`
--
ALTER TABLE `unified_identities`
  ADD CONSTRAINT `fk_unified_identity_merged_into` FOREIGN KEY (`merged_into_id`) REFERENCES `unified_identities` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `unified_two_factor_attempts`
--
ALTER TABLE `unified_two_factor_attempts`
  ADD CONSTRAINT `fk_unified_2fa_identity` FOREIGN KEY (`identity_id`) REFERENCES `unified_identities` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
