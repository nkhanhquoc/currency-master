/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100136
 Source Host           : localhost:3306
 Source Schema         : currencymanager

 Target Server Type    : MySQL
 Target Server Version : 100136
 File Encoding         : 65001

 Date: 22/10/2018 00:05:32
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
INSERT INTO `currency` VALUES (12, 'VND', 'VND', NULL, 1, 0);
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
) ENGINE = InnoDB AUTO_INCREMENT = 1428 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of debt
-- ----------------------------
INSERT INTO `debt` VALUES (36, 12, 8, 0.00, '2018-10-18 23:45:19');
INSERT INTO `debt` VALUES (37, 13, 8, 0.00, '2018-10-18 23:45:19');
INSERT INTO `debt` VALUES (38, 14, 8, 0.00, '2018-10-18 23:45:19');
INSERT INTO `debt` VALUES (39, 12, 9, 0.00, '2018-10-18 23:47:08');
INSERT INTO `debt` VALUES (40, 13, 9, 0.00, '2018-10-18 23:47:08');
INSERT INTO `debt` VALUES (41, 14, 9, 0.00, '2018-10-18 23:47:08');
INSERT INTO `debt` VALUES (42, 12, 10, 0.00, '2018-10-18 23:47:21');
INSERT INTO `debt` VALUES (43, 13, 10, 0.00, '2018-10-18 23:47:21');
INSERT INTO `debt` VALUES (44, 14, 10, 0.00, '2018-10-18 23:47:21');
INSERT INTO `debt` VALUES (45, 12, 11, 0.00, '2018-10-18 23:47:46');
INSERT INTO `debt` VALUES (46, 13, 11, 0.00, '2018-10-18 23:47:46');
INSERT INTO `debt` VALUES (47, 14, 11, 0.00, '2018-10-18 23:47:46');
INSERT INTO `debt` VALUES (48, 12, 12, 0.00, '2018-10-18 23:48:01');
INSERT INTO `debt` VALUES (49, 13, 12, 0.00, '2018-10-18 23:48:01');
INSERT INTO `debt` VALUES (50, 14, 12, 0.00, '2018-10-18 23:48:01');
INSERT INTO `debt` VALUES (51, 20, 8, 0.00, '2018-10-19 14:17:25');
INSERT INTO `debt` VALUES (52, 20, 9, 0.00, '2018-10-19 14:17:25');
INSERT INTO `debt` VALUES (53, 20, 10, 0.00, '2018-10-19 14:17:25');
INSERT INTO `debt` VALUES (54, 20, 11, 0.00, '2018-10-19 14:17:25');
INSERT INTO `debt` VALUES (55, 20, 12, 0.00, '2018-10-19 14:17:25');
INSERT INTO `debt` VALUES (56, 21, 8, 0.00, '2018-10-19 14:17:37');
INSERT INTO `debt` VALUES (57, 21, 9, 0.00, '2018-10-19 14:17:37');
INSERT INTO `debt` VALUES (58, 21, 10, 0.00, '2018-10-19 14:17:37');
INSERT INTO `debt` VALUES (59, 21, 11, 0.00, '2018-10-19 14:17:37');
INSERT INTO `debt` VALUES (60, 21, 12, 0.00, '2018-10-19 14:17:37');
INSERT INTO `debt` VALUES (61, 22, 8, 0.00, '2018-10-19 14:17:47');
INSERT INTO `debt` VALUES (62, 22, 9, 0.00, '2018-10-19 14:17:47');
INSERT INTO `debt` VALUES (63, 22, 10, 0.00, '2018-10-19 14:17:47');
INSERT INTO `debt` VALUES (64, 22, 11, 0.00, '2018-10-19 14:17:47');
INSERT INTO `debt` VALUES (65, 22, 12, 0.00, '2018-10-19 14:17:47');
INSERT INTO `debt` VALUES (66, 23, 8, 0.00, '2018-10-19 14:17:59');
INSERT INTO `debt` VALUES (67, 23, 9, 0.00, '2018-10-19 14:17:59');
INSERT INTO `debt` VALUES (68, 23, 10, 0.00, '2018-10-19 14:17:59');
INSERT INTO `debt` VALUES (69, 23, 11, 0.00, '2018-10-19 14:17:59');
INSERT INTO `debt` VALUES (70, 23, 12, 0.00, '2018-10-19 14:17:59');
INSERT INTO `debt` VALUES (71, 24, 8, 0.00, '2018-10-19 14:18:14');
INSERT INTO `debt` VALUES (72, 24, 9, 0.00, '2018-10-19 14:18:14');
INSERT INTO `debt` VALUES (73, 24, 10, 0.00, '2018-10-19 14:18:14');
INSERT INTO `debt` VALUES (74, 24, 11, 0.00, '2018-10-19 14:18:14');
INSERT INTO `debt` VALUES (75, 24, 12, 0.00, '2018-10-19 14:18:14');
INSERT INTO `debt` VALUES (76, 25, 8, 0.00, '2018-10-19 14:18:22');
INSERT INTO `debt` VALUES (77, 25, 9, 0.00, '2018-10-19 14:18:22');
INSERT INTO `debt` VALUES (78, 25, 10, 0.00, '2018-10-19 14:18:22');
INSERT INTO `debt` VALUES (79, 25, 11, 0.00, '2018-10-19 14:18:22');
INSERT INTO `debt` VALUES (80, 25, 12, 0.00, '2018-10-19 14:18:22');
INSERT INTO `debt` VALUES (81, 26, 8, 0.00, '2018-10-19 14:18:32');
INSERT INTO `debt` VALUES (82, 26, 9, 0.00, '2018-10-19 14:18:32');
INSERT INTO `debt` VALUES (83, 26, 10, 0.00, '2018-10-19 14:18:32');
INSERT INTO `debt` VALUES (84, 26, 11, 0.00, '2018-10-19 14:18:32');
INSERT INTO `debt` VALUES (85, 26, 12, 0.00, '2018-10-19 14:18:32');
INSERT INTO `debt` VALUES (86, 27, 8, 0.00, '2018-10-19 14:20:18');
INSERT INTO `debt` VALUES (87, 27, 9, 0.00, '2018-10-19 14:20:18');
INSERT INTO `debt` VALUES (88, 27, 10, 0.00, '2018-10-19 14:20:18');
INSERT INTO `debt` VALUES (89, 27, 11, 0.00, '2018-10-19 14:20:18');
INSERT INTO `debt` VALUES (90, 27, 12, 0.00, '2018-10-19 14:20:18');
INSERT INTO `debt` VALUES (91, 28, 8, 0.00, '2018-10-19 14:20:32');
INSERT INTO `debt` VALUES (92, 28, 9, 0.00, '2018-10-19 14:20:32');
INSERT INTO `debt` VALUES (93, 28, 10, 0.00, '2018-10-19 14:20:32');
INSERT INTO `debt` VALUES (94, 28, 11, 0.00, '2018-10-19 14:20:32');
INSERT INTO `debt` VALUES (95, 28, 12, 0.00, '2018-10-19 14:20:32');
INSERT INTO `debt` VALUES (96, 29, 8, 0.00, '2018-10-19 14:20:55');
INSERT INTO `debt` VALUES (97, 29, 9, 0.00, '2018-10-19 14:20:55');
INSERT INTO `debt` VALUES (98, 29, 10, 0.00, '2018-10-19 14:20:55');
INSERT INTO `debt` VALUES (99, 29, 11, 0.00, '2018-10-19 14:20:55');
INSERT INTO `debt` VALUES (100, 29, 12, 0.00, '2018-10-19 14:20:55');
INSERT INTO `debt` VALUES (101, 30, 8, 0.00, '2018-10-19 14:21:17');
INSERT INTO `debt` VALUES (102, 30, 9, 0.00, '2018-10-19 14:21:17');
INSERT INTO `debt` VALUES (103, 30, 10, 0.00, '2018-10-19 14:21:17');
INSERT INTO `debt` VALUES (104, 30, 11, 0.00, '2018-10-19 14:21:17');
INSERT INTO `debt` VALUES (105, 30, 12, 0.00, '2018-10-19 14:21:17');
INSERT INTO `debt` VALUES (106, 31, 8, 0.00, '2018-10-19 14:21:46');
INSERT INTO `debt` VALUES (107, 31, 9, 0.00, '2018-10-19 14:21:46');
INSERT INTO `debt` VALUES (108, 31, 10, 0.00, '2018-10-19 14:21:46');
INSERT INTO `debt` VALUES (109, 31, 11, 0.00, '2018-10-19 14:21:46');
INSERT INTO `debt` VALUES (110, 31, 12, 0.00, '2018-10-19 14:21:46');
INSERT INTO `debt` VALUES (111, 32, 8, 0.00, '2018-10-19 14:22:05');
INSERT INTO `debt` VALUES (112, 32, 9, 0.00, '2018-10-19 14:22:05');
INSERT INTO `debt` VALUES (113, 32, 10, 0.00, '2018-10-19 14:22:05');
INSERT INTO `debt` VALUES (114, 32, 11, 0.00, '2018-10-19 14:22:05');
INSERT INTO `debt` VALUES (115, 32, 12, 0.00, '2018-10-19 14:22:05');
INSERT INTO `debt` VALUES (116, 33, 8, 0.00, '2018-10-19 14:22:57');
INSERT INTO `debt` VALUES (117, 33, 9, 0.00, '2018-10-19 14:22:57');
INSERT INTO `debt` VALUES (118, 33, 10, 0.00, '2018-10-19 14:22:57');
INSERT INTO `debt` VALUES (119, 33, 11, 0.00, '2018-10-19 14:22:57');
INSERT INTO `debt` VALUES (120, 33, 12, 0.00, '2018-10-19 14:22:57');
INSERT INTO `debt` VALUES (121, 34, 8, 0.00, '2018-10-19 14:24:19');
INSERT INTO `debt` VALUES (122, 34, 9, 0.00, '2018-10-19 14:24:19');
INSERT INTO `debt` VALUES (123, 34, 10, 0.00, '2018-10-19 14:24:19');
INSERT INTO `debt` VALUES (124, 34, 11, 0.00, '2018-10-19 14:24:19');
INSERT INTO `debt` VALUES (125, 34, 12, 0.00, '2018-10-19 14:24:19');
INSERT INTO `debt` VALUES (126, 35, 8, 0.00, '2018-10-19 14:25:53');
INSERT INTO `debt` VALUES (127, 35, 9, 0.00, '2018-10-19 14:25:53');
INSERT INTO `debt` VALUES (128, 35, 10, 0.00, '2018-10-19 14:25:53');
INSERT INTO `debt` VALUES (129, 35, 11, 0.00, '2018-10-19 14:25:53');
INSERT INTO `debt` VALUES (130, 35, 12, 0.00, '2018-10-19 14:25:53');
INSERT INTO `debt` VALUES (131, 12, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (132, 13, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (133, 14, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (134, 15, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (135, 16, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (136, 17, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (137, 18, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (138, 19, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (139, 20, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (140, 21, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (141, 22, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (142, 23, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (143, 24, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (144, 25, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (145, 26, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (146, 27, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (147, 28, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (148, 29, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (149, 30, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (150, 31, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (151, 32, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (152, 33, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (153, 34, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (154, 35, 13, 0.00, '2018-10-19 14:28:22');
INSERT INTO `debt` VALUES (155, 12, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (156, 13, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (157, 14, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (158, 15, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (159, 16, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (160, 17, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (161, 18, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (162, 19, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (163, 20, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (164, 21, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (165, 22, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (166, 23, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (167, 24, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (168, 25, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (169, 26, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (170, 27, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (171, 28, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (172, 29, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (173, 30, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (174, 31, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (175, 32, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (176, 33, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (177, 34, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (178, 35, 14, 0.00, '2018-10-19 14:28:41');
INSERT INTO `debt` VALUES (179, 12, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (180, 13, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (181, 14, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (182, 15, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (183, 16, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (184, 17, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (185, 18, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (186, 19, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (187, 20, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (188, 21, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (189, 22, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (190, 23, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (191, 24, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (192, 25, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (193, 26, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (194, 27, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (195, 28, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (196, 29, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (197, 30, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (198, 31, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (199, 32, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (200, 33, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (201, 34, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (202, 35, 15, 0.00, '2018-10-19 14:29:15');
INSERT INTO `debt` VALUES (203, 12, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (204, 13, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (205, 14, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (206, 15, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (207, 16, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (208, 17, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (209, 18, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (210, 19, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (211, 20, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (212, 21, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (213, 22, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (214, 23, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (215, 24, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (216, 25, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (217, 26, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (218, 27, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (219, 28, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (220, 29, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (221, 30, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (222, 31, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (223, 32, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (224, 33, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (225, 34, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (226, 35, 16, 0.00, '2018-10-19 14:29:36');
INSERT INTO `debt` VALUES (227, 12, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (228, 13, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (229, 14, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (230, 15, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (231, 16, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (232, 17, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (233, 18, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (234, 19, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (235, 20, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (236, 21, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (237, 22, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (238, 23, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (239, 24, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (240, 25, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (241, 26, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (242, 27, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (243, 28, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (244, 29, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (245, 30, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (246, 31, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (247, 32, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (248, 33, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (249, 34, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (250, 35, 17, 0.00, '2018-10-19 14:29:48');
INSERT INTO `debt` VALUES (251, 12, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (252, 13, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (253, 14, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (254, 15, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (255, 16, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (256, 17, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (257, 18, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (258, 19, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (259, 20, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (260, 21, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (261, 22, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (262, 23, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (263, 24, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (264, 25, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (265, 26, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (266, 27, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (267, 28, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (268, 29, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (269, 30, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (270, 31, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (271, 32, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (272, 33, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (273, 34, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (274, 35, 18, 0.00, '2018-10-19 14:30:00');
INSERT INTO `debt` VALUES (275, 12, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (276, 13, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (277, 14, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (278, 15, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (279, 16, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (280, 17, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (281, 18, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (282, 19, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (283, 20, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (284, 21, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (285, 22, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (286, 23, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (287, 24, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (288, 25, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (289, 26, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (290, 27, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (291, 28, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (292, 29, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (293, 30, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (294, 31, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (295, 32, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (296, 33, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (297, 34, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (298, 35, 19, 0.00, '2018-10-19 14:30:08');
INSERT INTO `debt` VALUES (299, 12, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (300, 13, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (301, 14, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (302, 15, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (303, 16, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (304, 17, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (305, 18, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (306, 19, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (307, 20, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (308, 21, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (309, 22, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (310, 23, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (311, 24, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (312, 25, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (313, 26, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (314, 27, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (315, 28, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (316, 29, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (317, 30, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (318, 31, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (319, 32, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (320, 33, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (321, 34, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (322, 35, 20, 0.00, '2018-10-19 14:30:41');
INSERT INTO `debt` VALUES (323, 12, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (324, 13, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (325, 14, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (326, 15, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (327, 16, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (328, 17, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (329, 18, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (330, 19, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (331, 20, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (332, 21, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (333, 22, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (334, 23, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (335, 24, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (336, 25, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (337, 26, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (338, 27, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (339, 28, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (340, 29, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (341, 30, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (342, 31, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (343, 32, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (344, 33, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (345, 34, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (346, 35, 21, 0.00, '2018-10-19 14:30:54');
INSERT INTO `debt` VALUES (347, 12, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (348, 13, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (349, 14, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (350, 15, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (351, 16, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (352, 17, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (353, 18, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (354, 19, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (355, 20, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (356, 21, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (357, 22, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (358, 23, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (359, 24, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (360, 25, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (361, 26, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (362, 27, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (363, 28, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (364, 29, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (365, 30, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (366, 31, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (367, 32, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (368, 33, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (369, 34, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (370, 35, 22, 0.00, '2018-10-19 14:31:58');
INSERT INTO `debt` VALUES (371, 12, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (372, 13, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (373, 14, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (374, 15, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (375, 16, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (376, 17, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (377, 18, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (378, 19, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (379, 20, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (380, 21, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (381, 22, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (382, 23, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (383, 24, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (384, 25, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (385, 26, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (386, 27, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (387, 28, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (388, 29, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (389, 30, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (390, 31, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (391, 32, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (392, 33, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (393, 34, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (394, 35, 23, 0.00, '2018-10-19 14:32:09');
INSERT INTO `debt` VALUES (395, 12, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (396, 13, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (397, 14, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (398, 15, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (399, 16, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (400, 17, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (401, 18, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (402, 19, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (403, 20, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (404, 21, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (405, 22, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (406, 23, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (407, 24, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (408, 25, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (409, 26, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (410, 27, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (411, 28, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (412, 29, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (413, 30, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (414, 31, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (415, 32, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (416, 33, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (417, 34, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (418, 35, 24, 0.00, '2018-10-19 14:32:25');
INSERT INTO `debt` VALUES (419, 12, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (420, 13, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (421, 14, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (422, 15, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (423, 16, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (424, 17, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (425, 18, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (426, 19, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (427, 20, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (428, 21, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (429, 22, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (430, 23, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (431, 24, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (432, 25, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (433, 26, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (434, 27, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (435, 28, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (436, 29, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (437, 30, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (438, 31, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (439, 32, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (440, 33, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (441, 34, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (442, 35, 25, 0.00, '2018-10-19 14:32:39');
INSERT INTO `debt` VALUES (443, 12, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (444, 13, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (445, 14, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (446, 15, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (447, 16, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (448, 17, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (449, 18, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (450, 19, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (451, 20, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (452, 21, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (453, 22, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (454, 23, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (455, 24, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (456, 25, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (457, 26, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (458, 27, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (459, 28, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (460, 29, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (461, 30, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (462, 31, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (463, 32, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (464, 33, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (465, 34, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (466, 35, 26, 0.00, '2018-10-19 14:32:58');
INSERT INTO `debt` VALUES (467, 12, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (468, 13, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (469, 14, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (470, 15, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (471, 16, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (472, 17, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (473, 18, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (474, 19, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (475, 20, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (476, 21, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (477, 22, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (478, 23, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (479, 24, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (480, 25, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (481, 26, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (482, 27, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (483, 28, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (484, 29, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (485, 30, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (486, 31, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (487, 32, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (488, 33, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (489, 34, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (490, 35, 27, 0.00, '2018-10-19 14:33:25');
INSERT INTO `debt` VALUES (491, 12, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (492, 13, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (493, 14, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (494, 15, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (495, 16, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (496, 17, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (497, 18, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (498, 19, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (499, 20, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (500, 21, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (501, 22, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (502, 23, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (503, 24, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (504, 25, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (505, 26, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (506, 27, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (507, 28, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (508, 29, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (509, 30, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (510, 31, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (511, 32, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (512, 33, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (513, 34, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (514, 35, 28, 0.00, '2018-10-19 14:33:39');
INSERT INTO `debt` VALUES (515, 12, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (516, 13, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (517, 14, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (518, 15, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (519, 16, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (520, 17, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (521, 18, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (522, 19, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (523, 20, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (524, 21, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (525, 22, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (526, 23, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (527, 24, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (528, 25, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (529, 26, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (530, 27, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (531, 28, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (532, 29, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (533, 30, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (534, 31, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (535, 32, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (536, 33, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (537, 34, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (538, 35, 29, 0.00, '2018-10-19 14:33:53');
INSERT INTO `debt` VALUES (539, 12, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (540, 13, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (541, 14, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (542, 15, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (543, 16, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (544, 17, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (545, 18, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (546, 19, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (547, 20, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (548, 21, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (549, 22, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (550, 23, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (551, 24, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (552, 25, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (553, 26, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (554, 27, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (555, 28, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (556, 29, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (557, 30, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (558, 31, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (559, 32, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (560, 33, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (561, 34, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (562, 35, 30, 0.00, '2018-10-19 14:34:15');
INSERT INTO `debt` VALUES (563, 12, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (564, 13, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (565, 14, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (566, 15, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (567, 16, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (568, 17, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (569, 18, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (570, 19, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (571, 20, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (572, 21, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (573, 22, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (574, 23, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (575, 24, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (576, 25, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (577, 26, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (578, 27, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (579, 28, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (580, 29, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (581, 30, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (582, 31, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (583, 32, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (584, 33, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (585, 34, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (586, 35, 31, 0.00, '2018-10-19 14:34:27');
INSERT INTO `debt` VALUES (587, 12, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (588, 13, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (589, 14, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (590, 15, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (591, 16, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (592, 17, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (593, 18, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (594, 19, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (595, 20, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (596, 21, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (597, 22, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (598, 23, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (599, 24, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (600, 25, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (601, 26, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (602, 27, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (603, 28, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (604, 29, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (605, 30, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (606, 31, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (607, 32, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (608, 33, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (609, 34, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (610, 35, 32, 0.00, '2018-10-19 14:34:48');
INSERT INTO `debt` VALUES (611, 12, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (612, 13, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (613, 14, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (614, 15, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (615, 16, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (616, 17, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (617, 18, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (618, 19, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (619, 20, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (620, 21, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (621, 22, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (622, 23, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (623, 24, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (624, 25, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (625, 26, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (626, 27, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (627, 28, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (628, 29, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (629, 30, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (630, 31, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (631, 32, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (632, 33, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (633, 34, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (634, 35, 33, 0.00, '2018-10-19 14:34:59');
INSERT INTO `debt` VALUES (635, 12, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (636, 13, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (637, 14, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (638, 15, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (639, 16, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (640, 17, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (641, 18, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (642, 19, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (643, 20, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (644, 21, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (645, 22, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (646, 23, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (647, 24, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (648, 25, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (649, 26, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (650, 27, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (651, 28, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (652, 29, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (653, 30, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (654, 31, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (655, 32, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (656, 33, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (657, 34, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (658, 35, 34, 0.00, '2018-10-19 14:35:09');
INSERT INTO `debt` VALUES (659, 12, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (660, 13, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (661, 14, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (662, 15, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (663, 16, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (664, 17, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (665, 18, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (666, 19, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (667, 20, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (668, 21, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (669, 22, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (670, 23, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (671, 24, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (672, 25, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (673, 26, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (674, 27, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (675, 28, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (676, 29, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (677, 30, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (678, 31, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (679, 32, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (680, 33, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (681, 34, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (682, 35, 35, 0.00, '2018-10-19 14:35:50');
INSERT INTO `debt` VALUES (683, 12, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (684, 13, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (685, 14, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (686, 15, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (687, 16, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (688, 17, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (689, 18, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (690, 19, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (691, 20, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (692, 21, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (693, 22, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (694, 23, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (695, 24, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (696, 25, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (697, 26, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (698, 27, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (699, 28, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (700, 29, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (701, 30, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (702, 31, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (703, 32, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (704, 33, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (705, 34, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (706, 35, 36, 0.00, '2018-10-19 14:36:07');
INSERT INTO `debt` VALUES (707, 12, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (708, 13, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (709, 14, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (710, 15, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (711, 16, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (712, 17, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (713, 18, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (714, 19, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (715, 20, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (716, 21, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (717, 22, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (718, 23, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (719, 24, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (720, 25, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (721, 26, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (722, 27, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (723, 28, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (724, 29, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (725, 30, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (726, 31, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (727, 32, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (728, 33, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (729, 34, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (730, 35, 37, 0.00, '2018-10-19 14:36:21');
INSERT INTO `debt` VALUES (731, 12, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (732, 13, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (733, 14, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (734, 15, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (735, 16, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (736, 17, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (737, 18, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (738, 19, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (739, 20, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (740, 21, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (741, 22, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (742, 23, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (743, 24, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (744, 25, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (745, 26, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (746, 27, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (747, 28, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (748, 29, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (749, 30, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (750, 31, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (751, 32, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (752, 33, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (753, 34, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (754, 35, 38, 0.00, '2018-10-19 14:37:04');
INSERT INTO `debt` VALUES (755, 12, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (756, 13, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (757, 14, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (758, 15, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (759, 16, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (760, 17, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (761, 18, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (762, 19, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (763, 20, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (764, 21, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (765, 22, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (766, 23, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (767, 24, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (768, 25, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (769, 26, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (770, 27, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (771, 28, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (772, 29, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (773, 30, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (774, 31, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (775, 32, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (776, 33, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (777, 34, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (778, 35, 39, 0.00, '2018-10-19 14:37:38');
INSERT INTO `debt` VALUES (779, 12, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (780, 13, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (781, 14, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (782, 15, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (783, 16, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (784, 17, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (785, 18, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (786, 19, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (787, 20, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (788, 21, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (789, 22, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (790, 23, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (791, 24, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (792, 25, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (793, 26, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (794, 27, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (795, 28, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (796, 29, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (797, 30, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (798, 31, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (799, 32, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (800, 33, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (801, 34, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (802, 35, 40, 0.00, '2018-10-19 14:38:06');
INSERT INTO `debt` VALUES (803, 12, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (804, 13, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (805, 14, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (806, 15, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (807, 16, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (808, 17, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (809, 18, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (810, 19, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (811, 20, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (812, 21, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (813, 22, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (814, 23, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (815, 24, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (816, 25, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (817, 26, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (818, 27, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (819, 28, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (820, 29, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (821, 30, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (822, 31, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (823, 32, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (824, 33, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (825, 34, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (826, 35, 41, 0.00, '2018-10-19 14:38:25');
INSERT INTO `debt` VALUES (827, 12, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (828, 13, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (829, 14, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (830, 15, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (831, 16, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (832, 17, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (833, 18, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (834, 19, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (835, 20, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (836, 21, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (837, 22, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (838, 23, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (839, 24, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (840, 25, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (841, 26, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (842, 27, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (843, 28, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (844, 29, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (845, 30, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (846, 31, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (847, 32, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (848, 33, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (849, 34, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (850, 35, 42, 0.00, '2018-10-19 14:38:54');
INSERT INTO `debt` VALUES (851, 12, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (852, 13, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (853, 14, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (854, 15, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (855, 16, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (856, 17, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (857, 18, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (858, 19, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (859, 20, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (860, 21, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (861, 22, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (862, 23, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (863, 24, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (864, 25, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (865, 26, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (866, 27, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (867, 28, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (868, 29, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (869, 30, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (870, 31, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (871, 32, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (872, 33, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (873, 34, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (874, 35, 43, 0.00, '2018-10-19 14:39:11');
INSERT INTO `debt` VALUES (875, 12, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (876, 13, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (877, 14, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (878, 15, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (879, 16, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (880, 17, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (881, 18, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (882, 19, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (883, 20, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (884, 21, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (885, 22, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (886, 23, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (887, 24, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (888, 25, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (889, 26, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (890, 27, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (891, 28, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (892, 29, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (893, 30, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (894, 31, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (895, 32, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (896, 33, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (897, 34, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (898, 35, 44, 0.00, '2018-10-19 14:39:22');
INSERT INTO `debt` VALUES (899, 12, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (900, 13, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (901, 14, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (902, 15, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (903, 16, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (904, 17, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (905, 18, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (906, 19, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (907, 20, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (908, 21, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (909, 22, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (910, 23, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (911, 24, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (912, 25, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (913, 26, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (914, 27, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (915, 28, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (916, 29, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (917, 30, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (918, 31, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (919, 32, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (920, 33, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (921, 34, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (922, 35, 45, 0.00, '2018-10-19 14:41:54');
INSERT INTO `debt` VALUES (923, 12, 46, 0.00, '2018-10-19 14:42:08');
INSERT INTO `debt` VALUES (924, 13, 46, 0.00, '2018-10-19 14:42:08');
INSERT INTO `debt` VALUES (925, 14, 46, 0.00, '2018-10-19 14:42:08');
INSERT INTO `debt` VALUES (926, 15, 46, 0.00, '2018-10-19 14:42:08');
INSERT INTO `debt` VALUES (927, 16, 46, 0.00, '2018-10-19 14:42:08');
INSERT INTO `debt` VALUES (928, 17, 46, 0.00, '2018-10-19 14:42:08');
INSERT INTO `debt` VALUES (929, 18, 46, 0.00, '2018-10-19 14:42:08');
INSERT INTO `debt` VALUES (930, 19, 46, 0.00, '2018-10-19 14:42:08');
INSERT INTO `debt` VALUES (931, 20, 46, 0.00, '2018-10-19 14:42:08');
INSERT INTO `debt` VALUES (932, 21, 46, 0.00, '2018-10-19 14:42:08');
INSERT INTO `debt` VALUES (933, 22, 46, 0.00, '2018-10-19 14:42:08');
INSERT INTO `debt` VALUES (934, 23, 46, 0.00, '2018-10-19 14:42:08');
INSERT INTO `debt` VALUES (935, 24, 46, 0.00, '2018-10-19 14:42:08');
INSERT INTO `debt` VALUES (936, 25, 46, 0.00, '2018-10-19 14:42:09');
INSERT INTO `debt` VALUES (937, 26, 46, 0.00, '2018-10-19 14:42:09');
INSERT INTO `debt` VALUES (938, 27, 46, 0.00, '2018-10-19 14:42:09');
INSERT INTO `debt` VALUES (939, 28, 46, 0.00, '2018-10-19 14:42:09');
INSERT INTO `debt` VALUES (940, 29, 46, 0.00, '2018-10-19 14:42:09');
INSERT INTO `debt` VALUES (941, 30, 46, 0.00, '2018-10-19 14:42:09');
INSERT INTO `debt` VALUES (942, 31, 46, 0.00, '2018-10-19 14:42:09');
INSERT INTO `debt` VALUES (943, 32, 46, 0.00, '2018-10-19 14:42:09');
INSERT INTO `debt` VALUES (944, 33, 46, 0.00, '2018-10-19 14:42:09');
INSERT INTO `debt` VALUES (945, 34, 46, 0.00, '2018-10-19 14:42:09');
INSERT INTO `debt` VALUES (946, 35, 46, 0.00, '2018-10-19 14:42:09');
INSERT INTO `debt` VALUES (947, 12, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (948, 13, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (949, 14, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (950, 15, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (951, 16, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (952, 17, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (953, 18, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (954, 19, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (955, 20, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (956, 21, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (957, 22, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (958, 23, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (959, 24, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (960, 25, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (961, 26, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (962, 27, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (963, 28, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (964, 29, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (965, 30, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (966, 31, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (967, 32, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (968, 33, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (969, 34, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (970, 35, 47, 0.00, '2018-10-19 14:42:32');
INSERT INTO `debt` VALUES (971, 12, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (972, 13, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (973, 14, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (974, 15, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (975, 16, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (976, 17, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (977, 18, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (978, 19, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (979, 20, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (980, 21, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (981, 22, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (982, 23, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (983, 24, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (984, 25, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (985, 26, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (986, 27, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (987, 28, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (988, 29, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (989, 30, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (990, 31, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (991, 32, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (992, 33, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (993, 34, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (994, 35, 48, 0.00, '2018-10-19 14:44:35');
INSERT INTO `debt` VALUES (995, 36, 8, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (996, 36, 9, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (997, 36, 10, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (998, 36, 11, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (999, 36, 12, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1000, 36, 13, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1001, 36, 14, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1002, 36, 15, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1003, 36, 16, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1004, 36, 17, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1005, 36, 18, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1006, 36, 19, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1007, 36, 20, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1008, 36, 21, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1009, 36, 22, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1010, 36, 23, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1011, 36, 24, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1012, 36, 25, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1013, 36, 26, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1014, 36, 27, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1015, 36, 28, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1016, 36, 29, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1017, 36, 30, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1018, 36, 31, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1019, 36, 32, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1020, 36, 33, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1021, 36, 34, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1022, 36, 35, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1023, 36, 36, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1024, 36, 37, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1025, 36, 38, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1026, 36, 39, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1027, 36, 40, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1028, 36, 41, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1029, 36, 42, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1030, 36, 43, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1031, 36, 44, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1032, 36, 45, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1033, 36, 46, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1034, 36, 47, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1035, 36, 48, 0.00, '2018-10-21 23:46:59');
INSERT INTO `debt` VALUES (1036, 37, 8, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1037, 37, 9, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1038, 37, 10, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1039, 37, 11, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1040, 37, 12, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1041, 37, 13, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1042, 37, 14, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1043, 37, 15, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1044, 37, 16, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1045, 37, 17, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1046, 37, 18, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1047, 37, 19, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1048, 37, 20, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1049, 37, 21, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1050, 37, 22, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1051, 37, 23, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1052, 37, 24, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1053, 37, 25, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1054, 37, 26, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1055, 37, 27, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1056, 37, 28, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1057, 37, 29, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1058, 37, 30, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1059, 37, 31, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1060, 37, 32, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1061, 37, 33, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1062, 37, 34, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1063, 37, 35, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1064, 37, 36, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1065, 37, 37, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1066, 37, 38, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1067, 37, 39, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1068, 37, 40, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1069, 37, 41, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1070, 37, 42, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1071, 37, 43, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1072, 37, 44, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1073, 37, 45, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1074, 37, 46, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1075, 37, 47, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1076, 37, 48, 0.00, '2018-10-21 23:47:56');
INSERT INTO `debt` VALUES (1077, 38, 8, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1078, 38, 9, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1079, 38, 10, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1080, 38, 11, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1081, 38, 12, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1082, 38, 13, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1083, 38, 14, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1084, 38, 15, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1085, 38, 16, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1086, 38, 17, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1087, 38, 18, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1088, 38, 19, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1089, 38, 20, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1090, 38, 21, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1091, 38, 22, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1092, 38, 23, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1093, 38, 24, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1094, 38, 25, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1095, 38, 26, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1096, 38, 27, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1097, 38, 28, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1098, 38, 29, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1099, 38, 30, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1100, 38, 31, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1101, 38, 32, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1102, 38, 33, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1103, 38, 34, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1104, 38, 35, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1105, 38, 36, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1106, 38, 37, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1107, 38, 38, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1108, 38, 39, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1109, 38, 40, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1110, 38, 41, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1111, 38, 42, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1112, 38, 43, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1113, 38, 44, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1114, 38, 45, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1115, 38, 46, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1116, 38, 47, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1117, 38, 48, 0.00, '2018-10-21 23:48:19');
INSERT INTO `debt` VALUES (1118, 12, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1119, 13, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1120, 14, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1121, 15, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1122, 16, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1123, 17, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1124, 18, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1125, 19, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1126, 20, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1127, 21, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1128, 22, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1129, 23, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1130, 24, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1131, 25, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1132, 26, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1133, 27, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1134, 28, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1135, 29, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1136, 30, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1137, 31, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1138, 32, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1139, 33, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1140, 34, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1141, 35, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1142, 36, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1143, 37, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1144, 38, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1145, 39, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1146, 40, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1147, 41, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1148, 42, 49, 0.00, '2018-10-21 23:53:37');
INSERT INTO `debt` VALUES (1149, 12, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1150, 13, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1151, 14, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1152, 15, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1153, 16, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1154, 17, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1155, 18, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1156, 19, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1157, 20, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1158, 21, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1159, 22, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1160, 23, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1161, 24, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1162, 25, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1163, 26, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1164, 27, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1165, 28, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1166, 29, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1167, 30, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1168, 31, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1169, 32, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1170, 33, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1171, 34, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1172, 35, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1173, 36, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1174, 37, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1175, 38, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1176, 39, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1177, 40, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1178, 41, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1179, 42, 50, 0.00, '2018-10-21 23:54:49');
INSERT INTO `debt` VALUES (1180, 12, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1181, 13, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1182, 14, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1183, 15, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1184, 16, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1185, 17, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1186, 18, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1187, 19, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1188, 20, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1189, 21, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1190, 22, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1191, 23, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1192, 24, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1193, 25, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1194, 26, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1195, 27, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1196, 28, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1197, 29, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1198, 30, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1199, 31, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1200, 32, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1201, 33, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1202, 34, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1203, 35, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1204, 36, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1205, 37, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1206, 38, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1207, 39, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1208, 40, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1209, 41, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1210, 42, 51, 0.00, '2018-10-21 23:55:08');
INSERT INTO `debt` VALUES (1211, 12, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1212, 13, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1213, 14, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1214, 15, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1215, 16, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1216, 17, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1217, 18, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1218, 19, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1219, 20, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1220, 21, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1221, 22, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1222, 23, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1223, 24, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1224, 25, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1225, 26, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1226, 27, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1227, 28, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1228, 29, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1229, 30, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1230, 31, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1231, 32, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1232, 33, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1233, 34, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1234, 35, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1235, 36, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1236, 37, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1237, 38, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1238, 39, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1239, 40, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1240, 41, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1241, 42, 52, 0.00, '2018-10-21 23:55:23');
INSERT INTO `debt` VALUES (1242, 12, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1243, 13, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1244, 14, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1245, 15, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1246, 16, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1247, 17, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1248, 18, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1249, 19, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1250, 20, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1251, 21, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1252, 22, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1253, 23, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1254, 24, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1255, 25, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1256, 26, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1257, 27, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1258, 28, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1259, 29, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1260, 30, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1261, 31, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1262, 32, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1263, 33, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1264, 34, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1265, 35, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1266, 36, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1267, 37, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1268, 38, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1269, 39, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1270, 40, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1271, 41, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1272, 42, 53, 0.00, '2018-10-22 00:00:20');
INSERT INTO `debt` VALUES (1273, 12, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1274, 13, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1275, 14, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1276, 15, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1277, 16, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1278, 17, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1279, 18, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1280, 19, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1281, 20, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1282, 21, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1283, 22, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1284, 23, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1285, 24, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1286, 25, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1287, 26, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1288, 27, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1289, 28, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1290, 29, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1291, 30, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1292, 31, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1293, 32, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1294, 33, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1295, 34, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1296, 35, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1297, 36, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1298, 37, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1299, 38, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1300, 39, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1301, 40, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1302, 41, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1303, 42, 54, 0.00, '2018-10-22 00:02:46');
INSERT INTO `debt` VALUES (1304, 12, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1305, 13, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1306, 14, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1307, 15, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1308, 16, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1309, 17, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1310, 18, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1311, 19, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1312, 20, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1313, 21, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1314, 22, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1315, 23, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1316, 24, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1317, 25, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1318, 26, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1319, 27, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1320, 28, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1321, 29, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1322, 30, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1323, 31, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1324, 32, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1325, 33, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1326, 34, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1327, 35, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1328, 36, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1329, 37, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1330, 38, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1331, 39, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1332, 40, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1333, 41, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1334, 42, 55, 0.00, '2018-10-22 00:03:05');
INSERT INTO `debt` VALUES (1335, 12, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1336, 13, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1337, 14, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1338, 15, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1339, 16, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1340, 17, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1341, 18, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1342, 19, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1343, 20, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1344, 21, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1345, 22, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1346, 23, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1347, 24, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1348, 25, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1349, 26, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1350, 27, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1351, 28, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1352, 29, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1353, 30, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1354, 31, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1355, 32, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1356, 33, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1357, 34, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1358, 35, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1359, 36, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1360, 37, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1361, 38, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1362, 39, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1363, 40, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1364, 41, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1365, 42, 56, 0.00, '2018-10-22 00:03:37');
INSERT INTO `debt` VALUES (1366, 12, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1367, 13, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1368, 14, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1369, 15, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1370, 16, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1371, 17, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1372, 18, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1373, 19, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1374, 20, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1375, 21, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1376, 22, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1377, 23, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1378, 24, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1379, 25, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1380, 26, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1381, 27, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1382, 28, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1383, 29, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1384, 30, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1385, 31, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1386, 32, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1387, 33, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1388, 34, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1389, 35, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1390, 36, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1391, 37, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1392, 38, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1393, 39, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1394, 40, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1395, 41, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1396, 42, 57, 0.00, '2018-10-22 00:04:25');
INSERT INTO `debt` VALUES (1397, 12, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1398, 13, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1399, 14, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1400, 15, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1401, 16, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1402, 17, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1403, 18, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1404, 19, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1405, 20, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1406, 21, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1407, 22, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1408, 23, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1409, 24, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1410, 25, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1411, 26, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1412, 27, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1413, 28, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1414, 29, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1415, 30, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1416, 31, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1417, 32, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1418, 33, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1419, 34, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1420, 35, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1421, 36, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1422, 37, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1423, 38, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1424, 39, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1425, 40, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1426, 41, 58, 0.00, '2018-10-22 00:04:39');
INSERT INTO `debt` VALUES (1427, 42, 58, 0.00, '2018-10-22 00:04:39');

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
INSERT INTO `original_storage` VALUES (2, 12, 0.00, 0, 'VND', 0);
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
INSERT INTO `original_storage` VALUES (19, 34, 0.00, 0, 'Bảng Anh', 0);
INSERT INTO `original_storage` VALUES (20, 35, 0.00, 0, 'Rúp Nga', 0);
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
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO `storage` VALUES (18, 'VND', 0, 12, '2018-10-18 23:44:27', 0);
INSERT INTO `storage` VALUES (19, 'USD', 0, 13, '2018-10-18 23:44:41', 0);
INSERT INTO `storage` VALUES (20, 'CAD', 0, 14, '2018-10-18 23:44:54', 0);
INSERT INTO `storage` VALUES (21, 'VCB', 0, 15, '2018-10-18 23:49:15', 1);
INSERT INTO `storage` VALUES (22, 'SCB', 0, 16, '2018-10-18 23:49:28', 1);
INSERT INTO `storage` VALUES (23, 'ACB', 0, 17, '2018-10-18 23:50:28', 1);
INSERT INTO `storage` VALUES (24, 'Maritime Bank', 0, 18, '2018-10-18 23:52:34', 1);
INSERT INTO `storage` VALUES (25, 'VP bank', 0, 19, '2018-10-18 23:53:01', 1);
INSERT INTO `storage` VALUES (26, 'Tệ', 0, 20, '2018-10-19 14:17:25', 0);
INSERT INTO `storage` VALUES (27, 'Yên', 0, 21, '2018-10-19 14:17:37', 0);
INSERT INTO `storage` VALUES (28, 'Úc', 0, 22, '2018-10-19 14:17:47', 0);
INSERT INTO `storage` VALUES (29, 'Won', 0, 23, '2018-10-19 14:17:59', 0);
INSERT INTO `storage` VALUES (30, 'Kíp Lào', 0, 24, '2018-10-19 14:18:14', 0);
INSERT INTO `storage` VALUES (31, 'SJC', 0, 25, '2018-10-19 14:18:22', 0);
INSERT INTO `storage` VALUES (32, '9999', 0, 26, '2018-10-19 14:18:32', 0);
INSERT INTO `storage` VALUES (33, 'Đài', 0, 27, '2018-10-19 14:20:18', 0);
INSERT INTO `storage` VALUES (34, 'Bạt', 0, 28, '2018-10-19 14:20:32', 0);
INSERT INTO `storage` VALUES (35, 'Malai', 0, 29, '2018-10-19 14:20:55', 0);
INSERT INTO `storage` VALUES (36, 'Ấn Độ', 0, 30, '2018-10-19 14:21:17', 0);
INSERT INTO `storage` VALUES (37, 'Newzeland', 0, 31, '2018-10-19 14:21:46', 0);
INSERT INTO `storage` VALUES (38, 'Thụy Sĩ', 0, 32, '2018-10-19 14:22:05', 0);
INSERT INTO `storage` VALUES (39, 'Euro', 0, 33, '2018-10-19 14:22:57', 0);
INSERT INTO `storage` VALUES (40, 'Bảng Anh', 0, 34, '2018-10-19 14:24:19', 0);
INSERT INTO `storage` VALUES (41, 'Rúp Nga', 0, 35, '2018-10-19 14:25:53', 0);
INSERT INTO `storage` VALUES (42, 'Hồng Kong', 0, 36, '2018-10-21 23:46:59', 0);
INSERT INTO `storage` VALUES (43, 'Indo', 0, 37, '2018-10-21 23:47:56', 0);
INSERT INTO `storage` VALUES (44, 'Philipines', 0, 38, '2018-10-21 23:48:19', 0);
INSERT INTO `storage` VALUES (45, 'TK TPbank', 0, 39, '2018-10-21 23:50:37', 1);
INSERT INTO `storage` VALUES (46, 'TK Seabank', 0, 40, '2018-10-21 23:51:01', 1);
INSERT INTO `storage` VALUES (47, 'TK MBbank', 0, 41, '2018-10-21 23:51:42', 1);
INSERT INTO `storage` VALUES (48, 'TK BiDV', 0, 42, '2018-10-21 23:51:58', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_debt` AS select currency_id, customer_id, value, DATE_FORMAT(date,'%Y-%m-%d') as date
 from debt 
order by date desc ; ;

-- ----------------------------
-- View structure for view_tonkho
-- ----------------------------
DROP VIEW IF EXISTS `view_tonkho`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_tonkho` AS select currency_id, quantity, DATE_FORMAT(date,'%Y-%m-%d') as date
 from storage 
order by date desc ;

-- ----------------------------
-- Procedure structure for proc_debt
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_debt`;
delimiter ;;
CREATE PROCEDURE `proc_debt`(IN `datetime` date)
BEGIN
		select currency_id, customer_id, value,DATE_FORMAT(date,'%Y-%m-%d') as date from (
		select * from debt order by date desc
		) abc 
		where DATE_FORMAT(date,'%y-%m-%d') <= datetime
		group by currency_id, customer_id;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
