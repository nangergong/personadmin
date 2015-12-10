/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : db_time

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2013-04-01 23:55:11
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tb_diary`
-- ----------------------------
DROP TABLE IF EXISTS `tb_diary`;
CREATE TABLE `tb_diary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dtime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `weekday` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `weather` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `represent` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_diary
-- ----------------------------


-- ----------------------------
-- Table structure for `tb_represent`
-- ----------------------------
DROP TABLE IF EXISTS `tb_represent`;
CREATE TABLE `tb_represent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `represent` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_task_represent` (`tid`),
  CONSTRAINT `fk_task_represent` FOREIGN KEY (`tid`) REFERENCES `tb_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_represent
-- ----------------------------






-- ----------------------------
-- Table structure for `tb_s_diary`
-- ----------------------------
DROP TABLE IF EXISTS `tb_s_diary`;
CREATE TABLE `tb_s_diary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person` varchar(30) NOT NULL,
  `dtime` varchar(30) NOT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `represent` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_s_diary
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_task`
-- ----------------------------
DROP TABLE IF EXISTS `tb_task`;
CREATE TABLE `tb_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `dtime` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dtime` (`dtime`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_task
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `sex` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `landline` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `registtime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
