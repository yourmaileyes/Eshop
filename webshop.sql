/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : webshop

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2018-11-01 17:56:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `fromid` varchar(255) default NULL,
  `toid` varchar(255) default NULL,
  `context` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `time` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `orde`
-- ----------------------------
DROP TABLE IF EXISTS `orde`;
CREATE TABLE `orde` (
  `orderid` char(255) NOT NULL default '',
  `username` char(255) default NULL,
  `useraddr` char(255) default NULL,
  `price` int(255) default NULL,
  `type` int(50) default NULL,
  `userid` char(255) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orde
-- ----------------------------
INSERT INTO `orde` VALUES ('201811011715301194', 'admin', '北京市海淀区翰林研修学院5排1100', '9631', '2', '20151612204', '1234567891');
INSERT INTO `orde` VALUES ('201811011716101248', 'admin', '北京市海淀区翰林研修学院5排1100', '7774', '1', '20151612204', '321654987');
INSERT INTO `orde` VALUES ('201811011716431902', 'admin', '北京市海淀区翰林研修学院5排1100', '10587', '0', '20151612204', null);

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` char(255) default NULL,
  `productid` int(255) default NULL,
  `number` int(255) default NULL,
  `productname` char(255) default NULL,
  `price` int(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('201811011715301194', '14', '1', 'Apple iPhone X 64GB 深空灰', '6599');
INSERT INTO `orders` VALUES ('201811011715301194', '8', '1', '迪兰（Dataland）RX VEGA56 8G X-Serial战神', '2888');
INSERT INTO `orders` VALUES ('201811011715301194', '15', '1', '华润五丰 特级琯溪蜜柚', '36');
INSERT INTO `orders` VALUES ('201811011715301194', '27', '1', 'SUPOR/苏泊尔电饭煲4L智能家用正品大容量半球电饭锅', '108');
INSERT INTO `orders` VALUES ('201811011716101248', '4', '1', '【现货】蟹知香 长荡湖大闸蟹', '188');
INSERT INTO `orders` VALUES ('201811011716101248', '9', '1', '联想ThinkPad 翼480', '5988');
INSERT INTO `orders` VALUES ('201811011716101248', '18', '1', '统帅（Leader）海尔9公斤变频滚筒洗衣机', '1598');
INSERT INTO `orders` VALUES ('201811011716431902', '26', '1', '苏泊尔电蒸锅多功能家用蒸气锅三层大容量电蒸笼蒸锅蒸菜火锅正品', '299');
INSERT INTO `orders` VALUES ('201811011716431902', '28', '1', '掌阅iReader Smart 超级智能本', '3289');
INSERT INTO `orders` VALUES ('201811011716431902', '29', '1', 'Apple iPhone XR', '6999');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productid` int(255) NOT NULL default '0',
  `name` char(255) default NULL,
  `context` char(255) default NULL,
  `price` int(255) default NULL,
  `addr` char(255) default NULL,
  `type` int(50) default NULL,
  PRIMARY KEY  (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '【经典呵护】锤子（smartisan ) 坚果 Pro 2S', '【经典呵护】锤子（smartisan ) 坚果 Pro 2S 6G+64GB 炫光蓝 全面屏双摄 全网通4G手机 双卡双待 游戏手机', '1598', '锤子科技', '1');
INSERT INTO `product` VALUES ('2', '眼部精华霜', '【多效修护眼霜 11.11爆款直降】眼部精华霜（黑眼圈 去脂肪粒 眼袋 鱼尾纹 植萃珍珠多效眼霜', '30', '达摩美妆护肤', '2');
INSERT INTO `product` VALUES ('3', 'HTC VIVE 智能VR眼镜', '【无线支架套装】HTC VIVE 智能VR眼镜 PCVR 3D头盔', '6299', 'HTC', '0');
INSERT INTO `product` VALUES ('4', '【现货】蟹知香 长荡湖大闸蟹', '【现货】蟹知香 长荡湖大闸蟹 实物活鲜礼盒 现货(公4.0-4.3两 母2.8-3.0两)8只', '188', '知蟹香', '2');
INSERT INTO `product` VALUES ('5', 'ROG游戏手机 8GB+128GB', '【原厂壳+二代补贴】ROG游戏手机 8GB+128GB 骁龙845 液冷散热 全面屏 全网通4G双卡双待', '6188', 'ROG', '1');
INSERT INTO `product` VALUES ('6', '唐诗宋词元曲鉴赏辞典大全集', '唐诗宋词元曲鉴赏辞典大全集八册中国古诗词诗歌诗集唐诗三百首人间词话中国诗词大会推荐原文译文', '30', '天性科技', '2');
INSERT INTO `product` VALUES ('7', '鲜活鲍鱼 500g', '【活鲜】鲜活鲍鱼 500g 15-18头 海鲜水产', '79', '味库', '0');
INSERT INTO `product` VALUES ('8', '迪兰（Dataland）RX VEGA56 8G X-Serial战神', '迪兰（Dataland）RX VEGA56 8G X-Serial战神 1177-1478/1600MHz 8GB/2048-bit HBM2 DX12独立游戏显卡', '2888', '迪兰（Dataland）', '2');
INSERT INTO `product` VALUES ('9', '联想ThinkPad 翼480', '联想ThinkPad 翼480 英特尔8代酷睿14英寸轻薄窄边框笔记本电脑（i7-8550U 8G 128GSSD+1T 2G独显 FHD）银', '5988', '联想', '1');
INSERT INTO `product` VALUES ('10', '天梭(TISSOT)男表机械表力洛克自动机械', '天梭(TISSOT)男表机械表力洛克自动机械1853皮表带钢带多功能瑞士男士手表新款免息分期 【全球联保】T006.407.11.033.00', '2999', '天梭(TISSOT)', '2');
INSERT INTO `product` VALUES ('11', 'Apple Watch Series 3智能手表', 'Apple Watch Series 3智能手表（GPS款 38毫米 深空灰色铝金属表壳 黑色运动型表带 MTF02CH/A）', '1888', 'Apple', '1');
INSERT INTO `product` VALUES ('12', '森歌（SENG）森歌天悦T3Z 集成灶', '森歌（SENG）森歌天悦T3Z 集成灶 侧吸式抽油烟机灶具电蒸箱套装 钢化玻璃台面（T3BZ） 天然气', '9399', '森歌（SENG）', '2');
INSERT INTO `product` VALUES ('13', '拯救者rx50游戏笔记本电脑', '拥有gtx1050ti的显卡让您驰骋沙场～～', '4750', 'Lenovo/联想', '1');
INSERT INTO `product` VALUES ('14', 'Apple iPhone X 64GB 深空灰', 'Apple iPhone X 64GB 深空灰 移动联通电信4G手机 【11.1日开门红 低至6599】A11+M11协处理器-5.8英寸-64GB内存-双面全玻璃-面容识别', '6599', 'Apple', '1');
INSERT INTO `product` VALUES ('15', '华润五丰 特级琯溪蜜柚', '华润五丰 特级琯溪蜜柚 红肉柚子2粒 简致礼盒 2.5-3kg 新鲜水果', '36', '华润五丰', '2');
INSERT INTO `product` VALUES ('16', '佳能 XF305 专业高清摄像机', '佳能 XF305 专业高清摄像机 闪存DV  带夜摄功能', '27999', 'Canon/佳能', '2');
INSERT INTO `product` VALUES ('17', '钢铁侠Mark43半身蓝牙音箱', '香港CAMINO钢铁侠Mark43半身蓝牙音箱|限量366套音响1:1精心复刻', '19999', '香港CAMINO', '2');
INSERT INTO `product` VALUES ('18', '统帅（Leader）海尔9公斤变频滚筒洗衣机', '统帅（Leader）海尔9公斤变频滚筒洗衣机 烫烫净洗 15分钟速洗@G9012BX66G', '1598', '海尔', '1');
INSERT INTO `product` VALUES ('19', '【美版】任天堂 Nintendo Switch NS NX交换机游戏机家用机', '【美版】任天堂 Nintendo Switch NS NX交换机游戏机家用机', '2400', '任天堂', '1');
INSERT INTO `product` VALUES ('20', '三星 Gear Sport S4 智能运动手表', '三星 Gear Sport S4 智能运动手表', '4188', '三星', '2');
INSERT INTO `product` VALUES ('21', '【共4册】傲慢与偏见+简爱+飘', '【共4册】傲慢与偏见+简爱+飘（上下册）傲慢与偏见 世界名著英文原版小说 简爱 英文版', '38', '昂秀图书专营店', '2');
INSERT INTO `product` VALUES ('22', 'Mad Catz 美加狮 PROX 3游戏鼠标 RGB 原相3398 游戏鼠标赛钛客', 'Mad Catz 美加狮 PROX 3游戏鼠标 RGB 原相3398 游戏鼠标赛钛客', '2199', '美洲狮', '2');
INSERT INTO `product` VALUES ('23', '美加狮MadCatz R.A.T PROX美加狮赛钛客激光游戏鼠标变形', '美加狮MadCatz R.A.T PROX美加狮赛钛客激光游戏鼠标变形', '1899', '美洲狮', '2');
INSERT INTO `product` VALUES ('24', 'Microsoft/微软 IO1.1 X08 美行晚期盒装', 'Microsoft/微软 IO1.1 X08 美行晚期盒装', '1900', 'Microsoft微软', '1');
INSERT INTO `product` VALUES ('25', 'Lenovo/联想 拯救者 Y920-17IKB', 'Lenovo/联想 拯救者 Y920-17IKB(i7 7820HK/32GB/1TB HDD+512GB', '19999', 'Lenovo/联想', '1');
INSERT INTO `product` VALUES ('26', '苏泊尔电蒸锅多功能家用蒸气锅三层大容量电蒸笼蒸锅蒸菜火锅正品', '苏泊尔电蒸锅多功能家用蒸气锅三层大容量电蒸笼蒸锅蒸菜火锅正品', '299', '苏泊尔', '2');
INSERT INTO `product` VALUES ('27', 'SUPOR/苏泊尔电饭煲4L智能家用正品大容量半球电饭锅', 'SUPOR/苏泊尔电饭煲4L智能家用正品大容量半球电饭锅2-3-4-5-6人', '108', '苏泊尔', '2');
INSERT INTO `product` VALUES ('28', '掌阅iReader Smart 超级智能本', '掌阅iReader Smart 超级智能本 10.3英寸 电子书 电子纸 阅读器 柔性屏 大屏 墨水屏 灰色', '3289', 'iReader(掌阅)', '1');
INSERT INTO `product` VALUES ('29', ' Apple iPhone XR', ' Apple iPhone XR (A2108) 128GB 蓝色 移动联通电信4G手机 双卡双待', '6999', 'Apple', '1');
INSERT INTO `product` VALUES ('30', '松下ES-WSL7D/SL33 电动剃须刀干湿两剃1小时快速充电剃须刮胡刀', '松下刮胡刀！', '269', '松下', '1');

-- ----------------------------
-- Table structure for `producthome`
-- ----------------------------
DROP TABLE IF EXISTS `producthome`;
CREATE TABLE `producthome` (
  `userid` char(255) default NULL,
  `productid` int(255) default NULL,
  `number` int(50) default NULL,
  `price` int(255) default NULL,
  `productname` char(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of producthome
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` char(255) NOT NULL default '',
  `username` char(255) default NULL,
  `password` char(255) default NULL,
  `type` char(50) default NULL,
  `addr` char(255) default NULL,
  `age` int(255) default NULL,
  `phone` char(255) default NULL,
  `collect` int(255) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('20151612204', 'admin', '123456', 'admin', '北京市海淀区翰林研修学院5排1100', null, '13720955129', '943827');
INSERT INTO `user` VALUES ('201809060814211165', 'admin111', 'admin', null, 'zhaoonaosd', null, '121856548', '500');
INSERT INTO `user` VALUES ('201809070953201806', 'asd', 'asdasd', null, 'asd', null, 'asd', '500');
INSERT INTO `user` VALUES ('201809071025001450', 'lei', '12345', null, '翰林', null, '1212121212', '500');
INSERT INTO `user` VALUES ('201809071124121483', 'zzzz', '123', null, 'fdgdgdg', null, '2324235436546341', '500');
INSERT INTO `user` VALUES ('201809080830161917', '555', '12345', null, '12312313', null, '132132123', '500');
INSERT INTO `user` VALUES ('201809080830521422', 'lei01', '123456', null, '101', null, '18235445172', '5977');
INSERT INTO `user` VALUES ('201809100838331037', 'gdd', '156', null, 'hhg', null, '45', '40878');
INSERT INTO `user` VALUES ('201809101015581033', '111', '123456', null, 'YUNCHENG', null, '1301333013', '430');
INSERT INTO `user` VALUES ('201809101508331093', '110110110', '110110110', null, '110110110', null, '110110110', '480');
INSERT INTO `user` VALUES ('201809101522411294', 'reer', '12', null, '1', null, '12', '470');
INSERT INTO `user` VALUES ('201809101746541146', '123', '123', null, '123', null, '123', '470');
INSERT INTO `user` VALUES ('201809111941241100', 'zz', '123456', null, 'dfdf', null, '1343543535432', '500');
INSERT INTO `user` VALUES ('201809111947411057', '134', '134', null, '134', null, '134', '370');
INSERT INTO `user` VALUES ('201809112003371033', 'gdd123', '123', null, 'df', null, 'sd', '170');
INSERT INTO `user` VALUES ('201809281510201943', 'zzc', 'zzc', 'seller', 'z', null, 'z', '38142');
INSERT INTO `user` VALUES ('201810091500241369', 'aaa', '123', null, '123', null, '15295996666', '99570');
INSERT INTO `user` VALUES ('201810091501051555', 'zqb', 'zqb218', null, '北京翰林研修学院五排110', null, '110', '500000');
