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

create database `ultra_seller_shopcar` default character set utf8 collate utf8_general_ci;
use ultra_seller_shopcar;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Shopcar
-- ----------------------------
DROP TABLE IF EXISTS `Shopcar`;
CREATE TABLE `Shopcar` (
                           `id` bigint(20) NOT NULL AUTO_INCREMENT,
                           `buyer_id` int(11) NOT NULL,
                           `commodity_id` varchar(20) NOT NULL,
                           `status` varchar(32) NOT NULL,
                           `create_time` datetime(6) DEFAULT NULL,
                           `update_time` datetime(6) DEFAULT NULL,
                           `cart_num` int(11) DEFAULT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;

