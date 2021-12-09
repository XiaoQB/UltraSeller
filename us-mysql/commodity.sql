/*
 Navicat Premium Data Transfer

 Source Server         : UltraSeller
 Source Server Type    : MySQL
 Source Server Version : 50651
 Source Host           : 47.102.97.229:3306
 Source Schema         : ultra_seller

 Target Server Type    : MySQL
 Target Server Version : 50651
 File Encoding         : 65001

 Date: 16/11/2021 20:12:22
*/

use mysql;
update user set Host='%' where User='root';
flush privileges;

create database `ultra_seller_commodity` default character set utf8 collate utf8_general_ci;
use ultra_seller_commodity;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for us_commodity
-- ----------------------------
DROP TABLE IF EXISTS `us_commodity`;
CREATE TABLE `us_commodity` (
                                `id` char(20) NOT NULL,
                                `name` char(20) DEFAULT NULL,
                                `imgLink` char(255) DEFAULT NULL,
                                `price` int(11) DEFAULT NULL,
                                `description` char(32) DEFAULT NULL,
                                `inventory` int(11) DEFAULT NULL,
                                `vendorName` char(20) DEFAULT NULL,
                                `keywords` char(20) DEFAULT NULL,
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of us_commodity
-- ----------------------------
BEGIN;
INSERT INTO `us_commodity` VALUES ('2021111010291583862', '矿泉水', 'https://tse2-mm.cn.bing.net/th/id/OIP-C.I6r-Fi3Fuv2KRhkRoM2ZMwHaFW?w=268&h=193&c=7&r=0&o=5&dpr=2&pid=1.7', 4, '水', 10, '康师傅矿泉水', '饮用水');
INSERT INTO `us_commodity` VALUES ('2021111323171493548', '白酒', 'https://tse1-mm.cn.bing.net/th/id/OIP-C.Ysp5JXpNQ13Jpx75yhIfYAHaHa?w=214&h=214&c=7&r=0&o=5&dpr=2&pid=1.7', 2880, '酒', 10, '茅台', '酒');
INSERT INTO `us_commodity` VALUES ('2021111414232602041', '水', 'https://tse2-mm.cn.bing.net/th/id/OIP-C.I6r-Fi3Fuv2KRhkRoM2ZMwHaFW?w=268&h=193&c=7&r=0&o=5&dpr=2&pid=1.7', 4, '喝的', 4, 'xpc', NULL);
INSERT INTO `us_commodity` VALUES ('2021111415214971336', '苹果', 'https://tse1-mm.cn.bing.net/th/id/OIP-C.ST0abNj43MPTUnVyptcPnQHaE8?w=303&h=202&c=7&r=0&o=5&dpr=2&pid=1.7', 1, '吃的', 5, 'xpc', NULL);
COMMIT;


SET FOREIGN_KEY_CHECKS = 1;

