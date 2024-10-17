/*
Navicat MySQL Data Transfer

Source Server         : song
Source Server Version : 80012
Source Host           : 127.0.0.1:3306
Source Database       : layuiminierp

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-09-11 23:54:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bus_customer
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `connectionperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_customer
-- ----------------------------
INSERT INTO `bus_customer` VALUES ('1', '小张超市', '111', '武汉', '027-9123131', '张大明', '138123123123', '中国银行', '654431331343413', '213123@sina.com', '430000', '1');
INSERT INTO `bus_customer` VALUES ('2', '小明超市', '222', '深圳', '0755-9123131', '张小明', '138123123123', '中国银行', '654431331343413', '213123@sina.com', '430000', '1');
INSERT INTO `bus_customer` VALUES ('3', '快七超市', '430000', '武汉', '027-11011011', '雷生', '13434134131', '招商银行', '6543123341334133', '6666@66.com', '545341', '1');
INSERT INTO `bus_customer` VALUES ('5', '33', '33', '333', '333', '333', '333', '333', '333', '333', '333', '1');

-- ----------------------------
-- Table structure for bus_goods
-- ----------------------------
DROP TABLE IF EXISTS `bus_goods`;
CREATE TABLE `bus_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `produceplace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goodspackage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `productcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `promitcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `dangernum` int(11) DEFAULT NULL,
  `goodsimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_sq0btr2v2lq8gt8b4gb8tlk0i` (`providerid`) USING BTREE,
  CONSTRAINT `bus_goods_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_goods
-- ----------------------------
INSERT INTO `bus_goods` VALUES ('1', '娃哈哈', '武汉', '120ML', '瓶', 'PH12345', 'PZ1234', '小孩子都爱的', '2', '1020', '10', 'group1/M00/00/00/rBERvF4oPJeAWSMSAAPqCcdUO-c364.jpg', '1', '3');
INSERT INTO `bus_goods` VALUES ('2', '旺旺雪饼[小包]', '仙桃', '包', '袋', 'PH12312312', 'PZ12312', '好吃不上火', '4', '1000', '10', 'group1/M00/00/00/rBERvF4oPKGAccBoAAPqCcdUO-c964.jpg', '1', '1');
INSERT INTO `bus_goods` VALUES ('3', '旺旺大礼包', '仙桃', '盒', '盒', '11', '11', '111', '28', '1070', '100', 'group1/M00/00/00/rBERvF4oPISAEqhyAAPqCcdUO-c234.jpg', '1', '1');
INSERT INTO `bus_goods` VALUES ('4', '娃哈哈', '武汉', '200ML', '瓶', '11', '111', '12321', '3', '1000', '10', 'group1/M00/00/00/rBERvF4oPGSAC0b5AAPqCcdUO-c622.jpg', '1', '3');
INSERT INTO `bus_goods` VALUES ('5', '娃哈哈', '武汉', '300ML', '瓶', '1234', '12321', '22221111', '3', '1000', '100', 'group1/M00/00/00/rBERvF4oPFKAM7YlAAPqCcdUO-c037.jpg', '1', '3');

-- ----------------------------
-- Table structure for bus_inport
-- ----------------------------
DROP TABLE IF EXISTS `bus_inport`;
CREATE TABLE `bus_inport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `inporttime` datetime DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `inportprice` double DEFAULT NULL,
  `providerid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_1o4bujsyd2kl4iqw48fie224v` (`providerid`) USING BTREE,
  KEY `FK_ho29poeu4o2dxu4rg1ammeaql` (`goodsid`) USING BTREE,
  CONSTRAINT `bus_inport_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`),
  CONSTRAINT `bus_inport_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `bus_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_inport
-- ----------------------------
INSERT INTO `bus_inport` VALUES ('1', '微信', '2018-05-07 00:00:00', '张三', '100', '备注', '3.5', '1', '1');
INSERT INTO `bus_inport` VALUES ('2', '支付宝', '2018-05-07 00:00:00', '张三', '1000', '无', '2.5', '3', '3');
INSERT INTO `bus_inport` VALUES ('3', '银联', '2018-05-07 00:00:00', '张三', '100', '1231', '111', '3', '3');
INSERT INTO `bus_inport` VALUES ('4', '银联', '2018-05-07 00:00:00', '张三', '1000', '无', '2', '3', null);
INSERT INTO `bus_inport` VALUES ('5', '银联', '2018-05-07 00:00:00', '张三', '100', '无', '1', '3', '1');
INSERT INTO `bus_inport` VALUES ('6', '银联', '2018-05-07 00:00:00', '张三', '100', '1231', '2.5', '1', '2');
INSERT INTO `bus_inport` VALUES ('8', '支付宝', '2018-05-07 00:00:00', '张三', '100', '', '1', '3', '1');
INSERT INTO `bus_inport` VALUES ('10', '支付宝', '2018-08-07 17:17:57', '超级管理员', '100', 'sadfasfdsa', '1.5', '3', '1');
INSERT INTO `bus_inport` VALUES ('11', '支付宝', '2018-09-17 16:12:25', '超级管理员', '21', '21', '21', '1', '3');
INSERT INTO `bus_inport` VALUES ('12', '微信', '2018-12-25 16:48:24', '超级管理员', '100', '123213213', '12321321', '3', '1');
INSERT INTO `bus_inport` VALUES ('14', '支付宝', '2019-09-28 03:47:16', '超级管理员', '70', '1111', '4.5', '1', '3');
INSERT INTO `bus_inport` VALUES ('16', '支付宝', '2020-01-13 02:08:23', '超级管理员', '100', '', '0.8', '3', '1');

-- ----------------------------
-- Table structure for bus_outport
-- ----------------------------
DROP TABLE IF EXISTS `bus_outport`;
CREATE TABLE `bus_outport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `outporttime` datetime DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `outportprice` double(10,2) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `inportid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_outport
-- ----------------------------
INSERT INTO `bus_outport` VALUES ('8', '1', '支付宝', '2019-11-16 08:21:43', '超级管理员', '4.50', '10', '坏了', '3', '14');
INSERT INTO `bus_outport` VALUES ('9', '1', '支付宝', '2019-11-16 08:43:06', '超级管理员', '4.50', '10', '111', '3', '14');
INSERT INTO `bus_outport` VALUES ('10', '3', '支付宝', '2020-01-13 02:27:41', '超级管理员', '0.80', '10', '过期了', '1', '16');
INSERT INTO `bus_outport` VALUES ('11', '3', '支付宝', '2020-01-24 04:17:26', '超级管理员', '0.80', '10', '无', '1', '16');

-- ----------------------------
-- Table structure for bus_provider
-- ----------------------------
DROP TABLE IF EXISTS `bus_provider`;
CREATE TABLE `bus_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `connectionperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_provider
-- ----------------------------
INSERT INTO `bus_provider` VALUES ('1', '旺旺食品', '434000', '仙桃', '0728-4124312', '小明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', '1');
INSERT INTO `bus_provider` VALUES ('2', '达利园食品', '430000', '汉川', '0728-4124312', '大明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', '1');
INSERT INTO `bus_provider` VALUES ('3', '娃哈哈集团', '513131', '杭州', '21312', '小晨', '12312', '建设银行', '512314141541', '123131', '312312', '1');

-- ----------------------------
-- Table structure for bus_sales
-- ----------------------------
DROP TABLE IF EXISTS `bus_sales`;
CREATE TABLE `bus_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salestime` datetime DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `saleprice` decimal(10,2) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_sales
-- ----------------------------
INSERT INTO `bus_sales` VALUES ('2', '1', '支付宝', '2020-01-13 07:06:08', '超级管理员', '50', '好人啊', '1.50', '1');
INSERT INTO `bus_sales` VALUES ('3', '1', '支付宝', '2020-01-24 04:58:41', '超级管理员', '10', '好', '2.00', '1');
INSERT INTO `bus_sales` VALUES ('4', '1', '支付宝', '2020-01-24 04:59:22', '超级管理员', '0', 'a', '2.00', '1');

-- ----------------------------
-- Table structure for bus_salesback
-- ----------------------------
DROP TABLE IF EXISTS `bus_salesback`;
CREATE TABLE `bus_salesback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) DEFAULT NULL,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salesbacktime` datetime DEFAULT NULL,
  `salebackprice` double(10,2) DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salesid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bus_salesback
-- ----------------------------
INSERT INTO `bus_salesback` VALUES ('1', '1', '支付宝', '2020-01-13 07:25:22', '1.50', '超级管理员', '50', '好人啊', '2', '1');
INSERT INTO `bus_salesback` VALUES ('2', '1', '支付宝', '2020-01-24 05:12:14', '2.00', '超级管理员', '5', 'a', '4', '1');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(11) DEFAULT NULL COMMENT '父级部门ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
  `spread` int(11) DEFAULT '0' COMMENT '是否展开0不展开1展开',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `available` int(11) DEFAULT NULL COMMENT '状态【0不可用1可用】',
  `ordernum` int(11) DEFAULT NULL COMMENT '排序码【为了调事显示顺序】',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '总经办', '1', '大BOSS', '深圳1', '1', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('2', '1', '销售部', '0', '程序员屌丝', '武汉', '1', '2', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('3', '1', '运营部', '0', '无', '武汉', '1', '3', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('4', '1', '生产部', '0', '无', '武汉', '1', '4', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('5', '2', '销售一部', '0', '销售一部', '武汉', '1', '5', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('6', '2', '销售二部', '0', '销售二部', '武汉', '1', '6', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('7', '3', '运营一部', '0', '运营一部', '武汉', '1', '7', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('8', '2', '销售三部', '0', '销售三部', '11', '1', '8', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('9', '2', '销售四部', '0', '销售四部', '222', '1', '9', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('10', '2', '销售五部', '0', '销售五部', '33', '1', '10', '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES ('35', '4', '生产一部', '0', '生产一部', '武汉', '1', '12', '2019-11-11 11:36:44');
INSERT INTO `sys_dept` VALUES ('38', '3', '运营二部', '0', '运营二部', '运营二部', '1', '13', '2020-01-19 10:11:46');
INSERT INTO `sys_dept` VALUES ('39', '3', '运营三部', '0', '运营三部', '运营三部', '1', '14', '2020-01-19 10:12:57');
INSERT INTO `sys_dept` VALUES ('40', '4', '生产二部', '0', '生产二部', '', '1', '15', '2020-01-19 10:15:48');

-- ----------------------------
-- Table structure for sys_loginfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginfo`;
CREATE TABLE `sys_loginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `loginip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=717 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_loginfo
-- ----------------------------
INSERT INTO `sys_loginfo` VALUES ('555', '超级管理员-system', '127.0.0.1', '2020-01-19 08:27:40');
INSERT INTO `sys_loginfo` VALUES ('556', '超级管理员-system', '127.0.0.1', '2020-01-19 08:51:14');
INSERT INTO `sys_loginfo` VALUES ('557', '超级管理员-system', '127.0.0.1', '2020-01-19 08:54:10');
INSERT INTO `sys_loginfo` VALUES ('558', '超级管理员-system', '127.0.0.1', '2020-01-19 09:40:29');
INSERT INTO `sys_loginfo` VALUES ('559', '超级管理员-system', '127.0.0.1', '2020-01-19 09:40:51');
INSERT INTO `sys_loginfo` VALUES ('560', '超级管理员-system', '127.0.0.1', '2020-01-19 09:52:00');
INSERT INTO `sys_loginfo` VALUES ('561', '超级管理员-system', '127.0.0.1', '2020-01-19 09:56:58');
INSERT INTO `sys_loginfo` VALUES ('562', '超级管理员-system', '127.0.0.1', '2020-01-19 09:57:23');
INSERT INTO `sys_loginfo` VALUES ('563', '超级管理员-system', '127.0.0.1', '2020-01-19 12:21:21');
INSERT INTO `sys_loginfo` VALUES ('564', '超级管理员-system', '127.0.0.1', '2020-01-19 12:21:34');
INSERT INTO `sys_loginfo` VALUES ('565', '超级管理员-system', '127.0.0.1', '2020-01-19 12:22:49');
INSERT INTO `sys_loginfo` VALUES ('566', '超级管理员-system', '127.0.0.1', '2020-01-19 12:24:31');
INSERT INTO `sys_loginfo` VALUES ('567', '超级管理员-system', '127.0.0.1', '2020-01-19 12:33:03');
INSERT INTO `sys_loginfo` VALUES ('568', '超级管理员-system', '127.0.0.1', '2020-01-19 12:33:31');
INSERT INTO `sys_loginfo` VALUES ('569', '超级管理员-system', '127.0.0.1', '2020-01-19 12:33:50');
INSERT INTO `sys_loginfo` VALUES ('570', '超级管理员-system', '127.0.0.1', '2020-01-19 12:34:09');
INSERT INTO `sys_loginfo` VALUES ('571', '超级管理员-system', '127.0.0.1', '2020-01-19 12:36:58');
INSERT INTO `sys_loginfo` VALUES ('572', '超级管理员-system', '127.0.0.1', '2020-01-19 12:37:13');
INSERT INTO `sys_loginfo` VALUES ('573', '超级管理员-system', '127.0.0.1', '2020-01-19 12:37:41');
INSERT INTO `sys_loginfo` VALUES ('574', '超级管理员-system', '127.0.0.1', '2020-01-19 12:44:13');
INSERT INTO `sys_loginfo` VALUES ('575', '超级管理员-system', '127.0.0.1', '2020-01-19 12:49:15');
INSERT INTO `sys_loginfo` VALUES ('576', '超级管理员-system', '127.0.0.1', '2020-01-19 12:51:06');
INSERT INTO `sys_loginfo` VALUES ('577', '超级管理员-system', '127.0.0.1', '2020-01-19 13:07:41');
INSERT INTO `sys_loginfo` VALUES ('578', '超级管理员-system', '127.0.0.1', '2020-01-19 13:08:20');
INSERT INTO `sys_loginfo` VALUES ('579', '超级管理员-system', '127.0.0.1', '2020-01-19 13:08:46');
INSERT INTO `sys_loginfo` VALUES ('580', '超级管理员-system', '127.0.0.1', '2020-01-19 13:10:18');
INSERT INTO `sys_loginfo` VALUES ('581', '超级管理员-system', '127.0.0.1', '2020-01-19 13:10:40');
INSERT INTO `sys_loginfo` VALUES ('582', '超级管理员-system', '127.0.0.1', '2020-01-19 13:11:00');
INSERT INTO `sys_loginfo` VALUES ('583', '超级管理员-system', '127.0.0.1', '2020-01-19 13:11:14');
INSERT INTO `sys_loginfo` VALUES ('584', '超级管理员-system', '127.0.0.1', '2020-01-19 13:12:00');
INSERT INTO `sys_loginfo` VALUES ('585', '超级管理员-system', '127.0.0.1', '2020-01-19 13:15:08');
INSERT INTO `sys_loginfo` VALUES ('586', '超级管理员-system', '127.0.0.1', '2020-01-19 13:40:07');
INSERT INTO `sys_loginfo` VALUES ('587', '超级管理员-system', '127.0.0.1', '2020-01-19 13:40:21');
INSERT INTO `sys_loginfo` VALUES ('588', '超级管理员-system', '127.0.0.1', '2020-01-19 13:46:13');
INSERT INTO `sys_loginfo` VALUES ('589', '超级管理员-system', '127.0.0.1', '2020-01-20 02:41:26');
INSERT INTO `sys_loginfo` VALUES ('590', '超级管理员-system', '127.0.0.1', '2020-01-20 03:27:49');
INSERT INTO `sys_loginfo` VALUES ('591', '超级管理员-system', '127.0.0.1', '2020-01-20 03:30:19');
INSERT INTO `sys_loginfo` VALUES ('592', '超级管理员-system', '127.0.0.1', '2020-01-20 03:31:50');
INSERT INTO `sys_loginfo` VALUES ('593', '超级管理员-system', '127.0.0.1', '2020-01-20 03:33:05');
INSERT INTO `sys_loginfo` VALUES ('594', '超级管理员-system', '127.0.0.1', '2020-01-20 03:34:30');
INSERT INTO `sys_loginfo` VALUES ('595', '超级管理员-system', '127.0.0.1', '2020-01-20 04:28:03');
INSERT INTO `sys_loginfo` VALUES ('596', '超级管理员-system', '127.0.0.1', '2020-01-20 05:01:00');
INSERT INTO `sys_loginfo` VALUES ('597', '超级管理员-system', '127.0.0.1', '2020-01-20 07:58:19');
INSERT INTO `sys_loginfo` VALUES ('598', '超级管理员-system', '127.0.0.1', '2020-01-20 08:09:22');
INSERT INTO `sys_loginfo` VALUES ('599', '超级管理员-system', '127.0.0.1', '2020-01-20 11:02:29');
INSERT INTO `sys_loginfo` VALUES ('600', '超级管理员-system', '127.0.0.1', '2020-01-20 11:03:28');
INSERT INTO `sys_loginfo` VALUES ('601', '超级管理员-system', '127.0.0.1', '2020-01-20 11:09:32');
INSERT INTO `sys_loginfo` VALUES ('602', '超级管理员-system', '127.0.0.1', '2020-01-20 11:24:44');
INSERT INTO `sys_loginfo` VALUES ('603', '超级管理员-system', '127.0.0.1', '2020-01-20 11:25:09');
INSERT INTO `sys_loginfo` VALUES ('604', '超级管理员-system', '127.0.0.1', '2020-01-20 11:31:40');
INSERT INTO `sys_loginfo` VALUES ('605', '超级管理员-system', '127.0.0.1', '2020-01-20 11:48:06');
INSERT INTO `sys_loginfo` VALUES ('606', '超级管理员-system', '127.0.0.1', '2020-01-20 12:22:16');
INSERT INTO `sys_loginfo` VALUES ('607', '超级管理员-system', '127.0.0.1', '2020-01-20 12:59:18');
INSERT INTO `sys_loginfo` VALUES ('608', '超级管理员-system', '127.0.0.1', '2020-01-21 01:12:30');
INSERT INTO `sys_loginfo` VALUES ('609', '超级管理员-system', '127.0.0.1', '2020-01-21 01:12:55');
INSERT INTO `sys_loginfo` VALUES ('610', '超级管理员-system', '127.0.0.1', '2020-01-21 01:14:26');
INSERT INTO `sys_loginfo` VALUES ('611', '超级管理员-system', '127.0.0.1', '2020-01-21 01:24:03');
INSERT INTO `sys_loginfo` VALUES ('612', '超级管理员-system', '127.0.0.1', '2020-01-21 01:34:52');
INSERT INTO `sys_loginfo` VALUES ('613', '超级管理员-system', '127.0.0.1', '2020-01-21 01:35:04');
INSERT INTO `sys_loginfo` VALUES ('614', '超级管理员-system', '127.0.0.1', '2020-01-21 01:39:49');
INSERT INTO `sys_loginfo` VALUES ('615', '超级管理员-system', '127.0.0.1', '2020-01-21 01:41:26');
INSERT INTO `sys_loginfo` VALUES ('616', '超级管理员-system', '127.0.0.1', '2020-01-21 01:42:44');
INSERT INTO `sys_loginfo` VALUES ('617', '超级管理员-system', '127.0.0.1', '2020-01-21 01:43:40');
INSERT INTO `sys_loginfo` VALUES ('618', '超级管理员-system', '127.0.0.1', '2020-01-21 01:48:00');
INSERT INTO `sys_loginfo` VALUES ('619', '超级管理员-system', '127.0.0.1', '2020-01-21 01:53:15');
INSERT INTO `sys_loginfo` VALUES ('620', '超级管理员-system', '127.0.0.1', '2020-01-21 02:00:38');
INSERT INTO `sys_loginfo` VALUES ('621', '超级管理员-system', '127.0.0.1', '2020-01-21 02:00:38');
INSERT INTO `sys_loginfo` VALUES ('622', '超级管理员-system', '127.0.0.1', '2020-01-21 02:02:37');
INSERT INTO `sys_loginfo` VALUES ('623', '超级管理员-system', '127.0.0.1', '2020-01-21 02:35:28');
INSERT INTO `sys_loginfo` VALUES ('624', '超级管理员-system', '127.0.0.1', '2020-01-21 02:40:01');
INSERT INTO `sys_loginfo` VALUES ('625', '超级管理员-system', '127.0.0.1', '2020-01-21 03:15:00');
INSERT INTO `sys_loginfo` VALUES ('626', '超级管理员-system', '127.0.0.1', '2020-01-21 03:15:10');
INSERT INTO `sys_loginfo` VALUES ('627', '超级管理员-system', '127.0.0.1', '2020-01-21 03:16:24');
INSERT INTO `sys_loginfo` VALUES ('628', '超级管理员-system', '127.0.0.1', '2020-01-21 05:13:52');
INSERT INTO `sys_loginfo` VALUES ('629', '超级管理员-system', '127.0.0.1', '2020-01-21 05:49:13');
INSERT INTO `sys_loginfo` VALUES ('630', '超级管理员-system', '127.0.0.1', '2020-01-21 05:51:34');
INSERT INTO `sys_loginfo` VALUES ('631', '超级管理员-system', '127.0.0.1', '2020-01-21 05:53:19');
INSERT INTO `sys_loginfo` VALUES ('632', '超级管理员-system', '127.0.0.1', '2020-01-21 05:58:29');
INSERT INTO `sys_loginfo` VALUES ('633', '超级管理员-system', '127.0.0.1', '2020-01-21 06:14:07');
INSERT INTO `sys_loginfo` VALUES ('634', '李四-ls', '127.0.0.1', '2020-01-21 07:14:55');
INSERT INTO `sys_loginfo` VALUES ('635', '超级管理员-system', '127.0.0.1', '2020-01-21 07:15:52');
INSERT INTO `sys_loginfo` VALUES ('636', '王五-ww', '127.0.0.1', '2020-01-21 07:16:47');
INSERT INTO `sys_loginfo` VALUES ('637', '王五-ww', '127.0.0.1', '2020-01-21 07:18:06');
INSERT INTO `sys_loginfo` VALUES ('638', '超级管理员-system', '127.0.0.1', '2020-01-21 07:20:14');
INSERT INTO `sys_loginfo` VALUES ('639', '赵六-zl', '127.0.0.1', '2020-01-21 07:20:46');
INSERT INTO `sys_loginfo` VALUES ('640', '超级管理员-system', '127.0.0.1', '2020-01-21 07:21:09');
INSERT INTO `sys_loginfo` VALUES ('641', '赵六-zl', '127.0.0.1', '2020-01-21 07:22:19');
INSERT INTO `sys_loginfo` VALUES ('642', '超级管理员-system', '127.0.0.1', '2020-01-21 07:23:18');
INSERT INTO `sys_loginfo` VALUES ('643', '赵六-zl', '127.0.0.1', '2020-01-21 07:24:01');
INSERT INTO `sys_loginfo` VALUES ('644', '超级管理员-system', '127.0.0.1', '2020-01-21 07:24:23');
INSERT INTO `sys_loginfo` VALUES ('645', '超级管理员-system', '127.0.0.1', '2020-01-21 10:07:24');
INSERT INTO `sys_loginfo` VALUES ('646', '超级管理员-system', '127.0.0.1', '2020-01-21 10:20:58');
INSERT INTO `sys_loginfo` VALUES ('647', '超级管理员-system', '127.0.0.1', '2020-01-21 10:23:45');
INSERT INTO `sys_loginfo` VALUES ('648', '李四-ls', '127.0.0.1', '2020-01-21 10:24:19');
INSERT INTO `sys_loginfo` VALUES ('649', '超级管理员-system', '127.0.0.1', '2020-01-21 12:15:23');
INSERT INTO `sys_loginfo` VALUES ('650', '李四-ls', '127.0.0.1', '2020-01-21 12:15:41');
INSERT INTO `sys_loginfo` VALUES ('651', '超级管理员-system', '127.0.0.1', '2020-01-21 12:16:52');
INSERT INTO `sys_loginfo` VALUES ('652', '超级管理员-system', '127.0.0.1', '2020-01-22 01:41:23');
INSERT INTO `sys_loginfo` VALUES ('653', '超级管理员-system', '127.0.0.1', '2020-01-22 01:43:31');
INSERT INTO `sys_loginfo` VALUES ('654', '超级管理员-system', '127.0.0.1', '2020-01-22 01:47:16');
INSERT INTO `sys_loginfo` VALUES ('655', '超级管理员-system', '127.0.0.1', '2020-01-22 02:08:08');
INSERT INTO `sys_loginfo` VALUES ('656', '超级管理员-system', '127.0.0.1', '2020-01-22 02:09:55');
INSERT INTO `sys_loginfo` VALUES ('657', '超级管理员-system', '127.0.0.1', '2020-01-22 02:44:35');
INSERT INTO `sys_loginfo` VALUES ('658', '超级管理员-system', '127.0.0.1', '2020-01-22 02:45:05');
INSERT INTO `sys_loginfo` VALUES ('659', '王五-ww', '127.0.0.1', '2020-01-22 03:04:33');
INSERT INTO `sys_loginfo` VALUES ('660', '超级管理员-system', '127.0.0.1', '2020-01-22 03:05:12');
INSERT INTO `sys_loginfo` VALUES ('661', '王五-ww', '127.0.0.1', '2020-01-22 03:19:34');
INSERT INTO `sys_loginfo` VALUES ('662', '超级管理员-system', '127.0.0.1', '2020-01-22 03:21:11');
INSERT INTO `sys_loginfo` VALUES ('663', '超级管理员-system', '127.0.0.1', '2020-01-22 03:24:08');
INSERT INTO `sys_loginfo` VALUES ('664', '超级管理员-system', '127.0.0.1', '2020-01-22 03:25:08');
INSERT INTO `sys_loginfo` VALUES ('665', '王五-ww', '127.0.0.1', '2020-01-22 03:30:13');
INSERT INTO `sys_loginfo` VALUES ('666', '李四-ls', '127.0.0.1', '2020-01-22 03:30:44');
INSERT INTO `sys_loginfo` VALUES ('667', '超级管理员-system', '127.0.0.1', '2020-01-22 03:31:08');
INSERT INTO `sys_loginfo` VALUES ('668', '超级管理员-system', '127.0.0.1', '2020-01-22 03:34:01');
INSERT INTO `sys_loginfo` VALUES ('669', '超级管理员-system', '127.0.0.1', '2020-01-22 03:34:53');
INSERT INTO `sys_loginfo` VALUES ('670', '超级管理员-system', '127.0.0.1', '2020-01-22 03:35:11');
INSERT INTO `sys_loginfo` VALUES ('671', '超级管理员-system', '127.0.0.1', '2020-01-22 03:35:39');
INSERT INTO `sys_loginfo` VALUES ('672', '超级管理员-system', '127.0.0.1', '2020-01-22 03:36:05');
INSERT INTO `sys_loginfo` VALUES ('673', '超级管理员-system', '127.0.0.1', '2020-01-22 03:36:59');
INSERT INTO `sys_loginfo` VALUES ('674', '超级管理员-system', '127.0.0.1', '2020-01-22 03:37:35');
INSERT INTO `sys_loginfo` VALUES ('675', '超级管理员-system', '127.0.0.1', '2020-01-22 03:42:45');
INSERT INTO `sys_loginfo` VALUES ('676', '超级管理员-system', '127.0.0.1', '2020-01-22 03:52:46');
INSERT INTO `sys_loginfo` VALUES ('677', '超级管理员-system', '127.0.0.1', '2020-01-22 03:53:44');
INSERT INTO `sys_loginfo` VALUES ('678', '超级管理员-system', '127.0.0.1', '2020-01-22 03:58:53');
INSERT INTO `sys_loginfo` VALUES ('679', '超级管理员-system', '127.0.0.1', '2020-01-22 04:04:22');
INSERT INTO `sys_loginfo` VALUES ('680', '超级管理员-system', '127.0.0.1', '2020-01-22 04:39:26');
INSERT INTO `sys_loginfo` VALUES ('681', '李四-ls', '127.0.0.1', '2020-01-22 04:39:43');
INSERT INTO `sys_loginfo` VALUES ('682', '超级管理员-system', '127.0.0.1', '2020-01-22 06:23:02');
INSERT INTO `sys_loginfo` VALUES ('683', '超级管理员-system', '127.0.0.1', '2020-01-22 07:19:00');
INSERT INTO `sys_loginfo` VALUES ('684', '超级管理员-system', '127.0.0.1', '2020-01-22 07:19:17');
INSERT INTO `sys_loginfo` VALUES ('685', '超级管理员-system', '127.0.0.1', '2020-01-22 11:25:11');
INSERT INTO `sys_loginfo` VALUES ('686', '超级管理员-system', '127.0.0.1', '2020-01-22 11:25:48');
INSERT INTO `sys_loginfo` VALUES ('687', '超级管理员-system', '127.0.0.1', '2020-01-22 11:26:45');
INSERT INTO `sys_loginfo` VALUES ('688', '超级管理员-system', '127.0.0.1', '2020-01-22 11:30:51');
INSERT INTO `sys_loginfo` VALUES ('689', '超级管理员-system', '127.0.0.1', '2020-01-22 11:31:45');
INSERT INTO `sys_loginfo` VALUES ('690', '超级管理员-system', '127.0.0.1', '2020-01-22 11:34:04');
INSERT INTO `sys_loginfo` VALUES ('691', '超级管理员-system', '127.0.0.1', '2020-01-22 11:34:47');
INSERT INTO `sys_loginfo` VALUES ('692', '超级管理员-system', '127.0.0.1', '2020-01-22 11:36:28');
INSERT INTO `sys_loginfo` VALUES ('693', '超级管理员-system', '127.0.0.1', '2020-01-22 11:36:29');
INSERT INTO `sys_loginfo` VALUES ('694', '超级管理员-system', '127.0.0.1', '2020-01-22 11:36:46');
INSERT INTO `sys_loginfo` VALUES ('695', '超级管理员-system', '127.0.0.1', '2020-01-22 11:36:48');
INSERT INTO `sys_loginfo` VALUES ('696', '超级管理员-system', '127.0.0.1', '2020-01-22 11:37:35');
INSERT INTO `sys_loginfo` VALUES ('697', '超级管理员-system', '127.0.0.1', '2020-01-22 11:38:11');
INSERT INTO `sys_loginfo` VALUES ('698', '超级管理员-system', '127.0.0.1', '2020-01-22 12:05:27');
INSERT INTO `sys_loginfo` VALUES ('699', '超级管理员-system', '127.0.0.1', '2020-01-23 02:06:46');
INSERT INTO `sys_loginfo` VALUES ('700', '超级管理员-system', '127.0.0.1', '2020-01-23 03:31:19');
INSERT INTO `sys_loginfo` VALUES ('701', '超级管理员-system', '127.0.0.1', '2020-01-23 03:31:37');
INSERT INTO `sys_loginfo` VALUES ('702', '超级管理员-system', '127.0.0.1', '2020-01-23 06:54:01');
INSERT INTO `sys_loginfo` VALUES ('703', '超级管理员-system', '127.0.0.1', '2020-01-23 06:54:28');
INSERT INTO `sys_loginfo` VALUES ('704', '超级管理员-system', '127.0.0.1', '2020-01-23 06:55:36');
INSERT INTO `sys_loginfo` VALUES ('705', '超级管理员-system', '127.0.0.1', '2020-01-24 01:35:03');
INSERT INTO `sys_loginfo` VALUES ('706', '超级管理员-system', '127.0.0.1', '2020-01-24 04:16:35');
INSERT INTO `sys_loginfo` VALUES ('707', '超级管理员-system', '127.0.0.1', '2020-01-24 04:41:11');
INSERT INTO `sys_loginfo` VALUES ('708', '超级管理员-system', '127.0.0.1', '2020-01-24 04:42:28');
INSERT INTO `sys_loginfo` VALUES ('709', '超级管理员-system', '127.0.0.1', '2020-01-24 04:53:41');
INSERT INTO `sys_loginfo` VALUES ('710', '超级管理员-system', '127.0.0.1', '2020-01-24 04:57:53');
INSERT INTO `sys_loginfo` VALUES ('711', '超级管理员-system', '127.0.0.1', '2020-01-24 05:29:12');
INSERT INTO `sys_loginfo` VALUES ('712', '超级管理员-system', '127.0.0.1', '2020-01-24 06:01:04');
INSERT INTO `sys_loginfo` VALUES ('713', '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-01-24 06:02:41');
INSERT INTO `sys_loginfo` VALUES ('714', '赵六-zl', '0:0:0:0:0:0:0:1', '2020-01-24 06:04:57');
INSERT INTO `sys_loginfo` VALUES ('715', '超级管理员-system', '127.0.0.1', '2020-01-24 06:19:05');
INSERT INTO `sys_loginfo` VALUES ('716', '超级管理员-system', '127.0.0.1', '2020-01-24 06:20:15');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(11) DEFAULT NULL COMMENT '父级菜单ID',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型[topmenu/leftmenu/permission]',
  `typecode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'topmenu:system/business\r\npermission:menu:addMenu\r\n',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '连接地址',
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '_self',
  `spread` int(11) DEFAULT NULL COMMENT '是否展开',
  `ordernum` int(11) DEFAULT NULL COMMENT '排序码',
  `available` int(11) DEFAULT NULL COMMENT '状态【0不可用1可用】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', 'topmenu', 'business', '业务管理', 'fa fa-newspaper-o', '', '_self', '0', '2', '1');
INSERT INTO `sys_menu` VALUES ('2', '0', 'topmenu', 'system', '系统管理', 'fa fa-gear', '', '_self', '1', '1', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', 'leftmenu', 'business', '基础数据管理', 'fa fa-gear', '', '_self', '0', '3', '1');
INSERT INTO `sys_menu` VALUES ('4', '1', 'leftmenu', 'business', '进货管理', 'fa fa-gear', '', '_self', '0', '4', '1');
INSERT INTO `sys_menu` VALUES ('5', '1', 'leftmenu', 'business', '销售管理', 'fa fa-gear', '', '_self', '0', '5', '1');
INSERT INTO `sys_menu` VALUES ('6', '3', 'leftmenu', 'business', '客户管理', 'fa fa-gear', 'resources/page/business/customer/customerManager.html', '_self', '0', '6', '1');
INSERT INTO `sys_menu` VALUES ('7', '3', 'leftmenu', 'business', '供应商管理', 'fa fa-gear', 'resources/page/business/provider/providerManager.html', '_self', '0', '7', '1');
INSERT INTO `sys_menu` VALUES ('8', '3', 'leftmenu', 'business', '商品管理', 'fa fa-gear', 'resources/page/business/goods/goodsManager.html', '_self', '0', '8', '1');
INSERT INTO `sys_menu` VALUES ('9', '4', 'leftmenu', 'business', '商品进货', 'fa fa-gear', 'resources/page/business/inport/inportManager.html', '_self', '0', '9', '1');
INSERT INTO `sys_menu` VALUES ('10', '4', 'leftmenu', 'business', '商品退货查询', 'fa fa-gear', 'resources/page/business/outport/outportManager.html', '_self', '0', '10', '1');
INSERT INTO `sys_menu` VALUES ('11', '5', 'leftmenu', 'business', '商品销售', 'fa fa-gear', 'resources/page/business/sales/salesManager.html', '_self', '0', '11', '1');
INSERT INTO `sys_menu` VALUES ('12', '5', 'leftmenu', 'business', '销售退货查询', 'fa fa-gear', 'resources/page/business/salesback/salesbackManager.html', '_self', '0', '12', '1');
INSERT INTO `sys_menu` VALUES ('13', '2', 'leftmenu', 'system', '系统管理', 'fa fa-gear', '', '_self', '1', '13', '1');
INSERT INTO `sys_menu` VALUES ('14', '2', 'leftmenu', 'system', '其它管理', 'fa fa-gear', '', '_self', '0', '14', '1');
INSERT INTO `sys_menu` VALUES ('15', '13', 'leftmenu', 'system', '部门管理', 'fa fa-gear', 'resources/page/system/dept/deptManager.html', '_self', '0', '15', '1');
INSERT INTO `sys_menu` VALUES ('16', '13', 'leftmenu', 'system', '菜单管理', 'fa fa-gear', 'resources/page/system/menu/menuManager.html', '_self', '0', '16', '1');
INSERT INTO `sys_menu` VALUES ('17', '13', 'leftmenu', 'system', '角色管理', 'fa fa-gear', 'resources/page/system/role/roleManager.html', '_self', '0', '17', '1');
INSERT INTO `sys_menu` VALUES ('18', '13', 'leftmenu', 'system', '用户管理', 'fa fa-gear', 'resources/page/system/user/userManager.html', '_self', '0', '18', '1');
INSERT INTO `sys_menu` VALUES ('19', '14', 'leftmenu', 'system', '登陆日志', 'fa fa-gear', 'resources/page/system/loginfo/loginfoManager.html', '_self', '0', '19', '1');
INSERT INTO `sys_menu` VALUES ('20', '14', 'leftmenu', 'system', '数据源监控', 'fa fa-gear', 'http://127.0.0.1:8080/druid/', '_self', '0', '20', '1');
INSERT INTO `sys_menu` VALUES ('21', '14', 'leftmenu', 'system', '系统公告', 'fa fa-gear', 'resources/page/system/notice/noticeManager.html', '_self', '0', '21', '1');
INSERT INTO `sys_menu` VALUES ('22', '14', 'leftmenu', 'system', '图标管理', 'fa fa-gear', 'resources/page/system/common/icon.html', '_self', '0', '22', '1');
INSERT INTO `sys_menu` VALUES ('23', '6', 'permission', 'customer:query', '客户查询', null, null, '_self', null, '23', '1');
INSERT INTO `sys_menu` VALUES ('24', '6', 'permission', 'customer:add', '客户添加', null, null, '_self', null, '24', '1');
INSERT INTO `sys_menu` VALUES ('25', '6', 'permission', 'customer:delete', '客户删除', null, null, '_self', null, '25', '1');
INSERT INTO `sys_menu` VALUES ('26', '6', 'permission', 'customer:update', '客户更新', null, null, '_self', null, '26', '1');
INSERT INTO `sys_menu` VALUES ('32', '15', 'permission', 'dept:add', '部门添加', '', '', '_self', '0', '27', '1');
INSERT INTO `sys_menu` VALUES ('33', '15', 'permission', 'dept:update', '部门修改', '', '', '_self', '0', '28', '1');
INSERT INTO `sys_menu` VALUES ('34', '15', 'permission', 'dept:delete', '部门删除', '', '', '_self', '0', '29', '1');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `createtime` datetime DEFAULT NULL,
  `opername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '关于系统V1.3更新公告', '2111<p><br></p>', '2018-08-07 00:00:00', '管理员');
INSERT INTO `sys_notice` VALUES ('23', '关于系统V1.4更新公告', '<h1>关于系统V1.4更新公告</h1>', '2020-01-18 13:50:18', '超级管理员');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `available` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '拥有所有菜单权限', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('4', '基础数据管理员', '基础数据管理员', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('5', '仓库管理员', '仓库管理员', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('6', '销售管理员', '销售管理员', '1', '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES ('7', '系统管理员', '系统管理员', '1', '2019-04-10 14:06:32');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `rid` int(11) NOT NULL COMMENT '角色外键',
  `mid` int(11) NOT NULL COMMENT '菜单外键',
  PRIMARY KEY (`mid`,`rid`) USING BTREE,
  KEY `FK_tcsr9ucxypb3ce1q5qngsfk33` (`rid`) USING BTREE,
  CONSTRAINT `sys_role_menu_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sys_role_menu_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '25');
INSERT INTO `sys_role_menu` VALUES ('1', '26');
INSERT INTO `sys_role_menu` VALUES ('1', '32');
INSERT INTO `sys_role_menu` VALUES ('4', '1');
INSERT INTO `sys_role_menu` VALUES ('4', '3');
INSERT INTO `sys_role_menu` VALUES ('4', '4');
INSERT INTO `sys_role_menu` VALUES ('4', '5');
INSERT INTO `sys_role_menu` VALUES ('4', '6');
INSERT INTO `sys_role_menu` VALUES ('4', '7');
INSERT INTO `sys_role_menu` VALUES ('4', '8');
INSERT INTO `sys_role_menu` VALUES ('4', '9');
INSERT INTO `sys_role_menu` VALUES ('4', '10');
INSERT INTO `sys_role_menu` VALUES ('4', '11');
INSERT INTO `sys_role_menu` VALUES ('4', '12');
INSERT INTO `sys_role_menu` VALUES ('4', '23');
INSERT INTO `sys_role_menu` VALUES ('4', '24');
INSERT INTO `sys_role_menu` VALUES ('4', '25');
INSERT INTO `sys_role_menu` VALUES ('4', '26');
INSERT INTO `sys_role_menu` VALUES ('5', '1');
INSERT INTO `sys_role_menu` VALUES ('5', '3');
INSERT INTO `sys_role_menu` VALUES ('5', '6');
INSERT INTO `sys_role_menu` VALUES ('5', '7');
INSERT INTO `sys_role_menu` VALUES ('5', '8');
INSERT INTO `sys_role_menu` VALUES ('5', '23');
INSERT INTO `sys_role_menu` VALUES ('5', '24');
INSERT INTO `sys_role_menu` VALUES ('5', '25');
INSERT INTO `sys_role_menu` VALUES ('5', '26');
INSERT INTO `sys_role_menu` VALUES ('6', '1');
INSERT INTO `sys_role_menu` VALUES ('6', '3');
INSERT INTO `sys_role_menu` VALUES ('6', '4');
INSERT INTO `sys_role_menu` VALUES ('6', '5');
INSERT INTO `sys_role_menu` VALUES ('6', '6');
INSERT INTO `sys_role_menu` VALUES ('6', '7');
INSERT INTO `sys_role_menu` VALUES ('6', '8');
INSERT INTO `sys_role_menu` VALUES ('6', '9');
INSERT INTO `sys_role_menu` VALUES ('6', '10');
INSERT INTO `sys_role_menu` VALUES ('6', '11');
INSERT INTO `sys_role_menu` VALUES ('6', '12');
INSERT INTO `sys_role_menu` VALUES ('6', '23');
INSERT INTO `sys_role_menu` VALUES ('6', '24');
INSERT INTO `sys_role_menu` VALUES ('6', '25');
INSERT INTO `sys_role_menu` VALUES ('6', '26');
INSERT INTO `sys_role_menu` VALUES ('7', '2');
INSERT INTO `sys_role_menu` VALUES ('7', '13');
INSERT INTO `sys_role_menu` VALUES ('7', '14');
INSERT INTO `sys_role_menu` VALUES ('7', '16');
INSERT INTO `sys_role_menu` VALUES ('7', '17');
INSERT INTO `sys_role_menu` VALUES ('7', '18');
INSERT INTO `sys_role_menu` VALUES ('7', '19');
INSERT INTO `sys_role_menu` VALUES ('7', '20');
INSERT INTO `sys_role_menu` VALUES ('7', '21');
INSERT INTO `sys_role_menu` VALUES ('7', '22');

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `rid` int(11) NOT NULL COMMENT '角色外键',
  `uid` int(11) NOT NULL COMMENT '用户外键',
  PRIMARY KEY (`uid`,`rid`) USING BTREE,
  KEY `FK_203gdpkwgtow7nxlo2oap5jru` (`rid`) USING BTREE,
  CONSTRAINT `sys_role_user_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `sys_role_user_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES ('1', '2');
INSERT INTO `sys_role_user` VALUES ('4', '3');
INSERT INTO `sys_role_user` VALUES ('6', '4');
INSERT INTO `sys_role_user` VALUES ('7', '5');
INSERT INTO `sys_role_user` VALUES ('7', '6');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆名',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `deptid` int(11) DEFAULT NULL COMMENT '部门ID',
  `hiredate` datetime DEFAULT NULL COMMENT '入职时间',
  `ordernum` int(11) DEFAULT NULL,
  `type` int(255) DEFAULT NULL COMMENT '用户类型[0超级管理员1普通用户]',
  `imgpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像地址',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '盐',
  `available` int(11) DEFAULT '1' COMMENT ' 是否可用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `sys_user_loginname` (`loginname`) USING BTREE,
  KEY `FK_3rrcpvho2w1mx1sfiuuyir1h` (`deptid`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `sys_dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '超级管理员', 'system', '系统深处的男人', '0', '超级管理员', '532ac00e86893901af5f0be6b704dbc7', '1', '2018-06-25 11:06:34', '1', '0', 'group1/M00/00/00/rBERvF4n0h2AQLQTAAPqCcdUO-c702.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB', '1');
INSERT INTO `sys_user` VALUES ('2', '李四', 'ls', '武汉', '0', 'KING', '603ee4eba475338154cad1c5167a4f88', '1', '2018-06-25 11:06:36', '2', '1', 'group1/M00/00/00/rBERvF4n0h2AQLQTAAPqCcdUO-c702.jpg', 'ef5ce3e8cc7f492d8705ce0231034f38', '1');
INSERT INTO `sys_user` VALUES ('3', '王五', 'ww', '武汉', '1', '管理员', '3c3f971eae61e097f59d52360323f1c8', '3', '2018-06-25 11:06:38', '3', '1', 'group1/M00/00/00/rBERvF4n0h2AQLQTAAPqCcdUO-c702.jpg', '3D5F956E053C4E85B7D2681386E235D2', '1');
INSERT INTO `sys_user` VALUES ('4', '赵六', 'zl', '武汉', '1', '程序员', '2e969742a7ea0c7376e9551d578e05dd', '3', '2020-01-20 16:00:00', '4', '1', 'group1/M00/00/00/rBERvF4n0h2AQLQTAAPqCcdUO-c702.jpg', '6480EE1391E34B0886ACADA501E31145', '1');
INSERT INTO `sys_user` VALUES ('5', '孙七', 'sq', '武汉', '1', '程序员', '47b4c1ad6e4b54dd9387a09cb5a03de1', '2', '2018-06-25 11:06:43', '5', '1', 'group1/M00/00/00/rBERvF4n0h2AQLQTAAPqCcdUO-c702.jpg', 'FE3476C3E3674E5690C737C269FCBF8E', '1');
INSERT INTO `sys_user` VALUES ('6', '刘八', 'lb', '深圳', '1', '程序员', 'bcee2b05b4b591106829aec69a094806', '4', '2018-08-06 11:21:12', '6', '1', 'group1/M00/00/00/rBERvF4n0h2AQLQTAAPqCcdUO-c702.jpg', 'E6CCF54A09894D998225878BBD139B20', '1');
INSERT INTO `sys_user` VALUES ('8', '习大大', 'xidada', '北京', '1', '北京', '8b534f129a6289c1f5b7771acf9aa740', '7', '2019-09-25 08:47:38', '7', '1', 'group1/M00/00/00/rBERvF4n0h2AQLQTAAPqCcdUO-c702.jpg', 'eda619b14a2544a5a68d9611556dee89', '1');
