drop table member;
--1. index.jsp에서 시작
--2. 관리자 계정 admin, 비번 1234 를 만듭니다.
--3. 사용작 ㅖ정을 3개 만든다.

create table member(
	id varchar2(15),
	password varchar2(10),
	name varchar2(15),
	age Number,
	gender varchar2(5),
	email varchar2(30),
	primary key(id)
);

insert into member values('admin','1234','관리자',26,'1','dkaskgkdua@naver.com');
select * from member;