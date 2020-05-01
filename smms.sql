/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : smms

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 23/04/2020 20:45:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `b_id` int NOT NULL AUTO_INCREMENT COMMENT '借出id',
  `b_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '借用人id',
  `b_eid` int NOT NULL COMMENT '借出器材id',
  `b_num` int NOT NULL COMMENT '借出数量',
  `b_startTime` datetime NOT NULL COMMENT '借出时间',
  `b_endTime` datetime DEFAULT NULL COMMENT '归还时间',
  `b_state` bit(1) NOT NULL COMMENT '归还状态',
  `b_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '借用理由',
  PRIMARY KEY (`b_id`) USING BTREE,
  KEY `fk_bno_uid` (`b_no`) USING BTREE,
  KEY `fk_beid_eid` (`b_eid`) USING BTREE,
  CONSTRAINT `fk_beid_eid` FOREIGN KEY (`b_eid`) REFERENCES `equipment` (`e_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bno_uid` FOREIGN KEY (`b_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of borrow
-- ----------------------------
BEGIN;
INSERT INTO `borrow` VALUES (1, '201624131201', 23, 10, '2020-01-11 23:10:54', '2020-02-02 20:10:48', b'0', '上课需要');
INSERT INTO `borrow` VALUES (2, '201624131202', 4, 27, '2020-01-11 23:10:54', '2020-02-02 20:10:48', b'1', '上课需要');
INSERT INTO `borrow` VALUES (3, '201624131203', 13, 10, '2020-01-11 23:10:54', '2020-02-02 20:10:48', b'1', '上课需要');
INSERT INTO `borrow` VALUES (4, '201624131204', 28, 10, '2020-01-11 23:10:54', '2020-02-02 20:10:48', b'1', '上课需要');
INSERT INTO `borrow` VALUES (5, '201624131205', 12, 32, '2020-01-11 23:10:54', '2020-02-02 20:10:48', b'1', '上课需要');
INSERT INTO `borrow` VALUES (6, '201624131206', 5, 10, '2020-01-11 23:10:54', '2020-02-02 20:10:48', b'1', '上课需要');
INSERT INTO `borrow` VALUES (8, '201624131208', 24, 7, '2020-01-11 23:10:54', '2020-02-02 20:10:48', b'1', '上课需要');
INSERT INTO `borrow` VALUES (9, '201624131209', 5, 1, '2020-01-11 23:10:54', '2020-02-02 20:10:48', b'1', '上课需要');
INSERT INTO `borrow` VALUES (10, '201624131210', 2, 1, '2020-01-11 23:10:54', '2020-02-02 20:10:48', b'1', '上课需要');
INSERT INTO `borrow` VALUES (11, '201624131211', 24, 24, '2020-01-11 23:10:54', '2020-04-08 15:13:39', b'1', '上课需要');
INSERT INTO `borrow` VALUES (12, '201624131212', 2, 14, '2020-01-11 23:10:54', '2020-04-08 15:13:39', b'1', '上课需要');
INSERT INTO `borrow` VALUES (13, '201624131213', 6, 22, '2020-01-11 23:10:54', '2020-04-09 12:22:11', b'1', '上课需要');
INSERT INTO `borrow` VALUES (14, '201624131214', 15, 13, '2020-01-11 23:10:54', '2020-04-14 14:04:47', b'1', '上课需要');
INSERT INTO `borrow` VALUES (15, '201624131215', 25, 9, '2020-01-11 23:10:54', NULL, b'0', '上课需要');
INSERT INTO `borrow` VALUES (16, '201624131216', 29, 39, '2020-01-11 23:10:54', NULL, b'0', '上课需要');
INSERT INTO `borrow` VALUES (17, '201624131217', 1, 17, '2020-01-11 23:10:54', '2020-04-09 12:22:19', b'1', '上课需要');
INSERT INTO `borrow` VALUES (18, '201624131218', 23, 33, '2020-01-11 23:10:54', NULL, b'0', '上课需要');
INSERT INTO `borrow` VALUES (19, '201624131219', 2, 3, '2020-01-11 23:10:54', '2020-04-09 12:25:43', b'1', '上课需要');
INSERT INTO `borrow` VALUES (22, '201624131220', 1, 20, '2020-04-08 14:56:52', '2020-04-08 15:13:33', b'1', '333');
INSERT INTO `borrow` VALUES (23, '201624131220', 29, 20, '2020-04-09 12:24:04', '2020-04-09 12:25:49', b'1', '333');
INSERT INTO `borrow` VALUES (24, '201624131220', 1, 600, '2020-04-15 13:49:39', '2020-04-15 13:49:56', b'1', '   ');
INSERT INTO `borrow` VALUES (25, '201624131220', 29, 27, '2020-04-15 14:13:42', '2020-04-15 14:13:55', b'1', ' ');
INSERT INTO `borrow` VALUES (26, '201624131220', 7, 100, '2020-04-17 12:56:07', NULL, b'0', '体育课');
INSERT INTO `borrow` VALUES (27, '201624131202', 2, 250, '2020-04-17 12:56:37', NULL, b'0', '250');
INSERT INTO `borrow` VALUES (28, '201624131280', 2, 380, '2020-04-17 12:56:54', NULL, b'0', '380');
INSERT INTO `borrow` VALUES (29, '201624131237', 2, 90, '2020-04-17 12:57:11', NULL, b'0', '90');
COMMIT;

-- ----------------------------
-- Table structure for broadcast
-- ----------------------------
DROP TABLE IF EXISTS `broadcast`;
CREATE TABLE `broadcast` (
  `b_id` int NOT NULL AUTO_INCREMENT COMMENT '广播id',
  `b_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广播主题',
  `b_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广播内容',
  `b_time` datetime NOT NULL COMMENT '播出时间',
  `b_sportmeetingid` int NOT NULL COMMENT ' 运动会id',
  PRIMARY KEY (`b_id`) USING BTREE,
  KEY `fk_bsportmeetingid_sid` (`b_sportmeetingid`) USING BTREE,
  CONSTRAINT `fk_bsportmeetingid_sid` FOREIGN KEY (`b_sportmeetingid`) REFERENCES `sportmeeting` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of broadcast
-- ----------------------------
BEGIN;
INSERT INTO `broadcast` VALUES (2, '包括许多比赛项目的运动比赛', '只是范围不同。最早的运动会就是古希腊的古代', '2018-03-20 11:59:00', 2019);
INSERT INTO `broadcast` VALUES (3, '包括许多比赛项目的运动比赛', '运动会，只是范', '2018-03-20 11:59:00', 2019);
INSERT INTO `broadcast` VALUES (14, '自己的光彩，迎接胜利的喝彩。', '自己的光彩，迎接胜利的喝彩。', '2020-03-22 17:37:19', 2020);
INSERT INTO `broadcast` VALUES (15, '自己的光彩，迎接胜利的喝彩。', '自己的光彩，迎接胜利的喝彩。', '2020-04-12 18:18:39', 2020);
INSERT INTO `broadcast` VALUES (16, '包括许多比赛项目的运动比赛', '自己的光彩，迎接胜利的喝彩。', '2020-03-20 11:08:52', 2020);
INSERT INTO `broadcast` VALUES (17, '包括许多比赛项目的运动比赛', '自己的光彩，迎接胜利的喝彩。', '2020-03-20 10:52:38', 2020);
COMMIT;

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `c_id` int NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `c_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
  `c_headmasterid` int DEFAULT NULL COMMENT '班主任id',
  `c_major` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业',
  `c_deptid` int NOT NULL COMMENT '学院id',
  PRIMARY KEY (`c_id`) USING BTREE,
  KEY `fk_cdeptid_did` (`c_deptid`) USING BTREE,
  KEY `fk_cheadmasterid_tid` (`c_headmasterid`) USING BTREE,
  CONSTRAINT `fk_cdeptid_did` FOREIGN KEY (`c_deptid`) REFERENCES `department` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cheadmasterid_tid` FOREIGN KEY (`c_headmasterid`) REFERENCES `teacher` (`t_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of classes
-- ----------------------------
BEGIN;
INSERT INTO `classes` VALUES (1, '16科技2班', 1, '计算机科学与技术', 1);
INSERT INTO `classes` VALUES (2, '16科技1班', 2, '计算机科学与技术', 1);
INSERT INTO `classes` VALUES (3, '16音乐1班', 4, '音乐学', 2);
INSERT INTO `classes` VALUES (4, '16科技3班', 3, '计算机科学与技术', 1);
INSERT INTO `classes` VALUES (5, '16网工', 10, '网络工程', 1);
INSERT INTO `classes` VALUES (6, '16软件1班', 5, '软件工程', 1);
INSERT INTO `classes` VALUES (7, '16物联网', 7, '物联网工程', 1);
INSERT INTO `classes` VALUES (8, '16软件2班', 8, '软件工程', 1);
INSERT INTO `classes` VALUES (9, '16音乐2班', 6, '音乐学', 2);
INSERT INTO `classes` VALUES (11, '19体育2班', 17, '体育运动学', 4);
INSERT INTO `classes` VALUES (12, '19文学2班', 19, '文学教育', 3);
INSERT INTO `classes` VALUES (13, '20美术1班', 15, '行为艺术', 5);
COMMIT;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `d_id` int NOT NULL AUTO_INCREMENT COMMENT '学院id',
  `d_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学院名称',
  `d_deanid` int DEFAULT NULL COMMENT '院长id',
  PRIMARY KEY (`d_id`) USING BTREE,
  KEY `fk_ddeanid_tid` (`d_deanid`) USING BTREE,
  CONSTRAINT `fk_ddeanid_tid` FOREIGN KEY (`d_deanid`) REFERENCES `teacher` (`t_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
BEGIN;
INSERT INTO `department` VALUES (1, '计算机科学与软件学院、大数据学院', 1);
INSERT INTO `department` VALUES (2, '音乐学院', 2);
INSERT INTO `department` VALUES (3, '文学院', 3);
INSERT INTO `department` VALUES (4, '体育学院', 10);
INSERT INTO `department` VALUES (5, '美术学院', 12);
INSERT INTO `department` VALUES (6, '中德设计学院', 19);
COMMIT;

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `e_id` int NOT NULL AUTO_INCREMENT COMMENT '器材id',
  `e_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '器材名称',
  `e_model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '器材型号',
  `e_place` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '器材放置地点',
  `e_sum` int NOT NULL COMMENT '器材总数',
  `e_buyTime` datetime DEFAULT NULL COMMENT '器材采购时间',
  PRIMARY KEY (`e_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of equipment
-- ----------------------------
BEGIN;
INSERT INTO `equipment` VALUES (1, '足球2', 'brniy', '体育馆一楼101', 322, '2020-04-02 16:49:10');
INSERT INTO `equipment` VALUES (2, '篮球', 'frahz', '体育馆一楼101', 720, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (3, '排球', '7putq', '体育馆一楼101', 29, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (4, '乒乓球', '44zqb', '体育馆一楼101', 65, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (5, '乒乓球拍', 'q1cop', '体育馆一楼101', 54, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (6, '排球网', 'evjf6', '体育馆一楼101', 70, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (7, '羽毛球', '7yylz', '体育馆一楼101', 100, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (8, '跳绳', 'yc8ug', '体育馆一楼101', 40, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (9, '羽毛球网', '6dc8x', '体育馆一楼101', 60, '2020-01-11 22:44:04');
INSERT INTO `equipment` VALUES (11, '乒乓球台', 'pxxfe', '体育馆一楼104', 85, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (12, '室内双杠', '8pv5k', '体育馆一楼104', 60, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (13, '室内单杠', 'fw6a3', '体育馆一楼104', 41, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (14, '短剑', 'dj7of', '体育馆一楼104', 75, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (15, '轮滑桩', 'q8f6i', '体育馆一楼104', 81, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (16, '轮滑护具', 'jx1ay', '体育馆一楼104', 50, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (17, '记录仪', 'o4wzl', '体育馆一楼104', 100, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (18, '计时器', 'y85in', '体育馆一楼104', 97, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (19, '口哨', 'a93v7', '体育馆一楼104', 80, '2020-01-11 22:44:57');
INSERT INTO `equipment` VALUES (21, '纪录牌', 'v1iak', '体育馆一楼104', 40, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (22, '瑜伽垫', 'z30wg', '体育馆一楼104', 70, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (23, '游泳浮板', 'ccl27', '体育馆一楼104', 89, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (24, '毽子', 'wwqf2', '体育馆一楼104', 58, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (25, '气枪', 'bt3hf', '体育馆一楼104', 67, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (26, '举重铃50kg', '19zd9', '体育馆一楼104', 57, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (27, '举重铃20kg', 'plul4', '体育馆一楼104', 48, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (28, '哑铃10kg', 'w55rx', '体育馆一楼104', 70, '2020-01-11 22:46:22');
INSERT INTO `equipment` VALUES (29, '女子健身哑铃5kg', 'evyp9', '体育馆一楼104', 66, '2020-01-11 22:46:22');
COMMIT;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `e_id` int NOT NULL AUTO_INCREMENT COMMENT '项目id',
  `e_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称',
  `e_place` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目举办地点',
  `e_gender` bit(1) NOT NULL COMMENT '项目性别限制',
  `e_date` datetime NOT NULL COMMENT '项目举办日期',
  `e_startTime` datetime NOT NULL COMMENT '报名开始时间',
  `e_endTime` datetime NOT NULL COMMENT '报名结束时间',
  `e_sportmeetingid` int NOT NULL COMMENT '运动会id',
  `e_rules` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目规则',
  `e_judgementid` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目裁判id',
  `e_unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目成绩记录单位',
  PRIMARY KEY (`e_id`) USING BTREE,
  KEY `fk_esportmeetingid_sid` (`e_sportmeetingid`) USING BTREE,
  KEY `fk_ejudgementid_uid` (`e_judgementid`) USING BTREE,
  CONSTRAINT `fk_ejudgementid_uid` FOREIGN KEY (`e_judgementid`) REFERENCES `user` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_esportmeetingid_sid` FOREIGN KEY (`e_sportmeetingid`) REFERENCES `sportmeeting` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of event
-- ----------------------------
BEGIN;
INSERT INTO `event` VALUES (5, '100M跑步', '第二田径场', b'1', '2020-01-18 15:24:47', '2020-01-18 15:24:47', '2020-01-18 15:24:47', 2020, '田径场（Track-and-Field Ground [1]  ）', '201624131224', 's');
INSERT INTO `event` VALUES (6, '立定跳远', '第二田径场', b'1', '2020-01-18 15:24:47', '2020-01-18 15:24:47', '2020-01-18 15:24:47', 2020, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', 'm');
INSERT INTO `event` VALUES (7, '跳高', '第二田径场', b'1', '2020-01-18 15:24:47', '2020-01-18 15:24:47', '2020-01-18 15:24:47', 2020, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', 'm');
INSERT INTO `event` VALUES (8, '1000M长跑', '第二田径场', b'0', '2020-01-18 15:24:47', '2020-01-18 15:24:47', '2020-01-18 15:24:47', 2020, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', 's');
INSERT INTO `event` VALUES (9, '100m接力赛', '第二田径场', b'0', '2020-01-18 15:24:47', '2020-01-18 15:24:47', '2020-01-18 15:24:47', 2020, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', 's');
INSERT INTO `event` VALUES (10, '射击', '第二田径场', b'1', '2020-01-18 15:24:47', '2020-01-18 15:24:47', '2020-01-18 15:24:47', 2020, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', '环');
INSERT INTO `event` VALUES (14, '射击', '第二田径场', b'0', '2020-01-18 15:24:47', '2020-01-18 15:24:47', '2020-01-18 15:24:47', 2020, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', '环');
INSERT INTO `event` VALUES (17, '三级跳远', '第二田径场', b'1', '2020-01-18 15:24:47', '2020-01-18 15:24:47', '2020-01-18 15:24:47', 2020, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', 'm');
INSERT INTO `event` VALUES (18, '仰卧起坐', '第二田径场', b'1', '2020-01-18 15:24:47', '2020-01-18 15:24:47', '2020-01-18 15:24:47', 2020, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', '个');
INSERT INTO `event` VALUES (19, '引体向上', '第二田径场', b'1', '2020-01-18 15:24:47', '2020-01-18 15:24:47', '2020-01-18 15:24:47', 2020, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', '个');
INSERT INTO `event` VALUES (20, '100M跑步', '第二田径场', b'1', '2019-01-18 15:24:47', '2019-01-18 15:24:47', '2019-01-18 15:24:47', 2019, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', 'm');
INSERT INTO `event` VALUES (21, '立定跳远', '第二田径场', b'1', '2019-01-18 15:24:47', '2019-01-18 15:24:47', '2019-01-18 15:24:47', 2019, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', 'm');
INSERT INTO `event` VALUES (22, '跳高', '第二田径场', b'1', '2019-01-18 15:24:47', '2019-01-18 15:24:47', '2019-01-18 15:24:47', 2019, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', 'm');
INSERT INTO `event` VALUES (23, '1000M长跑', '第二田径场', b'0', '2019-01-18 15:24:47', '2019-01-18 15:24:47', '2019-01-18 15:24:47', 2019, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', 's');
INSERT INTO `event` VALUES (24, '100m接力赛', '第二田径场', b'0', '2019-01-18 15:24:47', '2019-01-18 15:24:47', '2019-01-18 15:24:47', 2019, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', 's');
INSERT INTO `event` VALUES (25, '射击', '第二田径场', b'1', '2019-01-18 15:24:47', '2019-01-18 15:24:47', '2019-01-18 15:24:47', 2019, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', '环');
INSERT INTO `event` VALUES (26, '射击', '第二田径场', b'1', '2019-01-18 15:24:47', '2019-01-18 15:24:47', '2019-01-18 15:24:47', 2019, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', '环');
INSERT INTO `event` VALUES (27, '三级跳远', '第二田径场', b'1', '2020-04-13 13:14:07', '2020-04-13 13:14:08', '2020-04-13 13:14:09', 2020, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', 'm');
INSERT INTO `event` VALUES (28, '仰卧起坐', '第二田径场', b'1', '2019-01-18 15:24:47', '2019-01-18 15:24:47', '2019-01-18 15:24:47', 2019, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', '个');
INSERT INTO `event` VALUES (29, '引体向上2', '第2田径场', b'0', '2020-04-13 13:13:54', '2020-04-13 13:13:56', '2020-04-13 13:13:57', 2020, '田径场（Track-and-Field Ground [1]  ）是田径运动的场地，用于田径运动教学、训练，开展群众体育活动，组织竞赛。分为标准田径场和非标准田径场两类。内设由两弯道和两直道组成的环形径赛跑道及各项田赛区。分道宽1.22m或1.25m，包含5cm宽的分道线。', '201624131224', '个');
COMMIT;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `feedback` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of feedback
-- ----------------------------
BEGIN;
INSERT INTO `feedback` VALUES (16, 'handyyyyy', 'handyyy@qq.com', '444', '2020-03-25 17:56:40');
INSERT INTO `feedback` VALUES (24, '江汉棣', 'handyjiang@foxmail.com', '毕设', '2020-03-25 17:56:40');
INSERT INTO `feedback` VALUES (45, 'feedback', 'feedback@foxmail.com', '设计完成！', '2020-04-13 16:04:52');
INSERT INTO `feedback` VALUES (47, 'xingming', 'youjian@qq.com', 'neirong', '2020-04-22 17:21:05');
COMMIT;

-- ----------------------------
-- Table structure for matches
-- ----------------------------
DROP TABLE IF EXISTS `matches`;
CREATE TABLE `matches` (
  `m_id` int NOT NULL AUTO_INCREMENT COMMENT '赛事id',
  `m_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参赛人id',
  `m_eid` int NOT NULL COMMENT '参赛项目',
  `m_sort` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '将参赛人分组分道',
  `m_score` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '赛事成绩',
  `m_rank` int DEFAULT NULL COMMENT '成绩排名',
  PRIMARY KEY (`m_id`) USING BTREE,
  KEY `fk_mno_uid` (`m_no`) USING BTREE,
  KEY `fk_meid_eid` (`m_eid`) USING BTREE,
  CONSTRAINT `fk_meid_eid` FOREIGN KEY (`m_eid`) REFERENCES `event` (`e_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mno_uid` FOREIGN KEY (`m_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of matches
-- ----------------------------
BEGIN;
INSERT INTO `matches` VALUES (26, '201624131203', 8, '第一田径场-跑道1道', '4.25', 3);
INSERT INTO `matches` VALUES (40, '201624131198', 27, '第二田径场-跳远场地', '4.32', 3);
INSERT INTO `matches` VALUES (41, '201624131198', 5, '第二田径场-跑道3道', '39.52', 4);
INSERT INTO `matches` VALUES (47, '201624131201', 5, NULL, '29.55', 2);
INSERT INTO `matches` VALUES (48, '201624131201', 18, NULL, '33', 1);
INSERT INTO `matches` VALUES (54, '201624131205', 5, NULL, '29.55', 2);
INSERT INTO `matches` VALUES (55, '201624131210', 5, NULL, '30.00', 3);
INSERT INTO `matches` VALUES (57, '201624131201', 7, NULL, NULL, NULL);
INSERT INTO `matches` VALUES (58, '201624131201', 17, NULL, NULL, NULL);
INSERT INTO `matches` VALUES (59, '201624131201', 19, NULL, '2', 2);
INSERT INTO `matches` VALUES (60, '201624131210', 6, NULL, NULL, NULL);
INSERT INTO `matches` VALUES (61, '201624131210', 7, NULL, NULL, NULL);
INSERT INTO `matches` VALUES (62, '201624131210', 10, NULL, '54', NULL);
INSERT INTO `matches` VALUES (63, '201624131210', 17, NULL, NULL, NULL);
INSERT INTO `matches` VALUES (64, '201624131210', 18, NULL, NULL, NULL);
INSERT INTO `matches` VALUES (65, '201624131210', 19, NULL, '90', 4);
INSERT INTO `matches` VALUES (66, '201624131202', 5, NULL, '2.25', 1);
INSERT INTO `matches` VALUES (67, '201624131202', 6, NULL, NULL, NULL);
INSERT INTO `matches` VALUES (68, '201624131202', 18, NULL, NULL, NULL);
INSERT INTO `matches` VALUES (69, '201624131202', 10, NULL, '12', NULL);
INSERT INTO `matches` VALUES (70, '201624131202', 19, NULL, '33', 3);
INSERT INTO `matches` VALUES (71, '201624131202', 7, NULL, NULL, NULL);
INSERT INTO `matches` VALUES (72, '201624131202', 17, NULL, '3.3', 2);
INSERT INTO `matches` VALUES (74, '201624131220', 18, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for other
-- ----------------------------
DROP TABLE IF EXISTS `other`;
CREATE TABLE `other` (
  `o_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `o_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '其他用户标识号',
  `o_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '其他用户名',
  PRIMARY KEY (`o_id`) USING BTREE,
  KEY `fk_ono_uid` (`o_no`) USING BTREE,
  CONSTRAINT `fk_ono_uid` FOREIGN KEY (`o_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of other
-- ----------------------------
BEGIN;
INSERT INTO `other` VALUES (1, 'admin', '管理员');
INSERT INTO `other` VALUES (2, 'test', '测试');
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `r_id` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `r_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `r_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'USER', '用户');
INSERT INTO `role` VALUES (2, 'ADMIN', '管理员');
COMMIT;

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `r_id` int NOT NULL,
  `u_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`r_id`,`u_id`) USING BTREE,
  KEY `fk_uid` (`u_id`) USING BTREE,
  CONSTRAINT `fk_rid2` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_uid` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role_user
-- ----------------------------
BEGIN;
INSERT INTO `role_user` VALUES (1, '1000000');
INSERT INTO `role_user` VALUES (1, '10100010');
INSERT INTO `role_user` VALUES (1, '10100011');
INSERT INTO `role_user` VALUES (1, '10100012');
INSERT INTO `role_user` VALUES (1, '10100013');
INSERT INTO `role_user` VALUES (1, '10100014');
INSERT INTO `role_user` VALUES (1, '10100015');
INSERT INTO `role_user` VALUES (1, '10100016');
INSERT INTO `role_user` VALUES (1, '10100017');
INSERT INTO `role_user` VALUES (1, '10100018');
INSERT INTO `role_user` VALUES (1, '10100019');
INSERT INTO `role_user` VALUES (1, '10100020');
INSERT INTO `role_user` VALUES (1, '10100021');
INSERT INTO `role_user` VALUES (1, '10100022');
INSERT INTO `role_user` VALUES (1, '10100023');
INSERT INTO `role_user` VALUES (1, '10100024');
INSERT INTO `role_user` VALUES (1, '10100025');
INSERT INTO `role_user` VALUES (1, '10100026');
INSERT INTO `role_user` VALUES (1, '10100027');
INSERT INTO `role_user` VALUES (1, '10100028');
INSERT INTO `role_user` VALUES (1, '10100029');
INSERT INTO `role_user` VALUES (1, '10100030');
INSERT INTO `role_user` VALUES (1, '201624131198');
INSERT INTO `role_user` VALUES (1, '201624131199');
INSERT INTO `role_user` VALUES (1, '201624131201');
INSERT INTO `role_user` VALUES (1, '201624131202');
INSERT INTO `role_user` VALUES (1, '201624131203');
INSERT INTO `role_user` VALUES (1, '201624131204');
INSERT INTO `role_user` VALUES (1, '201624131205');
INSERT INTO `role_user` VALUES (1, '201624131206');
INSERT INTO `role_user` VALUES (1, '201624131207');
INSERT INTO `role_user` VALUES (1, '201624131208');
INSERT INTO `role_user` VALUES (1, '201624131209');
INSERT INTO `role_user` VALUES (1, '201624131210');
INSERT INTO `role_user` VALUES (1, '201624131211');
INSERT INTO `role_user` VALUES (1, '201624131212');
INSERT INTO `role_user` VALUES (1, '201624131213');
INSERT INTO `role_user` VALUES (1, '201624131214');
INSERT INTO `role_user` VALUES (1, '201624131215');
INSERT INTO `role_user` VALUES (1, '201624131216');
INSERT INTO `role_user` VALUES (1, '201624131217');
INSERT INTO `role_user` VALUES (1, '201624131218');
INSERT INTO `role_user` VALUES (1, '201624131219');
INSERT INTO `role_user` VALUES (1, '201624131220');
INSERT INTO `role_user` VALUES (2, '201624131220');
INSERT INTO `role_user` VALUES (1, '201624131221');
INSERT INTO `role_user` VALUES (1, '201624131222');
INSERT INTO `role_user` VALUES (1, '201624131223');
INSERT INTO `role_user` VALUES (1, '201624131224');
INSERT INTO `role_user` VALUES (1, '201624131225');
INSERT INTO `role_user` VALUES (1, '201624131226');
INSERT INTO `role_user` VALUES (1, '201624131227');
INSERT INTO `role_user` VALUES (1, '201624131228');
INSERT INTO `role_user` VALUES (1, '201624131229');
INSERT INTO `role_user` VALUES (1, '201624131230');
INSERT INTO `role_user` VALUES (1, '201624131231');
INSERT INTO `role_user` VALUES (1, '201624131232');
INSERT INTO `role_user` VALUES (1, '201624131233');
INSERT INTO `role_user` VALUES (1, '201624131234');
INSERT INTO `role_user` VALUES (1, '201624131235');
INSERT INTO `role_user` VALUES (1, '201624131236');
INSERT INTO `role_user` VALUES (1, '201624131237');
INSERT INTO `role_user` VALUES (1, '201624131238');
INSERT INTO `role_user` VALUES (1, '201624131239');
INSERT INTO `role_user` VALUES (1, '201624131240');
INSERT INTO `role_user` VALUES (1, '201624131241');
INSERT INTO `role_user` VALUES (1, '201624131242');
INSERT INTO `role_user` VALUES (1, '201624131243');
INSERT INTO `role_user` VALUES (1, '201624131244');
INSERT INTO `role_user` VALUES (1, '201624131245');
INSERT INTO `role_user` VALUES (1, '201624131246');
INSERT INTO `role_user` VALUES (1, '201624131247');
INSERT INTO `role_user` VALUES (1, '201624131248');
INSERT INTO `role_user` VALUES (1, '201624131249');
INSERT INTO `role_user` VALUES (1, '201624131250');
INSERT INTO `role_user` VALUES (1, '201624131251');
INSERT INTO `role_user` VALUES (1, '201624131252');
INSERT INTO `role_user` VALUES (1, '201624131253');
INSERT INTO `role_user` VALUES (1, '201624131254');
INSERT INTO `role_user` VALUES (1, '201624131255');
INSERT INTO `role_user` VALUES (1, '201624131256');
INSERT INTO `role_user` VALUES (1, '201624131257');
INSERT INTO `role_user` VALUES (1, '201624131258');
INSERT INTO `role_user` VALUES (1, '201624131259');
INSERT INTO `role_user` VALUES (1, '201624131260');
INSERT INTO `role_user` VALUES (1, '201624131261');
INSERT INTO `role_user` VALUES (1, '201624131262');
INSERT INTO `role_user` VALUES (1, '201624131263');
INSERT INTO `role_user` VALUES (1, '201624131264');
INSERT INTO `role_user` VALUES (1, '201624131265');
INSERT INTO `role_user` VALUES (1, '201624131266');
INSERT INTO `role_user` VALUES (1, '201624131267');
INSERT INTO `role_user` VALUES (1, '201624131268');
INSERT INTO `role_user` VALUES (1, '201624131269');
INSERT INTO `role_user` VALUES (1, '201624131270');
INSERT INTO `role_user` VALUES (1, '201624131271');
INSERT INTO `role_user` VALUES (1, '201624131272');
INSERT INTO `role_user` VALUES (1, '201624131273');
INSERT INTO `role_user` VALUES (1, '201624131274');
INSERT INTO `role_user` VALUES (1, '201624131275');
INSERT INTO `role_user` VALUES (1, '201624131276');
INSERT INTO `role_user` VALUES (1, '201624131277');
INSERT INTO `role_user` VALUES (1, '201624131278');
INSERT INTO `role_user` VALUES (1, '201624131279');
INSERT INTO `role_user` VALUES (1, '201624131280');
INSERT INTO `role_user` VALUES (1, '201624131281');
INSERT INTO `role_user` VALUES (1, '201624131282');
INSERT INTO `role_user` VALUES (1, '201624131283');
INSERT INTO `role_user` VALUES (1, '201624131284');
INSERT INTO `role_user` VALUES (1, '201624131285');
INSERT INTO `role_user` VALUES (1, '201624131286');
INSERT INTO `role_user` VALUES (1, '201624131287');
INSERT INTO `role_user` VALUES (1, '201624131288');
INSERT INTO `role_user` VALUES (1, '201624131289');
INSERT INTO `role_user` VALUES (1, '201624131290');
INSERT INTO `role_user` VALUES (1, '201624131291');
INSERT INTO `role_user` VALUES (1, '201624131292');
INSERT INTO `role_user` VALUES (1, '201624131293');
INSERT INTO `role_user` VALUES (1, '201624131294');
INSERT INTO `role_user` VALUES (1, '201624131295');
INSERT INTO `role_user` VALUES (1, '201624131296');
INSERT INTO `role_user` VALUES (1, '201624131297');
INSERT INTO `role_user` VALUES (1, '201624131298');
INSERT INTO `role_user` VALUES (1, '201624131299');
INSERT INTO `role_user` VALUES (1, '201624131300');
INSERT INTO `role_user` VALUES (1, '201624131301');
INSERT INTO `role_user` VALUES (1, '201624131302');
INSERT INTO `role_user` VALUES (1, '201624131303');
INSERT INTO `role_user` VALUES (1, '201624131304');
INSERT INTO `role_user` VALUES (1, '201624131305');
INSERT INTO `role_user` VALUES (1, '201624131306');
INSERT INTO `role_user` VALUES (1, '201624131307');
INSERT INTO `role_user` VALUES (1, '201624131308');
INSERT INTO `role_user` VALUES (1, '201624131309');
INSERT INTO `role_user` VALUES (1, '201624131310');
INSERT INTO `role_user` VALUES (1, '201624131311');
INSERT INTO `role_user` VALUES (1, '201624131312');
INSERT INTO `role_user` VALUES (1, '201624131313');
INSERT INTO `role_user` VALUES (1, '201624131314');
INSERT INTO `role_user` VALUES (1, '201624131315');
INSERT INTO `role_user` VALUES (1, '201624131316');
INSERT INTO `role_user` VALUES (1, '201624131317');
INSERT INTO `role_user` VALUES (1, '201624131318');
INSERT INTO `role_user` VALUES (1, '201624131319');
INSERT INTO `role_user` VALUES (1, '201624131320');
INSERT INTO `role_user` VALUES (1, '201624131321');
INSERT INTO `role_user` VALUES (1, '201624131322');
INSERT INTO `role_user` VALUES (1, '201624131323');
INSERT INTO `role_user` VALUES (1, '201624131324');
INSERT INTO `role_user` VALUES (1, '201624131325');
INSERT INTO `role_user` VALUES (1, '201624131326');
INSERT INTO `role_user` VALUES (1, '201624131327');
INSERT INTO `role_user` VALUES (1, '201624131328');
INSERT INTO `role_user` VALUES (1, '201624131329');
INSERT INTO `role_user` VALUES (1, '201624131330');
INSERT INTO `role_user` VALUES (1, '201624131331');
INSERT INTO `role_user` VALUES (1, '201624131332');
INSERT INTO `role_user` VALUES (1, '201624131333');
INSERT INTO `role_user` VALUES (1, '201624131334');
INSERT INTO `role_user` VALUES (1, '201624131335');
INSERT INTO `role_user` VALUES (1, '201624131336');
INSERT INTO `role_user` VALUES (1, '201624131337');
INSERT INTO `role_user` VALUES (1, '201624131338');
INSERT INTO `role_user` VALUES (1, '201624131339');
INSERT INTO `role_user` VALUES (1, '201624131340');
INSERT INTO `role_user` VALUES (1, '201624131341');
INSERT INTO `role_user` VALUES (1, '201624131342');
INSERT INTO `role_user` VALUES (1, '201624131343');
INSERT INTO `role_user` VALUES (1, '201624131344');
INSERT INTO `role_user` VALUES (1, '201624131345');
INSERT INTO `role_user` VALUES (1, '201624131346');
INSERT INTO `role_user` VALUES (1, '201624131347');
INSERT INTO `role_user` VALUES (1, '201624131348');
INSERT INTO `role_user` VALUES (1, '201624131349');
INSERT INTO `role_user` VALUES (1, '201624131350');
INSERT INTO `role_user` VALUES (1, '201624131351');
INSERT INTO `role_user` VALUES (1, '201624131352');
INSERT INTO `role_user` VALUES (1, '201624131353');
INSERT INTO `role_user` VALUES (1, '201624131354');
INSERT INTO `role_user` VALUES (1, '201624131355');
INSERT INTO `role_user` VALUES (1, '201624131356');
INSERT INTO `role_user` VALUES (1, '201624131357');
INSERT INTO `role_user` VALUES (1, '201624131358');
INSERT INTO `role_user` VALUES (1, '201624131359');
INSERT INTO `role_user` VALUES (1, '201624131360');
INSERT INTO `role_user` VALUES (1, '201624131361');
INSERT INTO `role_user` VALUES (1, '201624131362');
INSERT INTO `role_user` VALUES (1, '201624131363');
INSERT INTO `role_user` VALUES (1, '201624131364');
INSERT INTO `role_user` VALUES (1, '201624131365');
INSERT INTO `role_user` VALUES (1, '201624131366');
INSERT INTO `role_user` VALUES (1, '201624131367');
INSERT INTO `role_user` VALUES (1, '201624131368');
INSERT INTO `role_user` VALUES (1, '201624131369');
INSERT INTO `role_user` VALUES (1, '201624131370');
INSERT INTO `role_user` VALUES (1, '201624131371');
INSERT INTO `role_user` VALUES (1, '201624131372');
INSERT INTO `role_user` VALUES (1, '201624131373');
INSERT INTO `role_user` VALUES (1, '201624131374');
INSERT INTO `role_user` VALUES (1, '201624131375');
INSERT INTO `role_user` VALUES (1, '201624131376');
INSERT INTO `role_user` VALUES (1, '201624131377');
INSERT INTO `role_user` VALUES (1, '201624131378');
INSERT INTO `role_user` VALUES (1, '201624131379');
INSERT INTO `role_user` VALUES (1, '201624131380');
INSERT INTO `role_user` VALUES (1, '201624131381');
INSERT INTO `role_user` VALUES (1, '201624131382');
INSERT INTO `role_user` VALUES (1, '201624131383');
INSERT INTO `role_user` VALUES (1, '201624131384');
INSERT INTO `role_user` VALUES (1, '201624131385');
INSERT INTO `role_user` VALUES (1, '201624131386');
INSERT INTO `role_user` VALUES (1, '201624131387');
INSERT INTO `role_user` VALUES (1, '201624131388');
INSERT INTO `role_user` VALUES (1, '201624131389');
INSERT INTO `role_user` VALUES (1, '201624131390');
INSERT INTO `role_user` VALUES (1, '201624131391');
INSERT INTO `role_user` VALUES (1, '201624131392');
INSERT INTO `role_user` VALUES (1, '201624131393');
INSERT INTO `role_user` VALUES (1, '201624131394');
INSERT INTO `role_user` VALUES (1, '201624131395');
INSERT INTO `role_user` VALUES (1, '201624131396');
INSERT INTO `role_user` VALUES (1, '201624131397');
INSERT INTO `role_user` VALUES (1, '201624131398');
INSERT INTO `role_user` VALUES (1, '201624131399');
INSERT INTO `role_user` VALUES (1, '201624131400');
INSERT INTO `role_user` VALUES (1, '201624131401');
INSERT INTO `role_user` VALUES (1, '201624131402');
INSERT INTO `role_user` VALUES (1, '201624131403');
INSERT INTO `role_user` VALUES (1, '201624131404');
INSERT INTO `role_user` VALUES (1, '201624131405');
INSERT INTO `role_user` VALUES (1, '201624131406');
INSERT INTO `role_user` VALUES (1, '201624131407');
INSERT INTO `role_user` VALUES (1, '201624131408');
INSERT INTO `role_user` VALUES (1, '201624131409');
INSERT INTO `role_user` VALUES (1, '201624131410');
INSERT INTO `role_user` VALUES (1, '201624131411');
INSERT INTO `role_user` VALUES (1, '201624131412');
INSERT INTO `role_user` VALUES (1, '201624131413');
INSERT INTO `role_user` VALUES (1, '201624131414');
INSERT INTO `role_user` VALUES (1, '201624131415');
INSERT INTO `role_user` VALUES (1, '201624131416');
INSERT INTO `role_user` VALUES (1, '201624131417');
INSERT INTO `role_user` VALUES (1, '201624131418');
INSERT INTO `role_user` VALUES (1, '201624131419');
INSERT INTO `role_user` VALUES (1, '201624131420');
INSERT INTO `role_user` VALUES (1, '201624131421');
INSERT INTO `role_user` VALUES (1, '201624131422');
INSERT INTO `role_user` VALUES (1, '201624131423');
INSERT INTO `role_user` VALUES (1, '201624131424');
INSERT INTO `role_user` VALUES (1, '201624131425');
INSERT INTO `role_user` VALUES (1, '201624131426');
INSERT INTO `role_user` VALUES (1, '201624131427');
INSERT INTO `role_user` VALUES (1, '201624131428');
INSERT INTO `role_user` VALUES (1, '201624131429');
INSERT INTO `role_user` VALUES (1, '201624131430');
INSERT INTO `role_user` VALUES (1, '201624131431');
INSERT INTO `role_user` VALUES (1, '201624131432');
INSERT INTO `role_user` VALUES (1, '201624131433');
INSERT INTO `role_user` VALUES (1, '201624131434');
INSERT INTO `role_user` VALUES (1, '201624131435');
INSERT INTO `role_user` VALUES (1, '201624131436');
INSERT INTO `role_user` VALUES (1, '201624131437');
INSERT INTO `role_user` VALUES (1, '201624131438');
INSERT INTO `role_user` VALUES (1, '201624131439');
INSERT INTO `role_user` VALUES (1, '201624131440');
INSERT INTO `role_user` VALUES (1, '201624131441');
INSERT INTO `role_user` VALUES (1, '201624131442');
INSERT INTO `role_user` VALUES (1, '201624131443');
INSERT INTO `role_user` VALUES (1, '201624131444');
INSERT INTO `role_user` VALUES (1, '201624131445');
INSERT INTO `role_user` VALUES (1, '201624131446');
INSERT INTO `role_user` VALUES (1, '201624131447');
INSERT INTO `role_user` VALUES (1, '201624131448');
INSERT INTO `role_user` VALUES (1, '201624131449');
INSERT INTO `role_user` VALUES (1, '201624131450');
INSERT INTO `role_user` VALUES (1, '201624131451');
INSERT INTO `role_user` VALUES (1, '201624131452');
INSERT INTO `role_user` VALUES (1, '201624131453');
INSERT INTO `role_user` VALUES (1, '201624131454');
INSERT INTO `role_user` VALUES (1, '201624131455');
INSERT INTO `role_user` VALUES (1, '201624131456');
INSERT INTO `role_user` VALUES (1, '201624131457');
INSERT INTO `role_user` VALUES (1, '201624131458');
INSERT INTO `role_user` VALUES (1, '201624131459');
INSERT INTO `role_user` VALUES (1, '201624131460');
INSERT INTO `role_user` VALUES (1, '201624131461');
INSERT INTO `role_user` VALUES (1, '201624131462');
INSERT INTO `role_user` VALUES (1, '201624131463');
INSERT INTO `role_user` VALUES (1, '201624131464');
INSERT INTO `role_user` VALUES (1, '201624131465');
INSERT INTO `role_user` VALUES (1, '201624131466');
INSERT INTO `role_user` VALUES (1, '201624131467');
INSERT INTO `role_user` VALUES (1, '201624131468');
INSERT INTO `role_user` VALUES (1, '201624131469');
INSERT INTO `role_user` VALUES (1, '201624131470');
INSERT INTO `role_user` VALUES (1, '201624131471');
INSERT INTO `role_user` VALUES (1, '201624131472');
INSERT INTO `role_user` VALUES (1, '201624131473');
INSERT INTO `role_user` VALUES (1, '201624131474');
INSERT INTO `role_user` VALUES (1, '201624131475');
INSERT INTO `role_user` VALUES (1, '201624131476');
INSERT INTO `role_user` VALUES (1, '201624131477');
INSERT INTO `role_user` VALUES (1, '201624131478');
INSERT INTO `role_user` VALUES (1, '201624131479');
INSERT INTO `role_user` VALUES (1, '201624131480');
INSERT INTO `role_user` VALUES (1, '201624131481');
INSERT INTO `role_user` VALUES (1, '201624131482');
INSERT INTO `role_user` VALUES (1, '201624131483');
INSERT INTO `role_user` VALUES (1, '201624131484');
INSERT INTO `role_user` VALUES (1, '201624131485');
INSERT INTO `role_user` VALUES (1, '201624131501');
INSERT INTO `role_user` VALUES (1, '77777');
INSERT INTO `role_user` VALUES (2, 'admin');
COMMIT;

-- ----------------------------
-- Table structure for sportmeeting
-- ----------------------------
DROP TABLE IF EXISTS `sportmeeting`;
CREATE TABLE `sportmeeting` (
  `s_id` int NOT NULL COMMENT '运动会id',
  `s_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运动会名称',
  `s_theme` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '运动会主题',
  `s_place` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举办地点',
  `s_date` datetime NOT NULL COMMENT '举办时间',
  `s_startTime` datetime NOT NULL COMMENT '开始时间',
  `s_endTime` datetime NOT NULL COMMENT '结束时间',
  `s_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `s_status` bit(1) NOT NULL COMMENT '开启关闭',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sportmeeting
-- ----------------------------
BEGIN;
INSERT INTO `sportmeeting` VALUES (2017, '第八届运动会', '运动运动', '第一田径场', '2020-01-24 12:15:00', '2020-01-24 12:15:00', '2020-01-24 12:15:00', '运动会指体育运动的竞赛会，有奥运会等大型运动会，只是范围不同。最早的运动会就是古希腊的古代奥运会。运动会中，每人都能展现自己的光彩，迎接胜利的喝彩。运动会指体育运动的竞赛会，有奥运会等大型运动会，只是范围不同。最早的运动会就是古希腊的古代奥运会。运动会中，每人都能展现自己的光彩，迎接胜利的喝彩。', b'0');
INSERT INTO `sportmeeting` VALUES (2018, '第九届运动会', '赛出成绩，赛出精彩', '第二田径场', '2018-01-11 00:09:00', '2018-01-11 00:09:00', '2018-01-15 00:09:00', '运动会指体育运动的竞赛会，有奥运会等大型运动会，只是范围不同。最早的运动会就是古希腊的古代奥运会。运动会中，每人都能展现自己的光彩，迎接胜利的喝彩。', b'0');
INSERT INTO `sportmeeting` VALUES (2019, '第十届运动会', '放飞自我，飞得更高', '第一田径场', '2019-01-11 00:09:00', '2019-01-11 00:09:00', '2019-01-15 00:09:00', '无运动会指体育运动的竞赛会，有奥运会等大型运动会，只是范围不同。最早的运动会就是古希腊的古代奥运会。运动会中，每人都能展现自己的光彩，迎接胜利的喝彩。', b'0');
INSERT INTO `sportmeeting` VALUES (2020, '第十一届运动会', '运动快乐', '体育馆', '2020-04-12 17:31:26', '2020-04-12 17:31:31', '2020-04-12 17:31:32', '运动会指体育运动的竞赛会，有奥运会等大型运动会，只是范围不同。最早的运动会就是古希腊的古代奥运会。运动会中，每人都能展现自己的光彩，迎接胜利的喝彩。', b'1');
COMMIT;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `s_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `s_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `s_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `s_gender` bit(1) NOT NULL COMMENT '性别',
  `s_classid` int NOT NULL COMMENT '班级号',
  `s_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话号码',
  `s_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `s_IDcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  PRIMARY KEY (`s_id`) USING BTREE,
  KEY `s_no` (`s_no`) USING BTREE,
  KEY `fk_sclassid_cid` (`s_classid`) USING BTREE,
  CONSTRAINT `fk_sclassid_cid` FOREIGN KEY (`s_classid`) REFERENCES `classes` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sno_uid` FOREIGN KEY (`s_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
BEGIN;
INSERT INTO `student` VALUES (1, '201624131201', '荣瑶翠', b'1', 9, '13404428674', '3yczovnmq@ask.com', '620615198310099195');
INSERT INTO `student` VALUES (2, '201624131202', '司楠', b'1', 1, '13306986310', 'fl73q6@gmail.com', '610403198107056882');
INSERT INTO `student` VALUES (3, '201624131203', '后元先', b'0', 1, '13804720259', '2bh7l8@sina.com', '451325199205313721');
INSERT INTO `student` VALUES (4, '201624131204', '丘振峰', b'1', 1, '15904144313', '6nduvw9ee3@gmail.com', '140814198012079519');
INSERT INTO `student` VALUES (5, '201624131205', '胥香婉', b'0', 1, '13105904900', 'yjigg@ask.com', '340123197811023957');
INSERT INTO `student` VALUES (6, '201624131206', '公鸣利', b'0', 1, '13308701067', 'qdcix@126.com', '650718197105228438');
INSERT INTO `student` VALUES (7, '201624131207', '公泰', b'0', 1, '13101555053', 'lm7mvu9q@163.net', '410727198608061536');
INSERT INTO `student` VALUES (8, '201624131208', '古榕', b'0', 1, '15200736021', 'hl7ikv@yahoo.com', '810102199601216458');
INSERT INTO `student` VALUES (9, '201624131209', '能彬永', b'0', 1, '15102906965', '6in4ggkd16@msn.com', '331405199801213132');
INSERT INTO `student` VALUES (10, '201624131210', '岳彩娥', b'1', 1, '15107393110', 'zexrqq@163.com', '370310199904023652');
INSERT INTO `student` VALUES (11, '201624131211', '钱翠', b'0', 1, '15307729033', 'bx8297e@live.com', '311426197609175971');
INSERT INTO `student` VALUES (12, '201624131212', '荣海', b'0', 1, '13103219082', '8pcpt@yahoo.com', '420604198312038857');
INSERT INTO `student` VALUES (13, '201624131213', '管梅香', b'1', 1, '13007747666', 'n0pvh@3721.net', '630505199901202036');
INSERT INTO `student` VALUES (14, '201624131214', '严豪', b'1', 1, '13706623695', 'wp4f3@0355.net', '211415199001056037');
INSERT INTO `student` VALUES (15, '201624131215', '马婕娴', b'0', 1, '13904794478', '1btnaef4c@126.com', '610913199312295777');
INSERT INTO `student` VALUES (16, '201624131216', '邬哲勇', b'1', 1, '13605434568', 'nm7ity7kdt@yahoo.com.cn', '640901197103122151');
INSERT INTO `student` VALUES (17, '201624131217', '余昭莎', b'0', 1, '13008870257', 'b5sp81@live.com', '231817198201044129');
INSERT INTO `student` VALUES (18, '201624131218', '卫贵顺', b'0', 1, '13007991753', 'aeerpbev@hotmail.com', '520522198606293016');
INSERT INTO `student` VALUES (19, '201624131219', '爱鸣坚', b'0', 1, '13607783440', '2qzfleb19@live.com', '620422198708146784');
INSERT INTO `student` VALUES (20, '201624131220', '广龙', b'1', 1, '13503357316', '86ka98yhb9@gmail.com', '411812197109155475');
INSERT INTO `student` VALUES (21, '201624131221', '邓慧梅', b'1', 1, '13402562598', 'kh950fu7t@0355.net', '150728198807101139');
INSERT INTO `student` VALUES (22, '201624131222', '贝风', b'1', 1, '13005925226', '7xzp5@0355.net', '110428199602204721');
INSERT INTO `student` VALUES (23, '201624131223', '阙蓓', b'0', 1, '13902655423', 'xj0dhhvowy@googlemail.com', '631701199304179704');
INSERT INTO `student` VALUES (24, '201624131224', '宫舒莺', b'0', 1, '15306118019', 'p5ezb@163.net', '641618199212135947');
INSERT INTO `student` VALUES (25, '201624131225', '充思琳', b'1', 1, '13805012982', 'r6qd37@gmail.com', '631504197312266183');
INSERT INTO `student` VALUES (26, '201624131226', '离璧', b'0', 1, '15905986216', 'x0wsm@0355.net', '421506197611073754');
INSERT INTO `student` VALUES (27, '201624131227', '简晨轮', b'1', 1, '13800220763', 'he7cj@0355.net', '121124198104179856');
INSERT INTO `student` VALUES (28, '201624131228', '离勇', b'0', 1, '15503637480', 'k258skd@gmail.com', '230104199202287576');
INSERT INTO `student` VALUES (29, '201624131229', '郗生兴', b'0', 1, '15804058095', 'hggws25ac@163.net', '630705198109158233');
INSERT INTO `student` VALUES (30, '201624131230', '汤婷飘', b'0', 1, '15600071170', 'b7ize69u@ask.com', '511616198602183563');
INSERT INTO `student` VALUES (31, '201624131231', '司青', b'1', 1, '13505004427', '7nmmxq@yahoo.com', '630222198205135030');
INSERT INTO `student` VALUES (32, '201624131232', '雍安轮', b'0', 1, '13405345571', 'mqze0@163.com', '151409197502127793');
INSERT INTO `student` VALUES (33, '201624131233', '谷航壮', b'1', 1, '13503115948', '7zwg5fz@googlemail.com', '440315198701123047');
INSERT INTO `student` VALUES (34, '201624131234', '温巧纨', b'1', 1, '15908589088', '9uph83chs7@msn.com', '810324198301114402');
INSERT INTO `student` VALUES (35, '201624131235', '卫馨', b'0', 1, '13908887540', '40x579e@sina.com', '110802199104115139');
INSERT INTO `student` VALUES (36, '201624131236', '居若', b'0', 1, '13002568617', 's461lp@sohu.com', '650619198304104735');
INSERT INTO `student` VALUES (37, '201624131237', '焦菲婕', b'0', 1, '15303843581', 'vcpnd01@163.com', '520521198705149471');
INSERT INTO `student` VALUES (38, '201624131238', '范顺', b'0', 1, '15608513305', 'f0eq3botz0@yahoo.com.cn', '211522199511221432');
INSERT INTO `student` VALUES (39, '201624131239', '弘宁乐', b'0', 1, '13601033028', 'rymodtnicb@126.com', '440116198610037204');
INSERT INTO `student` VALUES (40, '201624131240', '甫辰清', b'1', 1, '13403500070', 'llrrsr@yeah.net', '210404197404191272');
INSERT INTO `student` VALUES (41, '201624131241', '东平士', b'0', 1, '15500170443', '03mt2uhi6@ask.com', '641322197302123543');
INSERT INTO `student` VALUES (42, '201624131242', '胥菲', b'0', 1, '15102518460', 'n34hs@ask.com', '621328198904123015');
INSERT INTO `student` VALUES (43, '201624131243', '佟宜珍', b'1', 1, '13606958295', 'mt23zoeo@126.com', '610123197212066055');
INSERT INTO `student` VALUES (44, '201624131244', '元荔娅', b'0', 1, '15204122381', 'fp6bt@live.com', '110607197004259542');
INSERT INTO `student` VALUES (45, '201624131245', '花先安', b'0', 1, '13308760684', 'fz09fp4o@yeah.net', '350318198308211708');
INSERT INTO `student` VALUES (46, '201624131246', '曾冰凝', b'1', 1, '15704641813', 'culyhkqy@gmail.com', '810710199811116945');
INSERT INTO `student` VALUES (47, '201624131247', '濮玲媛', b'0', 1, '13605123229', '1xdod@msn.com', '530816199912271519');
INSERT INTO `student` VALUES (48, '201624131248', '方保彬', b'1', 1, '13404612621', '44jw4e@yahoo.com', '361208199805189207');
INSERT INTO `student` VALUES (49, '201624131249', '臧刚', b'1', 1, '13802388312', 'z56ad8r4b7@163.net', '410823198611238777');
INSERT INTO `student` VALUES (50, '201624131250', '亓秋秋', b'0', 1, '13404730017', 'ms7a3v88@sina.com', '510924198004144536');
INSERT INTO `student` VALUES (51, '201624131251', '田世', b'0', 1, '13502805767', 'r7y0ry8@sohu.com', '460722197310274613');
INSERT INTO `student` VALUES (52, '201624131252', '年洁', b'0', 1, '15207934210', 'ob7cu8mfat@sina.com', '150106198807231094');
INSERT INTO `student` VALUES (53, '201624131253', '房馥', b'1', 1, '13804683509', 'r44p9ayy@aol.com', '520205197709148496');
INSERT INTO `student` VALUES (54, '201624131254', '邱怡', b'1', 1, '13400988194', 'qih7s@gmail.com', '231609197107234488');
INSERT INTO `student` VALUES (55, '201624131255', '江学晨', b'0', 1, '13606356198', 'x4iejg0jn@163.net', '630219197105191768');
INSERT INTO `student` VALUES (56, '201624131256', '闵舒', b'1', 1, '15906592531', 'ptf7ivq9@sina.com', '221224197907226936');
INSERT INTO `student` VALUES (57, '201624131257', '续婉玲', b'0', 1, '13506136893', 'bho0r1a@yeah.net', '710617199309225817');
INSERT INTO `student` VALUES (58, '201624131258', '屠杰进', b'1', 1, '15505054415', '0455p84koh@qq.com', '370704197208047752');
INSERT INTO `student` VALUES (59, '201624131259', '尚玲莉', b'0', 1, '15107413534', '05wjn7zu@qq.com', '521809197011258852');
INSERT INTO `student` VALUES (60, '201624131260', '加岚娥', b'0', 1, '13604203429', 'oiny3fuvj@googlemail.com', '321810198008084351');
INSERT INTO `student` VALUES (61, '201624131261', '孙馨', b'1', 2, '15804312690', 'tinvr6x0@263.net', '321706198001067063');
INSERT INTO `student` VALUES (62, '201624131262', '庄博致', b'0', 2, '15000901504', 'btsm5ff@sina.com', '521321197601313139');
INSERT INTO `student` VALUES (63, '201624131263', '华菲', b'1', 2, '13804485662', '72pye9d@3721.net', '151617199704243897');
INSERT INTO `student` VALUES (64, '201624131264', '花健', b'0', 2, '15202521743', '39xla@ask.com', '350111199603215243');
INSERT INTO `student` VALUES (65, '201624131265', '秦霭宜', b'1', 2, '15600643331', '9hmqlx9c@msn.com', '431015199405131719');
INSERT INTO `student` VALUES (66, '201624131266', '壤怡舒', b'0', 2, '15801008814', '04swmx1j@263.net', '130503200001039935');
INSERT INTO `student` VALUES (67, '201624131267', '支振', b'0', 2, '15101924747', '6b0noxh8iz@sohu.com', '510723199210309627');
INSERT INTO `student` VALUES (68, '201624131268', '邓融', b'0', 2, '15107598585', 'bo26f8k@msn.com', '640314197312226238');
INSERT INTO `student` VALUES (69, '201624131269', '伍君昭', b'0', 2, '13403080237', 'v7pk5g@126.com', '211527197210218209');
INSERT INTO `student` VALUES (70, '201624131270', '平若壮', b'1', 2, '13600344340', 'vhhom@live.com', '621522199101025381');
INSERT INTO `student` VALUES (71, '201624131271', '邴莎琬', b'0', 2, '15202560401', 'uvwo40@sina.com', '420905197612065586');
INSERT INTO `student` VALUES (72, '201624131272', '阎媛', b'0', 2, '15901440877', '2c9ua@aol.com', '540101197305122612');
INSERT INTO `student` VALUES (73, '201624131273', '仲学', b'0', 2, '15603946345', '0kfvsayz@sina.com', '351501198501212030');
INSERT INTO `student` VALUES (74, '201624131274', '孙才', b'1', 2, '15106000782', 'iwzh53uic4@163.net', '421510198912245723');
INSERT INTO `student` VALUES (75, '201624131275', '呼彩园', b'0', 2, '13608727801', 'g2ly0z5bg@qq.com', '621402197405235456');
INSERT INTO `student` VALUES (76, '201624131276', '姚建', b'0', 2, '15803577542', '8gitwv2@hotmail.com', '111403199012195798');
INSERT INTO `student` VALUES (77, '201624131277', '蔚才', b'0', 2, '15102908014', 'k4hzearq@googlemail.com', '360228198212196571');
INSERT INTO `student` VALUES (78, '201624131278', '柴茂', b'0', 2, '13208572690', 'vyav1@126.com', '461104197004117893');
INSERT INTO `student` VALUES (79, '201624131279', '宇亨毅', b'0', 2, '13404378312', '4t0muokco@msn.com', '541805198809232743');
INSERT INTO `student` VALUES (80, '201624131280', '安健永', b'0', 2, '13502996309', 'awj1i@163.net', '131611197006094706');
INSERT INTO `student` VALUES (81, '201624131281', '鲍君', b'0', 2, '15303615904', 'bzzz1fk@ask.com', '371809197112313225');
INSERT INTO `student` VALUES (82, '201624131282', '商军勇', b'1', 2, '13503842834', 'se4p3@yahoo.com.cn', '221522198707096307');
INSERT INTO `student` VALUES (83, '201624131283', '惠蓉琦', b'0', 2, '15303543350', 'x5urg4gztn@263.net', '151425198405238981');
INSERT INTO `student` VALUES (84, '201624131284', '梁梦', b'1', 2, '13200314705', '1l5k7@163.com', '360807198309119933');
INSERT INTO `student` VALUES (85, '201624131285', '祁荔茜', b'1', 2, '13708355057', 'z89hmx@0355.net', '311419198110264502');
INSERT INTO `student` VALUES (86, '201624131286', '莫冠岩', b'0', 2, '15506924757', '2vsilwj@googlemail.com', '210902198704147782');
INSERT INTO `student` VALUES (87, '201624131287', '杜博杰', b'0', 2, '13602983491', 'dnfjygu001@hotmail.com', '231728198501099254');
INSERT INTO `student` VALUES (88, '201624131288', '堵信', b'1', 2, '13501555470', '78lbk@126.com', '330118197306064244');
INSERT INTO `student` VALUES (89, '201624131289', '有伟', b'1', 2, '15606766850', 'c727hms@yahoo.com.cn', '320104199708297959');
INSERT INTO `student` VALUES (90, '201624131290', '有龙', b'0', 2, '13808822286', 'c97jvp534@163.net', '710406198905211200');
INSERT INTO `student` VALUES (91, '201624131291', '吉瑶', b'1', 2, '13202560193', 'vxvkdjr7zu@sina.com', '421404197007086739');
INSERT INTO `student` VALUES (92, '201624131292', '诸莺', b'1', 2, '13008788720', 'dkg968jy2@263.net', '530120199002275407');
INSERT INTO `student` VALUES (93, '201624131293', '殴琛子', b'1', 2, '13608664435', 'kh44f4@googlemail.com', '611523197010219194');
INSERT INTO `student` VALUES (94, '201624131294', '邴羽萍', b'0', 2, '15203315658', '6j3k5f8sfq@yahoo.com', '151303198304287976');
INSERT INTO `student` VALUES (95, '201624131295', '郎士坚', b'1', 2, '15303762273', 'f03w7rj129@yeah.net', '451007198605197875');
INSERT INTO `student` VALUES (96, '201624131296', '公颖', b'0', 2, '15707636654', '9uf46vno@sohu.com', '711004198910063334');
INSERT INTO `student` VALUES (97, '201624131297', '芮欢', b'1', 2, '13407218602', '7cxa9f@yeah.net', '211410198611104044');
INSERT INTO `student` VALUES (98, '201624131298', '左宜', b'1', 2, '15504543541', 'i2f1nh@0355.net', '110811198501036226');
INSERT INTO `student` VALUES (99, '201624131299', '池伟胜', b'1', 2, '13303101994', 'rkvi9jsdbp@googlemail.com', '141303198106069372');
INSERT INTO `student` VALUES (100, '201624131300', '臧祥', b'1', 2, '15305310523', 'hxr5jo1n@qq.com', '410407199108215167');
INSERT INTO `student` VALUES (101, '201624131301', '百晨友', b'1', 2, '15207482542', '2bowdu@googlemail.com', '460819198012313674');
INSERT INTO `student` VALUES (102, '201624131302', '连荣', b'1', 2, '13204577362', 'k4kans6nqo@googlemail.com', '360310199307054610');
INSERT INTO `student` VALUES (103, '201624131303', '艾杰', b'1', 2, '13907650703', 'co0rlhq0j@126.com', '120121197912304557');
INSERT INTO `student` VALUES (104, '201624131304', '解凝', b'0', 2, '13701342035', '5j0ezl@ask.com', '621420197611026909');
INSERT INTO `student` VALUES (105, '201624131305', '匡艳纨', b'0', 2, '15300896589', '35mvcp@163.com', '540210199904272121');
INSERT INTO `student` VALUES (106, '201624131306', '鱼泰顺', b'1', 2, '13806082344', '1ihhc271s6@sina.com', '611415199101101089');
INSERT INTO `student` VALUES (107, '201624131307', '许克才', b'1', 2, '15005204327', 'c746zv2@163.com', '461411198202206869');
INSERT INTO `student` VALUES (108, '201624131308', '迟宁才', b'1', 2, '15306798974', '3qirn8@sohu.com', '540228199211012398');
INSERT INTO `student` VALUES (109, '201624131309', '单顺诚', b'0', 2, '13106413841', '1345r@sina.com', '450603199102012723');
INSERT INTO `student` VALUES (110, '201624131310', '任秋', b'1', 2, '13304381644', 'jt1i02a61@googlemail.com', '521113199008158344');
INSERT INTO `student` VALUES (111, '201624131311', '董馥娣', b'0', 2, '15000432444', 'rq96h@msn.com', '430228197805142868');
INSERT INTO `student` VALUES (112, '201624131312', '冉君馨', b'0', 2, '15805842495', 'mt6e7wknw@yahoo.com', '620226199207145279');
INSERT INTO `student` VALUES (113, '201624131313', '刁园雪', b'1', 2, '15902461514', 'obet43jiqm@163.com', '461203197806073354');
INSERT INTO `student` VALUES (114, '201624131314', '应清', b'0', 2, '13507203381', 'nbtxp71sd@sina.com', '501008197510075657');
INSERT INTO `student` VALUES (115, '201624131315', '阳雁', b'0', 2, '13406205792', '2chjs@ask.com', '321721198604021383');
INSERT INTO `student` VALUES (116, '201624131316', '农辉', b'1', 2, '13600064716', 'cf67se12@live.com', '520116199406275772');
INSERT INTO `student` VALUES (117, '201624131317', '山朗', b'0', 2, '15700485010', 'fvlzwmvws@yahoo.com.cn', '110409198609067606');
INSERT INTO `student` VALUES (118, '201624131318', '谭学', b'1', 2, '15906684519', '8neo6@yahoo.com', '461519198504309684');
INSERT INTO `student` VALUES (119, '201624131319', '法璧', b'0', 2, '15700447158', 'a12d6d09@yahoo.com', '321113199908283027');
INSERT INTO `student` VALUES (120, '201624131320', '农义厚', b'0', 2, '15000474466', 's4f8l5w@sina.com', '421311199412285728');
INSERT INTO `student` VALUES (121, '201624131321', '井欢', b'1', 3, '13606890675', 'q5dz6@hotmail.com', '430605197310064449');
INSERT INTO `student` VALUES (122, '201624131322', '谷琛清', b'0', 3, '15804821239', 'zdvf8@msn.com', '411106199308039438');
INSERT INTO `student` VALUES (123, '201624131323', '吉璧竹', b'0', 3, '13905625729', '4r8fn@gmail.com', '611224198809136827');
INSERT INTO `student` VALUES (124, '201624131324', '司力', b'1', 3, '13701631342', 'l0968z58iq@126.com', '610409198306076926');
INSERT INTO `student` VALUES (125, '201624131325', '宗荣 ', b'0', 3, '13103932332', 'jdt87sjx@gmail.com', '130426197106269536');
INSERT INTO `student` VALUES (126, '201624131326', '毛翰全', b'0', 3, '13307446276', '5j9331yx@ask.com', '540728198209163940');
INSERT INTO `student` VALUES (127, '201624131327', '庚心杰', b'1', 3, '13605212430', 'aj0ysd9mf@yahoo.com.cn', '220124199201071588');
INSERT INTO `student` VALUES (128, '201624131328', '包环聪', b'0', 3, '15902678132', 'bhw1fjx@263.net', '211801198502101314');
INSERT INTO `student` VALUES (129, '201624131329', '里政宁', b'0', 3, '13202208220', 'z8228u421v@hotmail.com', '141410198409197310');
INSERT INTO `student` VALUES (130, '201624131330', '邵会鹏', b'0', 3, '15507126879', '80vqld@sohu.com', '120302197711227101');
INSERT INTO `student` VALUES (131, '201624131331', '戴厚', b'0', 3, '13502055623', 'vpzlju9si@googlemail.com', '131720197003217974');
INSERT INTO `student` VALUES (132, '201624131332', '魏惠', b'0', 3, '13200965360', '57djs0tzj@sina.com', '120107199310142320');
INSERT INTO `student` VALUES (133, '201624131333', '康功', b'0', 3, '15700050730', 'ym2c0@163.com', '371402199610032171');
INSERT INTO `student` VALUES (134, '201624131334', '荣菲', b'0', 3, '13605475741', 'xj23l@aol.com', '411517199906278306');
INSERT INTO `student` VALUES (135, '201624131335', '那晨乐', b'1', 3, '13305586591', 'ezksfh@aol.com', '350516197008297838');
INSERT INTO `student` VALUES (136, '201624131336', '禹斌伟', b'1', 3, '15207493119', '6zj41wnul@263.net', '361809197703108624');
INSERT INTO `student` VALUES (137, '201624131337', '宁树', b'1', 3, '15306168975', 'gm3lyu7@126.com', '310301199105081485');
INSERT INTO `student` VALUES (138, '201624131338', '葛文', b'1', 3, '13008270537', 'uhrzkenxrx@msn.com', '650819199803162898');
INSERT INTO `student` VALUES (139, '201624131339', '米育', b'1', 3, '15306731253', 'kjeco@sina.com', '350107197111135594');
INSERT INTO `student` VALUES (140, '201624131340', '韦蓓蕊', b'0', 3, '13706530005', 'mpkv5@163.net', '351107199705298066');
INSERT INTO `student` VALUES (141, '201624131341', '孟翔', b'0', 3, '13403557956', 'zmx8tzf7@sohu.com', '411805197307277938');
INSERT INTO `student` VALUES (142, '201624131342', '辛云', b'1', 3, '15200254342', 'y51ij5@aol.com', '641210197303227405');
INSERT INTO `student` VALUES (143, '201624131343', '樊贞', b'0', 3, '13108511388', 'oyq7rj@163.net', '110518199409305690');
INSERT INTO `student` VALUES (144, '201624131344', '赵志', b'0', 3, '13900337414', 'jy2uv6cyu@sohu.com', '640324199107288441');
INSERT INTO `student` VALUES (145, '201624131345', '纪倩芸', b'1', 3, '15008012797', 'b1dw8ieyz@msn.com', '220502199509275060');
INSERT INTO `student` VALUES (146, '201624131346', '瞿纯', b'1', 3, '13308666747', 'gysl0a3@qq.com', '331022198701057621');
INSERT INTO `student` VALUES (147, '201624131347', '巫亨', b'1', 3, '15903282151', '1p25z2j@ask.com', '501302197112067806');
INSERT INTO `student` VALUES (148, '201624131348', '花奇泽', b'0', 3, '13308820104', '5n93g@yahoo.com', '510905199809072382');
INSERT INTO `student` VALUES (149, '201624131349', '晏胜', b'0', 3, '15807005242', '5ng6q@googlemail.com', '360318198708312914');
INSERT INTO `student` VALUES (150, '201624131350', '谷振轮', b'1', 3, '13002502980', '4lxbrzn5f@0355.net', '641827197104114832');
INSERT INTO `student` VALUES (151, '201624131351', '叶珍', b'0', 3, '15206885913', 'h6h6x@yahoo.com', '141528198801233130');
INSERT INTO `student` VALUES (152, '201624131352', '鄂鹏', b'0', 3, '15300336950', 'sveug@msn.com', '440319198909246788');
INSERT INTO `student` VALUES (153, '201624131353', '衡子武', b'1', 3, '13305270204', 'lvqfke@0355.net', '220503198112273431');
INSERT INTO `student` VALUES (154, '201624131354', '涂松文', b'1', 3, '15905742580', 'l9sjl0n@live.com', '460127198003274212');
INSERT INTO `student` VALUES (155, '201624131355', '别海', b'1', 3, '15507427572', 'xyj60jmfmy@ask.com', '321622199610056269');
INSERT INTO `student` VALUES (156, '201624131356', '沈芝', b'1', 3, '15505688250', 'qzs0v@126.com', '151623199103139515');
INSERT INTO `student` VALUES (157, '201624131357', '桂心顺', b'0', 3, '15302661095', 'ylf92ka5@yahoo.com', '150624199204023605');
INSERT INTO `student` VALUES (158, '201624131358', '乌钧', b'0', 3, '13805792928', '4bm7xay@hotmail.com', '331124199304181700');
INSERT INTO `student` VALUES (159, '201624131359', '关勤蕊', b'1', 3, '13702355178', '20751i@aol.com', '320513197009209946');
INSERT INTO `student` VALUES (160, '201624131360', '能楠', b'0', 3, '13500053991', '7eikm84@qq.com', '620513199012264099');
INSERT INTO `student` VALUES (161, '201624131361', '隗腾功', b'0', 3, '15605730837', '44p0c84c@gmail.com', '130914197912022353');
INSERT INTO `student` VALUES (162, '201624131362', '卜爱露', b'0', 3, '15807573983', '1ln1dfxsa@msn.com', '330919199110185682');
INSERT INTO `student` VALUES (163, '201624131363', '连琬', b'1', 3, '13901003599', 'mq72zm@googlemail.com', '461723199303315510');
INSERT INTO `student` VALUES (164, '201624131364', '柳融滢', b'0', 3, '15301551436', 'f6rtbxug@gmail.com', '530406197003113189');
INSERT INTO `student` VALUES (165, '201624131365', '艾政光', b'0', 3, '13908840031', 'nw4gt6@3721.net', '640713197309071196');
INSERT INTO `student` VALUES (166, '201624131366', '孙妹雪', b'1', 3, '15902893015', 'jnkk9u2@0355.net', '460816197907304828');
INSERT INTO `student` VALUES (167, '201624131367', '盛素英', b'0', 3, '15105347387', 'p55a58qw0g@ask.com', '321202198204014786');
INSERT INTO `student` VALUES (168, '201624131368', '訾国义', b'1', 3, '15608382451', '6q8kk5d8hi@live.com', '421025197808057210');
INSERT INTO `student` VALUES (169, '201624131369', '慕婷', b'0', 3, '15908588070', 'd1ioju@gmail.com', '511612199312229226');
INSERT INTO `student` VALUES (170, '201624131370', '路蓓华', b'1', 3, '15703920554', 'r3iff@msn.com', '541223199907056113');
INSERT INTO `student` VALUES (171, '201624131371', '戈洁琰', b'1', 3, '15708772858', 'dh5kfxn@ask.com', '620912197607237907');
INSERT INTO `student` VALUES (172, '201624131372', '公玉玲', b'1', 3, '15004766310', 'ooa4r9zj@live.com', '420818198710214915');
INSERT INTO `student` VALUES (173, '201624131373', '胥希莺', b'1', 3, '15801483291', '0ks3o66llp@aol.com', '440804198505095001');
INSERT INTO `student` VALUES (174, '201624131374', '穆天', b'1', 3, '15901854821', 'pyhwac52p@263.net', '630418198103138332');
INSERT INTO `student` VALUES (175, '201624131375', '华霭', b'1', 3, '15608445827', 'qq00d10mwv@sina.com', '711814198510262721');
INSERT INTO `student` VALUES (176, '201624131376', '汝爽玲', b'0', 3, '13808592772', 'prm87u@live.com', '650423199307018350');
INSERT INTO `student` VALUES (177, '201624131377', '拔和斌', b'1', 3, '13604968947', 'dgj0rbecoi@163.net', '211815197901077676');
INSERT INTO `student` VALUES (178, '201624131378', '卞天新', b'0', 3, '15806598263', 'g0su8odf58@126.com', '650319197710297043');
INSERT INTO `student` VALUES (179, '201624131379', '宁琴', b'1', 3, '15104437340', 's6ur5so1of@yeah.net', '330628198002291664');
INSERT INTO `student` VALUES (180, '201624131380', '庚河朋', b'0', 3, '15608836411', 'vpjt9pv8dk@qq.com', '321117197808274914');
INSERT INTO `student` VALUES (181, '201624131381', '门芸雪', b'0', 4, '15507224762', 'cdpw16@163.com', '611324199612021658');
INSERT INTO `student` VALUES (182, '201624131382', '车超', b'1', 4, '15604813600', 'h098wme@126.com', '810128198312028489');
INSERT INTO `student` VALUES (183, '201624131383', '容琴', b'1', 4, '13704202596', 'd1kcw@0355.net', '530314199609252386');
INSERT INTO `student` VALUES (184, '201624131384', '郁厚河', b'0', 4, '13408157947', 'ib32ynrk@msn.com', '371220197808272363');
INSERT INTO `student` VALUES (185, '201624131385', '陆俊浩', b'0', 4, '13306226831', '4jl4jdkttt@live.com', '500902199203011573');
INSERT INTO `student` VALUES (186, '201624131386', '督伦永', b'0', 4, '15506325963', '5yhpzr@hotmail.com', '311412197306267740');
INSERT INTO `student` VALUES (187, '201624131387', '连树', b'0', 4, '15107815910', 'bbcx9iogq@googlemail.com', '431001197309077901');
INSERT INTO `student` VALUES (188, '201624131388', '曹娟', b'1', 4, '15004334549', 'jtn885na9@ask.com', '341308198209201152');
INSERT INTO `student` VALUES (189, '201624131389', '农新', b'1', 4, '13702543991', 'soei6wiq85@live.com', '450326197301223312');
INSERT INTO `student` VALUES (190, '201624131390', '南建', b'1', 4, '15306932376', 'pgwd7v@aol.com', '510307198911283846');
INSERT INTO `student` VALUES (191, '201624131391', '马爱', b'0', 4, '13305206852', 'vr1zw46z@163.com', '461525199307171804');
INSERT INTO `student` VALUES (192, '201624131392', '成菊娴', b'0', 4, '15907295478', 'yg3nw@hotmail.com', '310119198309023756');
INSERT INTO `student` VALUES (193, '201624131393', '司彩莺', b'0', 4, '13103131731', 'o9pfw@yahoo.com.cn', '650707197301299260');
INSERT INTO `student` VALUES (194, '201624131394', '融娴姬', b'0', 4, '15508295435', '3x9ebvdg@googlemail.com', '630116198009027104');
INSERT INTO `student` VALUES (195, '201624131395', '毋厚', b'0', 4, '15503527591', 'k3gfvy4thd@ask.com', '330508198801287651');
INSERT INTO `student` VALUES (196, '201624131396', '梁婷雅', b'0', 4, '13204041046', 'wosvhoj2n9@live.com', '711004198112225979');
INSERT INTO `student` VALUES (197, '201624131397', '霍力', b'1', 4, '15608580875', 'l0m2xqif@263.net', '541409197006268043');
INSERT INTO `student` VALUES (198, '201624131398', '胡风', b'0', 4, '13403417760', 'pcr0jaes@gmail.com', '421019198910179276');
INSERT INTO `student` VALUES (199, '201624131399', '弓兰', b'1', 4, '15602543187', 'zv2c6a8z30@sohu.com', '361119199301199432');
INSERT INTO `student` VALUES (200, '201624131400', '晋翠', b'0', 4, '13402645440', 'zqj4fthdeg@hotmail.com', '361520199507146410');
INSERT INTO `student` VALUES (201, '201624131401', '弓梦凤', b'0', 4, '13603750947', 'm3qqyetf@gmail.com', '650913197501128847');
INSERT INTO `student` VALUES (202, '201624131402', '哈爽', b'0', 4, '15805903749', 'g6v8zwe1@ask.com', '531628197206287168');
INSERT INTO `student` VALUES (203, '201624131403', '宦新振', b'1', 4, '13705333320', '5dqnwxr@sina.com', '810228197409268496');
INSERT INTO `student` VALUES (204, '201624131404', '寇友言', b'0', 4, '15005689025', 'yp3we2@live.com', '210706198801093437');
INSERT INTO `student` VALUES (205, '201624131405', '曹国', b'0', 4, '15501741704', 'lbaw66va@3721.net', '121513197707062745');
INSERT INTO `student` VALUES (206, '201624131406', '拔树保', b'0', 4, '15607481026', 'e946w4zcc@yeah.net', '150821199310065098');
INSERT INTO `student` VALUES (207, '201624131407', '阎丽香', b'0', 4, '15505718371', 'hvkq1@live.com', '130514197708183900');
INSERT INTO `student` VALUES (208, '201624131408', '法纨珍', b'0', 4, '13005013219', 'w889pyk@ask.com', '500306199806274306');
INSERT INTO `student` VALUES (209, '201624131409', '文龙若', b'0', 4, '13306246823', '59pp862@163.net', '120627197605198496');
INSERT INTO `student` VALUES (210, '201624131410', '沙天', b'1', 4, '13902956758', '8sajggyq8@yahoo.com', '141528197103125731');
INSERT INTO `student` VALUES (211, '201624131411', '人勤', b'0', 4, '15505685589', '3ewqb7po@263.net', '431320198607043136');
INSERT INTO `student` VALUES (212, '201624131412', '南眉可', b'1', 4, '13900396430', 'txqx0k445d@163.com', '410906198105317631');
INSERT INTO `student` VALUES (213, '201624131413', '门庆天', b'0', 4, '15501142760', '3df2ijvu@yahoo.com', '451305199912089225');
INSERT INTO `student` VALUES (214, '201624131414', '钮宁', b'1', 4, '15305680689', '1tvvzj1w2@yahoo.com', '220928197904083960');
INSERT INTO `student` VALUES (215, '201624131415', '粱璧', b'1', 4, '15603440638', 'evw2v1nil@msn.com', '230725199002127444');
INSERT INTO `student` VALUES (216, '201624131416', '许希', b'0', 4, '15804727056', 'kyifwo7ro@sohu.com', '411606198003039590');
INSERT INTO `student` VALUES (217, '201624131417', '乌勇谦', b'1', 4, '13103572018', 'go4bpv4i3d@aol.com', '110619199612105168');
INSERT INTO `student` VALUES (218, '201624131418', '冷艺', b'0', 4, '13106550693', 'evqtcg@yahoo.com.cn', '631728199101061296');
INSERT INTO `student` VALUES (219, '201624131419', '詹鹏', b'0', 4, '15301621550', 'hpd7cjb@yahoo.com.cn', '510114198202206147');
INSERT INTO `student` VALUES (220, '201624131420', '敖世顺', b'0', 4, '13906878311', 'a6sne5i29@yeah.net', '320403199506266642');
INSERT INTO `student` VALUES (221, '201624131421', '喻美', b'0', 4, '13004136317', 'kam6ibe@3721.net', '351627198602131190');
INSERT INTO `student` VALUES (222, '201624131422', '侯功', b'1', 4, '13301174497', 'dhycb@live.com', '361511197402084136');
INSERT INTO `student` VALUES (223, '201624131423', '乐晶', b'0', 4, '15301643641', 'mf2yq@163.net', '641726198202185820');
INSERT INTO `student` VALUES (224, '201624131424', '宇家', b'1', 4, '13805036624', '5ee4vpdqu@3721.net', '620627198107151632');
INSERT INTO `student` VALUES (225, '201624131425', '杭兰彩', b'0', 4, '13000420760', '8gc67ia2x@qq.com', '111013198906094754');
INSERT INTO `student` VALUES (226, '201624131426', '尚冰', b'0', 4, '13002540548', 'ry1qh@0355.net', '810922197805256469');
INSERT INTO `student` VALUES (227, '201624131427', '任冠庆', b'1', 4, '13907170386', '3nw6vme@163.com', '710811199605249288');
INSERT INTO `student` VALUES (228, '201624131428', '曾珊荔', b'0', 4, '13300464985', '4q38567cu@yeah.net', '650814197409045080');
INSERT INTO `student` VALUES (229, '201624131429', '扶贵', b'1', 4, '13305302485', 'qcrv47bg@0355.net', '361706199110063462');
INSERT INTO `student` VALUES (230, '201624131430', '丘厚', b'0', 4, '13001677305', 'mo4e2tp@sohu.com', '610223197804074785');
INSERT INTO `student` VALUES (231, '201624131431', '毛浩坚', b'1', 4, '15700647866', 'r1yge4io@126.com', '520615199911059166');
INSERT INTO `student` VALUES (232, '201624131432', '狐江时', b'0', 4, '15200148623', 'f908w@263.net', '420127197512042642');
INSERT INTO `student` VALUES (233, '201624131433', '宗仪 ', b'0', 4, '13601731242', 'ibkc89y5@263.net', '311201199001053710');
INSERT INTO `student` VALUES (234, '201624131434', '卞彬', b'1', 4, '15908885794', 'vyg5u@live.com', '441108199505211587');
INSERT INTO `student` VALUES (235, '201624131435', '冷达毅', b'0', 4, '15101851330', 'gwsacas6@live.com', '351126199107141392');
INSERT INTO `student` VALUES (236, '201624131436', '霍浩刚', b'0', 4, '15703136550', 'v0f3nmihd@0355.net', '460104199303156385');
INSERT INTO `student` VALUES (237, '201624131437', '鲁中山', b'1', 4, '13400306192', 'rjwuidb@googlemail.com', '370708199807187463');
INSERT INTO `student` VALUES (238, '201624131438', '支贞', b'0', 4, '15100221780', '4icsc5j57@yeah.net', '640310197309087946');
INSERT INTO `student` VALUES (239, '201624131439', '蔡霄巧', b'0', 4, '13002491024', 'dnusep@aol.com', '220725198911196781');
INSERT INTO `student` VALUES (240, '201624131440', '匡庆', b'1', 4, '15004869033', 'a422bhl@live.com', '621007197301136962');
INSERT INTO `student` VALUES (241, '201624131441', '侯琴', b'0', 5, '13803452189', 'hgintq@aol.com', '141606198208248000');
INSERT INTO `student` VALUES (242, '201624131442', '宓仁超', b'1', 5, '13007993792', 'n4q6zgth@googlemail.com', '361811197309113395');
INSERT INTO `student` VALUES (243, '201624131443', '夏寒纨', b'0', 5, '15007086521', '612aul84@126.com', '811825199403246174');
INSERT INTO `student` VALUES (244, '201624131444', '厍黛青', b'0', 5, '15602098344', '1xvjla@aol.com', '340714197707176437');
INSERT INTO `student` VALUES (245, '201624131445', '于广旭', b'0', 5, '13100504831', 'gz36bgre@yahoo.com.cn', '461726198203288665');
INSERT INTO `student` VALUES (246, '201624131446', '封菲', b'1', 5, '13106342520', 'w0jpx348z@yeah.net', '451118197808263105');
INSERT INTO `student` VALUES (247, '201624131447', '山秋凤', b'0', 5, '15506728561', 'mz1ql6@ask.com', '320327197706129365');
INSERT INTO `student` VALUES (248, '201624131448', '沈彬', b'1', 5, '13807117257', 'ifn8cpj@aol.com', '220208197901221125');
INSERT INTO `student` VALUES (249, '201624131449', '薄斌飞', b'0', 5, '15004881646', 'rl32dy5@msn.com', '131622197410108006');
INSERT INTO `student` VALUES (250, '201624131450', '廖寒', b'1', 5, '13502147833', 'wgzuf8wusx@sina.com', '151218199604133025');
INSERT INTO `student` VALUES (251, '201624131451', '经固刚', b'1', 5, '13804436489', '7oh9zhxixg@3721.net', '810923197006016509');
INSERT INTO `student` VALUES (252, '201624131452', '佴奇榕', b'1', 5, '15701288985', '2coikg2y@3721.net', '811512197110303534');
INSERT INTO `student` VALUES (253, '201624131453', '诸玲玉', b'0', 5, '13501615372', '908vq6r9e@msn.com', '511116198601021362');
INSERT INTO `student` VALUES (254, '201624131454', '法才军', b'1', 5, '15903952792', 'o5k9a52@qq.com', '810412197212196044');
INSERT INTO `student` VALUES (255, '201624131455', '皇军心', b'0', 5, '15804977220', '902deeqqv@aol.com', '630419198403124932');
INSERT INTO `student` VALUES (256, '201624131456', '东炎', b'1', 5, '13306432098', 'lsayp@yeah.net', '430602199811019722');
INSERT INTO `student` VALUES (257, '201624131457', '汝静青', b'0', 5, '15901292513', '5y7f3gklyd@hotmail.com', '351518198412104557');
INSERT INTO `student` VALUES (258, '201624131458', '凤庆', b'1', 5, '15504811401', '28yfpj5@3721.net', '511019197701012616');
INSERT INTO `student` VALUES (259, '201624131459', '邵璧', b'0', 5, '13403371314', '1g5hqlp9c@sina.com', '630809197509057869');
INSERT INTO `student` VALUES (260, '201624131460', '涂园爱', b'0', 5, '13606903466', 'a3br9whpyd@gmail.com', '220807197108245542');
INSERT INTO `student` VALUES (261, '201624131461', '晁琦露', b'0', 5, '15005272384', 'qcrt93be6o@hotmail.com', '230219197107153381');
INSERT INTO `student` VALUES (262, '201624131462', '俟弘顺', b'1', 5, '15706581036', 'nbq5m3@googlemail.com', '350618197410241752');
INSERT INTO `student` VALUES (263, '201624131463', '尹振友', b'0', 5, '15606038769', 'loym5cb0xk@263.net', '140220198012254407');
INSERT INTO `student` VALUES (264, '201624131464', '田壮', b'0', 5, '15905382030', 'pd826blwk9@0355.net', '651625199303201225');
INSERT INTO `student` VALUES (265, '201624131465', '雕全', b'0', 5, '15208277194', 'vthgk@aol.com', '521502198307291622');
INSERT INTO `student` VALUES (266, '201624131466', '平静', b'0', 5, '13506167891', 'cepn3q@aol.com', '611306198103044412');
INSERT INTO `student` VALUES (267, '201624131467', '郭刚', b'1', 5, '13605724552', '9gzs2@yahoo.com', '431803197104179818');
INSERT INTO `student` VALUES (268, '201624131468', '殳秀', b'1', 5, '15701742068', '7sgsvv@googlemail.com', '120907197110102758');
INSERT INTO `student` VALUES (269, '201624131469', '东琴', b'1', 5, '13207406292', 'mciv3wcid@yeah.net', '620803198110172175');
INSERT INTO `student` VALUES (270, '201624131470', '赏克', b'0', 5, '15805985365', 'crah0kjtji@yeah.net', '811112199909127037');
INSERT INTO `student` VALUES (271, '201624131471', '魏强', b'0', 5, '13102083429', 'mhpsw@sohu.com', '121803197507147342');
INSERT INTO `student` VALUES (272, '201624131472', '广伦贵', b'1', 5, '15501617004', 'eni38@sohu.com', '421215197107257203');
INSERT INTO `student` VALUES (273, '201624131473', '麻 君', b'0', 5, '15103913545', 'ujpshmgg4@msn.com', '811323197205178554');
INSERT INTO `student` VALUES (274, '201624131474', '汲振安', b'0', 5, '13101434661', 'yxq7r9ef@aol.com', '431001198011207990');
INSERT INTO `student` VALUES (275, '201624131475', '郑勤可', b'1', 5, '13707360198', '60wkkbj@gmail.com', '451221198810207054');
INSERT INTO `student` VALUES (276, '201624131476', '权丹妹', b'0', 5, '13801986235', 's0o9vn@aol.com', '360120198608034264');
INSERT INTO `student` VALUES (277, '201624131477', '鞠素翠', b'1', 5, '15903424001', 'eqa53jc0@gmail.com', '461325199903217293');
INSERT INTO `student` VALUES (278, '201624131478', '叶博贵', b'0', 5, '15203183056', 'aneg88@qq.com', '440104199807287414');
INSERT INTO `student` VALUES (279, '201624131479', '鱼胜江', b'1', 5, '15702972164', 'ofyqk@yeah.net', '460724199211029344');
INSERT INTO `student` VALUES (280, '201624131480', '萧春瑶', b'0', 5, '13806235959', '2ffz7g5qn@263.net', '631626198702225657');
INSERT INTO `student` VALUES (281, '201624131481', '寇生', b'0', 5, '13501473043', 'y7yehnpt02@sohu.com', '311217198103186784');
INSERT INTO `student` VALUES (282, '201624131482', '晏壮思', b'1', 5, '13104205860', '0eicu7fy8@163.com', '530123199208101674');
INSERT INTO `student` VALUES (283, '201624131483', '琴良辰', b'1', 5, '15305343750', 'wepnk68@163.net', '651416199711208532');
INSERT INTO `student` VALUES (284, '201624131484', '叔玉娟', b'0', 5, '15503282086', '4g9w9@126.com', '111202198601217643');
INSERT INTO `student` VALUES (285, '201624131485', '邢婉珊', b'0', 5, '13003254911', 'rrkex04@263.net', '631626197204231045');
INSERT INTO `student` VALUES (304, '201624131199', '徐风', b'1', 12, '13404428674', 'admin@ww.com', '620615198310099195');
INSERT INTO `student` VALUES (305, '201624131198', '瑶翠', b'1', 13, '13404428674', 'admin@dd.cin', '620615198310099195');
INSERT INTO `student` VALUES (306, '201624131501', '测试', b'1', 11, '13404428674', '201624131220@DD.ddd', '620615198310099195');
COMMIT;

-- ----------------------------
-- Table structure for sysLog
-- ----------------------------
DROP TABLE IF EXISTS `sysLog`;
CREATE TABLE `sysLog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `visitTime` datetime DEFAULT NULL,
  `executionTime` int DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3472 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sysLog
-- ----------------------------
BEGIN;
INSERT INTO `sysLog` VALUES (2, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-03-25 19:08:01', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3, '201624131220', '0:0:0:0:0:0:0:1', '/user/userDetails.do', '2020-03-25 19:08:09', 32, '[类名] com.handy.controller.UserController[方法名] userDetails');
INSERT INTO `sysLog` VALUES (4, '201624131220', '0:0:0:0:0:0:0:1', '/feedback/feedbackList.do', '2020-03-25 19:08:12', 14, '[类名] com.handy.controller.FeedbackController[方法名] feedback');
INSERT INTO `sysLog` VALUES (5, '201624131220', '0:0:0:0:0:0:0:1', '/user/userDetails.do', '2020-03-25 19:10:51', 43, '[类名] com.handy.controller.UserController[方法名] userDetails');
INSERT INTO `sysLog` VALUES (6, '201624131220', '0:0:0:0:0:0:0:1', '/user/updatePW.do', '2020-03-25 19:10:52', 0, '[类名] com.handy.controller.UserController[方法名] updatePW');
INSERT INTO `sysLog` VALUES (7, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-03-25 19:11:27', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (8, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-03-25 19:11:36', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (9, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 13:41:26', 4976, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (10, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-26 13:41:33', 2, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (11, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-03-26 13:42:03', 146, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (12, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 13:42:05', 868, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (13, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-26 13:42:07', 4, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (14, 'admin', '0:0:0:0:0:0:0:1', '/student/update.do', '2020-03-26 13:42:16', 1, '[类名] com.handy.controller.StudentController[方法名] update');
INSERT INTO `sysLog` VALUES (15, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 13:42:17', 574, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (16, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-26 13:42:41', 1, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (17, 'admin', '0:0:0:0:0:0:0:1', '/student/update.do', '2020-03-26 13:42:45', 2, '[类名] com.handy.controller.StudentController[方法名] update');
INSERT INTO `sysLog` VALUES (18, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 13:44:06', 554, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (19, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-26 13:44:11', 3, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (20, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-26 13:44:29', 3, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (21, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-26 13:44:39', 2, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (22, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 13:45:06', 550, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (23, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-26 13:45:14', 1, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (24, 'admin', '0:0:0:0:0:0:0:1', '/student/update.do', '2020-03-26 13:45:17', 7, '[类名] com.handy.controller.StudentController[方法名] update');
INSERT INTO `sysLog` VALUES (25, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 13:45:33', 641, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (26, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-26 13:45:40', 2, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (27, 'admin', '0:0:0:0:0:0:0:1', '/student/update.do', '2020-03-26 13:45:43', 5, '[类名] com.handy.controller.StudentController[方法名] update');
INSERT INTO `sysLog` VALUES (28, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 13:45:44', 402, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (29, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-26 13:45:48', 1, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (30, 'admin', '0:0:0:0:0:0:0:1', '/student/update.do', '2020-03-26 13:45:52', 2, '[类名] com.handy.controller.StudentController[方法名] update');
INSERT INTO `sysLog` VALUES (31, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 13:45:53', 355, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (32, 'admin', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-03-26 13:46:15', 11, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (33, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-03-26 13:46:17', 4, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (34, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 13:46:23', 326, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (35, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 13:46:42', 403, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (36, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 13:46:44', 403, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (37, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 13:48:07', 381, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (38, 'admin', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-03-26 13:48:48', 7, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (39, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 13:48:49', 298, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (40, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 13:48:49', 350, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (41, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 13:51:17', 349, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (42, 'admin', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-03-26 18:44:59', 18, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (43, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 18:45:02', 279, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (44, 'admin', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-03-26 18:45:05', 6, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (45, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 18:45:06', 284, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (46, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-26 18:45:10', 3, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (47, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-26 18:45:13', 2, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (48, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-26 18:45:44', 3, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (49, 'admin', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-03-26 18:59:56', 14, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (50, 'admin', '0:0:0:0:0:0:0:1', '/classes/findAll.do', '2020-03-26 18:59:57', 24, '[类名] com.handy.controller.ClassesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (51, 'admin', '0:0:0:0:0:0:0:1', '/classes/findAll.do', '2020-03-26 19:00:00', 5, '[类名] com.handy.controller.ClassesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (52, 'admin', '0:0:0:0:0:0:0:1', '/department/findAll.do', '2020-03-26 19:00:07', 13, '[类名] com.handy.controller.DepartmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (53, 'admin', '0:0:0:0:0:0:0:1', '/classes/findAll.do', '2020-03-26 19:00:09', 5, '[类名] com.handy.controller.ClassesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (54, 'admin', '0:0:0:0:0:0:0:1', '/department/findAll.do', '2020-03-26 19:00:10', 3, '[类名] com.handy.controller.DepartmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (55, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-26 19:00:16', 386, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (56, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-26 19:00:43', 4, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (57, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-26 19:00:45', 1, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (58, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-28 15:36:09', 1204, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (59, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:36:13', 3, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (60, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:37:07', 7, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (61, 'admin', '0:0:0:0:0:0:0:1', '/user/user.do', '2020-03-28 15:37:16', 453, '[类名] com.handy.controller.UserController[方法名] userSetting');
INSERT INTO `sysLog` VALUES (62, 'admin', '0:0:0:0:0:0:0:1', '/feedback/feedbackList.do', '2020-03-28 15:37:19', 18, '[类名] com.handy.controller.FeedbackController[方法名] feedback');
INSERT INTO `sysLog` VALUES (63, 'admin', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-03-28 15:37:25', 20, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (64, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-03-28 15:37:26', 15, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (65, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-28 15:37:28', 407, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (66, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:37:32', 2, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (67, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:38:33', 2, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (68, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-03-28 15:39:17', 2, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (69, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-28 15:39:20', 412, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (70, '201624131220', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:39:27', 1, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (71, '201624131220', '0:0:0:0:0:0:0:1', '/user/user.do', '2020-03-28 15:41:07', 359, '[类名] com.handy.controller.UserController[方法名] userSetting');
INSERT INTO `sysLog` VALUES (72, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-28 15:41:13', 345, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (73, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-03-28 15:41:25', 11, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (74, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findDetailsBytId.do', '2020-03-28 15:41:28', 20, '[类名] com.handy.controller.TeacherController[方法名] findDetailsBytId');
INSERT INTO `sysLog` VALUES (75, '201624131220', '0:0:0:0:0:0:0:1', '/classes/findAll.do', '2020-03-28 15:41:53', 10, '[类名] com.handy.controller.ClassesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (76, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-03-28 15:41:55', 3, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (77, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-28 15:41:58', 369, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (78, '201624131220', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:42:01', 2, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (79, '201624131220', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:42:13', 2, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (80, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-28 15:42:38', 551, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (81, '201624131220', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:42:40', 1, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (82, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-28 15:43:13', 400, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (83, '201624131220', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:43:15', 2, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (84, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-28 15:43:40', 427, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (85, '201624131220', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:43:41', 1, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (86, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-28 15:43:59', 262, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (87, '201624131220', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:44:01', 1, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (88, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-28 15:44:19', 557, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (89, '201624131220', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:44:21', 1, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (90, '201624131220', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:44:42', 1, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (91, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-28 15:44:43', 242, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (92, '201624131220', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:44:45', 1, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (93, '201624131220', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:45:05', 1, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (94, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-28 15:45:21', 323, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (95, '201624131220', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:45:22', 4, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (96, '201624131220', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:57:13', 3, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (97, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-28 15:59:03', 285, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (98, '201624131220', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:59:04', 2, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (99, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-03-28 15:59:52', 219, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (100, '201624131220', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-03-28 15:59:53', 1, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (2054, '201624131220', '0:0:0:0:0:0:0:1', '/feedback/feedbackList.do', '2020-04-09 14:52:57', 2, '[类名] com.handy.controller.FeedbackController[方法名] feedback');
INSERT INTO `sysLog` VALUES (2055, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 16:59:59', 138, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2056, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 17:00:33', 38, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2057, '201624131220', '0:0:0:0:0:0:0:1', '/user/userDetails.do', '2020-04-09 17:03:17', 59, '[类名] com.handy.controller.UserController[方法名] userDetails');
INSERT INTO `sysLog` VALUES (2058, '201624131220', '0:0:0:0:0:0:0:1', '/user/user.do', '2020-04-09 17:03:23', 408, '[类名] com.handy.controller.UserController[方法名] userSetting');
INSERT INTO `sysLog` VALUES (2059, '201624131220', '0:0:0:0:0:0:0:1', '/role/findAllList.do', '2020-04-09 17:03:25', 12, '[类名] com.handy.controller.RoleController[方法名] findAllList');
INSERT INTO `sysLog` VALUES (2060, '201624131220', '0:0:0:0:0:0:0:1', '/role/findRoleList.do', '2020-04-09 17:03:26', 698, '[类名] com.handy.controller.RoleController[方法名] findRoleList');
INSERT INTO `sysLog` VALUES (2061, '201624131220', '0:0:0:0:0:0:0:1', '/role/findAllList.do', '2020-04-09 17:03:29', 2, '[类名] com.handy.controller.RoleController[方法名] findAllList');
INSERT INTO `sysLog` VALUES (2062, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:14:03', 109, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2063, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:14:15', 22, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2064, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:14:16', 19, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2065, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:14:22', 16, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2066, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:14:45', 15, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2067, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:14:46', 12, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2068, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:14:49', 11, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2069, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:14:57', 14, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2070, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:15:35', 133, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2071, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:16:31', 13, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2072, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:16:37', 12, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2073, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 17:16:51', 38, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2074, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:16:53', 10, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2075, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 17:16:53', 26, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2076, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:16:55', 9, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2077, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 17:16:56', 27, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2078, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:16:56', 8, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2079, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:17:13', 8, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2080, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:17:21', 6, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2081, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-09 17:17:38', 11, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2082, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manageFindDetailsBysId.do', '2020-04-09 17:17:42', 26, '[类名] com.handy.controller.SportmeetingController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2083, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manageFindDetailsBysId.do', '2020-04-09 17:19:13', 30, '[类名] com.handy.controller.SportmeetingController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2084, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manageFindDetailsBysId.do', '2020-04-09 17:19:24', 30, '[类名] com.handy.controller.SportmeetingController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2085, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manageFindDetailsBysId.do', '2020-04-09 17:19:57', 31, '[类名] com.handy.controller.SportmeetingController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2086, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-09 17:20:02', 2, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2087, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manageFindDetailsBysId.do', '2020-04-09 17:20:03', 27, '[类名] com.handy.controller.SportmeetingController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2088, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-09 17:20:10', 2, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2089, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manageFindDetailsBysId.do', '2020-04-09 17:20:15', 18, '[类名] com.handy.controller.SportmeetingController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2090, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-09 17:20:53', 7, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2091, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manageFindDetailsBysId.do', '2020-04-09 17:20:55', 16, '[类名] com.handy.controller.SportmeetingController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2092, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-09 17:21:07', 3, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2093, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manageFindDetailsBysId.do', '2020-04-09 17:21:09', 20, '[类名] com.handy.controller.SportmeetingController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2094, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manageFindDetailsBysId.do', '2020-04-09 17:21:16', 23, '[类名] com.handy.controller.SportmeetingController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2095, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manageFindDetailsBysId.do', '2020-04-09 17:21:38', 29, '[类名] com.handy.controller.SportmeetingController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2096, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-09 17:21:43', 12, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (2097, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 17:21:44', 13, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2098, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 17:21:46', 18, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2099, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:21:50', 6, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2100, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 17:25:58', 13, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2101, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 17:28:10', 18, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2102, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:28:12', 6, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2103, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 17:31:30', 11, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2104, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 17:31:32', 7, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2105, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 17:32:56', 3, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2106, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 17:33:13', 4, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2107, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 17:33:24', 4, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2108, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 17:34:49', 138, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2109, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 17:34:51', 18, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2110, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-09 17:34:52', 15, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2111, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 17:34:55', 9, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2112, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-09 17:34:56', 6, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2113, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 17:35:00', 6, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2114, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-09 17:35:01', 6, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2115, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 17:35:04', 8, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2116, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 17:35:07', 13, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2117, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 17:35:08', 9, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2118, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:35:15', 13, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2119, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manageInput.do', '2020-04-09 17:35:16', 31, '[类名] com.handy.controller.MatchesController[方法名] manageInput');
INSERT INTO `sysLog` VALUES (2120, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manageInput.do', '2020-04-09 17:35:30', 40, '[类名] com.handy.controller.MatchesController[方法名] manageInput');
INSERT INTO `sysLog` VALUES (2121, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 17:35:38', 10, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2122, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 17:36:06', 10, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2123, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 17:37:06', 12, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2124, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 17:37:08', 21, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2125, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:37:09', 6, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2126, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manageInput.do', '2020-04-09 17:37:14', 23, '[类名] com.handy.controller.MatchesController[方法名] manageInput');
INSERT INTO `sysLog` VALUES (2127, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 17:37:24', 34, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2128, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 17:37:26', 6, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2129, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:43:01', 115, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2130, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manageInput.do', '2020-04-09 17:43:02', 2, '[类名] com.handy.controller.MatchesController[方法名] manageInput');
INSERT INTO `sysLog` VALUES (2131, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manageInput.do', '2020-04-09 17:43:54', 3, '[类名] com.handy.controller.MatchesController[方法名] manageInput');
INSERT INTO `sysLog` VALUES (2132, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manageInput.do', '2020-04-09 17:43:55', 21, '[类名] com.handy.controller.MatchesController[方法名] manageInput');
INSERT INTO `sysLog` VALUES (2133, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manageInput.do', '2020-04-09 17:43:56', 2, '[类名] com.handy.controller.MatchesController[方法名] manageInput');
INSERT INTO `sysLog` VALUES (2134, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manageInput.do', '2020-04-09 17:43:56', 4, '[类名] com.handy.controller.MatchesController[方法名] manageInput');
INSERT INTO `sysLog` VALUES (2135, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manageInput.do', '2020-04-09 17:43:57', 2, '[类名] com.handy.controller.MatchesController[方法名] manageInput');
INSERT INTO `sysLog` VALUES (2136, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 17:44:00', 36, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2137, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:44:03', 14, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2138, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manageInput.do', '2020-04-09 17:44:04', 9, '[类名] com.handy.controller.MatchesController[方法名] manageInput');
INSERT INTO `sysLog` VALUES (2139, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 17:47:52', 19, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2140, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 17:47:59', 14, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2141, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 17:48:01', 13, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2142, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 17:48:28', 126, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2143, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 17:48:30', 13, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2144, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 17:50:08', 27, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2145, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 17:51:07', 117, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2146, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 17:51:09', 12, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2147, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:51:12', 26, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2148, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:52:49', 18, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2149, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:53:17', 17, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2150, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 17:53:20', 11, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2151, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 17:53:41', 28, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2152, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 17:53:43', 6, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2153, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 17:54:16', 6, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2154, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 17:55:44', 12, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2155, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 19:53:28', 153, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2156, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 19:53:31', 29, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2157, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 19:53:40', 23, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2158, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 19:53:45', 14, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2159, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 19:53:47', 18, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2160, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 19:53:48', 13, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2161, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 19:53:57', 13, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2162, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 19:53:58', 8, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2163, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 19:54:04', 13, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2164, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 19:54:07', 8, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2165, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 19:55:38', 113, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2166, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 19:55:42', 30, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2167, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 19:55:43', 22, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2168, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 19:55:45', 16, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2169, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 19:55:46', 11, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2170, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 19:57:32', 116, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2171, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 19:57:34', 24, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2172, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 19:57:36', 20, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2173, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 19:57:37', 16, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2174, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 19:57:49', 47, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2175, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-09 19:57:54', 5, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2176, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 19:57:55', 29, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2177, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-09 19:57:56', 5, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2178, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 19:57:58', 11, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2179, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 19:58:01', 7, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2180, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 19:58:03', 13, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2181, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 19:58:04', 8, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2182, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 19:58:07', 10, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2183, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:07:29', 50, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2184, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:07:32', 93, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2185, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:07:34', 10, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2186, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:07:35', 10, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2187, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:07:37', 6, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2188, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:07:38', 13, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2189, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:07:39', 4, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2190, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:07:40', 9, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2191, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:07:42', 3, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2192, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:07:43', 11, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2193, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:07:45', 3, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2194, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:07:45', 10, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2195, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:07:47', 3, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2196, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:07:59', 5, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2197, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:08:00', 3, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2198, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:08:02', 3, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2199, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:08:03', 3, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2200, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:08:05', 4, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2201, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:08:06', 4, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2202, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:08:12', 10, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2203, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-09 20:08:39', 6, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2204, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-09 20:09:10', 4, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2205, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:09:12', 11, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2206, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-09 20:09:14', 4, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2207, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:09:22', 7, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2208, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-09 20:09:24', 7, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2209, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:09:26', 9, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2210, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-09 20:09:28', 5, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2211, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:09:33', 8, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2212, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-09 20:09:35', 5, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2213, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findAll.do', '2020-04-09 20:09:37', 38, '[类名] com.handy.controller.MatchesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2214, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:09:43', 4, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2215, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:09:46', 9, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2216, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:09:48', 2, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2217, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:09:58', 7, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2218, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 20:10:21', 15, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2219, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:10:28', 8, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2220, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 20:10:31', 12, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2221, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:10:33', 9, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2222, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 20:10:35', 8, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2223, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:10:36', 6, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2224, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-09 20:10:40', 5, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2225, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:10:42', 8, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2226, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:11:04', 3, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2227, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:11:19', 2, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2228, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:11:21', 25, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2229, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:11:24', 2, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2230, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:11:33', 10, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2231, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:21:43', 29, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2232, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:21:44', 85, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2233, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-09 20:21:54', 74, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (2234, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:21:55', 16, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2235, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-09 20:22:19', 9, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (2236, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:23:12', 32, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2237, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:23:14', 136, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2238, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-09 20:23:17', 2, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (2239, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:23:18', 17, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2240, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 20:23:21', 34, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2241, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:23:23', 6, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2242, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:23:25', 7, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2243, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-09 20:23:35', 3, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (2244, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:23:36', 6, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2245, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:24:07', 6, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2246, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:24:09', 8, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2247, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:24:12', 8, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2248, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-09 20:24:18', 2, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (2249, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:24:20', 8, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2250, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:24:22', 3, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2251, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:24:52', 5, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2252, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:24:55', 10, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2253, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:25:50', 3, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2254, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:25:51', 7, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2255, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:26:56', 7, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2256, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:27:11', 6, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2257, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:28:06', 7, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2258, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:28:22', 3, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2259, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:28:23', 10, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2260, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:28:49', 3, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2261, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:28:51', 7, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2262, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:35:10', 4, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2263, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:35:12', 13, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2264, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:36:05', 6, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2265, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:36:34', 8, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2266, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:37:50', 12, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2267, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:37:52', 4, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2268, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:37:54', 6, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2269, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:37:56', 5, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2270, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:37:58', 2, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2271, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:37:59', 7, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2272, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:38:23', 8, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2273, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:38:32', 3, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2274, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-09 20:38:33', 9, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2275, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 20:38:53', 26, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2276, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:38:58', 2, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2277, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 20:39:00', 14, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2278, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:39:02', 10, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2279, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 20:39:05', 10, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2280, '201624131220', '0:0:0:0:0:0:0:1', '/event/findById.do', '2020-04-09 20:39:07', 3, '[类名] com.handy.controller.EventController[方法名] findById');
INSERT INTO `sysLog` VALUES (2281, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:39:09', 7, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2282, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:40:35', 5, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2283, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:41:37', 7, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2284, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:41:43', 8, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2285, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 20:42:06', 26, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2286, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 20:42:24', 18, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2287, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 20:42:26', 7, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2288, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:42:27', 13, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2289, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 20:42:48', 7, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2290, '201624131220', '0:0:0:0:0:0:0:1', '/event/findById.do', '2020-04-09 20:42:49', 2, '[类名] com.handy.controller.EventController[方法名] findById');
INSERT INTO `sysLog` VALUES (2291, '201624131220', '0:0:0:0:0:0:0:1', '/event/update.do', '2020-04-09 20:42:54', 3, '[类名] com.handy.controller.EventController[方法名] update');
INSERT INTO `sysLog` VALUES (2292, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 20:42:55', 10, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2293, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:42:56', 7, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2294, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 20:43:13', 22, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2295, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 20:43:43', 6, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2296, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:43:44', 7, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2297, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 20:44:21', 24, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2298, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-09 20:44:34', 5, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2299, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-09 20:44:43', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2300, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-09 20:44:47', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2301, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 20:45:03', 7, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2302, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 20:45:05', 5, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2303, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:45:06', 5, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2304, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-09 20:45:09', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2305, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-09 20:45:13', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2306, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:49:46', 14, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2307, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:50:37', 5, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2308, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-09 20:50:40', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2309, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:50:49', 5, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2310, '201624131220', '0:0:0:0:0:0:0:1', '/matches/insert.do', '2020-04-09 20:51:04', 101, '[类名] com.handy.controller.MatchesController[方法名] insert');
INSERT INTO `sysLog` VALUES (2311, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:51:05', 5, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2312, '201624131220', '0:0:0:0:0:0:0:1', '/matches/insert.do', '2020-04-09 20:51:23', 8, '[类名] com.handy.controller.MatchesController[方法名] insert');
INSERT INTO `sysLog` VALUES (2313, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:51:24', 6, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2314, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-09 20:53:21', 36, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2315, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 20:53:22', 103, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2316, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:53:24', 14, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2317, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-09 20:53:27', 8, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2318, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-09 20:53:30', 7, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2319, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-09 20:53:32', 73, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2320, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:53:33', 16, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2321, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-09 20:53:37', 10, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2322, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-09 20:53:43', 9, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2323, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:54:29', 7, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2324, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 20:54:38', 13, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2325, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:54:40', 10, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2326, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-09 20:54:42', 5, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2327, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-09 20:54:45', 3, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2328, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:54:47', 9, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2329, '201624131220', '0:0:0:0:0:0:0:1', '/matches/insert.do', '2020-04-09 20:54:50', 12, '[类名] com.handy.controller.MatchesController[方法名] insert');
INSERT INTO `sysLog` VALUES (2330, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:54:51', 12, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2331, '201624131220', '0:0:0:0:0:0:0:1', '/matches/insert.do', '2020-04-09 20:54:56', 5, '[类名] com.handy.controller.MatchesController[方法名] insert');
INSERT INTO `sysLog` VALUES (2332, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 20:56:26', 116, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2333, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:56:27', 14, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2334, '201624131220', '0:0:0:0:0:0:0:1', '/matches/insert.do', '2020-04-09 20:56:31', 13, '[类名] com.handy.controller.MatchesController[方法名] insert');
INSERT INTO `sysLog` VALUES (2335, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 20:56:32', 15, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2336, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-09 22:28:55', 310, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2337, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-09 22:28:58', 12, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2338, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 22:29:00', 12, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2339, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-09 22:29:08', 9, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2340, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-10 12:18:41', 26, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2341, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-10 12:18:43', 19, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2342, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-10 12:18:51', 15, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2343, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-10 12:18:54', 7, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2344, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:29:50', 107, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2345, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-12 17:29:53', 22, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (2346, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-12 17:29:55', 5, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2347, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findBysId.do', '2020-04-12 17:29:56', 4, '[类名] com.handy.controller.SportmeetingController[方法名] findProjectById');
INSERT INTO `sysLog` VALUES (2348, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-12 17:31:16', 5, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2349, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-12 17:31:22', 4, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2350, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findBysId.do', '2020-04-12 17:31:24', 2, '[类名] com.handy.controller.SportmeetingController[方法名] findProjectById');
INSERT INTO `sysLog` VALUES (2351, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/update.do', '2020-04-12 17:31:27', 10, '[类名] com.handy.controller.SportmeetingController[方法名] update');
INSERT INTO `sysLog` VALUES (2352, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-12 17:31:28', 3, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2353, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findBysId.do', '2020-04-12 17:31:30', 2, '[类名] com.handy.controller.SportmeetingController[方法名] findProjectById');
INSERT INTO `sysLog` VALUES (2354, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/update.do', '2020-04-12 17:31:33', 4, '[类名] com.handy.controller.SportmeetingController[方法名] update');
INSERT INTO `sysLog` VALUES (2355, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-12 17:31:34', 3, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2356, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-12 17:32:26', 4, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2357, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-12 17:32:27', 6, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2358, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:36:01', 1, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2359, '201624131220', '0:0:0:0:0:0:0:1', '/user/userDetails.do', '2020-04-12 17:36:04', 139, '[类名] com.handy.controller.UserController[方法名] userDetails');
INSERT INTO `sysLog` VALUES (2360, '201624131220', '0:0:0:0:0:0:0:1', '/user/updatePW.do', '2020-04-12 17:36:06', 0, '[类名] com.handy.controller.UserController[方法名] updatePW');
INSERT INTO `sysLog` VALUES (2361, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:36:09', 5, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2362, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:37:17', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2363, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:37:18', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2364, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:37:22', 5, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2365, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:38:14', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2366, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:38:15', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2367, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:38:18', 4, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2368, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:38:57', 5, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2369, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:38:58', 4, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2370, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:38:59', 4, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2371, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:38:59', 3, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2372, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:38:59', 3, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2373, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:39:00', 6, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2374, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:39:00', 4, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2375, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:39:01', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2376, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:39:22', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2377, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:39:23', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2378, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:39:24', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2379, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-12 17:39:26', 95, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2380, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-12 17:39:26', 3, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2381, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:39:29', 2, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2382, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:41:11', 7, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2383, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:41:13', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2384, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-12 17:41:15', 15, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2385, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-12 17:41:17', 53, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2386, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-12 17:41:22', 55, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2387, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-12 17:41:24', 45, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2388, '201624131220', '0:0:0:0:0:0:0:1', '/department/findAll.do', '2020-04-12 17:41:50', 23, '[类名] com.handy.controller.DepartmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2389, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAllTeachers.do', '2020-04-12 17:42:03', 2, '[类名] com.handy.controller.TeacherController[方法名] findAllTeachers');
INSERT INTO `sysLog` VALUES (2390, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAllTeachers.do', '2020-04-12 17:42:15', 2, '[类名] com.handy.controller.TeacherController[方法名] findAllTeachers');
INSERT INTO `sysLog` VALUES (2391, '201624131220', '0:0:0:0:0:0:0:1', '/department/insert.do', '2020-04-12 17:42:30', 3, '[类名] com.handy.controller.DepartmentController[方法名] insert');
INSERT INTO `sysLog` VALUES (2392, '201624131220', '0:0:0:0:0:0:0:1', '/department/findAll.do', '2020-04-12 17:42:31', 2, '[类名] com.handy.controller.DepartmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2393, '201624131220', '0:0:0:0:0:0:0:1', '/classes/findAll.do', '2020-04-12 17:42:34', 17, '[类名] com.handy.controller.ClassesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2394, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-12 17:43:04', 3, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2395, '201624131220', '0:0:0:0:0:0:0:1', '/classes/findAll.do', '2020-04-12 17:43:05', 4, '[类名] com.handy.controller.ClassesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2396, '201624131220', '0:0:0:0:0:0:0:1', '/classes/findDetailsBycId.do', '2020-04-12 17:43:06', 3, '[类名] com.handy.controller.ClassesController[方法名] findDetailsBycId');
INSERT INTO `sysLog` VALUES (2397, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-12 17:43:17', 1, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2398, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findDetailsBytId.do', '2020-04-12 17:43:19', 13, '[类名] com.handy.controller.TeacherController[方法名] findDetailsBytId');
INSERT INTO `sysLog` VALUES (2399, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-12 17:43:21', 2, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2400, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findDetailsBytId.do', '2020-04-12 17:43:22', 8, '[类名] com.handy.controller.TeacherController[方法名] findDetailsBytId');
INSERT INTO `sysLog` VALUES (2401, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-12 17:43:23', 2, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2402, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findDetailsBytId.do', '2020-04-12 17:43:24', 10, '[类名] com.handy.controller.TeacherController[方法名] findDetailsBytId');
INSERT INTO `sysLog` VALUES (2403, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-12 17:43:25', 2, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2404, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findDetailsBytId.do', '2020-04-12 17:43:26', 10, '[类名] com.handy.controller.TeacherController[方法名] findDetailsBytId');
INSERT INTO `sysLog` VALUES (2405, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-12 17:43:27', 2, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2406, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findDetailsBytId.do', '2020-04-12 17:43:28', 5, '[类名] com.handy.controller.TeacherController[方法名] findDetailsBytId');
INSERT INTO `sysLog` VALUES (2407, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-12 17:43:29', 1, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2408, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findDetailsBytId.do', '2020-04-12 17:43:31', 6, '[类名] com.handy.controller.TeacherController[方法名] findDetailsBytId');
INSERT INTO `sysLog` VALUES (2409, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-12 17:43:32', 1, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2410, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findDetailsBytId.do', '2020-04-12 17:43:34', 16, '[类名] com.handy.controller.TeacherController[方法名] findDetailsBytId');
INSERT INTO `sysLog` VALUES (2411, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-12 17:43:35', 19, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2412, '201624131220', '0:0:0:0:0:0:0:1', '/classes/findAll.do', '2020-04-12 17:43:36', 3, '[类名] com.handy.controller.ClassesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2413, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-12 17:43:43', 16, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2414, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-12 17:43:47', 3, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2415, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-12 17:43:47', 4, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2416, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-12 17:43:47', 23, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2417, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findDetailsBytId.do', '2020-04-12 17:43:49', 10, '[类名] com.handy.controller.TeacherController[方法名] findDetailsBytId');
INSERT INTO `sysLog` VALUES (2418, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-12 17:45:51', 11, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2419, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findDetailsBytId.do', '2020-04-12 17:45:57', 12, '[类名] com.handy.controller.TeacherController[方法名] findDetailsBytId');
INSERT INTO `sysLog` VALUES (2420, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-12 17:48:30', 45, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2421, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findDetailsBytId.do', '2020-04-12 17:48:32', 86, '[类名] com.handy.controller.TeacherController[方法名] findDetailsBytId');
INSERT INTO `sysLog` VALUES (2422, '201624131220', '0:0:0:0:0:0:0:1', '/classes/findAll.do', '2020-04-12 17:48:35', 20, '[类名] com.handy.controller.ClassesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2423, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-12 17:48:41', 6, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2424, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:50:48', 7, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2425, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:50:49', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2426, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:50:50', 18, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2427, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:51:11', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2428, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:51:12', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2429, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-12 17:51:13', 212, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2430, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:51:17', 4, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2431, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:51:18', 3, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2432, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:51:50', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2433, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:51:51', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2434, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-12 17:51:53', 25, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2435, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-12 17:51:54', 34, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2436, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:57:43', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2437, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-12 17:57:45', 6, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2438, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-12 17:59:33', 9, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2439, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-12 17:59:35', 5, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2440, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:59:35', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2441, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 17:59:36', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2442, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-12 17:59:37', 5, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2443, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 18:00:01', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2444, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 18:00:02', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2445, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 18:03:16', 29, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2446, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 18:03:29', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2447, '201624131220', '0:0:0:0:0:0:0:1', '/user/userDetails.do', '2020-04-12 18:03:32', 133, '[类名] com.handy.controller.UserController[方法名] userDetails');
INSERT INTO `sysLog` VALUES (2448, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 18:04:29', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2449, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 18:04:32', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2450, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-12 18:10:21', 22, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2451, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-12 18:10:25', 40, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2452, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-12 18:11:25', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2453, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findAll.do', '2020-04-12 18:11:30', 36, '[类名] com.handy.controller.MatchesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2454, '201624131220', '0:0:0:0:0:0:0:1', '/event/findAll.do', '2020-04-12 18:11:35', 13, '[类名] com.handy.controller.EventController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2455, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findAll.do', '2020-04-12 18:11:36', 11, '[类名] com.handy.controller.EquipmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2456, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findAll.do', '2020-04-12 18:11:37', 26, '[类名] com.handy.controller.MatchesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2457, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-12 18:11:39', 10, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2458, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-12 18:11:40', 13, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2459, '201624131220', '0:0:0:0:0:0:0:1', '/event/findDetailsByeId.do', '2020-04-12 18:11:44', 13, '[类名] com.handy.controller.EventController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (2460, '201624131220', '0:0:0:0:0:0:0:1', '/event/findAll.do', '2020-04-12 18:11:52', 9, '[类名] com.handy.controller.EventController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2461, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findAll.do', '2020-04-12 18:11:54', 21, '[类名] com.handy.controller.MatchesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2462, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-12 18:11:57', 23, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2463, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-12 18:12:09', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2464, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-12 18:12:12', 4, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2465, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 18:12:15', 11, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2466, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-12 18:12:21', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2467, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-12 18:12:22', 10, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2468, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-12 18:12:26', 4, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2469, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-12 18:12:29', 11, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2470, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-12 18:12:34', 7, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2471, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-12 18:12:38', 17, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2472, '201624131220', '0:0:0:0:0:0:0:1', '/matches/deleteById.do', '2020-04-12 18:12:54', 22, '[类名] com.handy.controller.MatchesController[方法名] deleteByIds');
INSERT INTO `sysLog` VALUES (2473, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-12 18:12:54', 14, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2474, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-12 18:13:04', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2475, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-12 18:13:05', 4, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2476, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-12 18:13:06', 4, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2477, '201624131220', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-12 18:13:08', 9, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (2478, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-12 18:13:10', 4, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2479, '201624131220', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-12 18:13:12', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (2480, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-12 18:13:13', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2481, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-12 18:13:13', 3, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2482, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-12 18:13:15', 4, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (2483, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-12 18:13:17', 10, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2484, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-12 18:13:20', 3, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2485, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findAll.do', '2020-04-12 18:13:22', 12, '[类名] com.handy.controller.MatchesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2486, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-12 18:13:24', 5, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2487, '201624131220', '0:0:0:0:0:0:0:1', '/event/findDetailsByeId.do', '2020-04-12 18:13:29', 5, '[类名] com.handy.controller.EventController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (2488, '201624131220', '0:0:0:0:0:0:0:1', '/event/findDetailsByeId.do', '2020-04-12 18:14:08', 17, '[类名] com.handy.controller.EventController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (2489, '201624131220', '0:0:0:0:0:0:0:1', '/event/findDetailsByeId.do', '2020-04-12 18:14:09', 5, '[类名] com.handy.controller.EventController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (2490, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findAll.do', '2020-04-12 18:14:09', 13, '[类名] com.handy.controller.MatchesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2491, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findAll.do', '2020-04-12 18:14:10', 2, '[类名] com.handy.controller.EquipmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2492, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-12 18:14:12', 6, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2493, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-12 18:14:14', 14, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2494, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-12 18:14:15', 8, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2495, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-12 18:14:17', 6, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2496, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-12 18:14:22', 2, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2497, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-12 18:14:30', 12, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2498, '201624131220', '0:0:0:0:0:0:0:1', '/matches/deleteById.do', '2020-04-12 18:14:51', 3, '[类名] com.handy.controller.MatchesController[方法名] deleteByIds');
INSERT INTO `sysLog` VALUES (2499, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-12 18:14:51', 14, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2500, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-12 18:14:59', 2, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2501, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-12 18:15:01', 6, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2502, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-12 18:15:15', 2, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (2503, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-12 18:15:16', 5, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2504, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-12 18:15:20', 2, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (2505, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-12 18:15:21', 6, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2506, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-12 18:15:22', 12, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2507, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-12 18:15:23', 2, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2508, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-12 18:15:25', 5, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2509, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 18:15:26', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2510, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-12 18:15:32', 5, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2511, '201624131220', '0:0:0:0:0:0:0:1', '/event/findDetailsByeId.do', '2020-04-12 18:15:34', 6, '[类名] com.handy.controller.EventController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (2512, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-12 18:15:36', 4, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2513, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-12 18:15:38', 5, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2514, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-12 18:15:39', 5, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2515, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-12 18:15:45', 2, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2516, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-12 18:15:48', 5, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2517, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-12 18:15:53', 5, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2518, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-12 18:16:00', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2519, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-12 18:16:01', 4, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2520, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-12 18:16:02', 4, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2521, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-12 18:16:05', 6, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2522, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-12 18:16:06', 6, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2523, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-12 18:16:08', 11, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2524, '201624131220', '0:0:0:0:0:0:0:1', '/matches/deleteById.do', '2020-04-12 18:16:14', 4, '[类名] com.handy.controller.MatchesController[方法名] deleteByIds');
INSERT INTO `sysLog` VALUES (2525, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-12 18:16:14', 9, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2526, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 18:16:16', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2527, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-12 18:16:19', 23, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2528, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-12 18:16:20', 4, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (2529, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-12 18:16:21', 3, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2530, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manageFindDetailsBysId.do', '2020-04-12 18:16:24', 10, '[类名] com.handy.controller.SportmeetingController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2531, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manageFindDetailsBysId.do', '2020-04-12 18:17:52', 22, '[类名] com.handy.controller.SportmeetingController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2532, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-12 18:18:04', 7, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2533, '201624131220', '0:0:0:0:0:0:0:1', '/event/findById.do', '2020-04-12 18:18:06', 3, '[类名] com.handy.controller.EventController[方法名] findById');
INSERT INTO `sysLog` VALUES (2534, '201624131220', '0:0:0:0:0:0:0:1', '/event/findById.do', '2020-04-12 18:18:11', 1, '[类名] com.handy.controller.EventController[方法名] findById');
INSERT INTO `sysLog` VALUES (2535, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-12 18:18:15', 3, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (2536, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAllSportmeetings.do', '2020-04-12 18:18:18', 1, '[类名] com.handy.controller.BroadcastController[方法名] findAllSportmeetings');
INSERT INTO `sysLog` VALUES (2537, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/findById.do', '2020-04-12 18:18:18', 4, '[类名] com.handy.controller.BroadcastController[方法名] findBybId');
INSERT INTO `sysLog` VALUES (2538, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/update.do', '2020-04-12 18:18:21', 2, '[类名] com.handy.controller.BroadcastController[方法名] update');
INSERT INTO `sysLog` VALUES (2539, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-12 18:18:22', 3, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (2540, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAllSportmeetings.do', '2020-04-12 18:18:23', 2, '[类名] com.handy.controller.BroadcastController[方法名] findAllSportmeetings');
INSERT INTO `sysLog` VALUES (2541, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/findById.do', '2020-04-12 18:18:23', 3, '[类名] com.handy.controller.BroadcastController[方法名] findBybId');
INSERT INTO `sysLog` VALUES (2542, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAllSportmeetings.do', '2020-04-12 18:18:25', 1, '[类名] com.handy.controller.BroadcastController[方法名] findAllSportmeetings');
INSERT INTO `sysLog` VALUES (2543, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/findById.do', '2020-04-12 18:18:25', 2, '[类名] com.handy.controller.BroadcastController[方法名] findBybId');
INSERT INTO `sysLog` VALUES (2544, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/update.do', '2020-04-12 18:18:28', 2, '[类名] com.handy.controller.BroadcastController[方法名] update');
INSERT INTO `sysLog` VALUES (2545, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-12 18:18:29', 3, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (2546, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAllSportmeetings.do', '2020-04-12 18:18:31', 1, '[类名] com.handy.controller.SportmeetingController[方法名] findAllSportmeetings');
INSERT INTO `sysLog` VALUES (2547, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/findById.do', '2020-04-12 18:18:31', 2, '[类名] com.handy.controller.BroadcastController[方法名] findBybId');
INSERT INTO `sysLog` VALUES (2548, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/update.do', '2020-04-12 18:18:40', 2, '[类名] com.handy.controller.BroadcastController[方法名] update');
INSERT INTO `sysLog` VALUES (2549, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-12 18:18:41', 2, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (2550, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAllSportmeetings.do', '2020-04-12 18:18:42', 1, '[类名] com.handy.controller.SportmeetingController[方法名] findAllSportmeetings');
INSERT INTO `sysLog` VALUES (2551, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAllSportmeetings.do', '2020-04-12 18:18:44', 1, '[类名] com.handy.controller.SportmeetingController[方法名] findAllSportmeetings');
INSERT INTO `sysLog` VALUES (2552, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAllSportmeetings.do', '2020-04-12 18:18:50', 1, '[类名] com.handy.controller.BroadcastController[方法名] findAllSportmeetings');
INSERT INTO `sysLog` VALUES (2553, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/findById.do', '2020-04-12 18:18:50', 2, '[类名] com.handy.controller.BroadcastController[方法名] findBybId');
INSERT INTO `sysLog` VALUES (2554, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/update.do', '2020-04-12 18:18:53', 2, '[类名] com.handy.controller.BroadcastController[方法名] update');
INSERT INTO `sysLog` VALUES (2555, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-12 18:18:54', 5, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (2556, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-12 18:18:58', 1, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2557, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-12 18:19:00', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2558, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-13 12:48:09', 11, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2559, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 12:48:12', 45, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2560, '201624131220', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-13 12:48:17', 6, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (2561, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 12:48:18', 13, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2562, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-13 12:59:09', 13, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2563, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findDetailsBysId.do', '2020-04-13 13:02:57', 38, '[类名] com.handy.controller.SportmeetingController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2564, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-13 13:03:06', 18, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2565, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findDetailsBysId.do', '2020-04-13 13:03:06', 147, '[类名] com.handy.controller.SportmeetingController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2566, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findDetailsBysId.do', '2020-04-13 13:03:10', 24, '[类名] com.handy.controller.SportmeetingController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2567, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-13 13:05:06', 7, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2568, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findDetailsBysId.do', '2020-04-13 13:05:08', 23, '[类名] com.handy.controller.SportmeetingController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2569, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findDetailsBysId.do', '2020-04-13 13:05:14', 57, '[类名] com.handy.controller.SportmeetingController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2570, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-13 13:05:16', 3, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2571, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findDetailsBysId.do', '2020-04-13 13:05:18', 21, '[类名] com.handy.controller.SportmeetingController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2572, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findDetailsBysId.do', '2020-04-13 13:06:37', 24, '[类名] com.handy.controller.SportmeetingController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2573, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-13 13:06:39', 4, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2574, 'admin', '0:0:0:0:0:0:0:1', '/broadcast/findAll.do', '2020-04-13 13:06:40', 2, '[类名] com.handy.controller.BroadcastController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2575, 'admin', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-13 13:06:41', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2576, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-13 13:06:45', 3, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2577, 'admin', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-13 13:06:55', 19, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2578, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-13 13:06:56', 50, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2579, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-13 13:06:59', 3, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2580, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-13 13:06:59', 2, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2581, 'admin', '0:0:0:0:0:0:0:1', '/broadcast/findAll.do', '2020-04-13 13:07:00', 2, '[类名] com.handy.controller.BroadcastController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2582, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-13 13:07:01', 1, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2583, 'admin', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-13 13:07:02', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2584, 'admin', '0:0:0:0:0:0:0:1', '/user/userDetails.do', '2020-04-13 13:07:03', 9, '[类名] com.handy.controller.UserController[方法名] userDetails');
INSERT INTO `sysLog` VALUES (2585, 'admin', '0:0:0:0:0:0:0:1', '/user/updatePW.do', '2020-04-13 13:07:03', 0, '[类名] com.handy.controller.UserController[方法名] updatePW');
INSERT INTO `sysLog` VALUES (2586, 'admin', '0:0:0:0:0:0:0:1', '/user/userDetails.do', '2020-04-13 13:07:06', 9, '[类名] com.handy.controller.UserController[方法名] userDetails');
INSERT INTO `sysLog` VALUES (2587, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-13 13:07:07', 2, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2588, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findDetailsBysId.do', '2020-04-13 13:07:10', 14, '[类名] com.handy.controller.SportmeetingController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2589, 'admin', '0:0:0:0:0:0:0:1', '/event/findDetailsByeId.do', '2020-04-13 13:09:11', 5, '[类名] com.handy.controller.EventController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (2590, 'admin', '0:0:0:0:0:0:0:1', '/broadcast/findAll.do', '2020-04-13 13:10:27', 1, '[类名] com.handy.controller.BroadcastController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2591, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findDetailsBysId.do', '2020-04-13 13:10:54', 15, '[类名] com.handy.controller.SportmeetingController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2592, 'admin', '0:0:0:0:0:0:0:1', '/event/findAll.do', '2020-04-13 13:12:49', 7, '[类名] com.handy.controller.EventController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2593, 'admin', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-13 13:13:30', 5, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2594, 'admin', '0:0:0:0:0:0:0:1', '/event/findById.do', '2020-04-13 13:13:35', 3, '[类名] com.handy.controller.EventController[方法名] findById');
INSERT INTO `sysLog` VALUES (2595, 'admin', '0:0:0:0:0:0:0:1', '/event/findById.do', '2020-04-13 13:13:38', 2, '[类名] com.handy.controller.EventController[方法名] findById');
INSERT INTO `sysLog` VALUES (2596, 'admin', '0:0:0:0:0:0:0:1', '/event/findById.do', '2020-04-13 13:13:46', 2, '[类名] com.handy.controller.EventController[方法名] findById');
INSERT INTO `sysLog` VALUES (2597, 'admin', '0:0:0:0:0:0:0:1', '/event/findById.do', '2020-04-13 13:13:53', 2, '[类名] com.handy.controller.EventController[方法名] findById');
INSERT INTO `sysLog` VALUES (2598, 'admin', '0:0:0:0:0:0:0:1', '/event/update.do', '2020-04-13 13:13:58', 2, '[类名] com.handy.controller.EventController[方法名] update');
INSERT INTO `sysLog` VALUES (2599, 'admin', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-13 13:13:59', 4, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2600, 'admin', '0:0:0:0:0:0:0:1', '/event/findById.do', '2020-04-13 13:14:05', 1, '[类名] com.handy.controller.EventController[方法名] findById');
INSERT INTO `sysLog` VALUES (2601, 'admin', '0:0:0:0:0:0:0:1', '/event/update.do', '2020-04-13 13:14:10', 2, '[类名] com.handy.controller.EventController[方法名] update');
INSERT INTO `sysLog` VALUES (2602, 'admin', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-13 13:14:11', 6, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2603, 'admin', '0:0:0:0:0:0:0:1', '/matches/findAll.do', '2020-04-13 13:14:14', 14, '[类名] com.handy.controller.MatchesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2604, 'admin', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-13 13:14:21', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (2605, 'admin', '0:0:0:0:0:0:0:1', '/event/findAll.do', '2020-04-13 13:14:24', 5, '[类名] com.handy.controller.EventController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2606, 'admin', '0:0:0:0:0:0:0:1', '/event/findDetailsByeId.do', '2020-04-13 13:16:17', 3, '[类名] com.handy.controller.EventController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (2607, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-13 13:16:28', 1, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2608, 'admin', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-13 13:16:29', 5, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2609, 'admin', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-13 13:16:32', 5, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2610, 'admin', '0:0:0:0:0:0:0:1', '/event/findById.do', '2020-04-13 13:16:34', 2, '[类名] com.handy.controller.EventController[方法名] findById');
INSERT INTO `sysLog` VALUES (2611, 'admin', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-13 13:16:36', 4, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2612, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:16:39', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2613, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:16:52', 3, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2614, 'admin', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-13 13:16:53', 3, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2615, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:16:55', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2616, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:17:05', 3, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2617, 'admin', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-13 13:17:06', 4, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2618, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:17:07', 2, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2619, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:17:15', 1, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2620, 'admin', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-13 13:17:16', 5, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2621, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:17:19', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2622, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:17:54', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2623, 'admin', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-13 13:17:55', 4, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2624, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:17:57', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2625, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:18:01', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2626, 'admin', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-13 13:18:02', 3, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2627, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:18:03', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2628, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:18:10', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2629, 'admin', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-13 13:18:11', 16, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2630, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:18:17', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2631, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:18:20', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2632, 'admin', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-13 13:18:21', 3, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2633, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:18:21', 2, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2634, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:18:28', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2635, 'admin', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-13 13:18:30', 3, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2636, 'admin', '0:0:0:0:0:0:0:1', '/event/findAll.do', '2020-04-13 13:18:36', 5, '[类名] com.handy.controller.EventController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2637, 'admin', '0:0:0:0:0:0:0:1', '/event/findDetailsByeId.do', '2020-04-13 13:18:37', 1627, '[类名] com.handy.controller.EventController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (2638, 'admin', '0:0:0:0:0:0:0:1', '/event/findAll.do', '2020-04-13 13:18:40', 5, '[类名] com.handy.controller.EventController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2639, 'admin', '0:0:0:0:0:0:0:1', '/event/findDetailsByeId.do', '2020-04-13 13:18:44', 3, '[类名] com.handy.controller.EventController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (2640, 'admin', '0:0:0:0:0:0:0:1', '/matches/findAll.do', '2020-04-13 13:20:08', 7, '[类名] com.handy.controller.MatchesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2641, 'admin', '0:0:0:0:0:0:0:1', '/event/findAll.do', '2020-04-13 13:20:34', 5, '[类名] com.handy.controller.EventController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2642, 'admin', '0:0:0:0:0:0:0:1', '/broadcast/findAll.do', '2020-04-13 13:20:37', 2, '[类名] com.handy.controller.BroadcastController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2643, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-13 13:20:39', 1, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2644, 'admin', '0:0:0:0:0:0:0:1', '/event/findAll.do', '2020-04-13 13:20:39', 4, '[类名] com.handy.controller.EventController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2645, 'admin', '0:0:0:0:0:0:0:1', '/matches/findAll.do', '2020-04-13 13:20:40', 3450, '[类名] com.handy.controller.MatchesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2646, 'admin', '0:0:0:0:0:0:0:1', '/matches/findAll.do', '2020-04-13 13:21:10', 10, '[类名] com.handy.controller.MatchesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2647, 'admin', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-13 13:21:20', 4, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2648, 'admin', '0:0:0:0:0:0:0:1', '/event/findById.do', '2020-04-13 13:21:23', 1, '[类名] com.handy.controller.EventController[方法名] findById');
INSERT INTO `sysLog` VALUES (2649, 'admin', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-13 13:21:26', 4, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2650, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:21:28', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2651, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:21:33', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2652, 'admin', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-13 13:21:34', 4, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2653, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:21:34', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2654, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:21:40', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2655, 'admin', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-13 13:21:41', 4, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2656, 'admin', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-13 13:21:48', 4, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2657, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:21:52', 6, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2658, 'admin', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-13 13:21:59', 1, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2659, 'admin', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-13 13:22:01', 4, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2660, 'admin', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-13 13:22:08', 2, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (2661, 'admin', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-13 13:22:09', 5, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2662, 'admin', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-13 13:22:12', 2, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (2663, 'admin', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-13 13:22:13', 4, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2664, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:22:14', 10, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2665, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:22:17', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2666, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:22:23', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2667, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:22:30', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2668, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:23:31', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2669, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:23:33', 8, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2670, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:23:44', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2671, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:23:47', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2672, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:23:48', 8, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2673, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:23:52', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2674, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:23:57', 1, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2675, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:23:58', 9, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2676, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:24:00', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2677, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:24:10', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2678, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:24:11', 7, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2679, 'admin', '0:0:0:0:0:0:0:1', '/matches/deleteById.do', '2020-04-13 13:24:26', 2, '[类名] com.handy.controller.MatchesController[方法名] deleteByIds');
INSERT INTO `sysLog` VALUES (2680, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:24:26', 10, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2681, 'admin', '0:0:0:0:0:0:0:1', '/matches/deleteById.do', '2020-04-13 13:24:29', 2, '[类名] com.handy.controller.MatchesController[方法名] deleteByIds');
INSERT INTO `sysLog` VALUES (2682, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:24:29', 11, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2683, 'admin', '0:0:0:0:0:0:0:1', '/matches/deleteById.do', '2020-04-13 13:24:42', 6, '[类名] com.handy.controller.MatchesController[方法名] deleteByIds');
INSERT INTO `sysLog` VALUES (2684, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:24:42', 5, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2685, 'admin', '0:0:0:0:0:0:0:1', '/matches/deleteById.do', '2020-04-13 13:24:50', 8, '[类名] com.handy.controller.MatchesController[方法名] deleteByIds');
INSERT INTO `sysLog` VALUES (2686, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:24:50', 4, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2687, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:24:54', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2688, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:24:58', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2689, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:25:03', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2690, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:25:05', 4, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2691, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:25:07', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2692, 'admin', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-13 13:25:11', 2, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2693, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:25:14', 6, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2694, 'admin', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-13 13:25:15', 5, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2695, 'admin', '0:0:0:0:0:0:0:1', '/event/findById.do', '2020-04-13 13:25:20', 3, '[类名] com.handy.controller.EventController[方法名] findById');
INSERT INTO `sysLog` VALUES (2696, 'admin', '0:0:0:0:0:0:0:1', '/event/findById.do', '2020-04-13 13:25:27', 1, '[类名] com.handy.controller.EventController[方法名] findById');
INSERT INTO `sysLog` VALUES (2697, 'admin', '0:0:0:0:0:0:0:1', '/event/update.do', '2020-04-13 13:25:32', 2, '[类名] com.handy.controller.EventController[方法名] update');
INSERT INTO `sysLog` VALUES (2698, 'admin', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-13 13:25:33', 5, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2699, 'admin', '0:0:0:0:0:0:0:1', '/event/findById.do', '2020-04-13 13:25:36', 1, '[类名] com.handy.controller.EventController[方法名] findById');
INSERT INTO `sysLog` VALUES (2700, 'admin', '0:0:0:0:0:0:0:1', '/event/update.do', '2020-04-13 13:25:40', 2, '[类名] com.handy.controller.EventController[方法名] update');
INSERT INTO `sysLog` VALUES (2701, 'admin', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-13 13:25:41', 5, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2702, 'admin', '0:0:0:0:0:0:0:1', '/event/findById.do', '2020-04-13 13:25:47', 1, '[类名] com.handy.controller.EventController[方法名] findById');
INSERT INTO `sysLog` VALUES (2703, 'admin', '0:0:0:0:0:0:0:1', '/event/update.do', '2020-04-13 13:25:51', 3, '[类名] com.handy.controller.EventController[方法名] update');
INSERT INTO `sysLog` VALUES (2704, 'admin', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-13 13:25:52', 4, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2705, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:25:54', 6, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2706, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:25:56', 2, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2707, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:25:58', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2708, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:25:59', 1, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2709, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:26:00', 4, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2710, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:26:03', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2711, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:26:12', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2712, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:26:13', 5, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2713, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:26:15', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2714, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:26:17', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2715, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:26:22', 3, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2716, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:26:23', 3, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2717, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:26:24', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2718, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:26:29', 1, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2719, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:26:30', 4, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2720, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:26:31', 2, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2721, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:26:36', 1, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2722, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:26:37', 4, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2723, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:26:38', 2, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2724, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:26:43', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2725, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:27:00', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2726, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:27:00', 5, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2727, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:27:02', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2728, 'admin', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-13 13:27:08', 6, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2729, 'admin', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-13 13:27:32', 1, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (2730, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 13:27:33', 4, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2731, 'admin', '0:0:0:0:0:0:0:1', '/event/findAll.do', '2020-04-13 13:27:50', 7, '[类名] com.handy.controller.EventController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2732, 'admin', '0:0:0:0:0:0:0:1', '/matches/findAll.do', '2020-04-13 13:27:51', 5, '[类名] com.handy.controller.MatchesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2733, 'admin', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-13 13:29:55', 3, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2734, 'admin', '0:0:0:0:0:0:0:1', '/equipment/findAll.do', '2020-04-13 13:32:37', 10, '[类名] com.handy.controller.EquipmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2735, 'admin', '0:0:0:0:0:0:0:1', '/equipment/findAll.do', '2020-04-13 13:32:37', 1, '[类名] com.handy.controller.EquipmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2736, 'admin', '0:0:0:0:0:0:0:1', '/equipment/findDetailsByeId.do', '2020-04-13 13:34:05', 4, '[类名] com.handy.controller.EquipmentController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (2737, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-13 13:36:35', 20, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2738, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-13 15:34:43', 2, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2739, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-13 15:34:44', 31, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2740, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-13 15:34:46', 2, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2741, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-13 15:34:48', 2, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2742, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-13 15:34:49', 1, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2743, 'admin', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-13 15:34:50', 2, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (2744, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-13 15:34:52', 20, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2745, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-04-13 15:34:55', 7, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (2746, 'admin', '0:0:0:0:0:0:0:1', '/classes/findAllClasses.do', '2020-04-13 15:34:55', 7, '[类名] com.handy.controller.StudentController[方法名] findAllClasses');
INSERT INTO `sysLog` VALUES (2747, 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '2020-04-13 15:34:55', 8, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2748, 'admin', '0:0:0:0:0:0:0:1', '/classes/findAllClasses.do', '2020-04-13 15:38:32', 1, '[类名] com.handy.controller.RoleController[方法名] findAllClasses');
INSERT INTO `sysLog` VALUES (2749, 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '2020-04-13 15:38:32', 2, '[类名] com.handy.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2750, 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '2020-04-13 15:43:38', 1, '[类名] com.handy.controller.RoleController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2751, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-04-13 15:43:38', 2, '[类名] com.handy.controller.ClassesController[方法名] findById');
INSERT INTO `sysLog` VALUES (2752, 'admin', '0:0:0:0:0:0:0:1', '/classes/findAllClasses.do', '2020-04-13 15:43:38', 4, '[类名] com.handy.controller.ClassesController[方法名] findAllClasses');
INSERT INTO `sysLog` VALUES (2753, 'admin', '0:0:0:0:0:0:0:1', '/role/findAll.do', '2020-04-13 15:45:17', 1, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2754, 'admin', '0:0:0:0:0:0:0:1', '/student/findById.do', '2020-04-13 15:45:17', 2, '[类名] com.handy.controller.StudentController[方法名] findById');
INSERT INTO `sysLog` VALUES (2755, 'admin', '0:0:0:0:0:0:0:1', '/classes/findAllClasses.do', '2020-04-13 15:45:17', 1, '[类名] com.handy.controller.StudentController[方法名] findAllClasses');
INSERT INTO `sysLog` VALUES (2756, 'admin', '0:0:0:0:0:0:0:1', '/student/findDetailsBysId.do', '2020-04-13 15:45:18', 6, '[类名] com.handy.controller.StudentController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2757, 'admin', '0:0:0:0:0:0:0:1', '/student/findDetailsBysId.do', '2020-04-13 15:45:24', 5, '[类名] com.handy.controller.StudentController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2758, 'admin', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-13 15:45:33', 22, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (2759, 'admin', '0:0:0:0:0:0:0:1', '/student/findDetailsBysId.do', '2020-04-13 15:45:38', 7, '[类名] com.handy.controller.StudentController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (2760, 'admin', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-13 15:49:50', 1, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (2761, 'admin', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-13 15:54:14', 3, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (2762, 'admin', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-13 15:54:14', 5, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2763, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 15:54:17', 4, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2764, 'admin', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-13 15:54:19', 1, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2765, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 15:54:21', 3, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2766, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:54:29', 2, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2767, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:54:35', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2768, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:54:38', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2769, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:54:41', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2770, '201624131201', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-13 15:54:50', 2, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2771, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:54:51', 2, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2772, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:54:52', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2773, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:54:57', 2, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2774, '201624131201', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-13 15:54:58', 1, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2775, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:54:58', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2776, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:54:59', 2, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2777, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:54:59', 2, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2778, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:54:59', 2, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2779, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:54:59', 2, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2780, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:55:00', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2781, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:55:13', 15, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2782, '201624131201', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-13 15:55:16', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (2783, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:55:17', 6, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2784, '201624131201', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-13 15:55:19', 3, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (2785, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:55:20', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2786, '201624131201', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-13 15:55:22', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (2787, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:55:23', 4, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2788, '201624131201', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-13 15:55:24', 6, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2789, '201624131201', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-13 15:55:31', 5, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2790, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:55:31', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2791, 'admin', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 15:55:39', 10, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2792, 'admin', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-13 15:55:42', 5, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2793, 'admin', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-13 15:56:37', 2, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2794, 'admin', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-13 15:56:39', 4, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2795, 'admin', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-13 15:56:43', 2, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2796, 'admin', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-13 15:56:45', 3, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2797, 'admin', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-13 15:56:46', 1, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2798, 'admin', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-13 15:58:34', 5, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2799, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:58:42', 2, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2800, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:58:46', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2801, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:58:50', 4, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2802, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-13 15:58:50', 2, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2803, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-13 15:58:59', 1, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2804, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-13 15:59:03', 4, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2805, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:59:04', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2806, '201624131220', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-13 15:59:07', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (2807, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:59:07', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2808, '201624131220', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-13 15:59:10', 3, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (2809, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:59:11', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2810, '201624131220', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-13 15:59:14', 3, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (2811, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:59:14', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2812, '201624131220', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-13 15:59:17', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (2813, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 15:59:18', 2, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2814, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-13 15:59:26', 1, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2815, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-13 15:59:28', 3, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2816, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-13 16:01:54', 7, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2817, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-13 16:01:55', 1, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2818, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-13 16:01:57', 4, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2819, '201624131220', '0:0:0:0:0:0:0:1', '/user/user.do', '2020-04-13 16:02:03', 157, '[类名] com.handy.controller.UserController[方法名] userSetting');
INSERT INTO `sysLog` VALUES (2820, '201624131220', '0:0:0:0:0:0:0:1', '/role/findAllList.do', '2020-04-13 16:02:08', 1, '[类名] com.handy.controller.RoleController[方法名] findAllList');
INSERT INTO `sysLog` VALUES (2821, '201624131220', '0:0:0:0:0:0:0:1', '/feedback/feedbackList.do', '2020-04-13 16:02:09', 19, '[类名] com.handy.controller.FeedbackController[方法名] feedback');
INSERT INTO `sysLog` VALUES (2822, '201624131220', '0:0:0:0:0:0:0:1', '/user/user.do', '2020-04-13 16:02:14', 161, '[类名] com.handy.controller.UserController[方法名] userSetting');
INSERT INTO `sysLog` VALUES (2823, '201624131220', '0:0:0:0:0:0:0:1', '/role/findAllList.do', '2020-04-13 16:03:04', 1, '[类名] com.handy.controller.RoleController[方法名] findAllList');
INSERT INTO `sysLog` VALUES (2824, '201624131220', '0:0:0:0:0:0:0:1', '/role/findByRid.do', '2020-04-13 16:03:08', 1, '[类名] com.handy.controller.RoleController[方法名] findByRId');
INSERT INTO `sysLog` VALUES (2825, '201624131220', '0:0:0:0:0:0:0:1', '/role/findRoleList.do', '2020-04-13 16:03:09', 306, '[类名] com.handy.controller.RoleController[方法名] findRoleList');
INSERT INTO `sysLog` VALUES (2826, '201624131220', '0:0:0:0:0:0:0:1', '/role/findAllList.do', '2020-04-13 16:03:13', 1, '[类名] com.handy.controller.RoleController[方法名] findAllList');
INSERT INTO `sysLog` VALUES (2827, '201624131220', '0:0:0:0:0:0:0:1', '/feedback/feedbackList.do', '2020-04-13 16:03:56', 1, '[类名] com.handy.controller.FeedbackController[方法名] feedback');
INSERT INTO `sysLog` VALUES (2828, '201624131220', '0:0:0:0:0:0:0:1', '/feedback/deleteById.do', '2020-04-13 16:04:06', 2, '[类名] com.handy.controller.FeedbackController[方法名] deleteByIds');
INSERT INTO `sysLog` VALUES (2829, '201624131220', '0:0:0:0:0:0:0:1', '/feedback/feedbackList.do', '2020-04-13 16:04:06', 1, '[类名] com.handy.controller.FeedbackController[方法名] feedback');
INSERT INTO `sysLog` VALUES (2830, '201624131220', '0:0:0:0:0:0:0:1', '/role/findAllList.do', '2020-04-13 16:22:17', 10, '[类名] com.handy.controller.RoleController[方法名] findAllList');
INSERT INTO `sysLog` VALUES (2831, '201624131220', '0:0:0:0:0:0:0:1', '/user/user.do', '2020-04-13 16:46:49', 807, '[类名] com.handy.controller.UserController[方法名] userSetting');
INSERT INTO `sysLog` VALUES (2832, '201624131220', '0:0:0:0:0:0:0:1', '/role/findAllList.do', '2020-04-13 16:46:53', 2, '[类名] com.handy.controller.RoleController[方法名] findAllList');
INSERT INTO `sysLog` VALUES (2833, '201624131220', '0:0:0:0:0:0:0:1', '/user/user.do', '2020-04-13 16:48:51', 367, '[类名] com.handy.controller.UserController[方法名] userSetting');
INSERT INTO `sysLog` VALUES (2834, '201624131220', '0:0:0:0:0:0:0:1', '/role/findAllList.do', '2020-04-13 16:49:48', 2, '[类名] com.handy.controller.RoleController[方法名] findAllList');
INSERT INTO `sysLog` VALUES (2835, '201624131220', '0:0:0:0:0:0:0:1', '/role/findRoleList.do', '2020-04-13 16:49:51', 915, '[类名] com.handy.controller.RoleController[方法名] findRoleList');
INSERT INTO `sysLog` VALUES (2836, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-13 16:56:03', 20, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2837, '201624131201', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-13 17:00:32', 20, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2838, 'admin', '0:0:0:0:0:0:0:1', '/user/user.do', '2020-04-13 17:04:25', 313, '[类名] com.handy.controller.UserController[方法名] userSetting');
INSERT INTO `sysLog` VALUES (2839, 'admin', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-13 17:04:28', 12, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2840, 'admin', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-13 17:28:19', 28, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2841, 'admin', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-13 17:31:12', 2, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2842, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-13 18:01:04', 45, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2843, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-13 18:01:07', 2, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2844, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findDetailsByeId.do', '2020-04-13 18:01:26', 11, '[类名] com.handy.controller.EquipmentController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (2845, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-13 18:01:29', 2, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2846, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findById.do', '2020-04-13 18:01:34', 2, '[类名] com.handy.controller.EquipmentController[方法名] findById');
INSERT INTO `sysLog` VALUES (2847, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-13 18:02:01', 33, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2848, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-13 18:06:55', 43, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2849, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-13 18:40:18', 8, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2850, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-13 18:40:21', 387, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2851, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-13 18:40:24', 4, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2852, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-13 18:40:51', 5, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2853, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-13 18:40:54', 3, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2854, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-13 18:40:57', 5, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2855, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-13 18:41:10', 3, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2856, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-13 18:41:30', 5, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2857, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-13 18:41:31', 4, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2858, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-14 13:54:06', 146, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2859, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-14 13:54:10', 17, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2860, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-14 13:54:13', 187, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2861, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-14 13:54:14', 19, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2862, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-14 13:55:05', 5, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2863, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-14 13:55:08', 3, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2864, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-14 13:55:09', 62, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2865, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-14 13:55:10', 3, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2866, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-14 13:55:57', 78, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2867, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-14 13:55:58', 3, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2868, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-14 13:56:13', 4, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2869, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findById.do', '2020-04-14 13:56:40', 3, '[类名] com.handy.controller.EquipmentController[方法名] findById');
INSERT INTO `sysLog` VALUES (2870, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findDetailsByeId.do', '2020-04-14 13:56:43', 23, '[类名] com.handy.controller.EquipmentController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (2871, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-14 13:56:50', 23, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2872, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-14 13:56:52', 5, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2873, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findDetailsByeId.do', '2020-04-14 13:56:59', 20, '[类名] com.handy.controller.EquipmentController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (2874, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-14 13:57:03', 3, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2875, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-14 13:57:04', 49, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2876, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/deleteById.do', '2020-04-14 13:57:15', 4, '[类名] com.handy.controller.BorrowController[方法名] deleteByIds');
INSERT INTO `sysLog` VALUES (2877, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-14 13:57:15', 62, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2878, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-14 13:57:16', 2, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2879, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-14 13:57:18', 2, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2880, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-14 13:57:19', 13, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2881, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-14 13:57:20', 2, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2882, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-14 13:57:21', 2, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2883, 'admin', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-14 13:57:33', 2, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2884, 'admin', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-14 13:58:47', 44, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2885, 'admin', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-14 13:58:49', 1, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2886, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-14 14:03:59', 11, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2887, 'admin', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-14 14:04:44', 11, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2888, 'admin', '0:0:0:0:0:0:0:1', '/borrow/update.do', '2020-04-14 14:04:47', 3, '[类名] com.handy.controller.BorrowController[方法名] update');
INSERT INTO `sysLog` VALUES (2889, 'admin', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-14 14:04:47', 9, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2890, 'admin', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-14 14:04:50', 37, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2891, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 13:48:46', 32, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2892, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-15 13:48:52', 180, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2893, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 13:49:06', 7, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2894, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-15 13:49:14', 22, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2895, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 13:49:16', 5, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2896, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-15 13:49:19', 61, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2897, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 13:49:19', 4, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2898, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/insert.do', '2020-04-15 13:49:40', 5, '[类名] com.handy.controller.BorrowController[方法名] insert');
INSERT INTO `sysLog` VALUES (2899, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 13:49:41', 3, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2900, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-15 13:49:45', 15, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2901, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-15 13:49:53', 58, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2902, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-15 13:49:55', 20, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2903, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/update.do', '2020-04-15 13:49:57', 3, '[类名] com.handy.controller.BorrowController[方法名] update');
INSERT INTO `sysLog` VALUES (2904, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-15 13:49:57', 9, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2905, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 13:49:58', 3, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2906, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 13:49:59', 2, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2907, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 13:50:00', 3, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2908, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 13:50:01', 3, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2909, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-15 13:50:04', 48, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2910, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-15 13:50:08', 11, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2911, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-15 13:50:10', 57, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2912, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-15 13:50:18', 11, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2913, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 13:50:19', 3, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2914, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 13:51:30', 2, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2915, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 13:51:33', 3, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2916, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 13:51:39', 2, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2917, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findById.do', '2020-04-15 13:51:40', 5, '[类名] com.handy.controller.EquipmentController[方法名] findById');
INSERT INTO `sysLog` VALUES (2918, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-15 13:51:44', 13, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2919, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 13:51:47', 2, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2920, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-15 13:51:50', 40, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2921, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 13:51:54', 2, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2922, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 14:05:56', 31, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2923, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 14:06:06', 9, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2924, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 14:06:52', 6, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2925, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 14:06:55', 6, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2926, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 14:07:37', 18, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2927, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-15 14:07:39', 95, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2928, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 14:07:41', 5, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2929, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 14:07:53', 10, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2930, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-15 14:08:36', 150, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2931, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 14:08:38', 4, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2932, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-15 14:08:39', 54, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2933, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 14:08:41', 3, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2934, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-15 14:08:55', 20, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2935, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 14:09:04', 3, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2936, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 14:09:41', 4, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2937, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 14:09:42', 2, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2938, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 14:12:23', 3, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2939, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-15 14:12:29', 70, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2940, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 14:12:30', 3, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2941, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 14:12:41', 3, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2942, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-15 14:12:49', 55, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2943, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 14:12:58', 2, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2944, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 14:13:03', 3, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2945, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-15 14:13:12', 13, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2946, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 14:13:15', 2, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2947, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 14:13:22', 3, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2948, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/insert.do', '2020-04-15 14:13:42', 2, '[类名] com.handy.controller.BorrowController[方法名] insert');
INSERT INTO `sysLog` VALUES (2949, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 14:13:43', 1, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2950, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 14:13:45', 4, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2951, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-15 14:13:48', 49, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (2952, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 14:13:50', 4, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2953, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-15 14:13:53', 14, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2954, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/update.do', '2020-04-15 14:13:56', 2, '[类名] com.handy.controller.BorrowController[方法名] update');
INSERT INTO `sysLog` VALUES (2955, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-15 14:13:56', 17, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (2956, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 14:13:57', 2, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2957, '201624131220', '0:0:0:0:0:0:0:1', '/user/user.do', '2020-04-15 14:14:03', 291, '[类名] com.handy.controller.UserController[方法名] userSetting');
INSERT INTO `sysLog` VALUES (2958, '201624131220', '0:0:0:0:0:0:0:1', '/role/findAllList.do', '2020-04-15 14:14:04', 13, '[类名] com.handy.controller.RoleController[方法名] findAllList');
INSERT INTO `sysLog` VALUES (2959, '201624131220', '0:0:0:0:0:0:0:1', '/role/findAllList.do', '2020-04-15 14:14:04', 2, '[类名] com.handy.controller.RoleController[方法名] findAllList');
INSERT INTO `sysLog` VALUES (2960, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 14:14:05', 38, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2961, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-15 14:14:07', 22, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2962, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-15 14:14:08', 3, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2963, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-15 14:14:09', 10, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (2964, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-15 14:14:17', 3, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (2965, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 14:14:18', 9, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (2966, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 14:14:24', 7, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2967, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 14:14:30', 7, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2968, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 14:14:33', 6, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2969, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 14:14:35', 6, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2970, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 15:20:30', 8, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (2971, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-15 15:20:31', 8, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2972, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 15:20:33', 2, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (2973, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-15 15:20:34', 2, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (2974, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:01:18', 127, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2975, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:01:21', 13, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2976, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:01:37', 9, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2977, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:03:26', 29, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2978, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:07:54', 18, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2979, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:07:59', 8, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2980, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 17:08:01', 2, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (2981, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:08:01', 7, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2982, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 17:08:17', 3, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (2983, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:08:33', 13, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2984, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 17:08:39', 6, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (2985, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:10:19', 291, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2986, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:10:20', 15, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2987, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 17:10:28', 70360, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (2988, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:12:11', 141, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2989, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:12:14', 12, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2990, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:47:34', 114, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2991, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:47:36', 16, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2992, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 17:47:39', 9, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (2993, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:47:39', 19, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2994, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:48:18', 10, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2995, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:49:39', 123, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (2996, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:49:40', 18, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (2997, '201624131220', '0:0:0:0:0:0:0:1', '/user/userDetails.do', '2020-04-15 17:49:56', 57, '[类名] com.handy.controller.UserController[方法名] userDetails');
INSERT INTO `sysLog` VALUES (2998, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-15 17:49:59', 25, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (2999, '201624131220', '0:0:0:0:0:0:0:1', '/event/findDetailsByeId.do', '2020-04-15 17:50:03', 9, '[类名] com.handy.controller.EventController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (3000, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-15 17:50:05', 11, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3001, '201624131220', '0:0:0:0:0:0:0:1', '/event/findDetailsByeId.do', '2020-04-15 17:50:06', 8, '[类名] com.handy.controller.EventController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (3002, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-15 17:50:20', 14, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3003, '201624131220', '0:0:0:0:0:0:0:1', '/event/findDetailsByeId.do', '2020-04-15 17:50:21', 9, '[类名] com.handy.controller.EventController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (3004, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-15 17:50:24', 14, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3005, '201624131220', '0:0:0:0:0:0:0:1', '/event/findDetailsByeId.do', '2020-04-15 17:50:25', 9, '[类名] com.handy.controller.EventController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (3006, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-15 17:50:31', 10, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3007, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-15 17:53:09', 29, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3008, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-15 17:54:16', 13, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3009, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-15 17:54:38', 12, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3010, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-15 17:54:39', 9, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3011, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:54:44', 9, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3012, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:54:47', 10, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3013, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 17:54:50', 3, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3014, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:54:50', 9, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3015, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:55:37', 9, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3016, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:55:39', 8, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3017, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:55:40', 11, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3018, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:55:41', 6, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3019, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 17:55:43', 3, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3020, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:55:52', 8, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3021, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:55:55', 9, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3022, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-15 17:56:02', 17, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3023, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-15 17:56:03', 5, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (3024, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-15 17:56:05', 11, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3025, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:56:16', 9, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3026, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:56:18', 8, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3027, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:56:20', 9, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3028, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:56:21', 6, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3029, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:56:22', 6, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3030, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:56:23', 8, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3031, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-15 17:56:26', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3032, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-15 17:56:30', 2, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (3033, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 17:56:33', 5, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3034, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-15 17:56:38', 3, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (3035, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 17:56:39', 5, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3036, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-15 17:56:43', 2, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (3037, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 17:56:44', 5, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3038, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:56:47', 7, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3039, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:56:50', 6, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3040, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 17:56:53', 3, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3041, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:56:54', 5, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3042, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:57:03', 7, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3043, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:57:04', 5, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3044, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 17:58:25', 6, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3045, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 17:58:27', 7, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3046, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 18:00:10', 4, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3047, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 18:00:11', 6, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3048, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 18:00:12', 6, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3049, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 18:00:39', 138, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3050, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 18:00:45', 17, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3051, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 18:00:54', 17, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3052, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 18:00:58', 12, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3053, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 18:01:03', 17, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3054, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:01:10', 8, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3055, '201624131201', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:01:14', 11, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3056, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:01:15', 12, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3057, '201624131201', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:01:17', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3058, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:01:17', 8, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3059, '201624131201', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:01:19', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3060, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:01:19', 7, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3061, '201624131201', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:01:21', 4, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3062, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:01:21', 6, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3063, '201624131201', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-15 18:01:23', 30, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3064, '201624131210', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:01:33', 7, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3065, '201624131210', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:01:36', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3066, '201624131210', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:01:37', 7, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3067, '201624131210', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:01:39', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3068, '201624131210', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:01:39', 6, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3069, '201624131210', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:01:41', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3070, '201624131210', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:01:41', 7, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3071, '201624131210', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:01:43', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3072, '201624131210', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:01:44', 5, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3073, '201624131210', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:01:45', 3, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3074, '201624131210', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:01:46', 5, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3075, '201624131210', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:01:47', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3076, '201624131210', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:01:48', 4, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3077, '201624131202', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:01:55', 6, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3078, '201624131202', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:01:59', 3, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3079, '201624131202', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:02:00', 5, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3080, '201624131202', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:02:02', 4, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3081, '201624131202', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:02:17', 4, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3082, '201624131202', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:02:18', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3083, '201624131202', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:02:19', 5, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3084, '201624131202', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:02:21', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3085, '201624131202', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:02:22', 4, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3086, '201624131202', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:02:23', 3, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3087, '201624131202', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:02:24', 4, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3088, '201624131202', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:02:25', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3089, '201624131202', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:02:26', 5, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3090, '201624131202', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-15 18:02:27', 4, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3091, '201624131202', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-15 18:02:28', 7, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3092, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 18:02:33', 9, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3093, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 18:02:35', 10, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3094, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-15 18:02:40', 19, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (3095, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 18:02:41', 11, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3096, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-15 18:02:48', 2, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (3097, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 18:02:49', 11, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3098, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-15 18:02:53', 3, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (3099, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 18:02:54', 11, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3100, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-15 18:02:56', 3, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (3101, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 18:02:57', 11, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3102, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-15 18:03:00', 2, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (3103, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 18:03:01', 11, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3104, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 18:03:02', 12, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3105, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 18:03:03', 10, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3106, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 18:03:06', 8, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3107, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 18:03:07', 10, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3108, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 18:03:10', 7, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3109, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-15 18:03:11', 3, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (3110, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-15 18:03:12', 17, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3111, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 18:03:23', 8, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3112, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 18:03:24', 13, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3113, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 18:03:26', 7, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3114, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 18:03:26', 8, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3115, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-15 18:03:40', 4, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (3116, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 18:03:43', 7, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3117, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-15 18:03:53', 2, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (3118, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 18:03:54', 8, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3119, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-15 18:03:55', 11, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (3120, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 18:03:56', 7, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3121, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 18:04:00', 9, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3122, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 18:04:02', 2, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3123, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 18:04:03', 7, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3124, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-15 18:04:12', 14, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3125, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-15 18:04:13', 2, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (3126, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-15 18:04:15', 11, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (3127, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-15 18:04:16', 36, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (3128, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-15 18:04:19', 11, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3129, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-15 18:04:22', 2, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (3130, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 18:04:25', 6, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3131, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 18:04:27', 4, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3132, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-15 18:04:28', 14, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (3133, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-15 18:04:29', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3134, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-15 21:19:29', 22, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3135, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-15 21:19:30', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3136, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-15 21:20:04', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3137, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-15 21:20:05', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3138, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-15 21:20:07', 106, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (3139, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-15 21:20:09', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3140, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-15 21:22:59', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3141, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-15 21:23:00', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3142, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-15 21:23:02', 6, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (3143, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-15 21:23:02', 22, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (3144, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 21:23:03', 37, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3145, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-15 21:23:05', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3146, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-15 21:24:45', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3147, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-15 21:24:46', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3148, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-15 21:25:29', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3149, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-15 21:25:30', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3150, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-15 21:25:36', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3151, '201624131220', '0:0:0:0:0:0:0:1', '/user/userDetails.do', '2020-04-15 21:25:38', 55, '[类名] com.handy.controller.UserController[方法名] userDetails');
INSERT INTO `sysLog` VALUES (3152, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-15 21:25:46', 28, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3153, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-15 21:25:48', 13, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3154, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-15 21:33:26', 84, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3155, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-15 21:35:17', 82, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3156, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-15 21:50:45', 6, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (3157, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-15 21:50:47', 34, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3158, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-15 21:52:02', 37, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3159, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-15 21:52:55', 49, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3160, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-15 21:53:34', 50, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3161, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-15 21:56:46', 41, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3162, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-15 21:56:54', 35, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3163, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-15 21:59:28', 277, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3164, '201624131220', '0:0:0:0:0:0:0:1', '/student/exportToExcel.do', '2020-04-15 21:59:31', 1362, '[类名] com.handy.controller.StudentController[方法名] exportExcelStyle');
INSERT INTO `sysLog` VALUES (3165, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-15 22:25:06', 332, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3166, '201624131220', '0:0:0:0:0:0:0:1', '/student/exportToExcel.do', '2020-04-15 22:25:10', 241879, '[类名] com.handy.controller.StudentController[方法名] exportExcelStyle');
INSERT INTO `sysLog` VALUES (3167, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-15 22:36:01', 201, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3168, '201624131220', '0:0:0:0:0:0:0:1', '/student/exportToExcel.do', '2020-04-15 22:36:03', 1316, '[类名] com.handy.controller.StudentController[方法名] exportExcelStyle');
INSERT INTO `sysLog` VALUES (3169, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-15 22:56:36', 35, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (3170, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 22:56:38', 95, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3171, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-15 22:56:40', 50, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3172, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-15 22:56:42', 8, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (3173, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 22:56:43', 11, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3174, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-15 22:56:50', 5, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (3175, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 22:56:51', 15, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3176, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-15 22:56:54', 2, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (3177, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 22:56:55', 12, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3178, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-15 22:56:58', 3, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (3179, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 22:56:59', 11, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3180, '201624131220', '0:0:0:0:0:0:0:1', '/matches/updateScore.do', '2020-04-15 22:57:02', 2, '[类名] com.handy.controller.MatchesController[方法名] updateScore');
INSERT INTO `sysLog` VALUES (3181, '201624131220', '0:0:0:0:0:0:0:1', '/event/matchesInput.do', '2020-04-15 22:57:04', 15, '[类名] com.handy.controller.EventController[方法名] matchesInput');
INSERT INTO `sysLog` VALUES (3182, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 22:57:05', 17, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3183, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:57:11', 14, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3184, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 22:57:13', 6, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3185, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:57:14', 12, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3186, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-15 22:58:37', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3187, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-15 22:58:41', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (3188, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:58:42', 13, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3189, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 22:58:43', 3, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3190, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:58:45', 8, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3191, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-15 22:58:49', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3192, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-15 22:58:54', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (3193, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:58:55', 14, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3194, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-15 22:59:08', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3195, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-15 22:59:11', 4, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (3196, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:59:12', 12, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3197, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 22:59:14', 2, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3198, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:59:15', 15, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3199, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-15 22:59:20', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3200, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-15 22:59:23', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (3201, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:59:23', 11, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3202, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-15 22:59:25', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3203, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-15 22:59:28', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (3204, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:59:28', 15, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3205, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 22:59:30', 1, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3206, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:59:31', 13, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3207, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 22:59:33', 2, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3208, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:59:34', 8, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3209, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 22:59:35', 3, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3210, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:59:36', 10, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3211, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 22:59:37', 11, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3212, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:59:45', 8, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3213, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 22:59:47', 2, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3214, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:59:49', 10, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3215, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-15 22:59:50', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3216, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-15 22:59:53', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (3217, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:59:53', 12, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3218, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 22:59:55', 2, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3219, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 22:59:56', 11, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3220, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-15 22:59:58', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3221, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-15 23:00:02', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (3222, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 23:00:03', 9, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3223, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 23:00:04', 2, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3224, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 23:00:05', 10, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3225, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-15 23:00:24', 7, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3226, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 23:00:25', 7, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3227, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 23:00:32', 2, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3228, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 23:00:33', 10, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3229, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-15 23:00:34', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3230, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-15 23:00:39', 3, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (3231, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 23:00:40', 9, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3232, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 23:00:42', 2, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3233, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 23:00:43', 11, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3234, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-15 23:00:46', 5, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3235, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-15 23:00:49', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (3236, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 23:00:50', 13, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3237, '201624131220', '0:0:0:0:0:0:0:1', '/event/rank.do', '2020-04-15 23:00:51', 2, '[类名] com.handy.controller.EventController[方法名] rank');
INSERT INTO `sysLog` VALUES (3238, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-15 23:00:52', 6, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3239, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-15 23:01:34', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3240, '201624131220', '0:0:0:0:0:0:0:1', '/user/userDetails.do', '2020-04-15 23:01:36', 41, '[类名] com.handy.controller.UserController[方法名] userDetails');
INSERT INTO `sysLog` VALUES (3241, '201624131220', '0:0:0:0:0:0:0:1', '/user/updatePW.do', '2020-04-15 23:01:36', 0, '[类名] com.handy.controller.UserController[方法名] updatePW');
INSERT INTO `sysLog` VALUES (3242, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-15 23:01:39', 16, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3243, '201624131220', '0:0:0:0:0:0:0:1', '/event/findDetailsByeId.do', '2020-04-15 23:01:44', 8, '[类名] com.handy.controller.EventController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (3244, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-15 23:01:49', 66, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3245, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/findAll.do', '2020-04-16 14:14:56', 35, '[类名] com.handy.controller.BroadcastController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3246, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-16 14:14:59', 14, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (3247, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAllSportmeetings.do', '2020-04-16 14:15:01', 14, '[类名] com.handy.controller.SportmeetingController[方法名] findAllSportmeetings');
INSERT INTO `sysLog` VALUES (3248, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/findById.do', '2020-04-16 14:15:01', 5, '[类名] com.handy.controller.BroadcastController[方法名] findBybId');
INSERT INTO `sysLog` VALUES (3249, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAllSportmeetings.do', '2020-04-16 14:15:04', 0, '[类名] com.handy.controller.BroadcastController[方法名] findAllSportmeetings');
INSERT INTO `sysLog` VALUES (3250, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/findById.do', '2020-04-16 14:15:04', 10, '[类名] com.handy.controller.BroadcastController[方法名] findBybId');
INSERT INTO `sysLog` VALUES (3251, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-16 14:26:57', 165, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3252, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-16 14:26:59', 23, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3253, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-16 17:57:01', 25, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3254, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findDetailsBysId.do', '2020-04-16 17:57:03', 59, '[类名] com.handy.controller.SportmeetingController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (3255, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-16 17:57:10', 19, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (3256, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-16 17:58:20', 13, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3257, '201624131220', '0:0:0:0:0:0:0:1', '/user/userDetails.do', '2020-04-16 17:58:23', 41, '[类名] com.handy.controller.UserController[方法名] userDetails');
INSERT INTO `sysLog` VALUES (3258, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-16 17:58:26', 4, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (3259, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-16 17:58:28', 152, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3260, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-16 17:58:40', 14, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3261, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findById.do', '2020-04-16 17:58:42', 5, '[类名] com.handy.controller.TeacherController[方法名] findById');
INSERT INTO `sysLog` VALUES (3262, '201624131220', '0:0:0:0:0:0:0:1', '/role/findAll.do', '2020-04-16 17:58:42', 15, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3263, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-16 18:00:03', 48, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3264, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findAll.do', '2020-04-17 12:53:41', 51, '[类名] com.handy.controller.EquipmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3265, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-17 12:53:50', 7, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (3266, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-17 12:53:54', 172, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (3267, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-17 12:53:56', 5, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (3268, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-17 12:53:57', 64, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (3269, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-17 12:53:59', 4, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (3270, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findAll.do', '2020-04-17 12:54:55', 4, '[类名] com.handy.controller.EquipmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3271, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findAll.do', '2020-04-17 12:55:37', 4, '[类名] com.handy.controller.EquipmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3272, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-17 12:55:45', 3, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (3273, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/insert.do', '2020-04-17 12:56:08', 4, '[类名] com.handy.controller.BorrowController[方法名] insert');
INSERT INTO `sysLog` VALUES (3274, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-17 12:56:09', 3, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (3275, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findAll.do', '2020-04-17 12:56:13', 2, '[类名] com.handy.controller.EquipmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3276, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findDetailsByeId.do', '2020-04-17 12:56:15', 8, '[类名] com.handy.controller.EquipmentController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (3277, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-17 12:56:21', 40, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3278, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-17 12:56:24', 4, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (3279, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/insert.do', '2020-04-17 12:56:38', 3, '[类名] com.handy.controller.BorrowController[方法名] insert');
INSERT INTO `sysLog` VALUES (3280, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-17 12:56:39', 4, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (3281, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/insert.do', '2020-04-17 12:56:55', 4, '[类名] com.handy.controller.BorrowController[方法名] insert');
INSERT INTO `sysLog` VALUES (3282, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-17 12:56:56', 3, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (3283, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/insert.do', '2020-04-17 12:57:11', 3, '[类名] com.handy.controller.BorrowController[方法名] insert');
INSERT INTO `sysLog` VALUES (3284, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-17 12:57:12', 2, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (3285, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-17 12:57:17', 11, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (3286, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findAll.do', '2020-04-17 12:57:21', 3, '[类名] com.handy.controller.EquipmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3287, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findDetailsByeId.do', '2020-04-17 12:57:22', 18, '[类名] com.handy.controller.EquipmentController[方法名] findDetailsByeId');
INSERT INTO `sysLog` VALUES (3288, '201624131220', '0:0:0:0:0:0:0:1', '/event/findAll.do', '2020-04-17 12:57:36', 10, '[类名] com.handy.controller.EventController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3289, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-17 12:57:37', 2, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3290, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/findAll.do', '2020-04-17 12:57:39', 20, '[类名] com.handy.controller.BroadcastController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3291, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-17 12:57:40', 8, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3292, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-17 12:57:42', 13, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3293, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-17 12:57:45', 42, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3294, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-17 12:57:48', 6, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3295, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-17 12:57:50', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3296, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-17 12:57:59', 11, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3297, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-17 12:58:01', 6, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3298, '201624131220', '0:0:0:0:0:0:0:1', '/event/manageFindDetailsByeId.do', '2020-04-17 12:58:05', 10, '[类名] com.handy.controller.EventController[方法名] manageFindDetailsBysId');
INSERT INTO `sysLog` VALUES (3338, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-21 17:53:16', 21, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3339, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-21 17:53:20', 19, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (3340, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-21 17:53:21', 91, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (3341, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 17:53:24', 21, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3342, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-21 17:53:25', 12, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (3343, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-21 17:53:27', 10, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3344, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-21 17:53:28', 4, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (3345, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 17:53:29', 15, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3346, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 17:53:33', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3347, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-21 17:53:35', 6, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (3348, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 17:53:36', 17, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3349, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 17:57:44', 21, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3350, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 17:57:44', 13, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3351, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 17:57:45', 12, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3352, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 17:57:46', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3353, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-21 17:57:47', 1, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (3354, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 17:57:49', 31, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3355, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 17:57:57', 15, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3356, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 17:57:58', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3357, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-21 17:58:00', 1, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (3358, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 17:58:01', 11, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3359, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 17:58:51', 2, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3360, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 17:59:43', 18, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3361, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 17:59:44', 9, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3362, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 17:59:45', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3363, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 17:59:56', 2, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3364, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 17:59:59', 2, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3365, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 18:00:02', 8, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3366, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 18:01:13', 135, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3367, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 18:01:17', 6, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3368, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-21 18:01:18', 2, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (3369, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 18:01:20', 22, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3370, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 18:01:33', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3371, '201624131220', '0:0:0:0:0:0:0:1', '/matches/update.do', '2020-04-21 18:01:44', 8, '[类名] com.handy.controller.MatchesController[方法名] update');
INSERT INTO `sysLog` VALUES (3372, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 18:01:46', 22, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3373, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 18:02:17', 18, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3374, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 18:02:18', 16, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3375, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 18:02:19', 13, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3376, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 18:02:21', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3377, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 18:02:23', 15, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3378, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 18:02:24', 6, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3379, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 18:02:26', 15, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3380, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 18:02:38', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3381, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 18:02:41', 9, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3382, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 18:02:43', 3, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3383, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 18:02:46', 10, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3384, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findById.do', '2020-04-21 18:02:49', 4, '[类名] com.handy.controller.MatchesController[方法名] findById');
INSERT INTO `sysLog` VALUES (3385, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 18:02:52', 13, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3386, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-21 18:06:00', 12, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3387, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findDetailsBymId.do', '2020-04-21 18:06:06', 1, '[类名] com.handy.controller.MatchesController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (3388, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findAll.do', '2020-04-21 18:06:09', 10, '[类名] com.handy.controller.EquipmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3389, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-21 18:06:11', 11, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3390, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/findAll.do', '2020-04-21 18:06:12', 8, '[类名] com.handy.controller.BroadcastController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3391, '201624131220', '0:0:0:0:0:0:0:1', '/event/findAll.do', '2020-04-21 18:06:13', 19, '[类名] com.handy.controller.EventController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3392, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-21 18:06:14', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3393, '201624131220', '0:0:0:0:0:0:0:1', '/user/userDetails.do', '2020-04-21 18:06:15', 29, '[类名] com.handy.controller.UserController[方法名] userDetails');
INSERT INTO `sysLog` VALUES (3394, '201624131220', '0:0:0:0:0:0:0:1', '/user/updatePW.do', '2020-04-21 18:06:15', 0, '[类名] com.handy.controller.UserController[方法名] updatePW');
INSERT INTO `sysLog` VALUES (3395, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-21 18:06:17', 2, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3396, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-21 18:06:17', 7, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3397, '201624131220', '0:0:0:0:0:0:0:1', '/user/user.do', '2020-04-21 18:06:20', 182, '[类名] com.handy.controller.UserController[方法名] userSetting');
INSERT INTO `sysLog` VALUES (3398, '201624131220', '0:0:0:0:0:0:0:1', '/role/findAllList.do', '2020-04-21 18:06:21', 10, '[类名] com.handy.controller.RoleController[方法名] findAllList');
INSERT INTO `sysLog` VALUES (3399, '201624131220', '0:0:0:0:0:0:0:1', '/user/user.do', '2020-04-21 18:06:21', 185, '[类名] com.handy.controller.UserController[方法名] userSetting');
INSERT INTO `sysLog` VALUES (3400, '201624131220', '0:0:0:0:0:0:0:1', '/role/findAllList.do', '2020-04-21 18:06:23', 1, '[类名] com.handy.controller.RoleController[方法名] findAllList');
INSERT INTO `sysLog` VALUES (3401, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-22 16:45:48', 8, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3402, '201624131220', '0:0:0:0:0:0:0:1', '/user/userDetails.do', '2020-04-22 16:47:54', 30, '[类名] com.handy.controller.UserController[方法名] userDetails');
INSERT INTO `sysLog` VALUES (3403, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-22 16:47:55', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3404, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-22 16:47:58', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3405, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-22 16:50:03', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3406, '201624131220', '0:0:0:0:0:0:0:1', '/user/userDetails.do', '2020-04-22 16:50:06', 55, '[类名] com.handy.controller.UserController[方法名] userDetails');
INSERT INTO `sysLog` VALUES (3407, '201624131220', '0:0:0:0:0:0:0:1', '/user/updatePW.do', '2020-04-22 16:50:07', 0, '[类名] com.handy.controller.UserController[方法名] updatePW');
INSERT INTO `sysLog` VALUES (3408, '201624131220', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-22 16:50:08', 19, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3409, '201624131220', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-22 16:50:09', 26, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3410, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-22 16:50:11', 16, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3411, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/findAll.do', '2020-04-22 16:50:12', 16, '[类名] com.handy.controller.BroadcastController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3412, '201624131220', '0:0:0:0:0:0:0:1', '/event/findAll.do', '2020-04-22 16:50:13', 15, '[类名] com.handy.controller.EventController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3413, '201624131220', '0:0:0:0:0:0:0:1', '/matches/findAll.do', '2020-04-22 16:50:14', 30, '[类名] com.handy.controller.MatchesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3414, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/findAll.do', '2020-04-22 16:50:16', 14, '[类名] com.handy.controller.EquipmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3415, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-22 16:50:19', 93, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3416, '201624131220', '0:0:0:0:0:0:0:1', '/teacher/findAll.do', '2020-04-22 16:50:27', 12, '[类名] com.handy.controller.TeacherController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3417, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-22 16:50:33', 53, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3418, '201624131220', '0:0:0:0:0:0:0:1', '/classes/findAll.do', '2020-04-22 16:50:35', 20, '[类名] com.handy.controller.ClassesController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3419, '201624131220', '0:0:0:0:0:0:0:1', '/department/findAll.do', '2020-04-22 16:50:37', 17, '[类名] com.handy.controller.DepartmentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3420, '201624131220', '0:0:0:0:0:0:0:1', '/sportmeeting/manage.do', '2020-04-22 16:50:39', 4, '[类名] com.handy.controller.SportmeetingController[方法名] add');
INSERT INTO `sysLog` VALUES (3421, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-22 16:50:41', 5, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (3422, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/manage.do', '2020-04-22 16:50:43', 4, '[类名] com.handy.controller.BroadcastController[方法名] manage');
INSERT INTO `sysLog` VALUES (3423, '201624131220', '0:0:0:0:0:0:0:1', '/event/manage.do', '2020-04-22 16:50:44', 9, '[类名] com.handy.controller.EventController[方法名] manage');
INSERT INTO `sysLog` VALUES (3424, '201624131220', '0:0:0:0:0:0:0:1', '/matches/manage.do', '2020-04-22 16:50:47', 11, '[类名] com.handy.controller.MatchesController[方法名] manage');
INSERT INTO `sysLog` VALUES (3425, '201624131220', '0:0:0:0:0:0:0:1', '/matches/input.do', '2020-04-22 16:50:48', 4, '[类名] com.handy.controller.MatchesController[方法名] input');
INSERT INTO `sysLog` VALUES (3426, '201624131220', '0:0:0:0:0:0:0:1', '/equipment/manage.do', '2020-04-22 16:50:51', 2, '[类名] com.handy.controller.EquipmentController[方法名] manage');
INSERT INTO `sysLog` VALUES (3427, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/manage.do', '2020-04-22 16:50:52', 51, '[类名] com.handy.controller.BorrowController[方法名] manage');
INSERT INTO `sysLog` VALUES (3428, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/borrow.do', '2020-04-22 16:50:54', 3, '[类名] com.handy.controller.BorrowController[方法名] borrow');
INSERT INTO `sysLog` VALUES (3429, '201624131220', '0:0:0:0:0:0:0:1', '/borrow/return.do', '2020-04-22 16:50:55', 17, '[类名] com.handy.controller.BorrowController[方法名] returnTo');
INSERT INTO `sysLog` VALUES (3430, '201624131220', '0:0:0:0:0:0:0:1', '/user/user.do', '2020-04-22 16:50:59', 222, '[类名] com.handy.controller.UserController[方法名] userSetting');
INSERT INTO `sysLog` VALUES (3431, '201624131220', '0:0:0:0:0:0:0:1', '/role/findAllList.do', '2020-04-22 16:51:00', 9, '[类名] com.handy.controller.RoleController[方法名] findAllList');
INSERT INTO `sysLog` VALUES (3432, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-22 16:51:05', 1, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3433, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-22 16:52:20', 28, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3434, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-22 16:52:23', 19, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3435, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-22 16:52:25', 18, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3436, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-22 16:55:18', 298, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3437, '201624131220', '0:0:0:0:0:0:0:1', '/student/findDetailsBysId.do', '2020-04-22 16:55:35', 11, '[类名] com.handy.controller.StudentController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (3438, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-22 16:55:40', 78, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3439, '201624131220', '0:0:0:0:0:0:0:1', '/student/findDetailsBysId.do', '2020-04-22 16:55:43', 32, '[类名] com.handy.controller.StudentController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (3440, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-22 16:56:34', 45, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3441, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-22 16:57:43', 193, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3442, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-22 16:57:46', 70, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3443, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-22 16:57:47', 30, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3444, '201624131220', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-22 16:57:48', 11, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3445, '201624131220', '0:0:0:0:0:0:0:1', '/student/findAll.do', '2020-04-22 16:57:50', 23, '[类名] com.handy.controller.StudentController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3446, '201624131201', '0:0:0:0:0:0:0:1', '/user/userDetails.do', '2020-04-22 17:21:24', 62, '[类名] com.handy.controller.UserController[方法名] userDetails');
INSERT INTO `sysLog` VALUES (3447, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-22 17:21:53', 15, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3448, '201624131201', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-22 17:22:19', 25, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3449, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-22 17:22:22', 6, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3450, '201624131201', '0:0:0:0:0:0:0:1', '/event/participate.do', '2020-04-22 17:22:24', 2, '[类名] com.handy.controller.EventController[方法名] participate');
INSERT INTO `sysLog` VALUES (3451, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-22 17:22:25', 3, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3452, '201624131201', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-22 17:22:27', 15, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3453, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-22 17:22:32', 2, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3454, '201624131201', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-22 17:22:38', 16, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3455, '201624131201', '0:0:0:0:0:0:0:1', '/matches/concle.do', '2020-04-22 17:22:42', 3, '[类名] com.handy.controller.MatchesController[方法名] concle');
INSERT INTO `sysLog` VALUES (3456, '201624131201', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-22 17:22:43', 35, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3457, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-22 17:22:46', 4, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3458, '201624131201', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-22 17:22:48', 8, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3459, '201624131201', '0:0:0:0:0:0:0:1', '/matches/concle.do', '2020-04-22 17:22:51', 3, '[类名] com.handy.controller.MatchesController[方法名] concle');
INSERT INTO `sysLog` VALUES (3460, '201624131201', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-22 17:22:52', 11, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3461, '201624131201', '0:0:0:0:0:0:0:1', '/matches/concle.do', '2020-04-22 17:22:54', 2, '[类名] com.handy.controller.MatchesController[方法名] concle');
INSERT INTO `sysLog` VALUES (3462, '201624131201', '0:0:0:0:0:0:0:1', '/matches/myParticipate.do', '2020-04-22 17:22:54', 7, '[类名] com.handy.controller.MatchesController[方法名] myParticipate');
INSERT INTO `sysLog` VALUES (3463, '201624131201', '0:0:0:0:0:0:0:1', '/event/participateEvent.do', '2020-04-22 17:22:56', 4, '[类名] com.handy.controller.EventController[方法名] participateEvent');
INSERT INTO `sysLog` VALUES (3464, '201624131201', '0:0:0:0:0:0:0:1', '/sportmeeting/findAll.do', '2020-04-22 17:23:01', 12, '[类名] com.handy.controller.SportmeetingController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3465, '201624131201', '0:0:0:0:0:0:0:1', '/sportmeeting/findDetailsBysId.do', '2020-04-22 17:23:15', 24, '[类名] com.handy.controller.SportmeetingController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (3466, '201624131201', '0:0:0:0:0:0:0:1', '/sportmeeting/findDetailsBysId.do', '2020-04-22 17:23:24', 38, '[类名] com.handy.controller.SportmeetingController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (3467, '201624131201', '0:0:0:0:0:0:0:1', '/broadcast/findAll.do', '2020-04-22 17:23:35', 3, '[类名] com.handy.controller.BroadcastController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3468, '201624131201', '0:0:0:0:0:0:0:1', '/sportmeeting/findDetailsBysId.do', '2020-04-22 17:23:37', 18, '[类名] com.handy.controller.SportmeetingController[方法名] findDetailsBysId');
INSERT INTO `sysLog` VALUES (3469, '201624131201', '0:0:0:0:0:0:0:1', '/broadcast/main.do', '2020-04-22 17:23:47', 0, '[类名] com.handy.controller.BroadcastController[方法名] main');
INSERT INTO `sysLog` VALUES (3470, '201624131201', '0:0:0:0:0:0:0:1', '/event/findAll.do', '2020-04-22 17:23:49', 7, '[类名] com.handy.controller.EventController[方法名] findAll');
INSERT INTO `sysLog` VALUES (3471, '201624131201', '0:0:0:0:0:0:0:1', '/matches/findAll.do', '2020-04-22 17:23:51', 14, '[类名] com.handy.controller.MatchesController[方法名] findAll');
COMMIT;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `t_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `t_no` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教工号',
  `t_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `t_gender` bit(1) NOT NULL COMMENT '性别',
  `t_identity` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份',
  `t_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `t_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `t_IDcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  PRIMARY KEY (`t_id`) USING BTREE,
  KEY `t_no` (`t_no`) USING BTREE,
  CONSTRAINT `fk_tno_uid` FOREIGN KEY (`t_no`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
BEGIN;
INSERT INTO `teacher` VALUES (1, '10100011', '郑美', b'0', '讲师', '13302614724', 'h8q2wo@yahoo.com', '540921199206293486');
INSERT INTO `teacher` VALUES (2, '10100012', '潘雁', b'1', '讲师', '15006885772', 'sr0t9f3j@3721.net', '810506199504029444');
INSERT INTO `teacher` VALUES (3, '10100013', '权泰', b'0', '讲师', '15901612222', 'b7a0lf7wl@sohu.com', '531501199004108027');
INSERT INTO `teacher` VALUES (4, '10100014', '乌希', b'0', '讲师', '13708496761', 'ccur1ou8h@3721.net', '510201198404098468');
INSERT INTO `teacher` VALUES (5, '10100015', '屠滢洁', b'0', '讲师', '15603007632', '1qbfd01@3721.net', '531306198803123766');
INSERT INTO `teacher` VALUES (6, '10100016', '厍策', b'1', '讲师', '15006772889', 'hcow4aqq@yeah.net', '331201197812205830');
INSERT INTO `teacher` VALUES (7, '10100017', '方静', b'1', '讲师', '13608822660', 'iday4x@live.com', '500202198103315324');
INSERT INTO `teacher` VALUES (8, '10100018', '南敬鸣', b'1', '讲师', '15602628536', 'tixoepiv@live.com', '711023198405091664');
INSERT INTO `teacher` VALUES (9, '10100019', '钦柔秀', b'0', '讲师', '13103451564', 'dp9zy@msn.com', '361409199106068518');
INSERT INTO `teacher` VALUES (10, '10100020', '钦宁', b'1', '讲师', '15701150387', 'fmzqs8ccsu@sina.com', '121516197711291713');
INSERT INTO `teacher` VALUES (11, '10100021', '凌霞娥', b'0', '讲师', '15005260070', '8jjumb66jx@hotmail.com', '441428199306189773');
INSERT INTO `teacher` VALUES (12, '10100022', '竺希', b'0', '讲师', '15706705215', '4uccqxc92@yahoo.com.cn', '360517197602218852');
INSERT INTO `teacher` VALUES (13, '10100023', '易影咏', b'0', '讲师', '13308767937', '96ut3s@aol.com', '341711198108259516');
INSERT INTO `teacher` VALUES (14, '10100024', '公钧彪', b'0', '讲师', '15902814596', '6ta5k0qt@live.com', '621324199811022397');
INSERT INTO `teacher` VALUES (15, '10100025', '孔影巧', b'0', '讲师', '15001388583', '6x4phkt9@msn.com', '370101199710192860');
INSERT INTO `teacher` VALUES (16, '10100026', '席翔言', b'0', '讲师', '13301923510', '3c6e5e53@msn.com', '811721198507085010');
INSERT INTO `teacher` VALUES (17, '10100027', '车芝', b'0', '讲师', '15803844847', 'uuq0rr0@msn.com', '411605197302134889');
INSERT INTO `teacher` VALUES (18, '10100028', '强炎', b'0', '讲师', '15901104022', 'sapp8@0355.net', '341128198008192908');
INSERT INTO `teacher` VALUES (19, '10100029', '俟嘉霭', b'0', '讲师', '13202520810', '7yi9oq0@126.com', '150426198406279145');
INSERT INTO `teacher` VALUES (20, '10100030', '山菊莉', b'1', '讲师', '15502778697', 'kizjltnee8@3721.net', '141420199109276569');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `u_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `u_status` bit(1) NOT NULL COMMENT '用户状态',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1000000', '$2a$10$TqNCXPv..mfvGfvj.6ZwreQHohnzQGXcEYr.05NEs3.IZoz9YUzG.', b'0');
INSERT INTO `user` VALUES ('10100010', '$2a$10$rVGMIPD1i3S1sT7T6UAK/.qQTKJzLWGeQ8ooN0oWaxj0bDhMmjteu', b'0');
INSERT INTO `user` VALUES ('10100011', '$2a$10$kSnG.Rrjx1po9YohqUReleohcyEzEb2X60tRjVu.k/NuOVtVl2imK', b'1');
INSERT INTO `user` VALUES ('10100012', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'0');
INSERT INTO `user` VALUES ('10100013', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'1');
INSERT INTO `user` VALUES ('10100014', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'1');
INSERT INTO `user` VALUES ('10100015', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'0');
INSERT INTO `user` VALUES ('10100016', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'1');
INSERT INTO `user` VALUES ('10100017', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'0');
INSERT INTO `user` VALUES ('10100018', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'0');
INSERT INTO `user` VALUES ('10100019', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'1');
INSERT INTO `user` VALUES ('10100020', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'1');
INSERT INTO `user` VALUES ('10100021', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'1');
INSERT INTO `user` VALUES ('10100022', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'1');
INSERT INTO `user` VALUES ('10100023', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'1');
INSERT INTO `user` VALUES ('10100024', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'1');
INSERT INTO `user` VALUES ('10100025', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'1');
INSERT INTO `user` VALUES ('10100026', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'1');
INSERT INTO `user` VALUES ('10100027', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'1');
INSERT INTO `user` VALUES ('10100028', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'1');
INSERT INTO `user` VALUES ('10100029', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'1');
INSERT INTO `user` VALUES ('10100030', '$2a$10$YKKsmC.3vdYpRbLqYlRyyucBB0lGZDx3DWp9Imapo3ynGp8PnRkq6', b'1');
INSERT INTO `user` VALUES ('201624131198', '$2a$10$l61Us56s8Wb0Z1By6IDsnu0F1AHELZ4gbkgAWV/z8z3LO6qGGsVkC', b'1');
INSERT INTO `user` VALUES ('201624131199', '$2a$10$NnThuBCQqS0i6BIMVwp30eDI6xgmCJSr/3nbvj/0kEs.XKDp4z1DG', b'1');
INSERT INTO `user` VALUES ('201624131201', '$2a$10$Ex.mQar9UWjVpabmPV80FeJif12Fsntnh.bmoKA0NvegqmQj1CoKO', b'1');
INSERT INTO `user` VALUES ('201624131202', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131203', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'0');
INSERT INTO `user` VALUES ('201624131204', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131205', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'0');
INSERT INTO `user` VALUES ('201624131206', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131207', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'0');
INSERT INTO `user` VALUES ('201624131208', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131209', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'0');
INSERT INTO `user` VALUES ('201624131210', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131211', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'0');
INSERT INTO `user` VALUES ('201624131212', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131213', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131214', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131215', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131216', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'0');
INSERT INTO `user` VALUES ('201624131217', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131218', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131219', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131220', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131221', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131222', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131223', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131224', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131225', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131226', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131227', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131228', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131229', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131230', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131231', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131232', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131233', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131234', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131235', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131236', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131237', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131238', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131239', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131240', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131241', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131242', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131243', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131244', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131245', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131246', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131247', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131248', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131249', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131250', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131251', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131252', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131253', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131254', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131255', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131256', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131257', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131258', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131259', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131260', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131261', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131262', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131263', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131264', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131265', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131266', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131267', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131268', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131269', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131270', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131271', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131272', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131273', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131274', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131275', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131276', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131277', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131278', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131279', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131280', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131281', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131282', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131283', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131284', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131285', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131286', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131287', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131288', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131289', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131290', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131291', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131292', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131293', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131294', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131295', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131296', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131297', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131298', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131299', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131300', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131301', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131302', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131303', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131304', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131305', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131306', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131307', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131308', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131309', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131310', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131311', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131312', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131313', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131314', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131315', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131316', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131317', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131318', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131319', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131320', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131321', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131322', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131323', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131324', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131325', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131326', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131327', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131328', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131329', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131330', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131331', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131332', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131333', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131334', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131335', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131336', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131337', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131338', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131339', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131340', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131341', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131342', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131343', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131344', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131345', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131346', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131347', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131348', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131349', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131350', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131351', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131352', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131353', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131354', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131355', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131356', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131357', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131358', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131359', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131360', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131361', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131362', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131363', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131364', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131365', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131366', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131367', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131368', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131369', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131370', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131371', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131372', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131373', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131374', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131375', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131376', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131377', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131378', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131379', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131380', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131381', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131382', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131383', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131384', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131385', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131386', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131387', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131388', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131389', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131390', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131391', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131392', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131393', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131394', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131395', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131396', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131397', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131398', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131399', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131400', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131401', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131402', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131403', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131404', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131405', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131406', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131407', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131408', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131409', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131410', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131411', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131412', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131413', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131414', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131415', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131416', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131417', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131418', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131419', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131420', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131421', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131422', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131423', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131424', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131425', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131426', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131427', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131428', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131429', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131430', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131431', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131432', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131433', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131434', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131435', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131436', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131437', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131438', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131439', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131440', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131441', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131442', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131443', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131444', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131445', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131446', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131447', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131448', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131449', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131450', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131451', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131452', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131453', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131454', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131455', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131456', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131457', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131458', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131459', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131460', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131461', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131462', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131463', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131464', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131465', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131466', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131467', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131468', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131469', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131470', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131471', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131472', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131473', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131474', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131475', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131476', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131477', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131478', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131479', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131480', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131481', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131482', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131483', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131484', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131485', '$2a$10$Z08.T/U1oHCvNtYzYxmwH.HyT9aUaA/CGg7Ey/Sfvkk7F6NSsHnsi', b'1');
INSERT INTO `user` VALUES ('201624131501', '$2a$10$BCpA/tuhJXICauEwEBw9P.DGTiKuz113W2BGeQwxsGymbQ0PK5sa6', b'1');
INSERT INTO `user` VALUES ('77777', '$2a$10$6wXwZ3cgIxeeCtx6TMMHwedVsse9kM59hxWxsNyGJMcS/JMw12fpu', b'1');
INSERT INTO `user` VALUES ('admin', '$2a$10$EAOtmbazZRjHI5iWNTQ48uz8imvQLHarQm84iOxNRGe1ajD54kDSW', b'1');
INSERT INTO `user` VALUES ('test', '$2a$10$14qyHyCZLVkhoJU/Hm4CHuRu292RUSax7MV/XWQpVkYe5YepT6Hzq\n', b'0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
