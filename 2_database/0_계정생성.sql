-- �� �� �ּ�
/*
�����ٶ�
���ٻ�
*/

SELECT * FROM DBA_USERS; -- ���� ��� �����鿡 ���ؼ� ��ȸ�ϴ� ��ɹ�
-- ��ɹ� ���� (������ ��� ��ư Ŭ�� | CTRL + ENTER)

-- �Ϲ� ����� ������ �����ϴ� ���� (���� ������ ���������� �� �� �ִ�.)
-- [ǥ����] CREATE USER ������ IDENTIFIED BY ��й�ȣ;
CREATE USER KH IDENTIFIED BY KH;
--������ ��й�ȣ�� ��ҹ��ڸ� �����Ѵ�.

-- ������ ������ �Ϲ� ����� ������ �ּ����� ����(����, ������ ����) �ο�
-- [ǥ����] GRANT ����1, ����2... TO ������;
GRANT RESOURCE, CONNECT TO KH;


CREATE USER wk IDENTIFIED BY wk;
GRANT RESOURCE, CONNECT TO wk;


CREATE VIEW VW_VV AS(
  SELECT STUDENT_NO, STUDENT_NAME,STUDENT_ADDRESS
    FROM TB_STUDENT
);

CREATE USER JDBC IDENTIFIED BY JDBC;
GRANT RESOURCE, CONNECT TO JDBC;