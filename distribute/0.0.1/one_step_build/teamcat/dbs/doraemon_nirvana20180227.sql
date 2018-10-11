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

 Date: 02/27/2018 15:13:58 PM
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
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_group_extend`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_extend`;
CREATE TABLE `auth_group_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `backcolor` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `group_priority` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_13acf6f62506d836_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_13acf6f62506d836_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_33a12a5a8a5bcd3d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_p_content_type_id_97df4e2810921f1_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_permission_extend`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission_extend`;
CREATE TABLE `auth_permission_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `PermissionType` int(11) NOT NULL,
  `Description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8;

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
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `auth_user_extend_user_id_3f904c19_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_37d011e4146809f1_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_37d011e4146809f1_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_30233bef851f1278_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_7543a650240f224d_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_7543a650240f224d_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_46d89bc6ea1b4ae5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `authtoken_token`
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `autotesting_case_result`
-- ----------------------------
DROP TABLE IF EXISTS `autotesting_case_result`;
CREATE TABLE `autotesting_case_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateTime` datetime(6) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL,
  `TestCaseID` int(11) DEFAULT NULL,
  `TaskResultID` int(11) DEFAULT NULL,
  `StartTime` datetime(6) DEFAULT NULL,
  `EndTime` datetime(6) DEFAULT NULL,
  `Result` int(11) DEFAULT NULL,
  `Error` varchar(1000) DEFAULT NULL,
  `StackTrace` varchar(5000) DEFAULT NULL,
  `BugID` int(11) DEFAULT NULL,
  `FailCategoryID` int(11) DEFAULT NULL,
  `ReRunID` int(11) DEFAULT NULL,
  `FailType` int(11) DEFAULT NULL,
  `FailNote` varchar(255) DEFAULT NULL,
  `CaseVersion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=376297 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `autotesting_task_result`
-- ----------------------------
DROP TABLE IF EXISTS `autotesting_task_result`;
CREATE TABLE `autotesting_task_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateTime` datetime(6) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL,
  `TaskHistoryID` int(11) DEFAULT NULL,
  `Total` int(11) DEFAULT '0',
  `Pass` int(11) DEFAULT '0',
  `Fail` int(11) DEFAULT '0',
  `Aborted` int(11) DEFAULT '0',
  `TaskUUID` varchar(128) DEFAULT NULL,
  `ParentResultID` int(11) DEFAULT '0',
  `RuntimeEnv` int(11) DEFAULT '0',
  `AgentID` int(11) DEFAULT NULL,
  `MobileDeviceID` int(11) DEFAULT '0',
  `BuildMessage` varchar(255) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2237 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `autotesting_testcase`
-- ----------------------------
DROP TABLE IF EXISTS `autotesting_testcase`;
CREATE TABLE `autotesting_testcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `PackageName` varchar(255) COLLATE utf8_bin NOT NULL,
  `ClassName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CaseName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CaseType` int(11) NOT NULL,
  `ProjectID` int(11) NOT NULL,
  `ModuleID` int(11) DEFAULT NULL,
  `InterfaceID` int(11) DEFAULT NULL,
  `CaseTag` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `Desc` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9963 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `case_tag`
-- ----------------------------
DROP TABLE IF EXISTS `case_tag`;
CREATE TABLE `case_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CreateTime` datetime NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `TagName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TagDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ci_credentials`
-- ----------------------------
DROP TABLE IF EXISTS `ci_credentials`;
CREATE TABLE `ci_credentials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `SSHKey` varchar(1000) DEFAULT NULL,
  `Scope` int(11) NOT NULL,
  `CredentialType` int(11) NOT NULL,
  `Creator` int(11) NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `ci_deploy_service`
-- ----------------------------
DROP TABLE IF EXISTS `ci_deploy_service`;
CREATE TABLE `ci_deploy_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `ServiceName` varchar(100) NOT NULL,
  `DeployDir` varchar(500) NOT NULL,
  `AccessLog` varchar(1000) DEFAULT NULL,
  `ErrorLog` varchar(1000) DEFAULT NULL,
  `StartCommand` varchar(500) DEFAULT NULL,
  `StopCommand` varchar(500) DEFAULT NULL,
  `RestartCommand` varchar(500) DEFAULT NULL,
  `RelatedFiles` varchar(500) DEFAULT NULL,
  `DeployScripts` varchar(500) DEFAULT NULL,
  `AdvanceConfig` varchar(50) DEFAULT NULL,
  `Project` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `ci_server`
-- ----------------------------
DROP TABLE IF EXISTS `ci_server`;
CREATE TABLE `ci_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `ServerName` varchar(100) NOT NULL,
  `Host` varchar(100) NOT NULL,
  `RemoteDir` varchar(200) DEFAULT NULL,
  `Port` int(11) NOT NULL,
  `Scope` int(11) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Creator` int(11) NOT NULL,
  `Credential` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `ci_servicehost`
-- ----------------------------
DROP TABLE IF EXISTS `ci_servicehost`;
CREATE TABLE `ci_servicehost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EnvID` int(11) NOT NULL,
  `HostIP` varchar(20) NOT NULL,
  `HostService` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `ci_task`
-- ----------------------------
DROP TABLE IF EXISTS `ci_task`;
CREATE TABLE `ci_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `TaskName` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Project` int(11) NOT NULL,
  `TaskType` int(11) NOT NULL,
  `TaskConfig` varchar(50) NOT NULL,
  `DeployService` int(11) NOT NULL,
  `TaskHistory` int(11) NOT NULL,
  `Tags` varchar(50) DEFAULT NULL,
  `LastRunTime` datetime(6) DEFAULT NULL,
  `Schedule` varchar(30) DEFAULT NULL,
  `Creator` int(11) NOT NULL,
  `Description` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BuildVersion` int(11) NOT NULL,
  `HistoryCleanStrategy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `ci_task_history`
-- ----------------------------
DROP TABLE IF EXISTS `ci_task_history`;
CREATE TABLE `ci_task_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `CITaskID` int(11) NOT NULL,
  `StartTime` datetime(6) DEFAULT NULL,
  `EndTime` datetime(6) DEFAULT NULL,
  `Tags` varchar(50) DEFAULT NULL,
  `PackageID` varchar(500) DEFAULT NULL,
  `LogFileID` varchar(500) DEFAULT NULL,
  `ChangeLog` varchar(1000) DEFAULT NULL,
  `BuildStatus` int(11) NOT NULL,
  `BuildLogID` int(11) NOT NULL,
  `TaskQueueID` int(11) NOT NULL,
  `BuildMessage` varchar(255) DEFAULT NULL,
  `BuildErrorCode` int(11) DEFAULT '0',
  `CodeVersion` varchar(255) DEFAULT NULL,
  `StartedBy` int(11) NOT NULL,
  `BuildVersion` int(11) NOT NULL,
  `ProjectVersion` int(11) NOT NULL,
  `PackageInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BuildParameterID` varchar(30) DEFAULT NULL,
  `AgentID` int(11) DEFAULT '0',
  `TaskUUID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4083 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `ci_task_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `ci_task_plugin`;
CREATE TABLE `ci_task_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateTime` datetime NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `PluginName` varchar(50) NOT NULL,
  `PluginSection` varchar(50) NOT NULL,
  `PluginLabelColor` varchar(10) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `TaskType` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `device_management`
-- ----------------------------
DROP TABLE IF EXISTS `device_management`;
CREATE TABLE `device_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DeviceNumber` varchar(10) NOT NULL,
  `DeviceName` varchar(100) NOT NULL,
  `DeviceOS` int(11) NOT NULL,
  `DeviceOSVersion` int(11) NOT NULL,
  `DeviceScreenSize` int(11) NOT NULL,
  `DeviceStatus` int(11) NOT NULL,
  `DeviceType` int(11) NOT NULL,
  `DeviceSerialNum` varchar(100) DEFAULT NULL,
  `DeviceAvatar` int(11) NOT NULL,
  `DeviceBorrower` int(11) NOT NULL,
  `DeviceBorrorwTime` datetime DEFAULT NULL,
  `DeviceReturnTime` datetime DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `device_management_history`
-- ----------------------------
DROP TABLE IF EXISTS `device_management_history`;
CREATE TABLE `device_management_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DeviceID` int(11) NOT NULL,
  `DeviceBorrower` int(11) NOT NULL,
  `DeviceBorrorwTime` datetime NOT NULL,
  `DeviceReturnTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;

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
  KEY `dicdata_DicType_id_74ecac2420247de7_fk_dictype_id` (`DicType_id`),
  CONSTRAINT `dicdata_DicType_id_74ecac2420247de7_fk_dictype_id` FOREIGN KEY (`DicType_id`) REFERENCES `dictype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dictype`
-- ----------------------------
DROP TABLE IF EXISTS `dictype`;
CREATE TABLE `dictype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DicTypeName` varchar(50) NOT NULL,
  `DicTypeIsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_content_type_id_fe83c5c1338e4b7_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_406fefeb411c6376_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_406fefeb411c6376_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_content_type_id_fe83c5c1338e4b7_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_44ce737007467da7_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `error_message`
-- ----------------------------
DROP TABLE IF EXISTS `error_message`;
CREATE TABLE `error_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorType` int(11) NOT NULL,
  `ErrorCode` int(11) NOT NULL,
  `ErrorName` varchar(25) DEFAULT NULL,
  `ErrorMessage` varchar(100) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `file_info`
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `FileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FileUUID` varchar(50) DEFAULT NULL,
  `FilePath` varchar(500) DEFAULT NULL,
  `FileType` int(11) NOT NULL,
  `FileFolder` int(11) NOT NULL,
  `FileSuffixes` varchar(10) DEFAULT NULL,
  `FileCreator` int(11) NOT NULL,
  `FileSize` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5936 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `home_webapps`
-- ----------------------------
DROP TABLE IF EXISTS `home_webapps`;
CREATE TABLE `home_webapps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `app_title` varchar(50) NOT NULL,
  `app_key` varchar(10) NOT NULL,
  `app_url` varchar(500) NOT NULL,
  `app_avatar` varchar(255) DEFAULT NULL,
  `app_desc` varchar(500) DEFAULT NULL,
  `app_visable_level` int(11) NOT NULL,
  `app_creator` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `issue_activity`
-- ----------------------------
DROP TABLE IF EXISTS `issue_activity`;
CREATE TABLE `issue_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `Issue` int(11) NOT NULL,
  `OldValue` varchar(2500) COLLATE utf8_bin DEFAULT NULL,
  `NewValue` varchar(2500) COLLATE utf8_bin DEFAULT NULL,
  `FieldName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `FieldDesc` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ActionType` int(11) NOT NULL,
  `Creator` int(11) NOT NULL,
  `Message` varchar(2500) COLLATE utf8_bin DEFAULT NULL,
  `ActionFlag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `issue_filter`
-- ----------------------------
DROP TABLE IF EXISTS `issue_filter`;
CREATE TABLE `issue_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `Project` int(11) NOT NULL,
  `Creator` int(11) NOT NULL,
  `Scope` int(11) NOT NULL,
  `FilterString` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `FilterUIConfig` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `FilterName` varchar(50) COLLATE utf8_bin NOT NULL,
  `FilterCacheString` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `logcat_logger`
-- ----------------------------
DROP TABLE IF EXISTS `logcat_logger`;
CREATE TABLE `logcat_logger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `deviceName` varchar(255) DEFAULT NULL,
  `regTime` datetime(6) NOT NULL,
  `deviceId` varchar(100) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `logFiles` varchar(50) DEFAULT NULL,
  `appId` int(11) DEFAULT NULL,
  `userAgent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `PTitle` varchar(100) NOT NULL,
  `PKey` varchar(10) NOT NULL,
  `PDescription` varchar(255) DEFAULT NULL,
  `PVisiableLevel` int(11) NOT NULL,
  `LabelColor` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `PBTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PBKey` varchar(10) NOT NULL,
  `PBDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PBVisiableLevel` int(11) NOT NULL,
  `PBPlatform` int(11) NOT NULL,
  `PBHttpUrl` varchar(255) DEFAULT NULL,
  `PBLead` int(11) NOT NULL,
  `PBAvatar` varchar(255) DEFAULT NULL,
  `Product` int(11) NOT NULL,
  `PBCreator` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `project_archive`
-- ----------------------------
DROP TABLE IF EXISTS `project_archive`;
CREATE TABLE `project_archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `VersionID` int(11) DEFAULT NULL,
  `ProjectID` int(11) NOT NULL,
  `HistoryID` int(11) NOT NULL,
  `Archives` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Name` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `project_buildhistory`
-- ----------------------------
DROP TABLE IF EXISTS `project_buildhistory`;
CREATE TABLE `project_buildhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `BHCommitID` int(11) NOT NULL,
  `BHVersion` varchar(50) NOT NULL,
  `BHCodeVersion` varchar(255) NOT NULL,
  `BHCodeURL` varchar(2000) NOT NULL,
  `BHPackageAddress` varchar(500) NOT NULL,
  `BHChangeLog` varchar(1000) NOT NULL,
  `BHBuilStatus` tinyint(1) NOT NULL,
  `BHBuildUrl` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `project_code_url`
-- ----------------------------
DROP TABLE IF EXISTS `project_code_url`;
CREATE TABLE `project_code_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `ApplicationID` int(11) NOT NULL,
  `CodeRepertory` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Branch` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `project_commit_fortesting`
-- ----------------------------
DROP TABLE IF EXISTS `project_commit_fortesting`;
CREATE TABLE `project_commit_fortesting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `CFTProjectID` int(11) NOT NULL,
  `CFTVersionID` int(11) NOT NULL,
  `CFTCommitor` int(11) NOT NULL,
  `CFTNewFeatur` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CFTBugFix` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CFTTestingAdvice` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CFTCommitTime` datetime(6) DEFAULT NULL,
  `CFTStatus` int(11) NOT NULL,
  `CFTBuildID` int(11) DEFAULT NULL,
  `ProjectModuleID` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `project_issue`
-- ----------------------------
DROP TABLE IF EXISTS `project_issue`;
CREATE TABLE `project_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `Project` int(11) NOT NULL,
  `Version` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Processor` int(11) NOT NULL,
  `Creator` int(11) NOT NULL,
  `Severity` int(11) NOT NULL,
  `Solution` int(11) NOT NULL,
  `Title` varchar(500) COLLATE utf8_bin NOT NULL,
  `Desc` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `Module` int(11) NOT NULL,
  `ProjectPhase` int(11) NOT NULL,
  `IssueCategory` int(11) NOT NULL,
  `DeviceOS` int(11) DEFAULT NULL,
  `OSVersion` int(11) DEFAULT NULL,
  `Attachments` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `ResolvedTime` datetime(6) DEFAULT NULL,
  `ClosedTime` datetime(6) DEFAULT NULL,
  `ReopenCounts` int(11) DEFAULT NULL,
  `UpdateTime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `project_Task`
-- ----------------------------
DROP TABLE IF EXISTS `project_member`;
CREATE TABLE `project_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `PMProjectID` int(11) NOT NULL,
  `PMRoleID` int(11) NOT NULL,
  `PMRoleType` int(11) NOT NULL,
  `PMMember` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=604 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `project_module`
-- ----------------------------
DROP TABLE IF EXISTS `project_module`;
CREATE TABLE `project_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CreationTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsActive` bit(1) NOT NULL,
  `ProjectID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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
  `TagType` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `project_task`
-- ----------------------------
DROP TABLE IF EXISTS `project_task`;
CREATE TABLE `project_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `TProjectID` int(11) NOT NULL,
  `TTitle` varchar(255) NOT NULL,
  `TDeadLine` date DEFAULT NULL,
  `TStartDate` date DEFAULT NULL,
  `TFinishedDate` date DEFAULT NULL,
  `TWorkHours` int(11) NOT NULL,
  `TOwner` varchar(50) NOT NULL,
  `TCreator` int(11) NOT NULL,
  `TProgress` int(11) NOT NULL,
  `TDescription` varchar(1000) DEFAULT NULL,
  `TTags` varchar(50) DEFAULT NULL,
  `TStatus` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `project_test_application`
-- ----------------------------
DROP TABLE IF EXISTS `project_test_application`;
CREATE TABLE `project_test_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `ProjectID` int(11) NOT NULL,
  `VersionID` int(11) NOT NULL,
  `Commitor` int(11) NOT NULL,
  `TestingFeature` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TestingAdvice` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CommitTime` datetime(6) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `EmailNotificationStatus` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0,0,0,0,0' COMMENT '邮件发送状态',
  `ProjectModuleID` int(11) DEFAULT '0',
  `ProjectCode` int(11) DEFAULT '0',
  `Attachment` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Testers` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `ExpectCommitDate` datetime(6) DEFAULT NULL,
  `TestingDeadLineDate` datetime(6) DEFAULT NULL,
  `TestingFinishedDate` datetime(6) DEFAULT NULL,
  `Creator` int(11) NOT NULL DEFAULT '0',
  `TestingStartDate` datetime(6) DEFAULT NULL,
  `Topic` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `project_version`
-- ----------------------------
DROP TABLE IF EXISTS `project_version`;
CREATE TABLE `project_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `VProjectID` int(11) NOT NULL,
  `VVersion` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VStartDate` date DEFAULT NULL,
  `VReleaseDate` date DEFAULT NULL,
  `VDescription` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `project_webhook`
-- ----------------------------
DROP TABLE IF EXISTS `project_webhook`;
CREATE TABLE `project_webhook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreationTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `WHProjectID` int(11) NOT NULL,
  `WHURL` varchar(500) NOT NULL,
  `WHParameters` varchar(500) DEFAULT NULL,
  `WHLabel` varchar(50) DEFAULT NULL,
  `WHIsDefault` tinyint(1) NOT NULL,
  `WHCatagory` int(11) NOT NULL,
  `WHCreator` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `task_queue`
-- ----------------------------
DROP TABLE IF EXISTS `task_queue`;
CREATE TABLE `task_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TaskID` int(11) NOT NULL,
  `TaskType` int(1) DEFAULT NULL,
  `Status` int(11) NOT NULL,
  `CaseList` varchar(10000) DEFAULT NULL,
  `EnqueueTime` datetime(6) NOT NULL,
  `RerunReportID` int(11) DEFAULT NULL,
  `RuntimeEnv` int(11) DEFAULT NULL,
  `TaskUUID` varchar(128) NOT NULL,
  `AgentID` int(11) DEFAULT NULL,
  `StartTime` datetime(6) DEFAULT NULL,
  `TaskEndTime` datetime(6) DEFAULT NULL,
  `FromName` varchar(100) DEFAULT NULL,
  `FromIP` varchar(20) DEFAULT NULL,
  `HasChild` tinyint(1) DEFAULT NULL,
  `Command` int(11) NOT NULL,
  `MobileDeviceId` int(11) DEFAULT NULL,
  `IsLocked` tinyint(1) unsigned zerofill NOT NULL,
  `LockTime` datetime(6) DEFAULT NULL,
  `DistributeTimes` int(11) DEFAULT NULL,
  `ErrorMsg` varchar(255) DEFAULT NULL,
  `Priority` int(1) NOT NULL,
  `BuildParameterID` varchar(30) DEFAULT NULL,
  `ParentID` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1585 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `unittest_case_result`
-- ----------------------------
DROP TABLE IF EXISTS `unittest_case_result`;
CREATE TABLE `unittest_case_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreateTime` datetime(6) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `TestCaseName` varchar(100) DEFAULT NULL,
  `TaskResultID` int(11) NOT NULL,
  `StartTime` datetime(6) DEFAULT NULL,
  `EndTime` datetime(6) DEFAULT NULL,
  `Result` int(11) NOT NULL,
  `Error` varchar(1000) DEFAULT NULL,
  `StackTrace` varchar(5000) DEFAULT NULL,
  `BugID` int(11) NOT NULL,
  `FailCategoryID` int(11) NOT NULL,
  `ReRunID` int(11) NOT NULL,
  `FailType` int(11) NOT NULL,
  `FailNote` varchar(255) DEFAULT NULL,
  `CaseVersion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `user_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `user_action_log`;
CREATE TABLE `user_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ActionTime` datetime(6) NOT NULL,
  `User` int(11) NOT NULL,
  `ContentType` int(11) NOT NULL,
  `ObjectID` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ObjectRepr` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ActionFlag` smallint(5) unsigned NOT NULL,
  `ChangeMessage` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ActionType` int(11) NOT NULL,
  `ProjectID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7270 DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
