-- MySQL dump 9.11
--
-- Host: localhost    Database: bbsmail
-- ------------------------------------------------------
-- Server version	4.0.20

--
-- Table structure for table `mailsysop`
--

CREATE TABLE mailsysop (
  num int(11) NOT NULL auto_increment,
  del char(1) NOT NULL default '',
  tag tinyint(1) unsigned NOT NULL default '0',
  tag2 tinyint(1) unsigned default NULL,
  id varchar(12) default NULL,
  name varchar(12) default NULL,
  email varchar(40) default NULL,
  homepage varchar(40) default NULL,
  title varchar(80) NOT NULL default '',
  body text,
  date datetime NOT NULL default '0000-00-00 00:00:00',
  date2 datetime NOT NULL default '0000-00-00 00:00:00',
  hits smallint(6) unsigned NOT NULL default '0',
  down smallint(6) unsigned NOT NULL default '0',
  ok smallint(6) unsigned NOT NULL default '0',
  no smallint(6) unsigned NOT NULL default '0',
  good tinyint(1) unsigned NOT NULL default '0',
  color tinyint(3) unsigned NOT NULL default '0',
  thread int(11) NOT NULL default '0',
  depth smallint(6) NOT NULL default '0',
  pos int(11) NOT NULL default '0',
  passwd varchar(8) NOT NULL default '',
  filename varchar(50) default NULL,
  fcount int(10) unsigned NOT NULL default '0',
  filesize int(11) default NULL,
  userip varchar(20) default NULL,
  keyword varchar(30) default NULL,
  tcode varchar(21) default NULL,
  size int(11) NOT NULL default '0',
  line int(11) NOT NULL default '0',
  tnum int(11) default NULL,
  link1 int(11) default NULL,
  link2 int(11) default NULL,
  link3 int(11) default NULL,
  tclub varchar(10) NOT NULL default '',
  tid varchar(20) default NULL,
  note varchar(200) NOT NULL default '',
  an int(11) NOT NULL default '0',
  PRIMARY KEY  (num),
  KEY pos (pos),
  KEY del (del),
  KEY date (date)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `mailsysop`
--


