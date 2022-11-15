CREATE DATABASE IF NOT EXISTS `vote_manager` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
use vote_manager;

CREATE TABLE IF NOT EXISTS `admin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) UNIQUE NOT NULL,
  `email` VARCHAR(150) UNIQUE NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `createdAt` datetime DEFAULT NOW(),
    `updatedAt` datetime NULL,
  `deletedAt` datetime NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) UNIQUE NOT NULL,
  `avatar` VARCHAR(200) NOT NULL,
  `email` VARCHAR(150) UNIQUE NOT NULL,
  `phone` VARCHAR(50) UNIQUE NOT NULL,
  `adress` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `money` float NULL,
  `createdAt` datetime DEFAULT NOW(),
  `updatedAt` datetime NULL,
  `deletedAt` datetime NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `contest` (
  `id` VARCHAR(50) NOT NULL UNIQUE,
  `name` VARCHAR(100) UNIQUE NOT NULL,
  `stars_date` date NOT NULL,
  `last_date` date NOT NULL,
  `status` tinyint DEFAULT 0,
  `createdAt` datetime DEFAULT NOW(),
  `updatedAt` datetime NULL,
  `deletedAt` datetime NULL,
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `candidates` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) UNIQUE NOT NULL,
  `avatar` VARCHAR(200) NOT NULL,
  `age` VARCHAR(150) UNIQUE NOT NULL,
  `content` VARCHAR(50),
  `adress` VARCHAR(50),
  `other` text NULL,
  `id_contest` VARCHAR(50) NOT NULL,
  `status` tinyint DEFAULT 0,
  `createdAt` datetime DEFAULT NOW(),
  `updatedAt` datetime NULL,
  `deletedAt` datetime NULL,
  PRIMARY KEY `pk_id`(`id`),
  FOREIGN KEY (`id_contest`) REFERENCES `contest`(`id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `voted` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_user` INT NOT NULL,
  `id_candidates` INT NOT NULL,
  `created_time` date DEFAULT NOW(),
  `createdAt` datetime DEFAULT NOW(),
    `updatedAt` datetime NULL,
  `deletedAt` datetime NULL,
  PRIMARY KEY `pk_id`(`id`),
  FOREIGN KEY (`id_user`) REFERENCES `users`(`id`),
  FOREIGN KEY (`id_candidates`) REFERENCES `candidates`(`id`)
) ENGINE = InnoDB;