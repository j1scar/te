CREATE TABLE BOOK(
	BOOK_ID			NUMBER,
	CONCERT_ID		NUMBER	NOT NULL,
	MEMBER_ID		NUMBER	NOT NULL,
	BOOK_ETICKET	VARCHAR2(20)	NOT NULL,
	BOOK_AMOUNT		NUMBER	NOT NULL,
	CARD_ID			NUMBER	NOT NULL,
	BOOK_DATE		DATE	NOT NULL,
	CONSTRAINT	PRIMARY KEY(BOOK_ID),
	CONSTRAINT FOREIGN KEY(CONCERT_ID) REFERENCES CONCERT(CONCERT_ID),
	CONSTRAINT FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID),
	CONSTRAINT FOREIGN KEY(CARD_ID) REFERENCES CARD(CARD_ID)
);

SELECT * FROM BOOK;
DELETE FROM BOOK;

INSERT(BOOK_ID, CONCERT_ID, MEMBER_ID, BOOK_ETICKET, BOOK_AMOUNT,
		CARD_ID, BOOK_DATE) 
INTO BOOK 
VALUES(1, 1, 1, '��Ƽ��1', 2, 123456, SYSDATE);