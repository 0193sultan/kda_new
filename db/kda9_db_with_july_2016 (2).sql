-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2017 at 05:46 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kda9_db_with_july_2016`
--

-- --------------------------------------------------------

--
-- Table structure for table `acc_head_lists`
--

CREATE TABLE `acc_head_lists` (
  `id` int(11) NOT NULL,
  `acc_head_type_id` int(11) NOT NULL,
  `head_name` varchar(100) NOT NULL,
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

INSERT INTO `acc_head_lists` (`id`, `acc_head_type_id`, `head_name`, `has_parent`, `parent_id`, `order_no`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Land and land development', 0, 0, 0, 'Active', '2017-10-21', '0000-00-00'),
(2, 3, 'Shiromoni market', 1, 1, 1, 'Active', '2017-10-21', '0000-00-00'),
(3, 3, 'mojgonic R/A', 1, 1, 2, 'Active', '2017-10-21', '0000-00-00'),
(4, 3, 'Nirala R/A', 1, 1, 3, 'Active', '2017-10-21', '0000-00-00'),
(5, 4, 'Cash in hand', 0, 0, 0, 'Active', '2017-10-21', '0000-00-00'),
(6, 4, 'CFO', 1, 5, 1, 'Active', '2017-10-21', '0000-00-00'),
(7, 4, 'Chief Engineer', 1, 5, 2, 'Active', '2017-10-21', '0000-00-00'),
(8, 4, 'Account manager', 1, 5, 3, 'Active', '2017-10-21', '0000-00-00'),
(9, 4, 'Bank deposit', 0, 0, 0, 'Active', '2017-10-21', '0000-00-00'),
(10, 4, 'Fixed Deposit', 0, 0, 0, 'Active', '2017-10-21', '0000-00-00'),
(11, 4, 'Stock Goods', 0, 0, 0, 'Active', '2017-10-21', '0000-00-00'),
(12, 5, 'Welfare Fund', 0, 0, 0, 'Active', '2017-10-24', '0000-00-00'),
(13, 5, 'GPF loan', 0, 0, 0, 'Active', '2017-10-24', '0000-00-00'),
(14, 5, 'Safety deposit', 0, 0, 0, 'Active', '2017-10-24', '0000-00-00'),
(15, 5, 'Test1 dai', 1, 12, 1, 'Active', '2017-10-24', '0000-00-00'),
(16, 5, 'Test2 dai', 1, 12, 2, 'Active', '2017-10-24', '0000-00-00'),
(17, 5, 'test11 day', 1, 13, 1, 'Active', '2017-10-24', '0000-00-00'),
(18, 5, 'Test3 dai', 1, 12, 3, 'Active', '2017-10-24', '0000-00-00'),
(19, 6, 'Fund No 1', 0, 0, 0, 'Active', '2017-10-24', '0000-00-00'),
(20, 6, 'Fund No 2', 0, 0, 0, 'Active', '2017-10-24', '0000-00-00'),
(21, 6, 'Fund under Fund No 2', 1, 20, 1, 'Active', '2017-10-24', '0000-00-00'),
(22, 6, 'Fund 3 Under Fund 2', 1, 20, 2, 'Active', '2017-10-24', '0000-00-00'),
(23, 1, 'Toal', 0, 0, 0, 'Active', '2017-10-25', '0000-00-00'),
(24, 1, 'Rent', 0, 0, 0, 'Active', '2017-10-25', '0000-00-00'),
(25, 1, 'KDA New Market', 1, 24, 1, 'Active', '2017-10-25', '0000-00-00'),
(26, 2, 'Maintanence', 0, 0, 0, 'Active', '2017-10-25', '0000-00-00'),
(27, 2, 'Car Management', 1, 26, 1, 'Active', '2017-10-25', '0000-00-00'),
(28, 2, 'Housing', 0, 0, 0, 'Active', '2017-10-25', '0000-00-00'),
(29, 3, 'Sonadanga Market', 0, 0, 0, 'Active', '2017-10-25', '0000-00-00');

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
-- Table structure for table `asset_details`
--

CREATE TABLE `asset_details` (
  `id` int(11) NOT NULL,
  `entry_type_id` tinyint(4) NOT NULL,
  `daily_transaction_id` int(11) NOT NULL,
  `acc_head_list_id` int(11) NOT NULL,
  `acc_sub_head_list_id` int(11) DEFAULT NULL,
  `action_type` tinyint(4) NOT NULL,
  `amount` double(12,2) NOT NULL,
  `user_id` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `asset_details`
--

INSERT INTO `asset_details` (`id`, `entry_type_id`, `daily_transaction_id`, `acc_head_list_id`, `acc_sub_head_list_id`, `action_type`, `amount`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 17, 4, 29, 1, 2500.00, 1, '2017-10-02 01:00:30', '0000-00-00 00:00:00'),
(2, 1, 18, 4, 29, 2, -350.00, 1, '2017-10-02 09:45:12', '0000-00-00 00:00:00'),
(3, 1, 26, 4, 29, 2, -450.00, 1, '2017-10-03 17:03:44', '0000-00-00 00:00:00');

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
(2, 1, 3, '94857938677', 'revenue_account', 'Active', 1, '2017-09-29 19:35:06', '2017-09-29 22:07:47');

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
(1, 11, 1, 3, 2, '33.00', '33.00', 'Addition', '2017-10-26', NULL),
(2, 11, 2, 2, 1, '34.00', '34.00', 'Addition', '2017-10-26', NULL),
(3, 23, 1, 3, 2, '10.00', '23.00', 'Subtraction', '2017-10-26', NULL),
(5, 25, 1, 3, 2, '200.00', '223.00', 'Addition', '2017-10-26', NULL),
(6, 27, 1, 3, 2, '500.00', '723.00', 'Addition', '2017-10-26', NULL),
(7, 28, 2, 2, 1, '30.00', '4.00', 'Subtraction', '2017-10-26', NULL),
(8, 30, 1, 3, 2, '20.00', '703.00', 'Subtraction', '2017-10-26', NULL),
(9, 31, 1, 3, 2, '44.00', '659.00', 'Subtraction', '2017-10-26', NULL);

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
(12, 32, 'sal_boishikh', '20', 'Salary for Boishikh', '2017-08-08 06:27:05', '2017-10-02 12:11:55', 1, 'Active'),
(13, 31, 'sal_general', '1', 'Salary for General', '2017-08-08 06:28:08', '2017-10-02 12:11:26', 1, 'Active'),
(14, 33, 'sal_festival_muslims', '100', 'Salary for Muslims', '2017-08-08 06:28:51', '2017-10-02 12:10:56', 1, 'Active'),
(15, 34, 'sal_festival_hinduism', '200', 'Salary for Hinduism', '2017-08-08 06:30:06', '2017-10-02 12:10:24', 1, 'Active'),
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

INSERT INTO `daily_transactions` (`id`, `entry_type_id`, `acc_head_type_id`, `acc_head_list_id`, `parent_id`, `bank_info_id`, `branch_id`, `bank_account_id`, `transaction_category_id`, `transaction_type_id`, `fiscal_year_id`, `month_id`, `transaction_amount`, `voucher_no`, `transaction_date`, `transaction_note`, `balance_status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 3, 1, 0, 0, 0, 3, 2, 2, 2, '11.00', NULL, NULL, NULL, 0, 1, '2017-10-25 23:51:21', NULL),
(2, 1, 3, 4, 1, 0, 0, 0, 3, 2, 2, 2, '12.00', NULL, NULL, NULL, 0, 1, '2017-10-25 23:51:21', NULL),
(3, 1, 3, 2, 1, 0, 0, 0, 3, 2, 2, 2, '13.00', NULL, NULL, NULL, 0, 1, '2017-10-25 23:51:21', NULL),
(4, 1, 3, 29, 29, 0, 0, 0, 3, 2, 2, 2, '14.00', NULL, NULL, NULL, 0, 1, '2017-10-25 23:51:21', NULL),
(8, 1, 4, 6, 5, 0, 0, 0, 3, 2, 2, 2, '16.00', NULL, NULL, NULL, 0, 1, '2017-10-26 00:17:49', NULL),
(9, 1, 4, 7, 5, 0, 0, 0, 3, 2, 2, 2, '17.00', NULL, NULL, NULL, 0, 1, '2017-10-26 00:17:49', NULL),
(10, 1, 4, 8, 5, 0, 0, 0, 3, 2, 2, 2, '18.00', NULL, NULL, NULL, 0, 1, '2017-10-26 00:17:49', NULL),
(11, 1, 4, 9, 9, 0, 0, 0, 3, 2, 2, 2, '67.00', NULL, NULL, NULL, 0, 1, '2017-10-26 00:27:35', NULL),
(12, 1, 4, 10, 10, 0, 0, 0, 3, 2, 2, 2, '3000.00', NULL, NULL, NULL, 0, 1, '2017-10-26 00:31:31', NULL),
(13, 1, 4, 11, 11, 0, 0, 0, 3, 2, 2, 2, '5000.00', NULL, NULL, NULL, 0, 1, '2017-10-26 00:35:46', NULL),
(14, 1, 5, 16, 12, 0, 0, 0, 3, 2, 2, 2, '77.00', NULL, NULL, NULL, 0, 1, '2017-10-26 00:38:19', NULL),
(15, 1, 5, 15, 12, 0, 0, 0, 3, 2, 2, 2, '78.00', NULL, NULL, NULL, 0, 1, '2017-10-26 00:38:19', NULL),
(16, 1, 5, 18, 12, 0, 0, 0, 3, 2, 2, 2, '79.00', NULL, NULL, NULL, 0, 1, '2017-10-26 00:38:19', NULL),
(17, 1, 5, 17, 13, 0, 0, 0, 3, 2, 2, 2, '80.00', NULL, NULL, NULL, 0, 1, '2017-10-26 00:38:19', NULL),
(18, 1, 5, 14, 14, 0, 0, 0, 3, 2, 2, 2, '81.00', NULL, NULL, NULL, 0, 1, '2017-10-26 00:38:19', NULL),
(19, 1, 6, 19, 19, 0, 0, 0, 3, 2, 2, 2, '91.00', NULL, NULL, NULL, 0, 1, '2017-10-26 00:40:08', NULL),
(20, 1, 6, 22, 20, 0, 0, 0, 3, 2, 2, 2, '92.00', NULL, NULL, NULL, 0, 1, '2017-10-26 00:40:08', NULL),
(21, 1, 6, 21, 20, 0, 0, 0, 3, 2, 2, 2, '93.00', NULL, NULL, NULL, 0, 1, '2017-10-26 00:40:08', NULL),
(23, 1, 3, 29, 29, 1, 3, 2, 2, 1, 2, 1, '10.00', '234567', '2017-10-26', 'yufuyf', 0, 1, '2017-10-26 12:07:13', NULL),
(25, 2, 3, 29, 29, 1, 3, 2, 2, 1, 2, 2, '200.00', '234567', '2017-10-30', '2 and 3', 0, 1, '2017-10-26 12:46:37', NULL),
(27, 1, 5, 15, 12, 1, 3, 2, 2, 1, 2, 2, '500.00', '53253', '2017-10-18', '2 & 5', 0, 1, '2017-10-26 13:06:58', NULL),
(28, 2, 5, 17, 13, 2, 2, 1, 2, 1, 2, 2, '30.00', '4334223', '2017-10-26', '2 & 5', 0, 1, '2017-10-26 13:10:05', NULL),
(30, 2, 2, 27, 26, 1, 3, 2, 2, 1, 2, 2, '20.00', '12345678', '2017-10-24', '2 & 2', 0, 1, '2017-10-26 14:04:57', NULL),
(31, 2, 2, 27, 26, 1, 3, 2, 2, 1, 2, 2, '44.00', '2424', '2017-10-03', '2 & 2', 0, 1, '2017-10-26 14:14:27', NULL);

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
  `current_basic` float NOT NULL,
  `new_basic_salary` float NOT NULL,
  `da` float NOT NULL,
  `pp` float NOT NULL,
  `medical` float NOT NULL,
  `convance` float NOT NULL,
  `wash` float NOT NULL,
  `mobile` float NOT NULL,
  `cycle` float NOT NULL,
  `charge` float NOT NULL,
  `other` float NOT NULL,
  `gross_pay` float NOT NULL,
  `house_rent` float NOT NULL,
  `telephone_allowance` float NOT NULL,
  `tiffin` float NOT NULL,
  `education` float NOT NULL,
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
(1, 'Mr. ATM Wahid Azhar', 'জনাব এটিএম ওয়াহিদ আজহার ', 5227, 5, 12, 1, 3, 0, NULL, '1957-04-03', '1986-12-04', 1, 1, 1, 1, 2, NULL, 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '01712958333', 0),
(2, 'Mr. Kazi Md. Sabirul Alam', 'জনাব কাজী মোঃ সাবিরুল আলম', 5000, 6, 28, 1, 3, 0, NULL, '1969-02-20', '1994-04-11', 1, 1, 1, 1, 2, '0040-0316005704', 3, '', '', 1, 1, '', 1, 'Muzgunni,Boyra,Khulna', 'Muzgunni,Boyra,Khulna', 2, '', 0),
(3, 'Md. Basharul Kabir', 'মোঃ বাসারুল কবীর', 5219, 6, 28, 1, 4, 0, NULL, '1959-07-04', '1987-11-08', 1, 1, 1, 3, 2, '0040-0316004214', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(4, 'Mr. Shameem Jehad', 'জনাব শামীম জেহাদ', 5002, 7, 40, 1, 5, 0, NULL, '1967-01-11', '1994-04-11', 1, 1, 1, 1, 2, '0040-0316003715', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(5, 'Mr. Md. Mozibur Rahman', 'মোঃ মজিবুর রহমান', 5001, 7, 39, 1, 6, 0, NULL, '1970-02-11', '1996-04-25', 1, 1, 1, 1, 2, '0040-0316005802', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(6, 'Mr. GM Masudur Rahman', 'জনাব জিএম মাসুদুর রহমান', 5003, 7, 39, 1, 7, 0, NULL, '1967-12-30', '1996-04-25', 1, 1, 1, 1, 2, '0040-0316005688', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 1),
(7, 'Mr. M. M. Hossain Ali', 'জনাব এম এম হোসেন আলী', 5004, 9, 66, 1, 9, 0, NULL, '1967-08-16', '1994-07-26', 1, 1, 1, 1, 2, '0040-0316005197', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(8, 'Mr. Probir Kumar Chakrobarti', 'জনাব প্রবীর কুমার চক্রবর্তী', 5005, 9, 65, 1, 17, 0, NULL, '1956-08-13', '1979-06-15', 1, 1, 2, 1, 2, '', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(9, 'Mr. Ashraful Islam', 'জনাব আশরাফুল ইসলাম', 5006, 9, 66, 1, 10, 0, NULL, '1961-08-13', '1987-04-14', 1, 1, 1, 1, 2, '0040-0316004018', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(10, 'Md. Mamunul Abedin', 'মোঃ মামুনুল আবেদীন', 5012, 9, 65, 1, 11, 0, NULL, '1975-12-20', '2004-10-26', 1, 1, 1, 1, 2, '0040-0316005777', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 1),
(11, 'Md. Ijadur Rahman', 'মোঃ ইজাদুর রহমান', 5013, 9, 65, 1, 12, 0, NULL, '1975-02-27', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316005884', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(12, 'Md. Abdulla Kabi Sad', 'মোঃ আব্দুল্লাহ কবি সাদ', 5011, 9, 64, 1, 13, 0, NULL, '1977-09-17', '2004-11-06', 1, 1, 1, 1, 2, '0040-0316005339', 3, '', '', 1, 1, '', 1, 'খুলনা্ ', 'খুলনা্ ', 0, '', 1),
(13, 'Mr. Kazi Enayet Hossain', 'জনাব কাজী এনায়েত হোসেন', 5008, 9, 66, 1, 14, 0, NULL, '1961-04-30', '1985-08-18', 1, 1, 1, 1, 2, '0040-0316005795', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(14, 'Md. Saidul Haque', 'মোঃ সাইদুল হক', 5225, 9, 64, 1, 15, 0, NULL, '1978-01-01', '2005-09-21', 1, 1, 1, 1, 2, '0040-0316005740', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(15, 'Md. Arman Hossain', 'মোঃ আরমান হোসেন', 5009, 9, 65, 1, 16, 0, NULL, '1977-10-30', '2005-09-28', 1, 1, 1, 1, 2, '0040-0316004394', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(16, 'Md. Mortoza Al-Mamun', 'মোঃ মোরতোজা আল -মামুন', 5010, 9, 64, 1, 17, 0, NULL, '1984-10-13', '2007-02-07', 1, 1, 1, 1, 2, '0040-0316005482', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(17, 'Mr. Muntasir Mamun', 'জনাব মুনতাসির মামুন', 5223, 9, 62, 1, 17, 0, NULL, '1987-09-17', '2010-08-19', 1, 1, 1, 1, 2, '0040-0316005035', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(18, 'Md. Tanvir Ahmed', 'মোঃ তানভীর আহমেদ', 5224, 11, 100, 1, 19, 0, NULL, '1982-12-10', '2010-10-19', 1, 1, 1, 1, 2, '0040-0316005875', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(19, 'Mr. Abu Sayed', 'জনাব আবু সাঈদ', 5229, 11, 98, 1, 19, 0, NULL, '1983-10-20', '2013-10-22', 1, 1, 1, 1, 2, '0040-0316004447', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(20, 'Mr. Harunar Rashid', 'জনাব হারুনার রশিদ', 5014, 9, 65, 1, 20, 0, NULL, '1963-01-01', '1986-11-29', 1, 1, 1, 1, 2, '0040-0316004572', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(21, 'Mr. Abdur Rouf Dhali', 'জনাব আব্দুর রউফ ঢালী', 5015, 9, 63, 1, 21, 0, NULL, '1960-11-01', '1987-06-10', 1, 1, 1, 1, 2, '', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(22, 'Mrs. Rita Faria', 'জনাবা রীতা ফারিয়া', 5016, 9, 65, 1, 21, 0, NULL, '1966-10-13', '1964-07-10', 1, 1, 1, 1, 2, '0040-0316005099', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 2, '', 1),
(23, 'Md. Sanaullah', 'মোঃ ছানাউল্লাহ', 5017, 9, 64, 1, 22, 0, NULL, '1968-10-19', '1998-09-30', 1, 1, 1, 1, 2, '0040-0316004269', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 1, '', 1),
(24, 'Mr. Rabindranath Das', 'জনাব রবিন্দ্রনাথ দাস', 5019, 9, 65, 1, 21, 0, NULL, '1966-12-30', '1995-06-16', 1, 1, 2, 1, 2, '0040-0316004009', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(25, 'Mr. Bashudeb Kumar Biswas', 'জনাব বাসুদেব কুমার বিশ্বাস', 5023, 9, 64, 1, 24, 0, NULL, '1968-06-05', '1999-03-08', 1, 1, 2, 1, 2, '0040-0316003662', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(26, 'Md. Mahmud Hasan', 'মোঃ মাহমুদ হাসান ', 5020, 10, 81, 1, 21, 0, NULL, '1982-12-14', '2004-11-03', 1, 1, 1, 1, 2, '0040-0316005866', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(27, 'Mrs. Sahana Tabassum', 'জনাবা শাহানা তাবাচ্ছুম', 5021, 12, 121, 1, 25, 0, NULL, '1973-12-03', '1996-09-10', 1, 1, 1, 1, 2, '0040-0316005053', 3, '', '', 2, 1, '', 1, 'Khulna', 'Khulna', 2, '', 0),
(28, 'Shaikh Abdul Karim', 'শেখ  আব্দুল  করিম ', 5022, 11, 100, 1, 26, 0, NULL, '1961-07-20', '1980-08-06', 1, 1, 1, 1, 2, '0040-0316005437', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
(29, 'Shaikh Robiul Islam', 'শেখ রবিউল ইসলাম ', 5024, 10, 81, 1, 27, 0, NULL, '1975-02-15', '1999-03-07', 1, 1, 1, 1, 2, '0040-0316003840', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(30, 'Md. Shaiful Islam', 'মোঃ সাইফুল ইসলাম ', 5025, 11, 98, 1, 18, 0, NULL, '1973-09-26', '1998-03-18', 1, 1, 1, 1, 2, '0040-0316005848', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
(31, 'Mr. Sharif Wahiduzzaman', 'জনাব শরীফ ওয়াহিদুজ্জামান', 5230, 12, 117, 1, 21, 0, NULL, '1983-10-24', '2013-09-19', 1, 1, 1, 1, 2, '0040-0316003573', 3, '', '', 1, 1, '', 2, 'Khulna', 'Khulna', 0, '', 0),
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
(79, 'Mr. Molla Enayet Ali', 'জনাব মোল্লা এনায়েত আলী', 5133, 21, 287, 2, 47, 0, NULL, '1984-12-20', '2005-12-18', 1, 1, 1, 1, 2, '0040-0316004376', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
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
(98, 'Mr. Md. Alamgir Hossain', 'জনাব মোঃ আলমগীর হোসেন', 5140, 29, 320, 2, 48, 0, NULL, '1973-02-11', '1998-01-19', 1, 1, 1, 1, 2, '', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
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
(109, 'Mr. Kazi Miraj Mahmud', 'জনাব কাজী মিরাজ মাহমুদ', 5074, 17, 215, 3, 50, 0, NULL, '1978-02-01', '1915-12-14', 1, 1, 1, 1, 2, '0040-0316004796', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
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
(137, 'Mr. Babu Das', 'জনাব বাবু দাস ', 5134, 19, 249, 4, 48, 0, NULL, '1956-08-26', '1984-10-10', 1, 1, 2, 1, 2, '', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 0, '', 0),
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
(148, 'Mr. Zahangir Ahsan Kabir', 'জনাব জাহাঙ্গীর আ্হসান কবীর', 5092, 14, 162, 5, 60, 0, NULL, '1963-11-19', '1988-03-20', 1, 1, 1, 1, 2, '0040-0316003957', 3, '', '', 1, 1, '', 0, 'Khulna', 'Khulna', 2, '', 0),
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
(197, 'Mr. Md. Zahangir Shikder', 'জনাব মো: জাহাঙ্গীর শিকদার', 5196, 17, 213, 12, 70, 0, NULL, '1976-06-01', '2005-09-18', 1, 1, 1, 1, 2, '0040-0316004090', 3, '', '', 1, 1, '', 1, 'Khulna', 'Khulna', 1, '', 0),
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
  `house_rent` float NOT NULL,
  `medical` float NOT NULL,
  `education` float NOT NULL,
  `convence` float NOT NULL,
  `tiffin` float NOT NULL,
  `wash` float NOT NULL,
  `mobile` float NOT NULL,
  `cycle` float NOT NULL,
  `da` float NOT NULL,
  `charges` float NOT NULL,
  `others` float NOT NULL,
  `pp` float NOT NULL,
  `fix_charges` tinyint(4) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_allowances`
--

INSERT INTO `employee_allowances` (`id`, `house_rent`, `medical`, `education`, `convence`, `tiffin`, `wash`, `mobile`, `cycle`, `da`, `charges`, `others`, `pp`, `fix_charges`, `employee_id`) VALUES
(1, 26448, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 400, 0, 1, 1),
(2, 24336, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 400, 0, 1, 2),
(3, 24336, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 400, 0, 1, 3),
(4, 23424, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 4),
(5, 22412, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 5),
(6, 22412, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 6),
(7, 16336, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 7),
(8, 16000, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 8),
(9, 16336, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 9),
(10, 16000, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 10),
(11, 16000, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 11),
(12, 16000, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 12),
(13, 16336, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 13),
(14, 16000, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 14),
(15, 16000, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 15),
(16, 16000, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 16),
(17, 15111, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 17),
(18, 12645, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 18),
(19, 11466, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 19),
(20, 16000, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 20),
(21, 15867, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 21),
(22, 16000, 1500, 1000, 0, 0, 0, 0, 25, 0, 0, 0, 0, 1, 22),
(23, 16000, 1500, 500, 0, 0, 0, 0, 25, 0, 0, 0, 0, 1, 23),
(24, 16000, 1500, 1000, 0, 0, 0, 0, 25, 0, 0, 0, 0, 1, 24),
(25, 16000, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 25),
(26, 13216.5, 1500, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 1, 26),
(27, 10147.5, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 27),
(28, 12645, 1500, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 28),
(29, 13216.5, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 29),
(30, 11466, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 30),
(31, 0, 1500, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 1, 31),
(32, 14575.5, 1500, 500, 0, 0, 0, 0, 0, 0, 75, 0, 0, 1, 32),
(33, 13279.5, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 33),
(34, 10147.5, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 34),
(35, 7560, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 35),
(36, 8725.5, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 36),
(37, 9661.5, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 37),
(38, 0, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 38),
(39, 8725.5, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 39),
(40, 7555, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 40),
(41, 8725.5, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 41),
(42, 8082, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 42),
(43, 6245, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 43),
(44, 7940, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 44),
(45, 5400, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 45),
(46, 6890, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 46),
(47, 8000, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 47),
(48, 7195, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 48),
(49, 6855, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 49),
(50, 7555, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 50),
(51, 5263.5, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 51),
(52, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 52),
(53, 5263.5, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 53),
(54, 6855, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 54),
(55, 6000, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 55),
(56, 7360, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 56),
(57, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 57),
(58, 6300, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 58),
(59, 5400, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 59),
(60, 6300, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 60),
(61, 7360, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 61),
(62, 6300, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 62),
(63, 0, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 63),
(64, 6670, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 64),
(65, 6350, 1500, 1000, 0, 200, 100, 0, 0, 0, 0, 0, 0, 1, 65),
(66, 6300, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 66),
(67, 6210, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 67),
(68, 7005, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 68),
(69, 7360, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 69),
(70, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 70),
(71, 7360, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 71),
(72, 7360, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 72),
(73, 6300, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 73),
(74, 6300, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 74),
(75, 7360, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 75),
(76, 7360, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 76),
(77, 7005, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 77),
(78, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 78),
(79, 6000, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 79),
(80, 7360, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 80),
(81, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 81),
(82, 7360, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 82),
(83, 7360, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 83),
(84, 7360, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 84),
(85, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 85),
(86, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 86),
(87, 7360, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 87),
(88, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 88),
(89, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 89),
(90, 6670, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 90),
(91, 6670, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 91),
(92, 6525, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 92),
(93, 7360, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 93),
(94, 7360, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 94),
(95, 5400, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 95),
(96, 5263.5, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 96),
(97, 7005, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 97),
(98, 2800, 700, 200, 0, 0, 0, 0, 0, 551, 0, 0, 0, 1, 98),
(99, 7005, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 99),
(100, 7005, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 100),
(101, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 101),
(102, 11191.5, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 102),
(103, 8000, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 103),
(104, 8307, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 105),
(105, 8307, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 106),
(106, 8307, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 107),
(107, 6850, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 108),
(108, 6850, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 109),
(109, 6850, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 110),
(110, 6300, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 111),
(111, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 112),
(112, 5263.5, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 113),
(113, 9652.5, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 114),
(114, 9189, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 115),
(115, 0, 1500, 1000, 300, 200, 0, 0, 25, 0, 0, 0, 0, 1, 116),
(116, 8082, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 117),
(117, 8280, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 118),
(118, 0, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 119),
(119, 0, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 120),
(120, 7560, 1500, 1000, 300, 200, 0, 0, 25, 0, 0, 0, 0, 1, 121),
(121, 8000, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 122),
(122, 8000, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 123),
(123, 8000, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 124),
(124, 7940, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 125),
(125, 8000, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 126),
(126, 7555, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 127),
(127, 7555, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 128),
(128, 6850, 1500, 1000, 300, 200, 0, 0, 25, 0, 0, 0, 0, 1, 129),
(129, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 130),
(130, 6000, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 131),
(131, 5263.5, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 132),
(132, 7730, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 133),
(133, 7560, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 134),
(134, 7360, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 135),
(135, 7360, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 136),
(136, 6350, 1500, 0, 0, 200, 100, 0, 0, 0, 0, 0, 0, 1, 137),
(137, 7005, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 138),
(138, 7005, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 139),
(139, 6670, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 140),
(140, 6615, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 141),
(141, 6670, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 142),
(142, 9189, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 143),
(143, 8307, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 144),
(144, 8725.5, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 145),
(145, 7560, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 146),
(146, 6850, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 147),
(147, 8725.5, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 148),
(148, 6850, 1500, 0, 300, 200, 0, 0, 25, 0, 0, 0, 0, 1, 149),
(149, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 150),
(150, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 151),
(151, 5263.5, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 152),
(152, 8725.5, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 153),
(153, 8000, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 154),
(154, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 155),
(155, 8000, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 156),
(156, 0, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 157),
(157, 8000, 1500, 500, 300, 200, 0, 0, 25, 0, 0, 0, 0, 1, 158),
(158, 8082, 1500, 1000, 300, 200, 0, 0, 25, 0, 0, 0, 0, 1, 159),
(159, 8082, 1500, 1000, 300, 200, 0, 0, 25, 0, 0, 0, 0, 1, 160),
(160, 8082, 1500, 1000, 300, 200, 0, 0, 25, 0, 0, 0, 0, 1, 161),
(161, 7200, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 162),
(162, 7195, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 163),
(163, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 164),
(164, 6000, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 165),
(165, 6300, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 166),
(166, 9189, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 167),
(167, 8725.5, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 168),
(168, 8307, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 169),
(169, 8307, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 170),
(170, 0, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 171),
(171, 0, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 172),
(172, 7555, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 173),
(173, 6890, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 174),
(174, 6560, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 175),
(175, 5400, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 176),
(176, 5400, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 177),
(177, 7005, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 178),
(178, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 179),
(179, 10656, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 180),
(180, 6370, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 181),
(181, 7005, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 182),
(182, 12042, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 183),
(183, 5400, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 184),
(184, 6850, 1500, 500, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 185),
(185, 7005, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 186),
(186, 11754, 1500, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 187),
(187, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 188),
(188, 0, 1500, 1000, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 189),
(189, 5400, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 190),
(190, 9189, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 191),
(191, 6525, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 192),
(192, 8000, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 193),
(193, 6850, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 194),
(194, 7560, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 195),
(195, 7200, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 196),
(196, 6205, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 197),
(197, 9066, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 198),
(198, 6560, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 199),
(199, 7555, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 200),
(200, 6850, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 201),
(201, 6792, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 202),
(202, 6850, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 203),
(203, 7555, 1500, 1000, 0, 200, 100, 0, 0, 0, 0, 0, 0, 1, 204),
(204, 7555, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 205),
(205, 7195, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 206),
(206, 7935, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 207),
(207, 7235, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 208),
(208, 7235, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 209),
(209, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 210),
(210, 6210, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 211),
(211, 6210, 1500, 500, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 212),
(212, 6045, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 213),
(213, 7005, 1500, 1000, 300, 200, 100, 0, 0, 0, 0, 0, 0, 1, 214),
(214, 7005, 1500, 0, 300, 200, 100, 0, 0, 0, 0, 0, 0, 0, 215),
(215, 0, 1500, 0, 300, 200, 0, 0, 0, 0, 0, 0, 0, 1, 104);

-- --------------------------------------------------------

--
-- Table structure for table `employee_bonus`
--

CREATE TABLE `employee_bonus` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `current_basic` float NOT NULL,
  `scale_id` int(11) NOT NULL,
  `bonus_amount` float NOT NULL,
  `percent` float NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `festival_tracking_config_meta_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_bonus`
--

INSERT INTO `employee_bonus` (`id`, `employee_id`, `current_basic`, `scale_id`, `bonus_amount`, `percent`, `fiscal_year_id`, `month_id`, `festival_tracking_config_meta_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 66120, 3, 13224, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(2, 2, 60840, 4, 12168, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(3, 4, 58560, 5, 11712, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(4, 5, 56030, 5, 11206, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(5, 6, 56030, 5, 11206, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(6, 7, 40840, 7, 8168, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(7, 8, 38890, 7, 7778, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(8, 9, 40840, 7, 8168, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(9, 10, 38890, 7, 7778, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(10, 11, 38890, 7, 7778, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(11, 12, 37030, 7, 7406, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(12, 13, 40840, 7, 8168, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(13, 14, 37030, 7, 7406, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(14, 15, 38890, 7, 7778, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(15, 16, 37030, 7, 7406, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(16, 17, 33580, 7, 6716, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(17, 18, 28100, 9, 5620, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(18, 19, 25480, 9, 5096, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(19, 20, 38890, 7, 7778, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(20, 21, 35260, 7, 7052, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(21, 22, 38890, 7, 7778, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(22, 23, 37030, 7, 7406, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(23, 24, 38890, 7, 7778, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(24, 25, 37030, 7, 7406, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(25, 26, 29370, 8, 5874, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(26, 27, 22550, 10, 4510, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(27, 28, 28100, 9, 5620, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(28, 29, 29370, 8, 5874, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(29, 30, 25480, 9, 5096, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(30, 31, 18530, 10, 3706, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(31, 32, 32390, 8, 6478, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(32, 33, 29510, 9, 5902, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(33, 34, 22550, 10, 4510, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(34, 35, 15120, 14, 3024, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(35, 36, 19390, 12, 3878, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(36, 37, 21470, 10, 4294, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(37, 38, 20360, 12, 4072, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(38, 39, 19390, 12, 3878, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(39, 40, 15110, 15, 3022, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(40, 41, 19390, 12, 3878, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(41, 42, 17960, 13, 3592, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(42, 43, 12490, 16, 2498, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(43, 44, 15880, 14, 3176, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(44, 45, 10430, 17, 2086, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(45, 46, 13780, 16, 2756, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(46, 47, 17100, 13, 3420, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(47, 48, 14390, 15, 2878, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(48, 49, 13710, 14, 2742, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(49, 50, 15110, 15, 3022, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(50, 51, 9570, 20, 1914, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(51, 52, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(52, 53, 9570, 20, 1914, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(53, 54, 13710, 18, 2742, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(54, 55, 12000, 19, 2400, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(55, 56, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(56, 57, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(57, 58, 12600, 19, 2520, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(58, 59, 9850, 19, 1970, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(59, 60, 12600, 19, 2520, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(60, 61, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(61, 62, 12600, 19, 2520, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(62, 63, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(63, 64, 13340, 17, 2668, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(64, 65, 12700, 17, 2540, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(65, 67, 12420, 18, 2484, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(66, 68, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(67, 69, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(68, 70, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(69, 71, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(70, 72, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(71, 73, 12600, 19, 2520, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(72, 74, 12600, 19, 2520, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(73, 75, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(74, 76, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(75, 77, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(76, 78, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(77, 79, 12000, 19, 2400, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(78, 80, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(79, 81, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(80, 82, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(81, 83, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(82, 84, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(83, 85, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(84, 86, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(85, 87, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(86, 88, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(87, 89, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(88, 90, 13340, 17, 2668, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(89, 91, 13340, 17, 2668, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(90, 92, 13050, 18, 2610, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(91, 93, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(92, 94, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(93, 95, 10050, 20, 2010, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(94, 96, 9570, 20, 1914, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(95, 97, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(96, 98, 2755, 21, 551, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(97, 99, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(98, 100, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(99, 101, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(100, 102, 24870, 10, 4974, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(101, 103, 16680, 18, 3336, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(102, 105, 18460, 12, 3692, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(103, 106, 18460, 12, 3692, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(104, 107, 18460, 12, 3692, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(105, 108, 13700, 15, 2740, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(106, 109, 13700, 15, 2740, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(107, 110, 13700, 15, 2740, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(108, 111, 12600, 19, 2520, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(109, 112, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(110, 113, 9570, 20, 1914, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(111, 114, 21450, 11, 4290, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(112, 115, 20420, 11, 4084, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(113, 116, 17960, 13, 3592, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(114, 117, 17960, 13, 3592, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(115, 118, 18400, 14, 3680, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(116, 119, 18460, 12, 3692, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(117, 120, 17960, 13, 3592, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(118, 121, 15120, 18, 3024, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(119, 122, 16680, 14, 3336, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(120, 123, 16680, 14, 3336, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(121, 124, 17100, 13, 3420, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(122, 125, 15880, 14, 3176, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(123, 126, 16680, 14, 3336, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(124, 127, 15110, 15, 3022, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(125, 128, 15110, 15, 3022, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(126, 129, 13700, 15, 2740, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(127, 130, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(128, 131, 12000, 19, 2400, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(129, 132, 9570, 20, 1914, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(130, 133, 15460, 17, 3092, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(131, 134, 12600, 19, 2520, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(132, 135, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(133, 136, 14720, 17, 2944, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(134, 137, 12700, 17, 2540, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(135, 138, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(136, 139, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(137, 140, 13340, 17, 2668, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(138, 141, 13230, 19, 2646, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(139, 142, 13340, 17, 2668, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(140, 143, 20420, 11, 4084, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(141, 144, 18460, 12, 3692, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(142, 145, 19390, 12, 3878, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(143, 146, 15120, 14, 3024, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(144, 147, 13700, 15, 2740, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(145, 148, 19390, 12, 3878, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(146, 149, 13700, 15, 2740, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(147, 150, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(148, 151, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(149, 152, 9570, 20, 1914, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(150, 153, 19390, 12, 3878, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(151, 154, 17100, 13, 3420, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(152, 155, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(153, 156, 16680, 18, 3336, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(154, 157, 17580, 12, 3516, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(155, 158, 16280, 13, 3256, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(156, 159, 17960, 13, 3592, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(157, 160, 17960, 13, 3592, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(158, 161, 17960, 13, 3592, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(159, 162, 14400, 18, 2880, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(160, 163, 14390, 15, 2878, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(161, 164, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(162, 165, 12000, 19, 2400, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(163, 166, 12600, 19, 2520, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(164, 167, 20420, 11, 4084, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(165, 168, 19390, 12, 3878, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(166, 169, 18460, 12, 3692, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(167, 170, 18460, 12, 3692, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(168, 171, 13040, 15, 2608, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(169, 172, 13120, 16, 2624, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(170, 173, 15110, 15, 3022, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(171, 174, 13780, 16, 2756, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(172, 175, 13120, 16, 2624, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(173, 176, 10780, 16, 2156, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(174, 177, 10780, 16, 2156, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(175, 178, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(176, 179, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(177, 180, 23680, 10, 4736, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(178, 181, 12740, 13, 2548, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(179, 182, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(180, 183, 26760, 9, 5352, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(181, 184, 10430, 17, 2086, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(182, 185, 13700, 15, 2740, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(183, 186, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(184, 187, 26120, 10, 5224, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(185, 188, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(186, 189, 16680, 18, 3336, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(187, 190, 10780, 16, 2156, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(188, 191, 20420, 11, 4084, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(189, 192, 13050, 14, 2610, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(190, 193, 17100, 13, 3420, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(191, 194, 13700, 15, 2740, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(192, 195, 15120, 18, 3024, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(193, 196, 14400, 18, 2880, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(194, 197, 12410, 15, 2482, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(195, 198, 15110, 15, 3022, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(196, 199, 13120, 16, 2624, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(197, 200, 15110, 15, 3022, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(198, 201, 13700, 15, 2740, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(199, 202, 11320, 16, 2264, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(200, 203, 13700, 15, 2740, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(201, 204, 15110, 15, 3022, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(202, 205, 15110, 15, 3022, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(203, 206, 14390, 15, 2878, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(204, 207, 15870, 15, 3174, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(205, 208, 14470, 16, 2894, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(206, 209, 14470, 16, 2894, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(207, 210, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(208, 211, 12420, 18, 2484, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(209, 212, 12420, 18, 2484, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(210, 213, 12090, 17, 2418, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(211, 214, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(212, 215, 14010, 17, 2802, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(213, 66, 12600, 19, 2520, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(214, 104, 16680, 18, 3336, 20, 2, 1, 32, 0, '2017-10-03', NULL),
(215, 8, 38890, 7, 77780, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(216, 24, 38890, 7, 77780, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(217, 25, 37030, 7, 74060, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(218, 32, 32390, 8, 64780, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(219, 39, 19390, 12, 38780, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(220, 59, 9850, 19, 19700, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(221, 69, 14720, 17, 29440, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(222, 95, 10050, 20, 20100, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(223, 106, 18460, 12, 36920, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(224, 107, 18460, 12, 36920, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(225, 126, 16680, 14, 33360, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(226, 137, 12700, 17, 25400, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(227, 138, 14010, 17, 28020, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(228, 140, 13340, 17, 26680, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(229, 141, 13230, 19, 26460, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(230, 142, 13340, 17, 26680, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(231, 144, 18460, 12, 36920, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(232, 167, 20420, 11, 40840, 200, 2, 1, 34, 0, '2017-10-03', NULL),
(233, 207, 15870, 15, 31740, 200, 2, 1, 34, 0, '2017-10-03', NULL);

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
  `second_installment_amount` double(10,2) NOT NULL DEFAULT '0.00',
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

-- --------------------------------------------------------

--
-- Table structure for table `employee_recoveries`
--

CREATE TABLE `employee_recoveries` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `gpf` float NOT NULL,
  `gpf_recovery` tinyint(4) NOT NULL,
  `bf` float NOT NULL,
  `gi` float NOT NULL,
  `gi_recovery` tinyint(4) NOT NULL,
  `fix_gpf` int(11) NOT NULL,
  `fixed_house_rent` float NOT NULL,
  `water_supply` int(11) NOT NULL,
  `tax` float NOT NULL,
  `tin_shed` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_recoveries`
--

INSERT INTO `employee_recoveries` (`id`, `employee_id`, `gpf`, `gpf_recovery`, `bf`, `gi`, `gi_recovery`, `fix_gpf`, `fixed_house_rent`, `water_supply`, `tax`, `tin_shed`) VALUES
(1, 1, 0, 0, 50, 30, 1, 1, 0, 0, 334, 0),
(2, 2, 6084, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(3, 3, 6084, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(4, 4, 5856, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(5, 5, 5603, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(6, 6, 5603, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(7, 7, 4084, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(8, 8, 0, 0, 50, 30, 1, 1, 0, 0, 334, 0),
(9, 9, 4084, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(10, 10, 3889, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(11, 11, 3889, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(12, 12, 3703, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(13, 13, 4084, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(14, 14, 3703, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(15, 15, 3889, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(16, 16, 3703, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(17, 17, 3358, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(18, 18, 2810, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(19, 19, 2548, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(20, 20, 3889, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(21, 21, 3526, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(22, 22, 3889, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(23, 23, 3703, 1, 50, 30, 1, 1, 7000, 12, 334, 0),
(24, 24, 3889, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(25, 25, 3703, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(26, 26, 2937, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(27, 27, 2255, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(28, 28, 2810, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(29, 29, 2937, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(30, 30, 2548, 1, 50, 30, 1, 1, 0, 0, 334, 0),
(31, 31, 1853, 1, 50, 30, 1, 1, 0, 12, 334, 0),
(32, 32, 3239, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(33, 33, 2951, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(34, 34, 2255, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(35, 35, 1512, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(36, 36, 1939, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(37, 37, 2147, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(38, 38, 2036, 1, 50, 0, 0, 1, 0, 12, 334, 0),
(39, 39, 1939, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(40, 40, 1511, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(41, 41, 1939, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(42, 42, 1796, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(43, 43, 1249, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(44, 44, 1588, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(45, 45, 1043, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(46, 46, 3445, 1, 50, 0, 0, 1, 1401, 12, 0, 0),
(47, 47, 1710, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(48, 48, 3597.5, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(49, 49, 3427.5, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(50, 50, 1511, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(51, 51, 957, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(52, 52, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 200),
(53, 53, 957, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(54, 54, 1371, 1, 50, 0, 0, 1, 1560, 8, 0, 0),
(55, 55, 1200, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(56, 56, 1472, 1, 50, 0, 0, 1, 1413, 8, 0, 0),
(57, 57, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(58, 58, 1260, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(59, 59, 985, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(60, 60, 1260, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(61, 61, 1472, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(62, 62, 1260, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(63, 63, 1472, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(64, 64, 1334, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(65, 65, 0, 0, 50, 0, 0, 1, 0, 0, 0, 0),
(66, 67, 1242, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(67, 68, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(68, 69, 1472, 1, 50, 0, 0, 1, 1476, 8, 0, 0),
(69, 70, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(70, 71, 1472, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(71, 72, 1472, 1, 50, 0, 0, 1, 1476, 0, 0, 0),
(72, 73, 1260, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(73, 74, 1260, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(74, 75, 1472, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(75, 76, 1472, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(76, 77, 1401, 1, 50, 0, 0, 1, 1560, 8, 0, 0),
(77, 78, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 200),
(78, 79, 1200, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(79, 80, 1472, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(80, 81, 1401, 1, 50, 0, 0, 1, 1413, 8, 0, 0),
(81, 82, 1472, 1, 50, 0, 0, 1, 1476, 8, 0, 0),
(82, 83, 1472, 1, 50, 0, 0, 1, 1413, 8, 0, 0),
(83, 84, 1472, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(84, 85, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(85, 86, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(86, 87, 1472, 1, 50, 0, 0, 1, 1413, 8, 0, 0),
(87, 88, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(88, 89, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(89, 90, 1334, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(90, 91, 1334, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(91, 92, 1305, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(92, 93, 1472, 1, 50, 0, 0, 1, 1401, 8, 0, 0),
(93, 94, 1472, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(94, 95, 1005, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(95, 96, 957, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(96, 97, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(97, 98, 275.5, 1, 27.55, 0, 0, 1, 0, 0, 0, 0),
(98, 99, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(99, 100, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(100, 101, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(101, 102, 2487, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(102, 103, 1668, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(103, 105, 1846, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(104, 106, 1846, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(105, 107, 2000, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(106, 108, 1370, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(107, 109, 1370, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(108, 110, 3425, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(109, 111, 1260, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(110, 112, 1401, 1, 50, 0, 0, 1, 1560, 8, 0, 0),
(111, 113, 957, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(112, 114, 5362.5, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(113, 115, 2042, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(114, 116, 1796, 1, 50, 0, 0, 1, 0, 12, 334, 0),
(115, 117, 1500, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(116, 118, 1840, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(117, 119, 2000, 1, 50, 0, 0, 1, 0, 12, 334, 0),
(118, 120, 1796, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(119, 121, 1512, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(120, 122, 1668, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(121, 123, 1668, 1, 50, 0, 0, 1, 2286, 12, 0, 0),
(122, 124, 1710, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(123, 125, 1588, 1, 50, 0, 0, 1, 2286, 12, 0, 0),
(124, 126, 1668, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(125, 127, 1511, 1, 50, 0, 0, 1, 2241, 12, 0, 0),
(126, 128, 1511, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(127, 129, 1370, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(128, 130, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(129, 131, 1200, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(130, 132, 957, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(131, 133, 1546, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(132, 134, 1260, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(133, 135, 1472, 1, 50, 0, 0, 1, 0, 8, 0, 200),
(134, 136, 1472, 1, 50, 0, 0, 1, 0, 0, 0, 200),
(135, 137, 0, 0, 50, 0, 0, 1, 0, 0, 0, 0),
(136, 138, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(137, 139, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(138, 140, 1334, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(139, 141, 1323, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(140, 142, 1334, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(141, 143, 2042, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(142, 144, 1846, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(143, 145, 1939, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(144, 146, 1512, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(145, 147, 1370, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(146, 148, 1939, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(147, 149, 1370, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(148, 150, 1401, 1, 50, 0, 0, 1, 1476, 8, 0, 0),
(149, 151, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(150, 152, 957, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(151, 153, 1939, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(152, 154, 3000, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(153, 155, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(154, 156, 1500, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(155, 157, 1758, 1, 50, 0, 0, 1, 0, 12, 0, 0),
(156, 158, 1628, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(157, 159, 1796, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(158, 160, 1796, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(159, 161, 1796, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(160, 162, 1440, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(161, 163, 1439, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(162, 164, 1401, 1, 50, 0, 0, 1, 1560, 8, 0, 0),
(163, 165, 1200, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(164, 166, 1260, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(165, 167, 2042, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(166, 168, 1939, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(167, 169, 1846, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(168, 170, 1846, 1, 50, 0, 0, 1, 2286, 12, 334, 0),
(169, 171, 1304, 1, 50, 0, 0, 1, 0, 12, 0, 0),
(170, 172, 1312, 1, 50, 0, 0, 1, 0, 12, 0, 0),
(171, 173, 1511, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(172, 174, 1378, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(173, 175, 1312, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(174, 176, 1078, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(175, 177, 1078, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(176, 178, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(177, 179, 1401, 1, 50, 0, 0, 1, 1401, 8, 0, 0),
(178, 180, 2368, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(179, 181, 0, 0, 50, 0, 0, 1, 0, 0, 0, 0),
(180, 182, 3502.5, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(181, 183, 2676, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(182, 184, 1043, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(183, 185, 1370, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(184, 186, 1401, 1, 50, 0, 0, 1, 1476, 8, 0, 0),
(185, 187, 2612, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(186, 188, 1401, 1, 50, 0, 0, 1, 1476, 8, 0, 0),
(187, 189, 2000, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(188, 190, 1078, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(189, 191, 2042, 1, 50, 0, 0, 1, 0, 0, 334, 0),
(190, 192, 1305, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(191, 193, 1710, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(192, 194, 1370, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(193, 195, 1512, 1, 50, 0, 0, 1, 2286, 8, 0, 0),
(194, 196, 1440, 1, 50, 0, 0, 1, 2241, 8, 0, 0),
(195, 197, 1241, 1, 50, 0, 0, 1, 1401, 8, 0, 0),
(196, 198, 1511, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(197, 199, 1312, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(198, 200, 1511, 1, 50, 0, 0, 1, 2241, 8, 0, 0),
(199, 201, 1370, 1, 50, 0, 0, 1, 2241, 8, 0, 0),
(200, 202, 1132, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(201, 203, 1370, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(202, 204, 1511, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(203, 205, 1511, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(204, 206, 1439, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(205, 207, 1587, 1, 50, 0, 0, 1, 1560, 8, 0, 0),
(206, 208, 1447, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(207, 209, 1447, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(208, 210, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 200),
(209, 211, 1242, 1, 50, 0, 0, 1, 1560, 8, 0, 0),
(210, 212, 2484, 1, 50, 0, 0, 1, 1413, 8, 0, 0),
(211, 213, 1209, 1, 50, 0, 0, 1, 0, 0, 0, 0),
(212, 214, 1401, 1, 50, 0, 0, 1, 1560, 8, 0, 0),
(213, 215, 1401, 1, 50, 0, 0, 1, 0, 0, 0, 200),
(214, 66, 1260, 1, 50, 0, 0, 1, 1560, 8, 0, 0),
(215, 104, 2000, 1, 50, 0, 0, 1, 0, 12, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary_sheets`
--

CREATE TABLE `employee_salary_sheets` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `current_basic` double(10,2) NOT NULL,
  `new_basic_salary` double(10,2) NOT NULL DEFAULT '0.00',
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
  `gpf` double(10,2) NOT NULL,
  `gpf_recovery` int(11) NOT NULL,
  `group_insurance` float NOT NULL,
  `house_rent` double(10,2) NOT NULL,
  `house_loan_recovery` double(10,2) NOT NULL,
  `vehicle_recovery` double(10,2) NOT NULL,
  `telephone_recovery` double(10,2) NOT NULL,
  `others_recovery` double(10,2) NOT NULL DEFAULT '0.00',
  `tiffin` double(10,2) NOT NULL,
  `motorcycle_loan` double(10,2) NOT NULL,
  `house_build_recovery` double(10,2) NOT NULL,
  `house_repair_recovery` double(10,2) NOT NULL,
  `bycycle_loan` double(10,2) NOT NULL,
  `computer_loan` double(10,2) NOT NULL,
  `car_loan` double(10,2) NOT NULL,
  `extra_loan` double(10,2) NOT NULL,
  `gpf_loan` double(10,2) NOT NULL,
  `education` double(10,2) NOT NULL,
  `fixed_house_rent_recovery` float(8,2) NOT NULL,
  `health_insurance` double(10,2) NOT NULL,
  `water_supply_recovery` double(10,2) NOT NULL,
  `electricity_recovery` double(10,2) NOT NULL,
  `bf_recovery` double(10,2) NOT NULL,
  `gi` double(10,2) NOT NULL,
  `gi_recovery` double(10,2) NOT NULL,
  `emp_tax` double(10,2) NOT NULL,
  `tin_shade_recovery` double(10,2) NOT NULL,
  `salary_type_id` int(11) NOT NULL,
  `status` enum('Active','Inactive','','') NOT NULL,
  `total_recovery` double(10,2) NOT NULL,
  `net_pay` double(10,2) NOT NULL,
  `bonus` double(10,2) DEFAULT NULL,
  `bonus_type` int(11) DEFAULT NULL,
  `deduct_salary` double(8,2) NOT NULL DEFAULT '0.00',
  `fiscal_year_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_salary_sheets`
--

INSERT INTO `employee_salary_sheets` (`id`, `employee_id`, `current_basic`, `new_basic_salary`, `da`, `pp`, `medical`, `convance`, `wash`, `mobile`, `cycle`, `charge`, `other`, `gross_pay`, `gpf`, `gpf_recovery`, `group_insurance`, `house_rent`, `house_loan_recovery`, `vehicle_recovery`, `telephone_recovery`, `others_recovery`, `tiffin`, `motorcycle_loan`, `house_build_recovery`, `house_repair_recovery`, `bycycle_loan`, `computer_loan`, `car_loan`, `extra_loan`, `gpf_loan`, `education`, `fixed_house_rent_recovery`, `health_insurance`, `water_supply_recovery`, `electricity_recovery`, `bf_recovery`, `gi`, `gi_recovery`, `emp_tax`, `tin_shade_recovery`, `salary_type_id`, `status`, `total_recovery`, `net_pay`, `bonus`, `bonus_type`, `deduct_salary`, `fiscal_year_id`, `month_id`, `created_at`, `updated_at`) VALUES
(1, 1, 66120.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 95468.00, 0.00, 0, 0, 26448.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 414.00, 95054.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(2, 2, 60840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 88076.00, 6084.00, 1, 0, 24336.00, 0.00, 2095.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8593.20, 79482.80, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(3, 3, 60840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 88076.00, 6084.00, 1, 0, 24336.00, 0.00, 699.20, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8197.20, 79878.80, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(4, 4, 58560.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 84484.00, 5856.00, 1, 0, 23424.00, 0.00, 1400.20, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8670.20, 75813.80, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(5, 5, 56030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 80942.00, 5603.00, 1, 0, 22412.00, 0.00, 852.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4167.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 11036.80, 69905.20, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(6, 6, 56030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 79942.00, 5603.00, 1, 0, 22412.00, 0.00, 561.80, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 7578.80, 72363.20, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(7, 7, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1, 0, 16336.00, 0.00, 40.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4538.00, 55138.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(8, 8, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 57390.00, 0.00, 0, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 414.00, 56976.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(9, 9, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1, 0, 16336.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4498.00, 55178.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(10, 10, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1, 0, 16000.00, 0.00, 478.20, 0.00, 0.00, 0.00, 730.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 4084.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 10595.20, 45794.80, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(11, 11, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1, 0, 16000.00, 0.00, 110.40, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4413.40, 51976.60, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(12, 12, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 54530.00, 3703.00, 1, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3542.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 7659.00, 46871.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(13, 13, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1, 0, 16336.00, 0.00, 98.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4596.80, 55079.20, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(14, 14, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55530.00, 3703.00, 1, 0, 16000.00, 0.00, 435.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4552.00, 50978.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(15, 15, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1, 0, 16000.00, 0.00, 71.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4374.20, 52015.80, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(16, 16, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 54530.00, 3703.00, 1, 0, 16000.00, 0.00, 52.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4169.00, 50361.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(17, 17, 33580.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50191.00, 3358.00, 1, 0, 15111.00, 0.00, 86.40, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3858.40, 46332.60, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(18, 18, 28100.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 42245.00, 2810.00, 1, 0, 12645.00, 0.00, 39.60, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3263.60, 38981.40, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(19, 19, 25480.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 38446.00, 2548.00, 1, 0, 11466.00, 0.00, 25.60, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 2987.60, 35458.40, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(20, 20, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 57390.00, 3889.00, 1, 0, 16000.00, 0.00, 148.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 5188.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 10639.80, 46750.20, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(21, 21, 35260.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 53627.00, 3526.00, 1, 0, 15867.00, 0.00, 0.00, 0.00, 12275.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 16215.80, 37411.20, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(22, 22, 31362.90, 0.00, 0.00, 0.00, 1209.68, 0.00, 0.00, 0.00, 20.16, 0.00, 0.00, 46302.42, 3889.00, 1, 0, 12903.23, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 7635.00, 806.45, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 12938.00, 33364.42, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(23, 23, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 55055.00, 3703.00, 1, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 1500.00, 500.00, 7000.00, 0.00, 12.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 13629.00, 41426.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(24, 24, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 57415.00, 3889.00, 1, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4303.00, 53112.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(25, 25, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55530.00, 3703.00, 1, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4117.00, 51413.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(26, 26, 29370.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 44111.50, 2937.00, 1, 0, 13216.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3351.00, 40760.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(27, 27, 22550.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 35197.50, 2255.00, 1, 0, 10147.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 2669.00, 32528.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(28, 28, 28100.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 42745.00, 2810.00, 1, 0, 12645.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3224.00, 39521.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(29, 29, 29370.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 44086.50, 2937.00, 1, 0, 13216.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3351.00, 40735.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(30, 30, 25480.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 38446.00, 2548.00, 1, 0, 11466.00, 0.00, 127.60, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3089.60, 35356.40, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(31, 31, 18530.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 20055.00, 1853.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 12.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 2279.00, 17776.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(32, 32, 32390.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 75.00, 0.00, 49040.50, 3239.00, 1, 0, 14575.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3623.00, 45417.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(33, 33, 29510.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 45289.50, 2951.00, 1, 0, 13279.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3335.00, 41954.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(34, 34, 22550.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 35197.50, 2255.00, 1, 0, 10147.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2639.00, 32558.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(35, 35, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1512.00, 1, 0, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1562.00, 23118.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(36, 36, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30615.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28292.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(37, 37, 21470.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 33631.50, 2147.00, 1, 0, 9661.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2531.00, 31100.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(38, 38, 20360.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22860.00, 2036.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2432.00, 20428.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(39, 39, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30115.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 27792.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(40, 40, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 24104.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(41, 41, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28792.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(42, 42, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 28542.00, 1796.00, 1, 0, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2180.00, 26362.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(43, 43, 12490.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20735.00, 1249.00, 1, 0, 6245.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1299.00, 19436.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(44, 44, 15880.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25820.00, 1588.00, 1, 0, 7940.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1638.00, 24182.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(45, 45, 10430.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 17830.00, 1043.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1093.00, 16737.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(46, 46, 13780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23170.00, 3445.00, 1, 0, 6890.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 465.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1401.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5373.00, 17797.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(47, 47, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 28100.00, 1710.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2292.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5052.00, 23048.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(48, 48, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24085.00, 3597.50, 1, 0, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3647.50, 20437.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(49, 49, 13710.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22665.00, 3427.50, 1, 0, 6855.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3477.50, 19187.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(50, 50, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25265.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23704.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(51, 51, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(52, 52, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 1651.00, 22464.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(53, 53, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17433.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 16426.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(54, 54, 13710.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23665.00, 1371.00, 1, 0, 6855.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2989.00, 20676.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(55, 55, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21100.00, 1200.00, 1, 0, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1250.00, 19850.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(56, 56, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1413.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2943.00, 22237.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(57, 57, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(58, 58, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20190.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(59, 59, 9850.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17350.00, 985.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1035.00, 16315.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(60, 60, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21000.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 19690.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(61, 61, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23158.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(62, 62, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20190.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(63, 63, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17320.00, 1472.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 15798.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(64, 64, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23110.00, 1334.00, 1, 0, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1384.00, 21726.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(65, 65, 12700.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21850.00, 0.00, 0, 0, 6350.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 50.00, 21800.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(66, 67, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 1242.00, 1, 0, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1292.00, 19938.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(67, 68, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22164.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(68, 69, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3006.00, 22174.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(69, 70, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(70, 71, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23658.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(71, 72, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2998.00, 22182.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(72, 73, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20190.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(73, 74, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20190.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(74, 75, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23158.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(75, 76, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23158.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(76, 77, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3019.00, 20596.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(77, 78, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 1651.00, 22464.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(78, 79, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20600.00, 1200.00, 1, 0, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1250.00, 19350.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(79, 80, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23658.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(80, 81, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1413.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2872.00, 21243.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(81, 82, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3006.00, 22174.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(82, 83, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1413.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2943.00, 21737.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(83, 84, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23658.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(84, 85, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(85, 86, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(86, 87, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1413.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2943.00, 22237.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(87, 88, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(88, 89, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(89, 90, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22110.00, 1334.00, 1, 0, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1384.00, 20726.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(90, 91, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1, 0, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1384.00, 21226.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(91, 92, 13050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22675.00, 1305.00, 1, 0, 6525.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1355.00, 21320.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(92, 93, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1401.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2931.00, 22249.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(93, 94, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 22658.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(94, 95, 10050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17550.00, 1005.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1055.00, 16495.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(95, 96, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(96, 97, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 21664.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(97, 98, 2755.00, 0.00, 551.00, 0.00, 700.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 7006.00, 275.50, 1, 0, 2800.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 27.55, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 303.05, 6702.95, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(98, 99, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22164.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(99, 100, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 21664.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(100, 101, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(101, 102, 24870.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 37561.50, 2487.00, 1, 0, 11191.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2871.00, 34690.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(102, 103, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1718.00, 25962.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(103, 105, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2230.00, 27537.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(104, 106, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2230.00, 27537.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(105, 107, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29267.00, 2000.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2384.00, 26883.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(106, 108, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22550.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21130.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(107, 109, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22550.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21130.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(108, 110, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 3425.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3475.00, 19575.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(109, 111, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21000.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 19690.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(110, 112, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3019.00, 21096.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(111, 113, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(112, 114, 21450.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 34102.50, 5362.50, 1, 0, 9652.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6746.50, 27356.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(113, 115, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32109.00, 2042.00, 1, 0, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2426.00, 29683.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(114, 116, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 20985.00, 1796.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2192.00, 18793.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(115, 117, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29042.00, 1500.00, 1, 0, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 1884.00, 27158.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(116, 118, 18400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29180.00, 1840.00, 1, 0, 8280.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2224.00, 26956.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(117, 119, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21460.00, 2000.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2396.00, 19064.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(118, 120, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20960.00, 1796.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2180.00, 18780.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(119, 121, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 25705.00, 1512.00, 1, 0, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1562.00, 24143.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(120, 122, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1718.00, 25962.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(121, 123, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4016.00, 23664.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(122, 124, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27600.00, 1710.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1760.00, 25840.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(123, 125, 15880.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 26820.00, 1588.00, 1, 0, 7940.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3936.00, 22884.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(124, 126, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27180.00, 1668.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1718.00, 25462.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(125, 127, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2241.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3814.00, 21851.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(126, 128, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 24104.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(127, 129, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 23575.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 22155.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(128, 130, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(129, 131, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21100.00, 1200.00, 1, 0, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1250.00, 19850.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(130, 132, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17433.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 16426.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(131, 133, 15460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25790.00, 1546.00, 1, 0, 7730.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1596.00, 24194.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(132, 134, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22260.00, 1260.00, 1, 0, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20950.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(133, 135, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 1730.00, 23450.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(134, 136, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 1722.00, 22458.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(135, 137, 12700.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20850.00, 0.00, 0, 0, 6350.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 50.00, 20800.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(136, 138, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 21664.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(137, 139, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22164.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(138, 140, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1, 0, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1384.00, 21226.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(139, 141, 13230.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22945.00, 1323.00, 1, 0, 6615.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1373.00, 21572.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(140, 142, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1, 0, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1384.00, 21226.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(141, 143, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32609.00, 2042.00, 1, 0, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2426.00, 30183.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(142, 144, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29267.00, 1846.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2230.00, 27037.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(143, 145, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30115.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 27792.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(144, 146, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1512.00, 1, 0, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1562.00, 23618.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(145, 147, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21630.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL);
INSERT INTO `employee_salary_sheets` (`id`, `employee_id`, `current_basic`, `new_basic_salary`, `da`, `pp`, `medical`, `convance`, `wash`, `mobile`, `cycle`, `charge`, `other`, `gross_pay`, `gpf`, `gpf_recovery`, `group_insurance`, `house_rent`, `house_loan_recovery`, `vehicle_recovery`, `telephone_recovery`, `others_recovery`, `tiffin`, `motorcycle_loan`, `house_build_recovery`, `house_repair_recovery`, `bycycle_loan`, `computer_loan`, `car_loan`, `extra_loan`, `gpf_loan`, `education`, `fixed_house_rent_recovery`, `health_insurance`, `water_supply_recovery`, `electricity_recovery`, `bf_recovery`, `gi`, `gi_recovery`, `emp_tax`, `tin_shade_recovery`, `salary_type_id`, `status`, `total_recovery`, `net_pay`, `bonus`, `bonus_type`, `deduct_salary`, `fiscal_year_id`, `month_id`, `created_at`, `updated_at`) VALUES
(146, 148, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28792.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(147, 149, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 22575.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21155.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(148, 150, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2935.00, 21180.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(149, 151, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(150, 152, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(151, 153, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28792.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(152, 154, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27600.00, 3000.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3050.00, 24550.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(153, 155, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(154, 156, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1500.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1550.00, 26130.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(155, 157, 17580.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20580.00, 1758.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1820.00, 18760.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(156, 158, 16280.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 26805.00, 1628.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1678.00, 25127.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(157, 159, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 29067.00, 1796.00, 1, 0, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2180.00, 26887.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(158, 160, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 29067.00, 1796.00, 1, 0, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2180.00, 26887.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(159, 161, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 29067.00, 1796.00, 1, 0, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2180.00, 26887.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(160, 162, 14400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24100.00, 1440.00, 1, 0, 7200.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1490.00, 22610.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(161, 163, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24085.00, 1439.00, 1, 0, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1489.00, 22596.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(162, 164, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3019.00, 21096.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(163, 165, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20600.00, 1200.00, 1, 0, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1250.00, 19350.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(164, 166, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22000.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20690.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(165, 167, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31609.00, 2042.00, 1, 0, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2426.00, 29183.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(166, 168, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30615.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28292.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(167, 169, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2230.00, 27537.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(168, 170, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 4528.00, 25239.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(169, 171, 13040.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15540.00, 1304.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1366.00, 14174.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(170, 172, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15120.00, 1312.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1374.00, 13746.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(171, 173, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25165.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23604.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(172, 174, 13780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22670.00, 1378.00, 1, 0, 6890.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1428.00, 21242.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(173, 175, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21680.00, 1312.00, 1, 0, 6560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1362.00, 20318.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(174, 176, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(175, 177, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(176, 178, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 21664.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(177, 179, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1401.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2860.00, 21255.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(178, 180, 23680.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 36836.00, 2368.00, 1, 0, 10656.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2752.00, 34084.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(179, 181, 12740.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21110.00, 0.00, 0, 0, 6370.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 50.00, 21060.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(180, 182, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 3502.50, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3552.50, 19562.50, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(181, 183, 26760.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 40302.00, 2676.00, 1, 0, 12042.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3060.00, 37242.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(182, 184, 10430.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 17830.00, 1043.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1093.00, 16737.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(183, 185, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21630.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(184, 186, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1476.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2935.00, 20680.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(185, 187, 26120.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 40374.00, 2612.00, 1, 0, 11754.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2996.00, 37378.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(186, 188, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2935.00, 21180.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(187, 189, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 19680.00, 2000.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2050.00, 17630.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(188, 190, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(189, 191, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 32709.00, 2042.00, 1, 0, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2426.00, 30283.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(190, 192, 13050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22175.00, 1305.00, 1, 0, 6525.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1355.00, 20820.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(191, 193, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 28200.00, 1710.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1760.00, 26440.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(192, 194, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21730.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(193, 195, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25780.00, 1512.00, 1, 0, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3856.00, 21924.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(194, 196, 14400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24200.00, 1440.00, 1, 0, 7200.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 2241.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3739.00, 20461.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(195, 197, 12410.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21215.00, 1241.00, 1, 0, 6205.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1401.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2700.00, 18515.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(196, 198, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 27276.00, 1511.00, 1, 0, 9066.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 25715.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(197, 199, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21780.00, 1312.00, 1, 0, 6560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1362.00, 20418.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(198, 200, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24765.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2241.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3810.00, 20955.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(199, 201, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 2241.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3669.00, 19481.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(200, 202, 11320.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20212.00, 1132.00, 1, 0, 6792.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1182.00, 19030.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(201, 203, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21730.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(202, 204, 15110.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25465.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23904.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(203, 205, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25265.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23704.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(204, 206, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24685.00, 1439.00, 1, 0, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1489.00, 23196.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(205, 207, 15870.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 26405.00, 1587.00, 1, 0, 7935.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3205.00, 23200.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(206, 208, 14470.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24305.00, 1447.00, 1, 0, 7235.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1497.00, 22808.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(207, 209, 14470.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24805.00, 1447.00, 1, 0, 7235.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1497.00, 23308.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(208, 210, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 1651.00, 22464.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(209, 211, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 1242.00, 1, 0, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2860.00, 18370.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(210, 212, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 2484.00, 1, 0, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1413.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3955.00, 17275.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(211, 213, 12090.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20235.00, 1209.00, 1, 0, 6045.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1259.00, 18976.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(212, 214, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3019.00, 21096.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(213, 215, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 1651.00, 21464.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(214, 66, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2878.00, 18622.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(215, 104, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18680.00, 2000.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2062.00, 16618.00, NULL, NULL, 0.00, 2, 1, '2017-10-02', NULL),
(216, 1, 66120.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 95468.00, 0.00, 0, 0, 26448.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 414.00, 95054.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(217, 2, 60840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 88076.00, 6084.00, 1, 0, 24336.00, 0.00, 2316.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8814.80, 79261.20, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(218, 4, 58560.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 84484.00, 5856.00, 1, 0, 23424.00, 0.00, 2165.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 9435.00, 75049.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(219, 5, 56030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 80942.00, 5603.00, 1, 0, 22412.00, 0.00, 1504.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4167.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 11688.20, 69253.80, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(220, 6, 56030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 79942.00, 5603.00, 1, 0, 22412.00, 0.00, 744.40, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 7761.40, 72180.60, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(221, 7, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1, 0, 16336.00, 0.00, 41.60, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4539.60, 55136.40, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(222, 8, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 57390.00, 0.00, 0, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 414.00, 56976.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(223, 9, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1, 0, 16336.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4498.00, 55178.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(224, 10, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1, 0, 16000.00, 0.00, 1605.20, 0.00, 0.00, 0.00, 730.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 4084.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 11722.20, 44667.80, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(225, 11, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1, 0, 16000.00, 0.00, 560.40, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4863.40, 51526.60, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(226, 12, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 54530.00, 3703.00, 1, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3542.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 7659.00, 46871.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(227, 13, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1, 0, 16336.00, 0.00, 793.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 5291.20, 54384.80, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(228, 14, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55530.00, 3703.00, 1, 0, 16000.00, 0.00, 179.60, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4296.60, 51233.40, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(229, 15, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1, 0, 16000.00, 0.00, 284.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4587.80, 51802.20, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(230, 16, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 54530.00, 3703.00, 1, 0, 16000.00, 0.00, 24.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4141.00, 50389.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(231, 17, 33580.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50191.00, 3358.00, 1, 0, 15111.00, 0.00, 80.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3852.00, 46339.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(232, 18, 28100.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 42245.00, 2810.00, 1, 0, 12645.00, 0.00, 35.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3259.20, 38985.80, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(233, 19, 25480.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 38446.00, 2548.00, 1, 0, 11466.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 2962.00, 35484.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(234, 20, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 57390.00, 3889.00, 1, 0, 16000.00, 0.00, 104.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 5188.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 10595.00, 46795.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(235, 21, 35260.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 53627.00, 3526.00, 1, 0, 15867.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3940.00, 49687.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(236, 22, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 57415.00, 3889.00, 1, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 7635.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 12938.00, 44477.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(237, 23, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 55055.00, 3703.00, 1, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 1500.00, 500.00, 7000.00, 0.00, 12.00, 1470.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 15099.00, 39956.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(238, 24, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 57415.00, 3889.00, 1, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 7230.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 12533.00, 44882.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(239, 25, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55530.00, 3703.00, 1, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5891.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 11008.00, 44522.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(240, 26, 29370.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 44111.50, 2937.00, 1, 0, 13216.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3351.00, 40760.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(241, 27, 22550.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 35197.50, 2255.00, 1, 0, 10147.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 2669.00, 32528.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(242, 28, 28100.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 42745.00, 2810.00, 1, 0, 12645.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3224.00, 39521.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(243, 29, 29370.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 44086.50, 2937.00, 1, 0, 13216.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3351.00, 40735.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(244, 30, 25480.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 38446.00, 2548.00, 1, 0, 11466.00, 0.00, 220.60, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3182.60, 35263.40, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(245, 31, 18530.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 20055.00, 1853.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 12.00, 1887.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4166.00, 15889.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(246, 32, 32390.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 75.00, 0.00, 49040.50, 3239.00, 1, 0, 14575.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5025.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 8648.00, 40392.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(247, 33, 29510.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 45289.50, 2951.00, 1, 0, 13279.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3335.00, 41954.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(248, 34, 22550.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 35197.50, 2255.00, 1, 0, 10147.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2639.00, 32558.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(249, 35, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1512.00, 1, 0, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1562.00, 23118.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(250, 36, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30615.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28292.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(251, 37, 21470.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 33631.50, 2147.00, 1, 0, 9661.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2531.00, 31100.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(252, 38, 20360.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22860.00, 2036.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 12.00, 2460.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 4892.00, 17968.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(253, 39, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30115.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3053.00, 27062.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(254, 40, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 24104.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(255, 41, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28792.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(256, 42, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 28542.00, 1796.00, 1, 0, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2180.00, 26362.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(257, 43, 12490.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20735.00, 1249.00, 1, 0, 6245.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1299.00, 19436.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(258, 44, 15880.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25820.00, 1588.00, 1, 0, 7940.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1638.00, 24182.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(259, 45, 10430.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 17830.00, 1043.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1093.00, 16737.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(260, 46, 13780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23170.00, 3445.00, 1, 0, 6890.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 465.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1401.00, 0.00, 12.00, 2004.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7377.00, 15793.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(261, 47, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 28100.00, 1710.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2292.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5052.00, 23048.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(262, 48, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24085.00, 3597.50, 1, 0, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3647.50, 20437.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(263, 49, 13710.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22665.00, 3427.50, 1, 0, 6855.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3477.50, 19187.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(264, 50, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25265.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23704.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(265, 51, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(266, 52, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 1947.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 3598.00, 20517.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(267, 53, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17433.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 16426.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(268, 54, 13710.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23665.00, 1371.00, 1, 0, 6855.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1560.00, 0.00, 8.00, 3266.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6255.00, 17410.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(269, 55, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21100.00, 1200.00, 1, 0, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1250.00, 19850.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(270, 56, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1413.00, 0.00, 8.00, 2159.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5102.00, 20078.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(271, 57, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(272, 58, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20190.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(273, 59, 9850.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17350.00, 985.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1035.00, 16315.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(274, 60, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21000.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 19690.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(275, 61, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23158.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(276, 62, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20190.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(277, 63, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17320.00, 1472.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 1366.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2888.00, 14432.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(278, 64, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23110.00, 1334.00, 1, 0, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1384.00, 21726.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(279, 65, 12700.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21850.00, 0.00, 0, 0, 6350.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 50.00, 21800.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(280, 66, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 1145.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4023.00, 17477.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(281, 67, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 1242.00, 1, 0, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1292.00, 19938.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(282, 68, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22164.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(283, 69, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 3026.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 8032.00, 17148.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(284, 70, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(285, 71, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23658.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(286, 72, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 0.00, 1779.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4777.00, 20403.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(287, 73, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20190.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(288, 74, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20190.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(289, 75, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23158.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL);
INSERT INTO `employee_salary_sheets` (`id`, `employee_id`, `current_basic`, `new_basic_salary`, `da`, `pp`, `medical`, `convance`, `wash`, `mobile`, `cycle`, `charge`, `other`, `gross_pay`, `gpf`, `gpf_recovery`, `group_insurance`, `house_rent`, `house_loan_recovery`, `vehicle_recovery`, `telephone_recovery`, `others_recovery`, `tiffin`, `motorcycle_loan`, `house_build_recovery`, `house_repair_recovery`, `bycycle_loan`, `computer_loan`, `car_loan`, `extra_loan`, `gpf_loan`, `education`, `fixed_house_rent_recovery`, `health_insurance`, `water_supply_recovery`, `electricity_recovery`, `bf_recovery`, `gi`, `gi_recovery`, `emp_tax`, `tin_shade_recovery`, `salary_type_id`, `status`, `total_recovery`, `net_pay`, `bonus`, `bonus_type`, `deduct_salary`, `fiscal_year_id`, `month_id`, `created_at`, `updated_at`) VALUES
(290, 76, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23158.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(291, 77, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 2285.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5304.00, 18311.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(292, 78, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 1029.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 2680.00, 21435.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(293, 79, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20600.00, 1200.00, 1, 0, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1250.00, 19350.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(294, 80, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23658.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(295, 81, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1413.00, 0.00, 8.00, 1922.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4794.00, 19321.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(296, 82, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 1219.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4225.00, 20955.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(297, 83, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1413.00, 0.00, 8.00, 1054.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3997.00, 20683.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(298, 84, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23658.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(299, 85, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(300, 86, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(301, 87, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1413.00, 0.00, 8.00, 4050.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6993.00, 18187.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(302, 88, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3150.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5331.00, 18784.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(303, 89, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 540.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3721.00, 20394.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(304, 90, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22110.00, 1334.00, 1, 0, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1384.00, 20726.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(305, 91, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1, 0, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1384.00, 21226.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(306, 92, 13050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22675.00, 1305.00, 1, 0, 6525.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1355.00, 21320.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(307, 93, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1401.00, 0.00, 8.00, 2400.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5331.00, 19849.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(308, 94, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 22658.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(309, 95, 10050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17550.00, 1005.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1785.00, 15765.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(310, 96, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(311, 97, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 21664.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(312, 98, 2755.00, 0.00, 551.00, 0.00, 700.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 7006.00, 275.50, 1, 0, 2800.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 27.55, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 303.05, 6702.95, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(313, 99, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22164.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(314, 100, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2172.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5623.00, 17492.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(315, 101, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(316, 102, 24870.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 37561.50, 2487.00, 1, 0, 11191.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2871.00, 34690.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(317, 103, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1718.00, 25962.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(318, 104, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18680.00, 2000.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 12.00, 1394.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3456.00, 15224.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(319, 105, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2230.00, 27537.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(320, 106, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2960.00, 26807.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(321, 107, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29267.00, 2000.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2384.00, 26883.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(322, 108, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22550.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21130.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(323, 109, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22550.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21130.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(324, 110, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 3425.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3475.00, 19575.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(325, 111, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21000.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 19690.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(326, 112, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1560.00, 0.00, 8.00, 2775.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5794.00, 18321.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(327, 113, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(328, 114, 21450.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 34102.50, 5362.50, 1, 0, 9652.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6746.50, 27356.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(329, 115, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32109.00, 2042.00, 1, 0, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2426.00, 29683.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(330, 116, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 20985.00, 1796.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 4717.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6909.00, 14076.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(331, 117, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29042.00, 1500.00, 1, 0, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 1884.00, 27158.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(332, 118, 18400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29180.00, 1840.00, 1, 0, 8280.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 3507.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5731.00, 23449.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(333, 119, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21460.00, 2000.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2396.00, 19064.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(334, 120, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20960.00, 1796.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 1499.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3679.00, 17281.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(335, 121, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 25705.00, 1512.00, 1, 0, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1562.00, 24143.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(336, 122, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1718.00, 25962.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(337, 123, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 3091.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7107.00, 20573.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(338, 124, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27600.00, 1710.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1760.00, 25840.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(339, 125, 15880.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 26820.00, 1588.00, 1, 0, 7940.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 2401.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6337.00, 20483.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(340, 126, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27180.00, 1668.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 879.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4016.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6613.00, 20567.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(341, 127, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2241.00, 0.00, 12.00, 2314.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6128.00, 19537.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(342, 128, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 24104.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(343, 129, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 23575.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 22155.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(344, 130, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(345, 131, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21100.00, 1200.00, 1, 0, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1250.00, 19850.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(346, 132, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17433.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 16426.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(347, 133, 15460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25790.00, 1546.00, 1, 0, 7730.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1596.00, 24194.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(348, 134, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22260.00, 1260.00, 1, 0, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20950.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(349, 135, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 8.00, 1406.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 3136.00, 22044.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(350, 136, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1946.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 3668.00, 20512.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(351, 137, 12700.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20850.00, 0.00, 0, 0, 6350.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 780.00, 20070.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(352, 138, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3854.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6305.00, 16810.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(353, 139, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 478.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1929.00, 21686.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(354, 140, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1, 0, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3878.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6262.00, 16348.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(355, 141, 13230.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22945.00, 1323.00, 1, 0, 6615.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2232.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4335.00, 18610.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(356, 142, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1, 0, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 495.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 2360.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5239.00, 17371.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(357, 143, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32609.00, 2042.00, 1, 0, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2426.00, 30183.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(358, 144, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29267.00, 1846.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2150.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6110.00, 23157.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(359, 145, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30115.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 27792.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(360, 146, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1512.00, 1, 0, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1562.00, 23618.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(361, 147, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21630.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(362, 148, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28792.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(363, 149, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 22575.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21155.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(364, 150, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 1691.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4626.00, 19489.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(365, 151, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(366, 152, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(367, 153, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28792.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(368, 154, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27600.00, 3000.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3050.00, 24550.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(369, 155, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(370, 156, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1500.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1550.00, 26130.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(371, 157, 17580.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20580.00, 1758.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 2955.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4775.00, 15805.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(372, 158, 16280.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 26805.00, 1628.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1678.00, 25127.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(373, 159, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 29067.00, 1796.00, 1, 0, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2180.00, 26887.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(374, 160, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 29067.00, 1796.00, 1, 0, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2180.00, 26887.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(375, 161, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 29067.00, 1796.00, 1, 0, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2180.00, 26887.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(376, 162, 14400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24100.00, 1440.00, 1, 0, 7200.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1490.00, 22610.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(377, 163, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24085.00, 1439.00, 1, 0, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1489.00, 22596.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(378, 164, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1560.00, 0.00, 8.00, 3146.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6165.00, 17950.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(379, 165, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20600.00, 1200.00, 1, 0, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1250.00, 19350.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(380, 166, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22000.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1310.00, 20690.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(381, 167, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31609.00, 2042.00, 1, 0, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2426.00, 29183.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(382, 168, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30615.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28292.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(383, 169, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2230.00, 27537.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(384, 170, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 5460.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 9988.00, 19779.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(385, 171, 13040.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15540.00, 1304.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 12.00, 1489.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2855.00, 12685.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(386, 172, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15120.00, 1312.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 12.00, 2465.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3839.00, 11281.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(387, 173, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25165.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23604.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(388, 174, 13780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22670.00, 1378.00, 1, 0, 6890.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1428.00, 21242.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(389, 175, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21680.00, 1312.00, 1, 0, 6560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1362.00, 20318.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(390, 176, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(391, 177, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(392, 178, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 21664.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(393, 179, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1401.00, 0.00, 8.00, 3034.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5894.00, 18221.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(394, 180, 23680.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 36836.00, 2368.00, 1, 0, 10656.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2752.00, 34084.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(395, 181, 12740.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21110.00, 0.00, 0, 0, 6370.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 50.00, 21060.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(396, 182, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 3502.50, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3552.50, 19562.50, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(397, 183, 26760.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 40302.00, 2676.00, 1, 0, 12042.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3060.00, 37242.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(398, 184, 10430.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 17830.00, 1043.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1093.00, 16737.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(399, 185, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21630.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(400, 186, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1476.00, 0.00, 8.00, 1552.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4487.00, 19128.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(401, 187, 26120.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 40374.00, 2612.00, 1, 0, 11754.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2996.00, 37378.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(402, 188, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 2075.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5010.00, 19105.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(403, 189, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 19680.00, 2000.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 2408.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4458.00, 15222.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(404, 190, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(405, 191, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 32709.00, 2042.00, 1, 0, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2426.00, 30283.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(406, 192, 13050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22175.00, 1305.00, 1, 0, 6525.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1355.00, 20820.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(407, 193, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 28200.00, 1710.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 237.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1997.00, 26203.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(408, 194, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21730.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(409, 195, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25780.00, 1512.00, 1, 0, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 8.00, 1620.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5476.00, 20304.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(410, 196, 14400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24200.00, 1440.00, 1, 0, 7200.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 2241.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3739.00, 20461.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(411, 197, 12410.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21215.00, 1241.00, 1, 0, 6205.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1401.00, 0.00, 8.00, 2482.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5182.00, 16033.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(412, 198, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 27276.00, 1511.00, 1, 0, 9066.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 25715.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(413, 199, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21780.00, 1312.00, 1, 0, 6560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1362.00, 20418.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(414, 200, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24765.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2241.00, 0.00, 8.00, 2225.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6035.00, 18730.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(415, 201, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 2241.00, 0.00, 8.00, 1424.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5093.00, 18057.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(416, 202, 11320.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20212.00, 1132.00, 1, 0, 6792.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1182.00, 19030.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(417, 203, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21730.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(418, 204, 15110.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25465.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23904.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(419, 205, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25265.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23704.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(420, 206, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24685.00, 1439.00, 1, 0, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1489.00, 23196.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(421, 207, 15870.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 26405.00, 1587.00, 1, 0, 7935.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 1081.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4286.00, 22119.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(422, 208, 14470.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24305.00, 1447.00, 1, 0, 7235.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1497.00, 22808.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(423, 209, 14470.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24805.00, 1447.00, 1, 0, 7235.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1497.00, 23308.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(424, 210, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 1892.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 3543.00, 20572.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(425, 211, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 1242.00, 1, 0, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 1310.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4170.00, 17060.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(426, 212, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 2484.00, 1, 0, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1413.00, 0.00, 8.00, 1340.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5295.00, 15935.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(427, 213, 12090.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20235.00, 1209.00, 1, 0, 6045.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1259.00, 18976.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(428, 214, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1560.00, 0.00, 8.00, 1314.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4333.00, 19782.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(429, 215, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1299.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 2950.00, 20165.00, NULL, NULL, 0.00, 2, 2, '2017-10-02', NULL),
(430, 1, 66120.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 95468.00, 0.00, 0, 0, 26448.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 414.00, 95054.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(431, 2, 60840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 400.00, 88076.00, 6084.00, 1, 0, 24336.00, 0.00, 1553.40, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8051.40, 80024.60, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(432, 4, 58560.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 84484.00, 5856.00, 1, 0, 23424.00, 0.00, 1258.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8528.00, 75956.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(433, 5, 56030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 80942.00, 5603.00, 1, 0, 22412.00, 0.00, 1344.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4167.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 11528.20, 69413.80, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL);
INSERT INTO `employee_salary_sheets` (`id`, `employee_id`, `current_basic`, `new_basic_salary`, `da`, `pp`, `medical`, `convance`, `wash`, `mobile`, `cycle`, `charge`, `other`, `gross_pay`, `gpf`, `gpf_recovery`, `group_insurance`, `house_rent`, `house_loan_recovery`, `vehicle_recovery`, `telephone_recovery`, `others_recovery`, `tiffin`, `motorcycle_loan`, `house_build_recovery`, `house_repair_recovery`, `bycycle_loan`, `computer_loan`, `car_loan`, `extra_loan`, `gpf_loan`, `education`, `fixed_house_rent_recovery`, `health_insurance`, `water_supply_recovery`, `electricity_recovery`, `bf_recovery`, `gi`, `gi_recovery`, `emp_tax`, `tin_shade_recovery`, `salary_type_id`, `status`, `total_recovery`, `net_pay`, `bonus`, `bonus_type`, `deduct_salary`, `fiscal_year_id`, `month_id`, `created_at`, `updated_at`) VALUES
(434, 6, 56030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 79942.00, 5603.00, 1, 0, 22412.00, 0.00, 507.60, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 7524.60, 72417.40, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(435, 7, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1, 0, 16336.00, 0.00, 59.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4557.20, 55118.80, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(436, 8, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 57390.00, 0.00, 0, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 414.00, 56976.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(437, 9, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1, 0, 16336.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4498.00, 55178.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(438, 10, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1, 0, 16000.00, 0.00, 533.00, 0.00, 0.00, 0.00, 730.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 4084.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 10650.00, 45740.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(439, 11, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1, 0, 16000.00, 0.00, 86.40, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4389.40, 52000.60, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(440, 12, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 54530.00, 3703.00, 1, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3542.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 7659.00, 46871.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(441, 13, 40840.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59676.00, 4084.00, 1, 0, 16336.00, 0.00, 64.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4562.80, 55113.20, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(442, 14, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55530.00, 3703.00, 1, 0, 16000.00, 0.00, 399.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4516.80, 51013.20, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(443, 15, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56390.00, 3889.00, 1, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4303.00, 52087.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(444, 16, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 54530.00, 3703.00, 1, 0, 16000.00, 0.00, 137.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4254.20, 50275.80, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(445, 17, 33580.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50191.00, 3358.00, 1, 0, 15111.00, 0.00, 73.60, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3845.60, 46345.40, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(446, 18, 28100.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 42245.00, 2810.00, 1, 0, 12645.00, 0.00, 19.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3243.20, 39001.80, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(447, 19, 25480.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 38446.00, 2548.00, 1, 0, 11466.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 2962.00, 35484.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(448, 20, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 57390.00, 3889.00, 1, 0, 16000.00, 0.00, 108.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 5188.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 10599.00, 46791.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(449, 21, 35260.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 53627.00, 3526.00, 1, 0, 15867.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3940.00, 49687.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(450, 22, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 57415.00, 3889.00, 1, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 7635.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 12938.00, 44477.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(451, 23, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 55055.00, 3703.00, 1, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 1500.00, 500.00, 7000.00, 0.00, 12.00, 1423.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 15052.00, 40003.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(452, 24, 38890.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 57415.00, 3889.00, 1, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4303.00, 53112.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(453, 25, 37030.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55530.00, 3703.00, 1, 0, 16000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4117.00, 51413.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(454, 26, 29370.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 44111.50, 2937.00, 1, 0, 13216.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 6851.00, 37260.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(455, 27, 22550.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 35197.50, 2255.00, 1, 0, 10147.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 2669.00, 32528.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(456, 28, 28100.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 42745.00, 2810.00, 1, 0, 12645.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3224.00, 39521.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(457, 29, 29370.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 44086.50, 2937.00, 1, 0, 13216.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 3438.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 8789.00, 35297.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(458, 30, 25480.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 38446.00, 2548.00, 1, 0, 11466.00, 0.00, 167.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 4129.20, 34316.80, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(459, 31, 18530.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 20055.00, 1853.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 12.00, 999.00, 50.00, 30.00, 1.00, 334.00, 0.00, 0, 'Active', 3278.00, 16777.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(460, 32, 32390.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 75.00, 0.00, 49040.50, 3239.00, 1, 0, 14575.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3623.00, 45417.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(461, 33, 29510.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 45289.50, 2951.00, 1, 0, 13279.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3335.00, 41954.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(462, 34, 22550.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 35197.50, 2255.00, 1, 0, 10147.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3639.00, 31558.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(463, 35, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1512.00, 1, 0, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1708.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4270.00, 20410.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(464, 36, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30615.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 725.50, 0.00, 0.00, 0.00, 0.00, 0.00, 6030.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 9078.50, 21537.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(465, 37, 21470.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 33631.50, 2147.00, 1, 0, 9661.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3932.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6463.00, 27168.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(466, 38, 20360.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22860.00, 2036.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1534.00, 500.00, 0.00, 0.00, 12.00, 1116.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5812.00, 17048.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(467, 39, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30115.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 27792.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(468, 40, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 693.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4984.00, 20681.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(469, 41, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2610.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5933.00, 25182.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(470, 42, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 28542.00, 1796.00, 1, 0, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2516.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5426.00, 23116.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(471, 43, 12490.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20735.00, 1249.00, 1, 0, 6245.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1375.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3404.00, 17331.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(472, 44, 15880.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25820.00, 1588.00, 1, 0, 7940.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1638.00, 24182.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(473, 45, 10430.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 17830.00, 1043.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1823.00, 16007.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(474, 46, 13780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23170.00, 3445.00, 1, 0, 6890.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 465.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1401.00, 0.00, 12.00, 844.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6217.00, 16953.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(475, 47, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 28100.00, 1710.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2292.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5052.00, 23048.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(476, 48, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24085.00, 3597.50, 1, 0, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2209.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6586.50, 17498.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(477, 49, 13710.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22665.00, 3427.50, 1, 0, 6855.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1417.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5624.50, 17040.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(478, 50, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25265.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23704.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(479, 51, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(480, 52, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 558.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 1799.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 4008.00, 20107.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(481, 53, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17433.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 16426.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(482, 54, 13710.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23665.00, 1371.00, 1, 0, 6855.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 4645.00, 1000.00, 1560.00, 0.00, 8.00, 1831.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 10465.00, 13200.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(483, 55, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21100.00, 1200.00, 1, 0, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1250.00, 19850.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(484, 56, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2125.00, 1000.00, 1413.00, 0.00, 8.00, 1085.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6693.00, 18487.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(485, 57, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 555.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2813.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4819.00, 19296.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(486, 58, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1196.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3236.00, 18264.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(487, 59, 9850.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17350.00, 985.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1035.00, 16315.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(488, 60, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21000.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 462.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2502.00, 18498.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(489, 61, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3125.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5647.00, 19033.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(490, 62, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2040.00, 19460.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(491, 63, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17320.00, 1472.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 4916.00, 500.00, 0.00, 0.00, 0.00, 627.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 8065.00, 9255.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(492, 64, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23110.00, 1334.00, 1, 0, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 510.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1225.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3119.00, 19991.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(493, 65, 12700.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21850.00, 0.00, 0, 0, 6350.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 510.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 560.00, 21290.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(494, 66, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 492.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3370.00, 18130.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(495, 67, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 1242.00, 1, 0, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1292.00, 19938.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(496, 68, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3667.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6118.00, 17497.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(497, 69, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 1946.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4952.00, 20228.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(498, 70, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 594.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2175.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4950.00, 19165.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(499, 71, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 594.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2116.00, 23064.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(500, 72, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 0.00, 719.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4447.00, 20733.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(501, 73, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1302.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3342.00, 18158.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(502, 74, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21500.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2040.00, 19460.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(503, 75, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 621.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3143.00, 21537.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(504, 76, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1522.00, 23158.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(505, 77, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 1172.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5191.00, 18424.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(506, 78, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 1945.00, 1000.00, 0.00, 0.00, 0.00, 730.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 5326.00, 18789.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(507, 79, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20600.00, 1200.00, 1, 0, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1980.00, 18620.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(508, 80, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 558.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2500.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4580.00, 20600.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(509, 81, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 594.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3439.00, 1000.00, 1413.00, 0.00, 8.00, 869.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7774.00, 16341.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(510, 82, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2292.00, 1000.00, 1476.00, 0.00, 8.00, 650.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5948.00, 19232.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(511, 83, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24680.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3646.00, 500.00, 1413.00, 0.00, 8.00, 514.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 8103.00, 16577.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(512, 84, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2252.00, 22928.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(513, 85, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2181.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3632.00, 20483.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(514, 86, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 576.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2403.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4430.00, 19685.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(515, 87, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3422.00, 1000.00, 1413.00, 0.00, 8.00, 2094.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 9459.00, 15721.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(516, 88, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(517, 89, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(518, 90, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22110.00, 1334.00, 1, 0, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 450.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1834.00, 20276.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(519, 91, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1, 0, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 495.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1879.00, 20731.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(520, 92, 13050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22675.00, 1305.00, 1, 0, 6525.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1355.00, 21320.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(521, 93, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3623.00, 1000.00, 1401.00, 0.00, 8.00, 1202.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7756.00, 17424.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(522, 94, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 594.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2883.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4999.00, 19181.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(523, 95, 10050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17550.00, 1005.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1055.00, 16495.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(524, 96, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1737.00, 15196.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(525, 97, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 21664.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(526, 98, 2755.00, 0.00, 551.00, 0.00, 700.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 7006.00, 275.50, 1, 0, 2800.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 525.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 27.55, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 828.05, 6177.95, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(527, 99, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2355.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3806.00, 19809.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(528, 100, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 21664.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(529, 101, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 22664.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(530, 102, 24870.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 37561.50, 2487.00, 1, 0, 11191.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3871.00, 33690.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(531, 103, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 697.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3415.00, 24265.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(532, 104, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18680.00, 2000.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 2464.00, 0.00, 0.00, 0.00, 12.00, 708.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6234.00, 12446.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(533, 105, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2960.00, 26807.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(534, 106, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2230.00, 27537.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(535, 107, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29267.00, 2000.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2384.00, 26883.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(536, 108, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22550.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2150.00, 20400.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(537, 109, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22550.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2420.00, 20130.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(538, 110, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 3425.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4205.00, 18845.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(539, 111, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21000.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1625.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3665.00, 17335.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(540, 112, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 510.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3010.00, 1000.00, 1560.00, 0.00, 8.00, 1369.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7908.00, 16207.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(541, 113, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 15926.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(542, 114, 21450.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 34102.50, 5362.50, 1, 0, 9652.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6746.50, 27356.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(543, 115, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32109.00, 2042.00, 1, 0, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 738.00, 0.00, 0.00, 0.00, 0.00, 0.00, 6528.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 9692.00, 22417.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(544, 116, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 20985.00, 1796.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 2038.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 4230.00, 16755.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(545, 117, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29042.00, 1500.00, 1, 0, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2884.00, 26158.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(546, 118, 18400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29180.00, 1840.00, 1, 0, 8280.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2954.00, 26226.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(547, 119, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21460.00, 2000.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 738.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4167.00, 1000.00, 0.00, 0.00, 12.00, 1801.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 9102.00, 12358.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(548, 120, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20960.00, 1796.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 724.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 680.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3584.50, 17375.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(549, 121, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 25705.00, 1512.00, 1, 0, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1562.00, 24143.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(550, 122, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2084.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4532.00, 23148.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(551, 123, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1668.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 1481.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5497.00, 22183.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(552, 124, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27600.00, 1710.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1760.00, 25840.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(553, 125, 15880.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 26820.00, 1588.00, 1, 0, 7940.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 346.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4282.50, 22537.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(554, 126, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27180.00, 1668.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1718.00, 25462.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(555, 127, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2241.00, 0.00, 12.00, 1088.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6632.00, 19033.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(556, 128, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25665.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2671.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4232.00, 21433.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(557, 129, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 23575.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 22155.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(558, 130, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2181.00, 21934.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(559, 131, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21100.00, 1200.00, 1, 0, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1980.00, 19120.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(560, 132, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 17433.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1007.00, 16426.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(561, 133, 15460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25790.00, 1546.00, 1, 0, 7730.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 510.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2106.00, 23684.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(562, 134, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22260.00, 1260.00, 1, 0, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1257.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3297.00, 18963.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(563, 135, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 576.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2458.00, 1000.00, 0.00, 0.00, 8.00, 893.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 5657.00, 19523.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(564, 136, 14720.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24180.00, 1472.00, 1, 0, 7360.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1564.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 4016.00, 20164.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(565, 137, 12700.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20850.00, 0.00, 0, 0, 6350.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 50.00, 20800.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(566, 138, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1451.00, 21664.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(567, 139, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 4912.00, 500.00, 0.00, 0.00, 0.00, 324.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7687.00, 15928.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(568, 140, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1, 0, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1384.00, 21226.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(569, 141, 13230.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22945.00, 1323.00, 1, 0, 6615.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1373.00, 21572.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(570, 142, 13340.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22610.00, 1334.00, 1, 0, 6670.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 1080.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2464.00, 20146.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(571, 143, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32609.00, 2042.00, 1, 0, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4775.21, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 7201.21, 25407.79, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(572, 144, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29267.00, 1846.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2230.00, 27037.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(573, 145, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30115.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3813.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 7136.00, 22979.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(574, 146, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25180.00, 1512.00, 1, 0, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1562.00, 23618.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(575, 147, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21630.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(576, 148, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 958.50, 0.00, 0.00, 0.00, 0.00, 0.00, 2154.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5435.50, 25680.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL);
INSERT INTO `employee_salary_sheets` (`id`, `employee_id`, `current_basic`, `new_basic_salary`, `da`, `pp`, `medical`, `convance`, `wash`, `mobile`, `cycle`, `charge`, `other`, `gross_pay`, `gpf`, `gpf_recovery`, `group_insurance`, `house_rent`, `house_loan_recovery`, `vehicle_recovery`, `telephone_recovery`, `others_recovery`, `tiffin`, `motorcycle_loan`, `house_build_recovery`, `house_repair_recovery`, `bycycle_loan`, `computer_loan`, `car_loan`, `extra_loan`, `gpf_loan`, `education`, `fixed_house_rent_recovery`, `health_insurance`, `water_supply_recovery`, `electricity_recovery`, `bf_recovery`, `gi`, `gi_recovery`, `emp_tax`, `tin_shade_recovery`, `salary_type_id`, `status`, `total_recovery`, `net_pay`, `bonus`, `bonus_type`, `deduct_salary`, `fiscal_year_id`, `month_id`, `created_at`, `updated_at`) VALUES
(577, 149, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 22575.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1420.00, 21155.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(578, 150, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 510.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1476.00, 0.00, 8.00, 730.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4175.00, 19940.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(579, 151, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 525.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 1699.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4675.00, 19440.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(580, 152, 9570.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 16933.50, 957.00, 1, 0, 5263.50, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1737.00, 15196.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(581, 153, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31115.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 4053.00, 27062.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(582, 154, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27600.00, 3000.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3050.00, 24550.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(583, 155, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 2632.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5083.00, 19032.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(584, 156, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 27680.00, 1500.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1550.00, 26130.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(585, 157, 17580.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20580.00, 1758.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 12.00, 1654.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3474.00, 17106.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(586, 158, 16280.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 26805.00, 1628.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 920.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2598.00, 24207.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(587, 159, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 29067.00, 1796.00, 1, 0, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3180.00, 25887.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(588, 160, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 29067.00, 1796.00, 1, 0, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 752.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4104.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 7036.00, 22031.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(589, 161, 17960.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 25.00, 0.00, 0.00, 29067.00, 1796.00, 1, 0, 8082.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3958.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6138.00, 22929.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(590, 162, 14400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24100.00, 1440.00, 1, 0, 7200.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3220.00, 20880.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(591, 163, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24085.00, 1439.00, 1, 0, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1489.00, 22596.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(592, 164, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1560.00, 0.00, 8.00, 1060.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5079.00, 19036.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(593, 165, 12000.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20600.00, 1200.00, 1, 0, 6000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2980.00, 17620.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(594, 166, 12600.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22000.00, 1260.00, 1, 0, 6300.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1350.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3660.00, 18340.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(595, 167, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31609.00, 2042.00, 1, 0, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2426.00, 29183.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(596, 168, 19390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30615.50, 1939.00, 1, 0, 8725.50, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 2323.00, 28292.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(597, 169, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 3230.00, 26537.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(598, 170, 18460.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29767.00, 1846.00, 1, 0, 8307.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 920.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 2286.00, 0.00, 12.00, 2962.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 8410.00, 21357.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(599, 171, 13040.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15540.00, 1304.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 12.00, 1144.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3240.00, 12300.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(600, 172, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15120.00, 1312.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 12.00, 1454.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3558.00, 11562.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(601, 173, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25165.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1561.00, 23604.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(602, 174, 13780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22670.00, 1378.00, 1, 0, 6890.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1428.00, 21242.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(603, 175, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21680.00, 1312.00, 1, 0, 6560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2092.00, 19588.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(604, 176, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(605, 177, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(606, 178, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3396.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5847.00, 17268.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(607, 179, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 525.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2584.00, 1000.00, 1401.00, 0.00, 8.00, 1653.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7622.00, 16493.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(608, 180, 23680.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 36836.00, 2368.00, 1, 0, 10656.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5515.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 9267.00, 27569.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(609, 181, 12740.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21110.00, 0.00, 0, 0, 6370.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 50.00, 21060.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(610, 182, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 3502.50, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5282.50, 17832.50, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(611, 183, 26760.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 40302.00, 2676.00, 1, 0, 12042.00, 0.00, 0.00, 0.00, 0.00, 0.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2175.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 5965.00, 34337.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(612, 184, 10430.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 17830.00, 1043.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1093.00, 16737.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(613, 185, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23050.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1025.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3175.00, 19875.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(614, 186, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23615.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2896.00, 500.00, 1476.00, 0.00, 8.00, 784.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7345.00, 16270.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(615, 187, 26120.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 40374.00, 2612.00, 1, 0, 11754.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3397.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 6393.00, 33981.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(616, 188, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 555.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2879.00, 1000.00, 1476.00, 0.00, 8.00, 1001.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7370.00, 16745.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(617, 189, 16680.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 19680.00, 2000.00, 1, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4105.00, 1000.00, 0.00, 0.00, 0.00, 1031.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 8186.00, 11494.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(618, 190, 10780.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 18180.00, 1078.00, 1, 0, 5400.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1128.00, 17052.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(619, 191, 20420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 32709.00, 2042.00, 1, 0, 9189.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 813.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1250.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 334.00, 0.00, 0, 'Active', 4489.00, 28220.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(620, 192, 13050.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 22175.00, 1305.00, 1, 0, 6525.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1355.00, 20820.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(621, 193, 17100.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 28200.00, 1710.00, 1, 0, 8000.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 116.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2606.00, 25594.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(622, 194, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2150.00, 21000.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(623, 195, 15120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25780.00, 1512.00, 1, 0, 7560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1655.00, 1000.00, 2286.00, 0.00, 8.00, 763.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6274.00, 19506.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(624, 196, 14400.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24200.00, 1440.00, 1, 0, 7200.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1449.00, 500.00, 2241.00, 0.00, 8.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5188.00, 19012.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(625, 197, 12410.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21215.00, 1241.00, 1, 0, 6205.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 730.00, 500.00, 1401.00, 0.00, 8.00, 923.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4353.00, 16862.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(626, 198, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 27276.00, 1511.00, 1, 0, 9066.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1437.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 4728.00, 22548.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(627, 199, 13120.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21780.00, 1312.00, 1, 0, 6560.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 629.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2721.00, 19059.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(628, 200, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24765.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2241.00, 0.00, 8.00, 1538.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 6078.00, 18687.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(629, 201, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 656.00, 500.00, 2241.00, 0.00, 8.00, 735.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5790.00, 17360.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(630, 202, 11320.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20212.00, 1132.00, 1, 0, 6792.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1182.00, 19030.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(631, 203, 13700.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23150.00, 1370.00, 1, 0, 6850.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 750.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 2900.00, 20250.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(632, 204, 15110.00, 0.00, 0.00, 0.00, 1500.00, 0.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25465.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 2655.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5216.00, 20249.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(633, 205, 15110.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 25265.00, 1511.00, 1, 0, 7555.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 834.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3125.00, 22140.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(634, 206, 14390.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24685.00, 1439.00, 1, 0, 7195.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3219.00, 21466.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(635, 207, 15870.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 26405.00, 1587.00, 1, 0, 7935.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 542.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3747.00, 22658.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(636, 208, 14470.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24305.00, 1447.00, 1, 0, 7235.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 3186.00, 500.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5683.00, 18622.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(637, 209, 14470.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24805.00, 1447.00, 1, 0, 7235.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3086.00, 1000.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5123.00, 19682.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(638, 210, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 669.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3000.00, 1000.00, 0.00, 0.00, 0.00, 1113.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 6433.00, 17682.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(639, 211, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 1242.00, 1, 0, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1560.00, 0.00, 8.00, 438.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 3298.00, 17932.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(640, 212, 12420.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 21230.00, 2484.00, 1, 0, 6210.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 500.00, 1413.00, 0.00, 8.00, 680.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 5365.00, 15865.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(641, 213, 12090.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 20235.00, 1209.00, 1, 0, 6045.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 1989.00, 18246.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(642, 214, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 24115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 730.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2266.00, 1000.00, 1560.00, 0.00, 8.00, 1229.00, 50.00, 0.00, 0.00, 0.00, 0.00, 0, 'Active', 7244.00, 16871.00, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL),
(643, 215, 14010.00, 0.00, 0.00, 0.00, 1500.00, 300.00, 100.00, 0.00, 0.00, 0.00, 0.00, 23115.00, 1401.00, 1, 0, 7005.00, 0.00, 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2215.16, 0.00, 0.00, 0.00, 0.00, 1000.00, 50.00, 0.00, 0.00, 0.00, 200.00, 0, 'Active', 4866.16, 18248.84, NULL, NULL, 0.00, 2, 3, '2017-10-02', NULL);

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

--
-- Dumping data for table `fix_deposits`
--

INSERT INTO `fix_deposits` (`id`, `daily_transaction_id`, `deposit_bank_name`, `fix_deposit_bank_name`, `fix_deposit_branch_name`, `fix_deposit_no`, `interest_rate`, `investment_date`, `investment_expire_date`, `investment_amount`, `created_at`, `updated_at`) VALUES
(1, 12, NULL, 'IDBL', 'Tongi', '2323', '2.00', '2017-10-02', '2017-10-24', '3000.00', '2017-10-26', NULL);

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
  `deposit_loan_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `sub_status` int(1) NOT NULL DEFAULT '0',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `head_wise_account_balance`
--

CREATE TABLE `head_wise_account_balance` (
  `id` int(11) NOT NULL,
  `daily_transaction_id` int(11) NOT NULL,
  `acc_head_list_id` int(11) NOT NULL,
  `transaction_amount` decimal(12,2) NOT NULL,
  `flag` enum('Addition','Subtraction') NOT NULL,
  `head_balance` decimal(12,2) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `head_wise_account_balance`
--

INSERT INTO `head_wise_account_balance` (`id`, `daily_transaction_id`, `acc_head_list_id`, `transaction_amount`, `flag`, `head_balance`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '11.00', 'Addition', '11.00', '2017-10-25', NULL),
(2, 2, 4, '12.00', 'Addition', '12.00', '2017-10-25', NULL),
(3, 3, 2, '13.00', 'Addition', '13.00', '2017-10-25', NULL),
(4, 4, 29, '14.00', 'Addition', '14.00', '2017-10-25', NULL),
(6, 6, 5, '17.00', 'Addition', '17.00', '2017-10-25', NULL),
(8, 8, 6, '16.00', 'Addition', '16.00', '2017-10-26', NULL),
(9, 9, 7, '17.00', 'Addition', '17.00', '2017-10-26', NULL),
(10, 10, 8, '18.00', 'Addition', '18.00', '2017-10-26', NULL),
(11, 11, 9, '67.00', 'Addition', '67.00', '2017-10-26', NULL),
(12, 12, 10, '3000.00', 'Addition', '3000.00', '2017-10-26', NULL),
(13, 13, 11, '5000.00', 'Addition', '5000.00', '2017-10-26', NULL),
(14, 14, 16, '77.00', 'Addition', '77.00', '2017-10-26', NULL),
(15, 15, 15, '78.00', 'Addition', '78.00', '2017-10-26', NULL),
(16, 16, 18, '79.00', 'Addition', '79.00', '2017-10-26', NULL),
(17, 17, 17, '80.00', 'Addition', '80.00', '2017-10-26', NULL),
(18, 18, 14, '81.00', 'Addition', '81.00', '2017-10-26', NULL),
(19, 19, 19, '91.00', 'Addition', '91.00', '2017-10-26', NULL),
(20, 20, 22, '92.00', 'Addition', '92.00', '2017-10-26', NULL),
(21, 21, 21, '93.00', 'Addition', '93.00', '2017-10-26', NULL),
(23, 23, 29, '10.00', 'Subtraction', '4.00', '2017-10-26', NULL),
(25, 25, 29, '200.00', 'Addition', '204.00', '2017-10-26', NULL),
(27, 27, 15, '500.00', 'Addition', '578.00', '2017-10-26', NULL),
(28, 28, 17, '30.00', 'Subtraction', '50.00', '2017-10-26', NULL),
(29, 30, 27, '20.00', 'Addition', '20.00', '2017-10-26', NULL),
(30, 31, 27, '44.00', 'Addition', '64.00', '2017-10-26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `income_expense_details`
--

CREATE TABLE `income_expense_details` (
  `id` int(11) NOT NULL,
  `entry_type_id` tinyint(4) NOT NULL,
  `daily_transaction_id` int(11) NOT NULL,
  `acc_head_list_id` int(11) NOT NULL,
  `acc_sub_head_list_id` int(11) DEFAULT NULL,
  `acc_effect_id` int(11) NOT NULL,
  `amount` double(12,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `income_expense_details`
--

INSERT INTO `income_expense_details` (`id`, `entry_type_id`, `daily_transaction_id`, `acc_head_list_id`, `acc_sub_head_list_id`, `acc_effect_id`, `amount`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 14, 8, NULL, 2, 34000.00, 1, '2017-10-02 00:50:38', '0000-00-00 00:00:00'),
(2, 1, 19, 11, NULL, 1, 250.00, 1, '2017-10-02 11:07:16', '0000-00-00 00:00:00'),
(3, 1, 20, 11, NULL, 1, 2000.00, 1, '2017-10-03 15:37:14', '0000-00-00 00:00:00'),
(4, 1, 21, 8, NULL, 2, 300.00, 1, '2017-10-03 15:38:43', '0000-00-00 00:00:00'),
(5, 1, 22, 13, 18, 1, 3000.00, 1, '2017-10-03 15:48:01', '0000-00-00 00:00:00'),
(6, 1, 23, 13, 17, 1, 500.00, 1, '2017-10-03 15:49:15', '0000-00-00 00:00:00'),
(7, 1, 24, 13, 18, 1, 5000.00, 1, '2017-10-03 15:50:41', '0000-00-00 00:00:00'),
(8, 1, 25, 4, 9, 2, 250.00, 1, '2017-10-03 15:53:05', '0000-00-00 00:00:00'),
(9, 1, 27, 4, 9, 2, 350.00, 1, '2017-10-03 17:07:09', '0000-00-00 00:00:00'),
(10, 1, 28, 4, 31, 1, 450.00, 1, '2017-10-03 17:47:14', '0000-00-00 00:00:00');

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
-- Table structure for table `licence_categories`
--

CREATE TABLE `licence_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `licence_categories`
--

INSERT INTO `licence_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'A', '0000-00-00', '0000-00-00'),
(2, 'B', '0000-00-00', '0000-00-00'),
(3, 'C', '0000-00-00', '0000-00-00');

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
-- Table structure for table `loan_adjustments`
--

CREATE TABLE `loan_adjustments` (
  `id` int(11) NOT NULL,
  `employee_loan_id` int(11) NOT NULL,
  `adjustment_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `previous_current_due` double(10,2) NOT NULL DEFAULT '0.00',
  `previous_interest_amount_due` double(10,2) NOT NULL DEFAULT '0.00',
  `adjustment_on_current_due` double(10,2) NOT NULL DEFAULT '0.00',
  `adjustment_on_interest_amount_due` double(10,2) NOT NULL DEFAULT '0.00',
  `adjustment_date` date NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loan_adjustments`
--

INSERT INTO `loan_adjustments` (`id`, `employee_loan_id`, `adjustment_amount`, `previous_current_due`, `previous_interest_amount_due`, `adjustment_on_current_due`, `adjustment_on_interest_amount_due`, `adjustment_date`, `created_at`, `updated_at`) VALUES
(1, 70, 30000.00, 34270.00, 0.00, 0.00, 0.00, '2017-10-30', '2017-10-02', NULL),
(2, 155, 40000.00, 163328.00, 0.00, 0.00, 0.00, '2017-10-31', '2017-10-02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loan_recoveries`
--

CREATE TABLE `loan_recoveries` (
  `id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `employee_loan_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `recovery_loan_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `recovery_current_due` double(8,2) NOT NULL DEFAULT '0.00',
  `recovery_interest_amount_due` double(8,2) NOT NULL DEFAULT '0.00',
  `adjustment_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `datetime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `monthly_attendance_entries`
--

INSERT INTO `monthly_attendance_entries` (`id`, `employee_id`, `official_attendence`, `casual_leave`, `sick_leave`, `earned_leave`, `maternity_leave`, `total_attendance`, `panalty`, `fiscal_year_id`, `month_id`, `datetime`) VALUES
(1, 1, 22, 12, 21, 12, 14, 12, 14, 0, 1, '2017-07-10'),
(2, 22, 31, 2, 2, 2, 2, 25, 2000, 2, 1, '2017-10-01');

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
(225, 0, 0, 118, 2, 2, 3507.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
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
(239, 0, 0, 171, 2, 2, 1489.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(240, 0, 0, 172, 2, 2, 2465.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(241, 0, 0, 179, 2, 2, 3034.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(242, 0, 0, 186, 2, 2, 1552.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(243, 0, 0, 188, 2, 2, 2075.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(244, 0, 0, 189, 2, 2, 2408.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(245, 0, 0, 193, 2, 2, 237.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(246, 0, 0, 195, 2, 2, 1620.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(247, 0, 0, 197, 2, 2, 2482.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(248, 0, 0, 200, 2, 2, 2225.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(249, 0, 0, 201, 2, 2, 1424.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(250, 0, 0, 207, 2, 2, 1081.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(251, 0, 0, 210, 2, 2, 1892.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(252, 0, 0, 211, 2, 2, 1310.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(253, 0, 0, 212, 2, 2, 1340.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
(254, 0, 0, 214, 2, 2, 1314.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
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
(294, 0, 0, 193, 2, 3, 116.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
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
(633, 0, 0, 123, 3, 11, 1426.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1);
INSERT INTO `monthly_others_enties` (`id`, `designation_id`, `department_id`, `employee_id`, `fiscal_year_id`, `month_id`, `electric_bill`, `telephone_bill`, `rent_a_car_bill`, `others`, `created_at`, `updated_at`, `created_by`) VALUES
(634, 0, 0, 125, 3, 11, 924.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1),
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
(701, 0, 0, 214, 3, 12, 978.00, 0.00, 0.00, 0.00, '2017-09-21', '0000-00-00', 1);

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
  `account_no` int(11) DEFAULT NULL,
  `net_pay` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `bank_info_id` int(11) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `monthly_salary_notes`
--

INSERT INTO `monthly_salary_notes` (`id`, `emp_name`, `emp_id`, `designation`, `account_no`, `net_pay`, `month_id`, `fiscal_year_id`, `bank_info_id`, `date`) VALUES
(27, 'test', 12345, 'chairman', 333333, 600000, 1, 1, 2, '2017-08-01');

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
-- Table structure for table `project_types`
--

CREATE TABLE `project_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_types`
--

INSERT INTO `project_types` (`id`, `name`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'constructor', 'Active', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'repair', 'Active', 1, '2017-09-05 14:52:29', '2017-09-05 15:00:19'),
(5, 'Maintenance', 'Active', 1, '2017-09-05 15:10:42', '2017-09-05 15:11:10');

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
-- Table structure for table `security_deposite_return`
--

CREATE TABLE `security_deposite_return` (
  `id` int(11) NOT NULL,
  `work_order_id` int(11) NOT NULL,
  `work_order_no` varchar(100) NOT NULL,
  `security_return_amount` double(8,2) NOT NULL,
  `total_security_money_paid` double(11,2) NOT NULL,
  `voucher_no` varchar(40) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_note` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `security_deposite_return`
--

INSERT INTO `security_deposite_return` (`id`, `work_order_id`, `work_order_no`, `security_return_amount`, `total_security_money_paid`, `voucher_no`, `fiscal_year_id`, `payment_date`, `payment_note`, `user_id`, `created_at`, `updated_at`) VALUES
(31, 7, '1234', 2000.00, 2000.00, '1', 1, '2017-09-14', 'test', 0, '2017-09-20', '0000-00-00'),
(32, 9, '3456', 40000.00, 40000.00, '1', 1, '2017-09-14', 'test', 0, '2017-09-20', '0000-00-00'),
(33, 11, '0514', 50000.00, 50000.00, '1', 1, '2017-09-07', '1', 0, '2017-09-20', '0000-00-00'),
(34, 13, '456', 32500.00, 32500.00, '5566', 3, '2017-10-02', 'Security Deposit Return Payment Info', 0, '2017-10-03', '0000-00-00');

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
-- Table structure for table `stock_goods`
--

CREATE TABLE `stock_goods` (
  `id` int(11) NOT NULL,
  `daily_transaction_id` int(11) NOT NULL,
  `acc_head_list_id` int(11) NOT NULL,
  `goods_name` varchar(100) NOT NULL,
  `goods_amount` decimal(12,2) NOT NULL,
  `goods_value` decimal(12,2) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_goods`
--

INSERT INTO `stock_goods` (`id`, `daily_transaction_id`, `acc_head_list_id`, `goods_name`, `goods_amount`, `goods_value`, `created_at`, `updated_at`) VALUES
(1, 13, 11, 'Pencil', '2500.00', '1800.00', '2017-10-26', NULL),
(2, 13, 11, 'pen', '2500.00', '1200.00', '2017-10-26', NULL);

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
(459, 6, 'TrialBalances', 'admin_index', 0);

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
-- Table structure for table `work_orders`
--

CREATE TABLE `work_orders` (
  `id` int(11) NOT NULL,
  `contructor_project_name_id` int(11) NOT NULL,
  `contructor_name_id` int(11) NOT NULL,
  `work_order_no` varchar(40) NOT NULL,
  `fiscal_year_id` int(11) NOT NULL,
  `work_order_date` date NOT NULL,
  `work_order_details` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `work_orders`
--

INSERT INTO `work_orders` (`id`, `contructor_project_name_id`, `contructor_name_id`, `work_order_no`, `fiscal_year_id`, `work_order_date`, `work_order_details`, `user_id`, `created_at`, `updated_at`) VALUES
(7, 24, 5, '1111', 1, '2017-09-08', 'Malek Company is appointed to the project  Arena Properties', 1, '2017-09-12 11:25:13', '0000-00-00 00:00:00'),
(9, 24, 5, '3333', 1, '2017-09-08', 'details', 1, '2017-09-14 19:15:04', '0000-00-00 00:00:00'),
(10, 25, 5, '6666', 1, '2017-09-08', 'test', 1, '2017-09-19 13:03:49', '0000-00-00 00:00:00'),
(11, 26, 6, '7777', 1, '2017-09-05', 'test', 1, '2017-09-20 10:52:29', '0000-00-00 00:00:00'),
(12, 24, 5, '2222', 1, '2017-10-02', '', 1, '2017-10-02 13:47:11', '0000-00-00 00:00:00'),
(13, 28, 7, '5555', 3, '2017-09-15', 'Work order details', 1, '2017-10-03 10:56:38', '0000-00-00 00:00:00');

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
-- Indexes for table `asset_details`
--
ALTER TABLE `asset_details`
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
-- Indexes for table `branches`
--
ALTER TABLE `branches`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `quota_id` (`quota_id`),
  ADD KEY `employee_type_id` (`employee_type_id`),
  ADD KEY `religion_id` (`religion_id`),
  ADD KEY `job_status_id` (`job_status_id`);

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
-- Indexes for table `head_wise_account_balance`
--
ALTER TABLE `head_wise_account_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_expense_details`
--
ALTER TABLE `income_expense_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_statuses`
--
ALTER TABLE `job_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `licence_categories`
--
ALTER TABLE `licence_categories`
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
-- Indexes for table `loan_adjustments`
--
ALTER TABLE `loan_adjustments`
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
-- Indexes for table `project_types`
--
ALTER TABLE `project_types`
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
-- Indexes for table `security_deposite_return`
--
ALTER TABLE `security_deposite_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sexes`
--
ALTER TABLE `sexes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_goods`
--
ALTER TABLE `stock_goods`
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
-- Indexes for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acc_head_lists`
--
ALTER TABLE `acc_head_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `acc_head_types`
--
ALTER TABLE `acc_head_types`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `asset_details`
--
ALTER TABLE `asset_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bank_account_balance`
--
ALTER TABLE `bank_account_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `bank_infos`
--
ALTER TABLE `bank_infos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee_recoveries`
--
ALTER TABLE `employee_recoveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;
--
-- AUTO_INCREMENT for table `employee_salary_sheets`
--
ALTER TABLE `employee_salary_sheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=644;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `gpf_subscriptions`
--
ALTER TABLE `gpf_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `head_wise_account_balance`
--
ALTER TABLE `head_wise_account_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `income_expense_details`
--
ALTER TABLE `income_expense_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `job_statuses`
--
ALTER TABLE `job_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `licence_categories`
--
ALTER TABLE `licence_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
-- AUTO_INCREMENT for table `loan_adjustments`
--
ALTER TABLE `loan_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `loan_recoveries`
--
ALTER TABLE `loan_recoveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `monthly_others`
--
ALTER TABLE `monthly_others`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `monthly_others_enties`
--
ALTER TABLE `monthly_others_enties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=702;
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
-- AUTO_INCREMENT for table `project_types`
--
ALTER TABLE `project_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
-- AUTO_INCREMENT for table `security_deposite_return`
--
ALTER TABLE `security_deposite_return`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `sexes`
--
ALTER TABLE `sexes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `stock_goods`
--
ALTER TABLE `stock_goods`
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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=460;
--
-- AUTO_INCREMENT for table `warter_supply_setting`
--
ALTER TABLE `warter_supply_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `work_orders`
--
ALTER TABLE `work_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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
