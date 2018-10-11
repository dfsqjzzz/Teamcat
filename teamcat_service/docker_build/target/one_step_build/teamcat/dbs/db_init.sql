/*
 Navicat MySQL Data Transfer

 Source Server         : 10.69.58.195
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 10.69.58.195
 Source Database       : doraemon_nirvana

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 02/27/2018 15:16:39 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `agent`
-- ----------------------------
DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`CreationTime` datetime(6) NOT NULL,
	`IsActive` tinyint(1) NOT NULL,
	`Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
	`IP` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
	`OS` int(11) NOT NULL,
	`Status` int(11) NOT NULL,
	`AgentWorkSpace` varchar(255) NOT NULL,
	`AgentTags` varchar(255) NOT NULL,
	`AgentPort` int(11) NOT NULL,
	`Executors` int(11) NOT NULL,
	`RunningExecutors` int(11) NOT NULL,
	`BuildToolsDir` varchar(500) DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE `Name` (`Name`) comment ''
) ENGINE=`InnoDB` AUTO_INCREMENT=9 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `agent`
-- ----------------------------
BEGIN;
INSERT INTO `agent` VALUES ('1', '2017-11-09 09:35:24.234000', '1', 'VED_Build', '192.168.136.142', '6', '3', '/Users/ksc-ved-qa/Documents/workspace', '16,', '9001', '3', '0', '/Users/ksc-ved-qa/Documents/tools/build_tools'), ('2', '2018-02-27 07:15:49.345921', '1', 'API_Build', '192.168.152.77', '5', '2', 'd:/workspace', '5,', '9001', '1', '0', null), ('3', '2018-02-08 10:01:27.115142', '1', 'VED_Build2', '192.168.152.82', '6', '2', '/Users/ksc-it/Documents/workspace', '16,', '9001', '2', '0', '/Users/ksc-it/Documents/tools/build_tools'), ('8', '2018-01-05 03:37:03.543445', '1', 'Test', '192.168.2.3', '6', '3', 'd:\\\\fsdfdsfsd', '16,', '23', '1', '0', '');
COMMIT;

-- ----------------------------
--  Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(80) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE `name` (`name`) comment ''
) ENGINE=`InnoDB` AUTO_INCREMENT=36 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `auth_group`
-- ----------------------------
BEGIN;
INSERT INTO `auth_group` VALUES ('27', 'Admin'), ('28', 'Manager'), ('29', 'User');
COMMIT;

-- ----------------------------
--  Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`password` varchar(128) NOT NULL,
	`last_login` datetime DEFAULT NULL,
	`is_superuser` tinyint(1) NOT NULL,
	`username` varchar(150) NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`email` varchar(254) NOT NULL,
	`is_staff` tinyint(1) NOT NULL,
	`is_active` tinyint(1) NOT NULL,
	`date_joined` datetime NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE `username` (`username`) comment ''
) ENGINE=`InnoDB` AUTO_INCREMENT=254 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `auth_user`
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$24000$RYXIB2P9hxN7$Q9VHdZpDDvEZ63j1JcjokAd560ImFd8sCuvPG5Gru6U=', '2016-06-24 07:39:47', '1', 'admin', '理员', '管', 'vedqa@kingsoft.com', '1', '1', '2014-10-16 09:42:16'), ('4', 'pbkdf2_sha256$30000$UVWrwC1aHjL7$ULCC1a9qIhJvOW5Zm3zX7tfnGrlX11rjQHEA475I8+I=', '2018-02-26 01:55:54', '1', 'zhangtiande', '天得', '张', 'zhangtiande@kingsoft.com', '1', '1', '2014-10-16 09:52:43'), ('197', 'pbkdf2_sha256$30000$Be13oeOLMRDm$2SMZKk2fz+ov6iInSa3OH5SmvvvPprdvx+xF24rgg60=', '2018-02-26 01:51:10', '1', 'gaozhenbin', '振斌', '高', 'gaozhenbin@kingsoft.com', '0', '1', '2017-06-07 07:49:19'), ('198', 'pbkdf2_sha256$30000$G3OF1Yc3i85F$pb9mTUNKR0Fo7JdBH2wlK5aMlKwRTR4xbPm11SCVRjg=', '2017-12-19 09:15:50', '1', 'liugang2', '刚', '刘', 'liugang2@kingsoft.com', '0', '1', '2017-06-07 10:24:02'), ('199', 'pbkdf2_sha256$30000$Y2XR2hUmrhi5$lBNVhQ+5sad/yT4c/bZtJFcDly2YEh9B7WNGtX31Bdc=', '2018-02-09 02:45:51', '1', 'YUANQINGRONG', '庆荣', '袁', 'YUANQINGRONG@kingsoft.com', '0', '1', '2017-06-15 09:30:22'), ('200', 'pbkdf2_sha256$30000$ZvpyDp8tys5k$JIUYB4YQ5S9lWlfzbWq8UTktmR9aC4ugfrstLEckvDI=', null, '0', 'ksc-ved-qa', 'A', 'Q', 'ksc-ved-qa@kingsoft.com', '0', '1', '2017-06-20 06:57:45'), ('201', 'pbkdf2_sha256$30000$ZdwhzUk5GsWQ$+aiDXKUlw886YYiDj3JVqTHQ22pGC3/ex7bfszz6SIg=', null, '0', 'ksc-ved-as', '开发', '服务端', 'ksc-ved-as@kingsoft.com', '0', '1', '2017-06-20 06:58:45'), ('202', 'pbkdf2_sha256$30000$XcpSz4TVjKoc$SfShxOO6aCjeeN8TaVKnf7Qkb+0P9+D7RzzCSKe8lJM=', null, '0', 'ksc-ved-fe', '开发', '前端', 'ksc-ved-fe@kingsoft.com', '0', '1', '2017-06-20 06:59:15'), ('203', 'pbkdf2_sha256$30000$sqZwwcH3TvBR$/imnSIMg4WV6Wm96VjJ06tVnhEJkLU8BLqSFirUjL54=', null, '0', 'ksc-ved-ac', '开发组', '客户端', 'ksc-ved-ac@kingsoft.com', '0', '1', '2017-06-20 07:01:50'), ('204', 'pbkdf2_sha256$30000$OQ3IiGhnLgTV$3aJOrJ13Uxs8hX+GnDiM4yF9RuS1vJoZ13ZuTYZHut0=', null, '0', 'ksc-ved-pm', '组', '产品', 'ksc-ved-pm@kingsoft.com', '0', '1', '2017-06-20 07:02:18'), ('205', 'pbkdf2_sha256$30000$i0loDs3y5ui0$thAe6SEjsreHCGp27OlSO0hV3GEEkO/uITedvYAeCGY=', '2017-08-04 14:32:13', '1', 'maorunxia', '润霞', '毛', 'maorunxia@kingsoft.com', '0', '1', '2017-06-27 02:14:25'), ('206', 'pbkdf2_sha256$30000$6zpTrQy7xkea$w8dB/13B/ITFO3f/o0LEPPsWO3utqlxaLaJ8g4IrQ+o=', '2018-02-26 01:33:19', '1', 'lusiyuan', '思远', '陆', 'lusiyuan@kingsoft.com', '0', '1', '2017-07-10 09:04:05'), ('207', 'pbkdf2_sha256$30000$2dvl4EAd2PtX$LPTKGoMAckXktR+/nJV9LpwNYxTslwqh0DkPlhggwcM=', '2018-02-02 12:36:31', '0', 'wangchen6', '晨', '王', 'wangchen6@kingsoft.com', '0', '1', '2017-07-10 09:42:58'), ('208', 'pbkdf2_sha256$30000$w8kqqHXiKQs0$9IR8MEnMBKWXMxXFT9EnvyEqMQPuv39eXwLH0h/w0Es=', '2018-01-11 02:51:21', '0', 'panguangyi', '广益', '潘', 'panguangyi@kingsoft.com', '0', '1', '2017-07-10 09:44:03'), ('209', 'pbkdf2_sha256$30000$zU4fUAZgqRY1$Q7qSS1Zx0oGS/p1uOmEgf8Ueay351XVuE/Unq9LKkkg=', '2018-02-10 13:11:39', '0', 'huyibing', '义兵', '胡', 'huyibing@kingsoft.com', '0', '1', '2017-07-10 09:44:49'), ('210', 'pbkdf2_sha256$30000$JrX04LNPrygN$lt7OsJro5SlRgdTK3XA4vAExDLQI/m0rOkPd5fQrR2U=', '2017-09-05 02:18:28', '0', 'chenjunhan', '俊翰', '陈', 'chenjunhan@kingsoft.com', '0', '1', '2017-07-10 10:01:19'), ('211', 'pbkdf2_sha256$30000$d5uvu10djlYe$TX1YIl236eLr0nImzyZjXKEoUG9TNbEqaEFO/0wuSK4=', null, '0', 'hanbo', '博', '韩', 'hanbo@kingsoft.com', '0', '1', '2017-07-10 10:01:58'), ('212', 'pbkdf2_sha256$30000$iRn0p9jpD0Az$qxTeyPjmA91UMT4KZwLGgWmyLSmeQMq3aaA3rAWeWaw=', '2018-02-06 03:19:22', '1', 'hanguangtian', '光天', '韩', 'hanguangtian@kingsoft.com', '0', '1', '2017-07-10 10:02:48'), ('213', 'pbkdf2_sha256$30000$P2t6ngdpKO8h$IqQ8GkmnGvNiMkK0n7/8RLqI4AYMfB1t0n4nKm5RBZQ=', '2018-01-05 11:30:28', '0', 'tangluo', '洛', '汤', 'tangluo@kingsoft.com', '0', '1', '2017-07-10 10:03:26'), ('214', 'pbkdf2_sha256$30000$OIfXxCbdXCl4$33scn7C5O9qfTjvp6UCsKjNXQzy1wRHOxmerrGUIzN0=', '2018-01-23 03:57:24', '0', 'duanbingying', '兵营', '段', 'duanbingying@kingsoft.com', '0', '1', '2017-07-10 10:04:07'), ('215', 'pbkdf2_sha256$30000$Fkxj81CmOSor$orVvF2bJK/04xcsF2IzvMbGLaeC+Iopy9HtDa52Ezs8=', '2018-01-29 02:17:24', '0', 'xietao', '涛', '谢', 'xietao@kingsoft.com', '0', '1', '2017-07-10 10:04:38'), ('216', 'pbkdf2_sha256$30000$WIg4DlVbPG2s$X1EkQp40ND7L8Rq18etODW3bZWj0bzWGpSIAwuvGMRk=', '2017-08-15 09:10:41', '0', 'wangqingxin', '庆新', '王', 'wangqingxin@kingsoft.com', '0', '1', '2017-07-10 10:05:07'), ('217', 'pbkdf2_sha256$30000$KgMt5DozCx1L$CK5X2lv9zW8AnfC2h0YLYNDE1lrooBpZL2jBIv3hXLo=', '2017-10-09 07:56:01', '0', 'yaoxiusi', '修思', '姚', 'yaoxiusi@kingsoft.com', '0', '1', '2017-07-10 10:05:44'), ('218', 'pbkdf2_sha256$30000$OZov7AoQq7xL$Eup4WK8RqrlYXwgkXwvRrGxFbY73rgC36rSSeYmed90=', '2017-10-25 12:55:51', '0', 'lipeng11', '鹏', '李', 'lipeng11@kingsoft.com', '0', '1', '2017-07-10 10:06:16'), ('219', 'pbkdf2_sha256$30000$INIQjMFawjOj$88yoZqYwVbCRf2VrqIXo34FNLZC1NsOzBCSO0hcvv0o=', '2017-07-12 02:17:56', '0', 'yangle', '乐', '杨', 'yangle@kingsoft.com', '0', '1', '2017-07-12 02:17:01'), ('220', 'pbkdf2_sha256$30000$v1n5gyuXHQtl$T7rkUN5qyGsqx++JYRJmHF8V5WqfxB6TtLrnI+XdBlA=', '2018-02-11 02:41:10', '0', 'wanzhaoyang', '朝阳', '万', 'wanzhaoyang@kingsoft.com', '0', '1', '2017-07-12 10:29:49'), ('221', 'pbkdf2_sha256$30000$UWph5F8wcYHg$sJuhv2yxyn+9YDuqSH2ItNHExzBFI6Za/V+tG/XyQz4=', '2017-07-26 06:35:59', '0', 'yuzhigang', '志刚', '于', 'yuzhigang@kingsoft.com', '0', '1', '2017-07-14 06:36:17'), ('222', 'pbkdf2_sha256$30000$oaQbgVyb8TIv$4NxgzKU8Y+nhzNwcgVdljBGS6vFnI3JbbwaJSQljMTc=', '2018-01-25 02:23:26', '0', 'hehaonan', '浩男', '何', 'hehaonan@kingsoft.com', '0', '1', '2017-07-18 01:20:48'), ('223', 'pbkdf2_sha256$30000$Z7Me19yhUS2z$L7tqb2gg/yuKfso/Tti67w6TVjxh3yw3T4a30zpTP3Q=', '2017-09-26 10:24:09', '0', 'lixiaopeng', '小鹏', '李', 'lixiaopeng@kingsoft.com', '0', '1', '2017-07-18 01:21:33'), ('224', 'pbkdf2_sha256$30000$JkOMkpAtS3zv$dxFkI4U8RLMKVKxTsZ6gfj68A5MCowWAakrSYeq46Pk=', '2017-09-26 11:30:42', '0', 'dongjianxiong', '剑雄', '董', 'dongjianxiong@kingsoft.com', '0', '1', '2017-07-18 01:29:24'), ('225', 'pbkdf2_sha256$30000$ZIcXbk5UzrtS$kgruWi1+fzB4jG4EE/uVFQ1knmPfAFpTrCJUewzCK7E=', '2017-10-23 13:20:02', '0', 'liuxun', '迅', '刘', 'liuxun@kingsoft.com', '0', '1', '2017-07-18 01:30:26'), ('226', 'pbkdf2_sha256$30000$D87v0ce9bJc3$Apu+OaIR2D1+Gh1uiDOYiVrevKdtbRXDAzYEIhOQElk=', '2018-01-15 02:25:42', '0', 'chengwei', '伟', '成', 'chengwei@kingsoft.com', '0', '1', '2017-07-18 01:31:20'), ('227', 'pbkdf2_sha256$30000$qZw06nJMjooP$4f0sEb1DcTGAO88ldSsbeagCKcbHdCszBPnel/KrLz8=', '2018-01-18 02:17:32', '0', 'zhangjianguang', '建光', '张', 'zhangjianguang@kingsoft.com', '0', '1', '2017-07-18 07:38:18'), ('228', 'pbkdf2_sha256$30000$OnBmUQWkkNBx$gF0okVfje4QJtu1bQ1xIO9PLaGkSx6yNVwwUXDVS/SE=', '2017-12-21 13:19:39', '0', 'lixianliang', '宪亮', '李', 'lixianliang@kingsoft.com', '0', '1', '2017-07-18 07:38:56'), ('229', 'pbkdf2_sha256$30000$12o97kirIeHE$ToV3zDElqiv16f0ACLcQz0UOnfuDJ6WxwKrKRsxvjsE=', '2017-11-08 01:20:12', '0', 'haozilong', '子龙', '郝', 'haozilong@kingsoft.com', '0', '1', '2017-07-18 07:40:31'), ('230', 'pbkdf2_sha256$30000$8VaTiajcWAGl$aj/reDq1/oCMVCcykBsnb1m9d4OMi7+1NJZRGdnlSkA=', '2018-01-05 11:22:12', '0', 'zhangfan10', '凡', '张', 'zhangfan10@kingsoft.com', '0', '1', '2017-07-18 07:43:33'), ('231', 'pbkdf2_sha256$30000$OWlAi9qOEJF6$A2DWPo+iVBD/Gw1N/CemAXv3sEPPDgaeyZ+ulklnfZE=', '2018-01-29 01:49:57', '0', 'hupengfei', '鹏飞', '胡', 'hupengfei@kingsoft.com', '0', '1', '2017-07-18 07:44:31'), ('232', 'pbkdf2_sha256$30000$03uWcXyeluRl$MzrxgczbNuPxik2ThM/mp3x1/0UyPFMR6Cz3oueL/FU=', '2018-02-06 08:00:19', '0', 'zhupengfei', '鹏飞', '朱', 'zhupengfei@kingsoft.com', '0', '1', '2017-07-18 07:52:10'), ('233', 'pbkdf2_sha256$30000$F75F6PoYIz2L$+vYd4i5jOIXzWwdHzyZm9x3kuWrmo0depB7wf22NSuQ=', '2017-08-07 01:24:04', '0', 'wangfujian', '福健', '王', 'wangfujian@kingsoft.com', '0', '1', '2017-07-19 08:17:28'), ('234', 'pbkdf2_sha256$30000$TDPBOTTGsBlp$bC4+uvaXctcj8BYdPGF9CDhegM8nP1DpcknDJ1iATXM=', '2017-08-15 09:52:30', '0', 'gaojiangang', '建刚', '高', 'gaojiangang@kingsoft.com', '0', '1', '2017-07-24 02:49:09'), ('235', 'pbkdf2_sha256$30000$oIm2voRulncE$XqIf1PXw6GuFhdzjbSazq3eqbwiymVysHiN7hvkiVBc=', null, '0', 'ksc-ved-ai', 'AI', 'KSC-VED', 'ksc-ved-ai@kingsoft.com', '0', '1', '2017-07-25 03:01:18'), ('236', 'pbkdf2_sha256$30000$CnkPjSKcwwGk$BTjKQoPE+b5fR1IiRGid5d7V5jJBcpu5hqtJX83gcxY=', '2017-10-10 08:53:02', '0', 'wangtianyu', '天宇', '王', 'wangtianyu3@kingsoft.com', '0', '1', '2017-07-26 03:04:26'), ('237', 'pbkdf2_sha256$30000$bKQD4HB1uKuL$qKj6gRN1830qIqphSh9Reb0omoB9bjhcilBa/aGt+9E=', '2017-07-27 09:56:38', '0', 'liushengli', '胜利', '刘', 'liushengli@kingsoft.com', '0', '1', '2017-07-27 09:03:22'), ('238', 'pbkdf2_sha256$30000$2QAsC9FhMMWr$lHxLidwTjYo1tuzk1VXWihPyO/k30RoNkoEoogGPizI=', '2017-10-31 04:00:46', '0', 'liushiquan1', '世权', '刘', 'liushiquan1@kingsoft.com', '0', '1', '2017-07-29 02:35:45'), ('239', 'pbkdf2_sha256$30000$G036Tx2hojwF$rXv+6LihsxHkqzlqQUWQ/Hx5g/4Gr0OTTnpXw++0b84=', '2017-11-24 12:47:49', '0', 'wangyanxin', '彦鑫', '王', 'wangyanxin@kingsoft.com', '0', '1', '2017-07-31 07:26:55'), ('240', 'pbkdf2_sha256$30000$XOcy3tayDG9X$BDPbQt1xVADSURdzjHnUiI8m6q6s7BdNYiF6LHRLDro=', '2017-08-15 10:42:38', '0', 'zhanglijing', '丽晶', '张', 'zhanglijing@kingsoft.com', '0', '1', '2017-07-31 07:27:42'), ('241', 'pbkdf2_sha256$30000$ITasE8Ej6q9U$UVfNcqid0E3lgMTI8caor99Wf00XB0kyl7h1wzh0JeA=', '2017-07-31 07:28:23', '0', 'heziwei', '子微', '贺', 'heziwei@kingsoft.com', '0', '1', '2017-07-31 07:28:16'), ('242', 'pbkdf2_sha256$30000$4dnK6jPXNja8$4lpQyvGf41xKn/QYRBiypnhTnqxhJJzNqZUcKLjVda4=', '2018-02-02 02:17:46', '1', 'zhaoyu6', '宇', '赵', 'zhaoyu6@kingsoft.com', '0', '1', '2017-09-13 06:48:05'), ('243', 'pbkdf2_sha256$30000$I7eisCTTvknY$DEWD2txk8ziFk9mpnCadnUOWggRYAtlNckicOmjIfuA=', '2018-01-26 09:45:25', '0', 'wangzhi', '志', '王', 'wangzhi@kingsoft.com', '0', '1', '2017-10-12 08:21:42'), ('244', 'pbkdf2_sha256$30000$2Jhzg7KkzFHZ$kq/PvJNwyUfPqQQx4gvLFa7ZqBCjjTzr+m3YxB6jv84=', null, '0', 'ksc-ved-rd', '开发', '服务端', 'ksc-ved-rd@kingsoft.com', '0', '1', '2017-10-18 11:05:08'), ('245', 'pbkdf2_sha256$30000$BcaHdvknen06$Sp7EKcOcEn98ozm5abIBX68Tg8W1s5ktSFIlV1hLpL0=', '2018-02-06 11:09:55', '0', 'wangwenbo1', '文博', '王', 'wangwenbo1@kingsoft.com', '0', '1', '2017-10-26 03:06:08'), ('246', 'pbkdf2_sha256$30000$UdvzjXiuYSui$GIbkzA/mhcJ2ZlFd02uAcRtCjuq4XmKS63aZTOugC1o=', '2017-12-18 13:19:04', '0', 'zhangjie11', '捷', '张', 'zhangjie11@kingsoft.com', '0', '1', '2017-11-07 08:47:51'), ('247', 'pbkdf2_sha256$30000$VodFX347TwSW$3awKmgzxhundHz/BE+DD2zIazdYpkhMOWLUsV+B8dDg=', null, '0', 'liubing3', '冰', '刘', 'liubing3@kingsoft.com', '0', '1', '2017-12-21 02:09:48'), ('248', 'pbkdf2_sha256$30000$dBCMPFT2ajLB$pBDabcU1jWS/MmdjDAvCbbKYmNa1zzKMh8fE4mC/eGA=', null, '0', 'cuishijun', '时俊', '崔', 'cuishijun@kingsoft.com', '0', '1', '2017-12-21 02:13:01'), ('249', 'pbkdf2_sha256$30000$V3zmkv4eMz5g$cCnharKtv7N4FlQBHppaXz4l3lpl0GMkeEO2fiC0Bhg=', '2018-01-09 08:28:12', '0', 'CHENBINTAO', '斌涛', '陈', 'CHENBINTAO@kingsoft.com', '0', '1', '2017-12-22 08:52:47'), ('250', 'pbkdf2_sha256$30000$XU64Wu15jB4W$lq3L4JvG1Kht+0YVAjw1IJIgUxECiiaO/4xgoNM1GyM=', null, '0', 'zhangyajie', '雅洁', '张', 'zhangyajie@kingsoft.com', '0', '1', '2017-12-25 03:47:02'), ('251', 'pbkdf2_sha256$30000$x9ckufiHsC56$5OI6kBotdfEyV0xDE5ZCDZcmLmxN5qGaD2iwV7HsJ6s=', null, '0', 'pujie', '杰', '蒲', 'pujie@kingsoft.com', '0', '1', '2017-12-25 03:47:44'), ('252', 'pbkdf2_sha256$30000$5XocIV2L2DVQ$q/gwpTglcTOxV4GgXd1+tZNuRWpqdWkvBAP+brcMq9E=', null, '0', 'yizijun', '子钧', '易', 'yizijun@kingsoft.com', '0', '1', '2017-12-26 09:08:48'), ('253', 'pbkdf2_sha256$30000$pqeAZtqXZGJF$B2bOqaOYdhg3RCqdDhJhN6cqDLy5WHVTEIi9m+4lA1s=', '2018-02-06 03:18:58', '0', 'huanghaojie', '浩杰', '黄', 'huanghaojie@kingsoft.com', '0', '1', '2018-01-10 09:31:39');
COMMIT;

-- ----------------------------
--  Table structure for `auth_user_extend`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_extend`;
CREATE TABLE `auth_user_extend` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`avatar` varchar(255) DEFAULT NULL,
	`side_bars` varchar(255) DEFAULT NULL,
	`dashboard_tools` varchar(255) DEFAULT NULL,
	`shortcuts` varchar(255) DEFAULT NULL,
	`user_id` int(11) NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `auth_user_extend_user_id_3f904c19_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
	UNIQUE `user_id` (`user_id`) comment ''
) ENGINE=`InnoDB` AUTO_INCREMENT=59 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `auth_user_extend`
-- ----------------------------
BEGIN;
INSERT INTO `auth_user_extend` VALUES ('1', '/static/global/images/fruit-avatar/Fruit-20.png', null, null, null, '4'), ('2', '/static/global/images/fruit-avatar/Fruit-8.png', null, null, null, '197'), ('3', '/static/global/images/fruit-avatar/Fruit-19.png', null, null, null, '198'), ('4', '/static/global/images/fruit-avatar/Fruit-13.png', null, null, null, '199'), ('5', '/static/global/images/fruit-avatar/Fruit-14.png', null, null, null, '200'), ('6', '/static/global/images/fruit-avatar/Fruit-8.png', null, null, null, '201'), ('7', '/static/global/images/fruit-avatar/Fruit-19.png', null, null, null, '202'), ('8', '/static/global/images/fruit-avatar/Fruit-6.png', null, null, null, '203'), ('9', '/static/global/images/fruit-avatar/Fruit-12.png', null, null, null, '204'), ('10', '/static/global/images/fruit-avatar/Fruit-11.png', null, null, null, '205'), ('11', '1702', null, null, null, '206'), ('12', '/static/global/images/fruit-avatar/Fruit-5.png', null, null, null, '207'), ('13', '/static/global/images/fruit-avatar/Fruit-8.png', null, null, null, '208'), ('14', '/static/global/images/fruit-avatar/Fruit-18.png', null, null, null, '209'), ('15', '/static/global/images/fruit-avatar/Fruit-7.png', null, null, null, '210'), ('16', '/static/global/images/fruit-avatar/Fruit-9.png', null, null, null, '211'), ('17', '/static/global/images/fruit-avatar/Fruit-4.png', null, null, null, '212'), ('18', '/static/global/images/fruit-avatar/Fruit-7.png', null, null, null, '213'), ('19', '/static/global/images/fruit-avatar/Fruit-14.png', null, null, null, '214'), ('20', '/static/global/images/fruit-avatar/Fruit-4.png', null, null, null, '215'), ('21', '/static/global/images/fruit-avatar/Fruit-4.png', null, null, null, '216'), ('22', '/static/global/images/fruit-avatar/Fruit-12.png', null, null, null, '217'), ('23', '/static/global/images/fruit-avatar/Fruit-9.png', null, null, null, '218'), ('24', '/static/global/images/fruit-avatar/Fruit-16.png', null, null, null, '219'), ('25', '/static/global/images/fruit-avatar/Fruit-9.png', null, null, null, '220'), ('26', '/static/global/images/fruit-avatar/Fruit-4.png', null, null, null, '221'), ('27', '/static/global/images/fruit-avatar/Fruit-15.png', null, null, null, '222'), ('28', '/static/global/images/fruit-avatar/Fruit-17.png', null, null, null, '223'), ('29', '/static/global/images/fruit-avatar/Fruit-9.png', null, null, null, '224'), ('30', '/static/global/images/fruit-avatar/Fruit-7.png', null, null, null, '225'), ('31', '/static/global/images/fruit-avatar/Fruit-19.png', null, null, null, '226'), ('32', '/static/global/images/fruit-avatar/Fruit-16.png', null, null, null, '227'), ('33', '/static/global/images/fruit-avatar/Fruit-11.png', null, null, null, '228'), ('34', '/static/global/images/fruit-avatar/Fruit-18.png', null, null, null, '229'), ('35', '/static/global/images/fruit-avatar/Fruit-7.png', null, null, null, '230'), ('36', '/static/global/images/fruit-avatar/Fruit-2.png', null, null, null, '231'), ('37', '/static/global/images/fruit-avatar/Fruit-4.png', null, null, null, '232'), ('38', '/static/global/images/fruit-avatar/Fruit-5.png', null, null, null, '233'), ('39', '/static/global/images/fruit-avatar/Fruit-17.png', null, null, null, '234'), ('40', '/static/global/images/fruit-avatar/Fruit-4.png', null, null, null, '235'), ('41', '/static/global/images/fruit-avatar/Fruit-13.png', null, null, null, '236'), ('42', '/static/global/images/fruit-avatar/Fruit-3.png', null, null, null, '237'), ('43', '/static/global/images/fruit-avatar/Fruit-13.png', null, null, null, '238'), ('44', '/static/global/images/fruit-avatar/Fruit-6.png', null, null, null, '239'), ('45', '/static/global/images/fruit-avatar/Fruit-4.png', null, null, null, '240'), ('46', '/static/global/images/fruit-avatar/Fruit-19.png', null, null, null, '241'), ('47', '/static/global/images/fruit-avatar/Fruit-1.png', null, null, null, '242'), ('48', '/static/global/images/fruit-avatar/Fruit-1.png', null, null, null, '243'), ('49', '/static/global/images/fruit-avatar/Fruit-19.png', null, null, null, '244'), ('50', '/static/global/images/fruit-avatar/Fruit-18.png', null, null, null, '245'), ('51', '/static/global/images/fruit-avatar/Fruit-13.png', null, null, null, '246'), ('52', '/static/global/images/fruit-avatar/Fruit-17.png', null, null, null, '247'), ('53', '/static/global/images/fruit-avatar/Fruit-9.png', null, null, null, '248'), ('54', '/static/global/images/fruit-avatar/Fruit-8.png', null, null, null, '249'), ('55', '/static/global/images/fruit-avatar/Fruit-6.png', null, null, null, '250'), ('56', '/static/global/images/fruit-avatar/Fruit-5.png', null, null, null, '251'), ('57', '/static/global/images/fruit-avatar/Fruit-19.png', null, null, null, '252'), ('58', '/static/global/images/fruit-avatar/Fruit-11.png', null, null, null, '253');
COMMIT;

-- ----------------------------
--  Table structure for `case_tag`
-- ----------------------------
DROP TABLE IF EXISTS `case_tag`;
CREATE TABLE `case_tag` (
	`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`CreateTime` datetime NOT NULL,
	`IsActive` bit(1) NOT NULL,
	`TagName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
	`TagDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` AUTO_INCREMENT=5 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `case_tag`
-- ----------------------------
BEGIN;
INSERT INTO `case_tag` VALUES ('1', '2017-07-19 15:11:19', b'1', 'ALL', '全部'), ('2', '2017-07-19 14:48:44', b'1', 'EC', '环境检测'), ('3', '2017-07-19 14:49:08', b'1', 'MF', '业务主流程'), ('4', '2017-07-19 14:47:59', b'1', 'BVT', 'BVT 测试');
COMMIT;

-- ----------------------------
--  Table structure for `dicdata`
-- ----------------------------
DROP TABLE IF EXISTS `dicdata`;
CREATE TABLE `dicdata` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`DicType_id` int(11) NOT NULL,
	`DicDataName` varchar(500) NOT NULL,
	`DicDataValue` int(11) NOT NULL,
	`DicDataDesc` varchar(500) DEFAULT NULL,
	`DicDataIsActive` tinyint(1) NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `dicdata_DicType_id_74ecac2420247de7_fk_dictype_id` FOREIGN KEY (`DicType_id`) REFERENCES `dictype` (`id`),
	INDEX `dicdata_DicType_id_74ecac2420247de7_fk_dictype_id` (`DicType_id`) comment ''
) ENGINE=`InnoDB` AUTO_INCREMENT=307 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `dicdata`
-- ----------------------------
BEGIN;
INSERT INTO `dicdata` VALUES ('3', '2', 'SDK', '1', 'SDKQA', '1'), ('4', '2', '媒体', '2', 'MediaQA', '1'), ('5', '2', '接口', '3', 'InterfaceQA', '1'), ('9', '4', '新建', '1', '', '1'), ('10', '4', '已提测', '2', '', '1'), ('11', '4', '开始测试', '3', '', '1'), ('12', '5', 'Android', '1', '', '1'), ('13', '5', 'WindowsPhone', '2', '', '1'), ('14', '5', 'IOS', '3', '', '1'), ('15', '6', '10.3.254.114:8080', '1', '10.3.254.114', '1'), ('16', '6', '10.3.254.34:8080', '2', '10.3.254.34', '1'), ('17', '7', 'smtp.kingsoft.com', '1', 'emailhost', '1'), ('18', '7', 'gedqa', '2', 'user', '1'), ('19', '7', '', '3', 'password', '1'), ('20', '7', 'kingsoft.com', '4', 'postfix', '1'), ('23', '7', '/web/www/teamcat/doraemon/static/project/contents/commit_testing_emailtemplate.html', '5', 'emailsubmitiontemplatepath', '1'), ('25', '7', '/web/www/teamcat/doraemon/static/project/contents/build_package_emailtemplate.html', '6', 'emailbuildtemplatepath', '1'), ('26', '7', 'zhangtiande@kingsoft.com,LUSIYUAN@kingsoft.com', '7', 'defautrecivers', '1'), ('41', '2', '自测', '4', 'DevTest', '1'), ('52', '7', '/web/www/doraemon_rtm/doraemon/static/testjob/contents/testjob_emailtemplate.html', '8', 'email_testjob_template', '1'), ('53', '5', 'PC', '4', '', '1'), ('85', '1', 'Completed', '1', '', '1'), ('86', '1', 'Fail', '2', '', '1'), ('87', '1', 'TimeOut', '4', '', '1'), ('88', '1', 'Aborted', '3', '', '1'), ('89', '12', 'Android', '1', 'APP', '1'), ('90', '12', 'IOS', '2', 'APP', '1'), ('91', '12', 'IE6', '3', 'WEB', '1'), ('92', '12', 'IE7', '4', 'WEB', '1'), ('93', '12', 'IE8', '5', 'WEB', '1'), ('94', '12', 'IE9', '6', 'WEB', '1'), ('95', '12', 'IE10', '7', 'WEB', '1'), ('96', '12', 'IE11', '8', 'WEB', '1'), ('97', '12', 'Edge', '9', 'WEB', '1'), ('98', '12', 'Chrome', '10', 'WEB', '1'), ('99', '12', 'FireFox', '11', 'WEB', '1'), ('100', '13', 'Interface', '1', '', '1'), ('101', '13', 'WebUI', '2', '', '1'), ('102', '13', 'APPUI', '3', '', '1'), ('103', '14', 'Win8', '1', '', '1'), ('104', '14', 'Linux', '2', '', '1'), ('105', '14', 'Win7', '3', '', '1'), ('106', '14', 'WinXP', '4', '', '1'), ('107', '14', 'Win10', '5', '', '1'), ('108', '15', 'Running', '1', '', '1'), ('109', '15', 'Online', '2', '', '1'), ('110', '15', 'Offline', '3', '', '1'), ('111', '16', 'TaskWaitTimeout', '7200000', '', '1'), ('112', '16', 'TaskRunTimeout', '7200000', '', '1'), ('113', '17', 'NoProcess', '1', '', '1'), ('114', '18', 'DefautAndroidUI', '1', '', '1'), ('115', '18', 'DefaultWebUI', '2', '', '1'), ('116', '18', 'DefaultInterface', '3', '', '1'), ('117', '19', 'Start', '1', '', '1'), ('118', '19', 'Stop', '2', '', '1'), ('119', '17', 'NoAssign', '2', '', '1'), ('120', '17', 'Assigned', '3', '', '1'), ('121', '17', 'AssignFail', '6', '', '1'), ('122', '17', 'Aborted', '7', '', '1'), ('123', '17', 'Complete', '5', '', '1'), ('124', '17', 'Error', '9', '', '1'), ('125', '20', 'NotRun', '0', '', '1'), ('126', '20', 'Ignore', '1', '', '1'), ('127', '20', 'Fail', '2', '', '1'), ('128', '20', 'Pass', '3', '', '1'), ('129', '21', 'VEDQA-AutoTest', '1', '', '1'), ('130', '21', '226', '2', '', '0'), ('131', '21', '227', '3', '', '0'), ('132', '22', '4.0', '1', '', '1'), ('133', '22', '2.3', '2', '', '1'), ('134', '23', '6.0', '1', '', '1'), ('135', '23', '6.1', '2', '', '1'), ('136', '15', 'Assigned', '4', '', '1'), ('137', '19', 'Timeout', '3', '', '1'), ('138', '17', 'Timeout', '8', '', '1'), ('139', '24', 'SplitCount', '3', '', '1'), ('140', '17', 'Running', '4', '', '1'), ('141', '24', 'TimerInterval', '5000', '', '1'), ('142', '24', 'ControllerInterval', '10000', '', '1'), ('143', '24', 'AgentDetcterInterval', '60000', '', '1'), ('144', '25', 'Running', '1', '', '1'), ('145', '25', 'Online', '2', '', '1'), ('146', '25', 'Offline', '3', '', '1'), ('147', '25', 'Assigned', '4', '', '1'), ('148', '26', 'DevScanInterval', '30000', '', '1'), ('149', '26', 'TaskScanInterval', '5000', '', '1'), ('150', '26', 'AgentDefaultPort', '8099', '', '1'), ('151', '26', 'AgentDefaultSpace', '0', './workspace', '1'), ('152', '26', 'FtpServer', '0', '10.2.45.50', '1'), ('153', '26', 'FtpPort', '21', '', '1'), ('154', '26', 'FtpUser', '0', 'root', '1'), ('155', '26', 'FtpPasswd', '0', '123456', '1'), ('156', '26', 'FtpRootDir', '0', 'archives', '1'), ('157', '19', 'SendResultEmail', '4', '', '1'), ('158', '26', 'WifiConnectTimeout', '180000', '', '1'), ('159', '26', 'rerunTimeDefualt', '1', '', '1'), ('160', '26', 'rerunIsUpdateResult', '1', '', '1'), ('161', '19', 'RerunCase', '5', '', '1'), ('162', '16', 'LockTimeout', '180000', '', '1'), ('163', '27', 'Bug', '1', null, '1'), ('164', '27', 'Home', '2', null, '1'), ('165', '27', 'Project', '3', null, '1'), ('166', '27', 'Task', '4', null, '1'), ('167', '27', 'ForTesting', '5', null, '1'), ('168', '27', 'User', '6', null, '1'), ('169', '27', 'UserGroup', '7', null, '1'), ('170', '27', 'Permission', '8', null, '1'), ('171', '27', 'Device', '9', null, '1'), ('172', '28', 'Android', '1', null, '1'), ('173', '28', 'IOS', '2', null, '1'), ('174', '28', 'WP', '3', null, '1'), ('175', '29', '8.0', '1', null, '1'), ('176', '29', '10.0', '2', null, '1'), ('177', '30', '1024x768', '8', '', '1'), ('178', '30', '1080*1920', '19', '', '1'), ('179', '30', '1136*640', '15', '', '1'), ('180', '30', '1280*720', '16', '', '1'), ('181', '30', '1280*768', '20', '', '1'), ('182', '30', '1280×800', '10', '', '1'), ('183', '30', '13334x750', '4', '', '1'), ('184', '30', '1800*1080', '11', '', '1'), ('185', '30', '1920*1080', '7', '', '1'), ('186', '30', '1920*1152', '1', '', '1'), ('187', '30', '2048×1536', '9', '', '1'), ('188', '30', '2048x1536', '3', '', '1'), ('189', '30', '2048x1536', '17', '', '1'), ('190', '30', '2560×1440', '2', '', '1'), ('191', '30', '480*320', '13', '', '1'), ('192', '30', '480*800', '18', '', '1'), ('193', '30', '480*854', '12', '', '1'), ('194', '30', '720x1280', '6', '', '1'), ('195', '30', '960x540', '5', '', '1'), ('196', '30', '960x640', '14', '', '1'), ('197', '31', '测试设备', '1', null, '1'), ('198', '31', '开发设备', '2', null, '1'), ('199', '31', 'Android配件', '4', null, '1'), ('200', '31', 'IOS配件', '5', null, '1'), ('201', '31', '其他配件', '6', null, '1'), ('202', '28', 'None', '0', null, '1'), ('203', '30', 'None', '0', null, '1'), ('204', '22', 'None', '0', null, '1'), ('205', '23', 'None', '0', null, '1'), ('206', '29', 'None', '0', null, '1'), ('207', '32', '可用', '1', null, '1'), ('208', '32', '出借', '2', null, '1'), ('209', '32', '预定', '3', null, '1'), ('211', '33', '设备', '-1', '设备的统一项目ID', '1'), ('212', '27', 'Bug', '1', null, '1'), ('213', '22', '4.4', '3', null, '1'), ('214', '22', '4.3', '4', null, '1'), ('215', '23', '9.2', '4', null, '1'), ('216', '23', '8.0', '5', null, '1'), ('217', '23', '7.0.4', '6', null, '1'), ('218', '23', '9.1', '7', null, '1'), ('219', '23', '8.3', '8', null, '1'), ('220', '23', '8.1.3', '9', null, '1'), ('221', '23', '9.3', '10', null, '1'), ('222', '22', '4.4.4', '5', null, '1'), ('223', '22', '2.3.3', '6', null, '1'), ('224', '22', '2.3.7', '7', null, '1'), ('225', '30', '320x240', '21', null, '1'), ('226', '22', '5.0.1', '8', null, '1'), ('227', '22', '4.4.2', '9', null, '1'), ('228', '22', '6.0', '10', null, '1'), ('229', '22', '2.3.6', '11', null, '1'), ('230', '22', '6.0.1', '12', null, '1'), ('231', '30', '2208x1242', '22', null, '1'), ('232', '23', '9.2.1', '11', null, '1'), ('233', '23', '6.0.1', '12', null, '1'), ('234', '23', '8.1', '13', null, '1'), ('235', '23', '5.1.1', '14', null, '1'), ('236', '23', '8.1.2', '15', null, '1'), ('237', '23', '10.0', '16', null, '1'), ('238', '34', '通用标签', '1', null, '1'), ('239', '34', 'CI标签', '2', null, '1'), ('240', '34', 'AgentFilterTag', '3', null, '1'), ('241', '35', 'UserPassword', '1', '用户名密码形式', '1'), ('242', '35', 'SSH Key', '2', 'SSH Key with username', '1'), ('243', '13', 'Build', '4', null, '1'), ('244', '13', 'Deploy', '5', null, '1'), ('245', '36', 'CI', '1', null, '1'), ('246', '37', '\'zip\',\'apk\',\'ipa\',\'py\',\'sh\',\'war\',\'jsp\',\'txt\'', '1', null, '1'), ('247', '37', '600*1024*1024', '2', null, '1'), ('248', '14', 'Mac', '6', null, '1'), ('249', '39', 'Always check out a fresh copy', '1', null, '1'), ('250', '39', 'Use svn update as much as possible', '2', null, '1'), ('251', '38', 'Wipe out & shallow clone (无变更日志,耗时短)', '1', null, '1'), ('252', '38', 'Wipe out & full clone (有变更日志,耗时长)', '2', null, '1'), ('253', '17', 'Disaster', '10', null, '1'), ('254', '40', 'Default', '20', 'JDK', '1'), ('255', '40', 'JDK6', '1', 'JDK', '1'), ('256', '40', 'JDK7', '2', 'JDK', '1'), ('257', '40', 'JDK8', '3', 'JDK', '1'), ('258', '40', 'Default', '22', 'GRADLE', '1'), ('259', '40', 'Gradle-1.10', '5', 'GRADLE', '0'), ('260', '40', 'Gradle-2.1', '6', 'GRADLE', '0'), ('261', '40', 'Gradle-2.2.1', '7', 'GRADLE', '0'), ('262', '40', 'Gradle-2.4', '8', 'GRADLE', '0'), ('263', '40', 'Gradle-2.7', '9', 'GRADLE', '0'), ('264', '40', 'Gradle-2.10', '10', 'GRADLE', '0'), ('265', '40', 'Gradle-3.4.1', '11', 'GRADLE', '1'), ('266', '40', 'Default', '21', 'XCODE', '1'), ('267', '40', 'Xcode-6', '13', 'XCODE', '1'), ('268', '40', 'Xcode-7', '14', 'XCODE', '1'), ('269', '24', 'DisasterInterval', '3600000', null, '1'), ('270', '40', '忽略', '19', 'PODS', '1'), ('271', '40', '安装且编译', '16', 'PODS', '1'), ('272', '40', '仅安装', '17', 'PODS', '1'), ('273', '40', '仅编译', '18', 'PODS', '1'), ('274', '5', 'Web', '6', null, '1'), ('275', '38', 'revert & update(有变更日志)', '3', null, '1'), ('276', '40', 'JDK9', '4', 'JDK', '1'), ('277', '40', 'Xcode-8', '15', 'XCODE', '1'), ('278', '40', 'Gradle-3.1', '12', 'GRADLE', '1'), ('279', '24', 'TaskLimit', '4', null, '1'), ('280', '16', 'SocketTimeout', '180000', null, '1'), ('281', '23', '10.0.1', '17', null, '1'), ('282', '23', '10.0.2', '18', null, '1'), ('283', '23', '10.1.1', '19', null, '1'), ('284', '23', '8.4.1', '20', null, '1'), ('285', '22', '7.0', '13', null, '1'), ('286', '22', '5.0.2', '14', null, '1'), ('287', '22', '5.1', '15', null, '1'), ('288', '22', '5.1.1', '16', null, '1'), ('289', '23', '7.1.2', '21', null, '1'), ('290', '23', '8.1', '22', null, '1'), ('291', '23', '9.3', '23', null, '1'), ('292', '23', '8.2', '25', null, '1'), ('293', '23', '9.3.1', '26', null, '1'), ('294', '31', '长期借用', '7', null, '0'), ('295', '23', '8.4', '27', null, '1'), ('296', '23', '8.1.3', '28', null, '1'), ('300', '23', '10.3.1', '30', null, '1'), ('301', '23', '10.2.1', '31', null, '1'), ('302', '40', 'Gradle-3.3', '23', 'GRADLE', '1'), ('303', '21', 'EDU', '4', null, '0'), ('304', '5', '服务端', '7', null, '1'), ('305', '4', '测试完成', '4', null, '1'), ('306', '40', 'Gradle-4.1', '24', 'GRADLE', '1');
COMMIT;

-- ----------------------------
--  Table structure for `dictype`
-- ----------------------------
DROP TABLE IF EXISTS `dictype`;
CREATE TABLE `dictype` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`DicTypeName` varchar(50) NOT NULL,
	`DicTypeIsActive` tinyint(1) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` AUTO_INCREMENT=41 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `dictype`
-- ----------------------------
BEGIN;
INSERT INTO `dictype` VALUES ('1', 'TaskStatus', '1'), ('2', 'ProjectType', '1'), ('3', 'ProjectName', '1'), ('4', 'TestSubmitionStatus', '1'), ('5', 'Platform', '1'), ('6', 'JenkinsServer', '1'), ('7', 'EmailConfig', '1'), ('8', 'BuildStatus', '1'), ('9', 'JobType', '1'), ('10', 'JobStatus', '1'), ('11', 'SCMInfo', '1'), ('12', 'AutoTaskRuntime', '1'), ('13', 'TaskType', '1'), ('14', 'AgentOSType', '1'), ('15', 'AutoAgentStatus', '1'), ('16', 'ControllerTimeout', '1'), ('17', 'TaskInQueueStatus', '1'), ('18', 'AutoAgentExecDriver', '1'), ('19', 'TQCommandType', '1'), ('20', 'AutoCaseStatus', '1'), ('21', 'TestEnv', '1'), ('22', 'AndroidVersion', '1'), ('23', 'IOSVersion', '1'), ('24', 'ControllerGlobalConfig', '1'), ('25', 'MobileDeviceStatus', '1'), ('26', 'AgentGlobalConfig', '1'), ('27', 'AuthPermissionType', '1'), ('28', 'DeviceOS', '1'), ('29', 'WPVersion', '1'), ('30', 'ScreenSize', '1'), ('31', 'DeviceType', '1'), ('32', 'DeviceStatus', '1'), ('33', 'NoProject', '1'), ('34', 'TagType', '1'), ('35', 'CICredentialType', '1'), ('36', 'ActionLogType', '1'), ('37', 'CIUploadFileLimit', '1'), ('38', 'GitCheckOutStrategy', '1'), ('39', 'SvnCheckOutStrategy', '1'), ('40', 'BuildTools', '1');
COMMIT;

-- ----------------------------
--  Table structure for `project_issue_category`
-- ----------------------------
DROP TABLE IF EXISTS `project_issue_category`;
CREATE TABLE `project_issue_category` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Value` int(11) NOT NULL,
	`Desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`IsActive` bit(1) DEFAULT NULL,
	`Project` int(11) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` AUTO_INCREMENT=6 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `project_issue_category`
-- ----------------------------
BEGIN;
INSERT INTO `project_issue_category` VALUES ('1', '1', null, '功能', b'1', '0'), ('2', '2', null, '性能', b'1', '0'), ('3', '3', null, 'UI', b'1', '0'), ('4', '4', null, '兼容性', b'1', '0'), ('5', '5', null, '服务端兼容性', b'1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `project_issue_resolved_result`
-- ----------------------------
DROP TABLE IF EXISTS `project_issue_resolved_result`;
CREATE TABLE `project_issue_resolved_result` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Value` int(11) NOT NULL,
	`Desc` varchar(100) DEFAULT NULL,
	`Name` varchar(50) DEFAULT NULL,
	`IsActive` bit(1) DEFAULT NULL,
	`Project` int(11) NOT NULL,
	`LabelStyle` varchar(50) DEFAULT NULL,
	`Label` varchar(50) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` AUTO_INCREMENT=8 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `project_issue_resolved_result`
-- ----------------------------
BEGIN;
INSERT INTO `project_issue_resolved_result` VALUES ('1', '1', null, '未修复', b'1', '0', 'issue-severity-fatal', 'fa-minus-square-o'), ('2', '2', null, '修复', b'1', '0', 'issue-status-check', 'fa-gavel'), ('3', '3', null, '延迟修复', b'1', '0', 'issue-severity-critical', 'fa-bomb'), ('4', '4', null, '不修复', b'1', '0', 'issue-severity-fatal', 'fa-bolt'), ('5', '5', null, '重复', b'1', '0', 'issue-status-reopen', 'fa-crosshairs'), ('6', '6', null, 'Not a Bug', b'1', '0', 'issue-severity-major', 'fa-tint'), ('7', '7', null, 'By Desgin', b'1', '0', 'issue-severity-minor', 'fa-ban');
COMMIT;

-- ----------------------------
--  Table structure for `project_issue_severity`
-- ----------------------------
DROP TABLE IF EXISTS `project_issue_severity`;
CREATE TABLE `project_issue_severity` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Value` int(11) NOT NULL,
	`Desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`IsActive` bit(1) DEFAULT NULL,
	`Project` int(11) NOT NULL,
	`LabelStyle` varchar(50) DEFAULT NULL,
	`Label` varchar(50) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` AUTO_INCREMENT=5 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `project_issue_severity`
-- ----------------------------
BEGIN;
INSERT INTO `project_issue_severity` VALUES ('1', '1', null, 'Fatal', b'1', '0', 'issue-severity-fatal', 'fa-circle'), ('2', '2', null, 'Critical', b'1', '0', 'issue-severity-critical', 'fa-circle'), ('3', '3', null, 'Major', b'1', '0', 'issue-severity-major', 'fa-circle'), ('4', '4', null, 'Minor', b'1', '0', 'issue-severity-minor', 'fa-circle');
COMMIT;

-- ----------------------------
--  Table structure for `project_issue_status`
-- ----------------------------
DROP TABLE IF EXISTS `project_issue_status`;
CREATE TABLE `project_issue_status` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Value` int(11) NOT NULL,
	`Desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`IsActive` bit(1) DEFAULT NULL,
	`Project` int(11) NOT NULL,
	`LabelStyle` varchar(50) DEFAULT NULL,
	`Label` varchar(50) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` AUTO_INCREMENT=6 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `project_issue_status`
-- ----------------------------
BEGIN;
INSERT INTO `project_issue_status` VALUES ('1', '1', null, '待提交', b'1', '0', 'issue-status-fresh', 'fa-sun-o'), ('2', '2', null, '新建', b'1', '0', 'issue-status-new', 'fa-file'), ('3', '3', null, '已关闭', b'1', '0', 'issue-status-closed', 'fa-minus-square-o'), ('4', '4', null, '已解决', b'1', '0', 'issue-status-resolved', 'fa-check'), ('5', '5', null, '重新打开', b'1', '0', 'issue-status-reopen', 'fa-retweet');
COMMIT;

-- ----------------------------
--  Table structure for `project_os`
-- ----------------------------
DROP TABLE IF EXISTS `project_os`;
CREATE TABLE `project_os` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Value` int(11) NOT NULL,
	`Desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`IsActive` bit(1) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` AUTO_INCREMENT=9 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `project_os`
-- ----------------------------
BEGIN;
INSERT INTO `project_os` VALUES ('1', '1', null, 'Android', b'1'), ('2', '2', null, 'IOS', b'1'), ('5', '5', null, 'Windows', b'1'), ('6', '6', null, 'MaxOS', b'1'), ('7', '7', null, 'Linux', b'1');
COMMIT;

-- ----------------------------
--  Table structure for `project_os_version`
-- ----------------------------
DROP TABLE IF EXISTS `project_os_version`;
CREATE TABLE `project_os_version` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Value` int(11) NOT NULL,
	`Desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`IsActive` bit(1) NOT NULL,
	`OS` int(11) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` AUTO_INCREMENT=11 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `project_os_version`
-- ----------------------------
BEGIN;
INSERT INTO `project_os_version` VALUES ('1', '1', null, '4.4', b'1', '1'), ('2', '2', null, '5.0', b'1', '1'), ('3', '3', null, '6.0', b'1', '1'), ('4', '4', null, '7.0', b'1', '1'), ('5', '5', null, '8.0', b'1', '1'), ('6', '1', '', '8.0', b'1', '2'), ('7', '2', '', '9.0', b'1', '2'), ('8', '3', '', '10.0', b'1', '2'), ('9', '4', '', '11.0', b'1', '2'), ('10', '5', '', '11.0.3', b'1', '2');
COMMIT;

-- ----------------------------
--  Table structure for `project_phase`
-- ----------------------------
DROP TABLE IF EXISTS `project_phase`;
CREATE TABLE `project_phase` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`Value` int(11) NOT NULL,
	`Desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
	`IsActive` bit(1) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` AUTO_INCREMENT=8 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `project_phase`
-- ----------------------------
BEGIN;
INSERT INTO `project_phase` VALUES ('1', '1', null, '需求分析', b'1'), ('2', '2', null, '需求评审', b'1'), ('3', '3', null, '设计研发', b'1'), ('4', '4', null, '提测前验证', b'1'), ('5', '5', null, '测试阶段', b'1'), ('6', '6', null, '预上线', b'1'), ('7', '7', null, '线上阶段', b'1');
COMMIT;

-- ----------------------------
--  Table structure for `project_role`
-- ----------------------------
DROP TABLE IF EXISTS `project_role`;
CREATE TABLE `project_role` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`CreationTime` datetime NOT NULL,
	`IsActive` tinyint(1) NOT NULL,
	`PRName` varchar(20) NOT NULL,
	`PRColor` varchar(50) DEFAULT NULL,
	`PRAuthGroup` int(11) NOT NULL,
	`PRRoleDesc` varchar(500) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` AUTO_INCREMENT=6 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `project_role`
-- ----------------------------
BEGIN;
INSERT INTO `project_role` VALUES ('1', '2015-11-18 15:57:52', '1', 'User', 'green', '0', null), ('2', '2015-11-18 15:58:34', '1', 'Tester', 'red', '0', null), ('3', '2015-12-03 15:58:51', '1', 'Dev', 'orange', '0', null), ('4', '2015-11-18 15:59:20', '1', 'Admin', '#426ab3', '0', null), ('5', '2015-11-18 16:00:09', '1', 'Owner', '#7fb80e', '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `project_tag`
-- ----------------------------
DROP TABLE IF EXISTS `project_tag`;
CREATE TABLE `project_tag` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`CreationTime` datetime NOT NULL,
	`IsActive` tinyint(1) NOT NULL,
	`TagName` varchar(20) NOT NULL,
	`TagProjectID` int(11) NOT NULL,
	`TagColor` varchar(50) DEFAULT NULL,
	`TagAvatar` varchar(255) DEFAULT NULL,
	`TagVisableLevel` int(11) NOT NULL,
	`TagOwner` int(11) NOT NULL,
	`TagType` int(11) NOT NULL DEFAULT 1,
	PRIMARY KEY (`id`)
) ENGINE=`InnoDB` AUTO_INCREMENT=26 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='' CHECKSUM=0 DELAY_KEY_WRITE=0;

-- ----------------------------
--  Records of `project_tag`
-- ----------------------------
BEGIN;
INSERT INTO `project_tag` VALUES ('1', '2015-11-13 16:51:49', '1', ' 安卓', '0', '#32be77', null, '1', '2', '1'), ('2', '2015-11-13 16:53:33', '1', 'IOS', '0', 'red', null, '1', '2', '1'), ('3', '2015-11-13 16:54:02', '1', '功能', '0', 'blue', null, '1', '2', '1'), ('4', '2015-11-13 16:54:38', '1', 'WP', '0', '#426ab3', null, '1', '2', '1'), ('5', '2015-11-13 17:02:10', '1', '接口', '0', '#426ab3', null, '1', '2', '1'), ('6', '2015-11-13 17:02:32', '1', '长期', '0', 'orange', null, '1', '2', '1'), ('7', '2015-11-13 17:03:08', '1', '开发', '0', '#7fb80e', null, '1', '2', '1'), ('8', '2016-07-25 17:13:01', '1', '构建', '0', '#32be77', null, '1', '2', '1'), ('9', '2016-07-25 17:14:33', '1', '部署', '0', '#6a6da9', null, '1', '2', '1'), ('10', '2016-07-25 17:15:24', '0', '测试', '0', '#00ae9d', null, '1', '2', '1'), ('11', '2016-07-27 10:23:43', '1', 'Android', '0', '#1d953f', null, '1', '2', '3'), ('12', '2016-07-27 10:24:42', '1', 'IOS', '0', '#fdb933', null, '1', '2', '3'), ('13', '2016-11-24 17:40:35', '1', 'Release', '0', '#f05b72', null, '1', '2', '2'), ('14', '2016-11-24 17:48:53', '1', 'Test Complete', '0', '#f391a9', null, '1', '2', '2'), ('15', '2016-11-24 17:50:28', '1', 'Mile Stone', '0', '#d93a49', null, '1', '2', '2'), ('16', '2016-12-07 11:17:33', '1', 'VED_Build', '0', '#007947', null, '1', '2', '3'), ('17', '2016-12-15 17:17:51', '1', 'Daily Build', '0', '#faa755', null, '1', '2', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
