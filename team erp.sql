/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 10.3.12-MariaDB : Database - teamerp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `AccountID` int(10) NOT NULL AUTO_INCREMENT,
  `AccountCode` varchar(30) DEFAULT NULL,
  `AccountTitle` varchar(30) DEFAULT NULL,
  `AccountGroupID` int(10) DEFAULT NULL,
  `AccountTypeID` int(10) DEFAULT NULL,
  `AccountsSubTypeID` int(10) DEFAULT NULL,
  `AccountOwnerID` int(10) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  UNIQUE KEY `PK_Account` (`AccountID`),
  KEY `IX_Relationship130` (`AccountGroupID`),
  KEY `IX_Relationship131` (`AccountTypeID`),
  KEY `IX_Relationship132` (`AccountsSubTypeID`),
  CONSTRAINT `Relationship_r130` FOREIGN KEY (`AccountGroupID`) REFERENCES `accountgroup` (`AccountGroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_r131` FOREIGN KEY (`AccountTypeID`) REFERENCES `accounttype` (`AccountTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_r132` FOREIGN KEY (`AccountsSubTypeID`) REFERENCES `accountssubtype` (`AccountsSubTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`AccountID`,`AccountCode`,`AccountTitle`,`AccountGroupID`,`AccountTypeID`,`AccountsSubTypeID`,`AccountOwnerID`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Acct-22002','Subsidiary Account',1,1,1,1,0,'2019-12-06 11:39:53.337000',NULL,NULL);

/*Table structure for table `accountgroup` */

DROP TABLE IF EXISTS `accountgroup`;

CREATE TABLE `accountgroup` (
  `AccountGroupID` int(10) NOT NULL AUTO_INCREMENT,
  `AccountGroup` varchar(50) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`AccountGroupID`),
  UNIQUE KEY `PK_AccountGroup` (`AccountGroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `accountgroup` */

insert  into `accountgroup`(`AccountGroupID`,`AccountGroup`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Account Group 1',0,'2019-12-06 11:21:06.490000',NULL,NULL);

/*Table structure for table `accountssubtype` */

DROP TABLE IF EXISTS `accountssubtype`;

CREATE TABLE `accountssubtype` (
  `AccountsSubTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `AccountsSubType` varchar(50) DEFAULT NULL,
  `AccountTypeID` int(10) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`AccountsSubTypeID`),
  UNIQUE KEY `PK_AccountsSubType` (`AccountsSubTypeID`),
  KEY `IX_Relationship29` (`AccountTypeID`),
  CONSTRAINT `Relationship_r29` FOREIGN KEY (`AccountTypeID`) REFERENCES `accounttype` (`AccountTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `accountssubtype` */

insert  into `accountssubtype`(`AccountsSubTypeID`,`AccountsSubType`,`AccountTypeID`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Account SubType 1',1,0,'2019-12-06 11:21:53.910000',NULL,NULL);

/*Table structure for table `accounttype` */

DROP TABLE IF EXISTS `accounttype`;

CREATE TABLE `accounttype` (
  `AccountTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `AccountType` varchar(50) DEFAULT NULL,
  `AccountGroupID` int(10) DEFAULT NULL,
  `GLCode` varchar(30) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`AccountTypeID`),
  UNIQUE KEY `PK_AccountType` (`AccountTypeID`),
  KEY `IX_Relationship30` (`AccountGroupID`),
  CONSTRAINT `Relationship_r30` FOREIGN KEY (`AccountGroupID`) REFERENCES `accountgroup` (`AccountGroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `accounttype` */

insert  into `accounttype`(`AccountTypeID`,`AccountType`,`AccountGroupID`,`GLCode`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Account Type 1',1,'GL Code 1',0,'2019-12-06 11:21:29.673000',NULL,NULL);

/*Table structure for table `action_details` */

DROP TABLE IF EXISTS `action_details`;

CREATE TABLE `action_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) DEFAULT NULL,
  `employee_type_id` int(11) DEFAULT NULL,
  `confirmtypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_Relationship1` (`action_id`),
  CONSTRAINT `Relationship1` FOREIGN KEY (`action_id`) REFERENCES `actions` (`action_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `action_details` */

/*Table structure for table `actions` */

DROP TABLE IF EXISTS `actions`;

CREATE TABLE `actions` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(100) DEFAULT NULL,
  `actiontype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `actions` */

/*Table structure for table `actiontype_details` */

DROP TABLE IF EXISTS `actiontype_details`;

CREATE TABLE `actiontype_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actiontype_id` int(11) DEFAULT NULL,
  `employee_type_id` int(11) DEFAULT NULL,
  `confirmtypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_Relationship333` (`actiontype_id`),
  CONSTRAINT `Relationship333` FOREIGN KEY (`actiontype_id`) REFERENCES `actiontypes` (`actiontype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `actiontype_details` */

/*Table structure for table `actiontypes` */

DROP TABLE IF EXISTS `actiontypes`;

CREATE TABLE `actiontypes` (
  `actiontype_id` int(11) NOT NULL AUTO_INCREMENT,
  `actiontype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`actiontype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `actiontypes` */

/*Table structure for table `age_groups` */

DROP TABLE IF EXISTS `age_groups`;

CREATE TABLE `age_groups` (
  `age_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `age_group` varchar(300) DEFAULT NULL,
  `lower_limit` float DEFAULT NULL,
  `upper_limit` float DEFAULT NULL,
  PRIMARY KEY (`age_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `age_groups` */

insert  into `age_groups`(`age_group_id`,`age_group`,`lower_limit`,`upper_limit`) values 
(0,'0-14',0,14.99),
(1,'15-19 ',15,19.99),
(2,'20-24',20,24.99),
(3,'25-29',25,29.99),
(4,'30-34',30,34.99),
(5,'35-39',35,39.99),
(6,'40-44',40,44.99),
(7,'45-49',45,49.99),
(8,'50-54',50,54.99),
(9,'55-59',55,59.99),
(10,'60-64',60,64.99),
(11,'65+',65,200);

/*Table structure for table `angularsettings` */

DROP TABLE IF EXISTS `angularsettings`;

CREATE TABLE `angularsettings` (
  `moduleName` varchar(300) DEFAULT NULL,
  `tableName` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `angularsettings` */

/*Table structure for table `applicantcv` */

DROP TABLE IF EXISTS `applicantcv`;

CREATE TABLE `applicantcv` (
  `ApplicantCVID` int(11) NOT NULL AUTO_INCREMENT,
  `CV` varchar(100) NOT NULL,
  `DateCreated` date NOT NULL,
  `ApplicantID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ApplicantCVID`),
  KEY `IX_Relationship1822` (`ApplicantID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `applicantcv` */

/*Table structure for table `applicants` */

DROP TABLE IF EXISTS `applicants`;

CREATE TABLE `applicants` (
  `ApplicantID` int(11) NOT NULL AUTO_INCREMENT,
  `FirsName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Othername` varchar(100) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` varchar(1000) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `About` text DEFAULT NULL,
  `Photo` text DEFAULT NULL,
  `ExperienceLevelID` int(11) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `GenderID` int(11) DEFAULT NULL,
  `NationalityID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  `ProgrammeTypeID` int(11) DEFAULT NULL,
  `YearsofExperienceID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ApplicantID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `IX_Relationship1` (`ExperienceLevelID`),
  KEY `IX_Relationship222` (`GenderID`),
  KEY `IX_Relationship322` (`NationalityID`),
  CONSTRAINT `applicants_ibfk_1` FOREIGN KEY (`ExperienceLevelID`) REFERENCES `experiencelevel` (`ExperienceLevelID`),
  CONSTRAINT `applicants_ibfk_2` FOREIGN KEY (`GenderID`) REFERENCES `gender` (`GenderID`),
  CONSTRAINT `applicants_ibfk_3` FOREIGN KEY (`NationalityID`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `applicants` */

insert  into `applicants`(`ApplicantID`,`FirsName`,`LastName`,`Othername`,`Email`,`Phone`,`Address`,`DOB`,`About`,`Photo`,`ExperienceLevelID`,`Password`,`GenderID`,`NationalityID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`,`ProgrammeTypeID`,`YearsofExperienceID`) values 
(1,'Keston','TImson','Kay','kestont@gmail.com','08148117066','Address','2020-06-26','About','photo',1,'pass',5,151,NULL,'2020-06-26 11:42:53',NULL,'2020-06-26 11:42:53',1,1),
(2,'Keston','Timson',NULL,'jamessmith@gmail.com','08148117066','Address','2020-06-30','About',NULL,2,NULL,5,NULL,NULL,'2020-06-30 13:59:42',NULL,'2020-06-30 13:59:42',1,2),
(3,'Keston','Timson','Kayson','kestontim@gmail.com','08148117066','Address','2020-06-30','About',NULL,2,'1a1dc91c907325c69271ddf0c944bc72',5,NULL,NULL,'2020-06-30 14:29:15',NULL,'2020-06-30 14:29:15',2,2),
(4,'Joseph','Onyilo','Joe','joe@gmail.com','08148117066','Address','2020-07-02','About',NULL,1,'1a1dc91c907325c69271ddf0c944bc72',5,NULL,NULL,'2020-07-02 12:56:41',NULL,'2020-07-02 12:56:41',1,1);

/*Table structure for table `appraisal_approval` */

DROP TABLE IF EXISTS `appraisal_approval`;

CREATE TABLE `appraisal_approval` (
  `AppraisalApproveID` int(11) NOT NULL AUTO_INCREMENT,
  `approve_id` int(11) DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `time_approve` datetime DEFAULT NULL,
  `approve_by` int(11) DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `appraisal_id` int(11) DEFAULT NULL,
  `nextapprovingofficer` int(11) DEFAULT NULL,
  PRIMARY KEY (`AppraisalApproveID`),
  KEY `appraisal_id` (`appraisal_id`),
  CONSTRAINT `appraisal_approval_ibfk_1` FOREIGN KEY (`appraisal_id`) REFERENCES `appraisalheader` (`appraisal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `appraisal_approval` */

/*Table structure for table `appraisal_dynamicdatamapping` */

DROP TABLE IF EXISTS `appraisal_dynamicdatamapping`;

CREATE TABLE `appraisal_dynamicdatamapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DataId` int(11) DEFAULT NULL,
  `SystemdetailsID` int(11) DEFAULT NULL,
  `systemsID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `appraisal_dynamicdatamapping` */

/*Table structure for table `appraisal_dynamicsource` */

DROP TABLE IF EXISTS `appraisal_dynamicsource`;

CREATE TABLE `appraisal_dynamicsource` (
  `DataId` int(11) NOT NULL AUTO_INCREMENT,
  `DataName` varchar(300) DEFAULT NULL,
  `DataSource` varchar(4000) DEFAULT NULL,
  `ActiveID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DataId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `appraisal_dynamicsource` */

/*Table structure for table `appraisal_recommenddetails` */

DROP TABLE IF EXISTS `appraisal_recommenddetails`;

CREATE TABLE `appraisal_recommenddetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisal_id` int(11) DEFAULT NULL,
  `optionID` int(11) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_Relationship1999` (`appraisal_id`),
  CONSTRAINT `Relationship1999` FOREIGN KEY (`appraisal_id`) REFERENCES `appraisalheader` (`appraisal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `appraisal_recommenddetails` */

/*Table structure for table `appraisal_systemcategory` */

DROP TABLE IF EXISTS `appraisal_systemcategory`;

CREATE TABLE `appraisal_systemcategory` (
  `systemcategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `systemcategory` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`systemcategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `appraisal_systemcategory` */

/*Table structure for table `appraisal_systemdetails` */

DROP TABLE IF EXISTS `appraisal_systemdetails`;

CREATE TABLE `appraisal_systemdetails` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `maxweight` float DEFAULT NULL,
  `work_id` int(11) DEFAULT NULL,
  `IDColumn` int(11) DEFAULT NULL,
  `systemcategoryID` int(11) DEFAULT NULL,
  `system_typeID` int(11) DEFAULT NULL,
  `systemsID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_Relationship1333` (`system_typeID`),
  KEY `IX_Relationship1433` (`systemcategoryID`),
  KEY `IX_Relationship1533` (`systemsID`),
  CONSTRAINT `Relationship1333` FOREIGN KEY (`system_typeID`) REFERENCES `appraisal_systemtypes` (`system_typeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship1433` FOREIGN KEY (`systemcategoryID`) REFERENCES `appraisal_systemcategory` (`systemcategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship1533` FOREIGN KEY (`systemsID`) REFERENCES `appraisal_systems` (`systemsID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `appraisal_systemdetails` */

/*Table structure for table `appraisal_systems` */

DROP TABLE IF EXISTS `appraisal_systems`;

CREATE TABLE `appraisal_systems` (
  `systemsID` int(11) NOT NULL AUTO_INCREMENT,
  `systemname` varchar(50) DEFAULT NULL,
  `measurements` varchar(4000) DEFAULT NULL,
  `activeID` int(11) DEFAULT NULL,
  `kpitype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`systemsID`),
  KEY `IX_Relationship1666` (`kpitype_id`),
  CONSTRAINT `Relationship1666` FOREIGN KEY (`kpitype_id`) REFERENCES `kpi_type` (`kpitype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `appraisal_systems` */

/*Table structure for table `appraisal_systemtypes` */

DROP TABLE IF EXISTS `appraisal_systemtypes`;

CREATE TABLE `appraisal_systemtypes` (
  `system_typeID` int(11) NOT NULL AUTO_INCREMENT,
  `systems_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`system_typeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `appraisal_systemtypes` */

/*Table structure for table `appraisal_trainings` */

DROP TABLE IF EXISTS `appraisal_trainings`;

CREATE TABLE `appraisal_trainings` (
  `training_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `goal` varchar(1000) DEFAULT NULL,
  `measureOfSuccess` varchar(2000) DEFAULT NULL,
  `hod_comment` varchar(2000) DEFAULT NULL,
  `appraisal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`training_id`),
  KEY `IX_Relationship20` (`appraisal_id`),
  CONSTRAINT `Relationship20` FOREIGN KEY (`appraisal_id`) REFERENCES `appraisalheader` (`appraisal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `appraisal_trainings` */

/*Table structure for table `appraisalapproval` */

DROP TABLE IF EXISTS `appraisalapproval`;

CREATE TABLE `appraisalapproval` (
  `AppraisalApprovalID` int(11) NOT NULL AUTO_INCREMENT,
  `AppraisalID` int(11) DEFAULT NULL,
  `ApprovedBy` varchar(50) DEFAULT NULL,
  `NextApprovalOfficerID` varchar(50) DEFAULT NULL,
  `Comment` longtext DEFAULT NULL,
  `ProcessModuleID` int(11) DEFAULT NULL,
  `ApprovalInstancesID` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`AppraisalApprovalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `appraisalapproval` */

/*Table structure for table `appraisalchangeapprovalstage` */

DROP TABLE IF EXISTS `appraisalchangeapprovalstage`;

CREATE TABLE `appraisalchangeapprovalstage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisal_id` int(11) DEFAULT NULL,
  `dateChange` datetime DEFAULT current_timestamp(),
  `oldSupervisor` int(11) DEFAULT NULL,
  `newSupervisor` int(11) DEFAULT NULL,
  `ApprovalstageId` int(11) DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `movedToHR` int(11) DEFAULT NULL,
  `AppraisalApproveId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `appraisalchangeapprovalstage` */

/*Table structure for table `appraisaldetails` */

DROP TABLE IF EXISTS `appraisaldetails`;

CREATE TABLE `appraisaldetails` (
  `appraisaldetail_id` int(11) NOT NULL AUTO_INCREMENT,
  `appraisal_id` int(11) NOT NULL,
  `kpi_id` int(11) NOT NULL,
  `comments` varchar(600) DEFAULT NULL,
  `kpitype_id` int(11) DEFAULT NULL,
  `score` float DEFAULT 0,
  `selfscore` int(11) DEFAULT NULL,
  `appraiser_comments` varchar(3000) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `last_modified_by` int(11) DEFAULT NULL,
  `is_systemgenerated` int(11) DEFAULT 0,
  PRIMARY KEY (`appraisaldetail_id`),
  KEY `IX_Relationship1822` (`appraisal_id`),
  KEY `IX_Relationship2122` (`kpi_id`),
  CONSTRAINT `Relationship1822` FOREIGN KEY (`appraisal_id`) REFERENCES `appraisalheader` (`appraisal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship2122` FOREIGN KEY (`kpi_id`) REFERENCES `kpi` (`kpi_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `appraisaldetails` */

/*Table structure for table `appraisalheader` */

DROP TABLE IF EXISTS `appraisalheader`;

CREATE TABLE `appraisalheader` (
  `appraisal_id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) NOT NULL,
  `appraisal_date` datetime NOT NULL DEFAULT current_timestamp(),
  `depunit_id` int(11) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `appraisee_id` int(11) NOT NULL,
  `appraiser_id` int(11) DEFAULT 0,
  `HOD_comment` varchar(1500) DEFAULT NULL,
  `appraisee_comment` varchar(1500) DEFAULT NULL,
  `committee_comment` varchar(1500) DEFAULT NULL,
  `TransID` int(11) NOT NULL DEFAULT 1,
  `department_id` int(11) DEFAULT NULL,
  `durationmonths` int(11) DEFAULT NULL,
  `noDirectlySupervised` int(11) DEFAULT NULL,
  `noindirectlySupervised` int(11) DEFAULT NULL,
  `brief_description` varchar(2000) DEFAULT NULL,
  `sup_designation_id` int(11) DEFAULT NULL,
  `date_lastPromotion` datetime DEFAULT NULL,
  `support_recieved` varchar(1500) DEFAULT NULL,
  `comment_peers` varchar(1000) DEFAULT NULL,
  `comment_peers_alt` varchar(1000) DEFAULT NULL,
  `comment_sup` varchar(1500) DEFAULT NULL,
  `comment_sup_alt` varchar(1000) DEFAULT NULL,
  `comment_hod` varchar(1500) DEFAULT NULL,
  `comment_hod_alt` varchar(1000) DEFAULT NULL,
  `comment_subordinate` varchar(1500) DEFAULT NULL,
  `comment_subordinate_alt` varchar(1000) DEFAULT NULL,
  `lession` varchar(1000) DEFAULT NULL,
  `appraiser_comment_strength` varchar(1500) DEFAULT NULL,
  `appraiser_comment_improve` varchar(1500) DEFAULT NULL,
  `appraiser_comment_dev` varchar(1500) DEFAULT NULL,
  `external_training` int(11) DEFAULT NULL,
  `approvalstage_id` int(11) DEFAULT NULL,
  `exceptflagID` int(11) DEFAULT NULL,
  `supervisortypeID` int(11) DEFAULT NULL,
  `employee_type_id` int(11) DEFAULT NULL,
  `confirmtypeID` int(11) DEFAULT NULL,
  `work_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `lastpromotiondate` datetime DEFAULT NULL,
  `lenthofstay` int(11) DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`appraisal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `appraisalheader` */

/*Table structure for table `approval` */

DROP TABLE IF EXISTS `approval`;

CREATE TABLE `approval` (
  `ApprovalID` int(11) NOT NULL AUTO_INCREMENT,
  `ApprovedBy` int(11) DEFAULT NULL,
  `Comment` longtext DEFAULT NULL,
  `RequestID` int(11) DEFAULT NULL,
  `NextApprovalID` int(11) DEFAULT NULL,
  `ApprovalInstancesID` int(11) DEFAULT NULL,
  `ApprovalProcessModuleID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ApprovalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `approval` */

/*Table structure for table `approvalcreditscoring` */

DROP TABLE IF EXISTS `approvalcreditscoring`;

CREATE TABLE `approvalcreditscoring` (
  `ApprovalCreditScoringlD` int(11) NOT NULL AUTO_INCREMENT,
  `ApprovedBy` int(11) DEFAULT NULL,
  `Comment` longtext DEFAULT NULL,
  `RequestID` int(11) DEFAULT NULL,
  `NextApprovalID` int(11) DEFAULT NULL,
  `ApprovalInstancesID` int(11) DEFAULT NULL,
  `ApprovalProcessModuleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ApprovalCreditScoringlD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `approvalcreditscoring` */

/*Table structure for table `approvalinstances` */

DROP TABLE IF EXISTS `approvalinstances`;

CREATE TABLE `approvalinstances` (
  `ApprovalInstancesID` int(11) NOT NULL AUTO_INCREMENT,
  `ApprovalStagesID` int(11) DEFAULT NULL,
  `ApprovalTypeID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ApprovalInstancesID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `approvalinstances` */

insert  into `approvalinstances`(`ApprovalInstancesID`,`ApprovalStagesID`,`ApprovalTypeID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,1,1,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(2,1,2,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(3,1,3,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(4,2,1,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(5,2,2,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(6,2,3,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(7,3,1,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(8,3,2,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(9,3,3,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(10,4,1,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(11,4,2,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(12,4,3,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(13,5,1,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(14,5,2,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(15,5,3,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(16,6,1,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(17,6,2,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(18,6,3,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(19,7,1,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(20,7,2,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(21,7,3,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(22,8,1,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(23,8,2,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(24,8,3,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(25,9,1,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(26,9,2,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(27,9,3,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(28,10,1,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(29,10,2,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(30,10,3,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(31,11,1,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(32,11,2,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(33,11,3,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(34,12,1,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(35,12,2,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(36,12,3,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(37,13,1,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(38,13,2,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(39,13,3,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(40,14,1,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(41,14,2,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(42,14,3,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(43,15,1,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(44,15,2,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14'),
(45,15,3,NULL,'2020-06-23 09:31:14',NULL,'2020-06-23 09:31:14');

/*Table structure for table `approvallimit` */

DROP TABLE IF EXISTS `approvallimit`;

CREATE TABLE `approvallimit` (
  `ApprovalLimitID` int(11) NOT NULL AUTO_INCREMENT,
  `Amount` decimal(15,2) DEFAULT NULL,
  `DesignationID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ApprovalLimitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `approvallimit` */

/*Table structure for table `approvalloan` */

DROP TABLE IF EXISTS `approvalloan`;

CREATE TABLE `approvalloan` (
  `ApprovalLoanlD` int(11) NOT NULL AUTO_INCREMENT,
  `ApprovedBy` int(11) DEFAULT NULL,
  `Comment` longtext DEFAULT NULL,
  `RequestID` int(11) DEFAULT NULL,
  `NextApprovalID` int(11) DEFAULT NULL,
  `ApprovalInstancesID` int(11) DEFAULT NULL,
  `ApprovalProcessModuleID` int(11) DEFAULT NULL,
  `ApprovalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ApprovalLoanlD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `approvalloan` */

/*Table structure for table `approvalprocessflow` */

DROP TABLE IF EXISTS `approvalprocessflow`;

CREATE TABLE `approvalprocessflow` (
  `ApprovalProcessFlowID` int(11) NOT NULL AUTO_INCREMENT,
  `SequenceNo` int(11) DEFAULT NULL,
  `ApprovalProcessModuleID` int(11) DEFAULT NULL,
  `ApprovalStagesID` int(11) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ApprovalProcessFlowID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `approvalprocessflow` */

insert  into `approvalprocessflow`(`ApprovalProcessFlowID`,`SequenceNo`,`ApprovalProcessModuleID`,`ApprovalStagesID`,`StatusID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,2,1,1,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(2,11,1,10,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(3,6,1,9,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(4,7,1,8,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(5,5,1,7,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(6,4,1,6,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(7,10,1,5,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(8,9,1,4,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(9,8,1,3,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(10,3,1,2,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(11,1,1,15,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(12,12,1,11,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(13,13,1,14,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(14,2,2,1,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(15,11,2,10,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(16,6,2,9,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(17,7,2,8,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(18,5,2,7,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(19,4,2,6,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(20,10,2,5,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(21,9,2,4,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(22,8,2,3,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(23,3,2,2,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(24,1,2,15,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(25,12,2,11,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20'),
(26,13,2,14,1,NULL,'2020-06-23 09:31:20',NULL,'2020-06-23 09:31:20');

/*Table structure for table `approvalprocessmodule` */

DROP TABLE IF EXISTS `approvalprocessmodule`;

CREATE TABLE `approvalprocessmodule` (
  `ApprovalProcessModuleID` int(11) NOT NULL AUTO_INCREMENT,
  `ApprovalProcessModule` longtext DEFAULT NULL,
  `MaxApprovalCount` int(11) DEFAULT 100,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ApprovalProcessModuleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `approvalprocessmodule` */

insert  into `approvalprocessmodule`(`ApprovalProcessModuleID`,`ApprovalProcessModule`,`MaxApprovalCount`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Leave',3,NULL,'2020-06-23 09:31:24',NULL,'2020-06-23 09:31:24'),
(2,'Loans',3,NULL,'2020-06-23 09:31:24',NULL,'2020-06-23 09:31:24');

/*Table structure for table `approvalprocesstype` */

DROP TABLE IF EXISTS `approvalprocesstype`;

CREATE TABLE `approvalprocesstype` (
  `ApprovalProcessTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `ApprovalProcessType` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ApprovalProcessTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `approvalprocesstype` */

insert  into `approvalprocesstype`(`ApprovalProcessTypeID`,`ApprovalProcessType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Normal',NULL,'2020-06-23 09:31:32',NULL,'2020-06-23 09:31:32'),
(2,'Admin',NULL,'2020-06-23 09:31:32',NULL,'2020-06-23 09:31:32'),
(3,'Completed',NULL,'2020-06-23 09:31:32',NULL,'2020-06-23 09:31:32'),
(4,'Super Admin',NULL,'2020-06-23 09:31:32',NULL,'2020-06-23 09:31:32');

/*Table structure for table `approvalstages` */

DROP TABLE IF EXISTS `approvalstages`;

CREATE TABLE `approvalstages` (
  `ApprovalStagesID` int(11) NOT NULL AUTO_INCREMENT,
  `ApprovalStages` varchar(100) DEFAULT NULL,
  `ApprovalProcessTypeID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ApprovalStagesID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `approvalstages` */

insert  into `approvalstages`(`ApprovalStagesID`,`ApprovalStages`,`ApprovalProcessTypeID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Team Lead',1,NULL,'2020-06-23 09:31:33',NULL,'2020-06-23 09:31:33'),
(2,'Unit Head',1,NULL,'2020-06-23 09:31:33',NULL,'2020-06-23 09:31:33'),
(3,'HOD',1,NULL,'2020-06-23 09:31:33',NULL,'2020-06-23 09:31:33'),
(4,'Group Head',1,NULL,'2020-06-23 09:31:33',NULL,'2020-06-23 09:31:33'),
(5,'Director',1,NULL,'2020-06-23 09:31:33',NULL,'2020-06-23 09:31:33'),
(6,'HOP',1,NULL,'2020-06-23 09:31:33',NULL,'2020-06-23 09:31:33'),
(7,'BM',1,NULL,'2020-06-23 09:31:33',NULL,'2020-06-23 09:31:33'),
(8,'ZM',1,NULL,'2020-06-23 09:31:33',NULL,'2020-06-23 09:31:33'),
(9,'AM',1,NULL,'2020-06-23 09:31:33',NULL,'2020-06-23 09:31:33'),
(10,'MD',1,NULL,'2020-06-23 09:31:33',NULL,'2020-06-23 09:31:33'),
(11,'HR',2,NULL,'2020-06-23 09:31:33',NULL,'2020-06-23 09:31:33'),
(12,'Store Admin',2,NULL,'2020-06-23 09:31:33',NULL,'2020-06-23 09:31:33'),
(13,'Project Admin',2,NULL,'2020-06-23 09:31:33',NULL,'2020-06-23 09:31:33'),
(14,'Completed',3,NULL,'2020-06-23 09:31:33',NULL,'2020-06-23 09:31:33'),
(15,'Others',1,NULL,'2020-06-23 09:31:33',NULL,'2020-06-23 09:31:33');

/*Table structure for table `approvaltype` */

DROP TABLE IF EXISTS `approvaltype`;

CREATE TABLE `approvaltype` (
  `ApprovalTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `ApprovalType` varchar(100) DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ApprovalTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `approvaltype` */

insert  into `approvaltype`(`ApprovalTypeID`,`ApprovalType`,`Description`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Approve','Approved',NULL,'2020-06-23 09:31:34',NULL,'2020-06-23 09:31:34'),
(2,'Decline','Declined',NULL,'2020-06-23 09:31:34',NULL,'2020-06-23 09:31:34'),
(3,'On-Hold','Put on-hold',NULL,'2020-06-23 09:31:34',NULL,'2020-06-23 09:31:34');

/*Table structure for table `bank` */

DROP TABLE IF EXISTS `bank`;

CREATE TABLE `bank` (
  `BankID` int(10) NOT NULL AUTO_INCREMENT,
  `BankName` varchar(30) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  `BankCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`BankID`),
  UNIQUE KEY `PK_Bank` (`BankID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `bank` */

insert  into `bank`(`BankID`,`BankName`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`,`BankCode`) values 
(1,'Access Bank',NULL,NULL,NULL,NULL,NULL),
(2,'Citibank',NULL,NULL,NULL,NULL,NULL),
(3,'Diamond Bank',NULL,NULL,NULL,NULL,NULL),
(4,'Ecobank Nigeria',NULL,NULL,NULL,NULL,NULL),
(5,'Enterprise Bank Limited',NULL,NULL,NULL,NULL,NULL),
(6,'Fidelity Bank Nigeria',NULL,NULL,NULL,NULL,NULL),
(7,'First Bank Of Nigeria',NULL,NULL,NULL,NULL,NULL),
(8,'First City Monument Bank',NULL,NULL,NULL,NULL,NULL),
(9,'FSDH Merchant Bank',NULL,NULL,NULL,NULL,NULL),
(10,'Guaranty Trust Bank',NULL,NULL,NULL,NULL,NULL),
(11,'Heritage Bank Plc',NULL,NULL,NULL,NULL,NULL),
(12,'Keystone Bank Limited',NULL,NULL,NULL,NULL,NULL),
(13,'Rand Merchant Bank',NULL,NULL,NULL,NULL,NULL),
(14,'Skye Bank',NULL,NULL,NULL,NULL,NULL),
(15,'Stanbic Ibtc Bank Nigeria Limi',NULL,NULL,NULL,NULL,NULL),
(16,'Standard Chartered Bank',NULL,NULL,NULL,NULL,NULL),
(17,'Sterling Bank',NULL,NULL,NULL,NULL,NULL),
(18,'Union Bank Of Nigeria',NULL,NULL,NULL,NULL,NULL),
(19,'United Bank For Africa',NULL,NULL,NULL,NULL,NULL),
(20,'Unity Bank Plc',NULL,NULL,NULL,NULL,NULL),
(21,'Wema Bank',NULL,NULL,NULL,NULL,NULL),
(22,'Zenith Bank',NULL,NULL,NULL,NULL,NULL),
(23,'Suntrust Bank Nigeria Limited',NULL,NULL,NULL,NULL,NULL),
(24,'Providusbank Plc',NULL,NULL,NULL,NULL,NULL),
(25,'Jaiz Bank Limited',NULL,NULL,NULL,NULL,NULL),
(26,'FCMB Group Plc',NULL,NULL,NULL,NULL,NULL),
(27,'FBN Holdings Plc',NULL,NULL,NULL,NULL,NULL),
(28,'Stanbic Ibtc Holdings Plc',NULL,NULL,NULL,NULL,NULL),
(29,'Coronation Merchant Bank',NULL,NULL,NULL,NULL,NULL),
(30,'FBN Merchant Bank',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `benchmark` */

DROP TABLE IF EXISTS `benchmark`;

CREATE TABLE `benchmark` (
  `benchmark_id` int(11) NOT NULL AUTO_INCREMENT,
  `benchmark` varchar(50) NOT NULL,
  `Scale_from` float NOT NULL DEFAULT 0,
  `scale_to` float NOT NULL DEFAULT 0,
  `activeID` int(11) DEFAULT 1,
  `benchmark_desc` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`benchmark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `benchmark` */

/*Table structure for table `benchmark_actions` */

DROP TABLE IF EXISTS `benchmark_actions`;

CREATE TABLE `benchmark_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `benchmark_id` int(11) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `employee_type_id` int(11) DEFAULT NULL,
  `confirmtypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_Relationship244` (`benchmark_id`),
  CONSTRAINT `Relationship244` FOREIGN KEY (`benchmark_id`) REFERENCES `benchmark` (`benchmark_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `benchmark_actions` */

/*Table structure for table `benchmarkgraph` */

DROP TABLE IF EXISTS `benchmarkgraph`;

CREATE TABLE `benchmarkgraph` (
  `benchmark_id` int(11) NOT NULL AUTO_INCREMENT,
  `benchmark` varchar(50) DEFAULT NULL,
  `scale_from` float DEFAULT NULL,
  `scale_to` float DEFAULT NULL,
  `activeId` int(11) DEFAULT 1,
  PRIMARY KEY (`benchmark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `benchmarkgraph` */

/*Table structure for table `branches` */

DROP TABLE IF EXISTS `branches`;

CREATE TABLE `branches` (
  `BranchID` int(10) NOT NULL AUTO_INCREMENT,
  `BranchName` varchar(100) NOT NULL,
  `Location` text DEFAULT NULL,
  `CompanyID` int(10) DEFAULT NULL,
  `BranchTypeID` int(10) DEFAULT NULL,
  `StateID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`BranchID`),
  UNIQUE KEY `PK_Branches` (`BranchID`),
  KEY `IX_Relationship2` (`CompanyID`),
  KEY `IX_Relationship3` (`BranchTypeID`),
  KEY `IX_Relationship4` (`StateID`),
  CONSTRAINT `Relationship2` FOREIGN KEY (`CompanyID`) REFERENCES `company` (`CompanyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship3` FOREIGN KEY (`BranchTypeID`) REFERENCES `branchtypes` (`BranchTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship4` FOREIGN KEY (`StateID`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `branches` */

insert  into `branches`(`BranchID`,`BranchName`,`Location`,`CompanyID`,`BranchTypeID`,`StateID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Corporate Head Office','5th Floor, Cosharis Building, Central Business District, Abuja.',1,1,4200,NULL,'2020-06-23 09:31:39',NULL,'2020-06-23 09:31:39');

/*Table structure for table `branchtypes` */

DROP TABLE IF EXISTS `branchtypes`;

CREATE TABLE `branchtypes` (
  `BranchTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `BranchType` varchar(50) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`BranchTypeID`),
  UNIQUE KEY `PK_BranchTypes` (`BranchTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `branchtypes` */

insert  into `branchtypes`(`BranchTypeID`,`BranchType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Head Office',NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
(2,'State Office',NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41');

/*Table structure for table `calendar` */

DROP TABLE IF EXISTS `calendar`;

CREATE TABLE `calendar` (
  `calendar_date` datetime NOT NULL,
  `is_holiday` tinyint(1) NOT NULL,
  `is_weekend` tinyint(1) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`calendar_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `calendar` */

insert  into `calendar`(`calendar_date`,`is_holiday`,`is_weekend`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
('2020-01-01 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-02 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-03 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-04 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-05 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-06 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-07 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-08 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-09 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-10 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-11 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-12 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-13 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-14 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-15 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-16 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-17 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-18 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-19 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-20 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-21 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-22 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-23 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-24 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-25 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-26 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-27 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-28 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-29 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-30 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-01-31 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-01 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-02 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-03 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-04 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-05 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-06 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-07 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-08 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-09 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-10 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-11 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-12 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-13 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-14 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-15 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-16 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-17 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-18 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-19 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-20 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-21 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-22 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-23 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-24 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-25 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-26 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-27 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-28 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-02-29 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-01 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-02 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-03 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-04 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-05 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-06 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-07 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-08 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-09 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-10 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-11 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-12 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-13 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-14 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-15 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-16 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-17 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-18 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-19 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-20 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-21 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-22 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-23 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-24 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-25 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-26 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-27 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-28 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-29 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-30 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-03-31 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-01 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-02 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-03 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-04 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-05 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-06 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-07 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-08 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-09 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-10 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-11 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-12 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-13 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-14 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-15 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-16 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-17 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-18 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-19 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-20 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-21 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-22 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-23 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-24 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-25 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-26 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-27 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-28 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-29 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-04-30 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-01 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-02 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-03 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-04 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-05 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-06 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-07 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-08 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-09 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-10 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-11 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-12 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-13 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-14 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-15 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-16 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-17 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-18 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-19 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-20 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-21 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-22 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-23 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-24 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-25 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-26 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-27 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-28 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-29 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-30 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-05-31 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-01 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-02 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-03 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-04 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-05 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-06 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-07 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-08 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-09 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-10 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-11 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-12 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-13 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-14 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-15 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-16 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-17 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-18 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-19 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-20 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-21 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-22 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-23 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-24 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-25 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-26 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-27 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-28 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-29 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-06-30 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-01 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-02 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-03 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-04 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-05 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-06 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-07 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-08 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-09 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-10 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-11 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-12 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-13 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-14 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-15 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-16 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-17 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-18 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-19 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-20 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-21 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-22 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-23 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-24 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-25 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-26 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-27 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-28 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-29 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-30 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-07-31 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-01 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-02 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-03 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-04 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-05 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-06 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-07 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-08 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-09 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-10 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-11 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-12 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-13 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-14 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-15 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-16 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-17 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-18 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-19 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-20 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-21 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-22 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-23 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-24 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-25 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-26 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-27 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-28 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-29 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-30 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-08-31 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-01 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-02 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-03 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-04 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-05 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-06 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-07 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-08 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-09 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-10 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-11 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-12 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-13 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-14 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-15 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-16 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-17 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-18 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-19 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-20 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-21 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-22 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-23 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-24 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-25 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-26 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-27 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-28 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-29 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-09-30 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-01 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-02 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-03 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-04 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-05 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-06 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-07 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-08 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-09 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-10 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-11 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-12 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-13 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-14 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-15 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-16 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-17 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-18 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-19 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-20 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-21 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-22 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-23 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-24 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-25 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-26 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-27 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-28 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-29 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-30 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-10-31 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-01 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-02 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-03 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-04 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-05 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-06 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-07 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-08 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-09 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-10 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-11 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-12 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-13 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-14 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-15 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-16 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-17 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-18 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-19 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-20 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-21 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-22 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-23 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-24 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-25 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-26 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-27 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-28 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-29 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-11-30 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-01 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-02 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-03 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-04 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-05 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-06 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-07 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-08 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-09 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-10 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-11 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-12 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-13 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-14 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-15 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-16 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-17 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-18 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-19 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-20 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-21 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-22 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-23 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-24 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-25 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-26 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-27 00:00:00',0,1,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-28 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-29 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-30 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41'),
('2020-12-31 00:00:00',0,0,NULL,'2020-06-23 09:31:41',NULL,'2020-06-23 09:31:41');

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `CompanyID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(100) NOT NULL,
  `Location` varchar(1000) DEFAULT NULL,
  `LogoUrl` varchar(100) DEFAULT NULL,
  `CompanyAbbr` varchar(20) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `company` */

insert  into `company`(`CompanyID`,`CompanyName`,`Location`,`LogoUrl`,`CompanyAbbr`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'TEAM Nigeria','Nigeria','logo','TEAM 9ja',NULL,'2020-06-23 09:31:47',NULL,'2020-06-23 09:31:47');

/*Table structure for table `confirmtype` */

DROP TABLE IF EXISTS `confirmtype`;

CREATE TABLE `confirmtype` (
  `ConfirmTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `ConfirmType` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ConfirmTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `confirmtype` */

/*Table structure for table `contracttype` */

DROP TABLE IF EXISTS `contracttype`;

CREATE TABLE `contracttype` (
  `ContractTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `ContractType` varchar(100) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ContractTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `contracttype` */

insert  into `contracttype`(`ContractTypeID`,`ContractType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'YEAR CONTRACT UPDATEED',NULL,'2020-06-24 11:57:18',NULL,'2020-06-24 11:57:18');

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `Code` char(3) NOT NULL DEFAULT '',
  `Name` char(52) NOT NULL DEFAULT '',
  `phone_code` int(7) NOT NULL,
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Code`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=latin1;

/*Data for the table `country` */

insert  into `country`(`Code`,`Name`,`phone_code`,`country_id`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
('ABW','Aruba',297,1,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('AFG','Afghanistan',93,2,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('AGO','Angola',244,3,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('AIA','Anguilla',1,4,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ALB','Albania',355,5,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('AND','Andorra',376,6,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ANT','Netherlands Antilles',599,7,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ARE','United Arab Emirates',971,8,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ARG','Argentina',54,9,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ARM','Armenia',374,10,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ASM','American Samoa',1,11,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ATA','Antarctica',672,12,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ATG','Antigua and Barbuda',1,13,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('AUS','Australia',61,14,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('AUT','Austria',43,15,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('AZE','Azerbaijan',994,16,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BDI','Burundi',257,17,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BEL','Belgium',375,18,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BEN','Benin',229,19,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BFA','Burkina Faso',226,20,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BGD','Bangladesh',880,21,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BGR','Bulgaria',359,22,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BHR','Bahrain',973,23,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BHS','Bahamas',1242,24,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BIH','Bosnia and Herzegovina',387,25,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BLR','Belarus',375,26,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BLZ','Belize',501,27,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BMU','Bermuda',1,28,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BOL','Bolivia',591,29,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BRA','Brazil',55,30,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BRB','Barbados',1246,31,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BRN','Brunei Darussalm',673,32,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BTN','Bhutan',975,33,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('BWA','Botswana',267,34,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('CAF','Central African Republic',236,35,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('CAN','Canada',1,36,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('CHA','Chad',235,37,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('CHE','Switzerland',41,38,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('CHL','Chile',56,39,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('CHN','China',86,40,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('CIV','Cote d\'ivoire',255,41,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('CMR','Cameroon',237,42,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('COG','Congo',242,43,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('COK','Cook Islands',682,44,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('COL','Colombia',57,45,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('COM','Comoros',269,46,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('CPV','Cape Verde',238,47,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('CRI','Costa Rica',506,48,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('CUB','Cuba',53,49,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('CXR','Christmas Island',64,50,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('CYM','Cayman Islands',1345,51,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('CYP','Cyprus',357,52,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('DEU','Germany',49,53,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('DJI','Djibouti',253,54,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('DMA','Dominica',1767,55,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('DNK','Denmark',45,56,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('DOM','Dominican Republic',1809,57,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('DZA','Algeria',213,58,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ECU','Ecuador',593,59,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('EGY','Egypt',20,60,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ERI','Eritrea',291,61,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ESH','Western Sahara',212,62,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ESP','Spain',34,63,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('EST','Estonia',372,64,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ETH','Ethiopia',251,65,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('FIN','Finland',358,66,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('FJI','Fiji Islands',679,67,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('FLK','Falkland Islands',500,68,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('FRA','France',33,69,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('FRO','Faroe Islands',298,70,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('FSM','Micronesia',691,71,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GAB','Gabon',241,72,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GBR','United Kingdom',44,73,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GEO','Georgia',995,74,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GHA','Ghana',233,75,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GIB','Gibraltar',350,76,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GIN','Guinea',224,77,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GLP','Guadeloupe',590,78,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GMB','Gambia',220,79,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GNB','Guinea-Bissau',245,80,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GNQ','Equatorial Guinea',240,81,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GRC','Greece',30,82,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GRD','Grenada',1473,83,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GRL','Greenland',299,84,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GTM','Guatemala',502,85,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GUF','French Guiana',594,86,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GUM','Guam',1671,87,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('GUY','Guyana',592,88,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('HKG','Hong Kong',852,89,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('HND','Honduras',504,90,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('HRV','Croatia',385,91,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('HTI','Haiti',509,92,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('HUN','Hungary',36,93,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('IDN','Indonesia',62,94,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('IND','India',91,95,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('IOT','British Indian Ocean Territory',246,96,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('IRL','Ireland',353,97,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('IRN','Iran',98,98,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('IRQ','Iraq',964,99,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ISL','Iceland',354,100,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ISR','Israel',972,101,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ITA','Italy',39,102,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('JAM','Jamaica',1,103,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('JOR','Jordan',962,104,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('JPN','Japan',81,105,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('KAZ','Kazakhstan',7,106,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('KEN','Kenya',254,107,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('KGZ','Kyrgyzstan',996,108,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('KHM','Cambodia',855,109,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('KIR','Kiribati',686,110,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('KNA','Saint Kitts and Nevis',1869,111,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('KOR','South Korea',82,112,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('KWT','Kuwait',965,113,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('LAO','Laos',856,114,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('LBN','Lebanon',961,115,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('LBR','Liberia',231,116,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('LBY','Libyan Arab Jamahiriya',218,117,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('LCA','Saint Lucia',1758,118,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('LIE','Liechtenstein',423,119,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('LKA','Sri Lanka',94,120,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('LSO','Lesotho',266,121,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('LTU','Lithuania',370,122,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('LUX','Luxembourg',352,123,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('LVA','Latvia',371,124,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MAC','Macao',853,125,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MAR','Morocco',212,126,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MCO','Monaco',377,127,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MDA','Moldova',373,128,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MDG','Madagascar',261,129,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MDV','Maldives',960,130,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MEX','Mexico',52,131,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MHL','Marshall Islands',692,132,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MKD','Macedonia',389,133,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MLI','Mali',223,134,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MLT','Malta',356,135,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MMR','Myanmar',95,136,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MNG','Mongolia',976,137,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MNP','Northern Mariana Islands',1,138,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MOZ','Mozambique',258,139,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MRT','Mauritania',222,140,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MSR','Montserrat',1,141,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MTQ','Martinique',596,142,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MUS','Mauritius',230,143,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MWI','Malawi',265,144,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MYS','Malaysia',60,145,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('MYT','Mayotte',262,146,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('NAM','Namibia',264,147,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('NCL','New Caledonia',687,148,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('NER','Niger',227,149,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('NFK','Norfolk Island',672,150,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('NGA','Nigeria',234,151,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('NIC','Nicaragua',505,152,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('NIU','Niue',683,153,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('NLD','Netherlands',31,154,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('NOR','Norway',47,155,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('NPL','Nepal',977,156,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('NRU','Nauru',674,157,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('NZL','New Zealand',64,158,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('OMN','Oman',968,159,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('PAK','Pakistan',92,160,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('PAN','Panama',507,161,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('PER','Peru',51,162,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('PHL','Philippines',63,163,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('PLW','Palau',680,164,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('PNG','Papua New Guinea',675,165,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('POL','Poland',48,166,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('PRK','North Korea',850,167,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('PRT','Portugal',351,168,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('PRY','Paraguay',595,169,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('PSE','Palestine',970,170,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('PYF','French Polynesia',689,171,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('QAT','Qatar',974,172,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ROM','Romania',40,173,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('RUS','Russian',7,174,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('RWA','Rwanda',250,175,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SAU','Saudi Arabia',966,176,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SDN','Sudan',249,177,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SEN','Senegal',221,178,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SGP','Singapore',65,179,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SHN','Saint Helena',290,180,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SLB','Solomon Islands',677,181,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SLE','Sierra Leone',232,182,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SLV','El Salvador',503,183,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SMR','San Marino',374,184,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SOM','Somalia',252,185,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SPM','Saint Pierre and Miquelon',508,186,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('STP','Sao Tome and Principe',239,187,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SUR','Suriname',597,188,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SVK','Slovakia',421,189,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SVN','Slovenia',386,190,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SWE','Sweden',46,191,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SWZ','Swaziland',41,192,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SYC','Seychelles',248,193,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('SYR','Syria',963,194,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('TGO','Togo',228,195,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('THA','Thailand',66,196,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('TJK','Tajikistan',992,197,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('TKL','Tokelau',690,198,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('TMP','East Timor',670,199,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('TON','Tonga',676,200,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('TTO','Trinidad and Tobago',1,201,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('TUR','Turkey',90,202,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('TUV','Tuvalu',688,203,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('TWN','Taiwan',886,204,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('TZA','Tanzania',255,205,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('UGA','Uganda',256,206,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('UKR','Ukraine',380,207,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('URY','Uruguay',598,208,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('USA','United States',1,209,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('UZB','Uzbekistan',998,210,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('VCT','Saint Vincent and the Grenadines',1784,211,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('VEN','Venezuela',58,212,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('VGB','British Virgin Island',1,213,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('VIR','U.S. Virgin Islands',1340,214,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('VNM','Vietnam',84,215,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('VUT','Vanuatu',678,216,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('WLF','Wallis and Futuna',681,217,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('WSM','Samoa',685,218,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('YEM','Yemen',967,219,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ZAF','South Africa',27,220,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ZMB','Zambia',260,221,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49'),
('ZWE','Zimbabwe',263,222,NULL,'2020-06-23 09:31:49',NULL,'2020-06-23 09:31:49');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `CustomerID` int(10) NOT NULL AUTO_INCREMENT,
  `CustomerTypeID` int(10) DEFAULT NULL,
  `CustomerName` varchar(30) DEFAULT NULL,
  `CustomerRM` varchar(30) DEFAULT NULL,
  `CustomerPhoneNo` varchar(20) DEFAULT NULL,
  `CustomerEmail` varchar(50) DEFAULT NULL,
  `CustomerAddress` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `PK_Customer` (`CustomerID`),
  KEY `IX_Relationship2` (`CustomerTypeID`),
  CONSTRAINT `Relationship_c2_c` FOREIGN KEY (`CustomerTypeID`) REFERENCES `customertype` (`CustomerTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

insert  into `customer`(`CustomerID`,`CustomerTypeID`,`CustomerName`,`CustomerRM`,`CustomerPhoneNo`,`CustomerEmail`,`CustomerAddress`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,2,'Electroso Technologies','John Praise','08000009900','info@electroso.io','Plot 234 maitama FCT Abuja',NULL,'2020-06-23 09:31:54',NULL,'2020-06-23 09:31:54'),
(2,2,'SunDimension','Ojo Emmanuel','08032321448','info@sundimension.com','Suite 17 Wilflox Plaza, Wuye',NULL,'2020-06-23 09:31:54',NULL,'2020-06-23 09:31:54'),
(3,2,'Century Information System','Keston Timson','08148117066','keston@gmail.com','Luvu Madaki, Nasarawa',NULL,'2020-06-23 09:31:54',NULL,'2020-06-23 09:31:54');

/*Table structure for table `customersubtype` */

DROP TABLE IF EXISTS `customersubtype`;

CREATE TABLE `customersubtype` (
  `CustomerSubTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `CustomerTypeID` int(10) DEFAULT NULL,
  `CustomerSubType` varchar(30) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CustomerSubTypeID`),
  UNIQUE KEY `PK_CustomerSubType` (`CustomerSubTypeID`),
  KEY `IX_Relationship3` (`CustomerTypeID`),
  CONSTRAINT `Relationship_c3` FOREIGN KEY (`CustomerTypeID`) REFERENCES `customertype` (`CustomerTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `customersubtype` */

insert  into `customersubtype`(`CustomerSubTypeID`,`CustomerTypeID`,`CustomerSubType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,1,'Federal Government',NULL,'2020-06-23 09:31:56',NULL,'2020-06-23 09:31:56'),
(2,1,'State Government',NULL,'2020-06-23 09:31:56',NULL,'2020-06-23 09:31:56'),
(3,1,'Local Government',NULL,'2020-06-23 09:31:56',NULL,'2020-06-23 09:31:56'),
(4,2,'SoleProprietors',NULL,'2020-06-23 09:31:56',NULL,'2020-06-23 09:31:56'),
(5,2,'Limited Liability Companies',NULL,'2020-06-23 09:31:56',NULL,'2020-06-23 09:31:56');

/*Table structure for table `customertype` */

DROP TABLE IF EXISTS `customertype`;

CREATE TABLE `customertype` (
  `CustomerTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `CustomerType` varchar(30) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CustomerTypeID`),
  UNIQUE KEY `PK_CustomerType` (`CustomerTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `customertype` */

insert  into `customertype`(`CustomerTypeID`,`CustomerType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Public Sector',NULL,'2020-06-23 09:31:56',NULL,'2020-06-23 09:31:56'),
(2,'Private Sector',NULL,'2020-06-23 09:31:56',NULL,'2020-06-23 09:31:56'),
(3,'Customer Type 1',NULL,'2020-06-23 09:31:56',NULL,'2020-06-23 09:31:56');

/*Table structure for table `departmentgroup` */

DROP TABLE IF EXISTS `departmentgroup`;

CREATE TABLE `departmentgroup` (
  `DepartmentGroupID` int(10) NOT NULL AUTO_INCREMENT,
  `DepartmentGroupName` varchar(50) DEFAULT NULL,
  `DepartmentGroupCode` varchar(10) DEFAULT NULL,
  `DivisionID` int(10) DEFAULT NULL,
  `StatusID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`DepartmentGroupID`),
  UNIQUE KEY `PK_DepartmentGroup` (`DepartmentGroupID`),
  KEY `IX_Relationship10` (`DivisionID`),
  KEY `IX_Relationship11` (`StatusID`),
  CONSTRAINT `Relationship10` FOREIGN KEY (`DivisionID`) REFERENCES `divisions` (`DivisionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship11` FOREIGN KEY (`StatusID`) REFERENCES `statuses` (`StatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `departmentgroup` */

insert  into `departmentgroup`(`DepartmentGroupID`,`DepartmentGroupName`,`DepartmentGroupCode`,`DivisionID`,`StatusID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Risk and Compliance','TN-RAC',1,1,NULL,'2020-06-23 09:32:03',NULL,'2020-06-23 09:32:03'),
(2,'Operations',NULL,NULL,NULL,NULL,'2020-06-23 09:32:03',NULL,'2020-06-23 09:32:03'),
(3,'Growth and Strategy',NULL,NULL,NULL,NULL,'2020-06-23 09:32:03',NULL,'2020-06-23 09:32:03'),
(4,'Legal',NULL,NULL,NULL,NULL,'2020-06-23 09:32:03',NULL,'2020-06-23 09:32:03'),
(5,'Technology',NULL,NULL,NULL,NULL,'2020-06-23 09:32:03',NULL,'2020-06-23 09:32:03'),
(6,'Finance',NULL,NULL,NULL,NULL,'2020-06-23 09:32:03',NULL,'2020-06-23 09:32:03'),
(7,'Audit',NULL,NULL,NULL,NULL,'2020-06-23 09:32:03',NULL,'2020-06-23 09:32:03'),
(10,'Projects',NULL,NULL,NULL,NULL,'2020-06-23 09:32:03',NULL,'2020-06-23 09:32:03');

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `DepartmentID` int(10) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(50) DEFAULT NULL,
  `DepartmentCode` varchar(10) DEFAULT NULL,
  `DivisionID` int(10) DEFAULT NULL,
  `StatusID` int(10) DEFAULT NULL,
  `DepartmentGroupID` int(10) DEFAULT NULL,
  `CompanyID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`DepartmentID`),
  UNIQUE KEY `PK_Departments` (`DepartmentID`),
  KEY `IX_Relationship12` (`DepartmentGroupID`),
  KEY `IX_Relationship5` (`DivisionID`),
  KEY `IX_Relationship8` (`StatusID`),
  KEY `FK_Departments_Company` (`CompanyID`),
  CONSTRAINT `FK_Departments_Company` FOREIGN KEY (`CompanyID`) REFERENCES `company` (`CompanyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `departments` */

insert  into `departments`(`DepartmentID`,`DepartmentName`,`DepartmentCode`,`DivisionID`,`StatusID`,`DepartmentGroupID`,`CompanyID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(5,'Human Resources','HR',1,1,2,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(6,'Technology','DC2',1,1,2,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(7,'Logistics','DC3',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(8,'Civil/Site Engineering','DC4',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(9,'Accounts','DC5',1,1,2,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(10,'Project Management','PM',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(11,'PW Engineering','CSE',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(12,'GeoTechnical Engineering','GTE',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(13,'Survey','S',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(14,'Quantity Survey','QS',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(15,'Electrical Engineering','EE',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(16,'Sig and Tel. Engineering','STE',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(17,'Architect','ARC',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(18,'Logistics','LOG',1,1,2,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(19,'Transport Engineering','TE',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(20,'Document Control','DC',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(21,'Geology Engineering','GE',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(22,'Structural Engineering','SE',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(23,'Hydraulic Engineering','HE',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(24,'Electromechnical Engineering','EME',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(25,'Resident Engineering','RE',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(26,'Design Management','DM',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(27,'Archive','AR',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06'),
(28,'Quantity Managment','QM',1,1,10,NULL,NULL,'2020-06-23 09:32:06',NULL,'2020-06-23 09:32:06');

/*Table structure for table `designationcategory` */

DROP TABLE IF EXISTS `designationcategory`;

CREATE TABLE `designationcategory` (
  `DesignationCategoryID` int(10) NOT NULL AUTO_INCREMENT,
  `DesignationCategory` varchar(50) DEFAULT NULL,
  `ApprovalStageID` int(10) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`DesignationCategoryID`),
  UNIQUE KEY `PK_DesignationCategory` (`DesignationCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `designationcategory` */

insert  into `designationcategory`(`DesignationCategoryID`,`DesignationCategory`,`ApprovalStageID`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(2,'Head of Department',3,NULL,NULL,NULL,NULL),
(3,'Head of Unit',2,NULL,NULL,NULL,NULL),
(4,'Head of Operations',6,NULL,NULL,NULL,NULL),
(5,'Branch Manager',7,NULL,NULL,NULL,NULL),
(6,'Group Head',4,NULL,NULL,NULL,NULL),
(7,'Team Lead',1,NULL,NULL,NULL,NULL),
(8,'Director',5,NULL,NULL,NULL,NULL),
(9,'Managing Director',10,NULL,NULL,NULL,NULL),
(10,'Zonal Manager',8,NULL,NULL,NULL,NULL),
(11,'Area Manager',9,NULL,NULL,NULL,NULL),
(12,'Chairman',NULL,NULL,NULL,NULL,NULL),
(13,'Others',15,NULL,NULL,NULL,NULL);

/*Table structure for table `designations` */

DROP TABLE IF EXISTS `designations`;

CREATE TABLE `designations` (
  `DesignationID` int(11) NOT NULL AUTO_INCREMENT,
  `DesignationName` varchar(50) DEFAULT NULL,
  `DepartmentID` int(10) DEFAULT NULL,
  `CompanyID` int(10) DEFAULT NULL,
  `SupervisorTypeID` int(10) DEFAULT NULL,
  `FK_DesignationID` int(10) DEFAULT NULL,
  `BackupReportTo` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  `cadre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`DesignationID`),
  UNIQUE KEY `PK_Designations` (`DesignationID`),
  KEY `IX_Relationship13` (`DepartmentID`),
  KEY `IX_Relationship14` (`CompanyID`),
  KEY `IX_Relationship15` (`SupervisorTypeID`),
  KEY `IX_Relationship16` (`FK_DesignationID`),
  KEY `cadre_id` (`cadre_id`),
  CONSTRAINT `Relationship13` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship14` FOREIGN KEY (`CompanyID`) REFERENCES `company` (`CompanyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship15` FOREIGN KEY (`SupervisorTypeID`) REFERENCES `designationcategory` (`DesignationCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship16` FOREIGN KEY (`FK_DesignationID`) REFERENCES `designations` (`DesignationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `designations_ibfk_1` FOREIGN KEY (`cadre_id`) REFERENCES `grade_cadre` (`cadre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

/*Data for the table `designations` */

insert  into `designations`(`DesignationID`,`DesignationName`,`DepartmentID`,`CompanyID`,`SupervisorTypeID`,`FK_DesignationID`,`BackupReportTo`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`,`cadre_id`) values 
(1,'General Manager',5,1,6,4,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(2,'Admin Manager',NULL,1,2,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(3,'Head Aluminium Factory',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(4,'Managing Director',10,1,9,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',1),
(5,'Cleaner',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(6,'Factory Assistant',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(7,'Cashier',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(8,'Admin Staff',NULL,1,13,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(9,'Driver',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(10,'Site Engineer Akwa Ibom',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(11,'GM\'s Secretary ',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(12,'Security',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(13,'Accountant',NULL,1,NULL,25,28,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(14,'Factory Head',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(15,'Supervisor Paint Factory',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(16,'Operator Paint factory',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(17,'Factory Assistant Paint',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(18,'Secretary Paint Factory',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(19,'CLO Akwa Ibom',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(20,'Factory Worker',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(21,'Bender',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(22,'Project Manager',10,1,6,1,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',1),
(23,'Senior Logistics Manager',7,1,2,22,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(24,'Assistant Project Manager',10,1,6,22,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(25,'Resident Engineer',10,1,5,22,24,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(26,'Design Manager',NULL,1,NULL,22,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(27,'Technical  Quality Manager',NULL,1,NULL,22,24,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(28,'Deputy Resident Engineer',NULL,1,NULL,25,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(29,'Senior Structural Engineer',NULL,1,NULL,25,28,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(30,'Senior Geotechnical Engineer',NULL,1,NULL,25,28,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(31,'Senior QS (HoD)',NULL,1,NULL,25,28,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(32,'Senior Surveyor (HoD)',NULL,1,NULL,25,28,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(33,'Senior Geologist (HoD)',NULL,1,NULL,25,28,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(34,'Senior Civil/Site Engineer (HoD)',NULL,1,NULL,25,28,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(35,'Senior Architect (HoD)',NULL,1,NULL,25,28,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(36,'Senior PW Engineer (HoD)',NULL,1,NULL,25,28,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(37,'Senior Elect. Engineer (HoD)',NULL,1,NULL,25,28,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(38,'Senior Sig. and Tel. Engineer (HoD)',NULL,1,NULL,25,28,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(39,'Senior Logistic Officer (HoD)',NULL,1,NULL,25,28,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(40,'Safety Officer',NULL,1,NULL,25,28,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(41,'Document Controller',NULL,1,NULL,25,28,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(42,'Archivist',NULL,1,NULL,25,28,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(43,'Structural Engineer',NULL,1,NULL,29,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(44,'Geotechnical Engineer',NULL,1,NULL,30,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(45,'Senior QS ',NULL,1,NULL,31,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(46,'Senior Surveyor',NULL,1,NULL,32,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(47,'Senior Geologist',NULL,1,NULL,33,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(48,'Senior Civil/Site Engineer',NULL,1,NULL,34,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(49,'Senior Architect',NULL,1,NULL,35,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(50,'Senior PW Engineer',NULL,1,NULL,36,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(51,'Senior Elect. Engineer',NULL,1,NULL,37,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(52,'Senior Sig. and Tel. Engineer',NULL,1,NULL,38,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(53,'Senior Logistic Officer',NULL,1,NULL,39,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(54,'IT Officer',NULL,1,NULL,39,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(55,'Document Controller',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(56,'Archivist',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(57,'Chief QS Engineer',NULL,1,NULL,45,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(58,'Chief Surveyor',NULL,1,NULL,46,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(59,'Chief Geologist',NULL,1,NULL,47,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(60,'Chief Civil/Site Engineer',NULL,1,NULL,48,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(61,'Chief Architect',17,1,7,61,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(62,'Chief PW Engineer',NULL,1,NULL,50,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(63,'Chief Elect. Engineer',NULL,1,NULL,51,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(64,'Chief Sig. and Tel. Engineer',NULL,1,NULL,52,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(65,'Chief Logistic Officer',NULL,1,NULL,53,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(66,'QS',NULL,1,NULL,57,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(67,'Surveyor',NULL,1,NULL,58,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(68,'Geologist',NULL,1,NULL,59,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(69,'Civil/Site Engineer',NULL,1,NULL,60,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(70,'Architect',NULL,1,NULL,61,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(71,'PW Engineer',NULL,1,NULL,62,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(72,'Elect. Engineer',NULL,1,NULL,63,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(73,'Sig. and Tel. Engineer',NULL,1,NULL,64,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(74,'Logistic Officer',NULL,1,NULL,65,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(75,'Assistant QS',NULL,1,NULL,66,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(76,'Assistant Surveyor',NULL,1,NULL,67,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(77,'Assistant Geologist',NULL,1,NULL,68,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(78,'Assistant Civil/Site Engineer',NULL,1,NULL,69,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(79,'Assistant Architect',NULL,1,NULL,70,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(80,'Assistant PW Engineer',NULL,1,NULL,71,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(81,'Assistant Elect. Engineer',NULL,1,NULL,72,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(82,'Assistant Sig. and Tel. Engineer',NULL,1,NULL,73,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(83,'Logistic Clerk',NULL,1,NULL,74,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(84,'Chainman',NULL,1,NULL,76,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(85,'Chief Lab. Technician',NULL,1,NULL,77,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(86,'Laborotary Technician',NULL,1,NULL,85,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(87,'Assistant Lab. Technician',NULL,1,NULL,86,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(88,'Assistant Design Manager',NULL,1,NULL,26,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(89,'Senior Transport Engineer (HoD)',NULL,1,NULL,26,88,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(90,'Senior Structural Engineer (HoD)',NULL,1,NULL,26,88,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(91,'Senior Architect Engineer (HoD)',NULL,1,NULL,26,88,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(92,'Senior Geotechnical Engineer (HoD)',NULL,1,NULL,26,88,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(93,'Senior Hydraulic Engineer (HoD)',NULL,1,NULL,26,88,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(94,'Senior Electromechanical Engineer (HoD)',NULL,1,NULL,26,88,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(95,'Senior Sig. and Tel. Engineer (HoD)',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(96,'Draftmans',NULL,1,NULL,26,88,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(97,'Senior Document Control Coordinator (HoD)',NULL,1,NULL,26,88,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(98,'Senior Transport Engineer',NULL,1,NULL,89,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(99,'Senior Structural Engineer',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(100,'Senior Architect Engineer',NULL,1,NULL,91,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(101,'Senior Geotechnical Engineer',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(102,'Senior Hydraulic Engineer',NULL,1,NULL,93,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(103,'Senior Electromechanical Engineer',NULL,1,NULL,94,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(104,'Senior Sig. and Tel. Engineer',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(105,'Senior Document Control Coordinator',NULL,1,NULL,97,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(106,'Chief Transport Engineer',NULL,1,NULL,98,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(107,'Chief Structural Engineer',NULL,1,NULL,29,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(108,'Chief Architect Engineer',NULL,1,NULL,100,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(109,'Chief Geotechnical Engineer',NULL,1,NULL,30,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(110,'Chief Hydraulic Engineer',NULL,1,NULL,102,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(111,'Chief Electromechanical Engineer',NULL,1,NULL,103,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(112,'Chief Sig. and Tel. Engineer',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(113,'Chief Document Control Coordinator',NULL,1,NULL,105,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(114,'Transport Engineer',NULL,1,NULL,106,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(115,'Structural Engineer',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(116,'Architect Engineer',NULL,1,NULL,108,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(117,'Geotechnical Engineer',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(118,'Hydraulic Engineer',NULL,1,NULL,110,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(119,'Electromechanical Engineer',NULL,1,NULL,111,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(120,'Sig. and Tel. Engineer',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(121,'Chief Document Control Coordinator',NULL,1,NULL,NULL,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(122,'Documents Control Clerk',NULL,1,NULL,153,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(153,'Documents Controller',NULL,1,NULL,113,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL),
(154,'Accountant Clerk',NULL,1,NULL,13,NULL,NULL,'2020-06-21 14:22:42',NULL,'2020-06-21 14:22:42',NULL);

/*Table structure for table `divisions` */

DROP TABLE IF EXISTS `divisions`;

CREATE TABLE `divisions` (
  `DivisionID` int(11) NOT NULL AUTO_INCREMENT,
  `DivisionName` varchar(100) NOT NULL,
  `CompanyID` int(11) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`DivisionID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `divisions` */

insert  into `divisions`(`DivisionID`,`DivisionName`,`CompanyID`,`StatusID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Project Managment',1,1,NULL,'2020-06-23 09:32:07',NULL,'2020-06-23 09:32:07');

/*Table structure for table `documenttype` */

DROP TABLE IF EXISTS `documenttype`;

CREATE TABLE `documenttype` (
  `DocumentTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `DocumentType` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`DocumentTypeID`),
  UNIQUE KEY `PK_DocumentType` (`DocumentTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `documenttype` */

/*Table structure for table `duration` */

DROP TABLE IF EXISTS `duration`;

CREATE TABLE `duration` (
  `DurationID` int(10) NOT NULL AUTO_INCREMENT,
  `Duration` varchar(30) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`DurationID`),
  UNIQUE KEY `PK_Duration` (`DurationID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `duration` */

insert  into `duration`(`DurationID`,`Duration`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'3 Years',NULL,NULL,NULL,NULL),
(2,'5 Years',NULL,NULL,NULL,NULL),
(3,'10 Years',NULL,NULL,NULL,NULL);

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `EmployeeID` int(10) NOT NULL AUTO_INCREMENT,
  `SurName` varchar(100) DEFAULT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `MiddleName` varchar(100) DEFAULT NULL,
  `EmployeeTitleID` int(10) DEFAULT NULL,
  `FullName` varchar(150) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `EmployeeNumber` varchar(25) DEFAULT NULL,
  `GradeID` int(10) DEFAULT NULL,
  `GradeLevelID` int(10) DEFAULT NULL,
  `EmployeeTypeID` int(10) DEFAULT NULL,
  `BranchID` int(10) DEFAULT NULL,
  `CompanyID` int(10) DEFAULT NULL,
  `DepartmentID` int(10) DEFAULT NULL,
  `UnitID` int(10) DEFAULT NULL,
  `DesignationID` int(10) DEFAULT NULL,
  `StateID` int(10) DEFAULT NULL,
  `StatusID` int(10) DEFAULT NULL,
  `PensionProviderID` int(10) DEFAULT NULL,
  `PensionPIN` varchar(30) DEFAULT NULL,
  `BankID` int(10) DEFAULT NULL,
  `BankAccountNo` varchar(30) DEFAULT NULL,
  `NHFNo` varchar(30) DEFAULT NULL,
  `GenderID` int(10) DEFAULT NULL,
  `MaritalStatusID` int(10) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `ResidentialAddress` text DEFAULT NULL,
  `HomeNum` varchar(30) DEFAULT NULL,
  `MobileNum` varchar(30) DEFAULT NULL,
  `NationalityID` int(10) DEFAULT NULL,
  `StateofOriginID` int(10) DEFAULT NULL,
  `LgaID` int(10) DEFAULT NULL,
  `CityID` int(10) DEFAULT NULL,
  `ReligionID` int(10) DEFAULT NULL,
  `Tribe` varchar(50) DEFAULT NULL,
  `Hobbies` varchar(150) DEFAULT NULL,
  `PersonalEmail` varchar(200) DEFAULT NULL,
  `EmployeeStatusID` int(10) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT current_timestamp(),
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT current_timestamp(),
  `Trade` varchar(200) DEFAULT NULL,
  `IdentificationID` int(11) DEFAULT NULL,
  `IdentificationNumber` varchar(20) DEFAULT NULL,
  `IdentificationStartDate` date DEFAULT NULL,
  `IdentificationExpiryDate` date DEFAULT NULL,
  `PermanentAddress` text DEFAULT NULL,
  `StaffCategoryID` int(11) DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `EmploymentDate` date DEFAULT NULL,
  `ContractExpiryDate` date DEFAULT NULL,
  `EmploymentType` varchar(75) DEFAULT NULL,
  `Branch` varchar(75) DEFAULT NULL,
  `Department` varchar(75) DEFAULT NULL,
  `Designation` varchar(75) DEFAULT NULL,
  `State` varchar(75) DEFAULT NULL,
  `PensionProvider` varchar(75) DEFAULT NULL,
  `Bank` varchar(75) DEFAULT NULL,
  `Gender` varchar(25) DEFAULT NULL,
  `MaritalStatus` varchar(25) DEFAULT NULL,
  `StateofOrigin` varchar(75) DEFAULT NULL,
  `Lga` varchar(75) DEFAULT NULL,
  `Religion` varchar(25) DEFAULT NULL,
  `DirectManager` varchar(75) DEFAULT NULL,
  `PeriodOfContract` varchar(75) DEFAULT NULL,
  `ContractExpirationDate` date DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `PK_Employee` (`EmployeeID`),
  KEY `IX_Relationship20` (`GradeID`),
  KEY `IX_Relationship21` (`GradeLevelID`),
  KEY `IX_Relationship22` (`UnitID`),
  KEY `IX_Relationship23` (`CompanyID`),
  KEY `IX_Relationship24` (`BranchID`),
  KEY `IX_Relationship25` (`StateID`),
  KEY `IX_Relationship26` (`DepartmentID`),
  KEY `IX_Relationship27` (`DesignationID`),
  KEY `IX_Relationship28` (`StatusID`),
  KEY `FK_Employee_Bank` (`BankID`),
  KEY `FK_Employee_City` (`CityID`),
  KEY `FK_Employee_Country` (`NationalityID`),
  KEY `FK_Employee_EmployeeTitle` (`EmployeeTitleID`),
  KEY `FK_Employee_EmployeeType` (`EmployeeTypeID`),
  KEY `FK_Employee_Gender` (`GenderID`),
  KEY `FK_Employee_Lga` (`LgaID`),
  KEY `FK_Employee_MaritalStatus` (`MaritalStatusID`),
  KEY `FK_Employee_PensionProvider` (`PensionProviderID`),
  KEY `FK_Employee_Religion` (`ReligionID`),
  KEY `FK_Employee_States` (`StateofOriginID`),
  KEY `EmployeeStatusID` (`EmployeeStatusID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`GradeID`) REFERENCES `grades` (`GradeID`),
  CONSTRAINT `employee_ibfk_10` FOREIGN KEY (`StateofOriginID`) REFERENCES `state` (`state_id`),
  CONSTRAINT `employee_ibfk_11` FOREIGN KEY (`LgaID`) REFERENCES `local_govt` (`local_govt_id`),
  CONSTRAINT `employee_ibfk_12` FOREIGN KEY (`EmployeeTypeID`) REFERENCES `employeetype` (`EmployeeTypeID`),
  CONSTRAINT `employee_ibfk_13` FOREIGN KEY (`PensionProviderID`) REFERENCES `pensionprovider` (`PensionProviderID`),
  CONSTRAINT `employee_ibfk_14` FOREIGN KEY (`MaritalStatusID`) REFERENCES `maritalstatus` (`MaritalStatusID`),
  CONSTRAINT `employee_ibfk_15` FOREIGN KEY (`GenderID`) REFERENCES `gender` (`GenderID`),
  CONSTRAINT `employee_ibfk_16` FOREIGN KEY (`ReligionID`) REFERENCES `religion` (`ReligionID`),
  CONSTRAINT `employee_ibfk_17` FOREIGN KEY (`EmployeeStatusID`) REFERENCES `statuses` (`StatusID`),
  CONSTRAINT `employee_ibfk_18` FOREIGN KEY (`BankID`) REFERENCES `bank` (`BankID`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`GradeLevelID`) REFERENCES `gradelevels` (`GradeLevelID`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`UnitID`) REFERENCES `units` (`UnitID`),
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`CompanyID`) REFERENCES `company` (`CompanyID`),
  CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`BranchID`) REFERENCES `branches` (`BranchID`),
  CONSTRAINT `employee_ibfk_6` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`),
  CONSTRAINT `employee_ibfk_7` FOREIGN KEY (`DesignationID`) REFERENCES `designations` (`DesignationID`),
  CONSTRAINT `employee_ibfk_8` FOREIGN KEY (`EmployeeTitleID`) REFERENCES `employeetitle` (`EmployeeTitleID`),
  CONSTRAINT `employee_ibfk_9` FOREIGN KEY (`NationalityID`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8;

/*Data for the table `employee` */

insert  into `employee`(`EmployeeID`,`SurName`,`FirstName`,`MiddleName`,`EmployeeTitleID`,`FullName`,`Email`,`EmployeeNumber`,`GradeID`,`GradeLevelID`,`EmployeeTypeID`,`BranchID`,`CompanyID`,`DepartmentID`,`UnitID`,`DesignationID`,`StateID`,`StatusID`,`PensionProviderID`,`PensionPIN`,`BankID`,`BankAccountNo`,`NHFNo`,`GenderID`,`MaritalStatusID`,`DateOfBirth`,`ResidentialAddress`,`HomeNum`,`MobileNum`,`NationalityID`,`StateofOriginID`,`LgaID`,`CityID`,`ReligionID`,`Tribe`,`Hobbies`,`PersonalEmail`,`EmployeeStatusID`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`,`Trade`,`IdentificationID`,`IdentificationNumber`,`IdentificationStartDate`,`IdentificationExpiryDate`,`PermanentAddress`,`StaffCategoryID`,`ProjectID`,`EmploymentDate`,`ContractExpiryDate`,`EmploymentType`,`Branch`,`Department`,`Designation`,`State`,`PensionProvider`,`Bank`,`Gender`,`MaritalStatus`,`StateofOrigin`,`Lga`,`Religion`,`DirectManager`,`PeriodOfContract`,`ContractExpirationDate`) values 
(124,'Timson','Keston','Kay',8,'Timson','keston@gmail.com','0123456',1,8,7,NULL,1,5,NULL,2,NULL,1,NULL,NULL,NULL,NULL,NULL,5,7,'2020-04-17',NULL,NULL,'08148117066',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,'2020-04-17 22:29:15',NULL,'2020-04-17 22:29:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(125,'Timson','Keston','Kay',8,'Keston','keston@gmail.com','0123456',1,9,7,NULL,1,5,NULL,8,NULL,1,NULL,NULL,NULL,NULL,NULL,5,7,'2020-04-17',NULL,NULL,'08148117066',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,'2020-04-17 22:40:16',NULL,'2020-04-17 22:40:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(126,'Timson','Keston','Kay',8,'Timson','keston@gmail.com','0123456',1,10,7,NULL,1,5,NULL,1,NULL,1,NULL,NULL,NULL,NULL,NULL,5,7,'2020-04-18',NULL,NULL,'08148117066',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,'2020-04-18 06:31:55',NULL,'2020-04-18 06:31:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(127,'Timson','Keston 127','Kay',8,'Timson, Keston Kay','keston@gmail.com','0123456',1,11,7,NULL,1,5,NULL,NULL,NULL,1,1,NULL,1,'0123456',NULL,5,7,'2020-04-18','Address',NULL,'08148117066',151,4210,205,NULL,1,'Tribe','Hobby, Hobby',NULL,1,0,'2020-04-18 06:32:36',0,'2020-04-18 19:11:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(128,'Timson','Keston','Kay',8,'Timson, Keston Kay','keston1@gmail.com','0123456',1,12,7,NULL,1,5,NULL,NULL,NULL,1,1,NULL,3,'0123456',NULL,5,7,'2020-04-18','Address',NULL,'08148117066',151,4210,205,NULL,1,'Tribe','Hobby',NULL,1,0,'2020-04-18 07:33:52',0,'2020-04-18 18:35:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(129,'Onyilo','Joseph',NULL,NULL,'Joseph Onyilo',NULL,NULL,1,13,8,NULL,1,6,NULL,NULL,NULL,1,3,NULL,1,'0123456',NULL,6,8,'1998-02-23','Address',NULL,NULL,151,4210,205,NULL,5,'Tribe','Hobby',NULL,1,0,'2020-04-18 07:35:26',0,'2020-04-18 17:13:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(130,'Onyilo','Joe',NULL,NULL,'Joe Onyilo',NULL,NULL,1,14,8,NULL,1,7,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,6,8,'1998-02-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2020-05-05 14:55:06',NULL,'2020-05-05 14:55:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(131,'Akpata','Sam ',NULL,NULL,'Sam Akpata',NULL,NULL,1,10,8,NULL,1,7,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,6,8,'1998-02-23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2020-05-05 14:55:45',NULL,'2020-05-05 14:55:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(132,'Onyilo','Joseph','df',8,NULL,'onyilo@gmail.com','dfd',1,8,9,1,1,5,1,1,NULL,1,1,NULL,6,'dafda','dafda',5,7,'2000-05-11','22 CC NWUCHE STREET PHASE II TRADEMORE ESTATE','dfad','08082784782',151,4203,39,NULL,1,'fdafd','dafda',NULL,NULL,126,'2020-05-28 23:27:31',NULL,'2020-05-28 23:27:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(133,'Abou Fakher','Saleem',' ',8,NULL,'saleemaboufakher@teamnigeria.com','0001',1,8,7,1,1,10,2,22,NULL,1,1,NULL,1,'dfafdaf',NULL,5,7,'1993-09-29','Team','0502','020',151,4207,121,NULL,2,'dfs','dsfd',NULL,NULL,126,'2020-06-01 15:02:12',NULL,'2020-06-01 15:02:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(134,'Jackson','James',NULL,8,NULL,'email@email.com','emp-0022',1,8,7,1,1,5,1,1,NULL,NULL,1,NULL,1,'0123456789','nhf-2145',5,7,'2020-06-30','Address','08148117066','08148117066',151,4201,1,NULL,1,'Tribal','Hobbies',NULL,NULL,125,'2020-06-30 10:33:47',NULL,'2020-06-30 10:33:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(135,'Timson','Keston','Kay',8,NULL,'keston@gmail.com','0123456789',1,8,7,1,1,5,1,1,NULL,NULL,1,NULL,1,'9876543210','0123456789',5,7,'2020-07-12','Address','08148117066','08148117066',151,4201,1,NULL,1,'Job Title','hobbies',NULL,1,125,'2020-07-12 17:22:59',NULL,'2020-07-12 17:22:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(136,'Oseni','Yusuf',NULL,NULL,NULL,NULL,'TN/P-SS/007',NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1980-03-04','Behind Busy Brain Suleja',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Auchi',NULL,NULL,NULL,NULL,'2020-07-17 11:45:51',NULL,'2020-07-17 11:45:51',NULL,NULL,NULL,NULL,NULL,'Behind Busy Brain Suleja',NULL,NULL,'2008-04-01',NULL,NULL,'Abuja Head Office','Archive','Archivist','Edo',NULL,NULL,'Male','Married','Edo','Etsako','Muslim',NULL,NULL,NULL),
(137,'Adejo','Mercy','Oluwaseun',NULL,NULL,NULL,'TN/P-SS008',NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1983-11-26','85, Old Karu Rd Off Abacha Rd Maraba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yoruba',NULL,NULL,NULL,NULL,'2020-07-17 11:45:52',NULL,'2020-07-17 11:45:52',NULL,NULL,NULL,NULL,NULL,'85, Old Karu Rd Off Abacha Rd Maraba',NULL,NULL,'2009-07-17',NULL,NULL,'Abuja Head Office','Admin','Snr. Secretary','Ondo',NULL,NULL,'Female','Married','Ondo','Ondo','Christianity',NULL,NULL,NULL),
(138,'Ibrahim','Adamu',NULL,NULL,NULL,NULL,'TN/P-SS22/IA',NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1975-09-28','10 , balarabe Str. Kano',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-17 11:45:52',NULL,'2020-07-17 11:45:52',NULL,NULL,NULL,NULL,NULL,'10b, Balarabe Str. Kano',NULL,NULL,'2011-06-06',NULL,NULL,'Abuja Head Office','Archive','Archivist','Kano',NULL,NULL,'Male','Married','Kano',NULL,'Muslim',NULL,NULL,NULL),
(139,'Atanya','Helen','Ufuoma',NULL,NULL,NULL,'TN/P/SS/8',NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1982-04-16','Blk 9, Flat 1 NYSC QRTS P. KUBWA  ABUJA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Isoko',NULL,NULL,NULL,NULL,'2020-07-17 11:45:52',NULL,'2020-07-17 11:45:52',NULL,NULL,NULL,NULL,NULL,'Blk 9, Flat 1 NYSC QRTS  P. W KUBWA ABUJA',NULL,NULL,'2017-02-06',NULL,NULL,'Abuja Head Office','Account','Account','Delta',NULL,NULL,'Female','Married','Delta','Isoko North','Christianity',NULL,NULL,NULL),
(140,'Ugwoke','Sheila','Ifeoma',NULL,NULL,NULL,'TN/P/SS18',NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1980-10-01','39 David Ejoor Estate Apo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-17 11:45:52',NULL,'2020-07-17 11:45:52',NULL,NULL,NULL,NULL,NULL,'39 David Ejoor Estate Apo',NULL,NULL,'2011-03-29',NULL,NULL,'Abuja Head Office','Admin','Confidential Sec.','Enugu',NULL,NULL,'Female','Single','Enugu',NULL,'Christianity',NULL,NULL,NULL),
(142,'Oseni','Yusuf',NULL,NULL,NULL,NULL,'TN/P-SS/007',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1980-03-04','Behind Busy Brain Suleja',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Auchi',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Behind Busy Brain Suleja',NULL,NULL,'2008-04-01',NULL,NULL,'Abuja Head Office','Archive','Archivist','Edo',NULL,NULL,'Male','Married','Edo','Etsako','Muslim',NULL,NULL,NULL),
(143,'Adejo','Mercy','Oluwaseun',NULL,NULL,NULL,'TN/P-SS008',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1983-11-26','85, Old Karu Rd Off Abacha Rd Maraba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yoruba',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'85, Old Karu Rd Off Abacha Rd Maraba',NULL,NULL,'2009-07-17',NULL,NULL,'Abuja Head Office','Admin','Snr. Secretary','Ondo',NULL,NULL,'Female','Married','Ondo','Ondo','Christianity',NULL,NULL,NULL),
(144,'Ibrahim','Adamu',NULL,NULL,NULL,NULL,'TN/P-SS22/IA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1975-09-28','10 , balarabe Str. Kano',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'10b, Balarabe Str. Kano',NULL,NULL,'2011-06-06',NULL,NULL,'Abuja Head Office','Archive','Archivist','Kano',NULL,NULL,'Male','Married','Kano',NULL,'Muslim',NULL,NULL,NULL),
(145,'Atanya','Helen','Ufuoma',NULL,NULL,NULL,'TN/P/SS/8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1982-04-16','Blk 9, Flat 1 NYSC QRTS P. KUBWA  ABUJA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Isoko',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Blk 9, Flat 1 NYSC QRTS  P. W KUBWA ABUJA',NULL,NULL,'2017-02-06',NULL,NULL,'Abuja Head Office','Account','Account','Delta',NULL,NULL,'Female','Married','Delta','Isoko North','Christianity',NULL,NULL,NULL),
(146,'Ugwoke','Sheila','Ifeoma',NULL,NULL,NULL,'TN/P/SS18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1980-10-01','39 David Ejoor Estate Apo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'39 David Ejoor Estate Apo',NULL,NULL,'2011-03-29',NULL,NULL,'Abuja Head Office','Admin','Confidential Sec.','Enugu',NULL,NULL,'Female','Single','Enugu',NULL,'Christianity',NULL,NULL,NULL),
(147,'Oyetayo','Folarin','Anthony',NULL,NULL,NULL,'TN/P/SS133',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1985-04-01','Plot 2544 Mobolaji Johnson Gudu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Plot 2544 Mobolaji Johnson Gudu',NULL,NULL,'2019-01-02',NULL,NULL,'Abuja Head Office','Admin','Asst. Personnel','Lagos',NULL,NULL,'Male','Single','Lagos','Surulere','Christianity',NULL,NULL,NULL),
(148,'Okonkwo','Anthony','Ifeanyi',NULL,NULL,NULL,'TN/P/SS170',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1980-12-16','Mayor Str. One-man village Karu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Igbo',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Mayor Str. One-man village karu',NULL,NULL,'2019-10-14',NULL,NULL,'Abuja Head Office','Account','Snr. Admin','Delta',NULL,NULL,'Male','Married','Delta','Oshimili North','Christianity',NULL,NULL,NULL),
(149,'Oloruntoba','Usman',NULL,NULL,NULL,NULL,'TN/P/SS77',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1960-02-02','Doveland Global Academy Suleja',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Okun',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Doveland Global Academy Suleja',NULL,NULL,'2017-08-10',NULL,NULL,'Abuja Head Office','Admin','Snr. H.R','Kogi',NULL,NULL,'Male','Married','Kogi','Yagba East','Christianity',NULL,NULL,NULL),
(150,'Chimeh','Chukwuebuka','Rita',NULL,NULL,NULL,'TN/P/SS186',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1993-04-26','plot 419  1423 road Gwarimpa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Plot 419, 1423 road Gwarimpa',NULL,NULL,'2020-03-16',NULL,NULL,'Abuja Head Office','Technical','Architect','Enugu',NULL,NULL,'Female','Single','Enugu',NULL,'Christianity',NULL,NULL,NULL),
(151,'Udousoro','Richard','Joseph',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1983-01-11','Plot 753 s.o okpe street Apo zone A ext ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Anang',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Plot 753 s.o okpe street Apo zone A ext ',NULL,NULL,'2020-06-01',NULL,NULL,'Abuja Head Office','Logistics','I.T/Logistics','Akwa-Ibom',NULL,NULL,'Male','Married','Akwa-Ibom','Ikot ekpene','Christianity',NULL,NULL,NULL),
(152,'Eyoh ','Etim','Akpan',NULL,NULL,NULL,'TN/P/JS40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1960-09-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ibibio',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-21',NULL,NULL,'Abuja Head Office','House \'\'A\'\'','Cook/Steward','Akwa- Ibom',NULL,NULL,'Male','Married','Akwa- Ibom','Ikono','Christianity',NULL,NULL,NULL),
(153,'Obi','Martins',NULL,NULL,NULL,NULL,'TN/P/JS35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-02-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Abuja Head Office','M.D Res.','Steward',NULL,NULL,NULL,'Male','Married',NULL,NULL,NULL,NULL,NULL,NULL),
(154,'Uyannah','Joseph',NULL,NULL,NULL,NULL,'TN/P/JS84',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1963-04-17','Karmo Sabo Behind E.C.W.A Abuja',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Karmo Sabo Behind E.C.W.A Abuja',NULL,NULL,'2011-05-09',NULL,NULL,'Abuja Head Office','Stattis  Res.','Cook/Steward','Cross-River',NULL,NULL,'Male','Married','Cross-River','Obaniku','Christianity',NULL,NULL,NULL),
(155,'Okurishi','Christiana',NULL,NULL,NULL,NULL,'TN/P/JS6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1984-04-28','Behind Dunamis Church Mopol Qrts Kabayi Maraba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Boki',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Behind Dunamis church Mopol Qrts Kabayi Maraba',NULL,NULL,'2009-10-06',NULL,NULL,'Abuja Head Office','Kicthenette','Steward','Cross-River',NULL,NULL,'Female','Married','Cross-River','Boki','Christianity',NULL,NULL,NULL),
(156,'Timothy','Femi','Godwin',NULL,NULL,NULL,'TN/P/JS41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1962-07-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Okun',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Behind Pry School Tungamaji Gwagwalada',NULL,NULL,'2015-03-25',NULL,NULL,'Abuja Head Office','Logistics','Driver','Kogi',NULL,NULL,'Male','Married','Kogi','Kabba/bunu','Christianity',NULL,NULL,NULL),
(157,'Oseni','Muhammad','Jimoh',NULL,NULL,NULL,'TN/P/JS22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6551322100',NULL,NULL,NULL,'1985-11-16','57 New Site Tunga Maji Gwagwalada',NULL,'8075997928',NULL,NULL,NULL,NULL,NULL,'Jagbe',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'57 New Site Tunga Maji Gwagwalada',NULL,NULL,'2016-03-01',NULL,'Regular','Abuja Head Office','Admin','Office Attendant','Edo',NULL,'Fidelity','Male','Single','Edo','Etsako','Islam',NULL,NULL,NULL),
(158,'Afo','Anthony','Okpashi',NULL,NULL,NULL,'TN/P/JS84',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1979-06-08','56 A, Pegi Estate kuje Abuja.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Bekwarra',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'56 A, Pegi Estate Kuje Abuja.',NULL,NULL,'2017-05-11',NULL,NULL,'Abuja Head Office','Logistics','Driver','Cross-River',NULL,NULL,'Male','Married','Cross-River','Bekwarra','Christianity',NULL,NULL,NULL),
(159,'Nwogbu','Chinenye','Chioma',NULL,NULL,NULL,'TN/P/JS029',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'26370737',NULL,NULL,NULL,'1980-10-23','House 161, Zone B  Apo Abuja',NULL,'8037870505',NULL,NULL,NULL,NULL,NULL,'Igbo',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'House 161 Zone B Apo Abuja',NULL,NULL,'2018-05-14',NULL,'Regular','Abuja Head Office','Admin','Receptionist','Anambra','Sigma Pensions','G.T.B','Female','Single','Anambra','Idemili North','Christianity',NULL,NULL,NULL),
(160,'Samuel','Joseph',NULL,NULL,NULL,NULL,'TN/P/JS46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1991-07-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Gbagyi',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Airport Road Zhidu Village F.C.T Abuja',NULL,NULL,'2017-03-23',NULL,NULL,'Abuja Head Office','Logistics','Driver','F.C.T Abj Zhidu',NULL,NULL,'Male','Married','F.C.T Abj Zhidu','Kabusa','Christianity',NULL,NULL,NULL),
(161,'Adejugbe','Gbenga',NULL,NULL,NULL,NULL,'TN/P/JS37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1979-04-14','Igbole Ile Ojomo Ekiti',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yoruba',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Igbole Ile Ojomo Ekiti',NULL,NULL,NULL,NULL,NULL,'Abuja Head Office','Logistics','Driver','Ekiti',NULL,NULL,'Male','Married','Ekiti','Idu-Osi','Christianity',NULL,NULL,NULL),
(162,'Zakari','Isiaka',NULL,NULL,NULL,NULL,'TN/P/JS94',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1981-03-16','Old Karu opp Holy Child Academy Mararaba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Igala',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Old Karu Opp Holy Child Academy Mararaba',NULL,NULL,'2018-10-06',NULL,NULL,'Abuja Head Office','Logistics','Driver','Kogi',NULL,NULL,'Male','Married','Kogi','Ankpa','Muslim',NULL,NULL,NULL),
(163,'Okpanachi','Audu',NULL,NULL,NULL,NULL,'TN/P/JS36',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1982-03-15','Dape Life Camp Abuja',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Igala',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Dape Life Camp Abuja',NULL,NULL,'2013-11-01',NULL,NULL,'Abuja Head Office','Logistics','Driver','Kogi',NULL,NULL,'Male','Married','Kogi','Dekina','Christianinty',NULL,NULL,NULL),
(164,'Ojo','Moses','Adetunji',NULL,NULL,NULL,'TN/P/JS44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1981-11-12','Old Maitama, By Tommy Guest inn, Kubwa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Old Maitama, By tommy Guest inn, Kubwa',NULL,NULL,'2017-02-16',NULL,NULL,'Abuja Head Office','Logistics','Maintenance',NULL,NULL,NULL,'Male','Married',NULL,NULL,NULL,NULL,NULL,NULL),
(165,'Isah','Yakubu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1975-02-01','Gati Lapai Local Govt Niger State',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nupe',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Gati Lapai Local Govt Niger State',NULL,NULL,NULL,NULL,NULL,'Abuja Head Office',NULL,'Driver','Niger',NULL,NULL,'Male','Married','Niger','Lapai','Muslim',NULL,NULL,NULL),
(166,'Musa','Jimoh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1955-03-25','12 Peace Qrts Anuagboro Gauraka Niger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ivie',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'12 Peace Qrts Anguaboro Gauraka Niger State',NULL,NULL,NULL,NULL,NULL,'Abuja Head Office','Logistics','Driver','Edo',NULL,NULL,'Male','Married','Edo','Itsako East','Muslim',NULL,NULL,NULL),
(167,'Egbuka','Tobechukwu','Alex',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1992-05-12','132 Aminu Kano Crescent Wuse 2 Abuja',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ezinihiette',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'132 Aminu Kano Crescent Wuse 2 Abuja',NULL,NULL,'2014-03-10',NULL,NULL,'Abuja Head Office',NULL,'Steward','Imo',NULL,NULL,'Male','Single','Imo','Mbaise','Christian',NULL,NULL,NULL),
(168,'Kouhouede','Godfroid','vidjannagni',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1979-01-11','Glo Junction Aminu Kano Crescent',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Glo Junction Aminu Kano Crescent',NULL,NULL,'2014-10-22',NULL,NULL,'Abuja Head Office',NULL,'Steward',NULL,NULL,NULL,'Male','Married',NULL,NULL,NULL,NULL,NULL,NULL),
(169,'Kayode','Olajide','Adeshina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1975-10-04','27 Ajakaiye Ojo Lagos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yoruba',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'27 Ajakaiye Ojo Lagos',NULL,NULL,'2020-02-06',NULL,NULL,'Abuja Head Office','Logistics','Driver','Ondo',NULL,NULL,'Male','Married','Ondo','Ifedore','Christian',NULL,NULL,NULL),
(170,'Nwaka','Stanley','Ekene',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1988-07-04','8 Lagos Street Basa Aviation Village',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Igbo',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'8 Lagos Street Basa Aviation Village',NULL,NULL,'2020-03-18',NULL,NULL,'Abuja Head Office','Logistics','Driver','Anambra',NULL,NULL,'Male','Married','Anambra','Awka North','Christian',NULL,NULL,NULL),
(171,'Dari','Abdullahi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1960-05-15','10 Sanusi Idris Street Tudun wada sabon Wuse',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hausa',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'10 sanusi Idris Street Tudun wada Sabon Wuse',NULL,NULL,'2020-01-23',NULL,NULL,'Abuja Head Office','Guest House','Chef','Zamfara',NULL,NULL,'Male','Married','Zamfara','Talamafara','Islam',NULL,NULL,NULL),
(172,'Utume','Terkura','Edward',NULL,NULL,NULL,'TN/P/DS179/UTE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1987-10-09','Mbaikpe Igyom Ikurav-ya adikpo Benue',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Tiv',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'mbaikpe igyom ikurav-ya  adikpo Benue',NULL,NULL,'2019-11-01',NULL,NULL,'Abuja Head Office','Garden House','Gardener','Benue',NULL,NULL,'male','Single','Benue','Kwande','Christian',NULL,NULL,NULL),
(173,'Umar','Abubakar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1965-09-10','dandagoro Katsina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hausa',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Dandagoro katsina',NULL,NULL,'2020-01-29',NULL,NULL,'Abuja Head Office','Guest House','Cook/Steward','Zamfara State',NULL,NULL,'Male','Married','Zamfara State','Talata mafara','Islam',NULL,NULL,NULL),
(174,'Mansur','Muhammad',NULL,NULL,NULL,NULL,'TN/P-DS190',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1120424616',NULL,NULL,NULL,'1968-10-27','Sabon wuse Tudun wada niger State',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Hausa',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Sabon wuse tudun wada Niger state',NULL,NULL,'2020-03-11',NULL,NULL,'Abuja Head Office','Guest House','Cook/Steward','Katsina',NULL,'Polaris','Male','Married','Katsina','Jibiya','Islam',NULL,NULL,NULL),
(175,'Phillip','Mavis','Ifeyinwa',NULL,NULL,NULL,'TN/P-DS191/MP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1980-06-19','Plot 3017 F01 Kubwa Extension',NULL,'9052693800',NULL,NULL,NULL,NULL,NULL,'Igbo',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Plot 3017 F01 Kubwa Extension',NULL,NULL,'2020-06-01',NULL,'Contract','Abuja Head Office','Saleems Res.','Cook/Steward','Delta State',NULL,NULL,'Female','Married','Delta State','Ndokwa East','Christian',NULL,NULL,NULL),
(176,'Adamu','Sa\'ad',NULL,NULL,NULL,NULL,'TN/P-DS193/AS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'PEN100088241714',NULL,'1120424726',NULL,NULL,NULL,'1978-02-28','TEAM Quaters, 34 Port Harcourt Crescent Garki Area 11',NULL,'8135446936',NULL,NULL,NULL,NULL,NULL,'Fulani',NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,'Bye Pass Quaters, Gombe',NULL,NULL,'2020-06-29',NULL,'Contract','Abuja Head Office','Guest House','Cook/Steward','Gombe State','SIGMA Pensions','Polaris Bank','Male','Married','Gombe State','Gombe ','Islam',NULL,NULL,NULL),
(177,'Dan-Baba','Zaphaniah',NULL,NULL,NULL,NULL,'TN/DS/192/ZD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1997-07-12','Apo Primary School, Rock View Estate.',NULL,'7063351640',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-17 11:47:08',NULL,'2020-07-17 11:47:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-06-15',NULL,'Contract','Abuja Head Office','Adekunles Res','Steward','Gombe State',NULL,NULL,'Male','Married','Gombe State','Billiri','Christian',NULL,NULL,NULL),
(178,'Timson','Keston','Kay',8,NULL,'keston@gmail.com','0123456789',1,8,7,1,1,5,1,1,NULL,NULL,1,NULL,1,'9876543210','0123456789',5,7,'2020-07-12','Address','08148117066','08148117066',151,4201,1,NULL,1,'Tribal','hobbies',NULL,1,125,'2020-07-18 00:54:02',NULL,'2020-07-18 00:54:02',NULL,1,'01212541221','2020-07-18','2020-07-18','Permanent Address',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(179,'Timson','Keston','Kay',8,NULL,'keston@gmail.com','0123456789',1,8,7,1,1,5,1,1,NULL,NULL,1,NULL,1,'9876543210','0123456789',5,7,'2020-07-12','Address','08148117066','08148117066',151,4201,1,NULL,1,'Tribal','hobbies',NULL,1,125,'2020-07-18 00:57:21',NULL,'2020-07-18 00:57:21',NULL,1,'01212541221','2020-07-18','2020-07-18','Permanent Address',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(180,'Timson','Keston','Kay',8,NULL,'keston@gmail.com','0123456789',1,8,7,1,1,5,1,1,NULL,NULL,1,NULL,1,'9876543210','0123456789',5,7,'2020-07-12','Address','08148117066','08148117066',151,4201,1,NULL,1,'Tribal','hobbies',NULL,1,125,'2020-07-18 01:03:33',NULL,'2020-07-18 01:03:33',NULL,1,'01212541221','2020-07-18','2020-07-18','Permanent Address',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(181,'Timson','Keston','Kay',8,NULL,'keston@gmail.com','0123456789',1,8,7,1,1,5,1,1,NULL,NULL,1,NULL,1,'9876543210','0123456789',5,7,'2020-07-12','Address','08148117066','08148117066',151,4201,1,NULL,1,'Tribal','hobbies',NULL,1,125,'2020-07-18 01:04:09',NULL,'2020-07-18 01:04:09',NULL,1,'01212541221','2020-07-18','2020-07-18','Permanent Address',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(182,'Timson','Keston','Kay',8,NULL,'keston@gmail.com','0123456789',1,8,7,1,1,5,1,1,NULL,NULL,1,NULL,1,'9876543210','0123456789',5,7,'2020-07-12','Address','08148117066','08148117066',151,4201,1,NULL,1,'Tribal','hobbies',NULL,1,125,'2020-07-18 01:05:09',NULL,'2020-07-18 01:05:09',NULL,1,'01212541221','2020-07-18','2020-07-18','Permanent Address',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(183,'Timson','Keston','Kay',8,NULL,'keston@gmail.com','0123456789',1,8,7,1,1,5,1,1,NULL,NULL,1,NULL,1,'9876543210','0123456789',5,7,'2020-07-12','Address','08148117066','08148117066',151,4201,1,NULL,1,'Tribal','hobbies',NULL,1,125,'2020-07-18 01:06:13',NULL,'2020-07-18 01:06:13',NULL,1,'01212541221','2020-07-18','2020-07-18','Permanent Address',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(184,'Timson','Keston','Kay',8,NULL,'keston@gmail.com','0123456789',1,8,7,1,1,5,1,1,NULL,NULL,1,NULL,1,'9876543210','0123456789',5,7,'2020-07-12','Address','08148117066','08148117066',151,4201,1,NULL,1,'Tribal','hobbies',NULL,1,125,'2020-07-18 01:08:26',NULL,'2020-07-18 01:08:26',NULL,1,'01212541221','2020-07-18','2020-07-18','Permanent Address',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(185,'Timson','Keston','Kay',8,NULL,'keston@gmail.com','0123456789',1,8,7,1,1,5,1,1,NULL,NULL,1,NULL,1,'9876543210','0123456789',5,7,'2020-07-12','Address','08148117066','08148117066',151,4201,1,NULL,1,'Tribal','hobbies',NULL,1,125,'2020-07-18 01:09:23',NULL,'2020-07-18 01:09:23',NULL,1,'01212541221','2020-07-18','2020-07-18','Permanent Address',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(186,'Timson','Keston','Kay',8,NULL,'keston@gmail.com','0123456789',1,8,7,1,1,5,1,1,NULL,NULL,1,NULL,1,'9876543210','0123456789',5,7,'2020-07-12','Address','08148117066','08148117066',151,4201,1,NULL,1,'Tribal','hobbies',NULL,1,125,'2020-07-18 01:21:54',NULL,'2020-07-18 01:21:54',NULL,1,'024512','2020-07-18','2020-07-18','Permanent Address',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(187,'Timson','Keston','Kay',8,NULL,'keston@gmail.com','0123456789',1,8,7,1,1,5,1,1,NULL,NULL,1,NULL,1,'9876543210','0123456789',5,7,'2020-07-12','Address','08148117066','08148117066',151,4201,1,NULL,1,'Tribal','hobbies',NULL,1,125,'2020-07-18 01:35:04',NULL,'2020-07-18 01:35:04',NULL,1,'021457845','2020-07-18','2020-07-18','Permanent Address',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `employeedependent` */

DROP TABLE IF EXISTS `employeedependent`;

CREATE TABLE `employeedependent` (
  `EmployeeDependentID` int(11) NOT NULL AUTO_INCREMENT,
  `Surname` varchar(75) DEFAULT NULL,
  `FirstName` varchar(75) DEFAULT NULL,
  `DateofBirth` date DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` datetime DEFAULT current_timestamp(),
  `EmployeeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EmployeeDependentID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `employeedependent` */

insert  into `employeedependent`(`EmployeeDependentID`,`Surname`,`FirstName`,`DateofBirth`,`Address`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`,`EmployeeID`) values 
(1,NULL,NULL,NULL,NULL,125,'2020-07-18 01:05:09',NULL,'2020-07-18 01:05:09',182),
(2,NULL,NULL,NULL,NULL,125,'2020-07-18 01:06:14',NULL,'2020-07-18 01:06:14',183),
(3,NULL,NULL,NULL,NULL,125,'2020-07-18 01:08:26',NULL,'2020-07-18 01:08:26',184),
(4,NULL,NULL,NULL,NULL,125,'2020-07-18 01:09:23',NULL,'2020-07-18 01:09:23',185),
(5,NULL,NULL,NULL,NULL,125,'2020-07-18 01:21:54',NULL,'2020-07-18 01:21:54',186),
(6,'Pete','Micheal','2020-07-12','Address',125,'2020-07-18 01:35:04',NULL,'2020-07-18 01:35:04',187);

/*Table structure for table `employeedeployment` */

DROP TABLE IF EXISTS `employeedeployment`;

CREATE TABLE `employeedeployment` (
  `EmployeeDeploymentID` int(10) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(10) DEFAULT NULL,
  `CompanyID` int(10) DEFAULT NULL,
  `BranchID` int(10) DEFAULT NULL,
  `DepartmentID` int(10) DEFAULT NULL,
  `UnitID` int(10) DEFAULT NULL,
  `DesignationID` int(10) DEFAULT NULL,
  `GradeID` int(10) DEFAULT NULL,
  `JobDescription` text DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeDeploymentID`),
  UNIQUE KEY `PK_EmployeeDeployment` (`EmployeeDeploymentID`),
  KEY `FK_EmployeeDeployment_Branches` (`BranchID`),
  KEY `FK_EmployeeDeployment_Company` (`CompanyID`),
  KEY `FK_EmployeeDeployment_Departments` (`DepartmentID`),
  KEY `FK_EmployeeDeployment_Designations` (`DesignationID`),
  KEY `FK_EmployeeDeployment_Employee` (`EmployeeID`),
  KEY `FK_EmployeeDeployment_Grades` (`GradeID`),
  KEY `FK_EmployeeDeployment_Units` (`UnitID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `employeedeployment` */

insert  into `employeedeployment`(`EmployeeDeploymentID`,`EmployeeID`,`CompanyID`,`BranchID`,`DepartmentID`,`UnitID`,`DesignationID`,`GradeID`,`JobDescription`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(2,128,1,2,5,1,1,1,'Description',0,'2020-04-19 07:40:10.000000',NULL,NULL),
(3,127,1,2,6,2,1,1,'Job',0,'2020-04-19 14:43:20.000000',NULL,NULL);

/*Table structure for table `employeedesignation` */

DROP TABLE IF EXISTS `employeedesignation`;

CREATE TABLE `employeedesignation` (
  `EmployeeDesignationID` int(10) NOT NULL AUTO_INCREMENT,
  `EmployeeDesignation` varchar(50) DEFAULT NULL,
  `ReportToID` int(10) DEFAULT NULL,
  `DesignationCategoryID` int(10) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeDesignationID`),
  UNIQUE KEY `PK_EmployeeDesignation` (`EmployeeDesignationID`),
  KEY `IX_Relationship27` (`DesignationCategoryID`),
  CONSTRAINT `Relationship_r27` FOREIGN KEY (`DesignationCategoryID`) REFERENCES `designationcategory` (`DesignationCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employeedesignation` */

/*Table structure for table `employeeeducation` */

DROP TABLE IF EXISTS `employeeeducation`;

CREATE TABLE `employeeeducation` (
  `EducationID` int(10) NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) DEFAULT NULL,
  `SchoolName` text DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `SchoolTypeID` int(10) DEFAULT NULL,
  `ProgrammeTypeID` int(10) DEFAULT NULL,
  `QualificationID` int(10) DEFAULT NULL,
  `QualificationGradeID` int(10) DEFAULT NULL,
  `EmployeeID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`EducationID`),
  UNIQUE KEY `PK_EmployeeEducation` (`EducationID`),
  KEY `IX_Relationship32` (`SchoolTypeID`),
  KEY `IX_Relationship33` (`ProgrammeTypeID`),
  KEY `IX_Relationship34` (`QualificationID`),
  KEY `IX_Relationship35` (`QualificationGradeID`),
  KEY `IX_Relationship36` (`EmployeeID`),
  CONSTRAINT `Relationship32` FOREIGN KEY (`SchoolTypeID`) REFERENCES `schooltypes` (`SchoolTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship33` FOREIGN KEY (`ProgrammeTypeID`) REFERENCES `programmetypes` (`ProgrammeTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship34` FOREIGN KEY (`QualificationID`) REFERENCES `qualifications` (`QualificationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship35` FOREIGN KEY (`QualificationGradeID`) REFERENCES `qualificationgrade` (`QualificationGradeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship36` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `employeeeducation` */

insert  into `employeeeducation`(`EducationID`,`Description`,`SchoolName`,`StartDate`,`EndDate`,`SchoolTypeID`,`ProgrammeTypeID`,`QualificationID`,`QualificationGradeID`,`EmployeeID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Description','School Name','2020-06-30','2020-06-30',1,1,1,1,134,NULL,'2020-06-30 10:33:47',NULL,'2020-06-30 10:33:47'),
(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,135,NULL,'2020-07-12 17:22:59',NULL,'2020-07-12 17:22:59'),
(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,178,NULL,'2020-07-18 00:54:03',NULL,'2020-07-18 00:54:03'),
(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,179,NULL,'2020-07-18 00:57:21',NULL,'2020-07-18 00:57:21'),
(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,180,NULL,'2020-07-18 01:03:33',NULL,'2020-07-18 01:03:33'),
(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,181,NULL,'2020-07-18 01:04:09',NULL,'2020-07-18 01:04:09'),
(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,182,NULL,'2020-07-18 01:05:09',NULL,'2020-07-18 01:05:09'),
(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,183,NULL,'2020-07-18 01:06:13',NULL,'2020-07-18 01:06:13'),
(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,184,NULL,'2020-07-18 01:08:26',NULL,'2020-07-18 01:08:26'),
(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,185,NULL,'2020-07-18 01:09:23',NULL,'2020-07-18 01:09:23'),
(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,186,NULL,'2020-07-18 01:21:54',NULL,'2020-07-18 01:21:54'),
(12,'Description','School Name','2020-07-12','2020-07-12',1,1,1,1,187,NULL,'2020-07-18 01:35:04',NULL,'2020-07-18 01:35:04');

/*Table structure for table `employeefamily` */

DROP TABLE IF EXISTS `employeefamily`;

CREATE TABLE `employeefamily` (
  `FamilyID` int(10) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `PhoneNumber` varchar(100) DEFAULT NULL,
  `JobTitle` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `RelationshipID` int(10) DEFAULT NULL,
  `EmployeeID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`FamilyID`),
  UNIQUE KEY `PK_EmployeeFamily` (`FamilyID`),
  KEY `IX_Relationship38` (`RelationshipID`),
  KEY `IX_Relationship39` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `employeefamily` */

/*Table structure for table `employeeguarantor` */

DROP TABLE IF EXISTS `employeeguarantor`;

CREATE TABLE `employeeguarantor` (
  `GuarantorID` int(10) NOT NULL AUTO_INCREMENT,
  `GuarantorName` varchar(100) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `PhoneNumber` varchar(100) DEFAULT NULL,
  `JobTitle` varchar(100) DEFAULT NULL,
  `Email` varchar(75) DEFAULT NULL,
  `EmployeeID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`GuarantorID`),
  UNIQUE KEY `PK_EmployeeGuarantor` (`GuarantorID`),
  KEY `IX_Relationship37` (`EmployeeID`),
  CONSTRAINT `Relationship37` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `employeeguarantor` */

insert  into `employeeguarantor`(`GuarantorID`,`GuarantorName`,`Address`,`PhoneNumber`,`JobTitle`,`Email`,`EmployeeID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Guarantor','Address','08148117066','Job','email',134,NULL,'2020-06-30 10:33:47',NULL,'2020-06-30 10:33:47'),
(2,NULL,NULL,NULL,NULL,NULL,135,NULL,'2020-07-12 17:22:59',NULL,'2020-07-12 17:22:59'),
(3,NULL,NULL,NULL,NULL,NULL,178,NULL,'2020-07-18 00:54:03',NULL,'2020-07-18 00:54:03'),
(4,NULL,NULL,NULL,NULL,NULL,179,NULL,'2020-07-18 00:57:21',NULL,'2020-07-18 00:57:21'),
(5,NULL,NULL,NULL,NULL,NULL,180,NULL,'2020-07-18 01:03:33',NULL,'2020-07-18 01:03:33'),
(6,NULL,NULL,NULL,NULL,NULL,181,NULL,'2020-07-18 01:04:09',NULL,'2020-07-18 01:04:09'),
(7,NULL,NULL,NULL,NULL,NULL,182,NULL,'2020-07-18 01:05:09',NULL,'2020-07-18 01:05:09'),
(8,NULL,NULL,NULL,NULL,NULL,183,NULL,'2020-07-18 01:06:13',NULL,'2020-07-18 01:06:13'),
(9,NULL,NULL,NULL,NULL,NULL,184,NULL,'2020-07-18 01:08:26',NULL,'2020-07-18 01:08:26'),
(10,NULL,NULL,NULL,NULL,NULL,185,NULL,'2020-07-18 01:09:23',NULL,'2020-07-18 01:09:23'),
(11,NULL,NULL,NULL,NULL,NULL,186,NULL,'2020-07-18 01:21:54',NULL,'2020-07-18 01:21:54'),
(12,'Anita Mark','Address','08148117066','Job Title','anitamark@gmail.com',187,NULL,'2020-07-18 01:35:04',NULL,'2020-07-18 01:35:04');

/*Table structure for table `employeeheathrecord` */

DROP TABLE IF EXISTS `employeeheathrecord`;

CREATE TABLE `employeeheathrecord` (
  `EmployeeHeathRecordID` int(11) NOT NULL AUTO_INCREMENT,
  `HealthInsuranceProviderID` int(11) DEFAULT NULL,
  `Hospital` varchar(75) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` datetime DEFAULT current_timestamp(),
  `EmployeeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EmployeeHeathRecordID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `employeeheathrecord` */

insert  into `employeeheathrecord`(`EmployeeHeathRecordID`,`HealthInsuranceProviderID`,`Hospital`,`Address`,`ContactNumber`,`StartDate`,`EndDate`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`,`EmployeeID`) values 
(1,NULL,NULL,NULL,NULL,NULL,NULL,125,'2020-07-18 01:06:14',NULL,'2020-07-18 01:06:14',183),
(2,NULL,NULL,NULL,NULL,NULL,NULL,125,'2020-07-18 01:08:26',NULL,'2020-07-18 01:08:26',184),
(3,NULL,NULL,NULL,NULL,NULL,NULL,125,'2020-07-18 01:09:23',NULL,'2020-07-18 01:09:23',185),
(4,NULL,NULL,NULL,NULL,NULL,NULL,125,'2020-07-18 01:21:54',NULL,'2020-07-18 01:21:54',186),
(5,1,'Default Hospital','Address','08148117066','2020-07-12','2020-07-12',125,'2020-07-18 01:35:04',NULL,'2020-07-18 01:35:04',187);

/*Table structure for table `employeeparents` */

DROP TABLE IF EXISTS `employeeparents`;

CREATE TABLE `employeeparents` (
  `ParentID` int(10) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `PhoneNumber` varchar(100) DEFAULT NULL,
  `Occupation` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `RelationshipID` int(10) DEFAULT NULL,
  `EmployeeID` int(10) DEFAULT NULL,
  `isAlive` int(11) DEFAULT NULL,
  PRIMARY KEY (`ParentID`),
  UNIQUE KEY `PK_EmployeeFamily` (`ParentID`),
  KEY `IX_Relationship38` (`RelationshipID`),
  KEY `IX_Relationship39` (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `employeeparents` */

insert  into `employeeparents`(`ParentID`,`FullName`,`Address`,`PhoneNumber`,`Occupation`,`Email`,`RelationshipID`,`EmployeeID`,`isAlive`) values 
(1,'Name','Address','Phone','Occupation','Email',1,134,1),
(2,NULL,NULL,NULL,NULL,NULL,NULL,135,1),
(3,NULL,NULL,NULL,NULL,NULL,NULL,178,1),
(4,NULL,NULL,NULL,NULL,NULL,NULL,179,1),
(5,NULL,NULL,NULL,NULL,NULL,NULL,180,1),
(6,NULL,NULL,NULL,NULL,NULL,NULL,181,1),
(7,NULL,NULL,NULL,NULL,NULL,NULL,182,1),
(8,NULL,NULL,NULL,NULL,NULL,NULL,183,1),
(9,NULL,NULL,NULL,NULL,NULL,NULL,184,1),
(10,NULL,NULL,NULL,NULL,NULL,NULL,185,1),
(11,'John Smith','Address','08148117066','Occupation','johnsmith@gmail.com',1,186,1),
(12,'John Smith','Address','08148117066','Occupation','johnsmith@gmail.com',1,187,1);

/*Table structure for table `employeereferee` */

DROP TABLE IF EXISTS `employeereferee`;

CREATE TABLE `employeereferee` (
  `EmployeeRefereeID` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) DEFAULT NULL,
  `ContactAddress` text DEFAULT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(75) DEFAULT NULL,
  `Note` text DEFAULT NULL,
  `RelationshipID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`EmployeeRefereeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `employeereferee` */

insert  into `employeereferee`(`EmployeeRefereeID`,`FullName`,`ContactAddress`,`ContactNumber`,`Email`,`Note`,`RelationshipID`,`EmployeeID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,NULL,NULL,NULL,NULL,NULL,NULL,185,125,'2020-07-18 01:09:23',NULL,'2020-07-18 01:09:23'),
(2,NULL,NULL,NULL,NULL,NULL,NULL,186,125,'2020-07-18 01:21:54',NULL,'2020-07-18 01:21:54'),
(3,'Default Dependent 1','Default Address','08148117066','dependent1@gmail.com','This is a very short note',1,187,125,'2020-07-18 01:35:04',NULL,'2020-07-18 01:35:04');

/*Table structure for table `employeereward` */

DROP TABLE IF EXISTS `employeereward`;

CREATE TABLE `employeereward` (
  `EmployeeRewardID` int(10) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(10) DEFAULT NULL,
  `RewardID` int(10) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeRewardID`),
  UNIQUE KEY `PK_EmployeeReward` (`EmployeeRewardID`),
  KEY `FK_EmployeeReward_Employee` (`EmployeeID`),
  KEY `FK_EmployeeReward_Reward` (`RewardID`),
  CONSTRAINT `FK_EmployeeReward_Employee` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_EmployeeReward_Reward` FOREIGN KEY (`RewardID`) REFERENCES `reward` (`RewardID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `employeereward` */

insert  into `employeereward`(`EmployeeRewardID`,`EmployeeID`,`RewardID`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,1,1,0,'2019-12-06 11:44:09.620000',NULL,NULL);

/*Table structure for table `employeesanction` */

DROP TABLE IF EXISTS `employeesanction`;

CREATE TABLE `employeesanction` (
  `EmployeeSanctionID` int(10) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(10) DEFAULT NULL,
  `OffenceID` int(10) DEFAULT NULL,
  `SanctionID` int(10) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeSanctionID`),
  UNIQUE KEY `PK_EmployeeSanction` (`EmployeeSanctionID`),
  KEY `FK_EmployeeSanction_Employee` (`EmployeeID`),
  KEY `FK_EmployeeSanction_Offence` (`OffenceID`),
  KEY `FK_EmployeeSanction_Sanction` (`SanctionID`),
  CONSTRAINT `FK_EmployeeSanction_Employee` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_EmployeeSanction_Offence` FOREIGN KEY (`OffenceID`) REFERENCES `offence` (`OffenceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_EmployeeSanction_Sanction` FOREIGN KEY (`SanctionID`) REFERENCES `sanction` (`SanctionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `employeesanction` */

insert  into `employeesanction`(`EmployeeSanctionID`,`EmployeeID`,`OffenceID`,`SanctionID`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,1,1,1,0,'2019-12-06 11:47:32.933000',NULL,NULL);

/*Table structure for table `employeetitle` */

DROP TABLE IF EXISTS `employeetitle`;

CREATE TABLE `employeetitle` (
  `EmployeeTitleID` int(10) NOT NULL AUTO_INCREMENT,
  `EmployeeTitle` varchar(50) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeTitleID`),
  UNIQUE KEY `PK_EmployeeTitle` (`EmployeeTitleID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `employeetitle` */

insert  into `employeetitle`(`EmployeeTitleID`,`EmployeeTitle`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(8,'Mr',0,'2020-04-17 22:19:46',NULL,NULL),
(9,'Mrs',0,'2020-04-17 22:20:41',NULL,NULL);

/*Table structure for table `employeetype` */

DROP TABLE IF EXISTS `employeetype`;

CREATE TABLE `employeetype` (
  `EmployeeTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `EmployeeType` varchar(50) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeTypeID`),
  UNIQUE KEY `PK_EmployeeType` (`EmployeeTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `employeetype` */

insert  into `employeetype`(`EmployeeTypeID`,`EmployeeType`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(7,'Contract',0,'2020-04-17 22:24:36',NULL,NULL),
(8,'Auxiliary ',0,'2020-04-17 22:24:55',NULL,NULL),
(9,'Permanent',0,'2020-04-17 22:25:08',NULL,NULL);

/*Table structure for table `employeeworkhistory` */

DROP TABLE IF EXISTS `employeeworkhistory`;

CREATE TABLE `employeeworkhistory` (
  `HistoryID` int(10) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(10) DEFAULT NULL,
  `EmployeeName` varchar(100) DEFAULT NULL,
  `Address` varchar(1000) DEFAULT NULL,
  `PhoneNumber` varchar(100) DEFAULT NULL,
  `EmailAddress` varchar(100) DEFAULT NULL,
  `JobTitle` varchar(200) DEFAULT NULL,
  `JobDescription` varchar(1000) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT NULL,
  `IsPresent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`HistoryID`),
  UNIQUE KEY `PK_EmployeeDeployment` (`HistoryID`),
  KEY `FK_EmployeeDeployment_Branches` (`Address`(255)),
  KEY `FK_EmployeeDeployment_Company` (`EmployeeName`),
  KEY `FK_EmployeeDeployment_Departments` (`PhoneNumber`),
  KEY `FK_EmployeeDeployment_Designations` (`StartDate`),
  KEY `FK_EmployeeDeployment_Employee` (`EmployeeID`),
  KEY `FK_EmployeeDeployment_Grades` (`JobTitle`),
  KEY `FK_EmployeeDeployment_Units` (`EmailAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `employeeworkhistory` */

insert  into `employeeworkhistory`(`HistoryID`,`EmployeeID`,`EmployeeName`,`Address`,`PhoneNumber`,`EmailAddress`,`JobTitle`,`JobDescription`,`StartDate`,`EndDate`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`,`IsPresent`) values 
(1,132,'Century','Wuye','0503543544','josephonyilo@yahoo.co','CFO','dafdad','2020-06-01','2020-06-18',0,'2020-06-01 11:24:26',NULL,NULL,0),
(2,134,'Employer','Address','08148117066','Email','Job','Description','2020-06-30','2020-06-30',125,'2020-06-30 10:33:47',NULL,NULL,NULL),
(3,135,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,125,'2020-07-12 17:22:59',NULL,NULL,NULL),
(4,178,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,125,'2020-07-18 00:54:03',NULL,NULL,NULL),
(5,179,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,125,'2020-07-18 00:57:21',NULL,NULL,NULL),
(6,180,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,125,'2020-07-18 01:03:33',NULL,NULL,NULL),
(7,181,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,125,'2020-07-18 01:04:10',NULL,NULL,NULL),
(8,182,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,125,'2020-07-18 01:05:09',NULL,NULL,NULL),
(9,183,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,125,'2020-07-18 01:06:14',NULL,NULL,NULL),
(10,184,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,125,'2020-07-18 01:08:26',NULL,NULL,NULL),
(11,185,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,125,'2020-07-18 01:09:23',NULL,NULL,NULL),
(12,186,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,125,'2020-07-18 01:21:54',NULL,NULL,NULL),
(13,187,'Marthin Lutter','Address','08148117066','marthinlutter@gmail.com','Programmer','Doing things','2020-07-12','2020-07-12',125,'2020-07-18 01:35:04',NULL,NULL,NULL);

/*Table structure for table `employmenttype` */

DROP TABLE IF EXISTS `employmenttype`;

CREATE TABLE `employmenttype` (
  `EmploymentTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `EmploymentType` varchar(20) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`EmploymentTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `employmenttype` */

insert  into `employmenttype`(`EmploymentTypeID`,`EmploymentType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'FULL TIME UPDATED',NULL,'2020-06-26 10:23:11',NULL,'2020-06-26 10:23:11');

/*Table structure for table `enginetype` */

DROP TABLE IF EXISTS `enginetype`;

CREATE TABLE `enginetype` (
  `EngineTypeID` int(6) NOT NULL AUTO_INCREMENT,
  `EngineType` varchar(25) DEFAULT NULL,
  `CreatedBy` int(6) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ModifiedBy` int(6) DEFAULT NULL,
  `DateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`EngineTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `enginetype` */

insert  into `enginetype`(`EngineTypeID`,`EngineType`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Fuel',0,'2020-06-08 10:13:33',NULL,'0000-00-00 00:00:00'),
(2,'Diesel',0,'2020-06-08 10:13:49',NULL,'0000-00-00 00:00:00');

/*Table structure for table `equipment` */

DROP TABLE IF EXISTS `equipment`;

CREATE TABLE `equipment` (
  `EquipmentID` int(10) NOT NULL AUTO_INCREMENT,
  `Equipment` varchar(30) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`EquipmentID`),
  UNIQUE KEY `PK_Equipment` (`EquipmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `equipment` */

/*Table structure for table `expensecategory` */

DROP TABLE IF EXISTS `expensecategory`;

CREATE TABLE `expensecategory` (
  `ExpenseCategoryID` int(10) NOT NULL AUTO_INCREMENT,
  `Expense` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ExpenseCategoryID`),
  UNIQUE KEY `PK_ExpenseCategory` (`ExpenseCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `expensecategory` */

/*Table structure for table `expenseline` */

DROP TABLE IF EXISTS `expenseline`;

CREATE TABLE `expenseline` (
  `ExpenseLineID` int(10) NOT NULL AUTO_INCREMENT,
  `ExpenseCategoryID` int(10) DEFAULT NULL,
  `ExpenseLine` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ExpenseLineID`),
  UNIQUE KEY `PK_ExpenseLine` (`ExpenseLineID`),
  KEY `IX_Relationship12` (`ExpenseCategoryID`),
  CONSTRAINT `Relationship_c12` FOREIGN KEY (`ExpenseCategoryID`) REFERENCES `expensecategory` (`ExpenseCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `expenseline` */

/*Table structure for table `experiencelevel` */

DROP TABLE IF EXISTS `experiencelevel`;

CREATE TABLE `experiencelevel` (
  `ExperienceLevelID` int(11) NOT NULL AUTO_INCREMENT,
  `ExperienceLevel` varchar(50) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ExperienceLevelID`),
  UNIQUE KEY `ExperienceLevel` (`ExperienceLevel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `experiencelevel` */

insert  into `experiencelevel`(`ExperienceLevelID`,`ExperienceLevel`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Entry Level',NULL,'2020-06-26 10:23:30',NULL,'2020-06-26 10:23:30'),
(2,'Intermediate Level',NULL,'2020-07-15 23:06:26',NULL,'2020-07-15 23:06:26'),
(3,'Senior Level',NULL,'2020-07-15 23:06:37',NULL,'2020-07-15 23:06:37');

/*Table structure for table `frequency` */

DROP TABLE IF EXISTS `frequency`;

CREATE TABLE `frequency` (
  `FrequencyID` int(6) NOT NULL AUTO_INCREMENT,
  `Frequency` varchar(25) DEFAULT NULL,
  `CreatedBy` int(6) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ModifiedBy` int(6) DEFAULT NULL,
  `DateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`FrequencyID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `frequency` */

insert  into `frequency`(`FrequencyID`,`Frequency`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Daily',0,'2020-06-08 10:17:48',NULL,'0000-00-00 00:00:00'),
(2,'Weekly',0,'2020-06-08 10:17:59',NULL,'0000-00-00 00:00:00'),
(3,'Monthly',0,'2020-06-08 10:18:09',NULL,'0000-00-00 00:00:00'),
(4,'Quarterly',0,'2020-06-08 10:18:20',NULL,'0000-00-00 00:00:00'),
(5,'Yearly',0,'2020-06-08 10:18:31',NULL,'0000-00-00 00:00:00');

/*Table structure for table `gender` */

DROP TABLE IF EXISTS `gender`;

CREATE TABLE `gender` (
  `GenderID` int(10) NOT NULL AUTO_INCREMENT,
  `Gender` varchar(30) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT current_timestamp(),
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`GenderID`),
  UNIQUE KEY `PK_Gender` (`GenderID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `gender` */

insert  into `gender`(`GenderID`,`Gender`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(5,'Male',0,'2020-04-17 22:01:45',NULL,'2020-04-17 22:01:45'),
(6,'Female',0,'2020-04-17 22:01:57',NULL,'2020-04-17 22:01:57');

/*Table structure for table `grade_cadre` */

DROP TABLE IF EXISTS `grade_cadre`;

CREATE TABLE `grade_cadre` (
  `cadre_id` int(11) NOT NULL AUTO_INCREMENT,
  `cadre_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`cadre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `grade_cadre` */

insert  into `grade_cadre`(`cadre_id`,`cadre_name`) values 
(1,'Top Management'),
(2,'Middle Management'),
(3,'Lower Managment'),
(4,'Senior Staff'),
(5,'Junior Staff');

/*Table structure for table `gradelevels` */

DROP TABLE IF EXISTS `gradelevels`;

CREATE TABLE `gradelevels` (
  `GradeLevelID` int(10) NOT NULL AUTO_INCREMENT,
  `GradeLevelName` varchar(100) DEFAULT NULL,
  `GradeLevelCode` varchar(30) DEFAULT NULL,
  `AnnualSalary` float NOT NULL,
  `CompanyID` int(10) DEFAULT NULL,
  `GradeID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`GradeLevelID`),
  UNIQUE KEY `PK_GradeLevels` (`GradeLevelID`),
  KEY `IX_Relationship18` (`CompanyID`),
  KEY `IX_Relationship19` (`GradeID`),
  CONSTRAINT `Relationship18` FOREIGN KEY (`CompanyID`) REFERENCES `company` (`CompanyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship19` FOREIGN KEY (`GradeID`) REFERENCES `grades` (`GradeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `gradelevels` */

insert  into `gradelevels`(`GradeLevelID`,`GradeLevelName`,`GradeLevelCode`,`AnnualSalary`,`CompanyID`,`GradeID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(8,'Level 1','Lvl1',80000,1,1,NULL,'2020-06-23 09:33:01',NULL,'2020-06-23 09:33:01'),
(9,'Level 2','Lvl2',90000,1,1,NULL,'2020-06-23 09:33:01',NULL,'2020-06-23 09:33:01'),
(10,'Level 3','Lvl3',100000,1,1,NULL,'2020-06-23 09:33:01',NULL,'2020-06-23 09:33:01'),
(11,'Level 4','Lvl4',120000,1,1,NULL,'2020-06-23 09:33:01',NULL,'2020-06-23 09:33:01'),
(12,'Level 5','Lvl5',140000,1,1,NULL,'2020-06-23 09:33:01',NULL,'2020-06-23 09:33:01'),
(13,'Level 6','Lvl6',160000,1,1,NULL,'2020-06-23 09:33:01',NULL,'2020-06-23 09:33:01'),
(14,'Level 7','Lvl7',180000,1,1,NULL,'2020-06-23 09:33:01',NULL,'2020-06-23 09:33:01');

/*Table structure for table `grades` */

DROP TABLE IF EXISTS `grades`;

CREATE TABLE `grades` (
  `GradeID` int(10) NOT NULL AUTO_INCREMENT,
  `GradeName` varchar(100) DEFAULT NULL,
  `GradeCode` varchar(30) DEFAULT NULL,
  `CompanyID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`GradeID`),
  UNIQUE KEY `PK_Grades` (`GradeID`),
  KEY `IX_Relationship17` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `grades` */

insert  into `grades`(`GradeID`,`GradeName`,`GradeCode`,`CompanyID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Entry Level ','101',1,NULL,'2020-06-23 09:33:09',NULL,'2020-06-23 09:33:09'),
(2,'Experienced ','102',1,NULL,'2020-06-23 09:33:09',NULL,'2020-06-23 09:33:09'),
(3,'Manager','103',1,NULL,'2020-06-23 09:33:09',NULL,'2020-06-23 09:33:09'),
(4,'General Manager','201',2,NULL,'2020-06-23 09:33:09',NULL,'2020-06-23 09:33:09'),
(5,'Directors','202',2,NULL,'2020-06-23 09:33:09',NULL,'2020-06-23 09:33:09'),
(6,'Vice President','203',2,NULL,'2020-06-23 09:33:09',NULL,'2020-06-23 09:33:09'),
(7,'Senior Technical Professional','301',3,NULL,'2020-06-23 09:33:09',NULL,'2020-06-23 09:33:09'),
(8,'','',3,NULL,'2020-06-23 09:33:09',NULL,'2020-06-23 09:33:09'),
(9,'','',3,NULL,'2020-06-23 09:33:09',NULL,'2020-06-23 09:33:09'),
(10,'','',4,NULL,'2020-06-23 09:33:09',NULL,'2020-06-23 09:33:09'),
(11,'','',4,NULL,'2020-06-23 09:33:09',NULL,'2020-06-23 09:33:09'),
(12,'','',4,NULL,'2020-06-23 09:33:09',NULL,'2020-06-23 09:33:09'),
(13,'','',NULL,NULL,'2020-06-23 09:33:09',NULL,'2020-06-23 09:33:09');

/*Table structure for table `healthinsuranceprovider` */

DROP TABLE IF EXISTS `healthinsuranceprovider`;

CREATE TABLE `healthinsuranceprovider` (
  `HealthInsuranceProviderID` int(10) NOT NULL AUTO_INCREMENT,
  `HealthInsuranceProvider` varchar(50) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT current_timestamp(6),
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`HealthInsuranceProviderID`),
  UNIQUE KEY `PK_PensionProvider` (`HealthInsuranceProviderID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `healthinsuranceprovider` */

insert  into `healthinsuranceprovider`(`HealthInsuranceProviderID`,`HealthInsuranceProvider`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Beaconhill Smile clinics',1,'2020-07-18 06:56:19.057285',NULL,NULL),
(2,'Agho Clinic Benin City',1,'2020-07-18 06:56:44.247145',NULL,NULL),
(3,'SCANTRIK DIAGNOSTICS AND HEALTHCARE LTD',1,'2020-07-18 06:57:08.768828',NULL,NULL),
(4,'Mediosa Healthcare Nigeria',1,'2020-07-18 06:57:20.707765',NULL,NULL),
(5,'MediEase Hospitality Services',1,'2020-07-18 06:57:32.157411',NULL,NULL);

/*Table structure for table `holidays` */

DROP TABLE IF EXISTS `holidays`;

CREATE TABLE `holidays` (
  `HolidayID` int(11) NOT NULL AUTO_INCREMENT,
  `Holiday` varchar(100) DEFAULT NULL,
  `HolidayDate` date DEFAULT NULL,
  `YearID` int(11) DEFAULT NULL,
  `DatePeriod` date DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  UNIQUE KEY `HolidayID` (`HolidayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `holidays` */

/*Table structure for table `identification` */

DROP TABLE IF EXISTS `identification`;

CREATE TABLE `identification` (
  `IdentificationID` int(11) NOT NULL AUTO_INCREMENT,
  `ResidencyID` int(11) DEFAULT NULL,
  `Identification` varchar(75) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`IdentificationID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `identification` */

insert  into `identification`(`IdentificationID`,`ResidencyID`,`Identification`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,1,'National ID',NULL,'2020-07-12 22:34:44',NULL,'2020-07-12 22:34:44'),
(2,2,'Green Card',NULL,'2020-07-12 22:34:53',NULL,'2020-07-12 22:34:53');

/*Table structure for table `itemcategory` */

DROP TABLE IF EXISTS `itemcategory`;

CREATE TABLE `itemcategory` (
  `ItemCategoryID` int(10) NOT NULL AUTO_INCREMENT,
  `ItemCategory` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ItemCategoryID`),
  UNIQUE KEY `PK_ItemCategory` (`ItemCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

/*Data for the table `itemcategory` */

insert  into `itemcategory`(`ItemCategoryID`,`ItemCategory`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Access Control/Security',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(2,'Advertising Services',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(3,'Appliances',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(4,'Architects',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(5,'Asbestos',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(6,'Athletics',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(7,'Audio Visual',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(8,'Banking Services',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(9,'Books, Subscriptions, & Publications',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(10,'Catering & Hospitality',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(11,'Chemicals (non-janitorial)',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(12,'Computers: Hardware',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(13,'Construction Delivery',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(14,'Construction Specialties',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(15,'Conveying Systems',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(16,'Electrical',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(17,'Electronics',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(18,'Employee Benefits',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(19,'Energy/Utilities',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(20,'Engineers',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(21,'Entertainment',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(22,'Flooring',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(23,'Food Services',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(24,'Furniture/Furnishings',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(25,'Gases and Fuels',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(26,'Insulation',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(27,'Insurance',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(28,'Investment Services',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(29,'Janitorial',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(30,'Legal Services',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(31,'Linen, Laundry, & Uniforms',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(32,'Masonry/Concrete',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(33,'Mechanical',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(34,'Medical Supplies/First Aid',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(35,'Memberships',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(36,'Metals',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(37,'Office Supplies/Equipment',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(38,'Painting/Interior Finishes',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(39,'Photographic Equipment',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(40,'Plumbing',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(41,'Postage',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(42,'Printing',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(43,'Professional Services/Consultants',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(44,'Promotional',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(45,'Relocation Services',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(46,'Roofing',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(47,'Safety/Fire',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(48,'Scientific Supplies',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(49,'Shipping Services/UPS/Customs',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(50,'Site/Landscaping',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(51,'Software',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(52,'Structural',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(53,'Subcontract Awards',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(54,'Telecommunications',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(55,'Temporary Staffing',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(56,'Thermal & Moisture Protection',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(57,'Training',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(58,'Transportation (charter services)',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(59,'Travel',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(60,'Utilities Specialties',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(61,'Vehicles/Equipment ',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(62,'Waste Disposal and Recycling',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18'),
(63,'Windows/Doors/Storefronts',NULL,'2020-06-23 09:33:18',NULL,'2020-06-23 09:33:18');

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `ItemID` int(10) NOT NULL AUTO_INCREMENT,
  `ItemCategoryID` int(10) DEFAULT NULL,
  `ItemTypeID` int(10) DEFAULT NULL,
  `MeasureUnitID` int(10) DEFAULT NULL,
  `ItemName` varchar(100) DEFAULT NULL,
  `CostPrice` float DEFAULT NULL,
  `ReorderLevel` float DEFAULT NULL,
  `SellingPrice` float DEFAULT NULL,
  `OpenStock` float DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ItemID`),
  UNIQUE KEY `PK_Items` (`ItemID`),
  KEY `IX_Relationship_p1` (`ItemCategoryID`),
  KEY `IX_Relationship_p2` (`ItemTypeID`),
  KEY `IX_Relationship_p3` (`MeasureUnitID`),
  CONSTRAINT `Relationship_p1` FOREIGN KEY (`ItemCategoryID`) REFERENCES `itemcategory` (`ItemCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p2` FOREIGN KEY (`ItemTypeID`) REFERENCES `itemtype` (`ItemTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p3` FOREIGN KEY (`MeasureUnitID`) REFERENCES `measureunit` (`MeasureUnitID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `items` */

insert  into `items`(`ItemID`,`ItemCategoryID`,`ItemTypeID`,`MeasureUnitID`,`ItemName`,`CostPrice`,`ReorderLevel`,`SellingPrice`,`OpenStock`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,5,1,NULL,'Item Type 1',50000,1,55000,1,NULL,'2020-06-23 09:33:19',NULL,'2020-06-23 09:33:19');

/*Table structure for table `itemstatus` */

DROP TABLE IF EXISTS `itemstatus`;

CREATE TABLE `itemstatus` (
  `ItemStatusID` int(10) NOT NULL AUTO_INCREMENT,
  `ItemStatus` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ItemStatusID`),
  UNIQUE KEY `PK_ItemStatus` (`ItemStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `itemstatus` */

insert  into `itemstatus`(`ItemStatusID`,`ItemStatus`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Active',NULL,'2020-06-23 09:33:20',NULL,'2020-06-23 09:33:20'),
(2,'Inactive',NULL,'2020-06-23 09:33:20',NULL,'2020-06-23 09:33:20');

/*Table structure for table `itemtype` */

DROP TABLE IF EXISTS `itemtype`;

CREATE TABLE `itemtype` (
  `ItemTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `ItemType` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ItemTypeID`),
  UNIQUE KEY `PK_ItemType` (`ItemTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `itemtype` */

insert  into `itemtype`(`ItemTypeID`,`ItemType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Item Type 1',NULL,'2020-06-23 09:33:20',NULL,'2020-06-23 09:33:20');

/*Table structure for table `jobapplication` */

DROP TABLE IF EXISTS `jobapplication`;

CREATE TABLE `jobapplication` (
  `JobApplicationID` int(11) NOT NULL AUTO_INCREMENT,
  `ApplicantID` int(11) NOT NULL,
  `VacancyID` int(11) NOT NULL,
  `DateofApplication` date NOT NULL,
  `RecruitmentStageID` varchar(50) NOT NULL,
  `RecruitmentStatusID` int(11) NOT NULL,
  `ApplicantCVID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`JobApplicationID`),
  UNIQUE KEY `JobApplicationID` (`JobApplicationID`),
  KEY `IX_Relationship1322` (`ApplicantID`),
  KEY `IX_Relationship1522` (`ApplicantCVID`),
  KEY `IX_Relationship2822` (`ApplicantCVID`),
  CONSTRAINT `jobapplication_ibfk_2` FOREIGN KEY (`ApplicantCVID`) REFERENCES `applicantcv` (`ApplicantCVID`),
  CONSTRAINT `jobapplication_ibfk_3` FOREIGN KEY (`ApplicantCVID`) REFERENCES `applicantcv` (`ApplicantCVID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `jobapplication` */

insert  into `jobapplication`(`JobApplicationID`,`ApplicantID`,`VacancyID`,`DateofApplication`,`RecruitmentStageID`,`RecruitmentStatusID`,`ApplicantCVID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,1,1,'2020-06-26','1',1,NULL,NULL,'2020-06-26 12:17:06',NULL,'2020-06-26 12:17:06'),
(2,3,4,'2020-07-01','1',1,NULL,NULL,'2020-07-01 11:47:24',NULL,'2020-07-01 11:47:24'),
(3,3,4,'2020-07-01','1',1,NULL,NULL,'2020-07-01 11:49:43',NULL,'2020-07-01 11:49:43'),
(4,4,4,'2020-07-02','1',1,NULL,NULL,'2020-07-02 12:58:57',NULL,'2020-07-02 12:58:57');

/*Table structure for table `jobinterview` */

DROP TABLE IF EXISTS `jobinterview`;

CREATE TABLE `jobinterview` (
  `JobInterviewID` int(11) NOT NULL AUTO_INCREMENT,
  `JobShortlistID` int(11) NOT NULL,
  `InterviewDate` date NOT NULL,
  `RecruitmentStageID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  `Location` text DEFAULT NULL,
  `Remark` text DEFAULT NULL,
  PRIMARY KEY (`JobInterviewID`),
  KEY `IX_Relationship2122` (`JobShortlistID`),
  KEY `IX_Relationship2222` (`RecruitmentStageID`),
  CONSTRAINT `jobinterview_ibfk_1` FOREIGN KEY (`JobShortlistID`) REFERENCES `jobshortlist` (`JobShortlistID`),
  CONSTRAINT `jobinterview_ibfk_2` FOREIGN KEY (`RecruitmentStageID`) REFERENCES `recruitmentstage` (`RecruitmentStageID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `jobinterview` */

insert  into `jobinterview`(`JobInterviewID`,`JobShortlistID`,`InterviewDate`,`RecruitmentStageID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`,`Location`,`Remark`) values 
(1,1,'2020-06-26',1,NULL,'2020-06-26 13:18:15',NULL,'2020-06-26 13:18:15','Location','Remark'),
(2,2,'2020-07-06',1,NULL,'2020-07-01 12:45:35',NULL,'2020-07-01 12:45:35','H & A Plaza, Wuye','Come early'),
(3,10,'2020-07-06',1,NULL,'2020-07-06 11:18:43',NULL,'2020-07-06 11:18:43','team','note'),
(4,10,'2020-07-06',1,NULL,'2020-07-06 11:20:40',NULL,'2020-07-06 11:20:40','team','note'),
(5,10,'2020-07-06',1,NULL,'2020-07-06 11:21:32',NULL,'2020-07-06 11:21:32','team','note'),
(6,10,'2020-07-06',1,NULL,'2020-07-06 11:22:11',NULL,'2020-07-06 11:22:11','team','note');

/*Table structure for table `jobinterviewdetail` */

DROP TABLE IF EXISTS `jobinterviewdetail`;

CREATE TABLE `jobinterviewdetail` (
  `JobInterviewDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `JobInterviewID` int(11) NOT NULL,
  `JobApplicationID` int(11) DEFAULT NULL,
  `ApplicantID` int(11) DEFAULT NULL,
  `InterviewTime` date DEFAULT NULL,
  `InterviewDate` char(20) DEFAULT NULL,
  `isPresent` varchar(20) DEFAULT NULL,
  `InterviewNote` varchar(1000) DEFAULT NULL,
  `RecruitmentStageID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`JobInterviewDetailID`),
  KEY `IX_Relationship2422` (`ApplicantID`),
  KEY `IX_Relationship2522` (`RecruitmentStageID`),
  CONSTRAINT `jobinterviewdetail_ibfk_1` FOREIGN KEY (`ApplicantID`) REFERENCES `applicants` (`ApplicantID`),
  CONSTRAINT `jobinterviewdetail_ibfk_2` FOREIGN KEY (`RecruitmentStageID`) REFERENCES `recruitmentstage` (`RecruitmentStageID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `jobinterviewdetail` */

insert  into `jobinterviewdetail`(`JobInterviewDetailID`,`JobInterviewID`,`JobApplicationID`,`ApplicantID`,`InterviewTime`,`InterviewDate`,`isPresent`,`InterviewNote`,`RecruitmentStageID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,6,2,NULL,NULL,'2020-07-06T11:07',NULL,NULL,1,125,'2020-07-06 11:22:11',NULL,'2020-07-06 11:22:11'),
(2,6,3,NULL,NULL,'2020-07-06T11:07',NULL,NULL,1,125,'2020-07-06 11:22:11',NULL,'2020-07-06 11:22:11'),
(3,6,4,NULL,NULL,'2020-07-06T11:07',NULL,NULL,1,125,'2020-07-06 11:22:11',NULL,'2020-07-06 11:22:11');

/*Table structure for table `joboffer` */

DROP TABLE IF EXISTS `joboffer`;

CREATE TABLE `joboffer` (
  `JobOfferID` int(11) NOT NULL AUTO_INCREMENT,
  `ApplicantID` int(11) DEFAULT NULL,
  `AnnualSalary` float DEFAULT NULL,
  `OtherVariables` varchar(1000) DEFAULT NULL,
  `OfferDate` date DEFAULT NULL,
  `OfferResponseID` int(11) DEFAULT NULL,
  `ResponseDate` date DEFAULT NULL,
  `DesignationID` int(11) DEFAULT NULL,
  `JobApplicationID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NULL DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`JobOfferID`),
  KEY `IX_Relationship2622` (`ApplicantID`),
  KEY `IX_Relationship2722` (`JobApplicationID`),
  CONSTRAINT `joboffer_ibfk_1` FOREIGN KEY (`ApplicantID`) REFERENCES `applicants` (`ApplicantID`),
  CONSTRAINT `joboffer_ibfk_2` FOREIGN KEY (`JobApplicationID`) REFERENCES `jobapplication` (`JobApplicationID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `joboffer` */

insert  into `joboffer`(`JobOfferID`,`ApplicantID`,`AnnualSalary`,`OtherVariables`,`OfferDate`,`OfferResponseID`,`ResponseDate`,`DesignationID`,`JobApplicationID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,NULL,250000,'25000','2020-07-06',NULL,NULL,2,2,NULL,'2020-07-06 15:02:33',NULL,NULL);

/*Table structure for table `jobshortlist` */

DROP TABLE IF EXISTS `jobshortlist`;

CREATE TABLE `jobshortlist` (
  `JobShortlistID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) NOT NULL,
  `DateofShortlist` date NOT NULL,
  `VacancyID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  `ApplicantID` int(11) DEFAULT NULL,
  `JobApplicationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`JobShortlistID`),
  KEY `IX_Relationship1722` (`VacancyID`),
  CONSTRAINT `jobshortlist_ibfk_1` FOREIGN KEY (`VacancyID`) REFERENCES `vacancy` (`VacancyID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `jobshortlist` */

insert  into `jobshortlist`(`JobShortlistID`,`Description`,`DateofShortlist`,`VacancyID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`,`ApplicantID`,`JobApplicationID`) values 
(1,'Remark','2020-06-26',1,NULL,'2020-06-26 12:46:57',NULL,'2020-06-26 12:46:57',1,NULL),
(2,'note','2020-07-06',NULL,125,'2020-07-01 12:43:46',NULL,'2020-07-01 12:43:46',NULL,2),
(3,'adsfghgfds','2020-07-02',NULL,125,'2020-07-02 13:13:41',NULL,'2020-07-02 13:13:41',NULL,4),
(4,'Note','2020-07-05',4,125,'2020-07-05 00:07:13',NULL,'2020-07-05 00:07:13',NULL,NULL),
(5,'dfdsdfsdf','2020-07-05',1,125,'2020-07-05 00:14:23',NULL,'2020-07-05 00:14:23',NULL,NULL),
(6,'jjjjjj','2020-07-05',4,125,'2020-07-05 00:19:42',NULL,'2020-07-05 00:19:42',NULL,NULL),
(7,'Note','2020-07-05',4,125,'2020-07-05 08:23:06',NULL,'2020-07-05 08:23:06',NULL,NULL),
(8,'Note','2020-07-05',4,125,'2020-07-05 08:25:08',NULL,'2020-07-05 08:25:08',NULL,NULL),
(9,'Note','2020-07-05',4,125,'2020-07-05 08:25:34',NULL,'2020-07-05 08:25:34',NULL,NULL),
(10,'Note','2020-07-05',4,125,'2020-07-05 08:26:18',NULL,'2020-07-05 08:26:18',NULL,NULL),
(11,'Note','2020-07-05',4,125,'2020-07-05 08:27:33',NULL,'2020-07-05 08:27:33',NULL,NULL);

/*Table structure for table `jobshortlistdetail` */

DROP TABLE IF EXISTS `jobshortlistdetail`;

CREATE TABLE `jobshortlistdetail` (
  `JobShortListDetailID` int(11) NOT NULL AUTO_INCREMENT,
  `JobShortlistID` int(11) NOT NULL,
  `ApplicantID` int(11) DEFAULT NULL,
  `JobApplicationID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NULL DEFAULT current_timestamp(),
  `ShortlistDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`JobShortListDetailID`),
  KEY `IX_Relationship1922` (`JobShortlistID`),
  KEY `IX_Relationship2022` (`JobApplicationID`),
  CONSTRAINT `jobshortlistdetail_ibfk_1` FOREIGN KEY (`JobShortlistID`) REFERENCES `jobshortlist` (`JobShortlistID`),
  CONSTRAINT `jobshortlistdetail_ibfk_2` FOREIGN KEY (`JobApplicationID`) REFERENCES `jobapplication` (`JobApplicationID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `jobshortlistdetail` */

insert  into `jobshortlistdetail`(`JobShortListDetailID`,`JobShortlistID`,`ApplicantID`,`JobApplicationID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`,`ShortlistDate`) values 
(1,10,NULL,2,125,'2020-07-05 08:26:18',NULL,'2020-07-05 08:26:18','2020-07-05 00:00:00'),
(2,10,NULL,3,125,'2020-07-05 08:26:18',NULL,'2020-07-05 08:26:18','2020-07-05 00:00:00'),
(3,10,NULL,4,125,'2020-07-05 08:26:18',NULL,'2020-07-05 08:26:18','2020-07-05 00:00:00'),
(4,11,NULL,2,125,'2020-07-05 08:27:33',NULL,'2020-07-05 08:27:33','2020-07-05 00:00:00'),
(5,11,NULL,3,125,'2020-07-05 08:27:33',NULL,'2020-07-05 08:27:33','2020-07-05 00:00:00'),
(6,11,NULL,4,125,'2020-07-05 08:27:33',NULL,'2020-07-05 08:27:33','2020-07-05 00:00:00');

/*Table structure for table `kpi` */

DROP TABLE IF EXISTS `kpi`;

CREATE TABLE `kpi` (
  `kpi_id` int(11) NOT NULL AUTO_INCREMENT,
  `kpitype_id` int(11) DEFAULT NULL,
  `kpiclass_id` int(11) DEFAULT NULL,
  `kpi_name` varchar(2000) DEFAULT NULL,
  `Kpi_desc` varchar(2000) DEFAULT NULL,
  `maxWeight` float DEFAULT 0,
  `config_id` int(11) DEFAULT NULL,
  `transID` int(11) DEFAULT 1,
  `kpi_general_id` int(11) DEFAULT NULL,
  `kpi_criteria` varchar(1000) DEFAULT NULL,
  `systemsID` int(11) DEFAULT NULL,
  `systemDetailsID` int(11) DEFAULT NULL,
  `storycategory_id` int(11) DEFAULT NULL,
  `targetvalue` float DEFAULT NULL,
  `EdStoryCategory_groupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`kpi_id`),
  KEY `IX_Relationship799` (`config_id`),
  KEY `IX_Relationship899` (`kpitype_id`),
  KEY `IX_Relationship1199` (`kpiclass_id`),
  CONSTRAINT `Relationship1199` FOREIGN KEY (`kpiclass_id`) REFERENCES `kpiclass` (`kpiclass_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship799` FOREIGN KEY (`config_id`) REFERENCES `kpiconfig` (`config_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship899` FOREIGN KEY (`kpitype_id`) REFERENCES `kpi_type` (`kpitype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kpi` */

/*Table structure for table `kpi_classscoring` */

DROP TABLE IF EXISTS `kpi_classscoring`;

CREATE TABLE `kpi_classscoring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `supervisortypeID` int(11) DEFAULT NULL,
  `kpiclass_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_Relationship23` (`period_id`),
  KEY `IX_Relationship24` (`kpiclass_id`),
  CONSTRAINT `Relationship23` FOREIGN KEY (`period_id`) REFERENCES `period` (`period_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship24` FOREIGN KEY (`kpiclass_id`) REFERENCES `kpiclass` (`kpiclass_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kpi_classscoring` */

/*Table structure for table `kpi_type` */

DROP TABLE IF EXISTS `kpi_type`;

CREATE TABLE `kpi_type` (
  `kpitype_id` int(11) NOT NULL AUTO_INCREMENT,
  `kpitype` varchar(50) NOT NULL,
  `ActiveID` int(11) NOT NULL DEFAULT 1,
  `visible` int(11) DEFAULT 1,
  `kpiclass_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`kpitype_id`),
  UNIQUE KEY `UQ__KPI_Type__7D78A4E7` (`kpitype`),
  KEY `IX_Relationship22` (`kpiclass_id`),
  CONSTRAINT `Relationship22` FOREIGN KEY (`kpiclass_id`) REFERENCES `kpiclass` (`kpiclass_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kpi_type` */

/*Table structure for table `kpi_typescoring` */

DROP TABLE IF EXISTS `kpi_typescoring`;

CREATE TABLE `kpi_typescoring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) DEFAULT NULL,
  `kpitype_id` int(11) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  `supervisortypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_Relationship999` (`kpitype_id`),
  KEY `IX_Relationship1299` (`period_id`),
  CONSTRAINT `Relationship1299` FOREIGN KEY (`period_id`) REFERENCES `period` (`period_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship999` FOREIGN KEY (`kpitype_id`) REFERENCES `kpi_type` (`kpitype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kpi_typescoring` */

/*Table structure for table `kpiclass` */

DROP TABLE IF EXISTS `kpiclass`;

CREATE TABLE `kpiclass` (
  `kpiclass_id` int(11) NOT NULL AUTO_INCREMENT,
  `kpiclass` varchar(50) NOT NULL,
  `ActiveID` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`kpiclass_id`),
  UNIQUE KEY `UQ__KPIClass__014935CB` (`kpiclass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kpiclass` */

/*Table structure for table `kpiconfig` */

DROP TABLE IF EXISTS `kpiconfig`;

CREATE TABLE `kpiconfig` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `depunit_id` int(11) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `date_posted` datetime NOT NULL DEFAULT current_timestamp(),
  `transID` int(11) NOT NULL DEFAULT 1,
  `approvalStage_id` int(11) DEFAULT NULL,
  `approving_officer` int(11) DEFAULT NULL,
  `exceptflagID` int(11) DEFAULT NULL,
  `work_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`config_id`),
  KEY `IX_Relationship60` (`period_id`),
  CONSTRAINT `Relationship60` FOREIGN KEY (`period_id`) REFERENCES `period` (`period_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kpiconfig` */

/*Table structure for table `kpiconfig_approval` */

DROP TABLE IF EXISTS `kpiconfig_approval`;

CREATE TABLE `kpiconfig_approval` (
  `KPIConfigApproveID` int(11) NOT NULL AUTO_INCREMENT,
  `kpi_id` int(11) DEFAULT NULL,
  `approve_id` int(11) DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `time_approve` datetime DEFAULT NULL,
  `approve_by` int(11) DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `transID` int(11) DEFAULT NULL,
  `config_id` int(11) DEFAULT NULL,
  `nextapprovingofficer` int(11) DEFAULT NULL,
  PRIMARY KEY (`KPIConfigApproveID`),
  KEY `IX_Relationship1000` (`config_id`),
  CONSTRAINT `Relationship1000` FOREIGN KEY (`config_id`) REFERENCES `kpiconfig` (`config_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kpiconfig_approval` */

/*Table structure for table `kpiconfigapproval` */

DROP TABLE IF EXISTS `kpiconfigapproval`;

CREATE TABLE `kpiconfigapproval` (
  `ConfigApprovalID` int(11) NOT NULL AUTO_INCREMENT,
  `ConfigID` int(11) DEFAULT NULL,
  `ApprovedBy` varchar(50) DEFAULT NULL,
  `NextApprovalOfficerID` varchar(50) DEFAULT NULL,
  `Comment` longtext DEFAULT NULL,
  `ProcessModuleID` int(11) DEFAULT NULL,
  `ApprovalInstancesID` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ConfigApprovalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `kpiconfigapproval` */

/*Table structure for table `leaveapplication` */

DROP TABLE IF EXISTS `leaveapplication`;

CREATE TABLE `leaveapplication` (
  `LeaveApplicationID` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(11) DEFAULT NULL,
  `DateFrom` date DEFAULT NULL,
  `DateBack` date DEFAULT NULL,
  `LeaveTypeID` int(11) DEFAULT NULL,
  `YearID` int(11) DEFAULT NULL,
  `ApprovalOfficerID` int(11) DEFAULT NULL,
  `ApprovalStageID` int(11) NOT NULL,
  `PayLeaveGrant` varchar(50) DEFAULT NULL,
  `NoDayApplied` varchar(50) DEFAULT NULL,
  `RelieveOfficerID` int(11) NOT NULL,
  `DepartmentID` char(1) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `ContactAddress` varchar(3000) DEFAULT NULL,
  `handover` text DEFAULT NULL,
  PRIMARY KEY (`LeaveApplicationID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `leaveapplication` */

insert  into `leaveapplication`(`LeaveApplicationID`,`EmployeeID`,`DateFrom`,`DateBack`,`LeaveTypeID`,`YearID`,`ApprovalOfficerID`,`ApprovalStageID`,`PayLeaveGrant`,`NoDayApplied`,`RelieveOfficerID`,`DepartmentID`,`DateCreated`,`ContactAddress`,`handover`) values 
(6,125,'2020-06-15','2020-06-26',1,1,133,4,'1','10',132,NULL,'2020-06-15 11:57:33','Test','Tes'),
(7,125,'2020-06-29','2020-07-06',2,NULL,133,4,'1','6',124,NULL,'2020-06-24 12:30:44','Garki II','NIl'),
(8,125,'2020-09-01','2020-09-10',1,NULL,124,3,'1','8',124,NULL,'2020-06-28 22:48:38','Address','Node');

/*Table structure for table `leaveapplicationsetup` */

DROP TABLE IF EXISTS `leaveapplicationsetup`;

CREATE TABLE `leaveapplicationsetup` (
  `LeaveApplicationSteupID` int(11) NOT NULL AUTO_INCREMENT,
  `LeaveTypeID` int(11) NOT NULL,
  `GradeID` int(11) NOT NULL,
  `NotEntitled` varchar(30) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`LeaveApplicationSteupID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `leaveapplicationsetup` */

insert  into `leaveapplicationsetup`(`LeaveApplicationSteupID`,`LeaveTypeID`,`GradeID`,`NotEntitled`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,1,1,'15',NULL,'2020-06-23 09:33:44',NULL,'2020-06-23 09:33:44'),
(2,2,1,'5',NULL,'2020-06-23 09:33:44',NULL,'2020-06-23 09:33:44'),
(3,1,2,'20',NULL,'2020-06-23 09:33:44',NULL,'2020-06-23 09:33:44');

/*Table structure for table `leaveapproval` */

DROP TABLE IF EXISTS `leaveapproval`;

CREATE TABLE `leaveapproval` (
  `LeaveApprovalID` int(11) NOT NULL AUTO_INCREMENT,
  `LeaveApplicationID` int(11) DEFAULT NULL,
  `ApprovalInstanceID` int(11) DEFAULT NULL,
  `ApprovedBy` varchar(50) DEFAULT NULL,
  `NextApprovalOfficerID` varchar(50) DEFAULT NULL,
  `Comment` longtext DEFAULT NULL,
  `ProcessModuleID` int(11) DEFAULT NULL,
  `ApprovalInstancesID` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`LeaveApprovalID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `leaveapproval` */

insert  into `leaveapproval`(`LeaveApprovalID`,`LeaveApplicationID`,`ApprovalInstanceID`,`ApprovedBy`,`NextApprovalOfficerID`,`Comment`,`ProcessModuleID`,`ApprovalInstancesID`,`ApprovalDate`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,1,7,'124','126',NULL,1,7,'2020-05-08 15:36:29',NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(2,NULL,NULL,NULL,'124',NULL,NULL,10,'2020-05-08 16:12:13',NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(3,3,NULL,'126','124','d',NULL,10,'2020-05-08 16:14:50',NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(4,2,NULL,'126','124','afdad',NULL,10,'2020-05-08 16:20:13',NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(5,7,NULL,'133','132','TEs',NULL,11,'2020-06-24 12:38:07',NULL,'2020-06-24 12:38:07',NULL,'2020-06-24 12:38:07');

/*Table structure for table `leaveemployeeapplication` */

DROP TABLE IF EXISTS `leaveemployeeapplication`;

CREATE TABLE `leaveemployeeapplication` (
  `LeaveEmployeeApplicationID` int(11) NOT NULL AUTO_INCREMENT,
  `YearID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `NoDayEntitled` varchar(50) DEFAULT NULL,
  `LeaveTypeID` int(11) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`LeaveEmployeeApplicationID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `leaveemployeeapplication` */

insert  into `leaveemployeeapplication`(`LeaveEmployeeApplicationID`,`YearID`,`EmployeeID`,`NoDayEntitled`,`LeaveTypeID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,1,124,'15',1,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(2,1,124,'5',2,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(3,1,125,'15',1,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(4,1,125,'5',2,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(5,1,126,'15',1,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(6,1,126,'5',2,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(7,1,127,'15',1,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(8,1,127,'5',2,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(9,1,128,'15',1,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(10,1,128,'5',2,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(11,1,129,'15',1,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(12,1,129,'5',2,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(13,1,130,'15',1,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(14,1,130,'5',2,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(15,1,131,'15',1,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46'),
(16,1,131,'5',2,NULL,'2020-06-23 09:33:46',NULL,'2020-06-23 09:33:46');

/*Table structure for table `leaveplanner` */

DROP TABLE IF EXISTS `leaveplanner`;

CREATE TABLE `leaveplanner` (
  `LeavePlannerID` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(11) NOT NULL,
  `DateFrom` date DEFAULT NULL,
  `DateTo` date NOT NULL,
  `LeaveTypeID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `noDays` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`LeavePlannerID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `leaveplanner` */

insert  into `leaveplanner`(`LeavePlannerID`,`EmployeeID`,`DateFrom`,`DateTo`,`LeaveTypeID`,`DepartmentID`,`noDays`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,124,'2020-05-07','2020-05-30',1,1,17,NULL,'2020-06-23 09:33:51',NULL,'2020-06-23 09:33:51'),
(2,127,'2020-05-09','2020-06-01',2,1,16,NULL,'2020-06-23 09:33:51',NULL,'2020-06-23 09:33:51'),
(3,125,'2020-06-09','2020-06-25',3,1,14,NULL,'2020-06-23 09:33:51',NULL,'2020-06-23 09:33:51'),
(4,125,'2020-05-11','2020-05-21',2,1,10,NULL,'2020-06-23 09:33:51',NULL,'2020-06-23 09:33:51'),
(5,125,'2020-05-13','2020-05-28',2,1,13,NULL,'2020-06-23 09:33:51',NULL,'2020-06-23 09:33:51'),
(6,125,'2020-05-06','2020-05-29',2,1,19,NULL,'2020-06-23 09:33:51',NULL,'2020-06-23 09:33:51'),
(7,125,'2020-05-06','2020-05-29',2,1,19,NULL,'2020-06-23 09:33:51',NULL,'2020-06-23 09:33:51'),
(8,125,'2020-08-10','2020-08-19',1,1,8,NULL,'2020-06-23 09:33:51',NULL,'2020-06-23 09:33:51');

/*Table structure for table `leaveresumption` */

DROP TABLE IF EXISTS `leaveresumption`;

CREATE TABLE `leaveresumption` (
  `LeaveResumptionID` int(11) NOT NULL AUTO_INCREMENT,
  `LeaveApplicationID` int(11) NOT NULL,
  `ResumptionDate` date DEFAULT NULL,
  `DateFrom` date DEFAULT NULL,
  `DateTo` date DEFAULT NULL,
  `ApprovingOfficerID` int(11) DEFAULT NULL,
  `ApprovalStagesID` int(11) DEFAULT NULL,
  `DatePosted` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`LeaveResumptionID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `leaveresumption` */

insert  into `leaveresumption`(`LeaveResumptionID`,`LeaveApplicationID`,`ResumptionDate`,`DateFrom`,`DateTo`,`ApprovingOfficerID`,`ApprovalStagesID`,`DatePosted`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,5,'2020-05-12','2020-07-01',NULL,NULL,NULL,'2020-05-25 13:26:34',NULL,'2020-06-23 09:33:52',NULL,'2020-06-23 09:33:52'),
(2,5,'2020-05-25','2020-07-01','2020-07-13',126,3,'2020-05-25 13:31:19',NULL,'2020-06-23 09:33:52',NULL,'2020-06-23 09:33:52');

/*Table structure for table `leaveresumptionapproval` */

DROP TABLE IF EXISTS `leaveresumptionapproval`;

CREATE TABLE `leaveresumptionapproval` (
  `ResumeApprovalID` int(11) NOT NULL AUTO_INCREMENT,
  `LeaveResumptionID` int(11) DEFAULT NULL,
  `ApprovalInstanceID` int(11) DEFAULT NULL,
  `ApprovedBy` varchar(50) DEFAULT NULL,
  `NextApprovalOfficerID` varchar(50) DEFAULT NULL,
  `Comment` longtext DEFAULT NULL,
  `ProcessModuleID` int(11) DEFAULT NULL,
  `ApprovalInstancesID` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ResumeApprovalID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `leaveresumptionapproval` */

insert  into `leaveresumptionapproval`(`ResumeApprovalID`,`LeaveResumptionID`,`ApprovalInstanceID`,`ApprovedBy`,`NextApprovalOfficerID`,`Comment`,`ProcessModuleID`,`ApprovalInstancesID`,`ApprovalDate`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,2,NULL,'126','124','dfafdfasd',NULL,10,'2020-05-25 15:07:00',NULL,'2020-06-23 09:33:53',NULL,'2020-06-23 09:33:53'),
(2,2,NULL,'126','124','dfsfds',NULL,10,'2020-05-25 15:26:07',NULL,'2020-06-23 09:33:53',NULL,'2020-06-23 09:33:53');

/*Table structure for table `leavetype` */

DROP TABLE IF EXISTS `leavetype`;

CREATE TABLE `leavetype` (
  `LeaveTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `LeaveType` varchar(50) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  `dayValue` float DEFAULT NULL,
  PRIMARY KEY (`LeaveTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `leavetype` */

insert  into `leavetype`(`LeaveTypeID`,`LeaveType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`,`dayValue`) values 
(1,'Annual',NULL,'2020-06-23 09:34:00',NULL,'2020-06-23 09:34:00',1),
(2,'Casual',NULL,'2020-06-23 09:34:00',NULL,'2020-06-23 09:34:00',1),
(3,'Examination',NULL,'2020-06-23 09:34:00',NULL,'2020-06-23 09:34:00',1),
(4,'Sick/Medical',NULL,'2020-06-23 09:34:00',NULL,'2020-06-23 09:34:00',1),
(5,'Maternity',NULL,'2020-06-23 09:34:00',NULL,'2020-06-23 09:34:00',1),
(6,'Planner',NULL,'2020-06-23 09:34:00',NULL,'2020-06-23 09:34:00',1),
(7,'Half Day',NULL,'2020-06-23 09:34:00',NULL,'2020-06-23 09:34:00',0.5);

/*Table structure for table `loanapplication` */

DROP TABLE IF EXISTS `loanapplication`;

CREATE TABLE `loanapplication` (
  `LoanApplicationID` int(11) NOT NULL AUTO_INCREMENT,
  `LoanID` int(11) DEFAULT NULL,
  `LoanDate` date DEFAULT NULL,
  `LoanTypeID` int(11) DEFAULT NULL,
  `Amount` decimal(15,2) DEFAULT NULL,
  `InterestRate` double DEFAULT NULL,
  `Tenor` varchar(30) DEFAULT NULL,
  `RepaymentAmount` decimal(15,2) DEFAULT NULL,
  `ApprovalStageID` int(11) DEFAULT NULL,
  `ApprovingOfficerID` int(50) DEFAULT NULL,
  `LoanStatusID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `MonthlyRepayment` decimal(15,2) DEFAULT NULL,
  `StartPeriodID` int(11) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`LoanApplicationID`),
  KEY `LoanTypeID` (`LoanTypeID`),
  KEY `ApprovingOfficerID` (`ApprovingOfficerID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `StartPeriodID` (`StartPeriodID`),
  CONSTRAINT `loanapplication_ibfk_1` FOREIGN KEY (`LoanTypeID`) REFERENCES `loantypes` (`LoanTypeID`),
  CONSTRAINT `loanapplication_ibfk_2` FOREIGN KEY (`ApprovingOfficerID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `loanapplication_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `loanapplication_ibfk_4` FOREIGN KEY (`StartPeriodID`) REFERENCES `payrollperiod` (`PayrollPeriodID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `loanapplication` */

insert  into `loanapplication`(`LoanApplicationID`,`LoanID`,`LoanDate`,`LoanTypeID`,`Amount`,`InterestRate`,`Tenor`,`RepaymentAmount`,`ApprovalStageID`,`ApprovingOfficerID`,`LoanStatusID`,`EmployeeID`,`MonthlyRepayment`,`StartPeriodID`,`CreatedBy`,`DateCreated`) values 
(1,NULL,'2020-06-22',1,30000.00,0,'3',30000.00,4,133,NULL,125,10000.00,1,125,'2020-06-24 12:56:25');

/*Table structure for table `loanapproval` */

DROP TABLE IF EXISTS `loanapproval`;

CREATE TABLE `loanapproval` (
  `LoanApprovalID` int(11) NOT NULL AUTO_INCREMENT,
  `LoanApplicationID` int(11) DEFAULT NULL,
  `ApprovalInstaceID` int(11) DEFAULT NULL,
  `ApprovedBy` varchar(50) DEFAULT NULL,
  `Comment` longtext NOT NULL,
  `NextApprovalOfficerID` int(11) DEFAULT NULL,
  `ProcessModuleID` int(11) DEFAULT NULL,
  `ApprovalInstancesID` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NULL DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`LoanApprovalID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `loanapproval` */

insert  into `loanapproval`(`LoanApprovalID`,`LoanApplicationID`,`ApprovalInstaceID`,`ApprovedBy`,`Comment`,`NextApprovalOfficerID`,`ProcessModuleID`,`ApprovalInstancesID`,`ApprovalDate`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,1,NULL,'126','g',124,NULL,10,'2020-05-26 19:39:08',NULL,'2020-06-23 09:34:19',NULL,'2020-06-23 09:34:19');

/*Table structure for table `loanrepayment` */

DROP TABLE IF EXISTS `loanrepayment`;

CREATE TABLE `loanrepayment` (
  `LoanRepaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `LoanApplicationID` int(11) NOT NULL,
  `Amount` decimal(15,2) DEFAULT NULL,
  `PayrollPeriodID` int(11) DEFAULT NULL,
  `RepaymentTypeID` int(11) DEFAULT NULL,
  `RepaymentSourceID` int(11) DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT current_timestamp(),
  `CreatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`LoanRepaymentID`),
  KEY `LoanApplicationID` (`LoanApplicationID`),
  KEY `RepaymentTypeID` (`RepaymentTypeID`),
  KEY `RepaymentSourceID` (`RepaymentSourceID`),
  CONSTRAINT `loanrepayment_ibfk_1` FOREIGN KEY (`LoanApplicationID`) REFERENCES `loanapplication` (`LoanApplicationID`),
  CONSTRAINT `loanrepayment_ibfk_2` FOREIGN KEY (`RepaymentTypeID`) REFERENCES `loanrepaymenttype` (`LoanRepaymentTypeID`),
  CONSTRAINT `loanrepayment_ibfk_3` FOREIGN KEY (`RepaymentSourceID`) REFERENCES `loanrepaymentsource` (`LoanRepaymentSourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `loanrepayment` */

/*Table structure for table `loanrepaymentsource` */

DROP TABLE IF EXISTS `loanrepaymentsource`;

CREATE TABLE `loanrepaymentsource` (
  `LoanRepaymentSourceID` int(11) NOT NULL AUTO_INCREMENT,
  `RepaymentSourceID` varchar(100) DEFAULT NULL,
  `RepaymentSource` varchar(100) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`LoanRepaymentSourceID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `loanrepaymentsource` */

insert  into `loanrepaymentsource`(`LoanRepaymentSourceID`,`RepaymentSourceID`,`RepaymentSource`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,NULL,'Payroll',NULL,'2020-06-23 09:34:28',NULL,'2020-06-23 09:34:28'),
(2,NULL,'Outside Payroll',NULL,'2020-06-23 09:34:28',NULL,'2020-06-23 09:34:28');

/*Table structure for table `loanrepaymenttype` */

DROP TABLE IF EXISTS `loanrepaymenttype`;

CREATE TABLE `loanrepaymenttype` (
  `LoanRepaymentTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `RepaymentTypeID` int(11) DEFAULT NULL,
  `RepaymentType` varchar(50) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`LoanRepaymentTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `loanrepaymenttype` */

insert  into `loanrepaymenttype`(`LoanRepaymentTypeID`,`RepaymentTypeID`,`RepaymentType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,NULL,'Full Payment',NULL,'2020-06-23 09:34:29',NULL,'2020-06-23 09:34:29'),
(2,NULL,'Part Payment',NULL,'2020-06-23 09:34:29',NULL,'2020-06-23 09:34:29');

/*Table structure for table `loantypes` */

DROP TABLE IF EXISTS `loantypes`;

CREATE TABLE `loantypes` (
  `LoanTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `LoanType` varchar(30) DEFAULT NULL,
  `SalaryComponentID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`LoanTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `loantypes` */

insert  into `loantypes`(`LoanTypeID`,`LoanType`,`SalaryComponentID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Micro Loan',8,NULL,'2020-06-23 09:34:29',NULL,'2020-06-23 09:34:29');

/*Table structure for table `local_govt` */

DROP TABLE IF EXISTS `local_govt`;

CREATE TABLE `local_govt` (
  `local_govt_id` int(11) NOT NULL AUTO_INCREMENT,
  `local_govt` varchar(50) NOT NULL,
  `state_id` int(11) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`local_govt_id`),
  KEY `state_id` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=774 DEFAULT CHARSET=latin1;

/*Data for the table `local_govt` */

insert  into `local_govt`(`local_govt_id`,`local_govt`,`state_id`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Aba North',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(2,'Aba South',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(3,'Arochukwu',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(4,'Bende',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(5,'Ikwuano',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(6,'Isiala Ngwa North',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(7,'Isiala Ngwa South',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(8,'Isuikwuato',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(9,'Obi Ngwa',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(10,'Ohafia',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(11,'Osisioma',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(12,'Ugwunagbo',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(13,'Ukwa East',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(14,'Ukwa West',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(15,'Umuahia North',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(16,'Umuahia South',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(17,'Umu Nneochi',4201,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(18,'Demsa',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(19,'Fufure',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(20,'Ganye',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(21,'Gayuk',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(22,'Gombi',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(23,'Grie',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(24,'Hong',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(25,'Jada',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(26,'Larmurde',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(27,'Madagali',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(28,'Maiha',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(29,'Mayo Belwa',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(30,'Michika',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(31,'Mubi North',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(32,'Mubi South',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(33,'Numan',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(34,'Shelleng',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(35,'Song',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(36,'Toungo',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(37,'Yola North',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(38,'Yola South',4202,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(39,'Abak',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(40,'Eastern Obolo',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(41,'Eket',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(42,'Esit Eket',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(43,'Essien Udim',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(44,'Etim Ekpo',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(45,'Etinan',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(46,'Ibeno',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(47,'Ibesikpo Asutan',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(48,'Ibiono-Ibom',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(49,'Ika',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(50,'Ikono',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(51,'Ikot Abasi',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(52,'Ikot Ekpene',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(53,'Ini',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(54,'Itu',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(55,'Mbo',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(56,'Mkpat-Enin',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(57,'Nsit-Atai',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(58,'Nsit-Ibom',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(59,'Nsit-Ubium',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(60,'Obot Akara',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(61,'Okobo',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(62,'Onna',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(63,'Oron',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(64,'Oruk Anam',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(65,'Udung-Uko',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(66,'Ukanafun',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(67,'Uruan',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(68,'Urue-Offong/Oruko',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(69,'Uyo',4203,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(70,'Aguata',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(71,'Anambra East',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(72,'Anambra West',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(73,'Anaocha',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(74,'Awka North',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(75,'Awka South',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(76,'Ayamelum',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(77,'Dunukofia',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(78,'Ekwusigo',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(79,'Idemili North',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(80,'Idemili South',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(81,'Ihiala',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(82,'Njikoka',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(83,'Nnewi North',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(84,'Nnewi South',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(85,'Ogbaru',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(86,'Onitsha North',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(87,'Onitsha South',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(88,'Orumba North',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(89,'Orumba South',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(90,'Oyi',4204,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(91,'Alkaleri',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(92,'Bauchi',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(93,'Bogoro',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(94,'Damban',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(95,'Darazo',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(96,'Dass',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(97,'Gamawa',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(98,'Ganjuwa',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(99,'Giade',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(100,'Itas/Gadau',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(101,'Jama\'are',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(102,'Katagum',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(103,'Kirfi',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(104,'Misau',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(105,'Ningi',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(106,'Shira',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(107,'Tafawa Balewa',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(108,'Toro',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(109,'Warji',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(110,'Zaki',4205,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(111,'Brass',4206,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(112,'Ekeremor',4206,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(113,'Kolokuma/Opokuma',4206,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(114,'Nembe',4206,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(115,'Ogbia',4206,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(116,'Sagbama',4206,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(117,'Southern Ijaw',4206,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(118,'Yenagoa',4206,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(119,'Agatu',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(120,'Apa',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(121,'Ado',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(122,'Buruku',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(123,'Gboko',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(124,'Guma',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(125,'Gwer East',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(126,'Gwer West',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(127,'Katsina-Ala',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(128,'Konshisha',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(129,'Kwande',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(130,'Logo',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(131,'Makurdi',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(132,'Obi',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(133,'Ogbadibo',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(134,'Ohimini',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(135,'Oju',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(136,'Okpokwu',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(137,'Oturkpo',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(138,'Tarka',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(139,'Ukum',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(140,'Ushongo',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(141,'Vandeikya',4207,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(142,'Abadam',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(143,'Askira/Uba',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(144,'Bama',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(145,'Bayo',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(146,'Biu',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(147,'Chibok',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(148,'Damboa',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(149,'Dikwa',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(150,'Gubio',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(151,'Guzamala',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(152,'Gwoza',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(153,'Hawul',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(154,'Jere',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(155,'Kaga',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(156,'Kala/Balge',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(157,'Konduga',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(158,'Kukawa',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(159,'Kwaya Kusar',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(160,'Mafa',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(161,'Magumeri',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(162,'Maiduguri',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(163,'Marte',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(164,'Mobbar',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(165,'Monguno',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(166,'Ngala',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(167,'Nganzai',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(168,'Shani',4208,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(169,'Abi',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(170,'Akamkpa',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(171,'Akpabuyo',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(172,'Bakassi',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(173,'Bekwarra',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(174,'Biase',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(175,'Boki',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(176,'Calabar Municipal',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(177,'Calabar South',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(178,'Etung',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(179,'Ikom',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(180,'Obanliku',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(181,'Obubra',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(182,'Obudu',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(183,'Odukpani',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(184,'Ogoja',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(185,'Yakuur',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(186,'Yala',4209,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(187,'Aniocha North',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(188,'Aniocha South',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(189,'Bomadi',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(190,'Burutu',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(191,'Ethiope East',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(192,'Ethiope West',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(193,'Ika North East',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(194,'Ika South',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(195,'Isoko North',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(196,'Isoko South',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(197,'Ndokwa East',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(198,'Ndokwa West',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(199,'Okpe',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(200,'Oshimili North',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(201,'Oshimili South',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(202,'Patani',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(203,'Sapele',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(204,'Udu',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(205,'Ughelli North',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(206,'Ughelli South',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(207,'Ukwuani',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(208,'Uvwie',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(209,'Warri North',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(210,'Warri South',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(211,'Warri South West',4210,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(212,'Abakaliki',4211,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(213,'Afikpo North',4211,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(214,'Afikpo South',4211,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(215,'Ebonyi',4211,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(216,'Ezza North',4211,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(217,'Ezza South',4211,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(218,'Ikwo',4211,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(219,'Ishielu',4211,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(220,'Ivo',4211,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(221,'Izzi',4211,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(222,'Ohaozara',4211,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(223,'Ohaukwu',4211,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(224,'Onicha',4211,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(225,'Akoko-Edo',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(226,'Egor',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(227,'Esan Central',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(228,'Esan North-East',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(229,'Esan South-East',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(230,'Esan West',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(231,'Etsako Central',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(232,'Etsako East',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(233,'Etsako West',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(234,'Igueben',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(235,'Ikpoba Okha',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(236,'Orhionmwon',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(237,'Oredo',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(238,'Ovia North-East',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(239,'Ovia South-West',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(240,'Owan East',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(241,'Owan West',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(242,'Uhunmwonde',4212,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(243,'Ado Ekiti',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(244,'Efon',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(245,'Ekiti East',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(246,'Ekiti South-West',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(247,'Ekiti West',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(248,'Emure',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(249,'Gbonyin',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(250,'Ido Osi',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(251,'Ijero',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(252,'Ikere',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(253,'Ikole',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(254,'Ilejemeje',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(255,'Irepodun/Ifelodun',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(256,'Ise/Orun',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(257,'Moba',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(258,'Oye',4213,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(259,'Aninri',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(260,'Awgu',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(261,'Enugu East',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(262,'Enugu North',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(263,'Enugu South',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(264,'Ezeagu',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(265,'Igbo Etiti',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(266,'Igbo Eze North',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(267,'Igbo Eze South',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(268,'Isi Uzo',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(269,'Nkanu East',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(270,'Nkanu West',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(271,'Nsukka',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(272,'Oji River',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(273,'Udenu',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(274,'Udi',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(275,'Uzo Uwani',4214,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(276,'Akko',4215,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(277,'Balanga',4215,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(278,'Billiri',4215,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(279,'Dukku',4215,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(280,'Funakaye',4215,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(281,'Gombe',4215,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(282,'Kaltungo',4215,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(283,'Kwami',4215,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(284,'Nafada',4215,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(285,'Shongom',4215,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(286,'Yamaltu/Deba',4215,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(287,'Aboh Mbaise',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(288,'Ahiazu Mbaise',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(289,'Ehime Mbano',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(290,'Ezinihitte',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(291,'Ideato North',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(292,'Ideato South',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(293,'Ihitte/Uboma',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(294,'Ikeduru',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(295,'Isiala Mbano',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(296,'Isu',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(297,'Mbaitoli',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(298,'Ngor Okpala',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(299,'Njaba',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(300,'Nkwerre',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(301,'Nwangele',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(302,'Obowo',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(303,'Oguta',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(304,'Ohaji/Egbema',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(305,'Okigwe',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(306,'Orlu',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(307,'Orsu',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(308,'Oru East',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(309,'Oru West',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(310,'Owerri Municipal',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(311,'Owerri North',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(312,'Owerri West',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(313,'Unuimo',4216,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(314,'Auyo',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(315,'Babura',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(316,'Biriniwa',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(317,'Birnin Kudu',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(318,'Buji',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(319,'Dutse',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(320,'Gagarawa',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(321,'Garki',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(322,'Gumel',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(323,'Guri',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(324,'Gwaram',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(325,'Gwiwa',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(326,'Hadejia',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(327,'Jahun',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(328,'Kafin Hausa',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(329,'Kazaure',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(330,'Kiri Kasama',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(331,'Kiyawa',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(332,'Kaugama',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(333,'Maigatari',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(334,'Malam Madori',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(335,'Miga',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(336,'Ringim',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(337,'Roni',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(338,'Sule Tankarkar',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(339,'Taura',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(340,'Yankwashi',4217,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(341,'Birnin Gwari',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(342,'Chikun',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(343,'Giwa',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(344,'Igabi',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(345,'Ikara',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(346,'Jaba',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(347,'Jema\'a',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(348,'Kachia',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(349,'Kaduna North',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(350,'Kaduna South',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(351,'Kagarko',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(352,'Kajuru',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(353,'Kaura',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(354,'Kauru',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(355,'Kubau',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(356,'Kudan',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(357,'Lere',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(358,'Makarfi',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(359,'Sabon Gari',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(360,'Sanga',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(361,'Soba',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(362,'Zangon Kataf',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(363,'Zaria',4218,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(364,'Ajingi',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(365,'Albasu',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(366,'Bagwai',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(367,'Bebeji',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(368,'Bichi',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(369,'Bunkure',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(370,'Dala',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(371,'Dambatta',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(372,'Dawakin Kudu',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(373,'Dawakin Tofa',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(374,'Doguwa',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(375,'Fagge',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(376,'Gabasawa',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(377,'Garko',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(378,'Garun Mallam',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(379,'Gaya',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(380,'Gezawa',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(381,'Gwale',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(382,'Gwarzo',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(383,'Kabo',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(384,'Kano Municipal',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(385,'Karaye',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(386,'Kibiya',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(387,'Kiru',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(388,'Kumbotso',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(389,'Kunchi',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(390,'Kura',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(391,'Madobi',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(392,'Makoda',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(393,'Minjibir',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(394,'Nasarawa',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(395,'Rano',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(396,'Rimin Gado',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(397,'Rogo',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(398,'Shanono',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(399,'Sumaila',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(400,'Takai',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(401,'Tarauni',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(402,'Tofa',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(403,'Tsanyawa',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(404,'Tudun Wada',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(405,'Ungogo',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(406,'Warawa',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(407,'Wudil',4219,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(408,'Bakori',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(409,'Batagarawa',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(410,'Batsari',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(411,'Baure',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(412,'Bindawa',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(413,'Charanchi',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(414,'Dandume',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(415,'Danja',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(416,'Dan Musa',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(417,'Daura',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(418,'Dutsi',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(419,'Dutsin Ma',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(420,'Faskari',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(421,'Funtua',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(422,'Ingawa',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(423,'Jibia',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(424,'Kafur',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(425,'Kaita',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(426,'Kankara',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(427,'Kankia',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(428,'Katsina',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(429,'Kurfi',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(430,'Kusada',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(431,'Mai\'Adua',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(432,'Malumfashi',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(433,'Mani',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(434,'Mashi',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(435,'Matazu',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(436,'Musawa',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(437,'Rimi',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(438,'Sabuwa',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(439,'Safana',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(440,'Sandamu',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(441,'Zango',4220,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(442,'Aleiro',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(443,'Arewa Dandi',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(444,'Argungu',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(445,'Augie',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(446,'Bagudo',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(447,'Birnin Kebbi',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(448,'Bunza',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(449,'Dandi',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(450,'Fakai',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(451,'Gwandu',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(452,'Jega',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(453,'Kalgo',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(454,'Koko/Besse',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(455,'Maiyama',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(456,'Ngaski',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(457,'Sakaba',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(458,'Shanga',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(459,'Suru',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(460,'Wasagu/Danko',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(461,'Yauri',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(462,'Zuru',4221,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(463,'Adavi',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(464,'Ajaokuta',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(465,'Ankpa',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(466,'Bassa',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(467,'Dekina',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(468,'Ibaji',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(469,'Idah',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(470,'Igalamela Odolu',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(471,'Ijumu',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(472,'Kabba/Bunu',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(473,'Kogi',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(474,'Lokoja',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(475,'Mopa Muro',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(476,'Ofu',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(477,'Ogori/Magongo',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(478,'Okehi',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(479,'Okene',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(480,'Olamaboro',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(481,'Omala',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(482,'Yagba East',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(483,'Yagba West',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(484,'Asa',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(485,'Baruten',4222,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(486,'Edu',4223,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(487,'Ekiti',4223,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(488,'Ifelodun',4223,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(489,'Ilorin East',4223,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(490,'Ilorin South',4223,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(491,'Ilorin West',4223,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(492,'Irepodun',4223,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(493,'Isin',4223,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(494,'Kaiama',4223,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(495,'Moro',4223,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(496,'Offa',4223,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(497,'Oke Ero',4223,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(498,'Oyun',4223,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(499,'Pategi',4223,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(500,'Agege',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(501,'Ajeromi-Ifelodun',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(502,'Alimosho',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(503,'Amuwo-Odofin',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(504,'Apapa',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(505,'Badagry',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(506,'Epe',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(507,'Eti Osa',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(508,'Ibeju-Lekki',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(509,'Ifako-Ijaiye',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(510,'Ikeja',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(511,'Ikorodu',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(512,'Kosofe',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(513,'Lagos Island',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(514,'Lagos Mainland',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(515,'Mushin',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(516,'Ojo',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(517,'Oshodi-Isolo',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(518,'Shomolu',4224,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(519,'Akwanga',4225,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(520,'Awe',4225,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(521,'Doma',4225,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(522,'Karu',4225,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(523,'Keana',4225,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(524,'Keffi',4225,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(525,'Kokona',4225,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(526,'Lafia',4225,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(527,'Nasarawa',4225,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(528,'Nasarawa Egon',4225,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(529,'Obi',4225,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(530,'Toto',4225,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(531,'Wamba',4225,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(532,'Agaie',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(533,'Agwara',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(534,'Bida',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(535,'Borgu',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(536,'Bosso',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(537,'Chanchaga',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(538,'Edati',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(539,'Gbako',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(540,'Gurara',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(541,'Katcha',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(542,'Kontagora',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(543,'Lapai',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(544,'Lavun',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(545,'Magama',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(546,'Mariga',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(547,'Mashegu',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(548,'Mokwa',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(549,'Moya',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(550,'Paikoro',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(551,'Rafi',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(552,'Rijau',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(553,'Shiroro',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(554,'Suleja',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(555,'Tafa',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(556,'Wushishi',4226,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(557,'Abeokuta North',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(558,'Abeokuta South',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(559,'Ado-Odo/Ota',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(560,'Egbado North',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(561,'Egbado South',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(562,'Ewekoro',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(563,'Ifo',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(564,'Ijebu East',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(565,'Ijebu North',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(566,'Ijebu North East',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(567,'Ijebu Ode',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(568,'Ikenne',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(569,'Imeko Afon',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(570,'Ipokia',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(571,'Obafemi Owode',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(572,'Odeda',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(573,'Odogbolu',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(574,'Ogun Waterside',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(575,'Remo North',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(576,'Shagamu',4227,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(577,'Akoko North-East',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(578,'Akoko North-West',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(579,'Akoko South-West',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(580,'Akoko South-East',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(581,'Akure North',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(582,'Akure South',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(583,'Ese Odo',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(584,'Idanre',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(585,'Ifedore',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(586,'Ilaje',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(587,'Ile Oluji/Okeigbo',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(588,'Irele',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(589,'Odigbo',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(590,'Okitipupa',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(591,'Ondo East',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(592,'Ondo West',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(593,'Ose',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(594,'Owo',4228,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(595,'Atakunmosa East',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(596,'Atakunmosa West',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(597,'Aiyedaade',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(598,'Aiyedire',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(599,'Boluwaduro',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(600,'Boripe',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(601,'Ede North',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(602,'Ede South',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(603,'Ife Central',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(604,'Ife East',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(605,'Ife North',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(606,'Ife South',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(607,'Egbedore',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(608,'Ejigbo',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(609,'Ifedayo',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(610,'Ifelodun',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(611,'Ila',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(612,'Ilesa East',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(613,'Ilesa West',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(614,'Irepodun',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(615,'Irewole',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(616,'Isokan',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(617,'Iwo',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(618,'Obokun',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(619,'Odo Otin',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(620,'Ola Oluwa',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(621,'Olorunda',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(622,'Oriade',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(623,'Orolu',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(624,'Osogbo',4229,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(625,'Afijio',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(626,'Akinyele',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(627,'Atiba',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(628,'Atigbo',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(629,'Egbeda',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(630,'Ibadan North',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(631,'Ibadan North-East',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(632,'Ibadan North-West',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(633,'Ibadan South-East',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(634,'Ibadan South-West',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(635,'Ibarapa Central',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(636,'Ibarapa East',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(637,'Ibarapa North',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(638,'Ido',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(639,'Irepo',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(640,'Iseyin',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(641,'Itesiwaju',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(642,'Iwajowa',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(643,'Kajola',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(644,'Lagelu',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(645,'Ogbomosho North',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(646,'Ogbomosho South',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(647,'Ogo Oluwa',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(648,'Olorunsogo',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(649,'Oluyole',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(650,'Ona Ara',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(651,'Orelope',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(652,'Ori Ire',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(653,'Oyo',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(654,'Oyo East',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(655,'Saki East',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(656,'Saki West',4230,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(657,'Bokkos',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(658,'Barkin Ladi',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(659,'Bassa',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(660,'Jos East',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(661,'Jos North',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(662,'Jos South',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(663,'Kanam',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(664,'Kanke',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(665,'Langtang South',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(666,'Langtang North',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(667,'Mangu',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(668,'Mikang',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(669,'Pankshin',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(670,'Qua\'an Pan',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(671,'Riyom',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(672,'Shendam',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(673,'Wase',4231,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(674,'Abua/Odual',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(675,'Ahoada East',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(676,'Ahoada West',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(677,'Akuku-Toru',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(678,'Andoni',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(679,'Asari-Toru',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(680,'Bonny',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(681,'Degema',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(682,'Eleme',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(683,'Emuoha',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(684,'Etche',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(685,'Gokana',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(686,'Ikwerre',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(687,'Khana',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(688,'Obio/Akpor',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(689,'Ogba/Egbema/Ndoni',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(690,'Ogu/Bolo',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(691,'Okrika',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(692,'Omuma',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(693,'Opobo/Nkoro',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(694,'Oyigbo',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(695,'Port Harcourt',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(696,'Tai',4232,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(697,'Binji',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(698,'Bodinga',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(699,'Dange Shuni',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(700,'Gada',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(701,'Goronyo',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(702,'Gudu',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(703,'Gwadabawa',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(704,'Illela',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(705,'Isa',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(706,'Kebbe',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(707,'Kware',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(708,'Rabah',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(709,'Sabon Birni',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(710,'Shagari',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(711,'Silame',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(712,'Sokoto North',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(713,'Sokoto South',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(714,'Tambuwal',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(715,'Tangaza',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(716,'Tureta',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(717,'Wamako',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(718,'Wurno',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(719,'Yabo',4233,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(720,'Ardo Kola',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(721,'Bali',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(722,'Donga',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(723,'Gashaka',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(724,'Gassol',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(725,'Ibi',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(726,'Jalingo',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(727,'Karim Lamido',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(728,'Kumi',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(729,'Lau',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(730,'Sardauna',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(731,'Takum',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(732,'Ussa',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(733,'Wukari',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(734,'Yorro',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(735,'Zing',4234,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(736,'Bade',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(737,'Bursari',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(738,'Damaturu',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(739,'Fika',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(740,'Fune',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(741,'Geidam',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(742,'Gujba',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(743,'Gulani',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(744,'Jakusko',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(745,'Karasuwa',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(746,'Machina',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(747,'Nangere',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(748,'Nguru',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(749,'Potiskum',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(750,'Tarmuwa',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(751,'Yunusari',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(752,'Yusufari',4235,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(753,'Anka',4236,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(754,'Bakura',4236,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(755,'Birnin Magaji/Kiyaw',4236,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(756,'Bukkuyum',4236,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(757,'Bungudu',4236,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(758,'Gummi',4236,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(759,'Gusau',4236,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(760,'Kaura Namoda',4236,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(761,'Maradun',4236,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(762,'Maru',4236,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(763,'Shinkafi',4236,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(764,'Talata Mafara',4236,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(765,'Chafe',4236,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(766,'Zurmi',4236,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(767,'Abaji',4200,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(768,'Bwari',4200,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(769,'Gwagwalada',4200,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(770,'Kuje',4200,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(771,'Kwali',4200,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(772,'Municipal Area Council',4200,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30'),
(773,'Test LG',1,NULL,'2020-06-23 09:34:30',NULL,'2020-06-23 09:34:30');

/*Table structure for table `maritalstatus` */

DROP TABLE IF EXISTS `maritalstatus`;

CREATE TABLE `maritalstatus` (
  `MaritalStatusID` int(10) NOT NULL AUTO_INCREMENT,
  `MaritalStatus` varchar(30) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT current_timestamp(),
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`MaritalStatusID`),
  UNIQUE KEY `PK_MaritalStatus` (`MaritalStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `maritalstatus` */

insert  into `maritalstatus`(`MaritalStatusID`,`MaritalStatus`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(7,'Single',0,'2020-04-17 22:05:37',NULL,'2020-04-17 22:05:37'),
(8,'Married',0,'2020-04-17 22:05:44',NULL,'2020-04-17 22:05:44'),
(9,'Divorced',0,'2020-04-17 22:06:08',NULL,'2020-04-17 22:06:08');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(150) DEFAULT NULL,
  `menu_href` varchar(150) DEFAULT NULL,
  `order_by` int(11) DEFAULT NULL,
  `active_id` int(11) DEFAULT NULL,
  `parent_menu_id` int(11) DEFAULT NULL,
  `menu_img` varchar(60) DEFAULT NULL,
  `dashbd_img` varchar(60) DEFAULT NULL,
  `dashbd_show` int(11) DEFAULT NULL,
  `moduleId` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`menu_id`,`menu_title`,`menu_href`,`order_by`,`active_id`,`parent_menu_id`,`menu_img`,`dashbd_img`,`dashbd_show`,`moduleId`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Company','#',1,1,155,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(2,'Branches','/company/branches',1,1,1,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(3,'Branch Types','/company/branchtypes',2,1,1,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(4,'Company','/company/company',3,1,1,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(5,'Department Group','/company/departmentgroup',4,1,1,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(6,'Departments','/company/departments',5,1,1,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(7,'Designations','/company/designations',6,1,1,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(8,'Divisions','/company/divisions',7,1,1,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(9,'Supervisor Types','/company/supervisortypes',8,1,1,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(10,'Units','/company/units',9,1,1,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(11,'Education','#',2,1,229,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(12,'Grade Levels','/education/gradelevels',1,1,11,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(13,'Grades','/education/grades',2,1,11,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(14,'Programme Types','/education/programmetypes',3,1,11,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(15,'Qualification Grade','/education/qualificationgrade',4,1,11,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(16,'Qualifications','/education/qualifications',5,1,11,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(17,'School Types','/education/schooltypes',6,1,11,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(18,'Employee','#',2,1,NULL,'users',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(19,'All Employees','/employee/employee',1,1,18,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(20,'Employee Deployment','/employee/employeedeployment',2,2,18,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(21,'Employee Designation','/employee/employeedesignation',3,2,18,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(22,'Employee Guarantor','/employee/employeeguarantor',4,2,18,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(23,'Relationship','/employee/relationship',5,1,156,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(24,'Leave Setup','#',4,1,157,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(25,'Holidays','/leave/holidays',9,1,24,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(26,'My Applications','/leave/leaveapplication',1,1,127,'list',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(27,'Leave Entitled Setup','/leave/leaveapplicationsetup',7,1,24,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(28,'Leave Approval','/leave/approval-hr',2,1,157,'file-signature',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(29,'Leave Employee Setup','/leave/leaveemployeeapplication',6,1,24,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(30,'Leave Planner','/leave/leaveplanner',4,1,127,'chart-line',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(31,'Leave Resumption','/leave/leaveresumption',5,1,127,'list',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(32,'Leave Types','/leave/leavetype',8,1,24,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(33,'Loan Setup','#',5,1,158,'shopping-bag',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(34,'Loan Application','/loan/loanapplication',1,1,158,'money-check',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(35,'Loan Approval','/loan/loanapproval',2,1,158,'file-signature',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(36,'Loan Repayment','/loan/loanrepayment',3,1,158,'money-check',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(37,'Loan Repayment Source','/loan/loanrepaymentsource',4,1,33,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(38,'Loan Repayment Type','/loan/loanrepaymenttype',5,1,33,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(39,'Loan Types','/loan/loantypes',6,1,33,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(40,'Menu Setup','#',6,2,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(41,'Menu','/menu/menu',1,1,40,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(42,'Menu Authorization','/menu/menuauthorization',2,1,40,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(43,'Menu Type','/menu/menutype',3,1,40,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(44,'Payroll Setup','#',1,1,231,'gear',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(45,'Payroll Category','/payroll/payrollcategory',1,1,44,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(46,'Payroll Generated','/payroll/payrollgenerated',2,2,44,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(47,'Payroll Generated Detail','/payroll/payrollgenerateddetail',3,2,44,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(48,'Payroll Instances','/payroll/payrollinstances',4,2,44,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(49,'Payroll Instance Types','/payroll/payrollinstancetypes',5,2,44,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(50,'Payroll Period','/payroll/payrollperiod',6,1,44,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(51,'Payroll Year','/payroll/payrollyear',7,1,44,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(52,'Customer Setup','#',8,2,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(53,'Customer','/customer/customer',1,1,52,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(54,'Customer Subtype','/customer/customersubtype',2,1,52,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(55,'Customer Type','/customer/customertype',3,1,52,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(56,'Employee Reward','/employee/employeereward',6,2,18,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(57,'Employee Sanction','/employee/employeesanction',7,2,18,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(58,'Offence','/employee/offence',8,1,156,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(59,'Reward','/employee/reward',9,1,156,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(60,'Sanction','/employee/sanction',10,2,156,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(61,'Expense','#',9,2,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(62,'Expense Category','/expense/expensecategory',1,1,61,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(63,'Expense Line','/expense/expenseline',2,1,61,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(64,'Item Setup','#',10,2,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(65,'Items','/item/items',1,1,64,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(66,'Item Category','/item/itemcategory',2,1,64,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(67,'Item Status','/item/itemstatus',3,1,64,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(68,'Item Type','/item/itemtype',4,1,64,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(69,'Payment Setup','#',11,2,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(70,'Payment','/payment/payment',1,1,69,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(71,'Payment Method','/payment/paymentmethod',2,1,69,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(72,'Payment Request','/payment/paymentplan',3,1,69,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(73,'Payment Tranche','/payment/paymenttranche',4,1,69,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(74,'Payment Type','/payment/paymenttype',5,1,69,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(75,'Procurement Setup','#',12,2,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(76,'Procurement','/procurement/procurement',1,1,75,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(77,'Procurement Details','/procurement/procurementdetails',2,1,75,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(78,'Procurement Vendor','/procurement/procurementvendor',3,1,75,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(79,'Product Setup','#',13,2,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(80,'Product','/product/product',1,1,79,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(81,'Product Category','/product/productcategory',2,1,79,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(82,'Product Type','/product/producttype',3,1,79,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(83,'Project Tracker','#',14,1,NULL,'project-diagram',NULL,NULL,2,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(84,'Project','/project/project',1,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(85,'Project Document Upload','/project/projectdocumentupload',2,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(86,'Project Expense','/project/projectexpense',3,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(87,'Project Manager','/project/projectmanager',4,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(88,'Project Milestone','/project/projectmilestone',5,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(89,'Project Review','/project/projectreview',6,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(90,'Project Review Plan','/project/projectreviewplan',7,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(91,'Project Risk','/project/projectrisk',8,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(92,'Project Status','/project/projectstatus',9,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(93,'Project Subtype','/project/projectsubtype',10,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(94,'Project Task','/project/projecttask',11,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(95,'Project Team','/project/projectteam',12,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(96,'Project Tool','/project/projecttool',13,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(97,'Project Type','/project/projecttype',14,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(98,'Risk','/project/risk',15,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(99,'Milestone Monitoring','/project/milestonemonitoring',16,1,83,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(100,'Purchase Setup','#',15,2,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(101,'Purchase','/purchase/purchase',1,1,100,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(102,'Purchase Details','/purchase/purchasedetails',2,1,100,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(103,'Purchase Type','/purchase/purchasetype',3,1,100,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(104,'Receipt','/purchase/receipt',4,1,100,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(105,'Receive Details','/purchase/receivedetails',5,1,100,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(106,'Receive Orders','/purchase/receiveorders',6,1,100,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(107,'Requisition Setup','#',16,2,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(108,'Requisition','/requisition/requisition',1,1,107,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(109,'Requisition Details','/requisition/requisitiondetails',2,1,107,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(110,'Store Setup','#',17,2,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(111,'Store','/store/store',1,1,110,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(112,'Store Items','/store/storeitems',2,1,110,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(113,'Task Manager','#',18,1,NULL,'tasks',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(114,'Task Delegation','/task/taskdelegation',1,1,249,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(115,'Task Priority','/task/taskpriority',2,1,249,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(116,'Task Status','/task/taskstatus',3,1,249,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(117,'Vendor Setup','#',19,2,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(118,'Vendors','/vendor/vendors',1,1,117,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(119,'Vendor Category','/vendor/vendorcategory',2,1,117,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(120,'Vendor Type','/vendor/vendortype',3,1,117,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(121,'Leave Calendar','/leave/leave-calendar',3,1,157,'calendar',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(122,'Net Pay report','/payroll/payrolldetail',3,1,142,'file-invoice',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(123,'Pay Slips','/payroll/batch-slip',4,1,142,'receipt',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(124,'Process Payroll','/payroll/process',1,1,142,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(125,'New Registration','/employee/new-employee',1,1,18,'user-edit',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(126,'Self Service','#',0,0,NULL,NULL,NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(127,'Leave','#',3,1,NULL,'tasks',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(128,'Apply For Leave','/leave/leaveapplication',2,0,127,'file-plus',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(129,'Leave Resumption','/leave/leaveresumption',3,1,157,'list',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(130,'Leave Approval','/leave/approval',4,1,127,'file-signature',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(131,'Loans','#',4,1,NULL,'shopping-bag',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(132,'Apply For Loan','/loan/loanapplication',1,1,131,'file-medical',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(133,'Loan Approval','/loan/loanapproval',2,1,131,'file-signature',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(134,'My Loan Applications','/loan/view-applications',3,1,131,'list',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(135,'Salary Setup','#',5,1,231,'gear',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(136,'Salary Type','/salary/salarytype',1,1,135,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(137,'Salary Components','/salary/salarycomponents',2,1,135,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(138,'Salary Formula','/salary/salaryformulae',3,1,135,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(139,'Variable Category','/salary/salaryvariablecategory',4,1,135,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(140,'Salary Variables','/salary/salaryvariables',3,1,142,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(141,'Variable Type','/salary/salaryvariabletype',6,1,135,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(142,'Payroll','#',2,1,NULL,'calculator',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(143,'Vehicle Management','#',20,1,NULL,NULL,NULL,NULL,4,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(144,'Engine Type','/vehicle/enginetype',2,1,143,NULL,NULL,NULL,4,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(145,'Frequency','/vehicle/frequency',3,1,143,NULL,NULL,NULL,4,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(146,'Vehicle','/vehicle/vehicle',1,1,143,NULL,NULL,NULL,4,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(147,'Vehicle Booking','/vehicle/vehiclebooking',4,1,143,NULL,NULL,NULL,4,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(148,'Vehicle Driver','/vehicle/vehicledriver',5,1,143,NULL,NULL,NULL,4,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(149,'Vehicle Expense Category','/vehicle/vehicleexpensecategory',6,1,143,NULL,NULL,NULL,4,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(150,'Vehicle Expense Transactions','/vehicle/vehicleexpensetransactions',7,1,143,NULL,NULL,NULL,4,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(151,'Vehicle Income Category','/vehicle/vehicleincomecategory',8,1,143,NULL,NULL,NULL,4,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(152,'Vehicle Income Transactions','/vehicle/vehicleincometransactions',9,1,143,NULL,NULL,NULL,4,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(153,'Vehicle Parts','/vehicle/vehiclepart',10,1,143,NULL,NULL,NULL,4,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(154,'Vehicle Part Requisition','/vehicle/vehiclepartrequisition',11,1,143,NULL,NULL,NULL,4,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(155,'Settings','#',200,1,NULL,'gear',NULL,NULL,0,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(156,'Employee Setup','#',1,1,229,'user-cog',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(157,'Leave Tracker','#',3,1,NULL,'tasks',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(158,'Loan Manager','#',4,1,NULL,'shopping-bag',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(159,'Privileges','/privilege/privileges',4,1,235,'unlock',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(160,'Privilege Class','/privilege/privilege_class',5,1,235,'unlock',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(161,'Privilege Details','/privilege/privilege_details',6,0,235,'lock-alt',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(162,'Assign/Revoke Privileges','/privilege/privilege_header',7,1,234,'user-lock',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(163,'Privilege Type','/privilege/privilege_type',8,2,235,'lock-alt',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(164,'Shift Setup','#',22,1,179,'gear',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(165,'Shifts','/shift/shifts',1,1,164,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(166,'Shift Category','/shift/shift_category',2,1,164,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(167,'Shift Config','/shift/shift_config',3,1,164,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(168,'Shift Days','/shift/shift_days',4,1,164,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(169,'Shift Exclude','/shift/shift_exclude',5,1,164,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(170,'Attendance Schedules','/shift/shift_schedules',6,1,179,'calendar-alt',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(171,'Shift Schedule Details','/shift/shift_schedule_details',7,1,164,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(172,'Shift Schedule Employees','/shift/shift_schedule_employees',8,1,164,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(173,'Shift Status','/shift/shift_status',9,1,164,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(174,'Shift Status Category','/shift/shift_status_category',10,1,164,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(175,'Attendance Templates','/shift/shift_templates',11,1,179,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(176,'Shift Template Details','/shift/shift_template_details',12,1,164,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(177,'Attendance History','/shift/shift_transactions',1,1,179,'user-clock',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(178,'Shift Types','/shift/shift_types',14,1,164,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(179,'Attendance','#',8,1,NULL,'clock',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(180,'Cancel Payroll','/payroll/cancel',2,1,142,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(181,'My Payroll History','/ess/payslip',5,1,NULL,'receipt',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(182,'Appraisal','#',5,1,NULL,'user',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(183,'My Kpis','/appraisal/kpi',2,1,182,'user',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(184,'KPI Approval Bin','/appraisal/kpi-bin',3,1,182,'user',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(185,'Initate Appraisal','/appraisal/appraisalheader',4,1,182,'user',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(186,'View Appraisals','/',5,1,182,'user',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(187,'Appraisal Approval Bin','/appraisal/appraisal-bin',6,1,182,'user',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(188,'Approval Bins','#',2,0,NULL,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(189,'Appraisal Setup','#',3,1,230,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(190,'Benchmark/Grading','#',1,1,189,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(191,'Actions','/benchmarks/actions',1,1,190,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(192,'Action Types','/benchmarks/actiontypes',2,1,190,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(193,'Benchmarks','/benchmarks/benchmark',3,1,190,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(194,'Benchmark Actions','/benchmarks/benchmark_actions',4,1,190,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(195,'KPI','#',2,1,189,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(196,'KPI Class','/kpi/kpiclass',1,1,195,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(197,'KPI Types','/kpi/kpi_type',2,1,195,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(198,'KPI Class Scoring','/kpi/kpi_classscoring',3,1,195,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(199,'KPI Type Scoring','/kpi/kpi_typescoring',4,1,195,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(200,'Period','#',3,1,189,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(201,'Appraisal Year','/periods/years',1,1,200,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(202,'Period','/periods/periods',2,1,200,'list',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(203,'Chart','/appraisal/appraisal-chart',0,1,182,'chart',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(213,'Recruitment Manager','#',1,1,NULL,'people-arrows',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(214,'Applicant CV','/recruitment/applicantcv',2,0,213,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(215,'Applicants','/recruitment/applicants',1,1,213,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(216,'Contract Type','/recruitment/contracttype',3,1,228,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(217,'Employment Type','/recruitment/employmenttype',4,1,228,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(218,'Experience Level','/recruitment/experiencelevel',5,1,228,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(219,'Job Application','/recruitment/jobapplication',6,1,213,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(220,'Job Interview','/recruitment/jobinterview',8,1,213,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(221,'Job Offer','/recruitment/joboffer',9,1,213,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(222,'Job Shortlist','/recruitment/jobshortlist',7,1,213,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(223,'Recruitment Stage','/recruitment/recruitmentstage',10,1,228,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(224,'Recruitment Status','/recruitment/recruitmentstatus',11,1,228,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(225,'Vacancy','/recruitment/vacancy',0,1,213,'plus',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(228,'Recruitment Setup','#',20,1,213,'gear',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(229,'Employee Settings','#',10,1,18,'gear',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(230,'Performance Tracker','#',6,1,NULL,'tasks',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(231,'Payroll Settings','#',20,1,142,'gear',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(232,'Report','/employee/report',4,1,18,'table',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(233,'Chart Generator','/employee/report-chart',6,1,18,'chart-bar',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(234,'Privilege Manager','#',10,1,NULL,'user-lock',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(235,'Privilege Setup','#',3,1,155,'unlock',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(236,'Dashboard','/employee',0,1,NULL,'tachometer-alt',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(237,'Add Task','/task/task',4,1,248,'plus',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(238,'Task List','/task/tasknote',5,1,248,NULL,NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(239,'View Task','/task/tasknote-view',6,1,248,NULL,NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(240,'Task Scheduler','/task/task-calendar',7,1,113,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(241,'Add Task(Admin)','/task/task-admin',8,1,113,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(242,'Task List(Admin)','/task/tasknote-admin',9,1,113,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(243,'Project Category','/project/projectcategory',17,1,251,NULL,NULL,NULL,2,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(244,'Sub Projects','/project/projectsub',18,1,83,'project-diagram',NULL,NULL,2,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(245,'Project Sub Category','/project/projectsubcategory',19,1,251,'',NULL,NULL,2,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(246,'Project Team Reassignment','/project/projectteamreassignment',20,1,83,NULL,NULL,NULL,2,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(247,'Projects','/project/project-view',1,1,83,'project-diagram',NULL,NULL,2,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(248,'Tasks','#',8,1,NULL,'tasks',NULL,NULL,3,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(249,'Task Settings','#',20,1,113,'gear',NULL,NULL,1,NULL,'2020-06-23 09:34:36',NULL,'2020-06-23 09:34:36'),
(250,'My Profile','/ess/employee-profile',0,1,NULL,'id-badge',NULL,NULL,3,NULL,'2020-06-23 10:53:27',NULL,'2020-06-23 10:53:27'),
(251,'Project Settings','#',20,1,83,'gear',NULL,NULL,2,NULL,'2020-06-23 13:22:57',NULL,'2020-06-23 13:22:57'),
(252,'Job Interview View','/recruitment/jobinterview-view',11,1,213,NULL,NULL,NULL,1,NULL,'2020-06-26 13:43:29',NULL,'2020-06-26 13:43:29'),
(253,'Job Shortlist View','/recruitment/jobshortlist-view',12,1,213,NULL,NULL,NULL,1,NULL,'2020-06-26 13:43:49',NULL,'2020-06-26 13:43:49'),
(254,'Job Interview Details View','/recruitment/jobinterview-detail-view',13,1,213,NULL,NULL,NULL,1,NULL,'2020-07-06 11:29:45',NULL,'2020-07-06 11:29:45'),
(255,'Job ShortList Details View','/recruitment/jobshortlist-detail-view',14,1,213,NULL,NULL,NULL,1,NULL,'2020-07-06 11:31:27',NULL,'2020-07-06 11:31:27'),
(256,'Years of Experience','/recruitment/years-of-experience',15,1,228,NULL,NULL,NULL,1,NULL,'2020-07-18 08:02:09',NULL,'2020-07-18 08:02:09');

/*Table structure for table `menu_authorization` */

DROP TABLE IF EXISTS `menu_authorization`;

CREATE TABLE `menu_authorization` (
  `authorise_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `privilege_id` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`authorise_id`),
  KEY `fk_tbl_menuauthorise_privileges1_idx` (`privilege_id`),
  KEY `fk_tbl_menuauthorise_tbl_menu1_idx` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menu_authorization` */

/*Table structure for table `menuauthorization` */

DROP TABLE IF EXISTS `menuauthorization`;

CREATE TABLE `menuauthorization` (
  `MenuAuthorizationID` int(11) NOT NULL AUTO_INCREMENT,
  `MenuID` int(11) DEFAULT NULL,
  `PrivilegesID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`MenuAuthorizationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `menuauthorization` */

/*Table structure for table `menutype` */

DROP TABLE IF EXISTS `menutype`;

CREATE TABLE `menutype` (
  `MenuTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `MenuType` varchar(50) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`MenuTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `menutype` */

/*Table structure for table `milestonemonitoring` */

DROP TABLE IF EXISTS `milestonemonitoring`;

CREATE TABLE `milestonemonitoring` (
  `MilestoneMonitoringID` int(10) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(10) DEFAULT NULL,
  `ProjectMilestoneID` int(10) DEFAULT NULL,
  `ScoreID` int(10) DEFAULT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`MilestoneMonitoringID`),
  UNIQUE KEY `PK_MilestoneMonitoring` (`MilestoneMonitoringID`),
  KEY `IX_Relationship33` (`ScoreID`),
  KEY `IX_Relationship34` (`ProjectID`),
  KEY `IX_Relationship35` (`ProjectMilestoneID`),
  CONSTRAINT `Relationship_c33` FOREIGN KEY (`ScoreID`) REFERENCES `score` (`ScoreID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_c34` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_c35` FOREIGN KEY (`ProjectMilestoneID`) REFERENCES `projectmilestone` (`ProjectMilestoneID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `milestonemonitoring` */

/*Table structure for table `modules` */

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `moduleId` int(11) NOT NULL,
  `moduleName` varchar(300) DEFAULT NULL,
  `order_by` int(11) DEFAULT NULL,
  `active_id` int(11) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`moduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `modules` */

insert  into `modules`(`moduleId`,`moduleName`,`order_by`,`active_id`,`url`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(0,'Generic',NULL,1,NULL,NULL,'2020-06-23 09:34:43',NULL,'2020-06-23 09:34:43'),
(1,'Human Resources',NULL,1,NULL,NULL,'2020-06-23 09:34:43',NULL,'2020-06-23 09:34:43'),
(2,'Project Management',NULL,1,NULL,NULL,'2020-06-23 09:34:43',NULL,'2020-06-23 09:34:43'),
(3,'Self Service',NULL,1,NULL,NULL,'2020-06-23 09:34:43',NULL,'2020-06-23 09:34:43'),
(4,'Logistics Management',NULL,1,NULL,NULL,'2020-06-23 09:34:43',NULL,'2020-06-23 09:34:43');

/*Table structure for table `offence` */

DROP TABLE IF EXISTS `offence`;

CREATE TABLE `offence` (
  `OffenceID` int(10) NOT NULL AUTO_INCREMENT,
  `Offence` varchar(100) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`OffenceID`),
  UNIQUE KEY `PK_Offence` (`OffenceID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `offence` */

insert  into `offence`(`OffenceID`,`Offence`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Late Coming',0,'2019-11-24 02:25:48.627000',NULL,NULL),
(2,'Disturbance',0,'2019-11-24 02:26:00.953000',NULL,NULL),
(3,'Negligence ',0,'2019-11-24 02:26:11.097000',NULL,NULL),
(4,'Absent',0,'2019-11-24 02:26:18.620000',NULL,NULL),
(5,'Harassment',NULL,NULL,NULL,NULL),
(6,'Theft',NULL,NULL,NULL,NULL),
(7,'Embezzlement',NULL,NULL,NULL,NULL),
(8,'Sabotage',NULL,NULL,NULL,NULL),
(9,'Misuse of Assets',NULL,NULL,NULL,NULL),
(10,'Assault',NULL,NULL,NULL,NULL);

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `PaymentID` int(10) NOT NULL AUTO_INCREMENT,
  `PVNumber` varchar(30) DEFAULT NULL,
  `CompanyID` int(10) DEFAULT NULL,
  `PayingAccountID` int(10) DEFAULT NULL,
  `PaymentMethodID` int(10) DEFAULT NULL,
  `ChequeNo` varchar(30) DEFAULT NULL,
  `PaymentDate` timestamp(6) NULL DEFAULT NULL,
  `PaymentTypeID` int(10) DEFAULT NULL,
  `VATID` int(10) DEFAULT NULL,
  `WHTID` int(10) DEFAULT NULL,
  `PayeeID` int(10) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  UNIQUE KEY `PK_Payment` (`PaymentID`),
  KEY `IX_Relationship125` (`PaymentMethodID`),
  KEY `IX_Relationship126` (`CompanyID`),
  KEY `IX_Relationship127` (`PaymentTypeID`),
  KEY `IX_Relationship128` (`VATID`),
  KEY `IX_Relationship129` (`WHTID`),
  CONSTRAINT `Relationship_r125` FOREIGN KEY (`PaymentMethodID`) REFERENCES `paymentmethod` (`PaymentMethodID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_r126` FOREIGN KEY (`CompanyID`) REFERENCES `company` (`CompanyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_r127` FOREIGN KEY (`PaymentTypeID`) REFERENCES `paymenttype` (`PaymentTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_r128` FOREIGN KEY (`VATID`) REFERENCES `vat` (`VATID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_r129` FOREIGN KEY (`WHTID`) REFERENCES `wht` (`WHTID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `payment` */

/*Table structure for table `paymentmethod` */

DROP TABLE IF EXISTS `paymentmethod`;

CREATE TABLE `paymentmethod` (
  `PaymentMethodID` int(10) NOT NULL AUTO_INCREMENT,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`PaymentMethodID`),
  UNIQUE KEY `PK_PaymentMethod` (`PaymentMethodID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `paymentmethod` */

insert  into `paymentmethod`(`PaymentMethodID`,`PaymentMethod`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Cheque',0,'2019-12-06 11:25:18.960000',0,'2019-12-06 17:25:26.183000'),
(2,'Cash Lodgement ',0,'2019-12-06 17:25:43.813000',NULL,NULL),
(3,'Bank Transfer',0,'2019-12-06 17:25:52.760000',NULL,NULL);

/*Table structure for table `paymentplan` */

DROP TABLE IF EXISTS `paymentplan`;

CREATE TABLE `paymentplan` (
  `PaymentPlanID` int(10) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(10) DEFAULT NULL,
  `PaymentTrancheID` int(10) DEFAULT NULL,
  `PaymentAmount` float DEFAULT NULL,
  `PaymentMethod` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PaymentPlanID`),
  UNIQUE KEY `PK_PaymentPlan` (`PaymentPlanID`),
  KEY `IX_Relationship31` (`PaymentTrancheID`),
  KEY `IX_Relationship32` (`ProjectID`),
  CONSTRAINT `Relationship_c31` FOREIGN KEY (`PaymentTrancheID`) REFERENCES `paymenttranche` (`PaymentTrancheID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_c32` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `paymentplan` */

/*Table structure for table `paymenttranche` */

DROP TABLE IF EXISTS `paymenttranche`;

CREATE TABLE `paymenttranche` (
  `PaymentTrancheID` int(10) NOT NULL AUTO_INCREMENT,
  `Tranche` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PaymentTrancheID`),
  UNIQUE KEY `PK_PaymentTranche` (`PaymentTrancheID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `paymenttranche` */

insert  into `paymenttranche`(`PaymentTrancheID`,`Tranche`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'3 Months',NULL,'2020-06-23 09:34:49',NULL,'2020-06-23 09:34:49'),
(2,'6 Months',NULL,'2020-06-23 09:34:49',NULL,'2020-06-23 09:34:49'),
(3,'9 Months',NULL,'2020-06-23 09:34:49',NULL,'2020-06-23 09:34:49'),
(4,'12 Months',NULL,'2020-06-23 09:34:49',NULL,'2020-06-23 09:34:49');

/*Table structure for table `paymenttype` */

DROP TABLE IF EXISTS `paymenttype`;

CREATE TABLE `paymenttype` (
  `PaymentTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `PaymentType` varchar(50) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`PaymentTypeID`),
  UNIQUE KEY `PK_PaymentType` (`PaymentTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `paymenttype` */

insert  into `paymenttype`(`PaymentTypeID`,`PaymentType`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Test Payment Type 1',0,'2019-12-06 11:25:34.647000',NULL,NULL);

/*Table structure for table `payrollcategory` */

DROP TABLE IF EXISTS `payrollcategory`;

CREATE TABLE `payrollcategory` (
  `PayrollCategoryID` int(10) NOT NULL AUTO_INCREMENT,
  `PayrollCategory` varchar(30) NOT NULL,
  `Percentage` float DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PayrollCategoryID`),
  UNIQUE KEY `PK_Payroll Category` (`PayrollCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `payrollcategory` */

insert  into `payrollcategory`(`PayrollCategoryID`,`PayrollCategory`,`Percentage`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Payroll',100,NULL,'2020-06-23 09:34:50',NULL,'2020-06-23 09:34:50'),
(2,'13th Month',53,NULL,'2020-06-23 09:34:50',NULL,'2020-06-23 09:34:50'),
(3,'Deductions',3,NULL,'2020-06-23 09:34:50',NULL,'2020-06-23 09:34:50'),
(4,'Employer Expenses',8,NULL,'2020-06-23 09:34:50',NULL,'2020-06-23 09:34:50'),
(5,'Taxes',10,NULL,'2020-06-23 09:34:50',NULL,'2020-06-23 09:34:50');

/*Table structure for table `payrollgenerated` */

DROP TABLE IF EXISTS `payrollgenerated`;

CREATE TABLE `payrollgenerated` (
  `PayrollGeneratedID` int(10) NOT NULL AUTO_INCREMENT,
  `PayrollID` int(10) NOT NULL,
  `EmployeeID` int(10) DEFAULT NULL,
  `GradeID` int(11) DEFAULT NULL,
  `GradeLevelID` int(11) DEFAULT NULL,
  `UnitID` int(11) DEFAULT NULL,
  `CompanyID` int(11) DEFAULT NULL,
  `BranchID` int(11) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL,
  `DesignationID` int(11) DEFAULT NULL,
  `EmployeeTypeID` int(11) DEFAULT NULL,
  `PensionProviderID` int(11) DEFAULT NULL,
  `BankID` int(11) DEFAULT NULL,
  `BankAccountNo` varchar(300) DEFAULT NULL,
  `PayrollCategoryID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PayrollGeneratedID`),
  UNIQUE KEY `PK_Payroll Generated` (`PayrollGeneratedID`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;

/*Data for the table `payrollgenerated` */

insert  into `payrollgenerated`(`PayrollGeneratedID`,`PayrollID`,`EmployeeID`,`GradeID`,`GradeLevelID`,`UnitID`,`CompanyID`,`BranchID`,`DepartmentID`,`DesignationID`,`EmployeeTypeID`,`PensionProviderID`,`BankID`,`BankAccountNo`,`PayrollCategoryID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(131,2,124,1,8,NULL,1,NULL,5,2,7,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(132,2,125,1,9,NULL,1,NULL,5,8,7,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(133,2,126,1,10,NULL,1,NULL,5,1,7,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(134,2,127,1,11,NULL,1,NULL,5,NULL,7,1,1,'0123456',1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(135,2,128,1,12,NULL,1,NULL,5,NULL,7,1,3,'0123456',1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(136,2,129,1,13,NULL,1,NULL,6,NULL,NULL,3,1,'0123456',1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(137,2,130,1,14,NULL,1,NULL,7,NULL,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(138,2,131,1,10,NULL,1,NULL,7,NULL,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(146,2,124,1,8,NULL,1,NULL,5,2,7,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(147,2,125,1,9,NULL,1,NULL,5,8,7,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(148,2,126,1,10,NULL,1,NULL,5,1,7,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(149,2,127,1,11,NULL,1,NULL,5,NULL,7,1,1,'0123456',1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(150,2,128,1,12,NULL,1,NULL,5,NULL,7,1,3,'0123456',1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(151,2,129,1,13,NULL,1,NULL,6,NULL,NULL,3,1,'0123456',1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(152,2,130,1,14,NULL,1,NULL,7,NULL,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(153,2,131,1,10,NULL,1,NULL,7,NULL,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(176,3,124,1,8,NULL,1,NULL,5,2,7,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(177,3,125,1,9,NULL,1,NULL,5,8,7,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(178,3,126,1,10,NULL,1,NULL,5,1,7,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(179,3,127,1,11,NULL,1,NULL,5,NULL,7,1,1,'0123456',1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(180,3,128,1,12,NULL,1,NULL,5,NULL,7,1,3,'0123456',1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(181,3,129,1,13,NULL,1,NULL,6,NULL,NULL,3,1,'0123456',1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(182,3,130,1,14,NULL,1,NULL,7,NULL,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(183,3,131,1,10,NULL,1,NULL,7,NULL,NULL,NULL,NULL,NULL,1,NULL,'2020-06-23 09:34:59',NULL,'2020-06-23 09:34:59'),
(199,1,124,1,8,NULL,1,NULL,5,2,7,NULL,NULL,NULL,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(200,1,125,1,9,NULL,1,NULL,5,8,7,NULL,NULL,NULL,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(201,1,126,1,10,NULL,1,NULL,5,1,7,NULL,NULL,NULL,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(202,1,127,1,11,NULL,1,NULL,5,NULL,7,1,1,'0123456',1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(203,1,128,1,12,NULL,1,NULL,5,NULL,7,1,3,'0123456',1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(204,1,129,1,13,NULL,1,NULL,6,NULL,8,3,1,'0123456',1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(205,1,130,1,14,NULL,1,NULL,7,NULL,8,NULL,NULL,NULL,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(206,1,131,1,10,NULL,1,NULL,7,NULL,8,NULL,NULL,NULL,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(207,1,132,1,8,1,1,1,5,1,9,1,6,'dafda',1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(208,1,133,1,8,2,1,1,10,22,7,1,1,'dfafdaf',1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33');

/*Table structure for table `payrollgenerateddetail` */

DROP TABLE IF EXISTS `payrollgenerateddetail`;

CREATE TABLE `payrollgenerateddetail` (
  `PayrollGeneratedDetailID` int(10) NOT NULL AUTO_INCREMENT,
  `PayrollGeneratedID` int(10) DEFAULT NULL,
  `SalaryComponent` varchar(50) DEFAULT NULL,
  `Debit` decimal(19,4) DEFAULT NULL,
  `Credit` decimal(19,4) DEFAULT NULL,
  `Amount` decimal(19,4) DEFAULT NULL,
  `SalaryComponentID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PayrollGeneratedDetailID`),
  UNIQUE KEY `PK_Payroll Generated Detail` (`PayrollGeneratedDetailID`),
  KEY `IX_Relationship107` (`SalaryComponentID`),
  CONSTRAINT `Relationship107` FOREIGN KEY (`SalaryComponentID`) REFERENCES `salarycomponent` (`SalaryComponentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2660 DEFAULT CHARSET=utf8;

/*Data for the table `payrollgenerateddetail` */

insert  into `payrollgenerateddetail`(`PayrollGeneratedDetailID`,`PayrollGeneratedID`,`SalaryComponent`,`Debit`,`Credit`,`Amount`,`SalaryComponentID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1725,131,NULL,0.0000,3333.3333,3333.3333,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1726,131,NULL,0.0000,1333.3333,1333.3333,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1727,131,NULL,0.0000,1200.0000,1200.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1728,131,NULL,0.0000,533.3333,533.3333,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1729,131,NULL,0.0000,266.6667,266.6667,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1730,131,NULL,0.0000,800.0000,800.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1731,132,NULL,0.0000,3750.0000,3750.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1732,132,NULL,0.0000,1500.0000,1500.0000,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1733,132,NULL,0.0000,1350.0000,1350.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1734,132,NULL,0.0000,600.0000,600.0000,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1735,132,NULL,0.0000,300.0000,300.0000,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1736,133,NULL,0.0000,4166.6667,4166.6667,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1737,133,NULL,0.0000,1666.6667,1666.6667,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1738,133,NULL,0.0000,1500.0000,1500.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1739,133,NULL,0.0000,666.6667,666.6667,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1740,133,NULL,0.0000,333.3333,333.3333,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1741,134,NULL,0.0000,5000.0000,5000.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1742,134,NULL,0.0000,2000.0000,2000.0000,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1743,134,NULL,0.0000,1800.0000,1800.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1744,134,NULL,0.0000,800.0000,800.0000,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1745,134,NULL,0.0000,400.0000,400.0000,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1746,135,NULL,0.0000,5833.3333,5833.3333,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1747,135,NULL,0.0000,2333.3333,2333.3333,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1748,135,NULL,0.0000,2100.0000,2100.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1749,135,NULL,0.0000,933.3333,933.3333,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1750,135,NULL,0.0000,466.6667,466.6667,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1751,136,NULL,0.0000,6666.6667,6666.6667,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1752,136,NULL,0.0000,2666.6667,2666.6667,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1753,136,NULL,0.0000,2400.0000,2400.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1754,136,NULL,0.0000,1066.6667,1066.6667,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1755,136,NULL,0.0000,533.3333,533.3333,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1756,137,NULL,0.0000,7500.0000,7500.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1757,137,NULL,0.0000,3000.0000,3000.0000,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1758,137,NULL,0.0000,2700.0000,2700.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1759,137,NULL,0.0000,1200.0000,1200.0000,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1760,137,NULL,0.0000,600.0000,600.0000,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1761,138,NULL,0.0000,4166.6667,4166.6667,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1762,138,NULL,0.0000,1666.6667,1666.6667,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1763,138,NULL,0.0000,1500.0000,1500.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1764,138,NULL,0.0000,666.6667,666.6667,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1765,138,NULL,0.0000,333.3333,333.3333,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1788,131,NULL,533.3333,0.0000,-533.3333,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1789,132,NULL,600.0000,0.0000,-600.0000,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1790,133,NULL,666.6667,0.0000,-666.6667,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1791,134,NULL,800.0000,0.0000,-800.0000,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1792,135,NULL,933.3333,0.0000,-933.3333,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1793,136,NULL,1066.6667,0.0000,-1066.6667,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1794,137,NULL,1200.0000,0.0000,-1200.0000,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1795,138,NULL,666.6667,0.0000,-666.6667,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1803,131,NULL,0.0000,1333.3333,1333.3333,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1804,131,NULL,16666.6667,66.6667,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1805,132,NULL,0.0000,1500.0000,1500.0000,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1806,132,NULL,16666.6667,75.0000,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1807,133,NULL,0.0000,1666.6667,1666.6667,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1808,133,NULL,16666.6667,83.3333,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1809,134,NULL,0.0000,2000.0000,2000.0000,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1810,134,NULL,16666.6667,100.0000,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1811,135,NULL,0.0000,2333.3333,2333.3333,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1812,135,NULL,16666.6667,116.6667,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1813,136,NULL,0.0000,2666.6667,2666.6667,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1814,136,NULL,16666.6667,133.3333,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1815,137,NULL,0.0000,3000.0000,3000.0000,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1816,137,NULL,16666.6667,150.0000,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1817,138,NULL,0.0000,1666.6667,1666.6667,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1818,138,NULL,16666.6667,83.3333,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1834,131,NULL,74.6667,0.0000,-74.6667,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1835,132,NULL,75.0000,0.0000,-75.0000,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1836,133,NULL,83.3333,0.0000,-83.3333,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1837,134,NULL,100.0000,0.0000,-100.0000,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1838,135,NULL,116.6667,0.0000,-116.6667,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1839,136,NULL,133.3333,0.0000,-133.3333,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1840,137,NULL,150.0000,0.0000,-150.0000,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1841,138,NULL,83.3333,0.0000,-83.3333,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1849,131,NULL,0.0000,3333.3333,3333.3333,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1850,131,NULL,0.0000,1333.3333,1333.3333,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1851,131,NULL,0.0000,1200.0000,1200.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1852,131,NULL,0.0000,533.3333,533.3333,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1853,131,NULL,0.0000,266.6667,266.6667,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1854,131,NULL,0.0000,800.0000,800.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1855,132,NULL,0.0000,3750.0000,3750.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1856,132,NULL,0.0000,1500.0000,1500.0000,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1857,132,NULL,0.0000,1350.0000,1350.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1858,132,NULL,0.0000,600.0000,600.0000,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1859,132,NULL,0.0000,300.0000,300.0000,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1860,133,NULL,0.0000,4166.6667,4166.6667,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1861,133,NULL,0.0000,1666.6667,1666.6667,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1862,133,NULL,0.0000,1500.0000,1500.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1863,133,NULL,0.0000,666.6667,666.6667,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1864,133,NULL,0.0000,333.3333,333.3333,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1865,134,NULL,0.0000,5000.0000,5000.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1866,134,NULL,0.0000,2000.0000,2000.0000,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1867,134,NULL,0.0000,1800.0000,1800.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1868,134,NULL,0.0000,800.0000,800.0000,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1869,134,NULL,0.0000,400.0000,400.0000,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1870,135,NULL,0.0000,5833.3333,5833.3333,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1871,135,NULL,0.0000,2333.3333,2333.3333,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1872,135,NULL,0.0000,2100.0000,2100.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1873,135,NULL,0.0000,933.3333,933.3333,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1874,135,NULL,0.0000,466.6667,466.6667,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1875,136,NULL,0.0000,6666.6667,6666.6667,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1876,136,NULL,0.0000,2666.6667,2666.6667,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1877,136,NULL,0.0000,2400.0000,2400.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1878,136,NULL,0.0000,1066.6667,1066.6667,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1879,136,NULL,0.0000,533.3333,533.3333,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1880,137,NULL,0.0000,7500.0000,7500.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1881,137,NULL,0.0000,3000.0000,3000.0000,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1882,137,NULL,0.0000,2700.0000,2700.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1883,137,NULL,0.0000,1200.0000,1200.0000,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1884,137,NULL,0.0000,600.0000,600.0000,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1885,138,NULL,0.0000,4166.6667,4166.6667,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1886,138,NULL,0.0000,1666.6667,1666.6667,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1887,138,NULL,0.0000,1500.0000,1500.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1888,138,NULL,0.0000,666.6667,666.6667,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1889,138,NULL,0.0000,333.3333,333.3333,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1890,146,NULL,0.0000,3333.3333,3333.3333,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1891,146,NULL,0.0000,1333.3333,1333.3333,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1892,146,NULL,0.0000,1200.0000,1200.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1893,146,NULL,0.0000,533.3333,533.3333,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1894,146,NULL,0.0000,266.6667,266.6667,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1895,146,NULL,0.0000,800.0000,800.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1896,147,NULL,0.0000,3750.0000,3750.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1897,147,NULL,0.0000,1500.0000,1500.0000,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1898,147,NULL,0.0000,1350.0000,1350.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1899,147,NULL,0.0000,600.0000,600.0000,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1900,147,NULL,0.0000,300.0000,300.0000,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1901,148,NULL,0.0000,4166.6667,4166.6667,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1902,148,NULL,0.0000,1666.6667,1666.6667,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1903,148,NULL,0.0000,1500.0000,1500.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1904,148,NULL,0.0000,666.6667,666.6667,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1905,148,NULL,0.0000,333.3333,333.3333,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1906,149,NULL,0.0000,5000.0000,5000.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1907,149,NULL,0.0000,2000.0000,2000.0000,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1908,149,NULL,0.0000,1800.0000,1800.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1909,149,NULL,0.0000,800.0000,800.0000,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1910,149,NULL,0.0000,400.0000,400.0000,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1911,150,NULL,0.0000,5833.3333,5833.3333,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1912,150,NULL,0.0000,2333.3333,2333.3333,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1913,150,NULL,0.0000,2100.0000,2100.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1914,150,NULL,0.0000,933.3333,933.3333,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1915,150,NULL,0.0000,466.6667,466.6667,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1916,151,NULL,0.0000,6666.6667,6666.6667,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1917,151,NULL,0.0000,2666.6667,2666.6667,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1918,151,NULL,0.0000,2400.0000,2400.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1919,151,NULL,0.0000,1066.6667,1066.6667,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1920,151,NULL,0.0000,533.3333,533.3333,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1921,152,NULL,0.0000,7500.0000,7500.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1922,152,NULL,0.0000,3000.0000,3000.0000,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1923,152,NULL,0.0000,2700.0000,2700.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1924,152,NULL,0.0000,1200.0000,1200.0000,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1925,152,NULL,0.0000,600.0000,600.0000,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1926,153,NULL,0.0000,4166.6667,4166.6667,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1927,153,NULL,0.0000,1666.6667,1666.6667,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1928,153,NULL,0.0000,1500.0000,1500.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1929,153,NULL,0.0000,666.6667,666.6667,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1930,153,NULL,0.0000,333.3333,333.3333,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1976,131,NULL,533.3333,0.0000,-533.3333,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1977,132,NULL,600.0000,0.0000,-600.0000,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1978,133,NULL,666.6667,0.0000,-666.6667,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1979,134,NULL,800.0000,0.0000,-800.0000,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1980,135,NULL,933.3333,0.0000,-933.3333,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1981,136,NULL,1066.6667,0.0000,-1066.6667,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1982,137,NULL,1200.0000,0.0000,-1200.0000,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1983,138,NULL,666.6667,0.0000,-666.6667,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1984,146,NULL,533.3333,0.0000,-533.3333,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1985,147,NULL,600.0000,0.0000,-600.0000,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1986,148,NULL,666.6667,0.0000,-666.6667,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1987,149,NULL,800.0000,0.0000,-800.0000,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1988,150,NULL,933.3333,0.0000,-933.3333,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1989,151,NULL,1066.6667,0.0000,-1066.6667,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1990,152,NULL,1200.0000,0.0000,-1200.0000,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(1991,153,NULL,666.6667,0.0000,-666.6667,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2007,131,NULL,0.0000,1333.3333,1333.3333,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2008,131,NULL,16666.6667,66.6667,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2009,132,NULL,0.0000,1500.0000,1500.0000,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2010,132,NULL,16666.6667,75.0000,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2011,133,NULL,0.0000,1666.6667,1666.6667,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2012,133,NULL,16666.6667,83.3333,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2013,134,NULL,0.0000,2000.0000,2000.0000,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2014,134,NULL,16666.6667,100.0000,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2015,135,NULL,0.0000,2333.3333,2333.3333,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2016,135,NULL,16666.6667,116.6667,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2017,136,NULL,0.0000,2666.6667,2666.6667,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2018,136,NULL,16666.6667,133.3333,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2019,137,NULL,0.0000,3000.0000,3000.0000,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2020,137,NULL,16666.6667,150.0000,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2021,138,NULL,0.0000,1666.6667,1666.6667,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2022,138,NULL,16666.6667,83.3333,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2023,146,NULL,0.0000,1333.3333,1333.3333,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2024,146,NULL,16666.6667,66.6667,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2025,147,NULL,0.0000,1500.0000,1500.0000,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2026,147,NULL,16666.6667,75.0000,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2027,148,NULL,0.0000,1666.6667,1666.6667,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2028,148,NULL,16666.6667,83.3333,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2029,149,NULL,0.0000,2000.0000,2000.0000,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2030,149,NULL,16666.6667,100.0000,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2031,150,NULL,0.0000,2333.3333,2333.3333,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2032,150,NULL,16666.6667,116.6667,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2033,151,NULL,0.0000,2666.6667,2666.6667,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2034,151,NULL,16666.6667,133.3333,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2035,152,NULL,0.0000,3000.0000,3000.0000,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2036,152,NULL,16666.6667,150.0000,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2037,153,NULL,0.0000,1666.6667,1666.6667,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2038,153,NULL,16666.6667,83.3333,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2070,131,NULL,149.3333,0.0000,-149.3333,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2071,132,NULL,150.0000,0.0000,-150.0000,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2072,133,NULL,166.6667,0.0000,-166.6667,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2073,134,NULL,200.0000,0.0000,-200.0000,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2074,135,NULL,-1026.6667,0.0000,1026.6667,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2075,136,NULL,-840.0000,0.0000,840.0000,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2076,137,NULL,-653.3333,0.0000,653.3333,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2077,138,NULL,166.6667,0.0000,-166.6667,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2078,146,NULL,74.6667,0.0000,-74.6667,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2079,147,NULL,75.0000,0.0000,-75.0000,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2080,148,NULL,83.3333,0.0000,-83.3333,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2081,149,NULL,100.0000,0.0000,-100.0000,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2082,150,NULL,116.6667,0.0000,-116.6667,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2083,151,NULL,133.3333,0.0000,-133.3333,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2084,152,NULL,150.0000,0.0000,-150.0000,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2085,153,NULL,83.3333,0.0000,-83.3333,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2225,176,NULL,0.0000,3333.3333,3333.3333,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2226,176,NULL,0.0000,1333.3333,1333.3333,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2227,176,NULL,0.0000,1200.0000,1200.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2228,176,NULL,0.0000,533.3333,533.3333,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2229,176,NULL,0.0000,266.6667,266.6667,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2230,176,NULL,0.0000,800.0000,800.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2231,177,NULL,0.0000,3750.0000,3750.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2232,177,NULL,0.0000,1500.0000,1500.0000,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2233,177,NULL,0.0000,1350.0000,1350.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2234,177,NULL,0.0000,600.0000,600.0000,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2235,177,NULL,0.0000,300.0000,300.0000,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2236,178,NULL,0.0000,4166.6667,4166.6667,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2237,178,NULL,0.0000,1666.6667,1666.6667,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2238,178,NULL,0.0000,1500.0000,1500.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2239,178,NULL,0.0000,666.6667,666.6667,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2240,178,NULL,0.0000,333.3333,333.3333,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2241,179,NULL,0.0000,5000.0000,5000.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2242,179,NULL,0.0000,2000.0000,2000.0000,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2243,179,NULL,0.0000,1800.0000,1800.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2244,179,NULL,0.0000,800.0000,800.0000,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2245,179,NULL,0.0000,400.0000,400.0000,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2246,180,NULL,0.0000,5833.3333,5833.3333,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2247,180,NULL,0.0000,2333.3333,2333.3333,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2248,180,NULL,0.0000,2100.0000,2100.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2249,180,NULL,0.0000,933.3333,933.3333,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2250,180,NULL,0.0000,466.6667,466.6667,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2251,181,NULL,0.0000,6666.6667,6666.6667,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2252,181,NULL,0.0000,2666.6667,2666.6667,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2253,181,NULL,0.0000,2400.0000,2400.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2254,181,NULL,0.0000,1066.6667,1066.6667,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2255,181,NULL,0.0000,533.3333,533.3333,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2256,182,NULL,0.0000,7500.0000,7500.0000,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2257,182,NULL,0.0000,3000.0000,3000.0000,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2258,182,NULL,0.0000,2700.0000,2700.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2259,182,NULL,0.0000,1200.0000,1200.0000,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2260,182,NULL,0.0000,600.0000,600.0000,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2261,183,NULL,0.0000,4166.6667,4166.6667,1,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2262,183,NULL,0.0000,1666.6667,1666.6667,2,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2263,183,NULL,0.0000,1500.0000,1500.0000,3,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2264,183,NULL,0.0000,666.6667,666.6667,4,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2265,183,NULL,0.0000,333.3333,333.3333,5,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2288,176,NULL,533.3333,0.0000,-533.3333,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2289,177,NULL,600.0000,0.0000,-600.0000,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2290,178,NULL,666.6667,0.0000,-666.6667,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2291,179,NULL,800.0000,0.0000,-800.0000,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2292,180,NULL,933.3333,0.0000,-933.3333,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2293,181,NULL,1066.6667,0.0000,-1066.6667,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2294,182,NULL,1200.0000,0.0000,-1200.0000,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2295,183,NULL,666.6667,0.0000,-666.6667,8,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2303,176,NULL,0.0000,1333.3333,1333.3333,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2304,176,NULL,16666.6667,66.6667,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2305,177,NULL,0.0000,1500.0000,1500.0000,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2306,177,NULL,16666.6667,75.0000,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2307,178,NULL,0.0000,1666.6667,1666.6667,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2308,178,NULL,16666.6667,83.3333,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2309,179,NULL,0.0000,2000.0000,2000.0000,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2310,179,NULL,16666.6667,100.0000,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2311,180,NULL,0.0000,2333.3333,2333.3333,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2312,180,NULL,16666.6667,116.6667,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2313,181,NULL,0.0000,2666.6667,2666.6667,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2314,181,NULL,16666.6667,133.3333,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2315,182,NULL,0.0000,3000.0000,3000.0000,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2316,182,NULL,16666.6667,150.0000,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2317,183,NULL,0.0000,1666.6667,1666.6667,10,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2318,183,NULL,16666.6667,83.3333,16666.6667,11,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2334,176,NULL,74.6667,0.0000,-74.6667,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2335,177,NULL,75.0000,0.0000,-75.0000,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2336,178,NULL,83.3333,0.0000,-83.3333,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2337,179,NULL,100.0000,0.0000,-100.0000,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2338,180,NULL,116.6667,0.0000,-116.6667,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2339,181,NULL,133.3333,0.0000,-133.3333,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2340,182,NULL,150.0000,0.0000,-150.0000,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2341,183,NULL,83.3333,0.0000,-83.3333,9,NULL,'2020-06-23 09:35:00',NULL,'2020-06-23 09:35:00'),
(2482,199,NULL,0.0000,3333.3333,3333.3333,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2483,199,NULL,0.0000,1200.0000,1200.0000,3,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2484,199,NULL,0.0000,533.3333,533.3333,4,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2485,199,NULL,0.0000,266.6667,266.6667,5,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2486,199,NULL,0.0000,800.0000,800.0000,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2487,200,NULL,0.0000,3750.0000,3750.0000,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2488,200,NULL,0.0000,1350.0000,1350.0000,3,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2489,200,NULL,0.0000,600.0000,600.0000,4,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2490,200,NULL,0.0000,300.0000,300.0000,5,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2491,201,NULL,0.0000,4166.6667,4166.6667,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2492,201,NULL,0.0000,1500.0000,1500.0000,3,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2493,201,NULL,0.0000,666.6667,666.6667,4,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2494,201,NULL,0.0000,333.3333,333.3333,5,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2495,202,NULL,0.0000,5000.0000,5000.0000,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2496,202,NULL,0.0000,1800.0000,1800.0000,3,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2497,202,NULL,0.0000,800.0000,800.0000,4,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2498,202,NULL,0.0000,400.0000,400.0000,5,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2499,203,NULL,0.0000,5833.3333,5833.3333,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2500,203,NULL,0.0000,2100.0000,2100.0000,3,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2501,203,NULL,0.0000,933.3333,933.3333,4,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2502,203,NULL,0.0000,466.6667,466.6667,5,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2503,204,NULL,0.0000,6666.6667,6666.6667,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2504,204,NULL,0.0000,2400.0000,2400.0000,3,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2505,204,NULL,0.0000,1066.6667,1066.6667,4,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2506,204,NULL,0.0000,533.3333,533.3333,5,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2507,205,NULL,0.0000,7500.0000,7500.0000,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2508,205,NULL,0.0000,2700.0000,2700.0000,3,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2509,205,NULL,0.0000,1200.0000,1200.0000,4,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2510,205,NULL,0.0000,600.0000,600.0000,5,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2511,206,NULL,0.0000,4166.6667,4166.6667,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2512,206,NULL,0.0000,1500.0000,1500.0000,3,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2513,206,NULL,0.0000,666.6667,666.6667,4,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2514,206,NULL,0.0000,333.3333,333.3333,5,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2515,207,NULL,0.0000,3333.3333,3333.3333,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2516,207,NULL,0.0000,1200.0000,1200.0000,3,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2517,207,NULL,0.0000,533.3333,533.3333,4,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2518,207,NULL,0.0000,266.6667,266.6667,5,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2519,207,NULL,0.0000,800.0000,800.0000,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2520,208,NULL,0.0000,3333.3333,3333.3333,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2521,208,NULL,0.0000,1200.0000,1200.0000,3,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2522,208,NULL,0.0000,533.3333,533.3333,4,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2523,208,NULL,0.0000,266.6667,266.6667,5,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2524,208,NULL,0.0000,800.0000,800.0000,1,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2545,199,NULL,1333.3333,0.0000,-1333.3333,2,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2546,199,NULL,533.3333,0.0000,-533.3333,8,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2547,200,NULL,1500.0000,0.0000,-1500.0000,2,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2548,200,NULL,600.0000,0.0000,-600.0000,8,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2549,201,NULL,1666.6667,0.0000,-1666.6667,2,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2550,201,NULL,666.6667,0.0000,-666.6667,8,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2551,202,NULL,2000.0000,0.0000,-2000.0000,2,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2552,202,NULL,800.0000,0.0000,-800.0000,8,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2553,203,NULL,2333.3333,0.0000,-2333.3333,2,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2554,203,NULL,933.3333,0.0000,-933.3333,8,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2555,204,NULL,2666.6667,0.0000,-2666.6667,2,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2556,204,NULL,1066.6667,0.0000,-1066.6667,8,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2557,205,NULL,3000.0000,0.0000,-3000.0000,2,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2558,205,NULL,1200.0000,0.0000,-1200.0000,8,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2559,206,NULL,1666.6667,0.0000,-1666.6667,2,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2560,206,NULL,666.6667,0.0000,-666.6667,8,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2561,207,NULL,1333.3333,0.0000,-1333.3333,2,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2562,207,NULL,533.3333,0.0000,-533.3333,8,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2563,208,NULL,1333.3333,0.0000,-1333.3333,2,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2564,208,NULL,533.3333,0.0000,-533.3333,8,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2576,199,NULL,0.0000,1333.3333,1333.3333,10,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2577,199,NULL,16666.6667,66.6667,16666.6667,11,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2578,200,NULL,0.0000,1500.0000,1500.0000,10,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2579,200,NULL,16666.6667,75.0000,16666.6667,11,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2580,201,NULL,0.0000,1666.6667,1666.6667,10,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2581,201,NULL,16666.6667,83.3333,16666.6667,11,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2582,202,NULL,0.0000,2000.0000,2000.0000,10,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2583,202,NULL,16666.6667,100.0000,16666.6667,11,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2584,203,NULL,0.0000,2333.3333,2333.3333,10,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2585,203,NULL,16666.6667,116.6667,16666.6667,11,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2586,204,NULL,0.0000,2666.6667,2666.6667,10,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2587,204,NULL,16666.6667,133.3333,16666.6667,11,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2588,205,NULL,0.0000,3000.0000,3000.0000,10,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2589,205,NULL,16666.6667,150.0000,16666.6667,11,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2590,206,NULL,0.0000,1666.6667,1666.6667,10,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2591,206,NULL,16666.6667,83.3333,16666.6667,11,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2592,207,NULL,0.0000,1333.3333,1333.3333,10,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2593,207,NULL,16666.6667,66.6667,16666.6667,11,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2594,208,NULL,0.0000,1333.3333,1333.3333,10,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2595,208,NULL,16666.6667,66.6667,16666.6667,11,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2607,199,NULL,61.3333,0.0000,-61.3333,9,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2608,200,NULL,60.0000,0.0000,-60.0000,9,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2609,201,NULL,66.6667,0.0000,-66.6667,9,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2610,202,NULL,80.0000,0.0000,-80.0000,9,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2611,203,NULL,93.3333,0.0000,-93.3333,9,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2612,204,NULL,106.6667,0.0000,-106.6667,9,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2613,205,NULL,120.0000,0.0000,-120.0000,9,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2614,206,NULL,66.6667,0.0000,-66.6667,9,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2615,207,NULL,61.3333,0.0000,-61.3333,9,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2616,208,NULL,61.3333,0.0000,-61.3333,9,NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33'),
(2617,199,NULL,0.0000,3333.3333,3333.3333,1,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2618,199,NULL,0.0000,1200.0000,1200.0000,3,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2619,199,NULL,0.0000,533.3333,533.3333,4,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2620,199,NULL,0.0000,266.6667,266.6667,5,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2621,199,NULL,0.0000,800.0000,800.0000,1,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2622,200,NULL,0.0000,3750.0000,3750.0000,1,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2623,200,NULL,0.0000,1350.0000,1350.0000,3,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2624,200,NULL,0.0000,600.0000,600.0000,4,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2625,200,NULL,0.0000,300.0000,300.0000,5,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2626,201,NULL,0.0000,4166.6667,4166.6667,1,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2627,201,NULL,0.0000,1500.0000,1500.0000,3,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2628,201,NULL,0.0000,666.6667,666.6667,4,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2629,201,NULL,0.0000,333.3333,333.3333,5,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2630,202,NULL,0.0000,5000.0000,5000.0000,1,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2631,202,NULL,0.0000,1800.0000,1800.0000,3,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2632,202,NULL,0.0000,800.0000,800.0000,4,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2633,202,NULL,0.0000,400.0000,400.0000,5,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2634,203,NULL,0.0000,5833.3333,5833.3333,1,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2635,203,NULL,0.0000,2100.0000,2100.0000,3,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2636,203,NULL,0.0000,933.3333,933.3333,4,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2637,203,NULL,0.0000,466.6667,466.6667,5,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2638,204,NULL,0.0000,6666.6667,6666.6667,1,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2639,204,NULL,0.0000,2400.0000,2400.0000,3,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2640,204,NULL,0.0000,1066.6667,1066.6667,4,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2641,204,NULL,0.0000,533.3333,533.3333,5,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2642,205,NULL,0.0000,7500.0000,7500.0000,1,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2643,205,NULL,0.0000,2700.0000,2700.0000,3,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2644,205,NULL,0.0000,1200.0000,1200.0000,4,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2645,205,NULL,0.0000,600.0000,600.0000,5,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2646,206,NULL,0.0000,4166.6667,4166.6667,1,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2647,206,NULL,0.0000,1500.0000,1500.0000,3,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2648,206,NULL,0.0000,666.6667,666.6667,4,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2649,206,NULL,0.0000,333.3333,333.3333,5,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2650,207,NULL,0.0000,3333.3333,3333.3333,1,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2651,207,NULL,0.0000,1200.0000,1200.0000,3,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2652,207,NULL,0.0000,533.3333,533.3333,4,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2653,207,NULL,0.0000,266.6667,266.6667,5,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2654,207,NULL,0.0000,800.0000,800.0000,1,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2655,208,NULL,0.0000,3333.3333,3333.3333,1,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2656,208,NULL,0.0000,1200.0000,1200.0000,3,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2657,208,NULL,0.0000,533.3333,533.3333,4,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2658,208,NULL,0.0000,266.6667,266.6667,5,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32'),
(2659,208,NULL,0.0000,800.0000,800.0000,1,NULL,'2020-06-29 17:53:32',NULL,'2020-06-29 17:53:32');

/*Table structure for table `payrollinstances` */

DROP TABLE IF EXISTS `payrollinstances`;

CREATE TABLE `payrollinstances` (
  `PayrollInstancesID` int(10) NOT NULL AUTO_INCREMENT,
  `PayrollPeriodID` int(10) NOT NULL,
  `InstanceTypeID` int(10) DEFAULT NULL,
  `GeneratedBy` varchar(30) DEFAULT NULL,
  `DateGenerated` date DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PayrollInstancesID`),
  UNIQUE KEY `PK_Payroll Instances` (`PayrollInstancesID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `payrollinstances` */

insert  into `payrollinstances`(`PayrollInstancesID`,`PayrollPeriodID`,`InstanceTypeID`,`GeneratedBy`,`DateGenerated`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,1,1,'Gabriel John','2019-05-12',NULL,'2020-06-23 09:35:20',NULL,'2020-06-23 09:35:20'),
(2,2,2,'Whiskey Williams','2019-07-07',NULL,'2020-06-23 09:35:20',NULL,'2020-06-23 09:35:20'),
(3,1,1,'125','2020-06-12',NULL,'2020-06-23 09:35:20',NULL,'2020-06-23 09:35:20'),
(4,1,1,'125','2020-06-12',NULL,'2020-06-23 09:35:20',NULL,'2020-06-23 09:35:20'),
(5,2,1,'125','2020-06-13',NULL,'2020-06-23 09:35:20',NULL,'2020-06-23 09:35:20'),
(6,2,1,'125','2020-06-13',NULL,'2020-06-23 09:35:20',NULL,'2020-06-23 09:35:20'),
(7,1,2,'125','2020-06-13',NULL,'2020-06-23 09:35:20',NULL,'2020-06-23 09:35:20'),
(8,1,1,'125','2020-06-13',NULL,'2020-06-23 09:35:20',NULL,'2020-06-23 09:35:20'),
(9,3,1,'125','2020-06-13',NULL,'2020-06-23 09:35:20',NULL,'2020-06-23 09:35:20'),
(10,1,2,'133','2020-06-15',NULL,'2020-06-23 09:35:20',NULL,'2020-06-23 09:35:20'),
(11,1,1,'133','2020-06-15',NULL,'2020-06-23 09:35:20',NULL,'2020-06-23 09:35:20'),
(12,1,2,'125','2020-06-27',NULL,'2020-06-27 22:52:44',NULL,'2020-06-27 22:52:44'),
(13,1,1,'125','2020-06-27',NULL,'2020-06-27 22:53:33',NULL,'2020-06-27 22:53:33');

/*Table structure for table `payrollinstancetypes` */

DROP TABLE IF EXISTS `payrollinstancetypes`;

CREATE TABLE `payrollinstancetypes` (
  `PayrollInstanceTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `InstanceTypeID` int(10) DEFAULT NULL,
  `InstanceType` varchar(30) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PayrollInstanceTypeID`),
  UNIQUE KEY `PK_Payroll Instance Types` (`PayrollInstanceTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `payrollinstancetypes` */

insert  into `payrollinstancetypes`(`PayrollInstanceTypeID`,`InstanceTypeID`,`InstanceType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,1,'Process',NULL,'2020-06-23 09:35:25',NULL,'2020-06-23 09:35:25'),
(2,2,'Cancel',NULL,'2020-06-23 09:35:25',NULL,'2020-06-23 09:35:25');

/*Table structure for table `payrollledger` */

DROP TABLE IF EXISTS `payrollledger`;

CREATE TABLE `payrollledger` (
  `PayrollLedgerID` int(10) NOT NULL AUTO_INCREMENT,
  `PayrollPeriodID` int(10) DEFAULT NULL,
  `CompanyID` int(10) DEFAULT NULL,
  `PayingAccountID` int(10) DEFAULT NULL,
  `LedgerDate` timestamp(6) NULL DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`PayrollLedgerID`),
  UNIQUE KEY `PK_PayrollLedger` (`PayrollLedgerID`),
  KEY `IX_Relationship145` (`PayrollPeriodID`),
  KEY `IX_Relationship146` (`CompanyID`),
  CONSTRAINT `Relationship_r145` FOREIGN KEY (`PayrollPeriodID`) REFERENCES `payrollperiod` (`PayrollPeriodID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_r146` FOREIGN KEY (`CompanyID`) REFERENCES `company` (`CompanyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `payrollledger` */

insert  into `payrollledger`(`PayrollLedgerID`,`PayrollPeriodID`,`CompanyID`,`PayingAccountID`,`LedgerDate`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,1,1,1,'2019-12-06 06:00:00.000000',0,'2019-12-06 14:41:41.620000',NULL,NULL);

/*Table structure for table `payrollperiod` */

DROP TABLE IF EXISTS `payrollperiod`;

CREATE TABLE `payrollperiod` (
  `PayrollPeriodID` int(10) NOT NULL AUTO_INCREMENT,
  `PayrollPeriod` varchar(30) DEFAULT NULL,
  `DateFrom` date DEFAULT NULL,
  `DateTo` date DEFAULT NULL,
  `IsPublished` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `YearID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PayrollPeriodID`),
  UNIQUE KEY `PK_Payroll Period` (`PayrollPeriodID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `payrollperiod` */

insert  into `payrollperiod`(`PayrollPeriodID`,`PayrollPeriod`,`DateFrom`,`DateTo`,`IsPublished`,`YearID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'January 2020','2020-01-01','2020-01-31','2020-05-05 14:07:12.615866',1,NULL,'2020-06-23 09:35:48',NULL,'2020-06-23 09:35:48'),
(2,'February 2020','2020-02-01','2020-02-28','2020-05-05 14:07:32.116100',1,NULL,'2020-06-23 09:35:48',NULL,'2020-06-23 09:35:48'),
(3,'March 2020','2020-03-01','2020-03-31','2020-05-05 14:07:55.645497',1,NULL,'2020-06-23 09:35:48',NULL,'2020-06-23 09:35:48');

/*Table structure for table `payrollreport` */

DROP TABLE IF EXISTS `payrollreport`;

CREATE TABLE `payrollreport` (
  `Name` char(1) DEFAULT NULL,
  `GrossPay` char(1) DEFAULT NULL,
  `OtherAllowance` char(1) DEFAULT NULL,
  `TotalIncome` char(1) DEFAULT NULL,
  `PAYE` char(1) DEFAULT NULL,
  `Pension` char(1) DEFAULT NULL,
  `Rent` char(1) DEFAULT NULL,
  `StaffLoan` char(1) DEFAULT NULL,
  `Lateness` char(1) DEFAULT NULL,
  `OtherDeduction` char(1) DEFAULT NULL,
  `TotalDeduction` char(1) DEFAULT NULL,
  `NetPay` char(1) DEFAULT NULL,
  `CreatedBy` char(1) DEFAULT NULL,
  `DateCreated` char(1) DEFAULT NULL,
  `ModiifiedBy` char(1) DEFAULT NULL,
  `DateModified` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `payrollreport` */

/*Table structure for table `payrollyear` */

DROP TABLE IF EXISTS `payrollyear`;

CREATE TABLE `payrollyear` (
  `PayrollYearID` int(10) NOT NULL AUTO_INCREMENT,
  `YeardID` int(10) DEFAULT NULL,
  `YearName` text NOT NULL,
  `DateFrom` date DEFAULT NULL,
  `DateTo` date DEFAULT NULL,
  `YearID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PayrollYearID`),
  UNIQUE KEY `PK_Payroll Year` (`PayrollYearID`),
  KEY `IX_Relationship117` (`YearID`),
  CONSTRAINT `Relationship117` FOREIGN KEY (`YearID`) REFERENCES `year` (`YearID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `payrollyear` */

insert  into `payrollyear`(`PayrollYearID`,`YeardID`,`YearName`,`DateFrom`,`DateTo`,`YearID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,1,'2019 Payroll','2020-01-01','2020-12-31',1,NULL,'2020-06-23 09:35:27',NULL,'2020-06-23 09:35:27');

/*Table structure for table `pensionprovider` */

DROP TABLE IF EXISTS `pensionprovider`;

CREATE TABLE `pensionprovider` (
  `PensionProviderID` int(10) NOT NULL AUTO_INCREMENT,
  `PensionProvider` varchar(50) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`PensionProviderID`),
  UNIQUE KEY `PK_PensionProvider` (`PensionProviderID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `pensionprovider` */

insert  into `pensionprovider`(`PensionProviderID`,`PensionProvider`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'ARM Pension Manager',NULL,NULL,NULL,NULL),
(2,'AXA Mansard Pension Ltd',NULL,NULL,NULL,NULL),
(3,'Crusaders Sterling Pension Ltd',NULL,NULL,NULL,NULL),
(4,'Oak Pensions',NULL,NULL,NULL,NULL),
(5,'NLPC Pension Fund',NULL,NULL,NULL,NULL),
(6,'Leadway Pensure',NULL,NULL,NULL,NULL),
(7,'FUG Pensions Ltd',NULL,NULL,NULL,NULL);

/*Table structure for table `period` */

DROP TABLE IF EXISTS `period`;

CREATE TABLE `period` (
  `period_id` int(11) NOT NULL AUTO_INCREMENT,
  `period_name` varchar(200) NOT NULL,
  `Description` varchar(1000) DEFAULT '0',
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `periodType_id` int(11) DEFAULT NULL,
  `year_id` int(11) DEFAULT NULL,
  `periodStatus_id` int(11) NOT NULL DEFAULT 2,
  PRIMARY KEY (`period_id`),
  KEY `IX_Relationship5` (`periodType_id`),
  KEY `IX_Relationship25` (`year_id`),
  CONSTRAINT `Relationship25` FOREIGN KEY (`year_id`) REFERENCES `years` (`year_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship5` FOREIGN KEY (`periodType_id`) REFERENCES `periodtype` (`periodType_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `period` */

/*Table structure for table `periodtype` */

DROP TABLE IF EXISTS `periodtype`;

CREATE TABLE `periodtype` (
  `periodType_id` int(11) NOT NULL AUTO_INCREMENT,
  `periodType_name` varchar(50) NOT NULL,
  PRIMARY KEY (`periodType_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `periodtype` */

/*Table structure for table `policydocument` */

DROP TABLE IF EXISTS `policydocument`;

CREATE TABLE `policydocument` (
  `PolicyDocumentID` int(11) NOT NULL AUTO_INCREMENT,
  `PolicyName` varchar(300) NOT NULL,
  `PolicyUrl` varchar(1000) NOT NULL,
  `StatusID` int(11) DEFAULT NULL,
  `Description` varchar(300) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PolicyDocumentID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `policydocument` */

insert  into `policydocument`(`PolicyDocumentID`,`PolicyName`,`PolicyUrl`,`StatusID`,`Description`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Clearance Form','Clearance Form.pdf',NULL,NULL,NULL,'2020-06-23 09:35:54',NULL,'2020-06-23 09:35:54'),
(2,'Code of conduct','Code of conduct.pdf',NULL,NULL,NULL,'2020-06-23 09:35:54',NULL,'2020-06-23 09:35:54'),
(3,'Confidentiality Agreement','Confidentiality Agreement.pdf',NULL,NULL,NULL,'2020-06-23 09:35:54',NULL,'2020-06-23 09:35:54'),
(4,'Exit Interview Form','Exit Interview Form.pdf',NULL,NULL,NULL,'2020-06-23 09:35:54',NULL,'2020-06-23 09:35:54'),
(5,'Internal Memo Template','Internal Memo Template.pdf',NULL,NULL,NULL,'2020-06-23 09:35:54',NULL,'2020-06-23 09:35:54'),
(6,'Job Handover Notes','Job Handover Notes.pdf',NULL,NULL,NULL,'2020-06-23 09:35:54',NULL,'2020-06-23 09:35:54'),
(7,'Next of Kin','Next of Kin.pdf',NULL,NULL,NULL,'2020-06-23 09:35:54',NULL,'2020-06-23 09:35:54'),
(8,'Performance Agreement','Performance Agreement.pdf',NULL,NULL,NULL,'2020-06-23 09:35:54',NULL,'2020-06-23 09:35:54'),
(9,'Personal Information Form','Personal Information Form.pdf',NULL,NULL,NULL,'2020-06-23 09:35:54',NULL,'2020-06-23 09:35:54'),
(10,'Sanction Grid','Sanction Grid.pdf',NULL,NULL,NULL,'2020-06-23 09:35:54',NULL,'2020-06-23 09:35:54'),
(11,'Staff Undertaking','Staff Undertaking.pdf',NULL,NULL,NULL,'2020-06-23 09:35:54',NULL,'2020-06-23 09:35:54'),
(12,'Vehicle Handover Form','Vehicle Handover Form.pdf',NULL,NULL,NULL,'2020-06-23 09:35:54',NULL,'2020-06-23 09:35:54'),
(13,'IT-ICT Policy - DRP - DCP BLENESON GROUP','IT-ICT Policy - DRP - DCP BLENESON GROUP.pdf',NULL,NULL,NULL,'2020-06-23 09:35:54',NULL,'2020-06-23 09:35:54'),
(14,'IT-ICT Policy - IT SOP BLENESON GROUP','IT-ICT Policy - IT SOP BLENESON GROUP.pdf',NULL,NULL,NULL,'2020-06-23 09:35:54',NULL,'2020-06-23 09:35:54');

/*Table structure for table `priority` */

DROP TABLE IF EXISTS `priority`;

CREATE TABLE `priority` (
  `PriorityID` int(10) NOT NULL AUTO_INCREMENT,
  `Priority` varchar(30) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PriorityID`),
  UNIQUE KEY `PK_Priority` (`PriorityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `priority` */

/*Table structure for table `privilege_activity` */

DROP TABLE IF EXISTS `privilege_activity`;

CREATE TABLE `privilege_activity` (
  `ActivityPrivID` int(11) NOT NULL AUTO_INCREMENT,
  `Activity_Name` varchar(50) NOT NULL,
  `pagepath` varchar(100) DEFAULT NULL,
  `order_by` int(11) DEFAULT 1000,
  `stage_id` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ActivityPrivID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `privilege_activity` */

/*Table structure for table `privilege_activitydetails` */

DROP TABLE IF EXISTS `privilege_activitydetails`;

CREATE TABLE `privilege_activitydetails` (
  `ActivityPrivilegeDetailsID` int(11) NOT NULL AUTO_INCREMENT,
  `PrivilegeID` int(11) NOT NULL,
  `ActivityPrivID` int(11) NOT NULL,
  `canInsert` tinyint(1) DEFAULT 0,
  `canView` tinyint(1) DEFAULT 1,
  `canDelete` tinyint(1) DEFAULT 0,
  `canUpdate` tinyint(1) DEFAULT 0,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ActivityPrivilegeDetailsID`),
  KEY `fk_privilege_activitydetails_privileges_idx` (`PrivilegeID`),
  KEY `fk_privilege_activitydetails_privilege_activity1_idx` (`ActivityPrivID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `privilege_activitydetails` */

/*Table structure for table `privilege_assign` */

DROP TABLE IF EXISTS `privilege_assign`;

CREATE TABLE `privilege_assign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 0,
  `date_assigned` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `privilege_assign` */

/*Table structure for table `privilege_class` */

DROP TABLE IF EXISTS `privilege_class`;

CREATE TABLE `privilege_class` (
  `PrivilegeClassID` int(11) NOT NULL AUTO_INCREMENT,
  `PrivilegeClass` varchar(50) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PrivilegeClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `privilege_class` */

insert  into `privilege_class`(`PrivilegeClassID`,`PrivilegeClass`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Activation',NULL,'2020-06-23 09:36:11',NULL,'2020-06-23 09:36:11'),
(2,'Deactivation',NULL,'2020-06-23 09:36:11',NULL,'2020-06-23 09:36:11');

/*Table structure for table `privilege_details` */

DROP TABLE IF EXISTS `privilege_details`;

CREATE TABLE `privilege_details` (
  `PrivDetailsID` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `statusID` int(11) DEFAULT NULL,
  `PrivHeaderID` int(11) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PrivDetailsID`),
  KEY `fk_privilege_details_privilege_header1_idx` (`PrivHeaderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `privilege_details` */

/*Table structure for table `privilege_header` */

DROP TABLE IF EXISTS `privilege_header`;

CREATE TABLE `privilege_header` (
  `PrivHeaderID` int(11) NOT NULL AUTO_INCREMENT,
  `DeptID` int(11) DEFAULT NULL,
  `UnitID` int(11) DEFAULT NULL,
  `SupervisorTypeID` int(11) DEFAULT NULL,
  `DesignationClassID` int(11) DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `posted_by` int(11) DEFAULT NULL,
  `date_posted` timestamp NULL DEFAULT current_timestamp(),
  `transID` int(11) DEFAULT NULL,
  `StageID` int(11) DEFAULT NULL,
  `PrivilegeID` int(11) NOT NULL,
  `PrivilegeClassID` int(11) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PrivHeaderID`),
  KEY `fk_Privilege_Header_Departments1_idx` (`DeptID`),
  KEY `fk_Privilege_Header_Units1_idx` (`UnitID`),
  KEY `fk_Privilege_Header_SupervisorTypes1_idx` (`SupervisorTypeID`),
  KEY `fk_Privilege_Header_DesignationClass1_idx` (`DesignationClassID`),
  KEY `fk_Privilege_Header_WorkLocations1_idx` (`LocationID`),
  KEY `fk_privilege_header_privileges1_idx` (`PrivilegeID`),
  KEY `fk_privilege_header_privilege_class1_idx` (`PrivilegeClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `privilege_header` */

/*Table structure for table `privilege_type` */

DROP TABLE IF EXISTS `privilege_type`;

CREATE TABLE `privilege_type` (
  `PrivilegeTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `PrivilegeType` varchar(50) NOT NULL,
  PRIMARY KEY (`PrivilegeTypeID`),
  UNIQUE KEY `UQ__Privilege_Type__39ED81A1` (`PrivilegeType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `privilege_type` */

/*Table structure for table `privileges` */

DROP TABLE IF EXISTS `privileges`;

CREATE TABLE `privileges` (
  `PrivilegeID` int(11) NOT NULL AUTO_INCREMENT,
  `privilege_name` varchar(50) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PrivilegeID`),
  UNIQUE KEY `UQ__Privileges__3CC9EE4C` (`privilege_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `privileges` */

insert  into `privileges`(`PrivilegeID`,`privilege_name`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Admin Manager',NULL,'2020-06-23 09:36:21',NULL,'2020-06-23 09:36:21'),
(2,'Payroll',NULL,'2020-06-23 09:36:21',NULL,'2020-06-23 09:36:21');

/*Table structure for table `processpayroll` */

DROP TABLE IF EXISTS `processpayroll`;

CREATE TABLE `processpayroll` (
  `ProcessPayrollID` int(10) NOT NULL AUTO_INCREMENT,
  `PayrollPeriodID` int(10) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`ProcessPayrollID`),
  UNIQUE KEY `PK_ProcessPayroll` (`ProcessPayrollID`),
  KEY `IX_Relationship144` (`PayrollPeriodID`),
  CONSTRAINT `Relationship_r144` FOREIGN KEY (`PayrollPeriodID`) REFERENCES `payrollperiod` (`PayrollPeriodID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `processpayroll` */

/*Table structure for table `processtype` */

DROP TABLE IF EXISTS `processtype`;

CREATE TABLE `processtype` (
  `ProcessTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `ProcessType` varchar(50) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`ProcessTypeID`),
  UNIQUE KEY `PK_ProcessType` (`ProcessTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `processtype` */

/*Table structure for table `procumentapproval` */

DROP TABLE IF EXISTS `procumentapproval`;

CREATE TABLE `procumentapproval` (
  `ProcumenetApprovalID` int(11) NOT NULL AUTO_INCREMENT,
  `ProcurementID` int(11) DEFAULT NULL,
  `ApprovalInstanceID` int(11) DEFAULT NULL,
  `ApprovedBy` varchar(50) DEFAULT NULL,
  `NextApprovalOfficerID` varchar(50) DEFAULT NULL,
  `Comment` longtext DEFAULT NULL,
  `ProcessModuleID` int(11) DEFAULT NULL,
  `ApprovalInstancesID` int(11) DEFAULT NULL,
  `ApprovalDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProcumenetApprovalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `procumentapproval` */

/*Table structure for table `procurement` */

DROP TABLE IF EXISTS `procurement`;

CREATE TABLE `procurement` (
  `ProcurementID` int(10) NOT NULL AUTO_INCREMENT,
  `ProcurementDate` timestamp(6) NULL DEFAULT NULL,
  `RequestBy` varchar(100) DEFAULT NULL,
  `ApprovalStagesID` int(10) DEFAULT NULL,
  `ApprovalOfficerID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProcurementID`),
  UNIQUE KEY `PK_Procurement` (`ProcurementID`),
  KEY `IX_Relationship_p50` (`ApprovalStagesID`),
  CONSTRAINT `Relationship_p50` FOREIGN KEY (`ApprovalStagesID`) REFERENCES `approvalstages` (`ApprovalStagesID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `procurement` */

insert  into `procurement`(`ProcurementID`,`ProcurementDate`,`RequestBy`,`ApprovalStagesID`,`ApprovalOfficerID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'2019-12-11 06:00:00.000000','Client',NULL,3,NULL,'2020-06-23 09:36:39',NULL,'2020-06-23 09:36:39');

/*Table structure for table `procurementdetails` */

DROP TABLE IF EXISTS `procurementdetails`;

CREATE TABLE `procurementdetails` (
  `ProcurementDetailsID` int(10) NOT NULL AUTO_INCREMENT,
  `ProcurementID` int(10) DEFAULT NULL,
  `VendorID` int(10) DEFAULT NULL,
  `Price` float NOT NULL,
  `Quantity` float NOT NULL,
  `Description` text DEFAULT NULL,
  `Action` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProcurementDetailsID`),
  UNIQUE KEY `PK_ProcurementDetails` (`ProcurementDetailsID`),
  KEY `IX_Relationship_p32` (`VendorID`),
  KEY `IX_Relationship_p7` (`ProcurementID`),
  CONSTRAINT `Relationship_p32` FOREIGN KEY (`VendorID`) REFERENCES `vendors` (`VendorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p7` FOREIGN KEY (`ProcurementID`) REFERENCES `procurement` (`ProcurementID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `procurementdetails` */

/*Table structure for table `procurementvendor` */

DROP TABLE IF EXISTS `procurementvendor`;

CREATE TABLE `procurementvendor` (
  `ProcurementVendorID` int(10) NOT NULL AUTO_INCREMENT,
  `ProcurementID` int(10) DEFAULT NULL,
  `VendorID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProcurementVendorID`),
  UNIQUE KEY `PK_ProcurementVendor` (`ProcurementVendorID`),
  KEY `IX_Relationship_p33` (`VendorID`),
  KEY `IX_Relationship_p6` (`ProcurementID`),
  CONSTRAINT `Relationship_p33` FOREIGN KEY (`VendorID`) REFERENCES `vendors` (`VendorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p6` FOREIGN KEY (`ProcurementID`) REFERENCES `procurement` (`ProcurementID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `procurementvendor` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `ProductID` int(10) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) DEFAULT NULL,
  `ProductCategoryID` int(10) DEFAULT NULL,
  `ProductTypeID` int(10) DEFAULT NULL,
  `ProductStatusID` int(10) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `PK_Product` (`ProductID`),
  KEY `IX_Relationship23` (`ProductCategoryID`),
  KEY `IX_Relationship24` (`ProductTypeID`),
  CONSTRAINT `Relationship_r23` FOREIGN KEY (`ProductCategoryID`) REFERENCES `productcategory` (`ProductCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_r24` FOREIGN KEY (`ProductTypeID`) REFERENCES `producttype` (`ProductTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`ProductID`,`ProductName`,`ProductCategoryID`,`ProductTypeID`,`ProductStatusID`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Acer Predator Helios 300',1,1,1,0,'2020-04-21 11:44:33.000000',NULL,NULL);

/*Table structure for table `productcategory` */

DROP TABLE IF EXISTS `productcategory`;

CREATE TABLE `productcategory` (
  `ProductCategoryID` int(10) NOT NULL AUTO_INCREMENT,
  `ProductCategory` varchar(50) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`ProductCategoryID`),
  UNIQUE KEY `PK_ProductCategory` (`ProductCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `productcategory` */

insert  into `productcategory`(`ProductCategoryID`,`ProductCategory`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Product Category 1',0,'2020-04-21 11:43:42.000000',NULL,NULL);

/*Table structure for table `producttype` */

DROP TABLE IF EXISTS `producttype`;

CREATE TABLE `producttype` (
  `ProductTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `ProductType` varchar(50) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`ProductTypeID`),
  UNIQUE KEY `PK_ProductType` (`ProductTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `producttype` */

insert  into `producttype`(`ProductTypeID`,`ProductType`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Product Type 1',0,'2020-04-21 11:43:57.000000',NULL,NULL);

/*Table structure for table `programmetypes` */

DROP TABLE IF EXISTS `programmetypes`;

CREATE TABLE `programmetypes` (
  `ProgrammeTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `ProgrammeType` varchar(100) DEFAULT NULL,
  `SchoolTypeID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProgrammeTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `programmetypes` */

insert  into `programmetypes`(`ProgrammeTypeID`,`ProgrammeType`,`SchoolTypeID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Degree',1,NULL,'2020-06-23 09:36:41',NULL,'2020-06-23 09:36:41'),
(2,'Masters',1,NULL,'2020-07-15 23:09:19',NULL,'2020-07-15 23:09:19'),
(3,'PhD',1,NULL,'2020-07-15 23:09:29',NULL,'2020-07-15 23:09:29');

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `ProjectID` int(10) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(10) DEFAULT NULL,
  `ProjectTypeID` int(10) DEFAULT NULL,
  `ProjectSubTypeID` int(10) DEFAULT NULL,
  `ProjectStatusID` int(10) DEFAULT NULL,
  `ProjectDescription` text DEFAULT NULL,
  `ProjectLocation` varchar(150) DEFAULT NULL,
  `ProjectApprovedBudget` float DEFAULT NULL,
  `ProjectDuration` varchar(50) NOT NULL,
  `ProjectAwardDate` date NOT NULL,
  `ProjectStartDate` date NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectID`),
  UNIQUE KEY `PK_Project` (`ProjectID`),
  KEY `IX_Relationship5` (`ProjectTypeID`),
  KEY `IX_Relationship6` (`ProjectSubTypeID`),
  KEY `IX_Relationship8` (`CustomerID`),
  KEY `IX_Relationship9` (`ProjectStatusID`),
  CONSTRAINT `Relationship_c5` FOREIGN KEY (`ProjectTypeID`) REFERENCES `projecttype` (`ProjectTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_c6_c` FOREIGN KEY (`ProjectSubTypeID`) REFERENCES `projectsubtype` (`ProjectSubTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_c8_c` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_c9_c` FOREIGN KEY (`ProjectStatusID`) REFERENCES `projectstatus` (`ProjectStatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `project` */

insert  into `project`(`ProjectID`,`CustomerID`,`ProjectTypeID`,`ProjectSubTypeID`,`ProjectStatusID`,`ProjectDescription`,`ProjectLocation`,`ProjectApprovedBudget`,`ProjectDuration`,`ProjectAwardDate`,`ProjectStartDate`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,2,2,3,1,'Construction of head bridge','Karu, Abuja',3000000,'28 days','2019-12-11','2020-09-01',NULL,'2020-06-23 09:36:52',NULL,'2020-06-23 09:36:52');

/*Table structure for table `projectcategory` */

DROP TABLE IF EXISTS `projectcategory`;

CREATE TABLE `projectcategory` (
  `ProjectCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectCategory` varchar(75) DEFAULT NULL,
  `Attribute2` char(20) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `projectcategory` */

/*Table structure for table `projectdocumentupload` */

DROP TABLE IF EXISTS `projectdocumentupload`;

CREATE TABLE `projectdocumentupload` (
  `ProjectDocumentUploadID` int(10) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(10) DEFAULT NULL,
  `DocumentTypeID` int(10) DEFAULT NULL,
  `FilePath` text DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectDocumentUploadID`),
  UNIQUE KEY `PK_ProjectDocumentUpload` (`ProjectDocumentUploadID`),
  KEY `IX_Relationship27` (`DocumentTypeID`),
  KEY `IX_Relationship28` (`ProjectID`),
  CONSTRAINT `Relationship_c27` FOREIGN KEY (`DocumentTypeID`) REFERENCES `documenttype` (`DocumentTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_c28` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `projectdocumentupload` */

/*Table structure for table `projectexpense` */

DROP TABLE IF EXISTS `projectexpense`;

CREATE TABLE `projectexpense` (
  `ProjectExpenseID` int(10) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(10) DEFAULT NULL,
  `ExpenseLineID` int(10) DEFAULT NULL,
  `ExpenseCategoryID` int(10) DEFAULT NULL,
  `ExpenseDescription` text DEFAULT NULL,
  `Amount` float DEFAULT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ProjectExpenseID`),
  UNIQUE KEY `PK_ProjectExpense` (`ProjectExpenseID`),
  KEY `IX_Relationship24` (`ExpenseLineID`),
  KEY `IX_Relationship25` (`ExpenseCategoryID`),
  KEY `IX_Relationship26` (`ProjectID`),
  CONSTRAINT `Relationship_c24` FOREIGN KEY (`ExpenseLineID`) REFERENCES `expenseline` (`ExpenseLineID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_c25` FOREIGN KEY (`ExpenseCategoryID`) REFERENCES `expensecategory` (`ExpenseCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_c26` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `projectexpense` */

/*Table structure for table `projectmanager` */

DROP TABLE IF EXISTS `projectmanager`;

CREATE TABLE `projectmanager` (
  `ProjectManagerID` int(10) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(10) DEFAULT NULL,
  `EmployeeID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectManagerID`),
  UNIQUE KEY `PK_ProjectManager` (`ProjectManagerID`),
  KEY `IX_Relationship18` (`ProjectID`),
  CONSTRAINT `Relationship_c18` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `projectmanager` */

/*Table structure for table `projectmilestone` */

DROP TABLE IF EXISTS `projectmilestone`;

CREATE TABLE `projectmilestone` (
  `ProjectMilestoneID` int(10) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(10) DEFAULT NULL,
  `Milestone` varchar(200) DEFAULT NULL,
  `StartDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `EndDate` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectMilestoneID`),
  UNIQUE KEY `PK_ProjectMilestone` (`ProjectMilestoneID`),
  KEY `IX_Relationship10` (`ProjectID`),
  CONSTRAINT `Relationship_c10` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `projectmilestone` */

/*Table structure for table `projectreview` */

DROP TABLE IF EXISTS `projectreview`;

CREATE TABLE `projectreview` (
  `ProjectReviewID` int(10) NOT NULL AUTO_INCREMENT,
  `ReviewDate` date NOT NULL,
  `ReviewedBy` varchar(100) DEFAULT NULL,
  `ReviewComment` text DEFAULT NULL,
  `PaymentReviewPlanID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectReviewID`),
  UNIQUE KEY `PK_ProjectReview` (`ProjectReviewID`),
  KEY `IX_Relationship30` (`PaymentReviewPlanID`),
  CONSTRAINT `Relationship_c30` FOREIGN KEY (`PaymentReviewPlanID`) REFERENCES `projectreviewplan` (`PaymentReviewPlanID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `projectreview` */

/*Table structure for table `projectreviewplan` */

DROP TABLE IF EXISTS `projectreviewplan`;

CREATE TABLE `projectreviewplan` (
  `PaymentReviewPlanID` int(10) NOT NULL AUTO_INCREMENT,
  `NumberOfReviews` varchar(30) DEFAULT NULL,
  `ProjectID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PaymentReviewPlanID`),
  UNIQUE KEY `PK_ProjectReviewPlan` (`PaymentReviewPlanID`),
  KEY `IX_Relationship29` (`ProjectID`),
  CONSTRAINT `Relationship_c29` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `projectreviewplan` */

/*Table structure for table `projectrisk` */

DROP TABLE IF EXISTS `projectrisk`;

CREATE TABLE `projectrisk` (
  `ProjectRiskID` int(10) NOT NULL AUTO_INCREMENT,
  `RiskID` int(10) DEFAULT NULL,
  `RiskMitigants` varchar(250) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectRiskID`),
  UNIQUE KEY `PK_ProjectRisk` (`ProjectRiskID`),
  KEY `IX_Relationship7` (`RiskID`),
  CONSTRAINT `Relationship_c7` FOREIGN KEY (`RiskID`) REFERENCES `risk` (`RiskID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `projectrisk` */

insert  into `projectrisk`(`ProjectRiskID`,`RiskID`,`RiskMitigants`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,1,'Employ more skilled workers ',NULL,'2020-06-23 09:37:18',NULL,'2020-06-23 09:37:18'),
(2,2,'Engage a reliable security company',NULL,'2020-06-23 09:37:18',NULL,'2020-06-23 09:37:18'),
(3,3,'Insurance Packages',NULL,'2020-06-23 09:37:18',NULL,'2020-06-23 09:37:18'),
(4,4,'Effective planning',NULL,'2020-06-23 09:37:18',NULL,'2020-06-23 09:37:18');

/*Table structure for table `projectstatus` */

DROP TABLE IF EXISTS `projectstatus`;

CREATE TABLE `projectstatus` (
  `ProjectStatusID` int(10) NOT NULL AUTO_INCREMENT,
  `ProjectStatus` varchar(30) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectStatusID`),
  UNIQUE KEY `PK_ProjectStatus` (`ProjectStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `projectstatus` */

insert  into `projectstatus`(`ProjectStatusID`,`ProjectStatus`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Ongoing',NULL,'2020-06-23 09:37:24',NULL,'2020-06-23 09:37:24'),
(2,'Completed',NULL,'2020-06-23 09:37:24',NULL,'2020-06-23 09:37:24'),
(3,'Onhold',NULL,'2020-06-23 09:37:24',NULL,'2020-06-23 09:37:24');

/*Table structure for table `projectsub` */

DROP TABLE IF EXISTS `projectsub`;

CREATE TABLE `projectsub` (
  `ProjectSubID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectSubTitle` varchar(150) DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `ResidentEngineerID` int(11) DEFAULT NULL,
  `ProjectID` int(10) DEFAULT NULL,
  `ParentProjectSubID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectSubID`),
  KEY `IX_Relationship119` (`ProjectID`),
  CONSTRAINT `Relationship119` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `projectsub` */

/*Table structure for table `projectsubcategory` */

DROP TABLE IF EXISTS `projectsubcategory`;

CREATE TABLE `projectsubcategory` (
  `ProjectSubCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectSubCategory` varchar(75) DEFAULT NULL,
  `ProjectCategoryID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectSubCategoryID`),
  KEY `IX_Relationship120` (`ProjectCategoryID`),
  CONSTRAINT `Relationship120` FOREIGN KEY (`ProjectCategoryID`) REFERENCES `projectcategory` (`ProjectCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `projectsubcategory` */

/*Table structure for table `projectsubtype` */

DROP TABLE IF EXISTS `projectsubtype`;

CREATE TABLE `projectsubtype` (
  `ProjectSubTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectTypeID` int(11) NOT NULL,
  `ProjectSubType` varchar(30) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectSubTypeID`),
  UNIQUE KEY `PK_ProjectSubType` (`ProjectSubTypeID`),
  KEY `IX_Relationship4` (`ProjectTypeID`),
  CONSTRAINT `Relationship_c41_c` FOREIGN KEY (`ProjectTypeID`) REFERENCES `projecttype` (`ProjectTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `projectsubtype` */

insert  into `projectsubtype`(`ProjectSubTypeID`,`ProjectTypeID`,`ProjectSubType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,1,'Private  drive pathways',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(2,1,'Two-lane highways',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(3,1,'Dual carriageways',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(4,1,'Expressway/Highway',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(5,1,'Fedral roads',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(6,1,'State roads ',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(7,1,'District roads',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(8,2,'Terraced house',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(9,2,'Semi-detached house',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(10,2,'Detached house',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(11,2,'Bungalow',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(12,2,'Duplex',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(13,2,'Mansion',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(14,2,'Penthouse',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(15,3,'Pedestrian bridge',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(16,3,'Beam bridge',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40'),
(17,3,'Rail bridge ',NULL,'2020-06-23 09:37:40',NULL,'2020-06-23 09:37:40');

/*Table structure for table `projecttask` */

DROP TABLE IF EXISTS `projecttask`;

CREATE TABLE `projecttask` (
  `ProjectTaskID` int(10) NOT NULL AUTO_INCREMENT,
  `ProjectMilestoneID` int(10) DEFAULT NULL,
  `Task` varchar(200) DEFAULT NULL,
  `StartDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `EndDate` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectTaskID`),
  UNIQUE KEY `PK_ProjectTask` (`ProjectTaskID`),
  KEY `IX_Relationship11` (`ProjectMilestoneID`),
  CONSTRAINT `Relationship_c11` FOREIGN KEY (`ProjectMilestoneID`) REFERENCES `projectmilestone` (`ProjectMilestoneID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `projecttask` */

/*Table structure for table `projectteam` */

DROP TABLE IF EXISTS `projectteam`;

CREATE TABLE `projectteam` (
  `ProjectTeamID` int(10) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(10) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `EmployeeID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectTeamID`),
  UNIQUE KEY `PK_ProjectTeam` (`ProjectTeamID`),
  KEY `IX_Relationship21` (`ProjectID`),
  KEY `IX_Relationship121` (`EmployeeID`),
  CONSTRAINT `Relationship121` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `Relationship_c21` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `projectteam` */

/*Table structure for table `projectteamreassignment` */

DROP TABLE IF EXISTS `projectteamreassignment`;

CREATE TABLE `projectteamreassignment` (
  `ProjectTeamReassignmentID` int(11) NOT NULL AUTO_INCREMENT,
  `DateofTransfer` datetime DEFAULT NULL,
  `ProjectFrom` int(11) DEFAULT NULL,
  `ProjectTo` int(11) DEFAULT NULL,
  `EmployeeID` int(10) DEFAULT NULL,
  `ReassigningOfficer` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectTeamReassignmentID`),
  KEY `IX_Relationship122` (`EmployeeID`),
  CONSTRAINT `Relationship122` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `projectteamreassignment` */

/*Table structure for table `projecttool` */

DROP TABLE IF EXISTS `projecttool`;

CREATE TABLE `projecttool` (
  `ProjectToolID` int(10) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(10) DEFAULT NULL,
  `ToolID` int(10) DEFAULT NULL,
  `EquipmentID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectToolID`),
  UNIQUE KEY `PK_ProjectTool` (`ProjectToolID`),
  KEY `IX_Relationship15` (`ToolID`),
  KEY `IX_Relationship16` (`EquipmentID`),
  KEY `IX_Relationship17` (`ProjectID`),
  CONSTRAINT `Relationship_c15` FOREIGN KEY (`ToolID`) REFERENCES `tool` (`ToolID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_c16` FOREIGN KEY (`EquipmentID`) REFERENCES `equipment` (`EquipmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_c17` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `projecttool` */

/*Table structure for table `projecttype` */

DROP TABLE IF EXISTS `projecttype`;

CREATE TABLE `projecttype` (
  `ProjectTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `ProjectType` varchar(30) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ProjectTypeID`),
  UNIQUE KEY `PK_ProjectType` (`ProjectTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `projecttype` */

insert  into `projecttype`(`ProjectTypeID`,`ProjectType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Roads',NULL,'2020-06-23 09:38:16',NULL,'2020-06-23 09:38:16'),
(2,'Buildings & Houses',NULL,'2020-06-23 09:38:16',NULL,'2020-06-23 09:38:16'),
(3,'Bridges',NULL,'2020-06-23 09:38:16',NULL,'2020-06-23 09:38:16'),
(4,'Railways',NULL,'2020-06-23 09:38:16',NULL,'2020-06-23 09:38:16');

/*Table structure for table `property` */

DROP TABLE IF EXISTS `property`;

CREATE TABLE `property` (
  `PropertyID` int(10) NOT NULL AUTO_INCREMENT,
  `PropertyName` varchar(50) DEFAULT NULL,
  `PropertyTypeID` int(10) DEFAULT NULL,
  `PropertySubTypeID` int(10) DEFAULT NULL,
  `Plot` varchar(20) DEFAULT NULL,
  `StateID` int(10) DEFAULT NULL,
  `LgaID` int(10) DEFAULT NULL,
  `CityID` int(10) DEFAULT NULL,
  `PhysicalAddress` text DEFAULT NULL,
  `PropertyOwnerID` int(10) DEFAULT NULL,
  `PropertyDescription` text DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`PropertyID`),
  UNIQUE KEY `PK_Property` (`PropertyID`),
  KEY `IX_Relationship11` (`PropertyOwnerID`),
  KEY `IX_Relationship12` (`CityID`),
  KEY `IX_Relationship2` (`PropertyTypeID`),
  KEY `IX_Relationship3` (`PropertySubTypeID`),
  KEY `IX_Relationship4` (`StateID`),
  KEY `IX_Relationship5` (`LgaID`),
  KEY `IX_Relationship80` (`PropertyTypeID`),
  KEY `IX_Relationship81` (`PropertyOwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `property` */

/*Table structure for table `propertyallocation` */

DROP TABLE IF EXISTS `propertyallocation`;

CREATE TABLE `propertyallocation` (
  `PropertyAllocationID` int(10) NOT NULL AUTO_INCREMENT,
  `PropertyApplicationID` int(10) DEFAULT NULL,
  `AllocationDate` timestamp(6) NULL DEFAULT NULL,
  `Comments` text DEFAULT NULL,
  `SubscriberInfoID` int(11) DEFAULT NULL,
  `PropertyID` int(11) DEFAULT NULL,
  `PropertyAmount` decimal(6,0) DEFAULT NULL,
  `AmountReceived` decimal(6,0) DEFAULT NULL,
  `BalanceAmount` decimal(6,0) DEFAULT NULL,
  `PaymentMethodID` int(11) DEFAULT NULL,
  `PaymentDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PropertyAllocationID`),
  UNIQUE KEY `PK_PropertyAllocation` (`PropertyAllocationID`),
  KEY `IX_Relationship91` (`PropertyApplicationID`),
  CONSTRAINT `Relationship_r91` FOREIGN KEY (`PropertyApplicationID`) REFERENCES `propertyapplication` (`PropertyApplicationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `propertyallocation` */

/*Table structure for table `propertyapplicant` */

DROP TABLE IF EXISTS `propertyapplicant`;

CREATE TABLE `propertyapplicant` (
  `PropertyApplicantID` int(10) NOT NULL AUTO_INCREMENT,
  `ApplicantSurname` varchar(50) DEFAULT NULL,
  `ApplicantFirstName` varchar(50) DEFAULT NULL,
  `ApplicantMiddleName` varchar(50) DEFAULT NULL,
  `GenderID` int(10) DEFAULT NULL,
  `DateofBirth` timestamp(6) NULL DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(30) DEFAULT NULL,
  `CurrentEmployer` varchar(50) DEFAULT NULL,
  `EmployerName` varchar(50) DEFAULT NULL,
  `EmployerAddress` text DEFAULT NULL,
  `NationalityID` int(10) DEFAULT NULL,
  `SateofOriginID` int(10) DEFAULT NULL,
  `LgaID` int(10) DEFAULT NULL,
  `CityID` int(10) DEFAULT NULL,
  `ApplicantPic` varchar(50) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`PropertyApplicantID`),
  UNIQUE KEY `PK_PropertyApplicant` (`PropertyApplicantID`),
  KEY `IX_Relationship83` (`GenderID`),
  KEY `IX_Relationship84` (`LgaID`),
  KEY `IX_Relationship85` (`CityID`),
  CONSTRAINT `Relationship_r83` FOREIGN KEY (`GenderID`) REFERENCES `gender` (`GenderID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_r84` FOREIGN KEY (`LgaID`) REFERENCES `lga` (`LgaID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_r85` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `propertyapplicant` */

/*Table structure for table `propertyapplication` */

DROP TABLE IF EXISTS `propertyapplication`;

CREATE TABLE `propertyapplication` (
  `PropertyApplicationID` int(10) NOT NULL AUTO_INCREMENT,
  `PropertyApplicantID` int(10) DEFAULT NULL,
  `PropertyID` int(10) DEFAULT NULL,
  `PropertyPaymentTypeID` int(10) DEFAULT NULL,
  `PaymentAmount` decimal(18,0) DEFAULT NULL,
  `InitialDeposit` decimal(18,0) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`PropertyApplicationID`),
  UNIQUE KEY `PK_PropertyApplication` (`PropertyApplicationID`),
  KEY `IX_Relationship88` (`PropertyApplicantID`),
  KEY `IX_Relationship89` (`PropertyID`),
  KEY `IX_Relationship90` (`PropertyPaymentTypeID`),
  CONSTRAINT `Relationship_r89` FOREIGN KEY (`PropertyID`) REFERENCES `property` (`PropertyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_r90` FOREIGN KEY (`PropertyPaymentTypeID`) REFERENCES `propertypaymenttype` (`PropertyPaymentTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `propertyapplication` */

/*Table structure for table `propertyfloor` */

DROP TABLE IF EXISTS `propertyfloor`;

CREATE TABLE `propertyfloor` (
  `PropertyFloorID` int(10) NOT NULL AUTO_INCREMENT,
  `PropertyFloor` varchar(50) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`PropertyFloorID`),
  UNIQUE KEY `PK_PropertyFloor` (`PropertyFloorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `propertyfloor` */

/*Table structure for table `propertygroup` */

DROP TABLE IF EXISTS `propertygroup`;

CREATE TABLE `propertygroup` (
  `PropertyGroupID` int(10) NOT NULL AUTO_INCREMENT,
  `PropertyGroup` varchar(50) DEFAULT NULL,
  `CountryID` int(10) DEFAULT NULL,
  `StateID` int(10) DEFAULT NULL,
  `LgaID` int(10) DEFAULT NULL,
  `CityID` int(10) DEFAULT NULL,
  `StatusID` int(10) DEFAULT NULL,
  `PhysicalAddress` text DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`PropertyGroupID`),
  UNIQUE KEY `PK_PropertyGroup` (`PropertyGroupID`),
  KEY `IX_Relationship17` (`CountryID`),
  KEY `IX_Relationship18` (`StateID`),
  KEY `IX_Relationship19` (`LgaID`),
  KEY `IX_Relationship20` (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `propertygroup` */

/*Table structure for table `propertyinspection` */

DROP TABLE IF EXISTS `propertyinspection`;

CREATE TABLE `propertyinspection` (
  `PropertyInspectionID` int(10) NOT NULL AUTO_INCREMENT,
  `PropertyID` int(10) DEFAULT NULL,
  `EstateManagerID` int(10) DEFAULT NULL,
  `InspectorName` varchar(50) DEFAULT NULL,
  `DateofInspection` timestamp(6) NULL DEFAULT NULL,
  `InspectionPurpose` text DEFAULT NULL,
  `InspectionOutcome` text DEFAULT NULL,
  `InspectionStatusID` int(10) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`PropertyInspectionID`),
  UNIQUE KEY `PK_PropertyInspection` (`PropertyInspectionID`),
  KEY `IX_Relationship79` (`PropertyID`),
  CONSTRAINT `Relationship_r79` FOREIGN KEY (`PropertyID`) REFERENCES `property` (`PropertyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `propertyinspection` */

/*Table structure for table `propertyowner` */

DROP TABLE IF EXISTS `propertyowner`;

CREATE TABLE `propertyowner` (
  `PropertyOwnerID` int(10) NOT NULL AUTO_INCREMENT,
  `PropertyOwner` varchar(50) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `TIN` varchar(20) DEFAULT NULL,
  `OwnershipTypeID` int(10) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`PropertyOwnerID`),
  UNIQUE KEY `PK_PropertyOwner` (`PropertyOwnerID`),
  KEY `IX_Relationship15` (`OwnershipTypeID`),
  CONSTRAINT `Relationship_r15` FOREIGN KEY (`OwnershipTypeID`) REFERENCES `ownershiptype` (`OwnershipTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `propertyowner` */

/*Table structure for table `propertypaymenttype` */

DROP TABLE IF EXISTS `propertypaymenttype`;

CREATE TABLE `propertypaymenttype` (
  `PropertyPaymentTypeID` int(6) NOT NULL AUTO_INCREMENT,
  `PropertyPaymentType` varchar(75) DEFAULT NULL,
  `CreatedBy` int(6) DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT current_timestamp(),
  `ModifiedBy` int(6) DEFAULT NULL,
  `DateModified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`PropertyPaymentTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `propertypaymenttype` */

/*Table structure for table `propertysubtype` */

DROP TABLE IF EXISTS `propertysubtype`;

CREATE TABLE `propertysubtype` (
  `PropertySubTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `PropertySubType` varchar(100) DEFAULT NULL,
  `PropertyTypeID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PropertySubTypeID`),
  UNIQUE KEY `PK_PropertySubType` (`PropertySubTypeID`),
  KEY `PropertyTypeID` (`PropertyTypeID`),
  CONSTRAINT `propertysubtype_ibfk_1` FOREIGN KEY (`PropertyTypeID`) REFERENCES `propertytype` (`PropertyTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `propertysubtype` */

/*Table structure for table `propertytype` */

DROP TABLE IF EXISTS `propertytype`;

CREATE TABLE `propertytype` (
  `PropertyTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `PropertyType` varchar(50) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`PropertyTypeID`),
  UNIQUE KEY `PK_PropertyType` (`PropertyTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `propertytype` */

/*Table structure for table `purchase` */

DROP TABLE IF EXISTS `purchase`;

CREATE TABLE `purchase` (
  `PurchaseID` int(10) NOT NULL AUTO_INCREMENT,
  `ProcurementID` int(10) DEFAULT NULL,
  `PurchaseTypeID` int(10) DEFAULT NULL,
  `StoreID` int(10) DEFAULT NULL,
  `PurchaseDate` timestamp(6) NULL DEFAULT NULL,
  `RequestBy` varchar(100) DEFAULT NULL,
  `ApprovalStagesID` int(10) DEFAULT NULL,
  `ApprovalOfficerID` char(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PurchaseID`),
  UNIQUE KEY `PK_Purchase` (`PurchaseID`),
  KEY `IX_Relationship_p11` (`PurchaseTypeID`),
  KEY `IX_Relationship_p30` (`StoreID`),
  KEY `IX_Relationship_p51` (`ApprovalStagesID`),
  KEY `IX_Relationship_p9` (`ProcurementID`),
  CONSTRAINT `Relationship_p11` FOREIGN KEY (`PurchaseTypeID`) REFERENCES `purchasetype` (`PurchaseTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p30` FOREIGN KEY (`StoreID`) REFERENCES `stores` (`StoreID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p51` FOREIGN KEY (`ApprovalStagesID`) REFERENCES `approvalstages` (`ApprovalStagesID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p9` FOREIGN KEY (`ProcurementID`) REFERENCES `procurement` (`ProcurementID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `purchase` */

insert  into `purchase`(`PurchaseID`,`ProcurementID`,`PurchaseTypeID`,`StoreID`,`PurchaseDate`,`RequestBy`,`ApprovalStagesID`,`ApprovalOfficerID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(3,1,2,1,'2019-12-19 06:00:00.000000','Client',NULL,'1',NULL,'2020-06-23 09:38:33',NULL,'2020-06-23 09:38:33'),
(4,1,2,2,'2019-12-09 06:00:00.000000','MD',NULL,'2',NULL,'2020-06-23 09:38:33',NULL,'2020-06-23 09:38:33');

/*Table structure for table `purchasedetails` */

DROP TABLE IF EXISTS `purchasedetails`;

CREATE TABLE `purchasedetails` (
  `PurchaseDetailsID` int(10) NOT NULL AUTO_INCREMENT,
  `PurchaseID` int(10) DEFAULT NULL,
  `ItemID` int(10) DEFAULT NULL,
  `Price` float NOT NULL,
  `Quantity` float NOT NULL,
  `Description` text DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PurchaseDetailsID`),
  UNIQUE KEY `PK_PurchaseDetails` (`PurchaseDetailsID`),
  KEY `IX_Relationship_p10` (`PurchaseID`),
  KEY `IX_Relationship_p8` (`ItemID`),
  CONSTRAINT `Relationship_p10` FOREIGN KEY (`PurchaseID`) REFERENCES `purchase` (`PurchaseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p8` FOREIGN KEY (`ItemID`) REFERENCES `items` (`ItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `purchasedetails` */

insert  into `purchasedetails`(`PurchaseDetailsID`,`PurchaseID`,`ItemID`,`Price`,`Quantity`,`Description`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,4,2,5,2,'Dell',NULL,'2020-06-23 09:38:34',NULL,'2020-06-23 09:38:34');

/*Table structure for table `purchasetype` */

DROP TABLE IF EXISTS `purchasetype`;

CREATE TABLE `purchasetype` (
  `PurchaseTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `PurchaseType` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PurchaseTypeID`),
  UNIQUE KEY `PK_PurchaseType` (`PurchaseTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `purchasetype` */

insert  into `purchasetype`(`PurchaseTypeID`,`PurchaseType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Beverage',NULL,'2020-06-23 09:38:34',NULL,'2020-06-23 09:38:34'),
(2,'Appliances',NULL,'2020-06-23 09:38:34',NULL,'2020-06-23 09:38:34');

/*Table structure for table `qualificationgrade` */

DROP TABLE IF EXISTS `qualificationgrade`;

CREATE TABLE `qualificationgrade` (
  `QualificationGradeID` int(11) NOT NULL AUTO_INCREMENT,
  `QualificationGradeName` varchar(100) DEFAULT NULL,
  `ProgrammeTypeID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`QualificationGradeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `qualificationgrade` */

insert  into `qualificationgrade`(`QualificationGradeID`,`QualificationGradeName`,`ProgrammeTypeID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'type',1,NULL,'2020-06-23 09:38:35',NULL,'2020-06-23 09:38:35');

/*Table structure for table `qualifications` */

DROP TABLE IF EXISTS `qualifications`;

CREATE TABLE `qualifications` (
  `QualificationID` int(11) NOT NULL AUTO_INCREMENT,
  `QualificationName` varchar(100) DEFAULT NULL,
  `ProgrammeTypeID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`QualificationID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `qualifications` */

insert  into `qualifications`(`QualificationID`,`QualificationName`,`ProgrammeTypeID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'type 1',1,NULL,'2020-06-23 09:38:35',NULL,'2020-06-23 09:38:35');

/*Table structure for table `receipt` */

DROP TABLE IF EXISTS `receipt`;

CREATE TABLE `receipt` (
  `ReceiptID` char(1) DEFAULT NULL,
  `ReceiptNum` char(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `receipt` */

/*Table structure for table `receivedetails` */

DROP TABLE IF EXISTS `receivedetails`;

CREATE TABLE `receivedetails` (
  `ReceiveDetailID` int(10) NOT NULL AUTO_INCREMENT,
  `Price` float DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Quantity` float DEFAULT NULL,
  `ItemID` int(10) DEFAULT NULL,
  `ReceiveOrderID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ReceiveDetailID`),
  UNIQUE KEY `PK_ReceiveDetails` (`ReceiveDetailID`),
  KEY `IX_Relationship_p42` (`ItemID`),
  KEY `IX_Relationship_p43` (`ReceiveOrderID`),
  CONSTRAINT `Relationship_p42` FOREIGN KEY (`ItemID`) REFERENCES `items` (`ItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p43` FOREIGN KEY (`ReceiveOrderID`) REFERENCES `receiveorders` (`ReceiveOrderID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `receivedetails` */

/*Table structure for table `receiveorders` */

DROP TABLE IF EXISTS `receiveorders`;

CREATE TABLE `receiveorders` (
  `ReceiveOrderID` int(10) NOT NULL AUTO_INCREMENT,
  `StoreID` int(10) DEFAULT NULL,
  `ReceiveDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ApprovalStagesID` int(10) DEFAULT NULL,
  `PurchaseID` int(10) DEFAULT NULL,
  `ApprovalOfficerID` char(1) DEFAULT NULL,
  PRIMARY KEY (`ReceiveOrderID`),
  UNIQUE KEY `PK_ReceiveOrders` (`ReceiveOrderID`),
  KEY `IX_Relationship_p31` (`StoreID`),
  KEY `IX_Relationship_p52` (`ApprovalStagesID`),
  KEY `IX_Relationship_p53` (`PurchaseID`),
  CONSTRAINT `Relationship_p31` FOREIGN KEY (`StoreID`) REFERENCES `stores` (`StoreID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p52` FOREIGN KEY (`ApprovalStagesID`) REFERENCES `approvalstages` (`ApprovalStagesID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p53` FOREIGN KEY (`PurchaseID`) REFERENCES `purchase` (`PurchaseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `receiveorders` */

/*Table structure for table `recruitmentstage` */

DROP TABLE IF EXISTS `recruitmentstage`;

CREATE TABLE `recruitmentstage` (
  `RecruitmentStageID` int(11) NOT NULL AUTO_INCREMENT,
  `RequirementStage` varchar(50) NOT NULL,
  `RecruitmentProcessID` int(11) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`RecruitmentStageID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `recruitmentstage` */

insert  into `recruitmentstage`(`RecruitmentStageID`,`RequirementStage`,`RecruitmentProcessID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Stage 1 Updated',1,NULL,'2020-06-26 10:24:02',NULL,'2020-06-26 10:24:02');

/*Table structure for table `recruitmentstatus` */

DROP TABLE IF EXISTS `recruitmentstatus`;

CREATE TABLE `recruitmentstatus` (
  `RecruitmentStatusID` int(11) NOT NULL AUTO_INCREMENT,
  `RecruitmentStatus` varchar(20) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`RecruitmentStatusID`),
  UNIQUE KEY `RecruitmentStatusID` (`RecruitmentStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `recruitmentstatus` */

insert  into `recruitmentstatus`(`RecruitmentStatusID`,`RecruitmentStatus`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Pending Updated',NULL,'2020-06-26 10:24:30',NULL,'2020-06-26 10:24:30');

/*Table structure for table `relationship` */

DROP TABLE IF EXISTS `relationship`;

CREATE TABLE `relationship` (
  `RelationshipID` int(11) NOT NULL AUTO_INCREMENT,
  `RelationshipName` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`RelationshipID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `relationship` */

insert  into `relationship`(`RelationshipID`,`RelationshipName`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Father',NULL,'2020-06-23 09:39:03',NULL,'2020-06-23 09:39:03'),
(2,'Mother',NULL,'2020-06-23 09:39:03',NULL,'2020-06-23 09:39:03'),
(3,'Uncle',NULL,'2020-06-23 09:39:03',NULL,'2020-06-23 09:39:03'),
(4,'Aunty',NULL,'2020-06-23 09:39:03',NULL,'2020-06-23 09:39:03'),
(5,'Brother',NULL,'2020-06-23 09:39:03',NULL,'2020-06-23 09:39:03'),
(6,'Sister',NULL,'2020-06-23 09:39:03',NULL,'2020-06-23 09:39:03'),
(7,'In-Laws',NULL,'2020-06-23 09:39:03',NULL,'2020-06-23 09:39:03');

/*Table structure for table `religion` */

DROP TABLE IF EXISTS `religion`;

CREATE TABLE `religion` (
  `ReligionID` int(10) NOT NULL AUTO_INCREMENT,
  `Religion` varchar(30) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`ReligionID`),
  UNIQUE KEY `PK_Religion` (`ReligionID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `religion` */

insert  into `religion`(`ReligionID`,`Religion`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Christianity',0,'2019-11-24 01:36:00.160000',NULL,NULL),
(2,'Islam',0,'2019-11-24 01:49:36.267000',NULL,NULL),
(3,'Buddhism ',0,'2019-11-24 01:49:47.727000',NULL,NULL),
(4,'Traditional',0,'2019-11-24 01:49:58.250000',NULL,NULL),
(5,'Hinduism',0,'2019-11-24 01:50:06.363000',NULL,NULL),
(6,'Chinese Tradional Religion',NULL,NULL,NULL,NULL);

/*Table structure for table `requisition` */

DROP TABLE IF EXISTS `requisition`;

CREATE TABLE `requisition` (
  `RequisitionID` int(10) NOT NULL AUTO_INCREMENT,
  `ItemCategoryID` int(10) DEFAULT NULL,
  `StoreID` int(10) DEFAULT NULL,
  `RequestDate` timestamp(6) NULL DEFAULT NULL,
  `RequestBy` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`RequisitionID`),
  UNIQUE KEY `PK_Requisition` (`RequisitionID`),
  KEY `IX_Relationship_p14` (`ItemCategoryID`),
  KEY `IX_Relationship_p27` (`StoreID`),
  CONSTRAINT `Relationship_p14` FOREIGN KEY (`ItemCategoryID`) REFERENCES `itemcategory` (`ItemCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p27` FOREIGN KEY (`StoreID`) REFERENCES `stores` (`StoreID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `requisition` */

/*Table structure for table `requisitiondetails` */

DROP TABLE IF EXISTS `requisitiondetails`;

CREATE TABLE `requisitiondetails` (
  `RequisitionDetailID` int(10) NOT NULL AUTO_INCREMENT,
  `ItemID` int(10) DEFAULT NULL,
  `RequisitionID` int(10) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Quantity` float DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`RequisitionDetailID`),
  UNIQUE KEY `PK_RequisitionDetails` (`RequisitionDetailID`),
  KEY `IX_Relationship_p34` (`RequisitionID`),
  KEY `IX_Relationship_p35` (`ItemID`),
  CONSTRAINT `Relationship_p34` FOREIGN KEY (`RequisitionID`) REFERENCES `requisition` (`RequisitionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p35` FOREIGN KEY (`ItemID`) REFERENCES `items` (`ItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `requisitiondetails` */

/*Table structure for table `residency` */

DROP TABLE IF EXISTS `residency`;

CREATE TABLE `residency` (
  `ResidencyID` int(11) NOT NULL AUTO_INCREMENT,
  `Residency` varchar(25) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`ResidencyID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `residency` */

insert  into `residency`(`ResidencyID`,`Residency`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Native',1,'2020-07-14 09:26:47',NULL,'2020-07-14 09:26:47'),
(2,'Expatriate',1,'2020-07-14 09:27:00',NULL,'2020-07-14 09:27:00');

/*Table structure for table `reward` */

DROP TABLE IF EXISTS `reward`;

CREATE TABLE `reward` (
  `RewardID` int(10) NOT NULL AUTO_INCREMENT,
  `Reward` varchar(100) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`RewardID`),
  UNIQUE KEY `PK_Reward` (`RewardID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `reward` */

insert  into `reward`(`RewardID`,`Reward`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Test Reward',0,'2019-12-06 11:31:59.617000',NULL,NULL);

/*Table structure for table `risk` */

DROP TABLE IF EXISTS `risk`;

CREATE TABLE `risk` (
  `RiskID` int(10) NOT NULL AUTO_INCREMENT,
  `Risk` varchar(250) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`RiskID`),
  UNIQUE KEY `PK_Risk` (`RiskID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `risk` */

insert  into `risk`(`RiskID`,`Risk`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Labour Shortages',NULL,'2020-06-23 09:39:09',NULL,'2020-06-23 09:39:09'),
(2,'Damage or theft to equipment and tools',NULL,'2020-06-23 09:39:09',NULL,'2020-06-23 09:39:09'),
(3,'Natural Disaster ',NULL,'2020-06-23 09:39:09',NULL,'2020-06-23 09:39:09'),
(4,'Unexpected increases in material cost',NULL,'2020-06-23 09:39:09',NULL,'2020-06-23 09:39:09'),
(5,'Managing Change Order',NULL,'2020-06-23 09:39:09',NULL,'2020-06-23 09:39:09'),
(6,'Poorly Written Contracts',NULL,'2020-06-23 09:39:09',NULL,'2020-06-23 09:39:09'),
(7,'Incomplete Drawings And Poorly Defined Scope',NULL,'2020-06-23 09:39:09',NULL,'2020-06-23 09:39:09'),
(8,'Safety hazards that lead to worker accidents and injuries ',NULL,'2020-06-23 09:39:09',NULL,'2020-06-23 09:39:09'),
(9,'Unknown Site Conditions',NULL,'2020-06-23 09:39:09',NULL,'2020-06-23 09:39:09'),
(10,'Poor Project Management',NULL,'2020-06-23 09:39:09',NULL,'2020-06-23 09:39:09');

/*Table structure for table `riskmitigant` */

DROP TABLE IF EXISTS `riskmitigant`;

CREATE TABLE `riskmitigant` (
  `RiskMitigantID` int(11) NOT NULL AUTO_INCREMENT,
  `RiskID` int(11) DEFAULT NULL,
  `RiskMitigant` text DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`RiskMitigantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `riskmitigant` */

/*Table structure for table `salarycomponent` */

DROP TABLE IF EXISTS `salarycomponent`;

CREATE TABLE `salarycomponent` (
  `SalaryComponentID` int(10) NOT NULL AUTO_INCREMENT,
  `SalaryComponent` varchar(50) DEFAULT NULL,
  `ShortName` varchar(30) DEFAULT NULL,
  `SalaryTypeID` int(10) DEFAULT NULL,
  `SalaryTaxStatusID` int(10) DEFAULT NULL,
  `OrderBy` varchar(100) DEFAULT NULL,
  `CreatedBy` int(10) NOT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`SalaryComponentID`),
  UNIQUE KEY `PK_SalaryComponent` (`SalaryComponentID`),
  KEY `IX_Relationship34` (`SalaryTypeID`),
  KEY `IX_Relationship35` (`SalaryTaxStatusID`),
  CONSTRAINT `Relationship_r34` FOREIGN KEY (`SalaryTypeID`) REFERENCES `salarytype` (`SalaryTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_r35` FOREIGN KEY (`SalaryTaxStatusID`) REFERENCES `salarytaxstatus` (`SalaryTaxStatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `salarycomponent` */

insert  into `salarycomponent`(`SalaryComponentID`,`SalaryComponent`,`ShortName`,`SalaryTypeID`,`SalaryTaxStatusID`,`OrderBy`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Basic Salary',NULL,1,1,'1',0,NULL,NULL,NULL),
(2,'House Allowance',NULL,2,1,'2',0,NULL,NULL,NULL),
(3,'Transport Allowance',NULL,1,1,'3',0,NULL,NULL,NULL),
(4,'Meal Subsidy',NULL,1,1,'4',0,NULL,NULL,NULL),
(5,'Utility Allowance',NULL,1,1,'5',0,NULL,NULL,NULL),
(6,'Fixed Overtime',NULL,1,1,'6',0,NULL,NULL,NULL),
(7,'IOU',NULL,2,3,'7',0,NULL,NULL,NULL),
(8,'Pension',NULL,2,3,'8',0,NULL,NULL,NULL),
(9,'PAYE',NULL,2,3,'9',0,NULL,NULL,NULL),
(10,'20% Relief',NULL,3,5,'10',0,NULL,NULL,NULL),
(11,'200,000 or 1% Relief',NULL,3,5,'11',0,NULL,NULL,NULL),
(12,'Salary Arrears',NULL,1,1,NULL,125,'2020-06-08 10:35:42.000000',NULL,NULL),
(13,'Special Allowance',NULL,1,1,NULL,125,'2020-06-08 10:36:10.000000',NULL,NULL),
(14,'Other Loans',NULL,2,3,NULL,125,'2020-06-08 10:44:43.000000',NULL,NULL);

/*Table structure for table `salarycomponents` */

DROP TABLE IF EXISTS `salarycomponents`;

CREATE TABLE `salarycomponents` (
  `SalaryComponentID` int(10) NOT NULL AUTO_INCREMENT,
  `SalaryComponent` varchar(50) DEFAULT NULL,
  `SalaryTypeID` int(10) DEFAULT NULL,
  `TaxStatusID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SalaryComponentID`),
  UNIQUE KEY `PK_Salary Components` (`SalaryComponentID`),
  KEY `IX_Relationship96` (`SalaryTypeID`),
  CONSTRAINT `Relationship96` FOREIGN KEY (`SalaryTypeID`) REFERENCES `salarytype` (`SalaryTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `salarycomponents` */

/*Table structure for table `salaryformulae` */

DROP TABLE IF EXISTS `salaryformulae`;

CREATE TABLE `salaryformulae` (
  `SalaryFormulaeID` int(10) NOT NULL AUTO_INCREMENT,
  `GradeLevelID` int(10) DEFAULT NULL,
  `PayrollCategoryID` int(10) DEFAULT NULL,
  `SalaryComponentID` int(10) DEFAULT NULL,
  `Percentage` float DEFAULT NULL,
  `TaxStatusID` int(10) NOT NULL,
  `StatusID` int(10) NOT NULL,
  `SalaryTaxStatusID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SalaryFormulaeID`),
  UNIQUE KEY `PK_Salary Formulae` (`SalaryFormulaeID`),
  KEY `IX_Relationship89` (`GradeLevelID`),
  KEY `IX_Relationship90` (`PayrollCategoryID`),
  KEY `IX_Relationship91` (`SalaryComponentID`),
  KEY `IX_Relationship93` (`SalaryTaxStatusID`),
  KEY `IX_Relationship94` (`StatusID`),
  CONSTRAINT `Relationship89` FOREIGN KEY (`GradeLevelID`) REFERENCES `gradelevels` (`GradeLevelID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship90` FOREIGN KEY (`PayrollCategoryID`) REFERENCES `payrollcategory` (`PayrollCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship91` FOREIGN KEY (`SalaryComponentID`) REFERENCES `salarycomponent` (`SalaryComponentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship93` FOREIGN KEY (`SalaryTaxStatusID`) REFERENCES `salarytaxstatus` (`SalaryTaxStatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship94` FOREIGN KEY (`StatusID`) REFERENCES `statuses` (`StatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8;

/*Data for the table `salaryformulae` */

insert  into `salaryformulae`(`SalaryFormulaeID`,`GradeLevelID`,`PayrollCategoryID`,`SalaryComponentID`,`Percentage`,`TaxStatusID`,`StatusID`,`SalaryTaxStatusID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,8,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(2,8,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(3,8,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(4,8,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(5,8,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(6,8,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(7,8,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(8,8,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(9,9,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(10,9,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(11,9,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(12,9,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(13,9,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(14,9,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(15,9,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(16,9,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(17,10,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(18,10,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(19,10,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(20,10,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(21,10,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(22,10,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(23,10,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(24,10,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(25,11,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(26,11,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(27,11,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(28,11,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(29,11,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(30,11,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(31,11,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(32,11,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(33,12,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(34,12,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(35,12,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(36,12,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(37,12,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(38,12,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(39,12,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(40,12,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(41,13,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(42,13,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(43,13,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(44,13,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(45,13,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(46,13,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(47,13,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(48,13,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(49,14,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(50,14,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(51,14,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(52,14,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(53,14,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(54,14,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(55,14,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(56,14,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(57,15,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(58,15,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(59,15,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(60,15,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(61,15,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(62,15,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(63,15,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(64,15,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(65,16,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(66,16,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(67,16,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(68,16,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(69,16,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(70,16,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(71,16,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(72,16,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(73,17,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(74,17,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(75,17,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(76,17,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(77,17,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(78,17,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(79,17,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(80,17,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(81,18,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(82,18,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(83,18,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(84,18,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(85,18,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(86,18,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(87,18,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(88,18,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(89,19,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(90,19,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(91,19,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(92,19,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(93,19,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(94,19,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(95,19,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(96,19,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(97,20,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(98,20,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(99,20,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(100,20,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(101,20,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(102,20,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(103,20,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(104,20,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(105,21,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(106,21,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(107,21,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(108,21,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(109,21,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(110,21,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(111,21,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(112,21,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(113,22,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(114,22,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(115,22,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(116,22,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(117,22,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(118,22,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(119,22,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(120,22,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(121,23,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(122,23,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(123,23,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(124,23,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(125,23,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(126,23,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(127,23,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(128,23,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(129,24,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(130,24,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(131,24,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(132,24,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(133,24,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(134,24,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(135,24,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(136,24,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(137,25,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(138,25,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(139,25,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(140,25,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(141,25,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(142,25,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(143,25,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(144,25,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(145,26,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(146,26,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(147,26,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(148,26,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(149,26,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(150,26,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(151,26,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(152,26,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(153,27,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(154,27,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(155,27,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(156,27,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(157,27,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(158,27,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(159,27,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(160,27,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(161,28,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(162,28,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(163,28,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(164,28,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(165,28,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(166,28,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(167,28,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(168,28,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(169,29,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(170,29,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(171,29,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(172,29,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(173,29,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(174,29,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(175,29,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(176,29,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(177,30,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(178,30,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(179,30,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(180,30,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(181,30,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(182,30,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(183,30,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(184,30,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(185,31,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(186,31,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(187,31,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(188,31,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(189,31,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(190,31,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(191,31,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(192,31,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(193,32,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(194,32,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(195,32,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(196,32,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(197,32,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(198,32,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(199,32,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(200,32,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(201,33,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(202,33,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(203,33,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(204,33,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(205,33,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(206,33,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(207,33,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(208,33,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(209,34,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(210,34,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(211,34,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(212,34,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(213,34,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(214,34,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(215,34,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(216,34,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(217,35,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(218,35,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(219,35,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(220,35,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(221,35,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(222,35,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(223,35,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(224,35,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(225,36,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(226,36,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(227,36,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(228,36,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(229,36,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(230,36,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(231,36,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(232,36,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(233,37,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(234,37,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(235,37,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(236,37,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(237,37,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(238,37,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(239,37,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(240,37,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(241,38,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(242,38,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(243,38,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(244,38,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(245,38,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(246,38,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(247,38,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(248,38,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(249,39,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(250,39,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(251,39,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(252,39,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(253,39,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(254,39,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(255,39,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(256,39,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(257,40,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(258,40,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(259,40,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(260,40,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(261,40,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(262,40,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(263,40,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(264,40,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(265,41,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(266,41,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(267,41,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(268,41,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(269,41,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(270,41,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(271,41,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(272,41,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(273,42,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(274,42,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(275,42,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(276,42,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(277,42,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(278,42,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(279,42,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(280,42,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(281,43,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(282,43,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(283,43,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(284,43,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(285,43,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(286,43,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(287,43,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(288,43,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(289,44,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(290,44,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(291,44,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(292,44,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(293,44,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(294,44,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(295,44,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(296,44,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(297,45,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(298,45,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(299,45,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(300,45,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(301,45,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(302,45,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(303,45,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(304,45,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(305,46,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(306,46,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(307,46,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(308,46,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(309,46,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(310,46,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(311,46,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(312,46,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(313,47,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(314,47,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(315,47,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(316,47,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(317,47,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(318,47,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(319,47,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(320,47,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(321,48,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(322,48,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(323,48,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(324,48,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(325,48,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(326,48,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(327,48,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(328,48,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(329,49,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(330,49,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(331,49,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(332,49,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(333,49,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(334,49,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(335,49,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(336,49,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(337,50,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(338,50,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(339,50,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(340,50,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(341,50,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(342,50,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(343,50,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(344,50,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(345,51,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(346,51,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(347,51,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(348,51,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(349,51,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(350,51,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(351,51,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(352,51,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(353,52,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(354,52,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(355,52,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(356,52,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(357,52,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(358,52,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(359,52,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(360,52,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(361,53,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(362,53,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(363,53,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(364,53,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(365,53,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(366,53,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(367,53,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(368,53,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(369,54,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(370,54,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(371,54,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(372,54,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(373,54,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(374,54,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(375,54,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(376,54,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(377,55,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(378,55,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(379,55,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(380,55,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(381,55,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(382,55,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(383,55,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(384,55,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(385,56,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(386,56,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(387,56,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(388,56,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(389,56,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(390,56,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(391,56,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(392,56,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(393,57,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(394,57,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(395,57,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(396,57,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(397,57,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(398,57,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(399,57,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(400,57,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(401,58,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(402,58,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(403,58,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(404,58,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(405,58,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(406,58,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(407,58,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(408,58,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(409,59,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(410,59,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(411,59,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(412,59,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(413,59,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(414,59,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(415,59,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(416,59,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(417,60,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(418,60,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(419,60,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(420,60,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(421,60,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(422,60,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(423,60,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(424,60,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(425,61,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(426,61,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(427,61,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(428,61,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(429,61,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(430,61,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(431,61,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(432,61,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(433,62,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(434,62,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(435,62,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(436,62,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(437,62,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(438,62,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(439,62,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(440,62,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(441,63,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(442,63,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(443,63,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(444,63,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(445,63,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(446,63,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(447,63,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(448,63,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(449,64,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(450,64,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(451,64,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(452,64,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(453,64,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(454,64,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(455,64,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(456,64,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(457,65,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(458,65,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(459,65,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(460,65,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(461,65,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(462,65,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(463,65,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(464,65,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(465,66,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(466,66,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(467,66,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(468,66,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(469,66,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(470,66,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(471,66,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(472,66,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(473,67,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(474,67,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(475,67,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(476,67,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(477,67,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(478,67,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(479,67,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(480,67,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(481,68,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(482,68,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(483,68,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(484,68,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(485,68,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(486,68,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(487,68,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(488,68,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(489,69,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(490,69,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(491,69,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(492,69,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(493,69,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(494,69,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(495,69,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(496,69,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(497,70,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(498,70,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(499,70,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(500,70,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(501,70,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(502,70,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(503,70,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(504,70,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(505,71,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(506,71,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(507,71,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(508,71,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(509,71,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(510,71,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(511,71,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(512,71,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(513,72,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(514,72,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(515,72,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(516,72,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(517,72,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(518,72,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(519,72,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(520,72,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(521,73,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(522,73,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(523,73,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(524,73,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(525,73,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(526,73,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(527,73,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(528,73,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(529,74,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(530,74,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(531,74,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(532,74,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(533,74,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(534,74,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(535,74,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(536,74,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(537,75,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(538,75,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(539,75,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(540,75,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(541,75,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(542,75,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(543,75,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(544,75,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(545,76,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(546,76,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(547,76,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(548,76,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(549,76,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(550,76,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(551,76,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(552,76,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(553,77,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(554,77,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(555,77,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(556,77,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(557,77,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(558,77,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(559,77,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(560,77,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(561,78,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(562,78,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(563,78,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(564,78,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(565,78,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(566,78,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(567,78,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(568,78,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(569,79,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(570,79,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(571,79,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(572,79,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(573,79,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(574,79,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(575,79,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(576,79,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(577,80,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(578,80,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(579,80,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(580,80,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(581,80,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(582,80,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(583,80,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(584,80,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(585,81,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(586,81,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(587,81,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(588,81,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(589,81,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(590,81,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(591,81,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(592,81,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(593,82,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(594,82,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(595,82,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(596,82,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(597,82,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(598,82,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(599,82,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(600,82,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(601,83,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(602,83,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(603,83,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(604,83,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(605,83,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(606,83,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(607,83,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(608,83,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(609,84,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(610,84,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(611,84,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(612,84,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(613,84,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(614,84,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(615,84,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(616,84,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(617,85,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(618,85,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(619,85,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(620,85,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(621,85,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(622,85,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(623,85,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(624,85,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(625,86,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(626,86,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(627,86,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(628,86,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(629,86,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(630,86,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(631,86,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(632,86,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(633,87,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(634,87,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(635,87,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(636,87,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(637,87,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(638,87,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(639,87,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(640,87,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(641,88,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(642,88,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(643,88,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(644,88,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(645,88,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(646,88,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(647,88,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(648,88,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(649,89,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(650,89,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(651,89,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(652,89,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(653,89,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(654,89,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(655,89,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(656,89,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(657,90,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(658,90,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(659,90,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(660,90,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(661,90,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(662,90,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(663,90,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(664,90,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(665,91,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(666,91,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(667,91,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(668,91,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(669,91,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(670,91,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(671,91,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(672,91,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(673,92,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(674,92,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(675,92,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(676,92,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(677,92,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(678,92,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(679,92,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(680,92,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(681,93,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(682,93,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(683,93,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(684,93,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(685,93,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(686,93,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(687,93,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(688,93,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(689,94,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(690,94,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(691,94,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(692,94,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(693,94,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(694,94,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(695,94,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(696,94,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(697,95,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(698,95,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(699,95,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(700,95,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(701,95,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(702,95,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(703,95,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(704,95,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(705,96,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(706,96,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(707,96,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(708,96,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(709,96,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(710,96,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(711,96,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(712,96,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(713,97,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(714,97,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(715,97,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(716,97,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(717,97,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(718,97,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(719,97,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(720,97,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(721,98,1,1,50,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(722,98,1,2,20,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(723,98,1,3,18,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(724,98,1,4,8,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(725,98,1,5,4,1,1,1,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(726,98,1,8,8,3,1,3,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(727,98,1,10,20,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(728,98,1,11,1,5,1,5,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11'),
(1024,8,1,1,12,1,0,NULL,NULL,'2020-06-23 09:39:11',NULL,'2020-06-23 09:39:11');

/*Table structure for table `salaryformulae2` */

DROP TABLE IF EXISTS `salaryformulae2`;

CREATE TABLE `salaryformulae2` (
  `SalaryFormulaeID` int(10) NOT NULL AUTO_INCREMENT,
  `GradeLevelID` int(10) DEFAULT NULL,
  `PayrollCategoryID` int(10) DEFAULT NULL,
  `SalaryComponentID` int(10) DEFAULT NULL,
  `Percentage` float DEFAULT NULL,
  `TaxStatusID` int(10) NOT NULL,
  `StatusID` int(10) NOT NULL,
  `SalaryTaxStatusID` int(10) DEFAULT NULL,
  PRIMARY KEY (`SalaryFormulaeID`),
  UNIQUE KEY `PK_Salary Formulae` (`SalaryFormulaeID`),
  KEY `IX_Relationship89` (`GradeLevelID`),
  KEY `IX_Relationship90` (`PayrollCategoryID`),
  KEY `IX_Relationship91` (`SalaryComponentID`),
  KEY `IX_Relationship93` (`SalaryTaxStatusID`),
  KEY `IX_Relationship94` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `salaryformulae2` */

insert  into `salaryformulae2`(`SalaryFormulaeID`,`GradeLevelID`,`PayrollCategoryID`,`SalaryComponentID`,`Percentage`,`TaxStatusID`,`StatusID`,`SalaryTaxStatusID`) values 
(1,NULL,1,1,50,1,1,1),
(2,NULL,1,2,20,1,1,1),
(3,NULL,1,3,18,1,1,1),
(4,NULL,1,4,8,1,1,1),
(5,NULL,1,5,4,1,1,1),
(6,NULL,1,8,8,3,1,3),
(7,NULL,1,10,20,5,1,5),
(8,NULL,1,11,1,5,1,5);

/*Table structure for table `salarytaxstatus` */

DROP TABLE IF EXISTS `salarytaxstatus`;

CREATE TABLE `salarytaxstatus` (
  `SalaryTaxStatusID` int(10) NOT NULL AUTO_INCREMENT,
  `TaxStatusID` int(10) NOT NULL,
  `TaxStatus` varchar(30) NOT NULL,
  `SalaryTypeID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SalaryTaxStatusID`),
  UNIQUE KEY `PK_Salary Tax Status` (`SalaryTaxStatusID`),
  KEY `IX_Relationship95` (`SalaryTypeID`),
  CONSTRAINT `Relationship95` FOREIGN KEY (`SalaryTypeID`) REFERENCES `salarytype` (`SalaryTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `salarytaxstatus` */

insert  into `salarytaxstatus`(`SalaryTaxStatusID`,`TaxStatusID`,`TaxStatus`,`SalaryTypeID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,1,'Taxable',1,NULL,'2020-06-23 09:39:19',NULL,'2020-06-23 09:39:19'),
(2,2,'Non-Taxable',1,NULL,'2020-06-23 09:39:19',NULL,'2020-06-23 09:39:19'),
(3,3,'After Tax',2,NULL,'2020-06-23 09:39:19',NULL,'2020-06-23 09:39:19'),
(4,4,'Before Tax',2,NULL,'2020-06-23 09:39:19',NULL,'2020-06-23 09:39:19'),
(5,5,'Always Before Tax',3,NULL,'2020-06-23 09:39:19',NULL,'2020-06-23 09:39:19');

/*Table structure for table `salarytype` */

DROP TABLE IF EXISTS `salarytype`;

CREATE TABLE `salarytype` (
  `SalaryTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `SalaryType` varchar(30) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SalaryTypeID`),
  UNIQUE KEY `PK_Salary Type` (`SalaryTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `salarytype` */

insert  into `salarytype`(`SalaryTypeID`,`SalaryType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Earnings',NULL,'2020-06-23 09:39:20',NULL,'2020-06-23 09:39:20'),
(2,'Deductions',NULL,'2020-06-23 09:39:20',NULL,'2020-06-23 09:39:20'),
(3,'Reliefs',NULL,'2020-06-23 09:39:20',NULL,'2020-06-23 09:39:20');

/*Table structure for table `salaryvariables` */

DROP TABLE IF EXISTS `salaryvariables`;

CREATE TABLE `salaryvariables` (
  `SalaryVariablesID` int(10) NOT NULL AUTO_INCREMENT,
  `VariableTypeID` int(10) DEFAULT NULL,
  `VariableCategoryID` int(10) DEFAULT NULL,
  `EmployeeID` int(10) DEFAULT NULL,
  `Amount` decimal(19,4) DEFAULT NULL,
  `Tenor` varchar(50) DEFAULT NULL,
  `PayrollPeriodID` int(10) DEFAULT NULL,
  `StatusID` int(10) DEFAULT NULL,
  `PostedBy` varchar(50) DEFAULT NULL,
  `DatePosted` date DEFAULT NULL,
  `SalaryComponentID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SalaryVariablesID`),
  UNIQUE KEY `PK_Salary Variables` (`SalaryVariablesID`),
  KEY `IX_Relationship101` (`SalaryComponentID`),
  KEY `IX_Relationship102` (`PayrollPeriodID`),
  KEY `IX_Relationship103` (`StatusID`),
  KEY `IX_Relationship104` (`EmployeeID`),
  CONSTRAINT `Relationship101` FOREIGN KEY (`SalaryComponentID`) REFERENCES `salarycomponent` (`SalaryComponentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship102` FOREIGN KEY (`PayrollPeriodID`) REFERENCES `payrollperiod` (`PayrollPeriodID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship103` FOREIGN KEY (`StatusID`) REFERENCES `statuses` (`StatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship104` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `salaryvariables` */

insert  into `salaryvariables`(`SalaryVariablesID`,`VariableTypeID`,`VariableCategoryID`,`EmployeeID`,`Amount`,`Tenor`,`PayrollPeriodID`,`StatusID`,`PostedBy`,`DatePosted`,`SalaryComponentID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(5,1,1,133,5000.0000,'1',1,1,NULL,NULL,7,NULL,'2020-06-23 09:39:21',NULL,'2020-06-23 09:39:21');

/*Table structure for table `salaryvariabletype` */

DROP TABLE IF EXISTS `salaryvariabletype`;

CREATE TABLE `salaryvariabletype` (
  `SalaryVariableTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `VariableTypeID` int(10) DEFAULT NULL,
  `VariableType` varchar(30) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SalaryVariableTypeID`),
  UNIQUE KEY `PK_Salary Variable Type` (`SalaryVariableTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `salaryvariabletype` */

insert  into `salaryvariabletype`(`SalaryVariableTypeID`,`VariableTypeID`,`VariableType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,NULL,'test',NULL,'2020-06-23 09:39:28',NULL,'2020-06-23 09:39:28');

/*Table structure for table `sanction` */

DROP TABLE IF EXISTS `sanction`;

CREATE TABLE `sanction` (
  `SanctionID` int(10) NOT NULL AUTO_INCREMENT,
  `Sanction` varchar(50) DEFAULT NULL,
  `OffenceID` int(10) DEFAULT NULL,
  `OffenceSanction` varchar(100) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`SanctionID`),
  UNIQUE KEY `PK_Sanction` (`SanctionID`),
  KEY `FK_Sanction_Offence` (`OffenceID`),
  CONSTRAINT `FK_Sanction_Offence` FOREIGN KEY (`OffenceID`) REFERENCES `offence` (`OffenceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sanction` */

insert  into `sanction`(`SanctionID`,`Sanction`,`OffenceID`,`OffenceSanction`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Issuing a Written Reprimand',1,'Financial Sanction',0,'2019-11-24 02:28:37.340000',NULL,NULL);

/*Table structure for table `schooltypes` */

DROP TABLE IF EXISTS `schooltypes`;

CREATE TABLE `schooltypes` (
  `SchoolTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `SchoolType` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SchoolTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `schooltypes` */

insert  into `schooltypes`(`SchoolTypeID`,`SchoolType`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'type 1',NULL,'2020-06-23 09:39:30',NULL,'2020-06-23 09:39:30');

/*Table structure for table `sheet1` */

DROP TABLE IF EXISTS `sheet1`;

CREATE TABLE `sheet1` (
  `POSITION` varchar(255) DEFAULT NULL,
  `REPORT` varchar(255) DEFAULT NULL,
  `Backup Reports` varchar(255) DEFAULT NULL,
  `F4` varchar(255) DEFAULT NULL,
  `F5` varchar(255) DEFAULT NULL,
  `F6` varchar(255) DEFAULT NULL,
  `F7` varchar(255) DEFAULT NULL,
  `desId` int(11) DEFAULT NULL,
  `reportId` int(11) DEFAULT NULL,
  `desbackId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sheet1` */

insert  into `sheet1`(`POSITION`,`REPORT`,`Backup Reports`,`F4`,`F5`,`F6`,`F7`,`desId`,`reportId`,`desbackId`) values 
('Project Manager',NULL,NULL,NULL,NULL,NULL,NULL,22,NULL,NULL),
('Design Manager','Project Manager',NULL,NULL,NULL,NULL,NULL,26,22,NULL),
('Assistant Project Manager','Project Manager',NULL,NULL,NULL,NULL,NULL,24,22,NULL),
('Technical  Quality Manager','Project Manager','Assistant Project Manager',NULL,NULL,NULL,NULL,27,22,24),
('Resident Engineer','Project Manager','Assistant Project Manager',NULL,NULL,NULL,NULL,25,22,24),
('Deputy Resident Engineer','Resident Engineer',NULL,NULL,NULL,NULL,NULL,28,25,NULL),
('Senior Structural Engineer','Resident Engineer','Deputy Resident Engineer',NULL,NULL,NULL,NULL,29,25,28),
('Senior Geotechnical Engineer','Resident Engineer','Deputy Resident Engineer',NULL,NULL,NULL,NULL,30,25,28),
('Senior QS (HoD)','Resident Engineer','Deputy Resident Engineer',NULL,NULL,NULL,NULL,31,25,28),
('Senior Surveyor (HoD)','Resident Engineer','Deputy Resident Engineer',NULL,NULL,NULL,NULL,32,25,28),
('Senior Geologist (HoD)','Resident Engineer','Deputy Resident Engineer',NULL,NULL,NULL,NULL,33,25,28),
('Senior Civil/Site Engineer (HoD)','Resident Engineer','Deputy Resident Engineer',NULL,NULL,NULL,NULL,34,25,28),
('Senior Architect (HoD)','Resident Engineer','Deputy Resident Engineer',NULL,NULL,NULL,NULL,35,25,28),
('Senior PW Engineer (HoD)','Resident Engineer','Deputy Resident Engineer',NULL,NULL,NULL,NULL,36,25,28),
('Senior Elect. Engineer (HoD)','Resident Engineer','Deputy Resident Engineer',NULL,NULL,NULL,NULL,37,25,28),
('Senior Sig. and Tel. Engineer (HoD)','Resident Engineer','Deputy Resident Engineer',NULL,NULL,NULL,NULL,38,25,28),
('Senior Logistic Officer (HoD)','Resident Engineer','Deputy Resident Engineer',NULL,NULL,NULL,NULL,39,25,28),
('Safety Officer','Resident Engineer','Deputy Resident Engineer',NULL,NULL,NULL,NULL,40,25,28),
('Accountant','Resident Engineer','Deputy Resident Engineer',NULL,NULL,NULL,NULL,13,25,28),
('Document Controller','Resident Engineer','Deputy Resident Engineer',NULL,NULL,NULL,NULL,41,25,28),
('Archivist','Resident Engineer','Deputy Resident Engineer',NULL,NULL,NULL,NULL,42,25,28),
('Structural Engineer','Senior Structural Engineer',NULL,NULL,NULL,NULL,NULL,43,29,NULL),
('Geotechnical Engineer','Senior Geotechnical Engineer',NULL,NULL,NULL,NULL,NULL,44,30,NULL),
('Senior QS ','Senior QS (HoD)',NULL,NULL,NULL,NULL,NULL,45,31,NULL),
('Senior Surveyor','Senior Surveyor (HoD)',NULL,NULL,NULL,NULL,NULL,46,32,NULL),
('Senior Geologist','Senior Geologist (HoD)',NULL,NULL,NULL,NULL,NULL,47,33,NULL),
('Senior Civil/Site Engineer','Senior Civil/Site Engineer (HoD)',NULL,NULL,NULL,NULL,NULL,48,34,NULL),
('Senior Architect','Senior Architect (HoD)',NULL,NULL,NULL,NULL,NULL,49,35,NULL),
('Senior PW Engineer','Senior PW Engineer (HoD)',NULL,NULL,NULL,NULL,NULL,50,36,NULL),
('Senior Elect. Engineer','Senior Elect. Engineer (HoD)',NULL,NULL,NULL,NULL,NULL,51,37,NULL),
('Senior Sig. and Tel. Engineer','Senior Sig. and Tel. Engineer (HoD)',NULL,NULL,NULL,NULL,NULL,52,38,NULL),
('Senior Logistic Officer','Senior Logistic Officer (HoD)',NULL,NULL,NULL,NULL,NULL,53,39,NULL),
('IT Officer','Senior Logistic Officer (HoD)',NULL,NULL,NULL,NULL,NULL,54,39,NULL),
('Accountant Clerk','Accountant',NULL,NULL,NULL,NULL,NULL,154,13,NULL),
('Document Controll Clerk','Document Controller',NULL,NULL,NULL,NULL,NULL,41,41,NULL),
('Assistant Archivist','Archivist',NULL,NULL,NULL,NULL,NULL,42,42,NULL),
('Chief QS Engineer','Senior QS ',NULL,NULL,NULL,NULL,NULL,57,45,NULL),
('Chief Surveyor','Senior Surveyor',NULL,NULL,NULL,NULL,NULL,58,46,NULL),
('Chief Geologist','Senior Geologist',NULL,NULL,NULL,NULL,NULL,59,47,NULL),
('Chief Civil/Site Engineer','Senior Civil/Site Engineer',NULL,NULL,NULL,NULL,NULL,60,48,NULL),
('Chief Architect','Senior Chief Architect',NULL,NULL,NULL,NULL,NULL,61,NULL,NULL),
('Chief PW Engineer','Senior PW Engineer',NULL,NULL,NULL,NULL,NULL,62,50,NULL),
('Chief Elect. Engineer','Senior Elect. Engineer',NULL,NULL,NULL,NULL,NULL,63,51,NULL),
('Chief Sig. and Tel. Engineer','Senior Sig. and Tel. Engineer',NULL,NULL,NULL,NULL,NULL,64,52,NULL),
('Chief Logistic Officer','Senior Logistic Officer',NULL,NULL,NULL,NULL,NULL,65,53,NULL),
('QS','Chief QS Engineer',NULL,NULL,NULL,NULL,NULL,66,57,NULL),
('Surveyor','Chief Surveyor',NULL,NULL,NULL,NULL,NULL,67,58,NULL),
('Geologist','Chief Geologist',NULL,NULL,NULL,NULL,NULL,68,59,NULL),
('Civil/Site Engineer','Chief Civil/Site Engineer',NULL,NULL,NULL,NULL,NULL,69,60,NULL),
('Architect','Chief Architect',NULL,NULL,NULL,NULL,NULL,70,61,NULL),
('PW Engineer','Chief PW Engineer',NULL,NULL,NULL,NULL,NULL,71,62,NULL),
('Elect. Engineer','Chief Elect. Engineer',NULL,NULL,NULL,NULL,NULL,72,63,NULL),
('Sig. and Tel. Engineer','Chief Sig. and Tel. Engineer',NULL,NULL,NULL,NULL,NULL,73,64,NULL),
('Logistic Officer','Chief Logistic Officer',NULL,NULL,NULL,NULL,NULL,74,65,NULL),
('Assistant QS','QS',NULL,NULL,NULL,NULL,NULL,75,66,NULL),
('Assistant Surveyor','Surveyor',NULL,NULL,NULL,NULL,NULL,76,67,NULL),
('Assistant Geologist','Geologist',NULL,NULL,NULL,NULL,NULL,77,68,NULL),
('Assistant Civil/Site Engineer','Civil/Site Engineer',NULL,NULL,NULL,NULL,NULL,78,69,NULL),
('Assistant Architect','Architect',NULL,NULL,NULL,NULL,NULL,79,70,NULL),
('Assistant PW Engineer','PW Engineer',NULL,NULL,NULL,NULL,NULL,80,71,NULL),
('Assistant Elect. Engineer','Elect. Engineer',NULL,NULL,NULL,NULL,NULL,81,72,NULL),
('Assistant Sig. and Tel. Engineer','Sig. and Tel. Engineer',NULL,NULL,NULL,NULL,NULL,82,73,NULL),
('Logistic Clerk','Logistic Officer',NULL,NULL,NULL,NULL,NULL,83,74,NULL),
('Chainman','Assistant Surveyor',NULL,NULL,NULL,NULL,NULL,84,76,NULL),
('Chief Lab. Technician','Assistant Geologist',NULL,NULL,NULL,NULL,NULL,85,77,NULL),
('Laborotary Technician','Chief Lab. Technician',NULL,NULL,NULL,NULL,NULL,86,85,NULL),
('Assistant Lab. Technician','Laborotary Technician',NULL,NULL,NULL,NULL,NULL,87,86,NULL),
('Assistant Design Manager','Design Manager',NULL,NULL,NULL,NULL,NULL,88,26,NULL),
('Senior Transport Engineer (HoD)','Design Manager','Assistant Design Manager',NULL,NULL,NULL,NULL,89,26,88),
('Senior Structural Engineer (HoD)','Design Manager','Assistant Design Manager',NULL,NULL,NULL,NULL,90,26,88),
('Senior Architect Engineer (HoD)','Design Manager','Assistant Design Manager',NULL,NULL,NULL,NULL,91,26,88),
('Senior Geotechnical Engineer (HoD)','Design Manager','Assistant Design Manager',NULL,NULL,NULL,NULL,92,26,88),
('Senior Hydraulic Engineer (HoD)','Design Manager','Assistant Design Manager',NULL,NULL,NULL,NULL,93,26,88),
('Senior Electromechanical Engineer (HoD)','Design Manager','Assistant Design Manager',NULL,NULL,NULL,NULL,94,26,88),
('Senior Sig. and Tel. Engineer (HoD)','Design Manager','Assistant Design Manager',NULL,NULL,NULL,NULL,38,26,88),
('Draftmans','Design Manager','Assistant Design Manager',NULL,NULL,NULL,NULL,96,26,88),
('Senior Document Control Coordinator (HoD)','Design Manager','Assistant Design Manager',NULL,NULL,NULL,NULL,97,26,88),
('Senior Transport Engineer','Senior Transport Engineer (HoD)',NULL,NULL,NULL,NULL,NULL,98,89,NULL),
('Senior Structural Engineer','Senior Structural Engineer (HoD)',NULL,NULL,NULL,NULL,NULL,29,90,NULL),
('Senior Architect Engineer','Senior Architect Engineer (HoD)',NULL,NULL,NULL,NULL,NULL,100,91,NULL),
('Senior Geotechnical Engineer','Senior Geotechnical Engineer (HoD)',NULL,NULL,NULL,NULL,NULL,30,92,NULL),
('Senior Hydraulic Engineer','Senior Hydraulic Engineer (HoD)',NULL,NULL,NULL,NULL,NULL,102,93,NULL),
('Senior Electromechanical Engineer','Senior Electromechanical Engineer (HoD)',NULL,NULL,NULL,NULL,NULL,103,94,NULL),
('Senior Sig. and Tel. Engineer','Senior Sig. and Tel. Engineer (HoD)',NULL,NULL,NULL,NULL,NULL,52,38,NULL),
('Senior Document Control Coordinator','Senior Document Control Coordinator (HoD)',NULL,NULL,NULL,NULL,NULL,105,97,NULL),
('Chief Transport Engineer','Senior Transport Engineer',NULL,NULL,NULL,NULL,NULL,106,98,NULL),
('Chief Structural Engineer','Senior Structural Engineer',NULL,NULL,NULL,NULL,NULL,107,29,NULL),
('Chief Architect Engineer','Senior Architect Engineer',NULL,NULL,NULL,NULL,NULL,108,100,NULL),
('Chief Geotechnical Engineer','Senior Geotechnical Engineer',NULL,NULL,NULL,NULL,NULL,109,30,NULL),
('Chief Hydraulic Engineer','Senior Hydraulic Engineer',NULL,NULL,NULL,NULL,NULL,110,102,NULL),
('Chief Electromechanical Engineer','Senior Electromechanical Engineer',NULL,NULL,NULL,NULL,NULL,111,103,NULL),
('Chief Sig. and Tel. Engineer','Senior Sig. and Tel. Engineer',NULL,NULL,NULL,NULL,NULL,64,52,NULL),
('Chief Document Control Coordinator','Senior Document Control Coordinator',NULL,NULL,NULL,NULL,NULL,113,105,NULL),
('Transport Engineer','Chief Transport Engineer',NULL,NULL,NULL,NULL,NULL,114,106,NULL),
('Structural Engineer','Chief Structural Engineer',NULL,NULL,NULL,NULL,NULL,43,107,NULL),
('Architect Engineer','Chief Architect Engineer',NULL,NULL,NULL,NULL,NULL,116,108,NULL),
('Geotechnical Engineer','Chief Geotechnical Engineer',NULL,NULL,NULL,NULL,NULL,44,109,NULL),
('Hydraulic Engineer','Chief Hydraulic Engineer',NULL,NULL,NULL,NULL,NULL,118,110,NULL),
('Electromechanical Engineer','Chief Electromechanical Engineer',NULL,NULL,NULL,NULL,NULL,119,111,NULL),
('Sig. and Tel. Engineer','Chief Sig. and Tel. Engineer',NULL,NULL,NULL,NULL,NULL,73,64,NULL),
('Documents Controller (DM)','Chief Document Control Coordinator',NULL,NULL,NULL,NULL,NULL,153,113,NULL),
('Documents Control Clerk (DM)','Documents Controller (DM)',NULL,NULL,NULL,NULL,NULL,122,153,NULL);

/*Table structure for table `shift_category` */

DROP TABLE IF EXISTS `shift_category`;

CREATE TABLE `shift_category` (
  `shift_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `shift_category` varchar(50) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`shift_category_id`),
  UNIQUE KEY `PK_shift_category` (`shift_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `shift_category` */

insert  into `shift_category`(`shift_category_id`,`shift_category`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Normal',NULL,'2020-06-23 09:39:30',NULL,'2020-06-23 09:39:30'),
(2,'Schedule',NULL,'2020-06-23 09:39:30',NULL,'2020-06-23 09:39:30');

/*Table structure for table `shift_config` */

DROP TABLE IF EXISTS `shift_config`;

CREATE TABLE `shift_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `DepartmentID` int(10) DEFAULT NULL,
  `shift_template_id` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `PK_shift_config` (`id`),
  KEY `shift_template_id` (`shift_template_id`),
  KEY `department_id` (`DepartmentID`),
  CONSTRAINT `shift_config_ibfk_1` FOREIGN KEY (`shift_template_id`) REFERENCES `shift_templates` (`shift_template_id`),
  CONSTRAINT `shift_config_ibfk_2` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shift_config` */

/*Table structure for table `shift_days` */

DROP TABLE IF EXISTS `shift_days`;

CREATE TABLE `shift_days` (
  `shift_day_id` int(10) NOT NULL AUTO_INCREMENT,
  `shift_day_name` varchar(50) DEFAULT NULL,
  `shift_day_shortname` varchar(50) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`shift_day_id`),
  UNIQUE KEY `PK_shift_days` (`shift_day_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `shift_days` */

insert  into `shift_days`(`shift_day_id`,`shift_day_name`,`shift_day_shortname`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Monday','Mon',NULL,'2020-06-23 09:39:43',NULL,'2020-06-23 09:39:43');

/*Table structure for table `shift_exclude` */

DROP TABLE IF EXISTS `shift_exclude`;

CREATE TABLE `shift_exclude` (
  `shift_excludeID` int(10) NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) DEFAULT NULL,
  `department_id` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`shift_excludeID`),
  UNIQUE KEY `PK_shift_exclude` (`shift_excludeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shift_exclude` */

/*Table structure for table `shift_schedule_details` */

DROP TABLE IF EXISTS `shift_schedule_details`;

CREATE TABLE `shift_schedule_details` (
  `scheduledetailsID` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(11) DEFAULT NULL,
  `shift_date` datetime DEFAULT NULL,
  `shift_status_id` int(11) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `shift_schedule_id` int(11) DEFAULT NULL,
  `isAbsent` int(11) DEFAULT 0,
  `isLeave` int(11) DEFAULT 0,
  `isLate` int(11) DEFAULT 0,
  `isCloseEarly` int(11) DEFAULT 0,
  `isPunctual` int(11) DEFAULT 0,
  `shift_template_id` int(11) DEFAULT NULL,
  `smsSent` int(11) DEFAULT NULL,
  `smsresponse` varchar(500) DEFAULT NULL,
  `smsSentdate` datetime DEFAULT NULL,
  `isTour` int(11) DEFAULT 0,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`scheduledetailsID`),
  KEY `shift_status_id` (`shift_status_id`),
  KEY `shift_id` (`shift_id`),
  KEY `shift_schedule_id` (`shift_schedule_id`),
  KEY `shift_template_id` (`shift_template_id`),
  CONSTRAINT `shift_schedule_details_ibfk_1` FOREIGN KEY (`shift_status_id`) REFERENCES `shift_status` (`shift_status_id`),
  CONSTRAINT `shift_schedule_details_ibfk_2` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`shift_id`),
  CONSTRAINT `shift_schedule_details_ibfk_3` FOREIGN KEY (`shift_schedule_id`) REFERENCES `shift_schedules` (`shift_schedule_id`),
  CONSTRAINT `shift_schedule_details_ibfk_4` FOREIGN KEY (`shift_template_id`) REFERENCES `shift_templates` (`shift_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shift_schedule_details` */

/*Table structure for table `shift_schedule_employees` */

DROP TABLE IF EXISTS `shift_schedule_employees`;

CREATE TABLE `shift_schedule_employees` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(10) DEFAULT NULL,
  `shift_schedule_id` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `PK__shift_sc__3213E83F1A4AED37` (`id`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `shift_schedule_employees_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shift_schedule_employees` */

/*Table structure for table `shift_schedules` */

DROP TABLE IF EXISTS `shift_schedules`;

CREATE TABLE `shift_schedules` (
  `shift_schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `shift_template_id` int(10) DEFAULT NULL,
  `date_from` timestamp(6) NULL DEFAULT NULL,
  `date_to` timestamp(6) NULL DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `DepartmentID` int(10) DEFAULT NULL,
  PRIMARY KEY (`shift_schedule_id`),
  UNIQUE KEY `PK_shift_schedules` (`shift_schedule_id`),
  KEY `shift_template_id` (`shift_template_id`),
  KEY `DepartmentID` (`DepartmentID`),
  CONSTRAINT `shift_schedules_ibfk_1` FOREIGN KEY (`shift_template_id`) REFERENCES `shift_templates` (`shift_template_id`),
  CONSTRAINT `shift_schedules_ibfk_2` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shift_schedules` */

/*Table structure for table `shift_status` */

DROP TABLE IF EXISTS `shift_status`;

CREATE TABLE `shift_status` (
  `shift_status_id` int(10) NOT NULL AUTO_INCREMENT,
  `shift_status` varchar(50) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`shift_status_id`),
  UNIQUE KEY `PK_shift_status` (`shift_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `shift_status` */

insert  into `shift_status`(`shift_status_id`,`shift_status`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'On',NULL,'2020-06-23 09:39:46',NULL,'2020-06-23 09:39:46');

/*Table structure for table `shift_status_category` */

DROP TABLE IF EXISTS `shift_status_category`;

CREATE TABLE `shift_status_category` (
  `shift_status_category_id` int(10) NOT NULL,
  `shift_status_category` varchar(30) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`shift_status_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shift_status_category` */

insert  into `shift_status_category`(`shift_status_category_id`,`shift_status_category`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Check In',NULL,'2020-06-23 09:39:46',NULL,'2020-06-23 09:39:46'),
(2,'Check Out',NULL,'2020-06-23 09:39:46',NULL,'2020-06-23 09:39:46'),
(3,'Break Out',NULL,'2020-06-23 09:39:46',NULL,'2020-06-23 09:39:46'),
(4,'Break In',NULL,'2020-06-23 09:39:46',NULL,'2020-06-23 09:39:46');

/*Table structure for table `shift_template_details` */

DROP TABLE IF EXISTS `shift_template_details`;

CREATE TABLE `shift_template_details` (
  `templatedetailsID` int(10) NOT NULL AUTO_INCREMENT,
  `shift_day_id` int(10) DEFAULT NULL,
  `shift_template_id` int(10) DEFAULT NULL,
  `shift_status_id` int(10) DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  PRIMARY KEY (`templatedetailsID`),
  UNIQUE KEY `PK_shift_template_details` (`templatedetailsID`),
  KEY `shift_day_id` (`shift_day_id`),
  KEY `shift_template_id` (`shift_template_id`),
  KEY `shift_status_id` (`shift_status_id`),
  CONSTRAINT `shift_template_details_ibfk_1` FOREIGN KEY (`shift_day_id`) REFERENCES `shift_days` (`shift_day_id`),
  CONSTRAINT `shift_template_details_ibfk_2` FOREIGN KEY (`shift_template_id`) REFERENCES `shift_templates` (`shift_template_id`),
  CONSTRAINT `shift_template_details_ibfk_3` FOREIGN KEY (`shift_status_id`) REFERENCES `shift_status` (`shift_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shift_template_details` */

/*Table structure for table `shift_templates` */

DROP TABLE IF EXISTS `shift_templates`;

CREATE TABLE `shift_templates` (
  `shift_template_id` int(10) NOT NULL AUTO_INCREMENT,
  `shift_template` varchar(50) DEFAULT NULL,
  `shift_category_id` int(10) DEFAULT NULL,
  `shift_type_id` int(10) DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` char(36) DEFAULT NULL,
  `shift_id` int(10) DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`shift_template_id`),
  UNIQUE KEY `PK_shift_templates` (`shift_template_id`),
  KEY `shift_category_id` (`shift_category_id`),
  KEY `shift_type_id` (`shift_type_id`),
  KEY `shift_id` (`shift_id`),
  CONSTRAINT `shift_templates_ibfk_1` FOREIGN KEY (`shift_category_id`) REFERENCES `shift_category` (`shift_category_id`),
  CONSTRAINT `shift_templates_ibfk_2` FOREIGN KEY (`shift_type_id`) REFERENCES `shift_types` (`shift_type_id`),
  CONSTRAINT `shift_templates_ibfk_3` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`shift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shift_templates` */

/*Table structure for table `shift_transactions` */

DROP TABLE IF EXISTS `shift_transactions`;

CREATE TABLE `shift_transactions` (
  `id` int(10) NOT NULL,
  `checktime` timestamp(6) NULL DEFAULT NULL,
  `device` varchar(40) DEFAULT NULL,
  `shift_status_category_id` int(10) DEFAULT NULL,
  `EmployeeID` int(10) DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `_dta_index_shift_transactions_9_670729542__K6_K2_K7` (`shift_status_category_id`,`checktime`,`EmployeeID`),
  KEY `_dta_index_shift_transactions_9_670729542__K7_K1_K4` (`EmployeeID`),
  KEY `idx_missing` (`EmployeeID`),
  KEY `_dta_index_shift_transactions_9_670729542__K6_K7_K2_K4_1` (`shift_status_category_id`,`EmployeeID`,`checktime`),
  CONSTRAINT `shift_transactions_ibfk_1` FOREIGN KEY (`shift_status_category_id`) REFERENCES `shift_status_category` (`shift_status_category_id`),
  CONSTRAINT `shift_transactions_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shift_transactions` */

/*Table structure for table `shift_types` */

DROP TABLE IF EXISTS `shift_types`;

CREATE TABLE `shift_types` (
  `shift_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `shift_type` varchar(50) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`shift_type_id`),
  UNIQUE KEY `PK_shift_types` (`shift_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `shift_types` */

insert  into `shift_types`(`shift_type_id`,`shift_type`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Morning',NULL,'2020-06-23 09:39:46',NULL,'2020-06-23 09:39:46'),
(2,'Afternoon',NULL,'2020-06-23 09:39:46',NULL,'2020-06-23 09:39:46'),
(3,'Night',NULL,'2020-06-23 09:39:46',NULL,'2020-06-23 09:39:46'),
(4,'12 Hour',NULL,'2020-06-23 09:39:46',NULL,'2020-06-23 09:39:46');

/*Table structure for table `shifts` */

DROP TABLE IF EXISTS `shifts`;

CREATE TABLE `shifts` (
  `shift_id` int(10) NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(50) DEFAULT NULL,
  `shift_type_id` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`shift_id`),
  UNIQUE KEY `PK_shifts` (`shift_id`),
  KEY `shift_type_id` (`shift_type_id`),
  CONSTRAINT `shifts_ibfk_1` FOREIGN KEY (`shift_type_id`) REFERENCES `shift_types` (`shift_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `shifts` */

insert  into `shifts`(`shift_id`,`shift_name`,`shift_type_id`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Morning',1,NULL,'2020-06-23 09:39:47',NULL,'2020-06-23 09:39:47'),
(2,'Afternoon',2,NULL,'2020-06-23 09:39:47',NULL,'2020-06-23 09:39:47');

/*Table structure for table `skills` */

DROP TABLE IF EXISTS `skills`;

CREATE TABLE `skills` (
  `SkillID` int(11) NOT NULL AUTO_INCREMENT,
  `Skill` varchar(75) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `ModifiedBy` int(11) DEFAULT NULL,
  `DateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SkillID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `skills` */

insert  into `skills`(`SkillID`,`Skill`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Engineering',125,'2020-07-01 09:03:02',NULL,'2020-07-01 09:03:02');

/*Table structure for table `staffcategory` */

DROP TABLE IF EXISTS `staffcategory`;

CREATE TABLE `staffcategory` (
  `StaffCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `StaffCategory` varchar(75) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`StaffCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `staffcategory` */

insert  into `staffcategory`(`StaffCategoryID`,`StaffCategory`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Junior',1,'2020-07-12 22:35:58',NULL,'2020-07-12 22:35:58'),
(2,'Senior',1,'2020-07-12 22:36:06',NULL,'2020-07-12 22:36:06'),
(3,'Domestic\r\n',1,'2020-07-12 22:36:14',NULL,'2020-07-12 22:36:14');

/*Table structure for table `state` */

DROP TABLE IF EXISTS `state`;

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(60) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `CountryCode` char(3) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `country_id` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4238 DEFAULT CHARSET=utf8;

/*Data for the table `state` */

insert  into `state`(`state_id`,`state`,`CountryCode`,`country_id`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Kabul','AFG',2,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2,'Qandahar','AFG',2,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3,'Herat','AFG',2,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4,'Mazar-e-Sharif','AFG',2,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(5,'Amsterdam','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(6,'Rotterdam','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(7,'Haag','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(8,'Utrecht','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(9,'Eindhoven','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(10,'Tilburg','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(11,'Groningen','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(12,'Breda','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(13,'Apeldoorn','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(14,'Nijmegen','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(15,'Enschede','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(16,'Haarlem','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(17,'Almere','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(18,'Arnhem','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(19,'Zaanstad','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(20,'s-Hertogenbosch','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(21,'Amersfoort','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(22,'Maastricht','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(23,'Dordrecht','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(24,'Leiden','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(25,'Haarlemmermeer','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(26,'Zoetermeer','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(27,'Emmen','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(28,'Zwolle','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(29,'Ede','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(30,'Delft','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(31,'Heerlen','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(32,'Alkmaar','NLD',154,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(33,'Willemstad','ANT',7,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(34,'Tirana','ALB',5,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(35,'Alger','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(36,'Oran','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(37,'Constantine','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(38,'Annaba','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(39,'Batna','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(40,'Sétif','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(41,'Sidi Bel Abbès','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(42,'Skikda','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(43,'Biskra','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(44,'Blida (el-Boulaida)','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(45,'Béjaïa','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(46,'Mostaganem','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(47,'Tébessa','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(48,'Tlemcen (Tilimsen)','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(49,'Béchar','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(50,'Tiaret','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(51,'Ech-Chleff (el-Asnam)','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(52,'Ghardaïa','DZA',58,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(53,'Tafuna','ASM',11,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(54,'Fagatogo','ASM',11,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(55,'Andorra la Vella','AND',6,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(56,'Luanda','AGO',3,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(57,'Huambo','AGO',3,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(58,'Lobito','AGO',3,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(59,'Benguela','AGO',3,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(60,'Namibe','AGO',3,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(61,'South Hill','AIA',4,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(62,'The Valley','AIA',4,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(63,'Saint John´s','ATG',13,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(64,'Dubai','ARE',8,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(65,'Abu Dhabi','ARE',8,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(66,'Sharja','ARE',8,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(67,'al-Ayn','ARE',8,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(68,'Ajman','ARE',8,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(69,'Buenos Aires','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(70,'La Matanza','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(71,'Córdoba','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(72,'Rosario','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(73,'Lomas de Zamora','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(74,'Quilmes','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(75,'Almirante Brown','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(76,'La Plata','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(77,'Mar del Plata','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(78,'San Miguel de Tucumán','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(79,'Lanús','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(80,'Merlo','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(81,'General San Martín','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(82,'Salta','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(83,'Moreno','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(84,'Santa Fé','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(85,'Avellaneda','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(86,'Tres de Febrero','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(87,'Morón','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(88,'Florencio Varela','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(89,'San Isidro','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(90,'Tigre','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(91,'Malvinas Argentinas','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(92,'Vicente López','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(93,'Berazategui','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(94,'Corrientes','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(95,'San Miguel','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(96,'Bahía Blanca','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(97,'Esteban Echeverría','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(98,'Resistencia','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(99,'José C. Paz','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(100,'Paraná','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(101,'Godoy Cruz','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(102,'Posadas','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(103,'Guaymallén','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(104,'Santiago del Estero','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(105,'San Salvador de Jujuy','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(106,'Hurlingham','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(107,'Neuquén','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(108,'Ituzaingó','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(109,'San Fernando','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(110,'Formosa','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(111,'Las Heras','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(112,'La Rioja','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(113,'San Fernando del Valle de Cata','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(114,'Río Cuarto','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(115,'Comodoro Rivadavia','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(116,'Mendoza','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(117,'San Nicolás de los Arroyos','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(118,'San Juan','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(119,'Escobar','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(120,'Concordia','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(121,'Pilar','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(122,'San Luis','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(123,'Ezeiza','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(124,'San Rafael','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(125,'Tandil','ARG',9,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(126,'Yerevan','ARM',10,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(127,'Gjumri','ARM',10,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(128,'Vanadzor','ARM',10,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(129,'Oranjestad','ABW',1,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(130,'Sydney','AUS',14,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(131,'Melbourne','AUS',14,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(132,'Brisbane','AUS',14,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(133,'Perth','AUS',14,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(134,'Adelaide','AUS',14,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(135,'Canberra','AUS',14,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(136,'Gold Coast','AUS',14,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(137,'Newcastle','AUS',14,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(138,'Central Coast','AUS',14,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(139,'Wollongong','AUS',14,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(140,'Hobart','AUS',14,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(141,'Geelong','AUS',14,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(142,'Townsville','AUS',14,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(143,'Cairns','AUS',14,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(144,'Baku','AZE',16,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(145,'Gäncä','AZE',16,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(146,'Sumqayit','AZE',16,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(147,'Mingäçevir','AZE',16,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(148,'Nassau','BHS',24,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(149,'al-Manama','BHR',23,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(150,'Dhaka','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(151,'Chittagong','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(152,'Khulna','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(153,'Rajshahi','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(154,'Narayanganj','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(155,'Rangpur','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(156,'Mymensingh','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(157,'Barisal','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(158,'Tungi','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(159,'Jessore','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(160,'Comilla','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(161,'Nawabganj','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(162,'Dinajpur','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(163,'Bogra','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(164,'Sylhet','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(165,'Brahmanbaria','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(166,'Tangail','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(167,'Jamalpur','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(168,'Pabna','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(169,'Naogaon','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(170,'Sirajganj','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(171,'Narsinghdi','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(172,'Saidpur','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(173,'Gazipur','BGD',21,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(174,'Bridgetown','BRB',31,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(175,'Antwerpen','BEL',18,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(176,'Gent','BEL',18,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(177,'Charleroi','BEL',18,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(178,'Liège','BEL',18,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(179,'Bruxelles [Brussel]','BEL',18,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(180,'Brugge','BEL',18,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(181,'Schaerbeek','BEL',18,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(182,'Namur','BEL',18,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(183,'Mons','BEL',18,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(184,'Belize City','BLZ',27,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(185,'Belmopan','BLZ',27,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(186,'Cotonou','BEN',19,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(187,'Porto-Novo','BEN',19,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(188,'Djougou','BEN',19,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(189,'Parakou','BEN',19,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(190,'Saint George','BMU',28,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(191,'Hamilton','BMU',28,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(192,'Thimphu','BTN',33,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(193,'Santa Cruz de la Sierra','BOL',29,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(194,'La Paz','BOL',29,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(195,'El Alto','BOL',29,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(196,'Cochabamba','BOL',29,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(197,'Oruro','BOL',29,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(198,'Sucre','BOL',29,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(199,'Potosí','BOL',29,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(200,'Tarija','BOL',29,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(201,'Sarajevo','BIH',25,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(202,'Banja Luka','BIH',25,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(203,'Zenica','BIH',25,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(204,'Gaborone','BWA',34,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(205,'Francistown','BWA',34,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(206,'São Paulo','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(207,'Rio de Janeiro','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(208,'Salvador','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(209,'Belo Horizonte','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(210,'Fortaleza','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(211,'Brasília','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(212,'Curitiba','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(213,'Recife','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(214,'Porto Alegre','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(215,'Manaus','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(216,'Belém','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(217,'Guarulhos','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(218,'Goiânia','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(219,'Campinas','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(220,'São Gonçalo','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(221,'Nova Iguaçu','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(222,'São Luís','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(223,'Maceió','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(224,'Duque de Caxias','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(225,'São Bernardo do Campo','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(226,'Teresina','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(227,'Natal','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(228,'Osasco','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(229,'Campo Grande','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(230,'Santo André','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(231,'João Pessoa','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(232,'Jaboatão dos Guararapes','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(233,'Contagem','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(234,'São José dos Campos','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(235,'Uberlândia','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(236,'Feira de Santana','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(237,'Ribeirão Preto','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(238,'Sorocaba','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(239,'Niterói','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(240,'Cuiabá','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(241,'Juiz de Fora','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(242,'Aracaju','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(243,'São João de Meriti','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(244,'Londrina','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(245,'Joinville','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(246,'Belford Roxo','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(247,'Santos','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(248,'Ananindeua','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(249,'Campos dos Goytacazes','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(250,'Mauá','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(251,'Carapicuíba','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(252,'Olinda','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(253,'Campina Grande','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(254,'São José do Rio Preto','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(255,'Caxias do Sul','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(256,'Moji das Cruzes','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(257,'Diadema','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(258,'Aparecida de Goiânia','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(259,'Piracicaba','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(260,'Cariacica','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(261,'Vila Velha','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(262,'Pelotas','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(263,'Bauru','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(264,'Porto Velho','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(265,'Serra','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(266,'Betim','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(267,'Jundíaí','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(268,'Canoas','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(269,'Franca','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(270,'São Vicente','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(271,'Maringá','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(272,'Montes Claros','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(273,'Anápolis','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(274,'Florianópolis','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(275,'Petrópolis','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(276,'Itaquaquecetuba','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(277,'Vitória','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(278,'Ponta Grossa','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(279,'Rio Branco','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(280,'Foz do Iguaçu','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(281,'Macapá','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(282,'Ilhéus','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(283,'Vitória da Conquista','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(284,'Uberaba','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(285,'Paulista','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(286,'Limeira','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(287,'Blumenau','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(288,'Caruaru','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(289,'Santarém','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(290,'Volta Redonda','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(291,'Novo Hamburgo','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(292,'Caucaia','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(293,'Santa Maria','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(294,'Cascavel','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(295,'Guarujá','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(296,'Ribeirão das Neves','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(297,'Governador Valadares','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(298,'Taubaté','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(299,'Imperatriz','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(300,'Gravataí','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(301,'Embu','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(302,'Mossoró','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(303,'Várzea Grande','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(304,'Petrolina','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(305,'Barueri','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(306,'Viamão','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(307,'Ipatinga','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(308,'Juazeiro','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(309,'Juazeiro do Norte','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(310,'Taboão da Serra','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(311,'São José dos Pinhais','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(312,'Magé','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(313,'Suzano','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(314,'São Leopoldo','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(315,'Marília','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(316,'São Carlos','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(317,'Sumaré','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(318,'Presidente Prudente','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(319,'Divinópolis','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(320,'Sete Lagoas','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(321,'Rio Grande','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(322,'Itabuna','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(323,'Jequié','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(324,'Arapiraca','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(325,'Colombo','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(326,'Americana','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(327,'Alvorada','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(328,'Araraquara','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(329,'Itaboraí','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(330,'Santa Bárbara d´Oeste','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(331,'Nova Friburgo','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(332,'Jacareí','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(333,'Araçatuba','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(334,'Barra Mansa','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(335,'Praia Grande','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(336,'Marabá','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(337,'Criciúma','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(338,'Boa Vista','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(339,'Passo Fundo','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(340,'Dourados','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(341,'Santa Luzia','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(342,'Rio Claro','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(343,'Maracanaú','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(344,'Guarapuava','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(345,'Rondonópolis','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(346,'São José','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(347,'Cachoeiro de Itapemirim','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(348,'Nilópolis','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(349,'Itapevi','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(350,'Cabo de Santo Agostinho','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(351,'Camaçari','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(352,'Sobral','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(353,'Itajaí','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(354,'Chapecó','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(355,'Cotia','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(356,'Lages','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(357,'Ferraz de Vasconcelos','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(358,'Indaiatuba','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(359,'Hortolândia','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(360,'Caxias','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(361,'São Caetano do Sul','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(362,'Itu','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(363,'Nossa Senhora do Socorro','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(364,'Parnaíba','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(365,'Poços de Caldas','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(366,'Teresópolis','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(367,'Barreiras','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(368,'Castanhal','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(369,'Alagoinhas','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(370,'Itapecerica da Serra','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(371,'Uruguaiana','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(372,'Paranaguá','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(373,'Ibirité','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(374,'Timon','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(375,'Luziânia','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(376,'Macaé','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(377,'Teófilo Otoni','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(378,'Moji-Guaçu','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(379,'Palmas','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(380,'Pindamonhangaba','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(381,'Francisco Morato','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(382,'Bagé','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(383,'Sapucaia do Sul','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(384,'Cabo Frio','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(385,'Itapetininga','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(386,'Patos de Minas','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(387,'Camaragibe','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(388,'Bragança Paulista','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(389,'Queimados','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(390,'Araguaína','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(391,'Garanhuns','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(392,'Vitória de Santo Antão','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(393,'Santa Rita','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(394,'Barbacena','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(395,'Abaetetuba','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(396,'Jaú','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(397,'Lauro de Freitas','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(398,'Franco da Rocha','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(399,'Teixeira de Freitas','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(400,'Varginha','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(401,'Ribeirão Pires','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(402,'Sabará','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(403,'Catanduva','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(404,'Rio Verde','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(405,'Botucatu','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(406,'Colatina','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(407,'Santa Cruz do Sul','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(408,'Linhares','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(409,'Apucarana','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(410,'Barretos','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(411,'Guaratinguetá','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(412,'Cachoeirinha','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(413,'Codó','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(414,'Jaraguá do Sul','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(415,'Cubatão','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(416,'Itabira','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(417,'Itaituba','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(418,'Araras','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(419,'Resende','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(420,'Atibaia','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(421,'Pouso Alegre','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(422,'Toledo','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(423,'Crato','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(424,'Passos','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(425,'Araguari','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(426,'São José de Ribamar','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(427,'Pinhais','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(428,'Sertãozinho','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(429,'Conselheiro Lafaiete','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(430,'Paulo Afonso','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(431,'Angra dos Reis','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(432,'Eunápolis','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(433,'Salto','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(434,'Ourinhos','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(435,'Parnamirim','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(436,'Jacobina','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(437,'Coronel Fabriciano','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(438,'Birigui','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(439,'Tatuí','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(440,'Ji-Paraná','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(441,'Bacabal','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(442,'Cametá','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(443,'Guaíba','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(444,'São Lourenço da Mata','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(445,'Santana do Livramento','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(446,'Votorantim','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(447,'Campo Largo','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(448,'Patos','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(449,'Ituiutaba','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(450,'Corumbá','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(451,'Palhoça','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(452,'Barra do Piraí','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(453,'Bento Gonçalves','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(454,'Poá','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(455,'Águas Lindas de Goiás','BRA',30,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(456,'London','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(457,'Birmingham','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(458,'Glasgow','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(459,'Liverpool','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(460,'Edinburgh','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(461,'Sheffield','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(462,'Manchester','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(463,'Leeds','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(464,'Bristol','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(465,'Cardiff','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(466,'Coventry','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(467,'Leicester','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(468,'Bradford','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(469,'Belfast','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(470,'Nottingham','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(471,'Kingston upon Hull','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(472,'Plymouth','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(473,'Stoke-on-Trent','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(474,'Wolverhampton','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(475,'Derby','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(476,'Swansea','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(477,'Southampton','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(478,'Aberdeen','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(479,'Northampton','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(480,'Dudley','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(481,'Portsmouth','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(482,'Newcastle upon Tyne','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(483,'Sunderland','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(484,'Luton','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(485,'Swindon','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(486,'Southend-on-Sea','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(487,'Walsall','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(488,'Bournemouth','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(489,'Peterborough','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(490,'Brighton','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(491,'Blackpool','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(492,'Dundee','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(493,'West Bromwich','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(494,'Reading','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(495,'Oldbury/Smethwick (Warley)','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(496,'Middlesbrough','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(497,'Huddersfield','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(498,'Oxford','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(499,'Poole','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(500,'Bolton','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(501,'Blackburn','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(502,'Newport','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(503,'Preston','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(504,'Stockport','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(505,'Norwich','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(506,'Rotherham','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(507,'Cambridge','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(508,'Watford','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(509,'Ipswich','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(510,'Slough','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(511,'Exeter','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(512,'Cheltenham','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(513,'Gloucester','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(514,'Saint Helens','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(515,'Sutton Coldfield','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(516,'York','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(517,'Oldham','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(518,'Basildon','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(519,'Worthing','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(520,'Chelmsford','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(521,'Colchester','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(522,'Crawley','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(523,'Gillingham','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(524,'Solihull','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(525,'Rochdale','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(526,'Birkenhead','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(527,'Worcester','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(528,'Hartlepool','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(529,'Halifax','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(530,'Woking/Byfleet','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(531,'Southport','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(532,'Maidstone','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(533,'Eastbourne','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(534,'Grimsby','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(535,'Saint Helier','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(536,'Douglas','GBR',73,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(537,'Road Town','VGB',213,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(538,'Bandar Seri Begawan','BRN',32,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(539,'Sofija','BGR',22,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(540,'Plovdiv','BGR',22,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(541,'Varna','BGR',22,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(542,'Burgas','BGR',22,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(543,'Ruse','BGR',22,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(544,'Stara Zagora','BGR',22,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(545,'Pleven','BGR',22,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(546,'Sliven','BGR',22,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(547,'Dobric','BGR',22,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(548,'Šumen','BGR',22,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(549,'Ouagadougou','BFA',20,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(550,'Bobo-Dioulasso','BFA',20,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(551,'Koudougou','BFA',20,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(552,'Bujumbura','BDI',17,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(553,'George Town','CYM',51,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(554,'Santiago de Chile','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(555,'Puente Alto','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(556,'Viña del Mar','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(557,'Valparaíso','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(558,'Talcahuano','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(559,'Antofagasta','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(560,'San Bernardo','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(561,'Temuco','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(562,'Concepción','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(563,'Rancagua','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(564,'Arica','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(565,'Talca','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(566,'Chillán','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(567,'Iquique','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(568,'Los Angeles','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(569,'Puerto Montt','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(570,'Coquimbo','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(571,'Osorno','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(572,'La Serena','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(573,'Calama','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(574,'Valdivia','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(575,'Punta Arenas','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(576,'Copiapó','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(577,'Quilpué','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(578,'Curicó','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(579,'Ovalle','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(580,'Coronel','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(581,'San Pedro de la Paz','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(582,'Melipilla','CHL',39,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(583,'Avarua','COK',44,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(584,'San José','CRI',48,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(585,'Djibouti','DJI',54,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(586,'Roseau','DMA',55,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(587,'Santo Domingo de Guzmán','DOM',57,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(588,'Santiago de los Caballeros','DOM',57,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(589,'La Romana','DOM',57,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(590,'San Pedro de Macorís','DOM',57,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(591,'San Francisco de Macorís','DOM',57,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(592,'San Felipe de Puerto Plata','DOM',57,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(593,'Guayaquil','ECU',59,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(594,'Quito','ECU',59,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(595,'Cuenca','ECU',59,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(596,'Machala','ECU',59,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(597,'Santo Domingo de los Colorados','ECU',59,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(598,'Portoviejo','ECU',59,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(599,'Ambato','ECU',59,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(600,'Manta','ECU',59,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(601,'Duran [Eloy Alfaro]','ECU',59,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(602,'Ibarra','ECU',59,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(603,'Quevedo','ECU',59,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(604,'Milagro','ECU',59,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(605,'Loja','ECU',59,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(606,'Ríobamba','ECU',59,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(607,'Esmeraldas','ECU',59,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(608,'Cairo','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(609,'Alexandria','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(610,'Giza','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(611,'Shubra al-Khayma','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(612,'Port Said','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(613,'Suez','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(614,'al-Mahallat al-Kubra','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(615,'Tanta','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(616,'al-Mansura','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(617,'Luxor','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(618,'Asyut','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(619,'Bahtim','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(620,'Zagazig','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(621,'al-Faiyum','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(622,'Ismailia','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(623,'Kafr al-Dawwar','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(624,'Assuan','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(625,'Damanhur','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(626,'al-Minya','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(627,'Bani Suwayf','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(628,'Qina','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(629,'Sawhaj','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(630,'Shibin al-Kawm','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(631,'Bulaq al-Dakrur','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(632,'Banha','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(633,'Warraq al-Arab','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(634,'Kafr al-Shaykh','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(635,'Mallawi','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(636,'Bilbays','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(637,'Mit Ghamr','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(638,'al-Arish','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(639,'Talkha','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(640,'Qalyub','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(641,'Jirja','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(642,'Idfu','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(643,'al-Hawamidiya','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(644,'Disuq','EGY',60,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(645,'San Salvador','SLV',183,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(646,'Santa Ana','SLV',183,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(647,'Mejicanos','SLV',183,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(648,'Soyapango','SLV',183,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(649,'San Miguel','SLV',183,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(650,'Nueva San Salvador','SLV',183,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(651,'Apopa','SLV',183,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(652,'Asmara','ERI',61,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(653,'Madrid','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(654,'Barcelona','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(655,'Valencia','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(656,'Sevilla','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(657,'Zaragoza','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(658,'Málaga','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(659,'Bilbao','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(660,'Las Palmas de Gran Canaria','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(661,'Murcia','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(662,'Palma de Mallorca','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(663,'Valladolid','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(664,'Córdoba','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(665,'Vigo','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(666,'Alicante [Alacant]','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(667,'Gijón','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(668,'L´Hospitalet de Llobregat','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(669,'Granada','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(670,'A Coruña (La Coruña)','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(671,'Vitoria-Gasteiz','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(672,'Santa Cruz de Tenerife','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(673,'Badalona','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(674,'Oviedo','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(675,'Móstoles','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(676,'Elche [Elx]','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(677,'Sabadell','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(678,'Santander','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(679,'Jerez de la Frontera','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(680,'Pamplona [Iruña]','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(681,'Donostia-San Sebastián','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(682,'Cartagena','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(683,'Leganés','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(684,'Fuenlabrada','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(685,'Almería','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(686,'Terrassa','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(687,'Alcalá de Henares','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(688,'Burgos','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(689,'Salamanca','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(690,'Albacete','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(691,'Getafe','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(692,'Cádiz','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(693,'Alcorcón','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(694,'Huelva','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(695,'León','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(696,'Castellón de la Plana [Castell','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(697,'Badajoz','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(698,'[San Cristóbal de] la Laguna','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(699,'Logroño','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(700,'Santa Coloma de Gramenet','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(701,'Tarragona','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(702,'Lleida (Lérida)','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(703,'Jaén','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(704,'Ourense (Orense)','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(705,'Mataró','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(706,'Algeciras','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(707,'Marbella','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(708,'Barakaldo','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(709,'Dos Hermanas','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(710,'Santiago de Compostela','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(711,'Torrejón de Ardoz','ESP',63,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(712,'Cape Town','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(713,'Soweto','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(714,'Johannesburg','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(715,'Port Elizabeth','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(716,'Pretoria','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(717,'Inanda','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(718,'Durban','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(719,'Vanderbijlpark','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(720,'Kempton Park','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(721,'Alberton','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(722,'Pinetown','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(723,'Pietermaritzburg','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(724,'Benoni','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(725,'Randburg','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(726,'Umlazi','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(727,'Bloemfontein','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(728,'Vereeniging','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(729,'Wonderboom','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(730,'Roodepoort','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(731,'Boksburg','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(732,'Klerksdorp','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(733,'Soshanguve','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(734,'Newcastle','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(735,'East London','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(736,'Welkom','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(737,'Kimberley','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(738,'Uitenhage','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(739,'Chatsworth','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(740,'Mdantsane','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(741,'Krugersdorp','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(742,'Botshabelo','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(743,'Brakpan','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(744,'Witbank','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(745,'Oberholzer','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(746,'Germiston','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(747,'Springs','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(748,'Westonaria','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(749,'Randfontein','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(750,'Paarl','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(751,'Potchefstroom','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(752,'Rustenburg','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(753,'Nigel','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(754,'George','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(755,'Ladysmith','ZAF',220,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(756,'Addis Abeba','ETH',65,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(757,'Dire Dawa','ETH',65,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(758,'Nazret','ETH',65,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(759,'Gonder','ETH',65,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(760,'Dese','ETH',65,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(761,'Mekele','ETH',65,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(762,'Bahir Dar','ETH',65,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(763,'Stanley','FLK',68,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(764,'Suva','FJI',67,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(765,'Quezon','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(766,'Manila','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(767,'Kalookan','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(768,'Davao','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(769,'Cebu','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(770,'Zamboanga','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(771,'Pasig','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(772,'Valenzuela','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(773,'Las Piñas','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(774,'Antipolo','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(775,'Taguig','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(776,'Cagayan de Oro','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(777,'Parañaque','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(778,'Makati','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(779,'Bacolod','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(780,'General Santos','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(781,'Marikina','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(782,'Dasmariñas','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(783,'Muntinlupa','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(784,'Iloilo','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(785,'Pasay','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(786,'Malabon','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(787,'San José del Monte','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(788,'Bacoor','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(789,'Iligan','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(790,'Calamba','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(791,'Mandaluyong','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(792,'Butuan','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(793,'Angeles','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(794,'Tarlac','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(795,'Mandaue','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(796,'Baguio','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(797,'Batangas','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(798,'Cainta','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(799,'San Pedro','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(800,'Navotas','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(801,'Cabanatuan','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(802,'San Fernando','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(803,'Lipa','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(804,'Lapu-Lapu','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(805,'San Pablo','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(806,'Biñan','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(807,'Taytay','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(808,'Lucena','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(809,'Imus','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(810,'Olongapo','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(811,'Binangonan','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(812,'Santa Rosa','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(813,'Tagum','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(814,'Tacloban','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(815,'Malolos','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(816,'Mabalacat','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(817,'Cotabato','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(818,'Meycauayan','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(819,'Puerto Princesa','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(820,'Legazpi','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(821,'Silang','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(822,'Ormoc','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(823,'San Carlos','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(824,'Kabankalan','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(825,'Talisay','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(826,'Valencia','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(827,'Calbayog','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(828,'Santa Maria','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(829,'Pagadian','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(830,'Cadiz','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(831,'Bago','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(832,'Toledo','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(833,'Naga','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(834,'San Mateo','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(835,'Panabo','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(836,'Koronadal','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(837,'Marawi','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(838,'Dagupan','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(839,'Sagay','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(840,'Roxas','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(841,'Lubao','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(842,'Digos','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(843,'San Miguel','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(844,'Malaybalay','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(845,'Tuguegarao','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(846,'Ilagan','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(847,'Baliuag','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(848,'Surigao','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(849,'San Carlos','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(850,'San Juan del Monte','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(851,'Tanauan','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(852,'Concepcion','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(853,'Rodriguez (Montalban)','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(854,'Sariaya','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(855,'Malasiqui','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(856,'General Mariano Alvarez','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(857,'Urdaneta','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(858,'Hagonoy','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(859,'San Jose','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(860,'Polomolok','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(861,'Santiago','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(862,'Tanza','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(863,'Ozamis','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(864,'Mexico','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(865,'San Jose','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(866,'Silay','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(867,'General Trias','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(868,'Tabaco','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(869,'Cabuyao','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(870,'Calapan','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(871,'Mati','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(872,'Midsayap','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(873,'Cauayan','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(874,'Gingoog','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(875,'Dumaguete','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(876,'San Fernando','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(877,'Arayat','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(878,'Bayawan (Tulong)','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(879,'Kidapawan','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(880,'Daraga (Locsin)','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(881,'Marilao','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(882,'Malita','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(883,'Dipolog','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(884,'Cavite','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(885,'Danao','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(886,'Bislig','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(887,'Talavera','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(888,'Guagua','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(889,'Bayambang','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(890,'Nasugbu','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(891,'Baybay','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(892,'Capas','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(893,'Sultan Kudarat','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(894,'Laoag','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(895,'Bayugan','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(896,'Malungon','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(897,'Santa Cruz','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(898,'Sorsogon','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(899,'Candelaria','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(900,'Ligao','PHL',163,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(901,'Tórshavn','FRO',70,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(902,'Libreville','GAB',72,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(903,'Serekunda','GMB',79,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(904,'Banjul','GMB',79,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(905,'Tbilisi','GEO',74,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(906,'Kutaisi','GEO',74,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(907,'Rustavi','GEO',74,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(908,'Batumi','GEO',74,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(909,'Sohumi','GEO',74,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(910,'Accra','GHA',75,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(911,'Kumasi','GHA',75,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(912,'Tamale','GHA',75,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(913,'Tema','GHA',75,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(914,'Sekondi-Takoradi','GHA',75,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(915,'Gibraltar','GIB',76,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(916,'Saint George´s','GRD',83,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(917,'Nuuk','GRL',84,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(918,'Les Abymes','GLP',78,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(919,'Basse-Terre','GLP',78,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(920,'Tamuning','GUM',87,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(921,'Agaña','GUM',87,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(922,'Ciudad de Guatemala','GTM',85,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(923,'Mixco','GTM',85,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(924,'Villa Nueva','GTM',85,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(925,'Quetzaltenango','GTM',85,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(926,'Conakry','GIN',77,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(927,'Bissau','GNB',80,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(928,'Georgetown','GUY',88,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(929,'Port-au-Prince','HTI',92,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(930,'Carrefour','HTI',92,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(931,'Delmas','HTI',92,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(932,'Le-Cap-Haïtien','HTI',92,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(933,'Tegucigalpa','HND',90,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(934,'San Pedro Sula','HND',90,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(935,'La Ceiba','HND',90,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(936,'Kowloon and New Kowloon','HKG',89,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(937,'Victoria','HKG',89,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(938,'Longyearbyen','SJM',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(939,'Jakarta','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(940,'Surabaya','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(941,'Bandung','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(942,'Medan','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(943,'Palembang','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(944,'Tangerang','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(945,'Semarang','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(946,'Ujung Pandang','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(947,'Malang','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(948,'Bandar Lampung','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(949,'Bekasi','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(950,'Padang','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(951,'Surakarta','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(952,'Banjarmasin','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(953,'Pekan Baru','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(954,'Denpasar','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(955,'Yogyakarta','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(956,'Pontianak','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(957,'Samarinda','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(958,'Jambi','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(959,'Depok','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(960,'Cimahi','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(961,'Balikpapan','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(962,'Manado','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(963,'Mataram','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(964,'Pekalongan','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(965,'Tegal','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(966,'Bogor','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(967,'Ciputat','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(968,'Pondokgede','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(969,'Cirebon','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(970,'Kediri','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(971,'Ambon','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(972,'Jember','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(973,'Cilacap','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(974,'Cimanggis','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(975,'Pematang Siantar','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(976,'Purwokerto','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(977,'Ciomas','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(978,'Tasikmalaya','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(979,'Madiun','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(980,'Bengkulu','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(981,'Karawang','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(982,'Banda Aceh','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(983,'Palu','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(984,'Pasuruan','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(985,'Kupang','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(986,'Tebing Tinggi','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(987,'Percut Sei Tuan','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(988,'Binjai','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(989,'Sukabumi','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(990,'Waru','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(991,'Pangkal Pinang','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(992,'Magelang','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(993,'Blitar','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(994,'Serang','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(995,'Probolinggo','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(996,'Cilegon','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(997,'Cianjur','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(998,'Ciparay','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(999,'Lhokseumawe','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1000,'Taman','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1001,'Depok','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1002,'Citeureup','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1003,'Pemalang','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1004,'Klaten','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1005,'Salatiga','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1006,'Cibinong','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1007,'Palangka Raya','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1008,'Mojokerto','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1009,'Purwakarta','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1010,'Garut','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1011,'Kudus','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1012,'Kendari','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1013,'Jaya Pura','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1014,'Gorontalo','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1015,'Majalaya','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1016,'Pondok Aren','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1017,'Jombang','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1018,'Sunggal','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1019,'Batam','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1020,'Padang Sidempuan','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1021,'Sawangan','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1022,'Banyuwangi','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1023,'Tanjung Pinang','IDN',94,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1024,'Mumbai (Bombay)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1025,'Delhi','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1026,'Calcutta [Kolkata]','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1027,'Chennai (Madras)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1028,'Hyderabad','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1029,'Ahmedabad','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1030,'Bangalore','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1031,'Kanpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1032,'Nagpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1033,'Lucknow','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1034,'Pune','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1035,'Surat','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1036,'Jaipur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1037,'Indore','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1038,'Bhopal','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1039,'Ludhiana','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1040,'Vadodara (Baroda)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1041,'Kalyan','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1042,'Madurai','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1043,'Haora (Howrah)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1044,'Varanasi (Benares)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1045,'Patna','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1046,'Srinagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1047,'Agra','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1048,'Coimbatore','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1049,'Thane (Thana)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1050,'Allahabad','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1051,'Meerut','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1052,'Vishakhapatnam','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1053,'Jabalpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1054,'Amritsar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1055,'Faridabad','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1056,'Vijayawada','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1057,'Gwalior','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1058,'Jodhpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1059,'Nashik (Nasik)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1060,'Hubli-Dharwad','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1061,'Solapur (Sholapur)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1062,'Ranchi','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1063,'Bareilly','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1064,'Guwahati (Gauhati)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1065,'Shambajinagar (Aurangabad)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1066,'Cochin (Kochi)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1067,'Rajkot','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1068,'Kota','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1069,'Thiruvananthapuram (Trivandrum','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1070,'Pimpri-Chinchwad','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1071,'Jalandhar (Jullundur)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1072,'Gorakhpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1073,'Chandigarh','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1074,'Mysore','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1075,'Aligarh','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1076,'Guntur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1077,'Jamshedpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1078,'Ghaziabad','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1079,'Warangal','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1080,'Raipur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1081,'Moradabad','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1082,'Durgapur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1083,'Amravati','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1084,'Calicut (Kozhikode)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1085,'Bikaner','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1086,'Bhubaneswar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1087,'Kolhapur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1088,'Kataka (Cuttack)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1089,'Ajmer','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1090,'Bhavnagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1091,'Tiruchirapalli','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1092,'Bhilai','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1093,'Bhiwandi','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1094,'Saharanpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1095,'Ulhasnagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1096,'Salem','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1097,'Ujjain','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1098,'Malegaon','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1099,'Jamnagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1100,'Bokaro Steel City','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1101,'Akola','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1102,'Belgaum','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1103,'Rajahmundry','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1104,'Nellore','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1105,'Udaipur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1106,'New Bombay','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1107,'Bhatpara','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1108,'Gulbarga','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1109,'New Delhi','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1110,'Jhansi','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1111,'Gaya','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1112,'Kakinada','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1113,'Dhule (Dhulia)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1114,'Panihati','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1115,'Nanded (Nander)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1116,'Mangalore','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1117,'Dehra Dun','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1118,'Kamarhati','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1119,'Davangere','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1120,'Asansol','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1121,'Bhagalpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1122,'Bellary','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1123,'Barddhaman (Burdwan)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1124,'Rampur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1125,'Jalgaon','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1126,'Muzaffarpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1127,'Nizamabad','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1128,'Muzaffarnagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1129,'Patiala','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1130,'Shahjahanpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1131,'Kurnool','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1132,'Tiruppur (Tirupper)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1133,'Rohtak','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1134,'South Dum Dum','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1135,'Mathura','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1136,'Chandrapur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1137,'Barahanagar (Baranagar)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1138,'Darbhanga','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1139,'Siliguri (Shiliguri)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1140,'Raurkela','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1141,'Ambattur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1142,'Panipat','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1143,'Firozabad','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1144,'Ichalkaranji','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1145,'Jammu','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1146,'Ramagundam','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1147,'Eluru','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1148,'Brahmapur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1149,'Alwar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1150,'Pondicherry','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1151,'Thanjavur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1152,'Bihar Sharif','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1153,'Tuticorin','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1154,'Imphal','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1155,'Latur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1156,'Sagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1157,'Farrukhabad-cum-Fatehgarh','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1158,'Sangli','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1159,'Parbhani','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1160,'Nagar Coil','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1161,'Bijapur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1162,'Kukatpalle','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1163,'Bally','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1164,'Bhilwara','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1165,'Ratlam','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1166,'Avadi','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1167,'Dindigul','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1168,'Ahmadnagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1169,'Bilaspur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1170,'Shimoga','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1171,'Kharagpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1172,'Mira Bhayandar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1173,'Vellore','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1174,'Jalna','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1175,'Burnpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1176,'Anantapur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1177,'Allappuzha (Alleppey)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1178,'Tirupati','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1179,'Karnal','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1180,'Burhanpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1181,'Hisar (Hissar)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1182,'Tiruvottiyur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1183,'Mirzapur-cum-Vindhyachal','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1184,'Secunderabad','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1185,'Nadiad','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1186,'Dewas','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1187,'Murwara (Katni)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1188,'Ganganagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1189,'Vizianagaram','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1190,'Erode','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1191,'Machilipatnam (Masulipatam)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1192,'Bhatinda (Bathinda)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1193,'Raichur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1194,'Agartala','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1195,'Arrah (Ara)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1196,'Satna','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1197,'Lalbahadur Nagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1198,'Aizawl','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1199,'Uluberia','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1200,'Katihar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1201,'Cuddalore','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1202,'Hugli-Chinsurah','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1203,'Dhanbad','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1204,'Raiganj','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1205,'Sambhal','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1206,'Durg','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1207,'Munger (Monghyr)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1208,'Kanchipuram','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1209,'North Dum Dum','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1210,'Karimnagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1211,'Bharatpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1212,'Sikar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1213,'Hardwar (Haridwar)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1214,'Dabgram','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1215,'Morena','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1216,'Noida','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1217,'Hapur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1218,'Bhusawal','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1219,'Khandwa','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1220,'Yamuna Nagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1221,'Sonipat (Sonepat)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1222,'Tenali','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1223,'Raurkela Civil Township','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1224,'Kollam (Quilon)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1225,'Kumbakonam','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1226,'Ingraj Bazar (English Bazar)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1227,'Timkur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1228,'Amroha','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1229,'Serampore','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1230,'Chapra','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1231,'Pali','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1232,'Maunath Bhanjan','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1233,'Adoni','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1234,'Jaunpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1235,'Tirunelveli','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1236,'Bahraich','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1237,'Gadag Betigeri','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1238,'Proddatur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1239,'Chittoor','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1240,'Barrackpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1241,'Bharuch (Broach)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1242,'Naihati','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1243,'Shillong','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1244,'Sambalpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1245,'Junagadh','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1246,'Rae Bareli','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1247,'Rewa','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1248,'Gurgaon','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1249,'Khammam','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1250,'Bulandshahr','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1251,'Navsari','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1252,'Malkajgiri','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1253,'Midnapore (Medinipur)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1254,'Miraj','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1255,'Raj Nandgaon','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1256,'Alandur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1257,'Puri','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1258,'Navadwip','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1259,'Sirsa','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1260,'Korba','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1261,'Faizabad','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1262,'Etawah','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1263,'Pathankot','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1264,'Gandhinagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1265,'Palghat (Palakkad)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1266,'Veraval','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1267,'Hoshiarpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1268,'Ambala','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1269,'Sitapur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1270,'Bhiwani','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1271,'Cuddapah','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1272,'Bhimavaram','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1273,'Krishnanagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1274,'Chandannagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1275,'Mandya','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1276,'Dibrugarh','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1277,'Nandyal','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1278,'Balurghat','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1279,'Neyveli','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1280,'Fatehpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1281,'Mahbubnagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1282,'Budaun','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1283,'Porbandar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1284,'Silchar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1285,'Berhampore (Baharampur)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1286,'Purnea (Purnia)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1287,'Bankura','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1288,'Rajapalaiyam','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1289,'Titagarh','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1290,'Halisahar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1291,'Hathras','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1292,'Bhir (Bid)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1293,'Pallavaram','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1294,'Anand','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1295,'Mango','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1296,'Santipur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1297,'Bhind','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1298,'Gondiya','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1299,'Tiruvannamalai','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1300,'Yeotmal (Yavatmal)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1301,'Kulti-Barakar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1302,'Moga','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1303,'Shivapuri','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1304,'Bidar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1305,'Guntakal','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1306,'Unnao','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1307,'Barasat','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1308,'Tambaram','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1309,'Abohar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1310,'Pilibhit','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1311,'Valparai','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1312,'Gonda','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1313,'Surendranagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1314,'Qutubullapur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1315,'Beawar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1316,'Hindupur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1317,'Gandhidham','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1318,'Haldwani-cum-Kathgodam','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1319,'Tellicherry (Thalassery)','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1320,'Wardha','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1321,'Rishra','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1322,'Bhuj','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1323,'Modinagar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1324,'Gudivada','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1325,'Basirhat','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1326,'Uttarpara-Kotrung','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1327,'Ongole','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1328,'North Barrackpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1329,'Guna','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1330,'Haldia','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1331,'Habra','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1332,'Kanchrapara','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1333,'Tonk','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1334,'Champdani','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1335,'Orai','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1336,'Pudukkottai','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1337,'Sasaram','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1338,'Hazaribag','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1339,'Palayankottai','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1340,'Banda','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1341,'Godhra','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1342,'Hospet','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1343,'Ashoknagar-Kalyangarh','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1344,'Achalpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1345,'Patan','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1346,'Mandasor','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1347,'Damoh','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1348,'Satara','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1349,'Meerut Cantonment','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1350,'Dehri','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1351,'Delhi Cantonment','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1352,'Chhindwara','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1353,'Bansberia','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1354,'Nagaon','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1355,'Kanpur Cantonment','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1356,'Vidisha','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1357,'Bettiah','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1358,'Purulia','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1359,'Hassan','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1360,'Ambala Sadar','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1361,'Baidyabati','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1362,'Morvi','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1363,'Raigarh','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1364,'Vejalpur','IND',95,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1365,'Baghdad','IRQ',99,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1366,'Mosul','IRQ',99,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1367,'Irbil','IRQ',99,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1368,'Kirkuk','IRQ',99,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1369,'Basra','IRQ',99,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1370,'al-Sulaymaniya','IRQ',99,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1371,'al-Najaf','IRQ',99,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1372,'Karbala','IRQ',99,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1373,'al-Hilla','IRQ',99,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1374,'al-Nasiriya','IRQ',99,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1375,'al-Amara','IRQ',99,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1376,'al-Diwaniya','IRQ',99,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1377,'al-Ramadi','IRQ',99,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1378,'al-Kut','IRQ',99,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1379,'Baquba','IRQ',99,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1380,'Teheran','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1381,'Mashhad','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1382,'Esfahan','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1383,'Tabriz','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1384,'Shiraz','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1385,'Karaj','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1386,'Ahvaz','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1387,'Qom','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1388,'Kermanshah','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1389,'Urmia','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1390,'Zahedan','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1391,'Rasht','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1392,'Hamadan','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1393,'Kerman','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1394,'Arak','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1395,'Ardebil','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1396,'Yazd','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1397,'Qazvin','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1398,'Zanjan','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1399,'Sanandaj','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1400,'Bandar-e-Abbas','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1401,'Khorramabad','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1402,'Eslamshahr','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1403,'Borujerd','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1404,'Abadan','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1405,'Dezful','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1406,'Kashan','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1407,'Sari','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1408,'Gorgan','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1409,'Najafabad','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1410,'Sabzevar','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1411,'Khomeynishahr','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1412,'Amol','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1413,'Neyshabur','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1414,'Babol','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1415,'Khoy','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1416,'Malayer','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1417,'Bushehr','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1418,'Qaemshahr','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1419,'Qarchak','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1420,'Qods','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1421,'Sirjan','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1422,'Bojnurd','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1423,'Maragheh','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1424,'Birjand','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1425,'Ilam','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1426,'Bukan','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1427,'Masjed-e-Soleyman','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1428,'Saqqez','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1429,'Gonbad-e Qabus','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1430,'Saveh','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1431,'Mahabad','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1432,'Varamin','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1433,'Andimeshk','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1434,'Khorramshahr','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1435,'Shahrud','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1436,'Marv Dasht','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1437,'Zabol','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1438,'Shahr-e Kord','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1439,'Bandar-e Anzali','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1440,'Rafsanjan','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1441,'Marand','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1442,'Torbat-e Heydariyeh','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1443,'Jahrom','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1444,'Semnan','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1445,'Miandoab','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1446,'Qomsheh','IRN',98,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1447,'Dublin','IRL',97,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1448,'Cork','IRL',97,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1449,'Reykjavík','ISL',100,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1450,'Jerusalem','ISR',101,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1451,'Tel Aviv-Jaffa','ISR',101,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1452,'Haifa','ISR',101,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1453,'Rishon Le Ziyyon','ISR',101,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1454,'Beerseba','ISR',101,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1455,'Holon','ISR',101,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1456,'Petah Tiqwa','ISR',101,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1457,'Ashdod','ISR',101,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1458,'Netanya','ISR',101,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1459,'Bat Yam','ISR',101,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1460,'Bene Beraq','ISR',101,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1461,'Ramat Gan','ISR',101,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1462,'Ashqelon','ISR',101,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1463,'Rehovot','ISR',101,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1464,'Roma','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1465,'Milano','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1466,'Napoli','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1467,'Torino','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1468,'Palermo','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1469,'Genova','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1470,'Bologna','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1471,'Firenze','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1472,'Catania','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1473,'Bari','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1474,'Venezia','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1475,'Messina','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1476,'Verona','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1477,'Trieste','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1478,'Padova','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1479,'Taranto','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1480,'Brescia','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1481,'Reggio di Calabria','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1482,'Modena','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1483,'Prato','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1484,'Parma','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1485,'Cagliari','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1486,'Livorno','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1487,'Perugia','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1488,'Foggia','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1489,'Reggio nell´ Emilia','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1490,'Salerno','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1491,'Ravenna','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1492,'Ferrara','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1493,'Rimini','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1494,'Syrakusa','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1495,'Sassari','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1496,'Monza','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1497,'Bergamo','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1498,'Pescara','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1499,'Latina','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1500,'Vicenza','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1501,'Terni','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1502,'Forlì','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1503,'Trento','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1504,'Novara','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1505,'Piacenza','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1506,'Ancona','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1507,'Lecce','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1508,'Bolzano','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1509,'Catanzaro','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1510,'La Spezia','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1511,'Udine','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1512,'Torre del Greco','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1513,'Andria','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1514,'Brindisi','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1515,'Giugliano in Campania','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1516,'Pisa','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1517,'Barletta','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1518,'Arezzo','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1519,'Alessandria','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1520,'Cesena','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1521,'Pesaro','ITA',102,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1522,'Dili','TMP',199,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1523,'Wien','AUT',15,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1524,'Graz','AUT',15,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1525,'Linz','AUT',15,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1526,'Salzburg','AUT',15,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1527,'Innsbruck','AUT',15,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1528,'Klagenfurt','AUT',15,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1529,'Spanish Town','JAM',103,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1530,'Kingston','JAM',103,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1531,'Portmore','JAM',103,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1532,'Tokyo','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1533,'Jokohama [Yokohama]','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1534,'Osaka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1535,'Nagoya','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1536,'Sapporo','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1537,'Kioto','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1538,'Kobe','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1539,'Fukuoka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1540,'Kawasaki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1541,'Hiroshima','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1542,'Kitakyushu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1543,'Sendai','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1544,'Chiba','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1545,'Sakai','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1546,'Kumamoto','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1547,'Okayama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1548,'Sagamihara','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1549,'Hamamatsu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1550,'Kagoshima','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1551,'Funabashi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1552,'Higashiosaka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1553,'Hachioji','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1554,'Niigata','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1555,'Amagasaki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1556,'Himeji','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1557,'Shizuoka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1558,'Urawa','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1559,'Matsuyama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1560,'Matsudo','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1561,'Kanazawa','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1562,'Kawaguchi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1563,'Ichikawa','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1564,'Omiya','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1565,'Utsunomiya','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1566,'Oita','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1567,'Nagasaki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1568,'Yokosuka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1569,'Kurashiki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1570,'Gifu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1571,'Hirakata','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1572,'Nishinomiya','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1573,'Toyonaka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1574,'Wakayama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1575,'Fukuyama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1576,'Fujisawa','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1577,'Asahikawa','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1578,'Machida','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1579,'Nara','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1580,'Takatsuki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1581,'Iwaki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1582,'Nagano','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1583,'Toyohashi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1584,'Toyota','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1585,'Suita','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1586,'Takamatsu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1587,'Koriyama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1588,'Okazaki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1589,'Kawagoe','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1590,'Tokorozawa','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1591,'Toyama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1592,'Kochi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1593,'Kashiwa','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1594,'Akita','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1595,'Miyazaki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1596,'Koshigaya','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1597,'Naha','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1598,'Aomori','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1599,'Hakodate','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1600,'Akashi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1601,'Yokkaichi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1602,'Fukushima','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1603,'Morioka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1604,'Maebashi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1605,'Kasugai','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1606,'Otsu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1607,'Ichihara','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1608,'Yao','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1609,'Ichinomiya','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1610,'Tokushima','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1611,'Kakogawa','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1612,'Ibaraki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1613,'Neyagawa','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1614,'Shimonoseki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1615,'Yamagata','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1616,'Fukui','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1617,'Hiratsuka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1618,'Mito','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1619,'Sasebo','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1620,'Hachinohe','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1621,'Takasaki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1622,'Shimizu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1623,'Kurume','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1624,'Fuji','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1625,'Soka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1626,'Fuchu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1627,'Chigasaki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1628,'Atsugi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1629,'Numazu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1630,'Ageo','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1631,'Yamato','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1632,'Matsumoto','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1633,'Kure','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1634,'Takarazuka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1635,'Kasukabe','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1636,'Chofu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1637,'Odawara','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1638,'Kofu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1639,'Kushiro','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1640,'Kishiwada','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1641,'Hitachi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1642,'Nagaoka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1643,'Itami','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1644,'Uji','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1645,'Suzuka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1646,'Hirosaki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1647,'Ube','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1648,'Kodaira','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1649,'Takaoka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1650,'Obihiro','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1651,'Tomakomai','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1652,'Saga','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1653,'Sakura','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1654,'Kamakura','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1655,'Mitaka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1656,'Izumi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1657,'Hino','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1658,'Hadano','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1659,'Ashikaga','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1660,'Tsu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1661,'Sayama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1662,'Yachiyo','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1663,'Tsukuba','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1664,'Tachikawa','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1665,'Kumagaya','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1666,'Moriguchi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1667,'Otaru','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1668,'Anjo','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1669,'Narashino','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1670,'Oyama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1671,'Ogaki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1672,'Matsue','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1673,'Kawanishi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1674,'Hitachinaka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1675,'Niiza','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1676,'Nagareyama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1677,'Tottori','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1678,'Tama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1679,'Iruma','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1680,'Ota','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1681,'Omuta','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1682,'Komaki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1683,'Ome','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1684,'Kadoma','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1685,'Yamaguchi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1686,'Higashimurayama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1687,'Yonago','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1688,'Matsubara','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1689,'Musashino','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1690,'Tsuchiura','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1691,'Joetsu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1692,'Miyakonojo','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1693,'Misato','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1694,'Kakamigahara','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1695,'Daito','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1696,'Seto','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1697,'Kariya','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1698,'Urayasu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1699,'Beppu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1700,'Niihama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1701,'Minoo','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1702,'Fujieda','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1703,'Abiko','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1704,'Nobeoka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1705,'Tondabayashi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1706,'Ueda','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1707,'Kashihara','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1708,'Matsusaka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1709,'Isesaki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1710,'Zama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1711,'Kisarazu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1712,'Noda','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1713,'Ishinomaki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1714,'Fujinomiya','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1715,'Kawachinagano','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1716,'Imabari','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1717,'Aizuwakamatsu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1718,'Higashihiroshima','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1719,'Habikino','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1720,'Ebetsu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1721,'Hofu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1722,'Kiryu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1723,'Okinawa','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1724,'Yaizu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1725,'Toyokawa','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1726,'Ebina','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1727,'Asaka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1728,'Higashikurume','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1729,'Ikoma','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1730,'Kitami','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1731,'Koganei','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1732,'Iwatsuki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1733,'Mishima','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1734,'Handa','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1735,'Muroran','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1736,'Komatsu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1737,'Yatsushiro','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1738,'Iida','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1739,'Tokuyama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1740,'Kokubunji','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1741,'Akishima','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1742,'Iwakuni','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1743,'Kusatsu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1744,'Kuwana','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1745,'Sanda','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1746,'Hikone','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1747,'Toda','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1748,'Tajimi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1749,'Ikeda','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1750,'Fukaya','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1751,'Ise','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1752,'Sakata','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1753,'Kasuga','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1754,'Kamagaya','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1755,'Tsuruoka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1756,'Hoya','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1757,'Nishio','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1758,'Tokai','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1759,'Inazawa','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1760,'Sakado','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1761,'Isehara','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1762,'Takasago','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1763,'Fujimi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1764,'Urasoe','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1765,'Yonezawa','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1766,'Konan','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1767,'Yamatokoriyama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1768,'Maizuru','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1769,'Onomichi','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1770,'Higashimatsuyama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1771,'Kimitsu','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1772,'Isahaya','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1773,'Kanuma','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1774,'Izumisano','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1775,'Kameoka','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1776,'Mobara','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1777,'Narita','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1778,'Kashiwazaki','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1779,'Tsuyama','JPN',105,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1780,'Sanaa','YEM',219,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1781,'Aden','YEM',219,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1782,'Taizz','YEM',219,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1783,'Hodeida','YEM',219,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1784,'al-Mukalla','YEM',219,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1785,'Ibb','YEM',219,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1786,'Amman','JOR',104,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1787,'al-Zarqa','JOR',104,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1788,'Irbid','JOR',104,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1789,'al-Rusayfa','JOR',104,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1790,'Wadi al-Sir','JOR',104,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1791,'Flying Fish Cove','CXR',50,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1792,'Beograd','YUG',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1793,'Novi Sad','YUG',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1794,'Niš','YUG',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1795,'Priština','YUG',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1796,'Kragujevac','YUG',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1797,'Podgorica','YUG',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1798,'Subotica','YUG',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1799,'Prizren','YUG',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1800,'Phnom Penh','KHM',109,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1801,'Battambang','KHM',109,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1802,'Siem Reap','KHM',109,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1803,'Douala','CMR',42,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1804,'Yaounde','CMR',42,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1805,'Garoua','CMR',42,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1806,'Maroua','CMR',42,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1807,'Bamenda','CMR',42,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1808,'Bafoussam','CMR',42,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1809,'Nkongsamba','CMR',42,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1810,'Montréal','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1811,'Calgary','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1812,'Toronto','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1813,'North York','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1814,'Winnipeg','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1815,'Edmonton','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1816,'Mississauga','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1817,'Scarborough','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1818,'Vancouver','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1819,'Etobicoke','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1820,'London','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1821,'Hamilton','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1822,'Ottawa','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1823,'Laval','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1824,'Surrey','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1825,'Brampton','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1826,'Windsor','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1827,'Saskatoon','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1828,'Kitchener','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1829,'Markham','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1830,'Regina','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1831,'Burnaby','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1832,'Québec','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1833,'York','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1834,'Richmond','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1835,'Vaughan','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1836,'Burlington','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1837,'Oshawa','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1838,'Oakville','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1839,'Saint Catharines','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1840,'Longueuil','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1841,'Richmond Hill','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1842,'Thunder Bay','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1843,'Nepean','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1844,'Cape Breton','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1845,'East York','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1846,'Halifax','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1847,'Cambridge','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1848,'Gloucester','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1849,'Abbotsford','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1850,'Guelph','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1851,'Saint John´s','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1852,'Coquitlam','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1853,'Saanich','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1854,'Gatineau','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1855,'Delta','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1856,'Sudbury','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1857,'Kelowna','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1858,'Barrie','CAN',36,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1859,'Praia','CPV',47,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1860,'Almaty','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1861,'Qaraghandy','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1862,'Shymkent','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1863,'Taraz','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1864,'Astana','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1865,'Öskemen','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1866,'Pavlodar','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1867,'Semey','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1868,'Aqtöbe','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1869,'Qostanay','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1870,'Petropavl','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1871,'Oral','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1872,'Temirtau','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1873,'Qyzylorda','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1874,'Aqtau','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1875,'Atyrau','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1876,'Ekibastuz','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1877,'Kökshetau','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1878,'Rudnyy','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1879,'Taldyqorghan','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1880,'Zhezqazghan','KAZ',106,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1881,'Nairobi','KEN',107,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1882,'Mombasa','KEN',107,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1883,'Kisumu','KEN',107,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1884,'Nakuru','KEN',107,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1885,'Machakos','KEN',107,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1886,'Eldoret','KEN',107,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1887,'Meru','KEN',107,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1888,'Nyeri','KEN',107,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1889,'Bangui','CAF',35,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1890,'Shanghai','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1891,'Peking','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1892,'Chongqing','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1893,'Tianjin','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1894,'Wuhan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1895,'Harbin','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1896,'Shenyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1897,'Kanton [Guangzhou]','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1898,'Chengdu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1899,'Nanking [Nanjing]','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1900,'Changchun','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1901,'Xi´an','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1902,'Dalian','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1903,'Qingdao','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1904,'Jinan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1905,'Hangzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1906,'Zhengzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1907,'Shijiazhuang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1908,'Taiyuan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1909,'Kunming','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1910,'Changsha','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1911,'Nanchang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1912,'Fuzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1913,'Lanzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1914,'Guiyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1915,'Ningbo','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1916,'Hefei','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1917,'Urumtši [Ürümqi]','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1918,'Anshan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1919,'Fushun','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1920,'Nanning','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1921,'Zibo','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1922,'Qiqihar','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1923,'Jilin','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1924,'Tangshan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1925,'Baotou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1926,'Shenzhen','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1927,'Hohhot','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1928,'Handan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1929,'Wuxi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1930,'Xuzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1931,'Datong','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1932,'Yichun','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1933,'Benxi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1934,'Luoyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1935,'Suzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1936,'Xining','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1937,'Huainan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1938,'Jixi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1939,'Daqing','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1940,'Fuxin','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1941,'Amoy [Xiamen]','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1942,'Liuzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1943,'Shantou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1944,'Jinzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1945,'Mudanjiang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1946,'Yinchuan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1947,'Changzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1948,'Zhangjiakou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1949,'Dandong','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1950,'Hegang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1951,'Kaifeng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1952,'Jiamusi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1953,'Liaoyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1954,'Hengyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1955,'Baoding','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1956,'Hunjiang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1957,'Xinxiang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1958,'Huangshi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1959,'Haikou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1960,'Yantai','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1961,'Bengbu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1962,'Xiangtan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1963,'Weifang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1964,'Wuhu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1965,'Pingxiang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1966,'Yingkou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1967,'Anyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1968,'Panzhihua','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1969,'Pingdingshan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1970,'Xiangfan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1971,'Zhuzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1972,'Jiaozuo','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1973,'Wenzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1974,'Zhangjiang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1975,'Zigong','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1976,'Shuangyashan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1977,'Zaozhuang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1978,'Yakeshi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1979,'Yichang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1980,'Zhenjiang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1981,'Huaibei','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1982,'Qinhuangdao','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1983,'Guilin','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1984,'Liupanshui','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1985,'Panjin','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1986,'Yangquan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1987,'Jinxi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1988,'Liaoyuan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1989,'Lianyungang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1990,'Xianyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1991,'Tai´an','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1992,'Chifeng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1993,'Shaoguan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1994,'Nantong','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1995,'Leshan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1996,'Baoji','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1997,'Linyi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1998,'Tonghua','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(1999,'Siping','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2000,'Changzhi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2001,'Tengzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2002,'Chaozhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2003,'Yangzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2004,'Dongwan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2005,'Ma´anshan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2006,'Foshan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2007,'Yueyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2008,'Xingtai','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2009,'Changde','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2010,'Shihezi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2011,'Yancheng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2012,'Jiujiang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2013,'Dongying','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2014,'Shashi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2015,'Xintai','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2016,'Jingdezhen','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2017,'Tongchuan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2018,'Zhongshan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2019,'Shiyan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2020,'Tieli','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2021,'Jining','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2022,'Wuhai','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2023,'Mianyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2024,'Luzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2025,'Zunyi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2026,'Shizuishan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2027,'Neijiang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2028,'Tongliao','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2029,'Tieling','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2030,'Wafangdian','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2031,'Anqing','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2032,'Shaoyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2033,'Laiwu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2034,'Chengde','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2035,'Tianshui','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2036,'Nanyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2037,'Cangzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2038,'Yibin','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2039,'Huaiyin','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2040,'Dunhua','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2041,'Yanji','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2042,'Jiangmen','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2043,'Tongling','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2044,'Suihua','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2045,'Gongziling','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2046,'Xiantao','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2047,'Chaoyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2048,'Ganzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2049,'Huzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2050,'Baicheng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2051,'Shangzi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2052,'Yangjiang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2053,'Qitaihe','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2054,'Gejiu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2055,'Jiangyin','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2056,'Hebi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2057,'Jiaxing','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2058,'Wuzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2059,'Meihekou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2060,'Xuchang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2061,'Liaocheng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2062,'Haicheng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2063,'Qianjiang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2064,'Baiyin','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2065,'Bei´an','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2066,'Yixing','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2067,'Laizhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2068,'Qaramay','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2069,'Acheng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2070,'Dezhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2071,'Nanping','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2072,'Zhaoqing','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2073,'Beipiao','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2074,'Fengcheng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2075,'Fuyu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2076,'Xinyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2077,'Dongtai','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2078,'Yuci','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2079,'Honghu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2080,'Ezhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2081,'Heze','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2082,'Daxian','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2083,'Linfen','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2084,'Tianmen','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2085,'Yiyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2086,'Quanzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2087,'Rizhao','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2088,'Deyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2089,'Guangyuan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2090,'Changshu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2091,'Zhangzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2092,'Hailar','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2093,'Nanchong','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2094,'Jiutai','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2095,'Zhaodong','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2096,'Shaoxing','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2097,'Fuyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2098,'Maoming','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2099,'Qujing','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2100,'Ghulja','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2101,'Jiaohe','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2102,'Puyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2103,'Huadian','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2104,'Jiangyou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2105,'Qashqar','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2106,'Anshun','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2107,'Fuling','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2108,'Xinyu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2109,'Hanzhong','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2110,'Danyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2111,'Chenzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2112,'Xiaogan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2113,'Shangqiu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2114,'Zhuhai','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2115,'Qingyuan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2116,'Aqsu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2117,'Jining','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2118,'Xiaoshan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2119,'Zaoyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2120,'Xinghua','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2121,'Hami','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2122,'Huizhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2123,'Jinmen','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2124,'Sanming','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2125,'Ulanhot','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2126,'Korla','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2127,'Wanxian','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2128,'Rui´an','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2129,'Zhoushan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2130,'Liangcheng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2131,'Jiaozhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2132,'Taizhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2133,'Suzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2134,'Yichun','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2135,'Taonan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2136,'Pingdu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2137,'Ji´an','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2138,'Longkou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2139,'Langfang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2140,'Zhoukou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2141,'Suining','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2142,'Yulin','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2143,'Jinhua','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2144,'Liu´an','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2145,'Shuangcheng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2146,'Suizhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2147,'Ankang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2148,'Weinan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2149,'Longjing','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2150,'Da´an','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2151,'Lengshuijiang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2152,'Laiyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2153,'Xianning','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2154,'Dali','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2155,'Anda','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2156,'Jincheng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2157,'Longyan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2158,'Xichang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2159,'Wendeng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2160,'Hailun','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2161,'Binzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2162,'Linhe','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2163,'Wuwei','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2164,'Duyun','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2165,'Mishan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2166,'Shangrao','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2167,'Changji','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2168,'Meixian','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2169,'Yushu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2170,'Tiefa','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2171,'Huai´an','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2172,'Leiyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2173,'Zalantun','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2174,'Weihai','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2175,'Loudi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2176,'Qingzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2177,'Qidong','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2178,'Huaihua','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2179,'Luohe','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2180,'Chuzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2181,'Kaiyuan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2182,'Linqing','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2183,'Chaohu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2184,'Laohekou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2185,'Dujiangyan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2186,'Zhumadian','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2187,'Linchuan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2188,'Jiaonan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2189,'Sanmenxia','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2190,'Heyuan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2191,'Manzhouli','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2192,'Lhasa','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2193,'Lianyuan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2194,'Kuytun','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2195,'Puqi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2196,'Hongjiang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2197,'Qinzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2198,'Renqiu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2199,'Yuyao','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2200,'Guigang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2201,'Kaili','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2202,'Yan´an','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2203,'Beihai','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2204,'Xuangzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2205,'Quzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2206,'Yong´an','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2207,'Zixing','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2208,'Liyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2209,'Yizheng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2210,'Yumen','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2211,'Liling','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2212,'Yuncheng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2213,'Shanwei','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2214,'Cixi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2215,'Yuanjiang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2216,'Bozhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2217,'Jinchang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2218,'Fu´an','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2219,'Suqian','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2220,'Shishou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2221,'Hengshui','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2222,'Danjiangkou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2223,'Fujin','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2224,'Sanya','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2225,'Guangshui','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2226,'Huangshan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2227,'Xingcheng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2228,'Zhucheng','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2229,'Kunshan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2230,'Haining','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2231,'Pingliang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2232,'Fuqing','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2233,'Xinzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2234,'Jieyang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2235,'Zhangjiagang','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2236,'Tong Xian','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2237,'Ya´an','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2238,'Jinzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2239,'Emeishan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2240,'Enshi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2241,'Bose','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2242,'Yuzhou','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2243,'Kaiyuan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2244,'Tumen','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2245,'Putian','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2246,'Linhai','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2247,'Xilin Hot','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2248,'Shaowu','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2249,'Junan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2250,'Huaying','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2251,'Pingyi','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2252,'Huangyan','CHN',40,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2253,'Bishkek','KGZ',108,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2254,'Osh','KGZ',108,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2255,'Bikenibeu','KIR',110,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2256,'Bairiki','KIR',110,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2257,'Santafé de Bogotá','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2258,'Cali','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2259,'Medellín','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2260,'Barranquilla','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2261,'Cartagena','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2262,'Cúcuta','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2263,'Bucaramanga','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2264,'Ibagué','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2265,'Pereira','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2266,'Santa Marta','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2267,'Manizales','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2268,'Bello','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2269,'Pasto','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2270,'Neiva','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2271,'Soledad','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2272,'Armenia','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2273,'Villavicencio','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2274,'Soacha','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2275,'Valledupar','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2276,'Montería','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2277,'Itagüí','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2278,'Palmira','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2279,'Buenaventura','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2280,'Floridablanca','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2281,'Sincelejo','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2282,'Popayán','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2283,'Barrancabermeja','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2284,'Dos Quebradas','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2285,'Tuluá','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2286,'Envigado','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2287,'Cartago','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2288,'Girardot','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2289,'Buga','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2290,'Tunja','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2291,'Florencia','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2292,'Maicao','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2293,'Sogamoso','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2294,'Giron','COL',45,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2295,'Moroni','COM',46,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2296,'Brazzaville','COG',43,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2297,'Pointe-Noire','COG',43,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2298,'Kinshasa','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2299,'Lubumbashi','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2300,'Mbuji-Mayi','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2301,'Kolwezi','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2302,'Kisangani','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2303,'Kananga','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2304,'Likasi','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2305,'Bukavu','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2306,'Kikwit','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2307,'Tshikapa','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2308,'Matadi','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2309,'Mbandaka','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2310,'Mwene-Ditu','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2311,'Boma','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2312,'Uvira','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2313,'Butembo','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2314,'Goma','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2315,'Kalemie','COD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2316,'Bantam','CCK',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2317,'West Island','CCK',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2318,'Pyongyang','PRK',167,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2319,'Hamhung','PRK',167,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2320,'Chongjin','PRK',167,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2321,'Nampo','PRK',167,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2322,'Sinuiju','PRK',167,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2323,'Wonsan','PRK',167,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2324,'Phyongsong','PRK',167,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2325,'Sariwon','PRK',167,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2326,'Haeju','PRK',167,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2327,'Kanggye','PRK',167,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2328,'Kimchaek','PRK',167,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2329,'Hyesan','PRK',167,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2330,'Kaesong','PRK',167,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2331,'Seoul','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2332,'Pusan','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2333,'Inchon','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2334,'Taegu','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2335,'Taejon','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2336,'Kwangju','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2337,'Ulsan','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2338,'Songnam','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2339,'Puchon','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2340,'Suwon','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2341,'Anyang','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2342,'Chonju','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2343,'Chongju','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2344,'Koyang','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2345,'Ansan','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2346,'Pohang','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2347,'Chang-won','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2348,'Masan','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2349,'Kwangmyong','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2350,'Chonan','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2351,'Chinju','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2352,'Iksan','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2353,'Pyongtaek','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2354,'Kumi','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2355,'Uijongbu','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2356,'Kyongju','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2357,'Kunsan','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2358,'Cheju','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2359,'Kimhae','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2360,'Sunchon','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2361,'Mokpo','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2362,'Yong-in','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2363,'Wonju','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2364,'Kunpo','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2365,'Chunchon','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2366,'Namyangju','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2367,'Kangnung','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2368,'Chungju','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2369,'Andong','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2370,'Yosu','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2371,'Kyongsan','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2372,'Paju','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2373,'Yangsan','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2374,'Ichon','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2375,'Asan','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2376,'Koje','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2377,'Kimchon','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2378,'Nonsan','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2379,'Kuri','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2380,'Chong-up','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2381,'Chechon','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2382,'Sosan','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2383,'Shihung','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2384,'Tong-yong','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2385,'Kongju','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2386,'Yongju','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2387,'Chinhae','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2388,'Sangju','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2389,'Poryong','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2390,'Kwang-yang','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2391,'Miryang','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2392,'Hanam','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2393,'Kimje','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2394,'Yongchon','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2395,'Sachon','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2396,'Uiwang','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2397,'Naju','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2398,'Namwon','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2399,'Tonghae','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2400,'Mun-gyong','KOR',112,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2401,'Athenai','GRC',82,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2402,'Thessaloniki','GRC',82,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2403,'Pireus','GRC',82,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2404,'Patras','GRC',82,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2405,'Peristerion','GRC',82,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2406,'Herakleion','GRC',82,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2407,'Kallithea','GRC',82,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2408,'Larisa','GRC',82,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2409,'Zagreb','HRV',91,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2410,'Split','HRV',91,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2411,'Rijeka','HRV',91,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2412,'Osijek','HRV',91,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2413,'La Habana','CUB',49,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2414,'Santiago de Cuba','CUB',49,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2415,'Camagüey','CUB',49,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2416,'Holguín','CUB',49,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2417,'Santa Clara','CUB',49,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2418,'Guantánamo','CUB',49,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2419,'Pinar del Río','CUB',49,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2420,'Bayamo','CUB',49,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2421,'Cienfuegos','CUB',49,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2422,'Victoria de las Tunas','CUB',49,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2423,'Matanzas','CUB',49,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2424,'Manzanillo','CUB',49,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2425,'Sancti-Spíritus','CUB',49,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2426,'Ciego de Ávila','CUB',49,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2427,'al-Salimiya','KWT',113,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2428,'Jalib al-Shuyukh','KWT',113,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2429,'Kuwait','KWT',113,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2430,'Nicosia','CYP',52,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2431,'Limassol','CYP',52,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2432,'Vientiane','LAO',114,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2433,'Savannakhet','LAO',114,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2434,'Riga','LVA',124,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2435,'Daugavpils','LVA',124,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2436,'Liepaja','LVA',124,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2437,'Maseru','LSO',121,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2438,'Beirut','LBN',115,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2439,'Tripoli','LBN',115,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2440,'Monrovia','LBR',116,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2441,'Tripoli','LBY',117,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2442,'Bengasi','LBY',117,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2443,'Misrata','LBY',117,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2444,'al-Zawiya','LBY',117,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2445,'Schaan','LIE',119,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2446,'Vaduz','LIE',119,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2447,'Vilnius','LTU',122,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2448,'Kaunas','LTU',122,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2449,'Klaipeda','LTU',122,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2450,'Šiauliai','LTU',122,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2451,'Panevezys','LTU',122,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2452,'Luxembourg [Luxemburg/Lëtzebuerg]','LUX',123,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2453,'El-Aaiún','ESH',62,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2454,'Macao','MAC',125,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2455,'Antananarivo','MDG',129,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2456,'Toamasina','MDG',129,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2457,'Antsirabé','MDG',129,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2458,'Mahajanga','MDG',129,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2459,'Fianarantsoa','MDG',129,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2460,'Skopje','MKD',133,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2461,'Blantyre','MWI',144,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2462,'Lilongwe','MWI',144,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2463,'Male','MDV',130,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2464,'Kuala Lumpur','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2465,'Ipoh','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2466,'Johor Baharu','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2467,'Petaling Jaya','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2468,'Kelang','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2469,'Kuala Terengganu','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2470,'Pinang','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2471,'Kota Bharu','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2472,'Kuantan','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2473,'Taiping','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2474,'Seremban','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2475,'Kuching','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2476,'Sibu','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2477,'Sandakan','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2478,'Alor Setar','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2479,'Selayang Baru','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2480,'Sungai Petani','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2481,'Shah Alam','MYS',145,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2482,'Bamako','MLI',134,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2483,'Birkirkara','MLT',135,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2484,'Valletta','MLT',135,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2485,'Casablanca','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2486,'Rabat','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2487,'Marrakech','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2488,'Fès','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2489,'Tanger','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2490,'Salé','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2491,'Meknès','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2492,'Oujda','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2493,'Kénitra','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2494,'Tétouan','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2495,'Safi','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2496,'Agadir','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2497,'Mohammedia','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2498,'Khouribga','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2499,'Beni-Mellal','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2500,'Témara','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2501,'El Jadida','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2502,'Nador','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2503,'Ksar el Kebir','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2504,'Settat','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2505,'Taza','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2506,'El Araich','MAR',126,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2507,'Dalap-Uliga-Darrit','MHL',132,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2508,'Fort-de-France','MTQ',142,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2509,'Nouakchott','MRT',140,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2510,'Nouâdhibou','MRT',140,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2511,'Port-Louis','MUS',143,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2512,'Beau Bassin-Rose Hill','MUS',143,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2513,'Vacoas-Phoenix','MUS',143,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2514,'Mamoutzou','MYT',146,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2515,'Ciudad de México','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2516,'Guadalajara','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2517,'Ecatepec de Morelos','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2518,'Puebla','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2519,'Nezahualcóyotl','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2520,'Juárez','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2521,'Tijuana','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2522,'León','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2523,'Monterrey','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2524,'Zapopan','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2525,'Naucalpan de Juárez','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2526,'Mexicali','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2527,'Culiacán','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2528,'Acapulco de Juárez','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2529,'Tlalnepantla de Baz','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2530,'Mérida','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2531,'Chihuahua','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2532,'San Luis Potosí','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2533,'Guadalupe','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2534,'Toluca','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2535,'Aguascalientes','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2536,'Querétaro','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2537,'Morelia','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2538,'Hermosillo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2539,'Saltillo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2540,'Torreón','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2541,'Centro (Villahermosa)','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2542,'San Nicolás de los Garza','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2543,'Durango','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2544,'Chimalhuacán','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2545,'Tlaquepaque','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2546,'Atizapán de Zaragoza','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2547,'Veracruz','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2548,'Cuautitlán Izcalli','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2549,'Irapuato','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2550,'Tuxtla Gutiérrez','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2551,'Tultitlán','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2552,'Reynosa','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2553,'Benito Juárez','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2554,'Matamoros','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2555,'Xalapa','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2556,'Celaya','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2557,'Mazatlán','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2558,'Ensenada','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2559,'Ahome','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2560,'Cajeme','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2561,'Cuernavaca','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2562,'Tonalá','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2563,'Valle de Chalco Solidaridad','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2564,'Nuevo Laredo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2565,'Tepic','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2566,'Tampico','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2567,'Ixtapaluca','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2568,'Apodaca','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2569,'Guasave','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2570,'Gómez Palacio','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2571,'Tapachula','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2572,'Nicolás Romero','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2573,'Coatzacoalcos','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2574,'Uruapan','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2575,'Victoria','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2576,'Oaxaca de Juárez','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2577,'Coacalco de Berriozábal','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2578,'Pachuca de Soto','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2579,'General Escobedo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2580,'Salamanca','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2581,'Santa Catarina','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2582,'Tehuacán','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2583,'Chalco','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2584,'Cárdenas','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2585,'Campeche','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2586,'La Paz','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2587,'Othón P. Blanco (Chetumal)','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2588,'Texcoco','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2589,'La Paz','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2590,'Metepec','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2591,'Monclova','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2592,'Huixquilucan','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2593,'Chilpancingo de los Bravo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2594,'Puerto Vallarta','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2595,'Fresnillo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2596,'Ciudad Madero','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2597,'Soledad de Graciano Sánchez','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2598,'San Juan del Río','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2599,'San Felipe del Progreso','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2600,'Córdoba','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2601,'Tecámac','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2602,'Ocosingo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2603,'Carmen','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2604,'Lázaro Cárdenas','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2605,'Jiutepec','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2606,'Papantla','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2607,'Comalcalco','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2608,'Zamora','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2609,'Nogales','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2610,'Huimanguillo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2611,'Cuautla','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2612,'Minatitlán','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2613,'Poza Rica de Hidalgo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2614,'Ciudad Valles','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2615,'Navolato','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2616,'San Luis Río Colorado','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2617,'Pénjamo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2618,'San Andrés Tuxtla','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2619,'Guanajuato','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2620,'Navojoa','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2621,'Zitácuaro','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2622,'Boca del Río','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2623,'Allende','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2624,'Silao','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2625,'Macuspana','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2626,'San Juan Bautista Tuxtepec','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2627,'San Cristóbal de las Casas','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2628,'Valle de Santiago','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2629,'Guaymas','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2630,'Colima','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2631,'Dolores Hidalgo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2632,'Lagos de Moreno','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2633,'Piedras Negras','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2634,'Altamira','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2635,'Túxpam','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2636,'San Pedro Garza García','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2637,'Cuauhtémoc','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2638,'Manzanillo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2639,'Iguala de la Independencia','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2640,'Zacatecas','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2641,'Tlajomulco de Zúñiga','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2642,'Tulancingo de Bravo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2643,'Zinacantepec','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2644,'San Martín Texmelucan','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2645,'Tepatitlán de Morelos','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2646,'Martínez de la Torre','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2647,'Orizaba','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2648,'Apatzingán','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2649,'Atlixco','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2650,'Delicias','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2651,'Ixtlahuaca','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2652,'El Mante','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2653,'Lerdo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2654,'Almoloya de Juárez','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2655,'Acámbaro','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2656,'Acuña','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2657,'Guadalupe','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2658,'Huejutla de Reyes','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2659,'Hidalgo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2660,'Los Cabos','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2661,'Comitán de Domínguez','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2662,'Cunduacán','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2663,'Río Bravo','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2664,'Temapache','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2665,'Chilapa de Alvarez','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2666,'Hidalgo del Parral','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2667,'San Francisco del Rincón','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2668,'Taxco de Alarcón','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2669,'Zumpango','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2670,'San Pedro Cholula','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2671,'Lerma','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2672,'Tecomán','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2673,'Las Margaritas','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2674,'Cosoleacaque','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2675,'San Luis de la Paz','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2676,'José Azueta','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2677,'Santiago Ixcuintla','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2678,'San Felipe','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2679,'Tejupilco','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2680,'Tantoyuca','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2681,'Salvatierra','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2682,'Tultepec','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2683,'Temixco','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2684,'Matamoros','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2685,'Pánuco','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2686,'El Fuerte','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2687,'Tierra Blanca','MEX',131,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2688,'Weno','FSM',71,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2689,'Palikir','FSM',71,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2690,'Chisinau','MDA',128,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2691,'Tiraspol','MDA',128,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2692,'Balti','MDA',128,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2693,'Bender (Tîghina)','MDA',128,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2694,'Monte-Carlo','MCO',127,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2695,'Monaco-Ville','MCO',127,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2696,'Ulan Bator','MNG',137,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2697,'Plymouth','MSR',141,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2698,'Maputo','MOZ',139,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2699,'Matola','MOZ',139,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2700,'Beira','MOZ',139,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2701,'Nampula','MOZ',139,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2702,'Chimoio','MOZ',139,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2703,'Naçala-Porto','MOZ',139,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2704,'Quelimane','MOZ',139,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2705,'Mocuba','MOZ',139,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2706,'Tete','MOZ',139,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2707,'Xai-Xai','MOZ',139,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2708,'Gurue','MOZ',139,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2709,'Maxixe','MOZ',139,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2710,'Rangoon (Yangon)','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2711,'Mandalay','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2712,'Moulmein (Mawlamyine)','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2713,'Pegu (Bago)','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2714,'Bassein (Pathein)','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2715,'Monywa','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2716,'Sittwe (Akyab)','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2717,'Taunggyi (Taunggye)','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2718,'Meikhtila','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2719,'Mergui (Myeik)','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2720,'Lashio (Lasho)','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2721,'Prome (Pyay)','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2722,'Henzada (Hinthada)','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2723,'Myingyan','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2724,'Tavoy (Dawei)','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2725,'Pagakku (Pakokku)','MMR',136,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2726,'Windhoek','NAM',147,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2727,'Yangor','NRU',157,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2728,'Yaren','NRU',157,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2729,'Kathmandu','NPL',156,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2730,'Biratnagar','NPL',156,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2731,'Pokhara','NPL',156,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2732,'Lalitapur','NPL',156,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2733,'Birgunj','NPL',156,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2734,'Managua','NIC',152,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2735,'León','NIC',152,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2736,'Chinandega','NIC',152,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2737,'Masaya','NIC',152,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2738,'Niamey','NER',149,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2739,'Zinder','NER',149,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2740,'Maradi','NER',149,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2805,'Alofi','NIU',153,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2806,'Kingston','NFK',150,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2807,'Oslo','NOR',155,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2808,'Bergen','NOR',155,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2809,'Trondheim','NOR',155,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2810,'Stavanger','NOR',155,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2811,'Bærum','NOR',155,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2812,'Abidjan','CIV',41,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2813,'Bouaké','CIV',41,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2814,'Yamoussoukro','CIV',41,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2815,'Daloa','CIV',41,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2816,'Korhogo','CIV',41,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2817,'al-Sib','OMN',159,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2818,'Salala','OMN',159,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2819,'Bawshar','OMN',159,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2820,'Suhar','OMN',159,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2821,'Masqat','OMN',159,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2822,'Karachi','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2823,'Lahore','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2824,'Faisalabad','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2825,'Rawalpindi','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2826,'Multan','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2827,'Hyderabad','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2828,'Gujranwala','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2829,'Peshawar','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2830,'Quetta','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2831,'Islamabad','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2832,'Sargodha','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2833,'Sialkot','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2834,'Bahawalpur','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2835,'Sukkur','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2836,'Jhang','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2837,'Sheikhupura','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2838,'Larkana','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2839,'Gujrat','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2840,'Mardan','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2841,'Kasur','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2842,'Rahim Yar Khan','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2843,'Sahiwal','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2844,'Okara','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2845,'Wah','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2846,'Dera Ghazi Khan','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2847,'Mirpur Khas','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2848,'Nawabshah','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2849,'Mingora','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2850,'Chiniot','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2851,'Kamoke','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2852,'Mandi Burewala','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2853,'Jhelum','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2854,'Sadiqabad','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2855,'Jacobabad','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2856,'Shikarpur','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2857,'Khanewal','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2858,'Hafizabad','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2859,'Kohat','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2860,'Muzaffargarh','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2861,'Khanpur','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2862,'Gojra','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2863,'Bahawalnagar','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2864,'Muridke','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2865,'Pak Pattan','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2866,'Abottabad','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2867,'Tando Adam','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2868,'Jaranwala','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2869,'Khairpur','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2870,'Chishtian Mandi','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2871,'Daska','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2872,'Dadu','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2873,'Mandi Bahauddin','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2874,'Ahmadpur East','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2875,'Kamalia','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2876,'Khuzdar','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2877,'Vihari','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2878,'Dera Ismail Khan','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2879,'Wazirabad','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2880,'Nowshera','PAK',160,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2881,'Koror','PLW',164,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2882,'Ciudad de Panamá','PAN',161,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2883,'San Miguelito','PAN',161,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2884,'Port Moresby','PNG',165,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2885,'Asunción','PRY',169,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2886,'Ciudad del Este','PRY',169,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2887,'San Lorenzo','PRY',169,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2888,'Lambaré','PRY',169,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2889,'Fernando de la Mora','PRY',169,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2890,'Lima','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2891,'Arequipa','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2892,'Trujillo','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2893,'Chiclayo','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2894,'Callao','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2895,'Iquitos','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2896,'Chimbote','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2897,'Huancayo','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2898,'Piura','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2899,'Cusco','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2900,'Pucallpa','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2901,'Tacna','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2902,'Ica','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2903,'Sullana','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2904,'Juliaca','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2905,'Huánuco','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2906,'Ayacucho','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2907,'Chincha Alta','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2908,'Cajamarca','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2909,'Puno','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2910,'Ventanilla','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2911,'Castilla','PER',162,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2912,'Adamstown','PCN',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2913,'Garapan','MNP',138,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2914,'Lisboa','PRT',168,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2915,'Porto','PRT',168,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2916,'Amadora','PRT',168,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2917,'Coímbra','PRT',168,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2918,'Braga','PRT',168,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2919,'San Juan','PRI',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2920,'Bayamón','PRI',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2921,'Ponce','PRI',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2922,'Carolina','PRI',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2923,'Caguas','PRI',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2924,'Arecibo','PRI',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2925,'Guaynabo','PRI',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2926,'Mayagüez','PRI',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2927,'Toa Baja','PRI',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2928,'Warszawa','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2929,'Lódz','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2930,'Kraków','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2931,'Wroclaw','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2932,'Poznan','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2933,'Gdansk','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2934,'Szczecin','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2935,'Bydgoszcz','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2936,'Lublin','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2937,'Katowice','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2938,'Bialystok','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2939,'Czestochowa','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2940,'Gdynia','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2941,'Sosnowiec','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2942,'Radom','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2943,'Kielce','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2944,'Gliwice','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2945,'Torun','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2946,'Bytom','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2947,'Zabrze','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2948,'Bielsko-Biala','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2949,'Olsztyn','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2950,'Rzeszów','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2951,'Ruda Slaska','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2952,'Rybnik','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2953,'Walbrzych','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2954,'Tychy','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2955,'Dabrowa Górnicza','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2956,'Plock','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2957,'Elblag','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2958,'Opole','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2959,'Gorzów Wielkopolski','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2960,'Wloclawek','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2961,'Chorzów','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2962,'Tarnów','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2963,'Zielona Góra','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2964,'Koszalin','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2965,'Legnica','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2966,'Kalisz','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2967,'Grudziadz','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2968,'Slupsk','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2969,'Jastrzebie-Zdrój','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2970,'Jaworzno','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2971,'Jelenia Góra','POL',166,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2972,'Malabo','GNQ',81,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2973,'Doha','QAT',172,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2974,'Paris','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2975,'Marseille','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2976,'Lyon','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2977,'Toulouse','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2978,'Nice','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2979,'Nantes','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2980,'Strasbourg','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2981,'Montpellier','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2982,'Bordeaux','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2983,'Rennes','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2984,'Le Havre','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2985,'Reims','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2986,'Lille','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2987,'St-Étienne','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2988,'Toulon','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2989,'Grenoble','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2990,'Angers','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2991,'Dijon','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2992,'Brest','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2993,'Le Mans','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2994,'Clermont-Ferrand','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2995,'Amiens','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2996,'Aix-en-Provence','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2997,'Limoges','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2998,'Nîmes','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(2999,'Tours','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3000,'Villeurbanne','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3001,'Metz','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3002,'Besançon','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3003,'Caen','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3004,'Orléans','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3005,'Mulhouse','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3006,'Rouen','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3007,'Boulogne-Billancourt','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3008,'Perpignan','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3009,'Nancy','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3010,'Roubaix','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3011,'Argenteuil','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3012,'Tourcoing','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3013,'Montreuil','FRA',69,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3014,'Cayenne','GUF',86,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3015,'Faaa','PYF',171,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3016,'Papeete','PYF',171,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3017,'Saint-Denis','REU',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3018,'Bucuresti','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3019,'Iasi','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3020,'Constanta','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3021,'Cluj-Napoca','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3022,'Galati','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3023,'Timisoara','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3024,'Brasov','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3025,'Craiova','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3026,'Ploiesti','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3027,'Braila','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3028,'Oradea','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3029,'Bacau','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3030,'Pitesti','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3031,'Arad','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3032,'Sibiu','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3033,'Târgu Mures','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3034,'Baia Mare','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3035,'Buzau','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3036,'Satu Mare','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3037,'Botosani','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3038,'Piatra Neamt','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3039,'Râmnicu Vâlcea','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3040,'Suceava','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3041,'Drobeta-Turnu Severin','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3042,'Târgoviste','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3043,'Focsani','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3044,'Târgu Jiu','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3045,'Tulcea','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3046,'Resita','ROM',173,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3047,'Kigali','RWA',175,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3048,'Stockholm','SWE',191,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3049,'Gothenburg [Göteborg]','SWE',191,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3050,'Malmö','SWE',191,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3051,'Uppsala','SWE',191,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3052,'Linköping','SWE',191,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3053,'Västerås','SWE',191,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3054,'Örebro','SWE',191,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3055,'Norrköping','SWE',191,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3056,'Helsingborg','SWE',191,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3057,'Jönköping','SWE',191,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3058,'Umeå','SWE',191,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3059,'Lund','SWE',191,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3060,'Borås','SWE',191,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3061,'Sundsvall','SWE',191,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3062,'Gävle','SWE',191,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3063,'Jamestown','SHN',180,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3064,'Basseterre','KNA',111,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3065,'Castries','LCA',118,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3066,'Kingstown','VCT',211,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3067,'Saint-Pierre','SPM',186,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3068,'Berlin','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3069,'Hamburg','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3070,'Munich [München]','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3071,'Köln','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3072,'Frankfurt am Main','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3073,'Essen','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3074,'Dortmund','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3075,'Stuttgart','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3076,'Düsseldorf','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3077,'Bremen','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3078,'Duisburg','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3079,'Hannover','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3080,'Leipzig','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3081,'Nürnberg','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3082,'Dresden','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3083,'Bochum','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3084,'Wuppertal','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3085,'Bielefeld','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3086,'Mannheim','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3087,'Bonn','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3088,'Gelsenkirchen','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3089,'Karlsruhe','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3090,'Wiesbaden','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3091,'Münster','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3092,'Mönchengladbach','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3093,'Chemnitz','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3094,'Augsburg','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3095,'Halle/Saale','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3096,'Braunschweig','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3097,'Aachen','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3098,'Krefeld','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3099,'Magdeburg','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3100,'Kiel','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3101,'Oberhausen','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3102,'Lübeck','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3103,'Hagen','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3104,'Rostock','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3105,'Freiburg im Breisgau','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3106,'Erfurt','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3107,'Kassel','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3108,'Saarbrücken','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3109,'Mainz','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3110,'Hamm','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3111,'Herne','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3112,'Mülheim an der Ruhr','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3113,'Solingen','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3114,'Osnabrück','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3115,'Ludwigshafen am Rhein','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3116,'Leverkusen','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3117,'Oldenburg','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3118,'Neuss','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3119,'Heidelberg','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3120,'Darmstadt','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3121,'Paderborn','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3122,'Potsdam','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3123,'Würzburg','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3124,'Regensburg','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3125,'Recklinghausen','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3126,'Göttingen','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3127,'Bremerhaven','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3128,'Wolfsburg','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3129,'Bottrop','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3130,'Remscheid','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3131,'Heilbronn','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3132,'Pforzheim','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3133,'Offenbach am Main','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3134,'Ulm','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3135,'Ingolstadt','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3136,'Gera','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3137,'Salzgitter','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3138,'Cottbus','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3139,'Reutlingen','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3140,'Fürth','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3141,'Siegen','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3142,'Koblenz','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3143,'Moers','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3144,'Bergisch Gladbach','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3145,'Zwickau','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3146,'Hildesheim','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3147,'Witten','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3148,'Schwerin','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3149,'Erlangen','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3150,'Kaiserslautern','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3151,'Trier','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3152,'Jena','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3153,'Iserlohn','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3154,'Gütersloh','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3155,'Marl','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3156,'Lünen','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3157,'Düren','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3158,'Ratingen','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3159,'Velbert','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3160,'Esslingen am Neckar','DEU',53,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3161,'Honiara','SLB',181,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3162,'Lusaka','ZMB',221,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3163,'Ndola','ZMB',221,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3164,'Kitwe','ZMB',221,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3165,'Kabwe','ZMB',221,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3166,'Chingola','ZMB',221,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3167,'Mufulira','ZMB',221,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3168,'Luanshya','ZMB',221,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3169,'Apia','WSM',218,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3170,'Serravalle','SMR',184,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3171,'San Marino','SMR',184,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3172,'São Tomé','STP',187,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3173,'Riyadh','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3174,'Jedda','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3175,'Mekka','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3176,'Medina','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3177,'al-Dammam','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3178,'al-Taif','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3179,'Tabuk','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3180,'Burayda','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3181,'al-Hufuf','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3182,'al-Mubarraz','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3183,'Khamis Mushayt','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3184,'Hail','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3185,'al-Kharj','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3186,'al-Khubar','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3187,'Jubayl','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3188,'Hafar al-Batin','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3189,'al-Tuqba','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3190,'Yanbu','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3191,'Abha','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3192,'Ara´ar','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3193,'al-Qatif','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3194,'al-Hawiya','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3195,'Unayza','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3196,'Najran','SAU',176,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3197,'Pikine','SEN',178,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3198,'Dakar','SEN',178,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3199,'Thiès','SEN',178,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3200,'Kaolack','SEN',178,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3201,'Ziguinchor','SEN',178,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3202,'Rufisque','SEN',178,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3203,'Saint-Louis','SEN',178,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3204,'Mbour','SEN',178,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3205,'Diourbel','SEN',178,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3206,'Victoria','SYC',193,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3207,'Freetown','SLE',182,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3208,'Singapore','SGP',179,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3209,'Bratislava','SVK',189,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3210,'Košice','SVK',189,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3211,'Prešov','SVK',189,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3212,'Ljubljana','SVN',190,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3213,'Maribor','SVN',190,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3214,'Mogadishu','SOM',185,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3215,'Hargeysa','SOM',185,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3216,'Kismaayo','SOM',185,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3217,'Colombo','LKA',120,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3218,'Dehiwala','LKA',120,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3219,'Moratuwa','LKA',120,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3220,'Jaffna','LKA',120,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3221,'Kandy','LKA',120,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3222,'Sri Jayawardenepura Kotte','LKA',120,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3223,'Negombo','LKA',120,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3224,'Omdurman','SDN',177,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3225,'Khartum','SDN',177,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3226,'Sharq al-Nil','SDN',177,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3227,'Port Sudan','SDN',177,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3228,'Kassala','SDN',177,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3229,'Obeid','SDN',177,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3230,'Nyala','SDN',177,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3231,'Wad Madani','SDN',177,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3232,'al-Qadarif','SDN',177,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3233,'Kusti','SDN',177,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3234,'al-Fashir','SDN',177,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3235,'Juba','SDN',177,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3236,'Helsinki [Helsingfors]','FIN',66,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3237,'Espoo','FIN',66,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3238,'Tampere','FIN',66,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3239,'Vantaa','FIN',66,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3240,'Turku [Åbo]','FIN',66,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3241,'Oulu','FIN',66,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3242,'Lahti','FIN',66,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3243,'Paramaribo','SUR',188,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3244,'Mbabane','SWZ',192,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3245,'Zürich','CHE',38,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3246,'Geneve','CHE',38,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3247,'Basel','CHE',38,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3248,'Bern','CHE',38,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3249,'Lausanne','CHE',38,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3250,'Damascus','SYR',194,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3251,'Aleppo','SYR',194,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3252,'Hims','SYR',194,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3253,'Hama','SYR',194,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3254,'Latakia','SYR',194,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3255,'al-Qamishliya','SYR',194,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3256,'Dayr al-Zawr','SYR',194,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3257,'Jaramana','SYR',194,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3258,'Duma','SYR',194,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3259,'al-Raqqa','SYR',194,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3260,'Idlib','SYR',194,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3261,'Dushanbe','TJK',197,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3262,'Khujand','TJK',197,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3263,'Taipei','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3264,'Kaohsiung','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3265,'Taichung','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3266,'Tainan','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3267,'Panchiao','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3268,'Chungho','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3269,'Keelung (Chilung)','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3270,'Sanchung','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3271,'Hsinchuang','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3272,'Hsinchu','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3273,'Chungli','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3274,'Fengshan','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3275,'Taoyuan','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3276,'Chiayi','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3277,'Hsintien','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3278,'Changhwa','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3279,'Yungho','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3280,'Tucheng','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3281,'Pingtung','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3282,'Yungkang','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3283,'Pingchen','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3284,'Tali','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3285,'Taiping','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3286,'Pate','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3287,'Fengyuan','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3288,'Luchou','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3289,'Hsichuh','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3290,'Shulin','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3291,'Yuanlin','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3292,'Yangmei','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3293,'Taliao','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3294,'Kueishan','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3295,'Tanshui','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3296,'Taitung','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3297,'Hualien','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3298,'Nantou','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3299,'Lungtan','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3300,'Touliu','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3301,'Tsaotun','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3302,'Kangshan','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3303,'Ilan','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3304,'Miaoli','TWN',204,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3305,'Dar es Salaam','TZA',205,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3306,'Dodoma','TZA',205,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3307,'Mwanza','TZA',205,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3308,'Zanzibar','TZA',205,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3309,'Tanga','TZA',205,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3310,'Mbeya','TZA',205,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3311,'Morogoro','TZA',205,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3312,'Arusha','TZA',205,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3313,'Moshi','TZA',205,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3314,'Tabora','TZA',205,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3315,'København','DNK',56,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3316,'Århus','DNK',56,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3317,'Odense','DNK',56,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3318,'Aalborg','DNK',56,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3319,'Frederiksberg','DNK',56,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3320,'Bangkok','THA',196,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3321,'Nonthaburi','THA',196,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3322,'Nakhon Ratchasima','THA',196,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3323,'Chiang Mai','THA',196,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3324,'Udon Thani','THA',196,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3325,'Hat Yai','THA',196,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3326,'Khon Kaen','THA',196,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3327,'Pak Kret','THA',196,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3328,'Nakhon Sawan','THA',196,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3329,'Ubon Ratchathani','THA',196,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3330,'Songkhla','THA',196,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3331,'Nakhon Pathom','THA',196,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3332,'Lomé','TGO',195,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3333,'Fakaofo','TKL',198,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3334,'Nuku´alofa','TON',200,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3335,'Chaguanas','TTO',201,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3336,'Port-of-Spain','TTO',201,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3337,'N´Djaména','TCD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3338,'Moundou','TCD',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3339,'Praha','CZE',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3340,'Brno','CZE',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3341,'Ostrava','CZE',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3342,'Plzen','CZE',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3343,'Olomouc','CZE',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3344,'Liberec','CZE',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3345,'Ceské Budejovice','CZE',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3346,'Hradec Králové','CZE',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3347,'Ústí nad Labem','CZE',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3348,'Pardubice','CZE',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3349,'Tunis','TUN',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3350,'Sfax','TUN',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3351,'Ariana','TUN',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3352,'Ettadhamen','TUN',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3353,'Sousse','TUN',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3354,'Kairouan','TUN',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3355,'Biserta','TUN',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3356,'Gabès','TUN',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3357,'Istanbul','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3358,'Ankara','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3359,'Izmir','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3360,'Adana','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3361,'Bursa','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3362,'Gaziantep','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3363,'Konya','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3364,'Mersin (Içel)','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3365,'Antalya','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3366,'Diyarbakir','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3367,'Kayseri','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3368,'Eskisehir','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3369,'Sanliurfa','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3370,'Samsun','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3371,'Malatya','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3372,'Gebze','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3373,'Denizli','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3374,'Sivas','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3375,'Erzurum','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3376,'Tarsus','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3377,'Kahramanmaras','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3378,'Elâzig','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3379,'Van','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3380,'Sultanbeyli','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3381,'Izmit (Kocaeli)','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3382,'Manisa','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3383,'Batman','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3384,'Balikesir','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3385,'Sakarya (Adapazari)','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3386,'Iskenderun','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3387,'Osmaniye','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3388,'Çorum','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3389,'Kütahya','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3390,'Hatay (Antakya)','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3391,'Kirikkale','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3392,'Adiyaman','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3393,'Trabzon','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3394,'Ordu','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3395,'Aydin','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3396,'Usak','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3397,'Edirne','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3398,'Çorlu','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3399,'Isparta','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3400,'Karabük','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3401,'Kilis','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3402,'Alanya','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3403,'Kiziltepe','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3404,'Zonguldak','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3405,'Siirt','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3406,'Viransehir','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3407,'Tekirdag','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3408,'Karaman','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3409,'Afyon','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3410,'Aksaray','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3411,'Ceyhan','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3412,'Erzincan','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3413,'Bismil','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3414,'Nazilli','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3415,'Tokat','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3416,'Kars','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3417,'Inegöl','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3418,'Bandirma','TUR',202,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3419,'Ashgabat','TKM',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3420,'Chärjew','TKM',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3421,'Dashhowuz','TKM',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3422,'Mary','TKM',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3423,'Cockburn Town','TCA',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3424,'Funafuti','TUV',203,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3425,'Kampala','UGA',206,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3426,'Kyiv','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3427,'Harkova [Harkiv]','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3428,'Dnipropetrovsk','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3429,'Donetsk','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3430,'Odesa','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3431,'Zaporizzja','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3432,'Lviv','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3433,'Kryvyi Rig','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3434,'Mykolajiv','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3435,'Mariupol','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3436,'Lugansk','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3437,'Vinnytsja','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3438,'Makijivka','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3439,'Herson','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3440,'Sevastopol','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3441,'Simferopol','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3442,'Pultava [Poltava]','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3443,'Tšernigiv','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3444,'Tšerkasy','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3445,'Gorlivka','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3446,'Zytomyr','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3447,'Sumy','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3448,'Dniprodzerzynsk','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3449,'Kirovograd','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3450,'Hmelnytskyi','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3451,'Tšernivtsi','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3452,'Rivne','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3453,'Krementšuk','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3454,'Ivano-Frankivsk','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3455,'Ternopil','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3456,'Lutsk','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3457,'Bila Tserkva','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3458,'Kramatorsk','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3459,'Melitopol','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3460,'Kertš','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3461,'Nikopol','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3462,'Berdjansk','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3463,'Pavlograd','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3464,'Sjeverodonetsk','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3465,'Slovjansk','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3466,'Uzgorod','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3467,'Altševsk','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3468,'Lysytšansk','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3469,'Jevpatorija','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3470,'Kamjanets-Podilskyi','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3471,'Jenakijeve','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3472,'Krasnyi Lutš','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3473,'Stahanov','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3474,'Oleksandrija','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3475,'Konotop','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3476,'Kostjantynivka','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3477,'Berdytšiv','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3478,'Izmajil','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3479,'Šostka','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3480,'Uman','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3481,'Brovary','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3482,'Mukatševe','UKR',207,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3483,'Budapest','HUN',93,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3484,'Debrecen','HUN',93,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3485,'Miskolc','HUN',93,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3486,'Szeged','HUN',93,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3487,'Pécs','HUN',93,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3488,'Györ','HUN',93,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3489,'Nyiregyháza','HUN',93,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3490,'Kecskemét','HUN',93,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3491,'Székesfehérvár','HUN',93,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3492,'Montevideo','URY',208,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3493,'Nouméa','NCL',148,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3494,'Auckland','NZL',158,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3495,'Christchurch','NZL',158,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3496,'Manukau','NZL',158,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3497,'North Shore','NZL',158,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3498,'Waitakere','NZL',158,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3499,'Wellington','NZL',158,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3500,'Dunedin','NZL',158,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3501,'Hamilton','NZL',158,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3502,'Lower Hutt','NZL',158,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3503,'Toskent','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3504,'Namangan','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3505,'Samarkand','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3506,'Andijon','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3507,'Buhoro','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3508,'Karsi','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3509,'Nukus','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3510,'Kükon','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3511,'Fargona','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3512,'Circik','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3513,'Margilon','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3514,'Ürgenc','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3515,'Angren','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3516,'Cizah','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3517,'Navoi','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3518,'Olmalik','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3519,'Termiz','UZB',210,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3520,'Minsk','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3521,'Gomel','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3522,'Mogiljov','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3523,'Vitebsk','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3524,'Grodno','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3525,'Brest','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3526,'Bobruisk','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3527,'Baranovitši','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3528,'Borisov','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3529,'Pinsk','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3530,'Orša','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3531,'Mozyr','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3532,'Novopolotsk','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3533,'Lida','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3534,'Soligorsk','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3535,'Molodetšno','BLR',26,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3536,'Mata-Utu','WLF',217,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3537,'Port-Vila','VUT',216,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3538,'Città del Vaticano','VAT',NULL,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3539,'Caracas','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3540,'Maracaíbo','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3541,'Barquisimeto','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3542,'Valencia','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3543,'Ciudad Guayana','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3544,'Petare','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3545,'Maracay','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3546,'Barcelona','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3547,'Maturín','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3548,'San Cristóbal','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3549,'Ciudad Bolívar','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3550,'Cumaná','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3551,'Mérida','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3552,'Cabimas','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3553,'Barinas','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3554,'Turmero','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3555,'Baruta','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3556,'Puerto Cabello','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3557,'Santa Ana de Coro','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3558,'Los Teques','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3559,'Punto Fijo','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3560,'Guarenas','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3561,'Acarigua','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3562,'Puerto La Cruz','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3563,'Ciudad Losada','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3564,'Guacara','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3565,'Valera','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3566,'Guanare','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3567,'Carúpano','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3568,'Catia La Mar','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3569,'El Tigre','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3570,'Guatire','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3571,'Calabozo','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3572,'Pozuelos','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3573,'Ciudad Ojeda','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3574,'Ocumare del Tuy','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3575,'Valle de la Pascua','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3576,'Araure','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3577,'San Fernando de Apure','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3578,'San Felipe','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3579,'El Limón','VEN',212,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3580,'Moscow','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3581,'St Petersburg','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3582,'Novosibirsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3583,'Nizni Novgorod','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3584,'Jekaterinburg','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3585,'Samara','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3586,'Omsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3587,'Kazan','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3588,'Ufa','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3589,'Tšeljabinsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3590,'Rostov-na-Donu','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3591,'Perm','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3592,'Volgograd','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3593,'Voronez','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3594,'Krasnojarsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3595,'Saratov','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3596,'Toljatti','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3597,'Uljanovsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3598,'Izevsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3599,'Krasnodar','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3600,'Jaroslavl','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3601,'Habarovsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3602,'Vladivostok','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3603,'Irkutsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3604,'Barnaul','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3605,'Novokuznetsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3606,'Penza','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3607,'Rjazan','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3608,'Orenburg','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3609,'Lipetsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3610,'Nabereznyje Tšelny','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3611,'Tula','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3612,'Tjumen','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3613,'Kemerovo','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3614,'Astrahan','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3615,'Tomsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3616,'Kirov','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3617,'Ivanovo','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3618,'Tšeboksary','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3619,'Brjansk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3620,'Tver','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3621,'Kursk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3622,'Magnitogorsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3623,'Kaliningrad','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3624,'Nizni Tagil','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3625,'Murmansk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3626,'Ulan-Ude','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3627,'Kurgan','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3628,'Arkangeli','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3629,'Sotši','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3630,'Smolensk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3631,'Orjol','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3632,'Stavropol','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3633,'Belgorod','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3634,'Kaluga','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3635,'Vladimir','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3636,'Mahatškala','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3637,'Tšerepovets','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3638,'Saransk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3639,'Tambov','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3640,'Vladikavkaz','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3641,'Tšita','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3642,'Vologda','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3643,'Veliki Novgorod','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3644,'Komsomolsk-na-Amure','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3645,'Kostroma','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3646,'Volzski','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3647,'Taganrog','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3648,'Petroskoi','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3649,'Bratsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3650,'Dzerzinsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3651,'Surgut','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3652,'Orsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3653,'Sterlitamak','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3654,'Angarsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3655,'Joškar-Ola','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3656,'Rybinsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3657,'Prokopjevsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3658,'Niznevartovsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3659,'Naltšik','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3660,'Syktyvkar','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3661,'Severodvinsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3662,'Bijsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3663,'Niznekamsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3664,'Blagoveštšensk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3665,'Šahty','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3666,'Staryi Oskol','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3667,'Zelenograd','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3668,'Balakovo','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3669,'Novorossijsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3670,'Pihkova','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3671,'Zlatoust','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3672,'Jakutsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3673,'Podolsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3674,'Petropavlovsk-Kamtšatski','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3675,'Kamensk-Uralski','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3676,'Engels','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3677,'Syzran','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3678,'Grozny','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3679,'Novotšerkassk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3680,'Berezniki','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3681,'Juzno-Sahalinsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3682,'Volgodonsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3683,'Abakan','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3684,'Maikop','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3685,'Miass','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3686,'Armavir','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3687,'Ljubertsy','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3688,'Rubtsovsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3689,'Kovrov','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3690,'Nahodka','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3691,'Ussurijsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3692,'Salavat','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3693,'Mytištši','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3694,'Kolomna','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3695,'Elektrostal','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3696,'Murom','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3697,'Kolpino','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3698,'Norilsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3699,'Almetjevsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3700,'Novomoskovsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3701,'Dimitrovgrad','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3702,'Pervouralsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3703,'Himki','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3704,'Balašiha','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3705,'Nevinnomyssk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3706,'Pjatigorsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3707,'Korolev','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3708,'Serpuhov','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3709,'Odintsovo','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3710,'Orehovo-Zujevo','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3711,'Kamyšin','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3712,'Novotšeboksarsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3713,'Tšerkessk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3714,'Atšinsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3715,'Magadan','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3716,'Mitšurinsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3717,'Kislovodsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3718,'Jelets','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3719,'Seversk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3720,'Noginsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3721,'Velikije Luki','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3722,'Novokuibyševsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3723,'Neftekamsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3724,'Leninsk-Kuznetski','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3725,'Oktjabrski','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3726,'Sergijev Posad','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3727,'Arzamas','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3728,'Kiseljovsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3729,'Novotroitsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3730,'Obninsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3731,'Kansk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3732,'Glazov','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3733,'Solikamsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3734,'Sarapul','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3735,'Ust-Ilimsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3736,'Štšolkovo','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3737,'Mezduretšensk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3738,'Usolje-Sibirskoje','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3739,'Elista','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3740,'Novošahtinsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3741,'Votkinsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3742,'Kyzyl','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3743,'Serov','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3744,'Zelenodolsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3745,'Zeleznodoroznyi','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3746,'Kinešma','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3747,'Kuznetsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3748,'Uhta','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3749,'Jessentuki','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3750,'Tobolsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3751,'Neftejugansk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3752,'Bataisk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3753,'Nojabrsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3754,'Balašov','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3755,'Zeleznogorsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3756,'Zukovski','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3757,'Anzero-Sudzensk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3758,'Bugulma','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3759,'Zeleznogorsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3760,'Novouralsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3761,'Puškin','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3762,'Vorkuta','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3763,'Derbent','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3764,'Kirovo-Tšepetsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3765,'Krasnogorsk','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3766,'Klin','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3767,'Tšaikovski','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3768,'Novyi Urengoi','RUS',174,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3769,'Ho Chi Minh City','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3770,'Hanoi','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3771,'Haiphong','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3772,'Da Nang','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3773,'Biên Hoa','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3774,'Nha Trang','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3775,'Hue','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3776,'Can Tho','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3777,'Cam Pha','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3778,'Nam Dinh','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3779,'Quy Nhon','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3780,'Vung Tau','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3781,'Rach Gia','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3782,'Long Xuyen','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3783,'Thai Nguyen','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3784,'Hong Gai','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3785,'Phan Thiêt','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3786,'Cam Ranh','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3787,'Vinh','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3788,'My Tho','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3789,'Da Lat','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3790,'Buon Ma Thuot','VNM',215,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3791,'Tallinn','EST',64,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3792,'Tartu','EST',64,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3793,'New York','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3794,'Los Angeles','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3795,'Chicago','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3796,'Houston','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3797,'Philadelphia','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3798,'Phoenix','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3799,'San Diego','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3800,'Dallas','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3801,'San Antonio','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3802,'Detroit','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3803,'San Jose','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3804,'Indianapolis','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3805,'San Francisco','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3806,'Jacksonville','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3807,'Columbus','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3808,'Austin','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3809,'Baltimore','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3810,'Memphis','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3811,'Milwaukee','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3812,'Boston','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3813,'Washington','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3814,'Nashville-Davidson','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3815,'El Paso','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3816,'Seattle','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3817,'Denver','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3818,'Charlotte','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3819,'Fort Worth','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3820,'Portland','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3821,'Oklahoma City','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3822,'Tucson','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3823,'New Orleans','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3824,'Las Vegas','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3825,'Cleveland','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3826,'Long Beach','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3827,'Albuquerque','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3828,'Kansas City','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3829,'Fresno','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3830,'Virginia Beach','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3831,'Atlanta','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3832,'Sacramento','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3833,'Oakland','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3834,'Mesa','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3835,'Tulsa','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3836,'Omaha','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3837,'Minneapolis','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3838,'Honolulu','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3839,'Miami','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3840,'Colorado Springs','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3841,'Saint Louis','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3842,'Wichita','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3843,'Santa Ana','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3844,'Pittsburgh','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3845,'Arlington','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3846,'Cincinnati','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3847,'Anaheim','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3848,'Toledo','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3849,'Tampa','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3850,'Buffalo','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3851,'Saint Paul','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3852,'Corpus Christi','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3853,'Aurora','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3854,'Raleigh','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3855,'Newark','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3856,'Lexington-Fayette','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3857,'Anchorage','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3858,'Louisville','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3859,'Riverside','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3860,'Saint Petersburg','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3861,'Bakersfield','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3862,'Stockton','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3863,'Birmingham','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3864,'Jersey City','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3865,'Norfolk','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3866,'Baton Rouge','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3867,'Hialeah','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3868,'Lincoln','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3869,'Greensboro','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3870,'Plano','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3871,'Rochester','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3872,'Glendale','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3873,'Akron','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3874,'Garland','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3875,'Madison','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3876,'Fort Wayne','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3877,'Fremont','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3878,'Scottsdale','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3879,'Montgomery','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3880,'Shreveport','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3881,'Augusta-Richmond County','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3882,'Lubbock','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3883,'Chesapeake','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3884,'Mobile','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3885,'Des Moines','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3886,'Grand Rapids','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3887,'Richmond','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3888,'Yonkers','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3889,'Spokane','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3890,'Glendale','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3891,'Tacoma','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3892,'Irving','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3893,'Huntington Beach','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3894,'Modesto','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3895,'Durham','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3896,'Columbus','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3897,'Orlando','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3898,'Boise City','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3899,'Winston-Salem','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3900,'San Bernardino','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3901,'Jackson','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3902,'Little Rock','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3903,'Salt Lake City','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3904,'Reno','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3905,'Newport News','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3906,'Chandler','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3907,'Laredo','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3908,'Henderson','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3909,'Arlington','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3910,'Knoxville','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3911,'Amarillo','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3912,'Providence','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3913,'Chula Vista','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3914,'Worcester','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3915,'Oxnard','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3916,'Dayton','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3917,'Garden Grove','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3918,'Oceanside','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3919,'Tempe','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3920,'Huntsville','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3921,'Ontario','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3922,'Chattanooga','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3923,'Fort Lauderdale','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3924,'Springfield','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3925,'Springfield','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3926,'Santa Clarita','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3927,'Salinas','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3928,'Tallahassee','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3929,'Rockford','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3930,'Pomona','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3931,'Metairie','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3932,'Paterson','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3933,'Overland Park','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3934,'Santa Rosa','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3935,'Syracuse','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3936,'Kansas City','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3937,'Hampton','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3938,'Lakewood','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3939,'Vancouver','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3940,'Irvine','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3941,'Aurora','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3942,'Moreno Valley','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3943,'Pasadena','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3944,'Hayward','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3945,'Brownsville','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3946,'Bridgeport','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3947,'Hollywood','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3948,'Warren','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3949,'Torrance','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3950,'Eugene','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3951,'Pembroke Pines','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3952,'Salem','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3953,'Pasadena','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3954,'Escondido','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3955,'Sunnyvale','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3956,'Savannah','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3957,'Fontana','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3958,'Orange','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3959,'Naperville','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3960,'Alexandria','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3961,'Rancho Cucamonga','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3962,'Grand Prairie','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3963,'East Los Angeles','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3964,'Fullerton','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3965,'Corona','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3966,'Flint','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3967,'Paradise','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3968,'Mesquite','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3969,'Sterling Heights','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3970,'Sioux Falls','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3971,'New Haven','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3972,'Topeka','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3973,'Concord','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3974,'Evansville','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3975,'Hartford','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3976,'Fayetteville','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3977,'Cedar Rapids','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3978,'Elizabeth','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3979,'Lansing','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3980,'Lancaster','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3981,'Fort Collins','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3982,'Coral Springs','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3983,'Stamford','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3984,'Thousand Oaks','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3985,'Vallejo','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3986,'Palmdale','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3987,'Columbia','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3988,'El Monte','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3989,'Abilene','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3990,'North Las Vegas','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3991,'Ann Arbor','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3992,'Beaumont','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3993,'Waco','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3994,'Macon','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3995,'Independence','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3996,'Peoria','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3997,'Inglewood','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3998,'Springfield','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(3999,'Simi Valley','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4000,'Lafayette','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4001,'Gilbert','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4002,'Carrollton','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4003,'Bellevue','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4004,'West Valley City','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4005,'Clarksville','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4006,'Costa Mesa','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4007,'Peoria','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4008,'South Bend','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4009,'Downey','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4010,'Waterbury','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4011,'Manchester','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4012,'Allentown','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4013,'McAllen','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4014,'Joliet','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4015,'Lowell','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4016,'Provo','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4017,'West Covina','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4018,'Wichita Falls','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4019,'Erie','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4020,'Daly City','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4021,'Citrus Heights','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4022,'Norwalk','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4023,'Gary','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4024,'Berkeley','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4025,'Santa Clara','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4026,'Green Bay','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4027,'Cape Coral','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4028,'Arvada','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4029,'Pueblo','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4030,'Sandy','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4031,'Athens-Clarke County','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4032,'Cambridge','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4033,'Westminster','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4034,'San Buenaventura','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4035,'Portsmouth','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4036,'Livonia','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4037,'Burbank','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4038,'Clearwater','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4039,'Midland','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4040,'Davenport','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4041,'Mission Viejo','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4042,'Miami Beach','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4043,'Sunrise Manor','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4044,'New Bedford','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4045,'El Cajon','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4046,'Norman','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4047,'Richmond','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4048,'Albany','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4049,'Brockton','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4050,'Roanoke','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4051,'Billings','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4052,'Compton','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4053,'Gainesville','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4054,'Fairfield','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4055,'Arden-Arcade','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4056,'San Mateo','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4057,'Visalia','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4058,'Boulder','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4059,'Cary','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4060,'Santa Monica','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4061,'Fall River','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4062,'Kenosha','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4063,'Elgin','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4064,'Odessa','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4065,'Carson','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4066,'Charleston','USA',209,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4067,'Charlotte Amalie','VIR',214,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4068,'Harare','ZWE',222,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4069,'Bulawayo','ZWE',222,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4070,'Chitungwiza','ZWE',222,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4071,'Mount Darwin','ZWE',222,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4072,'Mutare','ZWE',222,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4073,'Gweru','ZWE',222,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4074,'Gaza','PSE',170,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4075,'Khan Yunis','PSE',170,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4076,'Hebron','PSE',170,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4077,'Jabaliya','PSE',170,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4078,'Nablus','PSE',170,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4079,'Rafah','PSE',170,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4200,'FCT','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4201,'Abia','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4202,'Adamawa','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4203,'Akwa Ibom','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4204,'Anambara','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4205,'Bauchi','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4206,'Bayelsa','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4207,'Benue','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4208,'Borno','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4209,'Cross River','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4210,'Delta','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4211,'Ebonyi','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4212,'Edo','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4213,'Ekiti','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4214,'Enugu','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4215,'Gombe','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4216,'Imo','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4217,'Jigawa','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4218,'Kaduna','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4219,'Kano','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4220,'Katsina','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4221,'Kebbi','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4222,'Kogi','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4223,'Kwara','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4224,'Lagos','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4225,'Nasarawa','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4226,'Niger','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4227,'Ogun','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4228,'Ondo','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4229,'Osun','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4230,'Oyo','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4231,'Pleateau','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4232,'Rivers','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4233,'Sokoto','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4234,'Taraba','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4235,'Yobe','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4236,'Zamfara','NGA',151,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54'),
(4237,'Test State','5',5,NULL,'2020-06-23 09:39:54',NULL,'2020-06-23 09:39:54');

/*Table structure for table `statuses` */

DROP TABLE IF EXISTS `statuses`;

CREATE TABLE `statuses` (
  `StatusID` int(10) NOT NULL AUTO_INCREMENT,
  `StatusName` varchar(20) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`StatusID`),
  UNIQUE KEY `PK_Statuses` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `statuses` */

insert  into `statuses`(`StatusID`,`StatusName`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(0,'In-Active',NULL,'2020-06-23 09:39:55',NULL,'2020-06-23 09:39:55'),
(1,'Active',NULL,'2020-06-23 09:39:55',NULL,'2020-06-23 09:39:55'),
(2,'Inactive',NULL,'2020-06-23 09:39:55',NULL,'2020-06-23 09:39:55');

/*Table structure for table `storeitems` */

DROP TABLE IF EXISTS `storeitems`;

CREATE TABLE `storeitems` (
  `StoreItemID` int(10) NOT NULL AUTO_INCREMENT,
  `ItemID` int(10) DEFAULT NULL,
  `ItemStatusID` int(10) DEFAULT NULL,
  `MeasureUnitID` int(10) DEFAULT NULL,
  `StoreID` int(10) DEFAULT NULL,
  `CostPrice` float DEFAULT NULL,
  `ReorderLevel` float DEFAULT NULL,
  `SellingPrice` float DEFAULT NULL,
  `OpenStock` float DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`StoreItemID`),
  UNIQUE KEY `PK_StoreItems` (`StoreItemID`),
  KEY `IX_Relationship_p19` (`ItemID`),
  KEY `IX_Relationship_p20` (`ItemStatusID`),
  KEY `IX_Relationship_p21` (`MeasureUnitID`),
  KEY `IX_Relationship_p26` (`StoreID`),
  CONSTRAINT `Relationship_p19` FOREIGN KEY (`ItemID`) REFERENCES `items` (`ItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p20` FOREIGN KEY (`ItemStatusID`) REFERENCES `itemstatus` (`ItemStatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p21` FOREIGN KEY (`MeasureUnitID`) REFERENCES `measureunit` (`MeasureUnitID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p26` FOREIGN KEY (`StoreID`) REFERENCES `stores` (`StoreID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `storeitems` */

insert  into `storeitems`(`StoreItemID`,`ItemID`,`ItemStatusID`,`MeasureUnitID`,`StoreID`,`CostPrice`,`ReorderLevel`,`SellingPrice`,`OpenStock`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,1,1,3,1,10000,4,9000,4,NULL,'2020-06-23 09:39:56',NULL,'2020-06-23 09:39:56'),
(2,2,2,1,2,700,4,500,3,NULL,'2020-06-23 09:39:56',NULL,'2020-06-23 09:39:56'),
(3,3,1,2,3,4000,3,3000,5,NULL,'2020-06-23 09:39:56',NULL,'2020-06-23 09:39:56');

/*Table structure for table `stores` */

DROP TABLE IF EXISTS `stores`;

CREATE TABLE `stores` (
  `StoreID` int(10) NOT NULL AUTO_INCREMENT,
  `StoreName` varchar(100) DEFAULT NULL,
  `Location` text DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`StoreID`),
  UNIQUE KEY `PK_Stores` (`StoreID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `stores` */

insert  into `stores`(`StoreID`,`StoreName`,`Location`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'ICT Store','Bleneson Home Ltd',NULL,'2020-06-23 09:40:01',NULL,'2020-06-23 09:40:01'),
(2,'HR Store','Bleneson Home Ltd',NULL,'2020-06-23 09:40:01',NULL,'2020-06-23 09:40:01'),
(3,'Admin Store','Bleneson Home Ltd',NULL,'2020-06-23 09:40:01',NULL,'2020-06-23 09:40:01');

/*Table structure for table `supervisortypes` */

DROP TABLE IF EXISTS `supervisortypes`;

CREATE TABLE `supervisortypes` (
  `SupervisorTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `SupervisorTypeName` varchar(50) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SupervisorTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `supervisortypes` */

insert  into `supervisortypes`(`SupervisorTypeID`,`SupervisorTypeName`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Supervisor Type 1',NULL,'2020-06-23 09:40:02',NULL,'2020-06-23 09:40:02');

/*Table structure for table `systemclass` */

DROP TABLE IF EXISTS `systemclass`;

CREATE TABLE `systemclass` (
  `systemclassID` int(11) NOT NULL AUTO_INCREMENT,
  `system_class` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`systemclassID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `systemclass` */

/*Table structure for table `task` */

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `TaskID` int(11) NOT NULL AUTO_INCREMENT,
  `Task` varchar(100) DEFAULT NULL,
  `PriorityID` int(11) DEFAULT NULL,
  `TaskStatusID` int(11) DEFAULT NULL,
  `AssignTo` int(11) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `DueDate` datetime DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  `DateModified` datetime DEFAULT NULL,
  `TaskNoteID` int(11) DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TaskID`),
  KEY `IX_Relationship2` (`PriorityID`),
  KEY `IX_Relationship3` (`TaskStatusID`),
  KEY `IX_Relationship4` (`TaskNoteID`),
  KEY `AssignTo` (`AssignTo`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`PriorityID`) REFERENCES `taskpriority` (`TaskPriorityID`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`TaskStatusID`) REFERENCES `taskstatus` (`TaskStatusID`),
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`AssignTo`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `task_ibfk_5` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `task` */

insert  into `task`(`TaskID`,`Task`,`PriorityID`,`TaskStatusID`,`AssignTo`,`CreatedBy`,`DateCreated`,`DueDate`,`ModifiedBy`,`DateModified`,`TaskNoteID`,`ProjectID`) values 
(1,'afdaf',1,1,132,0,'2020-06-23 10:23:08','2020-06-23 15:26:00',NULL,NULL,NULL,1);

/*Table structure for table `taskdelegation` */

DROP TABLE IF EXISTS `taskdelegation`;

CREATE TABLE `taskdelegation` (
  `TaskDelegationID` int(10) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(10) DEFAULT NULL,
  `ProjectTeamID` int(10) DEFAULT NULL,
  `TaskStatusID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TaskDelegationID`),
  UNIQUE KEY `PK_TaskDelegation` (`TaskDelegationID`),
  KEY `IX_Relationship19` (`ProjectID`),
  KEY `IX_Relationship22` (`ProjectTeamID`),
  KEY `IX_Relationship23` (`TaskStatusID`),
  CONSTRAINT `Relationship_c19` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_c22` FOREIGN KEY (`ProjectTeamID`) REFERENCES `projectteam` (`ProjectTeamID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_c23` FOREIGN KEY (`TaskStatusID`) REFERENCES `taskstatus` (`TaskStatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `taskdelegation` */

/*Table structure for table `tasknote` */

DROP TABLE IF EXISTS `tasknote`;

CREATE TABLE `tasknote` (
  `TaskNoteID` int(11) NOT NULL AUTO_INCREMENT,
  `TaskNote` text DEFAULT NULL,
  `TaskID` int(11) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `ModifiedBy` int(11) DEFAULT NULL,
  `DateModified` datetime DEFAULT NULL,
  `TaskStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TaskNoteID`),
  KEY `IX_Relationship25` (`TaskStatusID`),
  CONSTRAINT `Relationship52` FOREIGN KEY (`TaskStatusID`) REFERENCES `taskstatus` (`TaskStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tasknote` */

/*Table structure for table `taskpriority` */

DROP TABLE IF EXISTS `taskpriority`;

CREATE TABLE `taskpriority` (
  `TaskPriorityID` int(10) NOT NULL AUTO_INCREMENT,
  `TaskPriority` varchar(50) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`TaskPriorityID`),
  UNIQUE KEY `PK_TaskPriority` (`TaskPriorityID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `taskpriority` */

insert  into `taskpriority`(`TaskPriorityID`,`TaskPriority`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Task Priority',0,'2019-12-06 11:51:08.997000',NULL,NULL);

/*Table structure for table `taskstatus` */

DROP TABLE IF EXISTS `taskstatus`;

CREATE TABLE `taskstatus` (
  `TaskStatusID` int(10) NOT NULL AUTO_INCREMENT,
  `TaskStatus` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TaskStatusID`),
  UNIQUE KEY `PK_TaskStatus` (`TaskStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `taskstatus` */

insert  into `taskstatus`(`TaskStatusID`,`TaskStatus`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Task Status 1',NULL,'2020-06-23 09:40:14',NULL,'2020-06-23 09:40:14');

/*Table structure for table `units` */

DROP TABLE IF EXISTS `units`;

CREATE TABLE `units` (
  `UnitID` int(10) NOT NULL AUTO_INCREMENT,
  `UnitName` varchar(50) DEFAULT NULL,
  `UnitCode` varchar(10) DEFAULT NULL,
  `DepartmentID` int(10) DEFAULT NULL,
  `StatusID` int(10) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`UnitID`),
  UNIQUE KEY `PK_Units` (`UnitID`),
  KEY `IX_Relationship6` (`DepartmentID`),
  KEY `IX_Relationship9` (`StatusID`),
  CONSTRAINT `Relationship6` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship9` FOREIGN KEY (`StatusID`) REFERENCES `statuses` (`StatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `units` */

insert  into `units`(`UnitID`,`UnitName`,`UnitCode`,`DepartmentID`,`StatusID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Construction Workers','UN100',5,1,NULL,'2020-06-23 09:40:30',NULL,'2020-06-23 09:40:30'),
(2,'Project Management','UN200',10,1,NULL,'2020-06-23 09:40:30',NULL,'2020-06-23 09:40:30'),
(3,'Civil/Site','UN30',8,1,NULL,'2020-06-23 09:40:30',NULL,'2020-06-23 09:40:30'),
(4,'Cleaners','UN400',9,1,NULL,'2020-06-23 09:40:30',NULL,'2020-06-23 09:40:30'),
(5,'Secretary','UN500',NULL,NULL,NULL,'2020-06-23 09:40:30',NULL,'2020-06-23 09:40:30'),
(6,'Security','UN600',NULL,NULL,NULL,'2020-06-23 09:40:30',NULL,'2020-06-23 09:40:30'),
(7,'IT Staff','UN700',NULL,NULL,NULL,'2020-06-23 09:40:30',NULL,'2020-06-23 09:40:30');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `UsersID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  PRIMARY KEY (`UsersID`),
  UNIQUE KEY `username` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`UsersID`,`UserName`,`Password`,`EmployeeID`,`StatusID`,`CreatedBy`) values 
(1,'keston@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99',125,1,0),
(3,'keston1@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99',128,1,0),
(4,'keston2@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99',129,1,0),
(5,'keston3@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99',124,1,0),
(6,'keston4@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99',126,1,0),
(7,'onyilo@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99',132,NULL,126),
(8,'saleemaboufakher@teamnigeria.com','5f4dcc3b5aa765d61d8327deb882cf99',133,1,126),
(9,NULL,'5f4dcc3b5aa765d61d8327deb882cf99',134,NULL,125),
(10,NULL,'5f4dcc3b5aa765d61d8327deb882cf99',135,NULL,125),
(11,NULL,'5f4dcc3b5aa765d61d8327deb882cf99',185,NULL,125),
(12,NULL,'5f4dcc3b5aa765d61d8327deb882cf99',186,NULL,125),
(13,NULL,'5f4dcc3b5aa765d61d8327deb882cf99',187,NULL,125);

/*Table structure for table `vacancy` */

DROP TABLE IF EXISTS `vacancy`;

CREATE TABLE `vacancy` (
  `VacancyID` int(11) NOT NULL AUTO_INCREMENT,
  `DeadLine` datetime NOT NULL,
  `DesignationID` int(11) NOT NULL,
  `Requirement` varchar(100) DEFAULT NULL,
  `ExperienceLevelID` int(11) NOT NULL,
  `ContractTypeID` int(11) NOT NULL,
  `EmploymentTypeID` int(11) NOT NULL,
  `JobDescription` text NOT NULL,
  `JobApplicationID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  `Title` varchar(150) DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `Slots` int(11) DEFAULT NULL,
  `QualificationID` int(11) DEFAULT NULL,
  `AmountFrom` float DEFAULT NULL,
  `AmountTo` float DEFAULT NULL,
  `isConfidential` char(1) DEFAULT NULL,
  `JobRequirements` text DEFAULT NULL,
  `Introduction` text DEFAULT NULL,
  `ProgrammeTypeID` int(11) DEFAULT NULL,
  `YearsofExperienceID` int(11) DEFAULT NULL,
  `StateID` int(11) DEFAULT NULL,
  `LGAID` int(11) DEFAULT NULL,
  PRIMARY KEY (`VacancyID`),
  UNIQUE KEY `VacancyID` (`VacancyID`),
  KEY `IX_Relationship922` (`ExperienceLevelID`),
  KEY `IX_Relationship1122` (`ContractTypeID`),
  KEY `IX_Relationship1222` (`EmploymentTypeID`),
  KEY `IX_Relationship1422` (`JobApplicationID`),
  CONSTRAINT `vacancy_ibfk_1` FOREIGN KEY (`ExperienceLevelID`) REFERENCES `experiencelevel` (`ExperienceLevelID`),
  CONSTRAINT `vacancy_ibfk_2` FOREIGN KEY (`ContractTypeID`) REFERENCES `contracttype` (`ContractTypeID`),
  CONSTRAINT `vacancy_ibfk_3` FOREIGN KEY (`EmploymentTypeID`) REFERENCES `employmenttype` (`EmploymentTypeID`),
  CONSTRAINT `vacancy_ibfk_4` FOREIGN KEY (`JobApplicationID`) REFERENCES `jobapplication` (`JobApplicationID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `vacancy` */

insert  into `vacancy`(`VacancyID`,`DeadLine`,`DesignationID`,`Requirement`,`ExperienceLevelID`,`ContractTypeID`,`EmploymentTypeID`,`JobDescription`,`JobApplicationID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`,`Title`,`LocationID`,`Slots`,`QualificationID`,`AmountFrom`,`AmountTo`,`isConfidential`,`JobRequirements`,`Introduction`,`ProgrammeTypeID`,`YearsofExperienceID`,`StateID`,`LGAID`) values 
(1,'2020-06-29 00:00:00',1,'Requirements',1,1,1,'Some of the highlights during this 3 year program include:\r\n\r\nBeing part of the future of electricity generation as Stanwell investigates innovative and flexible plant operation models.\r\nRotating across our sites (Stanwell Power Station, Tarong Power Station and Meandu Mine) and learning the ins and outs of our critical infrastructure.\r\nInvestigating and making recommendations to correct and/or prevent plant failures and promote long term plant health.\r\nBeing actively involved in the strategic planning of the Power Station and helping to balance improvement and maintenance costs with operational requirements.\r\nUtilising a variety of techniques to obtain and analyse plant health and performance data.\r\nParticipating in regular catch ups with your mentor to build your professional skills as well as an understanding of engineering projects across the organisation.\r\nWorking across a variety of other exciting projects, such as: pressure part remnant life assessments, outage work planning and participation and new system/plant installation or plant modifications.',NULL,NULL,'2020-06-26 11:39:41',NULL,'2020-06-26 11:39:41','Mechanical Engineering Graduate',NULL,NULL,NULL,NULL,NULL,'1','Is this position for you?\r\n\r\nTo make a meaningful contribution to our team, you will need:\r\n\r\nMechanical Engineering qualifications acceptable for Graduate Membership of the Institute of Engineers Australia.\r\nA personable attitude with a desire to build relationships across our diverse workforce.\r\nWell developed analytical, research and problem solving skills.\r\nStrong written and verbal communication skills.\r\nA passion for ongoing learning and development.\r\nSolid digital literacy skills, including the ability to adapt to new systems.\r\nWhat is in it for you?\r\n\r\nBe rewarded with above Award salary rates, supplemented by a generous incentive scheme.\r\nHave access to professional memberships as well as an online learning management system to continually support your development.\r\nTake advantage of our discounted gym memberships and health insurance, voluntary health check reimbursements, confidential EAP service access and various other exciting health and wellbeing initiatives.\r\nBe supported throughout your program by our mentors and subject matter experts.','Be part of the future of electricity generation in an exciting Mechanical Engineering Graduate Program that is designed to accelerate your career.',NULL,NULL,NULL,NULL),
(2,'2020-07-05 00:00:00',1,'Requirement',1,1,1,'Description',NULL,NULL,'2020-06-26 12:13:34',NULL,'2020-06-26 12:13:34','Vue JS Developer',NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),
(3,'2020-07-06 00:00:00',1,NULL,1,1,1,'This is the description',NULL,125,'2020-07-01 10:10:00',NULL,'2020-07-01 10:10:00','Tech Developer',1,5,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL),
(4,'2020-07-01 00:00:00',1,NULL,1,1,1,'Test job description',NULL,125,'2020-07-01 10:26:18',NULL,'2020-07-01 10:26:18','Test Vacancy',1,2,NULL,250000,300000,'0',NULL,NULL,NULL,NULL,NULL,NULL),
(5,'2020-07-20 00:00:00',1,NULL,1,1,1,'asdasdasdas',NULL,NULL,'2020-07-16 00:30:59',NULL,'2020-07-16 00:30:59','Software Developer',1,5,NULL,25000,45000,'1','asdasdasd','asdsadasdasda',1,1,NULL,NULL),
(6,'2020-07-18 00:00:00',1,NULL,1,1,1,'sdkdljklsdjklsdjksdklskdjlk',NULL,NULL,'2020-07-18 08:05:26',NULL,'2020-07-18 08:05:26','Test Vacancy',1,2,NULL,20000,30000,'1','sdkjskdljlkvjlcxvjlxckvjlvfvvcx','dkdsddslklskflsdjlsd',1,1,NULL,NULL),
(7,'2020-07-18 00:00:00',1,NULL,1,1,1,'asdasdasdasdasdddddasdasdasdasd',NULL,NULL,'2020-07-18 08:16:08',NULL,'2020-07-18 08:16:08','Test Vacancy 2',1,2,NULL,25000,35000,'1','asdasdasdwqeqeqasdasdasdasdasdd','asdasdasdasdasdasdsadsadad',1,1,4202,18);

/*Table structure for table `vacancyskills` */

DROP TABLE IF EXISTS `vacancyskills`;

CREATE TABLE `vacancyskills` (
  `VacancySkillID` int(11) NOT NULL AUTO_INCREMENT,
  `VacancyID` int(11) DEFAULT NULL,
  `SkillID` int(11) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `ModifiedBy` int(11) DEFAULT NULL,
  `DateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`VacancySkillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vacancyskills` */

/*Table structure for table `vehicle` */

DROP TABLE IF EXISTS `vehicle`;

CREATE TABLE `vehicle` (
  `VehicleID` int(6) NOT NULL AUTO_INCREMENT,
  `Make` varchar(15) DEFAULT NULL,
  `Model` varchar(15) DEFAULT NULL,
  `Type` varchar(15) DEFAULT NULL,
  `Year` varchar(15) DEFAULT NULL,
  `InitialMileage` int(10) DEFAULT NULL,
  `EngineTypeID` int(6) DEFAULT NULL,
  `HorsePower` int(6) DEFAULT NULL,
  `Color` varchar(15) DEFAULT NULL,
  `VIN` varchar(15) DEFAULT NULL,
  `LicensePlateNumber` varchar(15) DEFAULT NULL,
  `inService` tinyint(1) DEFAULT 0,
  `CreatedBy` int(6) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ModifiedBy` int(6) DEFAULT NULL,
  `DateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`VehicleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `vehicle` */

insert  into `vehicle`(`VehicleID`,`Make`,`Model`,`Type`,`Year`,`InitialMileage`,`EngineTypeID`,`HorsePower`,`Color`,`VIN`,`LicensePlateNumber`,`inService`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Honda','Accord','Japanese','2089',250,1,125,'Black','0124584542','787945120',NULL,0,'2020-06-08 10:17:10',NULL,'0000-00-00 00:00:00'),
(2,'Toyota','Corrolla','Sedan','2010',210,1,249,'Blue','143','YAB2344WD',NULL,0,'2020-06-08 10:20:54',NULL,'0000-00-00 00:00:00');

/*Table structure for table `vehiclebooking` */

DROP TABLE IF EXISTS `vehiclebooking`;

CREATE TABLE `vehiclebooking` (
  `VehicleBookingID` int(6) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(6) DEFAULT NULL,
  `VehicleID` int(6) DEFAULT NULL,
  `NumberOfTravellers` int(6) DEFAULT NULL,
  `DateFrom` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DateTo` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `PickupTime` time NOT NULL DEFAULT '00:00:00',
  `PickupAddress` text DEFAULT NULL,
  `DropoffAddress` text DEFAULT NULL,
  `Comment` text DEFAULT NULL,
  `RequestedBy` int(6) DEFAULT NULL,
  `NextApprovingOfficerID` int(6) DEFAULT NULL,
  `ApprovalStageID` int(6) DEFAULT 0,
  `CreatedBy` int(6) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ModifiedBy` int(6) DEFAULT NULL,
  `DateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`VehicleBookingID`),
  KEY `EmployeeID` (`EmployeeID`,`VehicleID`,`NextApprovingOfficerID`,`ApprovalStageID`),
  KEY `VehicleID` (`VehicleID`),
  CONSTRAINT `vehiclebooking_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `vehiclebooking_ibfk_2` FOREIGN KEY (`VehicleID`) REFERENCES `vehicle` (`VehicleID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `vehiclebooking` */

insert  into `vehiclebooking`(`VehicleBookingID`,`EmployeeID`,`VehicleID`,`NumberOfTravellers`,`DateFrom`,`DateTo`,`PickupTime`,`PickupAddress`,`DropoffAddress`,`Comment`,`RequestedBy`,`NextApprovingOfficerID`,`ApprovalStageID`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,133,1,3,'2020-06-09 00:00:00','2020-06-10 00:00:00','08:00:00','H and A Plaza','No. 54 Libito Crescent, Wuse 2','Please keep to time',NULL,NULL,NULL,0,'2020-06-08 10:20:58',NULL,'0000-00-00 00:00:00');

/*Table structure for table `vehicledriver` */

DROP TABLE IF EXISTS `vehicledriver`;

CREATE TABLE `vehicledriver` (
  `VehicleDriverID` int(6) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(6) DEFAULT NULL,
  `LicenseNumber` varchar(15) DEFAULT NULL,
  `IssueDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ExpirationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `License` text DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`VehicleDriverID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `vehicledriver_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `vehicledriver` */

insert  into `vehicledriver`(`VehicleDriverID`,`EmployeeID`,`LicenseNumber`,`IssueDate`,`ExpirationDate`,`License`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,132,'123456789','2019-05-08 00:00:00','2021-11-08 00:00:00','123456489',NULL,'2020-06-23 09:40:40',NULL,'2020-06-23 09:40:40');

/*Table structure for table `vehicleexpensecategory` */

DROP TABLE IF EXISTS `vehicleexpensecategory`;

CREATE TABLE `vehicleexpensecategory` (
  `VehicleExpenseCategoryID` int(6) NOT NULL AUTO_INCREMENT,
  `VehicleExpenseCategory` varchar(50) DEFAULT NULL,
  `FrequencyID` int(6) DEFAULT NULL,
  `ExpenseCost` float DEFAULT NULL,
  `CreatedBy` int(6) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ModifiedBy` int(6) DEFAULT NULL,
  `DateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`VehicleExpenseCategoryID`),
  KEY `FrequencyID` (`FrequencyID`),
  CONSTRAINT `vehicleexpensecategory_ibfk_1` FOREIGN KEY (`FrequencyID`) REFERENCES `frequency` (`FrequencyID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `vehicleexpensecategory` */

insert  into `vehicleexpensecategory`(`VehicleExpenseCategoryID`,`VehicleExpenseCategory`,`FrequencyID`,`ExpenseCost`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Repairs',3,15000,0,'2020-06-08 10:22:03',NULL,'0000-00-00 00:00:00');

/*Table structure for table `vehicleexpensetransactions` */

DROP TABLE IF EXISTS `vehicleexpensetransactions`;

CREATE TABLE `vehicleexpensetransactions` (
  `VehicleExpenseTransactionID` int(6) NOT NULL AUTO_INCREMENT,
  `VehicleID` int(6) DEFAULT NULL,
  `VehicleExpenseCategoryID` int(6) DEFAULT NULL,
  `Comment` text DEFAULT NULL,
  `CreatedBy` int(6) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ModifiedBy` int(6) DEFAULT NULL,
  `DateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`VehicleExpenseTransactionID`),
  KEY `VehicleID` (`VehicleID`),
  KEY `VehicleExpenseCategoryID` (`VehicleExpenseCategoryID`),
  CONSTRAINT `vehicleexpensetransactions_ibfk_1` FOREIGN KEY (`VehicleID`) REFERENCES `vehicle` (`VehicleID`),
  CONSTRAINT `vehicleexpensetransactions_ibfk_2` FOREIGN KEY (`VehicleExpenseCategoryID`) REFERENCES `vehicleexpensecategory` (`VehicleExpenseCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `vehicleexpensetransactions` */

insert  into `vehicleexpensetransactions`(`VehicleExpenseTransactionID`,`VehicleID`,`VehicleExpenseCategoryID`,`Comment`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,1,1,'This is a mandatory',0,'2020-06-08 10:22:34',NULL,'0000-00-00 00:00:00');

/*Table structure for table `vehicleincomecategory` */

DROP TABLE IF EXISTS `vehicleincomecategory`;

CREATE TABLE `vehicleincomecategory` (
  `VehicleIncomeCategoryID` int(6) NOT NULL AUTO_INCREMENT,
  `VehicleIncomeCategory` varchar(75) DEFAULT NULL,
  `Amount` float DEFAULT NULL,
  `CreatedBy` int(6) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ModifiedBy` int(6) DEFAULT NULL,
  `DateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`VehicleIncomeCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `vehicleincomecategory` */

insert  into `vehicleincomecategory`(`VehicleIncomeCategoryID`,`VehicleIncomeCategory`,`Amount`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Dropoffs',5000,0,'2020-06-08 10:22:50',NULL,'0000-00-00 00:00:00');

/*Table structure for table `vehicleincometransactions` */

DROP TABLE IF EXISTS `vehicleincometransactions`;

CREATE TABLE `vehicleincometransactions` (
  `VehicleIncomeTransactionID` int(6) NOT NULL AUTO_INCREMENT,
  `VehicleID` int(6) DEFAULT NULL,
  `VehicleIncomeCategoryID` int(6) DEFAULT NULL,
  `Comment` text DEFAULT NULL,
  `CreatedBy` int(6) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ModifiedBy` int(6) DEFAULT NULL,
  `DateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`VehicleIncomeTransactionID`),
  KEY `VehicleID` (`VehicleID`),
  KEY `VehicleIncomeCategoryID` (`VehicleIncomeCategoryID`),
  CONSTRAINT `vehicleincometransactions_ibfk_1` FOREIGN KEY (`VehicleID`) REFERENCES `vehicle` (`VehicleID`),
  CONSTRAINT `vehicleincometransactions_ibfk_2` FOREIGN KEY (`VehicleIncomeCategoryID`) REFERENCES `vehicleincomecategory` (`VehicleIncomeCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `vehicleincometransactions` */

insert  into `vehicleincometransactions`(`VehicleIncomeTransactionID`,`VehicleID`,`VehicleIncomeCategoryID`,`Comment`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,1,1,'Was a peaceful ride',0,'2020-06-08 10:23:14',NULL,'0000-00-00 00:00:00');

/*Table structure for table `vehiclepart` */

DROP TABLE IF EXISTS `vehiclepart`;

CREATE TABLE `vehiclepart` (
  `VehiclePartID` int(6) NOT NULL AUTO_INCREMENT,
  `VehiclePart` varchar(25) DEFAULT NULL,
  `Brand` varchar(25) DEFAULT NULL,
  `BrandRef` varchar(25) DEFAULT NULL,
  `OEM` varchar(25) DEFAULT NULL,
  `Cost` float DEFAULT NULL,
  `CustomDuty` float DEFAULT NULL,
  `Transport` float DEFAULT NULL,
  `Quantity` int(10) DEFAULT NULL,
  `CreatedBt` int(6) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ModifiedBy` int(6) DEFAULT NULL,
  `DateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`VehiclePartID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `vehiclepart` */

insert  into `vehiclepart`(`VehiclePartID`,`VehiclePart`,`Brand`,`BrandRef`,`OEM`,`Cost`,`CustomDuty`,`Transport`,`Quantity`,`CreatedBt`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Honda Wheel Bar','Honda','Hnd','Hnd123456789',25000,2500,1500,2,NULL,'2020-06-08 10:24:00',NULL,'0000-00-00 00:00:00');

/*Table structure for table `vehiclepartrequisition` */

DROP TABLE IF EXISTS `vehiclepartrequisition`;

CREATE TABLE `vehiclepartrequisition` (
  `VehiclePartRequisitionID` int(6) NOT NULL AUTO_INCREMENT,
  `VehicleID` int(6) DEFAULT NULL,
  `VehiclePartID` int(6) DEFAULT NULL,
  `Quantity` int(6) DEFAULT NULL,
  `Comment` text DEFAULT NULL,
  `RequestedBy` int(6) DEFAULT NULL,
  `NextApprovingOfficer` int(6) DEFAULT NULL,
  `CreatedBy` int(6) DEFAULT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ModifiedBy` int(6) DEFAULT NULL,
  `DateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`VehiclePartRequisitionID`),
  KEY `VehicleID` (`VehicleID`),
  KEY `VehiclePartID` (`VehiclePartID`),
  CONSTRAINT `vehiclepartrequisition_ibfk_1` FOREIGN KEY (`VehicleID`) REFERENCES `vehicle` (`VehicleID`),
  CONSTRAINT `vehiclepartrequisition_ibfk_2` FOREIGN KEY (`VehiclePartID`) REFERENCES `vehiclepart` (`VehiclePartID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `vehiclepartrequisition` */

insert  into `vehiclepartrequisition`(`VehiclePartRequisitionID`,`VehicleID`,`VehiclePartID`,`Quantity`,`Comment`,`RequestedBy`,`NextApprovingOfficer`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,1,1,2,'This is essential repairs',NULL,NULL,0,'2020-06-08 10:24:40',NULL,'0000-00-00 00:00:00');

/*Table structure for table `vendor` */

DROP TABLE IF EXISTS `vendor`;

CREATE TABLE `vendor` (
  `VendorID` int(10) NOT NULL AUTO_INCREMENT,
  `VendorName` varchar(50) DEFAULT NULL,
  `VendorCategoryID` int(10) DEFAULT NULL,
  `VendorPhysicalAddress` text DEFAULT NULL,
  `VendorEmail` varchar(50) DEFAULT NULL,
  `VendorPhoneNum` varchar(50) DEFAULT NULL,
  `TIN` varchar(30) DEFAULT NULL,
  `ContactPerson` varchar(50) DEFAULT NULL,
  `ContactEmail` varchar(50) DEFAULT NULL,
  `ContactPhone` varchar(50) DEFAULT NULL,
  `StatusID` int(10) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`VendorID`),
  UNIQUE KEY `PK_Vendor` (`VendorID`),
  KEY `IX_Relationship28` (`VendorCategoryID`),
  CONSTRAINT `Relationship_r28` FOREIGN KEY (`VendorCategoryID`) REFERENCES `vendorcategory` (`VendorCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `vendor` */

insert  into `vendor`(`VendorID`,`VendorName`,`VendorCategoryID`,`VendorPhysicalAddress`,`VendorEmail`,`VendorPhoneNum`,`TIN`,`ContactPerson`,`ContactEmail`,`ContactPhone`,`StatusID`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Test Vendor',1,'This is where i live.','testvendor@gmail.com','08148117066','tin-002211255','Keston Timson','kestontomson@gmail.com','08148117066',1,0,'2019-12-06 11:24:59.957000',NULL,NULL);

/*Table structure for table `vendorcategory` */

DROP TABLE IF EXISTS `vendorcategory`;

CREATE TABLE `vendorcategory` (
  `VendorCategoryID` int(10) NOT NULL AUTO_INCREMENT,
  `VendorCategory` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`VendorCategoryID`),
  UNIQUE KEY `PK_VendorCategory` (`VendorCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `vendorcategory` */

insert  into `vendorcategory`(`VendorCategoryID`,`VendorCategory`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Consultant',NULL,'2020-06-23 09:40:50',NULL,'2020-06-23 09:40:50'),
(2,'Equipment',NULL,'2020-06-23 09:40:50',NULL,'2020-06-23 09:40:50'),
(3,'Materials',NULL,'2020-06-23 09:40:50',NULL,'2020-06-23 09:40:50'),
(4,'Subcontractors',NULL,'2020-06-23 09:40:50',NULL,'2020-06-23 09:40:50'),
(5,'Supplies',NULL,'2020-06-23 09:40:50',NULL,'2020-06-23 09:40:50'),
(6,'Tax Agency',NULL,'2020-06-23 09:40:50',NULL,'2020-06-23 09:40:50'),
(7,'Utility',NULL,'2020-06-23 09:40:50',NULL,'2020-06-23 09:40:50');

/*Table structure for table `vendors` */

DROP TABLE IF EXISTS `vendors`;

CREATE TABLE `vendors` (
  `VendorID` int(10) NOT NULL AUTO_INCREMENT,
  `VendorCategoryID` int(10) DEFAULT NULL,
  `VendorName` varchar(100) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `TIN` varchar(100) DEFAULT NULL,
  `AccountNumber` varchar(15) DEFAULT NULL,
  `Bank` int(5) DEFAULT NULL,
  `StatusID` int(5) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`VendorID`),
  UNIQUE KEY `PK_Vendors` (`VendorID`),
  KEY `IX_Relationship_p36` (`VendorCategoryID`),
  KEY `IX_Relationship_p59` (`StatusID`),
  CONSTRAINT `Relationship_p36` FOREIGN KEY (`VendorCategoryID`) REFERENCES `vendorcategory` (`VendorCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship_p59` FOREIGN KEY (`StatusID`) REFERENCES `statuses` (`StatusID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `vendors` */

insert  into `vendors`(`VendorID`,`VendorCategoryID`,`VendorName`,`Address`,`TIN`,`AccountNumber`,`Bank`,`StatusID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,2,'BigView Logistics','Luvu Madaki, Nasarawa','0123456789','9876543210',1,1,NULL,'2020-06-23 09:40:52',NULL,'2020-06-23 09:40:52');

/*Table structure for table `vendortype` */

DROP TABLE IF EXISTS `vendortype`;

CREATE TABLE `vendortype` (
  `VendorTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `VendorType` varchar(50) DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT NULL,
  `DateCreated` timestamp(6) NULL DEFAULT NULL,
  `ModifiedBy` int(10) DEFAULT NULL,
  `DateModified` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`VendorTypeID`),
  UNIQUE KEY `PK_VendorType` (`VendorTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `vendortype` */

insert  into `vendortype`(`VendorTypeID`,`VendorType`,`CreatedBy`,`DateCreated`,`ModifiedBy`,`DateModified`) values 
(1,'Test Vendor Type',0,'2019-12-06 11:23:39.753000',NULL,NULL);

/*Table structure for table `workforce` */

DROP TABLE IF EXISTS `workforce`;

CREATE TABLE `workforce` (
  `WorkforceID` int(11) NOT NULL AUTO_INCREMENT,
  `WorkforceName` varchar(100) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`WorkforceID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `workforce` */

insert  into `workforce`(`WorkforceID`,`WorkforceName`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Confirmation',NULL,'2020-06-23 09:40:56',NULL,'2020-06-23 09:40:56'),
(2,'Conversion',NULL,'2020-06-23 09:40:56',NULL,'2020-06-23 09:40:56'),
(3,'Promotion',NULL,'2020-06-23 09:40:56',NULL,'2020-06-23 09:40:56'),
(4,'Termination',NULL,'2020-06-23 09:40:56',NULL,'2020-06-23 09:40:56'),
(5,'Deployment/Transfer',NULL,'2020-06-23 09:40:56',NULL,'2020-06-23 09:40:56');

/*Table structure for table `workforcehistory` */

DROP TABLE IF EXISTS `workforcehistory`;

CREATE TABLE `workforcehistory` (
  `HistoryID` int(11) NOT NULL AUTO_INCREMENT,
  `EffectiveDate` varchar(100) DEFAULT NULL,
  `Comments` varchar(1000) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `WorkforceOptionID` int(11) DEFAULT NULL,
  `OldGradeLevelID` int(11) DEFAULT NULL,
  `NewGradeLevelID` int(11) DEFAULT NULL,
  `date_posted` timestamp NOT NULL DEFAULT current_timestamp(),
  `posted_by` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`HistoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `workforcehistory` */

/*Table structure for table `workforceoptions` */

DROP TABLE IF EXISTS `workforceoptions`;

CREATE TABLE `workforceoptions` (
  `WorkforceOptionID` int(11) NOT NULL AUTO_INCREMENT,
  `WorkforceOption` varchar(100) DEFAULT NULL,
  `WorkforceID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`WorkforceOptionID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `workforceoptions` */

insert  into `workforceoptions`(`WorkforceOptionID`,`WorkforceOption`,`WorkforceID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Annual Promotion',3,NULL,'2020-06-23 09:40:58',NULL,'2020-06-23 09:40:58'),
(2,'Performance Promotion',3,NULL,'2020-06-23 09:40:58',NULL,'2020-06-23 09:40:58'),
(3,'Step Increase',3,NULL,'2020-06-23 09:40:58',NULL,'2020-06-23 09:40:58'),
(4,'Department to Department',5,NULL,'2020-06-23 09:40:58',NULL,'2020-06-23 09:40:58'),
(5,'Department to Branch',5,NULL,'2020-06-23 09:40:58',NULL,'2020-06-23 09:40:58'),
(6,'Branch to Branch',5,NULL,'2020-06-23 09:40:58',NULL,'2020-06-23 09:40:58'),
(7,'Resignation',4,NULL,'2020-06-23 09:40:58',NULL,'2020-06-23 09:40:58'),
(8,'Dismissal',4,NULL,'2020-06-23 09:40:58',NULL,'2020-06-23 09:40:58');

/*Table structure for table `year` */

DROP TABLE IF EXISTS `year`;

CREATE TABLE `year` (
  `YearID` int(11) NOT NULL AUTO_INCREMENT,
  `YearName` date DEFAULT NULL,
  `PayrollYearID` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`YearID`),
  KEY `IX_Relationship116` (`PayrollYearID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `year` */

insert  into `year`(`YearID`,`YearName`,`PayrollYearID`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'2020-01-01',NULL,NULL,'2020-06-23 09:41:05',NULL,'2020-06-23 09:41:05');

/*Table structure for table `years` */

DROP TABLE IF EXISTS `years`;

CREATE TABLE `years` (
  `year_id` int(11) NOT NULL AUTO_INCREMENT,
  `year_name` varchar(200) NOT NULL,
  `Description` varchar(1000) DEFAULT '0',
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  PRIMARY KEY (`year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `years` */

insert  into `years`(`year_id`,`year_name`,`Description`,`date_from`,`date_to`) values 
(1,'Year Name','Description','0007-12-20 00:00:00','0007-12-20 00:00:00'),
(2,'Year Name','Description',NULL,NULL),
(3,'Year Name','Description',NULL,NULL),
(4,'Year Name','Description',NULL,NULL),
(5,'Year Name','Description',NULL,NULL),
(6,'Year Name','Description',NULL,NULL),
(7,'Year Name','Description',NULL,NULL),
(8,'Year Name','Description',NULL,NULL),
(9,'Year Name','Description',NULL,NULL),
(10,'Year Name','Description',NULL,NULL),
(11,'Year Name','Description',NULL,NULL),
(12,'Year Name','Description',NULL,NULL),
(13,'Year Name','Description',NULL,NULL),
(14,'Year Name','Description',NULL,NULL);

/*Table structure for table `yearsofexperience` */

DROP TABLE IF EXISTS `yearsofexperience`;

CREATE TABLE `yearsofexperience` (
  `YearsofExperienceID` int(11) NOT NULL AUTO_INCREMENT,
  `YearsofExperience` varchar(50) NOT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifiedBy` int(11) DEFAULT NULL,
  `dateModified` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`YearsofExperienceID`),
  UNIQUE KEY `ExperienceLevel` (`YearsofExperience`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `yearsofexperience` */

insert  into `yearsofexperience`(`YearsofExperienceID`,`YearsofExperience`,`createdBy`,`dateCreated`,`modifiedBy`,`dateModified`) values 
(1,'Below 1 year',1,'2020-07-15 23:35:34',NULL,'2020-07-15 23:35:34'),
(2,'2 - 4 years',1,'2020-07-15 23:35:46',NULL,'2020-07-15 23:35:46'),
(3,'5 years',1,'2020-07-15 23:35:54',NULL,'2020-07-15 23:35:54'),
(4,'Above 5 years',1,'2020-07-15 23:36:07',NULL,'2020-07-15 23:36:07');

/* Function  structure for function  `formatDate` */

/*!50003 DROP FUNCTION IF EXISTS `formatDate` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `formatDate`(datetoFormat date) RETURNS varchar(400) CHARSET latin1
BEGIN
	return (select concat(MONTHNAME(datetoFormat),' ', DAYOFMONTH(datetoFormat),', ' , Year(datetoFormat)));
    END */$$
DELIMITER ;

/* Function  structure for function  `GenerateLeaveBody` */

/*!50003 DROP FUNCTION IF EXISTS `GenerateLeaveBody` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `GenerateLeaveBody`(applicationID int) RETURNS varchar(8000) CHARSET latin1
BEGIN
    
Declare leave_type, dteDatefrom, dteDateback, days_apply, reliever, department, branch , username, employeeID varchar(300);
SELECT `LeaveType`, formatDate(`DateFrom`), formatDate(`DateBack`), `NoDayApplied` ,
IFNULL(reliever.FullName,'***') , IFNULL(`DepartmentName`,'***'),  IFNULL(`BranchName`,'***'), e.FullName, la.EmployeeID
INTO leave_type, dteDatefrom,dteDateback, days_apply, reliever, department , branch , username, employeeID
FROM leaveapplication la INNER JOIN leavetype lt ON lt.LeaveTypeID = la.LeaveTypeID
INNER JOIN employee e ON e.EmployeeID = la.EmployeeID
LEFT JOIN `branches` b ON e.BranchID = b.BranchID
LEFT JOIN employee reliever ON reliever.EmployeeID = la.`RelieveOfficerID`
LEFT JOIN departments d ON d.DepartmentID = la.DepartmentID
WHERE LeaveApplicationID = applicationID;
set @body = concat('<table width=70% border=1 bordercolor=#666666>',
' <tr bgcolor=#333333>',
 '<td colspan=4 align=center class=style1><b>LEAVE APPLICATION INFORMATION </b></td>',
 '</tr>',
 '<tr>',
 '<td class=style1>Application ID</td>',
'<td>',applicationID,'</td>',
'<td class=style1>No. of Days</td>',
  -- '<td>',days_apply,'</td>',
 '</tr>',
 '<tr>',
'<td class=style1>Leave Applicant</td>',
 '<td>',username,'</td>',
'<td class=style1>Leave Type</td>',
  '<td>',leave_type,'</td>',
 '</tr>',
'<td class=style1>Department</td>',
 '<td>',department,'</td>',
'<td class=style1>Branch</td>',
 '</tr>',
 '<tr>',
 '<td ><span class=style1>Leave Start Date</span></td>',
 -- '<td>',dteDatefrom,'</td>',
'<td class=style1>To Be Relieved By </td>',
 '</tr>',
 '<tr>',
'<td class=style1>Leave Resumption Date</td>',
'<td class=style1>******</td>',
'<td>*****</td>',
 '</tr>',
'</table>');
return @body;
    END */$$
DELIMITER ;

/* Function  structure for function  `GenerateLeaveStyle` */

/*!50003 DROP FUNCTION IF EXISTS `GenerateLeaveStyle` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `GenerateLeaveStyle`() RETURNS varchar(1000) CHARSET latin1
begin
return (select concat('<style type=text/css>',
'<!--',
'.style1 {color: #FFFFFF;background-color:#333333;text-align:center;  }',
'-->',
'</style>'));
    END */$$
DELIMITER ;

/* Function  structure for function  `GetApplicationUrl` */

/*!50003 DROP FUNCTION IF EXISTS `GetApplicationUrl` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `GetApplicationUrl`() RETURNS varchar(300) CHARSET latin1
BEGIN
	return (select 'http://localhost:4200/#');
    END */$$
DELIMITER ;

/* Function  structure for function  `GetApprovalStageID` */

/*!50003 DROP FUNCTION IF EXISTS `GetApprovalStageID` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `GetApprovalStageID`(intapproverID INT) RETURNS int(11)
BEGIN
	return (select `ApprovalStageID` from designations d, `designationcategory` s 
	where d.`SupervisorTypeID`= s.`DesignationCategoryID` and `DesignationID`= GetDesignationID(intapproverID));
    END */$$
DELIMITER ;

/* Function  structure for function  `GetDesignationID` */

/*!50003 DROP FUNCTION IF EXISTS `GetDesignationID` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `GetDesignationID`(intapproverID INT) RETURNS int(11)
BEGIN
	return (select `DesignationID` from employee where EmployeeID=intapproverID);
    END */$$
DELIMITER ;

/* Function  structure for function  `GetEmployeeEmail` */

/*!50003 DROP FUNCTION IF EXISTS `GetEmployeeEmail` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `GetEmployeeEmail`(EmpId int) RETURNS varchar(1000) CHARSET latin1
BEGIN
	return (Select Email from employee where EmployeeID=EmpId);
    END */$$
DELIMITER ;

/* Function  structure for function  `GetEmployeeName` */

/*!50003 DROP FUNCTION IF EXISTS `GetEmployeeName` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `GetEmployeeName`(EmpId int) RETURNS varchar(1000) CHARSET latin1
BEGIN
	return (Select FullName from employee where EmployeeID=EmpId);
    END */$$
DELIMITER ;

/* Function  structure for function  `GetNextAdminApprovalStageID` */

/*!50003 DROP FUNCTION IF EXISTS `GetNextAdminApprovalStageID` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `GetNextAdminApprovalStageID`(processNo int,processModuleID INT) RETURNS int(11)
BEGIN
	return (Select approval_stages.approvestage_id from `approvalstages` approval_stages, `approvalprocessflow` Approval_ProcessFlow 
		where approval_stages.`ApprovalStagesID` = Approval_ProcessFlow.`ApprovalStagesID` 
		and `StatusID` =1 and `SequenceNo`>processNo and `ApprovalProcessTypeID`>1 and `ApprovalProcessModuleID` = processModuleID order by `SequenceNo` Limit 1);
    END */$$
DELIMITER ;

/* Function  structure for function  `GetNextProcessNo` */

/*!50003 DROP FUNCTION IF EXISTS `GetNextProcessNo` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `GetNextProcessNo`(curProcessNo int,processModuleID INT) RETURNS int(11)
BEGIN
	return (select min(SequenceNo) from `approvalstages` approval_stages, `approvalprocessflow`  Approval_ProcessFlow 
		where approval_stages.`ApprovalStagesID` = Approval_ProcessFlow.`ApprovalStagesID` 
		and `StatusID` =1 and `SequenceNo`> curProcessNo and `ApprovalProcessModuleID` = processModuleID limit 1);
    END */$$
DELIMITER ;

/* Function  structure for function  `GetNextProcessTypeID` */

/*!50003 DROP FUNCTION IF EXISTS `GetNextProcessTypeID` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `GetNextProcessTypeID`(curProcessNo int,processModuleID INT) RETURNS int(11)
BEGIN
	return (select `ApprovalProcessTypeID` from `approvalstages` approval_stages, `approvalprocessflow` Approval_ProcessFlow 
		where approval_stages.ApprovalStagesID = Approval_ProcessFlow.ApprovalStagesID 
		and `StatusID` =1 and `SequenceNo`> curProcessNo and `ApprovalProcessModuleID` = processModuleID limit 1);
    END */$$
DELIMITER ;

/* Function  structure for function  `GetNextSuperAdminApprovalStageID` */

/*!50003 DROP FUNCTION IF EXISTS `GetNextSuperAdminApprovalStageID` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `GetNextSuperAdminApprovalStageID`(processNo int,processModuleID INT) RETURNS int(11)
BEGIN
	return (select  approval_stages.`ApprovalStagesID` from `approvalstages` approval_stages, `approvalprocessflow` Approval_ProcessFlow 
		where approval_stages.`ApprovalStagesID` = Approval_ProcessFlow.`ApprovalStagesID` 
		and `StatusID` =1 and `SequenceNo`> processNo and processTypeID=4 and `ApprovalProcessModuleID` = processModuleID order by `SequenceNo`);
    END */$$
DELIMITER ;

/* Function  structure for function  `GetProcessModuleMaxApproveCount` */

/*!50003 DROP FUNCTION IF EXISTS `GetProcessModuleMaxApproveCount` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `GetProcessModuleMaxApproveCount`(processModuleID INT) RETURNS int(11)
BEGIN
	return (select `MaxApprovalCount` from `approvalprocessmodule` where `ApprovalProcessModuleID`= processModuleID);
    END */$$
DELIMITER ;

/* Function  structure for function  `GetProcessNo` */

/*!50003 DROP FUNCTION IF EXISTS `GetProcessNo` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `GetProcessNo`(approvalstage_id int, processModuleID int) RETURNS int(11)
BEGIN
	return (select `SequenceNo` from `approvalprocessflow` where `ApprovalStagesID`=approvalstage_id and `ApprovalProcessModuleID`=processModuleID and `StatusID` = 1
		Limit 1
	);
    END */$$
DELIMITER ;

/* Function  structure for function  `GetProcessTypeID` */

/*!50003 DROP FUNCTION IF EXISTS `GetProcessTypeID` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `GetProcessTypeID`(curProcessNo INT, processModuleID INT) RETURNS int(11)
BEGIN
	return (SELECT ApprovalProcessTypeID FROM `approvalstages` approval_stages,`approvalprocessflow` Approval_ProcessFlow 
		WHERE approval_stages.`ApprovalStagesID` = Approval_ProcessFlow.ApprovalStagesID 
		AND `StatusID` =1 AND `SequenceNo`=curProcessNo AND `ApprovalProcessModuleID` = processModuleID limit 1);
    END */$$
DELIMITER ;

/* Function  structure for function  `GetWorkDays` */

/*!50003 DROP FUNCTION IF EXISTS `GetWorkDays` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `GetWorkDays`(dateFrom DATETIME, dateTo DATETIME) RETURNS int(11)
BEGIN
		RETURN (SELECT
     COUNT(*) 
FROM
     calendar
WHERE
     calendar_date BETWEEN dateFrom AND dateTo AND
     is_holiday = 0 AND
     is_weekend = 0);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Activate_Privilege` */

/*!50003 DROP PROCEDURE IF EXISTS  `Activate_Privilege` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `Activate_Privilege`(IN PrivHeadID INT)
BEGIN
             DECLARE PrivID , approveClassID INT;
                CREATE TEMPORARY TABLE empIds(emp INT);
                
SET PrivID = (SELECT privilegesID FROM privilegesheader WHERE PrivilegesHeaderID = PrivHeadID);
SET approveClassID =  (SELECT privilegesclassID FROM privilegesheader WHERE PrivilegesHeaderID = PrivHeadID);
                
UPDATE PrivilegesHeader
SET Stageid = 3
WHERE PrivilegesHeaderID = PrivHeadID;
UPDATE privilegesdetails SET statusID = 1 WHERE PrivilegesHeaderID = PrivHeadID;
IF approveClassID = 2 THEN
INSERT INTO empIDs 
SELECT EmployeeID FROM vprivilegedetails WHERE PrivilegesHeaderID = PrivHeadID;
UPDATE privilegesdetails, privilegesheader
SET statusID = 2
WHERE privilegesheader.`PrivilegesHeaderID` =  privilegesdetails.`PrivilegesHeaderID` 
AND PrivilegesClassID = 1 AND 
statusID = 1 AND PrivilegesID = PrivID
AND EmployeeID IN (SELECT emp FROM empIds);
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `cancel_payroll` */

/*!50003 DROP PROCEDURE IF EXISTS  `cancel_payroll` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `cancel_payroll`(IN `payrollMonthID` INT, IN `CategoryID` INT)
BEGIN
	
	DELETE payrollgenerated, payrollgenerateddetail 
	FROM payrollgenerated, payrollgenerateddetail
	WHERE payrollgenerateddetail.`PayrollGeneratedID` = payrollgenerated.`PayrollGeneratedID`
	AND  payrollgenerated.PayrollID = payrollMonthID AND payrollgenerated.PayrollCategoryID =CategoryID;
	DELETE FROM payrollgenerated where
	payrollgenerated.PayrollID = payrollMonthID AND payrollgenerated.PayrollCategoryID =CategoryID;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `filldates` */

/*!50003 DROP PROCEDURE IF EXISTS  `filldates` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `filldates`(dateStart DATE, dateEnd DATE)
BEGIN
DECLARE adate date;
    WHILE dateStart <= dateEnd DO
        SET adate = (SELECT calendar_date FROM calendar WHERE calendar_date = dateStart);
        IF adate IS NULL THEN BEGIN
            INSERT INTO calendar (calendar_date, is_holiday, is_weekend) VALUES (dateStart, 0, CASE when dayofweek(dateStart) in (1,7) then 1 else 0 end  );
        END; END IF;
        SET dateStart = date_add(dateStart, INTERVAL 1 DAY);
    END WHILE;
END */$$
DELIMITER ;

/* Procedure structure for procedure `leavedays` */

/*!50003 DROP PROCEDURE IF EXISTS  `leavedays` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `leavedays`()
BEGIN
	SELECT
    `emp`.`EmployeeID` AS `EmployeeID`,
    `emp`.`FullName` AS `FullName`,
    `emp`.`LeaveType` AS `LeaveType`,
    `emp`.`LeaveTypeID` AS `LeaveTypeID`,
    `lea`.`YearID` AS `YearID`,
    `lea`.`NoDayEntitled` AS `NoDayEntitled`,
    IFNULL(`b`.`NoDayApproved`, 0) AS `NoUsed`,
    `lea`.`NoDayEntitled` - IFNULL(`b`.`NoDayApproved`, 0) AS `DaysLeft`
  FROM
    (
      (
        (
          (SELECT
            `teamerp`.`employee`.`EmployeeID` AS `EmployeeID`,
            `teamerp`.`employee`.`FullName` AS `FullName`,
            `teamerp`.`leavetype`.`LeaveType` AS `LeaveType`,
            `teamerp`.`leavetype`.`LeaveTypeID` AS `LeaveTypeID`
          FROM
            (
              `teamerp`.`employee`
              JOIN `teamerp`.`leavetype`
            ))
        ) `emp`
        JOIN `teamerp`.`leaveemployeeapplication` `lea`
          ON (
            `lea`.`EmployeeID` = `emp`.`EmployeeID`
            AND `lea`.`LeaveTypeID` = `emp`.`LeaveTypeID`
          )
      )
      LEFT JOIN
        (SELECT
          `l`.`EmployeeID` AS `EmployeeID`,
          `l`.`YearID` AS `YearID`,
          `l`.`LeaveTypeID` AS `LeaveTypeID`,
          SUM(`l`.`NoDayApplied`) AS `NoDayApproved`
        FROM
          `teamerp`.`leaveapplication` `l`
        WHERE `l`.`ApprovalStageID` = 14
        GROUP BY `l`.`EmployeeID`,
          `l`.`LeaveTypeID`,
          `l`.`YearID`) `b`
        ON (
          `b`.`YearID` = `lea`.`YearID`
          AND `b`.`EmployeeID` = `emp`.`EmployeeID`
          AND `b`.`LeaveTypeID` = `emp`.`LeaveTypeID`
        )
    )
  WHERE `lea`.`YearID` IN
    (SELECT
      `teamerp`.`payrollyear`.`PayrollYearID`
    FROM
      `teamerp`.`payrollyear`
    WHERE CURDATE() BETWEEN `teamerp`.`payrollyear`.`DateFrom`
      AND `teamerp`.`payrollyear`.`DateTo`) ;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `leavedaysByEmployee` */

/*!50003 DROP PROCEDURE IF EXISTS  `leavedaysByEmployee` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `leavedaysByEmployee`(in id int, in days int)
BEGIN
	SELECT
    `emp`.`EmployeeID` AS `EmployeeID`,
    `emp`.`FullName` AS `FullName`,
    `emp`.`LeaveType` AS `LeaveType`,
    `emp`.`LeaveTypeID` AS `LeaveTypeID`,
    `lea`.`YearID` AS `YearID`,
    `lea`.`NoDayEntitled` AS `NoDayEntitled`,
    IFNULL(`b`.`NoDayApproved`, 0) AS `NoUsed`,
    `lea`.`NoDayEntitled` - IFNULL(`b`.`NoDayApproved`, 0) AS `DaysLeft`
  FROM
    (
      (
        (
          (SELECT
            `teamerp`.`employee`.`EmployeeID` AS `EmployeeID`,
            `teamerp`.`employee`.`FullName` AS `FullName`,
            `teamerp`.`leavetype`.`LeaveType` AS `LeaveType`,
            `teamerp`.`leavetype`.`LeaveTypeID` AS `LeaveTypeID`
          FROM
            (
              `teamerp`.`employee`
              JOIN `teamerp`.`leavetype`
            ))
        ) `emp`
        JOIN `teamerp`.`leaveemployeeapplication` `lea`
          ON (
            `lea`.`EmployeeID` = `emp`.`EmployeeID`
            AND `lea`.`LeaveTypeID` = `emp`.`LeaveTypeID`
          )
      )
      LEFT JOIN
        (SELECT
          `l`.`EmployeeID` AS `EmployeeID`,
          `l`.`YearID` AS `YearID`,
          `l`.`LeaveTypeID` AS `LeaveTypeID`,
          SUM(`l`.`NoDayApplied`) AS `NoDayApproved`
        FROM
          `teamerp`.`leaveapplication` `l`
        WHERE `l`.`ApprovalStageID` = 14
        GROUP BY `l`.`EmployeeID`,
          `l`.`LeaveTypeID`,
          `l`.`YearID`) `b`
        ON (
          `b`.`YearID` = `lea`.`YearID`
          AND `b`.`EmployeeID` = `emp`.`EmployeeID`
          AND `b`.`LeaveTypeID` = `emp`.`LeaveTypeID`
        )
    )
  WHERE `lea`.`YearID` IN
    (SELECT
      `teamerp`.`payrollyear`.`PayrollYearID`
    FROM
      `teamerp`.`payrollyear`
    WHERE CURDATE() BETWEEN `teamerp`.`payrollyear`.`DateFrom`
      AND `teamerp`.`payrollyear`.`DateTo`) 
      
      and `lea`.`NoDayEntitled` - IFNULL(`b`.`NoDayApproved`, 0) >= days
      and `emp`.EmployeeID = id;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `process_payroll` */

/*!50003 DROP PROCEDURE IF EXISTS  `process_payroll` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `process_payroll`(IN `payrollMonthID` INT, IN `CategoryID` INT)
BEGIN
	 -- Log all Employees
	    INSERT INTO `payrollgenerated`(`PayrollID`,PayrollCategoryID,`EmployeeID`,`GradeID`,`GradeLevelID`,`UnitID`,`CompanyID`,`BranchID`,`DepartmentID`,`DesignationID`,`EmployeeTypeID`,`PensionProviderID`, `BankID`,`BankAccountNo`)
	    SELECT payrollMonthID,CategoryID, `EmployeeID`,`GradeID`,`GradeLevelID`,`UnitID`,`CompanyID`,`BranchID`,`DepartmentID`,`DesignationID`,`EmployeeTypeID`,`PensionProviderID`, `BankID`,`BankAccountNo` FROM employee
	    WHERE StatusID = 1;
	    
	    -- Log all Earnings
	    INSERT INTO `payrollgenerateddetail`(PayrollGeneratedID, SalaryComponentID, Credit, Debit, Amount)
	    SELECT PayrollGeneratedID, sf.`SalaryComponentID`,
	    pc.Percentage/100.0* sf.Percentage/100.0* gl.AnnualSalary/12.0 AS credit_amount,
	    0 debit_amount , pc.Percentage/100.0* sf.Percentage/100.0* gl.AnnualSalary/12.0  AS amount 
	    FROM `salaryformulae` sf
	    INNER JOIN `salarycomponent` sc ON sf.`SalaryComponentID` = sc.`SalaryComponentID`
	    INNER JOIN payrollcategory pc ON pc.`PayrollCategoryID` = sf.`PayrollCategoryID`
	    INNER JOIN gradelevels gl ON gl.GradeLevelID = sf.GradeLevelID
	    INNER JOIN `payrollgenerated` e ON sf.GradeLevelID = e.GradeLevelID AND e.PayrollCategoryID = sf.PayrollCategoryID
	    WHERE SalaryTypeID IN (1) AND PayrollID = payrollMonthID AND sf.PayrollCategoryID=CategoryID;
	    
	    -- Log all Deductions
	    INSERT INTO `payrollgenerateddetail`(PayrollGeneratedID, SalaryComponentID, Debit, Credit, Amount)
	    SELECT PayrollGeneratedID, sf.`SalaryComponentID`,
	    pc.Percentage/100.0* sf.Percentage/100.0* gl.AnnualSalary/12.0 AS credit_amount,
	    0 debit_amount , -pc.Percentage/100.0* sf.Percentage/100.0* gl.AnnualSalary/12.0  AS amount 
	    FROM `salaryformulae` sf
	    INNER JOIN `salarycomponent` sc ON sf.`SalaryComponentID` = sc.`SalaryComponentID`
	    INNER JOIN payrollcategory pc ON pc.`PayrollCategoryID` = sf.`PayrollCategoryID`
	    INNER JOIN gradelevels gl ON gl.GradeLevelID = sf.GradeLevelID
	    INNER JOIN `payrollgenerated` e ON sf.GradeLevelID = e.GradeLevelID AND e.PayrollCategoryID = sf.PayrollCategoryID
	    WHERE SalaryTypeID IN (2) AND PayrollID = payrollMonthID AND sf.PayrollCategoryID=CategoryID;
	    
	    -- Log all Reliefs
	    INSERT INTO `payrollgenerateddetail`(PayrollGeneratedID, SalaryComponentID, Credit, Debit, Amount)
	    SELECT PayrollGeneratedID, sf.`SalaryComponentID`,
	    pc.Percentage/100.0* sf.Percentage/100.0* gl.AnnualSalary/12.0 AS credit_amount,
	    0 debit_amount , pc.Percentage/100.0* sf.Percentage/100.0* gl.AnnualSalary/12.0  AS amount 
	    FROM `salaryformulae` sf
	    INNER JOIN `salarycomponent` sc ON sf.`SalaryComponentID` = sc.`SalaryComponentID`
	    INNER JOIN payrollcategory pc ON pc.`PayrollCategoryID` = sf.`PayrollCategoryID`
	    INNER JOIN gradelevels gl ON gl.GradeLevelID = sf.GradeLevelID
	    INNER JOIN `payrollgenerated` e ON sf.GradeLevelID = e.GradeLevelID AND e.PayrollCategoryID = sf.PayrollCategoryID
	    WHERE SalaryTypeID IN (3) AND PayrollID = payrollMonthID AND sf.PayrollCategoryID=CategoryID;
	    
	    -- Log Salary Variables Earnings
	    INSERT INTO `payrollgenerateddetail`(PayrollGeneratedID, SalaryComponentID, Credit, Debit, Amount)
	    SELECT PayrollGeneratedID, sf.`SalaryComponentID`, Amount,0 debit_amount ,  Amount 
	    FROM `salaryvariable` sf
	    INNER JOIN `salarycomponent` sc ON sf.`SalaryComponentID` = sc.`SalaryComponentID`
	    INNER JOIN `payrollgenerated` e ON sf.EmployeeID = e.EmployeeID
	    WHERE SalaryTypeID IN (1,3) AND PayrollID = payrollMonthID AND PayrollCategoryID=CategoryID
		and (PayrollPeriodID = payrollMonthID or VariableTypeID = 1) and sf.StatusID =1
	    ;
	    
	    -- Log Salary Variables Deductions
	    INSERT INTO `payrollgenerateddetail`(PayrollGeneratedID, SalaryComponentID,  Debit, Credit, Amount)
	    SELECT PayrollGeneratedID, sf.`SalaryComponentID`, Amount,0 debit_amount ,  -Amount 
	    FROM `salaryvariable` sf
	    INNER JOIN `salarycomponent` sc ON sf.`SalaryComponentID` = sc.`SalaryComponentID`
	    INNER JOIN `payrollgenerated` e ON sf.EmployeeID = e.EmployeeID
	    WHERE SalaryTypeID IN (2) AND PayrollID = payrollMonthID AND PayrollCategoryID=CategoryID
	    AND (PayrollPeriodID = payrollMonthID OR VariableTypeID = 1) AND sf.StatusID =1;
	    
	    update payrollgenerateddetail inner join  `payrollgenerated` ON payrollgenerateddetail.PayrollGeneratedID = payrollgenerated.PayrollGeneratedID
	    set payrollgenerateddetail.Debit = 200000.0/12, payrollgenerateddetail.Amount = 200000.0/12
	    where SalaryComponentID = 11 and  PayrollID = payrollMonthID AND PayrollCategoryID=CategoryID;
	    
	    -- Log Taxes
	    INSERT INTO `payrollgenerateddetail`(PayrollGeneratedID, SalaryComponentID, Credit, Debit, Amount)
		SELECT PayrollGeneratedID, 9,0,
		CASE
			WHEN SUM(amount)*12<=250000 THEN (SUM(amount)*12*0.01)/12
		    WHEN SUM(taxableamount)*12<=300000.00 THEN (SUM(taxableamount)*12*0.07)/12
		    WHEN SUM(taxableamount)*12<=600000 THEN (300000*0.07 + (SUM(taxableamount)*12-300000)*0.11)/12
		    WHEN SUM(taxableamount)*12<=1100000 THEN (300000*0.07 + 300000*0.11 + (SUM(taxableamount)*12-600000)*0.15)/12
		    WHEN SUM(taxableamount)*12<=1600000 THEN (300000*0.07 + 300000*0.11 + 500000*0.15 + (SUM(taxableamount)*12-1100000)*0.19)/12
		    WHEN SUM(taxableamount)*12<=3200000 THEN (300000*0.07 + 300000*0.11 + 500000*0.15 + 500000*0.19 + (SUM(taxableamount)*12-1600000)*0.21)/12
		    WHEN SUM(taxableamount)*12>3200000 THEN (300000*0.07 + 300000*0.11 + 500000*0.15 + 500000*0.19 +1600000*0.21+ (SUM(taxableamount)*12-3200000)*0.24)/12
		    ELSE 0 END AS PAYE,
		    -CASE
		    WHEN SUM(amount)*12<=250000 THEN (SUM(amount)*12*0.01)/12
		    WHEN SUM(taxableamount)*12<=300000 THEN (SUM(taxableamount)*12*0.07)/12
		    WHEN SUM(taxableamount)*12<=600000 THEN (300000*0.07 + (SUM(taxableamount)*12-300000)*0.11)/12
		    WHEN SUM(taxableamount)*12<=1100000 THEN (300000*0.07 + 300000*0.11 + (SUM(taxableamount)*12-600000)*0.15)/12
		    WHEN SUM(taxableamount)*12<=1600000 THEN (300000*0.07 + 300000*0.11 + 500000*0.15 + (SUM(taxableamount)*12-1100000)*0.19)/12
		    WHEN SUM(taxableamount)*12<=3200000 THEN (300000*0.07 + 300000*0.11 + 500000*0.15 + 500000*0.19 + (SUM(taxableamount)*12-1600000)*0.21)/12
		    WHEN SUM(taxableamount)*12>3200000 THEN (300000*0.07 + 300000*0.11 + 500000*0.15 + 500000*0.19 +1600000*0.21+ (SUM(taxableamount)*12-3200000)*0.24)/12
		    ELSE 0 END AS PAYE2
		FROM (
		SELECT pp.`PayrollGeneratedID`, SUM(Amount) taxableamount,  SUM(Amount) amount FROM payrollgenerated pp
		INNER JOIN `payrollcategory` pc ON pc.`PayrollCategoryID`= pp.`PayrollCategoryID`
		INNER JOIN `payrollgenerateddetail` ppc ON pp.`PayrollGeneratedID`= ppc.`PayrollGeneratedID`
		INNER JOIN `salarycomponent` sc ON ppc.`SalaryComponentID`=sc.`SalaryComponentID`
		WHERE SalaryTypeID = 1 AND `SalaryTaxStatusID`=1 AND pc.`PayrollCategoryID`=1 AND PayrollID = payrollMonthID AND pp.PayrollCategoryID=CategoryID
		GROUP BY pp.`PayrollGeneratedID`
		UNION ALL
		SELECT  pp.`PayrollGeneratedID`, SUM(amount),0 FROM payrollgenerated pp
		INNER JOIN `payrollcategory` pc ON pc.`PayrollCategoryID`= pp.`PayrollCategoryID`
		INNER JOIN `payrollgenerateddetail` ppc ON pp.`PayrollGeneratedID`= ppc.`PayrollGeneratedID`
		INNER JOIN `salarycomponent` sc ON ppc.`SalaryComponentID`=sc.`SalaryComponentID`
		WHERE SalaryTypeID = 2 AND `SalaryTaxStatusID`=4 AND pc.`PayrollCategoryID`=1 AND PayrollID = payrollMonthID AND pp.PayrollCategoryID=CategoryID
		GROUP BY pp.`PayrollGeneratedID`
		UNION ALL
		SELECT  pp.`PayrollGeneratedID`, 0-SUM(amount),0 FROM payrollgenerated pp
		INNER JOIN `payrollcategory` pc ON pc.`PayrollCategoryID`= pp.`PayrollCategoryID`
		INNER JOIN `payrollgenerateddetail` ppc ON pp.`PayrollGeneratedID`= ppc.`PayrollGeneratedID`
		INNER JOIN `salarycomponent` sc ON ppc.`SalaryComponentID`=sc.`SalaryComponentID`
		WHERE SalaryTypeID = 3 AND `SalaryTaxStatusID`=5 AND pc.`PayrollCategoryID`=1 AND PayrollID = payrollMonthID AND pp.PayrollCategoryID=CategoryID
		GROUP BY pp.`PayrollGeneratedID`
		) A
		GROUP BY `PayrollGeneratedID`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_leaveapprove` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_leaveapprove` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `proc_leaveapprove`(in LeaveApproveID int)
BEGIN
	DECLARE applicationID, approvalCount, intApprovingOfficerID, approveID INT;
	DECLARE approveTypeID , nextapproverID, totalApprovalCount INT;
	DECLARE username, email, reason, Sender VARCHAR(500);
	DECLARE curProcessNo , nextProcessNo , nextProcessTypeID, nextApprovalStageID, processModuleID, approvalstageID, empID INT;
	
	
	SET @approvalString = null;
	Set @isApproverMail =0;
	Set @CompletedMail = 0;
	Set @HRMail = 0;
	Set @smartgeturlhost = GetApplicationUrl();
	
	CREATE TEMPORARY TABLE if not exists mails(`to` VARCHAR(3000), bcc VARCHAR(3000), cc VARCHAR(3000), `subject` VARCHAR(3000), body VARCHAR(8000));
	
	SET processModuleID = 1;
	
	SELECT ApprovalTypeID, `ApprovalStagesID`
	into approveTypeID, approvalstageID 
	FROM `leaveapproval` leave_approve, `approvalinstances` approvalmaster
	WHERE leave_approve.`ApprovalInstancesID` = approvalmaster.ApprovalInstancesID AND `LeaveApprovalID` = LeaveApproveID;
	SELECT `ApprovedBy`, IFNULL(`NextApprovalOfficerID`,0), IFNULL(`Comment`,'***'), `LeaveApplicationID`
	INTO intApprovingOfficerID, nextapproverID, reason , applicationID
	from leaveapproval leave_approve where LeaveApprovalID  = LeaveApproveID;
	SET approvalCount = (SELECT count(*)
		FROM leaveapproval leave_approve, approvalinstances approvalmaster, `approvalprocessflow` approval_processFlow
		where leave_approve.ApprovalInstancesID = approvalmaster.ApprovalInstancesID and approvalmaster.`ApprovalStagesID` = approval_processFlow.ApprovalStagesID 
		and `ApprovalTypeID` = 1 and LeaveApplicationID = applicationID);
	set @strApprovingOfficer = GetEmployeeName(intApprovingOfficerID);
	set @Approver2 = GetEmployeeName(nextapproverID);
	set @Approver2Email = GetEmployeeEmail(nextapproverID);
	
	SELECT EmployeeID, GetEmployeeName(EmployeeID), GetEmployeeEmail(EmployeeID) into  empID, username, email
	FROM leaveapplication where `LeaveApplicationID`= applicationID;
	
	
	 -- Leave Process
	set curProcessNo = GetProcessNo(approvalStageID,processModuleID);
	set nextProcessNo = GetNextProcessNo(curProcessNo,processModuleID);
	set nextProcessTypeID  = GetProcessTypeID(nextProcessNo, processModuleID);
	SET totalApprovalCount = GetProcessModuleMaxApproveCount(processModuleID);
	
	If approveTypeID = 1 then
	
		SET @approvalString ='approved';
		 
		if nextProcessTypeID > 1 OR approvalCount >= totalApprovalCount  then
		
			update leaveapplication 
			set ApprovalStageID = GetNextAdminApprovalStageID(curProcessNo, processModuleID) 
			where LeaveApplicationID = applicationID;
			IF nextProcessTypeID = 2 then
			    SET @HRMail = 1;
			elseIF nextProcessTypeID = 3 then
			    SET @CompletedMail = 1;
			end if;
				
		ELSE
		-- SET @approvalString ='approved2';
		
			update leaveapplication 
			set `ApprovalStageID` = IFNULL(GetApprovalStageID(nextapproverID),15) 
			where LeaveApplicationID = applicationID;
			
			SET @isApproverMail = 1;
		END if;
	ELSEIF approveTypeID = 2 then
		SET @approvalString ='declined';
		
		update leaveapplication 
		set `ApprovalStageID` = 0 
		where `LeaveApplicationID` = applicationID;
	ELSEIF approveTypeID = 3 then
		SET @approvalString ='Put on Hold';
	END if;
	
	SET @leaveHeader = GenerateLeaveBody(applicationID);
	SET @leaveCSS = GenerateLeaveStyle();
	-- Set @strApprovingOfficer = GetEmployeeeName(intApprovingOfficerID);
	
	
	set @body = (Select concat(@leaveCSS ,
	'<body>',
	'<p>Dear ',username,',</p>',
	 '<p>This is to inform you that your leave application was ',@approvalString,' by ',IFNULL(@strApprovingOfficer,'---'),'.</p>',
	'<p>Reason: <font color=red>',reason,'</font></p>',
	'<p>Find details of the application below:</p>',
	 @leaveHeader ,
	'<p>&nbsp;</p>',
	'<p>This message was automatically generated by the Team Nigeria ERP Leave Management System.</p>',
	'</body>'));
	insert into mails
	Values(email, null, null, concat('TeamNigeriaERP: Leave Application has being ', @approvalString), @body);
	
	IF @isApproverMail = 1 then
	
		set @body = (Select concat(@leaveCSS ,
		'<body>',
		'<p>Dear ',@Approver2,',</p>',
		'<p>A leave application submitted by ',username,' needs your approval.</p>',
		'<p>Find details of the application below:</p>',
		@leaveHeader ,
		'<p>To Approve/Decline please click on the link below: </p>',
		'<p><a href="',@smartgeturlhost,'/',applicationID,'">Approval Page</a></p>',
		'<p></p>',
		'<p>This message was automatically generated by the Team Nigeria ERP Leave Management System.</p>',
		'</body>'));
		INSERT INTO mails
		VALUES(@Approver2Email, NULL, NULL, 'TeamNigeriaERP: A Leave Application Request pending Approval', @body);
	END if;
	
	IF @HRMail = 1 then 
	
		set @body = Concat(@leaveCSS ,
		'<body>',
		'<p>Dear HR,</p>',
		'<p>A leave application has passed due process and needs your Attention.</p>',
		'<p>Find details of the application below:</p>',
		@leaveHeader,
		'<p>To Approve/Decline please click on the link below: </p>',
		'<p><a href="',@smartgeturlhost,'/',applicationID,'">HR Approval Page</a></p>',
		'<p></p>',
		'<p>This message was automatically generated by the Team Nigeria ERP Leave Management System.</p>',
		'</body>');
		
		INSERT INTO mails
		VALUES(@Approver2Email, NULL, NULL, 'TeamNigeriaERP: A Leave Application Request pending Approval', @body);
	end if;
	Select * from mails;
	drop table mails;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_leaveemployeerecords` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_leaveemployeerecords` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `proc_leaveemployeerecords`( in yId int)
BEGIN
INSERT `leaveemployeeapplication` (`YearID`,`EmployeeID`,`LeaveTypeID`,`NoDayEntitled`)
SELECT yId,`EmployeeID`,`LeaveTypeID`,`NotEntitled`
FROM employee AS A inner join `leaveapplicationsetup` las on A.GradeID = las.GradeID 
WHERE  LeaveTypeID not in (5) and EmployeeID not in (SELECT EmployeeID FROM leaveemployeeapplication WHERE EmployeeID = a.EmployeeID AND 
	LeaveTypeID = las.LeaveTypeID AND YearID = yId)  and A.StatusID = 1
UNION ALL
SELECT yId,`EmployeeID`,`LeaveTypeID`,`NotEntitled`
FROM employee AS A INNER JOIN `leaveapplicationsetup` las ON A.GradeID = las.GradeID 
WHERE   LeaveTypeID = 5 AND EmployeeID not in (SELECT EmployeeID FROM leaveemployeeapplication WHERE EmployeeID = A.EmployeeID AND 
	LeaveTypeID = las.LeaveTypeID AND YearID = yId) and A.GenderID = 2 AND A.StatusID = 1;
update leaveemployeeapplication 
inner join employee on leaveemployeeapplication.`EmployeeID` = employee.`EmployeeID`
inner join leaveapplicationsetup on employee.`GradeID` = leaveapplicationsetup.`GradeID` and leaveemployeeapplication.LeaveTypeID = leaveapplicationsetup.LeaveTypeID 
set NoDayEntitled = NotEntitled
where YearID  = yId and NoDayEntitled <> NotEntitled;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_leaveresumeapprove` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_leaveresumeapprove` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `proc_leaveresumeapprove`(in LeaveApproveID int)
BEGIN
	DECLARE applicationID, approvalCount, intApprovingOfficerID, approveID INT;
	DECLARE approveTypeID , nextapproverID, totalApprovalCount INT;
	DECLARE username, email, reason, Sender VARCHAR(500);
	DECLARE curProcessNo , nextProcessNo , nextProcessTypeID, nextApprovalStageID, processModuleID, approvalstageID, empID INT;
	
	
	SET @approvalString = null;
	Set @isApproverMail =0;
	Set @CompletedMail = 0;
	Set @HRMail = 0;
	Set @smartgeturlhost = GetApplicationUrl();
	
	CREATE TEMPORARY TABLE if not exists mails(`to` VARCHAR(3000), bcc VARCHAR(3000), cc VARCHAR(3000), `subject` VARCHAR(3000), body VARCHAR(8000));
	
	SET processModuleID = 1;
	
	SELECT ApprovalTypeID, `ApprovalStagesID`
	into approveTypeID, approvalstageID 
	FROM `leaveresumptionapproval` leave_approve, `approvalinstances` approvalmaster
	WHERE leave_approve.`ApprovalInstancesID` = approvalmaster.ApprovalInstancesID AND `ResumeApprovalID` = LeaveApproveID;
	SELECT `ApprovedBy`, IFNULL(`NextApprovalOfficerID`,0), IFNULL(`Comment`,'***'), `LeaveResumptionID`
	INTO intApprovingOfficerID, nextapproverID, reason , applicationID
	from leaveresumptionapproval leave_approve where ResumeApprovalID  = LeaveApproveID;
	SET approvalCount = (SELECT count(*)
		FROM leaveresumptionapproval leave_approve, approvalinstances approvalmaster, `approvalprocessflow` approval_processFlow
		where leave_approve.ApprovalInstancesID = approvalmaster.ApprovalInstancesID and approvalmaster.`ApprovalStagesID` = approval_processFlow.ApprovalStagesID 
		and `ApprovalTypeID` = 1 and LeaveResumptionID = applicationID);
	set @strApprovingOfficer = GetEmployeeName(intApprovingOfficerID);
	set @Approver2 = GetEmployeeName(nextapproverID);
	set @Approver2Email = GetEmployeeEmail(nextapproverID);
	
	SELECT EmployeeID, GetEmployeeName(EmployeeID), GetEmployeeEmail(EmployeeID) into  empID, username, email
	FROM leaveapplication where  LeaveApplicationID in (select LeaveApplicationID from leaveresumption where `LeaveResumptionID`= applicationID);
	
	
	 -- Leave Process
	set curProcessNo = GetProcessNo(approvalStageID,processModuleID);
	set nextProcessNo = GetNextProcessNo(curProcessNo,processModuleID);
	set nextProcessTypeID  = GetProcessTypeID(nextProcessNo, processModuleID);
	SET totalApprovalCount = GetProcessModuleMaxApproveCount(processModuleID);
	
	If approveTypeID = 1 then
	
		SET @approvalString ='approved';
		 
		if nextProcessTypeID > 1 OR approvalCount >= totalApprovalCount  then
		
			update leaveresumption 
			set ApprovalStagesID = GetNextAdminApprovalStageID(curProcessNo, processModuleID) 
			where LeaveResumptionID = applicationID;
			IF nextProcessTypeID = 2 then
			    SET @HRMail = 1;
			elseIF nextProcessTypeID = 3 then
			    SET @CompletedMail = 1;
			end if;
				
		ELSE
		-- SET @approvalString ='approved2';
		
			update leaveresumption 
			set `ApprovalStagesID` = IFNULL(GetApprovalStageID(nextapproverID),15) 
			where LeaveResumptionID = applicationID;
			
			SET @isApproverMail = 1;
		END if;
	ELSEIF approveTypeID = 2 then
		SET @approvalString ='declined';
		
		update leaveresumption 
		set `ApprovalStagesID` = 0 
		where `LeaveResumptionID` = applicationID;
	ELSEIF approveTypeID = 3 then
		SET @approvalString ='Put on Hold';
	END if;
	/*
	SET @leaveHeader = GenerateLeaveBody(applicationID);
	SET @leaveCSS = GenerateLeaveStyle();
	-- Set @strApprovingOfficer = GetEmployeeeName(intApprovingOfficerID);
	
	
	set @body = (Select concat(@leaveCSS ,
	'<body>',
	'<p>Dear ',username,',</p>',
	 '<p>This is to inform you that your leave application was ',@approvalString,' by ',IFNULL(@strApprovingOfficer,'---'),'.</p>',
	'<p>Reason: <font color=red>',reason,'</font></p>',
	'<p>Find details of the application below:</p>',
	 @leaveHeader ,
	'<p>&nbsp;</p>',
	'<p>This message was automatically generated by the Team Nigeria ERP Leave Management System.</p>',
	'</body>'));
	insert into mails
	Values(email, null, null, concat('TeamNigeriaERP: Leave Application has being ', @approvalString), @body);
	
	IF @isApproverMail = 1 then
	
		set @body = (Select concat(@leaveCSS ,
		'<body>',
		'<p>Dear ',@Approver2,',</p>',
		'<p>A leave application submitted by ',username,' needs your approval.</p>',
		'<p>Find details of the application below:</p>',
		@leaveHeader ,
		'<p>To Approve/Decline please click on the link below: </p>',
		'<p><a href="',@smartgeturlhost,'/',applicationID,'">Approval Page</a></p>',
		'<p></p>',
		'<p>This message was automatically generated by the Team Nigeria ERP Leave Management System.</p>',
		'</body>'));
		INSERT INTO mails
		VALUES(@Approver2Email, NULL, NULL, 'TeamNigeriaERP: A Leave Application Request pending Approval', @body);
	END if;
	
	IF @HRMail = 1 then 
	
		set @body = Concat(@leaveCSS ,
		'<body>',
		'<p>Dear HR,</p>',
		'<p>A leave application has passed due process and needs your Attention.</p>',
		'<p>Find details of the application below:</p>',
		@leaveHeader,
		'<p>To Approve/Decline please click on the link below: </p>',
		'<p><a href="',@smartgeturlhost,'/',applicationID,'">HR Approval Page</a></p>',
		'<p></p>',
		'<p>This message was automatically generated by the Team Nigeria ERP Leave Management System.</p>',
		'</body>');
		
		INSERT INTO mails
		VALUES(@Approver2Email, NULL, NULL, 'TeamNigeriaERP: A Leave Application Request pending Approval', @body);
	end if;
	Select * from mails;
	drop table mails; */
	END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_loanapprove` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_loanapprove` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `proc_loanapprove`(in LeaveApproveID int)
BEGIN
	DECLARE applicationID, approvalCount, intApprovingOfficerID, approveID INT;
	DECLARE approveTypeID , nextapproverID, totalApprovalCount INT;
	DECLARE username, email, reason, Sender VARCHAR(500);
	DECLARE curProcessNo , nextProcessNo , nextProcessTypeID, nextApprovalStageID, processModuleID, approvalstageID, empID INT;
	
	SET @approvalString = null;
	Set @isApproverMail =0;
	Set @CompletedMail = 0;
	Set @HRMail = 0;
	Set @smartgeturlhost = GetApplicationUrl();
	
	-- CREATE TEMPORARY TABLE if not exists mails(`to` VARCHAR(3000), bcc VARCHAR(3000), cc VARCHAR(3000), `subject` VARCHAR(3000), body VARCHAR(8000));
	
	SET processModuleID = 2;
	
	SELECT ApprovalTypeID, `ApprovalStagesID`
	into approveTypeID, approvalstageID 
	FROM `loanapproval` leave_approve, `approvalinstances` approvalmaster
	WHERE leave_approve.`ApprovalInstancesID` = approvalmaster.ApprovalInstancesID AND `LoanApprovalID` = LeaveApproveID;
	SELECT `ApprovedBy`, IFNULL(`NextApprovalOfficerID`,0), IFNULL(`Comment`,'***'), `LoanApplicationID`
	INTO intApprovingOfficerID, nextapproverID, reason , applicationID
	from loanapproval leave_approve where LoanApprovalID  = LeaveApproveID;
	SET approvalCount = (SELECT count(*)
		FROM loanapproval leave_approve, approvalinstances approvalmaster, `approvalprocessflow` approval_processFlow
		where leave_approve.ApprovalInstancesID = approvalmaster.ApprovalInstancesID and approvalmaster.`ApprovalStagesID` = approval_processFlow.ApprovalStagesID 
		and `ApprovalTypeID` = 1 and LoanApplicationID = applicationID);
	set @strApprovingOfficer = GetEmployeeName(intApprovingOfficerID);
	set @Approver2 = GetEmployeeName(nextapproverID);
	set @Approver2Email = GetEmployeeEmail(nextapproverID);
	
	SELECT EmployeeID, GetEmployeeName(EmployeeID), GetEmployeeEmail(EmployeeID) into  empID, username, email
	FROM loanapplication where `LoanApplicationID`= applicationID;
	
	
	 -- Leave Process
	set curProcessNo = GetProcessNo(approvalStageID,processModuleID);
	set nextProcessNo = GetNextProcessNo(curProcessNo,processModuleID);
	set nextProcessTypeID  = GetProcessTypeID(nextProcessNo, processModuleID);
	SET totalApprovalCount = GetProcessModuleMaxApproveCount(processModuleID);
	
	If approveTypeID = 1 then
	
		SET @approvalString ='approved';
		 
		if nextProcessTypeID > 1 OR approvalCount >= totalApprovalCount  then
		
			update loanapplication 
			set ApprovalStageID = GetNextAdminApprovalStageID(curProcessNo, processModuleID) 
			where LoanApplicationID = applicationID;
			IF nextProcessTypeID = 2 then
			    SET @HRMail = 1;
			elseIF nextProcessTypeID = 3 then
			    SET @CompletedMail = 1;
			end if;
				
		ELSE
		-- SET @approvalString ='approved2';
		
			update loanapplication 
			set `ApprovalStageID` = IFNULL(GetApprovalStageID(nextapproverID),15) 
			where LoanApplicationID = applicationID;
			SET @isApproverMail = 1;
		END if;
	ELSEIF approveTypeID = 2 then
		SET @approvalString ='declined';
		
		update loanapplication 
		set `ApprovalStageID` = 0 
		where `LoanApplicationID` = applicationID;
	ELSEIF approveTypeID = 3 then
		SET @approvalString ='Put on Hold';
	END if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_procumentapprove` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_procumentapprove` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `proc_procumentapprove`(in LeaveApproveID int)
BEGIN
	DECLARE applicationID, approvalCount, intApprovingOfficerID, approveID INT;
	DECLARE approveTypeID , nextapproverID, totalApprovalCount INT;
	DECLARE username, email, reason, Sender VARCHAR(500);
	DECLARE curProcessNo , nextProcessNo , nextProcessTypeID, nextApprovalStageID, processModuleID, approvalstageID, empID INT;
	
	SET @approvalString = null;
	Set @isApproverMail =0;
	Set @CompletedMail = 0;
	Set @HRMail = 0;
	Set @smartgeturlhost = GetApplicationUrl();
	
	-- CREATE TEMPORARY TABLE if not exists mails(`to` VARCHAR(3000), bcc VARCHAR(3000), cc VARCHAR(3000), `subject` VARCHAR(3000), body VARCHAR(8000));
	
	SET processModuleID = 2;
	
	SELECT ApprovalTypeID, `ApprovalStagesID`
	into approveTypeID, approvalstageID 
	FROM `procumentapproval` leave_approve, `approvalinstances` approvalmaster
	WHERE leave_approve.`ApprovalInstancesID` = approvalmaster.ApprovalInstancesID AND `ProcurementApprovalID` = LeaveApproveID;

	SELECT `ApprovedBy`, IFNULL(`NextApprovalOfficerID`,0), IFNULL(`Comment`,'***'), `LoanApplicationID`
	INTO intApprovingOfficerID, nextapproverID, reason , applicationID
	from procumentapproval leave_approve where ProcurementApprovalID  = LeaveApproveID;

	SET approvalCount = (SELECT count(*)
		FROM procumentapproval leave_approve, approvalinstances approvalmaster, `approvalprocessflow` approval_processFlow
		where leave_approve.ApprovalInstancesID = approvalmaster.ApprovalInstancesID and approvalmaster.`ApprovalStagesID` = approval_processFlow.ApprovalStagesID 
		and `ApprovalTypeID` = 1 and LoanApplicationID = applicationID);

	set @strApprovingOfficer = GetEmployeeName(intApprovingOfficerID);
	set @Approver2 = GetEmployeeName(nextapproverID);
	set @Approver2Email = GetEmployeeEmail(nextapproverID);
	

	SELECT EmployeeID, GetEmployeeName(EmployeeID), GetEmployeeEmail(EmployeeID) into  empID, username, email
	FROM loanapplication where `LoanApplicationID`= applicationID;
	
	
	 -- Leave Process
	set curProcessNo = GetProcessNo(approvalStageID,processModuleID);
	set nextProcessNo = GetNextProcessNo(curProcessNo,processModuleID);
	set nextProcessTypeID  = GetProcessTypeID(nextProcessNo, processModuleID);
	SET totalApprovalCount = GetProcessModuleMaxApproveCount(processModuleID);
	
	If approveTypeID = 1 then
	
		SET @approvalString ='approved';
		 
		if nextProcessTypeID > 1 OR approvalCount >= totalApprovalCount  then
		
			update loanapplication 
			set ApprovalStageID = GetNextAdminApprovalStageID(curProcessNo, processModuleID) 
			where LoanApplicationID = applicationID;
			
			IF nextProcessTypeID = 2 then
			    SET @HRMail = 1;
			elseIF nextProcessTypeID = 3 then
			    SET @CompletedMail = 1;
			end if;
				
		ELSE
		-- SET @approvalString ='approved2';
		
			update loanapplication 
			set `ApprovalStageID` = IFNULL(GetApprovalStageID(nextapproverID),15) 
			where LoanApplicationID = applicationID;
			SET @isApproverMail = 1;

		END if;

	ELSEIF approveTypeID = 2 then
		SET @approvalString ='declined';
		
		update loanapplication 
		set `ApprovalStageID` = 0 
		where `LoanApplicationID` = applicationID;

	ELSEIF approveTypeID = 3 then
		SET @approvalString ='Put on Hold';
	END if;
END */$$
DELIMITER ;

/*Table structure for table `netpay` */

DROP TABLE IF EXISTS `netpay`;

/*!50001 DROP VIEW IF EXISTS `netpay` */;
/*!50001 DROP TABLE IF EXISTS `netpay` */;

/*!50001 CREATE TABLE  `netpay`(
 `FirstName` varchar(100) ,
 `SurName` varchar(100) ,
 `FullName` varchar(150) ,
 `MiddleName` varchar(100) ,
 `EmployeeNumber` varchar(25) ,
 `PayrollCategory` varchar(30) ,
 `PayrollPeriod` varchar(30) ,
 `PayrollCategoryID` int(10) ,
 `PayrollPeriodID` int(10) ,
 `gross` decimal(40,2) ,
 `deductions` decimal(40,2) ,
 `reliefs` decimal(40,2) ,
 `netpay` decimal(41,2) 
)*/;

/*Table structure for table `payrolldetailview` */

DROP TABLE IF EXISTS `payrolldetailview`;

/*!50001 DROP VIEW IF EXISTS `payrolldetailview` */;
/*!50001 DROP TABLE IF EXISTS `payrolldetailview` */;

/*!50001 CREATE TABLE  `payrolldetailview`(
 `FirstName` varchar(100) ,
 `SurName` varchar(100) ,
 `FullName` varchar(150) ,
 `MiddleName` varchar(100) ,
 `EmployeeNumber` varchar(25) ,
 `PayrollCategory` varchar(30) ,
 `PayrollPeriod` varchar(30) ,
 `SalaryComponent` varchar(50) ,
 `Amount` decimal(19,4) ,
 `SalaryComponentID` int(10) ,
 `PayrollGeneratedID` int(10) ,
 `EmployeeID` int(10) ,
 `GradeID` int(11) ,
 `GradeLevelID` int(11) ,
 `UnitID` int(11) ,
 `CompanyID` int(11) ,
 `BranchID` int(11) ,
 `DepartmentID` int(11) ,
 `DesignationID` int(11) ,
 `EmployeeTypeID` int(11) ,
 `PensionProviderID` int(11) ,
 `BankID` int(11) ,
 `BankAccountNo` varchar(300) ,
 `PayrollCategoryID` int(11) ,
 `SalaryType` varchar(30) ,
 `SalaryTypeID` int(10) ,
 `BankName` varchar(30) ,
 `GradeLevelName` varchar(100) ,
 `GradeName` varchar(100) ,
 `DepartmentName` varchar(50) ,
 `DepartmentCode` varchar(10) ,
 `BankCode` varchar(50) ,
 `BranchName` varchar(100) ,
 `PayrollID` int(10) 
)*/;

/*Table structure for table `payrolldetailview2` */

DROP TABLE IF EXISTS `payrolldetailview2`;

/*!50001 DROP VIEW IF EXISTS `payrolldetailview2` */;
/*!50001 DROP TABLE IF EXISTS `payrolldetailview2` */;

/*!50001 CREATE TABLE  `payrolldetailview2`(
 `FirstName` varchar(100) ,
 `SurName` varchar(100) ,
 `FullName` varchar(150) ,
 `MiddleName` varchar(100) ,
 `EmployeeNumber` varchar(25) ,
 `PayrollCategory` varchar(30) ,
 `PayrollPeriod` varchar(30) ,
 `SalaryComponent` varchar(50) ,
 `Amount` decimal(19,4) ,
 `SalaryComponentID` int(10) ,
 `PayrollGeneratedID` int(10) ,
 `EmployeeID` int(10) ,
 `GradeID` int(11) ,
 `GradeLevelID` int(11) ,
 `UnitID` int(11) ,
 `CompanyID` int(11) ,
 `BranchID` int(11) ,
 `DepartmentID` int(11) ,
 `DesignationID` int(11) ,
 `EmployeeTypeID` int(11) ,
 `PensionProviderID` int(11) ,
 `BankID` int(11) ,
 `BankAccountNo` varchar(300) ,
 `PayrollCategoryID` int(11) ,
 `SalaryType` varchar(30) ,
 `SalaryTypeID` int(10) ,
 `BankName` varchar(30) ,
 `GradeLevelName` varchar(100) ,
 `GradeName` varchar(100) ,
 `DepartmentName` varchar(50) ,
 `DepartmentCode` varchar(10) ,
 `BankCode` varchar(50) ,
 `BranchName` varchar(100) ,
 `PayrollID` int(10) 
)*/;

/*Table structure for table `vprivilegedetails` */

DROP TABLE IF EXISTS `vprivilegedetails`;

/*!50001 DROP VIEW IF EXISTS `vprivilegedetails` */;
/*!50001 DROP TABLE IF EXISTS `vprivilegedetails` */;

/*!50001 CREATE TABLE  `vprivilegedetails`(
 `surname` varchar(100) ,
 `first_name` varchar(100) ,
 `email` varchar(50) ,
 `subAccountCode` binary(0) ,
 `job_title_code` varchar(7) ,
 `PrivilegeClass` varchar(50) ,
 `PrivilegeClassID` int(11) ,
 `DesignationClassID` int(11) ,
 `SupervisorTypeID` int(11) ,
 `PrivilegeID` int(11) ,
 `posted_by` int(11) ,
 `date_posted` timestamp ,
 `transID` int(11) ,
 `StageID` int(11) ,
 `UnitID` int(11) ,
 `DeptID` int(11) ,
 `PrivHeaderID` int(11) ,
 `employee_id` int(11) ,
 `statusID` int(11) ,
 `Privilege_Name` varchar(50) ,
 `Activity_Name` varchar(50) ,
 `ActivityPrivID` int(11) ,
 `pagepath` varchar(100) ,
 `order_by` int(11) ,
 `stage_id` int(11) 
)*/;

/*View structure for view netpay */

/*!50001 DROP TABLE IF EXISTS `netpay` */;
/*!50001 DROP VIEW IF EXISTS `netpay` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `netpay` AS select `employee`.`FirstName` AS `FirstName`,`employee`.`SurName` AS `SurName`,`employee`.`FullName` AS `FullName`,`employee`.`MiddleName` AS `MiddleName`,`employee`.`EmployeeNumber` AS `EmployeeNumber`,`payrollcategory`.`PayrollCategory` AS `PayrollCategory`,`payrollperiod`.`PayrollPeriod` AS `PayrollPeriod`,`payrollcategory`.`PayrollCategoryID` AS `PayrollCategoryID`,`payrollperiod`.`PayrollPeriodID` AS `PayrollPeriodID`,sum(if(`salarycomponent`.`SalaryTypeID` = 1,round(abs(`payrollgenerateddetail`.`Amount`),2),0)) AS `gross`,sum(if(`salarycomponent`.`SalaryTypeID` = 2,round(abs(`payrollgenerateddetail`.`Amount`),2),0)) AS `deductions`,sum(if(`salarycomponent`.`SalaryTypeID` = 3,round(`payrollgenerateddetail`.`Amount`,2),0)) AS `reliefs`,sum(if(`salarycomponent`.`SalaryTypeID` = 1,round(abs(`payrollgenerateddetail`.`Amount`),2),0)) - sum(if(`salarycomponent`.`SalaryTypeID` = 2,round(abs(`payrollgenerateddetail`.`Amount`),2),0)) AS `netpay` from (((((`payrollgenerated` join `payrollgenerateddetail` on(`payrollgenerated`.`PayrollGeneratedID` = `payrollgenerateddetail`.`PayrollGeneratedID`)) join `employee` on(`payrollgenerated`.`EmployeeID` = `employee`.`EmployeeID`)) join `payrollcategory` on(`payrollgenerated`.`PayrollCategoryID` = `payrollcategory`.`PayrollCategoryID`)) join `payrollperiod` on(`payrollgenerated`.`PayrollID` = `payrollperiod`.`PayrollPeriodID`)) join `salarycomponent` on(`payrollgenerateddetail`.`SalaryComponentID` = `salarycomponent`.`SalaryComponentID`)) group by `employee`.`FirstName`,`employee`.`SurName`,`employee`.`FullName`,`employee`.`MiddleName`,`employee`.`EmployeeNumber`,`payrollcategory`.`PayrollCategory`,`payrollperiod`.`PayrollPeriod`,`payrollcategory`.`PayrollCategoryID`,`payrollperiod`.`PayrollPeriodID` */;

/*View structure for view payrolldetailview */

/*!50001 DROP TABLE IF EXISTS `payrolldetailview` */;
/*!50001 DROP VIEW IF EXISTS `payrolldetailview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `payrolldetailview` AS select `employee`.`FirstName` AS `FirstName`,`employee`.`SurName` AS `SurName`,`employee`.`FullName` AS `FullName`,`employee`.`MiddleName` AS `MiddleName`,`employee`.`EmployeeNumber` AS `EmployeeNumber`,`payrollcategory`.`PayrollCategory` AS `PayrollCategory`,`payrollperiod`.`PayrollPeriod` AS `PayrollPeriod`,`salarycomponent`.`SalaryComponent` AS `SalaryComponent`,`payrollgenerateddetail`.`Amount` AS `Amount`,`payrollgenerateddetail`.`SalaryComponentID` AS `SalaryComponentID`,`payrollgenerated`.`PayrollGeneratedID` AS `PayrollGeneratedID`,`payrollgenerated`.`EmployeeID` AS `EmployeeID`,`payrollgenerated`.`GradeID` AS `GradeID`,`payrollgenerated`.`GradeLevelID` AS `GradeLevelID`,`payrollgenerated`.`UnitID` AS `UnitID`,`payrollgenerated`.`CompanyID` AS `CompanyID`,`payrollgenerated`.`BranchID` AS `BranchID`,`payrollgenerated`.`DepartmentID` AS `DepartmentID`,`payrollgenerated`.`DesignationID` AS `DesignationID`,`payrollgenerated`.`EmployeeTypeID` AS `EmployeeTypeID`,`payrollgenerated`.`PensionProviderID` AS `PensionProviderID`,`payrollgenerated`.`BankID` AS `BankID`,`payrollgenerated`.`BankAccountNo` AS `BankAccountNo`,`payrollgenerated`.`PayrollCategoryID` AS `PayrollCategoryID`,`salarytype`.`SalaryType` AS `SalaryType`,`salarytype`.`SalaryTypeID` AS `SalaryTypeID`,`bank`.`BankName` AS `BankName`,`gradelevels`.`GradeLevelName` AS `GradeLevelName`,`grades`.`GradeName` AS `GradeName`,`departments`.`DepartmentName` AS `DepartmentName`,`departments`.`DepartmentCode` AS `DepartmentCode`,`bank`.`BankCode` AS `BankCode`,`branches`.`BranchName` AS `BranchName`,`payrollgenerated`.`PayrollID` AS `PayrollID` from (((((((((((`payrollgenerated` join `payrollgenerateddetail` on(`payrollgenerated`.`PayrollGeneratedID` = `payrollgenerateddetail`.`PayrollGeneratedID`)) join `employee` on(`payrollgenerated`.`EmployeeID` = `employee`.`EmployeeID`)) join `payrollcategory` on(`payrollgenerated`.`PayrollCategoryID` = `payrollcategory`.`PayrollCategoryID`)) join `payrollperiod` on(`payrollgenerated`.`PayrollID` = `payrollperiod`.`PayrollPeriodID`)) left join `bank` on(`payrollgenerated`.`BankID` = `bank`.`BankID`)) left join `departments` on(`payrollgenerated`.`DepartmentID` = `departments`.`DepartmentID`)) join `gradelevels` on(`payrollgenerated`.`GradeLevelID` = `gradelevels`.`GradeLevelID`)) left join `branches` on(`payrollgenerated`.`BranchID` = `branches`.`BranchID`)) join `salarycomponent` on(`payrollgenerateddetail`.`SalaryComponentID` = `salarycomponent`.`SalaryComponentID`)) join `salarytype` on(`salarycomponent`.`SalaryTypeID` = `salarytype`.`SalaryTypeID`)) left join `grades` on(`gradelevels`.`GradeID` = `grades`.`GradeID`)) where `salarycomponent`.`SalaryTypeID` in (1,2) */;

/*View structure for view payrolldetailview2 */

/*!50001 DROP TABLE IF EXISTS `payrolldetailview2` */;
/*!50001 DROP VIEW IF EXISTS `payrolldetailview2` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `payrolldetailview2` AS select `employee`.`FirstName` AS `FirstName`,`employee`.`SurName` AS `SurName`,`employee`.`FullName` AS `FullName`,`employee`.`MiddleName` AS `MiddleName`,`employee`.`EmployeeNumber` AS `EmployeeNumber`,`payrollcategory`.`PayrollCategory` AS `PayrollCategory`,`payrollperiod`.`PayrollPeriod` AS `PayrollPeriod`,`salarycomponent`.`SalaryComponent` AS `SalaryComponent`,`payrollgenerateddetail`.`Amount` AS `Amount`,`payrollgenerateddetail`.`SalaryComponentID` AS `SalaryComponentID`,`payrollgenerated`.`PayrollGeneratedID` AS `PayrollGeneratedID`,`payrollgenerated`.`EmployeeID` AS `EmployeeID`,`payrollgenerated`.`GradeID` AS `GradeID`,`payrollgenerated`.`GradeLevelID` AS `GradeLevelID`,`payrollgenerated`.`UnitID` AS `UnitID`,`payrollgenerated`.`CompanyID` AS `CompanyID`,`payrollgenerated`.`BranchID` AS `BranchID`,`payrollgenerated`.`DepartmentID` AS `DepartmentID`,`payrollgenerated`.`DesignationID` AS `DesignationID`,`payrollgenerated`.`EmployeeTypeID` AS `EmployeeTypeID`,`payrollgenerated`.`PensionProviderID` AS `PensionProviderID`,`payrollgenerated`.`BankID` AS `BankID`,`payrollgenerated`.`BankAccountNo` AS `BankAccountNo`,`payrollgenerated`.`PayrollCategoryID` AS `PayrollCategoryID`,`salarytype`.`SalaryType` AS `SalaryType`,`salarytype`.`SalaryTypeID` AS `SalaryTypeID`,`bank`.`BankName` AS `BankName`,`gradelevels`.`GradeLevelName` AS `GradeLevelName`,`grades`.`GradeName` AS `GradeName`,`departments`.`DepartmentName` AS `DepartmentName`,`departments`.`DepartmentCode` AS `DepartmentCode`,`bank`.`BankCode` AS `BankCode`,`branches`.`BranchName` AS `BranchName`,`payrollgenerated`.`PayrollID` AS `PayrollID` from (((((((((((`payrollgenerated` join `payrollgenerateddetail` on(`payrollgenerated`.`PayrollGeneratedID` = `payrollgenerateddetail`.`PayrollGeneratedID`)) join `employee` on(`payrollgenerated`.`EmployeeID` = `employee`.`EmployeeID`)) join `payrollcategory` on(`payrollgenerated`.`PayrollCategoryID` = `payrollcategory`.`PayrollCategoryID`)) join `payrollperiod` on(`payrollgenerated`.`PayrollID` = `payrollperiod`.`PayrollPeriodID`)) left join `bank` on(`payrollgenerated`.`BankID` = `bank`.`BankID`)) left join `departments` on(`payrollgenerated`.`DepartmentID` = `departments`.`DepartmentID`)) join `gradelevels` on(`payrollgenerated`.`GradeLevelID` = `gradelevels`.`GradeLevelID`)) left join `branches` on(`payrollgenerated`.`BranchID` = `branches`.`BranchID`)) join `salarycomponent` on(`payrollgenerateddetail`.`SalaryComponentID` = `salarycomponent`.`SalaryComponentID`)) join `salarytype` on(`salarycomponent`.`SalaryTypeID` = `salarytype`.`SalaryTypeID`)) left join `grades` on(`gradelevels`.`GradeID` = `grades`.`GradeID`)) */;

/*View structure for view vprivilegedetails */

/*!50001 DROP TABLE IF EXISTS `vprivilegedetails` */;
/*!50001 DROP VIEW IF EXISTS `vprivilegedetails` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vprivilegedetails` AS select `e`.`SurName` AS `surname`,`e`.`FirstName` AS `first_name`,`e`.`Email` AS `email`,NULL AS `subAccountCode`,'TEACHER' AS `job_title_code`,`pc`.`PrivilegeClass` AS `PrivilegeClass`,`ph`.`PrivilegeClassID` AS `PrivilegeClassID`,`ph`.`DesignationClassID` AS `DesignationClassID`,`ph`.`SupervisorTypeID` AS `SupervisorTypeID`,`ph`.`PrivilegeID` AS `PrivilegeID`,`ph`.`posted_by` AS `posted_by`,`ph`.`date_posted` AS `date_posted`,`ph`.`transID` AS `transID`,`ph`.`StageID` AS `StageID`,`ph`.`UnitID` AS `UnitID`,`ph`.`DeptID` AS `DeptID`,`ph`.`PrivHeaderID` AS `PrivHeaderID`,`pd`.`employee_id` AS `employee_id`,`pd`.`statusID` AS `statusID`,`p`.`privilege_name` AS `Privilege_Name`,`pa`.`Activity_Name` AS `Activity_Name`,`pa`.`ActivityPrivID` AS `ActivityPrivID`,`pa`.`pagepath` AS `pagepath`,`pa`.`order_by` AS `order_by`,`pa`.`stage_id` AS `stage_id` from ((((((`privilege_header` `ph` join `privilege_details` `pd` on(`ph`.`PrivHeaderID` = `pd`.`PrivHeaderID`)) join `privileges` `p` on(`ph`.`PrivilegeID` = `p`.`PrivilegeID`)) join `privilege_class` `pc` on(`pc`.`PrivilegeClassID` = `ph`.`PrivilegeClassID`)) join `employee` `e` on(`e`.`EmployeeID` = `pd`.`employee_id`)) left join `privilege_activitydetails` `pad` on(`p`.`PrivilegeID` = `pad`.`PrivilegeID`)) left join `privilege_activity` `pa` on(`pad`.`ActivityPrivID` = `pa`.`ActivityPrivID`)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
