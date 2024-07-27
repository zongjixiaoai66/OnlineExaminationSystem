/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t207`;
CREATE DATABASE IF NOT EXISTS `t207` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t207`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, '轮播图1', 'http://localhost:8080/javazaixiankaoshi/upload/config1.jpg'),
	(2, '轮播图2', 'http://localhost:8080/javazaixiankaoshi/upload/config2.jpg'),
	(3, '轮播图3', 'http://localhost:8080/javazaixiankaoshi/upload/config3.jpg');

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COMMENT='字典';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'sex_types', '性别类型', 1, '男', NULL, NULL, '2022-03-24 01:18:21'),
	(2, 'sex_types', '性别类型', 2, '女', NULL, NULL, '2022-03-24 01:18:21'),
	(3, 'banji_types', '班级', 1, '一年级一班', NULL, NULL, '2022-03-24 01:18:21'),
	(4, 'banji_types', '班级', 2, '一年级二班', NULL, NULL, '2022-03-24 01:18:21'),
	(5, 'banji_types', '班级', 3, '二年级一班', NULL, NULL, '2022-03-24 01:18:21'),
	(6, 'banji_types', '班级', 4, '二年级二班', NULL, NULL, '2022-03-24 01:18:21'),
	(7, 'shangxia_types', '上下架', 1, '上架', NULL, NULL, '2022-03-24 01:18:21'),
	(8, 'shangxia_types', '上下架', 2, '下架', NULL, NULL, '2022-03-24 01:18:21'),
	(9, 'kecheng_types', '课程类型', 1, '课程类型1', NULL, NULL, '2022-03-24 01:18:21'),
	(10, 'kecheng_types', '课程类型', 2, '课程类型2', NULL, NULL, '2022-03-24 01:18:21'),
	(11, 'kecheng_types', '课程类型', 3, '课程类型3', NULL, NULL, '2022-03-24 01:18:21'),
	(12, 'kecheng_types', '课程类型', 4, '课程类型4', NULL, NULL, '2022-03-24 01:18:21'),
	(13, 'kemu_types', '科目', 1, '语文', NULL, NULL, '2022-03-24 01:18:21'),
	(14, 'kemu_types', '科目', 2, '数学', NULL, NULL, '2022-03-24 01:18:21'),
	(15, 'kemu_types', '科目', 3, '英语', NULL, NULL, '2022-03-24 01:18:21'),
	(16, 'kemu_types', '科目', 4, '化学', NULL, NULL, '2022-03-24 01:18:21'),
	(17, 'kecheng_collection_types', '收藏表类型', 1, '收藏', NULL, NULL, '2022-03-24 01:18:21'),
	(18, 'gonggao_types', '公告类型', 1, '公告类型1', NULL, NULL, '2022-03-24 01:18:21'),
	(19, 'gonggao_types', '公告类型', 2, '公告类型2', NULL, NULL, '2022-03-24 01:18:21'),
	(20, 'examquestion_types', '试题类型', 1, '单选题', NULL, NULL, '2022-03-24 01:18:21'),
	(21, 'examquestion_types', '试题类型', 2, '多选题', NULL, NULL, '2022-03-24 01:18:21'),
	(22, 'examquestion_types', '试题类型', 3, '判断题', NULL, NULL, '2022-03-24 01:18:22'),
	(23, 'examquestion_types', '试题类型', 4, '填空题', NULL, NULL, '2022-03-24 01:18:22'),
	(24, 'exampaper_types', '试卷状态', 1, '启用', NULL, NULL, '2022-03-24 01:18:22'),
	(25, 'exampaper_types', '试卷状态', 2, '禁用', NULL, NULL, '2022-03-24 01:18:22'),
	(26, 'banji_types', '班级', 5, '二年级三班', NULL, '', '2022-03-24 01:53:16');

DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE IF NOT EXISTS `exampaper` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_name` varchar(200) NOT NULL COMMENT '试卷名称 Search111',
  `exampaper_date` int NOT NULL COMMENT '考试时长(分钟)',
  `exampaper_myscore` int NOT NULL DEFAULT '0' COMMENT '试卷总分数',
  `exampaper_types` int NOT NULL DEFAULT '0' COMMENT '试卷状态 Search111',
  `exampaper_delete` int DEFAULT '0' COMMENT '逻辑删除（0代表未删除 1代表已删除）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='试卷表';

DELETE FROM `exampaper`;
INSERT INTO `exampaper` (`id`, `exampaper_name`, `exampaper_date`, `exampaper_myscore`, `exampaper_types`, `exampaper_delete`, `create_time`) VALUES
	(1, '考试试卷1', 100, 100, 1, 1, '2022-03-24 01:18:22'),
	(2, '试卷2', 60, 30, 1, 1, '2022-03-24 01:55:50');

DROP TABLE IF EXISTS `examquestion`;
CREATE TABLE IF NOT EXISTS `examquestion` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exampaper_id` int NOT NULL COMMENT '所属试卷id（外键）',
  `examquestion_name` varchar(200) NOT NULL COMMENT '试题名称 Search111',
  `examquestion_options` longtext COMMENT '选项，json字符串',
  `examquestion_score` int DEFAULT '0' COMMENT '分值 Search111',
  `examquestion_answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `examquestion_analysis` longtext COMMENT '答案解析',
  `examquestion_types` int DEFAULT '0' COMMENT '试题类型',
  `examquestion_sequence` int DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='试题表';

DELETE FROM `examquestion`;
INSERT INTO `examquestion` (`id`, `exampaper_id`, `examquestion_name`, `examquestion_options`, `examquestion_score`, `examquestion_answer`, `examquestion_analysis`, `examquestion_types`, `examquestion_sequence`, `create_time`) VALUES
	(1, 1, '单选题1', '[{"text":"答案A","code":"A"},{"text":"答案B","code":"B"},{"text":"正确答案C","code":"C"},{"text":"答案D","code":"D"}]', 10, 'C', '无', 1, 1, '2022-03-24 01:18:22'),
	(2, 1, '多选题1', '[{"text":"答案A","code":"A"},{"text":"正确答案B","code":"B"},{"text":"正确答案C","code":"C"},{"text":"答案D","code":"D"}]', 34, 'B,C', '无', 2, 2, '2022-03-24 01:18:22'),
	(3, 1, '填空题(正)_____', '[]', 41, '正', '无', 4, 3, '2022-03-24 01:18:22'),
	(4, 1, '判断题1', '[{"text":"A.对","code":"A"},{"text":"B.错","code":"B"}]', 11, 'A', '无', 3, 4, '2022-03-24 01:18:22'),
	(5, 1, '单选题2', '[{"text":"答案A","code":"A"},{"text":"正确答案B","code":"B"},{"text":"答案C","code":"C"},{"text":"答案D","code":"D"}]', 4, 'B', '无', 1, 5, '2022-03-24 01:18:22'),
	(6, 2, '试题1', '[{"text":"A.对","code":"A"},{"text":"B.错","code":"B"}]', 10, 'B', '无', 3, 1, '2022-03-24 01:56:08'),
	(7, 2, '试题2', '[{"text":"正确A","code":"A"},{"text":"正确B","code":"B"},{"text":"C","code":"C"},{"text":"D","code":"D"}]', 20, 'A,B', 'wqeq', 2, 2, '2022-03-24 01:56:54');

DROP TABLE IF EXISTS `examrecord`;
CREATE TABLE IF NOT EXISTS `examrecord` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examrecord_uuid_number` varchar(200) DEFAULT NULL COMMENT '考试编号',
  `yonghu_id` int NOT NULL COMMENT '考试用户',
  `exampaper_id` int NOT NULL COMMENT '所属试卷id（外键）',
  `total_score` int DEFAULT NULL COMMENT '所得总分',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '考试时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='考试记录表';

DELETE FROM `examrecord`;
INSERT INTO `examrecord` (`id`, `examrecord_uuid_number`, `yonghu_id`, `exampaper_id`, `total_score`, `insert_time`, `create_time`) VALUES
	(1, '1648086287450', 1, 1, 96, '2022-03-24 01:44:47', '2022-03-24 01:44:47'),
	(2, '1648086706082', 2, 1, 86, '2022-03-24 01:51:46', '2022-03-24 01:51:46'),
	(3, '1717910381581', 1, 2, 0, '2024-06-09 05:19:42', '2024-06-09 05:19:42');

DROP TABLE IF EXISTS `examredetails`;
CREATE TABLE IF NOT EXISTS `examredetails` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `examredetails_uuid_number` varchar(200) DEFAULT NULL COMMENT '试卷编号',
  `yonghu_id` int NOT NULL COMMENT '用户id',
  `examquestion_id` int NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  `examredetails_myscore` int NOT NULL DEFAULT '0' COMMENT '试题得分',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='答题详情表';

DELETE FROM `examredetails`;
INSERT INTO `examredetails` (`id`, `examredetails_uuid_number`, `yonghu_id`, `examquestion_id`, `examredetails_myanswer`, `examredetails_myscore`, `create_time`) VALUES
	(1, '1648086287450', 1, 5, 'A', 0, '2022-03-24 01:44:50'),
	(2, '1648086287450', 1, 4, 'A', 11, '2022-03-24 01:44:53'),
	(3, '1648086287450', 1, 3, '正', 41, '2022-03-24 01:44:59'),
	(4, '1648086287450', 1, 2, 'B,C', 34, '2022-03-24 01:45:03'),
	(5, '1648086287450', 1, 1, 'C', 10, '2022-03-24 01:45:06'),
	(6, '1648086706082', 2, 5, 'A', 0, '2022-03-24 01:51:49'),
	(7, '1648086706082', 2, 4, 'A', 11, '2022-03-24 01:51:52'),
	(8, '1648086706082', 2, 3, '正', 41, '2022-03-24 01:51:59'),
	(9, '1648086706082', 2, 2, 'B,C', 34, '2022-03-24 01:52:02'),
	(10, '1648086706082', 2, 1, 'B', 0, '2022-03-24 01:52:06'),
	(11, '1717910381581', 1, 7, 'A', 0, '2024-06-09 05:19:44'),
	(12, '1717910381581', 1, 6, 'A', 0, '2024-06-09 05:19:46');

DROP TABLE IF EXISTS `examrewrongquestion`;
CREATE TABLE IF NOT EXISTS `examrewrongquestion` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int NOT NULL COMMENT '用户id',
  `exampaper_id` int NOT NULL COMMENT '试卷（外键）',
  `examquestion_id` int NOT NULL COMMENT '试题id（外键）',
  `examredetails_myanswer` varchar(200) DEFAULT NULL COMMENT '考生作答',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='错题表';

DELETE FROM `examrewrongquestion`;
INSERT INTO `examrewrongquestion` (`id`, `yonghu_id`, `exampaper_id`, `examquestion_id`, `examredetails_myanswer`, `insert_time`, `create_time`) VALUES
	(1, 1, 1, 5, 'A', '2022-03-24 01:44:50', '2022-03-24 01:44:50'),
	(2, 2, 1, 5, 'A', '2022-03-24 01:51:49', '2022-03-24 01:51:49'),
	(3, 2, 1, 1, 'B', '2022-03-24 01:52:06', '2022-03-24 01:52:06'),
	(4, 1, 2, 7, 'A', '2024-06-09 05:19:44', '2024-06-09 05:19:44'),
	(5, 1, 2, 6, 'A', '2024-06-09 05:19:46', '2024-06-09 05:19:46');

DROP TABLE IF EXISTS `gonggao`;
CREATE TABLE IF NOT EXISTS `gonggao` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `gonggao_name` varchar(200) DEFAULT NULL COMMENT '公告名称 Search111  ',
  `gonggao_photo` varchar(200) DEFAULT NULL COMMENT '公告图片 ',
  `gonggao_types` int NOT NULL COMMENT '公告类型 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告发布时间 ',
  `gonggao_content` text COMMENT '公告详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='公告';

DELETE FROM `gonggao`;
INSERT INTO `gonggao` (`id`, `gonggao_name`, `gonggao_photo`, `gonggao_types`, `insert_time`, `gonggao_content`, `create_time`) VALUES
	(1, '公告名称1', 'http://localhost:8080/javazaixiankaoshi/upload/gonggao1.jpg', 1, '2022-03-24 01:22:41', '公告详情1', '2022-03-24 01:22:41'),
	(2, '公告名称2', 'http://localhost:8080/javazaixiankaoshi/upload/gonggao2.jpg', 2, '2022-03-24 01:22:41', '公告详情2', '2022-03-24 01:22:41'),
	(3, '公告名称3', 'http://localhost:8080/javazaixiankaoshi/upload/gonggao3.jpg', 1, '2022-03-24 01:22:41', '公告详情3', '2022-03-24 01:22:41'),
	(4, '公告名称4', 'http://localhost:8080/javazaixiankaoshi/upload/gonggao4.jpg', 2, '2022-03-24 01:22:41', '公告详情4', '2022-03-24 01:22:41'),
	(5, '公告名称5', 'http://localhost:8080/javazaixiankaoshi/upload/gonggao5.jpg', 1, '2022-03-24 01:22:41', '<p>公告详情51111</p>', '2022-03-24 01:22:41');

DROP TABLE IF EXISTS `kecheng`;
CREATE TABLE IF NOT EXISTS `kecheng` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `laoshi_id` int DEFAULT NULL COMMENT '老师',
  `kecheng_uuid_number` varchar(200) DEFAULT NULL COMMENT '课程编号  Search111 ',
  `kecheng_name` varchar(200) DEFAULT NULL COMMENT '课程名称  Search111 ',
  `kecheng_photo` varchar(200) DEFAULT NULL COMMENT '课程照片',
  `kecheng_file` varchar(200) DEFAULT NULL COMMENT '课程文件',
  `kecheng_video` varchar(200) DEFAULT NULL COMMENT '课程视频',
  `kemu_types` int DEFAULT NULL COMMENT '所属科目 Search111',
  `kecheng_types` int DEFAULT NULL COMMENT '课程类型 Search111',
  `kecheng_clicknum` int DEFAULT NULL COMMENT '点击次数 ',
  `kecheng_content` text COMMENT '课程介绍 ',
  `shangxia_types` int DEFAULT NULL COMMENT '是否上架 ',
  `kecheng_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='课程';

DELETE FROM `kecheng`;
INSERT INTO `kecheng` (`id`, `laoshi_id`, `kecheng_uuid_number`, `kecheng_name`, `kecheng_photo`, `kecheng_file`, `kecheng_video`, `kemu_types`, `kecheng_types`, `kecheng_clicknum`, `kecheng_content`, `shangxia_types`, `kecheng_delete`, `create_time`) VALUES
	(1, 2, '16480849618039', '课程名称1', 'http://localhost:8080/javazaixiankaoshi/upload/kecheng1.jpg', 'http://localhost:8080/javazaixiankaoshi/upload/file.rar', 'http://localhost:8080/javazaixiankaoshi/upload/video.mp4', 2, 3, 338, '课程介绍1', 1, 1, '2022-03-24 01:22:41'),
	(2, 2, '164808496180315', '课程名称2', 'http://localhost:8080/javazaixiankaoshi/upload/kecheng2.jpg', 'http://localhost:8080/javazaixiankaoshi/upload/file.rar', 'http://localhost:8080/javazaixiankaoshi/upload/video.mp4', 1, 2, 138, '课程介绍2', 1, 1, '2022-03-24 01:22:41'),
	(3, 1, '16480849618030', '课程名称3', 'http://localhost:8080/javazaixiankaoshi/upload/kecheng3.jpg', 'http://localhost:8080/javazaixiankaoshi/upload/file.rar', 'http://localhost:8080/javazaixiankaoshi/upload/video.mp4', 3, 4, 169, '课程介绍3', 1, 1, '2022-03-24 01:22:41'),
	(4, 3, '16480849618039', '课程名称4', 'http://localhost:8080/javazaixiankaoshi/upload/kecheng4.jpg', 'http://localhost:8080/javazaixiankaoshi/upload/file.rar', 'http://localhost:8080/javazaixiankaoshi/upload/video.mp4', 4, 3, 346, '课程介绍4', 1, 1, '2022-03-24 01:22:41'),
	(5, 3, '16480849618035', '课程名称5', 'http://localhost:8080/javazaixiankaoshi/upload/kecheng5.jpg', 'http://localhost:8080/javazaixiankaoshi/upload/file.rar', 'http://localhost:8080/javazaixiankaoshi/upload/video.mp4', 1, 2, 479, '课程介绍5', 1, 1, '2022-03-24 01:22:41');

DROP TABLE IF EXISTS `kecheng_collection`;
CREATE TABLE IF NOT EXISTS `kecheng_collection` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `kecheng_id` int DEFAULT NULL COMMENT '课程',
  `yonghu_id` int DEFAULT NULL COMMENT '学生',
  `kecheng_collection_types` int DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='课程收藏';

DELETE FROM `kecheng_collection`;
INSERT INTO `kecheng_collection` (`id`, `kecheng_id`, `yonghu_id`, `kecheng_collection_types`, `insert_time`, `create_time`) VALUES
	(1, 1, 1, 1, '2022-03-24 01:22:41', '2022-03-24 01:22:41'),
	(2, 2, 2, 1, '2022-03-24 01:22:41', '2022-03-24 01:22:41'),
	(4, 4, 2, 1, '2022-03-24 01:22:41', '2022-03-24 01:22:41'),
	(5, 5, 1, 1, '2022-03-24 01:22:41', '2022-03-24 01:22:41');

DROP TABLE IF EXISTS `kecheng_liuyan`;
CREATE TABLE IF NOT EXISTS `kecheng_liuyan` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `kecheng_id` int DEFAULT NULL COMMENT '课程',
  `yonghu_id` int DEFAULT NULL COMMENT '学生',
  `kecheng_liuyan_text` text COMMENT '留言内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `reply_text` text COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='课程留言';

DELETE FROM `kecheng_liuyan`;
INSERT INTO `kecheng_liuyan` (`id`, `kecheng_id`, `yonghu_id`, `kecheng_liuyan_text`, `insert_time`, `reply_text`, `update_time`, `create_time`) VALUES
	(1, 1, 2, '留言内容1', '2022-03-24 01:22:41', '回复信息1', '2022-03-24 01:22:41', '2022-03-24 01:22:41'),
	(2, 2, 3, '留言内容2', '2022-03-24 01:22:41', '回复信息2', '2022-03-24 01:22:41', '2022-03-24 01:22:41'),
	(3, 3, 1, '留言内容3', '2022-03-24 01:22:41', '回复信息3', '2022-03-24 01:22:41', '2022-03-24 01:22:41'),
	(4, 4, 3, '留言内容4', '2022-03-24 01:22:41', '回复信息4', '2022-03-24 01:22:41', '2022-03-24 01:22:41'),
	(5, 5, 2, '留言内容5', '2022-03-24 01:22:41', '回复信息5', '2022-03-24 01:22:41', '2022-03-24 01:22:41'),
	(6, 5, 2, '11111', '2022-03-24 01:52:35', '22222222', '2022-03-24 01:55:31', '2022-03-24 01:52:35');

DROP TABLE IF EXISTS `laoshi`;
CREATE TABLE IF NOT EXISTS `laoshi` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `laoshi_uuid_number` varchar(200) DEFAULT NULL COMMENT '工号 Search111 ',
  `laoshi_name` varchar(200) DEFAULT NULL COMMENT '老师姓名 Search111 ',
  `laoshi_phone` varchar(200) DEFAULT NULL COMMENT '老师手机号',
  `laoshi_id_number` varchar(200) DEFAULT NULL COMMENT '老师身份证号',
  `laoshi_photo` varchar(200) DEFAULT NULL COMMENT '老师头像',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `laoshi_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='老师';

DELETE FROM `laoshi`;
INSERT INTO `laoshi` (`id`, `username`, `password`, `laoshi_uuid_number`, `laoshi_name`, `laoshi_phone`, `laoshi_id_number`, `laoshi_photo`, `sex_types`, `laoshi_email`, `create_time`) VALUES
	(1, '老师1', '123456', '16480849618114', '老师姓名1', '17703786901', '410224199610232001', 'http://localhost:8080/javazaixiankaoshi/upload/laoshi1.jpg', 1, '1@qq.com', '2022-03-24 01:22:41'),
	(2, '老师2', '123456', '164808496181112', '老师姓名2', '17703786902', '410224199610232002', 'http://localhost:8080/javazaixiankaoshi/upload/laoshi2.jpg', 1, '2@qq.com', '2022-03-24 01:22:41'),
	(3, '老师3', '123456', '16480849618112', '老师姓名3', '17703786903', '410224199610232003', 'http://localhost:8080/javazaixiankaoshi/upload/laoshi3.jpg', 2, '3@qq.com', '2022-03-24 01:22:41');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 6, 'admin', 'users', '管理员', 'pble0742ih8nm0srlff9nd42r22fhjh9', '2022-03-24 01:28:17', '2024-06-09 06:17:37'),
	(2, 1, 'a1', 'yonghu', '学生', '0i3jqx0fhk4kdqcxcsyeyzd1hkq5dqzm', '2022-03-24 01:42:10', '2024-06-09 06:19:30'),
	(3, 2, 'a2', 'yonghu', '学生', 'vdwf9an41x858au9dl28ee825sprkx2v', '2022-03-24 01:51:26', '2022-03-24 02:51:26'),
	(4, 3, 'a3', 'laoshi', '老师', '98xuu6vcu5w65yi50u36q99hk4wwcs03', '2022-03-24 01:55:09', '2022-03-24 02:55:09'),
	(5, 1, 'a1', 'laoshi', '老师', '4u81lgeloye089zk3191ajyyukfwacr5', '2024-06-09 05:19:02', '2024-06-09 06:19:03');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='管理员';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(6, 'admin', '123456', '管理员', '2022-05-02 06:51:13');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_uuid_number` varchar(200) DEFAULT NULL COMMENT '学号 Search111 ',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '学生姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '学生手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '学生身份证号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '学生头像',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `banji_types` int DEFAULT NULL COMMENT '班级 Search111 ',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='学生';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `username`, `password`, `yonghu_uuid_number`, `yonghu_name`, `yonghu_phone`, `yonghu_id_number`, `yonghu_photo`, `sex_types`, `banji_types`, `yonghu_email`, `create_time`) VALUES
	(1, '学生1', '123456', '16480849618131', '学生姓名1', '17703786901', '410224199610232001', 'http://localhost:8080/javazaixiankaoshi/upload/yonghu1.jpg', 2, 3, '1@qq.com', '2022-03-24 01:22:41'),
	(2, '学生2', '123456', '16480849618143', '学生姓名2', '17703786902', '410224199610232002', 'http://localhost:8080/javazaixiankaoshi/upload/yonghu2.jpg', 1, 3, '2@qq.com', '2022-03-24 01:22:41'),
	(3, '学生3', '123456', '164808496181412', '学生姓名3', '17703786903', '410224199610232003', 'http://localhost:8080/javazaixiankaoshi/upload/yonghu3.jpg', 1, 4, '3@qq.com', '2022-03-24 01:22:41');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
