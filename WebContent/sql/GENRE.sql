drop table genre;
CREATE TABLE GENRE(
	GENRE_ID	NUMBER,
	GENRE_NAME	VARCHAR2(20) NOT NULL,
	PRIMARY KEY(GENRE_ID)
);
create sequence genre_seq increment by 1 start with 1;
SELECT * FROM GENRE;
DELETE * FROM GENRE;

INSERT INTO GENRE VALUES(genre_seq.nextval, 'HIPHOP');