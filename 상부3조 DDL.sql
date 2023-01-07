-- DDL
DROP DATABASE IF EXISTS mogotco;
CREATE DATABASE mogotco;

-- DATA TYPE
-- 숫자(정수, 실수)
-- 문자(char, varchar)
-- DATA(년월일,년월일시분초) 

USE mogotco;

DROP TABLE IF EXISTS `mentoring`;

CREATE TABLE `mentoring` (
	`mentoringid`	int	NOT NULL	COMMENT '200',
	`mentorid`	int	NOT NULL,
	`mcateid`	int	NOT NULL,
	`mentoringprice`	int	NULL,
	`mentoringdate`	date	NULL,
	`mentoringimg`	Varchar(30)	NULL,
	`mentorurl`	Varchar(500)	NULL,
	`mmemberidcnt`	int	NULL,
	`mrdate`	date	NULL,
	`mplace`	varchar(500)	NULL	COMMENT '비대면:default(비대면)',
	`mcontents`	varchar(5000)	NULL,
	`mtitle`	varchar(500)	NULL,
	`mcaring`	int	NULL	COMMENT '서비스 있으면:1,없으면:0'
);

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
	`userid`	Varchar(50)	NOT NULL,
	`userpwd`	Varchar(20)	NULL,
	`username`	Varchar(20)	NULL,
	`useraddr`	Varchar(500)	NULL,
	`usertel`	Varchar(20)	NULL,
	`useremail`	Varchar(50)	NULL,
	`userdate`	date	NULL,
	`withdraw`	int	NULL,
	`userbirth`	date	NULL,
	`userpoint`	int	NULL,
	`naverid`	VARCHAR(20)	NULL,
	`kakaoid`	VARCHAR(20)	NULL,
	`googleid`	VARCHAR(20)	NULL,
	`usergen`	Varchar(1)	NULL,
	`addrnum`	Varchar(20)	NULL,
	`addrdetail`	Varchar(100)	NULL,
	`addrextra`	Varchar(100)	NULL,
	`snsinsta`	Varchar(1000)	NULL,
	`snsgit`	Varchar(1000)	NULL,
	`userimg`	VARCHAR(1000)	NULL
);

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
	`reviewid`	int	NOT NULL	COMMENT '500',
	`mentoringid`	int	NOT NULL	COMMENT '200',
	`userid`	Varchar(20)	NOT NULL,
	`rating`	INT	NULL,
	`reviewcon`	Varchar(1000)	NULL,
	`reviewdate`	DATE	NULL
);

DROP TABLE IF EXISTS `mcate`;

CREATE TABLE `mcate` (
	`mcateid`	int	NOT NULL	COMMENT '10',
	`mname`	Varchar(50)	NULL
);

DROP TABLE IF EXISTS `purchase`;

CREATE TABLE `purchase` (
	`purchaseid`	int	NOT NULL	COMMENT '600',
	`userid`	Varchar(50)	NOT NULL,
	`purprice`	int	NULL,
	`purdate`	date	NULL,
	`purpay`	Varchar(20)	NULL,
	`purcard`	VARCHAR(20)	NULL
);

DROP TABLE IF EXISTS `purchasedetail`;

CREATE TABLE `purchasedetail` (
	`purchasedetailid`	int	NOT NULL	COMMENT '700',
	`purchaseid`	int	NOT NULL	COMMENT '600',
	`mentoringoptionid`	int	NOT NULL	COMMENT '400',
	`cancelpur`	int	NULL	COMMENT 'default=0',
	`progresspur`	varchar(10)	NULL	COMMENT 'default=0'
);

DROP TABLE IF EXISTS `mentor`;

CREATE TABLE `mentor` (
	`mentorid`	int	NOT NULL	COMMENT '100',
	`userid`	Varchar(20)	NOT NULL,
	`adminid`	Varchar(50)	NOT NULL,
	`mentorcom`	Varchar(50)	NULL,
	`mentorcon`	Varchar(1000)	NULL,
	`mentorimg`	Varchar(30)	NULL,
	`mcardimg`	Varchar(50)	NULL,
	`mentorok`	int	NULL	COMMENT 'default=0',
	`mentordate`	datetime	NULL,
	`cancelmentoring`	int	NULL	COMMENT 'default=3',
	`mentorcareer`	Varchar(1000)	NULL,
	`mentorapply`	datetime	NULL,
	`mcardposition`	Varchar(50)	NULL
);

DROP TABLE IF EXISTS `wishlist`;

CREATE TABLE `wishlist` (
	`wishlistid`	int	NOT NULL	COMMENT '900',
	`userid`	Varchar(20)	NOT NULL,
	`mentorid`	int	NOT NULL	COMMENT '100'
);

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
	`boardid`	int	NOT NULL	COMMENT '800',
	`adminid`	Varchar(50)	NOT NULL,
	`boarddate`	date	NULL,
	`boardtitle`	VARCHAR(100)	NULL	COMMENT '질문(Q&A)',
	`boardcontent`	VARCHAR(1000)	NULL	COMMENT '답변(Q&A)',
	`boardtype`	int	NULL	COMMENT '1;공지 2 qna'
);

DROP TABLE IF EXISTS `mentoringmember`;

CREATE TABLE `mentoringmember` (
	`mmemberid`	int	NOT NULL	COMMENT '300',
	`mentoringoptionid`	int	NOT NULL	COMMENT '1200',
	`userid`	Varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
	`adminid`	Varchar(50)	NOT NULL,
	`adminpwd`	Varchar(20)	NULL,
	`adminname`	Varchar(20)	NULL
);

DROP TABLE IF EXISTS `mwishcate`;

CREATE TABLE `mwishcate` (
	`mwishcateid`	int	NOT NULL	COMMENT '1100',
	`mcateid`	int	NOT NULL	COMMENT '10',
	`mentorid`	int	NOT NULL	COMMENT '100'
);

DROP TABLE IF EXISTS `mentoringoption`;

CREATE TABLE `mentoringoption` (
	`mentoringoptionid`	int	NOT NULL	COMMENT '400',
	`mentoringid`	int	NOT NULL	COMMENT '200',
	`mentoringtime`	Varchar(50)	NULL,
	`moptionstock`	int	NULL
);

DROP TABLE IF EXISTS `coupon`;

CREATE TABLE `coupon` (
	`couponid`	int	NOT NULL	COMMENT '1',
	`couponname`	Varchar(100)	NULL,
	`couponprice`	int	NULL
);

DROP TABLE IF EXISTS `usercoupon`;

CREATE TABLE `usercoupon` (
	`usercouponid`	int	NOT NULL	COMMENT '50',
	`userid`	Varchar(50)	NOT NULL,
	`couponid`	int	NOT NULL	COMMENT '1'
);

ALTER TABLE `mentoring` ADD CONSTRAINT `PK_MENTORING` PRIMARY KEY (
	`mentoringid`
);

ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`userid`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`reviewid`
);

ALTER TABLE `mcate` ADD CONSTRAINT `PK_MCATE` PRIMARY KEY (
	`mcateid`
);

ALTER TABLE `purchase` ADD CONSTRAINT `PK_PURCHASE` PRIMARY KEY (
	`purchaseid`
);

ALTER TABLE `purchasedetail` ADD CONSTRAINT `PK_PURCHASEDETAIL` PRIMARY KEY (
	`purchasedetailid`
);

ALTER TABLE `mentor` ADD CONSTRAINT `PK_MENTOR` PRIMARY KEY (
	`mentorid`
);

ALTER TABLE `wishlist` ADD CONSTRAINT `PK_WISHLIST` PRIMARY KEY (
	`wishlistid`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`boardid`
);

ALTER TABLE `mentoringmember` ADD CONSTRAINT `PK_MENTORINGMEMBER` PRIMARY KEY (
	`mmemberid`
);

ALTER TABLE `admin` ADD CONSTRAINT `PK_ADMIN` PRIMARY KEY (
	`adminid`
);

ALTER TABLE `mwishcate` ADD CONSTRAINT `PK_MWISHCATE` PRIMARY KEY (
	`mwishcateid`
);

ALTER TABLE `mentoringoption` ADD CONSTRAINT `PK_MENTORINGOPTION` PRIMARY KEY (
	`mentoringoptionid`
);

ALTER TABLE `coupon` ADD CONSTRAINT `PK_COUPON` PRIMARY KEY (
	`couponid`
);

ALTER TABLE `usercoupon` ADD CONSTRAINT `PK_USERCOUPON` PRIMARY KEY (
	`usercouponid`
);