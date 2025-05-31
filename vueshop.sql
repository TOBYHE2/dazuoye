/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : vueshop

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 29/05/2025 11:21:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for vueshop_admin
-- ----------------------------
DROP TABLE IF EXISTS `vueshop_admin`;
CREATE TABLE `vueshop_admin`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vueshop_admin
-- ----------------------------
INSERT INTO `vueshop_admin` VALUES (1, 'admin', '61fcefcdc467b9688fa5f72b4e7e78c6', 'ItCast', '');
INSERT INTO `vueshop_admin` VALUES (2, 'demo', '61fcefcdc467b9688fa5f72b4e7e78c6', 'ItCast', '');

-- ----------------------------
-- Table structure for vueshop_category
-- ----------------------------
DROP TABLE IF EXISTS `vueshop_category`;
CREATE TABLE `vueshop_category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分类图片',
  `pid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vueshop_category
-- ----------------------------
INSERT INTO `vueshop_category` VALUES (35, '鞋子', '', 0);
INSERT INTO `vueshop_category` VALUES (36, '玩具', '', 0);
INSERT INTO `vueshop_category` VALUES (37, '车', '', 0);
INSERT INTO `vueshop_category` VALUES (38, '军火', '', 0);
INSERT INTO `vueshop_category` VALUES (39, '光碟', '', 0);
INSERT INTO `vueshop_category` VALUES (40, '眼镜', '', 0);
INSERT INTO `vueshop_category` VALUES (41, '水果', '', 0);
INSERT INTO `vueshop_category` VALUES (42, '蔬菜', '', 0);
INSERT INTO `vueshop_category` VALUES (43, '', '', 0);

-- ----------------------------
-- Table structure for vueshop_goods
-- ----------------------------
DROP TABLE IF EXISTS `vueshop_goods`;
CREATE TABLE `vueshop_goods`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `category_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类id ',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商品图片',
  `stock` int NOT NULL DEFAULT 0 COMMENT '商品库存',
  `spec` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商品规格',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品简介',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vueshop_goods
-- ----------------------------
INSERT INTO `vueshop_goods` VALUES (11, 36, '方块玩具', 1000.00, 'static/uploads/goods_picture/2025/05/67d34b3f-7347-40c8-b487-0e802c9cc698.png', 1, '1', '<p>非常牛逼</p>');
INSERT INTO `vueshop_goods` VALUES (12, 36, '方块2', 112.00, 'static/uploads/goods_picture/2025/05/9021fa28-6ede-4e39-8db3-63194c08e52f.png', 1, '1', '');
INSERT INTO `vueshop_goods` VALUES (14, 35, '鞋子', 111.00, 'static/uploads/goods_picture/2025/05/ae2a69cd-1fe2-4c2e-b090-82a3194cfa57.png', 1, '1', '<p>1</p>');

-- ----------------------------
-- Table structure for vueshop_goods_album
-- ----------------------------
DROP TABLE IF EXISTS `vueshop_goods_album`;
CREATE TABLE `vueshop_goods_album`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `goods_id` int UNSIGNED NOT NULL COMMENT '商品id',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商品图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vueshop_goods_album
-- ----------------------------
INSERT INTO `vueshop_goods_album` VALUES (1, 10, 'static/image/goods/album/apple1.jpg');
INSERT INTO `vueshop_goods_album` VALUES (2, 10, 'static/image/goods/album/apple2.jpg');
INSERT INTO `vueshop_goods_album` VALUES (3, 7, 'static/image/goods/spinach.png');
INSERT INTO `vueshop_goods_album` VALUES (4, 7, 'static/image/goods/spinach.png');

-- ----------------------------
-- Table structure for vueshop_user
-- ----------------------------
DROP TABLE IF EXISTS `vueshop_user`;
CREATE TABLE `vueshop_user`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vueshop_user
-- ----------------------------
INSERT INTO `vueshop_user` VALUES (1, 'demo1', '61fcefcdc467b9688fa5f72b4e7e78c6', 'ItCast', '');
INSERT INTO `vueshop_user` VALUES (2, 'demo2', '61fcefcdc467b9688fa5f72b4e7e78c6', 'ItCast', '');

SET FOREIGN_KEY_CHECKS = 1;
