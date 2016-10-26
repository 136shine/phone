-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-07-14 04:49:52
-- 服务器版本： 5.5.28
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `phone`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(20) NOT NULL,
  `Apassword` varchar(50) NOT NULL,
  `Aemail` varchar(20) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`a_id`, `adminName`, `Apassword`, `Aemail`) VALUES
(1, 'admin', 'admin', '123@qq.com');

-- --------------------------------------------------------

--
-- 表的结构 `car`
--

CREATE TABLE IF NOT EXISTS `car` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `Uid` int(11) NOT NULL,
  `pu_id` int(11) NOT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `car`
--

INSERT INTO `car` (`car_id`, `Uid`, `pu_id`) VALUES
(1, 1, 1),
(7, 1, 1),
(8, 1, 3),
(9, 1, 3),
(10, 1, 5),
(11, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `de_instroduction`
--

CREATE TABLE IF NOT EXISTS `de_instroduction` (
  `de_id` int(11) NOT NULL AUTO_INCREMENT,
  `pu_id` int(11) NOT NULL,
  `version` varchar(200) NOT NULL,
  `run_store` varchar(20) NOT NULL,
  `store` varchar(20) NOT NULL,
  `color` varchar(20) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`de_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `de_instroduction`
--

INSERT INTO `de_instroduction` (`de_id`, `pu_id`, `version`, `run_store`, `store`, `color`, `price`) VALUES
(1, 1, '华为（EVA-AL00）（移动联通电信4G）', '3GB', '32GB', '金色', 3188),
(3, 2, '华为（PLK-AL10）（全网通）', '3GB', '64GB', '荣耀金', 1999),
(5, 3, '红米Note3（高配版全网通）', '3GB', '32GB', '金色', 1099),
(7, 4, '小米MAX（标准版）', '3GB', '32GB', '金色', 1499),
(9, 5, '小米手机 5（标准版，裸机）', '3GB', '32GB', '白色', 1999),
(11, 6, 'Mate8 3GB+32GB版 全网通', '3GB', '32GB', '月光色', 2799),
(13, 7, 'iPhone 6S Plus', '2GB', '16GB', '银色', 5688),
(15, 8, 'iPhone 5s', '2GB', '16GB', '金属灰', 2198),
(17, 9, '魅蓝metal', '2GB', '16GB', '白色', 899),
(19, 10, '魅族MX5', '3GB', '16GB', '银黑', 1399),
(21, 11, '三星SM-C5000', '4GB', '32GB', '枫叶金', 2199),
(23, 12, '三星N9100', '3GB', '16GB', '幻影白', 2099),
(25, 13, '乐视X620', '3GB', '32GB', '金色', 1099),
(27, 14, '乐2Pro', '4GB', '32GB', '金色', 1399);

-- --------------------------------------------------------

--
-- 表的结构 `pics`
--

CREATE TABLE IF NOT EXISTS `pics` (
  `pic_id` int(4) NOT NULL AUTO_INCREMENT,
  `pu_id` int(4) NOT NULL,
  `pics` varchar(255) NOT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

--
-- 转存表中的数据 `pics`
--

INSERT INTO `pics` (`pic_id`, `pu_id`, `pics`, `type`) VALUES
(1, 1, '1.1.png', 1),
(2, 1, '1.2.png', 1),
(6, 2, '2.4.png', 1),
(7, 2, '2.5.png', 1),
(10, 3, '3.3.png', 2),
(11, 3, '3.4.png', 2),
(12, 4, '4.1.png', 2),
(13, 4, '4.2.png', 2),
(14, 4, '4.3.png', 2),
(15, 5, '5.1.png', 2),
(16, 5, '5.2.png', 2),
(17, 5, '5.3.png', 2),
(18, 6, '6.1.png', 1),
(19, 6, '6.2.png', 1),
(20, 6, '6.3.png', 1),
(21, 6, '6.4.png', 1),
(22, 7, '7.1.png', 3),
(23, 7, '7.2.png', 3),
(24, 7, '7.3.png', 3),
(25, 7, '7.4.png', 3),
(26, 7, '7.5.png', NULL),
(27, 8, '8.1.png', NULL),
(28, 8, '8.2.png', NULL),
(29, 8, '8.3.png', NULL),
(30, 8, '8.4.png', NULL),
(31, 8, '8.5.png', NULL),
(32, 9, '9.1.png', NULL),
(33, 9, '9.2.png', NULL),
(34, 9, '9.3.png', NULL),
(35, 9, '9.4.png', NULL),
(36, 9, '9.5.png', NULL),
(37, 10, '10.1.png', NULL),
(38, 10, '10.2.png', NULL),
(39, 10, '10.3.png', NULL),
(40, 10, '10.4.png', NULL),
(41, 10, '10.5.png', NULL),
(42, 11, '11.1.png', NULL),
(43, 11, '11.2.png', NULL),
(44, 11, '11.3.png', NULL),
(45, 11, '11.4.png', NULL),
(46, 11, '11.5.png', NULL),
(47, 12, '12.1.png', NULL),
(48, 12, '12.2.png', NULL),
(49, 12, '12.3.png', NULL),
(50, 12, '12.4.png', NULL),
(51, 12, '12.5.png', NULL),
(52, 13, '13.1.png', NULL),
(53, 13, '13.2.png', NULL),
(54, 13, '13.3.png', NULL),
(55, 13, '13.4.png', NULL),
(56, 13, '13.5.png', NULL),
(57, 14, '14.1.png', NULL),
(58, 14, '14.2.png', NULL),
(59, 14, '14.3.png', NULL),
(60, 14, '14.4.png', NULL),
(61, 14, '14.5.png', NULL),
(62, 0, 'heimei.jpg', NULL),
(63, 0, 'htc.jpg', NULL),
(64, 0, 'huawei.jpg', 1),
(65, 0, 'iphone.jpg', 3),
(66, 0, 'kupai.png', NULL),
(67, 0, 'lg.jpg', NULL),
(68, 0, 'meizu.jpg', 4),
(69, 0, 'mi.jpg', 2),
(70, 0, 'mo.jpg', NULL),
(71, 0, 'oppo.jpg', NULL),
(72, 0, 'sanxing.jpg', 5),
(73, 0, 'vivo.jpg', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `pu_instroduction`
--

CREATE TABLE IF NOT EXISTS `pu_instroduction` (
  `pu_id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pixel` varchar(255) NOT NULL,
  `ratio` varchar(255) NOT NULL,
  `system` varchar(255) NOT NULL,
  `pics` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `type` int(1) DEFAULT NULL,
  `internet` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `menu` varchar(255) NOT NULL,
  `afterSold` varchar(255) NOT NULL,
  `version` varchar(200) DEFAULT NULL,
  `runstore` varchar(200) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `pu_instroduction`
--

INSERT INTO `pu_instroduction` (`pu_id`, `name`, `pixel`, `ratio`, `system`, `pics`, `brand`, `type`, `internet`, `size`, `menu`, `afterSold`, `version`, `runstore`, `price`) VALUES
(1, '华为 P9 全网通 3GB+32GB版 流光金 移动联通电信4G手机 双卡双待', '后置摄像头：双1200万像素，前置摄像头：800万像素', '1920×1080(FHD,1080P)', '安卓（Android）', '1.2s.png', '华为（HUAWEI)', 1, '移动4G/联通4G/电信4G', '5.2英寸', '手机(电池(内置) x 1、中式充电器 x 1、数据线(Type-C头) x 1、半入耳式线控耳机 x 1、点纹透明保护壳 x 1、快速指南 x 1、华为手机三包凭证 x 1、取卡针 x 1、金卡会员卡 x 1', '本产品全国联保，享受三包服务，质保期为：一年质保', '华为（EVA-AL00）', '3GB', '3188'),
(2, '荣耀7 (PLK-AL10) 3GB+64GB内存版 荣耀金 移动联通电信4G手机 双卡双待双通', '后置摄像头：双2000万像素，前置摄像头：800万像素', '1920×1080(FHD,1080P)', '安卓（Android）', '2.1s.png', '华为（HUAWEI)', 1, '移动4G/联通4G/电信4G', '5.2英寸', '手机 x 1，充电器 x 1，USB线 x 1，快速指南 x 1，华为手机三包凭证 x 1，捅针 x 1，华为手机会员金卡 x 1，荣耀智灵功能宣传卡 x 1，100天手机无忧碎屏险卡 x 1', '本产品全国联保，享受三包服务，质保期为：一年质保', '华为（PLK-AL10）（全网通）', '3GB', '1999'),
(3, '小米 红米Note3 高配全网通版 3GB+32GB 金色 移动联通电信4G手机 双卡双待', '后置摄像头：双1600万像素，前置摄像头：800万像素', '1920×1080(FHD,1080P)', '安卓（Android）', '3.2s.png', '小米（MI）', 2, '移动4G/联通4G/电信4G', '5.5英寸', '手机主机x1、电源适配器x1、数据线x1', '本产品全国联保，享受三包服务，质保期为：一年质保', '红米Note3', '3GB', '1099'),
(4, '小米 Max 全网通 标准版 3GB内存 32GB ROM 金色 移动联通电信4G手机', '后置摄像头：双1600万像素，前置摄像头：500万像素', '1920×1080(FHD,1080P)', '安卓（Android）', '4.1s.png', '小米（MI）', 2, '移动4G/联通4G/电信4G', '6.44英寸', '手机主机×1、电源适配器×1、USB 数据线×1、三包凭证×1、入门指南×1、插针×1', '本产品全国联保，享受三包服务，质保期为：一年质保', '小米MAX（标准版）', '3GB', '1499'),
(5, '小米5 全网通 高配版 3GB内存 64GB ROM 白色 移动联通电信4G手机', '后置摄像头：双1600万像素，前置摄像头：400万像素', '1920×1080(FHD,1080P)', '安卓（Android）', '5.1s.png', '小米（MI）', 2, '移动4G/联通4G/电信4G', '5.15英寸', '手机主机×1 、电源适配器、USB Type-c数据线×1', '本产品全国联保，享受三包服务，质保期为：一年质保', '小米手机 5（标准版，裸机）', '3GB', '1999'),
(6, '华为Mate8 4G智能手机 月光银 全网通 (3G RAM+32G ROM) 标配', '后置摄像头：双1600万像素，前置摄像头：800万像素', '1920×1080(FHD,1080P)', '安卓（Android）', '6.1s.png', '华为（HUAWEI）', 1, '移动4G/联通4G/电信4G', '6.0英寸', '主机 x 1 充电器 x1 2A数据线 x1 快速指南 x1 华为手机三包凭证 x1 取卡针 x1 金卡会员卡 x1', '本产品全国联保，享受三包服务，质保期为：一年质保', 'Mate8 3GB+32GB版 移动版', '3GB', '2799'),
(7, 'Apple iPhone 6s Plus (A1699) 64G 深空灰 色 移动联通电信4G手机', '1200万像素', '1920×1080(FHD,1080P)', '苹果（IOS）', '7.3s.png', '苹果（Apple）', 3, '移动4G/联通4G/电信4G', '5.5英寸', 'iPhone 6S Plus*1；具有线控功能和麦克风的 Apple EarPods*1；Lightning to USB 连接线*1；USB 电源适配器*1', '本产品全国联保，享受三包服务，质保期为：一年质保', 'iPhone 6S Plus', '3GB', '5688'),
(8, 'Apple iPhone 5s (A1530) 16GB 银色 移动联通4G手机', '800万像素', '1136×640', '苹果（IOS）', '8.2s.png', '苹果（Apple）', 3, '移动4G(TD-LTE)/联通4G(TD-LTE)', '4.0英寸', 'iPhone 5s×1；具有线控功能和麦克风的 Apple EarPods×1；Lightning to USB 连接线×1；USB电源适配器×1；三包凭证×1；卡针×1', '本产品全国联保，享受三包服务，质保期为：一年质保', 'iPhone 5s', '3GB', '2198'),
(9, '魅族 魅蓝metal 16GB 白色 移动联通双4G手机 双卡双待', '1300万像素', ' 1920×1080(FHD,1080P)', 'Flyme os', '9.1s.png', '魅族（MEIZU）', 4, '移动4G/联通4G(TD-LTE)/联通4G(FDD-LTE)', '5.5英寸', 'MX5 手机主机 × 1 USB数据线 × 1 电源适配器 × 1 SIM 卡顶针× 1保修证书 × 1', '本产品全国联保，享受三包服务，质保期为：一年质保', '魅蓝metal', '3GB', '899'),
(10, ' MX5 16GB 4G', '2070???', '1920×1080(FHD,1080P)', 'Flyme os', '10.1s.png', 'MEIZU', 4, '??4G/??4G(TD-LTE)/??4G(FDD-LTE)', '5.5??', 'MX5 ???? × 1 USB??? × 1 ????? × 1 SIM ???× 1???? × 1', '????????????????????????', '??MX5', '3GB', '1399'),
(11, '三星 Galaxy C5（SM-C5000）64G版 皎洁银 移动联通电信4G手机 双卡双待', '1600万像素', '1920×1080(FHD,1080P)', '安卓（Android）', '11.1s.png', '三星（SAMSUNG）', 5, '移动/联通/电信', '5.2英寸', '手机*1；充电器*1；耳机*1；数据线*1；卡针*1；保修卡*1；说明书*1', '本产品全国联保，享受三包服务，质保期为：一年质保', '三星SM-C5000', '3GB', '2199'),
(12, '三星 Galaxy Note4 (N9100) 幻影白 移动联通4G手机 双卡双待', '1600万像素', '2560×1440（2K）', '安卓（Android）', '12.2s.png', '三星（SAMSUNG）', 5, '移动4G/联通4G', '5.7英寸', '主机*1 锂电池*1 数据线*1 耳机*1 充电器*1 S Pen手写笔*1 说明书*1 保修卡*1', '本产品全国联保，享受三包服务，质保期为：一年质保', '三星N9100', '3GB', '2099'),
(13, '乐视（Le）乐2（X620）32GB 金色 移动联通电信4G手机 双卡双待', '1600万像素', '1920×1080(FHD,1080P)', '安卓（Android）', '13.3s.png', '乐视（Letv）', 6, '移动4G/联通4G/电信4G', '5.5英寸', '主机×1，电源适配器×1，耳机转接头×1，数据线×1，卡针×1，三包证×1，快速入门指南×1', '本产品全国联保，享受三包服务，质保期为：一年质保', '乐视X620', '3GB', '1099'),
(14, '乐视（Le）乐2Pro 32GB 金色 移动联通电信4G手机 双卡双待', '2100万像素', '1920×1080(FHD,1080P)', '安卓（Android）', '14.2s.png', '乐视（Letv）', 6, '移动4G/联通4G/电信4G', '5.5英寸', '主机×1，电源适配器×1，耳机转接头×1，数据线×1，手机保护套，卡针×1，三包证×1，快速入门指南×1', '本产品全国联保，享受三包服务，质保期为：一年质保', '乐视X620', '3GB', '1399');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `Uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `Upassword` varchar(100) NOT NULL,
  `Uemail` varchar(30) NOT NULL,
  PRIMARY KEY (`Uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`Uid`, `username`, `Upassword`, `Uemail`) VALUES
(8, '123', '123456', '1262359762@qq.com');

-- --------------------------------------------------------

--
-- 表的结构 `usercomment`
--

CREATE TABLE IF NOT EXISTS `usercomment` (
  `Cid` int(11) NOT NULL AUTO_INCREMENT,
  `pu_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `commentDate` datetime NOT NULL,
  PRIMARY KEY (`Cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `usercomment`
--

INSERT INTO `usercomment` (`Cid`, `pu_id`, `username`, `comment`, `commentDate`) VALUES
(1, 1, 'vicky', 'success', '2016-07-09 20:58:30'),
(2, 1, 'vicky', 'success', '2016-07-09 20:59:10'),
(4, 1, '123', '1234', '2016-07-13 16:14:14'),
(16, 3, '123', 'hhhhhhhhhhhhhhh', '2016-07-13 17:34:50'),
(17, 3, '123', 'wer', '2016-07-13 20:48:28');

-- --------------------------------------------------------

--
-- 表的结构 `userlike`
--

CREATE TABLE IF NOT EXISTS `userlike` (
  `Lid` int(11) NOT NULL AUTO_INCREMENT,
  `Cid` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `likeNum` int(11) NOT NULL,
  PRIMARY KEY (`Lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
