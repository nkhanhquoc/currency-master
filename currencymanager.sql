/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100136
 Source Host           : localhost:3306
 Source Schema         : currencymanager

 Target Server Type    : MySQL
 Target Server Version : 100136
 File Encoding         : 65001

 Date: 25/10/2018 20:26:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('admin', '1', 1468421772);
INSERT INTO `auth_assignment` VALUES ('User', '2', 1533657185);
INSERT INTO `auth_assignment` VALUES ('User', '3', 1533657195);

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name`) USING BTREE,
  INDEX `idx-auth_item-type`(`type`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', 2, NULL, NULL, NULL, 1468421689, 1468421689);
INSERT INTO `auth_item` VALUES ('/admin/*', 2, NULL, NULL, NULL, 1468341067, 1468341067);
INSERT INTO `auth_item` VALUES ('/admin/assignment/*', 2, NULL, NULL, NULL, 1468339654, 1468339654);
INSERT INTO `auth_item` VALUES ('/admin/assignment/assign', 2, NULL, NULL, NULL, 1468339526, 1468339526);
INSERT INTO `auth_item` VALUES ('/admin/assignment/index', 2, NULL, NULL, NULL, 1468339490, 1468339490);
INSERT INTO `auth_item` VALUES ('/admin/assignment/revoke', 2, NULL, NULL, NULL, 1468339653, 1468339653);
INSERT INTO `auth_item` VALUES ('/admin/assignment/view', 2, NULL, NULL, NULL, 1468339512, 1468339512);
INSERT INTO `auth_item` VALUES ('/admin/default/*', 2, NULL, NULL, NULL, 1468339732, 1468339732);
INSERT INTO `auth_item` VALUES ('/admin/default/index', 2, NULL, NULL, NULL, 1468339725, 1468339725);
INSERT INTO `auth_item` VALUES ('/admin/menu/*', 2, NULL, NULL, NULL, 1468340134, 1468340134);
INSERT INTO `auth_item` VALUES ('/admin/menu/create', 2, NULL, NULL, NULL, 1468340044, 1468340044);
INSERT INTO `auth_item` VALUES ('/admin/menu/delete', 2, NULL, NULL, NULL, 1468340057, 1468340057);
INSERT INTO `auth_item` VALUES ('/admin/menu/index', 2, NULL, NULL, NULL, 1468339963, 1468339963);
INSERT INTO `auth_item` VALUES ('/admin/menu/update', 2, NULL, NULL, NULL, 1468340049, 1468340049);
INSERT INTO `auth_item` VALUES ('/admin/menu/view', 2, NULL, NULL, NULL, 1468339967, 1468339967);
INSERT INTO `auth_item` VALUES ('/admin/permission/*', 2, NULL, NULL, NULL, 1468341039, 1468341039);
INSERT INTO `auth_item` VALUES ('/admin/permission/assign', 2, NULL, NULL, NULL, 1468341032, 1468341032);
INSERT INTO `auth_item` VALUES ('/admin/permission/create', 2, NULL, NULL, NULL, 1468341001, 1468341001);
INSERT INTO `auth_item` VALUES ('/admin/permission/delete', 2, NULL, NULL, NULL, 1468341006, 1468341006);
INSERT INTO `auth_item` VALUES ('/admin/permission/index', 2, NULL, NULL, NULL, 1468340144, 1468340144);
INSERT INTO `auth_item` VALUES ('/admin/permission/remove', 2, NULL, NULL, NULL, 1468341033, 1468341033);
INSERT INTO `auth_item` VALUES ('/admin/permission/update', 2, NULL, NULL, NULL, 1468341003, 1468341003);
INSERT INTO `auth_item` VALUES ('/admin/permission/view', 2, NULL, NULL, NULL, 1468341000, 1468341000);
INSERT INTO `auth_item` VALUES ('/admin/role/*', 2, NULL, NULL, NULL, 1468341046, 1468341046);
INSERT INTO `auth_item` VALUES ('/admin/role/assign', 2, NULL, NULL, NULL, 1468341045, 1468341045);
INSERT INTO `auth_item` VALUES ('/admin/role/create', 2, NULL, NULL, NULL, 1468341044, 1468341044);
INSERT INTO `auth_item` VALUES ('/admin/role/delete', 2, NULL, NULL, NULL, 1468341045, 1468341045);
INSERT INTO `auth_item` VALUES ('/admin/role/index', 2, NULL, NULL, NULL, 1468341039, 1468341039);
INSERT INTO `auth_item` VALUES ('/admin/role/remove', 2, NULL, NULL, NULL, 1468341046, 1468341046);
INSERT INTO `auth_item` VALUES ('/admin/role/update', 2, NULL, NULL, NULL, 1468341045, 1468341045);
INSERT INTO `auth_item` VALUES ('/admin/role/view', 2, NULL, NULL, NULL, 1468341044, 1468341044);
INSERT INTO `auth_item` VALUES ('/admin/route/*', 2, NULL, NULL, NULL, 1468341048, 1468341048);
INSERT INTO `auth_item` VALUES ('/admin/route/assign', 2, NULL, NULL, NULL, 1468341047, 1468341047);
INSERT INTO `auth_item` VALUES ('/admin/route/create', 2, NULL, NULL, NULL, 1468341047, 1468341047);
INSERT INTO `auth_item` VALUES ('/admin/route/index', 2, NULL, NULL, NULL, 1468341046, 1468341046);
INSERT INTO `auth_item` VALUES ('/admin/route/refresh', 2, NULL, NULL, NULL, 1468341048, 1468341048);
INSERT INTO `auth_item` VALUES ('/admin/route/remove', 2, NULL, NULL, NULL, 1468341047, 1468341047);
INSERT INTO `auth_item` VALUES ('/admin/rule/*', 2, NULL, NULL, NULL, 1468341050, 1468341050);
INSERT INTO `auth_item` VALUES ('/admin/rule/create', 2, NULL, NULL, NULL, 1468341049, 1468341049);
INSERT INTO `auth_item` VALUES ('/admin/rule/delete', 2, NULL, NULL, NULL, 1468341049, 1468341049);
INSERT INTO `auth_item` VALUES ('/admin/rule/index', 2, NULL, NULL, NULL, 1468341048, 1468341048);
INSERT INTO `auth_item` VALUES ('/admin/rule/update', 2, NULL, NULL, NULL, 1468341049, 1468341049);
INSERT INTO `auth_item` VALUES ('/admin/rule/view', 2, NULL, NULL, NULL, 1468341049, 1468341049);
INSERT INTO `auth_item` VALUES ('/admin/user/*', 2, NULL, NULL, NULL, 1468341066, 1468341066);
INSERT INTO `auth_item` VALUES ('/admin/user/activate', 2, NULL, NULL, NULL, 1468341066, 1468341066);
INSERT INTO `auth_item` VALUES ('/admin/user/change-password', 2, NULL, NULL, NULL, 1468341066, 1468341066);
INSERT INTO `auth_item` VALUES ('/admin/user/delete', 2, NULL, NULL, NULL, 1468341053, 1468341053);
INSERT INTO `auth_item` VALUES ('/admin/user/index', 2, NULL, NULL, NULL, 1468341051, 1468341051);
INSERT INTO `auth_item` VALUES ('/admin/user/login', 2, NULL, NULL, NULL, 1468341054, 1468341054);
INSERT INTO `auth_item` VALUES ('/admin/user/logout', 2, NULL, NULL, NULL, 1468341055, 1468341055);
INSERT INTO `auth_item` VALUES ('/admin/user/request-password-reset', 2, NULL, NULL, NULL, 1468341065, 1468341065);
INSERT INTO `auth_item` VALUES ('/admin/user/reset-password', 2, NULL, NULL, NULL, 1468341065, 1468341065);
INSERT INTO `auth_item` VALUES ('/admin/user/signup', 2, NULL, NULL, NULL, 1468341064, 1468341064);
INSERT INTO `auth_item` VALUES ('/admin/user/view', 2, NULL, NULL, NULL, 1468341052, 1468341052);
INSERT INTO `auth_item` VALUES ('/app/*', 2, NULL, NULL, NULL, 1468341138, 1468341138);
INSERT INTO `auth_item` VALUES ('/app/galleryApi', 2, NULL, NULL, NULL, 1468341137, 1468341137);
INSERT INTO `auth_item` VALUES ('/bank-account/*', 2, NULL, NULL, NULL, 1539098202, 1539098202);
INSERT INTO `auth_item` VALUES ('/bank-account/create', 2, NULL, NULL, NULL, 1539098201, 1539098201);
INSERT INTO `auth_item` VALUES ('/bank-account/delete', 2, NULL, NULL, NULL, 1539098201, 1539098201);
INSERT INTO `auth_item` VALUES ('/bank-account/index', 2, NULL, NULL, NULL, 1539098201, 1539098201);
INSERT INTO `auth_item` VALUES ('/bank-account/update', 2, NULL, NULL, NULL, 1539098201, 1539098201);
INSERT INTO `auth_item` VALUES ('/bank-account/view', 2, NULL, NULL, NULL, 1539098201, 1539098201);
INSERT INTO `auth_item` VALUES ('/bank-storage/*', 2, NULL, NULL, NULL, 1539098202, 1539098202);
INSERT INTO `auth_item` VALUES ('/bank-storage/create', 2, NULL, NULL, NULL, 1539098202, 1539098202);
INSERT INTO `auth_item` VALUES ('/bank-storage/delete', 2, NULL, NULL, NULL, 1539098202, 1539098202);
INSERT INTO `auth_item` VALUES ('/bank-storage/index', 2, NULL, NULL, NULL, 1539098202, 1539098202);
INSERT INTO `auth_item` VALUES ('/bank-storage/update', 2, NULL, NULL, NULL, 1539098202, 1539098202);
INSERT INTO `auth_item` VALUES ('/bank-storage/view', 2, NULL, NULL, NULL, 1539098202, 1539098202);
INSERT INTO `auth_item` VALUES ('/bank-trans/*', 2, NULL, NULL, NULL, 1539103712, 1539103712);
INSERT INTO `auth_item` VALUES ('/bank-trans/create', 2, NULL, NULL, NULL, 1539103712, 1539103712);
INSERT INTO `auth_item` VALUES ('/bank-trans/delete', 2, NULL, NULL, NULL, 1539103712, 1539103712);
INSERT INTO `auth_item` VALUES ('/bank-trans/index', 2, NULL, NULL, NULL, 1539103712, 1539103712);
INSERT INTO `auth_item` VALUES ('/bank-trans/update', 2, NULL, NULL, NULL, 1539103712, 1539103712);
INSERT INTO `auth_item` VALUES ('/bank-trans/view', 2, NULL, NULL, NULL, 1539103712, 1539103712);
INSERT INTO `auth_item` VALUES ('/banner/*', 2, NULL, NULL, NULL, 1468341159, 1468341159);
INSERT INTO `auth_item` VALUES ('/banner/create', 2, NULL, NULL, NULL, 1468341158, 1468341158);
INSERT INTO `auth_item` VALUES ('/banner/delete', 2, NULL, NULL, NULL, 1468341159, 1468341159);
INSERT INTO `auth_item` VALUES ('/banner/index', 2, NULL, NULL, NULL, 1468341149, 1468341149);
INSERT INTO `auth_item` VALUES ('/banner/update', 2, NULL, NULL, NULL, 1468341159, 1468341159);
INSERT INTO `auth_item` VALUES ('/banner/view', 2, NULL, NULL, NULL, 1468341157, 1468341157);
INSERT INTO `auth_item` VALUES ('/borrow/*', 2, NULL, NULL, NULL, 1536468763, 1536468763);
INSERT INTO `auth_item` VALUES ('/borrow/create', 2, NULL, NULL, NULL, 1536468763, 1536468763);
INSERT INTO `auth_item` VALUES ('/borrow/delete', 2, NULL, NULL, NULL, 1536468763, 1536468763);
INSERT INTO `auth_item` VALUES ('/borrow/index', 2, NULL, NULL, NULL, 1536468763, 1536468763);
INSERT INTO `auth_item` VALUES ('/borrow/update', 2, NULL, NULL, NULL, 1536468763, 1536468763);
INSERT INTO `auth_item` VALUES ('/borrow/view', 2, NULL, NULL, NULL, 1536468763, 1536468763);
INSERT INTO `auth_item` VALUES ('/casting/*', 2, NULL, NULL, NULL, 1513093509, 1513093509);
INSERT INTO `auth_item` VALUES ('/casting/create', 2, NULL, NULL, NULL, 1513093508, 1513093508);
INSERT INTO `auth_item` VALUES ('/casting/index', 2, NULL, NULL, NULL, 1513093508, 1513093508);
INSERT INTO `auth_item` VALUES ('/casting/update', 2, NULL, NULL, NULL, 1513093508, 1513093508);
INSERT INTO `auth_item` VALUES ('/casting/view', 2, NULL, NULL, NULL, 1513093508, 1513093508);
INSERT INTO `auth_item` VALUES ('/contact/*', 2, NULL, NULL, NULL, 1513355227, 1513355227);
INSERT INTO `auth_item` VALUES ('/contact/index', 2, NULL, NULL, NULL, 1513355227, 1513355227);
INSERT INTO `auth_item` VALUES ('/contact/view', 2, NULL, NULL, NULL, 1513355227, 1513355227);
INSERT INTO `auth_item` VALUES ('/cost/*', 2, NULL, NULL, NULL, 1539363257, 1539363257);
INSERT INTO `auth_item` VALUES ('/cost/create', 2, NULL, NULL, NULL, 1539363257, 1539363257);
INSERT INTO `auth_item` VALUES ('/cost/delete', 2, NULL, NULL, NULL, 1539363257, 1539363257);
INSERT INTO `auth_item` VALUES ('/cost/index', 2, NULL, NULL, NULL, 1539363256, 1539363256);
INSERT INTO `auth_item` VALUES ('/cost/update', 2, NULL, NULL, NULL, 1539363257, 1539363257);
INSERT INTO `auth_item` VALUES ('/cost/view', 2, NULL, NULL, NULL, 1539363256, 1539363256);
INSERT INTO `auth_item` VALUES ('/country/*', 2, NULL, NULL, NULL, 1468341170, 1468341170);
INSERT INTO `auth_item` VALUES ('/country/create', 2, NULL, NULL, NULL, 1468341160, 1468341160);
INSERT INTO `auth_item` VALUES ('/country/delete', 2, NULL, NULL, NULL, 1468341168, 1468341168);
INSERT INTO `auth_item` VALUES ('/country/index', 2, NULL, NULL, NULL, 1468341160, 1468341160);
INSERT INTO `auth_item` VALUES ('/country/update', 2, NULL, NULL, NULL, 1468341168, 1468341168);
INSERT INTO `auth_item` VALUES ('/country/view', 2, NULL, NULL, NULL, 1468341160, 1468341160);
INSERT INTO `auth_item` VALUES ('/currency/*', 2, NULL, NULL, NULL, 1535882766, 1535882766);
INSERT INTO `auth_item` VALUES ('/currency/create', 2, NULL, NULL, NULL, 1535882766, 1535882766);
INSERT INTO `auth_item` VALUES ('/currency/delete', 2, NULL, NULL, NULL, 1535882766, 1535882766);
INSERT INTO `auth_item` VALUES ('/currency/index', 2, NULL, NULL, NULL, 1535882766, 1535882766);
INSERT INTO `auth_item` VALUES ('/currency/update', 2, NULL, NULL, NULL, 1535882766, 1535882766);
INSERT INTO `auth_item` VALUES ('/currency/view', 2, NULL, NULL, NULL, 1535882766, 1535882766);
INSERT INTO `auth_item` VALUES ('/customer-daily/index', 2, NULL, NULL, NULL, 1539702076, 1539702076);
INSERT INTO `auth_item` VALUES ('/customer-debt/*', 2, NULL, NULL, NULL, 1539619439, 1539619439);
INSERT INTO `auth_item` VALUES ('/customer-debt/create', 2, NULL, NULL, NULL, 1539619439, 1539619439);
INSERT INTO `auth_item` VALUES ('/customer-debt/delete', 2, NULL, NULL, NULL, 1539619439, 1539619439);
INSERT INTO `auth_item` VALUES ('/customer-debt/index', 2, NULL, NULL, NULL, 1539619439, 1539619439);
INSERT INTO `auth_item` VALUES ('/customer-debt/update', 2, NULL, NULL, NULL, 1539619439, 1539619439);
INSERT INTO `auth_item` VALUES ('/customer-debt/view', 2, NULL, NULL, NULL, 1539619439, 1539619439);
INSERT INTO `auth_item` VALUES ('/customer-storage/*', 2, NULL, NULL, NULL, 1539503452, 1539503452);
INSERT INTO `auth_item` VALUES ('/customer-storage/create', 2, NULL, NULL, NULL, 1539503452, 1539503452);
INSERT INTO `auth_item` VALUES ('/customer-storage/delete', 2, NULL, NULL, NULL, 1539503452, 1539503452);
INSERT INTO `auth_item` VALUES ('/customer-storage/index', 2, NULL, NULL, NULL, 1539503452, 1539503452);
INSERT INTO `auth_item` VALUES ('/customer-storage/update', 2, NULL, NULL, NULL, 1539503452, 1539503452);
INSERT INTO `auth_item` VALUES ('/customer-storage/view', 2, NULL, NULL, NULL, 1539503452, 1539503452);
INSERT INTO `auth_item` VALUES ('/customer/*', 2, NULL, NULL, NULL, 1535882767, 1535882767);
INSERT INTO `auth_item` VALUES ('/customer/create', 2, NULL, NULL, NULL, 1535882766, 1535882766);
INSERT INTO `auth_item` VALUES ('/customer/delete', 2, NULL, NULL, NULL, 1535882767, 1535882767);
INSERT INTO `auth_item` VALUES ('/customer/index', 2, NULL, NULL, NULL, 1535879739, 1535879739);
INSERT INTO `auth_item` VALUES ('/customer/update', 2, NULL, NULL, NULL, 1535882766, 1535882766);
INSERT INTO `auth_item` VALUES ('/customer/view', 2, NULL, NULL, NULL, 1535882766, 1535882766);
INSERT INTO `auth_item` VALUES ('/daily-report', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `auth_item` VALUES ('/daily-report/index', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `auth_item` VALUES ('/debug/*', 2, NULL, NULL, NULL, 1468341111, 1468341111);
INSERT INTO `auth_item` VALUES ('/debug/default/*', 2, NULL, NULL, NULL, 1468341110, 1468341110);
INSERT INTO `auth_item` VALUES ('/debug/default/download-mail', 2, NULL, NULL, NULL, 1468341101, 1468341101);
INSERT INTO `auth_item` VALUES ('/debug/default/index', 2, NULL, NULL, NULL, 1468341071, 1468341071);
INSERT INTO `auth_item` VALUES ('/debug/default/toolbar', 2, NULL, NULL, NULL, 1468341077, 1468341077);
INSERT INTO `auth_item` VALUES ('/debug/default/view', 2, NULL, NULL, NULL, 1468341075, 1468341075);
INSERT INTO `auth_item` VALUES ('/distric/*', 2, NULL, NULL, NULL, 1468341185, 1468341185);
INSERT INTO `auth_item` VALUES ('/distric/create', 2, NULL, NULL, NULL, 1468341180, 1468341180);
INSERT INTO `auth_item` VALUES ('/distric/delete', 2, NULL, NULL, NULL, 1468341184, 1468341184);
INSERT INTO `auth_item` VALUES ('/distric/index', 2, NULL, NULL, NULL, 1468341176, 1468341176);
INSERT INTO `auth_item` VALUES ('/distric/update', 2, NULL, NULL, NULL, 1468341182, 1468341182);
INSERT INTO `auth_item` VALUES ('/distric/view', 2, NULL, NULL, NULL, 1468341179, 1468341179);
INSERT INTO `auth_item` VALUES ('/fast-bill/*', 2, NULL, NULL, NULL, 1538443210, 1538443210);
INSERT INTO `auth_item` VALUES ('/fast-bill/create', 2, NULL, NULL, NULL, 1538443209, 1538443209);
INSERT INTO `auth_item` VALUES ('/fast-bill/delete', 2, NULL, NULL, NULL, 1538443210, 1538443210);
INSERT INTO `auth_item` VALUES ('/fast-bill/index', 2, NULL, NULL, NULL, 1538443209, 1538443209);
INSERT INTO `auth_item` VALUES ('/fast-bill/update', 2, NULL, NULL, NULL, 1538443209, 1538443209);
INSERT INTO `auth_item` VALUES ('/fast-bill/view', 2, NULL, NULL, NULL, 1538443209, 1538443209);
INSERT INTO `auth_item` VALUES ('/formed-bill/*', 2, NULL, NULL, NULL, 1536483069, 1536483069);
INSERT INTO `auth_item` VALUES ('/formed-bill/create', 2, NULL, NULL, NULL, 1536483069, 1536483069);
INSERT INTO `auth_item` VALUES ('/formed-bill/delete', 2, NULL, NULL, NULL, 1536483069, 1536483069);
INSERT INTO `auth_item` VALUES ('/formed-bill/index', 2, NULL, NULL, NULL, 1536483069, 1536483069);
INSERT INTO `auth_item` VALUES ('/formed-bill/update', 2, NULL, NULL, NULL, 1536483069, 1536483069);
INSERT INTO `auth_item` VALUES ('/formed-bill/view', 2, NULL, NULL, NULL, 1536483069, 1536483069);
INSERT INTO `auth_item` VALUES ('/gii/*', 2, NULL, NULL, NULL, 1468341136, 1468341136);
INSERT INTO `auth_item` VALUES ('/gii/default/*', 2, NULL, NULL, NULL, 1468341135, 1468341135);
INSERT INTO `auth_item` VALUES ('/gii/default/action', 2, NULL, NULL, NULL, 1468341135, 1468341135);
INSERT INTO `auth_item` VALUES ('/gii/default/diff', 2, NULL, NULL, NULL, 1468341134, 1468341134);
INSERT INTO `auth_item` VALUES ('/gii/default/index', 2, NULL, NULL, NULL, 1468341113, 1468341113);
INSERT INTO `auth_item` VALUES ('/gii/default/preview', 2, NULL, NULL, NULL, 1468341134, 1468341134);
INSERT INTO `auth_item` VALUES ('/gii/default/view', 2, NULL, NULL, NULL, 1468341133, 1468341133);
INSERT INTO `auth_item` VALUES ('/home-bank/*', 2, NULL, NULL, NULL, 1537973092, 1537973092);
INSERT INTO `auth_item` VALUES ('/home-bank/create', 2, NULL, NULL, NULL, 1537973092, 1537973092);
INSERT INTO `auth_item` VALUES ('/home-bank/delete', 2, NULL, NULL, NULL, 1537973092, 1537973092);
INSERT INTO `auth_item` VALUES ('/home-bank/export', 2, NULL, NULL, NULL, 1539098202, 1539098202);
INSERT INTO `auth_item` VALUES ('/home-bank/index', 2, NULL, NULL, NULL, 1537973092, 1537973092);
INSERT INTO `auth_item` VALUES ('/home-bank/update', 2, NULL, NULL, NULL, 1537973092, 1537973092);
INSERT INTO `auth_item` VALUES ('/home-bank/view', 2, NULL, NULL, NULL, 1537973092, 1537973092);
INSERT INTO `auth_item` VALUES ('/home-daily/index', 2, NULL, NULL, NULL, 1539704846, 1539704846);
INSERT INTO `auth_item` VALUES ('/home-debt/index', 2, NULL, NULL, NULL, 1539704839, 1539704839);
INSERT INTO `auth_item` VALUES ('/home-send/*', 2, NULL, NULL, NULL, 1537949578, 1537949578);
INSERT INTO `auth_item` VALUES ('/home-send/create', 2, NULL, NULL, NULL, 1537949578, 1537949578);
INSERT INTO `auth_item` VALUES ('/home-send/delete', 2, NULL, NULL, NULL, 1537949578, 1537949578);
INSERT INTO `auth_item` VALUES ('/home-send/index', 2, NULL, NULL, NULL, 1537949578, 1537949578);
INSERT INTO `auth_item` VALUES ('/home-send/update', 2, NULL, NULL, NULL, 1537949578, 1537949578);
INSERT INTO `auth_item` VALUES ('/home-send/view', 2, NULL, NULL, NULL, 1537949578, 1537949578);
INSERT INTO `auth_item` VALUES ('/home-storage-transaction/*', 2, NULL, NULL, NULL, 1537800606, 1537800606);
INSERT INTO `auth_item` VALUES ('/home-storage-transaction/create', 2, NULL, NULL, NULL, 1537800605, 1537800605);
INSERT INTO `auth_item` VALUES ('/home-storage-transaction/delete', 2, NULL, NULL, NULL, 1537800606, 1537800606);
INSERT INTO `auth_item` VALUES ('/home-storage-transaction/index', 2, NULL, NULL, NULL, 1537800605, 1537800605);
INSERT INTO `auth_item` VALUES ('/home-storage-transaction/update', 2, NULL, NULL, NULL, 1537800606, 1537800606);
INSERT INTO `auth_item` VALUES ('/home-storage-transaction/view', 2, NULL, NULL, NULL, 1537800605, 1537800605);
INSERT INTO `auth_item` VALUES ('/home-storage/*', 2, NULL, NULL, NULL, 1537717035, 1537717035);
INSERT INTO `auth_item` VALUES ('/home-storage/create', 2, NULL, NULL, NULL, 1537717035, 1537717035);
INSERT INTO `auth_item` VALUES ('/home-storage/delete', 2, NULL, NULL, NULL, 1537717035, 1537717035);
INSERT INTO `auth_item` VALUES ('/home-storage/index', 2, NULL, NULL, NULL, 1537717035, 1537717035);
INSERT INTO `auth_item` VALUES ('/home-storage/update', 2, NULL, NULL, NULL, 1537717035, 1537717035);
INSERT INTO `auth_item` VALUES ('/home-storage/view', 2, NULL, NULL, NULL, 1537717035, 1537717035);
INSERT INTO `auth_item` VALUES ('/home-trading/*', 2, NULL, NULL, NULL, 1537959675, 1537959675);
INSERT INTO `auth_item` VALUES ('/home-trading/create', 2, NULL, NULL, NULL, 1537959675, 1537959675);
INSERT INTO `auth_item` VALUES ('/home-trading/delete', 2, NULL, NULL, NULL, 1537959675, 1537959675);
INSERT INTO `auth_item` VALUES ('/home-trading/export', 2, NULL, NULL, NULL, 1537973092, 1537973092);
INSERT INTO `auth_item` VALUES ('/home-trading/index', 2, NULL, NULL, NULL, 1537959675, 1537959675);
INSERT INTO `auth_item` VALUES ('/home-trading/update', 2, NULL, NULL, NULL, 1537959675, 1537959675);
INSERT INTO `auth_item` VALUES ('/home-trading/view', 2, NULL, NULL, NULL, 1537959675, 1537959675);
INSERT INTO `auth_item` VALUES ('/home-transfer/*', 2, NULL, NULL, NULL, 1537953905, 1537953905);
INSERT INTO `auth_item` VALUES ('/home-transfer/create', 2, NULL, NULL, NULL, 1537953904, 1537953904);
INSERT INTO `auth_item` VALUES ('/home-transfer/delete', 2, NULL, NULL, NULL, 1537953905, 1537953905);
INSERT INTO `auth_item` VALUES ('/home-transfer/export', 2, NULL, NULL, NULL, 1537959678, 1537959678);
INSERT INTO `auth_item` VALUES ('/home-transfer/index', 2, NULL, NULL, NULL, 1537953904, 1537953904);
INSERT INTO `auth_item` VALUES ('/home-transfer/update', 2, NULL, NULL, NULL, 1537953905, 1537953905);
INSERT INTO `auth_item` VALUES ('/home-transfer/view', 2, NULL, NULL, NULL, 1537953904, 1537953904);
INSERT INTO `auth_item` VALUES ('/longtime-bill/*', 2, NULL, NULL, NULL, 1537600615, 1537600615);
INSERT INTO `auth_item` VALUES ('/longtime-bill/create', 2, NULL, NULL, NULL, 1537600614, 1537600614);
INSERT INTO `auth_item` VALUES ('/longtime-bill/delete', 2, NULL, NULL, NULL, 1537600614, 1537600614);
INSERT INTO `auth_item` VALUES ('/longtime-bill/export', 2, NULL, NULL, NULL, 1537600614, 1537600614);
INSERT INTO `auth_item` VALUES ('/longtime-bill/index', 2, NULL, NULL, NULL, 1537600614, 1537600614);
INSERT INTO `auth_item` VALUES ('/longtime-bill/update', 2, NULL, NULL, NULL, 1537600614, 1537600614);
INSERT INTO `auth_item` VALUES ('/longtime-bill/view', 2, NULL, NULL, NULL, 1537600614, 1537600614);
INSERT INTO `auth_item` VALUES ('/menu/*', 2, NULL, NULL, NULL, 1468421684, 1468421684);
INSERT INTO `auth_item` VALUES ('/menu/create', 2, NULL, NULL, NULL, 1468421684, 1468421684);
INSERT INTO `auth_item` VALUES ('/menu/delete', 2, NULL, NULL, NULL, 1468421684, 1468421684);
INSERT INTO `auth_item` VALUES ('/menu/galleryApi', 2, NULL, NULL, NULL, 1468421684, 1468421684);
INSERT INTO `auth_item` VALUES ('/menu/index', 2, NULL, NULL, NULL, 1468421684, 1468421684);
INSERT INTO `auth_item` VALUES ('/menu/update', 2, NULL, NULL, NULL, 1468421684, 1468421684);
INSERT INTO `auth_item` VALUES ('/menu/view', 2, NULL, NULL, NULL, 1468421684, 1468421684);
INSERT INTO `auth_item` VALUES ('/mode/*', 2, NULL, NULL, NULL, 1468421686, 1468421686);
INSERT INTO `auth_item` VALUES ('/mode/create', 2, NULL, NULL, NULL, 1468421685, 1468421685);
INSERT INTO `auth_item` VALUES ('/mode/delete', 2, NULL, NULL, NULL, 1468421685, 1468421685);
INSERT INTO `auth_item` VALUES ('/mode/design', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/mode/index', 2, NULL, NULL, NULL, 1468421684, 1468421684);
INSERT INTO `auth_item` VALUES ('/mode/update', 2, NULL, NULL, NULL, 1468421685, 1468421685);
INSERT INTO `auth_item` VALUES ('/mode/view', 2, NULL, NULL, NULL, 1468421684, 1468421684);
INSERT INTO `auth_item` VALUES ('/module-status/*', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/module-status/create', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/module-status/delete', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/module-status/index', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/module-status/update', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/module-status/view', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/modules/*', 2, NULL, NULL, NULL, 1468421687, 1468421687);
INSERT INTO `auth_item` VALUES ('/modules/create', 2, NULL, NULL, NULL, 1468421686, 1468421686);
INSERT INTO `auth_item` VALUES ('/modules/delete', 2, NULL, NULL, NULL, 1468421687, 1468421687);
INSERT INTO `auth_item` VALUES ('/modules/index', 2, NULL, NULL, NULL, 1468421686, 1468421686);
INSERT INTO `auth_item` VALUES ('/modules/update', 2, NULL, NULL, NULL, 1468421686, 1468421686);
INSERT INTO `auth_item` VALUES ('/modules/view', 2, NULL, NULL, NULL, 1468421686, 1468421686);
INSERT INTO `auth_item` VALUES ('/movie/*', 2, NULL, NULL, NULL, 1512968287, 1512968287);
INSERT INTO `auth_item` VALUES ('/movie/create', 2, NULL, NULL, NULL, 1512984265, 1512984265);
INSERT INTO `auth_item` VALUES ('/movie/index', 2, NULL, NULL, NULL, 1512984259, 1512984259);
INSERT INTO `auth_item` VALUES ('/movie/update', 2, NULL, NULL, NULL, 1512984271, 1512984271);
INSERT INTO `auth_item` VALUES ('/news/*', 2, NULL, NULL, NULL, 1513263575, 1513263575);
INSERT INTO `auth_item` VALUES ('/news/create', 2, NULL, NULL, NULL, 1513263574, 1513263574);
INSERT INTO `auth_item` VALUES ('/news/index', 2, NULL, NULL, NULL, 1513263574, 1513263574);
INSERT INTO `auth_item` VALUES ('/news/update', 2, NULL, NULL, NULL, 1513263574, 1513263574);
INSERT INTO `auth_item` VALUES ('/news/view', 2, NULL, NULL, NULL, 1513263574, 1513263574);
INSERT INTO `auth_item` VALUES ('/other-home-transfer/*', 2, NULL, NULL, NULL, 1539798932, 1539798932);
INSERT INTO `auth_item` VALUES ('/other-home-transfer/create', 2, NULL, NULL, NULL, 1539798932, 1539798932);
INSERT INTO `auth_item` VALUES ('/other-home-transfer/delete', 2, NULL, NULL, NULL, 1539798932, 1539798932);
INSERT INTO `auth_item` VALUES ('/other-home-transfer/index', 2, NULL, NULL, NULL, 1539798932, 1539798932);
INSERT INTO `auth_item` VALUES ('/other-home-transfer/update', 2, NULL, NULL, NULL, 1539798932, 1539798932);
INSERT INTO `auth_item` VALUES ('/other-home-transfer/view', 2, NULL, NULL, NULL, 1539798932, 1539798932);
INSERT INTO `auth_item` VALUES ('/other-transfer/*', 2, NULL, NULL, NULL, 1537886665, 1537886665);
INSERT INTO `auth_item` VALUES ('/other-transfer/create', 2, NULL, NULL, NULL, 1537886664, 1537886664);
INSERT INTO `auth_item` VALUES ('/other-transfer/export', 2, NULL, NULL, NULL, 1539798932, 1539798932);
INSERT INTO `auth_item` VALUES ('/other-transfer/index', 2, NULL, NULL, NULL, 1537886664, 1537886664);
INSERT INTO `auth_item` VALUES ('/other-transfer/update', 2, NULL, NULL, NULL, 1537886664, 1537886664);
INSERT INTO `auth_item` VALUES ('/output-mode/*', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/output-mode/create', 2, NULL, NULL, NULL, 1468421687, 1468421687);
INSERT INTO `auth_item` VALUES ('/output-mode/delete', 2, NULL, NULL, NULL, 1468421687, 1468421687);
INSERT INTO `auth_item` VALUES ('/output-mode/index', 2, NULL, NULL, NULL, 1468421687, 1468421687);
INSERT INTO `auth_item` VALUES ('/output-mode/update', 2, NULL, NULL, NULL, 1468421687, 1468421687);
INSERT INTO `auth_item` VALUES ('/output-mode/view', 2, NULL, NULL, NULL, 1468421687, 1468421687);
INSERT INTO `auth_item` VALUES ('/param-config/*', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/param-config/create', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/param-config/delete', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/param-config/index', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/param-config/update', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/param-config/view', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/pets/*', 2, NULL, NULL, NULL, 1533653576, 1533653576);
INSERT INTO `auth_item` VALUES ('/pets/create', 2, NULL, NULL, NULL, 1533653576, 1533653576);
INSERT INTO `auth_item` VALUES ('/pets/delete', 2, NULL, NULL, NULL, 1533653576, 1533653576);
INSERT INTO `auth_item` VALUES ('/pets/index', 2, NULL, NULL, NULL, 1533653576, 1533653576);
INSERT INTO `auth_item` VALUES ('/pets/update', 2, NULL, NULL, NULL, 1533653576, 1533653576);
INSERT INTO `auth_item` VALUES ('/pets/view', 2, NULL, NULL, NULL, 1533653576, 1533653576);
INSERT INTO `auth_item` VALUES ('/pettype/*', 2, NULL, NULL, NULL, 1533653577, 1533653577);
INSERT INTO `auth_item` VALUES ('/pettype/create', 2, NULL, NULL, NULL, 1533653577, 1533653577);
INSERT INTO `auth_item` VALUES ('/pettype/delete', 2, NULL, NULL, NULL, 1533653577, 1533653577);
INSERT INTO `auth_item` VALUES ('/pettype/index', 2, NULL, NULL, NULL, 1533653576, 1533653576);
INSERT INTO `auth_item` VALUES ('/pettype/update', 2, NULL, NULL, NULL, 1533653577, 1533653577);
INSERT INTO `auth_item` VALUES ('/pettype/view', 2, NULL, NULL, NULL, 1533653577, 1533653577);
INSERT INTO `auth_item` VALUES ('/provincial/*', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/provincial/create', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/provincial/delete', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/provincial/index', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/provincial/update', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/provincial/view', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/register/*', 2, NULL, NULL, NULL, 1513178312, 1513178312);
INSERT INTO `auth_item` VALUES ('/register/index', 2, NULL, NULL, NULL, 1513178312, 1513178312);
INSERT INTO `auth_item` VALUES ('/register/update', 2, NULL, NULL, NULL, 1513178312, 1513178312);
INSERT INTO `auth_item` VALUES ('/register/view', 2, NULL, NULL, NULL, 1513178312, 1513178312);
INSERT INTO `auth_item` VALUES ('/reset-password/*', 2, NULL, NULL, NULL, 1480405669, 1480405669);
INSERT INTO `auth_item` VALUES ('/reset-password/index', 2, NULL, NULL, NULL, 1480405669, 1480405669);
INSERT INTO `auth_item` VALUES ('/runtime-statistics/*', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/runtime-statistics/create', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/runtime-statistics/delete', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/runtime-statistics/index', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/runtime-statistics/update', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/runtime-statistics/view', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/runtime/*', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/runtime/create', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/runtime/delete', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/runtime/index', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/runtime/update', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/runtime/view', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/sensor/*', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/sensor/create', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/sensor/delete', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/sensor/index', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/sensor/update', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/sensor/view', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/site/*', 2, NULL, NULL, NULL, 1468421689, 1468421689);
INSERT INTO `auth_item` VALUES ('/site/captcha', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/site/error', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/site/index', 2, NULL, NULL, NULL, 1468421688, 1468421688);
INSERT INTO `auth_item` VALUES ('/site/login', 2, NULL, NULL, NULL, 1468421689, 1468421689);
INSERT INTO `auth_item` VALUES ('/site/logout', 2, NULL, NULL, NULL, 1468421689, 1468421689);
INSERT INTO `auth_item` VALUES ('/socket/*', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/socket/index', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/storage/*', 2, NULL, NULL, NULL, 1535878243, 1535878243);
INSERT INTO `auth_item` VALUES ('/storage/create', 2, NULL, NULL, NULL, 1535878367, 1535878367);
INSERT INTO `auth_item` VALUES ('/storage/delete', 2, NULL, NULL, NULL, 1535878367, 1535878367);
INSERT INTO `auth_item` VALUES ('/storage/index', 2, NULL, NULL, NULL, 1535878367, 1535878367);
INSERT INTO `auth_item` VALUES ('/storage/update', 2, NULL, NULL, NULL, 1535878367, 1535878367);
INSERT INTO `auth_item` VALUES ('/storage/view', 2, NULL, NULL, NULL, 1535878367, 1535878367);
INSERT INTO `auth_item` VALUES ('/timer-counter/*', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/timer-counter/create', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/timer-counter/delete', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/timer-counter/index', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/timer-counter/update', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/timer-counter/view', 2, NULL, NULL, NULL, 1479716667, 1479716667);
INSERT INTO `auth_item` VALUES ('/transfer-currency/*', 2, NULL, NULL, NULL, 1535890861, 1535890861);
INSERT INTO `auth_item` VALUES ('/transfer-currency/create', 2, NULL, NULL, NULL, 1535890861, 1535890861);
INSERT INTO `auth_item` VALUES ('/transfer-currency/delete', 2, NULL, NULL, NULL, 1535890861, 1535890861);
INSERT INTO `auth_item` VALUES ('/transfer-currency/index', 2, NULL, NULL, NULL, 1535890861, 1535890861);
INSERT INTO `auth_item` VALUES ('/transfer-currency/update', 2, NULL, NULL, NULL, 1535890861, 1535890861);
INSERT INTO `auth_item` VALUES ('/transfer-currency/view', 2, NULL, NULL, NULL, 1535890861, 1535890861);
INSERT INTO `auth_item` VALUES ('/user/*', 2, NULL, NULL, NULL, 1468421689, 1468421689);
INSERT INTO `auth_item` VALUES ('/user/create', 2, NULL, NULL, NULL, 1468421689, 1468421689);
INSERT INTO `auth_item` VALUES ('/user/delete', 2, NULL, NULL, NULL, 1468421689, 1468421689);
INSERT INTO `auth_item` VALUES ('/user/galleryApi', 2, NULL, NULL, NULL, 1468421689, 1468421689);
INSERT INTO `auth_item` VALUES ('/user/index', 2, NULL, NULL, NULL, 1468421689, 1468421689);
INSERT INTO `auth_item` VALUES ('/user/update', 2, NULL, NULL, NULL, 1468421689, 1468421689);
INSERT INTO `auth_item` VALUES ('/user/view', 2, NULL, NULL, NULL, 1468421689, 1468421689);
INSERT INTO `auth_item` VALUES ('/view-debt/*', 2, NULL, NULL, NULL, 1538297288, 1538297288);
INSERT INTO `auth_item` VALUES ('/view-debt/create', 2, NULL, NULL, NULL, 1538297288, 1538297288);
INSERT INTO `auth_item` VALUES ('/view-debt/delete', 2, NULL, NULL, NULL, 1538297288, 1538297288);
INSERT INTO `auth_item` VALUES ('/view-debt/index', 2, NULL, NULL, NULL, 1538297288, 1538297288);
INSERT INTO `auth_item` VALUES ('/view-debt/update', 2, NULL, NULL, NULL, 1538297288, 1538297288);
INSERT INTO `auth_item` VALUES ('/view-debt/view', 2, NULL, NULL, NULL, 1538297288, 1538297288);
INSERT INTO `auth_item` VALUES ('admin', 1, 'Administrator', NULL, NULL, 1468421733, 1533656982);
INSERT INTO `auth_item` VALUES ('User', 1, NULL, NULL, NULL, 1513907402, 1533656895);

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('admin', '/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/assignment/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/assignment/assign');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/assignment/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/assignment/revoke');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/assignment/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/default/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/default/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/menu/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/menu/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/menu/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/menu/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/menu/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/menu/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/permission/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/permission/assign');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/permission/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/permission/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/permission/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/permission/remove');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/permission/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/permission/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/role/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/role/assign');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/role/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/role/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/role/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/role/remove');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/role/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/role/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/route/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/route/assign');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/route/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/route/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/route/refresh');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/route/remove');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/rule/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/rule/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/rule/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/rule/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/rule/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/rule/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/user/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/user/activate');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/user/change-password');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/user/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/user/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/user/login');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/user/logout');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/user/request-password-reset');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/user/reset-password');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/user/signup');
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/user/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/app/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/app/galleryApi');
INSERT INTO `auth_item_child` VALUES ('admin', '/banner/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/banner/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/banner/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/banner/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/banner/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/banner/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/country/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/country/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/country/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/country/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/country/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/country/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/debug/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/debug/default/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/debug/default/download-mail');
INSERT INTO `auth_item_child` VALUES ('admin', '/debug/default/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/debug/default/toolbar');
INSERT INTO `auth_item_child` VALUES ('admin', '/debug/default/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/distric/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/distric/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/distric/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/distric/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/distric/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/distric/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/gii/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/gii/default/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/gii/default/action');
INSERT INTO `auth_item_child` VALUES ('admin', '/gii/default/diff');
INSERT INTO `auth_item_child` VALUES ('admin', '/gii/default/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/gii/default/preview');
INSERT INTO `auth_item_child` VALUES ('admin', '/gii/default/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/menu/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/menu/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/menu/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/menu/galleryApi');
INSERT INTO `auth_item_child` VALUES ('admin', '/menu/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/menu/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/menu/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/mode/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/mode/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/mode/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/mode/design');
INSERT INTO `auth_item_child` VALUES ('admin', '/mode/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/mode/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/mode/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/module-status/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/module-status/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/module-status/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/module-status/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/module-status/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/module-status/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/modules/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/modules/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/modules/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/modules/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/modules/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/modules/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/movie/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/output-mode/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/output-mode/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/output-mode/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/output-mode/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/output-mode/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/output-mode/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/param-config/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/param-config/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/param-config/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/param-config/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/param-config/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/param-config/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/provincial/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/provincial/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/provincial/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/provincial/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/provincial/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/provincial/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/reset-password/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/reset-password/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/runtime-statistics/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/runtime-statistics/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/runtime-statistics/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/runtime-statistics/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/runtime-statistics/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/runtime-statistics/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/runtime/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/runtime/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/runtime/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/runtime/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/runtime/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/runtime/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/sensor/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/sensor/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/sensor/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/sensor/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/sensor/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/sensor/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/site/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/site/captcha');
INSERT INTO `auth_item_child` VALUES ('admin', '/site/error');
INSERT INTO `auth_item_child` VALUES ('admin', '/site/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/site/login');
INSERT INTO `auth_item_child` VALUES ('admin', '/site/logout');
INSERT INTO `auth_item_child` VALUES ('admin', '/socket/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/socket/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/timer-counter/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/timer-counter/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/timer-counter/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/timer-counter/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/timer-counter/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/timer-counter/view');
INSERT INTO `auth_item_child` VALUES ('admin', '/user/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/user/create');
INSERT INTO `auth_item_child` VALUES ('admin', '/user/delete');
INSERT INTO `auth_item_child` VALUES ('admin', '/user/galleryApi');
INSERT INTO `auth_item_child` VALUES ('admin', '/user/index');
INSERT INTO `auth_item_child` VALUES ('admin', '/user/update');
INSERT INTO `auth_item_child` VALUES ('admin', '/user/view');
INSERT INTO `auth_item_child` VALUES ('User', '/pets/*');
INSERT INTO `auth_item_child` VALUES ('User', '/pets/create');
INSERT INTO `auth_item_child` VALUES ('User', '/pets/delete');
INSERT INTO `auth_item_child` VALUES ('User', '/pets/index');
INSERT INTO `auth_item_child` VALUES ('User', '/pets/update');
INSERT INTO `auth_item_child` VALUES ('User', '/pets/view');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(2) NULL DEFAULT NULL COMMENT '1. Hop dong giao ngay, 2.Hop dong chot, 3. Hop dong dai han, 4. Hoa don chuyen tien, 5. Hoa don vay muon, 6. chuyen tien khac, 7. chuyen tien que, 8. Mua ban que, 9.Chuyen khoan que',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ma hop dong',
  `customer_id` bigint(20) NULL DEFAULT 0,
  `value` double(10, 2) NULL DEFAULT NULL,
  `customer_type` int(2) NULL DEFAULT NULL COMMENT '1. Nha vang, 2.Khanh le',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deposit` double(10, 2) NULL DEFAULT NULL COMMENT 'tien dat coc',
  `fee` double(10, 2) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `is_export` int(1) NULL DEFAULT 0 COMMENT '1. da xuat hoa don, 0. chua xuat',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES (1, 5, 'VM-20181023-Kim Quý TC-1', 13, NULL, NULL, 'abc', NULL, NULL, NULL, '2018-10-23 23:20:09', 1);
INSERT INTO `bill` VALUES (2, 5, 'VM-20181024-Tùng Bảo Minh-1', 11, NULL, NULL, '', NULL, NULL, NULL, '2018-10-24 00:16:37', 1);
INSERT INTO `bill` VALUES (3, 5, 'VM-20181024-Kim Hóa-2', 12, NULL, NULL, '', NULL, NULL, NULL, '2018-10-24 00:17:14', 1);
INSERT INTO `bill` VALUES (4, 5, 'VM-20181024-Định Công-3', 10, NULL, NULL, 'sdsds', NULL, NULL, NULL, '2018-10-24 00:24:05', 1);
INSERT INTO `bill` VALUES (5, 5, 'VM-20181024-Kim Quý TC-4', 13, NULL, NULL, '', NULL, NULL, NULL, '2018-10-24 00:29:22', 1);
INSERT INTO `bill` VALUES (6, 4, 'TC-20181024-Kim Quý TC-1', 13, NULL, NULL, '', 'ABC', NULL, NULL, '2018-10-24 21:42:20', 1);
INSERT INTO `bill` VALUES (7, 1, 'MBGN-20181024-Kim Quý TC-1', 13, 1500000.00, NULL, '', NULL, NULL, NULL, '2018-10-24 22:52:39', 1);
INSERT INTO `bill` VALUES (8, 3, 'MBDH-20181024-Cường Ngõ Trạm-1', 48, -35250000.00, NULL, '', NULL, NULL, NULL, '2018-10-24 23:09:06', 0);
INSERT INTO `bill` VALUES (9, 3, 'MBDH-20181024-Henry Tạ-2', 34, NULL, NULL, '', NULL, NULL, NULL, '2018-10-24 23:17:06', 1);

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msisdn` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_time` datetime(6) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL COMMENT '1- da xem, 0 chua xem',
  `updated_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES (1, 'khanh', '988781354', 'abc', '2017-12-15 23:35:58.000000', 1, '2017-12-15 23:36:42.000000');
INSERT INTO `contact` VALUES (2, 'Ngyen quoc Khanh', '1234567', 'DDOngs phim', '2017-12-30 02:55:03.000000', NULL, '2017-12-30 02:55:03.000000');
INSERT INTO `contact` VALUES (3, 'khanhnq16', '9843984093', 'test message', '2017-12-30 02:56:27.000000', NULL, '2017-12-30 02:56:27.000000');

-- ----------------------------
-- Table structure for currency
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exchange_rate` double(10, 2) NULL DEFAULT NULL,
  `is_active` int(1) NULL DEFAULT 1,
  `type` int(2) NULL DEFAULT 0 COMMENT '0. kho, 1.tai khoan ngan hang',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES (12, 'VND', 'VND', 1.00, 1, 0);
INSERT INTO `currency` VALUES (13, 'USD', 'USD', 2344.00, 1, 0);
INSERT INTO `currency` VALUES (14, 'CAD', 'CAD', 1800.00, 1, 0);
INSERT INTO `currency` VALUES (15, 'TK Vietcombank', 'TK VCB', NULL, 1, 1);
INSERT INTO `currency` VALUES (16, 'TK Sacombank', 'TK SCB', NULL, 1, 1);
INSERT INTO `currency` VALUES (17, 'TK ACB', 'TK ACB', NULL, 1, 1);
INSERT INTO `currency` VALUES (18, 'TK Maritime Bank', 'TK Maritime Bank', NULL, 1, 1);
INSERT INTO `currency` VALUES (19, 'TK VP Bank', 'TK VP Bank', NULL, 1, 1);
INSERT INTO `currency` VALUES (20, 'Tệ', 'Tệ', 340.00, 1, 0);
INSERT INTO `currency` VALUES (21, 'Yên', 'Yên', 2010.00, 1, 0);
INSERT INTO `currency` VALUES (22, 'Úc', 'Úc', 1800.00, 1, 0);
INSERT INTO `currency` VALUES (23, 'Won', 'Won', 210.00, 1, 0);
INSERT INTO `currency` VALUES (24, 'Kíp Lào', 'Kíp Lào', 250.00, 1, 0);
INSERT INTO `currency` VALUES (25, 'SJC', 'SJC', 3640.00, 1, 0);
INSERT INTO `currency` VALUES (26, '9999', '9999', 3230.00, 1, 0);
INSERT INTO `currency` VALUES (27, 'Đài', 'Đài', 720.00, 1, 0);
INSERT INTO `currency` VALUES (28, 'Bạt', 'Bạt', 701.00, 1, 0);
INSERT INTO `currency` VALUES (29, 'Malai', 'Malai', 340.00, 1, 0);
INSERT INTO `currency` VALUES (30, 'Ấn Độ', 'Ấn Độ', 150.00, 1, 0);
INSERT INTO `currency` VALUES (31, 'Newzeland', 'Newzeland', 1920.00, 1, 0);
INSERT INTO `currency` VALUES (32, 'Thụy Sĩ', 'Thụy Sĩ', 2129.00, 1, 0);
INSERT INTO `currency` VALUES (33, 'Euro', 'Euro', 2750.00, 1, 0);
INSERT INTO `currency` VALUES (34, 'Bảng Anh', 'Bảng Anh', 3340.00, 1, 0);
INSERT INTO `currency` VALUES (35, 'Rúp Nga', 'Rúp Nga', 540.00, 1, 0);
INSERT INTO `currency` VALUES (36, 'Hồng Kong', 'Hồng Kong', 298.00, 1, 0);
INSERT INTO `currency` VALUES (37, 'Indo', 'Indo', 1.60, 1, 0);
INSERT INTO `currency` VALUES (38, 'Philipines', 'Philipines', 400.00, 1, 0);
INSERT INTO `currency` VALUES (39, 'TK TPbank', 'TK TPbank', NULL, 1, 1);
INSERT INTO `currency` VALUES (40, 'TK Seabank', 'TK Seabank', NULL, 1, 1);
INSERT INTO `currency` VALUES (41, 'TK MBbank', 'TK MBbank', NULL, 1, 1);
INSERT INTO `currency` VALUES (42, 'TK BiDV', 'TK BiDV', NULL, 1, 1);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (8, 'Ngân Hà', 'Ngân Hà', '');
INSERT INTO `customer` VALUES (9, 'Lợi 43', 'Lợi 43', '');
INSERT INTO `customer` VALUES (10, 'Định Công', 'Định Công', '');
INSERT INTO `customer` VALUES (11, 'Tùng Bảo Minh 32 HT', 'Tùng Bảo Minh', '');
INSERT INTO `customer` VALUES (12, 'Kim Hóa', 'Kim Hóa', '');
INSERT INTO `customer` VALUES (13, 'Kim Quý Trường Chinh', 'Kim Quý TC', '');
INSERT INTO `customer` VALUES (14, 'Kim Quý Lê Văn Lương', 'Kim Quý LVL', '');
INSERT INTO `customer` VALUES (15, 'Thắng 41 HT', 'Thắng 41 HT', '');
INSERT INTO `customer` VALUES (16, 'Thịnh 33 HT', 'Thịnh 33 HT', '');
INSERT INTO `customer` VALUES (17, 'Quân', 'Quân', '');
INSERT INTO `customer` VALUES (18, 'Nguyên', 'Nguyên', '');
INSERT INTO `customer` VALUES (19, 'Nam', 'Nam', '');
INSERT INTO `customer` VALUES (20, 'Đông Tố Hữu', 'Đông Tố Hữu', '');
INSERT INTO `customer` VALUES (21, 'Khách Lẻ', 'Khách Lẻ', '');
INSERT INTO `customer` VALUES (23, 'Phi Đoan', 'Phi Đoan', '');
INSERT INTO `customer` VALUES (24, 'Tạo Miên', 'Tạo Miên', '');
INSERT INTO `customer` VALUES (25, 'Việt Hà ', 'Việt Hà', '');
INSERT INTO `customer` VALUES (26, 'Mạnh 63 HT', 'Mạnh 63 HT', '');
INSERT INTO `customer` VALUES (27, 'Đức 61 HT', 'Đức 61 HT', '');
INSERT INTO `customer` VALUES (28, 'Đức 8b HT', 'Đức 8b HT', '');
INSERT INTO `customer` VALUES (29, 'Mạnh Hưng 51 HT', 'Mạnh Hưng 51 HT', '');
INSERT INTO `customer` VALUES (30, 'Tuấn 59 HT', 'Tuấn 59 HT', '');
INSERT INTO `customer` VALUES (31, 'Dương 49 HT', 'Dương 49 HT', '');
INSERT INTO `customer` VALUES (32, 'Vân Kim Linh', 'Vân Kinh Linh', '');
INSERT INTO `customer` VALUES (33, 'Minh Mỵ', 'Minh Mỵ', '');
INSERT INTO `customer` VALUES (34, 'Henry Tạ', 'Henry Tạ', '');
INSERT INTO `customer` VALUES (35, 'Kim Thịnh - Tôn Thất Tùng', 'Kim Thịnh TTT', '');
INSERT INTO `customer` VALUES (36, 'Hoàng Anh 21 HT', 'Hoàng Anh 21 HT', '');
INSERT INTO `customer` VALUES (37, 'Chiến Minh CG', 'Chiến Minh CG', '');
INSERT INTO `customer` VALUES (38, 'Minh VCB', 'Minh VCB', '');
INSERT INTO `customer` VALUES (39, 'Oanh - Phương Mai', 'Oanh PM', '');
INSERT INTO `customer` VALUES (40, 'Tech Trần Điền', 'Tech Trần Điền', '');
INSERT INTO `customer` VALUES (41, 'Tech Lê Thanh Nghị', 'Tech Lê Thanh Nghị', '');
INSERT INTO `customer` VALUES (42, 'Tùng S', 'Tùng S', '');
INSERT INTO `customer` VALUES (43, 'Yến', 'Yến', '');
INSERT INTO `customer` VALUES (44, 'Hoan', 'Hoan', '');
INSERT INTO `customer` VALUES (45, 'Toàn Phát', 'Toàn Phát', '');
INSERT INTO `customer` VALUES (46, 'Phương Xuân HT', 'Phương Xuân HT', '');
INSERT INTO `customer` VALUES (47, 'Mệnh Thoa', 'Mệnh Thoa', '');
INSERT INTO `customer` VALUES (48, 'Cường Ngõ Trạm', 'Cường Ngõ Trạm', '');
INSERT INTO `customer` VALUES (49, 'VCB Lê Trọng Tấn', 'VCB Lê Trọng Tấn', '');
INSERT INTO `customer` VALUES (50, 'Huy BV', 'Huy BV', '');
INSERT INTO `customer` VALUES (51, 'Lụa BV', 'Lụa BV', '');
INSERT INTO `customer` VALUES (52, 'Hưng BV', 'Hưng BV', '');
INSERT INTO `customer` VALUES (53, 'Sầu Riêng', 'Sầu Riêng', '');
INSERT INTO `customer` VALUES (54, 'Tâm Đạt', 'Tâm Đạt', '');
INSERT INTO `customer` VALUES (55, 'Hùng 36 Phùng Hưng', 'Hùng 36 PH', '');
INSERT INTO `customer` VALUES (56, 'Khánh 17', 'Khánh 17', '');
INSERT INTO `customer` VALUES (57, 'Minh Tín Thành', 'Minh Tín Thành', '');
INSERT INTO `customer` VALUES (58, 'Dũng Béo', 'Dũng Béo', '');

-- ----------------------------
-- Table structure for debt
-- ----------------------------
DROP TABLE IF EXISTS `debt`;
CREATE TABLE `debt`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency_id` bigint(20) NULL DEFAULT NULL,
  `customer_id` bigint(20) NULL DEFAULT NULL,
  `value` float(10, 2) NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1434 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for home_storage
-- ----------------------------
DROP TABLE IF EXISTS `home_storage`;
CREATE TABLE `home_storage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency_id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `home_st_currency`(`currency_id`) USING BTREE,
  CONSTRAINT `home_st_currency` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for home_storage_transaction
-- ----------------------------
DROP TABLE IF EXISTS `home_storage_transaction`;
CREATE TABLE `home_storage_transaction`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency_id` bigint(20) NULL DEFAULT NULL,
  `quantity` int(10) NULL DEFAULT NULL,
  `created_time` datetime(6) NULL DEFAULT NULL,
  `type` int(2) NULL DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent` int(11) NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `icon` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent`(`parent`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 'Account manager', NULL, NULL, 5, NULL, 'icon-user-following', NULL);
INSERT INTO `menu` VALUES (2, 'Account', 1, '/admin/user/index', 1, NULL, 'icon-users', NULL);
INSERT INTO `menu` VALUES (3, 'Menu', 1, '/menu/index', 2, NULL, 'icon-list', NULL);
INSERT INTO `menu` VALUES (20, 'Quản lý Nhập liệu', NULL, NULL, 1, NULL, '', NULL);
INSERT INTO `menu` VALUES (26, 'Quyền', 1, '/admin/role/index', NULL, NULL, NULL, NULL);
INSERT INTO `menu` VALUES (27, 'Cấp quyền', 1, '/admin/assignment/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (28, 'Nhập Kho', 20, '/storage/index', 1, NULL, '', NULL);
INSERT INTO `menu` VALUES (29, 'Nhập Khách Hàng', 20, '/customer/index', 2, NULL, '', NULL);
INSERT INTO `menu` VALUES (30, 'Nhập Hàng Hóa', 20, '/currency/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (31, 'Quản lý Tiền chuyển', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (32, 'Tiền chuyển VN', 31, '/transfer-currency/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (33, 'Tiền chuyển Khác', 31, NULL, NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (34, 'Quản lý Vay Mượn', NULL, '/borrow/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (35, 'Quản lý Mua Bán', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (36, 'Mua bán chốt hợp đồng', 35, '/formed-bill/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (37, 'Mua bán Dài hạn', 35, '/longtime-bill/index', NULL, NULL, 'icon-user-unfollow', NULL);
INSERT INTO `menu` VALUES (38, 'Quản lý Quê', NULL, NULL, NULL, NULL, 'icon-screen-smartphone', NULL);
INSERT INTO `menu` VALUES (39, 'Nhập kho Quê', 38, '/home-storage-transaction/index', 1, NULL, 'icon-user-unfollow', NULL);
INSERT INTO `menu` VALUES (40, 'Tiền chuyển khác', 31, '/other-transfer/index', NULL, NULL, 'icon-user-follow', NULL);
INSERT INTO `menu` VALUES (41, 'Gửi quê', 38, '/home-send/index', NULL, NULL, 'icon-trophy', NULL);
INSERT INTO `menu` VALUES (42, 'Tiền chuyển Quê', 38, '/home-transfer/index', NULL, NULL, 'icon-user-following', NULL);
INSERT INTO `menu` VALUES (43, 'Mua bán Quê', 38, '/home-trading/index', NULL, NULL, 'icon-chemistry', NULL);
INSERT INTO `menu` VALUES (44, 'Chuyển khoản Quê', 38, '/home-bank/index', NULL, NULL, 'icon-crop', NULL);
INSERT INTO `menu` VALUES (45, 'Báo cáo cửa hàng', NULL, NULL, NULL, NULL, 'icon-user-unfollow', NULL);
INSERT INTO `menu` VALUES (46, 'Báo cáo hàng ngày', 45, '/daily-report/index', NULL, NULL, 'icon-user-unfollow', NULL);
INSERT INTO `menu` VALUES (47, 'Báo cáo Lời lãi', 45, '/view-debt/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (48, 'Mua bán Giao ngay', 35, '/fast-bill/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (49, 'Quản lý Tài khoản NH', 20, '/bank-account/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (50, 'Quản lý số dư Tk', 51, '/bank-storage/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (51, 'Quản lý Tài Khoản Ngân hàng', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (52, 'Giao dịch Ngân Hàng', 51, '/bank-trans/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (53, 'Chi Phí', 20, '/cost/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (54, 'Nhập Kho Khách Hàng', 35, '/customer-storage/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (55, 'Báo cáo Công nợ Nhà vàng', 56, '/customer-debt/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (56, 'Báo cáo Bạn hàng', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (57, 'Báo cáo hàng ngày Nhà vàng', 56, '/customer-daily/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (58, 'Báo cáo công nợ Quê', 56, '/home-debt/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (59, 'Báo cáo hàng ngày Quê', 56, '/home-daily/index', NULL, NULL, '', NULL);
INSERT INTO `menu` VALUES (60, 'Tiền chuyển Khác', 38, '/other-home-transfer/index', NULL, NULL, '', NULL);

-- ----------------------------
-- Table structure for original_storage
-- ----------------------------
DROP TABLE IF EXISTS `original_storage`;
CREATE TABLE `original_storage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency_id` bigint(20) NULL DEFAULT NULL,
  `quantity` float(10, 2) NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_updated` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of original_storage
-- ----------------------------
INSERT INTO `original_storage` VALUES (2, 12, 100000000.00, 0, 'VND', 1);
INSERT INTO `original_storage` VALUES (3, 13, 0.00, 0, 'USD', 0);
INSERT INTO `original_storage` VALUES (4, 14, 0.00, 0, 'CAD', 0);
INSERT INTO `original_storage` VALUES (5, 20, 0.00, 0, 'Tệ', 0);
INSERT INTO `original_storage` VALUES (6, 21, 0.00, 0, 'Yên', 0);
INSERT INTO `original_storage` VALUES (7, 22, 0.00, 0, 'Úc', 0);
INSERT INTO `original_storage` VALUES (8, 23, 0.00, 0, 'Won', 0);
INSERT INTO `original_storage` VALUES (9, 24, 0.00, 0, 'Kíp Lào', 0);
INSERT INTO `original_storage` VALUES (10, 25, 0.00, 0, 'SJC', 0);
INSERT INTO `original_storage` VALUES (11, 26, 0.00, 0, '9999', 0);
INSERT INTO `original_storage` VALUES (12, 27, 0.00, 0, 'Đài', 0);
INSERT INTO `original_storage` VALUES (13, 28, 0.00, 0, 'Bạt', 0);
INSERT INTO `original_storage` VALUES (14, 29, 0.00, 0, 'Malai', 0);
INSERT INTO `original_storage` VALUES (15, 30, 0.00, 0, 'Ấn Độ', 0);
INSERT INTO `original_storage` VALUES (16, 31, 0.00, 0, 'Newzeland', 0);
INSERT INTO `original_storage` VALUES (17, 32, 0.00, 0, 'Thụy Sĩ', 0);
INSERT INTO `original_storage` VALUES (18, 33, 0.00, 0, 'Euro', 0);
INSERT INTO `original_storage` VALUES (19, 34, 1000000.00, 0, 'Bảng Anh', 1);
INSERT INTO `original_storage` VALUES (20, 35, 100000.00, 0, 'Rúp Nga', 1);
INSERT INTO `original_storage` VALUES (21, 36, 0.00, 0, 'Hồng Kong', 0);
INSERT INTO `original_storage` VALUES (22, 37, 0.00, 0, 'Indo', 0);
INSERT INTO `original_storage` VALUES (23, 38, 0.00, 0, 'Philipines', 0);

-- ----------------------------
-- Table structure for reference_bill
-- ----------------------------
DROP TABLE IF EXISTS `reference_bill`;
CREATE TABLE `reference_bill`  (
  `main_bill` bigint(20) NOT NULL,
  `reference_bill` bigint(20) NOT NULL,
  PRIMARY KEY (`main_bill`, `reference_bill`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reference_bill
-- ----------------------------
INSERT INTO `reference_bill` VALUES (7, 6);
INSERT INTO `reference_bill` VALUES (28, 7);

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` int(255) NULL DEFAULT NULL,
  `currency_id` bigint(20) NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `storage_currency_idx`(`currency_id`) USING BTREE,
  CONSTRAINT `storage_currency_idx` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO `storage` VALUES (53, NULL, 100000, 35, '2018-10-25 20:23:48', 0);
INSERT INTO `storage` VALUES (54, NULL, 1000000, 34, '2018-10-25 20:25:05', 0);
INSERT INTO `storage` VALUES (55, NULL, 100000000, 12, '2018-10-25 20:25:53', 0);

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bill_id` bigint(20) NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL COMMENT '1. Mua 2. Ban 3. Nhan tien chuyen, 4. Tra tien chuyen, 5. Vay, 6. Cho vay, 7. Tra ngoai te, 8. Lay ngoai te, 9.Tra VND, 10. Lay VND',
  `currency_id` bigint(20) NULL DEFAULT NULL,
  `quantity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` double(20, 2) NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `receiver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fee` double(10, 2) NULL DEFAULT 0.00,
  `deposit` double(10, 2) NULL DEFAULT NULL,
  `exchange_rate` double(10, 2) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_value` double(20, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transaction_currency_idx`(`currency_id`) USING BTREE,
  INDEX `transaction_bill`(`bill_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of transaction
-- ----------------------------
INSERT INTO `transaction` VALUES (1, 1, 5, 12, '35000000', NULL, '2018-10-23 23:20:09', NULL, 0.00, NULL, NULL, NULL, NULL);
INSERT INTO `transaction` VALUES (2, 2, 5, 12, '2500000', NULL, '2018-10-24 00:16:38', NULL, 0.00, NULL, NULL, NULL, NULL);
INSERT INTO `transaction` VALUES (3, 3, 6, 12, '75000000', NULL, '2018-10-24 00:17:14', NULL, 0.00, NULL, NULL, NULL, NULL);
INSERT INTO `transaction` VALUES (4, 4, 6, 12, '15000000', NULL, '2018-10-24 00:24:05', NULL, 0.00, NULL, NULL, NULL, NULL);
INSERT INTO `transaction` VALUES (5, 5, 6, 12, '30000000', NULL, '2018-10-24 00:29:22', NULL, 0.00, NULL, NULL, NULL, NULL);
INSERT INTO `transaction` VALUES (6, 6, 3, 13, '1500', NULL, '2018-10-24 21:42:20', NULL, 1500.00, NULL, NULL, '', NULL);
INSERT INTO `transaction` VALUES (7, 6, 4, 12, '1500000', NULL, '2018-10-24 21:42:20', NULL, 0.00, NULL, NULL, '', NULL);
INSERT INTO `transaction` VALUES (8, 7, 10, 12, '1500000', 1500000.00, '2018-10-24 22:52:39', NULL, 0.00, NULL, 1.00, '', NULL);
INSERT INTO `transaction` VALUES (9, 8, 1, 13, '1500', -35250000.00, '2018-10-24 23:16:37', NULL, 0.00, NULL, 23500.00, '', NULL);
INSERT INTO `transaction` VALUES (10, 9, 2, 12, '75000000', 75000000.00, '2018-10-24 23:17:06', NULL, 0.00, NULL, 1.00, '', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `is_first_login` int(1) NULL DEFAULT NULL,
  `last_time_login` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'GVlxMbXE3GiOGQv7E1dWOMNO0pYzgiMf', '$2y$13$KfHZzpI6zbmajOTvcmd5p.U/r3GbBOTl0vbHPTbAFCOzI3NzFXTK.', 'fanebVvAhIvTcuRh3paFt-facoSsPiLS_1513091892', 'admin@gmail.com', 1, 1467446155, 1513091892, 0, '2017-12-12 22:18:11.000000');
INSERT INTO `user` VALUES (2, 'John', 'K8lrOS1dccJDuEmC4uPN44RRnwN3SNr5', '$2y$13$m6f8EI4szq56sj2NP8c/6.nLHe2rFXBJiK0.SjzcDEZK2pNT3yGTi', '6xPLHGZfZEPUcORiy9OdI3lF0L0LOxcz_1533658699', 'john@doe.com', 1, 1533657074, 1533658699, 0, '2018-08-07 23:18:18.000000');
INSERT INTO `user` VALUES (3, 'May', 'xuL5_UblgJC9SCPqWhFoCP7UPzJH_LC-', '$2y$13$rctTWtdNzozGOV250vH3/e6fpRTzEeTvHuUrE9MP3pzztR21r8eda', 'bxPiBMi4L0Zg_a39WF7y-Ecj38qtVm58_1533657268', 'may@doe.com', 1, 1533657111, 1533657268, 0, '2018-08-07 22:54:27.000000');

-- ----------------------------
-- Table structure for user_locked
-- ----------------------------
DROP TABLE IF EXISTS `user_locked`;
CREATE TABLE `user_locked`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_login_failed
-- ----------------------------
DROP TABLE IF EXISTS `user_login_failed`;
CREATE TABLE `user_login_failed`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- View structure for view_debt
-- ----------------------------
DROP VIEW IF EXISTS `view_debt`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_debt` AS select id,currency_id, customer_id, value, DATE_FORMAT(date,'%Y-%m-%d') as date
 from debt 
order by date desc ;

-- ----------------------------
-- View structure for view_tonkho
-- ----------------------------
DROP VIEW IF EXISTS `view_tonkho`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_tonkho` AS select id,currency_id, quantity, DATE_FORMAT(date,'%Y-%m-%d') as date
 from storage 
order by date desc ;

SET FOREIGN_KEY_CHECKS = 1;
