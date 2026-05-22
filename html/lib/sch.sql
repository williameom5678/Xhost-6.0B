##관리자 테이블 생성
create table sch_user(
no int(10) default '0' not null ,
userid varchar(10),
passwd varchar(10),
name varchar(15),
bingo varchar(10),
primary key(no)
	);

## 스케쥴 저장데이타
create table sch_data(
no int(10) default '0' not null ,
userid varchar(10),
title varchar(20),
content varchar(100),
date varchar(20),
time varchar(3),
bingo varchar(10),
rest varchar(6),
primary key(no)
	);



insert into sch_user(no,userid,passwd,name,bingo) values('1','admin','admin','관리자','Admin');
insert into sch_user(no,userid,passwd,name,bingo) values('2','test','test','테스터','Normal');