-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for social_media_app
DROP DATABASE IF EXISTS `social_media_app`;
CREATE DATABASE IF NOT EXISTS `social_media_app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `social_media_app`;

-- Dumping structure for table social_media_app.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table social_media_app.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table social_media_app.friendship
DROP TABLE IF EXISTS `friendship`;
CREATE TABLE IF NOT EXISTS `friendship` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `friend_id` bigint unsigned NOT NULL,
  `connected_on` datetime NOT NULL DEFAULT '2024-03-15 12:00:32',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_pair` (`user_id`,`friend_id`),
  KEY `friendship_friend_id_foreign` (`friend_id`),
  CONSTRAINT `friendship_friend_id_foreign` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friendship_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table social_media_app.friendship: ~6 rows (approximately)
INSERT INTO `friendship` (`id`, `user_id`, `friend_id`, `connected_on`, `created_at`, `updated_at`) VALUES
	(2, 1, 2, '2024-03-15 12:00:32', NULL, NULL),
	(3, 1, 3, '2024-03-15 12:00:32', NULL, NULL),
	(4, 1, 4, '2024-03-15 12:00:32', NULL, NULL),
	(5, 1, 6, '2024-03-15 12:00:32', NULL, NULL),
	(6, 2, 10, '2024-03-15 12:00:32', NULL, NULL),
	(7, 21, 1, '2024-03-15 12:00:32', NULL, NULL);

-- Dumping structure for table social_media_app.groups
DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` tinyint NOT NULL DEFAULT '1',
  `creator_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_creator_id_foreign` (`creator_id`),
  CONSTRAINT `groups_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table social_media_app.groups: ~0 rows (approximately)

-- Dumping structure for table social_media_app.memberships
DROP TABLE IF EXISTS `memberships`;
CREATE TABLE IF NOT EXISTS `memberships` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint unsigned NOT NULL,
  `group_id` bigint unsigned NOT NULL,
  `role` tinyint NOT NULL DEFAULT '3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memberships_member_id_foreign` (`member_id`),
  KEY `memberships_group_id_foreign` (`group_id`),
  CONSTRAINT `memberships_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `users` (`id`),
  CONSTRAINT `memberships_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table social_media_app.memberships: ~0 rows (approximately)

-- Dumping structure for table social_media_app.messages
DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint unsigned NOT NULL,
  `receiver_id` bigint unsigned NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_sender_id_foreign` (`sender_id`),
  KEY `messages_receiver_id_foreign` (`receiver_id`),
  CONSTRAINT `messages_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table social_media_app.messages: ~6 rows (approximately)
INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `content`, `group_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 2, '1st', NULL, NULL, NULL),
	(2, 2, 1, '1.1', NULL, NULL, NULL),
	(3, 2, 1, '1.2', NULL, NULL, NULL),
	(4, 1, 2, '2nd', NULL, NULL, NULL),
	(5, 1, 3, '3rd', NULL, NULL, NULL),
	(6, 1, 4, '4th', NULL, NULL, NULL);

-- Dumping structure for table social_media_app.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table social_media_app.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2024_03_14_154732_create_friendship_table', 1),
	(6, '2024_03_15_112753_create_groups_table', 1),
	(7, '2024_03_15_113323_create_messages_table', 1),
	(8, '2024_03_15_113639_create_memberships_table', 1);

-- Dumping structure for table social_media_app.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table social_media_app.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table social_media_app.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table social_media_app.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table social_media_app.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table social_media_app.users: ~100 rows (approximately)
INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `profile_picture_path`, `first_name`, `last_name`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'west.kelly@example.com', '2024-03-15 06:30:34', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Skye', 'Rosemarie', 'EoAPFefo9E', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(2, 'easton14@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Gerald', 'Leonardo', 'aaZOGdBgGv', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(3, 'elise46@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Gage', 'Maye', 'WWFNdWIDjq', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(4, 'alek77@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Mathew', 'Jake', 'V3fhV7s87H', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(5, 'carolyn35@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Noble', 'Stanford', 'iVEE8LLsAs', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(6, 'yernser@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Mauricio', 'Eunice', '0ueFKudEZz', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(7, 'rod.watsica@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Mac', 'Ettie', 'uRcZE15yui', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(8, 'djakubowski@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Horacio', 'Zula', 'UNpKb28ZgL', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(9, 'wterry@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Zoila', 'Connie', '82UBgSfVTv', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(10, 'dicki.brielle@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Concepcion', 'Dallas', 'nvKUkbh487', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(11, 'taya94@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Kaycee', 'Adrian', 'yyRQZkqSgS', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(12, 'mkozey@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Hardy', 'Carson', '6luWXVYxx2', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(13, 'schaden.xander@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Jada', 'Holly', '4Q6ZcIEE3c', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(14, 'janessa.ebert@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'William', 'Werner', 'N7TOzJwMBw', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(15, 'dana.hagenes@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Rosie', 'Piper', 'hUTvCNi7GK', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(16, 'arch82@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Name', 'Sophia', 'ivmwSajX28', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(17, 'beer.ally@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Tom', 'Olen', 'zR5gsJXltz', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(18, 'schmeler.elise@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Victoria', 'Alexandria', 'dPFT9Sqlme', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(19, 'murray.nitzsche@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Lenny', 'Keshawn', 'wgmgRGUHMm', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(20, 'hudson.austin@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Rosemarie', 'Marlin', 'iJ7c2WNdRv', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(21, 'windler.olin@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Tate', 'Leilani', '1ZQ5OaTGYH', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(22, 'verdie52@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Khalid', 'Lacy', 'oKQT3OzQc3', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(23, 'bernadine86@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Brennon', 'Maye', 'CKhHtHsiNn', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(24, 'maybelle.connelly@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Orpha', 'Eliseo', 'nBnMxWLWaC', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(25, 'waelchi.lorine@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Spencer', 'Aida', 'qTJnwiT38T', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(26, 'eulalia90@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Chance', 'Tracy', 'cwaUgDsi0l', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(27, 'paige97@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Camila', 'Luther', '8F8X0U2cjD', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(28, 'swaniawski.maverick@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Graciela', 'Jacinto', 'DFrHcbNkrH', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(29, 'cdaniel@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Jackie', 'Destiny', 'a5ATO3Ig1w', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(30, 'jondricka@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Robyn', 'Macy', 'oIihoffwIT', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(31, 'bbartoletti@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Filomena', 'Madonna', 'tj6569VU2P', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(32, 'ckulas@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Maxine', 'Ethan', '4HQ6kyfVIy', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(33, 'burnice53@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Rosina', 'Julius', '7h4MVVvECn', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(34, 'leo.kuphal@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Lelah', 'Chadd', 'ifImCTPtZm', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(35, 'izaiah06@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Angeline', 'Elias', 'x4Eaq4j1pN', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(36, 'vonrueden.marquise@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Graham', 'Eduardo', 'y1DnQBOQZ4', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(37, 'jalon.dicki@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Carmen', 'Luther', 'IdAxwVPFuO', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(38, 'dmccullough@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Emanuel', 'Sam', '5Hzfht9GxZ', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(39, 'kemmer.kaia@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Kyler', 'Hortense', 'oHpg9E8YpS', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(40, 'heidi56@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Stuart', 'Maegan', '5YITuhAVwv', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(41, 'swaniawski.laury@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Anderson', 'Clara', 'EK3fKuropX', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(42, 'funk.leora@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Sam', 'Assunta', 'NxSUppghU7', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(43, 'linwood.carter@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Annie', 'Sigurd', '1fIac1opke', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(44, 'zora.pagac@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Ashton', 'Hillard', 'TCAVpg0pUM', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(45, 'kosinski@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Madalyn', 'Aliza', 'O4abjx7Veb', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(46, 'devan35@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Damian', 'Shannon', 'QvhTDZtNJ4', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(47, 'kiehn.sierra@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Thelma', 'Charlie', 'p9oK7antxe', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(48, 'mzboncak@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Vince', 'Megane', 'YWSJ0F0Phs', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(49, 'stewart.bechtelar@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Quinten', 'Judge', 'qrvGsaJ44g', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(50, 'cschuster@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Cleora', 'Richie', '46BajQR3Uj', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(51, 'felicity90@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Oran', 'Isabell', 'aboC2jC8QX', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(52, 'imills@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Libbie', 'Romaine', 'YRfVugu9lX', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(53, 'nathan77@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Fredy', 'Maci', 'QCX1098q8o', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(54, 'weissnat.valentine@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Kelton', 'Laury', 'CQjLcLZgpa', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(55, 'jarred87@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Tabitha', 'Cicero', 'PFCpyVtXg7', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(56, 'davonte.zieme@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Mara', 'Issac', 'F20CNC2ES2', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(57, 'gerhold.naomie@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Odie', 'Cary', 'ZBeEHkdpKL', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(58, 'hallie19@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Sasha', 'Merlin', 'AAsWDgRRvk', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(59, 'clement.lesch@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Johann', 'Brandy', 'UTdcoNEVqc', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(60, 'uhackett@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Keaton', 'Izabella', 'HfpQwUy9yo', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(61, 'adela25@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Leo', 'Meggie', '85AOe9vCvn', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(62, 'krystal.parker@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Joyce', 'Krista', 'oWBVcNdJvF', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(63, 'jakayla09@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Abigail', 'Jo', 'F7Hm3jIMF2', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(64, 'graciela57@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Susanna', 'Alanis', 'EVDUpZaTHR', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(65, 'larkin.garnett@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Maxie', 'Alfred', 'Oft6yNGIno', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(66, 'vbarrows@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Justine', 'Ewald', 'Qk8AxTQAIA', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(67, 'isai.tromp@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Skyla', 'Trace', 'xfCJXuZJa0', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(68, 'carleton.flatley@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Immanuel', 'Emelie', 'F8Zx0z2pbO', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(69, 'rebecca81@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Ross', 'Brielle', 'Gf93oYJ56B', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(70, 'gutkowski.dereck@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Janet', 'Solon', 'bKLPFJJvLw', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(71, 'hermann81@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Kacey', 'Rhett', 'CLSzQEcTkE', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(72, 'jzboncak@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Eli', 'Kristopher', 'xVN1FIREIW', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(73, 'emelia.franecki@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Rene', 'Lilly', 'FpByDgibdy', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(74, 'okozey@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Dorian', 'Brent', 'v7AAqPPWMV', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(75, 'kacey.windler@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Bridget', 'Melba', 'TpWsVAWyET', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(76, 'mitchell.larissa@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Nicolas', 'Darrin', 'uF5IeUxqjd', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(77, 'ryann25@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Fay', 'Josue', 'G0jVjfJiov', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(78, 'conroy.eleazar@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Megane', 'Janae', 'gqeCcU6JLl', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(79, 'johnson.gillian@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Luigi', 'Otho', 'QzWjmwlbKF', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(80, 'mallory.johnson@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Doyle', 'Herbert', 'XYv9FmaZ8B', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(81, 'sporer.dylan@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Tyree', 'Trent', 'BZKek8N61N', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(82, 'sandra.gibson@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Edmund', 'Madison', '9uG7xXjQBL', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(83, 'kamryn42@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Rollin', 'Guillermo', 'a8VGOuO7QJ', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(84, 'trinity.ruecker@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Bonnie', 'Emilie', 'pFIEGSl9Eq', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(85, 'lindgren.joe@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Cecelia', 'Vernon', 'zbr2Y5EQnM', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(86, 'carli.graham@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Selmer', 'Riley', 'pAqbjhqURP', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(87, 'obatz@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Jamison', 'Mallie', 'W6XfMviPDh', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(88, 'maymie.king@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Camron', 'Elvera', 'gt19CvSthc', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(89, 'joy17@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Casimir', 'Elaina', 'QrysaetXYR', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(90, 'malinda.welch@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Elyse', 'Krista', 'zTP1lxMHw9', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(91, 'linnea.rippin@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Jannie', 'Arne', 'LV00AQ1YKV', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(92, 'katlynn95@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Tanner', 'Cade', 'Rt3SyMqjlg', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(93, 'rowe.destini@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Tyshawn', 'Arvel', '9QuwGZqlWr', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(94, 'mwisoky@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Ora', 'Syble', 'mTn5UNy9Al', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(95, 'cbailey@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Donnie', 'Lucas', 'Q5adp3zRYP', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(96, 'baumbach.ivy@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Jedidiah', 'Eldridge', 'L0Se2sYcWN', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(97, 'jaiden63@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Arlo', 'Max', 'r3quc7nVvu', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(98, 'rosendo.homenick@example.net', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Lupe', 'Danika', 'AxiSK0yjdG', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(99, 'dewitt16@example.com', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Amely', 'Nico', 'Dus78zJ24p', '2024-03-15 06:30:35', '2024-03-15 06:30:35'),
	(100, 'pete.johns@example.org', '2024-03-15 06:30:35', '$2y$12$SFYmiJ.5EiFFMB94RVCD7eHzfVEvoNr6DcAcdJpB65xiOru3Y4DbK', NULL, 'Katelynn', 'Margie', 'QL603aaAlg', '2024-03-15 06:30:35', '2024-03-15 06:30:35');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
