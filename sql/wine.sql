/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : wine

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-01-30 14:12:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for behinduser
-- ----------------------------
DROP TABLE IF EXISTS `behinduser`;
CREATE TABLE `behinduser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `pass_word` varchar(255) NOT NULL,
  `reg_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of behinduser
-- ----------------------------
INSERT INTO `behinduser` VALUES ('13', '12323123', '123', '2018-01-25 09:03:58');
INSERT INTO `behinduser` VALUES ('2', '123', '123', '2018-01-23 10:43:44');
INSERT INTO `behinduser` VALUES ('3', '1234', '666', '2018-01-24 19:30:28');
INSERT INTO `behinduser` VALUES ('4', '123456', '123456', '2018-01-24 19:45:24');
INSERT INTO `behinduser` VALUES ('5', '123231', '123', '2018-01-24 19:54:47');
INSERT INTO `behinduser` VALUES ('6', '34234', '123', '2018-01-24 20:21:39');
INSERT INTO `behinduser` VALUES ('7', '67867', '1234', '2018-01-24 20:24:15');
INSERT INTO `behinduser` VALUES ('8', '123123', '123', '2018-01-24 20:27:10');
INSERT INTO `behinduser` VALUES ('9', '123231231312', '123', '2018-01-24 20:31:08');
INSERT INTO `behinduser` VALUES ('10', '1232313213213', '123', '2018-01-24 20:32:10');
INSERT INTO `behinduser` VALUES ('11', '1232313221312123', '123', '2018-01-24 20:32:49');
INSERT INTO `behinduser` VALUES ('12', '11111', '123', '2018-01-24 20:32:59');
INSERT INTO `behinduser` VALUES ('14', '12345', '12345', '2018-01-25 20:16:01');
INSERT INTO `behinduser` VALUES ('15', '55555', '66666', '2018-01-26 12:09:15');
INSERT INTO `behinduser` VALUES ('16', '123222', '123', '2018-01-26 14:50:21');

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('4', '五粮液A级佳宾级小酒版125ml', '9.00', 'src/img/4.jpg', '1');

-- ----------------------------
-- Table structure for goods_order
-- ----------------------------
DROP TABLE IF EXISTS `goods_order`;
CREATE TABLE `goods_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods` text,
  `total` float(255,0) DEFAULT NULL,
  `type` int(4) NOT NULL DEFAULT '0',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_order
-- ----------------------------
INSERT INTO `goods_order` VALUES ('176', '[{\"id\":4,\"name\":\"五粮液A级佳宾级小酒版125ml\",\"price\":9,\"imgurl\":\"src/img/4.jpg\",\"num\":1}]', '9', '0', '2018-01-30 11:06:04');
INSERT INTO `goods_order` VALUES ('175', '[{\"id\":4,\"name\":\"五粮液A级佳宾级小酒版125ml\",\"price\":9,\"imgurl\":\"src/img/4.jpg\",\"num\":1}]', '9', '1', '2018-01-30 09:19:26');
INSERT INTO `goods_order` VALUES ('174', '[{\"id\":3,\"name\":\"50°金窖西凤酒500ml（2013年）\",\"price\":120,\"imgurl\":\"src/img/3.jpg\",\"num\":2},{\"id\":5,\"name\":\"53°汾酒集团青瓷一坛香1500ml\",\"price\":99,\"imgurl\":\"src/img/26.jpg\",\"num\":1},{\"id\":20,\"name\":\"53°茅台王子500ml+52°习牌特曲丙申年纪念版 500ml\",\"price\":800,\"imgurl\":\"src/img/28.jpg\",\"num\":1}]', '1139', '1', '2018-01-29 19:41:58');
INSERT INTO `goods_order` VALUES ('173', '[{\"id\":3,\"name\":\"50°金窖西凤酒500ml（2013年）\",\"price\":120,\"imgurl\":\"src/img/3.jpg\",\"num\":2},{\"id\":5,\"name\":\"53°汾酒集团青瓷一坛香1500ml\",\"price\":99,\"imgurl\":\"src/img/26.jpg\",\"num\":1}]', '339', '1', '2018-01-26 20:16:11');

-- ----------------------------
-- Table structure for list
-- ----------------------------
DROP TABLE IF EXISTS `list`;
CREATE TABLE `list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `oprice` decimal(10,2) DEFAULT NULL,
  `nprice` decimal(10,2) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `rpt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7778 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of list
-- ----------------------------
INSERT INTO `list` VALUES ('4', '五粮液A级佳宾级小酒版125ml', '9.00', '19.00', 'src/img/4.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('5', '53°汾酒集团青瓷一坛香1500ml', '99.00', '299.00', 'src/img/26.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('6', '53°茅台王子500ml+52°习牌特曲丙申年纪念版 500ml', '800.00', '768.00', 'src/img/6.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('7', '52°全兴头曲·金500ml', '29.00', '79.00', 'src/img/7.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('8', '52°小糊涂神250ml', '30.00', '28.00', 'src/img/1.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('9', '25°习酒习水大曲500ml', '31.00', '29.00', 'src/img/2.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('10', '50°凤酒500ml（2013年）', '120.00', '99.00', 'src/img/25.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('11', '稻花香A级佳宾级小酒版125ml', '29.00', '19.00', 'src/img/4.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('12', '53°汾酒集团青瓷一坛香1500ml', '399.00', '299.00', 'src/img/5.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('13', '肖队精神茅台王子500ml+52°习牌特曲丙申年纪念版 500ml', '800.00', '768.00', 'src/img/6.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('14', '52°全兴头曲·金500ml', '99.00', '79.00', 'src/img/7.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('15', '52°小糊涂神250ml', '46.00', '28.00', 'src/img/1.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('16', '52°肖总大神啊500ml', '31.00', '29.00', 'src/img/2.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('17', '50°金西凤酒500ml（2013年）', '120.00', '99.00', 'src/img/27.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('18', '五粮液股份A级佳宾级小酒版125ml', '29.00', '19.00', 'src/img/4.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('19', '53°汾酒集团青瓷一坛香1500ml', '399.00', '299.00', 'src/img/5.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('20', '53°茅台王子500ml+52°习牌特曲丙申年纪念版 500ml', '800.00', '768.00', 'src/img/28.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('21', '陈总大神啊52°全兴头曲·金500ml', '99.00', '79.00', 'src/img/7.jpg', '白酒', '100');
INSERT INTO `list` VALUES ('22', '法国（原瓶进口）法圣古海堡天使树干红葡萄酒750ml', '180.00', '168.00', 'src/img/8.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('23', '法国狮吼堡（升级版）干红葡萄酒750ml', '200.00', '289.00', 'src/img/9.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('24', '小日本红酒法国(原瓶进口）保罗·菲尔男爵干红葡萄酒750ml', '59.00', '19.00', 'src/img/10.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('25', '西班牙红酒拉伊尔干红葡萄酒750ml', '59.00', '19.00', 'src/img/23.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('26', '路易拉菲2009男爵古堡干红葡萄酒红酒礼盒木盒装 750ml*2', '138.00', '99.00', 'src/img/12.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('27', '南山庄园赤霞珠干红葡萄酒单支装1瓶红酒750ml', '89.00', '69.00', 'src/img/13.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('28', '美国佬红酒（原瓶进口）马得乐干红葡萄酒 750ml*6瓶 整箱', '368.00', '198.00', 'src/img/13.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('29', '法国（原瓶进口）法圣古堡天使树干红葡萄酒750ml', '180.00', '168.00', 'src/img/8.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('30', '法国狮吼堡（升级版）干红葡萄酒750ml', '200.00', '289.00', 'src/img/9.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('31', '红酒法国(原瓶进口）保罗·菲尔男爵干红葡萄酒750ml', '59.00', '19.00', 'src/img/10.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('32', '西班牙红酒拉伊尔干红葡萄酒750ml', '59.00', '19.00', 'src/img/22.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('1234', '123', null, '123.00', null, '123', '123');
INSERT INTO `list` VALUES ('1233', '123', null, '123.00', null, '1231', '123');
INSERT INTO `list` VALUES ('34', '南山庄园赤霞珠干红葡萄酒单支装1瓶红酒750ml', '89.00', '69.00', 'src/img/13.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('35', '法国红酒（原瓶进口）马得乐干红葡萄酒 750ml*6瓶 整箱', '368.00', '198.00', 'src/img/13.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('36', '法国（原瓶进口）法圣古堡天使树干红葡萄酒750ml', '180.00', '168.00', 'src/img/8.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('37', '法国狮吼堡（升级版）干红葡萄酒750ml', '200.00', '289.00', 'src/img/9.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('38', '法国红酒法国(原瓶进口）保罗·菲尔男爵干红葡萄酒750ml', '59.00', '19.00', 'src/img/22.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('39', '西班牙红酒拉伊尔干红葡萄酒750ml', '59.00', '19.00', 'src/img/23.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('40', '路易拉菲2009男爵古堡干红葡萄酒红酒礼盒木盒装 750ml*2', '138.00', '99.00', 'src/img/24.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('41', '南山庄园赤霞珠干红葡萄酒单支装1瓶红酒750ml', '89.00', '69.00', 'src/img/24.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('42', '法国红酒（原瓶进口）马得乐干红葡萄酒 750ml*6瓶 整箱', '368.00', '198.00', 'src/img/13.jpg', '葡萄酒', '50');
INSERT INTO `list` VALUES ('43', '40°英国芝华士12年苏格兰威士忌500ml', '128.00', '108.00', 'src/img/15.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('122', '天蓝酒', '333.00', '100.00', 'src/img/19.jpg', '洋酒', '100');
INSERT INTO `list` VALUES ('45', '人头马CLUB香槟区优质干邑350ml', '259.00', '239.00', 'src/img/17.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('46', '大鼻子（原瓶进口）皇马名仕XO洋酒白兰地700ml*1瓶', '338.00', '158.00', 'src/img/23.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('47', '40°西亚特方瓶威士忌洋酒700ml*1瓶', '99.00', '79.00', 'src/img/19.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('48', '40°法国（原瓶进口）华狮XO洋酒白兰地700ml*1瓶', '598.00', '308.00', 'src/img/20.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('49', '41度梅赛宝威士忌酒正品洋酒高端威士忌700ML 送木礼盒', '108.00', '49.00', 'src/img/21.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('50', '40°英国芝华士12年苏格兰威士忌500ml', '128.00', '108.00', 'src/img/15.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('51', '人头马CLUB350ML+边车礼盒', '348.00', '259.00', 'src/img/16.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('52', '人头马CLUB香槟区干邑350ml', '259.00', '239.00', 'src/img/17.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('53', '40°法国（原瓶进口）皇马名仕XO洋酒白兰地700ml*1瓶', '338.00', '158.00', 'src/img/18.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('54', '西亚特方瓶威士忌洋酒700ml*1瓶', '99.00', '79.00', 'src/img/19.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('55', '40°法国（原瓶进口）华狮XO洋酒白兰地700ml*1瓶', '598.00', '308.00', 'src/img/20.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('56', '41度梅赛宝威士忌酒正品洋酒高端威士忌700ML 送木礼盒', '108.00', '49.00', 'src/img/21.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('57', '英国芝华士12年苏格兰威士忌500ml', '128.00', '108.00', 'src/img/15.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('58', '人头马CLUB350ML+边车礼盒', '348.00', '259.00', 'src/img/16.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('59', '人头马香槟区优质干邑350ml', '259.00', '239.00', 'src/img/17.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('60', '40°法国（原瓶进口）皇马名仕XO洋酒白兰地700ml*1瓶', '338.00', '158.00', 'src/img/18.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('61', '40°西亚特方瓶威士忌洋酒700ml*1瓶', '99.00', '79.00', 'src/img/19.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('62', '40°法国（原瓶进口）华狮XO洋酒白兰地700ml*1瓶', '598.00', '308.00', 'src/img/20.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('63', '41度梅赛宝威士忌酒正品洋酒高端威士忌700ML 送木礼盒', '108.00', '49.00', 'src/img/21.jpg', '洋酒', '50');
INSERT INTO `list` VALUES ('1111', '123', null, '123.00', null, '123', '123');
INSERT INTO `list` VALUES ('123', '123', null, '123123.00', null, '123', '2123');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `reg_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('40', '13428387777', 'a123123', '2018-01-26 16:40:53');
INSERT INTO `user` VALUES ('28', '15218452891', 'abc123', '2018-01-24 19:17:27');
INSERT INTO `user` VALUES ('47', '18522002201', 'aa1234', '2018-01-29 21:12:37');
INSERT INTO `user` VALUES ('46', '18218661430', 'jiao1234', '2018-01-26 19:57:03');
INSERT INTO `user` VALUES ('45', '18317774451', 'z123456', '2018-01-26 16:43:25');
INSERT INTO `user` VALUES ('44', '123', '123', '2018-01-26 16:42:44');
INSERT INTO `user` VALUES ('43', '13428387677', '13428387677', '2018-01-26 19:23:31');
INSERT INTO `user` VALUES ('42', '18522112211', 'aa12345', '2018-01-26 16:41:28');
INSERT INTO `user` VALUES ('41', '13428387775', 'a123123123', '2018-01-26 16:41:23');
INSERT INTO `user` VALUES ('37', '17722864831', 'zzz123456', '2018-01-25 15:20:55');
INSERT INTO `user` VALUES ('36', '13877930274', 'ct123456', '2018-01-25 12:52:30');
INSERT INTO `user` VALUES ('35', '13877930215', 'cy55555', '2018-01-25 12:51:42');
INSERT INTO `user` VALUES ('38', '18522002200', 'aa12345', '2018-01-25 17:58:00');
INSERT INTO `user` VALUES ('39', '13710341587', 'qwe72cce3', '2018-01-26 11:46:32');
INSERT INTO `user` VALUES ('32', '13577830637', 'cy6666', '2018-01-25 12:50:57');
INSERT INTO `user` VALUES ('31', '18707730637', 'xx45234', '2018-01-25 12:11:41');
INSERT INTO `user` VALUES ('30', '13677386753', 'yy66666', '2018-01-25 12:11:22');
INSERT INTO `user` VALUES ('27', '18218661437', 'jiao1234', '2018-01-24 16:26:39');
