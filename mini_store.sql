-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 23, 2021 at 03:06 PM
-- Server version: 8.0.27
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_12_19_162543_create_stores_table', 2),
(6, '2021_12_21_153733_create_transections_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int NOT NULL,
  `price_buy` int NOT NULL,
  `price_sell` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `images`, `amount`, `price_buy`, `price_sell`, `created_at`, `updated_at`) VALUES
(21, 'ເກີບຜ້າໃບ ຄູ່', '1640180839.jpeg', 13, 45000, 85000, '2021-12-22 06:47:19', '2021-12-22 21:44:31'),
(22, 'ໂສ້ງຂາສັ້ນ ສີສົ້ມ', '1640180869.jpg', 8, 35000, 60000, '2021-12-22 06:47:49', '2021-12-22 21:44:31'),
(23, 'ເສື້ອຍືດ ໂປໂລ', '1640180914.jpg', 36, 18000, 35000, '2021-12-22 06:48:34', '2021-12-22 21:44:31'),
(24, 'ສະບູ່ Lux ສີຟ້າ', '1640180947.jpg', 40, 3000, 5000, '2021-12-22 06:49:07', '2021-12-22 21:44:31'),
(25, 'ນ້ຳຢາລ້າງຈານ ໄລປ້ອນເອັບ', '1640180986.jpeg', 8, 15000, 20000, '2021-12-22 06:49:46', '2021-12-22 21:44:31'),
(26, 'ໂສ້ງຍືດ ຜູ້ຊາຍ', '1640181024.jpg', 0, 35000, 60000, '2021-12-22 06:50:24', '2021-12-24 07:32:26'),
(27, 'ສະບູ່ແຄ່', '1640181053.jpg', 35, 5000, 8000, '2021-12-22 06:50:53', '2021-12-22 21:46:50'),
(28, 'ໂສ້ງຜູ້ຍິງ', '1640181081.png', 20, 40000, 60000, '2021-12-22 06:51:21', '2021-12-23 00:31:43'),
(29, 'ສະບູ່ສະໝຸນໄພ', '1640181107.jpg', 41, 3000, 6000, '2021-12-22 06:51:47', '2021-12-23 00:31:43'),
(30, 'ນ້ຳຢາລ້າງຈານ ໄດວາ', '1640181141.jpg', 55, 15000, 25000, '2021-12-22 06:52:21', '2021-12-22 21:44:31'),
(31, 'ໂສ້ງສັ້ນ ສຸພາບຜູ້ຊາຍ', '1640181176.jpg', 33, 45000, 65000, '2021-12-22 06:52:56', '2021-12-23 06:01:37'),
(32, 'ເສື້ອໂປໂລ ສະບາຍ ສະບາຍ', '1640181438.jpg', 25, 30000, 45000, '2021-12-22 06:57:19', '2021-12-23 06:42:23'),
(33, 'ສະບູ່ການົກປກ້ວ', '1640181483.jpg', 19, 3000, 8000, '2021-12-22 06:58:03', '2021-12-23 06:01:37'),
(34, 'ເກີບຜ້າໃບ', '1640181533.jpg', 33, 45000, 65000, '2021-12-22 06:58:53', '2021-12-23 06:42:23'),
(35, 'ນ້ຳຢາລ້າງຈານ ຊັນໄລ', '1640181567.jpg', 24, 12000, 18000, '2021-12-22 06:59:27', '2021-12-23 06:42:23'),
(36, 'ເຄື່ອງດື່ມ ເປັບຊີ້ 2', '1640183024.jpg', 50, 4000, 8000, '2021-12-22 07:23:44', '2021-12-22 07:23:53'),
(37, 'ເກີບຜ້າໃບ 2', '1640183065.jpg', 17, 30000, 45000, '2021-12-22 07:24:26', '2021-12-22 23:36:36'),
(38, 'ຢາສະຜົມ Clear', '1640265118.jpg', 40, 18000, 35000, '2021-12-23 06:11:59', '2021-12-23 06:13:33'),
(39, 'ຢາສະຜົນ Herbal', '1640266900.jpg', 50, 35000, 60000, '2021-12-23 06:41:40', '2021-12-23 06:41:40');

-- --------------------------------------------------------

--
-- Table structure for table `transections`
--

CREATE TABLE `transections` (
  `id` bigint UNSIGNED NOT NULL,
  `tran_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tran_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tran_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int NOT NULL,
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transections`
--

INSERT INTO `transections` (`id`, `tran_id`, `product_id`, `tran_type`, `tran_detail`, `amount`, `price`, `created_at`, `updated_at`) VALUES
(36, 'EXP00002', '21', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ເກີບຜ້າໃບ ຄູ່', 30, 1350000, '2021-12-22 06:47:19', '2021-12-22 06:47:19'),
(37, 'EXP00003', '22', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ໂສ້ງຂາສັ້ນ ສີສົ້ມ', 30, 1050000, '2021-12-22 06:47:49', '2021-12-22 06:47:49'),
(38, 'EXP00004', '23', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ເສື້ອຍືດ ໂປໂລ', 50, 900000, '2021-12-22 06:48:34', '2021-12-22 06:48:34'),
(39, 'EXP00005', '24', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ສະບູ່ Lux ສີຟ້າ', 50, 150000, '2021-12-22 06:49:07', '2021-12-22 06:49:07'),
(40, 'EXP00006', '25', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ນ້ຳຢາລ້າງຈານ ໄລປ້ອນເອັບ', 20, 300000, '2021-12-22 06:49:46', '2021-12-22 06:49:46'),
(41, 'EXP00007', '26', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ໂສ້ງຍືດ ຜູ້ຊາຍ', 10, 350000, '2021-12-22 06:50:24', '2021-12-22 06:50:24'),
(42, 'EXP00008', '27', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ສະບູ່ແຄ່', 50, 250000, '2021-12-22 06:50:53', '2021-12-22 06:50:53'),
(43, 'EXP00009', '28', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ໂສ້ງຜູ້ຍິງ', 35, 1400000, '2021-12-22 06:51:21', '2021-12-22 06:51:21'),
(44, 'EXP00010', '29', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ສະບູ່ສະໝຸນໄພ', 80, 240000, '2021-12-22 06:51:47', '2021-12-22 06:51:47'),
(45, 'EXP00011', '30', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ນ້ຳຢາລ້າງຈານ ໄດວາ', 60, 900000, '2021-12-22 06:52:21', '2021-12-22 06:52:21'),
(46, 'EXP00012', '31', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ໂສ້ງສັ້ນ ສຸພາບຜູ້ຊາຍ', 40, 1800000, '2021-12-22 06:52:56', '2021-12-22 06:52:56'),
(47, 'INC00013', '27', 'income', 'ສະບູ່ແຄ່', 3, 8000, '2021-12-22 06:55:27', '2021-12-22 06:55:27'),
(48, 'INC00014', '26', 'income', 'ໂສ້ງຍືດ ຜູ້ຊາຍ', 5, 60000, '2021-12-22 06:55:27', '2021-12-22 06:55:27'),
(49, 'INC00015', '24', 'income', 'ສະບູ່ Lux ສີຟ້າ', 2, 5000, '2021-12-22 06:55:27', '2021-12-22 06:55:27'),
(50, 'EXP00016', '32', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ເສື້ອໂປໂລ ສະບາຍ ສະບາຍ', 60, 1800000, '2021-12-22 06:57:19', '2021-12-22 06:57:19'),
(51, 'EXP00017', '33', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ສະບູ່ການົກປກ້ວ', 60, 180000, '2021-12-22 06:58:03', '2021-12-22 06:58:03'),
(52, 'EXP00018', '34', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ເກີບຜ້າໃບ', 60, 2700000, '2021-12-22 06:58:53', '2021-12-22 06:58:53'),
(53, 'EXP00019', '35', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ນ້ຳຢາລ້າງຈານ ຊັນໄລ', 30, 360000, '2021-12-22 06:59:27', '2021-12-22 06:59:27'),
(54, 'EXP00020', '36', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ເຄື່ອງດື່ມ ເປັບຊີ້', 50, 200000, '2021-12-22 07:23:44', '2021-12-22 07:23:44'),
(55, 'EXP00021', '37', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ເກີບຜ້າໃບ 2', 30, 900000, '2021-12-22 07:24:26', '2021-12-22 07:24:26'),
(56, 'INC00022', '37', 'income', 'ເກີບຜ້າໃບ 2', 2, 45000, '2021-12-22 07:24:58', '2021-12-22 07:24:58'),
(57, 'INC00023', '32', 'income', 'ເສື້ອໂປໂລ ສະບາຍ ສະບາຍ', 4, 45000, '2021-12-22 07:24:58', '2021-12-22 07:24:58'),
(58, 'INC00024', '29', 'income', 'ສະບູ່ສະໝຸນໄພ', 1, 6000, '2021-12-22 07:24:58', '2021-12-22 07:24:58'),
(59, 'INC00025', '25', 'income', 'ນ້ຳຢາລ້າງຈານ ໄລປ້ອນເອັບ', 3, 20000, '2021-12-22 07:25:31', '2021-12-22 07:25:31'),
(60, 'INC00026', '22', 'income', 'ໂສ້ງຂາສັ້ນ ສີສົ້ມ', 12, 60000, '2021-12-22 07:25:32', '2021-12-22 07:25:32'),
(61, 'INC00027', '33', 'income', 'ສະບູ່ການົກປກ້ວ', 2, 8000, '2021-12-23 07:28:04', '2021-12-23 07:28:04'),
(62, 'INC00028', '32', 'income', 'ເສື້ອໂປໂລ ສະບາຍ ສະບາຍ', 2, 45000, '2021-12-23 07:28:05', '2021-12-23 07:28:05'),
(63, 'INC00029', '29', 'income', 'ສະບູ່ສະໝຸນໄພ', 3, 6000, '2021-12-23 07:28:05', '2021-12-23 07:28:05'),
(64, 'INC00030', '27', 'income', 'ສະບູ່ແຄ່', 3, 8000, '2021-12-24 07:31:23', '2021-12-24 07:31:23'),
(65, 'INC00031', '22', 'income', 'ໂສ້ງຂາສັ້ນ ສີສົ້ມ', 4, 60000, '2021-12-24 07:31:23', '2021-12-24 07:31:23'),
(66, 'INC00032', '21', 'income', 'ເກີບຜ້າໃບ ຄູ່', 5, 85000, '2021-12-24 07:31:52', '2021-12-24 07:31:52'),
(67, 'INC00033', '25', 'income', 'ນ້ຳຢາລ້າງຈານ ໄລປ້ອນເອັບ', 5, 20000, '2021-12-24 07:31:52', '2021-12-24 07:31:52'),
(68, 'INC00034', '28', 'income', 'ໂສ້ງຜູ້ຍິງ', 7, 60000, '2021-12-24 07:31:52', '2021-12-24 07:31:52'),
(69, 'INC00035', '23', 'income', 'ເສື້ອຍືດ ໂປໂລ', 6, 35000, '2021-12-24 07:31:52', '2021-12-24 07:31:52'),
(70, 'INC00036', '24', 'income', 'ສະບູ່ Lux ສີຟ້າ', 5, 5000, '2021-12-24 07:31:53', '2021-12-24 07:31:53'),
(71, 'INC00037', '33', 'income', 'ສະບູ່ການົກປກ້ວ', 4, 8000, '2021-12-24 07:32:26', '2021-12-24 07:32:26'),
(72, 'INC00038', '31', 'income', 'ໂສ້ງສັ້ນ ສຸພາບຜູ້ຊາຍ', 3, 65000, '2021-12-24 07:32:26', '2021-12-24 07:32:26'),
(73, 'INC00039', '29', 'income', 'ສະບູ່ສະໝຸນໄພ', 5, 6000, '2021-12-24 07:32:26', '2021-12-24 07:32:26'),
(74, 'INC00040', '28', 'income', 'ໂສ້ງຜູ້ຍິງ', 4, 60000, '2021-12-24 07:32:26', '2021-12-24 07:32:26'),
(75, 'INC00041', '27', 'income', 'ສະບູ່ແຄ່', 6, 8000, '2021-12-24 07:32:26', '2021-12-24 07:32:26'),
(76, 'INC00042', '26', 'income', 'ໂສ້ງຍືດ ຜູ້ຊາຍ', 5, 60000, '2021-12-24 07:32:26', '2021-12-24 07:32:26'),
(77, 'INC00043', '32', 'income', 'ເສື້ອໂປໂລ ສະບາຍ ສະບາຍ', 11, 45000, '2021-12-24 07:32:26', '2021-12-24 07:32:26'),
(78, 'INC00044', '34', 'income', 'ເກີບຜ້າໃບ', 8, 65000, '2021-12-24 07:32:26', '2021-12-24 07:32:26'),
(79, 'INC00045', '33', 'income', 'ສະບູ່ການົກປກ້ວ', 7, 8000, '2021-12-22 21:44:31', '2021-12-22 21:44:31'),
(80, 'INC00046', '29', 'income', 'ສະບູ່ສະໝຸນໄພ', 8, 6000, '2021-12-22 21:44:31', '2021-12-22 21:44:31'),
(81, 'INC00047', '30', 'income', 'ນ້ຳຢາລ້າງຈານ ໄດວາ', 5, 25000, '2021-12-22 21:44:31', '2021-12-22 21:44:31'),
(82, 'INC00048', '22', 'income', 'ໂສ້ງຂາສັ້ນ ສີສົ້ມ', 6, 60000, '2021-12-22 21:44:31', '2021-12-22 21:44:31'),
(83, 'INC00049', '21', 'income', 'ເກີບຜ້າໃບ ຄູ່', 12, 85000, '2021-12-22 21:44:31', '2021-12-22 21:44:31'),
(84, 'INC00050', '24', 'income', 'ສະບູ່ Lux ສີຟ້າ', 3, 5000, '2021-12-22 21:44:31', '2021-12-22 21:44:31'),
(85, 'INC00051', '25', 'income', 'ນ້ຳຢາລ້າງຈານ ໄລປ້ອນເອັບ', 4, 20000, '2021-12-22 21:44:31', '2021-12-22 21:44:31'),
(86, 'INC00052', '23', 'income', 'ເສື້ອຍືດ ໂປໂລ', 8, 35000, '2021-12-22 21:44:31', '2021-12-22 21:44:31'),
(87, 'INC00053', '33', 'income', 'ສະບູ່ການົກປກ້ວ', 3, 8000, '2021-12-22 21:46:50', '2021-12-22 21:46:50'),
(88, 'INC00054', '37', 'income', 'ເກີບຜ້າໃບ 2', 3, 45000, '2021-12-22 21:46:50', '2021-12-22 21:46:50'),
(89, 'INC00055', '27', 'income', 'ສະບູ່ແຄ່', 3, 8000, '2021-12-22 21:46:50', '2021-12-22 21:46:50'),
(90, 'INC00056', '29', 'income', 'ສະບູ່ສະໝຸນໄພ', 7, 6000, '2021-12-22 21:46:50', '2021-12-22 21:46:50'),
(91, 'INC00057', '33', 'income', 'ສະບູ່ການົກປກ້ວ', 9, 8000, '2021-12-22 21:47:03', '2021-12-22 21:47:03'),
(92, 'INC00058', '37', 'income', 'ເກີບຜ້າໃບ 2', 6, 45000, '2021-12-22 21:47:03', '2021-12-22 21:47:03'),
(93, 'INC00059', '33', 'income', 'ສະບູ່ການົກປກ້ວ', 5, 8000, '2021-12-22 23:36:36', '2021-12-22 23:36:36'),
(94, 'INC00060', '32', 'income', 'ເສື້ອໂປໂລ ສະບາຍ ສະບາຍ', 10, 45000, '2021-12-22 23:36:36', '2021-12-22 23:36:36'),
(95, 'INC00061', '37', 'income', 'ເກີບຜ້າໃບ 2', 2, 45000, '2021-12-22 23:36:36', '2021-12-22 23:36:36'),
(96, 'INC00062', '29', 'income', 'ສະບູ່ສະໝຸນໄພ', 15, 6000, '2021-12-23 00:31:43', '2021-12-23 00:31:43'),
(97, 'INC00063', '28', 'income', 'ໂສ້ງຜູ້ຍິງ', 4, 60000, '2021-12-23 00:31:43', '2021-12-23 00:31:43'),
(98, 'INC00064', '33', 'income', 'ສະບູ່ການົກປກ້ວ', 10, 8000, '2021-12-23 00:31:43', '2021-12-23 00:31:43'),
(99, 'INC00065', '33', 'income', 'ສະບູ່ການົກປກ້ວ', 1, 8000, '2021-12-23 06:01:37', '2021-12-23 06:01:37'),
(100, 'INC00066', '32', 'income', 'ເສື້ອໂປໂລ ສະບາຍ ສະບາຍ', 1, 45000, '2021-12-23 06:01:37', '2021-12-23 06:01:37'),
(101, 'INC00067', '31', 'income', 'ໂສ້ງສັ້ນ ສຸພາບຜູ້ຊາຍ', 4, 65000, '2021-12-23 06:01:37', '2021-12-23 06:01:37'),
(102, 'EXP00068', '38', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ຢາສະຜົມ Clear', 50, 900000, '2021-12-23 06:11:59', '2021-12-23 06:11:59'),
(103, 'INC00069', '38', 'income', 'ຢາສະຜົມ Clear', 10, 35000, '2021-12-23 06:13:33', '2021-12-23 06:13:33'),
(104, 'INC00070', '34', 'income', 'ເກີບຜ້າໃບ', 11, 65000, '2021-12-23 06:13:33', '2021-12-23 06:13:33'),
(105, 'EXP00071', '39', 'expense', 'ນຳເຂົ້າສິນຄ້າ: ຢາສະຜົນ Herbal', 50, 1750000, '2021-12-23 06:41:40', '2021-12-23 06:41:40'),
(106, 'INC00072', '34', 'income', 'ເກີບຜ້າໃບ', 8, 65000, '2021-12-23 06:42:23', '2021-12-23 06:42:23'),
(107, 'INC00073', '32', 'income', 'ເສື້ອໂປໂລ ສະບາຍ ສະບາຍ', 7, 45000, '2021-12-23 06:42:23', '2021-12-23 06:42:23'),
(108, 'INC00074', '35', 'income', 'ນ້ຳຢາລ້າງຈານ ຊັນໄລ', 6, 18000, '2021-12-23 06:42:23', '2021-12-23 06:42:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'cdsc', 'admin@admin.com', NULL, '$2y$10$dnFy6w0DlNe5ZjAq4X7Y3OGdhBz2O.cUPIvBjT0aeVye03wWk5YhK', NULL, '2021-12-19 08:57:44', '2021-12-19 08:57:44'),
(7, 'dscsdxxxx', 'admin2@admin.com', NULL, '$2y$10$cflQCHEQ/w72e.XdYKi9teI5YvBPVFpa1aoNEcAHhyCLzLG86VU7O', NULL, '2021-12-19 08:58:33', '2021-12-19 08:58:33'),
(8, 'sssss', 'sonexaymail@gmail.com', NULL, '$2y$10$6yeiy8MOUZMCwE8lX690NeHV5RjpxcCixZDvO4JY0ZSVJyAr9qXQ.', NULL, '2021-12-19 08:59:12', '2021-12-19 08:59:12'),
(9, 'wwww', 'ad@mail.com', NULL, '$2y$10$ulXRqM4tAWda0vwo35xOQOJOGP4u1Dress3MT1GjNz6DdXWxGSdoW', NULL, '2021-12-19 09:00:21', '2021-12-19 09:00:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transections`
--
ALTER TABLE `transections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `transections`
--
ALTER TABLE `transections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
