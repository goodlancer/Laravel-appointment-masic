-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 07, 2021 at 03:13 AM
-- Server version: 10.3.27-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `magicqr_core`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `apartment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intercom` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restorant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_index` int(11) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `restorant_id`, `created_at`, `updated_at`, `order_index`, `active`) VALUES
(71, 'Nagerechten', 22, '2020-12-12 14:15:51', '2020-12-12 14:48:04', 0, 0),
(72, 'Hoofdgerechten', 22, '2020-12-12 14:27:04', '2020-12-12 14:48:01', 0, 0),
(73, 'Starters', 22, '2020-12-12 14:48:19', '2020-12-12 14:48:19', 0, 1),
(74, 'Fastfood', 22, '2020-12-12 14:56:07', '2020-12-12 14:56:07', 0, 1),
(75, 'Oriental', 22, '2020-12-12 15:15:17', '2020-12-12 15:15:17', 0, 1),
(76, 'Hoofdgerechten', 22, '2020-12-12 15:27:48', '2020-12-12 15:27:48', 0, 1),
(77, 'Nagerechten', 22, '2020-12-12 15:31:22', '2020-12-12 15:31:22', 0, 1),
(78, 'Gerechten', 27, '2021-01-01 00:10:23', '2021-01-01 00:10:23', 0, 1),
(79, 'Warme dranken', 43, '2021-01-04 10:01:38', '2021-01-04 10:01:38', 0, 1),
(80, 'Dranken', 43, '2021-01-04 10:06:40', '2021-01-04 10:06:40', 0, 1),
(81, 'Zoet', 43, '2021-01-04 10:08:39', '2021-01-04 10:08:39', 0, 1),
(82, 'Home dining menu', 69, '2021-01-06 15:22:38', '2021-01-06 15:22:38', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `created_at`, `updated_at`, `name`, `alias`, `image`, `header_title`, `header_subtitle`, `deleted_at`) VALUES
(1, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'Bronx', 'bx', 'https://foodtiger.mobidonia.com/uploads/settings/177686e2-8597-46e0-bf70-daa8d5ff0085_large.jpg', 'Food Delivery from<br /><strong>Bronx</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(2, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'Brooklyn', 'br', 'https://foodtiger.mobidonia.com/uploads/settings/6d001b6c-2ba1-499e-9f57-09b7dc46ace3_large.jpg', 'Food Delivery from<br /><strong>Brooklyn</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(3, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'Queens', 'qe', 'https://foodtiger.mobidonia.com/uploads/settings/492b78df-1756-4c30-910a-d3923b66aa97_large.jpg', 'Food Delivery from<br /><strong>Queens</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(4, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'Manhattn', 'mh', 'https://foodtiger.mobidonia.com/uploads/settings/01f41f56-1acf-44f0-8e8d-fedceb5267cf_large.jpg', 'Food Delivery from<br /><strong>Manhattn</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(5, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'Richmond', 'ri', 'https://foodtiger.mobidonia.com/uploads/settings/fe6c500b-3410-41ff-9734-94c58351ba60_large.jpg', 'Food Delivery from<br /><strong>Richmond</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(6, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'Buffalo', 'bf', 'https://foodtiger.mobidonia.com/uploads/settings/0c3c8fb0-c252-4758-9699-6851b15796ef_large.jpg', 'Food Delivery from<br /><strong>Buffalo</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(7, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'Rochester', 'rh', 'https://foodtiger.mobidonia.com/uploads/settings/c7f21267-7149-4311-9fd9-4a08904f67a3_large.jpg', 'Food Delivery from<br /><strong>Rochester</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(8, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'Yonkers', 'yo', 'https://foodtiger.mobidonia.com/uploads/settings/8c65269a-3bbc-4899-be13-75d1bc35e9cd_large.jpg', 'Food Delivery from<br /><strong>Yonkers</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(9, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'Syracuse', 'sy', 'https://foodtiger.mobidonia.com/uploads/settings/1e5fcde5-5dc0-4c29-8f49-314658836fb8_large.jpg', 'Food Delivery from<br /><strong>Syracuse</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(10, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'Albany', 'al', 'https://foodtiger.mobidonia.com/uploads/settings/b521e77f-1d3e-4695-b871-bac8262c85dc_large.jpg', 'Food Delivery from<br /><strong>Albany</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(11, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'New Rochelle', 'nr', 'https://foodtiger.mobidonia.com/uploads/settings/8b3ebb83-2e2e-43dd-8747-4f9c6f451199_large.jpg', 'Food Delivery from<br /><strong>New Rochelle</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(12, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'Mount Vernon', 'mv', 'https://foodtiger.mobidonia.com/uploads/settings/daecfb93-677f-43a9-9e7e-4cf109194399_large.jpg', 'Food Delivery from<br /><strong>Mount Vernon</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(13, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'Schenectady', 'sc', 'https://foodtiger.mobidonia.com/uploads/settings/054b7870-27b4-4ec8-941f-8584e2e24f4c_large.jpg', 'Food Delivery from<br /><strong>Schenectady</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(14, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'Utica', 'ut', 'https://foodtiger.mobidonia.com/uploads/settings/507847c5-1896-4ecf-bfe8-9c5f198ce41e_large.jpg', 'Food Delivery from<br /><strong>Utica</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(15, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'White Plains', 'wp', 'https://foodtiger.mobidonia.com/uploads/settings/a8e96a74-dc3a-403c-8fd0-b4528838e98c_large.jpg', 'Food Delivery from<br /><strong>White Plains</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL),
(16, '2020-12-02 09:13:46', '2020-12-02 09:13:46', 'Niagara Falls', 'nf', 'https://foodtiger.mobidonia.com/uploads/settings/99d5b4c3-0bb4-428a-96cf-0e510bc3ab57_large.jpg', 'Food Delivery from<br /><strong>Niagara Falls</strong>’s Best Restaurants', 'The meals you love, delivered with care', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '0 - Fixed, 1 - Percentage',
  `price` double(8,2) NOT NULL,
  `active_from` date NOT NULL,
  `active_to` date NOT NULL,
  `limit_to_num_uses` int(11) NOT NULL,
  `used_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extras`
--

CREATE TABLE `extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `extra_for_all_variants` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extras`
--

INSERT INTO `extras` (`id`, `item_id`, `price`, `name`, `created_at`, `updated_at`, `deleted_at`, `extra_for_all_variants`) VALUES
(498, 363, 12.00, '2 personen extra', '2020-12-12 18:10:06', '2020-12-12 18:10:34', NULL, 1),
(499, 365, 20.00, '2 personen extra', '2020-12-12 18:11:29', '2020-12-12 18:11:29', NULL, 1),
(500, 366, 6.20, '300 gram', '2020-12-12 18:12:20', '2020-12-12 18:12:20', NULL, 1),
(501, 366, 10.20, '400 gram', '2020-12-12 18:12:42', '2020-12-12 18:12:42', NULL, 1),
(502, 366, 2.80, 'Extra portie friet', '2020-12-12 18:13:23', '2020-12-12 18:13:23', NULL, 1),
(503, 369, 32.00, '4 personen extra', '2020-12-12 18:15:02', '2020-12-12 18:15:02', NULL, 1),
(504, 369, 2.80, 'Extra portie friet', '2020-12-12 18:15:26', '2020-12-12 18:15:26', NULL, 1),
(505, 369, 2.80, 'Extra portie groente', '2020-12-12 18:15:47', '2020-12-12 18:15:47', NULL, 1),
(506, 359, 2.80, 'Kaas', '2020-12-12 18:19:35', '2020-12-12 18:19:35', NULL, 0),
(507, 359, 3.20, 'Kaas', '2020-12-12 18:20:10', '2020-12-12 18:20:10', NULL, 0),
(508, 366, 2.80, 'Extra portie groente', '2020-12-12 18:44:38', '2020-12-12 18:44:38', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hours`
--

CREATE TABLE `hours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `0_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `0_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `1_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `1_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `2_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `2_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `3_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `3_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `4_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `4_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `5_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `5_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `6_from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `6_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restorant_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hours`
--

INSERT INTO `hours` (`id`, `created_at`, `updated_at`, `0_from`, `0_to`, `1_from`, `1_to`, `2_from`, `2_to`, `3_from`, `3_to`, `4_from`, `4_to`, `5_from`, `5_to`, `6_from`, `6_to`, `restorant_id`) VALUES
(17, '2020-12-12 12:05:05', '2020-12-19 17:30:38', '15:00', '22:00', '15:00', '22:00', '15:00', '22:00', '15:00', '22:00', '13:00', '22:00', '13:00', '22:00', '13:00', '22:00', 22),
(18, '2021-01-01 00:08:57', '2021-01-01 00:08:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17:00', '00:00', '17:00', '00:00', 27),
(19, '2021-01-04 10:13:55', '2021-01-04 10:13:55', '00:01', '23:59', '00:01', '23:59', '00:01', '23:59', '00:01', '23:59', '00:01', '23:59', '00:01', '23:59', '00:01', '23:59', 43),
(20, '2021-01-06 15:19:34', '2021-01-06 15:19:34', NULL, NULL, NULL, NULL, NULL, NULL, '16:00', '18:30', '16:00', '18:30', '16:00', '18:30', '16:00', '18:30', 69);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(455) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available` int(11) NOT NULL DEFAULT 1,
  `has_variants` int(11) NOT NULL DEFAULT 0,
  `vat` double(8,2) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `image`, `price`, `category_id`, `created_at`, `updated_at`, `available`, `has_variants`, `vat`, `deleted_at`) VALUES
(342, 'Hazelnotenijs', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '933acfa5-5a4f-4db2-a5c0-51b4ae895aa7', 8.90, 71, '2020-12-12 14:20:08', '2020-12-12 14:26:34', 1, 0, NULL, NULL),
(343, 'Blauwe bessen ijs', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '8904d68b-344a-44cc-8bb1-b81b3f6057f9', 7.60, 71, '2020-12-12 14:22:07', '2020-12-12 14:22:07', 1, 0, NULL, NULL),
(344, 'Belgische wafels met halva', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '92ec754d-403c-4447-8e03-f3cc8bf8ea96', 9.60, 71, '2020-12-12 14:23:53', '2020-12-12 14:23:53', 1, 0, NULL, NULL),
(345, 'Profiteroles', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', 'a19920fe-33dc-4673-85df-1aabae006884', 6.90, 71, '2020-12-12 14:25:28', '2020-12-12 14:25:42', 1, 0, NULL, NULL),
(346, 'Biefspies Paris', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '35b8ee74-c423-4b5d-8e29-ee5175d091fe', 16.40, 72, '2020-12-12 14:29:38', '2020-12-12 14:29:38', 1, 0, NULL, NULL),
(347, 'Paella de luxe', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', 'ed1bdbe0-e23e-4448-8dac-75f25858284d', 15.90, 72, '2020-12-12 14:35:21', '2020-12-12 14:35:21', 1, 0, NULL, NULL),
(348, 'Kalfskotelet', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '9e49aa66-0099-48f2-a3f8-4446b7bc771f', 26.90, 72, '2020-12-12 14:36:54', '2020-12-12 14:36:54', 1, 0, NULL, NULL),
(349, 'Varkensrollade', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '76e585a1-2500-4129-9ace-0b1b29203a46', 19.90, 72, '2020-12-12 14:38:01', '2020-12-12 14:38:01', 1, 0, NULL, NULL),
(350, 'Steak New Yorker 220gr', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '0906956b-db62-4fbc-87cd-2bf9c5de4452', 22.60, 72, '2020-12-12 14:39:22', '2020-12-12 14:39:22', 1, 0, NULL, NULL),
(351, 'Chicken Deluxe', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '84cdfc92-564e-47fc-86df-23c788637780', 18.80, 72, '2020-12-12 14:41:10', '2020-12-12 14:41:10', 1, 0, NULL, NULL),
(352, 'Kabeljauwfilet', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', 'fd959404-ce77-4b29-a747-ac79496f3b71', 18.40, 72, '2020-12-12 14:43:30', '2020-12-12 14:43:30', 1, 0, NULL, NULL),
(353, 'Krabburger', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '534b5efb-74d5-46de-9ee1-2ba96571c0e5', 12.80, 72, '2020-12-12 14:46:22', '2020-12-12 14:46:22', 1, 0, NULL, NULL),
(354, 'Yoghurt soep', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '12d7d6bf-6a13-4524-9fe2-4e44959278b6', 8.90, 73, '2020-12-12 14:49:50', '2020-12-12 16:04:32', 1, 0, 6.00, NULL),
(355, 'Bruschetta mediterran', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', 'c7a39b7c-6f4e-482b-88a2-1e519ab2f45b', 6.80, 73, '2020-12-12 14:51:06', '2020-12-12 16:04:43', 1, 0, 6.00, NULL),
(356, 'Kaasplank de luxe', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '4ba0a472-a74b-4515-b1e6-be2744e4efe0', 12.60, 73, '2020-12-12 14:52:39', '2020-12-12 16:04:54', 1, 0, 6.00, NULL),
(357, 'Calamares', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', 'f631d175-ebe2-4a17-9d5c-d35340e2636d', 12.40, 73, '2020-12-12 14:54:07', '2020-12-12 16:05:08', 1, 0, 6.00, NULL),
(358, 'Krabburger', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '8619122a-9b5c-4463-86cf-151e4bd1cd44', 12.60, 74, '2020-12-12 14:57:29', '2020-12-12 16:03:35', 1, 0, 6.00, NULL),
(359, 'Pizza vegetariana', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '92b4aef4-aef5-4007-83ab-15df56753b10', 9.80, 74, '2020-12-12 14:58:43', '2020-12-12 18:20:15', 1, 1, 6.00, NULL),
(360, 'Burrito\'s', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '73a25ea3-7fcc-43ca-814a-499f84f4d4dc', 14.20, 74, '2020-12-12 15:06:52', '2020-12-12 16:04:02', 1, 0, 6.00, NULL),
(361, 'Fried chicken', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '627143de-1376-4cf1-8a3b-32ca527f1e7a', 12.20, 74, '2020-12-12 15:13:15', '2020-12-12 16:04:11', 1, 0, 6.00, NULL),
(362, 'Soto Ayam', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '4f673e90-a5e2-4b45-8030-3e4c6ccad93f', 16.40, 75, '2020-12-12 15:20:12', '2020-12-12 16:02:12', 1, 0, 6.00, NULL),
(363, 'Sushi 2 pers.', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', 'ea65ca2b-e919-4cbc-b272-bf907ea86b26', 14.60, 75, '2020-12-12 15:22:06', '2020-12-12 16:02:55', 1, 0, 6.00, NULL),
(364, 'Oesters', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', 'b6042bf6-0892-4bfa-b87c-f0c306d1f8d9', 24.60, 75, '2020-12-12 15:22:38', '2020-12-12 16:03:14', 1, 0, 6.00, NULL),
(365, 'Sashimi 2 pers.', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '8a15c607-0aff-4516-812d-6d4d5f7b3c9e', 22.60, 75, '2020-12-12 15:27:13', '2020-12-12 16:03:24', 1, 0, 6.00, NULL),
(366, 'Steak New Yorker', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '2574c6d1-fa39-430a-b990-19b0785b3798', 22.60, 76, '2020-12-12 15:28:50', '2020-12-19 19:10:53', 1, 0, 6.00, NULL),
(367, 'Chicken Deluxe', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '7e2d01e3-7d69-49f1-bf2b-c5ae04d7df7e', 18.80, 76, '2020-12-12 15:29:12', '2020-12-12 16:01:24', 1, 0, 6.00, NULL),
(368, 'Kabeljauwfilet', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', 'e39649ee-4c62-4628-abf5-32aca6367c29', 18.60, 76, '2020-12-12 15:29:48', '2020-12-12 16:01:38', 1, 0, 6.00, NULL),
(369, 'Varkensrollade 4 pers.', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '29fa16a9-dde6-4cc6-a39a-748b7c8d037f', 38.40, 76, '2020-12-12 15:30:23', '2020-12-12 16:01:55', 1, 0, 6.00, NULL),
(370, 'Hazelnotenijs', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', 'c4e540f6-0517-481a-b77b-31be647cd287', 8.90, 77, '2020-12-12 15:32:05', '2020-12-12 15:53:33', 1, 0, 6.00, NULL),
(371, 'Bessenijs', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', 'b6ea79d0-3650-47e3-bd2b-4c793442dede', 8.60, 77, '2020-12-12 15:33:43', '2020-12-12 16:00:36', 1, 0, 6.00, NULL),
(372, 'Belgische wafels met halva', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '31b41aac-2c5d-4a25-ba65-b5f4aa21a4ba', 9.40, 77, '2020-12-12 15:34:29', '2020-12-12 16:00:47', 1, 0, 6.00, NULL),
(373, 'Profiteroles', 'De omschrijving van een gerecht speelt voor een groot deel mee in de keuze van jouw gast. Je kunt jouw gasten hierin meer sturen dan je denkt!', '2a9b893c-bb2d-415e-b521-1d00b9581ed9', 6.90, 77, '2020-12-12 15:34:55', '2020-12-12 16:00:58', 1, 0, 6.00, NULL),
(374, 'Nasi kip', 'Nasi met kippenbouten (incl saté saus ,peper en zuur )', '', 7.00, 78, '2021-01-01 00:12:05', '2021-01-01 00:12:05', 1, 0, NULL, NULL),
(375, 'koffie', 'koffie', '', 2.00, 79, '2021-01-04 10:01:48', '2021-01-04 10:01:48', 1, 0, NULL, NULL),
(376, 'espresso', 'espresso', '', 2.00, 79, '2021-01-04 10:02:03', '2021-01-04 10:02:03', 1, 0, NULL, NULL),
(377, 'cappuccino', 'cappuccino', '', 2.50, 79, '2021-01-04 10:02:15', '2021-01-04 10:02:15', 1, 0, NULL, NULL),
(378, 'latte macchiato', 'latte macchiato', '', 2.00, 79, '2021-01-04 10:04:54', '2021-01-04 10:04:54', 1, 0, NULL, NULL),
(379, 'espresso macchiato', 'espresso macchiato', '', 2.00, 79, '2021-01-04 10:05:13', '2021-01-04 10:05:13', 1, 0, NULL, NULL),
(380, 'dubbele espresso', 'dubbele espresso', '', 3.00, 79, '2021-01-04 10:05:43', '2021-01-04 10:05:43', 1, 0, NULL, NULL),
(381, 'warme chocolademelk', 'warme chocolademelk', '', 2.50, 79, '2021-01-04 10:06:18', '2021-01-04 10:06:18', 1, 0, NULL, NULL),
(382, 'cola', 'cola', '', 2.00, 80, '2021-01-04 10:06:52', '2021-01-04 10:06:52', 1, 0, NULL, NULL),
(383, 'fanta', 'fanta', '', 2.00, 80, '2021-01-04 10:07:02', '2021-01-04 10:07:02', 1, 0, NULL, NULL),
(384, 'fuze tea', 'fuze tea', '', 2.00, 80, '2021-01-04 10:07:42', '2021-01-04 10:07:42', 1, 0, NULL, NULL),
(385, 'water', 'water', '', 2.00, 80, '2021-01-04 10:07:57', '2021-01-04 10:07:57', 1, 0, NULL, NULL),
(386, 'chocomel', 'chocomel', '', 2.50, 80, '2021-01-04 10:08:15', '2021-01-04 10:08:15', 1, 0, NULL, NULL),
(387, 'redbull', 'redbull', '', 3.00, 80, '2021-01-04 10:08:28', '2021-01-04 10:08:28', 1, 0, NULL, NULL),
(388, 'reep', 'reep', '', 1.00, 81, '2021-01-04 10:08:56', '2021-01-04 10:08:56', 1, 0, NULL, NULL),
(389, 'muffin', 'muffin', '', 2.50, 81, '2021-01-04 10:09:10', '2021-01-04 10:09:10', 1, 0, NULL, NULL),
(390, 'Home dining menu week 1', 'Home dining menu week 1 \r\n\r\n(Thursday 7 January – Sunday 10 January 2021)\r\n\r\n3 courses 26,00 euro – 4 courses 30,00 euro\r\n\r\n(please order latest before 1pm on the day required)\r\n\r\ncontact via info@lecourage.nl or 0651605863\r\n\r\nno cooking required – reheating advice is on the menu sheet provided\r\n\r\nto start\r\n\r\nI survived 2020 grilled tuna salad Nicoise\r\n\r\nor\r\n\r\nI survived 2020 grilled artichoke salad Nicoise\r\n\r\nin the middle\r\n\r\nI survived 2020 creamy L', 'a57c9bdc-8b54-49b6-bf54-1af4a9155394', 26.00, 82, '2021-01-06 15:27:02', '2021-01-06 15:27:02', 1, 0, NULL, NULL),
(391, 'Home dining menu week 1 4 course', 'Home dining menu week 1 \r\n\r\n(Thursday 7 January – Sunday 10 January 2021)\r\n\r\n3 courses 26,00 euro – 4 courses 30,00 euro\r\n\r\n(please order latest before 1pm on the day required)\r\n\r\ncontact via info@lecourage.nl or 0651605863\r\n\r\nno cooking required – reheating advice is on the menu sheet provided\r\n\r\nto start\r\n\r\nI survived 2020 grilled tuna salad Nicoise\r\n\r\nor\r\n\r\nI survived 2020 grilled artichoke salad Nicoise\r\n\r\nin the middle\r\n\r\nI survived 2020 creamy L', '016beb24-2349-4f88-89fd-13953e18a003', 30.00, 82, '2021-01-06 15:28:22', '2021-01-06 15:28:22', 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `language`, `created_at`, `updated_at`) VALUES
(1, NULL, 'en', '2020-12-02 09:13:42', '2020-12-02 09:13:42');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_08_29_200844_create_languages_table', 1),
(4, '2018_08_29_205156_create_translations_table', 1),
(5, '2019_05_03_000001_create_customer_columns', 1),
(6, '2019_05_03_000002_create_subscriptions_table', 1),
(7, '2020_02_06_010033_create_permission_tables', 1),
(8, '2020_02_06_022212_create_restorants_table', 1),
(9, '2020_02_09_015116_create_status_table', 1),
(10, '2020_02_09_152551_create_categories_table', 1),
(11, '2020_02_09_152656_create_items_table', 1),
(12, '2020_02_11_052117_create_address_table', 1),
(13, '2020_02_11_054259_create_orders_table', 1),
(14, '2020_02_20_094727_create_settings_table', 1),
(15, '2020_03_25_134914_create_pages_table', 1),
(16, '2020_04_03_143518_update_settings_table', 1),
(17, '2020_04_10_202027_create_payments_table', 1),
(18, '2020_04_11_165819_update_table_orders', 1),
(19, '2020_04_22_105556_update_items_table', 1),
(20, '2020_04_23_212320_update_restorants_table', 1),
(21, '2020_04_23_212502_update_orders_table', 1),
(22, '2020_04_28_112519_update_address_table', 1),
(23, '2020_05_07_122727_create_hours_table', 1),
(24, '2020_05_09_012646_update_orders_add_delivery_table', 1),
(25, '2020_05_09_024507_add_options_to_settings_table', 1),
(26, '2020_05_20_232204_create_notifications_table', 1),
(27, '2020_06_03_134258_change_radius_to_delivery_area_restorants_table', 1),
(28, '2020_06_26_131803_create_sms_verifications_table', 1),
(29, '2020_07_12_182829_create_extras_table', 1),
(30, '2020_07_14_155509_create_plan_table', 1),
(31, '2020_07_23_183000_update_restorants_with_featured', 1),
(32, '2020_07_28_131511_update_users_sms_verification', 1),
(33, '2020_07_30_102916_change_json_to_string', 1),
(34, '2020_08_01_014851_create_variants', 1),
(35, '2020_08_14_003718_create_ratings_table', 1),
(36, '2020_08_18_035731_update_table_plans', 1),
(37, '2020_08_18_053012_update_user_add_plan', 1),
(38, '2020_09_02_131604_update_orders_time_to_prepare', 1),
(39, '2020_09_09_080747_create_cities_table', 1),
(40, '2020_09_28_131250_update_item_softdelete', 1),
(41, '2020_10_24_150254_create_tables_table', 1),
(42, '2020_10_25_021321_create_visits_table', 1),
(43, '2020_10_26_004421_update_orders_client_nullable', 1),
(44, '2020_10_26_104351_update_restorant_table', 1),
(45, '2020_10_26_190049_update_plan', 1),
(46, '2020_10_27_180123_create_stripe_payment', 1),
(47, '2020_11_01_190615_update_user_table', 1),
(48, '2020_11_05_081140_create_paths_table', 1),
(49, '2020_11_14_111220_create_phone_in_orders', 2),
(50, '2020_11_17_211252_update_logo_in_settings', 2),
(51, '2020_11_25_182453_create_paypal_payment', 2),
(52, '2020_11_25_225536_update_user_for_paypal_subsc', 2),
(53, '2020_11_27_102829_update_restaurants_for_delivery_pickup', 2),
(54, '2020_11_27_165901_create_coupons_table', 2),
(55, '2020_12_02_192213_update_for_whatsapp_order', 2),
(56, '2020_12_02_195333_update_for_mollie_payment', 2),
(57, '2020_12_10_155335_wp_address', 3),
(58, '2020_12_14_195627_update_for_paystack_sub', 4),
(59, '2020_12_15_130511_update_paystack_verification', 5);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 2),
(2, 'App\\User', 3),
(2, 'App\\User', 4),
(2, 'App\\User', 8),
(2, 'App\\User', 9),
(2, 'App\\User', 13),
(2, 'App\\User', 16),
(2, 'App\\User', 28),
(2, 'App\\User', 29),
(2, 'App\\User', 30),
(2, 'App\\User', 46),
(2, 'App\\User', 47),
(2, 'App\\User', 48),
(2, 'App\\User', 49),
(2, 'App\\User', 50),
(2, 'App\\User', 51),
(2, 'App\\User', 52),
(2, 'App\\User', 53),
(2, 'App\\User', 54),
(2, 'App\\User', 55),
(2, 'App\\User', 56),
(2, 'App\\User', 57),
(2, 'App\\User', 58),
(2, 'App\\User', 59),
(2, 'App\\User', 60),
(2, 'App\\User', 61),
(2, 'App\\User', 62),
(2, 'App\\User', 63),
(2, 'App\\User', 64),
(2, 'App\\User', 65);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `item_id`, `name`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(177, 359, 'Grootte', 'Groot,extra groot', '2020-12-12 18:17:23', '2020-12-12 18:17:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `restorant_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_price` double(8,2) NOT NULL,
  `order_price` double(8,2) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `srtipe_payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` double(8,2) NOT NULL DEFAULT 0.00,
  `fee_value` decimal(5,4) NOT NULL DEFAULT 0.0000,
  `static_fee` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_method` int(11) NOT NULL DEFAULT 1 COMMENT '1- Delivery, 2- Pickup',
  `delivery_pickup_interval` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vatvalue` double(8,2) DEFAULT 0.00,
  `payment_processor_fee` double(8,2) NOT NULL DEFAULT 0.00,
  `time_to_prepare` int(11) DEFAULT NULL,
  `table_id` bigint(20) UNSIGNED DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `address_id`, `client_id`, `restorant_id`, `driver_id`, `delivery_price`, `order_price`, `payment_method`, `payment_status`, `comment`, `lat`, `lng`, `srtipe_payment_id`, `fee`, `fee_value`, `static_fee`, `delivery_method`, `delivery_pickup_interval`, `vatvalue`, `payment_processor_fee`, `time_to_prepare`, `table_id`, `phone`, `whatsapp_address`) VALUES
(608, '2020-12-12 16:12:54', '2020-12-12 16:13:14', NULL, NULL, 22, NULL, 0.00, 47.80, 'mollie', 'paid', 'Graag extra saus erbij', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 2, '1050_1080', 2.87, 0.00, NULL, NULL, '0877 847450', NULL),
(609, '2020-12-17 18:57:20', '2020-12-17 18:57:27', NULL, NULL, 22, NULL, 0.00, 38.40, 'mollie', 'paid', 'Test order.', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 2, '1200_1230', 2.30, 0.00, NULL, NULL, '0877 847450', NULL),
(610, '2020-12-17 18:59:58', '2020-12-17 19:21:00', NULL, NULL, 22, NULL, 0.00, 45.80, 'mollie', 'paid', 'Test bestelling', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 2, '1200_1230', 2.75, 0.00, 30, NULL, '0877 847450', NULL),
(611, '2020-12-19 18:26:24', '2020-12-19 18:26:24', NULL, NULL, 22, NULL, 0.00, 15.70, 'mollie', 'unpaid', 'Test', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 2, '1170_1200', 0.94, 0.00, NULL, NULL, '12345678', NULL),
(612, '2020-12-26 16:36:38', '2020-12-26 16:36:38', NULL, NULL, 22, NULL, 0.00, 31.80, 'mollie', 'unpaid', 'Geen', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 2, '1080_1110', 1.91, 0.00, NULL, NULL, '12345678', NULL),
(613, '2020-12-29 06:56:28', '2020-12-29 06:56:29', NULL, NULL, 22, NULL, 0.00, 25.30, 'mollie', 'unpaid', '', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 3, '930_960', 1.52, 0.00, NULL, 244, NULL, NULL),
(614, '2020-12-29 09:02:12', '2020-12-29 09:02:12', NULL, NULL, 22, NULL, 0.00, 12.80, 'mollie', 'unpaid', '', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 3, '930_960', 0.77, 0.00, NULL, 245, NULL, NULL),
(615, '2021-01-01 12:51:19', '2021-01-01 12:51:20', NULL, NULL, 22, NULL, 0.00, 50.90, 'mollie', 'unpaid', 'Menu met qr link met tafelnummer zodat tafel niet hoeft worden ingegeven maar read only veld is.\r\n\r\nLeuke handige website', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 3, '840_870', 3.83, 0.00, NULL, 245, NULL, NULL),
(616, '2021-01-04 12:15:57', '2021-01-04 12:16:22', NULL, NULL, 43, NULL, 0.00, 2.00, 'mollie', 'paid', '', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 2, '810_840', 0.00, 0.00, NULL, NULL, '0657319404', NULL),
(617, '2021-01-04 12:42:32', '2021-01-04 12:42:50', NULL, NULL, 43, NULL, 0.00, 2.50, 'mollie', 'paid', 'Conjo', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 2, '840_870', 0.00, 0.00, NULL, NULL, '0621110344', NULL),
(618, '2021-01-05 08:55:27', '2021-01-05 08:55:27', NULL, NULL, 22, NULL, 0.00, 8.90, 'mollie', 'unpaid', 'None', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 2, '930_960', 0.53, 0.00, NULL, NULL, '123456789', NULL),
(619, '2021-01-05 09:18:35', '2021-01-05 09:18:53', NULL, NULL, 43, NULL, 0.00, 4.00, 'mollie', 'paid', 'Hoi thanks', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 2, '630_660', 0.00, 0.00, NULL, NULL, '657372590', NULL),
(620, '2021-01-05 10:45:14', '2021-01-05 10:45:41', NULL, NULL, 43, NULL, 0.00, 2.50, 'mollie', 'paid', '', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 2, '720_750', 0.00, 0.00, NULL, NULL, '0611762509', NULL),
(621, '2021-01-05 11:35:38', '2021-01-05 11:36:02', NULL, NULL, 43, NULL, 0.00, 2.00, 'mollie', 'paid', '', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 2, '780_810', 0.00, 0.00, NULL, NULL, '657372590', NULL),
(622, '2021-01-06 09:07:46', '2021-01-06 09:08:03', NULL, NULL, 43, NULL, 0.00, 2.00, 'mollie', 'paid', '', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 2, '630_660', 0.00, 0.00, NULL, NULL, '657372590', NULL),
(623, '2021-01-06 10:29:59', '2021-01-06 10:30:22', NULL, NULL, 43, NULL, 0.00, 4.00, 'mollie', 'paid', '', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 2, '690_720', 0.00, 0.00, NULL, NULL, '657372590', NULL),
(624, '2021-01-06 10:54:19', '2021-01-06 10:54:41', NULL, NULL, 43, NULL, 0.00, 4.00, 'mollie', 'paid', 'Heb ze al', NULL, NULL, NULL, 0.00, 0.0000, 0.00, 2, '720_750', 0.00, 0.00, NULL, NULL, '0647152849', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_has_items`
--

CREATE TABLE `order_has_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `extras` varchar(800) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `vat` double(8,2) DEFAULT 0.00,
  `vatvalue` double(8,2) DEFAULT 0.00,
  `variant_price` double(8,2) DEFAULT NULL,
  `variant_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_has_items`
--

INSERT INTO `order_has_items` (`id`, `created_at`, `updated_at`, `order_id`, `item_id`, `qty`, `extras`, `vat`, `vatvalue`, `variant_price`, `variant_name`) VALUES
(11, NULL, NULL, 608, 355, 1, '[]', 6.00, 0.41, 6.80, ''),
(12, NULL, NULL, 608, 358, 1, '[]', 6.00, 0.76, 12.60, ''),
(13, NULL, NULL, 608, 360, 2, '[]', 6.00, 1.70, 14.20, ''),
(14, NULL, NULL, 609, 355, 2, '[]', 6.00, 0.82, 6.80, ''),
(15, NULL, NULL, 609, 357, 2, '[]', 6.00, 1.49, 12.40, ''),
(16, NULL, NULL, 610, 358, 1, '[]', 6.00, 0.76, 12.60, ''),
(17, NULL, NULL, 610, 364, 1, '[]', 6.00, 1.48, 24.60, ''),
(18, NULL, NULL, 610, 371, 1, '[]', 6.00, 0.52, 8.60, ''),
(19, NULL, NULL, 611, 355, 1, '[]', 6.00, 0.41, 6.80, ''),
(20, NULL, NULL, 611, 370, 1, '[]', 6.00, 0.53, 8.90, ''),
(21, NULL, NULL, 612, 356, 1, '[]', 6.00, 0.76, 12.60, ''),
(22, NULL, NULL, 612, 359, 1, '[\"Kaas + \\u20ac3,20\"]', 6.00, 1.15, 16.00, 'extra-groot'),
(23, NULL, NULL, 613, 370, 1, '[]', 6.00, 0.53, 8.90, ''),
(24, NULL, NULL, 613, 362, 1, '[]', 6.00, 0.98, 16.40, ''),
(25, NULL, NULL, 614, 359, 1, '[]', 6.00, 0.77, 12.80, 'groot'),
(26, NULL, NULL, 615, 356, 1, '[]', 6.00, 0.76, 12.60, ''),
(27, NULL, NULL, 615, 359, 1, '[\"Kaas + \\u20ac3,20\"]', 6.00, 1.15, 16.00, 'extra-groot'),
(28, NULL, NULL, 615, 361, 1, '[]', 6.00, 0.96, 16.00, 'extra-groot'),
(29, NULL, NULL, 615, 373, 1, '[]', 6.00, 0.96, 16.00, 'extra-groot'),
(30, NULL, NULL, 616, 375, 1, '[]', NULL, 0.00, 2.00, ''),
(31, NULL, NULL, 617, 386, 1, '[]', NULL, 0.00, 2.50, ''),
(32, NULL, NULL, 618, 354, 1, '[]', 6.00, 0.53, 8.90, ''),
(33, NULL, NULL, 619, 378, 2, '[]', NULL, 0.00, 2.00, ''),
(34, NULL, NULL, 620, 377, 1, '[]', NULL, 0.00, 2.50, ''),
(35, NULL, NULL, 621, 378, 1, '[]', NULL, 0.00, 2.00, ''),
(36, NULL, NULL, 622, 378, 1, '[]', NULL, 0.00, 2.00, ''),
(37, NULL, NULL, 623, 378, 1, '[]', NULL, 0.00, 2.00, ''),
(38, NULL, NULL, 623, 378, 1, '[]', NULL, 0.00, 2.00, ''),
(39, NULL, NULL, 624, 375, 2, '[]', NULL, 0.00, 2.00, '');

-- --------------------------------------------------------

--
-- Table structure for table `order_has_status`
--

CREATE TABLE `order_has_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_has_status`
--

INSERT INTO `order_has_status` (`id`, `created_at`, `updated_at`, `order_id`, `status_id`, `user_id`, `comment`) VALUES
(15, '2020-12-12 16:12:55', NULL, 608, 1, 8, 'Local ordering'),
(16, '2020-12-17 18:57:20', NULL, 609, 1, 8, 'Local ordering'),
(17, '2020-12-17 18:59:58', NULL, 610, 1, 8, 'Local ordering'),
(18, '2020-12-17 19:21:00', NULL, 610, 3, 8, ''),
(19, '2020-12-17 19:21:20', NULL, 610, 5, 8, ''),
(20, '2020-12-17 19:21:30', NULL, 610, 7, 8, ''),
(21, '2020-12-17 19:21:36', NULL, 610, 11, 8, ''),
(22, '2020-12-19 18:26:24', NULL, 611, 1, 8, 'Local ordering'),
(23, '2020-12-19 19:10:12', NULL, 611, 9, 8, ''),
(24, '2020-12-26 16:36:38', NULL, 612, 1, 8, 'Local ordering'),
(25, '2020-12-29 06:56:29', NULL, 613, 1, 8, 'Local ordering'),
(26, '2020-12-29 09:02:12', NULL, 614, 1, 8, 'Local ordering'),
(27, '2021-01-01 12:51:20', NULL, 615, 1, 8, 'Local ordering'),
(28, '2021-01-04 12:15:58', NULL, 616, 1, 29, 'Local ordering'),
(29, '2021-01-04 12:42:32', NULL, 617, 1, 29, 'Local ordering'),
(30, '2021-01-05 08:55:27', NULL, 618, 1, 8, 'Local ordering'),
(31, '2021-01-05 09:18:35', NULL, 619, 1, 29, 'Local ordering'),
(32, '2021-01-05 10:45:14', NULL, 620, 1, 29, 'Local ordering'),
(33, '2021-01-05 11:35:38', NULL, 621, 1, 29, 'Local ordering'),
(34, '2021-01-06 09:07:47', NULL, 622, 1, 29, 'Local ordering'),
(35, '2021-01-06 10:29:59', NULL, 623, 1, 29, 'Local ordering'),
(36, '2021-01-06 10:54:19', NULL, 624, 1, 29, 'Local ordering');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `showAsLink` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `created_at`, `updated_at`, `title`, `content`, `showAsLink`) VALUES
(2, '2020-12-02 09:13:46', '2021-01-05 08:57:22', 'How it works', '<p>foodtiger is simple and easy way to order food online. Enjoy the variety of choices and cuisines which could be delivered to your home or office.</p>\n\n                        <p>&nbsp;</p>\n\n                        <p><strong>Here is how foodtiger works:</strong><br />\n                        &nbsp;</p>\n\n                        <p>&nbsp;</p>\n\n                        <p><strong>Find a restaurant:</strong></p>\n\n                        <p>Enter you address or choose from the map on the front page to set your location. Take a review on the restaurants which deliver to your address. Choose a restaurant and dive in its tasty menu.</p>\n\n                        <p>&nbsp;</p>\n\n                        <p><strong>Choose a dish:</strong></p>\n\n                        <p>Choose from the displayed dishes. If there is an option to add products or sauce, for pizza for example, you will be asked for your choice right after you click on the dish. Your order will be dispayed on the right side of the page.</p>\n\n                        <p>&nbsp;</p>\n\n                        <p><strong>Finish your order and choose type of payment:</strong></p>\n\n                        <p>When you complete the order with delicious food, click &quot;Buy&quot;. Now you only have to write your address and choose type of payment as you follow the instructions on the page.</p>\n\n                        <p>&nbsp;</p>\n\n                        <p><strong>Delivery:</strong></p>\n\n                        <p>You will receive SMS as confirmation for your order and information about the delivery time and.....</p>\n\n                        <p>That&#39;s all!</p>\n\n                        <p>&nbsp;</p>', 0),
(3, '2020-12-02 09:13:46', '2020-12-03 22:40:35', 'Partner with us', '<p>You have a great restaurant and deliver the most delicious food in your city?<br />\n                        You want the customers of foodtiger&nbsp;to be satisfied by your offers and discounts?</p>\n\n                        <p><strong>foodtiger always looks for new friends!</strong></p>\n                        <p><a class=\"btn typeform-share button\" href=\"https://danieldimov.typeform.com/to/rmbOMG\" data-mode=\"popup\"><strong>REGISTER NOW</strong></a>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('baileyv034@gmail.com', '$2y$10$hhKZbNHgHR5e.PDSkgwSL.netsr/QER6HMnY8FflBk1ON/I0.dSGG', '2020-12-31 04:35:14'),
('r.oralee@yahoo.com', '$2y$10$BcRckK5TZwrAUieTP2jjluCSyITJ4yfRRVASKToavY215WZOJQY4K', '2020-12-31 19:10:43'),
('golbornevicky@yahoo.com', '$2y$10$U8EdCNQRl2681rGy7SCrUulksc4a52Pnh22/y8j3883EOomqYwqKa', '2021-01-01 01:54:48'),
('dannbran2579@yahoo.com', '$2y$10$eycUgWadlulucsBPuhSMFOrkYgLX4/n82B9ampdkRLDk4gunk/OG2', '2021-01-01 07:14:50'),
('info@eetmzian.nl', '$2y$10$rxhjH0bSQKcDujRb4h9UyOnIHXHMu8md.WPvkxzobWD3CrBX6/Ozm', '2021-01-01 10:33:57'),
('lillybug217@gmail.com', '$2y$10$ig7zyWwNSCK1HHysb/9CL.JaeCgFB70YY5U4eTV4lcebdBEeofN9S', '2021-01-01 10:40:50'),
('susan.ford@att.net', '$2y$10$e9YNS3ia1vWhYttJt/zPSOLtOOeimd2325SLsZUq2x4D1GPDkHemq', '2021-01-01 13:45:55'),
('welsby_dallas@yahoo.com', '$2y$10$Nox6q4qPnrHqUlhzIgdU6ut9hS91yDJ/.679qlJMn3o3R6om4Rbu.', '2021-01-02 04:15:51'),
('littlebitabling.etsy@gmail.com', '$2y$10$.4Oqg57HR8zt0VdDlgZuIOjs24FLV8iLo7dbVhwQBbSg/Zy96PiDK', '2021-01-02 12:43:12'),
('skan66junk@comcast.net', '$2y$10$7tcD1FoBpqOhdxsRbg9XpuYEJl.zGziE5jb3LucpnB83Bcv0XNFoe', '2021-01-02 13:15:11'),
('adrianna_busst@yahoo.com', '$2y$10$2NJoSyy07s1pUQpg5clxjeTIH.FR5/nUbdUzvfCdAVwM6hZH3LLGi', '2021-01-02 13:49:33'),
('donnamarielombardi@gmail.com', '$2y$10$dg50sdrSYpCyFwKcPTB9KuzNstAiUv/6Gv.r9bf3sTvTzbt1FpzXK', '2021-01-02 21:37:45'),
('ellenelke76@yahoo.com', '$2y$10$ZasuVolOrQK007IdsG40TepTZ6m1MTZHIbfI2GPS4pgod.g0oelNa', '2021-01-03 04:19:53'),
('christina_radeff@hotmail.com', '$2y$10$a2PHdb9xvVtwchWp5rm.WOWIpRHUKc75HPWXvXvMrKGIaowFs7zbO', '2021-01-04 16:57:56'),
('asif2723@gmail.com', '$2y$10$uY6kwAMhbpMWvQiprvZCUOlVqq9GdiC0wZ98BdXWpES/OBM5A1PGG', '2021-01-04 17:14:45'),
('voisind@bellsouth.net', '$2y$10$e44XPhIIpBCL7GdznSrH0uPSS7khLBe3Dnkb0mIfwekIjGIDUtp02', '2021-01-04 18:01:37'),
('feliciaj_2000@yahoo.com', '$2y$10$.XSEq.hPqoEAPz55PhcfWuyqHm9NaV9Kqn5SgJmCe2Zvz47xOmxze', '2021-01-04 20:31:21'),
('olds.hunter@gmail.com', '$2y$10$mcy5KWTEidHKeU2jt2jZTuijNGvpiAHKNt7gdeLONhEX/CJ0t4Gsm', '2021-01-05 00:39:17'),
('jonell.marthwaite@yahoo.com', '$2y$10$hh3k3whiF42ZKueY.n/8DOsYddVS1i5YYDhgRt2rn1cUcDoXa/JFC', '2021-01-05 08:36:30'),
('suewink02@aol.com', '$2y$10$eYlvg68/ow8YPjWec.1l1eoheCqeslpaqi.Gok6YwAN8u9n3XrTES', '2021-01-05 11:51:03'),
('jen_eisenhard@hotmail.com', '$2y$10$wMIwb5dRlLGGRG2aW5vN/OfA0qYJ5pCunrkXjwCAW.eXArIPq2NUW', '2021-01-05 15:20:12'),
('bryan.cully@chrobinson.com', '$2y$10$IeLg.TV1sIRddEeyoQQmXOHu224XtwmsTLGQcEfEczIm4leMqajeS', '2021-01-05 15:22:55'),
('kurts1234@aim.com', '$2y$10$Sw27oNltNgRCkyz2Y9uaDOTvFlfCJxca6LjThl3vSs7/PXTyNC0BK', '2021-01-05 15:35:15'),
('sexauerr@aol.com', '$2y$10$UCiDYT4jw94uIJvHWUWNSeWh.WFwLZ/UjKtVTjOBEsyVDw.sasmrS', '2021-01-05 16:56:40'),
('kso343@yahoo.com', '$2y$10$5as92ZuKnHlvvO1.J07Inehge9YODwNsUMqNscFPGzYzMIsQnyMoq', '2021-01-05 18:14:51'),
('katherine.mcguire32@gmail.com', '$2y$10$shbi.wjpEvJkJnL35v3vS./gGasX9d.ovXok5p2oPPn4nxnzchaQm', '2021-01-05 18:49:29'),
('f.leonardo@verizon.net', '$2y$10$uYX225825x0enQOn9.JM5.RHqYTF47VWQPQz/bzRuAxcBRLhy4nu2', '2021-01-05 20:12:00'),
('mattbluechipsales@gmail.com', '$2y$10$TLTz/8rp59lGIBy5SuBMEO8fXI2Azz7j7h1yDqB9pvwQQXKzBW16W', '2021-01-05 23:01:39'),
('atomicangel97@yahoo.com', '$2y$10$bl48Qc5EEnulPlJJN2o1QOTIY3ZL1zbYZvbZs97y7QHksHFnLhXMG', '2021-01-06 02:16:21'),
('mikey2blu@aol.com', '$2y$10$qTaTcMwCEY9nMF6qZ7zqWesqNh.xVGrUcOf/hPxuwSi6MC/93.Wj2', '2021-01-06 04:31:42'),
('nyanruey@me.com', '$2y$10$JEVh5ROdjQL/uxkhnUQQ..ByvFIWc7b5g5pihV.YC2EHIaRqins9m', '2021-01-06 05:45:19'),
('kindredspirits1317@yahoo.com', '$2y$10$XCpqnbupbD.qAIjc1ld2WOCDhvmW3QQv.cquBhrdu62KViw6qAv6y', '2021-01-06 07:51:02'),
('mcleaneverett@yahoo.com', '$2y$10$NriKH2JmwEyA2MMa6kpBBOqRWnl7ao/tZXMYLVM2J.ZPApCV63FOm', '2021-01-06 07:51:25'),
('feldhouse@embarqmail.com', '$2y$10$bemM7u/tr3O4RZO2A8xyS.yHp5kvHRItYsS9C54zxP.xc.Vdibvay', '2021-01-06 15:33:09'),
('joojb@yahoo.com', '$2y$10$2LhAWHPe/K.slncoKTgu3.2cKoVQX8jOWyaEpXM2ofXRv/.IXOM52', '2021-01-06 15:33:54'),
('aewalker012@aim.com', '$2y$10$ilbE7n6AUaaaqoXNEcYlY.muSZwMsmy.WhK/4xjNwDR.YNNvqndpu', '2021-01-06 16:52:12'),
('jjimenez15@bellsouth.net', '$2y$10$NSujWJQUGL3FbKVjfjLPMeNIAxxD52lOa8pjrS3Hfm4Q2Wix9JqD6', '2021-01-06 17:29:43'),
('mclownsbery@yahoo.com', '$2y$10$OVXab.7ytXyvX9suPQP20ut40/v6ty8Ii0/VBjeZeU4ADGrWecofW', '2021-01-06 17:50:00'),
('cbenn33011@aol.com', '$2y$10$cHZDGPMUi83aLsKy6wCQr.lSVUViaMTgurjdURYUZI33AtYttzr7u', '2021-01-06 17:51:25'),
('vivsuarez@sbcglobal.net', '$2y$10$yEi/k1ijxeApE0BBRhGgQ.CKw1LvMHTZA03RaiyRTapciQTre2QK.', '2021-01-06 19:23:06'),
('freakycat606@yahoo.com', '$2y$10$S/Mv3k115ekl5lUwNSDbDu8y78ksl9CeWisdtUZ3OQ32iTqTryHBO', '2021-01-06 19:51:48'),
('vdotson2014@gmail.com', '$2y$10$mhsxzpO77ZpEh/yAKh67JuRWGvw2IiE0fzT4NSor8ELp0/NY15t5u', '2021-01-07 00:44:31'),
('askmeout@att.net', '$2y$10$ET7/0QV0t7Lpwf3poUUalOAFVV/0zEZp0bs9iitFJP6LnpvXUNFcu', '2021-01-07 01:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `paths`
--

CREATE TABLE `paths` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manage restorants', 'web', '2020-12-02 09:13:46', '2020-12-02 09:13:46'),
(2, 'manage drivers', 'web', '2020-12-02 09:13:46', '2020-12-02 09:13:46'),
(3, 'manage orders', 'web', '2020-12-02 09:13:46', '2020-12-02 09:13:46'),
(4, 'edit settings', 'web', '2020-12-02 09:13:46', '2020-12-02 09:13:46'),
(5, 'view orders', 'web', '2020-12-02 09:13:46', '2020-12-02 09:13:46'),
(6, 'edit restorant', 'web', '2020-12-02 09:13:46', '2020-12-02 09:13:46'),
(7, 'edit orders', 'web', '2020-12-02 09:13:46', '2020-12-02 09:13:46'),
(8, 'access backedn', 'web', '2020-12-02 09:13:46', '2020-12-02 09:13:46');

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit_items` int(11) NOT NULL DEFAULT 0 COMMENT '0 is unlimited',
  `limit_orders` int(11) NOT NULL DEFAULT 0 COMMENT '0 is unlimited',
  `price` double(8,2) NOT NULL,
  `period` int(11) NOT NULL DEFAULT 1 COMMENT '1 - monthly, 2-anually',
  `paddle_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `description` varchar(555) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `features` varchar(555) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `limit_views` int(11) NOT NULL DEFAULT 0 COMMENT '0 is unlimited',
  `enable_ordering` int(11) NOT NULL DEFAULT 1,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mollie_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`id`, `name`, `limit_items`, `limit_orders`, `price`, `period`, `paddle_id`, `created_at`, `updated_at`, `deleted_at`, `description`, `features`, `limit_views`, `enable_ordering`, `stripe_id`, `paypal_id`, `mollie_id`, `paystack_id`) VALUES
(1, 'Lockdown take away', 0, 0, 0.00, 1, '', '2020-12-02 09:14:02', '2020-12-06 11:59:49', NULL, 'Gratis account voor iedere horecaondernemer tijdens de lockdown periode', 'Onbeperkt menu categorieën, Onbeperkt menu items, QR menu, Online bestellingen ontvangen, Gasten kunnen afrekenen met iDEAL en Creditcard', 0, 1, 'price_1HvLs3EpNILNhltmdEfqEovK', '', '', NULL),
(2, 'Fast food', 20, 0, 12.00, 1, '', '2020-12-02 09:14:02', '2020-12-06 12:04:09', NULL, 'Ideale oplossing voor cafetaria\'s, eethuizen, pizzeria\'s etc.', 'Onbeperkt menu categorieën, 20 menu items, QR menu, Online bestellingen ontvangen, Gasten kunnen afrekenen met iDEAL', 0, 1, 'price_1HvLxiEpNILNhltmg5NOqFdR', '', '', NULL),
(3, 'Pro', 0, 0, 49.00, 1, '', '2020-12-02 09:14:02', '2020-12-05 20:18:23', '2020-12-05 20:18:23', 'Accept orders direclty from your customer mobile phone', 'Accept Orders, Manage order, Full access to QR tool, Access to the menu creation tool, Unlimited views, Unlimited items in the menu, Dedicated Support', 0, 1, '', NULL, NULL, NULL),
(4, 'Fine dine and wine', 0, 0, 24.00, 1, '', '2020-12-06 11:38:32', '2020-12-06 12:05:53', NULL, 'Meest complete oplossing voor de grotere horecazaken na de lock down periode', 'Onbeperkt menu categorieën, Onbeperkt menu items, QR menu, Online bestellingen ontvangen, Gasten kunnen afrekenen met iDEAL en Creditcard', 0, 1, 'price_1HvLziEpNILNhltmqDVwJwYk', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `rateable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rateable_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restoareas`
--

CREATE TABLE `restoareas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restoareas`
--

INSERT INTO `restoareas` (`id`, `name`, `restaurant_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(35, 'Terras', 22, '2020-12-12 15:56:34', '2020-12-12 15:56:34', NULL),
(36, 'Boven', 22, '2020-12-12 15:56:43', '2020-12-12 15:56:43', NULL),
(37, 'Beneden', 22, '2020-12-12 15:56:53', '2020-12-12 15:56:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restorants`
--

CREATE TABLE `restorants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subdomain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `lat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fee` double(8,2) NOT NULL DEFAULT 0.00,
  `static_fee` double(8,2) NOT NULL DEFAULT 0.00,
  `radius` varchar(800) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `city_id` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `can_pickup` int(11) NOT NULL DEFAULT 1,
  `can_deliver` int(11) NOT NULL DEFAULT 1,
  `self_deliver` int(11) NOT NULL DEFAULT 0,
  `free_deliver` int(11) NOT NULL DEFAULT 0,
  `whatsapp_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restorants`
--

INSERT INTO `restorants` (`id`, `created_at`, `updated_at`, `name`, `subdomain`, `logo`, `cover`, `active`, `user_id`, `lat`, `lng`, `address`, `phone`, `minimum`, `description`, `fee`, `static_fee`, `radius`, `is_featured`, `city_id`, `views`, `can_pickup`, `can_deliver`, `self_deliver`, `free_deliver`, `whatsapp_phone`) VALUES
(22, '2020-12-12 11:50:29', '2021-01-06 15:35:44', 'Magic Restaurant', 'magicrestaurant', '', '', 1, 8, '51.441779179211274', '5.483098079021693', 'Dommelstraat 2, 5611 CK Eindhoven', '0877 847450', '0', 'Dit is een demo restaurant. Test gerust alle mogelijkheden maar doe geen betalingen.', 0.00, 0.00, '{}', 0, NULL, 186, 0, 0, 0, 0, NULL),
(23, '2020-12-28 21:58:20', '2020-12-30 13:12:10', 'Joudy Alnaji', 'joudyalnaji', '', '', 1, 9, '51.4896', '5.4691', '', '+31 6 38 13 91 23', '0', '', 0.00, 0.00, '{}', 0, NULL, 1, 1, 1, 0, 0, NULL),
(27, '2021-01-01 00:02:50', '2021-01-04 20:41:49', 'Ivy’s kitchen', 'ivyskitchen', '', '', 1, 13, '52.37510059333046', '4.885563305028491', '', '0640741529', '0', '', 0.00, 0.00, '{}', 0, NULL, 6, 1, 1, 0, 0, NULL),
(30, '2021-01-01 10:33:13', '2021-01-03 22:39:54', 'Eet Mzian', 'eetmzian', '', '', 1, 16, '51.4896', '5.4691', '', '0627261328', '0', '', 0.00, 0.00, '{}', 0, NULL, 5, 1, 1, 0, 0, NULL),
(42, '2021-01-03 20:33:16', '2021-01-03 23:14:55', 'Grandcafé GewoonDO', 'grandcafgewoondo', '', '', 1, 28, '51.4896', '5.4691', '', '0031655581320', '0', '', 0.00, 0.00, '{}', 0, NULL, 3, 1, 1, 0, 0, NULL),
(43, '2021-01-04 10:00:16', '2021-01-06 10:53:32', 'Mowgli\'s food', 'mowglisfood', '', '', 1, 29, '52.38872600000001', '4.6687408', '', '0613158886', '0', '', 0.00, 0.00, '{}', 0, NULL, 20, 1, 1, 0, 0, NULL),
(44, '2021-01-04 11:34:25', '2021-01-06 13:20:48', 'Rayla Cook', 'raylacook', '', '', 1, 30, '51.4896', '5.4691', '', '0628308295', '0', '', 0.00, 0.00, '{}', 0, NULL, 5, 1, 1, 0, 0, NULL),
(60, '2021-01-05 20:11:19', '2021-01-05 20:11:19', 'DfQOPFwn', 'dfqopfwn', '', '', 1, 46, '0', '0', '', '3051856469', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(61, '2021-01-05 23:01:16', '2021-01-05 23:01:16', 'fdFMPnohgDYwupx', 'fdfmpnohgdywupx', '', '', 1, 47, '0', '0', '', '9638865374', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(62, '2021-01-06 02:15:56', '2021-01-06 02:15:56', 'QJfWtFhSrMwA', 'qjfwtfhsrmwa', '', '', 1, 48, '0', '0', '', '6596995211', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(63, '2021-01-06 02:43:54', '2021-01-06 02:43:54', 'shdqGZTfn', 'shdqgztfn', '', '', 1, 49, '0', '0', '', '7261079554', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(64, '2021-01-06 04:31:02', '2021-01-06 04:31:02', 'bdASKicEPJ', 'bdaskicepj', '', '', 1, 50, '0', '0', '', '3613648312', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(65, '2021-01-06 05:45:05', '2021-01-06 05:45:05', 'tLreRwEocXkZyVM', 'tlrerweocxkzyvm', '', '', 1, 51, '0', '0', '', '5071230751', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(66, '2021-01-06 07:50:10', '2021-01-06 07:50:10', 'rAyFnqBZ', 'rayfnqbz', '', '', 1, 52, '0', '0', '', '6260836313', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(67, '2021-01-06 07:50:17', '2021-01-06 07:50:17', 'PYwJRXlaZoVU', 'pywjrxlazovu', '', '', 1, 53, '0', '0', '', '9878311757', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(68, '2021-01-06 08:58:25', '2021-01-06 08:58:25', 'GzNmExyqXBJbiP', 'gznmexyqxbjbip', '', '', 1, 54, '0', '0', '', '8241675460', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(69, '2021-01-06 15:07:03', '2021-01-06 15:37:34', 'Restaurant le courage', 'restaurantlecourage', '345d1e70-f25e-4bfa-b266-d6a4dc65536e', 'c8f77562-6b4b-403b-b942-5ec5524d1b5d', 1, 55, '50.848270792241514', '5.698194536729604', 'Rechtstraat 81, 6221eh, maastricht', '0651605863', '1', 'French modern dining', 0.00, 0.00, '{}', 0, NULL, 2, 0, 0, 0, 0, NULL),
(70, '2021-01-06 15:31:56', '2021-01-06 15:31:56', 'YlBFinSTIrNDstO', 'ylbfinstirndsto', '', '', 1, 56, '0', '0', '', '6177591374', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(71, '2021-01-06 15:33:31', '2021-01-06 15:33:31', 'TfskiMqO', 'tfskimqo', '', '', 1, 57, '0', '0', '', '8403642121', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(72, '2021-01-06 16:02:03', '2021-01-06 16:02:03', 'TzpimcqwvDoLXAR', 'tzpimcqwvdolxar', '', '', 1, 58, '0', '0', '', '6432528555', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(73, '2021-01-06 16:50:02', '2021-01-06 16:50:02', 'BrNDCagVlPvT', 'brndcagvlpvt', '', '', 1, 59, '0', '0', '', '8359646490', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(74, '2021-01-06 17:29:11', '2021-01-06 17:29:11', 'IiaFGQYsjXh', 'iiafgqysjxh', '', '', 1, 60, '0', '0', '', '9090967282', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(75, '2021-01-06 17:44:36', '2021-01-06 17:44:36', 'ksiKTmjpgWJYXMDt', 'ksiktmjpgwjyxmdt', '', '', 1, 61, '0', '0', '', '2458196481', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(76, '2021-01-06 17:48:57', '2021-01-06 17:48:57', 'XZyKLkgAimWhSG', 'xzyklkgaimwhsg', '', '', 1, 62, '0', '0', '', '4905863151', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(77, '2021-01-06 17:53:27', '2021-01-06 17:53:27', 'cSBACZQedkxO', 'csbaczqedkxo', '', '', 1, 63, '0', '0', '', '5841244315', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(78, '2021-01-06 19:22:44', '2021-01-06 19:22:44', 'kOiUKwrYF', 'koiukwryf', '', '', 1, 64, '0', '0', '', '3223670609', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL),
(79, '2021-01-07 01:24:40', '2021-01-07 01:24:40', 'vDbPUVjRpi', 'vdbpuvjrpi', '', '', 1, 65, '0', '0', '', '6358718880', '0', '', 0.00, 0.00, '{}', 0, NULL, 0, 1, 1, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2020-12-02 09:13:46', '2020-12-02 09:13:46'),
(2, 'owner', 'web', '2020-12-02 09:13:46', '2020-12-02 09:13:46'),
(3, 'driver', 'web', '2020-12-02 09:13:46', '2020-12-02 09:13:46'),
(4, 'client', 'web', '2020-12-02 09:13:46', '2020-12-02 09:13:46');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 2),
(6, 2),
(7, 3),
(8, 1),
(8, 2),
(8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `site_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `search` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restorant_details_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `restorant_details_cover_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `playstore` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `appstore` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `maps_api_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `delivery` double(8,2) NOT NULL DEFAULT 0.00,
  `typeform` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile_info_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile_info_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_options` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '{}',
  `site_logo_dark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `created_at`, `updated_at`, `site_name`, `site_logo`, `search`, `restorant_details_image`, `restorant_details_cover_image`, `description`, `header_title`, `header_subtitle`, `currency`, `facebook`, `instagram`, `playstore`, `appstore`, `maps_api_key`, `delivery`, `typeform`, `mobile_info_title`, `mobile_info_subtitle`, `order_options`, `site_logo_dark`) VALUES
(1, '2020-12-02 09:13:46', '2021-01-05 19:49:15', 'Magic QR', 'cebcc5da-b818-4e7d-ba43-6e12ccbbf4d3', '2da46f61-23b0-4b5f-b716-6a6512a8f708', 'c00e6a13-906c-4eb1-9ff0-574cdaed2548', '035ee347-2a4e-4f6b-a715-f7cf9f819bda', 'Platform voor online eten bestellen en afhalen', '', '', 'USD', '', '', '', '', 'AIzaSyCZhq0g1x1ttXPa1QB3ylcDQPTAzp_KUgA', 0.00, '', '', '', '{}', '2b0406be-e8d7-42d3-9a76-ecd8d2da4724');

-- --------------------------------------------------------

--
-- Table structure for table `sms_verifications`
--

CREATE TABLE `sms_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`, `alias`) VALUES
(1, 'Just created', 'just_created'),
(2, 'Accepted by admin', 'accepted_by_admin'),
(3, 'Accepted by restaurant', 'accepted_by_restaurant'),
(4, 'Assigned to driver', 'assigned_to_driver'),
(5, 'Prepared', 'prepared'),
(6, 'Picked up', 'picked_up'),
(7, 'Delivered', 'delivered'),
(8, 'Rejected by admin', 'rejected_by_admin'),
(9, 'Rejected by restaurant', 'rejected_by_restaurant'),
(10, 'Updated', 'updated'),
(11, 'Closed', 'closed'),
(12, 'Rejected by driver', 'rejected_by_driver'),
(13, 'Accepted by driver', 'accepted_by_driver');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL DEFAULT 4,
  `restoarea_id` bigint(20) UNSIGNED DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `name`, `size`, `restoarea_id`, `restaurant_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(242, 'Terras 1', 2, 35, 22, '2020-12-12 15:57:14', '2020-12-12 15:57:14', NULL),
(243, 'Terras 2', 4, 35, 22, '2020-12-12 15:57:32', '2020-12-12 15:57:32', NULL),
(244, 'Beneden 1', 4, 37, 22, '2020-12-12 15:57:53', '2020-12-12 15:57:53', NULL),
(245, 'Beneden 2', 4, 37, 22, '2020-12-12 15:58:05', '2020-12-12 15:58:05', NULL),
(246, 'Beneden 3', 4, 37, 22, '2020-12-12 15:58:19', '2020-12-12 15:58:19', NULL),
(247, 'Beneden 4', 4, 37, 22, '2020-12-12 15:58:32', '2020-12-12 15:58:32', NULL),
(248, 'Boven 1', 2, 36, 22, '2020-12-12 15:58:42', '2020-12-12 15:58:42', NULL),
(249, 'Boven 2', 2, 36, 22, '2020-12-12 15:58:53', '2020-12-12 15:58:53', NULL),
(250, 'Boven 3', 4, 36, 22, '2020-12-12 15:59:05', '2020-12-12 15:59:05', NULL),
(251, 'Boven 4', 4, 36, 22, '2020-12-12 15:59:19', '2020-12-12 15:59:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `google_id` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_id` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `verification_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `plan_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cancel_url` varchar(555) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `update_url` varchar(555) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checkout_id` varchar(555) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subscription_plan_id` varchar(555) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `stripe_account` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `birth_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working` int(11) NOT NULL DEFAULT 1,
  `onorder` int(11) DEFAULT NULL,
  `numorders` int(11) NOT NULL DEFAULT 0,
  `rejectedorders` int(11) NOT NULL,
  `paypal_subscribtion_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mollie_customer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mollie_mandate_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_percentage` decimal(6,4) NOT NULL DEFAULT 0.0000,
  `extra_billing_information` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mollie_subscribtion_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_subscribtion_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_trans_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `google_id`, `fb_id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `phone`, `remember_token`, `created_at`, `updated_at`, `active`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `verification_code`, `phone_verified_at`, `plan_id`, `plan_status`, `cancel_url`, `update_url`, `checkout_id`, `subscription_plan_id`, `stripe_account`, `birth_date`, `lat`, `lng`, `working`, `onorder`, `numorders`, `rejectedorders`, `paypal_subscribtion_id`, `mollie_customer_id`, `mollie_mandate_id`, `tax_percentage`, `extra_billing_information`, `mollie_subscribtion_id`, `paystack_subscribtion_id`, `paystack_trans_id`) VALUES
(1, NULL, NULL, 'MagicQR Admin', 'info@magicqr.nl', '2020-12-02 09:13:46', '$2y$10$Xdm3s0qZcEngeyJ6EdEcLOw463QjmMaK7IyUkqt/kyBu7PY5V0wyO', 'tG2r9FQW0yAfVDce798UVRJwLkIO78XthqURDAAilKCV0GHa52bkJiesXmKNvogBmCIsgjDk7AqVKdG2', '0634568216', NULL, '2020-12-02 09:13:46', '2021-01-03 13:58:04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(2, NULL, NULL, 'Demo Owner', 'owner@example.com', '2020-12-02 09:13:47', '$2y$10$hlZ7HyvmIo8omTWCdzpbHONxAd0xfyqvztL/GPObTYBb05MPBL58S', 'ZzyZ3Lw9U33Qjqq1NrEJpbE1dN7BwahWDZHnuSmKXxs5oTNmswyIv7udmv4fEJih0tAmdigWX6dapSGw', '', 'NLI5dRWsy7HNfmdv3pOR9slBCTqWxn8WNcBv2KAP1fGQkC2GMi2urovlpfxs', '2020-12-02 09:13:47', '2020-12-05 20:54:55', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, '', '', '', '', '', 'acct_1Hu0BgGSPL5bsDzp', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(8, NULL, NULL, 'Magic Restaurant', 'restaurant@magicqr.nl', NULL, '$2y$10$ScrInESjv/tjqtCptuKg/ebY3VV8qhzeQhvAlAXFR5uXSyZrdeN86', 'xw22e9xu2WfRJjQylNHubkdMIlOcML8TMJGrFdgZaFF32H14vL40OKgSw8dOgU3dxTKzpV6pxLlzoPiJ', '0877 847450', 'XrJEoUKP1FGy5XhvsyAQX8RUcxp91yhjOfpzZeiXxfgPcrmGUZ8PNxme6bP3', '2020-12-12 11:50:29', '2020-12-17 19:22:43', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(9, NULL, NULL, 'Joudy Alnaji', 'joudy.alnaji@gmail.com', NULL, '$2y$10$dKvw8irsVqYjXvcAJ7PTFetVrUcgORC94D3.jhx33lhqNhZEbvom.', '5oTRk3TjAdVfdMPSq6x0B7qlkmh0urbuqPaOEzq205bCH24qrbQjavsHYjO0u6MDdIl8s8CZBb4jCwKf', '+31 6 38 13 91 23', 'rZgyVi1egRuRT0CUS8cMwqiStkfo3Xws8VVIDAZCvcAprJSakkzqovByplbv', '2020-12-28 21:58:20', '2020-12-28 21:58:21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(13, NULL, NULL, 'Givaor Gambier', 'g.gambier@live.nl', NULL, '$2y$10$Oq3FFg2f0M.Qr45fsgUAFucuk293Opmd7/IbZbMNyVRSDllSstXK6', '441GJB6WXKtNNZY4ajmFIAhgS07uXX2BJA8JrncVfaoRLjcHRBrQyuNT61oja0QhUZKBpMUihFi8MhbR', '0640741529', NULL, '2021-01-01 00:02:50', '2021-01-01 00:02:51', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(16, NULL, NULL, 'Radwan Mairouche', 'info@eetmzian.nl', NULL, '$2y$10$zzfH6Nx65Zh4OQu0mtCXqugDVZTtaZCLpd4Ln7e.4rifdD.UoUkQm', 'aPwQMcVpHXvbvR7ajRGCNz7xys0leqAgTTmdcA8S6YAF55T3hXII1XtTmqwN2TZ6fu7RyyAl35z2vvPZ', '0627261328', NULL, '2021-01-01 10:33:13', '2021-01-01 10:33:13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(28, NULL, NULL, 'Dominique Schulting', 'gewoondolacarihuela@hotmail.com', NULL, '$2y$10$cYpKGMFXOrinCJr1Su042.VTMU3B7Zcv15Hj0XQkfwb.M7Dn621iG', 'opmmuNgBRdXagxNUDf8BjYDVexADsyD7YWkZPznnQDsNYwdPiI9b4RHhiUCRVp4SJvQSlLIaYE4MhAAJ', '0031655581320', NULL, '2021-01-03 20:33:16', '2021-01-03 20:33:17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(29, NULL, NULL, 'Sebastiaan Doesburg', 'sebastiaan@mowglis.nl', NULL, '$2y$10$zyKrI28opv0rHHM0MyhmguRR6K/as2jU4aBnlsdtPH3OdmQQobG.S', 'R7gtm8E0jxZ9W0D1zCWRhJUKJWqFawBQ3AinyaExosffdZBDnkpdpuWue86M0zimJNMzJ2f7EcCZyABD', '0613158886', 'iaQ7QCLFNz2ZHRo4989WktT9PubZaEdBFRmOwBRM6sxaljrjt6Rj9MmYt6IX', '2021-01-04 10:00:16', '2021-01-04 10:00:16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(30, NULL, NULL, 'Najla Gamah', 'Najla.G@hotmail.com', NULL, '$2y$10$zcfe5XOt1EPg5iI7C9PuL.B2VMMFGdwipLx6Fdd8O/tpGboBnRgSC', 'WR5v0j5l8O0QjBkQGqmIYjQKqiO4f1gk6LOuLq8XIgRQt7XSCLPd0np42E0tfBlSxfi4fJMl5uWF7tlr', '0628308295', NULL, '2021-01-04 11:34:25', '2021-01-04 11:34:25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(46, NULL, NULL, 'sahyrSIpVZgXWJFk', 'f.leonardo@verizon.net', NULL, '$2y$10$0GMJNP/NST6LAJ8TRyHxCOplqh7qJfg..RQCtjWAGLkaxdjbhhGKS', 'Xea7pun1Vz2AIoIdymZNi4ARYa6XJBwPaIpb7ZUWuDaebXlM6bAmpLnoF4MxpYeU13KVfGAgN79J3ejn', '3051856469', NULL, '2021-01-05 20:11:19', '2021-01-05 20:11:19', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(47, NULL, NULL, 'NVunRcprgwBY', 'mattbluechipsales@gmail.com', NULL, '$2y$10$nOryxYrEAFFZCUzDPsfOA.2R6tq7V6o/BA3kHllFJ579Eg3YI1wA6', 'hF9fqoSYmENaqFsrsNr1sRIlwW00X5YAZUf5730iE8a9mlTsUh8lEEY1U37Ovyx3GPtk4pRPTLHsgBiF', '9638865374', NULL, '2021-01-05 23:01:16', '2021-01-05 23:01:16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(48, NULL, NULL, 'CjmoRFwAsYkM', 'atomicangel97@yahoo.com', NULL, '$2y$10$HLiM8kRwOLW2ScBP42kUbOQrSnBRWlJwoyV37UZisvugfCmb6zPSG', 'Xid1izZPKeizJ3aWBJaBpIDnN0uvydKF58v9ppVdGoAgiVZFEsTxiPHxjii1i2pLXSqtktxl7HrhB3yQ', '6596995211', NULL, '2021-01-06 02:15:56', '2021-01-06 02:15:56', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(49, NULL, NULL, 'uIgLzbwjN', 'vdotson2014@gmail.com', NULL, '$2y$10$uJ17NeiM5xhMOypDC8Kytuzrz7H9i4YygxJEpXaO8cBj5dEKS6ZCC', 'badZVN0NZGuP0d4fKY7Qa76YFELQWHyAeD6kP6OmJI62diiMt73Tu3GYh77h4u6fvga3BxDsjYViXPeY', '7261079554', NULL, '2021-01-06 02:43:54', '2021-01-06 02:43:54', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(50, NULL, NULL, 'ikwjDlKvOaQu', 'mikey2blu@aol.com', NULL, '$2y$10$8EIaPL0Xykg1mgPodJS/PuVIkUtWoaH3hMV3qiD1eq/R5cX8ahREO', 'PhCP1QeukKUKi9uUPIRfLITH37XkASJ3Gjna2abyWq7VLphRzllv8rCRtvIhR2aLOr1X4lFHgKf9naYj', '3613648312', NULL, '2021-01-06 04:31:02', '2021-01-06 04:31:02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(51, NULL, NULL, 'NePhqZtwRJxg', 'nyanruey@me.com', NULL, '$2y$10$5JIWSxyMLndry5Bp.StGmeGZPhw/6m2BCnvVq.ITW03x5asFYg2Ri', 'VaxzGfnpP7mwNLDXBMTe15jRbGlhqj5HUNMk1LhykTHrrHBSjOKQvUvEA4SsdbIKwdLRAqEj4SMFXD5Y', '5071230751', NULL, '2021-01-06 05:45:05', '2021-01-06 05:45:05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(52, NULL, NULL, 'fzShiDIXObMHYoA', 'kindredspirits1317@yahoo.com', NULL, '$2y$10$yIV30eR7ijmzsKfG2GW5D.7IJnaNoGR2DmWKUk0f55ueAoe/gpd0y', 'U7BXx5tYqqahHcnoLhpuGLfS87YjWCCkpNkscc2TkfuuqTTzQuhRYlJjZ1PlTqFbQ7n7G1zcDQVcpIsj', '6260836313', NULL, '2021-01-06 07:50:10', '2021-01-06 07:50:11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(53, NULL, NULL, 'EwKisoaU', 'mcleaneverett@yahoo.com', NULL, '$2y$10$imsWUlqOkOFtzxIObb0pJ.gKpCYrJDKzh4BpgSXGqF/GowRzxHd2e', 'GjOReuEKWrVEl8HVqv3OWOEJLA3c6HqBjTkHfH7NrVTw28z64TvD286pvoTnDU8wlBnGg5VgfsLUe1j9', '9878311757', NULL, '2021-01-06 07:50:17', '2021-01-06 07:50:17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(54, NULL, NULL, 'tVxNeYpwO', 'pacoop@aol.com', NULL, '$2y$10$IYKjN2WWXj7NvPGXshb0Gu6WcZGHVfEsLhvw3m2vt4I3cO27sncKa', '2KWmbFRheJefEjZE0sQhx5GxhplBwQGi4eLFO3V89Eb3qYw1M9RVQm4kPTbWDSeKpKZ3062AIHhUdNaG', '8241675460', NULL, '2021-01-06 08:58:25', '2021-01-06 08:58:25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(55, NULL, NULL, 'Nigel hitches', 'info@lecourage.nl', NULL, '$2y$10$h2eYXvEvVB0O5bv/ZtI1ReOJoqzxWTAInN9SV9hq6RMzTtC5y1Oae', 'iWfYqt6EIplAh9jvSjjH4XCItHtABmNjONNiUfkfiedDZHoV3EcT0is901w2tVSJYb09j5YDLuRle1Ro', '0651605863', 'mNW3lgwPnm2oqmWtCO5vI5avHsaXMz5HsP17f9vg4PCA0mPBfFU31V2Usa4b', '2021-01-06 15:07:03', '2021-01-06 15:07:03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(56, NULL, NULL, 'eLAFVMch', 'feldhouse@embarqmail.com', NULL, '$2y$10$im2uJI6.UrTFUE4YC9/2YOpHJs5wd/mCvPvXFGXWE2aW/Nqed00Py', '3eqgHPNDVwpBbYZBltQFD7tzHepg6yE7gmMA05QUFXaRy6IzAe5MUNpah9D1QiQbYnCibzmREErL8BZz', '6177591374', NULL, '2021-01-06 15:31:56', '2021-01-06 15:31:56', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(57, NULL, NULL, 'zbMQIcrxyoZjw', 'joojb@yahoo.com', NULL, '$2y$10$nJE6T5JuytHoXRRYKzYhOuU4mtc9AVxNVUPThxBIjJEBBlBmXjWwS', 'JEmVXWDnYhA3JZzRPPxeSbZBhowEcXSeXVgScsXeR5J8FKDrfYurVElPteeH9Rf7yz7IwAmE7xyMGTPW', '8403642121', NULL, '2021-01-06 15:33:31', '2021-01-06 15:33:31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(58, NULL, NULL, 'YnNfxQFImklH', 'freakycat606@yahoo.com', NULL, '$2y$10$nfLeYc7AhYU/nj2KTm5Z3exbn1KULxobAYoU4SBAsmYpmutNwJh0u', 'WMnIsCQ3CfZuPlu3czII7oAxwboTNVGyRqk6Cc7i8cJdymWooHiqqQFTH0oIOvZzfTIp9o5enDBjJkUb', '6432528555', NULL, '2021-01-06 16:02:03', '2021-01-06 16:02:03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(59, NULL, NULL, 'amXSAMbUvRTxciD', 'aewalker012@aim.com', NULL, '$2y$10$PTriLbw3SsIMcEfjB/CUKeEgYOz8T75Ki9setQCDzFDIy1u53rocy', 'YXsAOHTGo8ye1bbFLXK0P3z58ZQ8AKz0y4JvntQr5JTk7XrPm1hRfn7EVM5rIoPaqGXOFUKGn1JsQ7Rx', '8359646490', NULL, '2021-01-06 16:50:02', '2021-01-06 16:50:02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(60, NULL, NULL, 'uDbedAkEtYvWzCaL', 'jjimenez15@bellsouth.net', NULL, '$2y$10$H0IDcqTCw1F7jLAK69F6geN5TpHMmW3Xe.JDLuAlwSQghaQWXSpRe', 'Pa6rc6otQbhiBakIjZ3eWQ67hj23O8gwk7wKX32WQRja6M2iyfsv2Bw9BPLkt6lNckga5DhgsXMfoJho', '9090967282', NULL, '2021-01-06 17:29:10', '2021-01-06 17:29:11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(61, NULL, NULL, 'NGJybFpE', 'cbenn33011@aol.com', NULL, '$2y$10$6X.xd2zzN8tUsR50IECzw.4OtbLnv4cPXDJnwHjVxOhobzdRCG.y6', 'twDZFbjR9L4xNYkwrkwDaDMf3R6WPwznHDlPHklpKVoCMaFqOkzZ5iQDZhDskfusvsRhMzmEQUX6n5zE', '2458196481', NULL, '2021-01-06 17:44:36', '2021-01-06 17:44:36', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(62, NULL, NULL, 'vRlqMPeGJwDrcKQ', 'mclownsbery@yahoo.com', NULL, '$2y$10$cAEATiBfhovJS32nx4puzeHo7rrboC8NJIT1EKknPyTvTIdWfGdIe', 'GhQhiJrtDhfneNGY1bAjhCMn8BuLiyYpFkIjwlGeofino4kSmzZQLcvFkiYU30VEGF0KaatxbacaHfWh', '4905863151', NULL, '2021-01-06 17:48:57', '2021-01-06 17:48:57', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(63, NULL, NULL, 'DeiQaICLk', 'drmcclymont@gmail.com', NULL, '$2y$10$vvsYQ.MoSu6t63nFYJqw8uVw74ds0a5LkeuPUsMmV/bJivpBsHOOG', 'vnzA6OmHq9LroPQuKg1x6ay1avnpxLu0ORyOjdxxRTWUBhuknHXE0l4B6CKBTdf383SxaOW6O384BM9b', '5841244315', NULL, '2021-01-06 17:53:27', '2021-01-06 17:53:27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(64, NULL, NULL, 'RhSzTgKQi', 'vivsuarez@sbcglobal.net', NULL, '$2y$10$aSZ2ZLjjyvbEo3r8fx8ZB.8Yo9bzoGntzz6chJ313lPhSO48Y/Q5K', 'Yh5yZC9nHUtBQnlmw7sNxJGyMjsTAxR6PGpZgZi5tt59tiArk18DeSBzdf4aTuW5WPAbkRr5vsS5yqKI', '3223670609', NULL, '2021-01-06 19:22:44', '2021-01-06 19:22:44', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL),
(65, NULL, NULL, 'oINCicZjrtXHSB', 'askmeout@att.net', NULL, '$2y$10$PyEeOE8FVqMpU3qiI6Qr9uqOUacPfAHriHIwUu1vA6Vj3Hi1rlvU6', 'TqjQaM97xCHkmT55j6pYaLG9sw6JcNteDZq4S4vbkwPx3357FdqPODV3Sv0c8iWUZUiUDl5MtGkxiNMR', '6358718880', NULL, '2021-01-07 01:24:40', '2021-01-07 01:24:40', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `options` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `enable_qty` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `price`, `options`, `image`, `qty`, `enable_qty`, `order`, `item_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1057, 12.80, '{\"177\":\"groot\"}', '', 0, 0, 0, 359, '2020-12-12 18:17:51', '2020-12-12 18:17:51', NULL),
(1058, 16.00, '{\"177\":\"extra-groot\"}', '', 0, 0, 0, 359, '2020-12-12 18:18:19', '2020-12-12 18:18:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variants_has_extras`
--

CREATE TABLE `variants_has_extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `extra_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants_has_extras`
--

INSERT INTO `variants_has_extras` (`id`, `created_at`, `updated_at`, `variant_id`, `extra_id`) VALUES
(1058, NULL, NULL, 1057, 506),
(1059, NULL, NULL, 1058, 507);

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `table_id` bigint(20) UNSIGNED DEFAULT NULL,
  `by` int(11) NOT NULL DEFAULT 1 COMMENT '1 - Owner, 0 - Client Himself',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_restorant_id_foreign` (`restorant_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_alias_unique` (`alias`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extras_item_id_foreign` (`item_id`);

--
-- Indexes for table `hours`
--
ALTER TABLE `hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hours_restorant_id_foreign` (`restorant_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_category_id_foreign` (`category_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_item_id_foreign` (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_address_id_foreign` (`address_id`),
  ADD KEY `orders_client_id_foreign` (`client_id`),
  ADD KEY `orders_restorant_id_foreign` (`restorant_id`),
  ADD KEY `orders_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `order_has_items`
--
ALTER TABLE `order_has_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_has_items_order_id_foreign` (`order_id`),
  ADD KEY `order_has_items_item_id_foreign` (`item_id`);

--
-- Indexes for table `order_has_status`
--
ALTER TABLE `order_has_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_has_status_order_id_foreign` (`order_id`),
  ADD KEY `order_has_status_status_id_foreign` (`status_id`),
  ADD KEY `order_has_status_user_id_foreign` (`user_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `paths`
--
ALTER TABLE `paths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_rateable_type_rateable_id_index` (`rateable_type`,`rateable_id`),
  ADD KEY `ratings_rateable_id_index` (`rateable_id`),
  ADD KEY `ratings_rateable_type_index` (`rateable_type`),
  ADD KEY `ratings_user_id_foreign` (`user_id`),
  ADD KEY `ratings_order_id_foreign` (`order_id`);

--
-- Indexes for table `restoareas`
--
ALTER TABLE `restoareas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restoareas_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `restorants`
--
ALTER TABLE `restorants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restorants_name_unique` (`name`),
  ADD UNIQUE KEY `restorants_subdomain_unique` (`subdomain`),
  ADD KEY `restorants_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_verifications`
--
ALTER TABLE `sms_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_verifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status_name_unique` (`name`),
  ADD UNIQUE KEY `status_alias_unique` (`alias`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tables_restoarea_id_foreign` (`restoarea_id`),
  ADD KEY `tables_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`),
  ADD UNIQUE KEY `users_verification_code_unique` (`verification_code`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants_item_id_foreign` (`item_id`);

--
-- Indexes for table `variants_has_extras`
--
ALTER TABLE `variants_has_extras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variants_has_extras_variant_id_foreign` (`variant_id`),
  ADD KEY `variants_has_extras_extra_id_foreign` (`extra_id`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visits_restaurant_id_foreign` (`restaurant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extras`
--
ALTER TABLE `extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=509;

--
-- AUTO_INCREMENT for table `hours`
--
ALTER TABLE `hours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=392;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=625;

--
-- AUTO_INCREMENT for table `order_has_items`
--
ALTER TABLE `order_has_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `order_has_status`
--
ALTER TABLE `order_has_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `paths`
--
ALTER TABLE `paths`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restoareas`
--
ALTER TABLE `restoareas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `restorants`
--
ALTER TABLE `restorants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_verifications`
--
ALTER TABLE `sms_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1059;

--
-- AUTO_INCREMENT for table `variants_has_extras`
--
ALTER TABLE `variants_has_extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1060;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_restorant_id_foreign` FOREIGN KEY (`restorant_id`) REFERENCES `restorants` (`id`);

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restorants` (`id`);

--
-- Constraints for table `extras`
--
ALTER TABLE `extras`
  ADD CONSTRAINT `extras_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `hours`
--
ALTER TABLE `hours`
  ADD CONSTRAINT `hours_restorant_id_foreign` FOREIGN KEY (`restorant_id`) REFERENCES `restorants` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `orders_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_restorant_id_foreign` FOREIGN KEY (`restorant_id`) REFERENCES `restorants` (`id`);

--
-- Constraints for table `order_has_items`
--
ALTER TABLE `order_has_items`
  ADD CONSTRAINT `order_has_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `order_has_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `order_has_status`
--
ALTER TABLE `order_has_status`
  ADD CONSTRAINT `order_has_status_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_has_status_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `order_has_status_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `restoareas`
--
ALTER TABLE `restoareas`
  ADD CONSTRAINT `restoareas_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restorants` (`id`);

--
-- Constraints for table `restorants`
--
ALTER TABLE `restorants`
  ADD CONSTRAINT `restorants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sms_verifications`
--
ALTER TABLE `sms_verifications`
  ADD CONSTRAINT `sms_verifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tables`
--
ALTER TABLE `tables`
  ADD CONSTRAINT `tables_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restorants` (`id`),
  ADD CONSTRAINT `tables_restoarea_id_foreign` FOREIGN KEY (`restoarea_id`) REFERENCES `restoareas` (`id`);

--
-- Constraints for table `translations`
--
ALTER TABLE `translations`
  ADD CONSTRAINT `translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `variants`
--
ALTER TABLE `variants`
  ADD CONSTRAINT `variants_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `variants_has_extras`
--
ALTER TABLE `variants_has_extras`
  ADD CONSTRAINT `variants_has_extras_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`),
  ADD CONSTRAINT `variants_has_extras_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`);

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restorants` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
