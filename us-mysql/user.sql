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

create database `ultra_seller_user` default character set utf8 collate utf8_general_ci;
use ultra_seller_user;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `name` varchar(150) NOT NULL,
                              PRIMARY KEY (`id`),
                              UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
                                          `id` bigint(20) NOT NULL AUTO_INCREMENT,
                                          `group_id` int(11) NOT NULL,
                                          `permission_id` int(11) NOT NULL,
                                          PRIMARY KEY (`id`),
                                          UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
                                          KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
                                          CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
                                          CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
                                   `id` int(11) NOT NULL AUTO_INCREMENT,
                                   `name` varchar(255) NOT NULL,
                                   `content_type_id` int(11) NOT NULL,
                                   `codename` varchar(100) NOT NULL,
                                   PRIMARY KEY (`id`),
                                   UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
                                   CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add cart', 1, 'add_cart');
INSERT INTO `auth_permission` VALUES (2, 'Can change cart', 1, 'change_cart');
INSERT INTO `auth_permission` VALUES (3, 'Can delete cart', 1, 'delete_cart');
INSERT INTO `auth_permission` VALUES (4, 'Can view cart', 1, 'view_cart');
INSERT INTO `auth_permission` VALUES (5, 'Can add log entry', 2, 'add_logentry');
INSERT INTO `auth_permission` VALUES (6, 'Can change log entry', 2, 'change_logentry');
INSERT INTO `auth_permission` VALUES (7, 'Can delete log entry', 2, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (8, 'Can view log entry', 2, 'view_logentry');
INSERT INTO `auth_permission` VALUES (9, 'Can add permission', 3, 'add_permission');
INSERT INTO `auth_permission` VALUES (10, 'Can change permission', 3, 'change_permission');
INSERT INTO `auth_permission` VALUES (11, 'Can delete permission', 3, 'delete_permission');
INSERT INTO `auth_permission` VALUES (12, 'Can view permission', 3, 'view_permission');
INSERT INTO `auth_permission` VALUES (13, 'Can add group', 4, 'add_group');
INSERT INTO `auth_permission` VALUES (14, 'Can change group', 4, 'change_group');
INSERT INTO `auth_permission` VALUES (15, 'Can delete group', 4, 'delete_group');
INSERT INTO `auth_permission` VALUES (16, 'Can view group', 4, 'view_group');
INSERT INTO `auth_permission` VALUES (17, 'Can add user', 5, 'add_user');
INSERT INTO `auth_permission` VALUES (18, 'Can change user', 5, 'change_user');
INSERT INTO `auth_permission` VALUES (19, 'Can delete user', 5, 'delete_user');
INSERT INTO `auth_permission` VALUES (20, 'Can view user', 5, 'view_user');
INSERT INTO `auth_permission` VALUES (21, 'Can add content type', 6, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (22, 'Can change content type', 6, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (23, 'Can delete content type', 6, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (24, 'Can view content type', 6, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (25, 'Can add session', 7, 'add_session');
INSERT INTO `auth_permission` VALUES (26, 'Can change session', 7, 'change_session');
INSERT INTO `auth_permission` VALUES (27, 'Can delete session', 7, 'delete_session');
INSERT INTO `auth_permission` VALUES (28, 'Can view session', 7, 'view_session');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
                             `id` int(11) NOT NULL AUTO_INCREMENT,
                             `password` varchar(128) NOT NULL,
                             `last_login` datetime(6) DEFAULT NULL,
                             `is_superuser` tinyint(1) NOT NULL,
                             `username` varchar(150) NOT NULL,
                             `first_name` varchar(150) NOT NULL,
                             `last_name` varchar(150) NOT NULL,
                             `email` varchar(254) NOT NULL,
                             `is_staff` tinyint(1) NOT NULL,
                             `is_active` tinyint(1) NOT NULL,
                             `date_joined` datetime(6) NOT NULL,
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
                                    `id` bigint(20) NOT NULL AUTO_INCREMENT,
                                    `user_id` int(11) NOT NULL,
                                    `group_id` int(11) NOT NULL,
                                    PRIMARY KEY (`id`),
                                    UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
                                    KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
                                    CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
                                    CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
                                              `id` bigint(20) NOT NULL AUTO_INCREMENT,
                                              `user_id` int(11) NOT NULL,
                                              `permission_id` int(11) NOT NULL,
                                              PRIMARY KEY (`id`),
                                              UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
                                              KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
                                              CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
                                              CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `action_time` datetime(6) NOT NULL,
                                    `object_id` longtext,
                                    `object_repr` varchar(200) NOT NULL,
                                    `action_flag` smallint(5) unsigned NOT NULL,
                                    `change_message` longtext NOT NULL,
                                    `content_type_id` int(11) DEFAULT NULL,
                                    `user_id` int(11) NOT NULL,
                                    PRIMARY KEY (`id`),
                                    KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
                                    KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
                                    CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
                                    CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
                                       `id` int(11) NOT NULL AUTO_INCREMENT,
                                       `app_label` varchar(100) NOT NULL,
                                       `model` varchar(100) NOT NULL,
                                       PRIMARY KEY (`id`),
                                       UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (2, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (5, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (6, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (1, 'testapp', 'cart');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
                                     `id` bigint(20) NOT NULL AUTO_INCREMENT,
                                     `app` varchar(255) NOT NULL,
                                     `name` varchar(255) NOT NULL,
                                     `applied` datetime(6) NOT NULL,
                                     PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2021-11-10 09:30:54.365980');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2021-11-10 09:30:55.409253');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2021-11-10 09:30:55.693272');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2021-11-10 09:30:55.737217');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2021-11-10 09:30:55.776484');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2021-11-10 09:30:55.953939');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2021-11-10 09:30:56.051805');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2021-11-10 09:30:56.145404');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2021-11-10 09:30:56.187821');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2021-11-10 09:30:56.268239');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2021-11-10 09:30:56.297963');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2021-11-10 09:30:56.341758');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2021-11-10 09:30:56.431601');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2021-11-10 09:30:56.533075');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2021-11-10 09:30:56.625887');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2021-11-10 09:30:56.705309');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2021-11-10 09:30:56.802453');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2021-11-10 09:30:56.930644');
INSERT INTO `django_migrations` VALUES (19, 'testapp', '0001_initial', '2021-11-10 09:30:57.090005');
INSERT INTO `django_migrations` VALUES (20, 'testapp', '0002_auto_20211104_0811', '2021-11-10 09:30:57.225504');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
                                  `session_key` varchar(40) NOT NULL,
                                  `session_data` longtext NOT NULL,
                                  `expire_date` datetime(6) NOT NULL,
                                  PRIMARY KEY (`session_key`),
                                  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for us_admin
-- ----------------------------
DROP TABLE IF EXISTS `us_admin`;
CREATE TABLE `us_admin` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `username` varchar(64) NOT NULL,
                            `password` varchar(255) NOT NULL,
                            `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of us_admin
-- ----------------------------
BEGIN;
INSERT INTO `us_admin` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2021-11-12 15:58:43', '2021-11-16 11:11:10');
COMMIT;

-- ----------------------------
-- Table structure for us_buyer
-- ----------------------------
DROP TABLE IF EXISTS `us_buyer`;
CREATE TABLE `us_buyer` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `username` varchar(64) NOT NULL,
                            `password` varchar(255) NOT NULL,
                            `email` varchar(64) DEFAULT NULL,
                            `phone` varchar(64) NOT NULL,
                            `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of us_buyer
-- ----------------------------
BEGIN;
INSERT INTO `us_buyer` VALUES (1, 'buyer', '81dc9bdb52d04dc20036dbd8313ed055', '11', '1', '2021-11-12 16:49:47', '2021-11-12 16:49:50');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

