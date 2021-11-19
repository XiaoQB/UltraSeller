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

create database `ultra_seller` default character set utf8 collate utf8_general_ci;
use ultra_seller;

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
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
                         `id` varchar(36) NOT NULL,
                         `status` varchar(36) NOT NULL,
                         `total_price` float DEFAULT NULL,
                         `address` varchar(64) NOT NULL,
                         `buyer_id` int(11) NOT NULL,
                         `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                         `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `order` VALUES ('12f83b90-d279-4501-ba65-b36ad9e08072', 'done', 3, 'fudan university', 1, '2021-11-13 22:31:58', '2021-11-13 22:31:58');
INSERT INTO `order` VALUES ('1375daff-cb05-4ad7-9351-726070950481', 'done', 3, 'fudan university', 1, '2021-11-13 22:35:35', '2021-11-13 22:35:35');
INSERT INTO `order` VALUES ('15fb23eb-45d4-4fc6-9dad-86e117bb8002', 'doing', 19235.3, 'test 42address', 3, '2021-11-13 11:04:14', '2021-11-13 11:04:14');
INSERT INTO `order` VALUES ('235cc67b-ec30-4ac3-afbe-ab5fae95b761', 'done', 3, 'fudan university', 1, '2021-11-11 05:10:49', '2021-11-11 05:10:49');
INSERT INTO `order` VALUES ('2baf4c9c-bb55-43cd-8b20-32550cf9b4eb', 'done', 3, 'fudan university', 1, '2021-11-13 22:28:42', '2021-11-13 22:28:42');
INSERT INTO `order` VALUES ('30285761-4812-4d09-8ff1-b3045f45a9e4', 'done', 26.1, 'temp address', 1, '2021-11-11 04:25:24', '2021-11-11 04:25:24');
INSERT INTO `order` VALUES ('4c02a727-0b2b-45ab-8e19-83213db8529a', 'done', 26.1, 'temp address', 3, '2021-11-10 03:35:36', '2021-11-10 03:35:36');
INSERT INTO `order` VALUES ('54476541-fd81-4165-a9d8-6e3860d3b91e', 'done', 3, 'fudan university', 1, '2021-11-11 05:12:06', '2021-11-11 05:12:06');
INSERT INTO `order` VALUES ('5af53af3-cd07-4970-a373-52101e10bff9', 'done', 26.1, 'temp address', 1, '2021-11-02 08:15:57', '2021-11-02 08:15:57');
INSERT INTO `order` VALUES ('5e0c0263-d6d3-4b14-8700-c561ba80abb4', 'done', 3, 'fudan university', 1, '2021-11-11 05:01:22', '2021-11-11 05:01:22');
INSERT INTO `order` VALUES ('652105d2-2229-4bde-ae2d-7532d073217b', 'done', 3, 'fudan university', 1, '2021-11-13 22:32:01', '2021-11-13 22:32:01');
INSERT INTO `order` VALUES ('86b91648-c9a7-43fa-8d37-3b84e5adaca7', 'done', 26.1, 'temp address', 1, '2021-11-09 20:37:19', '2021-11-09 20:37:19');
INSERT INTO `order` VALUES ('86bab10e-b9c5-4361-b928-a7dd01ce4fbc', 'done', 3, 'fudan university', 1, '2021-11-13 22:30:34', '2021-11-13 22:30:34');
INSERT INTO `order` VALUES ('8ba566df-4896-423d-9e9c-e1123c82a5fa', 'done', 3, 'fudan university', 1, '2021-11-13 11:09:17', '2021-11-13 11:09:17');
INSERT INTO `order` VALUES ('a876c6c3-841a-40a7-afa9-e17dab256eb2', 'done', 26.1, 'temp address', 3, '2021-11-10 03:35:54', '2021-11-10 03:35:54');
INSERT INTO `order` VALUES ('ab75e15f-c57a-419e-b61a-b12a50949eaf', 'doing', 19235.3, 'test address', 10, '2021-11-09 01:14:14', '2021-11-09 15:21:09');
INSERT INTO `order` VALUES ('ba1cb578-2575-4a94-9fce-f8314b441fc3', 'done', 3, 'fudan university', 1, '2021-11-11 05:00:06', '2021-11-11 05:00:06');
INSERT INTO `order` VALUES ('c2ff2157-0ace-4c8f-b032-228bb24ca6d8', 'doing', 19235.3, 'test 42address', 3, '2021-11-12 07:38:57', '2021-11-12 07:38:57');
INSERT INTO `order` VALUES ('cd56e534-1121-4a06-bfae-4cf66c807f18', 'done', 3, 'fudan university', 1, '2021-11-13 11:19:42', '2021-11-13 11:19:42');
INSERT INTO `order` VALUES ('d448132f-6f1a-4b15-9610-4ee299b9de38', 'done', 26.1, 'temp address', 1, '2021-11-11 04:36:03', '2021-11-11 04:36:03');
INSERT INTO `order` VALUES ('fd3ae145-da94-4f09-8663-06b04438197a', 'done', 26.1, 'temp address', 1, '2021-11-10 03:29:51', '2021-11-10 03:29:51');
COMMIT;

-- ----------------------------
-- Table structure for sub_order
-- ----------------------------
DROP TABLE IF EXISTS `sub_order`;
CREATE TABLE `sub_order` (
                             `id` varchar(36) NOT NULL,
                             `order_id` varchar(36) NOT NULL,
                             `status` varchar(32) NOT NULL,
                             `total_price` float DEFAULT NULL,
                             `address` varchar(64) NOT NULL,
                             `saler_id` int(11) NOT NULL,
                             `commodity_id` varchar(20) NOT NULL,
                             `commodity_name` varchar(20) NOT NULL,
                             `price` float NOT NULL,
                             `num` int(11) DEFAULT NULL,
                             `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sub_order
-- ----------------------------
BEGIN;
INSERT INTO `sub_order` VALUES ('02eb043e-78f4-4daa-961f-df6a82edf977', 'a876c6c3-841a-40a7-afa9-e17dab256eb2', 'done', 20.9, 'temp address', 6, '2021111010291583862', '5', 1.9, 11, '2021-11-10 17:35:53', '2021-11-10 17:35:53');
INSERT INTO `sub_order` VALUES ('03882d8a-ec65-427f-92be-b90664b8fa17', '235cc67b-ec30-4ac3-afbe-ab5fae95b761', 'done', 3, 'fudan university', 10, '2021111010291583862', '矿泉水', 3, 1, '2021-11-11 19:10:49', '2021-11-11 19:10:49');
INSERT INTO `sub_order` VALUES ('03e99dbb-89fa-4ca0-802f-24d14eaf6c85', '15fb23eb-45d4-4fc6-9dad-86e117bb8002', 'doing', 19198, 'test 42address', 5, '7', 'your beats', 1919.8, 10, '2021-11-14 01:04:14', '2021-11-14 01:04:14');
INSERT INTO `sub_order` VALUES ('088b3016-3c2c-42cb-869a-fdf456b856df', '86b91648-c9a7-43fa-8d37-3b84e5adaca7', 'done', 20.9, 'temp address', 6, '2021111010291583862', '5', 1.9, 11, '2021-11-10 10:37:19', '2021-11-10 10:37:19');
INSERT INTO `sub_order` VALUES ('20269a3c-ec07-47a3-8b9b-bc762cebb6a1', '5af53af3-cd07-4970-a373-52101e10bff9', 'done', 5.2, 'temp address', 2, '12', '123', 1.3, 4, '2021-11-02 21:15:57', '2021-11-02 21:15:57');
INSERT INTO `sub_order` VALUES ('29139553-73ae-4ca6-a450-d7f544eb4e1a', '86b91648-c9a7-43fa-8d37-3b84e5adaca7', 'done', 5.2, 'temp address', 2, '2021111010291583862', '123', 1.3, 4, '2021-11-10 10:37:19', '2021-11-10 10:37:19');
INSERT INTO `sub_order` VALUES ('3985f190-4e9e-4db4-a40a-bcc74f88f690', '30285761-4812-4d09-8ff1-b3045f45a9e4', 'done', 20.9, 'temp address', 6, '2021111010291583862', '5', 1.9, 11, '2021-11-11 18:25:24', '2021-11-11 18:25:24');
INSERT INTO `sub_order` VALUES ('3b46c136-5e3d-4df9-ae7a-4ae25e285257', '1375daff-cb05-4ad7-9351-726070950481', 'done', 3, 'fudan university', 10, '2021111010291583862', '矿泉水', 3, 1, '2021-11-14 12:35:35', '2021-11-14 12:35:35');
INSERT INTO `sub_order` VALUES ('3d86b891-8694-441c-854b-f784d0a6a21c', 'd448132f-6f1a-4b15-9610-4ee299b9de38', 'done', 20.9, 'temp address', 6, '2021111010291583862', '5', 1.9, 11, '2021-11-11 18:36:02', '2021-11-11 18:36:02');
INSERT INTO `sub_order` VALUES ('3d959355-fa58-4064-b4f3-8b33aaf15d4d', 'a876c6c3-841a-40a7-afa9-e17dab256eb2', 'done', 5.2, 'temp address', 2, '2021111010291583862', '123', 1.3, 4, '2021-11-10 17:35:53', '2021-11-10 17:35:53');
INSERT INTO `sub_order` VALUES ('4289c085-bc3a-4783-aca8-f3241c0e28a9', 'cd56e534-1121-4a06-bfae-4cf66c807f18', 'done', 3, 'fudan university', 10, '2021111010291583862', '矿泉水', 3, 1, '2021-11-14 01:19:42', '2021-11-14 01:19:42');
INSERT INTO `sub_order` VALUES ('44779d14-b5de-4488-9d23-5d92571867a2', 'c2ff2157-0ace-4c8f-b032-228bb24ca6d8', 'doing', 19198, 'test 42address', 5, '7', 'your beats', 1919.8, 10, '2021-11-12 21:39:01', '2021-11-12 21:39:01');
INSERT INTO `sub_order` VALUES ('519f0881-b2fe-4edb-8523-26394916feb2', '30285761-4812-4d09-8ff1-b3045f45a9e4', 'done', 5.2, 'temp address', 2, '2021111010291583862', '123', 1.3, 4, '2021-11-11 18:25:24', '2021-11-11 18:25:24');
INSERT INTO `sub_order` VALUES ('56331cfd-83b1-4a0d-b9a4-b5314e472871', '86bab10e-b9c5-4361-b928-a7dd01ce4fbc', 'done', 3, 'fudan university', 10, '2021111010291583862', '矿泉水', 3, 1, '2021-11-14 12:30:34', '2021-11-14 12:30:34');
INSERT INTO `sub_order` VALUES ('57312c4e-99be-4ca4-85fb-494c0ceb70a7', 'ba1cb578-2575-4a94-9fce-f8314b441fc3', 'done', 3, 'fudan university', 10, '2021111010291583862', '矿泉水', 3, 1, '2021-11-11 19:00:06', '2021-11-11 19:00:06');
INSERT INTO `sub_order` VALUES ('5bfd9748-54e8-42a1-9420-ba6eb32d715b', '5af53af3-cd07-4970-a373-52101e10bff9', 'done', 20.9, 'temp address', 6, '4', '5', 1.9, 11, '2021-11-02 21:15:57', '2021-11-02 21:15:57');
INSERT INTO `sub_order` VALUES ('6e7bc9b2-65bb-4bf8-a85b-b07ab71fa2e7', '8ba566df-4896-423d-9e9c-e1123c82a5fa', 'done', 3, 'fudan university', 10, '2021111010291583862', '矿泉水', 3, 1, '2021-11-14 01:09:16', '2021-11-14 01:09:16');
INSERT INTO `sub_order` VALUES ('7f9d4634-5782-4b1f-9d55-0a4677565d72', 'c2ff2157-0ace-4c8f-b032-228bb24ca6d8', 'doing', 37.35, 'test 42address', 3, '6', 'my soul', 12.45, 3, '2021-11-12 21:39:01', '2021-11-12 21:39:01');
INSERT INTO `sub_order` VALUES ('7ff94f39-ef14-47e2-9179-0d5800ec98b1', '652105d2-2229-4bde-ae2d-7532d073217b', 'done', 3, 'fudan university', 10, '2021111010291583862', '矿泉水', 3, 1, '2021-11-14 12:32:01', '2021-11-14 12:32:01');
INSERT INTO `sub_order` VALUES ('81de8925-0632-4791-b4a7-00ba1caea0a7', 'd448132f-6f1a-4b15-9610-4ee299b9de38', 'done', 5.2, 'temp address', 2, '2021111010291583862', '123', 1.3, 4, '2021-11-11 18:36:02', '2021-11-11 18:36:02');
INSERT INTO `sub_order` VALUES ('82b54683-7df0-4594-8acd-a5d39bacc788', '12f83b90-d279-4501-ba65-b36ad9e08072', 'done', 3, 'fudan university', 10, '2021111010291583862', '矿泉水', 3, 1, '2021-11-14 12:31:57', '2021-11-14 12:31:57');
INSERT INTO `sub_order` VALUES ('82fb3aa9-a71a-4dd7-8990-68eb954bc340', 'ab75e15f-c57a-419e-b61a-b12a50949eaf', 'doing', 19198, 'test address', 5, '7', 'your beats', 1919.8, 10, '2021-11-09 15:14:14', '2021-11-09 15:14:14');
INSERT INTO `sub_order` VALUES ('84d541a0-9440-4268-ab57-94a73d680aac', '2baf4c9c-bb55-43cd-8b20-32550cf9b4eb', 'done', 3, 'fudan university', 10, '2021111010291583862', '矿泉水', 3, 1, '2021-11-14 12:28:42', '2021-11-14 12:28:42');
INSERT INTO `sub_order` VALUES ('8ad0bebd-ca3f-446b-b5a5-5b54cd467f8f', '54476541-fd81-4165-a9d8-6e3860d3b91e', 'done', 3, 'fudan university', 10, '2021111010291583862', '矿泉水', 3, 1, '2021-11-11 19:12:05', '2021-11-11 19:12:05');
INSERT INTO `sub_order` VALUES ('8af178e6-254d-4ec5-8628-edc736285d47', '15fb23eb-45d4-4fc6-9dad-86e117bb8002', 'doing', 37.35, 'test 42address', 3, '6', 'my soul', 12.45, 3, '2021-11-14 01:04:14', '2021-11-14 01:04:14');
INSERT INTO `sub_order` VALUES ('99', '99', 'done', 5.2, 'temp address', 16, '2021111010291583862', '123', 1.3, 4, '2021-11-10 17:29:51', '2021-11-14 14:39:28');
INSERT INTO `sub_order` VALUES ('a8337634-a36c-4763-89e9-e72421a104c6', '4c02a727-0b2b-45ab-8e19-83213db8529a', 'done', 20.9, 'temp address', 6, '2021111010291583862', '5', 1.9, 11, '2021-11-10 17:35:37', '2021-11-10 17:35:37');
INSERT INTO `sub_order` VALUES ('c1f0a435-c54e-4cb8-80a1-5ab2dde2fd14', '5e0c0263-d6d3-4b14-8700-c561ba80abb4', 'done', 3, 'fudan university', 10, '2021111010291583862', '矿泉水', 3, 1, '2021-11-11 19:01:22', '2021-11-11 19:01:22');
INSERT INTO `sub_order` VALUES ('c233f9a0-b69b-47b0-a5c5-ac063e2d7ccf', 'fd3ae145-da94-4f09-8663-06b04438197a', 'done', 20.9, 'temp address', 6, '2021111010291583862', '5', 1.9, 11, '2021-11-10 17:29:51', '2021-11-10 17:29:51');
INSERT INTO `sub_order` VALUES ('c8c60c13-28c4-4c4a-b600-8c7a2aebde8b', '4c02a727-0b2b-45ab-8e19-83213db8529a', 'done', 5.2, 'temp address', 2, '2021111010291583862', '123', 1.3, 4, '2021-11-10 17:35:37', '2021-11-10 17:35:37');
INSERT INTO `sub_order` VALUES ('e062627f-f085-4fef-b634-c8ffa26a45ad', 'ab75e15f-c57a-419e-b61a-b12a50949eaf', 'doing', 37.35, 'test address', 3, '5', 'my soul', 12.45, 3, '2021-11-09 15:14:14', '2021-11-09 15:14:14');
COMMIT;

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
INSERT INTO `us_buyer` VALUES (1, 'joshua', '111', '11', '1', '2021-11-12 16:49:47', '2021-11-12 16:49:50');
INSERT INTO `us_buyer` VALUES (2, 'lingzixuan', 'e10adc3949ba59abbe56e057f20f883e', NULL, '10086', '2021-11-12 20:12:14', '2021-11-16 11:11:38');
COMMIT;

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

-- ----------------------------
-- Table structure for us_saler
-- ----------------------------
DROP TABLE IF EXISTS `us_saler`;
CREATE TABLE `us_saler` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `username` varchar(64) NOT NULL,
                            `password` varchar(255) NOT NULL,
                            `phone` varchar(64) NOT NULL,
                            `email` varchar(64) DEFAULT NULL,
                            `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of us_saler
-- ----------------------------
BEGIN;
INSERT INTO `us_saler` VALUES (13, 'joshuaMe', '202cb962ac59075b964b07152d234b70', '123', '123@qq.com', '2021-11-13 12:40:34', '2021-11-13 12:40:34');
INSERT INTO `us_saler` VALUES (14, 'saler', '03c91917aef63ae655821b365309432f', '123456', NULL, '2021-11-13 16:04:04', '2021-11-13 16:04:04');
INSERT INTO `us_saler` VALUES (16, 'xpc', '81dc9bdb52d04dc20036dbd8313ed055', '10086', NULL, '2021-11-13 16:08:32', '2021-11-13 16:08:32');
INSERT INTO `us_saler` VALUES (17, 'xxx', '202cb962ac59075b964b07152d234b70', '123', NULL, '2021-11-13 20:17:18', '2021-11-13 20:17:18');
INSERT INTO `us_saler` VALUES (18, 'aaa', '81dc9bdb52d04dc20036dbd8313ed055', '10086', NULL, '2021-11-13 20:41:31', '2021-11-13 20:41:31');
INSERT INTO `us_saler` VALUES (19, 'bbb', '81dc9bdb52d04dc20036dbd8313ed055', '10086', NULL, '2021-11-13 20:51:00', '2021-11-13 20:51:00');
INSERT INTO `us_saler` VALUES (20, 'test', '81dc9bdb52d04dc20036dbd8313ed055', '10086', NULL, '2021-11-14 10:19:24', '2021-11-14 10:19:24');
INSERT INTO `us_saler` VALUES (21, 't', '81dc9bdb52d04dc20036dbd8313ed055', '10086', NULL, '2021-11-14 10:22:59', '2021-11-14 10:22:59');
COMMIT;

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
-- Records of us_wallet
-- ----------------------------
BEGIN;
INSERT INTO `us_wallet` VALUES ('heyue2', 202111101504369803, 0, 'seller');
INSERT INTO `us_wallet` VALUES ('deangelo.rempel', 202111101837062363, 239.61, 'buyer');
INSERT INTO `us_wallet` VALUES ('heyue', 2021111015035332514, 0, 'seller');
INSERT INTO `us_wallet` VALUES ('heyue4', 2021111015173263553, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('heyue1', 2021111015180314494, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('admin', 2021111015413634737, 1898.4, 'admin');
INSERT INTO `us_wallet` VALUES ('deangelo', 2021111019492065428, 0, 'buyer');
INSERT INTO `us_wallet` VALUES ('lingzixuan', 2021111220121316525, 0, 'buyer');
INSERT INTO `us_wallet` VALUES ('deangelo.rempel23', 2021111221415947194, 0, '53oe2o');
INSERT INTO `us_wallet` VALUES ('deangelo.rempel333', 2021111221445546170, 0, '53oe2o');
INSERT INTO `us_wallet` VALUES ('ling22zixuan', 2021111221502076911, 0, 'seller');
INSERT INTO `us_wallet` VALUES ('xpc', 2021111316083210668, 100, 'saler');
INSERT INTO `us_wallet` VALUES ('xqb', 2021111319353333782, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('aaa', 2021111320413166051, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('bbb', 2021111320510113883, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('test', 2021111410192493487, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('t', 2021111410225913189, 0, 'saler');
COMMIT;

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

-- ----------------------------
-- Records of us_wallet_record
-- ----------------------------
BEGIN;
INSERT INTO `us_wallet_record` VALUES (-1, 'deangelo.rempel', '2021-11-10 18:58:20', -56.59, 725);
INSERT INTO `us_wallet_record` VALUES (-1, 'deangelo.rempel', '2021-11-10 18:58:34', -56.59, 725);
INSERT INTO `us_wallet_record` VALUES (-1, 'deangelo.rempel', '2021-11-10 19:03:43', -56.59, 725);
INSERT INTO `us_wallet_record` VALUES (-1, 'deangelo.rempel', '2021-11-10 19:04:43', -56.59, 725);
INSERT INTO `us_wallet_record` VALUES (-1, 'deangelo.rempel', '2021-11-10 19:06:22', 56.59, 725);
INSERT INTO `us_wallet_record` VALUES (-1, 'deangelo.rempel', '2021-11-10 19:49:46', 56.59, 725);
INSERT INTO `us_wallet_record` VALUES (-1, 'deangelo.rempel', '2021-11-10 19:52:02', 86.6, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'admin', '2021-11-10 19:54:09', 86.6, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'deangelo.rempel', '2021-11-10 19:55:41', -56.59, 725);
INSERT INTO `us_wallet_record` VALUES (-1, 'admin', '2021-11-10 19:58:07', 1000000000, 725);
INSERT INTO `us_wallet_record` VALUES (-1, 'admin', '2021-11-10 20:02:26', -1000000000, 725);
INSERT INTO `us_wallet_record` VALUES (-1, 'deangelo.rempel', '2021-11-10 20:08:04', 86.6, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'admin', '2021-11-10 20:08:31', 86.6, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'admin', '2021-11-12 21:42:18', 862.6, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'admin', '2021-11-12 21:42:27', 862.6, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'xpc', '2021-11-12 21:42:27', 100, 99);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

