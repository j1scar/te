drop table member;

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
insert into member values('admin@mfe.com','1234','愿�由ъ옄','二쇱냼�뾾�쓬','�룿踰덊샇','�꽑�샇�옣瑜�','1');
insert into member values('fddfddddd@mfe.com','1234','誘쇰��','二쇱냼�뾾�쓬','�룿踰덊샇','','1');
insert into member values('fddfddddd@mfe.com','1234','誘쇰��','二쇱냼�뾾�쓬','�룿踰덊샇','','1');
select * from member;