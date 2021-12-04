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

create database `ultra_seller_wallet` default character set utf8 collate utf8_general_ci;
use ultra_seller_wallet;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for us_wallet
-- ----------------------------
DROP TABLE IF EXISTS `us_wallet`;
CREATE TABLE `us_wallet` (
                             `userName` varchar(255) DEFAULT NULL,
                             `walletId` bigint(20) NOT NULL DEFAULT '0',
                             `balance` double DEFAULT '0',
                             `role` varchar(10) DEFAULT NULL,
                             PRIMARY KEY (`walletId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ----------------------------
-- Table structure for us_wallet_record
-- ----------------------------
DROP TABLE IF EXISTS `us_wallet_record`;
CREATE TABLE `us_wallet_record` (
                                    `walletId` bigint(20) DEFAULT NULL,
                                    `userName` varchar(255) DEFAULT NULL,
                                    `time` datetime DEFAULT NULL,
                                    `amount` double DEFAULT NULL,
                                    `orderId` bigint(20) DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


SET FOREIGN_KEY_CHECKS = 1;

