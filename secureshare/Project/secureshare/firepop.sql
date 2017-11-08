/*
SQLyog Community v10.3 
MySQL - 5.5.27 : Database - firepop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`firepop` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `firepop`;

/*Table structure for table `account_property` */

DROP TABLE IF EXISTS `account_property`;

CREATE TABLE `account_property` (
  `userID` bigint(20) NOT NULL,
  `share` int(11) NOT NULL DEFAULT '0',
  `download` int(11) NOT NULL DEFAULT '0',
  `save` int(11) NOT NULL DEFAULT '0',
  `secretkey` varchar(10) NOT NULL DEFAULT '0000000000',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `account_property` */

insert  into `account_property`(`userID`,`share`,`download`,`save`,`secretkey`) values (1,0,1,0,'12345'),(2,1,1,1,'25896'),(3,0,0,0,'00000'),(4,0,0,0,'00000'),(5,0,0,0,'00000');

/*Table structure for table `friends_list` */

DROP TABLE IF EXISTS `friends_list`;

CREATE TABLE `friends_list` (
  `uid` bigint(20) NOT NULL COMMENT 'sender',
  `req_id` bigint(20) NOT NULL COMMENT 'receiver',
  `req_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `friends_list` */

insert  into `friends_list`(`uid`,`req_id`,`req_status`) values (2,1,1),(3,1,1),(2,3,1),(4,1,1),(1,2,1),(1,3,1),(1,4,1);

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `slno` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `userId` bigint(20) NOT NULL,
  `message` varchar(500) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`slno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `notifications` */

insert  into `notifications`(`slno`,`date`,`userId`,`message`,`type`) values (1,'2015-03-10',1,'Attempt to share the private message send to FRIEND was blocked successfully..<br/><br/> Details:<h5 style=\"color=red\"> System IP:&nbsp&nbsp&nbsp&nbsp<i>sreejith/192.168.8.101</i></h5><h5 style=\"color=red\"> MAC Address:&nbsp&nbsp&nbsp&nbsp<i>64-27-37-94-59-E3</i></h5><h5 style=\"color=red\"> Date and time:&nbsp&nbsp&nbsp&nbsp<i>10 Mar 2015 06:23:59 GMT</i></h5>','SEQ');

/*Table structure for table `share_id_record` */

DROP TABLE IF EXISTS `share_id_record`;

CREATE TABLE `share_id_record` (
  `shareID` bigint(20) NOT NULL,
  `userID` bigint(20) NOT NULL,
  `view_status` int(11) NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL DEFAULT 'NORM'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `share_id_record` */

insert  into `share_id_record`(`shareID`,`userID`,`view_status`,`type`) values (1,2,0,'NORM'),(2,1,0,'NORM'),(3,1,0,'NORM'),(4,1,0,'NORM'),(5,2,0,'NORM'),(5,3,0,'NORM'),(5,3,0,'NORM'),(5,4,0,'NORM'),(6,3,0,'SEQ'),(7,2,0,'NORM');

/*Table structure for table `user_details` */

DROP TABLE IF EXISTS `user_details`;

CREATE TABLE `user_details` (
  `userID` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `place` varchar(20) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `dob` varchar(15) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `secQstn` varchar(50) NOT NULL,
  `secAns` varchar(20) NOT NULL,
  `online` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `user_details` */

insert  into `user_details`(`userID`,`name`,`address`,`place`,`contact`,`email`,`dob`,`username`,`password`,`secQstn`,`secAns`,`online`) values (1,'sreejith','ekm','ekm','8289882220','sreejithekm.pc@gmail.com','1990-07-19','sree','sree','1','123',0),(2,'athi','jdysks','kdr','8356792837','athira@gmail.com','1994-09-24','athira','athira','3','sree',0),(3,'anu','anupama house','kdr','04802808230','anu@gmail.com','1996-12-12','anu','anu','3','sreekutty',0),(4,'reshma','eetrty','jhgtg','0123456','reshma@gmail.com','1994-12-08','reshma','reshu','1','1111',0),(5,'lcc','mvhgjgj','iuyiy','9495967441','test@test.test','2015-03-05','lcc','lcc','2','tt',0);

/*Table structure for table `user_shares` */

DROP TABLE IF EXISTS `user_shares`;

CREATE TABLE `user_shares` (
  `shareID` bigint(20) NOT NULL AUTO_INCREMENT,
  `shareDate` varchar(20) DEFAULT NULL,
  `sharedTo` varchar(30) DEFAULT NULL,
  `path` varchar(50) DEFAULT NULL,
  `download` int(11) NOT NULL DEFAULT '0',
  `share` int(11) NOT NULL DEFAULT '0',
  `save` int(11) NOT NULL DEFAULT '0',
  `access_type` varchar(10) NOT NULL DEFAULT 'PUB',
  `shareby` int(11) NOT NULL,
  PRIMARY KEY (`shareID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `user_shares` */

insert  into `user_shares`(`shareID`,`shareDate`,`sharedTo`,`path`,`download`,`share`,`save`,`access_type`,`shareby`) values (1,'2015-03-10 11:01:39','2','image_shares/1_10Mar2015053139.jpg',0,0,0,'PUB',1),(2,'2015-03-10 11:33:37','1','image_shares/2_10Mar2015060337.jpg',0,0,0,'PUB',2),(3,'2015-03-27 07:45:55','1','image_shares/2_27Mar2015021554.jpg',0,0,0,'PUB',2),(4,'2015-03-27 07:47:42','1','image_shares/2_27Mar2015021742.jpg',1,1,1,'PUB',2),(5,'2015-03-28 14:44:53','2 3 3 4','image_shares/1_28Mar2015091452.jpg',1,0,0,'PUB',1),(6,'2015-03-29 14:37:15','3','image_shares/1_29Mar2015090715.jpg',1,0,0,'PUB',1),(7,'2015-03-29 16:17:53','2','image_shares/1_29Mar2015104753.jpg',1,0,0,'PUB',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
