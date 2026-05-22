-- MySQL dump 9.11
--
-- Host: localhost    Database: bbs
-- ------------------------------------------------------
-- Server version	4.0.20

--
-- Table structure for table `base_struct`
--

CREATE TABLE base_struct (
  num int(11) NOT NULL auto_increment,
  del tinyint(1) unsigned default NULL,
  tag tinyint(1) unsigned default NULL,
  tag2 tinyint(1) unsigned default NULL,
  id varchar(12) default NULL,
  name varchar(12) default NULL,
  email varchar(40) default NULL,
  homepage varchar(40) default NULL,
  title varchar(80) default NULL,
  body text,
  date datetime default NULL,
  date2 datetime default NULL,
  hits smallint(6) unsigned default NULL,
  down smallint(6) unsigned default NULL,
  ok smallint(6) unsigned default NULL,
  no smallint(6) unsigned default NULL,
  good tinyint(1) unsigned default NULL,
  color tinyint(3) unsigned default NULL,
  thread int(11) default NULL,
  depth smallint(6) default NULL,
  pos int(11) default NULL,
  passwd varchar(8) default '',
  filename varchar(20) default '',
  fcount tinyint(1) unsigned default NULL,
  filesize int(11) default NULL,
  userip varchar(20) default NULL,
  keyword varchar(30) default NULL,
  tcode varchar(21) default NULL,
  size int(11) default NULL,
  line int(11) default NULL,
  tnum int(11) default NULL,
  link1 int(11) default NULL,
  link2 int(11) default NULL,
  link3 int(11) default NULL,
  tclub varchar(10) default NULL,
  tid varchar(20) default NULL,
  PRIMARY KEY  (num)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `base_struct`
--


--
-- Table structure for table `bcfg`
--

CREATE TABLE bcfg (
  name varchar(100) default NULL,
  table_name varchar(40) NOT NULL default '',
  foot text,
  head text,
  num_new smallint(3) default NULL,
  num_hits smallint(6) default NULL,
  sysop varchar(20) default NULL,
  passwd varchar(8) default NULL,
  admin_mail varchar(40) default NULL,
  reg_date datetime default NULL,
  write_passwd varchar(12) default NULL,
  use_image char(1) default NULL,
  body_home varchar(60) default NULL,
  html_top tinytext,
  html_end tinytext,
  read_passwd varchar(12) default NULL,
  code varchar(20) default NULL,
  club varchar(20) default NULL,
  bform tinyint(3) unsigned default NULL,
  use_email char(1) default NULL,
  use_body char(1) default NULL,
  use_tag char(1) default NULL,
  use_passwd char(1) default NULL,
  date datetime default NULL,
  date2 datetime default NULL,
  total int(10) default NULL,
  write_top text,
  use_file char(1) default NULL,
  use_name char(1) default NULL,
  itype tinyint(2) default NULL,
  dtype tinyint(2) default NULL,
  wtype tinyint(2) default NULL,
  rtype tinyint(2) default NULL,
  last_date datetime default NULL,
  sysop1 varchar(20) default NULL,
  sysop2 varchar(20) default NULL,
  sysop3 varchar(20) default NULL,
  formnum tinyint(4) default NULL,
  use_char char(1) default NULL,
  line int(11) default NULL,
  tline int(11) default NULL,
  use_ok char(1) default NULL,
  ictype tinyint(2) default NULL,
  dctype tinyint(2) default NULL,
  wctype tinyint(2) default NULL,
  rctype tinyint(2) default NULL,
  use_good char(1) NOT NULL default '',
  use_good3 char(1) NOT NULL default '',
  empty_file char(1) NOT NULL default '',
  use_hide char(1) NOT NULL default '',
  body_sign text NOT NULL,
  use_goods enum('y','n') NOT NULL default 'n',
  answer_time enum('y','n') NOT NULL default 'n',
  disp_goods enum('y','n') NOT NULL default 'n',
  use_xmp enum('y','n') NOT NULL default 'n',
  use_convert enum('y','n') NOT NULL default 'n',
  use_nl2br enum('y','n') NOT NULL default 'y',
  use_nl2br2 enum('y','n') NOT NULL default 'y',
  use_sowbody enum('y','n') NOT NULL default 'y',
  use_showbody enum('y','n') NOT NULL default 'y',
  use_keyword enum('y','n') NOT NULL default 'y',
  use_keyword2 enum('y','n') NOT NULL default 'n',
  use_list enum('y','n') NOT NULL default 'n',
  keyword_select1 text NOT NULL,
  keyword_select2 text NOT NULL,
  use_body2 enum('y','n') NOT NULL default 'y',
  not_convert1 enum('y','n') NOT NULL default 'n',
  not_convert2 enum('y','n') NOT NULL default 'n',
  not_convert3 enum('y','n') NOT NULL default 'n',
  use_background enum('y','n') NOT NULL default 'n',
  use_color enum('y','n') NOT NULL default 'n',
  use_del enum('y','n') NOT NULL default 'n',
  tpl_list int(11) NOT NULL default '0',
  tpl_write int(11) NOT NULL default '0',
  tpl_read int(11) NOT NULL default '0',
  only_myid enum('y','n') NOT NULL default 'n',
  include_top enum('y','n') NOT NULL default 'n',
  include_bottom enum('y','n') NOT NULL default 'n',
  template_num int(11) NOT NULL default '0',
  member_read enum('y','n') NOT NULL default 'n',
  member_write enum('y','n') NOT NULL default 'n',
  body_only enum('y','n') NOT NULL default 'n',
  check_file enum('y','n') NOT NULL default 'n',
  use_answer enum('y','n') NOT NULL default 'n',
  use_answer2 enum('y','n') NOT NULL default 'n',
  include_left enum('y','n') NOT NULL default 'n',
  send_email enum('y','n') NOT NULL default 'n',
  send_mail enum('y','n') NOT NULL default 'n',
  use_face enum('y','n') NOT NULL default 'y',
  name_type int(11) NOT NULL default '0',
  title_len int(11) NOT NULL default '0',
  co_listtit1 varchar(11) NOT NULL default '',
  co_listtit2 varchar(11) NOT NULL default '',
  co_listbg1 varchar(11) NOT NULL default '',
  co_listbg2 varchar(11) NOT NULL default '',
  co_listbg3 varchar(11) NOT NULL default '',
  co_listbar1 varchar(11) NOT NULL default '',
  co_listbar2 varchar(11) NOT NULL default '',
  co_writetit1 varchar(11) NOT NULL default '',
  co_writetit2 varchar(11) NOT NULL default '',
  co_writebar1 varchar(11) NOT NULL default '',
  co_writebar2 varchar(11) NOT NULL default '',
  co_writebg1 varchar(11) NOT NULL default '',
  co_writebg2 varchar(11) NOT NULL default '',
  co_readtit1 varchar(11) NOT NULL default '',
  co_readtit2 varchar(11) NOT NULL default '',
  co_readbar1 varchar(11) NOT NULL default '',
  co_readbar2 varchar(11) NOT NULL default '',
  co_readbg1 varchar(11) NOT NULL default '',
  co_readbg2 varchar(11) NOT NULL default '',
  order_num tinyint(4) NOT NULL default '0',
  use_jpg enum('y','n') NOT NULL default 'n',
  keyword_num tinyint(4) NOT NULL default '0',
  use_myread enum('y','n') NOT NULL default 'n',
  use_words enum('y','n') NOT NULL default 'n',
  use_model enum('y','n') NOT NULL default 'n',
  use_brand enum('y','n') NOT NULL default 'n',
  body_hide enum('y','n') NOT NULL default 'y',
  body_icon enum('y','n') NOT NULL default 'y',
  PRIMARY KEY  (table_name)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `bcfg`
--


--
-- Table structure for table `book`
--

CREATE TABLE book (
  num int(11) NOT NULL auto_increment,
  id varchar(20) default NULL,
  title varchar(60) default NULL,
  total int(11) default NULL,
  code varchar(20) default NULL,
  data text,
  PRIMARY KEY  (num)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `book`
--


--
-- Table structure for table `ccfg`
--

CREATE TABLE ccfg (
  club varchar(12) NOT NULL default '',
  passwd varchar(8) default NULL,
  enterp varchar(8) default NULL,
  date datetime default NULL,
  date2 datetime default NULL,
  name varchar(60) default NULL,
  intro text,
  guestok text,
  memo1 varchar(20) default NULL,
  memo2 varchar(20) default NULL,
  memo3 varchar(20) default NULL,
  memo4 varchar(20) default NULL,
  memo5 varchar(20) default NULL,
  autoguest tinyint(4) default NULL,
  notice tinyint(4) default NULL,
  noticet tinyint(4) default NULL,
  intype tinyint(4) default NULL,
  cintype tinyint(4) default NULL,
  age1 tinyint(4) default NULL,
  age2 tinyint(4) default NULL,
  modeopen tinyint(4) default NULL,
  gage1 tinyint(4) default NULL,
  gage2 tinyint(4) default NULL,
  stop tinyint(4) default NULL,
  sametype tinyint(4) default NULL,
  hidetype tinyint(4) default NULL,
  timelogo tinyint(4) default NULL,
  noticex tinyint(4) default NULL,
  noticey tinyint(4) default NULL,
  disp_memo1 char(1) default NULL,
  disp_memo2 char(1) default NULL,
  disp_memo3 char(1) default NULL,
  disp_memo4 char(1) default NULL,
  disp_memo5 char(1) default NULL,
  skip_intro tinyint(4) default NULL,
  atype1 varchar(12) default NULL,
  atype2 varchar(12) default NULL,
  atype3 varchar(12) default NULL,
  atype4 varchar(12) default NULL,
  atype5 varchar(12) default NULL,
  atype6 varchar(12) default NULL,
  atype7 varchar(12) default NULL,
  atype8 varchar(12) default NULL,
  atype9 varchar(12) default NULL,
  atype10 varchar(12) default NULL,
  atype11 varchar(12) default NULL,
  atype12 varchar(12) default NULL,
  atype13 varchar(12) default NULL,
  atype14 varchar(12) default NULL,
  atype15 varchar(12) default NULL,
  atype16 varchar(12) default NULL,
  atype17 varchar(12) default NULL,
  atype18 varchar(12) default NULL,
  atype19 varchar(12) default NULL,
  guesttype tinyint(4) default NULL,
  sysop varchar(20) default NULL,
  num int(11) NOT NULL auto_increment,
  total int(11) default NULL,
  guestin tinyint(4) default NULL,
  ictype tinyint(2) default NULL,
  dctype tinyint(2) default NULL,
  wctype tinyint(2) default NULL,
  rctype tinyint(2) default NULL,
  itype tinyint(2) default NULL,
  dtype tinyint(2) default NULL,
  wtype tinyint(2) default NULL,
  rtype tinyint(2) default NULL,
  club_help text NOT NULL,
  PRIMARY KEY  (num),
  KEY club (club)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `ccfg`
--


--
-- Table structure for table `cfg`
--

CREATE TABLE cfg (
  passwd varchar(8) default NULL,
  memo1 varchar(20) default NULL,
  memo2 varchar(20) default NULL,
  memo3 varchar(20) default NULL,
  memo4 varchar(20) default NULL,
  memo5 varchar(20) default NULL,
  autoguest tinyint(4) default NULL,
  notice tinyint(4) default NULL,
  noticet tinyint(4) default NULL,
  intype tinyint(4) default NULL,
  cintype tinyint(4) default NULL,
  age1 tinyint(4) default NULL,
  age2 tinyint(4) default NULL,
  modeopen tinyint(4) default NULL,
  gage1 tinyint(4) default NULL,
  gage2 tinyint(4) default NULL,
  stop tinyint(4) default NULL,
  sametype tinyint(4) default NULL,
  hidetype tinyint(4) default NULL,
  timelogo tinyint(4) default NULL,
  noticex tinyint(4) default NULL,
  noticey tinyint(4) default NULL,
  disp_memo1 char(1) default NULL,
  disp_memo2 char(1) default NULL,
  disp_memo3 char(1) default NULL,
  disp_memo4 char(1) default NULL,
  disp_memo5 char(1) default NULL,
  skip_intro tinyint(4) default NULL,
  atype1 varchar(12) default NULL,
  atype2 varchar(12) default NULL,
  atype3 varchar(12) default NULL,
  atype4 varchar(12) default NULL,
  atype5 varchar(12) default NULL,
  atype6 varchar(12) default NULL,
  atype7 varchar(12) default NULL,
  atype8 varchar(12) default NULL,
  atype9 varchar(12) default NULL,
  atype10 varchar(12) default NULL,
  atype11 varchar(12) default NULL,
  atype12 varchar(12) default NULL,
  atype13 varchar(12) default NULL,
  atype14 varchar(12) default NULL,
  atype15 varchar(12) default NULL,
  atype16 varchar(12) default NULL,
  atype17 varchar(12) default NULL,
  atype18 varchar(12) default NULL,
  atype19 varchar(12) default NULL,
  guesttype tinyint(4) default NULL,
  sysop varchar(20) NOT NULL default '',
  guestin tinyint(4) default NULL,
  itype tinyint(4) default NULL,
  rtype tinyint(4) default NULL,
  wtype tinyint(4) default NULL,
  dtype tinyint(4) default NULL,
  hostname varchar(20) default NULL,
  memo6 varchar(20) default NULL,
  memo7 varchar(20) default NULL,
  memo8 varchar(20) default NULL,
  disp_memo6 char(1) default NULL,
  disp_memo7 char(1) default NULL,
  disp_memo8 char(1) default NULL,
  ajob1 varchar(20) default NULL,
  ajob2 varchar(20) default NULL,
  ajob3 varchar(20) default NULL,
  ajob4 varchar(20) default NULL,
  ajob5 varchar(20) default NULL,
  ajob6 varchar(20) default NULL,
  ajob7 varchar(20) default NULL,
  ajob8 varchar(20) default NULL,
  ajob9 varchar(20) default NULL,
  ajob10 varchar(20) default NULL,
  ajob11 varchar(20) default NULL,
  ajob12 varchar(20) default NULL,
  ajob13 varchar(20) default NULL,
  ajob14 varchar(20) default NULL,
  ajob15 varchar(20) default NULL,
  ajob16 varchar(20) default NULL,
  ajob17 varchar(20) default NULL,
  ajob18 varchar(20) default NULL,
  ajob19 varchar(20) default NULL,
  ajob0 varchar(20) default NULL,
  atype0 varchar(12) default NULL,
  view_notice tinyint(4) default NULL,
  relog tinyint(4) default NULL,
  allsay tinyint(4) NOT NULL default '0',
  basedir varchar(30) NOT NULL default '',
  sysop1 varchar(20) NOT NULL default '',
  sysop2 varchar(20) NOT NULL default '',
  sysop3 varchar(20) NOT NULL default '',
  PRIMARY KEY  (sysop)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `cfg`
--

INSERT INTO cfg VALUES ('','소개1','소개2','면허번호','','참고5',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'1','1','','','',NULL,'','','','','','','','','','','','','','','','','','','관리자',1,'sysop',0,0,NULL,NULL,NULL,'대전맹 Web/Text-BBS','자택전화','자택주소','참고8','','','','재학생','교직원','학부모','동문','관련인사','','','','','','','','','','','','','','','...','손님',1,5,17,'/nfs/akom/bbs','1111','222','333');

--
-- Table structure for table `count`
--

CREATE TABLE count (
  time date NOT NULL default '0000-00-00',
  total int(11) NOT NULL default '0',
  hour0 int(11) NOT NULL default '0',
  hour1 int(11) NOT NULL default '0',
  hour2 int(11) NOT NULL default '0',
  hour3 int(11) NOT NULL default '0',
  hour4 int(11) NOT NULL default '0',
  hour5 int(11) NOT NULL default '0',
  hour6 int(11) NOT NULL default '0',
  hour7 int(11) NOT NULL default '0',
  hour8 int(11) NOT NULL default '0',
  hour9 int(11) NOT NULL default '0',
  hour10 int(11) NOT NULL default '0',
  hour11 int(11) NOT NULL default '0',
  hour12 int(11) NOT NULL default '0',
  hour13 int(11) NOT NULL default '0',
  hour14 int(11) NOT NULL default '0',
  hour15 int(11) NOT NULL default '0',
  hour16 int(11) NOT NULL default '0',
  hour17 int(11) NOT NULL default '0',
  hour18 int(11) NOT NULL default '0',
  hour19 int(11) NOT NULL default '0',
  hour20 int(11) NOT NULL default '0',
  hour21 int(11) NOT NULL default '0',
  hour22 int(11) NOT NULL default '0',
  hour23 int(11) NOT NULL default '0',
  telnet1 int(11) NOT NULL default '0',
  telnet2 int(11) NOT NULL default '0',
  telnet3 int(11) NOT NULL default '0',
  telnet4 int(11) NOT NULL default '0',
  telnet5 int(11) NOT NULL default '0',
  telnet7 int(11) NOT NULL default '0',
  telnet6 int(11) NOT NULL default '0',
  telnet8 int(11) NOT NULL default '0',
  telnet9 int(11) NOT NULL default '0',
  telnet10 int(11) NOT NULL default '0',
  telnet11 int(11) NOT NULL default '0',
  telnet12 int(11) NOT NULL default '0',
  telnet13 int(11) NOT NULL default '0',
  telnet14 int(11) NOT NULL default '0',
  telnet15 int(11) NOT NULL default '0',
  telnet16 int(11) NOT NULL default '0',
  telnet17 int(11) NOT NULL default '0',
  telnet18 int(11) NOT NULL default '0',
  telnet19 int(11) NOT NULL default '0',
  telnet20 int(11) NOT NULL default '0',
  telnet21 int(11) NOT NULL default '0',
  telnet22 int(11) NOT NULL default '0',
  telnet23 int(11) NOT NULL default '0',
  telnet0 int(11) NOT NULL default '0',
  PRIMARY KEY  (time)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `count`
--

INSERT INTO count VALUES ('2002-07-04',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

--
-- Table structure for table `def_bbs`
--

CREATE TABLE def_bbs (
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
-- Dumping data for table `def_bbs`
--


--
-- Table structure for table `def_bbs_rec`
--

CREATE TABLE def_bbs_rec (
  no int(11) NOT NULL auto_increment,
  id varchar(20) NOT NULL default '',
  num int(11) NOT NULL default '0',
  mode int(11) default NULL,
  date datetime default NULL,
  PRIMARY KEY  (no),
  KEY id (id,num),
  KEY num (num)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `def_bbs_rec`
--


--
-- Table structure for table `def_cuser`
--

CREATE TABLE def_cuser (
  num int(12) NOT NULL auto_increment,
  id varchar(20) NOT NULL default '',
  name varchar(20) NOT NULL default '',
  memo1 varchar(70) NOT NULL default '',
  memo2 varchar(70) NOT NULL default '',
  memo3 varchar(70) NOT NULL default '',
  memo4 varchar(70) NOT NULL default '',
  memo5 varchar(70) NOT NULL default '',
  inday datetime default NULL,
  logout datetime default NULL,
  countw int(11) default NULL,
  countu int(11) default NULL,
  countd int(11) default NULL,
  all_log int(11) default NULL,
  all_time int(11) default NULL,
  month_log int(11) default NULL,
  month_time int(11) default NULL,
  type tinyint(4) default NULL,
  del char(1) default NULL,
  PRIMARY KEY  (num),
  KEY id (id)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `def_cuser`
--


--
-- Table structure for table `login`
--

CREATE TABLE login (
  id varchar(20) NOT NULL default '',
  name varchar(20) NOT NULL default '',
  inday datetime NOT NULL default '0000-00-00 00:00:00',
  userip varchar(20) NOT NULL default '',
  KEY inday (inday)
) TYPE=MyISAM;

--
-- Dumping data for table `login`
--


--
-- Table structure for table `loginrec`
--

CREATE TABLE loginrec (
  date datetime NOT NULL default '0000-00-00 00:00:00',
  id varchar(20) NOT NULL default '',
  name varchar(20) NOT NULL default '',
  type tinyint(4) NOT NULL default '0',
  login char(1) NOT NULL default '',
  job tinyint(4) NOT NULL default '0',
  num int(11) NOT NULL auto_increment,
  userip varchar(16) NOT NULL default '',
  PRIMARY KEY  (num),
  KEY id (id),
  KEY date (date),
  KEY date_2 (date)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `loginrec`
--


--
-- Table structure for table `main___backup`
--

CREATE TABLE main___backup (
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
  goods varchar(15) NOT NULL default '',
  face int(11) NOT NULL default '0',
  readopen enum('y','n') NOT NULL default 'y',
  bgcolor varchar(8) NOT NULL default '',
  chcolor varchar(8) NOT NULL default '',
  PRIMARY KEY  (num),
  KEY pos (pos),
  KEY del (del),
  KEY date (date)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `main___backup`
--


--
-- Table structure for table `main___backup_rec`
--

CREATE TABLE main___backup_rec (
  no int(11) NOT NULL auto_increment,
  id varchar(20) NOT NULL default '',
  num int(11) NOT NULL default '0',
  mode int(11) default NULL,
  date datetime default NULL,
  PRIMARY KEY  (no),
  KEY id (id,num),
  KEY num (num)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `main___backup_rec`
--


--
-- Table structure for table `main___delete`
--

CREATE TABLE main___delete (
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
-- Dumping data for table `main___delete`
--


--
-- Table structure for table `main___notice`
--

CREATE TABLE main___notice (
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
  goods varchar(15) NOT NULL default '',
  face int(11) NOT NULL default '0',
  readopen enum('y','n') NOT NULL default 'y',
  bgcolor varchar(8) NOT NULL default '',
  chcolor varchar(8) NOT NULL default '',
  PRIMARY KEY  (num),
  KEY pos (pos),
  KEY del (del),
  KEY date (date)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `main___notice`
--


--
-- Table structure for table `postno`
--

CREATE TABLE postno (
  n_num smallint(5) NOT NULL default '0',
  v_post_num varchar(7) default NULL,
  v_province varchar(12) default NULL,
  v_district varchar(12) default NULL,
  v_city varchar(40) default NULL,
  PRIMARY KEY  (n_num)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `postno`
--

INSERT INTO postno VALUES (1,'100-011','서울시','중구','충무로1가\r\n');
INSERT INTO postno VALUES (2,'100-012','서울시','중구','충무로2가\r\n');
INSERT INTO postno VALUES (3,'100-013','서울시','중구','충무로3가\r\n');
INSERT INTO postno VALUES (4,'100-014','서울시','중구','충무로4가\r\n');
INSERT INTO postno VALUES (5,'100-015','서울시','중구','충무로5가\r\n');
INSERT INTO postno VALUES (6,'100-021','서울시','중구','명동1가\r\n');
INSERT INTO postno VALUES (7,'100-022','서울시','중구','명동2가\r\n');
INSERT INTO postno VALUES (8,'100-031','서울시','중구','저동1가\r\n');
INSERT INTO postno VALUES (9,'100-032','서울시','중구','저동2가\r\n');
INSERT INTO postno VALUES (10,'100-041','서울시','중구','남산동1가\r\n');
INSERT INTO postno VALUES (11,'100-042','서울시','중구','남산동2가\r\n');
INSERT INTO postno VALUES (12,'100-043','서울시','중구','남산동3가\r\n');
INSERT INTO postno VALUES (13,'100-051','서울시','중구','회현동1가\r\n');
INSERT INTO postno VALUES (14,'100-052','서울시','중구','회현동2가\r\n');
INSERT INTO postno VALUES (15,'100-053','서울시','중구','회현동3가\r\n');
INSERT INTO postno VALUES (16,'100-060','서울시','중구','남창동\r\n');
INSERT INTO postno VALUES (17,'100-070','서울시','중구','소공동\r\n');
INSERT INTO postno VALUES (18,'100-080','서울시','중구','북창동\r\n');
INSERT INTO postno VALUES (19,'100-091','서울시','중구','남대문로1가\r\n');
INSERT INTO postno VALUES (20,'100-092','서울시','중구','남대문로2가\r\n');
INSERT INTO postno VALUES (21,'100-093','서울시','중구','남대문로3가\r\n');
INSERT INTO postno VALUES (22,'100-094','서울시','중구','남대문로4가\r\n');
INSERT INTO postno VALUES (23,'100-095','서울시','중구','남대문로5가\r\n');
INSERT INTO postno VALUES (24,'100-101','서울시','중구','태평로1가\r\n');
INSERT INTO postno VALUES (25,'100-102','서울시','중구','태평로2가\r\n');
INSERT INTO postno VALUES (26,'100-110','서울시','중구','서소문동\r\n');
INSERT INTO postno VALUES (27,'100-120','서울시','중구','정동\r\n');
INSERT INTO postno VALUES (28,'100-130','서울시','중구','순화동\r\n');
INSERT INTO postno VALUES (29,'100-141','서울시','중구','의주로1가\r\n');
INSERT INTO postno VALUES (30,'100-142','서울시','중구','의주로2가\r\n');
INSERT INTO postno VALUES (31,'100-151','서울시','중구','충정로1가\r\n');
INSERT INTO postno VALUES (32,'100-161','서울시','중구','봉래동1가\r\n');
INSERT INTO postno VALUES (33,'100-162','서울시','중구','봉래동2가\r\n');
INSERT INTO postno VALUES (34,'100-170','서울시','중구','무교동\r\n');
INSERT INTO postno VALUES (35,'100-180','서울시','중구','다동\r\n');
INSERT INTO postno VALUES (36,'100-191','서울시','중구','을지로1가\r\n');
INSERT INTO postno VALUES (37,'100-192','서울시','중구','을지로2가\r\n');
INSERT INTO postno VALUES (38,'100-193','서울시','중구','을지로3가\r\n');
INSERT INTO postno VALUES (39,'100-194','서울시','중구','을지로4가\r\n');
INSERT INTO postno VALUES (40,'100-195','서울시','중구','을지로5가\r\n');
INSERT INTO postno VALUES (41,'100-196','서울시','중구','을지로6가\r\n');
INSERT INTO postno VALUES (42,'100-197','서울시','중구','을지로7가\r\n');
INSERT INTO postno VALUES (43,'100-200','서울시','중구','삼각동\r\n');
INSERT INTO postno VALUES (44,'100-210','서울시','중구','수하동\r\n');
INSERT INTO postno VALUES (45,'100-220','서울시','중구','장교동\r\n');
INSERT INTO postno VALUES (46,'100-230','서울시','중구','수표동\r\n');
INSERT INTO postno VALUES (47,'100-240','서울시','중구','주자동\r\n');
INSERT INTO postno VALUES (48,'100-250','서울시','중구','예장동\r\n');
INSERT INTO postno VALUES (49,'100-260','서울시','중구','남학동\r\n');
INSERT INTO postno VALUES (50,'100-271','서울시','중구','필동1가\r\n');
INSERT INTO postno VALUES (51,'100-272','서울시','중구','필동2가\r\n');
INSERT INTO postno VALUES (52,'100-273','서울시','중구','필동3가\r\n');
INSERT INTO postno VALUES (53,'100-281','서울시','중구','인현동1가\r\n');
INSERT INTO postno VALUES (54,'100-282','서울시','중구','인현동2가\r\n');
INSERT INTO postno VALUES (55,'100-290','서울시','중구','예관동\r\n');
INSERT INTO postno VALUES (56,'100-300','서울시','중구','초동\r\n');
INSERT INTO postno VALUES (57,'100-310','서울시','중구','오장동\r\n');
INSERT INTO postno VALUES (58,'100-320','서울시','중구','방산동\r\n');
INSERT INTO postno VALUES (59,'100-330','서울시','중구','주교동\r\n');
INSERT INTO postno VALUES (60,'100-340','서울시','중구','산림동\r\n');
INSERT INTO postno VALUES (61,'100-350','서울시','중구','입정동\r\n');
INSERT INTO postno VALUES (62,'100-369','서울시','중구','중림동\r\n');
INSERT INTO postno VALUES (63,'100-371','서울시','중구','만리동1가\r\n');
INSERT INTO postno VALUES (64,'100-372','서울시','중구','만리동2가\r\n');
INSERT INTO postno VALUES (65,'100-380','서울시','중구','묵정동\r\n');
INSERT INTO postno VALUES (66,'100-391','서울시','중구','장충동1가\r\n');
INSERT INTO postno VALUES (67,'100-392','서울시','중구','장충동2가\r\n');
INSERT INTO postno VALUES (68,'100-400','서울시','중구','쌍림동\r\n');
INSERT INTO postno VALUES (69,'100-411','서울시','중구','광희동1가\r\n');
INSERT INTO postno VALUES (70,'100-412','서울시','중구','광희동2가\r\n');
INSERT INTO postno VALUES (71,'100-420','서울시','중구','무학동\r\n');
INSERT INTO postno VALUES (72,'100-430','서울시','중구','흥인동\r\n');
INSERT INTO postno VALUES (73,'100-440','서울시','중구','황학동\r\n');
INSERT INTO postno VALUES (74,'100-450','서울시','중구','신당동\r\n');
INSERT INTO postno VALUES (75,'100-451','서울시','중구','신당1동\r\n');
INSERT INTO postno VALUES (76,'100-452','서울시','중구','신당2동\r\n');
INSERT INTO postno VALUES (77,'100-453','서울시','중구','신당3동\r\n');
INSERT INTO postno VALUES (78,'100-454','서울시','중구','신당4동\r\n');
INSERT INTO postno VALUES (79,'100-455','서울시','중구','신당5동\r\n');
INSERT INTO postno VALUES (80,'100-456','서울시','중구','신당6동\r\n');
INSERT INTO postno VALUES (81,'100-600','서울시','중구','서울중앙우체국사서함0001-\r\n');
INSERT INTO postno VALUES (82,'100-601','서울시','중구','서울중앙우체국사서함0100-\r\n');
INSERT INTO postno VALUES (83,'100-602','서울시','중구','서울중앙우체국사서함0200-\r\n');
INSERT INTO postno VALUES (84,'100-603','서울시','중구','서울중앙우체국사서함0300-\r\n');
INSERT INTO postno VALUES (85,'100-604','서울시','중구','서울중앙우체국사서함0400-\r\n');
INSERT INTO postno VALUES (86,'100-605','서울시','중구','서울중앙우체국사서함0500-\r\n');
INSERT INTO postno VALUES (87,'100-606','서울시','중구','서울중앙우체국사서함0600-\r\n');
INSERT INTO postno VALUES (88,'100-607','서울시','중구','서울중앙우체국사서함0700-\r\n');
INSERT INTO postno VALUES (89,'100-608','서울시','중구','서울중앙우체국사서함0800-\r\n');
INSERT INTO postno VALUES (90,'100-609','서울시','중구','서울중앙우체국사서함0900-\r\n');
INSERT INTO postno VALUES (91,'100-610','서울시','중구','서울중앙우체국사서함1000-\r\n');
INSERT INTO postno VALUES (92,'100-611','서울시','중구','서울중앙우체국사서함1100-\r\n');
INSERT INTO postno VALUES (93,'100-612','서울시','중구','서울중앙우체국사서함1200-\r\n');
INSERT INTO postno VALUES (94,'100-613','서울시','중구','서울중앙우체국사서함1300-\r\n');
INSERT INTO postno VALUES (95,'100-614','서울시','중구','서울중앙우체국사서함1400-\r\n');
INSERT INTO postno VALUES (96,'100-615','서울시','중구','서울중앙우체국사서함1500-\r\n');
INSERT INTO postno VALUES (97,'100-616','서울시','중구','서울중앙우체국사서함1600-\r\n');
INSERT INTO postno VALUES (98,'100-617','서울시','중구','서울중앙우체국사서함1700-\r\n');
INSERT INTO postno VALUES (99,'100-618','서울시','중구','서울중앙우체국사서함1800-\r\n');
INSERT INTO postno VALUES (100,'100-619','서울시','중구','서울중앙우체국사서함1900-\r\n');
INSERT INTO postno VALUES (101,'100-620','서울시','중구','서울중앙우체국사서함2000-\r\n');
INSERT INTO postno VALUES (102,'100-621','서울시','중구','서울중앙우체국사서함2100-\r\n');
INSERT INTO postno VALUES (103,'100-622','서울시','중구','서울중앙우체국사서함2200-\r\n');
INSERT INTO postno VALUES (104,'100-623','서울시','중구','서울중앙우체국사서함2300-\r\n');
INSERT INTO postno VALUES (105,'100-624','서울시','중구','서울중앙우체국사서함2400-\r\n');
INSERT INTO postno VALUES (106,'100-625','서울시','중구','서울중앙우체국사서함2500-\r\n');
INSERT INTO postno VALUES (107,'100-626','서울시','중구','서울중앙우체국사서함2600-\r\n');
INSERT INTO postno VALUES (108,'100-627','서울시','중구','서울중앙우체국사서함2700-\r\n');
INSERT INTO postno VALUES (109,'100-628','서울시','중구','서울중앙우체국사서함2800-\r\n');
INSERT INTO postno VALUES (110,'100-629','서울시','중구','서울중앙우체국사서함2900-\r\n');
INSERT INTO postno VALUES (111,'100-630','서울시','중구','서울중앙우체국사서함3000-\r\n');
INSERT INTO postno VALUES (112,'100-631','서울시','중구','서울중앙우체국사서함3100-\r\n');
INSERT INTO postno VALUES (113,'100-632','서울시','중구','서울중앙우체국사서함3200-\r\n');
INSERT INTO postno VALUES (114,'100-633','서울시','중구','서울중앙우체국사서함3300-\r\n');
INSERT INTO postno VALUES (115,'100-634','서울시','중구','서울중앙우체국사서함3400-\r\n');
INSERT INTO postno VALUES (116,'100-635','서울시','중구','서울중앙우체국사서함3500-\r\n');
INSERT INTO postno VALUES (117,'100-636','서울시','중구','서울중앙우체국사서함3600-\r\n');
INSERT INTO postno VALUES (118,'100-637','서울시','중구','서울중앙우체국사서함3700-\r\n');
INSERT INTO postno VALUES (119,'100-638','서울시','중구','서울중앙우체국사서함3800-\r\n');
INSERT INTO postno VALUES (120,'100-639','서울시','중구','서울중앙우체국사서함3900-\r\n');
INSERT INTO postno VALUES (121,'100-640','서울시','중구','서울중앙우체국사서함4000-\r\n');
INSERT INTO postno VALUES (122,'100-641','서울시','중구','서울중앙우체국사서함4100-\r\n');
INSERT INTO postno VALUES (123,'100-642','서울시','중구','서울중앙우체국사서함4200-\r\n');
INSERT INTO postno VALUES (124,'100-643','서울시','중구','서울중앙우체국사서함4300-\r\n');
INSERT INTO postno VALUES (125,'100-644','서울시','중구','서울중앙우체국사서함4400-\r\n');
INSERT INTO postno VALUES (126,'100-645','서울시','중구','서울중앙우체국사서함4500-\r\n');
INSERT INTO postno VALUES (127,'100-646','서울시','중구','서울중앙우체국사서함4600-\r\n');
INSERT INTO postno VALUES (128,'100-647','서울시','중구','서울중앙우체국사서함4700-\r\n');
INSERT INTO postno VALUES (129,'100-648','서울시','중구','서울중앙우체국사서함4800-\r\n');
INSERT INTO postno VALUES (130,'100-649','서울시','중구','서울중앙우체국사서함4900-\r\n');
INSERT INTO postno VALUES (131,'100-650','서울시','중구','서울중앙우체국사서함5000-\r\n');
INSERT INTO postno VALUES (132,'100-651','서울시','중구','서울중앙우체국사서함5100-\r\n');
INSERT INTO postno VALUES (133,'100-652','서울시','중구','서울중앙우체국사서함5200-\r\n');
INSERT INTO postno VALUES (134,'100-653','서울시','중구','서울중앙우체국사서함5300-\r\n');
INSERT INTO postno VALUES (135,'100-654','서울시','중구','서울중앙우체국사서함5400-\r\n');
INSERT INTO postno VALUES (136,'100-655','서울시','중구','서울중앙우체국사서함5500-\r\n');
INSERT INTO postno VALUES (137,'100-656','서울시','중구','서울중앙우체국사서함5600-\r\n');
INSERT INTO postno VALUES (138,'100-657','서울시','중구','서울중앙우체국사서함5700-\r\n');
INSERT INTO postno VALUES (139,'100-658','서울시','중구','서울중앙우체국사서함5800-\r\n');
INSERT INTO postno VALUES (140,'100-659','서울시','중구','서울중앙우체국사서함5900-\r\n');
INSERT INTO postno VALUES (141,'100-660','서울시','중구','서울중앙우체국사서함6000-\r\n');
INSERT INTO postno VALUES (142,'100-661','서울시','중구','서울중앙우체국사서함6100-\r\n');
INSERT INTO postno VALUES (143,'100-662','서울시','중구','서울중앙우체국사서함6200-\r\n');
INSERT INTO postno VALUES (144,'100-663','서울시','중구','서울중앙우체국사서함6300-\r\n');
INSERT INTO postno VALUES (145,'100-664','서울시','중구','서울중앙우체국사서함6400-\r\n');
INSERT INTO postno VALUES (146,'100-665','서울시','중구','서울중앙우체국사서함6500-\r\n');
INSERT INTO postno VALUES (147,'100-666','서울시','중구','서울중앙우체국사서함6600-\r\n');
INSERT INTO postno VALUES (148,'100-667','서울시','중구','서울중앙우체국사서함6700-\r\n');
INSERT INTO postno VALUES (149,'100-668','서울시','중구','서울중앙우체국사서함6800-\r\n');
INSERT INTO postno VALUES (150,'100-669','서울시','중구','서울중앙우체국사서함6900-\r\n');
INSERT INTO postno VALUES (151,'100-670','서울시','중구','서울중앙우체국사서함7000-\r\n');
INSERT INTO postno VALUES (152,'100-671','서울시','중구','서울중앙우체국사서함7100-\r\n');
INSERT INTO postno VALUES (153,'100-672','서울시','중구','서울중앙우체국사서함7200-\r\n');
INSERT INTO postno VALUES (154,'100-673','서울시','중구','서울중앙우체국사서함7300-\r\n');
INSERT INTO postno VALUES (155,'100-674','서울시','중구','서울중앙우체국사서함7400-\r\n');
INSERT INTO postno VALUES (156,'100-675','서울시','중구','서울중앙우체국사서함7500-\r\n');
INSERT INTO postno VALUES (157,'100-676','서울시','중구','서울중앙우체국사서함7600-\r\n');
INSERT INTO postno VALUES (158,'100-677','서울시','중구','서울중앙우체국사서함7700-\r\n');
INSERT INTO postno VALUES (159,'100-678','서울시','중구','서울중앙우체국사서함7800-\r\n');
INSERT INTO postno VALUES (160,'100-679','서울시','중구','서울중앙우체국사서함7900-\r\n');
INSERT INTO postno VALUES (161,'100-680','서울시','중구','서울중앙우체국사서함8000-\r\n');
INSERT INTO postno VALUES (162,'100-681','서울시','중구','서울중앙우체국사서함8100-\r\n');
INSERT INTO postno VALUES (163,'100-682','서울시','중구','서울중앙우체국사서함8200-\r\n');
INSERT INTO postno VALUES (164,'100-683','서울시','중구','서울중앙우체국사서함8300-\r\n');
INSERT INTO postno VALUES (165,'100-684','서울시','중구','서울중앙우체국사서함8400-\r\n');
INSERT INTO postno VALUES (166,'100-685','서울시','중구','서울중앙우체국사서함8500-\r\n');
INSERT INTO postno VALUES (167,'100-686','서울시','중구','서울중앙우체국사서함8600-\r\n');
INSERT INTO postno VALUES (168,'100-687','서울시','중구','서울중앙우체국사서함8700-\r\n');
INSERT INTO postno VALUES (169,'100-688','서울시','중구','서울중앙우체국사서함8800-\r\n');
INSERT INTO postno VALUES (170,'100-689','서울시','중구','서울중앙우체국사서함8900-\r\n');
INSERT INTO postno VALUES (171,'100-690','서울시','중구','서울중앙우체국사서함9000-\r\n');
INSERT INTO postno VALUES (172,'100-691','서울시','중구','서울중앙우체국사서함9100-\r\n');
INSERT INTO postno VALUES (173,'100-692','서울시','중구','서울중앙우체국사서함9200-\r\n');
INSERT INTO postno VALUES (174,'100-693','서울시','중구','서울중앙우체국사서함9300-\r\n');
INSERT INTO postno VALUES (175,'100-694','서울시','중구','서울중앙우체국사서함9400-\r\n');
INSERT INTO postno VALUES (176,'100-695','서울시','중구','서울중앙우체국사서함9500-\r\n');
INSERT INTO postno VALUES (177,'100-696','서울시','중구','서울중앙우체국사서함9600-\r\n');
INSERT INTO postno VALUES (178,'100-697','서울시','중구','서울중앙우체국사서함9700-\r\n');
INSERT INTO postno VALUES (179,'100-698','서울시','중구','서울중앙우체국사서함9800-\r\n');
INSERT INTO postno VALUES (180,'100-699','서울시','중구','서울중앙우체국사서함9900-\r\n');
INSERT INTO postno VALUES (181,'100-701','서울시','중구','예관동 중구청\r\n');
INSERT INTO postno VALUES (182,'100-702','서울시','중구','정동 경향신문사건물\r\n');
INSERT INTO postno VALUES (183,'100-703','서울시','중구','남대문로2가 국민은행본점\r\n');
INSERT INTO postno VALUES (184,'100-704','서울시','중구','남대문로5가 국제보험빌딩\r\n');
INSERT INTO postno VALUES (185,'100-705','서울시','중구','충무로3가 극동빌딩\r\n');
INSERT INTO postno VALUES (186,'100-706','서울시','중구','충무로1가 고려대연각센타빌\r\n');
INSERT INTO postno VALUES (187,'100-707','서울시','중구','충정로1가 농협중앙회건물\r\n');
INSERT INTO postno VALUES (188,'100-708','서울시','중구','남대문5가 남대문경찰서\r\n');
INSERT INTO postno VALUES (189,'100-709','서울시','중구','광희동1가 광희빌딩\r\n');
INSERT INTO postno VALUES (190,'100-710','서울시','중구','광희동1가 광희빌딩\r\n');
INSERT INTO postno VALUES (191,'100-711','서울시','중구','남대문5가 그린빌딩\r\n');
INSERT INTO postno VALUES (192,'100-712','서울시','중구','순화동 삼도빌딩\r\n');
INSERT INTO postno VALUES (193,'100-713','서울시','중구','신당5동 교통안전협회\r\n');
INSERT INTO postno VALUES (194,'100-714','서울시','중구','남대문로5가 대우센타건물\r\n');
INSERT INTO postno VALUES (195,'100-715','서울시','중구','필동3가 동국대학교\r\n');
INSERT INTO postno VALUES (196,'100-716','서울시','중구','태평로2가 동방빌딩\r\n');
INSERT INTO postno VALUES (197,'100-717','서울시','중구','중림동 대왕빌딩\r\n');
INSERT INTO postno VALUES (198,'100-718','서울시','중구','소공동 동양화학빌딩\r\n');
INSERT INTO postno VALUES (199,'100-719','서울시','중구','을지로1가 두산빌딩\r\n');
INSERT INTO postno VALUES (200,'100-720','서울시','중구','을지로2가 보람은행본점\r\n');
INSERT INTO postno VALUES (201,'100-721','서울시','중구','소공동 롯데쇼핑센타빌딩\r\n');
INSERT INTO postno VALUES (202,'100-722','서울시','중구','남대문로5가 LG역전빌딩\r\n');
INSERT INTO postno VALUES (203,'100-723','서울시','중구','충정로1가 문화일보사\r\n');
INSERT INTO postno VALUES (204,'100-724','서울시','중구','태평로2가 대경빌딩\r\n');
INSERT INTO postno VALUES (205,'100-725','서울시','중구','회현동2가 아시아나항공빌\r\n');
INSERT INTO postno VALUES (206,'100-728','서울시','중구','매일경제신문사빌딩\r\n');
INSERT INTO postno VALUES (207,'100-729','서울시','중구','남대문로2가 미도파백화점\r\n');
INSERT INTO postno VALUES (208,'100-742','서울시','중구','태평로2가 삼성본관빌딩\r\n');
INSERT INTO postno VALUES (209,'100-743','서울시','중구','태평로2가 상공회의소회관\r\n');
INSERT INTO postno VALUES (210,'100-744','서울시','중구','태평로1가 서울시청\r\n');
INSERT INTO postno VALUES (211,'100-745','서울시','중구','태평로1가 서울신문사빌딩\r\n');
INSERT INTO postno VALUES (212,'100-745','서울시','중구','태평로1가 한국언론회관\r\n');
INSERT INTO postno VALUES (213,'100-746','서울시','중구','서울은행본점건물\r\n');
INSERT INTO postno VALUES (214,'100-747','서울시','중구','충무로1가 신세계백화점건물\r\n');
INSERT INTO postno VALUES (215,'100-748','서울시','중구','저동2가 쌍용빌딩\r\n');
INSERT INTO postno VALUES (216,'100-750','서울시','중구','예장동 서울예술전문대학\r\n');
INSERT INTO postno VALUES (217,'100-751','서울시','중구','예장동 숭의여자전문대학\r\n');
INSERT INTO postno VALUES (218,'100-752','서울시','중구','서소문동 신아일보사빌딩\r\n');
INSERT INTO postno VALUES (219,'100-753','서울시','중구','남대문로5가 세브란스빌딩\r\n');
INSERT INTO postno VALUES (220,'100-756','서울시','중구','태평로1가 조선일보사건물\r\n');
INSERT INTO postno VALUES (221,'100-757','서울시','중구','남대문로1가 조흥은행본점\r\n');
INSERT INTO postno VALUES (222,'100-758','서울시','중구','중소기업은행본점건물\r\n');
INSERT INTO postno VALUES (223,'100-759','서울시','중구','순화동 중앙일보사건물\r\n');
INSERT INTO postno VALUES (224,'100-760','서울시','중구','장교동 장교빌딩\r\n');
INSERT INTO postno VALUES (225,'100-770','서울시','중구','남대문로2가 해운센터빌딩\r\n');
INSERT INTO postno VALUES (226,'100-771','서울시','중구','코리아헤럴드빌딩\r\n');
INSERT INTO postno VALUES (227,'100-772','서울시','중구','무교동 코오롱빌딩\r\n');
INSERT INTO postno VALUES (228,'100-778','서울시','중구','남창동 대한화재보험빌딩\r\n');
INSERT INTO postno VALUES (229,'100-781','서울시','중구','신당6동 현대아파트\r\n');
INSERT INTO postno VALUES (230,'100-791','서울시','중구','중림동 한국경제신문사빌딩\r\n');
INSERT INTO postno VALUES (231,'100-792','서울시','중구','한국상업은행본점건물\r\n');
INSERT INTO postno VALUES (232,'100-793','서울시','중구','한국외환은행본점건물\r\n');
INSERT INTO postno VALUES (233,'100-794','서울시','중구','남대문로3가 한국은행건물\r\n');
INSERT INTO postno VALUES (234,'100-795','서울시','중구','남대문로2가 한일은행본점건\r\n');
INSERT INTO postno VALUES (235,'100-796','서울시','중구','초동 한국자동차보험빌딩\r\n');
INSERT INTO postno VALUES (236,'100-797','서울시','중구','장교동 현암빌딩\r\n');
INSERT INTO postno VALUES (237,'100-798','서울시','중구','봉래동2가 철도청건물\r\n');
INSERT INTO postno VALUES (238,'100-799','서울시','중구','을지로6가 국립의료원건물\r\n');
INSERT INTO postno VALUES (239,'110-010','서울시','종로구','신영동\r\n');
INSERT INTO postno VALUES (240,'110-011','서울시','종로구','구기동\r\n');
INSERT INTO postno VALUES (241,'110-012','서울시','종로구','평창동\r\n');
INSERT INTO postno VALUES (242,'110-020','서울시','종로구','홍지동\r\n');
INSERT INTO postno VALUES (243,'110-021','서울시','종로구','부암동\r\n');
INSERT INTO postno VALUES (244,'110-030','서울시','종로구','청운동\r\n');
INSERT INTO postno VALUES (245,'110-031','서울시','종로구','궁정동\r\n');
INSERT INTO postno VALUES (246,'110-032','서울시','종로구','신교동\r\n');
INSERT INTO postno VALUES (247,'110-033','서울시','종로구','효자동\r\n');
INSERT INTO postno VALUES (248,'110-034','서울시','종로구','창성동\r\n');
INSERT INTO postno VALUES (249,'110-035','서울시','종로구','옥인동\r\n');
INSERT INTO postno VALUES (250,'110-040','서울시','종로구','통의동\r\n');
INSERT INTO postno VALUES (251,'110-041','서울시','종로구','누상동\r\n');
INSERT INTO postno VALUES (252,'110-042','서울시','종로구','누하동\r\n');
INSERT INTO postno VALUES (253,'110-043','서울시','종로구','통인동\r\n');
INSERT INTO postno VALUES (254,'110-044','서울시','종로구','필운동\r\n');
INSERT INTO postno VALUES (255,'110-045','서울시','종로구','체부동\r\n');
INSERT INTO postno VALUES (256,'110-050','서울시','종로구','세종로\r\n');
INSERT INTO postno VALUES (257,'110-051','서울시','종로구','도렴동\r\n');
INSERT INTO postno VALUES (258,'110-052','서울시','종로구','적선동\r\n');
INSERT INTO postno VALUES (259,'110-053','서울시','종로구','내자동\r\n');
INSERT INTO postno VALUES (260,'110-054','서울시','종로구','사직동\r\n');
INSERT INTO postno VALUES (261,'110-061','서울시','종로구','신문로1가\r\n');
INSERT INTO postno VALUES (262,'110-062','서울시','종로구','신문로2가\r\n');
INSERT INTO postno VALUES (263,'110-070','서울시','종로구','내수동\r\n');
INSERT INTO postno VALUES (264,'110-071','서울시','종로구','당주동\r\n');
INSERT INTO postno VALUES (265,'110-080','서울시','종로구','무악동\r\n');
INSERT INTO postno VALUES (266,'110-090','서울시','종로구','교북동\r\n');
INSERT INTO postno VALUES (267,'110-091','서울시','종로구','행촌동\r\n');
INSERT INTO postno VALUES (268,'110-092','서울시','종로구','홍파동\r\n');
INSERT INTO postno VALUES (269,'110-100','서울시','종로구','교남동\r\n');
INSERT INTO postno VALUES (270,'110-101','서울시','종로구','송월동\r\n');
INSERT INTO postno VALUES (271,'110-102','서울시','종로구','평동\r\n');
INSERT INTO postno VALUES (272,'110-110','서울시','종로구','서린동\r\n');
INSERT INTO postno VALUES (273,'110-111','서울시','종로구','관철동\r\n');
INSERT INTO postno VALUES (274,'110-121','서울시','종로구','종로1가\r\n');
INSERT INTO postno VALUES (275,'110-122','서울시','종로구','종로2가\r\n');
INSERT INTO postno VALUES (276,'110-123','서울시','종로구','종로3가\r\n');
INSERT INTO postno VALUES (277,'110-124','서울시','종로구','종로4가\r\n');
INSERT INTO postno VALUES (278,'110-125','서울시','종로구','종로5가\r\n');
INSERT INTO postno VALUES (279,'110-126','서울시','종로구','종로6가\r\n');
INSERT INTO postno VALUES (280,'110-130','서울시','종로구','청진동\r\n');
INSERT INTO postno VALUES (281,'110-140','서울시','종로구','수송동\r\n');
INSERT INTO postno VALUES (282,'110-150','서울시','종로구','중학동\r\n');
INSERT INTO postno VALUES (283,'110-160','서울시','종로구','공평동\r\n');
INSERT INTO postno VALUES (284,'110-170','서울시','종로구','견지동\r\n');
INSERT INTO postno VALUES (285,'110-180','서울시','종로구','송현동\r\n');
INSERT INTO postno VALUES (286,'110-190','서울시','종로구','사간동\r\n');
INSERT INTO postno VALUES (287,'110-200','서울시','종로구','소격동\r\n');
INSERT INTO postno VALUES (288,'110-210','서울시','종로구','화동\r\n');
INSERT INTO postno VALUES (289,'110-220','서울시','종로구','팔판동\r\n');
INSERT INTO postno VALUES (290,'110-230','서울시','종로구','삼청동\r\n');
INSERT INTO postno VALUES (291,'110-240','서울시','종로구','안국동\r\n');
INSERT INTO postno VALUES (292,'110-250','서울시','종로구','재동\r\n');
INSERT INTO postno VALUES (293,'110-260','서울시','종로구','가회동\r\n');
INSERT INTO postno VALUES (294,'110-270','서울시','종로구','계동\r\n');
INSERT INTO postno VALUES (295,'110-280','서울시','종로구','원서동\r\n');
INSERT INTO postno VALUES (296,'110-290','서울시','종로구','인사동\r\n');
INSERT INTO postno VALUES (297,'110-300','서울시','종로구','관훈동\r\n');
INSERT INTO postno VALUES (298,'110-310','서울시','종로구','경운동\r\n');
INSERT INTO postno VALUES (299,'110-320','서울시','종로구','낙원동\r\n');
INSERT INTO postno VALUES (300,'110-330','서울시','종로구','돈의동\r\n');
INSERT INTO postno VALUES (301,'110-340','서울시','종로구','익선동\r\n');
INSERT INTO postno VALUES (302,'110-350','서울시','종로구','운니동\r\n');
INSERT INTO postno VALUES (303,'110-360','서울시','종로구','와룡동\r\n');
INSERT INTO postno VALUES (304,'110-370','서울시','종로구','묘동\r\n');
INSERT INTO postno VALUES (305,'110-380','서울시','종로구','권농동\r\n');
INSERT INTO postno VALUES (306,'110-390','서울시','종로구','봉익동\r\n');
INSERT INTO postno VALUES (307,'110-400','서울시','종로구','훈정동\r\n');
INSERT INTO postno VALUES (308,'110-410','서울시','종로구','인의동\r\n');
INSERT INTO postno VALUES (309,'110-420','서울시','종로구','관수동\r\n');
INSERT INTO postno VALUES (310,'110-430','서울시','종로구','장사동\r\n');
INSERT INTO postno VALUES (311,'110-440','서울시','종로구','예지동\r\n');
INSERT INTO postno VALUES (312,'110-450','서울시','종로구','원남동\r\n');
INSERT INTO postno VALUES (313,'110-460','서울시','종로구','연건동\r\n');
INSERT INTO postno VALUES (314,'110-470','서울시','종로구','연지동\r\n');
INSERT INTO postno VALUES (315,'110-480','서울시','종로구','효제동\r\n');
INSERT INTO postno VALUES (316,'110-490','서울시','종로구','충신동\r\n');
INSERT INTO postno VALUES (317,'110-500','서울시','종로구','이화동\r\n');
INSERT INTO postno VALUES (318,'110-510','서울시','종로구','둥숭동\r\n');
INSERT INTO postno VALUES (319,'110-520','서울시','종로구','명륜동1가\r\n');
INSERT INTO postno VALUES (320,'110-521','서울시','종로구','명륜동1가\r\n');
INSERT INTO postno VALUES (321,'110-522','서울시','종로구','명륜동2가\r\n');
INSERT INTO postno VALUES (322,'110-523','서울시','종로구','명륜동3가\r\n');
INSERT INTO postno VALUES (323,'110-524','서울시','종로구','명륜동4가\r\n');
INSERT INTO postno VALUES (324,'110-530','서울시','종로구','혜화동\r\n');
INSERT INTO postno VALUES (325,'110-540','서울시','종로구','창신동\r\n');
INSERT INTO postno VALUES (326,'110-541','서울시','종로구','창신1동\r\n');
INSERT INTO postno VALUES (327,'110-542','서울시','종로구','창신2동\r\n');
INSERT INTO postno VALUES (328,'110-543','서울시','종로구','창신3동\r\n');
INSERT INTO postno VALUES (329,'110-550','서울시','종로구','숭인동\r\n');
INSERT INTO postno VALUES (330,'110-551','서울시','종로구','숭인1동\r\n');
INSERT INTO postno VALUES (331,'110-552','서울시','종로구','숭인2동\r\n');
INSERT INTO postno VALUES (332,'110-600','서울시','종로구','광화문우체국사서함0001-\r\n');
INSERT INTO postno VALUES (333,'110-601','서울시','종로구','광화문우체국사서함0100-\r\n');
INSERT INTO postno VALUES (334,'110-602','서울시','종로구','광화문우체국사서함0200-\r\n');
INSERT INTO postno VALUES (335,'110-603','서울시','종로구','광화문우체국사서함0300-\r\n');
INSERT INTO postno VALUES (336,'110-604','서울시','종로구','광화문우체국사서함0400-\r\n');
INSERT INTO postno VALUES (337,'110-605','서울시','종로구','광화문우체국사서함0500-\r\n');
INSERT INTO postno VALUES (338,'110-606','서울시','종로구','광화문우체국사서함0600-\r\n');
INSERT INTO postno VALUES (339,'110-607','서울시','종로구','광화문우체국사서함0700-\r\n');
INSERT INTO postno VALUES (340,'110-608','서울시','종로구','광화문우체국사서함0800-\r\n');
INSERT INTO postno VALUES (341,'110-609','서울시','종로구','광화문우체국사서함0900-\r\n');
INSERT INTO postno VALUES (342,'110-610','서울시','종로구','광화문우체국사서함1000-\r\n');
INSERT INTO postno VALUES (343,'110-611','서울시','종로구','광화문우체국사서함1100-\r\n');
INSERT INTO postno VALUES (344,'110-612','서울시','종로구','광화문우체국사서함1200-\r\n');
INSERT INTO postno VALUES (345,'110-613','서울시','종로구','광화문우체국사서함1300-\r\n');
INSERT INTO postno VALUES (346,'110-614','서울시','종로구','광화문우체국사서함1400-\r\n');
INSERT INTO postno VALUES (347,'110-615','서울시','종로구','광화문우체국사서함1500-\r\n');
INSERT INTO postno VALUES (348,'110-616','서울시','종로구','광화문우체국사서함1600-\r\n');
INSERT INTO postno VALUES (349,'110-617','서울시','종로구','광화문우체국사서함1700-\r\n');
INSERT INTO postno VALUES (350,'110-618','서울시','종로구','광화문우체국사서함1800-\r\n');
INSERT INTO postno VALUES (351,'110-619','서울시','종로구','광화문우체국사서함1900-\r\n');
INSERT INTO postno VALUES (352,'110-700','서울시','종로구','신문로1가 세안빌딩\r\n');
INSERT INTO postno VALUES (353,'110-700','서울시','종로구','신문로1가 정보통신부\r\n');
INSERT INTO postno VALUES (354,'110-701','서울시','종로구','수공동 종로구청\r\n');
INSERT INTO postno VALUES (355,'110-702','서울시','종로구','공평동 제일은행본점건물\r\n');
INSERT INTO postno VALUES (356,'110-703','서울시','종로구','세종로 문체부.공보처건물\r\n');
INSERT INTO postno VALUES (357,'110-704','서울시','종로구','관훈동 관훈빌딩\r\n');
INSERT INTO postno VALUES (358,'110-705','서울시','종로구','수송동 국세청\r\n');
INSERT INTO postno VALUES (359,'110-706','서울시','종로구','삼청동 감사원\r\n');
INSERT INTO postno VALUES (360,'110-707','서울시','종로구','낙원동 낙원빌딩\r\n');
INSERT INTO postno VALUES (361,'110-708','서울시','종로구','경운동 종로경찰서\r\n');
INSERT INTO postno VALUES (362,'110-709','서울시','종로구','낙원동 종로세무서\r\n');
INSERT INTO postno VALUES (363,'110-710','서울시','종로구','낙원동 광화문세무서\r\n');
INSERT INTO postno VALUES (364,'110-711','서울시','종로구','인의동 동대문경찰서\r\n');
INSERT INTO postno VALUES (365,'110-712','서울시','종로구','인의동 서울시선거관리위원\r\n');
INSERT INTO postno VALUES (366,'110-713','서울시','종로구','효제동 효제세무서\r\n');
INSERT INTO postno VALUES (367,'110-714','서울시','종로구','종로1가 교보생명빌딩\r\n');
INSERT INTO postno VALUES (368,'110-716','서울시','종로구','도렴동 도렴정우빌딩\r\n');
INSERT INTO postno VALUES (369,'110-717','서울시','종로구','인의동 동원회관빌딩\r\n');
INSERT INTO postno VALUES (370,'110-718','서울시','종로구','관훈동 백상빌딩\r\n');
INSERT INTO postno VALUES (371,'110-719','서울시','종로구','내수동 대우빌딩\r\n');
INSERT INTO postno VALUES (372,'110-720','서울시','종로구','내자동 세양빌딩\r\n');
INSERT INTO postno VALUES (373,'110-721','서울시','종로구','당주동 로얄빌딩\r\n');
INSERT INTO postno VALUES (374,'110-722','서울시','종로구','당주동 미도파빌딩\r\n');
INSERT INTO postno VALUES (375,'110-723','서울시','종로구','당주동 변호사빌딩\r\n');
INSERT INTO postno VALUES (376,'110-724','서울시','종로구','당주동 세종빌딩\r\n');
INSERT INTO postno VALUES (377,'110-725','서울시','종로구','연지동 삼양사빌딩\r\n');
INSERT INTO postno VALUES (378,'110-726','서울시','종로구','서린동 갑을빌딩\r\n');
INSERT INTO postno VALUES (379,'110-727','서울시','종로구','수송동 석탄회관건물\r\n');
INSERT INTO postno VALUES (380,'110-729','서울시','종로구','서린동 한효빌딩\r\n');
INSERT INTO postno VALUES (381,'110-730','서울시','종로구','세종로 광화문빌딩\r\n');
INSERT INTO postno VALUES (382,'110-731','서울시','종로구','세종로 현대해상화재빌딩\r\n');
INSERT INTO postno VALUES (383,'110-732','서울시','종로구','수송동 대림빌딩\r\n');
INSERT INTO postno VALUES (384,'110-733','서울시','종로구','수송동 대한재보험빌딩\r\n');
INSERT INTO postno VALUES (385,'110-734','서울시','종로구','안국동 안국빌딩\r\n');
INSERT INTO postno VALUES (386,'110-735','서울시','종로구','필운동 배화여자전문대학\r\n');
INSERT INTO postno VALUES (387,'110-736','서울시','종로구','연지동 기독교회관\r\n');
INSERT INTO postno VALUES (388,'110-737','서울시','종로구','연지동 보증보험빌딩\r\n');
INSERT INTO postno VALUES (389,'110-738','서울시','종로구','연지동 여전도회관\r\n');
INSERT INTO postno VALUES (390,'110-739','서울시','종로구','연지동 연강빌딩\r\n');
INSERT INTO postno VALUES (391,'110-740','서울시','종로구','연지동 연합빌딩\r\n');
INSERT INTO postno VALUES (392,'110-741','서울시','종로구','인사동 대일빌딩\r\n');
INSERT INTO postno VALUES (393,'110-742','서울시','종로구','운니동 삼환빌딩\r\n');
INSERT INTO postno VALUES (394,'110-743','서울시','종로구','홍지동 상명여자대학교\r\n');
INSERT INTO postno VALUES (395,'110-744','서울시','종로구','연건동 서울대학교부속병원\r\n');
INSERT INTO postno VALUES (396,'110-745','서울시','종로구','명륜동3가 성균관대학교\r\n');
INSERT INTO postno VALUES (397,'110-748','서울시','종로구','관철동 한국산업은행본점건\r\n');
INSERT INTO postno VALUES (398,'110-749','서울시','종로구','연건동 서울대학교치과대학\r\n');
INSERT INTO postno VALUES (399,'110-750','서울시','종로구','원남동 보령빌딩\r\n');
INSERT INTO postno VALUES (400,'110-751','서울시','종로구','적선동 한국생산성본부\r\n');
INSERT INTO postno VALUES (401,'110-752','서울시','종로구','서린동 영풍빌딩\r\n');
INSERT INTO postno VALUES (402,'110-753','서울시','종로구','종로2가 Y.M.C.A\r\n');
INSERT INTO postno VALUES (403,'110-754','서울시','종로구','연지동 은석빌딩\r\n');
INSERT INTO postno VALUES (404,'110-755','서울시','종로구','수송동 이마빌딩\r\n');
INSERT INTO postno VALUES (405,'110-756','서울시','종로구','적선동 적선현대빌딩\r\n');
INSERT INTO postno VALUES (406,'110-757','서울시','종로구','송월동 기상청\r\n');
INSERT INTO postno VALUES (407,'110-758','서울시','종로구','혜화동 카톨릭의과대학\r\n');
INSERT INTO postno VALUES (408,'110-760','서울시','종로구','세종로 제1정부종합청사\r\n');
INSERT INTO postno VALUES (409,'110-771','서울시','종로구','창신3동 쌍용아파트\r\n');
INSERT INTO postno VALUES (410,'110-777','서울시','종로구','통신센타빌딩(한국통신)\r\n');
INSERT INTO postno VALUES (411,'110-778','서울시','종로구','인사동 태화빌딩\r\n');
INSERT INTO postno VALUES (412,'110-790','서울시','종로구','서린동 서린빌딩\r\n');
INSERT INTO postno VALUES (413,'110-791','서울시','종로구','동숭동 한국방송통신대학\r\n');
INSERT INTO postno VALUES (414,'110-792','서울시','종로구','중학동 한국일보사건물\r\n');
INSERT INTO postno VALUES (415,'110-793','서울시','종로구','계동 현대빌딩\r\n');
INSERT INTO postno VALUES (416,'110-794','서울시','종로구','인사동 하나로빌딩\r\n');
INSERT INTO postno VALUES (417,'110-798','서울시','종로구','내자동 서울지방경찰청건물\r\n');
INSERT INTO postno VALUES (418,'110-799','서울시','종로구','연건동 서울대의과대건물\r\n');
INSERT INTO postno VALUES (419,'120-012','서울시','서대문구','충정로2가\r\n');
INSERT INTO postno VALUES (420,'120-013','서울시','서대문구','충정로3가\r\n');
INSERT INTO postno VALUES (421,'120-020','서울시','서대문구','미근동\r\n');
INSERT INTO postno VALUES (422,'120-030','서울시','서대문구','합동\r\n');
INSERT INTO postno VALUES (423,'120-040','서울시','서대문구','천연동\r\n');
INSERT INTO postno VALUES (424,'120-050','서울시','서대문구','냉천동\r\n');
INSERT INTO postno VALUES (425,'120-060','서울시','서대문구','옥천동\r\n');
INSERT INTO postno VALUES (426,'120-070','서울시','서대문구','영천동\r\n');
INSERT INTO postno VALUES (427,'120-080','서울시','서대문구','현저동\r\n');
INSERT INTO postno VALUES (428,'120-090','서울시','서대문구','홍제동\r\n');
INSERT INTO postno VALUES (429,'120-091','서울시','서대문구','홍제1동\r\n');
INSERT INTO postno VALUES (430,'120-092','서울시','서대문구','홍제2동\r\n');
INSERT INTO postno VALUES (431,'120-093','서울시','서대문구','홍제3동\r\n');
INSERT INTO postno VALUES (432,'120-094','서울시','서대문구','홍제4동\r\n');
INSERT INTO postno VALUES (433,'120-100','서울시','서대문구','홍은동\r\n');
INSERT INTO postno VALUES (434,'120-101','서울시','서대문구','홍은1동\r\n');
INSERT INTO postno VALUES (435,'120-102','서울시','서대문구','홍은2동\r\n');
INSERT INTO postno VALUES (436,'120-103','서울시','서대문구','홍은3동\r\n');
INSERT INTO postno VALUES (437,'120-110','서울시','서대문구','연희동\r\n');
INSERT INTO postno VALUES (438,'120-111','서울시','서대문구','연희1동\r\n');
INSERT INTO postno VALUES (439,'120-112','서울시','서대문구','연희2동\r\n');
INSERT INTO postno VALUES (440,'120-113','서울시','서대문구','연희3동\r\n');
INSERT INTO postno VALUES (441,'120-120','서울시','서대문구','남가좌동\r\n');
INSERT INTO postno VALUES (442,'120-121','서울시','서대문구','남가좌1동\r\n');
INSERT INTO postno VALUES (443,'120-122','서울시','서대문구','남가좌2동\r\n');
INSERT INTO postno VALUES (444,'120-130','서울시','서대문구','북가좌동\r\n');
INSERT INTO postno VALUES (445,'120-131','서울시','서대문구','북가좌1동\r\n');
INSERT INTO postno VALUES (446,'120-132','서울시','서대문구','북가좌2동\r\n');
INSERT INTO postno VALUES (447,'120-140','서울시','서대문구','신촌동\r\n');
INSERT INTO postno VALUES (448,'120-150','서울시','서대문구','봉원동\r\n');
INSERT INTO postno VALUES (449,'120-160','서울시','서대문구','대신동\r\n');
INSERT INTO postno VALUES (450,'120-170','서울시','서대문구','대현동\r\n');
INSERT INTO postno VALUES (451,'120-180','서울시','서대문구','창천동\r\n');
INSERT INTO postno VALUES (452,'120-190','서울시','서대문구','북아현동\r\n');
INSERT INTO postno VALUES (453,'120-191','서울시','서대문구','북아현1동\r\n');
INSERT INTO postno VALUES (454,'120-192','서울시','서대문구','북아현2동\r\n');
INSERT INTO postno VALUES (455,'120-193','서울시','서대문구','북아현3동\r\n');
INSERT INTO postno VALUES (456,'120-600','서울시','서대문구','서대문우체국사서함\r\n');
INSERT INTO postno VALUES (457,'120-650','서울시','서대문구','충정로우체국사서함\r\n');
INSERT INTO postno VALUES (458,'120-701','서울시','서대문구','냉천동 감리교신학대학\r\n');
INSERT INTO postno VALUES (459,'120-702','서울시','서대문구','충정로2가 경기대학교\r\n');
INSERT INTO postno VALUES (460,'120-703','서울시','서대문구','연희2동 서대문구청\r\n');
INSERT INTO postno VALUES (461,'120-704','서울시','서대문구','미근동 경찰청\r\n');
INSERT INTO postno VALUES (462,'120-705','서울시','서대문구','미근동 삼성데이터시스템\r\n');
INSERT INTO postno VALUES (463,'120-706','서울시','서대문구','창천동 그레이스백화점\r\n');
INSERT INTO postno VALUES (464,'120-707','서울시','서대문구','충정로2가 사조산업빌딩\r\n');
INSERT INTO postno VALUES (465,'120-708','서울시','서대문구','충정로3가 피어리스빌딩\r\n');
INSERT INTO postno VALUES (466,'120-709','서울시','서대문구','충정로3가 해동화재보험\r\n');
INSERT INTO postno VALUES (467,'120-710','서울시','서대문구','스위스그랜드호텔\r\n');
INSERT INTO postno VALUES (468,'120-715','서울시','서대문구','동아일보사건물\r\n');
INSERT INTO postno VALUES (469,'120-728','서울시','서대문구','남가좌2동 명지대학교\r\n');
INSERT INTO postno VALUES (470,'120-728','서울시','서대문구','남가좌2동 명지전문대\r\n');
INSERT INTO postno VALUES (471,'120-742','서울시','서대문구','서울간호전문대학\r\n');
INSERT INTO postno VALUES (472,'120-749','서울시','서대문구','신촌동 연세대학교\r\n');
INSERT INTO postno VALUES (473,'120-750','서울시','서대문구','대현동 이화여자대학교\r\n');
INSERT INTO postno VALUES (474,'120-751','서울시','서대문구','아세아연합신학대학교\r\n');
INSERT INTO postno VALUES (475,'120-752','서울시','서대문구','신촌동 연세의료원건물\r\n');
INSERT INTO postno VALUES (476,'120-756','서울시','서대문구','충정로3가 종근당빌딩\r\n');
INSERT INTO postno VALUES (477,'120-757','서울시','서대문구','대현동 럭키아파트\r\n');
INSERT INTO postno VALUES (478,'120-763','서울시','서대문구','북아현3동 추계예술학교\r\n');
INSERT INTO postno VALUES (479,'120-771','서울시','서대문구','홍은1동 벽산아파트\r\n');
INSERT INTO postno VALUES (480,'120-772','서울시','서대문구','홍은3동 현대아파트\r\n');
INSERT INTO postno VALUES (481,'120-781','서울시','서대문구','홍제3동 유원하나아파트\r\n');
INSERT INTO postno VALUES (482,'120-782','서울시','서대문구','홍제3동 한양아파트\r\n');
INSERT INTO postno VALUES (483,'120-783','서울시','서대문구','홍제3동 현대아파트\r\n');
INSERT INTO postno VALUES (484,'120-786','서울시','서대문구','홍제4동 청구아파트\r\n');
INSERT INTO postno VALUES (485,'121-010','서울시','마포구','아현동\r\n');
INSERT INTO postno VALUES (486,'121-011','서울시','마포구','아현1동\r\n');
INSERT INTO postno VALUES (487,'121-012','서울시','마포구','아현2동\r\n');
INSERT INTO postno VALUES (488,'121-013','서울시','마포구','아현3동\r\n');
INSERT INTO postno VALUES (489,'121-020','서울시','마포구','공덕동\r\n');
INSERT INTO postno VALUES (490,'121-021','서울시','마포구','공덕1동\r\n');
INSERT INTO postno VALUES (491,'121-022','서울시','마포구','공덕2동\r\n');
INSERT INTO postno VALUES (492,'121-030','서울시','마포구','신공덕동\r\n');
INSERT INTO postno VALUES (493,'121-040','서울시','마포구','도화동\r\n');
INSERT INTO postno VALUES (494,'121-041','서울시','마포구','도화1동\r\n');
INSERT INTO postno VALUES (495,'121-042','서울시','마포구','도화2동\r\n');
INSERT INTO postno VALUES (496,'121-050','서울시','마포구','마포동\r\n');
INSERT INTO postno VALUES (497,'121-060','서울시','마포구','토정동\r\n');
INSERT INTO postno VALUES (498,'121-070','서울시','마포구','용강동\r\n');
INSERT INTO postno VALUES (499,'121-080','서울시','마포구','대흥동\r\n');
INSERT INTO postno VALUES (500,'121-090','서울시','마포구','염리동\r\n');
INSERT INTO postno VALUES (501,'121-100','서울시','마포구','노고산동\r\n');
INSERT INTO postno VALUES (502,'121-110','서울시','마포구','신수동\r\n');
INSERT INTO postno VALUES (503,'121-120','서울시','마포구','현석동\r\n');
INSERT INTO postno VALUES (504,'121-130','서울시','마포구','구수동\r\n');
INSERT INTO postno VALUES (505,'121-140','서울시','마포구','신정동\r\n');
INSERT INTO postno VALUES (506,'121-150','서울시','마포구','하중동\r\n');
INSERT INTO postno VALUES (507,'121-160','서울시','마포구','상수동\r\n');
INSERT INTO postno VALUES (508,'121-180','서울시','마포구','당인동\r\n');
INSERT INTO postno VALUES (509,'121-190','서울시','마포구','창전동\r\n');
INSERT INTO postno VALUES (510,'121-200','서울시','마포구','동교동\r\n');
INSERT INTO postno VALUES (511,'121-210','서울시','마포구','서교동\r\n');
INSERT INTO postno VALUES (512,'121-220','서울시','마포구','합정동\r\n');
INSERT INTO postno VALUES (513,'121-230','서울시','마포구','망원동\r\n');
INSERT INTO postno VALUES (514,'121-231','서울시','마포구','망원1동\r\n');
INSERT INTO postno VALUES (515,'121-232','서울시','마포구','망원2동\r\n');
INSERT INTO postno VALUES (516,'121-240','서울시','마포구','연남동\r\n');
INSERT INTO postno VALUES (517,'121-250','서울시','마포구','성산동\r\n');
INSERT INTO postno VALUES (518,'121-251','서울시','마포구','성산1동\r\n');
INSERT INTO postno VALUES (519,'121-252','서울시','마포구','성산2동\r\n');
INSERT INTO postno VALUES (520,'121-260','서울시','마포구','중동\r\n');
INSERT INTO postno VALUES (521,'121-270','서울시','마포구','상암동\r\n');
INSERT INTO postno VALUES (522,'121-600','서울시','마포구','서울마포우체국사서함\r\n');
INSERT INTO postno VALUES (523,'121-701','서울시','마포구','도화2동 거성빌딩\r\n');
INSERT INTO postno VALUES (524,'121-702','서울시','마포구','도화2동 근신빌딩\r\n');
INSERT INTO postno VALUES (525,'121-703','서울시','마포구','마포동 강변한신코아빌딩\r\n');
INSERT INTO postno VALUES (526,'121-704','서울시','마포구','도화2동 고려빌딩\r\n');
INSERT INTO postno VALUES (527,'121-705','서울시','마포구','공덕2동 국민생명빌딩\r\n');
INSERT INTO postno VALUES (528,'121-706','서울시','마포구','신수동 국민일보사\r\n');
INSERT INTO postno VALUES (529,'121-707','서울시','마포구','상수동 극동방송건물\r\n');
INSERT INTO postno VALUES (530,'121-708','서울시','마포구','마포동 대농빌딩\r\n');
INSERT INTO postno VALUES (531,'121-709','서울시','마포구','아현3동 대우전자빌딩\r\n');
INSERT INTO postno VALUES (532,'121-710','서울시','마포구','공덕2동 동방빌딩\r\n');
INSERT INTO postno VALUES (533,'121-711','서울시','마포구','성산1동 마포구청\r\n');
INSERT INTO postno VALUES (534,'121-712','서울시','마포구','신수동 마포세무서\r\n');
INSERT INTO postno VALUES (535,'121-713','서울시','마포구','서울지방법원서부지원\r\n');
INSERT INTO postno VALUES (536,'121-714','서울시','마포구','마포동 다보빌딩\r\n');
INSERT INTO postno VALUES (537,'121-715','서울시','마포구','도화2동 성우빌딩\r\n');
INSERT INTO postno VALUES (538,'121-716','서울시','마포구','도화2동 일진빌딩\r\n');
INSERT INTO postno VALUES (539,'121-717','서울시','마포구','공덕2동 태영빌딩\r\n');
INSERT INTO postno VALUES (540,'121-718','서울시','마포구','공덕2동 풍림빌딩\r\n');
INSERT INTO postno VALUES (541,'121-719','서울시','마포구','공덕2동 극동마포오피스텔\r\n');
INSERT INTO postno VALUES (542,'121-720','서울시','마포구','공덕2동 효성빌딩\r\n');
INSERT INTO postno VALUES (543,'121-721','서울시','마포구','공덕2동 LG마포빌딩\r\n');
INSERT INTO postno VALUES (544,'121-722','서울시','마포구','노고산동 미화빌딩\r\n');
INSERT INTO postno VALUES (545,'121-723','서울시','마포구','노고산동 신촌상가\r\n');
INSERT INTO postno VALUES (546,'121-724','서울시','마포구','대흥동 중앙빌딩\r\n');
INSERT INTO postno VALUES (547,'121-725','서울시','마포구','대흥동 중우빌딩\r\n');
INSERT INTO postno VALUES (548,'121-726','서울시','마포구','대흥동 한국경영자총협회\r\n');
INSERT INTO postno VALUES (549,'121-727','서울시','마포구','대흥동 한국컴퓨터\r\n');
INSERT INTO postno VALUES (550,'121-728','서울시','마포구','도화2동 도원빌딩\r\n');
INSERT INTO postno VALUES (551,'121-729','서울시','마포구','도화2동 신원빌딩\r\n');
INSERT INTO postno VALUES (552,'121-730','서울시','마포구','도화2동 유동빌딩\r\n');
INSERT INTO postno VALUES (553,'121-731','서울시','마포구','도화2동 정우빌딩\r\n');
INSERT INTO postno VALUES (554,'121-732','서울시','마포구','도화2동 진도빌딩\r\n');
INSERT INTO postno VALUES (555,'121-733','서울시','마포구','한국무선국관리사업단\r\n');
INSERT INTO postno VALUES (556,'121-734','서울시','마포구','마포동 금호전기빌딩\r\n');
INSERT INTO postno VALUES (557,'121-735','서울시','마포구','마포동 신화빌딩\r\n');
INSERT INTO postno VALUES (558,'121-736','서울시','마포구','마포동 한신빌딩\r\n');
INSERT INTO postno VALUES (559,'121-737','서울시','마포구','마포동 현대빌딩\r\n');
INSERT INTO postno VALUES (560,'121-738','서울시','마포구','당인동 한전서울화력발전소\r\n');
INSERT INTO postno VALUES (561,'121-739','서울시','마포구','서교동 삼진제약\r\n');
INSERT INTO postno VALUES (562,'121-740','서울시','마포구','서교동 서교빌딩\r\n');
INSERT INTO postno VALUES (563,'121-741','서울시','마포구','서교동 한샘빌딩\r\n');
INSERT INTO postno VALUES (564,'121-742','서울시','마포구','신수동 서강대학교\r\n');
INSERT INTO postno VALUES (565,'121-743','서울시','마포구','도화2동 성지빌딩\r\n');
INSERT INTO postno VALUES (566,'121-744','서울시','마포구','공덕2동 신용보증기금빌딩\r\n');
INSERT INTO postno VALUES (567,'121-745','서울시','마포구','도화2동 삼창빌딩\r\n');
INSERT INTO postno VALUES (568,'121-746','서울시','마포구','서교동 화승빌딩\r\n');
INSERT INTO postno VALUES (569,'121-747','서울시','마포구','성산1동 신한빌딩\r\n');
INSERT INTO postno VALUES (570,'121-748','서울시','마포구','마포구의료보험조합\r\n');
INSERT INTO postno VALUES (571,'121-749','서울시','마포구','염리동 의료보험회관건물\r\n');
INSERT INTO postno VALUES (572,'121-750','서울시','마포구','공덕1동 한겨레신문사\r\n');
INSERT INTO postno VALUES (573,'121-751','서울시','마포구','창전동 이랜드빌딩\r\n');
INSERT INTO postno VALUES (574,'121-756','서울시','마포구','공덕2동 지방행정회관건물\r\n');
INSERT INTO postno VALUES (575,'121-757','서울시','마포구','한국산업인력관리공단\r\n');
INSERT INTO postno VALUES (576,'121-758','서울시','마포구','공덕2동 제일빌딩\r\n');
INSERT INTO postno VALUES (577,'121-763','서울시','마포구','도화1동 창강빌딩\r\n');
INSERT INTO postno VALUES (578,'121-771','서울시','마포구','도화1동 도화현대아파트\r\n');
INSERT INTO postno VALUES (579,'121-772','서울시','마포구','도화1동 마포삼성아파트\r\n');
INSERT INTO postno VALUES (580,'121-774','서울시','마포구','도화2동 도화우성아파트\r\n');
INSERT INTO postno VALUES (581,'121-781','서울시','마포구','성산2동 성산시영아파트\r\n');
INSERT INTO postno VALUES (582,'121-782','서울시','마포구','성산2동 성산임대아파트\r\n');
INSERT INTO postno VALUES (583,'121-791','서울시','마포구','상수동 홍익대학교\r\n');
INSERT INTO postno VALUES (584,'122-010','서울시','은평구','응암동\r\n');
INSERT INTO postno VALUES (585,'122-011','서울시','은평구','응암1동\r\n');
INSERT INTO postno VALUES (586,'122-012','서울시','은평구','응암2동\r\n');
INSERT INTO postno VALUES (587,'122-013','서울시','은평구','응암3동\r\n');
INSERT INTO postno VALUES (588,'122-014','서울시','은평구','응암4동\r\n');
INSERT INTO postno VALUES (589,'122-020','서울시','은평구','녹번동\r\n');
INSERT INTO postno VALUES (590,'122-030','서울시','은평구','대조동\r\n');
INSERT INTO postno VALUES (591,'122-040','서울시','은평구','불광동\r\n');
INSERT INTO postno VALUES (592,'122-041','서울시','은평구','불광1동\r\n');
INSERT INTO postno VALUES (593,'122-042','서울시','은평구','불광2동\r\n');
INSERT INTO postno VALUES (594,'122-043','서울시','은평구','불광3동\r\n');
INSERT INTO postno VALUES (595,'122-050','서울시','은평구','갈현동\r\n');
INSERT INTO postno VALUES (596,'122-051','서울시','은평구','갈현1동\r\n');
INSERT INTO postno VALUES (597,'122-052','서울시','은평구','갈현2동\r\n');
INSERT INTO postno VALUES (598,'122-060','서울시','은평구','구산동\r\n');
INSERT INTO postno VALUES (599,'122-070','서울시','은평구','역촌동\r\n');
INSERT INTO postno VALUES (600,'122-071','서울시','은평구','역촌1동\r\n');
INSERT INTO postno VALUES (601,'122-072','서울시','은평구','역촌2동\r\n');
INSERT INTO postno VALUES (602,'122-080','서울시','은평구','신사동\r\n');
INSERT INTO postno VALUES (603,'122-081','서울시','은평구','신사1동\r\n');
INSERT INTO postno VALUES (604,'122-082','서울시','은평구','신사2동\r\n');
INSERT INTO postno VALUES (605,'122-090','서울시','은평구','수색동\r\n');
INSERT INTO postno VALUES (606,'122-100','서울시','은평구','증산동\r\n');
INSERT INTO postno VALUES (607,'122-110','서울시','은평구','구파발동\r\n');
INSERT INTO postno VALUES (608,'122-120','서울시','은평구','진관내동\r\n');
INSERT INTO postno VALUES (609,'122-130','서울시','은평구','진관외동\r\n');
INSERT INTO postno VALUES (610,'122-600','서울시','은평구','서울은평우체국사서함\r\n');
INSERT INTO postno VALUES (611,'122-701','서울시','은평구','녹번동 국립보건원건물\r\n');
INSERT INTO postno VALUES (612,'122-702','서울시','은평구','녹번동 은평구청\r\n');
INSERT INTO postno VALUES (613,'122-703','서울시','은평구','응암1동 서부세무서\r\n');
INSERT INTO postno VALUES (614,'122-704','서울시','은평구','녹번동 식품의약품안전본부\r\n');
INSERT INTO postno VALUES (615,'122-705','서울시','은평구','한국보건사회연구원\r\n');
INSERT INTO postno VALUES (616,'122-706','서울시','은평구','불광1동 국립환경연구원\r\n');
INSERT INTO postno VALUES (617,'122-707','서울시','은평구','불광1동 한국여성개발원\r\n');
INSERT INTO postno VALUES (618,'122-751','서울시','은평구','불광1동 불광미성아파트\r\n');
INSERT INTO postno VALUES (619,'122-761','서울시','은평구','신사2동 신사미성아파트\r\n');
INSERT INTO postno VALUES (620,'122-762','서울시','은평구','신사2동 현대1차아파트\r\n');
INSERT INTO postno VALUES (621,'122-771','서울시','은평구','응암4동 우성아파트\r\n');
INSERT INTO postno VALUES (622,'130-010','서울시','동대문구','청량리동\r\n');
INSERT INTO postno VALUES (623,'130-011','서울시','동대문구','청량리1동\r\n');
INSERT INTO postno VALUES (624,'130-012','서울시','동대문구','청량리2동\r\n');
INSERT INTO postno VALUES (625,'130-013','서울시','동대문구','청량리3동\r\n');
INSERT INTO postno VALUES (626,'130-020','서울시','동대문구','전농동\r\n');
INSERT INTO postno VALUES (627,'130-021','서울시','동대문구','전농1동\r\n');
INSERT INTO postno VALUES (628,'130-022','서울시','동대문구','전농2동\r\n');
INSERT INTO postno VALUES (629,'130-023','서울시','동대문구','전농3동\r\n');
INSERT INTO postno VALUES (630,'130-024','서울시','동대문구','전농4동\r\n');
INSERT INTO postno VALUES (631,'130-030','서울시','동대문구','답십리동\r\n');
INSERT INTO postno VALUES (632,'130-031','서울시','동대문구','답십리1동\r\n');
INSERT INTO postno VALUES (633,'130-032','서울시','동대문구','답십리2동\r\n');
INSERT INTO postno VALUES (634,'130-033','서울시','동대문구','답십리3동\r\n');
INSERT INTO postno VALUES (635,'130-034','서울시','동대문구','답십리4동\r\n');
INSERT INTO postno VALUES (636,'130-035','서울시','동대문구','답십리5동\r\n');
INSERT INTO postno VALUES (637,'130-050','서울시','동대문구','회기동\r\n');
INSERT INTO postno VALUES (638,'130-060','서울시','동대문구','제기동\r\n');
INSERT INTO postno VALUES (639,'130-061','서울시','동대문구','제기1동\r\n');
INSERT INTO postno VALUES (640,'130-062','서울시','동대문구','제기2동\r\n');
INSERT INTO postno VALUES (641,'130-070','서울시','동대문구','용두동\r\n');
INSERT INTO postno VALUES (642,'130-071','서울시','동대문구','용두1동\r\n');
INSERT INTO postno VALUES (643,'130-072','서울시','동대문구','용두2동\r\n');
INSERT INTO postno VALUES (644,'130-080','서울시','동대문구','이문동\r\n');
INSERT INTO postno VALUES (645,'130-081','서울시','동대문구','이문1동\r\n');
INSERT INTO postno VALUES (646,'130-082','서울시','동대문구','이문2동\r\n');
INSERT INTO postno VALUES (647,'130-083','서울시','동대문구','이문3동\r\n');
INSERT INTO postno VALUES (648,'130-090','서울시','동대문구','휘경동\r\n');
INSERT INTO postno VALUES (649,'130-091','서울시','동대문구','휘경1동\r\n');
INSERT INTO postno VALUES (650,'130-092','서울시','동대문구','휘경2동\r\n');
INSERT INTO postno VALUES (651,'130-100','서울시','동대문구','장안동\r\n');
INSERT INTO postno VALUES (652,'130-101','서울시','동대문구','장안1동\r\n');
INSERT INTO postno VALUES (653,'130-102','서울시','동대문구','장안2동\r\n');
INSERT INTO postno VALUES (654,'130-103','서울시','동대문구','장안3동\r\n');
INSERT INTO postno VALUES (655,'130-104','서울시','동대문구','장안4동\r\n');
INSERT INTO postno VALUES (656,'130-110','서울시','동대문구','신설동\r\n');
INSERT INTO postno VALUES (657,'130-600','서울시','동대문구','동대문우체국사서함\r\n');
INSERT INTO postno VALUES (658,'130-650','서울시','동대문구','서울청량우체국사서함\r\n');
INSERT INTO postno VALUES (659,'130-701','서울시','동대문구','회기동 경희대학교\r\n');
INSERT INTO postno VALUES (660,'130-702','서울시','동대문구','회기동 경희의료원\r\n');
INSERT INTO postno VALUES (661,'130-703','서울시','동대문구','신설동 동대문구청\r\n');
INSERT INTO postno VALUES (662,'130-704','서울시','동대문구','청량리1동 청량리세무서\r\n');
INSERT INTO postno VALUES (663,'130-705','서울시','동대문구','한국자동자부품상가\r\n');
INSERT INTO postno VALUES (664,'130-706','서울시','동대문구','신설동 미원빌딩\r\n');
INSERT INTO postno VALUES (665,'130-707','서울시','동대문구','용두2동 동부시립병원\r\n');
INSERT INTO postno VALUES (666,'130-708','서울시','동대문구','용두2동 동아제약(주)\r\n');
INSERT INTO postno VALUES (667,'130-709','서울시','동대문구','전농2동 성바오르병원\r\n');
INSERT INTO postno VALUES (668,'130-710','서울시','동대문구','회기동 한국농촌경제연구\r\n');
INSERT INTO postno VALUES (669,'130-710','서울시','동대문구','회기2동 서울위생병원\r\n');
INSERT INTO postno VALUES (670,'130-742','서울시','동대문구','청량리2동 산업연구원건\r\n');
INSERT INTO postno VALUES (671,'130-743','서울시','동대문구','전농3동  서울시립대학교\r\n');
INSERT INTO postno VALUES (672,'130-751','서울시','동대문구','답십리3동 태양아파트\r\n');
INSERT INTO postno VALUES (673,'130-755','서울시','동대문구','답십리4동 우성그린APT\r\n');
INSERT INTO postno VALUES (674,'130-757','서울시','동대문구','용두2동 신동아아파트\r\n');
INSERT INTO postno VALUES (675,'130-761','서울시','동대문구','장안3동 장안아파트1단지\r\n');
INSERT INTO postno VALUES (676,'130-762','서울시','동대문구','장안2동 장안아파트2단지\r\n');
INSERT INTO postno VALUES (677,'130-764','서울시','동대문구','장안4동 현대아파트\r\n');
INSERT INTO postno VALUES (678,'130-771','서울시','동대문구','전농3동 우성아파트\r\n');
INSERT INTO postno VALUES (679,'130-781','서울시','동대문구','청량리1동 미주아파트\r\n');
INSERT INTO postno VALUES (680,'130-791','서울시','동대문구','한국외국어대학교\r\n');
INSERT INTO postno VALUES (681,'130-792','서울시','동대문구','회기동 신현대아파트\r\n');
INSERT INTO postno VALUES (682,'131-120','서울시','중랑구','중화동\r\n');
INSERT INTO postno VALUES (683,'131-121','서울시','중랑구','중화1동\r\n');
INSERT INTO postno VALUES (684,'131-122','서울시','중랑구','중화2동\r\n');
INSERT INTO postno VALUES (685,'131-123','서울시','중랑구','중화3동\r\n');
INSERT INTO postno VALUES (686,'131-130','서울시','중랑구','신내동\r\n');
INSERT INTO postno VALUES (687,'131-131','서울시','중랑구','신내1동\r\n');
INSERT INTO postno VALUES (688,'131-132','서울시','중랑구','신내2동\r\n');
INSERT INTO postno VALUES (689,'131-140','서울시','중랑구','묵동\r\n');
INSERT INTO postno VALUES (690,'131-141','서울시','중랑구','묵1동\r\n');
INSERT INTO postno VALUES (691,'131-142','서울시','중랑구','묵2동\r\n');
INSERT INTO postno VALUES (692,'131-200','서울시','중랑구','면목동\r\n');
INSERT INTO postno VALUES (693,'131-201','서울시','중랑구','면목1동\r\n');
INSERT INTO postno VALUES (694,'131-202','서울시','중랑구','면목2동\r\n');
INSERT INTO postno VALUES (695,'131-203','서울시','중랑구','면목3동\r\n');
INSERT INTO postno VALUES (696,'131-204','서울시','중랑구','면목4동\r\n');
INSERT INTO postno VALUES (697,'131-205','서울시','중랑구','면목5동\r\n');
INSERT INTO postno VALUES (698,'131-206','서울시','중랑구','면목6동\r\n');
INSERT INTO postno VALUES (699,'131-207','서울시','중랑구','면목7동\r\n');
INSERT INTO postno VALUES (700,'131-208','서울시','중랑구','면목8동\r\n');
INSERT INTO postno VALUES (701,'131-220','서울시','중랑구','상봉동\r\n');
INSERT INTO postno VALUES (702,'131-221','서울시','중랑구','상봉1동\r\n');
INSERT INTO postno VALUES (703,'131-222','서울시','중랑구','상봉2동\r\n');
INSERT INTO postno VALUES (704,'131-230','서울시','중랑구','망우동\r\n');
INSERT INTO postno VALUES (705,'131-231','서울시','중랑구','망우1동\r\n');
INSERT INTO postno VALUES (706,'131-232','서울시','중랑구','망우2동\r\n');
INSERT INTO postno VALUES (707,'131-233','서울시','중랑구','망우3동\r\n');
INSERT INTO postno VALUES (708,'131-600','서울시','중랑구','서울중랑우체국사서함\r\n');
INSERT INTO postno VALUES (709,'131-701','서울시','중랑구','면목7동 중량구청\r\n');
INSERT INTO postno VALUES (710,'131-702','서울시','중랑구','면목8동 서일전문대학\r\n');
INSERT INTO postno VALUES (711,'131-703','서울시','중랑구','목2동 크라운제과\r\n');
INSERT INTO postno VALUES (712,'131-704','서울시','중랑구','상봉2동 서울우유\r\n');
INSERT INTO postno VALUES (713,'131-751','서울시','중랑구','면목2동 면목한신아파트\r\n');
INSERT INTO postno VALUES (714,'131-753','서울시','중랑구','면목4동 면목아파트\r\n');
INSERT INTO postno VALUES (715,'131-755','서울시','중랑구','면목7동 두산아파트\r\n');
INSERT INTO postno VALUES (716,'131-764','서울시','중랑구','묵1동 신내4 신내아파트\r\n');
INSERT INTO postno VALUES (717,'131-765','서울시','중랑구','묵1동 신내5 두산대림APT\r\n');
INSERT INTO postno VALUES (718,'131-771','서울시','중랑구','상봉1동 건영아파트\r\n');
INSERT INTO postno VALUES (719,'131-772','서울시','중랑구','중화1동 한신아파트\r\n');
INSERT INTO postno VALUES (720,'131-781','서울시','중랑구','신내1동 동성아파트\r\n');
INSERT INTO postno VALUES (721,'131-782','서울시','중랑구','신내1동 중앙아이츠아파트\r\n');
INSERT INTO postno VALUES (722,'131-783','서울시','중랑구','신내2동 성원아파트\r\n');
INSERT INTO postno VALUES (723,'131-786','서울시','중랑구','신내2동 신내6 대주아파트\r\n');
INSERT INTO postno VALUES (724,'131-787','서울시','중랑구','신내2동 신내7 진로아파트\r\n');
INSERT INTO postno VALUES (725,'131-788','서울시','중랑구','신내2동 신내8 두산화성APT\r\n');
INSERT INTO postno VALUES (726,'131-789','서울시','중랑구','신내2동 신내9 진흥아파트\r\n');
INSERT INTO postno VALUES (727,'131-790','서울시','중랑구','신내2동 신내10 건영아파트\r\n');
INSERT INTO postno VALUES (728,'131-791','서울시','중랑구','신내2동 신내11 대명아파트\r\n');
INSERT INTO postno VALUES (729,'131-792','서울시','중랑구','상봉1동 신내12 삼환아파트\r\n');
INSERT INTO postno VALUES (730,'131-793','서울시','중랑구','상봉1동 신내13 LG쌍용APT\r\n');
INSERT INTO postno VALUES (731,'132-010','서울시','도봉구','도봉동\r\n');
INSERT INTO postno VALUES (732,'132-011','서울시','도봉구','도봉1동\r\n');
INSERT INTO postno VALUES (733,'132-012','서울시','도봉구','도봉2동\r\n');
INSERT INTO postno VALUES (734,'132-020','서울시','도봉구','방학동\r\n');
INSERT INTO postno VALUES (735,'132-021','서울시','도봉구','방학1동\r\n');
INSERT INTO postno VALUES (736,'132-022','서울시','도봉구','방학2동\r\n');
INSERT INTO postno VALUES (737,'132-023','서울시','도봉구','방학3동\r\n');
INSERT INTO postno VALUES (738,'132-024','서울시','도봉구','방학4동\r\n');
INSERT INTO postno VALUES (739,'132-030','서울시','도봉구','쌍문동\r\n');
INSERT INTO postno VALUES (740,'132-031','서울시','도봉구','쌍문1동\r\n');
INSERT INTO postno VALUES (741,'132-032','서울시','도봉구','쌍문2동\r\n');
INSERT INTO postno VALUES (742,'132-033','서울시','도봉구','쌍문3동\r\n');
INSERT INTO postno VALUES (743,'132-034','서울시','도봉구','쌍문4동\r\n');
INSERT INTO postno VALUES (744,'132-040','서울시','도봉구','창동\r\n');
INSERT INTO postno VALUES (745,'132-041','서울시','도봉구','창1동\r\n');
INSERT INTO postno VALUES (746,'132-042','서울시','도봉구','창2동\r\n');
INSERT INTO postno VALUES (747,'132-043','서울시','도봉구','창3동\r\n');
INSERT INTO postno VALUES (748,'132-044','서울시','도봉구','창4동\r\n');
INSERT INTO postno VALUES (749,'132-045','서울시','도봉구','창5동\r\n');
INSERT INTO postno VALUES (750,'132-600','서울시','도봉구','서울도봉우체국사서함\r\n');
INSERT INTO postno VALUES (751,'132-701','서울시','도봉구','창5동 도봉구청\r\n');
INSERT INTO postno VALUES (752,'132-702','서울시','도봉구','방학1동 (주)미원\r\n');
INSERT INTO postno VALUES (753,'132-703','서울시','도봉구','쌍문3동 한일병원\r\n');
INSERT INTO postno VALUES (754,'132-704','서울시','도봉구','창4동 노윈세무서\r\n');
INSERT INTO postno VALUES (755,'132-705','서울시','도봉구','창4동 도봉경찰서\r\n');
INSERT INTO postno VALUES (756,'132-706','서울시','도봉구','창4동 도봉등기소\r\n');
INSERT INTO postno VALUES (757,'132-707','서울시','도봉구','창4동 북부지방노동사\r\n');
INSERT INTO postno VALUES (758,'132-708','서울시','도봉구','쌍문1동 도봉의료보험\r\n');
INSERT INTO postno VALUES (759,'132-709','서울시','도봉구','도봉2동 (주)인켈\r\n');
INSERT INTO postno VALUES (760,'132-710','서울시','도봉구','창4동 배상빌딩\r\n');
INSERT INTO postno VALUES (761,'132-711','서울시','도봉구','창4동 제일빌딩\r\n');
INSERT INTO postno VALUES (762,'132-714','서울시','도봉구','쌍문1동 덕성여자대학교\r\n');
INSERT INTO postno VALUES (763,'132-751','서울시','도봉구','도봉1동 가든아파트\r\n');
INSERT INTO postno VALUES (764,'132-752','서울시','도봉구','도봉1동 럭키아파트\r\n');
INSERT INTO postno VALUES (765,'132-755','서울시','도봉구','도봉2동 삼익아파트\r\n');
INSERT INTO postno VALUES (766,'132-756','서울시','도봉구','도봉2동 삼환아파트\r\n');
INSERT INTO postno VALUES (767,'132-757','서울시','도봉구','도봉2동 한신아파트\r\n');
INSERT INTO postno VALUES (768,'132-761','서울시','도봉구','방학3동 벽산아파트\r\n');
INSERT INTO postno VALUES (769,'132-762','서울시','도봉구','방학3동 신동아아파트1단지\r\n');
INSERT INTO postno VALUES (770,'132-765','서울시','도봉구','방학4동 신동아2차아파트\r\n');
INSERT INTO postno VALUES (771,'132-765','서울시','도봉구','방학4동 신동아3차아파트\r\n');
INSERT INTO postno VALUES (772,'132-766','서울시','도봉구','방학4동 우성1차아파트\r\n');
INSERT INTO postno VALUES (773,'132-766','서울시','도봉구','방학4동 우성2차아파트\r\n');
INSERT INTO postno VALUES (774,'132-767','서울시','도봉구','방학4동 청구아파트\r\n');
INSERT INTO postno VALUES (775,'132-771','서울시','도봉구','쌍문1동 동익아파트\r\n');
INSERT INTO postno VALUES (776,'132-772','서울시','도봉구','쌍문1동 현대3차아파트\r\n');
INSERT INTO postno VALUES (777,'132-773','서울시','도봉구','쌍문2동 삼익아파트\r\n');
INSERT INTO postno VALUES (778,'132-774','서울시','도봉구','쌍문2동 청구아파트\r\n');
INSERT INTO postno VALUES (779,'132-776','서울시','도봉구','쌍문4동 금호아파트\r\n');
INSERT INTO postno VALUES (780,'132-777','서울시','도봉구','쌍문4동 한양1차아파트\r\n');
INSERT INTO postno VALUES (781,'132-777','서울시','도봉구','쌍문4동 한양2차아파트\r\n');
INSERT INTO postno VALUES (782,'132-777','서울시','도봉구','쌍문4동 한양3차아파트\r\n');
INSERT INTO postno VALUES (783,'132-777','서울시','도봉구','쌍문4동 한양4차아파트\r\n');
INSERT INTO postno VALUES (784,'132-778','서울시','도봉구','쌍문4동 한양5차아파트\r\n');
INSERT INTO postno VALUES (785,'132-778','서울시','도봉구','쌍문4동 한양7차아파트\r\n');
INSERT INTO postno VALUES (786,'132-779','서울시','도봉구','쌍문4동 현대1차아파트\r\n');
INSERT INTO postno VALUES (787,'132-779','서울시','도봉구','쌍문4동 현대2차아파트\r\n');
INSERT INTO postno VALUES (788,'132-781','서울시','도봉구','창1동 주공아파트3단지\r\n');
INSERT INTO postno VALUES (789,'132-782','서울시','도봉구','창1동 삼성아파트\r\n');
INSERT INTO postno VALUES (790,'132-784','서울시','도봉구','창2동 대우아파트\r\n');
INSERT INTO postno VALUES (791,'132-786','서울시','도봉구','창4동 주공아파트4단지\r\n');
INSERT INTO postno VALUES (792,'132-787','서울시','도봉구','창4동 주공아파트17단지\r\n');
INSERT INTO postno VALUES (793,'132-788','서울시','도봉구','창4동 주공아파트18단지\r\n');
INSERT INTO postno VALUES (794,'132-789','서울시','도봉구','창4동 주공아파트19단지\r\n');
INSERT INTO postno VALUES (795,'132-790','서울시','도봉구','창4동 동아아파트\r\n');
INSERT INTO postno VALUES (796,'133-010','서울시','성동구','상왕십리동\r\n');
INSERT INTO postno VALUES (797,'133-020','서울시','성동구','하왕십리동\r\n');
INSERT INTO postno VALUES (798,'133-021','서울시','성동구','하왕십리1동\r\n');
INSERT INTO postno VALUES (799,'133-022','서울시','성동구','하왕십리2동\r\n');
INSERT INTO postno VALUES (800,'133-030','서울시','성동구','홍익동\r\n');
INSERT INTO postno VALUES (801,'133-040','서울시','성동구','도선동\r\n');
INSERT INTO postno VALUES (802,'133-050','서울시','성동구','마장동\r\n');
INSERT INTO postno VALUES (803,'133-060','서울시','성동구','사근동\r\n');
INSERT INTO postno VALUES (804,'133-070','서울시','성동구','행당동\r\n');
INSERT INTO postno VALUES (805,'133-071','서울시','성동구','행당1동\r\n');
INSERT INTO postno VALUES (806,'133-072','서울시','성동구','행당2동\r\n');
INSERT INTO postno VALUES (807,'133-080','서울시','성동구','응봉동\r\n');
INSERT INTO postno VALUES (808,'133-091','서울시','성동구','금호동1가\r\n');
INSERT INTO postno VALUES (809,'133-092','서울시','성동구','금호동2가\r\n');
INSERT INTO postno VALUES (810,'133-093','서울시','성동구','금호동3가\r\n');
INSERT INTO postno VALUES (811,'133-094','서울시','성동구','금호동4가\r\n');
INSERT INTO postno VALUES (812,'133-100','서울시','성동구','옥수동\r\n');
INSERT INTO postno VALUES (813,'133-101','서울시','성동구','옥수1동\r\n');
INSERT INTO postno VALUES (814,'133-102','서울시','성동구','옥수2동\r\n');
INSERT INTO postno VALUES (815,'133-110','서울시','성동구','성수1가동\r\n');
INSERT INTO postno VALUES (816,'133-111','서울시','성동구','성수1가1동\r\n');
INSERT INTO postno VALUES (817,'133-112','서울시','성동구','성수1가2동\r\n');
INSERT INTO postno VALUES (818,'133-121','서울시','성동구','성수2가1동\r\n');
INSERT INTO postno VALUES (819,'133-123','서울시','성동구','성수2가3동\r\n');
INSERT INTO postno VALUES (820,'133-160','서울시','성동구','송정동\r\n');
INSERT INTO postno VALUES (821,'133-170','서울시','성동구','용답동\r\n');
INSERT INTO postno VALUES (822,'133-600','서울시','성동구','서울성동우체국사서함\r\n');
INSERT INTO postno VALUES (823,'133-701','서울시','성동구','마장동 성동구청\r\n');
INSERT INTO postno VALUES (824,'133-702','서울시','성동구','행당1동 성동경찰서\r\n');
INSERT INTO postno VALUES (825,'133-703','서울시','성동구','송정동 성동세무서\r\n');
INSERT INTO postno VALUES (826,'133-704','서울시','성동구','송정동 광진세무서\r\n');
INSERT INTO postno VALUES (827,'133-705','서울시','성동구','성수2가3동 (주)신도리코\r\n');
INSERT INTO postno VALUES (828,'133-706','서울시','성동구','성수2가3동 아남산업\r\n');
INSERT INTO postno VALUES (829,'133-707','서울시','성동구','용답동 한국자동차매매센타\r\n');
INSERT INTO postno VALUES (830,'133-751','서울시','성동구','금호동3가 두산아파트\r\n');
INSERT INTO postno VALUES (831,'133-752','서울시','성동구','마장동 세림아파트\r\n');
INSERT INTO postno VALUES (832,'133-761','서울시','성동구','성수1가1동 구장미아파트\r\n');
INSERT INTO postno VALUES (833,'133-762','서울시','성동구','성수1가1동 동아아파트\r\n');
INSERT INTO postno VALUES (834,'133-763','서울시','성동구','성수1가1동 신장미아파트\r\n');
INSERT INTO postno VALUES (835,'133-764','서울시','성동구','성수1가1동 한진아파트\r\n');
INSERT INTO postno VALUES (836,'133-766','서울시','성동구','옥수2동 극동아파트\r\n');
INSERT INTO postno VALUES (837,'133-767','서울시','성동구','옥수2동 현대아파트\r\n');
INSERT INTO postno VALUES (838,'133-768','서울시','성동구','옥수2동 한남하이츠아파트\r\n');
INSERT INTO postno VALUES (839,'133-771','서울시','성동구','응봉동 대림아파트\r\n');
INSERT INTO postno VALUES (840,'133-772','서울시','성동구','응봉동 신동아아파트\r\n');
INSERT INTO postno VALUES (841,'133-791','서울시','성동구','행당1동 한양대학교\r\n');
INSERT INTO postno VALUES (842,'133-792','서울시','성동구','행당1동 한대부속병원\r\n');
INSERT INTO postno VALUES (843,'133-793','서울시','성동구','행당1동 한양여자전문대학\r\n');
INSERT INTO postno VALUES (844,'134-010','서울시','강동구','길동\r\n');
INSERT INTO postno VALUES (845,'134-011','서울시','강동구','길동1동\r\n');
INSERT INTO postno VALUES (846,'134-012','서울시','강동구','길동2동\r\n');
INSERT INTO postno VALUES (847,'134-020','서울시','강동구','천호동\r\n');
INSERT INTO postno VALUES (848,'134-021','서울시','강동구','천호1동\r\n');
INSERT INTO postno VALUES (849,'134-022','서울시','강동구','천호2동\r\n');
INSERT INTO postno VALUES (850,'134-023','서울시','강동구','천호3동\r\n');
INSERT INTO postno VALUES (851,'134-024','서울시','강동구','천호4동\r\n');
INSERT INTO postno VALUES (852,'134-030','서울시','강동구','성내동\r\n');
INSERT INTO postno VALUES (853,'134-031','서울시','강동구','성내1동\r\n');
INSERT INTO postno VALUES (854,'134-032','서울시','강동구','성내2동\r\n');
INSERT INTO postno VALUES (855,'134-033','서울시','강동구','성내3동\r\n');
INSERT INTO postno VALUES (856,'134-050','서울시','강동구','암사동\r\n');
INSERT INTO postno VALUES (857,'134-051','서울시','강동구','암사1동\r\n');
INSERT INTO postno VALUES (858,'134-052','서울시','강동구','암사2동\r\n');
INSERT INTO postno VALUES (859,'134-053','서울시','강동구','암사3동\r\n');
INSERT INTO postno VALUES (860,'134-054','서울시','강동구','암사4동\r\n');
INSERT INTO postno VALUES (861,'134-060','서울시','강동구','둔촌동\r\n');
INSERT INTO postno VALUES (862,'134-061','서울시','강동구','둔촌1동\r\n');
INSERT INTO postno VALUES (863,'134-062','서울시','강동구','둔촌2동\r\n');
INSERT INTO postno VALUES (864,'134-070','서울시','강동구','명일동\r\n');
INSERT INTO postno VALUES (865,'134-071','서울시','강동구','명일1동\r\n');
INSERT INTO postno VALUES (866,'134-072','서울시','강동구','명일2동\r\n');
INSERT INTO postno VALUES (867,'134-080','서울시','강동구','고덕동\r\n');
INSERT INTO postno VALUES (868,'134-081','서울시','강남구','고덕1동\r\n');
INSERT INTO postno VALUES (869,'134-082','서울시','강동구','고덕2동\r\n');
INSERT INTO postno VALUES (870,'134-090','서울시','강동구','상일동\r\n');
INSERT INTO postno VALUES (871,'134-100','서울시','강동구','하일동\r\n');
INSERT INTO postno VALUES (872,'134-600','서울시','강동구','서울강동우체국사서함\r\n');
INSERT INTO postno VALUES (873,'134-700','서울시','강동구','성내1동 강동구청\r\n');
INSERT INTO postno VALUES (874,'134-701','서울시','강동구','길1동 강동성심병원\r\n');
INSERT INTO postno VALUES (875,'134-751','서울시','강동구','고덕1동 시영아파트\r\n');
INSERT INTO postno VALUES (876,'134-752','서울시','강동구','고덕1동 아남아파트\r\n');
INSERT INTO postno VALUES (877,'134-753','서울시','강동구','고덕1동 주공아파트1단지\r\n');
INSERT INTO postno VALUES (878,'134-754','서울시','강동구','고덕1동 주공아파트8단지\r\n');
INSERT INTO postno VALUES (879,'134-755','서울시','강동구','고덕1동 현대아파트\r\n');
INSERT INTO postno VALUES (880,'134-757','서울시','강동구','고덕2동 주공아파트1단지\r\n');
INSERT INTO postno VALUES (881,'134-761','서울시','강동구','길1동 우성아파트\r\n');
INSERT INTO postno VALUES (882,'134-763','서울시','강동구','성내1동 축협빌딩\r\n');
INSERT INTO postno VALUES (883,'134-764','서울시','강동구','암사3동 동서울아파트\r\n');
INSERT INTO postno VALUES (884,'134-765','서울시','강동구','길2동 삼익파크아파트\r\n');
INSERT INTO postno VALUES (885,'134-766','서울시','강동구','길2동 신동아아파트\r\n');
INSERT INTO postno VALUES (886,'134-767','서울시','강동구','길2동 진흥아파트\r\n');
INSERT INTO postno VALUES (887,'134-768','서울시','강동구','길2동 프라자아파트\r\n');
INSERT INTO postno VALUES (888,'134-771','서울시','강동구','둔촌1동 주공아파트1단지\r\n');
INSERT INTO postno VALUES (889,'134-772','서울시','강동구','둔촌1동 주공아파트2단지\r\n');
INSERT INTO postno VALUES (890,'134-773','서울시','강동구','둔촌1동 주공아파트3단지\r\n');
INSERT INTO postno VALUES (891,'134-774','서울시','강동구','둔촌1동 주공아파트4단지\r\n');
INSERT INTO postno VALUES (892,'134-777','서울시','강동구','둔촌2동 현대1차아파트\r\n');
INSERT INTO postno VALUES (893,'134-777','서울시','강동구','둔촌2동 현대2차아파트\r\n');
INSERT INTO postno VALUES (894,'134-777','서울시','강동구','둔촌2동 현대3차아파트\r\n');
INSERT INTO postno VALUES (895,'134-777','서울시','강동구','둔촌2동 현대4차아파트\r\n');
INSERT INTO postno VALUES (896,'134-781','서울시','강동구','명일1동 삼익그린1차아파트\r\n');
INSERT INTO postno VALUES (897,'134-782','서울시','강동구','명일1동 삼익그린2차아파트\r\n');
INSERT INTO postno VALUES (898,'134-786','서울시','강동구','명일2동 신동아아파트\r\n');
INSERT INTO postno VALUES (899,'134-787','서울시','강동구','명일2동 우성아파트\r\n');
INSERT INTO postno VALUES (900,'134-788','서울시','강동구','명일2동 주공아파트9단지\r\n');
INSERT INTO postno VALUES (901,'134-789','서울시','강동구','명일2동 한양아파트\r\n');
INSERT INTO postno VALUES (902,'134-790','서울시','강동구','명일2동 현대아파트\r\n');
INSERT INTO postno VALUES (903,'134-792','서울시','강동구','상일동 중앙하이츠아파트\r\n');
INSERT INTO postno VALUES (904,'134-793','서울시','강동구','상일동 주공아파트3단지\r\n');
INSERT INTO postno VALUES (905,'134-794','서울시','강동구','상일동 주공아파트4단지\r\n');
INSERT INTO postno VALUES (906,'134-795','서울시','강동구','상일동 주공아파트5단지\r\n');
INSERT INTO postno VALUES (907,'134-796','서울시','강동구','상일동 주공아파트6단지\r\n');
INSERT INTO postno VALUES (908,'134-797','서울시','강동구','상일동 주공아파트7단지\r\n');
INSERT INTO postno VALUES (909,'134-798','서울시','강동구','암사3동 강동시영1차아파트\r\n');
INSERT INTO postno VALUES (910,'134-799','서울시','강동구','암사4동 강동시영2차아파트\r\n');
INSERT INTO postno VALUES (911,'134-791','서울시','강동구','둔촌2동 한국보훈병원\r\n');
INSERT INTO postno VALUES (912,'135-010','서울시','강남구','논현동\r\n');
INSERT INTO postno VALUES (913,'135-011','서울시','강남구','논현1동\r\n');
INSERT INTO postno VALUES (914,'135-012','서울시','강남구','논현2동\r\n');
INSERT INTO postno VALUES (915,'135-080','서울시','강남구','역삼동\r\n');
INSERT INTO postno VALUES (916,'135-081','서울시','강남구','역삼1동\r\n');
INSERT INTO postno VALUES (917,'135-082','서울시','강남구','역삼2동\r\n');
INSERT INTO postno VALUES (918,'135-090','서울시','강남구','삼성동\r\n');
INSERT INTO postno VALUES (919,'135-091','서울시','강남구','삼성1동\r\n');
INSERT INTO postno VALUES (920,'135-092','서울시','강남구','삼성2동\r\n');
INSERT INTO postno VALUES (921,'135-100','서울시','강남구','청담동\r\n');
INSERT INTO postno VALUES (922,'135-101','서울시','강남구','청담1동\r\n');
INSERT INTO postno VALUES (923,'135-102','서울시','강남구','청담2동\r\n');
INSERT INTO postno VALUES (924,'135-110','서울시','강남구','압구정동\r\n');
INSERT INTO postno VALUES (925,'135-111','서울시','강남구','압구정1동\r\n');
INSERT INTO postno VALUES (926,'135-112','서울시','강남구','압구정2동\r\n');
INSERT INTO postno VALUES (927,'135-120','서울시','강남구','신사동\r\n');
INSERT INTO postno VALUES (928,'135-190','서울시','강남구','세곡동\r\n');
INSERT INTO postno VALUES (929,'135-200','서울시','강남구','자곡동\r\n');
INSERT INTO postno VALUES (930,'135-210','서울시','강남구','율현동\r\n');
INSERT INTO postno VALUES (931,'135-220','서울시','강남구','수서동\r\n');
INSERT INTO postno VALUES (932,'135-230','서울시','강남구','일원동\r\n');
INSERT INTO postno VALUES (933,'135-231','서울시','강남구','일원1동\r\n');
INSERT INTO postno VALUES (934,'135-232','서울시','강남구','일원2동\r\n');
INSERT INTO postno VALUES (935,'135-239','서울시','강남구','일원본동\r\n');
INSERT INTO postno VALUES (936,'135-240','서울시','강남구','개포동\r\n');
INSERT INTO postno VALUES (937,'135-241','서울시','강남구','개포1동\r\n');
INSERT INTO postno VALUES (938,'135-242','서울시','강남구','개포2동\r\n');
INSERT INTO postno VALUES (939,'135-243','서울시','강남구','개포3동\r\n');
INSERT INTO postno VALUES (940,'135-244','서울시','강남구','개포4동\r\n');
INSERT INTO postno VALUES (941,'135-260','서울시','강남구','포이동\r\n');
INSERT INTO postno VALUES (942,'135-270','서울시','강남구','도곡동\r\n');
INSERT INTO postno VALUES (943,'135-271','서울시','강남구','도곡1동\r\n');
INSERT INTO postno VALUES (944,'135-272','서울시','강남구','도곡2동\r\n');
INSERT INTO postno VALUES (945,'135-280','서울시','강남구','대치동\r\n');
INSERT INTO postno VALUES (946,'135-281','서울시','강남구','대치1동\r\n');
INSERT INTO postno VALUES (947,'135-282','서울시','강남구','대치2동\r\n');
INSERT INTO postno VALUES (948,'135-283','서울시','강남구','대치3동\r\n');
INSERT INTO postno VALUES (949,'135-284','서울시','강남구','대치4동\r\n');
INSERT INTO postno VALUES (950,'135-600','서울시','강남구','서울강남우체국사서함0001-\r\n');
INSERT INTO postno VALUES (951,'135-601','서울시','강남구','서울강남우체국사서함0100-\r\n');
INSERT INTO postno VALUES (952,'135-602','서울시','강남구','서울강남우체국사서함0200-\r\n');
INSERT INTO postno VALUES (953,'135-603','서울시','강남구','서울강남우체국사서함0300-\r\n');
INSERT INTO postno VALUES (954,'135-604','서울시','강남구','서울강남우체국사서함0400-\r\n');
INSERT INTO postno VALUES (955,'135-605','서울시','강남구','서울강남우체국사서함0500-\r\n');
INSERT INTO postno VALUES (956,'135-606','서울시','강남구','서울강남우체국사서함0600-\r\n');
INSERT INTO postno VALUES (957,'135-607','서울시','강남구','서울강남우체국사서함0700-\r\n');
INSERT INTO postno VALUES (958,'135-608','서울시','강남구','서울강남우체국사서함0800-\r\n');
INSERT INTO postno VALUES (959,'135-609','서울시','강남구','서울강남우체국사서함0900-\r\n');
INSERT INTO postno VALUES (960,'135-610','서울시','강남구','서울강남우체국사서함1000-\r\n');
INSERT INTO postno VALUES (961,'135-611','서울시','강남구','서울강남우체국사서함1100-\r\n');
INSERT INTO postno VALUES (962,'135-612','서울시','강남구','서울강남우체국사서함1200-\r\n');
INSERT INTO postno VALUES (963,'135-613','서울시','강남구','서울강남우체국사서함1300-\r\n');
INSERT INTO postno VALUES (964,'135-614','서울시','강남구','서울강남우체국사서함1400-\r\n');
INSERT INTO postno VALUES (965,'135-615','서울시','강남구','서울강남우체국사서함1500-\r\n');
INSERT INTO postno VALUES (966,'135-616','서울시','강남구','서울강남우체국사서함1600-\r\n');
INSERT INTO postno VALUES (967,'135-617','서울시','강남구','서울강남우체국사서함1700-\r\n');
INSERT INTO postno VALUES (968,'135-618','서울시','강남구','서울강남우체국사서함1800-\r\n');
INSERT INTO postno VALUES (969,'135-619','서울시','강남구','서울강남우체국사서함1900-\r\n');
INSERT INTO postno VALUES (970,'135-620','서울시','강남구','서울강남우체국사서함2000-\r\n');
INSERT INTO postno VALUES (971,'135-621','서울시','강남구','서울강남우체국사서함2100-\r\n');
INSERT INTO postno VALUES (972,'135-622','서울시','강남구','서울강남우체국사서함2200-\r\n');
INSERT INTO postno VALUES (973,'135-623','서울시','강남구','서울강남우체국사서함2300-\r\n');
INSERT INTO postno VALUES (974,'135-650','서울시','강남구','무역쎈타(우)사서함 0001-\r\n');
INSERT INTO postno VALUES (975,'135-651','서울시','강남구','무역쎈타(우)사서함 0100-\r\n');
INSERT INTO postno VALUES (976,'135-701','서울시','강남구','논현2동 건설회관\r\n');
INSERT INTO postno VALUES (977,'135-702','서울시','강남구','논현2동 관세청\r\n');
INSERT INTO postno VALUES (978,'135-703','서울시','강남구','역삼1동 과학기술회관\r\n');
INSERT INTO postno VALUES (979,'135-704','서울시','강남구','대치4동 그랜드백화점건물\r\n');
INSERT INTO postno VALUES (980,'135-705','서울시','강남구','삼성2동 강남구청\r\n');
INSERT INTO postno VALUES (981,'135-706','서울시','강남구','역삼1동 공무원연금관리공\r\n');
INSERT INTO postno VALUES (982,'135-707','서울시','강남구','역삼1동 남영빌딩\r\n');
INSERT INTO postno VALUES (983,'135-708','서울시','강남구','대치3동 글라스타워빌딩\r\n');
INSERT INTO postno VALUES (984,'135-709','서울시','강남구','역삼1동 빅토리아빌딩\r\n');
INSERT INTO postno VALUES (985,'135-710','서울시','강남구','일원동 삼성의료원\r\n');
INSERT INTO postno VALUES (986,'135-711','서울시','강남구','역삼1동 삼흥빌딩\r\n');
INSERT INTO postno VALUES (987,'135-712','서울시','강남구','대치4동 상제리제빌딩\r\n');
INSERT INTO postno VALUES (988,'135-713','서울시','강남구','대치3동 섬유센타빌딩\r\n');
INSERT INTO postno VALUES (989,'135-714','서울시','강남구','논현2동 두산빌딩\r\n');
INSERT INTO postno VALUES (990,'135-715','서울시','강남구','삼성1동 대웅제약빌딩\r\n');
INSERT INTO postno VALUES (991,'135-716','서울시','강남구','삼성1동 성원빌딩\r\n');
INSERT INTO postno VALUES (992,'135-717','서울시','강남구','역삼1동 성지하이츠빌딩\r\n');
INSERT INTO postno VALUES (993,'135-718','서울시','강남구','역삼1동 아가방빌딩\r\n');
INSERT INTO postno VALUES (994,'135-719','서울시','강남구','역삼2동 아세아타워빌딩\r\n');
INSERT INTO postno VALUES (995,'135-720','서울시','강남구','도곡1동 영동세브란스병원\r\n');
INSERT INTO postno VALUES (996,'135-721','서울시','강남구','삼성1동 원방프라자빌딩\r\n');
INSERT INTO postno VALUES (997,'135-722','서울시','강남구','신사동 제승빌딩\r\n');
INSERT INTO postno VALUES (998,'135-723','서울시','강남구','역삼1동 한타빌딩(통계청)\r\n');
INSERT INTO postno VALUES (999,'135-724','서울시','강남구','압구정1동 현대백화점본점\r\n');
INSERT INTO postno VALUES (1000,'135-725','서울시','강남구','대치3동 혜성빌딩\r\n');
INSERT INTO postno VALUES (1001,'135-726','서울시','강남구','논현1동 거평타운\r\n');
INSERT INTO postno VALUES (1002,'135-727','서울시','강남구','논현2동 대한주택공사\r\n');
INSERT INTO postno VALUES (1003,'135-728','서울시','강남구','무역센타공항터미널\r\n');
INSERT INTO postno VALUES (1004,'135-729','서울시','강남구','삼성1동 무역센타무역회관\r\n');
INSERT INTO postno VALUES (1005,'135-730','서울시','강남구','삼성1동 무역센타백화점\r\n');
INSERT INTO postno VALUES (1006,'135-731','서울시','강남구','삼성1동 무역센타전시장\r\n');
INSERT INTO postno VALUES (1007,'135-732','서울시','강남구','삼성1동 인터콘티넨탈호텔\r\n');
INSERT INTO postno VALUES (1008,'135-733','서울시','강남구','논현2동 성암빌딩\r\n');
INSERT INTO postno VALUES (1009,'135-734','서울시','강남구','논현2동 송암빌딩\r\n');
INSERT INTO postno VALUES (1010,'135-735','서울시','강남구','대치3동 삼척단좌빌딩\r\n');
INSERT INTO postno VALUES (1011,'135-736','서울시','강남구','대치3동 일동빌딩\r\n');
INSERT INTO postno VALUES (1012,'135-737','서울시','강남구','대치3동 삼성중공업빌딩\r\n');
INSERT INTO postno VALUES (1013,'135-738','서울시','강남구','대치3동 엘지영동빌딩\r\n');
INSERT INTO postno VALUES (1014,'135-739','서울시','강남구','도곡1동 금화빌딩\r\n');
INSERT INTO postno VALUES (1015,'135-740','서울시','강남구','삼성1동 강남병원\r\n');
INSERT INTO postno VALUES (1016,'135-741','서울시','강남구','삼성1동 덕명빌딩\r\n');
INSERT INTO postno VALUES (1017,'135-742','서울시','강남구','논현2동 서진빌딩\r\n');
INSERT INTO postno VALUES (1018,'135-743','서울시','강남구','삼성1동 한국중공업빌딩\r\n');
INSERT INTO postno VALUES (1019,'135-744','서울시','강남구','삼성1동 한국토지개발\r\n');
INSERT INTO postno VALUES (1020,'135-745','서울시','강남구','삼성2동 삼화빌딩\r\n');
INSERT INTO postno VALUES (1021,'135-746','서울시','강남구','신사동 두원빌딩\r\n');
INSERT INTO postno VALUES (1022,'135-747','서울시','강남구','신사동 성도빌딩\r\n');
INSERT INTO postno VALUES (1023,'135-748','서울시','강남구','역삼1동 대흥빌딩\r\n');
INSERT INTO postno VALUES (1024,'135-749','서울시','강남구','논현1동 영풍빌딩\r\n');
INSERT INTO postno VALUES (1025,'135-750','서울시','강남구','역삼1동 우덕빌딩\r\n');
INSERT INTO postno VALUES (1026,'135-751','서울시','강남구','역삼1동 삼성제일빌딩\r\n');
INSERT INTO postno VALUES (1027,'135-752','서울시','강남구','역삼1동 성업공사빌딩\r\n');
INSERT INTO postno VALUES (1028,'135-753','서울시','강남구','역삼1동 역삼빌딩\r\n');
INSERT INTO postno VALUES (1029,'135-754','서울시','강남구','역삼1동 유니온센타오피스\r\n');
INSERT INTO postno VALUES (1030,'135-755','서울시','강남구','역삼1동 한독약품빌딩\r\n');
INSERT INTO postno VALUES (1031,'135-756','서울시','강남구','역삼2동 계몽사\r\n');
INSERT INTO postno VALUES (1032,'135-757','서울시','강남구','삼성1동 종합무역센터빌딩\r\n');
INSERT INTO postno VALUES (1033,'135-759','서울시','강남구','역삼2동 나래이동통신\r\n');
INSERT INTO postno VALUES (1034,'135-760','서울시','강남구','역삼2동 동우빌딩\r\n');
INSERT INTO postno VALUES (1035,'135-761','서울시','강남구','청담1동 대주빌딩\r\n');
INSERT INTO postno VALUES (1036,'135-762','서울시','강남구','청담1동 모나미빌딩\r\n');
INSERT INTO postno VALUES (1037,'135-763','서울시','강남구','청담1동 은성빌딩\r\n');
INSERT INTO postno VALUES (1038,'135-764','서울시','강남구','청담1동 청담빌딩\r\n');
INSERT INTO postno VALUES (1039,'135-765','서울시','강남구','청담1동 청암빌딩\r\n');
INSERT INTO postno VALUES (1040,'135-766','서울시','강남구','청담2동 금하빌딩\r\n');
INSERT INTO postno VALUES (1041,'135-767','서울시','강남구','청담2동 트래드클럽빌딩\r\n');
INSERT INTO postno VALUES (1042,'135-770','서울시','강남구','개포1동 주공아파트1단지\r\n');
INSERT INTO postno VALUES (1043,'135-771','서울시','강남구','개포1동 주공아파트2단지\r\n');
INSERT INTO postno VALUES (1044,'135-772','서울시','강남구','개포1동 주공아파트4단지\r\n');
INSERT INTO postno VALUES (1045,'135-773','서울시','강남구','개포1동 개포시영아파트\r\n');
INSERT INTO postno VALUES (1046,'135-774','서울시','강남구','대치1동 청실아파트\r\n');
INSERT INTO postno VALUES (1047,'135-775','서울시','강남구','대치2동 미도아파트\r\n');
INSERT INTO postno VALUES (1048,'135-776','서울시','강남구','대치2동 쌍용아파트\r\n');
INSERT INTO postno VALUES (1049,'135-777','서울시','강남구','대치4동 포스코센타\r\n');
INSERT INTO postno VALUES (1050,'135-778','서울시','강남구','대치2동 은마아파트\r\n');
INSERT INTO postno VALUES (1051,'135-779','서울시','강남구','도곡1동 도곡아파트\r\n');
INSERT INTO postno VALUES (1052,'135-781','서울시','강남구','수서동 도시개발APT-6단지\r\n');
INSERT INTO postno VALUES (1053,'135-782','서울시','강남구','수서동 도시개발APT-7단지\r\n');
INSERT INTO postno VALUES (1054,'135-783','서울시','강남구','수서동 주공아파트1단지\r\n');
INSERT INTO postno VALUES (1055,'135-784','서울시','강남구','역삼1동 풍림빌딩\r\n');
INSERT INTO postno VALUES (1056,'135-785','서울시','강남구','신사동 신사미성1차아파트\r\n');
INSERT INTO postno VALUES (1057,'135-785','서울시','강남구','신사동 신사미성2차아파트\r\n');
INSERT INTO postno VALUES (1058,'135-786','서울시','강남구','신사동 신현대아파트\r\n');
INSERT INTO postno VALUES (1059,'135-787','서울시','강남구','압구정1동 구현대아파트\r\n');
INSERT INTO postno VALUES (1060,'135-788','서울시','강남구','압구정1동 구현대아파트\r\n');
INSERT INTO postno VALUES (1061,'135-789','서울시','강남구','압구정1동 신사현대아파트\r\n');
INSERT INTO postno VALUES (1062,'135-791','서울시','강남구','삼성1동 한국전력건물\r\n');
INSERT INTO postno VALUES (1063,'135-792','서울시','강남구','역삼1동 혜천빌딩\r\n');
INSERT INTO postno VALUES (1064,'135-793','서울시','강남구','삼성1동 한국감정원\r\n');
INSERT INTO postno VALUES (1065,'135-794','서울시','강남구','압구정2동 한양아파트\r\n');
INSERT INTO postno VALUES (1066,'135-795','서울시','강남구','역삼2동 개나리아파트\r\n');
INSERT INTO postno VALUES (1067,'135-796','서울시','강남구','역삼2동 영동아파트\r\n');
INSERT INTO postno VALUES (1068,'136-011','서울시','성북구','성북1동\r\n');
INSERT INTO postno VALUES (1069,'136-012','서울시','성북구','성북2동\r\n');
INSERT INTO postno VALUES (1070,'136-020','서울시','성북구','성북동\r\n');
INSERT INTO postno VALUES (1071,'136-031','서울시','성북구','동소문동1가\r\n');
INSERT INTO postno VALUES (1072,'136-032','서울시','성북구','동소문동2가\r\n');
INSERT INTO postno VALUES (1073,'136-033','서울시','성북구','동소문동3가\r\n');
INSERT INTO postno VALUES (1074,'136-034','서울시','성북구','동소문동4가\r\n');
INSERT INTO postno VALUES (1075,'136-035','서울시','성북구','동소문동5가\r\n');
INSERT INTO postno VALUES (1076,'136-036','서울시','성북구','동소문동6가\r\n');
INSERT INTO postno VALUES (1077,'136-037','서울시','성북구','동소문동7가\r\n');
INSERT INTO postno VALUES (1078,'136-041','서울시','성북구','삼선동1가\r\n');
INSERT INTO postno VALUES (1079,'136-042','서울시','성북구','삼선동2가\r\n');
INSERT INTO postno VALUES (1080,'136-043','서울시','성북구','삼선동3가\r\n');
INSERT INTO postno VALUES (1081,'136-044','서울시','성북구','삼선동4가\r\n');
INSERT INTO postno VALUES (1082,'136-045','서울시','성북구','삼선동5가\r\n');
INSERT INTO postno VALUES (1083,'136-051','서울시','성북구','동선동1가\r\n');
INSERT INTO postno VALUES (1084,'136-052','서울시','성북구','동선동2가\r\n');
INSERT INTO postno VALUES (1085,'136-053','서울시','성북구','동선동3가\r\n');
INSERT INTO postno VALUES (1086,'136-054','서울시','성북구','동선동4가\r\n');
INSERT INTO postno VALUES (1087,'136-055','서울시','성북구','동선동5가\r\n');
INSERT INTO postno VALUES (1088,'136-060','서울시','성북구','돈암동\r\n');
INSERT INTO postno VALUES (1089,'136-061','서울시','성북구','돈암1동\r\n');
INSERT INTO postno VALUES (1090,'136-062','서울시','성북구','돈암2동\r\n');
INSERT INTO postno VALUES (1091,'136-071','서울시','성북구','안암동1가\r\n');
INSERT INTO postno VALUES (1092,'136-072','서울시','성북구','안암동2가\r\n');
INSERT INTO postno VALUES (1093,'136-073','서울시','성북구','안암동3가\r\n');
INSERT INTO postno VALUES (1094,'136-074','서울시','성북구','안암동4가\r\n');
INSERT INTO postno VALUES (1095,'136-075','서울시','성북구','안암동5가\r\n');
INSERT INTO postno VALUES (1096,'136-081','서울시','성북구','보문동1가\r\n');
INSERT INTO postno VALUES (1097,'136-082','서울시','성북구','보문동2가\r\n');
INSERT INTO postno VALUES (1098,'136-083','서울시','성북구','보문동3가\r\n');
INSERT INTO postno VALUES (1099,'136-084','서울시','성북구','보문동4가\r\n');
INSERT INTO postno VALUES (1100,'136-085','서울시','성북구','보문동5가\r\n');
INSERT INTO postno VALUES (1101,'136-086','서울시','성북구','보문동6가\r\n');
INSERT INTO postno VALUES (1102,'136-087','서울시','성북구','보문동7가\r\n');
INSERT INTO postno VALUES (1103,'136-090','서울시','성북구','종암동\r\n');
INSERT INTO postno VALUES (1104,'136-091','서울시','성북구','종암1동\r\n');
INSERT INTO postno VALUES (1105,'136-092','서울시','성북구','종암2동\r\n');
INSERT INTO postno VALUES (1106,'136-100','서울시','성북구','정릉동\r\n');
INSERT INTO postno VALUES (1107,'136-101','서울시','성북구','정릉1동\r\n');
INSERT INTO postno VALUES (1108,'136-102','서울시','성북구','정릉2동\r\n');
INSERT INTO postno VALUES (1109,'136-103','서울시','성북구','정릉3동\r\n');
INSERT INTO postno VALUES (1110,'136-104','서울시','성북구','정릉4동\r\n');
INSERT INTO postno VALUES (1111,'136-110','서울시','성북구','길음동\r\n');
INSERT INTO postno VALUES (1112,'136-111','서울시','성북구','길음1동\r\n');
INSERT INTO postno VALUES (1113,'136-112','서울시','성북구','길음2동\r\n');
INSERT INTO postno VALUES (1114,'136-113','서울시','성북구','길음3동\r\n');
INSERT INTO postno VALUES (1115,'136-120','서울시','성북구','상월곡동\r\n');
INSERT INTO postno VALUES (1116,'136-130','서울시','성북구','하월곡동\r\n');
INSERT INTO postno VALUES (1117,'136-131','서울시','성북구','하월곡1동\r\n');
INSERT INTO postno VALUES (1118,'136-132','서울시','성북구','하월곡2동\r\n');
INSERT INTO postno VALUES (1119,'136-133','서울시','성북구','하월곡3동\r\n');
INSERT INTO postno VALUES (1120,'136-134','서울시','성북구','하월곡4동\r\n');
INSERT INTO postno VALUES (1121,'136-140','서울시','성북구','장위동\r\n');
INSERT INTO postno VALUES (1122,'136-141','서울시','성북구','장위1동\r\n');
INSERT INTO postno VALUES (1123,'136-142','서울시','성북구','장위2동\r\n');
INSERT INTO postno VALUES (1124,'136-143','서울시','성북구','장위3동\r\n');
INSERT INTO postno VALUES (1125,'136-150','서울시','성북구','석관동\r\n');
INSERT INTO postno VALUES (1126,'136-151','서울시','성북구','석관1동\r\n');
INSERT INTO postno VALUES (1127,'136-152','서울시','성북구','석관2동\r\n');
INSERT INTO postno VALUES (1128,'136-600','서울시','성북구','서울성북우체국사서함\r\n');
INSERT INTO postno VALUES (1129,'136-701','서울시','성북구','안암동5가 고려대학교\r\n');
INSERT INTO postno VALUES (1130,'136-702','서울시','성북구','정릉3동 국민대학교\r\n');
INSERT INTO postno VALUES (1131,'136-703','서울시','성북구','정릉3동 고려대보건전문대\r\n');
INSERT INTO postno VALUES (1132,'136-704','서울시','성북구','정릉4동 서경대학\r\n');
INSERT INTO postno VALUES (1133,'136-705','서울시','성북구','안암동5가 고려대부속병원\r\n');
INSERT INTO postno VALUES (1134,'136-706','서울시','성북구','삼선동5가 성북구청\r\n');
INSERT INTO postno VALUES (1135,'136-707','서울시','성북구','삼선동5가 성북경찰서\r\n');
INSERT INTO postno VALUES (1136,'136-708','서울시','성북구','삼선동3가 성북세무서\r\n');
INSERT INTO postno VALUES (1137,'136-709','서울시','성북구','보문동5가 성북전화국\r\n');
INSERT INTO postno VALUES (1138,'136-710','서울시','성북구','길음3동 신세계백화점미아\r\n');
INSERT INTO postno VALUES (1139,'136-711','서울시','성북구','보문동7가 서광빌딩\r\n');
INSERT INTO postno VALUES (1140,'136-712','서울시','성북구','종암1동 고려대학교교우회\r\n');
INSERT INTO postno VALUES (1141,'136-714','서울시','성북구','하월곡2동 동덕여자대학교\r\n');
INSERT INTO postno VALUES (1142,'136-742','서울시','성북구','동선동3가 성신여자대학교\r\n');
INSERT INTO postno VALUES (1143,'136-751','서울시','성북구','돈암2동 한신아파트\r\n');
INSERT INTO postno VALUES (1144,'136-753','서울시','성북구','돈암2동 한진아파트\r\n');
INSERT INTO postno VALUES (1145,'136-791','서울시','성북구','하월곡2동 한국과학기술원\r\n');
INSERT INTO postno VALUES (1146,'136-792','서울시','성북구','삼선동3가 한성대학\r\n');
INSERT INTO postno VALUES (1147,'137-030','서울시','서초구','잠원동\r\n');
INSERT INTO postno VALUES (1148,'137-040','서울시','서초구','반포동\r\n');
INSERT INTO postno VALUES (1149,'137-041','서울시','서초구','반포1동\r\n');
INSERT INTO postno VALUES (1150,'137-042','서울시','서초구','반포2동\r\n');
INSERT INTO postno VALUES (1151,'137-043','서울시','서초구','반포3동\r\n');
INSERT INTO postno VALUES (1152,'137-044','서울시','서초구','반포4동\r\n');
INSERT INTO postno VALUES (1153,'137-049','서울시','서초구','반포본동\r\n');
INSERT INTO postno VALUES (1154,'137-060','서울시','서초구','방배동\r\n');
INSERT INTO postno VALUES (1155,'137-061','서울시','서초구','방배1동\r\n');
INSERT INTO postno VALUES (1156,'137-062','서울시','서초구','방배2동\r\n');
INSERT INTO postno VALUES (1157,'137-063','서울시','서초구','방배3동\r\n');
INSERT INTO postno VALUES (1158,'137-064','서울시','서초구','방배4동\r\n');
INSERT INTO postno VALUES (1159,'137-069','서울시','서초구','방배본동\r\n');
INSERT INTO postno VALUES (1160,'137-070','서울시','서초구','서초동\r\n');
INSERT INTO postno VALUES (1161,'137-071','서울시','서초구','서초1동\r\n');
INSERT INTO postno VALUES (1162,'137-072','서울시','서초구','서초2동\r\n');
INSERT INTO postno VALUES (1163,'137-073','서울시','서초구','서초3동\r\n');
INSERT INTO postno VALUES (1164,'137-074','서울시','서초구','서초4동\r\n');
INSERT INTO postno VALUES (1165,'137-130','서울시','서초구','양재동\r\n');
INSERT INTO postno VALUES (1166,'137-131','서울시','서초구','양재1동\r\n');
INSERT INTO postno VALUES (1167,'137-132','서울시','서초구','양재2동\r\n');
INSERT INTO postno VALUES (1168,'137-140','서울시','서초구','우면동\r\n');
INSERT INTO postno VALUES (1169,'137-150','서울시','서초구','원지동\r\n');
INSERT INTO postno VALUES (1170,'137-160','서울시','서초구','신원동\r\n');
INSERT INTO postno VALUES (1171,'137-170','서울시','서초구','염곡동\r\n');
INSERT INTO postno VALUES (1172,'137-180','서울시','서초구','내곡동\r\n');
INSERT INTO postno VALUES (1173,'137-600','서울시','서초구','서울서초우체국사서함0001-\r\n');
INSERT INTO postno VALUES (1174,'137-601','서울시','서초구','서울서초우체국사서함0100-\r\n');
INSERT INTO postno VALUES (1175,'137-602','서울시','서초구','서울서초우체국사서함0200-\r\n');
INSERT INTO postno VALUES (1176,'137-603','서울시','서초구','서울서초우체국사서함0300-\r\n');
INSERT INTO postno VALUES (1177,'137-604','서울시','서초구','서울서초우체국사서함0400-\r\n');
INSERT INTO postno VALUES (1178,'137-700','서울시','서초구','염곡동 한국소비자보호원\r\n');
INSERT INTO postno VALUES (1179,'137-701','서울시','서초구','카톨릭대학교성의교정\r\n');
INSERT INTO postno VALUES (1180,'137-702','서울시','서초구','반포4동 국립중앙도서관\r\n');
INSERT INTO postno VALUES (1181,'137-703','서울시','서초구','서초4동 금강빌딩\r\n');
INSERT INTO postno VALUES (1182,'137-704','서울시','서초구','서초2동 서초구청\r\n');
INSERT INTO postno VALUES (1183,'137-705','서울시','서초구','서초3동 서초경찰서\r\n');
INSERT INTO postno VALUES (1184,'137-706','서울시','서초구','서초3동 서초세무서\r\n');
INSERT INTO postno VALUES (1185,'137-707','서울시','서초구','서초3동 (주)녹십자건물\r\n');
INSERT INTO postno VALUES (1186,'137-708','서울시','서초구','방배4동 반포세무서\r\n');
INSERT INTO postno VALUES (1187,'137-709','서울시','서초구','방배2동 방배경찰서\r\n');
INSERT INTO postno VALUES (1188,'137-710','서울시','서초구','방배2동 농수축산신보빌딩\r\n');
INSERT INTO postno VALUES (1189,'137-711','서울시','서초구','반포3동 뉴코아백화점빌딩\r\n');
INSERT INTO postno VALUES (1190,'137-712','서울시','서초구','서울특별시지하철공사\r\n');
INSERT INTO postno VALUES (1191,'137-713','서울시','서초구','반포4동 대우전자(주)\r\n');
INSERT INTO postno VALUES (1192,'137-714','서울시','서초구','반포4동 이수화학\r\n');
INSERT INTO postno VALUES (1193,'137-715','서울시','서초구','우면동 한국교원단체총연합\r\n');
INSERT INTO postno VALUES (1194,'137-716','서울시','서초구','방배1동 외환카드(주)\r\n');
INSERT INTO postno VALUES (1195,'137-717','서울시','서초구','서초3동 삼성물산(주)\r\n');
INSERT INTO postno VALUES (1196,'137-718','서울시','서초구','서초3동 예술의전당\r\n');
INSERT INTO postno VALUES (1197,'137-719','서울시','서초구','서초3동 (주)우성건설\r\n');
INSERT INTO postno VALUES (1198,'137-720','서울시','서초구','서초3동 캠브리지빌딩\r\n');
INSERT INTO postno VALUES (1199,'137-721','서울시','서초구','서초3동 (주)풀무원\r\n');
INSERT INTO postno VALUES (1200,'137-722','서울시','서초구','양재2동 대우통신(주)\r\n');
INSERT INTO postno VALUES (1201,'137-723','서울시','서초구','잠원동 롯데복지센타빌딩\r\n');
INSERT INTO postno VALUES (1202,'137-724','서울시','서초구','우면동 LG연구소\r\n');
INSERT INTO postno VALUES (1203,'137-725','서울시','서초구','서초1동 하림빌딩\r\n');
INSERT INTO postno VALUES (1204,'137-730','서울시','서초구','서초3동 대검찰청\r\n');
INSERT INTO postno VALUES (1205,'137-735','서울시','서초구','서초3동 서울고등법원\r\n');
INSERT INTO postno VALUES (1206,'137-736','서울시','서초구','서초3동 서울지방법원(형사\r\n');
INSERT INTO postno VALUES (1207,'137-737','서울시','서초구','서초3동 서울지방법원(민사\r\n');
INSERT INTO postno VALUES (1208,'137-738','서울시','서초구','서초3동 서울가정법원\r\n');
INSERT INTO postno VALUES (1209,'137-740','서울시','서초구','서초3동 서울고등검찰청\r\n');
INSERT INTO postno VALUES (1210,'137-741','서울시','서초구','서초3동 서울지방검찰청\r\n');
INSERT INTO postno VALUES (1211,'137-742','서울시','서초구','서초1동 서울교육대학\r\n');
INSERT INTO postno VALUES (1212,'137-745','서울시','서초구','서초3동 사법연수원\r\n');
INSERT INTO postno VALUES (1213,'137-746','서울시','서초구','서초3동 법원공무원교육원\r\n');
INSERT INTO postno VALUES (1214,'137-750','서울시','서초구','서초3동 대법원\r\n');
INSERT INTO postno VALUES (1215,'137-751','서울시','서초구','서초2동 아태빌딩\r\n');
INSERT INTO postno VALUES (1216,'137-752','서울시','서초구','방배3동 경남아파트\r\n');
INSERT INTO postno VALUES (1217,'137-753','서울시','서초구','방배3동 방배우성아파트\r\n');
INSERT INTO postno VALUES (1218,'137-754','서울시','서초구','방배3동 삼익아파트\r\n');
INSERT INTO postno VALUES (1219,'137-755','서울시','서초구','방배3동 임광아파트\r\n');
INSERT INTO postno VALUES (1220,'137-756','서울시','서초구','반포4동 조달청빌딩\r\n');
INSERT INTO postno VALUES (1221,'137-757','서울시','서초구','서초3동 아크리스백화점건\r\n');
INSERT INTO postno VALUES (1222,'137-758','서울시','서초구','방배3동 신동아아파트\r\n');
INSERT INTO postno VALUES (1223,'137-759','서울시','서초구','방배본동 삼호아파트\r\n');
INSERT INTO postno VALUES (1224,'137-761','서울시','서초구','반포1동 삼호가든아파트\r\n');
INSERT INTO postno VALUES (1225,'137-762','서울시','서초구','반포1동 서초한양아파트\r\n');
INSERT INTO postno VALUES (1226,'137-763','서울시','서초구','반포1동 주공아파트3단지\r\n');
INSERT INTO postno VALUES (1227,'137-765','서울시','서초구','반포2동 경남아파트\r\n');
INSERT INTO postno VALUES (1228,'137-766','서울시','서초구','반포2동 주공아파트2단지\r\n');
INSERT INTO postno VALUES (1229,'137-767','서울시','서초구','반포2동 한신아파트\r\n');
INSERT INTO postno VALUES (1230,'137-768','서울시','서초구','반포4동 서래아파트\r\n');
INSERT INTO postno VALUES (1231,'137-769','서울시','서초구','반포4동 미도아파트\r\n');
INSERT INTO postno VALUES (1232,'137-770','서울시','서초구','반포본동 구반포주공A1단지\r\n');
INSERT INTO postno VALUES (1233,'137-771','서울시','서초구','서초2동 무지개아파트\r\n');
INSERT INTO postno VALUES (1234,'137-772','서울시','서초구','서초2동 신동아아파트\r\n');
INSERT INTO postno VALUES (1235,'137-773','서울시','서초구','서초2동 우성아파트\r\n');
INSERT INTO postno VALUES (1236,'137-775','서울시','서초구','서초4동 극동아파트\r\n');
INSERT INTO postno VALUES (1237,'137-776','서울시','서초구','서초4동 진흥아파트\r\n');
INSERT INTO postno VALUES (1238,'137-777','서울시','서초구','서초3동 비씨카드(주)\r\n');
INSERT INTO postno VALUES (1239,'137-778','서울시','서초구','서초4동 삼익아파트\r\n');
INSERT INTO postno VALUES (1240,'137-779','서울시','서초구','서초4동 삼풍아파트\r\n');
INSERT INTO postno VALUES (1241,'137-780','서울시','서초구','서초4동 유원아파트\r\n');
INSERT INTO postno VALUES (1242,'137-781','서울시','서초구','우면동 동양고속아파트\r\n');
INSERT INTO postno VALUES (1243,'137-782','서울시','서초구','우면동 대림아파트\r\n');
INSERT INTO postno VALUES (1244,'137-783','서울시','서초구','우면동 우면주공아파트\r\n');
INSERT INTO postno VALUES (1245,'137-784','서울시','서초구','잠원동 코오롱아파트\r\n');
INSERT INTO postno VALUES (1246,'137-785','서울시','서초구','잠원동 한라아파트\r\n');
INSERT INTO postno VALUES (1247,'137-791','서울시','서초구','우면동 한국교육개발원건물\r\n');
INSERT INTO postno VALUES (1248,'137-792','서울시','서초구','우면동 한국통신연구개발본\r\n');
INSERT INTO postno VALUES (1249,'137-793','서울시','서초구','양재1동 양재우성아파트\r\n');
INSERT INTO postno VALUES (1250,'137-794','서울시','서초구','잠원동 강변아파트\r\n');
INSERT INTO postno VALUES (1251,'137-795','서울시','서초구','잠원동 설악아파트\r\n');
INSERT INTO postno VALUES (1252,'137-796','서울시','서초구','잠원동 잠원한신아파트\r\n');
INSERT INTO postno VALUES (1253,'137-797','서울시','서초구','잠원동 잠원한신아파트\r\n');
INSERT INTO postno VALUES (1254,'137-798','서울시','서초구','잠원동 한강아파트\r\n');
INSERT INTO postno VALUES (1255,'137-799','서울시','서초구','잠원동 한양아파트\r\n');
INSERT INTO postno VALUES (1256,'138-040','서울시','송파구','풍납동\r\n');
INSERT INTO postno VALUES (1257,'138-041','서울시','송파구','풍납1동\r\n');
INSERT INTO postno VALUES (1258,'138-042','서울시','송파구','풍납2동\r\n');
INSERT INTO postno VALUES (1259,'138-050','서울시','송파구','방이동\r\n');
INSERT INTO postno VALUES (1260,'138-051','서울시','송파구','방이1동\r\n');
INSERT INTO postno VALUES (1261,'138-052','서울시','송파구','방이2동\r\n');
INSERT INTO postno VALUES (1262,'138-110','서울시','송파구','거여동\r\n');
INSERT INTO postno VALUES (1263,'138-111','서울시','송파구','거여1동\r\n');
INSERT INTO postno VALUES (1264,'138-112','서울시','송파구','거여2동\r\n');
INSERT INTO postno VALUES (1265,'138-120','서울시','송파구','마천동\r\n');
INSERT INTO postno VALUES (1266,'138-121','서울시','송파구','마천1동\r\n');
INSERT INTO postno VALUES (1267,'138-122','서울시','송파구','마천2동\r\n');
INSERT INTO postno VALUES (1268,'138-130','서울시','송파구','오금동\r\n');
INSERT INTO postno VALUES (1269,'138-151','서울시','송파구','오륜동\r\n');
INSERT INTO postno VALUES (1270,'138-160','서울시','송파구','가락동\r\n');
INSERT INTO postno VALUES (1271,'138-161','서울시','송파구','가락1동\r\n');
INSERT INTO postno VALUES (1272,'138-162','서울시','송파구','가락2동\r\n');
INSERT INTO postno VALUES (1273,'138-169','서울시','송파구','가락본동\r\n');
INSERT INTO postno VALUES (1274,'138-170','서울시','송파구','송파동\r\n');
INSERT INTO postno VALUES (1275,'138-171','서울시','송파구','송파1동\r\n');
INSERT INTO postno VALUES (1276,'138-172','서울시','송파구','송파2동\r\n');
INSERT INTO postno VALUES (1277,'138-180','서울시','송파구','삼전동\r\n');
INSERT INTO postno VALUES (1278,'138-190','서울시','송파구','석촌동\r\n');
INSERT INTO postno VALUES (1279,'138-200','서울시','송파구','문정동\r\n');
INSERT INTO postno VALUES (1280,'138-201','서울시','송파구','문정1동\r\n');
INSERT INTO postno VALUES (1281,'138-202','서울시','송파구','문정2동\r\n');
INSERT INTO postno VALUES (1282,'138-210','서울시','송파구','장지동\r\n');
INSERT INTO postno VALUES (1283,'138-220','서울시','송파구','잠실동\r\n');
INSERT INTO postno VALUES (1284,'138-221','서울시','송파구','잠실1동\r\n');
INSERT INTO postno VALUES (1285,'138-222','서울시','송파구','잠실2동\r\n');
INSERT INTO postno VALUES (1286,'138-223','서울시','송파구','잠실3동\r\n');
INSERT INTO postno VALUES (1287,'138-224','서울시','송파구','잠실4동\r\n');
INSERT INTO postno VALUES (1288,'138-225','서울시','송파구','잠실5동\r\n');
INSERT INTO postno VALUES (1289,'138-226','서울시','송파구','잠실6동\r\n');
INSERT INTO postno VALUES (1290,'138-227','서울시','송파구','잠실7동\r\n');
INSERT INTO postno VALUES (1291,'138-229','서울시','송파구','잠실본동\r\n');
INSERT INTO postno VALUES (1292,'138-240','서울시','송파구','신천동\r\n');
INSERT INTO postno VALUES (1293,'138-600','서울시','송파구','서울송파우체국사서함\r\n');
INSERT INTO postno VALUES (1294,'138-701','서울시','송파구','가락동농수산물시장\r\n');
INSERT INTO postno VALUES (1295,'138-702','서울시','송파구','신천동 송파구청\r\n');
INSERT INTO postno VALUES (1296,'138-703','서울시','송파구','신천동 송파전화국\r\n');
INSERT INTO postno VALUES (1297,'138-704','서울시','송파구','풍납2동 중부국세청\r\n');
INSERT INTO postno VALUES (1298,'138-705','서울시','송파구','방이2동 잠실세무서\r\n');
INSERT INTO postno VALUES (1299,'138-706','서울시','송파구','장지동 송파세무서\r\n');
INSERT INTO postno VALUES (1300,'138-707','서울시','송파구','가락본동 송파경찰서\r\n');
INSERT INTO postno VALUES (1301,'138-708','서울시','송파구','가락본동 경찰병원\r\n');
INSERT INTO postno VALUES (1302,'138-709','서울시','송파구','가락2동 성동구치소\r\n');
INSERT INTO postno VALUES (1303,'138-710','서울시','송파구','가락본동 거북이오피스텔\r\n');
INSERT INTO postno VALUES (1304,'138-711','서울시','송파구','가락본동 그린빌딩\r\n');
INSERT INTO postno VALUES (1305,'138-712','서울시','송파구','밀리아나1차오피스텔\r\n');
INSERT INTO postno VALUES (1306,'138-713','서울시','송파구','밀리아나2차오피스텔\r\n');
INSERT INTO postno VALUES (1307,'138-714','서울시','송파구','가락본동 소방공제회관건물\r\n');
INSERT INTO postno VALUES (1308,'138-715','서울시','송파구','가락본동 제일오피스텔\r\n');
INSERT INTO postno VALUES (1309,'138-716','서울시','송파구','가락본동 중앙일보사건물\r\n');
INSERT INTO postno VALUES (1310,'138-717','서울시','송파구','가락본동 동원빌딩\r\n');
INSERT INTO postno VALUES (1311,'138-718','서울시','송파구','가락본동 해태빌딩\r\n');
INSERT INTO postno VALUES (1312,'138-719','서울시','송파구','가락본동 현진오피스텔\r\n');
INSERT INTO postno VALUES (1313,'138-720','서울시','송파구','가락본동 효원빌딩\r\n');
INSERT INTO postno VALUES (1314,'138-721','서울시','송파구','잠실3동 롯데월드빌딩\r\n');
INSERT INTO postno VALUES (1315,'138-722','서울시','송파구','훼미리1차오피스텔\r\n');
INSERT INTO postno VALUES (1316,'138-723','서울시','송파구','훼미리2차오피스텔\r\n');
INSERT INTO postno VALUES (1317,'138-724','서울시','송파구','방이2동 한미약품빌딩\r\n');
INSERT INTO postno VALUES (1318,'138-725','서울시','송파구','신천동  국민연금관리공단\r\n');
INSERT INTO postno VALUES (1319,'138-726','서울시','송파구','신천동 대한제당건물\r\n');
INSERT INTO postno VALUES (1320,'138-727','서울시','송파구','신천동 롯데엘그린빌딩\r\n');
INSERT INTO postno VALUES (1321,'138-728','서울시','송파구','신천동 삼성한빛타운건물\r\n');
INSERT INTO postno VALUES (1322,'138-729','서울시','송파구','신천동 예전빌딩\r\n');
INSERT INTO postno VALUES (1323,'138-730','서울시','송파구','신천동 수협중앙회\r\n');
INSERT INTO postno VALUES (1324,'138-731','서울시','송파구','신천동 월드타워건물\r\n');
INSERT INTO postno VALUES (1325,'138-732','서울시','송파구','신천동 한국어린이육영회건\r\n');
INSERT INTO postno VALUES (1326,'138-733','서울시','송파구','신천동 한신코아오피스텔\r\n');
INSERT INTO postno VALUES (1327,'138-734','서울시','송파구','신천동 한일시그마타운건물\r\n');
INSERT INTO postno VALUES (1328,'138-735','서울시','송파구','신천동 현대복합건물\r\n');
INSERT INTO postno VALUES (1329,'138-736','서울시','송파구','풍납2동 서울중앙병원\r\n');
INSERT INTO postno VALUES (1330,'138-737','서울시','송파구','오금동 대림아파트\r\n');
INSERT INTO postno VALUES (1331,'138-738','서울시','송파구','오금동 상아아파트\r\n');
INSERT INTO postno VALUES (1332,'138-739','서울시','송파구','오금동 우창아파트\r\n');
INSERT INTO postno VALUES (1333,'138-740','서울시','송파구','오금동 현대아파트\r\n');
INSERT INTO postno VALUES (1334,'138-741','서울시','송파구','가락1동 가락시영아파트\r\n');
INSERT INTO postno VALUES (1335,'138-742','서울시','송파구','신천동 서울시교통회관건물\r\n');
INSERT INTO postno VALUES (1336,'138-743','서울시','송파구','가락2동 극동아파트\r\n');
INSERT INTO postno VALUES (1337,'138-744','서울시','송파구','가락2동 미륭아파트\r\n');
INSERT INTO postno VALUES (1338,'138-745','서울시','송파구','가락2동 삼환아파트\r\n');
INSERT INTO postno VALUES (1339,'138-746','서울시','송파구','가락2동 프라자아파트\r\n');
INSERT INTO postno VALUES (1340,'138-747','서울시','송파구','가락2동 쌍용아파트\r\n');
INSERT INTO postno VALUES (1341,'138-748','서울시','송파구','가락2동 한라아파트\r\n');
INSERT INTO postno VALUES (1342,'138-749','서울시','송파구','오륜동 올림픽회관\r\n');
INSERT INTO postno VALUES (1343,'138-750','서울시','송파구','풍납2동 강동세무서\r\n');
INSERT INTO postno VALUES (1344,'138-751','서울시','송파구','가락본동 금호아파트\r\n');
INSERT INTO postno VALUES (1345,'138-752','서울시','송파구','가락본동 대림아파트\r\n');
INSERT INTO postno VALUES (1346,'138-753','서울시','송파구','가락본동 우성아파트\r\n');
INSERT INTO postno VALUES (1347,'138-755','서울시','송파구','거여1동 현대1차아파트\r\n');
INSERT INTO postno VALUES (1348,'138-755','서울시','송파구','거여1동 현대3차아파트\r\n');
INSERT INTO postno VALUES (1349,'138-756','서울시','송파구','거여2동 비호아파트\r\n');
INSERT INTO postno VALUES (1350,'138-757','서울시','송파구','거여2동 현대2차아파트\r\n');
INSERT INTO postno VALUES (1351,'138-761','서울시','송파구','장지동 건영아파트\r\n');
INSERT INTO postno VALUES (1352,'138-762','서울시','송파구','장지동 시영아파트\r\n');
INSERT INTO postno VALUES (1353,'138-763','서울시','송파구','오륜동 체육대학\r\n');
INSERT INTO postno VALUES (1354,'138-764','서울시','송파구','문정1동 주공아파트\r\n');
INSERT INTO postno VALUES (1355,'138-765','서울시','송파구','문정1동 현대1차아파트\r\n');
INSERT INTO postno VALUES (1356,'138-767','서울시','송파구','문정2동 훼미리아파트1단지\r\n');
INSERT INTO postno VALUES (1357,'138-768','서울시','송파구','문정2동 훼미리아파트2단지\r\n');
INSERT INTO postno VALUES (1358,'138-769','서울시','송파구','문정2동 훼미리아파트3단지\r\n');
INSERT INTO postno VALUES (1359,'138-771','서울시','송파구','방이1동 대림아파트\r\n');
INSERT INTO postno VALUES (1360,'138-772','서울시','송파구','방이1동 코오롱아파트\r\n');
INSERT INTO postno VALUES (1361,'138-773','서울시','송파구','송파1동 한양아파트\r\n');
INSERT INTO postno VALUES (1362,'138-775','서울시','송파구','송파2동 미성아파트\r\n');
INSERT INTO postno VALUES (1363,'138-776','서울시','송파구','송파2동 반도아파트\r\n');
INSERT INTO postno VALUES (1364,'138-777','서울시','송파구','송파2동 삼익아파트\r\n');
INSERT INTO postno VALUES (1365,'138-778','서울시','송파구','송파2동 성원아파트\r\n');
INSERT INTO postno VALUES (1366,'138-779','서울시','송파구','송파2동 한양아파트\r\n');
INSERT INTO postno VALUES (1367,'138-780','서울시','송파구','풍납1동 동아한가름아파트\r\n');
INSERT INTO postno VALUES (1368,'138-781','서울시','송파구','풍납2동 극동아파트\r\n');
INSERT INTO postno VALUES (1369,'138-782','서울시','송파구','풍납2동 미성아파트\r\n');
INSERT INTO postno VALUES (1370,'138-783','서울시','송파구','풍납2동 우성아파트\r\n');
INSERT INTO postno VALUES (1371,'138-784','서울시','송파구','풍납2동 한강극동아파트\r\n');
INSERT INTO postno VALUES (1372,'138-785','서울시','송파구','풍납2동 현대아파트\r\n');
INSERT INTO postno VALUES (1373,'138-786','서울시','송파구','오륜동 올림픽선수촌APT-1\r\n');
INSERT INTO postno VALUES (1374,'138-787','서울시','송파구','오륜동 올림픽선수촌APT-2\r\n');
INSERT INTO postno VALUES (1375,'138-788','서울시','송파구','오륜동 올림픽선수촌APT-3\r\n');
INSERT INTO postno VALUES (1376,'138-789','서울시','송파구','잠실3동 주공아파트3단지\r\n');
INSERT INTO postno VALUES (1377,'138-790','서울시','송파구','잠실3동 주공아파트4단지\r\n');
INSERT INTO postno VALUES (1378,'138-791','서울시','송파구','잠실3동 한화유통건물\r\n');
INSERT INTO postno VALUES (1379,'138-792','서울시','송파구','신천동 향군회관건물\r\n');
INSERT INTO postno VALUES (1380,'138-793','서울시','송파구','잠실4동 미성아파트\r\n');
INSERT INTO postno VALUES (1381,'138-794','서울시','송파구','잠실4동 시영아파트\r\n');
INSERT INTO postno VALUES (1382,'138-795','서울시','송파구','잠실4동 진주아파트\r\n');
INSERT INTO postno VALUES (1383,'138-796','서울시','송파구','잠실6동 장미아파트\r\n');
INSERT INTO postno VALUES (1384,'138-797','서울시','송파구','잠실6동 아시아선수촌APT\r\n');
INSERT INTO postno VALUES (1385,'138-798','서울시','송파구','잠실6동 우성아파트\r\n');
INSERT INTO postno VALUES (1386,'138-799','서울시','송파구','잠실본동 우성4차아파트\r\n');
INSERT INTO postno VALUES (1387,'139-050','서울시','노원구','월계동\r\n');
INSERT INTO postno VALUES (1388,'139-051','서울시','노원구','월계1동\r\n');
INSERT INTO postno VALUES (1389,'139-052','서울시','노원구','월계2동\r\n');
INSERT INTO postno VALUES (1390,'139-053','서울시','노원구','월계3동\r\n');
INSERT INTO postno VALUES (1391,'139-054','서울시','노원구','월계4동\r\n');
INSERT INTO postno VALUES (1392,'139-200','서울시','노원구','상계동\r\n');
INSERT INTO postno VALUES (1393,'139-201','서울시','노원구','상계1동\r\n');
INSERT INTO postno VALUES (1394,'139-202','서울시','노원구','상계2동\r\n');
INSERT INTO postno VALUES (1395,'139-203','서울시','노원구','상계3동\r\n');
INSERT INTO postno VALUES (1396,'139-204','서울시','노원구','상계4동\r\n');
INSERT INTO postno VALUES (1397,'139-205','서울시','노원구','상계5동\r\n');
INSERT INTO postno VALUES (1398,'139-206','서울시','노원구','상계6동\r\n');
INSERT INTO postno VALUES (1399,'139-207','서울시','노원구','상계7동\r\n');
INSERT INTO postno VALUES (1400,'139-208','서울시','노원구','상계8동\r\n');
INSERT INTO postno VALUES (1401,'139-209','서울시','노원구','상계9동\r\n');
INSERT INTO postno VALUES (1402,'139-210','서울시','노원구','상계10동\r\n');
INSERT INTO postno VALUES (1403,'139-220','서울시','노원구','중계동\r\n');
INSERT INTO postno VALUES (1404,'139-221','서울시','노원구','중계1동\r\n');
INSERT INTO postno VALUES (1405,'139-222','서울시','노원구','중계2동\r\n');
INSERT INTO postno VALUES (1406,'139-223','서울시','노원구','중계3동\r\n');
INSERT INTO postno VALUES (1407,'139-224','서울시','노원구','중계4동\r\n');
INSERT INTO postno VALUES (1408,'139-229','서울시','노원구','중계본동\r\n');
INSERT INTO postno VALUES (1409,'139-230','서울시','노원구','하계동\r\n');
INSERT INTO postno VALUES (1410,'139-231','서울시','노원구','하계1동\r\n');
INSERT INTO postno VALUES (1411,'139-232','서울시','노원구','하계2동\r\n');
INSERT INTO postno VALUES (1412,'139-240','서울시','노원구','공릉동\r\n');
INSERT INTO postno VALUES (1413,'139-241','서울시','노원구','공릉1동\r\n');
INSERT INTO postno VALUES (1414,'139-242','서울시','노원구','공릉2동\r\n');
INSERT INTO postno VALUES (1415,'139-243','서울시','노원구','공릉3동\r\n');
INSERT INTO postno VALUES (1416,'139-600','서울시','노원구','서울노원우체국사서함\r\n');
INSERT INTO postno VALUES (1417,'139-701','서울시','노원구','월계1동 광운대학교\r\n');
INSERT INTO postno VALUES (1418,'139-702','서울시','노원구','하계1동 노원경찰서\r\n');
INSERT INTO postno VALUES (1419,'139-703','서울시','노원구','상계6동 노원구청\r\n');
INSERT INTO postno VALUES (1420,'139-704','서울시','노원구','서울지방검찰청북부지청\r\n');
INSERT INTO postno VALUES (1421,'139-705','서울시','노원구','서울지방법원북부지원\r\n');
INSERT INTO postno VALUES (1422,'139-706','서울시','노원구','공릉2동 원자력병원\r\n');
INSERT INTO postno VALUES (1423,'139-707','서울시','노원구','상계7동 사계백병원\r\n');
INSERT INTO postno VALUES (1424,'139-708','서울시','노원구','상계2동 미도파백화점\r\n');
INSERT INTO postno VALUES (1425,'139-709','서울시','노원구','상계2동 건영옴니백화점\r\n');
INSERT INTO postno VALUES (1426,'139-710','서울시','노원구','상계본동 유경백화점\r\n');
INSERT INTO postno VALUES (1427,'139-711','서울시','노원구','하계1동 노원을지병원\r\n');
INSERT INTO postno VALUES (1428,'139-712','서울시','노원구','하계1동 한신코아백화점\r\n');
INSERT INTO postno VALUES (1429,'139-742','서울시','노원구','공릉2동 삼육대학교\r\n');
INSERT INTO postno VALUES (1430,'139-743','서울시','노원구','공릉2동 서울산업대학교\r\n');
INSERT INTO postno VALUES (1431,'139-749','서울시','노원구','월계4동 인덕전문대학\r\n');
INSERT INTO postno VALUES (1432,'139-752','서울시','노원구','상계6동 상계주공APT-2단지\r\n');
INSERT INTO postno VALUES (1433,'139-753','서울시','노원구','상계6동 상계주공APT-3단지\r\n');
INSERT INTO postno VALUES (1434,'139-754','서울시','노원구','상계7동 상계주공APT-4단지\r\n');
INSERT INTO postno VALUES (1435,'139-755','서울시','노원구','상계7동 상계주공APT-5단지\r\n');
INSERT INTO postno VALUES (1436,'139-756','서울시','노원구','상계7동 상계주공APT-6단지\r\n');
INSERT INTO postno VALUES (1437,'139-757','서울시','노원구','상계10동 상계주공APT7단지\r\n');
INSERT INTO postno VALUES (1438,'139-758','서울시','노원구','상계10동 상계주공APT8단지\r\n');
INSERT INTO postno VALUES (1439,'139-759','서울시','노원구','상계10동 상계주공APT9단지\r\n');
INSERT INTO postno VALUES (1440,'139-760','서울시','노원구','상계8동 상계주공APT10단지\r\n');
INSERT INTO postno VALUES (1441,'139-761','서울시','노원구','상계8동 상계주공APT11단지\r\n');
INSERT INTO postno VALUES (1442,'139-762','서울시','노원구','상계9동 상계주공APT12단지\r\n');
INSERT INTO postno VALUES (1443,'139-763','서울시','노원구','상계9동 상계주공APT13단지\r\n');
INSERT INTO postno VALUES (1444,'139-764','서울시','노원구','상계9동 상계주공APT14단지\r\n');
INSERT INTO postno VALUES (1445,'139-765','서울시','노원구','상계8동 상계주공APT15단지\r\n');
INSERT INTO postno VALUES (1446,'139-766','서울시','노원구','상계8동 상계주공APT16단지\r\n');
INSERT INTO postno VALUES (1447,'139-768','서울시','노원구','상계9동 상계보람아파트\r\n');
INSERT INTO postno VALUES (1448,'139-770','서울시','노원구','월계2동 월계주공1단지\r\n');
INSERT INTO postno VALUES (1449,'139-770','서울시','노원구','월계2동 월계주공2단지\r\n');
INSERT INTO postno VALUES (1450,'139-771','서울시','노원구','월계3동 미성아파트\r\n');
INSERT INTO postno VALUES (1451,'139-771','서울시','노원구','월계3동 미륭아파트\r\n');
INSERT INTO postno VALUES (1452,'139-771','서울시','노원구','월계3동 삼호아파트\r\n');
INSERT INTO postno VALUES (1453,'139-774','서울시','노원구','공릉2동 서울여자대학교\r\n');
INSERT INTO postno VALUES (1454,'139-775','서울시','노원구','월계4동 월계사슴아파트\r\n');
INSERT INTO postno VALUES (1455,'139-776','서울시','노원구','월계3동 월계사슴아파트\r\n');
INSERT INTO postno VALUES (1456,'139-777','서울시','노원구','하계1동 삼익선경아파트\r\n');
INSERT INTO postno VALUES (1457,'139-778','서울시','노원구','하계1동 한신동성아파트\r\n');
INSERT INTO postno VALUES (1458,'139-779','서울시','노원구','하계1동 하계주공APT-9단지\r\n');
INSERT INTO postno VALUES (1459,'139-781','서울시','노원구','중계1동 중계주공APT-5단지\r\n');
INSERT INTO postno VALUES (1460,'139-782','서울시','노원구','중계1동 중계주공APT-8단지\r\n');
INSERT INTO postno VALUES (1461,'139-783','서울시','노원구','중계1동 중계주공APT10단지\r\n');
INSERT INTO postno VALUES (1462,'139-784','서울시','노원구','중계2동 경남아파트\r\n');
INSERT INTO postno VALUES (1463,'139-784','서울시','노원구','중계2동 롯데아파트\r\n');
INSERT INTO postno VALUES (1464,'139-784','서울시','노원구','중계2동 상아아파트\r\n');
INSERT INTO postno VALUES (1465,'139-785','서울시','노원구','중계2동 중계시영APT-1단지\r\n');
INSERT INTO postno VALUES (1466,'139-786','서울시','노원구','중계3동 중계시영APT-2단지\r\n');
INSERT INTO postno VALUES (1467,'139-787','서울시','노원구','중계3동 중계시영APT-3단지\r\n');
INSERT INTO postno VALUES (1468,'139-788','서울시','노원구','중계3동 중계시영APT-4단지\r\n');
INSERT INTO postno VALUES (1469,'139-789','서울시','노원구','중계3동 중계주공APT-1단지\r\n');
INSERT INTO postno VALUES (1470,'139-791','서울시','노원구','상계7동 한국성서신학교\r\n');
INSERT INTO postno VALUES (1471,'139-792','서울시','노원구','중계4동 중계주공APT-2단지\r\n');
INSERT INTO postno VALUES (1472,'139-793','서울시','노원구','중계4동 중계주공APT-3단지\r\n');
INSERT INTO postno VALUES (1473,'139-794','서울시','노원구','중계4동 중계주공APT-4단지\r\n');
INSERT INTO postno VALUES (1474,'139-795','서울시','노원구','중계본동 신동아아파트\r\n');
INSERT INTO postno VALUES (1475,'139-795','서울시','노원구','중계본동 청구아파트\r\n');
INSERT INTO postno VALUES (1476,'139-795','서울시','노원구','중계본동 라이프아파트\r\n');
INSERT INTO postno VALUES (1477,'139-796','서울시','노원구','중계본동 중계주공APT6단지\r\n');
INSERT INTO postno VALUES (1478,'139-797','서울시','노원구','중계본동 중계주공APT7단지\r\n');
INSERT INTO postno VALUES (1479,'139-798','서울시','노원구','중계본동 신안아파트\r\n');
INSERT INTO postno VALUES (1480,'139-798','서울시','노원구','중계본동 동진아파트\r\n');
INSERT INTO postno VALUES (1481,'140-011','서울시','용산구','한강로1가\r\n');
INSERT INTO postno VALUES (1482,'140-012','서울시','용산구','한강로2가\r\n');
INSERT INTO postno VALUES (1483,'140-013','서울시','용산구','한강로3가\r\n');
INSERT INTO postno VALUES (1484,'140-021','서울시','용산구','용산동1가\r\n');
INSERT INTO postno VALUES (1485,'140-022','서울시','용산구','용산동2가\r\n');
INSERT INTO postno VALUES (1486,'140-023','서울시','용산구','용산동3가\r\n');
INSERT INTO postno VALUES (1487,'140-024','서울시','용산구','용산동4가\r\n');
INSERT INTO postno VALUES (1488,'140-025','서울시','용산구','용산동5가\r\n');
INSERT INTO postno VALUES (1489,'140-026','서울시','용산구','용산동6가\r\n');
INSERT INTO postno VALUES (1490,'140-030','서울시','용산구','이촌동\r\n');
INSERT INTO postno VALUES (1491,'140-031','서울시','용산구','이촌1동\r\n');
INSERT INTO postno VALUES (1492,'140-031','서울시','용산구','동부이촌동\r\n');
INSERT INTO postno VALUES (1493,'140-032','서울시','용산구','이촌2동\r\n');
INSERT INTO postno VALUES (1494,'140-032','서울시','용산구','서부이촌동\r\n');
INSERT INTO postno VALUES (1495,'140-040','서울시','용산구','산천동\r\n');
INSERT INTO postno VALUES (1496,'140-050','서울시','용산구','청암동\r\n');
INSERT INTO postno VALUES (1497,'140-060','서울시','용산구','신창동\r\n');
INSERT INTO postno VALUES (1498,'140-070','서울시','용산구','도원동\r\n');
INSERT INTO postno VALUES (1499,'140-080','서울시','용산구','용문동\r\n');
INSERT INTO postno VALUES (1500,'140-090','서울시','용산구','신계동\r\n');
INSERT INTO postno VALUES (1501,'140-100','서울시','용산구','문배동\r\n');
INSERT INTO postno VALUES (1502,'140-111','서울시','용산구','원효로1가\r\n');
INSERT INTO postno VALUES (1503,'140-112','서울시','용산구','원효로2가\r\n');
INSERT INTO postno VALUES (1504,'140-113','서울시','용산구','원효로3가\r\n');
INSERT INTO postno VALUES (1505,'140-114','서울시','용산구','원효로4가\r\n');
INSERT INTO postno VALUES (1506,'140-120','서울시','용산구','효창동\r\n');
INSERT INTO postno VALUES (1507,'140-131','서울시','용산구','청파동1가\r\n');
INSERT INTO postno VALUES (1508,'140-132','서울시','용산구','청파동2가\r\n');
INSERT INTO postno VALUES (1509,'140-133','서울시','용산구','청파동3가\r\n');
INSERT INTO postno VALUES (1510,'140-140','서울시','용산구','서계동\r\n');
INSERT INTO postno VALUES (1511,'140-150','서울시','용산구','갈월동\r\n');
INSERT INTO postno VALUES (1512,'140-160','서울시','용산구','남영동\r\n');
INSERT INTO postno VALUES (1513,'140-170','서울시','용산구','동자동\r\n');
INSERT INTO postno VALUES (1514,'140-190','서울시','용산구','후암동\r\n');
INSERT INTO postno VALUES (1515,'140-200','서울시','용산구','이태원동\r\n');
INSERT INTO postno VALUES (1516,'140-201','서울시','용산구','이태원1동\r\n');
INSERT INTO postno VALUES (1517,'140-202','서울시','용산구','이태원2동\r\n');
INSERT INTO postno VALUES (1518,'140-210','서울시','용산구','한남동\r\n');
INSERT INTO postno VALUES (1519,'140-211','서울시','용산구','한남1동\r\n');
INSERT INTO postno VALUES (1520,'140-212','서울시','용산구','한남2동\r\n');
INSERT INTO postno VALUES (1521,'140-220','서울시','용산구','보광동\r\n');
INSERT INTO postno VALUES (1522,'140-230','서울시','용산구','동빙고동\r\n');
INSERT INTO postno VALUES (1523,'140-240','서울시','용산구','서빙고동\r\n');
INSERT INTO postno VALUES (1524,'140-250','서울시','용산구','주성동\r\n');
INSERT INTO postno VALUES (1525,'140-600','서울시','용산구','서울체신직영우체국사서함\r\n');
INSERT INTO postno VALUES (1526,'140-701','서울시','용산구','용산동3가 국방부\r\n');
INSERT INTO postno VALUES (1527,'140-702','서울시','용산구','한강로2가 국제센타빌딩\r\n');
INSERT INTO postno VALUES (1528,'140-703','서울시','용산구','원효로1가 용산경찰서\r\n');
INSERT INTO postno VALUES (1529,'140-704','서울시','용산구','원효로1가 용산구청\r\n');
INSERT INTO postno VALUES (1530,'140-705','서울시','용산구','한강로3가 용산세무서\r\n');
INSERT INTO postno VALUES (1531,'140-706','서울시','용산구','한강로2가 용산전화국\r\n');
INSERT INTO postno VALUES (1532,'140-707','서울시','용산구','원효로3가 원효전화국\r\n');
INSERT INTO postno VALUES (1533,'140-708','서울시','용산구','남영동 해태제과\r\n');
INSERT INTO postno VALUES (1534,'140-709','서울시','용산구','동자동 벽산빌딩\r\n');
INSERT INTO postno VALUES (1535,'140-710','서울시','용산구','서계동 농심빌딩\r\n');
INSERT INTO postno VALUES (1536,'140-711','서울시','용산구','원효로4가 현대자동차서비\r\n');
INSERT INTO postno VALUES (1537,'140-712','서울시','용산구','한강로3가 삼구빌딩\r\n');
INSERT INTO postno VALUES (1538,'140-714','서울시','용산구','한남1동 단국대학교\r\n');
INSERT INTO postno VALUES (1539,'140-715','서울시','용산구','문배동 동양제과건물\r\n');
INSERT INTO postno VALUES (1540,'140-716','서울시','용산구','한강로3가 데이콤빌딩\r\n');
INSERT INTO postno VALUES (1541,'140-740','서울시','용산구','한강로3가 세계일보건물\r\n');
INSERT INTO postno VALUES (1542,'140-742','서울시','용산구','청파동2가 숙명여자대학교\r\n');
INSERT INTO postno VALUES (1543,'140-743','서울시','용산구','한남1동 순천향대학병원\r\n');
INSERT INTO postno VALUES (1544,'140-749','서울시','용산구','한강로2가 용산전자상가\r\n');
INSERT INTO postno VALUES (1545,'140-751','서울시','용산구','서빙고동 신동아아파트\r\n');
INSERT INTO postno VALUES (1546,'140-756','서울시','용산구','문배동 제일제당건물\r\n');
INSERT INTO postno VALUES (1547,'140-757','서울시','용산구','중앙대학교부속용산병원\r\n');
INSERT INTO postno VALUES (1548,'140-777','서울시','용산구','한강로2가 태평양화학빌딩\r\n');
INSERT INTO postno VALUES (1549,'142-060','서울시','강북구','번동\r\n');
INSERT INTO postno VALUES (1550,'142-061','서울시','강북구','번1동\r\n');
INSERT INTO postno VALUES (1551,'142-062','서울시','강북구','번2동\r\n');
INSERT INTO postno VALUES (1552,'142-063','서울시','강북구','번3동\r\n');
INSERT INTO postno VALUES (1553,'142-070','서울시','강북구','수유동\r\n');
INSERT INTO postno VALUES (1554,'142-071','서울시','강북구','수유1동\r\n');
INSERT INTO postno VALUES (1555,'142-072','서울시','강북구','수유2동\r\n');
INSERT INTO postno VALUES (1556,'142-073','서울시','강북구','수유3동\r\n');
INSERT INTO postno VALUES (1557,'142-074','서울시','강북구','수유4동\r\n');
INSERT INTO postno VALUES (1558,'142-075','서울시','강북구','수유5동\r\n');
INSERT INTO postno VALUES (1559,'142-076','서울시','강북구','수유5동\r\n');
INSERT INTO postno VALUES (1560,'142-090','서울시','강북구','우이동\r\n');
INSERT INTO postno VALUES (1561,'142-100','서울시','강북구','미아동\r\n');
INSERT INTO postno VALUES (1562,'142-101','서울시','강북구','미아1동\r\n');
INSERT INTO postno VALUES (1563,'142-102','서울시','강북구','미아2동\r\n');
INSERT INTO postno VALUES (1564,'142-103','서울시','강북구','미아3동\r\n');
INSERT INTO postno VALUES (1565,'142-104','서울시','강북구','미아4동\r\n');
INSERT INTO postno VALUES (1566,'142-105','서울시','강북구','미아5동\r\n');
INSERT INTO postno VALUES (1567,'142-106','서울시','강북구','미아6동\r\n');
INSERT INTO postno VALUES (1568,'142-107','서울시','강북구','미아7동\r\n');
INSERT INTO postno VALUES (1569,'142-108','서울시','강북구','미아8동\r\n');
INSERT INTO postno VALUES (1570,'142-109','서울시','강북구','미아9동\r\n');
INSERT INTO postno VALUES (1571,'142-701','서울시','강북구','수유3동 강북구청\r\n');
INSERT INTO postno VALUES (1572,'142-702','서울시','강북구','미아8동 도봉세무서\r\n');
INSERT INTO postno VALUES (1573,'142-703','서울시','강북구','번1동 가든타워빌딩\r\n');
INSERT INTO postno VALUES (1574,'142-704','서울시','강북구','미아9동 성바오로딸수도\r\n');
INSERT INTO postno VALUES (1575,'142-705','서울시','강북구','번2동 도봉전자공단\r\n');
INSERT INTO postno VALUES (1576,'142-706','서울시','강북구','번3동 도봉봉제공단\r\n');
INSERT INTO postno VALUES (1577,'142-751','서울시','강북구','미아4동 미아아파트\r\n');
INSERT INTO postno VALUES (1578,'142-761','서울시','강북구','번3동 주공아파트1단지\r\n');
INSERT INTO postno VALUES (1579,'142-762','서울시','강북구','번3동 주공아파트2단지\r\n');
INSERT INTO postno VALUES (1580,'142-763','서울시','강북구','번3동 주공아파트3단지\r\n');
INSERT INTO postno VALUES (1581,'142-764','서울시','강북구','번2동 주공아파트4단지\r\n');
INSERT INTO postno VALUES (1582,'142-765','서울시','강북구','번2동 주공아파트5단지\r\n');
INSERT INTO postno VALUES (1583,'142-771','서울시','강북구','수유2동 벽산아파트\r\n');
INSERT INTO postno VALUES (1584,'142-781','서울시','강북구','수유6동 극동아파트\r\n');
INSERT INTO postno VALUES (1585,'142-791','서울시','강북구','한신대학신학대학원\r\n');
INSERT INTO postno VALUES (1586,'143-130','서울시','광진구','화양동\r\n');
INSERT INTO postno VALUES (1587,'143-140','서울시','광진구','모진동\r\n');
INSERT INTO postno VALUES (1588,'143-150','서울시','광진구','군자동\r\n');
INSERT INTO postno VALUES (1589,'143-180','서울시','광진구','능동\r\n');
INSERT INTO postno VALUES (1590,'143-190','서울시','광진구','자양동\r\n');
INSERT INTO postno VALUES (1591,'143-191','서울시','광진구','자양1동\r\n');
INSERT INTO postno VALUES (1592,'143-192','서울시','광진구','자양2동\r\n');
INSERT INTO postno VALUES (1593,'143-193','서울시','광진구','자양3동\r\n');
INSERT INTO postno VALUES (1594,'143-200','서울시','광진구','구의동\r\n');
INSERT INTO postno VALUES (1595,'143-201','서울시','광진구','구의1동\r\n');
INSERT INTO postno VALUES (1596,'143-202','서울시','광진구','구의2동\r\n');
INSERT INTO postno VALUES (1597,'143-203','서울시','광진구','구의3동\r\n');
INSERT INTO postno VALUES (1598,'143-210','서울시','광진구','광장동\r\n');
INSERT INTO postno VALUES (1599,'143-220','서울시','광진구','중곡동\r\n');
INSERT INTO postno VALUES (1600,'143-221','서울시','광진구','중곡1동\r\n');
INSERT INTO postno VALUES (1601,'143-222','서울시','광진구','중곡2동\r\n');
INSERT INTO postno VALUES (1602,'143-223','서울시','광진구','중곡3동\r\n');
INSERT INTO postno VALUES (1603,'143-224','서울시','광진구','중곡4동\r\n');
INSERT INTO postno VALUES (1604,'143-300','서울시','광진구','노유동\r\n');
INSERT INTO postno VALUES (1605,'143-301','서울시','광진구','노유1동\r\n');
INSERT INTO postno VALUES (1606,'143-302','서울시','광진구','노유2동\r\n');
INSERT INTO postno VALUES (1607,'143-701','서울시','광진구','모진동 건국대학교\r\n');
INSERT INTO postno VALUES (1608,'143-702','서울시','광진구','자양1동 광진구청\r\n');
INSERT INTO postno VALUES (1609,'143-703','서울시','광진구','구의1동 동부경찰서\r\n');
INSERT INTO postno VALUES (1610,'143-704','서울시','광진구','서울지방검찰청동부지청\r\n');
INSERT INTO postno VALUES (1611,'143-705','서울시','광진구','서울지방법원동부지원\r\n');
INSERT INTO postno VALUES (1612,'143-706','서울시','광진구','화양동 성수세무서\r\n');
INSERT INTO postno VALUES (1613,'143-704','서울시','광진구','한국통신서울사업본부\r\n');
INSERT INTO postno VALUES (1614,'143-708','서울시','광진구','광장동 위커힐호텔\r\n');
INSERT INTO postno VALUES (1615,'143-709','서울시','광진구','구의3동 리젠트오피스텔\r\n');
INSERT INTO postno VALUES (1616,'143-710','서울시','광진구','구의3동 방지거병원\r\n');
INSERT INTO postno VALUES (1617,'143-711','서울시','광진구','중곡3동 국립정신병원\r\n');
INSERT INTO postno VALUES (1618,'143-715','서울시','광진구','구의3동 동서울터미날빌딩\r\n');
INSERT INTO postno VALUES (1619,'143-747','서울시','광진구','군자동 세종대학교\r\n');
INSERT INTO postno VALUES (1620,'143-751','서울시','광진구','광장동 극동1차아파트\r\n');
INSERT INTO postno VALUES (1621,'143-751','서울시','광진구','광장동 극동2차아파트\r\n');
INSERT INTO postno VALUES (1622,'143-752','서울시','광진구','광장동 워커힐아파트\r\n');
INSERT INTO postno VALUES (1623,'143-753','서울시','광진구','광장동 광나루현대아파트\r\n');
INSERT INTO postno VALUES (1624,'143-754','서울시','광진구','광장동 현대3차아파트\r\n');
INSERT INTO postno VALUES (1625,'143-755','서울시','광진구','광장동 현대5차아파트\r\n');
INSERT INTO postno VALUES (1626,'143-756','서울시','광진구','광장동 장로회신학대학\r\n');
INSERT INTO postno VALUES (1627,'143-760','서울시','광진구','구의3동 현대2차아파트\r\n');
INSERT INTO postno VALUES (1628,'143-760','서울시','광진구','구의3동 현대6차아파트\r\n');
INSERT INTO postno VALUES (1629,'143-766','서울시','광진구','정보통신부전산관리소\r\n');
INSERT INTO postno VALUES (1630,'143-771','서울시','광진구','자양2동 한양아파트\r\n');
INSERT INTO postno VALUES (1631,'143-772','서울시','광진구','자양2동 현대1차아파트\r\n');
INSERT INTO postno VALUES (1632,'143-772','서울시','광진구','자양2동 현대2차아파트\r\n');
INSERT INTO postno VALUES (1633,'143-772','서울시','광진구','자양2동 현대3차아파트\r\n');
INSERT INTO postno VALUES (1634,'143-773','서울시','광진구','자양3동 우성1차아파트\r\n');
INSERT INTO postno VALUES (1635,'143-773','서울시','광진구','자양3동 우성2차아파트\r\n');
INSERT INTO postno VALUES (1636,'143-773','서울시','광진구','자양3동 우성3차아파트\r\n');
INSERT INTO postno VALUES (1637,'143-773','서울시','광진구','자양3동 우성4차아파트\r\n');
INSERT INTO postno VALUES (1638,'143-773','서울시','광진구','자양3동 우성5차아파트\r\n');
INSERT INTO postno VALUES (1639,'143-773','서울시','광진구','자양3동 우성6차아파트\r\n');
INSERT INTO postno VALUES (1640,'150-010','서울시','영등포구','여의도동\r\n');
INSERT INTO postno VALUES (1641,'150-020','서울시','영등포구','영등포동\r\n');
INSERT INTO postno VALUES (1642,'150-031','서울시','영등포구','영등포동1가\r\n');
INSERT INTO postno VALUES (1643,'150-032','서울시','영등포구','영등포동2가\r\n');
INSERT INTO postno VALUES (1644,'150-033','서울시','영등포구','영등포동3가\r\n');
INSERT INTO postno VALUES (1645,'150-034','서울시','영등포구','영등포동4가\r\n');
INSERT INTO postno VALUES (1646,'150-035','서울시','영등포구','영등포동5가\r\n');
INSERT INTO postno VALUES (1647,'150-036','서울시','영등포구','영등포동6가\r\n');
INSERT INTO postno VALUES (1648,'150-037','서울시','영등포구','영등포동7가\r\n');
INSERT INTO postno VALUES (1649,'150-038','서울시','영등포구','영등포동8가\r\n');
INSERT INTO postno VALUES (1650,'150-040','서울시','영등포구','당산동\r\n');
INSERT INTO postno VALUES (1651,'150-041','서울시','영등포구','당산동1가\r\n');
INSERT INTO postno VALUES (1652,'150-042','서울시','영등포구','당산동2가\r\n');
INSERT INTO postno VALUES (1653,'150-043','서울시','영등포구','당산동3가\r\n');
INSERT INTO postno VALUES (1654,'150-044','서울시','영등포구','당산동4가\r\n');
INSERT INTO postno VALUES (1655,'150-045','서울시','영등포구','당산동5가\r\n');
INSERT INTO postno VALUES (1656,'150-046','서울시','영등포구','당산동6가\r\n');
INSERT INTO postno VALUES (1657,'150-050','서울시','영등포구','신길동\r\n');
INSERT INTO postno VALUES (1658,'150-051','서울시','영등포구','신길1동\r\n');
INSERT INTO postno VALUES (1659,'150-052','서울시','영등포구','신길2동\r\n');
INSERT INTO postno VALUES (1660,'150-053','서울시','영등포구','신길3동\r\n');
INSERT INTO postno VALUES (1661,'150-054','서울시','영등포구','신길4동\r\n');
INSERT INTO postno VALUES (1662,'150-055','서울시','영등포구','신길5동\r\n');
INSERT INTO postno VALUES (1663,'150-056','서울시','영등포구','신길6동\r\n');
INSERT INTO postno VALUES (1664,'150-057','서울시','영등포구','신길7동\r\n');
INSERT INTO postno VALUES (1665,'150-070','서울시','영등포구','대림동\r\n');
INSERT INTO postno VALUES (1666,'150-071','서울시','영등포구','대림1동\r\n');
INSERT INTO postno VALUES (1667,'150-072','서울시','영등포구','대림2동\r\n');
INSERT INTO postno VALUES (1668,'150-073','서울시','영등포구','대림3동\r\n');
INSERT INTO postno VALUES (1669,'150-080','서울시','영등포구','도림동\r\n');
INSERT INTO postno VALUES (1670,'150-081','서울시','영등포구','도림1동\r\n');
INSERT INTO postno VALUES (1671,'150-082','서울시','영등포구','도림2동\r\n');
INSERT INTO postno VALUES (1672,'150-091','서울시','영등포구','문래동\r\n');
INSERT INTO postno VALUES (1673,'150-091','서울시','영등포구','문래동1가\r\n');
INSERT INTO postno VALUES (1674,'150-092','서울시','영등포구','문래동2가\r\n');
INSERT INTO postno VALUES (1675,'150-093','서울시','영등포구','문래동3가\r\n');
INSERT INTO postno VALUES (1676,'150-094','서울시','영등포구','문래동4가\r\n');
INSERT INTO postno VALUES (1677,'150-095','서울시','영등포구','문래동5가\r\n');
INSERT INTO postno VALUES (1678,'150-096','서울시','영등포구','문래동6가\r\n');
INSERT INTO postno VALUES (1679,'150-100','서울시','영등포구','양평동\r\n');
INSERT INTO postno VALUES (1680,'150-101','서울시','영등포구','양평동1가\r\n');
INSERT INTO postno VALUES (1681,'150-102','서울시','영등포구','양평동2가\r\n');
INSERT INTO postno VALUES (1682,'150-103','서울시','영등포구','양평동3가\r\n');
INSERT INTO postno VALUES (1683,'150-104','서울시','영등포구','양평동4가\r\n');
INSERT INTO postno VALUES (1684,'150-105','서울시','영등포구','양평동5가\r\n');
INSERT INTO postno VALUES (1685,'150-106','서울시','영등포구','양평동6가\r\n');
INSERT INTO postno VALUES (1686,'150-110','서울시','영등포구','양화동\r\n');
INSERT INTO postno VALUES (1687,'150-600','서울시','영등포구','여의도우체국사서함0001-\r\n');
INSERT INTO postno VALUES (1688,'150-601','서울시','영등포구','여의도우체국사서함0100-\r\n');
INSERT INTO postno VALUES (1689,'150-602','서울시','영등포구','여의도우체국사서함0200-\r\n');
INSERT INTO postno VALUES (1690,'150-603','서울시','영등포구','여의도우체국사서함0300-\r\n');
INSERT INTO postno VALUES (1691,'150-604','서울시','영등포구','여의도우체국사서함0400-\r\n');
INSERT INTO postno VALUES (1692,'150-605','서울시','영등포구','여의도우체국사서함0500-\r\n');
INSERT INTO postno VALUES (1693,'150-606','서울시','영등포구','여의도우체국사서함0600-\r\n');
INSERT INTO postno VALUES (1694,'150-607','서울시','영등포구','여의도우체국사서함0700-\r\n');
INSERT INTO postno VALUES (1695,'150-608','서울시','영등포구','여의도우체국사서함0800-\r\n');
INSERT INTO postno VALUES (1696,'150-609','서울시','영등포구','여의도우체국사서함0900-\r\n');
INSERT INTO postno VALUES (1697,'150-610','서울시','영등포구','여의도우체국사서함1000-\r\n');
INSERT INTO postno VALUES (1698,'150-611','서울시','영등포구','여의도우체국사서함1100-\r\n');
INSERT INTO postno VALUES (1699,'150-612','서울시','영등포구','여의도우체국사서함1200-\r\n');
INSERT INTO postno VALUES (1700,'150-650','서울시','영등포구','영등포우체국사서함\r\n');
INSERT INTO postno VALUES (1701,'150-701','서울시','영등포구','여의도동 국회\r\n');
INSERT INTO postno VALUES (1702,'150-702','서울시','영등포구','여의도동 국회의원회관\r\n');
INSERT INTO postno VALUES (1703,'150-703','서울시','영등포구','여의도동 국회도서관\r\n');
INSERT INTO postno VALUES (1704,'150-704','서울시','영등포구','여의도동 교원공제빌딩\r\n');
INSERT INTO postno VALUES (1705,'150-705','서울시','영등포구','대한투자신탁빌딩\r\n');
INSERT INTO postno VALUES (1706,'150-706','서울시','영등포구','여의도동 기아빌딩\r\n');
INSERT INTO postno VALUES (1707,'150-707','서울시','영등포구','여의도동 동양증권빌딩\r\n');
INSERT INTO postno VALUES (1708,'150-708','서울시','영등포구','여의도동 동화빌딩\r\n');
INSERT INTO postno VALUES (1709,'150-709','서울시','영등포구','여의도동 보람증권빌딩\r\n');
INSERT INTO postno VALUES (1710,'150-710','서울시','영등포구','여의도동 서울증권빌딩\r\n');
INSERT INTO postno VALUES (1711,'150-711','서울시','영등포구','여의도동 신송센타빌딩\r\n');
INSERT INTO postno VALUES (1712,'150-712','서울시','영등포구','여의도동 쌍용증권빌딩\r\n');
INSERT INTO postno VALUES (1713,'150-713','서울시','영등포구','여의도동 여의도성모병원\r\n');
INSERT INTO postno VALUES (1714,'150-714','서울시','영등포구','여의도동 대영빌딩\r\n');
INSERT INTO postno VALUES (1715,'150-715','서울시','영등포구','여의도동 대하빌딩\r\n');
INSERT INTO postno VALUES (1716,'150-716','서울시','영등포구','여의도동 대우증권빌딩\r\n');
INSERT INTO postno VALUES (1717,'150-717','서울시','영등포구','여의도동 제일증권빌딩\r\n');
INSERT INTO postno VALUES (1718,'150-716','서울시','영등포구','중소기업진흥공단\r\n');
INSERT INTO postno VALUES (1719,'150-719','서울시','영등포구','여의도동 한강성심병원\r\n');
INSERT INTO postno VALUES (1720,'150-720','서울시','영등포구','당산동3가 영등포구청\r\n');
INSERT INTO postno VALUES (1721,'150-720','서울시','영등포구','영등포구청  보건소\r\n');
INSERT INTO postno VALUES (1722,'150-721','서울시','영등포구','여의도동 LG트윈타워빌딩\r\n');
INSERT INTO postno VALUES (1723,'150-723','서울시','영등포구','영등포유통상가\r\n');
INSERT INTO postno VALUES (1724,'150-724','서울시','영등포구','여의도동 고려증권빌딩\r\n');
INSERT INTO postno VALUES (1725,'150-725','서울시','영등포구','국민투자신탁빌딩\r\n');
INSERT INTO postno VALUES (1726,'150-726','서울시','영등포구','극동오피스텔빌딩\r\n');
INSERT INTO postno VALUES (1727,'150-727','서울시','영등포구','여의도동 금산빌딩\r\n');
INSERT INTO postno VALUES (1728,'150-728','서울시','영등포구','여의도동 문화방송국건물\r\n');
INSERT INTO postno VALUES (1729,'150-729','서울시','영등포구','여의도동 기계공업진흥회\r\n');
INSERT INTO postno VALUES (1730,'150-730','서울시','영등포구','여의도동 동서증권빌딩\r\n');
INSERT INTO postno VALUES (1731,'150-731','서울시','영등포구','라이프오피스텔빌딩\r\n');
INSERT INTO postno VALUES (1732,'150-732','서울시','영등포구','여의도동 라이프콤비빌딩\r\n');
INSERT INTO postno VALUES (1733,'150-733','서울시','영등포구','여의도동 미원빌딩\r\n');
INSERT INTO postno VALUES (1734,'150-734','서울시','영등포구','여의도동 선경증권빌딩\r\n');
INSERT INTO postno VALUES (1735,'150-736','서울시','영등포구','여의도동 신한빌딩\r\n');
INSERT INTO postno VALUES (1736,'150-737','서울시','영등포구','여의도동 유공빌딩\r\n');
INSERT INTO postno VALUES (1737,'150-738','서울시','영등포구','여의도동 유화증권빌딩\r\n');
INSERT INTO postno VALUES (1738,'150-739','서울시','영등포구','여의도동 정우빌딩\r\n');
INSERT INTO postno VALUES (1739,'150-740','서울시','영등포구','여의도동 중소기업중앙회\r\n');
INSERT INTO postno VALUES (1740,'150-741','서울시','영등포구','여의도동 중앙빌딩\r\n');
INSERT INTO postno VALUES (1741,'150-742','서울시','영등포구','여의도동 사학연금빌딩\r\n');
INSERT INTO postno VALUES (1742,'150-743','서울시','영등포구','여의도동 증권감독원빌딩\r\n');
INSERT INTO postno VALUES (1743,'150-744','서울시','영등포구','여의도동 하남빌딩\r\n');
INSERT INTO postno VALUES (1744,'150-745','서울시','영등포구','한국투자신탁빌딩\r\n');
INSERT INTO postno VALUES (1745,'150-746','서울시','영등포구','한서오피스텔빌딩\r\n');
INSERT INTO postno VALUES (1746,'150-747','서울시','영등포구','여의도동 동원증권빌딩\r\n');
INSERT INTO postno VALUES (1747,'150-748','서울시','영등포구','여의도동 한양빌딩\r\n');
INSERT INTO postno VALUES (1748,'150-749','서울시','영등포구','여의도백화점건물\r\n');
INSERT INTO postno VALUES (1749,'150-751','서울시','영등포구','양평동5가 한신아파트\r\n');
INSERT INTO postno VALUES (1750,'150-756','서울시','영등포구','전국경제인연합회빌딩\r\n');
INSERT INTO postno VALUES (1751,'150-757','서울시','영등포구','장기신용은행빌딩\r\n');
INSERT INTO postno VALUES (1752,'150-758','서울시','영등포구','여의도동 주택은행빌딩\r\n');
INSERT INTO postno VALUES (1753,'150-761','서울시','영등포구','여의도시범아파트\r\n');
INSERT INTO postno VALUES (1754,'150-763','서울시','영등포구','여의도동 63대한생명빌딩\r\n');
INSERT INTO postno VALUES (1755,'150-777','서울시','영등포구','여의도동 태영빌딩\r\n');
INSERT INTO postno VALUES (1756,'150-777','서울시','영등포구','여의도동 서울방송\r\n');
INSERT INTO postno VALUES (1757,'150-790','서울시','영등포구','한국방송공사건물\r\n');
INSERT INTO postno VALUES (1758,'151-010','서울시','관악구','신림동\r\n');
INSERT INTO postno VALUES (1759,'151-011','서울시','관악구','신림1동\r\n');
INSERT INTO postno VALUES (1760,'151-012','서울시','관악구','신림2동\r\n');
INSERT INTO postno VALUES (1761,'151-013','서울시','관악구','신림3동\r\n');
INSERT INTO postno VALUES (1762,'151-014','서울시','관악구','신림4동\r\n');
INSERT INTO postno VALUES (1763,'151-015','서울시','관악구','신림5동\r\n');
INSERT INTO postno VALUES (1764,'151-016','서울시','관악구','신림6동\r\n');
INSERT INTO postno VALUES (1765,'151-017','서울시','관악구','신림7동\r\n');
INSERT INTO postno VALUES (1766,'151-018','서울시','관악구','신림8동\r\n');
INSERT INTO postno VALUES (1767,'151-019','서울시','관악구','신림9동\r\n');
INSERT INTO postno VALUES (1768,'151-020','서울시','관악구','신림10동\r\n');
INSERT INTO postno VALUES (1769,'151-021','서울시','관악구','신림11동\r\n');
INSERT INTO postno VALUES (1770,'151-022','서울시','관악구','신림12동\r\n');
INSERT INTO postno VALUES (1771,'151-023','서울시','관악구','신림13동\r\n');
INSERT INTO postno VALUES (1772,'151-029','서울시','관악구','신림본동\r\n');
INSERT INTO postno VALUES (1773,'151-050','서울시','관악구','봉천동\r\n');
INSERT INTO postno VALUES (1774,'151-051','서울시','관악구','봉천1동\r\n');
INSERT INTO postno VALUES (1775,'151-052','서울시','관악구','봉천2동\r\n');
INSERT INTO postno VALUES (1776,'151-053','서울시','관악구','봉천3동\r\n');
INSERT INTO postno VALUES (1777,'151-054','서울시','관악구','봉천4동\r\n');
INSERT INTO postno VALUES (1778,'151-055','서울시','관악구','봉천5동\r\n');
INSERT INTO postno VALUES (1779,'151-056','서울시','관악구','봉천6동\r\n');
INSERT INTO postno VALUES (1780,'151-057','서울시','관악구','봉천7동\r\n');
INSERT INTO postno VALUES (1781,'151-058','서울시','관악구','봉천8동\r\n');
INSERT INTO postno VALUES (1782,'151-059','서울시','관악구','봉천9동\r\n');
INSERT INTO postno VALUES (1783,'151-060','서울시','관악구','봉천10동\r\n');
INSERT INTO postno VALUES (1784,'151-061','서울시','관악구','봉천11동\r\n');
INSERT INTO postno VALUES (1785,'151-069','서울시','관악구','봉천본동\r\n');
INSERT INTO postno VALUES (1786,'151-080','서울시','관악구','남현동\r\n');
INSERT INTO postno VALUES (1787,'151-600','서울시','관악구','서울관악우체국사서함\r\n');
INSERT INTO postno VALUES (1788,'151-701','서울시','관악구','봉천4동 관악구청\r\n');
INSERT INTO postno VALUES (1789,'151-702','서울시','관악구','봉천4동 관악경찰서\r\n');
INSERT INTO postno VALUES (1790,'151-703','서울시','관악구','신림8동 남부경찰서\r\n');
INSERT INTO postno VALUES (1791,'151-704','서울시','관악구','신림1동 관악세무서\r\n');
INSERT INTO postno VALUES (1792,'151-705','서울시','관악구','신림8동 구로전화국\r\n');
INSERT INTO postno VALUES (1793,'151-706','서울시','관악구','봉천1동 대교빌딩\r\n');
INSERT INTO postno VALUES (1794,'151-707','서울시','관악구','롯데스카이라운지빌딩\r\n');
INSERT INTO postno VALUES (1795,'151-708','서울시','관악구','신림5동 우성복합오피스텔\r\n');
INSERT INTO postno VALUES (1796,'151-709','서울시','관악구','이동통신(주)서울지사\r\n');
INSERT INTO postno VALUES (1797,'151-710','서울시','관악구','신림동주상복합빌딩\r\n');
INSERT INTO postno VALUES (1798,'151-711','서울시','관악구','청암인터그린타워빌딩\r\n');
INSERT INTO postno VALUES (1799,'151-712','서울시','관악구','해태보라매주상타운\r\n');
INSERT INTO postno VALUES (1800,'151-713','서울시','관악구','봉천7동 범우빌딩\r\n');
INSERT INTO postno VALUES (1801,'151-714','서울시','관악구','봉천7동 평창빌딩\r\n');
INSERT INTO postno VALUES (1802,'151-715','서울시','관악구','신림4동 관악의료보험조합\r\n');
INSERT INTO postno VALUES (1803,'151-742','서울시','관악구','신림9동 서울대학교\r\n');
INSERT INTO postno VALUES (1804,'151-751','서울시','관악구','봉천1동 보라매우성아파트\r\n');
INSERT INTO postno VALUES (1805,'151-752','서울시','관악구','봉천1동 삼성아파트\r\n');
INSERT INTO postno VALUES (1806,'151-753','서울시','관악구','봉천1동 해바라기아파트\r\n');
INSERT INTO postno VALUES (1807,'151-755','서울시','관악구','봉천3동 관악현대아파트\r\n');
INSERT INTO postno VALUES (1808,'151-761','서울시','관악구','신림2동 신림2동현대아파트\r\n');
INSERT INTO postno VALUES (1809,'151-765','서울시','관악구','신림9동 건영3차아파트\r\n');
INSERT INTO postno VALUES (1810,'151-767','서울시','관악구','신림10동 국제산장아파트\r\n');
INSERT INTO postno VALUES (1811,'151-771','서울시','관악구','신림11동 건영1차아파트\r\n');
INSERT INTO postno VALUES (1812,'151-772','서울시','관악구','신림11동 미도아파트\r\n');
INSERT INTO postno VALUES (1813,'151-773','서울시','관악구','신림11동 라이프주택아파트\r\n');
INSERT INTO postno VALUES (1814,'152-020','서울시','구로구','가리봉동\r\n');
INSERT INTO postno VALUES (1815,'152-021','서울시','구로구','가리봉1동\r\n');
INSERT INTO postno VALUES (1816,'152-022','서울시','구로구','가리봉2동\r\n');
INSERT INTO postno VALUES (1817,'152-050','서울시','구로구','구로동\r\n');
INSERT INTO postno VALUES (1818,'152-051','서울시','구로구','구로1동\r\n');
INSERT INTO postno VALUES (1819,'152-052','서울시','구로구','구로2동\r\n');
INSERT INTO postno VALUES (1820,'152-053','서울시','구로구','구로3동\r\n');
INSERT INTO postno VALUES (1821,'152-054','서울시','구로구','구로4동\r\n');
INSERT INTO postno VALUES (1822,'152-055','서울시','구로구','구로5동\r\n');
INSERT INTO postno VALUES (1823,'152-056','서울시','구로구','구로6동\r\n');
INSERT INTO postno VALUES (1824,'152-059','서울시','구로구','구로본동\r\n');
INSERT INTO postno VALUES (1825,'152-070','서울시','구로구','신도림동\r\n');
INSERT INTO postno VALUES (1826,'152-080','서울시','구로구','고척동\r\n');
INSERT INTO postno VALUES (1827,'152-081','서울시','구로구','고척1동\r\n');
INSERT INTO postno VALUES (1828,'152-082','서울시','구로구','고척2동\r\n');
INSERT INTO postno VALUES (1829,'152-090','서울시','구로구','개봉동\r\n');
INSERT INTO postno VALUES (1830,'152-091','서울시','구로구','개봉1동\r\n');
INSERT INTO postno VALUES (1831,'152-092','서울시','구로구','개봉2동\r\n');
INSERT INTO postno VALUES (1832,'152-093','서울시','구로구','개봉3동\r\n');
INSERT INTO postno VALUES (1833,'152-099','서울시','구록구','개봉본동\r\n');
INSERT INTO postno VALUES (1834,'152-100','서울시','구로구','오류동\r\n');
INSERT INTO postno VALUES (1835,'152-101','서울시','구로구','오류1동\r\n');
INSERT INTO postno VALUES (1836,'152-102','서울시','구로구','오류2동\r\n');
INSERT INTO postno VALUES (1837,'152-110','서울시','구로구','궁동\r\n');
INSERT INTO postno VALUES (1838,'152-120','서울시','구로구','온수동\r\n');
INSERT INTO postno VALUES (1839,'152-130','서울시','구로구','천왕동\r\n');
INSERT INTO postno VALUES (1840,'152-140','서울시','구로구','항동\r\n');
INSERT INTO postno VALUES (1841,'152-600','서울시','구로구','서울구로우체국사서함\r\n');
INSERT INTO postno VALUES (1842,'152-650','서울시','구로구','구로단지우체국사서함\r\n');
INSERT INTO postno VALUES (1843,'152-701','서울시','구로구','구로5동 구로구청\r\n');
INSERT INTO postno VALUES (1844,'152-702','서울시','구로구','구로5동 구로경찰서\r\n');
INSERT INTO postno VALUES (1845,'152-703','서울시','구로구','구로2동 고대구로병원\r\n');
INSERT INTO postno VALUES (1846,'152-704','서울시','구로구','구로5동 공중전화빌딩\r\n');
INSERT INTO postno VALUES (1847,'152-705','서울시','구로구','구로5동 동남오피스텔\r\n');
INSERT INTO postno VALUES (1848,'152-706','서울시','구로구','온수동 교동안전공단\r\n');
INSERT INTO postno VALUES (1849,'152-714','서울시','구로구','고척1동 동양공업전문대학\r\n');
INSERT INTO postno VALUES (1850,'152-715','서울시','구로구','구로5동 애경백화점\r\n');
INSERT INTO postno VALUES (1851,'152-716','서울시','구로구','천왕동 성공회대학교\r\n');
INSERT INTO postno VALUES (1852,'152-751','서울시','구로구','개봉1동 거성1차아파트\r\n');
INSERT INTO postno VALUES (1853,'152-751','서울시','구로구','개봉1동 거성2차아파트\r\n');
INSERT INTO postno VALUES (1854,'152-753','서울시','구로구','개봉2동 삼환아파트\r\n');
INSERT INTO postno VALUES (1855,'152-761','서울시','구로구','구로1동 구로주공아파트\r\n');
INSERT INTO postno VALUES (1856,'152-762','서울시','구로구','구로1동 중앙하이츠아파트\r\n');
INSERT INTO postno VALUES (1857,'152-771','서울시','구로구','신도림동 미성아파트\r\n');
INSERT INTO postno VALUES (1858,'152-772','서울시','구로구','신도림동 우성아파트\r\n');
INSERT INTO postno VALUES (1859,'152-781','서울시','구로구','오류2동 현대아파트\r\n');
INSERT INTO postno VALUES (1860,'152-782','서울시','구로구','오류2동 홍진아파트\r\n');
INSERT INTO postno VALUES (1861,'152-791','서울시','구로구','온수동 온수연립\r\n');
INSERT INTO postno VALUES (1862,'152-792','서울시','구로구','온수동 우신빌라\r\n');
INSERT INTO postno VALUES (1863,'153-010','서울시','금천구','독산동\r\n');
INSERT INTO postno VALUES (1864,'153-011','서울시','금천구','독산1동\r\n');
INSERT INTO postno VALUES (1865,'153-012','서울시','금천구','독산2동\r\n');
INSERT INTO postno VALUES (1866,'153-013','서울시','금천구','독산3동\r\n');
INSERT INTO postno VALUES (1867,'153-014','서울시','금천구','독산4동\r\n');
INSERT INTO postno VALUES (1868,'153-019','서울시','금천구','독산본동\r\n');
INSERT INTO postno VALUES (1869,'153-023','서울시','금천구','가산동\r\n');
INSERT INTO postno VALUES (1870,'153-030','서울시','금천구','시흥동\r\n');
INSERT INTO postno VALUES (1871,'153-031','서울시','금천구','시흥1동\r\n');
INSERT INTO postno VALUES (1872,'153-032','서울시','금천구','시흥2동\r\n');
INSERT INTO postno VALUES (1873,'153-033','서울시','금천구','시흥3동\r\n');
INSERT INTO postno VALUES (1874,'153-034','서울시','금천구','시흥4동\r\n');
INSERT INTO postno VALUES (1875,'153-035','서울시','금천구','시흥5동\r\n');
INSERT INTO postno VALUES (1876,'153-039','서울시','금천구','시흥본동\r\n');
INSERT INTO postno VALUES (1877,'153-701','서울시','금천구','시흥본동 금천구청\r\n');
INSERT INTO postno VALUES (1878,'153-703','서울시','금천구','독산본동 금천세무서\r\n');
INSERT INTO postno VALUES (1879,'153-751','서울시','금천구','독산1동 주공아파트13단지\r\n');
INSERT INTO postno VALUES (1880,'153-752','서울시','금천구','독산1동 주공아파트14단지\r\n');
INSERT INTO postno VALUES (1881,'153-753','서울시','금천구','독산1동 독산한신아파트\r\n');
INSERT INTO postno VALUES (1882,'153-761','서울시','금천구','시흥1동 럭키아파트\r\n');
INSERT INTO postno VALUES (1883,'153-762','서울시','금천구','시흥1동 무지개아파트\r\n');
INSERT INTO postno VALUES (1884,'153-763','서울시','금천구','시흥1동 한양아파트\r\n');
INSERT INTO postno VALUES (1885,'156-010','서울시','동작구','신대방\r\n');
INSERT INTO postno VALUES (1886,'156-011','서울시','동작구','신대방1동\r\n');
INSERT INTO postno VALUES (1887,'156-012','서울시','동작구','신대방2동\r\n');
INSERT INTO postno VALUES (1888,'156-020','서울시','동작구','대방동\r\n');
INSERT INTO postno VALUES (1889,'156-030','서울시','동작구','상도동\r\n');
INSERT INTO postno VALUES (1890,'156-031','서울시','동작구','상도1동\r\n');
INSERT INTO postno VALUES (1891,'156-032','서울시','동작구','상도2동\r\n');
INSERT INTO postno VALUES (1892,'156-033','서울시','동작구','상도3동\r\n');
INSERT INTO postno VALUES (1893,'156-034','서울시','동작구','상도4동\r\n');
INSERT INTO postno VALUES (1894,'156-035','서울시','동작구','상도5동\r\n');
INSERT INTO postno VALUES (1895,'156-050','서울시','동작구','노량진동\r\n');
INSERT INTO postno VALUES (1896,'156-051','서울시','동작구','노량진1동\r\n');
INSERT INTO postno VALUES (1897,'156-052','서울시','동작구','노량진2동\r\n');
INSERT INTO postno VALUES (1898,'156-060','서울시','동작구','본동\r\n');
INSERT INTO postno VALUES (1899,'156-070','서울시','동작구','흑석동\r\n');
INSERT INTO postno VALUES (1900,'156-071','서울시','동작구','흑석1동\r\n');
INSERT INTO postno VALUES (1901,'156-072','서울시','동작구','흑석2동\r\n');
INSERT INTO postno VALUES (1902,'156-073','서울시','동작구','흑석3동\r\n');
INSERT INTO postno VALUES (1903,'156-080','서울시','동작구','동작동\r\n');
INSERT INTO postno VALUES (1904,'156-090','서울시','동작구','사당동\r\n');
INSERT INTO postno VALUES (1905,'156-091','서울시','동작구','사당1동\r\n');
INSERT INTO postno VALUES (1906,'156-092','서울시','동작구','사당2동\r\n');
INSERT INTO postno VALUES (1907,'156-093','서울시','동작구','사당3동\r\n');
INSERT INTO postno VALUES (1908,'156-094','서울시','동작구','사당4동\r\n');
INSERT INTO postno VALUES (1909,'156-095','서울시','동작구','사당5동\r\n');
INSERT INTO postno VALUES (1910,'156-600','서울시','동작구','서울동작우체국사서함\r\n');
INSERT INTO postno VALUES (1911,'156-701','서울시','동작구','노량진2동 동작구청\r\n');
INSERT INTO postno VALUES (1912,'156-702','서울시','동작구','노량진2동 노량진경찰서\r\n');
INSERT INTO postno VALUES (1913,'156-703','서울시','동작구','노량진1동 노량진수산시장\r\n');
INSERT INTO postno VALUES (1914,'156-704','서울시','동작구','대방동 조선무약빌딩\r\n');
INSERT INTO postno VALUES (1915,'156-705','서울시','동작구','사당1동 쌍립빌딩\r\n');
INSERT INTO postno VALUES (1916,'156-706','서울시','동작구','신대방1동 대한광업(주)\r\n');
INSERT INTO postno VALUES (1917,'156-707','서울시','동작구','신대방1동 시립보라매병원\r\n');
INSERT INTO postno VALUES (1918,'156-708','서울시','동작구','신대방1동 언더우드빌딩\r\n');
INSERT INTO postno VALUES (1919,'156-709','서울시','동작구','신대방2동 농심사옥\r\n');
INSERT INTO postno VALUES (1920,'156-710','서울시','동작구','신대방2동 보라매나산스위\r\n');
INSERT INTO postno VALUES (1921,'156-711','서울시','동작구','신대방2동 롯데관악타워\r\n');
INSERT INTO postno VALUES (1922,'156-712','서울시','동작구','삼성신대방주상복합빌딩\r\n');
INSERT INTO postno VALUES (1923,'156-743','서울시','동작구','상도5동 숭실대학교\r\n');
INSERT INTO postno VALUES (1924,'156-751','서울시','동작구','노량진1동 우성아파트\r\n');
INSERT INTO postno VALUES (1925,'156-754','서울시','동작구','대방동 유한양행빌딩\r\n');
INSERT INTO postno VALUES (1926,'156-756','서울시','동작구','흑석1동 중앙대학교\r\n');
INSERT INTO postno VALUES (1927,'156-757','서울시','동작구','신대방1동 중외제약빌딩\r\n');
INSERT INTO postno VALUES (1928,'156-761','서울시','동작구','대방동 대림아파트\r\n');
INSERT INTO postno VALUES (1929,'156-762','서울시','동작구','대방동 성원아파트\r\n');
INSERT INTO postno VALUES (1930,'156-763','서울시','동작구','사당3동 총신대학교\r\n');
INSERT INTO postno VALUES (1931,'156-765','서울시','동작구','대방동 대방주공아파트\r\n');
INSERT INTO postno VALUES (1932,'156-767','서울시','동작구','본동 강변주공아파트\r\n');
INSERT INTO postno VALUES (1933,'156-768','서울시','동작구','본동 신동아아파트\r\n');
INSERT INTO postno VALUES (1934,'156-771','서울시','동작구','사당2동 신동아아파트\r\n');
INSERT INTO postno VALUES (1935,'156-772','서울시','동작구','사당2동 극동아파트\r\n');
INSERT INTO postno VALUES (1936,'156-773','서울시','동작구','사당2동 우성아파트\r\n');
INSERT INTO postno VALUES (1937,'156-775','서울시','동작구','사당3동 대림아파트\r\n');
INSERT INTO postno VALUES (1938,'156-776','서울시','동작구','사당3동 우성아파트\r\n');
INSERT INTO postno VALUES (1939,'156-781','서울시','동작구','상도5동 관악현대아파트\r\n');
INSERT INTO postno VALUES (1940,'156-782','서울시','동작구','상도5동 삼호아파트\r\n');
INSERT INTO postno VALUES (1941,'156-786','서울시','동작구','신대방1동 우성아파트\r\n');
INSERT INTO postno VALUES (1942,'156-787','서울시','동작구','신대방1동 현대아파트\r\n');
INSERT INTO postno VALUES (1943,'156-791','서울시','동작구','흑석2동 명수대현대아파트\r\n');
INSERT INTO postno VALUES (1944,'156-792','서울시','동작구','흑석2동 한강현대아파트\r\n');
INSERT INTO postno VALUES (1945,'157-010','서울시','강서구','화곡동\r\n');
INSERT INTO postno VALUES (1946,'157-011','서울시','강서구','화곡1동\r\n');
INSERT INTO postno VALUES (1947,'157-012','서울시','강서구','화곡2동\r\n');
INSERT INTO postno VALUES (1948,'157-013','서울시','강서구','화곡3동\r\n');
INSERT INTO postno VALUES (1949,'157-014','서울시','강서구','화곡4동\r\n');
INSERT INTO postno VALUES (1950,'157-015','서울시','강서구','화곡5동\r\n');
INSERT INTO postno VALUES (1951,'157-016','서울시','강서구','화곡6동\r\n');
INSERT INTO postno VALUES (1952,'157-017','서울시','강서구','화곡7동\r\n');
INSERT INTO postno VALUES (1953,'157-018','서울시','강서구','화곡8동\r\n');
INSERT INTO postno VALUES (1954,'157-019','서울시','강서구','화곡본동\r\n');
INSERT INTO postno VALUES (1955,'157-030','서울시','강서구','등촌동\r\n');
INSERT INTO postno VALUES (1956,'157-031','서울시','강서구','등촌1동\r\n');
INSERT INTO postno VALUES (1957,'157-032','서울시','강서구','등촌2동\r\n');
INSERT INTO postno VALUES (1958,'157-033','서울시','강서구','등촌3동\r\n');
INSERT INTO postno VALUES (1959,'157-040','서울시','강서구','염창동\r\n');
INSERT INTO postno VALUES (1960,'157-200','서울시','강서구','가양동\r\n');
INSERT INTO postno VALUES (1961,'157-201','서울시','강서구','가양1동\r\n');
INSERT INTO postno VALUES (1962,'157-202','서울시','강서구','가양2동\r\n');
INSERT INTO postno VALUES (1963,'157-203','서울시','강서구','가양3동\r\n');
INSERT INTO postno VALUES (1964,'157-210','서울시','강서구','마곡동\r\n');
INSERT INTO postno VALUES (1965,'157-220','서울시','강서구','방화동\r\n');
INSERT INTO postno VALUES (1966,'157-221','서울시','강서구','방화1동\r\n');
INSERT INTO postno VALUES (1967,'157-222','서울시','강서구','방화2동\r\n');
INSERT INTO postno VALUES (1968,'157-223','서울시','강서구','방화3동\r\n');
INSERT INTO postno VALUES (1969,'157-230','서울시','강서구','개화동\r\n');
INSERT INTO postno VALUES (1970,'157-240','서울시','강서구','공항동\r\n');
INSERT INTO postno VALUES (1971,'157-250','서울시','강서구','과해동\r\n');
INSERT INTO postno VALUES (1972,'157-260','서울시','강서구','오곡동\r\n');
INSERT INTO postno VALUES (1973,'157-270','서울시','강서구','오쇠동\r\n');
INSERT INTO postno VALUES (1974,'157-280','서울시','강서구','내발산동\r\n');
INSERT INTO postno VALUES (1975,'157-281','서울시','강서구','내발산1동\r\n');
INSERT INTO postno VALUES (1976,'157-282','서울시','강서구','내발산2동\r\n');
INSERT INTO postno VALUES (1977,'157-290','서울시','강서구','외발산동\r\n');
INSERT INTO postno VALUES (1978,'157-600','서울시','강서구','서울강서우체국사서함\r\n');
INSERT INTO postno VALUES (1979,'157-650','서울시','강서구','서울화곡우체국사서함\r\n');
INSERT INTO postno VALUES (1980,'157-701','서울시','강서구','화곡6동 강서구청\r\n');
INSERT INTO postno VALUES (1981,'157-702','서울시','강서구','화곡6동 강서경찰서\r\n');
INSERT INTO postno VALUES (1982,'157-703','서울시','강서구','화곡6동 강서의료보험조합\r\n');
INSERT INTO postno VALUES (1983,'157-704','서울시','강서구','화곡6동 한국건강관리협회\r\n');
INSERT INTO postno VALUES (1984,'157-705','서울시','강서구','화곡6동 고려빌딩\r\n');
INSERT INTO postno VALUES (1985,'157-706','서울시','강서구','화곡6동 도신빌딩\r\n');
INSERT INTO postno VALUES (1986,'157-707','서울시','강서구','화곡6동 VIP빌딩\r\n');
INSERT INTO postno VALUES (1987,'157-708','서울시','강서구','화곡6동 새마을금고연합\r\n');
INSERT INTO postno VALUES (1988,'157-709','서울시','강서구','화곡6동 현대약품\r\n');
INSERT INTO postno VALUES (1989,'157-710','서울시','강서구','가양1동 세원\r\n');
INSERT INTO postno VALUES (1990,'157-711','서울시','강서구','공항동 한국공항관리공단\r\n');
INSERT INTO postno VALUES (1991,'157-712','서울시','강서구','공항동 대한항공\r\n');
INSERT INTO postno VALUES (1992,'157-713','서울시','강서구','공항동 아시아나항공\r\n');
INSERT INTO postno VALUES (1993,'157-714','서울시','강서구','등촌1동 상아제약\r\n');
INSERT INTO postno VALUES (1994,'157-715','서울시','강서구','등촌1동 한국정보문화센타\r\n');
INSERT INTO postno VALUES (1995,'157-716','서울시','강서구','등촌2동 강서도서관\r\n');
INSERT INTO postno VALUES (1996,'157-717','서울시','강서구','등촌2동 국군수도병원\r\n');
INSERT INTO postno VALUES (1997,'157-718','서울시','강서구','등촌2동 한국전기공사협회\r\n');
INSERT INTO postno VALUES (1998,'157-719','서울시','강서구','염창동 한국도시가스\r\n');
INSERT INTO postno VALUES (1999,'157-720','서울시','강서구','염창동 한국주택은행전산소\r\n');
INSERT INTO postno VALUES (2000,'157-742','서울시','강서구','가양1동 가양2단지아파트\r\n');
INSERT INTO postno VALUES (2001,'157-743','서울시','강서구','가양2동 가양3단지아파트\r\n');
INSERT INTO postno VALUES (2002,'157-744','서울시','강서구','가양2동 가양4단지아파트\r\n');
INSERT INTO postno VALUES (2003,'157-745','서울시','강서구','가양2동 가양5단지아파트\r\n');
INSERT INTO postno VALUES (2004,'157-746','서울시','강서구','가양3동 가양6단지아파트\r\n');
INSERT INTO postno VALUES (2005,'157-747','서울시','강서구','가양3동 가양7단지주공APT\r\n');
INSERT INTO postno VALUES (2006,'157-748','서울시','강서구','가양3동 가양8단지아파트\r\n');
INSERT INTO postno VALUES (2007,'157-749','서울시','강서구','가양3동 가양9단지아파트\r\n');
INSERT INTO postno VALUES (2008,'157-750','서울시','강서구','가양2동 우성아파트\r\n');
INSERT INTO postno VALUES (2009,'157-751','서울시','강서구','가양2동 대림경동아파트\r\n');
INSERT INTO postno VALUES (2010,'157-752','서울시','강서구','가양1동 한강타운아파트\r\n');
INSERT INTO postno VALUES (2011,'157-753','서울시','강서구','가양1동 동신대아아파트\r\n');
INSERT INTO postno VALUES (2012,'157-755','서울시','강서구','등촌3동 대림아파트\r\n');
INSERT INTO postno VALUES (2013,'157-756','서울시','강서구','등촌3동 동성아파트\r\n');
INSERT INTO postno VALUES (2014,'157-761','서울시','강서구','등촌3동 등촌주공APT-1단지\r\n');
INSERT INTO postno VALUES (2015,'157-762','서울시','강서구','등촌3동 등촌주공APT-2단지\r\n');
INSERT INTO postno VALUES (2016,'157-763','서울시','강서구','등촌3동 등촌주공APT-3단지\r\n');
INSERT INTO postno VALUES (2017,'157-764','서울시','강서구','등촌3동 등촌주공APT-4단지\r\n');
INSERT INTO postno VALUES (2018,'157-765','서울시','강서구','등촌3동 등촌주공APT-5단지\r\n');
INSERT INTO postno VALUES (2019,'157-766','서울시','강서구','등촌3동 등촌주공APT-6단지\r\n');
INSERT INTO postno VALUES (2020,'157-767','서울시','강서구','등촌3동 등촌주공APT-7단지\r\n');
INSERT INTO postno VALUES (2021,'157-768','서울시','강서구','등촌3동 등촌주공APT-8단지\r\n');
INSERT INTO postno VALUES (2022,'157-769','서울시','강서구','등촌3동 등촌주공APT-9단지\r\n');
INSERT INTO postno VALUES (2023,'157-770','서울시','강서구','등촌3동 등촌주공APT10단지\r\n');
INSERT INTO postno VALUES (2024,'157-771','서울시','강서구','등촌3동 미주진로아파트\r\n');
INSERT INTO postno VALUES (2025,'157-772','서울시','강서구','등촌3동 부영아파트\r\n');
INSERT INTO postno VALUES (2026,'157-775','서울시','강서구','방화2동 도시개발11단지APT\r\n');
INSERT INTO postno VALUES (2027,'157-776','서울시','강서구','방화2동 도시개발12단지APT\r\n');
INSERT INTO postno VALUES (2028,'157-781','서울시','강서구','방화3동 방화1단지아파트\r\n');
INSERT INTO postno VALUES (2029,'157-782','서울시','강서구','방화3동 방화2단지아파트\r\n');
INSERT INTO postno VALUES (2030,'157-783','서울시','강서구','방화3동 방화3단지아파트\r\n');
INSERT INTO postno VALUES (2031,'157-784','서울시','강서구','방화3동 방화4단지아파트\r\n');
INSERT INTO postno VALUES (2032,'157-785','서울시','강서구','방화3동 방화5단지아파트\r\n');
INSERT INTO postno VALUES (2033,'157-786','서울시','강서구','방화3동 방화6단지아파트\r\n');
INSERT INTO postno VALUES (2034,'157-787','서울시','강서구','방화3동 방화7단지아파트\r\n');
INSERT INTO postno VALUES (2035,'157-788','서울시','강서구','방화3동 방화8단지아파트\r\n');
INSERT INTO postno VALUES (2036,'157-789','서울시','강서구','방화3동 방화9단지아파트\r\n');
INSERT INTO postno VALUES (2037,'157-790','서울시','강서구','방화3동 방화10단지아파트\r\n');
INSERT INTO postno VALUES (2038,'157-791','서울시','강서구','내발산2동 제1주공아파트\r\n');
INSERT INTO postno VALUES (2039,'157-792','서울시','강서구','내발산2동 칼아파트\r\n');
INSERT INTO postno VALUES (2040,'157-795','서울시','강서구','화곡3동 주공시범아파트\r\n');
INSERT INTO postno VALUES (2041,'157-796','서울시','강서구','화곡5동 제2주공아파트\r\n');
INSERT INTO postno VALUES (2042,'157-797','서울시','강서구','화곡5동 우신아파트\r\n');
INSERT INTO postno VALUES (2043,'158-050','서울시','양천구','목동\r\n');
INSERT INTO postno VALUES (2044,'158-051','서울시','양천구','목1동\r\n');
INSERT INTO postno VALUES (2045,'158-052','서울시','양천구','목2동\r\n');
INSERT INTO postno VALUES (2046,'158-053','서울시','양천구','목3동\r\n');
INSERT INTO postno VALUES (2047,'158-054','서울시','양천구','목4동\r\n');
INSERT INTO postno VALUES (2048,'158-055','서울시','양천구','목5동\r\n');
INSERT INTO postno VALUES (2049,'158-056','서울시','양천구','목6동\r\n');
INSERT INTO postno VALUES (2050,'158-070','서울시','양천구','신정동\r\n');
INSERT INTO postno VALUES (2051,'158-071','서울시','양천구','신정1동\r\n');
INSERT INTO postno VALUES (2052,'158-072','서울시','양천구','신정2동\r\n');
INSERT INTO postno VALUES (2053,'158-073','서울시','양천구','신정3동\r\n');
INSERT INTO postno VALUES (2054,'158-074','서울시','양천구','신정4동\r\n');
INSERT INTO postno VALUES (2055,'158-075','서울시','양천구','신정5동\r\n');
INSERT INTO postno VALUES (2056,'158-076','서울시','양천구','신정6동\r\n');
INSERT INTO postno VALUES (2057,'158-077','서울시','양천구','신정7동\r\n');
INSERT INTO postno VALUES (2058,'158-090','서울시','양천구','신월동\r\n');
INSERT INTO postno VALUES (2059,'158-091','서울시','양천구','신월1동\r\n');
INSERT INTO postno VALUES (2060,'158-092','서울시','양천구','신월2동\r\n');
INSERT INTO postno VALUES (2061,'158-093','서울시','양천구','신월3동\r\n');
INSERT INTO postno VALUES (2062,'158-094','서울시','양천구','신월4동\r\n');
INSERT INTO postno VALUES (2063,'158-095','서울시','양천구','신월5동\r\n');
INSERT INTO postno VALUES (2064,'158-096','서울시','양천구','신월6동\r\n');
INSERT INTO postno VALUES (2065,'158-097','서울시','양천구','신월7동\r\n');
INSERT INTO postno VALUES (2066,'158-600','서울시','양천구','서울양천우체국사서함\r\n');
INSERT INTO postno VALUES (2067,'158-701','서울시','양천구','목1동 기독교방송국건물\r\n');
INSERT INTO postno VALUES (2068,'158-702','서울시','양천구','신정6동 양천구청\r\n');
INSERT INTO postno VALUES (2069,'158-703','서울시','양천구','신정6동 양천경찰서\r\n');
INSERT INTO postno VALUES (2070,'158-704','서울시','양천구','신정6동 양천세무서\r\n');
INSERT INTO postno VALUES (2071,'158-705','서울시','양천구','신정지하철차량기지\r\n');
INSERT INTO postno VALUES (2072,'158-706','서울시','양천구','신월5동 강서교육구청\r\n');
INSERT INTO postno VALUES (2073,'158-707','서울시','양천구','국립과학수사연구소\r\n');
INSERT INTO postno VALUES (2074,'158-708','서울시','양천구','목5동 우성에펠타운빌딩\r\n');
INSERT INTO postno VALUES (2075,'158-709','서울시','양천구','목6동 에너지관리공단집단\r\n');
INSERT INTO postno VALUES (2076,'158-710','서울시','양천구','목6동 이화여대목동병원\r\n');
INSERT INTO postno VALUES (2077,'158-711','서울시','양천구','서부화물트럭터미날\r\n');
INSERT INTO postno VALUES (2078,'158-712','서울시','양천구','신정3동 평화빌딩\r\n');
INSERT INTO postno VALUES (2079,'158-713','서울시','양천구','신정4동 삼화빌딩\r\n');
INSERT INTO postno VALUES (2080,'158-751','서울시','양천구','목6동 목동아파트1단지\r\n');
INSERT INTO postno VALUES (2081,'158-752','서울시','양천구','목6동 목동아파트2단지\r\n');
INSERT INTO postno VALUES (2082,'158-753','서울시','양천구','목5동 목동아파트3단지\r\n');
INSERT INTO postno VALUES (2083,'158-754','서울시','양천구','목5동 목동아파트4단지\r\n');
INSERT INTO postno VALUES (2084,'158-755','서울시','양천구','목5동 목동아파트5단지\r\n');
INSERT INTO postno VALUES (2085,'158-756','서울시','양천구','목6동 목동아파트6단지\r\n');
INSERT INTO postno VALUES (2086,'158-757','서울시','양천구','목1동 목동아파트7단지\r\n');
INSERT INTO postno VALUES (2087,'158-758','서울시','양천구','목3동 동신아파트\r\n');
INSERT INTO postno VALUES (2088,'158-759','서울시','양천구','목6동 한신청구아파트\r\n');
INSERT INTO postno VALUES (2089,'158-764','서울시','양천구','신정2동 삼성아파트\r\n');
INSERT INTO postno VALUES (2090,'158-765','서울시','양천구','신정2동 목동현대아파트\r\n');
INSERT INTO postno VALUES (2091,'158-768','서울시','양천구','신정6동 신시가지APT-8단지\r\n');
INSERT INTO postno VALUES (2092,'158-769','서울시','양천구','신정1동 신시가지APT-9단지\r\n');
INSERT INTO postno VALUES (2093,'158-770','서울시','양천구','신정1동 신시가지APT10단지\r\n');
INSERT INTO postno VALUES (2094,'158-771','서울시','양천구','신정7동 신시가지APT11단지\r\n');
INSERT INTO postno VALUES (2095,'158-772','서울시','양천구','신정7동 신시가지APT12단지\r\n');
INSERT INTO postno VALUES (2096,'158-773','서울시','양천구','신정6동 신시가지APT13단지\r\n');
INSERT INTO postno VALUES (2097,'158-774','서울시','양천구','신정6동 신시가지APT14단지\r\n');
INSERT INTO postno VALUES (2098,'158-775','서울시','양천구','신정7동 양천아파트\r\n');
INSERT INTO postno VALUES (2099,'158-781','서울시','양천구','신월7동 신월시영아파트\r\n');
INSERT INTO postno VALUES (2100,'200-010','강원도','춘천시','옥천동\r\n');
INSERT INTO postno VALUES (2101,'200-020','강원도','춘천시','봉의동\r\n');
INSERT INTO postno VALUES (2102,'200-030','강원도','춘천시','요선동\r\n');
INSERT INTO postno VALUES (2103,'200-041','강원도','춘천시','중앙로1가\r\n');
INSERT INTO postno VALUES (2104,'200-042','강원도','춘천시','중앙로2가\r\n');
INSERT INTO postno VALUES (2105,'200-043','강원도','춘천시','중앙로3가\r\n');
INSERT INTO postno VALUES (2106,'200-050','강원도','춘천시','죽림동\r\n');
INSERT INTO postno VALUES (2107,'200-060','강원도','춘천시','교동\r\n');
INSERT INTO postno VALUES (2108,'200-070','강원도','춘천시','조양동\r\n');
INSERT INTO postno VALUES (2109,'200-080','강원도','춘천시','운교동\r\n');
INSERT INTO postno VALUES (2110,'200-090','강원도','춘천시','효자동\r\n');
INSERT INTO postno VALUES (2111,'200-091','강원도','춘천시','효자1동\r\n');
INSERT INTO postno VALUES (2112,'200-092','강원도','춘천시','효자2동\r\n');
INSERT INTO postno VALUES (2113,'200-093','강원도','춘천시','효자3동\r\n');
INSERT INTO postno VALUES (2114,'200-100','강원도','춘천시','낙원동\r\n');
INSERT INTO postno VALUES (2115,'200-111','강원도','춘천시','소양로1가\r\n');
INSERT INTO postno VALUES (2116,'200-112','강원도','춘천시','소양로2가\r\n');
INSERT INTO postno VALUES (2117,'200-113','강원도','춘천시','소양로3가\r\n');
INSERT INTO postno VALUES (2118,'200-114','강원도','춘천시','소양로4가\r\n');
INSERT INTO postno VALUES (2119,'200-120','강원도','춘천시','약사동\r\n');
INSERT INTO postno VALUES (2120,'200-130','강원도','춘천시','근화동\r\n');
INSERT INTO postno VALUES (2121,'200-140','강원도','춘천시','사농동\r\n');
INSERT INTO postno VALUES (2122,'200-150','강원도','춘천시','우두동\r\n');
INSERT INTO postno VALUES (2123,'200-160','강원도','춘천시','후평동\r\n');
INSERT INTO postno VALUES (2124,'200-161','강원도','춘천시','후평1동\r\n');
INSERT INTO postno VALUES (2125,'200-162','강원도','춘천시','후평2동\r\n');
INSERT INTO postno VALUES (2126,'200-163','강원도','춘천시','후평3동\r\n');
INSERT INTO postno VALUES (2127,'200-170','강원도','춘천시','퇴계동\r\n');
INSERT INTO postno VALUES (2128,'200-180','강원도','춘천시','석사동\r\n');
INSERT INTO postno VALUES (2129,'200-190','강원도','춘천시','온의동\r\n');
INSERT INTO postno VALUES (2130,'200-200','강원도','춘천시','삼천동\r\n');
INSERT INTO postno VALUES (2131,'200-210','강원도','춘천시','송암동\r\n');
INSERT INTO postno VALUES (2132,'200-220','강원도','춘천시','칠전동\r\n');
INSERT INTO postno VALUES (2133,'200-230','강원도','춘천시','중도동\r\n');
INSERT INTO postno VALUES (2134,'200-240','강원도','춘천시','신동\r\n');
INSERT INTO postno VALUES (2135,'200-600','강원도','춘천시','춘천우체국사서함\r\n');
INSERT INTO postno VALUES (2136,'200-700','강원도','춘천시','봉의동 강원도청\r\n');
INSERT INTO postno VALUES (2137,'200-701','강원도','춘천시','효자2동 강원대학교\r\n');
INSERT INTO postno VALUES (2138,'200-702','강원도','춘천시','옥천동 한림대학교\r\n');
INSERT INTO postno VALUES (2139,'200-703','강원도','춘천시','석사동 춘천교육대학교\r\n');
INSERT INTO postno VALUES (2140,'200-704','강원도','춘천시','교동 춘천성심병원\r\n');
INSERT INTO postno VALUES (2141,'200-705','강원도','춘천시','중앙로1가 강원일보사건물\r\n');
INSERT INTO postno VALUES (2142,'200-706','강원도','춘천시','운교동 강원은행본점\r\n');
INSERT INTO postno VALUES (2143,'200-707','강원도','춘천시','후평1동 도민일보사\r\n');
INSERT INTO postno VALUES (2144,'200-708','강원도','춘천시','옥천동 춘천시청\r\n');
INSERT INTO postno VALUES (2145,'200-709','강원도','춘천시','소양로3가 춘천전화국\r\n');
INSERT INTO postno VALUES (2146,'200-710','강원도','춘천시','동내면 춘천교도소\r\n');
INSERT INTO postno VALUES (2147,'200-810','강원도','춘천시','신동면\r\n');
INSERT INTO postno VALUES (2148,'200-820','강원도','춘천시','신북면\r\n');
INSERT INTO postno VALUES (2149,'200-830','강원도','춘천시','서면\r\n');
INSERT INTO postno VALUES (2150,'200-835','강원도','춘천시','서면 당림리\r\n');
INSERT INTO postno VALUES (2151,'200-835','강원도','춘천시','서면 안보리\r\n');
INSERT INTO postno VALUES (2152,'200-837','강원도','춘천시','서면 오월리\r\n');
INSERT INTO postno VALUES (2153,'200-840','강원도','춘천시','동산면\r\n');
INSERT INTO postno VALUES (2154,'200-850','강원도','춘천시','동면\r\n');
INSERT INTO postno VALUES (2155,'200-860','강원도','춘천시','사북면\r\n');
INSERT INTO postno VALUES (2156,'200-870','강원도','춘천시','북산면\r\n');
INSERT INTO postno VALUES (2157,'200-875','강원도','춘천시','북산면 청평리\r\n');
INSERT INTO postno VALUES (2158,'200-880','강원도','춘천시','동내면\r\n');
INSERT INTO postno VALUES (2159,'200-910','강원도','춘천시','남산면\r\n');
INSERT INTO postno VALUES (2160,'250-856','강원도','춘천시','남산면 통곡리\r\n');
INSERT INTO postno VALUES (2161,'200-920','강원도','춘천시','남면\r\n');
INSERT INTO postno VALUES (2162,'250-855','강원도','춘천시','남면 한덕리\r\n');
INSERT INTO postno VALUES (2163,'209-800','강원도','화천군','화천읍\r\n');
INSERT INTO postno VALUES (2164,'209-810','강원도','화천군','상서면\r\n');
INSERT INTO postno VALUES (2165,'209-815','강원도','화천군','상서면 구운리\r\n');
INSERT INTO postno VALUES (2166,'209-815','강원도','화천군','상서면 신대리\r\n');
INSERT INTO postno VALUES (2167,'209-815','강원도','화천군','상서면 신풍리\r\n');
INSERT INTO postno VALUES (2168,'209-815','강원도','화천군','상서면 장촌리\r\n');
INSERT INTO postno VALUES (2169,'209-817','강원도','화천군','상서면 다목리\r\n');
INSERT INTO postno VALUES (2170,'209-817','강원도','화천군','상서면 봉오리\r\n');
INSERT INTO postno VALUES (2171,'209-817','강원도','화천군','상서면 파포리\r\n');
INSERT INTO postno VALUES (2172,'209-820','강원도','화천군','간동면\r\n');
INSERT INTO postno VALUES (2173,'209-825','강원도','화천군','간동면 구만리\r\n');
INSERT INTO postno VALUES (2174,'209-830','강원도','화천군','사내면\r\n');
INSERT INTO postno VALUES (2175,'209-840','강원도','화천군','하남면\r\n');
INSERT INTO postno VALUES (2176,'210-010','강원도','강릉시','홍제동\r\n');
INSERT INTO postno VALUES (2177,'210-020','강원도','강릉시','남문동\r\n');
INSERT INTO postno VALUES (2178,'210-030','강원도','강릉시','명주동\r\n');
INSERT INTO postno VALUES (2179,'210-040','강원도','강릉시','성내동\r\n');
INSERT INTO postno VALUES (2180,'210-050','강원도','강릉시','성남동\r\n');
INSERT INTO postno VALUES (2181,'210-060','강원도','강릉시','금학동\r\n');
INSERT INTO postno VALUES (2182,'210-070','강원도','강릉시','용강동\r\n');
INSERT INTO postno VALUES (2183,'210-080','강원도','강릉시','임당동\r\n');
INSERT INTO postno VALUES (2184,'210-090','강원도','강릉시','옥천동\r\n');
INSERT INTO postno VALUES (2185,'210-100','강원도','강릉시','교동\r\n');
INSERT INTO postno VALUES (2186,'210-101','강원도','강릉시','교1동\r\n');
INSERT INTO postno VALUES (2187,'210-102','강원도','강릉시','교2동\r\n');
INSERT INTO postno VALUES (2188,'210-110','강원도','강릉시','포남1동\r\n');
INSERT INTO postno VALUES (2189,'210-110','강원도','강릉시','포남2동\r\n');
INSERT INTO postno VALUES (2190,'210-120','강원도','강릉시','초당동\r\n');
INSERT INTO postno VALUES (2191,'210-130','강원도','강릉시','강문동\r\n');
INSERT INTO postno VALUES (2192,'210-140','강원도','강릉시','송정동\r\n');
INSERT INTO postno VALUES (2193,'210-150','강원도','강릉시','견소동\r\n');
INSERT INTO postno VALUES (2194,'210-160','강원도','강릉시','내곡동\r\n');
INSERT INTO postno VALUES (2195,'210-170','강원도','강릉시','회산동\r\n');
INSERT INTO postno VALUES (2196,'210-180','강원도','강릉시','장현동\r\n');
INSERT INTO postno VALUES (2197,'210-190','강원도','강릉시','담산동\r\n');
INSERT INTO postno VALUES (2198,'210-200','강원도','강릉시','박월동\r\n');
INSERT INTO postno VALUES (2199,'210-210','강원도','강릉시','노암동\r\n');
INSERT INTO postno VALUES (2200,'210-220','강원도','강릉시','유산동\r\n');
INSERT INTO postno VALUES (2201,'210-230','강원도','강릉시','월호평동\r\n');
INSERT INTO postno VALUES (2202,'210-240','강원도','강릉시','신석동\r\n');
INSERT INTO postno VALUES (2203,'210-250','강원도','강릉시','입암동\r\n');
INSERT INTO postno VALUES (2204,'210-260','강원도','강릉시','청량동\r\n');
INSERT INTO postno VALUES (2205,'210-270','강원도','강릉시','두산동\r\n');
INSERT INTO postno VALUES (2206,'210-280','강원도','강릉시','학동\r\n');
INSERT INTO postno VALUES (2207,'210-290','강원도','강릉시','병산동\r\n');
INSERT INTO postno VALUES (2208,'210-300','강원도','강릉시','남항진동\r\n');
INSERT INTO postno VALUES (2209,'210-310','강원도','강릉시','유천동\r\n');
INSERT INTO postno VALUES (2210,'210-320','강원도','강릉시','지변동\r\n');
INSERT INTO postno VALUES (2211,'210-330','강원도','강릉시','죽헌동\r\n');
INSERT INTO postno VALUES (2212,'210-340','강원도','강릉시','대전동\r\n');
INSERT INTO postno VALUES (2213,'210-350','강원도','강릉시','운정동\r\n');
INSERT INTO postno VALUES (2214,'210-360','강원도','강릉시','난곡동\r\n');
INSERT INTO postno VALUES (2215,'210-370','강원도','강릉시','저동\r\n');
INSERT INTO postno VALUES (2216,'210-380','강원도','강릉시','안현동\r\n');
INSERT INTO postno VALUES (2217,'210-390','강원도','강릉시','운산동\r\n');
INSERT INTO postno VALUES (2218,'210-600','강원도','강릉시','강릉우체국사서함\r\n');
INSERT INTO postno VALUES (2219,'210-701','강원도','강릉시','내곡동 관동대학교\r\n');
INSERT INTO postno VALUES (2220,'210-702','강원도','강릉시','지변동 강릉대학교\r\n');
INSERT INTO postno VALUES (2221,'210-703','강원도','강릉시','명주동 강릉시청\r\n');
INSERT INTO postno VALUES (2222,'210-704','강원도','강릉시','포남1동 강릉경찰서\r\n');
INSERT INTO postno VALUES (2223,'210-705','강원도','강릉시','용강동 강릉전화국\r\n');
INSERT INTO postno VALUES (2224,'210-711','강원도','강릉시','아산재단 강릉병원\r\n');
INSERT INTO postno VALUES (2225,'210-800','강원도','강릉시','주문진읍\r\n');
INSERT INTO postno VALUES (2226,'210-810','강원도','강릉시','구정면\r\n');
INSERT INTO postno VALUES (2227,'210-820','강원도','강릉시','강동면\r\n');
INSERT INTO postno VALUES (2228,'210-825','강원도','강릉시','강동면 산성우리\r\n');
INSERT INTO postno VALUES (2229,'210-825','강원도','강릉시','강동면 삼곡리\r\n');
INSERT INTO postno VALUES (2230,'210-825','강원도','강릉시','강동면 임곡리\r\n');
INSERT INTO postno VALUES (2231,'210-825','강원도','강릉시','강동면 정동진리\r\n');
INSERT INTO postno VALUES (2232,'210-830','강원도','강릉시','옥계면\r\n');
INSERT INTO postno VALUES (2233,'210-840','강원도','강릉시','성산면\r\n');
INSERT INTO postno VALUES (2234,'210-850','강원도','강릉시','사천면\r\n');
INSERT INTO postno VALUES (2235,'210-860','강원도','강릉시','연곡면\r\n');
INSERT INTO postno VALUES (2236,'210-910','강원도','강릉시','왕산면\r\n');
INSERT INTO postno VALUES (2237,'233-915','강원도','강릉시','왕산면 고단리\r\n');
INSERT INTO postno VALUES (2238,'233-915','강원도','강릉시','왕산면 송현리\r\n');
INSERT INTO postno VALUES (2239,'233-917','강원도','강릉시','왕산면 대기리\r\n');
INSERT INTO postno VALUES (2240,'215-800','강원도','양양군','양양읍\r\n');
INSERT INTO postno VALUES (2241,'215-810','강원도','양양군','서면\r\n');
INSERT INTO postno VALUES (2242,'215-820','강원도','양양군','손양면\r\n');
INSERT INTO postno VALUES (2243,'215-830','강원도','양양군','현북면\r\n');
INSERT INTO postno VALUES (2244,'215-840','강원도','양양군','현남면\r\n');
INSERT INTO postno VALUES (2245,'215-850','강원도','양양군','강현면\r\n');
INSERT INTO postno VALUES (2246,'217-010','강원도','속초시','영랑동\r\n');
INSERT INTO postno VALUES (2247,'217-020','강원도','속초시','동명동\r\n');
INSERT INTO postno VALUES (2248,'217-030','강원도','속초시','중앙동\r\n');
INSERT INTO postno VALUES (2249,'217-040','강원도','속초시','금호동\r\n');
INSERT INTO postno VALUES (2250,'217-050','강원도','속초시','청학동\r\n');
INSERT INTO postno VALUES (2251,'217-060','강원도','속초시','교동\r\n');
INSERT INTO postno VALUES (2252,'217-070','강원도','속초시','노학동\r\n');
INSERT INTO postno VALUES (2253,'217-080','강원도','속초시','조양동\r\n');
INSERT INTO postno VALUES (2254,'217-090','강원도','속초시','청호동\r\n');
INSERT INTO postno VALUES (2255,'217-100','강원도','속초시','대포동\r\n');
INSERT INTO postno VALUES (2256,'217-110','강원도','속초시','도문동\r\n');
INSERT INTO postno VALUES (2257,'217-120','강원도','속초시','설악동\r\n');
INSERT INTO postno VALUES (2258,'217-130','강원도','속초시','장사동\r\n');
INSERT INTO postno VALUES (2259,'217-140','강원도','속초시','사진동\r\n');
INSERT INTO postno VALUES (2260,'217-600','강원도','속초시','속초우체국사서함\r\n');
INSERT INTO postno VALUES (2261,'217-701','강원도','속초시','중앙동 속초시청\r\n');
INSERT INTO postno VALUES (2262,'219-800','강원도','고성군','간성읍\r\n');
INSERT INTO postno VALUES (2263,'219-810','강원도','고성군','현내면\r\n');
INSERT INTO postno VALUES (2264,'219-820','강원도','고성군','죽왕면\r\n');
INSERT INTO postno VALUES (2265,'219-830','강원도','고성군','토성면\r\n');
INSERT INTO postno VALUES (2266,'219-900','강원도','고성군','거진읍\r\n');
INSERT INTO postno VALUES (2267,'220-010','강원도','원주시','중앙동\r\n');
INSERT INTO postno VALUES (2268,'220-020','강원도','원주시','평원동\r\n');
INSERT INTO postno VALUES (2269,'220-030','강원도','원주시','학성동\r\n');
INSERT INTO postno VALUES (2270,'220-031','강원도','원주시','학성1동\r\n');
INSERT INTO postno VALUES (2271,'220-032','강원도','원주시','학성2동\r\n');
INSERT INTO postno VALUES (2272,'220-040','강원도','원주시','명륜동\r\n');
INSERT INTO postno VALUES (2273,'220-041','강원도','원주시','명륜1동\r\n');
INSERT INTO postno VALUES (2274,'220-042','강원도','원주시','명륜2동\r\n');
INSERT INTO postno VALUES (2275,'220-050','강원도','원주시','일산동\r\n');
INSERT INTO postno VALUES (2276,'220-060','강원도','원주시','원동\r\n');
INSERT INTO postno VALUES (2277,'220-070','강원도','원주시','인동\r\n');
INSERT INTO postno VALUES (2278,'220-080','강원도','원주시','봉산동\r\n');
INSERT INTO postno VALUES (2279,'220-081','강원도','원주시','봉산1동\r\n');
INSERT INTO postno VALUES (2280,'220-082','강원도','원주시','봉산2동\r\n');
INSERT INTO postno VALUES (2281,'220-090','강원도','원주시','단구동\r\n');
INSERT INTO postno VALUES (2282,'220-100','강원도','원주시','단계동\r\n');
INSERT INTO postno VALUES (2283,'220-110','강원도','원주시','개운동\r\n');
INSERT INTO postno VALUES (2284,'220-120','강원도','원주시','태장동\r\n');
INSERT INTO postno VALUES (2285,'220-121','강원도','원주시','태장1동\r\n');
INSERT INTO postno VALUES (2286,'220-122','강원도','원주시','태장2동\r\n');
INSERT INTO postno VALUES (2287,'220-130','강원도','원주시','우산동\r\n');
INSERT INTO postno VALUES (2288,'220-140','강원도','원주시','가현동\r\n');
INSERT INTO postno VALUES (2289,'220-150','강원도','원주시','무실동\r\n');
INSERT INTO postno VALUES (2290,'220-160','강원도','원주시','행구동\r\n');
INSERT INTO postno VALUES (2291,'220-170','강원도','원주시','반곡동\r\n');
INSERT INTO postno VALUES (2292,'220-180','강원도','원주시','관설동\r\n');
INSERT INTO postno VALUES (2293,'220-600','강원도','원주시','원주우체국사서함\r\n');
INSERT INTO postno VALUES (2294,'220-701','강원도','원주시','연세대학교원주기독병원\r\n');
INSERT INTO postno VALUES (2295,'220-702','강원도','원주시','우산동 상지대학교\r\n');
INSERT INTO postno VALUES (2296,'220-703','강원도','원주시','일산동 원주시청\r\n');
INSERT INTO postno VALUES (2297,'220-704','강원도','원주시','무실동 원주교도소\r\n');
INSERT INTO postno VALUES (2298,'220-705','강원도','원주시','학성1동 원주전화국\r\n');
INSERT INTO postno VALUES (2299,'220-706','강원도','원주시','한국통신강원사업본부\r\n');
INSERT INTO postno VALUES (2300,'220-701','강원도','원주시','연세대학교원주컴퍼스\r\n');
INSERT INTO postno VALUES (2301,'220-711','강원도','원주시','흥업면 원주전문대학\r\n');
INSERT INTO postno VALUES (2302,'220-712','강원도','원주시','한라공업전문대학\r\n');
INSERT INTO postno VALUES (2303,'220-800','강원도','원주시','문막면\r\n');
INSERT INTO postno VALUES (2304,'220-810','강원도','원주시','부론면\r\n');
INSERT INTO postno VALUES (2305,'220-820','강원도','원주시','지정면\r\n');
INSERT INTO postno VALUES (2306,'220-830','강원도','원주시','소초면\r\n');
INSERT INTO postno VALUES (2307,'220-840','강원도','원주시','홍업면\r\n');
INSERT INTO postno VALUES (2308,'220-850','강원도','원주시','귀래면\r\n');
INSERT INTO postno VALUES (2309,'220-860','강원도','원주시','신림면\r\n');
INSERT INTO postno VALUES (2310,'220-865','강원도','원주시','신림면 송계리\r\n');
INSERT INTO postno VALUES (2311,'220-865','강원도','원주시','신림면 황둔리\r\n');
INSERT INTO postno VALUES (2312,'220-910','강원도','원주시','판부면\r\n');
INSERT INTO postno VALUES (2313,'220-920','강원도','원주시','호저면\r\n');
INSERT INTO postno VALUES (2314,'225-800','강원도','횡성군','횡성읍\r\n');
INSERT INTO postno VALUES (2315,'225-810','강원도','횡성군','우천면\r\n');
INSERT INTO postno VALUES (2316,'225-820','강원도','횡성군','안흥면\r\n');
INSERT INTO postno VALUES (2317,'225-830','강원도','횡성군','둔내면\r\n');
INSERT INTO postno VALUES (2318,'225-840','강원도','횡성군','갑천면\r\n');
INSERT INTO postno VALUES (2319,'225-850','강원도','횡성군','청일면\r\n');
INSERT INTO postno VALUES (2320,'225-860','강원도','횡성군','서원면\r\n');
INSERT INTO postno VALUES (2321,'225-870','강원도','횡성군','공근면\r\n');
INSERT INTO postno VALUES (2322,'225-880','강원도','횡성군','강림면\r\n');
INSERT INTO postno VALUES (2323,'230-800','강원도','영월군','영월읍\r\n');
INSERT INTO postno VALUES (2324,'230-810','강원도','영월군','중동면\r\n');
INSERT INTO postno VALUES (2325,'233-827','강원도','영월군','중동면\r\n');
INSERT INTO postno VALUES (2326,'233-827','강원도','영월군','중동면\r\n');
INSERT INTO postno VALUES (2327,'233-827','강원도','영월군','중동면\r\n');
INSERT INTO postno VALUES (2328,'230-820','강원도','영월군','하동면\r\n');
INSERT INTO postno VALUES (2329,'230-825','강원도','영월군','하동면 내리\r\n');
INSERT INTO postno VALUES (2330,'230-825','강원도','영월군','하동면 오룡1리\r\n');
INSERT INTO postno VALUES (2331,'230-825','강원도','영월군','하동면 오룡2리\r\n');
INSERT INTO postno VALUES (2332,'230-830','강원도','영월군','남면\r\n');
INSERT INTO postno VALUES (2333,'230-840','강원도','영월군','서면\r\n');
INSERT INTO postno VALUES (2334,'230-845','강원도','영월군','서면 쌍룡리\r\n');
INSERT INTO postno VALUES (2335,'230-845','강원도','영월군','서면 후탄리\r\n');
INSERT INTO postno VALUES (2336,'230-850','강원도','영월군','주천면\r\n');
INSERT INTO postno VALUES (2337,'230-860','강원도','영월군','수주면\r\n');
INSERT INTO postno VALUES (2338,'230-867','강원도','영월군','수주면 운학리\r\n');
INSERT INTO postno VALUES (2339,'230-867','강원도','영월군','수주면 두산리\r\n');
INSERT INTO postno VALUES (2340,'230-870','강원도','영월군','북면\r\n');
INSERT INTO postno VALUES (2341,'230-900','강원도','영월군','상동읍\r\n');
INSERT INTO postno VALUES (2342,'232-800','강원도','평창군','평창읍\r\n');
INSERT INTO postno VALUES (2343,'232-810','강원도','평창군','방림면\r\n');
INSERT INTO postno VALUES (2344,'232-815','강원도','평창군','방림면 계촌리\r\n');
INSERT INTO postno VALUES (2345,'232-820','강원도','평창군','미탄면\r\n');
INSERT INTO postno VALUES (2346,'232-910','강원도','평창군','대화면\r\n');
INSERT INTO postno VALUES (2347,'232-920','강원도','평창군','봉평면\r\n');
INSERT INTO postno VALUES (2348,'232-930','강원도','평창군','용평면\r\n');
INSERT INTO postno VALUES (2349,'232-940','강원도','평창군','진부면\r\n');
INSERT INTO postno VALUES (2350,'232-950','강원도','평창군','도암면\r\n');
INSERT INTO postno VALUES (2351,'232-955','강원도','평창군','도암면 병내리\r\n');
INSERT INTO postno VALUES (2352,'232-955','강원도','평창군','도암면 유천리\r\n');
INSERT INTO postno VALUES (2353,'233-800','강원도','정선군','정선읍\r\n');
INSERT INTO postno VALUES (2354,'233-810','강원도','정선군','고한읍\r\n');
INSERT INTO postno VALUES (2355,'233-820','강원도','정선군','신동읍\r\n');
INSERT INTO postno VALUES (2356,'233-825','강원도','정선군','신동읍 방제리\r\n');
INSERT INTO postno VALUES (2357,'233-825','강원도','정선군','신동읍 조동리\r\n');
INSERT INTO postno VALUES (2358,'233-830','강원도','정선군','남면\r\n');
INSERT INTO postno VALUES (2359,'233-840','강원도','정선군','북면\r\n');
INSERT INTO postno VALUES (2360,'233-845','강원도','정선군','북면 구절리\r\n');
INSERT INTO postno VALUES (2361,'233-845','강원도','정선군','북면 남곡리\r\n');
INSERT INTO postno VALUES (2362,'233-845','강원도','정선군','북면 유천3리 관계동\r\n');
INSERT INTO postno VALUES (2363,'233-845','강원도','정선군','북면 유천3리 금동\r\n');
INSERT INTO postno VALUES (2364,'233-845','강원도','정선군','북면 유천3리 하자개\r\n');
INSERT INTO postno VALUES (2365,'233-845','강원도','정선군','북면 유천3리 하자평\r\n');
INSERT INTO postno VALUES (2366,'233-850','강원도','정선군','북평면\r\n');
INSERT INTO postno VALUES (2367,'233-860','강원도','정선군','동면\r\n');
INSERT INTO postno VALUES (2368,'233-870','강원도','정선군','임계면\r\n');
INSERT INTO postno VALUES (2369,'233-875','강원도','정선군','임계면 골지리\r\n');
INSERT INTO postno VALUES (2370,'233-875','강원도','정선군','임계면 낙천2리\r\n');
INSERT INTO postno VALUES (2371,'233-875','강원도','정선군','임계면 낙천3리\r\n');
INSERT INTO postno VALUES (2372,'233-875','강원도','정선군','임계면 덕암리\r\n');
INSERT INTO postno VALUES (2373,'233-875','강원도','정선군','임계면 용산리\r\n');
INSERT INTO postno VALUES (2374,'233-900','강원도','정선군','사북읍\r\n');
INSERT INTO postno VALUES (2375,'235-010','강원도','태백시','황지동\r\n');
INSERT INTO postno VALUES (2376,'235-011','강원도','태백시','황지1동\r\n');
INSERT INTO postno VALUES (2377,'235-012','강원도','태백시','황지2동\r\n');
INSERT INTO postno VALUES (2378,'235-013','강원도','태백시','황지3동\r\n');
INSERT INTO postno VALUES (2379,'235-019','강원도','태백시','상장동\r\n');
INSERT INTO postno VALUES (2380,'235-020','강원도','태백시','화전동\r\n');
INSERT INTO postno VALUES (2381,'235-021','강원도','태백시','화전1동\r\n');
INSERT INTO postno VALUES (2382,'235-022','강원도','태백시','화전2동\r\n');
INSERT INTO postno VALUES (2383,'235-030','강원도','태백시','소도동\r\n');
INSERT INTO postno VALUES (2384,'235-040','강원도','태백시','혈동\r\n');
INSERT INTO postno VALUES (2385,'235-050','강원도','태백시','통동\r\n');
INSERT INTO postno VALUES (2386,'235-060','강원도','태백시','적각동\r\n');
INSERT INTO postno VALUES (2387,'235-070','강원도','태백시','창죽동\r\n');
INSERT INTO postno VALUES (2388,'235-080','강원도','태백시','화광동\r\n');
INSERT INTO postno VALUES (2389,'235-090','강원도','태백시','계산동\r\n');
INSERT INTO postno VALUES (2390,'235-100','강원도','태백시','장성동\r\n');
INSERT INTO postno VALUES (2391,'235-110','강원도','태백시','금천동\r\n');
INSERT INTO postno VALUES (2392,'235-120','강원도','태백시','문곡동\r\n');
INSERT INTO postno VALUES (2393,'235-200','강원도','태백시','철암동\r\n');
INSERT INTO postno VALUES (2394,'235-201','강원도','태백시','철암1동\r\n');
INSERT INTO postno VALUES (2395,'235-202','강원도','태백시','철암2동\r\n');
INSERT INTO postno VALUES (2396,'235-210','강원도','태백시','동점동\r\n');
INSERT INTO postno VALUES (2397,'235-220','강원도','태백시','백산동\r\n');
INSERT INTO postno VALUES (2398,'235-230','강원도','태백시','원동\r\n');
INSERT INTO postno VALUES (2399,'235-240','강원도','태백시','상사미동\r\n');
INSERT INTO postno VALUES (2400,'235-250','강원도','태백시','하사미동\r\n');
INSERT INTO postno VALUES (2401,'235-260','강원도','태백시','조탄동\r\n');
INSERT INTO postno VALUES (2402,'235-600','강원도','태백시','태백우체국사서함\r\n');
INSERT INTO postno VALUES (2403,'235-701','강원도','태백시','상장동 태백시청\r\n');
INSERT INTO postno VALUES (2404,'235-900','강원도','삼척시','도계읍\r\n');
INSERT INTO postno VALUES (2405,'235-910','강원도','삼척시','하장면\r\n');
INSERT INTO postno VALUES (2406,'235-920','강원도','삼척시','신기면\r\n');
INSERT INTO postno VALUES (2407,'240-010','강원도','동해시','천곡동\r\n');
INSERT INTO postno VALUES (2408,'240-020','강원도','동해시','평릉동\r\n');
INSERT INTO postno VALUES (2409,'240-030','강원도','동해시','부곡동\r\n');
INSERT INTO postno VALUES (2410,'240-041','강원도','동해시','발한동\r\n');
INSERT INTO postno VALUES (2411,'240-042','강원도','동해시','사문동\r\n');
INSERT INTO postno VALUES (2412,'240-043','강원도','동해시','동호동\r\n');
INSERT INTO postno VALUES (2413,'240-044','강원도','동해시','향로동\r\n');
INSERT INTO postno VALUES (2414,'240-050','강원도','동해시','묵호동\r\n');
INSERT INTO postno VALUES (2415,'240-060','강원도','동해시','어달동\r\n');
INSERT INTO postno VALUES (2416,'240-070','강원도','동해시','대진동\r\n');
INSERT INTO postno VALUES (2417,'240-080','강원도','동해시','망상동\r\n');
INSERT INTO postno VALUES (2418,'240-090','강원도','동해시','심곡동\r\n');
INSERT INTO postno VALUES (2419,'240-100','강원도','동해시','초구동\r\n');
INSERT INTO postno VALUES (2420,'240-110','강원도','동해시','괴란동\r\n');
INSERT INTO postno VALUES (2421,'240-120','강원도','동해시','만우동\r\n');
INSERT INTO postno VALUES (2422,'240-130','강원도','동해시','송정동\r\n');
INSERT INTO postno VALUES (2423,'240-140','강원도','동해시','용정동\r\n');
INSERT INTO postno VALUES (2424,'240-150','강원도','동해시','지흥동\r\n');
INSERT INTO postno VALUES (2425,'240-160','강원도','동해시','효가동\r\n');
INSERT INTO postno VALUES (2426,'240-170','강원도','동해시','나안동\r\n');
INSERT INTO postno VALUES (2427,'240-180','강원도','동해시','동회동\r\n');
INSERT INTO postno VALUES (2428,'240-190','강원도','동해시','쇄운동\r\n');
INSERT INTO postno VALUES (2429,'240-200','강원도','동해시','북평동\r\n');
INSERT INTO postno VALUES (2430,'240-210','강원도','동해시','구미동\r\n');
INSERT INTO postno VALUES (2431,'240-220','강원도','동해시','추암동\r\n');
INSERT INTO postno VALUES (2432,'240-230','강원도','동해시','구호동\r\n');
INSERT INTO postno VALUES (2433,'240-240','강원도','동해시','대구동\r\n');
INSERT INTO postno VALUES (2434,'240-250','강원도','동해시','호현동\r\n');
INSERT INTO postno VALUES (2435,'240-260','강원도','동해시','내동\r\n');
INSERT INTO postno VALUES (2436,'240-270','강원도','동해시','단봉동\r\n');
INSERT INTO postno VALUES (2437,'240-280','강원도','동해시','지가동\r\n');
INSERT INTO postno VALUES (2438,'240-290','강원도','동해시','이도동\r\n');
INSERT INTO postno VALUES (2439,'240-300','강원도','동해시','귀운동\r\n');
INSERT INTO postno VALUES (2440,'240-310','강원도','동해시','신흥동\r\n');
INSERT INTO postno VALUES (2441,'240-320','강원도','동해시','비천동\r\n');
INSERT INTO postno VALUES (2442,'240-330','강원도','동해시','달방동\r\n');
INSERT INTO postno VALUES (2443,'240-340','강원도','동해시','이로동\r\n');
INSERT INTO postno VALUES (2444,'240-350','강원도','동해시','삼화동\r\n');
INSERT INTO postno VALUES (2445,'240-360','강원도','동해시','이기동\r\n');
INSERT INTO postno VALUES (2446,'240-600','강원도','동해시','동해우체국사서함\r\n');
INSERT INTO postno VALUES (2447,'240-701','강원도','동해시','천곡동 동해시청\r\n');
INSERT INTO postno VALUES (2448,'240-702','강원도','동해시','천곡동 동해경찰서\r\n');
INSERT INTO postno VALUES (2449,'240-711','강원도','동해시','천곡동 영동병원\r\n');
INSERT INTO postno VALUES (2450,'245-010','강원도','삼척시','남양동\r\n');
INSERT INTO postno VALUES (2451,'245-020','강원도','삼척시','읍상동\r\n');
INSERT INTO postno VALUES (2452,'245-030','강원도','삼척시','읍중동\r\n');
INSERT INTO postno VALUES (2453,'245-040','강원도','삼척시','성북동\r\n');
INSERT INTO postno VALUES (2454,'245-050','강원도','삼척시','성내동\r\n');
INSERT INTO postno VALUES (2455,'245-060','강원도','삼척시','성남동\r\n');
INSERT INTO postno VALUES (2456,'245-070','강원도','삼척시','당저동\r\n');
INSERT INTO postno VALUES (2457,'245-080','강원도','삼척시','교동\r\n');
INSERT INTO postno VALUES (2458,'245-090','강원도','삼척시','갈천동\r\n');
INSERT INTO postno VALUES (2459,'245-100','강원도','삼척시','증산동\r\n');
INSERT INTO postno VALUES (2460,'245-110','강원도','삼척시','우지동\r\n');
INSERT INTO postno VALUES (2461,'245-120','강원도','삼척시','마달동\r\n');
INSERT INTO postno VALUES (2462,'245-130','강원도','삼척시','정상동\r\n');
INSERT INTO postno VALUES (2463,'245-140','강원도','삼척시','정하동\r\n');
INSERT INTO postno VALUES (2464,'245-150','강원도','삼척시','사직동\r\n');
INSERT INTO postno VALUES (2465,'245-160','강원도','삼척시','오분동\r\n');
INSERT INTO postno VALUES (2466,'245-170','강원도','삼척시','조비동\r\n');
INSERT INTO postno VALUES (2467,'245-171','강원도','삼척시','조비1동\r\n');
INSERT INTO postno VALUES (2468,'245-172','강원도','삼척시','조비2동\r\n');
INSERT INTO postno VALUES (2469,'245-180','강원도','삼척시','적노동\r\n');
INSERT INTO postno VALUES (2470,'245-190','강원도','삼척시','등봉동\r\n');
INSERT INTO postno VALUES (2471,'245-200','강원도','삼척시','도경동\r\n');
INSERT INTO postno VALUES (2472,'245-210','강원도','삼척시','마평동\r\n');
INSERT INTO postno VALUES (2473,'245-220','강원도','삼척시','오사동\r\n');
INSERT INTO postno VALUES (2474,'245-230','강원도','삼척시','근산동\r\n');
INSERT INTO postno VALUES (2475,'245-240','강원도','삼척시','건지동\r\n');
INSERT INTO postno VALUES (2476,'245-250','강원도','삼척시','원당동\r\n');
INSERT INTO postno VALUES (2477,'245-260','강원도','삼척시','자원동\r\n');
INSERT INTO postno VALUES (2478,'245-270','강원도','삼척시','평전동\r\n');
INSERT INTO postno VALUES (2479,'245-600','강원도','삼척시','삼척우체국사서함\r\n');
INSERT INTO postno VALUES (2480,'245-701','강원도','삼척시','교동 삼척시청\r\n');
INSERT INTO postno VALUES (2481,'245-711','강원도','삼척시','교동 삼척산업대학교\r\n');
INSERT INTO postno VALUES (2482,'246-800','강원도','삼척시','원덕읍\r\n');
INSERT INTO postno VALUES (2483,'246-810','강원도','삼척시','가곡면\r\n');
INSERT INTO postno VALUES (2484,'246-820','강원도','삼척시','미로면\r\n');
INSERT INTO postno VALUES (2485,'246-830','강원도','삼척시','근덕면\r\n');
INSERT INTO postno VALUES (2486,'246-840','강원도','삼척시','노곡면\r\n');
INSERT INTO postno VALUES (2487,'246-845','강원도','삼척시','노곡면 상마읍리\r\n');
INSERT INTO postno VALUES (2488,'246-845','강원도','삼척시','노곡면 중마읍리\r\n');
INSERT INTO postno VALUES (2489,'246-845','강원도','삼척시','노곡면 하마읍리\r\n');
INSERT INTO postno VALUES (2490,'250-800','강원도','홍천군','홍천읍\r\n');
INSERT INTO postno VALUES (2491,'250-810','강원도','홍천군','화촌면\r\n');
INSERT INTO postno VALUES (2492,'250-820','강원도','홍천군','두촌면\r\n');
INSERT INTO postno VALUES (2493,'250-830','강원도','홍천군','서석면\r\n');
INSERT INTO postno VALUES (2494,'250-840','강원도','홍천군','내면\r\n');
INSERT INTO postno VALUES (2495,'250-850','강원도','홍천군','서면\r\n');
INSERT INTO postno VALUES (2496,'250-855','강원도','홍천군','서면 개야리\r\n');
INSERT INTO postno VALUES (2497,'250-855','강원도','홍천군','서면 길곡리\r\n');
INSERT INTO postno VALUES (2498,'250-855','강원도','홍천군','서면 동막리\r\n');
INSERT INTO postno VALUES (2499,'250-855','강원도','홍천군','서면 마곡리\r\n');
INSERT INTO postno VALUES (2500,'250-855','강원도','홍천군','서면 오곡리\r\n');
INSERT INTO postno VALUES (2501,'250-855','강원도','홍천군','서면 중방대리\r\n');
INSERT INTO postno VALUES (2502,'250-860','강원도','홍천군','내촌면\r\n');
INSERT INTO postno VALUES (2503,'250-870','강원도','홍천군','남면\r\n');
INSERT INTO postno VALUES (2504,'250-880','강원도','홍천군','북방면\r\n');
INSERT INTO postno VALUES (2505,'250-811','강원도','홍천군','북방면 도담리\r\n');
INSERT INTO postno VALUES (2506,'250-890','강원도','홍천군','동면\r\n');
INSERT INTO postno VALUES (2507,'252-800','강원도','인제군','인제읍\r\n');
INSERT INTO postno VALUES (2508,'252-810','강원도','인제군','남면\r\n');
INSERT INTO postno VALUES (2509,'252-820','강원도','인제군','북면\r\n');
INSERT INTO postno VALUES (2510,'252-830','강원도','인제군','서화면\r\n');
INSERT INTO postno VALUES (2511,'252-840','강원도','인제군','기린면\r\n');
INSERT INTO postno VALUES (2512,'252-850','강원도','인제군','상남면\r\n');
INSERT INTO postno VALUES (2513,'255-800','강원도','양구군','양구읍\r\n');
INSERT INTO postno VALUES (2514,'255-810','강원도','양구군','남면\r\n');
INSERT INTO postno VALUES (2515,'255-820','강원도','양구군','동면\r\n');
INSERT INTO postno VALUES (2516,'255-830','강원도','양구군','방산면\r\n');
INSERT INTO postno VALUES (2517,'255-840','강원도','양구군','해안면\r\n');
INSERT INTO postno VALUES (2518,'269-800','강원도','철원군','갈말읍\r\n');
INSERT INTO postno VALUES (2519,'269-805','강원도','철원군','갈말읍 정연리\r\n');
INSERT INTO postno VALUES (2520,'269-810','강원도','철원군','동송읍\r\n');
INSERT INTO postno VALUES (2521,'269-820','강원도','철원군','철원읍\r\n');
INSERT INTO postno VALUES (2522,'269-830','강원도','철원군','김화읍\r\n');
INSERT INTO postno VALUES (2523,'269-840','강원도','철원군','서면\r\n');
INSERT INTO postno VALUES (2524,'269-850','강원도','철원군','근남면\r\n');
INSERT INTO postno VALUES (2525,'300-010','대전시','동구','원동\r\n');
INSERT INTO postno VALUES (2526,'300-020','대전시','동구','인동\r\n');
INSERT INTO postno VALUES (2527,'300-030','대전시','동구','효동\r\n');
INSERT INTO postno VALUES (2528,'300-040','대전시','동구','천동\r\n');
INSERT INTO postno VALUES (2529,'300-050','대전시','동구','가오동\r\n');
INSERT INTO postno VALUES (2530,'300-060','대전시','동구','신안동\r\n');
INSERT INTO postno VALUES (2531,'300-070','대전시','동구','대동\r\n');
INSERT INTO postno VALUES (2532,'300-071','대전시','동구','대1동\r\n');
INSERT INTO postno VALUES (2533,'300-072','대전시','동구','대2동\r\n');
INSERT INTO postno VALUES (2534,'300-080','대전시','동구','소제동\r\n');
INSERT INTO postno VALUES (2535,'300-090','대전시','동구','가양동\r\n');
INSERT INTO postno VALUES (2536,'300-091','대전시','동구','가양1동\r\n');
INSERT INTO postno VALUES (2537,'300-092','대전시','동구','가양2동\r\n');
INSERT INTO postno VALUES (2538,'300-100','대전시','동구','자양동\r\n');
INSERT INTO postno VALUES (2539,'300-110','대전시','동구','신흥동\r\n');
INSERT INTO postno VALUES (2540,'300-120','대전시','동구','용운동\r\n');
INSERT INTO postno VALUES (2541,'300-130','대전시','동구','판암동\r\n');
INSERT INTO postno VALUES (2542,'300-131','대전시','동구','판암1동\r\n');
INSERT INTO postno VALUES (2543,'300-132','대전시','동구','판암2동\r\n');
INSERT INTO postno VALUES (2544,'300-140','대전시','동구','삼정동\r\n');
INSERT INTO postno VALUES (2545,'300-150','대전시','동구','정동\r\n');
INSERT INTO postno VALUES (2546,'300-160','대전시','동구','중동\r\n');
INSERT INTO postno VALUES (2547,'300-170','대전시','동구','삼성동\r\n');
INSERT INTO postno VALUES (2548,'300-171','대전시','동구','삼성1동\r\n');
INSERT INTO postno VALUES (2549,'300-172','대전시','동구','삼성2동\r\n');
INSERT INTO postno VALUES (2550,'300-180','대전시','동구','성남동\r\n');
INSERT INTO postno VALUES (2551,'300-181','대전시','동구','성남1동\r\n');
INSERT INTO postno VALUES (2552,'300-182','대전시','동구','성남2동\r\n');
INSERT INTO postno VALUES (2553,'300-190','대전시','동구','홍도동\r\n');
INSERT INTO postno VALUES (2554,'300-200','대전시','동구','용전동\r\n');
INSERT INTO postno VALUES (2555,'300-210','대전시','동구','대성동\r\n');
INSERT INTO postno VALUES (2556,'300-220','대전시','동구','낭월동\r\n');
INSERT INTO postno VALUES (2557,'300-230','대전시','동구','삼괴동\r\n');
INSERT INTO postno VALUES (2558,'300-240','대전시','동구','상소동\r\n');
INSERT INTO postno VALUES (2559,'300-250','대전시','동구','하소동\r\n');
INSERT INTO postno VALUES (2560,'300-260','대전시','동구','대별동\r\n');
INSERT INTO postno VALUES (2561,'300-270','대전시','동구','이사동\r\n');
INSERT INTO postno VALUES (2562,'300-280','대전시','동구','장척동\r\n');
INSERT INTO postno VALUES (2563,'300-290','대전시','동구','소호동\r\n');
INSERT INTO postno VALUES (2564,'300-300','대전시','동구','구도동\r\n');
INSERT INTO postno VALUES (2565,'300-310','대전시','동구','비룡동\r\n');
INSERT INTO postno VALUES (2566,'300-320','대전시','동구','주산동\r\n');
INSERT INTO postno VALUES (2567,'300-330','대전시','동구','추동\r\n');
INSERT INTO postno VALUES (2568,'300-340','대전시','동구','마산동\r\n');
INSERT INTO postno VALUES (2569,'300-350','대전시','동구','효평동\r\n');
INSERT INTO postno VALUES (2570,'300-360','대전시','동구','직동\r\n');
INSERT INTO postno VALUES (2571,'300-370','대전시','동구','세천동\r\n');
INSERT INTO postno VALUES (2572,'300-380','대전시','동구','신상동\r\n');
INSERT INTO postno VALUES (2573,'300-390','대전시','동구','신하동\r\n');
INSERT INTO postno VALUES (2574,'300-400','대전시','동구','신촌동\r\n');
INSERT INTO postno VALUES (2575,'300-410','대전시','동구','사성동\r\n');
INSERT INTO postno VALUES (2576,'300-420','대전시','동구','주촌동\r\n');
INSERT INTO postno VALUES (2577,'300-430','대전시','동구','오동동\r\n');
INSERT INTO postno VALUES (2578,'300-440','대전시','동구','내탑동\r\n');
INSERT INTO postno VALUES (2579,'300-450','대전시','동구','용계동\r\n');
INSERT INTO postno VALUES (2580,'300-600','대전시','동구','대전우체국사서함\r\n');
INSERT INTO postno VALUES (2581,'300-711','대전시','동구','가양2동 대전보건전문대학\r\n');
INSERT INTO postno VALUES (2582,'300-712','대전시','동구','의료보험관리공단동구\r\n');
INSERT INTO postno VALUES (2583,'300-713','대전시','동구','용전동 한국전력공사대전지사\r\n');
INSERT INTO postno VALUES (2584,'300-714','대전시','동구','원동 대전백화점\r\n');
INSERT INTO postno VALUES (2585,'300-715','대전시','동구','자양동 대전실업전문대학\r\n');
INSERT INTO postno VALUES (2586,'300-716','대전시','동구','용운동 대전대학교\r\n');
INSERT INTO postno VALUES (2587,'300-717','대전시','동구','삼성2동 대전산업대학교\r\n');
INSERT INTO postno VALUES (2588,'300-718','대전시','동구','자양동 우송산업대학교\r\n');
INSERT INTO postno VALUES (2589,'300-719','대전시','동구','자양동 중경공업전문대학\r\n');
INSERT INTO postno VALUES (2590,'300-720','대전시','동구','중동 동양백화점중앙점\r\n');
INSERT INTO postno VALUES (2591,'300-721','대전시','동구','중동 홍명상가\r\n');
INSERT INTO postno VALUES (2592,'300-722','대전시','동구','효동 T.J.B대전방송국\r\n');
INSERT INTO postno VALUES (2593,'301-010','대전시','중구','대흥동\r\n');
INSERT INTO postno VALUES (2594,'301-011','대전시','중구','대흥1동\r\n');
INSERT INTO postno VALUES (2595,'301-012','대전시','중구','대흥2동\r\n');
INSERT INTO postno VALUES (2596,'301-013','대전시','중구','대흥3동\r\n');
INSERT INTO postno VALUES (2597,'301-020','대전시','중구','문창동\r\n');
INSERT INTO postno VALUES (2598,'301-021','대전시','중구','문창1동\r\n');
INSERT INTO postno VALUES (2599,'301-022','대전시','중구','문창2동\r\n');
INSERT INTO postno VALUES (2600,'301-030','대전시','중구','부사동\r\n');
INSERT INTO postno VALUES (2601,'301-040','대전시','중구','대사동\r\n');
INSERT INTO postno VALUES (2602,'301-050','대전시','중구','선화동\r\n');
INSERT INTO postno VALUES (2603,'301-051','대전시','중구','선화1동\r\n');
INSERT INTO postno VALUES (2604,'301-052','대전시','중구','선화2동\r\n');
INSERT INTO postno VALUES (2605,'301-053','대전시','중구','선화3동\r\n');
INSERT INTO postno VALUES (2606,'301-060','대전시','중구','은행동\r\n');
INSERT INTO postno VALUES (2607,'301-070','대전시','중구','목동\r\n');
INSERT INTO postno VALUES (2608,'301-080','대전시','중구','중촌동\r\n');
INSERT INTO postno VALUES (2609,'301-090','대전시','중구','옥계동\r\n');
INSERT INTO postno VALUES (2610,'301-091','대전시','중구','석교동\r\n');
INSERT INTO postno VALUES (2611,'301-092','대전시','중구','호동\r\n');
INSERT INTO postno VALUES (2612,'301-110','대전시','중구','용두동\r\n');
INSERT INTO postno VALUES (2613,'301-111','대전시','중구','용두1동\r\n');
INSERT INTO postno VALUES (2614,'301-112','대전시','중구','용두2동\r\n');
INSERT INTO postno VALUES (2615,'301-120','대전시','중구','오류동\r\n');
INSERT INTO postno VALUES (2616,'301-130','대전시','중구','문화동\r\n');
INSERT INTO postno VALUES (2617,'301-131','대전시','중구','문화1동\r\n');
INSERT INTO postno VALUES (2618,'301-132','대전시','중구','문화2동\r\n');
INSERT INTO postno VALUES (2619,'301-140','대전시','중구','유천동\r\n');
INSERT INTO postno VALUES (2620,'301-141','대전시','중구','유천1동\r\n');
INSERT INTO postno VALUES (2621,'301-142','대전시','중구','유천2동\r\n');
INSERT INTO postno VALUES (2622,'301-150','대전시','중구','태평동\r\n');
INSERT INTO postno VALUES (2623,'301-151','대전시','중구','태평1동\r\n');
INSERT INTO postno VALUES (2624,'301-152','대전시','중구','태평2동\r\n');
INSERT INTO postno VALUES (2625,'301-211','대전시','중구','산성동\r\n');
INSERT INTO postno VALUES (2626,'301-212','대전시','중구','사정동\r\n');
INSERT INTO postno VALUES (2627,'301-213','대전시','중구','안영동\r\n');
INSERT INTO postno VALUES (2628,'301-215','대전시','중구','무수동\r\n');
INSERT INTO postno VALUES (2629,'301-218','대전시','중구','구완동\r\n');
INSERT INTO postno VALUES (2630,'301-221','대전시','중구','침산동\r\n');
INSERT INTO postno VALUES (2631,'301-225','대전시','중구','목달동\r\n');
INSERT INTO postno VALUES (2632,'301-228','대전시','중구','정생동\r\n');
INSERT INTO postno VALUES (2633,'301-231','대전시','중구','어남동\r\n');
INSERT INTO postno VALUES (2634,'301-233','대전시','중구','금동\r\n');
INSERT INTO postno VALUES (2635,'301-600','대전시','중구','서대전우체국사서함\r\n');
INSERT INTO postno VALUES (2636,'301-701','대전시','중구','대흥2동 중구청\r\n');
INSERT INTO postno VALUES (2637,'301-702','대전시','중구','대흥2동 대전중부경찰서\r\n');
INSERT INTO postno VALUES (2638,'301-703','대전시','중구','대흥2동 대전지방노동사무소\r\n');
INSERT INTO postno VALUES (2639,'301-704','대전시','중구','문화1동 대전지방보훈청\r\n');
INSERT INTO postno VALUES (2640,'301-705','대전시','중구','문화1동 충남교육청\r\n');
INSERT INTO postno VALUES (2641,'301-706','대전시','중구','문화1동 충남지방병무청\r\n');
INSERT INTO postno VALUES (2642,'301-707','대전시','중구','문화1동 대전세무서\r\n');
INSERT INTO postno VALUES (2643,'301-708','대전시','중구','선화1동 충남지방경찰청\r\n');
INSERT INTO postno VALUES (2644,'301-709','대전시','중구','선화3동 대전고등검찰청\r\n');
INSERT INTO postno VALUES (2645,'301-710','대전시','중구','선화3동 대전고등법원\r\n');
INSERT INTO postno VALUES (2646,'301-711','대전시','중구','선화3동 대전지방검찰청\r\n');
INSERT INTO postno VALUES (2647,'301-712','대전시','중구','선화3동 대전지방법원\r\n');
INSERT INTO postno VALUES (2648,'301-714','대전시','중구','대흥2동 대전시청\r\n');
INSERT INTO postno VALUES (2649,'301-715','대전시','중구','문화1동 대전일보사건물\r\n');
INSERT INTO postno VALUES (2650,'301-721','대전시','중구','대사동 충남대학병원\r\n');
INSERT INTO postno VALUES (2651,'301-722','대전시','중구','대흥2동 대림빌딩\r\n');
INSERT INTO postno VALUES (2652,'301-723','대전시','중구','대흥2동 성모병원\r\n');
INSERT INTO postno VALUES (2653,'301-724','대전시','중구','대흥3동 대전한방병원\r\n');
INSERT INTO postno VALUES (2654,'301-725','대전시','중구','목동 선병원\r\n');
INSERT INTO postno VALUES (2655,'301-726','대전시','중구','목동 을지병원\r\n');
INSERT INTO postno VALUES (2656,'301-727','대전시','중구','부사동 한국이동통신충남지사\r\n');
INSERT INTO postno VALUES (2657,'301-728','대전시','중구','선화1동 대전문화방송국건물\r\n');
INSERT INTO postno VALUES (2658,'301-729','대전시','중구','목동 목원대학\r\n');
INSERT INTO postno VALUES (2659,'301-730','대전시','중구','선화1동 기독교봉사회관\r\n');
INSERT INTO postno VALUES (2660,'301-731','대전시','중구','선화1동 교보생명빌딩\r\n');
INSERT INTO postno VALUES (2661,'301-732','대전시','중구','선화1동 동양백화점\r\n');
INSERT INTO postno VALUES (2662,'301-733','대전시','중구','선화1동 삼성생명빌딩\r\n');
INSERT INTO postno VALUES (2663,'301-734','대전시','중구','선화2동 유원오피스텔\r\n');
INSERT INTO postno VALUES (2664,'301-735','대전시','중구','선화2동 중앙투자신탁\r\n');
INSERT INTO postno VALUES (2665,'301-736','대전시','중구','오류동 동아생명빌딩\r\n');
INSERT INTO postno VALUES (2666,'301-737','대전시','중구','오류동 사학연금회관\r\n');
INSERT INTO postno VALUES (2667,'301-738','대전시','중구','오류동 새마을금고연합회\r\n');
INSERT INTO postno VALUES (2668,'301-739','대전시','중구','오류동 센트리아오피스텔\r\n');
INSERT INTO postno VALUES (2669,'301-740','대전시','중구','오류동 제일가구프라자\r\n');
INSERT INTO postno VALUES (2670,'301-741','대전시','중구','오류동 중앙상호신용금고\r\n');
INSERT INTO postno VALUES (2671,'301-742','대전시','중구','오류동 중앙생명보험본점\r\n');
INSERT INTO postno VALUES (2672,'301-743','대전시','중구','오류동 충청은행본점\r\n');
INSERT INTO postno VALUES (2673,'301-744','대전시','중구','용두2동 동아빌딩\r\n');
INSERT INTO postno VALUES (2674,'301-745','대전시','중구','용두2동 동아일보빌딩\r\n');
INSERT INTO postno VALUES (2675,'301-746','대전시','중구','용두2동 용두축협빌딩\r\n');
INSERT INTO postno VALUES (2676,'301-763','대전시','중구','선화1동 충남도청\r\n');
INSERT INTO postno VALUES (2677,'301-790','대전시','중구','목동 한국방송공사대전방송총\r\n');
INSERT INTO postno VALUES (2678,'302-010','대전시','서구','흑석동\r\n');
INSERT INTO postno VALUES (2679,'302-020','대전시','서구','매로동\r\n');
INSERT INTO postno VALUES (2680,'302-030','대전시','서구','용촌동\r\n');
INSERT INTO postno VALUES (2681,'302-040','대전시','서구','장안동\r\n');
INSERT INTO postno VALUES (2682,'302-050','대전시','서구','산직동\r\n');
INSERT INTO postno VALUES (2683,'302-060','대전시','서구','봉곡동\r\n');
INSERT INTO postno VALUES (2684,'302-070','대전시','서구','평촌동\r\n');
INSERT INTO postno VALUES (2685,'302-080','대전시','서구','오동\r\n');
INSERT INTO postno VALUES (2686,'302-090','대전시','서구','원정동\r\n');
INSERT INTO postno VALUES (2687,'302-100','대전시','서구','우명동\r\n');
INSERT INTO postno VALUES (2688,'302-110','대전시','서구','괴곡동\r\n');
INSERT INTO postno VALUES (2689,'302-150','대전시','서구','만년동\r\n');
INSERT INTO postno VALUES (2690,'302-160','대전시','서구','도마동\r\n');
INSERT INTO postno VALUES (2691,'302-161','대전시','서구','도마1동\r\n');
INSERT INTO postno VALUES (2692,'302-162','대전시','서구','도마2동\r\n');
INSERT INTO postno VALUES (2693,'302-171','대전시','서구','갈마동\r\n');
INSERT INTO postno VALUES (2694,'302-173','대전시','서구','둔산동\r\n');
INSERT INTO postno VALUES (2695,'302-181','대전시','서구','내동\r\n');
INSERT INTO postno VALUES (2696,'302-182','대전시','서구','가장동\r\n');
INSERT INTO postno VALUES (2697,'302-190','대전시','서구','변동\r\n');
INSERT INTO postno VALUES (2698,'302-200','대전시','서구','괴정동\r\n');
INSERT INTO postno VALUES (2699,'302-210','대전시','서구','복수동\r\n');
INSERT INTO postno VALUES (2700,'302-220','대전시','서구','용문동\r\n');
INSERT INTO postno VALUES (2701,'302-222','대전시','서구','삼천동\r\n');
INSERT INTO postno VALUES (2702,'302-223','대전시','서구','탄방동\r\n');
INSERT INTO postno VALUES (2703,'302-230','대전시','서구','정림동\r\n');
INSERT INTO postno VALUES (2704,'302-241','대전시','서구','가수원동\r\n');
INSERT INTO postno VALUES (2705,'302-243','대전시','서구','관저동\r\n');
INSERT INTO postno VALUES (2706,'302-252','대전시','서구','원내동\r\n');
INSERT INTO postno VALUES (2707,'302-280','대전시','서구','월평동\r\n');
INSERT INTO postno VALUES (2708,'302-281','대전시','서구','월평1동\r\n');
INSERT INTO postno VALUES (2709,'302-282','대전시','서구','월평2동\r\n');
INSERT INTO postno VALUES (2710,'302-318','대전시','서구','도안동\r\n');
INSERT INTO postno VALUES (2711,'302-711','대전시','서구','갈마동 중도일보\r\n');
INSERT INTO postno VALUES (2712,'302-712','대전시','서구','삼천동 한신코아백화점\r\n');
INSERT INTO postno VALUES (2713,'302-713','대전시','서구','탄방동 국민연금관리공단\r\n');
INSERT INTO postno VALUES (2714,'302-735','대전시','서구','도마2동 배재대학교\r\n');
INSERT INTO postno VALUES (2715,'305-150','대전시','유성구','반석동\r\n');
INSERT INTO postno VALUES (2716,'305-151','대전시','유성구','안산동\r\n');
INSERT INTO postno VALUES (2717,'305-152','대전시','유성구','수남동\r\n');
INSERT INTO postno VALUES (2718,'305-153','대전시','유성구','추목동\r\n');
INSERT INTO postno VALUES (2719,'305-154','대전시','유성구','신봉동\r\n');
INSERT INTO postno VALUES (2720,'305-155','대전시','유성구','자운동\r\n');
INSERT INTO postno VALUES (2721,'305-156','대전시','유성구','외삼동\r\n');
INSERT INTO postno VALUES (2722,'305-201','대전시','유성구','성북동\r\n');
INSERT INTO postno VALUES (2723,'305-202','대전시','유성구','송정동\r\n');
INSERT INTO postno VALUES (2724,'305-203','대전시','유성구','방동\r\n');
INSERT INTO postno VALUES (2725,'305-205','대전시','유성구','세동\r\n');
INSERT INTO postno VALUES (2726,'305-210','대전시','유성구','온천동\r\n');
INSERT INTO postno VALUES (2727,'305-211','대전시','유성구','온천1동\r\n');
INSERT INTO postno VALUES (2728,'305-212','대전시','유성구','온천2동\r\n');
INSERT INTO postno VALUES (2729,'305-250','대전시','유성구','교촌동\r\n');
INSERT INTO postno VALUES (2730,'305-251','대전시','유성구','대정동\r\n');
INSERT INTO postno VALUES (2731,'305-252','대전시','유성구','원내동\r\n');
INSERT INTO postno VALUES (2732,'305-301','대전시','유성구','봉명동\r\n');
INSERT INTO postno VALUES (2733,'305-304','대전시','유성구','복룡동\r\n');
INSERT INTO postno VALUES (2734,'305-308','대전시','유성구','장대동\r\n');
INSERT INTO postno VALUES (2735,'305-311','대전시','유성구','구암동\r\n');
INSERT INTO postno VALUES (2736,'305-313','대전시','유성구','상대동\r\n');
INSERT INTO postno VALUES (2737,'305-315','대전시','유성구','원신흥동\r\n');
INSERT INTO postno VALUES (2738,'305-320','대전시','유성구','덕명동\r\n');
INSERT INTO postno VALUES (2739,'305-323','대전시','유성구','갑동\r\n');
INSERT INTO postno VALUES (2740,'305-325','대전시','유성구','노은동\r\n');
INSERT INTO postno VALUES (2741,'305-328','대전시','유성구','죽동\r\n');
INSERT INTO postno VALUES (2742,'305-330','대전시','유성구','지족동\r\n');
INSERT INTO postno VALUES (2743,'305-333','대전시','유성구','어은동\r\n');
INSERT INTO postno VALUES (2744,'305-335','대전시','유성구','궁동\r\n');
INSERT INTO postno VALUES (2745,'305-338','대전시','유성구','구성동\r\n');
INSERT INTO postno VALUES (2746,'305-340','대전시','유성구','도룡동\r\n');
INSERT INTO postno VALUES (2747,'305-343','대전시','유성구','장동\r\n');
INSERT INTO postno VALUES (2748,'305-345','대전시','유성구','신성동\r\n');
INSERT INTO postno VALUES (2749,'305-348','대전시','유성구','화암동\r\n');
INSERT INTO postno VALUES (2750,'305-350','대전시','유성구','가정동\r\n');
INSERT INTO postno VALUES (2751,'305-353','대전시','유성구','덕진동\r\n');
INSERT INTO postno VALUES (2752,'305-355','대전시','유성구','방현동\r\n');
INSERT INTO postno VALUES (2753,'305-358','대전시','유성구','하기동\r\n');
INSERT INTO postno VALUES (2754,'305-360','대전시','유성구','학하동\r\n');
INSERT INTO postno VALUES (2755,'305-363','대전시','유성구','용계동\r\n');
INSERT INTO postno VALUES (2756,'305-365','대전시','유성구','계산동\r\n');
INSERT INTO postno VALUES (2757,'305-370','대전시','유성구','원촌동\r\n');
INSERT INTO postno VALUES (2758,'305-380','대전시','유성구','문지동\r\n');
INSERT INTO postno VALUES (2759,'305-390','대전시','유성구','전민동\r\n');
INSERT INTO postno VALUES (2760,'305-500','대전시','유성구','용산동\r\n');
INSERT INTO postno VALUES (2761,'305-501','대전시','유성구','금탄동\r\n');
INSERT INTO postno VALUES (2762,'305-502','대전시','유성구','금고동\r\n');
INSERT INTO postno VALUES (2763,'305-503','대전시','유성구','송강동\r\n');
INSERT INTO postno VALUES (2764,'305-504','대전시','유성구','구룡동\r\n');
INSERT INTO postno VALUES (2765,'305-505','대전시','유성구','둔곡동\r\n');
INSERT INTO postno VALUES (2766,'305-506','대전시','유성구','봉산동\r\n');
INSERT INTO postno VALUES (2767,'305-507','대전시','유성구','대동\r\n');
INSERT INTO postno VALUES (2768,'305-508','대전시','유성구','신동\r\n');
INSERT INTO postno VALUES (2769,'305-509','대전시','유성구','관평동\r\n');
INSERT INTO postno VALUES (2770,'305-510','대전시','유성구','탑림동\r\n');
INSERT INTO postno VALUES (2771,'305-600','대전시','유성구','유성우체국사서함\r\n');
INSERT INTO postno VALUES (2772,'305-701','대전시','유성구','구성동 한국과학기술원\r\n');
INSERT INTO postno VALUES (2773,'305-711','대전시','유성구','지족동 대전극동방송\r\n');
INSERT INTO postno VALUES (2774,'305-764','대전시','유성구','궁동 충남대학교\r\n');
INSERT INTO postno VALUES (2775,'306-010','대전시','대덕구','오정동\r\n');
INSERT INTO postno VALUES (2776,'306-020','대전시','대덕구','대화동\r\n');
INSERT INTO postno VALUES (2777,'306-030','대전시','대덕구','비래동\r\n');
INSERT INTO postno VALUES (2778,'306-040','대전시','대덕구','송촌동\r\n');
INSERT INTO postno VALUES (2779,'306-050','대전시','대덕구','중리동\r\n');
INSERT INTO postno VALUES (2780,'306-060','대전시','대덕구','법동\r\n');
INSERT INTO postno VALUES (2781,'306-061','대전시','대덕구','법1동\r\n');
INSERT INTO postno VALUES (2782,'306-062','대전시','대덕구','법2동\r\n');
INSERT INTO postno VALUES (2783,'306-070','대전시','대덕구','읍내동\r\n');
INSERT INTO postno VALUES (2784,'306-080','대전시','대덕구','신대동\r\n');
INSERT INTO postno VALUES (2785,'306-090','대전시','대덕구','연축동\r\n');
INSERT INTO postno VALUES (2786,'306-100','대전시','대덕구','와동\r\n');
INSERT INTO postno VALUES (2787,'306-110','대전시','대덕구','장동\r\n');
INSERT INTO postno VALUES (2788,'306-120','대전시','대덕구','상서동\r\n');
INSERT INTO postno VALUES (2789,'306-130','대전시','대덕구','평촌동\r\n');
INSERT INTO postno VALUES (2790,'306-140','대전시','대덕구','용호동\r\n');
INSERT INTO postno VALUES (2791,'306-150','대전시','대덕구','삼정동\r\n');
INSERT INTO postno VALUES (2792,'306-160','대전시','대덕구','갈전동\r\n');
INSERT INTO postno VALUES (2793,'306-170','대전시','대덕구','이현동\r\n');
INSERT INTO postno VALUES (2794,'306-180','대전시','대덕구','미호동\r\n');
INSERT INTO postno VALUES (2795,'306-190','대전시','대덕구','석봉동\r\n');
INSERT INTO postno VALUES (2796,'306-200','대전시','대덕구','덕암동\r\n');
INSERT INTO postno VALUES (2797,'306-210','대전시','대덕구','목상동\r\n');
INSERT INTO postno VALUES (2798,'306-220','대전시','대덕구','문평동\r\n');
INSERT INTO postno VALUES (2799,'306-230','대전시','대덕구','신일동\r\n');
INSERT INTO postno VALUES (2800,'306-240','대전시','대덕구','부수동\r\n');
INSERT INTO postno VALUES (2801,'306-250','대전시','대덕구','황호동\r\n');
INSERT INTO postno VALUES (2802,'306-701','대전시','대덕구','문평동 대전북부경찰서\r\n');
INSERT INTO postno VALUES (2803,'306-702','대전시','대덕구','법2동  대전동부경찰서\r\n');
INSERT INTO postno VALUES (2804,'306-711','대전시','대덕구','연축동 한국수자원공사\r\n');
INSERT INTO postno VALUES (2805,'306-712','대전시','대덕구','평촌동 한국담배인삼공사\r\n');
INSERT INTO postno VALUES (2806,'306-791','대전시','대덕구','오정동 한남대학교\r\n');
INSERT INTO postno VALUES (2807,'312-700','충남','금산군','금성면 금산위성지구국\r\n');
INSERT INTO postno VALUES (2808,'312-800','충남','금산군','금산읍\r\n');
INSERT INTO postno VALUES (2809,'312-820','충남','금산군','제원면\r\n');
INSERT INTO postno VALUES (2810,'312-830','충남','금산군','군북면\r\n');
INSERT INTO postno VALUES (2811,'312-835','충남','금산군','군북면 외부리\r\n');
INSERT INTO postno VALUES (2812,'312-835','충남','금산군','군북면 내부리\r\n');
INSERT INTO postno VALUES (2813,'312-835','충남','금산군','군북면 호치리\r\n');
INSERT INTO postno VALUES (2814,'312-840','충남','금산군','부리면\r\n');
INSERT INTO postno VALUES (2815,'312-850','충남','금산군','남일면\r\n');
INSERT INTO postno VALUES (2816,'312-890','충남','금산군','남이면\r\n');
INSERT INTO postno VALUES (2817,'312-895','충남','금산군','남이면 성곡리\r\n');
INSERT INTO postno VALUES (2818,'312-897','충남','금산군','남이면 매곡리\r\n');
INSERT INTO postno VALUES (2819,'312-897','충남','금산군','남이면 석동리\r\n');
INSERT INTO postno VALUES (2820,'312-910','충남','금산군','금성면\r\n');
INSERT INTO postno VALUES (2821,'312-920','충남','금산군','복수면\r\n');
INSERT INTO postno VALUES (2822,'312-930','충남','금산군','진산면\r\n');
INSERT INTO postno VALUES (2823,'312-940','충남','금산군','추부면\r\n');
INSERT INTO postno VALUES (2824,'314-010','충남','공주시','금성동\r\n');
INSERT INTO postno VALUES (2825,'314-020','충남','공주시','웅진동\r\n');
INSERT INTO postno VALUES (2826,'314-030','충남','공주시','산성동\r\n');
INSERT INTO postno VALUES (2827,'314-040','충남','공주시','옥룡동\r\n');
INSERT INTO postno VALUES (2828,'314-050','충남','공주시','중동\r\n');
INSERT INTO postno VALUES (2829,'314-060','충남','공주시','봉황동\r\n');
INSERT INTO postno VALUES (2830,'314-070','충남','공주시','중학동\r\n');
INSERT INTO postno VALUES (2831,'314-080','충남','공주시','금학동\r\n');
INSERT INTO postno VALUES (2832,'314-090','충남','공주시','교동\r\n');
INSERT INTO postno VALUES (2833,'314-100','충남','공주시','반죽동\r\n');
INSERT INTO postno VALUES (2834,'314-110','충남','공주시','신관동\r\n');
INSERT INTO postno VALUES (2835,'314-120','충남','공주시','월송동\r\n');
INSERT INTO postno VALUES (2836,'314-130','충남','공주시','무릉동\r\n');
INSERT INTO postno VALUES (2837,'314-140','충남','공주시','금흥동\r\n');
INSERT INTO postno VALUES (2838,'314-150','충남','공주시','쌍신동\r\n');
INSERT INTO postno VALUES (2839,'314-160','충남','공주시','월미동\r\n');
INSERT INTO postno VALUES (2840,'314-170','충남','공주시','봉정동\r\n');
INSERT INTO postno VALUES (2841,'314-180','충남','공주시','주미동\r\n');
INSERT INTO postno VALUES (2842,'314-190','충남','공주시','태봉동\r\n');
INSERT INTO postno VALUES (2843,'314-200','충남','공주시','오곡동\r\n');
INSERT INTO postno VALUES (2844,'314-210','충남','공주시','신기동\r\n');
INSERT INTO postno VALUES (2845,'314-220','충남','공주시','소학동\r\n');
INSERT INTO postno VALUES (2846,'314-230','충남','공주시','성왕동\r\n');
INSERT INTO postno VALUES (2847,'314-240','충남','공주시','검상동\r\n');
INSERT INTO postno VALUES (2848,'314-600','충남','공주시','공주우체국사서함\r\n');
INSERT INTO postno VALUES (2849,'314-701','충남','공주시','신관동 공주대하교\r\n');
INSERT INTO postno VALUES (2850,'314-702','충남','공주시','봉황동 공주시청\r\n');
INSERT INTO postno VALUES (2851,'314-810','충남','공주시','의당면\r\n');
INSERT INTO postno VALUES (2852,'314-820','충남','공주시','정안면\r\n');
INSERT INTO postno VALUES (2853,'314-830','충남','공주시','계룡면\r\n');
INSERT INTO postno VALUES (2854,'314-840','충남','공주시','이인면\r\n');
INSERT INTO postno VALUES (2855,'314-850','충남','공주시','탄천면\r\n');
INSERT INTO postno VALUES (2856,'314-860','충남','공주시','우성면\r\n');
INSERT INTO postno VALUES (2857,'314-870','충남','공주시','사곡면\r\n');
INSERT INTO postno VALUES (2858,'314-880','충남','공주시','신풍면\r\n');
INSERT INTO postno VALUES (2859,'314-890','충남','공주시','유구면\r\n');
INSERT INTO postno VALUES (2860,'314-910','충남','공주시','장기면\r\n');
INSERT INTO postno VALUES (2861,'314-920','충남','공주시','반포면\r\n');
INSERT INTO postno VALUES (2862,'320-010','충남','논산시','강산동\r\n');
INSERT INTO postno VALUES (2863,'320-020','충남','논산시','관촉동\r\n');
INSERT INTO postno VALUES (2864,'320-030','충남','논산시','내동\r\n');
INSERT INTO postno VALUES (2865,'320-040','충남','논산시','덕지동\r\n');
INSERT INTO postno VALUES (2866,'320-050','충남','논산시','대교동\r\n');
INSERT INTO postno VALUES (2867,'320-060','충남','논산시','등화동\r\n');
INSERT INTO postno VALUES (2868,'320-070','충남','논산시','만월동\r\n');
INSERT INTO postno VALUES (2869,'320-080','충남','논산시','부창동\r\n');
INSERT INTO postno VALUES (2870,'320-090','충남','논산시','지산동\r\n');
INSERT INTO postno VALUES (2871,'320-110','충남','논산시','취암동\r\n');
INSERT INTO postno VALUES (2872,'320-120','충남','논산시','화지동\r\n');
INSERT INTO postno VALUES (2873,'320-600','충남','논산시','논산우체국사서함\r\n');
INSERT INTO postno VALUES (2874,'320-701','충남','논산시','내동 논산시청\r\n');
INSERT INTO postno VALUES (2875,'320-711','충남','논산시','내동 건양대학교\r\n');
INSERT INTO postno VALUES (2876,'320-810','충남','논산시','채운면\r\n');
INSERT INTO postno VALUES (2877,'320-820','충남','논산시','은진면\r\n');
INSERT INTO postno VALUES (2878,'320-830','충남','논산시','연무읍\r\n');
INSERT INTO postno VALUES (2879,'320-840','충남','논산시','가야곡면\r\n');
INSERT INTO postno VALUES (2880,'320-850','충남','논산시','양촌면\r\n');
INSERT INTO postno VALUES (2881,'320-860','충남','논산시','부적면\r\n');
INSERT INTO postno VALUES (2882,'320-870','충남','논산시','연산면\r\n');
INSERT INTO postno VALUES (2883,'320-880','충남','논산시','벌곡면\r\n');
INSERT INTO postno VALUES (2884,'320-900','충남','논산시','강경읍\r\n');
INSERT INTO postno VALUES (2885,'320-910','충남','논산시','두마면\r\n');
INSERT INTO postno VALUES (2886,'320-920','충남','논산시','노성면\r\n');
INSERT INTO postno VALUES (2887,'320-930','충남','논산시','상월면\r\n');
INSERT INTO postno VALUES (2888,'320-940','충남','논산시','성동면\r\n');
INSERT INTO postno VALUES (2889,'320-950','충남','논산시','광석면\r\n');
INSERT INTO postno VALUES (2890,'323-800','충남','부여군','부여읍\r\n');
INSERT INTO postno VALUES (2891,'323-810','충남','부여군','규암면\r\n');
INSERT INTO postno VALUES (2892,'323-820','충남','부여군','은산면\r\n');
INSERT INTO postno VALUES (2893,'323-830','충남','부여군','구룡면\r\n');
INSERT INTO postno VALUES (2894,'323-840','충남','부여군','홍산면\r\n');
INSERT INTO postno VALUES (2895,'323-850','충남','부여군','남면\r\n');
INSERT INTO postno VALUES (2896,'323-860','충남','부여군','충화면\r\n');
INSERT INTO postno VALUES (2897,'323-870','충남','부여군','옥산면\r\n');
INSERT INTO postno VALUES (2898,'323-880','충남','부여군','내산면\r\n');
INSERT INTO postno VALUES (2899,'323-890','충남','부여군','외산면\r\n');
INSERT INTO postno VALUES (2900,'323-910','충남','부여군','장암면\r\n');
INSERT INTO postno VALUES (2901,'323-920','충남','부여군','임천면\r\n');
INSERT INTO postno VALUES (2902,'323-930','충남','부여군','양화면\r\n');
INSERT INTO postno VALUES (2903,'323-940','충남','부여군','세도면\r\n');
INSERT INTO postno VALUES (2904,'323-950','충남','부여군','석성면\r\n');
INSERT INTO postno VALUES (2905,'323-960','충남','부여군','초촌면\r\n');
INSERT INTO postno VALUES (2906,'325-800','충남','서천군','서천읍\r\n');
INSERT INTO postno VALUES (2907,'325-810','충남','서천군','마서면\r\n');
INSERT INTO postno VALUES (2908,'325-820','충남','서천군','판교면\r\n');
INSERT INTO postno VALUES (2909,'325-830','충남','서천군','기산면\r\n');
INSERT INTO postno VALUES (2910,'325-840','충남','서천군','한산면\r\n');
INSERT INTO postno VALUES (2911,'325-850','충남','서천군','화양면\r\n');
INSERT INTO postno VALUES (2912,'325-860','충남','서천군','마산면\r\n');
INSERT INTO postno VALUES (2913,'325-870','충남','서천군','종천면\r\n');
INSERT INTO postno VALUES (2914,'325-880','충남','서천군','비인면\r\n');
INSERT INTO postno VALUES (2915,'325-890','충남','서천군','서면\r\n');
INSERT INTO postno VALUES (2916,'325-900','충남','서천군','장항읍\r\n');
INSERT INTO postno VALUES (2917,'325-910','충남','서천군','시초면\r\n');
INSERT INTO postno VALUES (2918,'325-915','충남','서천군','시초면 풍정리\r\n');
INSERT INTO postno VALUES (2919,'325-915','충남','서천군','시초면 후암리\r\n');
INSERT INTO postno VALUES (2920,'325-920','충남','서천군','문산면\r\n');
INSERT INTO postno VALUES (2921,'330-010','충남','천안시','대흥동\r\n');
INSERT INTO postno VALUES (2922,'330-020','충남','천안시','문화동\r\n');
INSERT INTO postno VALUES (2923,'330-030','충남','천안시','오룡동\r\n');
INSERT INTO postno VALUES (2924,'330-040','충남','천안시','사직동\r\n');
INSERT INTO postno VALUES (2925,'330-050','충남','천안시','영성동\r\n');
INSERT INTO postno VALUES (2926,'330-060','충남','천안시','구성동\r\n');
INSERT INTO postno VALUES (2927,'330-070','충남','천안시','원성동\r\n');
INSERT INTO postno VALUES (2928,'330-071','충남','천안시','원성1동\r\n');
INSERT INTO postno VALUES (2929,'330-072','충남','천안시','원성2동\r\n');
INSERT INTO postno VALUES (2930,'330-080','충남','천안시','구룡동\r\n');
INSERT INTO postno VALUES (2931,'330-090','충남','천안시','쌍룡동\r\n');
INSERT INTO postno VALUES (2932,'330-100','충남','천안시','봉명동\r\n');
INSERT INTO postno VALUES (2933,'330-110','충남','천안시','다가동\r\n');
INSERT INTO postno VALUES (2934,'330-120','충남','천안시','와촌동\r\n');
INSERT INTO postno VALUES (2935,'330-130','충남','천안시','성황동\r\n');
INSERT INTO postno VALUES (2936,'330-140','충남','천안시','유량동\r\n');
INSERT INTO postno VALUES (2937,'330-150','충남','천안시','삼용동\r\n');
INSERT INTO postno VALUES (2938,'330-160','충남','천안시','신부동\r\n');
INSERT INTO postno VALUES (2939,'330-170','충남','천안시','성정동\r\n');
INSERT INTO postno VALUES (2940,'330-171','충남','천안시','성정1동\r\n');
INSERT INTO postno VALUES (2941,'330-172','충남','천안시','성정2동\r\n');
INSERT INTO postno VALUES (2942,'330-180','충남','천안시','안서동\r\n');
INSERT INTO postno VALUES (2943,'330-190','충남','천안시','청수동\r\n');
INSERT INTO postno VALUES (2944,'330-200','충남','천안시','차암동\r\n');
INSERT INTO postno VALUES (2945,'330-210','충남','천안시','두정동\r\n');
INSERT INTO postno VALUES (2946,'330-220','충남','천안시','백석동\r\n');
INSERT INTO postno VALUES (2947,'330-230','충남','천안시','불당동\r\n');
INSERT INTO postno VALUES (2948,'330-240','충남','천안시','부대동\r\n');
INSERT INTO postno VALUES (2949,'330-250','충남','천안시','용곡동\r\n');
INSERT INTO postno VALUES (2950,'330-260','충남','천안시','신방동\r\n');
INSERT INTO postno VALUES (2951,'330-270','충남','천안시','청당동\r\n');
INSERT INTO postno VALUES (2952,'330-280','충남','천안시','신당동\r\n');
INSERT INTO postno VALUES (2953,'330-290','충남','천안시','업성동\r\n');
INSERT INTO postno VALUES (2954,'330-300','충남','천안시','성성동\r\n');
INSERT INTO postno VALUES (2955,'330-600','충남','천안시','천안우체국사서함\r\n');
INSERT INTO postno VALUES (2956,'330-714','충남','천안시','단국대학교(천안캠퍼스)\r\n');
INSERT INTO postno VALUES (2957,'330-715','충남','천안시','단국대 의과대학부속병원\r\n');
INSERT INTO postno VALUES (2958,'330-716','충남','천안시','신부동 단국대학교치과대학\r\n');
INSERT INTO postno VALUES (2959,'330-720','충남','천안시','안서동 천안상명대학교\r\n');
INSERT INTO postno VALUES (2960,'330-721','충남','천안시','봉명동 순천향대학천안병원\r\n');
INSERT INTO postno VALUES (2961,'330-800','충남','천안시','성환읍\r\n');
INSERT INTO postno VALUES (2962,'330-810','충남','천안시','직산면\r\n');
INSERT INTO postno VALUES (2963,'330-820','충남','천안시','입장면\r\n');
INSERT INTO postno VALUES (2964,'330-830','충남','천안시','성거읍\r\n');
INSERT INTO postno VALUES (2965,'330-840','충남','천안시','목천면\r\n');
INSERT INTO postno VALUES (2966,'330-850','충남','천안시','북면\r\n');
INSERT INTO postno VALUES (2967,'330-860','충남','천안시','병천면\r\n');
INSERT INTO postno VALUES (2968,'330-870','충남','천안시','동면\r\n');
INSERT INTO postno VALUES (2969,'330-880','충남','천안시','수신면\r\n');
INSERT INTO postno VALUES (2970,'330-890','충남','천안시','성남면\r\n');
INSERT INTO postno VALUES (2971,'330-910','충남','천안시','풍세면\r\n');
INSERT INTO postno VALUES (2972,'330-920','충남','천안시','광덕면\r\n');
INSERT INTO postno VALUES (2973,'336-010','충남','아산시','온천동\r\n');
INSERT INTO postno VALUES (2974,'336-020','충남','아산시','실옥동\r\n');
INSERT INTO postno VALUES (2975,'336-030','충남','아산시','권곡동\r\n');
INSERT INTO postno VALUES (2976,'336-040','충남','아산시','모종동\r\n');
INSERT INTO postno VALUES (2977,'336-050','충남','아산시','용화동\r\n');
INSERT INTO postno VALUES (2978,'336-060','충남','아산시','풍기동\r\n');
INSERT INTO postno VALUES (2979,'336-070','충남','아산시','방축동\r\n');
INSERT INTO postno VALUES (2980,'336-080','충남','아산시','기산동\r\n');
INSERT INTO postno VALUES (2981,'336-090','충남','아산시','초사동\r\n');
INSERT INTO postno VALUES (2982,'336-110','충남','아산시','점량동\r\n');
INSERT INTO postno VALUES (2983,'336-120','충남','아산시','득산동\r\n');
INSERT INTO postno VALUES (2984,'336-130','충남','아산시','배미동\r\n');
INSERT INTO postno VALUES (2985,'336-140','충남','아산시','신인동\r\n');
INSERT INTO postno VALUES (2986,'336-150','충남','아산시','법곡동\r\n');
INSERT INTO postno VALUES (2987,'336-160','충남','아산시','장존동\r\n');
INSERT INTO postno VALUES (2988,'336-170','충남','아산시','남동\r\n');
INSERT INTO postno VALUES (2989,'336-180','충남','아산시','신동\r\n');
INSERT INTO postno VALUES (2990,'336-190','충남','아산시','읍내동\r\n');
INSERT INTO postno VALUES (2991,'336-210','충남','아산시','좌부동\r\n');
INSERT INTO postno VALUES (2992,'336-600','충남','아산시','아산우체국사서함\r\n');
INSERT INTO postno VALUES (2993,'336-190','충남','아산시','배방면 삼성전자온양사업장\r\n');
INSERT INTO postno VALUES (2994,'336-745','충남','아산시','신창면 순천향대학교\r\n');
INSERT INTO postno VALUES (2995,'336-795','충남','아산시','배방면 호서대학교\r\n');
INSERT INTO postno VALUES (2996,'336-810','충남','아산시','염치읍\r\n');
INSERT INTO postno VALUES (2997,'336-820','충남','아산시','영인면\r\n');
INSERT INTO postno VALUES (2998,'336-830','충남','아산시','인주면\r\n');
INSERT INTO postno VALUES (2999,'336-840','충남','아산시','탕정면\r\n');
INSERT INTO postno VALUES (3000,'336-850','충남','아산시','배방면\r\n');
INSERT INTO postno VALUES (3001,'336-860','충남','아산시','음봉면\r\n');
INSERT INTO postno VALUES (3002,'336-870','충남','아산시','둔포면\r\n');
INSERT INTO postno VALUES (3003,'336-880','충남','아산시','신창면\r\n');
INSERT INTO postno VALUES (3004,'336-890','충남','아산시','선장면\r\n');
INSERT INTO postno VALUES (3005,'336-910','충남','아산시','도고면\r\n');
INSERT INTO postno VALUES (3006,'336-920','충남','아산시','송악면\r\n');
INSERT INTO postno VALUES (3007,'339-700','충남','연기군','고대서창컴퍼스\r\n');
INSERT INTO postno VALUES (3008,'339-701','충남','연기군','홍익대학교조치원캠퍼스\r\n');
INSERT INTO postno VALUES (3009,'339-800','충남','연기군','조치원읍\r\n');
INSERT INTO postno VALUES (3010,'339-810','충남','연기군','서면\r\n');
INSERT INTO postno VALUES (3011,'339-820','충남','연기군','남면\r\n');
INSERT INTO postno VALUES (3012,'339-830','충남','연기군','금남면\r\n');
INSERT INTO postno VALUES (3013,'339-840','충남','연기군','전동면\r\n');
INSERT INTO postno VALUES (3014,'339-850','충남','연기군','전의면\r\n');
INSERT INTO postno VALUES (3015,'339-860','충남','연기군','동면\r\n');
INSERT INTO postno VALUES (3016,'339-870','충남','연기군','소정면\r\n');
INSERT INTO postno VALUES (3017,'340-800','충남','예산군','예산읍\r\n');
INSERT INTO postno VALUES (3018,'340-805','충남','예산군','예산읍 간량리\r\n');
INSERT INTO postno VALUES (3019,'340-805','충남','예산군','예산읍 궁평리\r\n');
INSERT INTO postno VALUES (3020,'340-805','충남','예산군','예산읍 수철리\r\n');
INSERT INTO postno VALUES (3021,'340-805','충남','예산군','예산읍 신례원리\r\n');
INSERT INTO postno VALUES (3022,'340-805','충남','예산군','예산읍 창소리\r\n');
INSERT INTO postno VALUES (3023,'340-810','충남','예산군','대술면\r\n');
INSERT INTO postno VALUES (3024,'340-820','충남','예산군','신양면\r\n');
INSERT INTO postno VALUES (3025,'340-830','충남','예산군','응봉면\r\n');
INSERT INTO postno VALUES (3026,'340-840','충남','예산군','대흥면\r\n');
INSERT INTO postno VALUES (3027,'340-850','충남','예산군','광시면\r\n');
INSERT INTO postno VALUES (3028,'340-860','충남','예산군','신암면\r\n');
INSERT INTO postno VALUES (3029,'336-865','충남','예산군','신암면 신종리 위하평리\r\n');
INSERT INTO postno VALUES (3030,'340-900','충남','예산군','삽교읍\r\n');
INSERT INTO postno VALUES (3031,'340-910','충남','예산군','오가면\r\n');
INSERT INTO postno VALUES (3032,'340-920','충남','예산군','덕산면\r\n');
INSERT INTO postno VALUES (3033,'340-930','충남','예산군','고덕면\r\n');
INSERT INTO postno VALUES (3034,'340-940','충남','예산군','봉산면\r\n');
INSERT INTO postno VALUES (3035,'340-711','충남','예산군','송악면 한보철강\r\n');
INSERT INTO postno VALUES (3036,'343-800','충남','당진군','당진읍\r\n');
INSERT INTO postno VALUES (3037,'343-810','충남','당진군','신평면\r\n');
INSERT INTO postno VALUES (3038,'343-820','충남','당진군','송악면\r\n');
INSERT INTO postno VALUES (3039,'343-825','충남','당진군','송악면 고대리\r\n');
INSERT INTO postno VALUES (3040,'343-825','충남','당진군','송악면 도원리\r\n');
INSERT INTO postno VALUES (3041,'343-825','충남','당진군','송악면 북운리\r\n');
INSERT INTO postno VALUES (3042,'343-825','충남','당진군','송악면 부곡리\r\n');
INSERT INTO postno VALUES (3043,'343-825','충남','당진군','송악면 오곡리\r\n');
INSERT INTO postno VALUES (3044,'343-825','충남','당진군','송악면 월곡리\r\n');
INSERT INTO postno VALUES (3045,'343-825','충남','당진군','송악면 전대리\r\n');
INSERT INTO postno VALUES (3046,'343-825','충남','당진군','송악면 중흥리\r\n');
INSERT INTO postno VALUES (3047,'343-825','충남','당진군','송악면 한진리\r\n');
INSERT INTO postno VALUES (3048,'343-830','충남','당진군','송산면\r\n');
INSERT INTO postno VALUES (3049,'343-840','충남','당진군','고대면\r\n');
INSERT INTO postno VALUES (3050,'343-850','충남','당진군','석문면\r\n');
INSERT INTO postno VALUES (3051,'343-860','충남','당진군','정미면\r\n');
INSERT INTO postno VALUES (3052,'343-870','충남','당진군','대호지면\r\n');
INSERT INTO postno VALUES (3053,'343-880','충남','당진군','면천면\r\n');
INSERT INTO postno VALUES (3054,'343-890','충남','당진군','순성면\r\n');
INSERT INTO postno VALUES (3055,'343-900','충남','당진군','합덕읍\r\n');
INSERT INTO postno VALUES (3056,'343-910','충남','당진군','우강면\r\n');
INSERT INTO postno VALUES (3057,'345-800','충남','청양군','청양읍\r\n');
INSERT INTO postno VALUES (3058,'345-810','충남','청양군','정산면\r\n');
INSERT INTO postno VALUES (3059,'345-820','충남','청양군','화성면\r\n');
INSERT INTO postno VALUES (3060,'345-830','충남','청양군','장평면\r\n');
INSERT INTO postno VALUES (3061,'345-840','충남','청양군','청남면\r\n');
INSERT INTO postno VALUES (3062,'345-850','충남','청양군','남양면\r\n');
INSERT INTO postno VALUES (3063,'345-860','충남','청양군','목면\r\n');
INSERT INTO postno VALUES (3064,'345-870','충남','청양군','운곡면\r\n');
INSERT INTO postno VALUES (3065,'345-880','충남','청양군','비봉면\r\n');
INSERT INTO postno VALUES (3066,'345-890','충남','청양군','대치면\r\n');
INSERT INTO postno VALUES (3067,'350-800','충남','홍성군','홍성읍\r\n');
INSERT INTO postno VALUES (3068,'350-810','충남','홍성군','홍동면\r\n');
INSERT INTO postno VALUES (3069,'350-820','충남','홍성군','금마면\r\n');
INSERT INTO postno VALUES (3070,'350-830','충남','홍성군','홍북면\r\n');
INSERT INTO postno VALUES (3071,'350-840','충남','홍성군','구항면\r\n');
INSERT INTO postno VALUES (3072,'350-850','충남','홍성군','갈산면\r\n');
INSERT INTO postno VALUES (3073,'350-860','충남','홍성군','서부면\r\n');
INSERT INTO postno VALUES (3074,'350-870','충남','홍성군','결성면\r\n');
INSERT INTO postno VALUES (3075,'350-880','충남','홍성군','은하면\r\n');
INSERT INTO postno VALUES (3076,'350-890','충남','홍성군','장곡면\r\n');
INSERT INTO postno VALUES (3077,'350-900','충남','홍성군','광천읍\r\n');
INSERT INTO postno VALUES (3078,'355-010','충남','보령시','대천동\r\n');
INSERT INTO postno VALUES (3079,'355-020','충남','보령시','대관동\r\n');
INSERT INTO postno VALUES (3080,'355-030','충남','보령시','목장동\r\n');
INSERT INTO postno VALUES (3081,'355-040','충남','보령시','신설동\r\n');
INSERT INTO postno VALUES (3082,'355-050','충남','보령시','수청동\r\n');
INSERT INTO postno VALUES (3083,'355-060','충남','보령시','궁촌동\r\n');
INSERT INTO postno VALUES (3084,'355-070','충남','보령시','명천동\r\n');
INSERT INTO postno VALUES (3085,'355-080','충남','보령시','내항동\r\n');
INSERT INTO postno VALUES (3086,'355-090','충남','보령시','남곡동\r\n');
INSERT INTO postno VALUES (3087,'355-110','충남','보령시','요암동\r\n');
INSERT INTO postno VALUES (3088,'355-120','충남','보령시','죽정동\r\n');
INSERT INTO postno VALUES (3089,'355-130','충남','보령시','화산동\r\n');
INSERT INTO postno VALUES (3090,'355-140','충남','보령시','동대동\r\n');
INSERT INTO postno VALUES (3091,'355-150','충남','보령시','신흑동\r\n');
INSERT INTO postno VALUES (3092,'355-600','충남','보령시','보령우체국사서함\r\n');
INSERT INTO postno VALUES (3093,'355-810','충남','보령시','천북면\r\n');
INSERT INTO postno VALUES (3094,'355-815','충남','보령시','천북면 낙동리 빙도\r\n');
INSERT INTO postno VALUES (3095,'355-820','충남','보령시','청소면\r\n');
INSERT INTO postno VALUES (3096,'355-830','충남','보령시','주포면\r\n');
INSERT INTO postno VALUES (3097,'355-840','충남','보령시','오천면\r\n');
INSERT INTO postno VALUES (3098,'355-151','충남','보령시','오천면 녹도리\r\n');
INSERT INTO postno VALUES (3099,'355-151','충남','보령시','오천면 삽시도리\r\n');
INSERT INTO postno VALUES (3100,'355-151','충남','보령시','오천면 외연도리\r\n');
INSERT INTO postno VALUES (3101,'355-847','충남','보령시','오천면 원산도리\r\n');
INSERT INTO postno VALUES (3102,'355-847','충남','보령시','오천면 효자도리\r\n');
INSERT INTO postno VALUES (3103,'355-850','충남','보령시','웅천면\r\n');
INSERT INTO postno VALUES (3104,'355-860','충남','보령시','주산면\r\n');
INSERT INTO postno VALUES (3105,'355-870','충남','보령시','미산면\r\n');
INSERT INTO postno VALUES (3106,'355-880','충남','보령시','남포면\r\n');
INSERT INTO postno VALUES (3107,'355-890','충남','보령시','청라면\r\n');
INSERT INTO postno VALUES (3108,'355-910','충남','보령시','성주면\r\n');
INSERT INTO postno VALUES (3109,'355-920','충남','보령시','주교면\r\n');
INSERT INTO postno VALUES (3110,'356-010','충남','서산시','동문동\r\n');
INSERT INTO postno VALUES (3111,'356-020','충남','서산시','읍내동\r\n');
INSERT INTO postno VALUES (3112,'356-030','충남','서산시','석림동\r\n');
INSERT INTO postno VALUES (3113,'356-040','충남','서산시','잠흥동\r\n');
INSERT INTO postno VALUES (3114,'356-050','충남','서산시','수석동\r\n');
INSERT INTO postno VALUES (3115,'356-060','충남','서산시','온석동\r\n');
INSERT INTO postno VALUES (3116,'356-070','충남','서산시','예천동\r\n');
INSERT INTO postno VALUES (3117,'356-080','충남','서산시','갈산동\r\n');
INSERT INTO postno VALUES (3118,'356-090','충남','서산시','죽성동\r\n');
INSERT INTO postno VALUES (3119,'356-100','충남','서산시','양대동\r\n');
INSERT INTO postno VALUES (3120,'356-110','충남','서산시','석남동\r\n');
INSERT INTO postno VALUES (3121,'356-120','충남','서산시','오남동\r\n');
INSERT INTO postno VALUES (3122,'356-130','충남','서산시','장동\r\n');
INSERT INTO postno VALUES (3123,'356-140','충남','서산시','덕지천동\r\n');
INSERT INTO postno VALUES (3124,'356-711','충남','서산시','대산읍 삼성종합화학(주)\r\n');
INSERT INTO postno VALUES (3125,'356-712','충남','서산시','대산읍 현대석유화학(주)\r\n');
INSERT INTO postno VALUES (3126,'356-713','충남','서산시','대산읍 현대정유화학(주)\r\n');
INSERT INTO postno VALUES (3127,'356-810','충남','서산시','고북면\r\n');
INSERT INTO postno VALUES (3128,'356-820','충남','서산시','해미면\r\n');
INSERT INTO postno VALUES (3129,'356-830','충남','서산시','운산면\r\n');
INSERT INTO postno VALUES (3130,'356-840','충남','서산시','음암면\r\n');
INSERT INTO postno VALUES (3131,'356-850','충남','서산시','성연면\r\n');
INSERT INTO postno VALUES (3132,'356-860','충남','서산시','지곡면\r\n');
INSERT INTO postno VALUES (3133,'356-870','충남','서산시','대산읍\r\n');
INSERT INTO postno VALUES (3134,'356-880','충남','서산시','인지면\r\n');
INSERT INTO postno VALUES (3135,'356-885','충남','서산시','인지면 성리리\r\n');
INSERT INTO postno VALUES (3136,'356-885','충남','서산시','인지면 풍전리\r\n');
INSERT INTO postno VALUES (3137,'356-890','충남','서산시','부석면\r\n');
INSERT INTO postno VALUES (3138,'356-980','충남','서산시','팔봉면\r\n');
INSERT INTO postno VALUES (3139,'357-900','충남','태안군','태안읍\r\n');
INSERT INTO postno VALUES (3140,'357-910','충남','태안군','원북면\r\n');
INSERT INTO postno VALUES (3141,'357-920','충남','태안군','이원면\r\n');
INSERT INTO postno VALUES (3142,'357-930','충남','태안군','소원면\r\n');
INSERT INTO postno VALUES (3143,'357-940','충남','태안군','곤홍면\r\n');
INSERT INTO postno VALUES (3144,'357-950','충남','태안군','남면\r\n');
INSERT INTO postno VALUES (3145,'357-960','충남','태안군','안면읍\r\n');
INSERT INTO postno VALUES (3146,'357-965','충남','태안군','안면읍 중장리 대야도\r\n');
INSERT INTO postno VALUES (3147,'357-965','충남','태안군','안면읍 중장리 나암도\r\n');
INSERT INTO postno VALUES (3148,'357-965','충남','태안군','안면읍 중장리 두지도\r\n');
INSERT INTO postno VALUES (3149,'357-970','충남','태안군','고남면\r\n');
INSERT INTO postno VALUES (3150,'360-011','충북','청주시','상당구 북문로1가\r\n');
INSERT INTO postno VALUES (3151,'360-012','충북','청주시','상당구 북문로2가\r\n');
INSERT INTO postno VALUES (3152,'360-013','충북','청주시','상당구 북문로3가\r\n');
INSERT INTO postno VALUES (3153,'360-020','충북','청주시','상당구 영동\r\n');
INSERT INTO postno VALUES (3154,'360-030','충북','청주시','상당구 문화동\r\n');
INSERT INTO postno VALUES (3155,'360-041','충북','청주시','상당구 남문로1가\r\n');
INSERT INTO postno VALUES (3156,'360-042','충북','청주시','상당구 남문로2가\r\n');
INSERT INTO postno VALUES (3157,'360-050','충북','청주시','상당구 서운동\r\n');
INSERT INTO postno VALUES (3158,'360-060','충북','청주시','상당구 석교동\r\n');
INSERT INTO postno VALUES (3159,'360-070','충북','청주시','상당구 금천동\r\n');
INSERT INTO postno VALUES (3160,'360-081','충북','청주시','상당구 탑동\r\n');
INSERT INTO postno VALUES (3161,'360-082','충북','청주시','상당구 대성동\r\n');
INSERT INTO postno VALUES (3162,'360-090','충북','청주시','상당구 영운동\r\n');
INSERT INTO postno VALUES (3163,'360-112','충북','청주시','상당구 수동\r\n');
INSERT INTO postno VALUES (3164,'360-120','충북','청주시','상당구 남주동\r\n');
INSERT INTO postno VALUES (3165,'360-130','충북','청주시','상당구 서문동\r\n');
INSERT INTO postno VALUES (3166,'360-170','충북','청주시','상당구 내덕동\r\n');
INSERT INTO postno VALUES (3167,'360-171','충북','청주시','상당구 내덕1동\r\n');
INSERT INTO postno VALUES (3168,'360-172','충북','청주시','상당구 내덕2동\r\n');
INSERT INTO postno VALUES (3169,'360-181','충북','청주시','상당구 용암동\r\n');
INSERT INTO postno VALUES (3170,'360-182','충북','청주시','상당구 용정동\r\n');
INSERT INTO postno VALUES (3171,'360-183','충북','청주시','상당구 방서동\r\n');
INSERT INTO postno VALUES (3172,'360-185','충북','청주시','상당구 지북동\r\n');
INSERT INTO postno VALUES (3173,'360-186','충북','청주시','상당구 평촌동\r\n');
INSERT INTO postno VALUES (3174,'360-187','충북','청주시','상당구 운동동\r\n');
INSERT INTO postno VALUES (3175,'360-188','충북','청주시','상당구 월오동\r\n');
INSERT INTO postno VALUES (3176,'360-190','충북','청주시','상당구 용담동\r\n');
INSERT INTO postno VALUES (3177,'360-191','충북','청주시','상당구 명암동\r\n');
INSERT INTO postno VALUES (3178,'360-192','충북','청주시','상당구 산성동\r\n');
INSERT INTO postno VALUES (3179,'360-200','충북','청주시','상당구 우암동\r\n');
INSERT INTO postno VALUES (3180,'360-210','충북','청주시','상당구 율량동\r\n');
INSERT INTO postno VALUES (3181,'360-215','충북','청주시','상당구 주성동\r\n');
INSERT INTO postno VALUES (3182,'360-220','충북','청주시','상당구 사천동\r\n');
INSERT INTO postno VALUES (3183,'360-226','충북','청주시','상당구 정상동\r\n');
INSERT INTO postno VALUES (3184,'360-227','충북','청주시','상당구 정북동\r\n');
INSERT INTO postno VALUES (3185,'360-255','충북','청주시','상당구 정하동\r\n');
INSERT INTO postno VALUES (3186,'360-560','충북','청주시','상당구 외평동\r\n');
INSERT INTO postno VALUES (3187,'360-565','충북','청주시','상당구 외남동\r\n');
INSERT INTO postno VALUES (3188,'360-566','충북','청주시','상당구 외하동\r\n');
INSERT INTO postno VALUES (3189,'360-567','충북','청주시','상당구 오동동\r\n');
INSERT INTO postno VALUES (3190,'360-568','충북','청주시','상당구 주중동\r\n');
INSERT INTO postno VALUES (3191,'360-600','충북','청주시','상당구 청주우체국사서함\r\n');
INSERT INTO postno VALUES (3192,'360-700','충북','청주시','상당구 북문로3가 청주시청\r\n');
INSERT INTO postno VALUES (3193,'360-701','충북','청주시','상당구 우암동 상당구청\r\n');
INSERT INTO postno VALUES (3194,'360-702','충북','청주시','상당구 우암동 동부경찰서\r\n');
INSERT INTO postno VALUES (3195,'360-703','충북','청주시','상당구 문화동 청주세무서\r\n');
INSERT INTO postno VALUES (3196,'360-704','충북','청주시','상당구 청주지방노동사무소\r\n');
INSERT INTO postno VALUES (3197,'360-705','충북','청주시','상당구 북문로1가 청주전화국\r\n');
INSERT INTO postno VALUES (3198,'360-706','충북','청주시','상당구 북문로1가 청원군청\r\n');
INSERT INTO postno VALUES (3199,'360-707','충북','청주시','상당구 한국통신충북사업본부\r\n');
INSERT INTO postno VALUES (3200,'360-711','충북','청주시','상당구 남문로2가 남궁병원\r\n');
INSERT INTO postno VALUES (3201,'360-712','충북','청주시','상당구 남문로2가 진로백화점\r\n');
INSERT INTO postno VALUES (3202,'360-713','충북','청주시','상당구 청주상공회의소\r\n');
INSERT INTO postno VALUES (3203,'360-714','충북','청주시','상당구 대한생명빌딩\r\n');
INSERT INTO postno VALUES (3204,'360-715','충북','청주시','상당구 영동 제일생명빌딩\r\n');
INSERT INTO postno VALUES (3205,'360-716','충북','청주시','상당구 율량동 동양일보\r\n');
INSERT INTO postno VALUES (3206,'360-728','충북','청주시','상당구 우암동 청주문화방송\r\n');
INSERT INTO postno VALUES (3207,'360-764','충북','청주시','상당구 내덕2동 청주대학교\r\n');
INSERT INTO postno VALUES (3208,'360-765','충북','청주시','상당구 문화동 충북도청\r\n');
INSERT INTO postno VALUES (3209,'361-100','충북','청주시','흥덕구 사직동\r\n');
INSERT INTO postno VALUES (3210,'361-101','충북','청주시','흥덕구 사직1동\r\n');
INSERT INTO postno VALUES (3211,'361-102','충북','청주시','흥덕구 사직2동\r\n');
INSERT INTO postno VALUES (3212,'361-110','충북','청주시','흥덕구 운천동\r\n');
INSERT INTO postno VALUES (3213,'361-111','충북','청주시','흥덕구 신봉동\r\n');
INSERT INTO postno VALUES (3214,'361-140','충북','청주시','흥덕구 모충동\r\n');
INSERT INTO postno VALUES (3215,'361-150','충북','청주시','흥덕구 수곡동\r\n');
INSERT INTO postno VALUES (3216,'361-160','충북','청주시','흥덕구 산남동\r\n');
INSERT INTO postno VALUES (3217,'361-201','충북','청주시','흥덕구 분평동\r\n');
INSERT INTO postno VALUES (3218,'361-202','충북','청주시','흥덕구 미평동\r\n');
INSERT INTO postno VALUES (3219,'361-205','충북','충주시','흥덕구 장암동\r\n');
INSERT INTO postno VALUES (3220,'361-206','충북','청주시','흥덕구 장성동\r\n');
INSERT INTO postno VALUES (3221,'361-230','충북','청주시','흥덕구 성화동\r\n');
INSERT INTO postno VALUES (3222,'361-240','충북','청주시','흥덕구 개신동\r\n');
INSERT INTO postno VALUES (3223,'361-250','충북','청주시','흥덕구 죽림동\r\n');
INSERT INTO postno VALUES (3224,'361-260','충북','청주시','흥덕구 가경동\r\n');
INSERT INTO postno VALUES (3225,'361-270','충북','청주시','흥덕구 복대동\r\n');
INSERT INTO postno VALUES (3226,'361-271','충북','청주시','흥덕구 복대1동\r\n');
INSERT INTO postno VALUES (3227,'361-272','충북','청주시','흥덕구 복대2동\r\n');
INSERT INTO postno VALUES (3228,'361-280','충북','청주시','흥덕구 사창동\r\n');
INSERT INTO postno VALUES (3229,'361-290','충북','청주시','흥덕구 송정동\r\n');
INSERT INTO postno VALUES (3230,'361-300','충북','청주시','흥덕구 봉명동\r\n');
INSERT INTO postno VALUES (3231,'361-301','충북','청주시','흥덕구 봉명1동\r\n');
INSERT INTO postno VALUES (3232,'361-302','충북','청주시','흥덕구 봉명2동\r\n');
INSERT INTO postno VALUES (3233,'361-310','충북','청주시','흥덕구 휴암동\r\n');
INSERT INTO postno VALUES (3234,'361-320','충북','청주시','흥덕구 신전동\r\n');
INSERT INTO postno VALUES (3235,'361-330','충북','청주시','흥덕구 수의동\r\n');
INSERT INTO postno VALUES (3236,'361-340','충북','청주시','흥덕구 석소동\r\n');
INSERT INTO postno VALUES (3237,'361-350','충북','청주시','흥덕구 현암동\r\n');
INSERT INTO postno VALUES (3238,'361-360','충북','청주시','흥덕구 동막동\r\n');
INSERT INTO postno VALUES (3239,'361-370','충북','청주시','흥덕구 비하동\r\n');
INSERT INTO postno VALUES (3240,'361-380','충북','청주시','흥덕구 강서동\r\n');
INSERT INTO postno VALUES (3241,'361-390','충북','청주시','흥덕구 석곡동\r\n');
INSERT INTO postno VALUES (3242,'361-400','충북','청주시','흥덕구 지동동\r\n');
INSERT INTO postno VALUES (3243,'361-410','충북','청주시','흥덕구 서촌동\r\n');
INSERT INTO postno VALUES (3244,'361-420','충북','청주시','흥덕구 정봉동\r\n');
INSERT INTO postno VALUES (3245,'361-430','충북','청주시','흥덕구 신촌동\r\n');
INSERT INTO postno VALUES (3246,'361-440','충북','청주시','흥덕구 남촌동\r\n');
INSERT INTO postno VALUES (3247,'361-450','충북','청주시','흥덕구 신성동\r\n');
INSERT INTO postno VALUES (3248,'361-460','충북','청주시','흥덕구 평동\r\n');
INSERT INTO postno VALUES (3249,'361-470','충북','청주시','흥덕구 신대동\r\n');
INSERT INTO postno VALUES (3250,'361-480','충북','청주시','흥덕구 향정동\r\n');
INSERT INTO postno VALUES (3251,'361-490','충북','청주시','흥덕구 외북동\r\n');
INSERT INTO postno VALUES (3252,'361-500','충북','청주시','흥덕구 내곡동\r\n');
INSERT INTO postno VALUES (3253,'361-510','충북','청주시','흥덕구 상신동\r\n');
INSERT INTO postno VALUES (3254,'361-520','충북','청주시','흥덕구 원평동\r\n');
INSERT INTO postno VALUES (3255,'361-530','충북','청주시','흥덕구 문암동\r\n');
INSERT INTO postno VALUES (3256,'361-540','충북','청주시','흥덕구 송절동\r\n');
INSERT INTO postno VALUES (3257,'361-550','충북','청주시','흥덕구 화계동\r\n');
INSERT INTO postno VALUES (3258,'361-701','충북','청주시','흥덕구 사직1동 흥덕구청\r\n');
INSERT INTO postno VALUES (3259,'361-702','충북','청주시','흥덕구 복대1동 서부경찰서\r\n');
INSERT INTO postno VALUES (3260,'361-703','충북','청주시','흥덕구 산남동 충북교육청\r\n');
INSERT INTO postno VALUES (3261,'361-704','충북','청주시','흥덕구 청주지방검찰청\r\n');
INSERT INTO postno VALUES (3262,'361-705','충북','청주시','흥덕구 수곡동 청주지방법원\r\n');
INSERT INTO postno VALUES (3263,'361-706','충북','청주시','흥덕구 사직1동 서청주전화국\r\n');
INSERT INTO postno VALUES (3264,'361-711','충북','청주시','흥덕구 개신동 충북대학병원\r\n');
INSERT INTO postno VALUES (3265,'361-712','충북','청주시','흥덕구 청주교육대학교\r\n');
INSERT INTO postno VALUES (3266,'361-713','충북','청주시','흥덕구 복대2동 (주)대농\r\n');
INSERT INTO postno VALUES (3267,'361-714','충북','청주시','흥덕구 봉명2동 LG여자기숙사\r\n');
INSERT INTO postno VALUES (3268,'361-715','충북','청주시','흥덕구 봉명2동 인화빌딩\r\n');
INSERT INTO postno VALUES (3269,'361-716','충북','청주시','흥덕구 한국이동통신충북지사\r\n');
INSERT INTO postno VALUES (3270,'361-717','충북','청주시','흥덕구 충북제1지구의료보험\r\n');
INSERT INTO postno VALUES (3271,'361-718','충북','청주시','흥덕구 사창동 삼성생명빌딩\r\n');
INSERT INTO postno VALUES (3272,'361-719','충북','청주시','흥덕구 사창동 청주전문대학\r\n');
INSERT INTO postno VALUES (3273,'361-720','충북','청주시','흥덕구 LG산전청주공장\r\n');
INSERT INTO postno VALUES (3274,'361-721','충북','청주시','흥덕구 LG화학청주공장\r\n');
INSERT INTO postno VALUES (3275,'361-722','충북','청주시','흥덕구 대한주택공사충북지사\r\n');
INSERT INTO postno VALUES (3276,'361-723','충북','청주시','흥덕구 의료보험관리공단충북\r\n');
INSERT INTO postno VALUES (3277,'361-724','충북','청주시','흥덕구 청주시의료보험조합\r\n');
INSERT INTO postno VALUES (3278,'361-725','충북','청주시','흥덕구 LG반도체청주공장\r\n');
INSERT INTO postno VALUES (3279,'361-726','충북','청주시','흥덕구 향정동 LG전자청주공\r\n');
INSERT INTO postno VALUES (3280,'361-742','충북','청주시','흥덕구 모충동 서원대학교\r\n');
INSERT INTO postno VALUES (3281,'361-763','충북','청주시','흥덕구 개신동 충북대학교\r\n');
INSERT INTO postno VALUES (3282,'361-766','충북','청주시','흥덕구 사창동 충청일보건물\r\n');
INSERT INTO postno VALUES (3283,'361-790','충북','청주시','흥덕구 한국방송공사청주방\r\n');
INSERT INTO postno VALUES (3284,'363-791','충북','청원군','강내면 한국교원대학교\r\n');
INSERT INTO postno VALUES (3285,'363-810','충북','청원군','남이면\r\n');
INSERT INTO postno VALUES (3286,'363-820','충북','청원군','현도면\r\n');
INSERT INTO postno VALUES (3287,'363-830','충북','청원군','문의면\r\n');
INSERT INTO postno VALUES (3288,'363-840','충북','청원군','남일면\r\n');
INSERT INTO postno VALUES (3289,'363-850','충북','청원군','가덕면\r\n');
INSERT INTO postno VALUES (3290,'363-860','충북','청원군','낭성면\r\n');
INSERT INTO postno VALUES (3291,'363-870','충북','청원군','미원면\r\n');
INSERT INTO postno VALUES (3292,'363-880','충북','청원군','오창면\r\n');
INSERT INTO postno VALUES (3293,'363-890','충북','청원군','강내면\r\n');
INSERT INTO postno VALUES (3294,'363-910','충북','청원군','옥산면\r\n');
INSERT INTO postno VALUES (3295,'363-920','충북','청원군','북이면\r\n');
INSERT INTO postno VALUES (3296,'363-930','충북','청원군','북일면\r\n');
INSERT INTO postno VALUES (3297,'363-940','충북','청원군','부용면\r\n');
INSERT INTO postno VALUES (3298,'363-950','충북','청원군','강외면\r\n');
INSERT INTO postno VALUES (3299,'365-800','충북','진천군','진천읍\r\n');
INSERT INTO postno VALUES (3300,'365-810','충북','진천군','백곡면\r\n');
INSERT INTO postno VALUES (3301,'365-820','충북','진천군','이월면\r\n');
INSERT INTO postno VALUES (3302,'365-830','충북','진천군','만승면\r\n');
INSERT INTO postno VALUES (3303,'365-840','충북','진천군','덕산면\r\n');
INSERT INTO postno VALUES (3304,'365-850','충북','진천군','초평면\r\n');
INSERT INTO postno VALUES (3305,'365-860','충북','진천군','문백면\r\n');
INSERT INTO postno VALUES (3306,'365-865','충북','진천군','문백면 구곡리\r\n');
INSERT INTO postno VALUES (3307,'365-865','충북','진천군','문백면 무덕리\r\n');
INSERT INTO postno VALUES (3308,'365-865','충북','진천군','문백면 사양리\r\n');
INSERT INTO postno VALUES (3309,'365-865','충북','진천군','문백면 장월리\r\n');
INSERT INTO postno VALUES (3310,'367-800','충북','괴산군','괴산읍\r\n');
INSERT INTO postno VALUES (3311,'367-810','충북','괴산군','도안면\r\n');
INSERT INTO postno VALUES (3312,'367-820','충북','괴산군','사리면\r\n');
INSERT INTO postno VALUES (3313,'367-830','충북','괴산군','청안면\r\n');
INSERT INTO postno VALUES (3314,'367-840','충북','괴산군','청천면\r\n');
INSERT INTO postno VALUES (3315,'367-845','충북','괴산군','청천면 관평리\r\n');
INSERT INTO postno VALUES (3316,'367-845','충북','괴산군','청천면 사기막리\r\n');
INSERT INTO postno VALUES (3317,'367-845','충북','괴산군','청천면 삼송리\r\n');
INSERT INTO postno VALUES (3318,'367-845','충북','괴산군','청천면 송면리\r\n');
INSERT INTO postno VALUES (3319,'367-845','충북','괴산군','청천면 운교리\r\n');
INSERT INTO postno VALUES (3320,'367-845','충북','괴산군','청천면 이평리\r\n');
INSERT INTO postno VALUES (3321,'367-845','충북','괴산군','청천면 지촌리\r\n');
INSERT INTO postno VALUES (3322,'367-850','충북','괴산군','문광면\r\n');
INSERT INTO postno VALUES (3323,'367-860','충북','괴산군','칠성면\r\n');
INSERT INTO postno VALUES (3324,'367-870','충북','괴산군','장연면\r\n');
INSERT INTO postno VALUES (3325,'367-880','충북','괴산군','연풍면\r\n');
INSERT INTO postno VALUES (3326,'367-890','충북','괴산군','감물면\r\n');
INSERT INTO postno VALUES (3327,'367-900','충북','괴산군','증평읍\r\n');
INSERT INTO postno VALUES (3328,'367-910','충북','괴산군','불정면\r\n');
INSERT INTO postno VALUES (3329,'367-920','충북','괴산군','소수면\r\n');
INSERT INTO postno VALUES (3330,'369-711','충북','음성군','맹동면 음성꽃동네\r\n');
INSERT INTO postno VALUES (3331,'369-800','충북','음성군','음성읍\r\n');
INSERT INTO postno VALUES (3332,'369-810','충북','음성군','맹동면\r\n');
INSERT INTO postno VALUES (3333,'369-820','충북','음성군','대소면\r\n');
INSERT INTO postno VALUES (3334,'369-830','충북','음성군','삼성면\r\n');
INSERT INTO postno VALUES (3335,'369-840','충북','음성군','생극면\r\n');
INSERT INTO postno VALUES (3336,'369-850','충북','음성군','감곡면\r\n');
INSERT INTO postno VALUES (3337,'369-860','충북','음성군','원남면\r\n');
INSERT INTO postno VALUES (3338,'369-870','충북','음성군','소이면\r\n');
INSERT INTO postno VALUES (3339,'369-900','충북','음성군','금왕읍\r\n');
INSERT INTO postno VALUES (3340,'370-800','충북','영동군','영동읍\r\n');
INSERT INTO postno VALUES (3341,'370-810','충북','영동군','양강면\r\n');
INSERT INTO postno VALUES (3342,'370-820','충북','영동군','학산면\r\n');
INSERT INTO postno VALUES (3343,'370-830','충북','영동군','양산면\r\n');
INSERT INTO postno VALUES (3344,'370-840','충북','영동군','용화면\r\n');
INSERT INTO postno VALUES (3345,'370-850','충북','영동군','심천면\r\n');
INSERT INTO postno VALUES (3346,'370-860','충북','영동군','황간면\r\n');
INSERT INTO postno VALUES (3347,'370-870','충북','영동군','매곡면\r\n');
INSERT INTO postno VALUES (3348,'370-880','충북','영동군','상촌면\r\n');
INSERT INTO postno VALUES (3349,'370-890','충북','영동군','추풍령면\r\n');
INSERT INTO postno VALUES (3350,'370-910','충북','영동군','용산면\r\n');
INSERT INTO postno VALUES (3351,'373-800','충북','옥천군','옥천읍\r\n');
INSERT INTO postno VALUES (3352,'373-810','충북','옥천군','안내면\r\n');
INSERT INTO postno VALUES (3353,'373-820','충북','옥천군','안남면\r\n');
INSERT INTO postno VALUES (3354,'373-830','충북','옥천군','동이면\r\n');
INSERT INTO postno VALUES (3355,'373-840','충북','옥천군','군서면\r\n');
INSERT INTO postno VALUES (3356,'373-850','충북','옥천군','군북면\r\n');
INSERT INTO postno VALUES (3357,'373-860','충북','옥천군','이원면\r\n');
INSERT INTO postno VALUES (3358,'373-870','충북','옥천군','청산면\r\n');
INSERT INTO postno VALUES (3359,'373-880','충북','옥천군','청성면\r\n');
INSERT INTO postno VALUES (3360,'376-800','충북','보은군','보은읍\r\n');
INSERT INTO postno VALUES (3361,'376-810','충북','보은군','내북면\r\n');
INSERT INTO postno VALUES (3362,'376-820','충북','보은군','삼승면\r\n');
INSERT INTO postno VALUES (3363,'376-830','충북','보은군','탄부면\r\n');
INSERT INTO postno VALUES (3364,'376-840','충북','보은군','외속리면\r\n');
INSERT INTO postno VALUES (3365,'376-850','충북','보은군','마로면\r\n');
INSERT INTO postno VALUES (3366,'376-860','충북','보은군','내속리면\r\n');
INSERT INTO postno VALUES (3367,'376-870','충북','보은군','산외면\r\n');
INSERT INTO postno VALUES (3368,'376-880','충북','보은군','수한면\r\n');
INSERT INTO postno VALUES (3369,'376-890','충북','보은군','회북면\r\n');
INSERT INTO postno VALUES (3370,'376-910','충북','보은군','회남면\r\n');
INSERT INTO postno VALUES (3371,'380-010','충북','충주시','성내동\r\n');
INSERT INTO postno VALUES (3372,'380-020','충북','충주시','성서동\r\n');
INSERT INTO postno VALUES (3373,'380-030','충북','충주시','성남동\r\n');
INSERT INTO postno VALUES (3374,'380-040','충북','충주시','충인동\r\n');
INSERT INTO postno VALUES (3375,'380-050','충북','충주시','충의동\r\n');
INSERT INTO postno VALUES (3376,'380-061','충북','충주시','교현1동\r\n');
INSERT INTO postno VALUES (3377,'380-062','충북','충주시','교현2동\r\n');
INSERT INTO postno VALUES (3378,'380-070','충북','충주시','지현동\r\n');
INSERT INTO postno VALUES (3379,'380-080','충북','충주시','봉방동\r\n');
INSERT INTO postno VALUES (3380,'380-090','충북','충주시','용산동\r\n');
INSERT INTO postno VALUES (3381,'380-100','충북','충주시','연수동\r\n');
INSERT INTO postno VALUES (3382,'380-110','충북','충주시','안림동\r\n');
INSERT INTO postno VALUES (3383,'380-120','충북','충주시','종민동\r\n');
INSERT INTO postno VALUES (3384,'380-130','충북','충주시','호암동\r\n');
INSERT INTO postno VALUES (3385,'380-140','충북','충주시','직동\r\n');
INSERT INTO postno VALUES (3386,'380-150','충북','충주시','단월동\r\n');
INSERT INTO postno VALUES (3387,'380-160','충북','충주시','풍동\r\n');
INSERT INTO postno VALUES (3388,'380-170','충북','충주시','가주동\r\n');
INSERT INTO postno VALUES (3389,'380-180','충북','충주시','문화동\r\n');
INSERT INTO postno VALUES (3390,'380-190','충북','충주시','달천동\r\n');
INSERT INTO postno VALUES (3391,'380-200','충북','충주시','용관동\r\n');
INSERT INTO postno VALUES (3392,'380-210','충북','충주시','용두동\r\n');
INSERT INTO postno VALUES (3393,'380-220','충북','충주시','칠금동\r\n');
INSERT INTO postno VALUES (3394,'380-230','충북','충주시','금릉동\r\n');
INSERT INTO postno VALUES (3395,'380-240','충북','충주시','목행동\r\n');
INSERT INTO postno VALUES (3396,'380-250','충북','충주시','용탄동\r\n');
INSERT INTO postno VALUES (3397,'380-260','충북','충주시','목벌동\r\n');
INSERT INTO postno VALUES (3398,'380-600','충북','충주시','충주우체국사서함\r\n');
INSERT INTO postno VALUES (3399,'380-701','충북','충주시','단월동 건국대학교충주컴퍼스\r\n');
INSERT INTO postno VALUES (3400,'380-702','충북','충주시','이류면 충주산업대학교\r\n');
INSERT INTO postno VALUES (3401,'380-703','충북','충주시','목행동 새한미디어(주)충주공\r\n');
INSERT INTO postno VALUES (3402,'380-756','충북','충주시','상모면 중앙경찰학교\r\n');
INSERT INTO postno VALUES (3403,'380-810','충북','충주시','동량면\r\n');
INSERT INTO postno VALUES (3404,'380-820','충북','충주시','금가면\r\n');
INSERT INTO postno VALUES (3405,'380-830','충북','충주시','산척면\r\n');
INSERT INTO postno VALUES (3406,'380-840','충북','충주시','엄정면\r\n');
INSERT INTO postno VALUES (3407,'380-850','충북','충주시','소태면\r\n');
INSERT INTO postno VALUES (3408,'380-860','충북','충주시','앙성면\r\n');
INSERT INTO postno VALUES (3409,'380-870','충북','충주시','이류면\r\n');
INSERT INTO postno VALUES (3410,'380-880','충북','충주시','주덕면\r\n');
INSERT INTO postno VALUES (3411,'380-890','충북','충주시','신니면\r\n');
INSERT INTO postno VALUES (3412,'380-910','충북','충주시','노은면\r\n');
INSERT INTO postno VALUES (3413,'380-920','충북','충주시','가금면\r\n');
INSERT INTO postno VALUES (3414,'380-930','충북','충주시','살미면\r\n');
INSERT INTO postno VALUES (3415,'380-940','충북','충주시','상모면\r\n');
INSERT INTO postno VALUES (3416,'390-011','충북','제천시','중앙로1가\r\n');
INSERT INTO postno VALUES (3417,'390-012','충북','제천시','중앙로2가\r\n');
INSERT INTO postno VALUES (3418,'390-020','충북','제천시','남천동\r\n');
INSERT INTO postno VALUES (3419,'390-030','충북','제천시','의림동\r\n');
INSERT INTO postno VALUES (3420,'390-040','충북','제천시','명서동\r\n');
INSERT INTO postno VALUES (3421,'390-050','충북','제천시','명동\r\n');
INSERT INTO postno VALUES (3422,'390-060','충북','제천시','서부동\r\n');
INSERT INTO postno VALUES (3423,'390-070','충북','제천시','교동\r\n');
INSERT INTO postno VALUES (3424,'390-080','충북','제천시','장락동\r\n');
INSERT INTO postno VALUES (3425,'390-090','충북','제천시','고암동\r\n');
INSERT INTO postno VALUES (3426,'390-100','충북','제천시','청전동\r\n');
INSERT INTO postno VALUES (3427,'390-110','충북','제천시','모산동\r\n');
INSERT INTO postno VALUES (3428,'390-120','충북','제천시','영천동\r\n');
INSERT INTO postno VALUES (3429,'390-121','충북','제천시','영천1동\r\n');
INSERT INTO postno VALUES (3430,'390-122','충북','제천시','영천2동\r\n');
INSERT INTO postno VALUES (3431,'390-130','충북','제천시','천남동\r\n');
INSERT INTO postno VALUES (3432,'390-140','충북','제천시','신동\r\n');
INSERT INTO postno VALUES (3433,'390-150','충북','제천시','화산동\r\n');
INSERT INTO postno VALUES (3434,'390-151','충북','제천시','화산1동\r\n');
INSERT INTO postno VALUES (3435,'390-152','충북','제천시','화산2동\r\n');
INSERT INTO postno VALUES (3436,'390-160','충북','제천시','강제동\r\n');
INSERT INTO postno VALUES (3437,'390-170','충북','제천시','명지동\r\n');
INSERT INTO postno VALUES (3438,'390-180','충북','제천시','산곡동\r\n');
INSERT INTO postno VALUES (3439,'390-190','충북','제천시','동현동\r\n');
INSERT INTO postno VALUES (3440,'390-200','충북','제천시','고명동\r\n');
INSERT INTO postno VALUES (3441,'390-210','충북','제천시','신백동\r\n');
INSERT INTO postno VALUES (3442,'390-220','충북','제천시','용두동\r\n');
INSERT INTO postno VALUES (3443,'390-230','충북','제천시','신월동\r\n');
INSERT INTO postno VALUES (3444,'390-240','충북','제천시','하소동\r\n');
INSERT INTO postno VALUES (3445,'390-250','충북','제천시','왕암동\r\n');
INSERT INTO postno VALUES (3446,'390-260','충북','제천시','두학동\r\n');
INSERT INTO postno VALUES (3447,'390-270','충북','제천시','흑석동\r\n');
INSERT INTO postno VALUES (3448,'390-280','충북','제천시','자작동\r\n');
INSERT INTO postno VALUES (3449,'390-290','충북','제천시','대랑동\r\n');
INSERT INTO postno VALUES (3450,'390-600','충북','제천시','제천우체국사서함\r\n');
INSERT INTO postno VALUES (3451,'390-701','충북','제천시','청전동 제천시청\r\n');
INSERT INTO postno VALUES (3452,'390-711','충북','제천시','신월동 세명대학교\r\n');
INSERT INTO postno VALUES (3453,'390-810','충북','제천시','송학면\r\n');
INSERT INTO postno VALUES (3454,'390-820','충북','제천시','금성면\r\n');
INSERT INTO postno VALUES (3455,'390-830','충북','제천시','청풍면\r\n');
INSERT INTO postno VALUES (3456,'390-840','충북','제천시','수산면\r\n');
INSERT INTO postno VALUES (3457,'390-850','충북','제천시','덕산면\r\n');
INSERT INTO postno VALUES (3458,'390-860','충북','제천시','한수면\r\n');
INSERT INTO postno VALUES (3459,'390-870','충북','제천시','봉양면\r\n');
INSERT INTO postno VALUES (3460,'390-880','충북','제천시','백운면\r\n');
INSERT INTO postno VALUES (3461,'395-800','충북','단양군','단양읍\r\n');
INSERT INTO postno VALUES (3462,'395-810','충북','단양군','대강면\r\n');
INSERT INTO postno VALUES (3463,'395-820','충북','단양군','가곡면\r\n');
INSERT INTO postno VALUES (3464,'395-825','충북','단양군','가곡면 덕천리\r\n');
INSERT INTO postno VALUES (3465,'395-825','충북','단양군','가곡면 여천리\r\n');
INSERT INTO postno VALUES (3466,'395-830','충북','단양군','영춘면\r\n');
INSERT INTO postno VALUES (3467,'395-835','충북','단양군','영춘면 만종동\r\n');
INSERT INTO postno VALUES (3468,'395-835','충북','단양군','영춘면 별방동\r\n');
INSERT INTO postno VALUES (3469,'395-835','충북','단양군','영춘면 사이곡동\r\n');
INSERT INTO postno VALUES (3470,'395-835','충북','단양군','영춘면 사지원동\r\n');
INSERT INTO postno VALUES (3471,'395-835','충북','단양군','영춘면 유암동\r\n');
INSERT INTO postno VALUES (3472,'395-835','충북','단양군','영춘면 장발리동\r\n');
INSERT INTO postno VALUES (3473,'395-835','충북','단양군','영춘면 하리내의동\r\n');
INSERT INTO postno VALUES (3474,'395-835','충북','단양군','영춘면 갈매기동\r\n');
INSERT INTO postno VALUES (3475,'395-835','충북','단양군','영춘면 밤수동\r\n');
INSERT INTO postno VALUES (3476,'395-840','충북','단양군','어상천면\r\n');
INSERT INTO postno VALUES (3477,'395-850','충북','단양군','적성면\r\n');
INSERT INTO postno VALUES (3478,'395-860','충북','단양군','단성면\r\n');
INSERT INTO postno VALUES (3479,'395-900','충북','단양군','매포읍\r\n');
INSERT INTO postno VALUES (3480,'400-011','인천시','중구','중앙동1가\r\n');
INSERT INTO postno VALUES (3481,'400-012','인천시','중구','중앙동2가\r\n');
INSERT INTO postno VALUES (3482,'400-013','인천시','중구','중앙동3가\r\n');
INSERT INTO postno VALUES (3483,'400-014','인천시','중구','중앙동4가\r\n');
INSERT INTO postno VALUES (3484,'400-021','인천시','중구','해안동1가\r\n');
INSERT INTO postno VALUES (3485,'400-022','인천시','중구','해안동2가\r\n');
INSERT INTO postno VALUES (3486,'400-023','인천시','중구','해안동3가\r\n');
INSERT INTO postno VALUES (3487,'400-024','인천시','중구','해안동4가\r\n');
INSERT INTO postno VALUES (3488,'400-031','인천시','중구','항동1가\r\n');
INSERT INTO postno VALUES (3489,'400-032','인천시','중구','항동2가\r\n');
INSERT INTO postno VALUES (3490,'400-033','인천시','중구','항동3가\r\n');
INSERT INTO postno VALUES (3491,'400-034','인천시','중구','항동4가\r\n');
INSERT INTO postno VALUES (3492,'400-035','인천시','중구','항동5가\r\n');
INSERT INTO postno VALUES (3493,'400-036','인천시','중구','항동6가\r\n');
INSERT INTO postno VALUES (3494,'400-037','인천시','중구','항동7가\r\n');
INSERT INTO postno VALUES (3495,'400-041','인천시','중구','관동1가\r\n');
INSERT INTO postno VALUES (3496,'400-042','인천시','중구','관동2가\r\n');
INSERT INTO postno VALUES (3497,'400-043','인천시','중구','관동3가\r\n');
INSERT INTO postno VALUES (3498,'400-051','인천시','중구','송학동1가\r\n');
INSERT INTO postno VALUES (3499,'400-052','인천시','중구','송학동2가\r\n');
INSERT INTO postno VALUES (3500,'400-053','인천시','중구','송학동3가\r\n');
INSERT INTO postno VALUES (3501,'400-060','인천시','중구','사동\r\n');
INSERT INTO postno VALUES (3502,'400-070','인천시','중구','신생동\r\n');
INSERT INTO postno VALUES (3503,'400-080','인천시','중구','신포동\r\n');
INSERT INTO postno VALUES (3504,'400-090','인천시','중구','답동\r\n');
INSERT INTO postno VALUES (3505,'400-101','인천시','중구','신흥동1가\r\n');
INSERT INTO postno VALUES (3506,'400-102','인천시','중구','신흥동2가\r\n');
INSERT INTO postno VALUES (3507,'400-103','인천시','중구','신흥동3가\r\n');
INSERT INTO postno VALUES (3508,'400-110','인천시','중구','선화동\r\n');
INSERT INTO postno VALUES (3509,'400-120','인천시','중구','유동\r\n');
INSERT INTO postno VALUES (3510,'400-130','인천시','중구','율목동\r\n');
INSERT INTO postno VALUES (3511,'400-140','인천시','중구','도원동\r\n');
INSERT INTO postno VALUES (3512,'400-150','인천시','중구','내동\r\n');
INSERT INTO postno VALUES (3513,'400-160','인천시','중구','경동\r\n');
INSERT INTO postno VALUES (3514,'400-170','인천시','중구','용동\r\n');
INSERT INTO postno VALUES (3515,'400-180','인천시','중구','인현동\r\n');
INSERT INTO postno VALUES (3516,'400-190','인천시','중구','전동\r\n');
INSERT INTO postno VALUES (3517,'400-201','인천시','중구','북성동1가\r\n');
INSERT INTO postno VALUES (3518,'400-202','인천시','중구','북성동2가\r\n');
INSERT INTO postno VALUES (3519,'400-203','인천시','중구','북성동3가\r\n');
INSERT INTO postno VALUES (3520,'400-210','인천시','중구','선린동\r\n');
INSERT INTO postno VALUES (3521,'400-221','인천시','중구','송월동1가\r\n');
INSERT INTO postno VALUES (3522,'400-222','인천시','중구','송월동2가\r\n');
INSERT INTO postno VALUES (3523,'400-223','인천시','중구','송월동3가\r\n');
INSERT INTO postno VALUES (3524,'400-310','인천시','중구','운남동\r\n');
INSERT INTO postno VALUES (3525,'400-320','인천시','중구','중산동\r\n');
INSERT INTO postno VALUES (3526,'400-340','인천시','중구','운서동\r\n');
INSERT INTO postno VALUES (3527,'400-360','인천시','중구','운북동\r\n');
INSERT INTO postno VALUES (3528,'400-410','인천시','중구','덕교동\r\n');
INSERT INTO postno VALUES (3529,'400-420','인천시','중구','을왕동\r\n');
INSERT INTO postno VALUES (3530,'400-440','인천시','중구','남북동\r\n');
INSERT INTO postno VALUES (3531,'400-460','인천시','중구','무의동\r\n');
INSERT INTO postno VALUES (3532,'400-600','인천시','중구','인천우체국사서함\r\n');
INSERT INTO postno VALUES (3533,'400-701','인천시','중구','관동1가 중구청\r\n');
INSERT INTO postno VALUES (3534,'400-702','인천시','중구','항동3가 인천광역시경찰청\r\n');
INSERT INTO postno VALUES (3535,'400-711','인천시','중구','신흥동3가 인하대학병원\r\n');
INSERT INTO postno VALUES (3536,'400-712','인천시','중구','신흥동3가 정석빌딩\r\n');
INSERT INTO postno VALUES (3537,'400-712','인천시','중구','용동 동인천길병원\r\n');
INSERT INTO postno VALUES (3538,'400-714','인천시','중구','율목동 인천기독병원\r\n');
INSERT INTO postno VALUES (3539,'400-750','인천시','중구','항동5가 인천신문사빌딩\r\n');
INSERT INTO postno VALUES (3540,'401-010','인천시','동구','만석동\r\n');
INSERT INTO postno VALUES (3541,'401-020','인천시','동구','화수동\r\n');
INSERT INTO postno VALUES (3542,'401-021','인천시','동구','화수1동\r\n');
INSERT INTO postno VALUES (3543,'401-022','인천시','동구','화수2동\r\n');
INSERT INTO postno VALUES (3544,'401-023','인천시','동구','화수3동\r\n');
INSERT INTO postno VALUES (3545,'401-024','인천시','동구','화수4동\r\n');
INSERT INTO postno VALUES (3546,'401-030','인천시','동구','화평동\r\n');
INSERT INTO postno VALUES (3547,'401-040','인천시','동구','송현동\r\n');
INSERT INTO postno VALUES (3548,'401-041','인천시','동구','송현1동\r\n');
INSERT INTO postno VALUES (3549,'401-042','인천시','동구','송현2동\r\n');
INSERT INTO postno VALUES (3550,'401-043','인천시','동구','송현3동\r\n');
INSERT INTO postno VALUES (3551,'401-050','인천시','동구','창영동\r\n');
INSERT INTO postno VALUES (3552,'401-060','인천시','동구','금곡동\r\n');
INSERT INTO postno VALUES (3553,'401-070','인천시','동구','송림동\r\n');
INSERT INTO postno VALUES (3554,'401-071','인천시','동구','송림1동\r\n');
INSERT INTO postno VALUES (3555,'401-072','인천시','동구','송림2동\r\n');
INSERT INTO postno VALUES (3556,'401-073','인천시','동구','송림3동\r\n');
INSERT INTO postno VALUES (3557,'401-074','인천시','동구','송림4동\r\n');
INSERT INTO postno VALUES (3558,'401-075','인천시','동구','송림5동\r\n');
INSERT INTO postno VALUES (3559,'401-076','인천시','동구','송림6동\r\n');
INSERT INTO postno VALUES (3560,'401-701','인천시','동구','송림3동 동구청\r\n');
INSERT INTO postno VALUES (3561,'401-702','인천시','동구','만석동 대우중공업(주)\r\n');
INSERT INTO postno VALUES (3562,'401-711','인천시','동구','송림4동 지방공사인천병원\r\n');
INSERT INTO postno VALUES (3563,'401-711','인천시','동구','송현3동 인천제철(주)\r\n');
INSERT INTO postno VALUES (3564,'401-714','인천시','동구','송림4동 대한전문대학\r\n');
INSERT INTO postno VALUES (3565,'402-010','인천시','남구','숭의동\r\n');
INSERT INTO postno VALUES (3566,'402-011','인천시','남구','숭의1동\r\n');
INSERT INTO postno VALUES (3567,'402-012','인천시','남구','숭의2동\r\n');
INSERT INTO postno VALUES (3568,'402-013','인천시','남구','숭의3동\r\n');
INSERT INTO postno VALUES (3569,'402-014','인천시','남구','숭의4동\r\n');
INSERT INTO postno VALUES (3570,'402-020','인천시','남구','용현동\r\n');
INSERT INTO postno VALUES (3571,'402-021','인천시','남구','용현1동\r\n');
INSERT INTO postno VALUES (3572,'402-022','인천시','남구','용현2동\r\n');
INSERT INTO postno VALUES (3573,'402-023','인천시','남구','용현3동\r\n');
INSERT INTO postno VALUES (3574,'402-024','인천시','남구','용현4동\r\n');
INSERT INTO postno VALUES (3575,'402-025','인천시','남구','용현5동\r\n');
INSERT INTO postno VALUES (3576,'402-040','인천시','남구','학익동\r\n');
INSERT INTO postno VALUES (3577,'402-041','인천시','남구','학익1동\r\n');
INSERT INTO postno VALUES (3578,'402-042','인천시','남구','학익2동\r\n');
INSERT INTO postno VALUES (3579,'402-060','인천시','남구','도화동\r\n');
INSERT INTO postno VALUES (3580,'402-061','인천시','남구','도화1동\r\n');
INSERT INTO postno VALUES (3581,'402-062','인천시','남구','도화2동\r\n');
INSERT INTO postno VALUES (3582,'402-063','인천시','남구','도화3동\r\n');
INSERT INTO postno VALUES (3583,'402-070','인천시','남구','문학동\r\n');
INSERT INTO postno VALUES (3584,'402-080','인천시','남구','관교동\r\n');
INSERT INTO postno VALUES (3585,'402-200','인천시','남구','주안동\r\n');
INSERT INTO postno VALUES (3586,'402-201','인천시','남구','주안1동\r\n');
INSERT INTO postno VALUES (3587,'402-202','인천시','남구','주안2동\r\n');
INSERT INTO postno VALUES (3588,'402-203','인천시','남구','주안3동\r\n');
INSERT INTO postno VALUES (3589,'402-204','인천시','남구','주안4동\r\n');
INSERT INTO postno VALUES (3590,'402-205','인천시','남구','주안5동\r\n');
INSERT INTO postno VALUES (3591,'402-206','인천시','남구','주안6동\r\n');
INSERT INTO postno VALUES (3592,'402-207','인천시','남구','주안7동\r\n');
INSERT INTO postno VALUES (3593,'402-208','인천시','남구','주안8동\r\n');
INSERT INTO postno VALUES (3594,'402-701','인천시','남구','숭의2동 남구청\r\n');
INSERT INTO postno VALUES (3595,'402-703','인천시','남구','숭의1동 남인천세무서\r\n');
INSERT INTO postno VALUES (3596,'402-704','인천시','남구','학익2동 인천구치소\r\n');
INSERT INTO postno VALUES (3597,'402-711','인천시','남구','도화1동 대림빌딩\r\n');
INSERT INTO postno VALUES (3598,'402-712','인천시','남구','도화1동 롯데오피스텔\r\n');
INSERT INTO postno VALUES (3599,'402-713','인천시','남구','용현4동 대우전자(주)인천\r\n');
INSERT INTO postno VALUES (3600,'402-714','인천시','남구','주안1동 르네상스빌딩\r\n');
INSERT INTO postno VALUES (3601,'402-749','인천시','남구','도화2동 인천대학교\r\n');
INSERT INTO postno VALUES (3602,'402-750','인천시','남구','도화2동 인천전문대학\r\n');
INSERT INTO postno VALUES (3603,'402-751','인천시','남구','용현4동 인하대학교\r\n');
INSERT INTO postno VALUES (3604,'402-752','인천시','남구','용현4동 인하공업전문대학\r\n');
INSERT INTO postno VALUES (3605,'402-753','인천시','남구','주안6동 인천지방법원\r\n');
INSERT INTO postno VALUES (3606,'403-010','인천시','부평구','부평동\r\n');
INSERT INTO postno VALUES (3607,'403-011','인천시','부평구','부평1동\r\n');
INSERT INTO postno VALUES (3608,'403-012','인천시','부평구','부평2동\r\n');
INSERT INTO postno VALUES (3609,'403-013','인천시','부평구','부평3동\r\n');
INSERT INTO postno VALUES (3610,'403-014','인천시','부평구','부평4동\r\n');
INSERT INTO postno VALUES (3611,'403-015','인천시','부평구','부평5동\r\n');
INSERT INTO postno VALUES (3612,'403-016','인천시','부평구','부평6동\r\n');
INSERT INTO postno VALUES (3613,'403-020','인천시','부평구','산곡동\r\n');
INSERT INTO postno VALUES (3614,'403-021','인천시','부평구','산곡1동\r\n');
INSERT INTO postno VALUES (3615,'403-022','인천시','부평구','산곡2동\r\n');
INSERT INTO postno VALUES (3616,'403-023','인천시','부평구','산곡3동\r\n');
INSERT INTO postno VALUES (3617,'403-024','인천시','부평구','산곡4동\r\n');
INSERT INTO postno VALUES (3618,'403-030','인천시','부평구','청천동\r\n');
INSERT INTO postno VALUES (3619,'403-031','인천시','부평구','청천1동\r\n');
INSERT INTO postno VALUES (3620,'403-032','인천시','부평구','청천2동\r\n');
INSERT INTO postno VALUES (3621,'403-080','인천시','부평구','갈산동\r\n');
INSERT INTO postno VALUES (3622,'403-081','인천시','부평구','갈산1동\r\n');
INSERT INTO postno VALUES (3623,'403-082','인천시','부평구','갈산2동\r\n');
INSERT INTO postno VALUES (3624,'403-090','인천시','부평구','삼산동\r\n');
INSERT INTO postno VALUES (3625,'403-100','인천시','부평구','부개동\r\n');
INSERT INTO postno VALUES (3626,'403-101','인천시','부평구','부개1동\r\n');
INSERT INTO postno VALUES (3627,'403-102','인천시','부평구','부개2동\r\n');
INSERT INTO postno VALUES (3628,'403-103','인천시','부평구','부개3동\r\n');
INSERT INTO postno VALUES (3629,'403-110','인천시','부평구','일신동\r\n');
INSERT INTO postno VALUES (3630,'403-120','인천시','부평구','구산동\r\n');
INSERT INTO postno VALUES (3631,'403-130','인천시','부평구','십정동\r\n');
INSERT INTO postno VALUES (3632,'403-131','인천시','부평구','십정1동\r\n');
INSERT INTO postno VALUES (3633,'403-132','인천시','부평구','십정2동\r\n');
INSERT INTO postno VALUES (3634,'403-600','인천시','부평구','북인천우체국사서함\r\n');
INSERT INTO postno VALUES (3635,'403-701','인천시','부평구','부평4동 부평구청\r\n');
INSERT INTO postno VALUES (3636,'403-702','인천시','부평구','청천2동 부평경찰서\r\n');
INSERT INTO postno VALUES (3637,'403-711','인천시','부평구','구산동 산업안전공단연구원\r\n');
INSERT INTO postno VALUES (3638,'403-712','인천시','부평구','구산동 중앙병원\r\n');
INSERT INTO postno VALUES (3639,'403-713','인천시','부평구','부평1동 씨티백화점\r\n');
INSERT INTO postno VALUES (3640,'403-714','인천시','부평구','청천2동 대우자동차부평공\r\n');
INSERT INTO postno VALUES (3641,'403-715','인천시','부평구','부평4동 여산빌딩\r\n');
INSERT INTO postno VALUES (3642,'403-716','인천시','부평구','산곡3동 현대백화점\r\n');
INSERT INTO postno VALUES (3643,'403-717','인천시','부평구','청천2동 부평안병원\r\n');
INSERT INTO postno VALUES (3644,'403-718','인천시','부평구','청천2동 삼익악기(주)\r\n');
INSERT INTO postno VALUES (3645,'403-719','인천시','부평구','청천2동 해태전자(주)\r\n');
INSERT INTO postno VALUES (3646,'404-140','인천시','서구','백석동\r\n');
INSERT INTO postno VALUES (3647,'404-150','인천시','서구','시천동\r\n');
INSERT INTO postno VALUES (3648,'404-160','인천시','서구','검암동\r\n');
INSERT INTO postno VALUES (3649,'404-170','인천시','서구','경서동\r\n');
INSERT INTO postno VALUES (3650,'404-180','인천시','서구','연희동\r\n');
INSERT INTO postno VALUES (3651,'404-190','인천시','서구','심곡동\r\n');
INSERT INTO postno VALUES (3652,'404-200','인천시','서구','공촌동\r\n');
INSERT INTO postno VALUES (3653,'404-210','인천시','서구','원창동\r\n');
INSERT INTO postno VALUES (3654,'404-220','인천시','서구','석남동\r\n');
INSERT INTO postno VALUES (3655,'404-221','인천시','서구','석남1동\r\n');
INSERT INTO postno VALUES (3656,'404-222','인천시','서구','석남2동\r\n');
INSERT INTO postno VALUES (3657,'404-223','인천시','서구','석남3동\r\n');
INSERT INTO postno VALUES (3658,'404-230','인천시','서구','가정동\r\n');
INSERT INTO postno VALUES (3659,'404-231','인천시','서구','가정1동\r\n');
INSERT INTO postno VALUES (3660,'404-232','인천시','서구','가정2동\r\n');
INSERT INTO postno VALUES (3661,'404-233','인천시','서구','가정3동\r\n');
INSERT INTO postno VALUES (3662,'404-240','인천시','서구','신현동\r\n');
INSERT INTO postno VALUES (3663,'404-250','인천시','서구','가좌동\r\n');
INSERT INTO postno VALUES (3664,'404-251','인천시','서구','가좌1동\r\n');
INSERT INTO postno VALUES (3665,'404-252','인천시','서구','가좌2동\r\n');
INSERT INTO postno VALUES (3666,'404-253','인천시','서구','가좌3동\r\n');
INSERT INTO postno VALUES (3667,'404-254','인천시','서구','가좌4동\r\n');
INSERT INTO postno VALUES (3668,'404-260','인천시','서구','마전동\r\n');
INSERT INTO postno VALUES (3669,'404-270','인천시','서구','불로동\r\n');
INSERT INTO postno VALUES (3670,'404-280','인천시','서구','대곡동\r\n');
INSERT INTO postno VALUES (3671,'404-290','인천시','서구','왕길동\r\n');
INSERT INTO postno VALUES (3672,'404-300','인천시','서구','오류동\r\n');
INSERT INTO postno VALUES (3673,'404-310','인천시','서구','당하동\r\n');
INSERT INTO postno VALUES (3674,'404-320','인천시','서구','원당동\r\n');
INSERT INTO postno VALUES (3675,'404-330','인천시','서구','금곡동\r\n');
INSERT INTO postno VALUES (3676,'404-701','인천시','서구','연희동 서구청\r\n');
INSERT INTO postno VALUES (3677,'404-702','인천시','서구','심곡동 서구경찰서\r\n');
INSERT INTO postno VALUES (3678,'404-703','인천시','서구','연희동 서인천세무서\r\n');
INSERT INTO postno VALUES (3679,'404-711','인천시','서구','가좌1동 동부제강\r\n');
INSERT INTO postno VALUES (3680,'404-712','인천시','서구','가좌1동 바로크가구\r\n');
INSERT INTO postno VALUES (3681,'404-713','인천시','서구','가좌1동 삼익가구\r\n');
INSERT INTO postno VALUES (3682,'404-714','인천시','서구','가좌1동 영창악기\r\n');
INSERT INTO postno VALUES (3683,'404-715','인천시','서구','가좌3동 경동산업\r\n');
INSERT INTO postno VALUES (3684,'404-716','인천시','서구','가좌3동 대우통신주안1공장\r\n');
INSERT INTO postno VALUES (3685,'404-717','인천시','서구','가좌3동 새한미디어\r\n');
INSERT INTO postno VALUES (3686,'404-718','인천시','서구','경서동 서인천화력발전소\r\n');
INSERT INTO postno VALUES (3687,'405-100','인천시','남동구','남촌동\r\n');
INSERT INTO postno VALUES (3688,'405-220','인천시','남동구','구월동\r\n');
INSERT INTO postno VALUES (3689,'405-221','인천시','남동구','구월1동\r\n');
INSERT INTO postno VALUES (3690,'405-222','인천시','남동구','구월2동\r\n');
INSERT INTO postno VALUES (3691,'405-223','인천시','남동구','구월3동\r\n');
INSERT INTO postno VALUES (3692,'405-224','인천시','남동구','구월4동\r\n');
INSERT INTO postno VALUES (3693,'405-230','인천시','남동구','간석동\r\n');
INSERT INTO postno VALUES (3694,'405-231','인천시','남동구','간석1동\r\n');
INSERT INTO postno VALUES (3695,'405-232','인천시','남동구','간석2동\r\n');
INSERT INTO postno VALUES (3696,'405-233','인천시','남동구','간석3동\r\n');
INSERT INTO postno VALUES (3697,'405-234','인천시','남동구','간석4동\r\n');
INSERT INTO postno VALUES (3698,'405-240','인천시','남동구','만수동\r\n');
INSERT INTO postno VALUES (3699,'405-241','인천시','남동구','만수1동\r\n');
INSERT INTO postno VALUES (3700,'405-242','인천시','남동구','만수2동\r\n');
INSERT INTO postno VALUES (3701,'405-243','인천시','남동구','만수3동\r\n');
INSERT INTO postno VALUES (3702,'405-244','인천시','남동구','만수4동\r\n');
INSERT INTO postno VALUES (3703,'405-245','인천시','남동구','만수5동\r\n');
INSERT INTO postno VALUES (3704,'405-246','인천시','남동구','만수6동\r\n');
INSERT INTO postno VALUES (3705,'405-250','인천시','남동구','장수동\r\n');
INSERT INTO postno VALUES (3706,'405-260','인천시','남동구','서창동\r\n');
INSERT INTO postno VALUES (3707,'405-270','인천시','남동구','운연동\r\n');
INSERT INTO postno VALUES (3708,'405-280','인천시','남동구','도림동\r\n');
INSERT INTO postno VALUES (3709,'405-290','인천시','남동구','수산동\r\n');
INSERT INTO postno VALUES (3710,'405-300','인천시','남동구','논현동\r\n');
INSERT INTO postno VALUES (3711,'405-310','인천시','남동구','고잔동\r\n');
INSERT INTO postno VALUES (3712,'405-600','인천시','남동구','남인천우체국사서함\r\n');
INSERT INTO postno VALUES (3713,'405-701','인천시','남동구','간석3동 경기전문대학\r\n');
INSERT INTO postno VALUES (3714,'405-750','인천시','남동구','구월1동 인천광역시청\r\n');
INSERT INTO postno VALUES (3715,'405-760','인천시','남동구','구월1동 인천길병원\r\n');
INSERT INTO postno VALUES (3716,'406-050','인천시','연수구','옥련동\r\n');
INSERT INTO postno VALUES (3717,'406-090','인천시','연수구','선학동\r\n');
INSERT INTO postno VALUES (3718,'406-110','인천시','연수구','연수동\r\n');
INSERT INTO postno VALUES (3719,'406-111','인천시','연수구','연수1동\r\n');
INSERT INTO postno VALUES (3720,'406-112','인천시','연수구','연수2동\r\n');
INSERT INTO postno VALUES (3721,'406-113','인천시','연수구','연수3동\r\n');
INSERT INTO postno VALUES (3722,'406-120','인천시','연수구','청학동\r\n');
INSERT INTO postno VALUES (3723,'406-130','인천시','연수구','동춘동\r\n');
INSERT INTO postno VALUES (3724,'406-131','인천시','연수구','동춘1동\r\n');
INSERT INTO postno VALUES (3725,'406-132','인천시','연수구','동춘2동\r\n');
INSERT INTO postno VALUES (3726,'406-140','인천시','연수구','청량동\r\n');
INSERT INTO postno VALUES (3727,'407-040','인천시','계양구','효성동\r\n');
INSERT INTO postno VALUES (3728,'407-041','인천시','계양구','효성1동\r\n');
INSERT INTO postno VALUES (3729,'407-042','인천시','계양구','효성2동\r\n');
INSERT INTO postno VALUES (3730,'407-050','인천시','계양구','계산동\r\n');
INSERT INTO postno VALUES (3731,'407-051','인천시','계양구','계산1동\r\n');
INSERT INTO postno VALUES (3732,'407-052','인천시','계양구','계산2동\r\n');
INSERT INTO postno VALUES (3733,'407-053','인천시','계양구','계산3동\r\n');
INSERT INTO postno VALUES (3734,'407-060','인천시','계양구','작전동\r\n');
INSERT INTO postno VALUES (3735,'407-061','인천시','계양구','작전1동\r\n');
INSERT INTO postno VALUES (3736,'407-062','인천시','계양구','작전2동\r\n');
INSERT INTO postno VALUES (3737,'407-063','인천시','계양구','작전3동\r\n');
INSERT INTO postno VALUES (3738,'407-070','인천시','계양구','서운동\r\n');
INSERT INTO postno VALUES (3739,'407-300','인천시','계양구','임학동\r\n');
INSERT INTO postno VALUES (3740,'407-310','인천시','계양구','용종동\r\n');
INSERT INTO postno VALUES (3741,'407-320','인천시','계양구','병방동\r\n');
INSERT INTO postno VALUES (3742,'407-330','인천시','계양구','박촌동\r\n');
INSERT INTO postno VALUES (3743,'407-340','인천시','계양구','동양동\r\n');
INSERT INTO postno VALUES (3744,'407-350','인천시','계양구','굴현동\r\n');
INSERT INTO postno VALUES (3745,'407-360','인천시','계양구','선주지동\r\n');
INSERT INTO postno VALUES (3746,'407-370','인천시','계양구','노오지동\r\n');
INSERT INTO postno VALUES (3747,'407-380','인천시','계양구','이화동\r\n');
INSERT INTO postno VALUES (3748,'407-390','인천시','계양구','상야동\r\n');
INSERT INTO postno VALUES (3749,'407-400','인천시','계양구','평동\r\n');
INSERT INTO postno VALUES (3750,'407-410','인천시','계양구','하야동\r\n');
INSERT INTO postno VALUES (3751,'407-420','인천시','계양구','오류동\r\n');
INSERT INTO postno VALUES (3752,'407-430','인천시','계양구','갈현동\r\n');
INSERT INTO postno VALUES (3753,'407-440','인천시','계양구','둑실동\r\n');
INSERT INTO postno VALUES (3754,'407-450','인천시','계양구','목상동\r\n');
INSERT INTO postno VALUES (3755,'407-460','인천시','계양구','다남동\r\n');
INSERT INTO postno VALUES (3756,'407-470','인천시','계양구','장기동\r\n');
INSERT INTO postno VALUES (3757,'407-480','인천시','계양구','방축동\r\n');
INSERT INTO postno VALUES (3758,'407-701','인천시','계양구','계산2동 계양구청\r\n');
INSERT INTO postno VALUES (3759,'407-702','인천시','계양구','작전2동 북인천세무서\r\n');
INSERT INTO postno VALUES (3760,'407-711','인천시','계양구','작전1동 해태음료(주)\r\n');
INSERT INTO postno VALUES (3761,'407-753','인천시','계양구','계산1동 인천교육대학교\r\n');
INSERT INTO postno VALUES (3762,'409-810','인천시','옹진군','영종면\r\n');
INSERT INTO postno VALUES (3763,'409-830','인천시','옹진군','북도면\r\n');
INSERT INTO postno VALUES (3764,'409-835','인천시','옹진군','북도면 장봉리\r\n');
INSERT INTO postno VALUES (3765,'409-840','인천시','옹진군','송림면\r\n');
INSERT INTO postno VALUES (3766,'409-850','인천시','옹진군','대청면\r\n');
INSERT INTO postno VALUES (3767,'409-855','인천시','옹진군','대청면 소청리\r\n');
INSERT INTO postno VALUES (3768,'409-860','인천시','옹진군','대부면\r\n');
INSERT INTO postno VALUES (3769,'409-870','인천시','옹진군','영흥면\r\n');
INSERT INTO postno VALUES (3770,'409-880','인천시','옹진군','자월면\r\n');
INSERT INTO postno VALUES (3771,'409-890','인천시','옹진군','덕적면\r\n');
INSERT INTO postno VALUES (3772,'409-910','인천시','옹진군','백령면\r\n');
INSERT INTO postno VALUES (3773,'411-050','경기도','고양시','일산구 식사동\r\n');
INSERT INTO postno VALUES (3774,'411-310','경기도','고양시','일산구 일산동\r\n');
INSERT INTO postno VALUES (3775,'411-311','경기도','고양시','일산구 일산1동\r\n');
INSERT INTO postno VALUES (3776,'411-312','경기도','고양시','일산구 일산2동\r\n');
INSERT INTO postno VALUES (3777,'411-313','경기도','고양시','일산구 일산3동\r\n');
INSERT INTO postno VALUES (3778,'411-314','경기도','고양시','일산구 일산4동\r\n');
INSERT INTO postno VALUES (3779,'411-320','경기도','고양시','일산구 탄현동\r\n');
INSERT INTO postno VALUES (3780,'411-330','경기도','고양시','일산구 풍동\r\n');
INSERT INTO postno VALUES (3781,'411-340','경기도','고양시','일산구 산황동\r\n');
INSERT INTO postno VALUES (3782,'411-350','경기도','고양시','일산구 마두동\r\n');
INSERT INTO postno VALUES (3783,'411-351','경기도','고양시','일산구 마두1동\r\n');
INSERT INTO postno VALUES (3784,'411-352','경기도','고양시','일산구 마두2동\r\n');
INSERT INTO postno VALUES (3785,'411-360','경기도','고양시','일산구 백석동\r\n');
INSERT INTO postno VALUES (3786,'411-370','경기도','고양시','일산구 주엽동\r\n');
INSERT INTO postno VALUES (3787,'411-371','경기도','고양시','일산구 주엽1동\r\n');
INSERT INTO postno VALUES (3788,'411-372','경기도','고양시','일산구 주엽2동\r\n');
INSERT INTO postno VALUES (3789,'411-380','경기도','고양시','일산구 장항동\r\n');
INSERT INTO postno VALUES (3790,'411-381','경기도','고양시','일산구 장항1동\r\n');
INSERT INTO postno VALUES (3791,'411-382','경기도','고양시','일산구 장항2동\r\n');
INSERT INTO postno VALUES (3792,'411-410','경기도','고양시','일산구 대화동\r\n');
INSERT INTO postno VALUES (3793,'411-420','경기도','고양시','일산구 법곳동\r\n');
INSERT INTO postno VALUES (3794,'411-430','경기도','고양시','일산구 구산동\r\n');
INSERT INTO postno VALUES (3795,'411-440','경기도','고양시','일산구 가좌동\r\n');
INSERT INTO postno VALUES (3796,'411-450','경기도','고양시','일산구 덕이동\r\n');
INSERT INTO postno VALUES (3797,'411-530','경기도','고양시','일산구 사리현동\r\n');
INSERT INTO postno VALUES (3798,'411-540','경기도','고양시','일산구 지영동\r\n');
INSERT INTO postno VALUES (3799,'411-550','경기도','고양시','일산구 설문동\r\n');
INSERT INTO postno VALUES (3800,'411-560','경기도','고양시','일산구 문봉동\r\n');
INSERT INTO postno VALUES (3801,'411-570','경기도','고양시','일산구 성석동\r\n');
INSERT INTO postno VALUES (3802,'411-600','경기도','고양시','고양일산우체국사서함\r\n');
INSERT INTO postno VALUES (3803,'411-702','경기도','고양시','일산구 마두1동 일산구청\r\n');
INSERT INTO postno VALUES (3804,'412-010','경기도','고양시','덕양구 주교동\r\n');
INSERT INTO postno VALUES (3805,'412-020','경기도','고양시','덕양구 성사동\r\n');
INSERT INTO postno VALUES (3806,'412-021','경기도','고양시','덕양구 성사1동\r\n');
INSERT INTO postno VALUES (3807,'412-022','경기도','고양시','덕양구 성사2동\r\n');
INSERT INTO postno VALUES (3808,'412-030','경기도','고양시','덕양구 원당동\r\n');
INSERT INTO postno VALUES (3809,'412-040','경기도','고양시','덕양구 원흥동\r\n');
INSERT INTO postno VALUES (3810,'412-060','경기도','고양시','덕양구 도내동\r\n');
INSERT INTO postno VALUES (3811,'412-070','경기도','고양시','덕양구 신원동\r\n');
INSERT INTO postno VALUES (3812,'412-080','경기도','고양시','덕양구 삼송동\r\n');
INSERT INTO postno VALUES (3813,'412-090','경기도','고양시','덕양구 동산동\r\n');
INSERT INTO postno VALUES (3814,'412-110','경기도','고양시','덕양구 용두동\r\n');
INSERT INTO postno VALUES (3815,'412-120','경기도','고양시','덕양구 지축동\r\n');
INSERT INTO postno VALUES (3816,'412-130','경기도','고양시','덕양구 북한동\r\n');
INSERT INTO postno VALUES (3817,'412-140','경기도','고양시','덕양구 효자동\r\n');
INSERT INTO postno VALUES (3818,'412-150','경기도','고양시','덕양구 오금동\r\n');
INSERT INTO postno VALUES (3819,'412-160','경기도','고양시','덕양구 화전동\r\n');
INSERT INTO postno VALUES (3820,'412-170','경기도','고양시','덕양구 덕은동\r\n');
INSERT INTO postno VALUES (3821,'412-180','경기도','고양시','덕양구 향동동\r\n');
INSERT INTO postno VALUES (3822,'412-190','경기도','고양시','덕양구 현천동\r\n');
INSERT INTO postno VALUES (3823,'412-210','경기도','고양시','덕양구 토당동\r\n');
INSERT INTO postno VALUES (3824,'412-220','경기도','고양시','덕양구 행신동\r\n');
INSERT INTO postno VALUES (3825,'412-221','경기도','고양시','덕양구 행신1동\r\n');
INSERT INTO postno VALUES (3826,'412-222','경기도','고양시','덕양구 행신2동\r\n');
INSERT INTO postno VALUES (3827,'412-230','경기도','고양시','덕양구 행주내동\r\n');
INSERT INTO postno VALUES (3828,'412-240','경기도','고양시','덕양구 행주외동\r\n');
INSERT INTO postno VALUES (3829,'412-250','경기도','고양시','덕양구 대장동\r\n');
INSERT INTO postno VALUES (3830,'412-260','경기도','고양시','덕양구 내곡동\r\n');
INSERT INTO postno VALUES (3831,'412-270','경기도','고양시','덕양구 화정동\r\n');
INSERT INTO postno VALUES (3832,'412-280','경기도','고양시','덕양구 신평동\r\n');
INSERT INTO postno VALUES (3833,'412-290','경기도','고양시','덕양구 강매동\r\n');
INSERT INTO postno VALUES (3834,'412-470','경기도','고양시','덕양구 관산동\r\n');
INSERT INTO postno VALUES (3835,'412-480','경기도','고양시','덕양구 대자동\r\n');
INSERT INTO postno VALUES (3836,'412-490','경기도','고양시','덕양구 선유동\r\n');
INSERT INTO postno VALUES (3837,'412-500','경기도','고양시','덕양구 고양동\r\n');
INSERT INTO postno VALUES (3838,'412-510','경기도','고양시','덕양구 벽제동\r\n');
INSERT INTO postno VALUES (3839,'412-520','경기도','고양시','덕양구 내유동\r\n');
INSERT INTO postno VALUES (3840,'412-600','경기도','고양시','덕양구 덕양우체국사서함\r\n');
INSERT INTO postno VALUES (3841,'412-701','경기도','고양시','덕양구 원당동 고양시청\r\n');
INSERT INTO postno VALUES (3842,'412-702','경기도','고양시','덕양구 화정동 덕양구청\r\n');
INSERT INTO postno VALUES (3843,'412-703','경기도','고양시','덕양구 고양경찰서\r\n');
INSERT INTO postno VALUES (3844,'412-707','경기도','고양시','농협협동조합전문대학\r\n');
INSERT INTO postno VALUES (3845,'412-791','경기도','고양시','덕양구 한국항공대학교\r\n');
INSERT INTO postno VALUES (3846,'413-010','경기도','파주시','금촌동\r\n');
INSERT INTO postno VALUES (3847,'413-020','경기도','파주시','아동동\r\n');
INSERT INTO postno VALUES (3848,'413-030','경기도','파주시','금릉동\r\n');
INSERT INTO postno VALUES (3849,'413-040','경기도','파주시','야동동\r\n');
INSERT INTO postno VALUES (3850,'413-050','경기도','파주시','검산동\r\n');
INSERT INTO postno VALUES (3851,'413-060','경기도','파주시','맥금동\r\n');
INSERT INTO postno VALUES (3852,'413-810','경기도','파주시','월롱면\r\n');
INSERT INTO postno VALUES (3853,'413-820','경기도','파주시','조리면\r\n');
INSERT INTO postno VALUES (3854,'413-830','경기도','파주시','교하면\r\n');
INSERT INTO postno VALUES (3855,'413-840','경기도','파주시','탄현면\r\n');
INSERT INTO postno VALUES (3856,'413-850','경기도','파주시','광탄면\r\n');
INSERT INTO postno VALUES (3857,'413-860','경기도','파주시','파주읍\r\n');
INSERT INTO postno VALUES (3858,'413-870','경기도','파주시','법원읍\r\n');
INSERT INTO postno VALUES (3859,'413-880','경기도','파주시','파평면\r\n');
INSERT INTO postno VALUES (3860,'413-900','경기도','파주시','문산읍\r\n');
INSERT INTO postno VALUES (3861,'413-910','경기도','파주시','적성면\r\n');
INSERT INTO postno VALUES (3862,'413-920','경기도','파주군','군내면\r\n');
INSERT INTO postno VALUES (3863,'415-800','경기도','김포시','김포읍\r\n');
INSERT INTO postno VALUES (3864,'415-810','경기도','김포시','고촌면\r\n');
INSERT INTO postno VALUES (3865,'415-820','경기도','김포시','검단면\r\n');
INSERT INTO postno VALUES (3866,'415-840','경기도','김포시','양촌면\r\n');
INSERT INTO postno VALUES (3867,'415-850','경기도','김포시','대곳면\r\n');
INSERT INTO postno VALUES (3868,'415-860','경기도','김포시','통진면\r\n');
INSERT INTO postno VALUES (3869,'415-870','경기도','김포시','월곳면\r\n');
INSERT INTO postno VALUES (3870,'415-880','경기도','김포시','하성면\r\n');
INSERT INTO postno VALUES (3871,'417-800','인천시','강화군','강화읍\r\n');
INSERT INTO postno VALUES (3872,'417-810','인천시','강화군','송해면\r\n');
INSERT INTO postno VALUES (3873,'417-820','인천시','강화군','선원면\r\n');
INSERT INTO postno VALUES (3874,'417-830','인천시','강화군','불은면\r\n');
INSERT INTO postno VALUES (3875,'417-840','인천시','강화군','길상면\r\n');
INSERT INTO postno VALUES (3876,'417-850','인천시','강화군','양도면\r\n');
INSERT INTO postno VALUES (3877,'417-860','인천시','강화군','화도면\r\n');
INSERT INTO postno VALUES (3878,'417-870','인천시','강화군','하점면\r\n');
INSERT INTO postno VALUES (3879,'417-880','인천시','강화군','양사면\r\n');
INSERT INTO postno VALUES (3880,'417-890','인천시','강화군','내가면\r\n');
INSERT INTO postno VALUES (3881,'417-910','인천시','강화군','삼산면\r\n');
INSERT INTO postno VALUES (3882,'417-920','인천시','강화군','교동면\r\n');
INSERT INTO postno VALUES (3883,'417-930','인천시','강화군','서도면\r\n');
INSERT INTO postno VALUES (3884,'420-010','경기도','부천시','원미구 심곡동\r\n');
INSERT INTO postno VALUES (3885,'420-011','경기도','부천시','원미구 심곡1동\r\n');
INSERT INTO postno VALUES (3886,'420-012','경기도','부천시','원미구 심곡2동\r\n');
INSERT INTO postno VALUES (3887,'420-013','경기도','부천시','원미구 심곡3동\r\n');
INSERT INTO postno VALUES (3888,'420-020','경기도','부천시','원미구 중동\r\n');
INSERT INTO postno VALUES (3889,'420-021','경기도','부천시','원미구 중1동\r\n');
INSERT INTO postno VALUES (3890,'420-022','경기도','부천시','원미구 중2동\r\n');
INSERT INTO postno VALUES (3891,'420-023','경기도','부천시','원미구 중3동\r\n');
INSERT INTO postno VALUES (3892,'420-030','경기도','부천시','원미구 상동\r\n');
INSERT INTO postno VALUES (3893,'420-031','경기도','부천시','원미구 상1동\r\n');
INSERT INTO postno VALUES (3894,'420-050','경기도','부천시','원미구 소사동\r\n');
INSERT INTO postno VALUES (3895,'420-100','경기도','부천시','원미구 역곡동\r\n');
INSERT INTO postno VALUES (3896,'420-101','경기도','부천시','원미구 역곡1동\r\n');
INSERT INTO postno VALUES (3897,'420-102','경기도','부천시','원미구 역곡2동\r\n');
INSERT INTO postno VALUES (3898,'420-110','경기도','부천시','원미구 원미동\r\n');
INSERT INTO postno VALUES (3899,'420-111','경기도','부천시','원미구 원미1동\r\n');
INSERT INTO postno VALUES (3900,'420-112','경기도','부천시','원미구 원미2동\r\n');
INSERT INTO postno VALUES (3901,'420-120','경기도','부천시','원미구 춘의동\r\n');
INSERT INTO postno VALUES (3902,'420-130','경기도','부천시','원미구 도당동\r\n');
INSERT INTO postno VALUES (3903,'420-140','경기도','부천시','원미구 약대동\r\n');
INSERT INTO postno VALUES (3904,'420-600','경기도','부천시','윈미구 중동우체국사서함\r\n');
INSERT INTO postno VALUES (3905,'420-701','경기도','부천시','원미구 원미1동 원미구청\r\n');
INSERT INTO postno VALUES (3906,'420-702','경기도','부천시','원미구 중2동 중부경찰서\r\n');
INSERT INTO postno VALUES (3907,'420-703','경기도','부천시','원미구 인천지방검찰청부천\r\n');
INSERT INTO postno VALUES (3908,'420-704','경기도','부천시','원미구 인천지방법원부천지\r\n');
INSERT INTO postno VALUES (3909,'420-711','경기도','부천시','원미구 도당동 삼성전자(주\r\n');
INSERT INTO postno VALUES (3910,'420-712','경기도','부천시','원미구 아남(주)부천공장\r\n');
INSERT INTO postno VALUES (3911,'420-713','경기도','부천시','원미구 상1동 뉴코아백화점\r\n');
INSERT INTO postno VALUES (3912,'420-714','경기도','부천시','원미구 대명시티프라자\r\n');
INSERT INTO postno VALUES (3913,'420-715','경기도','부천시','원미구 상1동 LG백화점\r\n');
INSERT INTO postno VALUES (3914,'420-716','경기도','부천시','원미구 상1동 우신프라자\r\n');
INSERT INTO postno VALUES (3915,'420-717','경기도','부천시','원미구 소사동 성가병원\r\n');
INSERT INTO postno VALUES (3916,'420-718','경기도','부천시','원미구 심곡1동 대성병원\r\n');
INSERT INTO postno VALUES (3917,'420-719','경기도','부천시','원미구 심곡2동 해태쇼핑\r\n');
INSERT INTO postno VALUES (3918,'420-720','경기도','부천시','원미구 심곡2동 로얄백화점\r\n');
INSERT INTO postno VALUES (3919,'420-735','경기도','부천시','원미구 심곡3동 부천전문대\r\n');
INSERT INTO postno VALUES (3920,'420-736','경기도','부천시','원미구 원미1동 부천시청\r\n');
INSERT INTO postno VALUES (3921,'420-743','경기도','부천시','원미구 가톨릭대학교부천캠\r\n');
INSERT INTO postno VALUES (3922,'421-150','경기도','부천시','오정구 삼정동\r\n');
INSERT INTO postno VALUES (3923,'421-160','경기도','부천시','오정구 내동\r\n');
INSERT INTO postno VALUES (3924,'421-165','경기도','부천시','오정구 신흥동\r\n');
INSERT INTO postno VALUES (3925,'421-170','경기도','부천시','오정구 오정동\r\n');
INSERT INTO postno VALUES (3926,'421-180','경기도','부천시','오정구 대장동\r\n');
INSERT INTO postno VALUES (3927,'421-190','경기도','부천시','오정구 고강본동\r\n');
INSERT INTO postno VALUES (3928,'421-191','경기도','부천시','오정구 고강본1동\r\n');
INSERT INTO postno VALUES (3929,'421-200','경기도','부천시','오정구 원종동\r\n');
INSERT INTO postno VALUES (3930,'421-201','경기도','부천시','오정구 원종1동\r\n');
INSERT INTO postno VALUES (3931,'421-202','경기도','부천시','오정구 원종2동\r\n');
INSERT INTO postno VALUES (3932,'421-210','경기도','부천시','오정구 작동\r\n');
INSERT INTO postno VALUES (3933,'421-215','경기도','부천시','오정구 성곡동\r\n');
INSERT INTO postno VALUES (3934,'421-220','경기도','부천시','오정구 여월동\r\n');
INSERT INTO postno VALUES (3935,'422-040','경기도','부천시','소사구 송내동\r\n');
INSERT INTO postno VALUES (3936,'422-041','경기도','부천시','소사구 송내1동\r\n');
INSERT INTO postno VALUES (3937,'422-042','경기도','부천시','소사구 송내2동\r\n');
INSERT INTO postno VALUES (3938,'422-060','경기도','부천시','소사구 범박동\r\n');
INSERT INTO postno VALUES (3939,'422-070','경기도','부천시','소사구 계수동\r\n');
INSERT INTO postno VALUES (3940,'422-080','경기도','부천시','소사구 옥길동\r\n');
INSERT INTO postno VALUES (3941,'422-090','경기도','부천시','소사구 괴안동\r\n');
INSERT INTO postno VALUES (3942,'422-103','경기도','부천시','소사구 역곡3동\r\n');
INSERT INTO postno VALUES (3943,'422-230','경기도','부천시','소사구 소사본동\r\n');
INSERT INTO postno VALUES (3944,'422-231','경기도','부천시','소사구 소사본1동\r\n');
INSERT INTO postno VALUES (3945,'422-232','경기도','부천시','소사구 소사본2동\r\n');
INSERT INTO postno VALUES (3946,'422-233','경기도','부천시','소사구 소사본3동\r\n');
INSERT INTO postno VALUES (3947,'422-240','경기도','부천시','소사구 심곡본동\r\n');
INSERT INTO postno VALUES (3948,'422-241','경기도','부천시','소사구 심곡본1동\r\n');
INSERT INTO postno VALUES (3949,'422-242','경기도','부천시','소사구 심곡본2동\r\n');
INSERT INTO postno VALUES (3950,'422-600','경기도','부천시','소사구 부천우체국사서함\r\n');
INSERT INTO postno VALUES (3951,'422-701','경기도','부천시','소사구 소사구청\r\n');
INSERT INTO postno VALUES (3952,'422-702','경기도','부천시','소사구 송내2동 부천경찰서\r\n');
INSERT INTO postno VALUES (3953,'422-703','경기도','부천시','소사구 부천세무서\r\n');
INSERT INTO postno VALUES (3954,'422-711','경기도','부천시','소사구 소사본동 세종병원\r\n');
INSERT INTO postno VALUES (3955,'422-712','경기도','부천시','소사구 그레이스백화점\r\n');
INSERT INTO postno VALUES (3956,'422-742','경기도','부천시','소사구 서울신학대학교\r\n');
INSERT INTO postno VALUES (3957,'422-749','경기도','부천시','소사구 역곡3동 유한전문대\r\n');
INSERT INTO postno VALUES (3958,'423-010','경기도','광명시','광명동\r\n');
INSERT INTO postno VALUES (3959,'423-011','경기도','광명시','광명1동\r\n');
INSERT INTO postno VALUES (3960,'423-012','경기도','광명시','광명2동\r\n');
INSERT INTO postno VALUES (3961,'423-013','경기도','광명시','광명3동\r\n');
INSERT INTO postno VALUES (3962,'423-014','경기도','광명시','광명4동\r\n');
INSERT INTO postno VALUES (3963,'423-015','경기도','광명시','광명5동\r\n');
INSERT INTO postno VALUES (3964,'423-016','경기도','광명시','광명6동\r\n');
INSERT INTO postno VALUES (3965,'423-017','경기도','광명시','광명7동\r\n');
INSERT INTO postno VALUES (3966,'423-030','경기도','광명시','철산동\r\n');
INSERT INTO postno VALUES (3967,'423-031','경기도','광명시','철산1동\r\n');
INSERT INTO postno VALUES (3968,'423-032','경기도','광명시','철산2동\r\n');
INSERT INTO postno VALUES (3969,'423-033','경기도','광명시','철산3동\r\n');
INSERT INTO postno VALUES (3970,'423-034','경기도','광명시','철산4동\r\n');
INSERT INTO postno VALUES (3971,'423-050','경기도','광명시','소하동\r\n');
INSERT INTO postno VALUES (3972,'423-051','경기도','광명시','소하1동\r\n');
INSERT INTO postno VALUES (3973,'423-052','경기도','광명시','소하2동\r\n');
INSERT INTO postno VALUES (3974,'423-060','경기도','광명시','하안동\r\n');
INSERT INTO postno VALUES (3975,'423-061','경기도','광명시','하안1동\r\n');
INSERT INTO postno VALUES (3976,'423-062','경기도','광명시','하안2동\r\n');
INSERT INTO postno VALUES (3977,'423-063','경기도','광명시','하안3동\r\n');
INSERT INTO postno VALUES (3978,'423-064','경기도','광명시','하안4동\r\n');
INSERT INTO postno VALUES (3979,'423-070','경기도','광명시','가학동\r\n');
INSERT INTO postno VALUES (3980,'423-080','경기도','광명시','노온사동\r\n');
INSERT INTO postno VALUES (3981,'423-090','경기도','광명시','일직동\r\n');
INSERT INTO postno VALUES (3982,'423-100','경기도','광명시','옥길동\r\n');
INSERT INTO postno VALUES (3983,'423-600','경기도','광명시','광명우체국사서함\r\n');
INSERT INTO postno VALUES (3984,'423-701','경기도','광명시','기아산업(주)소하리공장\r\n');
INSERT INTO postno VALUES (3985,'423-702','경기도','광명시','철산3동 광명시청\r\n');
INSERT INTO postno VALUES (3986,'423-703','경기도','광명시','철산3동 광명경찰서\r\n');
INSERT INTO postno VALUES (3987,'423-711','경기도','광명시','철산3동 광명성애병원\r\n');
INSERT INTO postno VALUES (3988,'425-010','경기도','안산시','중앙동\r\n');
INSERT INTO postno VALUES (3989,'425-020','경기도','안산시','고잔동\r\n');
INSERT INTO postno VALUES (3990,'425-021','경기도','안산시','고잔1동\r\n');
INSERT INTO postno VALUES (3991,'425-022','경기도','안산시','고잔2동\r\n');
INSERT INTO postno VALUES (3992,'425-030','경기도','안산시','와동\r\n');
INSERT INTO postno VALUES (3993,'425-040','경기도','안산시','성포동\r\n');
INSERT INTO postno VALUES (3994,'425-050','경기도','안산시','양상동\r\n');
INSERT INTO postno VALUES (3995,'425-060','경기도','안산시','부곡동\r\n');
INSERT INTO postno VALUES (3996,'425-070','경기도','안산시','월피동\r\n');
INSERT INTO postno VALUES (3997,'425-080','경기도','안산시','초지동\r\n');
INSERT INTO postno VALUES (3998,'425-090','경기도','안산시','원시동\r\n');
INSERT INTO postno VALUES (3999,'425-100','경기도','안산시','목내동\r\n');
INSERT INTO postno VALUES (4000,'425-110','경기도','안산시','성곡동\r\n');
INSERT INTO postno VALUES (4001,'425-120','경기도','안산시','신길동\r\n');
INSERT INTO postno VALUES (4002,'425-130','경기도','안산시','원곡동\r\n');
INSERT INTO postno VALUES (4003,'425-131','경기도','안산시','원곡1동\r\n');
INSERT INTO postno VALUES (4004,'425-132','경기도','안산시','원곡2동\r\n');
INSERT INTO postno VALUES (4005,'425-140','경기도','안산시','선부동\r\n');
INSERT INTO postno VALUES (4006,'425-141','경기도','안산시','선부1동\r\n');
INSERT INTO postno VALUES (4007,'425-142','경기도','안산시','선부2동\r\n');
INSERT INTO postno VALUES (4008,'425-143','경기도','안산시','선부3동\r\n');
INSERT INTO postno VALUES (4009,'425-150','경기도','안산시','일동\r\n');
INSERT INTO postno VALUES (4010,'425-160','경기도','안산시','이동\r\n');
INSERT INTO postno VALUES (4011,'425-170','경기도','안산시','사동\r\n');
INSERT INTO postno VALUES (4012,'425-171','경기도','안산시','사1동\r\n');
INSERT INTO postno VALUES (4013,'425-172','경기도','안산시','사2동\r\n');
INSERT INTO postno VALUES (4014,'425-180','경기도','안산시','본오동\r\n');
INSERT INTO postno VALUES (4015,'425-181','경기도','안산시','본오1동\r\n');
INSERT INTO postno VALUES (4016,'425-182','경기도','안산시','본오2동\r\n');
INSERT INTO postno VALUES (4017,'425-183','경기도','안산시','본오3동\r\n');
INSERT INTO postno VALUES (4018,'425-190','경기도','안산시','팔곡이동\r\n');
INSERT INTO postno VALUES (4019,'425-200','경기도','안산시','팔곡일동\r\n');
INSERT INTO postno VALUES (4020,'425-210','경기도','안산시','건건동\r\n');
INSERT INTO postno VALUES (4021,'425-220','경기도','안산시','사사동\r\n');
INSERT INTO postno VALUES (4022,'409-350','경기도','안산시','풍도동\r\n');
INSERT INTO postno VALUES (4023,'425-400','경기도','안산시','수암동\r\n');
INSERT INTO postno VALUES (4024,'425-410','경기도','안산시','장상동\r\n');
INSERT INTO postno VALUES (4025,'425-420','경기도','안산시','장하동\r\n');
INSERT INTO postno VALUES (4026,'425-430','경기도','안산시','하정동\r\n');
INSERT INTO postno VALUES (4027,'425-600','경기도','안산시','안산우체국사서함\r\n');
INSERT INTO postno VALUES (4028,'425-701','경기도','안산시','일동 안산전문대학\r\n');
INSERT INTO postno VALUES (4029,'425-702','경기도','안산시','고잔1동 안산시청\r\n');
INSERT INTO postno VALUES (4030,'425-791','경기도','안산시','사1동 한양대학교안산컴퍼\r\n');
INSERT INTO postno VALUES (4031,'427-010','경기도','과천시','중앙동\r\n');
INSERT INTO postno VALUES (4032,'427-020','경기도','과천시','관문동\r\n');
INSERT INTO postno VALUES (4033,'427-030','경기도','과천시','원문동\r\n');
INSERT INTO postno VALUES (4034,'427-040','경기도','과천시','별양동\r\n');
INSERT INTO postno VALUES (4035,'427-050','경기도','과천시','부림동\r\n');
INSERT INTO postno VALUES (4036,'427-060','경기도','과천시','과천동\r\n');
INSERT INTO postno VALUES (4037,'427-070','경기도','과천시','주암동\r\n');
INSERT INTO postno VALUES (4038,'427-080','경기도','과천시','막계동\r\n');
INSERT INTO postno VALUES (4039,'427-090','경기도','과천시','문원동\r\n');
INSERT INTO postno VALUES (4040,'427-100','경기도','과천시','갈현동\r\n');
INSERT INTO postno VALUES (4041,'427-600','경기도','과천시','과천우체국사서함\r\n');
INSERT INTO postno VALUES (4042,'427-760','경기도','과천시','중앙동 제2정부종합청사\r\n');
INSERT INTO postno VALUES (4043,'429-010','경기도','시흥시','대야동\r\n');
INSERT INTO postno VALUES (4044,'429-020','경기도','시흥시','신천동\r\n');
INSERT INTO postno VALUES (4045,'429-030','경기도','시흥시','방산동\r\n');
INSERT INTO postno VALUES (4046,'429-040','경기도','시흥시','포동\r\n');
INSERT INTO postno VALUES (4047,'429-040','경기도','시흥시','신관동\r\n');
INSERT INTO postno VALUES (4048,'429-050','경기도','시흥시','미산동\r\n');
INSERT INTO postno VALUES (4049,'429-060','경기도','시흥시','은행동\r\n');
INSERT INTO postno VALUES (4050,'429-070','경기도','시흥시','안현동\r\n');
INSERT INTO postno VALUES (4051,'429-080','경기도','시흥시','매화동\r\n');
INSERT INTO postno VALUES (4052,'429-090','경기도','시흥시','도창동\r\n');
INSERT INTO postno VALUES (4053,'429-100','경기도','시흥시','금이동\r\n');
INSERT INTO postno VALUES (4054,'429-110','경기도','시흥시','무지내동\r\n');
INSERT INTO postno VALUES (4055,'429-120','경기도','시흥시','과림동\r\n');
INSERT INTO postno VALUES (4056,'429-130','경기도','시흥시','계수동\r\n');
INSERT INTO postno VALUES (4057,'429-230','경기도','시흥시','화정동\r\n');
INSERT INTO postno VALUES (4058,'429-240','경기도','시흥시','능곡동\r\n');
INSERT INTO postno VALUES (4059,'429-250','경기도','시흥시','하중동\r\n');
INSERT INTO postno VALUES (4060,'429-260','경기도','시흥시','광석동\r\n');
INSERT INTO postno VALUES (4061,'429-270','경기도','시흥시','하상동\r\n');
INSERT INTO postno VALUES (4062,'429-280','경기도','시흥시','물왕동\r\n');
INSERT INTO postno VALUES (4063,'429-290','경기도','시흥시','산현동\r\n');
INSERT INTO postno VALUES (4064,'429-300','경기도','시흥시','조남동\r\n');
INSERT INTO postno VALUES (4065,'429-310','경기도','시흥시','논곡동\r\n');
INSERT INTO postno VALUES (4066,'429-320','경기도','시흥시','목감동\r\n');
INSERT INTO postno VALUES (4067,'429-400','경기도','시흥시','거모동\r\n');
INSERT INTO postno VALUES (4068,'429-410','경기도','시흥시','군자동\r\n');
INSERT INTO postno VALUES (4069,'429-420','경기도','시흥시','장현동\r\n');
INSERT INTO postno VALUES (4070,'429-430','경기도','시흥시','장곡동\r\n');
INSERT INTO postno VALUES (4071,'429-440','경기도','시흥시','월곳동\r\n');
INSERT INTO postno VALUES (4072,'429-450','경기도','시흥시','정왕동\r\n');
INSERT INTO postno VALUES (4073,'429-460','경기도','시흥시','죽율동\r\n');
INSERT INTO postno VALUES (4074,'429-701','경기도','시흥시','대야동 시흥시청\r\n');
INSERT INTO postno VALUES (4075,'429-711','경기도','시흥시','대야동 대우통신(주)\r\n');
INSERT INTO postno VALUES (4076,'429-712','경기도','시흥시','대야동 한국가스안전공사\r\n');
INSERT INTO postno VALUES (4077,'430-010','경기도','안양시','만안구 안양동\r\n');
INSERT INTO postno VALUES (4078,'430-011','경기도','안양시','만안구 안양1동\r\n');
INSERT INTO postno VALUES (4079,'430-012','경기도','안양시','만안구 안양2동\r\n');
INSERT INTO postno VALUES (4080,'430-013','경기도','안양시','만안구 안양3동\r\n');
INSERT INTO postno VALUES (4081,'430-014','경기도','안양시','만안구 안양4동\r\n');
INSERT INTO postno VALUES (4082,'430-015','경기도','안양시','만안구 안양5동\r\n');
INSERT INTO postno VALUES (4083,'430-016','경기도','안양시','만안구 안양6동\r\n');
INSERT INTO postno VALUES (4084,'430-017','경기도','안양시','만안구 안양7동\r\n');
INSERT INTO postno VALUES (4085,'430-018','경기도','안양시','만안구 안양8동\r\n');
INSERT INTO postno VALUES (4086,'430-019','경기도','안양시','만안구 안양9동\r\n');
INSERT INTO postno VALUES (4087,'430-030','경기도','안양시','만안구 박달동\r\n');
INSERT INTO postno VALUES (4088,'430-031','경기도','안양시','만안구 박달1동\r\n');
INSERT INTO postno VALUES (4089,'430-032','경기도','안양시','만안구 박달2동\r\n');
INSERT INTO postno VALUES (4090,'430-040','경기도','안양시','만안구 석수동\r\n');
INSERT INTO postno VALUES (4091,'430-041','경기도','안양시','만안구 석수1동\r\n');
INSERT INTO postno VALUES (4092,'430-042','경기도','안양시','만안구 석수2동\r\n');
INSERT INTO postno VALUES (4093,'430-043','경기도','안양시','만안구 석수3동\r\n');
INSERT INTO postno VALUES (4094,'430-600','경기도','안양시','만안구 안양우체국사서함\r\n');
INSERT INTO postno VALUES (4095,'430-714','경기도','안양시','만안구 안양5동 안양대학교\r\n');
INSERT INTO postno VALUES (4096,'430-715','경기도','안양시','만안구 안양6동 호정타워\r\n');
INSERT INTO postno VALUES (4097,'430-716','경기도','안양시','만안구 안양8동 도정타워\r\n');
INSERT INTO postno VALUES (4098,'430-742','경기도','안양시','만안구 안양8동 성결대학교\r\n');
INSERT INTO postno VALUES (4099,'430-749','경기도','안양시','만안구 안양3동 안양전문대\r\n');
INSERT INTO postno VALUES (4100,'431-050','경기도','안양시','동안구 비산동\r\n');
INSERT INTO postno VALUES (4101,'431-051','경기도','안양시','동안구 비산1동\r\n');
INSERT INTO postno VALUES (4102,'431-052','경기도','안양시','동안구 비산2동\r\n');
INSERT INTO postno VALUES (4103,'431-053','경기도','안양시','동안구 비산3동\r\n');
INSERT INTO postno VALUES (4104,'431-054','경기도','안양시','동안구 부흥동\r\n');
INSERT INTO postno VALUES (4105,'431-058','경기도','안양시','동안구 달안동\r\n');
INSERT INTO postno VALUES (4106,'431-060','경기도','안양시','동안구 관양동\r\n');
INSERT INTO postno VALUES (4107,'431-061','경기도','안양시','동안구 관양1동\r\n');
INSERT INTO postno VALUES (4108,'431-062','경기도','안양시','동안구 관양2동\r\n');
INSERT INTO postno VALUES (4109,'431-065','경기도','안양시','동안구 부림동\r\n');
INSERT INTO postno VALUES (4110,'431-070','경기도','안양시','동안구 평촌동\r\n');
INSERT INTO postno VALUES (4111,'431-075','경기도','안양시','동안구 평안동\r\n');
INSERT INTO postno VALUES (4112,'431-076','경기도','안양시','동안구 귀인동\r\n');
INSERT INTO postno VALUES (4113,'431-080','경기도','안양시','동안구 호계동\r\n');
INSERT INTO postno VALUES (4114,'431-081','경기도','안양시','동안구 호계1동\r\n');
INSERT INTO postno VALUES (4115,'431-082','경기도','안양시','동안구 호계2동\r\n');
INSERT INTO postno VALUES (4116,'431-083','경기도','안양시','동안구 호계3동\r\n');
INSERT INTO postno VALUES (4117,'431-085','경기도','안양시','동안구 법계동\r\n');
INSERT INTO postno VALUES (4118,'431-086','경기도','안양시','동안구 신촌동\r\n');
INSERT INTO postno VALUES (4119,'431-088','경기도','안양시','동안구 갈산동\r\n');
INSERT INTO postno VALUES (4120,'431-711','경기도','안양시','동안구 한국석유개발공사\r\n');
INSERT INTO postno VALUES (4121,'431-712','경기도','안양시','동안구 국토개발연구원\r\n');
INSERT INTO postno VALUES (4122,'431-715','경기도','안양시','동안구 대림전문대\r\n');
INSERT INTO postno VALUES (4123,'435-010','경기도','군포시','당동\r\n');
INSERT INTO postno VALUES (4124,'435-011','경기도','군포시','군포1동\r\n');
INSERT INTO postno VALUES (4125,'435-012','경기도','군포시','군포2동\r\n');
INSERT INTO postno VALUES (4126,'435-020','경기도','군포시','부곡동\r\n');
INSERT INTO postno VALUES (4127,'435-030','경기도','군포시','당정동\r\n');
INSERT INTO postno VALUES (4128,'435-040','경기도','군포시','산본동\r\n');
INSERT INTO postno VALUES (4129,'435-041','경기도','군포시','산본1동\r\n');
INSERT INTO postno VALUES (4130,'435-042','경기도','군포시','산본2동\r\n');
INSERT INTO postno VALUES (4131,'435-044','경기도','군포시','수리동\r\n');
INSERT INTO postno VALUES (4132,'435-045','경기도','군포시','광정동\r\n');
INSERT INTO postno VALUES (4133,'435-047','경기도','군포시','궁내동\r\n');
INSERT INTO postno VALUES (4134,'435-050','경기도','군포시','금정동\r\n');
INSERT INTO postno VALUES (4135,'435-055','경기도','군포시','재궁동\r\n');
INSERT INTO postno VALUES (4136,'435-058','경기도','군포시','오금동\r\n');
INSERT INTO postno VALUES (4137,'435-060','경기도','군포시','대야미동\r\n');
INSERT INTO postno VALUES (4138,'435-070','경기도','군포시','도마교동\r\n');
INSERT INTO postno VALUES (4139,'435-080','경기도','군포시','둔대동\r\n');
INSERT INTO postno VALUES (4140,'435-090','경기도','군포시','속달동\r\n');
INSERT INTO postno VALUES (4141,'435-701','경기도','군포시','금정동 군포시청\r\n');
INSERT INTO postno VALUES (4142,'435-702','경기도','군포시','금정동 군포경찰서\r\n');
INSERT INTO postno VALUES (4143,'435-703','경기도','군포시','산본2동 군포전화국\r\n');
INSERT INTO postno VALUES (4144,'435-711','경기도','군포시','군포1동 만도기계군포공장\r\n');
INSERT INTO postno VALUES (4145,'435-712','경기도','군포시','군포1동 LG전선군포공장\r\n');
INSERT INTO postno VALUES (4146,'435-713','경기도','군포시','당정동 농심(주)군포공장\r\n');
INSERT INTO postno VALUES (4147,'435-714','경기도','군포시','당정동 대영전자\r\n');
INSERT INTO postno VALUES (4148,'435-715','경기도','군포시','당정동 유한양행\r\n');
INSERT INTO postno VALUES (4149,'435-716','경기도','군포시','당정동 케피코\r\n');
INSERT INTO postno VALUES (4150,'435-742','경기도','군포시','당정동 순신대학교\r\n');
INSERT INTO postno VALUES (4151,'437-010','경기도','의왕시','고천동\r\n');
INSERT INTO postno VALUES (4152,'437-020','경기도','의왕시','왕곡동\r\n');
INSERT INTO postno VALUES (4153,'437-030','경기도','의왕시','이동\r\n');
INSERT INTO postno VALUES (4154,'437-040','경기도','의왕시','삼동\r\n');
INSERT INTO postno VALUES (4155,'437-040','경기도','의왕시','부곡동\r\n');
INSERT INTO postno VALUES (4156,'437-050','경기도','의왕시','월암동\r\n');
INSERT INTO postno VALUES (4157,'437-060','경기도','의왕시','초평동\r\n');
INSERT INTO postno VALUES (4158,'437-070','경기도','의왕시','오전동\r\n');
INSERT INTO postno VALUES (4159,'437-080','경기도','의왕시','내손동\r\n');
INSERT INTO postno VALUES (4160,'437-081','경기도','의왕시','내손1동\r\n');
INSERT INTO postno VALUES (4161,'437-082','경기도','의왕시','내손2동\r\n');
INSERT INTO postno VALUES (4162,'437-090','경기도','의왕시','학의동\r\n');
INSERT INTO postno VALUES (4163,'437-110','경기도','의왕시','청계동\r\n');
INSERT INTO postno VALUES (4164,'437-120','경기도','의왕시','포일동\r\n');
INSERT INTO postno VALUES (4165,'437-701','경기도','의왕시','고천동 의왕시청\r\n');
INSERT INTO postno VALUES (4166,'437-702','경기도','의왕시','청계동 서울구치소\r\n');
INSERT INTO postno VALUES (4167,'437-703','경기도','의왕시','포일동 농어촌진흥공사\r\n');
INSERT INTO postno VALUES (4168,'437-704','경기도','의왕시','고천동 서울소년원\r\n');
INSERT INTO postno VALUES (4169,'437-705','경기도','의왕시','월암동 교통공무원교육원\r\n');
INSERT INTO postno VALUES (4170,'437-711','경기도','의왕시','고천동 제일모직\r\n');
INSERT INTO postno VALUES (4171,'437-712','경기도','의왕시','계원예술조형전문대\r\n');
INSERT INTO postno VALUES (4172,'437-713','경기도','의왕시','내손2동 에너지연구원\r\n');
INSERT INTO postno VALUES (4173,'437-763','경기도','의왕시','월암동 철도전문대학\r\n');
INSERT INTO postno VALUES (4174,'440-040','경기도','수원시','장안구 신풍동\r\n');
INSERT INTO postno VALUES (4175,'440-050','경기도','수원시','장안구 영화동\r\n');
INSERT INTO postno VALUES (4176,'440-150','경기도','수원시','장안구 화서동\r\n');
INSERT INTO postno VALUES (4177,'440-151','경기도','수원시','장안구 화서1동\r\n');
INSERT INTO postno VALUES (4178,'440-152','경기도','수원시','장안구 화서2동\r\n');
INSERT INTO postno VALUES (4179,'440-180','경기도','수원시','장안구 북수동\r\n');
INSERT INTO postno VALUES (4180,'440-200','경기도','수원시','장안구 조원동\r\n');
INSERT INTO postno VALUES (4181,'440-210','경기도','수원시','장안구 송죽동\r\n');
INSERT INTO postno VALUES (4182,'440-240','경기도','수원시','장안구 연무동\r\n');
INSERT INTO postno VALUES (4183,'440-250','경기도','수원시','장안구 상광교동\r\n');
INSERT INTO postno VALUES (4184,'440-260','경기도','수원시','장안구 하광교동\r\n');
INSERT INTO postno VALUES (4185,'440-290','경기도','수원시','장안구 파장동\r\n');
INSERT INTO postno VALUES (4186,'440-300','경기도','수원시','장안구 정자동\r\n');
INSERT INTO postno VALUES (4187,'440-301','경기도','수원시','장안구 정자1동\r\n');
INSERT INTO postno VALUES (4188,'440-302','경기도','수원시','장안구 정자2동\r\n');
INSERT INTO postno VALUES (4189,'440-310','경기도','수원시','장안구 이목동\r\n');
INSERT INTO postno VALUES (4190,'440-320','경기도','수원시','장안구 율전동\r\n');
INSERT INTO postno VALUES (4191,'440-330','경기도','수원시','장안구 천천동\r\n');
INSERT INTO postno VALUES (4192,'440-420','경기도','수원시','장안구 장안동\r\n');
INSERT INTO postno VALUES (4193,'440-600','경기도','수원시','장안구 수원우체국사서함\r\n');
INSERT INTO postno VALUES (4194,'440-701','경기도','수원시','장안구 경기도경찰청\r\n');
INSERT INTO postno VALUES (4195,'440-702','경기도','수원시','장안구 경기도교육청\r\n');
INSERT INTO postno VALUES (4196,'440-703','경기도','수원시','장안구 경기일보사빌딩\r\n');
INSERT INTO postno VALUES (4197,'440-714','경기도','수원시','장안구 동남보건전문대\r\n');
INSERT INTO postno VALUES (4198,'440-745','경기도','수원시','장안구 선경합섬(주)\r\n');
INSERT INTO postno VALUES (4199,'440-746','경기도','수원시','장안구 성균관대자연과학캠\r\n');
INSERT INTO postno VALUES (4200,'440-747','경기도','수원시','장안구 파장동 세무대학교\r\n');
INSERT INTO postno VALUES (4201,'441-081','경기도','수원시','권선구 매산로1가\r\n');
INSERT INTO postno VALUES (4202,'441-082','경기도','수원시','권선구 매산로2가\r\n');
INSERT INTO postno VALUES (4203,'441-083','경기도','수원시','권선구 매산로3가\r\n');
INSERT INTO postno VALUES (4204,'441-090','경기도','수원시','권선구 고등동\r\n');
INSERT INTO postno VALUES (4205,'441-100','경기도','수원시','권선구 서둔동\r\n');
INSERT INTO postno VALUES (4206,'441-110','경기도','수원시','권선구 세류동\r\n');
INSERT INTO postno VALUES (4207,'441-111','경기도','수원시','권선구 세류1동\r\n');
INSERT INTO postno VALUES (4208,'441-112','경기도','수원시','권선구 세류2동\r\n');
INSERT INTO postno VALUES (4209,'441-113','경기도','수원시','권선구 세류3동\r\n');
INSERT INTO postno VALUES (4210,'441-130','경기도','수원시','권선구 교동\r\n');
INSERT INTO postno VALUES (4211,'441-220','경기도','수원시','권선구 매교동\r\n');
INSERT INTO postno VALUES (4212,'441-230','경기도','수원시','권선구 평동\r\n');
INSERT INTO postno VALUES (4213,'441-235','경기도','수원시','권선구 평리동\r\n');
INSERT INTO postno VALUES (4214,'441-340','경기도','수원시','권선구 구운동\r\n');
INSERT INTO postno VALUES (4215,'441-350','경기도','수원시','권선구 오목천동\r\n');
INSERT INTO postno VALUES (4216,'441-360','경기도','수원시','권선구 고색동\r\n');
INSERT INTO postno VALUES (4217,'441-390','경기도','수원시','권선구 권선동\r\n');
INSERT INTO postno VALUES (4218,'441-400','경기도','수원시','권선구 곡반정동\r\n');
INSERT INTO postno VALUES (4219,'441-410','경기도','수원시','권선구 대황교동\r\n');
INSERT INTO postno VALUES (4220,'441-430','경기도','수원시','권선구 장지동\r\n');
INSERT INTO postno VALUES (4221,'441-440','경기도','수원시','권선구 탑동\r\n');
INSERT INTO postno VALUES (4222,'441-450','경기도','수원시','권선구 호매실동\r\n');
INSERT INTO postno VALUES (4223,'441-460','경기도','수원시','권선구 금곡동\r\n');
INSERT INTO postno VALUES (4224,'441-470','경기도','수원시','권선구 입북동\r\n');
INSERT INTO postno VALUES (4225,'441-480','경기도','수원시','권선구 당수동\r\n');
INSERT INTO postno VALUES (4226,'441-701','경기도','수원시','권선구 경기도청\r\n');
INSERT INTO postno VALUES (4227,'441-707','경기도','수원시','권선구 농촌진흥청사\r\n');
INSERT INTO postno VALUES (4228,'441-744','경기도','수원시','권선구 서울대농업생명과\r\n');
INSERT INTO postno VALUES (4229,'441-748','경기도','수원시','권선구 수원간호전문대\r\n');
INSERT INTO postno VALUES (4230,'442-010','경기도','수원시','팔달구 영동\r\n');
INSERT INTO postno VALUES (4231,'442-021','경기도','수원시','팔달구 팔달로1가동\r\n');
INSERT INTO postno VALUES (4232,'442-022','경기도','수원시','팔달구 팔달로2가동\r\n');
INSERT INTO postno VALUES (4233,'442-023','경기도','수원시','팔달구 팔달로3가동\r\n');
INSERT INTO postno VALUES (4234,'442-030','경기도','수원시','팔달구 남창동\r\n');
INSERT INTO postno VALUES (4235,'442-060','경기도','수원시','팔달구 지동\r\n');
INSERT INTO postno VALUES (4236,'442-070','경기도','수원시','팔달구 인계동\r\n');
INSERT INTO postno VALUES (4237,'442-120','경기도','수원시','팔달구 중동\r\n');
INSERT INTO postno VALUES (4238,'442-140','경기도','수원시','팔달구 구천동\r\n');
INSERT INTO postno VALUES (4239,'442-160','경기도','수원시','팔달구 매향동\r\n');
INSERT INTO postno VALUES (4240,'442-170','경기도','수원시','팔달구 남수동\r\n');
INSERT INTO postno VALUES (4241,'442-190','경기도','수원시','팔달구 우만동\r\n');
INSERT INTO postno VALUES (4242,'442-191','경기도','수원시','팔달구 우만1동\r\n');
INSERT INTO postno VALUES (4243,'442-192','경기도','수원시','팔달구 우만2동\r\n');
INSERT INTO postno VALUES (4244,'442-270','경기도','수원시','팔달구 이의동\r\n');
INSERT INTO postno VALUES (4245,'442-280','경기도','수원시','팔달구 하동\r\n');
INSERT INTO postno VALUES (4246,'442-370','경기도','수원시','팔달구 매탄동\r\n');
INSERT INTO postno VALUES (4247,'442-371','경기도','수원시','팔달구 매탄1동\r\n');
INSERT INTO postno VALUES (4248,'442-372','경기도','수원시','팔달구 매탄2동\r\n');
INSERT INTO postno VALUES (4249,'442-373','경기도','수원시','팔달구 매탄3동\r\n');
INSERT INTO postno VALUES (4250,'442-374','경기도','수원시','팔달구 매탄4동\r\n');
INSERT INTO postno VALUES (4251,'442-380','경기도','수원시','팔달구 원천동\r\n');
INSERT INTO postno VALUES (4252,'442-390','경기도','수원시','팔달구 신동\r\n');
INSERT INTO postno VALUES (4253,'442-400','경기도','수원시','팔달구 망포동\r\n');
INSERT INTO postno VALUES (4254,'442-470','경기도','수원시','팔달구 영통동\r\n');
INSERT INTO postno VALUES (4255,'442-600','경기도','수원시','팔달구 동수원우체국사서함\r\n');
INSERT INTO postno VALUES (4256,'442-702','경기도','수원시','팔달구 인계동 경인일보사\r\n');
INSERT INTO postno VALUES (4257,'442-742','경기도','수원시','팔달구 매탄3동 삼성전자\r\n');
INSERT INTO postno VALUES (4258,'442-743','경기도','수원시','팔달구 매탄3동 삼성전기\r\n');
INSERT INTO postno VALUES (4259,'442-749','경기도','수원시','팔달구 원천동 아주대학교\r\n');
INSERT INTO postno VALUES (4260,'442-760','경기도','수원시','팔달구 이의동 경기대학교\r\n');
INSERT INTO postno VALUES (4261,'442-791','경기도','수원시','팔달구 원천동 합동신학교\r\n');
INSERT INTO postno VALUES (4262,'445-310','경기도','안산시','선감동\r\n');
INSERT INTO postno VALUES (4263,'445-320','경기도','안산시','동동\r\n');
INSERT INTO postno VALUES (4264,'445-330','경기도','안산시','북동\r\n');
INSERT INTO postno VALUES (4265,'445-340','경기도','안산시','남동\r\n');
INSERT INTO postno VALUES (4266,'445-711','경기도','화성군','기아자동차(주)아산만공장\r\n');
INSERT INTO postno VALUES (4267,'445-742','경기도','화성군','정남면 수원전문대학\r\n');
INSERT INTO postno VALUES (4268,'445-743','경기도','화성군','봉담면 수원대학교\r\n');
INSERT INTO postno VALUES (4269,'445-744','경기도','화성군','봉담면 수원카톨락대학\r\n');
INSERT INTO postno VALUES (4270,'445-756','경기도','화성군','봉담면 장안전문대학\r\n');
INSERT INTO postno VALUES (4271,'445-810','경기도','화성군','동탄면\r\n');
INSERT INTO postno VALUES (4272,'445-830','경기도','화성군','매송면\r\n');
INSERT INTO postno VALUES (4273,'445-840','경기도','화성군','비봉면\r\n');
INSERT INTO postno VALUES (4274,'445-850','경기도','화성군','남양면\r\n');
INSERT INTO postno VALUES (4275,'445-860','경기도','화성군','마도면\r\n');
INSERT INTO postno VALUES (4276,'445-870','경기도','화성군','송산면\r\n');
INSERT INTO postno VALUES (4277,'445-880','경기도','화성군','서신면\r\n');
INSERT INTO postno VALUES (4278,'445-890','경기도','화성군','봉담면\r\n');
INSERT INTO postno VALUES (4279,'445-910','경기도','화성군','팔탄면\r\n');
INSERT INTO postno VALUES (4280,'445-920','경기도','화성군','향남면\r\n');
INSERT INTO postno VALUES (4281,'445-930','경기도','화성군','양감면\r\n');
INSERT INTO postno VALUES (4282,'445-940','경기도','화성군','장안면\r\n');
INSERT INTO postno VALUES (4283,'445-950','경기도','화성군','우정면\r\n');
INSERT INTO postno VALUES (4284,'445-960','경기도','화성군','정남면\r\n');
INSERT INTO postno VALUES (4285,'445-970','경기도','화성군','태안읍\r\n');
INSERT INTO postno VALUES (4286,'447-010','경기도','오산시','오산동\r\n');
INSERT INTO postno VALUES (4287,'447-050','경기도','오산시','부산동\r\n');
INSERT INTO postno VALUES (4288,'447-060','경기도','오산시','원동\r\n');
INSERT INTO postno VALUES (4289,'447-130','경기도','오산시','청학동\r\n');
INSERT INTO postno VALUES (4290,'447-140','경기도','오산시','궐동\r\n');
INSERT INTO postno VALUES (4291,'447-150','경기도','오산시','가수동\r\n');
INSERT INTO postno VALUES (4292,'447-160','경기도','오산시','누읍동\r\n');
INSERT INTO postno VALUES (4293,'447-170','경기도','오산시','탑동\r\n');
INSERT INTO postno VALUES (4294,'447-180','경기도','오산시','두곡동\r\n');
INSERT INTO postno VALUES (4295,'447-190','경기도','오산시','벌음동\r\n');
INSERT INTO postno VALUES (4296,'447-200','경기도','오산시','서동\r\n');
INSERT INTO postno VALUES (4297,'447-210','경기도','오산시','가장동\r\n');
INSERT INTO postno VALUES (4298,'447-220','경기도','오산시','내삼미동\r\n');
INSERT INTO postno VALUES (4299,'447-230','경기도','오산시','외삼미동\r\n');
INSERT INTO postno VALUES (4300,'447-240','경기도','오산시','세교동\r\n');
INSERT INTO postno VALUES (4301,'447-250','경기도','오산시','지곳동\r\n');
INSERT INTO postno VALUES (4302,'447-260','경기도','오산시','서랑동\r\n');
INSERT INTO postno VALUES (4303,'447-270','경기도','오산시','양산동\r\n');
INSERT INTO postno VALUES (4304,'447-280','경기도','오산시','금안동\r\n');
INSERT INTO postno VALUES (4305,'447-290','경기도','오산시','수청동\r\n');
INSERT INTO postno VALUES (4306,'447-300','경기도','오산시','은계동\r\n');
INSERT INTO postno VALUES (4307,'447-310','경기도','오산시','갈곶동\r\n');
INSERT INTO postno VALUES (4308,'447-320','경기도','오산시','고현동\r\n');
INSERT INTO postno VALUES (4309,'447-320','경기도','오산시','청호동\r\n');
INSERT INTO postno VALUES (4310,'447-600','경기도','오산시','오산우체국사서함\r\n');
INSERT INTO postno VALUES (4311,'447-749','경기도','오산시','청학동 오산공업전문대학\r\n');
INSERT INTO postno VALUES (4312,'447-791','경기도','오산시','양산동 한신대학교\r\n');
INSERT INTO postno VALUES (4313,'449-010','경기도','용인시','고림동\r\n');
INSERT INTO postno VALUES (4314,'449-020','경기도','용인시','김량장동\r\n');
INSERT INTO postno VALUES (4315,'449-030','경기도','용인시','남동\r\n');
INSERT INTO postno VALUES (4316,'449-040','경기도','용인시','마평동\r\n');
INSERT INTO postno VALUES (4317,'449-050','경기도','용인시','운학동\r\n');
INSERT INTO postno VALUES (4318,'449-060','경기도','용인시','삼가동\r\n');
INSERT INTO postno VALUES (4319,'449-070','경기도','용인시','역복동\r\n');
INSERT INTO postno VALUES (4320,'449-080','경기도','용인시','유방동\r\n');
INSERT INTO postno VALUES (4321,'449-090','경기도','용인시','해곡동\r\n');
INSERT INTO postno VALUES (4322,'449-100','경기도','용인시','호동\r\n');
INSERT INTO postno VALUES (4323,'449-701','경기도','용인시','경희대학교수원컴퍼스\r\n');
INSERT INTO postno VALUES (4324,'449-702','경기도','용인시','기흥읍 강남대학교\r\n');
INSERT INTO postno VALUES (4325,'449-703','경기도','용인시','구성면 경찰대학\r\n');
INSERT INTO postno VALUES (4326,'449-704','경기도','용인시','김량장동 용인시청\r\n');
INSERT INTO postno VALUES (4327,'449-711','경기도','용인시','삼성전자(주)기흥공장\r\n');
INSERT INTO postno VALUES (4328,'449-712','경기도','용인시','기흥읍 삼성종합기술원\r\n');
INSERT INTO postno VALUES (4329,'449-713','경기도','용인시','구성면 한국전력기술(주)\r\n');
INSERT INTO postno VALUES (4330,'449-714','경기도','용인시','삼가동 용인대학교\r\n');
INSERT INTO postno VALUES (4331,'449-715','경기도','용인시','중앙개발(주)에버랜드\r\n');
INSERT INTO postno VALUES (4332,'449-728','경기도','용인시','남동 명지대학교용인컴퍼스\r\n');
INSERT INTO postno VALUES (4333,'449-791','경기도','용인시','외국어대용인컴퍼스\r\n');
INSERT INTO postno VALUES (4334,'449-810','경기도','용인시','포곡면\r\n');
INSERT INTO postno VALUES (4335,'449-820','경기도','용인시','양지면\r\n');
INSERT INTO postno VALUES (4336,'449-830','경기도','용인시','이동면\r\n');
INSERT INTO postno VALUES (4337,'449-840','경기도','용인시','수지읍\r\n');
INSERT INTO postno VALUES (4338,'449-850','경기도','용인시','모현면\r\n');
INSERT INTO postno VALUES (4339,'449-860','경기도','용인시','백암면\r\n');
INSERT INTO postno VALUES (4340,'449-870','경기도','용인시','원삼면\r\n');
INSERT INTO postno VALUES (4341,'449-880','경기도','용인시','남사면\r\n');
INSERT INTO postno VALUES (4342,'449-900','경기도','용인시','기흥읍\r\n');
INSERT INTO postno VALUES (4343,'449-910','경기도','용인시','구성면\r\n');
INSERT INTO postno VALUES (4344,'450-010','경기도','평택시','평택동\r\n');
INSERT INTO postno VALUES (4345,'450-020','경기도','평택시','합정동\r\n');
INSERT INTO postno VALUES (4346,'450-030','경기도','평택시','유천동\r\n');
INSERT INTO postno VALUES (4347,'450-040','경기도','평택시','통복동\r\n');
INSERT INTO postno VALUES (4348,'450-050','경기도','평택시','죽백동\r\n');
INSERT INTO postno VALUES (4349,'450-060','경기도','평택시','청룡동\r\n');
INSERT INTO postno VALUES (4350,'450-070','경기도','평택시','월곡동\r\n');
INSERT INTO postno VALUES (4351,'450-080','경기도','평택시','소사동\r\n');
INSERT INTO postno VALUES (4352,'450-090','경기도','평택시','지제동\r\n');
INSERT INTO postno VALUES (4353,'450-100','경기도','평택시','세교동\r\n');
INSERT INTO postno VALUES (4354,'450-110','경기도','평택시','신대동\r\n');
INSERT INTO postno VALUES (4355,'450-120','경기도','평택시','군문동\r\n');
INSERT INTO postno VALUES (4356,'450-130','경기도','평택시','용이동\r\n');
INSERT INTO postno VALUES (4357,'450-140','경기도','평택시','동삭동\r\n');
INSERT INTO postno VALUES (4358,'450-150','경기도','평택시','비전동\r\n');
INSERT INTO postno VALUES (4359,'450-151','경기도','평택시','비전1동\r\n');
INSERT INTO postno VALUES (4360,'450-152','경기도','평택시','비전2동\r\n');
INSERT INTO postno VALUES (4361,'450-600','경기도','평택시','평택우체국사서함\r\n');
INSERT INTO postno VALUES (4362,'450-701','경기도','평택시','용이동 평택대학교\r\n');
INSERT INTO postno VALUES (4363,'450-702','경기도','평택시','비전2동 평택시청\r\n');
INSERT INTO postno VALUES (4364,'450-703','경기도','평택시','비전1동 평택경찰서\r\n');
INSERT INTO postno VALUES (4365,'450-704','경기도','평택시','통복동 평택세무서\r\n');
INSERT INTO postno VALUES (4366,'451-712','경기도','평택시','서탄면 도투락(주)\r\n');
INSERT INTO postno VALUES (4367,'451-713','경기도','평택시','진위면 LG전자(주)\r\n');
INSERT INTO postno VALUES (4368,'451-800','경기도','평택시','팽성읍\r\n');
INSERT INTO postno VALUES (4369,'451-810','경기도','평택시','현덕면\r\n');
INSERT INTO postno VALUES (4370,'451-820','경기도','평택시','포승면\r\n');
INSERT INTO postno VALUES (4371,'451-830','경기도','평택시','청북면\r\n');
INSERT INTO postno VALUES (4372,'451-840','경기도','평택시','고덕면\r\n');
INSERT INTO postno VALUES (4373,'451-850','경기도','평택시','서탄면\r\n');
INSERT INTO postno VALUES (4374,'451-860','경기도','평택시','진위면\r\n');
INSERT INTO postno VALUES (4375,'451-870','경기도','평택시','오성면\r\n');
INSERT INTO postno VALUES (4376,'451-880','경기도','평택시','안중면\r\n');
INSERT INTO postno VALUES (4377,'456-749','경기도','안성군','안성읍 안성산업대학교\r\n');
INSERT INTO postno VALUES (4378,'456-756','경기도','안성군','중앙대학교제2컴퍼스\r\n');
INSERT INTO postno VALUES (4379,'456-800','경기도','안성군','안성읍\r\n');
INSERT INTO postno VALUES (4380,'456-810','경기도','안성군','원곡면\r\n');
INSERT INTO postno VALUES (4381,'456-820','경기도','안성군','공도면\r\n');
INSERT INTO postno VALUES (4382,'456-830','경기도','안성군','대덕면\r\n');
INSERT INTO postno VALUES (4383,'456-840','경기도','안성군','미양면\r\n');
INSERT INTO postno VALUES (4384,'456-850','경기도','안성군','서운면\r\n');
INSERT INTO postno VALUES (4385,'456-860','경기도','안성군','금광면\r\n');
INSERT INTO postno VALUES (4386,'456-870','경기도','안성군','보개면\r\n');
INSERT INTO postno VALUES (4387,'456-880','경기도','안성군','삼죽면\r\n');
INSERT INTO postno VALUES (4388,'456-890','경기도','안성군','죽산면\r\n');
INSERT INTO postno VALUES (4389,'456-910','경기도','안성군','일죽면\r\n');
INSERT INTO postno VALUES (4390,'456-920','경기도','안성군','고삼면\r\n');
INSERT INTO postno VALUES (4391,'456-930','경기도','안성군','양성면\r\n');
INSERT INTO postno VALUES (4392,'459-010','경기도','평택시','서정동\r\n');
INSERT INTO postno VALUES (4393,'459-020','경기도','평택시','장당동\r\n');
INSERT INTO postno VALUES (4394,'459-030','경기도','평택시','이충동\r\n');
INSERT INTO postno VALUES (4395,'459-040','경기도','평택시','모곡동\r\n');
INSERT INTO postno VALUES (4396,'459-050','경기도','평택시','칠괴동\r\n');
INSERT INTO postno VALUES (4397,'459-060','경기도','평택시','가재동\r\n');
INSERT INTO postno VALUES (4398,'459-070','경기도','평택시','장안동\r\n');
INSERT INTO postno VALUES (4399,'459-080','경기도','평택시','칠원동\r\n');
INSERT INTO postno VALUES (4400,'459-090','경기도','평택시','도일동\r\n');
INSERT INTO postno VALUES (4401,'459-100','경기도','평택시','독곡동\r\n');
INSERT INTO postno VALUES (4402,'459-110','경기도','평택시','지산동\r\n');
INSERT INTO postno VALUES (4403,'459-120','경기도','평택시','신장동\r\n');
INSERT INTO postno VALUES (4404,'459-121','경기도','평택시','신장1동\r\n');
INSERT INTO postno VALUES (4405,'459-122','경기도','평택시','신장2동\r\n');
INSERT INTO postno VALUES (4406,'459-600','경기도','평택시','송탄우체국사서함\r\n');
INSERT INTO postno VALUES (4407,'459-705','경기도','평택시','서정동 평택시송탄출장소\r\n');
INSERT INTO postno VALUES (4408,'459-711','경기도','평택시','모곡동 쌍용자동차(주)\r\n');
INSERT INTO postno VALUES (4409,'461-140','경기도','성남시','수정구 단대동\r\n');
INSERT INTO postno VALUES (4410,'461-160','경기도','성남시','수정구 신흥동\r\n');
INSERT INTO postno VALUES (4411,'461-161','경기도','성남시','수정구 신흥1동\r\n');
INSERT INTO postno VALUES (4412,'461-162','경기도','성남시','수정구 신흥2동\r\n');
INSERT INTO postno VALUES (4413,'461-163','경기도','성남시','수정구 신흥3동\r\n');
INSERT INTO postno VALUES (4414,'461-180','경기도','성남시','수정구 수진동\r\n');
INSERT INTO postno VALUES (4415,'461-181','경기도','성남시','수정구 수진1동\r\n');
INSERT INTO postno VALUES (4416,'461-182','경기도','성남시','수정구 수진2동\r\n');
INSERT INTO postno VALUES (4417,'461-190','경기도','성남시','수정구 태평동\r\n');
INSERT INTO postno VALUES (4418,'461-191','경기도','성남시','수정구 태평1동\r\n');
INSERT INTO postno VALUES (4419,'461-192','경기도','성남시','수정구 태평2동\r\n');
INSERT INTO postno VALUES (4420,'461-193','경기도','성남시','수정구 태평3동\r\n');
INSERT INTO postno VALUES (4421,'461-194','경기도','성남시','수정구 태평4동\r\n');
INSERT INTO postno VALUES (4422,'461-200','경기도','성남시','수정구 복정동\r\n');
INSERT INTO postno VALUES (4423,'461-210','경기도','성남시','수정구 창곡동\r\n');
INSERT INTO postno VALUES (4424,'461-250','경기도','성남시','수정구 양지동\r\n');
INSERT INTO postno VALUES (4425,'461-260','경기도','성남시','수정구 산성동\r\n');
INSERT INTO postno VALUES (4426,'461-300','경기도','성남시','수정구 고등동\r\n');
INSERT INTO postno VALUES (4427,'461-310','경기도','성남시','수정구 둔전동\r\n');
INSERT INTO postno VALUES (4428,'461-320','경기도','성남시','수정구 상적동\r\n');
INSERT INTO postno VALUES (4429,'461-330','경기도','성남시','수정구 신촌동\r\n');
INSERT INTO postno VALUES (4430,'461-340','경기도','성남시','수정구 오야동\r\n');
INSERT INTO postno VALUES (4431,'461-350','경기도','성남시','수정구 심곡동\r\n');
INSERT INTO postno VALUES (4432,'461-360','경기도','성남시','수정구 사송동\r\n');
INSERT INTO postno VALUES (4433,'461-370','경기도','성남시','수정구 시흥동\r\n');
INSERT INTO postno VALUES (4434,'461-380','경기도','성남시','수정구 금토동\r\n');
INSERT INTO postno VALUES (4435,'461-600','경기도','성남시','수정구 성남우체국사서함\r\n');
INSERT INTO postno VALUES (4436,'461-701','경기도','성남시','수정구 경원대학교\r\n');
INSERT INTO postno VALUES (4437,'461-702','경기도','성남시','수정구 경원전문대학\r\n');
INSERT INTO postno VALUES (4438,'461-711','경기도','성남시','수정구 성남기능대학\r\n');
INSERT INTO postno VALUES (4439,'461-714','경기도','성남시','수정구 대유공업전문대학\r\n');
INSERT INTO postno VALUES (4440,'462-080','경기도','성남시','중원구 도촌동\r\n');
INSERT INTO postno VALUES (4441,'462-090','경기도','성남시','중원구 갈현동\r\n');
INSERT INTO postno VALUES (4442,'462-100','경기도','성남시','중원구 여수동\r\n');
INSERT INTO postno VALUES (4443,'462-110','경기도','성남시','중원구 하대원동\r\n');
INSERT INTO postno VALUES (4444,'462-120','경기도','성남시','중원구 상대원동\r\n');
INSERT INTO postno VALUES (4445,'462-121','경기도','성남시','중원구 상대원1동\r\n');
INSERT INTO postno VALUES (4446,'462-122','경기도','성남시','중원구 상대원2동\r\n');
INSERT INTO postno VALUES (4447,'462-123','경기도','성남시','중원구 상대원3동\r\n');
INSERT INTO postno VALUES (4448,'462-130','경기도','성남시','중원구 성남동\r\n');
INSERT INTO postno VALUES (4449,'462-150','경기도','성남시','중원구 은행동\r\n');
INSERT INTO postno VALUES (4450,'462-151','경기도','성남시','중원구 은행1동\r\n');
INSERT INTO postno VALUES (4451,'462-152','경기도','성남시','중원구 은행2동\r\n');
INSERT INTO postno VALUES (4452,'462-170','경기도','성남시','중원구 중동\r\n');
INSERT INTO postno VALUES (4453,'462-180','경기도','성남시','수정구 수진동\r\n');
INSERT INTO postno VALUES (4454,'462-240','경기도','성남시','중원구 금광동\r\n');
INSERT INTO postno VALUES (4455,'462-241','경기도','성남시','중원구 금광1동\r\n');
INSERT INTO postno VALUES (4456,'462-242','경기도','성남시','중원구 금광2동\r\n');
INSERT INTO postno VALUES (4457,'462-715','경기도','성남시','중원구 동양정밀(주)빌딩\r\n');
INSERT INTO postno VALUES (4458,'462-743','경기도','성남시','중원구 신구전문대학\r\n');
INSERT INTO postno VALUES (4459,'463-010','경기도','성남시','분당구 정자동\r\n');
INSERT INTO postno VALUES (4460,'463-020','경기도','성남시','분당구 수내동\r\n');
INSERT INTO postno VALUES (4461,'463-025','경기도','성남시','분당구 초림동\r\n');
INSERT INTO postno VALUES (4462,'463-030','경기도','성남시','분당구 분당동\r\n');
INSERT INTO postno VALUES (4463,'463-040','경기도','성남시','분당구 율동\r\n');
INSERT INTO postno VALUES (4464,'463-050','경기도','성남시','분당구 서현동\r\n');
INSERT INTO postno VALUES (4465,'463-055','경기도','성남시','분당구 서당동\r\n');
INSERT INTO postno VALUES (4466,'463-060','경기도','성남시','분당구 이매동\r\n');
INSERT INTO postno VALUES (4467,'463-065','경기도','성남시','분당구 매송동\r\n');
INSERT INTO postno VALUES (4468,'463-070','경기도','성남시','분당구 야탑동\r\n');
INSERT INTO postno VALUES (4469,'463-071','경기도','성남시','분당구 상탑동\r\n');
INSERT INTO postno VALUES (4470,'463-073','경기도','성남시','분당구 중탑동\r\n');
INSERT INTO postno VALUES (4471,'463-075','경기도','성남시','분당구 하탑동\r\n');
INSERT INTO postno VALUES (4472,'463-080','경기도','성남시','분당구 내정동\r\n');
INSERT INTO postno VALUES (4473,'463-090','경기도','성남시','분당구 신기동\r\n');
INSERT INTO postno VALUES (4474,'463-100','경기도','성남시','분당구 장안동\r\n');
INSERT INTO postno VALUES (4475,'463-110','경기도','성남시','분당구 불정동\r\n');
INSERT INTO postno VALUES (4476,'463-400','경기도','성남시','분당구 삼평동\r\n');
INSERT INTO postno VALUES (4477,'463-410','경기도','성남시','분당구 판교동\r\n');
INSERT INTO postno VALUES (4478,'463-420','경기도','성남시','분당구 백현동\r\n');
INSERT INTO postno VALUES (4479,'463-430','경기도','성남시','분당구 하산운동\r\n');
INSERT INTO postno VALUES (4480,'463-440','경기도','성남시','분당구 운중동\r\n');
INSERT INTO postno VALUES (4481,'463-450','경기도','성남시','분당구 석운동\r\n');
INSERT INTO postno VALUES (4482,'463-460','경기도','성남시','분당구 대장동\r\n');
INSERT INTO postno VALUES (4483,'463-470','경기도','성남시','분당구 궁내동\r\n');
INSERT INTO postno VALUES (4484,'463-475','경기도','성남시','분당구 백궁동\r\n');
INSERT INTO postno VALUES (4485,'463-480','경기도','성남시','분당구 금곡동\r\n');
INSERT INTO postno VALUES (4486,'463-490','경기도','성남시','분당구 동원동\r\n');
INSERT INTO postno VALUES (4487,'463-500','경기도','성남시','분당구 구미동\r\n');
INSERT INTO postno VALUES (4488,'463-510','경기도','성남시','분당구 미금동\r\n');
INSERT INTO postno VALUES (4489,'463-530','경기도','성남시','분당구 오리동\r\n');
INSERT INTO postno VALUES (4490,'463-742','경기도','성남시','분당구 새마을운동중앙협의\r\n');
INSERT INTO postno VALUES (4491,'463-791','경기도','성남시','분당구 한국정신문화연구원\r\n');
INSERT INTO postno VALUES (4492,'464-711','경기도','광주군','실촌면 동원공업전문대학\r\n');
INSERT INTO postno VALUES (4493,'464-742','경기도','광주군','광주읍 서울장로회신학교\r\n');
INSERT INTO postno VALUES (4494,'464-800','경기도','광주군','광주읍\r\n');
INSERT INTO postno VALUES (4495,'464-810','경기도','광주군','중부면\r\n');
INSERT INTO postno VALUES (4496,'464-840','경기도','광주군','퇴촌면\r\n');
INSERT INTO postno VALUES (4497,'464-850','경기도','광주군','남종면\r\n');
INSERT INTO postno VALUES (4498,'464-860','경기도','광주군','초월면\r\n');
INSERT INTO postno VALUES (4499,'464-870','경기도','광주군','실촌면\r\n');
INSERT INTO postno VALUES (4500,'464-880','경기도','광주군','도척면\r\n');
INSERT INTO postno VALUES (4501,'464-890','경기도','광주군','오포면\r\n');
INSERT INTO postno VALUES (4502,'465-010','경기도','하남시','덕풍동\r\n');
INSERT INTO postno VALUES (4503,'465-011','경기도','하남시','덕풍1동\r\n');
INSERT INTO postno VALUES (4504,'465-012','경기도','하남시','덕풍2동\r\n');
INSERT INTO postno VALUES (4505,'465-013','경기도','하남시','덕풍3동\r\n');
INSERT INTO postno VALUES (4506,'465-030','경기도','하남시','신장동\r\n');
INSERT INTO postno VALUES (4507,'465-031','경기도','하남시','신장1동\r\n');
INSERT INTO postno VALUES (4508,'465-032','경기도','하남시','신장2동\r\n');
INSERT INTO postno VALUES (4509,'465-060','경기도','하남시','춘궁동\r\n');
INSERT INTO postno VALUES (4510,'465-070','경기도','하남시','항동\r\n');
INSERT INTO postno VALUES (4511,'465-080','경기도','하남시','상사창동\r\n');
INSERT INTO postno VALUES (4512,'465-090','경기도','하남시','하사창동\r\n');
INSERT INTO postno VALUES (4513,'465-100','경기도','하남시','교산동\r\n');
INSERT INTO postno VALUES (4514,'465-110','경기도','하남시','천현동\r\n');
INSERT INTO postno VALUES (4515,'465-120','경기도','하남시','창우동\r\n');
INSERT INTO postno VALUES (4516,'465-130','경기도','하남시','배알미동\r\n');
INSERT INTO postno VALUES (4517,'465-140','경기도','하남시','미사동\r\n');
INSERT INTO postno VALUES (4518,'465-150','경기도','하남시','망월동\r\n');
INSERT INTO postno VALUES (4519,'465-160','경기도','하남시','선동\r\n');
INSERT INTO postno VALUES (4520,'465-170','경기도','하남시','풍산동\r\n');
INSERT INTO postno VALUES (4521,'465-180','경기도','하남시','감북동\r\n');
INSERT INTO postno VALUES (4522,'465-190','경기도','하남시','감일동\r\n');
INSERT INTO postno VALUES (4523,'465-200','경기도','하남시','감이동\r\n');
INSERT INTO postno VALUES (4524,'465-210','경기도','하남시','초일동\r\n');
INSERT INTO postno VALUES (4525,'465-220','경기도','하남시','초이동\r\n');
INSERT INTO postno VALUES (4526,'465-230','경기도','하남시','광암동\r\n');
INSERT INTO postno VALUES (4527,'465-240','경기도','하남시','학암동\r\n');
INSERT INTO postno VALUES (4528,'465-250','경기도','하남시','하산곡동\r\n');
INSERT INTO postno VALUES (4529,'465-260','경기도','하남시','상산곡동\r\n');
INSERT INTO postno VALUES (4530,'465-701','경기도','하남시','신장2동 하남시청\r\n');
INSERT INTO postno VALUES (4531,'467-010','경기도','이천시','창전동\r\n');
INSERT INTO postno VALUES (4532,'467-020','경기도','이천시','관고동\r\n');
INSERT INTO postno VALUES (4533,'467-030','경기도','이천시','중리동\r\n');
INSERT INTO postno VALUES (4534,'467-040','경기도','이천시','송정동\r\n');
INSERT INTO postno VALUES (4535,'467-050','경기도','이천시','안흥동\r\n');
INSERT INTO postno VALUES (4536,'467-060','경기도','이천시','진리동\r\n');
INSERT INTO postno VALUES (4537,'467-070','경기도','이천시','갈산동\r\n');
INSERT INTO postno VALUES (4538,'467-080','경기도','이천시','사음동\r\n');
INSERT INTO postno VALUES (4539,'467-090','경기도','이천시','율현동\r\n');
INSERT INTO postno VALUES (4540,'467-100','경기도','이천시','증일동\r\n');
INSERT INTO postno VALUES (4541,'467-110','경기도','이천시','증포동\r\n');
INSERT INTO postno VALUES (4542,'467-120','경기도','이천시','단월동\r\n');
INSERT INTO postno VALUES (4543,'467-130','경기도','이천시','대포동\r\n');
INSERT INTO postno VALUES (4544,'467-140','경기도','이천시','고담동\r\n');
INSERT INTO postno VALUES (4545,'467-150','경기도','이천시','장록동\r\n');
INSERT INTO postno VALUES (4546,'467-600','경기도','이천시','이천우체국사서함\r\n');
INSERT INTO postno VALUES (4547,'467-701','경기도','이천시','부발읍 현대전자(주)\r\n');
INSERT INTO postno VALUES (4548,'467-810','경기도','이천시','마장면\r\n');
INSERT INTO postno VALUES (4549,'467-820','경기도','이천시','호법면\r\n');
INSERT INTO postno VALUES (4550,'467-830','경기도','이천시','백사면\r\n');
INSERT INTO postno VALUES (4551,'467-840','경기도','이천시','신둔면\r\n');
INSERT INTO postno VALUES (4552,'467-850','경기도','이천시','대월면\r\n');
INSERT INTO postno VALUES (4553,'467-860','경기도','이천시','부발읍\r\n');
INSERT INTO postno VALUES (4554,'467-870','경기도','이천시','모가면\r\n');
INSERT INTO postno VALUES (4555,'467-880','경기도','이천시','설성면\r\n');
INSERT INTO postno VALUES (4556,'467-890','경기도','이천시','율면\r\n');
INSERT INTO postno VALUES (4557,'467-900','경기도','이천시','장호원읍\r\n');
INSERT INTO postno VALUES (4558,'469-800','경기도','여주군','여주읍\r\n');
INSERT INTO postno VALUES (4559,'469-810','경기도','여주군','능서면\r\n');
INSERT INTO postno VALUES (4560,'469-815','경기도','여주군','능서면 백석리 섬마을\r\n');
INSERT INTO postno VALUES (4561,'469-820','경기도','여주군','홍천면\r\n');
INSERT INTO postno VALUES (4562,'469-830','경기도','여주군','금사면\r\n');
INSERT INTO postno VALUES (4563,'469-840','경기도','여주군','대신면\r\n');
INSERT INTO postno VALUES (4564,'469-850','경기도','여주군','북내면\r\n');
INSERT INTO postno VALUES (4565,'469-860','경기도','여주군','강천면\r\n');
INSERT INTO postno VALUES (4566,'469-870','경기도','여주군','점동면\r\n');
INSERT INTO postno VALUES (4567,'469-880','경기도','여주군','가남면\r\n');
INSERT INTO postno VALUES (4568,'469-890','경기도','여주군','삼북면\r\n');
INSERT INTO postno VALUES (4569,'471-010','경기도','구리시','인창동\r\n');
INSERT INTO postno VALUES (4570,'471-020','경기도','구리시','교문동\r\n');
INSERT INTO postno VALUES (4571,'471-021','경기도','구리시','교문1동\r\n');
INSERT INTO postno VALUES (4572,'471-022','경기도','구리시','교문2동\r\n');
INSERT INTO postno VALUES (4573,'471-030','경기도','구리시','수택동\r\n');
INSERT INTO postno VALUES (4574,'471-031','경기도','구리시','수택1동\r\n');
INSERT INTO postno VALUES (4575,'471-032','경기도','구리시','수택2동\r\n');
INSERT INTO postno VALUES (4576,'471-033','경기도','구리시','수택3동\r\n');
INSERT INTO postno VALUES (4577,'471-040','경기도','구리시','동구동\r\n');
INSERT INTO postno VALUES (4578,'471-050','경기도','구리시','사노동\r\n');
INSERT INTO postno VALUES (4579,'471-060','경기도','구리시','토평동\r\n');
INSERT INTO postno VALUES (4580,'471-070','경기도','구리시','아천동\r\n');
INSERT INTO postno VALUES (4581,'471-080','경기도','구리시','갈매동\r\n');
INSERT INTO postno VALUES (4582,'471-090','경기도','구리시','수평동\r\n');
INSERT INTO postno VALUES (4583,'471-600','경기도','구리시','구리우체국사서함\r\n');
INSERT INTO postno VALUES (4584,'471-701','경기도','구리시','한양대부속구리병원\r\n');
INSERT INTO postno VALUES (4585,'471-702','경기도','구리시','교문1동 구리시청\r\n');
INSERT INTO postno VALUES (4586,'471-703','경기도','구리시','교문2동 남양주세무서\r\n');
INSERT INTO postno VALUES (4587,'471-705','경기도','구리시','한국통신구리전화국\r\n');
INSERT INTO postno VALUES (4588,'471-711','경기도','구리시','수택2동 일화(주)\r\n');
INSERT INTO postno VALUES (4589,'472-010','경기도','남양주시','금곡동\r\n');
INSERT INTO postno VALUES (4590,'472-030','경기도','남양주시','일패동\r\n');
INSERT INTO postno VALUES (4591,'472-030','경기도','남양주시','양정동\r\n');
INSERT INTO postno VALUES (4592,'472-040','경기도','남양주시','이패동\r\n');
INSERT INTO postno VALUES (4593,'472-050','경기도','남양주시','삼패동\r\n');
INSERT INTO postno VALUES (4594,'472-060','경기도','남양주시','가운동\r\n');
INSERT INTO postno VALUES (4595,'472-070','경기도','남양주시','수석동\r\n');
INSERT INTO postno VALUES (4596,'472-080','경기도','남양주시','지금동\r\n');
INSERT INTO postno VALUES (4597,'472-100','경기도','남양주시','도농동\r\n');
INSERT INTO postno VALUES (4598,'472-120','경기도','남양주시','호평동\r\n');
INSERT INTO postno VALUES (4599,'472-140','경기도','남양주시','평내동\r\n');
INSERT INTO postno VALUES (4600,'472-701','경기도','남양주시','남양주시청제1청사\r\n');
INSERT INTO postno VALUES (4601,'472-702','경기도','남양주시','남양주시청제2청사\r\n');
INSERT INTO postno VALUES (4602,'472-703','경기도','남양주시','지금동 남양주경찰서\r\n');
INSERT INTO postno VALUES (4603,'472-704','경기도','남양주시','지금동 남양주등기소\r\n');
INSERT INTO postno VALUES (4604,'472-711','경기도','남양주시','도농동 (주)빙그레\r\n');
INSERT INTO postno VALUES (4605,'472-742','경기도','남양주시','삼육대병설전문대학\r\n');
INSERT INTO postno VALUES (4606,'472-810','경기도','남양주시','별내면\r\n');
INSERT INTO postno VALUES (4607,'472-820','경기도','남양주시','퇴계원면\r\n');
INSERT INTO postno VALUES (4608,'472-830','경기도','남양주시','진건면\r\n');
INSERT INTO postno VALUES (4609,'472-840','경기도','남양주시','화도읍\r\n');
INSERT INTO postno VALUES (4610,'472-850','경기도','남양주시','수동면\r\n');
INSERT INTO postno VALUES (4611,'472-860','경기도','남양주시','진접읍\r\n');
INSERT INTO postno VALUES (4612,'472-870','경기도','남양주시','조안면\r\n');
INSERT INTO postno VALUES (4613,'472-860','경기도','남양주시','오남면\r\n');
INSERT INTO postno VALUES (4614,'472-900','경기도','남양주시','와부읍\r\n');
INSERT INTO postno VALUES (4615,'476-751','경기도','양평군','옥천면 아세아연합신학대학\r\n');
INSERT INTO postno VALUES (4616,'476-800','경기도','양평군','양평읍\r\n');
INSERT INTO postno VALUES (4617,'476-810','경기도','양평군','서종면\r\n');
INSERT INTO postno VALUES (4618,'476-820','경기도','양평군','양서면\r\n');
INSERT INTO postno VALUES (4619,'476-830','경기도','양평군','옥천면\r\n');
INSERT INTO postno VALUES (4620,'476-840','경기도','양평군','용문면\r\n');
INSERT INTO postno VALUES (4621,'476-840','경기도','양평군','용문면\r\n');
INSERT INTO postno VALUES (4622,'476-850','경기도','양평군','단월면\r\n');
INSERT INTO postno VALUES (4623,'476-860','경기도','양평군','청운면\r\n');
INSERT INTO postno VALUES (4624,'476-870','경기도','양평군','지제면\r\n');
INSERT INTO postno VALUES (4625,'476-880','경기도','양평군','양동면\r\n');
INSERT INTO postno VALUES (4626,'476-890','경기도','양평군','개군면\r\n');
INSERT INTO postno VALUES (4627,'476-910','경기도','양평군','강상면\r\n');
INSERT INTO postno VALUES (4628,'476-920','경기도','양평군','강하면\r\n');
INSERT INTO postno VALUES (4629,'477-800','경기도','가평군','가평읍\r\n');
INSERT INTO postno VALUES (4630,'477-810','경기도','가평군','외서면\r\n');
INSERT INTO postno VALUES (4631,'477-820','경기도','가평군','상면\r\n');
INSERT INTO postno VALUES (4632,'477-830','경기도','가평군','하면\r\n');
INSERT INTO postno VALUES (4633,'477-840','경기도','가평군','북면\r\n');
INSERT INTO postno VALUES (4634,'477-850','경기도','가평군','설악면\r\n');
INSERT INTO postno VALUES (4635,'480-010','경기도','의정부시','의정부동\r\n');
INSERT INTO postno VALUES (4636,'480-011','경기도','의정부시','의정부1동\r\n');
INSERT INTO postno VALUES (4637,'480-012','경기도','의정부시','의정부2동\r\n');
INSERT INTO postno VALUES (4638,'480-013','경기도','의정부시','의정부3동\r\n');
INSERT INTO postno VALUES (4639,'480-014','경기도','의정부시','의정부4동\r\n');
INSERT INTO postno VALUES (4640,'480-020','경기도','의정부시','호원동\r\n');
INSERT INTO postno VALUES (4641,'480-030','경기도','의정부시','장암동\r\n');
INSERT INTO postno VALUES (4642,'480-040','경기도','의정부시','산곡동\r\n');
INSERT INTO postno VALUES (4643,'480-050','경기도','의정부시','용현동\r\n');
INSERT INTO postno VALUES (4644,'480-060','경기도','의정부시','고산동\r\n');
INSERT INTO postno VALUES (4645,'480-070','경기도','의정부시','신곡동\r\n');
INSERT INTO postno VALUES (4646,'480-071','경기도','의정부시','신곡1동\r\n');
INSERT INTO postno VALUES (4647,'480-072','경기동','의정부시','신곡2동\r\n');
INSERT INTO postno VALUES (4648,'480-080','경기도','의정부시','낙양동\r\n');
INSERT INTO postno VALUES (4649,'480-090','경기도','의정부시','민락동\r\n');
INSERT INTO postno VALUES (4650,'480-100','경기도','의정부시','가능동\r\n');
INSERT INTO postno VALUES (4651,'480-101','경기도','의정부시','가능1동\r\n');
INSERT INTO postno VALUES (4652,'480-102','경기도','의정부시','가능2동\r\n');
INSERT INTO postno VALUES (4653,'480-103','경기도','의정부시','가능3동\r\n');
INSERT INTO postno VALUES (4654,'480-110','경기도','의정부시','자일동\r\n');
INSERT INTO postno VALUES (4655,'480-120','경기도','의정부시','녹양동\r\n');
INSERT INTO postno VALUES (4656,'480-130','경기도','의정부시','금오동\r\n');
INSERT INTO postno VALUES (4657,'480-600','경기도','의정부시','의정부우체국사서함\r\n');
INSERT INTO postno VALUES (4658,'480-701','경기도','의정부시','호원동 신흥실업전문대학\r\n');
INSERT INTO postno VALUES (4659,'480-702','경기도','의정부시','가능3동 경민전문대학\r\n');
INSERT INTO postno VALUES (4660,'480-703','경기도','의정부시','의정부2동 의정부시청\r\n');
INSERT INTO postno VALUES (4661,'480-704','경기도','의정부시','의정부2동 의정부경찰서\r\n');
INSERT INTO postno VALUES (4662,'480-705','경기도','의정부시','의정부3동 의정부세무서\r\n');
INSERT INTO postno VALUES (4663,'480-706','경기도','의정부시','서울지방검찰청의정부지\r\n');
INSERT INTO postno VALUES (4664,'480-707','경기도','의정부시','서울지방법원의정부지원\r\n');
INSERT INTO postno VALUES (4665,'480-708','경기도','의정부시','금오동 의정부면허시험장\r\n');
INSERT INTO postno VALUES (4666,'480-709','경기도','의정부시','의정부4동 양주군청\r\n');
INSERT INTO postno VALUES (4667,'482-810','경기도','양주군','장흥면\r\n');
INSERT INTO postno VALUES (4668,'482-820','경기도','양주군','주내면\r\n');
INSERT INTO postno VALUES (4669,'482-830','경기도','양주군','백석면\r\n');
INSERT INTO postno VALUES (4670,'482-840','경기도','양주군','광적면\r\n');
INSERT INTO postno VALUES (4671,'482-850','경기도','양주군','회천읍\r\n');
INSERT INTO postno VALUES (4672,'482-860','경기도','양주군','은현면\r\n');
INSERT INTO postno VALUES (4673,'482-870','경기도','양주군','남면\r\n');
INSERT INTO postno VALUES (4674,'483-010','경기도','동두천시','송내동\r\n');
INSERT INTO postno VALUES (4675,'483-020','경기도','동두천시','지행동\r\n');
INSERT INTO postno VALUES (4676,'483-030','경기도','동두천시','생연동\r\n');
INSERT INTO postno VALUES (4677,'483-031','경기도','동두천시','생연1동\r\n');
INSERT INTO postno VALUES (4678,'483-032','경기도','동두천시','생연2동\r\n');
INSERT INTO postno VALUES (4679,'483-033','경기도','동두천시','생연3동\r\n');
INSERT INTO postno VALUES (4680,'483-034','경기도','동두천시','생연4동\r\n');
INSERT INTO postno VALUES (4681,'483-040','경기도','동두천시','광암동\r\n');
INSERT INTO postno VALUES (4682,'483-050','경기도','동두천시','탑동\r\n');
INSERT INTO postno VALUES (4683,'483-060','경기도','동두천시','보산동\r\n');
INSERT INTO postno VALUES (4684,'483-070','경기도','동두천시','걸산동\r\n');
INSERT INTO postno VALUES (4685,'483-080','경기도','동두천시','동두천동\r\n');
INSERT INTO postno VALUES (4686,'483-090','경기도','동두천시','안홍동\r\n');
INSERT INTO postno VALUES (4687,'483-100','경기도','동두천시','상봉암동\r\n');
INSERT INTO postno VALUES (4688,'483-110','경기도','동두천시','하봉암동\r\n');
INSERT INTO postno VALUES (4689,'483-120','경기도','동두천시','상패동\r\n');
INSERT INTO postno VALUES (4690,'483-600','경기도','동두천시','동두천우체국사서함\r\n');
INSERT INTO postno VALUES (4691,'486-800','경기도','연천군','연천읍\r\n');
INSERT INTO postno VALUES (4692,'486-810','경기도','연천군','중면\r\n');
INSERT INTO postno VALUES (4693,'486-820','경기도','연천군','군남면\r\n');
INSERT INTO postno VALUES (4694,'486-830','경기도','연천군','신서면\r\n');
INSERT INTO postno VALUES (4695,'486-850','경기도','연천군','청산면\r\n');
INSERT INTO postno VALUES (4696,'486-860','경기도','연천군','미산면\r\n');
INSERT INTO postno VALUES (4697,'486-870','경기도','연천군','왕징면\r\n');
INSERT INTO postno VALUES (4698,'486-880','경기도','연천군','백학면\r\n');
INSERT INTO postno VALUES (4699,'486-890','경기도','연천군','장남면\r\n');
INSERT INTO postno VALUES (4700,'486-900','경기도','연천군','전곡읍\r\n');
INSERT INTO postno VALUES (4701,'487-701','경기도','포천군','포천읍 포천군청\r\n');
INSERT INTO postno VALUES (4702,'487-711','경기도','포천군','포천읍 대진대학교\r\n');
INSERT INTO postno VALUES (4703,'487-800','경기도','포천군','포천읍\r\n');
INSERT INTO postno VALUES (4704,'487-810','경기도','포천군','가산면\r\n');
INSERT INTO postno VALUES (4705,'487-820','경기도','포천군','소흘읍\r\n');
INSERT INTO postno VALUES (4706,'487-830','경기도','포천군','내촌면\r\n');
INSERT INTO postno VALUES (4707,'487-840','경기도','포천군','화현면\r\n');
INSERT INTO postno VALUES (4708,'487-850','경기도','포천군','일동면\r\n');
INSERT INTO postno VALUES (4709,'487-860','경기도','포천군','이동면\r\n');
INSERT INTO postno VALUES (4710,'487-870','경기도','포천군','군내면\r\n');
INSERT INTO postno VALUES (4711,'487-880','경기도','포천군','영중면\r\n');
INSERT INTO postno VALUES (4712,'487-890','경기도','포천군','영북면\r\n');
INSERT INTO postno VALUES (4713,'487-910','경기도','포천군','신북면\r\n');
INSERT INTO postno VALUES (4714,'487-915','경기도','포천군','신북면 기채리\r\n');
INSERT INTO postno VALUES (4715,'487-915','경기도','포천군','신북면 기지리\r\n');
INSERT INTO postno VALUES (4716,'487-915','경기도','포천군','신북면 만세교리\r\n');
INSERT INTO postno VALUES (4717,'487-915','경기도','포천군','신북면 신평리\r\n');
INSERT INTO postno VALUES (4718,'487-920','경기도','포천군','창수면\r\n');
INSERT INTO postno VALUES (4719,'487-930','경기도','포천군','관인면\r\n');
INSERT INTO postno VALUES (4720,'500-010','광주시','북구','임동\r\n');
INSERT INTO postno VALUES (4721,'500-020','광주시','북구','유동\r\n');
INSERT INTO postno VALUES (4722,'500-030','광주시','북구','누문동\r\n');
INSERT INTO postno VALUES (4723,'500-040','광주시','북구','중흥동\r\n');
INSERT INTO postno VALUES (4724,'500-041','광주시','북구','중흥1동\r\n');
INSERT INTO postno VALUES (4725,'500-042','광주시','북구','중흥2동\r\n');
INSERT INTO postno VALUES (4726,'500-043','광주시','북구','중흥3동\r\n');
INSERT INTO postno VALUES (4727,'500-050','광주시','북구','북동\r\n');
INSERT INTO postno VALUES (4728,'500-060','광주시','북구','신안동\r\n');
INSERT INTO postno VALUES (4729,'500-070','광주시','북구','용봉동\r\n');
INSERT INTO postno VALUES (4730,'500-080','광주시','북구','우산동\r\n');
INSERT INTO postno VALUES (4731,'500-090','광주시','북구','풍향동\r\n');
INSERT INTO postno VALUES (4732,'500-091','광주시','북구','풍향1동\r\n');
INSERT INTO postno VALUES (4733,'500-092','광주시','북구','풍향2동\r\n');
INSERT INTO postno VALUES (4734,'500-100','광주시','북구','두암동\r\n');
INSERT INTO postno VALUES (4735,'500-101','광주시','북구','두암1동\r\n');
INSERT INTO postno VALUES (4736,'500-102','광주시','북구','두암2동\r\n');
INSERT INTO postno VALUES (4737,'500-103','광주시','북구','두암3동\r\n');
INSERT INTO postno VALUES (4738,'500-110','광주시','북구','문흥동\r\n');
INSERT INTO postno VALUES (4739,'500-112','광주시','북구','문흥1동\r\n');
INSERT INTO postno VALUES (4740,'500-113','광주시','북구','문흥2동\r\n');
INSERT INTO postno VALUES (4741,'500-111','광주시','북구','문화동\r\n');
INSERT INTO postno VALUES (4742,'500-120','광주시','북구','각화동\r\n');
INSERT INTO postno VALUES (4743,'500-130','광주시','북구','오치동\r\n');
INSERT INTO postno VALUES (4744,'500-140','광주시','북구','삼각동\r\n');
INSERT INTO postno VALUES (4745,'500-150','광주시','북구','매곡동\r\n');
INSERT INTO postno VALUES (4746,'500-160','광주시','북구','일곡동\r\n');
INSERT INTO postno VALUES (4747,'500-170','광주시','북구','운암동\r\n');
INSERT INTO postno VALUES (4748,'500-171','광주시','북구','운암1동\r\n');
INSERT INTO postno VALUES (4749,'500-172','광주시','북구','운암2동\r\n');
INSERT INTO postno VALUES (4750,'500-173','광주시','북구','운암3동\r\n');
INSERT INTO postno VALUES (4751,'500-180','광주시','북구','동림동\r\n');
INSERT INTO postno VALUES (4752,'500-190','광주시','북구','연제동\r\n');
INSERT INTO postno VALUES (4753,'500-200','광주시','북구','양산동\r\n');
INSERT INTO postno VALUES (4754,'500-210','광주시','북구','본촌동\r\n');
INSERT INTO postno VALUES (4755,'500-220','광주시','북구','용두동\r\n');
INSERT INTO postno VALUES (4756,'500-230','광주시','북구','용전동\r\n');
INSERT INTO postno VALUES (4757,'500-240','광주시','북구','생용동\r\n');
INSERT INTO postno VALUES (4758,'500-250','광주시','북구','신용동\r\n');
INSERT INTO postno VALUES (4759,'500-260','광주시','북구','지야동\r\n');
INSERT INTO postno VALUES (4760,'500-270','광주시','북구','수곡동\r\n');
INSERT INTO postno VALUES (4761,'500-280','광주시','북구','효령동\r\n');
INSERT INTO postno VALUES (4762,'500-290','광주시','북구','태령동\r\n');
INSERT INTO postno VALUES (4763,'500-300','광주시','북구','용강동\r\n');
INSERT INTO postno VALUES (4764,'500-400','광주시','북구','금곡동\r\n');
INSERT INTO postno VALUES (4765,'500-410','광주시','북구','충효동\r\n');
INSERT INTO postno VALUES (4766,'500-420','광주시','북구','덕의동\r\n');
INSERT INTO postno VALUES (4767,'500-460','광주시','북구','월출동\r\n');
INSERT INTO postno VALUES (4768,'500-470','광주시','북구','대촌동\r\n');
INSERT INTO postno VALUES (4769,'500-480','광주시','북구','오룡동\r\n');
INSERT INTO postno VALUES (4770,'500-500','광주시','북구','망월동\r\n');
INSERT INTO postno VALUES (4771,'500-510','광주시','북구','장등동\r\n');
INSERT INTO postno VALUES (4772,'500-520','광주시','북구','운정동\r\n');
INSERT INTO postno VALUES (4773,'500-530','광주시','북구','청풍동\r\n');
INSERT INTO postno VALUES (4774,'500-540','광주시','북구','화암동\r\n');
INSERT INTO postno VALUES (4775,'500-600','광주시','북구','북광주우체국사서함\r\n');
INSERT INTO postno VALUES (4776,'500-702','광주시','북구','유동 광주YWCA건물\r\n');
INSERT INTO postno VALUES (4777,'500-703','광주시','북구','풍향2동 광주교육대학교\r\n');
INSERT INTO postno VALUES (4778,'500-704','광주시','북구','문흥동 광주교도소\r\n');
INSERT INTO postno VALUES (4779,'500-705','광주시','북구','운암2동 북광주세무서\r\n');
INSERT INTO postno VALUES (4780,'500-711','광주시','북구','오치동 한국전력공사전남지사\r\n');
INSERT INTO postno VALUES (4781,'500-714','광주시','북구','두암1동 동신전문대학\r\n');
INSERT INTO postno VALUES (4782,'500-742','광주시','북구','운암1동 서강전문대학\r\n');
INSERT INTO postno VALUES (4783,'500-756','광주시','북구','매곡동 전남교육위원회건물\r\n');
INSERT INTO postno VALUES (4784,'500-757','광주시','북구','용봉동 전남대학교\r\n');
INSERT INTO postno VALUES (4785,'500-758','광주시','북구','중흥1동 전남일보사옥건물\r\n');
INSERT INTO postno VALUES (4786,'501-011','광주시','동구','충장로1가\r\n');
INSERT INTO postno VALUES (4787,'501-012','광주시','동구','충장로2가\r\n');
INSERT INTO postno VALUES (4788,'501-013','광주시','동구','충장로3가\r\n');
INSERT INTO postno VALUES (4789,'501-014','광주시','동구','충장로4가\r\n');
INSERT INTO postno VALUES (4790,'501-015','광주시','동구','충장로5가\r\n');
INSERT INTO postno VALUES (4791,'501-021','광주시','동구','금남로1가\r\n');
INSERT INTO postno VALUES (4792,'501-022','광주시','동구','금남로2가\r\n');
INSERT INTO postno VALUES (4793,'501-023','광주시','동구','금남로3가\r\n');
INSERT INTO postno VALUES (4794,'501-024','광주시','동구','금남로4가\r\n');
INSERT INTO postno VALUES (4795,'501-025','광주시','동구','금남로5가\r\n');
INSERT INTO postno VALUES (4796,'501-030','광주시','동구','대인동\r\n');
INSERT INTO postno VALUES (4797,'501-040','광주시','동구','궁동\r\n');
INSERT INTO postno VALUES (4798,'501-050','광주시','동구','대의동\r\n');
INSERT INTO postno VALUES (4799,'501-060','광주시','동구','장동\r\n');
INSERT INTO postno VALUES (4800,'501-070','광주시','동구','동명동\r\n');
INSERT INTO postno VALUES (4801,'501-071','광주시','동구','동명1동\r\n');
INSERT INTO postno VALUES (4802,'501-072','광주시','동구','동명2동\r\n');
INSERT INTO postno VALUES (4803,'501-080','광주시','동구','계림동\r\n');
INSERT INTO postno VALUES (4804,'501-081','광주시','동구','계림1동\r\n');
INSERT INTO postno VALUES (4805,'501-082','광주시','동구','계림2동\r\n');
INSERT INTO postno VALUES (4806,'501-083','광주시','동구','계림3동\r\n');
INSERT INTO postno VALUES (4807,'501-090','광주시','동구','산수동\r\n');
INSERT INTO postno VALUES (4808,'501-091','광주시','동구','산수1동\r\n');
INSERT INTO postno VALUES (4809,'501-092','광주시','동구','산수2동\r\n');
INSERT INTO postno VALUES (4810,'501-093','광주시','동구','산수3동\r\n');
INSERT INTO postno VALUES (4811,'501-100','광주시','동구','수기동\r\n');
INSERT INTO postno VALUES (4812,'501-110','광주시','동구','황금동\r\n');
INSERT INTO postno VALUES (4813,'501-120','광주시','동구','호남동\r\n');
INSERT INTO postno VALUES (4814,'501-130','광주시','동구','불로동\r\n');
INSERT INTO postno VALUES (4815,'501-140','광주시','동구','서석동\r\n');
INSERT INTO postno VALUES (4816,'501-150','광주시','동구','지산동\r\n');
INSERT INTO postno VALUES (4817,'501-151','광주시','동구','지산1동\r\n');
INSERT INTO postno VALUES (4818,'501-152','광주시','동구','지산2동\r\n');
INSERT INTO postno VALUES (4819,'501-160','광주시','동구','남동\r\n');
INSERT INTO postno VALUES (4820,'501-170','광주시','동구','금동\r\n');
INSERT INTO postno VALUES (4821,'501-180','광주시','동구','광산동\r\n');
INSERT INTO postno VALUES (4822,'501-190','광주시','동구','학동\r\n');
INSERT INTO postno VALUES (4823,'501-191','광주시','동구','학1동\r\n');
INSERT INTO postno VALUES (4824,'501-192','광주시','동구','학2동\r\n');
INSERT INTO postno VALUES (4825,'501-193','광주시','동구','학3동\r\n');
INSERT INTO postno VALUES (4826,'501-200','광주시','동구','운림동\r\n');
INSERT INTO postno VALUES (4827,'501-210','광주시','동구','용산동\r\n');
INSERT INTO postno VALUES (4828,'501-220','광주시','동구','소태동\r\n');
INSERT INTO postno VALUES (4829,'501-230','광주시','동구','용연동\r\n');
INSERT INTO postno VALUES (4830,'501-240','광주시','동구','월남동\r\n');
INSERT INTO postno VALUES (4831,'501-250','광주시','동구','선교동\r\n');
INSERT INTO postno VALUES (4832,'501-260','광주시','동구','내남동\r\n');
INSERT INTO postno VALUES (4833,'501-600','광주시','동구','광주우체국사서함\r\n');
INSERT INTO postno VALUES (4834,'501-701','광주시','동구','계림1동 광주광역시청\r\n');
INSERT INTO postno VALUES (4835,'501-702','광주시','동구','광산동 전라남도도청\r\n');
INSERT INTO postno VALUES (4836,'501-703','광주시','동구','지산2동 광주법원청사\r\n');
INSERT INTO postno VALUES (4837,'501-704','광주시','동구','서석동 동구청\r\n');
INSERT INTO postno VALUES (4838,'501-705','광주시','동구','농협중앙회광주전남지역본부\r\n');
INSERT INTO postno VALUES (4839,'501-706','광주시','동구','금남로5가 삼성생명빌딩\r\n');
INSERT INTO postno VALUES (4840,'501-711','광주시','동구','금남로2가 무등빌딩\r\n');
INSERT INTO postno VALUES (4841,'501-712','광주시','동구','금남로2가 카톨릭센타\r\n');
INSERT INTO postno VALUES (4842,'501-713','광주시','동구','금남로5가 남선빌딩\r\n');
INSERT INTO postno VALUES (4843,'501-714','광주시','동구','대인동 대한생명빌딩\r\n');
INSERT INTO postno VALUES (4844,'501-715','광주시','동구','대인동 반도빌딩\r\n');
INSERT INTO postno VALUES (4845,'501-716','광주시','동구','충장로4가 화니백화점\r\n');
INSERT INTO postno VALUES (4846,'501-757','광주시','동구','학1동 전남대학교병원\r\n');
INSERT INTO postno VALUES (4847,'501-758','광주시','동구','금남로1가 전일빌딩\r\n');
INSERT INTO postno VALUES (4848,'501-758','광주시','동구','금남로1가 광주일보사\r\n');
INSERT INTO postno VALUES (4849,'501-759','광주시','동구','서석동 조선대학교\r\n');
INSERT INTO postno VALUES (4850,'502-150','광주시','서구','세하동\r\n');
INSERT INTO postno VALUES (4851,'502-151','광주시','서구','서창동\r\n');
INSERT INTO postno VALUES (4852,'502-152','광주시','서구','벽진동\r\n');
INSERT INTO postno VALUES (4853,'502-153','광주시','서구','매월동\r\n');
INSERT INTO postno VALUES (4854,'502-154','광주시','서구','금호동\r\n');
INSERT INTO postno VALUES (4855,'502-155','광주시','서구','용두동\r\n');
INSERT INTO postno VALUES (4856,'502-156','광주시','서구','풍암동\r\n');
INSERT INTO postno VALUES (4857,'502-157','광주시','서구','마륵동\r\n');
INSERT INTO postno VALUES (4858,'502-200','광주시','서구','농성동\r\n');
INSERT INTO postno VALUES (4859,'502-201','광주시','서구','농성1동\r\n');
INSERT INTO postno VALUES (4860,'502-202','광주시','서구','농성2동\r\n');
INSERT INTO postno VALUES (4861,'502-210','광주시','서구','광천동\r\n');
INSERT INTO postno VALUES (4862,'502-220','광주시','서구','양동\r\n');
INSERT INTO postno VALUES (4863,'502-221','광주시','서구','양1동\r\n');
INSERT INTO postno VALUES (4864,'502-222','광주시','서구','양2동\r\n');
INSERT INTO postno VALUES (4865,'502-223','광주시','서구','양3동\r\n');
INSERT INTO postno VALUES (4866,'502-230','광주시','서구','상무동\r\n');
INSERT INTO postno VALUES (4867,'502-231','광주시','서구','상무1동\r\n');
INSERT INTO postno VALUES (4868,'502-232','광주시','서구','상무2동\r\n');
INSERT INTO postno VALUES (4869,'502-233','광주시','서구','상무3동\r\n');
INSERT INTO postno VALUES (4870,'502-240','광주시','서구','화정동\r\n');
INSERT INTO postno VALUES (4871,'502-241','광주시','서구','화정1동\r\n');
INSERT INTO postno VALUES (4872,'502-242','광주시','서구','화정2동\r\n');
INSERT INTO postno VALUES (4873,'502-243','광주시','서구','화정3동\r\n');
INSERT INTO postno VALUES (4874,'502-244','광주시','서구','화정4동\r\n');
INSERT INTO postno VALUES (4875,'502-250','광주시','서구','내방동\r\n');
INSERT INTO postno VALUES (4876,'502-260','광주시','서구','쌍촌동\r\n');
INSERT INTO postno VALUES (4877,'502-270','광주시','서구','치평동\r\n');
INSERT INTO postno VALUES (4878,'502-280','광주시','서구','유촌동\r\n');
INSERT INTO postno VALUES (4879,'502-290','광주시','서구','덕흥동\r\n');
INSERT INTO postno VALUES (4880,'502-600','광주시','서구','서광주우체국사서함\r\n');
INSERT INTO postno VALUES (4881,'502-702','광주시','서구','쌍촌동 광주카톨릭대학교\r\n');
INSERT INTO postno VALUES (4882,'502-704','광주시','서구','광주광역시교육위원회건물\r\n');
INSERT INTO postno VALUES (4883,'502-711','광주시','서구','내방동 아세아자동차(주)\r\n');
INSERT INTO postno VALUES (4884,'502-742','광주시','서구','광천동 송원전문대\r\n');
INSERT INTO postno VALUES (4885,'502-791','광주시','서구','쌍촌동 호남대학교건물\r\n');
INSERT INTO postno VALUES (4886,'503-010','광주시','남구','서동\r\n');
INSERT INTO postno VALUES (4887,'503-011','광주시','남구','서1동\r\n');
INSERT INTO postno VALUES (4888,'503-012','광주시','남구','서2동\r\n');
INSERT INTO postno VALUES (4889,'503-020','광주시','남구','구동\r\n');
INSERT INTO postno VALUES (4890,'503-030','광주시','남구','사동\r\n');
INSERT INTO postno VALUES (4891,'503-040','광주시','남구','양림동\r\n');
INSERT INTO postno VALUES (4892,'503-050','광주시','남구','방림동\r\n');
INSERT INTO postno VALUES (4893,'503-051','광주시','남구','방림1동\r\n');
INSERT INTO postno VALUES (4894,'503-052','광주시','남구','방림2동\r\n');
INSERT INTO postno VALUES (4895,'503-060','광주시','남구','봉선동\r\n');
INSERT INTO postno VALUES (4896,'503-061','광주시','남구','봉선1동\r\n');
INSERT INTO postno VALUES (4897,'503-062','광주시','남구','봉선2동\r\n');
INSERT INTO postno VALUES (4898,'503-200','광주시','남구','지석동\r\n');
INSERT INTO postno VALUES (4899,'503-201','광주시','남구','도금동\r\n');
INSERT INTO postno VALUES (4900,'503-202','광주시','남구','원산동\r\n');
INSERT INTO postno VALUES (4901,'503-203','광주시','남구','칠석동\r\n');
INSERT INTO postno VALUES (4902,'503-204','광주시','남구','대지동\r\n');
INSERT INTO postno VALUES (4903,'503-205','광주시','남구','압촌동\r\n');
INSERT INTO postno VALUES (4904,'503-206','광주시','남구','이장동\r\n');
INSERT INTO postno VALUES (4905,'503-207','광주시','남구','석정동\r\n');
INSERT INTO postno VALUES (4906,'503-208','광주시','남구','월성동\r\n');
INSERT INTO postno VALUES (4907,'503-209','광주시','남구','화장동\r\n');
INSERT INTO postno VALUES (4908,'503-210','광주시','남구','양촌동\r\n');
INSERT INTO postno VALUES (4909,'503-211','광주시','남구','신장동\r\n');
INSERT INTO postno VALUES (4910,'503-212','광주시','남구','구소동\r\n');
INSERT INTO postno VALUES (4911,'503-213','광주시','남구','승촌동\r\n');
INSERT INTO postno VALUES (4912,'503-214','광주시','남구','양과동\r\n');
INSERT INTO postno VALUES (4913,'503-230','광주시','남구','월산동\r\n');
INSERT INTO postno VALUES (4914,'503-231','광주시','남구','월산1동\r\n');
INSERT INTO postno VALUES (4915,'503-232','광주시','남구','월산2동\r\n');
INSERT INTO postno VALUES (4916,'503-233','광주시','남구','월산3동\r\n');
INSERT INTO postno VALUES (4917,'503-234','광주시','남구','월산4동\r\n');
INSERT INTO postno VALUES (4918,'503-235','광주시','남구','월산5동\r\n');
INSERT INTO postno VALUES (4919,'503-300','광주시','남구','백운동\r\n');
INSERT INTO postno VALUES (4920,'503-301','광주시','남구','백운1동\r\n');
INSERT INTO postno VALUES (4921,'503-302','광주시','남구','백운2동\r\n');
INSERT INTO postno VALUES (4922,'503-310','광주시','남구','주월동\r\n');
INSERT INTO postno VALUES (4923,'503-311','광주시','남구','주월1동\r\n');
INSERT INTO postno VALUES (4924,'503-312','광주시','남구','주월2동\r\n');
INSERT INTO postno VALUES (4925,'503-320','광주시','남구','노대동\r\n');
INSERT INTO postno VALUES (4926,'503-330','광주시','남구','진월동\r\n');
INSERT INTO postno VALUES (4927,'503-340','광주시','남구','덕남동\r\n');
INSERT INTO postno VALUES (4928,'503-350','광주시','남구','행암동\r\n');
INSERT INTO postno VALUES (4929,'503-360','광주시','남구','임암동\r\n');
INSERT INTO postno VALUES (4930,'503-370','광주시','남구','송하동\r\n');
INSERT INTO postno VALUES (4931,'503-701','광주시','남구','봉선동2동 남구청\r\n');
INSERT INTO postno VALUES (4932,'503-702','광주시','남구','양림동 기독간호전문대학\r\n');
INSERT INTO postno VALUES (4933,'503-703','광주시','남구','진월동 광주대학교\r\n');
INSERT INTO postno VALUES (4934,'503-728','광주시','남구','월산3동 광주문화방송건물\r\n');
INSERT INTO postno VALUES (4935,'503-756','광주시','서구','양림동 호남신학대학교\r\n');
INSERT INTO postno VALUES (4936,'503-777','광주시','남구','서2동 무등일보사\r\n');
INSERT INTO postno VALUES (4937,'503-790','광주시','남구','사동 KBS광주방송총국\r\n');
INSERT INTO postno VALUES (4938,'506-010','광주시','광산구','송정동\r\n');
INSERT INTO postno VALUES (4939,'506-011','광주시','광산구','송정1동\r\n');
INSERT INTO postno VALUES (4940,'506-012','광주시','광산구','송정2동\r\n');
INSERT INTO postno VALUES (4941,'506-013','광주시','광산구','송정3동\r\n');
INSERT INTO postno VALUES (4942,'506-020','광주시','광산구','도산동\r\n');
INSERT INTO postno VALUES (4943,'506-030','광주시','광산구','황룡동\r\n');
INSERT INTO postno VALUES (4944,'506-040','광주시','광산구','소촌동\r\n');
INSERT INTO postno VALUES (4945,'506-050','광주시','광산구','우산동\r\n');
INSERT INTO postno VALUES (4946,'506-053','광주시','광산구','산정동\r\n');
INSERT INTO postno VALUES (4947,'506-055','광주시','광산구','월곡1동\r\n');
INSERT INTO postno VALUES (4948,'506-056','광주시','광산구','월곡2동\r\n');
INSERT INTO postno VALUES (4949,'506-060','광주시','광산구','도호동\r\n');
INSERT INTO postno VALUES (4950,'506-070','광주시','광산구','신촌동\r\n');
INSERT INTO postno VALUES (4951,'506-080','광주시','광산구','박호동\r\n');
INSERT INTO postno VALUES (4952,'506-090','광주시','광산구','서봉동\r\n');
INSERT INTO postno VALUES (4953,'506-100','광주시','광산구','선암동\r\n');
INSERT INTO postno VALUES (4954,'506-110','광주시','광산구','운수동\r\n');
INSERT INTO postno VALUES (4955,'506-250','광주시','광산구','하남동\r\n');
INSERT INTO postno VALUES (4956,'506-251','광주시','광산구','장덕동\r\n');
INSERT INTO postno VALUES (4957,'506-252','광주시','광산구','흑석동\r\n');
INSERT INTO postno VALUES (4958,'506-253','광주시','광산구','오선동\r\n');
INSERT INTO postno VALUES (4959,'506-254','광주시','광산구','장수동\r\n');
INSERT INTO postno VALUES (4960,'506-257','광주시','광산구','진곡동\r\n');
INSERT INTO postno VALUES (4961,'506-258','광주시','광산구','안청동\r\n');
INSERT INTO postno VALUES (4962,'506-300','광주시','광산구','비아동\r\n');
INSERT INTO postno VALUES (4963,'506-301','광주시','광산구','도천동\r\n');
INSERT INTO postno VALUES (4964,'506-302','광주시','광산구','월계동\r\n');
INSERT INTO postno VALUES (4965,'506-303','광주시','광산구','쌍암동\r\n');
INSERT INTO postno VALUES (4966,'506-304','광주시','광산구','수완동\r\n');
INSERT INTO postno VALUES (4967,'506-305','광주시','광산구','산월동\r\n');
INSERT INTO postno VALUES (4968,'506-306','광주시','광산구','신창동\r\n');
INSERT INTO postno VALUES (4969,'506-307','광주시','광산구','신가동\r\n');
INSERT INTO postno VALUES (4970,'506-308','광주시','광산구','운남동\r\n');
INSERT INTO postno VALUES (4971,'506-350','광주시','광산구','임곡동\r\n');
INSERT INTO postno VALUES (4972,'506-351','광주시','광산구','사호동\r\n');
INSERT INTO postno VALUES (4973,'506-352','광주시','광산구','두정동\r\n');
INSERT INTO postno VALUES (4974,'506-353','광주시','광산구','오산동\r\n');
INSERT INTO postno VALUES (4975,'506-354','광주시','광산구','신룡동\r\n');
INSERT INTO postno VALUES (4976,'506-355','광주시','광산구','광산동\r\n');
INSERT INTO postno VALUES (4977,'506-356','광주시','광산구','산막동\r\n');
INSERT INTO postno VALUES (4978,'506-357','광주시','광산구','등림동\r\n');
INSERT INTO postno VALUES (4979,'506-358','광주시','광산구','교룡동\r\n');
INSERT INTO postno VALUES (4980,'506-400','광주시','광산구','남산동\r\n');
INSERT INTO postno VALUES (4981,'506-401','광주시','광산구','북산동\r\n');
INSERT INTO postno VALUES (4982,'506-402','광주시','광산구','송치동\r\n');
INSERT INTO postno VALUES (4983,'506-403','광주시','광산구','산수동\r\n');
INSERT INTO postno VALUES (4984,'506-404','광주시','광산구','지산동\r\n');
INSERT INTO postno VALUES (4985,'506-405','광주시','광산구','선동\r\n');
INSERT INTO postno VALUES (4986,'506-406','광주시','광산구','왕동\r\n');
INSERT INTO postno VALUES (4987,'506-407','광주시','광산구','동림동\r\n');
INSERT INTO postno VALUES (4988,'506-408','광주시','광산구','양산동\r\n');
INSERT INTO postno VALUES (4989,'506-409','광주시','광산구','동호동\r\n');
INSERT INTO postno VALUES (4990,'506-410','광주시','광산구','덕림동\r\n');
INSERT INTO postno VALUES (4991,'506-411','광주시','광산구','명도동\r\n');
INSERT INTO postno VALUES (4992,'506-450','광주시','광산구','도덕동\r\n');
INSERT INTO postno VALUES (4993,'506-451','광주시','광산구','송산동\r\n');
INSERT INTO postno VALUES (4994,'506-452','광주시','광산구','지평동\r\n');
INSERT INTO postno VALUES (4995,'506-453','광주시','광산구','오운동\r\n');
INSERT INTO postno VALUES (4996,'506-454','광주시','광산구','삼거동\r\n');
INSERT INTO postno VALUES (4997,'506-455','광주시','광산구','양동\r\n');
INSERT INTO postno VALUES (4998,'506-456','광주시','광산구','내산동\r\n');
INSERT INTO postno VALUES (4999,'506-457','광주시','광산구','대산동\r\n');
INSERT INTO postno VALUES (5000,'506-458','광주시','광산구','삼도동\r\n');
INSERT INTO postno VALUES (5001,'506-459','광주시','광산구','신동\r\n');
INSERT INTO postno VALUES (5002,'506-460','광주시','광산구','송학동\r\n');
INSERT INTO postno VALUES (5003,'506-500','광주시','광산구','옥동\r\n');
INSERT INTO postno VALUES (5004,'506-501','광주시','광산구','월전동\r\n');
INSERT INTO postno VALUES (5005,'506-502','광주시','광산구','연산동\r\n');
INSERT INTO postno VALUES (5006,'506-503','광주시','광산구','용동\r\n');
INSERT INTO postno VALUES (5007,'506-504','광주시','광산구','용곡동\r\n');
INSERT INTO postno VALUES (5008,'506-505','광주시','광산구','지죽동\r\n');
INSERT INTO postno VALUES (5009,'506-506','광주시','광산구','송촌동\r\n');
INSERT INTO postno VALUES (5010,'506-507','광주시','광산구','장록동\r\n');
INSERT INTO postno VALUES (5011,'506-508','광주시','광산구','동산동\r\n');
INSERT INTO postno VALUES (5012,'506-509','광주시','광산구','명화동\r\n');
INSERT INTO postno VALUES (5013,'506-510','광주시','광산구','지정동\r\n');
INSERT INTO postno VALUES (5014,'506-550','광주시','광산구','하산동\r\n');
INSERT INTO postno VALUES (5015,'506-551','광주시','광산구','유계동\r\n');
INSERT INTO postno VALUES (5016,'506-552','광주시','광산구','본덕동\r\n');
INSERT INTO postno VALUES (5017,'506-553','광주시','광산구','용봉동\r\n');
INSERT INTO postno VALUES (5018,'506-554','광주시','광산구','요기동\r\n');
INSERT INTO postno VALUES (5019,'506-555','광주시','광산구','복룡동\r\n');
INSERT INTO postno VALUES (5020,'506-556','광주시','광산구','송대동\r\n');
INSERT INTO postno VALUES (5021,'506-600','광주시','광산구','송정우체국사서함\r\n');
INSERT INTO postno VALUES (5022,'506-701','광주시','광산구','신창동 광주보건전문대\r\n');
INSERT INTO postno VALUES (5023,'506-702','광주시','광산구','송정2동 광산구청\r\n');
INSERT INTO postno VALUES (5024,'506-711','광주시','광산구','소촌동 금호타이어(주)\r\n');
INSERT INTO postno VALUES (5025,'506-712','광주시','광산구','쌍암동 광주과학기술윈\r\n');
INSERT INTO postno VALUES (5026,'513-800','전남','영광군','영광읍\r\n');
INSERT INTO postno VALUES (5027,'513-810','전남','영광군','대마면\r\n');
INSERT INTO postno VALUES (5028,'513-820','전남','영광군','묘량면\r\n');
INSERT INTO postno VALUES (5029,'513-830','전남','영광군','불갑면\r\n');
INSERT INTO postno VALUES (5030,'513-840','전남','영광군','군서면\r\n');
INSERT INTO postno VALUES (5031,'513-850','전남','영광군','군남면\r\n');
INSERT INTO postno VALUES (5032,'513-860','전남','영광군','염산면\r\n');
INSERT INTO postno VALUES (5033,'513-870','전남','영광군','법성면\r\n');
INSERT INTO postno VALUES (5034,'513-880','전남','영광군','홍농읍\r\n');
INSERT INTO postno VALUES (5035,'513-890','전남','영광군','낙월면\r\n');
INSERT INTO postno VALUES (5036,'513-895','전남','영광군','낙월면 석만리\r\n');
INSERT INTO postno VALUES (5037,'513-895','전남','영광군','낙월면 송이도\r\n');
INSERT INTO postno VALUES (5038,'513-895','전남','영광군','낙월면 신기리\r\n');
INSERT INTO postno VALUES (5039,'513-895','전남','영광군','낙월면 영외리\r\n');
INSERT INTO postno VALUES (5040,'513-895','전남','영광군','낙월면 오도리\r\n');
INSERT INTO postno VALUES (5041,'513-895','전남','영광군','낙월면 월촌리\r\n');
INSERT INTO postno VALUES (5042,'513-895','전남','영광군','낙월면 죽도리\r\n');
INSERT INTO postno VALUES (5043,'513-895','전남','영광군','낙월면 횡도리\r\n');
INSERT INTO postno VALUES (5044,'513-900','전남','영광군','백수읍\r\n');
INSERT INTO postno VALUES (5045,'515-800','전남','장성군','장성읍\r\n');
INSERT INTO postno VALUES (5046,'515-805','전남','장성군','장성읍 용강리 용곡\r\n');
INSERT INTO postno VALUES (5047,'515-810','전남','장성군','황룡면\r\n');
INSERT INTO postno VALUES (5048,'515-820','전남','장성군','서삼면\r\n');
INSERT INTO postno VALUES (5049,'515-830','전남','장성군','북일면\r\n');
INSERT INTO postno VALUES (5050,'515-840','전남','장성군','북이면\r\n');
INSERT INTO postno VALUES (5051,'515-845','전남','장성군','북이면 수성리\r\n');
INSERT INTO postno VALUES (5052,'515-845','전남','장성군','북이면 오월리\r\n');
INSERT INTO postno VALUES (5053,'515-845','전남','장성군','북이면 조양리\r\n');
INSERT INTO postno VALUES (5054,'515-850','전남','장성군','북하면\r\n');
INSERT INTO postno VALUES (5055,'515-855','전남','장성군','북하면 덕재리\r\n');
INSERT INTO postno VALUES (5056,'515-855','전남','장성군','북하면 신성리\r\n');
INSERT INTO postno VALUES (5057,'515-855','전남','장성군','북하면 쌍웅리\r\n');
INSERT INTO postno VALUES (5058,'515-855','전남','장성군','북하면 동현리\r\n');
INSERT INTO postno VALUES (5059,'515-860','전남','장성군','동화면\r\n');
INSERT INTO postno VALUES (5060,'515-870','전남','장성군','삼계면\r\n');
INSERT INTO postno VALUES (5061,'515-880','전남','장성군','삼서면\r\n');
INSERT INTO postno VALUES (5062,'515-890','전남','장성군','남면\r\n');
INSERT INTO postno VALUES (5063,'515-910','전남','장성군','진원면\r\n');
INSERT INTO postno VALUES (5064,'516-800','전남','곡성군','곡성읍\r\n');
INSERT INTO postno VALUES (5065,'516-810','전남','곡성군','고달면\r\n');
INSERT INTO postno VALUES (5066,'516-820','전남','곡성군','오곡면\r\n');
INSERT INTO postno VALUES (5067,'516-830','전남','곡성군','죽곡면\r\n');
INSERT INTO postno VALUES (5068,'516-840','전남','곡성군','목사동면\r\n');
INSERT INTO postno VALUES (5069,'516-850','전남','곡성군','석곡면\r\n');
INSERT INTO postno VALUES (5070,'516-860','전남','곡성군','삼기면\r\n');
INSERT INTO postno VALUES (5071,'516-910','전남','곡성군','옥과면\r\n');
INSERT INTO postno VALUES (5072,'516-920','전남','곡성군','오산면\r\n');
INSERT INTO postno VALUES (5073,'516-930','전남','곡성군','겸면\r\n');
INSERT INTO postno VALUES (5074,'516-940','전남','곡성군','입면\r\n');
INSERT INTO postno VALUES (5075,'517-800','전남','담양군','담양읍\r\n');
INSERT INTO postno VALUES (5076,'517-810','전남','담양군','금성면\r\n');
INSERT INTO postno VALUES (5077,'517-820','전남','담양군','용면\r\n');
INSERT INTO postno VALUES (5078,'517-830','전남','담양군','월산면\r\n');
INSERT INTO postno VALUES (5079,'517-840','전남','담양군','무정면\r\n');
INSERT INTO postno VALUES (5080,'517-850','전남','담양군','봉산면\r\n');
INSERT INTO postno VALUES (5081,'517-860','전남','담양군','고서면\r\n');
INSERT INTO postno VALUES (5082,'517-870','전남','담양군','남면\r\n');
INSERT INTO postno VALUES (5083,'517-880','전남','담양군','창평면\r\n');
INSERT INTO postno VALUES (5084,'517-890','전남','담양군','대덕면\r\n');
INSERT INTO postno VALUES (5085,'517-910','전남','담양군','수북면\r\n');
INSERT INTO postno VALUES (5086,'517-920','전남','담양군','대전면\r\n');
INSERT INTO postno VALUES (5087,'519-800','전남','화순군','화순읍\r\n');
INSERT INTO postno VALUES (5088,'519-810','전남','화순군','능주면\r\n');
INSERT INTO postno VALUES (5089,'519-820','전남','화순군','한천면\r\n');
INSERT INTO postno VALUES (5090,'519-830','전남','화순군','도곡면\r\n');
INSERT INTO postno VALUES (5091,'519-840','전남','화순군','도암면\r\n');
INSERT INTO postno VALUES (5092,'519-850','전남','화순군','춘양면\r\n');
INSERT INTO postno VALUES (5093,'519-860','전남','화순군','이양면\r\n');
INSERT INTO postno VALUES (5094,'519-870','전남','화순군','청풍면\r\n');
INSERT INTO postno VALUES (5095,'519-880','전남','화순군','동면\r\n');
INSERT INTO postno VALUES (5096,'519-890','전남','화순군','남면\r\n');
INSERT INTO postno VALUES (5097,'519-910','전남','화순군','동복면\r\n');
INSERT INTO postno VALUES (5098,'519-920','전남','화순군','북면\r\n');
INSERT INTO postno VALUES (5099,'519-930','전남','화순군','이서면\r\n');
INSERT INTO postno VALUES (5100,'520-010','전남','나주시','중앙동\r\n');
INSERT INTO postno VALUES (5101,'520-020','전남','나주시','금계동\r\n');
INSERT INTO postno VALUES (5102,'520-030','전남','나주시','교동\r\n');
INSERT INTO postno VALUES (5103,'520-040','전남','나주시','서내동\r\n');
INSERT INTO postno VALUES (5104,'520-050','전남','나주시','성북동\r\n');
INSERT INTO postno VALUES (5105,'520-060','전남','나주시','산정동\r\n');
INSERT INTO postno VALUES (5106,'520-070','전남','나주시','과원동\r\n');
INSERT INTO postno VALUES (5107,'520-080','전남','나주시','남내동\r\n');
INSERT INTO postno VALUES (5108,'520-090','전남','나주시','죽림동\r\n');
INSERT INTO postno VALUES (5109,'520-100','전남','나주시','남외동\r\n');
INSERT INTO postno VALUES (5110,'520-110','전남','나주시','금성동\r\n');
INSERT INTO postno VALUES (5111,'520-120','전남','나주시','경현동\r\n');
INSERT INTO postno VALUES (5112,'520-130','전남','나주시','송월동\r\n');
INSERT INTO postno VALUES (5113,'520-140','전남','나주시','토계동\r\n');
INSERT INTO postno VALUES (5114,'520-150','전남','나주시','청동\r\n');
INSERT INTO postno VALUES (5115,'520-160','전남','나주시','석현동\r\n');
INSERT INTO postno VALUES (5116,'520-170','전남','나주시','삼도동\r\n');
INSERT INTO postno VALUES (5117,'520-180','전남','나주시','대호동\r\n');
INSERT INTO postno VALUES (5118,'520-200','전남','나주시','송촌동\r\n');
INSERT INTO postno VALUES (5119,'520-210','전남','나주시','보산동\r\n');
INSERT INTO postno VALUES (5120,'520-220','전남','나주시','이창동\r\n');
INSERT INTO postno VALUES (5121,'520-230','전남','나주시','삼영동\r\n');
INSERT INTO postno VALUES (5122,'520-240','전남','나주시','영산동\r\n');
INSERT INTO postno VALUES (5123,'520-250','전남','나주시','용산동\r\n');
INSERT INTO postno VALUES (5124,'520-260','전남','나주시','안창동\r\n');
INSERT INTO postno VALUES (5125,'520-270','전남','나주시','진포동\r\n');
INSERT INTO postno VALUES (5126,'520-280','전남','나주시','부덕동\r\n');
INSERT INTO postno VALUES (5127,'520-290','전남','나주시','관정동\r\n');
INSERT INTO postno VALUES (5128,'520-300','전남','나주시','대기동\r\n');
INSERT INTO postno VALUES (5129,'520-310','전남','나주시','평산동\r\n');
INSERT INTO postno VALUES (5130,'520-320','전남','나주시','운곡동\r\n');
INSERT INTO postno VALUES (5131,'520-330','전남','나주시','동수동\r\n');
INSERT INTO postno VALUES (5132,'520-340','전남','나주시','오량동\r\n');
INSERT INTO postno VALUES (5133,'520-600','전남','나주시','나주우체국사서함\r\n');
INSERT INTO postno VALUES (5134,'520-610','전남','나주시','성북동우체국사서함\r\n');
INSERT INTO postno VALUES (5135,'520-714','전남','나주시','대호동 동신대학교\r\n');
INSERT INTO postno VALUES (5136,'520-810','전남','나주시','노안면\r\n');
INSERT INTO postno VALUES (5137,'520-820','전남','나주시','금천면\r\n');
INSERT INTO postno VALUES (5138,'520-830','전남','나주시','산포면\r\n');
INSERT INTO postno VALUES (5139,'520-840','전남','나주시','남평읍\r\n');
INSERT INTO postno VALUES (5140,'520-850','전남','나주시','봉황면\r\n');
INSERT INTO postno VALUES (5141,'520-860','전남','나주시','다도면\r\n');
INSERT INTO postno VALUES (5142,'520-870','전남','나주시','세지면\r\n');
INSERT INTO postno VALUES (5143,'520-880','전남','나주시','왕곡면\r\n');
INSERT INTO postno VALUES (5144,'520-890','전남','나주시','공산면\r\n');
INSERT INTO postno VALUES (5145,'520-910','전남','나주시','동강면\r\n');
INSERT INTO postno VALUES (5146,'520-920','전남','나주시','반남면\r\n');
INSERT INTO postno VALUES (5147,'520-930','전남','나주시','다시면\r\n');
INSERT INTO postno VALUES (5148,'520-940','전남','나주시','문평면\r\n');
INSERT INTO postno VALUES (5149,'525-800','전남','함평군','함평읍\r\n');
INSERT INTO postno VALUES (5150,'525-810','전남','함평군','학교면\r\n');
INSERT INTO postno VALUES (5151,'525-820','전남','함평군','엄다면\r\n');
INSERT INTO postno VALUES (5152,'525-830','전남','함평군','대동면\r\n');
INSERT INTO postno VALUES (5153,'525-840','전남','함평군','손불면\r\n');
INSERT INTO postno VALUES (5154,'525-850','전남','함평군','신광면\r\n');
INSERT INTO postno VALUES (5155,'525-860','전남','함평군','나산면\r\n');
INSERT INTO postno VALUES (5156,'525-870','전남','함평군','해보면\r\n');
INSERT INTO postno VALUES (5157,'525-880','전남','함평군','월야면\r\n');
INSERT INTO postno VALUES (5158,'526-701','전남','영암군','삼호면 한라중공업\r\n');
INSERT INTO postno VALUES (5159,'526-800','전남','영암군','영암읍\r\n');
INSERT INTO postno VALUES (5160,'526-805','전남','영암군','영암읍 한대리\r\n');
INSERT INTO postno VALUES (5161,'526-810','전남','영암군','신북면\r\n');
INSERT INTO postno VALUES (5162,'526-820','전남','영암군','덕진면\r\n');
INSERT INTO postno VALUES (5163,'526-830','전남','영암군','도포면\r\n');
INSERT INTO postno VALUES (5164,'526-840','전남','영암군','시종면\r\n');
INSERT INTO postno VALUES (5165,'526-850','전남','영암군','군서면\r\n');
INSERT INTO postno VALUES (5166,'526-860','전남','영암군','서호면\r\n');
INSERT INTO postno VALUES (5167,'526-870','전남','영암군','학산면\r\n');
INSERT INTO postno VALUES (5168,'526-880','전남','영암군','미암면\r\n');
INSERT INTO postno VALUES (5169,'526-890','전남','영암군','삼호면\r\n');
INSERT INTO postno VALUES (5170,'526-910','전남','영암군','금정면\r\n');
INSERT INTO postno VALUES (5171,'527-800','전남','강진군','강진읍\r\n');
INSERT INTO postno VALUES (5172,'527-810','전남','강진군','성전면\r\n');
INSERT INTO postno VALUES (5173,'527-820','전남','강진군','작천면\r\n');
INSERT INTO postno VALUES (5174,'527-830','전남','강진군','병영면\r\n');
INSERT INTO postno VALUES (5175,'527-840','전남','강진군','옴천면\r\n');
INSERT INTO postno VALUES (5176,'527-850','전남','강진군','군동면\r\n');
INSERT INTO postno VALUES (5177,'527-860','전남','강진군','칠량면\r\n');
INSERT INTO postno VALUES (5178,'527-870','전남','강진군','대구면\r\n');
INSERT INTO postno VALUES (5179,'527-880','전남','강진군','도암면\r\n');
INSERT INTO postno VALUES (5180,'527-890','전남','강진군','신전면\r\n');
INSERT INTO postno VALUES (5181,'527-910','전남','강진군','마량면\r\n');
INSERT INTO postno VALUES (5182,'527-915','전남','강진군','고금면 덕동리 넓도\r\n');
INSERT INTO postno VALUES (5183,'527-915','전남','강진군','고금면 덕동리 초완도\r\n');
INSERT INTO postno VALUES (5184,'529-800','전남','장흥군','장흥읍\r\n');
INSERT INTO postno VALUES (5185,'529-810','전남','장흥군','부산면\r\n');
INSERT INTO postno VALUES (5186,'529-820','전남','장흥군','유치면\r\n');
INSERT INTO postno VALUES (5187,'529-830','전남','장흥군','장동면\r\n');
INSERT INTO postno VALUES (5188,'529-840','전남','장흥군','장평면\r\n');
INSERT INTO postno VALUES (5189,'529-850','전남','장흥군','안량면\r\n');
INSERT INTO postno VALUES (5190,'529-860','전남','장흥군','용산면\r\n');
INSERT INTO postno VALUES (5191,'529-870','전남','장흥군','관산읍\r\n');
INSERT INTO postno VALUES (5192,'529-880','전남','장흥군','회진면\r\n');
INSERT INTO postno VALUES (5193,'529-900','전남','장흥군','대덕읍\r\n');
INSERT INTO postno VALUES (5194,'530-010','전남','목포시','죽교동\r\n');
INSERT INTO postno VALUES (5195,'530-011','전남','목포시','죽교1동\r\n');
INSERT INTO postno VALUES (5196,'530-012','전남','목포시','죽교2동\r\n');
INSERT INTO postno VALUES (5197,'530-013','전남','목포시','죽교3동\r\n');
INSERT INTO postno VALUES (5198,'530-014','전남','목포시','달성동\r\n');
INSERT INTO postno VALUES (5199,'530-015','전남','목포시','대반동\r\n');
INSERT INTO postno VALUES (5200,'530-020','전남','목포시','온금동\r\n');
INSERT INTO postno VALUES (5201,'530-030','전남','목포시','서산동\r\n');
INSERT INTO postno VALUES (5202,'530-040','전남','목포시','금화동\r\n');
INSERT INTO postno VALUES (5203,'530-050','전남','목포시','유달동\r\n');
INSERT INTO postno VALUES (5204,'530-060','전남','목포시','대의동\r\n');
INSERT INTO postno VALUES (5205,'530-070','전남','목포시','중앙동\r\n');
INSERT INTO postno VALUES (5206,'530-080','전남','목포시','해안동\r\n');
INSERT INTO postno VALUES (5207,'530-090','전남','목포시','경동\r\n');
INSERT INTO postno VALUES (5208,'530-100','전남','목포시','금동\r\n');
INSERT INTO postno VALUES (5209,'530-110','전남','목포시','중동\r\n');
INSERT INTO postno VALUES (5210,'530-120','전남','목포시','유동\r\n');
INSERT INTO postno VALUES (5211,'530-130','전남','목포시','만호동\r\n');
INSERT INTO postno VALUES (5212,'530-140','전남','목포시','항동\r\n');
INSERT INTO postno VALUES (5213,'530-150','전남','목포시','수강동\r\n');
INSERT INTO postno VALUES (5214,'530-160','전남','목포시','행복동\r\n');
INSERT INTO postno VALUES (5215,'530-170','전남','목포시','영해동\r\n');
INSERT INTO postno VALUES (5216,'530-180','전남','목포시','보광동\r\n');
INSERT INTO postno VALUES (5217,'530-190','전남','목포시','축복동\r\n');
INSERT INTO postno VALUES (5218,'530-200','전남','목포시','광동\r\n');
INSERT INTO postno VALUES (5219,'530-210','전남','목포시','동명동\r\n');
INSERT INTO postno VALUES (5220,'530-220','전남','목포시','복만동\r\n');
INSERT INTO postno VALUES (5221,'530-230','전남','목포시','무안동\r\n');
INSERT INTO postno VALUES (5222,'530-240','전남','목포시','측후동\r\n');
INSERT INTO postno VALUES (5223,'530-250','전남','목포시','상락동\r\n');
INSERT INTO postno VALUES (5224,'530-260','전남','목포시','죽동\r\n');
INSERT INTO postno VALUES (5225,'530-270','전남','목포시','명륜동\r\n');
INSERT INTO postno VALUES (5226,'530-280','전남','목포시','대안동\r\n');
INSERT INTO postno VALUES (5227,'530-290','전남','목포시','창평동\r\n');
INSERT INTO postno VALUES (5228,'530-300','전남','목포시','호남동\r\n');
INSERT INTO postno VALUES (5229,'530-310','전남','목포시','남교동\r\n');
INSERT INTO postno VALUES (5230,'530-320','전남','목포시','북교동\r\n');
INSERT INTO postno VALUES (5231,'530-330','전남','목포시','양동\r\n');
INSERT INTO postno VALUES (5232,'530-340','전남','목포시','대성동\r\n');
INSERT INTO postno VALUES (5233,'530-341','전남','목포시','대성1동\r\n');
INSERT INTO postno VALUES (5234,'530-342','전남','목포시','대성2동\r\n');
INSERT INTO postno VALUES (5235,'530-350','전남','목포시','산정동\r\n');
INSERT INTO postno VALUES (5236,'530-351','전남','목포시','산정1동\r\n');
INSERT INTO postno VALUES (5237,'530-352','전남','목포시','산정2동\r\n');
INSERT INTO postno VALUES (5238,'530-353','전남','목포시','산정3동\r\n');
INSERT INTO postno VALUES (5239,'530-360','전남','목포시','용당동\r\n');
INSERT INTO postno VALUES (5240,'530-361','전남','목포시','용당1동\r\n');
INSERT INTO postno VALUES (5241,'530-362','전남','목포시','용당2동\r\n');
INSERT INTO postno VALUES (5242,'530-370','전남','목포시','연산동\r\n');
INSERT INTO postno VALUES (5243,'530-380','전남','목포시','용해동\r\n');
INSERT INTO postno VALUES (5244,'530-390','전남','목포시','상동\r\n');
INSERT INTO postno VALUES (5245,'530-400','전남','목포시','석현동\r\n');
INSERT INTO postno VALUES (5246,'530-410','전남','목포시','대양동\r\n');
INSERT INTO postno VALUES (5247,'530-420','전남','목포시','옥암동\r\n');
INSERT INTO postno VALUES (5248,'530-430','전남','목포시','달동\r\n');
INSERT INTO postno VALUES (5249,'530-440','전남','목포시','눌도동\r\n');
INSERT INTO postno VALUES (5250,'530-450','전남','목포시','고하동\r\n');
INSERT INTO postno VALUES (5251,'530-600','전남','목포시','목포우체국사서함\r\n');
INSERT INTO postno VALUES (5252,'530-701','전남','목포시','용당1동 목포시청\r\n');
INSERT INTO postno VALUES (5253,'530-728','전남','목포시','목포문화방송국건물\r\n');
INSERT INTO postno VALUES (5254,'530-729','전남','목포시','대반동 목포해양대학교\r\n');
INSERT INTO postno VALUES (5255,'530-730','전남','목포시','상동 목포전문대\r\n');
INSERT INTO postno VALUES (5256,'530-742','전남','목포시','산정2동 성신간호전문대\r\n');
INSERT INTO postno VALUES (5257,'534-729','전남','무안군','청계면 목포대학교\r\n');
INSERT INTO postno VALUES (5258,'534-800','전남','무안군','무안읍\r\n');
INSERT INTO postno VALUES (5259,'534-810','전남','무안군','몽탄면\r\n');
INSERT INTO postno VALUES (5260,'534-820','전남','무안군','삼향면\r\n');
INSERT INTO postno VALUES (5261,'534-830','전남','무안군','청계면\r\n');
INSERT INTO postno VALUES (5262,'534-840','전남','무안군','현경면\r\n');
INSERT INTO postno VALUES (5263,'534-850','전남','무안군','망운면\r\n');
INSERT INTO postno VALUES (5264,'534-860','전남','무안군','운남면\r\n');
INSERT INTO postno VALUES (5265,'534-870','전남','무안군','해제면\r\n');
INSERT INTO postno VALUES (5266,'534-900','전남','무안군','일로읍\r\n');
INSERT INTO postno VALUES (5267,'535-800','전남','신안군','지도읍\r\n');
INSERT INTO postno VALUES (5268,'535-810','전남','신안군','압해면\r\n');
INSERT INTO postno VALUES (5269,'535-820','전남','신안군','증도면\r\n');
INSERT INTO postno VALUES (5270,'535-830','전남','신안군','임자면\r\n');
INSERT INTO postno VALUES (5271,'535-840','전남','신안군','안좌면\r\n');
INSERT INTO postno VALUES (5272,'535-850','전남','신안군','팔금면\r\n');
INSERT INTO postno VALUES (5273,'535-860','전남','신안군','암태면\r\n');
INSERT INTO postno VALUES (5274,'535-870','전남','신안군','자은면\r\n');
INSERT INTO postno VALUES (5275,'535-880','전남','신안군','비금면\r\n');
INSERT INTO postno VALUES (5276,'535-885','전남','신안군','비금면 가산리\r\n');
INSERT INTO postno VALUES (5277,'535-885','전남','신안군','비금면 구림리\r\n');
INSERT INTO postno VALUES (5278,'535-885','전남','신안군','비금면 광대리\r\n');
INSERT INTO postno VALUES (5279,'535-885','전남','신안군','비금면 도고리\r\n');
INSERT INTO postno VALUES (5280,'535-885','전남','신안군','비금면 용소리\r\n');
INSERT INTO postno VALUES (5281,'535-885','전남','신안군','비금면 지당리\r\n');
INSERT INTO postno VALUES (5282,'535-890','전남','신안군','도초면\r\n');
INSERT INTO postno VALUES (5283,'535-910','전남','신안군','흑산면\r\n');
INSERT INTO postno VALUES (5284,'535-915','전남','신안군','흑산면 가거도리\r\n');
INSERT INTO postno VALUES (5285,'535-916','전남','신안군','흑산면 홍도리\r\n');
INSERT INTO postno VALUES (5286,'535-920','전남','신안군','장산면\r\n');
INSERT INTO postno VALUES (5287,'530-145','전남','신안군','장산면 마진도리 율도\r\n');
INSERT INTO postno VALUES (5288,'535-930','전남','신안군','하의면\r\n');
INSERT INTO postno VALUES (5289,'535-940','전남','신안군','신의면\r\n');
INSERT INTO postno VALUES (5290,'536-800','전남','해남군','해남읍\r\n');
INSERT INTO postno VALUES (5291,'536-810','전남','해남군','삼산면\r\n');
INSERT INTO postno VALUES (5292,'536-820','전남','해남군','옥천면\r\n');
INSERT INTO postno VALUES (5293,'536-830','전남','해남군','계곡면\r\n');
INSERT INTO postno VALUES (5294,'536-840','전남','해남군','마산면\r\n');
INSERT INTO postno VALUES (5295,'536-850','전남','해남군','산이면\r\n');
INSERT INTO postno VALUES (5296,'536-860','전남','해남군','황산면\r\n');
INSERT INTO postno VALUES (5297,'536-870','전남','해남군','문내면\r\n');
INSERT INTO postno VALUES (5298,'536-880','전남','해남군','화원면\r\n');
INSERT INTO postno VALUES (5299,'536-890','전남','해남군','화산면\r\n');
INSERT INTO postno VALUES (5300,'536-910','전남','해남군','현산면\r\n');
INSERT INTO postno VALUES (5301,'536-920','전남','해남군','송지면\r\n');
INSERT INTO postno VALUES (5302,'536-930','전남','해남군','북평면\r\n');
INSERT INTO postno VALUES (5303,'536-940','전남','해남군','북일면\r\n');
INSERT INTO postno VALUES (5304,'537-800','전남','완도군','완도읍\r\n');
INSERT INTO postno VALUES (5305,'537-810','전남','완도군','군외면\r\n');
INSERT INTO postno VALUES (5306,'537-815','전남','완도군','군외면 당인리 서화도\r\n');
INSERT INTO postno VALUES (5307,'537-817','전남','완도군','군외면 황진리 토도\r\n');
INSERT INTO postno VALUES (5308,'537-820','전남','완도군','청산면\r\n');
INSERT INTO postno VALUES (5309,'537-825','전남','완도군','청산면 모도리 동모도\r\n');
INSERT INTO postno VALUES (5310,'537-825','전남','완도군','청산면 모도리 서모도\r\n');
INSERT INTO postno VALUES (5311,'537-830','전남','완도군','소안면\r\n');
INSERT INTO postno VALUES (5312,'537-840','전남','완도군','노화읍\r\n');
INSERT INTO postno VALUES (5313,'537-845','전남','완도군','노화읍 내리 어룡도\r\n');
INSERT INTO postno VALUES (5314,'537-850','전남','완도군','보길면\r\n');
INSERT INTO postno VALUES (5315,'537-860','전남','완도군','신지면\r\n');
INSERT INTO postno VALUES (5316,'537-861','전남','완도군','신지면 월량리 모황도\r\n');
INSERT INTO postno VALUES (5317,'537-870','전남','완도군','고금면\r\n');
INSERT INTO postno VALUES (5318,'527-915','전남','완도군','고금면 덕동리 넓도\r\n');
INSERT INTO postno VALUES (5319,'527-915','전남','완도군','고금면 덕동리 초완도\r\n');
INSERT INTO postno VALUES (5320,'537-880','전남','완도군','약산면\r\n');
INSERT INTO postno VALUES (5321,'537-900','전남','완도군','금일읍\r\n');
INSERT INTO postno VALUES (5322,'537-903','전남','완도군','금일읍 장원리\r\n');
INSERT INTO postno VALUES (5323,'537-905','전남','완도군','금일읍 충동리 충도\r\n');
INSERT INTO postno VALUES (5324,'537-907','전남','완도군','금일읍 동백리 황제도\r\n');
INSERT INTO postno VALUES (5325,'537-910','전남','완도군','금당면\r\n');
INSERT INTO postno VALUES (5326,'537-920','전남','완도군','생일면\r\n');
INSERT INTO postno VALUES (5327,'537-925','전남','완도군','생일면 봉선리 덕우도\r\n');
INSERT INTO postno VALUES (5328,'539-800','전남','진도군','진도읍\r\n');
INSERT INTO postno VALUES (5329,'539-810','전남','진도군','고군면\r\n');
INSERT INTO postno VALUES (5330,'539-820','전남','진도군','군내면\r\n');
INSERT INTO postno VALUES (5331,'539-830','전남','진도군','의신면\r\n');
INSERT INTO postno VALUES (5332,'539-840','전남','진도군','임회면\r\n');
INSERT INTO postno VALUES (5333,'539-850','전남','진도군','지산면\r\n');
INSERT INTO postno VALUES (5334,'539-910','전남','진도군','조도면\r\n');
INSERT INTO postno VALUES (5335,'540-010','전남','순천시','와룡동\r\n');
INSERT INTO postno VALUES (5336,'540-020','전남','순천시','삼거동\r\n');
INSERT INTO postno VALUES (5337,'540-030','전남','순천시','옥천동\r\n');
INSERT INTO postno VALUES (5338,'540-040','전남','순천시','영동\r\n');
INSERT INTO postno VALUES (5339,'540-050','전남','순천시','금곡동\r\n');
INSERT INTO postno VALUES (5340,'540-060','전남','순천시','행동\r\n');
INSERT INTO postno VALUES (5341,'540-070','전남','순천시','매곡동\r\n');
INSERT INTO postno VALUES (5342,'540-080','전남','순천시','가곡동\r\n');
INSERT INTO postno VALUES (5343,'540-090','전남','순천시','용당동\r\n');
INSERT INTO postno VALUES (5344,'540-100','전남','순천시','석현동\r\n');
INSERT INTO postno VALUES (5345,'540-110','전남','순천시','조곡동\r\n');
INSERT INTO postno VALUES (5346,'540-120','전남','순천시','덕암동\r\n');
INSERT INTO postno VALUES (5347,'540-130','전남','순천시','생목동\r\n');
INSERT INTO postno VALUES (5348,'540-140','전남','순천시','연향동\r\n');
INSERT INTO postno VALUES (5349,'540-150','전남','순천시','풍덕동\r\n');
INSERT INTO postno VALUES (5350,'540-160','전남','순천시','인제동\r\n');
INSERT INTO postno VALUES (5351,'540-170','전남','순천시','남정동\r\n');
INSERT INTO postno VALUES (5352,'540-180','전남','순천시','저전동\r\n');
INSERT INTO postno VALUES (5353,'540-190','전남','순천시','장천동\r\n');
INSERT INTO postno VALUES (5354,'540-200','전남','순천시','동외동\r\n');
INSERT INTO postno VALUES (5355,'540-210','전남','순천시','중앙동\r\n');
INSERT INTO postno VALUES (5356,'540-220','전남','순천시','남내동\r\n');
INSERT INTO postno VALUES (5357,'540-230','전남','순천시','교량동\r\n');
INSERT INTO postno VALUES (5358,'540-240','전남','순천시','홍내동\r\n');
INSERT INTO postno VALUES (5359,'540-250','전남','순천시','대룡동\r\n');
INSERT INTO postno VALUES (5360,'540-260','전남','순천시','덕월동\r\n');
INSERT INTO postno VALUES (5361,'540-270','전남','순천시','야흥동\r\n');
INSERT INTO postno VALUES (5362,'540-280','전남','순천시','오천동\r\n');
INSERT INTO postno VALUES (5363,'540-290','전남','순천시','대대동\r\n');
INSERT INTO postno VALUES (5364,'540-300','전남','순천시','인월동\r\n');
INSERT INTO postno VALUES (5365,'540-310','전남','순천시','안풍동\r\n');
INSERT INTO postno VALUES (5366,'540-320','전남','순천시','조례동\r\n');
INSERT INTO postno VALUES (5367,'540-330','전남','순천시','왕지동\r\n');
INSERT INTO postno VALUES (5368,'540-600','전남','순천시','순천우체국사서함\r\n');
INSERT INTO postno VALUES (5369,'540-701','전남','순천시','장천동 순천시청\r\n');
INSERT INTO postno VALUES (5370,'540-705','전남','순천시','광주지방검찰청순청지청\r\n');
INSERT INTO postno VALUES (5371,'540-706','전남','순천시','매곡동 광주지방법윈순청지원\r\n');
INSERT INTO postno VALUES (5372,'540-742','전남','순천시','매곡동 순천대학교\r\n');
INSERT INTO postno VALUES (5373,'540-743','전남','순천시','매곡동 순천전문대학\r\n');
INSERT INTO postno VALUES (5374,'540-744','전남','순천시','덕월동 순천공업전문대학\r\n');
INSERT INTO postno VALUES (5375,'540-800','전남','순천시','승주읍\r\n');
INSERT INTO postno VALUES (5376,'540-825','전남','순천시','승주읍 도정리 군장\r\n');
INSERT INTO postno VALUES (5377,'540-810','전남','순천시','서면\r\n');
INSERT INTO postno VALUES (5378,'540-820','전남','순천시','황전면\r\n');
INSERT INTO postno VALUES (5379,'540-830','전남','순천시','월등면\r\n');
INSERT INTO postno VALUES (5380,'540-840','전남','순천시','주암면\r\n');
INSERT INTO postno VALUES (5381,'540-850','전남','순천시','해룡면\r\n');
INSERT INTO postno VALUES (5382,'540-860','전남','순천시','상사면\r\n');
INSERT INTO postno VALUES (5383,'540-870','전남','순천시','별량면\r\n');
INSERT INTO postno VALUES (5384,'540-910','전남','순천시','낙안면\r\n');
INSERT INTO postno VALUES (5385,'540-920','전남','순천시','외서면\r\n');
INSERT INTO postno VALUES (5386,'540-930','전남','순천시','송광면\r\n');
INSERT INTO postno VALUES (5387,'542-800','전남','구례군','구례읍\r\n');
INSERT INTO postno VALUES (5388,'542-810','전남','구례군','문척면\r\n');
INSERT INTO postno VALUES (5389,'542-820','전남','구례군','용방면\r\n');
INSERT INTO postno VALUES (5390,'542-830','전남','구례군','산동면\r\n');
INSERT INTO postno VALUES (5391,'542-840','전남','구례군','광의면\r\n');
INSERT INTO postno VALUES (5392,'542-850','전남','구례군','마산면\r\n');
INSERT INTO postno VALUES (5393,'542-860','전남','구례군','토지면\r\n');
INSERT INTO postno VALUES (5394,'542-870','전남','구례군','간전면\r\n');
INSERT INTO postno VALUES (5395,'545-010','전남','광양시','중동\r\n');
INSERT INTO postno VALUES (5396,'545-020','전남','광양시','도이동\r\n');
INSERT INTO postno VALUES (5397,'545-030','전남','광양시','황길동\r\n');
INSERT INTO postno VALUES (5398,'545-040','전남','광양시','황금동\r\n');
INSERT INTO postno VALUES (5399,'545-050','전남','광양시','성황동\r\n');
INSERT INTO postno VALUES (5400,'545-060','전남','광양시','중군동\r\n');
INSERT INTO postno VALUES (5401,'545-070','전남','광양시','마동\r\n');
INSERT INTO postno VALUES (5402,'545-080','전남','광양시','광영동\r\n');
INSERT INTO postno VALUES (5403,'545-090','전남','광양시','금호동\r\n');
INSERT INTO postno VALUES (5404,'545-100','전남','광양시','태인동\r\n');
INSERT INTO postno VALUES (5405,'545-701','전남','광양시','중동 광양시청\r\n');
INSERT INTO postno VALUES (5406,'545-711','전남','광양시','금호동 광양제철\r\n');
INSERT INTO postno VALUES (5407,'545-800','전남','광양시','광양읍\r\n');
INSERT INTO postno VALUES (5408,'545-810','전남','광양시','봉강면\r\n');
INSERT INTO postno VALUES (5409,'545-820','전남','광양시','옥룡면\r\n');
INSERT INTO postno VALUES (5410,'545-830','전남','광양시','옥곡면\r\n');
INSERT INTO postno VALUES (5411,'545-840','전남','광양시','진상면\r\n');
INSERT INTO postno VALUES (5412,'545-850','전남','광양시','진월면\r\n');
INSERT INTO postno VALUES (5413,'545-860','전남','광양시','다압면\r\n');
INSERT INTO postno VALUES (5414,'546-800','전남','보성군','보성읍\r\n');
INSERT INTO postno VALUES (5415,'546-810','전남','보성군','노동면\r\n');
INSERT INTO postno VALUES (5416,'546-820','전남','보성군','미력면\r\n');
INSERT INTO postno VALUES (5417,'546-830','전남','보성군','복내면\r\n');
INSERT INTO postno VALUES (5418,'546-840','전남','보성군','문덕면\r\n');
INSERT INTO postno VALUES (5419,'546-850','전남','보성군','율어면\r\n');
INSERT INTO postno VALUES (5420,'546-860','전남','보성군','겸백면\r\n');
INSERT INTO postno VALUES (5421,'546-870','전남','보성군','회천면\r\n');
INSERT INTO postno VALUES (5422,'546-880','전남','보성군','웅치면\r\n');
INSERT INTO postno VALUES (5423,'546-900','전남','보성군','벌교읍\r\n');
INSERT INTO postno VALUES (5424,'546-910','전남','보성군','조성면\r\n');
INSERT INTO postno VALUES (5425,'546-920','전남','보성군','득량면\r\n');
INSERT INTO postno VALUES (5426,'548-800','전남','고흥군','고흥읍\r\n');
INSERT INTO postno VALUES (5427,'548-810','전남','고흥군','점암면\r\n');
INSERT INTO postno VALUES (5428,'548-820','전남','고흥군','영남면\r\n');
INSERT INTO postno VALUES (5429,'548-830','전남','고흥군','과역면\r\n');
INSERT INTO postno VALUES (5430,'548-840','전남','고흥군','남양면\r\n');
INSERT INTO postno VALUES (5431,'548-850','전남','고흥군','동강면\r\n');
INSERT INTO postno VALUES (5432,'548-860','전남','고흥군','대서면\r\n');
INSERT INTO postno VALUES (5433,'548-870','전남','고흥군','두원면\r\n');
INSERT INTO postno VALUES (5434,'548-880','전남','고흥군','포두면\r\n');
INSERT INTO postno VALUES (5435,'548-890','전남','고흥군','도화면\r\n');
INSERT INTO postno VALUES (5436,'548-900','전남','고흥군','도양읍\r\n');
INSERT INTO postno VALUES (5437,'548-905','전남','고흥군','도양읍 소록리\r\n');
INSERT INTO postno VALUES (5438,'548-910','전남','고흥군','풍양면\r\n');
INSERT INTO postno VALUES (5439,'548-920','전남','고흥군','도덕면\r\n');
INSERT INTO postno VALUES (5440,'548-930','전남','고흥군','금산면\r\n');
INSERT INTO postno VALUES (5441,'548-935','전남','고흥군','금산면 오천리\r\n');
INSERT INTO postno VALUES (5442,'548-935','전남','고흥군','금산면 신평리\r\n');
INSERT INTO postno VALUES (5443,'548-940','전남','고흥군','봉래면\r\n');
INSERT INTO postno VALUES (5444,'548-950','전남','고흥군','동일면\r\n');
INSERT INTO postno VALUES (5445,'550-010','전남','여수시','덕충동\r\n');
INSERT INTO postno VALUES (5446,'550-020','전남','여수시','공화동\r\n');
INSERT INTO postno VALUES (5447,'550-030','전남','여수시','수정동\r\n');
INSERT INTO postno VALUES (5448,'550-040','전남','여수시','종화동\r\n');
INSERT INTO postno VALUES (5449,'550-050','전남','여수시','고소동\r\n');
INSERT INTO postno VALUES (5450,'550-060','전남','여수시','중앙동\r\n');
INSERT INTO postno VALUES (5451,'550-070','전남','여수시','관문동\r\n');
INSERT INTO postno VALUES (5452,'550-080','전남','여수시','동산동\r\n');
INSERT INTO postno VALUES (5453,'550-090','전남','여수시','군자동\r\n');
INSERT INTO postno VALUES (5454,'550-100','전남','여수시','충무동\r\n');
INSERT INTO postno VALUES (5455,'550-110','전남','여수시','교동\r\n');
INSERT INTO postno VALUES (5456,'550-120','전남','여수시','남산동\r\n');
INSERT INTO postno VALUES (5457,'550-130','전남','여수시','서교동\r\n');
INSERT INTO postno VALUES (5458,'550-140','전남','여수시','연등동\r\n');
INSERT INTO postno VALUES (5459,'550-150','전남','여수시','광무동\r\n');
INSERT INTO postno VALUES (5460,'550-160','전남','여수시','봉강동\r\n');
INSERT INTO postno VALUES (5461,'550-170','전남','여수시','봉산동\r\n');
INSERT INTO postno VALUES (5462,'550-180','전남','여수시','국동\r\n');
INSERT INTO postno VALUES (5463,'550-190','전남','여수시','신월동\r\n');
INSERT INTO postno VALUES (5464,'550-200','전남','여수시','문수동\r\n');
INSERT INTO postno VALUES (5465,'550-210','전남','여수시','오림동\r\n');
INSERT INTO postno VALUES (5466,'550-220','전남','여수시','만흥동\r\n');
INSERT INTO postno VALUES (5467,'550-230','전남','여수시','오천동\r\n');
INSERT INTO postno VALUES (5468,'550-240','전남','여수시','미평동\r\n');
INSERT INTO postno VALUES (5469,'550-250','전남','여수시','둔덕동\r\n');
INSERT INTO postno VALUES (5470,'550-260','전남','여수시','여서동\r\n');
INSERT INTO postno VALUES (5471,'550-270','전남','여수시','경호동\r\n');
INSERT INTO postno VALUES (5472,'550-600','전남','여수시','여수우체국사서함\r\n');
INSERT INTO postno VALUES (5473,'550-701','전남','여수시','여서동 여수시청\r\n');
INSERT INTO postno VALUES (5474,'550-728','전남','여수시','문수동 여수문화방송국건물\r\n');
INSERT INTO postno VALUES (5475,'550-749','전남','여수시','국동 여수수산대학\r\n');
INSERT INTO postno VALUES (5476,'555-010','전남','여천시','학동\r\n');
INSERT INTO postno VALUES (5477,'555-020','전남','여천시','신기동\r\n');
INSERT INTO postno VALUES (5478,'555-030','전남','여천시','시전동\r\n');
INSERT INTO postno VALUES (5479,'555-040','전남','여천시','선원동\r\n');
INSERT INTO postno VALUES (5480,'555-050','전남','여천시','안산동\r\n');
INSERT INTO postno VALUES (5481,'555-060','전남','여천시','소호동\r\n');
INSERT INTO postno VALUES (5482,'555-070','전남','여천시','웅천동\r\n');
INSERT INTO postno VALUES (5483,'555-080','전남','여천시','봉계동\r\n');
INSERT INTO postno VALUES (5484,'555-090','전남','여천시','여천동\r\n');
INSERT INTO postno VALUES (5485,'555-100','전남','여천시','학룡동\r\n');
INSERT INTO postno VALUES (5486,'555-110','전남','여천시','화장동\r\n');
INSERT INTO postno VALUES (5487,'555-120','전남','여천시','해산동\r\n');
INSERT INTO postno VALUES (5488,'555-130','전남','여천시','주삼동\r\n');
INSERT INTO postno VALUES (5489,'555-200','전남','여천시','중흥동\r\n');
INSERT INTO postno VALUES (5490,'555-205','전남','여천시','중흥동 삼간도\r\n');
INSERT INTO postno VALUES (5491,'555-210','전남','여천시','평려동\r\n');
INSERT INTO postno VALUES (5492,'555-220','전남','여천시','호명동\r\n');
INSERT INTO postno VALUES (5493,'555-230','전남','여천시','상암동\r\n');
INSERT INTO postno VALUES (5494,'555-240','전남','여천시','신덕동\r\n');
INSERT INTO postno VALUES (5495,'555-250','전남','여천시','낙포동\r\n');
INSERT INTO postno VALUES (5496,'555-260','전남','여천시','월내동\r\n');
INSERT INTO postno VALUES (5497,'555-270','전남','여천시','적량동\r\n');
INSERT INTO postno VALUES (5498,'555-280','전남','여천시','화치동\r\n');
INSERT INTO postno VALUES (5499,'555-290','전남','여천시','월하동\r\n');
INSERT INTO postno VALUES (5500,'555-300','전남','여천시','묘도동\r\n');
INSERT INTO postno VALUES (5501,'555-701','전남','여천시','학동 여천시청\r\n');
INSERT INTO postno VALUES (5502,'556-810','전남','여천군','소라면\r\n');
INSERT INTO postno VALUES (5503,'556-820','전남','여천군','화양면\r\n');
INSERT INTO postno VALUES (5504,'556-830','전남','여천군','화정면\r\n');
INSERT INTO postno VALUES (5505,'556-835','전남','여천군','화정면 여자리\r\n');
INSERT INTO postno VALUES (5506,'556-837','전남','여천군','화정면 개도리\r\n');
INSERT INTO postno VALUES (5507,'556-840','전남','여천군','남면\r\n');
INSERT INTO postno VALUES (5508,'556-843','전남','여천군','남면 두다리\r\n');
INSERT INTO postno VALUES (5509,'556-843','전남','여천군','남면 화태리\r\n');
INSERT INTO postno VALUES (5510,'556-843','전남','여천군','남면 횡간리\r\n');
INSERT INTO postno VALUES (5511,'556-845','전남','여천군','남면 안도리\r\n');
INSERT INTO postno VALUES (5512,'556-847','전남','여천군','남면 연도리\r\n');
INSERT INTO postno VALUES (5513,'556-850','전남','여천군','삼산면\r\n');
INSERT INTO postno VALUES (5514,'556-855','전남','여천군','삼산면 손죽리\r\n');
INSERT INTO postno VALUES (5515,'556-857','전남','여천군','삼산면 대동리\r\n');
INSERT INTO postno VALUES (5516,'556-857','전남','여천군','삼산면 의성리\r\n');
INSERT INTO postno VALUES (5517,'556-857','전남','여천군','삼산면 진막리\r\n');
INSERT INTO postno VALUES (5518,'556-890','전남','여천군','율촌면\r\n');
INSERT INTO postno VALUES (5519,'556-900','전남','여천군','돌산읍\r\n');
INSERT INTO postno VALUES (5520,'556-907','전남','여천군','돌산읍 금복리 금죽도\r\n');
INSERT INTO postno VALUES (5521,'556-907','전남','여천군','돌산읍 금복리 우두리\r\n');
INSERT INTO postno VALUES (5522,'560-010','전북','전주시','완산구 중앙동\r\n');
INSERT INTO postno VALUES (5523,'560-020','전북','전주시','완산구 경원동\r\n');
INSERT INTO postno VALUES (5524,'560-030','전북','전주시','완산구 풍남동\r\n');
INSERT INTO postno VALUES (5525,'560-040','전북','전주시','완산구 전동\r\n');
INSERT INTO postno VALUES (5526,'560-050','전북','전주시','완산구 다가동\r\n');
INSERT INTO postno VALUES (5527,'560-060','전북','전주시','완산구 고사동\r\n');
INSERT INTO postno VALUES (5528,'560-070','전북','전주시','완산구 교동\r\n');
INSERT INTO postno VALUES (5529,'560-080','전북','전주시','완산구 태평동\r\n');
INSERT INTO postno VALUES (5530,'560-100','전북','전주시','완산구 중노송동\r\n');
INSERT INTO postno VALUES (5531,'560-101','전북','전주시','완산구 중노송1가동\r\n');
INSERT INTO postno VALUES (5532,'560-102','전북','전주시','완산구 중노송2가동\r\n');
INSERT INTO postno VALUES (5533,'560-110','전북','전주시','완산구 남노송동\r\n');
INSERT INTO postno VALUES (5534,'560-120','전북','전주시','완산구 동서학동\r\n');
INSERT INTO postno VALUES (5535,'560-130','전북','전주시','완산구 서서학동\r\n');
INSERT INTO postno VALUES (5536,'560-140','전북','전주시','완산구 동완산동\r\n');
INSERT INTO postno VALUES (5537,'560-150','전북','전주시','완산구 서완산동\r\n');
INSERT INTO postno VALUES (5538,'560-170','전북','전주시','완산구 서신동\r\n');
INSERT INTO postno VALUES (5539,'560-240','전북','전주시','완산구 효자동\r\n');
INSERT INTO postno VALUES (5540,'560-241','전북','전주시','완산구 효자1동\r\n');
INSERT INTO postno VALUES (5541,'560-242','전북','전주시','완산구 효자2동\r\n');
INSERT INTO postno VALUES (5542,'560-243','전북','전주시','완산구 효자3동\r\n');
INSERT INTO postno VALUES (5543,'560-244','전북','전주시','완산구 효자4동\r\n');
INSERT INTO postno VALUES (5544,'560-250','전북','전주시','완산구 중화산동\r\n');
INSERT INTO postno VALUES (5545,'560-251','전북','전주시','완산구 중화산1동\r\n');
INSERT INTO postno VALUES (5546,'560-252','전북','전주시','완산구 중화산2동\r\n');
INSERT INTO postno VALUES (5547,'560-260','전북','전주시','완산구 대성동\r\n');
INSERT INTO postno VALUES (5548,'560-270','전북','전주시','완산구 색장동\r\n');
INSERT INTO postno VALUES (5549,'560-280','전북','전주시','완산구 평화동\r\n');
INSERT INTO postno VALUES (5550,'560-285','전북','전주시','완산구 석구동\r\n');
INSERT INTO postno VALUES (5551,'560-287','전북','전주시','완산구 원당동\r\n');
INSERT INTO postno VALUES (5552,'560-290','전북','전주시','완산구 삼천동\r\n');
INSERT INTO postno VALUES (5553,'560-291','전북','전주시','완산구 삼천1동\r\n');
INSERT INTO postno VALUES (5554,'560-292','전북','전주시','완산구 삼천2동\r\n');
INSERT INTO postno VALUES (5555,'560-293','전북','전주시','완산구 삼천3동\r\n');
INSERT INTO postno VALUES (5556,'560-295','전북','전주시','완산구 중인동\r\n');
INSERT INTO postno VALUES (5557,'560-297','전북','전주시','완산구 용복동\r\n');
INSERT INTO postno VALUES (5558,'560-500','전북','전주시','완산구 중동\r\n');
INSERT INTO postno VALUES (5559,'560-510','전북','전주시','완산구 상림동\r\n');
INSERT INTO postno VALUES (5560,'560-600','전북','전주시','완산구 전주우체국사서함\r\n');
INSERT INTO postno VALUES (5561,'560-701','전북','전주시','완산구 기전여자전문대학\r\n');
INSERT INTO postno VALUES (5562,'560-728','전북','전주시','덕진구 전주문화방송국\r\n');
INSERT INTO postno VALUES (5563,'560-750','전북','전주시','완산구 전주예수병원\r\n');
INSERT INTO postno VALUES (5564,'560-757','전북','전주시','완산구 전주교육대학교\r\n');
INSERT INTO postno VALUES (5565,'560-759','전북','전주시','완산구 효자3동 전주대학교\r\n');
INSERT INTO postno VALUES (5566,'560-760','전북','전주시','완산구 전주공업전문대학\r\n');
INSERT INTO postno VALUES (5567,'560-761','전북','전주시','완산구 중앙동 전라북도청\r\n');
INSERT INTO postno VALUES (5568,'561-090','전북','전주시','덕진구 서노송동\r\n');
INSERT INTO postno VALUES (5569,'561-160','전북','전주시','덕진구 진북동\r\n');
INSERT INTO postno VALUES (5570,'561-161','전북','전주시','덕진구 진북1동\r\n');
INSERT INTO postno VALUES (5571,'561-162','전북','전주시','덕진구 진북2동\r\n');
INSERT INTO postno VALUES (5572,'561-180','전북','전주시','덕진구 금암동\r\n');
INSERT INTO postno VALUES (5573,'561-181','전북','전주시','덕진구 금암1동\r\n');
INSERT INTO postno VALUES (5574,'561-182','전북','전주시','덕진구 금암2동\r\n');
INSERT INTO postno VALUES (5575,'561-190','전북','전주시','덕진구 덕진동\r\n');
INSERT INTO postno VALUES (5576,'561-200','전북','전주시','덕진구 팔복동\r\n');
INSERT INTO postno VALUES (5577,'561-210','전북','전주시','덕진구 호성동\r\n');
INSERT INTO postno VALUES (5578,'561-220','전북','전주시','덕진구 우아동\r\n');
INSERT INTO postno VALUES (5579,'561-221','전북','전주시','덕진구 우아1동\r\n');
INSERT INTO postno VALUES (5580,'561-222','전북','전주시','덕진구 우아2동\r\n');
INSERT INTO postno VALUES (5581,'561-225','전북','전주시','덕진구 산정동\r\n');
INSERT INTO postno VALUES (5582,'561-227','전북','전주시','덕진구 금상동\r\n');
INSERT INTO postno VALUES (5583,'561-230','전북','전주시','덕진구 인후동\r\n');
INSERT INTO postno VALUES (5584,'561-231','전북','전주시','덕진구 인후1동\r\n');
INSERT INTO postno VALUES (5585,'561-232','전북','전주시','덕진구 인후2동\r\n');
INSERT INTO postno VALUES (5586,'561-233','전북','전주시','덕진구 인후3동\r\n');
INSERT INTO postno VALUES (5587,'561-300','전북','전주시','덕진구 송천동\r\n');
INSERT INTO postno VALUES (5588,'561-301','전북','전주시','덕진구 송천1동\r\n');
INSERT INTO postno VALUES (5589,'561-302','전북','전주시','덕진구 송천2동\r\n');
INSERT INTO postno VALUES (5590,'561-310','전북','전주시','덕진구 전미동\r\n');
INSERT INTO postno VALUES (5591,'561-320','전북','전주시','덕진구 동산동\r\n');
INSERT INTO postno VALUES (5592,'561-330','전북','전주시','덕진구 여의동\r\n');
INSERT INTO postno VALUES (5593,'561-340','전북','전주시','덕진구 고랑동\r\n');
INSERT INTO postno VALUES (5594,'561-350','전북','전주시','덕진구 만성동\r\n');
INSERT INTO postno VALUES (5595,'561-360','전북','전주시','덕진구 장동\r\n');
INSERT INTO postno VALUES (5596,'561-370','전북','전주시','덕진구 반월동\r\n');
INSERT INTO postno VALUES (5597,'561-380','전북','전주시','덕진구 용정동\r\n');
INSERT INTO postno VALUES (5598,'561-390','전북','전주시','덕진구 성덕동\r\n');
INSERT INTO postno VALUES (5599,'561-400','전북','전주시','덕진구 화전동\r\n');
INSERT INTO postno VALUES (5600,'561-410','전북','전주시','덕진구 원동\r\n');
INSERT INTO postno VALUES (5601,'561-420','전북','전주시','덕진구 강흥동\r\n');
INSERT INTO postno VALUES (5602,'561-430','전북','전주시','덕진구 남정동\r\n');
INSERT INTO postno VALUES (5603,'561-440','전북','전주시','덕진구 도덕동\r\n');
INSERT INTO postno VALUES (5604,'561-450','전북','전주시','덕진구 도도동\r\n');
INSERT INTO postno VALUES (5605,'561-705','전북','전주시','덕진구 전주지방검찰청\r\n');
INSERT INTO postno VALUES (5606,'561-711','전북','전주시','덕진구 금암1동 전주은행빌딩\r\n');
INSERT INTO postno VALUES (5607,'561-712','전북','전주시','덕진구 금암2동 전주대학병원\r\n');
INSERT INTO postno VALUES (5608,'561-756','전북','전주시','덕진구 덕진동 전북대학교\r\n');
INSERT INTO postno VALUES (5609,'561-758','전북','전주시','덕진구 덕진동 전주지방법원\r\n');
INSERT INTO postno VALUES (5610,'561-762','전북','전주시','덕진구 전북일보사건물\r\n');
INSERT INTO postno VALUES (5611,'561-790','전북','전주시','덕진구 한국방송공사전주방송\r\n');
INSERT INTO postno VALUES (5612,'561-701','전북','완주군','삼례읍 전주우석대학교\r\n');
INSERT INTO postno VALUES (5613,'565-800','전북','완주군','삼례읍\r\n');
INSERT INTO postno VALUES (5614,'565-810','전북','완주군','용진면\r\n');
INSERT INTO postno VALUES (5615,'565-820','전북','완주군','구이면\r\n');
INSERT INTO postno VALUES (5616,'565-830','전북','완주군','상관면\r\n');
INSERT INTO postno VALUES (5617,'565-840','전북','완주군','소양면\r\n');
INSERT INTO postno VALUES (5618,'565-850','전북','완주군','이서면\r\n');
INSERT INTO postno VALUES (5619,'565-860','전북','완주군','고산면\r\n');
INSERT INTO postno VALUES (5620,'565-870','전북','완주군','비봉면\r\n');
INSERT INTO postno VALUES (5621,'565-880','전북','완주군','화산면\r\n');
INSERT INTO postno VALUES (5622,'565-890','전북','완주군','동상면\r\n');
INSERT INTO postno VALUES (5623,'565-900','전북','완주군','봉동읍\r\n');
INSERT INTO postno VALUES (5624,'565-910','전북','완주군','운주면\r\n');
INSERT INTO postno VALUES (5625,'565-920','전북','완주군','경천면\r\n');
INSERT INTO postno VALUES (5626,'566-800','전북','임실군','임실읍\r\n');
INSERT INTO postno VALUES (5627,'566-810','전북','임실군','관촌면\r\n');
INSERT INTO postno VALUES (5628,'566-820','전북','임실군','신평면\r\n');
INSERT INTO postno VALUES (5629,'566-830','전북','임실군','신덕면\r\n');
INSERT INTO postno VALUES (5630,'566-840','전북','임실군','운암면\r\n');
INSERT INTO postno VALUES (5631,'566-843','전북','임실군','운암면 금기리\r\n');
INSERT INTO postno VALUES (5632,'566-843','전북','임실군','운암면 마암리\r\n');
INSERT INTO postno VALUES (5633,'566-843','전북','임실군','운암면 운암리\r\n');
INSERT INTO postno VALUES (5634,'566-843','전북','임실군','운암면 운정리\r\n');
INSERT INTO postno VALUES (5635,'566-843','전북','임실군','운암면 운종리\r\n');
INSERT INTO postno VALUES (5636,'566-845','전북','임실군','운암면 선거리\r\n');
INSERT INTO postno VALUES (5637,'566-847','전북','임실군','운암면 광석리\r\n');
INSERT INTO postno VALUES (5638,'566-847','전북','임실군','운암면 학암리\r\n');
INSERT INTO postno VALUES (5639,'566-850','전북','임실군','청웅면\r\n');
INSERT INTO postno VALUES (5640,'566-860','전북','임실군','강진면\r\n');
INSERT INTO postno VALUES (5641,'566-870','전북','임실군','덕치면\r\n');
INSERT INTO postno VALUES (5642,'566-880','전북','임실군','성수면\r\n');
INSERT INTO postno VALUES (5643,'566-890','전북','임실군','오수면\r\n');
INSERT INTO postno VALUES (5644,'566-910','전북','임실군','삼계면\r\n');
INSERT INTO postno VALUES (5645,'566-920','전북','임실군','지사면\r\n');
INSERT INTO postno VALUES (5646,'567-800','전북','진안군','진안읍\r\n');
INSERT INTO postno VALUES (5647,'567-810','전북','진안군','상전면\r\n');
INSERT INTO postno VALUES (5648,'567-820','전북','진안군','정천면\r\n');
INSERT INTO postno VALUES (5649,'567-830','전북','진안군','주천면\r\n');
INSERT INTO postno VALUES (5650,'567-840','전북','진안군','용담면\r\n');
INSERT INTO postno VALUES (5651,'567-850','전북','진안군','안천면\r\n');
INSERT INTO postno VALUES (5652,'567-860','전북','진안군','동향면\r\n');
INSERT INTO postno VALUES (5653,'567-870','전북','진안군','마령면\r\n');
INSERT INTO postno VALUES (5654,'567-880','전북','진안군','백운면\r\n');
INSERT INTO postno VALUES (5655,'567-890','전북','진안군','성수면\r\n');
INSERT INTO postno VALUES (5656,'567-910','전북','진안군','부귀면\r\n');
INSERT INTO postno VALUES (5657,'568-800','전북','무주군','무주읍\r\n');
INSERT INTO postno VALUES (5658,'568-810','전북','무주군','설천면\r\n');
INSERT INTO postno VALUES (5659,'568-815','전북','무주군','설천면 삼공리\r\n');
INSERT INTO postno VALUES (5660,'568-815','전북','무주군','설천면 심곡리\r\n');
INSERT INTO postno VALUES (5661,'568-820','전북','무주군','무풍면\r\n');
INSERT INTO postno VALUES (5662,'568-825','전북','무주군','무풍면 삼거리\r\n');
INSERT INTO postno VALUES (5663,'568-830','전북','무주군','적상면\r\n');
INSERT INTO postno VALUES (5664,'568-840','전북','무주군','안성면\r\n');
INSERT INTO postno VALUES (5665,'568-850','전북','무주군','부남면\r\n');
INSERT INTO postno VALUES (5666,'570-010','전북','익산시','평화동\r\n');
INSERT INTO postno VALUES (5667,'570-020','전북','익산시','창인동\r\n');
INSERT INTO postno VALUES (5668,'570-021','전북','익산시','창인1가\r\n');
INSERT INTO postno VALUES (5669,'570-022','전북','익산시','창인2가\r\n');
INSERT INTO postno VALUES (5670,'570-030','전북','익산시','갈산동\r\n');
INSERT INTO postno VALUES (5671,'570-040','전북','익산시','주현동\r\n');
INSERT INTO postno VALUES (5672,'570-050','전북','익산시','인화동\r\n');
INSERT INTO postno VALUES (5673,'570-051','전북','익산시','인화1가\r\n');
INSERT INTO postno VALUES (5674,'570-052','전북','익산시','인화2가\r\n');
INSERT INTO postno VALUES (5675,'570-060','전북','익산시','동산동\r\n');
INSERT INTO postno VALUES (5676,'570-070','전북','익산시','석탄동\r\n');
INSERT INTO postno VALUES (5677,'570-080','전북','익산시','송학동\r\n');
INSERT INTO postno VALUES (5678,'570-090','전북','익산시','모현동\r\n');
INSERT INTO postno VALUES (5679,'570-091','전북','익산시','모현1가\r\n');
INSERT INTO postno VALUES (5680,'570-092','전북','익산시','모현2가\r\n');
INSERT INTO postno VALUES (5681,'570-100','전북','익산시','남중동\r\n');
INSERT INTO postno VALUES (5682,'570-101','전북','익산시','남중1가\r\n');
INSERT INTO postno VALUES (5683,'570-102','전북','익산시','남중2가\r\n');
INSERT INTO postno VALUES (5684,'570-110','전북','익산시','마동\r\n');
INSERT INTO postno VALUES (5685,'570-120','전북','익산시','중앙동\r\n');
INSERT INTO postno VALUES (5686,'570-121','전북','익산시','중앙1가\r\n');
INSERT INTO postno VALUES (5687,'570-122','전북','익산시','중앙2가\r\n');
INSERT INTO postno VALUES (5688,'570-123','전북','익산시','중앙3가\r\n');
INSERT INTO postno VALUES (5689,'570-130','전북','익산시','목천동\r\n');
INSERT INTO postno VALUES (5690,'570-140','전북','익산시','신흥동\r\n');
INSERT INTO postno VALUES (5691,'570-150','전북','익산시','금강동\r\n');
INSERT INTO postno VALUES (5692,'570-160','전북','익산시','영등동\r\n');
INSERT INTO postno VALUES (5693,'570-170','전북','익산시','신동\r\n');
INSERT INTO postno VALUES (5694,'570-180','전북','익산시','신용동\r\n');
INSERT INTO postno VALUES (5695,'570-190','전북','익산시','현영동\r\n');
INSERT INTO postno VALUES (5696,'570-200','전북','익산시','만석동\r\n');
INSERT INTO postno VALUES (5697,'570-210','전북','익산시','어양동\r\n');
INSERT INTO postno VALUES (5698,'570-300','전북','익산시','팔봉동\r\n');
INSERT INTO postno VALUES (5699,'570-310','전북','익산시','덕기동\r\n');
INSERT INTO postno VALUES (5700,'570-320','전북','익산시','석왕동\r\n');
INSERT INTO postno VALUES (5701,'570-330','전북','익산시','석암동\r\n');
INSERT INTO postno VALUES (5702,'570-340','전북','익산시','은기동\r\n');
INSERT INTO postno VALUES (5703,'570-350','전북','익산시','용제동\r\n');
INSERT INTO postno VALUES (5704,'570-360','전북','익산시','부송동\r\n');
INSERT INTO postno VALUES (5705,'570-370','전북','익산시','정족동\r\n');
INSERT INTO postno VALUES (5706,'570-380','전북','익산시','임상동\r\n');
INSERT INTO postno VALUES (5707,'570-390','전북','익산시','월성동\r\n');
INSERT INTO postno VALUES (5708,'570-600','전북','익산시','이리우체국사서함\r\n');
INSERT INTO postno VALUES (5709,'570-711','전북','익산시','신용동 원광대학병원\r\n');
INSERT INTO postno VALUES (5710,'570-749','전북','익산시','신용동 원광대학교\r\n');
INSERT INTO postno VALUES (5711,'570-750','전북','익산시','신용동 원광보건전문대학\r\n');
INSERT INTO postno VALUES (5712,'570-751','전북','익산시','남중2가 이리지방국토관리청\r\n');
INSERT INTO postno VALUES (5713,'570-752','전북','익산시','마동 이리농공전문대학\r\n');
INSERT INTO postno VALUES (5714,'570-753','전북','익산시','남중1가 익산시청\r\n');
INSERT INTO postno VALUES (5715,'570-754','전북','익산시','신용동 원불교중앙총부건물\r\n');
INSERT INTO postno VALUES (5716,'570-800','전북','익산시','함열읍\r\n');
INSERT INTO postno VALUES (5717,'570-810','전북','익산시','황등면\r\n');
INSERT INTO postno VALUES (5718,'570-820','전북','익산시','삼기면\r\n');
INSERT INTO postno VALUES (5719,'570-830','전북','익산시','웅포면\r\n');
INSERT INTO postno VALUES (5720,'570-840','전북','익산시','함라면\r\n');
INSERT INTO postno VALUES (5721,'570-850','전북','익산시','성당면\r\n');
INSERT INTO postno VALUES (5722,'570-860','전북','익산시','용안면\r\n');
INSERT INTO postno VALUES (5723,'570-870','전북','익산시','용동면\r\n');
INSERT INTO postno VALUES (5724,'570-880','전북','익산시','망성면\r\n');
INSERT INTO postno VALUES (5725,'570-890','전북','익산시','낭산면\r\n');
INSERT INTO postno VALUES (5726,'570-910','전북','익산시','금마면\r\n');
INSERT INTO postno VALUES (5727,'570-920','전북','익산시','오산면\r\n');
INSERT INTO postno VALUES (5728,'570-930','전북','익산시','여산면\r\n');
INSERT INTO postno VALUES (5729,'570-940','전북','익산시','왕궁면\r\n');
INSERT INTO postno VALUES (5730,'570-950','전북','익산시','춘포면\r\n');
INSERT INTO postno VALUES (5731,'573-010','전북','군산시','해망동\r\n');
INSERT INTO postno VALUES (5732,'573-020','전북','군산시','영화동\r\n');
INSERT INTO postno VALUES (5733,'573-030','전북','군산시','장미동\r\n');
INSERT INTO postno VALUES (5734,'573-041','전북','군산시','중앙로1가\r\n');
INSERT INTO postno VALUES (5735,'573-042','전북','군산시','중앙로2가\r\n');
INSERT INTO postno VALUES (5736,'573-043','전북','군산시','중앙로3가\r\n');
INSERT INTO postno VALUES (5737,'573-050','전북','군산시','신창동\r\n');
INSERT INTO postno VALUES (5738,'573-060','전북','군산시','월명동\r\n');
INSERT INTO postno VALUES (5739,'573-070','전북','군산시','개복동\r\n');
INSERT INTO postno VALUES (5740,'573-080','전북','군산시','명산동\r\n');
INSERT INTO postno VALUES (5741,'573-090','전북','군산시','송창동\r\n');
INSERT INTO postno VALUES (5742,'573-100','전북','군산시','금광동\r\n');
INSERT INTO postno VALUES (5743,'573-110','전북','군산시','오룡동\r\n');
INSERT INTO postno VALUES (5744,'573-120','전북','군산시','송풍동\r\n');
INSERT INTO postno VALUES (5745,'573-130','전북','군산시','신풍동\r\n');
INSERT INTO postno VALUES (5746,'573-140','전북','군산시','문화동\r\n');
INSERT INTO postno VALUES (5747,'573-150','전북','군산시','선양동\r\n');
INSERT INTO postno VALUES (5748,'573-160','전북','군산시','창성동\r\n');
INSERT INTO postno VALUES (5749,'573-170','전북','군산시','둔율동\r\n');
INSERT INTO postno VALUES (5750,'573-180','전북','군산시','미원동\r\n');
INSERT INTO postno VALUES (5751,'573-190','전북','군산시','서흥남동\r\n');
INSERT INTO postno VALUES (5752,'573-200','전북','군산시','동흥남동\r\n');
INSERT INTO postno VALUES (5753,'573-210','전북','군산시','대명동\r\n');
INSERT INTO postno VALUES (5754,'573-220','전북','군산시','장재동\r\n');
INSERT INTO postno VALUES (5755,'573-230','전북','군산시','영동\r\n');
INSERT INTO postno VALUES (5756,'573-240','전북','군산시','평화동\r\n');
INSERT INTO postno VALUES (5757,'573-250','전북','군산시','신영동\r\n');
INSERT INTO postno VALUES (5758,'573-260','전북','군산시','죽성동\r\n');
INSERT INTO postno VALUES (5759,'573-270','전북','군산시','금암동\r\n');
INSERT INTO postno VALUES (5760,'573-280','전북','군산시','중동\r\n');
INSERT INTO postno VALUES (5761,'573-290','전북','군산시','신흥동\r\n');
INSERT INTO postno VALUES (5762,'573-300','전북','군산시','금동\r\n');
INSERT INTO postno VALUES (5763,'573-310','전북','군산시','삼학동\r\n');
INSERT INTO postno VALUES (5764,'573-320','전북','군산시','경암동\r\n');
INSERT INTO postno VALUES (5765,'573-330','전북','군산시','구암동\r\n');
INSERT INTO postno VALUES (5766,'573-340','전북','군산시','내흥동\r\n');
INSERT INTO postno VALUES (5767,'573-350','전북','군산시','나운동\r\n');
INSERT INTO postno VALUES (5768,'573-351','전북','군산시','나운1동\r\n');
INSERT INTO postno VALUES (5769,'573-352','전북','군산시','나운2동\r\n');
INSERT INTO postno VALUES (5770,'573-360','전북','군산시','미룡동\r\n');
INSERT INTO postno VALUES (5771,'573-370','전북','군산시','수송동\r\n');
INSERT INTO postno VALUES (5772,'573-380','전북','군산시','미장동\r\n');
INSERT INTO postno VALUES (5773,'573-390','전북','군산시','지곡동\r\n');
INSERT INTO postno VALUES (5774,'573-400','전북','군산시','소룡동\r\n');
INSERT INTO postno VALUES (5775,'573-410','전북','군산시','조촌동\r\n');
INSERT INTO postno VALUES (5776,'573-420','전북','군산시','경장동\r\n');
INSERT INTO postno VALUES (5777,'573-430','전북','군산시','사정동\r\n');
INSERT INTO postno VALUES (5778,'573-440','전북','군산시','개정동\r\n');
INSERT INTO postno VALUES (5779,'573-450','전북','군산시','비웅도동\r\n');
INSERT INTO postno VALUES (5780,'573-500','전북','군산시','산북동\r\n');
INSERT INTO postno VALUES (5781,'573-510','전북','군산시','신관동\r\n');
INSERT INTO postno VALUES (5782,'573-520','전북','군산시','개사동\r\n');
INSERT INTO postno VALUES (5783,'573-530','전북','군산시','내초도동\r\n');
INSERT INTO postno VALUES (5784,'573-540','전북','군산시','오식도동\r\n');
INSERT INTO postno VALUES (5785,'573-600','전북','군산시','군산우체국사서함\r\n');
INSERT INTO postno VALUES (5786,'573-701','전북','군산시','미룡동 군산대학교\r\n');
INSERT INTO postno VALUES (5787,'573-702','전북','군산시','군산대학교해양산업대학\r\n');
INSERT INTO postno VALUES (5788,'573-703','전북','군산시','중앙로1가 군산시청\r\n');
INSERT INTO postno VALUES (5789,'573-704','전북','군산시','경암동 군산경찰서\r\n');
INSERT INTO postno VALUES (5790,'573-706','전북','군산시','전주지방검찰청군산지청\r\n');
INSERT INTO postno VALUES (5791,'573-707','전북','군산시','조촌동 전주지방법원군산지원\r\n');
INSERT INTO postno VALUES (5792,'573-708','전북','군산시','옥구읍 군산교도소\r\n');
INSERT INTO postno VALUES (5793,'573-810','전북','군산시','옥도면\r\n');
INSERT INTO postno VALUES (5794,'573-813','전북','군산시','옥도면 어청도\r\n');
INSERT INTO postno VALUES (5795,'573-815','전북','군산시','옥도면 선유도\r\n');
INSERT INTO postno VALUES (5796,'573-815','전북','군산시','옥도면 장자도\r\n');
INSERT INTO postno VALUES (5797,'573-815','전북','군산시','옥도면 무녀도\r\n');
INSERT INTO postno VALUES (5798,'573-820','전북','군산시','옥산면\r\n');
INSERT INTO postno VALUES (5799,'573-830','전북','군산시','회현면\r\n');
INSERT INTO postno VALUES (5800,'573-840','전북','군산시','성산면\r\n');
INSERT INTO postno VALUES (5801,'573-850','전북','군산시','나포면\r\n');
INSERT INTO postno VALUES (5802,'573-900','전북','군산시','옥구읍\r\n');
INSERT INTO postno VALUES (5803,'573-910','전북','군산시','대야면\r\n');
INSERT INTO postno VALUES (5804,'573-920','전북','군산시','개정면\r\n');
INSERT INTO postno VALUES (5805,'573-930','전북','군산시','임피면\r\n');
INSERT INTO postno VALUES (5806,'573-940','전북','군산시','서수면\r\n');
INSERT INTO postno VALUES (5807,'573-950','전북','군산시','옥서면\r\n');
INSERT INTO postno VALUES (5808,'576-010','전북','김제시','요촌동\r\n');
INSERT INTO postno VALUES (5809,'576-020','전북','김제시','신풍동\r\n');
INSERT INTO postno VALUES (5810,'576-030','전북','김제시','용동\r\n');
INSERT INTO postno VALUES (5811,'576-040','전북','김제시','교동\r\n');
INSERT INTO postno VALUES (5812,'576-050','전북','김제시','옥산동\r\n');
INSERT INTO postno VALUES (5813,'576-060','전북','김제시','갈공동\r\n');
INSERT INTO postno VALUES (5814,'576-070','전북','김제시','복죽동\r\n');
INSERT INTO postno VALUES (5815,'576-080','전북','김제시','검산동\r\n');
INSERT INTO postno VALUES (5816,'576-090','전북','김제시','순동\r\n');
INSERT INTO postno VALUES (5817,'576-100','전북','김제시','백학동\r\n');
INSERT INTO postno VALUES (5818,'576-110','전북','김제시','상동동\r\n');
INSERT INTO postno VALUES (5819,'576-120','전북','김제시','서암동\r\n');
INSERT INTO postno VALUES (5820,'576-130','전북','김제시','신곡동\r\n');
INSERT INTO postno VALUES (5821,'576-140','전북','김제시','하동\r\n');
INSERT INTO postno VALUES (5822,'576-150','전북','김제시','홍사동\r\n');
INSERT INTO postno VALUES (5823,'576-160','전북','김제시','난봉동\r\n');
INSERT INTO postno VALUES (5824,'576-170','전북','김제시','황산동\r\n');
INSERT INTO postno VALUES (5825,'576-180','전북','김제시','오정동\r\n');
INSERT INTO postno VALUES (5826,'576-190','전북','김제시','월성동\r\n');
INSERT INTO postno VALUES (5827,'576-200','전북','김제시','서정동\r\n');
INSERT INTO postno VALUES (5828,'576-210','전북','김제시','양전동\r\n');
INSERT INTO postno VALUES (5829,'576-220','전북','김제시','도장동\r\n');
INSERT INTO postno VALUES (5830,'576-300','전북','김제시','입석동\r\n');
INSERT INTO postno VALUES (5831,'576-310','전북','김제시','장화동\r\n');
INSERT INTO postno VALUES (5832,'576-320','전북','김제시','월봉동\r\n');
INSERT INTO postno VALUES (5833,'576-330','전북','김제시','신월동\r\n');
INSERT INTO postno VALUES (5834,'576-340','전북','김제시','제월동\r\n');
INSERT INTO postno VALUES (5835,'576-350','전북','김제시','연정동\r\n');
INSERT INTO postno VALUES (5836,'576-360','전북','김제시','신덕동\r\n');
INSERT INTO postno VALUES (5837,'576-370','전북','김제시','명덕동\r\n');
INSERT INTO postno VALUES (5838,'576-820','전북','김제시','부량면\r\n');
INSERT INTO postno VALUES (5839,'576-830','전북','김제시','죽산면\r\n');
INSERT INTO postno VALUES (5840,'576-840','전북','김제시','성덕면\r\n');
INSERT INTO postno VALUES (5841,'576-850','전북','김제시','광활면\r\n');
INSERT INTO postno VALUES (5842,'576-860','전북','김제시','만경면\r\n');
INSERT INTO postno VALUES (5843,'576-870','전북','김제시','진봉면\r\n');
INSERT INTO postno VALUES (5844,'576-880','전북','김제시','백산면\r\n');
INSERT INTO postno VALUES (5845,'576-890','전북','김제시','청하면\r\n');
INSERT INTO postno VALUES (5846,'576-910','전북','김제시','백구면\r\n');
INSERT INTO postno VALUES (5847,'576-920','전북','김제시','공덕면\r\n');
INSERT INTO postno VALUES (5848,'576-930','전북','김제시','황산면\r\n');
INSERT INTO postno VALUES (5849,'576-940','전북','김제시','금구면\r\n');
INSERT INTO postno VALUES (5850,'576-950','전북','김제시','봉남면\r\n');
INSERT INTO postno VALUES (5851,'576-960','전북','김제시','금산면\r\n');
INSERT INTO postno VALUES (5852,'576-970','전북','김제시','용지면\r\n');
INSERT INTO postno VALUES (5853,'579-800','전북','부안군','부안읍\r\n');
INSERT INTO postno VALUES (5854,'579-810','전북','부안군','동진면\r\n');
INSERT INTO postno VALUES (5855,'579-820','전북','부안군','계화면\r\n');
INSERT INTO postno VALUES (5856,'579-830','전북','부안군','행안면\r\n');
INSERT INTO postno VALUES (5857,'579-840','전북','부안군','하서면\r\n');
INSERT INTO postno VALUES (5858,'579-850','전북','부안군','변산면\r\n');
INSERT INTO postno VALUES (5859,'579-855','전북','부안군','변산면 격포리\r\n');
INSERT INTO postno VALUES (5860,'579-855','전북','부안군','변산면 도청리\r\n');
INSERT INTO postno VALUES (5861,'579-855','전북','부안군','변산면 마포리\r\n');
INSERT INTO postno VALUES (5862,'579-860','전북','부안군','상서면\r\n');
INSERT INTO postno VALUES (5863,'579-870','전북','부안군','보안면\r\n');
INSERT INTO postno VALUES (5864,'579-880','전북','부안군','줄포면\r\n');
INSERT INTO postno VALUES (5865,'579-890','전북','부안군','진서면\r\n');
INSERT INTO postno VALUES (5866,'579-910','전북','부안군','위도면\r\n');
INSERT INTO postno VALUES (5867,'579-920','전북','부안군','주산면\r\n');
INSERT INTO postno VALUES (5868,'579-930','전북','부안군','백산면\r\n');
INSERT INTO postno VALUES (5869,'580-010','전북','정읍시','수성동\r\n');
INSERT INTO postno VALUES (5870,'580-020','전북','정읍시','하북동\r\n');
INSERT INTO postno VALUES (5871,'580-030','전북','정읍시','장명동\r\n');
INSERT INTO postno VALUES (5872,'580-040','전북','정읍시','구룡동\r\n');
INSERT INTO postno VALUES (5873,'580-050','전북','정읍시','상동\r\n');
INSERT INTO postno VALUES (5874,'580-060','전북','정읍시','시기동\r\n');
INSERT INTO postno VALUES (5875,'580-061','전북','정읍시','시기1동\r\n');
INSERT INTO postno VALUES (5876,'580-062','전북','정읍시','시기2동\r\n');
INSERT INTO postno VALUES (5877,'580-063','전북','정읍시','시기3동\r\n');
INSERT INTO postno VALUES (5878,'580-070','전북','정읍시','연지동\r\n');
INSERT INTO postno VALUES (5879,'580-080','전북','정읍시','영파동\r\n');
INSERT INTO postno VALUES (5880,'580-090','전북','정읍시','농소동\r\n');
INSERT INTO postno VALUES (5881,'580-100','전북','정읍시','망제동\r\n');
INSERT INTO postno VALUES (5882,'580-110','전북','정읍시','하모동\r\n');
INSERT INTO postno VALUES (5883,'580-120','전북','정읍시','상평동\r\n');
INSERT INTO postno VALUES (5884,'580-130','전북','정읍시','삼산동\r\n');
INSERT INTO postno VALUES (5885,'580-140','전북','정읍시','과교동\r\n');
INSERT INTO postno VALUES (5886,'580-150','전북','정읍시','진산동\r\n');
INSERT INTO postno VALUES (5887,'580-160','전북','정읍시','신월동\r\n');
INSERT INTO postno VALUES (5888,'580-170','전북','정읍시','교암동\r\n');
INSERT INTO postno VALUES (5889,'580-180','전북','정읍시','용산동\r\n');
INSERT INTO postno VALUES (5890,'580-185','전북','정읍시','신정동\r\n');
INSERT INTO postno VALUES (5891,'580-190','전북','정읍시','금붕동\r\n');
INSERT INTO postno VALUES (5892,'580-200','전북','정읍시','송산동\r\n');
INSERT INTO postno VALUES (5893,'580-210','전북','정읍시','부전동\r\n');
INSERT INTO postno VALUES (5894,'580-220','전북','정읍시','흑암동\r\n');
INSERT INTO postno VALUES (5895,'580-230','전북','정읍시','용계동\r\n');
INSERT INTO postno VALUES (5896,'580-240','전북','정읍시','공평동\r\n');
INSERT INTO postno VALUES (5897,'580-300','전북','정읍시','내장동\r\n');
INSERT INTO postno VALUES (5898,'580-310','전북','정읍시','쌍암동\r\n');
INSERT INTO postno VALUES (5899,'580-600','전북','정읍시','정주우체국사서함\r\n');
INSERT INTO postno VALUES (5900,'580-701','전북','정읍시','수성동 정읍시청\r\n');
INSERT INTO postno VALUES (5901,'580-810','전북','정읍시','북면\r\n');
INSERT INTO postno VALUES (5902,'580-820','전북','정읍시','정우면\r\n');
INSERT INTO postno VALUES (5903,'580-830','전북','정읍시','덕천면\r\n');
INSERT INTO postno VALUES (5904,'580-840','전북','정읍시','이평면\r\n');
INSERT INTO postno VALUES (5905,'580-850','전북','정읍시','영원면\r\n');
INSERT INTO postno VALUES (5906,'580-860','전북','정읍시','고부면\r\n');
INSERT INTO postno VALUES (5907,'580-870','전북','정읍시','소성면\r\n');
INSERT INTO postno VALUES (5908,'580-880','전북','정읍시','입암면\r\n');
INSERT INTO postno VALUES (5909,'580-890','전북','정읍시','산내면\r\n');
INSERT INTO postno VALUES (5910,'580-900','전북','정읍시','신태인읍\r\n');
INSERT INTO postno VALUES (5911,'580-910','전북','정읍시','감곡면\r\n');
INSERT INTO postno VALUES (5912,'580-920','전북','정읍시','태인면\r\n');
INSERT INTO postno VALUES (5913,'580-930','전북','정읍시','옹등면\r\n');
INSERT INTO postno VALUES (5914,'580-940','전북','정읍시','칠보면\r\n');
INSERT INTO postno VALUES (5915,'580-950','전북','정읍시','산외면\r\n');
INSERT INTO postno VALUES (5916,'585-800','전북','고창군','고창읍\r\n');
INSERT INTO postno VALUES (5917,'585-810','전북','고창군','성내면\r\n');
INSERT INTO postno VALUES (5918,'585-820','전북','고창군','흥덕면\r\n');
INSERT INTO postno VALUES (5919,'585-830','전북','고창군','신림면\r\n');
INSERT INTO postno VALUES (5920,'585-840','전북','고창군','고수면\r\n');
INSERT INTO postno VALUES (5921,'585-850','전북','고창군','성송면\r\n');
INSERT INTO postno VALUES (5922,'585-860','전북','고창군','대산면\r\n');
INSERT INTO postno VALUES (5923,'585-870','전북','고창군','공음면\r\n');
INSERT INTO postno VALUES (5924,'585-880','전북','고창군','무장면\r\n');
INSERT INTO postno VALUES (5925,'585-890','전북','고창군','해리면\r\n');
INSERT INTO postno VALUES (5926,'585-910','전북','고창군','상하면\r\n');
INSERT INTO postno VALUES (5927,'585-920','전북','고창군','심원면\r\n');
INSERT INTO postno VALUES (5928,'585-930','전북','고창군','아산면\r\n');
INSERT INTO postno VALUES (5929,'585-940','전북','고창군','부안면\r\n');
INSERT INTO postno VALUES (5930,'579-945','전북','고창군','부안면 봉암리 죽도\r\n');
INSERT INTO postno VALUES (5931,'590-010','전북','남원시','동충동\r\n');
INSERT INTO postno VALUES (5932,'590-020','전북','남원시','향교동\r\n');
INSERT INTO postno VALUES (5933,'590-030','전북','남원시','금동\r\n');
INSERT INTO postno VALUES (5934,'590-040','전북','남원시','조산동\r\n');
INSERT INTO postno VALUES (5935,'590-050','전북','남원시','하정동\r\n');
INSERT INTO postno VALUES (5936,'590-060','전북','남원시','죽항동\r\n');
INSERT INTO postno VALUES (5937,'590-070','전북','남원시','쌍교동\r\n');
INSERT INTO postno VALUES (5938,'590-080','전북','남원시','천거동\r\n');
INSERT INTO postno VALUES (5939,'590-090','전북','남원시','노암동\r\n');
INSERT INTO postno VALUES (5940,'590-100','전북','남원시','어현동\r\n');
INSERT INTO postno VALUES (5941,'590-110','전북','남원시','신촌동\r\n');
INSERT INTO postno VALUES (5942,'590-120','전북','남원시','왕정동\r\n');
INSERT INTO postno VALUES (5943,'590-130','전북','남원시','신정동\r\n');
INSERT INTO postno VALUES (5944,'590-140','전북','남원시','화정동\r\n');
INSERT INTO postno VALUES (5945,'590-150','전북','남원시','산곡동\r\n');
INSERT INTO postno VALUES (5946,'590-160','전북','남원시','내척동\r\n');
INSERT INTO postno VALUES (5947,'590-170','전북','남원시','광치동\r\n');
INSERT INTO postno VALUES (5948,'590-180','전북','남원시','용정동\r\n');
INSERT INTO postno VALUES (5949,'590-190','전북','남원시','도통동\r\n');
INSERT INTO postno VALUES (5950,'590-200','전북','남원시','월락동\r\n');
INSERT INTO postno VALUES (5951,'590-210','전북','남원시','고죽동\r\n');
INSERT INTO postno VALUES (5952,'590-220','전북','남원시','갈치동\r\n');
INSERT INTO postno VALUES (5953,'590-230','전북','남원시','식정동\r\n');
INSERT INTO postno VALUES (5954,'590-600','전북','남원시','남원우체국사서함\r\n');
INSERT INTO postno VALUES (5955,'590-711','전북','남원시','도통동 남원시청\r\n');
INSERT INTO postno VALUES (5956,'590-711','전북','남원시','광치동 서남대학교\r\n');
INSERT INTO postno VALUES (5957,'590-810','전북','남원시','주천면\r\n');
INSERT INTO postno VALUES (5958,'590-815','전북','남원시','추천면 고기리\r\n');
INSERT INTO postno VALUES (5959,'590-815','전북','남원시','추천면 덕치리\r\n');
INSERT INTO postno VALUES (5960,'590-820','전북','남원시','이백면\r\n');
INSERT INTO postno VALUES (5961,'590-830','전북','남원시','운봉면\r\n');
INSERT INTO postno VALUES (5962,'590-840','전북','남원시','동면\r\n');
INSERT INTO postno VALUES (5963,'590-850','전북','남원시','산내면\r\n');
INSERT INTO postno VALUES (5964,'590-860','전북','남원시','아영면\r\n');
INSERT INTO postno VALUES (5965,'590-870','전북','남원시','산동면\r\n');
INSERT INTO postno VALUES (5966,'590-880','전북','남원시','보절면\r\n');
INSERT INTO postno VALUES (5967,'590-890','전북','남원시','사매면\r\n');
INSERT INTO postno VALUES (5968,'590-910','전북','남원시','덕과면\r\n');
INSERT INTO postno VALUES (5969,'590-920','전북','남원시','수지면\r\n');
INSERT INTO postno VALUES (5970,'590-930','전북','남원시','송동면\r\n');
INSERT INTO postno VALUES (5971,'590-940','전북','남원시','주생면\r\n');
INSERT INTO postno VALUES (5972,'590-950','전북','남원시','금지면\r\n');
INSERT INTO postno VALUES (5973,'590-960','전북','남원시','대강면\r\n');
INSERT INTO postno VALUES (5974,'590-970','전북','남원시','대산면\r\n');
INSERT INTO postno VALUES (5975,'595-800','전북','순창군','순창읍\r\n');
INSERT INTO postno VALUES (5976,'595-810','전북','순창군','적성면\r\n');
INSERT INTO postno VALUES (5977,'595-820','전북','순창군','동계면\r\n');
INSERT INTO postno VALUES (5978,'595-830','전북','순창군','유등면\r\n');
INSERT INTO postno VALUES (5979,'595-840','전북','순창군','풍산면\r\n');
INSERT INTO postno VALUES (5980,'595-850','전북','순창군','금과면\r\n');
INSERT INTO postno VALUES (5981,'595-860','전북','순창군','팔덕면\r\n');
INSERT INTO postno VALUES (5982,'595-870','전북','순창군','구림면\r\n');
INSERT INTO postno VALUES (5983,'595-880','전북','순창군','복흥면\r\n');
INSERT INTO postno VALUES (5984,'595-890','전북','순창군','쌍치면\r\n');
INSERT INTO postno VALUES (5985,'595-910','전북','순창군','인계면\r\n');
INSERT INTO postno VALUES (5986,'597-800','전북','장수군','장수읍\r\n');
INSERT INTO postno VALUES (5987,'597-810','전북','장수군','번암면\r\n');
INSERT INTO postno VALUES (5988,'597-820','전북','장수군','산서면\r\n');
INSERT INTO postno VALUES (5989,'597-830','전북','장수군','계남면\r\n');
INSERT INTO postno VALUES (5990,'597-840','전북','장수군','장계면\r\n');
INSERT INTO postno VALUES (5991,'597-850','전북','장수군','천천면\r\n');
INSERT INTO postno VALUES (5992,'597-860','전북','장수군','계북면\r\n');
INSERT INTO postno VALUES (5993,'600-011','부산시','중구','중앙동1가\r\n');
INSERT INTO postno VALUES (5994,'600-012','부산시','중구','중앙동2가\r\n');
INSERT INTO postno VALUES (5995,'600-013','부산시','중구','중앙동3가\r\n');
INSERT INTO postno VALUES (5996,'600-014','부산시','중구','중앙동4가\r\n');
INSERT INTO postno VALUES (5997,'600-014','부산시','중구','중앙동4가\r\n');
INSERT INTO postno VALUES (5998,'600-015','부산시','중구','중앙동5가\r\n');
INSERT INTO postno VALUES (5999,'600-016','부산시','중구','중앙동6가\r\n');
INSERT INTO postno VALUES (6000,'600-017','부산시','중구','중앙동7가\r\n');
INSERT INTO postno VALUES (6001,'600-020','부산시','중구','동광동1가\r\n');
INSERT INTO postno VALUES (6002,'600-021','부산시','중구','동광동1가\r\n');
INSERT INTO postno VALUES (6003,'600-022','부산시','중구','동광동2가\r\n');
INSERT INTO postno VALUES (6004,'600-023','부산시','중구','동광동3가\r\n');
INSERT INTO postno VALUES (6005,'600-024','부산시','중구','동광동4가\r\n');
INSERT INTO postno VALUES (6006,'600-025','부산시','중구','동광동5가\r\n');
INSERT INTO postno VALUES (6007,'600-030','부산시','중구','광복동\r\n');
INSERT INTO postno VALUES (6008,'600-031','부산시','중구','광복동1가\r\n');
INSERT INTO postno VALUES (6009,'600-032','부산시','중구','광복동2가\r\n');
INSERT INTO postno VALUES (6010,'600-033','부산시','중구','광복동3가\r\n');
INSERT INTO postno VALUES (6011,'600-040','부산시','중구','남포동\r\n');
INSERT INTO postno VALUES (6012,'600-041','부산시','중구','남포동1가\r\n');
INSERT INTO postno VALUES (6013,'600-042','부산시','중구','남포동2가\r\n');
INSERT INTO postno VALUES (6014,'600-043','부산시','중구','남포동3가\r\n');
INSERT INTO postno VALUES (6015,'600-044','부산시','중구','남포동4가\r\n');
INSERT INTO postno VALUES (6016,'600-045','부산시','중구','남포동5가\r\n');
INSERT INTO postno VALUES (6017,'600-046','부산시','중구','남포동6가\r\n');
INSERT INTO postno VALUES (6018,'600-050','부산시','중구','창선동\r\n');
INSERT INTO postno VALUES (6019,'600-051','부산시','중구','창선동1가\r\n');
INSERT INTO postno VALUES (6020,'600-052','부산시','중구','창선동2가\r\n');
INSERT INTO postno VALUES (6021,'600-060','부산시','중구','신창동\r\n');
INSERT INTO postno VALUES (6022,'600-061','부산시','중구','신창동1가\r\n');
INSERT INTO postno VALUES (6023,'600-062','부산시','중구','신창동2가\r\n');
INSERT INTO postno VALUES (6024,'600-063','부산시','중구','신창동3가\r\n');
INSERT INTO postno VALUES (6025,'600-064','부산시','중구','신창동4가\r\n');
INSERT INTO postno VALUES (6026,'600-070','부산시','중구','부평동\r\n');
INSERT INTO postno VALUES (6027,'600-071','부산시','중구','부평동1가\r\n');
INSERT INTO postno VALUES (6028,'600-072','부산시','중구','부평동2가\r\n');
INSERT INTO postno VALUES (6029,'600-073','부산시','중구','부평동3가\r\n');
INSERT INTO postno VALUES (6030,'600-074','부산시','중구','부평동4가\r\n');
INSERT INTO postno VALUES (6031,'600-080','부산시','중구','보수동\r\n');
INSERT INTO postno VALUES (6032,'600-081','부산시','중구','보수동1가\r\n');
INSERT INTO postno VALUES (6033,'600-082','부산시','중구','보수동2가\r\n');
INSERT INTO postno VALUES (6034,'600-083','부산시','중구','보수동3가\r\n');
INSERT INTO postno VALUES (6035,'600-090','부산시','중구','대청동\r\n');
INSERT INTO postno VALUES (6036,'600-091','부산시','중구','대청동1가\r\n');
INSERT INTO postno VALUES (6037,'600-092','부산시','중구','대청동2가\r\n');
INSERT INTO postno VALUES (6038,'600-093','부산시','중구','대청동3가\r\n');
INSERT INTO postno VALUES (6039,'600-094','부산시','중구','대청동4가\r\n');
INSERT INTO postno VALUES (6040,'600-100','부산시','중구','대창동\r\n');
INSERT INTO postno VALUES (6041,'600-101','부산시','중구','대창동1가\r\n');
INSERT INTO postno VALUES (6042,'600-102','부산시','중구','대창동2가\r\n');
INSERT INTO postno VALUES (6043,'600-110','부산시','중구','영주동\r\n');
INSERT INTO postno VALUES (6044,'600-111','부산시','중구','영주동1동\r\n');
INSERT INTO postno VALUES (6045,'600-112','부산시','중구','영주동2동\r\n');
INSERT INTO postno VALUES (6046,'600-600','부산시','중구','부산우체국사서함0001-\r\n');
INSERT INTO postno VALUES (6047,'600-601','부산시','중구','부산우체국사서함0100-\r\n');
INSERT INTO postno VALUES (6048,'600-602','부산시','중구','부산우체국사서함0200-\r\n');
INSERT INTO postno VALUES (6049,'600-603','부산시','중구','부산우체국사서함0300-\r\n');
INSERT INTO postno VALUES (6050,'600-604','부산시','중구','부산우체국사서함0400-\r\n');
INSERT INTO postno VALUES (6051,'600-605','부산시','중구','부산우체국사서함0500-\r\n');
INSERT INTO postno VALUES (6052,'600-606','부산시','중구','부산우체국사서함0600-\r\n');
INSERT INTO postno VALUES (6053,'600-607','부산시','중구','부산우체국사서함0700-\r\n');
INSERT INTO postno VALUES (6054,'600-608','부산시','중구','부산우체국사서함0800-\r\n');
INSERT INTO postno VALUES (6055,'600-609','부산시','중구','부산우체국사서함0900-\r\n');
INSERT INTO postno VALUES (6056,'600-610','부산시','중구','부산우체국사서함1000-\r\n');
INSERT INTO postno VALUES (6057,'600-611','부산시','중구','부산우체국사서함1100-\r\n');
INSERT INTO postno VALUES (6058,'600-711','부산시','중구','중앙동3가 체신보험회관\r\n');
INSERT INTO postno VALUES (6059,'600-728','부산시','중구','국제회관(부산문화방송국)\r\n');
INSERT INTO postno VALUES (6060,'600-729','부산시','중구','중앙동4가 무역회관빌딩\r\n');
INSERT INTO postno VALUES (6061,'600-730','부산시','중구','대청동4가 메리놀병원\r\n');
INSERT INTO postno VALUES (6062,'600-735','부산시','중구','중앙동7가 부산시청\r\n');
INSERT INTO postno VALUES (6063,'600-736','부산시','중구','중앙동4가 부산본부세관\r\n');
INSERT INTO postno VALUES (6064,'600-737','부산시','중구','중앙동7가 부산지방경찰청\r\n');
INSERT INTO postno VALUES (6065,'601-010','부산시','동구','초량동\r\n');
INSERT INTO postno VALUES (6066,'601-011','부산시','동구','초량1동\r\n');
INSERT INTO postno VALUES (6067,'601-012','부산시','동구','초량2동\r\n');
INSERT INTO postno VALUES (6068,'601-013','부산시','동구','초량3동\r\n');
INSERT INTO postno VALUES (6069,'601-014','부산시','동구','초량4동\r\n');
INSERT INTO postno VALUES (6070,'601-015','부산시','동구','초량5동\r\n');
INSERT INTO postno VALUES (6071,'601-016','부산시','동구','초량6동\r\n');
INSERT INTO postno VALUES (6072,'601-030','부산시','동구','수정동\r\n');
INSERT INTO postno VALUES (6073,'601-031','부산시','동구','수정1동\r\n');
INSERT INTO postno VALUES (6074,'601-032','부산시','동구','수정2동\r\n');
INSERT INTO postno VALUES (6075,'601-033','부산시','동구','수정3동\r\n');
INSERT INTO postno VALUES (6076,'601-034','부산시','동구','수정4동\r\n');
INSERT INTO postno VALUES (6077,'601-035','부산시','동구','수정5동\r\n');
INSERT INTO postno VALUES (6078,'601-050','부산시','동구','좌천동\r\n');
INSERT INTO postno VALUES (6079,'601-051','부산시','동구','좌천1동\r\n');
INSERT INTO postno VALUES (6080,'601-052','부산시','동구','좌천2동\r\n');
INSERT INTO postno VALUES (6081,'601-053','부산시','동구','좌천3동\r\n');
INSERT INTO postno VALUES (6082,'601-054','부산시','동구','좌천4동\r\n');
INSERT INTO postno VALUES (6083,'601-060','부산시','동구','범일동\r\n');
INSERT INTO postno VALUES (6084,'601-061','부산시','동구','범일1동\r\n');
INSERT INTO postno VALUES (6085,'601-062','부산시','동구','범일2동\r\n');
INSERT INTO postno VALUES (6086,'601-063','부산시','동구','범일3동\r\n');
INSERT INTO postno VALUES (6087,'601-064','부산시','동구','범일4동\r\n');
INSERT INTO postno VALUES (6088,'601-065','부산시','동구','범일5동\r\n');
INSERT INTO postno VALUES (6089,'601-066','부산시','동구','범일6동\r\n');
INSERT INTO postno VALUES (6090,'601-600','부산시','동구','동부산우체국사서함\r\n');
INSERT INTO postno VALUES (6091,'601-701','부산시','동구','수정2동 동구청\r\n');
INSERT INTO postno VALUES (6092,'601-704','부산시','동구','초량3동 부산지방철도청\r\n');
INSERT INTO postno VALUES (6093,'601-705','부산시','동구','범일2동 공무원연금관리\r\n');
INSERT INTO postno VALUES (6094,'601-711','부산시','동구','범일2동 선경오피스텔\r\n');
INSERT INTO postno VALUES (6095,'601-712','부산시','동구','초량3동 침례병원\r\n');
INSERT INTO postno VALUES (6096,'601-713','부산시','동구','초량3동 현대해상빌딩\r\n');
INSERT INTO postno VALUES (6097,'601-714','부산시','동구','초량3동 대한통운빌딩\r\n');
INSERT INTO postno VALUES (6098,'601-716','부산시','동구','초량3동 국제오피스텔\r\n');
INSERT INTO postno VALUES (6099,'601-716','부산시','동구','수정2동 한성생명빌딩\r\n');
INSERT INTO postno VALUES (6100,'601-738','부산시','동구','수정2동 부산일보사빌딩\r\n');
INSERT INTO postno VALUES (6101,'602-010','부산시','서구','충무동\r\n');
INSERT INTO postno VALUES (6102,'602-011','부산시','서구','충무동1가\r\n');
INSERT INTO postno VALUES (6103,'602-012','부산시','서구','충무동2가\r\n');
INSERT INTO postno VALUES (6104,'602-013','부산시','서구','충무동3가\r\n');
INSERT INTO postno VALUES (6105,'602-020','부산시','서구','남부민동\r\n');
INSERT INTO postno VALUES (6106,'602-021','부산시','서구','남부민1동\r\n');
INSERT INTO postno VALUES (6107,'602-022','부산시','서구','남부민2동\r\n');
INSERT INTO postno VALUES (6108,'602-023','부산시','서구','남부민3동\r\n');
INSERT INTO postno VALUES (6109,'602-030','부산시','서구','암남동\r\n');
INSERT INTO postno VALUES (6110,'602-040','부산시','서구','초장동\r\n');
INSERT INTO postno VALUES (6111,'602-041','부산시','서구','초장동1가\r\n');
INSERT INTO postno VALUES (6112,'602-042','부산시','서구','초장동2가\r\n');
INSERT INTO postno VALUES (6113,'602-043','부산시','서구','초장동3가\r\n');
INSERT INTO postno VALUES (6114,'602-050','부산시','서구','토성동\r\n');
INSERT INTO postno VALUES (6115,'602-051','부산시','서구','토성동1가\r\n');
INSERT INTO postno VALUES (6116,'602-052','부산시','서구','토성동2가\r\n');
INSERT INTO postno VALUES (6117,'602-053','부산시','서구','토성동3가\r\n');
INSERT INTO postno VALUES (6118,'602-054','부산시','서구','토성동4가\r\n');
INSERT INTO postno VALUES (6119,'602-055','부산시','서구','토성동5가\r\n');
INSERT INTO postno VALUES (6120,'602-060','부산시','서구','아미동\r\n');
INSERT INTO postno VALUES (6121,'602-061','부산시','서구','아미동1가\r\n');
INSERT INTO postno VALUES (6122,'602-062','부산시','서구','아미동2가\r\n');
INSERT INTO postno VALUES (6123,'602-070','부산시','서구','부민동\r\n');
INSERT INTO postno VALUES (6124,'602-071','부산시','서구','부민동1가\r\n');
INSERT INTO postno VALUES (6125,'602-072','부산시','서구','부민동2가\r\n');
INSERT INTO postno VALUES (6126,'602-073','부산시','서구','부민동3가\r\n');
INSERT INTO postno VALUES (6127,'602-080','부산시','서구','부용동\r\n');
INSERT INTO postno VALUES (6128,'602-081','부산시','서구','부용동1가\r\n');
INSERT INTO postno VALUES (6129,'602-082','부산시','서구','부용동2가\r\n');
INSERT INTO postno VALUES (6130,'602-090','부산시','서구','서대신동\r\n');
INSERT INTO postno VALUES (6131,'602-091','부산시','서구','서대신동1가\r\n');
INSERT INTO postno VALUES (6132,'602-092','부산시','서구','서대신동2가\r\n');
INSERT INTO postno VALUES (6133,'602-093','부산시','서구','서대신동3가\r\n');
INSERT INTO postno VALUES (6134,'602-094','부산시','서구','서대신동4가\r\n');
INSERT INTO postno VALUES (6135,'602-100','부산시','서구','동대신동\r\n');
INSERT INTO postno VALUES (6136,'602-101','부산시','서구','동대신동1가\r\n');
INSERT INTO postno VALUES (6137,'602-102','부산시','서구','동대신동2가\r\n');
INSERT INTO postno VALUES (6138,'602-103','부산시','서구','동대신동3가\r\n');
INSERT INTO postno VALUES (6139,'602-702','부산시','서구','고신의료원(고신대학원)\r\n');
INSERT INTO postno VALUES (6140,'602-714','부산시','서구','동아대학교구덕켐퍼스\r\n');
INSERT INTO postno VALUES (6141,'602-715','부산시','서구','동아대학부속병원\r\n');
INSERT INTO postno VALUES (6142,'602-739','부산시','서구','아미동1가 부산대학병원\r\n');
INSERT INTO postno VALUES (6143,'602-740','부산시','서구','남부민3동 부산시공동어시장\r\n');
INSERT INTO postno VALUES (6144,'602-741','부산시','서구','부민동2가 부산고등법원\r\n');
INSERT INTO postno VALUES (6145,'602-742','부산시','서구','부민동2가 부산지방법원\r\n');
INSERT INTO postno VALUES (6146,'602-743','부산시','서구','부민동2가 부산고등검찰청\r\n');
INSERT INTO postno VALUES (6147,'602-744','부산시','서구','부민동2가 부산지방검찰청\r\n');
INSERT INTO postno VALUES (6148,'602-791','부산시','서구','한국통신부산사업본부\r\n');
INSERT INTO postno VALUES (6149,'604-010','부산시','사하구','당리동\r\n');
INSERT INTO postno VALUES (6150,'604-020','부산시','사하구','하단동\r\n');
INSERT INTO postno VALUES (6151,'604-021','부산시','사하구','하단1동\r\n');
INSERT INTO postno VALUES (6152,'604-022','부산시','사하구','하단2동\r\n');
INSERT INTO postno VALUES (6153,'604-030','부산시','사하구','신평동\r\n');
INSERT INTO postno VALUES (6154,'604-031','부산시','사하구','신평1동\r\n');
INSERT INTO postno VALUES (6155,'604-032','부산시','사하구','신평2동\r\n');
INSERT INTO postno VALUES (6156,'604-040','부산시','사하구','장림동\r\n');
INSERT INTO postno VALUES (6157,'604-041','부산시','사하구','장림1동\r\n');
INSERT INTO postno VALUES (6158,'604-042','부산시','사하구','장림2동\r\n');
INSERT INTO postno VALUES (6159,'604-050','부산시','사하구','다대동\r\n');
INSERT INTO postno VALUES (6160,'604-051','부산시','사하구','다대1동\r\n');
INSERT INTO postno VALUES (6161,'604-052','부산시','사하구','다대2동\r\n');
INSERT INTO postno VALUES (6162,'604-060','부산시','사하구','구평동\r\n');
INSERT INTO postno VALUES (6163,'604-070','부산시','사하구','감천동\r\n');
INSERT INTO postno VALUES (6164,'604-071','부산시','사하구','감천1동\r\n');
INSERT INTO postno VALUES (6165,'604-072','부산시','사하구','감천2동\r\n');
INSERT INTO postno VALUES (6166,'604-080','부산시','사하구','괴정동\r\n');
INSERT INTO postno VALUES (6167,'604-081','부산시','사하구','괴정1동\r\n');
INSERT INTO postno VALUES (6168,'604-082','부산시','사하구','괴정2동\r\n');
INSERT INTO postno VALUES (6169,'604-083','부산시','사하구','괴정3동\r\n');
INSERT INTO postno VALUES (6170,'604-084','부산시','사하구','괴정4동\r\n');
INSERT INTO postno VALUES (6171,'604-600','부산시','사하구','부산사하우체국사서함\r\n');
INSERT INTO postno VALUES (6172,'604-701','부산시','사하구','당리동 사하구청\r\n');
INSERT INTO postno VALUES (6173,'604-701','부산시','사하구','신평2동 사하경찰서\r\n');
INSERT INTO postno VALUES (6174,'604-714','부산시','사하구','동아대학교승학캠퍼스\r\n');
INSERT INTO postno VALUES (6175,'604-715','부산시','사하구','괴정3동 동주여자전문대학\r\n');
INSERT INTO postno VALUES (6176,'604-721','부산시','사하구','신평2동 동성화학(주)\r\n');
INSERT INTO postno VALUES (6177,'606-010','부산시','영도구','대교동\r\n');
INSERT INTO postno VALUES (6178,'606-011','부산시','영도구','대교동1가\r\n');
INSERT INTO postno VALUES (6179,'606-012','부산시','영도구','대교동2가\r\n');
INSERT INTO postno VALUES (6180,'606-020','부산시','영도구','대평동\r\n');
INSERT INTO postno VALUES (6181,'606-021','부산시','영도구','대평동1가\r\n');
INSERT INTO postno VALUES (6182,'606-022','부산시','영도구','대평동2가\r\n');
INSERT INTO postno VALUES (6183,'606-030','부산시','영도구','남항동\r\n');
INSERT INTO postno VALUES (6184,'606-031','부산시','영도구','남항동1가\r\n');
INSERT INTO postno VALUES (6185,'606-032','부산시','영도구','남항동2가\r\n');
INSERT INTO postno VALUES (6186,'606-033','부산시','영도구','남항동3가\r\n');
INSERT INTO postno VALUES (6187,'606-040','부산시','영도구','영선동\r\n');
INSERT INTO postno VALUES (6188,'606-041','부산시','영도구','영선동1가\r\n');
INSERT INTO postno VALUES (6189,'606-042','부산시','영도구','영선동2가\r\n');
INSERT INTO postno VALUES (6190,'606-043','부산시','영도구','영선동3가\r\n');
INSERT INTO postno VALUES (6191,'606-044','부산시','영도구','영선동4가\r\n');
INSERT INTO postno VALUES (6192,'606-050','부산시','영도구','신선동\r\n');
INSERT INTO postno VALUES (6193,'606-051','부산시','영도구','신선동1가\r\n');
INSERT INTO postno VALUES (6194,'606-052','부산시','영도구','신선동2가\r\n');
INSERT INTO postno VALUES (6195,'606-053','부산시','영도구','신선동3가\r\n');
INSERT INTO postno VALUES (6196,'606-060','부산시','영도구','봉래동\r\n');
INSERT INTO postno VALUES (6197,'606-061','부산시','영도구','봉래동1가\r\n');
INSERT INTO postno VALUES (6198,'606-062','부산시','영도구','봉래동2가\r\n');
INSERT INTO postno VALUES (6199,'606-063','부산시','영도구','봉래동3가\r\n');
INSERT INTO postno VALUES (6200,'606-064','부산시','영도구','봉래동4가\r\n');
INSERT INTO postno VALUES (6201,'606-065','부산시','영도구','봉래동5가\r\n');
INSERT INTO postno VALUES (6202,'606-070','부산시','영도구','청학동\r\n');
INSERT INTO postno VALUES (6203,'606-071','부산시','영도구','청학동1동\r\n');
INSERT INTO postno VALUES (6204,'606-072','부산시','영도구','청학동2동\r\n');
INSERT INTO postno VALUES (6205,'606-080','부산시','영도구','동삼동\r\n');
INSERT INTO postno VALUES (6206,'606-081','부산시','영도구','동삼1동\r\n');
INSERT INTO postno VALUES (6207,'606-082','부산시','영도구','동삼2동\r\n');
INSERT INTO postno VALUES (6208,'606-083','부산시','영도구','동삼3동\r\n');
INSERT INTO postno VALUES (6209,'606-600','부산시','영도구','영도우체국사서함\r\n');
INSERT INTO postno VALUES (6210,'606-701','부산시','영도구','동삼1동 고신대학교\r\n');
INSERT INTO postno VALUES (6211,'606-750','부산시','영도구','청학2동 영도구청\r\n');
INSERT INTO postno VALUES (6212,'606-791','부산시','영도구','동삼2동 한국해양대학교\r\n');
INSERT INTO postno VALUES (6213,'606-796','부산시','영도구','봉래동5가 한진중공업\r\n');
INSERT INTO postno VALUES (6214,'607-010','부산시','동래구','명륜동\r\n');
INSERT INTO postno VALUES (6215,'607-011','부산시','동래구','명륜1동\r\n');
INSERT INTO postno VALUES (6216,'607-012','부산시','동래구','명륜2동\r\n');
INSERT INTO postno VALUES (6217,'607-020','부산시','동래구','복천동\r\n');
INSERT INTO postno VALUES (6218,'607-030','부산시','동래구','칠산동\r\n');
INSERT INTO postno VALUES (6219,'607-040','부산시','동래구','낙민동\r\n');
INSERT INTO postno VALUES (6220,'607-050','부산시','동래구','수안동\r\n');
INSERT INTO postno VALUES (6221,'607-060','부산시','동래구','온천동\r\n');
INSERT INTO postno VALUES (6222,'607-061','부산시','동래구','온천1동\r\n');
INSERT INTO postno VALUES (6223,'607-062','부산시','동래구','온천2동\r\n');
INSERT INTO postno VALUES (6224,'607-063','부산시','동래구','온천3동\r\n');
INSERT INTO postno VALUES (6225,'607-100','부산시','동래구','안락동\r\n');
INSERT INTO postno VALUES (6226,'607-101','부산시','동래구','안락1동\r\n');
INSERT INTO postno VALUES (6227,'607-102','부산시','동래구','안락2동\r\n');
INSERT INTO postno VALUES (6228,'607-110','부산시','동래구','명장동\r\n');
INSERT INTO postno VALUES (6229,'607-111','부산시','동래구','명장1동\r\n');
INSERT INTO postno VALUES (6230,'607-112','부산시','동래구','명장2동\r\n');
INSERT INTO postno VALUES (6231,'607-120','부산시','동래구','사직동\r\n');
INSERT INTO postno VALUES (6232,'607-121','부산시','동래구','사직1동\r\n');
INSERT INTO postno VALUES (6233,'607-122','부산시','동래구','사직2동\r\n');
INSERT INTO postno VALUES (6234,'607-123','부산시','동래구','사직3동\r\n');
INSERT INTO postno VALUES (6235,'607-600','부산시','동래구','동래우체국사서함\r\n');
INSERT INTO postno VALUES (6236,'607-600','부산시','동래구','복천동 동래구청\r\n');
INSERT INTO postno VALUES (6237,'607-736','부산시','동래구','온천3동 부산기독교방송국\r\n');
INSERT INTO postno VALUES (6238,'608-020','부산시','남구','대연동\r\n');
INSERT INTO postno VALUES (6239,'608-021','부산시','남구','대연1동\r\n');
INSERT INTO postno VALUES (6240,'608-022','부산시','남구','대연2동\r\n');
INSERT INTO postno VALUES (6241,'608-023','부산시','남구','대연3동\r\n');
INSERT INTO postno VALUES (6242,'608-024','부산시','남구','대연4동\r\n');
INSERT INTO postno VALUES (6243,'608-025','부산시','남구','대연5동\r\n');
INSERT INTO postno VALUES (6244,'608-026','부산시','남구','대연6동\r\n');
INSERT INTO postno VALUES (6245,'608-040','부산시','남구','문현동\r\n');
INSERT INTO postno VALUES (6246,'608-041','부산시','남구','문현1동\r\n');
INSERT INTO postno VALUES (6247,'608-042','부산시','남구','문현2동\r\n');
INSERT INTO postno VALUES (6248,'608-043','부산시','남구','문현3동\r\n');
INSERT INTO postno VALUES (6249,'608-044','부산시','남구','문현4동\r\n');
INSERT INTO postno VALUES (6250,'608-045','부산시','남구','문현5동\r\n');
INSERT INTO postno VALUES (6251,'608-060','부산시','남구','우암동\r\n');
INSERT INTO postno VALUES (6252,'608-061','부산시','남구','우암1동\r\n');
INSERT INTO postno VALUES (6253,'608-062','부산시','남구','우암2동\r\n');
INSERT INTO postno VALUES (6254,'608-070','부산시','남구','감만동\r\n');
INSERT INTO postno VALUES (6255,'608-071','부산시','남구','감만1동\r\n');
INSERT INTO postno VALUES (6256,'608-072','부산시','남구','감만2동\r\n');
INSERT INTO postno VALUES (6257,'608-080','부산시','남구','용당동\r\n');
INSERT INTO postno VALUES (6258,'608-090','부산시','남구','용호동\r\n');
INSERT INTO postno VALUES (6259,'608-091','부산시','남구','용호1동\r\n');
INSERT INTO postno VALUES (6260,'608-092','부산시','남구','용호2동\r\n');
INSERT INTO postno VALUES (6261,'608-093','부산시','남구','용호3동\r\n');
INSERT INTO postno VALUES (6262,'608-094','부산시','남구','용호4동\r\n');
INSERT INTO postno VALUES (6263,'608-600','부산시','남구','남부산우체국사서함\r\n');
INSERT INTO postno VALUES (6264,'608-701','부산시','남구','대연3동 남구청\r\n');
INSERT INTO postno VALUES (6265,'608-703','부산시','남구','부산시차량등록사업소\r\n');
INSERT INTO postno VALUES (6266,'608-711','부산시','남구','용당동 동명정보대학교\r\n');
INSERT INTO postno VALUES (6267,'608-736','부산시','남구','대연3동 경성대학\r\n');
INSERT INTO postno VALUES (6268,'608-737','부산시','남구','대연3동 부산수산대학\r\n');
INSERT INTO postno VALUES (6269,'608-738','부산시','남구','우암2동 부산외국어대학교\r\n');
INSERT INTO postno VALUES (6270,'608-739','부산시','남구','용당동 부산공업대학교\r\n');
INSERT INTO postno VALUES (6271,'608-740','부산시','남구','용당동 동명전문대학\r\n');
INSERT INTO postno VALUES (6272,'608-743','부산시','남구','대연3동 21세기센츄리시티건\r\n');
INSERT INTO postno VALUES (6273,'608-750','부산시','남구','감만1동 연합철강건물\r\n');
INSERT INTO postno VALUES (6274,'608-751','부산시','남구','대연5동 유토피아오피스텔\r\n');
INSERT INTO postno VALUES (6275,'608-792','부산시','남구','문현5동 한일오피스텔\r\n');
INSERT INTO postno VALUES (6276,'609-310','부산시','금정구','구서동\r\n');
INSERT INTO postno VALUES (6277,'609-311','부산시','금정구','구서1동\r\n');
INSERT INTO postno VALUES (6278,'609-312','부산시','금정구','구서2동\r\n');
INSERT INTO postno VALUES (6279,'609-320','부산시','금정구','부곡동\r\n');
INSERT INTO postno VALUES (6280,'609-321','부산시','금정구','부곡1동\r\n');
INSERT INTO postno VALUES (6281,'609-322','부산시','금정구','부곡2동\r\n');
INSERT INTO postno VALUES (6282,'609-323','부산시','금정구','부곡3동\r\n');
INSERT INTO postno VALUES (6283,'609-324','부산시','금정구','부곡4동\r\n');
INSERT INTO postno VALUES (6284,'609-330','부산시','금정구','오륜동\r\n');
INSERT INTO postno VALUES (6285,'609-340','부산시','금정구','남산동\r\n');
INSERT INTO postno VALUES (6286,'609-350','부산시','금정구','청룡동\r\n');
INSERT INTO postno VALUES (6287,'609-360','부산시','금정구','노포동\r\n');
INSERT INTO postno VALUES (6288,'609-370','부산시','금정구','두구동\r\n');
INSERT INTO postno VALUES (6289,'609-380','부산시','금정구','선동\r\n');
INSERT INTO postno VALUES (6290,'609-390','부산시','금정구','장전동\r\n');
INSERT INTO postno VALUES (6291,'609-391','부산시','금정구','장전1동\r\n');
INSERT INTO postno VALUES (6292,'609-392','부산시','금정구','장전2동\r\n');
INSERT INTO postno VALUES (6293,'609-393','부산시','금정구','장전3동\r\n');
INSERT INTO postno VALUES (6294,'609-400','부산시','금정구','서동\r\n');
INSERT INTO postno VALUES (6295,'609-401','부산시','금정구','서1동\r\n');
INSERT INTO postno VALUES (6296,'609-402','부산시','금정구','서2동\r\n');
INSERT INTO postno VALUES (6297,'609-403','부산시','금정구','서3동\r\n');
INSERT INTO postno VALUES (6298,'609-404','부산시','금정구','서4동\r\n');
INSERT INTO postno VALUES (6299,'609-410','부산시','금정구','금사동\r\n');
INSERT INTO postno VALUES (6300,'609-420','부산시','금정구','금성동\r\n');
INSERT INTO postno VALUES (6301,'609-430','부산시','금정구','회동동\r\n');
INSERT INTO postno VALUES (6302,'609-600','부산시','금정구','금정우체국사서함\r\n');
INSERT INTO postno VALUES (6303,'609-701','부산시','금정구','부곡3동 금정구청\r\n');
INSERT INTO postno VALUES (6304,'609-701','부산시','금정구','구서1동 금정경찰서\r\n');
INSERT INTO postno VALUES (6305,'609-715','부산시','금정구','부곡2동 대동간호전문대학\r\n');
INSERT INTO postno VALUES (6306,'609-735','부산시','금정구','장전2동 부산대학교\r\n');
INSERT INTO postno VALUES (6307,'609-757','부산시','금정구','부곡3동 지산전문대학\r\n');
INSERT INTO postno VALUES (6308,'611-070','부산시','연제구','거제동\r\n');
INSERT INTO postno VALUES (6309,'611-071','부산시','연제구','거제1동\r\n');
INSERT INTO postno VALUES (6310,'611-072','부산시','연제구','거제2동\r\n');
INSERT INTO postno VALUES (6311,'611-073','부산시','연제구','거제3동\r\n');
INSERT INTO postno VALUES (6312,'611-074','부산시','연제구','거제4동\r\n');
INSERT INTO postno VALUES (6313,'611-080','부산시','연제구','연산동\r\n');
INSERT INTO postno VALUES (6314,'611-081','부산시','연제구','연산1동\r\n');
INSERT INTO postno VALUES (6315,'611-082','부산시','연제구','연산2동\r\n');
INSERT INTO postno VALUES (6316,'611-083','부산시','연제구','연산3동\r\n');
INSERT INTO postno VALUES (6317,'611-084','부산시','연제구','연산4동\r\n');
INSERT INTO postno VALUES (6318,'611-085','부산시','연제구','연산5동\r\n');
INSERT INTO postno VALUES (6319,'611-086','부산시','연제구','연산6동\r\n');
INSERT INTO postno VALUES (6320,'611-087','부산시','연제구','연산7동\r\n');
INSERT INTO postno VALUES (6321,'611-088','부산시','연제구','연산8동\r\n');
INSERT INTO postno VALUES (6322,'611-089','부산시','연제구','연산9동\r\n');
INSERT INTO postno VALUES (6323,'611-701','부산시','연제구','연산8동 경상전문대학\r\n');
INSERT INTO postno VALUES (6324,'611-702','부산시','연제구','거제1동 국제문화센타\r\n');
INSERT INTO postno VALUES (6325,'611-703','부산시','연제구','연산2동 연제구청\r\n');
INSERT INTO postno VALUES (6326,'611-706','부산시','연제구','연산4동 부산의료원\r\n');
INSERT INTO postno VALUES (6327,'611-736','부산시','연제구','거제1동 부산교육대학\r\n');
INSERT INTO postno VALUES (6328,'611-738','부산시','연제구','연산9동 부산지방국세청\r\n');
INSERT INTO postno VALUES (6329,'612-010','부산시','해운대구','중동\r\n');
INSERT INTO postno VALUES (6330,'612-011','부산시','해운대구','중1동\r\n');
INSERT INTO postno VALUES (6331,'612-012','부산시','해운대구','중2동\r\n');
INSERT INTO postno VALUES (6332,'612-020','부산시','해운대구','우동\r\n');
INSERT INTO postno VALUES (6333,'612-021','부산시','해운대구','우1동\r\n');
INSERT INTO postno VALUES (6334,'612-022','부산시','해운대구','우2동\r\n');
INSERT INTO postno VALUES (6335,'612-030','부산시','해운대구','좌동\r\n');
INSERT INTO postno VALUES (6336,'612-040','부산시','해운대구','송정동\r\n');
INSERT INTO postno VALUES (6337,'612-050','부산시','해운대구','재송동\r\n');
INSERT INTO postno VALUES (6338,'612-051','부산시','해운대구','재송1동\r\n');
INSERT INTO postno VALUES (6339,'612-052','부산시','해운대구','재송2동\r\n');
INSERT INTO postno VALUES (6340,'612-060','부산시','해운대구','반여동\r\n');
INSERT INTO postno VALUES (6341,'612-061','부산시','해운대구','반여1동\r\n');
INSERT INTO postno VALUES (6342,'612-062','부산시','해운대구','반여2동\r\n');
INSERT INTO postno VALUES (6343,'612-063','부산시','해운대구','반여3동\r\n');
INSERT INTO postno VALUES (6344,'612-070','부산시','해운대구','석대동\r\n');
INSERT INTO postno VALUES (6345,'612-080','부산시','해운대구','반송동\r\n');
INSERT INTO postno VALUES (6346,'612-081','부산시','해운대구','반송1동\r\n');
INSERT INTO postno VALUES (6347,'612-082','부산시','해운대구','반송2동\r\n');
INSERT INTO postno VALUES (6348,'612-083','부산시','해운대구','반송3동\r\n');
INSERT INTO postno VALUES (6349,'612-600','부산시','해운대구','해운대우체국사서함\r\n');
INSERT INTO postno VALUES (6350,'612-701','부산시','해운대구','중1동 해운대구청\r\n');
INSERT INTO postno VALUES (6351,'612-703','부산시','해운대구','재송동 부산지법동부지\r\n');
INSERT INTO postno VALUES (6352,'612-715','부산시','해운대구','반송2동 동래여자전문대\r\n');
INSERT INTO postno VALUES (6353,'612-743','부산시','해운대구','성심외국어전문대학\r\n');
INSERT INTO postno VALUES (6354,'613-010','부산시','수영구','남천동\r\n');
INSERT INTO postno VALUES (6355,'613-011','부산시','수영구','남천1동\r\n');
INSERT INTO postno VALUES (6356,'613-012','부산시','수영구','남천2동\r\n');
INSERT INTO postno VALUES (6357,'613-100','부산시','수영구','광안동\r\n');
INSERT INTO postno VALUES (6358,'613-101','부산시','수영구','광안1동\r\n');
INSERT INTO postno VALUES (6359,'613-102','부산시','수영구','광안2동\r\n');
INSERT INTO postno VALUES (6360,'613-103','부산시','수영구','광안3동\r\n');
INSERT INTO postno VALUES (6361,'613-104','부산시','수영구','광안4동\r\n');
INSERT INTO postno VALUES (6362,'613-110','부산시','수영구','민락동\r\n');
INSERT INTO postno VALUES (6363,'613-120','부산시','수영구','수영동\r\n');
INSERT INTO postno VALUES (6364,'613-130','부산시','수영구','망미동\r\n');
INSERT INTO postno VALUES (6365,'613-131','부산시','수영구','망미1동\r\n');
INSERT INTO postno VALUES (6366,'613-132','부산시','수영구','망미2동\r\n');
INSERT INTO postno VALUES (6367,'613-701','부산시','수영구','망미2동 고려제강건물\r\n');
INSERT INTO postno VALUES (6368,'613-702','부산시','수영구','남천2동 수영구청\r\n');
INSERT INTO postno VALUES (6369,'613-702','부산시','수영구','남천2동 남부산세무서\r\n');
INSERT INTO postno VALUES (6370,'613-711','부산시','수영구','의료보험연합회부산지부\r\n');
INSERT INTO postno VALUES (6371,'613-790','부산시','수영구','한국방송공사부산방송총국\r\n');
INSERT INTO postno VALUES (6372,'614-010','부산시','부산진구','가야동\r\n');
INSERT INTO postno VALUES (6373,'614-011','부산시','부산진구','가야1동\r\n');
INSERT INTO postno VALUES (6374,'614-012','부산시','부산진구','가야2동\r\n');
INSERT INTO postno VALUES (6375,'614-013','부산시','부산진구','가야3동\r\n');
INSERT INTO postno VALUES (6376,'614-020','부산시','부산진구','범천동\r\n');
INSERT INTO postno VALUES (6377,'614-021','부산시','부산진구','범천1동\r\n');
INSERT INTO postno VALUES (6378,'614-022','부산시','부산진구','범천2동\r\n');
INSERT INTO postno VALUES (6379,'614-023','부산시','부산진구','범천3동\r\n');
INSERT INTO postno VALUES (6380,'614-024','부산시','부산진구','범천4동\r\n');
INSERT INTO postno VALUES (6381,'614-030','부산시','부산진구','부전동\r\n');
INSERT INTO postno VALUES (6382,'614-031','부산시','부산진구','부전1동\r\n');
INSERT INTO postno VALUES (6383,'614-032','부산시','부산진구','부전2동\r\n');
INSERT INTO postno VALUES (6384,'614-040','부산시','부산진구','전포동\r\n');
INSERT INTO postno VALUES (6385,'614-041','부산시','부산진구','전포1동\r\n');
INSERT INTO postno VALUES (6386,'614-042','부산시','부산진구','전포2동\r\n');
INSERT INTO postno VALUES (6387,'614-043','부산시','부산진구','전포3동\r\n');
INSERT INTO postno VALUES (6388,'614-044','부산시','부산진구','전포4동\r\n');
INSERT INTO postno VALUES (6389,'614-050','부산시','부산진구','양정동\r\n');
INSERT INTO postno VALUES (6390,'614-051','부산시','부산진구','양정1동\r\n');
INSERT INTO postno VALUES (6391,'614-052','부산시','부산진구','양정2동\r\n');
INSERT INTO postno VALUES (6392,'614-053','부산시','부산진구','양정3동\r\n');
INSERT INTO postno VALUES (6393,'614-054','부산시','부산진구','양정4동\r\n');
INSERT INTO postno VALUES (6394,'614-060','부산시','부산진구','범전동\r\n');
INSERT INTO postno VALUES (6395,'614-070','부산시','부산진구','연지동\r\n');
INSERT INTO postno VALUES (6396,'614-080','부산시','부산진구','초읍동\r\n');
INSERT INTO postno VALUES (6397,'614-090','부산시','부산진구','부암동\r\n');
INSERT INTO postno VALUES (6398,'614-091','부산시','부산진구','부암1동\r\n');
INSERT INTO postno VALUES (6399,'614-092','부산시','부산진구','부암2동\r\n');
INSERT INTO postno VALUES (6400,'614-093','부산시','부산진구','부암3동\r\n');
INSERT INTO postno VALUES (6401,'614-100','부산시','부산진구','당감동\r\n');
INSERT INTO postno VALUES (6402,'614-101','부산시','부산진구','당감1동\r\n');
INSERT INTO postno VALUES (6403,'614-102','부산시','부산진구','당감2동\r\n');
INSERT INTO postno VALUES (6404,'614-103','부산시','부산진구','당감3동\r\n');
INSERT INTO postno VALUES (6405,'614-104','부산시','부산진구','당감4동\r\n');
INSERT INTO postno VALUES (6406,'614-110','부산시','부산진구','개금동\r\n');
INSERT INTO postno VALUES (6407,'614-111','부산시','부산진구','개금1동\r\n');
INSERT INTO postno VALUES (6408,'614-112','부산시','부산진구','개금2동\r\n');
INSERT INTO postno VALUES (6409,'614-113','부산시','부산진구','개금3동\r\n');
INSERT INTO postno VALUES (6410,'614-600','부산시','부산진구','부산체신청직영우체국\r\n');
INSERT INTO postno VALUES (6411,'614-701','부산시','부산진구','부전1동 부산진구청\r\n');
INSERT INTO postno VALUES (6412,'614-703','부산시','부산진구','양정1동 부산시교육청\r\n');
INSERT INTO postno VALUES (6413,'614-714','부산시','부산진구','가야2동 동의대학교\r\n');
INSERT INTO postno VALUES (6414,'614-715','부산시','부산진구','양정3동 동의공업전문대\r\n');
INSERT INTO postno VALUES (6415,'614-721','부산시','부산진구','범천1동 부산상공회의소\r\n');
INSERT INTO postno VALUES (6416,'614-722','부산시','부산진구','범천1동 부산교통공단\r\n');
INSERT INTO postno VALUES (6417,'614-731','부산시','부산진구','부전1동 유원오피스텔\r\n');
INSERT INTO postno VALUES (6418,'614-732','부산시','부산진구','부전2동 롯데백화점\r\n');
INSERT INTO postno VALUES (6419,'614-734','부산시','부산진구','양정3동 부산여자전문대\r\n');
INSERT INTO postno VALUES (6420,'614-735','부산시','부산진구','백병원(인제의대)건물\r\n');
INSERT INTO postno VALUES (6421,'614-764','부산시','부산진구','춘해간호전문대학\r\n');
INSERT INTO postno VALUES (6422,'616-090','부산시','북구','구포동\r\n');
INSERT INTO postno VALUES (6423,'616-091','부산시','북구','구포1동\r\n');
INSERT INTO postno VALUES (6424,'616-092','부산시','북구','구포2동\r\n');
INSERT INTO postno VALUES (6425,'616-093','부산시','북구','구포3동\r\n');
INSERT INTO postno VALUES (6426,'616-100','부산시','북구','덕천동\r\n');
INSERT INTO postno VALUES (6427,'616-101','부산시','북구','덕천1동\r\n');
INSERT INTO postno VALUES (6428,'616-102','부산시','북구','덕천2동\r\n');
INSERT INTO postno VALUES (6429,'616-103','부산시','북구','덕천3동\r\n');
INSERT INTO postno VALUES (6430,'616-110','부산시','북구','만덕동\r\n');
INSERT INTO postno VALUES (6431,'616-111','부산시','북구','만덕1동\r\n');
INSERT INTO postno VALUES (6432,'616-112','부산시','북구','만덕2동\r\n');
INSERT INTO postno VALUES (6433,'616-113','부산시','북구','만덕3동\r\n');
INSERT INTO postno VALUES (6434,'616-120','부산시','북구','화명동\r\n');
INSERT INTO postno VALUES (6435,'616-130','부산시','북구','금곡동\r\n');
INSERT INTO postno VALUES (6436,'616-600','부산시','북구','북부산우체국사서함\r\n');
INSERT INTO postno VALUES (6437,'616-737','부산시','북구','구로2동 북구청\r\n');
INSERT INTO postno VALUES (6438,'616-737','부산시','북구','구포2동 부산전문대학\r\n');
INSERT INTO postno VALUES (6439,'617-010','부산시','사상구','주례동\r\n');
INSERT INTO postno VALUES (6440,'617-011','부산시','사상구','주례1동\r\n');
INSERT INTO postno VALUES (6441,'617-012','부산시','사상구','주례2동\r\n');
INSERT INTO postno VALUES (6442,'617-013','부산시','사상구','주례3동\r\n');
INSERT INTO postno VALUES (6443,'617-020','부산시','사상구','학장동\r\n');
INSERT INTO postno VALUES (6444,'617-030','부산시','사상구','엄궁동\r\n');
INSERT INTO postno VALUES (6445,'617-040','부산시','사상구','덕포동\r\n');
INSERT INTO postno VALUES (6446,'617-041','부산시','사상구','덕포1동\r\n');
INSERT INTO postno VALUES (6447,'617-042','부산시','사상구','덕포2동\r\n');
INSERT INTO postno VALUES (6448,'617-050','부산시','사상구','감전동\r\n');
INSERT INTO postno VALUES (6449,'617-051','부산시','사상구','감전1동\r\n');
INSERT INTO postno VALUES (6450,'617-052','부산시','사상구','감전2동\r\n');
INSERT INTO postno VALUES (6451,'617-060','부산시','사상구','괘법동\r\n');
INSERT INTO postno VALUES (6452,'617-070','부산시','사상구','삼락동\r\n');
INSERT INTO postno VALUES (6453,'617-080','부산시','사상구','모라동\r\n');
INSERT INTO postno VALUES (6454,'617-081','부산시','사상구','모라1동\r\n');
INSERT INTO postno VALUES (6455,'617-082','부산시','사상구','모라2동\r\n');
INSERT INTO postno VALUES (6456,'617-083','부산시','사상구','모라3동\r\n');
INSERT INTO postno VALUES (6457,'617-701','부산시','사상구','주례2동 경남전문대학\r\n');
INSERT INTO postno VALUES (6458,'617-716','부산시','사상구','주례2동 동서공과대학교\r\n');
INSERT INTO postno VALUES (6459,'617-736','부산시','사상구','괴법동 부산여자대학\r\n');
INSERT INTO postno VALUES (6460,'617-737','부산시','사상구','주례3동 부산구치소\r\n');
INSERT INTO postno VALUES (6461,'618-140','부산시','강서구','대저동\r\n');
INSERT INTO postno VALUES (6462,'618-141','부산시','강서구','대저1동\r\n');
INSERT INTO postno VALUES (6463,'618-142','부산시','강서구','대저2동\r\n');
INSERT INTO postno VALUES (6464,'618-200','부산시','강서구','명지동\r\n');
INSERT INTO postno VALUES (6465,'618-210','부산시','강서구','녹산동\r\n');
INSERT INTO postno VALUES (6466,'618-220','부산시','강서구','미음동\r\n');
INSERT INTO postno VALUES (6467,'618-230','부산시','강서구','지사동\r\n');
INSERT INTO postno VALUES (6468,'618-240','부산시','강서구','범방동\r\n');
INSERT INTO postno VALUES (6469,'618-250','부산시','강서구','생곡동\r\n');
INSERT INTO postno VALUES (6470,'618-260','부산시','강서구','구랑동\r\n');
INSERT INTO postno VALUES (6471,'618-270','부산시','강서구','송정동\r\n');
INSERT INTO postno VALUES (6472,'618-280','부산시','강서구','화전동\r\n');
INSERT INTO postno VALUES (6473,'618-290','부산시','강서구','신호동\r\n');
INSERT INTO postno VALUES (6474,'618-300','부산시','강서구','강동동\r\n');
INSERT INTO postno VALUES (6475,'618-310','부산시','강서구','가락동\r\n');
INSERT INTO postno VALUES (6476,'618-320','부산시','강서구','죽동동\r\n');
INSERT INTO postno VALUES (6477,'618-330','부산시','강서구','죽림동\r\n');
INSERT INTO postno VALUES (6478,'618-340','부산시','강서구','식만동\r\n');
INSERT INTO postno VALUES (6479,'618-350','부산시','강서구','봉림동\r\n');
INSERT INTO postno VALUES (6480,'618-400','부산시','강서구','천가동\r\n');
INSERT INTO postno VALUES (6481,'618-410','부산시','강서구','성북동\r\n');
INSERT INTO postno VALUES (6482,'618-420','부산시','강서구','동선동\r\n');
INSERT INTO postno VALUES (6483,'618-430','부산시','강서구','눌차동\r\n');
INSERT INTO postno VALUES (6484,'618-440','부산시','강서구','천성동\r\n');
INSERT INTO postno VALUES (6485,'618-450','부산시','강서구','대항동\r\n');
INSERT INTO postno VALUES (6486,'618-701','부산시','강서구','대저1동 강서구청\r\n');
INSERT INTO postno VALUES (6487,'618-702','부산시','강서구','대저2동 김해국제공항건물\r\n');
INSERT INTO postno VALUES (6488,'618-703','부산시','강서구','대저1동 부산교도소\r\n');
INSERT INTO postno VALUES (6489,'619-711','부산시','기장군','장안읍 고리원자력본부\r\n');
INSERT INTO postno VALUES (6490,'619-721','부산시','기장군','기장읍 한일물산\r\n');
INSERT INTO postno VALUES (6491,'619-731','부산시','기장군','정관면 정관농공단지\r\n');
INSERT INTO postno VALUES (6492,'619-870','부산시','기장군','철마면\r\n');
INSERT INTO postno VALUES (6493,'626-870','부산시','기장군','철마면 송정리\r\n');
INSERT INTO postno VALUES (6494,'626-870','부산시','기장군','철마면 임기리\r\n');
INSERT INTO postno VALUES (6495,'619-900','부산시','기장군','기장읍\r\n');
INSERT INTO postno VALUES (6496,'619-910','부산시','기장군','일광면\r\n');
INSERT INTO postno VALUES (6497,'619-950','부산시','기장군','장안읍\r\n');
INSERT INTO postno VALUES (6498,'619-960','부산시','기장군','정관면\r\n');
INSERT INTO postno VALUES (6499,'621-010','경남','김해시','부원동\r\n');
INSERT INTO postno VALUES (6500,'621-020','경남','김해시','동상동\r\n');
INSERT INTO postno VALUES (6501,'621-030','경남','김해시','서상동\r\n');
INSERT INTO postno VALUES (6502,'621-040','경남','김해시','봉황동\r\n');
INSERT INTO postno VALUES (6503,'621-050','경남','김해시','대성동\r\n');
INSERT INTO postno VALUES (6504,'621-060','경남','김해시','구산동\r\n');
INSERT INTO postno VALUES (6505,'621-070','경남','김해시','삼계동\r\n');
INSERT INTO postno VALUES (6506,'621-080','경남','김해시','내동\r\n');
INSERT INTO postno VALUES (6507,'621-090','경남','김해시','외동\r\n');
INSERT INTO postno VALUES (6508,'621-100','경남','김해시','전하동\r\n');
INSERT INTO postno VALUES (6509,'621-110','경남','김해시','강동\r\n');
INSERT INTO postno VALUES (6510,'621-120','경남','김해시','흥동\r\n');
INSERT INTO postno VALUES (6511,'621-130','경남','김해시','풍류동\r\n');
INSERT INTO postno VALUES (6512,'621-140','경남','김해시','명법동\r\n');
INSERT INTO postno VALUES (6513,'621-150','경남','김해시','화목동\r\n');
INSERT INTO postno VALUES (6514,'621-160','경남','김해시','이동\r\n');
INSERT INTO postno VALUES (6515,'621-170','경남','김해시','어방동\r\n');
INSERT INTO postno VALUES (6516,'621-180','경남','김해시','삼정동\r\n');
INSERT INTO postno VALUES (6517,'621-190','경남','김해시','삼방동\r\n');
INSERT INTO postno VALUES (6518,'621-200','경남','김해시','안동\r\n');
INSERT INTO postno VALUES (6519,'621-210','경남','김해시','불암동\r\n');
INSERT INTO postno VALUES (6520,'621-220','경남','김해시','지내동\r\n');
INSERT INTO postno VALUES (6521,'621-600','경남','김해시','김해우체국사서함\r\n');
INSERT INTO postno VALUES (6522,'621-710','경남','김해시','부원동 김해시청\r\n');
INSERT INTO postno VALUES (6523,'621-702','경남','김해시','안동 국제상사(주)건물\r\n');
INSERT INTO postno VALUES (6524,'621-749','경남','김해시','어방동 인제대학교\r\n');
INSERT INTO postno VALUES (6525,'621-800','경남','김해시','진영읍\r\n');
INSERT INTO postno VALUES (6526,'621-810','경남','김해시','상동면\r\n');
INSERT INTO postno VALUES (6527,'621-820','경남','김해시','생림면\r\n');
INSERT INTO postno VALUES (6528,'621-830','경남','김해시','장유면\r\n');
INSERT INTO postno VALUES (6529,'621-840','경남','김해시','주촌면\r\n');
INSERT INTO postno VALUES (6530,'621-870','경남','김해시','한림면\r\n');
INSERT INTO postno VALUES (6531,'621-880','경남','김해시','진례면\r\n');
INSERT INTO postno VALUES (6532,'621-890','경남','김해시','대동면\r\n');
INSERT INTO postno VALUES (6533,'626-010','경남','양산시','남부동\r\n');
INSERT INTO postno VALUES (6534,'626-020','경남','양산시','다방동\r\n');
INSERT INTO postno VALUES (6535,'626-030','경남','양산시','북부동\r\n');
INSERT INTO postno VALUES (6536,'626-040','경남','양산시','명곡동\r\n');
INSERT INTO postno VALUES (6537,'626-050','경남','양산시','중부동\r\n');
INSERT INTO postno VALUES (6538,'626-110','경남','양산시','북정동\r\n');
INSERT INTO postno VALUES (6539,'626-120','경남','양산시','산막동\r\n');
INSERT INTO postno VALUES (6540,'626-130','경남','양산시','신기동\r\n');
INSERT INTO postno VALUES (6541,'626-140','경남','양산시','호계동\r\n');
INSERT INTO postno VALUES (6542,'626-210','경남','양산시','교동\r\n');
INSERT INTO postno VALUES (6543,'626-220','경남','양산시','어곡동\r\n');
INSERT INTO postno VALUES (6544,'626-230','경남','양산시','유산동\r\n');
INSERT INTO postno VALUES (6545,'626-600','경남','양산시','양산우체국사서함\r\n');
INSERT INTO postno VALUES (6546,'626-010','경남','양산시','남부동 양산시청\r\n');
INSERT INTO postno VALUES (6547,'626-810','경남','양산시','물금읍\r\n');
INSERT INTO postno VALUES (6548,'626-820','경남','양산시','동면\r\n');
INSERT INTO postno VALUES (6549,'626-830','경남','양산시','원동면\r\n');
INSERT INTO postno VALUES (6550,'626-840','경남','양산시','웅상읍\r\n');
INSERT INTO postno VALUES (6551,'626-850','경남','양산시','상북면\r\n');
INSERT INTO postno VALUES (6552,'626-860','경남','양산시','하북면\r\n');
INSERT INTO postno VALUES (6553,'627-110','경남','밀양시','가곡동\r\n');
INSERT INTO postno VALUES (6554,'627-111','경남','밀양시','남포동\r\n');
INSERT INTO postno VALUES (6555,'627-120','경남','밀양시','교동\r\n');
INSERT INTO postno VALUES (6556,'627-130','경남','밀양시','내이동\r\n');
INSERT INTO postno VALUES (6557,'627-140','경남','밀양시','내일동\r\n');
INSERT INTO postno VALUES (6558,'627-150','경남','밀양시','삼문동\r\n');
INSERT INTO postno VALUES (6559,'627-162','경남','밀양시','활성동\r\n');
INSERT INTO postno VALUES (6560,'627-171','경남','밀양시','용평동\r\n');
INSERT INTO postno VALUES (6561,'627-600','경남','밀양시','밀양우체국사서함\r\n');
INSERT INTO postno VALUES (6562,'627-150','경남','밀양시','삼문동 밀양시청\r\n');
INSERT INTO postno VALUES (6563,'627-810','경남','밀양시','산외면\r\n');
INSERT INTO postno VALUES (6564,'627-820','겅남','밀양시','단장면\r\n');
INSERT INTO postno VALUES (6565,'627-830','경남','밀양시','산내면\r\n');
INSERT INTO postno VALUES (6566,'627-840','경남','밀양시','상동면\r\n');
INSERT INTO postno VALUES (6567,'627-850','경남','밀양시','부북면\r\n');
INSERT INTO postno VALUES (6568,'627-855','경남','밀양시','부북면 전사포리\r\n');
INSERT INTO postno VALUES (6569,'627-855','경남','밀양시','부북면 제대리\r\n');
INSERT INTO postno VALUES (6570,'627-855','경남','밀양시','부북면 후사포리\r\n');
INSERT INTO postno VALUES (6571,'627-860','경남','밀양시','청도면\r\n');
INSERT INTO postno VALUES (6572,'627-870','경남','밀양시','무안면\r\n');
INSERT INTO postno VALUES (6573,'627-880','경남','밀양시','초동면\r\n');
INSERT INTO postno VALUES (6574,'627-890','경남','밀양시','하남읍\r\n');
INSERT INTO postno VALUES (6575,'627-900','경남','밀양시','삼랑진읍\r\n');
INSERT INTO postno VALUES (6576,'627-910','경남','밀양시','상남면\r\n');
INSERT INTO postno VALUES (6577,'630-010','경남','마산시','회원구 석전동\r\n');
INSERT INTO postno VALUES (6578,'630-011','경남','마산시','회원구 석전1동\r\n');
INSERT INTO postno VALUES (6579,'630-012','경남','마산시','회원구 석전2동\r\n');
INSERT INTO postno VALUES (6580,'630-020','경남','마산시','회원구 회성동\r\n');
INSERT INTO postno VALUES (6581,'630-030','경남','마산시','회원구 두척동\r\n');
INSERT INTO postno VALUES (6582,'630-040','경남','마산시','회원구 회원동\r\n');
INSERT INTO postno VALUES (6583,'630-041','경남','마산시','회원구 회원1동\r\n');
INSERT INTO postno VALUES (6584,'630-042','경남','마산시','회원구 회원2동\r\n');
INSERT INTO postno VALUES (6585,'630-490','경남','마산시','회원구 양덕동\r\n');
INSERT INTO postno VALUES (6586,'630-491','경남','마산시','회원구 양덕1동\r\n');
INSERT INTO postno VALUES (6587,'630-492','경남','마산시','회원구 양덕2동\r\n');
INSERT INTO postno VALUES (6588,'630-493','경남','마산시','회원구 양덕3동\r\n');
INSERT INTO postno VALUES (6589,'630-500','경남','마산시','회원구 봉암동\r\n');
INSERT INTO postno VALUES (6590,'630-510','경남','마산시','회원구 구암동\r\n');
INSERT INTO postno VALUES (6591,'630-511','경남','마산시','회원구 구암1동\r\n');
INSERT INTO postno VALUES (6592,'630-512','경남','마산시','회원구 구암2동\r\n');
INSERT INTO postno VALUES (6593,'630-520','경남','마산시','회원구 합성동\r\n');
INSERT INTO postno VALUES (6594,'630-521','경남','마산시','회원구 합성1동\r\n');
INSERT INTO postno VALUES (6595,'630-522','경남','마산시','회원구 합성2동\r\n');
INSERT INTO postno VALUES (6596,'630-600','경남','마산시','회원구 마산우체국사서함\r\n');
INSERT INTO postno VALUES (6597,'630-650','경남','마산시','회원구 마산수출지역우체사서\r\n');
INSERT INTO postno VALUES (6598,'630-705','경남','마산시','회원구 회성동 마산교도소\r\n');
INSERT INTO postno VALUES (6599,'630-711','경남','마산시','회원구 석전2동 대한생명빌딩\r\n');
INSERT INTO postno VALUES (6600,'630-712','경남','마산시','회원구 석전2동 서안건설빌딩\r\n');
INSERT INTO postno VALUES (6601,'630-713','경남','마산시','합포구 양덕2동 마산MBC건물\r\n');
INSERT INTO postno VALUES (6602,'630-728','경남','마산시','회원구 마산수출자유지역\r\n');
INSERT INTO postno VALUES (6603,'630-729','경남','마산시','회원구 내서읍 마산전문대학\r\n');
INSERT INTO postno VALUES (6604,'630-764','경남','마산시','회원구 봉암동 창신전문대학\r\n');
INSERT INTO postno VALUES (6605,'630-791','경남','마산시','회원구 양덕3동 한일합섬(주)\r\n');
INSERT INTO postno VALUES (6606,'630-850','경남','마산시','회원구 내서읍\r\n');
INSERT INTO postno VALUES (6607,'631-050','경남','마산시','합포구 상남동\r\n');
INSERT INTO postno VALUES (6608,'631-051','경남','마산시','합포구 상남 1동\r\n');
INSERT INTO postno VALUES (6609,'631-052','경남','마산시','합포구 상남 2동\r\n');
INSERT INTO postno VALUES (6610,'631-060','경남','마산시','합포구 중성동\r\n');
INSERT INTO postno VALUES (6611,'631-070','경남','마산시','합포구 부림동\r\n');
INSERT INTO postno VALUES (6612,'631-080','경남','마산시','합포구 수성동\r\n');
INSERT INTO postno VALUES (6613,'631-090','경남','마산시','합포구 창동\r\n');
INSERT INTO postno VALUES (6614,'631-100','경남','마산시','합포구 교원동\r\n');
INSERT INTO postno VALUES (6615,'631-110','경남','마산시','합포구 교방동\r\n');
INSERT INTO postno VALUES (6616,'631-120','경남','마산시','합포구 성호동\r\n');
INSERT INTO postno VALUES (6617,'631-130','경남','마산시','합포구 추산동\r\n');
INSERT INTO postno VALUES (6618,'631-140','경남','마산시','합포구 자산동\r\n');
INSERT INTO postno VALUES (6619,'631-150','경남','마산시','합포구 완월동\r\n');
INSERT INTO postno VALUES (6620,'631-160','경남','마산시','합포구 장군동\r\n');
INSERT INTO postno VALUES (6621,'631-161','경남','마산시','합포구 장군동1가\r\n');
INSERT INTO postno VALUES (6622,'631-162','경남','마산시','합포구 장군동2가\r\n');
INSERT INTO postno VALUES (6623,'631-163','경남','마산시','합포구 장군동3가\r\n');
INSERT INTO postno VALUES (6624,'631-164','경남','마산시','합포구 장군동4가\r\n');
INSERT INTO postno VALUES (6625,'631-165','경남','마산시','합포구 장군동5가\r\n');
INSERT INTO postno VALUES (6626,'631-170','경남','마산시','합포구 신월동\r\n');
INSERT INTO postno VALUES (6627,'631-180','경남','마산시','합포구 대성동\r\n');
INSERT INTO postno VALUES (6628,'631-181','경남','마산시','합포구 대성동1가\r\n');
INSERT INTO postno VALUES (6629,'631-182','경남','마산시','합포구 대성동2가\r\n');
INSERT INTO postno VALUES (6630,'631-190','경남','마산시','합포구 대내동\r\n');
INSERT INTO postno VALUES (6631,'631-200','경남','마산시','합포구 대외동\r\n');
INSERT INTO postno VALUES (6632,'631-210','경남','마산시','합포구 청계동\r\n');
INSERT INTO postno VALUES (6633,'631-220','경남','마산시','합포구 신흥동\r\n');
INSERT INTO postno VALUES (6634,'631-230','경남','마산시','합포구 유록동\r\n');
INSERT INTO postno VALUES (6635,'631-240','경남','마산시','합포구 홍문동\r\n');
INSERT INTO postno VALUES (6636,'631-250','경남','마산시','합포구 화영동\r\n');
INSERT INTO postno VALUES (6637,'631-260','경남','마산시','합포구 월영동\r\n');
INSERT INTO postno VALUES (6638,'631-261','경남','마산시','합포구 월영 1동\r\n');
INSERT INTO postno VALUES (6639,'631-262','경남','마산시','합포구 월영 2동\r\n');
INSERT INTO postno VALUES (6640,'631-270','경남','마산시','합포구 현동\r\n');
INSERT INTO postno VALUES (6641,'631-280','경남','마산시','합포구 우산동\r\n');
INSERT INTO postno VALUES (6642,'631-290','경남','마산시','합포구 예곡동\r\n');
INSERT INTO postno VALUES (6643,'631-300','경남','마산시','합포구 덕동\r\n');
INSERT INTO postno VALUES (6644,'631-310','경남','마산시','합포구 해운동\r\n');
INSERT INTO postno VALUES (6645,'631-320','경남','마산시','합포구 가포동\r\n');
INSERT INTO postno VALUES (6646,'631-330','경남','마산시','합포구 대창동\r\n');
INSERT INTO postno VALUES (6647,'631-340','경남','마산시','합포구 창포동\r\n');
INSERT INTO postno VALUES (6648,'631-341','경남','마산시','합포구 창포동1가\r\n');
INSERT INTO postno VALUES (6649,'631-342','경남','마산시','합포구 창포동2가\r\n');
INSERT INTO postno VALUES (6650,'631-343','경남','마산시','합포구 창포동3가\r\n');
INSERT INTO postno VALUES (6651,'631-350','경남','마산시','합포구 두월동\r\n');
INSERT INTO postno VALUES (6652,'631-351','경남','마산시','합포구 두월동1가\r\n');
INSERT INTO postno VALUES (6653,'631-352','경남','마산시','합포구 두월동2가\r\n');
INSERT INTO postno VALUES (6654,'631-353','경남','마산시','합포구 두월동3가\r\n');
INSERT INTO postno VALUES (6655,'631-360','경남','마산시','합포구 신창동\r\n');
INSERT INTO postno VALUES (6656,'631-370','경남','마산시','합포구 평화동\r\n');
INSERT INTO postno VALUES (6657,'631-380','경남','마산시','합포구 문화동\r\n');
INSERT INTO postno VALUES (6658,'631-390','경남','마산시','합포구 월남동\r\n');
INSERT INTO postno VALUES (6659,'631-391','경남','마산시','합포구 월남동1가\r\n');
INSERT INTO postno VALUES (6660,'631-392','경남','마산시','합포구 월남동2가\r\n');
INSERT INTO postno VALUES (6661,'631-393','경남','마산시','합포구 월남동3가\r\n');
INSERT INTO postno VALUES (6662,'631-394','경남','마산시','합포구 월남동4가\r\n');
INSERT INTO postno VALUES (6663,'631-395','경남','마산시','합포구 월남동5가\r\n');
INSERT INTO postno VALUES (6664,'631-400','경남','마산시','합포구 반월동\r\n');
INSERT INTO postno VALUES (6665,'631-410','경남','마산시','합포구 월포동\r\n');
INSERT INTO postno VALUES (6666,'631-420','경남','마산시','합포구 중앙동\r\n');
INSERT INTO postno VALUES (6667,'631-421','경남','마산시','합포구 중앙동1가\r\n');
INSERT INTO postno VALUES (6668,'631-422','경남','마산시','합포구 중앙동2가\r\n');
INSERT INTO postno VALUES (6669,'631-423','경남','마산시','합포구 중앙동3가\r\n');
INSERT INTO postno VALUES (6670,'631-430','경남','마산시','합포구 서성동\r\n');
INSERT INTO postno VALUES (6671,'631-440','경남','마산시','합포구 신포동\r\n');
INSERT INTO postno VALUES (6672,'631-441','경남','마산시','합포구 신포동1가\r\n');
INSERT INTO postno VALUES (6673,'631-442','경남','마산시','합포구 신포동2가\r\n');
INSERT INTO postno VALUES (6674,'631-450','경남','마산시','합포구 남성동\r\n');
INSERT INTO postno VALUES (6675,'631-460','경남','마산시','합포구 동성동\r\n');
INSERT INTO postno VALUES (6676,'631-470','경남','마산시','합포구 오동동\r\n');
INSERT INTO postno VALUES (6677,'631-480','경남','마산시','합포구 산호동\r\n');
INSERT INTO postno VALUES (6678,'631-481','경남','마산시','합포구 산호1동\r\n');
INSERT INTO postno VALUES (6679,'631-482','경남','마산시','합포구 산호2동\r\n');
INSERT INTO postno VALUES (6680,'631-701','경남','마산시','합포구 경남대학교\r\n');
INSERT INTO postno VALUES (6681,'631-702','경남','마산시','합포구 중앙동2가 마산시청\r\n');
INSERT INTO postno VALUES (6682,'631-712','경남','마산시','합포구 성안백화점\r\n');
INSERT INTO postno VALUES (6683,'631-714','경남','마산시','합포구 마산시티랜드\r\n');
INSERT INTO postno VALUES (6684,'631-714','경남','마산시','합포구 삼성생명빌딩\r\n');
INSERT INTO postno VALUES (6685,'631-810','경남','마산시','합포구 진동면\r\n');
INSERT INTO postno VALUES (6686,'631-820','경남','마산시','합포구 진북면\r\n');
INSERT INTO postno VALUES (6687,'631-830','경남','마산시','합포구 진전면\r\n');
INSERT INTO postno VALUES (6688,'631-835','경남','마산시','합포구 진전면 고사리\r\n');
INSERT INTO postno VALUES (6689,'631-835','경남','마산시','합포구 진전면 금암리\r\n');
INSERT INTO postno VALUES (6690,'631-835','경남','마산시','합포구 진전면 여양리\r\n');
INSERT INTO postno VALUES (6691,'631-835','경남','마산시','합포구 진전면 평암리\r\n');
INSERT INTO postno VALUES (6692,'631-840','경남','마산시','합포구 구산면\r\n');
INSERT INTO postno VALUES (6693,'635-800','경남','창녕군','창녕읍\r\n');
INSERT INTO postno VALUES (6694,'635-810','경남','창녕군','유어면\r\n');
INSERT INTO postno VALUES (6695,'635-820','경남','창녕군','대지면\r\n');
INSERT INTO postno VALUES (6696,'635-830','경남','창녕군','이방면\r\n');
INSERT INTO postno VALUES (6697,'635-860','경남','창녕군','영산면\r\n');
INSERT INTO postno VALUES (6698,'635-870','경남','창녕군','장마면\r\n');
INSERT INTO postno VALUES (6699,'635-880','경남','창녕군','길곡면\r\n');
INSERT INTO postno VALUES (6700,'635-890','경남','창녕군','부곡면\r\n');
INSERT INTO postno VALUES (6701,'635-900','경남','창녕군','남지읍\r\n');
INSERT INTO postno VALUES (6702,'635-910','경남','창녕군','도천면\r\n');
INSERT INTO postno VALUES (6703,'635-920','경남','창녕군','계성면\r\n');
INSERT INTO postno VALUES (6704,'635-930','경남','창녕군','고암면\r\n');
INSERT INTO postno VALUES (6705,'635-940','경남','창녕군','대합면\r\n');
INSERT INTO postno VALUES (6706,'635-950','경남','창녕군','성산면\r\n');
INSERT INTO postno VALUES (6707,'636-800','경남','의령군','의령읍\r\n');
INSERT INTO postno VALUES (6708,'636-810','경남','의령군','화정면\r\n');
INSERT INTO postno VALUES (6709,'636-820','경남','의령군','가례면\r\n');
INSERT INTO postno VALUES (6710,'636-830','경남','의령군','칠곡면\r\n');
INSERT INTO postno VALUES (6711,'636-840','경남','의령군','대의면\r\n');
INSERT INTO postno VALUES (6712,'636-910','경남','의령군','용덕면\r\n');
INSERT INTO postno VALUES (6713,'636-920','경남','의령군','정곡면\r\n');
INSERT INTO postno VALUES (6714,'636-930','경남','의령군','유곡면\r\n');
INSERT INTO postno VALUES (6715,'636-940','경남','의령군','궁유면\r\n');
INSERT INTO postno VALUES (6716,'636-950','경남','의령군','봉수면\r\n');
INSERT INTO postno VALUES (6717,'636-960','경남','의령군','부림면\r\n');
INSERT INTO postno VALUES (6718,'636-970','경남','의령군','낙서면\r\n');
INSERT INTO postno VALUES (6719,'636-980','경남','의령군','지정면\r\n');
INSERT INTO postno VALUES (6720,'637-800','경남','함안군','가야읍\r\n');
INSERT INTO postno VALUES (6721,'637-810','경남','함안군','함안면\r\n');
INSERT INTO postno VALUES (6722,'637-820','경남','함안군','군북면\r\n');
INSERT INTO postno VALUES (6723,'637-830','경남','함안군','법수면\r\n');
INSERT INTO postno VALUES (6724,'637-840','경남','함안군','산인면\r\n');
INSERT INTO postno VALUES (6725,'637-910','경남','함안군','대산면\r\n');
INSERT INTO postno VALUES (6726,'637-920','경남','함안군','칠원면\r\n');
INSERT INTO postno VALUES (6727,'637-930','경남','함안군','칠북면\r\n');
INSERT INTO postno VALUES (6728,'637-940','경남','함안군','칠서면\r\n');
INSERT INTO postno VALUES (6729,'637-955','경남','함안군','여항면\r\n');
INSERT INTO postno VALUES (6730,'638-800','경남','고성군','고성읍\r\n');
INSERT INTO postno VALUES (6731,'638-810','경남','고성군','회화면\r\n');
INSERT INTO postno VALUES (6732,'638-820','경남','고성군','구만면\r\n');
INSERT INTO postno VALUES (6733,'638-830','경남','고성군','거류면\r\n');
INSERT INTO postno VALUES (6734,'638-840','경남','고성군','동해면\r\n');
INSERT INTO postno VALUES (6735,'638-845','경남','고성군','동해면 내곡리\r\n');
INSERT INTO postno VALUES (6736,'638-845','경남','고성군','동해면 봉암리\r\n');
INSERT INTO postno VALUES (6737,'638-845','경남','고성군','동해면 외곡리\r\n');
INSERT INTO postno VALUES (6738,'638-910','경남','고성군','삼산면\r\n');
INSERT INTO postno VALUES (6739,'638-920','경남','고성군','하일면\r\n');
INSERT INTO postno VALUES (6740,'638-930','경남','고성군','하이면\r\n');
INSERT INTO postno VALUES (6741,'638-940','경남','고성군','상리면\r\n');
INSERT INTO postno VALUES (6742,'638-950','경남','고성군','대가면\r\n');
INSERT INTO postno VALUES (6743,'638-960','경남','고성군','영현면\r\n');
INSERT INTO postno VALUES (6744,'638-970','경남','고성군','영오면\r\n');
INSERT INTO postno VALUES (6745,'638-980','경남','고성군','개천면\r\n');
INSERT INTO postno VALUES (6746,'638-990','경남','고성군','마암면\r\n');
INSERT INTO postno VALUES (6747,'641-010','경남','창원시','상남동\r\n');
INSERT INTO postno VALUES (6748,'641-020','경남','창원시','외동\r\n');
INSERT INTO postno VALUES (6749,'641-030','경남','창원시','중앙동\r\n');
INSERT INTO postno VALUES (6750,'641-040','경남','창원시','용지동\r\n');
INSERT INTO postno VALUES (6751,'641-041','경남','창원시','용호동\r\n');
INSERT INTO postno VALUES (6752,'641-042','경남','창원시','용동\r\n');
INSERT INTO postno VALUES (6753,'641-050','경남','창원시','내동\r\n');
INSERT INTO postno VALUES (6754,'641-060','경남','창원시','신월동\r\n');
INSERT INTO postno VALUES (6755,'641-070','경남','창원시','사파정동\r\n');
INSERT INTO postno VALUES (6756,'641-080','경남','창원시','토월동\r\n');
INSERT INTO postno VALUES (6757,'641-090','경남','창원시','남산동\r\n');
INSERT INTO postno VALUES (6758,'641-091','경남','창원시','남양동\r\n');
INSERT INTO postno VALUES (6759,'641-100','경남','창원시','대방동\r\n');
INSERT INTO postno VALUES (6760,'641-110','경남','창원시','가음정동\r\n');
INSERT INTO postno VALUES (6761,'641-111','경남','창원시','가음동\r\n');
INSERT INTO postno VALUES (6762,'641-120','경남','창원시','성주동\r\n');
INSERT INTO postno VALUES (6763,'641-130','경남','창원시','불모산동\r\n');
INSERT INTO postno VALUES (6764,'641-140','경남','창원시','천선동\r\n');
INSERT INTO postno VALUES (6765,'641-150','경남','창원시','안민동\r\n');
INSERT INTO postno VALUES (6766,'641-160','경남','창원시','삼정자동\r\n');
INSERT INTO postno VALUES (6767,'641-170','경남','창원시','반지동\r\n');
INSERT INTO postno VALUES (6768,'641-180','경남','창원시','반림동\r\n');
INSERT INTO postno VALUES (6769,'641-190','경남','창원시','반송동\r\n');
INSERT INTO postno VALUES (6770,'641-200','경남','창원시','대원동\r\n');
INSERT INTO postno VALUES (6771,'641-210','경남','창원시','두대동\r\n');
INSERT INTO postno VALUES (6772,'641-220','경남','창원시','덕정동\r\n');
INSERT INTO postno VALUES (6773,'641-230','경남','창원시','삼동\r\n');
INSERT INTO postno VALUES (6774,'641-240','경남','창원시','퇴촌동\r\n');
INSERT INTO postno VALUES (6775,'641-241','경남','창원시','사림동\r\n');
INSERT INTO postno VALUES (6776,'641-242','경남','창원시','봉림동\r\n');
INSERT INTO postno VALUES (6777,'641-250','경남','창원시','명곡동\r\n');
INSERT INTO postno VALUES (6778,'641-260','경남','창원시','서곡동\r\n');
INSERT INTO postno VALUES (6779,'641-270','경남','창원시','봉곡동\r\n');
INSERT INTO postno VALUES (6780,'641-280','경남','창원시','지귀동\r\n');
INSERT INTO postno VALUES (6781,'641-290','경남','창원시','웅남동\r\n');
INSERT INTO postno VALUES (6782,'641-300','경남','창원시','연덕동\r\n');
INSERT INTO postno VALUES (6783,'641-310','경남','창원시','목동\r\n');
INSERT INTO postno VALUES (6784,'641-315','경남','창원시','성산동\r\n');
INSERT INTO postno VALUES (6785,'641-320','경남','창원시','정동\r\n');
INSERT INTO postno VALUES (6786,'641-330','경남','창원시','남지동\r\n');
INSERT INTO postno VALUES (6787,'641-340','경남','창원시','상복동\r\n');
INSERT INTO postno VALUES (6788,'641-350','경남','창원시','완암동\r\n');
INSERT INTO postno VALUES (6789,'641-360','경남','창원시','양곡동\r\n');
INSERT INTO postno VALUES (6790,'641-370','경남','창원시','신촌동\r\n');
INSERT INTO postno VALUES (6791,'641-380','경남','창원시','월림동\r\n');
INSERT INTO postno VALUES (6792,'641-390','경남','창원시','창곡동\r\n');
INSERT INTO postno VALUES (6793,'641-400','경남','창원시','적현동\r\n');
INSERT INTO postno VALUES (6794,'641-410','경남','창원시','귀산동\r\n');
INSERT INTO postno VALUES (6795,'641-420','경남','창원시','귀곡동\r\n');
INSERT INTO postno VALUES (6796,'641-430','경남','창원시','귀현동\r\n');
INSERT INTO postno VALUES (6797,'641-440','경남','창원시','사화동\r\n');
INSERT INTO postno VALUES (6798,'641-450','경남','창원시','차용동\r\n');
INSERT INTO postno VALUES (6799,'641-460','경남','창원시','반계동\r\n');
INSERT INTO postno VALUES (6800,'641-465','경남','창원시','팔용동\r\n');
INSERT INTO postno VALUES (6801,'641-470','경남','창원시','내리동\r\n');
INSERT INTO postno VALUES (6802,'641-480','경남','창원시','소계동\r\n');
INSERT INTO postno VALUES (6803,'641-490','경남','창원시','동정동\r\n');
INSERT INTO postno VALUES (6804,'641-500','경남','창원시','서상동\r\n');
INSERT INTO postno VALUES (6805,'641-510','경남','창원시','중동\r\n');
INSERT INTO postno VALUES (6806,'641-520','경남','창원시','북동\r\n');
INSERT INTO postno VALUES (6807,'641-530','경남','창원시','소답동\r\n');
INSERT INTO postno VALUES (6808,'641-540','경남','창원시','도계동\r\n');
INSERT INTO postno VALUES (6809,'641-550','경남','창원시','사파동\r\n');
INSERT INTO postno VALUES (6810,'641-560','경남','창원시','명서동\r\n');
INSERT INTO postno VALUES (6811,'641-561','경남','창원시','명서1동\r\n');
INSERT INTO postno VALUES (6812,'641-562','경남','창원시','명서2동\r\n');
INSERT INTO postno VALUES (6813,'641-600','경남','창원시','창원우체국사서함\r\n');
INSERT INTO postno VALUES (6814,'641-701','경남','창원시','신월동 경남신문사건물\r\n');
INSERT INTO postno VALUES (6815,'641-702','경남','창원시','사림동 경남도청\r\n');
INSERT INTO postno VALUES (6816,'641-703','경남','창원시','용호동 창원시청\r\n');
INSERT INTO postno VALUES (6817,'641-704','경남','창원시','사파동 창원지방검찰청\r\n');
INSERT INTO postno VALUES (6818,'641-705','경남','창원시','사파동 창원지방법원\r\n');
INSERT INTO postno VALUES (6819,'641-711','경남','창원시','가음정동 LG제1공장\r\n');
INSERT INTO postno VALUES (6820,'641-712','경남','창원시','내동 효성중공업\r\n');
INSERT INTO postno VALUES (6821,'641-713','경남','창원시','성산동 LG제2공장\r\n');
INSERT INTO postno VALUES (6822,'641-714','경남','창원시','성산동 LG산전\r\n');
INSERT INTO postno VALUES (6823,'641-715','경남','창원시','성산동 효성종합기계(주)\r\n');
INSERT INTO postno VALUES (6824,'641-716','경남','창원시','성주동 삼성항공제1공장\r\n');
INSERT INTO postno VALUES (6825,'641-717','경남','창원시','성주동 삼성항공제2공장\r\n');
INSERT INTO postno VALUES (6826,'641-718','경남','창원시','신월동 국민연금관리공단\r\n');
INSERT INTO postno VALUES (6827,'641-771','경남','창원시','대원동 창원전문대학\r\n');
INSERT INTO postno VALUES (6828,'641-772','경남','창원시','대원동 창원기능대학\r\n');
INSERT INTO postno VALUES (6829,'641-773','경남','창원시','사림동 창원대학교\r\n');
INSERT INTO postno VALUES (6830,'641-790','경남','창원시','한국방송공사창원방송총국\r\n');
INSERT INTO postno VALUES (6831,'641-792','경남','창원시','귀산동 한국중공업건물\r\n');
INSERT INTO postno VALUES (6832,'641-860','경남','창원시','동읍\r\n');
INSERT INTO postno VALUES (6833,'641-870','경남','창원시','북면\r\n');
INSERT INTO postno VALUES (6834,'641-920','경남','창원시','대산면\r\n');
INSERT INTO postno VALUES (6835,'645-010','경남','진해시','신흥동\r\n');
INSERT INTO postno VALUES (6836,'645-011','경남','진해시','동상동\r\n');
INSERT INTO postno VALUES (6837,'645-012','경남','진해시','도만동\r\n');
INSERT INTO postno VALUES (6838,'645-013','경남','진해시','도천동\r\n');
INSERT INTO postno VALUES (6839,'645-014','경남','진해시','비봉동\r\n');
INSERT INTO postno VALUES (6840,'645-015','경남','진해시','송죽동\r\n');
INSERT INTO postno VALUES (6841,'645-016','경남','진해시','현동\r\n');
INSERT INTO postno VALUES (6842,'645-020','경남','진해시','태평동\r\n');
INSERT INTO postno VALUES (6843,'645-030','경남','진해시','대영동\r\n');
INSERT INTO postno VALUES (6844,'645-031','경남','진해시','앵곡동\r\n');
INSERT INTO postno VALUES (6845,'645-032','경남','진해시','숭인동\r\n');
INSERT INTO postno VALUES (6846,'645-033','경남','진해시','무송동\r\n');
INSERT INTO postno VALUES (6847,'645-034','경남','진해시','인의동\r\n');
INSERT INTO postno VALUES (6848,'645-035','경남','진해시','남빈동\r\n');
INSERT INTO postno VALUES (6849,'645-040','경남','진해시','충의동\r\n');
INSERT INTO postno VALUES (6850,'645-050','경남','진해시','안곡동\r\n');
INSERT INTO postno VALUES (6851,'645-051','경남','진해시','속천동\r\n');
INSERT INTO postno VALUES (6852,'645-060','경남','진해시','대죽동\r\n');
INSERT INTO postno VALUES (6853,'645-070','경남','진해시','대천동\r\n');
INSERT INTO postno VALUES (6854,'645-080','경남','진해시','광화동\r\n');
INSERT INTO postno VALUES (6855,'645-090','경남','진해시','중평동\r\n');
INSERT INTO postno VALUES (6856,'645-100','경남','진해시','근화동\r\n');
INSERT INTO postno VALUES (6857,'645-110','경남','진해시','수송동\r\n');
INSERT INTO postno VALUES (6858,'645-120','경남','진해시','익선동\r\n');
INSERT INTO postno VALUES (6859,'645-130','경남','진해시','회현동\r\n');
INSERT INTO postno VALUES (6860,'645-140','경남','진해시','통신동\r\n');
INSERT INTO postno VALUES (6861,'645-150','경남','진해시','중앙동\r\n');
INSERT INTO postno VALUES (6862,'645-160','경남','진해시','창선동\r\n');
INSERT INTO postno VALUES (6863,'645-170','경남','진해시','부흥동\r\n');
INSERT INTO postno VALUES (6864,'645-180','경남','진해시','대흥동\r\n');
INSERT INTO postno VALUES (6865,'645-190','경남','진해시','화천동\r\n');
INSERT INTO postno VALUES (6866,'645-200','경남','진해시','송학동\r\n');
INSERT INTO postno VALUES (6867,'645-210','경남','진해시','평안동\r\n');
INSERT INTO postno VALUES (6868,'645-220','경남','진해시','인사동\r\n');
INSERT INTO postno VALUES (6869,'645-230','경남','진해시','충무동\r\n');
INSERT INTO postno VALUES (6870,'645-240','경남','진해시','제황산동\r\n');
INSERT INTO postno VALUES (6871,'645-250','경남','진해시','여좌동\r\n');
INSERT INTO postno VALUES (6872,'645-251','경남','진해시','여좌1동\r\n');
INSERT INTO postno VALUES (6873,'645-252','경남','진해시','여좌2동\r\n');
INSERT INTO postno VALUES (6874,'645-253','경남','진해시','여좌3동\r\n');
INSERT INTO postno VALUES (6875,'645-260','경남','진해시','태백동\r\n');
INSERT INTO postno VALUES (6876,'645-270','경남','진해시','경화동\r\n');
INSERT INTO postno VALUES (6877,'645-271','경남','진해시','경화1동\r\n');
INSERT INTO postno VALUES (6878,'645-272','경남','진해시','경화2동\r\n');
INSERT INTO postno VALUES (6879,'645-273','경남','진해시','경화3동\r\n');
INSERT INTO postno VALUES (6880,'645-280','경남','진해시','석동\r\n');
INSERT INTO postno VALUES (6881,'645-290','경남','진해시','이동\r\n');
INSERT INTO postno VALUES (6882,'645-300','경남','진해시','자은동\r\n');
INSERT INTO postno VALUES (6883,'645-310','경남','진해시','덕산동\r\n');
INSERT INTO postno VALUES (6884,'645-320','경남','진해시','풍호동\r\n');
INSERT INTO postno VALUES (6885,'645-330','경남','진해시','장천동\r\n');
INSERT INTO postno VALUES (6886,'645-340','경남','진해시','행암동\r\n');
INSERT INTO postno VALUES (6887,'645-350','경남','진해시','원포동\r\n');
INSERT INTO postno VALUES (6888,'645-360','경남','진해시','성내동\r\n');
INSERT INTO postno VALUES (6889,'645-370','경남','진해시','남문동\r\n');
INSERT INTO postno VALUES (6890,'645-380','경남','진해시','북부동\r\n');
INSERT INTO postno VALUES (6891,'645-390','경남','진해시','서중동\r\n');
INSERT INTO postno VALUES (6892,'645-400','경남','진해시','제덕동\r\n');
INSERT INTO postno VALUES (6893,'645-410','경남','진해시','수도동\r\n');
INSERT INTO postno VALUES (6894,'645-420','경남','진해시','연도동\r\n');
INSERT INTO postno VALUES (6895,'645-430','경남','진해시','죽곡동\r\n');
INSERT INTO postno VALUES (6896,'645-440','경남','진해시','명동\r\n');
INSERT INTO postno VALUES (6897,'645-450','경남','진해시','마천동\r\n');
INSERT INTO postno VALUES (6898,'645-460','경남','진해시','대장동\r\n');
INSERT INTO postno VALUES (6899,'645-470','경남','진해시','소사동\r\n');
INSERT INTO postno VALUES (6900,'645-480','경남','진해시','남양동\r\n');
INSERT INTO postno VALUES (6901,'645-490','경남','진해시','두동\r\n');
INSERT INTO postno VALUES (6902,'645-500','경남','진해시','가주동\r\n');
INSERT INTO postno VALUES (6903,'645-510','경남','진해시','용원동\r\n');
INSERT INTO postno VALUES (6904,'645-520','경남','진해시','안골동\r\n');
INSERT INTO postno VALUES (6905,'645-530','경남','진해시','청안동\r\n');
INSERT INTO postno VALUES (6906,'645-600','경남','진해시','진해우체국사서함\r\n');
INSERT INTO postno VALUES (6907,'645-701','경남','진해시','충무동 진해시청\r\n');
INSERT INTO postno VALUES (6908,'650-010','경남','통영시','무전동\r\n');
INSERT INTO postno VALUES (6909,'650-020','경남','통영시','북신동\r\n');
INSERT INTO postno VALUES (6910,'650-030','경남','통영시','정량동\r\n');
INSERT INTO postno VALUES (6911,'650-040','경남','통영시','태평동\r\n');
INSERT INTO postno VALUES (6912,'650-050','경남','통영시','문화동\r\n');
INSERT INTO postno VALUES (6913,'650-060','경남','통영시','중앙동\r\n');
INSERT INTO postno VALUES (6914,'650-070','경남','통영시','동호동\r\n');
INSERT INTO postno VALUES (6915,'650-080','경남','통영시','항남동\r\n');
INSERT INTO postno VALUES (6916,'650-090','경남','통영시','서호동\r\n');
INSERT INTO postno VALUES (6917,'650-100','경남','통영시','명정동\r\n');
INSERT INTO postno VALUES (6918,'650-110','경남','통영시','도천동\r\n');
INSERT INTO postno VALUES (6919,'650-120','경남','통영시','당동\r\n');
INSERT INTO postno VALUES (6920,'650-130','경남','통영시','미수동\r\n');
INSERT INTO postno VALUES (6921,'650-131','경남','통영시','미수1동\r\n');
INSERT INTO postno VALUES (6922,'650-132','경남','통영시','미수2동\r\n');
INSERT INTO postno VALUES (6923,'650-140','경남','통영시','봉평동\r\n');
INSERT INTO postno VALUES (6924,'650-150','경남','통영시','도남동\r\n');
INSERT INTO postno VALUES (6925,'650-151','경남','통영시','도남1동\r\n');
INSERT INTO postno VALUES (6926,'650-152','경남','통영시','도남2동\r\n');
INSERT INTO postno VALUES (6927,'650-160','경남','통영시','인평동\r\n');
INSERT INTO postno VALUES (6928,'650-170','경남','통영시','평림동\r\n');
INSERT INTO postno VALUES (6929,'650-171','경남','통영시','평림1동\r\n');
INSERT INTO postno VALUES (6930,'650-172','경남','통영시','평림2동\r\n');
INSERT INTO postno VALUES (6931,'650-600','경남','통영시','통영우체국사서함\r\n');
INSERT INTO postno VALUES (6932,'650-810','경남','통영시','도산면\r\n');
INSERT INTO postno VALUES (6933,'650-820','경남','통영시','광도면\r\n');
INSERT INTO postno VALUES (6934,'650-830','경남','통영시','용남면\r\n');
INSERT INTO postno VALUES (6935,'650-910','경남','통영시','욕지면\r\n');
INSERT INTO postno VALUES (6936,'650-920','경남','통영시','한산면\r\n');
INSERT INTO postno VALUES (6937,'650-930','경남','통영시','사량면\r\n');
INSERT INTO postno VALUES (6938,'650-940','경남','통영시','산양읍\r\n');
INSERT INTO postno VALUES (6939,'650-945','경남','통영시','산양읍 저림리\r\n');
INSERT INTO postno VALUES (6940,'650-945','경남','통영시','산양읍 추도리\r\n');
INSERT INTO postno VALUES (6941,'650-945','경남','통영시','산양읍 연곡리\r\n');
INSERT INTO postno VALUES (6942,'656-040','경남','거제시','마전동\r\n');
INSERT INTO postno VALUES (6943,'656-050','경남','거제시','능포동\r\n');
INSERT INTO postno VALUES (6944,'656-080','경남','거제시','두모동\r\n');
INSERT INTO postno VALUES (6945,'656-130','경남','거제시','옥포동\r\n');
INSERT INTO postno VALUES (6946,'656-131','경남','거제시','옥포1동\r\n');
INSERT INTO postno VALUES (6947,'656-132','경남','거제시','옥포2동\r\n');
INSERT INTO postno VALUES (6948,'656-210','경남','거제시','장승포동\r\n');
INSERT INTO postno VALUES (6949,'656-220','경남','거제시','아주동\r\n');
INSERT INTO postno VALUES (6950,'656-221','경남','거제시','아양동\r\n');
INSERT INTO postno VALUES (6951,'656-610','경남','거제시','장승포우체국사서함\r\n');
INSERT INTO postno VALUES (6952,'656-701','경남','거제시','일운면 거제전문대학\r\n');
INSERT INTO postno VALUES (6953,'656-714','경남','거제시','아주동 대우조선공업(주)\r\n');
INSERT INTO postno VALUES (6954,'656-800','경남','거제시','신현읍\r\n');
INSERT INTO postno VALUES (6955,'656-810','경남','거제시','연초면\r\n');
INSERT INTO postno VALUES (6956,'656-820','경남','거제시','하청면\r\n');
INSERT INTO postno VALUES (6957,'656-830','경남','거제시','장목면\r\n');
INSERT INTO postno VALUES (6958,'656-840','경남','거제시','남부면\r\n');
INSERT INTO postno VALUES (6959,'656-850','경남','거제시','동부면\r\n');
INSERT INTO postno VALUES (6960,'656-860','경남','거제시','거제읍\r\n');
INSERT INTO postno VALUES (6961,'656-870','경남','거제시','둔덕면\r\n');
INSERT INTO postno VALUES (6962,'656-880','경남','거제시','사등면\r\n');
INSERT INTO postno VALUES (6963,'656-890','경남','거제시','일운면\r\n');
INSERT INTO postno VALUES (6964,'660-010','경남','진주시','중안동\r\n');
INSERT INTO postno VALUES (6965,'660-020','경남','진주시','인사동\r\n');
INSERT INTO postno VALUES (6966,'660-030','경남','진주시','남성동\r\n');
INSERT INTO postno VALUES (6967,'660-040','경남','진주시','봉곡동\r\n');
INSERT INTO postno VALUES (6968,'660-050','경남','진주시','상봉동\r\n');
INSERT INTO postno VALUES (6969,'660-051','경남','진주시','상봉동동\r\n');
INSERT INTO postno VALUES (6970,'660-052','경남','진주시','상봉서동\r\n');
INSERT INTO postno VALUES (6971,'660-070','경남','진주시','유곡동\r\n');
INSERT INTO postno VALUES (6972,'660-080','경남','진주시','이현동\r\n');
INSERT INTO postno VALUES (6973,'660-100','경남','진주시','신안동\r\n');
INSERT INTO postno VALUES (6974,'660-110','경남','진주시','평거동\r\n');
INSERT INTO postno VALUES (6975,'660-120','경남','진주시','판문동\r\n');
INSERT INTO postno VALUES (6976,'660-140','경남','진주시','대안동\r\n');
INSERT INTO postno VALUES (6977,'660-150','경남','진주시','동성동\r\n');
INSERT INTO postno VALUES (6978,'660-160','경남','진주시','본성동\r\n');
INSERT INTO postno VALUES (6979,'660-170','경남','진주시','장대동\r\n');
INSERT INTO postno VALUES (6980,'660-180','경남','진주시','수정동\r\n');
INSERT INTO postno VALUES (6981,'660-200','경남','진주시','옥봉동\r\n');
INSERT INTO postno VALUES (6982,'660-201','경남','진주시','옥봉남동\r\n');
INSERT INTO postno VALUES (6983,'660-202','경남','진주시','옥봉북동\r\n');
INSERT INTO postno VALUES (6984,'660-220','경남','진주시','봉래동\r\n');
INSERT INTO postno VALUES (6985,'660-230','경남','진주시','평안동\r\n');
INSERT INTO postno VALUES (6986,'660-240','경남','진주시','계동\r\n');
INSERT INTO postno VALUES (6987,'660-250','경남','진주시','강남동\r\n');
INSERT INTO postno VALUES (6988,'660-260','경남','진주시','망경동\r\n');
INSERT INTO postno VALUES (6989,'660-261','경남','진주시','망경남동\r\n');
INSERT INTO postno VALUES (6990,'660-262','경남','진주시','망경북동\r\n');
INSERT INTO postno VALUES (6991,'660-280','경남','진주시','칠암동\r\n');
INSERT INTO postno VALUES (6992,'660-290','경남','진주시','주약동\r\n');
INSERT INTO postno VALUES (6993,'660-300','경남','진주시','가좌동\r\n');
INSERT INTO postno VALUES (6994,'660-310','경남','진주시','호탄동\r\n');
INSERT INTO postno VALUES (6995,'660-320','경남','진주시','상대동\r\n');
INSERT INTO postno VALUES (6996,'660-321','경남','진주시','상대1동\r\n');
INSERT INTO postno VALUES (6997,'660-322','경남','진주시','상대2동\r\n');
INSERT INTO postno VALUES (6998,'660-330','경남','진주시','하대동\r\n');
INSERT INTO postno VALUES (6999,'660-340','경남','진주시','상평동\r\n');
INSERT INTO postno VALUES (7000,'660-360','경남','진주시','초전동\r\n');
INSERT INTO postno VALUES (7001,'660-380','경남','진주시','장재동\r\n');
INSERT INTO postno VALUES (7002,'660-390','경남','진주시','하촌동\r\n');
INSERT INTO postno VALUES (7003,'660-400','경남','진주시','귀곡동\r\n');
INSERT INTO postno VALUES (7004,'660-600','경남','진주시','진주우체국사서함\r\n');
INSERT INTO postno VALUES (7005,'660-701','경남','진주시','가좌동 경상대학교\r\n');
INSERT INTO postno VALUES (7006,'660-702','경남','진주시','칠암동 경상대학병원\r\n');
INSERT INTO postno VALUES (7007,'660-728','경남','진주시','진주문화방송국건물\r\n');
INSERT INTO postno VALUES (7008,'660-750','경남','진주시','가좌동 연암공업전문대학\r\n');
INSERT INTO postno VALUES (7009,'660-756','경남','진주시','신안동 진주교육대학교\r\n');
INSERT INTO postno VALUES (7010,'660-757','경남','진주시','진주간호보건전문대학\r\n');
INSERT INTO postno VALUES (7011,'660-758','경남','진주시','칠암동 진주산업대학교\r\n');
INSERT INTO postno VALUES (7012,'660-759','경남','진주시','문산읍 진주전문대학\r\n');
INSERT INTO postno VALUES (7013,'660-760','경남','진주시','본성동 진주시청\r\n');
INSERT INTO postno VALUES (7014,'660-790','경남','진주시','한국방송공사진주방송국\r\n');
INSERT INTO postno VALUES (7015,'660-810','경남','진주시','나동면\r\n');
INSERT INTO postno VALUES (7016,'660-820','경남','진주시','정촌면\r\n');
INSERT INTO postno VALUES (7017,'660-830','경남','진주시','금곡면\r\n');
INSERT INTO postno VALUES (7018,'660-840','경남','진주시','문산읍\r\n');
INSERT INTO postno VALUES (7019,'660-850','경남','진주시','진성면\r\n');
INSERT INTO postno VALUES (7020,'660-860','경남','진주시','일반성면\r\n');
INSERT INTO postno VALUES (7021,'660-870','경남','진주시','이반성면\r\n');
INSERT INTO postno VALUES (7022,'660-880','경남','진주시','사봉면\r\n');
INSERT INTO postno VALUES (7023,'660-890','경남','진주시','지수면\r\n');
INSERT INTO postno VALUES (7024,'660-910','경남','진주시','대곡면\r\n');
INSERT INTO postno VALUES (7025,'660-920','경남','진주시','금산면\r\n');
INSERT INTO postno VALUES (7026,'660-930','경남','진주시','집현면\r\n');
INSERT INTO postno VALUES (7027,'660-940','경남','진주시','미천면\r\n');
INSERT INTO postno VALUES (7028,'660-950','경남','진주시','명석면\r\n');
INSERT INTO postno VALUES (7029,'660-960','경남','진주시','대평면\r\n');
INSERT INTO postno VALUES (7030,'660-970','경남','진주시','수곡면\r\n');
INSERT INTO postno VALUES (7031,'664-010','경남','사천시','선구동\r\n');
INSERT INTO postno VALUES (7032,'664-020','경남','사천시','동동\r\n');
INSERT INTO postno VALUES (7033,'664-030','경남','사천시','서동\r\n');
INSERT INTO postno VALUES (7034,'664-040','경남','사천시','대방동\r\n');
INSERT INTO postno VALUES (7035,'664-050','경남','사천시','실안동\r\n');
INSERT INTO postno VALUES (7036,'664-060','경남','사천시','송포동\r\n');
INSERT INTO postno VALUES (7037,'664-070','경남','사천시','노룡동\r\n');
INSERT INTO postno VALUES (7038,'664-080','경남','사천시','대포동\r\n');
INSERT INTO postno VALUES (7039,'664-090','경남','사천시','백천동\r\n');
INSERT INTO postno VALUES (7040,'664-100','경남','사천시','신벽동\r\n');
INSERT INTO postno VALUES (7041,'664-110','경남','사천시','죽림동\r\n');
INSERT INTO postno VALUES (7042,'664-120','경남','사천시','동림동\r\n');
INSERT INTO postno VALUES (7043,'664-130','경남','사천시','좌룡동\r\n');
INSERT INTO postno VALUES (7044,'664-140','경남','사천시','와룡동\r\n');
INSERT INTO postno VALUES (7045,'664-150','경남','사천시','용강동\r\n');
INSERT INTO postno VALUES (7046,'664-160','경남','사천시','벌리동\r\n');
INSERT INTO postno VALUES (7047,'664-170','경남','사천시','봉남동\r\n');
INSERT INTO postno VALUES (7048,'664-180','경남','사천시','이금동\r\n');
INSERT INTO postno VALUES (7049,'664-190','경남','사천시','이홀동\r\n');
INSERT INTO postno VALUES (7050,'664-200','경남','사천시','궁지동\r\n');
INSERT INTO postno VALUES (7051,'664-210','경남','사천시','사등동\r\n');
INSERT INTO postno VALUES (7052,'664-220','경남','사천시','향촌동\r\n');
INSERT INTO postno VALUES (7053,'664-230','경남','사천시','동금동\r\n');
INSERT INTO postno VALUES (7054,'664-240','경남','사천시','서금동\r\n');
INSERT INTO postno VALUES (7055,'664-250','경남','사천시','신수동\r\n');
INSERT INTO postno VALUES (7056,'664-260','경남','사천시','늑도동\r\n');
INSERT INTO postno VALUES (7057,'664-270','경남','사천시','마도동\r\n');
INSERT INTO postno VALUES (7058,'664-600','경남','사천시','삼천포우체국사서함\r\n');
INSERT INTO postno VALUES (7059,'664-800','경남','사천시','사천읍\r\n');
INSERT INTO postno VALUES (7060,'664-810','경남','사천시','축동면\r\n');
INSERT INTO postno VALUES (7061,'664-820','경남','사천시','서포면\r\n');
INSERT INTO postno VALUES (7062,'664-910','경남','사천시','곤양면\r\n');
INSERT INTO postno VALUES (7063,'664-920','경남','사천시','곤명면\r\n');
INSERT INTO postno VALUES (7064,'664-930','경남','사천시','정동면\r\n');
INSERT INTO postno VALUES (7065,'664-940','경남','사천시','사남면\r\n');
INSERT INTO postno VALUES (7066,'664-950','경남','사천시','용현면\r\n');
INSERT INTO postno VALUES (7067,'666-800','경남','산청군','산청읍\r\n');
INSERT INTO postno VALUES (7068,'666-810','경남','산청군','차황면\r\n');
INSERT INTO postno VALUES (7069,'666-820','경남','산청군','오부면\r\n');
INSERT INTO postno VALUES (7070,'666-830','경남','산청군','금서면\r\n');
INSERT INTO postno VALUES (7071,'666-910','경남','산청군','생초면\r\n');
INSERT INTO postno VALUES (7072,'666-920','경남','산청군','삼장면\r\n');
INSERT INTO postno VALUES (7073,'666-930','경남','산청군','시천면\r\n');
INSERT INTO postno VALUES (7074,'666-940','경남','산청군','단성면\r\n');
INSERT INTO postno VALUES (7075,'666-950','경남','산청군','신등면\r\n');
INSERT INTO postno VALUES (7076,'666-960','경남','산청군','신안면\r\n');
INSERT INTO postno VALUES (7077,'666-970','경남','산청군','생비량면\r\n');
INSERT INTO postno VALUES (7078,'667-800','경남','하동군','하동읍\r\n');
INSERT INTO postno VALUES (7079,'667-810','경남','하동군','악양면\r\n');
INSERT INTO postno VALUES (7080,'667-820','경남','하동군','화개면\r\n');
INSERT INTO postno VALUES (7081,'667-830','경남','하동군','적량면\r\n');
INSERT INTO postno VALUES (7082,'667-840','경남','하동군','횡천면\r\n');
INSERT INTO postno VALUES (7083,'667-850','경남','하동군','양보면\r\n');
INSERT INTO postno VALUES (7084,'667-860','경남','하동군','고전면\r\n');
INSERT INTO postno VALUES (7085,'667-870','경남','하동군','북천면\r\n');
INSERT INTO postno VALUES (7086,'667-880','경남','하동군','청암면\r\n');
INSERT INTO postno VALUES (7087,'667-805','경남','하동군','청암면 궁항리\r\n');
INSERT INTO postno VALUES (7088,'667-805','경남','하동군','청암면 위태리\r\n');
INSERT INTO postno VALUES (7089,'667-805','경남','하동군','청암면 회신리\r\n');
INSERT INTO postno VALUES (7090,'667-890','경남','하동군','옥종면\r\n');
INSERT INTO postno VALUES (7091,'667-910','경남','하동군','진교면\r\n');
INSERT INTO postno VALUES (7092,'667-920','경남','하동군','금남면\r\n');
INSERT INTO postno VALUES (7093,'667-930','경남','하동군','금성면\r\n');
INSERT INTO postno VALUES (7094,'668-800','경남','남해군','남해읍\r\n');
INSERT INTO postno VALUES (7095,'668-810','경남','남해군','이동면\r\n');
INSERT INTO postno VALUES (7096,'668-820','경남','남해군','상주면\r\n');
INSERT INTO postno VALUES (7097,'668-830','경남','남해군','미조면\r\n');
INSERT INTO postno VALUES (7098,'668-840','경남','남해군','삼동면\r\n');
INSERT INTO postno VALUES (7099,'668-850','경남','남해군','창선면\r\n');
INSERT INTO postno VALUES (7100,'668-860','경남','남해군','남면\r\n');
INSERT INTO postno VALUES (7101,'668-870','경남','남해군','서면\r\n');
INSERT INTO postno VALUES (7102,'668-875','경남','남해군','서면 남상리\r\n');
INSERT INTO postno VALUES (7103,'668-875','경남','남해군','서면 노구리\r\n');
INSERT INTO postno VALUES (7104,'668-875','경남','남해군','서면 정포리\r\n');
INSERT INTO postno VALUES (7105,'668-875','경남','남해군','서면 중현리\r\n');
INSERT INTO postno VALUES (7106,'668-880','경남','남해군','고현면\r\n');
INSERT INTO postno VALUES (7107,'668-890','경남','남해군','설천면\r\n');
INSERT INTO postno VALUES (7108,'670-800','경남','거창군','거창읍\r\n');
INSERT INTO postno VALUES (7109,'670-810','경남','거창군','주상면\r\n');
INSERT INTO postno VALUES (7110,'670-820','경남','거창군','웅양면\r\n');
INSERT INTO postno VALUES (7111,'670-830','경남','거창군','고제면\r\n');
INSERT INTO postno VALUES (7112,'670-840','경남','거창군','북상면\r\n');
INSERT INTO postno VALUES (7113,'670-850','경남','거창군','위천면\r\n');
INSERT INTO postno VALUES (7114,'670-860','경남','거창군','마리면\r\n');
INSERT INTO postno VALUES (7115,'670-870','경남','거창군','신원면\r\n');
INSERT INTO postno VALUES (7116,'670-880','경남','거창군','남상면\r\n');
INSERT INTO postno VALUES (7117,'670-890','경남','거창군','남하면\r\n');
INSERT INTO postno VALUES (7118,'670-910','경남','거창군','가조면\r\n');
INSERT INTO postno VALUES (7119,'670-920','경남','거창군','가북면\r\n');
INSERT INTO postno VALUES (7120,'676-800','경남','함양군','함양읍\r\n');
INSERT INTO postno VALUES (7121,'676-810','경남','함양군','수동면\r\n');
INSERT INTO postno VALUES (7122,'676-820','경남','함양군','안의면\r\n');
INSERT INTO postno VALUES (7123,'676-830','경남','함양군','서하면\r\n');
INSERT INTO postno VALUES (7124,'676-840','경남','함양군','서상면\r\n');
INSERT INTO postno VALUES (7125,'676-850','경남','함양군','지곡면\r\n');
INSERT INTO postno VALUES (7126,'676-860','경남','함양군','병곡면\r\n');
INSERT INTO postno VALUES (7127,'676-870','경남','함양군','백전면\r\n');
INSERT INTO postno VALUES (7128,'676-880','경남','함양군','휴천면\r\n');
INSERT INTO postno VALUES (7129,'676-890','경남','함양군','유림면\r\n');
INSERT INTO postno VALUES (7130,'676-910','경남','함양군','마천면\r\n');
INSERT INTO postno VALUES (7131,'678-800','경남','합천군','합천읍\r\n');
INSERT INTO postno VALUES (7132,'678-810','경남','합천군','율곡면\r\n');
INSERT INTO postno VALUES (7133,'678-820','경남','합천군','초계면\r\n');
INSERT INTO postno VALUES (7134,'678-830','경남','합천군','적중면\r\n');
INSERT INTO postno VALUES (7135,'678-840','경남','합천군','쌍책면\r\n');
INSERT INTO postno VALUES (7136,'678-850','경남','합천군','청덕면\r\n');
INSERT INTO postno VALUES (7137,'678-860','경남','합천군','덕곡면\r\n');
INSERT INTO postno VALUES (7138,'678-870','경남','합천군','묘산면\r\n');
INSERT INTO postno VALUES (7139,'678-880','경남','합천군','야로면\r\n');
INSERT INTO postno VALUES (7140,'678-890','경남','합천군','가야면\r\n');
INSERT INTO postno VALUES (7141,'678-895','경남','합천군','가야면 치인리\r\n');
INSERT INTO postno VALUES (7142,'678-910','경남','합천군','용주면\r\n');
INSERT INTO postno VALUES (7143,'678-920','경남','합천군','대병면\r\n');
INSERT INTO postno VALUES (7144,'678-930','경남','합천군','봉산면\r\n');
INSERT INTO postno VALUES (7145,'678-940','경남','합천군','대양면\r\n');
INSERT INTO postno VALUES (7146,'678-950','경남','합천군','쌍백면\r\n');
INSERT INTO postno VALUES (7147,'678-960','경남','합천군','삼가면\r\n');
INSERT INTO postno VALUES (7148,'678-970','경남','합천군','가회면\r\n');
INSERT INTO postno VALUES (7149,'680-010','경남','울산시','남구 신정동\r\n');
INSERT INTO postno VALUES (7150,'680-011','경남','울산시','남구 신정1동\r\n');
INSERT INTO postno VALUES (7151,'680-012','경남','울산시','남구 신정2동\r\n');
INSERT INTO postno VALUES (7152,'680-013','경남','울산시','남구 신정3동\r\n');
INSERT INTO postno VALUES (7153,'680-014','경남','울산시','남구 신정4동\r\n');
INSERT INTO postno VALUES (7154,'680-015','경남','울산시','남구 신정5동\r\n');
INSERT INTO postno VALUES (7155,'680-020','경남','울산시','남구 삼산동\r\n');
INSERT INTO postno VALUES (7156,'680-030','경남','울산시','남구 달동\r\n');
INSERT INTO postno VALUES (7157,'680-040','경남','울산시','남구 야음동\r\n');
INSERT INTO postno VALUES (7158,'680-041','경남','울산시','남구 야음1동\r\n');
INSERT INTO postno VALUES (7159,'680-042','경남','울산시','남구 야음2동\r\n');
INSERT INTO postno VALUES (7160,'680-043','경남','울산시','남구 야음3동\r\n');
INSERT INTO postno VALUES (7161,'680-050','경남','울산시','남구 매암동\r\n');
INSERT INTO postno VALUES (7162,'680-060','경남','울산시','남구 장생포동\r\n');
INSERT INTO postno VALUES (7163,'680-070','경남','울산시','남구 용잠동\r\n');
INSERT INTO postno VALUES (7164,'680-080','경남','울산시','남구 옥동\r\n');
INSERT INTO postno VALUES (7165,'680-090','경남','울산시','남구 여천동\r\n');
INSERT INTO postno VALUES (7166,'680-100','경남','울산시','남구 선암동\r\n');
INSERT INTO postno VALUES (7167,'680-110','경남','울산시','남구 부곡동\r\n');
INSERT INTO postno VALUES (7168,'680-120','경남','울산시','남구 남화동\r\n');
INSERT INTO postno VALUES (7169,'680-130','경남','울산시','남구 고사동\r\n');
INSERT INTO postno VALUES (7170,'680-140','경남','울산시','남구 성암동\r\n');
INSERT INTO postno VALUES (7171,'680-150','경남','울산시','남구 용연동\r\n');
INSERT INTO postno VALUES (7172,'680-160','경남','울산시','남구 황성동\r\n');
INSERT INTO postno VALUES (7173,'680-170','경남','울산시','남구 두왕동\r\n');
INSERT INTO postno VALUES (7174,'680-180','경남','울산시','남구 상개동\r\n');
INSERT INTO postno VALUES (7175,'680-190','경남','울산시','남구 무거동\r\n');
INSERT INTO postno VALUES (7176,'680-191','경남','울산시','남구 무거1동\r\n');
INSERT INTO postno VALUES (7177,'680-192','경남','울산시','남구 무거2동\r\n');
INSERT INTO postno VALUES (7178,'680-200','경남','울산시','남구 개운동\r\n');
INSERT INTO postno VALUES (7179,'680-600','경남','울산시','남구 울산우체국사서함\r\n');
INSERT INTO postno VALUES (7180,'680-701','경남','울산시','남구 신정1동 울산시청\r\n');
INSERT INTO postno VALUES (7181,'680-749','경남','울산시','남구 무거2동 울산대학교\r\n');
INSERT INTO postno VALUES (7182,'680-790','경남','울산시','남구 한국방송공사울산방송국\r\n');
INSERT INTO postno VALUES (7183,'681-040','경남','울산시','중구 염포동\r\n');
INSERT INTO postno VALUES (7184,'681-180','경남','울산시','중구 학성동\r\n');
INSERT INTO postno VALUES (7185,'681-190','경남','울산시','중구 옥교동\r\n');
INSERT INTO postno VALUES (7186,'681-200','경남','울산시','중구 학산동\r\n');
INSERT INTO postno VALUES (7187,'681-210','경남','울산시','중구 성남동\r\n');
INSERT INTO postno VALUES (7188,'681-220','경남','울산시','중구 복산동\r\n');
INSERT INTO postno VALUES (7189,'681-221','경남','울산시','중구 복산1동\r\n');
INSERT INTO postno VALUES (7190,'681-222','경남','울산시','중구 복산2동\r\n');
INSERT INTO postno VALUES (7191,'681-230','경남','울산시','중구 북정동\r\n');
INSERT INTO postno VALUES (7192,'681-240','경남','울산시','중구 교동\r\n');
INSERT INTO postno VALUES (7193,'681-250','경남','울산시','중구 우정동\r\n');
INSERT INTO postno VALUES (7194,'681-260','경남','울산시','중구 반구동\r\n');
INSERT INTO postno VALUES (7195,'681-261','경남','울산시','중구 반구1동\r\n');
INSERT INTO postno VALUES (7196,'681-262','경남','울산시','중구 반구2동\r\n');
INSERT INTO postno VALUES (7197,'681-270','경남','울산시','중구 남외동\r\n');
INSERT INTO postno VALUES (7198,'681-280','경남','울산시','중구 동동\r\n');
INSERT INTO postno VALUES (7199,'681-290','경남','울산시','중구 서동\r\n');
INSERT INTO postno VALUES (7200,'681-300','경남','울산시','중구 성안동\r\n');
INSERT INTO postno VALUES (7201,'681-310','경남','울산시','중구 유곡동\r\n');
INSERT INTO postno VALUES (7202,'681-320','경남','울산시','중구 태화동\r\n');
INSERT INTO postno VALUES (7203,'681-340','경남','울산시','중구 다운동\r\n');
INSERT INTO postno VALUES (7204,'681-350','경남','울산시','중구 진장동\r\n');
INSERT INTO postno VALUES (7205,'681-360','경남','울산시','중구 효문동\r\n');
INSERT INTO postno VALUES (7206,'681-370','경남','울산시','중구 연암동\r\n');
INSERT INTO postno VALUES (7207,'681-380','경남','울산시','중구 양정동\r\n');
INSERT INTO postno VALUES (7208,'681-390','경남','울산시','중구 명촌동\r\n');
INSERT INTO postno VALUES (7209,'681-400','경남','울산시','중구 화봉동\r\n');
INSERT INTO postno VALUES (7210,'681-410','경남','울산시','중구 송정동\r\n');
INSERT INTO postno VALUES (7211,'681-420','경남','울산시','중구 장현동\r\n');
INSERT INTO postno VALUES (7212,'681-430','경남','울산시','중구 약사동\r\n');
INSERT INTO postno VALUES (7213,'681-600','경남','울산시','중구 울산우체국사서함\r\n');
INSERT INTO postno VALUES (7214,'681-728','경남','울산시','중구 울산문화방송국건물\r\n');
INSERT INTO postno VALUES (7215,'681-791','경남','울산시','중구 양정동 현대자동차\r\n');
INSERT INTO postno VALUES (7216,'682-010','경남','울산시','동구 동부동\r\n');
INSERT INTO postno VALUES (7217,'682-020','경남','울산시','동구 방어동\r\n');
INSERT INTO postno VALUES (7218,'682-030','경남','울산시','동구 서부동\r\n');
INSERT INTO postno VALUES (7219,'682-031','경남','울산시','동구 서부1동\r\n');
INSERT INTO postno VALUES (7220,'682-032','경남','울산시','동구 서부2동\r\n');
INSERT INTO postno VALUES (7221,'682-050','경남','울산시','동구 일산동\r\n');
INSERT INTO postno VALUES (7222,'682-060','경남','울산시','동구 전하동\r\n');
INSERT INTO postno VALUES (7223,'682-061','경남','울산시','동구 전하1동\r\n');
INSERT INTO postno VALUES (7224,'682-062','경남','울산시','동구 전하2동\r\n');
INSERT INTO postno VALUES (7225,'682-063','경남','울산시','동구 전하3동\r\n');
INSERT INTO postno VALUES (7226,'682-070','경남','울산시','동구 미포동\r\n');
INSERT INTO postno VALUES (7227,'682-080','경남','울산시','동구 주전동\r\n');
INSERT INTO postno VALUES (7228,'682-090','경남','울산시','동구 화정동\r\n');
INSERT INTO postno VALUES (7229,'682-100','경남','울산시','동구 대송동\r\n');
INSERT INTO postno VALUES (7230,'682-600','경남','울산시','동구 동울산우체국사서함\r\n');
INSERT INTO postno VALUES (7231,'682-792','경남','울산시','동구 전하1동 현대중공업\r\n');
INSERT INTO postno VALUES (7232,'689-800','경남','울산시','울주구 언양읍\r\n');
INSERT INTO postno VALUES (7233,'689-810','경남','울산시','울주구 삼남면\r\n');
INSERT INTO postno VALUES (7234,'689-820','경남','울산시','울주구 상북면\r\n');
INSERT INTO postno VALUES (7235,'689-830','경남','울산시','울주구 두서면\r\n');
INSERT INTO postno VALUES (7236,'689-840','경남','울산시','울주구 두동면\r\n');
INSERT INTO postno VALUES (7237,'689-850','경남','울산시','울주구 범서면\r\n');
INSERT INTO postno VALUES (7238,'689-860','경남','울산시','울주구 청량면\r\n');
INSERT INTO postno VALUES (7239,'689-870','경남','울산시','울주구 웅촌면\r\n');
INSERT INTO postno VALUES (7240,'689-880','경남','울산시','울주구 서생면\r\n');
INSERT INTO postno VALUES (7241,'689-890','경남','울산시','울주구 온산읍\r\n');
INSERT INTO postno VALUES (7242,'689-900','경남','울산시','울주구 온양면\r\n');
INSERT INTO postno VALUES (7243,'689-910','경남','울산시','울주구 농소면\r\n');
INSERT INTO postno VALUES (7244,'689-920','경남','울산시','울주구 강동면\r\n');
INSERT INTO postno VALUES (7245,'689-930','경남','울산시','울주구 삼동면\r\n');
INSERT INTO postno VALUES (7246,'690-010','제주도','제주시','일도동\r\n');
INSERT INTO postno VALUES (7247,'690-011','제주도','제주시','일도1동\r\n');
INSERT INTO postno VALUES (7248,'690-012','제주도','제주시','일도2동\r\n');
INSERT INTO postno VALUES (7249,'690-020','제주도','제주시','이도동\r\n');
INSERT INTO postno VALUES (7250,'690-021','제주도','제주시','이도1동\r\n');
INSERT INTO postno VALUES (7251,'690-022','제주도','제주시','이도2동\r\n');
INSERT INTO postno VALUES (7252,'690-029','제주도','제주시','도남동\r\n');
INSERT INTO postno VALUES (7253,'690-030','제주도','제주시','삼도동\r\n');
INSERT INTO postno VALUES (7254,'690-031','제주도','제주시','삼도1동\r\n');
INSERT INTO postno VALUES (7255,'690-032','제주도','제주시','삼도2동\r\n');
INSERT INTO postno VALUES (7256,'690-040','제주도','제주시','용담동\r\n');
INSERT INTO postno VALUES (7257,'690-041','제주도','제주시','용담1동\r\n');
INSERT INTO postno VALUES (7258,'690-042','제주도','제주시','용담2동\r\n');
INSERT INTO postno VALUES (7259,'690-043','제주도','제주시','용담3동\r\n');
INSERT INTO postno VALUES (7260,'690-050','제주도','제주시','건입동\r\n');
INSERT INTO postno VALUES (7261,'690-060','제주도','제주시','화북동\r\n');
INSERT INTO postno VALUES (7262,'690-061','제주도','제주시','화북1동\r\n');
INSERT INTO postno VALUES (7263,'690-062','제주도','제주시','화북2동\r\n');
INSERT INTO postno VALUES (7264,'690-070','제주도','제주시','삼양동\r\n');
INSERT INTO postno VALUES (7265,'690-071','제주도','제주시','삼양1동\r\n');
INSERT INTO postno VALUES (7266,'690-072','제주도','제주시','삼양2동\r\n');
INSERT INTO postno VALUES (7267,'690-073','제주도','제주시','삼양3동\r\n');
INSERT INTO postno VALUES (7268,'690-080','제주도','제주시','도련동\r\n');
INSERT INTO postno VALUES (7269,'690-081','제주도','제주시','도련1동\r\n');
INSERT INTO postno VALUES (7270,'690-082','제주도','제주시','도련2동\r\n');
INSERT INTO postno VALUES (7271,'690-090','제주도','제주시','봉개동\r\n');
INSERT INTO postno VALUES (7272,'690-100','제주도','제주시','회천동\r\n');
INSERT INTO postno VALUES (7273,'690-110','제주도','제주시','용강동\r\n');
INSERT INTO postno VALUES (7274,'690-120','제주도','제주시','아라동\r\n');
INSERT INTO postno VALUES (7275,'690-121','제주도','제주시','아라1동\r\n');
INSERT INTO postno VALUES (7276,'690-122','제주도','제주시','아라2동\r\n');
INSERT INTO postno VALUES (7277,'690-130','제주도','제주시','월평동\r\n');
INSERT INTO postno VALUES (7278,'690-140','제주도','제주시','영평동\r\n');
INSERT INTO postno VALUES (7279,'690-150','제주도','제주시','오등동\r\n');
INSERT INTO postno VALUES (7280,'690-160','제주도','제주시','오라동\r\n');
INSERT INTO postno VALUES (7281,'690-161','제주도','제주시','오라1동\r\n');
INSERT INTO postno VALUES (7282,'690-162','제주도','제주시','오라2동\r\n');
INSERT INTO postno VALUES (7283,'690-163','제주도','제주시','오라3동\r\n');
INSERT INTO postno VALUES (7284,'690-170','제주도','제주시','연동\r\n');
INSERT INTO postno VALUES (7285,'690-180','제주도','제주시','노형동\r\n');
INSERT INTO postno VALUES (7286,'690-190','제주도','제주시','외도동\r\n');
INSERT INTO postno VALUES (7287,'690-191','제주도','제주시','외도1동\r\n');
INSERT INTO postno VALUES (7288,'690-192','제주도','제주시','외도2동\r\n');
INSERT INTO postno VALUES (7289,'690-200','제주도','제주시','해안동\r\n');
INSERT INTO postno VALUES (7290,'690-210','제주도','제주시','내도동\r\n');
INSERT INTO postno VALUES (7291,'690-220','제주도','제주시','도평동\r\n');
INSERT INTO postno VALUES (7292,'690-230','제주도','제주시','이호동\r\n');
INSERT INTO postno VALUES (7293,'690-231','제주도','제주시','이호1동\r\n');
INSERT INTO postno VALUES (7294,'690-232','제주도','제주시','이호2동\r\n');
INSERT INTO postno VALUES (7295,'690-240','제주도','제주시','도두동\r\n');
INSERT INTO postno VALUES (7296,'690-241','제주도','제주시','도두1동\r\n');
INSERT INTO postno VALUES (7297,'690-242','제주도','제주시','도두2동\r\n');
INSERT INTO postno VALUES (7298,'690-600','제주도','제주시','제주우체국사서함\r\n');
INSERT INTO postno VALUES (7299,'690-700','제주도','제주시','연동 제주도청\r\n');
INSERT INTO postno VALUES (7300,'690-701','제주도','제주시','이동2동 제주시청\r\n');
INSERT INTO postno VALUES (7301,'690-702','제주도','제주시','연동 북제주군청\r\n');
INSERT INTO postno VALUES (7302,'690-703','제주도','제주시','연동 제주도교육청\r\n');
INSERT INTO postno VALUES (7303,'690-711','제주도','제주시','삼도동 한라일보사\r\n');
INSERT INTO postno VALUES (7304,'690-712','제주도','제주시','연동 제민일보사\r\n');
INSERT INTO postno VALUES (7305,'690-713','제주도','제주시','연동 제주신문사\r\n');
INSERT INTO postno VALUES (7306,'690-714','제주도','제주시','영평동 제주전문대학\r\n');
INSERT INTO postno VALUES (7307,'690-756','제주도','제주시','아라1동 제주대학교\r\n');
INSERT INTO postno VALUES (7308,'695-750','제주도','북제주군','아세아방송북제주본부\r\n');
INSERT INTO postno VALUES (7309,'695-800','제주도','북제주군','구좌읍\r\n');
INSERT INTO postno VALUES (7310,'695-805','제주도','북제주군','구좌읍 덕천리\r\n');
INSERT INTO postno VALUES (7311,'695-805','제주도','북제주군','구좌읍 동북리\r\n');
INSERT INTO postno VALUES (7312,'695-805','제주도','북제주군','구좌읍 동김녕리\r\n');
INSERT INTO postno VALUES (7313,'695-805','제주도','북제주군','구좌읍 서김녕리\r\n');
INSERT INTO postno VALUES (7314,'695-805','제주도','북제주군','구좌읍 월정리\r\n');
INSERT INTO postno VALUES (7315,'695-805','제주도','북제주군','구좌읍 행원리\r\n');
INSERT INTO postno VALUES (7316,'695-810','제주도','북제주군','조천읍\r\n');
INSERT INTO postno VALUES (7317,'695-820','제주도','북제주군','우도면\r\n');
INSERT INTO postno VALUES (7318,'695-830','제주도','북제주군','한림읍\r\n');
INSERT INTO postno VALUES (7319,'695-840','제주도','북제주군','한경면\r\n');
INSERT INTO postno VALUES (7320,'695-845','제주도','북제주군','한경면 고산리\r\n');
INSERT INTO postno VALUES (7321,'695-845','제주도','북제주군','한경면 산양리\r\n');
INSERT INTO postno VALUES (7322,'695-845','제주도','북제주군','한경면 용수리\r\n');
INSERT INTO postno VALUES (7323,'695-845','제주도','북제주군','한경면 조수2리\r\n');
INSERT INTO postno VALUES (7324,'695-850','제주군','북제주군','추자면\r\n');
INSERT INTO postno VALUES (7325,'695-900','제주도','북제주군','애월읍\r\n');
INSERT INTO postno VALUES (7326,'695-905','제주군','북제주군','애월읍 고성리\r\n');
INSERT INTO postno VALUES (7327,'695-905','제주군','북제주군','애월읍 광령리\r\n');
INSERT INTO postno VALUES (7328,'695-905','제주군','북제주군','애월읍 상귀리\r\n');
INSERT INTO postno VALUES (7329,'695-905','제주군','북제주군','애월읍 소길리\r\n');
INSERT INTO postno VALUES (7330,'695-905','제주군','북제주군','애월읍 수산리\r\n');
INSERT INTO postno VALUES (7331,'695-905','제주군','북제주군','애월읍 유암리\r\n');
INSERT INTO postno VALUES (7332,'695-905','제주군','북제주군','애월읍 장전리\r\n');
INSERT INTO postno VALUES (7333,'695-905','제주군','북제주군','애월읍 하귀1리\r\n');
INSERT INTO postno VALUES (7334,'695-905','제주군','북제주군','애월읍 하귀2리\r\n');
INSERT INTO postno VALUES (7335,'697-010','제주도','서귀포시','서귀동\r\n');
INSERT INTO postno VALUES (7336,'697-011','제주도','서귀포시','중앙동\r\n');
INSERT INTO postno VALUES (7337,'697-012','제주도','서귀포시','천지동\r\n');
INSERT INTO postno VALUES (7338,'697-013','제주도','서귀포시','송산동\r\n');
INSERT INTO postno VALUES (7339,'697-014','제주도','서귀포시','정방동\r\n');
INSERT INTO postno VALUES (7340,'697-020','제주도','서귀포시','보목동\r\n');
INSERT INTO postno VALUES (7341,'697-030','제주도','서귀포시','하효동\r\n');
INSERT INTO postno VALUES (7342,'697-040','제주도','서귀포시','신효동\r\n');
INSERT INTO postno VALUES (7343,'697-050','제주도','서귀포시','상효동\r\n');
INSERT INTO postno VALUES (7344,'697-060','제주도','서귀포시','토평동\r\n');
INSERT INTO postno VALUES (7345,'697-070','제주도','서귀포시','동홍동\r\n');
INSERT INTO postno VALUES (7346,'697-080','제주도','서귀포시','서홍동\r\n');
INSERT INTO postno VALUES (7347,'697-090','제주도','서귀포시','호근동\r\n');
INSERT INTO postno VALUES (7348,'697-100','제주도','서귀포시','서호동\r\n');
INSERT INTO postno VALUES (7349,'697-110','제주도','서귀포시','법환동\r\n');
INSERT INTO postno VALUES (7350,'697-120','제주도','서귀포시','중문동\r\n');
INSERT INTO postno VALUES (7351,'697-130','제주도','서귀포시','색달동\r\n');
INSERT INTO postno VALUES (7352,'697-301','제주도','서귀포시','상예동\r\n');
INSERT INTO postno VALUES (7353,'697-310','제주도','서귀포시','하예동\r\n');
INSERT INTO postno VALUES (7354,'697-320','제주도','서귀포시','대포동\r\n');
INSERT INTO postno VALUES (7355,'697-330','제주도','서귀포시','회수동\r\n');
INSERT INTO postno VALUES (7356,'697-340','제주도','서귀포시','하원동\r\n');
INSERT INTO postno VALUES (7357,'697-350','제주도','서귀포시','도순동\r\n');
INSERT INTO postno VALUES (7358,'697-360','제주도','서귀포시','월평동\r\n');
INSERT INTO postno VALUES (7359,'697-370','제주도','서귀포시','강정동\r\n');
INSERT INTO postno VALUES (7360,'697-380','제주도','서귀포시','영남동\r\n');
INSERT INTO postno VALUES (7361,'697-390','제주도','서귀포시','용흥동\r\n');
INSERT INTO postno VALUES (7362,'697-600','제주도','서귀포시','서귀포우체국사서함\r\n');
INSERT INTO postno VALUES (7363,'697-701','제주도','서귀포시','법환동 서귀포시청\r\n');
INSERT INTO postno VALUES (7364,'697-702','제주도','서귀포시','서흥동 남제주군청\r\n');
INSERT INTO postno VALUES (7365,'699-800','제주도','남제주군','남원읍\r\n');
INSERT INTO postno VALUES (7366,'699-810','제주도','남제주군','표선면\r\n');
INSERT INTO postno VALUES (7367,'699-820','제주도','남제주군','안덕면\r\n');
INSERT INTO postno VALUES (7368,'699-830','제주도','남제주군','대정읍\r\n');
INSERT INTO postno VALUES (7369,'699-900','제주도','남제주군','성산읍\r\n');
INSERT INTO postno VALUES (7370,'700-010','대구시','중구','포정동\r\n');
INSERT INTO postno VALUES (7371,'700-020','대구시','중구','향촌동\r\n');
INSERT INTO postno VALUES (7372,'700-030','대구시','중구','전동\r\n');
INSERT INTO postno VALUES (7373,'700-040','대구시','중구','사일동\r\n');
INSERT INTO postno VALUES (7374,'700-050','대구시','중구','동일동\r\n');
INSERT INTO postno VALUES (7375,'700-060','대구시','중구','남일동\r\n');
INSERT INTO postno VALUES (7376,'700-070','대구시','중구','덕산동\r\n');
INSERT INTO postno VALUES (7377,'700-081','대구시','중구','계산동1가\r\n');
INSERT INTO postno VALUES (7378,'700-082','대구시','중구','계산동2가\r\n');
INSERT INTO postno VALUES (7379,'700-091','대구시','중구','동성로1가\r\n');
INSERT INTO postno VALUES (7380,'700-092','대구시','중구','동성로2가\r\n');
INSERT INTO postno VALUES (7381,'700-093','대구시','중구','동성로3가\r\n');
INSERT INTO postno VALUES (7382,'700-100','대구시','중구','화전동\r\n');
INSERT INTO postno VALUES (7383,'700-111','대구시','중구','태평로1가\r\n');
INSERT INTO postno VALUES (7384,'700-112','대구시','중구','태평로2가\r\n');
INSERT INTO postno VALUES (7385,'700-113','대구시','중구','태평로3가\r\n');
INSERT INTO postno VALUES (7386,'700-120','대구시','중구','용덕동\r\n');
INSERT INTO postno VALUES (7387,'700-130','대구시','중구','상덕동\r\n');
INSERT INTO postno VALUES (7388,'700-140','대구시','중구','교동\r\n');
INSERT INTO postno VALUES (7389,'700-150','대구시','중구','공평동\r\n');
INSERT INTO postno VALUES (7390,'700-160','대구시','중구','문화동\r\n');
INSERT INTO postno VALUES (7391,'700-170','대구시','중구','완전동\r\n');
INSERT INTO postno VALUES (7392,'700-180','대구시','중구','동문동\r\n');
INSERT INTO postno VALUES (7393,'700-191','대구시','중구','종로1가\r\n');
INSERT INTO postno VALUES (7394,'700-192','대구시','중구','종로2가\r\n');
INSERT INTO postno VALUES (7395,'700-200','대구시','중구','상서동\r\n');
INSERT INTO postno VALUES (7396,'700-210','대구시','중구','하서동\r\n');
INSERT INTO postno VALUES (7397,'700-220','대구시','중구','수동\r\n');
INSERT INTO postno VALUES (7398,'700-230','대구시','중구','남성로\r\n');
INSERT INTO postno VALUES (7399,'700-240','대구시','중구','장관동\r\n');
INSERT INTO postno VALUES (7400,'700-251','대구시','중구','서문로1가\r\n');
INSERT INTO postno VALUES (7401,'700-252','대구시','중구','서문로2가\r\n');
INSERT INTO postno VALUES (7402,'700-261','대구시','중구','서성로1가\r\n');
INSERT INTO postno VALUES (7403,'700-262','대구시','중구','서성로2가\r\n');
INSERT INTO postno VALUES (7404,'700-270','대구시','중구','서내동\r\n');
INSERT INTO postno VALUES (7405,'700-280','대구시','중구','대안동\r\n');
INSERT INTO postno VALUES (7406,'700-290','대구시','중구','시장북로\r\n');
INSERT INTO postno VALUES (7407,'700-300','대구시','중구','인교동\r\n');
INSERT INTO postno VALUES (7408,'700-310','대구시','중구','동산동\r\n');
INSERT INTO postno VALUES (7409,'700-320','대구시','중구','대신동\r\n');
INSERT INTO postno VALUES (7410,'700-321','대구시','중구','대신1동\r\n');
INSERT INTO postno VALUES (7411,'700-322','대구시','중구','대신2동\r\n');
INSERT INTO postno VALUES (7412,'700-330','대구시','중구','서야동\r\n');
INSERT INTO postno VALUES (7413,'700-340','대구시','중구','북내동\r\n');
INSERT INTO postno VALUES (7414,'700-351','대구시','중구','북성로1가\r\n');
INSERT INTO postno VALUES (7415,'700-352','대구시','중구','북성로2가\r\n');
INSERT INTO postno VALUES (7416,'700-360','대구시','중구','도원동\r\n');
INSERT INTO postno VALUES (7417,'700-370','대구시','중구','수창동\r\n');
INSERT INTO postno VALUES (7418,'700-380','대구시','중구','달성동\r\n');
INSERT INTO postno VALUES (7419,'700-400','대구시','중구','봉산동\r\n');
INSERT INTO postno VALUES (7420,'700-411','대구시','중구','삼덕1가\r\n');
INSERT INTO postno VALUES (7421,'700-412','대구시','중구','삼덕2가\r\n');
INSERT INTO postno VALUES (7422,'700-413','대구시','중구','삼덕3가\r\n');
INSERT INTO postno VALUES (7423,'700-421','대구시','중구','동인1가\r\n');
INSERT INTO postno VALUES (7424,'700-422','대구시','중구','동인2가\r\n');
INSERT INTO postno VALUES (7425,'700-423','대구시','중구','동인3가\r\n');
INSERT INTO postno VALUES (7426,'700-424','대구시','중구','동인4가\r\n');
INSERT INTO postno VALUES (7427,'700-430','대구시','중구','대봉동\r\n');
INSERT INTO postno VALUES (7428,'700-431','대구시','중구','대봉1동\r\n');
INSERT INTO postno VALUES (7429,'700-432','대구시','중구','대봉2동\r\n');
INSERT INTO postno VALUES (7430,'700-440','대구시','중구','남산동\r\n');
INSERT INTO postno VALUES (7431,'700-441','대구시','중구','남산1동\r\n');
INSERT INTO postno VALUES (7432,'700-442','대구시','중구','남산2동\r\n');
INSERT INTO postno VALUES (7433,'700-443','대구시','중구','남산3동\r\n');
INSERT INTO postno VALUES (7434,'700-444','대구시','중구','남산4동\r\n');
INSERT INTO postno VALUES (7435,'700-600','대구시','중구','대구우체국사서함\r\n');
INSERT INTO postno VALUES (7436,'700-711','대구시','중구','동문동 동아백화점\r\n');
INSERT INTO postno VALUES (7437,'700-712','대구시','중구','계명대학교동산의료원\r\n');
INSERT INTO postno VALUES (7438,'700-713','대구시','중구','동산동 섬유회관\r\n');
INSERT INTO postno VALUES (7439,'700-714','대구시','중구','동인1가 대구광역시청\r\n');
INSERT INTO postno VALUES (7440,'700-715','대구시','중구','대구매일신문사건물\r\n');
INSERT INTO postno VALUES (7441,'700-716','대구시','중구','동성로2가 대구백화점건물\r\n');
INSERT INTO postno VALUES (7442,'700-717','대구시','중구','덕산동 동아쇼핑센타건물\r\n');
INSERT INTO postno VALUES (7443,'700-718','대구시','중구','대봉2동 대백프라자건물\r\n');
INSERT INTO postno VALUES (7444,'700-719','대구시','중구','삼덕2가 진석타워건물\r\n');
INSERT INTO postno VALUES (7445,'700-720','대구시','중구','대신1동 계성빌딩\r\n');
INSERT INTO postno VALUES (7446,'700-721','대구시','중구','삼덕2가 경북대학교병원\r\n');
INSERT INTO postno VALUES (7447,'700-722','대구시','중구','포정동 서울은행대구지점건물\r\n');
INSERT INTO postno VALUES (7448,'700-726','대구시','중구','대구효성카톨릭대학교\r\n');
INSERT INTO postno VALUES (7449,'700-742','대구시','중구','하서동 삼성생명빌딩\r\n');
INSERT INTO postno VALUES (7450,'701-010','대구시','동구','신암동\r\n');
INSERT INTO postno VALUES (7451,'701-011','대구시','동구','신암1동\r\n');
INSERT INTO postno VALUES (7452,'701-012','대구시','동구','신암2동\r\n');
INSERT INTO postno VALUES (7453,'701-013','대구시','동구','신암3동\r\n');
INSERT INTO postno VALUES (7454,'701-014','대구시','동구','신암4동\r\n');
INSERT INTO postno VALUES (7455,'701-015','대구시','동구','신암5동\r\n');
INSERT INTO postno VALUES (7456,'701-020','대구시','동구','신천동\r\n');
INSERT INTO postno VALUES (7457,'701-021','대구시','동구','신천1동\r\n');
INSERT INTO postno VALUES (7458,'701-022','대구시','동구','신천2동\r\n');
INSERT INTO postno VALUES (7459,'701-023','대구시','동구','신천3동\r\n');
INSERT INTO postno VALUES (7460,'701-024','대구시','동구','신천4동\r\n');
INSERT INTO postno VALUES (7461,'701-030','대구시','동구','효목동\r\n');
INSERT INTO postno VALUES (7462,'701-031','대구시','동구','효목1동\r\n');
INSERT INTO postno VALUES (7463,'701-032','대구시','동구','효목2동\r\n');
INSERT INTO postno VALUES (7464,'701-040','대구시','동구','검사동\r\n');
INSERT INTO postno VALUES (7465,'701-050','대구시','동구','입석동\r\n');
INSERT INTO postno VALUES (7466,'701-110','대구시','동구','지저동\r\n');
INSERT INTO postno VALUES (7467,'701-120','대구시','동구','방촌동\r\n');
INSERT INTO postno VALUES (7468,'701-130','대구시','동구','불로동\r\n');
INSERT INTO postno VALUES (7469,'701-140','대구시','동구','신평동\r\n');
INSERT INTO postno VALUES (7470,'701-150','대구시','동구','부동\r\n');
INSERT INTO postno VALUES (7471,'701-160','대구시','동구','둔산동\r\n');
INSERT INTO postno VALUES (7472,'701-170','대구시','동구','봉무동\r\n');
INSERT INTO postno VALUES (7473,'701-180','대구시','동구','도동\r\n');
INSERT INTO postno VALUES (7474,'701-190','대구시','동구','평광동\r\n');
INSERT INTO postno VALUES (7475,'701-210','대구시','동구','신기동\r\n');
INSERT INTO postno VALUES (7476,'701-220','대구시','동구','율하동\r\n');
INSERT INTO postno VALUES (7477,'701-230','대구시','동구','동호동\r\n');
INSERT INTO postno VALUES (7478,'701-240','대구시','동구','서호동\r\n');
INSERT INTO postno VALUES (7479,'701-250','대구시','동구','용계동\r\n');
INSERT INTO postno VALUES (7480,'701-260','대구시','동구','율암동\r\n');
INSERT INTO postno VALUES (7481,'701-270','대구시','동구','상매동\r\n');
INSERT INTO postno VALUES (7482,'701-280','대구시','동구','매여동\r\n');
INSERT INTO postno VALUES (7483,'701-290','대구시','동구','각산동\r\n');
INSERT INTO postno VALUES (7484,'701-300','대구시','동구','신서동\r\n');
INSERT INTO postno VALUES (7485,'701-310','대구시','동구','동내동\r\n');
INSERT INTO postno VALUES (7486,'701-320','대구시','동구','괴전동\r\n');
INSERT INTO postno VALUES (7487,'701-330','대구시','동구','금강동\r\n');
INSERT INTO postno VALUES (7488,'701-340','대구시','동구','숙천동\r\n');
INSERT INTO postno VALUES (7489,'701-350','대구시','동구','대림동\r\n');
INSERT INTO postno VALUES (7490,'701-360','대구시','동구','사복동\r\n');
INSERT INTO postno VALUES (7491,'701-370','대구시','동구','내곡동\r\n');
INSERT INTO postno VALUES (7492,'701-400','대구시','동구','백안동\r\n');
INSERT INTO postno VALUES (7493,'701-410','대구시','동구','미곡동\r\n');
INSERT INTO postno VALUES (7494,'701-420','대구시','동구','진인동\r\n');
INSERT INTO postno VALUES (7495,'701-430','대구시','동구','도학동\r\n');
INSERT INTO postno VALUES (7496,'701-440','대구시','동구','용수동\r\n');
INSERT INTO postno VALUES (7497,'701-450','대구시','동구','신무동\r\n');
INSERT INTO postno VALUES (7498,'701-460','대구시','동구','미대동\r\n');
INSERT INTO postno VALUES (7499,'701-470','대구시','동구','내동\r\n');
INSERT INTO postno VALUES (7500,'701-480','대구시','동구','지묘동\r\n');
INSERT INTO postno VALUES (7501,'701-490','대구시','동구','신룡동\r\n');
INSERT INTO postno VALUES (7502,'701-500','대구시','동구','중대동\r\n');
INSERT INTO postno VALUES (7503,'701-510','대구시','동구','덕곡동\r\n');
INSERT INTO postno VALUES (7504,'701-520','대구시','동구','송전동\r\n');
INSERT INTO postno VALUES (7505,'701-530','대구시','동구','능성동\r\n');
INSERT INTO postno VALUES (7506,'701-600','대구시','동구','동대구우체국사서함\r\n');
INSERT INTO postno VALUES (7507,'701-701','대구시','동구','신암5동 동구청\r\n');
INSERT INTO postno VALUES (7508,'701-702','대구시','동구','신천3동 대구상공회의소빌딩\r\n');
INSERT INTO postno VALUES (7509,'701-703','대구시','동구','효목2동 경북일보사건물\r\n');
INSERT INTO postno VALUES (7510,'701-714','대구시','동구','신천4동 국제오피스텔건물\r\n');
INSERT INTO postno VALUES (7511,'701-750','대구시','동구','신천3동 영남일보사건물\r\n');
INSERT INTO postno VALUES (7512,'701-790','대구시','동구','한국방송공사대구방송총국\r\n');
INSERT INTO postno VALUES (7513,'702-010','대구시','북구','산격동\r\n');
INSERT INTO postno VALUES (7514,'702-011','대구시','북구','산격1동\r\n');
INSERT INTO postno VALUES (7515,'702-012','대구시','북구','산격2동\r\n');
INSERT INTO postno VALUES (7516,'702-013','대구시','북구','산격3동\r\n');
INSERT INTO postno VALUES (7517,'702-014','대구시','북구','산격4동\r\n');
INSERT INTO postno VALUES (7518,'702-020','대구시','북구','복현동\r\n');
INSERT INTO postno VALUES (7519,'702-021','대구시','북구','복현1동\r\n');
INSERT INTO postno VALUES (7520,'702-022','대구시','북구','복현2동\r\n');
INSERT INTO postno VALUES (7521,'702-030','대구시','북구','검단동\r\n');
INSERT INTO postno VALUES (7522,'702-040','대구시','북구','대현동\r\n');
INSERT INTO postno VALUES (7523,'702-041','대구시','북구','대현1동\r\n');
INSERT INTO postno VALUES (7524,'702-042','대구시','북구','대현2동\r\n');
INSERT INTO postno VALUES (7525,'702-043','대구시','북구','대현3동\r\n');
INSERT INTO postno VALUES (7526,'702-050','대구시','북구','침산동\r\n');
INSERT INTO postno VALUES (7527,'702-051','대구시','북구','침산1동\r\n');
INSERT INTO postno VALUES (7528,'702-052','대구시','북구','침산2동\r\n');
INSERT INTO postno VALUES (7529,'702-053','대구시','북구','침산3동\r\n');
INSERT INTO postno VALUES (7530,'702-061','대구시','북구','칠성1가\r\n');
INSERT INTO postno VALUES (7531,'702-062','대구시','북구','칠성2가\r\n');
INSERT INTO postno VALUES (7532,'702-071','대구시','북구','고성1가\r\n');
INSERT INTO postno VALUES (7533,'702-072','대구시','북구','고성2가\r\n');
INSERT INTO postno VALUES (7534,'702-073','대구시','북구','고성3가\r\n');
INSERT INTO postno VALUES (7535,'702-081','대구시','북구','노원1가\r\n');
INSERT INTO postno VALUES (7536,'702-082','대구시','북구','노원2가\r\n');
INSERT INTO postno VALUES (7537,'702-083','대구시','북구','노원3가\r\n');
INSERT INTO postno VALUES (7538,'702-090','대구시','북구','노곡동\r\n');
INSERT INTO postno VALUES (7539,'702-100','대구시','북구','조야동\r\n');
INSERT INTO postno VALUES (7540,'702-110','대구시','북구','서변동\r\n');
INSERT INTO postno VALUES (7541,'702-120','대구시','북구','동변동\r\n');
INSERT INTO postno VALUES (7542,'702-130','대구시','북구','연경동\r\n');
INSERT INTO postno VALUES (7543,'702-200','대구시','북구','읍내동\r\n');
INSERT INTO postno VALUES (7544,'702-210','대구시','북구','학정동\r\n');
INSERT INTO postno VALUES (7545,'702-220','대구시','북구','국우동\r\n');
INSERT INTO postno VALUES (7546,'702-230','대구시','북구','도남동\r\n');
INSERT INTO postno VALUES (7547,'702-240','대구시','북구','관음동\r\n');
INSERT INTO postno VALUES (7548,'702-250','대구시','북구','동천동\r\n');
INSERT INTO postno VALUES (7549,'702-260','대구시','북구','태전동\r\n');
INSERT INTO postno VALUES (7550,'702-270','대구시','북구','매천동\r\n');
INSERT INTO postno VALUES (7551,'702-280','대구시','북구','구암동\r\n');
INSERT INTO postno VALUES (7552,'702-290','대구시','북구','팔달동\r\n');
INSERT INTO postno VALUES (7553,'702-300','대구시','북구','금호동\r\n');
INSERT INTO postno VALUES (7554,'702-310','대구시','북구','사수동\r\n');
INSERT INTO postno VALUES (7555,'702-320','대구시','북구','동호동\r\n');
INSERT INTO postno VALUES (7556,'702-600','대구시','북구','북대구우체국사서함\r\n');
INSERT INTO postno VALUES (7557,'702-701','대구시','북구','산격3동 경북대학교\r\n');
INSERT INTO postno VALUES (7558,'702-702','대구시','북구','산격4동 경상북도청사\r\n');
INSERT INTO postno VALUES (7559,'702-703','대구시','북구','침산2동 기독교대구방송국\r\n');
INSERT INTO postno VALUES (7560,'703-010','대구시','서구','평리동\r\n');
INSERT INTO postno VALUES (7561,'703-011','대구시','서구','평리1동\r\n');
INSERT INTO postno VALUES (7562,'703-012','대구시','서구','평리2동\r\n');
INSERT INTO postno VALUES (7563,'703-013','대구시','서구','평리3동\r\n');
INSERT INTO postno VALUES (7564,'703-014','대구시','서구','평리4동\r\n');
INSERT INTO postno VALUES (7565,'703-015','대구시','서구','평리5동\r\n');
INSERT INTO postno VALUES (7566,'703-016','대구시','서구','평리6동\r\n');
INSERT INTO postno VALUES (7567,'703-031','대구시','서구','원대1가\r\n');
INSERT INTO postno VALUES (7568,'703-032','대구시','서구','원대2가\r\n');
INSERT INTO postno VALUES (7569,'703-033','대구시','서구','원대3가\r\n');
INSERT INTO postno VALUES (7570,'703-040','대구시','서구','비산동\r\n');
INSERT INTO postno VALUES (7571,'703-041','대구시','서구','비산1동\r\n');
INSERT INTO postno VALUES (7572,'703-042','대구시','서구','비산2동\r\n');
INSERT INTO postno VALUES (7573,'703-043','대구시','서구','비산3동\r\n');
INSERT INTO postno VALUES (7574,'703-044','대구시','서구','비산4동\r\n');
INSERT INTO postno VALUES (7575,'703-045','대구시','서구','비산5동\r\n');
INSERT INTO postno VALUES (7576,'703-046','대구시','서구','비산6동\r\n');
INSERT INTO postno VALUES (7577,'703-047','대구시','서구','비산7동\r\n');
INSERT INTO postno VALUES (7578,'703-060','대구시','서구','내당동\r\n');
INSERT INTO postno VALUES (7579,'703-061','대구시','서구','내당1동\r\n');
INSERT INTO postno VALUES (7580,'703-062','대구시','서구','내당2동\r\n');
INSERT INTO postno VALUES (7581,'703-063','대구시','서구','내당3동\r\n');
INSERT INTO postno VALUES (7582,'703-064','대구시','서구','내당4동\r\n');
INSERT INTO postno VALUES (7583,'703-090','대구시','서구','중리동\r\n');
INSERT INTO postno VALUES (7584,'703-100','대구시','서구','상리동\r\n');
INSERT INTO postno VALUES (7585,'703-110','대구시','서구','이현동\r\n');
INSERT INTO postno VALUES (7586,'703-600','대구시','서구','서대구우체국사서함\r\n');
INSERT INTO postno VALUES (7587,'704-060','대구시','달서구','두류동\r\n');
INSERT INTO postno VALUES (7588,'704-061','대구시','달서구','두류1동\r\n');
INSERT INTO postno VALUES (7589,'704-062','대구시','달서구','두류2동\r\n');
INSERT INTO postno VALUES (7590,'704-063','대구시','달서구','두류3동\r\n');
INSERT INTO postno VALUES (7591,'704-080','대구시','달서구','성당동\r\n');
INSERT INTO postno VALUES (7592,'704-081','대구시','달서구','성당1동\r\n');
INSERT INTO postno VALUES (7593,'704-082','대구시','달서구','성당2동\r\n');
INSERT INTO postno VALUES (7594,'704-120','대구시','달서구','본리동\r\n');
INSERT INTO postno VALUES (7595,'704-130','대구시','달서구','용산동\r\n');
INSERT INTO postno VALUES (7596,'704-140','대구시','달서구','이곡동\r\n');
INSERT INTO postno VALUES (7597,'704-150','대구시','달서구','감삼동\r\n');
INSERT INTO postno VALUES (7598,'704-160','대구시','달서구','죽전동\r\n');
INSERT INTO postno VALUES (7599,'704-170','대구시','달서구','갈산동\r\n');
INSERT INTO postno VALUES (7600,'704-180','대구시','달서구','장기동\r\n');
INSERT INTO postno VALUES (7601,'704-190','대구시','달서구','장동\r\n');
INSERT INTO postno VALUES (7602,'704-200','대구시','달서구','신당동\r\n');
INSERT INTO postno VALUES (7603,'704-220','대구시','달서구','파호동\r\n');
INSERT INTO postno VALUES (7604,'704-230','대구시','달서구','파산동\r\n');
INSERT INTO postno VALUES (7605,'704-240','대구시','달서구','호림동\r\n');
INSERT INTO postno VALUES (7606,'704-310','대구시','달서구','대곡동\r\n');
INSERT INTO postno VALUES (7607,'704-320','대구시','달서구','월암동\r\n');
INSERT INTO postno VALUES (7608,'704-330','대구시','달서구','대천동\r\n');
INSERT INTO postno VALUES (7609,'704-340','대구시','달서구','송현동\r\n');
INSERT INTO postno VALUES (7610,'704-341','대구시','달서구','송현1동\r\n');
INSERT INTO postno VALUES (7611,'704-342','대구시','달서구','송현2동\r\n');
INSERT INTO postno VALUES (7612,'704-350','대구시','달서구','본동\r\n');
INSERT INTO postno VALUES (7613,'704-360','대구시','달서구','진천동\r\n');
INSERT INTO postno VALUES (7614,'704-370','대구시','달서구','상인동\r\n');
INSERT INTO postno VALUES (7615,'704-380','대구시','달서구','도원동\r\n');
INSERT INTO postno VALUES (7616,'704-390','대구시','달서구','유천동\r\n');
INSERT INTO postno VALUES (7617,'704-400','대구시','달서구','월성동\r\n');
INSERT INTO postno VALUES (7618,'704-600','대구시','달서구','대구달서우체국사서함\r\n');
INSERT INTO postno VALUES (7619,'704-650','대구시','달서구','대구성서우체국사서함\r\n');
INSERT INTO postno VALUES (7620,'704-701','대구시','달서구','신당동 계명대성서컴퍼스\r\n');
INSERT INTO postno VALUES (7621,'704-712','대구시','달서구','두류2동 성안오피스텔건물\r\n');
INSERT INTO postno VALUES (7622,'705-010','대구시','남구','이천동\r\n');
INSERT INTO postno VALUES (7623,'705-011','대구시','남구','이천1동\r\n');
INSERT INTO postno VALUES (7624,'705-012','대구시','남구','이천2동\r\n');
INSERT INTO postno VALUES (7625,'705-020','대구시','남구','봉덕동\r\n');
INSERT INTO postno VALUES (7626,'705-021','대구시','남구','봉덕1동\r\n');
INSERT INTO postno VALUES (7627,'705-022','대구시','남구','봉덕2동\r\n');
INSERT INTO postno VALUES (7628,'705-023','대구시','남구','봉덕3동\r\n');
INSERT INTO postno VALUES (7629,'705-030','대구시','남구','대명동\r\n');
INSERT INTO postno VALUES (7630,'705-031','대구시','남구','대명1동\r\n');
INSERT INTO postno VALUES (7631,'705-032','대구시','남구','대명2동\r\n');
INSERT INTO postno VALUES (7632,'705-033','대구시','남구','대명3동\r\n');
INSERT INTO postno VALUES (7633,'705-034','대구시','남구','대명4동\r\n');
INSERT INTO postno VALUES (7634,'705-035','대구시','남구','대명5동\r\n');
INSERT INTO postno VALUES (7635,'705-036','대구시','남구','대명6동\r\n');
INSERT INTO postno VALUES (7636,'705-037','대구시','남구','대명7동\r\n');
INSERT INTO postno VALUES (7637,'705-038','대구시','남구','대명8동\r\n');
INSERT INTO postno VALUES (7638,'705-039','대구시','남구','대명9동\r\n');
INSERT INTO postno VALUES (7639,'705-040','대구시','남구','대명10동\r\n');
INSERT INTO postno VALUES (7640,'705-041','대구시','남구','대명11동\r\n');
INSERT INTO postno VALUES (7641,'705-600','대구시','남구','남대구우체국사서함\r\n');
INSERT INTO postno VALUES (7642,'705-701','대구시','남구','대명7동 계명대학교\r\n');
INSERT INTO postno VALUES (7643,'705-702','대구시','남구','봉덕1동 남구청\r\n');
INSERT INTO postno VALUES (7644,'705-714','대구시','남구','대명3동 대구대학교\r\n');
INSERT INTO postno VALUES (7645,'705-715','대구시','남구','대명2동 대구교육대학\r\n');
INSERT INTO postno VALUES (7646,'705-717','대구시','남구','대명5동 영남대학교의료원\r\n');
INSERT INTO postno VALUES (7647,'705-718','대구시','남구','대명4동 대구가톨릭대학병원\r\n');
INSERT INTO postno VALUES (7648,'705-719','대구시','남구','한국통신대구사업본부\r\n');
INSERT INTO postno VALUES (7649,'706-010','대구시','수성구','범어동\r\n');
INSERT INTO postno VALUES (7650,'706-011','대구시','수성구','범어1동\r\n');
INSERT INTO postno VALUES (7651,'706-012','대구시','수성구','범어2동\r\n');
INSERT INTO postno VALUES (7652,'706-013','대구시','수성구','범어3동\r\n');
INSERT INTO postno VALUES (7653,'706-014','대구시','수성구','범어4동\r\n');
INSERT INTO postno VALUES (7654,'706-020','대구시','수성구','만촌동\r\n');
INSERT INTO postno VALUES (7655,'706-021','대구시','수성구','만촌1동\r\n');
INSERT INTO postno VALUES (7656,'706-022','대구시','수성구','만촌2동\r\n');
INSERT INTO postno VALUES (7657,'706-023','대구시','수성구','만촌3동\r\n');
INSERT INTO postno VALUES (7658,'706-031','대구시','수성구','수성1가\r\n');
INSERT INTO postno VALUES (7659,'706-032','대구시','수성구','수성2가\r\n');
INSERT INTO postno VALUES (7660,'706-033','대구시','수성구','수성3가\r\n');
INSERT INTO postno VALUES (7661,'706-034','대구시','수성구','수성4가\r\n');
INSERT INTO postno VALUES (7662,'706-040','대구시','수성구','황금동\r\n');
INSERT INTO postno VALUES (7663,'706-041','대구시','수성구','황금1동\r\n');
INSERT INTO postno VALUES (7664,'706-042','대구시','수성구','황금2동\r\n');
INSERT INTO postno VALUES (7665,'706-050','대구시','수성구','중동\r\n');
INSERT INTO postno VALUES (7666,'706-060','대구시','수성구','상동\r\n');
INSERT INTO postno VALUES (7667,'706-070','대구시','수성구','파동\r\n');
INSERT INTO postno VALUES (7668,'706-080','대구시','수성구','두산동\r\n');
INSERT INTO postno VALUES (7669,'706-090','대구시','수성구','지산동\r\n');
INSERT INTO postno VALUES (7670,'706-091','대구시','수성구','지산1동\r\n');
INSERT INTO postno VALUES (7671,'706-092','대구시','수성구','지산2동\r\n');
INSERT INTO postno VALUES (7672,'706-100','대구시','수성구','범물동\r\n');
INSERT INTO postno VALUES (7673,'706-110','대구시','수성구','가천동\r\n');
INSERT INTO postno VALUES (7674,'706-120','대구시','수성구','고모동\r\n');
INSERT INTO postno VALUES (7675,'706-130','대구시','수성구','내환동\r\n');
INSERT INTO postno VALUES (7676,'706-140','대구시','수성구','매호동\r\n');
INSERT INTO postno VALUES (7677,'706-150','대구시','수성구','성동\r\n');
INSERT INTO postno VALUES (7678,'706-160','대구시','수성구','사월동\r\n');
INSERT INTO postno VALUES (7679,'706-170','대구시','수성구','신매동\r\n');
INSERT INTO postno VALUES (7680,'706-180','대구시','수성구','욱수동\r\n');
INSERT INTO postno VALUES (7681,'706-190','대구시','수성구','삼덕동\r\n');
INSERT INTO postno VALUES (7682,'706-200','대구시','수성구','연호동\r\n');
INSERT INTO postno VALUES (7683,'706-210','대구시','수성구','이천동\r\n');
INSERT INTO postno VALUES (7684,'706-220','대구시','수성구','시지동\r\n');
INSERT INTO postno VALUES (7685,'706-230','대구시','수성구','노변동\r\n');
INSERT INTO postno VALUES (7686,'706-600','대구시','수성구','경북체신청직영우체국\r\n');
INSERT INTO postno VALUES (7687,'706-701','대구시','수성구','범어1동 수성구청\r\n');
INSERT INTO postno VALUES (7688,'706-702','대구시','수성구','범어1동 수성경찰서\r\n');
INSERT INTO postno VALUES (7689,'706-703','대구시','수성구','대구광역시교육위원회\r\n');
INSERT INTO postno VALUES (7690,'706-704','대구시','수성구','두산동 대구방송\r\n');
INSERT INTO postno VALUES (7691,'706-711','대구시','수성구','만촌3동 신일전문대학\r\n');
INSERT INTO postno VALUES (7692,'706-714','대구시','수성구','범어2동 대구법원청사\r\n');
INSERT INTO postno VALUES (7693,'706-728','대구시','수성구','범어2동 대구문화방송국\r\n');
INSERT INTO postno VALUES (7694,'711-711','대구시','달성군','논공읍 대동공업건물\r\n');
INSERT INTO postno VALUES (7695,'711-712','대구시','달성군','논공읍 대우기전건물\r\n');
INSERT INTO postno VALUES (7696,'711-713','대구시','달성군','논공읍 상신브레이크건물\r\n');
INSERT INTO postno VALUES (7697,'711-810','대구시','달성군','다사면\r\n');
INSERT INTO postno VALUES (7698,'711-820','대구시','달성군','하빈면\r\n');
INSERT INTO postno VALUES (7699,'711-830','대구시','달성군','화원읍\r\n');
INSERT INTO postno VALUES (7700,'711-840','대구시','달성군','옥포면\r\n');
INSERT INTO postno VALUES (7701,'711-850','대구시','달성군','논공읍\r\n');
INSERT INTO postno VALUES (7702,'711-855','대구시','달성군','논공읍 남동\r\n');
INSERT INTO postno VALUES (7703,'711-855','대구시','달성군','논공읍 북동\r\n');
INSERT INTO postno VALUES (7704,'711-855','대구시','달성군','논공읍 본리동\r\n');
INSERT INTO postno VALUES (7705,'711-860','대구시','달성군','가창면\r\n');
INSERT INTO postno VALUES (7706,'711-870','대구시','달성군','현풍면\r\n');
INSERT INTO postno VALUES (7707,'711-880','대구시','달성군','유가면\r\n');
INSERT INTO postno VALUES (7708,'711-890','대구시','달성군','구지면\r\n');
INSERT INTO postno VALUES (7709,'712-010','경북','경산시','서상동\r\n');
INSERT INTO postno VALUES (7710,'712-020','경북','경산시','삼북동\r\n');
INSERT INTO postno VALUES (7711,'712-030','경북','경산시','삼남동\r\n');
INSERT INTO postno VALUES (7712,'712-040','경북','경산시','신교동\r\n');
INSERT INTO postno VALUES (7713,'712-050','경북','경산시','사정동\r\n');
INSERT INTO postno VALUES (7714,'712-060','경북','경산시','중방동\r\n');
INSERT INTO postno VALUES (7715,'712-070','경북','경산시','상방동\r\n');
INSERT INTO postno VALUES (7716,'712-080','경북','경산시','옥곡동\r\n');
INSERT INTO postno VALUES (7717,'712-090','경북','경산시','옥산동\r\n');
INSERT INTO postno VALUES (7718,'712-100','경북','경산시','백천동\r\n');
INSERT INTO postno VALUES (7719,'712-110','경북','경산시','정평동\r\n');
INSERT INTO postno VALUES (7720,'712-120','경북','경산시','계양동\r\n');
INSERT INTO postno VALUES (7721,'712-130','경북','경산시','대평동\r\n');
INSERT INTO postno VALUES (7722,'712-140','경북','경산시','대정동\r\n');
INSERT INTO postno VALUES (7723,'712-150','경북','경산시','임당동\r\n');
INSERT INTO postno VALUES (7724,'712-160','경북','경산시','대동\r\n');
INSERT INTO postno VALUES (7725,'712-170','경북','경산시','남방동\r\n');
INSERT INTO postno VALUES (7726,'712-180','경북','경산시','내동\r\n');
INSERT INTO postno VALUES (7727,'712-190','경북','경산시','사동\r\n');
INSERT INTO postno VALUES (7728,'712-200','경북','경산시','신천동\r\n');
INSERT INTO postno VALUES (7729,'712-210','경북','경산시','삼풍동\r\n');
INSERT INTO postno VALUES (7730,'712-220','경북','경산시','여천동\r\n');
INSERT INTO postno VALUES (7731,'712-230','경북','경산시','유곡동\r\n');
INSERT INTO postno VALUES (7732,'712-240','경북','경산시','점촌동\r\n');
INSERT INTO postno VALUES (7733,'712-250','경북','경산시','평산동\r\n');
INSERT INTO postno VALUES (7734,'712-260','경북','경산시','갑제동\r\n');
INSERT INTO postno VALUES (7735,'712-270','경북','경산시','조영동\r\n');
INSERT INTO postno VALUES (7736,'712-280','경북','경산시','중산동\r\n');
INSERT INTO postno VALUES (7737,'712-600','경북','경산시','경산우체국사서함\r\n');
INSERT INTO postno VALUES (7738,'712-701','경북','경산시','하양읍 경북산업대학교\r\n');
INSERT INTO postno VALUES (7739,'712-702','경북','경산시','대구효성가톨릭대학교(경산)\r\n');
INSERT INTO postno VALUES (7740,'712-703','경북','경산시','중방동 경산시청\r\n');
INSERT INTO postno VALUES (7741,'712-711','경북','경산시','한국조폐공사경산조폐창\r\n');
INSERT INTO postno VALUES (7742,'712-712','경북','경산시','중산동 제일합섬(주)\r\n');
INSERT INTO postno VALUES (7743,'712-714','경북','경산시','진량면 대구대학교(경산)\r\n');
INSERT INTO postno VALUES (7744,'712-715','경북','경산시','점촌동 경산대학교\r\n');
INSERT INTO postno VALUES (7745,'712-749','경북','경산시','대동 영남대학교\r\n');
INSERT INTO postno VALUES (7746,'712-820','경북','경산시','압량면\r\n');
INSERT INTO postno VALUES (7747,'712-830','경북','경산시','진량면\r\n');
INSERT INTO postno VALUES (7748,'712-840','경북','경산시','와촌면\r\n');
INSERT INTO postno VALUES (7749,'712-850','경북','경산시','자인면\r\n');
INSERT INTO postno VALUES (7750,'712-860','경북','경산시','남산면\r\n');
INSERT INTO postno VALUES (7751,'712-870','경북','경산시','용성면\r\n');
INSERT INTO postno VALUES (7752,'712-880','경북','경산시','남천면\r\n');
INSERT INTO postno VALUES (7753,'712-900','경북','경산시','하양읍\r\n');
INSERT INTO postno VALUES (7754,'714-800','경북','청도군','청도읍\r\n');
INSERT INTO postno VALUES (7755,'714-805','경북','청도군','청도읍 거연동\r\n');
INSERT INTO postno VALUES (7756,'714-805','경북','청도군','청도읍 내호동\r\n');
INSERT INTO postno VALUES (7757,'714-805','경북','청도군','청도읍 사촌동\r\n');
INSERT INTO postno VALUES (7758,'714-805','경북','청도군','청도읍 상동\r\n');
INSERT INTO postno VALUES (7759,'714-805','경북','청도군','청도읍 신도동\r\n');
INSERT INTO postno VALUES (7760,'714-805','경북','청도군','청도읍 유호동\r\n');
INSERT INTO postno VALUES (7761,'714-805','경북','청도군','청도읍 음지동\r\n');
INSERT INTO postno VALUES (7762,'714-805','경북','청도군','청도읍 초현동\r\n');
INSERT INTO postno VALUES (7763,'714-805','경북','청도군','청도읍 평양동\r\n');
INSERT INTO postno VALUES (7764,'714-820','경북','청도군','각남면\r\n');
INSERT INTO postno VALUES (7765,'714-830','경북','청도군','풍각면\r\n');
INSERT INTO postno VALUES (7766,'714-840','경북','청도군','각북면\r\n');
INSERT INTO postno VALUES (7767,'714-850','경북','청도군','이서면\r\n');
INSERT INTO postno VALUES (7768,'714-860','경북','청도군','매전면\r\n');
INSERT INTO postno VALUES (7769,'714-865','경북','청도군','매전면 구촌동\r\n');
INSERT INTO postno VALUES (7770,'714-865','경북','청도군','매전면 내동\r\n');
INSERT INTO postno VALUES (7771,'714-865','경북','청도군','매전면 송원동\r\n');
INSERT INTO postno VALUES (7772,'714-865','경북','청도군','매전면 지전동\r\n');
INSERT INTO postno VALUES (7773,'714-870','경북','청도군','금천면\r\n');
INSERT INTO postno VALUES (7774,'714-880','경북','청도군','운문면\r\n');
INSERT INTO postno VALUES (7775,'714-900','경북','청도군','화양읍\r\n');
INSERT INTO postno VALUES (7776,'714-905','경북','청도군','화양읍 다로동\r\n');
INSERT INTO postno VALUES (7777,'714-905','경북','청도군','화양읍 범곡동2구\r\n');
INSERT INTO postno VALUES (7778,'714-905','경북','청도군','화양읍 삼신동\r\n');
INSERT INTO postno VALUES (7779,'714-905','경북','청도군','화양읍 송금동\r\n');
INSERT INTO postno VALUES (7780,'714-905','경북','청도군','화양읍 진라동\r\n');
INSERT INTO postno VALUES (7781,'716-800','경북','군위군','군위읍\r\n');
INSERT INTO postno VALUES (7782,'716-810','경북','군위군','소보면\r\n');
INSERT INTO postno VALUES (7783,'716-820','경북','군위군','효령면\r\n');
INSERT INTO postno VALUES (7784,'716-830','경북','군위군','부계면\r\n');
INSERT INTO postno VALUES (7785,'716-835','경북','군위군','부계면 명산리\r\n');
INSERT INTO postno VALUES (7786,'716-840','경북','군위군','우보면\r\n');
INSERT INTO postno VALUES (7787,'716-850','경북','군위군','산성면\r\n');
INSERT INTO postno VALUES (7788,'716-860','경북','군위군','의홍면\r\n');
INSERT INTO postno VALUES (7789,'716-870','경북','군위군','고로면\r\n');
INSERT INTO postno VALUES (7790,'717-800','경북','고령군','고령읍\r\n');
INSERT INTO postno VALUES (7791,'717-810','경북','고령군','성산면\r\n');
INSERT INTO postno VALUES (7792,'717-820','경북','고령군','우곡면\r\n');
INSERT INTO postno VALUES (7793,'717-830','경북','고령군','운수면\r\n');
INSERT INTO postno VALUES (7794,'717-840','경북','고령군','개진면\r\n');
INSERT INTO postno VALUES (7795,'717-850','경북','고령군','쌍림면\r\n');
INSERT INTO postno VALUES (7796,'717-860','경북','고령군','덕곡면\r\n');
INSERT INTO postno VALUES (7797,'717-870','경북','고령군','다산면\r\n');
INSERT INTO postno VALUES (7798,'718-800','경북','칠곡군','왜관읍\r\n');
INSERT INTO postno VALUES (7799,'718-810','경북','칠곡군','약목면\r\n');
INSERT INTO postno VALUES (7800,'718-820','경북','칠곡군','지천면\r\n');
INSERT INTO postno VALUES (7801,'718-830','경북','칠곡군','석적면\r\n');
INSERT INTO postno VALUES (7802,'718-840','경북','칠곡군','북삼면\r\n');
INSERT INTO postno VALUES (7803,'718-850','경북','칠곡군','기산면\r\n');
INSERT INTO postno VALUES (7804,'718-910','경북','칠곡군','가산면\r\n');
INSERT INTO postno VALUES (7805,'718-920','경북','칠곡군','동명면\r\n');
INSERT INTO postno VALUES (7806,'719-800','경북','성주군','성주읍\r\n');
INSERT INTO postno VALUES (7807,'719-810','경북','성주군','초전면\r\n');
INSERT INTO postno VALUES (7808,'719-820','경북','성주군','벽진면\r\n');
INSERT INTO postno VALUES (7809,'719-830','경북','성주군','선남면\r\n');
INSERT INTO postno VALUES (7810,'719-840','경북','성주군','용암면\r\n');
INSERT INTO postno VALUES (7811,'719-850','경북','성주군','월항면\r\n');
INSERT INTO postno VALUES (7812,'719-860','경북','성주군','대가면\r\n');
INSERT INTO postno VALUES (7813,'719-870','경북','성주군','금수면\r\n');
INSERT INTO postno VALUES (7814,'719-880','경북','성주군','가천면\r\n');
INSERT INTO postno VALUES (7815,'719-890','경북','성주군','수륜면\r\n');
INSERT INTO postno VALUES (7816,'730-010','경북','구미시','원평동\r\n');
INSERT INTO postno VALUES (7817,'730-011','경북','구미시','원평1동\r\n');
INSERT INTO postno VALUES (7818,'730-012','경북','구미시','원평2동\r\n');
INSERT INTO postno VALUES (7819,'730-013','경북','구미시','원평3동\r\n');
INSERT INTO postno VALUES (7820,'730-020','경북','구미시','도량동\r\n');
INSERT INTO postno VALUES (7821,'730-021','경북','구미시','도량1동\r\n');
INSERT INTO postno VALUES (7822,'730-022','경북','구미시','도량2동\r\n');
INSERT INTO postno VALUES (7823,'730-030','경북','구미시','공단동\r\n');
INSERT INTO postno VALUES (7824,'730-031','경북','구미시','공단1동\r\n');
INSERT INTO postno VALUES (7825,'730-032','경북','구미시','공단2동\r\n');
INSERT INTO postno VALUES (7826,'730-040','경북','구미시','형곡동\r\n');
INSERT INTO postno VALUES (7827,'730-041','경북','구미시','형곡1동\r\n');
INSERT INTO postno VALUES (7828,'730-042','경북','구미시','형곡2동\r\n');
INSERT INTO postno VALUES (7829,'730-050','경북','구미시','남통동\r\n');
INSERT INTO postno VALUES (7830,'730-060','경북','구미시','원남동\r\n');
INSERT INTO postno VALUES (7831,'730-070','경북','구미시','신평동\r\n');
INSERT INTO postno VALUES (7832,'730-071','경북','구미시','신평1동\r\n');
INSERT INTO postno VALUES (7833,'730-072','경북','구미시','신평2동\r\n');
INSERT INTO postno VALUES (7834,'730-080','경북','구미시','광평동\r\n');
INSERT INTO postno VALUES (7835,'730-090','경북','구미시','송정동\r\n');
INSERT INTO postno VALUES (7836,'730-100','경북','구미시','비산동\r\n');
INSERT INTO postno VALUES (7837,'730-110','경북','구미시','사곡동\r\n');
INSERT INTO postno VALUES (7838,'730-120','경북','구미시','상모동\r\n');
INSERT INTO postno VALUES (7839,'730-130','경북','구미시','임은동\r\n');
INSERT INTO postno VALUES (7840,'730-140','경북','구미시','오태동\r\n');
INSERT INTO postno VALUES (7841,'730-150','경북','구미시','수점동\r\n');
INSERT INTO postno VALUES (7842,'730-160','경북','구미시','지산동\r\n');
INSERT INTO postno VALUES (7843,'730-170','경북','구미시','부곡동\r\n');
INSERT INTO postno VALUES (7844,'730-180','경북','구미시','선기동\r\n');
INSERT INTO postno VALUES (7845,'730-190','경북','구미시','선주동\r\n');
INSERT INTO postno VALUES (7846,'730-200','경북','구미시','봉곡동\r\n');
INSERT INTO postno VALUES (7847,'730-300','경북','구미시','구평동\r\n');
INSERT INTO postno VALUES (7848,'730-310','경북','구미시','신동\r\n');
INSERT INTO postno VALUES (7849,'730-320','경북','구미시','인의동\r\n');
INSERT INTO postno VALUES (7850,'730-330','경북','구미시','황상동\r\n');
INSERT INTO postno VALUES (7851,'730-340','경북','구미시','시미동\r\n');
INSERT INTO postno VALUES (7852,'730-350','경북','구미시','임수동\r\n');
INSERT INTO postno VALUES (7853,'730-360','경북','구미시','진평동\r\n');
INSERT INTO postno VALUES (7854,'730-370','경북','구미시','거의동\r\n');
INSERT INTO postno VALUES (7855,'730-380','경북','구미시','옥계동\r\n');
INSERT INTO postno VALUES (7856,'730-390','경북','구미시','양호동\r\n');
INSERT INTO postno VALUES (7857,'730-400','경북','구미시','구포동\r\n');
INSERT INTO postno VALUES (7858,'730-410','경북','구미시','금전동\r\n');
INSERT INTO postno VALUES (7859,'730-420','경북','구미시','임오동\r\n');
INSERT INTO postno VALUES (7860,'730-600','경북','구미시','구미우체국사서함\r\n');
INSERT INTO postno VALUES (7861,'730-701','경북','구미시','신평1동 금오공과대학교\r\n');
INSERT INTO postno VALUES (7862,'730-800','경북','구미시','선산읍\r\n');
INSERT INTO postno VALUES (7863,'730-810','경북','구미시','고아면\r\n');
INSERT INTO postno VALUES (7864,'730-820','경북','구미시','무을면\r\n');
INSERT INTO postno VALUES (7865,'730-830','경북','구미시','옥성면\r\n');
INSERT INTO postno VALUES (7866,'730-840','경북','구미시','장천면\r\n');
INSERT INTO postno VALUES (7867,'730-850','경북','구미시','산동면\r\n');
INSERT INTO postno VALUES (7868,'730-860','경북','구미시','도개면\r\n');
INSERT INTO postno VALUES (7869,'730-870','경북','구미시','해평면\r\n');
INSERT INTO postno VALUES (7870,'740-010','경북','김천시','모암동\r\n');
INSERT INTO postno VALUES (7871,'740-020','경북','김천시','용호동\r\n');
INSERT INTO postno VALUES (7872,'740-030','경북','김천시','감호동\r\n');
INSERT INTO postno VALUES (7873,'740-040','경북','김천시','용두동\r\n');
INSERT INTO postno VALUES (7874,'740-050','경북','김천시','지좌동\r\n');
INSERT INTO postno VALUES (7875,'740-060','경북','김천시','양천동\r\n');
INSERT INTO postno VALUES (7876,'740-070','경북','김천시','황금동\r\n');
INSERT INTO postno VALUES (7877,'740-080','경북','김천시','남산동\r\n');
INSERT INTO postno VALUES (7878,'740-090','경북','김천시','평화동\r\n');
INSERT INTO postno VALUES (7879,'740-100','경북','김천시','성내동\r\n');
INSERT INTO postno VALUES (7880,'740-110','경북','김천시','부곡동\r\n');
INSERT INTO postno VALUES (7881,'740-120','경북','김천시','백옥동\r\n');
INSERT INTO postno VALUES (7882,'740-130','경북','김천시','다수동\r\n');
INSERT INTO postno VALUES (7883,'740-140','경북','김천시','금산동\r\n');
INSERT INTO postno VALUES (7884,'740-150','경북','김천시','신음동\r\n');
INSERT INTO postno VALUES (7885,'740-160','경북','김천시','교동\r\n');
INSERT INTO postno VALUES (7886,'740-170','경북','김천시','대광동\r\n');
INSERT INTO postno VALUES (7887,'740-180','경북','김천시','응명동\r\n');
INSERT INTO postno VALUES (7888,'740-190','경북','김천시','덕곡동\r\n');
INSERT INTO postno VALUES (7889,'740-200','경북','김천시','삼락동\r\n');
INSERT INTO postno VALUES (7890,'740-210','경북','김천시','문당동\r\n');
INSERT INTO postno VALUES (7891,'740-600','경북','김천시','김천우체국사서함\r\n');
INSERT INTO postno VALUES (7892,'740-810','경북','김천시','대항면\r\n');
INSERT INTO postno VALUES (7893,'740-820','경북','김천시','봉산면\r\n');
INSERT INTO postno VALUES (7894,'740-830','경북','김천시','어모면\r\n');
INSERT INTO postno VALUES (7895,'740-840','경북','김천시','개령면\r\n');
INSERT INTO postno VALUES (7896,'740-850','경북','김천시','감문면\r\n');
INSERT INTO postno VALUES (7897,'740-860','경북','김천시','아포면\r\n');
INSERT INTO postno VALUES (7898,'740-870','경북','김천시','남면\r\n');
INSERT INTO postno VALUES (7899,'740-880','경북','김천시','농소면\r\n');
INSERT INTO postno VALUES (7900,'740-890','경북','김천시','감천면\r\n');
INSERT INTO postno VALUES (7901,'740-910','경북','김천시','조마면\r\n');
INSERT INTO postno VALUES (7902,'740-920','경북','김천시','구성면\r\n');
INSERT INTO postno VALUES (7903,'740-930','경북','김천시','지례면\r\n');
INSERT INTO postno VALUES (7904,'740-940','경북','김천시','부항면\r\n');
INSERT INTO postno VALUES (7905,'740-950','경북','김천시','대덕면\r\n');
INSERT INTO postno VALUES (7906,'740-960','경북','김천시','증산면\r\n');
INSERT INTO postno VALUES (7907,'742-010','경북','상주시','남성동\r\n');
INSERT INTO postno VALUES (7908,'742-020','경북','상주시','성동동\r\n');
INSERT INTO postno VALUES (7909,'742-030','경북','상주시','성하동\r\n');
INSERT INTO postno VALUES (7910,'742-040','경북','상주시','북룡동\r\n');
INSERT INTO postno VALUES (7911,'742-050','경북','상주시','서성동\r\n');
INSERT INTO postno VALUES (7912,'742-060','경북','상주시','인봉동\r\n');
INSERT INTO postno VALUES (7913,'742-070','경북','상주시','냉림동\r\n');
INSERT INTO postno VALUES (7914,'742-080','경북','상주시','서문동\r\n');
INSERT INTO postno VALUES (7915,'742-090','경북','상주시','무양동\r\n');
INSERT INTO postno VALUES (7916,'742-100','경북','상주시','낙양동\r\n');
INSERT INTO postno VALUES (7917,'742-110','경북','상주시','연원동\r\n');
INSERT INTO postno VALUES (7918,'742-120','경북','상주시','남장동\r\n');
INSERT INTO postno VALUES (7919,'742-130','경북','상주시','신봉동\r\n');
INSERT INTO postno VALUES (7920,'742-140','경북','상주시','개운동\r\n');
INSERT INTO postno VALUES (7921,'742-150','경북','상주시','양촌동\r\n');
INSERT INTO postno VALUES (7922,'742-160','경북','상주시','지천동\r\n');
INSERT INTO postno VALUES (7923,'742-170','경북','상주시','가장동\r\n');
INSERT INTO postno VALUES (7924,'742-180','경북','상주시','홍각동\r\n');
INSERT INTO postno VALUES (7925,'742-190','경북','상주시','오대동\r\n');
INSERT INTO postno VALUES (7926,'742-200','경북','상주시','거동동\r\n');
INSERT INTO postno VALUES (7927,'742-210','경북','상주시','계산동\r\n');
INSERT INTO postno VALUES (7928,'742-220','경북','상주시','화산동\r\n');
INSERT INTO postno VALUES (7929,'742-230','경북','상주시','낙상동\r\n');
INSERT INTO postno VALUES (7930,'742-240','경북','상주시','중덕동\r\n');
INSERT INTO postno VALUES (7931,'742-250','경북','상주시','인평동\r\n');
INSERT INTO postno VALUES (7932,'742-260','경북','상주시','만산동\r\n');
INSERT INTO postno VALUES (7933,'742-270','경북','상주시','죽전동\r\n');
INSERT INTO postno VALUES (7934,'742-280','경북','상주시','부원동\r\n');
INSERT INTO postno VALUES (7935,'742-290','경북','상주시','초산동\r\n');
INSERT INTO postno VALUES (7936,'742-300','경북','상주시','서곡동\r\n');
INSERT INTO postno VALUES (7937,'742-310','경북','상주시','화개동\r\n');
INSERT INTO postno VALUES (7938,'742-320','경북','상주시','외답동\r\n');
INSERT INTO postno VALUES (7939,'742-330','경북','상주시','헌신동\r\n');
INSERT INTO postno VALUES (7940,'742-340','경북','상주시','병성동\r\n');
INSERT INTO postno VALUES (7941,'742-350','경북','상주시','도남동\r\n');
INSERT INTO postno VALUES (7942,'742-360','경북','상주시','남적동\r\n');
INSERT INTO postno VALUES (7943,'742-600','경북','상주시','상주우체국사서함\r\n');
INSERT INTO postno VALUES (7944,'742-711','경북','상주시','가장동 상주산업대학교\r\n');
INSERT INTO postno VALUES (7945,'742-800','경북','상주시','함창읍\r\n');
INSERT INTO postno VALUES (7946,'742-810','경북','상주시','이안면\r\n');
INSERT INTO postno VALUES (7947,'742-820','경북','상주시','공검면\r\n');
INSERT INTO postno VALUES (7948,'742-830','경북','상주시','청리면\r\n');
INSERT INTO postno VALUES (7949,'742-840','경북','상주시','공성면\r\n');
INSERT INTO postno VALUES (7950,'742-850','경북','상주시','내서면\r\n');
INSERT INTO postno VALUES (7951,'742-855','경북','상주시','내서면\r\n');
INSERT INTO postno VALUES (7952,'742-860','경북','상주시','화서면\r\n');
INSERT INTO postno VALUES (7953,'742-870','경북','상주시','화북면\r\n');
INSERT INTO postno VALUES (7954,'742-880','경북','상주시','화동면\r\n');
INSERT INTO postno VALUES (7955,'742-890','경북','상주시','모서면\r\n');
INSERT INTO postno VALUES (7956,'742-910','경북','상주시','모동면\r\n');
INSERT INTO postno VALUES (7957,'742-920','경북','상주시','외서면\r\n');
INSERT INTO postno VALUES (7958,'742-930','경북','상주시','은척면\r\n');
INSERT INTO postno VALUES (7959,'742-940','경북','상주시','중동면\r\n');
INSERT INTO postno VALUES (7960,'742-950','경북','상주시','낙동면\r\n');
INSERT INTO postno VALUES (7961,'742-960','경북','상주시','사벌면\r\n');
INSERT INTO postno VALUES (7962,'742-970','경북','상주시','외남면\r\n');
INSERT INTO postno VALUES (7963,'742-980','경북','상주시','화남면\r\n');
INSERT INTO postno VALUES (7964,'745-020','경북','문경시','중앙동\r\n');
INSERT INTO postno VALUES (7965,'745-030','경북','문경시','신흥동\r\n');
INSERT INTO postno VALUES (7966,'745-040','경북','문경시','대성동\r\n');
INSERT INTO postno VALUES (7967,'745-050','경북','문경시','모전동\r\n');
INSERT INTO postno VALUES (7968,'745-060','경북','문경시','신기동\r\n');
INSERT INTO postno VALUES (7969,'745-120','경북','문경시','점촌동\r\n');
INSERT INTO postno VALUES (7970,'745-130','경북','문경시','흥덕동\r\n');
INSERT INTO postno VALUES (7971,'745-140','경북','문경시','불정동\r\n');
INSERT INTO postno VALUES (7972,'745-150','경북','문경시','공평동\r\n');
INSERT INTO postno VALUES (7973,'745-220','경북','문경시','영신동\r\n');
INSERT INTO postno VALUES (7974,'745-230','경북','문경시','우지동\r\n');
INSERT INTO postno VALUES (7975,'745-240','경북','문경시','유곡동\r\n');
INSERT INTO postno VALUES (7976,'745-330','경북','문경시','창동\r\n');
INSERT INTO postno VALUES (7977,'745-340','경북','문경시','윤직동\r\n');
INSERT INTO postno VALUES (7978,'745-600','경북','문경시','문경우체국사서함\r\n');
INSERT INTO postno VALUES (7979,'745-800','경북','문경시','문경읍\r\n');
INSERT INTO postno VALUES (7980,'745-810','경북','문경시','호계면\r\n');
INSERT INTO postno VALUES (7981,'745-820','경북','문경시','산양면\r\n');
INSERT INTO postno VALUES (7982,'745-830','경북','문경시','산북면\r\n');
INSERT INTO postno VALUES (7983,'745-840','경북','문경시','동로면\r\n');
INSERT INTO postno VALUES (7984,'745-850','경북','문경시','영순면\r\n');
INSERT INTO postno VALUES (7985,'745-860','경북','문경시','마성면\r\n');
INSERT INTO postno VALUES (7986,'745-870','경북','문경시','농암면\r\n');
INSERT INTO postno VALUES (7987,'745-900','경북','문경시','가은읍\r\n');
INSERT INTO postno VALUES (7988,'750-010','경북','영주시','영주동\r\n');
INSERT INTO postno VALUES (7989,'750-011','경북','영주시','영주1동\r\n');
INSERT INTO postno VALUES (7990,'750-012','경북','영주시','영주2동\r\n');
INSERT INTO postno VALUES (7991,'750-013','경북','영주시','영주3동\r\n');
INSERT INTO postno VALUES (7992,'750-014','경북','영주시','영주4동\r\n');
INSERT INTO postno VALUES (7993,'750-020','경북','영주시','가흥동\r\n');
INSERT INTO postno VALUES (7994,'750-021','경북','영주시','가흥1동\r\n');
INSERT INTO postno VALUES (7995,'750-022','경북','영주시','가흥2동\r\n');
INSERT INTO postno VALUES (7996,'750-030','경북','영주시','상망동\r\n');
INSERT INTO postno VALUES (7997,'750-040','경북','영주시','하망동\r\n');
INSERT INTO postno VALUES (7998,'750-041','경북','영주시','하망1동\r\n');
INSERT INTO postno VALUES (7999,'750-042','경북','영주시','하망2동\r\n');
INSERT INTO postno VALUES (8000,'750-043','경북','영주시','하망3동\r\n');
INSERT INTO postno VALUES (8001,'750-050','경북','영주시','휴천동\r\n');
INSERT INTO postno VALUES (8002,'750-051','경북','영주시','휴천1동\r\n');
INSERT INTO postno VALUES (8003,'750-052','경북','영주시','휴천2동\r\n');
INSERT INTO postno VALUES (8004,'750-053','경북','영주시','휴천3동\r\n');
INSERT INTO postno VALUES (8005,'750-060','경북','영주시','고현동\r\n');
INSERT INTO postno VALUES (8006,'750-070','경북','영주시','문정동\r\n');
INSERT INTO postno VALUES (8007,'750-080','경북','영주시','상줄동\r\n');
INSERT INTO postno VALUES (8008,'750-090','경북','영주시','아지동\r\n');
INSERT INTO postno VALUES (8009,'750-100','경북','영주시','창진동\r\n');
INSERT INTO postno VALUES (8010,'750-110','경북','영주시','적서동\r\n');
INSERT INTO postno VALUES (8011,'750-120','경북','영주시','조암동\r\n');
INSERT INTO postno VALUES (8012,'750-130','경북','영주시','조와동\r\n');
INSERT INTO postno VALUES (8013,'750-600','경북','영주시','영주우체국사서함\r\n');
INSERT INTO postno VALUES (8014,'750-701','경북','영주시','휴천2동 영주시청\r\n');
INSERT INTO postno VALUES (8015,'750-711','경북','영주시','풍기읍 동양공과대학교\r\n');
INSERT INTO postno VALUES (8016,'750-712','경북','영주시','휴천2동 경북전문대학\r\n');
INSERT INTO postno VALUES (8017,'750-800','경북','영주시','풍기읍\r\n');
INSERT INTO postno VALUES (8018,'750-810','경북','영주시','순흥면\r\n');
INSERT INTO postno VALUES (8019,'750-820','경북','영주시','부석면\r\n');
INSERT INTO postno VALUES (8020,'750-830','경북','영주시','단산면\r\n');
INSERT INTO postno VALUES (8021,'750-840','경북','영주시','이산면\r\n');
INSERT INTO postno VALUES (8022,'750-850','경북','영주시','평은면\r\n');
INSERT INTO postno VALUES (8023,'750-860','경북','영주시','장수면\r\n');
INSERT INTO postno VALUES (8024,'750-870','경북','영주시','안정면\r\n');
INSERT INTO postno VALUES (8025,'750-880','경북','영주시','문수면\r\n');
INSERT INTO postno VALUES (8026,'750-890','경북','영주시','봉현면\r\n');
INSERT INTO postno VALUES (8027,'750-895','경북','영주시','봉현면 노좌동\r\n');
INSERT INTO postno VALUES (8028,'750-895','경북','영주시','봉현면 유전동\r\n');
INSERT INTO postno VALUES (8029,'750-895','경북','영주시','봉현면 하촌동\r\n');
INSERT INTO postno VALUES (8030,'755-800','경북','봉화군','봉화읍\r\n');
INSERT INTO postno VALUES (8031,'755-810','경북','봉화군','상운면\r\n');
INSERT INTO postno VALUES (8032,'755-820','경북','봉화군','물야면\r\n');
INSERT INTO postno VALUES (8033,'755-830','경북','봉화군','법전면\r\n');
INSERT INTO postno VALUES (8034,'755-840','경북','봉화군','춘양면\r\n');
INSERT INTO postno VALUES (8035,'755-845','경북','봉화군','춘양면 도심리\r\n');
INSERT INTO postno VALUES (8036,'755-845','경북','봉화군','춘양면 서벽리\r\n');
INSERT INTO postno VALUES (8037,'755-845','경북','봉화군','춘양면 우구치리\r\n');
INSERT INTO postno VALUES (8038,'755-850','경북','봉화군','봉성면\r\n');
INSERT INTO postno VALUES (8039,'755-860','경북','봉화군','명호면\r\n');
INSERT INTO postno VALUES (8040,'755-870','경북','봉화군','재산면\r\n');
INSERT INTO postno VALUES (8041,'755-880','경북','봉화군','소천면\r\n');
INSERT INTO postno VALUES (8042,'755-885','경북','봉화면','소천면 두음리\r\n');
INSERT INTO postno VALUES (8043,'755-885','경북','봉화면','소천면 서천리\r\n');
INSERT INTO postno VALUES (8044,'755-885','경북','봉화면','소천면 임기리\r\n');
INSERT INTO postno VALUES (8045,'755-890','경북','봉화군','석포면\r\n');
INSERT INTO postno VALUES (8046,'757-800','경북','예천군','예천읍\r\n');
INSERT INTO postno VALUES (8047,'757-810','경북','예천군','보문면\r\n');
INSERT INTO postno VALUES (8048,'757-820','경북','예천군','상리면\r\n');
INSERT INTO postno VALUES (8049,'757-830','경북','예천군','용궁면\r\n');
INSERT INTO postno VALUES (8050,'757-840','경북','예천군','용문면\r\n');
INSERT INTO postno VALUES (8051,'757-850','경북','예천군','지보면\r\n');
INSERT INTO postno VALUES (8052,'757-860','경북','예천군','풍양면\r\n');
INSERT INTO postno VALUES (8053,'757-870','경북','예천군','하리면\r\n');
INSERT INTO postno VALUES (8054,'757-880','경북','예천군','호명면\r\n');
INSERT INTO postno VALUES (8055,'757-890','경북','예천군','유천면\r\n');
INSERT INTO postno VALUES (8056,'757-910','경북','예천군','감천면\r\n');
INSERT INTO postno VALUES (8057,'757-920','경북','예천군','개포면\r\n');
INSERT INTO postno VALUES (8058,'760-010','경북','안동시','용상동\r\n');
INSERT INTO postno VALUES (8059,'760-020','경북','안동시','신세동\r\n');
INSERT INTO postno VALUES (8060,'760-030','경북','안동시','법흥동\r\n');
INSERT INTO postno VALUES (8061,'760-040','경북','안동시','동문동\r\n');
INSERT INTO postno VALUES (8062,'760-050','경북','안동시','동부동\r\n');
INSERT INTO postno VALUES (8063,'760-060','경북','안동시','옥정동\r\n');
INSERT INTO postno VALUES (8064,'760-070','경북','안동시','율세동\r\n');
INSERT INTO postno VALUES (8065,'760-080','경북','안동시','삼산동\r\n');
INSERT INTO postno VALUES (8066,'760-090','경북','안동시','서부동\r\n');
INSERT INTO postno VALUES (8067,'760-100','경북','안동시','남부동\r\n');
INSERT INTO postno VALUES (8068,'760-110','경북','안동시','운흥동\r\n');
INSERT INTO postno VALUES (8069,'760-120','경북','안동시','북문동\r\n');
INSERT INTO postno VALUES (8070,'760-130','경북','안동시','명륜동\r\n');
INSERT INTO postno VALUES (8071,'760-140','경북','안동시','신안동\r\n');
INSERT INTO postno VALUES (8072,'760-150','경북','안동시','대석동\r\n');
INSERT INTO postno VALUES (8073,'760-160','경북','안동시','천리동\r\n');
INSERT INTO postno VALUES (8074,'760-170','경북','안동시','안흥동\r\n');
INSERT INTO postno VALUES (8075,'760-180','경북','안동시','남문동\r\n');
INSERT INTO postno VALUES (8076,'760-190','경북','안동시','목성동\r\n');
INSERT INTO postno VALUES (8077,'760-200','경북','안동시','화성동\r\n');
INSERT INTO postno VALUES (8078,'760-210','경북','안동시','법상동\r\n');
INSERT INTO postno VALUES (8079,'760-220','경북','안동시','광석동\r\n');
INSERT INTO postno VALUES (8080,'760-230','경북','안동시','당북동\r\n');
INSERT INTO postno VALUES (8081,'760-240','경북','안동시','옥야동\r\n');
INSERT INTO postno VALUES (8082,'760-250','경북','안동시','금곡동\r\n');
INSERT INTO postno VALUES (8083,'760-260','경북','안동시','안기동\r\n');
INSERT INTO postno VALUES (8084,'760-270','경북','안동시','평화동\r\n');
INSERT INTO postno VALUES (8085,'760-280','경북','안동시','운안동\r\n');
INSERT INTO postno VALUES (8086,'760-290','경북','안동시','태화동\r\n');
INSERT INTO postno VALUES (8087,'760-300','경북','안동시','송현동\r\n');
INSERT INTO postno VALUES (8088,'760-310','경북','안동시','옥동\r\n');
INSERT INTO postno VALUES (8089,'760-320','경북','안동시','노하동\r\n');
INSERT INTO postno VALUES (8090,'760-330','경북','안동시','이천동\r\n');
INSERT INTO postno VALUES (8091,'760-340','경북','안동시','안막동\r\n');
INSERT INTO postno VALUES (8092,'760-350','경북','안동시','상아동\r\n');
INSERT INTO postno VALUES (8093,'760-360','경북','안동시','성곡동\r\n');
INSERT INTO postno VALUES (8094,'760-370','경북','안동시','석동\r\n');
INSERT INTO postno VALUES (8095,'760-380','경북','안동시','송천동\r\n');
INSERT INTO postno VALUES (8096,'760-390','경북','안동시','정상동\r\n');
INSERT INTO postno VALUES (8097,'760-400','경북','안동시','정하동\r\n');
INSERT INTO postno VALUES (8098,'760-410','경북','안동시','수상동\r\n');
INSERT INTO postno VALUES (8099,'760-420','경북','안동시','수하동\r\n');
INSERT INTO postno VALUES (8100,'760-600','경북','안동시','안동우체국사서함\r\n');
INSERT INTO postno VALUES (8101,'760-380','경북','안동시','명륜동 안동시청\r\n');
INSERT INTO postno VALUES (8102,'760-390','경북','안동시','풍산읍 안동교도소\r\n');
INSERT INTO postno VALUES (8103,'760-400','경북','안동시','율세동 상지전문대학\r\n');
INSERT INTO postno VALUES (8104,'760-728','경북','안동시','태화동 안동문화방송국건물\r\n');
INSERT INTO postno VALUES (8105,'760-749','경북','안동시','송천동 안동대학교\r\n');
INSERT INTO postno VALUES (8106,'760-790','경북','안동시','한국방송공사안동방송국\r\n');
INSERT INTO postno VALUES (8107,'760-800','경북','안동시','풍산읍\r\n');
INSERT INTO postno VALUES (8108,'760-810','경북','안동시','풍천면\r\n');
INSERT INTO postno VALUES (8109,'760-820','경북','안동시','서후면\r\n');
INSERT INTO postno VALUES (8110,'760-830','경북','안동시','임하면\r\n');
INSERT INTO postno VALUES (8111,'760-835','경북','안동시','임하면 노산동\r\n');
INSERT INTO postno VALUES (8112,'760-837','경북','안동시','임하면 고곡동\r\n');
INSERT INTO postno VALUES (8113,'760-837','경북','안동시','임하면 오대동\r\n');
INSERT INTO postno VALUES (8114,'760-840','경북','안동시','길안면\r\n');
INSERT INTO postno VALUES (8115,'760-850','경북','안동시','임동면\r\n');
INSERT INTO postno VALUES (8116,'760-860','경북','안동시','남선면\r\n');
INSERT INTO postno VALUES (8117,'760-865','경북','안동시','남선면 원림동\r\n');
INSERT INTO postno VALUES (8118,'760-865','경북','안동시','남선면 현내동\r\n');
INSERT INTO postno VALUES (8119,'760-865','경북','안동시','남선면 외하동\r\n');
INSERT INTO postno VALUES (8120,'760-870','경북','안동시','남후면\r\n');
INSERT INTO postno VALUES (8121,'760-880','경북','안동시','일직면\r\n');
INSERT INTO postno VALUES (8122,'760-890','경북','안동시','북후면\r\n');
INSERT INTO postno VALUES (8123,'760-910','경북','안동시','와룡면\r\n');
INSERT INTO postno VALUES (8124,'760-920','경북','안동시','녹전면\r\n');
INSERT INTO postno VALUES (8125,'760-930','경북','안동시','도산면\r\n');
INSERT INTO postno VALUES (8126,'760-935','경북','안동시','도산면 동부동\r\n');
INSERT INTO postno VALUES (8127,'760-935','경북','안동시','도산면 서부동\r\n');
INSERT INTO postno VALUES (8128,'760-935','경북','안동시','도산면 선양동\r\n');
INSERT INTO postno VALUES (8129,'760-935','경북','안동시','도산면 의일동\r\n');
INSERT INTO postno VALUES (8130,'760-940','경북','안동시','예안면\r\n');
INSERT INTO postno VALUES (8131,'760-945','경북','안동시','예안면 천진동 상천\r\n');
INSERT INTO postno VALUES (8132,'760-945','경북','안동시','예안면 천진동 중천\r\n');
INSERT INTO postno VALUES (8133,'760-945','경북','안동시','예안면 천진동 하천\r\n');
INSERT INTO postno VALUES (8134,'763-710','경북','청송군','진보면 청송교도소\r\n');
INSERT INTO postno VALUES (8135,'763-800','경북','청송군','청송읍\r\n');
INSERT INTO postno VALUES (8136,'763-810','경북','청송군','진보면\r\n');
INSERT INTO postno VALUES (8137,'763-820','경북','청송군','파천면\r\n');
INSERT INTO postno VALUES (8138,'763-830','경북','청송군','부동면\r\n');
INSERT INTO postno VALUES (8139,'763-840','경북','청송군','부남면\r\n');
INSERT INTO postno VALUES (8140,'763-850','경북','청송군','현동면\r\n');
INSERT INTO postno VALUES (8141,'763-860','경북','청송군','안덕면\r\n');
INSERT INTO postno VALUES (8142,'763-870','경북','청송군','현서면\r\n');
INSERT INTO postno VALUES (8143,'764-800','경북','영양군','영양읍\r\n');
INSERT INTO postno VALUES (8144,'764-810','경북','영양군','석보면\r\n');
INSERT INTO postno VALUES (8145,'764-820','경북','영양군','입암면\r\n');
INSERT INTO postno VALUES (8146,'764-830','경북','영양군','일월면\r\n');
INSERT INTO postno VALUES (8147,'764-840','경북','영양군','청기면\r\n');
INSERT INTO postno VALUES (8148,'764-850','경북','영양군','수비면\r\n');
INSERT INTO postno VALUES (8149,'766-800','경북','영덕군','영덕읍\r\n');
INSERT INTO postno VALUES (8150,'766-810','경북','영덕군','영해면\r\n');
INSERT INTO postno VALUES (8151,'766-820','경북','영덕군','강구면\r\n');
INSERT INTO postno VALUES (8152,'766-830','경북','영덕군','축산면\r\n');
INSERT INTO postno VALUES (8153,'766-840','경북','영덕군','남정면\r\n');
INSERT INTO postno VALUES (8154,'766-850','경북','영덕군','병곡면\r\n');
INSERT INTO postno VALUES (8155,'766-860','경북','영덕군','지품면\r\n');
INSERT INTO postno VALUES (8156,'766-870','경북','영덕군','창수면\r\n');
INSERT INTO postno VALUES (8157,'766-880','경북','영덕군','달산면\r\n');
INSERT INTO postno VALUES (8158,'767-800','경북','울진군','울진읍\r\n');
INSERT INTO postno VALUES (8159,'767-810','경북','울진군','죽변면\r\n');
INSERT INTO postno VALUES (8160,'767-830','경북','울진군','후포면\r\n');
INSERT INTO postno VALUES (8161,'767-840','경북','울진군','온정면\r\n');
INSERT INTO postno VALUES (8162,'767-850','경북','울진군','기성면\r\n');
INSERT INTO postno VALUES (8163,'767-860','경북','울진군','원남면\r\n');
INSERT INTO postno VALUES (8164,'767-870','경북','울진군','근남면\r\n');
INSERT INTO postno VALUES (8165,'767-880','경북','울진군','서면\r\n');
INSERT INTO postno VALUES (8166,'767-890','경북','울진군','북면\r\n');
INSERT INTO postno VALUES (8167,'767-900','경북','울진군','평해읍\r\n');
INSERT INTO postno VALUES (8168,'769-800','경북','의성군','의성읍\r\n');
INSERT INTO postno VALUES (8169,'769-810','경북','의성군','사곡면\r\n');
INSERT INTO postno VALUES (8170,'769-820','경북','의성군','단촌면\r\n');
INSERT INTO postno VALUES (8171,'769-830','경북','의성군','점곡면\r\n');
INSERT INTO postno VALUES (8172,'769-840','경북','의성군','옥산면\r\n');
INSERT INTO postno VALUES (8173,'769-850','경북','의성군','금성면\r\n');
INSERT INTO postno VALUES (8174,'769-860','경북','의성군','가음면\r\n');
INSERT INTO postno VALUES (8175,'769-870','경북','의성군','춘산면\r\n');
INSERT INTO postno VALUES (8176,'769-880','경북','의성군','안평면\r\n');
INSERT INTO postno VALUES (8177,'769-890','경북','의성군','신평면\r\n');
INSERT INTO postno VALUES (8178,'769-910','경북','의성군','봉양면\r\n');
INSERT INTO postno VALUES (8179,'769-920','경북','의성군','비안면\r\n');
INSERT INTO postno VALUES (8180,'769-925','경북','의성군','비안면 도암동\r\n');
INSERT INTO postno VALUES (8181,'769-925','경북','의성군','비안면 쌍계동\r\n');
INSERT INTO postno VALUES (8182,'769-925','경북','의성군','비안면 산제동\r\n');
INSERT INTO postno VALUES (8183,'769-925','경북','의성군','비안면 화신동\r\n');
INSERT INTO postno VALUES (8184,'769-930','경북','의성군','안계면\r\n');
INSERT INTO postno VALUES (8185,'769-940','경북','의성군','구천면\r\n');
INSERT INTO postno VALUES (8186,'769-950','경북','의성군','단북면\r\n');
INSERT INTO postno VALUES (8187,'769-960','경북','의성군','단밀면\r\n');
INSERT INTO postno VALUES (8188,'769-970','경북','의성군','다인면\r\n');
INSERT INTO postno VALUES (8189,'769-980','경북','의성군','안사면\r\n');
INSERT INTO postno VALUES (8190,'770-010','경북','영천시','창구동\r\n');
INSERT INTO postno VALUES (8191,'770-020','경북','영천시','문내동\r\n');
INSERT INTO postno VALUES (8192,'770-030','경북','영천시','문외동\r\n');
INSERT INTO postno VALUES (8193,'770-040','경북','영천시','과전동\r\n');
INSERT INTO postno VALUES (8194,'770-050','경북','영천시','교촌동\r\n');
INSERT INTO postno VALUES (8195,'770-060','경북','영천시','금로동\r\n');
INSERT INTO postno VALUES (8196,'770-070','경북','영천시','성내동\r\n');
INSERT INTO postno VALUES (8197,'770-080','경북','영천시','화룡동\r\n');
INSERT INTO postno VALUES (8198,'770-090','경북','영천시','완산동\r\n');
INSERT INTO postno VALUES (8199,'770-100','경북','영천시','야사동\r\n');
INSERT INTO postno VALUES (8200,'770-110','경북','영천시','망정동\r\n');
INSERT INTO postno VALUES (8201,'770-120','경북','영천시','조교동\r\n');
INSERT INTO postno VALUES (8202,'770-130','경북','영천시','도남동\r\n');
INSERT INTO postno VALUES (8203,'770-140','경북','영천시','봉동\r\n');
INSERT INTO postno VALUES (8204,'770-150','경북','영천시','본촌동\r\n');
INSERT INTO postno VALUES (8205,'770-160','경북','영천시','채신동\r\n');
INSERT INTO postno VALUES (8206,'770-170','경북','영천시','괴연동\r\n');
INSERT INTO postno VALUES (8207,'770-180','경북','영천시','작산동\r\n');
INSERT INTO postno VALUES (8208,'770-190','경북','영천시','범어동\r\n');
INSERT INTO postno VALUES (8209,'770-200','경북','영천시','녹전동\r\n');
INSERT INTO postno VALUES (8210,'770-210','경북','영천시','도림동\r\n');
INSERT INTO postno VALUES (8211,'770-220','경북','영천시','매산동\r\n');
INSERT INTO postno VALUES (8212,'770-230','경북','영천시','도동\r\n');
INSERT INTO postno VALUES (8213,'770-240','경북','영천시','오수동\r\n');
INSERT INTO postno VALUES (8214,'770-250','경북','영천시','쌍계동\r\n');
INSERT INTO postno VALUES (8215,'770-260','경북','영천시','대전동\r\n');
INSERT INTO postno VALUES (8216,'770-270','경북','영천시','오미동\r\n');
INSERT INTO postno VALUES (8217,'770-280','경북','영천시','언하동\r\n');
INSERT INTO postno VALUES (8218,'770-290','경북','영천시','신기동\r\n');
INSERT INTO postno VALUES (8219,'770-300','경북','영천시','서산동\r\n');
INSERT INTO postno VALUES (8220,'770-600','경북','영천시','영천우체국사서함\r\n');
INSERT INTO postno VALUES (8221,'770-800','경북','영천시','금호읍\r\n');
INSERT INTO postno VALUES (8222,'770-810','경북','영천시','신령면\r\n');
INSERT INTO postno VALUES (8223,'770-820','경북','영천시','화북면\r\n');
INSERT INTO postno VALUES (8224,'770-830','경북','영천시','화남면\r\n');
INSERT INTO postno VALUES (8225,'770-840','경북','영천시','고경면\r\n');
INSERT INTO postno VALUES (8226,'770-845','경북','영천시','고경면 고도동\r\n');
INSERT INTO postno VALUES (8227,'770-845','경북','영천시','고경면 용전동\r\n');
INSERT INTO postno VALUES (8228,'770-845','경북','영천시','고경면 단포동\r\n');
INSERT INTO postno VALUES (8229,'770-845','경북','영천시','고경면 대성동\r\n');
INSERT INTO postno VALUES (8230,'770-845','경북','영천시','고경면 창상동\r\n');
INSERT INTO postno VALUES (8231,'770-845','경북','영천시','고경면 대의동\r\n');
INSERT INTO postno VALUES (8232,'770-845','경북','영천시','고경면 청하동\r\n');
INSERT INTO postno VALUES (8233,'770-845','경북','영천시','고경면 도암동\r\n');
INSERT INTO postno VALUES (8234,'770-845','경북','영천시','고경면 부동\r\n');
INSERT INTO postno VALUES (8235,'770-845','경북','영천시','고경면 오류동\r\n');
INSERT INTO postno VALUES (8236,'770-850','경북','영천시','화산면\r\n');
INSERT INTO postno VALUES (8237,'770-860','경북','영천시','임고면\r\n');
INSERT INTO postno VALUES (8238,'770-870','경북','영천시','자양면\r\n');
INSERT INTO postno VALUES (8239,'770-880','경북','영천시','북안면\r\n');
INSERT INTO postno VALUES (8240,'770-890','경북','영천시','청통면\r\n');
INSERT INTO postno VALUES (8241,'770-910','경북','영천시','대창면\r\n');
INSERT INTO postno VALUES (8242,'780-010','경북','경주시','성동동\r\n');
INSERT INTO postno VALUES (8243,'780-020','경북','경주시','노동동\r\n');
INSERT INTO postno VALUES (8244,'780-030','경북','경주시','노서동\r\n');
INSERT INTO postno VALUES (8245,'780-040','경북','경주시','동부동\r\n');
INSERT INTO postno VALUES (8246,'780-050','경북','경주시','북부동\r\n');
INSERT INTO postno VALUES (8247,'780-060','경북','경주시','서부동\r\n');
INSERT INTO postno VALUES (8248,'780-070','경북','경주시','황오동\r\n');
INSERT INTO postno VALUES (8249,'780-080','경북','경주시','황남동\r\n');
INSERT INTO postno VALUES (8250,'780-090','경북','경주시','사정동\r\n');
INSERT INTO postno VALUES (8251,'780-100','경북','경주시','보문동\r\n');
INSERT INTO postno VALUES (8252,'780-110','경북','경주시','구황동\r\n');
INSERT INTO postno VALUES (8253,'780-120','경북','경주시','배반동\r\n');
INSERT INTO postno VALUES (8254,'780-130','경북','경주시','황성동\r\n');
INSERT INTO postno VALUES (8255,'780-140','경북','경주시','용강동\r\n');
INSERT INTO postno VALUES (8256,'780-150','경북','경주시','인왕동\r\n');
INSERT INTO postno VALUES (8257,'780-160','경북','경주시','교동\r\n');
INSERT INTO postno VALUES (8258,'780-170','경북','경주시','탑동\r\n');
INSERT INTO postno VALUES (8259,'780-180','경북','경주시','성건동\r\n');
INSERT INTO postno VALUES (8260,'780-190','경북','경주시','동천동\r\n');
INSERT INTO postno VALUES (8261,'780-200','경북','경주시','서악동\r\n');
INSERT INTO postno VALUES (8262,'780-210','경북','경주시','효현동\r\n');
INSERT INTO postno VALUES (8263,'780-220','경북','경주시','남산동\r\n');
INSERT INTO postno VALUES (8264,'780-230','경북','경주시','동방동\r\n');
INSERT INTO postno VALUES (8265,'780-240','경북','경주시','도지동\r\n');
INSERT INTO postno VALUES (8266,'780-250','경북','경주시','충효동\r\n');
INSERT INTO postno VALUES (8267,'780-260','경북','경주시','광명동\r\n');
INSERT INTO postno VALUES (8268,'780-270','경북','경주시','천군동\r\n');
INSERT INTO postno VALUES (8269,'780-280','경북','경주시','북군동\r\n');
INSERT INTO postno VALUES (8270,'780-290','경북','경주시','신평동\r\n');
INSERT INTO postno VALUES (8271,'780-300','경북','경주시','배동\r\n');
INSERT INTO postno VALUES (8272,'780-310','경북','경주시','율동\r\n');
INSERT INTO postno VALUES (8273,'780-320','경북','경주시','덕동\r\n');
INSERT INTO postno VALUES (8274,'780-330','경북','경주시','암곡동\r\n');
INSERT INTO postno VALUES (8275,'780-340','경북','경주시','황용동\r\n');
INSERT INTO postno VALUES (8276,'780-350','경북','경주시','석장동\r\n');
INSERT INTO postno VALUES (8277,'780-360','경북','경주시','손곡동\r\n');
INSERT INTO postno VALUES (8278,'780-400','경북','경주시','진현동\r\n');
INSERT INTO postno VALUES (8279,'780-410','경북','경주시','마동\r\n');
INSERT INTO postno VALUES (8280,'780-420','경북','경주시','구정동\r\n');
INSERT INTO postno VALUES (8281,'780-430','경북','경주시','하동\r\n');
INSERT INTO postno VALUES (8282,'780-440','경북','경주시','조양동\r\n');
INSERT INTO postno VALUES (8283,'780-450','경북','경주시','평동\r\n');
INSERT INTO postno VALUES (8284,'780-460','경북','경주시','시래동\r\n');
INSERT INTO postno VALUES (8285,'780-470','경북','경주시','시동\r\n');
INSERT INTO postno VALUES (8286,'780-600','경북','경주시','경주우체국사서함\r\n');
INSERT INTO postno VALUES (8287,'780-704','경북','경주시','대구지방검찰청경주지청\r\n');
INSERT INTO postno VALUES (8288,'780-705','경북','경주시','대구지방법원경주지원\r\n');
INSERT INTO postno VALUES (8289,'780-711','경북','경주시','충효동 경주전문대학\r\n');
INSERT INTO postno VALUES (8290,'780-712','경북','경주시','효현동 경주대학교\r\n');
INSERT INTO postno VALUES (8291,'780-713','경북','경주시','강동면 위덕대학교\r\n');
INSERT INTO postno VALUES (8292,'780-714','경북','경주시','석장동 동국대학교경주캠퍼스\r\n');
INSERT INTO postno VALUES (8293,'780-715','경북','경주시','양남면 월성원자력발전소\r\n');
INSERT INTO postno VALUES (8294,'780-800','경북','경주시','안강읍\r\n');
INSERT INTO postno VALUES (8295,'780-820','경북','경주시','외동읍\r\n');
INSERT INTO postno VALUES (8296,'780-830','경북','경주시','감포읍\r\n');
INSERT INTO postno VALUES (8297,'780-840','경북','경주시','양남면\r\n');
INSERT INTO postno VALUES (8298,'780-850','경북','경주시','내남면\r\n');
INSERT INTO postno VALUES (8299,'780-860','경북','경주시','서면\r\n');
INSERT INTO postno VALUES (8300,'780-870','경북','경주시','천북면\r\n');
INSERT INTO postno VALUES (8301,'780-785','경북','경주시','천북면 모아2리\r\n');
INSERT INTO postno VALUES (8302,'780-880','경북','경주시','산내면\r\n');
INSERT INTO postno VALUES (8303,'780-890','경북','경주시','양북면\r\n');
INSERT INTO postno VALUES (8304,'780-900','경북','경주시','건천읍\r\n');
INSERT INTO postno VALUES (8305,'780-910','경북','경주시','강동읍\r\n');
INSERT INTO postno VALUES (8306,'780-920','경북','경주시','현곡면\r\n');
INSERT INTO postno VALUES (8307,'790-140','경북','포항시','남구 대도동\r\n');
INSERT INTO postno VALUES (8308,'790-150','경북','포항시','남구 상도동\r\n');
INSERT INTO postno VALUES (8309,'790-160','경북','포항시','남구 송도동\r\n');
INSERT INTO postno VALUES (8310,'790-190','경북','포항시','남구 해도동\r\n');
INSERT INTO postno VALUES (8311,'790-191','경북','포항시','남구 해도1동\r\n');
INSERT INTO postno VALUES (8312,'790-192','경북','포항시','남구 해도2동\r\n');
INSERT INTO postno VALUES (8313,'790-230','경북','포항시','남구 송정동\r\n');
INSERT INTO postno VALUES (8314,'790-240','경북','포항시','남구 장흥동\r\n');
INSERT INTO postno VALUES (8315,'790-300','경북','포항시','남구 괴동\r\n');
INSERT INTO postno VALUES (8316,'790-310','경북','포항시','남구 대잠동\r\n');
INSERT INTO postno VALUES (8317,'790-320','경북','포항시','남구 이동\r\n');
INSERT INTO postno VALUES (8318,'790-330','경북','포항시','남구 효자동\r\n');
INSERT INTO postno VALUES (8319,'790-340','경북','포항시','남구 청림동\r\n');
INSERT INTO postno VALUES (8320,'790-350','경북','포항시','남구 인덕동\r\n');
INSERT INTO postno VALUES (8321,'790-360','경북','포항시','남구 동촌동\r\n');
INSERT INTO postno VALUES (8322,'790-370','경북','포항시','남구 송내동\r\n');
INSERT INTO postno VALUES (8323,'790-380','경북','포항시','남구 호동\r\n');
INSERT INTO postno VALUES (8324,'790-390','경북','포항시','남구 지곡동\r\n');
INSERT INTO postno VALUES (8325,'790-400','경북','포항시','남구 일월동\r\n');
INSERT INTO postno VALUES (8326,'790-600','경북','포항시','남구 포항우체국사서함\r\n');
INSERT INTO postno VALUES (8327,'790-728','경북','포항시','남구 포항문화방송국건물\r\n');
INSERT INTO postno VALUES (8328,'790-784','경북','포항시','남구 효자동 포항공과대학교\r\n');
INSERT INTO postno VALUES (8329,'790-785','경북','포항시','남구 괴동 포항종합제철\r\n');
INSERT INTO postno VALUES (8330,'790-790','경북','포항시','남구 한국방송공사포항방송국\r\n');
INSERT INTO postno VALUES (8331,'790-800','경북','포항시','남구 구룡포읍\r\n');
INSERT INTO postno VALUES (8332,'790-810','경북','포항시','남구 대보면\r\n');
INSERT INTO postno VALUES (8333,'790-840','경북','포항시','남구 대송면\r\n');
INSERT INTO postno VALUES (8334,'790-850','경북','포항시','남구 동해면\r\n');
INSERT INTO postno VALUES (8335,'790-880','경북','포항시','남구 연일읍\r\n');
INSERT INTO postno VALUES (8336,'790-900','경북','포항시','남구 오천읍\r\n');
INSERT INTO postno VALUES (8337,'790-930','경북','포항시','남구 장기면\r\n');
INSERT INTO postno VALUES (8338,'791-010','경북','포항시','북구 신흥동\r\n');
INSERT INTO postno VALUES (8339,'791-020','경북','포항시','북구 덕산동\r\n');
INSERT INTO postno VALUES (8340,'791-030','경북','포항시','북구 대흥동\r\n');
INSERT INTO postno VALUES (8341,'791-040','경북','포항시','북구 남빈동\r\n');
INSERT INTO postno VALUES (8342,'791-050','경북','포항시','북구 죽도동\r\n');
INSERT INTO postno VALUES (8343,'791-051','경북','포항시','북구 죽도1동\r\n');
INSERT INTO postno VALUES (8344,'791-052','경북','포항시','북구 죽도2동\r\n');
INSERT INTO postno VALUES (8345,'791-060','경북','포항시','북구 동빈동\r\n');
INSERT INTO postno VALUES (8346,'791-070','경북','포항시','북구 여천동\r\n');
INSERT INTO postno VALUES (8347,'791-080','경북','포항시','북구 중앙동\r\n');
INSERT INTO postno VALUES (8348,'791-090','경북','포항시','북구 상원동\r\n');
INSERT INTO postno VALUES (8349,'791-100','경북','포항시','북구 대신동\r\n');
INSERT INTO postno VALUES (8350,'791-110','경북','포항시','북구 두호동\r\n');
INSERT INTO postno VALUES (8351,'791-120','경북','포항시','북구 항구동\r\n');
INSERT INTO postno VALUES (8352,'791-130','경북','포항시','북구 덕수동\r\n');
INSERT INTO postno VALUES (8353,'791-170','경북','포항시','북구 용흥동\r\n');
INSERT INTO postno VALUES (8354,'791-171','경북','포항시','북구 용흥1동\r\n');
INSERT INTO postno VALUES (8355,'791-172','경북','포항시','북구 용흥2동\r\n');
INSERT INTO postno VALUES (8356,'791-180','경북','포항시','북구 학산동\r\n');
INSERT INTO postno VALUES (8357,'791-200','경북','포항시','북구 학잠동\r\n');
INSERT INTO postno VALUES (8358,'791-210','경북','포항시','북구 득량동\r\n');
INSERT INTO postno VALUES (8359,'791-220','경북','포항시','북구 우현동\r\n');
INSERT INTO postno VALUES (8360,'791-250','경북','포항시','북구 창포동\r\n');
INSERT INTO postno VALUES (8361,'791-260','경북','포항시','북구 장성동\r\n');
INSERT INTO postno VALUES (8362,'791-270','경북','포항시','북구 양덕동\r\n');
INSERT INTO postno VALUES (8363,'791-280','경북','포항시','북구 환호동\r\n');
INSERT INTO postno VALUES (8364,'791-290','경북','포항시','북구 여남동\r\n');
INSERT INTO postno VALUES (8365,'791-701','경북','포항시','북구 덕수동 포항시청\r\n');
INSERT INTO postno VALUES (8366,'791-820','경북','포항시','북구 기계면\r\n');
INSERT INTO postno VALUES (8367,'791-830','경북','포항시','북구 기북면\r\n');
INSERT INTO postno VALUES (8368,'791-860','경북','포항시','북구 송라면\r\n');
INSERT INTO postno VALUES (8369,'791-870','경북','포항시','북구 신광면\r\n');
INSERT INTO postno VALUES (8370,'791-910','경북','포항시','북구 죽장면\r\n');
INSERT INTO postno VALUES (8371,'791-915','경북','포항시','북구 죽장면 상옥리\r\n');
INSERT INTO postno VALUES (8372,'791-915','경북','포항시','북구 죽장면 하옥리\r\n');
INSERT INTO postno VALUES (8373,'791-920','경북','포항시','북구 청하면\r\n');
INSERT INTO postno VALUES (8374,'791-940','경북','포항시','북구 흥해읍\r\n');
INSERT INTO postno VALUES (8375,'799-800','경북','울릉군','울릉읍\r\n');
INSERT INTO postno VALUES (8376,'799-810','경북','울릉군','서면\r\n');
INSERT INTO postno VALUES (8377,'799-815','경북','울릉군','서면 태하동\r\n');

--
-- Table structure for table `user`
--

CREATE TABLE user (
  num int(10) NOT NULL auto_increment,
  id varchar(12) NOT NULL default '',
  passwd varchar(12) default NULL,
  name varchar(12) default NULL,
  id_no varchar(14) default NULL,
  post varchar(7) default NULL,
  addr1 varchar(70) default NULL,
  addr2 varchar(70) default NULL,
  tele varchar(60) default NULL,
  hand varchar(15) default NULL,
  email varchar(40) NOT NULL default '',
  sex enum('남','여') NOT NULL default '남',
  birthday varchar(12) default NULL,
  job tinyint(2) default NULL,
  inday datetime NOT NULL default '0000-00-00 00:00:00',
  logout datetime NOT NULL default '0000-00-00 00:00:00',
  type tinyint(2) NOT NULL default '0',
  memo1 varchar(70) default NULL,
  memo2 varchar(70) default NULL,
  memo3 varchar(70) default NULL,
  memo4 varchar(70) default NULL,
  offi varchar(70) default NULL,
  myflag int(11) NOT NULL default '0',
  mymode int(11) default NULL,
  all_log int(11) NOT NULL default '0',
  all_time int(11) NOT NULL default '0',
  month_log int(11) NOT NULL default '0',
  month_time int(11) NOT NULL default '0',
  offmin tinyint(3) unsigned NOT NULL default '0',
  countw int(11) NOT NULL default '0',
  countu int(11) NOT NULL default '0',
  countd int(11) NOT NULL default '0',
  down int(11) NOT NULL default '0',
  gofirst varchar(12) default NULL,
  memo5 varchar(70) default NULL,
  memo6 varchar(70) default NULL,
  memo7 varchar(70) default NULL,
  memo8 varchar(70) default NULL,
  mailcount int(5) default NULL,
  guesttype tinyint(4) default NULL,
  login datetime NOT NULL default '0000-00-00 00:00:00',
  del char(1) NOT NULL default '',
  eid varchar(20) default NULL,
  msg tinyint(4) NOT NULL default '0',
  level int(11) NOT NULL default '0',
  point int(11) NOT NULL default '0',
  PRIMARY KEY  (num),
  KEY user_idx (id),
  KEY del (del),
  KEY del_2 (del),
  KEY type (type)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `user`
--

INSERT INTO user VALUES (1,'sysop','sysop','sysop','','300-050','','','','','','남','',2,'2001-04-16 17:54:37','2002-07-04 13:29:17',19,'','','','','',0,0,710,321190,704,321190,30,60,8,0,12878694,'','','','','',0,0,'2002-07-04 23:33:46','','sysop',0,0,0);

--
-- Table structure for table `vote_memo`
--

CREATE TABLE vote_memo (
  no int(11) NOT NULL auto_increment,
  code varchar(12) NOT NULL default '',
  name varchar(20) NOT NULL default '',
  id varchar(20) NOT NULL default '',
  memo varchar(100) NOT NULL default '',
  passwd varchar(8) NOT NULL default '',
  date datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (no),
  KEY code (code)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `vote_memo`
--


--
-- Table structure for table `vote_rec`
--

CREATE TABLE vote_rec (
  num int(4) NOT NULL auto_increment,
  ans0 tinyint(4) NOT NULL default '0',
  ans1 tinyint(4) NOT NULL default '0',
  ans2 tinyint(4) NOT NULL default '0',
  ans3 tinyint(4) NOT NULL default '0',
  ans4 tinyint(4) NOT NULL default '0',
  ans5 tinyint(4) NOT NULL default '0',
  ans6 tinyint(4) NOT NULL default '0',
  ans7 tinyint(4) NOT NULL default '0',
  ans8 tinyint(4) NOT NULL default '0',
  ans9 tinyint(4) NOT NULL default '0',
  ans10 tinyint(4) NOT NULL default '0',
  ans11 tinyint(4) NOT NULL default '0',
  ans12 tinyint(4) NOT NULL default '0',
  ans13 tinyint(4) NOT NULL default '0',
  ans14 tinyint(4) NOT NULL default '0',
  ans15 tinyint(4) NOT NULL default '0',
  ans16 tinyint(4) NOT NULL default '0',
  ans17 tinyint(4) NOT NULL default '0',
  ans18 tinyint(4) NOT NULL default '0',
  ans19 tinyint(4) NOT NULL default '0',
  ans20 tinyint(4) NOT NULL default '0',
  ans21 tinyint(4) NOT NULL default '0',
  ans22 tinyint(4) NOT NULL default '0',
  ans23 tinyint(4) NOT NULL default '0',
  ans24 tinyint(4) NOT NULL default '0',
  ans25 tinyint(4) NOT NULL default '0',
  ans26 tinyint(4) NOT NULL default '0',
  ans27 tinyint(4) NOT NULL default '0',
  ans28 tinyint(4) NOT NULL default '0',
  ans29 tinyint(4) NOT NULL default '0',
  ans30 tinyint(4) NOT NULL default '0',
  ans31 tinyint(4) NOT NULL default '0',
  ans32 tinyint(4) NOT NULL default '0',
  ans33 tinyint(4) NOT NULL default '0',
  ans34 tinyint(4) NOT NULL default '0',
  ans35 tinyint(4) NOT NULL default '0',
  ans36 tinyint(4) NOT NULL default '0',
  ans37 tinyint(4) NOT NULL default '0',
  ans38 tinyint(4) NOT NULL default '0',
  ans39 tinyint(4) NOT NULL default '0',
  ans40 tinyint(4) NOT NULL default '0',
  ans41 tinyint(4) NOT NULL default '0',
  ans42 tinyint(4) NOT NULL default '0',
  ans43 tinyint(4) NOT NULL default '0',
  ans44 tinyint(4) NOT NULL default '0',
  ans45 tinyint(4) NOT NULL default '0',
  ans46 tinyint(4) NOT NULL default '0',
  ans47 tinyint(4) NOT NULL default '0',
  ans48 tinyint(4) NOT NULL default '0',
  ans49 tinyint(4) NOT NULL default '0',
  ans50 tinyint(4) NOT NULL default '0',
  ans51 tinyint(4) NOT NULL default '0',
  ans52 tinyint(4) NOT NULL default '0',
  ans53 tinyint(4) NOT NULL default '0',
  ans54 tinyint(4) NOT NULL default '0',
  ans55 tinyint(4) NOT NULL default '0',
  ans56 tinyint(4) NOT NULL default '0',
  ans57 tinyint(4) NOT NULL default '0',
  ans58 tinyint(4) NOT NULL default '0',
  ans59 tinyint(4) NOT NULL default '0',
  ans60 tinyint(4) NOT NULL default '0',
  ans61 tinyint(4) NOT NULL default '0',
  ans62 tinyint(4) NOT NULL default '0',
  ans63 tinyint(4) NOT NULL default '0',
  ans64 tinyint(4) NOT NULL default '0',
  ans65 tinyint(4) NOT NULL default '0',
  ans66 tinyint(4) NOT NULL default '0',
  ans67 tinyint(4) NOT NULL default '0',
  ans68 tinyint(4) NOT NULL default '0',
  ans69 tinyint(4) NOT NULL default '0',
  ans70 tinyint(4) NOT NULL default '0',
  ans71 tinyint(4) NOT NULL default '0',
  ans72 tinyint(4) NOT NULL default '0',
  ans73 tinyint(4) NOT NULL default '0',
  ans74 tinyint(4) NOT NULL default '0',
  ans75 tinyint(4) NOT NULL default '0',
  ans76 tinyint(4) NOT NULL default '0',
  ans77 tinyint(4) NOT NULL default '0',
  ans78 tinyint(4) NOT NULL default '0',
  ans79 tinyint(4) NOT NULL default '0',
  ans80 tinyint(4) NOT NULL default '0',
  ans81 tinyint(4) NOT NULL default '0',
  ans82 tinyint(4) NOT NULL default '0',
  ans83 tinyint(4) NOT NULL default '0',
  ans84 tinyint(4) NOT NULL default '0',
  ans85 tinyint(4) NOT NULL default '0',
  ans86 tinyint(4) NOT NULL default '0',
  ans87 tinyint(4) NOT NULL default '0',
  ans88 tinyint(4) NOT NULL default '0',
  ans89 tinyint(4) NOT NULL default '0',
  ans90 tinyint(4) NOT NULL default '0',
  ans91 tinyint(4) NOT NULL default '0',
  ans92 tinyint(4) NOT NULL default '0',
  ans93 tinyint(4) NOT NULL default '0',
  ans94 tinyint(4) NOT NULL default '0',
  ans95 tinyint(4) NOT NULL default '0',
  ans96 tinyint(4) NOT NULL default '0',
  ans97 tinyint(4) NOT NULL default '0',
  ans98 tinyint(4) NOT NULL default '0',
  ans99 tinyint(4) NOT NULL default '0',
  ans100 tinyint(4) NOT NULL default '0',
  date datetime NOT NULL default '0000-00-00 00:00:00',
  id varchar(20) NOT NULL default '',
  ip varchar(30) NOT NULL default '',
  code varchar(12) NOT NULL default '',
  PRIMARY KEY  (num)
) TYPE=ISAM PACK_KEYS=1;

--
-- Dumping data for table `vote_rec`
--


