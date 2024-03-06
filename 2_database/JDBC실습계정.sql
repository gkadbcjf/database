DROP TABLE LMEMBER;
DROP TABLE LIBRARY;


DROP TABLE LIBRARY;
CREATE TABLE LIBRARY(
    BNUM VARCHAR2 (10) PRIMARY KEY,
    TITLE VARCHAR2 (50) NOT NULL,
    AUTHOR VARCHAR2 (50) NOT NULL,
    GENRE VARCHAR2(15) NOT NULL
);

INSERT INTO LIBRARY VALUES('kh.L1', '참을 수 없는 존재의 가벼움', '박용리', '철학');
INSERT INTO LIBRARY VALUES('kh.L2', '불확실한 자본', '마티아스 말더', '철학');
INSERT INTO LIBRARY VALUES('kh.L3', '스토커', '강경태', '공포');
INSERT INTO LIBRARY VALUES('kh.L4', '그 매우 장황한 사람', '마티아스 말더', '공포');
INSERT INTO LIBRARY VALUES('kh.L5', '추억은 나의 또 다른 이름', '피아 베레즈', '로맨스');
INSERT INTO LIBRARY VALUES('kh.L6', '우리의 밤은 당신의 낮보다 아름답다', '메리 히긴스 클라스', '로맨스');
INSERT INTO LIBRARY VALUES('kh.L7', '그녀의 이름은 무엇인가요', '피아 베레즈', '로맨스');
INSERT INTO LIBRARY VALUES('kh.L8', '나무를 위한 노래', '백석', '소설');
INSERT INTO LIBRARY VALUES('kh.L9', '죽여 마땅한가', '박완서', '소설');
INSERT INTO LIBRARY VALUES('kh.L10', '백설공주', '그리마르크와일드', '소설');

CREATE TABLE LMEMBER(
    ID VARCHAR2(50) PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL,
    PASSWORD VARCHAR2(50) NOT NULL
);

COMMIT;









--------------------------------------------------------------------------------
DROP TABLE MEMBER;
DROP TABLE TEST;

CREATE TABLE TEST(
    TNO NUMBER,
    TNAME VARCHAR2(20),
    TDATE DATE
);

SELECT * FROM TEST;


CREATE TABLE MEMBER(
    USERNO NUMBER PRIMARY KEY, --번호
    USERID VARCHAR2(15) NOT NULL UNIQUE, --아이디
    USERPWD VARCHAR2(15) NOT NULL, --비밀번호
    USERNAME VARCHAR2(20) NOT NULL, --이름
    GENDER CHAR(1) CHECK(GENDER IN('M','F')), --성별
    AGE NUMBER, --나이
    EMAIL VARCHAR2(30), --이메일
    PHONE CHAR(11), --전화번호
    ADDRESS VARCHAR2(100), --주소
    HOBBY VARCHAR2(50), --취미
    ENROLLDATE DATE DEFAULT SYSDATE NOT NULL --가입일
);
DROP SEQUENCE SEQ_USERNO;
CREATE SEQUENCE SEQ_USERNO
NOCACHE;

INSERT INTO MEMBER
VALUES(SEQ_USERNO.NEXTVAL, 'admin','1234','관리자','M',45,'admin@iei.or.kr','01012345678',
'서울',NULL,'2021-07-27');

INSERT INTO MEMBER
VALUES(SEQ_USERNO.NEXTVAL, 'user01','pass01','홍길동',NULL,23,'user01@iei.or.kr','01022222222',
'부산','등산, 영화보기','2021-08-07');

COMMIT;