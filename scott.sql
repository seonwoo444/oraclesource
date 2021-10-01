-- DDL()
-- 실행하면 반영됨

-- create(생성), alter(변경), drop(삭제)

-- create table 테이블이름(
--              필드명1 자료형,
--              필드명2 자료형,
--)

--  테이블 이름 규칙
-- 문자로 시작
--  같은 사용자 안에서 동일한 테이블 명 사용 불가
-- sql 키워드는 테이블 이름으로 사용 불가

-- 필드명 생성 규칙
-- 문자로 시작
-- 열 이름은 중복되면 안됨
-- sql 키워드 사용불가
                        
-- 자료형 : 숫자 number, 가변문자 varchar2, 날짜 date
                        
                        
create table emp_ddl(
 EMPNO NUMBER(4),-- 숫자로 4자리 허용
 ENAME VARCHAR2(10),
 JOB VARCHAR2(9),
 MGR NUMBER(4),
 HIREDATE date,
 SAL NUMBER(7,2),
 COMM NUMBER(7,2),
 DEPTNO NUMBER(7)
);

DESC EMP_DDL;

DROP TABLE EMP_DDL;

-- 구조+데이터 이용하여 생성
CREATE TABLE DEPT_DDL AS SELECT * FROM DEPT;
CREATE TABLE DEPT_DDL_30 AS SELECT * FROM DEPT WHERE DEPTNO = 30;

-- 다른 테이블에 구조만 복사하여 세 테이블 생성
CREATE TABLE DEPT_DDL2 AS SELECT * FROM DEPT WHERE 1<>1;

-- ALTER
-- 이미 생성된 객체를 변경

CREATE TABLE EMP_ALTER AS SELECT
    * FROM EMP;
    
--    새로운 컬럼(열) 추가 : ADD
DESC EMP_ALTER;

ALTER TABLE EMP_ALTER ADD HP VARCHAR2(20);
DESC EMP_ALTER;
SELECT * FROM EMP_ALTER;

-- RENAME : 열 이름 변경
ALTER TABLE EMP_ALTER RENAME COLUMN HP TO HEL;

-- MODIFY : 열의 자료형을 변경

ALTER TABLE EMP_ALTER MODIFY EMPNO NUMBER(5);

-- DROP : 열 삭제

ALTER TABLE EMP_RENAME DROP COLUMN HEL;

-- 테이블 이름 변경

RENAME EMP_ALTER TO EMP_RENAME;
DESC EMP_RENAME;

-- 테이블 데이터를 삭제 TRUNCATE
SELECT * FROM EMP_RENAME;
TRUNCATE TABLE EMP_RENAME;

-- 실습1 MEMBER TABLE 만들기
CREATE TABLE member_test(
    ID CHAR(8),
    NAME VARCHAR(10),
    ADDR VARCHAR(50),
    NATION CHAR(4),
    EMAIL VARCHAR(50),
    AGE NUMBER(7,2)
);

DESC member_test;

-- MEMBER에 BIGO 열 추가
ALTER TABLE MEMBER_TEST ADD BIGO VARCHAR2(20);

-- BIGO 열 크기를 30으로 변경
ALTER TABLE MEMBER_TEST MODIFY BIGO VARCHAR2(30);

-- BIGO이름 변경
ALTER TABLE MEMBER_TEST RENAME COLUMN BIGO TO REMARK;
