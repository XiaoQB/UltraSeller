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

create database `ultra_seller_order` default character set utf8 collate utf8_general_ci;
use ultra_seller_order;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;

