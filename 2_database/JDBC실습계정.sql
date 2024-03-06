DROP TABLE LMEMBER;
DROP TABLE LIBRARY;


DROP TABLE LIBRARY;
CREATE TABLE LIBRARY(
    BNUM VARCHAR2 (10) PRIMARY KEY,
    TITLE VARCHAR2 (50) NOT NULL,
    AUTHOR VARCHAR2 (50) NOT NULL,
    GENRE VARCHAR2(15) NOT NULL
);

INSERT INTO LIBRARY VALUES('kh.L1', '���� �� ���� ������ ������', '�ڿ븮', 'ö��');
INSERT INTO LIBRARY VALUES('kh.L2', '��Ȯ���� �ں�', '��Ƽ�ƽ� ����', 'ö��');
INSERT INTO LIBRARY VALUES('kh.L3', '����Ŀ', '������', '����');
INSERT INTO LIBRARY VALUES('kh.L4', '�� �ſ� ��Ȳ�� ���', '��Ƽ�ƽ� ����', '����');
INSERT INTO LIBRARY VALUES('kh.L5', '�߾��� ���� �� �ٸ� �̸�', '�Ǿ� ������', '�θǽ�');
INSERT INTO LIBRARY VALUES('kh.L6', '�츮�� ���� ����� ������ �Ƹ����', '�޸� ���佺 Ŭ��', '�θǽ�');
INSERT INTO LIBRARY VALUES('kh.L7', '�׳��� �̸��� �����ΰ���', '�Ǿ� ������', '�θǽ�');
INSERT INTO LIBRARY VALUES('kh.L8', '������ ���� �뷡', '�鼮', '�Ҽ�');
INSERT INTO LIBRARY VALUES('kh.L9', '�׿� �����Ѱ�', '�ڿϼ�', '�Ҽ�');
INSERT INTO LIBRARY VALUES('kh.L10', '�鼳����', '�׸�����ũ���ϵ�', '�Ҽ�');

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
    USERNO NUMBER PRIMARY KEY, --��ȣ
    USERID VARCHAR2(15) NOT NULL UNIQUE, --���̵�
    USERPWD VARCHAR2(15) NOT NULL, --��й�ȣ
    USERNAME VARCHAR2(20) NOT NULL, --�̸�
    GENDER CHAR(1) CHECK(GENDER IN('M','F')), --����
    AGE NUMBER, --����
    EMAIL VARCHAR2(30), --�̸���
    PHONE CHAR(11), --��ȭ��ȣ
    ADDRESS VARCHAR2(100), --�ּ�
    HOBBY VARCHAR2(50), --���
    ENROLLDATE DATE DEFAULT SYSDATE NOT NULL --������
);
DROP SEQUENCE SEQ_USERNO;
CREATE SEQUENCE SEQ_USERNO
NOCACHE;

INSERT INTO MEMBER
VALUES(SEQ_USERNO.NEXTVAL, 'admin','1234','������','M',45,'admin@iei.or.kr','01012345678',
'����',NULL,'2021-07-27');

INSERT INTO MEMBER
VALUES(SEQ_USERNO.NEXTVAL, 'user01','pass01','ȫ�浿',NULL,23,'user01@iei.or.kr','01022222222',
'�λ�','���, ��ȭ����','2021-08-07');

COMMIT;