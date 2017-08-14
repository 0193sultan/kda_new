-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2017 at 11:41 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kda_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`) VALUES
(1, 'janata');

-- --------------------------------------------------------

--
-- Table structure for table `basics`
--

CREATE TABLE `basics` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `basics`
--

INSERT INTO `basics` (`id`, `name`) VALUES
(1, '10000'),
(2, '200000');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(1, 'All'),
(2, 'Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`) VALUES
(1, 'chairman'),
(2, 'CTO');

-- --------------------------------------------------------

--
-- Table structure for table `edu_statuses`
--

CREATE TABLE `edu_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `edu_statuses`
--

INSERT INTO `edu_statuses` (`id`, `name`) VALUES
(1, 'Study'),
(2, 'Study');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `employeeID` int(11) NOT NULL,
  `employee_grade_id` int(11) NOT NULL,
  `scale_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `basic_id` int(11) NOT NULL,
  `new_basic_id` int(11) NOT NULL,
  `date_of_birth` date NOT NULL,
  `joining_date` date NOT NULL,
  `quota_id` int(11) NOT NULL,
  `employee_type_id` int(11) NOT NULL,
  `religion_id` int(11) NOT NULL,
  `job_status_id` tinyint(4) NOT NULL,
  `current_posting_place` int(11) NOT NULL,
  `account_number` int(20) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `fathers_name` varchar(100) NOT NULL,
  `mothers_name` varchar(100) NOT NULL,
  `sex_id` int(11) NOT NULL,
  `marital_status_id` int(11) NOT NULL,
  `spouse_name` varchar(100) NOT NULL,
  `living_status_id` int(11) NOT NULL,
  `present_address` text NOT NULL,
  `permanent_address` text NOT NULL,
  `child_number` int(11) NOT NULL,
  `contact_no` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `employeeID`, `employee_grade_id`, `scale_id`, `department_id`, `designation_id`, `basic_id`, `new_basic_id`, `date_of_birth`, `joining_date`, `quota_id`, `employee_type_id`, `religion_id`, `job_status_id`, `current_posting_place`, `account_number`, `bank_id`, `fathers_name`, `mothers_name`, `sex_id`, `marital_status_id`, `spouse_name`, `living_status_id`, `present_address`, `permanent_address`, `child_number`, `contact_no`) VALUES
(12, 'arafat', 1, 1, 1, 1, 1, 1, 1, '1996-06-05', '2017-06-21', 1, 1, 1, 1, 1, 1, 1, 'myfather', 'mymother', 1, 1, '1', 1, 'Dhaka', 'Dhaka', 1, '21313123'),
(13, 'Jarif', 1, 1, 1, 1, 1, 1, 1, '2016-12-01', '2017-06-05', 1, 1, 1, 1, 1, 1, 1, 'adasd', 'asfafaf', 1, 1, 'fsf', 1, 'fasfasfa', 'fafaaf', 1, '213213123');

-- --------------------------------------------------------

--
-- Table structure for table `employee_allowances`
--

CREATE TABLE `employee_allowances` (
  `id` int(11) NOT NULL,
  `house_rent` float NOT NULL,
  `medical` float NOT NULL,
  `education` float NOT NULL,
  `convence` float NOT NULL,
  `tiffin` float NOT NULL,
  `wash` float NOT NULL,
  `mobile` float NOT NULL,
  `da` float NOT NULL,
  `charges` int(11) NOT NULL,
  `others` float NOT NULL,
  `pp` float NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_children`
--

CREATE TABLE `employee_children` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `edu_status_id` int(11) NOT NULL,
  `file_path` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_grades`
--

CREATE TABLE `employee_grades` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_grades`
--

INSERT INTO `employee_grades` (`id`, `name`) VALUES
(1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `employee_recoveries`
--

CREATE TABLE `employee_recoveries` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `gpf` int(11) NOT NULL,
  `gpf_recovery` tinyint(4) NOT NULL,
  `bf` float NOT NULL,
  `gi` float NOT NULL,
  `gi_recovery` tinyint(4) NOT NULL,
  `fixed_house_rent` float NOT NULL,
  `water_supply` int(11) NOT NULL,
  `tax` float NOT NULL,
  `tin_shed` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_types`
--

CREATE TABLE `employee_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_types`
--

INSERT INTO `employee_types` (`id`, `name`) VALUES
(1, 'permanent');

-- --------------------------------------------------------

--
-- Table structure for table `fiscal_years`
--

CREATE TABLE `fiscal_years` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fiscal_years`
--

INSERT INTO `fiscal_years` (`id`, `name`) VALUES
(1, '2017'),
(2, '2018');

-- --------------------------------------------------------

--
-- Table structure for table `job_statuses`
--

CREATE TABLE `job_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_statuses`
--

INSERT INTO `job_statuses` (`id`, `name`) VALUES
(1, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `living_statuses`
--

CREATE TABLE `living_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `living_statuses`
--

INSERT INTO `living_statuses` (`id`, `name`) VALUES
(1, '11111'),
(2, '11111sss');

-- --------------------------------------------------------

--
-- Table structure for table `login_tokens`
--

CREATE TABLE `login_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `duration` varchar(32) NOT NULL,
  `used` smallint(6) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_tokens`
--

INSERT INTO `login_tokens` (`id`, `user_id`, `token`, `duration`, `used`, `created`, `expires`) VALUES
(1, 3, 'T83db4e9aaeaf41915a74e151ecb881b', 'T weeks', 0, '2016-11-16 05:01:50', '2016-11-30 05:01:50'),
(2, 1, 'T7b24139797de454b77e16481a0a5105', 'T weeks', 0, '2016-11-16 05:02:57', '2016-11-30 05:02:57'),
(3, 1, 'Te30566366d91b5ed435bae923ecfbe8', 'T weeks', 0, '2016-11-16 05:43:14', '2016-11-30 05:43:14'),
(4, 1, 'T01ab359d5aad9c873f601ca8cc206e1', 'T weeks', 1, '2016-11-16 08:20:27', '2016-11-30 08:20:27'),
(5, 1, 'T7e9e1a075007930c99d0e4fb208160e', 'T weeks', 0, '2016-11-17 08:46:26', '2016-12-01 08:46:26'),
(6, 1, 'T8104e2c8b81d7d6fef79adbaacacb4d', 'T weeks', 1, '2016-11-17 02:49:49', '2016-12-01 02:49:49'),
(7, 1, 'T4562e8f9bf2285841323aaff56463de', 'T weeks', 1, '2016-11-17 12:47:35', '2016-12-01 12:47:35'),
(8, 1, 'T4ee7ca882fa500e2a643ccb8dc294ca', 'T weeks', 1, '2016-11-20 09:42:26', '2016-12-04 09:42:26'),
(9, 1, 'Tdd5d533f64ee6f1fba4911ccb3f5ada', 'T weeks', 0, '2016-11-22 06:57:12', '2016-12-06 06:57:12'),
(10, 1, 'Td68ab3b436c578476acb0d81ba77d34', 'T weeks', 0, '2016-11-22 00:57:43', '2016-12-06 00:57:43'),
(11, 1, 'Tce0d5bd7377b2868a85cd91d4192a92', 'T weeks', 1, '2016-11-22 01:43:44', '2016-12-06 01:43:44'),
(12, 1, 'T6bc27f0052e467250b0da38c4bdffb5', 'T weeks', 1, '2016-11-22 11:11:04', '2016-12-06 11:11:04'),
(13, 1, 'T7e63c85e353d36e00f5519cfae66c21', 'T weeks', 1, '2016-11-23 03:31:01', '2016-12-07 03:31:01'),
(14, 1, 'Tb8b1bbfb4d10c5ea026ff63d5a66e5e', 'T weeks', 0, '2016-11-23 13:32:21', '2016-12-07 13:32:21'),
(15, 1, 'T4343be1803b54d919011e155079c1e3', 'T weeks', 0, '2016-11-23 09:01:10', '2016-12-07 09:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `marital_statuses`
--

CREATE TABLE `marital_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marital_statuses`
--

INSERT INTO `marital_statuses` (`id`, `name`) VALUES
(1, 'Married');

-- --------------------------------------------------------

--
-- Table structure for table `monthly_attendance_entries`
--

CREATE TABLE `monthly_attendance_entries` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `official_attendence` float NOT NULL,
  `casual_leave` float NOT NULL,
  `sick_leave` float NOT NULL,
  `earned_leave` float NOT NULL,
  `maternity_leave` float NOT NULL,
  `total_attendance` float NOT NULL,
  `panalty` float NOT NULL,
  `month_id` int(11) NOT NULL,
  `datetime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `monthly_attendance_entries`
--

INSERT INTO `monthly_attendance_entries` (`id`, `employee_id`, `official_attendence`, `casual_leave`, `sick_leave`, `earned_leave`, `maternity_leave`, `total_attendance`, `panalty`, `month_id`, `datetime`) VALUES
(1, 12, 21, 12, 21, 21, 21, 21, 12, 1, '2017-06-13'),
(2, 13, 212, 323, 43, 32, 23, 56, 21, 2, '2017-06-13'),
(3, 12, 22, 1, 2, 3, 4, 5, 6, 1, '2017-06-10'),
(4, 12, 22, 32, 54, 25, 54, 65, 65465, 1, '2017-01-06'),
(5, 13, 20, 3, 2, 32, 21, 12, 1111110, 2, '2017-06-15'),
(6, 13, 20, 3, 2, 32, 21, 12, 1111110, 2, '2017-06-15'),
(7, 13, 20, 3, 2, 32, 21, 12, 1111110, 2, '2017-06-15'),
(8, 13, 20, 3, 2, 32, 21, 12, 1111110, 2, '2017-06-15'),
(9, 13, 20, 3, 2, 32, 21, 12, 1111110, 2, '2017-06-15'),
(10, 12, 22, 442, 24342, 342, 4234, 242, 42342, 1, '2017-06-15'),
(11, 12, 22, 442, 24342, 342, 4234, 242, 42342, 1, '2017-06-15'),
(12, 12, 22, 442, 24342, 342, 4234, 242, 42342, 1, '2017-06-15'),
(13, 13, 22, 442, 24342, 342, 4234, 242, 42342, 1, '2017-06-15'),
(15, 12, 22, 5, 2, 4, 5, 4, 5000, 1, '2017-06-15'),
(16, 12, 20, 5, 4, 4, 5, 45, 40121, 2, '2017-06-15'),
(17, 12, 22, 12, 12, 21, 12, 21, 1212120, 1, '2017-06-15');

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `id` int(11) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`id`, `fiscal_year_id`, `name`) VALUES
(1, 1, 'January'),
(2, 1, 'February'),
(3, 1, 'March'),
(4, 1, 'April'),
(5, 1, 'May'),
(6, 1, 'June'),
(7, 1, 'July'),
(8, 1, 'Auguest'),
(9, 1, 'September'),
(10, 1, 'October'),
(11, 1, 'November'),
(12, 1, 'December'),
(13, 2, 'January'),
(14, 2, 'February'),
(15, 2, 'March'),
(16, 2, 'April'),
(17, 2, 'May'),
(18, 2, 'June'),
(19, 2, 'July'),
(20, 2, 'Auguest'),
(21, 2, 'September'),
(22, 2, 'October'),
(23, 2, 'Novermber'),
(24, 2, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `new_basics`
--

CREATE TABLE `new_basics` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `new_basics`
--

INSERT INTO `new_basics` (`id`, `name`) VALUES
(1, '123123123213');

-- --------------------------------------------------------

--
-- Table structure for table `quotas`
--

CREATE TABLE `quotas` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quotas`
--

INSERT INTO `quotas` (`id`, `name`) VALUES
(1, 'test'),
(2, 'test2'),
(3, 'test3');

-- --------------------------------------------------------

--
-- Table structure for table `religions`
--

CREATE TABLE `religions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `religions`
--

INSERT INTO `religions` (`id`, `name`) VALUES
(1, 'Islam');

-- --------------------------------------------------------

--
-- Table structure for table `salary_sheets`
--

CREATE TABLE `salary_sheets` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scales`
--

CREATE TABLE `scales` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scales`
--

INSERT INTO `scales` (`id`, `name`) VALUES
(1, '5000-60000');

-- --------------------------------------------------------

--
-- Table structure for table `sexes`
--

CREATE TABLE `sexes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sexes`
--

INSERT INTO `sexes` (`id`, `name`) VALUES
(1, 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_group_id` bigint(20) DEFAULT NULL,
  `sales_person_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `active` varchar(3) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_group_id`, `sales_person_id`, `username`, `password`, `email`, `name`, `active`, `created`, `modified`) VALUES
(1, 1, 15, 'Tdmin', 'e10adc3949ba59abbe56e057f20f883e', 'Tdmin@admin.com', 'Tdmin', 'T', '2016-11-16 14:30:26', '2017-02-14 08:42:06'),
(12, 3, 16, 'Tmrul', '', NULL, NULL, 'T', '2017-02-14 08:47:14', '2017-04-23 17:20:33'),
(14, 2, 18, 'Talesmanger', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-02-14 23:23:10', '2017-02-14 23:23:10'),
(15, 3, 20, 'Thittagong', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-02-15 03:05:35', '2017-02-15 03:05:35'),
(16, 3, 21, 'Thakawest', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-02-17 10:02:40', '2017-03-01 20:27:44'),
(23, 4, 30, 'T5012', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-02-20 04:18:14', '2017-03-20 16:27:26'),
(24, 4, 32, 'Thisty', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-02-20 04:38:09', '2017-02-20 04:38:09'),
(25, 3, 33, 'Tbdullah', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-02-20 05:07:16', '2017-02-20 05:07:16'),
(82, 4, 84, 'Tshraf1', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-03-14 22:07:29', '2017-03-14 22:07:29'),
(84, 4, 86, 'T1025', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-03-15 00:24:43', '2017-03-21 11:40:41'),
(86, 4, 88, 'Test10', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-03-15 13:00:44', '2017-03-15 13:25:27'),
(90, 4, 92, 'T2143', '', NULL, NULL, 'T', '2017-03-20 12:02:00', '2017-03-20 13:24:09'),
(91, 3, 93, 'Trena', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-03-20 14:01:42', '2017-03-20 14:01:42'),
(92, 4, 94, 'Trenaso', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-03-20 14:06:18', '2017-03-20 14:06:18'),
(93, 3, 95, 'T2028', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-03-20 15:52:28', '2017-03-20 15:52:28'),
(94, 3, 96, 'Tomilla', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-01 12:00:50', '2017-04-01 12:00:50'),
(95, 4, 97, 'T1032', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-01 12:18:30', '2017-04-01 12:18:30'),
(96, 4, 98, 'T2088', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-02 09:35:38', '2017-04-02 09:35:38'),
(97, 3, 99, 'Togra', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-02 13:45:55', '2017-04-02 13:45:55'),
(98, 3, 100, 'Tajshahi', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-02 15:08:08', '2017-04-02 15:08:08'),
(99, 3, 101, 'Tangpur', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-02 15:09:02', '2017-04-02 15:09:02'),
(100, 3, 102, 'Tushtia', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-02 15:09:38', '2017-04-02 15:09:38'),
(101, 3, 103, 'Thulna', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-02 15:10:18', '2017-04-02 15:10:18'),
(102, 3, 104, 'Tarisal', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-02 15:11:02', '2017-04-02 15:11:02'),
(103, 3, 105, 'Tymensingh', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-02 15:12:23', '2017-04-02 15:12:23'),
(104, 3, 106, 'Thaka west', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-02 15:13:24', '2017-04-02 15:13:24'),
(105, 3, 107, 'Thakaeast', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-02 15:14:14', '2017-04-05 11:47:48'),
(106, 3, 108, 'Tylhet', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-02 15:14:51', '2017-04-02 15:14:51'),
(107, 4, 109, 'Tbdul Wahed', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:40:47', '2017-04-06 11:17:22'),
(108, 4, 110, 'TM Ashiqur Rahman', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:41:27', '2017-04-06 11:17:50'),
(109, 4, 111, 'Tilon Biswash', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:42:48', '2017-04-06 11:18:36'),
(110, 4, 112, 'Tostafizur Rahman', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:43:40', '2017-04-06 11:19:05'),
(111, 4, 113, 'Turuzzaman', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:44:08', '2017-04-06 11:19:26'),
(112, 4, 114, 'Tafiqul Islam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:44:36', '2017-04-06 11:19:50'),
(113, 4, 115, 'Taidul Islam Mondol', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:45:17', '2017-04-06 11:20:12'),
(114, 4, 116, 'TKM Saiduzzaman', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:45:53', '2017-04-06 11:20:35'),
(115, 4, 117, 'Tarowar Hossain', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:46:25', '2017-04-06 11:22:52'),
(116, 4, 118, 'Tohammad Sohel', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:47:04', '2017-04-06 11:23:27'),
(117, 4, 119, 'Tirza Md. Razaul Islam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:47:37', '2017-04-06 11:24:22'),
(118, 4, 120, 'Tahangir Alam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:48:06', '2017-04-06 11:25:06'),
(119, 4, 121, 'Tahanur Alam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:48:38', '2017-04-06 11:26:24'),
(120, 4, 122, 'Trovat Chandra Chakravarty', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:49:19', '2017-04-06 11:27:12'),
(121, 4, 123, 'Telayet Hossain', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:49:51', '2017-04-06 13:00:19'),
(122, 4, 124, 'Thariful Awwal', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:50:22', '2017-04-06 13:17:43'),
(123, 4, 125, 'Tostafizur Mostaque', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:50:51', '2017-04-06 13:18:43'),
(124, 4, 126, 'Tahedul Islam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:51:21', '2017-04-06 13:19:30'),
(125, 4, 127, 'Tostofa Kamal Pasa', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:51:50', '2017-04-06 16:30:25'),
(126, 4, 128, 'Tabbir Ahommad Sajal', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:52:18', '2017-04-06 16:31:00'),
(127, 4, 129, 'Tojib Hasan', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:53:06', '2017-04-06 16:31:53'),
(128, 4, 130, 'Tezaul Karim', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:53:51', '2017-04-06 16:32:23'),
(129, 4, 131, 'Turujjaman', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:54:16', '2017-04-06 16:33:47'),
(130, 4, 132, 'Tbayedul Huq', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:55:00', '2017-04-06 16:34:21'),
(131, 4, 133, 'Taju Ahmed', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:55:27', '2017-04-06 16:34:49'),
(132, 4, 134, 'Tasum Imtiaj', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:55:50', '2017-04-06 16:35:30'),
(133, 4, 135, 'Tlamgir Kabir', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:56:36', '2017-04-06 16:36:19'),
(134, 4, 136, 'Tazlur Rahman', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:57:41', '2017-04-06 16:36:49'),
(135, 4, 137, 'Tafiqul Islam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:58:28', '2017-04-06 16:37:42'),
(136, 4, 138, 'Tzizur Rahman ', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 16:58:51', '2017-04-06 16:38:23'),
(137, 4, 139, 'Tyed Kamruzzaman', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:00:18', '2017-04-06 16:38:59'),
(138, 4, 140, 'T.M.Arifur Rahman', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:00:39', '2017-04-06 16:39:34'),
(139, 4, 141, 'Tohoshin', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:01:21', '2017-04-06 16:40:25'),
(140, 4, 142, 'Tamruzzaman Milon', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:01:49', '2017-04-06 16:41:53'),
(141, 4, 143, 'Tfzal Hossain', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:02:13', '2017-04-06 16:42:35'),
(142, 4, 144, 'Taiful Islam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:02:44', '2017-04-06 16:43:37'),
(143, 4, 145, 'Thahidul Islam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:04:04', '2017-04-06 16:44:09'),
(144, 4, 146, 'Tbdullah Mamun', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:04:30', '2017-04-06 16:44:58'),
(145, 4, 147, 'Tishor Kumar Raha', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:04:55', '2017-04-06 16:45:32'),
(146, 4, 148, 'Tarid Uddin', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:06:35', '2017-04-06 16:46:10'),
(147, 4, 149, 'T K M Yeahya', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:07:07', '2017-04-06 16:46:39'),
(148, 4, 150, 'Tolam Easin ', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:07:36', '2017-04-06 16:47:16'),
(149, 4, 151, 'Tehedi Hassan', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:08:06', '2017-04-06 16:47:46'),
(150, 4, 152, 'Tahbubur Rahman', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:08:31', '2017-04-06 16:48:23'),
(151, 4, 153, 'Tizanur Rahman ', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:08:59', '2017-04-06 16:48:51'),
(152, 4, 154, 'Tishikanta Banik', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:09:23', '2017-04-06 16:49:22'),
(153, 4, 155, 'Touhedur Rahman', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:10:31', '2017-04-06 16:49:52'),
(154, 4, 156, 'Tazi Fokroll Yslam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:12:07', '2017-04-06 16:50:42'),
(155, 4, 157, 'Tnupam Chandra Bhowmik', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:12:55', '2017-04-05 17:12:55'),
(156, 4, 158, 'TKM Shahid Hossain', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:13:27', '2017-04-05 17:13:27'),
(157, 4, 159, 'Thamsul Huda', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:13:51', '2017-04-05 17:13:51'),
(158, 4, 160, 'Tahirul Amin Khan', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:14:30', '2017-04-05 17:14:30'),
(159, 4, 161, 'Thazzad Hossain', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:15:11', '2017-04-05 17:15:11'),
(160, 4, 162, 'Tahangir Hossain', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:15:43', '2017-04-05 17:15:43'),
(161, 4, 163, 'Thlash Uddin Masum', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:16:17', '2017-04-05 17:16:17'),
(162, 4, 164, 'Taruque Hossain Shah', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:16:48', '2017-04-05 17:16:48'),
(163, 4, 165, 'Thorif Al Mamun', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:17:17', '2017-04-05 17:17:17'),
(164, 4, 166, 'Tura Arifin Chowdhury', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:17:46', '2017-04-05 17:17:46'),
(165, 4, 167, 'Tttpal Chandra Mondol', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:18:16', '2017-04-05 17:18:16'),
(166, 4, 168, 'Tareq Mahmud', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:18:47', '2017-04-05 17:18:47'),
(167, 4, 169, 'Thalekuzzaman', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:19:53', '2017-04-05 17:19:53'),
(168, 4, 170, 'Tondip Kumar Dhar', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:20:26', '2017-04-05 17:20:26'),
(169, 4, 171, 'Tbu Raihan Masud', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:21:24', '2017-04-05 17:21:24'),
(170, 4, 172, 'Tostafa Kamal', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:22:41', '2017-04-05 17:22:41'),
(171, 4, 173, 'Tahmud Reza', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:23:31', '2017-04-05 17:23:31'),
(172, 4, 174, 'Tazi Monzurul Islam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:23:58', '2017-04-05 17:23:58'),
(173, 4, 175, 'Tamun Ar Rashid', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:24:29', '2017-04-05 17:24:29'),
(174, 4, 176, 'Tohammed Atiqure Rahman Duke', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:25:08', '2017-04-05 17:25:08'),
(175, 4, 177, 'Touhidul Islam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:25:40', '2017-04-05 17:25:40'),
(176, 4, 178, 'TM Abdur Razzaque', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:26:05', '2017-04-05 17:26:05'),
(177, 4, 179, 'Tadequl Islam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:27:09', '2017-04-05 17:27:09'),
(178, 4, 180, 'Thamim Hossain', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:28:29', '2017-04-05 17:28:29'),
(179, 4, 181, 'Tohammad Tariqul Islam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:29:01', '2017-04-05 17:29:01'),
(180, 4, 182, 'Thamsuddin', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:29:27', '2017-04-05 17:29:27'),
(181, 4, 183, 'Tozaharul Islam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:29:57', '2017-04-05 17:29:57'),
(182, 4, 184, 'Tofazzal Hossain', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:30:24', '2017-04-05 17:30:24'),
(183, 4, 185, 'Tahangir Alam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:31:17', '2017-04-05 17:31:17'),
(184, 4, 186, 'Tofazzal Hossain Khan', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:33:10', '2017-04-05 17:33:10'),
(185, 4, 187, 'Thiman Bhoumik', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:33:52', '2017-04-05 17:33:52'),
(186, 4, 188, 'Thandaker Mostakim', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:35:29', '2017-04-05 17:35:29'),
(187, 4, 189, 'Tabir Ahmed', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:36:09', '2017-04-05 17:36:09'),
(188, 4, 190, 'Turshidul Hasan', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:36:43', '2017-04-05 17:36:43'),
(189, 4, 191, 'Tahidul Islam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:37:31', '2017-04-05 17:37:31'),
(190, 4, 192, 'Tr. Md. Rafiqul Ahsan', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:37:57', '2017-04-05 17:37:57'),
(191, 4, 193, 'Tr.Md. Zakir Hossain', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:38:34', '2017-04-05 17:38:34'),
(192, 4, 194, 'Telayet Hossain Khan', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:39:11', '2017-04-05 17:39:11'),
(193, 4, 195, 'Tufayel Hossain', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:39:40', '2017-04-05 17:39:40'),
(194, 4, 196, 'TM Mizanur Rahman', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:40:35', '2017-04-05 17:40:35'),
(195, 4, 197, 'Tr. Zahirul Islam Khan', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:41:10', '2017-04-05 17:41:10'),
(196, 4, 198, 'Tvijit Roy Biswas', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:41:53', '2017-04-05 17:41:53'),
(197, 4, 199, 'Tk.Ahsanul Karim', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:43:23', '2017-04-05 17:43:23'),
(198, 4, 200, 'Towhid Billah', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:45:50', '2017-04-05 17:45:50'),
(199, 4, 201, 'Tazikul Ahasan', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:46:29', '2017-04-05 17:46:29'),
(200, 4, 202, 'Tonoar Hossain', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:46:58', '2017-04-05 17:46:58'),
(201, 4, 203, 'Tossain Mohammad Sayem', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:47:36', '2017-04-05 17:47:36'),
(202, 4, 204, 'Tir Md. Rakibul Hasan', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:48:01', '2017-04-05 17:48:01'),
(203, 4, 205, 'Toutam Chandra Mahanta', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:48:26', '2017-04-05 17:48:26'),
(204, 4, 206, 'Tasud Rana', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:48:53', '2017-04-05 17:48:53'),
(205, 4, 207, 'Tohammad Anwar Hossain Mizi', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:49:19', '2017-04-05 17:49:19'),
(206, 4, 208, 'Tbdul Hakim', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:50:11', '2017-04-05 17:50:11'),
(207, 4, 209, 'Trokash Saha', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:51:52', '2017-04-05 17:51:52'),
(208, 4, 210, 'Thaymol Kumar Singha', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:52:19', '2017-04-05 17:52:19'),
(209, 4, 211, 'Telim Reza', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:52:45', '2017-04-05 17:52:45'),
(210, 4, 212, 'Tikash Chandra Bardhan', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:53:58', '2017-04-05 17:53:58'),
(211, 4, 213, 'T.M. Sheik Saadi', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:54:33', '2017-04-05 17:54:33'),
(212, 4, 214, 'Triful Islam', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-05 17:54:58', '2017-04-05 17:54:58'),
(213, 4, 215, 'Tumonuzzaman', '', NULL, NULL, 'T', '2017-04-05 17:55:28', '2017-04-05 23:10:06'),
(214, 4, 216, 'T0012', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-06 11:17:02', '2017-04-06 11:17:02'),
(215, 4, 10097, 'Trenaso2', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-04-16 12:39:12', '2017-04-16 12:39:12'),
(218, 4, 10100, 'Tntora', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-05-06 20:24:20', '2017-05-06 20:24:20'),
(219, 4, 10101, 'Trenaso3', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-05-14 20:22:34', '2017-05-14 20:22:34'),
(1219, 4, 20101, 'Taser', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-05-15 14:12:27', '2017-05-27 20:00:24'),
(2219, 6, 30101, 'Trenaspo', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-05-22 13:08:37', '2017-05-22 13:08:37'),
(2220, 6, 30102, 'Trenaspo2', 'T10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'T', '2017-05-22 13:32:39', '2017-05-29 13:10:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `alias_name` varchar(100) DEFAULT NULL,
  `allowregistration` int(11) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `name`, `alias_name`, `allowregistration`, `created`, `modified`) VALUES
(1, 'TasterAdmin', 'Taster admin', 1, '2016-11-16 14:30:26', '2017-02-26 09:49:02'),
(2, 'Tdmin', 'Tdmin', 1, '2016-11-16 14:30:26', '2016-11-16 14:30:26'),
(3, 'TSO', 'TSO Admin', 1, '2017-02-14 07:54:57', '2017-02-14 07:54:57'),
(4, 'TO', 'TO', 1, '2017-02-14 08:47:58', '2017-02-14 08:47:58'),
(5, 'Togistic', 'Trea Logistics Officer', 1, '2017-03-20 05:44:08', '2017-03-20 05:44:08'),
(6, 'TPO', 'TPO', 1, '2017-05-22 03:06:20', '2017-05-22 03:06:20');

-- --------------------------------------------------------

--
-- Table structure for table `user_group_permissions`
--

CREATE TABLE `user_group_permissions` (
  `id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `controller` varchar(50) NOT NULL,
  `action` varchar(100) NOT NULL,
  `allowed` tinyint(3) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group_permissions`
--

INSERT INTO `user_group_permissions` (`id`, `user_group_id`, `controller`, `action`, `allowed`) VALUES
(1, 1, 'departments', 'admin', 2),
(13082, 1, 'departments', 'admin_index', 1);

-- --------------------------------------------------------

--
-- Table structure for table `working_days`
--

CREATE TABLE `working_days` (
  `id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `fiscal_year_id` int(20) NOT NULL,
  `total_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `working_days`
--

INSERT INTO `working_days` (`id`, `month_id`, `fiscal_year_id`, `total_days`) VALUES
(1, 1, 1, 22),
(2, 2, 1, 20),
(3, 3, 1, 23),
(4, 4, 1, 16),
(5, 5, 1, 23),
(6, 6, 1, 24),
(7, 7, 1, 19),
(8, 8, 1, 21),
(10, 9, 1, 20),
(11, 10, 1, 22),
(12, 11, 1, 23),
(13, 12, 1, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basics`
--
ALTER TABLE `basics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `edu_statuses`
--
ALTER TABLE `edu_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_allowances`
--
ALTER TABLE `employee_allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_children`
--
ALTER TABLE `employee_children`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_grades`
--
ALTER TABLE `employee_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_recoveries`
--
ALTER TABLE `employee_recoveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_types`
--
ALTER TABLE `employee_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiscal_years`
--
ALTER TABLE `fiscal_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_statuses`
--
ALTER TABLE `job_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `living_statuses`
--
ALTER TABLE `living_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_tokens`
--
ALTER TABLE `login_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monthly_attendance_entries`
--
ALTER TABLE `monthly_attendance_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `new_basics`
--
ALTER TABLE `new_basics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotas`
--
ALTER TABLE `quotas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `religions`
--
ALTER TABLE `religions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_sheets`
--
ALTER TABLE `salary_sheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scales`
--
ALTER TABLE `scales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sexes`
--
ALTER TABLE `sexes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mail` (`email`),
  ADD KEY `user` (`username`),
  ADD KEY `users_fkindex1` (`user_group_id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_group_permissions`
--
ALTER TABLE `user_group_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `working_days`
--
ALTER TABLE `working_days`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `basics`
--
ALTER TABLE `basics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `edu_statuses`
--
ALTER TABLE `edu_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `employee_allowances`
--
ALTER TABLE `employee_allowances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee_children`
--
ALTER TABLE `employee_children`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee_grades`
--
ALTER TABLE `employee_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employee_recoveries`
--
ALTER TABLE `employee_recoveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee_types`
--
ALTER TABLE `employee_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fiscal_years`
--
ALTER TABLE `fiscal_years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `job_statuses`
--
ALTER TABLE `job_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `living_statuses`
--
ALTER TABLE `living_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `login_tokens`
--
ALTER TABLE `login_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `monthly_attendance_entries`
--
ALTER TABLE `monthly_attendance_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `months`
--
ALTER TABLE `months`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `new_basics`
--
ALTER TABLE `new_basics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `quotas`
--
ALTER TABLE `quotas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `religions`
--
ALTER TABLE `religions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `salary_sheets`
--
ALTER TABLE `salary_sheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `scales`
--
ALTER TABLE `scales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sexes`
--
ALTER TABLE `sexes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2221;
--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_group_permissions`
--
ALTER TABLE `user_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13083;
--
-- AUTO_INCREMENT for table `working_days`
--
ALTER TABLE `working_days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
