-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 11 2023 г., 12:23
-- Версия сервера: 5.7.39
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `akvamdeko`
--

-- --------------------------------------------------------

--
-- Структура таблицы `backend_access_log`
--

CREATE TABLE `backend_access_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_access_log`
--

INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', '2023-08-14 06:01:00', '2023-08-14 06:01:00'),
(2, 1, '127.0.0.1', '2023-08-14 06:02:48', '2023-08-14 06:02:48'),
(3, 2, '127.0.0.1', '2023-08-14 11:26:29', '2023-08-14 11:26:29'),
(4, 1, '127.0.0.1', '2023-08-14 11:26:53', '2023-08-14 11:26:53'),
(5, 2, '127.0.0.1', '2023-08-14 11:31:15', '2023-08-14 11:31:15'),
(6, 1, '127.0.0.1', '2023-08-14 11:31:49', '2023-08-14 11:31:49'),
(7, 1, '127.0.0.1', '2023-08-15 04:57:41', '2023-08-15 04:57:41'),
(8, 1, '127.0.0.1', '2023-08-15 12:45:04', '2023-08-15 12:45:04'),
(9, 1, '127.0.0.1', '2023-08-15 16:54:06', '2023-08-15 16:54:06');

-- --------------------------------------------------------

--
-- Структура таблицы `backend_users`
--

CREATE TABLE `backend_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_users`
--

INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `metadata`, `is_activated`, `role_id`, `activated_at`, `last_login`, `created_at`, `updated_at`, `deleted_at`, `is_superuser`) VALUES
(1, 'Oleg', '', 'o.oleg', 'netses@rambler.ru', '$2y$10$gKHvY8qfAw3C1k4t8vodXOpbMSYtUHLq9fmwIFs/K.hj7SzOmB20y', NULL, NULL, NULL, '', NULL, 1, 2, NULL, '2023-08-15 16:54:06', '2023-08-14 06:00:30', '2023-08-25 09:15:29', NULL, 1),
(2, '', '', 'mdeko', 'leozex@list.ru', '$2y$10$w7YvQZGU0vbWeSGnVz4bKu9ewL0XWP2VXJjwWYq6MsIqHVVRxFqmG', NULL, NULL, NULL, '{\"cms.manage_content\":-1,\"cms.manage_assets\":-1,\"cms.manage_pages\":-1,\"cms.manage_layouts\":-1,\"cms.manage_partials\":-1,\"cms.manage_themes\":-1,\"cms.manage_theme_options\":-1,\"backend.manage_users\":-1,\"backend.impersonate_users\":-1,\"backend.manage_preferences\":-1,\"backend.manage_branding\":1,\"media.manage_media\":1,\"system.manage_mail_settings\":1,\"winter.builder.manage_plugins\":-1}', NULL, 0, 1, NULL, '2023-08-14 11:31:15', '2023-08-14 11:26:10', '2023-08-14 11:31:46', NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_users_groups`
--

CREATE TABLE `backend_users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_users_groups`
--

INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
(1, 1),
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_groups`
--

CREATE TABLE `backend_user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_groups`
--

INSERT INTO `backend_user_groups` (`id`, `name`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
(1, 'Владельцы', '2023-08-14 06:00:30', '2023-08-14 11:30:27', 'owners', '', 0),
(2, 'Менеджер', '2023-08-14 11:28:49', '2023-08-14 11:28:49', 'menedger', '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_preferences`
--

CREATE TABLE `backend_user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_preferences`
--

INSERT INTO `backend_user_preferences` (`id`, `user_id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 1, 'backend', 'reportwidgets', 'dashboard', '{\"welcome\":{\"class\":\"Backend\\\\ReportWidgets\\\\Welcome\",\"sortOrder\":50,\"configuration\":{\"ocWidgetWidth\":7}},\"systemStatus\":{\"class\":\"System\\\\ReportWidgets\\\\Status\",\"sortOrder\":60,\"configuration\":{\"ocWidgetWidth\":7}}}'),
(2, 1, 'backend', 'hints', 'hidden', '{\"Form-form_1cf1c269ee4723c7e0b0779ff50059edpluginPopup-field-_content\":1,\"builder-version-save-unapplied\":1,\"builder-version-apply\":1,\"builder-version-rollback\":1}'),
(3, 2, 'backend', 'reportwidgets', 'dashboard', '[]'),
(4, 1, 'mdeko_api', 'menu', 'lists', '{\"visible\":[\"id\",\"active\",\"slug\",\"title\",\"updated_at\"],\"order\":[\"id\",\"created_at\",\"order\",\"active\",\"slug\",\"title\",\"meta_title\",\"meta_desc\",\"updated_at\"],\"per_page\":\"20\"}'),
(5, 1, 'mdeko_api', 'contacts', 'lists', '{\"visible\":[\"id\",\"active\",\"title\",\"phone\",\"email\"],\"order\":[\"id\",\"active\",\"title\",\"phone\",\"email\",\"address\",\"social\",\"url\",\"icon\",\"order\",\"created_at\",\"updated_at\"],\"per_page\":\"20\"}'),
(6, 1, 'mdeko_api', 'banner', 'lists', '{\"visible\":[\"id\",\"order\",\"active\",\"title\",\"created_at\",\"updated_at\"],\"order\":[\"id\",\"order\",\"active\",\"title\",\"slug\",\"text\",\"created_at\",\"updated_at\"],\"per_page\":\"20\"}'),
(7, 1, 'mdeko_api', 'category', 'lists', '{\"visible\":[\"id\",\"order\",\"active\",\"title\",\"slug\"],\"order\":[\"id\",\"order\",\"active\",\"title\",\"slug\",\"text\",\"img\",\"icon\"],\"per_page\":\"20\"}'),
(8, 1, 'mdeko_api', 'item', 'lists', '{\"visible\":[\"id\",\"order\",\"active\",\"title\",\"category\",\"hit\"],\"order\":[\"id\",\"order\",\"active\",\"title\",\"slug\",\"category\",\"hit\",\"created_at\",\"updated_at\"],\"per_page\":\"20\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_roles`
--

CREATE TABLE `backend_user_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_roles`
--

INSERT INTO `backend_user_roles` (`id`, `name`, `code`, `description`, `permissions`, `is_system`, `created_at`, `updated_at`) VALUES
(1, 'Publisher', 'publisher', '', '', 1, '2023-08-14 06:00:30', '2023-08-14 11:29:17'),
(2, 'Developer', 'developer', '', '', 1, '2023-08-14 06:00:30', '2023-08-14 11:29:25');

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_throttle`
--

CREATE TABLE `backend_user_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_throttle`
--

INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
(1, 1, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL),
(2, 2, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_theme_data`
--

CREATE TABLE `cms_theme_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_theme_logs`
--

CREATE TABLE `cms_theme_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_theme_templates`
--

CREATE TABLE `cms_theme_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(10) UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `deferred_bindings`
--

CREATE TABLE `deferred_bindings` (
  `id` int(10) UNSIGNED NOT NULL,
  `master_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pivot_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `session_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `mdeko_api_banner`
--

CREATE TABLE `mdeko_api_banner` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` smallint(6) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `mdeko_api_banner`
--

INSERT INTO `mdeko_api_banner` (`id`, `created_at`, `updated_at`, `order`, `active`, `slug`, `text`, `title`, `img`, `icon`) VALUES
(1, '2023-08-14 17:28:06', '2023-08-14 17:28:06', 0, 1, '', '<p>Компания МДЕКО создает продукты, объединяющие силы природных компонентов\n	<br>и эффективность современных технологий.</p>\n\n<p>Мы начали свое развитие в 2014 году и, благодаря слаженной\n	<br>работе команды единомышленников, постоянно расширяем производство и вводим новые линии.\n	<br>Первые продукты от МДЕКО – это инновационные, экологически чистые торфяные удобрения\n	<br>для обогащения почвы и увеличения урожайности.</p>\n\n<p>Торфогуматы не имеют аналогов и являются уникальной разработкой специалистов МДЕКО,\n	<br>со временем ассортимент дополнили продукты\n	<br>для красоты и здоровья и появился отдельный бренд АкваМДЕКО.\n	<br>Косметическая линия также полностью разработана специалистами МДЕКО\n	<br>с использованием природных ингредиентов. Мы динамично развиваемся и занимаем лидирующие позиции\n	<br>на рынке натуральной косметики России и СНГ.</p>', 'О компании', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `mdeko_api_callback`
--

CREATE TABLE `mdeko_api_callback` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `mdeko_api_callback`
--

INSERT INTO `mdeko_api_callback` (`id`, `ip`, `page`, `phone`, `text`, `email`, `name`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-19 18:09:20', '2023-08-19 18:09:20'),
(2, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-19 18:12:19', '2023-08-19 18:12:19'),
(3, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-19 18:14:34', '2023-08-19 18:14:34'),
(4, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-19 18:15:04', '2023-08-19 18:15:04'),
(5, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-19 18:15:30', '2023-08-19 18:15:30'),
(6, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-19 19:12:23', '2023-08-19 19:12:23'),
(7, '127.0.0.1', NULL, '0', NULL, NULL, NULL, '2023-08-25 08:43:43', '2023-08-25 08:43:43'),
(8, '127.0.0.1', NULL, '0', NULL, NULL, NULL, '2023-08-25 08:45:50', '2023-08-25 08:45:50'),
(9, '127.0.0.1', NULL, '0', NULL, NULL, NULL, '2023-08-25 08:46:52', '2023-08-25 08:46:52'),
(10, '127.0.0.1', NULL, '0', NULL, NULL, NULL, '2023-08-25 08:48:32', '2023-08-25 08:48:32'),
(11, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-25 08:50:21', '2023-08-25 08:50:21'),
(12, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-25 08:51:10', '2023-08-25 08:51:10'),
(13, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-25 08:53:19', '2023-08-25 08:53:19'),
(14, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-25 08:56:17', '2023-08-25 08:56:17'),
(15, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-25 08:58:55', '2023-08-25 08:58:55'),
(16, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-25 08:59:31', '2023-08-25 08:59:31'),
(17, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-25 09:00:41', '2023-08-25 09:00:41'),
(18, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-25 09:01:06', '2023-08-25 09:01:06'),
(19, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-25 09:04:30', '2023-08-25 09:04:30'),
(20, '127.0.0.1', NULL, NULL, NULL, NULL, NULL, '2023-08-25 09:06:30', '2023-08-25 09:06:30'),
(21, '127.0.0.1', 'informatsiya', '79963466371', 'testtesttesttesttest', 'civilitys@gmail.com', 'Users', '2023-08-25 09:08:13', '2023-08-25 09:08:13');

-- --------------------------------------------------------

--
-- Структура таблицы `mdeko_api_category`
--

CREATE TABLE `mdeko_api_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `mdeko_api_category`
--

INSERT INTO `mdeko_api_category` (`id`, `order`, `active`, `title`, `text`, `slug`, `img`, `icon`, `meta_title`, `meta_desc`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Kосметика для лица', '<p>&nbsp;text text text</p>', 'face', '/sec.webp', '/icon/face.svg', 'Kосметика для лица', 'Kосметика для лица', '2023-08-14 17:37:56', '2023-08-14 17:40:22'),
(2, 0, 1, 'Косметика для тела', '', 'body', '/sec.webp', '/icon/body.svg', 'Косметика для тела', 'Косметика для тела', '2023-08-14 17:41:49', '2023-08-14 17:41:49'),
(3, 0, 1, 'Косметика для волос', '<p>text text text text 3</p>', 'hair', '/sec.webp', '/icon/hair.svg', 'Косметика для волос', 'Косметика для волос', '2023-08-14 17:43:22', '2023-08-14 17:43:22'),
(4, 0, 1, 'Торфогуматы', '<p>slug переименовал с &nbsp;peathumates в torfogumaty</p>', 'torfogumaty', '/sec.webp', '/icon/peathumates.svg', 'Торфогуматы', 'Торфогуматы', '2023-08-14 17:45:00', '2023-08-14 17:46:25');

-- --------------------------------------------------------

--
-- Структура таблицы `mdeko_api_contacts`
--

CREATE TABLE `mdeko_api_contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` text COLLATE utf8mb4_unicode_ci,
  `social` text COLLATE utf8mb4_unicode_ci,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `order` smallint(6) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `mdeko_api_contacts`
--

INSERT INTO `mdeko_api_contacts` (`id`, `email`, `address`, `city`, `social`, `icon`, `active`, `order`, `created_at`, `updated_at`) VALUES
(1, 'info@akvamdeko.ru', 'Россия, 196006, г. Санкт-Петербург, ул. Цветочная, д. 7', '[{\"name\":\"\\u043f\\u043e \\u0420\\u043e\\u0441\\u0441\\u0438\\u0438\",\"phone\":\"8 (800) 505-4-345\",\"icon\":\"\\/icon\\/smartphone.svg\"},{\"name\":\"\\u043f\\u043e \\u0421\\u0430\\u043d\\u043a\\u0442-\\u041f\\u0435\\u0442\\u0435\\u0440\\u0431\\u0443\\u0440\\u0433\\u0443\",\"phone\":\"8 (812) 388-71-28\",\"icon\":\"\\/icon\\/phone.svg\"}]', '[]', NULL, 1, 1, '2023-08-14 17:03:29', '2023-08-15 15:06:09');

-- --------------------------------------------------------

--
-- Структура таблицы `mdeko_api_item`
--

CREATE TABLE `mdeko_api_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `order` smallint(6) NOT NULL DEFAULT '0',
  `hit` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `mini_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider` text COLLATE utf8mb4_unicode_ci,
  `article` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_min` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_max` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `composition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applications` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restriction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight_no_box` smallint(6) DEFAULT NULL,
  `weight_box` smallint(6) DEFAULT NULL,
  `height_box` smallint(6) DEFAULT NULL,
  `width_box` smallint(6) DEFAULT NULL,
  `best_before_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserve_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserve_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserve_3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserve_4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserve_5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `mdeko_api_item`
--

INSERT INTO `mdeko_api_item` (`id`, `category_id`, `category_slug`, `created_at`, `updated_at`, `active`, `order`, `hit`, `slug`, `title`, `text`, `mini_text`, `slider`, `article`, `img`, `icon`, `url`, `price_min`, `price_max`, `composition`, `applications`, `storage`, `restriction`, `volum`, `weight_no_box`, `weight_box`, `height_box`, `width_box`, `best_before_date`, `action`, `purpose`, `reserve_1`, `reserve_2`, `reserve_3`, `reserve_4`, `reserve_5`, `meta_title`, `meta_desc`) VALUES
(1, NULL, 'face', '2023-08-15 12:54:20', '2023-08-16 12:45:04', 1, 0, 1, 'item', 'Термальная вода АкваМДЕКО с пантенолом и морской солью, 250 мл.', '<h4>НАТУРАЛЬНЫЙ СОЛЕВОЙ СКРАБ ДЛЯ ТЕЛА МДЕКО С ТОРФОМ И ДЁГТЕМ АНТИЦЕЛЛЮЛИТНЫ</h4>\n\n<p>Уникальная термальная вода на основе структурированной артезианской с пантенолом и морской солью. Насыщает кожу полезными солями и микроэлементами, поддерживает водно-липидный баланс. Быстро восстанавливает потерю влаги, возвращая коже бархатистость, комфорт и сияние! Омолаживающий эффект лица! Повышает защитный потенциал клеток эпидермиса, помогает противостоять оксидативному стрессу и формирует защиту против свободных радикалов. Хорошо успокаивает раздраженные участки кожи, препятствует возрастным изменениям. Обладает противовоспалительным, антибактериальным и регенерирующим действием.</p>\n\n<p>Применение: распылить и оставить на коже, не подсушивать и не промокать, применяется ежедневно.</p>\n\n<p>Основные эффекты от применения термальной воды «АкваМДЕКО»:</p>\n\n<ol>\n	<li>- Освежает, увлажняет и предотвращает трансэпидермальную потерю влаги, смягчает кожу;</li>\n	<li>- Препятствует возрастным изменениям;</li>\n	<li>- Успокаивает кожу, снимает раздражение, минимизирует дискомфорт и восстанавливает после длительной инсоляции или травматичных косметологических процедур;</li>\n	<li>- Помогает клеткам противостоять оксидативному стрессу и формирует защиту против свободных радикалов;</li>\n	<li>- Обладает противовоспалительным, антибактериальным и регенерирующим действием;</li>\n	<li>- Нормализует pH-баланс кожи;</li>\n	<li>- Сокращает чрезмерный блеск лица, абсорбирует себум;</li>\n	<li>- Снимает чувство стянутости кожи после умывания;</li>\n	<li>- Снимает отечность тканей;</li>\n	<li>- Улучшает обменные процессы кожи и насыщает ее кислородом;</li>\n</ol>\n\n<p><strong>Термальная вода «АкваМДЕКО» — рождённая самой Природой!</strong></p>', '<p>Отшелушивающий, питание и уход за кожей тела, Антицеллюлитный эффект</p>', '[{\"img\":\"\\/item.webp\",\"alt\":\"alt 1\"},{\"img\":\"\\/item.webp\",\"alt\":\"alt 2\"},{\"img\":\"\\/item.webp\",\"alt\":\"alt 3\"}]', '319', '/item.webp', NULL, '', '1040', NULL, 'вода, сульфат, магния, пантенол, морская соль.', 'Применение Применение Применение Применение', 'Хранение Хранение Хранение Хранение', '14+', '250мл', 333, 111, 222, 444, '36мес', 'Действие', 'Назначение', NULL, NULL, NULL, NULL, NULL, 'Термальная вода', 'Термальная вода'),
(2, NULL, 'face', '2023-08-15 12:54:43', '2023-08-15 13:32:11', 1, 0, 0, 'item1', 'Item1', '', '', '[]', '', '/item.webp', NULL, '', '333', NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
(3, NULL, 'face', '2023-08-15 12:54:53', '2023-08-15 13:37:46', 1, 0, 1, 'item2', 'Item2', '', '', '[]', '', '', NULL, '', '444', NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
(4, NULL, 'face', '2023-08-15 12:55:02', '2023-08-15 13:32:34', 1, 0, 1, 'item3', 'Item3', '', '', '[]', '', '/item.webp', NULL, '', '5550', NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
(5, NULL, 'body', '2023-08-15 12:55:17', '2023-08-15 13:32:25', 1, 0, 0, 'item4', 'Item4', '', '', '[]', '', '/item.webp', NULL, '', '111', NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `mdeko_api_menu`
--

CREATE TABLE `mdeko_api_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` smallint(6) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `mdeko_api_menu`
--

INSERT INTO `mdeko_api_menu` (`id`, `created_at`, `updated_at`, `order`, `slug`, `title`, `img`, `icon`, `meta_title`, `meta_desc`, `active`) VALUES
(1, '2023-08-14 11:58:08', '2023-08-15 17:21:22', 0, 'catalog', 'Каталог', '/sec.webp', '', 'Каталог', 'Каталог akvamdeko', 1),
(2, '2023-08-14 14:57:13', '2023-08-14 16:35:12', 0, 'kompaniya', 'О компании', '/main.webp', '', 'О компании', 'О компании', 1),
(3, '2023-08-14 14:58:43', '2023-08-14 16:35:12', 0, 'informatsiya', 'Оптовая продажа', '/sec.webp', '', 'Оптовая продажа', 'Оптовая продажа', 1),
(4, '2023-08-14 14:59:32', '2023-08-14 16:35:12', 0, 'kontakty', 'Контакты', '/main.webp', '', 'Контакты', 'Контакты', 1),
(5, '2023-08-14 15:00:00', '2023-08-14 16:35:12', 0, 'cart', 'Корзина', '/main.webp', '', 'Корзина', 'Корзина', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `mdeko_api_order`
--

CREATE TABLE `mdeko_api_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sum` int(11) NOT NULL DEFAULT '0',
  `clientid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderid` smallint(6) DEFAULT NULL,
  `key` int(11) DEFAULT NULL,
  `service_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ps_id` int(11) DEFAULT NULL,
  `batch_date` date DEFAULT NULL,
  `fop_receipt_key` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `card_number` int(11) DEFAULT NULL,
  `card_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_expiry` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `item_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `houseNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_payment` tinyint(1) NOT NULL DEFAULT '0',
  `delivery` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_10_01_000001_Db_Deferred_Bindings', 1),
(2, '2013_10_01_000002_Db_System_Files', 1),
(3, '2013_10_01_000003_Db_System_Plugin_Versions', 1),
(4, '2013_10_01_000004_Db_System_Plugin_History', 1),
(5, '2013_10_01_000005_Db_System_Settings', 1),
(6, '2013_10_01_000006_Db_System_Parameters', 1),
(7, '2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
(8, '2013_10_01_000008_Db_System_Mail_Templates', 1),
(9, '2013_10_01_000009_Db_System_Mail_Layouts', 1),
(10, '2014_10_01_000010_Db_Jobs', 1),
(11, '2014_10_01_000011_Db_System_Event_Logs', 1),
(12, '2014_10_01_000012_Db_System_Request_Logs', 1),
(13, '2014_10_01_000013_Db_System_Sessions', 1),
(14, '2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
(15, '2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
(16, '2015_10_01_000016_Db_Cache', 1),
(17, '2015_10_01_000017_Db_System_Revisions', 1),
(18, '2015_10_01_000018_Db_FailedJobs', 1),
(19, '2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
(20, '2016_10_01_000020_Db_System_Timestamp_Fix', 1),
(21, '2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session', 1),
(22, '2017_10_01_000021_Db_System_Sessions_Update', 1),
(23, '2017_10_01_000022_Db_Jobs_FailedJobs_Update', 1),
(24, '2017_10_01_000023_Db_System_Mail_Partials', 1),
(25, '2017_10_23_000024_Db_System_Mail_Layouts_Add_Options_Field', 1),
(26, '2021_10_01_000025_Db_Add_Pivot_Data_To_Deferred_Bindings', 1),
(27, '2022_08_06_000026_Db_System_Add_App_Birthday_Date', 1),
(28, '2022_10_14_000027_Db_Jobs_FailedJobs_Update', 1),
(29, '2013_10_01_000001_Db_Backend_Users', 2),
(30, '2013_10_01_000002_Db_Backend_User_Groups', 2),
(31, '2013_10_01_000003_Db_Backend_Users_Groups', 2),
(32, '2013_10_01_000004_Db_Backend_User_Throttle', 2),
(33, '2014_01_04_000005_Db_Backend_User_Preferences', 2),
(34, '2014_10_01_000006_Db_Backend_Access_Log', 2),
(35, '2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
(36, '2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
(37, '2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
(38, '2017_10_01_000010_Db_Backend_User_Roles', 2),
(39, '2018_12_16_000011_Db_Backend_Add_Deleted_At', 2),
(40, '2023_02_16_000012_Db_Backend_Add_User_Metadata', 2),
(41, '2014_10_01_000001_Db_Cms_Theme_Data', 3),
(42, '2016_10_01_000002_Db_Cms_Timestamp_Fix', 3),
(43, '2017_10_01_000003_Db_Cms_Theme_Logs', 3),
(44, '2018_11_01_000001_Db_Cms_Theme_Templates', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_event_logs`
--

CREATE TABLE `system_event_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_event_logs`
--

INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(1, 'info', 'Request data:', NULL, '2023-08-19 19:57:03', '2023-08-19 19:57:03'),
(2, 'info', 'Request data:', NULL, '2023-08-19 19:57:51', '2023-08-19 19:57:51'),
(3, 'info', 'Request data:', NULL, '2023-08-19 19:59:49', '2023-08-19 19:59:49'),
(4, 'error', 'Error: Call to a member function all() on array in D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php:134\nStack trace:\n#0 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\CallableDispatcher.php(40): System\\Classes\\PluginManager->{closure}()\n#1 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(237): Illuminate\\Routing\\CallableDispatcher->dispatch()\n#2 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(208): Illuminate\\Routing\\Route->runCallable()\n#3 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#4 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#5 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#6 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(799): Illuminate\\Pipeline\\Pipeline->then()\n#7 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack()\n#8 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute()\n#9 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#10 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Winter\\Storm\\Router\\CoreRouter->dispatch()\n#11 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#12 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#13 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#14 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#15 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#16 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle()\n#17 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle()\n#19 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\offline\\cors\\classes\\HandleCors.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): OFFLINE\\CORS\\Classes\\HandleCors->handle()\n#21 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then()\n#23 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#24 D:\\OSPanel\\domains\\mdeko\\backend\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#25 {main}', NULL, '2023-08-19 20:00:13', '2023-08-19 20:00:13'),
(5, 'info', 'Request data:', NULL, '2023-08-19 20:00:51', '2023-08-19 20:00:51'),
(6, 'info', 'Request data:', NULL, '2023-08-19 20:02:33', '2023-08-19 20:02:33'),
(7, 'info', 'Request data:', NULL, '2023-08-19 20:02:57', '2023-08-19 20:02:57'),
(8, 'error', 'ErrorException: Undefined array key \"name\" in D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php:134\nStack trace:\n#0 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(270): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php(134): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\CallableDispatcher.php(40): System\\Classes\\PluginManager->{closure}()\n#3 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(237): Illuminate\\Routing\\CallableDispatcher->dispatch()\n#4 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(208): Illuminate\\Routing\\Route->runCallable()\n#5 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#6 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#7 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#8 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(799): Illuminate\\Pipeline\\Pipeline->then()\n#9 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack()\n#10 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute()\n#11 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#12 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Winter\\Storm\\Router\\CoreRouter->dispatch()\n#13 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#14 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#15 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#16 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#17 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle()\n#19 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle()\n#21 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\offline\\cors\\classes\\HandleCors.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): OFFLINE\\CORS\\Classes\\HandleCors->handle()\n#23 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then()\n#25 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#26 D:\\OSPanel\\domains\\mdeko\\backend\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#27 {main}', NULL, '2023-08-19 20:03:51', '2023-08-19 20:03:51'),
(9, 'error', 'ErrorException: Undefined array key \"name\" in D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php:134\nStack trace:\n#0 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(270): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php(134): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\CallableDispatcher.php(40): System\\Classes\\PluginManager->{closure}()\n#3 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(237): Illuminate\\Routing\\CallableDispatcher->dispatch()\n#4 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(208): Illuminate\\Routing\\Route->runCallable()\n#5 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#6 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#7 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#8 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(799): Illuminate\\Pipeline\\Pipeline->then()\n#9 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack()\n#10 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute()\n#11 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#12 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Winter\\Storm\\Router\\CoreRouter->dispatch()\n#13 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#14 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#15 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#16 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#17 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle()\n#19 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle()\n#21 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\offline\\cors\\classes\\HandleCors.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): OFFLINE\\CORS\\Classes\\HandleCors->handle()\n#23 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then()\n#25 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#26 D:\\OSPanel\\domains\\mdeko\\backend\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#27 {main}', NULL, '2023-08-19 20:04:18', '2023-08-19 20:04:18'),
(10, 'info', 'Request data:', NULL, '2023-08-19 20:05:02', '2023-08-19 20:05:02'),
(11, 'info', 'Request data:', NULL, '2023-08-19 20:07:30', '2023-08-19 20:07:30'),
(12, 'info', 'Request data:', NULL, '2023-08-19 20:07:48', '2023-08-19 20:07:48'),
(13, 'error', 'ErrorException: Undefined array key \"name\" in D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php:134\nStack trace:\n#0 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(270): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php(134): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\CallableDispatcher.php(40): System\\Classes\\PluginManager->{closure}()\n#3 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(237): Illuminate\\Routing\\CallableDispatcher->dispatch()\n#4 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(208): Illuminate\\Routing\\Route->runCallable()\n#5 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#6 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#7 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#8 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(799): Illuminate\\Pipeline\\Pipeline->then()\n#9 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack()\n#10 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute()\n#11 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#12 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Winter\\Storm\\Router\\CoreRouter->dispatch()\n#13 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#14 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#15 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#16 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#17 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle()\n#19 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle()\n#21 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\offline\\cors\\classes\\HandleCors.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): OFFLINE\\CORS\\Classes\\HandleCors->handle()\n#23 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then()\n#25 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#26 D:\\OSPanel\\domains\\mdeko\\backend\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#27 {main}', NULL, '2023-08-19 20:11:06', '2023-08-19 20:11:06'),
(14, 'error', 'ErrorException: Undefined array key \"name\" in D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php:134\nStack trace:\n#0 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(270): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php(134): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\CallableDispatcher.php(40): System\\Classes\\PluginManager->{closure}()\n#3 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(237): Illuminate\\Routing\\CallableDispatcher->dispatch()\n#4 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(208): Illuminate\\Routing\\Route->runCallable()\n#5 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#6 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#7 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#8 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(799): Illuminate\\Pipeline\\Pipeline->then()\n#9 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack()\n#10 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute()\n#11 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#12 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Winter\\Storm\\Router\\CoreRouter->dispatch()\n#13 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#14 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#15 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#16 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#17 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle()\n#19 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle()\n#21 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\offline\\cors\\classes\\HandleCors.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): OFFLINE\\CORS\\Classes\\HandleCors->handle()\n#23 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then()\n#25 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#26 D:\\OSPanel\\domains\\mdeko\\backend\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#27 {main}', NULL, '2023-08-19 20:11:26', '2023-08-19 20:11:26'),
(15, 'error', 'ErrorException: Undefined array key \"name\" in D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php:134\nStack trace:\n#0 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(270): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php(134): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\CallableDispatcher.php(40): System\\Classes\\PluginManager->{closure}()\n#3 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(237): Illuminate\\Routing\\CallableDispatcher->dispatch()\n#4 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(208): Illuminate\\Routing\\Route->runCallable()\n#5 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#6 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#7 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#8 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(799): Illuminate\\Pipeline\\Pipeline->then()\n#9 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack()\n#10 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute()\n#11 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#12 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Winter\\Storm\\Router\\CoreRouter->dispatch()\n#13 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#14 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#15 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#16 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#17 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle()\n#19 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle()\n#21 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\offline\\cors\\classes\\HandleCors.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): OFFLINE\\CORS\\Classes\\HandleCors->handle()\n#23 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then()\n#25 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#26 D:\\OSPanel\\domains\\mdeko\\backend\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#27 {main}', NULL, '2023-08-25 08:30:20', '2023-08-25 08:30:20'),
(16, 'error', 'Illuminate\\Database\\Eloquent\\MassAssignmentException: Add [ip] to fillable property to allow mass assignment on [Mdeko\\Api\\Models\\Callback]. in D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php:523\nStack trace:\n#0 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Database\\Model.php(85): Illuminate\\Database\\Eloquent\\Model->fill()\n#1 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Database\\Model.php(106): Winter\\Storm\\Database\\Model->__construct()\n#2 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php(176): Winter\\Storm\\Database\\Model::create()\n#3 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\CallableDispatcher.php(40): System\\Classes\\PluginManager->{closure}()\n#4 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(237): Illuminate\\Routing\\CallableDispatcher->dispatch()\n#5 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(208): Illuminate\\Routing\\Route->runCallable()\n#6 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#7 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#8 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#9 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(799): Illuminate\\Pipeline\\Pipeline->then()\n#10 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack()\n#11 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute()\n#12 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#13 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Winter\\Storm\\Router\\CoreRouter->dispatch()\n#14 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#15 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#16 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#17 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#18 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#19 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle()\n#20 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle()\n#22 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\offline\\cors\\classes\\HandleCors.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): OFFLINE\\CORS\\Classes\\HandleCors->handle()\n#24 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#25 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then()\n#26 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#27 D:\\OSPanel\\domains\\mdeko\\backend\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#28 {main}', NULL, '2023-08-25 08:40:36', '2023-08-25 08:40:36'),
(17, 'info', 'Request data:', NULL, '2023-08-25 08:58:55', '2023-08-25 08:58:55'),
(18, 'info', 'Request data:', NULL, '2023-08-25 08:59:31', '2023-08-25 08:59:31'),
(19, 'info', 'Request data:', NULL, '2023-08-25 09:00:41', '2023-08-25 09:00:41'),
(20, 'info', 'Request data:', NULL, '2023-08-25 09:01:06', '2023-08-25 09:01:06'),
(21, 'error', 'TypeError: json_decode(): Argument #1 ($json) must be of type string, stdClass given in D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php:151\nStack trace:\n#0 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php(151): json_decode()\n#1 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\CallableDispatcher.php(40): System\\Classes\\PluginManager->{closure}()\n#2 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(237): Illuminate\\Routing\\CallableDispatcher->dispatch()\n#3 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(208): Illuminate\\Routing\\Route->runCallable()\n#4 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#5 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#6 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#7 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(799): Illuminate\\Pipeline\\Pipeline->then()\n#8 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack()\n#9 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute()\n#10 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#11 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Winter\\Storm\\Router\\CoreRouter->dispatch()\n#12 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#13 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#14 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#15 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#16 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#17 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle()\n#18 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#19 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle()\n#20 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\offline\\cors\\classes\\HandleCors.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#21 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): OFFLINE\\CORS\\Classes\\HandleCors->handle()\n#22 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#23 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then()\n#24 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#25 D:\\OSPanel\\domains\\mdeko\\backend\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#26 {main}', NULL, '2023-08-25 09:03:31', '2023-08-25 09:03:31'),
(22, 'info', 'Request data:', NULL, '2023-08-25 09:04:30', '2023-08-25 09:04:30'),
(23, 'error', 'ErrorException: Attempt to read property \"name\" on string in D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php:153\nStack trace:\n#0 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Bootstrap\\HandleExceptions.php(270): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\mdeko\\api\\routes.php(153): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\CallableDispatcher.php(40): System\\Classes\\PluginManager->{closure}()\n#3 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(237): Illuminate\\Routing\\CallableDispatcher->dispatch()\n#4 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(208): Illuminate\\Routing\\Route->runCallable()\n#5 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(798): Illuminate\\Routing\\Route->run()\n#6 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#7 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#8 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(799): Illuminate\\Pipeline\\Pipeline->then()\n#9 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(776): Illuminate\\Routing\\Router->runRouteWithinStack()\n#10 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(740): Illuminate\\Routing\\Router->runRoute()\n#11 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#12 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(190): Winter\\Storm\\Router\\CoreRouter->dispatch()\n#13 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(141): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#14 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance.php(86): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#15 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\PreventRequestsDuringMaintenance->handle()\n#16 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#17 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Foundation\\Http\\Middleware\\CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle()\n#19 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\winter\\storm\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle()\n#21 D:\\OSPanel\\domains\\mdeko\\backend\\plugins\\offline\\cors\\classes\\HandleCors.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): OFFLINE\\CORS\\Classes\\HandleCors->handle()\n#23 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(165): Illuminate\\Pipeline\\Pipeline->then()\n#25 D:\\OSPanel\\domains\\mdeko\\backend\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(134): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#26 D:\\OSPanel\\domains\\mdeko\\backend\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle()\n#27 {main}', NULL, '2023-08-25 09:05:57', '2023-08-25 09:05:57'),
(24, 'info', 'Request data:', NULL, '2023-08-25 09:06:30', '2023-08-25 09:06:30');

-- --------------------------------------------------------

--
-- Структура таблицы `system_files`
--

CREATE TABLE `system_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_mail_layouts`
--

CREATE TABLE `system_mail_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_mail_layouts`
--

INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `options`, `created_at`, `updated_at`) VALUES
(1, 'Default layout', 'default', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>', '{{ content|raw }}', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2023-08-14 06:00:30', '2023-08-14 06:00:30'),
(2, 'System layout', 'system', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2023-08-14 06:00:30', '2023-08-14 06:00:30');

-- --------------------------------------------------------

--
-- Структура таблицы `system_mail_partials`
--

CREATE TABLE `system_mail_partials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_mail_templates`
--

CREATE TABLE `system_mail_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_parameters`
--

CREATE TABLE `system_parameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_parameters`
--

INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 'system', 'app', 'birthday', '\"2023-08-14T09:00:29.063778Z\"'),
(2, 'system', 'update', 'count', '0'),
(3, 'system', 'update', 'retry', '1692178375'),
(4, 'system', 'core', 'build', '\"1.2.3\"'),
(5, 'system', 'core', 'modified', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `system_plugin_history`
--

CREATE TABLE `system_plugin_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_plugin_history`
--

INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
(3, 'Winter.Builder', 'comment', '1.0.1', 'Initialize plugin.', '2023-08-14 06:32:05'),
(4, 'Winter.Builder', 'comment', '1.0.2', 'Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.', '2023-08-14 06:32:05'),
(5, 'Winter.Builder', 'comment', '1.0.3', 'Improved handling of the enum data type.', '2023-08-14 06:32:05'),
(6, 'Winter.Builder', 'comment', '1.0.4', 'Added user permissions to work with the Builder.', '2023-08-14 06:32:05'),
(7, 'Winter.Builder', 'comment', '1.0.5', 'Fixed permissions registration.', '2023-08-14 06:32:05'),
(8, 'Winter.Builder', 'comment', '1.0.6', 'Fixed front-end record ordering in the Record List component.', '2023-08-14 06:32:05'),
(9, 'Winter.Builder', 'comment', '1.0.7', 'Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.', '2023-08-14 06:32:05'),
(10, 'Winter.Builder', 'comment', '1.0.8', 'Added the Reorder Controller behavior.', '2023-08-14 06:32:05'),
(11, 'Winter.Builder', 'comment', '1.0.9', 'Minor API and UI updates.', '2023-08-14 06:32:05'),
(12, 'Winter.Builder', 'comment', '1.0.10', 'Minor styling update.', '2023-08-14 06:32:05'),
(13, 'Winter.Builder', 'comment', '1.0.11', 'Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.', '2023-08-14 06:32:05'),
(14, 'Winter.Builder', 'comment', '1.0.12', 'Added support for the Trigger property to the Media Finder widget configuration. Names of form fields and list columns definition files can now contain underscores.', '2023-08-14 06:32:05'),
(15, 'Winter.Builder', 'comment', '1.0.13', 'Minor styling fix on the database editor.', '2023-08-14 06:32:05'),
(16, 'Winter.Builder', 'comment', '1.0.14', 'Added support for published_at timestamp field', '2023-08-14 06:32:05'),
(17, 'Winter.Builder', 'comment', '1.0.15', 'Fixed a bug where saving a localization string in Inspector could cause a JavaScript error. Added support for Timestamps and Soft Deleting for new models.', '2023-08-14 06:32:05'),
(18, 'Winter.Builder', 'comment', '1.0.16', 'Fixed a bug when saving a form with the Repeater widget in a tab could create invalid fields in the form\'s outside area. Added a check that prevents creating localization strings inside other existing strings.', '2023-08-14 06:32:05'),
(19, 'Winter.Builder', 'comment', '1.0.17', 'Added support Trigger attribute support for RecordFinder and Repeater form widgets.', '2023-08-14 06:32:05'),
(20, 'Winter.Builder', 'comment', '1.0.18', 'Fixes a bug where \'::class\' notations in a model class definition could prevent the model from appearing in the Builder model list. Added emptyOption property support to the dropdown form control.', '2023-08-14 06:32:05'),
(21, 'Winter.Builder', 'comment', '1.0.19', 'Added a feature allowing to add all database columns to a list definition. Added max length validation for database table and column names.', '2023-08-14 06:32:05'),
(22, 'Winter.Builder', 'comment', '1.0.20', 'Fixes a bug where form the builder could trigger the \"current.hasAttribute is not a function\" error.', '2023-08-14 06:32:05'),
(23, 'Winter.Builder', 'comment', '1.0.21', 'Back-end navigation sort order updated.', '2023-08-14 06:32:05'),
(24, 'Winter.Builder', 'comment', '1.0.22', 'Added scopeValue property to the RecordList component.', '2023-08-14 06:32:05'),
(25, 'Winter.Builder', 'comment', '1.0.23', 'Added support for balloon-selector field type, added Brazilian Portuguese translation, fixed some bugs', '2023-08-14 06:32:05'),
(26, 'Winter.Builder', 'comment', '1.0.24', 'Added support for tag list field type, added read only toggle for fields. Prevent plugins from using reserved PHP keywords for class names and namespaces', '2023-08-14 06:32:05'),
(27, 'Winter.Builder', 'comment', '1.0.25', 'Allow editing of migration code in the \"Migration\" popup when saving changes in the database editor.', '2023-08-14 06:32:05'),
(28, 'Winter.Builder', 'comment', '1.0.26', 'Allow special default values for columns and added new \"Add ID column\" button to database editor.', '2023-08-14 06:32:05'),
(29, 'Winter.Builder', 'comment', '1.0.27', 'Added ability to use \'scope\' in a form relation field, added ability to change the sort order of versions and added additional properties for repeater widget in form builder. Added Polish translation.', '2023-08-14 06:32:05'),
(30, 'Winter.Builder', 'script', '2.0.0', 'v2.0.0/convert_data.php', '2023-08-14 06:32:05'),
(31, 'Winter.Builder', 'comment', '2.0.0', 'Rebrand to Winter.Builder', '2023-08-14 06:32:05'),
(32, 'Winter.Builder', 'comment', '2.0.0', 'Fixes namespace parsing on php >= 8.0', '2023-08-14 06:32:05'),
(33, 'Winter.Builder', 'comment', '2.0.1', 'Fixed missing icons in icon selection, rebranded icons to Winter.', '2023-08-14 06:32:05'),
(34, 'Winter.Builder', 'comment', '2.0.2', 'Added fields to control plugin replacement, PHP8 compatibility fixes.', '2023-08-14 06:32:05'),
(35, 'Winter.Builder', 'comment', '2.0.3', 'Added support for image columns', '2023-08-14 06:32:05'),
(36, 'Winter.Builder', 'comment', '2.0.4', 'Added ability to modify Plugin replacement options. Automatically populate the model\'s `$jsonable` property for field types that require it. UX improvements.', '2023-08-14 06:32:05'),
(37, 'Winter.Builder', 'comment', '2.0.5', 'Fix issue with table selection when creating a model.', '2023-08-14 06:32:05'),
(38, 'Winter.Builder', 'comment', '2.0.6', 'Fix issues with JSON-able models, fix search functionality, fix automated tests.', '2023-08-14 06:32:05'),
(41, 'Mdeko.Api', 'comment', '1.0.1', 'Initialize plugin.', '2023-08-14 07:15:51'),
(104, 'Mdeko.Api', 'script', '1.0.2', 'builder_table_create_mdeko_api_menu.php', '2023-08-14 11:55:55'),
(105, 'Mdeko.Api', 'comment', '1.0.2', 'Created table mdeko_api_menu', '2023-08-14 11:55:55'),
(144, 'Mdeko.Api', 'script', '1.0.3', 'builder_table_create_mdeko_api_contacts.php', '2023-08-14 17:03:21'),
(145, 'Mdeko.Api', 'comment', '1.0.3', 'Created table mdeko_api_contacts', '2023-08-14 17:03:21'),
(146, 'Mdeko.Api', 'script', '1.0.4', 'builder_table_create_mdeko_api_banner.php', '2023-08-14 17:03:21'),
(147, 'Mdeko.Api', 'comment', '1.0.4', 'Created table mdeko_api_banner', '2023-08-14 17:03:21'),
(160, 'Mdeko.Api', 'script', '1.0.5', 'builder_table_create_mdeko_api_callback.php', '2023-08-14 17:17:57'),
(161, 'Mdeko.Api', 'comment', '1.0.5', 'Created table mdeko_api_callback', '2023-08-14 17:17:57'),
(166, 'Mdeko.Api', 'script', '1.0.6', 'builder_table_create_mdeko_api_category.php', '2023-08-14 17:37:50'),
(167, 'Mdeko.Api', 'comment', '1.0.6', 'Created table mdeko_api_category', '2023-08-14 17:37:50'),
(196, 'Mdeko.Api', 'script', '1.0.7', 'builder_table_create_mdeko_api_item.php', '2023-08-15 12:49:16'),
(197, 'Mdeko.Api', 'comment', '1.0.7', 'Created table mdeko_api_item', '2023-08-15 12:49:16'),
(208, 'OFFLINE.CORS', 'comment', '1.0.1', 'Initial release.', '2023-08-15 16:14:17'),
(209, 'OFFLINE.CORS', 'comment', '1.0.2', 'Fixed backend settings label (thanks to LukeTowers)', '2023-08-15 16:14:17'),
(210, 'OFFLINE.CORS', 'comment', '1.0.3', 'Added support for filesystem configuration file / Added plugin to Packagist (https://packagist.org/packages/offline/oc-cors-plugin)', '2023-08-15 16:14:17'),
(211, 'OFFLINE.CORS', 'comment', '1.0.4', 'Fixed minor bug when running the plugin without custom settings', '2023-08-15 16:14:17'),
(216, 'Mdeko.Api', 'script', '1.0.8', 'builder_table_create_mdeko_api_order.php', '2023-08-19 14:57:41'),
(217, 'Mdeko.Api', 'comment', '1.0.8', 'Created table mdeko_api_order', '2023-08-19 14:57:41'),
(218, 'Mdeko.Api', 'script', '1.0.9', 'builder_table_update_mdeko_api_callback.php', '2023-08-19 18:09:02'),
(219, 'Mdeko.Api', 'comment', '1.0.9', 'Updated table mdeko_api_callback', '2023-08-19 18:09:02');

-- --------------------------------------------------------

--
-- Структура таблицы `system_plugin_versions`
--

CREATE TABLE `system_plugin_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_plugin_versions`
--

INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
(3, 'Winter.Builder', '2.0.6', '2023-08-14 06:32:05', 0, 0),
(4, 'Mdeko.Api', '1.0.9', '2023-08-19 18:09:02', 0, 0),
(6, 'OFFLINE.CORS', '1.0.4', '2023-08-15 16:14:17', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `system_request_logs`
--

CREATE TABLE `system_request_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_revisions`
--

CREATE TABLE `system_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `revisionable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_settings`
--

INSERT INTO `system_settings` (`id`, `item`, `value`) VALUES
(1, 'winter_builder_settings', '{\"author_name\":\"mdeko\",\"author_namespace\":\"Mdeko\"}'),
(2, 'offline_cors_settings', '{\"supportsCredentials\":\"0\",\"maxAge\":0,\"allowedOrigins\":[{\"value\":\"*\"}],\"allowedMethods\":[{\"value\":\"GET\"},{\"value\":\"POST\"}],\"allowedHeaders\":[],\"exposedHeaders\":[]}');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `backend_access_log`
--
ALTER TABLE `backend_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `backend_users`
--
ALTER TABLE `backend_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_unique` (`login`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `act_code_index` (`activation_code`),
  ADD KEY `reset_code_index` (`reset_password_code`),
  ADD KEY `admin_role_index` (`role_id`);

--
-- Индексы таблицы `backend_users_groups`
--
ALTER TABLE `backend_users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Индексы таблицы `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_unique` (`name`),
  ADD KEY `code_index` (`code`);

--
-- Индексы таблицы `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`);

--
-- Индексы таблицы `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_unique` (`name`),
  ADD KEY `role_code_index` (`code`);

--
-- Индексы таблицы `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `backend_user_throttle_user_id_index` (`user_id`),
  ADD KEY `backend_user_throttle_ip_address_index` (`ip_address`);

--
-- Индексы таблицы `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Индексы таблицы `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_data_theme_index` (`theme`);

--
-- Индексы таблицы `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_logs_type_index` (`type`),
  ADD KEY `cms_theme_logs_theme_index` (`theme`),
  ADD KEY `cms_theme_logs_user_id_index` (`user_id`);

--
-- Индексы таблицы `cms_theme_templates`
--
ALTER TABLE `cms_theme_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_templates_source_index` (`source`),
  ADD KEY `cms_theme_templates_path_index` (`path`);

--
-- Индексы таблицы `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deferred_bindings_master_type_index` (`master_type`),
  ADD KEY `deferred_bindings_master_field_index` (`master_field`),
  ADD KEY `deferred_bindings_slave_type_index` (`slave_type`),
  ADD KEY `deferred_bindings_slave_id_index` (`slave_id`),
  ADD KEY `deferred_bindings_session_key_index` (`session_key`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Индексы таблицы `mdeko_api_banner`
--
ALTER TABLE `mdeko_api_banner`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mdeko_api_callback`
--
ALTER TABLE `mdeko_api_callback`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mdeko_api_category`
--
ALTER TABLE `mdeko_api_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mdeko_api_contacts`
--
ALTER TABLE `mdeko_api_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mdeko_api_item`
--
ALTER TABLE `mdeko_api_item`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mdeko_api_menu`
--
ALTER TABLE `mdeko_api_menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mdeko_api_order`
--
ALTER TABLE `mdeko_api_order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Индексы таблицы `system_event_logs`
--
ALTER TABLE `system_event_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_event_logs_level_index` (`level`);

--
-- Индексы таблицы `system_files`
--
ALTER TABLE `system_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_files_field_index` (`field`),
  ADD KEY `system_files_attachment_id_index` (`attachment_id`),
  ADD KEY `system_files_attachment_type_index` (`attachment_type`);

--
-- Индексы таблицы `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_mail_templates_layout_id_index` (`layout_id`);

--
-- Индексы таблицы `system_parameters`
--
ALTER TABLE `system_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_index` (`namespace`,`group`,`item`);

--
-- Индексы таблицы `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_history_code_index` (`code`),
  ADD KEY `system_plugin_history_type_index` (`type`);

--
-- Индексы таблицы `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_versions_code_index` (`code`);

--
-- Индексы таблицы `system_request_logs`
--
ALTER TABLE `system_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_revisions`
--
ALTER TABLE `system_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  ADD KEY `system_revisions_user_id_index` (`user_id`),
  ADD KEY `system_revisions_field_index` (`field`);

--
-- Индексы таблицы `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_settings_item_index` (`item`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `backend_access_log`
--
ALTER TABLE `backend_access_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `backend_users`
--
ALTER TABLE `backend_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cms_theme_templates`
--
ALTER TABLE `cms_theme_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mdeko_api_banner`
--
ALTER TABLE `mdeko_api_banner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `mdeko_api_callback`
--
ALTER TABLE `mdeko_api_callback`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `mdeko_api_category`
--
ALTER TABLE `mdeko_api_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `mdeko_api_contacts`
--
ALTER TABLE `mdeko_api_contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `mdeko_api_item`
--
ALTER TABLE `mdeko_api_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `mdeko_api_menu`
--
ALTER TABLE `mdeko_api_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `mdeko_api_order`
--
ALTER TABLE `mdeko_api_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `system_event_logs`
--
ALTER TABLE `system_event_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `system_files`
--
ALTER TABLE `system_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_parameters`
--
ALTER TABLE `system_parameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT для таблицы `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `system_request_logs`
--
ALTER TABLE `system_request_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_revisions`
--
ALTER TABLE `system_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
