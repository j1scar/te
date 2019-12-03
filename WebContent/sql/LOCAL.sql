CREATE TABLE LOCAL(
	LOCAL_ID	NUMBER,
	LOCAL_NAME	VARCHAR2(20)	NOT NULL,
	PRIMARY KEY(LOCAL_ID)
);
create sequence local_seq increment by 1 start with 1;
SELECT * FROM LOCAL;
DELETE FROM LOCAL;

INSERT INTO LOCAL VALUES(local_seq.nextval, '서울');