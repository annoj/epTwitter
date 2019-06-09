
/*
 *
 *  Create Database and tables for eptwitter project.
 *
 */

-- Database eptwitter
DROP DATABASE IF EXISTS eptwitter;
CREATE DATABASE eptwitter;
use eptwitter

-- Table meps
DROP TABLE IF EXISTS meps;
CREATE TABLE `meps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `party` int(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country`varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ep_fraction` int(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table partys
DROP TABLE IF EXISTS partys;
CREATE TABLE `partys` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table countrys
DROP TABLE IF EXISTS countrys;
CREATE TABLE `countrys` (
  `id` varchar(3) NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table ep_fractions
DROP TABLE IF EXISTS ep_fractions;
CREATE TABLE `ep_fractions` (
  `id` varchar(5) NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table tweets
DROP TABLE IF EXISTS tweets;
CREATE TABLE `tweets` (
  `id` int(11) NOT NULL UNIQUE,
  `published` timestamp NOT NULL DEFAULT NOW(),
  `author` int(11) NOT NULL,
  -- `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_translation` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_language` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feedsource` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
  -- CONSTRAINT `fk_author` FOREIGN KEY (`author`) REFERENCES meps (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table hashtag_usage
DROP TABLE IF EXISTS hashtag_usage;
CREATE TABLE `hashtag_usage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hashtag` varchar(120) NOT NULL,
  `tweet` int(11) NOT NULL,
  PRIMARY KEY (`id`)
  -- CONSTRAINT `fk_hashtag` FOREIGN KEY (`hashtag`) REFERENCES hashtags (`id`)
  -- CONSTRAINT `fk_tweet` FOREIGN KEY (`tweet`) REFERENCES tweets (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
