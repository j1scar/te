drop table member;
--1. index.jsp에서 시작
--2. 관리자 계정 admin, 비번 1234 를 만듭니다.
--3. 사용작 ㅖ정을 3개 만든다.

create table member(
	member_id varchar2(30),
	member_password varchar2(20) not null,
	member_name varchar2(20) not null,
	member_address varchar2(20) not null,
	member_phone_number varchar2(20) not null,
	member_preference varchar2(20),
	member_gender varchar2(2) not null,
	primary key(member_id)
);
insert into member values('admin@mfe.com','1234','관리자','주소없음','폰번호','선호장르','1');
select * from member;