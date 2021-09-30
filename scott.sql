--SQL은 대소문자 구별 안함

-- scott 계정에 존재하는 모든 테이블을 조회
SELECT *
FROM tab;
-- 조회는 SELECT로 시작 무조건 암기
--delete 무조건
--update 외워야
--insert 하는 것 들
--DBMS를 사용하기 위해 ORCLE 다운(18Ex)
--SQL 쿼리문 실행 => SQL Plus

--SQL Developer, 오렌지, 토드.... => 에디터

-- 조회(SELECT) : 행 단위로 조회, 열 단위로 조회
--emp 테이블의 내용을 전체조회
SELECT
    * FROM emp;
    
--    emp 테이블의 empno, ename, job만 조회
SELECT
 empno, ename, job FROM emp;
 
-- emp 테이블의 empno, deptno 조회
SELECT
    empno, deptno FROM emp;
    
--    중복을 제거 후 조회 : distinct
SELECT DISTINCT deptno FROM emp;

-- 별칭을 붙여서 조회 : AS(alais)
SELECT EMPNO AS 사원번호 FROM emp;

SELECT ename AS 사원명,job AS "직 책",sal AS 급여,comm AS 추가수당,sal*12+comm AS 연봉 FROM emp;
    
    

