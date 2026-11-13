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
-- Database: `cesh_crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) DEFAULT NULL,
  `patient_name` varchar(200) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `provider` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT 'General',
  `doctor_id` int(11) DEFAULT NULL,
  `status` enum('Pending','Confirmed','In Progress','Completed','Cancelled') DEFAULT 'Pending',
  `contact` varchar(20) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `completed_at` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `doctor_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `patient_mrn`, `patient_name`, `patient_id`, `date`, `time`, `provider`, `type`, `department`, `doctor_id`, `status`, `contact`, `notes`, `created_at`, `updated_at`, `completed_at`, `start_time`, `end_time`, `doctor_notes`) VALUES
(35, 1045, NULL, NULL, '2026-10-13', '13:30:00', 'Mark Adrian Lumongsod', 'Initial Consultation', 'General', NULL, 'Confirmed', NULL, '', '2026-10-12 15:38:43', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `appointment_email_log`
--

CREATE TABLE `appointment_email_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `email_type` varchar(50) NOT NULL,
  `recipient_email` varchar(255) NOT NULL,
  `sent_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointment_email_log`
--

INSERT INTO `appointment_email_log` (`id`, `appointment_id`, `email_type`, `recipient_email`, `sent_at`) VALUES
(1, 30, 'confirmation', 'mark.adrian.lumongsod@gmail.com', '2026-08-23 09:49:07'),
(2, 31, 'confirmation', 'mark.adrian.lumongsod@gmail.com', '2026-08-23 09:52:24'),
(3, 32, 'confirmation', 'iamzesarjen@gmail.com', '2026-08-23 23:27:50'),
(4, 33, 'confirmation', 'iamzesarjen@gmail.com', '2026-10-08 18:14:06'),
(5, 35, 'confirmation', 'mark.adrian.lumongsod@gmail.com', '2026-10-12 23:38:45');

-- --------------------------------------------------------

--
-- Table structure for table `diagnoses`
--

CREATE TABLE `diagnoses` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `provider` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `diagnosis_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedule`
--

CREATE TABLE `doctor_schedule` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `schedule_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `department` varchar(50) DEFAULT 'General',
  `is_available` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_schedule`
--

INSERT INTO `doctor_schedule` (`id`, `doctor_id`, `schedule_date`, `start_time`, `end_time`, `department`, `is_available`, `created_at`) VALUES
(1, 3, '2026-06-10', '08:00:00', '17:00:00', 'Pediatrics', 1, '2026-06-09 16:37:46');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedules`
--

CREATE TABLE `doctor_schedules` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `department` varchar(100) NOT NULL,
  `day_of_week` varchar(20) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `uploaded` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `patient_mrn`, `file_name`, `type`, `uploaded`) VALUES
(6, 1045, 'uploads/1791819494_21798432_fa8d_4214_bc1c_aa1605a3bc83.jfif', 'image/jpeg', '2026-10-12');

-- --------------------------------------------------------

--
-- Table structure for table `family_history`
--

CREATE TABLE `family_history` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `relation` varchar(50) DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `immunizations`
--

CREATE TABLE `immunizations` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `vaccine` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_activity`
--

CREATE TABLE `login_activity` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `status` enum('Success','Failed') NOT NULL,
  `reason` varchar(255) NOT NULL,
  `attempted_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_activity`
--

INSERT INTO `login_activity` (`id`, `user_id`, `username`, `full_name`, `ip_address`, `status`, `reason`, `attempted_at`) VALUES
(1, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-24 00:47:17'),
(2, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-24 00:47:43'),
(3, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-08-24 00:47:59'),
(4, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-08-24 00:58:51'),
(5, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-24 01:00:53'),
(6, 2, 'dr.general', 'Dr. John Santos', '::1', 'Success', 'Login successful', '2026-08-24 01:01:16'),
(7, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-24 01:20:07'),
(8, 2, 'dr.general', 'Dr. John Santos', '::1', 'Success', 'Login successful', '2026-08-24 01:21:07'),
(9, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-24 01:23:05'),
(10, 2, 'dr.general', 'Dr. John Santos', '::1', 'Success', 'Login successful', '2026-08-24 01:26:03'),
(11, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-25 01:39:27'),
(12, 1, 'admin', 'System Administrator', '::1', 'Failed', 'Invalid authenticator code', '2026-08-25 04:49:08'),
(13, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-25 04:49:13'),
(14, 2, 'dr.general', 'Dr. John Santos', '::1', 'Success', 'Login successful', '2026-08-25 04:49:32'),
(15, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-08-25 04:50:45'),
(16, NULL, 'admin', NULL, '::1', 'Failed', 'Invalid username or password', '2026-08-25 04:52:56'),
(17, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-25 04:53:13'),
(18, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-25 04:54:17'),
(19, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-08-25 05:02:22'),
(20, 2, 'dr.general', 'Dr. John Santos', '::1', 'Success', 'Login successful', '2026-08-25 05:15:41'),
(21, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-08-25 05:16:08'),
(22, 10, 'dr.mark', 'Dr. Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-08-25 05:25:38'),
(23, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-08-25 05:38:09'),
(24, NULL, 'admin', NULL, '::1', 'Failed', 'Invalid username or password', '2026-09-30 18:28:31'),
(25, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-09-30 18:28:57'),
(26, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-09-30 18:31:37'),
(27, NULL, 'fd.general', NULL, '::1', 'Failed', 'Invalid username or password', '2026-09-30 18:32:57'),
(28, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-09-30 18:33:08'),
(29, 2, 'dr.general', 'Dr. John Santos', '::1', 'Success', 'Login successful', '2026-09-30 18:43:26'),
(30, 1, 'admin', 'System Administrator', '::1', 'Failed', 'Invalid authenticator code', '2026-10-02 16:42:08'),
(31, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-02 16:42:12'),
(32, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-08 17:40:10'),
(33, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 17:40:55'),
(34, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-10-08 18:09:56'),
(35, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-08 18:13:26'),
(36, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 20:06:34'),
(37, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-10-08 20:17:26'),
(38, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 20:59:10'),
(39, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 20:59:33'),
(40, NULL, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Failed', 'Account is inactive', '2026-10-08 20:59:54'),
(41, 1, 'admin', 'System Administrator', '::1', 'Failed', 'Invalid authenticator code', '2026-10-08 21:01:44'),
(42, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-08 21:03:35'),
(43, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 21:07:02'),
(44, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-08 21:07:33'),
(45, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 21:08:30'),
(46, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 21:09:37'),
(47, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-10-08 21:09:46'),
(48, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-08 21:10:03'),
(49, NULL, 'admin', NULL, '::1', 'Failed', 'Invalid username or password', '2026-10-08 21:10:20'),
(50, NULL, 'admin', NULL, '::1', 'Failed', 'Invalid username or password', '2026-10-08 21:10:28'),
(56, NULL, 'admin', NULL, '::1', 'Failed', 'Invalid username or password', '2026-10-08 21:13:36'),
(57, NULL, 'admin', NULL, '::1', 'Failed', 'Invalid username or password', '2026-10-08 21:13:48'),
(68, NULL, 'admin', NULL, '::1', 'Failed', 'Invalid username or password', '2026-10-08 21:15:10'),
(69, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-10-08 21:15:28'),
(70, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 21:18:55'),
(71, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-08 22:22:19'),
(72, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 22:51:16'),
(73, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 23:00:00'),
(74, 4, 'dr.obgyn', 'Dr. Anna Cruz', '::1', 'Success', 'Login successful', '2026-10-08 23:23:37'),
(75, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-08 23:39:39'),
(76, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-08 23:43:43'),
(77, NULL, 'admin', NULL, '::1', 'Failed', 'Incorrect security check', '2026-10-11 20:21:46'),
(78, 1, 'admin', 'System Administrator', '::1', 'Success', 'Login successful with 2FA', '2026-10-11 20:22:06'),
(79, 6, 'fd.general', 'Front Desk - General', '::1', 'Success', 'Login successful', '2026-10-11 21:11:35'),
(80, 10, 'dr.mark', 'Mark Adrian Lumongsod', '::1', 'Success', 'Login successful', '2026-10-11 21:23:39');

-- --------------------------------------------------------

--
-- Table structure for table `medical_history`
--

CREATE TABLE `medical_history` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `diagnosis` text DEFAULT NULL,
  `medications` text DEFAULT NULL,
  `allergies` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_history`
--

INSERT INTO `medical_history` (`id`, `patient_mrn`, `diagnosis`, `medications`, `allergies`, `notes`, `created_at`) VALUES
(8, 1045, 'none', 'none', 'none', 'none', '2026-10-12 15:38:05'),
(9, 1051, 'none', 'biogesic', 'none', 'normal', '2026-10-13 10:41:24');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `mrn` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `primary_physician` varchar(100) DEFAULT NULL,
  `status` enum('Active','Archived') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `serial_no` varchar(50) DEFAULT NULL,
  `patient_type` varchar(20) DEFAULT NULL,
  `military_rank` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`mrn`, `first_name`, `middle_name`, `last_name`, `suffix`, `dob`, `gender`, `contact`, `email`, `address`, `primary_physician`, `status`, `created_at`, `serial_no`, `patient_type`, `military_rank`) VALUES
(1045, 'Mark Adrian', 'Batawan', 'Lumongsod', '', '2004-12-14', 'Male', '09121231234', 'mark.adrian.lumongsod@gmail.com', 'Gumamela Ext., Carmen, Cagayan de Oro City', '', 'Active', '2026-10-12 15:37:46', '123456', 'Military', 'General'),
(1046, 'Chudney Ron', '', 'Monterde', '', '2003-12-12', 'Male', '09121341234', '', 'cdo', '', 'Active', '2026-10-12 15:56:52', '192929', 'Dependent', ''),
(1047, 'Jamil', '', 'Khalid', '', '2005-12-12', 'Male', '09121231234', '', 'carmen', '', 'Active', '2026-10-12 16:00:50', '1932948', 'Military', 'Second Lieutenant'),
(1048, 'Ashly Gwen', '', 'Bejuna', '', '2003-12-15', 'Female', '09121231234', '', 'address', '', 'Active', '2026-10-12 16:01:22', '98594859458', 'Dependent', ''),
(1049, 'Jessie  Lou', 'Bejuna', 'Emlano', '', '2004-04-22', 'Female', '09121231234', '', 'cdo', '', 'Active', '2026-10-13 03:24:46', '93849375', 'Military', 'Brigadier General'),
(1050, 'Mickey', 'Bejuna', 'Mouse', '', '2005-01-01', 'Male', '09121231234', '', 'cdo', '', 'Active', '2026-10-13 06:22:57', '3464567678', 'Military', 'Second Lieutenant'),
(1051, 'Kram', 'Batawan', 'bejona', '', '2026-09-09', 'Male', '09995498654', '', 'carmen', 'doctor santos', 'Active', '2026-10-13 10:39:06', '123123', 'Military', 'Private'),
(1052, 'chudney test', 'ron', 'monterde', '', '2026-08-12', 'Male', '09954986549', 'iamzesarjen@gmail.com', 'carmen', 'admin', 'Active', '2026-10-13 11:17:19', '93849375', 'Military', 'Master Sergeant');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `queue_number` int(11) NOT NULL,
  `priority` enum('Normal','Senior','PWD','Emergency') DEFAULT 'Normal',
  `status` enum('Waiting','In Consultation','Completed','Cancelled','No Show') DEFAULT 'Waiting',
  `doctor_id` int(11) DEFAULT NULL,
  `department` varchar(50) DEFAULT 'General',
  `called_at` datetime DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `appointment_id` int(11) DEFAULT NULL,
  `is_from_appointment` tinyint(1) DEFAULT 0,
  `tracking_token` char(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`id`, `patient_mrn`, `queue_number`, `priority`, `status`, `doctor_id`, `department`, `called_at`, `started_at`, `completed_at`, `created_at`, `appointment_id`, `is_from_appointment`, `tracking_token`) VALUES
(71, 1045, 8, 'Normal', 'Completed', 10, 'General Medicine', '2026-10-12 23:41:03', NULL, '2026-10-12 23:49:47', '2026-10-12 15:39:17', NULL, 0, 'de07e882c75af49ab0cf55c3b2fbcadcac93805d71e8a2217e345d80218000be'),
(72, 1046, 3, 'PWD', 'Waiting', 5, 'Internal Medicine', NULL, NULL, NULL, '2026-10-12 15:56:52', NULL, 0, 'e18cbba7e84fa1574206fa4f5400cb88e7bbad5db0f7cbb71755bb2eac19ebdb'),
(73, 1048, 9, 'Normal', 'Waiting', 11, 'General Medicine', NULL, NULL, NULL, '2026-10-12 16:01:33', NULL, 0, 'eb87751abd6935094e91554e09ed30c5c24d3ae9b73da48546a53e538e2fb560'),
(74, 1047, 10, 'Normal', 'Waiting', 3, 'Pediatrics', NULL, NULL, NULL, '2026-10-12 16:01:39', NULL, 0, '15fd8159899f24baae4f54f892828ac74939103fce19fcb8eeae5a5991e2782c'),
(75, 1045, 10, 'Senior', 'Completed', 10, 'General Medicine', '2026-10-13 00:02:43', NULL, '2026-10-13 00:03:05', '2026-10-12 16:01:55', NULL, 0, '33848aaefa35ddcdd2e91646109936c2795e2915d1623ba7a554c5f754fb4779'),
(76, 1049, 11, 'Normal', 'Completed', 10, 'General Medicine', '2026-10-13 11:26:31', NULL, '2026-10-13 19:19:12', '2026-10-13 03:25:09', NULL, 0, '86c013af4110d177e6b2e0b703db85e80869d2953c027371c321cab5bec6ac9c'),
(77, 1050, 12, 'Normal', 'Waiting', 2, 'General Medicine', NULL, NULL, NULL, '2026-10-13 06:23:09', NULL, 0, '60f3997abe4a6b7bfc1425cc1eb3f3ce9268726d4e90df472c255e5f20bd006a'),
(78, 1051, 13, 'Normal', 'Waiting', 11, 'General Medicine', NULL, NULL, NULL, '2026-10-13 10:39:06', NULL, 0, 'c03d1ab5c204f0f983de81c09f881bbf250a0f5a9d1c7417c5933932bd1b5fe6'),
(79, 1052, 14, 'Normal', 'Completed', 10, 'General Medicine', '2026-10-13 19:19:22', NULL, '2026-10-13 19:24:42', '2026-10-13 11:17:19', NULL, 0, '2589c5e50558134959700178aa91a2f94e41ee6882d04624135c8b5c0cc5da07');

-- --------------------------------------------------------

--
-- Table structure for table `queue_display`
--

CREATE TABLE `queue_display` (
  `id` int(11) NOT NULL,
  `currently_serving` int(11) DEFAULT NULL,
  `last_called` datetime DEFAULT NULL,
  `department` varchar(50) DEFAULT 'General'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queue_settings`
--

CREATE TABLE `queue_settings` (
  `id` int(11) NOT NULL,
  `department` varchar(50) NOT NULL,
  `current_number` int(11) DEFAULT 0,
  `last_reset_date` date DEFAULT NULL,
  `prefix` varchar(10) DEFAULT 'Q'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queue_settings`
--

INSERT INTO `queue_settings` (`id`, `department`, `current_number`, `last_reset_date`, `prefix`) VALUES
(9, 'General', 13, '2026-10-08', 'Q'),
(10, 'Pediatrics', 10, '2026-10-13', 'P'),
(11, 'OB-Gyne', 3, '2026-10-11', 'G'),
(12, 'Internal Medicine', 3, '2026-10-12', 'M'),
(13, 'General Medicine', 14, '2026-10-13', 'Q');

-- --------------------------------------------------------

--
-- Table structure for table `surgeries`
--

CREATE TABLE `surgeries` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `surgery` varchar(255) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('admin','doctor','nurse','staff') NOT NULL DEFAULT 'staff',
  `assigned_department` varchar(50) DEFAULT 'General',
  `can_access_all_depts` tinyint(1) DEFAULT 0,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `two_factor_secret` varchar(64) DEFAULT NULL,
  `two_factor_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `email`, `role`, `assigned_department`, `can_access_all_depts`, `status`, `is_available`, `two_factor_secret`, `two_factor_enabled`, `last_login`, `created_at`) VALUES
(1, 'adminoutpatient', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'System Administrator', 'admin@cesh.gov.ph', 'admin', 'General', 1, 'Active', 1, 'ZJJWUPQONTHDS3TE', 1, '2026-10-11 20:22:06', '2026-05-18 06:43:28'),
(2, 'dr.general', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Dr. John Santos', 'general@cesh.gov.ph', 'doctor', 'General', 0, 'Active', 1, NULL, 0, '2026-09-30 18:43:26', '2026-05-18 06:43:28'),
(3, 'dr.peds', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Dr. Maria Reyes', 'peds@cesh.gov.ph', 'doctor', 'Pediatrics', 0, 'Active', 1, NULL, 0, '2026-08-18 13:28:04', '2026-05-18 06:43:28'),
(4, 'dr.obgyn', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Dr. Anna Cruz', 'obgyn@cesh.gov.ph', 'doctor', 'OB-Gyne', 0, 'Active', 1, NULL, 0, '2026-10-08 23:23:37', '2026-05-18 06:43:28'),
(5, 'dr.internal', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Dr. Robert Lim', 'internal@cesh.gov.ph', 'doctor', 'Internal Medicine', 0, 'Active', 1, NULL, 0, '2026-06-10 01:12:16', '2026-05-18 06:43:28'),
(6, 'fd.general', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Front Desk - General', 'fd.general@cesh.gov.ph', 'staff', 'General', 0, 'Active', 1, NULL, 0, '2026-10-11 21:11:35', '2026-05-18 06:43:28'),
(7, 'fd.peds', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Front Desk - Pediatrics', 'fd.peds@cesh.gov.ph', 'staff', 'Pediatrics', 0, 'Inactive', 1, NULL, 0, '2026-08-18 13:27:51', '2026-05-18 06:43:28'),
(8, 'fd.obgyn', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Front Desk - OB-Gyne', 'fd.obgyn@cesh.gov.ph', 'staff', 'OB-Gyne', 0, 'Active', 1, NULL, 0, '2026-05-31 23:43:23', '2026-05-18 06:43:28'),
(9, 'fd.internal', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Front Desk - Internal Med', 'fd.internal@cesh.gov.ph', 'staff', 'Internal Medicine', 0, 'Active', 1, NULL, 0, '2026-06-10 01:11:30', '2026-05-18 06:43:28'),
(10, 'dr.mark', '$2y$10$tYY6vO.x1tu16F/wghE6w.mAlzZoDeqYFDP0gNHmQi.FAay3c1lH6', 'Mark Adrian Lumongsod', 'mark.adrian.lumongsod@gmail.com', 'doctor', 'General Medicine', 0, 'Active', 1, NULL, 0, '2026-10-11 21:23:39', '2026-08-24 21:24:38'),
(11, 'Dr. GenMed', '$2y$10$GRP.4u.lrQn1CAOFNiaTeOt72Q9xfoiHFzfpS8eOckAoTU4Kn32fq', 'GenMed Doctor', '', 'doctor', 'General Medicine', 0, 'Active', 1, NULL, 0, NULL, '2026-10-12 15:40:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`),
  ADD KEY `idx_date` (`date`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `fk_appointment_doctor` (`doctor_id`);

--
-- Indexes for table `appointment_email_log`
--
ALTER TABLE `appointment_email_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_appointment_email` (`appointment_id`,`email_type`),
  ADD KEY `idx_email_log_appointment` (`appointment_id`);

--
-- Indexes for table `diagnoses`
--
ALTER TABLE `diagnoses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `doctor_schedule`
--
ALTER TABLE `doctor_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`,`schedule_date`);

--
-- Indexes for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_doctor_dept` (`doctor_id`,`department`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `family_history`
--
ALTER TABLE `family_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `immunizations`
--
ALTER TABLE `immunizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `login_activity`
--
ALTER TABLE `login_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_login_activity_time` (`attempted_at`),
  ADD KEY `idx_login_activity_username` (`username`),
  ADD KEY `idx_login_activity_status` (`status`);

--
-- Indexes for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`mrn`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `queue_display`
--
ALTER TABLE `queue_display`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queue_settings`
--
ALTER TABLE `queue_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `department` (`department`);

--
-- Indexes for table `surgeries`
--
ALTER TABLE `surgeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `appointment_email_log`
--
ALTER TABLE `appointment_email_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `diagnoses`
--
ALTER TABLE `diagnoses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_schedule`
--
ALTER TABLE `doctor_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `family_history`
--
ALTER TABLE `family_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `immunizations`
--
ALTER TABLE `immunizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_activity`
--
ALTER TABLE `login_activity`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `medical_history`
--
ALTER TABLE `medical_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `mrn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1053;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `queue_display`
--
ALTER TABLE `queue_display`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `queue_settings`
--
ALTER TABLE `queue_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `surgeries`
--
ALTER TABLE `surgeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_appointment_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `diagnoses`
--
ALTER TABLE `diagnoses`
  ADD CONSTRAINT `diagnoses_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  ADD CONSTRAINT `doctor_schedules_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `family_history`
--
ALTER TABLE `family_history`
  ADD CONSTRAINT `family_history_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `immunizations`
--
ALTER TABLE `immunizations`
  ADD CONSTRAINT `immunizations_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD CONSTRAINT `medical_history_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `queue`
--
ALTER TABLE `queue`
  ADD CONSTRAINT `queue_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `surgeries`
--
ALTER TABLE `surgeries`
  ADD CONSTRAINT `surgeries_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
