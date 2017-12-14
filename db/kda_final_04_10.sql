-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2017 at 08:32 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kda_final_04_10`
--

-- --------------------------------------------------------

--
-- Table structure for table `acc_head_lists`
--

CREATE TABLE `acc_head_lists` (
  `id` int(11) NOT NULL,
  `acc_head_type_id` int(11) NOT NULL,
  `head_name` varchar(100) NOT NULL,
  `head_code` varchar(25) DEFAULT NULL,
  `has_parent` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order_no` tinyint(4) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acc_head_lists`
--

INSERT INTO `acc_head_lists` (`id`, `acc_head_type_id`, `head_name`, `head_code`, `has_parent`, `parent_id`, `order_no`, `status`, `created_at`, `updated_at`) VALUES
(5, 4, 'Cash in hand', NULL, 0, 0, 0, 'Active', '2017-10-21', '0000-00-00'),
(9, 4, 'Bank deposit', NULL, 0, 0, 0, 'Active', '2017-10-21', '0000-00-00'),
(10, 4, 'Fixed Deposit', NULL, 0, 0, 0, 'Active', '2017-10-21', '0000-00-00'),
(11, 4, 'Stock Goods', NULL, 0, 0, 0, 'Active', '2017-10-21', '0000-00-00'),
(31, 3, 'Land and land development', '123456', 0, 0, 0, 'Active', '2017-10-27', '0000-00-00'),
(33, 4, 'Investment', NULL, 0, 0, 0, 'Active', '2017-10-27', '0000-00-00'),
(35, 4, 'Advanced', NULL, 0, 0, 0, 'Active', '2017-10-27', '0000-00-00'),
(36, 4, 'Computer Loan', NULL, 1, 35, 1, 'Active', '2017-10-27', '0000-00-00'),
(37, 4, 'Motor Cycle Advanced', NULL, 1, 35, 2, 'Active', '2017-10-27', '0000-00-00'),
(38, 3, 'Majgoni Project', NULL, 1, 31, 1, 'Active', '2017-10-27', '0000-00-00'),
(39, 3, 'Nirala', NULL, 1, 31, 2, 'Active', '2017-10-27', '0000-00-00'),
(40, 3, 'Building and Others', NULL, 0, 0, 0, 'Active', '2017-10-27', '0000-00-00'),
(41, 3, 'KDA VABPN', NULL, 1, 40, 1, 'Active', '2017-10-27', '0000-00-00'),
(42, 3, 'KDA Communating  Centre', NULL, 1, 40, 2, 'Active', '2017-10-27', '0000-00-00'),
(43, 2, 'Travel Cost', NULL, 0, 0, 0, 'Active', '2017-10-27', '0000-00-00'),
(44, 2, 'Fuel Coat', NULL, 0, 0, 0, 'Active', '2017-10-27', '0000-00-00'),
(45, 1, 'Rent', NULL, 0, 0, 0, 'Active', '2017-10-27', '0000-00-00'),
(46, 1, 'Kda Terminal', NULL, 1, 45, 1, 'Active', '2017-10-27', '0000-00-00'),
(47, 1, 'Kda Shop', NULL, 1, 45, 2, 'Active', '2017-10-27', '0000-00-00'),
(48, 5, 'Security deposit', NULL, 0, 0, 0, 'Active', '2017-10-27', '0000-00-00'),
(49, 4, 'Cash in hand 1', NULL, 1, 5, 1, 'Active', '2017-10-28', '0000-00-00'),
(50, 4, 'Cash in hand 2', NULL, 1, 5, 2, 'Active', '2017-10-28', '0000-00-00'),
(51, 6, 'Fund No 1', NULL, 0, 0, 0, 'Active', '2017-10-29', '0000-00-00'),
(52, 4, 'Sonali 5050', NULL, 1, 10, 1, 'Active', '2017-11-11', '0000-00-00'),
(53, 4, 'Trust Bank 6060', NULL, 1, 10, 2, 'Active', '2017-11-11', '0000-00-00'),
(54, 4, 'Rupali 7070', NULL, 1, 10, 3, 'Active', '2017-11-11', '0000-00-00'),
(55, 5, 'Security deposit 1', NULL, 1, 48, 1, 'Active', '2017-11-11', '0000-00-00'),
(56, 5, ' Security deposit 2', '12', 1, 48, 2, 'Active', '2017-11-11', '0000-00-00'),
(57, 4, 'Fix deposit Pobali Bank', NULL, 1, 10, 1, 'Active', '2017-11-12', '0000-00-00'),
(58, 4, 'ww', '123', 0, 0, 0, 'Active', '2017-11-21', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `acc_head_types`
--

CREATE TABLE `acc_head_types` (
  `id` int(6) NOT NULL,
  `head_type_name` varchar(200) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acc_head_types`
--

INSERT INTO `acc_head_types` (`id`, `head_type_name`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'আয়', 'Active', 1, '2017-09-29 13:02:30', '0000-00-00 00:00:00'),
(2, 'ব্যয়', 'Active', 1, '2017-09-29 13:20:24', '0000-00-00 00:00:00'),
(3, 'স্থায়ী সম্পত্তি', 'Active', 1, '2017-10-01 17:40:44', '0000-00-00 00:00:00'),
(4, 'চলতি সম্পত্তি', 'Active', 1, '2017-10-01 17:43:47', '0000-00-00 00:00:00'),
(5, 'দায়', 'Active', 1, '2017-10-01 17:44:00', '0000-00-00 00:00:00'),
(6, 'তহবিল', 'Active', 1, '2017-10-24 22:11:39', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `annual_depriciations`
--

CREATE TABLE `annual_depriciations` (
  `id` int(11) NOT NULL,
  `acc_head_list_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `depriciation_value` decimal(8,2) NOT NULL DEFAULT '0.00',
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `annual_depriciations`
--

INSERT INTO `annual_depriciations` (`id`, `acc_head_list_id`, `parent_id`, `fiscal_year_id`, `depriciation_value`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 38, 31, 2, '2.00', 1, '2017-11-05 18:19:47', NULL),
(2, 39, 31, 2, '2.50', 1, '2017-11-05 18:19:47', NULL),
(3, 41, 40, 3, '2.60', 1, '2017-11-05 18:19:47', NULL),
(4, 42, 40, 3, '2.70', 1, '2017-11-05 18:19:47', NULL),
(5, 38, 31, 4, '3.10', 1, '2017-11-05 18:20:20', NULL),
(6, 39, 31, 4, '3.20', 1, '2017-11-05 18:20:20', NULL),
(7, 41, 40, 4, '3.30', 1, '2017-11-05 18:20:20', NULL),
(8, 42, 40, 4, '3.40', 1, '2017-11-05 18:20:20', NULL);

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
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `bank_info_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `account_no` varchar(64) DEFAULT NULL,
  `account_type` enum('revenue_account','capital_account') DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  `user_id` int(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `bank_info_id`, `branch_id`, `account_no`, `account_type`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '9847938457938', 'revenue_account', 'Active', 1, '2017-09-29 19:34:45', '2017-09-29 22:08:25'),
(2, 1, 3, '94857938677', 'revenue_account', 'Active', 1, '2017-09-29 19:35:06', '2017-09-29 22:07:47'),
(3, 3, 1, '123456', 'capital_account', 'Active', 1, '2017-10-30 14:56:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank_account_balance`
--

CREATE TABLE `bank_account_balance` (
  `id` int(11) NOT NULL,
  `daily_transaction_id` int(11) NOT NULL,
  `bank_info_id` int(11) NOT NULL DEFAULT '0',
  `branch_id` int(11) NOT NULL,
  `bank_account_id` int(11) NOT NULL,
  `transaction_amount` decimal(12,2) NOT NULL,
  `account_balance` decimal(12,2) NOT NULL,
  `flag` enum('Addition','Subtraction') NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank_account_balance`
--

INSERT INTO `bank_account_balance` (`id`, `daily_transaction_id`, `bank_info_id`, `branch_id`, `bank_account_id`, `transaction_amount`, `account_balance`, `flag`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 2, '6565.00', '6565.00', 'Addition', '2017-11-21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank_infos`
--

CREATE TABLE `bank_infos` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank_infos`
--

INSERT INTO `bank_infos` (`id`, `name`) VALUES
(1, 'DBBL'),
(2, 'Sonali Bank'),
(3, 'Trust Bank');

-- --------------------------------------------------------

--
-- Table structure for table `basics`
--

CREATE TABLE `basics` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `basic_type` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `basics`
--

INSERT INTO `basics` (`id`, `name`, `basic_type`) VALUES
(1, '10000', 1),
(2, '200000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(11) NOT NULL,
  `bank_info_id` int(11) NOT NULL,
  `branch` varchar(64) NOT NULL,
  `user_id` int(7) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `bank_info_id`, `branch`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, 'Dhaka Branch', 1, '2017-09-29 19:03:16', '2017-09-29 19:08:24'),
(2, 2, 'Dhaka Branch', 1, '2017-09-29 19:08:45', '0000-00-00 00:00:00'),
(3, 1, 'Khulna Branch', 1, '2017-09-29 19:08:57', '0000-00-00 00:00:00'),
(4, 1, 'Gulshan Branch', 1, '2017-09-29 19:09:30', '0000-00-00 00:00:00'),
(5, 4, 'Bhola Branch', 1, '2017-09-29 19:10:13', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `budget_categories`
--

CREATE TABLE `budget_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `budget_categories`
--

INSERT INTO `budget_categories` (`id`, `name`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Proposed Budget', 'Active', 1, '2017-11-12 14:27:56', '2017-11-13 13:16:38'),
(2, 'Approved Budget', 'Active', 1, '2017-11-13 13:16:59', NULL),
(3, 'Propose Revised Budget', 'Active', 1, '2017-11-13 13:17:17', NULL),
(4, 'Actual for 6 Month Budget', 'Active', 1, '2017-11-13 13:17:48', NULL),
(5, 'Actual Budget', 'Active', 1, '2017-11-13 13:18:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `budget_details`
--

CREATE TABLE `budget_details` (
  `id` int(11) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `budget_schedule_id` int(11) NOT NULL,
  `budget_head_list_id` int(11) NOT NULL,
  `budget_category_id` int(11) NOT NULL,
  `budget_type_id` int(11) NOT NULL,
  `budget_amount` decimal(12,2) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `budget_head_lists`
--

CREATE TABLE `budget_head_lists` (
  `id` int(11) NOT NULL,
  `budget_schedule_id` int(11) NOT NULL,
  `head_name` varchar(255) NOT NULL,
  `order_no` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `budget_head_lists`
--

INSERT INTO `budget_head_lists` (`id`, `budget_schedule_id`, `head_name`, `order_no`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Basic Pay', 1, 'Active', 1, '2017-11-12 14:11:01', '2017-11-12 20:00:08'),
(2, 1, 'Conveyance Allowance', 2, 'Active', 1, '2017-11-12 20:00:47', NULL),
(3, 1, 'Medical Allowance', 3, 'Active', 1, '2017-11-12 20:01:07', NULL),
(4, 1, 'House Rent Allowance', 4, 'Active', 1, '2017-11-12 20:01:31', NULL),
(5, 1, 'Entertainment Allowance', 5, 'Active', 1, '2017-11-12 20:01:52', NULL),
(6, 2, 'Office Expense 1', 1, 'Active', 1, '2017-11-13 17:46:38', NULL),
(7, 2, 'Office Expense 2', 2, 'Active', 1, '2017-11-13 17:46:57', '2017-11-13 17:47:35');

-- --------------------------------------------------------

--
-- Table structure for table `budget_schedules`
--

CREATE TABLE `budget_schedules` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `budget_schedules`
--

INSERT INTO `budget_schedules` (`id`, `name`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Salary & Allowances', 'Active', 1, '2017-11-12 13:55:48', '2017-11-12 21:27:03'),
(2, 'Office Expenses', 'Active', 0, '2017-11-12 13:58:01', NULL),
(3, 'WELFARE AND OTHER BENEFITS', 'Active', 1, '2017-11-12 19:57:44', NULL),
(4, 'REPAIR AND MAINTENANCE', 'Active', 1, '2017-11-12 19:58:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `budget_types`
--

CREATE TABLE `budget_types` (
  `id` int(11) NOT NULL,
  `name` varchar(63) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `budget_types`
--

INSERT INTO `budget_types` (`id`, `name`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Accounts', 'Active', 1, '2017-11-12 19:37:50', '2017-11-12 19:41:07'),
(2, 'Estate', 'Active', 1, '2017-11-12 19:41:32', NULL),
(3, 'Project', 'Active', 1, '2017-11-12 19:42:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `config_metas`
--

CREATE TABLE `config_metas` (
  `id` int(11) NOT NULL,
  `trackingId` int(11) DEFAULT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `comment` text,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('Active','Inactive','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config_metas`
--

INSERT INTO `config_metas` (`id`, `trackingId`, `key`, `value`, `comment`, `create_date`, `update_date`, `user_id`, `status`) VALUES
(4, NULL, 'allowance_medical', '1500', NULL, '2017-07-29 15:23:22', '0000-00-00 00:00:00', 1, 'Active'),
(5, NULL, 'allowance_education', '500', NULL, '2017-07-29 15:24:08', '0000-00-00 00:00:00', 1, 'Active'),
(6, NULL, 'allowance_convence', '300', NULL, '2017-07-29 15:24:28', '0000-00-00 00:00:00', 1, 'Active'),
(7, NULL, 'allowance_tiffin', '200', NULL, '2017-07-29 15:24:59', '0000-00-00 00:00:00', 1, 'Active'),
(8, NULL, 'allowance_wash', '100', NULL, '2017-07-29 15:25:33', '0000-00-00 00:00:00', 1, 'Active'),
(9, NULL, 'recovery_beneficiary_fund', '50', NULL, '2017-07-29 15:26:44', '0000-00-00 00:00:00', 1, 'Active'),
(10, NULL, 'recovery_gi', '30', NULL, '2017-07-29 15:27:39', '0000-00-00 00:00:00', 1, 'Active'),
(11, NULL, 'recovery_tin_shed', '200', NULL, '2017-07-29 15:28:00', '0000-00-00 00:00:00', 1, 'Active'),
(12, 32, 'sal_boishikh', '20', 'Salary configuration', '2017-08-08 06:27:05', '2017-08-08 07:52:53', 1, 'Active'),
(13, 31, 'sal_general', '1', 'Salary configuration', '2017-08-08 06:28:08', '2017-08-08 07:52:41', 1, 'Active'),
(14, 33, 'sal_festival_muslims', '100', 'Salary configuration', '2017-08-08 06:28:51', '2017-08-08 07:52:29', 1, 'Active'),
(15, 34, 'sal_festival_hinduism', '200', 'Salary configuration', '2017-08-08 06:30:06', '2017-08-08 07:52:18', 1, 'Active'),
(16, 35, 'sal_festival_cristianity', '200', 'Salary  for cristianity', '2017-08-08 06:49:34', '2017-08-08 07:52:06', 1, 'Active'),
(17, 36, 'sal_festival_buddhisam', '200', 'salary  for buddisham', '2017-08-08 06:51:59', '2017-08-08 07:51:56', 1, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `contructor_advance_payments`
--

CREATE TABLE `contructor_advance_payments` (
  `id` int(11) NOT NULL,
  `work_order_id` int(11) NOT NULL,
  `contructor_project_name_id` int(11) NOT NULL,
  `contructor_name_id` int(11) NOT NULL,
  `workorder_no` varchar(40) NOT NULL,
  `advance_amount` double(11,2) NOT NULL,
  `recovery_advance_amount` double(11,2) NOT NULL,
  `total_advance_paid` double(11,2) NOT NULL,
  `voucher_no` varchar(40) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_note` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contructor_advance_payments`
--

INSERT INTO `contructor_advance_payments` (`id`, `work_order_id`, `contructor_project_name_id`, `contructor_name_id`, `workorder_no`, `advance_amount`, `recovery_advance_amount`, `total_advance_paid`, `voucher_no`, `fiscal_year_id`, `payment_date`, `payment_note`, `user_id`, `created_at`, `updated_at`) VALUES
(113, 7, 24, 5, '1234', 2000.00, 600.00, 2000.00, '1', 1, '2017-09-08', '1', 1, '2017-09-16 12:30:04', '0000-00-00 00:00:00'),
(115, 9, 24, 5, '3456', 1000.00, 0.00, 1000.00, '1', 1, '2017-09-03', '3', 1, '2017-09-16 12:31:21', '0000-00-00 00:00:00'),
(119, 9, 24, 5, '3456', 400.00, 500.00, 1400.00, '1', 1, '2017-09-14', '4', 1, '2017-09-16 12:58:43', '0000-00-00 00:00:00'),
(120, 10, 25, 5, '7890', 20000.00, 5000.00, 20000.00, '1', 1, '2017-09-10', 'test', 1, '2017-09-19 13:04:28', '0000-00-00 00:00:00'),
(121, 11, 26, 6, '0514', 1500000.00, 50000.00, 1500000.00, '1', 1, '2017-09-13', 'test', 1, '2017-09-20 10:53:06', '0000-00-00 00:00:00'),
(122, 13, 28, 7, '456', 120000.00, 50000.00, 120000.00, '234', 3, '2017-10-02', 'Payment Note', 1, '2017-10-03 11:02:12', '0000-00-00 00:00:00'),
(123, 12, 24, 5, '', 100000.00, 0.00, 100000.00, '2724711111', 2, '2017-10-11', '', 1, '2017-10-12 15:49:56', '2017-10-12 18:46:54'),
(126, 12, 24, 5, '', 2000.00, 0.00, 102000.00, '343536', 2, '2017-10-25', '', 1, '2017-10-14 16:04:31', '0000-00-00 00:00:00'),
(127, 12, 24, 5, '', 333.00, 0.00, 102333.00, '34243', 2, '2017-10-20', '', 1, '2017-10-14 16:06:12', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `contructor_bill_payments`
--

CREATE TABLE `contructor_bill_payments` (
  `id` int(11) NOT NULL,
  `work_order_id` int(11) NOT NULL,
  `contructor_project_name_id` int(11) NOT NULL,
  `contructor_name_id` int(11) NOT NULL,
  `work_order_no` varchar(40) NOT NULL,
  `bill_amount` double(11,2) NOT NULL,
  `voucher_no` varchar(40) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `vat_%` double(11,2) NOT NULL,
  `vat` double(11,2) NOT NULL,
  `tax_%` double(11,2) NOT NULL,
  `tax` double(11,2) NOT NULL,
  `security_money_%` double(11,2) NOT NULL,
  `security_money` double(11,2) NOT NULL,
  `total_security_money_deducted` decimal(11,2) NOT NULL,
  `advance_adjustment` double(11,2) NOT NULL,
  `total_advance_adjustment_deducted` decimal(12,2) NOT NULL,
  `net_pay` double(11,2) NOT NULL,
  `bill_pay_date` date NOT NULL,
  `payment_note` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contructor_bill_payments`
--

INSERT INTO `contructor_bill_payments` (`id`, `work_order_id`, `contructor_project_name_id`, `contructor_name_id`, `work_order_no`, `bill_amount`, `voucher_no`, `fiscal_year_id`, `vat_%`, `vat`, `tax_%`, `tax`, `security_money_%`, `security_money`, `total_security_money_deducted`, `advance_adjustment`, `total_advance_adjustment_deducted`, `net_pay`, `bill_pay_date`, `payment_note`, `user_id`, `created_at`, `updated_at`) VALUES
(47, 7, 24, 5, '1234', 200000.00, '1', 1, 1.00, 2000.00, 1.00, 2000.00, 1.00, 2000.00, '2000.00', 1.00, '0.00', 193999.00, '2017-09-15', '4', 1, '2017-09-16 12:36:25', '0000-00-00 00:00:00'),
(48, 9, 24, 5, '3456', 999999999.99, '4', 1, 1.00, 424424256.00, 1.00, 424424256.00, 1.00, 424424256.00, '424424256.00', 323.00, '0.00', 999999999.99, '2017-09-12', '3', 1, '2017-09-16 12:36:54', '0000-00-00 00:00:00'),
(50, 7, 24, 5, '1234', 200000.00, '1', 1, 1.00, 2000.00, 1.00, 2000.00, 1.00, 2000.00, '4000.00', 500.00, '0.00', 193500.00, '2017-09-14', '2', 1, '2017-09-16 13:06:20', '0000-00-00 00:00:00'),
(51, 7, 24, 5, '1234', 400000.00, '1', 1, 1.00, 4000.00, 1.00, 4000.00, 1.00, 4000.00, '8000.00', 500.00, '0.00', 387500.00, '2017-09-15', '1', 1, '2017-09-16 13:07:24', '0000-00-00 00:00:00'),
(52, 7, 24, 5, '1234', 400000.00, '1', 1, 1.00, 4000.00, 1.00, 4000.00, 1.00, 4000.00, '12000.00', 100.00, '0.00', 387900.00, '2017-09-15', 'de', 1, '2017-09-16 13:08:02', '0000-00-00 00:00:00'),
(53, 9, 24, 5, '3456', 200000.00, '2', 1, 1.00, 2000.00, 1.00, 2000.00, 1.00, 2000.00, '424426240.00', 200.00, '0.00', 193800.00, '2017-09-15', '2', 1, '2017-09-16 13:09:04', '0000-00-00 00:00:00'),
(54, 9, 24, 5, '3456', 30000.00, '12', 1, 1.00, 300.00, 1.00, 300.00, 1.00, 300.00, '424426560.00', 300.00, '0.00', 28800.00, '2017-09-15', '1', 1, '2017-09-16 13:09:42', '0000-00-00 00:00:00'),
(55, 10, 25, 5, '7890', 10000.00, '1', 1, 1.00, 100.00, 1.00, 100.00, 1.00, 100.00, '100.00', 5000.00, '0.00', 4700.00, '2017-09-12', 'test', 1, '2017-09-19 13:05:24', '0000-00-00 00:00:00'),
(56, 11, 26, 6, '0514', 3000000.00, '1', 1, 5.00, 150000.00, 5.00, 150000.00, 10.00, 300000.00, '300000.00', 50000.00, '0.00', 2350000.00, '2017-09-15', 'test', 1, '2017-09-20 10:54:26', '0000-00-00 00:00:00'),
(57, 13, 28, 7, '456', 230000.00, '777888', 3, 13.00, 29900.00, 11.00, 25300.00, 15.00, 34500.00, '34500.00', 50000.00, '0.00', 90300.00, '2017-10-02', 'Bill Payment Info', 1, '2017-10-03 11:04:41', '0000-00-00 00:00:00'),
(58, 12, 24, 5, '', 20000.00, '123456', 2, 1.00, 200.00, 2.00, 400.00, 3.00, 600.00, '600.00', 5000.00, '5000.00', 18800.00, '2017-10-18', '', 1, '2017-10-16 14:40:44', '0000-00-00 00:00:00'),
(60, 12, 24, 5, '', 10000.00, '1234567', 2, 2.00, 200.00, 3.00, 300.00, 4.00, 400.00, '1000.00', 4000.00, '9000.00', 9100.00, '2017-10-16', '', 1, '2017-10-16 14:48:36', '0000-00-00 00:00:00'),
(61, 12, 24, 5, '', 200000.00, '12345678', 2, 1.00, 2000.00, 1.00, 2000.00, 1.00, 2000.00, '3000.00', 20000.00, '29000.00', 194000.00, '2017-10-16', '', 1, '2017-10-16 14:51:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `contructor_names`
--

CREATE TABLE `contructor_names` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `owner_name` varchar(100) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `address` text,
  `phone` varchar(40) NOT NULL,
  `alternative_phone` varchar(40) DEFAULT NULL,
  `licence_no` varchar(40) NOT NULL,
  `licence_category_id` int(11) NOT NULL,
  `licence_fee` decimal(12,2) NOT NULL,
  `enlisted_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contructor_names`
--

INSERT INTO `contructor_names` (`id`, `name`, `owner_name`, `father_name`, `address`, `phone`, `alternative_phone`, `licence_no`, `licence_category_id`, `licence_fee`, `enlisted_date`, `user_id`, `created_at`, `updated_at`) VALUES
(5, 'Malek Company', 'Abdul Malek', 'Abur Rahman', 'gulshan 1, Dhaka', '01799848350', '01676572318', '1234', 1, '2000.00', '2017-09-05', 1, '2017-09-12 11:10:38', '2017-09-14 18:43:02'),
(6, 'Karim Group', 'Mr Karim', 'Rajjak Hossain', 'Dhaka', '1', '1', '9090', 2, '20000.00', '2017-09-04', 1, '2017-09-20 10:51:51', '0000-00-00 00:00:00'),
(7, 'Sultan Group of Industries', 'Sultan Mahmud', '', 'Khulna', '017777766655', '018776457367', '45678', 3, '12000.00', '2017-10-03', 1, '2017-10-03 10:53:17', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `contructor_project_names`
--

CREATE TABLE `contructor_project_names` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `project_type_id` int(11) NOT NULL,
  `project_head_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `project_value` double(12,2) NOT NULL,
  `schedule_money` double(11,2) NOT NULL,
  `schedule_money_%` double(11,2) NOT NULL,
  `security_money` double(11,2) NOT NULL,
  `security_money_%` double(11,2) NOT NULL,
  `project_start_date` date NOT NULL,
  `projcet_details` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contructor_project_names`
--

INSERT INTO `contructor_project_names` (`id`, `name`, `project_type_id`, `project_head_name`, `location`, `project_value`, `schedule_money`, `schedule_money_%`, `security_money`, `security_money_%`, `project_start_date`, `projcet_details`, `user_id`, `created_at`, `updated_at`) VALUES
(24, 'Arena Properties', 5, 'Arena group', 'Dhaka', 500000.00, 250000.00, 5.00, 50000.00, 10.00, '2017-09-01', 'Arena Property maintenane', 1, '2017-09-12 11:08:05', '2017-09-12 11:16:11'),
(25, 'AD65 Project', 2, 'Mr. Rashid', 'Dhaka', 500000.00, 10000.00, 2.00, 150000.00, 3.00, '2017-09-08', 'details', 1, '2017-09-14 19:12:27', '2017-09-14 19:12:44'),
(26, 'Project Nebula', 5, 'Mr. Rahman', 'Dhaka', 150000000.00, 7500000.00, 5.00, 15000000.00, 10.00, '2017-09-03', 'test', 1, '2017-09-20 10:50:09', '0000-00-00 00:00:00'),
(27, 'Padma Bridge', 1, 'Bridge', 'Mawa', 9999999999.99, 999999999.99, 23.00, 999999999.99, 32.00, '2017-09-01', '', 1, '2017-10-02 13:42:54', '2017-10-02 13:45:27'),
(28, 'Jamuna Bridge', 2, 'Jamuna Bridge Repairing', 'Tangail', 20000000.00, 999999999.99, 1200000.00, 999999999.99, 23000.00, '2017-09-01', 'Repairing of Jamuna Bridge', 1, '2017-10-03 10:54:44', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `daily_transactions`
--

CREATE TABLE `daily_transactions` (
  `id` bigint(20) NOT NULL,
  `entry_type_id` int(11) NOT NULL,
  `acc_head_type_id` int(8) NOT NULL,
  `acc_head_list_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `bank_info_id` int(3) NOT NULL DEFAULT '0',
  `check_no` varchar(100) DEFAULT NULL,
  `branch_id` int(4) NOT NULL DEFAULT '0',
  `bank_account_id` int(11) NOT NULL DEFAULT '0',
  `transaction_category_id` int(11) NOT NULL,
  `transaction_type_id` int(11) NOT NULL,
  `fiscal_year_id` int(3) NOT NULL,
  `month_id` int(3) NOT NULL,
  `transaction_amount` decimal(12,2) NOT NULL,
  `voucher_no` varchar(45) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_note` text,
  `balance_status` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(7) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `daily_transactions`
--

INSERT INTO `daily_transactions` (`id`, `entry_type_id`, `acc_head_type_id`, `acc_head_list_id`, `parent_id`, `bank_info_id`, `check_no`, `branch_id`, `bank_account_id`, `transaction_category_id`, `transaction_type_id`, `fiscal_year_id`, `month_id`, `transaction_amount`, `voucher_no`, `transaction_date`, `transaction_note`, `balance_status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 38, 31, 1, '476e674674746', 0, 2, 2, 1, 2, 1, '6565.00', '4343', '2017-12-01', '', 0, 1, '2017-11-21 19:19:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deduct_salaries`
--

CREATE TABLE `deduct_salaries` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deduct_salaries`
--

INSERT INTO `deduct_salaries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Deduct Salary on half day ', NULL, NULL),
(2, 'Deduct Salary on full day', NULL, NULL);

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
(1, 'KDA'),
(2, 'প্রশাসন ও সাধারন শাখা '),
(3, 'হিসাব রক্ষন শাখা '),
(4, 'বৈষয়িক শাখা '),
(5, 'পূর্ত বিভাগ'),
(6, 'অথরাইজড শাখা '),
(7, 'পরিকল্পনা বিভাগ'),
(9, 'কম্পিউটার সেল'),
(10, 'অডিট শাখা'),
(11, 'প্রধান প্রকৌশলীর দপ্তর '),
(12, 'রক্ষনা বেক্ষন শাখা'),
(13, 'প্রকল্প শাখা');

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
(3, 'প্রধান প্রকৌশলী (চঃদাঃ)'),
(4, 'প্রধান অর্থ ও হিসাব রক্ষণ অফিসার(চঃদাঃ)'),
(5, 'তত্ত্ববধায়ক প্রকৌশলী (অঃদাঃ)'),
(6, 'নির্বাহী প্রকৌশলী (প্রকল্প)'),
(7, 'সিনিয়র বৈষয়িক অফিসার'),
(9, 'অর্থ ও হিসাব রক্ষণ অফিসার(অঃদাঃ)'),
(10, 'নির্বাহী প্রকৌশলী রক্ষণাবেক্ষণ (অঃদাঃ)'),
(11, 'অডিট অফিসার'),
(12, 'সহকারী সচিব'),
(13, 'বৈষয়িক অফিসার'),
(14, 'পরিকল্পনা অফিসার'),
(15, 'হিসাব রক্ষণ অফিসার'),
(16, 'নির্বাহী প্রকৌশলী পূর্ত (চঃদাঃ)'),
(17, 'সহকারী প্রকৌশলী'),
(18, 'একান্ত সচিব/কো-অর্ডিনেশন অফিসার'),
(19, 'সহকারী নগর পরিকল্পনাবীদ'),
(20, 'সহকারী প্রোগ্রামার (চঃদাঃ)'),
(21, 'উপ-সহকারী প্রকৌশলী'),
(22, 'সহকারী প্রকৌশলী যান্ত্রিক (অঃদাঃ)'),
(23, 'উপ-সহকারী প্রকৌশলী'),
(24, 'প্রধান প্রাক্কারক'),
(25, 'অফিস অধিক্ষক'),
(26, 'প্রশাসনিক কর্মকর্তা'),
(27, 'প্রক্কারক'),
(28, 'ষাট মুদ্রাক্ষরিক-কাম-কম্পিউটার অপারেটর'),
(29, 'উচ্চমান সহকারী'),
(30, 'সিকিউরিটি ইনসপেক্টর'),
(31, 'নিম্নমান সহকারী তথা মুদ্রাক্ষরিক'),
(32, 'পেশ ইমাম'),
(33, 'ষাট লিপিকার -কাম কম্পিউটার অপারেটর'),
(34, ' টেলিফোন অপারেটর'),
(35, 'অংকনবীদ'),
(36, 'অফিস সহকারী কাম কম্পিউটার মুদ্রাক্ষরিক'),
(37, 'কেয়ারটেকার'),
(38, 'লিফট ম্যান'),
(39, 'মোয়াজ্জিন'),
(40, 'অফিস সহায়ক'),
(41, 'ডেসপাস রাইটার'),
(42, 'পাম্প চালক'),
(43, 'ডেসপাস রাইডার'),
(44, 'ফটোকপি অপারেটর'),
(45, 'খাদেম'),
(46, 'মালী'),
(47, 'নিরাপত্তা প্রহরী'),
(48, 'পরিচ্ছন্নতা কর্মী'),
(49, 'হিসাব রক্ষক'),
(50, 'সহকারী হিসাব রক্ষক'),
(51, 'ক্যাশিয়ার'),
(52, 'ক্যাশ সরকার'),
(53, 'চেইনম্যান'),
(54, 'বাজার তত্ত্বাবধায়ক'),
(55, 'পরিদর্শক'),
(56, 'সার্ভেয়ার'),
(57, 'খাজনা আদায়কারী'),
(58, 'আইন সহকারী'),
(59, 'প্রতি-অংকনবীদ'),
(60, 'কার্য্য সহকারী'),
(61, 'বৈদ্যুতিক মিস্ত্রী'),
(62, 'ইমারত পরিদর্শক'),
(63, 'প্রসেস সার্ভার'),
(64, 'প্রধান অংকনবীদ'),
(65, 'মাঠ সহকারী'),
(66, 'কম্পিউটার অপারেটর'),
(67, 'ডুপ্লিকেটিং মেশিন অপারেটর'),
(68, 'ওভারশিয়ার'),
(69, 'অডিটর'),
(70, 'গাড়ী চালক'),
(71, 'বুলড্রোজার ড্রাইভার'),
(72, 'ম্যাকানিক'),
(73, 'প্লাম্বার মিস্ত্রী'),
(74, 'সুইপার'),
(75, 'অডিট সহকারী');

-- --------------------------------------------------------

--
-- Table structure for table `due_salary_sheets`
--

CREATE TABLE `due_salary_sheets` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `current_basic` double(10,2) NOT NULL,
  `new_basic_salary` double(10,2) NOT NULL,
  `da` double(10,2) NOT NULL,
  `pp` double(10,2) NOT NULL,
  `medical` double(10,2) NOT NULL,
  `convance` double(10,2) NOT NULL,
  `wash` double(10,2) NOT NULL,
  `mobile` double(10,2) NOT NULL,
  `cycle` double(10,2) NOT NULL,
  `charge` double(10,2) NOT NULL,
  `other` double(10,2) NOT NULL,
  `gross_pay` double(10,2) NOT NULL,
  `house_rent` double(10,2) NOT NULL,
  `telephone_allowance` double(10,2) NOT NULL,
  `tiffin` double(10,2) NOT NULL,
  `education` double(10,2) NOT NULL,
  `status` enum('Active','Inactive','','') NOT NULL,
  `total_payable` int(11) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `due_days` int(11) NOT NULL DEFAULT '0',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(2, 'NOt study');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `employee_name_bengali` varchar(100) DEFAULT NULL,
  `employeeID` int(11) NOT NULL,
  `employee_grade_id` int(11) NOT NULL,
  `scale_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `basic_id` int(11) NOT NULL,
  `new_basic` int(11) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `quota_id` int(11) NOT NULL,
  `employee_type_id` int(11) NOT NULL,
  `religion_id` int(11) NOT NULL,
  `job_status_id` tinyint(4) NOT NULL,
  `location_id` int(11) NOT NULL,
  `account_number` varchar(256) DEFAULT NULL,
  `bank_info_id` int(11) NOT NULL,
  `fathers_name` varchar(100) DEFAULT NULL,
  `mothers_name` varchar(100) DEFAULT NULL,
  `sex_id` int(11) NOT NULL,
  `marital_status_id` int(11) NOT NULL,
  `spouse_name` varchar(100) DEFAULT NULL,
  `living_status_id` int(11) NOT NULL,
  `present_address` text,
  `permanent_address` text,
  `child_number` int(11) DEFAULT NULL,
  `contact_no` varchar(100) DEFAULT NULL,
  `festival_recovery` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `employee_name_bengali`, `employeeID`, `employee_grade_id`, `scale_id`, `department_id`, `designation_id`, `basic_id`, `new_basic`, `date_of_birth`, `joining_date`, `quota_id`, `employee_type_id`, `religion_id`, `job_status_id`, `location_id`, `account_number`, `bank_info_id`, `fathers_name`, `mothers_name`, `sex_id`, `marital_status_id`, `spouse_name`, `living_status_id`, `present_address`, `permanent_address`, `child_number`, `contact_no`, `festival_recovery`) VALUES
(1, 'Mr. ATM Wahid Azhar', 'জনাব এটিএম ওয়াহিদ আজহার ', 5227, 5, 12, 1, 3, 0, NULL, '1957-04-03', '1986-12-04', 1, 1, 1, 1, 2, NULL, 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '01712958333', 1),
(2, 'Mr. Kazi Md. Sabirul Alam', 'জনাব কাজী মোঃ সাবিরুল আলম', 5000, 6, 28, 1, 3, 0, NULL, '1969-02-20', '1994-04-11', 1, 1, 1, 1, 2, '0040-0316005704', 3, '', '', 1, 1, '', 1, 'Muzgunni,Boyra,Khulna', 'Muzgunni,Boyra,Khulna', 2, '', 1),
(3, 'Md. Basharul Kabir', 'মোঃ বাসারুল কবীর', 5219, 6, 28, 1, 4, 0, NULL, '1959-07-04', '1987-11-08', 1, 1, 1, 1, 2, '0040-0316004214', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(4, 'Mr. Shameem Jehad', 'জনাব শামীম জেহাদ', 5002, 7, 40, 1, 5, 0, NULL, '1967-01-11', '1994-04-11', 1, 1, 1, 1, 2, '0040-0316003715', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(5, 'Mr. Md. Mozibur Rahman', 'মোঃ মজিবুর রহমান', 5001, 7, 39, 1, 6, 0, NULL, '1970-02-11', '1996-04-25', 1, 1, 1, 1, 2, '0040-0316005802', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(6, 'Mr. GM Masudur Rahman', 'জনাব জিএম মাসুদুর রহমান', 5003, 7, 39, 1, 7, 0, NULL, '1967-12-30', '1996-04-25', 1, 1, 1, 1, 2, '0040-0316005688', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 1),
(7, 'Mr. M. M. Hossain Ali', 'জনাব এম এম হোসেন আলী', 5004, 9, 66, 1, 9, 0, NULL, '1967-08-16', '1994-07-26', 1, 1, 1, 1, 2, '0040-0316005197', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(8, 'Mr. Probir Kumar Chakrobarti', 'জনাব প্রবীর কুমার চক্রবর্তী', 5005, 9, 65, 1, 17, 0, NULL, '1956-08-13', '1979-06-15', 1, 1, 2, 3, 2, '', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(9, 'Mr. Ashraful Islam', 'জনাব আশরাফুল ইসলাম', 5006, 9, 66, 1, 10, 0, NULL, '1961-08-13', '1987-04-14', 1, 1, 1, 1, 2, '0040-0316004018', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(10, 'Md. Mamunul Abedin', 'মোঃ মামুনুল আবেদীন', 5012, 9, 65, 1, 11, 0, NULL, '1975-12-20', '2004-10-26', 1, 1, 1, 1, 2, '0040-0316005777', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 1),
(11, 'Md. Ijadur Rahman', 'মোঃ ইজাদুর রহমান', 5013, 9, 65, 1, 12, 0, NULL, '1975-02-27', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316005884', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 1),
(12, 'Md. Abdulla Kabi Sad', 'মোঃ আব্দুল্লাহ কবি সাদ', 5011, 9, 64, 1, 13, 0, NULL, '1977-09-17', '2004-11-06', 1, 1, 1, 1, 2, '0040-0316005339', 3, '', '', 1, 1, '', 1, 'খুলনা্ ', 'খুলনা্ ', 0, '', 1),
(13, 'Mr. Kazi Enayet Hossain', 'জনাব কাজী এনায়েত হোসেন', 5008, 9, 66, 1, 14, 0, NULL, '1961-04-30', '1985-08-18', 1, 1, 1, 1, 2, '0040-0316005795', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(14, 'Md. Saidul Haque', 'মোঃ সাইদুল হক', 5225, 9, 64, 1, 15, 0, NULL, '1978-01-01', '2005-09-21', 1, 1, 1, 1, 2, '0040-0316005740', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(15, 'Md. Arman Hossain', 'মোঃ আরমান হোসেন', 5009, 9, 65, 1, 16, 0, NULL, '1977-10-30', '2005-09-28', 1, 1, 1, 1, 2, '0040-0316004394', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 1),
(16, 'Md. Mortoza Al-Mamun', 'মোঃ মোরতোজা আল -মামুন', 5010, 9, 64, 1, 17, 0, NULL, '1984-10-13', '2007-02-07', 1, 1, 1, 1, 2, '0040-0316005482', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 1),
(17, 'Mr. Muntasir Mamun', 'জনাব মুনতাসির মামুন', 5223, 9, 62, 1, 17, 0, NULL, '1987-09-17', '2010-08-19', 1, 1, 1, 1, 2, '0040-0316005035', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 1),
(18, 'Md. Tanvir Ahmed', 'মোঃ তানভীর আহমেদ', 5224, 11, 100, 1, 19, 0, NULL, '1982-12-10', '2010-10-19', 1, 1, 1, 1, 2, '0040-0316005875', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 1),
(19, 'Mr. Abu Sayed', 'জনাব আবু সাঈদ', 5229, 11, 98, 1, 19, 0, NULL, '1983-10-20', '2013-10-22', 1, 1, 1, 1, 2, '0040-0316004447', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 1),
(20, 'Mr. Harunar Rashid', 'জনাব হারুনার রশিদ', 5014, 9, 65, 1, 20, 0, NULL, '1963-01-01', '1986-11-29', 1, 1, 1, 1, 2, '0040-0316004572', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(21, 'Mr. Abdur Rouf Dhali', 'জনাব আব্দুর রউফ ঢালী', 5015, 9, 63, 1, 21, 0, NULL, '1960-11-01', '1987-06-10', 1, 1, 1, 3, 2, '', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(22, 'Mrs. Rita Faria', 'জনাবা রীতা ফারিয়া', 5016, 9, 65, 1, 21, 0, NULL, '1966-10-13', '1964-07-10', 1, 1, 1, 1, 2, '0040-0316005099', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(23, 'Md. Sanaullah', 'মোঃ ছানাউল্লাহ', 5017, 9, 64, 1, 22, 0, NULL, '1968-10-19', '1998-09-30', 1, 1, 1, 1, 2, '0040-0316004269', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 1, '', 1),
(24, 'Mr. Rabindranath Das', 'জনাব রবিন্দ্রনাথ দাস', 5019, 9, 65, 1, 21, 0, NULL, '1966-12-30', '1995-06-16', 1, 1, 2, 1, 2, '0040-0316004009', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(25, 'Mr. Bashudeb Kumar Biswas', 'জনাব বাসুদেব কুমার বিশ্বাস', 5023, 9, 64, 1, 24, 0, NULL, '1968-06-05', '1999-03-08', 1, 1, 2, 1, 2, '0040-0316003662', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(26, 'Md. Mahmud Hasan', 'মোঃ মাহমুদ হাসান ', 5020, 10, 81, 1, 21, 0, NULL, '1982-12-14', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316005866', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 1),
(27, 'Mrs. Sahana Tabassum', 'জনাবা শাহানা তাবাচ্ছুম', 5021, 12, 121, 1, 25, 0, NULL, '1973-12-03', '1996-09-10', 1, 1, 1, 1, 2, '0040-0316005053', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(28, 'Shaikh Abdul Karim', 'শেখ  আব্দুল  করিম ', 5022, 11, 100, 1, 26, 0, NULL, '1961-07-20', '1980-08-06', 1, 1, 1, 1, 2, '0040-0316005437', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 1),
(29, 'Shaikh Robiul Islam', 'শেখ রবিউল ইসলাম ', 5024, 10, 81, 1, 27, 0, NULL, '1975-02-15', '1999-03-07', 1, 1, 1, 1, 2, '0040-0316003840', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 1),
(30, 'Md. Shaiful Islam', 'মোঃ সাইফুল ইসলাম ', 5025, 11, 98, 1, 18, 0, NULL, '1973-09-26', '1998-03-18', 1, 1, 1, 1, 2, '0040-0316005848', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 1),
(31, 'Mr. Sharif Wahiduzzaman', 'জনাব শরীফ ওয়াহিদুজ্জামান', 5230, 12, 117, 1, 21, 0, NULL, '1983-10-24', '2013-09-19', 1, 1, 1, 1, 2, '0040-0316003573', 3, '', '', 1, 1, '', 2, 'Khulna', 'Khulna', 0, '', 1),
(32, 'Swapon Kumar Das', 'স্বপন কুমার দাস', 5027, 10, 83, 2, 33, 0, NULL, '1971-06-28', '1994-01-19', 1, 1, 2, 1, 2, '0040-0316004992', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(33, 'Md. Abdul Mazid Khan', 'মোঃ আব্দুল মজিদ খান ', 5028, 11, 101, 2, 29, 0, NULL, '1959-09-02', '1978-04-14', 1, 1, 1, 1, 2, '0040-0316005179', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(34, 'Shaikh Abu Said', 'শেখ আবু সাইদ', 5029, 12, 121, 2, 30, 0, NULL, '1965-01-01', '2005-12-22', 1, 1, 1, 1, 2, '0040-0316003902', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(35, 'Md. Golam Kibria', 'জনাব মোঃ গোলাম কিবরিয়া', 5091, 16, 197, 2, 31, 0, NULL, '1969-12-18', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316005464', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(36, 'Mr. Abdus Sattar', 'জনাব আব্দুস সাত্তার ', 5167, 14, 162, 2, 29, 0, NULL, '1964-08-16', '1994-07-26', 1, 1, 1, 1, 2, '0040-0316005151', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(37, 'Hafez Maulana Md. Alamgir Hossain', 'হাফেজ মাওলানা মোঃ আলমগীর হোসেন', 5026, 12, 120, 2, 32, 0, NULL, '1971-03-01', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316005508', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(38, 'Mr. Gazi Asaduzzaman', 'জনাব গাজী আসাদুজ্জামান', 5030, 14, 163, 2, 28, 0, NULL, '1975-06-20', '2005-07-18', 1, 1, 1, 1, 2, '0040-0316004036', 3, '', '', 1, 1, '', 2, 'Khulna', 'Khulna', 1, '', 0),
(39, 'Mr. Ponkoj Kanti Paul', 'জনাব পঙ্কজ কান্তি পাল ', 5086, 14, 162, 2, 28, 0, NULL, '1982-12-12', '2004-11-03', 1, 1, 2, 1, 2, '0040-0316004849', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(40, 'Mr. S. M. Lutfor Rahman ', 'জনাব এস এম লুৎফর রহমান ', 5090, 17, 217, 2, 31, 0, NULL, '1964-08-19', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316004536', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(41, 'Mr. Faruqe Hossain', 'জনাব ফারুক হোসেন', 5033, 14, 162, 2, 31, 0, NULL, '1972-07-18', '1996-06-30', 1, 1, 1, 1, 2, '0040-0316005642', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(42, 'Mrs. Shokhela Akter Nina', 'জনাবা সখেলা আক্তার নিনা', 5035, 15, 180, 2, 34, 0, NULL, '1972-11-06', '1995-06-08', 1, 1, 1, 1, 2, '0040-0316004812', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(43, 'Mr. Syed Mirajul Islam', 'জনাব সৈয়দ মিরাজুল ইসলাম', 5102, 18, 233, 2, 31, 0, NULL, '1984-11-13', '2005-12-14', 1, 1, 1, 1, 2, '0040-0316003751', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(44, 'Mrs. Salina Khatun', 'জনাবা সেলিনা খাতুন', 5142, 16, 198, 2, 35, 0, NULL, '1969-02-15', '1999-03-03', 1, 1, 1, 1, 2, '0040-0316005080', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(45, 'Mr. Md. Al Mamun Tuhin', 'জনাব মোঃ আল মামুন তুহিন', 5235, 19, 17, 2, 59, 0, NULL, '1988-11-25', '2013-09-19', 1, 1, 1, 1, 2, '0040-0316005008', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(46, 'Mr. Md. Saiyad Alamgir Hossain', 'জনাব সৈয়দ মোঃ আলমগীর হোসেন ', 5047, 18, 235, 2, 36, 0, NULL, '1977-12-28', '2000-11-23', 1, 1, 1, 1, 2, '0040-0316004929', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 1),
(47, 'Mr. Md. Nazmul Alam', 'জনাব মোঃ নাজমুল আলম ', 5143, 15, 179, 2, 37, 0, NULL, '1986-09-13', '2000-05-24', 1, 1, 1, 1, 2, '0040-0316004134', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(48, 'Mrs. Yeasmin Parveen', 'জনাবা ইয়াসমিন পারভীন ', 5034, 17, 216, 2, 31, 0, NULL, '1979-12-16', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316005160', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(49, 'Mr. Harun -Or-Rashid', 'জনাব হারুন-অর-রশিদ', 5039, 16, 195, 2, 38, 0, NULL, '1979-10-09', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316005286', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(50, 'Mr. Md. Fazlur Rahman', 'জনাব মোঃ ফজলুর রহমান ', 5040, 17, 217, 2, 39, 0, NULL, '1967-05-04', '1995-12-26', 1, 1, 1, 1, 2, '0040-0316004303', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(51, 'Mr. Shaikh Sahariar Parvez', 'জনাব মোঃ শাহরিয়ার পারভেজ', 5241, 22, 302, 2, 40, 0, NULL, '1992-11-18', '2013-09-26', 1, 1, 1, 1, 2, '0040-0316005633', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(52, 'Mr. Joynal Abedin', 'জনাব জয়নাল আবেদীন', 5101, 19, 251, 2, 41, 0, NULL, '1971-11-10', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316005133', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(53, 'Mr. Md. Mostofa Bahauddin', 'জনাব মোঃ মোস্তফা বাহাউদ্দীন', 5239, 22, 302, 2, 43, 0, NULL, '1985-01-01', '2013-09-19', 1, 1, 1, 1, 2, '0040-0316003804', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(54, 'Mr. Mostofa Howladar', 'জনাব মোস্তফা হাওলাদার ', 5151, 20, 270, 2, 40, 0, NULL, '1970-10-10', '1994-07-26', 1, 1, 1, 1, 2, '0040-0316003528', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(55, 'Mr. Md. Moshiur Rahman', 'জনাব মোঃ মশিউর রহমান ', 5178, 21, 287, 2, 40, 0, NULL, '1975-03-10', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316004867', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(56, 'Mr. Asaduzzaman Shikder', 'জনাব আসাদুজ্জামান শিকদার ', 5212, 19, 252, 2, 40, 0, NULL, '1962-01-02', '1995-05-08', 1, 1, 1, 1, 2, '0040-0316003591', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(57, 'Mr. Shaikh Jafor Ahmed', 'জনাব শেখ জাফর আহমেদ', 5078, 19, 251, 2, 40, 0, NULL, '1971-09-30', '1994-07-25', 1, 1, 1, 1, 2, '0040-0316005213', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(58, 'Mr. Mollik Jakir Hossain', 'জনাব মল্লিক জাকির হোসেন', 5049, 21, 288, 2, 40, 0, NULL, '1980-01-09', '2005-12-14', 1, 1, 1, 1, 2, '0040-0316005268', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(59, 'Mr. Newton Mondal', 'জনাব নিউটন মন্ডল ', 5238, 21, 283, 2, 44, 0, NULL, '1984-07-13', '2013-09-22', 1, 1, 2, 1, 2, '0040-0316003564', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(60, 'Hafez. Md. Rezoanul Karim', 'হাফেজ মোঃ রেজোয়ানুল করিম ', 5043, 21, 288, 2, 45, 0, NULL, '1986-01-01', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316005651', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(61, 'Mr. Abdur Rob Howlader', 'জনাব আব্দুর রব হাওলাদার ', 5058, 19, 252, 2, 46, 0, NULL, '1970-02-01', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316005044', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(62, 'Mr. Md. Riazul Islam', 'জনাব মোঃ রিয়াজুল ইসলাম ', 5132, 21, 288, 2, 47, 0, NULL, '1982-11-28', '2005-12-14', 1, 1, 1, 1, 2, '0040-0316005473', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(63, 'Mr. Goffer Ali', 'জনাব গফফার আলী ', 5052, 19, 252, 2, 47, 0, NULL, '1966-10-20', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316004750', 3, '', '', 1, 1, '', 2, 'Khulna', 'Khulna', 1, '', 0),
(64, 'Md. Mosaraf Hossain-2', 'জনাব মোঃ মোশাররফ হোসেন-২', 5055, 19, 250, 2, 47, 0, NULL, '1962-10-08', '1996-02-06', 1, 1, 1, 1, 2, '0040-0316005731', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(65, 'Mr. Md. Jalal Uddin Ahmed', 'জনাব মোঃ জালাল উদ্দিন আহমেদ', 5119, 19, 249, 2, 47, 0, NULL, '1956-12-13', '1995-02-25', 1, 1, 1, 1, 2, '0040-0316009513', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(66, 'Mr. Md. Bokul Sarker', 'জনাব মোঃ বকুল সরকার', 5130, 21, 288, 2, 47, 0, NULL, '1981-01-02', '2011-11-04', 1, 1, 1, 1, 2, '0040-0316004885', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(67, 'Mr. Shaikh Forhad Hossain-1', 'জনাব শেখ ফরহাদ হোসেন-১', 5156, 20, 268, 2, 47, 0, NULL, '1974-01-28', '2001-01-01', 1, 1, 1, 1, 2, '0040-0316004803', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(68, 'Mr. Ismail Hossain-1', 'জনাব ইসমাইল হোসেন-১', 5051, 19, 251, 2, 47, 0, NULL, '1968-01-01', '1989-10-03', 1, 1, 1, 1, 2, '0040-0316004741', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(69, 'Mr. Prodip Kumar Das', 'জনাব প্রদীপ কুমার দাস', 5053, 19, 252, 2, 47, 0, NULL, '1981-06-07', '2011-03-06', 1, 1, 2, 1, 2, '0040-0316003822', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(70, 'Mr. Faruk Hossain', 'জনাব ফারুক হোসেন', 5112, 19, 251, 2, 47, 0, NULL, '1969-02-17', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316004983', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(71, 'Mr. Yunus Ali Shaikh', 'জনাব ইউনুস আলী শেখ ', 5118, 19, 252, 2, 47, 0, NULL, '1969-10-12', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316004947', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(72, 'Mr. Nazmul Islam', 'জনাব নাজমুল ইসলাম', 5054, 19, 252, 2, 47, 0, NULL, '1973-09-13', '2000-05-24', 1, 1, 1, 1, 2, '0040-0316004045', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(73, 'Mr. Md. Sahjahan Khan', 'জনাব মোঃ শাহজাহান খান ', 5056, 21, 288, 2, 47, 0, NULL, '1972-03-04', '2004-10-26', 1, 1, 1, 1, 2, '0040-0316005017', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(74, 'Mr. Md. Azad Biswas', 'জনাব মোঃ আজাদ বিশ্বাস', 5057, 21, 288, 2, 47, 0, NULL, '1982-01-01', '2004-11-04', 1, 1, 1, 1, 2, '0040-0316005222', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(75, 'Mr. Shaikh Muzibur Rahman-2', 'জনাব শেখ মুজিবুর রহমান-২', 5104, 19, 252, 2, 47, 0, NULL, '1957-12-10', '1984-10-10', 1, 1, 1, 1, 2, '0040-0316005393', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(76, 'Mr. Kazi Mujibur Rahman -1', 'জনাব কাজী মুজিবুর রহমান-১', 5105, 19, 252, 2, 47, 0, NULL, '1959-12-13', '1984-10-10', 1, 1, 1, 1, 2, '0040-0316005277', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(77, 'Mr. Gazi Fozlul Haque', 'জনাব গাজী ফজলুল হক', 5106, 19, 251, 2, 47, 0, NULL, '1964-03-05', '1984-10-10', 1, 1, 1, 1, 2, '0040-0316005062', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(78, 'Mr. Abdur Rashid Sarker', 'জনাব আব্দুর রশিদ সরকার', 5109, 19, 251, 2, 47, 0, NULL, '1966-10-22', '1989-10-07', 1, 1, 1, 1, 2, '0040-0316005400', 3, '', '', 1, 1, '', 0, 'Khulna', 'Khulna', 2, '', 0),
(79, 'Mr. Molla Enayet Ali', 'জনাব মোল্লা এনায়েত আলী', 5133, 21, 287, 2, 47, 0, NULL, '1984-12-20', '2005-12-18', 1, 1, 1, 1, 1, '0040-0316004376', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(80, 'Mr. Mujibur Rahman Shaikh-3', 'জনাব মোঃ মুজিবুর রহমান শেখ-৩', 5110, 19, 252, 2, 47, 0, NULL, '1965-03-05', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316004349', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(81, 'Mr. Habibulla Khan ', 'জনাব হাবিবুল্লাহ খান ', 5111, 19, 251, 2, 47, 0, NULL, '1970-01-15', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316004312', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(82, 'Mr. Abdul Jalil Khondokar', 'জনাব আব্দুল জলিল খন্দকার ', 5113, 19, 252, 2, 47, 0, NULL, '1968-02-15', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316004769', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(83, 'Mr. Golam Hossain', 'জনাব গোলাম হোসেন', 5114, 19, 252, 2, 47, 0, NULL, '1964-02-02', '1992-04-30', 1, 1, 1, 1, 2, '0040-0316005491', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(84, 'Mr. Amir Hossain', 'জনাব আমীর হোসেন', 5115, 19, 252, 2, 47, 0, NULL, '1966-04-21', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316004698', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(85, 'Mr. Abdul Motalib', 'জনাব আব্দুল মোতালিব', 5116, 19, 251, 2, 47, 0, NULL, '1963-12-25', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316005295', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(86, 'Mr. Kazi Kausar Ali', 'জনাব কাজী কাওছার আলী', 5117, 19, 251, 2, 47, 0, NULL, '1964-02-11', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316004661', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(87, 'Mr. Dulal Khaki', 'জনাব দুলাল খাকী', 5120, 19, 252, 2, 47, 0, NULL, '1965-04-04', '1995-02-25', 1, 1, 1, 1, 2, '0040-0316003859', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(88, 'Mr. Jems Pindit', 'জনাব জেমস পন্ডিত ', 5121, 19, 251, 2, 47, 0, NULL, '1964-12-23', '1995-02-25', 1, 1, 3, 1, 2, '0040-0316004965', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(89, 'Mr. Mikel Shikder', 'জনাব মাইকেল শিকদার', 5123, 19, 251, 2, 47, 0, NULL, '1959-08-05', '1995-05-07', 1, 1, 3, 1, 2, '0040-0316005660', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(90, 'Mr. Md. Ismail Hossain-2', 'জনাব মোঃ ইসমাইল হোসেন-২', 5126, 19, 250, 2, 47, 0, NULL, '1958-04-12', '1996-02-12', 1, 1, 1, 1, 2, '0040-0316004296', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(91, 'Mr. Md. Ayub Ali Howlader', 'জনাব মোঃ আইয়ুব আলী হাওলাদার', 5127, 19, 250, 2, 47, 0, NULL, '1965-12-01', '1998-01-19', 1, 1, 1, 1, 2, '0040-0316005562', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(92, 'Mr. Md. Abdul Kuddus Talukder', 'জনাব মোঃ আব্দুল কুদ্দুস তালুকদার ', 5128, 20, 269, 2, 47, 0, NULL, '1960-03-16', '2001-01-02', 1, 1, 1, 1, 2, '0040-0316005580', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(93, 'Mr. Shaikh Jamal Uddin ', 'জনাব শেখ জামাল উদ্দিন', 5155, 19, 252, 2, 47, 0, NULL, '1966-07-05', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316005348', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(94, 'Mr. Shakhawat Hossain', 'জনাব সাখাওয়াত হোসেন', 5050, 19, 252, 2, 47, 0, NULL, '1965-01-01', '1989-10-03', 1, 1, 1, 1, 2, '0040-0316004081', 3, '', '', 1, 1, '', 1, 'খুলনা ', '', 0, '', 0),
(95, 'Mr.Taposh Mondal', 'জনাব তাপস মন্ডল', 5245, 22, 303, 2, 47, 0, NULL, '1988-02-01', '2013-09-19', 1, 1, 2, 1, 2, '0040-0316005375', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(96, 'Mr. Md. Raihan Uddin', 'জনাব মোঃ রায়হান উদ্দিন', 5244, 22, 302, 2, 47, 0, NULL, '1994-06-04', '2015-09-19', 1, 1, 1, 1, 2, '0040-0316004732', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(97, 'Mrs. Ayesha Khatun', 'জ়নাবা আয়েশা খাতুন', 5137, 19, 251, 2, 48, 0, NULL, '1963-01-25', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316004367', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(98, 'Mr. Md. Alamgir Hossain', 'জনাব মোঃ আলমগীর হোসেন', 5140, 29, 320, 2, 48, 0, NULL, '1973-02-11', '1998-01-19', 1, 1, 1, 6, 2, '', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(99, 'Mrs. Hamida Khatun', 'জনাবা হামিদা খাতুন', 5138, 19, 251, 2, 48, 0, NULL, '1969-01-01', '1995-02-25', 1, 1, 1, 1, 2, '0040-0316005231', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(100, 'Mr. Agnes Mondal', 'জনাব আগ্নেস মন্ডল', 5063, 19, 251, 2, 48, 0, NULL, '1965-10-20', '1995-02-25', 1, 1, 3, 1, 2, '0040-0316003993', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(101, 'Mr. Kamal Sheik', 'জনাব কামাল শেখ', 5135, 19, 251, 2, 48, 0, NULL, '1969-05-10', '1992-05-07', 0, 1, 1, 1, 2, '0040-0316004116', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(102, 'Mr. Mollah Munsur Ali', 'জনাব মোল্লা মুনছুর আলী', 5067, 12, 123, 3, 49, 0, NULL, '1980-10-11', '2001-06-17', 0, 1, 1, 1, 2, '0040-0316003939', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(103, 'Mr. Sheik MD. Fazlul Rahman', 'জনাব শেখ মোঃ ফজলুল রহমান', 5183, 20, 275, 3, 69, 0, NULL, '1967-05-04', '1995-12-26', 1, 1, 1, 1, 2, '0040-0316004161', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(104, 'Mrs. Shahana Akter', 'জনাবা শাহানা আক্তার', 5169, 20, 275, 3, 50, 0, NULL, '1974-12-15', '1995-05-02', 1, 1, 1, 1, 2, '0040-0316004189', 3, '', '', 2, 1, '', 2, 'Khulna', 'Khulna', 0, '', 0),
(105, 'Mr. Kamal Hossain Mollick', 'জনাব কামাল হোসেন মল্লিক', 5087, 14, 161, 3, 28, 0, NULL, '1970-08-14', '2006-05-16', 1, 1, 1, 1, 2, '0040-0316003877', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(106, 'Polash Kumar Ghosh', 'জনাব পলাশ কুমার ঘোষ', 5071, 14, 161, 3, 31, 0, NULL, '1966-05-02', '1997-10-20', 1, 1, 2, 1, 2, '0040-0316004198', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(107, 'Mrs. Mukti Rani Sarkar', 'জনাব মুক্তি রানী সরকার ', 5072, 14, 161, 3, 31, 0, NULL, '1972-01-03', '1999-03-11', 1, 1, 2, 1, 2, '0040-0316004107', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(108, 'Mr. Sharmin Nahar', 'জনাব শারমীন নাহার', 5073, 17, 215, 3, 50, 0, NULL, '1984-11-28', '2005-09-18', 1, 1, 1, 1, 2, '0040-0316004152', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(109, 'Mr. Kazi Miraj Mahmud', 'জনাব কাজী মিরাজ মাহমুদ', 5074, 17, 215, 3, 50, 0, NULL, '1978-02-01', '1915-12-14', 1, 1, 1, 1, 2, '0040-0316004796', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(110, 'Mr. Molla Mehedi Hasan', 'জনাব মোল্লা মেহেদী হাসান', 5075, 17, 215, 3, 51, 0, NULL, '1977-12-11', '2007-02-06', 1, 1, 1, 1, 2, '0040-0316005544', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(111, 'Mr. Azadur Rahman', 'জনাব মোঃ আজাদুর রহমান', 5152, 21, 288, 3, 40, 0, NULL, '1983-09-10', '2004-11-01', 1, 1, 1, 1, 2, '0040-0316004876', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(112, 'Mr. Md. Hafijur Rahman ', 'জনাব মোঃ হাফিজুর রহমান', 5041, 19, 251, 3, 52, 0, NULL, '1966-09-15', '1996-06-30', 1, 0, 1, 1, 2, '0040-0316003733', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna ', 2, '', 0),
(113, 'Mr. Ashraf Hossain', 'জনাব আশরাফ হোসেন', 5242, 22, 302, 3, 40, 0, NULL, '1988-11-20', '2013-09-22', 1, 1, 1, 1, 2, '0040-0316004125', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(114, 'Mr. Kazi Mosaddek Hossain', 'জনাব কাজী মোসাদ্দেক হোসেন', 5069, 13, 143, 4, 54, 0, NULL, '1958-12-31', '1984-10-10', 1, 1, 1, 1, 2, '0040-0316005553', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(115, 'Mr. Abdullah Al Nasir', 'জনাব আব্দুল্লাহ আল নাসির ', 5081, 13, 142, 4, 54, 0, NULL, '1966-02-20', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316005615', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna ', 1, '', 0),
(116, 'Mr. Mujibur Rahman Khan ', 'জনাব মুজিবুর রহমান খান ', 5085, 15, 180, 4, 55, 0, NULL, '1959-07-12', '1986-12-07', 1, 1, 1, 1, 2, '0040-0316003519', 3, '', '', 1, 1, '', 2, 'Khulna', 'Khulna', 2, '', 0),
(117, 'Mr. Emdadul Haque', 'জনাব এমদাদুল হক ', 5068, 15, 180, 4, 54, 0, NULL, '1968-07-16', '2005-05-02', 1, 1, 1, 1, 2, '0040-0316004330', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(118, 'Mr. Md. Anowar Hossain ', 'জনাব মোঃ আনেয়ার হোসেন', 5032, 16, 201, 4, 29, 0, NULL, '1974-06-10', '1995-02-25', 1, 1, 1, 1, 2, '0040-0316003680', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(119, 'Mr. Md. Habibur Rahman ', 'জনাব মোঃ হাবিবুর রহমান ', 5082, 14, 161, 4, 54, 0, NULL, '1960-05-26', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316004590', 3, '', '', 1, 1, '', 2, 'Khulna', 'Khulna', 2, '', 0),
(120, 'Mr. ABM Sarwar Hossain ', 'জনাব এবিএম সারওয়ার হোসেন', 5160, 15, 180, 4, 31, 0, NULL, '1970-01-01', '1995-05-02', 1, 1, 1, 1, 2, '0040-0316004143', 3, '', '', 1, 1, '', 2, 'Khulna', 'Khulna\r\n\r\n\r\n\r\n\r\n\r\n', 2, '', 0),
(121, 'Mr. Miraz Hossain', 'জনাব মিরাজ হোসেন', 5171, 20, 273, 4, 56, 0, NULL, '1971-03-01', '2003-03-15', 1, 1, 1, 1, 2, '0040-0316004787', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(122, 'Mr. Md. Gaus Sardar', 'জনাব মোঃ গাউস সরদার ', 5144, 16, 199, 4, 57, 0, NULL, '1971-02-06', '1988-06-30', 1, 1, 1, 1, 2, '0040-0316004072', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(123, 'Mr. Md. Abdus Sattar', 'জনাব মোঃ আব্দুস সাত্তার ', 5097, 16, 199, 4, 57, 0, NULL, '1972-11-18', '1995-11-18', 1, 1, 1, 1, 2, '0040-0316005455', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(124, 'Mr. Humayun Kabir', 'জনাব হুমায়ুন কবির ', 5084, 15, 179, 4, 58, 0, NULL, '1976-06-12', '1999-03-07', 1, 1, 1, 1, 2, '0040-0316003699', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(125, 'Mr. Shaikh Ashraf Ali', 'জনাব শেখ আশরাফ আলী', 5095, 16, 198, 4, 57, 0, NULL, '1969-07-07', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316003671', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(126, 'Mr. Monoj Kumar Ray', 'জনাব মনোজ কুমার রায়', 5094, 16, 199, 4, 57, 0, NULL, '1967-08-07', '1989-12-19', 1, 1, 2, 1, 2, '0040-0316004723', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(127, 'Mr. Shahor Ali', 'জনাব শহর আলী ', 5098, 17, 217, 4, 57, 0, NULL, '1970-10-03', '1989-10-08', 1, 1, 1, 1, 2, '0040-0316005302', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(128, 'Mr. S.M Mahbub Hossain', 'জনাব এস এম মাহবুব হোসেন', 5145, 17, 217, 4, 57, 0, NULL, '1970-10-10', '1989-10-05', 1, 1, 1, 1, 2, '0040-0316005320', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(129, 'Mr. Shaikh Borhan Uddin ', 'জনাব শেখ বোরহান উদ্দিন ', 5093, 17, 215, 4, 56, 0, NULL, '1977-03-01', '2007-02-07', 1, 1, 1, 1, 2, '0040-0316003760', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(130, 'Mr. Abdul Hamid Mir', 'জনাব আব্দুল হামিদ মীর ', 5099, 19, 251, 4, 53, 0, NULL, '1962-01-01', '1984-10-10', 1, 1, 1, 1, 2, '0040-0316003742', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(131, 'Mr. Md. Mirajul Islam ', 'জনাব মোঃ মিরাজুল ইসলাম', 5042, 21, 287, 4, 53, 0, NULL, '1978-02-05', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316003706', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(132, 'Mr. Hafizur Rahman', 'জনাব হাফিজুর রহমান ', 5243, 22, 302, 4, 40, 0, NULL, '1983-12-02', '2013-09-19', 1, 1, 1, 1, 2, '0040-0316005786', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(133, 'Mr. Bokul Mia', 'জনাব মোঃ বকুল মিয়া', 5045, 19, 253, 4, 40, 0, NULL, '1975-06-01', '1995-02-25', 1, 1, 1, 1, 2, '0040-0316004321', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(134, 'Mr. Md. Easin Ahmed', 'জনাব মোঃ ইয়াছিন আহমেদ', 5131, 21, 288, 4, 47, 0, NULL, '1986-02-15', '2005-12-14', 1, 1, 1, 1, 2, '0040-0316005820', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(135, 'Mr. Osman Goni', 'জনাব ওসমান গনি ', 5122, 19, 252, 4, 47, 0, NULL, '1976-07-15', '1995-02-27', 1, 1, 1, 1, 2, '0040-0316004554', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(136, 'Mrs. Abejan Bibi', 'জনাব আবেজান বিবি', 5061, 19, 252, 4, 48, 0, NULL, '2021-06-19', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316005713', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(137, 'Mr. Babu Das', 'জনাব বাবু দাস ', 5134, 19, 249, 4, 48, 0, NULL, '1956-08-26', '1984-10-10', 1, 1, 2, 3, 2, '', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(138, 'Mr. Ronjit Das', 'জনাব রনজিৎ দাস ', 5136, 19, 251, 4, 48, 0, NULL, '1972-11-25', '1992-05-07', 1, 1, 2, 1, 2, '0040-0316004956', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(139, 'Mr. Rokon Uddin', 'জনাব রোকন উদ্দিন ', 5059, 19, 251, 4, 48, 0, NULL, '1971-01-01', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316004401', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(140, 'Mr. Mongol Das', 'জনাব মঙ্গল দাস ', 5064, 19, 250, 4, 48, 0, NULL, '1976-12-30', '1996-06-30', 1, 1, 2, 1, 2, '0040-0316005759', 3, '', '', 1, 1, '', 0, 'Khulna', 'Khulna', 1, '', 0),
(141, 'Mr. Madhob Das', 'জনাব মাধব দাস ', 5065, 21, 289, 4, 48, 0, NULL, '1981-06-07', '2004-11-03', 1, 1, 2, 1, 2, '0040-0316004545', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(142, 'Mr. Shudhir Chandra Howlader', 'জনাব সুধীর চন্দ্র হাওলাদার ', 5139, 19, 250, 4, 48, 0, NULL, '1968-12-17', '1998-01-19', 1, 1, 2, 1, 2, '0040-0316004974', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(143, 'Mrs. Parvin Akter', 'জনাবা পারভীন আক্তার ', 5141, 13, 142, 5, 29, 0, NULL, '1966-11-14', '1988-08-07', 1, 1, 1, 1, 2, '0040-0316004518', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(144, 'Mr. Topon Kumar Das', 'জনাব তপন কুমার দাস ', 5186, 14, 161, 5, 28, 0, NULL, '1977-08-01', '2005-12-14', 1, 1, 2, 1, 2, '0040-0316003911', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(145, 'Mrs. Rahima Khatun ', 'জনাবা রহিমা খাতুন', 5185, 14, 162, 5, 31, 0, NULL, '1976-06-08', '1995-05-02', 1, 1, 1, 1, 2, '0040-0316003868', 0, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(146, 'Mr. S. M.  Abdul Kuddus', 'জনাব এস এম আব্দুল কুদ্দুস ', 5168, 16, 197, 5, 35, 0, NULL, '1976-02-01', '2004-11-03', 0, 1, 1, 1, 2, '0040-0316003500', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(147, 'Mr. Md. Zakir Hossain', 'জনাব মো: জাকির হোসেন', 5163, 17, 215, 5, 60, 0, NULL, '1975-03-28', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316004616', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(148, 'Mr. Zahangir Ahsan Kabir', 'জনাব জাহাঙ্গীর আ্হসান কবীর', 5092, 14, 162, 5, 60, 0, NULL, '1963-11-19', '1988-03-20', 1, 1, 1, 1, 2, '0040-0316003957', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(149, 'Mr. S.M Samsul Arefin', 'জনাব এস এম সামসুল আরেফিন', 5172, 17, 215, 5, 56, 0, NULL, '1984-10-03', '2004-11-24', 1, 1, 1, 1, 2, '0040-0316005624', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(150, 'Mr. Md. Mahatab Uddin', 'জনাব মো: মাহাতাব উদ্দিন', 5146, 19, 251, 5, 53, 0, NULL, '1975-06-30', '1975-06-30', 1, 1, 1, 1, 2, '0040-0316005428', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(151, 'Mrs. Latifa Khatun', 'জনাবা লতিফা খাতুন', 5148, 19, 251, 5, 40, 0, NULL, '1969-12-30', '1994-07-25', 1, 1, 1, 1, 2, '0040-0316004509', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(152, 'Mr. S. M. Saiful Kabir', 'জনাব এস এম সাইফুল কবির', 5240, 22, 302, 5, 40, 0, NULL, '1987-11-30', '2013-09-19', 1, 1, 1, 1, 2, '0040-0316005571', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(153, 'Mr. Sk. Monirul Islam', 'জনাব শেখ মনিরুল ইসলাম', 5089, 14, 162, 13, 31, 0, NULL, '1965-11-11', '1995-05-02', 1, 1, 1, 1, 2, '0040-0316005419', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(154, 'Mrs. Sabita Folia', 'জনাবা সবিতা ফলিয়া', 5036, 15, 179, 13, 34, 0, NULL, '1971-11-14', '1995-11-18', 1, 1, 3, 1, 2, '0040-0316004894', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(155, 'Mr. Md. Asad Shaikh', 'জনাব মো: আসাদ শেখ', 5046, 19, 251, 13, 40, 0, NULL, '1976-11-09', '1995-12-26', 1, 1, 1, 1, 2, '0040-0316005599', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(156, 'Mrs. Umme Salma', 'জনাবা উম্মে সালমা', 5070, 20, 275, 6, 29, 0, NULL, '1971-07-25', '1995-05-02', 1, 1, 1, 1, 2, '0040-0316003608', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(157, 'Mr. Abdul Motalib ', 'জনাব আব্দুল মোতালিব', 5188, 14, 160, 6, 35, 0, NULL, '1957-04-01', '1986-02-07', 1, 1, 1, 1, 2, '', 3, '', '', 1, 1, '', 2, 'Khulna', 'Khulna', 2, '', 0),
(158, 'Mr. G. M. Bazlur Rahman', 'জনাব জি. এম. বজলুর রহমান', 5162, 15, 178, 6, 62, 0, NULL, '1957-02-17', '1989-02-13', 1, 1, 1, 1, 2, '0040-0316005071', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(159, 'Mr. Md. Delowar Hossain', 'জনাব মো: দেলোয়ার হোসেন', 5226, 15, 180, 6, 62, 0, NULL, '1966-01-01', '1995-03-27', 1, 1, 1, 1, 2, '0040-0316003948', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(160, 'Mr. Md. Mahbubur Rahman', 'জনাব মো: মাহবুবুর রহমান', 5037, 15, 180, 6, 62, 0, NULL, '1968-08-01', '1995-08-29', 1, 1, 1, 1, 2, '0040-0316004250', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(161, 'Mr. Md. Abdul Hannan Molla', 'জনাব মোঃ আব্দুল হান্নান মোল্লা', 5161, 15, 180, 6, 62, 0, NULL, '1966-03-06', '1995-11-21', 1, 1, 1, 1, 2, '0040-0316003966', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(162, 'Mr. Md. Mizanur Rahman', 'জনাব মো: মিজানুর রহমান', 5159, 20, 272, 6, 35, 0, NULL, '1982-10-16', '2005-12-14', 1, 1, 1, 1, 2, '0040-0316004821', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(163, 'Mrs. Reshma Hamid', 'জনাবা রেশমা হামিদ', 5149, 17, 216, 6, 31, 0, NULL, '1980-12-28', '2004-10-03', 1, 1, 1, 1, 2, '0040-0316004438', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(164, 'Mr. Md. Abdur Rahman Molla', 'জনাব মো: আব্দুর রহমান মোল্লা', 5164, 19, 251, 6, 63, 0, NULL, '1969-07-05', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316003582', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(165, 'Mr. Md Zahid Hossain', 'জনাব মো: জাহিদ হোসেন', 5165, 21, 287, 6, 63, 0, NULL, '1975-01-01', '2004-10-03', 1, 1, 1, 1, 2, '0040-0316004634', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(166, 'Mr. Md. Forhad Hossain-2', 'জনাব মো: ফরহাদ হোসেন-২', 5048, 21, 288, 6, 40, 0, NULL, '1992-04-24', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316004241', 3, '', '', 1, 1, '', 1, 'khulna', 'khulna', 2, '', 0),
(167, 'Mrs. Shipra Ghosh', 'জনাবা শিপ্রা ঘোষ', 5083, 13, 142, 7, 29, 0, NULL, '1963-04-05', '1992-05-07', 1, 1, 2, 1, 2, '0040-0316004607', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(168, 'Mr. Kazi Monsur Alam', 'জনাব কাজী মনসুর আলম', 5217, 14, 162, 7, 64, 0, NULL, '1966-06-09', '1985-06-10', 1, 1, 1, 1, 2, '0040-0316005606', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(169, 'Mr. S. M. A. Motin ', 'জনাব  এস এম এ মতিন', 5088, 14, 161, 7, 35, 0, NULL, '1963-03-18', '1986-07-07', 1, 1, 1, 1, 2, '0040-0316005857', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(170, 'Mr. Kazi Nazmul Haque', 'জনাব কাজী নাজমুল হক', 5158, 14, 161, 7, 35, 0, NULL, '1968-06-15', '1994-07-25', 1, 1, 1, 1, 2, '0040-0316004385', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(171, 'Mr. S. M. Mahbub Ali', 'জনাব এস এম মাহবুব আলী', 5031, 17, 214, 7, 35, 0, NULL, '1973-08-09', '1999-03-01', 1, 1, 1, 1, 2, '0040-0316004625', 3, '', '', 1, 1, '', 2, 'Khulna', 'Khulna', 1, '', 0),
(172, 'Mr. Kazi Fakrul Haque', 'জনাব কাজী ফকরুল হক', 5038, 18, 234, 7, 59, 0, NULL, '1977-10-10', '2005-09-18', 1, 1, 1, 1, 2, '0040-0316004410', 3, '', '', 1, 1, '', 2, 'Khulna', 'Khulna', 0, '', 0),
(173, 'Mr. Md. Sajjad Hossain', 'জনাব মো: সাজ্জাদ হোসেন', 5170, 17, 217, 7, 31, 0, NULL, '1976-01-01', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316004527', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(174, 'Mr. Md. Rezowan Hossain', 'জনাব মো: রেজওয়ান হোসেন', 5173, 18, 235, 7, 59, 0, NULL, '1981-09-06', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316004429', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(175, 'Mr. Md. Gias Uddin', 'জনাব মো: গিয়াস উদ্দিন', 5174, 18, 234, 7, 59, 0, NULL, '1981-11-24', '2005-12-15', 1, 1, 1, 1, 2, '0040-0316005142', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(176, 'Mr. Md Ebrahim', 'জনাব মো: ইব্রাহিম', 5234, 18, 230, 7, 65, 0, NULL, '1994-03-01', '2013-09-22', 1, 1, 1, 1, 2, '0040-0316003886', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(177, 'Mr. Md. Rubel Alam', 'জনাব মো: রুবেল আলম', 5233, 18, 230, 7, 65, 0, NULL, '1992-05-20', '2013-09-22', 1, 1, 1, 1, 2, '0040-0316005259', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(178, 'Mr. Jahangir Hossain', 'জনাব জাহাঙ্গীর হোসেন', 5176, 19, 251, 7, 53, 0, NULL, '1969-12-31', '1990-03-25', 1, 1, 1, 1, 2, '0040-0310029940', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(179, 'Mr. Md. Abul Kalam Molla', 'জনাব মো: আবুল কালাম মোল্লা', 5077, 19, 251, 7, 53, 0, NULL, '1972-04-04', '1995-11-18', 1, 1, 1, 1, 2, '0040-0316004278', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(180, 'Mrs. Begum Rozina Akter', 'জনাবা বেগম রোজিনা আক্তার', 5179, 12, 122, 9, 66, 0, NULL, '1974-07-19', '1995-02-26', 1, 1, 1, 1, 2, '0040-0316004563', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(181, 'Mr. Md. Sayed Ismail Hossain ', 'জনাব মো: সৈয়দ ইসমাইল হোসন', 5231, 15, 173, 9, 66, 0, NULL, '1984-04-17', '2013-09-19', 1, 1, 1, 1, 2, '0040-0316004581', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(182, 'Mr. Molla Abdus Sattar', 'জনাব মোল্লা আব্দুস সাত্তার', 5181, 19, 251, 9, 67, 0, NULL, '1972-11-18', '1995-11-18', 1, 1, 1, 1, 2, '0040-0316005535', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(183, 'Mr. Md. Mozahidur Islam Sharif', 'জনাব মো: মোজাহিদুর ইসলাম শরীফ', 5182, 11, 99, 10, 68, 0, NULL, '1982-09-12', '2005-12-14', 1, 1, 1, 1, 2, '0040-0316004205', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(184, 'Mrs. Ruksana Afroz Konok', 'জনাবা রুকসানা আফরোজ কনক', 5236, 19, 17, 10, 59, 0, NULL, '1990-01-10', '2013-10-19', 1, 1, 1, 1, 2, '0040-0316004232', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(185, 'Mr. Md .Mahbubur Rahman', 'জনাব মো: মাহবুবুর রহমান', 5184, 17, 215, 10, 75, 0, NULL, '1982-09-09', '2005-10-14', 1, 1, 1, 1, 2, '0040-0316004223', 3, '', '', 1, 1, '', 1, 'khulna', 'khulna', 1, '', 0),
(186, 'Mr. Azizur Rahman Molla', 'জনাব মো: আজিজুর রহমান মোল্লা', 5187, 19, 251, 10, 40, 0, NULL, '1979-08-01', '1995-11-18', 1, 1, 1, 1, 2, '0040-0316004170', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(187, 'Mrs. Masuma Khatun', 'জনাবা মাসুমা খাতুন', 5180, 12, 124, 11, 28, 0, NULL, '1972-12-07', '1996-06-30', 1, 1, 1, 1, 2, '0040-0316005366', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(188, 'Mr. Md. Abdur Karim Hawlader', 'জনাব মো: আব্দুর করিম হাওলাদার', 5177, 19, 251, 11, 40, 0, NULL, '1973-04-15', '1996-06-30', 1, 1, 1, 1, 2, '0040-0316003920', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(189, 'Mrs. Shamsunnahar', 'জনাবা সামসুন্নাহার', 5157, 20, 275, 12, 54, 0, NULL, '1976-01-20', '1995-05-02', 1, 1, 1, 1, 2, '0040-0316005768', 3, '', '', 2, 1, '', 2, 'Khulna', 'Khulna', 2, '', 0),
(190, 'Mr. Md Shahidul Islam', 'জনাব মো: শহিদুল ইসলাম', 5232, 18, 230, 12, 60, 0, NULL, '1985-07-13', '1913-09-19', 1, 1, 1, 1, 2, '0040-0316005357', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(191, 'Mr. Md. Akbar Hossain ', 'জনাব মো: আকবর হোসেন', 5190, 13, 142, 12, 70, 0, NULL, '1991-01-01', '1995-11-18', 1, 1, 1, 1, 2, '0040-0316005124', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(192, 'Mr. Md. Rafiqul Islam Tuhin', 'জনাব মো: রফিকুল ইসলাম (তুহিন)', 5191, 16, 194, 12, 70, 0, NULL, '1973-01-01', '2003-03-13', 1, 1, 1, 1, 2, '0040-0316005517', 3, '', '', 1, 1, '', 1, 'khulna', 'khulna', 1, '', 0),
(193, 'Mr. Md. Billal Hossain', 'জনাব মো: বিল্লাল হোসেন', 5189, 15, 179, 12, 71, 0, NULL, '1976-01-28', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316005722', 3, '', '', 1, 1, '', 1, 'Khulna\r\n', 'Khulna', 2, '', 0),
(194, 'Mr. Sk. Abdul Malek', 'জনাব মো: আব্দুল মালেক', 5194, 17, 215, 12, 70, 0, NULL, '1977-01-25', '2005-09-18', 1, 1, 1, 1, 2, '0040-0316005115', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(195, 'Mr. Md. Iqbal Hossain', 'জনাব মো: ইকবাল হোসেন', 5192, 20, 273, 12, 70, 0, NULL, '1980-01-01', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316005240', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(196, 'Mr. Hazi Md. Billal Hossain', 'জনাব হাজী মো: বিল্লাল হোসেন', 5193, 20, 272, 12, 70, 0, NULL, '1977-06-25', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316003635', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(197, 'Mr. Md. Zahangir Shikder', 'জনাব মো: জাহাঙ্গীর শিকদার', 5196, 17, 213, 12, 70, 0, NULL, '1976-06-01', '2005-09-18', 1, 1, 1, 1, 1, '0040-0316004090', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(198, 'Mr. Md. Emdadul Alam', 'জনাব মো: ইমদাদুল আলম', 5197, 17, 217, 12, 70, 0, NULL, '1979-06-01', '2005-09-18', 1, 1, 1, 1, 2, '0040-0316003653', 3, '', '', 1, 0, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(199, 'Mr. Abul Hossain', 'জনাব আবুল হোসেন', 5198, 18, 234, 12, 70, 0, NULL, '1984-04-05', '2007-02-06', 1, 1, 1, 1, 2, '0040-0316004670', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(200, 'Mr. Md. Firoz Hossain', 'জনাব মো: ফিরোজ হোসেন', 5199, 17, 217, 12, 70, 0, NULL, '1979-03-15', '2007-02-06', 1, 1, 1, 1, 2, '0040-0316003555', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(201, 'Md. Shah Alam ', 'জনাব মো: শাহ আলম', 5200, 17, 215, 12, 70, 0, NULL, '1982-10-10', '2007-02-07', 1, 1, 1, 1, 2, '0040-0316003788', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(202, 'Mr.  Abdul Alim Morol', 'জনাব আব্দুল আলীম মোড়ল', 5237, 18, 231, 12, 70, 0, NULL, '1985-04-10', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316005811', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(203, 'Mr. Khalilur Rahman', 'জনাব খলিলুর রহমান', 5202, 17, 215, 12, 72, 0, NULL, '1973-06-01', '2005-09-19', 1, 1, 1, 1, 2, '0040-0316003626', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(204, 'Mr. Shaik Abdul Zalil', 'জনাব শেথ আব্দুল জলিল', 5203, 17, 217, 12, 61, 0, NULL, '1963-01-01', '1988-10-10', 1, 1, 1, 1, 2, '', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(205, 'Mr. Shah Shazzad Hossain', 'জনাব শাহ্ সাজ্জাদ হোসেন', 5205, 17, 217, 12, 61, 0, NULL, '1969-11-06', '1994-08-01', 1, 1, 1, 1, 2, '0040-0316003537', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(206, 'Mr. Golam Kibria', 'জনাব গোলাম কিবরিয়া', 5204, 17, 216, 12, 61, 0, NULL, '1969-12-18', '1969-11-03', 1, 1, 1, 1, 2, '0040-0316003895', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(207, 'Mr. Uttam Kumer Chakrobarti', 'জনাব উত্তম কুমার চক্রবর্তী (মানিক)', 5206, 17, 218, 12, 61, 0, NULL, '1977-11-30', '1996-06-30', 1, 1, 2, 1, 2, '0040-0316003617', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(208, 'Mr. Sk. Noor Mohammad', 'জনাব  শেখ নূর মোহাম্মদ', 5207, 18, 236, 12, 42, 0, NULL, '1964-06-29', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316005446', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(209, 'Mr. S. M. Salim', 'জনাব  এস এম সেলিম', 5208, 18, 236, 12, 42, 0, NULL, '1975-02-01', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316004938', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(210, 'Mr. Habibur Rahman', 'জনাব হাবিবুর রহমান', 5079, 19, 251, 12, 40, 0, NULL, '1968-10-03', '1989-10-04', 1, 1, 1, 1, 2, '0040-0316005204', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(211, 'Mr. Md. Rabbi Sobhan', 'জনাব মো: রাব্বি সোবহান', 5209, 20, 268, 12, 42, 0, NULL, '1985-08-04', '2005-09-18', 1, 1, 1, 1, 2, '0040-0316004287', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(212, 'Mr. Md. Mozammel Shaikh', 'জনাব মো: মোজ়াম্মেল শেখ', 5210, 20, 268, 12, 42, 0, NULL, '1984-05-23', '2005-12-14', 1, 1, 1, 1, 2, '0040-0316005526', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(213, 'Mr. Rakib Uddin ', 'জনাব রাকিব উদ্দিন', 5211, 19, 248, 12, 73, 0, NULL, '1987-01-01', '2005-02-14', 1, 1, 1, 1, 2, '0040-0316003984', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(214, 'Mr. Maharaj Sheikh', 'জনাব মো: মহারাজ শেখ', 5166, 19, 251, 12, 40, 0, NULL, '1974-04-15', '1995-02-25', 1, 1, 1, 1, 2, '0040-0316003831', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(215, 'Mrs. Jahanara Begum', 'জনাবা জাহানারা বেগম', 5062, 19, 251, 2, 48, 0, NULL, '1966-10-28', '1992-05-07', 1, 1, 1, 1, 2, '0040-0316004063', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_allowances`
--

CREATE TABLE `employee_allowances` (
  `id` int(11) NOT NULL,
  `house_rent` double(10,2) NOT NULL,
  `medical` double(10,2) NOT NULL,
  `education` double(10,2) NOT NULL,
  `convence` double(10,2) NOT NULL,
  `tiffin` double(10,2) NOT NULL,
  `wash` double(10,2) NOT NULL,
  `mobile` double(10,2) NOT NULL,
  `cycle` double(10,2) NOT NULL,
  `da` double(10,2) NOT NULL,
  `charges` double(10,2) NOT NULL,
  `others` double(10,2) NOT NULL,
  `pp` double(10,2) NOT NULL,
  `fix_charges` tinyint(4) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_allowances`
--

INSERT INTO `employee_allowances` (`id`, `house_rent`, `medical`, `education`, `convence`, `tiffin`, `wash`, `mobile`, `cycle`, `da`, `charges`, `others`, `pp`, `fix_charges`, `employee_id`) VALUES
(1, 26448.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 0.00, 1, 1),
(2, 24336.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 0.00, 1, 2),
(3, 24336.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 0.00, 1, 3),
(4, 23424.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 4),
(5, 22412.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 5),
(6, 22412.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 6),
(7, 16336.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 7),
(8, 16000.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 8),
(9, 16336.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 9),
(10, 16000.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 10),
(11, 16000.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 11),
(12, 16000.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 12),
(13, 16336.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 13),
(14, 16000.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 14),
(15, 16000.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 15),
(16, 16000.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 16),
(17, 15111.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 17),
(18, 12645.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 18),
(19, 11466.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 19),
(20, 16000.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 20),
(21, 15867.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 21),
(22, 16000.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 22),
(23, 16000.00, 1500.00, 500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 23),
(24, 16000.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 24),
(25, 16000.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 25),
(26, 13216.50, 1500.00, 500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 26),
(27, 10147.50, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 27),
(28, 12645.00, 1500.00, 500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 28),
(29, 13216.50, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 29),
(30, 11466.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 30),
(31, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 31),
(32, 14575.50, 1500.00, 500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 75.00, 0.00, 0.00, 1, 32),
(33, 13279.50, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 33),
(34, 10147.50, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 34),
(35, 7560.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 35),
(36, 8725.50, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 36),
(37, 9661.50, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 37),
(38, 0.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 38),
(39, 8725.50, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 39),
(40, 7555.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 40),
(41, 8725.50, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 41),
(42, 8082.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 42),
(43, 6245.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 43),
(44, 7940.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 44),
(45, 5400.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 45),
(46, 6890.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 46),
(47, 8000.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 47),
(48, 7195.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 48),
(49, 6855.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 49),
(50, 7555.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 50),
(51, 5263.50, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 51),
(52, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 52),
(53, 5263.50, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 53),
(54, 6855.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 54),
(55, 6000.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 55),
(56, 7360.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 56),
(57, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 57),
(58, 6300.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 58),
(59, 5400.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 59),
(60, 6300.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 60),
(61, 7360.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 61),
(62, 6300.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 62),
(63, 0.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 63),
(64, 6670.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 64),
(65, 6350.00, 1500.00, 1000.00, 0.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 65),
(66, 6300.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 66),
(67, 6210.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 67),
(68, 7005.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 68),
(69, 7360.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 69),
(70, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 70),
(71, 7360.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 71),
(72, 7360.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 72),
(73, 6300.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 73),
(74, 6300.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 74),
(75, 7360.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 75),
(76, 7360.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 76),
(77, 7005.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 77),
(78, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 78),
(79, 7200.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 79),
(80, 7360.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 80),
(81, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 81),
(82, 7360.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 82),
(83, 7360.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 83),
(84, 7360.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 84),
(85, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 85),
(86, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 86),
(87, 7360.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 87),
(88, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 88),
(89, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 89),
(90, 6670.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 90),
(91, 6670.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 91),
(92, 6525.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 92),
(93, 7360.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 93),
(94, 7360.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 94),
(95, 5400.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 95),
(96, 5263.50, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 96),
(97, 7005.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 97),
(98, 90.32, 22.58, 6.45, 0.00, 0.00, 0.00, 0.00, 0.00, 17.74, 0.00, 0.00, 0.00, 1, 98),
(99, 7005.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 99),
(100, 7005.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 100),
(101, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 101),
(102, 11191.50, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 102),
(103, 8000.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 103),
(104, 8307.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 105),
(105, 8307.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 106),
(106, 8307.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 107),
(107, 6850.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 108),
(108, 6850.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 109),
(109, 6850.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 110),
(110, 6300.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 111),
(111, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 112),
(112, 5263.50, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 113),
(113, 9652.50, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 114),
(114, 9189.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 115),
(115, 0.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 116),
(116, 8082.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 117),
(117, 8280.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 118),
(118, 0.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 119),
(119, 0.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 120),
(120, 7560.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 121),
(121, 8000.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 122),
(122, 8000.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 123),
(123, 8000.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 124),
(124, 7940.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 125),
(125, 8000.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 126),
(126, 7555.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 127),
(127, 7555.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 128),
(128, 6850.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 129),
(129, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 130),
(130, 6000.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 131),
(131, 5263.50, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 132),
(132, 7730.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 133),
(133, 6300.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 134),
(134, 7360.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 135),
(135, 7360.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 136),
(136, 6350.00, 1500.00, 0.00, 0.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 137),
(137, 7005.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 138),
(138, 7005.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 139),
(139, 6670.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 140),
(140, 6615.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 141),
(141, 6670.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 142),
(142, 9189.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 143),
(143, 8307.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 144),
(144, 8725.50, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 145),
(145, 7560.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 146),
(146, 6850.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 147),
(147, 8725.50, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 148),
(148, 6850.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 149),
(149, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 150),
(150, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 151),
(151, 5263.50, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 152),
(152, 8725.50, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 153),
(153, 8000.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 154),
(154, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 155),
(155, 8000.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 156),
(156, 0.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 157),
(157, 8000.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 158),
(158, 8082.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 159),
(159, 8082.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 160),
(160, 8082.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 161),
(161, 7200.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 162),
(162, 7195.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 163),
(163, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 164),
(164, 6000.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 165),
(165, 6300.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 166),
(166, 9189.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 167),
(167, 8725.50, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 168),
(168, 8307.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 169),
(169, 8307.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 170),
(170, 0.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 171),
(171, 0.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 172),
(172, 7555.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 173),
(173, 6890.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 174),
(174, 6560.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 175),
(175, 5400.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 176),
(176, 5400.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 177),
(177, 7005.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 178),
(178, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 179),
(179, 10656.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 180),
(180, 6370.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 181),
(181, 7005.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 182),
(182, 12042.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 183),
(183, 5400.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 184),
(184, 6850.00, 1500.00, 500.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 185),
(185, 7005.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 186),
(186, 11754.00, 1500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 187),
(187, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 188),
(188, 0.00, 1500.00, 1000.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 189),
(189, 5400.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 190),
(190, 9189.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 191),
(191, 6525.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 192),
(192, 8000.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 193),
(193, 6850.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 194),
(194, 7560.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 195),
(195, 7200.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 196),
(196, 7446.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 197),
(197, 7555.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 198),
(198, 6560.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 199),
(199, 7555.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 200),
(200, 6850.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 201),
(201, 6792.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 202),
(202, 6850.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 203),
(203, 7555.00, 1500.00, 1000.00, 0.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 204),
(204, 7555.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 205),
(205, 7195.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 206),
(206, 7935.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 207),
(207, 7235.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 208),
(208, 7235.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 209),
(209, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 210),
(210, 6210.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 211),
(211, 6210.00, 1500.00, 500.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 212),
(212, 6045.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 213),
(213, 7005.00, 1500.00, 1000.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 214),
(214, 7005.00, 1500.00, 0.00, 300.00, 200.00, 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 215),
(215, 0.00, 1500.00, 0.00, 300.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 104);

-- --------------------------------------------------------

--
-- Table structure for table `employee_bonus`
--

CREATE TABLE `employee_bonus` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `current_basic` double(10,2) NOT NULL,
  `scale_id` int(11) NOT NULL,
  `bonus_amount` double(10,2) NOT NULL,
  `percent` double(5,2) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `festival_tracking_config_meta_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` date NOT NULL
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

--
-- Dumping data for table `employee_children`
--

INSERT INTO `employee_children` (`id`, `employee_id`, `name`, `dob`, `edu_status_id`, `file_path`) VALUES
(4, 1, 'fsdfsdf', '2009-10-05', 1, 'patal2.PNG'),
(5, 2, 'fsdafasdf', '2015-07-28', 1, 'bkash_user_list.xls'),
(6, 2, 'fsdfdsaf', '2017-06-26', 1, 'bkash_db.sql');

-- --------------------------------------------------------

--
-- Table structure for table `employee_grades`
--

CREATE TABLE `employee_grades` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `grade_declare_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_grades`
--

INSERT INTO `employee_grades` (`id`, `name`, `grade_declare_year`) VALUES
(1, '1', 2017),
(2, '2', 2015),
(3, '1', 2015),
(5, '3', 2015),
(6, '4', 2015),
(7, '5', 2015),
(8, '6', 2015),
(9, '7', 2015),
(10, '8', 2015),
(11, '9', 2015),
(12, '10', 2015),
(13, '11', 2015),
(14, '12', 2015),
(15, '13', 2015),
(16, '14', 2015),
(17, '15', 2015),
(18, '16', 2015),
(19, '17', 2015),
(20, '18', 2015),
(21, '19', 2015),
(22, '20', 2015),
(29, '21', 2015);

-- --------------------------------------------------------

--
-- Table structure for table `employee_house_rent_settings`
--

CREATE TABLE `employee_house_rent_settings` (
  `id` int(11) NOT NULL,
  `gazette_year` int(11) NOT NULL,
  `min_basic` int(11) NOT NULL,
  `max_basic` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `house_rent_percent` int(11) NOT NULL,
  `house_rent_min` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('Active','Inactive','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_house_rent_settings`
--

INSERT INTO `employee_house_rent_settings` (`id`, `gazette_year`, `min_basic`, `max_basic`, `location_id`, `house_rent_percent`, `house_rent_min`, `created_date`, `update_date`, `user_id`, `status`) VALUES
(1, 2015, 0, 9700, 1, 65, 5600, '2017-07-20 00:00:00', '2017-07-12 00:00:00', 1, 'Active'),
(2, 2015, 9701, 16000, 1, 60, 6400, '2017-07-18 00:00:00', '2017-07-26 00:00:00', 1, 'Active'),
(3, 2015, 0, 9700, 2, 55, 5000, '2017-07-30 12:10:09', '0000-00-00 00:00:00', 1, 'Active'),
(4, 2015, 9701, 16000, 2, 50, 5400, '2017-07-30 12:11:00', '0000-00-00 00:00:00', 1, 'Active'),
(5, 2015, 0, 9700, 3, 50, 4500, '2017-07-30 12:12:04', '0000-00-00 00:00:00', 1, 'Active'),
(6, 2015, 9701, 16000, 3, 45, 4800, '2017-07-30 12:12:49', '0000-00-00 00:00:00', 1, 'Active'),
(7, 2015, 16001, 35500, 1, 55, 9600, '2017-08-05 14:30:30', '0000-00-00 00:00:00', 1, 'Active'),
(8, 2015, 16001, 35500, 2, 45, 8000, '2017-08-05 14:31:28', '0000-00-00 00:00:00', 1, 'Active'),
(9, 2015, 16001, 35500, 3, 40, 7000, '2017-08-05 14:32:53', '0000-00-00 00:00:00', 1, 'Active'),
(10, 2015, 35501, 78000, 1, 50, 19500, '2017-08-05 14:34:17', '0000-00-00 00:00:00', 1, 'Active'),
(11, 2015, 35501, 78000, 2, 40, 16000, '2017-08-05 14:35:09', '0000-00-00 00:00:00', 1, 'Active'),
(12, 2015, 35501, 78000, 3, 35, 13800, '2017-08-05 14:35:57', '0000-00-00 00:00:00', 1, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `employee_loans`
--

CREATE TABLE `employee_loans` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `loan_type_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `loan_amount` double(12,2) NOT NULL,
  `current_due` double(12,2) NOT NULL,
  `interest_amount` double(10,2) NOT NULL,
  `interest_amount_due` double(10,2) NOT NULL,
  `first_adjustment_employee_loan_id` int(11) NOT NULL DEFAULT '0',
  `first_adjustment_current_due` double(10,2) NOT NULL DEFAULT '0.00',
  `first_adjustment_interest_amount_due` double(10,2) NOT NULL DEFAULT '0.00',
  `first_adjustment_interest_applied_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `first_adjustment_applied_interest` double(10,2) NOT NULL DEFAULT '0.00',
  `second_adjustment_employee_loan_id` int(11) NOT NULL DEFAULT '0',
  `second_adjustment_current_due` double(10,2) NOT NULL DEFAULT '0.00',
  `second_adjustment_interest_amount_due` double(10,2) NOT NULL DEFAULT '0.00',
  `second_adjustment_interest_applied_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `second_adjustment_applied_interest` double(10,2) NOT NULL DEFAULT '0.00',
  `recovery_start_month_id` int(11) NOT NULL,
  `recovery_year_id` int(11) NOT NULL,
  `first_installment_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `first_installment_date` date NOT NULL,
  `second_installment_amount` double(10,2) DEFAULT '0.00',
  `second_installment_date` date DEFAULT NULL,
  `third_installment_amount` double(8,2) DEFAULT '0.00',
  `third_installment_date` date DEFAULT NULL,
  `total_payable` double(10,2) NOT NULL DEFAULT '0.00',
  `number_of_installment` int(11) NOT NULL,
  `installment_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `loan_apply_date` date NOT NULL,
  `loan_approved_date` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_loans`
--

INSERT INTO `employee_loans` (`id`, `employee_id`, `loan_type_id`, `loan_id`, `loan_amount`, `current_due`, `interest_amount`, `interest_amount_due`, `first_adjustment_employee_loan_id`, `first_adjustment_current_due`, `first_adjustment_interest_amount_due`, `first_adjustment_interest_applied_amount`, `first_adjustment_applied_interest`, `second_adjustment_employee_loan_id`, `second_adjustment_current_due`, `second_adjustment_interest_amount_due`, `second_adjustment_interest_applied_amount`, `second_adjustment_applied_interest`, `recovery_start_month_id`, `recovery_year_id`, `first_installment_amount`, `first_installment_date`, `second_installment_amount`, `second_installment_date`, `third_installment_amount`, `third_installment_date`, `total_payable`, `number_of_installment`, `installment_amount`, `loan_apply_date`, `loan_approved_date`, `status`) VALUES
(3, 3, 7, 4, 120000.00, 3647.10, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2003-06-04', 60000.00, '2003-06-10', NULL, NULL, 180500.00, 120, 1000.00, '2003-06-04', '2003-06-04', 1),
(4, 4, 7, 4, 120000.00, 3976.49, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2003-01-27', 60000.00, '2003-02-04', NULL, NULL, 180502.00, 120, 1000.00, '2003-01-27', '2003-01-27', 1),
(5, 6, 7, 4, 120000.00, 33000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2008-06-30', 60000.00, '2008-08-20', NULL, NULL, 180502.00, 120, 1000.00, '2008-06-30', '2008-06-30', 1),
(6, 24, 7, 4, 120000.00, 77000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2012-02-01', 60000.00, '2012-02-13', NULL, NULL, 180500.00, 120, 1000.00, '2012-02-01', '2012-02-01', 1),
(7, 25, 7, 4, 120000.00, 27909.51, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2003-09-17', 60000.00, '2003-10-04', NULL, NULL, 180501.00, 120, 1000.00, '2003-09-17', '2003-09-17', 1),
(8, 26, 7, 4, 120000.00, 77000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2012-03-15', 60000.00, '2012-05-30', NULL, NULL, 180501.00, 120, 1000.00, '2012-03-15', '2012-03-15', 1),
(9, 29, 7, 4, 120000.00, 101000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2014-02-06', 60000.00, '2014-03-13', NULL, NULL, 180500.00, 120, 1000.00, '2014-02-06', '2014-02-06', 1),
(12, 34, 7, 4, 120000.00, 100000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2012-02-06', 60000.00, '2013-12-17', NULL, NULL, 180500.00, 120, 1000.00, '2012-02-06', '2012-02-06', 1),
(14, 36, 7, 4, 86940.00, 38047.33, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 43470.00, '2001-02-12', 43470.00, '2001-07-16', NULL, NULL, 118819.00, 120, 725.50, '2001-02-12', '2001-02-12', 1),
(15, 40, 7, 4, 83160.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 41580.00, '2003-08-23', 41580.00, '2003-09-27', NULL, NULL, 125089.00, 120, 693.00, '2003-08-23', '2003-08-23', 1),
(16, 41, 7, 4, 90180.00, 24325.87, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 45090.00, '2004-05-13', 45090.00, '2004-07-22', NULL, NULL, 135647.00, 120, 1000.00, '2004-05-13', '2004-05-13', 1),
(17, 46, 7, 4, 55800.00, 20219.67, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 27900.00, '2001-12-24', 27900.00, '2002-01-10', NULL, NULL, 83935.70, 120, 465.00, '2001-12-24', '2001-12-24', 1),
(18, 47, 7, 4, 120000.00, 97000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2013-10-27', 60000.00, '2013-11-24', NULL, NULL, 180502.00, 120, 1000.00, '2013-10-27', '2013-10-27', 1),
(19, 54, 7, 7, 60000.00, 42000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2014-09-23', NULL, '1969-12-31', NULL, NULL, 90252.80, 60, 1000.00, '2014-09-23', '2014-09-23', 1),
(20, 56, 7, 4, 64800.00, 31496.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 32400.00, '2022-12-27', 32400.00, '2001-10-31', NULL, NULL, 97472.50, 120, 540.00, '2022-12-27', '2001-07-22', 1),
(21, 57, 7, 4, 66600.00, 34635.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 33300.00, '2002-01-10', 333000.00, '2002-05-05', NULL, NULL, 100179.00, 120, 555.00, '2002-01-10', '2002-01-10', 1),
(22, 61, 7, 7, 60000.00, 57000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2016-04-05', NULL, '1969-12-31', NULL, NULL, 75250.60, 60, 1000.00, '2016-04-05', '2016-04-05', 1),
(23, 63, 7, 7, 60000.00, 24000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2013-01-15', NULL, '1969-12-31', NULL, NULL, 75251.80, 60, 1000.00, '2013-01-15', '2013-01-15', 1),
(24, 64, 7, 4, 61200.00, 26481.50, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 30600.00, '2000-01-25', 30600.00, '2000-12-17', NULL, NULL, 92058.00, 120, 510.00, '2000-01-25', '2000-01-25', 1),
(25, 65, 7, 4, 61200.00, 27545.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 30600.00, '2001-01-01', 30600.00, '2001-04-30', NULL, NULL, 92055.00, 120, 510.00, '2001-01-01', '2001-01-01', 1),
(26, 68, 7, 7, 60000.00, 57000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2016-04-05', NULL, '1969-12-31', NULL, NULL, 75250.60, 60, 1000.00, '2016-04-05', '2016-04-05', 1),
(27, 69, 7, 4, 120000.00, 7000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '1970-01-01', 60000.00, '2011-09-08', NULL, NULL, 180502.00, 120, 1000.00, '2008-06-30', '2008-06-30', 1),
(28, 69, 7, 7, 60000.00, 7000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2011-09-08', NULL, '1969-12-31', NULL, NULL, 75251.00, 60, 1000.00, '2011-09-08', '2011-09-08', 1),
(29, 70, 7, 4, 71280.00, 38602.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35640.00, '2002-07-16', 35640.00, '2002-10-20', NULL, NULL, 107219.00, 120, 594.00, '2002-07-16', '2002-07-16', 1),
(32, 77, 7, 7, 60000.00, 12000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2011-09-11', NULL, '1969-12-31', NULL, NULL, 75251.30, 60, 1000.00, '2011-09-11', '2011-09-11', 1),
(33, 78, 7, 7, 60000.00, 14000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2012-02-06', NULL, '1969-12-31', NULL, NULL, 75250.70, 60, 1000.00, '2012-02-06', '2012-02-06', 1),
(34, 80, 7, 4, 66960.00, 28376.33, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 33480.00, '2000-10-02', 33480.00, '2000-12-17', NULL, NULL, 100719.00, 120, 558.00, '2000-10-02', '2000-10-02', 1),
(35, 81, 7, 4, 71280.00, 38602.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35640.00, '2002-07-16', 35640.00, '2002-10-19', NULL, NULL, 107219.00, 120, 594.00, '2002-07-16', '2002-07-16', 1),
(36, 83, 7, 7, 60000.00, 46000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2015-03-11', NULL, '1969-12-31', NULL, NULL, 75251.30, 60, 1000.00, '2015-03-11', '2015-03-11', 1),
(37, 86, 7, 4, 69120.00, 39596.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 34560.00, '2001-07-22', 34560.00, '2001-11-01', NULL, NULL, 103970.00, 120, 576.00, '2001-07-22', '2001-07-22', 1),
(38, 87, 7, 7, 60000.00, 57000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 30600.00, '2000-10-03', NULL, '1969-12-31', NULL, NULL, 92055.40, 60, 1000.00, '2016-04-05', '2016-04-05', 1),
(39, 89, 7, 4, 64800.00, 33470.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 32400.00, '2002-07-16', 32400.00, '2002-10-19', NULL, NULL, 97471.80, 120, 540.00, '2002-07-16', '2002-07-16', 1),
(40, 89, 7, 7, 60000.00, 0.00, 28250.00, 25517.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2008-06-30', NULL, '1969-12-31', NULL, NULL, 75253.70, 60, 1000.00, '2008-06-30', '2008-06-30', 1),
(41, 90, 7, 4, 54000.00, 900.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 27000.00, '2003-10-25', 27000.00, '2003-11-08', NULL, NULL, 81228.40, 120, 450.00, '2003-10-25', '2003-10-25', 1),
(42, 91, 7, 4, 59400.00, 25714.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 29700.00, '2001-01-11', 29700.00, '2001-04-25', NULL, NULL, 89348.90, 120, 495.00, '2001-01-11', '2001-01-11', 1),
(43, 94, 7, 4, 71280.00, 30831.10, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35640.00, '2001-01-11', 35640.00, '2001-04-30', NULL, NULL, 107218.00, 120, 594.00, '2001-01-11', '2001-01-11', 1),
(45, 98, 7, 4, 63000.00, 62475.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 31500.00, '2002-07-16', 31500.00, '0000-00-00', NULL, NULL, 94764.40, 120, 525.00, '2002-07-16', '2002-07-16', 1),
(46, 100, 7, 7, 60000.00, 27000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2015-03-11', NULL, '1969-12-31', NULL, NULL, 67751.30, 30, 2000.00, '2015-03-11', '2015-03-11', 1),
(47, 103, 7, 4, 83600.00, 36712.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 41800.00, '2001-01-01', 41800.00, '2001-02-04', NULL, NULL, 125748.00, 120, 697.50, '2001-01-01', '2001-01-01', 1),
(48, 103, 7, 7, 60000.00, 19000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2012-06-28', NULL, '1969-12-31', NULL, NULL, 75253.40, 60, 1000.00, '2012-06-28', '2012-06-28', 1),
(49, 112, 7, 4, 61200.00, 26015.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 30600.00, '2001-02-12', 30600.00, '2001-07-17', NULL, NULL, 92056.50, 120, 510.00, '2001-02-12', '2001-02-12', 1),
(50, 115, 7, 4, 88560.00, 2214.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 44280.00, '2001-02-12', 44280.00, '2001-09-04', NULL, NULL, 133210.00, 120, 738.00, '2001-02-12', '2001-02-12', 1),
(51, 117, 7, 4, 97560.00, 53625.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 48780.00, '2003-08-23', 48780.00, '2003-09-07', NULL, NULL, 146748.00, 120, 1000.00, '2003-08-23', '2003-08-23', 1),
(52, 119, 7, 4, 88560.00, 36223.50, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 44280.00, '2001-02-12', 44280.00, '2001-09-09', NULL, NULL, 133210.00, 120, 738.00, '2001-02-12', '2001-02-12', 1),
(53, 120, 7, 4, 86940.00, 38925.50, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 43470.00, '2002-09-14', 43470.00, '2003-11-22', NULL, NULL, 130773.00, 120, 724.50, '2002-09-14', '2002-09-14', 1),
(54, 125, 7, 4, 41580.00, 693.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 41580.00, '2003-10-11', NULL, '1969-12-31', NULL, NULL, 62545.20, 120, 346.50, '2003-10-11', '2003-10-11', 1),
(55, 126, 7, 4, 105480.00, 55232.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 52740.00, '2003-01-04', 52740.00, '2003-03-11', NULL, NULL, 158660.00, 120, 879.00, '2003-01-04', '2003-01-04', 1),
(56, 127, 7, 4, 120000.00, 64000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2010-02-04', 60000.00, '2010-12-13', NULL, NULL, 180500.00, 120, 1000.00, '2010-02-04', '2010-02-04', 1),
(57, 133, 7, 4, 61260.00, 24222.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 30630.00, '2000-09-25', 30630.00, '2000-12-17', NULL, NULL, 92148.30, 120, 510.00, '2000-09-25', '2000-09-25', 1),
(58, 135, 7, 4, 69120.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 34560.00, '2003-08-23', 34560.00, '2003-10-16', NULL, NULL, 103970.00, 120, 576.00, '2003-08-23', '2003-08-23', 1),
(59, 138, 7, 7, 60000.00, 1000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2011-03-27', NULL, '1969-12-31', NULL, NULL, 75253.30, 60, 1000.00, '2011-03-27', '2011-03-27', 1),
(60, 153, 7, 8, 35000.00, 4195.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 29.00, '2011-03-29', NULL, NULL, NULL, NULL, 42151.90, 48, 730.00, '2011-03-29', '2011-03-29', 1),
(61, 139, 7, 7, 60000.00, 42000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2014-09-23', NULL, '1969-12-31', NULL, NULL, 75252.80, 60, 1000.00, '2014-09-23', '2014-09-23', 1),
(62, 140, 7, 7, 60000.00, 33000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2010-02-04', NULL, '1969-12-31', NULL, NULL, 75250.50, 60, 1000.00, '2010-02-04', '2010-02-04', 1),
(63, 162, 7, 8, 35000.00, 32810.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 5.00, '2016-04-05', NULL, NULL, NULL, NULL, 42146.90, 48, 730.00, '2016-04-05', '2016-04-05', 1),
(64, 142, 7, 4, 59400.00, 23146.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 29700.00, '2011-07-22', 29700.00, '2001-10-30', NULL, NULL, 89350.20, 120, 495.00, '2011-07-22', '2011-07-22', 1),
(65, 142, 7, 7, 60000.00, 21000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2003-01-20', NULL, '1969-12-31', NULL, NULL, 75252.40, 60, 1000.00, '2003-01-20', '2003-01-20', 1),
(66, 152, 7, 8, 35000.00, 32810.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 5.00, '2016-04-05', NULL, NULL, NULL, NULL, 42146.90, 48, 730.00, '2016-04-05', '2016-04-05', 1),
(67, 165, 7, 8, 35000.00, 16750.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2014-02-06', NULL, NULL, NULL, NULL, 42147.10, 48, 730.00, '2014-02-06', '2014-02-06', 1),
(68, 171, 7, 8, 35000.00, 5070.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2012-06-28', NULL, NULL, NULL, NULL, 42151.70, 48, 730.00, '2012-06-28', '2012-06-28', 1),
(69, 144, 7, 4, 120000.00, 110000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2014-01-02', 60000.00, '2014-12-14', NULL, NULL, 180500.00, 120, 1000.00, '2014-01-02', '2014-01-02', 1),
(70, 10, 7, 8, 35000.00, 32080.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2016-04-05', NULL, NULL, NULL, NULL, 42146.90, 48, 730.00, '2016-04-05', '2016-04-05', 1),
(71, 145, 7, 7, 60000.00, 5035.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2002-06-28', NULL, '1969-12-31', NULL, NULL, 75253.40, 60, 1000.00, '2002-06-28', '2002-06-28', 1),
(72, 38, 7, 8, 35000.00, 8720.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2013-01-14', NULL, NULL, NULL, NULL, 42148.80, 48, 730.00, '2013-01-14', '2013-01-14', 1),
(73, 148, 7, 4, 115020.00, 55905.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 57510.00, '2001-07-22', 57510.00, '2001-10-31', NULL, NULL, 173011.00, 120, 958.50, '2001-07-22', '2001-07-22', 1),
(74, 39, 7, 8, 35000.00, 15290.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2014-02-06', NULL, NULL, NULL, NULL, 42147.10, 48, 730.00, '2014-02-06', '2014-02-06', 1),
(75, 150, 7, 4, 61200.00, 24145.37, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 30600.00, '2000-06-08', 30600.00, '2000-08-13', NULL, NULL, 92056.00, 120, 510.00, '2000-06-08', '2000-06-08', 1),
(76, 42, 7, 8, 35000.00, 25510.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2015-03-31', NULL, NULL, NULL, NULL, 42152.30, 48, 730.00, '2015-03-31', '2015-03-31', 1),
(78, 151, 7, 4, 63000.00, 27337.74, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 31500.00, '2001-01-01', 31500.00, '2001-04-23', NULL, NULL, 94762.50, 120, 525.00, '2001-01-01', '2001-01-01', 1),
(79, 151, 7, 7, 60000.00, 11000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2011-09-11', NULL, '1969-12-31', NULL, NULL, 75251.30, 60, 1000.00, '2011-09-11', '2011-09-11', 1),
(80, 156, 7, 7, 60000.00, 0.00, 1000.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2008-06-30', NULL, '1969-12-31', NULL, NULL, 75253.70, 60, 1000.00, '2008-06-30', '2008-06-30', 1),
(81, 158, 7, 4, 110340.00, 67876.87, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 55170.00, '2002-10-26', 55170.00, '2002-11-27', NULL, NULL, 165971.00, 120, 920.00, '2002-10-26', '2002-10-26', 1),
(82, 45, 7, 8, 35000.00, 32810.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2016-04-05', NULL, NULL, NULL, NULL, 42146.90, 48, 730.00, '2016-04-05', '2016-04-05', 1),
(83, 159, 7, 4, 60000.00, 20000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2011-09-14', NULL, '1969-12-31', NULL, NULL, 75251.70, 60, 1000.00, '2011-09-14', '2011-09-14', 1),
(84, 48, 7, 8, 35000.00, 25530.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2015-03-31', NULL, NULL, NULL, NULL, 42152.30, 48, 730.00, '2015-03-31', '2015-03-31', 1),
(85, 49, 7, 8, 35000.00, 3505.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2011-03-29', NULL, NULL, NULL, NULL, 42151.90, 48, 730.00, '2011-03-29', '2011-03-29', 1),
(86, 160, 7, 4, 90180.00, 53913.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 45090.00, '2002-11-05', 45090.00, '2003-02-04', NULL, NULL, 135646.00, 120, 752.00, '2002-11-05', '2002-11-05', 1),
(87, 162, 7, 4, 120000.00, 110000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2014-10-02', 60000.00, '2014-12-14', NULL, NULL, 180500.00, 120, 1000.00, '2014-10-02', '2014-10-02', 1),
(88, 58, 7, 8, 35000.00, 8720.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2013-01-14', NULL, NULL, NULL, NULL, 42148.80, 48, 730.00, '2013-01-14', '2013-01-14', 1),
(89, 164, 7, 4, 120000.00, 42000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2007-12-19', 60000.00, '2008-07-13', NULL, NULL, 180501.00, 120, 1000.00, '2007-12-19', '2007-12-19', 1),
(90, 60, 7, 8, 35000.00, 16750.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2014-02-06', NULL, NULL, NULL, NULL, 42147.10, 48, 730.00, '2014-02-06', '2014-02-06', 1),
(91, 165, 7, 4, 120000.00, 96000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2003-01-22', 60000.00, '2013-02-25', NULL, NULL, 180501.00, 120, 1000.00, '2003-01-22', '2003-01-22', 1),
(92, 166, 7, 4, 120000.00, 84000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2012-01-30', 60000.00, '2012-01-09', NULL, NULL, 180502.00, 120, 1000.00, '2012-01-30', '2012-01-30', 1),
(93, 62, 7, 8, 35000.00, 16750.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2014-02-06', NULL, NULL, NULL, NULL, 42147.10, 48, 730.00, '2014-02-06', '2014-02-06', 1),
(94, 169, 7, 7, 60000.00, 57000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2016-04-05', NULL, '1969-12-31', NULL, NULL, 75250.60, 60, 1000.00, '2016-04-05', '2016-04-05', 1),
(95, 70, 7, 8, 35000.00, 12370.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2013-06-07', NULL, NULL, NULL, NULL, 42147.30, 48, 730.00, '2013-06-07', '2013-06-07', 1),
(96, 170, 7, 4, 110340.00, 2620.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 55170.00, '2007-01-21', 55170.00, '2004-04-26', NULL, NULL, 165971.00, 120, 920.00, '2007-01-21', '2007-01-21', 1),
(97, 72, 7, 8, 35000.00, 0.00, 12979.17, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2010-06-29', NULL, NULL, NULL, NULL, 42151.90, 48, 730.00, '2010-06-29', '2010-06-29', 0),
(98, 178, 7, 7, 60000.00, 24000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2013-11-10', NULL, '1969-12-31', NULL, NULL, 75251.20, 60, 1000.00, '2013-11-10', '2013-11-10', 1),
(99, 179, 7, 4, 63000.00, 27306.26, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 31500.00, '2001-01-01', 31500.00, '2001-04-30', NULL, NULL, 94762.50, 120, 525.00, '2001-01-01', '2001-01-01', 1),
(100, 73, 7, 8, 35000.00, 12370.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2013-06-27', NULL, NULL, NULL, NULL, 42151.50, 48, 730.00, '2013-06-27', '2013-06-27', 1),
(101, 74, 7, 8, 35000.00, 0.00, 10791.67, 10021.67, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2011-09-08', NULL, NULL, NULL, NULL, 42147.50, 48, 730.00, '2011-09-08', '2011-09-08', 1),
(102, 180, 7, 4, 105840.00, 43874.06, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 52920.00, '2002-06-06', 52920.00, '2002-12-06', NULL, NULL, 159201.00, 120, 1000.00, '2002-06-06', '2002-06-06', 1),
(103, 79, 7, 8, 35000.00, 25510.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2015-03-31', NULL, '1969-12-31', NULL, NULL, 42152.30, 48, 730.00, '2015-03-31', '2015-03-31', 1),
(105, 84, 7, 8, 35000.00, 25510.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2015-03-31', NULL, NULL, NULL, NULL, 42152.30, 48, 730.00, '2015-03-31', '2015-03-31', 1),
(106, 188, 7, 4, 66600.00, 41009.61, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 33300.00, '2002-10-26', 333000.00, '2002-11-19', NULL, NULL, 100180.00, 120, 555.00, '2002-10-26', '2002-10-26', 1),
(107, 88, 7, 8, 35000.00, 8720.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2013-06-27', NULL, NULL, NULL, NULL, 42151.50, 48, 730.00, '2013-06-27', '2013-06-27', 1),
(108, 89, 7, 8, 35000.00, 13830.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2014-02-06', NULL, NULL, NULL, NULL, 42147.10, 48, 730.00, '2014-02-06', '2014-02-06', 1),
(110, 95, 7, 8, 35000.00, 32810.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2016-04-05', NULL, NULL, NULL, NULL, 42146.90, 48, 730.00, '2016-04-05', '2016-04-05', 1),
(111, 96, 7, 8, 35000.00, 32810.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2016-04-05', NULL, NULL, NULL, NULL, 42146.90, 48, 730.00, '2016-04-05', '2016-04-05', 1),
(112, 191, 7, 4, 97560.00, 1626.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 48780.00, '2003-09-17', 48780.00, '2003-10-11', NULL, NULL, 146748.00, 120, 813.00, '2003-09-17', '2003-09-17', 1),
(113, 105, 7, 8, 35000.00, 16750.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2014-02-06', NULL, NULL, NULL, NULL, 42147.10, 48, 730.00, '2014-02-06', '2014-02-06', 1),
(114, 198, 7, 4, 120000.00, 84000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2012-01-30', 60000.00, '2012-02-09', NULL, NULL, 180502.00, 120, 1000.00, '2012-01-30', '2012-01-30', 1),
(115, 106, 7, 8, 35000.00, 6530.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2009-01-07', NULL, NULL, NULL, NULL, 42147.30, 48, 730.00, '2009-01-07', '2009-01-07', 1),
(116, 204, 7, 7, 60000.00, 20267.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2008-06-30', NULL, '1969-12-31', NULL, NULL, 75253.70, 60, 1000.00, '2008-06-30', '2008-06-30', 1),
(117, 206, 7, 4, 120000.00, 38000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2007-06-25', 60000.00, '2008-02-12', NULL, NULL, 180502.00, 120, 1000.00, '2007-06-25', '2007-06-25', 1),
(118, 108, 7, 8, 35000.00, 12370.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2013-06-27', NULL, NULL, NULL, NULL, 42151.50, 48, 730.00, '2013-06-27', '2013-06-27', 1),
(119, 110, 7, 8, 35000.00, 4195.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2011-03-29', NULL, NULL, NULL, NULL, 42151.90, 48, 730.00, '2011-03-29', '2011-03-29', 1),
(120, 208, 7, 7, 60000.00, 19000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '1970-01-01', NULL, '1969-12-31', NULL, NULL, 75250.00, 60, 1000.00, '2012-06-28', '2012-06-28', 1),
(121, 111, 7, 8, 35000.00, 4340.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2012-06-28', NULL, NULL, NULL, NULL, 42151.70, 48, 730.00, '2012-06-28', '2012-06-28', 1),
(122, 210, 7, 4, 80280.00, 47814.88, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 40140.00, '2003-09-20', 40140.00, '2003-10-15', NULL, NULL, 120756.00, 120, 669.00, '2003-09-20', '2003-09-20', 1),
(123, 118, 7, 8, 35000.00, 16750.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2014-02-06', NULL, NULL, NULL, NULL, 42147.10, 48, 730.00, '2014-02-06', '2014-02-06', 1),
(124, 122, 7, 8, 35000.00, 2150.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2012-02-07', NULL, NULL, NULL, NULL, 42147.30, 48, 730.00, '2012-02-07', '2012-02-07', 1),
(125, 127, 7, 8, 35000.00, 2150.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2012-06-28', NULL, NULL, NULL, NULL, 42151.70, 48, 730.00, '2012-06-28', '2012-06-28', 1),
(126, 131, 7, 8, 35000.00, 8720.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2013-01-14', NULL, NULL, NULL, NULL, 42148.80, 48, 730.00, '2013-01-14', '2006-07-19', 1),
(127, 134, 7, 8, 35000.00, 12370.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2013-06-27', NULL, NULL, NULL, NULL, 42151.50, 48, 730.00, '2013-06-27', '2013-06-27', 1),
(128, 136, 7, 8, 35000.00, 25510.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2015-03-31', NULL, NULL, NULL, NULL, 42152.30, 48, 730.00, '2015-03-31', '2015-03-31', 1),
(129, 137, 7, 8, 35000.00, 340.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2011-03-29', NULL, NULL, NULL, NULL, 42151.90, 48, 730.00, '2011-03-29', '2011-03-29', 0),
(130, 141, 7, 8, 35000.00, 24780.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2015-03-31', NULL, NULL, NULL, NULL, 42152.30, 48, 730.00, '2015-03-31', '2015-03-31', 1),
(131, 172, 7, 8, 35000.00, 5070.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2012-06-28', NULL, NULL, NULL, NULL, 42151.70, 48, 730.00, '2012-06-28', '2012-06-28', 1),
(132, 175, 7, 8, 35000.00, 25510.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2015-03-31', NULL, NULL, NULL, NULL, 42152.30, 48, 730.00, '2015-03-31', '2015-03-31', 1),
(133, 183, 7, 8, 35000.00, 4195.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2011-03-29', NULL, NULL, NULL, NULL, 42151.90, 48, 730.00, '2011-03-29', '2011-03-29', 1),
(134, 186, 7, 8, 35000.00, 16750.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2014-02-06', NULL, NULL, NULL, NULL, 42147.10, 48, 730.00, '2014-02-06', '2014-02-06', 1),
(135, 10, 7, 5, 50000.00, 46000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 50000.00, '2016-04-05', NULL, NULL, NULL, NULL, 60625.70, 50, 1000.00, '2016-04-05', '2016-04-05', 1),
(136, 185, 7, 8, 35000.00, 16750.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2014-02-06', NULL, NULL, NULL, NULL, 42147.10, 48, 730.00, '2014-02-06', '2014-02-06', 1),
(137, 20, 7, 5, 50000.00, 29000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 50000.00, '2014-10-02', NULL, NULL, NULL, NULL, 60625.30, 50, 1000.00, '2014-10-02', '2014-10-02', 1),
(138, 22, 7, 5, 50000.00, 46000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 50000.00, '2016-04-05', NULL, NULL, NULL, NULL, 60625.70, 50, 1000.00, '2016-04-05', '2016-04-05', 1),
(139, 23, 7, 5, 50000.00, 13000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 50000.00, '2013-06-27', NULL, NULL, NULL, NULL, 60628.90, 50, 1000.00, '2013-06-27', '2013-06-27', 1),
(140, 182, 7, 8, 35000.00, 21860.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2014-09-23', NULL, NULL, NULL, NULL, 42150.60, 48, 730.00, '2014-09-23', '2014-09-23', 1),
(141, 29, 7, 5, 50000.00, 3000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 50000.00, '2011-09-12', NULL, NULL, NULL, NULL, 60626.80, 50, 1000.00, '2011-09-12', '2011-09-12', 1),
(142, 30, 7, 5, 50000.00, 7000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 50000.00, '2013-01-24', NULL, NULL, NULL, NULL, 60628.50, 50, 1000.00, '2013-01-24', '2013-01-24', 1),
(143, 193, 7, 8, 35000.00, 5070.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2012-06-28', NULL, NULL, NULL, NULL, 42151.70, 48, 730.00, '2012-06-28', '2012-06-28', 1),
(144, 194, 7, 8, 35000.00, 14560.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2013-06-27', NULL, NULL, NULL, NULL, 42151.50, 48, 730.00, '2013-06-27', '2013-06-27', 1),
(145, 198, 7, 8, 35000.00, 16750.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2014-02-06', NULL, NULL, NULL, NULL, 42147.10, 48, 730.00, '2014-02-06', '2014-02-06', 1),
(146, 199, 7, 8, 35000.00, 14560.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2013-06-27', NULL, NULL, NULL, NULL, 42151.50, 48, 730.00, '2013-06-27', '2013-06-27', 1),
(147, 200, 7, 8, 35000.00, 8720.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2013-01-14', NULL, NULL, NULL, NULL, 42148.80, 48, 730.00, '2013-01-14', '2013-01-14', 1),
(148, 201, 7, 8, 35000.00, 16750.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2014-02-06', NULL, NULL, NULL, NULL, 42147.10, 48, 730.00, '2014-02-06', '2014-02-06', 1),
(149, 203, 7, 8, 35000.00, 12370.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2013-06-27', NULL, NULL, NULL, NULL, 42151.50, 48, 730.00, '2013-06-27', '2013-06-27', 1),
(150, 205, 7, 8, 35000.00, 32810.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2016-04-05', NULL, NULL, NULL, NULL, 42146.90, 48, 730.00, '2016-04-05', '2016-04-05', 1),
(151, 206, 7, 8, 35000.00, 0.00, 10791.67, 10021.67, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2011-09-11', NULL, NULL, NULL, NULL, 42148.10, 48, 730.00, '2011-09-11', '2011-09-11', 1),
(152, 212, 7, 8, 35000.00, 16750.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2014-02-06', NULL, NULL, NULL, NULL, 42147.10, 48, 730.00, '2014-02-06', '2014-02-06', 1),
(153, 213, 7, 8, 35000.00, 0.00, 10791.67, 10021.67, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2011-09-08', NULL, NULL, NULL, NULL, 42147.50, 48, 730.00, '2011-09-08', '2011-09-08', 1),
(154, 5, 8, 6, 200000.00, 133328.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 41667.00, '2013-04-10', NULL, '1969-12-31', NULL, NULL, 253084.00, 48, 4167.00, '2013-04-10', '2013-04-10', 1),
(155, 10, 8, 6, 196000.00, 151076.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 4084.00, '2015-10-19', NULL, '1969-12-31', NULL, NULL, 248022.00, 48, 4084.00, '2015-10-19', '2015-10-19', 1),
(156, 144, 8, 6, 86000.00, 75250.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 86000.00, '2013-03-06', NULL, '1969-12-31', NULL, NULL, 105100.00, 40, 2150.00, '2013-03-06', '2013-03-06', 1),
(157, 145, 8, 6, 183000.00, 137244.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 183000.00, '2015-01-06', NULL, '1969-12-31', NULL, NULL, 158574.00, 48, 3813.00, '2015-01-06', '2015-01-06', 1),
(158, 160, 8, 6, 205200.00, 196992.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 205200.00, '2016-06-19', NULL, '1969-12-31', NULL, NULL, 261887.00, 50, 4104.00, '2016-06-19', '2016-06-19', 1),
(159, 180, 8, 6, 91000.00, 36845.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 91000.00, '2015-10-19', NULL, '1969-12-31', NULL, NULL, 99873.60, 17, 5515.00, '2015-10-19', '2015-10-19', 1),
(160, 186, 8, 6, 138965.31, 121589.31, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 138965.31, '2016-01-20', NULL, '1969-12-31', NULL, NULL, 175849.00, 48, 2896.00, '2016-01-20', '2016-01-20', 1),
(161, 188, 8, 6, 143940.00, 138182.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 143940.00, '2016-06-19', NULL, '1969-12-31', NULL, NULL, 183704.00, 50, 2879.00, '2016-06-19', '2016-06-19', 1),
(162, 191, 8, 6, 60000.00, 52500.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2015-10-19', NULL, '1969-12-31', NULL, NULL, 75926.80, 48, 1250.00, '2015-10-19', '2015-10-19', 1),
(163, 198, 8, 6, 71817.00, 68943.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 71817.00, '2016-06-19', NULL, '1969-12-31', NULL, NULL, 91657.90, 50, 1437.00, '2016-06-19', '2016-06-19', 1),
(164, 203, 8, 6, 30000.00, 23250.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 30000.00, '2015-10-06', NULL, '1969-12-31', NULL, NULL, 36663.60, 40, 750.00, '2015-10-06', '2015-10-06', 1),
(165, 204, 8, 6, 106200.00, 74340.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 106200.00, '2013-12-26', NULL, '1969-12-31', NULL, NULL, 129787.00, 40, 2655.00, '2013-12-26', '2013-12-26', 1),
(166, 12, 8, 6, 170000.00, 131038.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 170000.00, '2015-10-19', NULL, '1969-12-31', NULL, NULL, 215121.00, 48, 3542.00, '2015-10-19', '2015-10-19', 1),
(167, 205, 8, 6, 40000.00, 32494.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 40000.00, '2015-10-23', NULL, '1969-12-31', NULL, NULL, 50619.90, 48, 834.00, '2015-10-23', '2015-10-23', 1),
(169, 214, 8, 6, 108745.00, 70223.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 108745.00, '2013-07-19', NULL, '1969-12-31', NULL, NULL, 158879.00, 48, 2266.00, '2013-07-19', '2013-07-19', 1),
(178, 35, 7, 4, 120000.00, 84000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2012-02-02', 60000.00, '2012-03-25', NULL, NULL, 98717.20, 120, 1000.00, '2012-02-02', '2012-02-02', 1),
(180, 37, 8, 6, 188697.00, 180833.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 188697.00, '2016-04-28', NULL, '1969-12-31', NULL, NULL, 238781.00, 48, 3932.00, '2016-04-28', '2016-04-28', 1),
(186, 43, 8, 6, 55000.00, 41300.00, 4170.83, 2795.83, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 55000.00, '2015-09-02', NULL, '1969-12-31', NULL, NULL, 67214.80, 40, 1375.00, '2015-09-02', '2015-09-02', 1),
(188, 155, 8, 6, 126299.00, 99979.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 126299.00, '2015-07-20', NULL, '1969-12-31', NULL, NULL, 159822.00, 48, 2632.00, '2015-07-20', '2015-07-20', 1),
(189, 189, 8, 6, 197000.00, 147740.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 197000.00, '2015-04-23', NULL, '1969-12-31', NULL, NULL, 249288.00, 48, 4105.00, '2015-04-23', '2015-04-23', 1),
(190, 161, 8, 6, 190000.00, 150420.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 190000.00, '2015-10-19', NULL, '1969-12-31', NULL, NULL, 240430.00, 48, 3958.00, '2015-10-19', '2015-10-19', 1),
(191, 166, 8, 6, 54000.00, 37800.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 54000.00, '2015-02-10', NULL, '1969-12-31', NULL, NULL, 65993.50, 40, 1350.00, '2015-02-10', '2015-02-10', 1),
(192, 178, 8, 6, 163000.00, 122248.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 163000.00, '2015-01-06', NULL, '1969-12-31', NULL, NULL, 206263.00, 48, 3396.00, '2015-01-06', '2015-01-06', 1),
(193, 179, 8, 6, 124000.00, 92992.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 124000.00, '2015-05-10', NULL, '1969-12-31', NULL, NULL, 156912.00, 48, 2584.00, '2015-05-10', '2015-05-10', 1),
(194, 183, 8, 6, 87000.00, 60900.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 87000.00, '2015-02-15', NULL, '1969-12-31', NULL, NULL, 106322.00, 40, 2175.00, '2015-02-15', '2015-02-15', 1),
(195, 185, 8, 6, 43753.00, 31453.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 43753.00, '2015-03-04', NULL, '1969-12-31', NULL, NULL, 54181.30, 43, 1025.00, '2015-03-04', '2015-03-04', 1),
(196, 187, 8, 6, 163039.00, 122275.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 163039.00, '2013-10-02', NULL, '1969-12-31', NULL, NULL, 206312.00, 48, 3397.00, '2013-10-02', '2013-10-02', 1),
(207, 153, 7, 4, 120000.00, 104000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2014-03-23', 60000.00, '0000-00-00', NULL, NULL, 0.00, 120, 1000.00, '2014-03-23', '2014-03-23', 1),
(208, 155, 7, 7, 60000.00, 46000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2015-03-11', NULL, NULL, NULL, NULL, 0.00, 60, 1000.00, '2015-03-11', '2015-03-11', 1),
(210, 182, 7, 7, 60000.00, 6000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2011-03-28', NULL, NULL, NULL, NULL, 0.00, 60, 1000.00, '2011-03-28', '2011-03-28', 1),
(211, 189, 7, 4, 81780.00, 10342.07, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 40890.00, '2001-07-31', 3.00, '0000-00-00', NULL, NULL, 0.00, 82, 1000.00, '2001-07-31', '2001-07-31', 1),
(212, 52, 7, 4, 66960.00, 28384.02, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 33480.00, '2000-10-01', 33480.00, '0000-00-00', NULL, NULL, 0.00, 120, 558.00, '2000-10-01', '2000-10-01', 1),
(213, 71, 7, 4, 71280.00, 38602.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35640.00, '2002-07-16', 35640.00, '0000-00-00', NULL, NULL, 0.00, 120, 594.00, '2002-07-16', '2002-07-16', 1),
(214, 75, 7, 4, 74520.00, 29214.71, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 37260.00, '2001-09-11', 37260.00, '0000-00-00', NULL, NULL, 0.00, 120, 621.00, '2001-09-11', '2001-09-11', 1),
(215, 75, 7, 7, 60000.00, 19000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2012-06-28', NULL, NULL, NULL, NULL, 0.00, 60, 1000.00, '2012-06-28', '2012-06-28', 1),
(217, 20, 8, 6, 292185.60, 229929.60, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 292185.60, '2008-03-15', NULL, '1969-12-31', NULL, NULL, 0.00, 56, 5188.00, '2015-09-09', '2015-09-09', 1),
(219, 23, 8, 6, 60000.00, 36000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2014-09-16', NULL, '1969-12-31', NULL, NULL, 0.00, 40, 1500.00, '2014-09-16', '2014-09-16', 1),
(220, 24, 8, 6, 347000.00, 253010.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 347000.00, '2015-08-09', NULL, '1969-12-31', NULL, NULL, 0.00, 48, 7230.00, '2015-08-09', '2015-08-09', 1),
(221, 25, 8, 6, 294509.00, 276836.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 294509.00, '2016-06-19', NULL, '1969-12-31', NULL, NULL, 0.00, 50, 5891.00, '2016-06-19', '2016-06-19', 1),
(222, 26, 8, 6, 100000.00, 60000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 100000.00, '2015-01-06', NULL, '1969-12-31', NULL, NULL, 0.00, 40, 2500.00, '2015-01-06', '2015-01-06', 1),
(223, 29, 8, 6, 165000.00, 109992.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 165000.00, '2013-07-18', NULL, '1969-12-31', NULL, NULL, 0.00, 48, 3438.00, '2013-07-18', '2013-07-18', 1),
(224, 32, 8, 6, 241000.00, 165625.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 241000.00, '2015-01-06', NULL, '1969-12-31', NULL, NULL, 0.00, 48, 5025.00, '2015-01-06', '2015-01-06', 1),
(225, 35, 8, 6, 81978.00, 64898.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 81978.00, '2015-10-23', NULL, '1969-12-31', NULL, NULL, 0.00, 48, 1708.00, '2015-10-23', '2015-10-23', 1),
(228, 38, 8, 6, 69000.00, 50592.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 69000.00, '2015-02-22', NULL, NULL, NULL, NULL, 0.00, 45, 1534.00, '2015-02-22', '2015-02-22', 1),
(229, 40, 8, 6, 130999.00, 98239.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 130999.00, '2013-07-29', NULL, NULL, NULL, NULL, 0.00, 48, 2730.00, '2013-07-29', '2013-07-29', 1),
(230, 41, 8, 6, 125256.00, 93936.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 125256.00, '2013-07-29', NULL, NULL, NULL, NULL, 0.00, 48, 2610.00, '2013-07-29', '2013-07-29', 1),
(231, 42, 8, 6, 113220.00, 83028.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 113220.00, '2014-01-13', NULL, NULL, NULL, NULL, 0.00, 45, 2516.00, '2014-01-13', '2014-01-13', 1),
(234, 48, 8, 6, 106000.00, 83910.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 106000.00, '2015-09-02', NULL, NULL, NULL, NULL, 0.00, 48, 2209.00, '2015-09-02', '2015-09-02', 1),
(235, 49, 8, 6, 68000.00, 50996.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 68000.00, '2015-03-04', NULL, NULL, NULL, NULL, 0.00, 48, 1417.00, '2015-03-04', '2015-03-04', 1),
(236, 57, 8, 6, 135000.00, 101244.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 135000.00, '2015-04-23', NULL, NULL, NULL, NULL, 0.00, 48, 2813.00, '2015-04-23', '2015-04-23', 1),
(237, 58, 8, 6, 57401.00, 46637.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 57401.00, '2015-10-23', NULL, NULL, NULL, NULL, 0.00, 48, 1196.00, '2015-10-23', '2015-10-23', 1),
(238, 60, 8, 6, 18480.00, 12936.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 18480.00, '2013-09-22', NULL, NULL, NULL, NULL, 0.00, 40, 462.00, '2013-09-22', '2013-09-22', 1),
(239, 61, 8, 6, 150000.00, 112500.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 150000.00, '2015-01-06', NULL, NULL, NULL, NULL, 0.00, 48, 3125.00, '2015-01-06', '2015-01-06', 1),
(241, 64, 8, 6, 49000.00, 34300.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 49000.00, '2015-08-01', NULL, NULL, NULL, NULL, 0.00, 40, 1225.00, '2015-08-01', '2015-08-01', 1),
(242, 68, 8, 6, 175969.00, 131965.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 175969.00, '2015-01-06', NULL, NULL, NULL, NULL, 0.00, 48, 3667.00, '2015-01-06', '2015-01-06', 1),
(243, 70, 8, 6, 86880.00, 60780.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 86880.00, '2014-02-18', NULL, NULL, NULL, NULL, 0.00, 40, 2175.00, '2014-02-18', '2014-02-18', 1),
(244, 73, 8, 6, 62488.00, 50770.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 62488.00, '2015-10-06', NULL, NULL, NULL, NULL, 0.00, 48, 1302.00, '2015-10-06', '2015-10-06', 1),
(245, 78, 8, 6, 93324.00, 69984.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 93324.00, '2014-08-05', NULL, NULL, NULL, NULL, 0.00, 48, 1945.00, '2014-08-05', '2014-08-05', 1),
(246, 80, 8, 6, 120000.00, 90000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 120000.00, '2013-09-23', NULL, NULL, NULL, NULL, 0.00, 48, 2500.00, '2013-09-23', '2013-09-23', 1),
(247, 83, 8, 6, 121000.00, 18747.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 121000.00, '2013-08-25', NULL, NULL, NULL, NULL, 0.00, 33, 3646.00, '2013-08-25', '2013-08-25', 1),
(248, 85, 8, 6, 104687.59, 74315.59, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 104687.59, '2013-08-25', NULL, NULL, NULL, NULL, 0.00, 48, 2181.00, '2013-08-25', '2013-08-25', 1),
(249, 86, 8, 6, 115324.00, 86488.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 115324.00, '2014-10-09', NULL, NULL, NULL, NULL, 0.00, 48, 2403.00, '2014-10-09', '2014-10-09', 1),
(250, 88, 8, 6, 126000.00, 85050.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 126000.00, '2015-02-10', NULL, NULL, NULL, NULL, 0.00, 40, 3150.00, '2015-02-10', '2015-02-10', 1),
(251, 93, 8, 6, 173898.31, 152160.31, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 173898.31, '2016-01-20', NULL, NULL, NULL, NULL, 0.00, 48, 3623.00, '2016-01-20', '2016-01-20', 1),
(252, 94, 8, 6, 138338.31, 103742.31, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 138338.31, '2014-07-22', NULL, NULL, NULL, NULL, 0.00, 48, 2883.00, '2014-07-22', '2014-07-22', 1),
(253, 215, 8, 6, 88606.31, 62025.99, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 88606.31, '2011-12-22', NULL, NULL, NULL, NULL, 0.00, 40, 2215.16, '2011-12-22', '2011-12-22', 1),
(254, 100, 8, 6, 86880.00, 54300.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 86880.00, '2014-04-06', NULL, NULL, NULL, NULL, 0.00, 40, 2172.00, '2014-04-06', '2014-04-06', 1),
(255, 104, 8, 6, 118260.00, 93620.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 118260.00, '2015-09-02', NULL, NULL, NULL, NULL, 0.00, 48, 2464.00, '2015-09-02', '2015-09-02', 1),
(256, 111, 8, 6, 65000.00, 56875.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 65000.00, '2016-03-06', NULL, NULL, NULL, NULL, 0.00, 40, 1625.00, '2016-03-06', '2016-03-06', 1),
(257, 115, 8, 6, 157600.00, 114988.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 157600.00, '2013-07-29', NULL, '1969-12-31', NULL, NULL, 0.00, 24, 3244.00, '1969-12-31', '2013-07-29', 1),
(258, 119, 8, 6, 200000.00, 162497.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 200000.00, '2015-10-19', NULL, NULL, NULL, NULL, 0.00, 48, 4167.00, '2015-10-19', '2015-10-19', 1),
(259, 122, 8, 6, 100000.00, 81244.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 100000.00, '2015-10-05', NULL, '1969-12-31', NULL, NULL, 0.00, 48, 2084.00, '2015-10-05', '2015-10-05', 1),
(260, 126, 8, 6, 192734.00, 140526.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 192734.00, '2015-06-10', NULL, NULL, NULL, NULL, 0.00, 48, 4016.00, '2015-06-10', '2015-06-10', 1),
(261, 128, 8, 6, 118162.00, 86110.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 118162.00, '2013-07-16', NULL, NULL, NULL, NULL, 0.00, 45, 2671.00, '2013-07-16', '2013-07-16', 1),
(262, 134, 8, 6, 62830.00, 60316.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 62830.00, '2016-06-19', NULL, '1969-12-31', NULL, NULL, 0.00, 50, 1257.00, '2016-06-19', '2016-06-19', 1),
(263, 135, 8, 6, 118000.00, 88504.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 118000.00, '2015-01-06', NULL, NULL, NULL, NULL, 0.00, 48, 2458.00, '2015-01-06', '2015-01-06', 1),
(264, 138, 8, 6, 79000.00, 25044.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 79000.00, '2015-01-06', NULL, NULL, NULL, NULL, 0.00, 20, 3854.00, '2015-01-06', '2015-01-06', 1),
(265, 140, 8, 6, 93886.00, 80364.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 93886.00, '2016-04-28', NULL, '1969-12-31', NULL, NULL, 0.00, 24, 3878.00, '2016-04-28', '2016-04-28', 1),
(266, 148, 8, 6, 107700.00, 0.00, 718.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 107700.00, '2009-12-10', NULL, NULL, NULL, NULL, 0.00, 50, 2154.00, '2009-12-10', '2009-12-10', 0),
(267, 151, 8, 6, 76436.18, 56048.18, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 76436.18, '2014-05-20', NULL, '1969-12-31', NULL, NULL, 0.00, 45, 1699.00, '2014-05-20', '2014-05-20', 1),
(268, 195, 8, 6, 79404.00, 66164.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 79404.00, '2015-10-23', NULL, NULL, NULL, NULL, 0.00, 48, 1655.00, '2015-10-23', '2015-10-23', 1),
(269, 196, 8, 6, 69515.00, 46544.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 69515.00, '2015-10-06', NULL, NULL, NULL, NULL, 0.00, 48, 1449.00, '2015-10-06', '2015-10-06', 1),
(270, 197, 8, 6, 35000.00, 32810.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2013-06-14', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2013-06-14', '2013-06-14', 1),
(271, 201, 8, 6, 19665.00, 11793.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 19665.00, '2015-01-06', NULL, NULL, NULL, NULL, 0.00, 30, 656.00, '2015-01-06', '2015-01-06', 1),
(272, 208, 8, 6, 152905.00, 114673.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 152905.00, '2014-09-16', NULL, NULL, NULL, NULL, 0.00, 48, 3186.00, '2014-09-16', '2014-09-16', 1),
(273, 209, 8, 6, 92580.00, 55548.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 92580.00, '2013-12-24', NULL, NULL, NULL, NULL, 0.00, 30, 3086.00, '2013-12-24', '2013-12-24', 1),
(274, 210, 8, 6, 136961.56, 100961.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 136961.00, '2013-08-01', NULL, '1969-12-31', NULL, NULL, 0.00, 45, 3000.00, '2013-08-01', '2013-08-01', 1);
INSERT INTO `employee_loans` (`id`, `employee_id`, `loan_type_id`, `loan_id`, `loan_amount`, `current_due`, `interest_amount`, `interest_amount_due`, `first_adjustment_employee_loan_id`, `first_adjustment_current_due`, `first_adjustment_interest_amount_due`, `first_adjustment_interest_applied_amount`, `first_adjustment_applied_interest`, `second_adjustment_employee_loan_id`, `second_adjustment_current_due`, `second_adjustment_interest_amount_due`, `second_adjustment_interest_applied_amount`, `second_adjustment_applied_interest`, `recovery_start_month_id`, `recovery_year_id`, `first_installment_amount`, `first_installment_date`, `second_installment_amount`, `second_installment_date`, `third_installment_amount`, `third_installment_date`, `total_payable`, `number_of_installment`, `installment_amount`, `loan_apply_date`, `loan_approved_date`, `status`) VALUES
(275, 22, 8, 6, 366459.26, 313014.26, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 366459.26, '2015-11-22', NULL, '1969-12-31', NULL, NULL, 0.00, 48, 7635.00, '2015-11-22', '2015-11-22', 1),
(276, 43, 7, 8, 35000.00, 21860.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2007-06-17', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2007-06-17', '2007-06-17', 1),
(277, 130, 7, 8, 35000.00, 16750.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2014-02-06', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2014-02-06', '2014-02-06', 1),
(278, 144, 7, 8, 35000.00, 0.00, 17354.17, 16584.17, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2007-12-06', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2007-12-06', '2007-12-06', 1),
(279, 214, 7, 8, 35000.00, 0.00, 10791.67, 10021.67, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 35000.00, '2011-09-08', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2011-09-08', '2011-09-08', 1),
(280, 114, 7, 4, 120000.00, 32260.17, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2001-07-31', 60000.00, '0000-00-00', NULL, NULL, 0.00, 120, 1000.00, '2001-07-31', '2001-07-31', 1),
(282, 47, 8, 6, 110000.00, 82452.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 110000.00, '2015-10-19', NULL, NULL, NULL, NULL, 0.00, 48, 2292.00, '2015-10-19', '2015-10-19', 1),
(283, 56, 8, 6, 102000.00, 76500.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 102000.00, '2015-01-10', NULL, NULL, NULL, NULL, 0.00, 48, 2125.00, '2015-01-10', '2015-01-10', 1),
(284, 63, 8, 6, 86880.00, 65130.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 86880.00, '2015-02-18', NULL, NULL, NULL, NULL, 0.00, 40, 2175.00, '2015-02-18', '2015-02-18', 1),
(285, 143, 8, 6, 214884.32, 167132.22, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 214884.32, '2014-05-20', NULL, NULL, NULL, NULL, 0.00, 48, 4775.21, '2014-05-20', '2014-05-20', 1),
(286, 139, 8, 6, 120000.00, 95000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 120000.00, '2013-09-22', NULL, NULL, NULL, NULL, 0.00, 48, 2500.00, '2013-09-22', '2013-09-22', 1),
(287, 139, 8, 6, 115735.00, 108411.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 115735.00, '2016-04-28', NULL, '1969-12-31', NULL, NULL, 0.00, 48, 2412.00, '2016-04-28', '2016-04-28', 1),
(289, 141, 8, 6, 107091.00, 102627.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 107091.00, '2016-04-28', NULL, '1969-12-31', NULL, NULL, 0.00, 48, 2232.00, '2016-04-28', '2016-04-28', 1),
(290, 199, 8, 6, 18870.00, 8217.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 18870.00, '2013-06-23', NULL, NULL, NULL, NULL, 0.00, 30, 629.00, '2013-06-23', '2013-06-23', 1),
(291, 63, 8, 6, 131547.00, 118974.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 131547.00, '2016-04-28', NULL, NULL, NULL, NULL, 0.00, 48, 2741.00, '2016-04-28', '2016-04-28', 1),
(292, 36, 8, 6, 201455.00, 117515.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 201455.00, '2014-08-05', NULL, NULL, NULL, NULL, 0.00, 48, 4197.00, '2014-08-05', '2014-08-05', 1),
(293, 36, 8, 6, 88000.00, 71503.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 88000.00, '2015-10-19', NULL, NULL, NULL, NULL, 0.00, 48, 1833.00, '2015-10-19', '2015-10-19', 1),
(294, 54, 8, 6, 98000.00, 30614.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 98000.00, '2013-04-10', NULL, NULL, NULL, NULL, 0.00, 48, 2042.00, '2013-04-10', '2013-04-10', 1),
(295, 54, 8, 6, 76000.00, 50658.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 76000.00, '2014-01-06', NULL, '1969-12-31', NULL, NULL, 0.00, 48, 1583.00, '2014-01-06', '2014-01-06', 1),
(296, 54, 8, 6, 48947.00, 39767.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 48947.00, '2015-10-19', NULL, NULL, NULL, NULL, 0.00, 48, 1020.00, '2015-10-19', '2015-10-19', 1),
(297, 81, 8, 6, 50000.00, 48000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 50000.00, '2016-06-19', NULL, '1969-12-31', NULL, NULL, 0.00, 50, 1000.00, '2016-06-19', '2016-06-19', 1),
(298, 87, 8, 6, 88613.51, 29509.51, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 88613.00, '2013-05-14', NULL, NULL, NULL, NULL, 0.00, 48, 1847.00, '2013-05-14', '2013-05-14', 1),
(299, 87, 8, 6, 63000.00, 37800.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 63000.00, '2015-02-10', NULL, NULL, NULL, NULL, 0.00, 40, 1575.00, '2015-02-10', '2015-02-10', 1),
(300, 99, 8, 6, 113000.00, 75320.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 113000.00, '2015-01-06', NULL, NULL, NULL, NULL, 0.00, 48, 2355.00, '2015-01-06', '2015-01-06', 1),
(301, 102, 8, 6, 57000.00, 15000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 57000.00, '2010-02-28', NULL, NULL, NULL, NULL, 0.00, 50, 1000.00, '2010-02-28', '2010-02-28', 1),
(302, 109, 8, 6, 38000.00, 37240.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 3, 2, 38000.00, '2016-09-06', NULL, '1969-12-31', NULL, NULL, 0.00, 50, 760.00, '2016-09-06', '2016-09-06', 1),
(303, 109, 8, 6, 40000.00, 25000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 40000.00, '2015-02-10', NULL, '1969-12-31', NULL, NULL, 0.00, 40, 1000.00, '2015-02-10', '2015-02-10', 1),
(304, 112, 8, 6, 85434.00, 49834.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 85434.00, '2014-09-16', NULL, '1969-12-31', NULL, NULL, 0.00, 48, 1780.00, '2014-09-16', '2014-09-16', 1),
(305, 82, 8, 6, 110000.00, 34388.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 110000.00, '2013-04-21', NULL, NULL, NULL, NULL, 0.00, 48, 2292.00, '2013-04-21', '2013-04-21', 1),
(306, 29, 7, 5, 50000.00, 50000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 12, 3, 50000.00, '2017-05-08', NULL, '1969-12-31', NULL, NULL, 0.00, 50, 1000.00, '2017-05-08', '2017-05-08', 1),
(307, 103, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 12, 3, 35000.00, '2017-05-02', NULL, '1969-12-31', NULL, NULL, 0.00, 48, 730.00, '2017-05-02', '2017-05-02', 1),
(308, 190, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 12, 3, 35000.00, '2017-05-02', NULL, '1969-12-31', NULL, NULL, 0.00, 48, 730.00, '2017-05-02', '2017-05-02', 1),
(309, 130, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 12, 3, 35000.00, '2017-05-02', NULL, '1969-12-31', NULL, NULL, 0.00, 48, 730.00, '2017-05-02', '2017-05-02', 1),
(311, 115, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 7, 3, 35000.00, '2016-12-20', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2016-12-20', '2016-12-20', 1),
(312, 27, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 7, 3, 35000.00, '2016-12-20', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2016-12-20', '2016-12-20', 1),
(313, 40, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 7, 3, 35000.00, '2016-12-20', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2016-12-20', '2016-12-20', 1),
(314, 35, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 7, 3, 35000.00, '2016-12-20', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2016-12-20', '2016-12-20', 1),
(315, 109, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 7, 3, 35000.00, '2016-12-20', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2016-12-20', '2016-12-20', 1),
(316, 197, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 7, 3, 35000.00, '2016-12-20', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2016-12-20', '2016-12-20', 1),
(317, 52, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 7, 3, 35000.00, '2016-12-20', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2016-12-20', '2016-12-20', 1),
(318, 57, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 7, 3, 35000.00, '2016-12-20', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2016-12-20', '2016-12-20', 1),
(319, 77, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 7, 3, 35000.00, '2016-12-20', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2016-12-20', '2016-12-20', 1),
(320, 86, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 7, 3, 35000.00, '2016-12-20', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2016-12-20', '2016-12-20', 1),
(321, 144, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 7, 3, 35000.00, '2016-11-10', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2016-11-10', '2016-11-10', 1),
(322, 181, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 7, 3, 35000.00, '2016-11-10', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2016-11-10', '2016-11-10', 1),
(323, 166, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 7, 3, 35000.00, '2016-11-10', NULL, NULL, NULL, NULL, 0.00, 49, 730.00, '2016-11-10', '2016-11-10', 1),
(324, 59, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 7, 3, 35000.00, '2016-11-10', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2016-11-10', '2016-11-10', 1),
(325, 53, 7, 8, 35000.00, 35000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 7, 3, 35000.00, '2016-11-10', NULL, NULL, NULL, NULL, 0.00, 48, 730.00, '2016-11-10', '2016-11-10', 1),
(326, 89, 7, 7, 60000.00, 60000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 3, 60000.00, '2016-11-10', NULL, NULL, NULL, NULL, 0.00, 60, 1000.00, '2016-11-10', '2016-11-10', 1),
(327, 148, 7, 7, 60000.00, 60000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 2, 3, 60000.00, '2016-11-10', NULL, NULL, NULL, NULL, 0.00, 60, 1000.00, '2016-11-10', '2016-11-10', 1),
(328, 112, 8, 6, 59000.00, 47930.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 59000.00, '2015-10-19', NULL, NULL, NULL, NULL, 0.00, 48, 1230.00, '2015-10-19', '2015-10-19', 1),
(329, 209, 7, 4, 64800.00, 18834.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 32400.00, '1999-10-28', 32400.00, '2000-01-20', 0.00, NULL, 0.00, 120, 540.00, '1999-10-28', '1999-10-28', 1),
(330, 104, 7, 7, 60000.00, 0.00, 22500.00, 21500.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 60000.00, '2010-06-29', 0.00, NULL, 0.00, NULL, 0.00, 60, 1000.00, '2010-06-29', '2010-06-29', 1),
(331, 81, 8, 6, 112318.00, 70855.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 1, 2, 112318.00, '2015-01-06', 0.00, NULL, 0.00, NULL, 0.00, 46, 2439.00, '2015-01-06', '2015-01-06', 1),
(332, 214, 8, 6, 122411.00, 119962.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 3, 2, 122411.00, '2016-08-01', 0.00, '0000-00-00', 0.00, NULL, 0.00, 50, 2449.00, '2016-08-01', '2016-08-01', 1),
(333, 101, 8, 6, 215545.00, 211234.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 3, 2, 215545.00, '2016-08-01', 0.00, '0000-00-00', 0.00, NULL, 0.00, 50, 4311.00, '2016-08-01', '2016-08-01', 1),
(334, 105, 8, 6, 76773.00, 75237.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 3, 2, 76773.00, '2016-08-01', 0.00, '0000-00-00', 0.00, NULL, 0.00, 50, 1536.00, '2016-08-01', '2016-08-01', 1),
(335, 145, 8, 6, 132698.00, 130044.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 3, 2, 132698.00, '2016-08-01', 0.00, '0000-00-00', 0.00, NULL, 0.00, 50, 2654.00, '2016-08-01', '2016-08-01', 1),
(336, 154, 8, 6, 150000.00, 147000.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 3, 2, 150000.00, '2016-09-06', 0.00, '0000-00-00', 0.00, NULL, 0.00, 50, 3000.00, '2016-09-06', '2016-09-06', 1),
(337, 166, 8, 6, 50619.00, 49606.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 3, 2, 50619.00, '2016-09-06', 0.00, '0000-00-00', 0.00, NULL, 0.00, 50, 1013.00, '2016-09-06', '2016-09-06', 1),
(338, 187, 8, 6, 356279.00, 349153.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 3, 2, 356279.00, '2016-08-01', 0.00, '0000-00-00', 0.00, NULL, 0.00, 50, 7126.00, '2016-08-01', '2016-08-01', 1),
(339, 192, 8, 6, 39150.00, 38171.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0.00, 0.00, 0.00, 3, 2, 39150.00, '2016-08-01', 0.00, '0000-00-00', 0.00, NULL, 0.00, 40, 979.00, '2016-08-01', '2016-08-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_loans_06_09`
--

CREATE TABLE `employee_loans_06_09` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `loan_type_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `loan_amount` float NOT NULL,
  `current_due` float(8,2) NOT NULL,
  `interest_amount` float(8,2) NOT NULL,
  `interest_amount_due` float(8,2) NOT NULL,
  `recovery_start_month_id` int(11) NOT NULL,
  `recovery_year_id` int(11) NOT NULL,
  `first_installment_amount` float NOT NULL,
  `first_installment_date` date NOT NULL,
  `second_installment_amount` float DEFAULT NULL,
  `second_installment_date` date DEFAULT NULL,
  `third_installment_amount` float DEFAULT NULL,
  `third_installment_date` date DEFAULT NULL,
  `total_payable` float NOT NULL,
  `number_of_installment` int(11) NOT NULL,
  `installment_amount` float NOT NULL,
  `loan_apply_date` date NOT NULL,
  `loan_approved_date` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_loans_06_09`
--

INSERT INTO `employee_loans_06_09` (`id`, `employee_id`, `loan_type_id`, `loan_id`, `loan_amount`, `current_due`, `interest_amount`, `interest_amount_due`, `recovery_start_month_id`, `recovery_year_id`, `first_installment_amount`, `first_installment_date`, `second_installment_amount`, `second_installment_date`, `third_installment_amount`, `third_installment_date`, `total_payable`, `number_of_installment`, `installment_amount`, `loan_apply_date`, `loan_approved_date`, `status`) VALUES
(3, 3, 7, 4, 120000, 4647.10, 0.00, 0.00, 7, 5, 60000, '2003-06-04', 60000, '2003-06-10', NULL, NULL, 180500, 120, 1000, '2003-06-04', '2003-06-04', 1),
(4, 4, 7, 4, 120000, 4976.49, 0.00, 0.00, 7, 5, 60000, '2003-01-27', 60000, '2003-02-04', NULL, NULL, 180502, 120, 1000, '2003-01-27', '2003-01-27', 1),
(5, 6, 7, 4, 120000, 34000.00, 0.00, 0.00, 7, 5, 60000, '2008-06-30', 60000, '2008-08-20', NULL, NULL, 180502, 120, 1000, '2008-06-30', '2008-06-30', 1),
(6, 24, 7, 4, 120000, 78000.00, 0.00, 0.00, 7, 5, 60000, '2012-02-01', 60000, '2012-02-13', NULL, NULL, 180500, 120, 1000, '2012-02-01', '2012-02-01', 1),
(7, 25, 7, 4, 120000, 28909.51, 0.00, 0.00, 7, 5, 60000, '2003-09-17', 60000, '2003-10-04', NULL, NULL, 180501, 120, 1000, '2003-09-17', '2003-09-17', 1),
(8, 26, 7, 4, 120000, 78000.00, 0.00, 0.00, 7, 5, 60000, '2012-03-15', 60000, '2012-05-30', NULL, NULL, 180501, 120, 1000, '2012-03-15', '2012-03-15', 1),
(9, 29, 7, 4, 120000, 102000.00, 0.00, 0.00, 1, 1, 60000, '2014-02-06', 60000, '2014-03-13', NULL, NULL, 180500, 120, 1000, '2014-02-06', '2014-02-06', 1),
(12, 34, 7, 4, 120000, 100000.00, 0.00, 0.00, 7, 5, 60000, '2012-02-06', 60000, '2013-12-17', NULL, NULL, 180500, 120, 1000, '2012-02-06', '2012-02-06', 1),
(13, 35, 7, 4, 120000, 84000.00, 0.00, 0.00, 7, 5, 60000, '2012-02-02', 60000, '2012-03-25', NULL, NULL, 180500, 120, 1000, '2012-02-02', '2012-02-02', 1),
(14, 36, 7, 4, 86940, 38050.33, 0.00, 0.00, 7, 5, 43470, '2001-02-12', 43470, '2001-07-16', NULL, NULL, 118819, 120, 724, '2001-02-12', '2001-02-12', 1),
(15, 40, 7, 4, 83160, 0.00, 0.00, 0.00, 7, 5, 41580, '2003-08-23', 41580, '2003-09-27', NULL, NULL, 125089, 120, 693, '2003-08-23', '2003-08-23', 1),
(16, 41, 7, 4, 90180, 24325.87, 0.00, 0.00, 7, 5, 45090, '2004-05-13', 45090, '2004-07-22', NULL, NULL, 135647, 120, 1000, '2004-05-13', '2004-05-13', 1),
(17, 46, 7, 4, 55800, 20684.67, 0.00, 0.00, 7, 5, 27900, '2001-12-24', 27900, '2002-01-10', NULL, NULL, 83935.7, 120, 465, '2001-12-24', '2001-12-24', 1),
(18, 47, 7, 4, 120000, 98000.00, 0.00, 0.00, 7, 5, 60000, '2013-10-27', 60000, '2013-11-24', NULL, NULL, 180502, 120, 1000, '2013-10-27', '2013-10-27', 1),
(19, 54, 7, 7, 60000, 42000.00, 0.00, 0.00, 7, 5, 60000, '2014-09-23', NULL, '1969-12-31', NULL, NULL, 90252.8, 60, 1000, '2014-09-23', '2014-09-23', 1),
(20, 56, 7, 4, 64800, 31496.00, 0.00, 0.00, 7, 5, 32400, '2022-12-27', 32400, '2001-10-31', NULL, NULL, 97472.5, 120, 540, '2022-12-27', '2001-07-22', 1),
(21, 57, 7, 4, 66600, 34635.00, 0.00, 0.00, 7, 5, 33300, '2002-01-10', 333000, '2002-05-05', NULL, NULL, 100179, 120, 555, '2002-01-10', '2002-01-10', 1),
(22, 61, 7, 7, 60000, 57000.00, 0.00, 0.00, 7, 5, 60000, '2016-04-05', NULL, '1969-12-31', NULL, NULL, 75250.6, 60, 1000, '2016-04-05', '2016-04-05', 1),
(23, 63, 7, 7, 60000, 24000.00, 0.00, 0.00, 7, 5, 60000, '2013-01-15', NULL, '1969-12-31', NULL, NULL, 75251.8, 60, 1000, '2013-01-15', '2013-01-15', 1),
(24, 64, 7, 4, 61200, 26481.50, 0.00, 0.00, 7, 5, 30600, '2000-01-25', 30600, '2000-12-17', NULL, NULL, 92058, 120, 510, '2000-01-25', '2000-01-25', 1),
(25, 65, 7, 4, 61200, 28055.00, 0.00, 0.00, 7, 5, 30600, '2001-01-01', 30600, '2001-04-30', NULL, NULL, 92055, 120, 510, '2001-01-01', '2001-01-01', 1),
(26, 68, 7, 7, 60000, 57000.00, 0.00, 0.00, 7, 5, 60000, '2016-04-05', NULL, '1969-12-31', NULL, NULL, 75250.6, 60, 1000, '2016-04-05', '2016-04-05', 1),
(27, 69, 7, 4, 120000, 7000.00, 0.00, 0.00, 7, 5, 60000, '1970-01-01', 60000, '2011-09-08', NULL, NULL, 180502, 120, 1000, '2008-06-30', '2008-06-30', 1),
(28, 69, 7, 7, 60000, 7000.00, 0.00, 0.00, 7, 5, 60000, '2011-09-08', NULL, '1969-12-31', NULL, NULL, 75251, 60, 1000, '2011-09-08', '2011-09-08', 1),
(29, 70, 7, 4, 71280, 38602.00, 0.00, 0.00, 7, 5, 35640, '2002-07-16', 35640, '2002-10-20', NULL, NULL, 107219, 120, 594, '2002-07-16', '2002-07-16', 1),
(30, 75, 7, 4, 74520, 29214.71, 0.00, 0.00, 7, 5, 37260, '2001-09-11', 37260, '2001-10-11', NULL, NULL, 112092, 120, 621, '2001-09-11', '2001-09-11', 1),
(31, 75, 7, 7, 60000, 19000.00, 0.00, 0.00, 7, 5, 60000, '2012-06-28', NULL, '1969-12-31', NULL, NULL, 75253.4, 60, 1000, '2012-06-28', '2012-06-28', 1),
(32, 77, 7, 7, 60000, 12000.00, 0.00, 0.00, 7, 5, 60000, '2011-09-11', NULL, '1969-12-31', NULL, NULL, 75251.3, 60, 1000, '2011-09-11', '2011-09-11', 1),
(33, 78, 7, 7, 60000, 14000.00, 0.00, 0.00, 7, 5, 60000, '2012-02-06', NULL, '1969-12-31', NULL, NULL, 75250.7, 60, 1000, '2012-02-06', '2012-02-06', 1),
(34, 80, 7, 4, 66960, 28376.33, 0.00, 0.00, 7, 5, 33480, '2000-10-02', 33480, '2000-12-17', NULL, NULL, 100719, 120, 558, '2000-10-02', '2000-10-02', 1),
(35, 81, 7, 4, 71280, 38602.00, 0.00, 0.00, 7, 5, 35640, '2002-07-16', 35640, '2002-10-19', NULL, NULL, 107219, 120, 594, '2002-07-16', '2002-07-16', 1),
(36, 83, 7, 7, 60000, 46000.00, 0.00, 0.00, 7, 5, 60000, '2015-03-11', NULL, '1969-12-31', NULL, NULL, 75251.3, 60, 1000, '2015-03-11', '2015-03-11', 1),
(37, 86, 7, 4, 69120, 39596.00, 0.00, 0.00, 7, 5, 34560, '2001-07-22', 34560, '2001-11-01', NULL, NULL, 103970, 120, 576, '2001-07-22', '2001-07-22', 1),
(38, 87, 7, 7, 60000, 57000.00, 0.00, 0.00, 7, 5, 30600, '2000-10-03', NULL, '1969-12-31', NULL, NULL, 92055.4, 60, 1000, '2016-04-05', '2016-04-05', 1),
(39, 89, 7, 4, 64800, 34010.00, 0.00, 0.00, 7, 5, 32400, '2002-07-16', 32400, '2002-10-19', NULL, NULL, 97471.8, 120, 540, '2002-07-16', '2002-07-16', 1),
(40, 89, 7, 7, 60000, 0.00, 1000.00, 0.00, 7, 5, 60000, '2008-06-30', NULL, '1969-12-31', NULL, NULL, 75253.7, 60, 1000, '2008-06-30', '2008-06-30', 1),
(41, 90, 7, 4, 54000, 900.00, 0.00, 0.00, 7, 5, 27000, '2003-10-25', 27000, '2003-11-08', NULL, NULL, 81228.4, 120, 450, '2003-10-25', '2003-10-25', 1),
(42, 91, 7, 4, 59400, 25714.00, 0.00, 0.00, 7, 5, 29700, '2001-01-11', 29700, '2001-04-25', NULL, NULL, 89348.9, 120, 495, '2001-01-11', '2001-01-11', 1),
(43, 94, 7, 4, 71280, 30831.10, 0.00, 0.00, 7, 5, 35640, '2001-01-11', 35640, '2001-04-30', NULL, NULL, 107218, 120, 594, '2001-01-11', '2001-01-11', 1),
(45, 98, 7, 4, 63000, 61950.00, 0.00, 0.00, 7, 5, 31500, '2002-07-16', 31500, '0000-00-00', NULL, NULL, 94764.4, 120, 525, '2002-07-16', '2002-07-16', 1),
(46, 100, 7, 4, 60000, 29000.00, 0.00, 0.00, 7, 5, 60000, '2015-03-11', NULL, '1969-12-31', NULL, NULL, 67751.3, 30, 2000, '2015-03-11', '2015-03-11', 1),
(47, 103, 7, 4, 83600, 36712.00, 0.00, 0.00, 7, 5, 41800, '2001-01-01', 41800, '2001-02-04', NULL, NULL, 125748, 120, 697, '2001-01-01', '2001-01-01', 1),
(48, 103, 7, 7, 60000, 19000.00, 0.00, 0.00, 7, 5, 60000, '2012-06-28', NULL, '1969-12-31', NULL, NULL, 75253.4, 60, 1000, '2012-06-28', '2012-06-28', 1),
(49, 112, 7, 4, 61200, 26015.00, 0.00, 0.00, 7, 5, 30600, '2001-02-12', 30600, '2001-07-17', NULL, NULL, 92056.5, 120, 510, '2001-02-12', '2001-02-12', 1),
(50, 115, 7, 4, 88560, 2214.00, 0.00, 0.00, 7, 5, 44280, '2001-02-12', 44280, '2001-09-04', NULL, NULL, 133210, 120, 738, '2001-02-12', '2001-02-12', 1),
(51, 117, 7, 4, 97560, 53999.00, 0.00, 0.00, 7, 5, 48780, '2003-08-23', 48780, '2003-09-07', NULL, NULL, 146748, 120, 813, '2003-08-23', '2003-08-23', 1),
(52, 119, 7, 4, 88560, 36223.50, 0.00, 0.00, 7, 5, 44280, '2001-02-12', 44280, '2001-09-09', NULL, NULL, 133210, 120, 738, '2001-02-12', '2001-02-12', 1),
(53, 120, 7, 4, 86940, 38924.50, 0.00, 0.00, 7, 5, 43470, '2002-09-14', 43470, '2003-11-22', NULL, NULL, 130773, 120, 725, '2002-09-14', '2002-09-14', 1),
(54, 125, 7, 4, 41580, 694.00, 0.00, 0.00, 7, 5, 41580, '2003-10-11', NULL, '1969-12-31', NULL, NULL, 62545.2, 120, 346, '2003-10-11', '2003-10-11', 1),
(55, 126, 7, 4, 105480, 55232.00, 0.00, 0.00, 7, 5, 52740, '2003-01-04', 52740, '2003-03-11', NULL, NULL, 158660, 120, 879, '2003-01-04', '2003-01-04', 1),
(56, 127, 7, 4, 120000, 64000.00, 0.00, 0.00, 7, 5, 60000, '2010-02-04', 60000, '2010-12-13', NULL, NULL, 180500, 120, 1000, '2010-02-04', '2010-02-04', 1),
(57, 133, 7, 4, 61260, 24222.00, 0.00, 0.00, 7, 5, 30630, '2000-09-25', 30630, '2000-12-17', NULL, NULL, 92148.3, 120, 510, '2000-09-25', '2000-09-25', 1),
(58, 135, 7, 4, 69120, 0.00, 0.00, 0.00, 7, 5, 34560, '2003-08-23', 34560, '2003-10-16', NULL, NULL, 103970, 120, 576, '2003-08-23', '2003-08-23', 1),
(59, 138, 7, 7, 60000, 1000.00, 0.00, 0.00, 7, 5, 60000, '2011-03-27', NULL, '1969-12-31', NULL, NULL, 75253.3, 60, 1000, '2011-03-27', '2011-03-27', 1),
(60, 153, 7, 8, 35000, 4195.00, 0.00, 0.00, 7, 5, 29, '2011-03-29', NULL, NULL, NULL, NULL, 42151.9, 48, 730, '2011-03-29', '2011-03-29', 1),
(61, 139, 7, 7, 60000, 42000.00, 0.00, 0.00, 7, 5, 60000, '2014-09-23', NULL, '1969-12-31', NULL, NULL, 75252.8, 60, 1000, '2014-09-23', '2014-09-23', 1),
(62, 140, 7, 7, 60000, 33000.00, 0.00, 0.00, 7, 5, 60000, '2010-02-04', NULL, '1969-12-31', NULL, NULL, 75250.5, 60, 1000, '2010-02-04', '2010-02-04', 1),
(63, 162, 7, 8, 35000, 32810.00, 0.00, 0.00, 7, 5, 5, '2016-04-05', NULL, NULL, NULL, NULL, 42146.9, 48, 730, '2016-04-05', '2016-04-05', 1),
(64, 142, 7, 4, 59400, 23146.00, 0.00, 0.00, 7, 5, 29700, '2011-07-22', 29700, '2001-10-30', NULL, NULL, 89350.2, 120, 495, '2011-07-22', '2011-07-22', 1),
(65, 142, 7, 7, 60000, 21000.00, 0.00, 0.00, 7, 5, 60000, '2003-01-20', NULL, '1969-12-31', NULL, NULL, 75252.4, 60, 1000, '2003-01-20', '2003-01-20', 1),
(66, 152, 7, 8, 35000, 32810.00, 0.00, 0.00, 7, 5, 5, '2016-04-05', NULL, NULL, NULL, NULL, 42146.9, 48, 730, '2016-04-05', '2016-04-05', 1),
(67, 165, 7, 8, 35000, 16750.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(68, 171, 7, 8, 35000, 5070.00, 0.00, 0.00, 7, 5, 35000, '2012-06-28', NULL, NULL, NULL, NULL, 42151.7, 48, 730, '2012-06-28', '2012-06-28', 1),
(69, 144, 7, 4, 120000, 110000.00, 0.00, 0.00, 7, 5, 60000, '2014-01-02', 60000, '2014-12-14', NULL, NULL, 180500, 120, 1000, '2014-01-02', '2014-01-02', 1),
(70, 10, 7, 8, 35000, 32810.00, 0.00, 0.00, 7, 5, 35000, '2016-04-05', NULL, NULL, NULL, NULL, 42146.9, 48, 730, '2016-04-05', '2016-04-05', 1),
(71, 145, 7, 7, 60000, 5035.00, 0.00, 0.00, 7, 5, 60000, '2002-06-28', NULL, '1969-12-31', NULL, NULL, 75253.4, 60, 1000, '2002-06-28', '2002-06-28', 1),
(72, 38, 7, 8, 35000, 8720.00, 0.00, 0.00, 7, 5, 35000, '2013-01-14', NULL, NULL, NULL, NULL, 42148.8, 48, 730, '2013-01-14', '2013-01-14', 1),
(73, 148, 7, 4, 115020, 55906.00, 0.00, 0.00, 7, 5, 57510, '2001-07-22', 57510, '2001-10-31', NULL, NULL, 173011, 120, 958, '2001-07-22', '2001-07-22', 1),
(74, 39, 7, 8, 35000, 15290.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(75, 150, 7, 4, 61200, 24145.37, 0.00, 0.00, 7, 5, 30600, '2000-06-08', 30600, '2000-08-13', NULL, NULL, 92056, 120, 510, '2000-06-08', '2000-06-08', 1),
(76, 42, 7, 8, 35000, 25510.00, 0.00, 0.00, 7, 5, 35000, '2015-03-31', NULL, NULL, NULL, NULL, 42152.3, 48, 730, '2015-03-31', '2015-03-31', 1),
(78, 151, 7, 4, 63000, 27337.74, 0.00, 0.00, 7, 5, 31500, '2001-01-01', 31500, '2001-04-23', NULL, NULL, 94762.5, 120, 525, '2001-01-01', '2001-01-01', 1),
(79, 151, 7, 7, 60000, 11000.00, 0.00, 0.00, 7, 5, 60000, '2011-09-11', NULL, '1969-12-31', NULL, NULL, 75251.3, 60, 1000, '2011-09-11', '2011-09-11', 1),
(80, 156, 7, 7, 60000, 0.00, 1000.00, 0.00, 7, 5, 60000, '2008-06-30', NULL, NULL, NULL, NULL, 75253.7, 60, 1000, '2008-06-30', '2008-06-30', 1),
(81, 158, 7, 4, 110340, 0.00, 5287.13, 0.00, 7, 5, 55170, '2002-10-26', 55170, '2002-11-27', NULL, NULL, 165971, 120, 91920, '2002-10-26', '2002-10-26', 1),
(82, 45, 7, 8, 35000, 32810.00, 0.00, 0.00, 7, 5, 35000, '2016-04-05', NULL, NULL, NULL, NULL, 42146.9, 48, 730, '2016-04-05', '2016-04-05', 1),
(83, 159, 7, 4, 60000, 20000.00, 0.00, 0.00, 7, 5, 60000, '2011-09-14', NULL, '1969-12-31', NULL, NULL, 75251.7, 60, 1000, '2011-09-14', '2011-09-14', 1),
(84, 48, 7, 8, 35000, 25530.00, 0.00, 0.00, 7, 5, 35000, '2015-03-31', NULL, NULL, NULL, NULL, 42152.3, 48, 730, '2015-03-31', '2015-03-31', 1),
(85, 49, 7, 8, 35000, 3505.00, 0.00, 0.00, 7, 5, 35000, '2011-03-29', NULL, NULL, NULL, NULL, 42151.9, 48, 730, '2011-03-29', '2011-03-29', 1),
(86, 160, 7, 4, 90180, 53913.00, 0.00, 0.00, 7, 5, 45090, '2002-11-05', 45090, '2003-02-04', NULL, NULL, 135646, 120, 752, '2002-11-05', '2002-11-05', 1),
(87, 162, 7, 4, 120000, 110000.00, 0.00, 0.00, 7, 5, 60000, '2014-10-02', 60000, '2014-12-14', NULL, NULL, 180500, 120, 1000, '2014-10-02', '2014-10-02', 1),
(88, 58, 7, 8, 35000, 8720.00, 0.00, 0.00, 7, 5, 35000, '2013-01-14', NULL, NULL, NULL, NULL, 42148.8, 48, 730, '2013-01-14', '2013-01-14', 1),
(89, 164, 7, 4, 120000, 42000.00, 0.00, 0.00, 7, 5, 60000, '2007-12-19', 60000, '2008-07-13', NULL, NULL, 180501, 120, 1000, '2007-12-19', '2007-12-19', 1),
(90, 60, 7, 8, 35000, 16750.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(91, 165, 7, 4, 120000, 96000.00, 0.00, 0.00, 7, 5, 60000, '2003-01-22', 60000, '2013-02-25', NULL, NULL, 180501, 120, 1000, '2003-01-22', '2003-01-22', 1),
(92, 166, 7, 4, 120000, 84000.00, 0.00, 0.00, 7, 5, 60000, '2012-01-30', 60000, '2012-01-09', NULL, NULL, 180502, 120, 1000, '2012-01-30', '2012-01-30', 1),
(93, 62, 7, 8, 35000, 16750.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(94, 169, 7, 7, 60000, 57000.00, 0.00, 0.00, 7, 5, 60000, '2016-04-05', NULL, '1969-12-31', NULL, NULL, 75250.6, 60, 1000, '2016-04-05', '2016-04-05', 1),
(95, 70, 7, 8, 35000, 12370.00, 0.00, 0.00, 7, 5, 35000, '2013-06-07', NULL, NULL, NULL, NULL, 42147.3, 48, 730, '2013-06-07', '2013-06-07', 1),
(96, 170, 7, 4, 110340, 2620.00, 0.00, 0.00, 7, 5, 55170, '2007-01-21', 55170, '2004-04-26', NULL, NULL, 165971, 120, 920, '2007-01-21', '2007-01-21', 1),
(97, 72, 7, 8, 35000, 0.00, 583.33, 0.00, 7, 5, 35000, '2010-06-29', NULL, NULL, NULL, NULL, 42151.9, 48, 730, '2010-06-29', '2010-06-29', 1),
(98, 178, 7, 7, 60000, 24000.00, 0.00, 0.00, 7, 5, 60000, '2013-11-10', NULL, '1969-12-31', NULL, NULL, 75251.2, 60, 1000, '2013-11-10', '2013-11-10', 1),
(99, 179, 7, 4, 63000, 27306.26, 0.00, 0.00, 7, 5, 31500, '2001-01-01', 31500, '2001-04-30', NULL, NULL, 94762.5, 120, 525, '2001-01-01', '2001-01-01', 1),
(100, 73, 7, 8, 35000, 12370.00, 0.00, 0.00, 7, 5, 35000, '2013-06-27', NULL, NULL, NULL, NULL, 42151.5, 48, 730, '2013-06-27', '2013-06-27', 1),
(101, 74, 7, 8, 35000, 0.00, 1895.83, 1165.83, 7, 5, 35000, '2011-09-08', NULL, NULL, NULL, NULL, 42147.5, 48, 730, '2011-09-08', '2011-09-08', 1),
(102, 180, 7, 4, 105840, 43874.06, 0.00, 0.00, 7, 5, 52920, '2002-06-06', 52920, '2002-12-06', NULL, NULL, 159201, 120, 1000, '2002-06-06', '2002-06-06', 1),
(103, 79, 7, 8, 35000, 25510.00, 0.00, 0.00, 7, 1, 35000, '2015-03-31', NULL, NULL, NULL, NULL, 42152.3, 48, 730, '2015-03-31', '2015-03-31', 1),
(105, 84, 7, 8, 35000, 25510.00, 0.00, 0.00, 7, 5, 35000, '2015-03-31', NULL, NULL, NULL, NULL, 42152.3, 48, 730, '2015-03-31', '2015-03-31', 1),
(106, 188, 7, 4, 66600, 41009.61, 0.00, 0.00, 7, 5, 33300, '2002-10-26', 333000, '2002-11-19', NULL, NULL, 100180, 120, 555, '2002-10-26', '2002-10-26', 1),
(107, 88, 7, 8, 35000, 9450.00, 0.00, 0.00, 7, 5, 35000, '2013-06-27', NULL, NULL, NULL, NULL, 42151.5, 48, 730, '2013-06-27', '2013-06-27', 1),
(108, 89, 7, 8, 35000, 14560.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(109, 189, 7, 4, 81780, 10778.07, 0.00, 0.00, 7, 5, 40890, '2001-07-31', 40890, '2001-09-03', NULL, NULL, 123014, 120, 782, '2001-07-31', '2001-07-31', 1),
(110, 95, 7, 8, 35000, 32810.00, 0.00, 0.00, 7, 5, 35000, '2016-04-05', NULL, NULL, NULL, NULL, 42146.9, 48, 730, '2016-04-05', '2016-04-05', 1),
(111, 96, 7, 8, 35000, 32810.00, 0.00, 0.00, 7, 5, 35000, '2016-04-05', NULL, NULL, NULL, NULL, 42146.9, 48, 730, '2016-04-05', '2016-04-05', 1),
(112, 191, 7, 4, 97560, 1626.00, 0.00, 0.00, 7, 5, 48780, '2003-09-17', 48780, '2003-10-11', NULL, NULL, 146748, 120, 813, '2003-09-17', '2003-09-17', 1),
(113, 105, 7, 8, 35000, 16750.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(114, 198, 7, 4, 120000, 84000.00, 0.00, 0.00, 7, 5, 60000, '2012-01-30', 60000, '2012-02-09', NULL, NULL, 180502, 120, 1000, '2012-01-30', '2012-01-30', 1),
(115, 106, 7, 8, 35000, 6530.00, 0.00, 0.00, 7, 5, 35000, '2009-01-07', NULL, NULL, NULL, NULL, 42147.3, 48, 730, '2009-01-07', '2009-01-07', 1),
(116, 204, 7, 7, 60000, 20267.00, 0.00, 0.00, 7, 5, 60000, '2008-06-30', NULL, '1969-12-31', NULL, NULL, 75253.7, 60, 1000, '2008-06-30', '2008-06-30', 1),
(117, 206, 7, 4, 120000, 38000.00, 0.00, 0.00, 7, 5, 60000, '2007-06-25', 60000, '2008-02-12', NULL, NULL, 180502, 120, 1000, '2007-06-25', '2007-06-25', 1),
(118, 108, 7, 8, 35000, 12370.00, 0.00, 0.00, 7, 5, 35000, '2013-06-27', NULL, NULL, NULL, NULL, 42151.5, 48, 730, '2013-06-27', '2013-06-27', 1),
(119, 110, 7, 8, 35000, 4195.00, 0.00, 0.00, 7, 5, 35000, '2011-03-29', NULL, NULL, NULL, NULL, 42151.9, 48, 730, '2011-03-29', '2011-03-29', 1),
(120, 208, 7, 7, 60000, 19000.00, 0.00, 0.00, 7, 5, 60000, '1970-01-01', NULL, '1969-12-31', NULL, NULL, 75250, 60, 1000, '2012-06-28', '2012-06-28', 1),
(121, 111, 7, 8, 35000, 4340.00, 0.00, 0.00, 7, 5, 35000, '2012-06-28', NULL, NULL, NULL, NULL, 42151.7, 48, 730, '2012-06-28', '2012-06-28', 1),
(122, 210, 7, 4, 80280, 47814.88, 0.00, 0.00, 7, 5, 40140, '2003-09-20', 40140, '2003-10-15', NULL, NULL, 120756, 120, 669, '2003-09-20', '2003-09-20', 1),
(123, 118, 7, 8, 35000, 16750.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(124, 122, 7, 8, 35000, 2150.00, 0.00, 0.00, 7, 5, 35000, '2012-02-07', NULL, NULL, NULL, NULL, 42147.3, 48, 730, '2012-02-07', '2012-02-07', 1),
(125, 127, 7, 8, 35000, 2150.00, 0.00, 0.00, 7, 5, 35000, '2012-06-28', NULL, NULL, NULL, NULL, 42151.7, 48, 730, '2012-06-28', '2012-06-28', 1),
(126, 131, 7, 8, 35000, 8720.00, 0.00, 0.00, 7, 5, 35000, '2013-01-14', NULL, NULL, NULL, NULL, 42148.8, 48, 730, '2013-01-14', '2006-07-19', 1),
(127, 134, 7, 8, 35000, 12370.00, 0.00, 0.00, 7, 5, 35000, '2013-06-27', NULL, NULL, NULL, NULL, 42151.5, 48, 730, '2013-06-27', '2013-06-27', 1),
(128, 136, 7, 8, 35000, 25510.00, 0.00, 0.00, 7, 5, 35000, '2015-03-31', NULL, NULL, NULL, NULL, 42152.3, 48, 730, '2015-03-31', '2015-03-31', 1),
(129, 137, 7, 8, 35000, 0.00, 0.00, -1070.00, 7, 5, 35000, '2011-03-29', NULL, NULL, NULL, NULL, 42151.9, 48, 730, '2011-03-29', '2011-03-29', 1),
(130, 141, 7, 8, 35000, 24780.00, 0.00, 0.00, 7, 5, 35000, '2015-03-31', NULL, NULL, NULL, NULL, 42152.3, 48, 730, '2015-03-31', '2015-03-31', 1),
(131, 172, 7, 8, 35000, 5070.00, 0.00, 0.00, 7, 5, 35000, '2012-06-28', NULL, NULL, NULL, NULL, 42151.7, 48, 730, '2012-06-28', '2012-06-28', 1),
(132, 175, 7, 8, 35000, 25510.00, 0.00, 0.00, 7, 5, 35000, '2015-03-31', NULL, NULL, NULL, NULL, 42152.3, 48, 730, '2015-03-31', '2015-03-31', 1),
(133, 183, 7, 8, 35000, 4195.00, 0.00, 0.00, 7, 5, 35000, '2011-03-29', NULL, NULL, NULL, NULL, 42151.9, 48, 730, '2011-03-29', '2011-03-29', 1),
(134, 186, 7, 8, 35000, 16750.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(135, 10, 7, 5, 50000, 47000.00, 0.00, 0.00, 7, 5, 50000, '2016-04-05', NULL, NULL, NULL, NULL, 60625.7, 50, 1000, '2016-04-05', '2016-04-05', 1),
(136, 185, 7, 8, 35000, 16750.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(137, 20, 7, 5, 50000, 30000.00, 0.00, 0.00, 7, 5, 50000, '2014-10-02', NULL, NULL, NULL, NULL, 60625.3, 50, 1000, '2014-10-02', '2014-10-02', 1),
(138, 22, 7, 5, 50000, 47000.00, 0.00, 0.00, 7, 5, 50000, '2016-04-05', NULL, NULL, NULL, NULL, 60625.7, 50, 1000, '2016-04-05', '2016-04-05', 1),
(139, 23, 7, 5, 50000, 14000.00, 0.00, 0.00, 7, 5, 50000, '2013-06-27', NULL, NULL, NULL, NULL, 60628.9, 50, 1000, '2013-06-27', '2013-06-27', 1),
(140, 182, 7, 8, 35000, 21860.00, 0.00, 0.00, 7, 5, 35000, '2014-09-23', NULL, NULL, NULL, NULL, 42150.6, 48, 730, '2014-09-23', '2014-09-23', 1),
(141, 29, 7, 5, 50000, 4000.00, 0.00, 0.00, 7, 5, 50000, '2011-09-12', NULL, NULL, NULL, NULL, 60626.8, 50, 1000, '2011-09-12', '2011-09-12', 1),
(142, 30, 7, 5, 50000, 8000.00, 0.00, 0.00, 7, 5, 50000, '2013-01-24', NULL, NULL, NULL, NULL, 60628.5, 50, 1000, '2013-01-24', '2013-01-24', 1),
(143, 193, 7, 8, 35000, 5070.00, 0.00, 0.00, 7, 5, 35000, '2012-06-28', NULL, NULL, NULL, NULL, 42151.7, 48, 730, '2012-06-28', '2012-06-28', 1),
(144, 194, 7, 8, 35000, 14560.00, 0.00, 0.00, 7, 5, 35000, '2013-06-27', NULL, NULL, NULL, NULL, 42151.5, 48, 730, '2013-06-27', '2013-06-27', 1),
(145, 198, 7, 8, 35000, 16750.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(146, 199, 7, 8, 35000, 14560.00, 0.00, 0.00, 7, 5, 35000, '2013-06-27', NULL, NULL, NULL, NULL, 42151.5, 48, 730, '2013-06-27', '2013-06-27', 1),
(147, 200, 7, 8, 35000, 8720.00, 0.00, 0.00, 7, 5, 35000, '2013-01-14', NULL, NULL, NULL, NULL, 42148.8, 48, 730, '2013-01-14', '2013-01-14', 1),
(148, 201, 7, 8, 35000, 16750.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(149, 203, 7, 8, 35000, 12370.00, 0.00, 0.00, 7, 5, 35000, '2013-06-27', NULL, NULL, NULL, NULL, 42151.5, 48, 730, '2013-06-27', '2013-06-27', 1),
(150, 205, 7, 8, 35000, 32810.00, 0.00, 0.00, 7, 5, 35000, '2016-04-05', NULL, NULL, NULL, NULL, 42146.9, 48, 730, '2016-04-05', '2016-04-05', 1),
(151, 206, 7, 8, 35000, 0.00, 1895.83, 1165.83, 7, 5, 35000, '2011-09-11', NULL, NULL, NULL, NULL, 42148.1, 48, 730, '2011-09-11', '2011-09-11', 1),
(152, 212, 7, 8, 35000, 16750.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(153, 213, 7, 8, 35000, 0.00, 1895.83, 1165.83, 7, 5, 35000, '2011-09-08', NULL, NULL, NULL, NULL, 42147.5, 48, 730, '2011-09-08', '2011-09-08', 1),
(154, 5, 8, 6, 200000, 191666.00, 0.00, 0.00, 7, 5, 41667, '2016-07-01', NULL, NULL, NULL, NULL, 253084, 48, 4167, '2013-04-01', '2013-04-10', 1),
(155, 10, 8, 6, 196000, 187832.00, 0.00, 0.00, 7, 5, 4084, '2015-12-01', NULL, NULL, NULL, NULL, 248022, 48, 4084, '2015-10-05', '2015-10-19', 1),
(156, 144, 8, 6, 86000, 81700.00, 0.00, 0.00, 7, 5, 2150, '2016-04-01', NULL, NULL, NULL, NULL, 105100, 40, 2150, '2016-02-22', '2016-03-06', 1),
(157, 145, 8, 6, 132698, 125072.00, 0.00, 0.00, 7, 5, 3813, '2016-08-01', NULL, NULL, NULL, NULL, 158574, 35, 3813, '2016-07-15', '2016-08-01', 1),
(158, 160, 8, 6, 205200, 196992.00, 0.00, 0.00, 7, 5, 4104, '2017-08-01', NULL, NULL, NULL, NULL, 261887, 50, 4104, '2016-06-04', '2016-06-19', 1),
(159, 180, 8, 6, 91000, 79970.00, 0.00, 0.00, 7, 5, 5515, '2015-12-01', NULL, NULL, NULL, NULL, 99873.6, 17, 5515, '2015-10-04', '2015-10-19', 1),
(160, 186, 8, 6, 138965, 133173.00, 0.00, 0.00, 7, 5, 2896, '2016-04-01', NULL, NULL, NULL, NULL, 175849, 48, 2896, '2016-01-05', '2016-01-20', 1),
(161, 188, 8, 6, 143940, 138182.00, 0.00, 0.00, 7, 5, 2879, '2016-08-01', NULL, NULL, NULL, NULL, 183704, 50, 2879, '2016-06-04', '2016-06-19', 1),
(162, 191, 8, 6, 60000, 57500.00, 0.00, 0.00, 7, 5, 1250, '2015-11-01', NULL, NULL, NULL, NULL, 75926.8, 48, 1250, '2015-10-04', '2015-10-19', 1),
(163, 198, 8, 6, 71817, 68943.00, 0.00, 0.00, 7, 5, 1437, '2016-08-01', NULL, NULL, NULL, NULL, 91657.9, 50, 1437, '2016-06-04', '2016-06-19', 1),
(164, 203, 8, 6, 30000, 28500.00, 0.00, 0.00, 7, 5, 750, '2015-12-01', NULL, NULL, NULL, NULL, 36663.6, 40, 750, '2015-09-21', '2015-10-06', 1),
(165, 204, 8, 6, 106200, 100890.00, 0.00, 0.00, 7, 5, 2655, '2014-08-01', NULL, NULL, NULL, NULL, 129787, 40, 2655, '2013-12-14', '2013-12-26', 1),
(166, 12, 8, 6, 170000, 162916.00, 0.00, 0.00, 7, 5, 170000, '2012-10-19', NULL, NULL, NULL, NULL, 215121, 48, 3542, '2012-10-10', '2012-10-19', 1),
(167, 205, 8, 6, 40000, 38332.00, 0.00, 0.00, 7, 5, 834, '2015-12-01', NULL, NULL, NULL, NULL, 50619.9, 48, 834, '2015-10-13', '2015-10-23', 1),
(169, 214, 8, 6, 122411, 117879.00, 0.00, 0.00, 7, 5, 2266, '2016-08-01', NULL, NULL, NULL, NULL, 158879, 54, 2266, '2016-07-15', '2016-08-01', 1),
(170, 22, 8, 6, 366459, 0.00, 21834.85, 6564.85, 7, 5, 366459, '2015-11-22', NULL, NULL, NULL, NULL, 463724, 48, 7635, '2015-11-22', '2015-11-22', 1),
(171, 148, 8, 6, 107700, 103392.00, 0.00, 0.00, 7, 5, 2154, '2009-12-10', NULL, NULL, NULL, NULL, 136286, 48, 2154, '2009-11-28', '2009-12-10', 1),
(172, 24, 8, 6, 347000, 0.00, 3759.17, 0.00, 7, 5, 347000, '2015-08-09', NULL, NULL, NULL, NULL, 439100, 48, 72230, '2015-08-09', '2015-08-09', 1),
(173, 23, 8, 6, 60000, 0.00, 650.00, 0.00, 7, 5, 60000, '2015-08-09', NULL, NULL, NULL, NULL, 73325.8, 40, 1500, '2014-09-16', '2015-08-09', 1),
(174, 25, 8, 6, 294509, 0.00, 6381.03, 0.00, 7, 5, 294509, '2016-06-19', NULL, NULL, NULL, NULL, 375867, 50, 5891, '2016-06-19', '2016-06-19', 1),
(175, 26, 8, 6, 100000, 0.00, 4875.00, 0.00, 7, 5, 100000, '2015-01-06', NULL, NULL, NULL, NULL, 122209, 40, 2500, '2015-01-06', '2015-01-06', 1),
(176, 29, 8, 6, 165000, 0.00, 2681.25, 0.00, 7, 5, 165000, '2016-07-18', NULL, NULL, NULL, NULL, 208794, 48, 34378, '2016-07-18', '2016-07-18', 1),
(177, 32, 8, 6, 241000, 0.00, 11748.75, 1698.75, 7, 5, 241000, '2015-01-06', NULL, NULL, NULL, NULL, 304966, 48, 5025, '2015-01-06', '2015-01-06', 1),
(178, 35, 7, 4, 120000, 84000.00, 0.00, 0.00, 7, 5, 60000, '2012-02-02', 60000, '2012-03-25', NULL, NULL, 98717.2, 120, 1000, '2012-02-02', '2012-02-02', 1),
(179, 36, 8, 6, 88000, 75940.00, 0.00, 0.00, 7, 5, 6030, '2015-12-01', NULL, NULL, NULL, NULL, 95151.1, 14, 6030, '2015-10-04', '2015-10-19', 1),
(180, 37, 8, 6, 188697, 180833.00, 0.00, 0.00, 7, 5, 3932, '2016-04-28', NULL, NULL, NULL, NULL, 238781, 48, 3932, '2016-04-14', '2016-04-28', 1),
(181, 38, 8, 6, 75862, 72826.00, 0.00, 0.00, 7, 5, 1518, '2017-02-01', NULL, NULL, NULL, NULL, 96821, 50, 1518, '2016-12-14', '2016-12-28', 1),
(182, 40, 8, 6, 130999, 125539.00, 0.00, 0.00, 7, 5, 2730, '2013-07-29', NULL, NULL, NULL, NULL, 165770, 48, 2730, '2013-07-14', '2013-07-29', 1),
(183, 41, 8, 6, 125256, 120036.00, 0.00, 0.00, 7, 5, 125265, '2013-07-29', NULL, NULL, NULL, NULL, 158502, 48, 2610, '2014-07-20', '2013-07-29', 1),
(185, 42, 8, 6, 113220, 0.00, 7972.58, 2940.58, 7, 5, 113220, '2020-08-14', NULL, NULL, NULL, NULL, 141431, 45, 2516, '2014-01-13', '2014-01-13', 1),
(186, 43, 8, 6, 55000, 0.00, 4170.83, 1420.83, 7, 5, 55000, '2015-09-02', NULL, NULL, NULL, NULL, 67214.8, 40, 1375, '2015-09-02', '2015-09-02', 1),
(187, 151, 8, 6, 76436, 73038.00, 0.00, 0.00, 7, 5, 76436, '2014-05-20', NULL, NULL, NULL, NULL, 95482.8, 45, 1699, '2014-05-05', '2014-05-20', 1),
(188, 155, 8, 6, 126299, 121035.00, 0.00, 0.00, 7, 5, 126299, '2015-07-20', NULL, NULL, NULL, NULL, 159822, 48, 2632, '2015-07-05', '2015-07-20', 1),
(189, 189, 8, 6, 197000, 188790.00, 0.00, 0.00, 7, 5, 197000, '2015-04-23', NULL, NULL, NULL, NULL, 249288, 48, 4105, '2015-04-08', '2015-04-23', 1),
(190, 161, 8, 6, 190000, 182084.00, 0.00, 0.00, 7, 5, 190000, '2015-10-19', NULL, NULL, NULL, NULL, 240430, 48, 3958, '2015-10-04', '2015-10-19', 1),
(191, 166, 8, 6, 54000, 51300.00, 0.00, 0.00, 7, 5, 54000, '2015-02-10', NULL, NULL, NULL, NULL, 65993.5, 40, 1350, '2015-01-25', '2015-02-10', 1),
(192, 178, 8, 6, 163000, 156208.00, 0.00, 0.00, 7, 5, 163000, '2015-01-06', NULL, NULL, NULL, NULL, 206263, 48, 3396, '2014-12-16', '2015-01-06', 1),
(193, 179, 8, 6, 124000, 118832.00, 0.00, 0.00, 7, 5, 124000, '2015-05-10', NULL, NULL, NULL, NULL, 156912, 48, 2584, '2015-04-25', '2015-05-10', 1),
(194, 183, 8, 6, 87000, 82650.00, 0.00, 0.00, 7, 5, 87000, '2015-02-15', NULL, NULL, NULL, NULL, 106322, 40, 2175, '2015-02-01', '2015-02-15', 1),
(195, 185, 8, 6, 43753, 41703.00, 0.00, 0.00, 7, 5, 43753, '2015-03-04', NULL, NULL, NULL, NULL, 54181.3, 43, 1025, '2015-02-22', '2015-03-04', 1),
(196, 187, 8, 6, 163039, 156245.00, 0.00, 0.00, 7, 5, 163039, '2013-10-02', NULL, NULL, NULL, NULL, 206312, 48, 3397, '2013-09-16', '2013-10-02', 1),
(197, 48, 8, 6, 106000, 0.00, 8038.33, 3620.33, 7, 5, 106000, '2015-09-02', NULL, NULL, NULL, NULL, 134134, 48, 2209, '2015-09-02', '2015-09-02', 1),
(198, 49, 8, 6, 68000, 0.00, 2578.33, 0.00, 7, 5, 68000, '2015-03-04', NULL, NULL, NULL, NULL, 86048.7, 48, 1417, '2015-03-04', '2015-03-04', 1),
(199, 54, 8, 6, 222947, 0.00, 8371.30, 0.00, 7, 5, 176000, '2016-04-10', 48947, '0000-00-00', NULL, NULL, 282121, 48, 4645, '2016-04-10', '2016-04-10', 1),
(200, 56, 8, 6, 102000, 0.00, 4972.50, 722.50, 7, 5, 102000, '2015-01-10', NULL, NULL, NULL, NULL, 170511, 48, 2125, '2015-01-10', '2015-01-10', 1),
(201, 57, 8, 6, 135000, 0.00, 4387.50, 0.00, 7, 5, 135000, '2015-04-23', NULL, NULL, NULL, NULL, 170832, 48, 2813, '2015-04-23', '2015-04-23', 1),
(202, 58, 8, 6, 57401, 0.00, 3731.07, 1339.07, 7, 5, 57401, '2015-10-23', NULL, NULL, NULL, NULL, 72638.4, 48, 1196, '2015-10-23', '2015-10-23', 1),
(203, 60, 8, 6, 18480, 0.00, 1301.30, 377.30, 7, 5, 18480, '2013-09-22', NULL, NULL, NULL, NULL, 22590.8, 40, 462, '2013-09-22', '2013-09-22', 1),
(204, 61, 8, 6, 150000, 0.00, 7312.50, 1062.50, 7, 5, 150000, '2015-01-06', NULL, NULL, NULL, NULL, 189813, 48, 3125, '2015-01-06', '2015-01-06', 1),
(205, 63, 8, 6, 86840, 0.00, 3763.07, 0.00, 7, 5, 86840, '2015-02-08', NULL, NULL, NULL, NULL, 106126, 40, 2175, '2015-02-08', '2015-02-08', 1),
(206, 68, 8, 6, 175970, 168636.00, 0.00, 0.00, 7, 5, 175970, '2015-01-06', NULL, NULL, NULL, NULL, 222675, 48, 3667, '2015-01-06', '2015-01-06', 1),
(207, 153, 7, 4, 120000, 106000.00, 0.00, 0.00, 7, 5, 60000, '2014-03-23', 60000, '0000-00-00', NULL, NULL, 0, 120, 1000, '2014-03-23', '2014-03-23', 1),
(208, 155, 7, 7, 60000, 48000.00, 0.00, 0.00, 7, 5, 60000, '2005-09-15', NULL, NULL, NULL, NULL, 0, 60, 1000, '2005-09-15', '2005-09-15', 1),
(209, 158, 7, 4, 110340, 69716.00, 0.00, 0.00, 7, 5, 55170, '2005-09-02', 55170, '0000-00-00', NULL, NULL, 0, 120, 920, '2005-09-02', '2005-09-02', 1),
(210, 182, 7, 7, 60000, 8000.00, 0.00, 0.00, 7, 5, 60000, '2011-03-28', NULL, NULL, NULL, NULL, 0, 60, 1000, '2011-03-28', '2011-03-28', 1),
(212, 189, 7, 4, 81780, 12342.00, 0.00, 0.00, 7, 5, 40890, '2001-07-31', 40890, '0000-00-00', NULL, NULL, 0, 105, 782, '2001-07-31', '2001-07-31', 1),
(213, 36, 7, 4, 86940, 39498.00, 0.00, 0.00, 7, 5, 43470, '2001-02-12', 43470, '0000-00-00', NULL, NULL, 0, 120, 724, '2001-02-12', '2001-02-12', 1),
(214, 52, 7, 4, 66960, 29500.02, 0.00, 0.00, 7, 5, 33480, '2000-10-01', 33480, '0000-00-00', NULL, NULL, 0, 120, 558, '2000-10-01', '2000-10-01', 1),
(215, 71, 7, 4, 71280, 39790.00, 0.00, 0.00, 7, 5, 35640, '2002-07-16', 35640, '0000-00-00', NULL, NULL, 0, 120, 594, '2002-07-16', '2002-07-16', 1),
(216, 75, 7, 4, 74520, 30456.71, 0.00, 0.00, 7, 5, 37260, '2001-09-11', 37260, '0000-00-00', NULL, NULL, 0, 120, 621, '2001-09-11', '2001-09-11', 1),
(217, 75, 7, 7, 60000, 21000.00, 0.00, 0.00, 7, 5, 60000, '2012-06-28', NULL, NULL, NULL, NULL, 0, 60, 1000, '2012-06-28', '2012-06-28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_loans_back`
--

CREATE TABLE `employee_loans_back` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `loan_type_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `loan_amount` float NOT NULL,
  `current_due` float(8,2) NOT NULL,
  `interest_amount` float(8,2) NOT NULL,
  `interest_amount_due` float(8,2) NOT NULL,
  `recovery_start_month_id` int(11) NOT NULL,
  `recovery_year_id` int(11) NOT NULL,
  `first_installment_amount` float NOT NULL,
  `first_installment_date` date NOT NULL,
  `second_installment_amount` float DEFAULT NULL,
  `second_installment_date` date DEFAULT NULL,
  `third_installment_amount` float DEFAULT NULL,
  `third_installment_date` date DEFAULT NULL,
  `total_payable` float NOT NULL,
  `number_of_installment` int(11) NOT NULL,
  `installment_amount` float NOT NULL,
  `loan_apply_date` date NOT NULL,
  `loan_approved_date` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_loans_back`
--

INSERT INTO `employee_loans_back` (`id`, `employee_id`, `loan_type_id`, `loan_id`, `loan_amount`, `current_due`, `interest_amount`, `interest_amount_due`, `recovery_start_month_id`, `recovery_year_id`, `first_installment_amount`, `first_installment_date`, `second_installment_amount`, `second_installment_date`, `third_installment_amount`, `third_installment_date`, `total_payable`, `number_of_installment`, `installment_amount`, `loan_apply_date`, `loan_approved_date`, `status`) VALUES
(3, 3, 7, 4, 120000, 2647.10, 0.00, 0.00, 7, 5, 60000, '2003-06-04', 60000, '2003-06-10', NULL, NULL, 180500, 120, 1000, '2003-06-04', '2003-06-04', 1),
(4, 4, 7, 4, 120000, 2976.49, 0.00, 0.00, 7, 5, 60000, '2003-01-27', 60000, '2003-02-04', NULL, NULL, 180502, 120, 1000, '2003-01-27', '2003-01-27', 1),
(5, 6, 7, 4, 120000, 32000.00, 0.00, 0.00, 7, 5, 60000, '2008-06-30', 60000, '2008-08-20', NULL, NULL, 180502, 120, 1000, '2008-06-30', '2008-06-30', 1),
(6, 24, 7, 4, 120000, 76000.00, 0.00, 0.00, 7, 5, 60000, '2012-02-01', 60000, '2012-02-13', NULL, NULL, 180500, 120, 1000, '2012-02-01', '2012-02-01', 1),
(7, 25, 7, 4, 120000, 26909.51, 0.00, 0.00, 7, 5, 60000, '2003-09-17', 60000, '2003-10-04', NULL, NULL, 180501, 120, 1000, '2003-09-17', '2003-09-17', 1),
(8, 26, 7, 4, 120000, 76000.00, 0.00, 0.00, 7, 5, 60000, '2012-03-15', 60000, '2012-05-30', NULL, NULL, 180501, 120, 1000, '2012-03-15', '2012-03-15', 1),
(9, 29, 7, 4, 120000, 100000.00, 0.00, 0.00, 1, 1, 60000, '2014-02-06', 60000, '2014-03-13', NULL, NULL, 180500, 120, 1000, '2014-02-06', '2014-02-06', 1),
(12, 34, 7, 4, 120000, 98000.00, 0.00, 0.00, 7, 5, 60000, '2012-02-06', 60000, '2013-12-17', NULL, NULL, 180500, 120, 1000, '2012-02-06', '2012-02-06', 1),
(13, 35, 7, 4, 120000, 82000.00, 0.00, 0.00, 7, 5, 60000, '2012-02-02', 60000, '2012-03-25', NULL, NULL, 180500, 120, 1000, '2012-02-02', '2012-02-02', 1),
(14, 36, 7, 4, 86940, 36602.33, 0.00, 0.00, 7, 5, 43470, '2001-02-12', 43470, '2001-07-16', NULL, NULL, 118819, 120, 724, '2001-02-12', '2001-02-12', 1),
(15, 40, 7, 4, 83160, 0.00, 2598.75, 1212.75, 7, 5, 41580, '2003-08-23', 41580, '2003-09-27', NULL, NULL, 125089, 120, 693, '2003-08-23', '2003-08-23', 1),
(16, 41, 7, 4, 90180, 22325.87, 0.00, 0.00, 7, 5, 45090, '2004-05-13', 45090, '2004-07-22', NULL, NULL, 135647, 120, 1000, '2004-05-13', '2004-05-13', 1),
(17, 46, 7, 4, 55800, 19754.67, 0.00, 0.00, 7, 5, 27900, '2001-12-24', 27900, '2002-01-10', NULL, NULL, 83935.7, 120, 465, '2001-12-24', '2001-12-24', 1),
(18, 47, 7, 4, 120000, 96000.00, 0.00, 0.00, 7, 5, 60000, '2013-10-27', 60000, '2013-11-24', NULL, NULL, 180502, 120, 1000, '2013-10-27', '2013-10-27', 1),
(19, 54, 7, 7, 60000, 40000.00, 0.00, 0.00, 7, 5, 60000, '2014-09-23', NULL, '1969-12-31', NULL, NULL, 90252.8, 60, 1000, '2014-09-23', '2014-09-23', 1),
(20, 56, 7, 4, 64800, 30416.00, 0.00, 0.00, 7, 5, 32400, '2022-12-27', 32400, '2001-10-31', NULL, NULL, 97472.5, 120, 540, '2022-12-27', '2001-07-22', 1),
(21, 57, 7, 4, 66600, 33525.00, 0.00, 0.00, 7, 5, 33300, '2002-01-10', 333000, '2002-05-05', NULL, NULL, 100179, 120, 555, '2002-01-10', '2002-01-10', 1),
(22, 61, 7, 7, 60000, 55000.00, 0.00, 0.00, 7, 5, 60000, '2016-04-05', NULL, '1969-12-31', NULL, NULL, 75250.6, 60, 1000, '2016-04-05', '2016-04-05', 1),
(23, 63, 7, 7, 60000, 22000.00, 0.00, 0.00, 7, 5, 60000, '2013-01-15', NULL, '1969-12-31', NULL, NULL, 75251.8, 60, 1000, '2013-01-15', '2013-01-15', 1),
(24, 64, 7, 4, 61200, 25461.50, 0.00, 0.00, 7, 5, 30600, '2000-01-25', 30600, '2000-12-17', NULL, NULL, 92058, 120, 510, '2000-01-25', '2000-01-25', 1),
(25, 65, 7, 4, 61200, 27035.00, 0.00, 0.00, 7, 5, 30600, '2001-01-01', 30600, '2001-04-30', NULL, NULL, 92055, 120, 510, '2001-01-01', '2001-01-01', 1),
(26, 68, 7, 7, 60000, 55000.00, 0.00, 0.00, 7, 5, 60000, '2016-04-05', NULL, '1969-12-31', NULL, NULL, 75250.6, 60, 1000, '2016-04-05', '2016-04-05', 1),
(27, 69, 7, 4, 120000, 5000.00, 0.00, 0.00, 7, 5, 60000, '1970-01-01', 60000, '2011-09-08', NULL, NULL, 180502, 120, 1000, '2008-06-30', '2008-06-30', 1),
(28, 69, 7, 7, 60000, 5000.00, 0.00, 0.00, 7, 5, 60000, '2011-09-08', NULL, '1969-12-31', NULL, NULL, 75251, 60, 1000, '2011-09-08', '2011-09-08', 1),
(29, 70, 7, 4, 71280, 37414.00, 0.00, 0.00, 7, 5, 35640, '2002-07-16', 35640, '2002-10-20', NULL, NULL, 107219, 120, 594, '2002-07-16', '2002-07-16', 1),
(30, 75, 7, 4, 74520, 27972.71, 0.00, 0.00, 7, 5, 37260, '2001-09-11', 37260, '2001-10-11', NULL, NULL, 112092, 120, 621, '2001-09-11', '2001-09-11', 1),
(31, 75, 7, 7, 60000, 17000.00, 0.00, 0.00, 7, 5, 60000, '2012-06-28', NULL, '1969-12-31', NULL, NULL, 75253.4, 60, 1000, '2012-06-28', '2012-06-28', 1),
(32, 77, 7, 7, 60000, 10000.00, 0.00, 0.00, 7, 5, 60000, '2011-09-11', NULL, '1969-12-31', NULL, NULL, 75251.3, 60, 1000, '2011-09-11', '2011-09-11', 1),
(33, 78, 7, 7, 60000, 12000.00, 0.00, 0.00, 7, 5, 60000, '2012-02-06', NULL, '1969-12-31', NULL, NULL, 75250.7, 60, 1000, '2012-02-06', '2012-02-06', 1),
(34, 80, 7, 4, 66960, 27260.33, 0.00, 0.00, 7, 5, 33480, '2000-10-02', 33480, '2000-12-17', NULL, NULL, 100719, 120, 558, '2000-10-02', '2000-10-02', 1),
(35, 81, 7, 4, 71280, 37414.00, 0.00, 0.00, 7, 5, 35640, '2002-07-16', 35640, '2002-10-19', NULL, NULL, 107219, 120, 594, '2002-07-16', '2002-07-16', 1),
(36, 83, 7, 7, 60000, 44000.00, 0.00, 0.00, 7, 5, 60000, '2015-03-11', NULL, '1969-12-31', NULL, NULL, 75251.3, 60, 1000, '2015-03-11', '2015-03-11', 1),
(37, 86, 7, 4, 69120, 38444.00, 0.00, 0.00, 7, 5, 34560, '2001-07-22', 34560, '2001-11-01', NULL, NULL, 103970, 120, 576, '2001-07-22', '2001-07-22', 1),
(38, 87, 7, 7, 60000, 55000.00, 0.00, 0.00, 7, 5, 30600, '2000-10-03', NULL, '1969-12-31', NULL, NULL, 92055.4, 60, 1000, '2016-04-05', '2016-04-05', 1),
(39, 89, 7, 4, 64800, 32930.00, 0.00, 0.00, 7, 5, 32400, '2002-07-16', 32400, '2002-10-19', NULL, NULL, 97471.8, 120, 540, '2002-07-16', '2002-07-16', 1),
(40, 89, 7, 7, 60000, 0.00, 1000.00, 0.00, 7, 5, 60000, '2008-06-30', NULL, '1969-12-31', NULL, NULL, 75253.7, 60, 1000, '2008-06-30', '2008-06-30', 1),
(41, 90, 7, 4, 54000, 0.00, 0.00, 0.00, 7, 5, 27000, '2003-10-25', 27000, '2003-11-08', NULL, NULL, 81228.4, 120, 450, '2003-10-25', '2003-10-25', 1),
(42, 91, 7, 4, 59400, 24724.00, 0.00, 0.00, 7, 5, 29700, '2001-01-11', 29700, '2001-04-25', NULL, NULL, 89348.9, 120, 495, '2001-01-11', '2001-01-11', 1),
(43, 94, 7, 4, 71280, 29643.10, 0.00, 0.00, 7, 5, 35640, '2001-01-11', 35640, '2001-04-30', NULL, NULL, 107218, 120, 594, '2001-01-11', '2001-01-11', 1),
(45, 98, 7, 4, 63000, 60900.00, 0.00, 0.00, 7, 5, 31500, '2002-07-16', 31500, '0000-00-00', NULL, NULL, 94764.4, 120, 525, '2002-07-16', '2002-07-16', 1),
(46, 100, 7, 4, 60000, 25000.00, 0.00, 0.00, 7, 5, 60000, '2015-03-11', NULL, '1969-12-31', NULL, NULL, 67751.3, 30, 2000, '2015-03-11', '2015-03-11', 1),
(47, 103, 7, 4, 83600, 35318.00, 0.00, 0.00, 7, 5, 41800, '2001-01-01', 41800, '2001-02-04', NULL, NULL, 125748, 120, 697, '2001-01-01', '2001-01-01', 1),
(48, 103, 7, 7, 60000, 17000.00, 0.00, 0.00, 7, 5, 60000, '2012-06-28', NULL, '1969-12-31', NULL, NULL, 75253.4, 60, 1000, '2012-06-28', '2012-06-28', 1),
(49, 112, 7, 4, 61200, 24995.00, 0.00, 0.00, 7, 5, 30600, '2001-02-12', 30600, '2001-07-17', NULL, NULL, 92056.5, 120, 510, '2001-02-12', '2001-02-12', 1),
(50, 115, 7, 4, 88560, 738.00, 0.00, 0.00, 7, 5, 44280, '2001-02-12', 44280, '2001-09-04', NULL, NULL, 133210, 120, 738, '2001-02-12', '2001-02-12', 1),
(51, 117, 7, 4, 97560, 52373.00, 0.00, 0.00, 7, 5, 48780, '2003-08-23', 48780, '2003-09-07', NULL, NULL, 146748, 120, 813, '2003-08-23', '2003-08-23', 1),
(52, 119, 7, 4, 88560, 34747.50, 0.00, 0.00, 7, 5, 44280, '2001-02-12', 44280, '2001-09-09', NULL, NULL, 133210, 120, 738, '2001-02-12', '2001-02-12', 1),
(53, 120, 7, 4, 86940, 37474.50, 0.00, 0.00, 7, 5, 43470, '2002-09-14', 43470, '2003-11-22', NULL, NULL, 130773, 120, 725, '2002-09-14', '2002-09-14', 1),
(54, 125, 7, 4, 41580, 2.00, 0.00, 0.00, 7, 5, 41580, '2003-10-11', NULL, '1969-12-31', NULL, NULL, 62545.2, 120, 346, '2003-10-11', '2003-10-11', 1),
(55, 126, 7, 4, 105480, 53474.00, 0.00, 0.00, 7, 5, 52740, '2003-01-04', 52740, '2003-03-11', NULL, NULL, 158660, 120, 879, '2003-01-04', '2003-01-04', 1),
(56, 127, 7, 4, 120000, 62000.00, 0.00, 0.00, 7, 5, 60000, '2010-02-04', 60000, '2010-12-13', NULL, NULL, 180500, 120, 1000, '2010-02-04', '2010-02-04', 1),
(57, 133, 7, 4, 61260, 23202.00, 0.00, 0.00, 7, 5, 30630, '2000-09-25', 30630, '2000-12-17', NULL, NULL, 92148.3, 120, 510, '2000-09-25', '2000-09-25', 1),
(58, 135, 7, 4, 69120, 0.00, 2016.00, 864.00, 7, 5, 34560, '2003-08-23', 34560, '2003-10-16', NULL, NULL, 103970, 120, 576, '2003-08-23', '2003-08-23', 1),
(59, 138, 7, 7, 60000, 0.00, 1750.00, 750.00, 7, 5, 60000, '2011-03-27', NULL, '1969-12-31', NULL, NULL, 75253.3, 60, 1000, '2011-03-27', '2011-03-27', 1),
(60, 153, 7, 8, 35000, 4195.00, 0.00, 0.00, 7, 5, 29, '2011-03-29', NULL, NULL, NULL, NULL, 42151.9, 48, 730, '2011-03-29', '2011-03-29', 1),
(61, 139, 7, 7, 60000, 40000.00, 0.00, 0.00, 7, 5, 60000, '2014-09-23', NULL, '1969-12-31', NULL, NULL, 75252.8, 60, 1000, '2014-09-23', '2014-09-23', 1),
(62, 140, 7, 7, 60000, 31000.00, 0.00, 0.00, 7, 5, 60000, '2010-02-04', NULL, '1969-12-31', NULL, NULL, 75250.5, 60, 1000, '2010-02-04', '2010-02-04', 1),
(63, 162, 7, 8, 35000, 32810.00, 0.00, 0.00, 7, 5, 5, '2016-04-05', NULL, NULL, NULL, NULL, 42146.9, 48, 730, '2016-04-05', '2016-04-05', 1),
(64, 142, 7, 4, 59400, 22156.00, 0.00, 0.00, 7, 5, 29700, '2011-07-22', 29700, '2001-10-30', NULL, NULL, 89350.2, 120, 495, '2011-07-22', '2011-07-22', 1),
(65, 142, 7, 7, 60000, 19000.00, 0.00, 0.00, 7, 5, 60000, '2003-01-20', NULL, '1969-12-31', NULL, NULL, 75252.4, 60, 1000, '2003-01-20', '2003-01-20', 1),
(66, 152, 7, 8, 35000, 32810.00, 0.00, 0.00, 7, 5, 5, '2016-04-05', NULL, NULL, NULL, NULL, 42146.9, 48, 730, '2016-04-05', '2016-04-05', 1),
(67, 165, 7, 8, 35000, 17480.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(68, 171, 7, 8, 35000, 5800.00, 0.00, 0.00, 7, 5, 35000, '2012-06-28', NULL, NULL, NULL, NULL, 42151.7, 48, 730, '2012-06-28', '2012-06-28', 1),
(69, 144, 7, 4, 120000, 108000.00, 0.00, 0.00, 7, 5, 60000, '2014-01-02', 60000, '2014-12-14', NULL, NULL, 180500, 120, 1000, '2014-01-02', '2014-01-02', 1),
(70, 10, 7, 8, 35000, 31350.00, 0.00, 0.00, 7, 5, 35000, '2016-04-05', NULL, NULL, NULL, NULL, 42146.9, 48, 730, '2016-04-05', '2016-04-05', 1),
(71, 145, 7, 7, 60000, 3035.00, 0.00, 0.00, 7, 5, 60000, '2002-06-28', NULL, '1969-12-31', NULL, NULL, 75253.4, 60, 1000, '2002-06-28', '2002-06-28', 1),
(72, 38, 7, 8, 35000, 7260.00, 0.00, 0.00, 7, 5, 35000, '2013-01-14', NULL, NULL, NULL, NULL, 42148.8, 48, 730, '2013-01-14', '2013-01-14', 1),
(73, 148, 7, 4, 115020, 54948.00, 0.00, 0.00, 7, 5, 57510, '2001-07-22', 57510, '2001-10-31', NULL, NULL, 173011, 120, 958, '2001-07-22', '2001-07-22', 1),
(74, 39, 7, 8, 35000, 13830.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(75, 150, 7, 4, 61200, 24145.37, 0.00, 0.00, 7, 5, 30600, '2000-06-08', 30600, '2000-08-13', NULL, NULL, 92056, 120, 510, '2000-06-08', '2000-06-08', 1),
(76, 42, 7, 8, 35000, 24050.00, 0.00, 0.00, 7, 5, 35000, '2015-03-31', NULL, NULL, NULL, NULL, 42152.3, 48, 730, '2015-03-31', '2015-03-31', 1),
(78, 151, 7, 4, 63000, 27337.74, 0.00, 0.00, 7, 5, 31500, '2001-01-01', 31500, '2001-04-23', NULL, NULL, 94762.5, 120, 525, '2001-01-01', '2001-01-01', 1),
(79, 151, 7, 7, 60000, 11000.00, 0.00, 0.00, 7, 5, 60000, '2011-09-11', NULL, '1969-12-31', NULL, NULL, 75251.3, 60, 1000, '2011-09-11', '2011-09-11', 1),
(80, 156, 7, 7, 60000, 0.00, 1000.00, 0.00, 7, 5, 60000, '2008-06-30', NULL, NULL, NULL, NULL, 75253.7, 60, 1000, '2008-06-30', '2008-06-30', 1),
(81, 158, 7, 4, 110340, 0.00, 5287.13, 0.00, 7, 5, 55170, '2002-10-26', 55170, '2002-11-27', NULL, NULL, 165971, 120, 91920, '2002-10-26', '2002-10-26', 1),
(82, 45, 7, 8, 35000, 31350.00, 0.00, 0.00, 7, 5, 35000, '2016-04-05', NULL, NULL, NULL, NULL, 42146.9, 48, 730, '2016-04-05', '2016-04-05', 1),
(83, 159, 7, 4, 60000, 20000.00, 0.00, 0.00, 7, 5, 60000, '2011-09-14', NULL, '1969-12-31', NULL, NULL, 75251.7, 60, 1000, '2011-09-14', '2011-09-14', 1),
(84, 48, 7, 8, 35000, 24070.00, 0.00, 0.00, 7, 5, 35000, '2015-03-31', NULL, NULL, NULL, NULL, 42152.3, 48, 730, '2015-03-31', '2015-03-31', 1),
(85, 49, 7, 8, 35000, 2045.00, 0.00, 0.00, 7, 5, 35000, '2011-03-29', NULL, NULL, NULL, NULL, 42151.9, 48, 730, '2011-03-29', '2011-03-29', 1),
(86, 160, 7, 4, 90180, 53913.00, 0.00, 0.00, 7, 5, 45090, '2002-11-05', 45090, '2003-02-04', NULL, NULL, 135646, 120, 752, '2002-11-05', '2002-11-05', 1),
(87, 162, 7, 4, 120000, 111000.00, 0.00, 0.00, 7, 5, 60000, '2014-10-02', 60000, '2014-12-14', NULL, NULL, 180500, 120, 1000, '2014-10-02', '2014-10-02', 1),
(88, 58, 7, 8, 35000, 7260.00, 0.00, 0.00, 7, 5, 35000, '2013-01-14', NULL, NULL, NULL, NULL, 42148.8, 48, 730, '2013-01-14', '2013-01-14', 1),
(89, 164, 7, 4, 120000, 43000.00, 0.00, 0.00, 7, 5, 60000, '2007-12-19', 60000, '2008-07-13', NULL, NULL, 180501, 120, 1000, '2007-12-19', '2007-12-19', 1),
(90, 60, 7, 8, 35000, 15290.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(91, 165, 7, 4, 120000, 97000.00, 0.00, 0.00, 7, 5, 60000, '2003-01-22', 60000, '2013-02-25', NULL, NULL, 180501, 120, 1000, '2003-01-22', '2003-01-22', 1),
(92, 166, 7, 4, 120000, 85000.00, 0.00, 0.00, 7, 5, 60000, '2012-01-30', 60000, '2012-01-09', NULL, NULL, 180502, 120, 1000, '2012-01-30', '2012-01-30', 1),
(93, 62, 7, 8, 35000, 15290.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(94, 169, 7, 7, 60000, 58000.00, 0.00, 0.00, 7, 5, 60000, '2016-04-05', NULL, '1969-12-31', NULL, NULL, 75250.6, 60, 1000, '2016-04-05', '2016-04-05', 1),
(95, 70, 7, 8, 35000, 10910.00, 0.00, 0.00, 7, 5, 35000, '2013-06-07', NULL, NULL, NULL, NULL, 42147.3, 48, 730, '2013-06-07', '2013-06-07', 1),
(96, 170, 7, 4, 110340, 3540.00, 0.00, 0.00, 7, 5, 55170, '2007-01-21', 55170, '2004-04-26', NULL, NULL, 165971, 120, 920, '2007-01-21', '2007-01-21', 1),
(97, 72, 7, 8, 35000, 0.00, 583.33, 0.00, 7, 5, 35000, '2010-06-29', NULL, NULL, NULL, NULL, 42151.9, 48, 730, '2010-06-29', '2010-06-29', 1),
(98, 178, 7, 7, 60000, 25000.00, 0.00, 0.00, 7, 5, 60000, '2013-11-10', NULL, '1969-12-31', NULL, NULL, 75251.2, 60, 1000, '2013-11-10', '2013-11-10', 1),
(99, 179, 7, 4, 63000, 27831.26, 0.00, 0.00, 7, 5, 31500, '2001-01-01', 31500, '2001-04-30', NULL, NULL, 94762.5, 120, 525, '2001-01-01', '2001-01-01', 1),
(100, 73, 7, 8, 35000, 10910.00, 0.00, 0.00, 7, 5, 35000, '2013-06-27', NULL, NULL, NULL, NULL, 42151.5, 48, 730, '2013-06-27', '2013-06-27', 1),
(101, 74, 7, 8, 35000, 0.00, 1895.83, 0.00, 7, 5, 35000, '2011-09-08', NULL, NULL, NULL, NULL, 42147.5, 48, 730, '2011-09-08', '2011-09-08', 1),
(102, 180, 7, 4, 105840, 44874.06, 0.00, 0.00, 7, 5, 52920, '2002-06-06', 52920, '2002-12-06', NULL, NULL, 159201, 120, 1000, '2002-06-06', '2002-06-06', 1),
(103, 79, 7, 8, 35000, 24050.00, 0.00, 0.00, 7, 1, 35000, '2015-03-31', NULL, NULL, NULL, NULL, 42152.3, 48, 730, '2015-03-31', '2015-03-31', 1),
(105, 84, 7, 8, 35000, 24050.00, 0.00, 0.00, 7, 5, 35000, '2015-03-31', NULL, NULL, NULL, NULL, 42152.3, 48, 730, '2015-03-31', '2015-03-31', 1),
(106, 188, 7, 4, 66600, 41564.61, 0.00, 0.00, 7, 5, 33300, '2002-10-26', 333000, '2002-11-19', NULL, NULL, 100180, 120, 555, '2002-10-26', '2002-10-26', 1),
(107, 88, 7, 8, 35000, 7990.00, 0.00, 0.00, 7, 5, 35000, '2013-06-27', NULL, NULL, NULL, NULL, 42151.5, 48, 730, '2013-06-27', '2013-06-27', 1),
(108, 89, 7, 8, 35000, 13100.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(109, 189, 7, 4, 81780, 11560.07, 0.00, 0.00, 7, 5, 40890, '2001-07-31', 40890, '2001-09-03', NULL, NULL, 123014, 120, 782, '2001-07-31', '2001-07-31', 1),
(110, 95, 7, 8, 35000, 31350.00, 0.00, 0.00, 7, 5, 35000, '2016-04-05', NULL, NULL, NULL, NULL, 42146.9, 48, 730, '2016-04-05', '2016-04-05', 1),
(111, 96, 7, 8, 35000, 31350.00, 0.00, 0.00, 7, 5, 35000, '2016-04-05', NULL, NULL, NULL, NULL, 42146.9, 48, 730, '2016-04-05', '2016-04-05', 1),
(112, 191, 7, 4, 97560, 2439.00, 0.00, 0.00, 7, 5, 48780, '2003-09-17', 48780, '2003-10-11', NULL, NULL, 146748, 120, 813, '2003-09-17', '2003-09-17', 1),
(113, 105, 7, 8, 35000, 15290.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(114, 198, 7, 4, 120000, 85000.00, 0.00, 0.00, 7, 5, 60000, '2012-01-30', 60000, '2012-02-09', NULL, NULL, 180502, 120, 1000, '2012-01-30', '2012-01-30', 1),
(115, 106, 7, 8, 35000, 5070.00, 0.00, 0.00, 7, 5, 35000, '2009-01-07', NULL, NULL, NULL, NULL, 42147.3, 48, 730, '2009-01-07', '2009-01-07', 1),
(116, 204, 7, 7, 60000, 21267.00, 0.00, 0.00, 7, 5, 60000, '2008-06-30', NULL, '1969-12-31', NULL, NULL, 75253.7, 60, 1000, '2008-06-30', '2008-06-30', 1),
(117, 206, 7, 4, 120000, 39000.00, 0.00, 0.00, 7, 5, 60000, '2007-06-25', 60000, '2008-02-12', NULL, NULL, 180502, 120, 1000, '2007-06-25', '2007-06-25', 1),
(118, 108, 7, 8, 35000, 10910.00, 0.00, 0.00, 7, 5, 35000, '2013-06-27', NULL, NULL, NULL, NULL, 42151.5, 48, 730, '2013-06-27', '2013-06-27', 1),
(119, 110, 7, 8, 35000, 2735.00, 0.00, 0.00, 7, 5, 35000, '2011-03-29', NULL, NULL, NULL, NULL, 42151.9, 48, 730, '2011-03-29', '2011-03-29', 1),
(120, 208, 7, 7, 60000, 20000.00, 0.00, 0.00, 7, 5, 60000, '1970-01-01', NULL, '1969-12-31', NULL, NULL, 75250, 60, 1000, '2012-06-28', '2012-06-28', 1),
(121, 111, 7, 8, 35000, 2880.00, 0.00, 0.00, 7, 5, 35000, '2012-06-28', NULL, NULL, NULL, NULL, 42151.7, 48, 730, '2012-06-28', '2012-06-28', 1),
(122, 210, 7, 4, 80280, 48483.88, 0.00, 0.00, 7, 5, 40140, '2003-09-20', 40140, '2003-10-15', NULL, NULL, 120756, 120, 669, '2003-09-20', '2003-09-20', 1),
(123, 118, 7, 8, 35000, 15290.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(124, 122, 7, 8, 35000, 690.00, 0.00, 0.00, 7, 5, 35000, '2012-02-07', NULL, NULL, NULL, NULL, 42147.3, 48, 730, '2012-02-07', '2012-02-07', 1),
(125, 127, 7, 8, 35000, 690.00, 0.00, 0.00, 7, 5, 35000, '2012-06-28', NULL, NULL, NULL, NULL, 42151.7, 48, 730, '2012-06-28', '2012-06-28', 1),
(126, 131, 7, 8, 35000, 7260.00, 0.00, 0.00, 7, 5, 35000, '2013-01-14', NULL, NULL, NULL, NULL, 42148.8, 48, 730, '2013-01-14', '2006-07-19', 1),
(127, 134, 7, 8, 35000, 10910.00, 0.00, 0.00, 7, 5, 35000, '2013-06-27', NULL, NULL, NULL, NULL, 42151.5, 48, 730, '2013-06-27', '2013-06-27', 1),
(128, 136, 7, 8, 35000, 24050.00, 0.00, 0.00, 7, 5, 35000, '2015-03-31', NULL, NULL, NULL, NULL, 42152.3, 48, 730, '2015-03-31', '2015-03-31', 1),
(129, 137, 7, 8, 35000, 0.00, 1020.83, 0.00, 7, 5, 35000, '2011-03-29', NULL, NULL, NULL, NULL, 42151.9, 48, 730, '2011-03-29', '2011-03-29', 1),
(130, 141, 7, 8, 35000, 23320.00, 0.00, 0.00, 7, 5, 35000, '2015-03-31', NULL, NULL, NULL, NULL, 42152.3, 48, 730, '2015-03-31', '2015-03-31', 1),
(131, 172, 7, 8, 35000, 5800.00, 0.00, 0.00, 7, 5, 35000, '2012-06-28', NULL, NULL, NULL, NULL, 42151.7, 48, 730, '2012-06-28', '2012-06-28', 1),
(132, 175, 7, 8, 35000, 26240.00, 0.00, 0.00, 7, 5, 35000, '2015-03-31', NULL, NULL, NULL, NULL, 42152.3, 48, 730, '2015-03-31', '2015-03-31', 1),
(133, 183, 7, 8, 35000, 4925.00, 0.00, 0.00, 7, 5, 35000, '2011-03-29', NULL, NULL, NULL, NULL, 42151.9, 48, 730, '2011-03-29', '2011-03-29', 1),
(134, 186, 7, 8, 35000, 17480.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(135, 10, 7, 5, 50000, 45000.00, 0.00, 0.00, 7, 5, 50000, '2016-04-05', NULL, NULL, NULL, NULL, 60625.7, 50, 1000, '2016-04-05', '2016-04-05', 1),
(136, 185, 7, 8, 35000, 17480.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(137, 20, 7, 5, 50000, 28000.00, 0.00, 0.00, 7, 5, 50000, '2014-10-02', NULL, NULL, NULL, NULL, 60625.3, 50, 1000, '2014-10-02', '2014-10-02', 1),
(138, 22, 7, 5, 50000, 45000.00, 0.00, 0.00, 7, 5, 50000, '2016-04-05', NULL, NULL, NULL, NULL, 60625.7, 50, 1000, '2016-04-05', '2016-04-05', 1),
(139, 23, 7, 5, 50000, 12000.00, 0.00, 0.00, 7, 5, 50000, '2013-06-27', NULL, NULL, NULL, NULL, 60628.9, 50, 1000, '2013-06-27', '2013-06-27', 1),
(140, 182, 7, 8, 35000, 22590.00, 0.00, 0.00, 7, 5, 35000, '2014-09-23', NULL, NULL, NULL, NULL, 42150.6, 48, 730, '2014-09-23', '2014-09-23', 1),
(141, 29, 7, 5, 50000, 2000.00, 0.00, 0.00, 7, 5, 50000, '2011-09-12', NULL, NULL, NULL, NULL, 60626.8, 50, 1000, '2011-09-12', '2011-09-12', 1),
(142, 30, 7, 5, 50000, 6000.00, 0.00, 0.00, 7, 5, 50000, '2013-01-24', NULL, NULL, NULL, NULL, 60628.5, 50, 1000, '2013-01-24', '2013-01-24', 1),
(143, 193, 7, 8, 35000, 5800.00, 0.00, 0.00, 7, 5, 35000, '2012-06-28', NULL, NULL, NULL, NULL, 42151.7, 48, 730, '2012-06-28', '2012-06-28', 1),
(144, 194, 7, 8, 35000, 15290.00, 0.00, 0.00, 7, 5, 35000, '2013-06-27', NULL, NULL, NULL, NULL, 42151.5, 48, 730, '2013-06-27', '2013-06-27', 1),
(145, 198, 7, 8, 35000, 17480.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(146, 199, 7, 8, 35000, 15290.00, 0.00, 0.00, 7, 5, 35000, '2013-06-27', NULL, NULL, NULL, NULL, 42151.5, 48, 730, '2013-06-27', '2013-06-27', 1),
(147, 200, 7, 8, 35000, 9450.00, 0.00, 0.00, 7, 5, 35000, '2013-01-14', NULL, NULL, NULL, NULL, 42148.8, 48, 730, '2013-01-14', '2013-01-14', 1),
(148, 201, 7, 8, 35000, 17480.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(149, 203, 7, 8, 35000, 13100.00, 0.00, 0.00, 7, 5, 35000, '2013-06-27', NULL, NULL, NULL, NULL, 42151.5, 48, 730, '2013-06-27', '2013-06-27', 1),
(150, 205, 7, 8, 35000, 33540.00, 0.00, 0.00, 7, 5, 35000, '2016-04-05', NULL, NULL, NULL, NULL, 42146.9, 48, 730, '2016-04-05', '2016-04-05', 1),
(151, 206, 7, 8, 35000, 0.00, 0.00, -1420.00, 7, 5, 35000, '2011-09-11', NULL, NULL, NULL, NULL, 42148.1, 48, 730, '2011-09-11', '2011-09-11', 1),
(152, 212, 7, 8, 35000, 17480.00, 0.00, 0.00, 7, 5, 35000, '2014-02-06', NULL, NULL, NULL, NULL, 42147.1, 48, 730, '2014-02-06', '2014-02-06', 1),
(153, 213, 7, 8, 35000, 0.00, 0.00, -1420.00, 7, 5, 35000, '2011-09-08', NULL, NULL, NULL, NULL, 42147.5, 48, 730, '2011-09-08', '2011-09-08', 1),
(154, 5, 8, 6, 200000, 183332.00, 0.00, 0.00, 7, 5, 41667, '2016-07-01', NULL, NULL, NULL, NULL, 253084, 48, 4167, '2013-04-01', '2013-04-10', 1),
(155, 10, 8, 6, 196000, 179664.00, 0.00, 0.00, 7, 5, 4084, '2015-12-01', NULL, NULL, NULL, NULL, 248022, 48, 4084, '2015-10-05', '2015-10-19', 1),
(156, 144, 8, 6, 86000, 77400.00, 0.00, 0.00, 7, 5, 2150, '2016-04-01', NULL, NULL, NULL, NULL, 105100, 40, 2150, '2016-02-22', '2016-03-06', 1),
(157, 145, 8, 6, 132698, 117446.00, 0.00, 0.00, 7, 5, 3813, '2016-08-01', NULL, NULL, NULL, NULL, 158574, 35, 3813, '2016-07-15', '2016-08-01', 1),
(158, 160, 8, 6, 205200, 196992.00, 0.00, 0.00, 7, 5, 4104, '2017-08-01', NULL, NULL, NULL, NULL, 261887, 50, 4104, '2016-06-04', '2016-06-19', 1),
(159, 180, 8, 6, 91000, 85485.00, 0.00, 0.00, 7, 5, 5515, '2015-12-01', NULL, NULL, NULL, NULL, 99873.6, 17, 5515, '2015-10-04', '2015-10-19', 1),
(160, 186, 8, 6, 138965, 136069.00, 0.00, 0.00, 7, 5, 2896, '2016-04-01', NULL, NULL, NULL, NULL, 175849, 48, 2896, '2016-01-05', '2016-01-20', 1),
(161, 188, 8, 6, 143940, 141061.00, 0.00, 0.00, 7, 5, 2879, '2016-08-01', NULL, NULL, NULL, NULL, 183704, 50, 2879, '2016-06-04', '2016-06-19', 1),
(162, 191, 8, 6, 60000, 58750.00, 0.00, 0.00, 7, 5, 1250, '2015-11-01', NULL, NULL, NULL, NULL, 75926.8, 48, 1250, '2015-10-04', '2015-10-19', 1),
(163, 198, 8, 6, 71817, 70380.00, 0.00, 0.00, 7, 5, 1437, '2016-08-01', NULL, NULL, NULL, NULL, 91657.9, 50, 1437, '2016-06-04', '2016-06-19', 1),
(164, 203, 8, 6, 30000, 29250.00, 0.00, 0.00, 7, 5, 750, '2015-12-01', NULL, NULL, NULL, NULL, 36663.6, 40, 750, '2015-09-21', '2015-10-06', 1),
(165, 204, 8, 6, 106200, 103545.00, 0.00, 0.00, 7, 5, 2655, '2014-08-01', NULL, NULL, NULL, NULL, 129787, 40, 2655, '2013-12-14', '2013-12-26', 1),
(166, 12, 8, 6, 170000, 155832.00, 0.00, 0.00, 7, 5, 170000, '2012-10-19', NULL, NULL, NULL, NULL, 215121, 48, 3542, '2012-10-10', '2012-10-19', 1),
(167, 205, 8, 6, 40000, 39166.00, 0.00, 0.00, 7, 5, 834, '2015-12-01', NULL, NULL, NULL, NULL, 50619.9, 48, 834, '2015-10-13', '2015-10-23', 1),
(169, 214, 8, 6, 122411, 120145.00, 0.00, 0.00, 7, 5, 2266, '2016-08-01', NULL, NULL, NULL, NULL, 158879, 54, 2266, '2016-07-15', '2016-08-01', 1),
(170, 22, 8, 6, 366459, 0.00, 21834.85, 0.00, 7, 5, 366459, '2015-11-22', NULL, NULL, NULL, NULL, 463724, 48, 7635, '2015-11-22', '2015-11-22', 1),
(171, 148, 8, 6, 107700, 103392.00, 0.00, 0.00, 7, 5, 2154, '2009-12-10', NULL, NULL, NULL, NULL, 136286, 48, 2154, '2009-11-28', '2009-12-10', 1),
(172, 24, 8, 6, 347000, 0.00, 3759.17, 0.00, 7, 5, 347000, '2015-08-09', NULL, NULL, NULL, NULL, 439100, 48, 72230, '2015-08-09', '2015-08-09', 1),
(173, 23, 8, 6, 60000, 0.00, 650.00, 0.00, 7, 5, 60000, '2015-08-09', NULL, NULL, NULL, NULL, 73325.8, 40, 1500, '2014-09-16', '2015-08-09', 1),
(174, 25, 8, 6, 294509, 0.00, 6381.03, 0.00, 7, 5, 294509, '2016-06-19', NULL, NULL, NULL, NULL, 375867, 50, 5891, '2016-06-19', '2016-06-19', 1),
(175, 26, 8, 6, 100000, 0.00, 4875.00, 0.00, 7, 5, 100000, '2015-01-06', NULL, NULL, NULL, NULL, 122209, 40, 2500, '2015-01-06', '2015-01-06', 1),
(176, 29, 8, 6, 165000, 0.00, 2681.25, 0.00, 7, 5, 165000, '2016-07-18', NULL, NULL, NULL, NULL, 208794, 48, 34378, '2016-07-18', '2016-07-18', 1),
(177, 32, 8, 6, 241000, 0.00, 11748.75, 0.00, 7, 5, 241000, '2015-01-06', NULL, NULL, NULL, NULL, 304966, 48, 5025, '2015-01-06', '2015-01-06', 1),
(178, 35, 7, 4, 120000, 82000.00, 0.00, 0.00, 7, 5, 60000, '2012-02-02', 60000, '2012-03-25', NULL, NULL, 98717.2, 120, 1000, '2012-02-02', '2012-02-02', 1),
(179, 36, 8, 6, 88000, 63880.00, 0.00, 0.00, 7, 5, 6030, '2015-12-01', NULL, NULL, NULL, NULL, 95151.1, 14, 6030, '2015-10-04', '2015-10-19', 1),
(180, 37, 8, 6, 188697, 172969.00, 0.00, 0.00, 7, 5, 3932, '2016-04-28', NULL, NULL, NULL, NULL, 238781, 48, 3932, '2016-04-14', '2016-04-28', 1),
(181, 38, 8, 6, 75862, 69790.00, 0.00, 0.00, 7, 5, 1518, '2017-02-01', NULL, NULL, NULL, NULL, 96821, 50, 1518, '2016-12-14', '2016-12-28', 1),
(182, 40, 8, 6, 130999, 120079.00, 0.00, 0.00, 7, 5, 2730, '2013-07-29', NULL, NULL, NULL, NULL, 165770, 48, 2730, '2013-07-14', '2013-07-29', 1),
(183, 41, 8, 6, 125256, 114816.00, 0.00, 0.00, 7, 5, 125265, '2013-07-29', NULL, NULL, NULL, NULL, 158502, 48, 2610, '2014-07-20', '2013-07-29', 1),
(185, 42, 8, 6, 113220, 0.00, 7972.58, 0.00, 7, 5, 113220, '2020-08-14', NULL, NULL, NULL, NULL, 141431, 45, 2516, '2014-01-13', '2014-01-13', 1),
(186, 43, 8, 6, 55000, 0.00, 4170.83, 0.00, 7, 5, 55000, '2015-09-02', NULL, NULL, NULL, NULL, 67214.8, 40, 1375, '2015-09-02', '2015-09-02', 1),
(187, 151, 8, 6, 76436, 73038.00, 0.00, 0.00, 7, 5, 76436, '2014-05-20', NULL, NULL, NULL, NULL, 95482.8, 45, 1699, '2014-05-05', '2014-05-20', 1),
(188, 155, 8, 6, 126299, 121035.00, 0.00, 0.00, 7, 5, 126299, '2015-07-20', NULL, NULL, NULL, NULL, 159822, 48, 2632, '2015-07-05', '2015-07-20', 1),
(189, 189, 8, 6, 197000, 192895.00, 0.00, 0.00, 7, 5, 197000, '2015-04-23', NULL, NULL, NULL, NULL, 249288, 48, 4105, '2015-04-08', '2015-04-23', 1),
(190, 161, 8, 6, 190000, 182084.00, 0.00, 0.00, 7, 5, 190000, '2015-10-19', NULL, NULL, NULL, NULL, 240430, 48, 3958, '2015-10-04', '2015-10-19', 1),
(191, 166, 8, 6, 54000, 52650.00, 0.00, 0.00, 7, 5, 54000, '2015-02-10', NULL, NULL, NULL, NULL, 65993.5, 40, 1350, '2015-01-25', '2015-02-10', 1),
(192, 178, 8, 6, 163000, 159604.00, 0.00, 0.00, 7, 5, 163000, '2015-01-06', NULL, NULL, NULL, NULL, 206263, 48, 3396, '2014-12-16', '2015-01-06', 1),
(193, 179, 8, 6, 124000, 121416.00, 0.00, 0.00, 7, 5, 124000, '2015-05-10', NULL, NULL, NULL, NULL, 156912, 48, 2584, '2015-04-25', '2015-05-10', 1),
(194, 183, 8, 6, 87000, 84825.00, 0.00, 0.00, 7, 5, 87000, '2015-02-15', NULL, NULL, NULL, NULL, 106322, 40, 2175, '2015-02-01', '2015-02-15', 1),
(195, 185, 8, 6, 43753, 42728.00, 0.00, 0.00, 7, 5, 43753, '2015-03-04', NULL, NULL, NULL, NULL, 54181.3, 43, 1025, '2015-02-22', '2015-03-04', 1),
(196, 187, 8, 6, 163039, 159642.00, 0.00, 0.00, 7, 5, 163039, '2013-10-02', NULL, NULL, NULL, NULL, 206312, 48, 3397, '2013-09-16', '2013-10-02', 1),
(197, 48, 8, 6, 106000, 0.00, 8038.33, 0.00, 7, 5, 106000, '2015-09-02', NULL, NULL, NULL, NULL, 134134, 48, 2209, '2015-09-02', '2015-09-02', 1),
(198, 49, 8, 6, 68000, 0.00, 2578.33, 0.00, 7, 5, 68000, '2015-03-04', NULL, NULL, NULL, NULL, 86048.7, 48, 1417, '2015-03-04', '2015-03-04', 1),
(199, 54, 8, 6, 222947, 0.00, 8371.30, 0.00, 7, 5, 176000, '2016-04-10', 48947, '0000-00-00', NULL, NULL, 282121, 48, 4645, '2016-04-10', '2016-04-10', 1),
(200, 56, 8, 6, 102000, 0.00, 4972.50, 0.00, 7, 5, 102000, '2015-01-10', NULL, NULL, NULL, NULL, 170511, 48, 2125, '2015-01-10', '2015-01-10', 1),
(201, 57, 8, 6, 135000, 0.00, 4387.50, 0.00, 7, 5, 135000, '2015-04-23', NULL, NULL, NULL, NULL, 170832, 48, 2813, '2015-04-23', '2015-04-23', 1),
(202, 58, 8, 6, 57401, 0.00, 3731.07, 0.00, 7, 5, 57401, '2015-10-23', NULL, NULL, NULL, NULL, 72638.4, 48, 1196, '2015-10-23', '2015-10-23', 1),
(203, 60, 8, 6, 18480, 0.00, 1301.30, 0.00, 7, 5, 18480, '2013-09-22', NULL, NULL, NULL, NULL, 22590.8, 40, 462, '2013-09-22', '2013-09-22', 1),
(204, 61, 8, 6, 150000, 0.00, 7312.50, 0.00, 7, 5, 150000, '2015-01-06', NULL, NULL, NULL, NULL, 189813, 48, 3125, '2015-01-06', '2015-01-06', 1),
(205, 63, 8, 6, 86840, 0.00, 3763.07, 0.00, 7, 5, 86840, '2015-02-08', NULL, NULL, NULL, NULL, 106126, 40, 2175, '2015-02-08', '2015-02-08', 1),
(206, 68, 8, 6, 175970, 161302.00, 0.00, 0.00, 7, 5, 175970, '2015-01-06', NULL, NULL, NULL, NULL, 222675, 48, 3667, '2015-01-06', '2015-01-06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_recoveries`
--

CREATE TABLE `employee_recoveries` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `gpf` double(10,2) NOT NULL,
  `gpf_recovery` tinyint(4) NOT NULL,
  `bf` double(10,2) NOT NULL,
  `gi` double(10,2) NOT NULL,
  `gi_recovery` tinyint(4) NOT NULL,
  `fix_gpf` int(11) NOT NULL,
  `fixed_house_rent` double(10,2) NOT NULL,
  `water_supply` int(11) NOT NULL,
  `tax` double(10,2) NOT NULL,
  `tin_shed` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_recoveries`
--

INSERT INTO `employee_recoveries` (`id`, `employee_id`, `gpf`, `gpf_recovery`, `bf`, `gi`, `gi_recovery`, `fix_gpf`, `fixed_house_rent`, `water_supply`, `tax`, `tin_shed`) VALUES
(1, 1, 0.00, 0, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(2, 2, 6084.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(3, 3, 6084.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(4, 4, 5856.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(5, 5, 5603.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(6, 6, 5603.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(7, 7, 4084.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(8, 8, 0.00, 0, 50.00, 30.00, 1, 1, 0.00, 0, 118.51, 0.00),
(9, 9, 4084.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(10, 10, 3889.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(11, 11, 3889.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(12, 12, 3703.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(13, 13, 4084.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(14, 14, 3703.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(15, 15, 3889.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(16, 16, 3703.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(17, 17, 3358.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(18, 18, 2810.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(19, 19, 2548.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(20, 20, 3889.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(21, 21, 3526.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 183.16, 0.00),
(22, 22, 3889.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(23, 23, 3703.00, 1, 50.00, 30.00, 1, 1, 7000.00, 12, 334.00, 0.00),
(24, 24, 3889.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(25, 25, 3703.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(26, 26, 2937.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(27, 27, 2255.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(28, 28, 2810.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(29, 29, 2937.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(30, 30, 2548.00, 1, 50.00, 30.00, 1, 1, 0.00, 0, 334.00, 0.00),
(31, 31, 1853.00, 1, 50.00, 30.00, 1, 1, 0.00, 12, 334.00, 0.00),
(32, 32, 3239.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(33, 33, 2951.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(34, 34, 2255.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(35, 35, 1512.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(36, 36, 1939.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(37, 37, 2147.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(38, 38, 2036.00, 1, 50.00, 0.00, 0, 1, 0.00, 12, 334.00, 0.00),
(39, 39, 1939.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(40, 40, 1511.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(41, 41, 1939.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(42, 42, 1796.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(43, 43, 1249.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(44, 44, 1588.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(45, 45, 1043.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(46, 46, 3445.00, 1, 50.00, 0.00, 0, 1, 1401.00, 12, 0.00, 0.00),
(47, 47, 1710.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(48, 48, 3597.50, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(49, 49, 3427.50, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(50, 50, 1511.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(51, 51, 957.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(52, 52, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 200.00),
(53, 53, 957.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(54, 54, 1371.00, 1, 50.00, 0.00, 0, 1, 1560.00, 8, 0.00, 0.00),
(55, 55, 1200.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(56, 56, 1472.00, 1, 50.00, 0.00, 0, 1, 1413.00, 8, 0.00, 0.00),
(57, 57, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(58, 58, 1260.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(59, 59, 985.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(60, 60, 1260.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(61, 61, 1472.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(62, 62, 1260.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(63, 63, 1472.00, 1, 50.00, 0.00, 0, 1, 0.00, 8, 0.00, 0.00),
(64, 64, 1334.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(65, 65, 0.00, 0, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(66, 67, 1242.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(67, 68, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(68, 69, 1472.00, 1, 50.00, 0.00, 0, 1, 1476.00, 8, 0.00, 0.00),
(69, 70, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(70, 71, 1472.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(71, 72, 1472.00, 1, 50.00, 0.00, 0, 1, 1476.00, 0, 0.00, 0.00),
(72, 73, 1260.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(73, 74, 1260.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(74, 75, 1472.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(75, 76, 1472.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(76, 77, 1401.00, 1, 50.00, 0.00, 0, 1, 1560.00, 8, 0.00, 0.00),
(77, 78, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 200.00),
(78, 79, 1200.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(79, 80, 1472.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(80, 81, 1401.00, 1, 50.00, 0.00, 0, 1, 1413.00, 8, 0.00, 0.00),
(81, 82, 1472.00, 1, 50.00, 0.00, 0, 1, 1476.00, 8, 0.00, 0.00),
(82, 83, 1472.00, 1, 50.00, 0.00, 0, 1, 1413.00, 8, 0.00, 0.00),
(83, 84, 1472.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(84, 85, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(85, 86, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(86, 87, 1472.00, 1, 50.00, 0.00, 0, 1, 1413.00, 8, 0.00, 0.00),
(87, 88, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(88, 89, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(89, 90, 1334.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(90, 91, 1334.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(91, 92, 1305.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(92, 93, 1472.00, 1, 50.00, 0.00, 0, 1, 1401.00, 8, 0.00, 0.00),
(93, 94, 1472.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(94, 95, 1005.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(95, 96, 957.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(96, 97, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(97, 98, 8.88, 1, 1.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(98, 99, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(99, 100, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(100, 101, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(101, 102, 2487.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(102, 103, 1668.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(103, 105, 1846.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(104, 106, 1846.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(105, 107, 2000.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(106, 108, 1370.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(107, 109, 1370.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(108, 110, 3425.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(109, 111, 1260.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(110, 112, 1401.00, 1, 50.00, 0.00, 0, 1, 1560.00, 8, 0.00, 0.00),
(111, 113, 957.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(112, 114, 5362.50, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(113, 115, 2042.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(114, 116, 1796.00, 1, 50.00, 0.00, 0, 1, 0.00, 12, 334.00, 0.00),
(115, 117, 1500.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(116, 118, 1840.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(117, 119, 2000.00, 1, 50.00, 0.00, 0, 1, 0.00, 12, 334.00, 0.00),
(118, 120, 1796.00, 1, 50.00, 0.00, 0, 1, 0.00, 12, 334.00, 0.00),
(119, 121, 1512.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(120, 122, 1668.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(121, 123, 1668.00, 1, 50.00, 0.00, 0, 1, 2286.00, 12, 0.00, 0.00),
(122, 124, 1710.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(123, 125, 1588.00, 1, 50.00, 0.00, 0, 1, 2286.00, 12, 0.00, 0.00),
(124, 126, 1668.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(125, 127, 1511.00, 1, 50.00, 0.00, 0, 1, 2241.00, 12, 0.00, 0.00),
(126, 128, 1511.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(127, 129, 1370.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(128, 130, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(129, 131, 1200.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(130, 132, 957.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(131, 133, 1546.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(132, 134, 1260.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(133, 135, 1472.00, 1, 50.00, 0.00, 0, 1, 0.00, 8, 0.00, 200.00),
(134, 136, 1472.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 200.00),
(135, 137, 0.00, 0, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(136, 138, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(137, 139, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(138, 140, 1334.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(139, 141, 1323.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(140, 142, 1334.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(141, 143, 2042.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(142, 144, 1846.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(143, 145, 1939.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(144, 146, 1512.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(145, 147, 1370.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(146, 148, 1939.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(147, 149, 1370.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(148, 150, 1401.00, 1, 50.00, 0.00, 0, 1, 1476.00, 8, 0.00, 0.00),
(149, 151, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(150, 152, 957.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(151, 153, 1939.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(152, 154, 3000.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(153, 155, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(154, 156, 1500.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(155, 157, 1758.00, 1, 50.00, 0.00, 0, 1, 0.00, 12, 0.00, 0.00),
(156, 158, 1628.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(157, 159, 1796.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(158, 160, 1796.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(159, 161, 1796.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(160, 162, 1440.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(161, 163, 1439.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(162, 164, 1401.00, 1, 50.00, 0.00, 0, 1, 1560.00, 8, 0.00, 0.00),
(163, 165, 1200.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(164, 166, 1260.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(165, 167, 2042.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(166, 168, 1939.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(167, 169, 1846.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(168, 170, 1846.00, 1, 50.00, 0.00, 0, 1, 2286.00, 12, 334.00, 0.00),
(169, 171, 1304.00, 1, 50.00, 0.00, 0, 1, 0.00, 12, 0.00, 0.00),
(170, 172, 1312.00, 1, 50.00, 0.00, 0, 1, 0.00, 12, 0.00, 0.00),
(171, 173, 1511.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(172, 174, 1378.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(173, 175, 1312.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(174, 176, 1078.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(175, 177, 1078.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(176, 178, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(177, 179, 1401.00, 1, 50.00, 0.00, 0, 1, 1401.00, 8, 0.00, 0.00),
(178, 180, 2368.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(179, 181, 0.00, 0, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(180, 182, 3502.50, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(181, 183, 2676.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(182, 184, 1043.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(183, 185, 1370.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(184, 186, 1401.00, 1, 50.00, 0.00, 0, 1, 1476.00, 8, 0.00, 0.00),
(185, 187, 2612.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(186, 188, 1401.00, 1, 50.00, 0.00, 0, 1, 1476.00, 8, 0.00, 0.00),
(187, 189, 2000.00, 1, 50.00, 0.00, 0, 1, 0.00, 12, 0.00, 0.00),
(188, 190, 1078.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(189, 191, 2042.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 334.00, 0.00),
(190, 192, 1305.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(191, 193, 1710.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(192, 194, 1370.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(193, 195, 1512.00, 1, 50.00, 0.00, 0, 1, 2241.00, 8, 0.00, 0.00),
(194, 196, 1440.00, 1, 50.00, 0.00, 0, 1, 2241.00, 8, 0.00, 0.00),
(195, 197, 1241.00, 1, 50.00, 0.00, 0, 1, 1401.00, 8, 0.00, 0.00),
(196, 198, 1511.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(197, 199, 1312.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(198, 200, 1511.00, 1, 50.00, 0.00, 0, 1, 2241.00, 8, 0.00, 0.00),
(199, 201, 1370.00, 1, 50.00, 0.00, 0, 1, 2241.00, 8, 0.00, 0.00),
(200, 202, 1132.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(201, 203, 1370.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(202, 204, 1511.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(203, 205, 1511.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(204, 206, 1439.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(205, 207, 1587.00, 1, 50.00, 0.00, 0, 1, 1560.00, 8, 0.00, 0.00),
(206, 208, 1447.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(207, 209, 1447.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(208, 210, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 200.00),
(209, 211, 1242.00, 1, 50.00, 0.00, 0, 1, 1560.00, 8, 0.00, 0.00),
(210, 212, 2484.00, 1, 50.00, 0.00, 0, 1, 1413.00, 8, 0.00, 0.00),
(211, 213, 1209.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 0.00),
(212, 214, 1401.00, 1, 50.00, 0.00, 0, 1, 1560.00, 8, 0.00, 0.00),
(213, 215, 1401.00, 1, 50.00, 0.00, 0, 1, 0.00, 0, 0.00, 200.00),
(214, 66, 1260.00, 1, 50.00, 0.00, 0, 1, 1560.00, 8, 0.00, 0.00),
(215, 104, 2000.00, 1, 50.00, 0.00, 0, 1, 0.00, 12, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary_sheets`
--

CREATE TABLE `employee_salary_sheets` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `current_basic` double(8,2) NOT NULL,
  `new_basic_salary` double(10,2) NOT NULL DEFAULT '0.00',
  `da` double(8,2) NOT NULL,
  `pp` double(8,2) NOT NULL,
  `medical` double(8,2) NOT NULL,
  `convance` double(8,2) NOT NULL,
  `wash` double(8,2) NOT NULL,
  `mobile` double(8,2) NOT NULL,
  `cycle` double(8,2) NOT NULL,
  `charge` double(8,2) NOT NULL,
  `other` double(8,2) NOT NULL,
  `gross_pay` double(8,2) NOT NULL,
  `gpf` double(8,2) NOT NULL,
  `gpf_recovery` double(10,2) NOT NULL,
  `group_insurance` double(10,2) NOT NULL,
  `house_rent` double(8,2) NOT NULL,
  `house_loan_recovery` double(8,2) NOT NULL,
  `vehicle_recovery` double(8,2) NOT NULL,
  `telephone_recovery` double(8,2) NOT NULL,
  `others_recovery` double(8,2) NOT NULL DEFAULT '0.00',
  `tiffin` double(8,2) NOT NULL,
  `motorcycle_loan` double(8,2) NOT NULL,
  `house_build_recovery` double(8,2) NOT NULL,
  `house_repair_recovery` double(8,2) NOT NULL,
  `bycycle_loan` double(8,2) NOT NULL,
  `computer_loan` double(8,2) NOT NULL,
  `car_loan` double(8,2) NOT NULL,
  `extra_loan` double(10,2) NOT NULL,
  `gpf_loan` double(8,2) NOT NULL,
  `education` double(8,2) NOT NULL,
  `fixed_house_rent_recovery` double(8,2) NOT NULL,
  `health_insurance` double(10,2) NOT NULL,
  `water_supply_recovery` double(8,2) NOT NULL,
  `electricity_recovery` double(8,2) NOT NULL,
  `bf_recovery` double(8,2) NOT NULL,
  `gi` double(8,2) NOT NULL,
  `gi_recovery` double(10,2) NOT NULL,
  `emp_tax` double(8,2) NOT NULL,
  `tin_shade_recovery` double(5,2) NOT NULL,
  `salary_type_id` int(11) NOT NULL,
  `status` enum('Active','Inactive','','') NOT NULL,
  `total_recovery` double(8,2) NOT NULL,
  `net_pay` double(8,2) NOT NULL,
  `bonus` double DEFAULT NULL,
  `bonus_type` int(11) DEFAULT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_salary_sheets`
--

INSERT INTO `employee_salary_sheets` (`id`, `employee_id`, `current_basic`, `new_basic_salary`, `da`, `pp`, `medical`, `convance`, `wash`, `mobile`, `cycle`, `charge`, `other`, `gross_pay`, `gpf`, `gpf_recovery`, `group_insurance`, `house_rent`, `house_loan_recovery`, `vehicle_recovery`, `telephone_recovery`, `others_recovery`, `tiffin`, `motorcycle_loan`, `house_build_recovery`, `house_repair_recovery`, `bycycle_loan`, `computer_loan`, `car_loan`, `extra_loan`, `gpf_loan`, `education`, `fixed_house_rent_recovery`, `health_insurance`, `water_supply_recovery`, `electricity_recovery`, `bf_recovery`, `gi`, `gi_recovery`, `emp_tax`, `tin_shade_recovery`, `salary_type_id`, `status`, `total_recovery`, `net_pay`, `bonus`, `bonus_type`, `fiscal_year_id`, `month_id`, `created_at`, `updated_at`) VALUES
(1, 1, 66120.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 95468.00, 0.00, 0.00, 0.00, 26448.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 414.00, 95054.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(2, 2, 60840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 88076.00, 6084.00, 1.00, 0.00, 24336.00, 0.00, 2095.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8593.20, 79482.80, NULL, NULL, 2, 1, '2017-10-04', NULL),
(3, 3, 60840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 88076.00, 6084.00, 1.00, 0.00, 24336.00, 0.00, 699.20, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8197.20, 79878.80, NULL, NULL, 2, 1, '2017-10-04', NULL),
(4, 4, 58560.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 84484.00, 5856.00, 1.00, 0.00, 23424.00, 0.00, 1400.20, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8670.20, 75813.80, NULL, NULL, 2, 1, '2017-10-04', NULL),
(5, 5, 56030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 80942.00, 5603.00, 1.00, 0.00, 22412.00, 0.00, 852.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4167.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 11036.80, 69905.20, NULL, NULL, 2, 1, '2017-10-04', NULL),
(6, 6, 56030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 79942.00, 5603.00, 1.00, 0.00, 22412.00, 0.00, 561.80, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 7578.80, 72363.20, NULL, NULL, 2, 1, '2017-10-04', NULL),
(7, 7, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1.00, 0.00, 16336.00, 0.00, 40.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4538.00, 55138.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(8, 8, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 57390.00, 0.00, 0.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 414.00, 56976.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(9, 9, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1.00, 0.00, 16336.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4498.00, 55178.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(10, 10, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 478.20, 0.00, 0.00, 0.00, 730.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 4084.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 10595.20, 45794.80, NULL, NULL, 2, 1, '2017-10-04', NULL),
(11, 11, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 110.40, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4413.40, 51976.60, NULL, NULL, 2, 1, '2017-10-04', NULL),
(12, 12, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 54530.00, 3703.00, 1.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3542.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 7659.00, 46871.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(13, 13, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1.00, 0.00, 16336.00, 0.00, 98.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4596.80, 55079.20, NULL, NULL, 2, 1, '2017-10-04', NULL),
(14, 14, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55530.00, 3703.00, 1.00, 0.00, 16000.00, 0.00, 435.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4552.00, 50978.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(15, 15, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 71.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4374.20, 52015.80, NULL, NULL, 2, 1, '2017-10-04', NULL),
(16, 16, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 54530.00, 3703.00, 1.00, 0.00, 16000.00, 0.00, 52.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4169.00, 50361.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(17, 17, 33580.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50191.00, 3358.00, 1.00, 0.00, 15111.00, 0.00, 86.40, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3858.40, 46332.60, NULL, NULL, 2, 1, '2017-10-04', NULL),
(18, 18, 28100.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 42245.00, 2810.00, 1.00, 0.00, 12645.00, 0.00, 39.60, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3263.60, 38981.40, NULL, NULL, 2, 1, '2017-10-04', NULL),
(19, 19, 25480.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 38446.00, 2548.00, 1.00, 0.00, 11466.00, 0.00, 25.60, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 2987.60, 35458.40, NULL, NULL, 2, 1, '2017-10-04', NULL),
(20, 20, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 57390.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 148.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 5188.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 10639.80, 46750.20, NULL, NULL, 2, 1, '2017-10-04', NULL),
(21, 21, 35260.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 53627.00, 3526.00, 1.00, 0.00, 15867.00, 0.00, 0.00, 0.00, 12275.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 16215.80, 37411.20, NULL, NULL, 2, 1, '2017-10-04', NULL),
(22, 22, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 57415.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 7635.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 12938.00, 44477.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(23, 23, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 55055.00, 3703.00, 1.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 1500.00, 500.00, 7000.00, 0.00, 12.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 13629.00, 41426.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(24, 24, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 57415.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 7230.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 12533.00, 44882.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(25, 25, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55530.00, 3703.00, 1.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5891.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 11008.00, 44522.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(26, 26, 29370.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 44111.50, 2937.00, 1.00, 0.00, 13216.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 6851.00, 37260.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(27, 27, 22550.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 35197.50, 2255.00, 1.00, 0.00, 10147.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 2669.00, 32528.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(28, 28, 28100.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 42745.00, 2810.00, 1.00, 0.00, 12645.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3224.00, 39521.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(29, 29, 29370.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 44086.50, 2937.00, 1.00, 0.00, 13216.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 3438.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8789.00, 35297.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(30, 30, 25480.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 38446.00, 2548.00, 1.00, 0.00, 11466.00, 0.00, 127.60, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4089.60, 34356.40, NULL, NULL, 2, 1, '2017-10-04', NULL),
(31, 31, 18530.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 20055.00, 1853.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 12.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 2279.00, 17776.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(32, 32, 32390.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 75.00, 0.00, 49040.50, 3239.00, 1.00, 0.00, 14575.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5025.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 8648.00, 40392.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(33, 33, 29510.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 45289.50, 2951.00, 1.00, 0.00, 13279.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3335.00, 41954.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(34, 34, 22550.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 35197.50, 2255.00, 1.00, 0.00, 10147.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3639.00, 31558.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(35, 35, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1512.00, 1.00, 0.00, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1708.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4270.00, 20410.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(36, 36, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30615.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 725.50, 0.00, 0.00, 0.00, 0.00, 0.00, 6030.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 9078.50, 21537.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(37, 37, 21470.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 33631.50, 2147.00, 1.00, 0.00, 9661.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3932.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6463.00, 27168.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(38, 38, 20360.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22860.00, 2036.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1534.00, 500.00, 0.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 4696.00, 18164.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(39, 39, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30115.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3053.00, 27062.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(40, 40, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 693.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4984.00, 20681.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(41, 41, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2610.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5933.00, 25182.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(42, 42, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 28542.00, 1796.00, 1.00, 0.00, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2516.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5426.00, 23116.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(43, 43, 12490.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20735.00, 1249.00, 1.00, 0.00, 6245.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1375.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3404.00, 17331.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(44, 44, 15880.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25820.00, 1588.00, 1.00, 0.00, 7940.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1638.00, 24182.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(45, 45, 10430.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 17830.00, 1043.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1823.00, 16007.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(46, 46, 13780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23170.00, 3445.00, 1.00, 0.00, 6890.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 465.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1401.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5373.00, 17797.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(47, 47, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 28100.00, 1710.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2292.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5052.00, 23048.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(48, 48, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24085.00, 3597.50, 1.00, 0.00, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2209.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6586.50, 17498.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(49, 49, 13710.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22665.00, 3427.50, 1.00, 0.00, 6855.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1417.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5624.50, 17040.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(50, 50, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25265.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23704.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(51, 51, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(52, 52, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 558.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 2209.00, 21906.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(53, 53, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17433.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 16426.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(54, 54, 13710.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23665.00, 1371.00, 1.00, 0.00, 6855.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 4645.00, 1000.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 8634.00, 15031.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(55, 55, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21100.00, 1200.00, 1.00, 0.00, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1250.00, 19850.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(56, 56, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2125.00, 1000.00, 1413.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5608.00, 19572.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(57, 57, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 555.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2813.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4819.00, 19296.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(58, 58, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1196.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3236.00, 18264.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(59, 59, 9850.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17350.00, 985.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1035.00, 16315.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(60, 60, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21000.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 462.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2502.00, 18498.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(61, 61, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3125.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5647.00, 19033.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(62, 62, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2040.00, 19460.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(63, 63, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17320.00, 1472.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 4916.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7438.00, 9882.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(64, 64, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23110.00, 1334.00, 1.00, 0.00, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 510.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1225.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3119.00, 19991.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(65, 65, 12700.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21850.00, 0.00, 0.00, 0.00, 6350.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 510.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 560.00, 21290.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(66, 66, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2878.00, 18622.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(67, 67, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 1242.00, 1.00, 0.00, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1292.00, 19938.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(68, 68, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3667.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6118.00, 17497.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(69, 69, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5006.00, 20174.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(70, 70, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 594.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2175.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4950.00, 19165.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(71, 71, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 594.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2116.00, 23064.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(72, 72, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3728.00, 21452.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(73, 73, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1302.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3342.00, 18158.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(74, 74, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2040.00, 19460.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(75, 75, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 621.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3143.00, 21537.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(76, 76, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23158.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(77, 77, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4019.00, 19596.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(78, 78, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 1945.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 4596.00, 19519.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(79, 79, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20600.00, 1200.00, 1.00, 0.00, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1980.00, 18620.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(80, 80, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 558.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4580.00, 20600.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(81, 81, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 594.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3439.00, 1000.00, 1413.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6905.00, 17210.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(82, 82, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2292.00, 1000.00, 1476.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5298.00, 19882.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(83, 83, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3646.00, 500.00, 1413.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7589.00, 17091.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(84, 84, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2252.00, 22928.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(85, 85, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2181.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3632.00, 20483.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(86, 86, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 576.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2403.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4430.00, 19685.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(87, 87, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3422.00, 1000.00, 1413.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7365.00, 17815.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(88, 88, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3150.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5331.00, 18784.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(89, 89, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 540.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3721.00, 20394.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(90, 90, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22110.00, 1334.00, 1.00, 0.00, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 450.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1834.00, 20276.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(91, 91, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1.00, 0.00, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 495.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1879.00, 20731.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(92, 92, 13050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22675.00, 1305.00, 1.00, 0.00, 6525.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1355.00, 21320.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(93, 93, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3623.00, 1000.00, 1401.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6554.00, 18626.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(94, 94, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 594.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2883.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4999.00, 19181.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(95, 95, 10050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17550.00, 1005.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1785.00, 15765.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(96, 96, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1737.00, 15196.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(97, 97, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 21664.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(98, 98, 2755.00, 0.00, 551.00, 0.00, 700.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 7006.00, 275.50, 1.00, 0.00, 2800.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 525.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 27.55, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 828.05, 6177.95, NULL, NULL, 2, 1, '2017-10-04', NULL),
(99, 99, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2355.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3806.00, 19809.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(100, 100, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 2000.00, 0.00, 0.00, 0.00, 0.00, 2172.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5623.00, 17492.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(101, 101, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(102, 102, 24870.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 37561.50, 2487.00, 1.00, 0.00, 11191.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3871.00, 33690.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(103, 103, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 697.50, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3415.50, 24264.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(104, 104, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18680.00, 2000.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 2464.00, 0.00, 0.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5526.00, 13154.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(105, 105, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2960.00, 26807.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(106, 106, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2960.00, 26807.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(107, 107, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29267.00, 2000.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2384.00, 26883.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(108, 108, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22550.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2150.00, 20400.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(109, 109, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22550.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2420.00, 20130.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(110, 110, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 3425.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4205.00, 18845.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(111, 111, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21000.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1625.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3665.00, 17335.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(112, 112, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 510.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3010.00, 1000.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6539.00, 17576.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(113, 113, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(114, 114, 21450.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 34102.50, 5362.50, 1.00, 0.00, 9652.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6746.50, 27356.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(115, 115, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32109.00, 2042.00, 1.00, 0.00, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 738.00, 0.00, 0.00, 0.00, 0.00, 0.00, 6528.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 9692.00, 22417.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(116, 116, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 20985.00, 1796.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2192.00, 18793.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(117, 117, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29042.00, 1500.00, 1.00, 0.00, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2884.00, 26158.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(118, 118, 18400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29180.00, 1840.00, 1.00, 0.00, 8280.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2954.00, 26226.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(119, 119, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21460.00, 2000.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 738.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4167.00, 1000.00, 0.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 7301.00, 14159.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(120, 120, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20960.00, 1796.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 724.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2904.50, 18055.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(121, 121, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 25705.00, 1512.00, 1.00, 0.00, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1562.00, 24143.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(122, 122, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2084.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4532.00, 23148.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(123, 123, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4016.00, 23664.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(124, 124, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27600.00, 1710.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1760.00, 25840.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(125, 125, 15880.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 26820.00, 1588.00, 1.00, 0.00, 7940.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 346.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4282.50, 22537.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(126, 126, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27180.00, 1668.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 879.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4016.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6613.00, 20567.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(127, 127, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2241.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5544.00, 20121.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(128, 128, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2671.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4232.00, 21433.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(129, 129, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 23575.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 22155.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(130, 130, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2181.00, 21934.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(131, 131, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21100.00, 1200.00, 1.00, 0.00, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1980.00, 19120.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(132, 132, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17433.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 16426.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(133, 133, 15460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25790.00, 1546.00, 1.00, 0.00, 7730.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 510.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2106.00, 23684.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(134, 134, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22260.00, 1260.00, 1.00, 0.00, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1257.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3297.00, 18963.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(135, 135, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 576.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2458.00, 1000.00, 0.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 4764.00, 20416.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(136, 136, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 2452.00, 21728.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(137, 137, 12700.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20850.00, 0.00, 0.00, 0.00, 6350.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 780.00, 20070.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(138, 138, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3854.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6305.00, 16810.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(139, 139, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 4912.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7363.00, 16252.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(140, 140, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1.00, 0.00, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3878.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6262.00, 16348.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(141, 141, 13230.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22945.00, 1323.00, 1.00, 0.00, 6615.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2232.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4335.00, 18610.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(142, 142, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1.00, 0.00, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 495.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2879.00, 19731.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(143, 143, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32609.00, 2042.00, 1.00, 0.00, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4775.21, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 7201.21, 25407.79, NULL, NULL, 2, 1, '2017-10-04', NULL),
(144, 144, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29267.00, 1846.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2150.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6110.00, 23157.00, NULL, NULL, 2, 1, '2017-10-04', NULL);
INSERT INTO `employee_salary_sheets` (`id`, `employee_id`, `current_basic`, `new_basic_salary`, `da`, `pp`, `medical`, `convance`, `wash`, `mobile`, `cycle`, `charge`, `other`, `gross_pay`, `gpf`, `gpf_recovery`, `group_insurance`, `house_rent`, `house_loan_recovery`, `vehicle_recovery`, `telephone_recovery`, `others_recovery`, `tiffin`, `motorcycle_loan`, `house_build_recovery`, `house_repair_recovery`, `bycycle_loan`, `computer_loan`, `car_loan`, `extra_loan`, `gpf_loan`, `education`, `fixed_house_rent_recovery`, `health_insurance`, `water_supply_recovery`, `electricity_recovery`, `bf_recovery`, `gi`, `gi_recovery`, `emp_tax`, `tin_shade_recovery`, `salary_type_id`, `status`, `total_recovery`, `net_pay`, `bonus`, `bonus_type`, `fiscal_year_id`, `month_id`, `created_at`, `updated_at`) VALUES
(145, 145, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30115.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3813.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 7136.00, 22979.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(146, 146, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1512.00, 1.00, 0.00, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1562.00, 23618.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(147, 147, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21630.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(148, 148, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 958.50, 0.00, 0.00, 0.00, 0.00, 0.00, 2154.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5435.50, 25680.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(149, 149, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 22575.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21155.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(150, 150, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 510.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3445.00, 20670.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(151, 151, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 525.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 1699.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4675.00, 19440.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(152, 152, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1737.00, 15196.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(153, 153, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 4053.00, 27062.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(154, 154, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27600.00, 3000.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3050.00, 24550.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(155, 155, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 2632.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5083.00, 19032.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(156, 156, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1500.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2550.00, 25130.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(157, 157, 17580.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20580.00, 1758.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1820.00, 18760.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(158, 158, 16280.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 26805.00, 1628.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 920.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2598.00, 24207.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(159, 159, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 29067.00, 1796.00, 1.00, 0.00, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3180.00, 25887.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(160, 160, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 29067.00, 1796.00, 1.00, 0.00, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 752.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4104.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 7036.00, 22031.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(161, 161, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 29067.00, 1796.00, 1.00, 0.00, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3958.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6138.00, 22929.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(162, 162, 14400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24100.00, 1440.00, 1.00, 0.00, 7200.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3220.00, 20880.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(163, 163, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24085.00, 1439.00, 1.00, 0.00, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1489.00, 22596.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(164, 164, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4019.00, 20096.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(165, 165, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20600.00, 1200.00, 1.00, 0.00, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2980.00, 17620.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(166, 166, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22000.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1350.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3660.00, 18340.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(167, 167, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31609.00, 2042.00, 1.00, 0.00, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2426.00, 29183.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(168, 168, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30615.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28292.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(169, 169, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3230.00, 26537.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(170, 170, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 920.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5448.00, 24319.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(171, 171, 13040.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15540.00, 1304.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2096.00, 13444.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(172, 172, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15120.00, 1312.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2104.00, 13016.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(173, 173, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25165.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23604.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(174, 174, 13780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22670.00, 1378.00, 1.00, 0.00, 6890.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1428.00, 21242.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(175, 175, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21680.00, 1312.00, 1.00, 0.00, 6560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2092.00, 19588.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(176, 176, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(177, 177, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(178, 178, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3396.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5847.00, 17268.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(179, 179, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 525.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2584.00, 1000.00, 1401.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5969.00, 18146.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(180, 180, 23680.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 36836.00, 2368.00, 1.00, 0.00, 10656.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5515.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 9267.00, 27569.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(181, 181, 12740.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21110.00, 0.00, 0.00, 0.00, 6370.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 50.00, 21060.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(182, 182, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 3502.50, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5282.50, 17832.50, NULL, NULL, 2, 1, '2017-10-04', NULL),
(183, 183, 26760.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 40302.00, 2676.00, 1.00, 0.00, 12042.00, 0.00, 0.00, 0.00, 0.00, 0.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2175.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5965.00, 34337.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(184, 184, 10430.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 17830.00, 1043.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1093.00, 16737.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(185, 185, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1025.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3175.00, 19875.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(186, 186, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2896.00, 500.00, 1476.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6561.00, 17054.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(187, 187, 26120.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 40374.00, 2612.00, 1.00, 0.00, 11754.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3397.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6393.00, 33981.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(188, 188, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 555.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2879.00, 1000.00, 1476.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6369.00, 17746.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(189, 189, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 19680.00, 2000.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4105.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7155.00, 12525.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(190, 190, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(191, 191, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 32709.00, 2042.00, 1.00, 0.00, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 813.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1250.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 4489.00, 28220.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(192, 192, 13050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22175.00, 1305.00, 1.00, 0.00, 6525.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1355.00, 20820.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(193, 193, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 28200.00, 1710.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2490.00, 25710.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(194, 194, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2150.00, 21000.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(195, 195, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25780.00, 1512.00, 1.00, 0.00, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1655.00, 1000.00, 2286.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5511.00, 20269.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(196, 196, 14400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24200.00, 1440.00, 1.00, 0.00, 7200.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1449.00, 500.00, 2241.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5188.00, 19012.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(197, 197, 12410.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21215.00, 1241.00, 1.00, 0.00, 6205.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 730.00, 500.00, 1401.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3430.00, 17785.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(198, 198, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 27276.00, 1511.00, 1.00, 0.00, 9066.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1437.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4728.00, 22548.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(199, 199, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21780.00, 1312.00, 1.00, 0.00, 6560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 629.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2721.00, 19059.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(200, 200, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24765.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2241.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4540.00, 20225.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(201, 201, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 656.00, 500.00, 2241.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5055.00, 18095.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(202, 202, 11320.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20212.00, 1132.00, 1.00, 0.00, 6792.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1182.00, 19030.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(203, 203, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 750.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2900.00, 20250.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(204, 204, 15110.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25465.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 2655.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5216.00, 20249.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(205, 205, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25265.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 834.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3125.00, 22140.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(206, 206, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24685.00, 1439.00, 1.00, 0.00, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3219.00, 21466.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(207, 207, 15870.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 26405.00, 1587.00, 1.00, 0.00, 7935.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3205.00, 23200.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(208, 208, 14470.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24305.00, 1447.00, 1.00, 0.00, 7235.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3186.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5683.00, 18622.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(209, 209, 14470.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24805.00, 1447.00, 1.00, 0.00, 7235.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3086.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5123.00, 19682.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(210, 210, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 669.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3000.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 5320.00, 18795.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(211, 211, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 1242.00, 1.00, 0.00, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2860.00, 18370.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(212, 212, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 2484.00, 1.00, 0.00, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1413.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4685.00, 16545.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(213, 213, 12090.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20235.00, 1209.00, 1.00, 0.00, 6045.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1989.00, 18246.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(214, 214, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2266.00, 1000.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6015.00, 18100.00, NULL, NULL, 2, 1, '2017-10-04', NULL),
(215, 215, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2215.16, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 3866.16, 19248.84, NULL, NULL, 2, 1, '2017-10-04', NULL),
(216, 1, 66120.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 95468.00, 0.00, 0.00, 0.00, 26448.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 414.00, 95054.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(217, 2, 60840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 88076.00, 6084.00, 1.00, 0.00, 24336.00, 0.00, 2316.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8814.80, 79261.20, NULL, NULL, 2, 2, '2017-10-10', NULL),
(218, 3, 60840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 88076.00, 6084.00, 1.00, 0.00, 24336.00, 0.00, 945.60, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8443.60, 79632.40, NULL, NULL, 2, 2, '2017-10-10', NULL),
(219, 4, 58560.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 84484.00, 5856.00, 1.00, 0.00, 23424.00, 0.00, 2165.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 9435.00, 75049.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(220, 5, 56030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 80942.00, 5603.00, 1.00, 0.00, 22412.00, 0.00, 1504.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4167.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 11688.20, 69253.80, NULL, NULL, 2, 2, '2017-10-10', NULL),
(221, 6, 56030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 79942.00, 5603.00, 1.00, 0.00, 22412.00, 0.00, 744.40, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 7761.40, 72180.60, NULL, NULL, 2, 2, '2017-10-10', NULL),
(222, 7, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1.00, 0.00, 16336.00, 0.00, 41.60, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4539.60, 55136.40, NULL, NULL, 2, 2, '2017-10-10', NULL),
(223, 8, 13799.68, 0.00, 0.00, 0.00, 532.26, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20364.19, 0.00, 0.00, 0.00, 5677.42, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 354.84, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 118.51, 0.00, 0, 'Active', 198.51, 20165.68, NULL, NULL, 2, 2, '2017-10-10', NULL),
(224, 9, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1.00, 0.00, 16336.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4498.00, 55178.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(225, 10, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 1605.20, 0.00, 0.00, 0.00, 730.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 4084.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 11722.20, 44667.80, NULL, NULL, 2, 2, '2017-10-10', NULL),
(226, 11, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 560.40, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4863.40, 51526.60, NULL, NULL, 2, 2, '2017-10-10', NULL),
(227, 12, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 54530.00, 3703.00, 1.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3542.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 7659.00, 46871.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(228, 13, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1.00, 0.00, 16336.00, 0.00, 793.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 5291.20, 54384.80, NULL, NULL, 2, 2, '2017-10-10', NULL),
(229, 14, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55530.00, 3703.00, 1.00, 0.00, 16000.00, 0.00, 179.60, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4296.60, 51233.40, NULL, NULL, 2, 2, '2017-10-10', NULL),
(230, 15, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 284.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4587.80, 51802.20, NULL, NULL, 2, 2, '2017-10-10', NULL),
(231, 16, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 54530.00, 3703.00, 1.00, 0.00, 16000.00, 0.00, 24.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4141.00, 50389.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(232, 17, 33580.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50191.00, 3358.00, 1.00, 0.00, 15111.00, 0.00, 80.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3852.00, 46339.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(233, 18, 28100.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 42245.00, 2810.00, 1.00, 0.00, 12645.00, 0.00, 35.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3259.20, 38985.80, NULL, NULL, 2, 2, '2017-10-10', NULL),
(234, 19, 25480.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 38446.00, 2548.00, 1.00, 0.00, 11466.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 2962.00, 35484.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(235, 20, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 57390.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 104.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 5188.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 10595.00, 46795.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(236, 21, 19336.13, 0.00, 0.00, 0.00, 822.58, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29408.35, 1933.61, 1.00, 0.00, 8701.26, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 548.39, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 183.16, 0.00, 0, 'Active', 2196.77, 27211.58, NULL, NULL, 2, 2, '2017-10-10', NULL),
(237, 22, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 57415.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 7635.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 12938.00, 44477.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(238, 23, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 55055.00, 3703.00, 1.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 1500.00, 500.00, 7000.00, 0.00, 12.00, 1470.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 15099.00, 39956.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(239, 24, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 57415.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 7230.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 12533.00, 44882.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(240, 25, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55530.00, 3703.00, 1.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5891.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 11008.00, 44522.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(241, 26, 29370.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 44611.50, 2937.00, 1.00, 0.00, 13216.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2500.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 6851.00, 37760.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(242, 27, 22550.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 35197.50, 2255.00, 1.00, 0.00, 10147.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 2669.00, 32528.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(243, 28, 28100.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 42745.00, 2810.00, 1.00, 0.00, 12645.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3224.00, 39521.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(244, 29, 29370.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 44086.50, 2937.00, 1.00, 0.00, 13216.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 3438.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8789.00, 35297.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(245, 30, 25480.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 38446.00, 2548.00, 1.00, 0.00, 11466.00, 0.00, 220.60, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4182.60, 34263.40, NULL, NULL, 2, 2, '2017-10-10', NULL),
(246, 31, 18530.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 20055.00, 1853.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 12.00, 1887.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4166.00, 15889.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(247, 32, 32390.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 75.00, 0.00, 49040.50, 3239.00, 1.00, 0.00, 14575.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5025.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 8648.00, 40392.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(248, 33, 29510.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 45289.50, 2951.00, 1.00, 0.00, 13279.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3335.00, 41954.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(249, 34, 22550.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 35197.50, 2255.00, 1.00, 0.00, 10147.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2639.00, 32558.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(250, 35, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1512.00, 1.00, 0.00, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1562.00, 23118.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(251, 36, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30615.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28292.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(252, 37, 21470.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 33631.50, 2147.00, 1.00, 0.00, 9661.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2531.00, 31100.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(253, 38, 20360.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22860.00, 2036.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 12.00, 2460.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 4892.00, 17968.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(254, 39, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30115.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3053.00, 27062.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(255, 40, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 24104.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(256, 41, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28792.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(257, 42, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 28542.00, 1796.00, 1.00, 0.00, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2180.00, 26362.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(258, 43, 12490.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20735.00, 1249.00, 1.00, 0.00, 6245.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1299.00, 19436.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(259, 44, 15880.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25820.00, 1588.00, 1.00, 0.00, 7940.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1638.00, 24182.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(260, 45, 10430.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 17830.00, 1043.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1093.00, 16737.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(261, 46, 13780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23170.00, 3445.00, 1.00, 0.00, 6890.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 465.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1401.00, 0.00, 12.00, 2004.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7377.00, 15793.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(262, 47, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 28100.00, 1710.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2292.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5052.00, 23048.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(263, 48, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24085.00, 3597.50, 1.00, 0.00, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3647.50, 20437.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(264, 49, 13710.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22665.00, 3427.50, 1.00, 0.00, 6855.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3477.50, 19187.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(265, 50, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25265.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23704.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(266, 51, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(267, 52, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 1947.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 3598.00, 20517.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(268, 53, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17433.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 16426.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(269, 54, 13710.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23665.00, 1371.00, 1.00, 0.00, 6855.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1560.00, 0.00, 8.00, 3266.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6255.00, 17410.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(270, 55, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21100.00, 1200.00, 1.00, 0.00, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1250.00, 19850.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(271, 56, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1413.00, 0.00, 8.00, 2159.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5102.00, 20078.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(272, 57, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(273, 58, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20190.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(274, 59, 9850.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17350.00, 985.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1035.00, 16315.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(275, 60, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21000.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 19690.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(276, 61, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23158.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(277, 62, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20190.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(278, 63, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17320.00, 1472.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 1366.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2888.00, 14432.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(279, 64, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23110.00, 1334.00, 1.00, 0.00, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1384.00, 21726.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(280, 65, 12700.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21850.00, 0.00, 0.00, 0.00, 6350.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 50.00, 21800.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(281, 66, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 1145.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4023.00, 17477.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(282, 67, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 1242.00, 1.00, 0.00, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1292.00, 19938.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(283, 68, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22164.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(284, 69, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 3026.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 8032.00, 17148.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(285, 70, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(286, 71, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23658.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(287, 72, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 0.00, 1779.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4777.00, 20403.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(288, 73, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20190.00, NULL, NULL, 2, 2, '2017-10-10', NULL);
INSERT INTO `employee_salary_sheets` (`id`, `employee_id`, `current_basic`, `new_basic_salary`, `da`, `pp`, `medical`, `convance`, `wash`, `mobile`, `cycle`, `charge`, `other`, `gross_pay`, `gpf`, `gpf_recovery`, `group_insurance`, `house_rent`, `house_loan_recovery`, `vehicle_recovery`, `telephone_recovery`, `others_recovery`, `tiffin`, `motorcycle_loan`, `house_build_recovery`, `house_repair_recovery`, `bycycle_loan`, `computer_loan`, `car_loan`, `extra_loan`, `gpf_loan`, `education`, `fixed_house_rent_recovery`, `health_insurance`, `water_supply_recovery`, `electricity_recovery`, `bf_recovery`, `gi`, `gi_recovery`, `emp_tax`, `tin_shade_recovery`, `salary_type_id`, `status`, `total_recovery`, `net_pay`, `bonus`, `bonus_type`, `fiscal_year_id`, `month_id`, `created_at`, `updated_at`) VALUES
(289, 74, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20190.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(290, 75, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23158.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(291, 76, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23158.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(292, 77, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 2285.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5304.00, 18311.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(293, 78, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 1029.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 2680.00, 21435.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(294, 79, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21529.02, 1200.00, 1.00, 0.00, 6929.02, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1250.00, 20279.02, NULL, NULL, 2, 2, '2017-10-10', NULL),
(295, 80, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23658.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(296, 81, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1413.00, 0.00, 8.00, 1922.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4794.00, 19321.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(297, 82, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 1219.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4225.00, 20955.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(298, 83, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1413.00, 0.00, 8.00, 1054.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3997.00, 20683.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(299, 84, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23658.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(300, 85, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(301, 86, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(302, 87, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1413.00, 0.00, 8.00, 4050.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6993.00, 18187.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(303, 88, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3150.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5331.00, 18784.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(304, 89, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 540.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3721.00, 20394.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(305, 90, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22110.00, 1334.00, 1.00, 0.00, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1384.00, 20726.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(306, 91, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1.00, 0.00, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1384.00, 21226.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(307, 92, 13050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22675.00, 1305.00, 1.00, 0.00, 6525.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1355.00, 21320.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(308, 93, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1401.00, 0.00, 8.00, 2400.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5331.00, 19849.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(309, 94, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 22658.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(310, 95, 10050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17550.00, 1005.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1785.00, 15765.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(311, 96, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(312, 97, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 21664.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(313, 98, 88.87, 0.00, 17.74, 0.00, 22.58, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 225.96, 8.88, 1.00, 0.00, 90.32, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 6.45, 0.00, 0.00, 0.00, 0.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 9.88, 216.08, NULL, NULL, 2, 2, '2017-10-10', NULL),
(314, 99, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22164.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(315, 100, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 2000.00, 0.00, 0.00, 0.00, 0.00, 2172.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5623.00, 17492.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(316, 101, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(317, 102, 24870.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 37561.50, 2487.00, 1.00, 0.00, 11191.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2871.00, 34690.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(318, 103, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1718.00, 25962.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(319, 104, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18680.00, 2000.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 12.00, 1394.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3456.00, 15224.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(320, 105, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2230.00, 27537.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(321, 106, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2960.00, 26807.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(322, 107, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29267.00, 2000.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2384.00, 26883.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(323, 108, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22550.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21130.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(324, 109, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21630.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(325, 110, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 3425.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3475.00, 19575.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(326, 111, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21000.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 19690.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(327, 112, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1560.00, 0.00, 8.00, 2775.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5794.00, 18321.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(328, 113, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(329, 114, 21450.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 34102.50, 5362.50, 1.00, 0.00, 9652.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6746.50, 27356.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(330, 115, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32109.00, 2042.00, 1.00, 0.00, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2426.00, 29683.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(331, 116, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 20985.00, 1796.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 4717.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6909.00, 14076.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(332, 117, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29042.00, 1500.00, 1.00, 0.00, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 1884.00, 27158.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(333, 118, 18400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29180.00, 1840.00, 1.00, 0.00, 8280.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2224.00, 26956.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(334, 119, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21460.00, 2000.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 3507.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5903.00, 15557.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(335, 120, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20960.00, 1796.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 1499.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3679.00, 17281.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(336, 121, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 25705.00, 1512.00, 1.00, 0.00, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1562.00, 24143.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(337, 122, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1718.00, 25962.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(338, 123, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 3091.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7107.00, 20573.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(339, 124, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27600.00, 1710.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1760.00, 25840.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(340, 125, 15880.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 26820.00, 1588.00, 1.00, 0.00, 7940.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 2401.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6337.00, 20483.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(341, 126, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27180.00, 1668.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 879.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4016.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6613.00, 20567.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(342, 127, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2241.00, 0.00, 12.00, 2314.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6128.00, 19537.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(343, 128, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 24104.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(344, 129, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 23575.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 22155.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(345, 130, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(346, 131, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21100.00, 1200.00, 1.00, 0.00, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1250.00, 19850.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(347, 132, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17433.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 16426.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(348, 133, 15460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25790.00, 1546.00, 1.00, 0.00, 7730.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1596.00, 24194.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(349, 134, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21812.89, 1260.00, 1.00, 0.00, 7112.89, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20502.89, NULL, NULL, 2, 2, '2017-10-10', NULL),
(350, 135, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 8.00, 1406.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 3136.00, 22044.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(351, 136, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1946.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 3668.00, 20512.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(352, 137, 9832.26, 0.00, 0.00, 0.00, 1161.29, 0.00, 77.42, 0.00, 0.00, 0.00, 0.00, 16141.94, 0.00, 0.00, 0.00, 4916.13, 0.00, 0.00, 0.00, 0.00, 154.84, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 50.00, 16091.94, NULL, NULL, 2, 2, '2017-10-10', NULL),
(353, 138, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3854.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6305.00, 16810.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(354, 139, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 478.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1929.00, 21686.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(355, 140, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1.00, 0.00, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3878.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6262.00, 16348.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(356, 141, 13230.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22945.00, 1323.00, 1.00, 0.00, 6615.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2232.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4335.00, 18610.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(357, 142, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1.00, 0.00, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 495.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 2360.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5239.00, 17371.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(358, 143, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32609.00, 2042.00, 1.00, 0.00, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2426.00, 30183.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(359, 144, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29267.00, 1846.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2150.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6110.00, 23157.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(360, 145, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30115.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 27792.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(361, 146, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1512.00, 1.00, 0.00, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1562.00, 23618.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(362, 147, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21630.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(363, 148, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28792.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(364, 149, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 22575.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21155.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(365, 150, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 1691.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4626.00, 19489.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(366, 151, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(367, 152, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(368, 153, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28792.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(369, 154, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27600.00, 3000.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3050.00, 24550.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(370, 155, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(371, 156, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 1694.45, 29374.45, 1500.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1550.00, 27824.45, NULL, NULL, 2, 2, '2017-10-10', NULL),
(372, 157, 17580.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20580.00, 1758.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 2955.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4775.00, 15805.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(373, 158, 16280.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 26805.00, 1628.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1678.00, 25127.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(374, 159, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 29067.00, 1796.00, 1.00, 0.00, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2180.00, 26887.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(375, 160, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 29067.00, 1796.00, 1.00, 0.00, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2180.00, 26887.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(376, 161, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 29067.00, 1796.00, 1.00, 0.00, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2180.00, 26887.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(377, 162, 14400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24100.00, 1440.00, 1.00, 0.00, 7200.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1490.00, 22610.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(378, 163, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24085.00, 1439.00, 1.00, 0.00, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1489.00, 22596.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(379, 164, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1560.00, 0.00, 8.00, 3146.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6165.00, 17950.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(380, 165, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20600.00, 1200.00, 1.00, 0.00, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1250.00, 19350.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(381, 166, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22000.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20690.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(382, 167, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31609.00, 2042.00, 1.00, 0.00, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2426.00, 29183.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(383, 168, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30615.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28292.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(384, 169, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2230.00, 27537.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(385, 170, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 5460.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 9988.00, 19779.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(386, 171, 13040.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15540.00, 1304.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 12.00, 2489.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3855.00, 11685.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(387, 172, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15120.00, 1312.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 12.00, 2465.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3839.00, 11281.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(388, 173, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25165.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23604.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(389, 174, 13780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22670.00, 1378.00, 1.00, 0.00, 6890.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1428.00, 21242.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(390, 175, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21680.00, 1312.00, 1.00, 0.00, 6560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1362.00, 20318.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(391, 176, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(392, 177, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(393, 178, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 21664.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(394, 179, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1401.00, 0.00, 8.00, 3034.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5894.00, 18221.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(395, 180, 23680.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 36836.00, 2368.00, 1.00, 0.00, 10656.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2752.00, 34084.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(396, 181, 12740.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21110.00, 0.00, 0.00, 0.00, 6370.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 50.00, 21060.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(397, 182, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 3502.50, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3552.50, 19562.50, NULL, NULL, 2, 2, '2017-10-10', NULL),
(398, 183, 26760.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 40302.00, 2676.00, 1.00, 0.00, 12042.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3060.00, 37242.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(399, 184, 10430.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 17830.00, 1043.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1093.00, 16737.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(400, 185, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21630.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(401, 186, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1476.00, 0.00, 8.00, 1552.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4487.00, 19128.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(402, 187, 26120.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 40374.00, 2612.00, 1.00, 0.00, 11754.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2996.00, 37378.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(403, 188, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 2075.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5010.00, 19105.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(404, 189, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 19680.00, 2000.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 2408.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4458.00, 15222.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(405, 190, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(406, 191, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 32709.00, 2042.00, 1.00, 0.00, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2426.00, 30283.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(407, 192, 13050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22175.00, 1305.00, 1.00, 0.00, 6525.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1355.00, 20820.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(408, 193, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 28200.00, 1710.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1760.00, 26440.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(409, 194, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21730.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(410, 195, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25780.00, 1512.00, 1.00, 0.00, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2241.00, 0.00, 8.00, 1615.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5426.00, 20354.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(411, 196, 14400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24200.00, 1440.00, 1.00, 0.00, 7200.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 2241.00, 0.00, 8.00, 237.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3976.00, 20224.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(412, 197, 12410.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22456.00, 1241.00, 1.00, 0.00, 7446.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1401.00, 0.00, 8.00, 2482.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5182.00, 17274.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(413, 198, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25765.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 24204.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(414, 199, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21780.00, 1312.00, 1.00, 0.00, 6560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1362.00, 20418.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(415, 200, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24765.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2241.00, 0.00, 8.00, 2225.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6035.00, 18730.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(416, 201, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 2241.00, 0.00, 8.00, 1424.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5093.00, 18057.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(417, 202, 11320.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20212.00, 1132.00, 1.00, 0.00, 6792.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1182.00, 19030.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(418, 203, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21730.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(419, 204, 15110.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25465.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23904.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(420, 205, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25265.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23704.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(421, 206, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24685.00, 1439.00, 1.00, 0.00, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1489.00, 23196.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(422, 207, 15870.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 26405.00, 1587.00, 1.00, 0.00, 7935.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 1081.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4286.00, 22119.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(423, 208, 14470.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24305.00, 1447.00, 1.00, 0.00, 7235.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1497.00, 22808.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(424, 209, 14470.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24805.00, 1447.00, 1.00, 0.00, 7235.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1497.00, 23308.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(425, 210, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 1892.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 3543.00, 20572.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(426, 211, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 1242.00, 1.00, 0.00, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 1310.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4170.00, 17060.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(427, 212, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 2484.00, 1.00, 0.00, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1413.00, 0.00, 8.00, 1340.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5295.00, 15935.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(428, 213, 12090.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20235.00, 1209.00, 1.00, 0.00, 6045.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1259.00, 18976.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(429, 214, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1560.00, 0.00, 8.00, 2314.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5333.00, 18782.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(430, 215, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1299.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 2950.00, 20165.00, NULL, NULL, 2, 2, '2017-10-10', NULL),
(431, 1, 66120.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 95468.00, 0.00, 0.00, 0.00, 26448.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 414.00, 95054.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(432, 2, 60840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 88076.00, 6084.00, 1.00, 0.00, 24336.00, 0.00, 1553.40, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8051.40, 80024.60, NULL, NULL, 2, 3, '2017-11-15', NULL);
INSERT INTO `employee_salary_sheets` (`id`, `employee_id`, `current_basic`, `new_basic_salary`, `da`, `pp`, `medical`, `convance`, `wash`, `mobile`, `cycle`, `charge`, `other`, `gross_pay`, `gpf`, `gpf_recovery`, `group_insurance`, `house_rent`, `house_loan_recovery`, `vehicle_recovery`, `telephone_recovery`, `others_recovery`, `tiffin`, `motorcycle_loan`, `house_build_recovery`, `house_repair_recovery`, `bycycle_loan`, `computer_loan`, `car_loan`, `extra_loan`, `gpf_loan`, `education`, `fixed_house_rent_recovery`, `health_insurance`, `water_supply_recovery`, `electricity_recovery`, `bf_recovery`, `gi`, `gi_recovery`, `emp_tax`, `tin_shade_recovery`, `salary_type_id`, `status`, `total_recovery`, `net_pay`, `bonus`, `bonus_type`, `fiscal_year_id`, `month_id`, `created_at`, `updated_at`) VALUES
(433, 3, 60840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 88076.00, 6084.00, 1.00, 0.00, 24336.00, 0.00, 147.20, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 7645.20, 80430.80, NULL, NULL, 2, 3, '2017-11-15', NULL),
(434, 4, 58560.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 84484.00, 5856.00, 1.00, 0.00, 23424.00, 0.00, 1258.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8528.00, 75956.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(435, 5, 56030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 80942.00, 5603.00, 1.00, 0.00, 22412.00, 0.00, 1344.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4167.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 11528.20, 69413.80, NULL, NULL, 2, 3, '2017-11-15', NULL),
(436, 6, 56030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 79942.00, 5603.00, 1.00, 0.00, 22412.00, 0.00, 507.60, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 7524.60, 72417.40, NULL, NULL, 2, 3, '2017-11-15', NULL),
(437, 7, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1.00, 0.00, 16336.00, 0.00, 59.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4557.20, 55118.80, NULL, NULL, 2, 3, '2017-11-15', NULL),
(438, 9, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1.00, 0.00, 16336.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4498.00, 55178.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(439, 10, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 533.00, 0.00, 0.00, 0.00, 730.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 4084.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 10650.00, 45740.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(440, 11, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 86.40, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4389.40, 52000.60, NULL, NULL, 2, 3, '2017-11-15', NULL),
(441, 12, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 54530.00, 3703.00, 1.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3542.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 7659.00, 46871.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(442, 13, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1.00, 0.00, 16336.00, 0.00, 64.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4562.80, 55113.20, NULL, NULL, 2, 3, '2017-11-15', NULL),
(443, 14, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55530.00, 3703.00, 1.00, 0.00, 16000.00, 0.00, 399.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4516.80, 51013.20, NULL, NULL, 2, 3, '2017-11-15', NULL),
(444, 15, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 76.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4379.80, 52010.20, NULL, NULL, 2, 3, '2017-11-15', NULL),
(445, 16, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 54530.00, 3703.00, 1.00, 0.00, 16000.00, 0.00, 137.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4254.20, 50275.80, NULL, NULL, 2, 3, '2017-11-15', NULL),
(446, 17, 33580.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50191.00, 3358.00, 1.00, 0.00, 15111.00, 0.00, 73.60, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3845.60, 46345.40, NULL, NULL, 2, 3, '2017-11-15', NULL),
(447, 18, 28100.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 42245.00, 2810.00, 1.00, 0.00, 12645.00, 0.00, 19.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3243.20, 39001.80, NULL, NULL, 2, 3, '2017-11-15', NULL),
(448, 19, 25480.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 38446.00, 2548.00, 1.00, 0.00, 11466.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 2962.00, 35484.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(449, 20, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 57390.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 108.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 5188.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 10599.00, 46791.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(450, 22, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 57390.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 7635.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 12938.00, 44452.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(451, 23, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55030.00, 3703.00, 1.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 1500.00, 500.00, 7000.00, 0.00, 12.00, 1423.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 15052.00, 39978.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(452, 24, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 57390.00, 3889.00, 1.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 7230.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 12533.00, 44857.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(453, 25, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55530.00, 3703.00, 1.00, 0.00, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5891.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 11008.00, 44522.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(454, 26, 29370.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 44586.50, 2937.00, 1.00, 0.00, 13216.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2500.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 6851.00, 37735.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(455, 27, 22550.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 35197.50, 2255.00, 1.00, 0.00, 10147.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 2669.00, 32528.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(456, 28, 28100.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 42745.00, 2810.00, 1.00, 0.00, 12645.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3224.00, 39521.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(457, 29, 29370.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 44086.50, 2937.00, 1.00, 0.00, 13216.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 3438.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8789.00, 35297.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(458, 30, 25480.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 38446.00, 2548.00, 1.00, 0.00, 11466.00, 0.00, 167.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4129.20, 34316.80, NULL, NULL, 2, 3, '2017-11-15', NULL),
(459, 31, 18530.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20030.00, 1853.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 12.00, 999.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3278.00, 16752.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(460, 32, 32390.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 75.00, 0.00, 49040.50, 3239.00, 1.00, 0.00, 14575.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3623.00, 45417.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(461, 33, 29510.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 45289.50, 2951.00, 1.00, 0.00, 13279.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3335.00, 41954.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(462, 34, 22550.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 35197.50, 2255.00, 1.00, 0.00, 10147.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3639.00, 31558.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(463, 35, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1512.00, 1.00, 0.00, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1708.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4270.00, 20410.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(464, 36, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30615.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 725.50, 0.00, 0.00, 0.00, 0.00, 0.00, 6030.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 9078.50, 21537.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(465, 37, 21470.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 33631.50, 2147.00, 1.00, 0.00, 9661.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3932.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6463.00, 27168.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(466, 38, 20360.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22860.00, 2036.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1534.00, 500.00, 0.00, 0.00, 12.00, 1116.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5812.00, 17048.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(467, 39, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30115.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 27792.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(468, 40, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 693.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4984.00, 20681.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(469, 41, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2610.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5933.00, 25182.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(470, 42, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 28542.00, 1796.00, 1.00, 0.00, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2516.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5426.00, 23116.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(471, 43, 12490.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20735.00, 1249.00, 1.00, 0.00, 6245.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1375.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3404.00, 17331.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(472, 44, 15880.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25820.00, 1588.00, 1.00, 0.00, 7940.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1638.00, 24182.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(473, 45, 10430.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 17830.00, 1043.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1823.00, 16007.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(474, 46, 13780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23170.00, 3445.00, 1.00, 0.00, 6890.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 465.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1401.00, 0.00, 12.00, 844.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6217.00, 16953.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(475, 47, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 28100.00, 1710.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2292.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5052.00, 23048.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(476, 48, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24085.00, 3597.50, 1.00, 0.00, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2209.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6586.50, 17498.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(477, 49, 13710.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22665.00, 3427.50, 1.00, 0.00, 6855.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1417.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5624.50, 17040.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(478, 50, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25265.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23704.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(479, 51, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(480, 52, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 558.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 1799.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 4008.00, 20107.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(481, 53, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17433.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 16426.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(482, 54, 13710.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23665.00, 1371.00, 1.00, 0.00, 6855.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 4645.00, 1000.00, 1560.00, 0.00, 8.00, 1831.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 10465.00, 13200.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(483, 55, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21100.00, 1200.00, 1.00, 0.00, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1250.00, 19850.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(484, 56, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2125.00, 1000.00, 1413.00, 0.00, 8.00, 1085.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6693.00, 18487.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(485, 57, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 555.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2813.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4819.00, 19296.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(486, 58, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1196.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3236.00, 18264.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(487, 59, 9850.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17350.00, 985.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1035.00, 16315.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(488, 60, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21000.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 462.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2502.00, 18498.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(489, 61, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3125.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5647.00, 19033.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(490, 62, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2040.00, 19460.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(491, 63, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17320.00, 1472.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 4916.00, 500.00, 0.00, 0.00, 8.00, 627.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 8073.00, 9247.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(492, 64, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23110.00, 1334.00, 1.00, 0.00, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 510.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1225.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3119.00, 19991.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(493, 65, 12700.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21850.00, 0.00, 0.00, 0.00, 6350.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 510.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 560.00, 21290.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(494, 66, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 492.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3370.00, 18130.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(495, 67, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 1242.00, 1.00, 0.00, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1292.00, 19938.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(496, 68, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3667.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6118.00, 17497.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(497, 69, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 1946.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4952.00, 20228.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(498, 70, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 594.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2175.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4950.00, 19165.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(499, 71, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 594.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2116.00, 23064.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(500, 72, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 0.00, 719.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3717.00, 21463.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(501, 73, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1302.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3342.00, 18158.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(502, 74, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2040.00, 19460.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(503, 75, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 621.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3143.00, 21537.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(504, 76, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23158.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(505, 77, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 1172.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5191.00, 18424.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(506, 78, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 1945.00, 1000.00, 0.00, 0.00, 0.00, 730.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 5326.00, 18789.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(507, 79, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21800.00, 1200.00, 1.00, 0.00, 7200.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1980.00, 19820.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(508, 80, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 558.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4580.00, 20600.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(509, 81, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 594.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3439.00, 1000.00, 1413.00, 0.00, 8.00, 869.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7774.00, 16341.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(510, 82, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2292.00, 1000.00, 1476.00, 0.00, 8.00, 650.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5948.00, 19232.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(511, 83, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3646.00, 500.00, 1413.00, 0.00, 8.00, 514.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 8103.00, 16577.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(512, 84, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2252.00, 22928.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(513, 85, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2181.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3632.00, 20483.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(514, 86, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 576.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2403.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4430.00, 19685.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(515, 87, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3422.00, 1000.00, 1413.00, 0.00, 8.00, 2094.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 9459.00, 15721.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(516, 88, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3150.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5331.00, 18784.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(517, 89, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 540.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3721.00, 20394.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(518, 90, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22110.00, 1334.00, 1.00, 0.00, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 450.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1834.00, 20276.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(519, 91, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1.00, 0.00, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 495.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1879.00, 20731.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(520, 92, 13050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22675.00, 1305.00, 1.00, 0.00, 6525.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1355.00, 21320.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(521, 93, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3623.00, 1000.00, 1401.00, 0.00, 8.00, 1202.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7756.00, 17424.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(522, 94, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 594.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2883.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4999.00, 19181.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(523, 95, 10050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17550.00, 1005.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1055.00, 16495.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(524, 96, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1737.00, 15196.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(525, 97, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 21664.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(526, 99, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2355.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3806.00, 19809.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(527, 100, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 2000.00, 0.00, 0.00, 0.00, 0.00, 2172.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5623.00, 17492.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(528, 101, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4311.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5762.00, 18353.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(529, 102, 24870.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 37561.50, 2487.00, 1.00, 0.00, 11191.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3871.00, 33690.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(530, 103, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 697.50, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3415.50, 24264.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(531, 104, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18680.00, 2000.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 2464.00, 0.00, 0.00, 0.00, 12.00, 708.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6234.00, 12446.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(532, 105, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1536.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 4496.00, 25271.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(533, 106, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2230.00, 27537.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(534, 107, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29267.00, 2000.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2384.00, 26883.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(535, 108, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22550.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2150.00, 20400.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(536, 109, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1760.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3180.00, 19870.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(537, 110, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 3425.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4205.00, 18845.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(538, 111, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21000.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1625.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3665.00, 17335.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(539, 112, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 510.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3010.00, 1000.00, 1560.00, 0.00, 8.00, 1369.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7908.00, 16207.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(540, 113, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(541, 114, 21450.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 34102.50, 5362.50, 1.00, 0.00, 9652.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6746.50, 27356.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(542, 115, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32109.00, 2042.00, 1.00, 0.00, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 738.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3244.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6408.00, 25701.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(543, 116, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20960.00, 1796.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 2038.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 4230.00, 16730.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(544, 117, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29042.00, 1500.00, 1.00, 0.00, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2884.00, 26158.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(545, 118, 18400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29180.00, 1840.00, 1.00, 0.00, 8280.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2954.00, 26226.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(546, 119, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21460.00, 2000.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 738.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4167.00, 1000.00, 0.00, 0.00, 12.00, 1801.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 9102.00, 12358.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(547, 120, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20960.00, 1796.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 724.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 680.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3596.50, 17363.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(548, 121, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25680.00, 1512.00, 1.00, 0.00, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1562.00, 24118.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(549, 122, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2084.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4532.00, 23148.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(550, 123, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 1481.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5497.00, 22183.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(551, 124, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27600.00, 1710.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1760.00, 25840.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(552, 125, 15880.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 26820.00, 1588.00, 1.00, 0.00, 7940.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 346.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 1285.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5567.50, 21252.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(553, 126, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27180.00, 1668.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1718.00, 25462.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(554, 127, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2241.00, 0.00, 12.00, 1088.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6632.00, 19033.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(555, 128, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2671.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4232.00, 21433.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(556, 129, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23550.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 22130.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(557, 130, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2181.00, 21934.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(558, 131, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21100.00, 1200.00, 1.00, 0.00, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1980.00, 19120.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(559, 132, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17433.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 16426.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(560, 133, 15460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25790.00, 1546.00, 1.00, 0.00, 7730.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 510.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2106.00, 23684.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(561, 134, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21000.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1257.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3297.00, 17703.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(562, 135, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 576.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2458.00, 1000.00, 0.00, 0.00, 8.00, 893.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 5657.00, 19523.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(563, 136, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24180.00, 1472.00, 1.00, 0.00, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1564.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 4016.00, 20164.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(564, 138, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 21664.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(565, 139, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 4912.00, 500.00, 0.00, 0.00, 0.00, 324.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7687.00, 15928.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(566, 140, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1.00, 0.00, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1384.00, 21226.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(567, 141, 13230.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22945.00, 1323.00, 1.00, 0.00, 6615.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1373.00, 21572.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(568, 142, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1.00, 0.00, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 1080.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2464.00, 20146.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(569, 143, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32609.00, 2042.00, 1.00, 0.00, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4775.21, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 7201.21, 25407.79, NULL, NULL, 2, 3, '2017-11-15', NULL),
(570, 144, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29267.00, 1846.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2230.00, 27037.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(571, 145, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30115.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 6467.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 9790.00, 20325.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(572, 146, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1512.00, 1.00, 0.00, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1562.00, 23618.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(573, 147, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21630.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(574, 148, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30615.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 958.50, 0.00, 0.00, 0.00, 0.00, 0.00, 718.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3999.50, 26616.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(575, 149, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22550.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21130.00, NULL, NULL, 2, 3, '2017-11-15', NULL);
INSERT INTO `employee_salary_sheets` (`id`, `employee_id`, `current_basic`, `new_basic_salary`, `da`, `pp`, `medical`, `convance`, `wash`, `mobile`, `cycle`, `charge`, `other`, `gross_pay`, `gpf`, `gpf_recovery`, `group_insurance`, `house_rent`, `house_loan_recovery`, `vehicle_recovery`, `telephone_recovery`, `others_recovery`, `tiffin`, `motorcycle_loan`, `house_build_recovery`, `house_repair_recovery`, `bycycle_loan`, `computer_loan`, `car_loan`, `extra_loan`, `gpf_loan`, `education`, `fixed_house_rent_recovery`, `health_insurance`, `water_supply_recovery`, `electricity_recovery`, `bf_recovery`, `gi`, `gi_recovery`, `emp_tax`, `tin_shade_recovery`, `salary_type_id`, `status`, `total_recovery`, `net_pay`, `bonus`, `bonus_type`, `fiscal_year_id`, `month_id`, `created_at`, `updated_at`) VALUES
(576, 150, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 510.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 730.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4175.00, 19940.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(577, 151, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 525.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 1699.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4675.00, 19440.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(578, 152, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1.00, 0.00, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1737.00, 15196.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(579, 153, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 4053.00, 27062.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(580, 154, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27600.00, 3000.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3000.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6050.00, 21550.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(581, 155, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 2632.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5083.00, 19032.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(582, 156, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1500.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1550.00, 26130.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(583, 157, 17580.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20580.00, 1758.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 1654.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3474.00, 17106.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(584, 158, 16280.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 26780.00, 1628.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 920.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2598.00, 24182.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(585, 159, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29042.00, 1796.00, 1.00, 0.00, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3180.00, 25862.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(586, 160, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29042.00, 1796.00, 1.00, 0.00, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 752.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4104.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 7036.00, 22006.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(587, 161, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29042.00, 1796.00, 1.00, 0.00, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3958.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6138.00, 22904.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(588, 162, 14400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24100.00, 1440.00, 1.00, 0.00, 7200.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3220.00, 20880.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(589, 163, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24085.00, 1439.00, 1.00, 0.00, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1489.00, 22596.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(590, 164, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1560.00, 0.00, 8.00, 1060.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5079.00, 19036.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(591, 165, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20600.00, 1200.00, 1.00, 0.00, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2980.00, 17620.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(592, 166, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22000.00, 1260.00, 1.00, 0.00, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2363.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4673.00, 17327.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(593, 167, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31609.00, 2042.00, 1.00, 0.00, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2426.00, 29183.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(594, 168, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30615.50, 1939.00, 1.00, 0.00, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28292.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(595, 169, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3230.00, 26537.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(596, 170, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1.00, 0.00, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 920.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 2962.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 8410.00, 21357.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(597, 171, 13040.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15540.00, 1304.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 12.00, 1144.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3240.00, 12300.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(598, 172, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15120.00, 1312.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 12.00, 1454.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3558.00, 11562.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(599, 173, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25165.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23604.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(600, 174, 13780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22670.00, 1378.00, 1.00, 0.00, 6890.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1428.00, 21242.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(601, 175, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21680.00, 1312.00, 1.00, 0.00, 6560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2092.00, 19588.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(602, 176, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(603, 177, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(604, 178, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3396.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5847.00, 17268.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(605, 179, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 525.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2584.00, 1000.00, 1401.00, 0.00, 8.00, 1653.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7622.00, 16493.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(606, 180, 23680.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 36836.00, 2368.00, 1.00, 0.00, 10656.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5515.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 9267.00, 27569.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(607, 181, 12740.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21110.00, 0.00, 0.00, 0.00, 6370.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 50.00, 21060.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(608, 182, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 3502.50, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5282.50, 17832.50, NULL, NULL, 2, 3, '2017-11-15', NULL),
(609, 183, 26760.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 40302.00, 2676.00, 1.00, 0.00, 12042.00, 0.00, 0.00, 0.00, 0.00, 0.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2175.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5965.00, 34337.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(610, 184, 10430.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 17830.00, 1043.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1093.00, 16737.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(611, 185, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1025.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3175.00, 19875.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(612, 186, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2896.00, 500.00, 1476.00, 0.00, 8.00, 784.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7345.00, 16270.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(613, 187, 26120.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 40374.00, 2612.00, 1.00, 0.00, 11754.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 10523.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 13519.00, 26855.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(614, 188, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 555.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2879.00, 1000.00, 1476.00, 0.00, 8.00, 1001.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7370.00, 16745.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(615, 189, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 19680.00, 2000.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4105.00, 1000.00, 0.00, 0.00, 12.00, 1031.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 8198.00, 11482.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(616, 190, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1.00, 0.00, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(617, 191, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 32709.00, 2042.00, 1.00, 0.00, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 813.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1250.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 4489.00, 28220.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(618, 192, 13050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22175.00, 1305.00, 1.00, 0.00, 6525.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 979.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2334.00, 19841.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(619, 193, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 28200.00, 1710.00, 1.00, 0.00, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2490.00, 25710.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(620, 194, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2150.00, 21000.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(621, 195, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25780.00, 1512.00, 1.00, 0.00, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1655.00, 1000.00, 2241.00, 0.00, 8.00, 763.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6229.00, 19551.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(622, 196, 14400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24200.00, 1440.00, 1.00, 0.00, 7200.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1449.00, 500.00, 2241.00, 0.00, 8.00, 116.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5304.00, 18896.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(623, 197, 12410.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22456.00, 1241.00, 1.00, 0.00, 7446.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 730.00, 500.00, 1401.00, 0.00, 8.00, 923.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4353.00, 18103.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(624, 198, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25765.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1437.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4728.00, 21037.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(625, 199, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21780.00, 1312.00, 1.00, 0.00, 6560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 629.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2721.00, 19059.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(626, 200, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24765.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2241.00, 0.00, 8.00, 1538.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6078.00, 18687.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(627, 201, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 656.00, 500.00, 2241.00, 0.00, 8.00, 735.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5790.00, 17360.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(628, 202, 11320.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20212.00, 1132.00, 1.00, 0.00, 6792.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1182.00, 19030.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(629, 203, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1.00, 0.00, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 750.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2900.00, 20250.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(630, 204, 15110.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25465.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 2655.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5216.00, 20249.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(631, 205, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25265.00, 1511.00, 1.00, 0.00, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 834.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3125.00, 22140.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(632, 206, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24685.00, 1439.00, 1.00, 0.00, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3219.00, 21466.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(633, 207, 15870.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 26405.00, 1587.00, 1.00, 0.00, 7935.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 542.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3747.00, 22658.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(634, 208, 14470.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24305.00, 1447.00, 1.00, 0.00, 7235.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3186.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5683.00, 18622.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(635, 209, 14470.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24805.00, 1447.00, 1.00, 0.00, 7235.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3086.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5123.00, 19682.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(636, 210, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 669.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3000.00, 1000.00, 0.00, 0.00, 0.00, 1113.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 6433.00, 17682.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(637, 211, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 1242.00, 1.00, 0.00, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 438.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3298.00, 17932.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(638, 212, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 2484.00, 1.00, 0.00, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1413.00, 0.00, 8.00, 680.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5365.00, 15865.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(639, 213, 12090.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20235.00, 1209.00, 1.00, 0.00, 6045.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1989.00, 18246.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(640, 214, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4715.00, 1000.00, 1560.00, 0.00, 8.00, 1229.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 9693.00, 14422.00, NULL, NULL, 2, 3, '2017-11-15', NULL),
(641, 215, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1.00, 0.00, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2215.16, 0.00, 0.00, 0.00, 0.00, 1000.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 4866.16, 18248.84, NULL, NULL, 2, 3, '2017-11-15', NULL),
(642, 32, 16717.42, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 75.00, 0.00, 33367.92, 3239.00, 1.00, 0.00, 14575.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5025.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 8648.00, 24719.92, NULL, NULL, 2, 4, '2017-11-19', NULL);

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
(1, 'Permanent'),
(2, 'Depotation'),
(3, 'Temporaty');

-- --------------------------------------------------------

--
-- Table structure for table `entry_types`
--

CREATE TABLE `entry_types` (
  `id` int(7) NOT NULL,
  `entry_type` varchar(64) NOT NULL,
  `user_id` int(5) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entry_types`
--

INSERT INTO `entry_types` (`id`, `entry_type`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'প্রাপ্তি', 1, '2017-09-29 00:00:00', '2017-09-29 22:53:37'),
(2, 'প্রদান', 1, '2017-09-29 22:54:15', '0000-00-00 00:00:00'),
(3, 'সমন্বয়', 1, '2017-09-29 22:54:15', '0000-00-00 00:00:00');

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
(1, '2015-2016'),
(2, '2016-2017'),
(3, '2017-2018'),
(4, '2018-2019'),
(5, '2019-2020'),
(6, '2020-2021'),
(7, '2021-2022'),
(8, '2022-2023'),
(9, '2023-2024'),
(10, '2024-2025');

-- --------------------------------------------------------

--
-- Table structure for table `fiscal_year_settings`
--

CREATE TABLE `fiscal_year_settings` (
  `id` int(11) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `working_day` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fiscal_year_settings`
--

INSERT INTO `fiscal_year_settings` (`id`, `fiscal_year_id`, `month_id`, `working_day`) VALUES
(1, 1, 1, 31),
(2, 1, 2, 31),
(3, 1, 3, 30),
(4, 1, 4, 31),
(5, 1, 5, 30),
(6, 1, 6, 31),
(7, 1, 7, 31),
(8, 1, 8, 29),
(9, 1, 9, 31),
(10, 1, 10, 30),
(11, 1, 11, 31),
(12, 1, 12, 30),
(13, 2, 1, 31),
(14, 2, 2, 31),
(15, 2, 3, 30),
(16, 2, 4, 31),
(17, 2, 5, 30),
(18, 2, 6, 31),
(19, 2, 7, 31),
(20, 2, 8, 28),
(21, 2, 9, 31),
(22, 2, 10, 30),
(23, 2, 11, 31),
(24, 2, 12, 30),
(25, 3, 1, 31),
(26, 3, 2, 31),
(27, 3, 3, 30),
(28, 3, 4, 31),
(29, 3, 5, 30),
(30, 3, 6, 31),
(31, 3, 7, 31),
(32, 3, 8, 28),
(33, 3, 9, 31),
(34, 3, 10, 30),
(35, 3, 11, 31),
(36, 3, 12, 30);

-- --------------------------------------------------------

--
-- Table structure for table `fix_deposits`
--

CREATE TABLE `fix_deposits` (
  `id` int(11) NOT NULL,
  `daily_transaction_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `acc_head_list_id` int(11) NOT NULL,
  `deposit_bank_name` varchar(100) DEFAULT NULL,
  `fix_deposit_bank_name` varchar(100) NOT NULL,
  `fix_deposit_branch_name` varchar(100) NOT NULL,
  `fix_deposit_no` varchar(100) NOT NULL,
  `interest_rate` decimal(8,2) NOT NULL,
  `investment_date` date NOT NULL,
  `investment_expire_date` date NOT NULL,
  `investment_amount` decimal(12,2) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gpf_subscriptions`
--

CREATE TABLE `gpf_subscriptions` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `employee_loan_id` int(11) NOT NULL DEFAULT '0',
  `fiscal_year_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `subscription_recovery` double(12,2) NOT NULL DEFAULT '0.00',
  `total_subscription_balance` double(12,2) NOT NULL DEFAULT '0.00',
  `subscription_interest` double(12,2) NOT NULL DEFAULT '0.00',
  `current_balance_date` date DEFAULT NULL,
  `loan_amount` double(12,2) NOT NULL DEFAULT '0.00',
  `loan_recovery` double(12,2) NOT NULL DEFAULT '0.00',
  `loan_interest_amount` double(12,2) NOT NULL DEFAULT '0.00',
  `loan_interest_recovery` double(12,2) NOT NULL DEFAULT '0.00',
  `loan_date` date DEFAULT NULL,
  `sub_status` int(1) NOT NULL DEFAULT '0',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gpf_subscriptions`
--

INSERT INTO `gpf_subscriptions` (`id`, `employee_id`, `employee_loan_id`, `fiscal_year_id`, `month_id`, `subscription_recovery`, `total_subscription_balance`, `subscription_interest`, `current_balance_date`, `loan_amount`, `loan_recovery`, `loan_interest_amount`, `loan_interest_recovery`, `loan_date`, `sub_status`, `created_at`, `updated_at`) VALUES
(1, 143, 0, 2, 1, 0.00, 274619.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(2, 144, 0, 2, 1, 0.00, 55792.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(3, 145, 0, 2, 1, 0.00, 176995.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(4, 146, 0, 2, 1, 0.00, 134575.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(5, 147, 0, 2, 1, 0.00, 127106.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(6, 148, 0, 2, 1, 0.00, 133472.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(7, 149, 0, 2, 1, 0.00, 123067.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(8, 150, 0, 2, 1, 0.00, 227544.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(9, 151, 0, 2, 1, 0.00, 186478.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(10, 152, 0, 2, 1, 0.00, 9504.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(11, 153, 0, 2, 1, 0.00, 313988.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(12, 154, 0, 2, 1, 0.00, 466966.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(13, 155, 0, 2, 1, 0.00, 96324.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(14, 156, 0, 2, 1, 0.00, 392116.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(15, 157, 0, 2, 1, 0.00, 414488.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(16, 158, 0, 2, 1, 0.00, 387316.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(17, 159, 0, 2, 1, 0.00, 296791.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(18, 160, 0, 2, 1, 0.00, 106819.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(19, 161, 0, 2, 1, 0.00, 127764.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(20, 162, 0, 2, 1, 0.00, 114263.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(21, 163, 0, 2, 1, 0.00, 133498.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(22, 164, 0, 2, 1, 0.00, 266577.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(23, 165, 0, 2, 1, 0.00, 107600.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(24, 166, 0, 2, 1, 0.00, 63623.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(25, 167, 0, 2, 1, 0.00, 365475.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(26, 168, 0, 2, 1, 0.00, 454405.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(27, 169, 0, 2, 1, 0.00, 120547.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(28, 170, 0, 2, 1, 0.00, 342728.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(29, 171, 0, 2, 1, 0.00, 187979.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(30, 172, 0, 2, 1, 0.00, 108937.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(31, 173, 0, 2, 1, 0.00, 136183.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(32, 174, 0, 2, 1, 0.00, 117930.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(33, 175, 0, 2, 1, 0.00, 93497.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(34, 176, 0, 2, 1, 0.00, 10370.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(35, 177, 0, 2, 1, 0.00, 10840.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(36, 178, 0, 2, 1, 0.00, 153451.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(37, 179, 0, 2, 1, 0.00, 112716.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(38, 180, 0, 2, 1, 0.00, 101119.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(39, 181, 0, 2, 1, 0.00, 7790.49, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(40, 182, 0, 2, 1, 0.00, 119698.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(41, 183, 0, 2, 1, 0.00, 107172.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(42, 184, 0, 2, 1, 0.00, 10410.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(43, 185, 0, 2, 1, 0.00, 64988.70, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(44, 186, 0, 2, 1, 0.00, 85054.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(45, 187, 0, 2, 1, 0.00, 475040.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(46, 188, 0, 2, 1, 0.00, 73033.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(47, 189, 0, 2, 1, 0.00, 183472.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(48, 190, 0, 2, 1, 0.00, 10840.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(49, 191, 0, 2, 1, 0.00, 224810.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(50, 192, 0, 2, 1, 0.00, 104853.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(51, 193, 0, 2, 1, 0.00, 138125.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(52, 194, 0, 2, 1, 0.00, 57191.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(53, 195, 0, 2, 1, 0.00, 50513.10, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(54, 196, 0, 2, 1, 0.00, 112295.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(55, 197, 0, 2, 1, 0.00, 56378.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(56, 198, 0, 2, 1, 0.00, 35916.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(57, 199, 0, 2, 1, 0.00, 80320.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(58, 200, 0, 2, 1, 0.00, 994804.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(59, 201, 0, 2, 1, 0.00, 82582.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(60, 202, 0, 2, 1, 0.00, 11146.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(61, 203, 0, 2, 1, 0.00, 69729.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(62, 204, 0, 2, 1, 0.00, 41625.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(63, 205, 0, 2, 1, 0.00, 216996.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(64, 206, 0, 2, 1, 0.00, 280011.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(65, 207, 0, 2, 1, 0.00, 248099.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(66, 208, 0, 2, 1, 0.00, 158091.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(67, 209, 0, 2, 1, 0.00, 233592.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(68, 210, 0, 2, 1, 0.00, 214447.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(69, 211, 0, 2, 1, 0.00, 99228.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(70, 212, 0, 2, 1, 0.00, 152370.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(71, 213, 0, 2, 1, 0.00, 98465.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(72, 214, 0, 2, 1, 0.00, 163215.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(73, 2, 0, 2, 1, 0.00, 965190.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(74, 3, 0, 2, 1, 0.00, 78389.20, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(75, 4, 0, 2, 1, 0.00, 916285.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(76, 5, 0, 2, 1, 0.00, 685996.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(77, 6, 0, 2, 1, 0.00, 800356.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(78, 7, 0, 2, 1, 0.00, 719853.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(79, 8, 0, 2, 1, 0.00, 550236.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(80, 9, 0, 2, 1, 0.00, 677476.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(81, 10, 0, 2, 1, 0.00, 147038.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(82, 11, 0, 2, 1, 0.00, 452185.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(83, 12, 0, 2, 1, 0.00, 129813.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(84, 13, 0, 2, 1, 0.00, 195601.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(85, 14, 0, 2, 1, 0.00, 255782.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(86, 15, 0, 2, 1, 0.00, 302335.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(87, 16, 0, 2, 1, 0.00, 239637.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(88, 17, 0, 2, 1, 0.00, 118646.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(89, 18, 0, 2, 1, 0.00, 115192.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(90, 19, 0, 2, 1, 0.00, 14161.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(91, 20, 0, 2, 1, 0.00, 184382.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(92, 21, 0, 2, 1, 0.00, 605491.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(93, 22, 0, 2, 1, 0.00, 208476.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(94, 23, 0, 2, 1, 0.00, 393872.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(95, 24, 0, 2, 1, 0.00, 249094.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(96, 25, 0, 2, 1, 0.00, 149735.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(97, 26, 0, 2, 1, 0.00, 154462.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(98, 27, 0, 2, 1, 0.00, 361924.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(99, 28, 0, 2, 1, 0.00, 225317.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(100, 29, 0, 2, 1, 0.00, 286053.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(101, 30, 0, 2, 1, 0.00, 174714.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(102, 31, 0, 2, 1, 0.00, 7201.76, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(103, 32, 0, 2, 1, 0.00, 58273.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(104, 33, 0, 2, 1, 0.00, 172108.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(105, 34, 0, 2, 1, 0.00, 103293.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(106, 35, 0, 2, 1, 0.00, 60567.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(107, 36, 0, 2, 1, 0.00, 101419.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(108, 37, 0, 2, 1, 0.00, 956304.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(109, 38, 0, 2, 1, 0.00, 848305.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(110, 39, 0, 2, 1, 0.00, 160382.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(111, 40, 0, 2, 1, 0.00, 236680.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(112, 41, 0, 2, 1, 0.00, 204149.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(113, 42, 0, 2, 1, 0.00, 223191.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(114, 43, 0, 2, 1, 0.00, 46115.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(115, 44, 0, 2, 1, 0.00, 207412.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(116, 45, 0, 2, 1, 0.00, 10410.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(117, 46, 0, 2, 1, 0.00, 215939.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(118, 47, 0, 2, 1, 0.00, 82033.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(119, 48, 0, 2, 1, 0.00, 94613.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(120, 49, 0, 2, 1, 0.00, 10587.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(121, 50, 0, 2, 1, 0.00, 236680.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(122, 51, 0, 2, 1, 0.00, 5850.89, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(123, 52, 0, 2, 1, 0.00, 247673.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(124, 53, 0, 2, 1, 0.00, 5850.89, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(125, 54, 0, 2, 1, 0.00, 65000.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(126, 55, 0, 2, 1, 0.00, 104517.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(127, 56, 0, 2, 1, 0.00, 44739.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(128, 57, 0, 2, 1, 0.00, 118547.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(129, 58, 0, 2, 1, 0.00, 42523.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(130, 59, 0, 2, 1, 0.00, 9821.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(131, 60, 0, 2, 1, 0.00, 97344.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(132, 61, 0, 2, 1, 0.00, 146868.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(133, 62, 0, 2, 1, 0.00, 93535.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(134, 63, 0, 2, 1, 0.00, 117804.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(135, 64, 0, 2, 1, 0.00, 165810.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(136, 65, 0, 2, 1, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(137, 66, 0, 2, 1, 0.00, 107959.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(138, 67, 0, 2, 1, 0.00, 147998.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(139, 68, 0, 2, 1, 0.00, 167202.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(140, 69, 0, 2, 1, 0.00, 257535.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(141, 70, 0, 2, 1, 0.00, 174779.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(142, 71, 0, 2, 1, 0.00, 278464.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(143, 72, 0, 2, 1, 0.00, 227918.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(144, 73, 0, 2, 1, 0.00, 45668.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(145, 74, 0, 2, 1, 0.00, 103438.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(146, 75, 0, 2, 1, 0.00, 161892.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(147, 76, 0, 2, 1, 0.00, 354214.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(148, 77, 0, 2, 1, 0.00, 59158.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(149, 78, 0, 2, 1, 0.00, 150201.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(150, 79, 0, 2, 1, 0.00, 99657.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(151, 80, 0, 2, 1, 0.00, 178786.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(152, 81, 0, 2, 1, 0.00, 80450.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(153, 82, 0, 2, 1, 0.00, 129406.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(154, 83, 0, 2, 1, 0.00, 129571.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(155, 84, 0, 2, 1, 0.00, 266840.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(156, 85, 0, 2, 1, 0.00, 194496.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(157, 86, 0, 2, 1, 0.00, 46471.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(158, 87, 0, 2, 1, 0.00, 109299.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(159, 88, 0, 2, 1, 0.00, 130315.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(160, 89, 0, 2, 1, 0.00, 132742.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(161, 90, 0, 2, 1, 0.00, 105455.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(162, 91, 0, 2, 1, 0.00, 170015.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(163, 92, 0, 2, 1, 0.00, 123853.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(164, 93, 0, 2, 1, 0.00, 168328.27, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(165, 94, 0, 2, 1, 0.00, 178092.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(166, 95, 0, 2, 1, 0.00, 9824.09, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(167, 96, 0, 2, 1, 0.00, 9504.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(168, 97, 0, 2, 1, 0.00, 265200.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(169, 98, 0, 2, 1, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(170, 99, 0, 2, 1, 0.00, 109629.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(171, 215, 0, 2, 1, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(172, 100, 0, 2, 1, 0.00, 175504.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(173, 101, 0, 2, 1, 0.00, 287394.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(174, 102, 0, 2, 1, 0.00, 280904.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(175, 103, 0, 2, 1, 0.00, 295754.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(176, 104, 0, 2, 1, 0.00, 252209.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(177, 105, 0, 2, 1, 0.00, 102365.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(178, 106, 0, 2, 1, 0.00, 283822.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(179, 107, 0, 2, 1, 0.00, 254369.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(180, 108, 0, 2, 1, 0.00, 124339.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(181, 109, 0, 2, 1, 0.00, 72895.10, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(182, 110, 0, 2, 1, 0.00, 179223.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(183, 111, 0, 2, 1, 0.00, 41920.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(184, 112, 0, 2, 1, 0.00, 60676.20, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(185, 113, 0, 2, 1, 0.00, 9504.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(186, 114, 0, 2, 1, 0.00, 616777.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(187, 115, 0, 2, 1, 0.00, 144369.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(188, 116, 0, 2, 1, 0.00, 440113.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(189, 117, 0, 2, 1, 0.00, 533313.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(190, 118, 0, 2, 1, 0.00, 389310.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(191, 119, 0, 2, 1, 0.00, 370259.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(192, 120, 0, 2, 1, 0.00, 313670.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(193, 121, 0, 2, 1, 0.00, 141023.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(194, 122, 0, 2, 1, 0.00, 242315.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(195, 123, 0, 2, 1, 0.00, 275806.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(196, 124, 0, 2, 1, 0.00, 214400.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(197, 125, 0, 2, 1, 0.00, 262215.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(198, 126, 0, 2, 1, 0.00, 172229.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(199, 127, 0, 2, 1, 0.00, 296826.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(200, 128, 0, 2, 1, 0.00, 189948.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(201, 129, 0, 2, 1, 0.00, 94586.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(202, 130, 0, 2, 1, 0.00, 68447.70, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(203, 131, 0, 2, 1, 0.00, 104844.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(204, 132, 0, 2, 1, 0.00, 9504.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(205, 133, 0, 2, 1, 0.00, 235330.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(206, 134, 0, 2, 1, 0.00, 32228.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(207, 135, 0, 2, 1, 0.00, 117159.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(208, 136, 0, 2, 1, 0.00, 266428.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(209, 137, 0, 2, 1, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(210, 138, 0, 2, 1, 0.00, 126300.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(211, 139, 0, 2, 1, 0.00, 133221.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(212, 140, 0, 2, 1, 0.00, 107632.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(213, 141, 0, 2, 1, 0.00, 53327.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(214, 142, 0, 2, 1, 0.00, 175113.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(215, 1, 0, 2, 1, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0, NULL, NULL),
(216, 2, 0, 2, 1, 6084.00, 971274.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(217, 3, 0, 2, 1, 6084.00, 84473.20, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(218, 4, 0, 2, 1, 5856.00, 922141.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(219, 5, 0, 2, 1, 5603.00, 691599.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(220, 5, 154, 2, 1, 0.00, 695766.00, 0.00, NULL, 0.00, 4167.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(221, 6, 154, 2, 1, 5603.00, 805959.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(222, 7, 154, 2, 1, 4084.00, 723937.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(223, 9, 154, 2, 1, 4084.00, 681560.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(224, 10, 154, 2, 1, 3889.00, 150927.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(225, 10, 155, 2, 1, 0.00, 155011.00, 0.00, NULL, 0.00, 4084.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(226, 11, 155, 2, 1, 3889.00, 456074.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(227, 12, 155, 2, 1, 3703.00, 133516.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(228, 12, 166, 2, 1, 0.00, 137058.00, 0.00, NULL, 0.00, 3542.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(229, 13, 166, 2, 1, 4084.00, 199685.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(230, 14, 166, 2, 1, 3703.00, 259485.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(231, 15, 166, 2, 1, 3889.00, 306224.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(232, 16, 166, 2, 1, 3703.00, 243340.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(233, 17, 166, 2, 1, 3358.00, 122004.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(234, 18, 166, 2, 1, 2810.00, 118002.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(235, 19, 166, 2, 1, 2548.00, 16709.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(236, 20, 166, 2, 1, 3889.00, 188271.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(237, 20, 217, 2, 1, 0.00, 193459.00, 0.00, NULL, 0.00, 5188.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(238, 21, 217, 2, 1, 3526.00, 609017.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(239, 22, 217, 2, 1, 3889.00, 212365.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(240, 22, 275, 2, 1, 0.00, 220000.00, 0.00, NULL, 0.00, 7635.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(241, 23, 275, 2, 1, 3703.00, 397575.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(242, 23, 219, 2, 1, 0.00, 399075.00, 0.00, NULL, 0.00, 1500.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(243, 24, 219, 2, 1, 3889.00, 252983.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(244, 24, 220, 2, 1, 0.00, 260213.00, 0.00, NULL, 0.00, 7230.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(245, 25, 220, 2, 1, 3703.00, 153438.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(246, 25, 221, 2, 1, 0.00, 159329.00, 0.00, NULL, 0.00, 5891.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(247, 26, 221, 2, 1, 2937.00, 157399.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(248, 26, 222, 2, 1, 0.00, 159899.00, 0.00, NULL, 0.00, 2500.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(249, 27, 222, 2, 1, 2255.00, 364179.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(250, 28, 222, 2, 1, 2810.00, 228127.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(251, 29, 222, 2, 1, 2937.00, 288990.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(252, 29, 223, 2, 1, 0.00, 292428.00, 0.00, NULL, 0.00, 3438.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(253, 30, 223, 2, 1, 2548.00, 177262.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(254, 31, 223, 2, 1, 1853.00, 9054.76, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(255, 32, 223, 2, 1, 3239.00, 61512.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(256, 32, 224, 2, 1, 0.00, 66537.60, 0.00, NULL, 0.00, 5025.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(257, 33, 224, 2, 1, 2951.00, 175059.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(258, 34, 224, 2, 1, 2255.00, 105548.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(259, 35, 224, 2, 1, 1512.00, 62079.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(260, 35, 225, 2, 1, 0.00, 63787.00, 0.00, NULL, 0.00, 1708.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(261, 36, 225, 2, 1, 1939.00, 103358.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(262, 36, 292, 2, 1, 0.00, 107555.00, 0.00, NULL, 0.00, 4197.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(263, 36, 293, 2, 1, 0.00, 109388.00, 0.00, NULL, 0.00, 1833.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(264, 37, 293, 2, 1, 2147.00, 958451.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(265, 37, 180, 2, 1, 0.00, 962383.00, 0.00, NULL, 0.00, 3932.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(266, 38, 180, 2, 1, 2036.00, 850341.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(267, 38, 228, 2, 1, 0.00, 851875.00, 0.00, NULL, 0.00, 1534.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(268, 39, 228, 2, 1, 1939.00, 162321.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(269, 40, 228, 2, 1, 1511.00, 238191.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(270, 40, 229, 2, 1, 0.00, 240921.00, 0.00, NULL, 0.00, 2730.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(271, 41, 229, 2, 1, 1939.00, 206088.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(272, 41, 230, 2, 1, 0.00, 208698.00, 0.00, NULL, 0.00, 2610.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(273, 42, 230, 2, 1, 1796.00, 224987.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(274, 42, 231, 2, 1, 0.00, 227503.00, 0.00, NULL, 0.00, 2516.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(275, 43, 231, 2, 1, 1249.00, 47364.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(276, 43, 186, 2, 1, 0.00, 48739.40, 0.00, NULL, 0.00, 1375.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(277, 44, 186, 2, 1, 1588.00, 209000.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(278, 45, 186, 2, 1, 1043.00, 11453.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(279, 46, 186, 2, 1, 3445.00, 219384.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(280, 47, 186, 2, 1, 1710.00, 83743.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(281, 47, 282, 2, 1, 0.00, 86035.40, 0.00, NULL, 0.00, 2292.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(282, 48, 282, 2, 1, 3597.50, 98211.10, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(283, 48, 234, 2, 1, 0.00, 100420.10, 0.00, NULL, 0.00, 2209.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(284, 49, 234, 2, 1, 3427.50, 14015.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(285, 49, 235, 2, 1, 0.00, 15432.30, 0.00, NULL, 0.00, 1417.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(286, 50, 235, 2, 1, 1511.00, 238191.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(287, 51, 235, 2, 1, 957.00, 6807.89, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(288, 52, 235, 2, 1, 1401.00, 249074.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(289, 53, 235, 2, 1, 957.00, 6807.89, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(290, 54, 235, 2, 1, 1371.00, 66371.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(291, 54, 294, 2, 1, 0.00, 68413.60, 0.00, NULL, 0.00, 2042.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(292, 54, 295, 2, 1, 0.00, 69996.60, 0.00, NULL, 0.00, 1583.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(293, 54, 296, 2, 1, 0.00, 71016.60, 0.00, NULL, 0.00, 1020.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(294, 55, 296, 2, 1, 1200.00, 105717.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(295, 56, 296, 2, 1, 1472.00, 46211.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(296, 56, 283, 2, 1, 0.00, 48336.40, 0.00, NULL, 0.00, 2125.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(297, 57, 283, 2, 1, 1401.00, 119948.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(298, 57, 236, 2, 1, 0.00, 122761.00, 0.00, NULL, 0.00, 2813.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(299, 58, 236, 2, 1, 1260.00, 43783.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(300, 58, 237, 2, 1, 0.00, 44979.40, 0.00, NULL, 0.00, 1196.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(301, 59, 237, 2, 1, 985.00, 10806.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(302, 60, 237, 2, 1, 1260.00, 98604.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(303, 60, 238, 2, 1, 0.00, 99066.50, 0.00, NULL, 0.00, 462.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(304, 61, 238, 2, 1, 1472.00, 148340.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(305, 61, 239, 2, 1, 0.00, 151465.00, 0.00, NULL, 0.00, 3125.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(306, 62, 239, 2, 1, 1260.00, 94795.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(307, 63, 239, 2, 1, 1472.00, 119276.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(308, 63, 284, 2, 1, 0.00, 121451.00, 0.00, NULL, 0.00, 2175.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(309, 63, 291, 2, 1, 0.00, 124192.00, 0.00, NULL, 0.00, 2741.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(310, 64, 291, 2, 1, 1334.00, 167144.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(311, 64, 241, 2, 1, 0.00, 168369.00, 0.00, NULL, 0.00, 1225.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(312, 66, 241, 2, 1, 1260.00, 109219.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(313, 67, 241, 2, 1, 1242.00, 149240.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(314, 68, 241, 2, 1, 1401.00, 168603.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(315, 68, 242, 2, 1, 0.00, 172270.00, 0.00, NULL, 0.00, 3667.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(316, 69, 242, 2, 1, 1472.00, 259007.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(317, 70, 242, 2, 1, 1401.00, 176180.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(318, 70, 243, 2, 1, 0.00, 178355.00, 0.00, NULL, 0.00, 2175.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(319, 71, 243, 2, 1, 1472.00, 279936.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(320, 72, 243, 2, 1, 1472.00, 229390.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(321, 73, 243, 2, 1, 1260.00, 46928.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(322, 73, 244, 2, 1, 0.00, 48230.50, 0.00, NULL, 0.00, 1302.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(323, 74, 244, 2, 1, 1260.00, 104698.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(324, 75, 244, 2, 1, 1472.00, 163364.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(325, 76, 244, 2, 1, 1472.00, 355686.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(326, 77, 244, 2, 1, 1401.00, 60559.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(327, 78, 244, 2, 1, 1401.00, 151602.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(328, 78, 245, 2, 1, 0.00, 153547.00, 0.00, NULL, 0.00, 1945.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(329, 79, 245, 2, 1, 1200.00, 100857.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(330, 80, 245, 2, 1, 1472.00, 180258.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(331, 80, 246, 2, 1, 0.00, 182758.00, 0.00, NULL, 0.00, 2500.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(332, 81, 246, 2, 1, 1401.00, 81851.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(333, 81, 297, 2, 1, 0.00, 82851.30, 0.00, NULL, 0.00, 1000.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(334, 81, 331, 2, 1, 0.00, 85290.30, 0.00, NULL, 0.00, 2439.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(335, 82, 331, 2, 1, 1472.00, 130878.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(336, 82, 305, 2, 1, 0.00, 133170.00, 0.00, NULL, 0.00, 2292.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(337, 83, 305, 2, 1, 1472.00, 131043.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(338, 83, 247, 2, 1, 0.00, 134689.00, 0.00, NULL, 0.00, 3646.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(339, 84, 247, 2, 1, 1472.00, 268312.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(340, 85, 247, 2, 1, 1401.00, 195897.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(341, 85, 248, 2, 1, 0.00, 198078.00, 0.00, NULL, 0.00, 2181.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(342, 86, 248, 2, 1, 1401.00, 47872.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(343, 86, 249, 2, 1, 0.00, 50275.00, 0.00, NULL, 0.00, 2403.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(344, 87, 249, 2, 1, 1472.00, 110771.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(345, 87, 298, 2, 1, 0.00, 112618.00, 0.00, NULL, 0.00, 1847.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(346, 87, 299, 2, 1, 0.00, 114193.00, 0.00, NULL, 0.00, 1575.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(347, 88, 299, 2, 1, 1401.00, 131716.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(348, 88, 250, 2, 1, 0.00, 134866.00, 0.00, NULL, 0.00, 3150.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(349, 89, 250, 2, 1, 1401.00, 134143.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(350, 90, 250, 2, 1, 1334.00, 106789.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(351, 91, 250, 2, 1, 1334.00, 171349.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(352, 92, 250, 2, 1, 1305.00, 125158.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(353, 93, 250, 2, 1, 1472.00, 169800.27, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(354, 93, 251, 2, 1, 0.00, 173423.27, 0.00, NULL, 0.00, 3623.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(355, 94, 251, 2, 1, 1472.00, 179564.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(356, 94, 252, 2, 1, 0.00, 182447.00, 0.00, NULL, 0.00, 2883.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(357, 95, 252, 2, 1, 1005.00, 10829.09, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(358, 96, 252, 2, 1, 957.00, 10461.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(359, 97, 252, 2, 1, 1401.00, 266601.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(360, 98, 252, 2, 1, 275.50, 275.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(361, 99, 252, 2, 1, 1401.00, 111030.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(362, 99, 300, 2, 1, 0.00, 113385.00, 0.00, NULL, 0.00, 2355.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(363, 100, 300, 2, 1, 1401.00, 176905.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(364, 100, 254, 2, 1, 0.00, 179077.00, 0.00, NULL, 0.00, 2172.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(365, 101, 254, 2, 1, 1401.00, 288795.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(366, 102, 254, 2, 1, 2487.00, 283391.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(367, 102, 301, 2, 1, 0.00, 284391.00, 0.00, NULL, 0.00, 1000.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(368, 103, 301, 2, 1, 1668.00, 297422.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(369, 104, 301, 2, 1, 2000.00, 254209.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(370, 104, 255, 2, 1, 0.00, 256673.00, 0.00, NULL, 0.00, 2464.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(371, 105, 255, 2, 1, 1846.00, 104211.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(372, 106, 255, 2, 1, 1846.00, 285668.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(373, 107, 255, 2, 1, 2000.00, 256369.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(374, 108, 255, 2, 1, 1370.00, 125709.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(375, 109, 255, 2, 1, 1370.00, 74265.10, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(376, 109, 303, 2, 1, 0.00, 75265.10, 0.00, NULL, 0.00, 1000.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(377, 110, 303, 2, 1, 3425.00, 182648.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(378, 111, 303, 2, 1, 1260.00, 43180.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(379, 111, 256, 2, 1, 0.00, 44805.50, 0.00, NULL, 0.00, 1625.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(380, 112, 256, 2, 1, 1401.00, 62077.20, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(381, 112, 304, 2, 1, 0.00, 63857.20, 0.00, NULL, 0.00, 1780.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(382, 112, 328, 2, 1, 0.00, 65087.20, 0.00, NULL, 0.00, 1230.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(383, 113, 328, 2, 1, 957.00, 10461.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(384, 114, 328, 2, 1, 5362.50, 622139.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(385, 115, 328, 2, 1, 2042.00, 146411.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(386, 115, 257, 2, 1, 0.00, 152939.00, 0.00, NULL, 0.00, 6528.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(387, 116, 257, 2, 1, 1796.00, 441909.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(388, 117, 257, 2, 1, 1500.00, 534813.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(389, 118, 257, 2, 1, 1840.00, 391150.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(390, 119, 257, 2, 1, 2000.00, 372259.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(391, 119, 258, 2, 1, 0.00, 376426.00, 0.00, NULL, 0.00, 4167.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(392, 120, 258, 2, 1, 1796.00, 315466.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(393, 121, 258, 2, 1, 1512.00, 142535.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(394, 122, 258, 2, 1, 1668.00, 243983.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(395, 122, 259, 2, 1, 0.00, 246067.00, 0.00, NULL, 0.00, 2084.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(396, 123, 259, 2, 1, 1668.00, 277474.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(397, 124, 259, 2, 1, 1710.00, 216110.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(398, 125, 259, 2, 1, 1588.00, 263803.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(399, 126, 259, 2, 1, 1668.00, 173897.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(400, 126, 260, 2, 1, 0.00, 177913.00, 0.00, NULL, 0.00, 4016.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(401, 127, 260, 2, 1, 1511.00, 298337.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(402, 128, 260, 2, 1, 1511.00, 191459.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(403, 128, 261, 2, 1, 0.00, 194130.00, 0.00, NULL, 0.00, 2671.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(404, 129, 261, 2, 1, 1370.00, 95956.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(405, 130, 261, 2, 1, 1401.00, 69848.70, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(406, 131, 261, 2, 1, 1200.00, 106044.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(407, 132, 261, 2, 1, 957.00, 10461.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(408, 133, 261, 2, 1, 1546.00, 236876.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(409, 134, 261, 2, 1, 1260.00, 33488.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(410, 134, 262, 2, 1, 0.00, 34745.40, 0.00, NULL, 0.00, 1257.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(411, 135, 262, 2, 1, 1472.00, 118631.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(412, 135, 263, 2, 1, 0.00, 121089.00, 0.00, NULL, 0.00, 2458.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(413, 136, 263, 2, 1, 1472.00, 267900.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(414, 138, 263, 2, 1, 1401.00, 127701.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(415, 138, 264, 2, 1, 0.00, 131555.00, 0.00, NULL, 0.00, 3854.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(416, 139, 264, 2, 1, 1401.00, 134622.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(417, 139, 286, 2, 1, 0.00, 137122.00, 0.00, NULL, 0.00, 2500.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(418, 139, 287, 2, 1, 0.00, 139534.00, 0.00, NULL, 0.00, 2412.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(419, 140, 287, 2, 1, 1334.00, 108966.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(420, 140, 265, 2, 1, 0.00, 112844.00, 0.00, NULL, 0.00, 3878.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(421, 141, 265, 2, 1, 1323.00, 54650.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(422, 141, 289, 2, 1, 0.00, 56882.80, 0.00, NULL, 0.00, 2232.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(423, 142, 289, 2, 1, 1334.00, 176447.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(424, 143, 289, 2, 1, 2042.00, 276661.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(425, 143, 285, 2, 1, 0.00, 281436.21, 0.00, NULL, 0.00, 4775.21, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(426, 144, 285, 2, 1, 1846.00, 57638.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(427, 144, 156, 2, 1, 0.00, 59788.00, 0.00, NULL, 0.00, 2150.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(428, 145, 156, 2, 1, 1939.00, 178934.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(429, 145, 157, 2, 1, 0.00, 182747.00, 0.00, NULL, 0.00, 3813.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(430, 146, 157, 2, 1, 1512.00, 136087.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(431, 147, 157, 2, 1, 1370.00, 128476.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(432, 148, 157, 2, 1, 1939.00, 135411.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(433, 148, 266, 2, 1, 0.00, 137565.00, 0.00, NULL, 0.00, 2154.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(434, 149, 266, 2, 1, 1370.00, 124437.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(435, 150, 266, 2, 1, 1401.00, 228945.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(436, 151, 266, 2, 1, 1401.00, 187879.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(437, 151, 267, 2, 1, 0.00, 189578.00, 0.00, NULL, 0.00, 1699.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(438, 152, 267, 2, 1, 957.00, 10461.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(439, 153, 267, 2, 1, 1939.00, 315927.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(440, 154, 267, 2, 1, 3000.00, 469966.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(441, 155, 267, 2, 1, 1401.00, 97725.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(442, 155, 188, 2, 1, 0.00, 100357.60, 0.00, NULL, 0.00, 2632.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(443, 156, 188, 2, 1, 1500.00, 393616.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(444, 157, 188, 2, 1, 1758.00, 416246.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(445, 158, 188, 2, 1, 1628.00, 388944.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(446, 159, 188, 2, 1, 1796.00, 298587.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(447, 160, 188, 2, 1, 1796.00, 108615.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(448, 160, 158, 2, 1, 0.00, 112719.00, 0.00, NULL, 0.00, 4104.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(449, 161, 158, 2, 1, 1796.00, 129560.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(450, 161, 190, 2, 1, 0.00, 133518.00, 0.00, NULL, 0.00, 3958.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(451, 162, 190, 2, 1, 1440.00, 115703.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(452, 163, 190, 2, 1, 1439.00, 134937.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(453, 164, 190, 2, 1, 1401.00, 267978.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(454, 165, 190, 2, 1, 1200.00, 108800.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(455, 166, 190, 2, 1, 1260.00, 64883.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(456, 166, 191, 2, 1, 0.00, 66233.50, 0.00, NULL, 0.00, 1350.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(457, 167, 191, 2, 1, 2042.00, 367517.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(458, 168, 191, 2, 1, 1939.00, 456344.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(459, 169, 191, 2, 1, 1846.00, 122393.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(460, 170, 191, 2, 1, 1846.00, 344574.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(461, 171, 191, 2, 1, 1304.00, 189283.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(462, 172, 191, 2, 1, 1312.00, 110249.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(463, 173, 191, 2, 1, 1511.00, 137694.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(464, 174, 191, 2, 1, 1378.00, 119308.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(465, 175, 191, 2, 1, 1312.00, 94809.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(466, 176, 191, 2, 1, 1078.00, 11448.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(467, 177, 191, 2, 1, 1078.00, 11918.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(468, 178, 191, 2, 1, 1401.00, 154852.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(469, 178, 192, 2, 1, 0.00, 158248.00, 0.00, NULL, 0.00, 3396.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(470, 179, 192, 2, 1, 1401.00, 114117.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(471, 179, 193, 2, 1, 0.00, 116701.00, 0.00, NULL, 0.00, 2584.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(472, 180, 193, 2, 1, 2368.00, 103487.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(473, 180, 159, 2, 1, 0.00, 109002.00, 0.00, NULL, 0.00, 5515.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(474, 182, 159, 2, 1, 3502.50, 123200.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(475, 183, 159, 2, 1, 2676.00, 109848.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(476, 183, 194, 2, 1, 0.00, 112023.00, 0.00, NULL, 0.00, 2175.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(477, 184, 194, 2, 1, 1043.00, 11453.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(478, 185, 194, 2, 1, 1370.00, 66358.70, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(479, 185, 195, 2, 1, 0.00, 67383.70, 0.00, NULL, 0.00, 1025.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(480, 186, 195, 2, 1, 1401.00, 86455.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(481, 186, 160, 2, 1, 0.00, 89351.90, 0.00, NULL, 0.00, 2896.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(482, 187, 160, 2, 1, 2612.00, 477652.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(483, 187, 196, 2, 1, 0.00, 481049.00, 0.00, NULL, 0.00, 3397.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(484, 188, 196, 2, 1, 1401.00, 74434.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(485, 188, 161, 2, 1, 0.00, 77313.40, 0.00, NULL, 0.00, 2879.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(486, 189, 161, 2, 1, 2000.00, 185472.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(487, 189, 189, 2, 1, 0.00, 189577.00, 0.00, NULL, 0.00, 4105.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(488, 190, 189, 2, 1, 1078.00, 11918.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(489, 191, 189, 2, 1, 2042.00, 226852.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(490, 191, 162, 2, 1, 0.00, 228102.00, 0.00, NULL, 0.00, 1250.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(491, 192, 162, 2, 1, 1305.00, 106158.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(492, 193, 162, 2, 1, 1710.00, 139835.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(493, 194, 162, 2, 1, 1370.00, 58561.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(494, 195, 162, 2, 1, 1512.00, 52025.10, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(495, 195, 268, 2, 1, 0.00, 53680.10, 0.00, NULL, 0.00, 1655.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(496, 196, 268, 2, 1, 1440.00, 113735.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(497, 196, 269, 2, 1, 0.00, 115184.00, 0.00, NULL, 0.00, 1449.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(498, 197, 269, 2, 1, 1241.00, 57619.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(499, 197, 270, 2, 1, 0.00, 58349.30, 0.00, NULL, 0.00, 730.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(500, 198, 270, 2, 1, 1511.00, 37427.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL);
INSERT INTO `gpf_subscriptions` (`id`, `employee_id`, `employee_loan_id`, `fiscal_year_id`, `month_id`, `subscription_recovery`, `total_subscription_balance`, `subscription_interest`, `current_balance_date`, `loan_amount`, `loan_recovery`, `loan_interest_amount`, `loan_interest_recovery`, `loan_date`, `sub_status`, `created_at`, `updated_at`) VALUES
(501, 198, 163, 2, 1, 0.00, 38864.40, 0.00, NULL, 0.00, 1437.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(502, 199, 163, 2, 1, 1312.00, 81632.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(503, 199, 290, 2, 1, 0.00, 82261.90, 0.00, NULL, 0.00, 629.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(504, 200, 290, 2, 1, 1511.00, 996315.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(505, 201, 290, 2, 1, 1370.00, 83952.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(506, 201, 271, 2, 1, 0.00, 84608.00, 0.00, NULL, 0.00, 656.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(507, 202, 271, 2, 1, 1132.00, 12278.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(508, 203, 271, 2, 1, 1370.00, 71099.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(509, 203, 164, 2, 1, 0.00, 71849.30, 0.00, NULL, 0.00, 750.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(510, 204, 164, 2, 1, 1511.00, 43136.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(511, 204, 165, 2, 1, 0.00, 45791.00, 0.00, NULL, 0.00, 2655.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(512, 205, 165, 2, 1, 1511.00, 218507.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(513, 205, 167, 2, 1, 0.00, 219341.00, 0.00, NULL, 0.00, 834.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(514, 206, 167, 2, 1, 1439.00, 281450.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(515, 207, 167, 2, 1, 1587.00, 249686.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(516, 208, 167, 2, 1, 1447.00, 159538.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(517, 208, 272, 2, 1, 0.00, 162724.00, 0.00, NULL, 0.00, 3186.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(518, 209, 272, 2, 1, 1447.00, 235039.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(519, 209, 273, 2, 1, 0.00, 238125.00, 0.00, NULL, 0.00, 3086.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(520, 210, 273, 2, 1, 1401.00, 215848.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(521, 210, 274, 2, 1, 0.00, 218848.00, 0.00, NULL, 0.00, 3000.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(522, 211, 274, 2, 1, 1242.00, 100470.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(523, 212, 274, 2, 1, 2484.00, 154854.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(524, 213, 274, 2, 1, 1209.00, 99674.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(525, 214, 274, 2, 1, 1401.00, 164616.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(526, 214, 169, 2, 1, 0.00, 166882.00, 0.00, NULL, 0.00, 2266.00, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(527, 215, 169, 2, 1, 1401.00, 1401.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-04', NULL),
(528, 215, 253, 2, 1, 0.00, 3616.16, 0.00, NULL, 0.00, 2215.16, 0.00, 0.00, NULL, 2, '2017-10-04', NULL),
(529, 2, 0, 2, 2, 6084.00, 977358.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(530, 3, 0, 2, 2, 6084.00, 90557.20, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(531, 4, 0, 2, 2, 5856.00, 927997.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(532, 5, 0, 2, 2, 5603.00, 701369.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(533, 5, 154, 2, 2, 0.00, 705536.00, 0.00, NULL, 0.00, 4167.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(534, 6, 154, 2, 2, 5603.00, 811562.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(535, 7, 154, 2, 2, 4084.00, 728021.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(536, 9, 154, 2, 2, 4084.00, 685644.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(537, 10, 154, 2, 2, 3889.00, 158900.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(538, 10, 155, 2, 2, 0.00, 162984.00, 0.00, NULL, 0.00, 4084.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(539, 11, 155, 2, 2, 3889.00, 459963.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(540, 12, 155, 2, 2, 3703.00, 140761.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(541, 12, 166, 2, 2, 0.00, 144303.00, 0.00, NULL, 0.00, 3542.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(542, 13, 166, 2, 2, 4084.00, 203769.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(543, 14, 166, 2, 2, 3703.00, 263188.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(544, 15, 166, 2, 2, 3889.00, 310113.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(545, 16, 166, 2, 2, 3703.00, 247043.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(546, 17, 166, 2, 2, 3358.00, 125362.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(547, 18, 166, 2, 2, 2810.00, 120812.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(548, 19, 166, 2, 2, 2548.00, 19257.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(549, 20, 166, 2, 2, 3889.00, 197348.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(550, 20, 217, 2, 2, 0.00, 202536.00, 0.00, NULL, 0.00, 5188.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(551, 21, 217, 2, 2, 3526.00, 612543.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(552, 22, 217, 2, 2, 3889.00, 223889.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(553, 22, 275, 2, 2, 0.00, 231524.00, 0.00, NULL, 0.00, 7635.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(554, 23, 275, 2, 2, 3703.00, 402778.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(555, 23, 219, 2, 2, 0.00, 404278.00, 0.00, NULL, 0.00, 1500.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(556, 24, 219, 2, 2, 3889.00, 264102.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(557, 24, 220, 2, 2, 0.00, 271332.00, 0.00, NULL, 0.00, 7230.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(558, 25, 220, 2, 2, 3703.00, 163032.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(559, 25, 221, 2, 2, 0.00, 168923.00, 0.00, NULL, 0.00, 5891.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(560, 26, 221, 2, 2, 2937.00, 162836.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(561, 26, 222, 2, 2, 0.00, 165336.00, 0.00, NULL, 0.00, 2500.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(562, 27, 222, 2, 2, 2255.00, 366434.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(563, 28, 222, 2, 2, 2810.00, 230937.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(564, 29, 222, 2, 2, 2937.00, 295365.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(565, 29, 223, 2, 2, 0.00, 298803.00, 0.00, NULL, 0.00, 3438.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(566, 30, 223, 2, 2, 2548.00, 179810.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(567, 31, 223, 2, 2, 1853.00, 10907.76, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(568, 32, 223, 2, 2, 3239.00, 69776.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(569, 32, 224, 2, 2, 0.00, 74801.60, 0.00, NULL, 0.00, 5025.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(570, 33, 224, 2, 2, 2951.00, 178010.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(571, 34, 224, 2, 2, 2255.00, 107803.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(572, 35, 224, 2, 2, 1512.00, 65299.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(573, 36, 224, 2, 2, 1939.00, 111327.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(574, 37, 224, 2, 2, 2147.00, 964530.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(575, 38, 224, 2, 2, 2036.00, 853911.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(576, 39, 224, 2, 2, 1939.00, 164260.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(577, 40, 224, 2, 2, 1511.00, 242432.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(578, 41, 224, 2, 2, 1939.00, 210637.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(579, 42, 224, 2, 2, 1796.00, 229299.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(580, 43, 224, 2, 2, 1249.00, 49988.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(581, 44, 224, 2, 2, 1588.00, 210588.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(582, 45, 224, 2, 2, 1043.00, 12496.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(583, 46, 224, 2, 2, 3445.00, 222829.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(584, 47, 224, 2, 2, 1710.00, 87745.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(585, 47, 282, 2, 2, 0.00, 90037.40, 0.00, NULL, 0.00, 2292.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(586, 48, 282, 2, 2, 3597.50, 104017.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(587, 49, 282, 2, 2, 3427.50, 18859.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(588, 50, 282, 2, 2, 1511.00, 239702.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(589, 51, 282, 2, 2, 957.00, 7764.89, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(590, 52, 282, 2, 2, 1401.00, 250475.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(591, 53, 282, 2, 2, 957.00, 7764.89, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(592, 54, 282, 2, 2, 1371.00, 72387.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(593, 55, 282, 2, 2, 1200.00, 106917.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(594, 56, 282, 2, 2, 1472.00, 49808.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(595, 57, 282, 2, 2, 1401.00, 124162.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(596, 58, 282, 2, 2, 1260.00, 46239.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(597, 59, 282, 2, 2, 985.00, 11791.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(598, 60, 282, 2, 2, 1260.00, 100326.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(599, 61, 282, 2, 2, 1472.00, 152937.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(600, 62, 282, 2, 2, 1260.00, 96055.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(601, 63, 282, 2, 2, 1472.00, 125664.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(602, 64, 282, 2, 2, 1334.00, 169703.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(603, 66, 282, 2, 2, 1260.00, 110479.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(604, 67, 282, 2, 2, 1242.00, 150482.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(605, 68, 282, 2, 2, 1401.00, 173671.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(606, 69, 282, 2, 2, 1472.00, 260479.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(607, 70, 282, 2, 2, 1401.00, 179756.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(608, 71, 282, 2, 2, 1472.00, 281408.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(609, 72, 282, 2, 2, 1472.00, 230862.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(610, 73, 282, 2, 2, 1260.00, 49490.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(611, 74, 282, 2, 2, 1260.00, 105958.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(612, 75, 282, 2, 2, 1472.00, 164836.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(613, 76, 282, 2, 2, 1472.00, 357158.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(614, 77, 282, 2, 2, 1401.00, 61960.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(615, 78, 282, 2, 2, 1401.00, 154948.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(616, 79, 282, 2, 2, 1200.00, 102057.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(617, 80, 282, 2, 2, 1472.00, 184230.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(618, 81, 282, 2, 2, 1401.00, 86691.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(619, 82, 282, 2, 2, 1472.00, 134642.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(620, 83, 282, 2, 2, 1472.00, 136161.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(621, 84, 282, 2, 2, 1472.00, 269784.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(622, 85, 282, 2, 2, 1401.00, 199479.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(623, 86, 282, 2, 2, 1401.00, 51676.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(624, 87, 282, 2, 2, 1472.00, 115665.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(625, 88, 282, 2, 2, 1401.00, 136267.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(626, 88, 250, 2, 2, 0.00, 139417.00, 0.00, NULL, 0.00, 3150.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(627, 89, 250, 2, 2, 1401.00, 135544.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(628, 90, 250, 2, 2, 1334.00, 108123.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(629, 91, 250, 2, 2, 1334.00, 172683.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(630, 92, 250, 2, 2, 1305.00, 126463.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(631, 93, 250, 2, 2, 1472.00, 174895.27, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(632, 94, 250, 2, 2, 1472.00, 183919.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(633, 95, 250, 2, 2, 1005.00, 11834.09, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(634, 96, 250, 2, 2, 957.00, 11418.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(635, 97, 250, 2, 2, 1401.00, 268002.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(636, 98, 250, 2, 2, 8.88, 284.38, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(637, 99, 250, 2, 2, 1401.00, 114786.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(638, 100, 250, 2, 2, 1401.00, 180478.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(639, 100, 254, 2, 2, 0.00, 182650.00, 0.00, NULL, 0.00, 2172.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(640, 101, 254, 2, 2, 1401.00, 290196.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(641, 102, 254, 2, 2, 2487.00, 286878.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(642, 103, 254, 2, 2, 1668.00, 299090.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(643, 104, 254, 2, 2, 2000.00, 258673.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(644, 105, 254, 2, 2, 1846.00, 106057.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(645, 106, 254, 2, 2, 1846.00, 287514.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(646, 107, 254, 2, 2, 2000.00, 258369.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(647, 108, 254, 2, 2, 1370.00, 127079.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(648, 109, 254, 2, 2, 1370.00, 76635.10, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(649, 110, 254, 2, 2, 3425.00, 186073.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(650, 111, 254, 2, 2, 1260.00, 46065.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(651, 112, 254, 2, 2, 1401.00, 66488.20, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(652, 113, 254, 2, 2, 957.00, 11418.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(653, 114, 254, 2, 2, 5362.50, 627502.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(654, 115, 254, 2, 2, 2042.00, 154981.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(655, 116, 254, 2, 2, 1796.00, 443705.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(656, 117, 254, 2, 2, 1500.00, 536313.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(657, 118, 254, 2, 2, 1840.00, 392990.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(658, 119, 254, 2, 2, 2000.00, 378426.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(659, 120, 254, 2, 2, 1796.00, 317262.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(660, 121, 254, 2, 2, 1512.00, 144047.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(661, 122, 254, 2, 2, 1668.00, 247735.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(662, 123, 254, 2, 2, 1668.00, 279142.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(663, 124, 254, 2, 2, 1710.00, 217820.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(664, 125, 254, 2, 2, 1588.00, 265391.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(665, 126, 254, 2, 2, 1668.00, 179581.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(666, 126, 260, 2, 2, 0.00, 183597.00, 0.00, NULL, 0.00, 4016.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(667, 127, 260, 2, 2, 1511.00, 299848.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(668, 128, 260, 2, 2, 1511.00, 195641.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(669, 129, 260, 2, 2, 1370.00, 97326.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(670, 130, 260, 2, 2, 1401.00, 71249.70, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(671, 131, 260, 2, 2, 1200.00, 107244.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(672, 132, 260, 2, 2, 957.00, 11418.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(673, 133, 260, 2, 2, 1546.00, 238422.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(674, 134, 260, 2, 2, 1260.00, 36005.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(675, 135, 260, 2, 2, 1472.00, 122561.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(676, 136, 260, 2, 2, 1472.00, 269372.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(677, 138, 260, 2, 2, 1401.00, 132956.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(678, 138, 264, 2, 2, 0.00, 136810.00, 0.00, NULL, 0.00, 3854.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(679, 139, 264, 2, 2, 1401.00, 140935.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(680, 140, 264, 2, 2, 1334.00, 114178.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(681, 140, 265, 2, 2, 0.00, 118056.00, 0.00, NULL, 0.00, 3878.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(682, 141, 265, 2, 2, 1323.00, 58205.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(683, 141, 289, 2, 2, 0.00, 60437.80, 0.00, NULL, 0.00, 2232.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(684, 142, 289, 2, 2, 1334.00, 177781.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(685, 143, 289, 2, 2, 2042.00, 283478.21, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(686, 144, 289, 2, 2, 1846.00, 61634.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(687, 144, 156, 2, 2, 0.00, 63784.00, 0.00, NULL, 0.00, 2150.00, 0.00, 0.00, NULL, 2, '2017-10-10', NULL),
(688, 145, 156, 2, 2, 1939.00, 184686.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(689, 146, 156, 2, 2, 1512.00, 137599.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(690, 147, 156, 2, 2, 1370.00, 129846.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(691, 148, 156, 2, 2, 1939.00, 139504.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(692, 149, 156, 2, 2, 1370.00, 125807.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(693, 150, 156, 2, 2, 1401.00, 230346.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(694, 151, 156, 2, 2, 1401.00, 190979.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(695, 152, 156, 2, 2, 957.00, 11418.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(696, 153, 156, 2, 2, 1939.00, 317866.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(697, 154, 156, 2, 2, 3000.00, 472966.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(698, 155, 156, 2, 2, 1401.00, 101758.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(699, 156, 156, 2, 2, 1500.00, 395116.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(700, 157, 156, 2, 2, 1758.00, 418004.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(701, 158, 156, 2, 2, 1628.00, 390572.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(702, 159, 156, 2, 2, 1796.00, 300383.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(703, 160, 156, 2, 2, 1796.00, 114515.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(704, 161, 156, 2, 2, 1796.00, 135314.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(705, 162, 156, 2, 2, 1440.00, 117143.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(706, 163, 156, 2, 2, 1439.00, 136376.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(707, 164, 156, 2, 2, 1401.00, 269379.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(708, 165, 156, 2, 2, 1200.00, 110000.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(709, 166, 156, 2, 2, 1260.00, 67493.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(710, 167, 156, 2, 2, 2042.00, 369559.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(711, 168, 156, 2, 2, 1939.00, 458283.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(712, 169, 156, 2, 2, 1846.00, 124239.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(713, 170, 156, 2, 2, 1846.00, 346420.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(714, 171, 156, 2, 2, 1304.00, 190587.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(715, 172, 156, 2, 2, 1312.00, 111561.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(716, 173, 156, 2, 2, 1511.00, 139205.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(717, 174, 156, 2, 2, 1378.00, 120686.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(718, 175, 156, 2, 2, 1312.00, 96121.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(719, 176, 156, 2, 2, 1078.00, 12526.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(720, 177, 156, 2, 2, 1078.00, 12996.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(721, 178, 156, 2, 2, 1401.00, 159649.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(722, 179, 156, 2, 2, 1401.00, 118102.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(723, 180, 156, 2, 2, 2368.00, 111370.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(724, 182, 156, 2, 2, 3502.50, 126703.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(725, 183, 156, 2, 2, 2676.00, 114699.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(726, 184, 156, 2, 2, 1043.00, 12496.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(727, 185, 156, 2, 2, 1370.00, 68753.70, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(728, 186, 156, 2, 2, 1401.00, 90752.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(729, 187, 156, 2, 2, 2612.00, 483661.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(730, 188, 156, 2, 2, 1401.00, 78714.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(731, 189, 156, 2, 2, 2000.00, 191577.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(732, 190, 156, 2, 2, 1078.00, 12996.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(733, 191, 156, 2, 2, 2042.00, 230144.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(734, 192, 156, 2, 2, 1305.00, 107463.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(735, 193, 156, 2, 2, 1710.00, 141545.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(736, 194, 156, 2, 2, 1370.00, 59931.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(737, 195, 156, 2, 2, 1512.00, 55192.10, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(738, 196, 156, 2, 2, 1440.00, 116624.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(739, 197, 156, 2, 2, 1241.00, 59590.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(740, 198, 156, 2, 2, 1511.00, 40375.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(741, 199, 156, 2, 2, 1312.00, 83573.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(742, 200, 156, 2, 2, 1511.00, 997826.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(743, 201, 156, 2, 2, 1370.00, 85978.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(744, 202, 156, 2, 2, 1132.00, 13410.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(745, 203, 156, 2, 2, 1370.00, 73219.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(746, 204, 156, 2, 2, 1511.00, 47302.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(747, 205, 156, 2, 2, 1511.00, 220852.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(748, 206, 156, 2, 2, 1439.00, 282889.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(749, 207, 156, 2, 2, 1587.00, 251273.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(750, 208, 156, 2, 2, 1447.00, 164171.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(751, 209, 156, 2, 2, 1447.00, 239572.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(752, 210, 156, 2, 2, 1401.00, 220249.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(753, 211, 156, 2, 2, 1242.00, 101712.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(754, 212, 156, 2, 2, 2484.00, 157338.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(755, 213, 156, 2, 2, 1209.00, 100883.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(756, 214, 156, 2, 2, 1401.00, 168283.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(757, 215, 156, 2, 2, 1401.00, 5017.16, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-10-10', NULL),
(758, 2, 0, 2, 3, 6084.00, 983442.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(759, 3, 0, 2, 3, 6084.00, 96641.20, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(760, 4, 0, 2, 3, 5856.00, 933853.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(761, 5, 0, 2, 3, 5603.00, 711139.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(762, 5, 154, 2, 3, 0.00, 715306.00, 0.00, NULL, 0.00, 4167.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(763, 6, 0, 2, 3, 5603.00, 817165.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(764, 7, 0, 2, 3, 4084.00, 732105.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(765, 9, 0, 2, 3, 4084.00, 689728.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(766, 10, 0, 2, 3, 3889.00, 166873.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(767, 10, 155, 2, 3, 0.00, 170957.00, 0.00, NULL, 0.00, 4084.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(768, 11, 0, 2, 3, 3889.00, 463852.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(769, 12, 0, 2, 3, 3703.00, 148006.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(770, 12, 166, 2, 3, 0.00, 151548.00, 0.00, NULL, 0.00, 3542.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(771, 13, 0, 2, 3, 4084.00, 207853.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(772, 14, 0, 2, 3, 3703.00, 266891.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(773, 15, 0, 2, 3, 3889.00, 314002.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(774, 16, 0, 2, 3, 3703.00, 250746.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(775, 17, 0, 2, 3, 3358.00, 128720.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(776, 18, 0, 2, 3, 2810.00, 123622.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(777, 19, 0, 2, 3, 2548.00, 21805.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(778, 20, 0, 2, 3, 3889.00, 206425.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(779, 20, 217, 2, 3, 0.00, 211613.00, 0.00, NULL, 0.00, 5188.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(780, 22, 0, 2, 3, 3889.00, 235413.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(781, 22, 275, 2, 3, 0.00, 243048.00, 0.00, NULL, 0.00, 7635.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(782, 23, 0, 2, 3, 3703.00, 407981.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(783, 23, 219, 2, 3, 0.00, 409481.00, 0.00, NULL, 0.00, 1500.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(784, 24, 0, 2, 3, 3889.00, 275221.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(785, 24, 220, 2, 3, 0.00, 282451.00, 0.00, NULL, 0.00, 7230.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(786, 25, 0, 2, 3, 3703.00, 172626.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(787, 25, 221, 2, 3, 0.00, 178517.00, 0.00, NULL, 0.00, 5891.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(788, 26, 0, 2, 3, 2937.00, 168273.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(789, 26, 222, 2, 3, 0.00, 170773.00, 0.00, NULL, 0.00, 2500.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(790, 27, 0, 2, 3, 2255.00, 368689.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(791, 28, 0, 2, 3, 2810.00, 233747.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(792, 29, 0, 2, 3, 2937.00, 301740.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(793, 29, 223, 2, 3, 0.00, 305178.00, 0.00, NULL, 0.00, 3438.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(794, 30, 0, 2, 3, 2548.00, 182358.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(795, 31, 0, 2, 3, 1853.00, 12760.76, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(796, 32, 0, 2, 3, 3239.00, 78040.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(797, 33, 0, 2, 3, 2951.00, 180961.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(798, 34, 0, 2, 3, 2255.00, 110058.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(799, 35, 0, 2, 3, 1512.00, 66811.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(800, 35, 225, 2, 3, 0.00, 68519.00, 0.00, NULL, 0.00, 1708.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(801, 36, 0, 2, 3, 1939.00, 113266.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(802, 36, 292, 2, 3, 0.00, 117463.00, 0.00, NULL, 0.00, 4197.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(803, 36, 293, 2, 3, 0.00, 119296.00, 0.00, NULL, 0.00, 1833.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(804, 37, 0, 2, 3, 2147.00, 966677.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(805, 37, 180, 2, 3, 0.00, 970609.00, 0.00, NULL, 0.00, 3932.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(806, 38, 0, 2, 3, 2036.00, 855947.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(807, 38, 228, 2, 3, 0.00, 857481.00, 0.00, NULL, 0.00, 1534.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(808, 39, 0, 2, 3, 1939.00, 166199.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(809, 40, 0, 2, 3, 1511.00, 243943.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(810, 40, 229, 2, 3, 0.00, 246673.00, 0.00, NULL, 0.00, 2730.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(811, 41, 0, 2, 3, 1939.00, 212576.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(812, 41, 230, 2, 3, 0.00, 215186.00, 0.00, NULL, 0.00, 2610.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(813, 42, 0, 2, 3, 1796.00, 231095.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(814, 42, 231, 2, 3, 0.00, 233611.00, 0.00, NULL, 0.00, 2516.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(815, 43, 0, 2, 3, 1249.00, 51237.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(816, 43, 186, 2, 3, 0.00, 52612.40, 0.00, NULL, 0.00, 1375.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(817, 44, 0, 2, 3, 1588.00, 212176.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(818, 45, 0, 2, 3, 1043.00, 13539.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(819, 46, 0, 2, 3, 3445.00, 226274.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(820, 47, 0, 2, 3, 1710.00, 91747.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(821, 47, 282, 2, 3, 0.00, 94039.40, 0.00, NULL, 0.00, 2292.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(822, 48, 0, 2, 3, 3597.50, 107615.10, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(823, 48, 234, 2, 3, 0.00, 109824.10, 0.00, NULL, 0.00, 2209.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(824, 49, 0, 2, 3, 3427.50, 22287.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(825, 49, 235, 2, 3, 0.00, 23704.30, 0.00, NULL, 0.00, 1417.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(826, 50, 0, 2, 3, 1511.00, 241213.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(827, 51, 0, 2, 3, 957.00, 8721.89, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(828, 52, 0, 2, 3, 1401.00, 251876.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(829, 53, 0, 2, 3, 957.00, 8721.89, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(830, 54, 0, 2, 3, 1371.00, 73758.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(831, 54, 294, 2, 3, 0.00, 75800.60, 0.00, NULL, 0.00, 2042.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(832, 54, 295, 2, 3, 0.00, 77383.60, 0.00, NULL, 0.00, 1583.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(833, 54, 296, 2, 3, 0.00, 78403.60, 0.00, NULL, 0.00, 1020.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(834, 55, 0, 2, 3, 1200.00, 108117.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(835, 56, 0, 2, 3, 1472.00, 51280.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(836, 56, 283, 2, 3, 0.00, 53405.40, 0.00, NULL, 0.00, 2125.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(837, 57, 0, 2, 3, 1401.00, 125563.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(838, 57, 236, 2, 3, 0.00, 128376.00, 0.00, NULL, 0.00, 2813.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(839, 58, 0, 2, 3, 1260.00, 47499.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(840, 58, 237, 2, 3, 0.00, 48695.40, 0.00, NULL, 0.00, 1196.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(841, 59, 0, 2, 3, 985.00, 12776.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(842, 60, 0, 2, 3, 1260.00, 101586.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(843, 60, 238, 2, 3, 0.00, 102048.50, 0.00, NULL, 0.00, 462.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(844, 61, 0, 2, 3, 1472.00, 154409.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(845, 61, 239, 2, 3, 0.00, 157534.00, 0.00, NULL, 0.00, 3125.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(846, 62, 0, 2, 3, 1260.00, 97315.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(847, 63, 0, 2, 3, 1472.00, 127136.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(848, 63, 284, 2, 3, 0.00, 129311.00, 0.00, NULL, 0.00, 2175.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(849, 63, 291, 2, 3, 0.00, 132052.00, 0.00, NULL, 0.00, 2741.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(850, 64, 0, 2, 3, 1334.00, 171037.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(851, 64, 241, 2, 3, 0.00, 172262.00, 0.00, NULL, 0.00, 1225.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(852, 66, 0, 2, 3, 1260.00, 111739.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(853, 67, 0, 2, 3, 1242.00, 151724.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(854, 68, 0, 2, 3, 1401.00, 175072.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(855, 68, 242, 2, 3, 0.00, 178739.00, 0.00, NULL, 0.00, 3667.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(856, 69, 0, 2, 3, 1472.00, 261951.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(857, 70, 0, 2, 3, 1401.00, 181157.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(858, 70, 243, 2, 3, 0.00, 183332.00, 0.00, NULL, 0.00, 2175.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(859, 71, 0, 2, 3, 1472.00, 282880.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(860, 72, 0, 2, 3, 1472.00, 232334.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(861, 73, 0, 2, 3, 1260.00, 50750.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(862, 73, 244, 2, 3, 0.00, 52052.50, 0.00, NULL, 0.00, 1302.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(863, 74, 0, 2, 3, 1260.00, 107218.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(864, 75, 0, 2, 3, 1472.00, 166308.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(865, 76, 0, 2, 3, 1472.00, 358630.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(866, 77, 0, 2, 3, 1401.00, 63361.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(867, 78, 0, 2, 3, 1401.00, 156349.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(868, 78, 245, 2, 3, 0.00, 158294.00, 0.00, NULL, 0.00, 1945.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(869, 79, 0, 2, 3, 1200.00, 103257.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(870, 80, 0, 2, 3, 1472.00, 185702.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(871, 80, 246, 2, 3, 0.00, 188202.00, 0.00, NULL, 0.00, 2500.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(872, 81, 0, 2, 3, 1401.00, 88092.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(873, 81, 297, 2, 3, 0.00, 89092.30, 0.00, NULL, 0.00, 1000.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(874, 81, 331, 2, 3, 0.00, 91531.30, 0.00, NULL, 0.00, 2439.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(875, 82, 0, 2, 3, 1472.00, 136114.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(876, 82, 305, 2, 3, 0.00, 138406.00, 0.00, NULL, 0.00, 2292.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(877, 83, 0, 2, 3, 1472.00, 137633.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(878, 83, 247, 2, 3, 0.00, 141279.00, 0.00, NULL, 0.00, 3646.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(879, 84, 0, 2, 3, 1472.00, 271256.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(880, 85, 0, 2, 3, 1401.00, 200880.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(881, 85, 248, 2, 3, 0.00, 203061.00, 0.00, NULL, 0.00, 2181.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(882, 86, 0, 2, 3, 1401.00, 53077.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(883, 86, 249, 2, 3, 0.00, 55480.00, 0.00, NULL, 0.00, 2403.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(884, 87, 0, 2, 3, 1472.00, 117137.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(885, 87, 298, 2, 3, 0.00, 118984.00, 0.00, NULL, 0.00, 1847.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(886, 87, 299, 2, 3, 0.00, 120559.00, 0.00, NULL, 0.00, 1575.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(887, 88, 0, 2, 3, 1401.00, 140818.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(888, 88, 250, 2, 3, 0.00, 143968.00, 0.00, NULL, 0.00, 3150.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(889, 89, 0, 2, 3, 1401.00, 136945.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(890, 90, 0, 2, 3, 1334.00, 109457.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(891, 91, 0, 2, 3, 1334.00, 174017.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(892, 92, 0, 2, 3, 1305.00, 127768.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(893, 93, 0, 2, 3, 1472.00, 176367.27, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(894, 93, 251, 2, 3, 0.00, 179990.27, 0.00, NULL, 0.00, 3623.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(895, 94, 0, 2, 3, 1472.00, 185391.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(896, 94, 252, 2, 3, 0.00, 188274.00, 0.00, NULL, 0.00, 2883.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(897, 95, 0, 2, 3, 1005.00, 12839.09, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(898, 96, 0, 2, 3, 957.00, 12375.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(899, 97, 0, 2, 3, 1401.00, 269403.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(900, 99, 0, 2, 3, 1401.00, 116187.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(901, 99, 300, 2, 3, 0.00, 118542.00, 0.00, NULL, 0.00, 2355.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(902, 100, 0, 2, 3, 1401.00, 184051.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(903, 100, 254, 2, 3, 0.00, 186223.00, 0.00, NULL, 0.00, 2172.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(904, 101, 0, 2, 3, 1401.00, 291597.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(905, 101, 333, 2, 3, 0.00, 295908.00, 0.00, NULL, 0.00, 4311.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(906, 102, 0, 2, 3, 2487.00, 289365.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(907, 102, 301, 2, 3, 0.00, 290365.00, 0.00, NULL, 0.00, 1000.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(908, 103, 0, 2, 3, 1668.00, 300758.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(909, 104, 0, 2, 3, 2000.00, 260673.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(910, 104, 255, 2, 3, 0.00, 263137.00, 0.00, NULL, 0.00, 2464.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(911, 104, 0, 2, 3, 0.00, 263137.00, 0.00, NULL, 0.00, 0.00, 22500.00, 0.00, NULL, 4, '2017-11-15', NULL),
(912, 105, 0, 2, 3, 1846.00, 107903.00, 0.00, NULL, 0.00, 0.00, 22500.00, 0.00, NULL, 1, '2017-11-15', NULL),
(913, 105, 334, 2, 3, 0.00, 109439.00, 0.00, NULL, 0.00, 1536.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(914, 106, 0, 2, 3, 1846.00, 289360.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(915, 107, 0, 2, 3, 2000.00, 260369.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(916, 108, 0, 2, 3, 1370.00, 128449.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(917, 109, 0, 2, 3, 1370.00, 78005.10, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(918, 109, 302, 2, 3, 0.00, 78765.10, 0.00, NULL, 0.00, 760.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(919, 109, 303, 2, 3, 0.00, 79765.10, 0.00, NULL, 0.00, 1000.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(920, 110, 0, 2, 3, 3425.00, 189498.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(921, 111, 0, 2, 3, 1260.00, 47325.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(922, 111, 256, 2, 3, 0.00, 48950.50, 0.00, NULL, 0.00, 1625.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(923, 112, 0, 2, 3, 1401.00, 67889.20, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(924, 112, 304, 2, 3, 0.00, 69669.20, 0.00, NULL, 0.00, 1780.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(925, 112, 328, 2, 3, 0.00, 70899.20, 0.00, NULL, 0.00, 1230.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(926, 113, 0, 2, 3, 957.00, 12375.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(927, 114, 0, 2, 3, 5362.50, 632864.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(928, 115, 0, 2, 3, 2042.00, 157023.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(929, 115, 257, 2, 3, 0.00, 160267.00, 0.00, NULL, 0.00, 3244.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(930, 116, 0, 2, 3, 1796.00, 445501.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(931, 117, 0, 2, 3, 1500.00, 537813.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(932, 118, 0, 2, 3, 1840.00, 394830.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(933, 119, 0, 2, 3, 2000.00, 380426.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(934, 119, 258, 2, 3, 0.00, 384593.00, 0.00, NULL, 0.00, 4167.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(935, 120, 0, 2, 3, 1796.00, 319058.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(936, 121, 0, 2, 3, 1512.00, 145559.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(937, 122, 0, 2, 3, 1668.00, 249403.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(938, 122, 259, 2, 3, 0.00, 251487.00, 0.00, NULL, 0.00, 2084.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(939, 123, 0, 2, 3, 1668.00, 280810.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(940, 124, 0, 2, 3, 1710.00, 219530.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(941, 125, 0, 2, 3, 1588.00, 266979.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(942, 126, 0, 2, 3, 1668.00, 185265.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(943, 127, 0, 2, 3, 1511.00, 301359.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(944, 128, 0, 2, 3, 1511.00, 197152.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(945, 128, 261, 2, 3, 0.00, 199823.00, 0.00, NULL, 0.00, 2671.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(946, 129, 0, 2, 3, 1370.00, 98696.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(947, 130, 0, 2, 3, 1401.00, 72650.70, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(948, 131, 0, 2, 3, 1200.00, 108444.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(949, 132, 0, 2, 3, 957.00, 12375.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(950, 133, 0, 2, 3, 1546.00, 239968.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(951, 134, 0, 2, 3, 1260.00, 37265.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(952, 134, 262, 2, 3, 0.00, 38522.40, 0.00, NULL, 0.00, 1257.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(953, 135, 0, 2, 3, 1472.00, 124033.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(954, 135, 263, 2, 3, 0.00, 126491.00, 0.00, NULL, 0.00, 2458.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(955, 136, 0, 2, 3, 1472.00, 270844.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(956, 138, 0, 2, 3, 1401.00, 138211.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(957, 139, 0, 2, 3, 1401.00, 142336.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(958, 139, 286, 2, 3, 0.00, 144836.00, 0.00, NULL, 0.00, 2500.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(959, 139, 287, 2, 3, 0.00, 147248.00, 0.00, NULL, 0.00, 2412.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(960, 140, 0, 2, 3, 1334.00, 119390.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(961, 141, 0, 2, 3, 1323.00, 61760.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(962, 142, 0, 2, 3, 1334.00, 179115.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(963, 143, 0, 2, 3, 2042.00, 285520.21, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(964, 143, 285, 2, 3, 0.00, 290295.42, 0.00, NULL, 0.00, 4775.21, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(965, 144, 0, 2, 3, 1846.00, 65630.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(966, 145, 0, 2, 3, 1939.00, 186625.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(967, 145, 157, 2, 3, 0.00, 190438.00, 0.00, NULL, 0.00, 3813.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(968, 145, 335, 2, 3, 0.00, 193092.00, 0.00, NULL, 0.00, 2654.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(969, 146, 0, 2, 3, 1512.00, 139111.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(970, 147, 0, 2, 3, 1370.00, 131216.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(971, 148, 0, 2, 3, 1939.00, 141443.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(972, 148, 266, 2, 3, 0.00, 142161.00, 0.00, NULL, 0.00, 0.00, 0.00, 718.00, NULL, 3, '2017-11-15', NULL),
(973, 149, 266, 2, 3, 1370.00, 127177.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(974, 150, 266, 2, 3, 1401.00, 231747.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(975, 151, 266, 2, 3, 1401.00, 192380.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL);
INSERT INTO `gpf_subscriptions` (`id`, `employee_id`, `employee_loan_id`, `fiscal_year_id`, `month_id`, `subscription_recovery`, `total_subscription_balance`, `subscription_interest`, `current_balance_date`, `loan_amount`, `loan_recovery`, `loan_interest_amount`, `loan_interest_recovery`, `loan_date`, `sub_status`, `created_at`, `updated_at`) VALUES
(976, 151, 267, 2, 3, 0.00, 194079.00, 0.00, NULL, 0.00, 1699.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(977, 152, 0, 2, 3, 957.00, 12375.22, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(978, 153, 0, 2, 3, 1939.00, 319805.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(979, 154, 0, 2, 3, 3000.00, 475966.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(980, 154, 336, 2, 3, 0.00, 478966.00, 0.00, NULL, 0.00, 3000.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(981, 155, 0, 2, 3, 1401.00, 103159.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(982, 155, 188, 2, 3, 0.00, 105791.60, 0.00, NULL, 0.00, 2632.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(983, 156, 0, 2, 3, 1500.00, 396616.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(984, 157, 0, 2, 3, 1758.00, 419762.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(985, 158, 0, 2, 3, 1628.00, 392200.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(986, 159, 0, 2, 3, 1796.00, 302179.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(987, 160, 0, 2, 3, 1796.00, 116311.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(988, 160, 158, 2, 3, 0.00, 120415.00, 0.00, NULL, 0.00, 4104.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(989, 161, 0, 2, 3, 1796.00, 137110.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(990, 161, 190, 2, 3, 0.00, 141068.00, 0.00, NULL, 0.00, 3958.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(991, 162, 0, 2, 3, 1440.00, 118583.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(992, 163, 0, 2, 3, 1439.00, 137815.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(993, 164, 0, 2, 3, 1401.00, 270780.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(994, 165, 0, 2, 3, 1200.00, 111200.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(995, 166, 0, 2, 3, 1260.00, 68753.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(996, 166, 191, 2, 3, 0.00, 70103.50, 0.00, NULL, 0.00, 1350.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(997, 166, 337, 2, 3, 0.00, 71116.50, 0.00, NULL, 0.00, 1013.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(998, 167, 0, 2, 3, 2042.00, 371601.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(999, 168, 0, 2, 3, 1939.00, 460222.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1000, 169, 0, 2, 3, 1846.00, 126085.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1001, 170, 0, 2, 3, 1846.00, 348266.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1002, 171, 0, 2, 3, 1304.00, 191891.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1003, 172, 0, 2, 3, 1312.00, 112873.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1004, 173, 0, 2, 3, 1511.00, 140716.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1005, 174, 0, 2, 3, 1378.00, 122064.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1006, 175, 0, 2, 3, 1312.00, 97433.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1007, 176, 0, 2, 3, 1078.00, 13604.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1008, 177, 0, 2, 3, 1078.00, 14074.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1009, 178, 0, 2, 3, 1401.00, 161050.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1010, 178, 192, 2, 3, 0.00, 164446.00, 0.00, NULL, 0.00, 3396.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1011, 179, 0, 2, 3, 1401.00, 119503.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1012, 179, 193, 2, 3, 0.00, 122087.00, 0.00, NULL, 0.00, 2584.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1013, 180, 0, 2, 3, 2368.00, 113738.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1014, 180, 159, 2, 3, 0.00, 119253.00, 0.00, NULL, 0.00, 5515.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1015, 182, 0, 2, 3, 3502.50, 130205.50, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1016, 183, 0, 2, 3, 2676.00, 117375.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1017, 183, 194, 2, 3, 0.00, 119550.00, 0.00, NULL, 0.00, 2175.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1018, 184, 0, 2, 3, 1043.00, 13539.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1019, 185, 0, 2, 3, 1370.00, 70123.70, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1020, 185, 195, 2, 3, 0.00, 71148.70, 0.00, NULL, 0.00, 1025.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1021, 186, 0, 2, 3, 1401.00, 92153.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1022, 186, 160, 2, 3, 0.00, 95049.90, 0.00, NULL, 0.00, 2896.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1023, 187, 0, 2, 3, 2612.00, 486273.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1024, 187, 196, 2, 3, 0.00, 489670.00, 0.00, NULL, 0.00, 3397.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1025, 187, 338, 2, 3, 0.00, 496796.00, 0.00, NULL, 0.00, 7126.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1026, 188, 0, 2, 3, 1401.00, 80115.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1027, 188, 161, 2, 3, 0.00, 82994.40, 0.00, NULL, 0.00, 2879.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1028, 189, 0, 2, 3, 2000.00, 193577.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1029, 189, 189, 2, 3, 0.00, 197682.00, 0.00, NULL, 0.00, 4105.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1030, 190, 0, 2, 3, 1078.00, 14074.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1031, 191, 0, 2, 3, 2042.00, 232186.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1032, 191, 162, 2, 3, 0.00, 233436.00, 0.00, NULL, 0.00, 1250.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1033, 192, 0, 2, 3, 1305.00, 108768.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1034, 192, 339, 2, 3, 0.00, 109747.00, 0.00, NULL, 0.00, 979.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1035, 193, 0, 2, 3, 1710.00, 143255.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1036, 194, 0, 2, 3, 1370.00, 61301.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1037, 195, 0, 2, 3, 1512.00, 56704.10, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1038, 195, 268, 2, 3, 0.00, 58359.10, 0.00, NULL, 0.00, 1655.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1039, 196, 0, 2, 3, 1440.00, 118064.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1040, 196, 269, 2, 3, 0.00, 119513.00, 0.00, NULL, 0.00, 1449.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1041, 197, 0, 2, 3, 1241.00, 60831.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1042, 197, 270, 2, 3, 0.00, 61561.30, 0.00, NULL, 0.00, 730.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1043, 198, 0, 2, 3, 1511.00, 41886.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1044, 198, 163, 2, 3, 0.00, 43323.40, 0.00, NULL, 0.00, 1437.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1045, 199, 0, 2, 3, 1312.00, 84885.90, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1046, 199, 290, 2, 3, 0.00, 85514.90, 0.00, NULL, 0.00, 629.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1047, 200, 0, 2, 3, 1511.00, 999337.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1048, 201, 0, 2, 3, 1370.00, 87348.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1049, 201, 271, 2, 3, 0.00, 88004.00, 0.00, NULL, 0.00, 656.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1050, 202, 0, 2, 3, 1132.00, 14542.80, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1051, 203, 0, 2, 3, 1370.00, 74589.30, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1052, 203, 164, 2, 3, 0.00, 75339.30, 0.00, NULL, 0.00, 750.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1053, 204, 0, 2, 3, 1511.00, 48813.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1054, 204, 165, 2, 3, 0.00, 51468.00, 0.00, NULL, 0.00, 2655.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1055, 205, 0, 2, 3, 1511.00, 222363.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1056, 205, 167, 2, 3, 0.00, 223197.00, 0.00, NULL, 0.00, 834.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1057, 206, 0, 2, 3, 1439.00, 284328.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1058, 207, 0, 2, 3, 1587.00, 252860.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1059, 208, 0, 2, 3, 1447.00, 165618.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1060, 208, 272, 2, 3, 0.00, 168804.00, 0.00, NULL, 0.00, 3186.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1061, 209, 0, 2, 3, 1447.00, 241019.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1062, 209, 273, 2, 3, 0.00, 244105.00, 0.00, NULL, 0.00, 3086.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1063, 210, 0, 2, 3, 1401.00, 221650.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1064, 210, 274, 2, 3, 0.00, 224650.00, 0.00, NULL, 0.00, 3000.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1065, 211, 0, 2, 3, 1242.00, 102954.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1066, 212, 0, 2, 3, 2484.00, 159822.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1067, 213, 0, 2, 3, 1209.00, 102092.40, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1068, 214, 0, 2, 3, 1401.00, 169684.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1069, 214, 169, 2, 3, 0.00, 171950.00, 0.00, NULL, 0.00, 2266.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1070, 214, 332, 2, 3, 0.00, 174399.00, 0.00, NULL, 0.00, 2449.00, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1071, 215, 0, 2, 3, 1401.00, 6418.16, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-15', NULL),
(1072, 215, 253, 2, 3, 0.00, 8633.32, 0.00, NULL, 0.00, 2215.16, 0.00, 0.00, NULL, 2, '2017-11-15', NULL),
(1073, 32, 0, 2, 4, 3239.00, 81279.60, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 1, '2017-11-19', NULL),
(1074, 32, 224, 2, 4, 0.00, 86304.60, 0.00, NULL, 0.00, 5025.00, 0.00, 0.00, NULL, 2, '2017-11-19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gpf_subscriptions_06_09_2017`
--

CREATE TABLE `gpf_subscriptions_06_09_2017` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `employee_loan_id` int(11) NOT NULL DEFAULT '0',
  `fiscal_year_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `subscription_recovery` float NOT NULL DEFAULT '0',
  `total_subscription_balance` float NOT NULL DEFAULT '0',
  `subscription_interest` float NOT NULL DEFAULT '0',
  `current_balance_date` date DEFAULT NULL,
  `loan_amount` float NOT NULL DEFAULT '0',
  `loan_recovery` float NOT NULL DEFAULT '0',
  `loan_interest_amount` float NOT NULL DEFAULT '0',
  `loan_interest_recovery` float NOT NULL DEFAULT '0',
  `loan_date` date DEFAULT NULL,
  `sub_status` int(1) NOT NULL DEFAULT '0',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gpf_subscriptions_06_09_2017`
--

INSERT INTO `gpf_subscriptions_06_09_2017` (`id`, `employee_id`, `employee_loan_id`, `fiscal_year_id`, `month_id`, `subscription_recovery`, `total_subscription_balance`, `subscription_interest`, `current_balance_date`, `loan_amount`, `loan_recovery`, `loan_interest_amount`, `loan_interest_recovery`, `loan_date`, `sub_status`, `created_at`, `updated_at`) VALUES
(1, 143, 0, 5, 7, 0, 274619, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(2, 144, 0, 5, 7, 0, 55792, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(3, 145, 0, 5, 7, 0, 176995, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(4, 146, 0, 5, 7, 0, 134575, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(5, 147, 0, 5, 7, 0, 127106, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(6, 148, 0, 5, 7, 0, 133472, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(7, 149, 0, 5, 7, 0, 123067, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(8, 150, 0, 5, 7, 0, 227544, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(9, 151, 0, 5, 7, 0, 186478, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(10, 152, 0, 5, 7, 0, 9504.22, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(11, 153, 0, 5, 7, 0, 313988, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(12, 154, 0, 5, 7, 0, 466966, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(13, 155, 0, 5, 7, 0, 96324.6, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(14, 156, 0, 5, 7, 0, 392116, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(15, 157, 0, 5, 7, 0, 414488, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(16, 158, 0, 5, 7, 0, 387316, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(17, 159, 0, 5, 7, 0, 296791, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(18, 160, 0, 5, 7, 0, 106819, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(19, 161, 0, 5, 7, 0, 127764, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(20, 162, 0, 5, 7, 0, 114263, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(21, 163, 0, 5, 7, 0, 133498, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(22, 164, 0, 5, 7, 0, 266577, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(23, 165, 0, 5, 7, 0, 107600, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(24, 166, 0, 5, 7, 0, 63623.5, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(25, 167, 0, 5, 7, 0, 365475, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(26, 168, 0, 5, 7, 0, 454405, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(27, 169, 0, 5, 7, 0, 120547, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(28, 170, 0, 5, 7, 0, 342728, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(29, 171, 0, 5, 7, 0, 187979, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(30, 172, 0, 5, 7, 0, 108937, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(31, 173, 0, 5, 7, 0, 136183, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(32, 174, 0, 5, 7, 0, 117930, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(33, 175, 0, 5, 7, 0, 93497, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(34, 176, 0, 5, 7, 0, 10370.8, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(35, 177, 0, 5, 7, 0, 10840.8, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(36, 178, 0, 5, 7, 0, 153451, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(37, 179, 0, 5, 7, 0, 112716, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(38, 180, 0, 5, 7, 0, 101119, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(39, 181, 0, 5, 7, 0, 7790.49, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(40, 182, 0, 5, 7, 0, 119698, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(41, 183, 0, 5, 7, 0, 107172, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(42, 184, 0, 5, 7, 0, 10410.9, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(43, 185, 0, 5, 7, 0, 64988.7, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(44, 186, 0, 5, 7, 0, 85054.9, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(45, 187, 0, 5, 7, 0, 475040, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(46, 188, 0, 5, 7, 0, 73033.4, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(47, 189, 0, 5, 7, 0, 183472, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(48, 190, 0, 5, 7, 0, 10840.8, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(49, 191, 0, 5, 7, 0, 224810, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(50, 192, 0, 5, 7, 0, 104853, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(51, 193, 0, 5, 7, 0, 138125, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(52, 194, 0, 5, 7, 0, 57191, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(53, 195, 0, 5, 7, 0, 50513.1, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(54, 196, 0, 5, 7, 0, 112295, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(55, 197, 0, 5, 7, 0, 56378.3, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(56, 198, 0, 5, 7, 0, 35916.4, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(57, 199, 0, 5, 7, 0, 80320.9, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(58, 200, 0, 5, 7, 0, 994804, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(59, 201, 0, 5, 7, 0, 82582, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(60, 202, 0, 5, 7, 0, 11146.8, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(61, 203, 0, 5, 7, 0, 69729.3, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(62, 204, 0, 5, 7, 0, 41625, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(63, 205, 0, 5, 7, 0, 216996, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(64, 206, 0, 5, 7, 0, 280011, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(65, 207, 0, 5, 7, 0, 248099, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(66, 208, 0, 5, 7, 0, 158091, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(67, 209, 0, 5, 7, 0, 233592, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(68, 210, 0, 5, 7, 0, 214447, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(69, 211, 0, 5, 7, 0, 99228.4, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(70, 212, 0, 5, 7, 0, 152370, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(71, 213, 0, 5, 7, 0, 98465.4, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(72, 214, 0, 5, 7, 0, 163215, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(73, 1, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(74, 2, 0, 5, 7, 0, 965190, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(75, 3, 0, 5, 7, 0, 78389.2, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(76, 4, 0, 5, 7, 0, 916285, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(77, 5, 0, 5, 7, 0, 685996, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(78, 6, 0, 5, 7, 0, 800356, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(79, 7, 0, 5, 7, 0, 719853, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(80, 8, 0, 5, 7, 0, 550236, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(81, 9, 0, 5, 7, 0, 677476, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(82, 10, 0, 5, 7, 0, 147038, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(83, 11, 0, 5, 7, 0, 452185, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(84, 12, 0, 5, 7, 0, 12981300, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(85, 13, 0, 5, 7, 0, 195601, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(86, 14, 0, 5, 7, 0, 255782, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(87, 15, 0, 5, 7, 0, 302335, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(88, 16, 0, 5, 7, 0, 239637, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(89, 17, 0, 5, 7, 0, 118646, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(90, 18, 0, 5, 7, 0, 115192, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(91, 19, 0, 5, 7, 0, 14161.6, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(92, 20, 0, 5, 7, 0, 184382, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(93, 21, 0, 5, 7, 0, 605491, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(94, 22, 0, 5, 7, 0, 208476, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(95, 23, 0, 5, 7, 0, 393872, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(96, 24, 0, 5, 7, 0, 249094, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(97, 25, 0, 5, 7, 0, 149735, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(98, 26, 0, 5, 7, 0, 154462, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(99, 27, 0, 5, 7, 0, 361924, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(100, 28, 0, 5, 7, 0, 225317, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(101, 29, 0, 5, 7, 0, 286053, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(102, 30, 0, 5, 7, 0, 174714, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(103, 31, 0, 5, 7, 0, 7201.76, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(104, 32, 0, 5, 7, 0, 58273.6, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(105, 33, 0, 5, 7, 0, 172108, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(106, 34, 0, 5, 7, 0, 103293, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(107, 35, 0, 5, 7, 0, 60567, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(108, 36, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(109, 37, 0, 5, 7, 0, 956304, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(110, 38, 0, 5, 7, 0, 848305, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(111, 39, 0, 5, 7, 0, 160382, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(112, 40, 0, 5, 7, 0, 236680, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(113, 41, 0, 5, 7, 0, 204149, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(114, 42, 0, 5, 7, 0, 223191, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(115, 43, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(116, 44, 0, 5, 7, 0, 207412, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(117, 45, 0, 5, 7, 0, 10410.9, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(118, 46, 0, 5, 7, 0, 215939, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(119, 47, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(120, 48, 0, 5, 7, 0, 94613.6, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(121, 49, 0, 5, 7, 0, 10587.8, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(122, 50, 0, 5, 7, 0, 236680, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(123, 51, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(124, 52, 0, 5, 7, 0, 247673, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(125, 53, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(126, 54, 0, 5, 7, 0, 65000.6, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(127, 55, 0, 5, 7, 0, 104517, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(128, 56, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(129, 57, 0, 5, 7, 0, 118547, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(130, 58, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(131, 59, 0, 5, 7, 0, 9821, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(132, 60, 0, 5, 7, 0, 97344.5, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(133, 61, 0, 5, 7, 0, 146868, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(134, 62, 0, 5, 7, 0, 93535.3, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(135, 63, 0, 5, 7, 0, 117804, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(136, 64, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(137, 65, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(138, 66, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(139, 67, 0, 5, 7, 0, 147998, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(140, 68, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(141, 69, 0, 5, 7, 0, 257535, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(142, 70, 0, 5, 7, 0, 174779, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(143, 71, 0, 5, 7, 0, 278464, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(144, 72, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(145, 73, 0, 5, 7, 0, 45668.5, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(146, 74, 0, 5, 7, 0, 103438, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(147, 76, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(148, 77, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(149, 78, 0, 5, 7, 0, 150201, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(150, 79, 0, 5, 7, 0, 99657, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(151, 80, 0, 5, 7, 0, 178786, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(152, 81, 0, 5, 7, 0, 80450.3, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(153, 82, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(154, 83, 0, 5, 7, 0, 129571, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(155, 84, 0, 5, 7, 0, 266840, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(156, 85, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(157, 86, 0, 5, 7, 0, 46471, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(158, 87, 0, 5, 7, 0, 109299, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(159, 88, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(160, 89, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(161, 90, 0, 5, 7, 0, 105455, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(162, 91, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(163, 92, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(164, 93, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(165, 94, 0, 5, 7, 0, 178092, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(166, 95, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(167, 96, 0, 5, 7, 0, 9504.22, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(168, 97, 0, 5, 7, 0, 265200, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(169, 98, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(170, 99, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(171, 75, 0, 5, 7, 0, 161892, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(172, 100, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(173, 101, 0, 5, 7, 0, 287394, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(174, 102, 0, 5, 7, 0, 280904, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(175, 103, 0, 5, 7, 0, 295754, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(176, 104, 0, 5, 7, 0, 252209, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(177, 105, 0, 5, 7, 0, 102365, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(178, 106, 0, 5, 7, 0, 283822, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(179, 107, 0, 5, 7, 0, 254369, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(180, 108, 0, 5, 7, 0, 124339, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(181, 109, 0, 5, 7, 0, 72895.1, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(182, 110, 0, 5, 7, 0, 179223, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(183, 111, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(184, 112, 0, 5, 7, 0, 60676.2, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(185, 113, 0, 5, 7, 0, 9504.22, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(186, 114, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(187, 115, 0, 5, 7, 0, 144369, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(188, 116, 0, 5, 7, 0, 440113, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(189, 117, 0, 5, 7, 0, 533313, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(190, 118, 0, 5, 7, 0, 389310, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(191, 119, 0, 5, 7, 0, 370259, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(192, 120, 0, 5, 7, 0, 313670, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(193, 121, 0, 5, 7, 0, 141023, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(194, 122, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(195, 123, 0, 5, 7, 0, 275806, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(196, 124, 0, 5, 7, 0, 214400, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(197, 125, 0, 5, 7, 0, 262215, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(198, 126, 0, 5, 7, 0, 172229, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(199, 127, 0, 5, 7, 0, 296826, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(200, 128, 0, 5, 7, 0, 189948, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(201, 129, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(202, 130, 0, 5, 7, 0, 68447.7, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(203, 131, 0, 5, 7, 0, 104844, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(204, 132, 0, 5, 7, 0, 9504.22, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(205, 133, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(206, 134, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(207, 135, 0, 5, 7, 0, 117159, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(208, 136, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(209, 137, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(210, 138, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(211, 139, 0, 5, 7, 0, 133221, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(212, 140, 0, 5, 7, 0, 107632, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(213, 141, 0, 5, 7, 0, 53327.8, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(214, 142, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(215, 215, 0, 5, 7, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, 0, NULL, NULL),
(216, 2, 0, 5, 7, 6084, 971274, 0, NULL, 0, 0, 0, 0, NULL, 1, '2017-08-30', NULL),
(217, 3, 0, 5, 7, 6084, 84473.2, 0, NULL, 0, 0, 0, 0, NULL, 1, '2017-08-30', NULL),
(218, 4, 0, 5, 7, 5856, 922141, 0, NULL, 0, 0, 0, 0, NULL, 1, '2017-08-30', NULL),
(219, 5, 0, 5, 7, 5603, 691599, 0, NULL, 0, 0, 0, 0, NULL, 1, '2017-08-30', NULL),
(220, 5, 154, 5, 7, 0, 695766, 0, NULL, 0, 4167, 0, 0, NULL, 2, '2017-08-30', NULL),
(221, 6, 154, 5, 7, 5603, 805959, 0, NULL, 0, 4167, 0, 0, NULL, 1, '2017-08-30', NULL),
(222, 7, 154, 5, 7, 4084, 723937, 0, NULL, 0, 4167, 0, 0, NULL, 1, '2017-08-30', NULL),
(223, 9, 154, 5, 7, 4084, 681560, 0, NULL, 0, 4167, 0, 0, NULL, 1, '2017-08-30', NULL),
(224, 10, 154, 5, 7, 3889, 150927, 0, NULL, 0, 4167, 0, 0, NULL, 1, '2017-08-30', NULL),
(225, 10, 155, 5, 7, 0, 155011, 0, NULL, 0, 4084, 0, 0, NULL, 2, '2017-08-30', NULL),
(226, 11, 155, 5, 7, 3889, 456074, 0, NULL, 0, 4084, 0, 0, NULL, 1, '2017-08-30', NULL),
(227, 12, 155, 5, 7, 3703, 12985000, 0, NULL, 0, 4084, 0, 0, NULL, 1, '2017-08-30', NULL),
(228, 12, 166, 5, 7, 0, 12988500, 0, NULL, 0, 3542, 0, 0, NULL, 2, '2017-08-30', NULL),
(229, 13, 166, 5, 7, 4084, 199685, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-30', NULL),
(230, 14, 166, 5, 7, 3703, 259485, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-30', NULL),
(231, 15, 166, 5, 7, 3889, 306224, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-30', NULL),
(232, 16, 166, 5, 7, 3703, 243340, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-30', NULL),
(233, 17, 166, 5, 7, 3358, 122004, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-30', NULL),
(234, 18, 166, 5, 7, 2810, 118002, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-30', NULL),
(235, 19, 166, 5, 7, 2548, 16709.6, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-30', NULL),
(236, 20, 166, 5, 7, 3889, 188271, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-30', NULL),
(237, 21, 166, 5, 7, 3526, 609017, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-30', NULL),
(238, 22, 166, 5, 7, 3889, 212365, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-30', NULL),
(239, 22, 166, 5, 7, 0, 212365, 0, NULL, 0, 0, 21834.8, 0, NULL, 4, '2017-08-30', NULL),
(240, 22, 170, 5, 7, 0, 220000, 0, NULL, 0, 0, 0, 7635, NULL, 3, '2017-08-30', NULL),
(241, 23, 170, 5, 7, 3703, 397575, 0, NULL, 0, 0, 0, 7635, NULL, 1, '2017-08-30', NULL),
(242, 23, 170, 5, 7, 0, 397575, 0, NULL, 0, 0, 650, 0, NULL, 4, '2017-08-30', NULL),
(243, 23, 173, 5, 7, 0, 398225, 0, NULL, 0, 0, 0, 650, NULL, 3, '2017-08-30', NULL),
(244, 24, 173, 5, 7, 3889, 252983, 0, NULL, 0, 0, 0, 650, NULL, 1, '2017-08-30', NULL),
(245, 24, 173, 5, 7, 0, 252983, 0, NULL, 0, 0, 3759.17, 0, NULL, 4, '2017-08-30', NULL),
(246, 24, 172, 5, 7, 0, 256742, 0, NULL, 0, 0, 0, 3759.17, NULL, 3, '2017-08-30', NULL),
(247, 25, 172, 5, 7, 3703, 153438, 0, NULL, 0, 0, 0, 3759.17, NULL, 1, '2017-08-30', NULL),
(248, 25, 172, 5, 7, 0, 153438, 0, NULL, 0, 0, 6381.03, 0, NULL, 4, '2017-08-30', NULL),
(249, 25, 174, 5, 7, 0, 159329, 0, NULL, 0, 0, 0, 5891, NULL, 3, '2017-08-30', NULL),
(250, 26, 174, 5, 7, 2937, 157399, 0, NULL, 0, 0, 0, 5891, NULL, 1, '2017-08-30', NULL),
(251, 26, 174, 5, 7, 0, 157399, 0, NULL, 0, 0, 4875, 0, NULL, 4, '2017-08-30', NULL),
(252, 26, 175, 5, 7, 0, 159899, 0, NULL, 0, 0, 0, 2500, NULL, 3, '2017-08-30', NULL),
(253, 27, 175, 5, 7, 2255, 364179, 0, NULL, 0, 0, 0, 2500, NULL, 1, '2017-08-30', NULL),
(254, 28, 175, 5, 7, 2810, 228127, 0, NULL, 0, 0, 0, 2500, NULL, 1, '2017-08-30', NULL),
(255, 29, 175, 5, 7, 2937, 288990, 0, NULL, 0, 0, 0, 2500, NULL, 1, '2017-08-30', NULL),
(256, 29, 175, 5, 7, 0, 288990, 0, NULL, 0, 0, 2681.25, 0, NULL, 4, '2017-08-30', NULL),
(257, 29, 176, 5, 7, 0, 291671, 0, NULL, 0, 0, 0, 2681.25, NULL, 3, '2017-08-30', NULL),
(258, 30, 176, 5, 7, 2548, 177262, 0, NULL, 0, 0, 0, 2681.25, NULL, 1, '2017-08-30', NULL),
(259, 31, 176, 5, 7, 1853, 9054.76, 0, NULL, 0, 0, 0, 2681.25, NULL, 1, '2017-08-30', NULL),
(260, 32, 176, 5, 7, 3239, 61512.6, 0, NULL, 0, 0, 0, 2681.25, NULL, 1, '2017-08-30', NULL),
(261, 32, 176, 5, 7, 0, 61512.6, 0, NULL, 0, 0, 11748.8, 0, NULL, 4, '2017-08-30', NULL),
(262, 32, 177, 5, 7, 0, 66537.6, 0, NULL, 0, 0, 0, 5025, NULL, 3, '2017-08-30', NULL),
(263, 33, 177, 5, 7, 2951, 175059, 0, NULL, 0, 0, 0, 5025, NULL, 1, '2017-08-30', NULL),
(264, 34, 177, 5, 7, 2255, 105548, 0, NULL, 0, 0, 0, 5025, NULL, 1, '2017-08-30', NULL),
(265, 35, 177, 5, 7, 1512, 62079, 0, NULL, 0, 0, 0, 5025, NULL, 1, '2017-08-30', NULL),
(266, 36, 177, 5, 7, 1939, 1939, 0, NULL, 0, 0, 0, 5025, NULL, 1, '2017-08-30', NULL),
(267, 36, 179, 5, 7, 0, 7969, 0, NULL, 0, 6030, 0, 0, NULL, 2, '2017-08-30', NULL),
(268, 37, 179, 5, 7, 2147, 958451, 0, NULL, 0, 6030, 0, 0, NULL, 1, '2017-08-30', NULL),
(269, 37, 180, 5, 7, 0, 962383, 0, NULL, 0, 3932, 0, 0, NULL, 2, '2017-08-30', NULL),
(270, 38, 180, 5, 7, 2036, 850341, 0, NULL, 0, 3932, 0, 0, NULL, 1, '2017-08-30', NULL),
(271, 38, 181, 5, 7, 0, 851859, 0, NULL, 0, 1518, 0, 0, NULL, 2, '2017-08-30', NULL),
(272, 39, 181, 5, 7, 1939, 162321, 0, NULL, 0, 1518, 0, 0, NULL, 1, '2017-08-30', NULL),
(273, 40, 181, 5, 7, 1511, 238191, 0, NULL, 0, 1518, 0, 0, NULL, 1, '2017-08-30', NULL),
(274, 40, 182, 5, 7, 0, 240921, 0, NULL, 0, 2730, 0, 0, NULL, 2, '2017-08-30', NULL),
(275, 41, 182, 5, 7, 1939, 206088, 0, NULL, 0, 2730, 0, 0, NULL, 1, '2017-08-30', NULL),
(276, 41, 183, 5, 7, 0, 208698, 0, NULL, 0, 2610, 0, 0, NULL, 2, '2017-08-30', NULL),
(277, 42, 183, 5, 7, 1796, 224987, 0, NULL, 0, 2610, 0, 0, NULL, 1, '2017-08-30', NULL),
(278, 42, 183, 5, 7, 0, 224987, 0, NULL, 0, 0, 7972.58, 0, NULL, 4, '2017-08-30', NULL),
(279, 42, 185, 5, 7, 0, 227503, 0, NULL, 0, 0, 0, 2516, NULL, 3, '2017-08-30', NULL),
(280, 43, 185, 5, 7, 1249, 1249, 0, NULL, 0, 0, 0, 2516, NULL, 1, '2017-08-30', NULL),
(281, 43, 185, 5, 7, 0, 1249, 0, NULL, 0, 0, 4170.83, 0, NULL, 4, '2017-08-30', NULL),
(282, 43, 186, 5, 7, 0, 2624, 0, NULL, 0, 0, 0, 1375, NULL, 3, '2017-08-30', NULL),
(283, 44, 186, 5, 7, 1588, 209000, 0, NULL, 0, 0, 0, 1375, NULL, 1, '2017-08-30', NULL),
(284, 45, 186, 5, 7, 1043, 11453.9, 0, NULL, 0, 0, 0, 1375, NULL, 1, '2017-08-30', NULL),
(285, 46, 186, 5, 7, 3445, 219384, 0, NULL, 0, 0, 0, 1375, NULL, 1, '2017-08-30', NULL),
(286, 47, 186, 5, 7, 1710, 1710, 0, NULL, 0, 0, 0, 1375, NULL, 1, '2017-08-30', NULL),
(287, 48, 186, 5, 7, 3597.5, 98211.1, 0, NULL, 0, 0, 0, 1375, NULL, 1, '2017-08-30', NULL),
(288, 48, 186, 5, 7, 0, 98211.1, 0, NULL, 0, 0, 8038.33, 0, NULL, 4, '2017-08-30', NULL),
(289, 48, 197, 5, 7, 0, 100420, 0, NULL, 0, 0, 0, 2209, NULL, 3, '2017-08-30', NULL),
(290, 49, 197, 5, 7, 3427, 14014.8, 0, NULL, 0, 0, 0, 2209, NULL, 1, '2017-08-30', NULL),
(291, 49, 197, 5, 7, 0, 14014.8, 0, NULL, 0, 0, 2578.33, 0, NULL, 4, '2017-08-30', NULL),
(292, 49, 198, 5, 7, 0, 15431.8, 0, NULL, 0, 0, 0, 1417, NULL, 3, '2017-08-30', NULL),
(293, 50, 198, 5, 7, 1511, 238191, 0, NULL, 0, 0, 0, 1417, NULL, 1, '2017-08-30', NULL),
(294, 51, 198, 5, 7, 957, 957, 0, NULL, 0, 0, 0, 1417, NULL, 1, '2017-08-30', NULL),
(295, 52, 198, 5, 7, 1401, 249074, 0, NULL, 0, 0, 0, 1417, NULL, 1, '2017-08-30', NULL),
(296, 53, 198, 5, 7, 957, 957, 0, NULL, 0, 0, 0, 1417, NULL, 1, '2017-08-30', NULL),
(297, 54, 198, 5, 7, 1371, 66371.6, 0, NULL, 0, 0, 0, 1417, NULL, 1, '2017-08-30', NULL),
(298, 54, 198, 5, 7, 0, 66371.6, 0, NULL, 0, 0, 8371.3, 0, NULL, 4, '2017-08-30', NULL),
(299, 54, 199, 5, 7, 0, 71016.6, 0, NULL, 0, 0, 0, 4645, NULL, 3, '2017-08-30', NULL),
(300, 55, 199, 5, 7, 1200, 105717, 0, NULL, 0, 0, 0, 4645, NULL, 1, '2017-08-30', NULL),
(301, 56, 199, 5, 7, 1472, 1472, 0, NULL, 0, 0, 0, 4645, NULL, 1, '2017-08-30', NULL),
(302, 56, 199, 5, 7, 0, 1472, 0, NULL, 0, 0, 4972.5, 0, NULL, 4, '2017-08-30', NULL),
(303, 56, 200, 5, 7, 0, 3597, 0, NULL, 0, 0, 0, 2125, NULL, 3, '2017-08-30', NULL),
(304, 57, 200, 5, 7, 1401, 119948, 0, NULL, 0, 0, 0, 2125, NULL, 1, '2017-08-30', NULL),
(305, 57, 200, 5, 7, 0, 119948, 0, NULL, 0, 0, 4387.5, 0, NULL, 4, '2017-08-30', NULL),
(306, 57, 201, 5, 7, 0, 122761, 0, NULL, 0, 0, 0, 2813, NULL, 3, '2017-08-30', NULL),
(307, 58, 201, 5, 7, 1260, 1260, 0, NULL, 0, 0, 0, 2813, NULL, 1, '2017-08-30', NULL),
(308, 58, 201, 5, 7, 0, 1260, 0, NULL, 0, 0, 3731.07, 0, NULL, 4, '2017-08-30', NULL),
(309, 58, 202, 5, 7, 0, 2456, 0, NULL, 0, 0, 0, 1196, NULL, 3, '2017-08-30', NULL),
(310, 59, 202, 5, 7, 985, 10806, 0, NULL, 0, 0, 0, 1196, NULL, 1, '2017-08-30', NULL),
(311, 60, 202, 5, 7, 1260, 98604.5, 0, NULL, 0, 0, 0, 1196, NULL, 1, '2017-08-30', NULL),
(312, 60, 202, 5, 7, 0, 98604.5, 0, NULL, 0, 0, 1301.3, 0, NULL, 4, '2017-08-30', NULL),
(313, 60, 203, 5, 7, 0, 99066.5, 0, NULL, 0, 0, 0, 462, NULL, 3, '2017-08-30', NULL),
(314, 61, 203, 5, 7, 1472, 148340, 0, NULL, 0, 0, 0, 462, NULL, 1, '2017-08-30', NULL),
(315, 61, 203, 5, 7, 0, 148340, 0, NULL, 0, 0, 7312.5, 0, NULL, 4, '2017-08-30', NULL),
(316, 61, 204, 5, 7, 0, 151465, 0, NULL, 0, 0, 0, 3125, NULL, 3, '2017-08-30', NULL),
(317, 62, 204, 5, 7, 1260, 94795.3, 0, NULL, 0, 0, 0, 3125, NULL, 1, '2017-08-30', NULL),
(318, 63, 204, 5, 7, 1472, 119276, 0, NULL, 0, 0, 0, 3125, NULL, 1, '2017-08-30', NULL),
(319, 63, 204, 5, 7, 0, 119276, 0, NULL, 0, 0, 3763.07, 0, NULL, 4, '2017-08-30', NULL),
(320, 63, 205, 5, 7, 0, 121451, 0, NULL, 0, 0, 0, 2175, NULL, 3, '2017-08-30', NULL),
(321, 64, 205, 5, 7, 1334, 1334, 0, NULL, 0, 0, 0, 2175, NULL, 1, '2017-08-30', NULL),
(322, 67, 205, 5, 7, 1242, 149240, 0, NULL, 0, 0, 0, 2175, NULL, 1, '2017-08-30', NULL),
(323, 68, 205, 5, 7, 1401, 1401, 0, NULL, 0, 0, 0, 2175, NULL, 1, '2017-08-30', NULL),
(324, 68, 206, 5, 7, 0, 5068, 0, NULL, 0, 3667, 0, 0, NULL, 2, '2017-08-30', NULL),
(325, 69, 206, 5, 7, 1472, 259007, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(326, 70, 206, 5, 7, 1401, 176180, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(327, 71, 206, 5, 7, 1472, 279936, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(328, 72, 206, 5, 7, 1472, 1472, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(329, 73, 206, 5, 7, 1260, 46928.5, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(330, 74, 206, 5, 7, 1260, 104698, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(331, 75, 206, 5, 7, 1472, 163364, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(332, 76, 206, 5, 7, 1472, 1472, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(333, 77, 206, 5, 7, 1401, 1401, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(334, 78, 206, 5, 7, 1401, 151602, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(335, 79, 206, 5, 7, 1200, 100857, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(336, 80, 206, 5, 7, 1472, 180258, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(337, 81, 206, 5, 7, 1401, 81851.3, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(338, 82, 206, 5, 7, 1472, 1472, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(339, 83, 206, 5, 7, 1472, 131043, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(340, 84, 206, 5, 7, 1472, 268312, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(341, 85, 206, 5, 7, 1401, 1401, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(342, 86, 206, 5, 7, 1401, 47872, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(343, 87, 206, 5, 7, 1472, 110771, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(344, 88, 206, 5, 7, 1401, 1401, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(345, 89, 206, 5, 7, 1401, 1401, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(346, 90, 206, 5, 7, 1334, 106789, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(347, 91, 206, 5, 7, 1334, 1334, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(348, 92, 206, 5, 7, 1305, 1305, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(349, 93, 206, 5, 7, 1472, 1472, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(350, 94, 206, 5, 7, 1472, 179564, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(351, 95, 206, 5, 7, 1005, 1005, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(352, 96, 206, 5, 7, 957, 10461.2, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(353, 97, 206, 5, 7, 1401, 266601, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(354, 98, 206, 5, 7, 275.5, 275.5, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(355, 99, 206, 5, 7, 1410, 1410, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(356, 100, 206, 5, 7, 1401, 1401, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(357, 101, 206, 5, 7, 1401, 288795, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(358, 102, 206, 5, 7, 2487, 283391, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(359, 103, 206, 5, 7, 1668, 297422, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(360, 105, 206, 5, 7, 1846, 104211, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(361, 106, 206, 5, 7, 1846, 285668, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(362, 107, 206, 5, 7, 2000, 256369, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(363, 108, 206, 5, 7, 1370, 125709, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(364, 109, 206, 5, 7, 1370, 74265.1, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(365, 110, 206, 5, 7, 3425, 182648, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(366, 111, 206, 5, 7, 1260, 1260, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(367, 112, 206, 5, 7, 1401, 62077.2, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(368, 113, 206, 5, 7, 957, 10461.2, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(369, 114, 206, 5, 7, 5262.5, 5262.5, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(370, 115, 206, 5, 7, 2042, 146411, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(371, 116, 206, 5, 7, 1796, 441909, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(372, 117, 206, 5, 7, 1500, 534813, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(373, 118, 206, 5, 7, 1840, 391150, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(374, 119, 206, 5, 7, 2000, 372259, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(375, 120, 206, 5, 7, 1796, 315466, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(376, 121, 206, 5, 7, 1512, 142535, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(377, 122, 206, 5, 7, 1668, 1668, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(378, 123, 206, 5, 7, 1668, 277474, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(379, 124, 206, 5, 7, 1710, 216110, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(380, 125, 206, 5, 7, 1588, 263803, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(381, 126, 206, 5, 7, 1668, 173897, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(382, 127, 206, 5, 7, 1511, 298337, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(383, 128, 206, 5, 7, 1511, 191459, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(384, 129, 206, 5, 7, 1370, 1370, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(385, 130, 206, 5, 7, 1401, 69848.7, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(386, 131, 206, 5, 7, 1200, 106044, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(387, 132, 206, 5, 7, 957, 10461.2, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(388, 133, 206, 5, 7, 1546, 1546, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(389, 134, 206, 5, 7, 1260, 1260, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(390, 135, 206, 5, 7, 1472, 118631, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(391, 136, 206, 5, 7, 1472, 1472, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(392, 138, 206, 5, 7, 1401, 1401, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(393, 139, 206, 5, 7, 1401, 134622, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(394, 140, 206, 5, 7, 1334, 108966, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(395, 141, 206, 5, 7, 1323, 54650.8, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(396, 142, 206, 5, 7, 1334, 1334, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(397, 143, 206, 5, 7, 2042, 276661, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(398, 144, 206, 5, 7, 1846, 57638, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-30', NULL),
(399, 144, 156, 5, 7, 0, 59788, 0, NULL, 0, 2150, 0, 0, NULL, 2, '2017-08-30', NULL),
(400, 145, 156, 5, 7, 1939, 178934, 0, NULL, 0, 2150, 0, 0, NULL, 1, '2017-08-30', NULL),
(401, 145, 157, 5, 7, 0, 182747, 0, NULL, 0, 3813, 0, 0, NULL, 2, '2017-08-30', NULL),
(402, 146, 157, 5, 7, 1512, 136087, 0, NULL, 0, 3813, 0, 0, NULL, 1, '2017-08-30', NULL),
(403, 147, 157, 5, 7, 1370, 128476, 0, NULL, 0, 3813, 0, 0, NULL, 1, '2017-08-30', NULL),
(404, 148, 157, 5, 7, 1939, 135411, 0, NULL, 0, 3813, 0, 0, NULL, 1, '2017-08-30', NULL),
(405, 148, 171, 5, 7, 0, 137565, 0, NULL, 0, 2154, 0, 0, NULL, 2, '2017-08-30', NULL),
(406, 149, 171, 5, 7, 1370, 124437, 0, NULL, 0, 2154, 0, 0, NULL, 1, '2017-08-30', NULL),
(407, 150, 171, 5, 7, 1401, 228945, 0, NULL, 0, 2154, 0, 0, NULL, 1, '2017-08-30', NULL),
(408, 151, 171, 5, 7, 1401, 187879, 0, NULL, 0, 2154, 0, 0, NULL, 1, '2017-08-30', NULL),
(409, 151, 187, 5, 7, 0, 189578, 0, NULL, 0, 1699, 0, 0, NULL, 2, '2017-08-30', NULL),
(410, 152, 187, 5, 7, 957, 10461.2, 0, NULL, 0, 1699, 0, 0, NULL, 1, '2017-08-30', NULL),
(411, 153, 187, 5, 7, 1939, 315927, 0, NULL, 0, 1699, 0, 0, NULL, 1, '2017-08-30', NULL),
(412, 154, 187, 5, 7, 3000, 469966, 0, NULL, 0, 1699, 0, 0, NULL, 1, '2017-08-30', NULL),
(413, 155, 187, 5, 7, 1401, 97725.6, 0, NULL, 0, 1699, 0, 0, NULL, 1, '2017-08-30', NULL),
(414, 155, 188, 5, 7, 0, 100358, 0, NULL, 0, 2632, 0, 0, NULL, 2, '2017-08-30', NULL),
(415, 156, 188, 5, 7, 1500, 393616, 0, NULL, 0, 2632, 0, 0, NULL, 1, '2017-08-30', NULL),
(416, 156, 188, 5, 7, 0, 393616, 0, NULL, 0, 0, 1000, 0, NULL, 4, '2017-08-30', NULL),
(417, 157, 188, 5, 7, 1758, 416246, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-30', NULL),
(418, 158, 188, 5, 7, 1628, 388944, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-30', NULL),
(419, 159, 188, 5, 7, 1796, 298587, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-30', NULL),
(420, 160, 188, 5, 7, 1796, 108615, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-30', NULL),
(421, 160, 158, 5, 7, 0, 112719, 0, NULL, 0, 4104, 0, 0, NULL, 2, '2017-08-30', NULL),
(422, 161, 158, 5, 7, 1796, 129560, 0, NULL, 0, 4104, 0, 0, NULL, 1, '2017-08-30', NULL),
(423, 161, 190, 5, 7, 0, 133518, 0, NULL, 0, 3958, 0, 0, NULL, 2, '2017-08-30', NULL),
(424, 162, 190, 5, 7, 1440, 115703, 0, NULL, 0, 3958, 0, 0, NULL, 1, '2017-08-30', NULL),
(425, 163, 190, 5, 7, 1439, 134937, 0, NULL, 0, 3958, 0, 0, NULL, 1, '2017-08-30', NULL),
(426, 164, 190, 5, 7, 1401, 267978, 0, NULL, 0, 3958, 0, 0, NULL, 1, '2017-08-30', NULL),
(427, 165, 190, 5, 7, 1200, 108800, 0, NULL, 0, 3958, 0, 0, NULL, 1, '2017-08-30', NULL),
(428, 166, 190, 5, 7, 1260, 64883.5, 0, NULL, 0, 3958, 0, 0, NULL, 1, '2017-08-30', NULL),
(429, 166, 191, 5, 7, 0, 66233.5, 0, NULL, 0, 1350, 0, 0, NULL, 2, '2017-08-30', NULL),
(430, 167, 191, 5, 7, 2042, 367517, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-30', NULL),
(431, 168, 191, 5, 7, 1939, 456344, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-30', NULL),
(432, 169, 191, 5, 7, 1846, 122393, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-30', NULL),
(433, 170, 191, 5, 7, 1846, 344574, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-30', NULL),
(434, 171, 191, 5, 7, 1304, 189283, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-30', NULL),
(435, 172, 191, 5, 7, 1312, 110249, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-30', NULL),
(436, 173, 191, 5, 7, 1511, 137694, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-30', NULL),
(437, 174, 191, 5, 7, 1378, 119308, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-30', NULL),
(438, 175, 191, 5, 7, 1312, 94809, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-30', NULL),
(439, 176, 191, 5, 7, 1078, 11448.8, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-30', NULL),
(440, 177, 191, 5, 7, 1078, 11918.8, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-30', NULL),
(441, 178, 191, 5, 7, 1401, 154852, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-30', NULL),
(442, 178, 192, 5, 7, 0, 158248, 0, NULL, 0, 3396, 0, 0, NULL, 2, '2017-08-30', NULL),
(443, 179, 192, 5, 7, 1401, 114117, 0, NULL, 0, 3396, 0, 0, NULL, 1, '2017-08-30', NULL),
(444, 179, 193, 5, 7, 0, 116701, 0, NULL, 0, 2584, 0, 0, NULL, 2, '2017-08-30', NULL),
(445, 180, 193, 5, 7, 2368, 103487, 0, NULL, 0, 2584, 0, 0, NULL, 1, '2017-08-30', NULL),
(446, 180, 159, 5, 7, 0, 109002, 0, NULL, 0, 5515, 0, 0, NULL, 2, '2017-08-30', NULL),
(447, 182, 159, 5, 7, 3502.5, 123200, 0, NULL, 0, 5515, 0, 0, NULL, 1, '2017-08-30', NULL),
(448, 183, 159, 5, 7, 2676, 109848, 0, NULL, 0, 5515, 0, 0, NULL, 1, '2017-08-30', NULL),
(449, 183, 194, 5, 7, 0, 112023, 0, NULL, 0, 2175, 0, 0, NULL, 2, '2017-08-30', NULL),
(450, 184, 194, 5, 7, 1043, 11453.9, 0, NULL, 0, 2175, 0, 0, NULL, 1, '2017-08-30', NULL),
(451, 185, 194, 5, 7, 1370, 66358.7, 0, NULL, 0, 2175, 0, 0, NULL, 1, '2017-08-30', NULL),
(452, 185, 195, 5, 7, 0, 67383.7, 0, NULL, 0, 1025, 0, 0, NULL, 2, '2017-08-30', NULL),
(453, 186, 195, 5, 7, 1401, 86455.9, 0, NULL, 0, 1025, 0, 0, NULL, 1, '2017-08-30', NULL),
(454, 186, 160, 5, 7, 0, 89351.9, 0, NULL, 0, 2896, 0, 0, NULL, 2, '2017-08-30', NULL),
(455, 187, 160, 5, 7, 2612, 477652, 0, NULL, 0, 2896, 0, 0, NULL, 1, '2017-08-30', NULL),
(456, 187, 196, 5, 7, 0, 481049, 0, NULL, 0, 3397, 0, 0, NULL, 2, '2017-08-30', NULL),
(457, 188, 196, 5, 7, 1401, 74434.4, 0, NULL, 0, 3397, 0, 0, NULL, 1, '2017-08-30', NULL),
(458, 188, 161, 5, 7, 0, 77313.4, 0, NULL, 0, 2879, 0, 0, NULL, 2, '2017-08-30', NULL),
(459, 189, 161, 5, 7, 2000, 185472, 0, NULL, 0, 2879, 0, 0, NULL, 1, '2017-08-30', NULL),
(460, 189, 189, 5, 7, 0, 189577, 0, NULL, 0, 4105, 0, 0, NULL, 2, '2017-08-30', NULL),
(461, 190, 189, 5, 7, 1078, 11918.8, 0, NULL, 0, 4105, 0, 0, NULL, 1, '2017-08-30', NULL),
(462, 191, 189, 5, 7, 2042, 226852, 0, NULL, 0, 4105, 0, 0, NULL, 1, '2017-08-30', NULL),
(463, 191, 162, 5, 7, 0, 228102, 0, NULL, 0, 1250, 0, 0, NULL, 2, '2017-08-30', NULL),
(464, 192, 162, 5, 7, 1305, 106158, 0, NULL, 0, 1250, 0, 0, NULL, 1, '2017-08-30', NULL),
(465, 193, 162, 5, 7, 1710, 139835, 0, NULL, 0, 1250, 0, 0, NULL, 1, '2017-08-30', NULL),
(466, 194, 162, 5, 7, 1370, 58561, 0, NULL, 0, 1250, 0, 0, NULL, 1, '2017-08-30', NULL),
(467, 195, 162, 5, 7, 1512, 52025.1, 0, NULL, 0, 1250, 0, 0, NULL, 1, '2017-08-30', NULL),
(468, 196, 162, 5, 7, 1440, 113735, 0, NULL, 0, 1250, 0, 0, NULL, 1, '2017-08-30', NULL),
(469, 197, 162, 5, 7, 1241, 57619.3, 0, NULL, 0, 1250, 0, 0, NULL, 1, '2017-08-30', NULL),
(470, 198, 162, 5, 7, 1511, 37427.4, 0, NULL, 0, 1250, 0, 0, NULL, 1, '2017-08-30', NULL),
(471, 198, 163, 5, 7, 0, 38864.4, 0, NULL, 0, 1437, 0, 0, NULL, 2, '2017-08-30', NULL),
(472, 199, 163, 5, 7, 1312, 81632.9, 0, NULL, 0, 1437, 0, 0, NULL, 1, '2017-08-30', NULL),
(473, 200, 163, 5, 7, 1511, 996315, 0, NULL, 0, 1437, 0, 0, NULL, 1, '2017-08-30', NULL),
(474, 201, 163, 5, 7, 1370, 83952, 0, NULL, 0, 1437, 0, 0, NULL, 1, '2017-08-30', NULL),
(475, 202, 163, 5, 7, 1132, 12278.8, 0, NULL, 0, 1437, 0, 0, NULL, 1, '2017-08-30', NULL),
(476, 203, 163, 5, 7, 1370, 71099.3, 0, NULL, 0, 1437, 0, 0, NULL, 1, '2017-08-30', NULL),
(477, 203, 164, 5, 7, 0, 71849.3, 0, NULL, 0, 750, 0, 0, NULL, 2, '2017-08-30', NULL),
(478, 204, 164, 5, 7, 1511, 43136, 0, NULL, 0, 750, 0, 0, NULL, 1, '2017-08-30', NULL),
(479, 204, 165, 5, 7, 0, 45791, 0, NULL, 0, 2655, 0, 0, NULL, 2, '2017-08-30', NULL),
(480, 205, 165, 5, 7, 1511, 218507, 0, NULL, 0, 2655, 0, 0, NULL, 1, '2017-08-30', NULL),
(481, 205, 167, 5, 7, 0, 219341, 0, NULL, 0, 834, 0, 0, NULL, 2, '2017-08-30', NULL),
(482, 206, 167, 5, 7, 1439, 281450, 0, NULL, 0, 834, 0, 0, NULL, 1, '2017-08-30', NULL),
(483, 207, 167, 5, 7, 1587, 249686, 0, NULL, 0, 834, 0, 0, NULL, 1, '2017-08-30', NULL),
(484, 208, 167, 5, 7, 1447, 159538, 0, NULL, 0, 834, 0, 0, NULL, 1, '2017-08-30', NULL),
(485, 209, 167, 5, 7, 1447, 235039, 0, NULL, 0, 834, 0, 0, NULL, 1, '2017-08-30', NULL),
(486, 210, 167, 5, 7, 1401, 215848, 0, NULL, 0, 834, 0, 0, NULL, 1, '2017-08-30', NULL),
(487, 211, 167, 5, 7, 1242, 100470, 0, NULL, 0, 834, 0, 0, NULL, 1, '2017-08-30', NULL),
(488, 212, 167, 5, 7, 2484, 154854, 0, NULL, 0, 834, 0, 0, NULL, 1, '2017-08-30', NULL),
(489, 213, 167, 5, 7, 1209, 99674.4, 0, NULL, 0, 834, 0, 0, NULL, 1, '2017-08-30', NULL),
(490, 214, 167, 5, 7, 1401, 164616, 0, NULL, 0, 834, 0, 0, NULL, 1, '2017-08-30', NULL),
(491, 214, 169, 5, 7, 0, 166882, 0, NULL, 0, 2266, 0, 0, NULL, 2, '2017-08-30', NULL),
(492, 215, 169, 5, 7, 1401, 1401, 0, NULL, 0, 2266, 0, 0, NULL, 1, '2017-08-30', NULL),
(493, 66, 169, 5, 7, 1260, 1260, 0, NULL, 0, 2266, 0, 0, NULL, 1, '2017-08-30', NULL),
(494, 104, 169, 5, 7, 2000, 254209, 0, NULL, 0, 2266, 0, 0, NULL, 1, '2017-08-30', NULL),
(495, 2, 0, 5, 7, 6084, 977358, 0, NULL, 0, 0, 0, 0, NULL, 1, '2017-08-31', NULL),
(496, 3, 0, 5, 7, 6084, 90557.2, 0, NULL, 0, 0, 0, 0, NULL, 1, '2017-08-31', NULL),
(497, 4, 0, 5, 7, 5856, 927997, 0, NULL, 0, 0, 0, 0, NULL, 1, '2017-08-31', NULL),
(498, 5, 0, 5, 7, 5603, 701369, 0, NULL, 0, 0, 0, 0, NULL, 1, '2017-08-31', NULL),
(499, 5, 154, 5, 7, 0, 705536, 0, NULL, 0, 4167, 0, 0, NULL, 2, '2017-08-31', NULL),
(500, 6, 154, 5, 7, 5603, 811562, 0, NULL, 0, 4167, 0, 0, NULL, 1, '2017-08-31', NULL),
(501, 7, 154, 5, 7, 4084, 728021, 0, NULL, 0, 4167, 0, 0, NULL, 1, '2017-08-31', NULL),
(502, 9, 154, 5, 7, 4084, 685644, 0, NULL, 0, 4167, 0, 0, NULL, 1, '2017-08-31', NULL),
(503, 10, 154, 5, 7, 3889, 158900, 0, NULL, 0, 4167, 0, 0, NULL, 1, '2017-08-31', NULL),
(504, 10, 155, 5, 7, 0, 162984, 0, NULL, 0, 4084, 0, 0, NULL, 2, '2017-08-31', NULL),
(505, 11, 155, 5, 7, 3889, 459963, 0, NULL, 0, 4084, 0, 0, NULL, 1, '2017-08-31', NULL),
(506, 12, 155, 5, 7, 3703, 12992200, 0, NULL, 0, 4084, 0, 0, NULL, 1, '2017-08-31', NULL),
(507, 12, 166, 5, 7, 0, 12995700, 0, NULL, 0, 3542, 0, 0, NULL, 2, '2017-08-31', NULL),
(508, 13, 166, 5, 7, 4084, 203769, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-31', NULL),
(509, 14, 166, 5, 7, 3703, 263188, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-31', NULL),
(510, 15, 166, 5, 7, 3889, 310113, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-31', NULL),
(511, 16, 166, 5, 7, 3703, 247043, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-31', NULL),
(512, 17, 166, 5, 7, 3358, 125362, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-31', NULL),
(513, 18, 166, 5, 7, 2810, 120812, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-31', NULL),
(514, 19, 166, 5, 7, 2548, 19257.6, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-31', NULL),
(515, 20, 166, 5, 7, 3889, 192160, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-31', NULL),
(516, 21, 166, 5, 7, 3526, 612543, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-31', NULL),
(517, 22, 166, 5, 7, 3889, 223889, 0, NULL, 0, 3542, 0, 0, NULL, 1, '2017-08-31', NULL),
(518, 22, 170, 5, 7, 0, 231524, 0, NULL, 0, 3542, 0, 7635, NULL, 3, '2017-08-31', NULL),
(519, 23, 170, 5, 7, 3703, 401928, 0, NULL, 0, 3542, 0, 7635, NULL, 1, '2017-08-31', NULL),
(520, 24, 170, 5, 7, 3889, 260631, 0, NULL, 0, 3542, 0, 7635, NULL, 1, '2017-08-31', NULL),
(521, 25, 170, 5, 7, 3703, 163032, 0, NULL, 0, 3542, 0, 7635, NULL, 1, '2017-08-31', NULL),
(522, 25, 174, 5, 7, 0, 163522, 0, NULL, 0, 3542, 0, 490.03, NULL, 3, '2017-08-31', NULL),
(523, 26, 174, 5, 7, 2937, 162836, 0, NULL, 0, 3542, 0, 490.03, NULL, 1, '2017-08-31', NULL),
(524, 26, 175, 5, 7, 0, 165211, 0, NULL, 0, 3542, 0, 2375, NULL, 3, '2017-08-31', NULL),
(525, 27, 175, 5, 7, 2255, 366434, 0, NULL, 0, 3542, 0, 2375, NULL, 1, '2017-08-31', NULL),
(526, 28, 175, 5, 7, 2810, 230937, 0, NULL, 0, 3542, 0, 2375, NULL, 1, '2017-08-31', NULL),
(527, 29, 175, 5, 7, 2937, 294608, 0, NULL, 0, 3542, 0, 2375, NULL, 1, '2017-08-31', NULL),
(528, 30, 175, 5, 7, 2548, 179810, 0, NULL, 0, 3542, 0, 2375, NULL, 1, '2017-08-31', NULL),
(529, 31, 175, 5, 7, 1853, 10907.8, 0, NULL, 0, 3542, 0, 2375, NULL, 1, '2017-08-31', NULL),
(530, 32, 175, 5, 7, 3239, 69776.6, 0, NULL, 0, 3542, 0, 2375, NULL, 1, '2017-08-31', NULL),
(531, 32, 177, 5, 7, 0, 74801.6, 0, NULL, 0, 3542, 0, 5025, NULL, 3, '2017-08-31', NULL),
(532, 33, 177, 5, 7, 2951, 178010, 0, NULL, 0, 3542, 0, 5025, NULL, 1, '2017-08-31', NULL),
(533, 34, 177, 5, 7, 2255, 107803, 0, NULL, 0, 3542, 0, 5025, NULL, 1, '2017-08-31', NULL),
(534, 35, 177, 5, 7, 1512, 63591, 0, NULL, 0, 3542, 0, 5025, NULL, 1, '2017-08-31', NULL),
(535, 36, 177, 5, 7, 1939, 9908, 0, NULL, 0, 3542, 0, 5025, NULL, 1, '2017-08-31', NULL),
(536, 36, 179, 5, 7, 0, 15938, 0, NULL, 0, 6030, 0, 0, NULL, 2, '2017-08-31', NULL),
(537, 37, 179, 5, 7, 2147, 964530, 0, NULL, 0, 6030, 0, 0, NULL, 1, '2017-08-31', NULL),
(538, 37, 180, 5, 7, 0, 968462, 0, NULL, 0, 3932, 0, 0, NULL, 2, '2017-08-31', NULL),
(539, 38, 180, 5, 7, 2036, 853895, 0, NULL, 0, 3932, 0, 0, NULL, 1, '2017-08-31', NULL),
(540, 38, 181, 5, 7, 0, 855413, 0, NULL, 0, 1518, 0, 0, NULL, 2, '2017-08-31', NULL),
(541, 39, 181, 5, 7, 1939, 164260, 0, NULL, 0, 1518, 0, 0, NULL, 1, '2017-08-31', NULL),
(542, 40, 181, 5, 7, 1511, 242432, 0, NULL, 0, 1518, 0, 0, NULL, 1, '2017-08-31', NULL),
(543, 40, 182, 5, 7, 0, 245162, 0, NULL, 0, 2730, 0, 0, NULL, 2, '2017-08-31', NULL),
(544, 41, 182, 5, 7, 1939, 210637, 0, NULL, 0, 2730, 0, 0, NULL, 1, '2017-08-31', NULL),
(545, 41, 183, 5, 7, 0, 213247, 0, NULL, 0, 2610, 0, 0, NULL, 2, '2017-08-31', NULL),
(546, 42, 183, 5, 7, 1796, 229299, 0, NULL, 0, 2610, 0, 0, NULL, 1, '2017-08-31', NULL),
(547, 42, 185, 5, 7, 0, 231815, 0, NULL, 0, 2610, 0, 2516, NULL, 3, '2017-08-31', NULL),
(548, 43, 185, 5, 7, 1249, 3873, 0, NULL, 0, 2610, 0, 2516, NULL, 1, '2017-08-31', NULL),
(549, 43, 186, 5, 7, 0, 5248, 0, NULL, 0, 2610, 0, 1375, NULL, 3, '2017-08-31', NULL),
(550, 44, 186, 5, 7, 1588, 210588, 0, NULL, 0, 2610, 0, 1375, NULL, 1, '2017-08-31', NULL),
(551, 45, 186, 5, 7, 1043, 12496.9, 0, NULL, 0, 2610, 0, 1375, NULL, 1, '2017-08-31', NULL),
(552, 46, 186, 5, 7, 3445, 222829, 0, NULL, 0, 2610, 0, 1375, NULL, 1, '2017-08-31', NULL),
(553, 47, 186, 5, 7, 1710, 3420, 0, NULL, 0, 2610, 0, 1375, NULL, 1, '2017-08-31', NULL),
(554, 48, 186, 5, 7, 3597.5, 104018, 0, NULL, 0, 2610, 0, 1375, NULL, 1, '2017-08-31', NULL),
(555, 48, 197, 5, 7, 0, 106226, 0, NULL, 0, 2610, 0, 2209, NULL, 3, '2017-08-31', NULL),
(556, 49, 197, 5, 7, 3427, 18858.8, 0, NULL, 0, 2610, 0, 2209, NULL, 1, '2017-08-31', NULL),
(557, 49, 198, 5, 7, 0, 20020.1, 0, NULL, 0, 2610, 0, 1161.33, NULL, 3, '2017-08-31', NULL),
(558, 50, 198, 5, 7, 1511, 239702, 0, NULL, 0, 2610, 0, 1161.33, NULL, 1, '2017-08-31', NULL),
(559, 51, 198, 5, 7, 957, 1914, 0, NULL, 0, 2610, 0, 1161.33, NULL, 1, '2017-08-31', NULL),
(560, 52, 198, 5, 7, 1401, 250475, 0, NULL, 0, 2610, 0, 1161.33, NULL, 1, '2017-08-31', NULL),
(561, 53, 198, 5, 7, 957, 1914, 0, NULL, 0, 2610, 0, 1161.33, NULL, 1, '2017-08-31', NULL),
(562, 54, 198, 5, 7, 1371, 72387.6, 0, NULL, 0, 2610, 0, 1161.33, NULL, 1, '2017-08-31', NULL),
(563, 54, 199, 5, 7, 0, 76113.9, 0, NULL, 0, 2610, 0, 3726.3, NULL, 3, '2017-08-31', NULL),
(564, 55, 199, 5, 7, 1200, 106917, 0, NULL, 0, 2610, 0, 3726.3, NULL, 1, '2017-08-31', NULL),
(565, 56, 199, 5, 7, 1472, 5069, 0, NULL, 0, 2610, 0, 3726.3, NULL, 1, '2017-08-31', NULL),
(566, 56, 200, 5, 7, 0, 7194, 0, NULL, 0, 2610, 0, 2125, NULL, 3, '2017-08-31', NULL),
(567, 57, 200, 5, 7, 1401, 124162, 0, NULL, 0, 2610, 0, 2125, NULL, 1, '2017-08-31', NULL),
(568, 57, 201, 5, 7, 0, 125736, 0, NULL, 0, 2610, 0, 1574.5, NULL, 3, '2017-08-31', NULL),
(569, 58, 201, 5, 7, 1260, 3716, 0, NULL, 0, 2610, 0, 1574.5, NULL, 1, '2017-08-31', NULL),
(570, 58, 202, 5, 7, 0, 4912, 0, NULL, 0, 2610, 0, 1196, NULL, 3, '2017-08-31', NULL),
(571, 59, 202, 5, 7, 985, 11791, 0, NULL, 0, 2610, 0, 1196, NULL, 1, '2017-08-31', NULL),
(572, 60, 202, 5, 7, 1260, 100326, 0, NULL, 0, 2610, 0, 1196, NULL, 1, '2017-08-31', NULL),
(573, 60, 203, 5, 7, 0, 100788, 0, NULL, 0, 2610, 0, 462, NULL, 3, '2017-08-31', NULL),
(574, 61, 203, 5, 7, 1472, 152937, 0, NULL, 0, 2610, 0, 462, NULL, 1, '2017-08-31', NULL),
(575, 61, 204, 5, 7, 0, 156062, 0, NULL, 0, 2610, 0, 3125, NULL, 3, '2017-08-31', NULL),
(576, 62, 204, 5, 7, 1260, 96055.3, 0, NULL, 0, 2610, 0, 3125, NULL, 1, '2017-08-31', NULL),
(577, 63, 204, 5, 7, 1472, 122923, 0, NULL, 0, 2610, 0, 3125, NULL, 1, '2017-08-31', NULL),
(578, 63, 205, 5, 7, 0, 124511, 0, NULL, 0, 2610, 0, 1588.07, NULL, 3, '2017-08-31', NULL),
(579, 64, 205, 5, 7, 1334, 2668, 0, NULL, 0, 2610, 0, 1588.07, NULL, 1, '2017-08-31', NULL),
(580, 67, 205, 5, 7, 1242, 150482, 0, NULL, 0, 2610, 0, 1588.07, NULL, 1, '2017-08-31', NULL),
(581, 68, 205, 5, 7, 1401, 6469, 0, NULL, 0, 2610, 0, 1588.07, NULL, 1, '2017-08-31', NULL),
(582, 68, 206, 5, 7, 0, 10136, 0, NULL, 0, 3667, 0, 0, NULL, 2, '2017-08-31', NULL),
(583, 69, 206, 5, 7, 1472, 260479, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-31', NULL),
(584, 70, 206, 5, 7, 1401, 177581, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-31', NULL),
(585, 71, 206, 5, 7, 1472, 281408, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-31', NULL),
(586, 72, 206, 5, 7, 1472, 2944, 0, NULL, 0, 3667, 0, 0, NULL, 1, '2017-08-31', NULL),
(587, 72, 206, 5, 7, 0, 2944, 0, NULL, 0, 0, 583.33, 0, NULL, 4, '2017-08-31', NULL),
(588, 73, 206, 5, 7, 1260, 48188.5, 0, NULL, 0, 0, 583.33, 0, NULL, 1, '2017-08-31', NULL),
(589, 74, 206, 5, 7, 1260, 105958, 0, NULL, 0, 0, 583.33, 0, NULL, 1, '2017-08-31', NULL),
(590, 74, 206, 5, 7, 0, 105958, 0, NULL, 0, 0, 1895.83, 0, NULL, 4, '2017-08-31', NULL),
(591, 75, 206, 5, 7, 1472, 164836, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(592, 76, 206, 5, 7, 1472, 2944, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(593, 77, 206, 5, 7, 1401, 2802, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(594, 78, 206, 5, 7, 1401, 153003, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(595, 79, 206, 5, 7, 1200, 102057, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(596, 80, 206, 5, 7, 1472, 181730, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(597, 81, 206, 5, 7, 1401, 83252.3, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(598, 82, 206, 5, 7, 1472, 2944, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(599, 83, 206, 5, 7, 1472, 132515, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(600, 84, 206, 5, 7, 1472, 269784, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(601, 85, 206, 5, 7, 1401, 2802, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(602, 86, 206, 5, 7, 1401, 49273, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(603, 87, 206, 5, 7, 1472, 112243, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(604, 88, 206, 5, 7, 1401, 2802, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(605, 89, 206, 5, 7, 1401, 2802, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(606, 89, 206, 5, 7, 0, 2802, 0, NULL, 0, 0, 1000, 0, NULL, 4, '2017-08-31', NULL),
(607, 90, 206, 5, 7, 1334, 108123, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(608, 91, 206, 5, 7, 1334, 2668, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(609, 92, 206, 5, 7, 1305, 2610, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(610, 93, 206, 5, 7, 1472, 2944, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(611, 94, 206, 5, 7, 1472, 181036, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL);
INSERT INTO `gpf_subscriptions_06_09_2017` (`id`, `employee_id`, `employee_loan_id`, `fiscal_year_id`, `month_id`, `subscription_recovery`, `total_subscription_balance`, `subscription_interest`, `current_balance_date`, `loan_amount`, `loan_recovery`, `loan_interest_amount`, `loan_interest_recovery`, `loan_date`, `sub_status`, `created_at`, `updated_at`) VALUES
(612, 95, 206, 5, 7, 1005, 2010, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(613, 96, 206, 5, 7, 957, 11418.2, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(614, 97, 206, 5, 7, 1401, 268002, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(615, 98, 206, 5, 7, 275.5, 551, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(616, 99, 206, 5, 7, 1410, 2820, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(617, 100, 206, 5, 7, 1401, 2802, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(618, 101, 206, 5, 7, 1401, 290196, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(619, 102, 206, 5, 7, 2487, 285878, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(620, 103, 206, 5, 7, 1668, 299090, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(621, 105, 206, 5, 7, 1846, 106057, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(622, 106, 206, 5, 7, 1846, 287514, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(623, 107, 206, 5, 7, 2000, 258369, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(624, 108, 206, 5, 7, 1370, 127079, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(625, 109, 206, 5, 7, 1370, 75635.1, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(626, 110, 206, 5, 7, 3425, 186073, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(627, 111, 206, 5, 7, 1260, 2520, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(628, 112, 206, 5, 7, 1401, 63478.2, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(629, 113, 206, 5, 7, 957, 11418.2, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(630, 114, 206, 5, 7, 5262.5, 10525, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(631, 115, 206, 5, 7, 2042, 148453, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(632, 116, 206, 5, 7, 1796, 443705, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(633, 117, 206, 5, 7, 1500, 536313, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(634, 118, 206, 5, 7, 1840, 392990, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(635, 119, 206, 5, 7, 2000, 374259, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(636, 120, 206, 5, 7, 1796, 317262, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(637, 121, 206, 5, 7, 1512, 144047, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(638, 122, 206, 5, 7, 1668, 3336, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(639, 123, 206, 5, 7, 1668, 279142, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(640, 124, 206, 5, 7, 1710, 217820, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(641, 125, 206, 5, 7, 1588, 265391, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(642, 126, 206, 5, 7, 1668, 175565, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(643, 127, 206, 5, 7, 1511, 299848, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(644, 128, 206, 5, 7, 1511, 192970, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(645, 129, 206, 5, 7, 1370, 2740, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(646, 130, 206, 5, 7, 1401, 71249.7, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(647, 131, 206, 5, 7, 1200, 107244, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(648, 132, 206, 5, 7, 957, 11418.2, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(649, 133, 206, 5, 7, 1546, 3092, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(650, 134, 206, 5, 7, 1260, 2520, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(651, 135, 206, 5, 7, 1472, 120103, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(652, 136, 206, 5, 7, 1472, 2944, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(653, 138, 206, 5, 7, 1401, 2802, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(654, 139, 206, 5, 7, 1401, 136023, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(655, 140, 206, 5, 7, 1334, 110300, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(656, 141, 206, 5, 7, 1323, 55973.8, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(657, 142, 206, 5, 7, 1334, 2668, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(658, 143, 206, 5, 7, 2042, 278703, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(659, 144, 206, 5, 7, 1846, 61634, 0, NULL, 0, 0, 1000, 0, NULL, 1, '2017-08-31', NULL),
(660, 144, 156, 5, 7, 0, 63784, 0, NULL, 0, 2150, 0, 0, NULL, 2, '2017-08-31', NULL),
(661, 145, 156, 5, 7, 1939, 184686, 0, NULL, 0, 2150, 0, 0, NULL, 1, '2017-08-31', NULL),
(662, 145, 157, 5, 7, 0, 188499, 0, NULL, 0, 3813, 0, 0, NULL, 2, '2017-08-31', NULL),
(663, 146, 157, 5, 7, 1512, 137599, 0, NULL, 0, 3813, 0, 0, NULL, 1, '2017-08-31', NULL),
(664, 147, 157, 5, 7, 1370, 129846, 0, NULL, 0, 3813, 0, 0, NULL, 1, '2017-08-31', NULL),
(665, 148, 157, 5, 7, 1939, 139504, 0, NULL, 0, 3813, 0, 0, NULL, 1, '2017-08-31', NULL),
(666, 148, 171, 5, 7, 0, 141658, 0, NULL, 0, 2154, 0, 0, NULL, 2, '2017-08-31', NULL),
(667, 149, 171, 5, 7, 1370, 125807, 0, NULL, 0, 2154, 0, 0, NULL, 1, '2017-08-31', NULL),
(668, 150, 171, 5, 7, 1401, 230346, 0, NULL, 0, 2154, 0, 0, NULL, 1, '2017-08-31', NULL),
(669, 151, 171, 5, 7, 1401, 190979, 0, NULL, 0, 2154, 0, 0, NULL, 1, '2017-08-31', NULL),
(670, 151, 187, 5, 7, 0, 192678, 0, NULL, 0, 1699, 0, 0, NULL, 2, '2017-08-31', NULL),
(671, 152, 187, 5, 7, 957, 11418.2, 0, NULL, 0, 1699, 0, 0, NULL, 1, '2017-08-31', NULL),
(672, 153, 187, 5, 7, 1939, 317866, 0, NULL, 0, 1699, 0, 0, NULL, 1, '2017-08-31', NULL),
(673, 154, 187, 5, 7, 3000, 472966, 0, NULL, 0, 1699, 0, 0, NULL, 1, '2017-08-31', NULL),
(674, 155, 187, 5, 7, 1401, 101759, 0, NULL, 0, 1699, 0, 0, NULL, 1, '2017-08-31', NULL),
(675, 155, 188, 5, 7, 0, 104391, 0, NULL, 0, 2632, 0, 0, NULL, 2, '2017-08-31', NULL),
(676, 156, 188, 5, 7, 1500, 395116, 0, NULL, 0, 2632, 0, 0, NULL, 1, '2017-08-31', NULL),
(677, 157, 188, 5, 7, 1758, 418004, 0, NULL, 0, 2632, 0, 0, NULL, 1, '2017-08-31', NULL),
(678, 158, 188, 5, 7, 1628, 390572, 0, NULL, 0, 2632, 0, 0, NULL, 1, '2017-08-31', NULL),
(679, 158, 188, 5, 7, 0, 390572, 0, NULL, 0, 0, 5287.13, 0, NULL, 4, '2017-08-31', NULL),
(680, 159, 188, 5, 7, 1796, 300383, 0, NULL, 0, 0, 5287.13, 0, NULL, 1, '2017-08-31', NULL),
(681, 160, 188, 5, 7, 1796, 114515, 0, NULL, 0, 0, 5287.13, 0, NULL, 1, '2017-08-31', NULL),
(682, 160, 158, 5, 7, 0, 118619, 0, NULL, 0, 4104, 0, 0, NULL, 2, '2017-08-31', NULL),
(683, 161, 158, 5, 7, 1796, 135314, 0, NULL, 0, 4104, 0, 0, NULL, 1, '2017-08-31', NULL),
(684, 161, 190, 5, 7, 0, 139272, 0, NULL, 0, 3958, 0, 0, NULL, 2, '2017-08-31', NULL),
(685, 162, 190, 5, 7, 1440, 117143, 0, NULL, 0, 3958, 0, 0, NULL, 1, '2017-08-31', NULL),
(686, 163, 190, 5, 7, 1439, 136376, 0, NULL, 0, 3958, 0, 0, NULL, 1, '2017-08-31', NULL),
(687, 164, 190, 5, 7, 1401, 269379, 0, NULL, 0, 3958, 0, 0, NULL, 1, '2017-08-31', NULL),
(688, 165, 190, 5, 7, 1200, 110000, 0, NULL, 0, 3958, 0, 0, NULL, 1, '2017-08-31', NULL),
(689, 166, 190, 5, 7, 1260, 67493.5, 0, NULL, 0, 3958, 0, 0, NULL, 1, '2017-08-31', NULL),
(690, 166, 191, 5, 7, 0, 68843.5, 0, NULL, 0, 1350, 0, 0, NULL, 2, '2017-08-31', NULL),
(691, 167, 191, 5, 7, 2042, 369559, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-31', NULL),
(692, 168, 191, 5, 7, 1939, 458283, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-31', NULL),
(693, 169, 191, 5, 7, 1846, 124239, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-31', NULL),
(694, 170, 191, 5, 7, 1846, 346420, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-31', NULL),
(695, 171, 191, 5, 7, 1304, 190587, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-31', NULL),
(696, 172, 191, 5, 7, 1312, 111561, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-31', NULL),
(697, 173, 191, 5, 7, 1511, 139205, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-31', NULL),
(698, 174, 191, 5, 7, 1378, 120686, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-31', NULL),
(699, 175, 191, 5, 7, 1312, 96121, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-31', NULL),
(700, 176, 191, 5, 7, 1078, 12526.8, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-31', NULL),
(701, 177, 191, 5, 7, 1078, 12996.8, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-31', NULL),
(702, 178, 191, 5, 7, 1401, 159649, 0, NULL, 0, 1350, 0, 0, NULL, 1, '2017-08-31', NULL),
(703, 178, 192, 5, 7, 0, 163045, 0, NULL, 0, 3396, 0, 0, NULL, 2, '2017-08-31', NULL),
(704, 179, 192, 5, 7, 1401, 118102, 0, NULL, 0, 3396, 0, 0, NULL, 1, '2017-08-31', NULL),
(705, 179, 193, 5, 7, 0, 120686, 0, NULL, 0, 2584, 0, 0, NULL, 2, '2017-08-31', NULL),
(706, 180, 193, 5, 7, 2368, 111370, 0, NULL, 0, 2584, 0, 0, NULL, 1, '2017-08-31', NULL),
(707, 180, 159, 5, 7, 0, 116885, 0, NULL, 0, 5515, 0, 0, NULL, 2, '2017-08-31', NULL),
(708, 182, 159, 5, 7, 3502.5, 126702, 0, NULL, 0, 5515, 0, 0, NULL, 1, '2017-08-31', NULL),
(709, 183, 159, 5, 7, 2676, 114699, 0, NULL, 0, 5515, 0, 0, NULL, 1, '2017-08-31', NULL),
(710, 183, 194, 5, 7, 0, 116874, 0, NULL, 0, 2175, 0, 0, NULL, 2, '2017-08-31', NULL),
(711, 184, 194, 5, 7, 1043, 12496.9, 0, NULL, 0, 2175, 0, 0, NULL, 1, '2017-08-31', NULL),
(712, 185, 194, 5, 7, 1370, 68753.7, 0, NULL, 0, 2175, 0, 0, NULL, 1, '2017-08-31', NULL),
(713, 185, 195, 5, 7, 0, 69778.7, 0, NULL, 0, 1025, 0, 0, NULL, 2, '2017-08-31', NULL),
(714, 186, 195, 5, 7, 1401, 90752.9, 0, NULL, 0, 1025, 0, 0, NULL, 1, '2017-08-31', NULL),
(715, 186, 160, 5, 7, 0, 93648.9, 0, NULL, 0, 2896, 0, 0, NULL, 2, '2017-08-31', NULL),
(716, 187, 160, 5, 7, 2612, 483661, 0, NULL, 0, 2896, 0, 0, NULL, 1, '2017-08-31', NULL),
(717, 187, 196, 5, 7, 0, 487058, 0, NULL, 0, 3397, 0, 0, NULL, 2, '2017-08-31', NULL),
(718, 188, 196, 5, 7, 1401, 78714.4, 0, NULL, 0, 3397, 0, 0, NULL, 1, '2017-08-31', NULL),
(719, 188, 161, 5, 7, 0, 81593.4, 0, NULL, 0, 2879, 0, 0, NULL, 2, '2017-08-31', NULL),
(720, 189, 161, 5, 7, 2000, 191577, 0, NULL, 0, 2879, 0, 0, NULL, 1, '2017-08-31', NULL),
(721, 189, 189, 5, 7, 0, 195682, 0, NULL, 0, 4105, 0, 0, NULL, 2, '2017-08-31', NULL),
(722, 190, 189, 5, 7, 1078, 12996.8, 0, NULL, 0, 4105, 0, 0, NULL, 1, '2017-08-31', NULL),
(723, 191, 189, 5, 7, 2042, 230144, 0, NULL, 0, 4105, 0, 0, NULL, 1, '2017-08-31', NULL),
(724, 191, 162, 5, 7, 0, 231394, 0, NULL, 0, 1250, 0, 0, NULL, 2, '2017-08-31', NULL),
(725, 192, 162, 5, 7, 1305, 107463, 0, NULL, 0, 1250, 0, 0, NULL, 1, '2017-08-31', NULL),
(726, 193, 162, 5, 7, 1710, 141545, 0, NULL, 0, 1250, 0, 0, NULL, 1, '2017-08-31', NULL),
(727, 194, 162, 5, 7, 1370, 59931, 0, NULL, 0, 1250, 0, 0, NULL, 1, '2017-08-31', NULL),
(728, 195, 162, 5, 7, 1512, 53537.1, 0, NULL, 0, 1250, 0, 0, NULL, 1, '2017-08-31', NULL),
(729, 196, 162, 5, 7, 1440, 115175, 0, NULL, 0, 1250, 0, 0, NULL, 1, '2017-08-31', NULL),
(730, 197, 162, 5, 7, 1241, 58860.3, 0, NULL, 0, 1250, 0, 0, NULL, 1, '2017-08-31', NULL),
(731, 198, 162, 5, 7, 1511, 40375.4, 0, NULL, 0, 1250, 0, 0, NULL, 1, '2017-08-31', NULL),
(732, 198, 163, 5, 7, 0, 41812.4, 0, NULL, 0, 1437, 0, 0, NULL, 2, '2017-08-31', NULL),
(733, 199, 163, 5, 7, 1312, 82944.9, 0, NULL, 0, 1437, 0, 0, NULL, 1, '2017-08-31', NULL),
(734, 200, 163, 5, 7, 1511, 997826, 0, NULL, 0, 1437, 0, 0, NULL, 1, '2017-08-31', NULL),
(735, 201, 163, 5, 7, 1370, 85322, 0, NULL, 0, 1437, 0, 0, NULL, 1, '2017-08-31', NULL),
(736, 202, 163, 5, 7, 1132, 13410.8, 0, NULL, 0, 1437, 0, 0, NULL, 1, '2017-08-31', NULL),
(737, 203, 163, 5, 7, 1370, 73219.3, 0, NULL, 0, 1437, 0, 0, NULL, 1, '2017-08-31', NULL),
(738, 203, 164, 5, 7, 0, 73969.3, 0, NULL, 0, 750, 0, 0, NULL, 2, '2017-08-31', NULL),
(739, 204, 164, 5, 7, 1511, 47302, 0, NULL, 0, 750, 0, 0, NULL, 1, '2017-08-31', NULL),
(740, 204, 165, 5, 7, 0, 49957, 0, NULL, 0, 2655, 0, 0, NULL, 2, '2017-08-31', NULL),
(741, 205, 165, 5, 7, 1511, 220852, 0, NULL, 0, 2655, 0, 0, NULL, 1, '2017-08-31', NULL),
(742, 205, 167, 5, 7, 0, 221686, 0, NULL, 0, 834, 0, 0, NULL, 2, '2017-08-31', NULL),
(743, 206, 167, 5, 7, 1439, 282889, 0, NULL, 0, 834, 0, 0, NULL, 1, '2017-08-31', NULL),
(744, 206, 167, 5, 7, 0, 282889, 0, NULL, 0, 0, 1895.83, 0, NULL, 4, '2017-08-31', NULL),
(745, 207, 167, 5, 7, 1587, 251273, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(746, 208, 167, 5, 7, 1447, 160985, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(747, 209, 167, 5, 7, 1447, 236486, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(748, 210, 167, 5, 7, 1401, 217249, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(749, 211, 167, 5, 7, 1242, 101712, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(750, 212, 167, 5, 7, 2484, 157338, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(751, 213, 167, 5, 7, 1209, 100883, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(752, 213, 167, 5, 7, 0, 100883, 0, NULL, 0, 0, 1895.83, 0, NULL, 4, '2017-08-31', NULL),
(753, 214, 167, 5, 7, 1401, 168283, 0, NULL, 0, 0, 1895.83, 0, NULL, 1, '2017-08-31', NULL),
(754, 214, 169, 5, 7, 0, 170549, 0, NULL, 0, 2266, 0, 0, NULL, 2, '2017-08-31', NULL),
(755, 215, 169, 5, 7, 1401, 2802, 0, NULL, 0, 2266, 0, 0, NULL, 1, '2017-08-31', NULL),
(756, 66, 169, 5, 7, 1260, 2520, 0, NULL, 0, 2266, 0, 0, NULL, 1, '2017-08-31', NULL),
(757, 104, 169, 5, 7, 2000, 256209, 0, NULL, 0, 2266, 0, 0, NULL, 1, '2017-08-31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `head_wise_account_balance`
--

CREATE TABLE `head_wise_account_balance` (
  `id` int(11) NOT NULL,
  `daily_transaction_id` int(11) NOT NULL,
  `acc_head_list_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `transaction_amount` decimal(12,2) NOT NULL,
  `flag` enum('Addition','Subtraction','Depreciation') NOT NULL,
  `head_balance` decimal(12,2) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `head_wise_account_balance`
--

INSERT INTO `head_wise_account_balance` (`id`, `daily_transaction_id`, `acc_head_list_id`, `parent_id`, `transaction_amount`, `flag`, `head_balance`, `created_at`, `updated_at`) VALUES
(1, 1, 38, 31, '6565.00', 'Subtraction', '6565.00', '2017-11-21', NULL);

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
(1, 'Active'),
(2, 'Suspended'),
(3, 'Retired'),
(4, 'Death'),
(5, 'PRL'),
(6, 'Inactive');

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
(1, 'Private'),
(2, 'Housing');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `loan_type_id` int(11) NOT NULL,
  `highest_limit` int(11) NOT NULL,
  `loan_limit_currency` tinyint(4) NOT NULL,
  `applicable_for` tinyint(4) NOT NULL,
  `allow_multiple_time` tinyint(4) NOT NULL,
  `highest_installment_qty` int(11) NOT NULL,
  `lowest_installment_qty` int(11) NOT NULL,
  `recovery_policy` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `name`, `loan_type_id`, `highest_limit`, `loan_limit_currency`, `applicable_for`, `allow_multiple_time`, `highest_installment_qty`, `lowest_installment_qty`, `recovery_policy`, `status`) VALUES
(4, 'Home loan', 7, 120000, 0, 0, 0, 80, 5, 1, 0),
(5, 'Computer Loan', 7, 50000, 0, 0, 0, 50, 20, 0, 0),
(6, 'GPF loan', 8, 75, 1, 0, 1, 50, 20, 0, 0),
(7, 'Home Repair Loan', 7, 60000, 0, 0, 0, 50, 20, 0, 0),
(8, 'Motor Cycle Loan', 7, 35000, 0, 0, 0, 50, 10, 0, 0),
(9, 'Car Loan', 7, 100000, 0, 1, 0, 50, 10, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `loan_recoveries`
--

CREATE TABLE `loan_recoveries` (
  `id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `employee_loan_id` int(5) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `recovery_loan_amount` double(10,2) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loan_recoveries`
--

INSERT INTO `loan_recoveries` (`id`, `month_id`, `fiscal_year_id`, `employee_loan_id`, `loan_id`, `employee_id`, `recovery_loan_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 3, 4, 3, 1000.00, '2017-10-04', NULL),
(2, 1, 2, 4, 4, 4, 1000.00, '2017-10-04', NULL),
(3, 1, 2, 154, 6, 5, 4167.00, '2017-10-04', NULL),
(4, 1, 2, 5, 4, 6, 1000.00, '2017-10-04', NULL),
(5, 1, 2, 70, 8, 10, 730.00, '2017-10-04', NULL),
(6, 1, 2, 135, 5, 10, 1000.00, '2017-10-04', NULL),
(7, 1, 2, 155, 6, 10, 4084.00, '2017-10-04', NULL),
(8, 1, 2, 166, 6, 12, 3542.00, '2017-10-04', NULL),
(9, 1, 2, 137, 5, 20, 1000.00, '2017-10-04', NULL),
(10, 1, 2, 217, 6, 20, 5188.00, '2017-10-04', NULL),
(11, 1, 2, 138, 5, 22, 1000.00, '2017-10-04', NULL),
(12, 1, 2, 275, 6, 22, 7635.00, '2017-10-04', NULL),
(13, 1, 2, 139, 5, 23, 1000.00, '2017-10-04', NULL),
(14, 1, 2, 219, 6, 23, 1500.00, '2017-10-04', NULL),
(15, 1, 2, 6, 4, 24, 1000.00, '2017-10-04', NULL),
(16, 1, 2, 220, 6, 24, 7230.00, '2017-10-04', NULL),
(17, 1, 2, 7, 4, 25, 1000.00, '2017-10-04', NULL),
(18, 1, 2, 221, 6, 25, 5891.00, '2017-10-04', NULL),
(19, 1, 2, 8, 4, 26, 1000.00, '2017-10-04', NULL),
(20, 1, 2, 222, 6, 26, 2500.00, '2017-10-04', NULL),
(21, 1, 2, 9, 4, 29, 1000.00, '2017-10-04', NULL),
(22, 1, 2, 141, 5, 29, 1000.00, '2017-10-04', NULL),
(23, 1, 2, 223, 6, 29, 3438.00, '2017-10-04', NULL),
(24, 1, 2, 142, 5, 30, 1000.00, '2017-10-04', NULL),
(25, 1, 2, 224, 6, 32, 5025.00, '2017-10-04', NULL),
(26, 1, 2, 12, 4, 34, 1000.00, '2017-10-04', NULL),
(27, 1, 2, 178, 4, 35, 1000.00, '2017-10-04', NULL),
(28, 1, 2, 225, 6, 35, 1708.00, '2017-10-04', NULL),
(29, 1, 2, 14, 4, 36, 725.50, '2017-10-04', NULL),
(30, 1, 2, 292, 6, 36, 4197.00, '2017-10-04', NULL),
(31, 1, 2, 293, 6, 36, 1833.00, '2017-10-04', NULL),
(32, 1, 2, 180, 6, 37, 3932.00, '2017-10-04', NULL),
(33, 1, 2, 72, 8, 38, 730.00, '2017-10-04', NULL),
(34, 1, 2, 228, 6, 38, 1534.00, '2017-10-04', NULL),
(35, 1, 2, 74, 8, 39, 730.00, '2017-10-04', NULL),
(36, 1, 2, 15, 4, 40, 693.00, '2017-10-04', NULL),
(37, 1, 2, 229, 6, 40, 2730.00, '2017-10-04', NULL),
(38, 1, 2, 16, 4, 41, 1000.00, '2017-10-04', NULL),
(39, 1, 2, 230, 6, 41, 2610.00, '2017-10-04', NULL),
(40, 1, 2, 76, 8, 42, 730.00, '2017-10-04', NULL),
(41, 1, 2, 231, 6, 42, 2516.00, '2017-10-04', NULL),
(42, 1, 2, 186, 6, 43, 1375.00, '2017-10-04', NULL),
(43, 1, 2, 276, 8, 43, 730.00, '2017-10-04', NULL),
(44, 1, 2, 82, 8, 45, 730.00, '2017-10-04', NULL),
(45, 1, 2, 17, 4, 46, 465.00, '2017-10-04', NULL),
(46, 1, 2, 18, 4, 47, 1000.00, '2017-10-04', NULL),
(47, 1, 2, 282, 6, 47, 2292.00, '2017-10-04', NULL),
(48, 1, 2, 84, 8, 48, 730.00, '2017-10-04', NULL),
(49, 1, 2, 234, 6, 48, 2209.00, '2017-10-04', NULL),
(50, 1, 2, 85, 8, 49, 730.00, '2017-10-04', NULL),
(51, 1, 2, 235, 6, 49, 1417.00, '2017-10-04', NULL),
(52, 1, 2, 212, 4, 52, 558.00, '2017-10-04', NULL),
(53, 1, 2, 19, 7, 54, 1000.00, '2017-10-04', NULL),
(54, 1, 2, 294, 6, 54, 2042.00, '2017-10-04', NULL),
(55, 1, 2, 295, 6, 54, 1583.00, '2017-10-04', NULL),
(56, 1, 2, 296, 6, 54, 1020.00, '2017-10-04', NULL),
(57, 1, 2, 20, 4, 56, 540.00, '2017-10-04', NULL),
(58, 1, 2, 283, 6, 56, 2125.00, '2017-10-04', NULL),
(59, 1, 2, 21, 4, 57, 555.00, '2017-10-04', NULL),
(60, 1, 2, 236, 6, 57, 2813.00, '2017-10-04', NULL),
(61, 1, 2, 88, 8, 58, 730.00, '2017-10-04', NULL),
(62, 1, 2, 237, 6, 58, 1196.00, '2017-10-04', NULL),
(63, 1, 2, 90, 8, 60, 730.00, '2017-10-04', NULL),
(64, 1, 2, 238, 6, 60, 462.00, '2017-10-04', NULL),
(65, 1, 2, 22, 7, 61, 1000.00, '2017-10-04', NULL),
(66, 1, 2, 239, 6, 61, 3125.00, '2017-10-04', NULL),
(67, 1, 2, 93, 8, 62, 730.00, '2017-10-04', NULL),
(68, 1, 2, 23, 7, 63, 1000.00, '2017-10-04', NULL),
(69, 1, 2, 284, 6, 63, 2175.00, '2017-10-04', NULL),
(70, 1, 2, 291, 6, 63, 2741.00, '2017-10-04', NULL),
(71, 1, 2, 24, 4, 64, 510.00, '2017-10-04', NULL),
(72, 1, 2, 241, 6, 64, 1225.00, '2017-10-04', NULL),
(73, 1, 2, 25, 4, 65, 510.00, '2017-10-04', NULL),
(74, 1, 2, 26, 7, 68, 1000.00, '2017-10-04', NULL),
(75, 1, 2, 242, 6, 68, 3667.00, '2017-10-04', NULL),
(76, 1, 2, 27, 4, 69, 1000.00, '2017-10-04', NULL),
(77, 1, 2, 28, 7, 69, 1000.00, '2017-10-04', NULL),
(78, 1, 2, 29, 4, 70, 594.00, '2017-10-04', NULL),
(79, 1, 2, 95, 8, 70, 730.00, '2017-10-04', NULL),
(80, 1, 2, 243, 6, 70, 2175.00, '2017-10-04', NULL),
(81, 1, 2, 213, 4, 71, 594.00, '2017-10-04', NULL),
(82, 1, 2, 97, 8, 72, 730.00, '2017-10-04', NULL),
(83, 1, 2, 100, 8, 73, 730.00, '2017-10-04', NULL),
(84, 1, 2, 244, 6, 73, 1302.00, '2017-10-04', NULL),
(85, 1, 2, 101, 8, 74, 730.00, '2017-10-04', NULL),
(86, 1, 2, 214, 4, 75, 621.00, '2017-10-04', NULL),
(87, 1, 2, 215, 7, 75, 1000.00, '2017-10-04', NULL),
(88, 1, 2, 32, 7, 77, 1000.00, '2017-10-04', NULL),
(89, 1, 2, 33, 7, 78, 1000.00, '2017-10-04', NULL),
(90, 1, 2, 245, 6, 78, 1945.00, '2017-10-04', NULL),
(91, 1, 2, 103, 8, 79, 730.00, '2017-10-04', NULL),
(92, 1, 2, 34, 4, 80, 558.00, '2017-10-04', NULL),
(93, 1, 2, 246, 6, 80, 2500.00, '2017-10-04', NULL),
(94, 1, 2, 35, 4, 81, 594.00, '2017-10-04', NULL),
(95, 1, 2, 297, 6, 81, 1000.00, '2017-10-04', NULL),
(96, 1, 2, 331, 6, 81, 2439.00, '2017-10-04', NULL),
(97, 1, 2, 305, 6, 82, 2292.00, '2017-10-04', NULL),
(98, 1, 2, 36, 7, 83, 1000.00, '2017-10-04', NULL),
(99, 1, 2, 247, 6, 83, 3646.00, '2017-10-04', NULL),
(100, 1, 2, 105, 8, 84, 730.00, '2017-10-04', NULL),
(101, 1, 2, 248, 6, 85, 2181.00, '2017-10-04', NULL),
(102, 1, 2, 37, 4, 86, 576.00, '2017-10-04', NULL),
(103, 1, 2, 249, 6, 86, 2403.00, '2017-10-04', NULL),
(104, 1, 2, 38, 7, 87, 1000.00, '2017-10-04', NULL),
(105, 1, 2, 298, 6, 87, 1847.00, '2017-10-04', NULL),
(106, 1, 2, 299, 6, 87, 1575.00, '2017-10-04', NULL),
(107, 1, 2, 107, 8, 88, 730.00, '2017-10-04', NULL),
(108, 1, 2, 250, 6, 88, 3150.00, '2017-10-04', NULL),
(109, 1, 2, 39, 4, 89, 540.00, '2017-10-04', NULL),
(110, 1, 2, 40, 7, 89, 1000.00, '2017-10-04', NULL),
(111, 1, 2, 108, 8, 89, 730.00, '2017-10-04', NULL),
(112, 1, 2, 41, 4, 90, 450.00, '2017-10-04', NULL),
(113, 1, 2, 42, 4, 91, 495.00, '2017-10-04', NULL),
(114, 1, 2, 251, 6, 93, 3623.00, '2017-10-04', NULL),
(115, 1, 2, 43, 4, 94, 594.00, '2017-10-04', NULL),
(116, 1, 2, 252, 6, 94, 2883.00, '2017-10-04', NULL),
(117, 1, 2, 110, 8, 95, 730.00, '2017-10-04', NULL),
(118, 1, 2, 111, 8, 96, 730.00, '2017-10-04', NULL),
(119, 1, 2, 45, 4, 98, 525.00, '2017-10-04', NULL),
(120, 1, 2, 300, 6, 99, 2355.00, '2017-10-04', NULL),
(121, 1, 2, 46, 7, 100, 2000.00, '2017-10-04', NULL),
(122, 1, 2, 254, 6, 100, 2172.00, '2017-10-04', NULL),
(123, 1, 2, 301, 6, 102, 1000.00, '2017-10-04', NULL),
(124, 1, 2, 47, 4, 103, 697.50, '2017-10-04', NULL),
(125, 1, 2, 48, 7, 103, 1000.00, '2017-10-04', NULL),
(126, 1, 2, 255, 6, 104, 2464.00, '2017-10-04', NULL),
(127, 1, 2, 330, 7, 104, 1000.00, '2017-10-04', NULL),
(128, 1, 2, 113, 8, 105, 730.00, '2017-10-04', NULL),
(129, 1, 2, 115, 8, 106, 730.00, '2017-10-04', NULL),
(130, 1, 2, 118, 8, 108, 730.00, '2017-10-04', NULL),
(131, 1, 2, 303, 6, 109, 1000.00, '2017-10-04', NULL),
(132, 1, 2, 119, 8, 110, 730.00, '2017-10-04', NULL),
(133, 1, 2, 121, 8, 111, 730.00, '2017-10-04', NULL),
(134, 1, 2, 256, 6, 111, 1625.00, '2017-10-04', NULL),
(135, 1, 2, 49, 4, 112, 510.00, '2017-10-04', NULL),
(136, 1, 2, 304, 6, 112, 1780.00, '2017-10-04', NULL),
(137, 1, 2, 328, 6, 112, 1230.00, '2017-10-04', NULL),
(138, 1, 2, 280, 4, 114, 1000.00, '2017-10-04', NULL),
(139, 1, 2, 50, 4, 115, 738.00, '2017-10-04', NULL),
(140, 1, 2, 257, 6, 115, 6528.00, '2017-10-04', NULL),
(141, 1, 2, 51, 4, 117, 1000.00, '2017-10-04', NULL),
(142, 1, 2, 123, 8, 118, 730.00, '2017-10-04', NULL),
(143, 1, 2, 52, 4, 119, 738.00, '2017-10-04', NULL),
(144, 1, 2, 258, 6, 119, 4167.00, '2017-10-04', NULL),
(145, 1, 2, 53, 4, 120, 724.50, '2017-10-04', NULL),
(146, 1, 2, 124, 8, 122, 730.00, '2017-10-04', NULL),
(147, 1, 2, 259, 6, 122, 2084.00, '2017-10-04', NULL),
(148, 1, 2, 54, 4, 125, 346.50, '2017-10-04', NULL),
(149, 1, 2, 55, 4, 126, 879.00, '2017-10-04', NULL),
(150, 1, 2, 260, 6, 126, 4016.00, '2017-10-04', NULL),
(151, 1, 2, 56, 4, 127, 1000.00, '2017-10-04', NULL),
(152, 1, 2, 125, 8, 127, 730.00, '2017-10-04', NULL),
(153, 1, 2, 261, 6, 128, 2671.00, '2017-10-04', NULL),
(154, 1, 2, 277, 8, 130, 730.00, '2017-10-04', NULL),
(155, 1, 2, 126, 8, 131, 730.00, '2017-10-04', NULL),
(156, 1, 2, 57, 4, 133, 510.00, '2017-10-04', NULL),
(157, 1, 2, 127, 8, 134, 730.00, '2017-10-04', NULL),
(158, 1, 2, 262, 6, 134, 1257.00, '2017-10-04', NULL),
(159, 1, 2, 58, 4, 135, 576.00, '2017-10-04', NULL),
(160, 1, 2, 263, 6, 135, 2458.00, '2017-10-04', NULL),
(161, 1, 2, 128, 8, 136, 730.00, '2017-10-04', NULL),
(162, 1, 2, 129, 8, 137, 730.00, '2017-10-04', NULL),
(163, 1, 2, 59, 7, 138, 1000.00, '2017-10-04', NULL),
(164, 1, 2, 264, 6, 138, 3854.00, '2017-10-04', NULL),
(165, 1, 2, 61, 7, 139, 1000.00, '2017-10-04', NULL),
(166, 1, 2, 286, 6, 139, 2500.00, '2017-10-04', NULL),
(167, 1, 2, 287, 6, 139, 2412.00, '2017-10-04', NULL),
(168, 1, 2, 62, 7, 140, 1000.00, '2017-10-04', NULL),
(169, 1, 2, 265, 6, 140, 3878.00, '2017-10-04', NULL),
(170, 1, 2, 130, 8, 141, 730.00, '2017-10-04', NULL),
(171, 1, 2, 289, 6, 141, 2232.00, '2017-10-04', NULL),
(172, 1, 2, 64, 4, 142, 495.00, '2017-10-04', NULL),
(173, 1, 2, 65, 7, 142, 1000.00, '2017-10-04', NULL),
(174, 1, 2, 285, 6, 143, 4775.21, '2017-10-04', NULL),
(175, 1, 2, 69, 4, 144, 1000.00, '2017-10-04', NULL),
(176, 1, 2, 156, 6, 144, 2150.00, '2017-10-04', NULL),
(177, 1, 2, 278, 8, 144, 730.00, '2017-10-04', NULL),
(178, 1, 2, 71, 7, 145, 1000.00, '2017-10-04', NULL),
(179, 1, 2, 157, 6, 145, 3813.00, '2017-10-04', NULL),
(180, 1, 2, 73, 4, 148, 958.50, '2017-10-04', NULL),
(181, 1, 2, 266, 6, 148, 2154.00, '2017-10-04', NULL),
(182, 1, 2, 75, 4, 150, 510.00, '2017-10-04', NULL),
(183, 1, 2, 78, 4, 151, 525.00, '2017-10-04', NULL),
(184, 1, 2, 79, 7, 151, 1000.00, '2017-10-04', NULL),
(185, 1, 2, 267, 6, 151, 1699.00, '2017-10-04', NULL),
(186, 1, 2, 66, 8, 152, 730.00, '2017-10-04', NULL),
(187, 1, 2, 60, 8, 153, 730.00, '2017-10-04', NULL),
(188, 1, 2, 207, 4, 153, 1000.00, '2017-10-04', NULL),
(189, 1, 2, 188, 6, 155, 2632.00, '2017-10-04', NULL),
(190, 1, 2, 208, 7, 155, 1000.00, '2017-10-04', NULL),
(191, 1, 2, 80, 7, 156, 1000.00, '2017-10-04', NULL),
(192, 1, 2, 81, 4, 158, 920.00, '2017-10-04', NULL),
(193, 1, 2, 83, 4, 159, 1000.00, '2017-10-04', NULL),
(194, 1, 2, 86, 4, 160, 752.00, '2017-10-04', NULL),
(195, 1, 2, 158, 6, 160, 4104.00, '2017-10-04', NULL),
(196, 1, 2, 190, 6, 161, 3958.00, '2017-10-04', NULL),
(197, 1, 2, 63, 8, 162, 730.00, '2017-10-04', NULL),
(198, 1, 2, 87, 4, 162, 1000.00, '2017-10-04', NULL),
(199, 1, 2, 89, 4, 164, 1000.00, '2017-10-04', NULL),
(200, 1, 2, 67, 8, 165, 730.00, '2017-10-04', NULL),
(201, 1, 2, 91, 4, 165, 1000.00, '2017-10-04', NULL),
(202, 1, 2, 92, 4, 166, 1000.00, '2017-10-04', NULL),
(203, 1, 2, 191, 6, 166, 1350.00, '2017-10-04', NULL),
(204, 1, 2, 94, 7, 169, 1000.00, '2017-10-04', NULL),
(205, 1, 2, 96, 4, 170, 920.00, '2017-10-04', NULL),
(206, 1, 2, 68, 8, 171, 730.00, '2017-10-04', NULL),
(207, 1, 2, 131, 8, 172, 730.00, '2017-10-04', NULL),
(208, 1, 2, 132, 8, 175, 730.00, '2017-10-04', NULL),
(209, 1, 2, 98, 7, 178, 1000.00, '2017-10-04', NULL),
(210, 1, 2, 192, 6, 178, 3396.00, '2017-10-04', NULL),
(211, 1, 2, 99, 4, 179, 525.00, '2017-10-04', NULL),
(212, 1, 2, 193, 6, 179, 2584.00, '2017-10-04', NULL),
(213, 1, 2, 102, 4, 180, 1000.00, '2017-10-04', NULL),
(214, 1, 2, 159, 6, 180, 5515.00, '2017-10-04', NULL),
(215, 1, 2, 140, 8, 182, 730.00, '2017-10-04', NULL),
(216, 1, 2, 210, 7, 182, 1000.00, '2017-10-04', NULL),
(217, 1, 2, 133, 8, 183, 730.00, '2017-10-04', NULL),
(218, 1, 2, 194, 6, 183, 2175.00, '2017-10-04', NULL),
(219, 1, 2, 136, 8, 185, 730.00, '2017-10-04', NULL),
(220, 1, 2, 195, 6, 185, 1025.00, '2017-10-04', NULL),
(221, 1, 2, 134, 8, 186, 730.00, '2017-10-04', NULL),
(222, 1, 2, 160, 6, 186, 2896.00, '2017-10-04', NULL),
(223, 1, 2, 196, 6, 187, 3397.00, '2017-10-04', NULL),
(224, 1, 2, 106, 4, 188, 555.00, '2017-10-04', NULL),
(225, 1, 2, 161, 6, 188, 2879.00, '2017-10-04', NULL),
(226, 1, 2, 189, 6, 189, 4105.00, '2017-10-04', NULL),
(227, 1, 2, 211, 4, 189, 1000.00, '2017-10-04', NULL),
(228, 1, 2, 112, 4, 191, 813.00, '2017-10-04', NULL),
(229, 1, 2, 162, 6, 191, 1250.00, '2017-10-04', NULL),
(230, 1, 2, 143, 8, 193, 730.00, '2017-10-04', NULL),
(231, 1, 2, 144, 8, 194, 730.00, '2017-10-04', NULL),
(232, 1, 2, 268, 6, 195, 1655.00, '2017-10-04', NULL),
(233, 1, 2, 269, 6, 196, 1449.00, '2017-10-04', NULL),
(234, 1, 2, 270, 6, 197, 730.00, '2017-10-04', NULL),
(235, 1, 2, 114, 4, 198, 1000.00, '2017-10-04', NULL),
(236, 1, 2, 145, 8, 198, 730.00, '2017-10-04', NULL),
(237, 1, 2, 163, 6, 198, 1437.00, '2017-10-04', NULL),
(238, 1, 2, 146, 8, 199, 730.00, '2017-10-04', NULL),
(239, 1, 2, 290, 6, 199, 629.00, '2017-10-04', NULL),
(240, 1, 2, 147, 8, 200, 730.00, '2017-10-04', NULL),
(241, 1, 2, 148, 8, 201, 730.00, '2017-10-04', NULL),
(242, 1, 2, 271, 6, 201, 656.00, '2017-10-04', NULL),
(243, 1, 2, 149, 8, 203, 730.00, '2017-10-04', NULL),
(244, 1, 2, 164, 6, 203, 750.00, '2017-10-04', NULL),
(245, 1, 2, 116, 7, 204, 1000.00, '2017-10-04', NULL),
(246, 1, 2, 165, 6, 204, 2655.00, '2017-10-04', NULL),
(247, 1, 2, 150, 8, 205, 730.00, '2017-10-04', NULL),
(248, 1, 2, 167, 6, 205, 834.00, '2017-10-04', NULL),
(249, 1, 2, 117, 4, 206, 1000.00, '2017-10-04', NULL),
(250, 1, 2, 151, 8, 206, 730.00, '2017-10-04', NULL),
(251, 1, 2, 120, 7, 208, 1000.00, '2017-10-04', NULL),
(252, 1, 2, 272, 6, 208, 3186.00, '2017-10-04', NULL),
(253, 1, 2, 273, 6, 209, 3086.00, '2017-10-04', NULL),
(254, 1, 2, 329, 4, 209, 540.00, '2017-10-04', NULL),
(255, 1, 2, 122, 4, 210, 669.00, '2017-10-04', NULL),
(256, 1, 2, 274, 6, 210, 3000.00, '2017-10-04', NULL),
(257, 1, 2, 152, 8, 212, 730.00, '2017-10-04', NULL),
(258, 1, 2, 153, 8, 213, 730.00, '2017-10-04', NULL),
(259, 1, 2, 169, 6, 214, 2266.00, '2017-10-04', NULL),
(260, 1, 2, 279, 8, 214, 730.00, '2017-10-04', NULL),
(261, 1, 2, 253, 6, 215, 2215.16, '2017-10-04', NULL),
(262, 2, 2, 3, 4, 3, 1000.00, '2017-10-10', NULL),
(263, 2, 2, 4, 4, 4, 1000.00, '2017-10-10', NULL),
(264, 2, 2, 154, 6, 5, 4167.00, '2017-10-10', NULL),
(265, 2, 2, 5, 4, 6, 1000.00, '2017-10-10', NULL),
(266, 2, 2, 70, 8, 10, 730.00, '2017-10-10', NULL),
(267, 2, 2, 135, 5, 10, 1000.00, '2017-10-10', NULL),
(268, 2, 2, 155, 6, 10, 4084.00, '2017-10-10', NULL),
(269, 2, 2, 166, 6, 12, 3542.00, '2017-10-10', NULL),
(270, 2, 2, 137, 5, 20, 1000.00, '2017-10-10', NULL),
(271, 2, 2, 217, 6, 20, 5188.00, '2017-10-10', NULL),
(272, 2, 2, 138, 5, 22, 1000.00, '2017-10-10', NULL),
(273, 2, 2, 275, 6, 22, 7635.00, '2017-10-10', NULL),
(274, 2, 2, 139, 5, 23, 1000.00, '2017-10-10', NULL),
(275, 2, 2, 219, 6, 23, 1500.00, '2017-10-10', NULL),
(276, 2, 2, 6, 4, 24, 1000.00, '2017-10-10', NULL),
(277, 2, 2, 220, 6, 24, 7230.00, '2017-10-10', NULL),
(278, 2, 2, 7, 4, 25, 1000.00, '2017-10-10', NULL),
(279, 2, 2, 221, 6, 25, 5891.00, '2017-10-10', NULL),
(280, 2, 2, 8, 4, 26, 1000.00, '2017-10-10', NULL),
(281, 2, 2, 222, 6, 26, 2500.00, '2017-10-10', NULL),
(282, 2, 2, 9, 4, 29, 1000.00, '2017-10-10', NULL),
(283, 2, 2, 141, 5, 29, 1000.00, '2017-10-10', NULL),
(284, 2, 2, 223, 6, 29, 3438.00, '2017-10-10', NULL),
(285, 2, 2, 142, 5, 30, 1000.00, '2017-10-10', NULL),
(286, 2, 2, 224, 6, 32, 5025.00, '2017-10-10', NULL),
(287, 2, 2, 74, 8, 39, 730.00, '2017-10-10', NULL),
(288, 2, 2, 17, 4, 46, 465.00, '2017-10-10', NULL),
(289, 2, 2, 18, 4, 47, 1000.00, '2017-10-10', NULL),
(290, 2, 2, 282, 6, 47, 2292.00, '2017-10-10', NULL),
(291, 2, 2, 27, 4, 69, 1000.00, '2017-10-10', NULL),
(292, 2, 2, 28, 7, 69, 1000.00, '2017-10-10', NULL),
(293, 2, 2, 107, 8, 88, 730.00, '2017-10-10', NULL),
(294, 2, 2, 250, 6, 88, 3150.00, '2017-10-10', NULL),
(295, 2, 2, 39, 4, 89, 540.00, '2017-10-10', NULL),
(296, 2, 2, 40, 7, 89, 1000.00, '2017-10-10', NULL),
(297, 2, 2, 108, 8, 89, 730.00, '2017-10-10', NULL),
(298, 2, 2, 110, 8, 95, 730.00, '2017-10-10', NULL),
(299, 2, 2, 46, 7, 100, 2000.00, '2017-10-10', NULL),
(300, 2, 2, 254, 6, 100, 2172.00, '2017-10-10', NULL),
(301, 2, 2, 115, 8, 106, 730.00, '2017-10-10', NULL),
(302, 2, 2, 280, 4, 114, 1000.00, '2017-10-10', NULL),
(303, 2, 2, 55, 4, 126, 879.00, '2017-10-10', NULL),
(304, 2, 2, 260, 6, 126, 4016.00, '2017-10-10', NULL),
(305, 2, 2, 59, 7, 138, 1000.00, '2017-10-10', NULL),
(306, 2, 2, 264, 6, 138, 3854.00, '2017-10-10', NULL),
(307, 2, 2, 62, 7, 140, 1000.00, '2017-10-10', NULL),
(308, 2, 2, 265, 6, 140, 3878.00, '2017-10-10', NULL),
(309, 2, 2, 130, 8, 141, 730.00, '2017-10-10', NULL),
(310, 2, 2, 289, 6, 141, 2232.00, '2017-10-10', NULL),
(311, 2, 2, 64, 4, 142, 495.00, '2017-10-10', NULL),
(312, 2, 2, 65, 7, 142, 1000.00, '2017-10-10', NULL),
(313, 2, 2, 69, 4, 144, 1000.00, '2017-10-10', NULL),
(314, 2, 2, 156, 6, 144, 2150.00, '2017-10-10', NULL),
(315, 2, 2, 278, 8, 144, 730.00, '2017-10-10', NULL),
(316, 3, 2, 3, 4, 3, 1000.00, '2017-11-15', NULL),
(317, 3, 2, 4, 4, 4, 1000.00, '2017-11-15', NULL),
(318, 3, 2, 154, 6, 5, 4167.00, '2017-11-15', NULL),
(319, 3, 2, 5, 4, 6, 1000.00, '2017-11-15', NULL),
(320, 3, 2, 70, 8, 10, 730.00, '2017-11-15', NULL),
(321, 3, 2, 135, 5, 10, 1000.00, '2017-11-15', NULL),
(322, 3, 2, 155, 6, 10, 4084.00, '2017-11-15', NULL),
(323, 3, 2, 166, 6, 12, 3542.00, '2017-11-15', NULL),
(324, 3, 2, 137, 5, 20, 1000.00, '2017-11-15', NULL),
(325, 3, 2, 217, 6, 20, 5188.00, '2017-11-15', NULL),
(326, 3, 2, 138, 5, 22, 1000.00, '2017-11-15', NULL),
(327, 3, 2, 275, 6, 22, 7635.00, '2017-11-15', NULL),
(328, 3, 2, 139, 5, 23, 1000.00, '2017-11-15', NULL),
(329, 3, 2, 219, 6, 23, 1500.00, '2017-11-15', NULL),
(330, 3, 2, 6, 4, 24, 1000.00, '2017-11-15', NULL),
(331, 3, 2, 220, 6, 24, 7230.00, '2017-11-15', NULL),
(332, 3, 2, 7, 4, 25, 1000.00, '2017-11-15', NULL),
(333, 3, 2, 221, 6, 25, 5891.00, '2017-11-15', NULL),
(334, 3, 2, 8, 4, 26, 1000.00, '2017-11-15', NULL),
(335, 3, 2, 222, 6, 26, 2500.00, '2017-11-15', NULL),
(336, 3, 2, 9, 4, 29, 1000.00, '2017-11-15', NULL),
(337, 3, 2, 141, 5, 29, 1000.00, '2017-11-15', NULL),
(338, 3, 2, 223, 6, 29, 3438.00, '2017-11-15', NULL),
(339, 3, 2, 142, 5, 30, 1000.00, '2017-11-15', NULL),
(340, 3, 2, 12, 4, 34, 1000.00, '2017-11-15', NULL),
(341, 3, 2, 178, 4, 35, 1000.00, '2017-11-15', NULL),
(342, 3, 2, 225, 6, 35, 1708.00, '2017-11-15', NULL),
(343, 3, 2, 14, 4, 36, 725.50, '2017-11-15', NULL),
(344, 3, 2, 292, 6, 36, 4197.00, '2017-11-15', NULL),
(345, 3, 2, 293, 6, 36, 1833.00, '2017-11-15', NULL),
(346, 3, 2, 180, 6, 37, 3932.00, '2017-11-15', NULL),
(347, 3, 2, 72, 8, 38, 730.00, '2017-11-15', NULL),
(348, 3, 2, 228, 6, 38, 1534.00, '2017-11-15', NULL),
(349, 3, 2, 15, 4, 40, 693.00, '2017-11-15', NULL),
(350, 3, 2, 229, 6, 40, 2730.00, '2017-11-15', NULL),
(351, 3, 2, 16, 4, 41, 1000.00, '2017-11-15', NULL),
(352, 3, 2, 230, 6, 41, 2610.00, '2017-11-15', NULL),
(353, 3, 2, 76, 8, 42, 730.00, '2017-11-15', NULL),
(354, 3, 2, 231, 6, 42, 2516.00, '2017-11-15', NULL),
(355, 3, 2, 186, 6, 43, 1375.00, '2017-11-15', NULL),
(356, 3, 2, 276, 8, 43, 730.00, '2017-11-15', NULL),
(357, 3, 2, 82, 8, 45, 730.00, '2017-11-15', NULL),
(358, 3, 2, 17, 4, 46, 465.00, '2017-11-15', NULL),
(359, 3, 2, 18, 4, 47, 1000.00, '2017-11-15', NULL),
(360, 3, 2, 282, 6, 47, 2292.00, '2017-11-15', NULL),
(361, 3, 2, 84, 8, 48, 730.00, '2017-11-15', NULL),
(362, 3, 2, 234, 6, 48, 2209.00, '2017-11-15', NULL),
(363, 3, 2, 85, 8, 49, 730.00, '2017-11-15', NULL),
(364, 3, 2, 235, 6, 49, 1417.00, '2017-11-15', NULL),
(365, 3, 2, 212, 4, 52, 558.00, '2017-11-15', NULL),
(366, 3, 2, 19, 7, 54, 1000.00, '2017-11-15', NULL),
(367, 3, 2, 294, 6, 54, 2042.00, '2017-11-15', NULL),
(368, 3, 2, 295, 6, 54, 1583.00, '2017-11-15', NULL),
(369, 3, 2, 296, 6, 54, 1020.00, '2017-11-15', NULL),
(370, 3, 2, 20, 4, 56, 540.00, '2017-11-15', NULL),
(371, 3, 2, 283, 6, 56, 2125.00, '2017-11-15', NULL),
(372, 3, 2, 21, 4, 57, 555.00, '2017-11-15', NULL),
(373, 3, 2, 236, 6, 57, 2813.00, '2017-11-15', NULL),
(374, 3, 2, 88, 8, 58, 730.00, '2017-11-15', NULL),
(375, 3, 2, 237, 6, 58, 1196.00, '2017-11-15', NULL),
(376, 3, 2, 90, 8, 60, 730.00, '2017-11-15', NULL),
(377, 3, 2, 238, 6, 60, 462.00, '2017-11-15', NULL),
(378, 3, 2, 22, 7, 61, 1000.00, '2017-11-15', NULL),
(379, 3, 2, 239, 6, 61, 3125.00, '2017-11-15', NULL),
(380, 3, 2, 93, 8, 62, 730.00, '2017-11-15', NULL),
(381, 3, 2, 23, 7, 63, 1000.00, '2017-11-15', NULL),
(382, 3, 2, 284, 6, 63, 2175.00, '2017-11-15', NULL),
(383, 3, 2, 291, 6, 63, 2741.00, '2017-11-15', NULL),
(384, 3, 2, 24, 4, 64, 510.00, '2017-11-15', NULL),
(385, 3, 2, 241, 6, 64, 1225.00, '2017-11-15', NULL),
(386, 3, 2, 25, 4, 65, 510.00, '2017-11-15', NULL),
(387, 3, 2, 26, 7, 68, 1000.00, '2017-11-15', NULL),
(388, 3, 2, 242, 6, 68, 3667.00, '2017-11-15', NULL),
(389, 3, 2, 29, 4, 70, 594.00, '2017-11-15', NULL),
(390, 3, 2, 95, 8, 70, 730.00, '2017-11-15', NULL),
(391, 3, 2, 243, 6, 70, 2175.00, '2017-11-15', NULL),
(392, 3, 2, 213, 4, 71, 594.00, '2017-11-15', NULL),
(393, 3, 2, 100, 8, 73, 730.00, '2017-11-15', NULL),
(394, 3, 2, 244, 6, 73, 1302.00, '2017-11-15', NULL),
(395, 3, 2, 101, 8, 74, 730.00, '2017-11-15', NULL),
(396, 3, 2, 214, 4, 75, 621.00, '2017-11-15', NULL),
(397, 3, 2, 215, 7, 75, 1000.00, '2017-11-15', NULL),
(398, 3, 2, 32, 7, 77, 1000.00, '2017-11-15', NULL),
(399, 3, 2, 33, 7, 78, 1000.00, '2017-11-15', NULL),
(400, 3, 2, 245, 6, 78, 1945.00, '2017-11-15', NULL),
(401, 3, 2, 103, 8, 79, 730.00, '2017-11-15', NULL),
(402, 3, 2, 34, 4, 80, 558.00, '2017-11-15', NULL),
(403, 3, 2, 246, 6, 80, 2500.00, '2017-11-15', NULL),
(404, 3, 2, 35, 4, 81, 594.00, '2017-11-15', NULL),
(405, 3, 2, 297, 6, 81, 1000.00, '2017-11-15', NULL),
(406, 3, 2, 331, 6, 81, 2439.00, '2017-11-15', NULL),
(407, 3, 2, 305, 6, 82, 2292.00, '2017-11-15', NULL),
(408, 3, 2, 36, 7, 83, 1000.00, '2017-11-15', NULL),
(409, 3, 2, 247, 6, 83, 3646.00, '2017-11-15', NULL),
(410, 3, 2, 105, 8, 84, 730.00, '2017-11-15', NULL),
(411, 3, 2, 248, 6, 85, 2181.00, '2017-11-15', NULL),
(412, 3, 2, 37, 4, 86, 576.00, '2017-11-15', NULL),
(413, 3, 2, 249, 6, 86, 2403.00, '2017-11-15', NULL),
(414, 3, 2, 38, 7, 87, 1000.00, '2017-11-15', NULL),
(415, 3, 2, 298, 6, 87, 1847.00, '2017-11-15', NULL),
(416, 3, 2, 299, 6, 87, 1575.00, '2017-11-15', NULL),
(417, 3, 2, 107, 8, 88, 730.00, '2017-11-15', NULL),
(418, 3, 2, 250, 6, 88, 3150.00, '2017-11-15', NULL),
(419, 3, 2, 39, 4, 89, 540.00, '2017-11-15', NULL),
(420, 3, 2, 40, 7, 89, 1000.00, '2017-11-15', NULL),
(421, 3, 2, 108, 8, 89, 730.00, '2017-11-15', NULL),
(422, 3, 2, 41, 4, 90, 450.00, '2017-11-15', NULL),
(423, 3, 2, 42, 4, 91, 495.00, '2017-11-15', NULL),
(424, 3, 2, 251, 6, 93, 3623.00, '2017-11-15', NULL),
(425, 3, 2, 43, 4, 94, 594.00, '2017-11-15', NULL),
(426, 3, 2, 252, 6, 94, 2883.00, '2017-11-15', NULL),
(427, 3, 2, 111, 8, 96, 730.00, '2017-11-15', NULL),
(428, 3, 2, 300, 6, 99, 2355.00, '2017-11-15', NULL),
(429, 3, 2, 46, 7, 100, 2000.00, '2017-11-15', NULL),
(430, 3, 2, 254, 6, 100, 2172.00, '2017-11-15', NULL),
(431, 3, 2, 333, 6, 101, 4311.00, '2017-11-15', NULL),
(432, 3, 2, 301, 6, 102, 1000.00, '2017-11-15', NULL),
(433, 3, 2, 47, 4, 103, 697.50, '2017-11-15', NULL),
(434, 3, 2, 48, 7, 103, 1000.00, '2017-11-15', NULL),
(435, 3, 2, 255, 6, 104, 2464.00, '2017-11-15', NULL),
(436, 3, 2, 330, 7, 104, 1000.00, '2017-11-15', NULL),
(437, 3, 2, 113, 8, 105, 730.00, '2017-11-15', NULL),
(438, 3, 2, 334, 6, 105, 1536.00, '2017-11-15', NULL),
(439, 3, 2, 118, 8, 108, 730.00, '2017-11-15', NULL),
(440, 3, 2, 302, 6, 109, 760.00, '2017-11-15', NULL),
(441, 3, 2, 303, 6, 109, 1000.00, '2017-11-15', NULL),
(442, 3, 2, 119, 8, 110, 730.00, '2017-11-15', NULL),
(443, 3, 2, 121, 8, 111, 730.00, '2017-11-15', NULL),
(444, 3, 2, 256, 6, 111, 1625.00, '2017-11-15', NULL),
(445, 3, 2, 49, 4, 112, 510.00, '2017-11-15', NULL),
(446, 3, 2, 304, 6, 112, 1780.00, '2017-11-15', NULL),
(447, 3, 2, 328, 6, 112, 1230.00, '2017-11-15', NULL),
(448, 3, 2, 280, 4, 114, 1000.00, '2017-11-15', NULL),
(449, 3, 2, 50, 4, 115, 738.00, '2017-11-15', NULL),
(450, 3, 2, 257, 6, 115, 3244.00, '2017-11-15', NULL),
(451, 3, 2, 51, 4, 117, 1000.00, '2017-11-15', NULL),
(452, 3, 2, 123, 8, 118, 730.00, '2017-11-15', NULL),
(453, 3, 2, 52, 4, 119, 738.00, '2017-11-15', NULL),
(454, 3, 2, 258, 6, 119, 4167.00, '2017-11-15', NULL),
(455, 3, 2, 53, 4, 120, 724.50, '2017-11-15', NULL),
(456, 3, 2, 124, 8, 122, 730.00, '2017-11-15', NULL),
(457, 3, 2, 259, 6, 122, 2084.00, '2017-11-15', NULL),
(458, 3, 2, 54, 4, 125, 346.50, '2017-11-15', NULL),
(459, 3, 2, 56, 4, 127, 1000.00, '2017-11-15', NULL),
(460, 3, 2, 125, 8, 127, 730.00, '2017-11-15', NULL),
(461, 3, 2, 261, 6, 128, 2671.00, '2017-11-15', NULL),
(462, 3, 2, 277, 8, 130, 730.00, '2017-11-15', NULL),
(463, 3, 2, 126, 8, 131, 730.00, '2017-11-15', NULL),
(464, 3, 2, 57, 4, 133, 510.00, '2017-11-15', NULL),
(465, 3, 2, 127, 8, 134, 730.00, '2017-11-15', NULL),
(466, 3, 2, 262, 6, 134, 1257.00, '2017-11-15', NULL),
(467, 3, 2, 58, 4, 135, 576.00, '2017-11-15', NULL),
(468, 3, 2, 263, 6, 135, 2458.00, '2017-11-15', NULL),
(469, 3, 2, 128, 8, 136, 730.00, '2017-11-15', NULL),
(470, 3, 2, 61, 7, 139, 1000.00, '2017-11-15', NULL),
(471, 3, 2, 286, 6, 139, 2500.00, '2017-11-15', NULL),
(472, 3, 2, 287, 6, 139, 2412.00, '2017-11-15', NULL),
(473, 3, 2, 285, 6, 143, 4775.21, '2017-11-15', NULL),
(474, 3, 2, 71, 7, 145, 1000.00, '2017-11-15', NULL),
(475, 3, 2, 157, 6, 145, 3813.00, '2017-11-15', NULL),
(476, 3, 2, 335, 6, 145, 2654.00, '2017-11-15', NULL),
(477, 3, 2, 73, 4, 148, 958.50, '2017-11-15', NULL),
(478, 3, 2, 266, 6, 148, 718.00, '2017-11-15', NULL),
(479, 3, 2, 75, 4, 150, 510.00, '2017-11-15', NULL),
(480, 3, 2, 78, 4, 151, 525.00, '2017-11-15', NULL),
(481, 3, 2, 79, 7, 151, 1000.00, '2017-11-15', NULL),
(482, 3, 2, 267, 6, 151, 1699.00, '2017-11-15', NULL),
(483, 3, 2, 66, 8, 152, 730.00, '2017-11-15', NULL),
(484, 3, 2, 60, 8, 153, 730.00, '2017-11-15', NULL),
(485, 3, 2, 207, 4, 153, 1000.00, '2017-11-15', NULL),
(486, 3, 2, 336, 6, 154, 3000.00, '2017-11-15', NULL),
(487, 3, 2, 188, 6, 155, 2632.00, '2017-11-15', NULL),
(488, 3, 2, 208, 7, 155, 1000.00, '2017-11-15', NULL),
(489, 3, 2, 81, 4, 158, 920.00, '2017-11-15', NULL),
(490, 3, 2, 83, 4, 159, 1000.00, '2017-11-15', NULL),
(491, 3, 2, 86, 4, 160, 752.00, '2017-11-15', NULL),
(492, 3, 2, 158, 6, 160, 4104.00, '2017-11-15', NULL),
(493, 3, 2, 190, 6, 161, 3958.00, '2017-11-15', NULL),
(494, 3, 2, 63, 8, 162, 730.00, '2017-11-15', NULL),
(495, 3, 2, 87, 4, 162, 1000.00, '2017-11-15', NULL),
(496, 3, 2, 89, 4, 164, 1000.00, '2017-11-15', NULL),
(497, 3, 2, 67, 8, 165, 730.00, '2017-11-15', NULL),
(498, 3, 2, 91, 4, 165, 1000.00, '2017-11-15', NULL),
(499, 3, 2, 92, 4, 166, 1000.00, '2017-11-15', NULL),
(500, 3, 2, 191, 6, 166, 1350.00, '2017-11-15', NULL),
(501, 3, 2, 337, 6, 166, 1013.00, '2017-11-15', NULL),
(502, 3, 2, 94, 7, 169, 1000.00, '2017-11-15', NULL),
(503, 3, 2, 96, 4, 170, 920.00, '2017-11-15', NULL),
(504, 3, 2, 68, 8, 171, 730.00, '2017-11-15', NULL),
(505, 3, 2, 131, 8, 172, 730.00, '2017-11-15', NULL),
(506, 3, 2, 132, 8, 175, 730.00, '2017-11-15', NULL),
(507, 3, 2, 98, 7, 178, 1000.00, '2017-11-15', NULL),
(508, 3, 2, 192, 6, 178, 3396.00, '2017-11-15', NULL),
(509, 3, 2, 99, 4, 179, 525.00, '2017-11-15', NULL),
(510, 3, 2, 193, 6, 179, 2584.00, '2017-11-15', NULL),
(511, 3, 2, 102, 4, 180, 1000.00, '2017-11-15', NULL),
(512, 3, 2, 159, 6, 180, 5515.00, '2017-11-15', NULL),
(513, 3, 2, 140, 8, 182, 730.00, '2017-11-15', NULL),
(514, 3, 2, 210, 7, 182, 1000.00, '2017-11-15', NULL),
(515, 3, 2, 133, 8, 183, 730.00, '2017-11-15', NULL),
(516, 3, 2, 194, 6, 183, 2175.00, '2017-11-15', NULL),
(517, 3, 2, 136, 8, 185, 730.00, '2017-11-15', NULL),
(518, 3, 2, 195, 6, 185, 1025.00, '2017-11-15', NULL),
(519, 3, 2, 134, 8, 186, 730.00, '2017-11-15', NULL),
(520, 3, 2, 160, 6, 186, 2896.00, '2017-11-15', NULL),
(521, 3, 2, 196, 6, 187, 3397.00, '2017-11-15', NULL),
(522, 3, 2, 338, 6, 187, 7126.00, '2017-11-15', NULL),
(523, 3, 2, 106, 4, 188, 555.00, '2017-11-15', NULL),
(524, 3, 2, 161, 6, 188, 2879.00, '2017-11-15', NULL),
(525, 3, 2, 189, 6, 189, 4105.00, '2017-11-15', NULL),
(526, 3, 2, 211, 4, 189, 1000.00, '2017-11-15', NULL),
(527, 3, 2, 112, 4, 191, 813.00, '2017-11-15', NULL),
(528, 3, 2, 162, 6, 191, 1250.00, '2017-11-15', NULL),
(529, 3, 2, 339, 6, 192, 979.00, '2017-11-15', NULL),
(530, 3, 2, 143, 8, 193, 730.00, '2017-11-15', NULL),
(531, 3, 2, 144, 8, 194, 730.00, '2017-11-15', NULL),
(532, 3, 2, 268, 6, 195, 1655.00, '2017-11-15', NULL),
(533, 3, 2, 269, 6, 196, 1449.00, '2017-11-15', NULL),
(534, 3, 2, 270, 6, 197, 730.00, '2017-11-15', NULL),
(535, 3, 2, 114, 4, 198, 1000.00, '2017-11-15', NULL),
(536, 3, 2, 145, 8, 198, 730.00, '2017-11-15', NULL),
(537, 3, 2, 163, 6, 198, 1437.00, '2017-11-15', NULL),
(538, 3, 2, 146, 8, 199, 730.00, '2017-11-15', NULL),
(539, 3, 2, 290, 6, 199, 629.00, '2017-11-15', NULL),
(540, 3, 2, 147, 8, 200, 730.00, '2017-11-15', NULL),
(541, 3, 2, 148, 8, 201, 730.00, '2017-11-15', NULL),
(542, 3, 2, 271, 6, 201, 656.00, '2017-11-15', NULL),
(543, 3, 2, 149, 8, 203, 730.00, '2017-11-15', NULL),
(544, 3, 2, 164, 6, 203, 750.00, '2017-11-15', NULL),
(545, 3, 2, 116, 7, 204, 1000.00, '2017-11-15', NULL),
(546, 3, 2, 165, 6, 204, 2655.00, '2017-11-15', NULL),
(547, 3, 2, 150, 8, 205, 730.00, '2017-11-15', NULL),
(548, 3, 2, 167, 6, 205, 834.00, '2017-11-15', NULL),
(549, 3, 2, 117, 4, 206, 1000.00, '2017-11-15', NULL),
(550, 3, 2, 151, 8, 206, 730.00, '2017-11-15', NULL),
(551, 3, 2, 120, 7, 208, 1000.00, '2017-11-15', NULL),
(552, 3, 2, 272, 6, 208, 3186.00, '2017-11-15', NULL),
(553, 3, 2, 273, 6, 209, 3086.00, '2017-11-15', NULL),
(554, 3, 2, 329, 4, 209, 540.00, '2017-11-15', NULL),
(555, 3, 2, 122, 4, 210, 669.00, '2017-11-15', NULL),
(556, 3, 2, 274, 6, 210, 3000.00, '2017-11-15', NULL),
(557, 3, 2, 152, 8, 212, 730.00, '2017-11-15', NULL),
(558, 3, 2, 153, 8, 213, 730.00, '2017-11-15', NULL),
(559, 3, 2, 169, 6, 214, 2266.00, '2017-11-15', NULL),
(560, 3, 2, 279, 8, 214, 730.00, '2017-11-15', NULL),
(561, 3, 2, 332, 6, 214, 2449.00, '2017-11-15', NULL),
(562, 3, 2, 253, 6, 215, 2215.16, '2017-11-15', NULL),
(563, 4, 2, 224, 6, 32, 5025.00, '2017-11-19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loan_types`
--

CREATE TABLE `loan_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `interest_rate` float NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loan_types`
--

INSERT INTO `loan_types` (`id`, `name`, `interest_rate`, `status`, `created_date`) VALUES
(7, 'Employee Loan', 10, 0, '2017-07-05'),
(8, 'GPF', 13, 0, '2017-07-08');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('Active','Inactive','','') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `create_date`, `update_date`, `user_id`, `status`) VALUES
(1, 'Dhaka', '2017-07-27 13:23:59', '0000-00-00 00:00:00', 1, 'Active'),
(2, 'Outside Dhaka', '2017-07-27 13:23:59', '0000-00-00 00:00:00', 1, 'Active'),
(3, 'Other', '2017-07-27 13:24:18', '0000-00-00 00:00:00', 1, 'Active');

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
-- Table structure for table `mobile_bill_settings`
--

CREATE TABLE `mobile_bill_settings` (
  `id` int(11) NOT NULL,
  `gazette_year` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `mobile_bill` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mobile_bill_settings`
--

INSERT INTO `mobile_bill_settings` (`id`, `gazette_year`, `grade`, `mobile_bill`, `created_by`, `created_at`, `updated_at`, `status`) VALUES
(1, 2015, 3, 400, 1, '2017-07-29 15:13:39', '0000-00-00 00:00:00', 'Active'),
(2, 2015, 4, 400, 1, '2017-07-29 15:32:24', '2017-07-29 00:00:00', 'Active'),
(3, 2015, 1, 600, 1, '2017-08-05 17:37:41', '0000-00-00 00:00:00', 'Active'),
(4, 2015, 2, 600, 1, '2017-08-05 17:38:28', '0000-00-00 00:00:00', 'Active');

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
  `fiscal_year_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `monthly_attendance_entry_type_id` int(11) NOT NULL,
  `new_basic` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `monthly_attendance_entries`
--

INSERT INTO `monthly_attendance_entries` (`id`, `employee_id`, `official_attendence`, `casual_leave`, `sick_leave`, `earned_leave`, `maternity_leave`, `total_attendance`, `panalty`, `fiscal_year_id`, `month_id`, `monthly_attendance_entry_type_id`, `new_basic`, `created_at`) VALUES
(1, 8, 31, 0, 0, 0, 0, 11, 0, 2, 2, 0, 0.00, '2017-10-02'),
(2, 137, 31, 0, 0, 0, 0, 24, 0, 2, 2, 0, 0.00, '2017-10-02'),
(3, 65, 31, 0, 0, 0, 0, 13, 0, 2, 6, 0, 0.00, '2017-10-02'),
(4, 21, 31, 0, 0, 0, 0, 17, 0, 2, 2, 0, 0.00, '2017-10-03'),
(5, 32, 31, 0, 0, 0, 0, 1, 0, 2, 4, 2, 0.00, '2017-11-19');

-- --------------------------------------------------------

--
-- Table structure for table `monthly_attendance_entry_types`
--

CREATE TABLE `monthly_attendance_entry_types` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `monthly_attendance_entry_types`
--

INSERT INTO `monthly_attendance_entry_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Partial', '2017-10-08', NULL),
(2, 'Suspend', '2017-10-08', NULL),
(3, 'Increment', '2017-10-08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `monthly_others`
--

CREATE TABLE `monthly_others` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `others_type_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `ammount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `monthly_others_enties`
--

CREATE TABLE `monthly_others_enties` (
  `id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `electric_bill` double(8,2) NOT NULL DEFAULT '0.00',
  `telephone_bill` double(8,2) NOT NULL DEFAULT '0.00',
  `rent_a_car_bill` double(8,2) NOT NULL DEFAULT '0.00',
  `others` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `monthly_others_enties`
--

INSERT INTO `monthly_others_enties` (`id`, `designation_id`, `department_id`, `employee_id`, `fiscal_year_id`, `month_id`, `electric_bill`, `telephone_bill`, `rent_a_car_bill`, `others`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 0, 0, 2, 2, 1, 0.00, 0.00, 2095.20, 0.00, '2017-08-30', '0000-00-00', 1),
(3, 0, 0, 3, 2, 1, 0.00, 0.00, 699.20, 0.00, '2017-08-30', '0000-00-00', 1),
(4, 0, 0, 4, 2, 1, 0.00, 0.00, 1400.20, 0.00, '2017-08-30', '0000-00-00', 1),
(5, 0, 0, 5, 2, 1, 0.00, 0.00, 852.80, 0.00, '2017-08-30', '0000-00-00', 1),
(6, 0, 0, 6, 2, 1, 0.00, 0.00, 561.80, 0.00, '2017-08-30', '0000-00-00', 1),
(7, 0, 0, 7, 2, 1, 0.00, 0.00, 40.00, 0.00, '2017-08-30', '0000-00-00', 1),
(8, 0, 0, 10, 2, 1, 0.00, 0.00, 478.20, 0.00, '2017-08-30', '0000-00-00', 1),
(9, 0, 0, 11, 2, 1, 0.00, 0.00, 110.40, 0.00, '2017-08-30', '0000-00-00', 1),
(10, 0, 0, 13, 2, 1, 0.00, 0.00, 98.80, 0.00, '2017-08-30', '0000-00-00', 1),
(11, 0, 0, 14, 2, 1, 0.00, 0.00, 435.00, 0.00, '2017-08-30', '0000-00-00', 1),
(12, 0, 0, 15, 2, 1, 0.00, 0.00, 71.20, 0.00, '2017-08-30', '0000-00-00', 1),
(13, 0, 0, 16, 2, 1, 0.00, 0.00, 52.00, 0.00, '2017-08-30', '0000-00-00', 1),
(14, 0, 0, 17, 2, 1, 0.00, 0.00, 86.40, 0.00, '2017-08-30', '0000-00-00', 1),
(15, 0, 0, 18, 2, 1, 0.00, 0.00, 39.60, 0.00, '2017-08-30', '0000-00-00', 1),
(16, 0, 0, 19, 2, 1, 0.00, 0.00, 25.60, 0.00, '2017-08-30', '0000-00-00', 1),
(17, 0, 0, 20, 2, 1, 0.00, 0.00, 148.80, 0.00, '2017-08-30', '0000-00-00', 1),
(18, 0, 0, 30, 2, 1, 0.00, 0.00, 127.60, 0.00, '2017-08-30', '0000-00-00', 1),
(19, 0, 0, 21, 2, 1, 0.00, 0.00, 0.00, 12275.80, '2017-08-30', '0000-00-00', 1),
(20, 0, 0, 2, 2, 2, 0.00, 0.00, 2316.80, 0.00, '2017-09-20', '0000-00-00', 1),
(21, 0, 0, 3, 2, 2, 0.00, 0.00, 945.60, 0.00, '2017-09-20', '0000-00-00', 1),
(22, 0, 0, 4, 2, 2, 0.00, 0.00, 2165.00, 0.00, '2017-09-20', '0000-00-00', 1),
(23, 0, 0, 5, 2, 2, 0.00, 0.00, 1504.20, 0.00, '2017-09-20', '0000-00-00', 1),
(24, 0, 0, 6, 2, 2, 0.00, 0.00, 744.40, 0.00, '2017-09-20', '0000-00-00', 1),
(25, 0, 0, 7, 2, 2, 0.00, 0.00, 41.60, 0.00, '2017-09-20', '0000-00-00', 1),
(26, 0, 0, 10, 2, 2, 0.00, 0.00, 1605.20, 0.00, '2017-09-20', '0000-00-00', 1),
(27, 0, 0, 11, 2, 2, 0.00, 0.00, 560.40, 0.00, '2017-09-20', '0000-00-00', 1),
(28, 0, 0, 13, 2, 2, 0.00, 0.00, 793.20, 0.00, '2017-09-20', '0000-00-00', 1),
(29, 0, 0, 14, 2, 2, 0.00, 0.00, 179.60, 0.00, '2017-09-20', '0000-00-00', 1),
(30, 0, 0, 15, 2, 2, 0.00, 0.00, 284.80, 0.00, '2017-09-20', '0000-00-00', 1),
(31, 0, 0, 16, 2, 2, 0.00, 0.00, 24.00, 0.00, '2017-09-20', '0000-00-00', 1),
(32, 0, 0, 17, 2, 2, 0.00, 0.00, 80.00, 0.00, '2017-09-20', '0000-00-00', 1),
(33, 0, 0, 18, 2, 2, 0.00, 0.00, 35.20, 0.00, '2017-09-20', '0000-00-00', 1),
(34, 0, 0, 20, 2, 2, 0.00, 0.00, 104.00, 0.00, '2017-09-20', '0000-00-00', 1),
(35, 0, 0, 30, 2, 2, 0.00, 0.00, 220.60, 0.00, '2017-09-20', '0000-00-00', 1),
(36, 0, 0, 2, 2, 3, 0.00, 0.00, 1553.40, 0.00, '2017-09-20', '0000-00-00', 1),
(37, 0, 0, 3, 2, 3, 0.00, 0.00, 147.20, 0.00, '2017-09-20', '0000-00-00', 1),
(38, 0, 0, 4, 2, 3, 0.00, 0.00, 1258.00, 0.00, '2017-09-20', '0000-00-00', 1),
(39, 0, 0, 5, 2, 3, 0.00, 0.00, 1344.20, 0.00, '2017-09-20', '0000-00-00', 1),
(40, 0, 0, 6, 2, 3, 0.00, 0.00, 507.60, 0.00, '2017-09-20', '0000-00-00', 1),
(41, 0, 0, 7, 2, 3, 0.00, 0.00, 59.20, 0.00, '2017-09-20', '0000-00-00', 1),
(42, 0, 0, 10, 2, 3, 0.00, 0.00, 533.00, 0.00, '2017-09-20', '0000-00-00', 1),
(43, 0, 0, 11, 2, 3, 0.00, 0.00, 86.40, 0.00, '2017-09-20', '0000-00-00', 1),
(44, 0, 0, 13, 2, 3, 0.00, 0.00, 64.80, 0.00, '2017-09-20', '0000-00-00', 1),
(45, 0, 0, 14, 2, 3, 0.00, 0.00, 399.80, 0.00, '2017-09-20', '0000-00-00', 1),
(46, 0, 0, 16, 2, 3, 0.00, 0.00, 137.20, 0.00, '2017-09-20', '0000-00-00', 1),
(47, 0, 0, 17, 2, 3, 0.00, 0.00, 73.60, 0.00, '2017-09-20', '0000-00-00', 1),
(48, 0, 0, 18, 2, 3, 0.00, 0.00, 19.20, 0.00, '2017-09-20', '0000-00-00', 1),
(49, 0, 0, 20, 2, 3, 0.00, 0.00, 108.00, 0.00, '2017-09-20', '0000-00-00', 1),
(50, 0, 0, 30, 2, 3, 0.00, 0.00, 167.20, 0.00, '2017-09-20', '0000-00-00', 1),
(51, 0, 0, 2, 2, 4, 0.00, 0.00, 2838.20, 0.00, '2017-09-20', '0000-00-00', 1),
(52, 0, 0, 3, 2, 4, 0.00, 0.00, 1672.20, 0.00, '2017-09-20', '0000-00-00', 1),
(53, 0, 0, 4, 2, 4, 0.00, 0.00, 1422.40, 0.00, '2017-09-20', '0000-00-00', 1),
(54, 0, 0, 5, 2, 4, 0.00, 0.00, 171.60, 0.00, '2017-09-20', '0000-00-00', 1),
(55, 0, 0, 6, 2, 4, 0.00, 0.00, 386.00, 0.00, '2017-09-20', '0000-00-00', 1),
(56, 0, 0, 7, 2, 4, 0.00, 0.00, 20.80, 0.00, '2017-09-20', '0000-00-00', 1),
(57, 0, 0, 10, 2, 4, 0.00, 0.00, 481.60, 0.00, '2017-09-20', '0000-00-00', 1),
(58, 0, 0, 11, 2, 4, 0.00, 0.00, 337.00, 0.00, '2017-09-20', '0000-00-00', 1),
(59, 0, 0, 13, 2, 4, 0.00, 0.00, 44.00, 0.00, '2017-09-20', '0000-00-00', 1),
(60, 0, 0, 14, 2, 4, 0.00, 0.00, 265.20, 0.00, '2017-09-20', '0000-00-00', 1),
(61, 0, 0, 15, 2, 4, 0.00, 0.00, 290.80, 0.00, '2017-09-20', '0000-00-00', 1),
(62, 0, 0, 17, 2, 4, 0.00, 0.00, 35.20, 0.00, '2017-09-20', '0000-00-00', 1),
(63, 0, 0, 30, 2, 4, 0.00, 0.00, 136.40, 0.00, '2017-09-20', '0000-00-00', 1),
(64, 0, 0, 49, 2, 4, 0.00, 0.00, 96.00, 0.00, '2017-09-20', '0000-00-00', 1),
(65, 0, 0, 2, 2, 5, 0.00, 0.00, 1627.20, 0.00, '2017-09-20', '0000-00-00', 1),
(66, 0, 0, 3, 2, 5, 0.00, 0.00, 1811.00, 0.00, '2017-09-20', '0000-00-00', 1),
(67, 0, 0, 4, 2, 5, 0.00, 0.00, 1495.80, 0.00, '2017-09-20', '0000-00-00', 1),
(68, 0, 0, 5, 2, 5, 0.00, 0.00, 1382.60, 0.00, '2017-09-20', '0000-00-00', 1),
(69, 0, 0, 6, 2, 5, 0.00, 0.00, 368.00, 0.00, '2017-09-20', '0000-00-00', 1),
(70, 0, 0, 7, 2, 5, 0.00, 0.00, 56.00, 0.00, '2017-09-20', '0000-00-00', 1),
(71, 0, 0, 10, 2, 5, 0.00, 0.00, 731.80, 0.00, '2017-09-20', '0000-00-00', 1),
(72, 0, 0, 11, 2, 5, 0.00, 0.00, 102.40, 0.00, '2017-09-20', '0000-00-00', 1),
(73, 0, 0, 13, 2, 5, 0.00, 0.00, 557.60, 0.00, '2017-09-20', '0000-00-00', 1),
(74, 0, 0, 14, 2, 5, 0.00, 0.00, 220.60, 0.00, '2017-09-20', '0000-00-00', 1),
(75, 0, 0, 15, 2, 5, 0.00, 0.00, 569.60, 0.00, '2017-09-20', '0000-00-00', 1),
(76, 0, 0, 16, 2, 5, 0.00, 0.00, 31.20, 0.00, '2017-09-20', '0000-00-00', 1),
(77, 0, 0, 17, 2, 5, 0.00, 0.00, 86.40, 0.00, '2017-09-20', '0000-00-00', 1),
(78, 0, 0, 18, 2, 5, 0.00, 0.00, 125.20, 0.00, '2017-09-20', '0000-00-00', 1),
(79, 0, 0, 20, 2, 5, 0.00, 0.00, 116.00, 0.00, '2017-09-20', '0000-00-00', 1),
(80, 0, 0, 23, 2, 5, 0.00, 0.00, 112.00, 0.00, '2017-09-20', '0000-00-00', 1),
(81, 0, 0, 30, 2, 5, 0.00, 0.00, 189.80, 0.00, '2017-09-20', '0000-00-00', 1),
(82, 0, 0, 2, 2, 6, 0.00, 0.00, 1809.40, 0.00, '2017-09-20', '0000-00-00', 1),
(83, 0, 0, 3, 2, 6, 0.00, 0.00, 1153.80, 0.00, '2017-09-20', '0000-00-00', 1),
(84, 0, 0, 4, 2, 6, 0.00, 0.00, 930.00, 0.00, '2017-09-20', '0000-00-00', 1),
(85, 0, 0, 5, 2, 6, 0.00, 0.00, 1438.80, 0.00, '2017-09-20', '0000-00-00', 1),
(86, 0, 0, 6, 2, 6, 0.00, 0.00, 494.80, 0.00, '2017-09-20', '0000-00-00', 1),
(87, 0, 0, 7, 2, 6, 0.00, 0.00, 60.80, 0.00, '2017-09-20', '0000-00-00', 1),
(88, 0, 0, 10, 2, 6, 0.00, 0.00, 686.80, 0.00, '2017-09-20', '0000-00-00', 1),
(89, 0, 0, 11, 2, 6, 0.00, 0.00, 452.60, 0.00, '2017-09-20', '0000-00-00', 1),
(90, 0, 0, 13, 2, 6, 0.00, 0.00, 208.00, 0.00, '2017-09-20', '0000-00-00', 1),
(91, 0, 0, 14, 2, 6, 0.00, 0.00, 145.60, 0.00, '2017-09-20', '0000-00-00', 1),
(92, 0, 0, 15, 2, 6, 0.00, 0.00, 466.60, 0.00, '2017-09-20', '0000-00-00', 1),
(93, 0, 0, 16, 2, 6, 0.00, 0.00, 250.80, 0.00, '2017-09-20', '0000-00-00', 1),
(94, 0, 0, 17, 2, 6, 0.00, 0.00, 60.80, 0.00, '2017-09-20', '0000-00-00', 1),
(95, 0, 0, 18, 2, 6, 0.00, 0.00, 46.40, 0.00, '2017-09-20', '0000-00-00', 1),
(96, 0, 0, 20, 2, 6, 0.00, 0.00, 152.00, 0.00, '2017-09-20', '0000-00-00', 1),
(97, 0, 0, 30, 2, 6, 0.00, 0.00, 198.00, 0.00, '2017-09-20', '0000-00-00', 1),
(98, 0, 0, 2, 3, 7, 0.00, 0.00, 1092.80, 0.00, '2017-09-20', '0000-00-00', 1),
(99, 0, 0, 3, 3, 7, 0.00, 0.00, 1846.40, 0.00, '2017-09-20', '0000-00-00', 1),
(100, 0, 0, 4, 3, 7, 0.00, 0.00, 1389.20, 0.00, '2017-09-20', '0000-00-00', 1),
(101, 0, 0, 5, 3, 7, 0.00, 0.00, 1201.80, 0.00, '2017-09-20', '0000-00-00', 1),
(102, 0, 0, 6, 3, 7, 0.00, 0.00, 959.20, 0.00, '2017-09-20', '0000-00-00', 1),
(103, 0, 0, 7, 3, 7, 0.00, 0.00, 89.60, 0.00, '2017-09-20', '0000-00-00', 1),
(104, 0, 0, 10, 3, 7, 0.00, 0.00, 1230.60, 0.00, '2017-09-20', '0000-00-00', 1),
(105, 0, 0, 11, 3, 7, 0.00, 0.00, 190.40, 0.00, '2017-09-20', '0000-00-00', 1),
(106, 0, 0, 13, 3, 7, 0.00, 0.00, 450.40, 0.00, '2017-09-20', '0000-00-00', 1),
(107, 0, 0, 14, 3, 7, 0.00, 0.00, 216.00, 0.00, '2017-09-20', '0000-00-00', 1),
(108, 0, 0, 15, 3, 7, 0.00, 0.00, 52.00, 0.00, '2017-09-20', '0000-00-00', 1),
(109, 0, 0, 16, 3, 7, 0.00, 0.00, 60.80, 0.00, '2017-09-20', '0000-00-00', 1),
(110, 0, 0, 17, 3, 7, 0.00, 0.00, 349.60, 0.00, '2017-09-20', '0000-00-00', 1),
(111, 0, 0, 18, 3, 7, 0.00, 0.00, 211.20, 0.00, '2017-09-20', '0000-00-00', 1),
(112, 0, 0, 20, 3, 7, 0.00, 0.00, 140.00, 0.00, '2017-09-20', '0000-00-00', 1),
(113, 0, 0, 23, 3, 7, 0.00, 0.00, 20.00, 0.00, '2017-09-20', '0000-00-00', 1),
(114, 0, 0, 30, 3, 7, 0.00, 0.00, 156.00, 0.00, '2017-09-20', '0000-00-00', 1),
(115, 0, 0, 2, 3, 8, 0.00, 0.00, 1233.80, 0.00, '2017-09-20', '0000-00-00', 1),
(116, 0, 0, 3, 3, 8, 0.00, 0.00, 1040.40, 0.00, '2017-09-20', '0000-00-00', 1),
(117, 0, 0, 4, 3, 8, 0.00, 0.00, 1277.80, 0.00, '2017-09-20', '0000-00-00', 1),
(118, 0, 0, 5, 3, 8, 0.00, 0.00, 868.80, 0.00, '2017-09-20', '0000-00-00', 1),
(119, 0, 0, 6, 3, 8, 0.00, 0.00, 346.80, 0.00, '2017-09-20', '0000-00-00', 1),
(120, 0, 0, 7, 3, 8, 0.00, 0.00, 35.20, 0.00, '2017-09-20', '0000-00-00', 1),
(121, 0, 0, 10, 3, 8, 0.00, 0.00, 596.80, 0.00, '2017-09-20', '0000-00-00', 1),
(122, 0, 0, 11, 3, 8, 0.00, 0.00, 569.60, 0.00, '2017-09-20', '0000-00-00', 1),
(123, 0, 0, 13, 3, 8, 0.00, 0.00, 464.80, 0.00, '2017-09-20', '0000-00-00', 1),
(124, 0, 0, 14, 3, 8, 0.00, 0.00, 115.60, 0.00, '2017-09-20', '0000-00-00', 1),
(125, 0, 0, 15, 3, 8, 0.00, 0.00, 508.40, 0.00, '2017-09-20', '0000-00-00', 1),
(126, 0, 0, 16, 3, 8, 0.00, 0.00, 55.60, 0.00, '2017-09-20', '0000-00-00', 1),
(127, 0, 0, 17, 3, 8, 0.00, 0.00, 56.00, 0.00, '2017-09-20', '0000-00-00', 1),
(128, 0, 0, 18, 3, 8, 0.00, 0.00, 157.20, 0.00, '2017-09-20', '0000-00-00', 1),
(129, 0, 0, 19, 3, 8, 0.00, 0.00, 25.60, 0.00, '2017-09-20', '0000-00-00', 1),
(130, 0, 0, 20, 3, 8, 0.00, 0.00, 140.00, 0.00, '2017-09-20', '0000-00-00', 1),
(131, 0, 0, 23, 3, 8, 0.00, 0.00, 160.00, 0.00, '2017-09-20', '0000-00-00', 1),
(132, 0, 0, 27, 3, 8, 0.00, 0.00, 78.00, 0.00, '2017-09-20', '0000-00-00', 1),
(133, 0, 0, 30, 3, 8, 0.00, 0.00, 304.00, 0.00, '2017-09-20', '0000-00-00', 1),
(134, 0, 0, 2, 3, 9, 0.00, 0.00, 2115.80, 0.00, '2017-09-21', '0000-00-00', 1),
(135, 0, 0, 3, 3, 9, 0.00, 0.00, 1338.60, 0.00, '2017-09-21', '0000-00-00', 1),
(136, 0, 0, 4, 3, 9, 0.00, 0.00, 996.40, 0.00, '2017-09-21', '0000-00-00', 1),
(137, 0, 0, 5, 3, 9, 0.00, 0.00, 982.40, 0.00, '2017-09-21', '0000-00-00', 1),
(138, 0, 0, 6, 3, 9, 0.00, 0.00, 1143.80, 0.00, '2017-09-21', '0000-00-00', 1),
(139, 0, 0, 7, 3, 9, 0.00, 0.00, 67.20, 0.00, '2017-09-21', '0000-00-00', 1),
(140, 0, 0, 10, 3, 9, 0.00, 0.00, 666.60, 0.00, '2017-09-21', '0000-00-00', 1),
(141, 0, 0, 11, 3, 9, 0.00, 0.00, 48.00, 0.00, '2017-09-21', '0000-00-00', 1),
(142, 0, 0, 13, 3, 9, 0.00, 0.00, 192.80, 0.00, '2017-09-21', '0000-00-00', 1),
(143, 0, 0, 14, 3, 9, 0.00, 0.00, 213.20, 0.00, '2017-09-21', '0000-00-00', 1),
(144, 0, 0, 15, 3, 9, 0.00, 0.00, 192.00, 0.00, '2017-09-21', '0000-00-00', 1),
(145, 0, 0, 16, 3, 9, 0.00, 0.00, 54.40, 0.00, '2017-09-21', '0000-00-00', 1),
(146, 0, 0, 17, 3, 9, 0.00, 0.00, 64.00, 0.00, '2017-09-21', '0000-00-00', 1),
(147, 0, 0, 18, 3, 9, 0.00, 0.00, 56.00, 0.00, '2017-09-21', '0000-00-00', 1),
(148, 0, 0, 19, 3, 9, 0.00, 0.00, 126.80, 0.00, '2017-09-21', '0000-00-00', 1),
(149, 0, 0, 20, 3, 9, 0.00, 0.00, 203.60, 0.00, '2017-09-21', '0000-00-00', 1),
(150, 0, 0, 23, 3, 9, 0.00, 0.00, 31.00, 0.00, '2017-09-21', '0000-00-00', 1),
(151, 0, 0, 30, 3, 9, 0.00, 0.00, 194.81, 0.00, '2017-09-21', '0000-00-00', 1),
(152, 0, 0, 2, 3, 10, 0.00, 0.00, 2531.20, 0.00, '2017-09-21', '0000-00-00', 1),
(153, 0, 0, 3, 3, 10, 0.00, 0.00, 494.20, 0.00, '2017-09-21', '0000-00-00', 1),
(154, 0, 0, 4, 3, 10, 0.00, 0.00, 1092.00, 0.00, '2017-09-21', '0000-00-00', 1),
(155, 0, 0, 5, 3, 10, 0.00, 0.00, 648.60, 0.00, '2017-09-21', '0000-00-00', 1),
(156, 0, 0, 6, 3, 10, 0.00, 0.00, 678.40, 0.00, '2017-09-21', '0000-00-00', 1),
(157, 0, 0, 7, 3, 10, 0.00, 0.00, 112.00, 0.00, '2017-09-21', '0000-00-00', 1),
(158, 0, 0, 10, 3, 10, 0.00, 0.00, 742.40, 0.00, '2017-09-21', '0000-00-00', 1),
(159, 0, 0, 11, 3, 10, 0.00, 0.00, 64.00, 0.00, '2017-09-21', '0000-00-00', 1),
(160, 0, 0, 13, 3, 10, 0.00, 0.00, 132.80, 0.00, '2017-09-21', '0000-00-00', 1),
(161, 0, 0, 14, 3, 10, 0.00, 0.00, 105.60, 0.00, '2017-09-21', '0000-00-00', 1),
(162, 0, 0, 15, 3, 10, 0.00, 0.00, 424.00, 0.00, '2017-09-21', '0000-00-00', 1),
(163, 0, 0, 16, 3, 10, 0.00, 0.00, 32.00, 0.00, '2017-09-21', '0000-00-00', 1),
(164, 0, 0, 17, 3, 10, 0.00, 0.00, 211.10, 0.00, '2017-09-21', '0000-00-00', 1),
(165, 0, 0, 18, 3, 10, 0.00, 0.00, 25.60, 0.00, '2017-09-21', '0000-00-00', 1),
(166, 0, 0, 19, 3, 10, 0.00, 0.00, 83.20, 0.00, '2017-09-21', '0000-00-00', 1),
(167, 0, 0, 20, 3, 10, 0.00, 0.00, 157.60, 0.00, '2017-09-21', '0000-00-00', 1),
(168, 0, 0, 23, 3, 10, 0.00, 0.00, 33.50, 0.00, '2017-09-21', '0000-00-00', 1),
(169, 0, 0, 30, 3, 10, 0.00, 0.00, 739.20, 0.00, '2017-09-21', '0000-00-00', 1),
(170, 0, 0, 2, 3, 11, 0.00, 0.00, 3663.40, 0.00, '2017-09-21', '0000-00-00', 1),
(171, 0, 0, 3, 3, 11, 0.00, 0.00, 1579.60, 0.00, '2017-09-21', '0000-00-00', 1),
(172, 0, 0, 4, 3, 11, 0.00, 0.00, 1473.20, 0.00, '2017-09-21', '0000-00-00', 1),
(173, 0, 0, 5, 3, 11, 0.00, 0.00, 1041.40, 0.00, '2017-09-21', '0000-00-00', 1),
(174, 0, 0, 6, 3, 11, 0.00, 0.00, 1038.20, 0.00, '2017-09-21', '0000-00-00', 1),
(175, 0, 0, 7, 3, 11, 0.00, 0.00, 198.80, 0.00, '2017-09-21', '0000-00-00', 1),
(176, 0, 0, 10, 3, 11, 0.00, 0.00, 1177.40, 0.00, '2017-09-21', '0000-00-00', 1),
(177, 0, 0, 11, 3, 11, 0.00, 0.00, 6.40, 0.00, '2017-09-21', '0000-00-00', 1),
(178, 0, 0, 13, 3, 11, 0.00, 0.00, 548.60, 0.00, '2017-09-21', '0000-00-00', 1),
(179, 0, 0, 14, 3, 11, 0.00, 0.00, 215.30, 0.00, '2017-09-21', '0000-00-00', 1),
(180, 0, 0, 15, 3, 11, 0.00, 0.00, 562.40, 0.00, '2017-09-21', '0000-00-00', 1),
(181, 0, 0, 16, 3, 11, 0.00, 0.00, 120.80, 0.00, '2017-09-21', '0000-00-00', 1),
(182, 0, 0, 17, 3, 11, 0.00, 0.00, 70.40, 0.00, '2017-09-21', '0000-00-00', 1),
(183, 0, 0, 18, 3, 11, 0.00, 0.00, 79.20, 0.00, '2017-09-21', '0000-00-00', 1),
(184, 0, 0, 19, 3, 11, 0.00, 0.00, 60.80, 0.00, '2017-09-21', '0000-00-00', 1),
(185, 0, 0, 20, 3, 11, 0.00, 0.00, 112.80, 0.00, '2017-09-21', '0000-00-00', 1),
(186, 0, 0, 23, 3, 11, 0.00, 0.00, 69.00, 0.00, '2017-09-21', '0000-00-00', 1),
(187, 0, 0, 30, 3, 11, 0.00, 0.00, 176.60, 0.00, '2017-09-21', '0000-00-00', 1),
(188, 0, 0, 2, 3, 12, 0.00, 0.00, 2752.80, 0.00, '2017-09-21', '0000-00-00', 1),
(189, 0, 0, 3, 3, 12, 0.00, 0.00, 1147.60, 0.00, '2017-09-21', '0000-00-00', 1),
(190, 0, 0, 4, 3, 12, 0.00, 0.00, 1021.40, 0.00, '2017-09-21', '0000-00-00', 1),
(191, 0, 0, 5, 3, 12, 0.00, 0.00, 1019.40, 0.00, '2017-09-21', '0000-00-00', 1),
(192, 0, 0, 6, 3, 12, 0.00, 0.00, 1068.20, 0.00, '2017-09-21', '0000-00-00', 1),
(193, 0, 0, 7, 3, 12, 0.00, 0.00, 118.40, 0.00, '2017-09-21', '0000-00-00', 1),
(194, 0, 0, 10, 3, 12, 0.00, 0.00, 372.40, 0.00, '2017-09-21', '0000-00-00', 1),
(195, 0, 0, 13, 3, 12, 0.00, 0.00, 346.80, 0.00, '2017-09-21', '0000-00-00', 1),
(196, 0, 0, 14, 3, 12, 0.00, 0.00, 449.40, 0.00, '2017-09-21', '0000-00-00', 1),
(197, 0, 0, 15, 3, 12, 0.00, 0.00, 559.20, 0.00, '2017-09-21', '0000-00-00', 1),
(198, 0, 0, 16, 3, 12, 0.00, 0.00, 194.00, 0.00, '2017-09-21', '0000-00-00', 1),
(199, 0, 0, 17, 3, 12, 0.00, 0.00, 267.80, 0.00, '2017-09-21', '0000-00-00', 1),
(200, 0, 0, 18, 3, 12, 0.00, 0.00, 260.00, 0.00, '2017-09-21', '0000-00-00', 1),
(201, 0, 0, 19, 3, 12, 0.00, 0.00, 177.40, 0.00, '2017-09-21', '0000-00-00', 1),
(202, 0, 0, 20, 3, 12, 0.00, 0.00, 80.00, 0.00, '2017-09-21', '0000-00-00', 1),
(203, 0, 0, 30, 3, 12, 0.00, 0.00, 109.20, 0.00, '2017-09-21', '0000-00-00', 1),
(204, 0, 0, 23, 2, 2, 1470.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(205, 0, 0, 31, 2, 2, 1887.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(206, 0, 0, 38, 2, 2, 2460.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(207, 0, 0, 46, 2, 2, 2004.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(208, 0, 0, 52, 2, 2, 1947.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(209, 0, 0, 54, 2, 2, 3266.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(210, 0, 0, 56, 2, 2, 2159.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(211, 0, 0, 63, 2, 2, 1366.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(212, 0, 0, 66, 2, 2, 1145.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(213, 0, 0, 69, 2, 2, 3026.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(214, 0, 0, 72, 2, 2, 1779.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(215, 0, 0, 77, 2, 2, 2285.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(216, 0, 0, 78, 2, 2, 1029.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(217, 0, 0, 81, 2, 2, 1922.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(218, 0, 0, 82, 2, 2, 1219.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(219, 0, 0, 83, 2, 2, 1054.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(220, 0, 0, 87, 2, 2, 4050.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(221, 0, 0, 93, 2, 2, 2400.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(222, 0, 0, 104, 2, 2, 1394.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(223, 0, 0, 112, 2, 2, 2775.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(224, 0, 0, 116, 2, 2, 4717.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(225, 0, 0, 118, 2, 2, 0.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(226, 0, 0, 120, 2, 2, 1499.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(227, 0, 0, 123, 2, 2, 3091.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(228, 0, 0, 125, 2, 2, 2401.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(229, 0, 0, 127, 2, 2, 2314.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(230, 0, 0, 135, 2, 2, 1406.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(231, 0, 0, 136, 2, 2, 1946.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(232, 0, 0, 139, 2, 2, 478.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(233, 0, 0, 142, 2, 2, 2360.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(234, 0, 0, 215, 2, 2, 1299.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(235, 0, 0, 150, 2, 2, 1691.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(236, 0, 0, 157, 2, 2, 2955.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(237, 0, 0, 164, 2, 2, 3146.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(238, 0, 0, 170, 2, 2, 5460.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(239, 0, 0, 171, 2, 2, 2489.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(240, 0, 0, 172, 2, 2, 2465.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(241, 0, 0, 179, 2, 2, 3034.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(242, 0, 0, 186, 2, 2, 1552.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(243, 0, 0, 188, 2, 2, 2075.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(244, 0, 0, 189, 2, 2, 2408.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(246, 0, 0, 195, 2, 2, 1615.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(247, 0, 0, 197, 2, 2, 2482.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(248, 0, 0, 200, 2, 2, 2225.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(249, 0, 0, 201, 2, 2, 1424.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(250, 0, 0, 207, 2, 2, 1081.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(251, 0, 0, 210, 2, 2, 1892.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(252, 0, 0, 211, 2, 2, 1310.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(253, 0, 0, 212, 2, 2, 1340.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(254, 0, 0, 214, 2, 2, 2314.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(255, 0, 0, 23, 2, 3, 1423.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(256, 0, 0, 31, 2, 3, 999.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(257, 0, 0, 38, 2, 3, 1116.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(258, 0, 0, 46, 2, 3, 844.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(259, 0, 0, 52, 2, 3, 1799.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(260, 0, 0, 54, 2, 3, 1831.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(261, 0, 0, 56, 2, 3, 1085.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(262, 0, 0, 63, 2, 3, 627.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(263, 0, 0, 66, 2, 3, 492.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(264, 0, 0, 69, 2, 3, 1946.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(265, 0, 0, 72, 2, 3, 719.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(266, 0, 0, 77, 2, 3, 1172.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(267, 0, 0, 78, 2, 3, 730.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(268, 0, 0, 81, 2, 3, 869.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(269, 0, 0, 82, 2, 3, 650.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(270, 0, 0, 83, 2, 3, 514.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(271, 0, 0, 87, 2, 3, 2094.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(272, 0, 0, 93, 2, 3, 1202.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(273, 0, 0, 104, 2, 3, 708.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(274, 0, 0, 112, 2, 3, 1369.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(275, 0, 0, 116, 2, 3, 2038.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(276, 0, 0, 119, 2, 3, 1801.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(277, 0, 0, 120, 2, 3, 680.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(278, 0, 0, 123, 2, 3, 1481.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(279, 0, 0, 127, 2, 3, 1088.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(280, 0, 0, 135, 2, 3, 893.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(281, 0, 0, 136, 2, 3, 1564.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(282, 0, 0, 139, 2, 3, 324.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(283, 0, 0, 142, 2, 3, 1080.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(284, 0, 0, 150, 2, 3, 730.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(285, 0, 0, 157, 2, 3, 1654.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(286, 0, 0, 164, 2, 3, 1060.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(287, 0, 0, 170, 2, 3, 2962.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(288, 0, 0, 171, 2, 3, 1144.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(289, 0, 0, 172, 2, 3, 1454.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(290, 0, 0, 179, 2, 3, 1653.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(291, 0, 0, 186, 2, 3, 784.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(292, 0, 0, 188, 2, 3, 1001.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(293, 0, 0, 189, 2, 3, 1031.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(294, 0, 0, 193, 2, 3, 0.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(295, 0, 0, 195, 2, 3, 763.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(296, 0, 0, 197, 2, 3, 923.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(297, 0, 0, 200, 2, 3, 1538.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(298, 0, 0, 201, 2, 3, 735.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(299, 0, 0, 207, 2, 3, 542.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(300, 0, 0, 210, 2, 3, 1113.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(301, 0, 0, 211, 2, 3, 438.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(302, 0, 0, 212, 2, 3, 680.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(303, 0, 0, 214, 2, 3, 1229.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(304, 0, 0, 215, 2, 3, 1000.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(305, 0, 0, 23, 2, 4, 1281.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(306, 0, 0, 31, 2, 4, 1142.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(307, 0, 0, 38, 2, 4, 1257.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(308, 0, 0, 46, 2, 4, 788.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(309, 0, 0, 54, 2, 4, 1594.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(310, 0, 0, 56, 2, 4, 1423.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(311, 0, 0, 63, 2, 4, 546.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(312, 0, 0, 66, 2, 4, 627.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(313, 0, 0, 69, 2, 4, 1113.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(314, 0, 0, 72, 2, 4, 881.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(315, 0, 0, 77, 2, 4, 1426.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(316, 0, 0, 81, 2, 4, 1116.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(317, 0, 0, 82, 2, 4, 432.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(318, 0, 0, 83, 2, 4, 542.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(319, 0, 0, 87, 2, 4, 2338.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(320, 0, 0, 93, 2, 4, 1340.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(321, 0, 0, 104, 2, 4, 735.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(322, 0, 0, 112, 2, 4, 1398.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(323, 0, 0, 116, 2, 4, 2277.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(324, 0, 0, 119, 2, 4, 2127.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(325, 0, 0, 120, 2, 4, 735.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(326, 0, 0, 123, 2, 4, 1173.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(327, 0, 0, 125, 2, 4, 1370.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(328, 0, 0, 127, 2, 4, 1172.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(329, 0, 0, 150, 2, 4, 892.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(330, 0, 0, 157, 2, 4, 1594.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(331, 0, 0, 164, 2, 4, 1032.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(332, 0, 0, 170, 2, 4, 2597.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(333, 0, 0, 171, 2, 4, 1228.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(334, 0, 0, 172, 2, 4, 1742.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(335, 0, 0, 179, 2, 4, 1369.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(336, 0, 0, 186, 2, 4, 730.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(337, 0, 0, 188, 2, 4, 1252.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(338, 0, 0, 189, 2, 4, 1060.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(339, 0, 0, 193, 2, 4, 297.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(340, 0, 0, 195, 2, 4, 998.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(341, 0, 0, 197, 2, 4, 979.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(342, 0, 0, 200, 2, 4, 1031.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(343, 0, 0, 201, 2, 4, 546.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(344, 0, 0, 207, 2, 4, 568.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(345, 0, 0, 211, 2, 4, 1144.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(346, 0, 0, 212, 2, 4, 871.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(347, 0, 0, 214, 2, 4, 1425.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(348, 0, 0, 23, 2, 5, 1001.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(349, 0, 0, 31, 2, 5, 946.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(350, 0, 0, 38, 2, 5, 1088.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(351, 0, 0, 46, 2, 5, 924.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(352, 0, 0, 52, 2, 5, 2728.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(353, 0, 0, 54, 2, 5, 1566.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(354, 0, 0, 56, 2, 5, 1056.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(355, 0, 0, 63, 2, 5, 681.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(356, 0, 0, 66, 2, 5, 546.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(357, 0, 0, 69, 2, 5, 1001.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(358, 0, 0, 72, 2, 5, 773.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(359, 0, 0, 77, 2, 5, 788.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(360, 0, 0, 78, 2, 5, 1483.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(361, 0, 0, 81, 2, 5, 1200.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(362, 0, 0, 82, 2, 5, 678.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(363, 0, 0, 83, 2, 5, 353.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(364, 0, 0, 87, 2, 5, 1946.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(365, 0, 0, 93, 2, 5, 1145.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(366, 0, 0, 104, 2, 5, 654.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(367, 0, 0, 112, 2, 5, 1257.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(368, 0, 0, 116, 2, 5, 1593.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(369, 0, 0, 119, 2, 5, 1453.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(370, 0, 0, 120, 2, 5, 789.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(371, 0, 0, 123, 2, 5, 1369.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(372, 0, 0, 125, 2, 5, 1256.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(373, 0, 0, 127, 2, 5, 1088.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(374, 0, 0, 135, 2, 5, 1380.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(375, 0, 0, 136, 2, 5, 2328.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(376, 0, 0, 139, 2, 5, 624.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(377, 0, 0, 142, 2, 5, 3066.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(378, 0, 0, 150, 2, 5, 865.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(379, 0, 0, 152, 2, 5, 865.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(380, 0, 0, 157, 2, 5, 1454.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(381, 0, 0, 164, 2, 5, 1200.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(382, 0, 0, 170, 2, 5, 2286.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(383, 0, 0, 179, 2, 5, 1639.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(384, 0, 0, 186, 2, 5, 569.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(385, 0, 0, 188, 2, 5, 974.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(386, 0, 0, 189, 2, 5, 1031.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(387, 0, 0, 193, 2, 5, 116.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(388, 0, 0, 195, 2, 5, 1031.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(389, 0, 0, 197, 2, 5, 1228.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(390, 0, 0, 200, 2, 5, 1482.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(391, 0, 0, 201, 2, 5, 627.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(392, 0, 0, 207, 2, 5, 460.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(393, 0, 0, 210, 2, 5, 1935.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(394, 0, 0, 211, 2, 5, 680.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(395, 0, 0, 212, 2, 5, 707.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(396, 0, 0, 214, 2, 5, 1229.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(397, 0, 0, 215, 2, 5, 1326.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(398, 0, 0, 23, 2, 6, 946.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(399, 0, 0, 31, 2, 6, 757.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(400, 0, 0, 38, 2, 6, 1032.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(401, 0, 0, 46, 2, 6, 897.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(402, 0, 0, 52, 2, 6, 1056.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(403, 0, 0, 54, 2, 6, 1060.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(404, 0, 0, 56, 2, 6, 946.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(405, 0, 0, 63, 2, 6, 519.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(406, 0, 0, 66, 2, 6, 438.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(407, 0, 0, 69, 2, 6, 730.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(408, 0, 0, 72, 2, 6, 502.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(409, 0, 0, 77, 2, 6, 870.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(410, 0, 0, 78, 2, 6, 568.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(411, 0, 0, 81, 2, 6, 735.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(412, 0, 0, 82, 2, 6, 460.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(413, 0, 0, 83, 2, 6, 266.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(414, 0, 0, 87, 2, 6, 1948.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(415, 0, 0, 93, 2, 6, 869.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(416, 0, 0, 104, 2, 6, 627.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(417, 0, 0, 112, 2, 6, 1032.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(418, 0, 0, 116, 2, 6, 1712.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(419, 0, 0, 119, 2, 6, 1398.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(420, 0, 0, 120, 2, 6, 654.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(421, 0, 0, 123, 2, 6, 1229.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(422, 0, 0, 125, 2, 6, 1032.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(423, 0, 0, 127, 2, 6, 789.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(424, 0, 0, 135, 2, 6, 420.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(425, 0, 0, 136, 2, 6, 677.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(426, 0, 0, 139, 2, 6, 115.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(427, 0, 0, 142, 2, 6, 877.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(428, 0, 0, 150, 2, 6, 757.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(429, 0, 0, 152, 2, 6, 757.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(430, 0, 0, 157, 2, 6, 1200.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(431, 0, 0, 164, 2, 6, 1032.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(432, 0, 0, 170, 2, 6, 2067.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(433, 0, 0, 171, 2, 6, 788.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(434, 0, 0, 172, 2, 6, 1116.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(435, 0, 0, 179, 2, 6, 1397.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(436, 0, 0, 186, 2, 6, 649.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(437, 0, 0, 188, 2, 6, 676.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(438, 0, 0, 189, 2, 6, 1088.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(439, 0, 0, 195, 2, 6, 789.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(440, 0, 0, 196, 2, 6, 115.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(441, 0, 0, 197, 2, 6, 681.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(442, 0, 0, 200, 2, 6, 1594.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(443, 0, 0, 201, 2, 6, 708.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(444, 0, 0, 207, 2, 6, 406.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(445, 0, 0, 210, 2, 6, 785.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(446, 0, 0, 211, 2, 6, 601.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(447, 0, 0, 212, 2, 6, 600.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(448, 0, 0, 214, 2, 6, 816.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(449, 0, 0, 215, 2, 6, 460.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(450, 0, 0, 52, 3, 7, 731.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(451, 0, 0, 78, 3, 7, 352.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(452, 0, 0, 135, 3, 7, 306.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(453, 0, 0, 136, 3, 7, 621.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(454, 0, 0, 139, 3, 7, 115.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(455, 0, 0, 142, 3, 7, 600.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(456, 0, 0, 210, 3, 7, 406.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(457, 0, 0, 215, 3, 7, 352.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(458, 0, 0, 23, 3, 8, 808.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(459, 0, 0, 31, 3, 8, 1025.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(460, 0, 0, 38, 3, 8, 1174.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(461, 0, 0, 46, 3, 8, 927.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(462, 0, 0, 52, 3, 8, 710.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(463, 0, 0, 54, 3, 8, 1311.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(464, 0, 0, 56, 3, 8, 994.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(465, 0, 0, 63, 3, 8, 669.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(466, 0, 0, 66, 3, 8, 627.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(467, 0, 0, 69, 3, 8, 1709.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(468, 0, 0, 72, 3, 8, 733.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(469, 0, 0, 77, 3, 8, 1174.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(470, 0, 0, 78, 3, 8, 423.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(471, 0, 0, 81, 3, 8, 1060.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(472, 0, 0, 82, 3, 8, 626.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(473, 0, 0, 83, 3, 8, 304.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(474, 0, 0, 87, 3, 8, 3053.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(475, 0, 0, 93, 3, 8, 1555.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(476, 0, 0, 104, 3, 8, 589.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(477, 0, 0, 112, 3, 8, 1337.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(478, 0, 0, 116, 3, 8, 1886.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(479, 0, 0, 119, 3, 8, 1753.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(480, 0, 0, 120, 3, 8, 867.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(481, 0, 0, 123, 3, 8, 1642.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(482, 0, 0, 125, 3, 8, 1089.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(483, 0, 0, 127, 3, 8, 1197.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(484, 0, 0, 135, 3, 8, 279.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(485, 0, 0, 136, 3, 8, 652.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(486, 0, 0, 139, 3, 8, 115.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(487, 0, 0, 142, 3, 8, 528.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(488, 0, 0, 150, 3, 8, 1189.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(489, 0, 0, 157, 3, 8, 2197.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(490, 0, 0, 164, 3, 8, 1640.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(491, 0, 0, 170, 3, 8, 2514.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(492, 0, 0, 171, 3, 8, 1065.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(493, 0, 0, 172, 3, 8, 1445.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(494, 0, 0, 179, 3, 8, 1697.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(495, 0, 0, 186, 3, 8, 666.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(496, 0, 0, 188, 3, 8, 803.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(497, 0, 0, 189, 3, 8, 1670.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(498, 0, 0, 195, 3, 8, 1007.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(499, 0, 0, 196, 3, 8, 236.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(500, 0, 0, 197, 3, 8, 1036.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(501, 0, 0, 200, 3, 8, 2281.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(502, 0, 0, 201, 3, 8, 447.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(503, 0, 0, 207, 3, 8, 889.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(504, 0, 0, 210, 3, 8, 425.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(505, 0, 0, 211, 3, 8, 824.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(506, 0, 0, 212, 3, 8, 759.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(507, 0, 0, 214, 3, 8, 1034.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(508, 0, 0, 215, 3, 8, 218.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(509, 0, 0, 23, 3, 9, 623.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(510, 0, 0, 31, 3, 9, 461.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(511, 0, 0, 38, 3, 9, 761.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(512, 0, 0, 46, 3, 9, 653.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(513, 0, 0, 52, 3, 9, 623.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(514, 0, 0, 54, 3, 9, 654.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(515, 0, 0, 56, 3, 9, 407.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(516, 0, 0, 63, 3, 9, 337.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(517, 0, 0, 66, 3, 9, 297.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(518, 0, 0, 69, 3, 9, 729.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(519, 0, 0, 71, 3, 9, 341.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(520, 0, 0, 77, 3, 9, 519.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(521, 0, 0, 78, 3, 9, 353.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(522, 0, 0, 81, 3, 9, 410.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(523, 0, 0, 82, 3, 9, 325.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(524, 0, 0, 83, 3, 9, 131.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(525, 0, 0, 87, 3, 9, 1740.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(526, 0, 0, 93, 3, 9, 761.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(527, 0, 0, 104, 3, 9, 297.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(528, 0, 0, 112, 3, 9, 735.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(529, 0, 0, 116, 3, 9, 1369.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(530, 0, 0, 119, 3, 9, 1031.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(531, 0, 0, 120, 3, 9, 438.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(532, 0, 0, 123, 3, 9, 1031.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(533, 0, 0, 125, 3, 9, 600.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(534, 0, 0, 127, 3, 9, 654.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(535, 0, 0, 135, 3, 9, 202.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(536, 0, 0, 136, 3, 9, 568.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(537, 0, 0, 139, 3, 9, 150.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(538, 0, 0, 142, 3, 9, 465.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(539, 0, 0, 150, 3, 9, 622.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(540, 0, 0, 157, 3, 9, 762.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(541, 0, 0, 164, 3, 9, 443.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(542, 0, 0, 170, 3, 9, 1371.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(543, 0, 0, 171, 3, 9, 788.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(544, 0, 0, 172, 3, 9, 870.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(545, 0, 0, 179, 3, 9, 924.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(546, 0, 0, 186, 3, 9, 515.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(547, 0, 0, 188, 3, 9, 489.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(548, 0, 0, 189, 3, 9, 816.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(549, 0, 0, 195, 3, 9, 438.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(550, 0, 0, 196, 3, 9, 116.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(551, 0, 0, 197, 3, 9, 546.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(552, 0, 0, 200, 3, 9, 977.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(553, 0, 0, 201, 3, 9, 198.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(554, 0, 0, 207, 3, 9, 352.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(555, 0, 0, 210, 3, 9, 353.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(556, 0, 0, 211, 3, 9, 520.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(557, 0, 0, 212, 3, 9, 438.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(558, 0, 0, 214, 3, 9, 357.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(559, 0, 0, 215, 3, 9, 166.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(560, 0, 0, 23, 3, 10, 702.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(561, 0, 0, 31, 3, 10, 433.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(562, 0, 0, 38, 3, 10, 681.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(563, 0, 0, 46, 3, 10, 573.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(564, 0, 0, 52, 3, 10, 731.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(565, 0, 0, 54, 3, 10, 545.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(566, 0, 0, 56, 3, 10, 542.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(567, 0, 0, 63, 3, 10, 297.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(568, 0, 0, 66, 3, 10, 337.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(569, 0, 0, 69, 3, 10, 1001.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(570, 0, 0, 72, 3, 10, 367.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(571, 0, 0, 77, 3, 10, 546.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(572, 0, 0, 78, 3, 10, 838.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(573, 0, 0, 81, 3, 10, 574.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(574, 0, 0, 82, 3, 10, 286.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(575, 0, 0, 83, 3, 10, 115.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(576, 0, 0, 87, 3, 10, 1770.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(577, 0, 0, 93, 3, 10, 789.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(578, 0, 0, 104, 3, 10, 383.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(579, 0, 0, 112, 3, 10, 869.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(580, 0, 0, 116, 3, 10, 1088.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(581, 0, 0, 119, 3, 10, 978.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(582, 0, 0, 120, 3, 10, 465.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(583, 0, 0, 123, 3, 10, 978.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(584, 0, 0, 125, 3, 10, 654.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(585, 0, 0, 127, 3, 10, 627.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(586, 0, 0, 135, 3, 10, 460.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(587, 0, 0, 136, 3, 10, 784.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(588, 0, 0, 139, 3, 10, 115.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(589, 0, 0, 142, 3, 10, 785.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(590, 0, 0, 150, 3, 10, 568.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(591, 0, 0, 164, 3, 10, 816.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(592, 0, 0, 170, 3, 10, 1683.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(593, 0, 0, 171, 3, 10, 897.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(594, 0, 0, 172, 3, 10, 951.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(595, 0, 0, 179, 3, 10, 1060.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(596, 0, 0, 186, 3, 10, 514.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(597, 0, 0, 188, 3, 10, 460.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(598, 0, 0, 189, 3, 10, 653.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(599, 0, 0, 195, 3, 10, 546.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(600, 0, 0, 196, 3, 10, 115.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(601, 0, 0, 197, 3, 10, 761.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(602, 0, 0, 200, 3, 10, 924.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(603, 0, 0, 201, 3, 10, 465.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(604, 0, 0, 207, 3, 10, 407.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(605, 0, 0, 210, 3, 10, 460.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(606, 0, 0, 211, 3, 10, 572.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(607, 0, 0, 212, 3, 10, 411.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(608, 0, 0, 214, 3, 10, 704.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(609, 0, 0, 215, 3, 10, 353.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(610, 0, 0, 23, 3, 11, 947.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(611, 0, 0, 31, 3, 11, 757.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(612, 0, 0, 38, 3, 11, 978.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(613, 0, 0, 46, 3, 11, 870.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(614, 0, 0, 52, 3, 11, 891.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(615, 0, 0, 54, 3, 11, 1144.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(616, 0, 0, 56, 3, 11, 784.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(617, 0, 0, 63, 3, 11, 546.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(618, 0, 0, 66, 3, 11, 546.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(619, 0, 0, 69, 3, 11, 1281.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(620, 0, 0, 72, 3, 11, 747.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(621, 0, 0, 77, 3, 11, 923.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(622, 0, 0, 78, 3, 11, 1056.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(623, 0, 0, 81, 3, 11, 950.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(624, 0, 0, 82, 3, 11, 595.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(625, 0, 0, 83, 3, 11, 286.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(626, 0, 0, 87, 3, 11, 1978.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(627, 0, 0, 93, 3, 11, 978.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(628, 0, 0, 104, 3, 11, 520.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(629, 0, 0, 112, 3, 11, 1229.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(630, 0, 0, 116, 3, 11, 2097.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(631, 0, 0, 119, 3, 11, 1683.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(632, 0, 0, 120, 3, 11, 789.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(633, 0, 0, 123, 3, 11, 1426.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(634, 0, 0, 125, 3, 11, 924.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1);
INSERT INTO `monthly_others_enties` (`id`, `designation_id`, `department_id`, `employee_id`, `fiscal_year_id`, `month_id`, `electric_bill`, `telephone_bill`, `rent_a_car_bill`, `others`, `created_at`, `updated_at`, `created_by`) VALUES
(635, 0, 0, 127, 3, 11, 1032.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(636, 0, 0, 135, 3, 11, 731.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(637, 0, 0, 136, 3, 11, 1169.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(638, 0, 0, 139, 3, 11, 288.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(639, 0, 0, 142, 3, 11, 1150.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(640, 0, 0, 150, 3, 11, 730.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(641, 0, 0, 164, 3, 11, 1116.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(642, 0, 0, 170, 3, 11, 2368.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(643, 0, 0, 171, 3, 11, 1200.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(644, 0, 0, 172, 3, 11, 1312.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(645, 0, 0, 179, 3, 11, 1481.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(646, 0, 0, 186, 3, 11, 1423.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(647, 0, 0, 188, 3, 11, 865.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(648, 0, 0, 189, 3, 11, 1088.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(649, 0, 0, 195, 3, 11, 789.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(650, 0, 0, 196, 3, 11, 116.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(651, 0, 0, 197, 3, 11, 1088.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(652, 0, 0, 200, 3, 11, 1257.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(653, 0, 0, 201, 3, 11, 653.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(654, 0, 0, 207, 3, 11, 461.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(655, 0, 0, 210, 3, 11, 785.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(656, 0, 0, 211, 3, 11, 951.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(657, 0, 0, 212, 3, 11, 707.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(658, 0, 0, 214, 3, 11, 815.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(659, 0, 0, 215, 3, 11, 729.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(660, 0, 0, 23, 3, 12, 1000.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(661, 0, 0, 31, 3, 12, 785.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(662, 0, 0, 38, 3, 12, 1088.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(663, 0, 0, 46, 3, 12, 924.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(664, 0, 0, 54, 3, 12, 1116.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(665, 0, 0, 56, 3, 12, 946.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(666, 0, 0, 63, 3, 12, 680.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(667, 0, 0, 66, 3, 12, 654.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(668, 0, 0, 69, 3, 12, 1507.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(669, 0, 0, 72, 3, 12, 989.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(670, 0, 0, 77, 3, 12, 897.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(671, 0, 0, 81, 3, 12, 1088.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(672, 0, 0, 82, 3, 12, 703.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(673, 0, 0, 83, 3, 12, 286.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(674, 0, 0, 87, 3, 12, 1828.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(675, 0, 0, 93, 3, 12, 1004.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(676, 0, 0, 104, 3, 12, 653.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(677, 0, 0, 112, 3, 12, 1173.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(678, 0, 0, 116, 3, 12, 2067.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(679, 0, 0, 119, 3, 12, 1743.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(680, 0, 0, 120, 3, 12, 869.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(681, 0, 0, 123, 3, 12, 1257.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(682, 0, 0, 125, 3, 12, 923.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(683, 0, 0, 127, 3, 12, 1060.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(684, 0, 0, 150, 3, 12, 812.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(685, 0, 0, 164, 3, 12, 1285.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(686, 0, 0, 170, 3, 12, 2596.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(687, 0, 0, 171, 3, 12, 1426.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(688, 0, 0, 172, 3, 12, 1286.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(689, 0, 0, 179, 3, 12, 1454.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(690, 0, 0, 186, 3, 12, 838.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(691, 0, 0, 188, 3, 12, 1000.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(692, 0, 0, 189, 3, 12, 978.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(693, 0, 0, 191, 3, 12, 870.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(694, 0, 0, 196, 3, 12, 115.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(695, 0, 0, 197, 3, 12, 1032.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(696, 0, 0, 200, 3, 12, 1172.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(697, 0, 0, 201, 3, 12, 654.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(698, 0, 0, 207, 3, 12, 514.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(699, 0, 0, 211, 3, 12, 923.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(700, 0, 0, 212, 3, 12, 843.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(701, 0, 0, 214, 3, 12, 978.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(702, 0, 0, 119, 2, 2, 3507.00, 0.00, 0.00, 0.00, '2017-10-03', '0000-00-00', 1),
(703, 0, 0, 196, 2, 2, 237.00, 0.00, 0.00, 0.00, '2017-10-03', '0000-00-00', 1),
(704, 0, 0, 193, 2, 3, 0.00, 0.00, 0.00, 0.00, '2017-10-04', '0000-00-00', 1),
(705, 0, 0, 15, 2, 3, 0.00, 0.00, 76.80, 0.00, '2017-10-04', '0000-00-00', 1),
(706, 0, 0, 196, 2, 3, 116.00, 0.00, 0.00, 0.00, '2017-10-10', '0000-00-00', 1),
(707, 0, 0, 125, 2, 3, 1285.00, 0.00, 0.00, 0.00, '2017-10-10', '0000-00-00', 1),
(708, 0, 0, 20, 2, 4, 0.00, 0.00, 96.00, 0.00, '2017-11-16', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `monthly_others_enties_settings`
--

CREATE TABLE `monthly_others_enties_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `monthly_others_enties_settings`
--

INSERT INTO `monthly_others_enties_settings` (`id`, `name`) VALUES
(1, 'Electric Bill'),
(2, 'Telephone Bill'),
(3, 'Rent a Car Bill'),
(4, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `monthly_salary_notes`
--

CREATE TABLE `monthly_salary_notes` (
  `id` int(11) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `account_no` varchar(20) DEFAULT NULL,
  `net_pay` double(10,2) NOT NULL,
  `month_id` int(11) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `bank_info_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `monthly_salary_notes`
--

INSERT INTO `monthly_salary_notes` (`id`, `emp_name`, `emp_id`, `designation`, `account_no`, `net_pay`, `month_id`, `fiscal_year_id`, `bank_info_id`, `date`) VALUES
(27, 'test', 12345, 'chairman', '333333', 600000.00, 1, 1, 2, '2017-08-01 17:19:00');

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`id`, `name`) VALUES
(1, 'July'),
(2, 'August'),
(3, 'September'),
(4, 'October'),
(5, 'November'),
(6, 'December'),
(7, 'January'),
(8, 'February'),
(9, 'March'),
(10, 'April'),
(11, 'May'),
(12, 'June');

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
(1, 'General'),
(2, 'Freedom fighter'),
(3, 'Sports');

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
(1, 'Islam'),
(2, 'Hinduism'),
(3, 'Christianity'),
(4, 'Buddhism');

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
  `name` float DEFAULT NULL,
  `employee_grade_id` int(11) NOT NULL,
  `grade_basic` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scales`
--

INSERT INTO `scales` (`id`, `name`, `employee_grade_id`, `grade_basic`, `created_by`, `created_at`, `updated_at`) VALUES
(5, NULL, 2, 66000, 1, '2017-07-27', NULL),
(6, NULL, 2, 68480, 1, '2017-07-27', NULL),
(7, NULL, 2, 71050, 1, '2017-07-27', NULL),
(8, NULL, 5, 56500, 1, '2017-07-27', NULL),
(9, NULL, 5, 58760, 1, '2017-07-27', NULL),
(10, NULL, 5, 61120, 1, '2017-07-27', NULL),
(11, NULL, 5, 63570, 1, '2017-07-27', NULL),
(12, NULL, 5, 66120, 1, '2017-07-27', NULL),
(13, NULL, 3, 78000, 1, '2017-07-27', NULL),
(14, NULL, 19, 9000, 1, '2017-07-30', NULL),
(15, NULL, 19, 9450, 1, '2017-07-30', NULL),
(16, NULL, 19, 9930, 1, '2017-07-30', NULL),
(17, NULL, 19, 10430, 1, '2017-07-30', NULL),
(18, NULL, 2, 73720, 1, '2017-08-05', NULL),
(19, NULL, 2, 76490, 1, '2017-08-05', NULL),
(20, NULL, 5, 68770, 1, '2017-08-05', NULL),
(21, NULL, 5, 71530, 1, '2017-08-05', NULL),
(22, NULL, 5, 74400, 1, '2017-08-05', NULL),
(23, NULL, 6, 50000, 1, '2017-08-05', NULL),
(24, NULL, 6, 52000, 1, '2017-08-05', NULL),
(25, NULL, 6, 54080, 1, '2017-08-05', NULL),
(26, NULL, 6, 56250, 1, '2017-08-05', NULL),
(27, NULL, 6, 58500, 1, '2017-08-05', NULL),
(28, NULL, 6, 60840, 1, '2017-08-05', NULL),
(29, NULL, 6, 63280, 1, '2017-08-05', NULL),
(30, NULL, 6, 65820, 1, '2017-08-05', NULL),
(31, NULL, 6, 68460, 1, '2017-08-05', NULL),
(32, NULL, 6, 71200, 1, '2017-08-05', NULL),
(33, NULL, 7, 43000, 1, '2017-08-05', NULL),
(34, NULL, 7, 44940, 1, '2017-08-05', NULL),
(35, NULL, 7, 46970, 1, '2017-08-05', NULL),
(36, NULL, 7, 49090, 1, '2017-08-05', NULL),
(37, NULL, 7, 51300, 1, '2017-08-05', NULL),
(38, NULL, 7, 53610, 1, '2017-08-05', NULL),
(39, NULL, 7, 56030, 1, '2017-08-05', NULL),
(40, NULL, 7, 58560, 1, '2017-08-05', NULL),
(41, NULL, 7, 61200, 1, '2017-08-05', NULL),
(42, NULL, 7, 63960, 1, '2017-08-05', NULL),
(43, NULL, 7, 66840, 1, '2017-08-05', NULL),
(44, NULL, 7, 69850, 1, '2017-08-05', NULL),
(45, NULL, 8, 35500, 1, '2017-08-05', NULL),
(46, NULL, 8, 37280, 1, '2017-08-05', NULL),
(47, NULL, 8, 39150, 1, '2017-08-05', NULL),
(48, NULL, 8, 41110, 1, '2017-08-05', NULL),
(49, NULL, 8, 43170, 1, '2017-08-05', NULL),
(50, NULL, 8, 45330, 1, '2017-08-05', NULL),
(51, NULL, 8, 47600, 1, '2017-08-05', NULL),
(52, NULL, 8, 49980, 1, '2017-08-05', NULL),
(53, NULL, 8, 52480, 1, '2017-08-05', NULL),
(54, NULL, 8, 55110, 1, '2017-08-05', NULL),
(55, NULL, 8, 57870, 1, '2017-08-05', NULL),
(56, NULL, 8, 60770, 1, '2017-08-05', NULL),
(57, NULL, 8, 63810, 1, '2017-08-05', NULL),
(58, NULL, 8, 67010, 1, '2017-08-05', NULL),
(59, NULL, 9, 29000, 1, '2017-08-05', NULL),
(60, NULL, 9, 30450, 1, '2017-08-05', NULL),
(61, NULL, 9, 31980, 1, '2017-08-05', NULL),
(62, NULL, 9, 33580, 1, '2017-08-05', NULL),
(63, NULL, 9, 35260, 1, '2017-08-05', NULL),
(64, NULL, 9, 37030, 1, '2017-08-05', NULL),
(65, NULL, 9, 38890, 1, '2017-08-05', NULL),
(66, NULL, 9, 40840, 1, '2017-08-05', NULL),
(67, NULL, 9, 42890, 1, '2017-08-05', NULL),
(68, NULL, 9, 45040, 1, '2017-08-05', NULL),
(69, NULL, 9, 47300, 1, '2017-08-05', NULL),
(70, NULL, 9, 49670, 1, '2017-08-05', NULL),
(71, NULL, 9, 52160, 1, '2017-08-05', NULL),
(72, NULL, 9, 54770, 1, '2017-08-05', NULL),
(73, NULL, 9, 57510, 1, '2017-08-05', NULL),
(74, NULL, 9, 60390, 1, '2017-08-05', NULL),
(75, NULL, 9, 63410, 1, '2017-08-05', NULL),
(76, NULL, 10, 23000, 1, '2017-08-05', NULL),
(77, NULL, 10, 24150, 1, '2017-08-05', NULL),
(78, NULL, 10, 25360, 1, '2017-08-05', NULL),
(79, NULL, 10, 26630, 1, '2017-08-05', NULL),
(80, NULL, 10, 27970, 1, '2017-08-05', NULL),
(81, NULL, 10, 29370, 1, '2017-08-05', NULL),
(82, NULL, 10, 30840, 1, '2017-08-05', NULL),
(83, NULL, 10, 32390, 1, '2017-08-05', NULL),
(84, NULL, 10, 34010, 1, '2017-08-05', NULL),
(85, NULL, 10, 35720, 1, '2017-08-05', NULL),
(86, NULL, 10, 37510, 1, '2017-08-05', NULL),
(87, NULL, 10, 39390, 1, '2017-08-05', NULL),
(88, NULL, 10, 41360, 1, '2017-08-05', NULL),
(89, NULL, 10, 43430, 1, '2017-08-05', NULL),
(90, NULL, 10, 45610, 1, '2017-08-05', NULL),
(91, NULL, 10, 47900, 1, '2017-08-05', NULL),
(92, NULL, 10, 50300, 1, '2017-08-05', NULL),
(93, NULL, 10, 52820, 1, '2017-08-05', NULL),
(94, NULL, 10, 55470, 1, '2017-08-05', NULL),
(95, NULL, 11, 22000, 1, '2017-08-05', NULL),
(96, NULL, 11, 23100, 1, '2017-08-05', NULL),
(97, NULL, 11, 24260, 1, '2017-08-05', NULL),
(98, NULL, 11, 25480, 1, '2017-08-05', NULL),
(99, NULL, 11, 26760, 1, '2017-08-05', NULL),
(100, NULL, 11, 28100, 1, '2017-08-05', NULL),
(101, NULL, 11, 29510, 1, '2017-08-05', NULL),
(102, NULL, 11, 30990, 1, '2017-08-05', NULL),
(103, NULL, 11, 32540, 1, '2017-08-05', NULL),
(104, NULL, 11, 34170, 1, '2017-08-05', NULL),
(105, NULL, 11, 35880, 1, '2017-08-05', NULL),
(106, NULL, 11, 37680, 1, '2017-08-05', NULL),
(107, NULL, 11, 39570, 1, '2017-08-05', NULL),
(108, NULL, 11, 41550, 1, '2017-08-05', NULL),
(109, NULL, 11, 43630, 1, '2017-08-05', NULL),
(110, NULL, 11, 45820, 1, '2017-08-05', NULL),
(111, NULL, 11, 48120, 1, '2017-08-05', NULL),
(112, NULL, 11, 50530, 1, '2017-08-05', NULL),
(113, NULL, 11, 53060, 1, '2017-08-05', NULL),
(114, NULL, 12, 16000, 1, '2017-08-05', NULL),
(115, NULL, 12, 16800, 1, '2017-08-05', NULL),
(116, NULL, 12, 17640, 1, '2017-08-05', NULL),
(117, NULL, 12, 18530, 1, '2017-08-05', NULL),
(118, NULL, 12, 19460, 1, '2017-08-05', NULL),
(119, NULL, 12, 20440, 1, '2017-08-05', NULL),
(120, NULL, 12, 21470, 1, '2017-08-05', NULL),
(121, NULL, 12, 22550, 1, '2017-08-05', NULL),
(122, NULL, 12, 23680, 1, '2017-08-05', NULL),
(123, NULL, 12, 24870, 1, '2017-08-05', NULL),
(124, NULL, 12, 26120, 1, '2017-08-05', NULL),
(125, NULL, 12, 27430, 1, '2017-08-05', NULL),
(126, NULL, 12, 28810, 1, '2017-08-05', NULL),
(127, NULL, 12, 30260, 1, '2017-08-05', NULL),
(128, NULL, 12, 31780, 1, '2017-08-05', NULL),
(129, NULL, 12, 33370, 1, '2017-08-05', NULL),
(130, NULL, 12, 35040, 1, '2017-08-05', NULL),
(131, NULL, 12, 36800, 1, '2017-08-05', NULL),
(132, NULL, 12, 38640, 1, '2017-08-05', NULL),
(133, NULL, 13, 18510, 1, '2017-08-05', NULL),
(134, NULL, 13, 1250, 1, '2017-08-06', NULL),
(135, NULL, 13, 13130, 1, '2017-08-06', NULL),
(136, NULL, 13, 14480, 1, '2017-08-06', NULL),
(137, NULL, 13, 15210, 1, '2017-08-06', NULL),
(138, NULL, 13, 15980, 1, '2017-08-06', NULL),
(139, NULL, 13, 16780, 1, '2017-08-06', NULL),
(140, NULL, 13, 17620, 1, '2017-08-06', NULL),
(141, NULL, 13, 19440, 1, '2017-08-06', NULL),
(142, NULL, 13, 20420, 1, '2017-08-06', NULL),
(143, NULL, 13, 21450, 1, '2017-08-06', NULL),
(144, NULL, 13, 22530, 1, '2017-08-06', NULL),
(145, NULL, 13, 23660, 1, '2017-08-06', NULL),
(146, NULL, 13, 24850, 1, '2017-08-06', NULL),
(147, NULL, 13, 26100, 1, '2017-08-06', NULL),
(148, NULL, 13, 27410, 1, '2017-08-06', NULL),
(149, NULL, 13, 28790, 1, '2017-08-06', NULL),
(150, NULL, 13, 30230, 1, '2017-08-06', NULL),
(151, NULL, 14, 11300, 1, '2017-08-06', NULL),
(152, NULL, 14, 11870, 1, '2017-08-06', NULL),
(153, NULL, 14, 12470, 1, '2017-08-06', NULL),
(154, NULL, 14, 13100, 1, '2017-08-06', NULL),
(155, NULL, 14, 13760, 1, '2017-08-06', NULL),
(156, NULL, 14, 14450, 1, '2017-08-06', NULL),
(157, NULL, 14, 15180, 1, '2017-08-06', NULL),
(158, NULL, 14, 15940, 1, '2017-08-06', NULL),
(159, NULL, 14, 16740, 1, '2017-08-06', NULL),
(160, NULL, 14, 17580, 1, '2017-08-06', NULL),
(161, NULL, 14, 18460, 1, '2017-08-06', NULL),
(162, NULL, 14, 19390, 1, '2017-08-06', NULL),
(163, NULL, 14, 20360, 1, '2017-08-06', NULL),
(164, NULL, 14, 21380, 1, '2017-08-06', NULL),
(165, NULL, 14, 22450, 1, '2017-08-06', NULL),
(166, NULL, 14, 23580, 1, '2017-08-06', NULL),
(167, NULL, 14, 24760, 1, '2017-08-06', NULL),
(168, NULL, 14, 26000, 1, '2017-08-06', NULL),
(169, NULL, 14, 27300, 1, '2017-08-06', NULL),
(170, NULL, 15, 11000, 1, '2017-08-06', NULL),
(171, NULL, 15, 11550, 1, '2017-08-06', NULL),
(172, NULL, 15, 12130, 1, '2017-08-06', NULL),
(173, NULL, 15, 12740, 1, '2017-08-06', NULL),
(174, NULL, 15, 13380, 1, '2017-08-06', NULL),
(175, NULL, 15, 14050, 1, '2017-08-06', NULL),
(176, NULL, 15, 14760, 1, '2017-08-06', NULL),
(177, NULL, 15, 15500, 1, '2017-08-06', NULL),
(178, NULL, 15, 16280, 1, '2017-08-06', NULL),
(179, NULL, 15, 17100, 1, '2017-08-06', NULL),
(180, NULL, 15, 17960, 1, '2017-08-06', NULL),
(181, NULL, 15, 18860, 1, '2017-08-06', NULL),
(182, NULL, 15, 19810, 1, '2017-08-06', NULL),
(183, NULL, 15, 20810, 1, '2017-08-06', NULL),
(184, NULL, 15, 21860, 1, '2017-08-06', NULL),
(185, NULL, 15, 22960, 1, '2017-08-06', NULL),
(186, NULL, 15, 24110, 1, '2017-08-06', NULL),
(187, NULL, 15, 25320, 1, '2017-08-06', NULL),
(188, NULL, 15, 26590, 1, '2017-08-06', NULL),
(189, NULL, 16, 10200, 1, '2017-08-06', NULL),
(190, NULL, 16, 10710, 1, '2017-08-06', NULL),
(191, NULL, 16, 11250, 1, '2017-08-06', NULL),
(192, NULL, 16, 11820, 1, '2017-08-06', NULL),
(193, NULL, 16, 12420, 1, '2017-08-06', NULL),
(194, NULL, 16, 13050, 1, '2017-08-06', NULL),
(195, NULL, 16, 13710, 1, '2017-08-06', NULL),
(196, NULL, 16, 14400, 1, '2017-08-06', NULL),
(197, NULL, 16, 15120, 1, '2017-08-06', NULL),
(198, NULL, 16, 15880, 1, '2017-08-06', NULL),
(199, NULL, 16, 16680, 1, '2017-08-06', NULL),
(200, NULL, 16, 17520, 1, '2017-08-06', NULL),
(201, NULL, 16, 18400, 1, '2017-08-06', NULL),
(202, NULL, 16, 19320, 1, '2017-08-06', NULL),
(203, NULL, 16, 20290, 1, '2017-08-06', NULL),
(204, NULL, 16, 21310, 1, '2017-08-06', NULL),
(205, NULL, 16, 22380, 1, '2017-08-06', NULL),
(206, NULL, 16, 23500, 1, '2017-08-06', NULL),
(207, NULL, 16, 24680, 1, '2017-08-06', NULL),
(208, NULL, 17, 9700, 1, '2017-08-06', NULL),
(209, NULL, 17, 10190, 1, '2017-08-06', NULL),
(210, NULL, 17, 10700, 1, '2017-08-06', NULL),
(211, NULL, 17, 11240, 1, '2017-08-06', NULL),
(212, NULL, 17, 11810, 1, '2017-08-06', NULL),
(213, NULL, 17, 12410, 1, '2017-08-06', NULL),
(214, NULL, 17, 13040, 1, '2017-08-06', NULL),
(215, NULL, 17, 13700, 1, '2017-08-06', NULL),
(216, NULL, 17, 14390, 1, '2017-08-06', NULL),
(217, NULL, 17, 15110, 1, '2017-08-06', NULL),
(218, NULL, 17, 15870, 1, '2017-08-06', NULL),
(219, NULL, 17, 16670, 1, '2017-08-06', NULL),
(220, NULL, 17, 17510, 1, '2017-08-06', NULL),
(221, NULL, 17, 18390, 1, '2017-08-06', NULL),
(222, NULL, 17, 19310, 1, '2017-08-06', NULL),
(223, NULL, 17, 20280, 1, '2017-08-06', NULL),
(224, NULL, 17, 21300, 1, '2017-08-06', NULL),
(225, NULL, 17, 22370, 1, '2017-08-06', NULL),
(226, NULL, 17, 23490, 1, '2017-08-06', NULL),
(227, NULL, 18, 9300, 1, '2017-08-06', NULL),
(228, NULL, 18, 9770, 1, '2017-08-06', NULL),
(229, NULL, 18, 10260, 1, '2017-08-06', NULL),
(230, NULL, 18, 10780, 1, '2017-08-06', NULL),
(231, NULL, 18, 11320, 1, '2017-08-06', NULL),
(232, NULL, 18, 11890, 1, '2017-08-06', NULL),
(233, NULL, 18, 12490, 1, '2017-08-06', NULL),
(234, NULL, 18, 13120, 1, '2017-08-06', NULL),
(235, NULL, 18, 13780, 1, '2017-08-06', NULL),
(236, NULL, 18, 14470, 1, '2017-08-06', NULL),
(237, NULL, 18, 15200, 1, '2017-08-06', NULL),
(238, NULL, 18, 15960, 1, '2017-08-06', NULL),
(239, NULL, 18, 16760, 1, '2017-08-06', NULL),
(240, NULL, 18, 17600, 1, '2017-08-06', NULL),
(241, NULL, 18, 18480, 1, '2017-08-06', NULL),
(242, NULL, 18, 19410, 1, '2017-08-06', NULL),
(243, NULL, 18, 20390, 1, '2017-08-06', NULL),
(244, NULL, 18, 21410, 1, '2017-08-06', NULL),
(245, NULL, 18, 22490, 1, '2017-08-06', NULL),
(246, NULL, 19, 10960, 1, '2017-08-06', NULL),
(247, NULL, 19, 11510, 1, '2017-08-06', NULL),
(248, NULL, 19, 12090, 1, '2017-08-06', NULL),
(249, NULL, 19, 12700, 1, '2017-08-06', NULL),
(250, NULL, 19, 13340, 1, '2017-08-06', NULL),
(251, NULL, 19, 14010, 1, '2017-08-06', NULL),
(252, NULL, 19, 14720, 1, '2017-08-06', NULL),
(253, NULL, 19, 15460, 1, '2017-08-06', NULL),
(254, NULL, 19, 16240, 1, '2017-08-06', NULL),
(255, NULL, 19, 17060, 1, '2017-08-06', NULL),
(257, NULL, 19, 18820, 1, '2017-08-06', NULL),
(258, NULL, 19, 19770, 1, '2017-08-06', NULL),
(259, NULL, 19, 20760, 1, '2017-08-06', NULL),
(260, NULL, 19, 21800, 1, '2017-08-06', NULL),
(261, NULL, 20, 8800, 1, '2017-08-06', NULL),
(262, NULL, 20, 9240, 1, '2017-08-06', NULL),
(263, NULL, 20, 9710, 1, '2017-08-06', NULL),
(264, NULL, 20, 10200, 1, '2017-08-06', NULL),
(265, NULL, 20, 10710, 1, '2017-08-06', NULL),
(266, NULL, 20, 11250, 1, '2017-08-06', NULL),
(267, NULL, 20, 11820, 1, '2017-08-06', NULL),
(268, NULL, 20, 12420, 1, '2017-08-06', NULL),
(269, NULL, 20, 13050, 1, '2017-08-06', NULL),
(270, NULL, 20, 13710, 1, '2017-08-06', NULL),
(272, NULL, 20, 14400, 1, '2017-08-06', NULL),
(273, NULL, 20, 15120, 1, '2017-08-06', NULL),
(274, NULL, 20, 15880, 1, '2017-08-06', NULL),
(275, NULL, 20, 16680, 1, '2017-08-06', NULL),
(276, NULL, 20, 17520, 1, '2017-08-06', NULL),
(277, NULL, 20, 18400, 1, '2017-08-06', NULL),
(278, NULL, 20, 19320, 1, '2017-08-06', NULL),
(279, NULL, 20, 20290, 1, '2017-08-06', NULL),
(280, NULL, 21, 8500, 1, '2017-08-06', NULL),
(281, NULL, 21, 8930, 1, '2017-08-06', NULL),
(282, NULL, 21, 9380, 1, '2017-08-06', NULL),
(283, NULL, 21, 9850, 1, '2017-08-06', NULL),
(284, NULL, 21, 10350, 1, '2017-08-06', NULL),
(285, NULL, 21, 10870, 1, '2017-08-06', NULL),
(286, NULL, 21, 11420, 1, '2017-08-06', NULL),
(287, NULL, 21, 12000, 1, '2017-08-06', NULL),
(288, NULL, 21, 12600, 1, '2017-08-06', NULL),
(289, NULL, 21, 13230, 1, '2017-08-06', NULL),
(290, NULL, 21, 13900, 1, '2017-08-06', NULL),
(291, NULL, 21, 14600, 1, '2017-08-06', NULL),
(292, NULL, 21, 15330, 1, '2017-08-06', NULL),
(293, NULL, 21, 16100, 1, '2017-08-06', NULL),
(294, NULL, 21, 16910, 1, '2017-08-06', NULL),
(295, NULL, 21, 17760, 1, '2017-08-06', NULL),
(296, NULL, 21, 18650, 1, '2017-08-06', NULL),
(297, NULL, 21, 19590, 1, '2017-08-06', NULL),
(298, NULL, 21, 20570, 1, '2017-08-06', NULL),
(299, NULL, 22, 8250, 1, '2017-08-06', NULL),
(300, NULL, 22, 8670, 1, '2017-08-06', NULL),
(301, NULL, 22, 9110, 1, '2017-08-06', NULL),
(302, NULL, 22, 9570, 1, '2017-08-06', NULL),
(303, NULL, 22, 10050, 1, '2017-08-07', NULL),
(304, NULL, 22, 10560, 1, '2017-08-07', NULL),
(305, NULL, 22, 11090, 1, '2017-08-07', NULL),
(306, NULL, 22, 11650, 1, '2017-08-07', NULL),
(307, NULL, 22, 12240, 1, '2017-08-07', NULL),
(308, NULL, 22, 12860, 1, '2017-08-07', NULL),
(309, NULL, 22, 13510, 1, '2017-08-07', NULL),
(310, NULL, 22, 14190, 1, '2017-08-07', NULL),
(311, NULL, 22, 14900, 1, '2017-08-07', NULL),
(312, NULL, 22, 15650, 1, '2017-08-07', NULL),
(313, NULL, 22, 16440, 1, '2017-08-07', NULL),
(314, NULL, 22, 17270, 1, '2017-08-07', NULL),
(315, NULL, 22, 18140, 1, '2017-08-07', NULL),
(316, NULL, 22, 19050, 1, '2017-08-07', NULL),
(317, NULL, 22, 20010, 1, '2017-08-07', NULL),
(318, NULL, 20, 21310, 1, '2017-08-28', NULL),
(319, NULL, 19, 17920, 1, '2017-08-28', NULL),
(320, NULL, 29, 2755, 1, '2017-09-28', NULL);

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
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `tax_settings`
--

CREATE TABLE `tax_settings` (
  `id` int(11) NOT NULL,
  `tax_applied_year` date DEFAULT NULL,
  `tax_name` varchar(45) DEFAULT NULL,
  `tax_executable_amount` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `applied_tax_amount` int(11) DEFAULT NULL,
  `monthly_recovery` int(11) DEFAULT NULL,
  `tax_adjustment_for_last_month` int(11) DEFAULT NULL,
  `add_sub` enum('Add','Sub') DEFAULT NULL,
  `created_by` varchar(256) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tax_settings`
--

INSERT INTO `tax_settings` (`id`, `tax_applied_year`, `tax_name`, `tax_executable_amount`, `location_id`, `applied_tax_amount`, `monthly_recovery`, `tax_adjustment_for_last_month`, `add_sub`, `created_by`, `created_at`, `updated_at`) VALUES
(2, '2017-07-19', 'Employee Tax', 250000, 2, 4000, 334, 8, 'Sub', '1', '2017-07-26', '2017-07-26'),
(3, '2017-07-30', 'Employee Tax', 250000, 1, 5000, 416, 8, 'Add', '1', '2017-07-30', '2017-07-30'),
(4, '2017-07-30', 'Employee Tax', 250000, 3, 4000, 334, 8, 'Sub', '1', '2017-07-30', '2017-07-30');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_categories`
--

CREATE TABLE `transaction_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(7) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction_categories`
--

INSERT INTO `transaction_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cash', '2017-10-18', NULL),
(2, 'Check', '2017-10-18', NULL),
(3, 'Others', '2017-10-18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_types`
--

CREATE TABLE `transaction_types` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction_types`
--

INSERT INTO `transaction_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Daily Transaction', '2017-10-18', '0000-00-00'),
(2, 'Opening balance', '2017-10-18', '0000-00-00'),
(3, 'Adjustment', '2017-10-18', '0000-00-00');

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
(1, 2, 'Users', 'index', 1),
(2, 2, 'Users', 'addUser', 1),
(3, 2, 'Users', 'viewUser', 1),
(4, 2, 'Users', 'editUser', 1),
(5, 2, 'Users', 'deleteUser', 1),
(6, 2, 'App', 'array_flatten', 1),
(7, 2, 'Dashboards', 'admin_index', 1),
(8, 2, '#', '#', 1),
(9, 2, 'App', 'current_datetime', 1),
(10, 2, 'App', 'current_date', 1),
(11, 1, 'Employees', 'admin_index', 1),
(12, 2, 'Banks', 'admin_index', 1),
(13, 2, 'Banks', 'admin_view', 1),
(14, 1, 'Employees', 'admin_add', 1),
(15, 1, 'Employees', 'admin_edit', 1),
(16, 1, 'Employees', 'admin_view', 1),
(17, 1, 'Employees', 'admin_delete', 1),
(18, 2, 'SalarySheets', 'admin_delete', 1),
(19, 2, 'SalarySheets', 'admin_index', 1),
(20, 2, 'SalarySheets', 'admin_view', 1),
(21, 2, 'SalarySheets', 'admin_edit', 1),
(22, 2, 'SalarySheets', 'admin_add', 1),
(23, 2, 'UserGroupPermissions', 'index', 1),
(24, 2, 'UserGroupPermissions', 'update', 1),
(25, 1, 'App', 'to_expire_date', 0),
(26, 2, 'App', 'to_expire_date', 1),
(27, 3, 'App', 'to_expire_date', 0),
(28, 4, 'App', 'to_expire_date', 0),
(29, 5, 'App', 'to_expire_date', 0),
(30, 6, 'App', 'to_expire_date', 0),
(31, 2, 'UserGroupPermissions', 'groupWisePermission', 1),
(32, 1, 'Scales', 'admin_delete', 0),
(33, 2, 'Scales', 'admin_delete', 1),
(34, 3, 'Scales', 'admin_delete', 0),
(35, 4, 'Scales', 'admin_delete', 0),
(36, 5, 'Scales', 'admin_delete', 0),
(37, 6, 'Scales', 'admin_delete', 0),
(38, 1, 'Scales', 'admin_edit', 0),
(39, 2, 'Scales', 'admin_edit', 1),
(40, 3, 'Scales', 'admin_edit', 0),
(41, 4, 'Scales', 'admin_edit', 0),
(42, 5, 'Scales', 'admin_edit', 0),
(43, 6, 'Scales', 'admin_edit', 0),
(44, 1, 'Scales', 'admin_add', 0),
(45, 2, 'Scales', 'admin_add', 1),
(46, 3, 'Scales', 'admin_add', 0),
(47, 4, 'Scales', 'admin_add', 0),
(48, 5, 'Scales', 'admin_add', 0),
(49, 6, 'Scales', 'admin_add', 0),
(50, 1, 'Scales', 'admin_view', 0),
(51, 2, 'Scales', 'admin_view', 1),
(52, 3, 'Scales', 'admin_view', 0),
(53, 4, 'Scales', 'admin_view', 0),
(54, 5, 'Scales', 'admin_view', 0),
(55, 6, 'Scales', 'admin_view', 0),
(56, 1, 'Scales', 'admin_index', 0),
(57, 2, 'Scales', 'admin_index', 1),
(58, 3, 'Scales', 'admin_index', 0),
(59, 4, 'Scales', 'admin_index', 0),
(60, 5, 'Scales', 'admin_index', 0),
(61, 6, 'Scales', 'admin_index', 0),
(62, 2, 'UserGroups', 'index\r\n', 1),
(63, 1, 'UserGroups', 'deleteGroup', 0),
(64, 2, 'UserGroups', 'deleteGroup', 1),
(65, 3, 'UserGroups', 'deleteGroup', 0),
(66, 4, 'UserGroups', 'deleteGroup', 0),
(67, 5, 'UserGroups', 'deleteGroup', 0),
(68, 6, 'UserGroups', 'deleteGroup', 0),
(69, 1, 'UserGroups', 'editGroup', 0),
(70, 2, 'UserGroups', 'editGroup', 1),
(71, 3, 'UserGroups', 'editGroup', 0),
(72, 4, 'UserGroups', 'editGroup', 0),
(73, 5, 'UserGroups', 'editGroup', 0),
(74, 6, 'UserGroups', 'editGroup', 0),
(75, 1, 'UserGroups', 'addGroup', 0),
(76, 2, 'UserGroups', 'addGroup', 1),
(77, 3, 'UserGroups', 'addGroup', 0),
(78, 4, 'UserGroups', 'addGroup', 0),
(79, 5, 'UserGroups', 'addGroup', 0),
(80, 6, 'UserGroups', 'addGroup', 0),
(81, 1, 'UserGroups', 'index', 0),
(82, 2, 'UserGroups', 'index', 1),
(83, 3, 'UserGroups', 'index', 0),
(84, 4, 'UserGroups', 'index', 0),
(85, 5, 'UserGroups', 'index', 0),
(86, 6, 'UserGroups', 'index', 0),
(87, 1, 'LoanTypes', 'admin_index', 1),
(88, 1, 'LoanTypes', 'admin_view', 1),
(89, 1, 'LoanTypes', 'admin_edit', 1),
(90, 1, 'LoanTypes', 'admin_delete', 1),
(91, 1, 'LoanTypes', 'admin_add', 1),
(92, 1, 'Loans', 'admin_index', 1),
(93, 1, 'Loans', 'admin_view', 1),
(94, 1, 'Loans', 'admin_edit', 1),
(95, 1, 'Loans', 'admin_delete', 1),
(96, 1, 'Loans', 'admin_add', 1),
(97, 1, 'EmployeeLoans', 'admin_index', 1),
(98, 1, 'EmployeeLoans', 'admin_add', 1),
(99, 1, 'EmployeeLoans', 'admin_edit', 1),
(100, 1, 'EmployeeLoans', 'admin_delete', 1),
(101, 1, 'EmployeeLoans', 'admin_view', 1),
(102, 1, 'Months', 'admin_add', 1),
(103, 1, 'Months', 'admin_edit', 1),
(104, 1, 'Months', 'admin_index', 1),
(105, 1, 'Months', 'admin_view', 1),
(106, 1, 'Months', 'admin_delete', 1),
(107, 1, 'FiscalYears', 'admin_index', 1),
(108, 1, 'FiscalYears', 'admin_edit', 1),
(109, 1, 'FiscalYears', 'admin_view', 1),
(110, 1, 'FiscalYears', 'admin_delete', 1),
(111, 1, 'FiscalYears', 'admin_add', 1),
(112, 1, 'FiscalYearSettings', 'admin_index', 1),
(113, 1, 'FiscalYearSettings', 'admin_edit', 1),
(114, 1, 'FiscalYearSettings', 'admin_delete', 1),
(115, 1, 'FiscalYearSettings', 'admin_view', 1),
(116, 1, 'FiscalYearSettings', 'admin_add', 1),
(117, 1, 'EmployeeHouseRentSettings', 'admin_index', 1),
(118, 1, 'EmployeeHouseRentSettings', 'admin_add', 1),
(119, 1, 'EmployeeHouseRentSettings', 'admin_edit', 1),
(120, 1, 'EmployeeHouseRentSettings', 'admin_delete', 1),
(121, 1, 'EmployeeHouseRentSettings', 'admin_view', 1),
(122, 1, 'ConfigMetas', 'admin_index', 1),
(123, 1, 'ConfigMetas', 'admin_add', 1),
(124, 1, 'ConfigMetas', 'admin_edit', 1),
(125, 1, 'ConfigMetas', 'admin_delete', 1),
(126, 1, 'ConfigMetas', 'admin_view', 1),
(127, 1, 'BankInfos', 'admin_add', 1),
(128, 1, 'BankInfos', 'admin_index', 1),
(129, 1, 'BankInfos', 'admin_view', 1),
(130, 1, 'BankInfos', 'admin_edit', 1),
(131, 1, 'BankInfos', 'admin_delete', 1),
(132, 1, 'Basics', 'admin_add', 1),
(133, 1, 'Basics', 'admin_edit', 1),
(134, 1, 'Basics', 'admin_index', 1),
(135, 1, 'Basics', 'admin_view', 1),
(136, 1, 'Basics', 'admin_delete', 1),
(137, 1, 'Departments', 'admin_add', 1),
(138, 1, 'Departments', 'admin_edit', 1),
(139, 1, 'Departments', 'admin_view', 1),
(140, 1, 'Departments', 'admin_index', 1),
(141, 1, 'Departments', 'admin_delete', 1),
(142, 1, 'Banks', 'admin_add', 1),
(143, 1, 'Banks', 'admin_index', 1),
(144, 1, 'Banks', 'admin_view', 1),
(145, 1, 'Banks', 'admin_edit', 1),
(146, 1, 'Banks', 'admin_delete', 1),
(147, 1, 'Designations', 'admin_add', 1),
(148, 1, 'Designations', 'admin_index', 1),
(149, 1, 'Designations', 'admin_edit', 1),
(150, 1, 'Designations', 'admin_view', 1),
(151, 1, 'Designations', 'admin_delete', 1),
(152, 1, 'EduStatuses', 'admin_add', 1),
(153, 1, 'EduStatuses', 'admin_index', 1),
(154, 1, 'EduStatuses', 'admin_edit', 1),
(155, 1, 'EduStatuses', 'admin_view', 1),
(156, 1, 'EduStatuses', 'admin_delete', 1),
(157, 1, 'EmployeeGrades', 'admin_add', 1),
(158, 1, 'EmployeeGrades', 'admin_index', 1),
(159, 1, 'EmployeeGrades', 'admin_edit', 1),
(160, 1, 'EmployeeGrades', 'admin_view', 1),
(161, 1, 'EmployeeGrades', 'admin_delete', 1),
(162, 1, 'EmployeeTypes', 'admin_add', 1),
(163, 1, 'EmployeeTypes', 'admin_index', 1),
(164, 1, 'EmployeeTypes', 'admin_view', 1),
(165, 1, 'EmployeeTypes', 'admin_edit', 1),
(166, 1, 'EmployeeTypes', 'admin_delete', 1),
(167, 1, 'JobStatuses', 'admin_add', 1),
(168, 1, 'JobStatuses', 'admin_index', 1),
(169, 1, 'JobStatuses', 'admin_view', 1),
(170, 1, 'JobStatuses', 'admin_edit', 1),
(171, 1, 'JobStatuses', 'admin_delete', 1),
(172, 1, 'LivingStatuses', 'admin_add', 1),
(173, 1, 'LivingStatuses', 'admin_index', 1),
(174, 1, 'LivingStatuses', 'admin_view', 1),
(175, 1, 'LivingStatuses', 'admin_edit', 1),
(176, 1, 'LivingStatuses', 'admin_delete', 1),
(177, 1, 'LoanRecoveries', 'admin_index', 1),
(178, 1, 'MaritalStatuses', 'admin_add', 1),
(179, 1, 'MaritalStatuses', 'admin_index', 1),
(180, 1, 'MaritalStatuses', 'admin_view', 1),
(181, 1, 'MaritalStatuses', 'admin_edit', 1),
(182, 1, 'MaritalStatuses', 'admin_delete', 1),
(183, 1, 'MonthlyAttendanceEntries', 'admin_add', 1),
(184, 1, 'MonthlyAttendanceEntries', 'admin_index', 1),
(185, 1, 'MonthlyAttendanceEntries', 'admin_view', 1),
(186, 1, 'MonthlyAttendanceEntries', 'admin_edit', 1),
(187, 1, 'MonthlyAttendanceEntries', 'admin_delete', 1),
(188, 1, 'NewBasics', 'admin_add', 1),
(189, 1, 'NewBasics', 'admin_index', 1),
(190, 1, 'NewBasics', 'admin_view', 1),
(191, 1, 'NewBasics', 'admin_edit', 1),
(192, 1, 'NewBasics', 'admin_delete', 1),
(193, 1, 'Quotas', 'admin_add', 1),
(194, 1, 'Quotas', 'admin_index', 1),
(195, 1, 'Quotas', 'admin_view', 1),
(196, 1, 'Quotas', 'admin_edit', 1),
(197, 1, 'Quotas', 'admin_delete', 1),
(198, 1, 'Religions', 'admin_add', 1),
(199, 1, 'Religions', 'admin_index', 1),
(200, 1, 'Religions', 'admin_view', 1),
(201, 1, 'Religions', 'admin_edit', 1),
(202, 1, 'Religions', 'admin_delete', 1),
(203, 1, 'Religions', 'admin_add', 1),
(204, 1, 'Religions', 'admin_index', 1),
(205, 1, 'Religions', 'admin_view', 1),
(206, 1, 'Religions', 'admin_edit', 1),
(207, 1, 'Religions', 'admin_delete', 1),
(208, 1, 'SalarySheets', 'admin_add', 1),
(209, 1, 'SalarySheets', 'admin_index', 1),
(210, 1, 'SalarySheets', 'admin_view', 1),
(211, 1, 'SalarySheets', 'admin_edit', 1),
(212, 1, 'SalarySheets', 'admin_delete', 1),
(213, 1, 'Scales', 'admin_add', 1),
(214, 1, 'Scales', 'admin_index', 1),
(215, 1, 'Scales', 'admin_view', 1),
(216, 1, 'Scales', 'admin_edit', 1),
(217, 1, 'Scales', 'admin_delete', 1),
(218, 1, 'Sexes', 'admin_add', 1),
(219, 1, 'Sexes', 'admin_index', 1),
(220, 1, 'Sexes', 'admin_view', 1),
(221, 1, 'Sexes', 'admin_edit', 1),
(222, 1, 'Sexes', 'admin_delete', 1),
(223, 1, 'TaxSettings', 'admin_add', 1),
(224, 1, 'TaxSettings', 'admin_index', 1),
(225, 1, 'TaxSettings', 'admin_view', 1),
(226, 1, 'TaxSettings', 'admin_edit', 1),
(227, 1, 'TaxSettings', 'admin_delete', 1),
(228, 1, 'WarterSupplySettings', 'admin_add', 1),
(229, 1, 'WarterSupplySettings', 'admin_index', 1),
(230, 1, 'WarterSupplySettings', 'admin_view', 1),
(231, 1, 'WarterSupplySettings', 'admin_edit', 1),
(232, 1, 'WarterSupplySettings', 'admin_delete', 1),
(233, 1, 'EmployeeSalarySheets', 'admin_index', 1),
(234, 1, 'SalarySheets', 'admin_index', 1),
(235, 1, 'SalarySheets', 'admin_add', 1),
(236, 1, 'LoanRecoveries', 'admin_index', 1),
(237, 1, 'MonthlySalaryNotes', 'admin_index', 1),
(238, 1, 'MonthlySalaryNotes', 'admin_add', 1),
(239, 1, 'MonthlySalaryNotes', 'admin_print_view', 1),
(240, 1, 'SalaryCertificates', 'admin_index', 1),
(241, 1, 'SalaryCertificates', 'admin_print_view', 1),
(242, 1, 'SallarySummarySheets', 'admin_index', 1),
(243, 1, 'OtherRegisters', 'admin_index', 1),
(244, 1, 'EmployeeBonuses', 'admin_index', 1),
(245, 1, 'EmployeeBonuses', 'admin_show_bonus', 1),
(246, 1, 'DueSalarySheets', 'admin_index', 1),
(247, 1, 'DueSalarySheets', 'admin_add', 1),
(248, 1, 'MonthlyOthersEnties', 'admin_add', 1),
(249, 1, 'EmployeeTaxes', 'admin_index', 1),
(250, 1, 'ContructorAdvancePayments', 'admin_edit', 1),
(251, 2, 'ContructorAdvancePayments', 'admin_edit', 0),
(252, 3, 'ContructorAdvancePayments', 'admin_edit', 0),
(253, 4, 'ContructorAdvancePayments', 'admin_edit', 0),
(254, 5, 'ContructorAdvancePayments', 'admin_edit', 0),
(255, 6, 'ContructorAdvancePayments', 'admin_edit', 0),
(256, 1, 'ContructorAdvancePayments', 'admin_add', 1),
(257, 2, 'ContructorAdvancePayments', 'admin_add', 0),
(258, 3, 'ContructorAdvancePayments', 'admin_add', 0),
(259, 4, 'ContructorAdvancePayments', 'admin_add', 0),
(260, 5, 'ContructorAdvancePayments', 'admin_add', 0),
(261, 6, 'ContructorAdvancePayments', 'admin_add', 0),
(262, 1, 'ContructorAdvancePayments', 'admin_index', 1),
(263, 2, 'ContructorAdvancePayments', 'admin_index', 0),
(264, 3, 'ContructorAdvancePayments', 'admin_index', 0),
(265, 4, 'ContructorAdvancePayments', 'admin_index', 0),
(266, 5, 'ContructorAdvancePayments', 'admin_index', 0),
(267, 6, 'ContructorAdvancePayments', 'admin_index', 0),
(268, 1, 'ContructorBillPayments', 'admin_index', 1),
(269, 2, 'ContructorBillPayments', 'admin_index', 0),
(270, 3, 'ContructorBillPayments', 'admin_index', 0),
(271, 4, 'ContructorBillPayments', 'admin_index', 0),
(272, 5, 'ContructorBillPayments', 'admin_index', 0),
(273, 6, 'ContructorBillPayments', 'admin_index', 0),
(274, 1, 'ContructorBillPayments', 'admin_add', 1),
(275, 2, 'ContructorBillPayments', 'admin_add', 0),
(276, 3, 'ContructorBillPayments', 'admin_add', 0),
(277, 4, 'ContructorBillPayments', 'admin_add', 0),
(278, 5, 'ContructorBillPayments', 'admin_add', 0),
(279, 6, 'ContructorBillPayments', 'admin_add', 0),
(280, 1, 'ContructorBillPayments', 'admin_edit', 1),
(281, 2, 'ContructorBillPayments', 'admin_edit', 0),
(282, 3, 'ContructorBillPayments', 'admin_edit', 0),
(283, 4, 'ContructorBillPayments', 'admin_edit', 0),
(284, 5, 'ContructorBillPayments', 'admin_edit', 0),
(285, 6, 'ContructorBillPayments', 'admin_edit', 0),
(286, 1, 'ContructorCertificates', 'admin_index', 1),
(287, 2, 'ContructorCertificates', 'admin_index', 0),
(288, 3, 'ContructorCertificates', 'admin_index', 0),
(289, 4, 'ContructorCertificates', 'admin_index', 0),
(290, 5, 'ContructorCertificates', 'admin_index', 0),
(291, 6, 'ContructorCertificates', 'admin_index', 0),
(292, 1, 'ContructorLedgers', 'admin_index', 1),
(293, 2, 'ContructorLedgers', 'admin_index', 0),
(294, 3, 'ContructorLedgers', 'admin_index', 0),
(295, 4, 'ContructorLedgers', 'admin_index', 0),
(296, 5, 'ContructorLedgers', 'admin_index', 0),
(297, 6, 'ContructorLedgers', 'admin_index', 0),
(298, 1, 'ContructorNames', 'admin_index', 1),
(299, 2, 'ContructorNames', 'admin_index', 0),
(300, 3, 'ContructorNames', 'admin_index', 0),
(301, 4, 'ContructorNames', 'admin_index', 0),
(302, 5, 'ContructorNames', 'admin_index', 0),
(303, 6, 'ContructorNames', 'admin_index', 0),
(304, 1, 'ContructorNames', 'admin_add', 1),
(305, 2, 'ContructorNames', 'admin_add', 0),
(306, 3, 'ContructorNames', 'admin_add', 0),
(307, 4, 'ContructorNames', 'admin_add', 0),
(308, 5, 'ContructorNames', 'admin_add', 0),
(309, 6, 'ContructorNames', 'admin_add', 0),
(310, 1, 'ContructorNames', 'admin_edit', 1),
(311, 2, 'ContructorNames', 'admin_edit', 0),
(312, 3, 'ContructorNames', 'admin_edit', 0),
(313, 4, 'ContructorNames', 'admin_edit', 0),
(314, 5, 'ContructorNames', 'admin_edit', 0),
(315, 6, 'ContructorNames', 'admin_edit', 0),
(316, 1, 'ContructorProjectNames', 'admin_index', 1),
(317, 2, 'ContructorProjectNames', 'admin_index', 0),
(318, 3, 'ContructorProjectNames', 'admin_index', 0),
(319, 4, 'ContructorProjectNames', 'admin_index', 0),
(320, 5, 'ContructorProjectNames', 'admin_index', 0),
(321, 6, 'ContructorProjectNames', 'admin_index', 0),
(322, 1, 'ContructorProjectNames', 'admin_add', 1),
(323, 2, 'ContructorProjectNames', 'admin_add', 0),
(324, 3, 'ContructorProjectNames', 'admin_add', 0),
(325, 4, 'ContructorProjectNames', 'admin_add', 0),
(326, 5, 'ContructorProjectNames', 'admin_add', 0),
(327, 6, 'ContructorProjectNames', 'admin_add', 0),
(328, 1, 'ContructorProjectNames', 'admin_edit', 1),
(329, 2, 'ContructorProjectNames', 'admin_edit', 0),
(330, 3, 'ContructorProjectNames', 'admin_edit', 0),
(331, 4, 'ContructorProjectNames', 'admin_edit', 0),
(332, 5, 'ContructorProjectNames', 'admin_edit', 0),
(333, 6, 'ContructorProjectNames', 'admin_edit', 0),
(334, 1, 'WorkOrders', 'admin_index', 1),
(335, 2, 'WorkOrders', 'admin_index', 0),
(336, 3, 'WorkOrders', 'admin_index', 0),
(337, 4, 'WorkOrders', 'admin_index', 0),
(338, 5, 'WorkOrders', 'admin_index', 0),
(339, 6, 'WorkOrders', 'admin_index', 0),
(340, 1, 'WorkOrders', 'admin_add', 1),
(341, 2, 'WorkOrders', 'admin_add', 0),
(342, 3, 'WorkOrders', 'admin_add', 0),
(343, 4, 'WorkOrders', 'admin_add', 0),
(344, 5, 'WorkOrders', 'admin_add', 0),
(345, 6, 'WorkOrders', 'admin_add', 0),
(346, 1, 'WorkOrders', 'admin_edit', 1),
(347, 2, 'WorkOrders', 'admin_edit', 0),
(348, 3, 'WorkOrders', 'admin_edit', 0),
(349, 4, 'WorkOrders', 'admin_edit', 0),
(350, 5, 'WorkOrders', 'admin_edit', 0),
(351, 6, 'WorkOrders', 'admin_edit', 0),
(352, 1, 'SecurityDepositeReturns', 'admin_index', 1),
(353, 2, 'SecurityDepositeReturns', 'admin_index', 0),
(354, 3, 'SecurityDepositeReturns', 'admin_index', 0),
(355, 4, 'SecurityDepositeReturns', 'admin_index', 0),
(356, 5, 'SecurityDepositeReturns', 'admin_index', 0),
(357, 6, 'SecurityDepositeReturns', 'admin_index', 0),
(358, 1, 'SecurityDepositeReturns', 'admin_add', 1),
(359, 2, 'SecurityDepositeReturns', 'admin_add', 0),
(360, 3, 'SecurityDepositeReturns', 'admin_add', 0),
(361, 4, 'SecurityDepositeReturns', 'admin_add', 0),
(362, 5, 'SecurityDepositeReturns', 'admin_add', 0),
(363, 6, 'SecurityDepositeReturns', 'admin_add', 0),
(364, 1, 'SecurityDepositeReturns', 'admin_edit', 1),
(365, 2, 'SecurityDepositeReturns', 'admin_edit', 0),
(366, 3, 'SecurityDepositeReturns', 'admin_edit', 0),
(367, 4, 'SecurityDepositeReturns', 'admin_edit', 0),
(368, 5, 'SecurityDepositeReturns', 'admin_edit', 0),
(369, 6, 'SecurityDepositeReturns', 'admin_edit', 0),
(370, 1, 'AccEffects', 'admin_edit', 1),
(371, 2, 'AccEffects', 'admin_edit', 0),
(372, 3, 'AccEffects', 'admin_edit', 0),
(373, 4, 'AccEffects', 'admin_edit', 0),
(374, 5, 'AccEffects', 'admin_edit', 0),
(375, 6, 'AccEffects', 'admin_edit', 0),
(376, 1, 'AccEffects', 'admin_add', 1),
(377, 2, 'AccEffects', 'admin_add', 0),
(378, 3, 'AccEffects', 'admin_add', 0),
(379, 4, 'AccEffects', 'admin_add', 0),
(380, 5, 'AccEffects', 'admin_add', 0),
(381, 6, 'AccEffects', 'admin_add', 0),
(382, 1, 'AccEffects', 'admin_index', 1),
(383, 2, 'AccEffects', 'admin_index', 0),
(384, 3, 'AccEffects', 'admin_index', 0),
(385, 4, 'AccEffects', 'admin_index', 0),
(386, 5, 'AccEffects', 'admin_index', 0),
(387, 6, 'AccEffects', 'admin_index', 0),
(388, 1, 'AccHeadLists', 'admin_index', 1),
(389, 2, 'AccHeadLists', 'admin_index', 0),
(390, 3, 'AccHeadLists', 'admin_index', 0),
(391, 4, 'AccHeadLists', 'admin_index', 0),
(392, 5, 'AccHeadLists', 'admin_index', 0),
(393, 6, 'AccHeadLists', 'admin_index', 0),
(394, 1, 'AccHeadLists', 'admin_view', 0),
(395, 2, 'AccHeadLists', 'admin_view', 0),
(396, 3, 'AccHeadLists', 'admin_view', 0),
(397, 4, 'AccHeadLists', 'admin_view', 0),
(398, 5, 'AccHeadLists', 'admin_view', 0),
(399, 6, 'AccHeadLists', 'admin_view', 0),
(400, 1, 'AccHeadLists', 'admin_edit', 1),
(401, 2, 'AccHeadLists', 'admin_edit', 0),
(402, 3, 'AccHeadLists', 'admin_edit', 0),
(403, 4, 'AccHeadLists', 'admin_edit', 0),
(404, 5, 'AccHeadLists', 'admin_edit', 0),
(405, 6, 'AccHeadLists', 'admin_edit', 0),
(406, 1, 'AccHeadTypes', 'admin_index', 1),
(407, 2, 'AccHeadTypes', 'admin_index', 0),
(408, 3, 'AccHeadTypes', 'admin_index', 0),
(409, 4, 'AccHeadTypes', 'admin_index', 0),
(410, 5, 'AccHeadTypes', 'admin_index', 0),
(411, 6, 'AccHeadTypes', 'admin_index', 0),
(412, 1, 'AccHeadTypes', 'admin_add', 1),
(413, 2, 'AccHeadTypes', 'admin_add', 0),
(414, 3, 'AccHeadTypes', 'admin_add', 0),
(415, 4, 'AccHeadTypes', 'admin_add', 0),
(416, 5, 'AccHeadTypes', 'admin_add', 0),
(417, 6, 'AccHeadTypes', 'admin_add', 0),
(418, 1, 'AccHeadTypes', 'admin_edit', 1),
(419, 2, 'AccHeadTypes', 'admin_edit', 0),
(420, 3, 'AccHeadTypes', 'admin_edit', 0),
(421, 4, 'AccHeadTypes', 'admin_edit', 0),
(422, 5, 'AccHeadTypes', 'admin_edit', 0),
(423, 6, 'AccHeadTypes', 'admin_edit', 0),
(424, 1, 'AccHeadLists', 'admin_add', 1),
(425, 2, 'AccHeadLists', 'admin_add', 0),
(426, 3, 'AccHeadLists', 'admin_add', 0),
(427, 4, 'AccHeadLists', 'admin_add', 0),
(428, 5, 'AccHeadLists', 'admin_add', 0),
(429, 6, 'AccHeadLists', 'admin_add', 0),
(430, 1, 'DailyTransactions', 'admin_index', 1),
(431, 2, 'DailyTransactions', 'admin_index', 0),
(432, 3, 'DailyTransactions', 'admin_index', 0),
(433, 4, 'DailyTransactions', 'admin_index', 0),
(434, 5, 'DailyTransactions', 'admin_index', 0),
(435, 6, 'DailyTransactions', 'admin_index', 0),
(436, 1, 'DailyTransactions', 'admin_add', 1),
(437, 2, 'DailyTransactions', 'admin_add', 0),
(438, 3, 'DailyTransactions', 'admin_add', 0),
(439, 4, 'DailyTransactions', 'admin_add', 0),
(440, 5, 'DailyTransactions', 'admin_add', 0),
(441, 6, 'DailyTransactions', 'admin_add', 0),
(442, 1, 'DailyTransactions', 'admin_edit', 1),
(443, 2, 'DailyTransactions', 'admin_edit', 0),
(444, 3, 'DailyTransactions', 'admin_edit', 0),
(445, 4, 'DailyTransactions', 'admin_edit', 0),
(446, 5, 'DailyTransactions', 'admin_edit', 0),
(447, 6, 'DailyTransactions', 'admin_edit', 0),
(448, 1, 'OpeningBalances', 'admin_index', 1),
(449, 2, 'OpeningBalances', 'admin_index', 0),
(450, 3, 'OpeningBalances', 'admin_index', 0),
(451, 4, 'OpeningBalances', 'admin_index', 0),
(452, 5, 'OpeningBalances', 'admin_index', 0),
(453, 6, 'OpeningBalances', 'admin_index', 0),
(454, 1, 'TrialBalances', 'admin_index', 1),
(455, 2, 'TrialBalances', 'admin_index', 0),
(456, 3, 'TrialBalances', 'admin_index', 0),
(457, 4, 'TrialBalances', 'admin_index', 0),
(458, 5, 'TrialBalances', 'admin_index', 0),
(459, 6, 'TrialBalances', 'admin_index', 0),
(460, 1, 'BankAccounts', 'admin_edit', 1),
(461, 2, 'BankAccounts', 'admin_edit', 0),
(462, 3, 'BankAccounts', 'admin_edit', 0),
(463, 4, 'BankAccounts', 'admin_edit', 0),
(464, 5, 'BankAccounts', 'admin_edit', 0),
(465, 6, 'BankAccounts', 'admin_edit', 0),
(466, 1, 'BankAccounts', 'admin_add', 1),
(467, 2, 'BankAccounts', 'admin_add', 0),
(468, 3, 'BankAccounts', 'admin_add', 0),
(469, 4, 'BankAccounts', 'admin_add', 0),
(470, 5, 'BankAccounts', 'admin_add', 0),
(471, 6, 'BankAccounts', 'admin_add', 0),
(472, 1, 'BankAccounts', 'admin_index', 1),
(473, 2, 'BankAccounts', 'admin_index', 0),
(474, 3, 'BankAccounts', 'admin_index', 0),
(475, 4, 'BankAccounts', 'admin_index', 0),
(476, 5, 'BankAccounts', 'admin_index', 0),
(477, 6, 'BankAccounts', 'admin_index', 0),
(478, 1, 'Branches', 'admin_index', 1),
(479, 2, 'Branches', 'admin_index', 0),
(480, 3, 'Branches', 'admin_index', 0),
(481, 4, 'Branches', 'admin_index', 0),
(482, 5, 'Branches', 'admin_index', 0),
(483, 6, 'Branches', 'admin_index', 0),
(484, 1, 'Branches', 'admin_view', 1),
(485, 2, 'Branches', 'admin_view', 0),
(486, 3, 'Branches', 'admin_view', 0),
(487, 4, 'Branches', 'admin_view', 0),
(488, 5, 'Branches', 'admin_view', 0),
(489, 6, 'Branches', 'admin_view', 0),
(490, 1, 'Branches', 'admin_add', 1),
(491, 2, 'Branches', 'admin_add', 0),
(492, 3, 'Branches', 'admin_add', 0),
(493, 4, 'Branches', 'admin_add', 0),
(494, 5, 'Branches', 'admin_add', 0),
(495, 6, 'Branches', 'admin_add', 0),
(496, 1, 'Branches', 'admin_edit', 1),
(497, 2, 'Branches', 'admin_edit', 0),
(498, 3, 'Branches', 'admin_edit', 0),
(499, 4, 'Branches', 'admin_edit', 0),
(500, 5, 'Branches', 'admin_edit', 0),
(501, 6, 'Branches', 'admin_edit', 0),
(502, 1, 'LoanAdjustments', 'admin_index', 1),
(503, 2, 'LoanAdjustments', 'admin_index', 0),
(504, 3, 'LoanAdjustments', 'admin_index', 0),
(505, 4, 'LoanAdjustments', 'admin_index', 0),
(506, 5, 'LoanAdjustments', 'admin_index', 0),
(507, 6, 'LoanAdjustments', 'admin_index', 0),
(508, 1, 'LoanAdjustments', 'admin_add', 1),
(509, 2, 'LoanAdjustments', 'admin_add', 0),
(510, 3, 'LoanAdjustments', 'admin_add', 0),
(511, 4, 'LoanAdjustments', 'admin_add', 0),
(512, 5, 'LoanAdjustments', 'admin_add', 0),
(513, 6, 'LoanAdjustments', 'admin_add', 0),
(514, 1, 'AnnualDepriciations', 'admin_index', 1),
(515, 2, 'AnnualDepriciations', 'admin_index', 0),
(516, 3, 'AnnualDepriciations', 'admin_index', 0),
(517, 4, 'AnnualDepriciations', 'admin_index', 0),
(518, 5, 'AnnualDepriciations', 'admin_index', 0),
(519, 6, 'AnnualDepriciations', 'admin_index', 0),
(520, 1, 'AnnualDepriciations', 'admin_add', 1),
(521, 2, 'AnnualDepriciations', 'admin_add', 0),
(522, 3, 'AnnualDepriciations', 'admin_add', 0),
(523, 4, 'AnnualDepriciations', 'admin_add', 0),
(524, 5, 'AnnualDepriciations', 'admin_add', 0),
(525, 6, 'AnnualDepriciations', 'admin_add', 0),
(526, 1, 'AnnualDepriciations', 'admin_edit', 1),
(527, 2, 'AnnualDepriciations', 'admin_edit', 0),
(528, 3, 'AnnualDepriciations', 'admin_edit', 0),
(529, 4, 'AnnualDepriciations', 'admin_edit', 0),
(530, 5, 'AnnualDepriciations', 'admin_edit', 0),
(531, 6, 'AnnualDepriciations', 'admin_edit', 0),
(532, 1, 'CashBookReports', 'admin_index', 1),
(533, 2, 'CashBookReports', 'admin_index', 0),
(534, 3, 'CashBookReports', 'admin_index', 0),
(535, 4, 'CashBookReports', 'admin_index', 0),
(536, 5, 'CashBookReports', 'admin_index', 0),
(537, 6, 'CashBookReports', 'admin_index', 0),
(538, 1, 'CashBookReports', 'admin_get_cash_book_reports', 1),
(539, 2, 'CashBookReports', 'admin_get_cash_book_reports', 0),
(540, 3, 'CashBookReports', 'admin_get_cash_book_reports', 0),
(541, 4, 'CashBookReports', 'admin_get_cash_book_reports', 0),
(542, 5, 'CashBookReports', 'admin_get_cash_book_reports', 0),
(543, 6, 'CashBookReports', 'admin_get_cash_book_reports', 0),
(544, 1, 'IncomeExpenseReports', 'admin_index', 1),
(545, 2, 'IncomeExpenseReports', 'admin_index', 0),
(546, 3, 'IncomeExpenseReports', 'admin_index', 0),
(547, 4, 'IncomeExpenseReports', 'admin_index', 0),
(548, 5, 'IncomeExpenseReports', 'admin_index', 0),
(549, 6, 'IncomeExpenseReports', 'admin_index', 0),
(550, 1, 'LedgerReports', 'admin_index', 1),
(551, 2, 'LedgerReports', 'admin_index', 0),
(552, 3, 'LedgerReports', 'admin_index', 0),
(553, 4, 'LedgerReports', 'admin_index', 0),
(554, 5, 'LedgerReports', 'admin_index', 0),
(555, 6, 'LedgerReports', 'admin_index', 0),
(556, 1, 'LedgerReports', 'admin_get_main_head', 1),
(557, 2, 'LedgerReports', 'admin_get_main_head', 0),
(558, 3, 'LedgerReports', 'admin_get_main_head', 0),
(559, 4, 'LedgerReports', 'admin_get_main_head', 0),
(560, 5, 'LedgerReports', 'admin_get_main_head', 0),
(561, 6, 'LedgerReports', 'admin_get_main_head', 0),
(562, 1, 'LedgerReports', 'admin_get_sub_head', 1),
(563, 2, 'LedgerReports', 'admin_get_sub_head', 0),
(564, 3, 'LedgerReports', 'admin_get_sub_head', 0),
(565, 4, 'LedgerReports', 'admin_get_sub_head', 0),
(566, 5, 'LedgerReports', 'admin_get_sub_head', 0),
(567, 6, 'LedgerReports', 'admin_get_sub_head', 0),
(568, 1, 'LedgerReports', 'admin_get_ledger_reports', 1),
(569, 2, 'LedgerReports', 'admin_get_ledger_reports', 0),
(570, 3, 'LedgerReports', 'admin_get_ledger_reports', 0),
(571, 4, 'LedgerReports', 'admin_get_ledger_reports', 0),
(572, 5, 'LedgerReports', 'admin_get_ledger_reports', 0),
(573, 6, 'LedgerReports', 'admin_get_ledger_reports', 0),
(574, 1, 'ReceiptPaymentReports', 'admin_index', 1),
(575, 2, 'ReceiptPaymentReports', 'admin_index', 0),
(576, 3, 'ReceiptPaymentReports', 'admin_index', 0),
(577, 4, 'ReceiptPaymentReports', 'admin_index', 0),
(578, 5, 'ReceiptPaymentReports', 'admin_index', 0),
(579, 6, 'ReceiptPaymentReports', 'admin_index', 0),
(580, 1, 'BalanceSheets', 'admin_index', 1),
(581, 2, 'BalanceSheets', 'admin_index', 0),
(582, 3, 'BalanceSheets', 'admin_index', 0),
(583, 4, 'BalanceSheets', 'admin_index', 0),
(584, 5, 'BalanceSheets', 'admin_index', 0),
(585, 6, 'BalanceSheets', 'admin_index', 0),
(586, 1, 'YearClosingBalanceDetails', 'admin_index', 1),
(587, 2, 'YearClosingBalanceDetails', 'admin_index', 0),
(588, 3, 'YearClosingBalanceDetails', 'admin_index', 0),
(589, 4, 'YearClosingBalanceDetails', 'admin_index', 0),
(590, 5, 'YearClosingBalanceDetails', 'admin_index', 0),
(591, 6, 'YearClosingBalanceDetails', 'admin_index', 0),
(592, 1, 'YearCloseGpsSubscriptions', 'admin_index', 1),
(593, 2, 'YearCloseGpsSubscriptions', 'admin_index', 0),
(594, 3, 'YearCloseGpsSubscriptions', 'admin_index', 0),
(595, 4, 'YearCloseGpsSubscriptions', 'admin_index', 0),
(596, 5, 'YearCloseGpsSubscriptions', 'admin_index', 0),
(597, 6, 'YearCloseGpsSubscriptions', 'admin_index', 0),
(598, 1, 'BudgetCategories', 'admin_add', 1),
(599, 2, 'BudgetCategories', 'admin_add', 0),
(600, 3, 'BudgetCategories', 'admin_add', 0),
(601, 4, 'BudgetCategories', 'admin_add', 0),
(602, 5, 'BudgetCategories', 'admin_add', 0),
(603, 6, 'BudgetCategories', 'admin_add', 0),
(604, 1, 'BudgetCategories', 'admin_view', 1),
(605, 2, 'BudgetCategories', 'admin_view', 0),
(606, 3, 'BudgetCategories', 'admin_view', 0),
(607, 4, 'BudgetCategories', 'admin_view', 0),
(608, 5, 'BudgetCategories', 'admin_view', 0),
(609, 6, 'BudgetCategories', 'admin_view', 0),
(610, 1, 'BudgetCategories', 'admin_index', 1),
(611, 2, 'BudgetCategories', 'admin_index', 0),
(612, 3, 'BudgetCategories', 'admin_index', 0),
(613, 4, 'BudgetCategories', 'admin_index', 0),
(614, 5, 'BudgetCategories', 'admin_index', 0),
(615, 6, 'BudgetCategories', 'admin_index', 0),
(616, 1, 'BudgetHeadLists', 'admin_index', 1),
(617, 2, 'BudgetHeadLists', 'admin_index', 0),
(618, 3, 'BudgetHeadLists', 'admin_index', 0),
(619, 4, 'BudgetHeadLists', 'admin_index', 0),
(620, 5, 'BudgetHeadLists', 'admin_index', 0),
(621, 6, 'BudgetHeadLists', 'admin_index', 0),
(622, 1, 'BudgetHeadLists', 'admin_view', 1),
(623, 2, 'BudgetHeadLists', 'admin_view', 0),
(624, 3, 'BudgetHeadLists', 'admin_view', 0),
(625, 4, 'BudgetHeadLists', 'admin_view', 0),
(626, 5, 'BudgetHeadLists', 'admin_view', 0),
(627, 6, 'BudgetHeadLists', 'admin_view', 0),
(628, 1, 'BudgetHeadLists', 'admin_add', 1),
(629, 2, 'BudgetHeadLists', 'admin_add', 0),
(630, 3, 'BudgetHeadLists', 'admin_add', 0),
(631, 4, 'BudgetHeadLists', 'admin_add', 0),
(632, 5, 'BudgetHeadLists', 'admin_add', 0),
(633, 6, 'BudgetHeadLists', 'admin_add', 0),
(634, 1, 'BudgetReports', 'admin_index', 1),
(635, 2, 'BudgetReports', 'admin_index', 0),
(636, 3, 'BudgetReports', 'admin_index', 0),
(637, 4, 'BudgetReports', 'admin_index', 0),
(638, 5, 'BudgetReports', 'admin_index', 0),
(639, 6, 'BudgetReports', 'admin_index', 0),
(640, 1, 'BudgetSchedules', 'admin_index', 1),
(641, 2, 'BudgetSchedules', 'admin_index', 0),
(642, 3, 'BudgetSchedules', 'admin_index', 0),
(643, 4, 'BudgetSchedules', 'admin_index', 0),
(644, 5, 'BudgetSchedules', 'admin_index', 0),
(645, 6, 'BudgetSchedules', 'admin_index', 0),
(646, 1, 'BudgetSchedules', 'admin_view', 1),
(647, 2, 'BudgetSchedules', 'admin_view', 0),
(648, 3, 'BudgetSchedules', 'admin_view', 0),
(649, 4, 'BudgetSchedules', 'admin_view', 0),
(650, 5, 'BudgetSchedules', 'admin_view', 0),
(651, 6, 'BudgetSchedules', 'admin_view', 0),
(652, 1, 'BudgetSchedules', 'admin_add', 1),
(653, 2, 'BudgetSchedules', 'admin_add', 0),
(654, 3, 'BudgetSchedules', 'admin_add', 0),
(655, 4, 'BudgetSchedules', 'admin_add', 0),
(656, 5, 'BudgetSchedules', 'admin_add', 0),
(657, 6, 'BudgetSchedules', 'admin_add', 0),
(658, 1, 'BudgetTypes', 'admin_index', 1),
(659, 2, 'BudgetTypes', 'admin_index', 0),
(660, 3, 'BudgetTypes', 'admin_index', 0),
(661, 4, 'BudgetTypes', 'admin_index', 0),
(662, 5, 'BudgetTypes', 'admin_index', 0),
(663, 6, 'BudgetTypes', 'admin_index', 0),
(664, 1, 'BudgetTypes', 'admin_view', 1),
(665, 2, 'BudgetTypes', 'admin_view', 0),
(666, 3, 'BudgetTypes', 'admin_view', 0),
(667, 4, 'BudgetTypes', 'admin_view', 0),
(668, 5, 'BudgetTypes', 'admin_view', 0),
(669, 6, 'BudgetTypes', 'admin_view', 0),
(670, 1, 'BudgetTypes', 'admin_add', 1),
(671, 2, 'BudgetTypes', 'admin_add', 0),
(672, 3, 'BudgetTypes', 'admin_add', 0),
(673, 4, 'BudgetTypes', 'admin_add', 0),
(674, 5, 'BudgetTypes', 'admin_add', 0),
(675, 6, 'BudgetTypes', 'admin_add', 0),
(676, 1, 'CreateBudgets', 'admin_index', 1),
(677, 2, 'CreateBudgets', 'admin_index', 0),
(678, 3, 'CreateBudgets', 'admin_index', 0),
(679, 4, 'CreateBudgets', 'admin_index', 0),
(680, 5, 'CreateBudgets', 'admin_index', 0),
(681, 6, 'CreateBudgets', 'admin_index', 0),
(682, 1, 'OpeningBudgets', 'admin_index', 1),
(683, 2, 'OpeningBudgets', 'admin_index', 0),
(684, 3, 'OpeningBudgets', 'admin_index', 0),
(685, 4, 'OpeningBudgets', 'admin_index', 0),
(686, 5, 'OpeningBudgets', 'admin_index', 0),
(687, 6, 'OpeningBudgets', 'admin_index', 0);

-- --------------------------------------------------------

--
-- Table structure for table `warter_supply_setting`
--

CREATE TABLE `warter_supply_setting` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `grade_start` int(11) NOT NULL,
  `grade_end` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `living_status_id` int(10) NOT NULL,
  `water_bill` float NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('Active','Inactive','','') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warter_supply_setting`
--

INSERT INTO `warter_supply_setting` (`id`, `year`, `grade_start`, `grade_end`, `location_id`, `living_status_id`, `water_bill`, `create_date`, `update_date`, `user_id`, `status`) VALUES
(1, 2015, 1, 10, 1, 2, 12, '2017-07-27 14:25:13', '0000-00-00 00:00:00', 1, 'Active'),
(2, 2015, 11, 20, 2, 2, 8, '2017-07-30 16:58:47', '0000-00-00 00:00:00', 1, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `year_closing_balance_details`
--

CREATE TABLE `year_closing_balance_details` (
  `id` int(11) NOT NULL,
  `acc_head_type_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `acc_head_list_id` int(11) NOT NULL,
  `head_balance` decimal(12,2) NOT NULL DEFAULT '0.00',
  `depreciation_rate` tinyint(3) NOT NULL DEFAULT '0',
  `depreciation_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total_receive` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_payment` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fiscal_year_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acc_head_lists`
--
ALTER TABLE `acc_head_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acc_head_types`
--
ALTER TABLE `acc_head_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `annual_depriciations`
--
ALTER TABLE `annual_depriciations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bank_accounts_banks1_idx` (`bank_info_id`);

--
-- Indexes for table `bank_account_balance`
--
ALTER TABLE `bank_account_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_infos`
--
ALTER TABLE `bank_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basics`
--
ALTER TABLE `basics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_categories`
--
ALTER TABLE `budget_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_details`
--
ALTER TABLE `budget_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_head_lists`
--
ALTER TABLE `budget_head_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_schedules`
--
ALTER TABLE `budget_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_types`
--
ALTER TABLE `budget_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_metas`
--
ALTER TABLE `config_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contructor_advance_payments`
--
ALTER TABLE `contructor_advance_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contructor_bill_payments`
--
ALTER TABLE `contructor_bill_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contructor_names`
--
ALTER TABLE `contructor_names`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contructor_project_names`
--
ALTER TABLE `contructor_project_names`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daily_transactions`
--
ALTER TABLE `daily_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deduct_salaries`
--
ALTER TABLE `deduct_salaries`
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
-- Indexes for table `due_salary_sheets`
--
ALTER TABLE `due_salary_sheets`
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
-- Indexes for table `employee_bonus`
--
ALTER TABLE `employee_bonus`
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
-- Indexes for table `employee_house_rent_settings`
--
ALTER TABLE `employee_house_rent_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_loans`
--
ALTER TABLE `employee_loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_loans_06_09`
--
ALTER TABLE `employee_loans_06_09`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_loans_back`
--
ALTER TABLE `employee_loans_back`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_recoveries`
--
ALTER TABLE `employee_recoveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_salary_sheets`
--
ALTER TABLE `employee_salary_sheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_types`
--
ALTER TABLE `employee_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entry_types`
--
ALTER TABLE `entry_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiscal_years`
--
ALTER TABLE `fiscal_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiscal_year_settings`
--
ALTER TABLE `fiscal_year_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fix_deposits`
--
ALTER TABLE `fix_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gpf_subscriptions`
--
ALTER TABLE `gpf_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gpf_subscriptions_06_09_2017`
--
ALTER TABLE `gpf_subscriptions_06_09_2017`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `head_wise_account_balance`
--
ALTER TABLE `head_wise_account_balance`
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
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_recoveries`
--
ALTER TABLE `loan_recoveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_types`
--
ALTER TABLE `loan_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
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
-- Indexes for table `mobile_bill_settings`
--
ALTER TABLE `mobile_bill_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monthly_attendance_entries`
--
ALTER TABLE `monthly_attendance_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monthly_attendance_entry_types`
--
ALTER TABLE `monthly_attendance_entry_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monthly_others`
--
ALTER TABLE `monthly_others`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monthly_others_enties`
--
ALTER TABLE `monthly_others_enties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monthly_others_enties_settings`
--
ALTER TABLE `monthly_others_enties_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monthly_salary_notes`
--
ALTER TABLE `monthly_salary_notes`
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
-- Indexes for table `tax_settings`
--
ALTER TABLE `tax_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_categories`
--
ALTER TABLE `transaction_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_types`
--
ALTER TABLE `transaction_types`
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
-- Indexes for table `warter_supply_setting`
--
ALTER TABLE `warter_supply_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `year_closing_balance_details`
--
ALTER TABLE `year_closing_balance_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acc_head_lists`
--
ALTER TABLE `acc_head_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `acc_head_types`
--
ALTER TABLE `acc_head_types`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `annual_depriciations`
--
ALTER TABLE `annual_depriciations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `bank_account_balance`
--
ALTER TABLE `bank_account_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bank_infos`
--
ALTER TABLE `bank_infos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `basics`
--
ALTER TABLE `basics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `budget_categories`
--
ALTER TABLE `budget_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `budget_details`
--
ALTER TABLE `budget_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `budget_head_lists`
--
ALTER TABLE `budget_head_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `budget_schedules`
--
ALTER TABLE `budget_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `budget_types`
--
ALTER TABLE `budget_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `config_metas`
--
ALTER TABLE `config_metas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `contructor_advance_payments`
--
ALTER TABLE `contructor_advance_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
--
-- AUTO_INCREMENT for table `contructor_bill_payments`
--
ALTER TABLE `contructor_bill_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `contructor_names`
--
ALTER TABLE `contructor_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `contructor_project_names`
--
ALTER TABLE `contructor_project_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `daily_transactions`
--
ALTER TABLE `daily_transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `deduct_salaries`
--
ALTER TABLE `deduct_salaries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `due_salary_sheets`
--
ALTER TABLE `due_salary_sheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `edu_statuses`
--
ALTER TABLE `edu_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;
--
-- AUTO_INCREMENT for table `employee_allowances`
--
ALTER TABLE `employee_allowances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;
--
-- AUTO_INCREMENT for table `employee_bonus`
--
ALTER TABLE `employee_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee_children`
--
ALTER TABLE `employee_children`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `employee_grades`
--
ALTER TABLE `employee_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `employee_house_rent_settings`
--
ALTER TABLE `employee_house_rent_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `employee_loans`
--
ALTER TABLE `employee_loans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;
--
-- AUTO_INCREMENT for table `employee_loans_06_09`
--
ALTER TABLE `employee_loans_06_09`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;
--
-- AUTO_INCREMENT for table `employee_loans_back`
--
ALTER TABLE `employee_loans_back`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;
--
-- AUTO_INCREMENT for table `employee_recoveries`
--
ALTER TABLE `employee_recoveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;
--
-- AUTO_INCREMENT for table `employee_salary_sheets`
--
ALTER TABLE `employee_salary_sheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=643;
--
-- AUTO_INCREMENT for table `employee_types`
--
ALTER TABLE `employee_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `entry_types`
--
ALTER TABLE `entry_types`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `fiscal_years`
--
ALTER TABLE `fiscal_years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `fiscal_year_settings`
--
ALTER TABLE `fiscal_year_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `fix_deposits`
--
ALTER TABLE `fix_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gpf_subscriptions`
--
ALTER TABLE `gpf_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1075;
--
-- AUTO_INCREMENT for table `gpf_subscriptions_06_09_2017`
--
ALTER TABLE `gpf_subscriptions_06_09_2017`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=758;
--
-- AUTO_INCREMENT for table `head_wise_account_balance`
--
ALTER TABLE `head_wise_account_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `job_statuses`
--
ALTER TABLE `job_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `living_statuses`
--
ALTER TABLE `living_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `loan_recoveries`
--
ALTER TABLE `loan_recoveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=564;
--
-- AUTO_INCREMENT for table `loan_types`
--
ALTER TABLE `loan_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
-- AUTO_INCREMENT for table `mobile_bill_settings`
--
ALTER TABLE `mobile_bill_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `monthly_attendance_entries`
--
ALTER TABLE `monthly_attendance_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `monthly_attendance_entry_types`
--
ALTER TABLE `monthly_attendance_entry_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `monthly_others`
--
ALTER TABLE `monthly_others`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `monthly_others_enties`
--
ALTER TABLE `monthly_others_enties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=709;
--
-- AUTO_INCREMENT for table `monthly_others_enties_settings`
--
ALTER TABLE `monthly_others_enties_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `monthly_salary_notes`
--
ALTER TABLE `monthly_salary_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `months`
--
ALTER TABLE `months`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `salary_sheets`
--
ALTER TABLE `salary_sheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `scales`
--
ALTER TABLE `scales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;
--
-- AUTO_INCREMENT for table `sexes`
--
ALTER TABLE `sexes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tax_settings`
--
ALTER TABLE `tax_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `transaction_categories`
--
ALTER TABLE `transaction_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `transaction_types`
--
ALTER TABLE `transaction_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=688;
--
-- AUTO_INCREMENT for table `warter_supply_setting`
--
ALTER TABLE `warter_supply_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `year_closing_balance_details`
--
ALTER TABLE `year_closing_balance_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD CONSTRAINT `fk_bank_accounts_banks1` FOREIGN KEY (`bank_info_id`) REFERENCES `bank_infos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;