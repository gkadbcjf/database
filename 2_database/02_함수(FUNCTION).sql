SELECT EMP_ID, EMP_NAME, SALARY ----------- 3
FROM EMPLOYEE        ---------- 1
WHERE DEPT_CODE IS NULL; ----------- 2

/*
   <ORDER BY ��>
   SELECT�� ���� ������ �ٿ� �ۼ�, ����������� ���� �������� �����Ѵ�.
   
   [ǥ����]
   SELECT ��ȸ�� �÷�....
   FROM ��ȸ�� ���̺�
   WHERE ���ǽ�
   ORDER BY ���ı����� �� �÷��� | ��Ī | �÷����� [ASC | DESC] [NULL FIRST | NULL LAST]
   
   - ASC : ��������(���� ������ �����ؼ� ���� ���� Ŀ���� ��) -> �⺻��
   - DESC : ��������(ū������ �����ؼ� ���� ���� �پ��� ��)
   
   -- NULL�� �⺻������ ���� ū������ �з��ؼ� �����Ѵ�.
   - NULLS FIRST : �����ϰ����ϴ� �÷����� NULL�� ���� ��� �ش絥���� �� �տ� ��ġ(DESC�϶� �⺻��)
   - NULLS LAST : �����ϰ����ϴ� �÷����� NULL�� ���� ��� �ش絥���� �� �������� ��ġ(ASC�϶� �⺻��)
*/

SELECT *
FROM EMPLOYEE
--ORDER BY BONUS; -- �⺻���� ��������
--ORDER BY BONUS ASC;
--ORDER BY BONUS ASC NULLS FIRST;
--ORDER BY BONUS DESC; -- NULLS FIRST �⺻
--���ı��ؿ� �÷����� ������ ��� �״��������� ���ؼ� �������� ������ �� �ִ�.
ORDER BY BONUS DESC, SALARY ASC;

--�� ����� �����, ����(���ʽ�����) ��ȸ(�� �� ������ �������� ����)
SELECT EMP_NAME, SALARY * 12 AS "����"
FROM EMPLOYEE
--ORDER BY SALARY * 12 DESC;
--ORDER BY ���� DESC;
ORDER BY 2 DESC; -- ������밡�� ����Ŭ�� ���� 1���� ����

--================================================================
/*
    <�Լ� FUNCTION>
    ���޵� �÷����� �о�鿩�� �Լ��� ������ ����� ��ȯ
    
    -������ �Լ� : N���� ���� �о�鿩�� N���� ������� ����(���ึ�� �Լ��������� ��ȯ)
    -�׷��Լ� : N���� ���� �о�鿩�� 1���� ������� ����(�׷��� ���� �׷캰�� �Լ� ������ ��ȯ)
    
    >> SELECT ���� ������ �Լ��� �׷��Լ��� �԰� ������� ����!
    ��? ��� ���� ������ �ٸ��� ������
    
    >>�Լ����� ����� �� �ִ� ��ġ : SELECT�� WHERE�� ORDER BY�� GROUP BY�� HAVING��
*/

--=========================<������ �Լ�>=================================
/*
    <���� ó�� �Լ�>
    
    *LENGTH(�÷� | '���ڿ�') : �ش� ���ڿ��� ���ڼ��� ��ȯ
    *LENGTHB(�÷� | '���ڿ�') : �ش� ���ڿ��� ����Ʈ���� ��ȯ
    
    '��' '��' '��' �ѱ��� ���ڴ� 3BYTE
    ������, ����, Ư������ ���ڴ� 1BYTE
*/

SELECT LENGTH('����Ŭ'), LENGTHB('����Ŭ')
FROM DUAL;

SELECT LENGTH('ORACLE'), LENGTHB('ORACLE')
FROM DUAL;

SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME),
       EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL)
FROM EMPLOYEE;


------------------------------------------------------------------

/*
    *INSTR
    ���ڿ��κ��� Ư�� ������ ������ġ�� ã�Ƽ� ��ȯ
    
    INSTR(�÷� | '���ڿ�', 'ã�����ϴ� ����', ['ã�� ��ġ�� ���۰�', ����]) => ����� NUMBER ����
*/

SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL; -- ���ʿ� �ִ� ù B�� 3��° ��ġ�� �ִٰ� ����
-- ã�� ��ġ ���۰� : 1 , ���� : 1 => �⺻��
SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL; -- �ڿ������� ã���� ���� ���� ������ �о �˷��ش�.
SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL; -- ������ �����Ϸ��� ã�� ��ġ�� ���۰��� ǥ���ؾ���
SELECT INSTR('AABAACAABBAA', 'B', 1, 3) FROM DUAL;

SELECT EMAIL, INSTR(EMAIL, '_', 1, 1) AS "LOCATION", INSTR(EMAIL, '@') AS "@��ġ"
FROM EMPLOYEE;

-------------------------------------------------------------------------------
/*
    *SUBSTR / ���־���
    ���ڿ����� Ư�� ���ڿ��� �����ؼ� ��ȯ
    
    [ǥ����]
    SUBSTR(STRING, POSITION, [LENGTH])
    - STRING : ����Ÿ���� �÷� | '���ڿ�'
    - POSITION : ���ڿ� ������ ������ġ�� ��
    - LENGTH : ������ ���� ����(�����ϸ� ������)
*/

SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL; -- 7��° ��ġ���� ������
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL; 
SELECT SUBSTR('SHOWMETHEMONEY', 1, 6) FROM DUAL;  --SHOWME
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL;

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8, 1) AS "����"
FROM EMPLOYEE;

--������� ������鸸 EMP_NAME, EMP_NO ��ȸ
SELECT EMP_NAME, EMP_NO
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) = '2' OR SUBSTR(EMP_NO, 8, 1) = '4';

--������� ������鸸 EMP_NAME, EMP_NO ��ȸ
SELECT EMP_NAME, EMP_NO
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) = '1' OR SUBSTR(EMP_NO, 8, 1) = '3'
ORDER BY EMP_NAME;

--�Լ� ��ø��� ����
--�̸��� ���̵�κи� ����
-- �����Ͽ��� �����, �̸���, ���̵� ��ȸ
SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') - 1)
FROM EMPLOYEE;

------------------------------------------------------------------

/*
    *LPAD / RPAD
    ���ڿ��� ��ȸ�� �� ���ϰ��ְ� �����ϰ��� �� �� ���
    
    [ǥ����]
    LPAD/RPAD(STRING, ���������� ��ȯ�� ������ ����, [�����̰����ϴ� ����])
    
    ���ڿ��� �����̰����ϴ� ���ڸ� ���� �Ǵ� �����ʿ� �ٿ��� ���� N���̸�ŭ�� ���ڿ��� ��ȯ
*/

--20��ŭ�� ���� �� EAMIL�÷����� ���������� �����ϰ� ������ �κ��� �������� ä���
SELECT EMP_NAME, LPAD(EMAIL, 20)
FROM EMPLOYEE;

SELECT EMP_NAME, LPAD(EMAIL, 20, '#')
FROM EMPLOYEE;

SELECT EMP_NAME, RPAD(EMAIL, 20, '#')
FROM EMPLOYEE;

SELECT RPAD('910524-1', 14, '*')
FROM DUAL;

--������� ����� �ֹε�Ϲ�ȣ ��ȸ("910524-1" ��������)
--SELECT EMP_NAME, SUBSTR(EMP_NO, 1, 8)
--SELECT EMP_NAME, SUBSTR(EMP_NO, 1, 8) || '*******'
SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*')
FROM EMPLOYEE;

--------------------------------------------------------------------------------
/*
    *LTRIM / RTRIM
    ���ڿ����� Ư�� ���ڸ� ������ �������� ��ȯ
    LTRIM/RTRIM(STRING, [�����ϰ����ϴ� ���ڵ�])
    
    ���ڿ��� ���� Ȥ�� �����ʿ��� �����ϰ����ϴ� ���ڵ��� ã�Ƽ� ������ ������ ���ڿ��� ��ȯ    
*/

SELECT LTRIM('    K  H') FROM DUAL; -- �տ������� �ٸ����ڰ� ���ö� ������ ��������
SELECT LTRIM('123123KH123', '123') FROM DUAL;
SELECT LTRIM('ACABACCKH', 'ABC') FROM DUAL; -- �����ϰ����ϴ� ���ڴ� ���ڿ��̾ƴ� ���ڵ�!
SELECT RTRIM('574185KH123', '0123456789') FROM DUAL;

/*
    *TRIM
    ���ڿ��� ��/��/���ʿ� �ִ� ������ ���ڵ��� ������ ������ ���ڿ� ��ȯ
    TRIM([LEADING | TRAILING | BOTH] �����ϰ����ϴ� ���ڿ� FROM ���ڿ�)
*/

SELECT TRIM('      K   H    ') FROM DUAL; -- ���ʿ��ִ� ������ ����
SELECT TRIM('Z' FROM 'ZZZZKHZZZZZZZZ') FROM DUAL; -- ���ʿ��ִ� Ư������ ����

SELECT TRIM(LEADING 'Z' FROM 'ZZZZKHZZZZZZZZ') FROM DUAL; -- LTRIM������ ���
SELECT TRIM(TRAILING 'Z' FROM 'ZZZZKHZZZZZZZZ') FROM DUAL; -- RTRIM������ ���
SELECT TRIM(BOTH 'Z' FROM 'ZZZZKHZZZZZZZZ') FROM DUAL; -- ���ʿ��ִ� Ư������ ����

--------------------------------------------------------------------------
/*
    *LOWER / UPPER / INITCAP
    
    LOWER : �� �ҹ��ڷ� ������ ���ڿ� ��ȯ
    UPPER : �� �빮�ڷ� ������ ���ڿ� ��ȯ
    INITCAP : ���� ���� ù ���ڸ��� �빮�ڷ� ������ ���ڿ� ��ȯ
*/
SELECT LOWER('Welcome To My World!') FROM DUAL;
SELECT UPPER('Welcome To My World!') FROM DUAL;
SELECT INITCAP('welcome to my world!') FROM DUAL;

-------------------------------------------------------------------------------

/*
    *CONCAT
    ���ڿ� �ΰ� ���޹޾� �ϳ��� ��ģ �� ��ȯ
    CONCAT(STRING1, STRING2)
*/

SELECT CONCAT('������', 'ABC') FROM DUAL; -- �ΰ��� ���ڿ��� ����
SELECT '������' || 'ABC' FROM DUAL;

--------------------------------------------------------------------

/*
    *REPLACE
    Ư�����ڿ����� Ư���κ��� �ٸ��κ����� ��ü
    REPLACE(���ڿ�, ã�� ���ڿ�, �����ҹ��ڿ�)
*/
SELECT EMAIL, REPLACE(EMAIL, 'KH.or.kr', 'gmail.com')
FROM EMPLOYEE;

--------------------------------------------------------------------------------------
/*
    <���� ó�� �Լ�>
    
    *ABS
    ������ ���밪�� �����ִ� �Լ�
*/

SELECT ABS(-10), ABS(-6.3) FROM DUAL;

----------------------------------------------------------------------------------------

/*
    *MOD
    �� ���� ���� ���������� ��ȯ
    MOD(NUMBER, NUMBER)
*/

SELECT MOD(10, 3) FROM DUAL;
SELECT MOD(10.9, 3) FROM DUAL;

--------------------------------------------------------------------------------

/*
    *ROUND
    �ݿø��� ����� ��ȯ
    
    ROUND(NUMBER, [��ġ])
*/

SELECT ROUND(123.456, 0) FROM DUAL; -- �⺻�ڸ����� �Ҽ��� ù��° �ڸ����� �ݿø� : 0
SELECT ROUND(123.456, 1) FROM DUAL; -- ����� ������ ���� �Ҽ����ڷ� ��ĭ�� �̵�
SELECT ROUND(123.456, -1) FROM DUAL; -- ������ ������ ���� �Ҽ��� ���ڸ��� �̵�

-----------------------------QUIZ------------------------------------------
--�˻��ϰ��� �ϴ� ����
--JOB_CODE�� J7�̰ų� J6�̸鼭 SALARY���� 200���� �̻��̰�
--BONUS�� �ְ� �����̸� �̸����ּҴ� _�տ� 3���ڸ� �ִ� �����
--�̸�, �ֹε�Ϲ�ȣ, �����ڵ�, �μ��ڵ�, �޿�, ���ʽ��� ��ȸ�ϰ�ʹ�.
--���������� ��ȸ�Ǹ� ����� 2��

SELECT EMP_NAME, EMP_NO, JOB_CODE, DEPT_CODE, SALARY, BONUS
FROM EMPLOYEE
WHERE (JOB_CODE = 'J7' OR JOB_CODE = 'J6') AND SALARY >= 2000000
      AND EMAIL LIKE '___\_%' ESCAPE '\' AND
      BONUS IS NOT NULL AND SUBSTR(EMP_NO, 8, 1) IN ('2','4');
--�� SQL������ ����� ���ϴ� ����� ������ �ʴ´�
-- � ������ �ִ��� ������ �����ϰ�, ��ġ�� �ڵ带 �ۼ��ϼ���.

/*
    *ROUND
    �ݿø��� ����� ��ȯ
    
    ROUND(NUMBER, [��ġ])
*/
    
 --�⺻�ڸ����� �Ҽ��� ù��° �ڸ����� �ݿø�
 SELECT ROUND(123.123) FROM DUAL;
 --����� ������ ���� �Ҽ����ڷ� ��ĭ�� �̵�
 SELECT ROUND(123.123,1) FROM DUAL;
 --������ ������ ���� �Ҽ��� ���ڸ��� �̵�
SELECT ROUND(123.123,-2) FROM DUAL;
SELECT ROUND(15321.512,-2) FROM DUAL;
/*
    *CEIL
    �ø�ó���� ���� �Լ�
    
    [ǥ����]
    CEIL(NUMBER)
*/
SELECT CEIL(15.01) FROM DUAL;
SELECT CEIL(16.015)FROM DUAL;

/*
    FLOOR
    ����ó�� �Լ�
    
    [ǥ����]
    FLOOR(NUMBER)
*/
SELECT FLOOR(12.122) FROM DUAL;
SELECT FLOOR(14.002) FROM DUAL;

/*
    TRUNC
    ����ó�� �Լ�
    
    [ǥ����]
    TRUNC(NUMBER, [��ġ])
*/
SELECT TRUNC(123.952) FROM DUAL;
SELECT TRUNC(123.555,1) FROM DUAL; --123.5
SELECT ROUND(123.555,1) FROM DUAL;  --123.6
SELECT TRUNC(123.512,2) FROM DUAL;


-----------------------------------QUIZ---------------------------------------
--�˻��ϰ��� �ϴ� ����
--JOB_CODE�� J7�̰ų� J6�̸鼭 SALARY���� 200���� �̻��̰�
--BONUS�� �ְ� �����̸� �̸����ּҴ�_�տ� 3���ڸ� �ִ� �����
--�̸�, �ֹε�Ϲ�ȣ, �����ڵ�, �μ��ڵ�, �޿�, ���ʽ��� ��ȸ�ϰ�ʹ�.
--���������� ��ȸ�Ǹ� ����� 2��

SELECT EMP_NAME, EMP_NO,JOB_CODE,DEPT_CODE,SALARY,BONUS
FROM EMPLOYEE
WHERE (JOB_CODE='J7' OR JOB_CODE='J6') AND SALARY>=2000000 AND
BONUS IS NOT NULL AND SUBSTR(EMP_NO,8,1) IN ('2','4') AND EMAIL LIKE '___\_%' ESCAPE '\';


--SELECT EMP_NAME,EMP_NO,JOB_CODE,DEPT_CODE,SALARY,BONUS
--FROM EMPLOYEE
--WHERE(JOB_CODE='J7' OR JOB_CODE='J6')AND SALARY>=2000000 AND 
--EMAIL LIKE '___\_%' ESCAPE '\' AND BONUS IS NOT NULL AND 
--SUBSTR(EMP_NO,8,1) IN('2','4');
--�� SQL������ ����� ���ϴ� ����� ������ �ʴ´�
-- � ������ �ִ��� ������ �����ϰ�, ������ �ڵ带 �ۼ��ϼ���.
--����.

---============================================================================

/*
    <��¥ ó�� �Լ�>
*/

--*SYSDATE : �ý����� ���� ��¥ �� �ð��� ��ȯ
SELECT SYSDATE FROM DUAL;

-- *MONTHS_BETWEEN : �� ��¥ ������ ���� ��
-- ������� �����, �Ի���, �ٹ��� ��, �ٹ����� ���� ��ȸ

SELECT EMP_NAME, HIRE_DATE, TRUNC(SYSDATE-HIRE_DATE), ROUND(MONTHS_BETWEEN(SYSDATE,HIRE_DATE))
FROM EMPLOYEE;
--12431
SELECT EMP_NAME, HIRE_DATE, TRUNC(SYSDATE-HIRE_DATE) AS "�ٹ���_��",
    CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS �ٹ�����_��
FROM EMPLOYEE;


-- *ADD_MONTHS : Ư�� ��¥�� NUMBER���� ���� ���ؼ� ��ȯ
SELECT ADD_MONTHS(SYSDATE,4) FROM DUAL;
SELECT SYSDATE FROM DUAL;
--�ٷ��� ���̺��� �����, �Ի���, �Ի��� 3������ ��¥ ��ȸ(������ ��ȯ��)
SELECT EMP_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE,3) AS ������_��ȯ��
FROM EMPLOYEE;

--*NEXT_DAY(DATE, ����(���� | ����)) : Ư����¥ ���� ���� ����� ������ ��¥�� ��ȯ
SELECT NEXT_DAY(SYSDATE,'�����') FROM DUAL;
SELECT NEXT_DAY(SYSDATE,2) FROM DUAL;

-- 1: ��, 2:�� ... 7:��
SELECT NEXT_DAY(SYSDATE, 'FRIDAY') FROM DUAL; --����

--����
ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
ALTER SESSION SET NLS_LANGUAGE = KOREAN;


-- *LAST_DAY(DATE) : �ش���� ������ ��¥ ���ؼ� ��ȯ
SELECT LAST_DAY(SYSDATE) FROM DUAL;


-- ������̺��� �����,�Ի���, �Ի���� ����������, �Ի���� �ٹ��ϼ� ��ȸ
SELECT EMP_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE), LAST_DAY(HIRE_DATE)-HIRE_DATE
FROM EMPLOYEE;

/*
    *EXTRACT : Ư�� ��¥�κ��� �⵵|��|�� ���� �����ؼ� ��ȯ�ϴ� �Լ�
    
    [ǥ����]
    EXTRACT(YEAR FROM DATE) : ������ ����
    EXTRACT(MONTH FROM DATE) : ���� ����
    EXTRACT(DAY FROM DATE) : �ϸ� ����
    => ����� NUMBER    
*/

--����� �����, �Ի�⵵, �Ի��, �Ի��� ��ȸ �Ի�⵵ �Ի�� �Ի� �� ���� ��������
SELECT EMP_NAME, EXTRACT(YEAR FROM HIRE_DATE)AS �Ի�⵵ ,EXTRACT (MONTH FROM HIRE_DATE) AS �Ի��
, EXTRACT(DAY FROM HIRE_DATE) AS �Ի���
FROM EMPLOYEE
ORDER BY 2,3,4;
--=================================================================
/*
    [����ȯ �Լ�]
    *TO_CHAR : ���� Ÿ�� �Ǵ� ��¥ Ÿ���� ���� ����Ÿ������ ��ȯ�����ִ� �Լ�
    
    [ǥ����]
    TO_CHAR(����|��¥, [����])
*/

-- ����Ÿ�� -> ����Ÿ��
SELECT TO_CHAR(1234) FROM DUAL;
SELECT TO_CHAR(1234,'999999999') AS "NUMBER" FROM DUAL; --���� Ȯ��, ������ ����, ��ĭ ����ó��
SELECT TO_CHAR(1234,'000000000') AS "NUMBER" FROM DUAL; --0�� �ڸ� ����ŭ ���� Ȯ��, ������ ����,��ĭ 0���� ä��
SELECT TO_CHAR(1234,'L9999') FROM DUAL;
SELECT TO_CHAR(3500000,'L999,9999') FROM DUAL;
--������� �����, ����, ������ ��ȸ 35,000,000���� ǥ��
SELECT EMP_NAME, TO_CHAR(SALARY,'L99,999,999'), TO_CHAR(SALARY *12,'L999,999,999') AS ����
FROM EMPLOYEE;

--��¥Ÿ�� => ����Ÿ��
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE) FROM DUAL;
SELECT TO_CHAR(SYSDATE,'HH:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'PM HH:MI:SS')FROM DUAL;
SELECT TO_CHAR(SYSDATE,'HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD DAY DY') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'MON,YYYY') FROM DUAL;
--������� �̸�, �Ի糯¥ (0000�� 00�� 00��) ��ȸ
SELECT EMP_NAME, TO_CHAR(HIRE_DATE,'YYYY"��" MM"��" DD"��"')
FROM EMPLOYEE;

--�⵵�� ���õ� ����
SELECT TO_CHAR(SYSDATE,'YYYY'),
    TO_CHAR(SYSDATE,'YY'),
    TO_CHAR(SYSDATE,'RR'),
    TO_CHAR(SYSDATE,'RRRR')
FROM DUAL;

SELECT HIRE_DATE,TO_CHAR(HIRE_DATE,'YYYY'), TO_CHAR(HIRE_DATE,'RRRR')
FROM EMPLOYEE;

--���� ���õ� ���� MM,MON,MONTH
SELECT TO_CHAR(SYSDATE,'MM'),
    TO_CHAR(SYSDATE,'MON'), --2��
    TO_CHAR(SYSDATE,'MONTH') --2��
    FROM EMPLOYEE;


-- �Ͽ� ���õ� ����
SELECT TO_CHAR(SYSDATE,'DDD'),
    TO_CHAR(SYSDATE,'DD'),
    TO_CHAR(SYSDATE,'D') --����->����
    FROM DUAL;


-- ���Ͽ� ���� ����
SELECT TO_CHAR(SYSDATE, 'DAY'), --������
    TO_CHAR(SYSDATE,'DY') --��
    FROM DUAL;
    
SELECT TO_CHAR(SYSDATE,'YYYY'),TO_CHAR(SYSDATE,'MM'),
    TO_CHAR(SYSDATE,'DDD'),TO_CHAR(SYSDATE,'DAY')
    FROM DUAL;  --2024 02 050 ������

--���� ��¥�� 24(�⵵), 02(��), �� �������� ���ݱ��� �ϼ�, ~���� ���������ض�
SELECT TO_CHAR(SYSDATE,'YY'), TO_CHAR(SYSDATE,'MM'),TO_CHAR(SYSDATE,'DDD'),TO_CHAR(SYSDATE,'DAY')
FROM DUAL;
--==============================================================================

/*
    TO_DATE : ����Ÿ�� �Ǵ� ����Ÿ���� ��¥Ÿ������ �����ϴ� �Լ�
    
    TO_DATE(���� | ����, [����]) -> DATE
*/
SELECT TO_DATE(20100101)FROM DUAL;-- 10/01/01
 --50�� �̸��� �ڵ����� 20XX���� ���� 50�� �̻��� 19XX�� �����ȴ�.
SELECT TO_DATE(250901) FROM DUAL; --25/09/01
SELECT TO_DATE(020505) FROM DUAL; --���ڴ� 0���� �����ϸ�ȵ� ����
-- ���ڴ� 0���� �����ϸ� �ȵ�

SELECT TO_DATE('020505') FROM DUAL; --02/05.05
--SELECT TO_DATE('20240219 120800') FROM DUAL; --������ ������� ��, ��, �ʸ� ǥ���� �� �ִ�. 
SELECT TO_DATE('20240219 120800') FROM DUAL; --����
SELECT TO_DATE('20240219 120800','YYYYMMDD HHMISS') FROM DUAL; --24/02/19

--==============================================================================

/*
    TO_NUMBER : ����Ÿ���� �����͸� ����Ÿ������ ��ȯ�����ִ� �Լ�
    
    [ǥ����]
    TO_NUMBER(����,[����])
*/
--5123456789���
SELECT TO_NUMBER('05123456789') FROM DUAL;
 --155000�ڵ� ����ȯ
SELECT TO_NUMBER('100000'+'15000') FROM DUAL;
 --���� 55,000�� ���ڷ� �ν�

 
SELECT TO_NUMBER('100,000,000','999,999,999')+TO_NUMBER('150,000','999,999') FROM DUAL;


--==============================================================================

/*
    [NULL ó�� �Լ�]
*/
--*NVL(�÷�, �ش��÷��� NULL�� ��� ������ ��)
SELECT NVL(BONUS,0)
FROM EMPLOYEE;

--������� �̸�, ���ʽ����� ����
SELECT EMP_NAME, (SALARY+(SALARY* NVL(BONUS,0)))*12
FROM EMPLOYEE;
--NVL2(�÷�, ��ȯ��1, ��ȯ��2)
-- ��ȯ�� 1 : �ش��÷��� ������ ��� ������ ��
-- ��ȯ�� 2 : �ش��÷��� NULL�� ��� ������ ��
SELECT EMP_NAME,BONUS, NVL2(BONUS,'O','X') --������O,NULL�Ͻ� X
FROM EMPLOYEE;

--������� ������ �μ���ġ����(�����Ϸ� �Ǵ� �̹��� ǥ��) ��ȸ
SELECT EMP_NAME, NVL2(DEPT_CODE,'�����Ϸ�',1)
FROM EMPLOYEE;

--*NULLIF(�񱳴��1, �񱳴��2)
--�� ���� ��ġ�ϸ� NULL ��ġ���� �ʴ´ٸ� �񱳴��1 ��ȯ
SELECT NULLIF('123','123')FROM DUAL; --NULL
SELECT NULLIF('123','12') FROM DUAL; --123

------------------------------------------------------------------------------

/*
    [�����Լ�]
    *DECODE(���ϰ����ϴ� ���(�÷�, �����, �Լ���), �񱳰�1,�����1, �񱳰�2,�����2, �񱳰�3,�����3,..., �����1, �����2, �����3 ...)
    
    SWITCH(�񱳴��){
    CASE �񱳰�1:
        �����ڵ�
    CASE �񱳰�2:
        �����ڵ�
    ...    
    }
*/

--���, �����, �ֹι�ȣ, ���� ��ȸ
SELECT EMP_ID, EMP_NAME, EMP_NO, DECODE(SUBSTR(EMP_NO,8,1),1,'��',2,'��')
FROM EMPLOYEE;

--������ ����, �����޿�, �λ�� �޿� ��ȸ
--J7�� ����� �޿��� 10%�λ�(SALARY *1.1)
--J6�� ����� �޿��� 15%�λ�(SALARY *1.5)
--J5�� ����� �޿��� 15%�λ�(SALARY *1.2)
--�׿� �� ����� �޿��� 5%�λ�(SALARY *1.05)
SELECT EMP_NAME, SALARY AS �����޿�, JOB_CODE, 
    DECODE(JOB_CODE,'J7',SALARY *1.1,
        'J6',SALARY *1.5,
        'J5',SALARY * 1.2,
        SALARY *1.05) AS �λ��_�޿�
FROM EMPLOYEE;

/*
    *CASE WHEN THEN
    
    CASE 
        WHEN ���ǽ�1 THEN �����1
        WHEN ���ǽ�2 THEN �����2
        ...
        ELSE ��� ��
    END
*/
--���� �̸�, �޿�, ���( �޿��� 5000000�̻��̸� ���, 3500000 �߱� �����ϴ� �ʱ�)�� ��ȸ
SELECT EMP_NAME, SALARY,
    CASE WHEN SALARY >= 5000000 THEN '���'
    WHEN SALARY >=3500000 THEN '�߱�'
    ELSE '�ʱ�'
    END AS ���
    FROM EMPLOYEE;
    


------------------�׷��Լ�---------------------------------------------------

--1. SUM(����Ÿ���÷�) : �ش��÷� ������ �� �հ踦 ���ؼ� ��ȯ���ִ� �Լ�
SELECT SUM(SALARY)
FROM EMPLOYEE;

--�ٷ������̺��� ������� �� �޿��� ���ض�
SELECT SUM(SALARY)
FROM EMPLOYEE;

--���ڻ������ �� �޿���
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN('1','3');

--�μ��ڵ尡 D5�� ������� �� ����(�޿� * 12)
SELECT SUM(SALARY * 12)
FROM EMPLOYEE
WHERE DEPT_CODE ='D5';

--2. AVG(NUMBER) : �ش� �÷� ������ ��� ���� ���ؼ� ��ȯ
SELECT ROUND(AVG(SALARY))
FROM EMPLOYEE;

--3. MIN(���Ÿ�԰���) : �ش��÷��� �� ���� ���� �� ���ؼ� ��ȯ
--�̸�, �޿�, �Ի����� �ּҰ����� ��ȯ
SELECT MIN(EMP_NAME), MIN(SALARY),MIN(HIRE_DATE)
FROM EMPLOYEE;

--4. MAX(��� Ÿ�� ����) : �ش� �÷����� �߿� ���� ū ���� ���ؼ� ��ȯ
SELECT MAX(EMP_NAME), MAX(SALARY),MAX(HIRE_DATE)
FROM EMPLOYEE;

--5. COUNT(* | �÷� | DISTINCT �÷�) : �ش� ���ǿ� �´� ������ ������ ���� ��ȯ
-- COUNT(*) : ��ȸ�� ����� ��� ���� ������ ���� ��ȯ
-- COUNT(�÷�) : ������ �ش� �÷����� NULL�� �ƴ� �͸� ������ ������ ���� ��ȯ
-- COUNT(DISTINCT �÷�) : �ش� �÷��� �ߺ��� �����ϳ� �� ���� ���� ���� ��ȯ

--��ü ��� ��
SELECT COUNT(*)
FROM EMPLOYEE;

--���� ��ü ��� �� ��ȯ
SELECT COUNT(*)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN ('2','4');

--���ʽ��� �޴� ��� ��
SELECT COUNT(BONUS)
FROM EMPLOYEE;
--OR
SELECT COUNT(*)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;


--�μ���ġ�� ���� ��� ��
SELECT COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL;

--���� ������� �� ��� �μ��� �����Ǿ� �ִ��� ��ȸ
SELECT COUNT(DISTINCT DEPT_CODE)
FROM EMPLOYEE;

/*
    <GROUP BY��>
    �׷������ ������ �� �ִ� ����(�ش� �׷���غ��� ���� �׷����� ���� �� ����)
    �������� ������ �ϳ��� �׷����� ��� ó���ϴ� �������� ���
*/

 -- ��ü����� �ϳ��� �׷����� ��� �޿� �� ���� ���� ���
SELECT SUM(SALARY)
FROM EMPLOYEE;

-- �� �μ��� �� �޿�
-- �� �μ����� ���� �׷�
SELECT DEPT_CODE,SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

--�� �μ��� �����
SELECT DEPT_CODE,COUNT(DEPT_CODE),SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- �� ���޺� �ѻ�� ��, ���ʽ��� �޴� ��� ��, �޿���, ��ձ޿�, �����޿�, �ְ�޿�(���� : ���� ��������)
SELECT COUNT(DEPT_CODE) AS ���޺�_�ѻ��_��,COUNT(BONUS) AS ���_��,SUM(SALARY) AS �޿�_��,
   ROUND( AVG(SALARY)) AS ��ձ޿�, MIN(SALARY)AS �����޿�, MAX(SALARY) AS �ְ�޿�
    FROM EMPLOYEE
    GROUP BY DEPT_CODE
    ORDER BY DEPT_CODE;

--GROUP BY ���� �Լ��� ��� ����


--GROUP BY���� ���� �÷� ���


---------------------------------------------------------------------------------------
/*
    [HAVING ��]
    �׷쿡 ���� ������ ������ �� ���Ǵ� ����(�ַ� �׷��Լ����� ������ ������ ����)
*/
--�� �μ��� ��� �޿� ��ȸ(�μ��ڵ�, ��ձ޿�)


-- �� �μ��� ��� �޿��� 300���� �̻��� �μ��鸸 ��ȸ(�μ��ڵ� ��ձ޿�)



--============================================================================
--���޺� �����ڵ�, �� �޿���(��, ���޺� �޿����� 1000���� �̻��� ���޸� ��ȸ)


--�μ��� ���ʽ��� �޴� ����� ���� �μ��� �μ��ڵ�




