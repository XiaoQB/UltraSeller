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

 Date: 17/12/2021 19:08:15
*/

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
                           `address` longtext,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of Shopcar
-- ----------------------------
BEGIN;
INSERT INTO `Shopcar` VALUES (7, 123, '2021111010291583862', '1', '2021-11-03 16:16:00.000000', '2021-11-03 16:16:00.000000', 8, NULL);
INSERT INTO `Shopcar` VALUES (9, 30123123, '2021112819491078893', '1', '2021-11-03 16:16:00.000000', '2021-11-03 16:16:00.000000', 8, NULL);
INSERT INTO `Shopcar` VALUES (32, 52, '2021111415214971336', '1', '2021-11-03 16:16:00.000000', '2021-11-03 16:16:00.000000', 4, NULL);
INSERT INTO `Shopcar` VALUES (33, 52, '2021111010291583862', '1', '2021-11-03 16:16:00.000000', '2021-11-03 16:16:00.000000', 8, NULL);
INSERT INTO `Shopcar` VALUES (34, 52, '2021112819491078893', '1', '2021-11-03 16:16:00.000000', '2021-11-03 16:16:00.000000', 8, NULL);
INSERT INTO `Shopcar` VALUES (35, 52, '2021111323171493548', '1', '2021-11-03 16:16:00.000000', '2021-11-03 16:16:00.000000', 6, NULL);
INSERT INTO `Shopcar` VALUES (36, 23, '2021111323171493548', '1', '2021-11-03 16:16:00.000000', '2021-11-03 16:16:00.000000', 10, NULL);
INSERT INTO `Shopcar` VALUES (37, 51, '2021111323171493548', '1', '2021-11-03 16:16:00.000000', '2021-11-03 16:16:00.000000', 10, NULL);
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `django_migrations` VALUES (21, 'testapp', '0003_cart_address', '2021-12-13 09:27:40.503497');
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
INSERT INTO `order` VALUES ('054ed665-85f5-48b2-8517-c700b32a0bb4', 'done', 12500, 'fudan university', 1, '2021-11-29 11:48:58', '2021-11-29 11:48:58');
INSERT INTO `order` VALUES ('1193862d-3dec-42bc-a6e4-1ba82ce9d2e2', 'WAIT_TO_PAY', 212, '二叉楼 david', 62, '2021-12-17 17:21:14', '2021-12-17 17:21:14');
INSERT INTO `order` VALUES ('119f9076-6302-495f-bba5-9a37aba19935', 'done', 2500, 'fudan university', 30123123, '2021-12-05 19:29:16', '2021-12-05 19:29:16');
INSERT INTO `order` VALUES ('12f83b90-d279-4501-ba65-b36ad9e08072', 'done', 3, 'fudan university', 1, '2021-11-13 22:31:58', '2021-11-13 22:31:58');
INSERT INTO `order` VALUES ('1375daff-cb05-4ad7-9351-726070950481', 'done', 3, 'fudan university', 1, '2021-11-13 22:35:35', '2021-11-13 22:35:35');
INSERT INTO `order` VALUES ('14432444-6b6f-4a40-a800-8167f6bcdfc0', 'done', 2501, 'fudan university', 30123123, '2021-12-07 18:51:07', '2021-12-07 18:51:07');
INSERT INTO `order` VALUES ('15fb23eb-45d4-4fc6-9dad-86e117bb8002', 'doing', 19235.3, 'test 42address', 3, '2021-11-13 11:04:14', '2021-11-13 11:04:14');
INSERT INTO `order` VALUES ('1b10e0cb-c6fb-4913-8fec-2a95e7cd7954', 'done', 2500, 'fudan university', 30123123, '2021-12-07 18:27:50', '2021-12-07 18:27:50');
INSERT INTO `order` VALUES ('1e3298c6-5799-4099-bd94-606323f6509b', 'WAIT_TO_RECEIPT', 200000, '江湾生活园区', 51, '2021-12-12 16:26:10', '2021-12-17 09:54:39');
INSERT INTO `order` VALUES ('1eac6a9c-6915-40ff-822c-7357889671c1', 'done', 2500, 'fudan university', 30123123, '2021-12-05 19:28:30', '2021-12-05 19:28:30');
INSERT INTO `order` VALUES ('1f361c04-be35-4cfb-8dec-46b73e0bcebe', 'WAIT_TO_PAY', 40, '二叉楼aaa', 51, '2021-12-15 16:16:51', '2021-12-15 16:16:51');
INSERT INTO `order` VALUES ('1f889b86-f089-40b7-aa73-b5c9ba2e39f3', 'WAIT_TO_PAY', 40, 'david的家中', 51, '2021-12-12 16:35:41', '2021-12-12 16:35:41');
INSERT INTO `order` VALUES ('1faa0dfb-90a9-42bd-9607-fba3862ec643', 'WAIT_TO_PAY', 8640, '两个商品', 51, '2021-12-15 07:54:28', '2021-12-15 07:54:28');
INSERT INTO `order` VALUES ('235cc67b-ec30-4ac3-afbe-ab5fae95b761', 'done', 3, 'fudan university', 1, '2021-11-11 05:10:49', '2021-11-11 05:10:49');
INSERT INTO `order` VALUES ('2b197823-8d26-479a-92bf-cb2f829c0d1d', 'doing', 19235.3, '叉二122', 50, '2021-12-15 07:28:06', '2021-12-15 07:28:06');
INSERT INTO `order` VALUES ('2baf4c9c-bb55-43cd-8b20-32550cf9b4eb', 'done', 3, 'fudan university', 1, '2021-11-13 22:28:42', '2021-11-13 22:28:42');
INSERT INTO `order` VALUES ('2d56a000-81ff-4795-a2c0-033b0a27727c', 'done', 2500, 'fudan university', 52, '2021-12-07 18:12:44', '2021-12-07 18:12:44');
INSERT INTO `order` VALUES ('30285761-4812-4d09-8ff1-b3045f45a9e4', 'done', 26.1, 'temp address', 1, '2021-11-11 04:25:24', '2021-11-11 04:25:24');
INSERT INTO `order` VALUES ('32c908c8-1b68-4daf-a9fc-113463dc9f50', 'done', 2500, 'fudan university', 52, '2021-12-07 18:14:58', '2021-12-07 18:14:58');
INSERT INTO `order` VALUES ('39a731d6-4e70-456e-a26d-9073d492b05d', 'WAIT_TO_PAY', 11520, '二叉楼 D2020', 51, '2021-12-13 09:43:44', '2021-12-13 09:43:44');
INSERT INTO `order` VALUES ('39ebd845-15b2-492d-8d69-ba0a8efb65e3', 'WAIT_TO_PAY', 0, '二叉楼', 59, '2021-12-14 17:28:41', '2021-12-14 17:28:41');
INSERT INTO `order` VALUES ('3d490797-7d91-4e53-b370-282cb7040c89', 'done', 12500, 'fudan university', 1, '2021-11-29 11:55:22', '2021-11-29 11:55:22');
INSERT INTO `order` VALUES ('4156cde5-49aa-48cc-8914-557620bc2794', 'done', 100000000, 'fudan university', 1, '2021-11-29 11:33:30', '2021-11-29 11:33:30');
INSERT INTO `order` VALUES ('416a9f58-187b-4f55-b506-a4d6f6693d2d', 'done', 2500, 'fudan university', 52, '2021-12-07 18:10:40', '2021-12-07 18:10:40');
INSERT INTO `order` VALUES ('4961a94c-bd21-4bdc-ad99-91ca09b3fa43', 'done', 2500, 'fudan university', 52, '2021-12-07 17:58:53', '2021-12-07 17:58:53');
INSERT INTO `order` VALUES ('49de9d48-4ee9-49e4-b0b6-c5caeeb0a4d2', 'doing', 19235.3, '叉二122', 50, '2021-12-15 07:28:52', '2021-12-15 07:28:52');
INSERT INTO `order` VALUES ('4c02a727-0b2b-45ab-8e19-83213db8529a', 'done', 26.1, 'temp address', 3, '2021-11-10 03:35:36', '2021-11-10 03:35:36');
INSERT INTO `order` VALUES ('5246c7c5-8b06-47da-8f4c-84bb88d06cb8', 'doing', 19235.3, '叉二122', 50, '2021-12-15 07:29:00', '2021-12-15 07:29:00');
INSERT INTO `order` VALUES ('5393c6b0-4dcc-4c4a-900f-024f0a063005', 'done', 12500, 'fudan university', 1, '2021-11-29 11:52:12', '2021-11-29 11:52:12');
INSERT INTO `order` VALUES ('54476541-fd81-4165-a9d8-6e3860d3b91e', 'done', 3, 'fudan university', 1, '2021-11-11 05:12:06', '2021-11-11 05:12:06');
INSERT INTO `order` VALUES ('55b27b07-e60f-4bce-9b45-56f6952613f9', 'WAIT_TO_PAY', 5760, 'wwwww', 51, '2021-12-15 07:53:02', '2021-12-15 07:53:02');
INSERT INTO `order` VALUES ('592705b8-f327-43a2-917f-0b0332abf0b1', 'done', 2500, 'fudan university', 52, '2021-12-07 18:15:10', '2021-12-07 18:15:10');
INSERT INTO `order` VALUES ('5964f64d-0416-4a60-aa39-08eb0548aa5d', 'done', 2501, 'fudan university', 30123123, '2021-12-07 18:49:42', '2021-12-07 18:49:42');
INSERT INTO `order` VALUES ('5af53af3-cd07-4970-a373-52101e10bff9', 'done', 26.1, 'temp address', 1, '2021-11-02 08:15:57', '2021-11-02 08:15:57');
INSERT INTO `order` VALUES ('5d21ee2a-514f-4cc3-a2a2-e6b2708486b8', 'done', 2500, 'fudan university', 52, '2021-12-07 18:11:35', '2021-12-07 18:11:35');
INSERT INTO `order` VALUES ('5e0c0263-d6d3-4b14-8700-c561ba80abb4', 'done', 3, 'fudan university', 1, '2021-11-11 05:01:22', '2021-11-11 05:01:22');
INSERT INTO `order` VALUES ('5e603647-f5fe-45c2-8df6-401c0a750a58', 'done', 12500, 'fudan university', 1, '2021-11-29 11:41:22', '2021-11-29 11:41:22');
INSERT INTO `order` VALUES ('5facfa46-2797-478c-8fa3-3a74ee7eba18', 'done', 12500, 'fudan university', 1, '2021-11-29 11:51:52', '2021-11-29 11:51:52');
INSERT INTO `order` VALUES ('652105d2-2229-4bde-ae2d-7532d073217b', 'done', 3, 'fudan university', 1, '2021-11-13 22:32:01', '2021-11-13 22:32:01');
INSERT INTO `order` VALUES ('6879ba9c-87a7-4da4-b33b-8ecdaf38e3ea', 'WAIT_TO_PAY', 199999, '二叉楼 david', 62, '2021-12-17 17:22:53', '2021-12-17 17:22:53');
INSERT INTO `order` VALUES ('695305aa-5480-4894-a448-563570c93be2', 'done', 2501, 'fudan university', 30123123, '2021-12-07 18:56:10', '2021-12-07 18:56:10');
INSERT INTO `order` VALUES ('6a24173d-2a13-4258-abc7-239eced4d0d4', 'done', 100000000, 'fudan university', 1, '2021-11-29 11:37:00', '2021-11-29 11:37:00');
INSERT INTO `order` VALUES ('728da79d-8da4-4e85-99a3-2d1442cf98bf', 'done', 2501, 'fudan university', 30123123, '2021-12-07 18:53:39', '2021-12-07 18:53:39');
INSERT INTO `order` VALUES ('729e7405-83a7-4757-9181-92f0a6f3d496', 'done', 12500, 'fudan university', 1, '2021-11-29 11:50:14', '2021-11-29 11:50:14');
INSERT INTO `order` VALUES ('7326f979-320a-47dd-9103-b844e9c60a02', 'done', 12500, 'fudan university', 1, '2021-11-29 11:49:15', '2021-11-29 11:49:15');
INSERT INTO `order` VALUES ('7a9215a6-e8c2-4c48-888a-82e77a507d6c', 'done', 2500, 'fudan university', 30123123, '2021-11-29 11:28:07', '2021-11-29 11:28:07');
INSERT INTO `order` VALUES ('7ad2713d-1d64-42c0-b0c4-4e9c3e03b9cc', 'done', 12500, 'fudan university', 1, '2021-11-29 11:53:12', '2021-11-29 11:53:12');
INSERT INTO `order` VALUES ('86b91648-c9a7-43fa-8d37-3b84e5adaca7', 'done', 26.1, 'temp address', 1, '2021-11-09 20:37:19', '2021-11-09 20:37:19');
INSERT INTO `order` VALUES ('86bab10e-b9c5-4361-b928-a7dd01ce4fbc', 'done', 3, 'fudan university', 1, '2021-11-13 22:30:34', '2021-11-13 22:30:34');
INSERT INTO `order` VALUES ('88de7256-e689-4c10-9e84-001dbaec7a9a', 'done', 12500, 'fudan university', 1, '2021-11-29 11:52:53', '2021-11-29 11:52:53');
INSERT INTO `order` VALUES ('8b74a6d0-d3a9-4665-bd37-d8d20d86d6bf', 'done', 2500, 'fudan university', 30123123, '2021-12-03 15:56:48', '2021-12-03 15:56:48');
INSERT INTO `order` VALUES ('8ba566df-4896-423d-9e9c-e1123c82a5fa', 'done', 3, 'fudan university', 1, '2021-11-13 11:09:17', '2021-11-13 11:09:17');
INSERT INTO `order` VALUES ('8fb99eae-d7e3-4529-b7b0-0f728dd8db3c', 'done', 2501, 'fudan university', 30123123, '2021-12-07 18:53:46', '2021-12-07 18:53:46');
INSERT INTO `order` VALUES ('93143b2c-a50d-472e-af39-954428290798', 'done', 4, 'fudan university', 1, '2021-11-17 15:06:28', '2021-11-17 15:06:28');
INSERT INTO `order` VALUES ('956f826f-f486-4385-8341-ed5cc0cb8796', 'done', 2500, 'fudan university', 30123123, '2021-11-29 12:11:29', '2021-11-29 12:11:29');
INSERT INTO `order` VALUES ('99106c20-4db6-4424-8fcd-276e9a531b1d', 'doing', 19235.3, '叉二122', 50, '2021-12-15 07:28:40', '2021-12-15 07:28:40');
INSERT INTO `order` VALUES ('991fe023-750d-40dd-9b61-3ceba56a2f07', 'WAIT_TO_PAY', 2880, '', 51, '2021-12-15 07:49:03', '2021-12-15 07:49:03');
INSERT INTO `order` VALUES ('9cb1e5ca-e84b-44db-87d6-e19eb6e0339c', 'done', 12500, 'fudan university', 1, '2021-11-29 11:56:18', '2021-11-29 11:56:18');
INSERT INTO `order` VALUES ('a8035370-3be2-4b39-a146-643b6dde0bc0', 'WAIT_TO_PAY', 22300, '二叉楼', 51, '2021-12-15 17:58:39', '2021-12-15 17:58:39');
INSERT INTO `order` VALUES ('a876c6c3-841a-40a7-afa9-e17dab256eb2', 'done', 26.1, 'temp address', 3, '2021-11-10 03:35:54', '2021-11-10 03:35:54');
INSERT INTO `order` VALUES ('a9a080bb-b2c0-4135-b05a-379838fc19c0', 'done', 12500, 'fudan university', 30123123, '2021-11-29 11:56:56', '2021-11-29 11:56:56');
INSERT INTO `order` VALUES ('a9d3622c-5c09-4e59-90e9-1230297b6719', 'done', 20000000, 'fudan university', 1, '2021-11-29 11:31:10', '2021-11-29 11:31:10');
INSERT INTO `order` VALUES ('ab75e15f-c57a-419e-b61a-b12a50949eaf', 'doing', 19235.3, 'test address', 10, '2021-11-09 01:14:14', '2021-11-09 15:21:09');
INSERT INTO `order` VALUES ('ad15f1e9-70e9-4c7b-bdd9-27d06720f944', 'done', 2501, 'fudan university', 30123123, '2021-12-07 18:50:11', '2021-12-07 18:50:11');
INSERT INTO `order` VALUES ('ae01e227-0a6d-4378-ac34-efccaf2b209b', 'done', 12500, 'fudan university', 1, '2021-11-29 11:47:44', '2021-11-29 11:47:44');
INSERT INTO `order` VALUES ('ae9574f3-c136-4b75-b494-db1b8fdba76a', 'done', 2501, 'fudan university', 30123123, '2021-12-07 18:56:45', '2021-12-07 18:56:45');
INSERT INTO `order` VALUES ('aeccfdb5-54ef-46a1-9409-c5fd35ba1801', 'done', 4, 'fudan university', 1, '2021-11-17 14:44:28', '2021-11-17 14:44:28');
INSERT INTO `order` VALUES ('b031fb89-c049-4dc5-9653-69c32fb550e9', 'done', 19235.3, '复旦大学江湾校区', 3123, '2021-11-25 22:39:50', '2021-11-25 22:54:28');
INSERT INTO `order` VALUES ('b44ab66f-2caf-4f4a-8c1b-71b8ac53456a', 'done', 12500, 'fudan university', 1, '2021-11-29 11:54:27', '2021-11-29 11:54:27');
INSERT INTO `order` VALUES ('ba1cb578-2575-4a94-9fce-f8314b441fc3', 'done', 3, 'fudan university', 1, '2021-11-11 05:00:06', '2021-11-11 05:00:06');
INSERT INTO `order` VALUES ('ba23d8d4-d886-485d-955f-df1e7de2e968', 'WAIT_TO_PAY', 100, '二叉楼 最新的', 51, '2021-12-14 12:10:32', '2021-12-14 12:10:32');
INSERT INTO `order` VALUES ('c2ff2157-0ace-4c8f-b032-228bb24ca6d8', 'doing', 19235.3, 'test 42address', 3, '2021-11-12 07:38:57', '2021-11-12 07:38:57');
INSERT INTO `order` VALUES ('c60a7090-16fa-4040-be9b-237b971d78da', 'done', 12500, 'fudan university', 30123123, '2021-11-29 12:08:03', '2021-11-29 12:08:03');
INSERT INTO `order` VALUES ('ccf27ddd-a26c-4e04-9a5f-513192083642', 'done', 12500, 'fudan university', 1, '2021-11-29 11:48:40', '2021-11-29 11:48:40');
INSERT INTO `order` VALUES ('cd56e534-1121-4a06-bfae-4cf66c807f18', 'done', 3, 'fudan university', 1, '2021-11-13 11:19:42', '2021-11-13 11:19:42');
INSERT INTO `order` VALUES ('d2b876c7-2a99-4c2a-91f2-fcd4563827ca', 'done', 2500, 'fudan university', 52, '2021-12-07 18:12:50', '2021-12-07 18:12:50');
INSERT INTO `order` VALUES ('d448132f-6f1a-4b15-9610-4ee299b9de38', 'done', 26.1, 'temp address', 1, '2021-11-11 04:36:03', '2021-11-11 04:36:03');
INSERT INTO `order` VALUES ('df7a6444-25e5-4f11-bd8c-80cbf92afe66', 'done', 2500, 'fudan university', 30123123, '2021-12-05 17:03:45', '2021-12-05 17:03:45');
INSERT INTO `order` VALUES ('e2a9fe9a-44e1-4dbb-87bb-094ea93fe999', 'WAIT_TO_PAY', 20, 'hahaah', 51, '2021-12-12 16:25:23', '2021-12-12 16:25:23');
INSERT INTO `order` VALUES ('eaff932f-f8ae-489b-8959-8e92bd0900ae', 'done', 2500, 'fudan university', 52, '2021-12-07 18:06:40', '2021-12-07 18:06:40');
INSERT INTO `order` VALUES ('eb5e5a3e-0cf8-4842-9dda-648e1df11517', 'done', 2501, 'fudan university', 30123123, '2021-12-07 18:54:37', '2021-12-07 18:54:37');
INSERT INTO `order` VALUES ('ec133e54-7b2d-4b46-87e9-5e0c0b5fc6c8', 'done', 5000, 'fudan university', 30123123, '2021-12-07 18:48:30', '2021-12-07 18:48:30');
INSERT INTO `order` VALUES ('ed0d02af-8692-4300-83c2-8f64ebda0548', 'doing', 19235.3, '叉二122', 50, '2021-12-15 07:29:46', '2021-12-15 07:29:46');
INSERT INTO `order` VALUES ('f63e0fc7-cce5-4a91-8a39-07f960cfd5e4', 'doing', 19235.3, '叉二', 24, '2021-11-28 20:02:28', '2021-11-28 20:02:28');
INSERT INTO `order` VALUES ('fdbc2082-39da-456d-98f1-6d5fb3592440', 'done', 19235.3, '江湾生活园区', 50, '2021-11-28 21:22:58', '2021-12-17 10:12:47');
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
                             `logistics` varchar(64) DEFAULT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sub_order
-- ----------------------------
BEGIN;
INSERT INTO `sub_order` VALUES ('00b0e501-c913-4281-a485-3c97dbdd1ab9', '592705b8-f327-43a2-917f-0b0332abf0b1', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:15:18', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('015c3143-e04d-41ea-8f0d-b429ef0985f5', '9ccb8dd2-e049-4119-90ae-e61f53062ac7', 'doing', 19198, '叉二', 5, '2021121509191122753', 'your beats', 1919.8, 10, '2021-11-28 19:58:01', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('021a3fd5-5953-4b10-8f12-3c4da37b41fa', '8d04339a-3629-489f-b348-ea2c2cf61bc5', 'doing', 37.35, '叉二', 3, '2021121509191122753', 'my soul', 12.45, 3, '2021-11-28 19:37:01', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('02eb043e-78f4-4daa-961f-df6a82edf977', 'a876c6c3-841a-40a7-afa9-e17dab256eb2', 'done', 20.9, 'temp address', 6, '2021121509191122753', '5', 1.9, 11, '2021-11-10 17:35:53', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('03882d8a-ec65-427f-92be-b90664b8fa17', '235cc67b-ec30-4ac3-afbe-ab5fae95b761', 'done', 3, 'fudan university', 10, '2021121509191122753', '矿泉水', 3, 1, '2021-11-11 19:10:49', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('03e99dbb-89fa-4ca0-802f-24d14eaf6c85', '15fb23eb-45d4-4fc6-9dad-86e117bb8002', 'doing', 19198, 'test 42address', 5, '2021121509191122753', 'your beats', 1919.8, 10, '2021-11-14 01:04:14', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('088b3016-3c2c-42cb-869a-fdf456b856df', '86b91648-c9a7-43fa-8d37-3b84e5adaca7', 'done', 20.9, 'temp address', 6, '2021121509191122753', '5', 1.9, 11, '2021-11-10 10:37:19', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('08ce0e41-031f-44b8-bea7-b66e68bc03cf', '695305aa-5480-4894-a448-563570c93be2', 'done', 1, 'fudan university', 0, '2021121509191122753', '苹果', 1, 1, '2021-12-07 18:56:18', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('091c33ee-8f84-4a74-bb19-68bb819ea453', '7ad2713d-1d64-42c0-b0c4-4e9c3e03b9cc', 'done', 12500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 5, '2021-11-29 11:53:12', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('099be88c-2660-43ab-9234-41e214cf4533', '1193862d-3dec-42bc-a6e4-1ba82ce9d2e2', 'WAIT_TO_PAY', 212, '二叉楼 david', 0, '2021121509214626412', '刺客信条：黑棋', 212, 1, '2021-12-17 17:21:14', '2021-12-17 17:21:14', NULL);
INSERT INTO `sub_order` VALUES ('0e68b386-b725-4860-a283-1ebac3a7d2c7', 'eb5e5a3e-0cf8-4842-9dda-648e1df11517', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:54:44', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('0f52c8d9-da7b-465f-a23a-0b7c60a76ba4', '181fbbb5-85e5-4499-b822-5418dec8b429', 'doing', 19198, '叉二', 5, '2021121509191122753', 'your beats', 1919.8, 10, '2021-11-28 19:33:44', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('15c4ef99-a4a6-415d-818d-f4f7dc7a5e09', '93143b2c-a50d-472e-af39-954428290798', 'done', 4, 'fudan university', 10, '2021121509191122753', '矿泉水', 4, 1, '2021-11-17 15:06:27', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('17b9ac4e-2e30-4bf4-95e9-c0c3e1bf0997', 'fdbc2082-39da-456d-98f1-6d5fb3592440', 'WAIT_TO_TRANSFER', 37.35, '交叉1', 24, '2021121509191122753', '1', 12.45, 3, '2021-11-28 21:22:58', '2021-12-17 10:12:47', '在中转站');
INSERT INTO `sub_order` VALUES ('1aba2262-49ae-4e8e-bfca-7407d61c1876', '8fb99eae-d7e3-4529-b7b0-0f728dd8db3c', 'done', 1, 'fudan university', 0, '2021121509191122753', '苹果', 1, 1, '2021-12-07 18:53:53', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('1bb5054f-a88d-4941-a204-00bdd430997b', '9ccb8dd2-e049-4119-90ae-e61f53062ac7', 'doing', 37.35, '叉二', 3, '2021121509191122753', 'my soul', 12.45, 3, '2021-11-28 19:58:01', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('1c2f5a3b-88be-4329-986c-e35ac6efcef0', '7efde4ea-8ce7-4e66-b8fe-0c4ac2c00c10', 'doing', 19198, '叉二122', 24, '2021121509191122753', '2', 1919.8, 10, '2021-11-28 20:04:11', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('1f8c5f86-311c-43c6-8fc7-a181785dd262', 'b031fb89-c049-4dc5-9653-69c32fb550e9', 'doing', 19198, '叉二', 5, '2021121509191122753', 'your beats', 1919.8, 10, '2021-11-25 22:39:50', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('20233490-59b0-4e3d-bc88-790afbdd1b17', 'ec133e54-7b2d-4b46-87e9-5e0c0b5fc6c8', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:48:37', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('20269a3c-ec07-47a3-8b9b-bc762cebb6a1', '5af53af3-cd07-4970-a373-52101e10bff9', 'done', 5.2, 'temp address', 2, '2021121509191122753', '123', 1.3, 4, '2021-11-02 21:15:57', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('21978dab-4322-46c0-b67f-7f8fdb3393b4', '1e3298c6-5799-4099-bd94-606323f6509b', 'COMPLETE', 200000, '交叉1', 0, '2021121509191122753', '狗狗', 100000, 2, '2021-12-12 16:26:10', '2021-12-17 09:54:39', '在中转站');
INSERT INTO `sub_order` VALUES ('223aaad5-966a-49e2-88b7-d8715496f029', 'e2a9fe9a-44e1-4dbb-87bb-094ea93fe999', 'WAIT_TO_TRANSFER', 20, 'hahaah', 0, '2021121509191122753', '杯子', 10, 2, '2021-12-12 16:25:23', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('23423ad5-cc4c-4b39-b037-a428820e4f01', 'ed0d02af-8692-4300-83c2-8f64ebda0548', 'doing', 19198, '叉二122', 24, '2021121509191122753', '2', 1919.8, 10, '2021-12-15 07:29:46', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('29139553-73ae-4ca6-a450-d7f544eb4e1a', '86b91648-c9a7-43fa-8d37-3b84e5adaca7', 'done', 5.2, 'temp address', 2, '2021121509191122753', '123', 1.3, 4, '2021-11-10 10:37:19', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('2c066195-f7bb-4311-8e96-066c59bfb6bb', '49de9d48-4ee9-49e4-b0b6-c5caeeb0a4d2', 'doing', 37.35, '叉二122', 24, '2021121509191122753', '1', 12.45, 3, '2021-12-15 07:28:52', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('2efb98b1-09a4-499a-8b27-07af778cfc83', 'd2b876c7-2a99-4c2a-91f2-fcd4563827ca', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:12:57', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('331b73fe-b757-4ea0-a785-d83ade366d7a', 'ad15f1e9-70e9-4c7b-bdd9-27d06720f944', 'done', 1, 'fudan university', 0, '2021121509191122753', '苹果', 1, 1, '2021-12-07 18:50:18', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('34493be8-2ce3-4e77-9f76-a84ad0facc53', '7efde4ea-8ce7-4e66-b8fe-0c4ac2c00c10', 'doing', 37.35, '叉二122', 24, '2021121509191122753', '1', 12.45, 3, '2021-11-28 20:04:11', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('36e7aaec-18c0-4b63-a7d0-8c2e0e9955ed', 'f63e0fc7-cce5-4a91-8a39-07f960cfd5e4', 'doing', 19198, '叉二', 5, '2021121509191122753', 'your beats', 1919.8, 10, '2021-11-28 20:02:28', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('37e3b92f-6861-46ab-a2fe-03c48d7f4339', '416a9f58-187b-4f55-b506-a4d6f6693d2d', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:10:48', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('3985f190-4e9e-4db4-a40a-bcc74f88f690', '30285761-4812-4d09-8ff1-b3045f45a9e4', 'done', 20.9, 'temp address', 6, '2021121509191122753', '5', 1.9, 11, '2021-11-11 18:25:24', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('3a00d549-72e0-4657-a9cf-56b5bdf8cd13', 'ed0d02af-8692-4300-83c2-8f64ebda0548', 'doing', 37.35, '叉二122', 24, '2021121509191122753', '1', 12.45, 3, '2021-12-15 07:29:46', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('3b46c136-5e3d-4df9-ae7a-4ae25e285257', '1375daff-cb05-4ad7-9351-726070950481', 'done', 3, 'fudan university', 10, '2021121509191122753', '矿泉水', 3, 1, '2021-11-14 12:35:35', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('3bd583dc-b4ed-4344-a5f4-2b9c6ad17840', '361f47e6-2fd3-4b85-858e-aae952ee7052', 'doing', 19198, '叉二122', 24, '2021121509191122753', '2', 1919.8, 10, '2021-11-28 21:13:58', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('3d86b891-8694-441c-854b-f784d0a6a21c', 'd448132f-6f1a-4b15-9610-4ee299b9de38', 'done', 20.9, 'temp address', 6, '2021121509191122753', '5', 1.9, 11, '2021-11-11 18:36:02', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('3d959355-fa58-4064-b4f3-8b33aaf15d4d', 'a876c6c3-841a-40a7-afa9-e17dab256eb2', 'done', 5.2, 'temp address', 2, '2021121509191122753', '123', 1.3, 4, '2021-11-10 17:35:53', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('3e211f59-7b97-4b9e-8908-04bf78052912', 'a9a080bb-b2c0-4135-b05a-379838fc19c0', 'done', 12500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 5, '2021-11-29 11:56:56', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('40d372c7-5794-48f2-8f27-693d619e2758', '4b7b64df-2bd6-43fe-a3e6-e60be01ca6eb', 'doing', 37.35, '叉二122', 24, '2021121509191122753', '1', 12.45, 3, '2021-11-28 21:26:13', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('423dcc4f-5ec2-4b85-9ecb-a349368c699e', '991fe023-750d-40dd-9b61-3ceba56a2f07', 'WAIT_TO_PAY', 2880, '', 1, '2021121509191122753', '白酒', 2880, 1, '2021-12-15 07:49:03', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('4289c085-bc3a-4783-aca8-f3241c0e28a9', 'cd56e534-1121-4a06-bfae-4cf66c807f18', 'done', 3, 'fudan university', 10, '2021121509191122753', '矿泉水', 3, 1, '2021-11-14 01:19:42', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('44779d14-b5de-4488-9d23-5d92571867a2', 'c2ff2157-0ace-4c8f-b032-228bb24ca6d8', 'doing', 19198, 'test 42address', 5, '2021121509191122753', 'your beats', 1919.8, 10, '2021-11-12 21:39:01', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('45ac0338-aaa7-4e31-b5b5-2a73521e0057', '99106c20-4db6-4424-8fcd-276e9a531b1d', 'doing', 19198, '叉二122', 24, '2021121509191122753', '2', 1919.8, 10, '2021-12-15 07:28:40', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('50e9db80-17e8-4ea7-b08e-fcb3838cd39c', 'e5c2cceb-1e71-4fba-bf64-1d0b9543c9a3', 'doing', 37.35, '叉二', 3, '2021121509191122753', 'my soul', 12.45, 3, '2021-11-25 22:39:59', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('519f0881-b2fe-4edb-8523-26394916feb2', '30285761-4812-4d09-8ff1-b3045f45a9e4', 'done', 5.2, 'temp address', 2, '2021121509191122753', '123', 1.3, 4, '2021-11-11 18:25:24', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('520f5a95-6d7a-4e4f-b202-693f084c0e04', '6a24173d-2a13-4258-abc7-239eced4d0d4', 'done', 100000000, 'fudan university', 0, '2021121509191122753', '11282', 20000000, 5, '2021-11-29 11:36:59', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('52c41f5e-168e-4963-a365-5dcd01d12941', '1f361c04-be35-4cfb-8dec-46b73e0bcebe', 'WAIT_TO_PAY', 40, '二叉楼aaa', 0, '2021121509191122753', '水杯', 10, 4, '2021-12-15 16:16:51', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('53da1dff-fac2-4a33-8027-c7e1ffc4f03e', 'eaff932f-f8ae-489b-8959-8e92bd0900ae', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:06:48', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('56331cfd-83b1-4a0d-b9a4-b5314e472871', '86bab10e-b9c5-4361-b928-a7dd01ce4fbc', 'done', 3, 'fudan university', 10, '2021121509191122753', '矿泉水', 3, 1, '2021-11-14 12:30:34', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('566d9563-3166-48e9-8ad1-ae8a930bbddd', 'a5d445d7-3f05-421d-8f96-11c4a208a57b', 'doing', 19198, '叉二', 5, '2021121509191122753', 'your beats', 1919.8, 10, '2021-11-28 18:59:45', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('57312c4e-99be-4ca4-85fb-494c0ceb70a7', 'ba1cb578-2575-4a94-9fce-f8314b441fc3', 'done', 3, 'fudan university', 10, '2021121509191122753', '矿泉水', 3, 1, '2021-11-11 19:00:06', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('576ecaed-41e5-44f4-827d-53c786108454', '119f9076-6302-495f-bba5-9a37aba19935', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-05 19:29:21', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('587cee92-1de1-46d7-a1ae-d0a71dcfc2de', '1b10e0cb-c6fb-4913-8fec-2a95e7cd7954', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:27:58', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('5b37e07f-6bc6-4936-a978-bf94ead52718', 'ae9574f3-c136-4b75-b494-db1b8fdba76a', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:56:53', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('5bfd9748-54e8-42a1-9420-ba6eb32d715b', '5af53af3-cd07-4970-a373-52101e10bff9', 'done', 20.9, 'temp address', 6, '2021121509191122753', '5', 1.9, 11, '2021-11-02 21:15:57', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('5cc34bc5-bf93-4bdf-a0f3-19f581465a44', '054ed665-85f5-48b2-8517-c700b32a0bb4', 'done', 12500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 5, '2021-11-29 11:48:58', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('6132a248-8893-47a2-86bb-0bde8f0cd215', '5246c7c5-8b06-47da-8f4c-84bb88d06cb8', 'doing', 19198, '叉二122', 24, '2021121509191122753', '2', 1919.8, 10, '2021-12-15 07:29:00', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('6317d8c8-b206-49db-9e35-9e2686f70de3', '695305aa-5480-4894-a448-563570c93be2', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:56:18', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('67a3f770-1c9f-41f4-968a-8373eb96f93d', '5d21ee2a-514f-4cc3-a2a2-e6b2708486b8', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:11:42', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('696a16e1-5fe0-4dbb-a461-25c804b36953', '5964f64d-0416-4a60-aa39-08eb0548aa5d', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:49:49', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('6b8f0d00-1aba-43ec-8c7f-6f821c4b7f8b', '3d490797-7d91-4e53-b370-282cb7040c89', 'done', 12500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 5, '2021-11-29 11:55:22', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('6e7bc9b2-65bb-4bf8-a85b-b07ab71fa2e7', '8ba566df-4896-423d-9e9c-e1123c82a5fa', 'done', 3, 'fudan university', 10, '2021121509191122753', '矿泉水', 3, 1, '2021-11-14 01:09:16', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('712c4938-e7e3-49e8-97b2-b5acf9d9f360', '14432444-6b6f-4a40-a800-8167f6bcdfc0', 'done', 1, 'fudan university', 0, '2021121509191122753', '苹果', 1, 1, '2021-12-07 18:51:14', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('71486a1e-1dc2-4580-9da8-dc89967d32e6', '8b74a6d0-d3a9-4665-bd37-d8d20d86d6bf', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-03 15:56:48', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('79a1e4a0-eb87-4d32-971a-7a3b85fab749', 'c60a7090-16fa-4040-be9b-237b971d78da', 'done', 12500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 5, '2021-11-29 12:08:02', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('7c7e3346-87a4-4e39-add6-b089a864cd30', 'fdbc2082-39da-456d-98f1-6d5fb3592440', 'WAIT_TO_TRANSFER', 19198, '交叉2', 24, '2021121509191122753', '2', 1919.8, 10, '2021-11-28 21:22:58', '2021-12-17 10:12:47', '在菜鸟驿站');
INSERT INTO `sub_order` VALUES ('7deb169d-d225-40ad-bd0e-cbc825825c61', 'eb5e5a3e-0cf8-4842-9dda-648e1df11517', 'done', 1, 'fudan university', 0, '2021121509191122753', '苹果', 1, 1, '2021-12-07 18:54:44', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('7ee7a62a-7da5-4207-860a-e2b94bb70818', '6879ba9c-87a7-4da4-b33b-8ecdaf38e3ea', 'WAIT_TO_TRANSFER', 199999, '二叉楼 david', 0, '2021121509275823395', '雷姆', 199999, 1, '2021-12-17 17:22:53', '2021-12-17 17:23:21', NULL);
INSERT INTO `sub_order` VALUES ('7f9d4634-5782-4b1f-9d55-0a4677565d72', 'c2ff2157-0ace-4c8f-b032-228bb24ca6d8', 'doing', 37.35, 'test 42address', 3, '2021121509191122753', 'my soul', 12.45, 3, '2021-11-12 21:39:01', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('7ff94f39-ef14-47e2-9179-0d5800ec98b1', '652105d2-2229-4bde-ae2d-7532d073217b', 'done', 3, 'fudan university', 10, '2021121509191122753', '矿泉水', 3, 1, '2021-11-14 12:32:01', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('81de8925-0632-4791-b4a7-00ba1caea0a7', 'd448132f-6f1a-4b15-9610-4ee299b9de38', 'done', 5.2, 'temp address', 2, '2021121509191122753', '123', 1.3, 4, '2021-11-11 18:36:02', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('82b54683-7df0-4594-8acd-a5d39bacc788', '12f83b90-d279-4501-ba65-b36ad9e08072', 'done', 3, 'fudan university', 10, '2021121509191122753', '矿泉水', 3, 1, '2021-11-14 12:31:57', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('82fb3aa9-a71a-4dd7-8990-68eb954bc340', 'ab75e15f-c57a-419e-b61a-b12a50949eaf', 'doing', 19198, 'test address', 5, '2021121509191122753', 'your beats', 1919.8, 10, '2021-11-09 15:14:14', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('838e95a3-a3e7-4a52-9b22-8124175ea3a8', '4b7b64df-2bd6-43fe-a3e6-e60be01ca6eb', 'doing', 19198, '叉二122', 24, '2021121509191122753', '2', 1919.8, 10, '2021-11-28 21:26:13', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('83df96fb-9452-4e10-a813-711cc6e79773', '728da79d-8da4-4e85-99a3-2d1442cf98bf', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:53:47', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('84d541a0-9440-4268-ab57-94a73d680aac', '2baf4c9c-bb55-43cd-8b20-32550cf9b4eb', 'done', 3, 'fudan university', 10, '2021121509191122753', '矿泉水', 3, 1, '2021-11-14 12:28:42', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('896cd80b-bcf3-45b0-9666-984b5746b75c', '5246c7c5-8b06-47da-8f4c-84bb88d06cb8', 'doing', 37.35, '叉二122', 24, '2021121509191122753', '1', 12.45, 3, '2021-12-15 07:29:00', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('8994a044-4ecd-4aac-b608-c792dda467a4', 'ec133e54-7b2d-4b46-87e9-5e0c0b5fc6c8', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:48:37', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('8ad0bebd-ca3f-446b-b5a5-5b54cd467f8f', '54476541-fd81-4165-a9d8-6e3860d3b91e', 'done', 3, 'fudan university', 10, '2021121509191122753', '矿泉水', 3, 1, '2021-11-11 19:12:05', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('8af178e6-254d-4ec5-8628-edc736285d47', '15fb23eb-45d4-4fc6-9dad-86e117bb8002', 'doing', 37.35, 'test 42address', 3, '2021121509191122753', 'my soul', 12.45, 3, '2021-11-14 01:04:14', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('8b713dac-e934-42a7-9283-a01f5968a9a7', '1eac6a9c-6915-40ff-822c-7357889671c1', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-05 19:28:35', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('8f777434-7d80-4dbc-b05e-e01767cbdd6e', 'a9d3622c-5c09-4e59-90e9-1230297b6719', 'done', 20000000, 'fudan university', 0, '2021121509191122753', '11282', 20000000, 1, '2021-11-29 11:31:10', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('9395a3e5-4a14-4990-bead-0b4355e06eee', 'aeccfdb5-54ef-46a1-9409-c5fd35ba1801', 'done', 4, 'fudan university', 16, '2021121509191122753', '矿泉水', 4, 1, '2021-11-17 14:44:27', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('97bce5ab-2b0c-409c-b526-96fa2909480f', '2b197823-8d26-479a-92bf-cb2f829c0d1d', 'doing', 19198, '叉二122', 24, '2021121509191122753', '2', 1919.8, 10, '2021-12-15 07:28:06', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('99', '99', 'done', 5.2, 'temp address', 16, '2021121509191122753', '123', 1.3, 4, '2021-11-10 17:29:51', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('9a0156e3-a847-442e-82a3-0f63e141c262', 'ae01e227-0a6d-4378-ac34-efccaf2b209b', 'done', 12500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 5, '2021-11-29 11:47:44', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('9b6ab317-9057-49ed-bab3-1e94435b2e67', '8fb99eae-d7e3-4529-b7b0-0f728dd8db3c', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:53:53', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('9da3c577-5296-41ba-9c42-584d5eea3c89', 'a5d445d7-3f05-421d-8f96-11c4a208a57b', 'doing', 37.35, '叉二', 3, '2021121509191122753', 'my soul', 12.45, 3, '2021-11-28 18:59:45', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('a036499c-a62a-4ba6-82ea-e396786a981c', '7a9215a6-e8c2-4c48-888a-82e77a507d6c', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-11-29 11:28:07', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('a296ab62-633e-4d8c-a01c-5575caf07361', '9cb1e5ca-e84b-44db-87d6-e19eb6e0339c', 'done', 12500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 5, '2021-11-29 11:56:18', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('a2b78d0c-b152-46ee-b748-6c3ccf42cfb8', '956f826f-f486-4385-8341-ed5cc0cb8796', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-11-29 12:11:28', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('a400e326-568c-4871-b59e-64592ea43040', '7326f979-320a-47dd-9103-b844e9c60a02', 'done', 12500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 5, '2021-11-29 11:49:15', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('a7594224-c166-434e-8d88-2c25c9be6966', '5facfa46-2797-478c-8fa3-3a74ee7eba18', 'done', 12500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 5, '2021-11-29 11:51:52', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('a7dca159-bec1-4f77-a0d5-9658ec3abde7', '181fbbb5-85e5-4499-b822-5418dec8b429', 'doing', 37.35, '叉二', 3, '2021121509191122753', 'my soul', 12.45, 3, '2021-11-28 19:33:44', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('a8337634-a36c-4763-89e9-e72421a104c6', '4c02a727-0b2b-45ab-8e19-83213db8529a', 'done', 20.9, 'temp address', 6, '2021121509191122753', '5', 1.9, 11, '2021-11-10 17:35:37', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('a94a5091-7b29-43f3-bd3c-e936d1866482', '5964f64d-0416-4a60-aa39-08eb0548aa5d', 'done', 1, 'fudan university', 0, '2021121509191122753', '苹果', 1, 1, '2021-12-07 18:49:49', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('aaa4e134-4a8b-457d-98d1-1a382e5e788e', '49de9d48-4ee9-49e4-b0b6-c5caeeb0a4d2', 'doing', 19198, '叉二122', 24, '2021121509191122753', '2', 1919.8, 10, '2021-12-15 07:28:52', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('aac2b015-0355-42e1-8f02-4893de0017c6', 'a8035370-3be2-4b39-a146-643b6dde0bc0', 'WAIT_TO_PAY', 22300, '二叉楼', 0, '2021121509191122753', 'VR眼镜', 22300, 1, '2021-12-15 17:58:39', '2021-12-15 17:58:39', NULL);
INSERT INTO `sub_order` VALUES ('abe4f609-626b-469b-b633-68f781cc7a13', '2d56a000-81ff-4795-a2c0-033b0a27727c', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:12:52', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('ac956c0c-5562-4477-9efc-99ee3750b5af', '55b27b07-e60f-4bce-9b45-56f6952613f9', 'WAIT_TO_PAY', 5760, 'wwwww', 2, '2021121509191122753', '白酒', 2880, 2, '2021-12-15 07:53:01', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('aec1482b-8fb4-4d58-9253-d34f28199631', '729e7405-83a7-4757-9181-92f0a6f3d496', 'done', 12500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 5, '2021-11-29 11:50:14', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('af2e1934-1d64-4cb1-8ea7-34ae0635759f', 'f63e0fc7-cce5-4a91-8a39-07f960cfd5e4', 'doing', 37.35, '叉二', 3, '2021121509191122753', 'my soul', 12.45, 3, '2021-11-28 20:02:28', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('b8a0f37c-94c1-4e3e-ad32-ed04b73a028f', '4961a94c-bd21-4bdc-ad99-91ca09b3fa43', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 17:59:01', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('b910dc12-b232-4fe7-bc17-215c97a0e43e', 'b031fb89-c049-4dc5-9653-69c32fb550e9', 'doing', 37.35, '叉二', 3, '2021121509191122753', 'my soul', 12.45, 3, '2021-11-25 22:39:50', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('bd22bf8d-f0d2-4821-912c-21053c6262af', '14432444-6b6f-4a40-a800-8167f6bcdfc0', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:51:14', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('be0b17f2-30f2-4b90-b840-7e5dd4dd123d', 'ccf27ddd-a26c-4e04-9a5f-513192083642', 'done', 12500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 5, '2021-11-29 11:48:40', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('c053457e-e30d-4179-842d-611ec03f9149', 'df7a6444-25e5-4f11-bd8c-80cbf92afe66', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-05 17:03:51', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('c1f0a435-c54e-4cb8-80a1-5ab2dde2fd14', '5e0c0263-d6d3-4b14-8700-c561ba80abb4', 'done', 3, 'fudan university', 10, '2021121509191122753', '矿泉水', 3, 1, '2021-11-11 19:01:22', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('c8c60c13-28c4-4c4a-b600-8c7a2aebde8b', '4c02a727-0b2b-45ab-8e19-83213db8529a', 'done', 5.2, 'temp address', 2, '2021121509191122753', '123', 1.3, 4, '2021-11-10 17:35:37', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('d1674826-4a8f-4b07-b7b6-7aede4127b7f', 'ba23d8d4-d886-485d-955f-df1e7de2e968', 'WAIT_TO_TRANSFER', 100, '二叉楼 最新的', 0, '2021121509191122753', '杯子', 10, 10, '2021-12-14 12:10:31', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('d3b94a56-152b-4538-bfe7-032ebfd41afe', '1f889b86-f089-40b7-aa73-b5c9ba2e39f3', 'WAIT_TO_TRANSFER', 40, 'david的家中', 0, '2021121509191122753', '杯子', 10, 4, '2021-12-12 16:35:40', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('d5486929-599a-4a2f-b5e4-d5add9ef45cd', 'ad15f1e9-70e9-4c7b-bdd9-27d06720f944', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:50:18', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('d5757249-f042-435a-b75e-954428840928', 'ae9574f3-c136-4b75-b494-db1b8fdba76a', 'done', 1, 'fudan university', 0, '2021121509191122753', '苹果', 1, 1, '2021-12-07 18:56:53', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('d5b54dc8-c9d7-443e-9e48-ed4f74829b95', '32c908c8-1b68-4daf-a9fc-113463dc9f50', 'done', 2500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 1, '2021-12-07 18:15:06', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('d6fdc083-b10a-4f3e-91f0-206d1aac48f5', '5e603647-f5fe-45c2-8df6-401c0a750a58', 'done', 12500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 5, '2021-11-29 11:41:22', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('d92355b1-c75e-4845-bd60-f4929e906483', '39ebd845-15b2-492d-8d69-ba0a8efb65e3', 'WAIT_TO_PAY', 0, '二叉楼', 0, '2021121509191122753', '白酒', 2880, 0, '2021-12-14 17:28:41', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('dc458917-baad-4c2a-aa03-d2161fa01e9f', '88de7256-e689-4c10-9e84-001dbaec7a9a', 'done', 12500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 5, '2021-11-29 11:52:53', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('dc4a6a80-ff0d-48a5-a6fd-6fc14edcb0ea', '361f47e6-2fd3-4b85-858e-aae952ee7052', 'doing', 37.35, '叉二122', 24, '2021121509191122753', '1', 12.45, 3, '2021-11-28 21:13:58', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('de486aa4-6174-4a69-b591-d867ef814ec1', '2b197823-8d26-479a-92bf-cb2f829c0d1d', 'doing', 37.35, '叉二122', 24, '2021121509191122753', '1', 12.45, 3, '2021-12-15 07:28:06', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('e062627f-f085-4fef-b634-c8ffa26a45ad', 'ab75e15f-c57a-419e-b61a-b12a50949eaf', 'doing', 37.35, 'test address', 3, '2021121509191122753', 'my soul', 12.45, 3, '2021-11-09 15:14:14', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('e3dc1965-4634-4b71-8ba6-fa104b551c8a', '4156cde5-49aa-48cc-8914-557620bc2794', 'done', 100000000, 'fudan university', 0, '2021121509191122753', '11282', 20000000, 5, '2021-11-29 11:33:29', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('e47acf77-229c-488f-8ec3-c1e377135e85', 'b44ab66f-2caf-4f4a-8c1b-71b8ac53456a', 'done', 12500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 5, '2021-11-29 11:54:27', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('e9e1cc14-592d-4605-8329-59956f5ac079', '728da79d-8da4-4e85-99a3-2d1442cf98bf', 'done', 1, 'fudan university', 0, '2021121509191122753', '苹果', 1, 1, '2021-12-07 18:53:47', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('f2396b90-25c6-4acf-8085-7e0838a34f4b', '99106c20-4db6-4424-8fcd-276e9a531b1d', 'doing', 37.35, '叉二122', 24, '2021121509191122753', '1', 12.45, 3, '2021-12-15 07:28:40', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('f24bff87-9fcd-4a3e-908c-bbca9b4c9b09', 'e5c2cceb-1e71-4fba-bf64-1d0b9543c9a3', 'doing', 19198, '叉二', 5, '2021121509191122753', 'your beats', 1919.8, 10, '2021-11-25 22:39:59', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('f83e9c96-16e1-4278-aa8d-7bd350636c1c', '5393c6b0-4dcc-4c4a-900f-024f0a063005', 'done', 12500, 'fudan university', 0, '2021121509191122753', '矿泉水', 2500, 5, '2021-11-29 11:52:12', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('fbc52529-5699-48d8-a8f9-73bf632afe70', '8d04339a-3629-489f-b348-ea2c2cf61bc5', 'doing', 19198, '叉二', 5, '2021121509191122753', 'your beats', 1919.8, 10, '2021-11-28 19:37:01', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('fc9a8324-f5fe-47fa-affb-a5bb8cc1fc78', '1faa0dfb-90a9-42bd-9607-fba3862ec643', 'WAIT_TO_PAY', 2880, '两个商品', 1, '2021121509191122753', '白酒', 2880, 1, '2021-12-15 07:54:27', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('ff684f0b-fba3-4349-b9d1-88be2960c3be', '1faa0dfb-90a9-42bd-9607-fba3862ec643', 'WAIT_TO_PAY', 5760, '两个商品', 2, '2021121509191122753', '白酒', 2880, 2, '2021-12-15 07:54:27', '2021-12-17 09:35:34', NULL);
INSERT INTO `sub_order` VALUES ('ff70cb8f-5bd8-4bbc-83e0-fbb2b50e9d5e', '39a731d6-4e70-456e-a26d-9073d492b05d', 'WAIT_TO_PAY', 11520, '二叉楼 D2020', 0, '2021121509191122753', '白酒', 2880, 4, '2021-12-13 09:43:44', '2021-12-17 09:35:34', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message` (
                               `id` int(11) NOT NULL AUTO_INCREMENT,
                               `type` varchar(64) NOT NULL,
                               `sub_order_id` varchar(64) NOT NULL,
                               `saler_id` int(36) DEFAULT NULL,
                               `buyer_id` int(36) DEFAULT NULL,
                               `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                               `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                               `commodity_id` char(20) DEFAULT NULL,
                               `commodity_name` varchar(64) DEFAULT NULL,
                               `price` float(10,2) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `status` int(6) DEFAULT NULL,
  `logistics` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subOrderId` (`sub_order_id`,`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_message
-- ----------------------------
BEGIN;
INSERT INTO `sys_message` VALUES (1, 'WAIT_TO_TRANSFER', '17b9ac4e-2e30-4bf4-95e9-c0c3e1bf0997', 14, 11281, '2021-12-13 14:27:35', '2021-12-07 18:43:59', '2021112819491078893', '1', 12.45, 1, '交叉1', 0, NULL);
INSERT INTO `sys_message` VALUES (2, 'WAIT_TO_TRANSFER', '7c7e3346-87a4-4e39-add6-b089a864cd30', 14, 11281, '2021-12-13 11:22:46', '2021-12-07 18:44:11', '2021112819543201354', '2', 1919.80, 10, '交叉2', 1, NULL);
INSERT INTO `sys_message` VALUES (3, 'WAIT_TO_RECEIPT', '17b9ac4e-2e30-4bf4-95e9-c0c3e1bf0997', 14, 11281, '2021-12-13 11:22:46', '2021-12-15 05:09:24', '2021112819491078893', '1', 12.45, 1, '交叉1', 0, NULL);
INSERT INTO `sys_message` VALUES (4, 'WAIT_TO_RECEIPT', '7c7e3346-87a4-4e39-add6-b089a864cd30', 14, 11281, '2021-12-13 11:22:46', '2021-12-15 06:22:04', '2021112819543201354', '2', 1919.80, 10, '交叉2', 0, NULL);
INSERT INTO `sys_message` VALUES (5, 'COMPLETE', '17b9ac4e-2e30-4bf4-95e9-c0c3e1bf0997', 14, 11281, '2021-12-13 11:22:46', '2021-12-07 20:18:09', '2021112819491078893', '1', 12.45, 1, '交叉1', 1, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of us_admin
-- ----------------------------
BEGIN;
INSERT INTO `us_admin` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2021-11-12 15:58:43', '2021-11-16 11:11:10');
INSERT INTO `us_admin` VALUES (2, 'xpc', '1234', '2021-12-17 14:12:42', '2021-12-17 14:12:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of us_buyer
-- ----------------------------
BEGIN;
INSERT INTO `us_buyer` VALUES (1, 'joshua', '111', '11', '1', '2021-11-12 16:49:47', '2021-11-12 16:49:50');
INSERT INTO `us_buyer` VALUES (2, 'lingzixuan', 'e10adc3949ba59abbe56e057f20f883e', NULL, '10086', '2021-11-12 20:12:14', '2021-11-16 11:11:38');
INSERT INTO `us_buyer` VALUES (23, 'xqb', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '1234567', '2021-11-17 14:41:55', NULL);
INSERT INTO `us_buyer` VALUES (24, 'xqb1', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '1234567', '2021-11-21 09:43:29', NULL);
INSERT INTO `us_buyer` VALUES (25, 'xqbb', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '1234567', '2021-11-25 21:02:14', NULL);
INSERT INTO `us_buyer` VALUES (26, 'zpw', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '1234567', '2021-11-25 21:02:41', NULL);
INSERT INTO `us_buyer` VALUES (27, 'zpww', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '1234567', '2021-11-25 21:03:51', NULL);
INSERT INTO `us_buyer` VALUES (28, 'zpwww', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '1234567', '2021-11-25 21:04:29', NULL);
INSERT INTO `us_buyer` VALUES (29, 'zpwwww', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '1234567', '2021-11-25 21:04:39', NULL);
INSERT INTO `us_buyer` VALUES (30, 'xxx', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '1234567', '2021-11-25 21:05:34', NULL);
INSERT INTO `us_buyer` VALUES (48, 'hello', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '1234567', '2021-11-25 22:05:30', NULL);
INSERT INTO `us_buyer` VALUES (49, '1128', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '1234567', '2021-11-28 18:57:40', NULL);
INSERT INTO `us_buyer` VALUES (50, '11281', '81dc9bdb52d04dc20036dbd8313ed055', NULL, '1234567', '2021-11-28 18:58:30', NULL);
INSERT INTO `us_buyer` VALUES (52, 'zzpw', 'c4ca4238a0b923820dcc509a6f75849b', NULL, '10086', '2021-12-07 16:42:17', NULL);
INSERT INTO `us_buyer` VALUES (55, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', NULL, '1234567', '2021-12-11 10:53:32', NULL);
INSERT INTO `us_buyer` VALUES (56, 'user1', '24c9e15e52afc47c225b757e7bee1f9d', NULL, '1234567', '2021-12-12 10:51:58', NULL);
INSERT INTO `us_buyer` VALUES (57, 'user3', '92877af70a45fd6a2ed7fe81e1236b78', NULL, '1234567', '2021-12-12 10:55:54', NULL);
INSERT INTO `us_buyer` VALUES (58, 'hhh', '202cb962ac59075b964b07152d234b70', '', '12', '2021-12-13 16:16:38', NULL);
INSERT INTO `us_buyer` VALUES (59, 'lzx', '5c8df559fbbe5156c06996be9c34397f', '', '13532002927', '2021-12-14 17:28:23', NULL);
INSERT INTO `us_buyer` VALUES (60, '11111', 'c4ca4238a0b923820dcc509a6f75849b', '', '1', '2021-12-14 18:02:19', NULL);
INSERT INTO `us_buyer` VALUES (61, 'gzh', '202cb962ac59075b964b07152d234b70', '123', '123', '2021-12-15 11:23:38', NULL);
INSERT INTO `us_buyer` VALUES (62, 'david', '172522ec1028ab781d9dfd17eaca4427', '654321@xxx.com', '654321', '2021-12-17 17:20:07', NULL);
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
INSERT INTO `us_commodity` VALUES ('2021111323171493548', '白酒', 'https://tse1-mm.cn.bing.net/th/id/OIP-C.Ysp5JXpNQ13Jpx75yhIfYAHaHa?w=214&h=214&c=7&r=0&o=5&dpr=2&pid=1.7', 2880, '酒', 10, '茅台', '酒');
INSERT INTO `us_commodity` VALUES ('2021111414232602041', '水', 'https://tse2-mm.cn.bing.net/th/id/OIP-C.I6r-Fi3Fuv2KRhkRoM2ZMwHaFW?w=268&h=193&c=7&r=0&o=5&dpr=2&pid=1.7', 4, '喝的', 4, 'xpc', NULL);
INSERT INTO `us_commodity` VALUES ('2021121206542729411', '狗狗', 'http://ultra-seller.oss-cn-shanghai.aliyuncs.com/images/1639292056264_7cbc7d73', 100000, '小狗狗', 10, 'xpc', NULL);
INSERT INTO `us_commodity` VALUES ('2021121407381992581', '水杯', 'http://ultra-seller.oss-cn-shanghai.aliyuncs.com/images/1639467492870_f729be06', 10, '水杯', 10, 'xpc', NULL);
INSERT INTO `us_commodity` VALUES ('2021121509154762871', '一拳超人', 'http://ultra-seller.oss-cn-shanghai.aliyuncs.com/images/1639559718668_c160fc55', 188, '一拳超人海报', 100000000, 'xpc', NULL);
INSERT INTO `us_commodity` VALUES ('2021121509172565699', '斯诺克', 'http://ultra-seller.oss-cn-shanghai.aliyuncs.com/images/1639559797323_aa1a92d5', 999, '斯诺克全套用品', 33, 'xpc', NULL);
INSERT INTO `us_commodity` VALUES ('2021121509191122753', 'VR眼镜', 'http://ultra-seller.oss-cn-shanghai.aliyuncs.com/images/1639559913434_bcd254d8', 22300, '顶配VR眼镜', 11, 'xpc', NULL);
INSERT INTO `us_commodity` VALUES ('2021121509214626412', '刺客信条：黑棋', 'http://ultra-seller.oss-cn-shanghai.aliyuncs.com/images/1639560015236_44f18232', 212, '刺客信条限量版DLC', 20, 'xpc', NULL);
INSERT INTO `us_commodity` VALUES ('2021121509275823395', '雷姆', 'http://ultra-seller.oss-cn-shanghai.aliyuncs.com/images/1639560454254_a83d739b', 199999, '你老婆', 1, 'xpc', NULL);
INSERT INTO `us_commodity` VALUES ('2021121509311008040', '？？？？', 'http://ultra-seller.oss-cn-shanghai.aliyuncs.com/images/1639560649894_6fbab276', 0, '？？？？', 0, 'xpc', NULL);
INSERT INTO `us_commodity` VALUES ('2021121709343544772', '学习英语', 'http://ultra-seller.oss-cn-shanghai.aliyuncs.com/images/1639733649832_1eea957a', 100, '英语教程', 20000, '无良商家', NULL);
INSERT INTO `us_commodity` VALUES ('2021121709344450682', '学习英语', 'http://ultra-seller.oss-cn-shanghai.aliyuncs.com/images/1639733649832_1eea957a', 100, '英语教程', 20000, '无良商家', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `us_saler` VALUES (23, 'gzh2', '202cb962ac59075b964b07152d234b70', '10086', NULL, '2021-11-17 16:07:39', '2021-11-17 16:07:39');
INSERT INTO `us_saler` VALUES (24, '11282', '81dc9bdb52d04dc20036dbd8313ed055', '1234567', NULL, '2021-11-28 19:44:44', '2021-11-28 19:44:44');
INSERT INTO `us_saler` VALUES (25, '11291', '81dc9bdb52d04dc20036dbd8313ed055', '1234567', NULL, '2021-11-29 09:42:11', '2021-11-29 09:42:11');
INSERT INTO `us_saler` VALUES (26, '11292', '81dc9bdb52d04dc20036dbd8313ed055', '1234567', NULL, '2021-11-29 09:54:40', '2021-11-29 09:54:40');
INSERT INTO `us_saler` VALUES (27, '11293', '81dc9bdb52d04dc20036dbd8313ed055', '1234567', NULL, '2021-11-29 09:55:51', '2021-11-29 09:55:51');
INSERT INTO `us_saler` VALUES (29, 'david00', '172522ec1028ab781d9dfd17eaca4427', '123456', NULL, '2021-11-29 11:06:26', '2021-11-29 11:06:26');
INSERT INTO `us_saler` VALUES (30, '无良商家', '05a5cf06982ba7892ed2a6d38fe832d6', '999999', '2021@xxx.com', '2021-12-17 10:02:36', '2021-12-17 10:02:36');
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
INSERT INTO `us_wallet` VALUES ('hello', 202111252205303938, 10862.6, 'buyer');
INSERT INTO `us_wallet` VALUES ('david', 202112170920071569, 800001, 'buyer');
INSERT INTO `us_wallet` VALUES ('heyue', 2021111015035332514, 0, 'seller');
INSERT INTO `us_wallet` VALUES ('heyue4', 2021111015173263553, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('heyue1', 2021111015180314494, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('admin', 2021111015413634737, 1898.4, 'admin');
INSERT INTO `us_wallet` VALUES ('deangelo', 2021111019492065428, 0, 'buyer');
INSERT INTO `us_wallet` VALUES ('lingzixuan', 2021111220121316525, 0, 'buyer');
INSERT INTO `us_wallet` VALUES ('deangelo.rempel23', 2021111221415947194, 0, '53oe2o');
INSERT INTO `us_wallet` VALUES ('deangelo.rempel333', 2021111221445546170, 0, '53oe2o');
INSERT INTO `us_wallet` VALUES ('ling22zixuan', 2021111221502076911, 0, 'seller');
INSERT INTO `us_wallet` VALUES ('xpc', 2021111316083210668, 5000, 'saler');
INSERT INTO `us_wallet` VALUES ('xqb', 2021111319353333782, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('aaa', 2021111320413166051, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('bbb', 2021111320510113883, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('test', 2021111410192493487, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('t', 2021111410225913189, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('gzh2', 2021111708074109567, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('xqb1', 2021112109432783654, 0, 'buyer');
INSERT INTO `us_wallet` VALUES ('zpwww', 2021112521042902533, 0, 'buyer');
INSERT INTO `us_wallet` VALUES ('zpwwww', 2021112521043934655, 0, 'buyer');
INSERT INTO `us_wallet` VALUES ('xxx', 2021112521053449258, 0, 'buyer');
INSERT INTO `us_wallet` VALUES ('1128', 2021112818574082960, 0, 'buyer');
INSERT INTO `us_wallet` VALUES ('11281', 2021112818583046172, 2900, 'buyer');
INSERT INTO `us_wallet` VALUES ('11282', 2021112819444408187, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('11292', 2021112901544190188, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('11293', 2021112901555166927, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('david00', 2021112903062671560, 0, 'saler');
INSERT INTO `us_wallet` VALUES ('user', 2021121110533238746, 0, 'buyer');
INSERT INTO `us_wallet` VALUES ('user1', 2021121202520066928, 0, 'buyer');
INSERT INTO `us_wallet` VALUES ('zpw', 2021121202552032880, 0, 'buyer');
INSERT INTO `us_wallet` VALUES ('user3', 2021121202555453032, 0, 'buyer');
INSERT INTO `us_wallet` VALUES ('hhh', 2021121308163954552, 0, 'buyer');
INSERT INTO `us_wallet` VALUES ('lzx', 2021121409282401621, 30, 'buyer');
INSERT INTO `us_wallet` VALUES ('11111', 2021121410021959748, 20202120, 'buyer');
INSERT INTO `us_wallet` VALUES ('gzh', 2021121503233807299, 0, 'buyer');
INSERT INTO `us_wallet` VALUES ('无良商家', 2021121702023705942, 0, 'saler');
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
INSERT INTO `us_wallet_record` VALUES (-1, 'hello', '2021-11-25 22:06:54', 862.6, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'hello', '2021-11-25 22:08:04', 10000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, '11281', '2021-11-28 21:21:17', 1000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, '11281', '2021-11-28 21:36:52', 200, -1);
INSERT INTO `us_wallet_record` VALUES (-1, '11281', '2021-11-28 21:36:52', 200, -1);
INSERT INTO `us_wallet_record` VALUES (-1, '11281', '2021-11-28 21:39:32', -200, -1);
INSERT INTO `us_wallet_record` VALUES (-1, '11281', '2021-11-28 21:39:32', -300, -1);
INSERT INTO `us_wallet_record` VALUES (-1, '11281', '2021-12-13 06:33:49', -1000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 06:34:02', -1000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 07:08:41', -1000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 07:15:05', -200, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 10:07:01', -1000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 13:56:03', -200000, NULL);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 14:02:03', -200000, NULL);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 14:06:23', 60000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 14:07:21', -600000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 16:03:54', -10, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 16:04:28', -943190, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 16:05:23', 100000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 16:07:18', -100000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 16:07:41', 10000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, '11281', '2021-12-13 16:10:22', 1000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 16:30:02', 1000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 16:35:53', -2000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'xpc', '2021-12-13 16:36:28', 2000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'xpc', '2021-12-13 16:36:45', 2000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 16:37:29', 2000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 16:47:39', -40, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-13 16:48:06', -40, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-14 10:56:44', -40, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-14 12:06:04', -40, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-14 12:08:00', -20, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-14 12:11:55', -100, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'lzx', '2021-12-14 17:29:12', 30, -1);
INSERT INTO `us_wallet_record` VALUES (-1, '11111', '2021-12-14 18:09:24', 20000000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, '11111', '2021-12-14 18:09:33', 200000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, '11111', '2021-12-14 18:09:46', 0, -1);
INSERT INTO `us_wallet_record` VALUES (-1, '11111', '2021-12-14 18:09:50', 60, -1);
INSERT INTO `us_wallet_record` VALUES (-1, '11111', '2021-12-15 16:49:53', 2000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, '11111', '2021-12-15 16:50:14', 1, -1);
INSERT INTO `us_wallet_record` VALUES (-1, '11111', '2021-12-15 16:51:20', 50, -1);
INSERT INTO `us_wallet_record` VALUES (-1, '11111', '2021-12-15 16:54:07', 9, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-17 17:20:45', 1000000, -1);
INSERT INTO `us_wallet_record` VALUES (-1, 'david', '2021-12-17 17:23:21', -199999, -1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
