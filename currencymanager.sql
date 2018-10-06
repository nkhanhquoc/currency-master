/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : currencymanager

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-10-06 15:23:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('admin', '1', '1468421772');
INSERT INTO `auth_assignment` VALUES ('User', '2', '1533657185');
INSERT INTO `auth_assignment` VALUES ('User', '3', '1533657195');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', '2', null, null, null, '1468421689', '1468421689');
INSERT INTO `auth_item` VALUES ('/admin/*', '2', null, null, null, '1468341067', '1468341067');
INSERT INTO `auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1468339654', '1468339654');
INSERT INTO `auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1468339526', '1468339526');
INSERT INTO `auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1468339490', '1468339490');
INSERT INTO `auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1468339653', '1468339653');
INSERT INTO `auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1468339512', '1468339512');
INSERT INTO `auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1468339732', '1468339732');
INSERT INTO `auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1468339725', '1468339725');
INSERT INTO `auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1468340134', '1468340134');
INSERT INTO `auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1468340044', '1468340044');
INSERT INTO `auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1468340057', '1468340057');
INSERT INTO `auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1468339963', '1468339963');
INSERT INTO `auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1468340049', '1468340049');
INSERT INTO `auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1468339967', '1468339967');
INSERT INTO `auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1468341039', '1468341039');
INSERT INTO `auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1468341032', '1468341032');
INSERT INTO `auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1468341001', '1468341001');
INSERT INTO `auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1468341006', '1468341006');
INSERT INTO `auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1468340144', '1468340144');
INSERT INTO `auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1468341033', '1468341033');
INSERT INTO `auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1468341003', '1468341003');
INSERT INTO `auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1468341000', '1468341000');
INSERT INTO `auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1468341046', '1468341046');
INSERT INTO `auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1468341045', '1468341045');
INSERT INTO `auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1468341044', '1468341044');
INSERT INTO `auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1468341045', '1468341045');
INSERT INTO `auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1468341039', '1468341039');
INSERT INTO `auth_item` VALUES ('/admin/role/remove', '2', null, null, null, '1468341046', '1468341046');
INSERT INTO `auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1468341045', '1468341045');
INSERT INTO `auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1468341044', '1468341044');
INSERT INTO `auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1468341048', '1468341048');
INSERT INTO `auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1468341047', '1468341047');
INSERT INTO `auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1468341047', '1468341047');
INSERT INTO `auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1468341046', '1468341046');
INSERT INTO `auth_item` VALUES ('/admin/route/refresh', '2', null, null, null, '1468341048', '1468341048');
INSERT INTO `auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1468341047', '1468341047');
INSERT INTO `auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1468341050', '1468341050');
INSERT INTO `auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1468341049', '1468341049');
INSERT INTO `auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1468341049', '1468341049');
INSERT INTO `auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1468341048', '1468341048');
INSERT INTO `auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1468341049', '1468341049');
INSERT INTO `auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1468341049', '1468341049');
INSERT INTO `auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1468341066', '1468341066');
INSERT INTO `auth_item` VALUES ('/admin/user/activate', '2', null, null, null, '1468341066', '1468341066');
INSERT INTO `auth_item` VALUES ('/admin/user/change-password', '2', null, null, null, '1468341066', '1468341066');
INSERT INTO `auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1468341053', '1468341053');
INSERT INTO `auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1468341051', '1468341051');
INSERT INTO `auth_item` VALUES ('/admin/user/login', '2', null, null, null, '1468341054', '1468341054');
INSERT INTO `auth_item` VALUES ('/admin/user/logout', '2', null, null, null, '1468341055', '1468341055');
INSERT INTO `auth_item` VALUES ('/admin/user/request-password-reset', '2', null, null, null, '1468341065', '1468341065');
INSERT INTO `auth_item` VALUES ('/admin/user/reset-password', '2', null, null, null, '1468341065', '1468341065');
INSERT INTO `auth_item` VALUES ('/admin/user/signup', '2', null, null, null, '1468341064', '1468341064');
INSERT INTO `auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1468341052', '1468341052');
INSERT INTO `auth_item` VALUES ('/app/*', '2', null, null, null, '1468341138', '1468341138');
INSERT INTO `auth_item` VALUES ('/app/galleryApi', '2', null, null, null, '1468341137', '1468341137');
INSERT INTO `auth_item` VALUES ('/banner/*', '2', null, null, null, '1468341159', '1468341159');
INSERT INTO `auth_item` VALUES ('/banner/create', '2', null, null, null, '1468341158', '1468341158');
INSERT INTO `auth_item` VALUES ('/banner/delete', '2', null, null, null, '1468341159', '1468341159');
INSERT INTO `auth_item` VALUES ('/banner/index', '2', null, null, null, '1468341149', '1468341149');
INSERT INTO `auth_item` VALUES ('/banner/update', '2', null, null, null, '1468341159', '1468341159');
INSERT INTO `auth_item` VALUES ('/banner/view', '2', null, null, null, '1468341157', '1468341157');
INSERT INTO `auth_item` VALUES ('/borrow/*', '2', null, null, null, '1536468763', '1536468763');
INSERT INTO `auth_item` VALUES ('/borrow/create', '2', null, null, null, '1536468763', '1536468763');
INSERT INTO `auth_item` VALUES ('/borrow/delete', '2', null, null, null, '1536468763', '1536468763');
INSERT INTO `auth_item` VALUES ('/borrow/index', '2', null, null, null, '1536468763', '1536468763');
INSERT INTO `auth_item` VALUES ('/borrow/update', '2', null, null, null, '1536468763', '1536468763');
INSERT INTO `auth_item` VALUES ('/borrow/view', '2', null, null, null, '1536468763', '1536468763');
INSERT INTO `auth_item` VALUES ('/casting/*', '2', null, null, null, '1513093509', '1513093509');
INSERT INTO `auth_item` VALUES ('/casting/create', '2', null, null, null, '1513093508', '1513093508');
INSERT INTO `auth_item` VALUES ('/casting/index', '2', null, null, null, '1513093508', '1513093508');
INSERT INTO `auth_item` VALUES ('/casting/update', '2', null, null, null, '1513093508', '1513093508');
INSERT INTO `auth_item` VALUES ('/casting/view', '2', null, null, null, '1513093508', '1513093508');
INSERT INTO `auth_item` VALUES ('/contact/*', '2', null, null, null, '1513355227', '1513355227');
INSERT INTO `auth_item` VALUES ('/contact/index', '2', null, null, null, '1513355227', '1513355227');
INSERT INTO `auth_item` VALUES ('/contact/view', '2', null, null, null, '1513355227', '1513355227');
INSERT INTO `auth_item` VALUES ('/country/*', '2', null, null, null, '1468341170', '1468341170');
INSERT INTO `auth_item` VALUES ('/country/create', '2', null, null, null, '1468341160', '1468341160');
INSERT INTO `auth_item` VALUES ('/country/delete', '2', null, null, null, '1468341168', '1468341168');
INSERT INTO `auth_item` VALUES ('/country/index', '2', null, null, null, '1468341160', '1468341160');
INSERT INTO `auth_item` VALUES ('/country/update', '2', null, null, null, '1468341168', '1468341168');
INSERT INTO `auth_item` VALUES ('/country/view', '2', null, null, null, '1468341160', '1468341160');
INSERT INTO `auth_item` VALUES ('/currency/*', '2', null, null, null, '1535882766', '1535882766');
INSERT INTO `auth_item` VALUES ('/currency/create', '2', null, null, null, '1535882766', '1535882766');
INSERT INTO `auth_item` VALUES ('/currency/delete', '2', null, null, null, '1535882766', '1535882766');
INSERT INTO `auth_item` VALUES ('/currency/index', '2', null, null, null, '1535882766', '1535882766');
INSERT INTO `auth_item` VALUES ('/currency/update', '2', null, null, null, '1535882766', '1535882766');
INSERT INTO `auth_item` VALUES ('/currency/view', '2', null, null, null, '1535882766', '1535882766');
INSERT INTO `auth_item` VALUES ('/customer/*', '2', null, null, null, '1535882767', '1535882767');
INSERT INTO `auth_item` VALUES ('/customer/create', '2', null, null, null, '1535882766', '1535882766');
INSERT INTO `auth_item` VALUES ('/customer/delete', '2', null, null, null, '1535882767', '1535882767');
INSERT INTO `auth_item` VALUES ('/customer/index', '2', null, null, null, '1535879739', '1535879739');
INSERT INTO `auth_item` VALUES ('/customer/update', '2', null, null, null, '1535882766', '1535882766');
INSERT INTO `auth_item` VALUES ('/customer/view', '2', null, null, null, '1535882766', '1535882766');
INSERT INTO `auth_item` VALUES ('/daily-report', '2', null, null, null, null, null);
INSERT INTO `auth_item` VALUES ('/daily-report/index', '2', null, null, null, null, null);
INSERT INTO `auth_item` VALUES ('/debug/*', '2', null, null, null, '1468341111', '1468341111');
INSERT INTO `auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1468341110', '1468341110');
INSERT INTO `auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1468341101', '1468341101');
INSERT INTO `auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1468341071', '1468341071');
INSERT INTO `auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1468341077', '1468341077');
INSERT INTO `auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1468341075', '1468341075');
INSERT INTO `auth_item` VALUES ('/distric/*', '2', null, null, null, '1468341185', '1468341185');
INSERT INTO `auth_item` VALUES ('/distric/create', '2', null, null, null, '1468341180', '1468341180');
INSERT INTO `auth_item` VALUES ('/distric/delete', '2', null, null, null, '1468341184', '1468341184');
INSERT INTO `auth_item` VALUES ('/distric/index', '2', null, null, null, '1468341176', '1468341176');
INSERT INTO `auth_item` VALUES ('/distric/update', '2', null, null, null, '1468341182', '1468341182');
INSERT INTO `auth_item` VALUES ('/distric/view', '2', null, null, null, '1468341179', '1468341179');
INSERT INTO `auth_item` VALUES ('/fast-bill/*', '2', null, null, null, '1538443210', '1538443210');
INSERT INTO `auth_item` VALUES ('/fast-bill/create', '2', null, null, null, '1538443209', '1538443209');
INSERT INTO `auth_item` VALUES ('/fast-bill/delete', '2', null, null, null, '1538443210', '1538443210');
INSERT INTO `auth_item` VALUES ('/fast-bill/index', '2', null, null, null, '1538443209', '1538443209');
INSERT INTO `auth_item` VALUES ('/fast-bill/update', '2', null, null, null, '1538443209', '1538443209');
INSERT INTO `auth_item` VALUES ('/fast-bill/view', '2', null, null, null, '1538443209', '1538443209');
INSERT INTO `auth_item` VALUES ('/formed-bill/*', '2', null, null, null, '1536483069', '1536483069');
INSERT INTO `auth_item` VALUES ('/formed-bill/create', '2', null, null, null, '1536483069', '1536483069');
INSERT INTO `auth_item` VALUES ('/formed-bill/delete', '2', null, null, null, '1536483069', '1536483069');
INSERT INTO `auth_item` VALUES ('/formed-bill/index', '2', null, null, null, '1536483069', '1536483069');
INSERT INTO `auth_item` VALUES ('/formed-bill/update', '2', null, null, null, '1536483069', '1536483069');
INSERT INTO `auth_item` VALUES ('/formed-bill/view', '2', null, null, null, '1536483069', '1536483069');
INSERT INTO `auth_item` VALUES ('/gii/*', '2', null, null, null, '1468341136', '1468341136');
INSERT INTO `auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1468341135', '1468341135');
INSERT INTO `auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1468341135', '1468341135');
INSERT INTO `auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1468341134', '1468341134');
INSERT INTO `auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1468341113', '1468341113');
INSERT INTO `auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1468341134', '1468341134');
INSERT INTO `auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1468341133', '1468341133');
INSERT INTO `auth_item` VALUES ('/home-bank/*', '2', null, null, null, '1537973092', '1537973092');
INSERT INTO `auth_item` VALUES ('/home-bank/create', '2', null, null, null, '1537973092', '1537973092');
INSERT INTO `auth_item` VALUES ('/home-bank/delete', '2', null, null, null, '1537973092', '1537973092');
INSERT INTO `auth_item` VALUES ('/home-bank/index', '2', null, null, null, '1537973092', '1537973092');
INSERT INTO `auth_item` VALUES ('/home-bank/update', '2', null, null, null, '1537973092', '1537973092');
INSERT INTO `auth_item` VALUES ('/home-bank/view', '2', null, null, null, '1537973092', '1537973092');
INSERT INTO `auth_item` VALUES ('/home-send/*', '2', null, null, null, '1537949578', '1537949578');
INSERT INTO `auth_item` VALUES ('/home-send/create', '2', null, null, null, '1537949578', '1537949578');
INSERT INTO `auth_item` VALUES ('/home-send/delete', '2', null, null, null, '1537949578', '1537949578');
INSERT INTO `auth_item` VALUES ('/home-send/index', '2', null, null, null, '1537949578', '1537949578');
INSERT INTO `auth_item` VALUES ('/home-send/update', '2', null, null, null, '1537949578', '1537949578');
INSERT INTO `auth_item` VALUES ('/home-send/view', '2', null, null, null, '1537949578', '1537949578');
INSERT INTO `auth_item` VALUES ('/home-storage-transaction/*', '2', null, null, null, '1537800606', '1537800606');
INSERT INTO `auth_item` VALUES ('/home-storage-transaction/create', '2', null, null, null, '1537800605', '1537800605');
INSERT INTO `auth_item` VALUES ('/home-storage-transaction/delete', '2', null, null, null, '1537800606', '1537800606');
INSERT INTO `auth_item` VALUES ('/home-storage-transaction/index', '2', null, null, null, '1537800605', '1537800605');
INSERT INTO `auth_item` VALUES ('/home-storage-transaction/update', '2', null, null, null, '1537800606', '1537800606');
INSERT INTO `auth_item` VALUES ('/home-storage-transaction/view', '2', null, null, null, '1537800605', '1537800605');
INSERT INTO `auth_item` VALUES ('/home-storage/*', '2', null, null, null, '1537717035', '1537717035');
INSERT INTO `auth_item` VALUES ('/home-storage/create', '2', null, null, null, '1537717035', '1537717035');
INSERT INTO `auth_item` VALUES ('/home-storage/delete', '2', null, null, null, '1537717035', '1537717035');
INSERT INTO `auth_item` VALUES ('/home-storage/index', '2', null, null, null, '1537717035', '1537717035');
INSERT INTO `auth_item` VALUES ('/home-storage/update', '2', null, null, null, '1537717035', '1537717035');
INSERT INTO `auth_item` VALUES ('/home-storage/view', '2', null, null, null, '1537717035', '1537717035');
INSERT INTO `auth_item` VALUES ('/home-trading/*', '2', null, null, null, '1537959675', '1537959675');
INSERT INTO `auth_item` VALUES ('/home-trading/create', '2', null, null, null, '1537959675', '1537959675');
INSERT INTO `auth_item` VALUES ('/home-trading/delete', '2', null, null, null, '1537959675', '1537959675');
INSERT INTO `auth_item` VALUES ('/home-trading/export', '2', null, null, null, '1537973092', '1537973092');
INSERT INTO `auth_item` VALUES ('/home-trading/index', '2', null, null, null, '1537959675', '1537959675');
INSERT INTO `auth_item` VALUES ('/home-trading/update', '2', null, null, null, '1537959675', '1537959675');
INSERT INTO `auth_item` VALUES ('/home-trading/view', '2', null, null, null, '1537959675', '1537959675');
INSERT INTO `auth_item` VALUES ('/home-transfer/*', '2', null, null, null, '1537953905', '1537953905');
INSERT INTO `auth_item` VALUES ('/home-transfer/create', '2', null, null, null, '1537953904', '1537953904');
INSERT INTO `auth_item` VALUES ('/home-transfer/delete', '2', null, null, null, '1537953905', '1537953905');
INSERT INTO `auth_item` VALUES ('/home-transfer/export', '2', null, null, null, '1537959678', '1537959678');
INSERT INTO `auth_item` VALUES ('/home-transfer/index', '2', null, null, null, '1537953904', '1537953904');
INSERT INTO `auth_item` VALUES ('/home-transfer/update', '2', null, null, null, '1537953905', '1537953905');
INSERT INTO `auth_item` VALUES ('/home-transfer/view', '2', null, null, null, '1537953904', '1537953904');
INSERT INTO `auth_item` VALUES ('/longtime-bill/*', '2', null, null, null, '1537600615', '1537600615');
INSERT INTO `auth_item` VALUES ('/longtime-bill/create', '2', null, null, null, '1537600614', '1537600614');
INSERT INTO `auth_item` VALUES ('/longtime-bill/delete', '2', null, null, null, '1537600614', '1537600614');
INSERT INTO `auth_item` VALUES ('/longtime-bill/export', '2', null, null, null, '1537600614', '1537600614');
INSERT INTO `auth_item` VALUES ('/longtime-bill/index', '2', null, null, null, '1537600614', '1537600614');
INSERT INTO `auth_item` VALUES ('/longtime-bill/update', '2', null, null, null, '1537600614', '1537600614');
INSERT INTO `auth_item` VALUES ('/longtime-bill/view', '2', null, null, null, '1537600614', '1537600614');
INSERT INTO `auth_item` VALUES ('/menu/*', '2', null, null, null, '1468421684', '1468421684');
INSERT INTO `auth_item` VALUES ('/menu/create', '2', null, null, null, '1468421684', '1468421684');
INSERT INTO `auth_item` VALUES ('/menu/delete', '2', null, null, null, '1468421684', '1468421684');
INSERT INTO `auth_item` VALUES ('/menu/galleryApi', '2', null, null, null, '1468421684', '1468421684');
INSERT INTO `auth_item` VALUES ('/menu/index', '2', null, null, null, '1468421684', '1468421684');
INSERT INTO `auth_item` VALUES ('/menu/update', '2', null, null, null, '1468421684', '1468421684');
INSERT INTO `auth_item` VALUES ('/menu/view', '2', null, null, null, '1468421684', '1468421684');
INSERT INTO `auth_item` VALUES ('/mode/*', '2', null, null, null, '1468421686', '1468421686');
INSERT INTO `auth_item` VALUES ('/mode/create', '2', null, null, null, '1468421685', '1468421685');
INSERT INTO `auth_item` VALUES ('/mode/delete', '2', null, null, null, '1468421685', '1468421685');
INSERT INTO `auth_item` VALUES ('/mode/design', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/mode/index', '2', null, null, null, '1468421684', '1468421684');
INSERT INTO `auth_item` VALUES ('/mode/update', '2', null, null, null, '1468421685', '1468421685');
INSERT INTO `auth_item` VALUES ('/mode/view', '2', null, null, null, '1468421684', '1468421684');
INSERT INTO `auth_item` VALUES ('/module-status/*', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/module-status/create', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/module-status/delete', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/module-status/index', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/module-status/update', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/module-status/view', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/modules/*', '2', null, null, null, '1468421687', '1468421687');
INSERT INTO `auth_item` VALUES ('/modules/create', '2', null, null, null, '1468421686', '1468421686');
INSERT INTO `auth_item` VALUES ('/modules/delete', '2', null, null, null, '1468421687', '1468421687');
INSERT INTO `auth_item` VALUES ('/modules/index', '2', null, null, null, '1468421686', '1468421686');
INSERT INTO `auth_item` VALUES ('/modules/update', '2', null, null, null, '1468421686', '1468421686');
INSERT INTO `auth_item` VALUES ('/modules/view', '2', null, null, null, '1468421686', '1468421686');
INSERT INTO `auth_item` VALUES ('/movie/*', '2', null, null, null, '1512968287', '1512968287');
INSERT INTO `auth_item` VALUES ('/movie/create', '2', null, null, null, '1512984265', '1512984265');
INSERT INTO `auth_item` VALUES ('/movie/index', '2', null, null, null, '1512984259', '1512984259');
INSERT INTO `auth_item` VALUES ('/movie/update', '2', null, null, null, '1512984271', '1512984271');
INSERT INTO `auth_item` VALUES ('/news/*', '2', null, null, null, '1513263575', '1513263575');
INSERT INTO `auth_item` VALUES ('/news/create', '2', null, null, null, '1513263574', '1513263574');
INSERT INTO `auth_item` VALUES ('/news/index', '2', null, null, null, '1513263574', '1513263574');
INSERT INTO `auth_item` VALUES ('/news/update', '2', null, null, null, '1513263574', '1513263574');
INSERT INTO `auth_item` VALUES ('/news/view', '2', null, null, null, '1513263574', '1513263574');
INSERT INTO `auth_item` VALUES ('/other-transfer/*', '2', null, null, null, '1537886665', '1537886665');
INSERT INTO `auth_item` VALUES ('/other-transfer/create', '2', null, null, null, '1537886664', '1537886664');
INSERT INTO `auth_item` VALUES ('/other-transfer/index', '2', null, null, null, '1537886664', '1537886664');
INSERT INTO `auth_item` VALUES ('/other-transfer/update', '2', null, null, null, '1537886664', '1537886664');
INSERT INTO `auth_item` VALUES ('/output-mode/*', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/output-mode/create', '2', null, null, null, '1468421687', '1468421687');
INSERT INTO `auth_item` VALUES ('/output-mode/delete', '2', null, null, null, '1468421687', '1468421687');
INSERT INTO `auth_item` VALUES ('/output-mode/index', '2', null, null, null, '1468421687', '1468421687');
INSERT INTO `auth_item` VALUES ('/output-mode/update', '2', null, null, null, '1468421687', '1468421687');
INSERT INTO `auth_item` VALUES ('/output-mode/view', '2', null, null, null, '1468421687', '1468421687');
INSERT INTO `auth_item` VALUES ('/param-config/*', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/param-config/create', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/param-config/delete', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/param-config/index', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/param-config/update', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/param-config/view', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/pets/*', '2', null, null, null, '1533653576', '1533653576');
INSERT INTO `auth_item` VALUES ('/pets/create', '2', null, null, null, '1533653576', '1533653576');
INSERT INTO `auth_item` VALUES ('/pets/delete', '2', null, null, null, '1533653576', '1533653576');
INSERT INTO `auth_item` VALUES ('/pets/index', '2', null, null, null, '1533653576', '1533653576');
INSERT INTO `auth_item` VALUES ('/pets/update', '2', null, null, null, '1533653576', '1533653576');
INSERT INTO `auth_item` VALUES ('/pets/view', '2', null, null, null, '1533653576', '1533653576');
INSERT INTO `auth_item` VALUES ('/pettype/*', '2', null, null, null, '1533653577', '1533653577');
INSERT INTO `auth_item` VALUES ('/pettype/create', '2', null, null, null, '1533653577', '1533653577');
INSERT INTO `auth_item` VALUES ('/pettype/delete', '2', null, null, null, '1533653577', '1533653577');
INSERT INTO `auth_item` VALUES ('/pettype/index', '2', null, null, null, '1533653576', '1533653576');
INSERT INTO `auth_item` VALUES ('/pettype/update', '2', null, null, null, '1533653577', '1533653577');
INSERT INTO `auth_item` VALUES ('/pettype/view', '2', null, null, null, '1533653577', '1533653577');
INSERT INTO `auth_item` VALUES ('/provincial/*', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/provincial/create', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/provincial/delete', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/provincial/index', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/provincial/update', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/provincial/view', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/register/*', '2', null, null, null, '1513178312', '1513178312');
INSERT INTO `auth_item` VALUES ('/register/index', '2', null, null, null, '1513178312', '1513178312');
INSERT INTO `auth_item` VALUES ('/register/update', '2', null, null, null, '1513178312', '1513178312');
INSERT INTO `auth_item` VALUES ('/register/view', '2', null, null, null, '1513178312', '1513178312');
INSERT INTO `auth_item` VALUES ('/reset-password/*', '2', null, null, null, '1480405669', '1480405669');
INSERT INTO `auth_item` VALUES ('/reset-password/index', '2', null, null, null, '1480405669', '1480405669');
INSERT INTO `auth_item` VALUES ('/runtime-statistics/*', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/runtime-statistics/create', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/runtime-statistics/delete', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/runtime-statistics/index', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/runtime-statistics/update', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/runtime-statistics/view', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/runtime/*', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/runtime/create', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/runtime/delete', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/runtime/index', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/runtime/update', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/runtime/view', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/sensor/*', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/sensor/create', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/sensor/delete', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/sensor/index', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/sensor/update', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/sensor/view', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/site/*', '2', null, null, null, '1468421689', '1468421689');
INSERT INTO `auth_item` VALUES ('/site/captcha', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/site/error', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/site/index', '2', null, null, null, '1468421688', '1468421688');
INSERT INTO `auth_item` VALUES ('/site/login', '2', null, null, null, '1468421689', '1468421689');
INSERT INTO `auth_item` VALUES ('/site/logout', '2', null, null, null, '1468421689', '1468421689');
INSERT INTO `auth_item` VALUES ('/socket/*', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/socket/index', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/storage/*', '2', null, null, null, '1535878243', '1535878243');
INSERT INTO `auth_item` VALUES ('/storage/create', '2', null, null, null, '1535878367', '1535878367');
INSERT INTO `auth_item` VALUES ('/storage/delete', '2', null, null, null, '1535878367', '1535878367');
INSERT INTO `auth_item` VALUES ('/storage/index', '2', null, null, null, '1535878367', '1535878367');
INSERT INTO `auth_item` VALUES ('/storage/update', '2', null, null, null, '1535878367', '1535878367');
INSERT INTO `auth_item` VALUES ('/storage/view', '2', null, null, null, '1535878367', '1535878367');
INSERT INTO `auth_item` VALUES ('/timer-counter/*', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/timer-counter/create', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/timer-counter/delete', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/timer-counter/index', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/timer-counter/update', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/timer-counter/view', '2', null, null, null, '1479716667', '1479716667');
INSERT INTO `auth_item` VALUES ('/transfer-currency/*', '2', null, null, null, '1535890861', '1535890861');
INSERT INTO `auth_item` VALUES ('/transfer-currency/create', '2', null, null, null, '1535890861', '1535890861');
INSERT INTO `auth_item` VALUES ('/transfer-currency/delete', '2', null, null, null, '1535890861', '1535890861');
INSERT INTO `auth_item` VALUES ('/transfer-currency/index', '2', null, null, null, '1535890861', '1535890861');
INSERT INTO `auth_item` VALUES ('/transfer-currency/update', '2', null, null, null, '1535890861', '1535890861');
INSERT INTO `auth_item` VALUES ('/transfer-currency/view', '2', null, null, null, '1535890861', '1535890861');
INSERT INTO `auth_item` VALUES ('/user/*', '2', null, null, null, '1468421689', '1468421689');
INSERT INTO `auth_item` VALUES ('/user/create', '2', null, null, null, '1468421689', '1468421689');
INSERT INTO `auth_item` VALUES ('/user/delete', '2', null, null, null, '1468421689', '1468421689');
INSERT INTO `auth_item` VALUES ('/user/galleryApi', '2', null, null, null, '1468421689', '1468421689');
INSERT INTO `auth_item` VALUES ('/user/index', '2', null, null, null, '1468421689', '1468421689');
INSERT INTO `auth_item` VALUES ('/user/update', '2', null, null, null, '1468421689', '1468421689');
INSERT INTO `auth_item` VALUES ('/user/view', '2', null, null, null, '1468421689', '1468421689');
INSERT INTO `auth_item` VALUES ('/view-debt/*', '2', null, null, null, '1538297288', '1538297288');
INSERT INTO `auth_item` VALUES ('/view-debt/create', '2', null, null, null, '1538297288', '1538297288');
INSERT INTO `auth_item` VALUES ('/view-debt/delete', '2', null, null, null, '1538297288', '1538297288');
INSERT INTO `auth_item` VALUES ('/view-debt/index', '2', null, null, null, '1538297288', '1538297288');
INSERT INTO `auth_item` VALUES ('/view-debt/update', '2', null, null, null, '1538297288', '1538297288');
INSERT INTO `auth_item` VALUES ('/view-debt/view', '2', null, null, null, '1538297288', '1538297288');
INSERT INTO `auth_item` VALUES ('admin', '1', 'Administrator', null, null, '1468421733', '1533656982');
INSERT INTO `auth_item` VALUES ('User', '1', null, null, null, '1513907402', '1533656895');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(2) DEFAULT NULL COMMENT '1. Hop dong giao ngay, 2.Hop dong chot, 3. Hop dong dai han, 4. Hoa don chuyen tien, 5. Hoa don vay muon, 6. chuyen tien khac, 7. chuyen tien que, 8. Mua ban que, 9.Chuyen khoan que',
  `code` varchar(255) DEFAULT NULL COMMENT 'ma hop dong',
  `customer_id` bigint(20) DEFAULT '0',
  `value` double(10,2) DEFAULT NULL,
  `customer_type` int(2) DEFAULT NULL COMMENT '1. Nha vang, 2.Khanh le',
  `note` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `deposit` double(10,2) DEFAULT NULL COMMENT 'tien dat coc',
  `fee` double(10,2) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_export` int(1) DEFAULT '0' COMMENT '1. da xuat hoa don, 0. chua xuat',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('4', '4', 'TC-20180908-NV1-0', '1', null, null, '', 'Cường', null, null, '2018-09-08 01:03:47', '0');
INSERT INTO `bill` VALUES ('7', '5', 'VM-20180909-NV1-0', '1', null, null, '', null, null, null, '2018-09-23 15:10:43', '1');
INSERT INTO `bill` VALUES ('9', '2', 'HDC-20180909-NV1-0', '1', null, null, '1213', null, null, null, '2018-09-09 16:25:00', '0');
INSERT INTO `bill` VALUES ('10', '2', 'HDC-20180909-NV1-1', '1', null, null, '2323', null, null, null, '2018-09-09 16:25:33', '0');
INSERT INTO `bill` VALUES ('11', '2', 'HDC-20180909-NV2-2', '2', '9650600.00', null, 'sdfdfsd', null, null, null, '2018-09-20 20:56:00', '1');
INSERT INTO `bill` VALUES ('13', '4', 'TC-20180911-xxx-0', null, null, null, '', '', null, null, '2018-09-11 12:20:00', '1');
INSERT INTO `bill` VALUES ('14', '4', 'TC-20180912-NV2-0', '2', null, null, 'abc', 'Huy', null, null, '2018-09-20 21:52:04', '0');
INSERT INTO `bill` VALUES ('15', '4', 'TC-20180912-NV2-1', '2', null, null, 'adfsdfdddd', 'abcss', null, null, '2018-09-12 16:51:24', '1');
INSERT INTO `bill` VALUES ('16', '4', 'TC-20180920-NV2-2', '2', null, null, 'abc', 'ABC', null, null, '2018-09-20 22:05:47', '0');
INSERT INTO `bill` VALUES ('17', '3', 'HDH-20180922-NV2-1', '2', '5150000.00', null, 'ab', null, '150000.00', null, '2018-09-22 14:21:00', '0');
INSERT INTO `bill` VALUES ('18', '3', 'HDH-20180922-NV2-2', '2', '25600000.00', null, 'ab', null, '600000.00', null, '2018-09-22 15:36:32', '1');
INSERT INTO `bill` VALUES ('19', '6', 'TCK-20180925-NV1-1', '1', null, null, '', 'abc', null, null, '2018-09-25 21:52:56', '1');
INSERT INTO `bill` VALUES ('20', '7', 'TCLV-20180926-1', '0', null, null, '', '', null, null, '2018-09-26 16:45:10', '0');
INSERT INTO `bill` VALUES ('21', '7', 'TCLV-20180926-1', '0', null, null, '', '', null, null, '2018-09-26 16:45:26', '1');
INSERT INTO `bill` VALUES ('22', '8', 'MBLV-20180926-1', '0', '33750000.00', null, '', null, null, null, '2018-09-26 21:19:51', '0');
INSERT INTO `bill` VALUES ('23', '8', 'MBLV-20180926-1', '0', '22000000.00', null, '', null, null, null, '2018-09-26 21:23:18', '1');
INSERT INTO `bill` VALUES ('24', '9', 'CKLV-20180926-1', '0', null, null, '', null, null, null, '2018-09-26 22:48:00', '1');
INSERT INTO `bill` VALUES ('25', '10', 'GN-20181002-NV2-1', '2', null, null, '', null, null, null, '2018-10-02 12:04:10', '0');
INSERT INTO `bill` VALUES ('26', '10', 'GN-20181002-NV1-2', '1', '0.00', null, '', null, null, null, '2018-10-02 12:07:08', '0');

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `msisdn` varchar(20) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '1- da xem, 0 chua xem',
  `updated_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES ('1', 'khanh', '988781354', 'abc', '2017-12-15 23:35:58.000000', '1', '2017-12-15 23:36:42.000000');
INSERT INTO `contact` VALUES ('2', 'Ngyen quoc Khanh', '1234567', 'DDOngs phim', '2017-12-30 02:55:03.000000', null, '2017-12-30 02:55:03.000000');
INSERT INTO `contact` VALUES ('3', 'khanhnq16', '9843984093', 'test message', '2017-12-30 02:56:27.000000', null, '2017-12-30 02:56:27.000000');

-- ----------------------------
-- Table structure for currency
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `exchange_rate` double(10,2) DEFAULT NULL,
  `is_active` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES ('1', 'Tiền Việt Nam', 'VND', '1.00', '1');
INSERT INTO `currency` VALUES ('2', 'Đô la Mỹ', 'USD', '23500.55', '1');
INSERT INTO `currency` VALUES ('3', 'Đô Canada', 'CAD', '17823.50', '1');
INSERT INTO `currency` VALUES ('4', 'Nhan dan te', 'NDT', '2000.00', '1');
INSERT INTO `currency` VALUES ('6', 'Dola Singapore', 'SNG', '30000.00', '1');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'NV1', 'NV1', null);
INSERT INTO `customer` VALUES ('2', 'NV2', 'NV2', 'abc');
INSERT INTO `customer` VALUES ('3', 'Nha vang 3', 'NV3', 'abc');
INSERT INTO `customer` VALUES ('4', 'nha vang4', 'NV4', 'abc');
INSERT INTO `customer` VALUES ('5', 'NV5', 'NV5', 'adfdfs');
INSERT INTO `customer` VALUES ('6', 'NV5', 'NV5', 'adfdfs');
INSERT INTO `customer` VALUES ('7', 'NV5', 'NV5', 'adfdfs');

-- ----------------------------
-- Table structure for debt
-- ----------------------------
DROP TABLE IF EXISTS `debt`;
CREATE TABLE `debt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `value` float(10,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of debt
-- ----------------------------
INSERT INTO `debt` VALUES ('1', '1', '7', '0.00', '2018-09-29 10:19:28');
INSERT INTO `debt` VALUES ('2', '2', '7', '0.00', '2018-09-29 10:19:28');
INSERT INTO `debt` VALUES ('3', '3', '7', '0.00', '2018-09-29 10:19:28');
INSERT INTO `debt` VALUES ('4', '4', '7', '0.00', '2018-09-29 10:19:28');
INSERT INTO `debt` VALUES ('5', '2', '1', '1001.00', '2018-09-29 10:59:42');
INSERT INTO `debt` VALUES ('6', '1', '1', '-6000.00', '2018-09-29 10:59:42');
INSERT INTO `debt` VALUES ('7', '1', '7', '400.00', '2018-09-27 09:54:50');
INSERT INTO `debt` VALUES ('8', '2', '7', '100.00', '2018-09-26 09:55:06');
INSERT INTO `debt` VALUES ('9', '2', '2', '200.00', '2018-09-26 09:56:05');
INSERT INTO `debt` VALUES ('10', '5', '1', '0.00', '2018-09-30 18:05:54');
INSERT INTO `debt` VALUES ('11', '5', '2', '0.00', '2018-09-30 18:05:55');
INSERT INTO `debt` VALUES ('12', '5', '3', '0.00', '2018-09-30 18:05:55');
INSERT INTO `debt` VALUES ('13', '5', '4', '0.00', '2018-09-30 18:05:55');
INSERT INTO `debt` VALUES ('14', '5', '5', '0.00', '2018-09-30 18:05:55');
INSERT INTO `debt` VALUES ('15', '5', '6', '0.00', '2018-09-30 18:05:55');
INSERT INTO `debt` VALUES ('16', '5', '7', '0.00', '2018-09-30 18:05:55');
INSERT INTO `debt` VALUES ('17', '6', '1', '0.00', '2018-09-30 18:06:55');
INSERT INTO `debt` VALUES ('18', '6', '2', '0.00', '2018-09-30 18:06:55');
INSERT INTO `debt` VALUES ('19', '6', '3', '0.00', '2018-09-30 18:06:55');
INSERT INTO `debt` VALUES ('20', '6', '4', '0.00', '2018-09-30 18:06:55');
INSERT INTO `debt` VALUES ('21', '6', '5', '0.00', '2018-09-30 18:06:55');
INSERT INTO `debt` VALUES ('22', '6', '6', '0.00', '2018-09-30 18:06:55');
INSERT INTO `debt` VALUES ('23', '6', '7', '0.00', '2018-09-30 18:06:55');

-- ----------------------------
-- Table structure for home_storage
-- ----------------------------
DROP TABLE IF EXISTS `home_storage`;
CREATE TABLE `home_storage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_st_currency` (`currency_id`),
  CONSTRAINT `home_st_currency` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of home_storage
-- ----------------------------
INSERT INTO `home_storage` VALUES ('1', '2', null, '102500');
INSERT INTO `home_storage` VALUES ('2', '1', null, '1000000');

-- ----------------------------
-- Table structure for home_storage_transaction
-- ----------------------------
DROP TABLE IF EXISTS `home_storage_transaction`;
CREATE TABLE `home_storage_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency_id` bigint(20) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of home_storage_transaction
-- ----------------------------
INSERT INTO `home_storage_transaction` VALUES ('1', '2', '1000', '2018-09-24 23:04:55.000000', '1');
INSERT INTO `home_storage_transaction` VALUES ('2', '2', '1500', '2018-09-24 23:05:36.000000', '2');
INSERT INTO `home_storage_transaction` VALUES ('3', '1', '1000000', '2018-09-25 23:05:56.000000', '1');
INSERT INTO `home_storage_transaction` VALUES ('4', '2', '100000', '2018-09-25 23:12:25.000000', '2');
INSERT INTO `home_storage_transaction` VALUES ('5', '3', '10000', '2018-09-26 16:09:30.000000', '2');
INSERT INTO `home_storage_transaction` VALUES ('6', '1', '500000000', '2018-09-26 16:11:03.000000', '2');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  `icon` tinytext,
  `type` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', 'Account manager', null, null, '5', null, 'icon-user-following', null);
INSERT INTO `menu` VALUES ('2', 'Account', '1', '/admin/user/index', '1', null, 'icon-users', null);
INSERT INTO `menu` VALUES ('3', 'Menu', '1', '/menu/index', '2', null, 'icon-list', null);
INSERT INTO `menu` VALUES ('20', 'Quản lý Nhập liệu', null, null, '1', null, '', null);
INSERT INTO `menu` VALUES ('26', 'Quyền', '1', '/admin/role/index', null, null, null, null);
INSERT INTO `menu` VALUES ('27', 'Cấp quyền', '1', '/admin/assignment/index', null, null, '', null);
INSERT INTO `menu` VALUES ('28', 'Nhập Kho', '20', '/storage/index', '1', null, '', null);
INSERT INTO `menu` VALUES ('29', 'Nhập Khách Hàng', '20', '/customer/index', '2', null, '', null);
INSERT INTO `menu` VALUES ('30', 'Nhập Hàng Hóa', '20', '/currency/index', null, null, '', null);
INSERT INTO `menu` VALUES ('31', 'Quản lý Tiền chuyển', null, null, null, null, '', null);
INSERT INTO `menu` VALUES ('32', 'Tiền chuyển VN', '31', '/transfer-currency/index', null, null, '', null);
INSERT INTO `menu` VALUES ('33', 'Tiền chuyển Khác', '31', null, null, null, '', null);
INSERT INTO `menu` VALUES ('34', 'Quản lý Vay Mượn', null, '/borrow/index', null, null, '', null);
INSERT INTO `menu` VALUES ('35', 'Quản lý Mua Bán', null, null, null, null, '', null);
INSERT INTO `menu` VALUES ('36', 'Mua bán chốt hợp đồng', '35', '/formed-bill/index', null, null, '', null);
INSERT INTO `menu` VALUES ('37', 'Mua bán Dài hạn', '35', '/longtime-bill/index', null, null, 'icon-user-unfollow', null);
INSERT INTO `menu` VALUES ('38', 'Quản lý Quê', null, null, null, null, 'icon-screen-smartphone', null);
INSERT INTO `menu` VALUES ('39', 'Nhập kho Quê', '38', '/home-storage-transaction/index', '1', null, 'icon-user-unfollow', null);
INSERT INTO `menu` VALUES ('40', 'Tiền chuyển khác', '31', '/other-transfer/index', null, null, 'icon-user-follow', null);
INSERT INTO `menu` VALUES ('41', 'Gửi quê', '38', '/home-send/index', null, null, 'icon-trophy', null);
INSERT INTO `menu` VALUES ('42', 'Tiền chuyển Quê', '38', '/home-transfer/index', null, null, 'icon-user-following', null);
INSERT INTO `menu` VALUES ('43', 'Mua bán Quê', '38', '/home-trading/index', null, null, 'icon-chemistry', null);
INSERT INTO `menu` VALUES ('44', 'Chuyển khoản Quê', '38', '/home-bank/index', null, null, 'icon-crop', null);
INSERT INTO `menu` VALUES ('45', 'Báo cáo cửa hàng', null, null, null, null, 'icon-user-unfollow', null);
INSERT INTO `menu` VALUES ('46', 'Báo cáo hàng ngày', '45', '/daily-report/index', null, null, 'icon-user-unfollow', null);
INSERT INTO `menu` VALUES ('47', 'Báo cáo Lời lãi', '45', '/view-debt/index', null, null, '', null);
INSERT INTO `menu` VALUES ('48', 'Mua bán Giao ngay', '35', '/fast-bill/index', null, null, '', null);

-- ----------------------------
-- Table structure for original_storage
-- ----------------------------
DROP TABLE IF EXISTS `original_storage`;
CREATE TABLE `original_storage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency_id` bigint(20) DEFAULT NULL,
  `value` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of original_storage
-- ----------------------------

-- ----------------------------
-- Table structure for reference_bill
-- ----------------------------
DROP TABLE IF EXISTS `reference_bill`;
CREATE TABLE `reference_bill` (
  `main_bill` bigint(20) NOT NULL,
  `reference_bill` bigint(20) NOT NULL,
  PRIMARY KEY (`main_bill`,`reference_bill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reference_bill
-- ----------------------------

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `currency_id` bigint(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `storage_currency_idx` (`currency_id`),
  CONSTRAINT `storage_currency_idx` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO `storage` VALUES ('1', 'USD', '992900', '2', '2018-09-30 17:47:58');
INSERT INTO `storage` VALUES ('2', 'VND', '115940326', '1', '2018-09-30 17:48:01');
INSERT INTO `storage` VALUES ('3', 'CAD', '1001600', '3', '2018-09-30 17:48:04');
INSERT INTO `storage` VALUES ('4', 'NDT', '10000', '4', '2018-09-28 17:48:25');
INSERT INTO `storage` VALUES ('5', 'USD', '100', '2', '2018-09-28 17:51:03');
INSERT INTO `storage` VALUES ('6', 'VND', '100000', '1', '2018-09-28 17:51:28');
INSERT INTO `storage` VALUES ('7', 'SNG', '0', '6', '2018-09-30 18:06:55');

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bill_id` bigint(20) DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '1. Mua 2. Ban 3. Nhan tien chuyen, 4. Tra tien chuyen, 5. Vay, 6. Cho vay, 7. Tra ngoai te, 8. Lay ngoai te, 9.Tra VND, 10. Lay VND',
  `currency_id` bigint(20) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `value` double(10,2) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `fee` double(10,2) DEFAULT '0.00',
  `deposit` double(10,2) DEFAULT NULL,
  `exchange_rate` double(10,2) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `real_value` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `transaction_currency_idx` (`currency_id`),
  KEY `transaction_bill` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of transaction
-- ----------------------------
INSERT INTO `transaction` VALUES ('9', '15', '3', '3', '10000', null, '2018-09-12 14:59:14', null, '200.00', null, null, '123', null);
INSERT INTO `transaction` VALUES ('10', '0', '3', '3', '1', null, '2018-09-12 15:26:25', null, '20.00', null, null, '123', null);
INSERT INTO `transaction` VALUES ('11', '0', '3', '3', '1', null, '2018-09-12 15:28:27', null, '20.00', null, null, '0', null);
INSERT INTO `transaction` VALUES ('12', '0', '3', '3', '1', null, '2018-09-12 15:28:44', null, '20.00', null, null, '123', null);
INSERT INTO `transaction` VALUES ('13', '14', '4', '2', '100', null, '2018-09-17 16:14:47', null, null, null, null, 'thêm test', null);
INSERT INTO `transaction` VALUES ('14', '14', '3', '1', '1000000', null, '2018-09-17 20:41:03', null, null, null, null, 'them test 2', null);
INSERT INTO `transaction` VALUES ('15', '11', '1', '1', '100', '-2350000.00', '2018-09-20 20:45:15', null, '0.00', null, '23500.00', 'abc', null);
INSERT INTO `transaction` VALUES ('16', '11', '2', '3', '600', '12000600.00', '2018-09-20 20:45:15', null, '0.00', null, '20001.00', 'them test 2', null);
INSERT INTO `transaction` VALUES ('17', '14', '9', '1', '100000', null, '2018-09-20 22:00:00', null, null, null, null, 'them test 2', null);
INSERT INTO `transaction` VALUES ('18', '16', '4', '3', '100', null, '2018-09-20 22:05:47', null, null, null, null, 'them test 2', null);
INSERT INTO `transaction` VALUES ('19', '13', '4', '2', '-1250', null, '2018-09-20 22:35:09', null, null, null, null, '', null);
INSERT INTO `transaction` VALUES ('20', '13', '9', '1', '-1320000', null, '2018-09-20 22:35:09', null, null, null, null, '', null);
INSERT INTO `transaction` VALUES ('21', '17', '1', '2', '1000', '-25000000.00', '2018-09-22 14:21:16', null, '0.00', null, '25000.00', 'them test 2', null);
INSERT INTO `transaction` VALUES ('22', '17', '2', '3', '2000', '30000000.00', '2018-09-22 14:49:53', null, '0.00', null, '15000.00', 'n', null);
INSERT INTO `transaction` VALUES ('23', '18', '2', '2', '1000', '25000000.00', '2018-09-22 15:36:33', null, '0.00', null, '25000.00', '', null);
INSERT INTO `transaction` VALUES ('24', '7', '6', '2', '1000', null, '2018-09-23 15:07:34', null, '0.00', '500000.00', null, '123', null);
INSERT INTO `transaction` VALUES ('25', '7', '5', '1', '2000', null, '2018-09-23 15:13:25', null, '0.00', '1000000.00', null, '456', null);
INSERT INTO `transaction` VALUES ('26', '19', '3', '1', '100', null, '2018-09-25 21:52:56', null, '25.00', null, null, 'a', '75.00');
INSERT INTO `transaction` VALUES ('27', '21', '4', '2', '1000', null, '2018-09-26 16:45:26', null, '100.00', null, null, 'a', null);
INSERT INTO `transaction` VALUES ('28', '21', '3', '3', '1500', null, '2018-09-26 16:45:26', null, '100.00', null, null, 'b', null);
INSERT INTO `transaction` VALUES ('29', '23', '2', '2', '1000', '23500000.00', '2018-09-26 21:23:18', null, '0.00', null, '23500.00', 'abcabc', null);
INSERT INTO `transaction` VALUES ('30', '23', '1', '3', '100', '-1500000.00', '2018-09-26 21:23:18', null, '0.00', null, '15000.00', 'b', null);
INSERT INTO `transaction` VALUES ('31', '24', '9', null, null, '15000001.00', '2018-09-26 22:48:17', null, '0.00', null, null, 'VP Bank', null);
INSERT INTO `transaction` VALUES ('32', '24', '9', null, null, '100000.00', '2018-09-26 22:48:17', null, '0.00', null, null, 'MB', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `is_first_login` int(1) DEFAULT NULL,
  `last_time_login` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'GVlxMbXE3GiOGQv7E1dWOMNO0pYzgiMf', '$2y$13$KfHZzpI6zbmajOTvcmd5p.U/r3GbBOTl0vbHPTbAFCOzI3NzFXTK.', 'fanebVvAhIvTcuRh3paFt-facoSsPiLS_1513091892', 'admin@gmail.com', '1', '1467446155', '1513091892', '0', '2017-12-12 22:18:11.000000');
INSERT INTO `user` VALUES ('2', 'John', 'K8lrOS1dccJDuEmC4uPN44RRnwN3SNr5', '$2y$13$m6f8EI4szq56sj2NP8c/6.nLHe2rFXBJiK0.SjzcDEZK2pNT3yGTi', '6xPLHGZfZEPUcORiy9OdI3lF0L0LOxcz_1533658699', 'john@doe.com', '1', '1533657074', '1533658699', '0', '2018-08-07 23:18:18.000000');
INSERT INTO `user` VALUES ('3', 'May', 'xuL5_UblgJC9SCPqWhFoCP7UPzJH_LC-', '$2y$13$rctTWtdNzozGOV250vH3/e6fpRTzEeTvHuUrE9MP3pzztR21r8eda', 'bxPiBMi4L0Zg_a39WF7y-Ecj38qtVm58_1533657268', 'may@doe.com', '1', '1533657111', '1533657268', '0', '2018-08-07 22:54:27.000000');

-- ----------------------------
-- Table structure for user_locked
-- ----------------------------
DROP TABLE IF EXISTS `user_locked`;
CREATE TABLE `user_locked` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_locked
-- ----------------------------

-- ----------------------------
-- Table structure for user_login_failed
-- ----------------------------
DROP TABLE IF EXISTS `user_login_failed`;
CREATE TABLE `user_login_failed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login_failed
-- ----------------------------

-- ----------------------------
-- View structure for view_debt
-- ----------------------------
DROP VIEW IF EXISTS `view_debt`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `view_debt` AS select currency_id, customer_id, value, DATE_FORMAT(date,'%Y-%m-%d') as date
 from debt 
order by date desc ;

-- ----------------------------
-- View structure for view_tonkho
-- ----------------------------
DROP VIEW IF EXISTS `view_tonkho`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `view_tonkho` AS select currency_id, quantity, DATE_FORMAT(date,'%Y-%m-%d') as date
 from storage 
order by date desc ;

-- ----------------------------
-- Procedure structure for proc_debt
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_debt`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_debt`(IN `datetime` date)
BEGIN
		select currency_id, customer_id, value,DATE_FORMAT(date,'%Y-%m-%d') as date from (
		select * from debt order by date desc
		) abc 
		where DATE_FORMAT(date,'%y-%m-%d') <= datetime
		group by currency_id, customer_id;
END
;;
DELIMITER ;
