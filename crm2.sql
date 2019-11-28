-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2019 a las 18:54:16
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crm2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activations`
--

CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'ZwZ0PCig2i1mWjcDvcwxeReWmIEcqw5e', 1, '2019-11-28 08:56:11', '2019-11-28 08:56:11', '2019-11-28 08:56:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dashboard__widgets`
--

CREATE TABLE `dashboard__widgets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `widgets` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media__files`
--

CREATE TABLE `media__files` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_folder` tinyint(1) NOT NULL DEFAULT 0,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mimetype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesize` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media__file_translations`
--

CREATE TABLE `media__file_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_attribute` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media__imageables`
--

CREATE TABLE `media__imageables` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_id` int(11) NOT NULL,
  `imageable_id` int(11) NOT NULL,
  `imageable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu__menuitems`
--

CREATE TABLE `menu__menuitems` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `page_id` int(10) UNSIGNED DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `target` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'page',
  `class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_root` tinyint(1) NOT NULL DEFAULT 0,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu__menuitem_translations`
--

CREATE TABLE `menu__menuitem_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `menuitem_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu__menus`
--

CREATE TABLE `menu__menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu__menu_translations`
--

CREATE TABLE `menu__menu_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_07_02_230147_migration_cartalyst_sentinel', 1),
(2, '2016_06_24_193447_create_user_tokens_table', 1),
(3, '2014_10_14_200250_create_settings_table', 2),
(4, '2014_10_15_191204_create_setting_translations_table', 2),
(5, '2015_06_18_170048_make_settings_value_text_field', 2),
(6, '2015_10_22_130947_make_settings_name_unique', 2),
(7, '2017_09_17_164631_make_setting_value_nullable', 2),
(8, '2014_11_03_160015_create_menus_table', 3),
(9, '2014_11_03_160138_create_menu-translations_table', 3),
(10, '2014_11_03_160753_create_menuitems_table', 3),
(11, '2014_11_03_160804_create_menuitem_translation_table', 3),
(12, '2014_12_17_185301_add_root_column_to_menus_table', 3),
(13, '2015_09_05_100142_add_icon_column_to_menuitems_table', 3),
(14, '2016_01_26_102307_update_icon_column_on_menuitems_table', 3),
(15, '2016_08_01_142345_add_link_type_colymn_to_menuitems_table', 3),
(16, '2016_08_01_143130_add_class_column_to_menuitems_table', 3),
(17, '2017_09_18_192639_make_title_field_nullable_menu_table', 3),
(18, '2014_10_26_162751_create_files_table', 4),
(19, '2014_10_26_162811_create_file_translations_table', 4),
(20, '2015_02_27_105241_create_image_links_table', 4),
(21, '2015_12_19_143643_add_sortable', 4),
(22, '2017_09_20_144631_add_folders_columns_on_files_table', 4),
(23, '2014_11_30_191858_create_pages_tables', 5),
(24, '2017_10_13_103344_make_status_field_nullable_on_page_translations_table', 5),
(25, '2018_05_23_145242_edit_body_column_nullable', 5),
(26, '2015_04_02_184200_create_widgets_table', 6),
(27, '2013_04_09_062329_create_revisions_table', 7),
(28, '2015_11_20_184604486385_create_translation_translations_table', 7),
(29, '2015_11_20_184604743083_create_translation_translation_translations_table', 7),
(30, '2015_12_01_094031_update_translation_translations_table_with_index', 7),
(31, '2016_07_12_181155032011_create_tag_tags_table', 8),
(32, '2016_07_12_181155289444_create_tag_tag_translations_table', 8),
(33, '2019_11_27_174410639585_create_pipelines_sources_table', 9),
(34, '2019_11_27_174411432065_create_pipelines_countries_table', 9),
(35, '2019_11_27_174412232669_create_pipelines_companies_table', 9),
(36, '2019_11_27_174412232671_create_pipelines_contacts_table', 9),
(37, '2019_11_27_174413857801_create_pipelines_typebusinesses_table', 9),
(38, '2019_11_27_174414720259_create_pipelines_businesses_table', 9),
(39, '2019_11_27_174415601874_create_pipelines_products_table', 9),
(40, '2019_11_27_174416422413_create_pipelines_detailbusinesses_table', 9),
(41, '2019_11_27_174417296914_create_pipelines_pipelines_table', 9),
(42, '2019_11_27_174418192401_create_pipelines_pipelinebusinesses_table', 9),
(43, '2019_11_27_174419030956_create_pipelines_phones_table', 9),
(44, '2019_11_27_174419910399_create_pipelines_emails_table', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `page__pages`
--

CREATE TABLE `page__pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT 0,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `page__pages`
--

INSERT INTO `page__pages` (`id`, `is_home`, `template`, `created_at`, `updated_at`) VALUES
(1, 1, 'home', '2019-11-28 08:56:14', '2019-11-28 08:56:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `page__page_translations`
--

CREATE TABLE `page__page_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `page__page_translations`
--

INSERT INTO `page__page_translations` (`id`, `page_id`, `locale`, `title`, `slug`, `status`, `body`, `meta_title`, `meta_description`, `og_title`, `og_description`, `og_image`, `og_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Home page', 'home', '1', '<p><strong>You made it!</strong></p>\n<p>You&#39;ve installed AsgardCMS and are ready to proceed to the <a href=\"/en/backend\">administration area</a>.</p>\n<h2>What&#39;s next ?</h2>\n<p>Learn how you can develop modules for AsgardCMS by reading our <a href=\"https://github.com/AsgardCms/Documentation\">documentation</a>.</p>\n', 'Home page', NULL, NULL, NULL, NULL, NULL, '2019-11-28 08:56:14', '2019-11-28 08:56:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persistences`
--

CREATE TABLE `persistences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `persistences`
--

INSERT INTO `persistences` (`id`, `user_id`, `code`, `created_at`, `updated_at`) VALUES
(1, 1, '2ea4GI0qwE9ADHefcThqFlfEHepoDdR6', '2019-11-28 08:58:43', '2019-11-28 08:58:43'),
(2, 1, 'xeweaoPiwxCDaOZqvP7AdbcS24FKH7mS', '2019-11-28 08:59:46', '2019-11-28 08:59:46'),
(3, 1, '110PQJhJRcwvW1Hs1pZmaNPtVIyOvGhz', '2019-11-28 08:59:48', '2019-11-28 08:59:48'),
(4, 1, 'fAE8dFelcSglpLhC0bY7HFmhMBm8hb1w', '2019-11-28 08:59:49', '2019-11-28 08:59:49'),
(5, 1, 'PTdthdikhbSpyLnKSda68hogBkQmxxww', '2019-11-28 09:00:16', '2019-11-28 09:00:16'),
(6, 1, 'bZdCPpaQIkcq2LexprDeVmwKSYwWJQcu', '2019-11-28 09:00:17', '2019-11-28 09:00:17'),
(7, 1, 'MXbCYdZ2n6DyumdbJ9pI3MV3VE39m9tu', '2019-11-28 09:00:37', '2019-11-28 09:00:37'),
(8, 1, 'k4oCkRAbCwCYnbiEPqmbnIwW0aOonykw', '2019-11-28 16:44:12', '2019-11-28 16:44:12'),
(9, 1, 'X6YBzuLkcertypbuck2Hnn0oFmxQmkSe', '2019-11-28 17:03:42', '2019-11-28 17:03:42'),
(10, 1, 'IReWrJjRyDptZi6eTxmJryzwNgV0dd7Y', '2019-11-28 17:03:44', '2019-11-28 17:03:44'),
(11, 1, 'xMW3iARQdHGnoEeMenvCFdFhUJBC0wG1', '2019-11-28 17:03:44', '2019-11-28 17:03:44'),
(12, 1, '4mwrN0S2ckiTLnuizeDCRoE3DIko3a5D', '2019-11-28 17:04:52', '2019-11-28 17:04:52'),
(13, 1, '2Y7aEB5vBa2McPOvkz0GSvhDuy5sDvvP', '2019-11-28 17:04:53', '2019-11-28 17:04:53'),
(14, 1, '6XA9mhYxRmfcWOoj4Bzn2qqHDh9DKgSO', '2019-11-28 17:05:01', '2019-11-28 17:05:01'),
(15, 1, 'KMr6GS8CKeaC3TKkQeLX6ECXKaXa3nTn', '2019-11-28 17:05:02', '2019-11-28 17:05:02'),
(16, 1, 'p8ZUqUAfln8b3BTlbT66wx1lXXXxLnt5', '2019-11-28 17:05:20', '2019-11-28 17:05:20'),
(17, 1, 'RH9QU4HC4lFOv8XpiK7iliZy3rnbk9iE', '2019-11-28 17:05:20', '2019-11-28 17:05:20'),
(18, 1, 'fMBRkGl4zu8UJkQGZkQkDt5RlBK4VMs1', '2019-11-28 21:05:40', '2019-11-28 21:05:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pipelines__businesses`
--

CREATE TABLE `pipelines__businesses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(10) UNSIGNED DEFAULT NULL,
  `contact_id` int(10) UNSIGNED DEFAULT NULL,
  `seller_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pipelines__businesses`
--

INSERT INTO `pipelines__businesses` (`id`, `name`, `type_id`, `contact_id`, `seller_id`, `created_at`, `updated_at`) VALUES
(1, 'Contacto test', NULL, 1, 1, '2019-11-28 17:09:32', '2019-11-28 17:42:10'),
(2, 'Facebook test', NULL, 2, 1, '2019-11-28 17:43:48', '2019-11-28 17:43:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pipelines__companies`
--

CREATE TABLE `pipelines__companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `web` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int(10) UNSIGNED DEFAULT NULL,
  `seller_id` int(10) UNSIGNED DEFAULT NULL,
  `type_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identification` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subdomain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pipelines__companies`
--

INSERT INTO `pipelines__companies` (`id`, `name`, `city`, `country_id`, `web`, `source_id`, `seller_id`, `type_id`, `identification`, `subdomain`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Empresa', 'Cali', 1, NULL, 1, 1, NULL, NULL, NULL, 'test@test.com', '12345678', '2019-11-28 16:47:38', '2019-11-28 16:47:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pipelines__contacts`
--

CREATE TABLE `pipelines__contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_wa` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `web` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `source_id` int(10) UNSIGNED DEFAULT NULL,
  `seller_id` int(10) UNSIGNED DEFAULT NULL,
  `added_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pipelines__contacts`
--

INSERT INTO `pipelines__contacts` (`id`, `name`, `last_name`, `email`, `number_wa`, `phone`, `company_id`, `web`, `city`, `country_id`, `source_id`, `seller_id`, `added_by`, `created_at`, `updated_at`) VALUES
(1, 'Contacto', 'test', 'Contacto@Contacto.com', NULL, '1234567890', NULL, NULL, 'Cali', 1, 3, 1, 1, '2019-11-28 17:09:32', '2019-11-28 17:09:32'),
(2, 'Facebook', 'test', 'test@test.com', NULL, '1918289192192391923', NULL, NULL, 'Cali', 1, 11, 1, 1, '2019-11-28 17:43:48', '2019-11-28 17:43:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pipelines__countries`
--

CREATE TABLE `pipelines__countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pipelines__countries`
--

INSERT INTO `pipelines__countries` (`id`, `name`, `iso`, `created_at`, `updated_at`) VALUES
(1, 'Colombia', 'CO', '2019-11-28 16:46:35', '2019-11-28 16:46:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pipelines__detailbusinesses`
--

CREATE TABLE `pipelines__detailbusinesses` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `value` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pipelines__detailbusinesses`
--

INSERT INTO `pipelines__detailbusinesses` (`id`, `business_id`, `product_id`, `quantity`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 9, 199.00, '2019-11-28 22:36:41', '2019-11-28 22:36:41'),
(2, 2, 1, 10, 1999.00, '2019-11-28 22:37:34', '2019-11-28 22:37:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pipelines__emails`
--

CREATE TABLE `pipelines__emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pipelines__emails`
--

INSERT INTO `pipelines__emails` (`id`, `email`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'test2@test.com', 1, '2019-11-28 16:47:58', '2019-11-28 16:47:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pipelines__phones`
--

CREATE TABLE `pipelines__phones` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pipelines__phones`
--

INSERT INTO `pipelines__phones` (`id`, `phone`, `company_id`, `created_at`, `updated_at`) VALUES
(1, '0909809809', 1, '2019-11-28 16:53:10', '2019-11-28 16:53:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pipelines__pipelinebusinesses`
--

CREATE TABLE `pipelines__pipelinebusinesses` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `pipeline_id` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pipelines__pipelinebusinesses`
--

INSERT INTO `pipelines__pipelinebusinesses` (`id`, `business_id`, `pipeline_id`, `description`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, '2019-11-28 17:09:32', '2019-11-28 17:09:32'),
(2, 2, 1, NULL, NULL, '2019-11-28 17:43:48', '2019-11-28 17:43:48'),
(3, 1, 2, 'hlaksjdlkasd', '2019-11-28', '2019-11-28 22:36:25', '2019-11-28 22:36:25'),
(4, 2, 3, 'Hi', '2019-11-30', '2019-11-28 22:45:31', '2019-11-28 22:45:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pipelines__pipelines`
--

CREATE TABLE `pipelines__pipelines` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pipelines__pipelines`
--

INSERT INTO `pipelines__pipelines` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Sin Contactar', '2019-11-28 17:02:00', '2019-11-28 17:02:00'),
(2, '1 Contacto', '2019-11-28 17:02:13', '2019-11-28 17:02:13'),
(3, 'DEMO Agendado', '2019-11-28 17:02:23', '2019-11-28 17:02:23'),
(4, 'En Seguimiento', '2019-11-28 17:02:34', '2019-11-28 17:02:34'),
(5, 'Aplazado', '2019-11-28 17:02:56', '2019-11-28 17:02:56'),
(6, 'Ganado', '2019-11-28 17:03:07', '2019-11-28 17:03:07'),
(7, 'Perdido', '2019-11-28 17:03:16', '2019-11-28 17:03:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pipelines__products`
--

CREATE TABLE `pipelines__products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pipelines__products`
--

INSERT INTO `pipelines__products` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Usuario Financial', 1000.00, '2019-11-28 17:00:32', '2019-11-28 17:00:32'),
(2, 'Usuario Internal', 1000.00, '2019-11-28 17:00:48', '2019-11-28 17:00:48'),
(3, 'Almacenamiento', 1200.00, '2019-11-28 17:01:05', '2019-11-28 17:01:05'),
(4, 'Capacitación', 88.00, '2019-11-28 17:01:20', '2019-11-28 17:01:20'),
(5, 'Evento', 1200.00, '2019-11-28 17:01:35', '2019-11-28 17:01:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pipelines__sources`
--

CREATE TABLE `pipelines__sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pipelines__sources`
--

INSERT INTO `pipelines__sources` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Facebook', '2019-11-28 16:46:18', '2019-11-28 16:46:18'),
(2, 'Facebook Ads', '2019-11-28 16:56:28', '2019-11-28 16:56:28'),
(3, 'SEO', '2019-11-28 16:56:41', '2019-11-28 16:56:41'),
(4, 'Google Ads', '2019-11-28 16:56:54', '2019-11-28 16:56:54'),
(5, 'Google Display', '2019-11-28 16:57:05', '2019-11-28 16:57:05'),
(6, 'Linkedin', '2019-11-28 16:57:19', '2019-11-28 16:57:19'),
(7, 'Linkedin Ads', '2019-11-28 16:57:35', '2019-11-28 16:57:35'),
(8, 'YouTube', '2019-11-28 16:57:46', '2019-11-28 16:57:46'),
(9, 'Twitter', '2019-11-28 16:57:57', '2019-11-28 16:57:57'),
(10, 'Instagram', '2019-11-28 16:58:13', '2019-11-28 16:58:13'),
(11, 'EMMA', '2019-11-28 16:58:27', '2019-11-28 16:58:27'),
(12, 'Referidos', '2019-11-28 16:58:37', '2019-11-28 16:58:37'),
(13, 'Nos llamaron', '2019-11-28 16:58:47', '2019-11-28 16:58:47'),
(14, 'Llamada en frío', '2019-11-28 16:58:58', '2019-11-28 16:58:58'),
(15, 'Evento Presencial', '2019-11-28 16:59:09', '2019-11-28 16:59:09'),
(16, 'Webinar', '2019-11-28 16:59:20', '2019-11-28 16:59:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pipelines__typebusinesses`
--

CREATE TABLE `pipelines__typebusinesses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pipelines__typebusinesses`
--

INSERT INTO `pipelines__typebusinesses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Nuevo', '2019-11-28 16:59:43', '2019-11-28 16:59:43'),
(2, 'Renovación', '2019-11-28 16:59:52', '2019-11-28 16:59:52'),
(3, 'Ampliación', '2019-11-28 17:00:02', '2019-11-28 17:00:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reminders`
--

CREATE TABLE `reminders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revisions`
--

CREATE TABLE `revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '{\"core.sidebar.group\":true,\"dashboard.index\":true,\"dashboard.update\":true,\"dashboard.reset\":true,\"media.medias.index\":true,\"media.medias.create\":true,\"media.medias.edit\":true,\"media.medias.destroy\":true,\"media.folders.index\":true,\"media.folders.create\":true,\"media.folders.edit\":true,\"media.folders.destroy\":true,\"menu.menus.index\":true,\"menu.menus.create\":true,\"menu.menus.edit\":true,\"menu.menus.destroy\":true,\"menu.menuitems.index\":true,\"menu.menuitems.create\":true,\"menu.menuitems.edit\":true,\"menu.menuitems.destroy\":true,\"page.pages.index\":true,\"page.pages.create\":true,\"page.pages.edit\":true,\"page.pages.destroy\":true,\"pipelines.sources.index\":true,\"pipelines.sources.create\":true,\"pipelines.sources.edit\":true,\"pipelines.sources.destroy\":true,\"pipelines.countries.index\":true,\"pipelines.countries.create\":true,\"pipelines.countries.edit\":true,\"pipelines.countries.destroy\":true,\"pipelines.contacts.index\":true,\"pipelines.contacts.create\":true,\"pipelines.contacts.edit\":true,\"pipelines.contacts.destroy\":true,\"pipelines.companies.index\":true,\"pipelines.companies.create\":true,\"pipelines.companies.edit\":true,\"pipelines.companies.destroy\":true,\"pipelines.typebusinesses.index\":true,\"pipelines.typebusinesses.create\":true,\"pipelines.typebusinesses.edit\":true,\"pipelines.typebusinesses.destroy\":true,\"pipelines.businesses.index\":true,\"pipelines.businesses.create\":true,\"pipelines.businesses.edit\":true,\"pipelines.businesses.destroy\":true,\"pipelines.products.index\":true,\"pipelines.products.create\":true,\"pipelines.products.edit\":true,\"pipelines.products.destroy\":true,\"pipelines.detailbusinesses.index\":true,\"pipelines.detailbusinesses.create\":true,\"pipelines.detailbusinesses.edit\":true,\"pipelines.detailbusinesses.destroy\":true,\"pipelines.pipelines.index\":true,\"pipelines.pipelines.create\":true,\"pipelines.pipelines.edit\":true,\"pipelines.pipelines.destroy\":true,\"pipelines.pipelinebusinesses.index\":true,\"pipelines.pipelinebusinesses.create\":true,\"pipelines.pipelinebusinesses.edit\":true,\"pipelines.pipelinebusinesses.destroy\":true,\"pipelines.phones.index\":true,\"pipelines.phones.create\":true,\"pipelines.phones.edit\":true,\"pipelines.phones.destroy\":true,\"pipelines.emails.index\":true,\"pipelines.emails.create\":true,\"pipelines.emails.edit\":true,\"pipelines.emails.destroy\":true,\"setting.settings.index\":true,\"setting.settings.edit\":true,\"tag.tags.index\":true,\"tag.tags.create\":true,\"tag.tags.edit\":true,\"tag.tags.destroy\":true,\"translation.translations.index\":true,\"translation.translations.edit\":true,\"translation.translations.import\":true,\"translation.translations.export\":true,\"user.users.index\":true,\"user.users.create\":true,\"user.users.edit\":true,\"user.users.destroy\":true,\"user.roles.index\":true,\"user.roles.create\":true,\"user.roles.edit\":true,\"user.roles.destroy\":true,\"account.api-keys.index\":true,\"account.api-keys.create\":true,\"account.api-keys.destroy\":true,\"workshop.sidebar.group\":true,\"workshop.modules.index\":true,\"workshop.modules.show\":true,\"workshop.modules.update\":true,\"workshop.modules.disable\":true,\"workshop.modules.enable\":true,\"workshop.modules.publish\":true,\"workshop.themes.index\":true,\"workshop.themes.show\":true,\"workshop.themes.publish\":true}', '2019-11-28 08:55:44', '2019-11-28 09:00:16'),
(2, 'user', 'User', NULL, '2019-11-28 08:55:44', '2019-11-28 08:55:44'),
(3, 'qualifier', 'Calificador', '{\"core.sidebar.group\":false,\"dashboard.index\":false,\"dashboard.update\":false,\"dashboard.reset\":false,\"media.medias.index\":false,\"media.medias.create\":false,\"media.medias.edit\":false,\"media.medias.destroy\":false,\"media.folders.index\":false,\"media.folders.create\":false,\"media.folders.edit\":false,\"media.folders.destroy\":false,\"menu.menus.index\":false,\"menu.menus.create\":false,\"menu.menus.edit\":false,\"menu.menus.destroy\":false,\"menu.menuitems.index\":false,\"menu.menuitems.create\":false,\"menu.menuitems.edit\":false,\"menu.menuitems.destroy\":false,\"page.pages.index\":false,\"page.pages.create\":false,\"page.pages.edit\":false,\"page.pages.destroy\":false,\"pipelines.sources.index\":false,\"pipelines.sources.create\":false,\"pipelines.sources.edit\":false,\"pipelines.sources.destroy\":false,\"pipelines.countries.index\":false,\"pipelines.countries.create\":false,\"pipelines.countries.edit\":false,\"pipelines.countries.destroy\":false,\"pipelines.contacts.index\":false,\"pipelines.contacts.create\":false,\"pipelines.contacts.edit\":false,\"pipelines.contacts.destroy\":false,\"pipelines.companies.index\":false,\"pipelines.companies.create\":false,\"pipelines.companies.edit\":false,\"pipelines.companies.destroy\":false,\"pipelines.typebusinesses.index\":false,\"pipelines.typebusinesses.create\":false,\"pipelines.typebusinesses.edit\":false,\"pipelines.typebusinesses.destroy\":false,\"pipelines.businesses.index\":false,\"pipelines.businesses.create\":false,\"pipelines.businesses.edit\":false,\"pipelines.businesses.destroy\":false,\"pipelines.products.index\":false,\"pipelines.products.create\":false,\"pipelines.products.edit\":false,\"pipelines.products.destroy\":false,\"pipelines.detailbusinesses.index\":false,\"pipelines.detailbusinesses.create\":false,\"pipelines.detailbusinesses.edit\":false,\"pipelines.detailbusinesses.destroy\":false,\"pipelines.pipelines.index\":false,\"pipelines.pipelines.create\":false,\"pipelines.pipelines.edit\":false,\"pipelines.pipelines.destroy\":false,\"pipelines.pipelinebusinesses.index\":false,\"pipelines.pipelinebusinesses.create\":false,\"pipelines.pipelinebusinesses.edit\":false,\"pipelines.pipelinebusinesses.destroy\":false,\"pipelines.phones.index\":false,\"pipelines.phones.create\":false,\"pipelines.phones.edit\":false,\"pipelines.phones.destroy\":false,\"pipelines.emails.index\":false,\"pipelines.emails.create\":false,\"pipelines.emails.edit\":false,\"pipelines.emails.destroy\":false,\"setting.settings.index\":false,\"setting.settings.edit\":false,\"tag.tags.index\":false,\"tag.tags.create\":false,\"tag.tags.edit\":false,\"tag.tags.destroy\":false,\"translation.translations.index\":false,\"translation.translations.edit\":false,\"translation.translations.import\":false,\"translation.translations.export\":false,\"user.users.index\":false,\"user.users.create\":false,\"user.users.edit\":false,\"user.users.destroy\":false,\"user.roles.index\":false,\"user.roles.create\":false,\"user.roles.edit\":false,\"user.roles.destroy\":false,\"account.api-keys.index\":false,\"account.api-keys.create\":false,\"account.api-keys.destroy\":false,\"workshop.sidebar.group\":false,\"workshop.modules.index\":false,\"workshop.modules.show\":false,\"workshop.modules.update\":false,\"workshop.modules.disable\":false,\"workshop.modules.enable\":false,\"workshop.modules.publish\":false,\"workshop.themes.index\":false,\"workshop.themes.show\":false,\"workshop.themes.publish\":false}', '2019-11-28 17:04:52', '2019-11-28 17:04:52'),
(4, 'salesman', 'vendedor', '{\"core.sidebar.group\":false,\"dashboard.index\":false,\"dashboard.update\":false,\"dashboard.reset\":false,\"media.medias.index\":false,\"media.medias.create\":false,\"media.medias.edit\":false,\"media.medias.destroy\":false,\"media.folders.index\":false,\"media.folders.create\":false,\"media.folders.edit\":false,\"media.folders.destroy\":false,\"menu.menus.index\":false,\"menu.menus.create\":false,\"menu.menus.edit\":false,\"menu.menus.destroy\":false,\"menu.menuitems.index\":false,\"menu.menuitems.create\":false,\"menu.menuitems.edit\":false,\"menu.menuitems.destroy\":false,\"page.pages.index\":false,\"page.pages.create\":false,\"page.pages.edit\":false,\"page.pages.destroy\":false,\"pipelines.sources.index\":false,\"pipelines.sources.create\":false,\"pipelines.sources.edit\":false,\"pipelines.sources.destroy\":false,\"pipelines.countries.index\":false,\"pipelines.countries.create\":false,\"pipelines.countries.edit\":false,\"pipelines.countries.destroy\":false,\"pipelines.contacts.index\":false,\"pipelines.contacts.create\":false,\"pipelines.contacts.edit\":false,\"pipelines.contacts.destroy\":false,\"pipelines.companies.index\":false,\"pipelines.companies.create\":false,\"pipelines.companies.edit\":false,\"pipelines.companies.destroy\":false,\"pipelines.typebusinesses.index\":false,\"pipelines.typebusinesses.create\":false,\"pipelines.typebusinesses.edit\":false,\"pipelines.typebusinesses.destroy\":false,\"pipelines.businesses.index\":false,\"pipelines.businesses.create\":false,\"pipelines.businesses.edit\":false,\"pipelines.businesses.destroy\":false,\"pipelines.products.index\":false,\"pipelines.products.create\":false,\"pipelines.products.edit\":false,\"pipelines.products.destroy\":false,\"pipelines.detailbusinesses.index\":false,\"pipelines.detailbusinesses.create\":false,\"pipelines.detailbusinesses.edit\":false,\"pipelines.detailbusinesses.destroy\":false,\"pipelines.pipelines.index\":false,\"pipelines.pipelines.create\":false,\"pipelines.pipelines.edit\":false,\"pipelines.pipelines.destroy\":false,\"pipelines.pipelinebusinesses.index\":false,\"pipelines.pipelinebusinesses.create\":false,\"pipelines.pipelinebusinesses.edit\":false,\"pipelines.pipelinebusinesses.destroy\":false,\"pipelines.phones.index\":false,\"pipelines.phones.create\":false,\"pipelines.phones.edit\":false,\"pipelines.phones.destroy\":false,\"pipelines.emails.index\":false,\"pipelines.emails.create\":false,\"pipelines.emails.edit\":false,\"pipelines.emails.destroy\":false,\"setting.settings.index\":false,\"setting.settings.edit\":false,\"tag.tags.index\":false,\"tag.tags.create\":false,\"tag.tags.edit\":false,\"tag.tags.destroy\":false,\"translation.translations.index\":false,\"translation.translations.edit\":false,\"translation.translations.import\":false,\"translation.translations.export\":false,\"user.users.index\":false,\"user.users.create\":false,\"user.users.edit\":false,\"user.users.destroy\":false,\"user.roles.index\":false,\"user.roles.create\":false,\"user.roles.edit\":false,\"user.roles.destroy\":false,\"account.api-keys.index\":false,\"account.api-keys.create\":false,\"account.api-keys.destroy\":false,\"workshop.sidebar.group\":false,\"workshop.modules.index\":false,\"workshop.modules.show\":false,\"workshop.modules.update\":false,\"workshop.modules.disable\":false,\"workshop.modules.enable\":false,\"workshop.modules.publish\":false,\"workshop.themes.index\":false,\"workshop.themes.show\":false,\"workshop.themes.publish\":false}', '2019-11-28 17:05:20', '2019-11-28 17:05:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_users`
--

CREATE TABLE `role_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-11-28 08:56:11', '2019-11-28 08:56:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setting__settings`
--

CREATE TABLE `setting__settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plainValue` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isTranslatable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `setting__settings`
--

INSERT INTO `setting__settings` (`id`, `name`, `plainValue`, `isTranslatable`, `created_at`, `updated_at`) VALUES
(1, 'core::template', 'Flatly', 0, '2019-11-28 08:56:14', '2019-11-28 08:56:14'),
(2, 'core::locales', '[\"es\"]', 0, '2019-11-28 08:56:14', '2019-11-28 08:59:16'),
(3, 'core::site-name', NULL, 1, '2019-11-28 08:59:15', '2019-11-28 08:59:15'),
(4, 'core::site-name-mini', NULL, 1, '2019-11-28 08:59:15', '2019-11-28 08:59:15'),
(5, 'core::site-description', NULL, 1, '2019-11-28 08:59:16', '2019-11-28 08:59:16'),
(6, 'core::analytics-script', NULL, 0, '2019-11-28 08:59:16', '2019-11-28 08:59:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setting__setting_translations`
--

CREATE TABLE `setting__setting_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `setting_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `setting__setting_translations`
--

INSERT INTO `setting__setting_translations` (`id`, `setting_id`, `locale`, `value`, `description`) VALUES
(1, 3, 'en', NULL, NULL),
(2, 4, 'en', NULL, NULL),
(3, 5, 'en', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tag__tagged`
--

CREATE TABLE `tag__tagged` (
  `id` int(10) UNSIGNED NOT NULL,
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taggable_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tag__tags`
--

CREATE TABLE `tag__tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tag__tag_translations`
--

CREATE TABLE `tag__tag_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `throttle`
--

CREATE TABLE `throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translation__translations`
--

CREATE TABLE `translation__translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translation__translation_translations`
--

CREATE TABLE `translation__translation_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `translation_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `permissions`, `last_login`, `first_name`, `last_name`, `created_at`, `updated_at`) VALUES
(1, 'audicrm18@gmail.com', '$2y$10$t8Vcylf9o1KsuN2m0wAN2uAS5GFUFGpj2zN9bwbZClfwOF6gxPzR2', NULL, '2019-11-28 21:05:40', 'admin', 'user', '2019-11-28 08:56:11', '2019-11-28 21:05:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_tokens`
--

CREATE TABLE `user_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `access_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_tokens`
--

INSERT INTO `user_tokens` (`id`, `user_id`, `access_token`, `created_at`, `updated_at`) VALUES
(1, 1, '25b6bf37-81de-4031-afaa-599798e374f9', '2019-11-28 08:56:11', '2019-11-28 08:56:11');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dashboard__widgets`
--
ALTER TABLE `dashboard__widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard__widgets_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `media__files`
--
ALTER TABLE `media__files`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `media__file_translations`
--
ALTER TABLE `media__file_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media__file_translations_file_id_locale_unique` (`file_id`,`locale`),
  ADD KEY `media__file_translations_locale_index` (`locale`);

--
-- Indices de la tabla `media__imageables`
--
ALTER TABLE `media__imageables`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu__menuitems`
--
ALTER TABLE `menu__menuitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu__menuitems_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `menu__menuitem_translations`
--
ALTER TABLE `menu__menuitem_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu__menuitem_translations_menuitem_id_locale_unique` (`menuitem_id`,`locale`),
  ADD KEY `menu__menuitem_translations_locale_index` (`locale`);

--
-- Indices de la tabla `menu__menus`
--
ALTER TABLE `menu__menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu__menu_translations`
--
ALTER TABLE `menu__menu_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu__menu_translations_menu_id_locale_unique` (`menu_id`,`locale`),
  ADD KEY `menu__menu_translations_locale_index` (`locale`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `page__pages`
--
ALTER TABLE `page__pages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `page__page_translations`
--
ALTER TABLE `page__page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page__page_translations_page_id_locale_unique` (`page_id`,`locale`),
  ADD KEY `page__page_translations_locale_index` (`locale`);

--
-- Indices de la tabla `persistences`
--
ALTER TABLE `persistences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persistences_code_unique` (`code`);

--
-- Indices de la tabla `pipelines__businesses`
--
ALTER TABLE `pipelines__businesses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pipelines__businesses_type_id_foreign` (`type_id`),
  ADD KEY `pipelines__businesses_contact_id_foreign` (`contact_id`),
  ADD KEY `pipelines__businesses_seller_id_foreign` (`seller_id`);

--
-- Indices de la tabla `pipelines__companies`
--
ALTER TABLE `pipelines__companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pipelines__companies_country_id_foreign` (`country_id`),
  ADD KEY `pipelines__companies_source_id_foreign` (`source_id`),
  ADD KEY `pipelines__companies_seller_id_foreign` (`seller_id`);

--
-- Indices de la tabla `pipelines__contacts`
--
ALTER TABLE `pipelines__contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pipelines__contacts_company_id_foreign` (`company_id`),
  ADD KEY `pipelines__contacts_country_id_foreign` (`country_id`),
  ADD KEY `pipelines__contacts_source_id_foreign` (`source_id`),
  ADD KEY `pipelines__contacts_seller_id_foreign` (`seller_id`);

--
-- Indices de la tabla `pipelines__countries`
--
ALTER TABLE `pipelines__countries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pipelines__detailbusinesses`
--
ALTER TABLE `pipelines__detailbusinesses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pipelines__detailbusinesses_business_id_foreign` (`business_id`),
  ADD KEY `pipelines__detailbusinesses_product_id_foreign` (`product_id`);

--
-- Indices de la tabla `pipelines__emails`
--
ALTER TABLE `pipelines__emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pipelines__emails_company_id_foreign` (`company_id`);

--
-- Indices de la tabla `pipelines__phones`
--
ALTER TABLE `pipelines__phones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pipelines__phones_company_id_foreign` (`company_id`);

--
-- Indices de la tabla `pipelines__pipelinebusinesses`
--
ALTER TABLE `pipelines__pipelinebusinesses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pipelines__pipelinebusinesses_business_id_foreign` (`business_id`),
  ADD KEY `pipelines__pipelinebusinesses_pipeline_id_foreign` (`pipeline_id`);

--
-- Indices de la tabla `pipelines__pipelines`
--
ALTER TABLE `pipelines__pipelines`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pipelines__products`
--
ALTER TABLE `pipelines__products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pipelines__sources`
--
ALTER TABLE `pipelines__sources`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pipelines__typebusinesses`
--
ALTER TABLE `pipelines__typebusinesses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indices de la tabla `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`);

--
-- Indices de la tabla `setting__settings`
--
ALTER TABLE `setting__settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting__settings_name_unique` (`name`),
  ADD KEY `setting__settings_name_index` (`name`);

--
-- Indices de la tabla `setting__setting_translations`
--
ALTER TABLE `setting__setting_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting__setting_translations_setting_id_locale_unique` (`setting_id`,`locale`),
  ADD KEY `setting__setting_translations_locale_index` (`locale`);

--
-- Indices de la tabla `tag__tagged`
--
ALTER TABLE `tag__tagged`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag__tagged_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`);

--
-- Indices de la tabla `tag__tags`
--
ALTER TABLE `tag__tags`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tag__tag_translations`
--
ALTER TABLE `tag__tag_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag__tag_translations_tag_id_locale_unique` (`tag_id`,`locale`),
  ADD KEY `tag__tag_translations_locale_index` (`locale`);

--
-- Indices de la tabla `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_index` (`user_id`);

--
-- Indices de la tabla `translation__translations`
--
ALTER TABLE `translation__translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translation__translations_key_index` (`key`);

--
-- Indices de la tabla `translation__translation_translations`
--
ALTER TABLE `translation__translation_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_trans_id_locale_unique` (`translation_id`,`locale`),
  ADD KEY `translation__translation_translations_locale_index` (`locale`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_tokens_access_token_unique` (`access_token`),
  ADD KEY `user_tokens_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `dashboard__widgets`
--
ALTER TABLE `dashboard__widgets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `media__files`
--
ALTER TABLE `media__files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `media__file_translations`
--
ALTER TABLE `media__file_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `media__imageables`
--
ALTER TABLE `media__imageables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu__menuitems`
--
ALTER TABLE `menu__menuitems`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu__menuitem_translations`
--
ALTER TABLE `menu__menuitem_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu__menus`
--
ALTER TABLE `menu__menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu__menu_translations`
--
ALTER TABLE `menu__menu_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `page__pages`
--
ALTER TABLE `page__pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `page__page_translations`
--
ALTER TABLE `page__page_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `persistences`
--
ALTER TABLE `persistences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pipelines__businesses`
--
ALTER TABLE `pipelines__businesses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pipelines__companies`
--
ALTER TABLE `pipelines__companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pipelines__contacts`
--
ALTER TABLE `pipelines__contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pipelines__countries`
--
ALTER TABLE `pipelines__countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pipelines__detailbusinesses`
--
ALTER TABLE `pipelines__detailbusinesses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pipelines__emails`
--
ALTER TABLE `pipelines__emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pipelines__phones`
--
ALTER TABLE `pipelines__phones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pipelines__pipelinebusinesses`
--
ALTER TABLE `pipelines__pipelinebusinesses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pipelines__pipelines`
--
ALTER TABLE `pipelines__pipelines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pipelines__products`
--
ALTER TABLE `pipelines__products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pipelines__sources`
--
ALTER TABLE `pipelines__sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `pipelines__typebusinesses`
--
ALTER TABLE `pipelines__typebusinesses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reminders`
--
ALTER TABLE `reminders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `setting__settings`
--
ALTER TABLE `setting__settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `setting__setting_translations`
--
ALTER TABLE `setting__setting_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tag__tagged`
--
ALTER TABLE `tag__tagged`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tag__tags`
--
ALTER TABLE `tag__tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tag__tag_translations`
--
ALTER TABLE `tag__tag_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `translation__translations`
--
ALTER TABLE `translation__translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `translation__translation_translations`
--
ALTER TABLE `translation__translation_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `user_tokens`
--
ALTER TABLE `user_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dashboard__widgets`
--
ALTER TABLE `dashboard__widgets`
  ADD CONSTRAINT `dashboard__widgets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `media__file_translations`
--
ALTER TABLE `media__file_translations`
  ADD CONSTRAINT `media__file_translations_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `media__files` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `menu__menuitems`
--
ALTER TABLE `menu__menuitems`
  ADD CONSTRAINT `menu__menuitems_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu__menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `menu__menuitem_translations`
--
ALTER TABLE `menu__menuitem_translations`
  ADD CONSTRAINT `menu__menuitem_translations_menuitem_id_foreign` FOREIGN KEY (`menuitem_id`) REFERENCES `menu__menuitems` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `menu__menu_translations`
--
ALTER TABLE `menu__menu_translations`
  ADD CONSTRAINT `menu__menu_translations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu__menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `page__page_translations`
--
ALTER TABLE `page__page_translations`
  ADD CONSTRAINT `page__page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `page__pages` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pipelines__businesses`
--
ALTER TABLE `pipelines__businesses`
  ADD CONSTRAINT `pipelines__businesses_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `pipelines__contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pipelines__businesses_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pipelines__businesses_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `pipelines__typebusinesses` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pipelines__companies`
--
ALTER TABLE `pipelines__companies`
  ADD CONSTRAINT `pipelines__companies_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `pipelines__countries` (`id`),
  ADD CONSTRAINT `pipelines__companies_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pipelines__companies_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `pipelines__sources` (`id`);

--
-- Filtros para la tabla `pipelines__contacts`
--
ALTER TABLE `pipelines__contacts`
  ADD CONSTRAINT `pipelines__contacts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `pipelines__companies` (`id`),
  ADD CONSTRAINT `pipelines__contacts_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `pipelines__countries` (`id`),
  ADD CONSTRAINT `pipelines__contacts_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pipelines__contacts_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `pipelines__sources` (`id`);

--
-- Filtros para la tabla `pipelines__detailbusinesses`
--
ALTER TABLE `pipelines__detailbusinesses`
  ADD CONSTRAINT `pipelines__detailbusinesses_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `pipelines__businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pipelines__detailbusinesses_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `pipelines__products` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pipelines__emails`
--
ALTER TABLE `pipelines__emails`
  ADD CONSTRAINT `pipelines__emails_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `pipelines__companies` (`id`);

--
-- Filtros para la tabla `pipelines__phones`
--
ALTER TABLE `pipelines__phones`
  ADD CONSTRAINT `pipelines__phones_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `pipelines__companies` (`id`);

--
-- Filtros para la tabla `pipelines__pipelinebusinesses`
--
ALTER TABLE `pipelines__pipelinebusinesses`
  ADD CONSTRAINT `pipelines__pipelinebusinesses_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `pipelines__businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pipelines__pipelinebusinesses_pipeline_id_foreign` FOREIGN KEY (`pipeline_id`) REFERENCES `pipelines__pipelines` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `setting__setting_translations`
--
ALTER TABLE `setting__setting_translations`
  ADD CONSTRAINT `setting__setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `setting__settings` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tag__tag_translations`
--
ALTER TABLE `tag__tag_translations`
  ADD CONSTRAINT `tag__tag_translations_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tag__tags` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `translation__translation_translations`
--
ALTER TABLE `translation__translation_translations`
  ADD CONSTRAINT `translation__translation_translations_translation_id_foreign` FOREIGN KEY (`translation_id`) REFERENCES `translation__translations` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
