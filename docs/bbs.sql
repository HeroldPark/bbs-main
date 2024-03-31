-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.0-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- bbs 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `bbs` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bbs`;

-- 테이블 bbs.bbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `bbs` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(50) DEFAULT NULL,
  `ref` int(11) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `del` tinyint(1) DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 테이블 데이터 bbs.bbs:~2 rows (대략적) 내보내기
DELETE FROM `bbs`;
/*!40000 ALTER TABLE `bbs` DISABLE KEYS */;
INSERT INTO `bbs` (`seq`, `id`, `ref`, `step`, `depth`, `title`, `content`, `created_at`, `del`, `read_count`) VALUES
	(2, 'shane', 1, 0, 0, 'Hello React', 'Hello, React World~~~', '2024-03-31 18:16:16', 0, 1),
	(3, 'shane', 1, 2, 1, 'Re: Hello React', 'Thank you for your React Demo open,\nNayeon 님', '2024-03-31 18:21:37', 0, 1),
	(4, 'shane', 1, 1, 1, 'Re: Re: Your Welcome.', 'Your Welcome~~~', '2024-03-31 18:25:00', 0, 1);
/*!40000 ALTER TABLE `bbs` ENABLE KEYS */;

-- 테이블 bbs.comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(50) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `bbs_seq` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `del` int(11) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  KEY `FK_comment_bbs` (`bbs_seq`),
  CONSTRAINT `FK_comment_bbs` FOREIGN KEY (`bbs_seq`) REFERENCES `bbs` (`seq`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 bbs.comment:~0 rows (대략적) 내보내기
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 테이블 bbs.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `id` varchar(50) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `pwd` varchar(256) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 bbs.member:~1 rows (대략적) 내보내기
DELETE FROM `member`;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`id`, `pwd`, `name`, `email`) VALUES
	('shane', '$2a$10$bBhjwbjvikwIDBNr6o6ERezu1laCy9mLVrvQ3bk4YaiXd8ICGU/ly', '세인', 'shanepark0@naver.com');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 bbs.read_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `read_history` (
  `bbs_seq` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(50) NOT NULL,
  `latest_access_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bbs_seq`,`id`),
  KEY `FK_read_history_member` (`id`),
  CONSTRAINT `FK_read_history_bbs` FOREIGN KEY (`bbs_seq`) REFERENCES `bbs` (`seq`),
  CONSTRAINT `FK_read_history_member` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 테이블 데이터 bbs.read_history:~2 rows (대략적) 내보내기
DELETE FROM `read_history`;
/*!40000 ALTER TABLE `read_history` DISABLE KEYS */;
INSERT INTO `read_history` (`bbs_seq`, `id`, `latest_access_at`) VALUES
	(2, 'shane', '2024-03-31 18:25:11'),
	(3, 'shane', '2024-03-31 18:25:19'),
	(4, 'shane', '2024-03-31 18:25:16');
/*!40000 ALTER TABLE `read_history` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
