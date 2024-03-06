-- 한 줄 주석
/*
가나다라
마바사
*/

SELECT * FROM DBA_USERS; -- 현재 모든 계정들에 대해서 조회하는 명령문
-- 명령문 실행 (위쪽의 재생 버튼 클릭 | CTRL + ENTER)

-- 일반 사용자 계정을 생성하는 구문 (오직 관리자 계정에서만 할 수 있다.)
-- [표현법] CREATE USER 계정명 IDENTIFIED BY 비밀번호;
CREATE USER KH IDENTIFIED BY KH;
--계정의 비밀번호는 대소문자를 구분한다.

-- 위에서 생성된 일반 사용자 계정에 최소한의 권한(접속, 데이터 관리) 부여
-- [표현법] GRANT 권한1, 권한2... TO 계정명;
GRANT RESOURCE, CONNECT TO KH;


CREATE USER wk IDENTIFIED BY wk;
GRANT RESOURCE, CONNECT TO wk;


CREATE VIEW VW_VV AS(
  SELECT STUDENT_NO, STUDENT_NAME,STUDENT_ADDRESS
    FROM TB_STUDENT
);

CREATE USER JDBC IDENTIFIED BY JDBC;
GRANT RESOURCE, CONNECT TO JDBC;