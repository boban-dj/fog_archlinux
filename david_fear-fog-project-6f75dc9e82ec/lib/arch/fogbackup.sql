-- MySQL dump 10.16  Distrib 10.1.18-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: fog
-- ------------------------------------------------------
-- Server version	10.1.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aloLog`
--

DROP TABLE IF EXISTS `aloLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aloLog` (
  `alID` int(11) NOT NULL AUTO_INCREMENT,
  `alUserName` varchar(254) NOT NULL,
  `alHostID` int(11) NOT NULL,
  `alDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alAnon1` varchar(254) NOT NULL,
  `alAnon2` varchar(254) NOT NULL,
  `alAnon3` varchar(254) NOT NULL,
  PRIMARY KEY (`alID`),
  KEY `new_index` (`alUserName`),
  KEY `new_index2` (`alHostID`),
  KEY `new_index3` (`alDateTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aloLog`
--

LOCK TABLES `aloLog` WRITE;
/*!40000 ALTER TABLE `aloLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `aloLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientUpdates`
--

DROP TABLE IF EXISTS `clientUpdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientUpdates` (
  `cuID` int(11) NOT NULL AUTO_INCREMENT,
  `cuName` varchar(200) NOT NULL,
  `cuMD5` varchar(100) NOT NULL,
  `cuType` varchar(3) NOT NULL,
  `cuFile` longblob NOT NULL,
  PRIMARY KEY (`cuID`),
  KEY `new_index` (`cuName`),
  KEY `new_index1` (`cuType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientUpdates`
--

LOCK TABLES `clientUpdates` WRITE;
/*!40000 ALTER TABLE `clientUpdates` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientUpdates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dirCleaner`
--

DROP TABLE IF EXISTS `dirCleaner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dirCleaner` (
  `dcID` int(11) NOT NULL AUTO_INCREMENT,
  `dcPath` longtext NOT NULL,
  PRIMARY KEY (`dcID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dirCleaner`
--

LOCK TABLES `dirCleaner` WRITE;
/*!40000 ALTER TABLE `dirCleaner` DISABLE KEYS */;
/*!40000 ALTER TABLE `dirCleaner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalSettings`
--

DROP TABLE IF EXISTS `globalSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalSettings` (
  `settingID` int(11) NOT NULL AUTO_INCREMENT,
  `settingKey` varchar(254) NOT NULL,
  `settingDesc` longtext NOT NULL,
  `settingValue` longtext CHARACTER SET latin1 NOT NULL,
  `settingCategory` varchar(254) NOT NULL,
  PRIMARY KEY (`settingID`),
  KEY `new_index` (`settingKey`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalSettings`
--

LOCK TABLES `globalSettings` WRITE;
/*!40000 ALTER TABLE `globalSettings` DISABLE KEYS */;
INSERT INTO `globalSettings` VALUES (1,'FOG_TFTP_HOST','Hostname or IP address of the TFTP Server.','192.168.0.113','TFTP Server'),(2,'FOG_TFTP_FTP_USERNAME','Username used to access the tftp server via ftp.','fog','TFTP Server'),(3,'FOG_TFTP_FTP_PASSWORD','Password used to access the tftp server via ftp.','','TFTP Server'),(102,'FOG_MINING_PACKAGE_PATH','Where should we pull the donation script from?','http://fogproject.org/fogpackage.zip','Donations'),(5,'FOG_TFTP_PXE_KERNEL_DIR','Location of kernel files on the PXE server.','/srv/http/fog/service/ipxe/','TFTP Server'),(6,'FOG_TFTP_PXE_KERNEL','Location of kernel file on the PXE server, this should point to the kernel itself.','bzImage','TFTP Server'),(7,'FOG_KERNEL_RAMDISK_SIZE','This setting defines the amount of physical memory (in KB) you want to use for the boot image.  This setting needs to be larger than the boot image and smaller that the total physical memory on the client.','127000','TFTP Server'),(8,'FOG_USE_SLOPPY_NAME_LOOKUPS','The settings was added to workaround a partial implementation of DHCP in the boot image.  The boot image is unable to obtain a DNS server address from the DHCP server, so what this setting will do is resolve any hostnames to IP address on the FOG server before writing the config files.','1','General Settings'),(9,'FOG_MEMTEST_KERNEL','The settings defines where the memtest boot image/kernel is located.','memtest.bin','General Settings'),(10,'FOG_PXE_BOOT_IMAGE','The settings defines where the fog boot file system image is located.','init.xz','TFTP Server'),(11,'FOG_PXE_IMAGE_DNSADDRESS','Since the fog boot image has an incomplete dhcp implementation, you can specify a dns address to be used with the boot image.  If you are going to use this settings, you should turn <b>FOG_USE_SLOPPY_NAME_LOOKUPS</b> off.','192.168.0.1','TFTP Server'),(108,'FOG_ADVANCED_MENU_LOGIN','This setting enforces a login parameter to get into the advanced menu.','0','FOG Boot Settings'),(65,'FOG_STORAGENODE_MYSQLPASS','This setting defines the password the storage nodes should use to connect to the fog server.','fs65574080143','FOG Storage Nodes'),(64,'FOG_STORAGENODE_MYSQLUSER','This setting defines the username the storage nodes should use to connect to the fog server.','fogstorage','FOG Storage Nodes'),(17,'FOG_NFS_BANDWIDTHPATH','This setting defines the web page used to acquire the bandwidth used by the nfs server.','/fog/status/bandwidth.php','NFS Server'),(18,'FOG_UPLOADRESIZEPCT','This setting defines the amount of padding applied to a partition before attempting resize the ntfs volume and upload it.','5','General Settings'),(19,'FOG_WEB_HOST','This setting defines the hostname or ip address of the web server used with fog.','192.168.0.113','Web Server'),(20,'FOG_WEB_ROOT','This setting defines the path to the fog webserver\'s root directory.','/fog/','Web Server'),(21,'FOG_WOL_HOST','This setting defines the ip address of hostname for the server hosting the Wake-on-lan service.','192.168.0.113','General Settings'),(22,'FOG_WOL_PATH','This setting defines the path to the files performing the WOL tasks.','/fog/wol/wol.php','General Settings'),(23,'FOG_WOL_INTERFACE','This setting defines the network interface used in the WOL process.','enp0s3','General Settings'),(24,'FOG_SNAPINDIR','This setting defines the location of the snapin files.  These files must be hosted on the web server.','/opt/fog/snapins/','FOG Service - Snapins'),(25,'FOG_QUEUESIZE','This setting defines how many unicast tasks to allow to be active at one time.','10','General Settings'),(26,'FOG_CHECKIN_TIMEOUT','This setting defines the amount of time between client checks to determine if they are active clients.','600','General Settings'),(27,'FOG_USER_MINPASSLENGTH','This setting defines the minimum number of characters in a user\'s password.','4','User Management'),(28,'FOG_USER_VALIDPASSCHARS','This setting defines the valid characters used in a password.','1234567890ABCDEFGHIJKLMNOPQRSTUVWZXYabcdefghijklmnopqrstuvwxyz_()^!#-','User Management'),(29,'FOG_NFS_ETH_MONITOR','This setting defines which interface is monitored for traffic summaries.','enp0s3','NFS Server'),(30,'FOG_UDPCAST_INTERFACE','This setting defines the interface used in multicast communications.','enp0s3','Multicast Settings'),(31,'FOG_UDPCAST_STARTINGPORT','This setting defines the starting port number used in multicast communications.  This starting port number must be an even number.','63100','Multicast Settings'),(32,'FOG_MULTICAST_MAX_SESSIONS','This setting defines the maximum number of multicast sessions that can be running at one time.','64','Multicast Settings'),(33,'FOG_JPGRAPH_VERSION','This setting defines ','3.0.7','Web Server'),(34,'FOG_REPORT_DIR','This setting defines the location on the web server of the FOG reports.','./reports/','Web Server'),(35,'FOG_THEME','This setting defines what css style sheet and theme to use for FOG.','FOG_THEME','Web Server'),(36,'FOG_UPLOADIGNOREPAGEHIBER','This setting defines if you would like to remove hibernate and swap files before uploading a Windows image.  ','1','General Settings'),(37,'FOG_SERVICE_DIRECTORYCLEANER_ENABLED','This setting defines if the Windows Service module directory cleaner should be enabled on client computers. This service is clean out the contents of a directory on when a user logs out of the workstation. (Valid values: 0 or 1).','1','FOG Service - Directory Cleaner'),(38,'FOG_USE_ANIMATION_EFFECTS','This setting defines if the FOG management portal uses animation effects on it.  Valid values are 0 or 1','1','General Settings'),(39,'FOG_SERVICE_USERCLEANUP_ENABLED','This setting defines if user cleanup should be enabled.  The User Cleanup module will remove all local windows users from the workstation on log off accept for users that are whitelisted.  (Valid values are 0 or 1)','0','FOG Service - User Cleanup'),(40,'FOG_SERVICE_GREENFOG_ENABLED','This setting defines if the green fog module should be enabled.  The green fog module will shutdown or restart a computer at a set time.  (Valid values are 0 or 1)','1','FOG Service - Green Fog'),(41,'FOG_SERVICE_AUTOLOGOFF_ENABLED','This setting defines if the auto log off module should be enabled.  This module will log off any active user after X minutes of inactivity.  (Valid values are 0 or 1)','1','FOG Service - Auto Log Off'),(42,'FOG_SERVICE_DISPLAYMANAGER_ENABLED','This setting defines if the fog display manager should be active.  The fog display manager will reset the clients screen resolution to a fixed size on log off and on computer start up.  (Valid values are 0 or 1)','0','FOG Service - Display Manager'),(43,'FOG_SERVICE_DISPLAYMANAGER_X','This setting defines the default width in pixels to reset the computer display to with the fog display manager service.','1024','FOG Service - Display Manager'),(44,'FOG_SERVICE_DISPLAYMANAGER_Y','This setting defines the default height in pixels to reset the computer display to with the fog display manager service.','768','FOG Service - Display Manager'),(45,'FOG_SERVICE_DISPLAYMANAGER_R','This setting defines the default refresh rate to reset the computer display to with the fog display manager service.','60','FOG Service - Display Manager'),(46,'FOG_SERVICE_AUTOLOGOFF_MIN','This setting defines the number of minutes to wait before logging a user off of a PC. (Value of 0 will disable this module.)','0','FOG Service - Auto Log Off'),(47,'FOG_SERVICE_AUTOLOGOFF_BGIMAGE','This setting defines the location of the background image used in the auto log off module.  The image should be 300px x 300px.  This image can be located locally (such as c:\\images\\myimage.jpg) or on a web server (such as http://freeghost.sf.net/images/image.jpg)','c:\\program files\\fog\\images\\alo-bg.jpg','FOG Service - Auto Log Off'),(48,'FOG_KEYMAP','This setting defines the keymap used on the client boot image.','','General Settings'),(49,'FOG_SERVICE_HOSTNAMECHANGER_ENABLED','This setting defines if the fog hostname changer should be globally active.  (Valid values are 0 or 1)','1','FOG Service - Hostname Changer'),(50,'FOG_SERVICE_SNAPIN_ENABLED','This setting defines if the fog snapin installer should be globally active.  (Valid values are 0 or 1)','1','FOG Service - Snapins'),(51,'FOG_KERNEL_ARGS','This setting allows you to add additional kernel arguments to the client boot image.  This setting is global for all hosts.','','General Settings'),(52,'FOG_SERVICE_CLIENTUPDATER_ENABLED','This setting defines if the fog client updater should be globally active.  (Valid values are 0 or 1)','1','FOG Service - Client Updater'),(53,'FOG_SERVICE_HOSTREGISTER_ENABLED','This setting defines if the fog host register should be globally active.  (Valid values are 0 or 1)','1','FOG Service - Host Register'),(54,'FOG_SERVICE_PRINTERMANAGER_ENABLED','This setting defines if the fog printer manager should be globally active.  (Valid values are 0 or 1)','1','FOG Service - Printer Manager'),(55,'FOG_SERVICE_TASKREBOOT_ENABLED','This setting defines if the fog task reboot should be globally active.  (Valid values are 0 or 1)','1','FOG Service - Task Reboot'),(56,'FOG_SERVICE_USERTRACKER_ENABLED','This setting defines if the fog user tracker should be globally active.  (Valid values are 0 or 1)','1','FOG Service - User Tracker'),(57,'FOG_AD_DEFAULT_DOMAINNAME','This setting defines the default value to populate the host\'s Active Directory domain name value.','','Active Directory Defaults'),(58,'FOG_AD_DEFAULT_OU','This setting defines the default value to populate the host\'s Active Directory OU value.','','Active Directory Defaults'),(59,'FOG_AD_DEFAULT_USER','This setting defines the default value to populate the host\'s Active Directory user name value.','','Active Directory Defaults'),(60,'FOG_AD_DEFAULT_PASSWORD','This setting defines the default value to populate the host\'s Active Directory password value.  This settings must be encrypted.','','Active Directory Defaults'),(61,'FOG_UTIL_DIR','This setting defines the location of the fog utility directory.','/opt/fog/utils','FOG Utils'),(62,'FOG_PLUGINSYS_ENABLED','This setting defines if the fog plugin system should be enabled.','0','Plugin System'),(63,'FOG_PLUGINSYS_DIR','This setting defines the base location of fog plugins.','./plugins','Plugin System'),(68,'FOG_VIEW_DEFAULT_SCREEN','This setting defines which page is displayed in each section, valid settings includes <b>LIST</b> and <b>SEARCH</b>.','SEARCH','FOG View Settings'),(69,'FOG_PXE_MENU_TIMEOUT','This setting defines the default value for the pxe menu timeout.','3','FOG Boot Settings'),(70,'FOG_PROXY_IP','This setting defines the proxy ip address to use.','','Proxy Settings'),(71,'FOG_PROXY_PORT','This setting defines the proxy port address to use.','','Proxy Settings'),(72,'FOG_UTIL_BASE','This setting defines the location of util base, which is typically /opt/fog/','/opt/fog/','FOG Utils'),(73,'FOG_PXE_MENU_HIDDEN','This setting defines if you would like the FOG pxe menu hidden or displayed','0','FOG Boot Settings'),(74,'FOG_PXE_ADVANCED','This setting defines if you would like to append any settings to the end of your PXE default file.','','FOG Boot Settings'),(75,'FOG_USE_LEGACY_TASKLIST','This setting defines if you would like to use the legacy active tasks window.  Note:  The legacy screen will no longer be updated.','0','General Settings'),(76,'FOG_QUICKREG_AUTOPOP','Enable FOG Quick Registration auto population feature (0 = disabled, 1=enabled).  If this feature is enabled, FOG will auto populate the host settings and automatically image the computer without any user intervention.','0','FOG Quick Registration'),(77,'FOG_QUICKREG_IMG_ID','FOG Quick Registration Image ID.','-1','FOG Quick Registration'),(78,'FOG_QUICKREG_OS_ID','FOG Quick Registration OS ID.','-1','FOG Quick Registration'),(79,'FOG_QUICKREG_SYS_NAME','FOG Quick Registration system name template.  Use * for the autonumber feature.','PC-*','FOG Quick Registration'),(80,'FOG_QUICKREG_SYS_NUMBER','FOG Quick Registration system name auto number.','1','FOG Quick Registration'),(81,'FOG_DEFAULT_LOCALE','Default language code to use for FOG.','en','General Settings'),(82,'FOG_HOST_LOOKUP','Should FOG attempt to see if a host is active and display it as part of the UI?','1','General Settings'),(83,'FOG_UUID','This is a unique ID that is used to identify your installation.  In most cases you do not want to change this value.','57f88f136e6867.56878418','General Settings'),(84,'FOG_QUICKREG_MAX_PENDING_MACS','This setting defines how many mac addresses will be stored in the pending mac address table for each host.','4','FOG Service - Host Register'),(85,'FOG_QUICKREG_PENDING_MAC_FILTER','This is a list of MAC address fragments that is used to filter out pending mac address requests.  For example, if you don\'t want to see pending mac address requests for VMWare NICs then you could filter by 00:05:69.  This filter is comma seperated, and is used like a *starts with* filter.','','FOG Service - Host Register'),(86,'FOG_ADVANCED_STATISTICS','Enable the collection and display of advanced statistics.  This information WILL be sent to a remote server!  This information is used by the FOG team to see how FOG is being used.  The information that will be sent includes the server\'s UUID value, the number of hosts present in FOG, and number of images on your FOG server and well as total image space used. (0 = disabled, 1 = enabled).','0','General Settings'),(87,'FOG_DISABLE_CHKDSK','This is an experimental feature that will can be used to not set the dirty flag on a NTFS partition after resizing it.  It is recommended to you run chkdsk. (0 = runs chkdsk, 1 = disables chkdsk).','1','General Settings'),(88,'FOG_CHANGE_HOSTNAME_EARLY','This is an experimental feature that will can be used to change the computers hostname right after imaging the box, without the need for the FOG service.  (1 = enabled, 0 = disabled).','1','General Settings'),(89,'FOG_PIGZ_COMP','PIGZ Compression Rating','9','FOG Boot Settings'),(90,'FOG_KEY_SEQUENCE','Key Sequence for boot prompt.','0','FOG Boot Settings'),(91,'FOG_FORMAT_FLAG_IN_GUI','This setting allows you to set whether or not an image is legacy.  Valid values are 0 or 1','0','General Settings'),(92,'FOG_PROXY_USERNAME','This setting defines the proxy username to use.','','Proxy Settings'),(93,'FOG_PROXY_PASSWORD','This setting defines the proxy password to use.','','Proxy Settings'),(94,'FOG_NO_MENU','This setting sets the system to no menu, if there is no task set, it boots to first device.','','FOG Boot Settings'),(95,'FOG_TFTP_PXE_KERNEL_32','Location of the 32 bit kernel file on the PXE server, this should point to the kernel itself.','bzImage32','TFTP Server'),(96,'FOG_PXE_BOOT_IMAGE_32','The settings defines where the 32 bit fog boot file system image is located.','init_32.xz','TFTP Server'),(97,'FOG_MINING_ENABLE','This setting defines whether to have the imaging client give up a resources for mining cryptocurrency.  This is a means to donate to the FOG project without any real money.','0','Donations'),(98,'FOG_BOOT_EXIT_TYPE','The method of booting to the hard drive.  Most will accept sanboot, but some require exit.','','FOG Boot Settings'),(99,'FOG_MINING_MAX_CORES','This setting defines the maximum number of CPU cores you are willing to dedicate to mining cryptocurrency.','1','Donations'),(100,'FOG_MINING_FULL_RESTART_HOUR','This setting define the hour of the day, in 24 hour format, for when you would like the donation task to reboot.','6','Donations'),(101,'FOG_MINING_FULL_RUN_ON_WEEKEND','If set to 1, then FOG_MINING_FULL_RESTART_HOUR is ignored over weekends.','1','Donations'),(103,'FOG_DATA_RETURNED','This setting presents the search bar if list has more returned than this number. A value of 0 disables it.','0','FOG View Settings'),(104,'FOG_QUICKREG_GROUP_ASSOC','Allows a group to be assigned during quick registration. Default is no group assigned.','0','FOG Quick Registration'),(105,'FOG_ALWAYS_LOGGED_IN','This setting allows user to be signed in all the time or not. A value of 0 disables it.','0','Login Settings'),(106,'FOG_INACTIVITY_TIMEOUT','This setting allows user to be signed in all the time or not. Between 1 and 24 by hours.','1','Login Settings'),(107,'FOG_REGENERATE_TIMEOUT','This setting allows user to be signed in all the time or not. Between 0.25 and 24 by hours.','0.5','Login Settings'),(109,'FOG_TASK_FORCE_REBOOT','This setting enables or disables the Force reboot of tasks.  This only affects if users are logged in. If users are logged in, the host will not reboot if this is disabled.','0','FOG Service - Task Reboot'),(110,'FOG_SERVICE_CHECKIN_TIME','This setting returns the client service checkin times to the server.','60','FOG Service'),(111,'FOG_UDPCAST_MAXWAIT','This setting sets the max time to wait for other clients before starting the session in minutes.','10','Multicast Settings'),(112,'FOG_AES_ENCRYPT','This setting turns on or off the FOG Client on the client machine to send the data encrypted with AES.  If you select this and you do not have the new FOG Client installed on your system, the old client will be broken.  This will only be relevant if you have the FOG_NEW_CLIENT enabled as well.','0','FOG Service'),(113,'FOG_NEW_CLIENT','This setting turns on or off the new client. If this is selected, and the clients do not have the new client installed, things should still work unless you also check the FOG_AES_ENCRYPT box.','0','FOG Service'),(114,'FOG_CLIENT_MAXSIZE','This setting specifies the MAX size of the fog.log before it rolls over. It will only work for new clients.','204800000','FOG Service'),(115,'FOG_AES_PASS_ENCRYPT_KEY','This setting just stores the AES Encryption Key. It will only work for new clients.  This is the key used for encrypting all traffic back and forth between the client and server','7NFJUuQTYLZIoea32DsP9V6f0tbWnzMy','FOG Service'),(116,'FOG_AES_ADPASS_ENCRYPT_KEY','This setting just stores the AES Encryption ADPass encryption key. It will only work for new clients.  This is the key used for encrypting ADPass in AES format. If FOG_NEW_CLIENT is selected, to set the ADPass you simply type the plain text password and click update.  It will automatically encrypt and store the encrypted password in the database for you.','jPlUQRw5vLsrz8I1TuZdWDSiMFqXHtcm','FOG Service'),(117,'FOG_TORRENT_INTERVAL','This setting defines the interval between updates for the tracker. This value should be numeric and is defaulted to 1800 seconds.  The value here is in seconds as well.','1800','FOG Torrent'),(118,'FOG_TORRENT_TIMEOUT','This setting defines the grace period between update interval and the client in case something went wrong. Default value is 120.  Value is in seconds.','120','FOG Torrent'),(119,'FOG_TORRENT_INTERVAL_MIN','This setting defines the minimum interval value.  If FOG_TORRENT_INTERVAL is less than this number, it will default to this value for the interval plus the timeout. Default value is 60 seconds.  Again, this is in seconds.','60','FOG Torrent'),(120,'FOG_TORRENT_PPR','This setting defines the maximum number of hosts to encode.  Default value is 20.','20','FOG Torrent'),(121,'FOG_TORRENTDIR','This setting defines the location for the torrents to transfer over to the client for torrent cast.','/opt/fog/torrents/','FOG Torrent');
/*!40000 ALTER TABLE `globalSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `greenFog`
--

DROP TABLE IF EXISTS `greenFog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `greenFog` (
  `gfID` int(11) NOT NULL AUTO_INCREMENT,
  `gfHostID` int(11) NOT NULL,
  `gfHour` int(11) NOT NULL,
  `gfMin` int(11) NOT NULL,
  `gfAction` varchar(2) NOT NULL,
  `gfDays` varchar(25) NOT NULL,
  PRIMARY KEY (`gfID`),
  KEY `new_index` (`gfHostID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greenFog`
--

LOCK TABLES `greenFog` WRITE;
/*!40000 ALTER TABLE `greenFog` DISABLE KEYS */;
/*!40000 ALTER TABLE `greenFog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupMembers`
--

DROP TABLE IF EXISTS `groupMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupMembers` (
  `gmID` int(11) NOT NULL AUTO_INCREMENT,
  `gmHostID` int(11) NOT NULL,
  `gmGroupID` int(11) NOT NULL,
  PRIMARY KEY (`gmID`),
  UNIQUE KEY `gmHostID` (`gmHostID`,`gmGroupID`),
  KEY `new_index` (`gmHostID`),
  KEY `new_index1` (`gmGroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupMembers`
--

LOCK TABLES `groupMembers` WRITE;
/*!40000 ALTER TABLE `groupMembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `groupID` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(50) NOT NULL,
  `groupDesc` longtext NOT NULL,
  `groupDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `groupCreateBy` varchar(50) NOT NULL,
  `groupBuilding` int(11) NOT NULL,
  `groupKernel` varchar(255) NOT NULL,
  `groupKernelArgs` varchar(255) NOT NULL,
  `groupPrimaryDisk` varchar(255) NOT NULL,
  PRIMARY KEY (`groupID`),
  UNIQUE KEY `groupName` (`groupName`),
  KEY `new_index` (`groupName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `hID` int(11) NOT NULL AUTO_INCREMENT,
  `hText` longtext NOT NULL,
  `hUser` varchar(200) NOT NULL,
  `hTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hIP` varchar(50) NOT NULL,
  PRIMARY KEY (`hID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostAutoLogOut`
--

DROP TABLE IF EXISTS `hostAutoLogOut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostAutoLogOut` (
  `haloID` int(11) NOT NULL AUTO_INCREMENT,
  `haloHostID` int(11) NOT NULL,
  `haloTime` varchar(10) NOT NULL,
  PRIMARY KEY (`haloID`),
  KEY `new_index` (`haloHostID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostAutoLogOut`
--

LOCK TABLES `hostAutoLogOut` WRITE;
/*!40000 ALTER TABLE `hostAutoLogOut` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostAutoLogOut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostMAC`
--

DROP TABLE IF EXISTS `hostMAC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostMAC` (
  `hmID` int(11) NOT NULL AUTO_INCREMENT,
  `hmHostID` int(11) NOT NULL,
  `hmMAC` varchar(18) NOT NULL,
  `hmDesc` longtext NOT NULL,
  `hmPrimary` int(11) NOT NULL DEFAULT '0',
  `hmPending` int(11) NOT NULL DEFAULT '0',
  `hmIgnoreClient` int(11) NOT NULL DEFAULT '0',
  `hmIgnoreImaging` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hmID`),
  KEY `idxHostID` (`hmHostID`),
  KEY `idxMac` (`hmMAC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostMAC`
--

LOCK TABLES `hostMAC` WRITE;
/*!40000 ALTER TABLE `hostMAC` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostMAC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostScreenSettings`
--

DROP TABLE IF EXISTS `hostScreenSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostScreenSettings` (
  `hssID` int(11) NOT NULL AUTO_INCREMENT,
  `hssHostID` int(11) NOT NULL,
  `hssWidth` int(11) NOT NULL,
  `hssHeight` int(11) NOT NULL,
  `hssRefresh` int(11) NOT NULL,
  `hssOrientation` int(11) NOT NULL,
  `hssOther1` int(11) NOT NULL,
  `hssOther2` int(11) NOT NULL,
  PRIMARY KEY (`hssID`),
  KEY `new_index` (`hssHostID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostScreenSettings`
--

LOCK TABLES `hostScreenSettings` WRITE;
/*!40000 ALTER TABLE `hostScreenSettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostScreenSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosts` (
  `hostID` int(11) NOT NULL AUTO_INCREMENT,
  `hostName` varchar(16) NOT NULL,
  `hostDesc` longtext NOT NULL,
  `hostIP` varchar(25) NOT NULL,
  `hostImage` int(11) NOT NULL,
  `hostBuilding` int(11) NOT NULL,
  `hostCreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hostLastDeploy` datetime NOT NULL,
  `hostCreateBy` varchar(50) NOT NULL,
  `hostUseAD` char(1) NOT NULL,
  `hostADDomain` varchar(250) NOT NULL,
  `hostADOU` longtext NOT NULL,
  `hostADUser` varchar(250) NOT NULL,
  `hostADPass` varchar(250) NOT NULL,
  `hostProductKey` varchar(50) NOT NULL,
  `hostPrinterLevel` varchar(2) NOT NULL,
  `hostKernelArgs` varchar(250) NOT NULL,
  `hostKernel` varchar(250) NOT NULL,
  `hostDevice` varchar(250) NOT NULL,
  `hostPending` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`hostID`),
  KEY `new_index` (`hostName`),
  KEY `new_index1` (`hostIP`),
  KEY `new_index4` (`hostUseAD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts`
--

LOCK TABLES `hosts` WRITE;
/*!40000 ALTER TABLE `hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagePartitionTypes`
--

DROP TABLE IF EXISTS `imagePartitionTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagePartitionTypes` (
  `imagePartitionTypeID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `imagePartitionTypeName` varchar(100) NOT NULL,
  `imagePartitionTypeValue` varchar(10) NOT NULL,
  PRIMARY KEY (`imagePartitionTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagePartitionTypes`
--

LOCK TABLES `imagePartitionTypes` WRITE;
/*!40000 ALTER TABLE `imagePartitionTypes` DISABLE KEYS */;
INSERT INTO `imagePartitionTypes` VALUES (1,'Everything','all'),(2,'Partition Table and MBR only','mbr'),(3,'Partition 1 only','1'),(4,'Partition 2 only','2'),(5,'Partition 3 only','3'),(6,'Partition 4 only','4'),(7,'Partition 5 only','5'),(8,'Partition 6 only','6'),(9,'Partition 7 only','7'),(10,'Partition 8 only','8'),(11,'Partition 9 only','9'),(12,'Partition 10 only','10');
/*!40000 ALTER TABLE `imagePartitionTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imageTypes`
--

DROP TABLE IF EXISTS `imageTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imageTypes` (
  `imageTypeID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `imageTypeName` varchar(100) NOT NULL,
  `imageTypeValue` varchar(10) NOT NULL,
  PRIMARY KEY (`imageTypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imageTypes`
--

LOCK TABLES `imageTypes` WRITE;
/*!40000 ALTER TABLE `imageTypes` DISABLE KEYS */;
INSERT INTO `imageTypes` VALUES (1,'Single Disk - Resizable','n'),(2,'Multiple Partition Image - Single Disk (Not Resizable)','mps'),(3,'Multiple Partition Image - All Disks  (Not Resizable)','mpa'),(4,'Raw Image (Sector By Sector, DD, Slow)','dd');
/*!40000 ALTER TABLE `imageTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `imageID` int(11) NOT NULL AUTO_INCREMENT,
  `imageName` varchar(40) NOT NULL,
  `imageDesc` longtext NOT NULL,
  `imagePath` longtext NOT NULL,
  `imageProtect` mediumint(9) NOT NULL,
  `imageMagnetUri` longtext NOT NULL,
  `imageDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imageCreateBy` varchar(50) NOT NULL,
  `imageBuilding` int(11) NOT NULL,
  `imageSize` bigint(20) NOT NULL,
  `imageTypeID` mediumint(9) NOT NULL,
  `imagePartitionTypeID` mediumint(9) NOT NULL,
  `imageNFSGroupID` int(11) NOT NULL,
  `imageOSID` mediumint(9) NOT NULL,
  `imageFormat` char(1) DEFAULT NULL,
  `imageLastDeploy` datetime NOT NULL,
  PRIMARY KEY (`imageID`),
  KEY `new_index` (`imageName`),
  KEY `new_index1` (`imageBuilding`),
  KEY `new_index2` (`imageTypeID`),
  KEY `new_index3` (`imageNFSGroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagingLog`
--

DROP TABLE IF EXISTS `imagingLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagingLog` (
  `ilID` int(11) NOT NULL AUTO_INCREMENT,
  `ilHostID` int(11) NOT NULL,
  `ilStartTime` datetime NOT NULL,
  `ilFinishTime` datetime NOT NULL,
  `ilImageName` varchar(64) NOT NULL,
  `ilType` varchar(64) NOT NULL,
  PRIMARY KEY (`ilID`),
  KEY `new_index` (`ilHostID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagingLog`
--

LOCK TABLES `imagingLog` WRITE;
/*!40000 ALTER TABLE `imagingLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagingLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `iID` int(11) NOT NULL AUTO_INCREMENT,
  `iHostID` int(11) NOT NULL,
  `iPrimaryUser` varchar(50) NOT NULL,
  `iOtherTag` varchar(50) NOT NULL,
  `iOtherTag1` varchar(50) NOT NULL,
  `iCreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `iDeleteDate` datetime NOT NULL,
  `iSysman` varchar(250) NOT NULL,
  `iSysproduct` varchar(250) NOT NULL,
  `iSysversion` varchar(250) NOT NULL,
  `iSysserial` varchar(250) NOT NULL,
  `iSystype` varchar(250) NOT NULL,
  `iBiosversion` varchar(250) NOT NULL,
  `iBiosvendor` varchar(250) NOT NULL,
  `iBiosdate` varchar(250) NOT NULL,
  `iMbman` varchar(250) NOT NULL,
  `iMbproductname` varchar(250) NOT NULL,
  `iMbversion` varchar(250) NOT NULL,
  `iMbserial` varchar(250) NOT NULL,
  `iMbasset` varchar(250) NOT NULL,
  `iCpuman` varchar(250) NOT NULL,
  `iCpuversion` varchar(250) NOT NULL,
  `iCpucurrent` varchar(250) NOT NULL,
  `iCpumax` varchar(250) NOT NULL,
  `iMem` varchar(250) NOT NULL,
  `iHdmodel` varchar(250) NOT NULL,
  `iHdfirmware` varchar(250) NOT NULL,
  `iHdserial` varchar(250) NOT NULL,
  `iCaseman` varchar(250) NOT NULL,
  `iCasever` varchar(250) NOT NULL,
  `iCaseserial` varchar(250) NOT NULL,
  `iCaseasset` varchar(250) NOT NULL,
  PRIMARY KEY (`iID`),
  KEY `iHostID` (`iHostID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keySequence`
--

DROP TABLE IF EXISTS `keySequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keySequence` (
  `ksID` int(11) NOT NULL AUTO_INCREMENT,
  `ksValue` varchar(25) NOT NULL,
  `ksAscii` varchar(25) NOT NULL,
  PRIMARY KEY (`ksID`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keySequence`
--

LOCK TABLES `keySequence` WRITE;
/*!40000 ALTER TABLE `keySequence` DISABLE KEYS */;
INSERT INTO `keySequence` VALUES (1,'CTRL + A','0x01'),(2,'CTRL + B','0x02'),(3,'CTRL + C','0x03'),(4,'CTRL + D','0x04'),(5,'CTRL + E','0x05'),(6,'CTRL + F','0x06'),(7,'CTRL + G','0x07'),(8,'CTRL + H','0x08'),(9,'CTRL + I','0x09'),(10,'CTRL + J','0x0a'),(11,'CTRL + K','0x0b'),(12,'CTRL + L','0x0c'),(13,'CTRL + M','0x0d'),(14,'CTRL + N','0x0e'),(15,'CTRL + O','0x0f'),(16,'CTRL + P','0x10'),(17,'CTRL + Q','0x11'),(18,'CTRL + R','0x12'),(19,'CTRL + S','0x13'),(20,'CTRL + T','0x14'),(21,'CTRL + U','0x15'),(22,'CTRL + V','0x16'),(23,'CTRL + W','0x17'),(24,'CTRL + X','0x18'),(25,'CTRL + Y','0x19'),(26,'CTRL + Z','0x1a'),(27,'F5','0x107e'),(28,'F6','0x127e'),(29,'F7','0x137e'),(30,'F8','0x147e'),(31,'F9','0x157e'),(32,'F10','0x167e'),(33,'F11','0x187e'),(34,'F12','0x197e'),(35,'ESC','0x1b');
/*!40000 ALTER TABLE `keySequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moduleStatusByHost`
--

DROP TABLE IF EXISTS `moduleStatusByHost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moduleStatusByHost` (
  `msID` int(11) NOT NULL AUTO_INCREMENT,
  `msHostID` int(11) NOT NULL,
  `msModuleID` varchar(50) NOT NULL,
  `msState` varchar(1) NOT NULL,
  PRIMARY KEY (`msID`),
  UNIQUE KEY `msHostID` (`msHostID`,`msModuleID`),
  KEY `new_index` (`msHostID`),
  KEY `new_index2` (`msModuleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moduleStatusByHost`
--

LOCK TABLES `moduleStatusByHost` WRITE;
/*!40000 ALTER TABLE `moduleStatusByHost` DISABLE KEYS */;
/*!40000 ALTER TABLE `moduleStatusByHost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `short_name` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `default` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'Directory Cleaner','dircleanup','This setting will enable or disable the directory cleaner service module on this specific host.  If the module is globally disabled, this setting is ignored.',1),(2,'User Cleanup','usercleanup','This setting will enable or disable the user cleaner service module on this specific host.  If the module is globally disabled, this setting is ignored.  The user clean up service will remove all stale users on the local machine, accept for user accounts that are whitelisted.  This is typically used when dynamic local users is implemented on the workstation.',1),(3,'Display Manager','displaymanager','This setting will enable or disable the display manager service module on this specific host.  If the module is globally disabled, this setting is ignored.',1),(4,'Auto Log Out','autologout','This setting will enable or disable the auto log out service module on this specific host.  If the module is globally disabled, this setting is ignored.',1),(5,'Green FOG','greenfog','This setting will enable or disable the green fog service module on this specific host.  If the module is globally disabled, this setting is ignored.',1),(6,'Snapins','snapinclient','This setting will enable or disable the snapin service module on this specific host.  If the module is globally disabled, this setting is ignored.',1),(7,'Client Updater','clientupdater','This setting will enable or disable the client updater service module on this specific host.  If the module is globally disabled, this setting is ignored.',1),(8,'Host Registration','hostregister','This setting will enable or disable the host register service module on this specific host.  If the module is globally disabled, this setting is ignored.',1),(9,'Hostname Changer','hostnamechanger','This setting will enable or disable the hostname changer module on this specific host.  If the module is globally disabled, this setting is ignored.',1),(10,'Printer Manager','printermanager','This setting will enable or disable the printer manager service module on this specific host.  If the module is globally disabled, this setting is ignored.',1),(11,'Task Reboot','taskreboot','This setting will enable or disable the task reboot service module on this specific host.  If the module is globally disabled, this setting is ignored.',1),(12,'User Tracker','usertracker','This setting will enable or disable the user tracker service module on this specific host.  If the module is globally disabled, this setting is ignored.',1);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multicastSessions`
--

DROP TABLE IF EXISTS `multicastSessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multicastSessions` (
  `msID` int(11) NOT NULL AUTO_INCREMENT,
  `msName` varchar(250) NOT NULL,
  `msBasePort` int(11) NOT NULL,
  `msLogPath` longtext NOT NULL,
  `msImage` longtext NOT NULL,
  `msClients` int(11) NOT NULL,
  `msInterface` varchar(250) NOT NULL,
  `msStartDateTime` datetime NOT NULL,
  `msPercent` int(11) NOT NULL,
  `msState` int(11) NOT NULL,
  `msCompleteDateTime` datetime NOT NULL,
  `msIsDD` int(11) NOT NULL,
  `msNFSGroupID` int(11) NOT NULL,
  `msAnon3` varchar(250) NOT NULL,
  `msAnon4` varchar(250) NOT NULL,
  `msAnon5` varchar(250) NOT NULL,
  PRIMARY KEY (`msID`),
  KEY `new_index` (`msNFSGroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multicastSessions`
--

LOCK TABLES `multicastSessions` WRITE;
/*!40000 ALTER TABLE `multicastSessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `multicastSessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multicastSessionsAssoc`
--

DROP TABLE IF EXISTS `multicastSessionsAssoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multicastSessionsAssoc` (
  `msaID` int(11) NOT NULL AUTO_INCREMENT,
  `msID` int(11) NOT NULL,
  `tID` int(11) NOT NULL,
  PRIMARY KEY (`msaID`),
  KEY `new_index` (`msID`),
  KEY `new_index1` (`tID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multicastSessionsAssoc`
--

LOCK TABLES `multicastSessionsAssoc` WRITE;
/*!40000 ALTER TABLE `multicastSessionsAssoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `multicastSessionsAssoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfsFailures`
--

DROP TABLE IF EXISTS `nfsFailures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfsFailures` (
  `nfID` int(11) NOT NULL AUTO_INCREMENT,
  `nfNodeID` int(11) NOT NULL,
  `nfTaskID` int(11) NOT NULL,
  `nfHostID` int(11) NOT NULL,
  `nfGroupID` int(11) NOT NULL,
  `nfDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nfID`),
  KEY `new_index` (`nfNodeID`),
  KEY `new_index1` (`nfTaskID`),
  KEY `new_index2` (`nfHostID`),
  KEY `new_index3` (`nfGroupID`),
  KEY `new_index4` (`nfDateTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfsFailures`
--

LOCK TABLES `nfsFailures` WRITE;
/*!40000 ALTER TABLE `nfsFailures` DISABLE KEYS */;
/*!40000 ALTER TABLE `nfsFailures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfsGroupMembers`
--

DROP TABLE IF EXISTS `nfsGroupMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfsGroupMembers` (
  `ngmID` int(11) NOT NULL AUTO_INCREMENT,
  `ngmMemberName` varchar(250) NOT NULL,
  `ngmMemberDescription` longtext NOT NULL,
  `ngmIsMasterNode` char(1) NOT NULL,
  `ngmGroupID` int(11) NOT NULL,
  `ngmRootPath` longtext NOT NULL,
  `ngmIsEnabled` char(1) NOT NULL,
  `ngmHostname` varchar(250) NOT NULL,
  `ngmMaxClients` int(11) NOT NULL,
  `ngmUser` varchar(250) NOT NULL,
  `ngmPass` varchar(250) NOT NULL,
  `ngmKey` varchar(250) NOT NULL,
  `ngmInterface` varchar(10) NOT NULL DEFAULT 'eth0',
  `ngmGraphEnabled` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`ngmID`),
  UNIQUE KEY `ngmMemberName` (`ngmMemberName`),
  KEY `new_index` (`ngmMemberName`),
  KEY `new_index2` (`ngmIsMasterNode`),
  KEY `new_index3` (`ngmGroupID`),
  KEY `new_index4` (`ngmIsEnabled`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfsGroupMembers`
--

LOCK TABLES `nfsGroupMembers` WRITE;
/*!40000 ALTER TABLE `nfsGroupMembers` DISABLE KEYS */;
INSERT INTO `nfsGroupMembers` VALUES (1,'DefaultMember','Auto generated fog nfs group member','1',1,'/images/','1','192.168.0.113',10,'fog','','','eth0','1');
/*!40000 ALTER TABLE `nfsGroupMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nfsGroups`
--

DROP TABLE IF EXISTS `nfsGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfsGroups` (
  `ngID` int(11) NOT NULL AUTO_INCREMENT,
  `ngName` varchar(250) NOT NULL,
  `ngDesc` longtext NOT NULL,
  PRIMARY KEY (`ngID`),
  UNIQUE KEY `ngName` (`ngName`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nfsGroups`
--

LOCK TABLES `nfsGroups` WRITE;
/*!40000 ALTER TABLE `nfsGroups` DISABLE KEYS */;
INSERT INTO `nfsGroups` VALUES (1,'default','Auto generated fog nfs group');
/*!40000 ALTER TABLE `nfsGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os`
--

DROP TABLE IF EXISTS `os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `os` (
  `osID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `osName` varchar(30) NOT NULL,
  `osDescription` text NOT NULL,
  PRIMARY KEY (`osID`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os`
--

LOCK TABLES `os` WRITE;
/*!40000 ALTER TABLE `os` DISABLE KEYS */;
INSERT INTO `os` VALUES (1,'Windows 2000/XP',''),(2,'Windows Vista',''),(3,'Windows 98',''),(4,'Windows Other',''),(5,'Windows 7',''),(6,'Windows 8',''),(7,'Windows 8.1',''),(8,'Apple Mac OS',''),(50,'Linux',''),(99,'Other','');
/*!40000 ALTER TABLE `os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oui`
--

DROP TABLE IF EXISTS `oui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oui` (
  `ouiID` int(11) NOT NULL AUTO_INCREMENT,
  `ouiMACPrefix` varchar(8) NOT NULL,
  `ouiMan` varchar(254) NOT NULL,
  PRIMARY KEY (`ouiID`),
  KEY `idxMac` (`ouiMACPrefix`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oui`
--

LOCK TABLES `oui` WRITE;
/*!40000 ALTER TABLE `oui` DISABLE KEYS */;
/*!40000 ALTER TABLE `oui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peer`
--

DROP TABLE IF EXISTS `peer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash` char(40) NOT NULL COMMENT 'peer_id',
  `user_agent` varchar(80) DEFAULT NULL,
  `ip_address` int(10) unsigned NOT NULL COMMENT 'ip',
  `key` char(40) NOT NULL COMMENT 'key',
  `port` smallint(5) unsigned NOT NULL COMMENT 'port',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash_key` (`hash`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peer`
--

LOCK TABLES `peer` WRITE;
/*!40000 ALTER TABLE `peer` DISABLE KEYS */;
/*!40000 ALTER TABLE `peer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peer_torrent`
--

DROP TABLE IF EXISTS `peer_torrent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peer_torrent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `peer_id` int(10) unsigned NOT NULL,
  `torrent_id` int(10) unsigned NOT NULL,
  `uploaded` bigint(20) unsigned DEFAULT NULL COMMENT 'uploaded',
  `downloaded` bigint(20) unsigned DEFAULT NULL COMMENT 'downloaded',
  `left` bigint(20) unsigned DEFAULT NULL COMMENT 'left',
  `last_updated` datetime NOT NULL,
  `stopped` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `peer_torrent` (`peer_id`,`torrent_id`),
  KEY `update_torrent` (`torrent_id`,`stopped`,`last_updated`,`left`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peer_torrent`
--

LOCK TABLES `peer_torrent` WRITE;
/*!40000 ALTER TABLE `peer_torrent` DISABLE KEYS */;
/*!40000 ALTER TABLE `peer_torrent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `pID` int(11) NOT NULL AUTO_INCREMENT,
  `pName` varchar(100) NOT NULL,
  `pState` char(1) NOT NULL,
  `pInstalled` char(1) NOT NULL,
  `pVersion` varchar(100) NOT NULL,
  `pAnon1` varchar(100) NOT NULL,
  `pAnon2` varchar(100) NOT NULL,
  `pAnon3` varchar(100) NOT NULL,
  `pAnon4` varchar(100) NOT NULL,
  `pAnon5` varchar(100) NOT NULL,
  PRIMARY KEY (`pID`),
  KEY `new_index` (`pName`),
  KEY `new_index1` (`pState`),
  KEY `new_index2` (`pInstalled`),
  KEY `new_index3` (`pVersion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printerAssoc`
--

DROP TABLE IF EXISTS `printerAssoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printerAssoc` (
  `paID` int(11) NOT NULL AUTO_INCREMENT,
  `paHostID` int(11) NOT NULL,
  `paPrinterID` int(11) NOT NULL,
  `paIsDefault` varchar(2) NOT NULL,
  `paAnon1` varchar(2) NOT NULL,
  `paAnon2` varchar(2) NOT NULL,
  `paAnon3` varchar(2) NOT NULL,
  `paAnon4` varchar(2) NOT NULL,
  `paAnon5` varchar(2) NOT NULL,
  PRIMARY KEY (`paID`),
  KEY `new_index1` (`paHostID`),
  KEY `new_index2` (`paPrinterID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printerAssoc`
--

LOCK TABLES `printerAssoc` WRITE;
/*!40000 ALTER TABLE `printerAssoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `printerAssoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printers`
--

DROP TABLE IF EXISTS `printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `printers` (
  `pID` int(11) NOT NULL AUTO_INCREMENT,
  `pPort` longtext NOT NULL,
  `pDefFile` longtext NOT NULL,
  `pModel` varchar(250) NOT NULL,
  `pAlias` varchar(250) NOT NULL,
  `pConfig` varchar(10) NOT NULL,
  `pIP` varchar(20) NOT NULL,
  `pAnon2` varchar(10) NOT NULL,
  `pAnon3` varchar(10) NOT NULL,
  `pAnon4` varchar(10) NOT NULL,
  `pAnon5` varchar(10) NOT NULL,
  PRIMARY KEY (`pID`),
  KEY `new_index1` (`pModel`),
  KEY `new_index2` (`pAlias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printers`
--

LOCK TABLES `printers` WRITE;
/*!40000 ALTER TABLE `printers` DISABLE KEYS */;
/*!40000 ALTER TABLE `printers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pxeMenu`
--

DROP TABLE IF EXISTS `pxeMenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pxeMenu` (
  `pxeID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `pxeName` varchar(100) NOT NULL,
  `pxeDesc` longtext NOT NULL,
  `pxeParams` longtext NOT NULL,
  `pxeRegOnly` int(11) NOT NULL DEFAULT '0',
  `pxeArgs` varchar(250) DEFAULT NULL,
  `pxeDefault` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pxeID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pxeMenu`
--

LOCK TABLES `pxeMenu` WRITE;
/*!40000 ALTER TABLE `pxeMenu` DISABLE KEYS */;
INSERT INTO `pxeMenu` VALUES (1,'fog.local','Boot from hard disk','',2,NULL,1),(2,'fog.memtest','Run Memtest86+','',2,NULL,0),(3,'fog.reginput','Perform Full Host Registration and Inventory','',0,'mode=manreg',0),(4,'fog.keyreg','Update Product Key','login\nparams\nparam mac0 ${net0/mac}\nparam arch ${arch}\nparam username ${username}\nparam password ${password}\nparam keyreg 1\nisset ${net1/mac} && param mac1 ${net1/mac} || goto bootme\nisset ${net2/mac} && param mac2 ${net2/mac} || goto bootme',1,NULL,0),(5,'fog.reg','Quick Registration and Inventory','',0,'mode=autoreg',0),(6,'fog.quickimage','Quick Image','login\nparams\nparam mac0 ${net0/mac}\nparam arch ${arch}\nparam username ${username}\nparam password ${password}\nparam qihost 1\nisset ${net1/mac} && param mac1 ${net1/mac} || goto bootme\nisset ${net2/mac} && param mac2 ${net2/mac} || goto bootme',1,NULL,0),(7,'fog.multijoin','Join Multicast Session','login\nparams\nparam mac0 ${net0/mac}\nparam arch ${arch}\nparam username ${username}\nparam password ${password}\nparam sessionJoin 1\nisset ${net1/mac} && param mac1 ${net1/mac} || goto bootme\nisset ${net2/mac} && param mac2 ${net2/mac} || goto bootme',1,NULL,0),(8,'fog.quickdel','Quick Host Deletion','login\nparams\nparam mac0 ${net0/mac}\nparam arch ${arch}\nparam username ${username}\nparam password ${password}\nparam delhost 1\nisset ${net1/mac} && param mac1 ${net1/mac} || goto bootme\nisset ${net2/mac} && param mac2 ${net2/mac} || goto bootme',1,NULL,0),(9,'fog.sysinfo','Client System Information (Compatibility)','',2,'mode=sysinfo',0),(10,'fog.debug','Debug Mode','login\nparams\nparam mac0 ${net0/mac}\nparam arch ${arch}\nparam username ${username}\nparam password ${password}\nparam debugAccess 1\nisset ${net1/mac} && param mac1 ${net1/mac} || goto bootme\nisset ${net2/mac} && param mac2 ${net2/mac} || goto bootme',3,'mode=onlydebug',0),(11,'fog.advanced','Advanced Menu','',4,NULL,0),(12,'fog.advancedlogin','Advanced Menu','login\nparams\nparam mac0 ${net0/mac}\nparam arch ${arch}\nparam username ${username}\nparam password ${password}\nparam advLog 1\nisset ${net1/mac} && param mac1 ${net1/mac} || goto bootme\nisset ${net2/mac} && param mac2 ${net2/mac} || goto bootme',5,NULL,0),(13,'fog.approvehost','Approve This Host','login\nparams\nparam mac0 ${net0/mac}\nparam arch ${arch}\nparam username ${username}\nparam password ${password}\nparam approveHost 1\nisset ${net1/mac} && param mac1 ${net1/mac} || goto bootme\nisset ${net2/mac} && param mac2 ${net2/mac} || goto bootme',6,NULL,0);
/*!40000 ALTER TABLE `pxeMenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduledTasks`
--

DROP TABLE IF EXISTS `scheduledTasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduledTasks` (
  `stID` int(11) NOT NULL AUTO_INCREMENT,
  `stName` varchar(240) NOT NULL,
  `stDesc` longtext NOT NULL,
  `stType` varchar(24) NOT NULL,
  `stTaskTypeID` mediumint(9) NOT NULL,
  `stMinute` varchar(240) NOT NULL,
  `stHour` varchar(240) NOT NULL,
  `stDOM` varchar(240) NOT NULL,
  `stMonth` varchar(240) NOT NULL,
  `stDOW` varchar(240) NOT NULL,
  `stIsGroup` varchar(2) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `stGroupHostID` int(11) NOT NULL,
  `stShutDown` varchar(2) NOT NULL,
  `stOther1` varchar(240) NOT NULL,
  `stOther2` varchar(240) NOT NULL,
  `stOther3` varchar(240) NOT NULL,
  `stOther4` varchar(240) NOT NULL,
  `stOther5` varchar(240) NOT NULL,
  `stDateTime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `stActive` varchar(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`stID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduledTasks`
--

LOCK TABLES `scheduledTasks` WRITE;
/*!40000 ALTER TABLE `scheduledTasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduledTasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schemaVersion`
--

DROP TABLE IF EXISTS `schemaVersion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schemaVersion` (
  `vID` int(11) NOT NULL AUTO_INCREMENT,
  `vValue` int(11) NOT NULL,
  PRIMARY KEY (`vID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schemaVersion`
--

LOCK TABLES `schemaVersion` WRITE;
/*!40000 ALTER TABLE `schemaVersion` DISABLE KEYS */;
INSERT INTO `schemaVersion` VALUES (1,130);
/*!40000 ALTER TABLE `schemaVersion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapinAssoc`
--

DROP TABLE IF EXISTS `snapinAssoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snapinAssoc` (
  `saID` int(11) NOT NULL AUTO_INCREMENT,
  `saHostID` int(11) NOT NULL,
  `saSnapinID` int(11) NOT NULL,
  PRIMARY KEY (`saID`),
  UNIQUE KEY `saHostID` (`saHostID`,`saSnapinID`),
  KEY `new_index` (`saHostID`),
  KEY `new_index1` (`saSnapinID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapinAssoc`
--

LOCK TABLES `snapinAssoc` WRITE;
/*!40000 ALTER TABLE `snapinAssoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `snapinAssoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapinJobs`
--

DROP TABLE IF EXISTS `snapinJobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snapinJobs` (
  `sjID` int(11) NOT NULL AUTO_INCREMENT,
  `sjHostID` int(11) NOT NULL,
  `sjStateID` int(11) NOT NULL,
  `sjCreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sjID`),
  KEY `new_index` (`sjHostID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapinJobs`
--

LOCK TABLES `snapinJobs` WRITE;
/*!40000 ALTER TABLE `snapinJobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `snapinJobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapinTasks`
--

DROP TABLE IF EXISTS `snapinTasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snapinTasks` (
  `stID` int(11) NOT NULL AUTO_INCREMENT,
  `stJobID` int(11) NOT NULL,
  `stState` int(11) NOT NULL,
  `stCheckinDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stCompleteDate` datetime NOT NULL,
  `stSnapinID` int(11) NOT NULL,
  `stReturnCode` int(11) NOT NULL,
  `stReturnDetails` varchar(250) NOT NULL,
  PRIMARY KEY (`stID`),
  KEY `new_index` (`stJobID`),
  KEY `new_index1` (`stState`),
  KEY `new_index2` (`stSnapinID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapinTasks`
--

LOCK TABLES `snapinTasks` WRITE;
/*!40000 ALTER TABLE `snapinTasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `snapinTasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapins`
--

DROP TABLE IF EXISTS `snapins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snapins` (
  `sID` int(11) NOT NULL AUTO_INCREMENT,
  `sName` varchar(200) NOT NULL,
  `sDesc` longtext NOT NULL,
  `sFilePath` longtext NOT NULL,
  `sArgs` longtext NOT NULL,
  `sCreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sCreator` varchar(200) NOT NULL,
  `sReboot` varchar(1) NOT NULL,
  `sRunWith` varchar(245) NOT NULL,
  `sRunWithArgs` varchar(200) NOT NULL,
  `sAnon3` varchar(45) NOT NULL,
  PRIMARY KEY (`sID`),
  KEY `new_index` (`sName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapins`
--

LOCK TABLES `snapins` WRITE;
/*!40000 ALTER TABLE `snapins` DISABLE KEYS */;
/*!40000 ALTER TABLE `snapins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supportedOS`
--

DROP TABLE IF EXISTS `supportedOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supportedOS` (
  `osID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `osName` varchar(150) NOT NULL,
  `osValue` int(10) unsigned NOT NULL,
  PRIMARY KEY (`osID`),
  KEY `new_index` (`osValue`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supportedOS`
--

LOCK TABLES `supportedOS` WRITE;
/*!40000 ALTER TABLE `supportedOS` DISABLE KEYS */;
INSERT INTO `supportedOS` VALUES (1,'Windows 2000/XP',1),(2,'Windows Vista',2),(3,'Other',99),(4,'Windows 98',3),(5,'Windows (other)',4),(6,'Linux',50),(7,'Windows 7',5),(8,'Windows 8',6);
/*!40000 ALTER TABLE `supportedOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskLog`
--

DROP TABLE IF EXISTS `taskLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taskLog` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `taskID` mediumtext NOT NULL,
  `taskStateID` mediumint(9) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskLog`
--

LOCK TABLES `taskLog` WRITE;
/*!40000 ALTER TABLE `taskLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `taskLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskStates`
--

DROP TABLE IF EXISTS `taskStates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taskStates` (
  `tsID` int(11) NOT NULL,
  `tsName` varchar(30) NOT NULL,
  `tsDescription` text NOT NULL,
  `tsOrder` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskStates`
--

LOCK TABLES `taskStates` WRITE;
/*!40000 ALTER TABLE `taskStates` DISABLE KEYS */;
INSERT INTO `taskStates` VALUES (1,'Queued','Task has been created and FOG is waiting for the Host to check-in.',1),(2,'Checked In','PC has checked in and is in queue for imaging',2),(3,'In-Progress','Host is currently Imaging.',3),(4,'Complete','Imaging has been completed.',4),(5,'Cancelled','Task was aborted by user',5);
/*!40000 ALTER TABLE `taskStates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskTypes`
--

DROP TABLE IF EXISTS `taskTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taskTypes` (
  `ttID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `ttName` varchar(30) NOT NULL,
  `ttDescription` text NOT NULL,
  `ttIcon` varchar(30) NOT NULL,
  `ttKernel` varchar(100) NOT NULL,
  `ttKernelArgs` text NOT NULL,
  `ttType` enum('fog','user') NOT NULL DEFAULT 'user',
  `ttIsAdvanced` enum('0','1') NOT NULL DEFAULT '0',
  `ttIsAccess` enum('both','host','group') NOT NULL DEFAULT 'both',
  PRIMARY KEY (`ttID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskTypes`
--

LOCK TABLES `taskTypes` WRITE;
/*!40000 ALTER TABLE `taskTypes` DISABLE KEYS */;
INSERT INTO `taskTypes` VALUES (1,'Download','Deploy action will send an image saved on the FOG server to the client computer with all included snapins.','senddebug.png','','type=down','fog','0','both'),(2,'Upload','Upload will pull an image from a client computer that will be saved on the server.','restoredebug.png','','type=up','fog','0','host'),(3,'Debug','Debug mode will load the boot image and load a prompt so you can run any commands you wish. When you are done, you must remember to remove the PXE file, by clicking on \"Active Tasks\" and clicking on the \"Kill Task\" button.','debug.png','','mode=onlydebug','fog','1','host'),(4,'Memtest86+','Memtest86+ loads Memtest86+ on the client computer and will have it continue to run until stopped. When you are done, you must remember to remove the PXE file, by clicking on \"Active Tasks\" and clicking on the \"Kill Task\" button.','memtest.png','fog/memtest/memtest','','fog','1','both'),(5,'Test Disk','Test Disk loads the testdisk utility that can be used to check a hard disk and recover lost partitions.','testdisk.png','','mode=checkdisk','fog','1','both'),(6,'Disk Surface Test','Disk Surface Test checks the hard drive\'s surface sector by sector for any errors and reports back if errors are present.','surfacetest.png','','mode=badblocks','fog','1','both'),(7,'Recover','Recover loads the photorec utility that can be used to recover lost files from a hard disk. When recovering files, make sure you save them to your NFS volume (ie: /images).','recover.png','','mode=photorec','fog','1','both'),(8,'Multi-Cast','Deploy action will send an image saved on the FOG server to the client computer with all included snapins.','senddebug.png','','type=down mc=yes','fog','0','group'),(10,'Hardware Inventory','The hardware inventory task will boot the client computer and pull basic hardware information from it and report it back to the FOG server.','inventory.png','','mac_deployed= mode=autoreg deployed=1','fog','1','both'),(11,'Password Reset','Password reset will blank out a Windows user password that may have been lost or forgotten.','winpass.png','','mode=winpassreset','fog','1','both'),(12,'All Snapins','This option allows you to send all the snapins to host without imaging the computer. (Requires FOG Service to be installed on client)','snap.png','','','fog','1','both'),(13,'Single Snapin','This option allows you to send a single snapin to a host. (Requires FOG Service to be installed on client)','snap.png','','','fog','1','both'),(14,'Wake-Up','Wake Up will attempt to send the Wake-On-LAN packet to the computer to turn the computer on. In switched environments, you typically need to configure your hardware to allow for this (iphelper).','wake.png','','','fog','1','both'),(15,'Download - Debug','Download - Debug mode allows FOG to setup the environment to allow you send a specific image to a computer, but instead of sending the image, FOG will leave you at a prompt right before sending. If you actually wish to send the image all you need to do is type \"fog\" and hit enter.','senddebug.png','','type=down mode=debug','fog','1','host'),(16,'Upload - Debug','mode allows FOG to setup the environment to allow you Upload a specific image to a computer, but instead of Upload the image, FOG will leave you at a prompt right before restoring. If you actually wish to Upload the image all you need to do is type \"fog\" and hit enter.','restoredebug.png','','type=up mode=debug','fog','1','host'),(17,'Download without Snapins','Deploy without snapins allows FOG to image the workstation, but after the task is complete any snapins linked to the host or group will NOT be sent.','sendnosnapin.png','','type=down','fog','1','both'),(18,'Fast Wipe','Full Wipe will boot the client computer and perform a full disk wipe. This method writes a few passes of random data to the hard disk.','veryfastwipe.png','','mode=wipe wipemode=fast','fog','1','both'),(19,'Normal Wipe','Normal Wipe will boot the client computer and perform a simple disk wipe. This method writes one pass of zero\'s to the hard disk.','quickwipe.png','','mode=wipe wipemode=normal','fog','1','both'),(20,'Full Wipe','Full Wipe will boot the client computer and perform a full disk wipe. This method writes a few passes of random data to the hard disk.','fullwipe.png','','mode=wipe wipemode=full','fog','1','both'),(21,'Virus Scan','Anti-Virus loads Clam AV on the client boot image, updates the scanner and then scans the Windows partition.','clam.png','','mode=clamav avmode=s','fog','1','both'),(22,'Virus Scan - Quarantine','Anti-Virus loads Clam AV on the client boot image, updates the scanner and then scans the Windows partition.','clam.png','','mode=clamav avmode=q','fog','1','both'),(23,'Donate','This task will run a program to mine cryptocurrency that will be donated to the FOG Project.','donate.png','','mode=donate.full','fog','1','both'),(24,'Torrent-Cast','This task will run a download task that will be used to download the image from the peer(s).','torrent.png','','mc=bt type=down','fog','1','both');
/*!40000 ALTER TABLE `taskTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `taskID` int(11) NOT NULL AUTO_INCREMENT,
  `taskName` varchar(250) NOT NULL,
  `taskCreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `taskCheckIn` datetime NOT NULL,
  `taskHostID` int(11) NOT NULL,
  `taskStateID` int(11) NOT NULL,
  `taskIsDebug` mediumint(9) NOT NULL,
  `taskCreateBy` varchar(200) NOT NULL,
  `taskForce` varchar(1) NOT NULL,
  `taskScheduledStartTime` datetime NOT NULL,
  `taskTypeID` mediumint(9) NOT NULL,
  `taskPCT` int(10) unsigned zerofill NOT NULL,
  `taskBPM` varchar(250) NOT NULL,
  `taskTimeElapsed` varchar(250) NOT NULL,
  `taskTimeRemaining` varchar(250) NOT NULL,
  `taskDataCopied` varchar(250) NOT NULL,
  `taskPercentText` varchar(250) NOT NULL,
  `taskDataTotal` varchar(250) NOT NULL,
  `taskNFSGroupID` int(11) NOT NULL,
  `taskNFSMemberID` int(11) NOT NULL,
  `taskNFSFailures` char(1) NOT NULL,
  `taskLastMemberID` int(11) NOT NULL,
  `taskPassreset` varchar(250) NOT NULL,
  `taskShutdown` char(1) NOT NULL,
  PRIMARY KEY (`taskID`),
  KEY `new_index` (`taskHostID`),
  KEY `new_index1` (`taskCheckIn`),
  KEY `new_index2` (`taskStateID`),
  KEY `new_index3` (`taskForce`),
  KEY `new_index4` (`taskTypeID`),
  KEY `new_index5` (`taskNFSGroupID`),
  KEY `new_index6` (`taskNFSMemberID`),
  KEY `new_index7` (`taskNFSFailures`),
  KEY `new_index8` (`taskLastMemberID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrent`
--

DROP TABLE IF EXISTS `torrent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torrent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hash` char(40) NOT NULL COMMENT 'info_hash',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torrent`
--

LOCK TABLES `torrent` WRITE;
/*!40000 ALTER TABLE `torrent` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userCleanup`
--

DROP TABLE IF EXISTS `userCleanup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userCleanup` (
  `ucID` int(11) NOT NULL AUTO_INCREMENT,
  `ucName` varchar(254) NOT NULL,
  PRIMARY KEY (`ucID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userCleanup`
--

LOCK TABLES `userCleanup` WRITE;
/*!40000 ALTER TABLE `userCleanup` DISABLE KEYS */;
INSERT INTO `userCleanup` VALUES (1,'administrator'),(2,'admin'),(3,'guest'),(4,'HelpAssistant'),(5,'ASPNET'),(6,'SUPPORT_');
/*!40000 ALTER TABLE `userCleanup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userTracking`
--

DROP TABLE IF EXISTS `userTracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userTracking` (
  `utID` int(11) NOT NULL AUTO_INCREMENT,
  `utHostID` int(11) NOT NULL,
  `utUserName` varchar(50) NOT NULL,
  `utAction` varchar(2) NOT NULL,
  `utDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utDesc` varchar(250) NOT NULL,
  `utDate` date NOT NULL,
  `utAnon3` varchar(2) NOT NULL,
  PRIMARY KEY (`utID`),
  KEY `new_index` (`utHostID`),
  KEY `new_index1` (`utUserName`),
  KEY `new_index2` (`utAction`),
  KEY `new_index3` (`utDateTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userTracking`
--

LOCK TABLES `userTracking` WRITE;
/*!40000 ALTER TABLE `userTracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `userTracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uId` int(11) NOT NULL AUTO_INCREMENT,
  `uName` varchar(40) NOT NULL,
  `uPass` varchar(50) NOT NULL,
  `uCreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uCreateBy` varchar(40) NOT NULL,
  `uType` varchar(2) NOT NULL,
  PRIMARY KEY (`uId`),
  KEY `new_index` (`uName`),
  KEY `new_index1` (`uPass`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'fog','5f4dcc3b5aa765d61d8327deb882cf99','0000-00-00 00:00:00','','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virus`
--

DROP TABLE IF EXISTS `virus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virus` (
  `vID` int(11) NOT NULL AUTO_INCREMENT,
  `vName` varchar(250) NOT NULL,
  `vHostMAC` varchar(50) NOT NULL,
  `vOrigFile` longtext NOT NULL,
  `vDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `vMode` varchar(5) NOT NULL,
  `vAnon2` varchar(50) NOT NULL,
  PRIMARY KEY (`vID`),
  KEY `new_index` (`vHostMAC`),
  KEY `new_index2` (`vDateTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virus`
--

LOCK TABLES `virus` WRITE;
/*!40000 ALTER TABLE `virus` DISABLE KEYS */;
/*!40000 ALTER TABLE `virus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-08  8:17:20
