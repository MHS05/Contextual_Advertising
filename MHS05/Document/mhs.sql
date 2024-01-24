create database mhs;

use mhs;

drop table reply;
drop table community;
drop table user;
drop table category;
drop table similarity;
drop table semotion;
drop table newskeyword;
drop table news;
drop table clickad;
drop table adkeyword;
drop table ad;

create table user
(
	uno int not null auto_increment primary key comment '회원번호',
	id varchar(50) comment '아이디',
	pw varchar(100) comment '비밀번호',
	name varchar(50) comment '이름',
	nickname varchar(50) comment '닉네임',
	gender varchar(2) comment '성별',
	birth varchar(6) comment '생년월일',
	email varchar(50) comment '이메일',
	con varchar(10) comment '체질',
	joindate datetime default now() comment '가입일자',
	isretire varchar(2) default 'N' comment '탈퇴여부',
	cocount int comment '작성글수',
	recount int comment '작성댓글수'
) comment '유저';

create table category
(
	pno int auto_increment primary key comment '상품번호',
	ptype varchar(10) comment '상품구분',
	pname varchar(50) comment '상품명',
	pfimage varchar(100) comment '상품이미지_논리',
	ppimage varchar(100) comment '상품이미지_물리',
	age varchar(10) comment '연령',
	pgender varchar(5) comment '성별',
	pcon varchar(10) comment '체질',
	link varchar(100) comment '링크',
	tag_age varchar(10) comment '태그_연령',
	tag_pgender varchar(10) comment '태그_성별',
	tag_pcon varchar(20) comment '태그_체질',
	month_start varchar(10) comment '월_시작',
	month_end varchar(10) comment '월_끝',
	info text comment '기본정보및효능',
	takeinfo text comment '섭취정보'
) comment '카테고리';


create table community
(
	no int auto_increment primary key comment '게시물번호',
	uno int comment '회원번호',
	id varchar(50) comment '아이디',
	title varchar(200) comment '제목',
	type varchar(2) comment '구분',
	note text comment '내용',
	phyname varchar(100) comment '첨부파일_물리명',
	fname varchar(100) comment '첨부파일_논리명',
	wdate datetime default now() comment '작성일',
	hit int default 0 comment '조회수',
	image varchar(100) comment '이미지_논리',
	phyimage varchar(100) comment '이미지_물리',
	name varchar(100) comment '회원이름',
	nickname varchar(100) comment '회원닉네임',
	recount int comment '댓글개수'
	foreign key(uno) references user(uno)
) comment '게시판';

create table reply
(
	rno int auto_increment primary key comment '댓글번호',
	no int comment '게시물번호',
	uno int comment '회원번호',
	id varchar(50) comment '회원아이디',
	rnote text comment '댓글내용',
	rdate datetime default now() comment '작성일',
	name varchar(50) comment '이름',
	nickname varchar(50) comment '닉네임',
	title varchar(200) comment '글제목',
	foreign key(no) references community(no),
	foreign key(uno) references user(uno)
) comment '댓글';

create table ad
(
	adno int auto_increment primary key comment '광고번호',
	adname varchar(200) comment '상품이름',
	image varchar(100) comment '이미지_논리',
	phyimage varchar(100) comment '이미지_물리'
) comment '광고';

create table adkeyword
(
	adkeyno int auto_increment primary key comment '광고키워드관리번호',
	adno int comment '광고번호',
	adkey varchar(10) comment '광고키워드',
	foreign key(adno) references ad(adno)
) comment '광고키워드';

create table clickad
(
	clickadno int auto_increment primary key comment '노출정보관리번호',
	adno int comment '광고번호',
	cdate datetime comment '노출일',
	cnews int comment '노출게시물번호',
	foreign key(adno) references ad(adno)
) comment '광고노출정보';

create table news
(
	nno int auto_increment primary key comment '뉴스번호',
	category varchar(2) comment '카데고리',
	title varchar(200) comment '제목',
	note text comment '내용',
	writer varchar(10) comment '작성자',
	wdate datetime default now() comment '작성일',
	image varchar(100) comment '이미지_논리',
	phyimage varchar(100) comment '이미지_물리',
	emotion varchar(5) comment '긍부정',
	adno int comment '광고번호',
	foreign key(adno) references ad(adno)
) comment '건강소식';

create table newskeyword
(
	nkeyno int auto_increment primary key comment '뉴스키워드관리번호',
	nno int comment '뉴스번호',
	nkey varchar(10) comment '뉴스키워드',
	nkeynum int comment '키워드빈도수',
	foreign key(nno) references news(nno)
) comment '뉴스키워드';

create table semotion
(
	senno int auto_increment primary key comment '문장별관리번호',
	nno int comment '뉴스번호',
	sentance varchar(100) comment '문장',
	emotion varchar(10) comment '긍부정여부',
	score varchar(10) comment '긍부정점수',
	foreign key(nno) references news(nno)
) comment '문장별긍부정점수';

create table similarity
(
	sno int auto_increment primary key comment '유사도관리번호',
	adkeyno int comment '광고키워드관리번호',
	nkeyno int comment '뉴스키워드관리번호',
	nkey varchar(10) comment '뉴스키워드',
	adkey varchar(10) comment '광고키워드',
	similary varchar(10) comment '유사도',
	adno int comment '광고번호',
	nno int comment '뉴스키워드',
	foreign key(adkeyno) references adkeyword(adkeyno),
	foreign key(nkeyno) references newskeyword(nkeyno)
) comment '유사도';