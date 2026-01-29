DROP DATABASE IF EXISTS `Spring_26_01`;
CREATE DATABASE `Spring_26_01`;
USE `Spring_26_01`;

# 게시글 테이블
CREATE TABLE article (
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	memberId INT(10) UNSIGNED NOT NULL,
	categoryId INT(10) UNSIGNED NOT NULL,
	updateDate DATETIME NOT NULL,
	title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);

# 회원 테이블
CREATE TABLE `member` (
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	updateDate DATETIME NOT NULL,
	loginId CHAR(30) NOT NULL,
	loginPw CHAR(100) NOT NULL,
	`authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반,7=관리자)',
	`name` CHAR(20) NOT NULL,
	nickname CHAR(20) NOT NULL,
	cellphoneNum CHAR(20) NOT NULL,
	email CHAR(20) NOT NULL,
	delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
	delDate DATETIME COMMENT '탈퇴 날짜'
);

# 카테고리 테이블
CREATE TABLE category (
	id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	regDate DATETIME NOT NULL,
	memberLevel SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반,7=관리자)',
	`name` CHAR(20) NOT NULL
);



# 게시글 TD
INSERT INTO article
SET regDate = NOW(),
memberId = 1,
categoryId = 1,
updateDate = NOW(),
title = '공지사항 글',
`body` = '회원번호1';

INSERT INTO article
SET regDate = NOW(),
memberId = 2,
categoryId = 2,
updateDate = NOW(),
title = '자유 글',
`body` = '회원번호2';

INSERT INTO article
SET regDate = NOW(),
memberId = 3,
categoryId = 3,
updateDate = NOW(),
title = 'qna 글',
`body` = '회원번호3';



# 회원 TD
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`authLevel` = 7,
`name` = '관리자',
nickname = '관리자_별명',
cellphoneNum = '01012341234',
email = 'abc@gmail.com';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test1',
loginPw = 'test1',
`name` = '회원1',
nickname = '회원1_별명',
cellphoneNum = '01043214321',
email = 'abcd@gmail.com';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test2',
loginPw = 'test2',
`name` = '회원2',
nickname = '회원2_별명',
cellphoneNum = '01056785678',
email = 'abced@gmail.com';



# 카테고리 TD
INSERT INTO category
SET regDate = NOW(),
memberLevel = 7,
`name` = '공지사항';

INSERT INTO category
SET regDate = NOW(),
`name` = '자유';

INSERT INTO category
SET regDate = NOW(),
`name` = 'qna';



SELECT *
FROM article ORDER BY id DESC;

SELECT *
FROM `member`;

SELECT *
FROM category;