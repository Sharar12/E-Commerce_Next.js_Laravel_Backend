-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2026 at 08:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_globixtech_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 1, '2025-10-04 07:32:56', '2025-10-04 07:32:56'),
(4, 'NovaElectronics', 1, '2025-10-04 07:50:46', '2025-10-04 07:50:46'),
(5, 'MegaMart', 1, '2025-10-04 07:50:56', '2025-10-04 07:50:56'),
(6, 'UrbanStyle', 1, '2025-10-04 07:51:06', '2025-10-04 07:51:06'),
(7, 'SmartHub', 1, '2025-10-04 07:51:16', '2025-10-04 07:51:16'),
(32, 'Sony', 1, '2026-07-22 15:21:07', '2026-07-22 15:21:07'),
(33, 'Nike', 1, '2026-07-22 15:21:07', '2026-07-22 15:21:07'),
(34, 'Adidas', 1, '2026-07-22 15:21:07', '2026-07-22 15:21:07'),
(35, 'Samsung', 1, '2026-07-22 15:21:07', '2026-07-22 15:21:07'),
(36, 'Zara', 1, '2026-07-22 15:21:07', '2026-07-22 15:21:07'),
(37, 'Gucci', 1, '2026-07-22 15:21:07', '2026-07-22 15:21:07'),
(38, 'Logitech', 1, '2026-07-22 15:21:07', '2026-07-22 15:21:07'),
(39, 'Canon', 1, '2026-07-22 15:21:07', '2026-07-22 15:21:07'),
(40, 'Anker', 1, '2026-07-22 15:21:07', '2026-07-22 15:21:07'),
(43, 'AAA', 1, '2026-07-22 23:22:50', '2026-07-22 23:22:50');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', 1, 'Gadgets, devices, and tech accessories', NULL, '2025-10-05 06:26:20', '2025-10-05 06:26:20'),
(2, 'Fashion', 1, 'Clothing, accessories, and style essentials', NULL, '2025-10-05 06:28:21', '2025-10-05 06:35:58'),
(3, 'Home & Living', 1, 'Furniture, decor, and household essentials', NULL, '2026-07-22 13:03:26', '2026-07-22 13:03:26'),
(4, 'Sports & Fitness', 1, 'Sports equipment and fitness gear', NULL, '2026-07-22 13:03:35', '2026-07-22 13:03:35'),
(5, 'Accessories', 1, 'Bags, watches, jewelry, and more', '/storage/uploads/categories/i5KK0E2Ahfsk6jHfyuo0xEMVxblxEYOwtJTLutQ2.jpg', '2026-07-22 13:03:43', '2026-07-30 09:03:52'),
(36, 'Beauty & Care', 1, 'E-commerce category: Beauty & Care', NULL, '2026-07-22 15:22:53', '2026-07-22 15:22:53'),
(37, 'Footwear', 1, 'E-commerce category: Footwear', NULL, '2026-07-22 15:22:53', '2026-07-22 15:22:53'),
(38, 'Audio & Sound', 1, 'E-commerce category: Audio & Sound', NULL, '2026-07-22 15:22:53', '2026-07-22 15:22:53'),
(40, 'BBBB', 1, 'BBBBBBBBBBBBB', NULL, '2026-07-22 23:19:47', '2026-07-22 23:19:58'),
(41, 'Medicine', 1, 'Best Drugs in the world', '/storage/uploads/categories/4SvRZwKTySquOEss5lAJPTI96Pyr0dhHKWBOhm4v.jpg', '2026-07-30 08:04:10', '2026-07-30 08:04:10'),
(42, 'DDDo', 1, 'sdvsbv', '/storage/uploads/categories/onvqt4dAKWJBQdKnjBNqcWvVx8Vt2w7U6RNIkRoW.jpg', '2026-07-30 09:04:33', '2026-07-30 09:04:33');

-- --------------------------------------------------------

--
-- Table structure for table `checkouts`
--

CREATE TABLE `checkouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `cart_items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`cart_items`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `min_purchase_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `max_discount_amount` decimal(10,2) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `usage_limit` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `visibility` enum('public','private','activity') NOT NULL DEFAULT 'public',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `assigned_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `activity_type` varchar(255) DEFAULT NULL,
  `activity_threshold` int(11) NOT NULL DEFAULT 1,
  `activity_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `description`, `discount_type`, `discount_value`, `min_purchase_amount`, `max_discount_amount`, `valid_from`, `valid_to`, `usage_limit`, `status`, `visibility`, `created_at`, `updated_at`, `assigned_user_id`, `activity_type`, `activity_threshold`, `activity_description`) VALUES
(1, 'WELCOME10', 'Get 10% off on your first purchase.', 'percentage', 10.00, 500.00, 200.00, '2025-10-04', '2025-11-08', 100, 'active', 'public', '2025-10-09 04:32:51', '2025-10-09 04:32:51', NULL, NULL, 1, NULL),
(2, 'FLAT50', 'Flat 50 BDT off on any order.', 'fixed', 50.00, 0.00, NULL, '2025-10-09', '2025-11-23', 0, 'active', 'public', '2025-10-09 04:32:51', '2025-10-09 04:32:51', NULL, NULL, 1, NULL),
(3, 'SUMMER25', '25% discount for summer sale.', 'percentage', 25.00, 1000.00, 400.00, '2025-09-29', '2025-10-29', 50, 'active', 'public', '2025-10-09 04:32:51', '2025-10-09 04:32:51', NULL, NULL, 1, NULL),
(4, 'FREESHIP', 'Free shipping on orders over 1500 BDT.', 'fixed', 100.00, 1500.00, 100.00, '2025-10-09', '2025-12-08', 0, 'active', 'public', '2025-10-09 04:32:51', '2025-10-09 04:32:51', NULL, NULL, 1, NULL),
(5, 'NEWYEAR2025', 'Celebrate New Year with 20% off.', 'percentage', 20.00, 800.00, 300.00, '2025-01-01', '2025-01-31', 200, 'inactive', 'public', '2025-10-09 04:32:51', '2025-10-09 04:32:51', NULL, NULL, 1, NULL),
(6, 'BUYMORE5', '5% off on purchases above 2000 BDT.', 'percentage', 5.00, 2000.00, 150.00, '2025-10-09', '2025-11-18', 500, 'active', 'public', '2025-10-09 04:32:51', '2025-10-09 04:32:51', NULL, NULL, 1, NULL),
(7, 'FLASHSALE', '50 BDT off during flash sale hours.', 'fixed', 50.00, 300.00, NULL, '2025-10-09', '2025-10-16', 100, 'active', 'public', '2025-10-09 04:32:51', '2025-10-09 04:32:51', NULL, NULL, 1, NULL),
(8, 'STUDENT15', 'Exclusive 15% off for students.', 'percentage', 15.00, 700.00, 250.00, '2025-10-07', '2025-11-03', 300, 'active', 'public', '2025-10-09 04:32:51', '2025-10-09 04:32:51', NULL, NULL, 1, NULL),
(9, 'BIRTHDAY100', 'Get 100 BDT off on your birthday!', 'fixed', 100.00, 500.00, 100.00, '2025-10-09', '2026-10-09', 1, 'active', 'public', '2025-10-09 04:32:51', '2025-10-09 04:32:51', NULL, NULL, 1, NULL),
(10, 'APPONLY10', '10% off for mobile app users only.', 'percentage', 10.00, 1000.00, 300.00, '2025-10-08', '2026-01-07', 1000, 'active', 'public', '2025-10-09 04:32:51', '2025-10-09 04:32:51', NULL, NULL, 1, NULL),
(11, 'UNCOMMON99', NULL, 'fixed', 999.00, 1000.00, NULL, NULL, NULL, 99, 'active', 'public', '2026-07-22 13:03:35', '2026-07-22 13:03:35', NULL, NULL, 1, NULL),
(12, 'UNC773', NULL, 'fixed', 999.00, 1000.00, NULL, NULL, NULL, 99, 'active', 'public', '2026-07-22 13:03:51', '2026-07-22 13:03:51', NULL, NULL, 1, NULL),
(13, 'UNC944', NULL, 'fixed', 999.00, 1000.00, NULL, NULL, NULL, 99, 'active', 'public', '2026-07-22 13:04:00', '2026-07-22 13:04:00', NULL, NULL, 1, NULL),
(14, 'UNC964', NULL, 'fixed', 999.00, 1000.00, NULL, NULL, NULL, 99, 'active', 'public', '2026-07-22 13:04:09', '2026-07-22 13:04:09', NULL, NULL, 1, NULL),
(15, 'UNC470', NULL, 'fixed', 999.00, 1000.00, NULL, NULL, NULL, 99, 'active', 'public', '2026-07-22 13:14:53', '2026-07-22 13:14:53', NULL, NULL, 1, NULL),
(16, 'TEST100', NULL, 'fixed', 100.00, 500.00, NULL, NULL, NULL, 10, 'active', 'public', '2026-07-22 13:20:51', '2026-07-22 13:20:51', NULL, NULL, 1, NULL),
(17, 'ZEUS2026_52', NULL, 'percentage', 25.00, 4500.00, NULL, NULL, NULL, 74, 'active', 'public', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL, NULL, 1, NULL),
(18, 'ATHENA50_94', NULL, 'fixed', 5000.00, 3800.00, NULL, NULL, NULL, 77, 'active', 'public', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL, NULL, 1, NULL),
(19, 'HERA15_18', NULL, 'percentage', 15.00, 1100.00, NULL, NULL, NULL, 42, 'active', 'public', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL, NULL, 1, NULL),
(20, 'POSEIDON30_18', NULL, 'fixed', 3000.00, 1300.00, NULL, NULL, NULL, 30, 'active', 'public', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL, NULL, 1, NULL),
(21, 'APOLLO20_89', NULL, 'percentage', 20.00, 4300.00, NULL, NULL, NULL, 27, 'active', 'public', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL, NULL, 1, NULL),
(22, 'APHRODITE10_46', NULL, 'fixed', 1000.00, 2000.00, NULL, NULL, NULL, 56, 'active', 'public', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL, NULL, 1, NULL),
(23, 'ARES40_62', NULL, 'percentage', 40.00, 4300.00, NULL, NULL, NULL, 81, 'active', 'public', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL, NULL, 1, NULL),
(24, 'HERMES5_26', NULL, 'fixed', 500.00, 2200.00, NULL, NULL, NULL, 89, 'active', 'public', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL, NULL, 1, NULL),
(25, 'ZEUS2026_50', NULL, 'percentage', 25.00, 3500.00, NULL, NULL, NULL, 43, 'active', 'public', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL, NULL, 1, NULL),
(26, 'ATHENA50_65', NULL, 'fixed', 5000.00, 1500.00, NULL, NULL, NULL, 11, 'active', 'public', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL, NULL, 1, NULL),
(27, 'HERA15_37', NULL, 'percentage', 15.00, 3100.00, NULL, NULL, NULL, 57, 'active', 'public', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL, NULL, 1, NULL),
(28, 'POSEIDON30_82', NULL, 'fixed', 3000.00, 3800.00, NULL, NULL, NULL, 83, 'active', 'public', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL, NULL, 1, NULL),
(29, 'APOLLO20_97', NULL, 'percentage', 20.00, 1800.00, NULL, NULL, NULL, 79, 'active', 'public', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL, NULL, 1, NULL),
(30, 'APHRODITE10_13', NULL, 'fixed', 1000.00, 3400.00, NULL, NULL, NULL, 66, 'active', 'public', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL, NULL, 1, NULL),
(31, 'ARES40_38', NULL, 'percentage', 40.00, 3000.00, NULL, NULL, NULL, 39, 'active', 'public', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL, NULL, 1, NULL),
(32, 'HERMES5_30', NULL, 'fixed', 500.00, 2400.00, NULL, NULL, NULL, 45, 'active', 'public', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL, NULL, 1, NULL),
(33, 'FINALTEST', NULL, 'fixed', 500.00, 1000.00, NULL, NULL, NULL, 50, 'active', 'public', '2026-07-22 13:32:59', '2026-07-22 13:32:59', NULL, NULL, 1, NULL),
(34, 'ZEUS2026_79', NULL, 'percentage', 25.00, 3900.00, NULL, NULL, NULL, 28, 'active', 'public', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL, NULL, 1, NULL),
(35, 'ATHENA50_98', NULL, 'fixed', 5000.00, 1500.00, NULL, NULL, NULL, 63, 'active', 'public', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL, NULL, 1, NULL),
(36, 'HERA15_10', NULL, 'percentage', 15.00, 2000.00, NULL, NULL, NULL, 17, 'active', 'public', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL, NULL, 1, NULL),
(37, 'POSEIDON30_36', NULL, 'fixed', 3000.00, 1400.00, NULL, NULL, NULL, 83, 'active', 'public', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL, NULL, 1, NULL),
(38, 'APOLLO20_43', NULL, 'percentage', 20.00, 2800.00, NULL, NULL, NULL, 63, 'active', 'public', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL, NULL, 1, NULL),
(39, 'APHRODITE10_91', NULL, 'fixed', 1000.00, 3400.00, NULL, NULL, NULL, 16, 'active', 'public', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL, NULL, 1, NULL),
(40, 'ARES40_73', NULL, 'percentage', 40.00, 2200.00, NULL, NULL, NULL, 75, 'active', 'public', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL, NULL, 1, NULL),
(41, 'HERMES5_39', NULL, 'fixed', 500.00, 1300.00, NULL, NULL, NULL, 65, 'active', 'public', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL, NULL, 1, NULL),
(43, 'ATHENA50_37', NULL, 'fixed', 5000.00, 1300.00, NULL, NULL, NULL, 94, 'active', 'public', '2026-07-22 15:22:54', '2026-07-22 15:22:54', NULL, NULL, 1, NULL),
(44, 'HERA15_39', NULL, 'percentage', 15.00, 3500.00, NULL, NULL, NULL, 85, 'active', 'public', '2026-07-22 15:22:54', '2026-07-22 15:22:54', NULL, NULL, 1, NULL),
(45, 'POSEIDON30_85', NULL, 'fixed', 3000.00, 1700.00, NULL, NULL, NULL, 39, 'active', 'public', '2026-07-22 15:22:54', '2026-07-22 15:22:54', NULL, NULL, 1, NULL),
(46, 'APOLLO20_16', NULL, 'percentage', 20.00, 3600.00, NULL, NULL, NULL, 10, 'active', 'public', '2026-07-22 15:22:54', '2026-07-22 15:22:54', NULL, NULL, 1, NULL),
(47, 'APHRODITE10_22', NULL, 'fixed', 1000.00, 1900.00, NULL, NULL, NULL, 60, 'active', 'public', '2026-07-22 15:22:54', '2026-07-22 15:22:54', NULL, NULL, 1, NULL),
(48, 'ARES40_77', NULL, 'percentage', 40.00, 5000.00, NULL, NULL, NULL, 35, 'active', 'public', '2026-07-22 15:22:54', '2026-07-22 15:22:54', NULL, NULL, 1, NULL),
(50, 'AAAAA-K9IMZZ', 'bdfbfbsdsergerg', 'fixed', 99.00, 100.00, 1000.00, '2026-07-31', '2027-01-28', 3, 'active', 'public', '2026-07-23 04:18:09', '2026-07-23 04:22:11', NULL, NULL, 1, NULL),
(51, 'ZEUS2026_89', NULL, 'percentage', 25.00, 2900.00, NULL, NULL, NULL, 40, 'active', 'public', '2026-07-23 05:55:39', '2026-07-23 05:55:39', NULL, NULL, 1, NULL),
(52, 'ATHENA50_85', NULL, 'fixed', 5000.00, 2600.00, NULL, NULL, NULL, 63, 'active', 'public', '2026-07-23 05:55:39', '2026-07-23 05:55:39', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_usages`
--

INSERT INTO `coupon_usages` (`id`, `coupon_id`, `user_id`, `order_id`, `used_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 15, 11, 1, '2026-07-06 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(2, 4, 1, 2, '2026-07-04 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(3, 16, 13, 3, '2026-07-07 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(4, 21, 12, 4, '2026-07-18 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(5, 35, 29, 5, '2026-07-22 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(6, 13, 35, 6, '2026-07-19 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(7, 16, 25, 7, '2026-07-13 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(8, 9, 11, 8, '2026-07-21 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(9, 47, 21, 9, '2026-07-08 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(10, 6, 6, 10, '2026-07-04 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(11, 8, 25, 11, '2026-07-22 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(12, 16, 25, 12, '2026-07-13 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(13, 8, 16, 13, '2026-07-10 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(14, 33, 31, 14, '2026-07-09 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(15, 17, 26, 15, '2026-07-09 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(16, 44, 16, 16, '2026-07-14 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(17, 30, 15, 17, '2026-07-18 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(18, 37, 13, 18, '2026-07-09 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(19, 10, 30, 19, '2026-07-07 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(20, 43, 7, 20, '2026-07-09 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(21, 28, 12, 21, '2026-07-14 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(22, 40, 23, 22, '2026-07-09 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(23, 25, 22, 23, '2026-07-03 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(24, 40, 21, 24, '2026-07-16 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(25, 1, 32, 25, '2026-07-07 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(26, 35, 19, 26, '2026-07-17 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(27, 4, 32, 27, '2026-07-04 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL),
(28, 20, 18, 28, '2026-07-22 04:45:41', '2026-07-23 04:45:41', '2026-07-23 04:45:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_logs`
--

CREATE TABLE `inventory_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_type` enum('in','out') NOT NULL,
  `quantity_changed` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_logs`
--

INSERT INTO `inventory_logs` (`id`, `product_id`, `variant_id`, `change_type`, `quantity_changed`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, NULL, 'out', 22, 'Sample note for inventory log #1', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(2, 4, NULL, 'out', 32, 'Sample note for inventory log #2', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(3, 5, 1, 'in', 14, 'Sample note for inventory log #3', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(4, 4, NULL, 'out', 41, 'Sample note for inventory log #4', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(5, 1, 1, 'in', 38, 'Sample note for inventory log #5', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(6, 1, NULL, 'in', 4, 'Sample note for inventory log #6', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(7, 5, 3, 'in', 7, 'Sample note for inventory log #7', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(8, 1, NULL, 'in', 4, 'Sample note for inventory log #8', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(9, 4, 1, 'in', 34, 'Sample note for inventory log #9', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL),
(10, 2, NULL, 'out', 22, 'Sample note for inventory log #10', '2025-10-09 00:23:28', '2025-10-09 00:23:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_04_095633_create_personal_access_tokens_table', 2),
(5, '2025_10_04_104815_add_role_to_users_table', 3),
(6, '2025_10_04_130511_create_brands_table', 4),
(7, '2025_10_05_120444_create_categories_table', 5),
(8, '2025_10_05_134913_create_sizes_table', 6),
(9, '2025_10_06_021259_create_products_table', 7),
(10, '2025_10_06_010808_create_shippings_table', 8),
(11, '2025_10_06_043128_create_product_images_table', 8),
(12, '2025_10_06_103138_create_coupons_table', 9),
(13, '2025_10_06_130916_create_orders_table', 10),
(14, '2025_10_08_080120_create_product_variants_table', 11),
(15, '2025_10_08_090130_create_wishlists_table', 12),
(16, '2025_10_09_042242_create_order_items_table', 13),
(17, '2025_10_09_052116_create_reviews_table', 14),
(18, '2025_10_09_061315_create_inventory_log_table', 15),
(19, '2025_10_09_061456_create_inventory_logs_table', 16),
(20, '2025_10_09_072251_create_discounts_table', 17),
(21, '2025_10_09_083520_create_notifications_table', 18),
(22, '2025_10_09_085528_create_shipping_methods_table', 19),
(23, '2025_10_09_104434_create_coupon_usages_table', 20),
(24, '2025_10_09_111940_create_order_shippings_table', 21),
(25, '2025_10_09_153109_create_payments_table', 22),
(26, '2026_07_23_102842_add_visibility_and_assigned_user_id_to_coupons_table', 23),
(27, '2026_07_23_103139_add_activity_fields_to_coupons_table', 24),
(28, '2026_07_23_104517_add_order_code_to_orders_table', 25),
(29, '2026_07_23_105237_update_order_status_enum_to_processing', 26),
(30, '2026_07_30_053511_create_checkouts_table', 27),
(31, '2026_07_30_140141_add_image_to_categories_table', 28);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `status` enum('unread','read') NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 1, 'This is a sample notification message number 1.', 'read', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(3, 1, 'This is a sample notification message number 2.', 'unread', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(4, 1, 'This is a sample notification message number 3.', 'unread', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(5, 1, 'This is a sample notification message number 4.', 'unread', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(6, 1, 'This is a sample notification message number 5.', 'unread', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(7, 1, 'This is a sample notification message number 6.', 'unread', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(8, 1, 'This is a sample notification message number 7.', 'read', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(9, 1, 'This is a sample notification message number 8.', 'unread', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(10, 1, 'This is a sample notification message number 9.', 'unread', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(11, 1, 'This is a sample notification message number 10.', 'read', '2025-10-09 02:44:21', '2025-10-09 02:44:21', NULL),
(12, 1, 'UNCOMMON ALERT 964: Special test notification created successfully', 'unread', '2026-07-22 13:04:09', '2026-07-22 13:04:09', NULL),
(13, 1, 'UNCOMMON ALERT 470: Special test notification created successfully', 'unread', '2026-07-22 13:14:53', '2026-07-22 13:14:53', NULL),
(14, 14, '[NOTIF] 🔔 Order confirmed — your package is being prepared by our atelier. (ID#9827)', 'read', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(15, 15, '[NOTIF] ⚡ Flash Sale! Extra 20% off on all Celestial items for the next 6 hours. (ID#1124)', 'read', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(16, 16, '[NOTIF] 🚚 Your shipment has departed from our flagship warehouse. Track now! (ID#5734)', 'read', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(17, 17, '[NOTIF] 🎉 Welcome to ELYSIUM Loyalty! You\'ve earned 500 bonus points. (ID#9576)', 'read', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(18, 18, '[NOTIF] ⚠️ Security alert: New login detected from an unrecognized device. (ID#5348)', 'read', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(19, 19, '[NOTIF] 🔔 Order confirmed — your package is being prepared by our atelier. (ID#5133)', 'unread', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(20, 20, '[NOTIF] ⚡ Flash Sale! Extra 20% off on all Celestial items for the next 6 hours. (ID#1035)', 'unread', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(21, 21, '[NOTIF] 🚚 Your shipment has departed from our flagship warehouse. Track now! (ID#5106)', 'read', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(22, 22, '[NOTIF] 🎉 Welcome to ELYSIUM Loyalty! You\'ve earned 500 bonus points. (ID#3941)', 'unread', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(23, 23, '[NOTIF] ⚠️ Security alert: New login detected from an unrecognized device. (ID#7455)', 'unread', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(24, 26, '[NOTIF] 🔔 Order confirmed — your package is being prepared by our atelier. (ID#6425)', 'unread', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(25, 27, '[NOTIF] ⚡ Flash Sale! Extra 20% off on all Celestial items for the next 6 hours. (ID#8817)', 'read', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(26, 28, '[NOTIF] 🚚 Your shipment has departed from our flagship warehouse. Track now! (ID#6131)', 'read', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(27, 29, '[NOTIF] 🎉 Welcome to ELYSIUM Loyalty! You\'ve earned 500 bonus points. (ID#4231)', 'read', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(28, 30, '[NOTIF] ⚠️ Security alert: New login detected from an unrecognized device. (ID#9496)', 'unread', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(10) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `final_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','processing','shipped','delivered','cancelled') NOT NULL DEFAULT 'pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `user_id`, `total_amount`, `discount_amount`, `shipping_fee`, `final_amount`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'UVRT77E8', 4, 24999.00, 0.00, 2499.90, 27498.90, 'processing', NULL, '2026-07-30 00:35:57', '2026-07-30 00:35:57'),
(2, 'LK6LCI75', 4, 18999.00, 0.00, 1899.90, 20898.90, 'pending', NULL, '2026-07-30 00:38:42', '2026-07-30 00:38:42'),
(3, 'DL91PRQN', 25, 18999.00, 0.00, 1899.90, 20898.90, 'pending', NULL, '2026-07-30 02:12:51', '2026-07-30 02:12:51'),
(4, '3MHJUMGA', 42, 99997.00, 0.00, 9999.70, 109996.70, 'delivered', NULL, '2026-07-30 02:24:56', '2026-07-30 09:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price_at_purchase` decimal(10,2) NOT NULL,
  `discount_applied` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `variant_id`, `quantity`, `price_at_purchase`, `discount_applied`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 71, NULL, 1, 24999.00, 0.00, '2026-07-30 00:35:57', '2026-07-30 00:35:57', NULL),
(2, 2, 72, NULL, 1, 18999.00, 0.00, '2026-07-30 00:38:42', '2026-07-30 00:38:42', NULL),
(3, 3, 72, NULL, 1, 18999.00, 0.00, '2026-07-30 02:12:51', '2026-07-30 02:12:51', NULL),
(4, 4, 72, NULL, 1, 18999.00, 0.00, '2026-07-30 02:24:56', '2026-07-30 02:24:56', NULL),
(5, 4, 73, NULL, 1, 45999.00, 0.00, '2026-07-30 02:24:56', '2026-07-30 02:24:56', NULL),
(6, 4, 75, NULL, 1, 34999.00, 0.00, '2026-07-30 02:24:56', '2026-07-30 02:24:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_shippings`
--

CREATE TABLE `order_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_method_id` bigint(20) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_shippings`
--

INSERT INTO `order_shippings` (`id`, `order_id`, `shipping_method_id`, `address`, `tracking_number`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 3, 'House 1, Road 17, Dhaka, Bangladeshi', 'TRK-68E79C70BEA98', '2025-10-09 05:28:48', '2026-07-22 13:00:39', '2026-07-22 13:00:39'),
(2, 1, 1, 'House 2, Road 13, Dhaka, Bangladesh', 'TRK-68E79C70CA080', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(3, 2, 1, 'House 3, Road 16, Dhaka, Bangladesh', 'TRK-68E79C70CB43F', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(4, 2, 1, 'House 4, Road 2, Dhaka, Bangladesh', 'TRK-68E79C70CDA5A', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(5, 3, 5, 'House 5, Road 13, Dhaka, Bangladesh', 'TRK-68E79C70CE856', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(6, 4, 3, 'House 6, Road 15, Dhaka, Bangladesh', 'TRK-68E79C70CF67C', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(7, 5, 5, 'House 7, Road 6, Dhaka, Bangladesh', 'TRK-68E79C70D095C', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(8, 4, 2, 'House 8, Road 16, Dhaka, Bangladesh', 'TRK-68E79C70D1B1B', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(9, 3, 2, 'House 9, Road 6, Dhaka, Bangladesh', 'TRK-68E79C70D294F', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(10, 2, 4, 'House 10, Road 7, Dhaka, Bangladesh', 'TRK-68E79C70D3B4A', '2025-10-09 05:28:48', '2025-10-09 05:28:48', NULL),
(11, 12, 14, 'UNCOMMON PALACE ROAD 964, DHAKA', 'TRK-UNC-964', '2026-07-22 13:04:09', '2026-07-22 13:04:09', NULL),
(12, 13, 15, 'UNCOMMON PALACE ROAD 470, DHAKA', 'TRK-UNC-470', '2026-07-22 13:14:53', '2026-07-22 13:14:53', NULL),
(13, 14, 21, '123 Crystal Spire, Kingdom of Eldoria [SHIP-ADDR]', 'TRK-FFDD5752-6489', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(14, 15, 18, '45 Moonstone Lane, Silverhollow Valley [SHIP-ADDR]', 'TRK-889068F0-6065', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(15, 16, 17, '789 Dragonflight Avenue, Emberkeep [SHIP-ADDR]', 'TRK-B6D1E688-3260', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(16, 17, 21, '12 Starfall Boulevard, Celestia City [SHIP-ADDR]', 'TRK-10C8F176-1264', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(17, 18, 16, '67 Whispering Woods Road, Thornwall [SHIP-ADDR]', 'TRK-50BA5A81-9208', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(18, 19, 27, '123 Crystal Spire, Kingdom of Eldoria [SHIP-ADDR]', 'TRK-D35255B2-5043', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(19, 20, 22, '45 Moonstone Lane, Silverhollow Valley [SHIP-ADDR]', 'TRK-AAFF60BB-9218', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(20, 21, 25, '789 Dragonflight Avenue, Emberkeep [SHIP-ADDR]', 'TRK-286A4F5A-8464', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(21, 22, 23, '12 Starfall Boulevard, Celestia City [SHIP-ADDR]', 'TRK-7194769E-4277', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(22, 23, 26, '67 Whispering Woods Road, Thornwall [SHIP-ADDR]', 'TRK-3BA31D34-5504', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(23, 24, 31, '123 Crystal Spire, Kingdom of Eldoria [SHIP-ADDR]', 'TRK-85315DC7-4281', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(24, 25, 31, '45 Moonstone Lane, Silverhollow Valley [SHIP-ADDR]', 'TRK-88C80625-6304', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(25, 26, 33, '789 Dragonflight Avenue, Emberkeep [SHIP-ADDR]', 'TRK-D0CADEF7-2937', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(26, 27, 32, '12 Starfall Boulevard, Celestia City [SHIP-ADDR]', 'TRK-68483EAD-1980', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(27, 28, 34, '67 Whispering Woods Road, Thornwall [SHIP-ADDR]', 'TRK-20FD493F-2637', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(28, 6, 1, '78 Dhanmondi Lake View, Road 27, Dhaka 1209', 'TRK-2B8157AF', '2026-07-23 05:55:57', '2026-07-23 05:55:57', NULL),
(29, 7, 1, '45 Banani Road 11, Block C, Dhaka 1213', 'TRK-BEEF5DE2', '2026-07-23 05:55:57', '2026-07-23 05:55:57', NULL),
(30, 8, 1, '12 Gulshan Avenue, Suite 402, Dhaka 1212', 'TRK-CED52997', '2026-07-23 05:55:57', '2026-07-23 05:55:57', NULL),
(31, 9, 1, '12 Gulshan Avenue, Suite 402, Dhaka 1212', 'TRK-F6480E23', '2026-07-23 05:55:57', '2026-07-23 05:55:57', NULL),
(32, 10, 1, '99 Uttara Sector 3, Sonargaon Janapath, Dhaka 1230', 'TRK-22ED06F1', '2026-07-23 05:55:57', '2026-07-23 05:55:57', NULL),
(33, 11, 1, '78 Dhanmondi Lake View, Road 27, Dhaka 1209', 'TRK-1F1DE418', '2026-07-23 05:55:57', '2026-07-23 05:55:57', NULL),
(34, 29, 1, 'Zindabazar Luxury Suite, Sylhet 3100', 'TRK-HI8AJPVC', '2025-08-22 13:27:51', '2025-08-22 13:27:51', NULL),
(35, 30, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-WJGIFLQ9', '2025-08-09 03:02:51', '2025-08-09 03:02:51', NULL),
(36, 31, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-AWWUQCWF', '2025-08-09 08:39:07', '2025-08-09 08:39:07', NULL),
(37, 32, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-K7DBUEJX', '2025-08-18 04:20:07', '2025-08-18 04:20:07', NULL),
(38, 33, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-U2LZC9U7', '2025-08-15 10:35:07', '2025-08-15 10:35:07', NULL),
(39, 34, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-RHTRFRX8', '2025-08-23 06:49:07', '2025-08-23 06:49:07', NULL),
(40, 35, 1, 'Sector 4, Road 12, Uttara, Dhaka 1230', 'TRK-KVXSFBRU', '2025-08-09 03:45:07', '2025-08-09 03:45:07', NULL),
(41, 36, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-7S3IRJFE', '2025-08-24 04:39:07', '2025-08-24 04:39:07', NULL),
(42, 37, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-VODBZFCQ', '2025-08-07 15:17:07', '2025-08-07 15:17:07', NULL),
(43, 38, 1, 'Zindabazar Luxury Suite, Sylhet 3100', 'TRK-O1XF0ZEJ', '2025-08-12 13:05:07', '2025-08-12 13:05:07', NULL),
(44, 39, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-PKSD1OQB', '2025-08-02 10:13:07', '2025-08-02 10:13:07', NULL),
(45, 40, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-NWVSTYBJ', '2025-08-13 05:56:07', '2025-08-13 05:56:07', NULL),
(46, 41, 1, 'Zindabazar Luxury Suite, Sylhet 3100', 'TRK-O2SG2C96', '2025-09-03 04:51:07', '2025-09-03 04:51:07', NULL),
(47, 42, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-DYHSDUU0', '2025-09-03 15:26:07', '2025-09-03 15:26:07', NULL),
(48, 43, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-USBP5WIU', '2025-09-09 15:03:07', '2025-09-09 15:03:07', NULL),
(49, 44, 1, 'Sector 4, Road 12, Uttara, Dhaka 1230', 'TRK-IMNNSUVR', '2025-09-19 12:54:07', '2025-09-19 12:54:07', NULL),
(50, 45, 1, 'Sector 4, Road 12, Uttara, Dhaka 1230', 'TRK-VDEMHUVJ', '2025-09-07 14:12:07', '2025-09-07 14:12:07', NULL),
(51, 46, 1, 'Sector 4, Road 12, Uttara, Dhaka 1230', 'TRK-EHJNCUJZ', '2025-09-18 09:07:07', '2025-09-18 09:07:07', NULL),
(52, 47, 1, 'House 15, Road 27, Dhanmondi, Dhaka 1209', 'TRK-L10FGVC0', '2025-10-10 11:55:07', '2025-10-10 11:55:07', NULL),
(53, 48, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-IWGODDJJ', '2025-10-14 07:42:07', '2025-10-14 07:42:07', NULL),
(54, 49, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-4H8IWRAY', '2025-10-08 15:10:07', '2025-10-08 15:10:07', NULL),
(55, 50, 1, 'Sector 4, Road 12, Uttara, Dhaka 1230', 'TRK-HFVEPBAP', '2025-10-09 14:58:07', '2025-10-09 14:58:07', NULL),
(56, 51, 1, 'House 15, Road 27, Dhanmondi, Dhaka 1209', 'TRK-ZIFFBO35', '2025-10-28 03:49:07', '2025-10-28 03:49:07', NULL),
(57, 52, 1, 'Zindabazar Luxury Suite, Sylhet 3100', 'TRK-5MFULKJG', '2025-11-04 06:33:07', '2025-11-04 06:33:07', NULL),
(58, 53, 1, 'Sector 4, Road 12, Uttara, Dhaka 1230', 'TRK-KWEHOVHR', '2025-11-14 09:54:07', '2025-11-14 09:54:07', NULL),
(59, 54, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-OP5WXDAI', '2025-11-10 04:38:07', '2025-11-10 04:38:07', NULL),
(60, 55, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-OATJGSOI', '2025-11-19 10:25:07', '2025-11-19 10:25:07', NULL),
(61, 56, 1, 'Zindabazar Luxury Suite, Sylhet 3100', 'TRK-3DMBR9SV', '2025-11-24 10:21:07', '2025-11-24 10:21:07', NULL),
(62, 57, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-K1TS1BVS', '2025-12-18 10:16:07', '2025-12-18 10:16:07', NULL),
(63, 58, 1, 'House 15, Road 27, Dhanmondi, Dhaka 1209', 'TRK-7LMDNUAA', '2025-12-16 03:20:07', '2025-12-16 03:20:07', NULL),
(64, 59, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-W9UXQO7L', '2025-12-01 14:50:07', '2025-12-01 14:50:07', NULL),
(65, 60, 1, 'Sector 4, Road 12, Uttara, Dhaka 1230', 'TRK-KR46IBHH', '2025-12-06 03:49:07', '2025-12-06 03:49:07', NULL),
(66, 61, 1, 'House 15, Road 27, Dhanmondi, Dhaka 1209', 'TRK-AWQHP4KQ', '2025-12-11 10:57:07', '2025-12-11 10:57:07', NULL),
(67, 62, 1, 'House 15, Road 27, Dhanmondi, Dhaka 1209', 'TRK-JWDUKA3A', '2025-12-19 11:05:07', '2025-12-19 11:05:07', NULL),
(68, 63, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-P3DFVBQR', '2025-12-16 14:35:07', '2025-12-16 14:35:07', NULL),
(69, 64, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-SWHLAD3Q', '2025-12-23 09:04:07', '2025-12-23 09:04:07', NULL),
(70, 65, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-D5DKY7AI', '2025-12-25 11:26:07', '2025-12-25 11:26:07', NULL),
(71, 66, 1, 'Sector 4, Road 12, Uttara, Dhaka 1230', 'TRK-XBFRWR9L', '2025-12-19 06:03:07', '2025-12-19 06:03:07', NULL),
(72, 67, 1, 'Zindabazar Luxury Suite, Sylhet 3100', 'TRK-5XOIYI7N', '2025-12-26 09:59:07', '2025-12-26 09:59:07', NULL),
(73, 68, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-WWLFVWCG', '2025-12-05 08:21:07', '2025-12-05 08:21:07', NULL),
(74, 69, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-MAYVJQIK', '2026-01-07 04:34:07', '2026-01-07 04:34:07', NULL),
(75, 70, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-4ELUTG5Y', '2026-01-04 03:31:07', '2026-01-04 03:31:07', NULL),
(76, 71, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-OE0MIQZH', '2026-01-16 06:36:07', '2026-01-16 06:36:07', NULL),
(77, 72, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-VWA9LHM2', '2026-01-05 11:08:07', '2026-01-05 11:08:07', NULL),
(78, 73, 1, 'House 15, Road 27, Dhanmondi, Dhaka 1209', 'TRK-BTZOO8DC', '2026-01-07 10:55:07', '2026-01-07 10:55:07', NULL),
(79, 74, 1, 'House 15, Road 27, Dhanmondi, Dhaka 1209', 'TRK-JZU2ZMSQ', '2026-02-08 04:49:07', '2026-02-08 04:49:07', NULL),
(80, 75, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-HTFPLJA6', '2026-02-02 12:04:07', '2026-02-02 12:04:07', NULL),
(81, 76, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-2XIO3ACM', '2026-02-07 09:56:07', '2026-02-07 09:56:07', NULL),
(82, 77, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-LZWVD6DH', '2026-02-24 15:42:07', '2026-02-24 15:42:07', NULL),
(83, 78, 1, 'Sector 4, Road 12, Uttara, Dhaka 1230', 'TRK-72KKD7DP', '2026-02-22 05:26:07', '2026-02-22 05:26:07', NULL),
(84, 79, 1, 'Sector 4, Road 12, Uttara, Dhaka 1230', 'TRK-BAQTY2NR', '2026-03-07 11:29:07', '2026-03-07 11:29:07', NULL),
(85, 80, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-T0DBCZ8D', '2026-03-28 11:44:07', '2026-03-28 11:44:07', NULL),
(86, 81, 1, 'House 15, Road 27, Dhanmondi, Dhaka 1209', 'TRK-6PQHXW8N', '2026-03-18 13:00:07', '2026-03-18 13:00:07', NULL),
(87, 82, 1, 'Sector 4, Road 12, Uttara, Dhaka 1230', 'TRK-PYHWX86X', '2026-03-08 09:30:07', '2026-03-08 09:30:07', NULL),
(88, 83, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-C710BEGT', '2026-03-05 15:20:07', '2026-03-05 15:20:07', NULL),
(89, 84, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-ZZ2XIQ4F', '2026-03-13 08:26:07', '2026-03-13 08:26:07', NULL),
(90, 85, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-55R2SDMR', '2026-03-23 11:59:07', '2026-03-23 11:59:07', NULL),
(91, 86, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-0JQMM8T6', '2026-03-20 07:02:07', '2026-03-20 07:02:07', NULL),
(92, 87, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-NHVXUDN2', '2026-03-07 12:36:07', '2026-03-07 12:36:07', NULL),
(93, 88, 1, 'House 15, Road 27, Dhanmondi, Dhaka 1209', 'TRK-XLIBBSTI', '2026-03-24 13:01:07', '2026-03-24 13:01:07', NULL),
(94, 89, 1, 'Zindabazar Luxury Suite, Sylhet 3100', 'TRK-D2UNJVYF', '2026-03-05 08:07:07', '2026-03-05 08:07:07', NULL),
(95, 90, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-KWRKPHO8', '2026-03-27 11:02:07', '2026-03-27 11:02:07', NULL),
(96, 91, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-HXE5RMLJ', '2026-04-12 07:30:07', '2026-04-12 07:30:07', NULL),
(97, 92, 1, 'House 15, Road 27, Dhanmondi, Dhaka 1209', 'TRK-9P4GRCTV', '2026-04-16 06:07:07', '2026-04-16 06:07:07', NULL),
(98, 93, 1, 'Zindabazar Luxury Suite, Sylhet 3100', 'TRK-DKURVAK5', '2026-04-17 05:48:07', '2026-04-17 05:48:07', NULL),
(99, 94, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-QF10MIMP', '2026-04-21 14:36:07', '2026-04-21 14:36:07', NULL),
(100, 95, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-QVP7HRVN', '2026-04-01 15:02:07', '2026-04-01 15:02:07', NULL),
(101, 96, 1, 'Sector 4, Road 12, Uttara, Dhaka 1230', 'TRK-D16OVMHW', '2026-04-11 11:26:07', '2026-04-11 11:26:07', NULL),
(102, 97, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-2JW9R89D', '2026-04-08 05:38:07', '2026-04-08 05:38:07', NULL),
(103, 98, 1, 'Zindabazar Luxury Suite, Sylhet 3100', 'TRK-28LH9H7Y', '2026-04-14 14:32:07', '2026-04-14 14:32:07', NULL),
(104, 99, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-PEISIK3G', '2026-04-08 11:49:07', '2026-04-08 11:49:07', NULL),
(105, 100, 1, 'House 15, Road 27, Dhanmondi, Dhaka 1209', 'TRK-VIDJDULS', '2026-04-21 11:34:07', '2026-04-21 11:34:07', NULL),
(106, 101, 1, 'Zindabazar Luxury Suite, Sylhet 3100', 'TRK-SYZ6NTRJ', '2026-05-24 05:54:07', '2026-05-24 05:54:07', NULL),
(107, 102, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-8UUT6BDD', '2026-05-21 14:30:07', '2026-05-21 14:30:07', NULL),
(108, 103, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-K3ZRKLO7', '2026-05-05 13:26:07', '2026-05-05 13:26:07', NULL),
(109, 104, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-KKFKPT94', '2026-05-03 15:30:07', '2026-05-03 15:30:07', NULL),
(110, 105, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-UGAKKD8L', '2026-05-23 09:17:07', '2026-05-23 09:17:07', NULL),
(111, 106, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-VRCER1IX', '2026-05-18 05:43:07', '2026-05-18 05:43:07', NULL),
(112, 107, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-UMBGMKLQ', '2026-05-06 09:31:07', '2026-05-06 09:31:07', NULL),
(113, 108, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-0H40MV8J', '2026-05-24 09:21:07', '2026-05-24 09:21:07', NULL),
(114, 109, 1, 'Zindabazar Luxury Suite, Sylhet 3100', 'TRK-HANSFPM3', '2026-06-14 08:41:07', '2026-06-14 08:41:07', NULL),
(115, 110, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-IKOO7VRY', '2026-06-15 10:36:07', '2026-06-15 10:36:07', NULL),
(116, 111, 1, 'Sector 4, Road 12, Uttara, Dhaka 1230', 'TRK-CJJZMV0L', '2026-06-12 10:49:07', '2026-06-12 10:49:07', NULL),
(117, 112, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-LHKX1KZF', '2026-06-04 10:48:07', '2026-06-04 10:48:07', NULL),
(118, 113, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-ARMGUAWA', '2026-06-07 04:20:07', '2026-06-07 04:20:07', NULL),
(119, 114, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-QLDGZRCF', '2026-06-18 12:43:07', '2026-06-18 12:43:07', NULL),
(120, 115, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-AXH4CIWK', '2026-06-02 12:13:07', '2026-06-02 12:13:07', NULL),
(121, 116, 1, 'House 15, Road 27, Dhanmondi, Dhaka 1209', 'TRK-FS5G8TYK', '2026-06-24 07:10:07', '2026-06-24 07:10:07', NULL),
(122, 117, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-KACSH7WM', '2026-06-04 06:50:07', '2026-06-04 06:50:07', NULL),
(123, 118, 1, 'Sector 4, Road 12, Uttara, Dhaka 1230', 'TRK-F2IH7O0D', '2026-06-01 14:12:07', '2026-06-01 14:12:07', NULL),
(124, 119, 1, 'Zindabazar Luxury Suite, Sylhet 3100', 'TRK-I2PVZTM2', '2026-07-23 08:52:07', '2026-07-23 08:52:07', NULL),
(125, 120, 1, 'Zindabazar Luxury Suite, Sylhet 3100', 'TRK-YUAKSZKU', '2026-07-21 14:06:07', '2026-07-21 14:06:07', NULL),
(126, 121, 1, 'East Nasirabad, GEC Circle, Chattogram 4000', 'TRK-ICGDBWJK', '2026-07-17 15:59:07', '2026-07-17 15:59:07', NULL),
(127, 122, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-YSGBBGYC', '2026-07-17 15:10:07', '2026-07-17 15:10:07', NULL),
(128, 123, 1, 'House 42, Road 11, Banani, Dhaka 1213', 'TRK-0CMJ3MPS', '2026-07-07 12:42:07', '2026-07-07 12:42:07', NULL),
(129, 124, 1, 'House 15, Road 27, Dhanmondi, Dhaka 1209', 'TRK-NEZHXCRS', '2026-07-20 04:52:07', '2026-07-20 04:52:07', NULL),
(130, 125, 1, 'Flat 5B, Gulshan Avenue, Dhaka 1212', 'TRK-N0TROU47', '2026-07-26 03:16:07', '2026-07-26 03:16:07', NULL),
(131, 126, 1, 'Sector 4, Road 12, Uttara, Dhaka 1230', 'TRK-NSL285TN', '2026-07-17 03:29:07', '2026-07-17 03:29:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` enum('card','mobile_banking','COD') NOT NULL,
  `transaction_id` varchar(150) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','success','failed') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `payment_method`, `transaction_id`, `amount`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 'mobile_banking', 'PAYGUWCOMB1OH', 167.30, 'success', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(2, 4, 'COD', 'PAYUQUQJWN1BN', 324.30, 'success', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(3, 7, 'COD', 'PAYBGQBX7F1ND', 56.30, 'pending', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(4, 8, 'card', 'PAYOPL5AQSWKR', 213.70, 'failed', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(5, 7, 'COD', 'PAYFOO7G9C1PD', 489.00, 'pending', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(6, 4, 'card', 'PAYUPZQ31BDW2', 137.80, 'success', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(7, 2, 'mobile_banking', 'PAYR54DCXYK5D', 80.30, 'success', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(8, 4, 'COD', 'PAYYU3RAX0H3A', 123.50, 'failed', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(9, 2, 'card', 'PAY59ORRK3VPG', 108.40, 'success', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(10, 7, 'mobile_banking', 'PAYFW4HJ4BTDY', 245.90, 'success', '2025-10-09 09:43:56', '2025-10-09 09:43:56', NULL),
(11, 10, 'mobile_banking', 'TXN-UNC-773', 9099.00, 'success', '2026-07-22 13:03:51', '2026-07-22 13:03:51', NULL),
(12, 11, 'mobile_banking', 'TXN-UNC-944', 9099.00, 'success', '2026-07-22 13:04:00', '2026-07-22 13:04:00', NULL),
(13, 12, 'mobile_banking', 'TXN-UNC-964', 9099.00, 'success', '2026-07-22 13:04:09', '2026-07-22 13:04:09', NULL),
(14, 13, 'mobile_banking', 'TXN-UNC-470', 9099.00, 'success', '2026-07-22 13:14:53', '2026-07-22 13:14:53', NULL),
(15, 14, 'card', 'PAY-TXN-F0561A07F0', 25100.00, 'pending', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(16, 15, 'mobile_banking', 'PAY-TXN-0603F8ED51', 44800.00, 'success', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(17, 16, 'mobile_banking', 'PAY-TXN-33DD0E605D', 49600.00, 'success', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(18, 17, 'card', 'PAY-TXN-84E382324A', 34000.00, 'pending', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(19, 18, 'card', 'PAY-TXN-D7327BDD47', 41700.00, 'pending', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(20, 19, 'card', 'PAY-TXN-2AC7B243C2', 36000.00, 'success', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(21, 20, 'card', 'PAY-TXN-021699B340', 21500.00, 'pending', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(22, 21, 'card', 'PAY-TXN-9909E08E71', 20600.00, 'pending', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(23, 22, 'mobile_banking', 'PAY-TXN-5F99E177C5', 48000.00, 'failed', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(24, 23, 'mobile_banking', 'PAY-TXN-BADB10535F', 27900.00, 'success', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(25, 24, 'mobile_banking', 'PAY-TXN-8DBA632777', 16600.00, 'success', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(26, 25, 'mobile_banking', 'PAY-TXN-AEA379F725', 15000.00, 'pending', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(27, 26, 'COD', 'PAY-TXN-923DA1FE95', 19000.00, 'pending', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(28, 27, 'card', 'PAY-TXN-400196DC3C', 33200.00, 'pending', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(29, 28, 'mobile_banking', 'PAY-TXN-2720DEDC5C', 20700.00, 'failed', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(30, 1, 'COD', 'PAY-TXN-A1D0CB56A3', 950.00, 'pending', '2026-07-23 05:55:50', '2026-07-23 05:55:50', NULL),
(31, 3, 'COD', 'PAY-TXN-10BC458FE3', 950.00, 'success', '2026-07-23 05:55:57', '2026-07-23 05:55:57', NULL),
(32, 5, 'card', 'PAY-TXN-71DA73D39C', 950.00, 'pending', '2026-07-23 05:55:57', '2026-07-23 05:55:57', NULL),
(33, 9, 'COD', 'PAY-TXN-2106692916', 9099.00, 'success', '2026-07-23 05:55:57', '2026-07-23 05:55:57', NULL),
(34, 29, 'mobile_banking', 'TXN-P98ZKWGBAT', 145117.00, 'pending', '2025-08-22 13:27:51', '2025-08-22 13:27:51', NULL),
(35, 30, 'card', 'TXN-7THIEINGFF', 492120.00, 'success', '2025-08-09 03:02:51', '2025-08-09 03:02:51', NULL),
(36, 31, 'card', 'TXN-CIHFXKSJ74', 414118.00, 'success', '2025-08-09 08:39:07', '2025-08-09 08:39:07', NULL),
(37, 32, 'COD', 'TXN-ZCSHINCWQE', 295242.00, 'success', '2025-08-18 04:20:07', '2025-08-18 04:20:07', NULL),
(38, 33, 'COD', 'TXN-0WASHWFPWS', 181115.00, 'pending', '2025-08-15 10:35:07', '2025-08-15 10:35:07', NULL),
(39, 34, 'mobile_banking', 'TXN-FEDGT4BNPY', 154987.00, 'success', '2025-08-23 06:49:07', '2025-08-23 06:49:07', NULL),
(40, 35, 'mobile_banking', 'TXN-A45R2DZWI6', 332119.00, 'failed', '2025-08-09 03:45:07', '2025-08-09 03:45:07', NULL),
(41, 36, 'card', 'TXN-HJUS9PALGX', 554939.00, 'failed', '2025-08-24 04:39:07', '2025-08-24 04:39:07', NULL),
(42, 37, 'card', 'TXN-5S34IHLRK8', 252778.00, 'pending', '2025-08-07 15:17:07', '2025-08-07 15:17:07', NULL),
(43, 38, 'COD', 'TXN-UOCQQXMCEK', 46119.00, 'success', '2025-08-12 13:05:07', '2025-08-12 13:05:07', NULL),
(44, 39, 'COD', 'TXN-KRE03BMLJF', 199948.00, 'success', '2025-08-02 10:13:07', '2025-08-02 10:13:07', NULL),
(45, 40, 'card', 'TXN-UNVAU1NG7M', 235117.00, 'success', '2025-08-13 05:56:07', '2025-08-13 05:56:07', NULL),
(46, 41, 'mobile_banking', 'TXN-ENLOW7MUJF', 141119.00, 'pending', '2025-09-03 04:51:07', '2025-09-03 04:51:07', NULL),
(47, 42, 'COD', 'TXN-MWGD6SNC6Y', 151118.00, 'failed', '2025-09-03 15:26:07', '2025-09-03 15:26:07', NULL),
(48, 43, 'card', 'TXN-WNNBLKGHX5', 92761.00, 'success', '2025-09-09 15:03:07', '2025-09-09 15:03:07', NULL),
(49, 44, 'card', 'TXN-I7GIH8KMZQ', 209660.00, 'success', '2025-09-19 12:54:07', '2025-09-19 12:54:07', NULL),
(50, 45, 'mobile_banking', 'TXN-TDPJVEV050', 216279.00, 'success', '2025-09-07 14:12:07', '2025-09-07 14:12:07', NULL),
(51, 46, 'card', 'TXN-XVSKHGJ6UH', 281757.00, 'success', '2025-09-18 09:07:07', '2025-09-18 09:07:07', NULL),
(52, 47, 'mobile_banking', 'TXN-I7XGQBLVTU', 579937.00, 'pending', '2025-10-10 11:55:07', '2025-10-10 11:55:07', NULL),
(53, 48, 'mobile_banking', 'TXN-LY88JUXWOE', 114920.00, 'pending', '2025-10-14 07:42:07', '2025-10-14 07:42:07', NULL),
(54, 49, 'card', 'TXN-RPEKZYLQGA', 462115.00, 'pending', '2025-10-08 15:10:07', '2025-10-08 15:10:07', NULL),
(55, 50, 'COD', 'TXN-QFG7MCQOOR', 575903.00, 'success', '2025-10-09 14:58:07', '2025-10-09 14:58:07', NULL),
(56, 51, 'mobile_banking', 'TXN-KWVISOZ9MZ', 426116.00, 'failed', '2025-10-28 03:49:07', '2025-10-28 03:49:07', NULL),
(57, 52, 'COD', 'TXN-WVRCEZXUUU', 454829.00, 'success', '2025-11-04 06:33:07', '2025-11-04 06:33:07', NULL),
(58, 53, 'COD', 'TXN-XATBLUH8LV', 305364.00, 'success', '2025-11-14 09:54:07', '2025-11-14 09:54:07', NULL),
(59, 54, 'COD', 'TXN-U7FSKN8TXM', 411118.00, 'success', '2025-11-10 04:38:07', '2025-11-10 04:38:07', NULL),
(60, 55, 'mobile_banking', 'TXN-1GXPPFQRUB', 323649.00, 'success', '2025-11-19 10:25:07', '2025-11-19 10:25:07', NULL),
(61, 56, 'card', 'TXN-TSWN3YBYUQ', 142839.00, 'success', '2025-11-24 10:21:07', '2025-11-24 10:21:07', NULL),
(62, 57, 'mobile_banking', 'TXN-H6N9Y6BI7Q', 297716.00, 'success', '2025-12-18 10:16:07', '2025-12-18 10:16:07', NULL),
(63, 58, 'COD', 'TXN-NZBOWRVRBZ', 138117.00, 'success', '2025-12-16 03:20:07', '2025-12-16 03:20:07', NULL),
(64, 59, 'COD', 'TXN-XBPSJQR2MU', 72117.00, 'failed', '2025-12-01 14:50:07', '2025-12-01 14:50:07', NULL),
(65, 60, 'COD', 'TXN-0I7THE0NF8', 106119.00, 'success', '2025-12-06 03:49:07', '2025-12-06 03:49:07', NULL),
(66, 61, 'card', 'TXN-FMPP1X1QQI', 112119.00, 'success', '2025-12-11 10:57:07', '2025-12-11 10:57:07', NULL),
(67, 62, 'mobile_banking', 'TXN-SAGNL6BWUF', 366626.00, 'success', '2025-12-19 11:05:07', '2025-12-19 11:05:07', NULL),
(68, 63, 'card', 'TXN-FTXN73PYZK', 117724.00, 'success', '2025-12-16 14:35:07', '2025-12-16 14:35:07', NULL),
(69, 64, 'card', 'TXN-GD5FRQFMJY', 533758.00, 'success', '2025-12-23 09:04:07', '2025-12-23 09:04:07', NULL),
(70, 65, 'card', 'TXN-SG73Q3QBHB', 187969.00, 'success', '2025-12-25 11:26:07', '2025-12-25 11:26:07', NULL),
(71, 66, 'COD', 'TXN-HZDVZBRRVV', 618871.00, 'success', '2025-12-19 06:03:07', '2025-12-19 06:03:07', NULL),
(72, 67, 'card', 'TXN-PNPJHZVJIF', 173118.00, 'success', '2025-12-26 09:59:07', '2025-12-26 09:59:07', NULL),
(73, 68, 'COD', 'TXN-6ED3LAJ8QK', 443654.00, 'success', '2025-12-05 08:21:07', '2025-12-05 08:21:07', NULL),
(74, 69, 'mobile_banking', 'TXN-LIPMHADRJT', 605695.00, 'success', '2026-01-07 04:34:07', '2026-01-07 04:34:07', NULL),
(75, 70, 'mobile_banking', 'TXN-2MYMHBTBJ1', 321120.00, 'success', '2026-01-04 03:31:07', '2026-01-04 03:31:07', NULL),
(76, 71, 'mobile_banking', 'TXN-DR1QHOCWEW', 94903.00, 'success', '2026-01-16 06:36:07', '2026-01-16 06:36:07', NULL),
(77, 72, 'COD', 'TXN-NW8OROE7PI', 402120.00, 'success', '2026-01-05 11:08:07', '2026-01-05 11:08:07', NULL),
(78, 73, 'mobile_banking', 'TXN-NT8AKPJZOM', 223119.00, 'success', '2026-01-07 10:55:07', '2026-01-07 10:55:07', NULL),
(79, 74, 'mobile_banking', 'TXN-N6XDCSNF9X', 12485.00, 'failed', '2026-02-08 04:49:07', '2026-02-08 04:49:07', NULL),
(80, 75, 'COD', 'TXN-XQNAEDORQD', 242863.00, 'failed', '2026-02-02 12:04:07', '2026-02-02 12:04:07', NULL),
(81, 76, 'COD', 'TXN-8T70SW7WTV', 330887.00, 'success', '2026-02-07 09:56:07', '2026-02-07 09:56:07', NULL),
(82, 77, 'card', 'TXN-IPX4VIU4LC', 105525.00, 'success', '2026-02-24 15:42:07', '2026-02-24 15:42:07', NULL),
(83, 78, 'mobile_banking', 'TXN-YNND1X2YO6', 226116.00, 'success', '2026-02-22 05:26:07', '2026-02-22 05:26:07', NULL),
(84, 79, 'card', 'TXN-CBVYAM347I', 2143.00, 'success', '2026-03-07 11:29:07', '2026-03-07 11:29:07', NULL),
(85, 80, 'mobile_banking', 'TXN-AFJWJAENUO', 428118.00, 'pending', '2026-03-28 11:44:07', '2026-03-28 11:44:07', NULL),
(86, 81, 'COD', 'TXN-32ECG6E98H', 34709.00, 'failed', '2026-03-18 13:00:07', '2026-03-18 13:00:07', NULL),
(87, 82, 'mobile_banking', 'TXN-XKTZSB1H0R', 306120.00, 'pending', '2026-03-08 09:30:07', '2026-03-08 09:30:07', NULL),
(88, 83, 'COD', 'TXN-PZYLXR4CG8', 331783.00, 'pending', '2026-03-05 15:20:07', '2026-03-05 15:20:07', NULL),
(89, 84, 'COD', 'TXN-BELEEKIJ6D', 73900.00, 'pending', '2026-03-13 08:26:07', '2026-03-13 08:26:07', NULL),
(90, 85, 'mobile_banking', 'TXN-QONMB37LA5', 405120.00, 'success', '2026-03-23 11:59:07', '2026-03-23 11:59:07', NULL),
(91, 86, 'COD', 'TXN-GHT8IRLEOG', 272715.00, 'success', '2026-03-20 07:02:07', '2026-03-20 07:02:07', NULL),
(92, 87, 'mobile_banking', 'TXN-ARCR5LV9CO', 354679.00, 'pending', '2026-03-07 12:36:07', '2026-03-07 12:36:07', NULL),
(93, 88, 'mobile_banking', 'TXN-HMFOK0N5S0', 83115.00, 'success', '2026-03-24 13:01:07', '2026-03-24 13:01:07', NULL),
(94, 89, 'card', 'TXN-ZUG1HT0A96', 223119.00, 'success', '2026-03-05 08:07:07', '2026-03-05 08:07:07', NULL),
(95, 90, 'COD', 'TXN-DOZGXPG4V6', 378116.00, 'success', '2026-03-27 11:02:07', '2026-03-27 11:02:07', NULL),
(96, 91, 'COD', 'TXN-CSY5LMBFVJ', 354117.00, 'success', '2026-04-12 07:30:07', '2026-04-12 07:30:07', NULL),
(97, 92, 'COD', 'TXN-WGFS96TXCY', 38729.00, 'failed', '2026-04-16 06:07:07', '2026-04-16 06:07:07', NULL),
(98, 93, 'mobile_banking', 'TXN-PRRCBPV9DE', 526117.00, 'success', '2026-04-17 05:48:07', '2026-04-17 05:48:07', NULL),
(99, 94, 'COD', 'TXN-HWDH5WIQPF', 54118.00, 'success', '2026-04-21 14:36:07', '2026-04-21 14:36:07', NULL),
(100, 95, 'COD', 'TXN-TKAZCONV2Y', 317879.00, 'pending', '2026-04-01 15:02:07', '2026-04-01 15:02:07', NULL),
(101, 96, 'COD', 'TXN-DANSQQQ88N', 59361.00, 'success', '2026-04-11 11:26:07', '2026-04-11 11:26:07', NULL),
(102, 97, 'card', 'TXN-BCHRZDGTBB', 377870.00, 'pending', '2026-04-08 05:38:07', '2026-04-08 05:38:07', NULL),
(103, 98, 'card', 'TXN-NMAQXJRARR', 216858.00, 'success', '2026-04-14 14:32:07', '2026-04-14 14:32:07', NULL),
(104, 99, 'COD', 'TXN-2UUH4IXLZI', 387119.00, 'success', '2026-04-08 11:49:07', '2026-04-08 11:49:07', NULL),
(105, 100, 'card', 'TXN-26WXDPLHUK', 24901.00, 'success', '2026-04-21 11:34:07', '2026-04-21 11:34:07', NULL),
(106, 101, 'card', 'TXN-RAYWEOZFYM', 18118.00, 'failed', '2026-05-24 05:54:07', '2026-05-24 05:54:07', NULL),
(107, 102, 'COD', 'TXN-0UYTSAZPWW', 146693.00, 'success', '2026-05-21 14:30:07', '2026-05-21 14:30:07', NULL),
(108, 103, 'mobile_banking', 'TXN-AVBB5CJKLH', 57117.00, 'success', '2026-05-05 13:26:07', '2026-05-05 13:26:07', NULL),
(109, 104, 'mobile_banking', 'TXN-H116C63YSU', 216118.00, 'success', '2026-05-03 15:30:07', '2026-05-03 15:30:07', NULL),
(110, 105, 'COD', 'TXN-FMDN0696VT', 101973.00, 'success', '2026-05-23 09:17:07', '2026-05-23 09:17:07', NULL),
(111, 106, 'mobile_banking', 'TXN-RKELZJ0KZ7', 92714.00, 'pending', '2026-05-18 05:43:07', '2026-05-18 05:43:07', NULL),
(112, 107, 'mobile_banking', 'TXN-CREEMSFDIN', 218117.00, 'success', '2026-05-06 09:31:07', '2026-05-06 09:31:07', NULL),
(113, 108, 'COD', 'TXN-JBMJFD2LDP', 364703.00, 'success', '2026-05-24 09:21:07', '2026-05-24 09:21:07', NULL),
(114, 109, 'mobile_banking', 'TXN-DXUY91U8XQ', 521899.00, 'success', '2026-06-14 08:41:07', '2026-06-14 08:41:07', NULL),
(115, 110, 'COD', 'TXN-2DBWGWZVLA', 105714.00, 'failed', '2026-06-15 10:36:07', '2026-06-15 10:36:07', NULL),
(116, 111, 'card', 'TXN-YHDIIFLRZP', 593120.00, 'success', '2026-06-12 10:49:07', '2026-06-12 10:49:07', NULL),
(117, 112, 'COD', 'TXN-7JFH9LLZMT', 118118.00, 'failed', '2026-06-04 10:48:07', '2026-06-04 10:48:07', NULL),
(118, 113, 'COD', 'TXN-SFVKMP2FBE', 190120.00, 'success', '2026-06-07 04:20:07', '2026-06-07 04:20:07', NULL),
(119, 114, 'mobile_banking', 'TXN-DTK18RUCNA', 104990.00, 'success', '2026-06-18 12:43:07', '2026-06-18 12:43:07', NULL),
(120, 115, 'card', 'TXN-5Q4PTMYZ2K', 843657.00, 'success', '2026-06-02 12:13:07', '2026-06-02 12:13:07', NULL),
(121, 116, 'COD', 'TXN-G1A5RJWPUM', 112672.00, 'failed', '2026-06-24 07:10:07', '2026-06-24 07:10:07', NULL),
(122, 117, 'mobile_banking', 'TXN-ZPFJG50UKT', 200117.00, 'success', '2026-06-04 06:50:07', '2026-06-04 06:50:07', NULL),
(123, 118, 'card', 'TXN-P8IIBMWU5P', 69715.00, 'success', '2026-06-01 14:12:07', '2026-06-01 14:12:07', NULL),
(124, 119, 'COD', 'TXN-OHFPR1GYTB', 324118.00, 'pending', '2026-07-23 08:52:07', '2026-07-23 08:52:07', NULL),
(125, 120, 'mobile_banking', 'TXN-5OP2STNG0I', 225117.00, 'success', '2026-07-21 14:06:07', '2026-07-21 14:06:07', NULL),
(126, 121, 'COD', 'TXN-KCQOGPGERC', 471114.00, 'success', '2026-07-17 15:59:07', '2026-07-17 15:59:07', NULL),
(127, 122, 'mobile_banking', 'TXN-NLQ9KGEX8A', 526119.00, 'pending', '2026-07-17 15:10:07', '2026-07-17 15:10:07', NULL),
(128, 123, 'mobile_banking', 'TXN-5SLGRAQ7B4', 279120.00, 'pending', '2026-07-07 12:42:07', '2026-07-07 12:42:07', NULL),
(129, 124, 'COD', 'TXN-SLJXI7NP0L', 100120.00, 'failed', '2026-07-20 04:52:07', '2026-07-20 04:52:07', NULL),
(130, 125, 'COD', 'TXN-8N0WPSQ9VE', 317791.00, 'success', '2026-07-26 03:16:07', '2026-07-26 03:16:07', NULL),
(131, 126, 'card', 'TXN-SO2YOCWTYS', 373969.00, 'success', '2026-07-17 03:29:07', '2026-07-17 03:29:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token', 'e3bdf2f27580d2e54e0a9edb250747fa3e16131d161bf8966e1895f365a31ad1', '[\"*\"]', NULL, NULL, '2025-10-04 04:58:06', '2025-10-04 04:58:06'),
(2, 'App\\Models\\User', 1, 'token', 'd3ef6af973578a71a3329fd607f084e2382780b0a4ef9c91f5dfa8036ae76978', '[\"*\"]', '2026-07-22 13:01:01', NULL, '2025-10-04 06:59:19', '2026-07-22 13:01:01'),
(3, 'App\\Models\\User', 1, 'token', '2e6466a82532ab0843f97d07f40858e5541835ba88b97597291cbcdc8e79eb9d', '[\"*\"]', NULL, NULL, '2025-10-04 07:25:41', '2025-10-04 07:25:41'),
(4, 'App\\Models\\User', 1, 'token', '310593fdcf298f242f6e2f63a8f946e374cebcae483714da1bfe07ec8264cec1', '[\"*\"]', NULL, NULL, '2025-10-05 01:19:37', '2025-10-05 01:19:37'),
(5, 'App\\Models\\User', 1, 'token', 'a307b5902a0fab7481b2b4ca8207b9cf9d976588902d2b255b401dfbd693505d', '[\"*\"]', NULL, NULL, '2025-10-05 01:31:01', '2025-10-05 01:31:01'),
(6, 'App\\Models\\User', 1, 'token', '6e6d0707650da742faf6af5be3da9e0c575df420e8fcf845b4c412aa31861304', '[\"*\"]', NULL, NULL, '2025-10-05 01:32:19', '2025-10-05 01:32:19'),
(7, 'App\\Models\\User', 1, 'token', '98bcf37bb6b7c3b604f133803df8523deed1bf110ed7230c84d718dc4792f523', '[\"*\"]', NULL, NULL, '2025-10-05 01:33:18', '2025-10-05 01:33:18'),
(8, 'App\\Models\\User', 1, 'token', 'c124e8af7fe7d2068863d40694c958653c5b8d5a5cecd4ba61e91d42e00e2323', '[\"*\"]', NULL, NULL, '2025-10-05 02:11:09', '2025-10-05 02:11:09'),
(9, 'App\\Models\\User', 1, 'token', '0ab960bb0966a2a84f63777b96d4816c9a6e67968239c264a055a0a9328bbf90', '[\"*\"]', NULL, NULL, '2025-10-05 02:12:32', '2025-10-05 02:12:32'),
(10, 'App\\Models\\User', 1, 'token', '3197a90bbbb1fa39b2f464374a0dc11a58d2af298191fcdc74446bc981b0b67c', '[\"*\"]', NULL, NULL, '2025-10-05 02:41:45', '2025-10-05 02:41:45'),
(11, 'App\\Models\\User', 1, 'token', 'c3021456165867b82ea99d82454206f9570a74fd1884584e123299cc1dbe018d', '[\"*\"]', NULL, NULL, '2025-10-05 02:42:00', '2025-10-05 02:42:00'),
(12, 'App\\Models\\User', 1, 'token', '5afda29a9c9a641b30e708c1cef12163528435c68a0bb85b121a55b55fc8ef70', '[\"*\"]', NULL, NULL, '2025-10-05 02:43:41', '2025-10-05 02:43:41'),
(13, 'App\\Models\\User', 1, 'token', '4eb88335621b15536fb290ed4fc0af92abd3cf6767203cc0ccde0c314bda0f51', '[\"*\"]', NULL, NULL, '2025-10-05 02:44:41', '2025-10-05 02:44:41'),
(14, 'App\\Models\\User', 1, 'token', 'd4e665ba9542bcf49d75091170904a502e82e251d25c75a9fc7065f694241295', '[\"*\"]', NULL, NULL, '2025-10-05 02:51:12', '2025-10-05 02:51:12'),
(15, 'App\\Models\\User', 1, 'token', '22453ee7238c2ef7c84ead86d3f59f460c292c2906a38b83b038d543a7deb530', '[\"*\"]', NULL, NULL, '2025-10-05 03:25:37', '2025-10-05 03:25:37'),
(16, 'App\\Models\\User', 1, 'token', 'a8c9d643c641a9b2da4a5399968bb9f4f0f9d61f92b40995f06b2b3cf0ba8a57', '[\"*\"]', NULL, NULL, '2025-10-05 03:27:39', '2025-10-05 03:27:39'),
(17, 'App\\Models\\User', 1, 'token', 'f56487354e14d4e8c519d8067d495416b592bf3277760449f1f531cf0f59206d', '[\"*\"]', NULL, NULL, '2025-10-05 03:47:59', '2025-10-05 03:47:59'),
(18, 'App\\Models\\User', 1, 'token', '807daa9e3ad76ac202e2c1d2edc2cf60487380cbed60d697f01db6e8b03a8b74', '[\"*\"]', NULL, NULL, '2025-10-05 04:28:04', '2025-10-05 04:28:04'),
(19, 'App\\Models\\User', 1, 'token', 'e5385ec53266c2542a00f602a9bf56db0656b152901cbeaab24d51701f35424b', '[\"*\"]', NULL, NULL, '2025-10-05 04:47:04', '2025-10-05 04:47:04'),
(20, 'App\\Models\\User', 1, 'token', '1661289d6d1d8b9312c8ceb77943ac6b8b7ed6ea14296695ec37099b387b61b6', '[\"*\"]', NULL, NULL, '2025-10-05 05:26:41', '2025-10-05 05:26:41'),
(21, 'App\\Models\\User', 1, 'token', '1155404ba8e0e14272ef4b2b88f815a0de6801641d48a1e9414ab30bf856f879', '[\"*\"]', NULL, NULL, '2025-10-05 19:50:44', '2025-10-05 19:50:44'),
(22, 'App\\Models\\User', 1, 'token', '67a64452c59410ebc7dfcb3a802bb3c3b6baa3bbb7edb50e8f46575f584953f4', '[\"*\"]', NULL, NULL, '2025-10-06 05:03:13', '2025-10-06 05:03:13'),
(23, 'App\\Models\\User', 1, 'token', '9562e2a6221e3fc34e58e0a4a9a14ccd52f88973061ffbfd80b2aa16c3e59748', '[\"*\"]', NULL, NULL, '2025-10-07 05:16:03', '2025-10-07 05:16:03'),
(24, 'App\\Models\\User', 1, 'token', '7f980c0a5883690391ddf34964327cb0b5f74b431554e04dae26a3726b995d3e', '[\"*\"]', NULL, NULL, '2025-10-07 06:13:56', '2025-10-07 06:13:56'),
(25, 'App\\Models\\User', 1, 'token', 'e74728b6e9171a63a3acf08f502bc7a9a4ab0137e2948dc50e5dcd7517c7d6a7', '[\"*\"]', NULL, NULL, '2025-10-07 19:32:41', '2025-10-07 19:32:41'),
(26, 'App\\Models\\User', 1, 'token', 'e3f7fec4fc6f55afb10fc796b1028c39593cfe1bc588443852fb065d526dcf8c', '[\"*\"]', NULL, NULL, '2025-10-07 21:18:18', '2025-10-07 21:18:18'),
(27, 'App\\Models\\User', 1, 'token', '0d87f4146c14e808db66ef39b3f37f77de97a31edc234283add0ebe46efa8def', '[\"*\"]', NULL, NULL, '2025-10-07 23:32:13', '2025-10-07 23:32:13'),
(28, 'App\\Models\\User', 1, 'token', '8df9c59b38ea7d2eaa240c6c9b0bdd02342f1597a1c0dc00a41197b0a66ecf74', '[\"*\"]', NULL, NULL, '2025-10-08 01:22:58', '2025-10-08 01:22:58'),
(29, 'App\\Models\\User', 1, 'token', '377d59c86be5906a357c30914f836c43e0bb54a8cd8fc4fc1da65ce761003e01', '[\"*\"]', NULL, NULL, '2025-10-08 08:24:44', '2025-10-08 08:24:44'),
(30, 'App\\Models\\User', 1, 'token', 'ef8131cfe7f4968d506a80dbb3869cbb4f80293a50e60efa9d8b79501fcca09c', '[\"*\"]', NULL, NULL, '2025-10-08 20:04:44', '2025-10-08 20:04:44'),
(31, 'App\\Models\\User', 1, 'token', '47def934ef34a5902ce5365b3f52aa2a6855e6fd164be95865671a1960986a7b', '[\"*\"]', NULL, NULL, '2025-10-09 10:18:06', '2025-10-09 10:18:06'),
(32, 'App\\Models\\User', 1, 'token', 'deef8bfceff7cd7595c11390f5523d47477d6343a2f17af8ef011486b34ab680', '[\"*\"]', NULL, NULL, '2025-10-09 11:25:09', '2025-10-09 11:25:09'),
(33, 'App\\Models\\User', 1, 'token', 'fb9b66c268315a436bce77029a8900221fe7f16a20bde242af163c6ecbdbd8e8', '[\"*\"]', NULL, NULL, '2025-10-09 11:32:35', '2025-10-09 11:32:35'),
(34, 'App\\Models\\User', 1, 'token', '916a659a912cdd1e04be40eddd9fb7f707f1bd5346ffa2b5e9b4fb527a91d789', '[\"*\"]', NULL, NULL, '2025-10-09 11:42:19', '2025-10-09 11:42:19'),
(35, 'App\\Models\\User', 1, 'token', 'c16b5c1b556d5a7bf8c47fe3741a93c8a0da2d71981e158177887a18b409cb76', '[\"*\"]', NULL, NULL, '2025-10-09 11:46:48', '2025-10-09 11:46:48'),
(36, 'App\\Models\\User', 1, 'token', '11aca4c930d2a1810ad4008a273f4282c535dc096a87ca50998bab3ec65ff8e6', '[\"*\"]', NULL, NULL, '2025-10-10 08:59:11', '2025-10-10 08:59:11'),
(37, 'App\\Models\\User', 1, 'token', '3ee33233bde6814190328d2d1b84848fec4342fdbea221072681c2995e1d2323', '[\"*\"]', NULL, NULL, '2025-10-10 20:37:23', '2025-10-10 20:37:23'),
(38, 'App\\Models\\User', 1, 'token', 'da9aced3d769f031b154b869af7cb09bdb802df29580dfb129a5e4b6e9e84054', '[\"*\"]', NULL, NULL, '2025-10-11 00:25:37', '2025-10-11 00:25:37'),
(39, 'App\\Models\\User', 1, 'token', 'fcbf7ad7c3809a82dd9e321871d774d72de5bb63baf29b28c58117c61e1fa1f5', '[\"*\"]', NULL, NULL, '2025-10-11 02:03:22', '2025-10-11 02:03:22'),
(40, 'App\\Models\\User', 12, 'token', 'bdfe86794791ac6b86d22c54b2e4ae721becb2d8b83334e0e23c22160db3b550', '[\"*\"]', '2026-07-22 13:42:13', NULL, '2026-07-22 12:00:49', '2026-07-22 13:42:13'),
(41, 'App\\Models\\User', 12, 'token', '3ec06ec4a32091e2160b921f578e3ae9991db49e9ebe98725adea8d6b979d0a5', '[\"*\"]', NULL, NULL, '2026-07-22 12:00:50', '2026-07-22 12:00:50'),
(42, 'App\\Models\\User', 12, 'token', 'da22cfc8ba17ec65dd047dcdf1c43bd51414fcd11ccb77b9a0ddcf97e91ff59e', '[\"*\"]', NULL, NULL, '2026-07-22 13:05:42', '2026-07-22 13:05:42'),
(43, 'App\\Models\\User', 12, 'token', 'a933eac95ae0efd3b36a9f91eaaebe5bb7d98b4f679ba126fcac9310c78412de', '[\"*\"]', NULL, NULL, '2026-07-22 13:05:49', '2026-07-22 13:05:49'),
(44, 'App\\Models\\User', 12, 'token', '7541d40a9ca7632a22b14bd726d319bdbe5a02f91dd86aba7b88033407e8bd97', '[\"*\"]', NULL, NULL, '2026-07-22 13:15:31', '2026-07-22 13:15:31'),
(45, 'App\\Models\\User', 12, 'token', 'ef45a6727c2fd989ea69769a8bee8589eb1a5050adf801abda01a58cb0b2ec53', '[\"*\"]', '2026-07-22 13:39:19', NULL, '2026-07-22 13:15:55', '2026-07-22 13:39:19'),
(46, 'App\\Models\\User', 12, 'token', '68104e6d522233845a762962935a279cef695c4a0ac680b3a1bb70e03c347244', '[\"*\"]', NULL, NULL, '2026-07-22 13:47:38', '2026-07-22 13:47:38'),
(47, 'App\\Models\\User', 12, 'token', '3e5b22f66652b9b2a1c7ff035c0455146b115abec117f96d98439ddca1f5250a', '[\"*\"]', '2026-07-22 13:48:14', NULL, '2026-07-22 13:47:42', '2026-07-22 13:48:14'),
(48, 'App\\Models\\User', 14, 'token', '10113d4a10febaffa48573ff11872b201e7566b23930cbbecdf49730a281703b', '[\"*\"]', NULL, NULL, '2026-07-22 13:49:52', '2026-07-22 13:49:52'),
(49, 'App\\Models\\User', 25, 'token', '148704e7efcfa03fa71bb58dc14770f4abfb7547e7d45852e926ad202ed11f17', '[\"*\"]', NULL, NULL, '2026-07-22 13:52:41', '2026-07-22 13:52:41'),
(50, 'App\\Models\\User', 25, 'token', 'e1d9e89c125fa2667379d573121748f6836f4c1ea9361175799a57af32d8ec49', '[\"*\"]', NULL, NULL, '2026-07-22 13:52:45', '2026-07-22 13:52:45'),
(51, 'App\\Models\\User', 25, 'token', 'f8235bbcf601f622c2dbe150e65077fb129e8bd37f5db1f29f73168d91fd835c', '[\"*\"]', '2026-07-22 22:23:53', NULL, '2026-07-22 13:55:41', '2026-07-22 22:23:53'),
(52, 'App\\Models\\User', 12, 'token', '61d96277df4e33bceb7fbc4327f30c0a573a3f56ab8870164b39e00e7d0a9d6f', '[\"*\"]', '2026-07-22 22:26:09', NULL, '2026-07-22 22:24:56', '2026-07-22 22:26:09'),
(53, 'App\\Models\\User', 25, 'token', '1be45d9feb7cc5f7d7b1f98f057e3916f343be6b5bfed69071c34137763510e6', '[\"*\"]', '2026-07-22 23:02:55', NULL, '2026-07-22 22:26:27', '2026-07-22 23:02:55'),
(54, 'App\\Models\\User', 12, 'token', '8d180384b7cc870e7eede89350837b37a214daba6c35ebd440a42b07973201ec', '[\"*\"]', '2026-07-22 23:28:53', NULL, '2026-07-22 23:06:04', '2026-07-22 23:28:53'),
(55, 'App\\Models\\User', 25, 'token', 'cdde3b55a1adb0ccac8e60cb779e40aecb86e2cd427ce06d717c8ba8cb65795b', '[\"*\"]', NULL, NULL, '2026-07-23 03:20:42', '2026-07-23 03:20:42'),
(56, 'App\\Models\\User', 12, 'token', 'fe8eaa3d005e4c424317d4c0240e14f7c3c2e79a3e280c1c8d972dbca12e0e21', '[\"*\"]', '2026-07-23 09:14:36', NULL, '2026-07-23 03:20:52', '2026-07-23 09:14:36'),
(57, 'App\\Models\\User', 12, 'token', 'e644a8b65d7a04a29c16f42d0051879fb4790613a179f78e35c5a27cbc539bba', '[\"*\"]', '2026-07-23 23:24:31', NULL, '2026-07-23 23:00:14', '2026-07-23 23:24:31'),
(58, 'App\\Models\\User', 25, 'token', 'ffa0436ed71d1b726829553aed41cca9de7570dcb8070ce1917a0735afbe1b30', '[\"*\"]', '2026-07-30 01:58:18', NULL, '2026-07-23 23:28:14', '2026-07-30 01:58:18'),
(59, 'App\\Models\\User', 12, 'token', '9cea449a261f73396ada56e818f7ff4e31327a5c3f4508d75ed80a6653f7fb5f', '[\"*\"]', '2026-07-30 02:12:19', NULL, '2026-07-30 01:58:41', '2026-07-30 02:12:19'),
(60, 'App\\Models\\User', 25, 'token', '5bd3c3cfb1947176fe546c78b6390caf4181404bc0b43ee07fe6020da1557e95', '[\"*\"]', '2026-07-30 02:13:03', NULL, '2026-07-30 02:12:27', '2026-07-30 02:13:03'),
(61, 'App\\Models\\User', 42, 'token', '5d3b309d713afcb8cf93f8035e6f6fe0169646160c3553abff1ff146aabbfd98', '[\"*\"]', '2026-07-30 09:27:43', NULL, '2026-07-30 02:19:37', '2026-07-30 09:27:43'),
(62, 'App\\Models\\User', 12, 'token', '413b75df2aed349f87309b69b55201c8e44c6437f7a9035353bf9209ac6ed5c1', '[\"*\"]', '2026-07-30 09:06:50', NULL, '2026-07-30 07:59:12', '2026-07-30 09:06:50'),
(63, 'App\\Models\\User', 25, 'token', '68e9765a76a85e19727ec0973cc1155ac35dfadc41d4c7512fc55bdf3564202c', '[\"*\"]', '2026-07-31 00:10:10', NULL, '2026-07-30 09:30:58', '2026-07-31 00:10:10');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `weight` decimal(8,2) DEFAULT NULL,
  `is_seasonal` tinyint(1) DEFAULT 0,
  `seasonal_start_date` date DEFAULT NULL,
  `seasonal_end_date` date DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `sku`, `description`, `base_price`, `stock_quantity`, `weight`, `is_seasonal`, `seasonal_start_date`, `seasonal_end_date`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Mominul', 'mominul', 'development skill', 90000.00, 10, 60.00, 1, '2025-01-01', '2025-12-31', 'active', '2025-10-07 08:20:51', '2025-10-05 21:18:32', '2025-10-07 08:20:51'),
(2, 1, 1, 'Mominul Product 1', 'mominul-1', 'Development skill product number 1', 91000.00, 11, 60.00, 1, '2025-01-01', '2025-12-31', 'active', '2025-10-08 20:28:07', '2025-10-05 22:23:34', '2025-10-08 20:28:07'),
(3, 1, 1, 'Mominul Product 2', 'mominul-2', 'Development skill product number 2', 92000.00, 12, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(4, 1, 1, 'Mominul Product 3', 'mominul-3', 'Development skill product number 3', 93000.00, 13, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(5, 1, 1, 'Mominul Product 4', 'mominul-4', 'Development skill product number 4', 94000.00, 14, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(6, 1, 1, 'Mominul Product 5', 'mominul-5', 'Development skill product number 5', 95000.00, 15, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(7, 1, 1, 'Mominul Product 6', 'mominul-6', 'Development skill product number 6', 96000.00, 16, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(8, 1, 1, 'Mominul Product 7', 'mominul-7', 'Development skill product number 7', 97000.00, 17, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(9, 1, 1, 'Mominul Product 8', 'mominul-8', 'Development skill product number 8', 98000.00, 18, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(10, 1, 1, 'Mominul Product 9', 'mominul-9', 'Development skill product number 9', 99000.00, 19, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(11, 1, 1, 'Mominul Product 10', 'mominul-10', 'Development skill product number 10', 100000.00, 20, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(12, 1, 1, 'Mominul Product 11', 'mominul-11', 'Development skill product number 11', 101000.00, 21, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(13, 1, 1, 'Mominul Product 12', 'mominul-12', 'Development skill product number 12', 102000.00, 22, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(14, 1, 1, 'Mominul Product 13', 'mominul-13', 'Development skill product number 13', 103000.00, 23, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(15, 1, 1, 'Mominul Product 14', 'mominul-14', 'Development skill product number 14', 104000.00, 24, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(16, 1, 1, 'Mominul Product 15', 'mominul-15', 'Development skill product number 15', 105000.00, 25, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(17, 1, 1, 'Mominul Product 16', 'mominul-16', 'Development skill product number 16', 106000.00, 26, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(18, 1, 1, 'Mominul Product 17', 'mominul-17', 'Development skill product number 17', 107000.00, 27, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(19, 1, 1, 'Mominul Product 18', 'mominul-18', 'Development skill product number 18', 108000.00, 28, 60.00, 1, '2025-01-01', '2025-12-31', 'active', NULL, '2025-10-05 22:23:34', '2025-10-05 22:23:34'),
(20, 1, 1, 'Mominul Product 19', 'mominul-19', 'Development skill product number 19', 109000.00, 29, 60.00, 1, '2025-01-01', '2025-12-31', 'active', '2025-10-07 08:21:01', '2025-10-05 22:23:34', '2025-10-07 08:21:01'),
(21, 1, 1, 'Mominul Product 20', 'mominul-20', 'Development skill product number 20', 110000.00, 30, 60.00, 1, '2025-01-01', '2025-12-31', 'active', '2025-10-06 01:17:38', '2025-10-05 22:23:34', '2025-10-06 01:17:38'),
(22, 1, 4, 'SoftNovaIT', 'dsfdsdsf', 'dfdsfd', 45464.00, 54, 60.00, 1, '2025-10-24', '2025-10-16', 'active', '2025-10-08 20:28:11', '2025-10-06 04:14:36', '2025-10-08 20:28:11'),
(23, 1, 5, 'hghg', 'JHDGD', 'ghghg', 454.00, 54, 60.00, 1, '2025-10-23', '2025-10-15', 'active', '2025-10-08 20:28:16', '2025-10-06 04:47:05', '2025-10-08 20:28:16'),
(24, 1, 1, 'iPhone 15', 'iphone', 'sdkfdj', 1245667.00, 10, 0.60, 0, NULL, NULL, 'active', '2025-10-08 20:28:33', '2025-10-06 09:39:11', '2025-10-08 20:28:33'),
(25, 1, 1, 'iPhone 15', 'car0', 'sdkfdj', 1245667.00, 10, 0.60, 0, NULL, NULL, 'active', '2025-10-08 20:28:37', '2025-10-06 09:41:47', '2025-10-08 20:28:37'),
(26, 1, 5, 'SoftNovaIT', 'dsfdsdsf12', 'fdfsds', 56575.00, 30, 60.00, 0, NULL, NULL, 'active', '2025-10-08 20:28:42', '2025-10-06 20:43:38', '2025-10-08 20:28:42'),
(28, 1, 5, 'Dummy', 'dsfdsdsf879', 'ddgfgf', 565.00, 5656, 656.00, 1, '2025-10-22', '2025-10-16', 'active', '2025-10-08 20:29:11', '2025-10-06 22:39:47', '2025-10-08 20:29:11'),
(30, 2, 4, 'dfdffd', 'fdsfdsgfgg', 'sdfdsfds', 596.00, 987, 60.00, 0, NULL, NULL, 'active', NULL, '2025-10-08 20:27:10', '2025-10-08 20:27:10'),
(62, 1, 37, 'The Obsidian Crown [PROD]', 'OBS-CRN-6852', 'Exclusive artifact: The Obsidian Crown [PROD]. Handcrafted with premium materials.', 24999.00, 48, 4.60, 0, NULL, NULL, 'active', '2026-07-23 03:37:38', '2026-07-22 15:22:54', '2026-07-23 03:37:38'),
(63, 2, 35, 'Golden Fleece Shawl [PROD]', 'GLD-FLC-6351', 'Exclusive artifact: Golden Fleece Shawl [PROD]. Handcrafted with premium materials.', 18999.00, 45, 5.00, 0, NULL, NULL, 'active', NULL, '2026-07-22 15:22:54', '2026-07-22 15:22:54'),
(64, 36, 1, 'Celestial Ember Ring [PROD]', 'CEL-EMB-2372', 'Exclusive artifact: Celestial Ember Ring [PROD]. Handcrafted with premium materials.', 45999.00, 44, 3.50, 0, NULL, NULL, 'active', NULL, '2026-07-22 15:22:54', '2026-07-22 15:22:54'),
(65, 5, 33, 'Moonstone Amulet [PROD]', 'MON-AMT-2716', 'Exclusive artifact: Moonstone Amulet [PROD]. Handcrafted with premium materials.', 12999.00, 11, 1.20, 0, NULL, NULL, 'active', NULL, '2026-07-22 15:22:54', '2026-07-22 15:22:54'),
(66, 5, 1, 'Ivory Dragon Vase [PROD]', 'IVY-DRG-4094', 'Exclusive artifact: Ivory Dragon Vase [PROD]. Handcrafted with premium materials.', 34999.00, 15, 3.30, 0, NULL, NULL, 'active', NULL, '2026-07-22 15:22:54', '2026-07-22 15:22:54'),
(67, 38, 39, 'Crimson Velvet Gown [PROD]', 'CRM-VLV-8127', 'Exclusive artifact: Crimson Velvet Gown [PROD]. Handcrafted with premium materials.', 7999.00, 6, 2.70, 0, NULL, NULL, 'active', NULL, '2026-07-22 15:22:54', '2026-07-22 15:22:54'),
(68, 2, 32, 'Sapphire Encrusted Dagger [PROD]', 'SAP-DGR-8661', 'Exclusive artifact: Sapphire Encrusted Dagger [PROD]. Handcrafted with premium materials.', 59999.00, 30, 1.10, 0, NULL, NULL, 'active', NULL, '2026-07-22 15:22:54', '2026-07-22 15:22:54'),
(69, 1, 32, 'Amber Fossil Pendant [PROD]', 'AMB-FSL-3273', 'Exclusive artifact: Amber Fossil Pendant [PROD]. Handcrafted with premium materials.', 8999.00, 49, 4.60, 0, NULL, NULL, 'active', NULL, '2026-07-22 15:22:54', '2026-07-22 15:22:54'),
(70, 40, 43, 'CCCCxx', 'ASC-XVHM333', 'CCCCCCCCCefef', 1122.00, 3333, 332.99, 0, NULL, NULL, 'active', NULL, '2026-07-23 03:24:12', '2026-07-23 03:34:00'),
(71, 37, 39, 'The Obsidian Crown [PROD]', 'OBS-CRN-2531', 'Exclusive artifact: The Obsidian Crown [PROD]. Handcrafted with premium materials.', 24999.00, 34, 2.10, 0, NULL, NULL, 'active', NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39'),
(72, 38, 38, 'Golden Fleece Shawl [PROD]', 'GLD-FLC-4421', 'Exclusive artifact: Golden Fleece Shawl [PROD]. Handcrafted with premium materials.', 18999.00, 35, 3.00, 0, NULL, NULL, 'active', NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39'),
(73, 1, 34, 'Celestial Ember Ring [PROD]', 'CEL-EMB-4900', 'Exclusive artifact: Celestial Ember Ring [PROD]. Handcrafted with premium materials.', 45999.00, 48, 3.30, 0, NULL, NULL, 'active', NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39'),
(74, 4, 32, 'Moonstone Amulet [PROD]', 'MON-AMT-5171', 'Exclusive artifact: Moonstone Amulet [PROD]. Handcrafted with premium materials.', 12999.00, 43, 4.90, 0, NULL, NULL, 'active', NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39'),
(75, 37, 39, 'Ivory Dragon Vase [PROD]', 'IVY-DRG-7506', 'Exclusive artifact: Ivory Dragon Vase [PROD]. Handcrafted with premium materials.', 34999.00, 30, 3.30, 0, NULL, NULL, 'active', NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39'),
(76, 38, 35, 'Crimson Velvet Gown [PROD]', 'CRM-VLV-3776', 'Exclusive artifact: Crimson Velvet Gown [PROD]. Handcrafted with premium materials.', 7999.00, 41, 4.30, 0, NULL, NULL, 'active', NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39'),
(77, 37, 36, 'Sapphire Encrusted Dagger [PROD]', 'SAP-DGR-5806', 'Exclusive artifact: Sapphire Encrusted Dagger [PROD]. Handcrafted with premium materials.', 59999.00, 21, 2.90, 0, NULL, NULL, 'active', NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39'),
(78, 1, 1, 'Amber Fossil Pendant [PROD]', 'AMB-FSL-6203', 'Exclusive artifact: Amber Fossil Pendant [PROD]. Handcrafted with premium materials.', 8999.00, 8, 4.90, 0, NULL, NULL, 'active', NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`, `is_primary`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, '/storage/uploads/products/kjdkfjdk.jpg', 1, NULL, '2025-10-05 23:16:49', '2026-07-22 14:50:15'),
(2, 24, '/storage/uploads/products/pyHjdZ49VehTwqBpGS8vWewrmbriANlUnav0na0p.jpg', 1, NULL, '2025-10-06 09:39:11', '2025-10-06 09:39:11'),
(3, 25, '/storage/uploads/products/SsvUFRoROawvc5kBr7YFK61sdR0ucx9PG1SjRSEU.jpg', 1, NULL, '2025-10-06 09:41:47', '2025-10-06 09:41:47'),
(4, 25, '/storage/uploads/products/jW14oitor32OPWq8p6EsZfEzbLWH6D6cGMhXRKG9.jpg', 0, NULL, '2025-10-06 09:41:47', '2025-10-06 09:41:47'),
(5, 25, '/storage/uploads/products/fweWiy7bPGSSGWMBgFT3vohXDQ9oGvNIay3WP3by.jpg', 0, NULL, '2025-10-06 09:41:47', '2025-10-06 09:41:47'),
(6, 28, '/storage/uploads/products/uDypwrmiIK9YgTSh74ytS11BBcND4JFjJT58B71N.jpg', 1, NULL, '2025-10-06 22:39:48', '2025-10-06 22:39:48'),
(7, 28, '/storage/uploads/products/PFWoaCIQ6RLgocGgkGusdFsZchSbBaGsfVYRnFVh.jpg', 0, NULL, '2025-10-06 22:39:48', '2025-10-06 22:39:48'),
(8, 28, '/storage/uploads/products/I7v012uWN5y6zmnX0ADjBgJSL1lX6HbUhtKvILZJ.jpg', 0, NULL, '2025-10-06 22:39:48', '2025-10-06 22:39:48'),
(15, 26, '/storage/uploads/products/Ymd83tgxNSgohf5enzyBjB9BkuANLiM97aaMUeQ1.jpg', 1, NULL, '2025-10-07 05:03:13', '2025-10-07 05:03:13'),
(16, 26, '/storage/uploads/products/O0GKyCFIRSfwrANdwpPYaa1KgKjXIrjE9fqRbTH8.jpg', 0, NULL, '2025-10-07 05:03:13', '2025-10-07 05:03:13'),
(18, 23, '/storage/uploads/products/YpLLgwWgPB1YCmThnmddbTzHp3HjOFBWjNTh8bji.jpg', 1, NULL, '2025-10-07 05:22:32', '2025-10-07 05:22:32'),
(19, 23, '/storage/uploads/products/epCNiYsKn5t2B4vTYnXFU9Uf0Q7FIowv7UPJ1vl2.jpg', 0, NULL, '2025-10-07 05:22:32', '2025-10-07 05:22:32'),
(20, 23, '/storage/uploads/products/FM16Jo3Z0Pf6kKpB3VEGcwlmd7tau26AwXgyBe4b.jpg', 0, NULL, '2025-10-07 05:22:32', '2025-10-07 05:22:32'),
(21, 23, '/storage/uploads/products/LDM4AspJMdokYnlUg62JoMN89hWU68RLzLcZMdqM.jpg', 1, NULL, '2025-10-07 05:23:02', '2025-10-07 05:23:02'),
(22, 22, '/storage/uploads/products/HpYQNK5YyMFBj5SyUiT5AZuZzoQGMhDuqIYj3Mk9.jpg', 1, NULL, '2025-10-07 05:42:33', '2025-10-07 05:42:33'),
(23, 22, '/storage/uploads/products/dJ7QBQzfJkSHCW7x2bWaq4jDzzvRIQdOuu1dwyWJ.jpg', 0, NULL, '2025-10-07 05:42:33', '2025-10-07 05:42:33'),
(24, 2, '/storage/uploads/products/k0TEf26QMbDW4Ez0oNVt9SxmAnYYCZl7BiQQHeFn.jpg', 1, NULL, '2025-10-07 05:42:56', '2025-10-07 05:42:56'),
(25, 28, '/storage/uploads/products/Wjtl56FJ02MHzANvuUoaLv9ScqAYpsX7Ir1FnXEa.jpg', 1, NULL, '2025-10-08 20:25:36', '2025-10-08 20:25:36'),
(26, 30, '/storage/uploads/products/2NM6MjmyfOFCHbvhfYkiGoe5TDlXmspYyWLUOOSY.jpg', 1, NULL, '2025-10-08 20:27:10', '2025-10-08 20:27:10'),
(27, 30, '/storage/uploads/products/Zwfw4kpK3bDxCCRCHvcTMzr2pfhyOy7VJZUUucsx.jpg', 0, NULL, '2025-10-08 20:27:10', '2025-10-08 20:27:10'),
(28, 30, '/storage/uploads/products/t4oaN6NzRKcFkMezZjLM0y1j6JSbeBdHV97OkZH8.jpg', 0, NULL, '2025-10-08 20:27:10', '2025-10-08 20:27:10'),
(32, 3, '/storage/uploads/products/Skb0ENC9w7FfrwWBcgRgV7bqRmhc9PtigJedCOSS.jpg', 1, NULL, '2025-10-11 00:27:08', '2026-07-22 14:49:37'),
(33, 4, '/storage/uploads/products/3BjCf64TNpoyykzS4mOM86UJ4oYvDKewcKq3b47Y.jpg', 1, NULL, '2025-10-11 00:27:29', '2026-07-22 14:49:37'),
(34, 5, '/storage/uploads/products/BPsaaURaMvCoq6pEcvfOT3emwjlt7R2uoLOwQEXB.jpg', 1, NULL, '2025-10-11 00:27:50', '2025-10-11 00:27:50'),
(35, 6, '/storage/uploads/products/oN4kkA1eZPMZDKJy79jyJRUXgIQWNccwQNgEe8wB.jpg', 1, NULL, '2025-10-11 00:28:14', '2025-10-11 00:28:14'),
(36, 7, '/storage/uploads/products/ZBgT76tehWP4rtpBF5UQOqAZaEt20XbOvNVEp0L9.jpg', 1, NULL, '2025-10-11 00:28:34', '2025-10-11 00:28:34'),
(37, 8, '/storage/uploads/products/zHkIKU7eDOGieeJB1sIbk0MnfjULT5iNboWtR1hn.jpg', 1, NULL, '2025-10-11 00:28:53', '2026-07-22 14:49:39'),
(38, 9, '/storage/uploads/products/mTUgYNHgnruU6pHsoT9X83msp2plzT0TYvvykFPU.jpg', 1, NULL, '2025-10-11 00:29:13', '2025-10-11 00:29:13'),
(39, 10, '/storage/uploads/products/jJ7Cjv2y3ZRB0de27HAr0gOnqGmOAfSbuoJ6NvZH.jpg', 1, NULL, '2025-10-11 00:29:33', '2025-10-11 00:29:33'),
(40, 11, '/storage/uploads/products/product_11_main.jpg', 1, NULL, '2026-07-22 14:50:19', '2026-07-22 14:50:19'),
(41, 12, '/storage/uploads/products/product_12_main.jpg', 1, NULL, '2026-07-22 14:50:19', '2026-07-22 14:50:19'),
(42, 13, '/storage/uploads/products/product_13_main.jpg', 1, NULL, '2026-07-22 14:50:20', '2026-07-22 14:50:20'),
(43, 14, '/storage/uploads/products/product_14_main.jpg', 1, NULL, '2026-07-22 14:50:20', '2026-07-22 14:50:20'),
(44, 15, '/storage/uploads/products/product_15_main.jpg', 1, NULL, '2026-07-22 14:50:21', '2026-07-22 14:50:21'),
(45, 16, '/storage/uploads/products/product_16_main.jpg', 1, NULL, '2026-07-22 14:50:21', '2026-07-22 14:50:21'),
(46, 17, '/storage/uploads/products/product_17_main.jpg', 1, NULL, '2026-07-22 14:50:22', '2026-07-22 14:50:22'),
(47, 18, '/storage/uploads/products/product_18_main.jpg', 1, NULL, '2026-07-22 14:50:22', '2026-07-22 14:50:22'),
(48, 19, '/storage/uploads/products/product_19_main.jpg', 1, NULL, '2026-07-22 14:50:23', '2026-07-22 14:50:23'),
(70, 3, '/storage/uploads/products/product_15_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(71, 3, '/storage/uploads/products/uDypwrmiIK9YgTSh74ytS11BBcND4JFjJT58B71N.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(72, 4, '/storage/uploads/products/NQYKRom6RMu2Kgv91uNxGvF9d9rOCdRD9N9cKD7w.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(73, 4, '/storage/uploads/products/Skb0ENC9w7FfrwWBcgRgV7bqRmhc9PtigJedCOSS.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(74, 5, '/storage/uploads/products/product_16_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(75, 5, '/storage/uploads/products/Skb0ENC9w7FfrwWBcgRgV7bqRmhc9PtigJedCOSS.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(76, 6, '/storage/uploads/products/product_37_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(77, 6, '/storage/uploads/products/epCNiYsKn5t2B4vTYnXFU9Uf0Q7FIowv7UPJ1vl2.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(78, 7, '/storage/uploads/products/product_48_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(79, 7, '/storage/uploads/products/Zwfw4kpK3bDxCCRCHvcTMzr2pfhyOy7VJZUUucsx.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(80, 8, '/storage/uploads/products/product_39_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(81, 8, '/storage/uploads/products/NQYKRom6RMu2Kgv91uNxGvF9d9rOCdRD9N9cKD7w.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(82, 9, '/storage/uploads/products/uesNpdh0pSxuSQvbeRu9ByDQHJtc9f79ldJ5mAOs.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(83, 9, '/storage/uploads/products/epCNiYsKn5t2B4vTYnXFU9Uf0Q7FIowv7UPJ1vl2.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(84, 10, '/storage/uploads/products/product_17_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(85, 10, '/storage/uploads/products/product_38_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(86, 11, '/storage/uploads/products/t4oaN6NzRKcFkMezZjLM0y1j6JSbeBdHV97OkZH8.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(87, 11, '/storage/uploads/products/product_48_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(88, 12, '/storage/uploads/products/product_49_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(89, 12, '/storage/uploads/products/zHkIKU7eDOGieeJB1sIbk0MnfjULT5iNboWtR1hn.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(90, 13, '/storage/uploads/products/t4oaN6NzRKcFkMezZjLM0y1j6JSbeBdHV97OkZH8.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(91, 13, '/storage/uploads/products/product_38_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(92, 14, '/storage/uploads/products/product_38_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(93, 14, '/storage/uploads/products/3BjCf64TNpoyykzS4mOM86UJ4oYvDKewcKq3b47Y.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(94, 15, '/storage/uploads/products/product_42_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(95, 15, '/storage/uploads/products/Ymd83tgxNSgohf5enzyBjB9BkuANLiM97aaMUeQ1.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(96, 16, '/storage/uploads/products/product_40_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(97, 16, '/storage/uploads/products/O0GKyCFIRSfwrANdwpPYaa1KgKjXIrjE9fqRbTH8.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(98, 17, '/storage/uploads/products/k0TEf26QMbDW4Ez0oNVt9SxmAnYYCZl7BiQQHeFn.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(99, 17, '/storage/uploads/products/product_35_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(100, 18, '/storage/uploads/products/product_17_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(101, 18, '/storage/uploads/products/product_14_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(102, 19, '/storage/uploads/products/product_49_main.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(103, 19, '/storage/uploads/products/3BjCf64TNpoyykzS4mOM86UJ4oYvDKewcKq3b47Y.jpg', 0, NULL, '2026-07-22 14:59:38', '2026-07-22 14:59:38'),
(146, 62, '/storage/uploads/products/product_12_main.jpg', 1, NULL, '2026-07-22 23:06:49', '2026-07-22 23:06:49'),
(147, 63, '/storage/uploads/products/product_13_main.jpg', 1, NULL, '2026-07-22 23:06:49', '2026-07-22 23:06:49'),
(148, 64, '/storage/uploads/products/product_14_main.jpg', 1, NULL, '2026-07-22 23:06:49', '2026-07-22 23:06:49'),
(149, 65, '/storage/uploads/products/product_15_main.jpg', 1, NULL, '2026-07-22 23:06:49', '2026-07-22 23:06:49'),
(150, 66, '/storage/uploads/products/product_16_main.jpg', 1, NULL, '2026-07-22 23:06:49', '2026-07-22 23:06:49'),
(151, 67, '/storage/uploads/products/product_17_main.jpg', 1, NULL, '2026-07-22 23:06:49', '2026-07-22 23:06:49'),
(152, 68, '/storage/uploads/products/product_18_main.jpg', 1, NULL, '2026-07-22 23:06:49', '2026-07-22 23:06:49'),
(153, 69, '/storage/uploads/products/product_19_main.jpg', 1, NULL, '2026-07-22 23:06:49', '2026-07-22 23:06:49'),
(154, 70, '/storage/uploads/products/fsgxqfpXh1gzBsRRb0tLYyIIgjgGwvv1H2i224lS.png', 0, NULL, '2026-07-23 03:24:13', '2026-07-23 03:34:00'),
(155, 70, '/storage/uploads/products/d5oef42SOdvieaLdFTSphOejl3XtJ13bvQ8mTUpI.png', 1, NULL, '2026-07-23 03:24:13', '2026-07-23 03:34:00'),
(156, 70, '/storage/uploads/products/CZPWHencu65lYEfYBA0nAqZqdA47pyNP9OZ1ZJdu.png', 0, NULL, '2026-07-23 03:27:24', '2026-07-23 03:34:00'),
(157, 71, '/storage/uploads/products/product_11_main.jpg', 1, NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39'),
(158, 72, '/storage/uploads/products/product_12_main.jpg', 1, NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39'),
(159, 73, '/storage/uploads/products/product_13_main.jpg', 1, NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39'),
(160, 74, '/storage/uploads/products/product_14_main.jpg', 1, NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39'),
(161, 75, '/storage/uploads/products/product_15_main.jpg', 1, NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39'),
(162, 76, '/storage/uploads/products/product_16_main.jpg', 1, NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39'),
(163, 77, '/storage/uploads/products/product_17_main.jpg', 1, NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39'),
(164, 78, '/storage/uploads/products/product_18_main.jpg', 1, NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `additional_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `size_id`, `color`, `additional_price`, `stock_quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 2, '#0033ff', 139.00, 24, '2025-10-08 02:07:37', '2026-07-22 13:42:13', NULL),
(2, 5, 3, 'White', 57.00, 90, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(3, 5, 1, 'Red', 50.00, 26, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(4, 3, 1, 'Black', 148.00, 89, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(5, 3, 3, 'Red', 124.00, 87, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(6, 5, 3, 'Blue', 191.00, 56, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(7, 1, 2, 'Red', 151.00, 28, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(8, 4, 1, 'Blue', 69.00, 68, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(9, 2, 1, 'Red', 82.00, 84, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(10, 4, 1, 'Black', 169.00, 62, '2025-10-08 02:07:37', '2025-10-08 02:07:37', NULL),
(37, 68, 6, '#8B0000', 300.00, 25, '2026-07-22 15:22:54', '2026-07-22 15:22:54', NULL),
(38, 62, 5, '#1A1A2E', 440.00, 18, '2026-07-22 15:22:54', '2026-07-22 15:22:54', NULL),
(39, 68, 2, '#C5A059', 120.00, 25, '2026-07-22 15:22:54', '2026-07-22 15:22:54', NULL),
(40, 64, 5, '#2E8B57', 210.00, 19, '2026-07-22 15:22:54', '2026-07-22 15:22:54', NULL),
(41, 65, 6, '#4B0082', 200.00, 10, '2026-07-22 15:22:54', '2026-07-22 15:22:54', NULL),
(42, 64, 3, '#FF6B35', 90.00, 15, '2026-07-22 15:22:54', '2026-07-22 15:22:54', NULL),
(43, 62, 5, '#006D77', 360.00, 3, '2026-07-22 15:22:54', '2026-07-22 15:22:54', NULL),
(44, 68, 5, '#DDA0DD', 250.00, 16, '2026-07-22 15:22:54', '2026-07-22 15:22:54', NULL),
(45, 73, 1, '#8B0000', 230.00, 19, '2026-07-23 05:55:39', '2026-07-23 05:55:39', NULL),
(46, 71, 2, '#1A1A2E', 450.00, 24, '2026-07-23 05:55:39', '2026-07-23 05:55:39', NULL),
(47, 74, 5, '#C5A059', 110.00, 3, '2026-07-23 05:55:39', '2026-07-23 05:55:39', NULL),
(48, 73, 6, '#2E8B57', 480.00, 3, '2026-07-23 05:55:39', '2026-07-23 05:55:39', NULL),
(49, 78, 1, '#4B0082', 430.00, 4, '2026-07-23 05:55:39', '2026-07-23 05:55:39', NULL),
(50, 77, 1, '#FF6B35', 360.00, 8, '2026-07-23 05:55:39', '2026-07-23 05:55:39', NULL),
(51, 74, 5, '#006D77', 80.00, 20, '2026-07-23 05:55:39', '2026-07-23 05:55:39', NULL),
(52, 76, 4, '#DDA0DD', 270.00, 8, '2026-07-23 05:55:39', '2026-07-23 05:55:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 1, 2, 1, 'This is a sample review number 1', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(3, 1, 1, 1, 'This is a sample review number 2', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(4, 1, 2, 3, 'This is a sample review number 3', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(5, 1, 2, 5, 'This is a sample review number 4', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(6, 1, 2, 2, 'This is a sample review number 5', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(7, 1, 1, 3, 'This is a sample review number 6', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(8, 1, 2, 3, 'This is a sample review number 7', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(9, 1, 1, 3, 'This is a sample review number 8', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(10, 1, 2, 2, 'This is a sample review number 9', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(11, 1, 1, 5, 'This is a sample review number 10', '2025-10-08 23:42:43', '2025-10-08 23:42:43', NULL),
(25, 22, 3, 3, 'The watch face is absolutely gorgeous. The detailing on the dial is incredible and it keeps perfect time. A true conversation starter!', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(26, 13, 3, 5, 'Perfect in every way. The design is elegant, the quality is superb, and it arrived in perfect condition. This is what true craftsmanship looks like. Five stars without hesitation!', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(27, 2, 4, 3, 'Average quality. Nothing special but nothing terrible either. It gets the job done. May upgrade to a higher-end option in the future.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(28, 25, 4, 4, 'Really pleased with this product. The quality is excellent and it serves its purpose perfectly. A solid choice for anyone considering a purchase.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(29, 1, 4, 3, 'It\'s okay. The product is fine but I\'ve seen better quality at this price range. Might work for some people but didn\'t fully meet my expectations.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(30, 19, 4, 4, 'These sneakers are incredibly comfortable right out of the box. The leather is soft and the sole provides excellent support.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(31, 16, 5, 3, 'The fitness tracking is incredibly accurate. Battery life is amazing and the display is bright even outdoors. Love the health monitoring features.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(32, 7, 5, 4, 'Really pleased with this product. The quality is excellent and it serves its purpose perfectly. A solid choice for anyone considering a purchase.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(33, 5, 5, 5, 'Outstanding product! I\'ve been searching for something like this for a long time and finally found it. The quality is exceptional and it was worth every taka. Thank you!', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(34, 22, 6, 4, 'The fabric is so soft and comfortable. Fits perfectly and the color hasn\'t faded after multiple washes. Great sustainable choice!', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(35, 13, 6, 3, 'The fabric is so soft and comfortable. Fits perfectly and the color hasn\'t faded after multiple washes. Great sustainable choice!', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(36, 5, 6, 5, 'The fabric is so soft and comfortable. Fits perfectly and the color hasn\'t faded after multiple washes. Great sustainable choice!', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(37, 21, 7, 5, 'The keys feel amazing and the RGB lighting is stunning. Built like a tank and the switches are smooth and responsive. A must-have for any setup!', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(38, 10, 7, 5, 'The keys feel amazing and the RGB lighting is stunning. Built like a tank and the switches are smooth and responsive. A must-have for any setup!', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(39, 14, 7, 3, 'The keys feel amazing and the RGB lighting is stunning. Built like a tank and the switches are smooth and responsive. A must-have for any setup!', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(40, 8, 7, 4, 'Great product for the price. The quality is solid and it looks good. Just wish there were more color options available. Other than that, very happy with my purchase.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(41, 8, 8, 5, 'Absolutely stunning quality! The craftsmanship is beyond what I expected. Every detail shows the care that went into making this. Highly recommended for anyone who appreciates fine products.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(42, 17, 8, 4, 'Crystal clear images with beautiful bokeh effect. The build quality is solid and autofocus is quick and accurate. Professional-grade results every time.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(43, 24, 8, 4, 'Really happy with this purchase! The product arrived in great condition and looks wonderful. Gave it 4 stars because the packaging could have been a bit better, but the product itself is fantastic.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(44, 23, 9, 4, 'Great craftsmanship and beautiful design. The product matches the description perfectly. The only reason I\'m not giving 5 stars is the shipping took a bit longer than expected.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(45, 24, 9, 4, 'Elegant and spacious. The leather is premium quality and the stitching is flawless. Fits all my essentials perfectly. A timeless piece!', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(46, 5, 10, 5, 'I\'m blown away by the quality! This is exactly what I was looking for. The product feels premium and works perfectly. Customer service was also very helpful with my questions.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(47, 17, 10, 5, 'Outstanding product! I\'ve been searching for something like this for a long time and finally found it. The quality is exceptional and it was worth every taka. Thank you!', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(48, 9, 10, 3, 'Decent product for the price point. It does what it\'s supposed to do, but I was expecting a bit more based on the description. Still, it\'s not bad and I\'ll keep using it.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(49, 16, 11, 4, 'Really pleased with this product. The quality is excellent and it serves its purpose perfectly. A solid choice for anyone considering a purchase.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(50, 20, 11, 3, 'The sound quality is phenomenal. Noise cancellation works perfectly on flights. Comfortable to wear for hours. Best headphones I\'ve ever owned!', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(51, 25, 12, 3, 'It\'s okay. The product is fine but I\'ve seen better quality at this price range. Might work for some people but didn\'t fully meet my expectations.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(52, 13, 12, 4, 'Great craftsmanship and beautiful design. The product matches the description perfectly. The only reason I\'m not giving 5 stars is the shipping took a bit longer than expected.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(53, 6, 12, 5, 'Tracks my workouts accurately and the heart rate monitor is very reliable. The step counter is spot-on. Great value for the price.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(54, 4, 13, 3, 'It\'s okay. The product is fine but I\'ve seen better quality at this price range. Might work for some people but didn\'t fully meet my expectations.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(55, 5, 13, 4, 'Really happy with this purchase! The product arrived in great condition and looks wonderful. Gave it 4 stars because the packaging could have been a bit better, but the product itself is fantastic.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(56, 6, 13, 3, 'It\'s okay. The product is fine but I\'ve seen better quality at this price range. Might work for some people but didn\'t fully meet my expectations.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(57, 20, 13, 5, 'So cozy and warm! The organic cotton feels great against the skin. Perfect for lounging around the house or casual outings.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(58, 13, 14, 5, 'Outstanding product! I\'ve been searching for something like this for a long time and finally found it. The quality is exceptional and it was worth every taka. Thank you!', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(59, 7, 14, 3, 'Average quality. Nothing special but nothing terrible either. It gets the job done. May upgrade to a higher-end option in the future.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(60, 14, 14, 4, 'Sharp, clear images with beautiful colors. The portrait mode is incredible. A fantastic lens for any photographer\'s kit.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(61, 2, 15, 4, 'Really pleased with this product. The quality is excellent and it serves its purpose perfectly. A solid choice for anyone considering a purchase.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(62, 6, 15, 5, 'Outstanding product! I\'ve been searching for something like this for a long time and finally found it. The quality is exceptional and it was worth every taka. Thank you!', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(63, 16, 16, 5, 'Perfect in every way. The design is elegant, the quality is superb, and it arrived in perfect condition. This is what true craftsmanship looks like. Five stars without hesitation!', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(64, 18, 16, 4, 'This mat has completely transformed my practice. The alignment lines are so helpful and the grip is excellent even during intense sessions.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(65, 12, 17, 5, 'Incredible sound quality in such a compact form. The case is premium and the battery life is impressive. Perfect for commutes and workouts.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(66, 5, 17, 4, 'Really pleased with this product. The quality is excellent and it serves its purpose perfectly. A solid choice for anyone considering a purchase.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(67, 22, 17, 4, 'Incredible sound quality in such a compact form. The case is premium and the battery life is impressive. Perfect for commutes and workouts.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(68, 9, 17, 5, 'Incredible sound quality in such a compact form. The case is premium and the battery life is impressive. Perfect for commutes and workouts.', '2026-07-22 15:06:29', '2026-07-22 15:06:29', NULL),
(74, 42, 72, 3, 'HI BYEE', '2026-07-30 09:17:31', '2026-07-30 09:22:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1JgrLLSpF8Ykm0O4JUl0f9Yt0OZwlh8jhq0E4Ggk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFBFNmdxTjE1ZHM4RGVTZlZqZG15d1Zib0J6eWRVSFlmMEN5cElrcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759907601),
('2ryBVCBdk28sNWg8U43U5pjQEzeZralneVi20AmO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXdFSndWZlpxSXl6V2g4YVNBMTZPV3NtVm9HVGp2S3BZVmdkb3p4RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759933466),
('3LuVudKOPymxOwN6p7LxAYKT7HA2nBiZwW581yOH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic05BZG5TRlJFTHZNZ0xENlVOb1B3UmtCYU1LSWpmV3hldXVuakdzaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759885613),
('8XijJtjlsHekWLzeuS7gvNZVif5MEfDDzEeZFCUr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0VwS0VaOEZOdGE2azIzcVR6b2NaUjRSVHROTFlMTWM2eW1JOWp0ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759804921),
('bSX7Uxxoq2kKBO9cfjzXzHm1dA27KXvo5WpvqmZ3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWZLMzJzTTRUM1dSVmJuT0QwcFladUFGSTlGRk9nZHNXc0hncU5NYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC8vc3RvcmFnZS91cGxvYWRzL3Byb2R1Y3RzL3B5SGpkWjQ5VmVoVHdxQnBHUzh2V2V3cm1icmlBTmxVbmF2MG5hMHAuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1759765194),
('HgviEW8QxhXRVjGqMLqqoX4ApcWeCfBHmlpFdkAj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib044Q2xsRlJYWmxqM05Kb09kR2d4cHVKd2RKVVhaVmYwNWhZaG5sbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1760104719),
('J1h8nkK7S7NUHuSDD7cnG17Ap9eqcgH0oEhyTaLn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0J3d3RGM1poRnk5NDNTbGFZZ2tDdzJqVG13TVhhUWFSTURLWHhxUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759715429),
('kbvzbMSLaGkAUiw0x33KQirwN1tad50UVaGXaHAi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:143.0) Gecko/20100101 Firefox/143.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0tGS2tHU2R4SDJmeTZCdDZ2OWt2V3NSdG1RMm13emNxT2ZPZjROUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759887140),
('o85bM27BCqoNCmZyYRozuDumn1XclGBUSfd3SoGs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2tIQ2R5WHR6b2dYM2p6WkRYNndFSjhXWEtMeWVRRnJQR3RDbTdZQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759629181),
('qIvTUsqh5pwt1M79gMM36023dQNgkgj9AEX81ngH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGdwMUxwRTQwWURSVzNwTUFrM3VsMzl5Z3oyREc0REFvVTA2TllXOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759975305),
('qz5qfuRjtV9lBFBxSLZQAmbtJgNZ7SubzArzR4sb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0xDcDZzRzZPT2RMRWN0Vnl0bWlBUmN1WU4xTTR5WjJrRDR6akJySiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1760143209),
('rs0yd2Kh6d3FlE5rT7TlhPFqihtHql0sdU1eOoZQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0ZyV0o5MHB5ZlBmU1JpSW05NXVnYm9nWFM5dmdWcExQazZISUpzNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759582728),
('stRWRAWrFZqwoKAxC6p6dTxlosVfCJvgrqDpTqao', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkh5WkhjUWNjeEZ3Y2RBVXZqSmtPQ0h3RWRkb0tJb0w5c2h2cEFodSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759734372),
('yMpSZAYklTNgc9M7Pe9WCk8xddVxQyZXrVpnnTse', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1FONUlTYkFzWjBLTEdua05DNDd0OTlkSjV4UGZXZkE4QUJvUExXRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759571538);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `fee` decimal(10,2) NOT NULL,
  `is_free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `name`, `description`, `fee`, `is_free_shipping`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Standard Shipping', 'Delivers in 5–7 business days.', 100.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(2, 'Express Shipping', 'Delivers in 2–3 business days.', 200.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(3, 'Overnight Shipping', 'Delivers by next business day.', 350.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(4, 'Free Standard Shipping', 'Free delivery in 7–10 business days.', 0.00, 1, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(5, 'Local Pickup', 'Pick up from our local store.', 0.00, 1, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(6, 'Same Day Delivery', 'Delivery within 24 hours.', 250.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(7, 'International Shipping', 'Delivery within 10–15 business days.', 500.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(8, 'Economy Shipping', 'Cheapest shipping option.', 80.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(9, 'Weekend Delivery', 'Delivery available on weekends.', 150.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(10, 'Drone Delivery', 'Fast drone-based delivery.', 400.00, 0, '2025-10-09 02:59:15', '2025-10-09 02:59:15', NULL),
(11, 'UNCOMMON DRONE EXPRESS 99', NULL, 99.00, 0, '2026-07-22 13:03:35', '2026-07-22 13:03:35', NULL),
(12, 'UNCOMMON DRONE EXPRESS 773', NULL, 99.00, 0, '2026-07-22 13:03:51', '2026-07-22 13:03:51', NULL),
(13, 'UNCOMMON DRONE EXPRESS 944', NULL, 99.00, 0, '2026-07-22 13:04:00', '2026-07-22 13:04:00', NULL),
(14, 'UNCOMMON DRONE EXPRESS 964', NULL, 99.00, 0, '2026-07-22 13:04:09', '2026-07-22 13:04:09', NULL),
(15, 'UNCOMMON DRONE EXPRESS 470', NULL, 99.00, 0, '2026-07-22 13:14:53', '2026-07-22 13:14:53', NULL),
(16, 'Stratosphere Jet [SHIP] #68', 'Premium Stratosphere Jet [SHIP] shipping service', 1500.00, 0, '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(17, 'Solar Wind Express [SHIP] #28', 'Premium Solar Wind Express [SHIP] shipping service', 2500.00, 0, '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(18, 'Orbital Freight [SHIP] #32', 'Premium Orbital Freight [SHIP] shipping service', 500.00, 0, '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(19, 'Lightning Courier [SHIP] #94', 'Premium Lightning Courier [SHIP] shipping service', 0.00, 1, '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(20, 'Aurora Parcel [SHIP] #51', 'Premium Aurora Parcel [SHIP] shipping service', 800.00, 0, '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(21, 'Void Delivery [SHIP] #89', 'Premium Void Delivery [SHIP] shipping service', 3000.00, 0, '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(22, 'Stratosphere Jet [SHIP] #25', 'Premium Stratosphere Jet [SHIP] shipping service', 1500.00, 0, '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(23, 'Solar Wind Express [SHIP] #65', 'Premium Solar Wind Express [SHIP] shipping service', 2500.00, 0, '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(24, 'Orbital Freight [SHIP] #83', 'Premium Orbital Freight [SHIP] shipping service', 500.00, 0, '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(25, 'Lightning Courier [SHIP] #87', 'Premium Lightning Courier [SHIP] shipping service', 0.00, 1, '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(26, 'Aurora Parcel [SHIP] #56', 'Premium Aurora Parcel [SHIP] shipping service', 800.00, 0, '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(27, 'Void Delivery [SHIP] #60', 'Premium Void Delivery [SHIP] shipping service', 3000.00, 0, '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(28, 'FINAL-TEST-SHIP', NULL, 99.00, 0, '2026-07-22 13:32:59', '2026-07-22 13:32:59', NULL),
(29, 'Stratosphere Jet [SHIP] #56', 'Premium Stratosphere Jet [SHIP] shipping service', 1500.00, 0, '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(30, 'Solar Wind Express [SHIP] #96', 'Premium Solar Wind Express [SHIP] shipping service', 2500.00, 0, '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(31, 'Orbital Freight [SHIP] #86', 'Premium Orbital Freight [SHIP] shipping service', 500.00, 0, '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(32, 'Lightning Courier [SHIP] #35', 'Premium Lightning Courier [SHIP] shipping service', 0.00, 1, '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(33, 'Aurora Parcel [SHIP] #47', 'Premium Aurora Parcel [SHIP] shipping service', 800.00, 0, '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(34, 'Void Delivery [SHIP] #46', 'Premium Void Delivery [SHIP] shipping service', 3000.00, 0, '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'XS', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(2, 'S', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(3, 'M', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(4, 'L', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(5, 'XL', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(6, 'XXL', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(7, '3XL', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(8, '4XL', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(9, '28', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58'),
(10, '30', 1, '2025-10-05 08:46:58', '2025-10-05 08:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_type` enum('debit','credit','refund','chargeback') NOT NULL,
  `method` enum('card','mobile_banking','COD','wallet') NOT NULL,
  `transaction_reference` varchar(150) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `status` enum('pending','success','failed','refunded') NOT NULL,
  `remarks` text DEFAULT NULL,
  `processed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `transaction_type`, `method`, `transaction_reference`, `amount`, `currency`, `status`, `remarks`, `processed_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 11, 4, 'debit', 'wallet', 'TXN8WPWL24BZW', 443.00, 'BDT', 'failed', 'Dummy transaction record 2', '2025-09-09 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(3, 9, 1, 'refund', 'COD', 'TXN4ALYERZJOV', 832.50, 'BDT', 'failed', 'Dummy transaction record 3', '2025-09-27 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(4, 8, 4, 'chargeback', 'wallet', 'TXNTAI2KEZY2U', 869.80, 'BDT', 'refunded', 'Dummy transaction record 4', '2025-09-30 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(5, 4, 8, 'chargeback', 'wallet', 'TXN4MF3SIIRYM', 412.90, 'BDT', 'pending', 'Dummy transaction record 5', '2025-09-11 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(6, 7, 6, 'debit', 'COD', 'TXNSPDZQTY1B9', 402.10, 'BDT', 'pending', 'Dummy transaction record 6', '2025-10-06 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(7, 1, 7, 'debit', 'mobile_banking', 'TXNFXALJOLDA5', 24.50, 'BDT', 'refunded', 'Dummy transaction record 7', '2025-10-02 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(8, 7, 5, 'refund', 'card', 'TXN2QJ8RMSCHN', 985.20, 'BDT', 'success', 'Dummy transaction record 8', '2025-09-10 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(9, 2, 2, 'debit', 'COD', 'TXNN36KQJQERP', 161.50, 'BDT', 'failed', 'Dummy transaction record 9', '2025-09-09 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(10, 11, 7, 'debit', 'card', 'TXNSTOTFB8GTZ', 901.70, 'BDT', 'failed', 'Dummy transaction record 10', '2025-10-09 08:43:28', '2025-10-09 08:43:28', '2025-10-09 08:43:28', NULL),
(11, 1, 11, 'credit', 'mobile_banking', 'REF-UNC-944', 9099.00, 'BDT', 'success', 'UNCOMMON TRANSACTION 944', '2026-07-22 19:04:00', '2026-07-22 13:04:00', '2026-07-22 13:04:00', NULL),
(12, 1, 12, 'credit', 'mobile_banking', 'REF-UNC-964', 9099.00, 'BDT', 'success', 'UNCOMMON TRANSACTION 964', '2026-07-22 19:04:09', '2026-07-22 13:04:09', '2026-07-22 13:04:09', NULL),
(13, 1, 13, 'credit', 'mobile_banking', 'REF-UNC-470', 9099.00, 'BDT', 'success', 'UNCOMMON TRANSACTION 470', '2026-07-22 19:14:53', '2026-07-22 13:14:53', '2026-07-22 13:14:53', NULL),
(14, 14, 15, 'credit', 'card', 'BNK-REF-40926221622A', 3900.00, 'BDT', 'pending', 'UNIQUE TRANSACTION #54454 — Financial operations log', '2026-07-03 13:22:28', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(15, 15, 16, 'refund', 'wallet', 'BNK-REF-07304D13C589', 16900.00, 'EUR', 'success', 'UNIQUE TRANSACTION #80573 — Financial operations log', '2026-07-15 13:22:28', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(16, 16, 18, 'refund', 'card', 'BNK-REF-33197CF8D714', 18400.00, 'BDT', 'failed', 'UNIQUE TRANSACTION #47955 — Financial operations log', '2026-07-02 13:22:28', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(17, 17, 18, 'debit', 'card', 'BNK-REF-3359D4D1F1F0', 3800.00, 'BDT', 'failed', 'UNIQUE TRANSACTION #26785 — Financial operations log', '2026-06-30 13:22:28', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(18, 18, 14, 'chargeback', 'COD', 'BNK-REF-492C4CE71358', 13800.00, 'BDT', 'success', 'UNIQUE TRANSACTION #32022 — Financial operations log', '2026-06-29 13:22:28', '2026-07-22 13:22:28', '2026-07-22 13:22:28', NULL),
(19, 19, 21, 'refund', 'COD', 'BNK-REF-4E47F0086AD9', 15400.00, 'GBP', 'pending', 'UNIQUE TRANSACTION #50626 — Financial operations log', '2026-06-29 13:23:59', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(20, 20, 20, 'debit', 'card', 'BNK-REF-A862B059096E', 16700.00, 'USD', 'pending', 'UNIQUE TRANSACTION #12215 — Financial operations log', '2026-07-17 13:23:59', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(21, 21, 19, 'refund', 'COD', 'BNK-REF-0040DADB53D6', 12800.00, 'BDT', 'refunded', 'UNIQUE TRANSACTION #80930 — Financial operations log', '2026-07-17 13:23:59', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(22, 22, 19, 'credit', 'wallet', 'BNK-REF-5372F2CB3668', 6000.00, 'USD', 'pending', 'UNIQUE TRANSACTION #18435 — Financial operations log', '2026-07-20 13:23:59', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(23, 23, 19, 'refund', 'card', 'BNK-REF-81B42333655B', 10500.00, 'BDT', 'refunded', 'UNIQUE TRANSACTION #30152 — Financial operations log', '2026-06-22 13:23:59', '2026-07-22 13:23:59', '2026-07-22 13:23:59', NULL),
(24, 26, 27, 'debit', 'wallet', 'BNK-REF-B264A2003638', 17800.00, 'EUR', 'pending', 'UNIQUE TRANSACTION #81471 — Financial operations log', '2026-06-25 15:21:08', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(25, 27, 28, 'debit', 'COD', 'BNK-REF-D11635D3D496', 6400.00, 'BDT', 'refunded', 'UNIQUE TRANSACTION #46396 — Financial operations log', '2026-06-25 15:21:08', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(26, 28, 24, 'chargeback', 'wallet', 'BNK-REF-135517B5CE42', 5400.00, 'BDT', 'success', 'UNIQUE TRANSACTION #53198 — Financial operations log', '2026-07-15 15:21:08', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(27, 29, 27, 'credit', 'mobile_banking', 'BNK-REF-A2CB1D5C3506', 5900.00, 'GBP', 'failed', 'UNIQUE TRANSACTION #20343 — Financial operations log', '2026-07-15 15:21:08', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL),
(28, 30, 25, 'debit', 'card', 'BNK-REF-EE83C1CC1321', 14400.00, 'BDT', 'success', 'UNIQUE TRANSACTION #11681 — Financial operations log', '2026-07-15 15:21:08', '2026-07-22 15:21:08', '2026-07-22 15:21:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'customer',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nasir Uddin', 'nasir93cse@gmail.com', 'admin', NULL, '$2y$12$RkAe5mv53GjJVaNOQWVz0.nvcN7ngWOXu73I/xHHHFh4EjxqtDvey', NULL, '2025-10-04 04:56:21', '2025-10-04 04:56:21'),
(2, 'Mominul Islam', 'mominul@gmail.com', 'admin', NULL, '$2y$12$uT0UYHhsSEhN35OFNntQQ.Z5GltH3qN4W.K6F1hAhQIayO593FpQi', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(4, 'Shaimum Hasan', 'shaimum@gmail.com', 'customer', NULL, '$2y$12$XdpXLxMh1P33Urd1/NxzEurWUVyqG.kpVlp03m14GsPYbbJRKboQG', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(5, 'Rasel Ahmed', 'rasel@gmail.com', 'customer', NULL, '$2y$12$Wck/vBCm6PwMGjlNWtkydu07Hzy23mPhm2PI.87QNDOuxDC9x06FO', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(6, 'Samiul Islam', 'samiul@gmail.com', 'customer', NULL, '$2y$12$Xb2cLReWfsmJHUonFuShOenGd6I2msorGjh7YLS6uR4RIVB2RN6ZO', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(7, 'Farhana Akter', 'farhana@gmail.com', 'customer', NULL, '$2y$12$WKuU87XmfP3.cEVQ6P.y/ea2oiHQP1XMlDivJaDZWrfDtVetX9Tba', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(8, 'Rafi Khan', 'rafi@gmail.com', 'customer', NULL, '$2y$12$dUNJFO2Xi0wcuHedzp9N7uqMEzDjN4uVrRqtk6.QvLP9R/txyUPEi', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(9, 'Tania Sultana', 'tania@gmail.com', 'customer', NULL, '$2y$12$iV1VczyueqhgkgEONLL8cutSausgSrPknAqaRru9EKlmdvcZy6w.2', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(10, 'Sabbir Hossain', 'sabbir@gmail.com', 'customer', NULL, '$2y$12$UJcZED.Ixi2j6mzM67ytzuDkW0GRK83E.oXjAmGD3m/TGc1FuBUuu', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(11, 'Ruhul Amin', 'ruhul@gmail.com', 'customer', NULL, '$2y$12$Iz3UPG1gPIjgvfAoznauK.iRRvCezyc8DrkBXZjIT1paDE36xIuIW', NULL, '2025-10-09 04:39:06', '2025-10-09 04:39:06'),
(12, 'Lumina Admin', 'admin@gmail.com', 'admin', NULL, '$2y$12$/Ckbv1GQHWnjUACWnG/wcuniA37WWBcLdYzOBCIaZiRXhGyG8JQu2', NULL, '2026-07-22 12:00:13', '2026-07-22 13:15:05'),
(13, 'Test User X', 'testuserx@test.com', 'customer', NULL, '$2y$12$s4vGUw0sgtaXV8qQ5GYy0eh3GNlxTEhXmmUteI9Csrsn4FvwC4WsG', NULL, '2026-07-22 13:20:28', '2026-07-22 13:20:28'),
(14, 'Atticus Finch [LIT-USER]', 'atticus.finch_37@litmail.com', 'customer', NULL, '$2y$12$l1eJGc2ozBXBSERQbFVOmOu2irqe4RZP6mw3DNZedeJBJOJmXdDvC', NULL, '2026-07-22 13:22:28', '2026-07-22 13:22:28'),
(15, 'Elizabeth Bennet [LIT-USER]', 'elizabeth.bennet_42@litmail.com', 'customer', NULL, '$2y$12$GGFfrWaGtrCWhfbvb7ZJUOVt6wcjauMb1y/qlmXql5oKTk/pnjgCi', NULL, '2026-07-22 13:22:28', '2026-07-22 13:22:28'),
(16, 'Sherlock Holmes [LIT-USER]', 'sherlock.holmes_60@litmail.com', 'customer', NULL, '$2y$12$x2M9uAOGIal3/K4D1fl1D.uPFe8blyniCDEk9eEeOMhjqH/yvYllC', NULL, '2026-07-22 13:22:28', '2026-07-22 13:22:28'),
(17, 'Jane Eyre [LIT-USER]', 'jane.eyre_69@litmail.com', 'customer', NULL, '$2y$12$3pTaE64PmRC6RkxUJZxQpOpp02hxz1.VNuUrRNR5fOpanldRILL2e', NULL, '2026-07-22 13:22:28', '2026-07-22 13:22:28'),
(18, 'Jay Gatsby [LIT-USER]', 'jay.gatsby_49@litmail.com', 'customer', NULL, '$2y$12$uLohQCMCvRJFbpk.chJ/BecsZCIkoSLh1A6DgtKiIArJ0uKXTesm6', NULL, '2026-07-22 13:22:28', '2026-07-22 13:22:28'),
(19, 'Atticus Finch [LIT-USER]', 'atticus.finch_78@litmail.com', 'customer', NULL, '$2y$12$D2nNF0s5IyaEVJ55R4SX5.sBFWApLsg5Xbl7YlEOG6El2gDcvTetS', NULL, '2026-07-22 13:23:58', '2026-07-22 13:23:58'),
(20, 'Elizabeth Bennet [LIT-USER]', 'elizabeth.bennet_22@litmail.com', 'customer', NULL, '$2y$12$Q9AefGsRgp6QLLZZDZdEGutxgivnqlyb5onOLX4thQcg.Re2ULS/K', NULL, '2026-07-22 13:23:58', '2026-07-22 13:23:58'),
(21, 'Sherlock Holmes [LIT-USER]', 'sherlock.holmes_95@litmail.com', 'customer', NULL, '$2y$12$XvLdQKsSG.mjahQtLTKLw.Pf6xZg92bpZaQVLiP2DSJb6gV82gahq', NULL, '2026-07-22 13:23:59', '2026-07-22 13:23:59'),
(22, 'Jane Eyre [LIT-USER]', 'jane.eyre_18@litmail.com', 'customer', NULL, '$2y$12$9hhFlIYbOxZmroYGzRbWZuJIpLmNdV/dMISZbs3KQ5Yldfio.9Hsm', NULL, '2026-07-22 13:23:59', '2026-07-22 13:23:59'),
(23, 'Jay Gatsby [LIT-USER]', 'jay.gatsby_88@litmail.com', 'customer', NULL, '$2y$12$u19e3JZgEiMuInliiMPaZuXmI3KEEWVDDjDLhzI4KMKeJQRn7vpMm', NULL, '2026-07-22 13:23:59', '2026-07-22 13:23:59'),
(24, 'Test User Final', 'testfinal@test.com', 'customer', NULL, '$2y$12$BGH/gkUdPcJxuhCdvg8KGOMV/DlUZ0uvBELwdVmdXTo/E2F1BCLi6', NULL, '2026-07-22 13:32:58', '2026-07-22 13:32:58'),
(25, 'Customer A', 'A@gmail.com', 'customer', NULL, '$2y$12$nyQ4H14YrBws7MEduo82iudakRGMWA3ngRXHtgx73Jvs/us/56rm2', NULL, '2026-07-22 13:52:01', '2026-07-22 13:52:25'),
(26, 'Atticus Finch [LIT-USER]', 'atticus.finch_68@litmail.com', 'customer', NULL, '$2y$12$/9Eulkvu4DlNhCNAe9EPBeCLp4nNhDBDayezBl/qdAo3sqDtYhm5C', NULL, '2026-07-22 15:21:07', '2026-07-22 15:21:07'),
(27, 'Elizabeth Bennet [LIT-USER]', 'elizabeth.bennet_67@litmail.com', 'customer', NULL, '$2y$12$77Qnc61s7d5ziVVPepWDnOOlJtu0HUWkKpLte/3AxzSiWO6zdbihm', NULL, '2026-07-22 15:21:08', '2026-07-22 15:21:08'),
(28, 'Sherlock Holmes [LIT-USER]', 'sherlock.holmes_31@litmail.com', 'customer', NULL, '$2y$12$Yysnhpe2cCrKvR2XsOz1L.WDtLPuzsnT/zTNhkKAJlUfVCffDIJ0S', NULL, '2026-07-22 15:21:08', '2026-07-22 15:21:08'),
(29, 'Jane Eyre [LIT-USER]', 'jane.eyre_56@litmail.com', 'customer', NULL, '$2y$12$o1xX3vMl4LP.Ad5/qOktPemHJ027tdSCXopImgmKdmSlqIs7ZgpW.', NULL, '2026-07-22 15:21:08', '2026-07-22 15:21:08'),
(30, 'Jay Gatsby [LIT-USER]', 'jay.gatsby_54@litmail.com', 'customer', NULL, '$2y$12$WukJJCkFPazTN1qFk563KeD.SZlzVfX/dsVPuwkVTQGzqgWcM2aT.', NULL, '2026-07-22 15:21:08', '2026-07-22 15:21:08'),
(31, 'Atticus Finch [LIT-USER]', 'atticus.finch_12@litmail.com', 'customer', NULL, '$2y$12$fwhmYd276EPpYDJTuXEqJOPJrG.PQjouTwTzVrGoDZmvxanBOzjpC', NULL, '2026-07-22 15:22:53', '2026-07-22 15:22:53'),
(32, 'Elizabeth Bennet [LIT-USER]', 'elizabeth.bennet_85@litmail.com', 'customer', NULL, '$2y$12$fuxZHs8SVDIcW0ZmOxpz/uaemOtSDlMyuzN2WYgRWf2w4mepUpo3u', NULL, '2026-07-22 15:22:53', '2026-07-22 15:22:53'),
(33, 'Sherlock Holmes [LIT-USER]', 'sherlock.holmes_58@litmail.com', 'customer', NULL, '$2y$12$Bx7aFtyhrF4kWazRL5Is0encet1P3lgMN8ilONlBNAplz6HSYsayS', NULL, '2026-07-22 15:22:53', '2026-07-22 15:22:53'),
(34, 'Jane Eyre [LIT-USER]', 'jane.eyre_86@litmail.com', 'customer', NULL, '$2y$12$oIhnoRH0oqxOTyYU2OD/aejlJ1acOMRx8ZWjJ64zl/cDqcJVLSIUK', NULL, '2026-07-22 15:22:54', '2026-07-22 15:22:54'),
(35, 'Jay Gatsby [LIT-USER]', 'jay.gatsby_82@litmail.com', 'customer', NULL, '$2y$12$S1bAKbQc37hjlLPFY/tiV./g/qB11zS4pJCbxR8gAvtlS.bYD0cJG', NULL, '2026-07-22 15:22:54', '2026-07-22 15:22:54'),
(36, 'Atticus Finch [LIT-USER]', 'atticus.finch_63@litmail.com', 'customer', NULL, '$2y$12$GlEHfURoorjiEiWa39AGouTwTaOwObeWifznwOuaGZeGhhLRXslD.', NULL, '2026-07-23 05:55:38', '2026-07-23 05:55:38'),
(37, 'Elizabeth Bennet [LIT-USER]', 'elizabeth.bennet_10@litmail.com', 'customer', NULL, '$2y$12$8LvyY4jWvb4cBFJWcOuCpez.FfQMFrJIf0ynlVYoWs9QsBlNENCHy', NULL, '2026-07-23 05:55:38', '2026-07-23 05:55:38'),
(38, 'Sherlock Holmes [LIT-USER]', 'sherlock.holmes_83@litmail.com', 'customer', NULL, '$2y$12$pOI5mNu2eyYeFH/PhXtpreAzO8Nlj0rtzpTFl32qzjp9yAXAAfAfS', NULL, '2026-07-23 05:55:38', '2026-07-23 05:55:38'),
(39, 'Jane Eyre [LIT-USER]', 'jane.eyre_74@litmail.com', 'customer', NULL, '$2y$12$rBTTwbQ5qLU1pryW5dWouu5FxVg6Qsanme1IGs62keqWciq4eUuz.', NULL, '2026-07-23 05:55:39', '2026-07-23 05:55:39'),
(41, 'AASAS', 'AA@gmail.com', 'customer', NULL, '$2y$12$XHVs37mj/59/SGWH1M4mBO.CKu2Kq6ej05BHBcYQ613rfITYNGsgy', NULL, '2026-07-23 06:46:55', '2026-07-23 06:46:55'),
(42, 'B Customer', 'B@gmail.com', 'customer', NULL, '$2y$12$JITAR3/QQ1g3QnxswdLFVujQDFG2PHs0v32ST7gAiYzWFXRUlj5W.', NULL, '2026-07-30 02:19:37', '2026-07-30 02:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(21, 1, 9, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(22, 1, 6, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(23, 1, 4, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(24, 1, 6, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(25, 1, 8, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(26, 1, 9, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(27, 1, 4, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(28, 1, 3, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(29, 1, 5, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(30, 1, 5, NULL, '2025-10-08 03:15:37', '2025-10-08 03:15:37'),
(49, 25, 71, '2026-07-30 01:56:14', '2026-07-30 01:33:18', '2026-07-30 01:56:14'),
(50, 25, 71, '2026-07-30 01:56:09', '2026-07-30 01:47:19', '2026-07-30 01:56:09'),
(51, 25, 71, '2026-07-30 01:56:07', '2026-07-30 01:50:21', '2026-07-30 01:56:07'),
(52, 25, 71, NULL, '2026-07-30 01:56:47', '2026-07-30 01:56:47'),
(53, 25, 76, NULL, '2026-07-30 01:56:57', '2026-07-30 01:56:57'),
(54, 42, 71, NULL, '2026-07-30 02:28:51', '2026-07-30 02:28:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkouts_user_id_foreign` (`user_id`),
  ADD KEY `checkouts_session_id_index` (`session_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_assigned_user_id_foreign` (`assigned_user_id`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_usages_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupon_usages_user_id_foreign` (`user_id`),
  ADD KEY `coupon_usages_order_id_foreign` (`order_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_product_id_foreign` (`product_id`),
  ADD KEY `discounts_category_id_foreign` (`category_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_logs_product_id_foreign` (`product_id`),
  ADD KEY `inventory_logs_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_code_unique` (`order_code`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `order_shippings`
--
ALTER TABLE `order_shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_shippings_order_id_foreign` (`order_id`),
  ADD KEY `order_shippings_shipping_method_id_foreign` (`shipping_method_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`),
  ADD KEY `product_variants_size_id_foreign` (`size_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `checkouts`
--
ALTER TABLE `checkouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_shippings`
--
ALTER TABLE `order_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD CONSTRAINT `checkouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_assigned_user_id_foreign` FOREIGN KEY (`assigned_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD CONSTRAINT `coupon_usages_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_usages_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_usages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discounts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD CONSTRAINT `inventory_logs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventory_logs_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_shippings`
--
ALTER TABLE `order_shippings`
  ADD CONSTRAINT `order_shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_shippings_shipping_method_id_foreign` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variants_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
