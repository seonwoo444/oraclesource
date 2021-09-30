-- 조회중 행의 이름을 한글로 칠 때
-- 문자열에 띄어쓰기를 하면 오류 그걸 위해 ""를 해주면 해결

--정렬 : ORDER BY 컬럼명 기준(오름차순(ASC), 내림차순(DESC))

--ename, sal 조회할 때 sal 내림차순으로 정렬해서 조회
SELECT
    ename, sal FROM emp ORDER BY sal DESC;
--    오름차순으로 조회(ASC 생략가능)
SELECT
    ename, sal FROM emp ORDER BY sal ASC;
SELECT
    ename, sal FROM emp ORDER BY sal;
    
--    EMP테이블의 전체 내용을 조회하고, 단 사원번호 내림차순 정렬
SELECT * FROM emp ORDER BY empno DESC;

--전체 내용 조회(부서번호 오름차순, 급여 내림차순)
SELECT
    * FROM emp ORDER BY deptno ASC, sal DESC;
    
--    1. emp 테이블 몬든 열 출력
SELECT * FROM emp;

--    2. 출력되는 열의 별칭을 다음과 같이 지정
SELECT empno AS EMPLOYEE_NO, ename AS EMPLOYEE_NAME, mgr AS MANAGER,
sal AS SALARY, comm AS COMMISSION, deptno AS DEPTARTMENT_NO, job, hiredate
FROM emp ORDER BY deptno DESC, ename ASC; 

--     3. 부서번호를 기준으로 내림차순으로 정렬, 부서 번호가 같다면 사원 이름을 기준을 오름차순
--SELECT * FROM emp ORDER BY deptno DESC, ename ASC;

--특정 조건을 기준으로 원하는 데이터를 조회 : WHERE

--전체 데이터 조회, 단, 부서번호가 30번인 데이터 조회
SELECT * FROM emp WHERE deptno = 30;

--사원 번호가 7782만 조회
SELECT * FROM emp WHERE empno = 7782;

--부서번호가 30번이고, 사원직책이 SALESMAN인 사원 조회
SELECT
    * FROM emp WHERE deptno = 30 AND job = 'SALESMAN';--문자열은 무저건 ''로
--    대소문자 구별은 비밀번호만 인정
SELECT
    * FROM emp WHERE deptno = 30 AND job = 'salesman';
--    쿼리문은 대소문자 구별이 없다
-- 사원번호가 7499이고 부서번호가 30인 사원 조회
SELECT * FROM emp WHERE empno=7499 AND deptno=30;

--부서번호가 30이거나 사원직책이 CLERK인 사원 조회
SELECT * FROM emp WHERE deptno = 30 OR job = 'CLERK';

--연봉이 36000인 사원 조회
SELECT * FROM emp WHERE sal *12 = 36000;

--월급이 3000보다 큰 사원 조회
SELECT * FROM emp WHERE sal > 3000;
--월급이 3000 이상인 사원 조회
SELECT * FROM emp WHERE sal >= 3000;

--이름의 첫 글자가 F 이후인 사원 조회
SELECT * FROM emp WHERE ename >= 'F';
--급여가 2500이상이고, 직업이 ANALYST인 사원 조회
SELECT * FROM emp WHERE sal >= 2500 AND job = 'ANALYST';
--직무가 SALESMAN 이거나, CLERK이거나, MANAGER인 사원 조회
SELECT * FROM emp WHERE job = 'SALESMAN' OR job = 'CLERK' OR job = 'MANAGER';
--등가비교연산자(같다 =) 같지않다 (!=, <>, ^=, NOT)
SELECT * FROM emp WHERE sal != 3000;
SELECT * FROM emp WHERE sal <> 3000;
SELECT * FROM emp WHERE sal ^= 3000;
SELECT * FROM emp WHERE NOT sal = 3000;

--IN 연산자
SELECT * FROM emp WHERE job IN ('SALESMAN','CLERK','MANAGER');
SELECT * FROM emp WHERE job NOT IN ('SALESMAN','CLERK','MANAGER');

--부서번호가 10,20번 사원 조회
SELECT * FROM emp WHERE deptno IN (10,20);

--BETWEEN A AND B 

--급여가 2000~3000 사이인 사원 조회
SELECT * FROM emp WHERE sal >= 2000 AND sal <=3000;
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 3000;

--사이가 아닌
SELECT * FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;

-- like 연산자와 와일드 카드
--일부 분자열이 포함된 데이터 조회
--와일드 카드
--1. % : 길이와 상관없이 모든 분자 데이터를 의미
--2. _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미


--사원명이 s로 시작하는 사원 조회
SELECT
    * FROM emp WHERE ename LIKE 'S%';
    
-- 사원명의 두번째 글자가 L인 사원 조회
    SELECT
        * FROM emp WHERE ename LIKE '_L%';
-- 사원명에 AM 문자가 포함되어 있는 사원 조회
SELECT
    * FROM emp WHERE ename LIKE '%AM%';
    -- 사원명에 AM 문자가 포함되어 있지 않는 사원 조회
    SELECT
    * FROM emp WHERE ename NOT LIKE '%AM%';
    
--    IS NULL
SELECT
    * FROM emp WHERE COMM IS NULL;
--    NULL은 0이 아닌 완전히  비어 있는 상태를 의미
-- MGR이 NULL 사우너 조회
SELECT * FROM emp WHERE MGR IS NULL;

--MGR이 NULL이 아닌 사원 조회
SELECT * FROM emp WHERE MGR IS NOT NULL;

--집합 연산자 : 합집합 UNION(중복 제거) , UNION ALL(중복값을 제거하지 않고 보여주는 것)
--            교집합 INTERSECT
--            차집합 MINUS

--EMPNO, ENAME, SAL, DEPNO 조회(부서번호가 10번이거나 20번인)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM emp
WHERE deptno = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM emp
WHERE deptno = 20;

--UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM emp
WHERE deptno = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM emp
WHERE deptno = 10;

--UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM emp
WHERE deptno = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM emp
WHERE deptno = 10;

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM emp
WHERE deptno = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
FROM emp
WHERE deptno = 20;

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM emp
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM emp
WHERE deptno = 10;

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM emp
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM emp
WHERE deptno = 10;

--오라클 함수

--내장함수 -1) 문자함수

--             대소문자 변경
--              UPPER(문자엵) : 괄호 안 문자를 모두 대문자로 변환
--              LOWER(문자엵) : 괄호 안 문자를 모두 소문자로 변환
--              INITCAP(문자엵) : 괄호 안 문자 중 첫글자만 대문자로 변환, 나머지 소문자

SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) FROM emp;

--ENAME이 SCOTT인 찾기
SELECT * FROM EMP WHERE LOWER(ename) = LOWER('scott');
SELECT * FROM EMP WHERE LOWER(ename) LIKE LOWER('%scott%');

--  문자 길이 구하기
--  LENGTH(문자열) : 해당 문자열의 길이 돌려줌
--  LENGTHB(문자열) : 해당 문자열의 바이트수 불러줌

SELECT ENAME, LENGTH(ENAME) FROM EMP;

--한글 한 자당 3byte 사용
--DUAL : 데이터베이스 관리자가 소유한 테이블 / 임시 연산이나 함수의 결과 값 확인 용도
SELECT LENGTH('한글'), LENGTHB('한글') FROM DUAL;

--JOB이 6글자 이상인 사원들 조회
SELECT * FROM emp WHERE LENGTH(job) >= 6;

-- 문자열 일부를 추출하기
--  SUBSTR(문자열 데이터, 시작위치, 추출길이)
--  SUBSTR(문자열 데이터, 시작위치) oracle은 index번호 1번부터 시작
SELECT job, SUBSTR(job,1,2), SUBSTR(job,3,2), SUBSTR(job,5) FROM emp;

--EMP 테이블의 모든 사원 이름을 세 번째 글자부터 끝까지 출력하기
SELECT ename, SUBSTR(ename, 3) FROM emp;

-- 문자열 데이터 안에서 특정 문자를 찾기
-- INSTR(문자열, 찾을 문자열, (시작위치, 몇번째에 있는걸 찾을 것인지 = 옵션)) 
 SELECT INSTR('HELLO, ORACLE', 'L'), 
 INSTR('HELLO, ORACLE','L',5), 
 INSTR('HELLO, ORACLE','L',2,2)
 FROM DUAL;

-- 원본 문자열 : 이것이 Oracle이다. 이것도 오라클이다.
--찾은 문자열 : 이것
SELECT INSTR('이것이 Oracle이다. 이것도 오라클이다', '이것') FROM DUAL;
--제일 처음에 나오는 이것의 위치를 찾기
SELECT INSTR('이것이 Oracle이다. 이것도 오라클이다','이것',1) FROM DUAL;
--시작 위치를 3으로 지정한 후 나오는 이것의 위치 찾기
SELECT INSTR('이것이 Oracle이다. 이것도 오라클이다','이것',3) FROM DUAL;
--이것이 두번째로 나오는 위치 찾기
SELECT INSTR('이것이 Oracle이다. 이것도 오라클이다','이것',1,2) FROM DUAL;

--사원 이름에 문자 S가 있는 사원 구하기
SELECT * FROM emp WHERE INSTR(ename, 'S')>0;
SELECT * FROM emp WHERE ename LIKE'%S%';

-- 특정 문자를 다른 문자로 바꾸는 함수
-- REPLACE(문자열 데이터 또는 열이름, 찾는 문자, 바꿀 문자)

-- 010-1232-5678 => 010 1234 5678, 01012345678
SELECT '010-1232-5678' AS 원본, REPLACE('010-1232-5678', '-', ' ') AS REPLACE1,
REPLACE('010-1232-5678','-') AS REPLACE2 FROM DUAL;

-- 두 문자열 데이터를 합치는 함수
-- CONCAT(문자열1, 문자열2)
--EMPNO, ENAME 합쳐서 조회
SELECT
    EMPNO, ENAME, CONCAT(EMPNO,ENAME) FROM emp WHERE ename = 'SCOTT';
    
--    7788:SCOTT
SELECT
    EMPNO, ENAME, CONCAT(EMPNO,CONCAT(' : ', ENAME)) FROM emp WHERE ename = 'SCOTT';

-- || : 문자열 데이터 연결 연산자
SELECT
    EMPNO || ENAME, EMPNO || ' : ' || ENAME FROM emp WHERE ename = 'SCOTT';


SELECT
    CEIL(3,14), FLOOR(-3,14), CEIL(-3,14) FROM dual;
    
    SELECT
        MOD(15,6), MOD(10,2), MOD(1,2) FROM dual;
        
        
--        날짜함수
-- SYSDATE : 오라클 데이터베이스 서버가 설치된 os의 현재 날짜와 시간
-- ADD_MONTHS : 몇개원 이후 날짜를 구하는 함수
        SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW FROM
        dual;

SELECT SYSDATE, ADD_MONTHS(SYSDATE,3) FROM dual;

--입사 20주년 되는 날짜 조회
SELECT
    ename, hiredate,ADD_MONTHS(hiredate,240) FROM emp;

--현재 날짜를 기준으로 입사 38년 미만인 사원 조회 456달
SELECT ename, hiredate FROM emp WHERE ADD_MONTHS(hiredate,480)>sysdate;

-- MONTHS_BETWEEN : 두 날짜 간의 개월 수 차이 구하기
SELECT
    empno, ename, hiredate, sysdate, MONTHS_BETWEEN(SYSDATE, hiredate) as month1,
   MONTHS_BETWEEN(hiredate,SYSDATE) as month2,
   trunc(MONTHS_BETWEEN(SYSDATE,hiredate)) as month3
   FROM emp;

-- next_day(날짜, 요일문자)
-- last_day(날짜)
SELECT
    sysdate, next_day(sysdate,'월요일'), last_day(sysdate) FROM dual;

-- 형변환 함수
-- TO_CHAR() : 숫자 또는 날짜 데이터를 문자 데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환
SELECT
    SYSDATE, TO_CHAR(SYSDATE,'YYYY/MM/DD') AS 현재날짜 FROM dual;

SELECT
    SYSDATE, TO_CHAR(SYSDATE,'MM') AS 현재월 FROM dual;

SELECT
    SYSDATE, TO_CHAR(SYSDATE,'MON') AS 현재월 FROM dual;

SELECT
    SYSDATE, TO_CHAR(SYSDATE,'HH:MI:SS') AS 현재시간 FROM dual;

SELECT
    SYSDATE, TO_CHAR(SYSDATE,'HH12:MI:SS PM') AS 현재시간 FROM dual;

SELECT
    SYSDATE, TO_CHAR(SYSDATE,'HH24:MI:SS') AS 현재시간 FROM dual;

SELECT SAL, TO_CHAR(SAL, '$999,999') AS SAL_$,
TO_CHAR(SAL, 'L999,999') AS SAL_L FROM emp;

SELECT TO_NUMBER('1,300','999,999') FROM dual;

SELECT TO_DATE('2021-09-12','YYYY-MM-DD') AS TODATE,
TO_DATE('20210912','YYYY-MM-DD') AS TODATE2 FROM dual;

--날짜 데이터는 연산이 가능하다
-- 1981-06-01 이후 입사자 조회
SELECT
    * FROM emp
    WHERE hiredate > TO_DATE('1981-06-01','YYYY-MM-DD');

-- L(LOCALE) : 지역화폐단위를 붙여서 출력
-- 9,0 : 숫자의 한 자리를 의미함(9는 빈자리를 채우지 않음, 0 빈자리를 )
SELECT SAL,
TO_CHAR(SAL, '$999,999') AS SAL_$,
TO_CHAR(SAL, 'L000,000') AS SAL_$2,
TO_CHAR(SAL, 'L999,999') AS SAL_L
FROM emp;

-- 널처리 함수
-- NVL(NULL이면 반환할 값, 데이터)
SELECT empno, ename, sal, comm, sal+comm
from emp;

SELECT empno, ename, sal, comm, sal+comm, nvl(comm,0), SAL+NVL(comm,0)
from emp;

-- NVL2(NULL이면 반환할 값, 데이터, NULL이 아닐경우 반환할 값)
SELECT empno, ename, sal, comm, NVL2(COMM,'0','X'), NVL2(COMM,SAL+12+COMM, SAL+12) FROM emp;


-- decode 함수
--DECODE([검사 대상이 될 열 또는 데이터], [조건1],[데이터가 조건 1과 일치할 때 반환할 결과],
--                                   [조건2],[데이터가 조건 2와 일치할 때 반환할 결과],
--                                                  .......
--                                                                              )

-- job_id에 따라서 급여의 비율 설정
SELECT 
empno,
ename,
job,
sal,
decode(job, 'MANAGER', SAL * 1.1, 'SALESMAN', sal * 1.05,
'ANALAYST', sal, sal * 1.03) AS upsal 
FROM emp;

-- CASE : DECODE 문으로 작성할 수 있는 것들은 모두 변환 가능
-- =의 의미로 사용되지만 다른 저건도 가능하다
SELECT 
empno,
ename,
job,
sal,
CASE job
WHEN 'MANAGER' THEN SAL * 1.1 
WHEN 'SALESMAN' THEN sal * 1.05
WHEN 'ANALAYST' THEN sal
ELSE sal * 1.03 END AS upsal 
FROM emp;

-- COMM이 널이면 '해당사항 없음', 0이면 '수당없음', 0보다 크면 '수당 : 2500' 출력
SELECT empno, ename, comm,
case 
WHEN comm is null THEN '해당사항 없음'
WHEN comm = 0 THEN '수당없음'
WHEN comm > 0 THEN '수당 : ' || comm
END AS COMM_TEXT FROM emp;

-- 실습
SELECT 
EMPNO,
ENAME,
SAL,
TRUNC(SAL/21.5,2) AS DAY_PAY,
ROUND(SAL/21.5/8,1) AS TIME_PAY
FROM emp;

-- 실습2
SELECT
empno,
ename,
hiredate,
next_day(add_MONTHS(hiredate,3),'월요일') AS R_JOB,
nvl(TO_CHAR(comm), 'N/A')
FROM emp;

SELECT comm, nvl(comm, 0)  FROM emp;
SELECT comm, nvl(comm, '0')  FROM emp;
SELECT comm, nvl(TO_CHAR(comm), 'N/A')  FROM emp;

-- 실습3
SELECT
     empno,
     ename,
     mgr,
    decode(SUBSTR(TO_CHAR(MGR),1,2), null, '0000', '75', '5555', '76', '6666',
    '77', '7777', '78', '8888', TO_CHAR(MGR)) AS CHG_MGR
     FROM emp;
    
--CASE
SELECT
     empno,
     ename,
     mgr,
    CASE WHEN MGR IS null THEN '0000'
    WHEN SUBSTR(TO_CHAR(MGR),1,2)='75' THEN '5555' -- WHEN MGR LIKE '75%' THEN '5555' 로 변환O
    WHEN SUBSTR(TO_CHAR(MGR),1,2)='76' THEN '6666'
    WHEN SUBSTR(TO_CHAR(MGR),1,2)='77' THEN '7777'
    WHEN SUBSTR(TO_CHAR(MGR),1,2)='78' THEN '8888'
    ELSE TO_CHAR(MGR) END AS CHG_MGR
     FROM emp;

-- 다중행 함수: SUM(), COUNT(), MAX(), MIN(), AVG()
SELECT SUM(sal) FROM emp;

-- EMP 테이블의 데이터 개수 조회
select count(*) FROM emp;

SELECT count(empno) FROM emp;


--부서 번호가 10번인 사원의 최대 급여
SELECT MAX(SAL) FROM emp WHERE DEPTNO = 10;
--부서 번호가 10번인 사원의 최소 급여
SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 10;
--부서 번호가 20번인 사원 중에서 제일 오래된 입사일 조회
SELECT MIN(HIREDATE) FROM EMP WHERE DEPTNO = 20;
--부서 번호가 30번인 사원의 평균 급여 조회
SELECT AVG(DISTINCT SAL) FROM EMP WHERE DEPTNO = 30;

-- GROUP BY 그룹화할 열 지정(여러개 지정 가능)

-- 부서별 급여의 합 조회
SELECT SUM(SAL),deptno
FROM emp
GROUP BY DEPTNO
ORDER BY DEPTNO;

--부서별 급여 평균 조회
SELECT AVG(SAL),deptno
FROM emp
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- 부서별, 직무별 급여 평균 조회
SELECT AVG(SAL),DEPTNO,JOB
FROM emp
GROUP BY deptno, JOB
ORDER BY DEPTNO, JOB;

--GROUP BY ~ HAVING

-- 부서별 직무별 급여 평균 조회(단, 급여 평균 2000 이상)
SELECT DEPTNO, JOB, AVG(SAL)
FROM emp
WHERE AVG(SAL) >= 2000 -- WHERE절 뒤 그룹 함수 허가X
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

SELECT DEPTNO, JOB, AVG(SAL)
FROM emp
GROUP BY DEPTNO, JOB HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

SELECT DEPTNO, JOB, AVG(SAL)
FROM emp
WHERE SAL <= 3000 -- 1. 출력 대상이 되는 행 제한
GROUP BY DEPTNO, JOB HAVING AVG(SAL) >=2000 --2. 그룹화한 행 제한
ORDER BY DEPTNO, JOB;

-- 실습
SELECT DEPTNO,
TRUNC(AVG(SAL)),
MAX(SAL),
MIN(SAL),
COUNT(deptno)
FROM emp
GROUP BY DEPTNO
ORDER BY DEPTNO DESC;

-- 실습
SELECT 
JOB, 
COUNT(*)
FROM emp
GROUP BY JOB HAVING COUNT(JOB) >= 3;

--실습
SELECT TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT
FROM emp
GROUP BY TO_CHAR(HIREDATE,'YYYY'), DEPTNO;

-- 데이터 삽입, 삭제, 수정 : 

--실습용 테이블 생성
create table dept_temp as select * from dept;

select * from dept_temp;

-- insert : 데이터 삽입
-- insert into 테이블명(필드명..) values(값1,값2....)
-- insert into 테이블명 values(값1,값2...)

insert into dept_temp(deptno, dname, loc) values(50,'DATEBASE','SEOUL');

insert into dept_temp values(60,'NETWORK','BUSAN');

insert into dept_temp(dname, loc, DEPTNO) values('NETWORK','BUSAN',70); -- 수치가 부적합

--insert into dept_temp(dname, loc, DEPTNO) values('NETWORK','BUSAN',500);
--ORA-01438: 이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.

-- 특정부분 삽인 불이행시 null 값으로 (null 삽입 방법)
-- 아예 값을 지정하지 않음
insert into dept_temp(deptno, dname) values(50,'DATEBASE');
-- 직접 값을 입력
insert into dept_temp(deptno, dname, loc) values(50,'WEB',null);
insert into dept_temp(deptno, dname, loc) values(93,'MOVILE', null);

commit;

-- 실습용 테이블 생성
create table emp_temp as select * from emp where 1<>1;

select * from emp_temp;

desc emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(1111,'홍길동','manager',null,'2021-09-27',4000,null,10);

insert into emp_temp
values(2222,'성춘향','manager',null,sysdate,4000,null,10);

commit;

-- updater : 수정
-- UPDATER 테이블명 SET 변경할 열 = 변경할 값, 변경할 열 = 변경할 값.....
-- UPDATER 테이블명 SET 변경할 열 = 변경할 값, 변경할 열 = 변경할 값.....WHERE 수정할 조건

SELECT * FROM dept_temp;

UPDATE dept_temp
SET LOC = 'SEOUL'
WHERE DEPTNO = 93;

UPDATE dept_temp
SET LOC = 'BUSAN'
WHERE DEPTNO = 50;

COMMIT;


SELECT * FROM emp_temp;

-- sal이 4000 이하인 사원만 수당을 50으로 변경
UPDATE emp_temp
SET comm = 50
WHERE sal <= 4000;

commit;

UPDATE emp_temp
set sal =6500
where empno = 1111;




UPDATE emp_temp
SET comm = 100;

ROLLBACK;

COMMIT;

-- DELETE : 삭제
-- DELETE 테이블명 WHERE 삭제할 데이터 조건
-- DELETE FROM(옵션 삭제 가능) 테이블명 ...

create table emp_temp2 as select * from emp;

SELECT * FROM emp_temp2;

-- JOB이 MANAGER인 사원 삭제
DELETE emp_temp2
WHERE JOB = 'MANAGER';
ROLLBACK;

-- 전체 사원 삭제
DELETE emp_temp2;
ROLLBACK;

-- 조인
Select count(*) from emp;
select count(*) from dept;

select * from emp, dept;

-- innerjoin(내부조인)
-- 등가 조인 : 일치하는 데이터 추출
-- 비등가 조인 : 특정 범위에 있는 데이터 추출

select empno, ename, emp.deptno, dname
from emp, dept
where emp.deptno = dept.deptno;

select empno, ename, emp.deptno, dname
from emp, dept
where emp.deptno = dept.deptno
order by dname;

select empno, ename, e.deptno, dname
from emp e, dept d
where e.deptno = d.deptno
order by dname;

-- sal 3000 이상인 사원들의 사번, 이름, 부서번호, 부서명, 급여
SELECT empno, ename, d.deptno, dname, sal
from emp e, dept d
where e.deptno = d.deptno and sal >= 3000;

-- 실습
SELECT empno, ename, sal, dname, loc
from emp e, dept d
where e.deptno = d.deptno and sal <= 2500 and empno <= 9999;

-- emp 테이블의 급여가 salgradev 특정 범위에 속하면 grade 값 조회;
SELECT * FROM salgrade;
SELECT * FROM emp;

SElECT *
FROM emp e, salgrade s
WHERE e.sal BETWEEN s.losal and s.hisal;

-- 셀프 조인 (자체 조인) : 본인 자신과 조인
SELECT e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno;

-- 외부조인(outer join)
-- 왼쪽 외부 조인(left outer join)
-- 오른쪽 외부 조인(right outer join)
SELECT e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno(+);

SELECT e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM emp e1, emp e2
WHERE e1.mgr(+) = e2.empno;

-- 양쪽 외부 조인 (+ 기호 제공 안함)
-- outer join된 테이블은 1개만 지정할 수 있다

-- 모든 데이터 베이스에서 사용가능한 표준 조인 구문
-- join-on
select empno, ename, emp.deptno, dname
from emp join dept on emp.deptno = dept.deptno
order by dname;

SELECT empno, ename, d.deptno, dname, sal
from emp e join dept d on e.deptno = d.deptno
where sal >= 3000;

SELECT empno, ename, sal, dname, loc
from emp e join dept d on e.deptno = d.deptno
where sal <= 2500 and empno <= 9999;

SElECT *
FROM emp e join salgrade s
on e.sal BETWEEN s.losal and s.hisal;

SELECT e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM emp e1 left outer join emp e2 on e1.mgr = e2.empno(+);

SELECT e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM emp e1 right outer join emp e2 on e1.mgr = e2.empno(+);

-- 실습 1
--급여가 2000초과인 사원들의 부서 정보, 사원 정보를 아래와 같이 출력하는 sql 구문
SELECT d.deptno, dname, empno, ename, sal
FROM dept d, emp e
WHERE d.deptno = e.deptno and sal > 2000
order by d.deptno;

SELECT d.deptno, dname, empno, ename, sal
FROM dept d join emp e on d.deptno = e.deptno
WHERE sal > 2000;

-- 실습 2
--각 부서별 평균 급여, 최대 급여, 최소 급여 사원수를 출력하는 sql구문

SELECT d.deptno, dname, floor(avg(sal)) as avg_sal, max(sal), min(sal), count(*) cnt
FROM emp e, dept d
WHERE e.deptno = d.deptno
group by d.deptno, dname;

SELECT d.deptno, dname, floor(avg(sal)) as avg_sal, max(sal), min(sal), count(*) cnt
FROM emp e join dept d on e.deptno = d.deptno
group by d.deptno, dname;

-- 실습 3
SELECT d.deptno, dname, empno, ename, job, sal
FROM dept d join emp e on d.deptno = e.deptno(+)
order by d.deptno, e.deptno;

-- 세개의 테이블 조인 하는 방법
SELECT *
FROM emp e1, emp e2, emp e3
WHERE e1.empno = e2.empno and e1.empno = e3.empno;

SELECT *
FROM emp e1 join emp e2 on e1.empno = e2.empno
            join emp e3 on e1.empno = e3.empno;

SELECT d.deptno, dname, e1.empno, e1.ename, e1.mgr, e1.sal, losal, hisal, grade
e2.empno AS mgr_empno, e2.ename AS mgr_ename 
from emp e1, dept d, salgrade s, emp e2
WHERE e.deptno(+) = d.deptno and e1.sal between s.losal(+) and s.hisal(+)
and e1.mgr = e2.empno
order by d.deptno, e.ename;

SELECT 
d.deptno,
dname,
e1.empno,
e1.ename,
e1.mgr, 
e1.sal,
losal,
hisal,
grade
e2.empno AS mgr_empno,
e2.ename AS mgr_ename 
FROM 
emp e1 right outer join dept d on e.deptno = d.deptno
            left outer join salgrade on e1.sal between s.losal and s.hisal
            left outer join emp e2 on e1.mgr = e2.empno
order by d.deptno, e.ename;


-- 서브쿼리 : sql 문을 실행하는 데 필요한 데이터를 추가로 조회하기 위해 sql문 내부에서 사용하는
--                select문이다
--          연산자와 같은 비교 또는 조회 대상의 오른쪽에 놓여서 괄호로 묶어서 사용
--          서브쿼리의 SELECT 절에 명시한 열은 매인쿼리의 비교 대상과 
--          같은 자료형의 타입과 같은 개수로 지정

-- jones 사원의 급여보다 높은 급여를 받는 사원 조회
-- jones 사원의 급여 조회
SELECT sal FROM emp WHERE ename = 'JONES';
-- 2975보다 큰 사원 조회
SELECT * FROM emp WHERE sal> 2975;

-- 합쳐서
SELECT * FROM emp WHERE sal > (select sal from emp where ename = 'JONES');

-- ALLEN 사원의 추가 수당보다 많은 추가수당을 받는 사원 조회
SELECT * FROM emp WHERE comm > (SELECT comm FROM emp WHERE ename = 'ALLEN');

-- WARD 사원의 입사일보다 빨리 입사한 사원 목록 조회
SELECT * FROM emp WHERE hiredate < (select hiredate FROM emp WHERE ename = 'WARD');

-- 20번 부서의 속한 사원중 전체 사원의 평균 급여보다 높은 급여를 받는 사원정보(사원번호, 사원명
--    직업, 급여)와 소속부서정보(부서번호, 부서명, 부서위치)를 조회
SELECT empno, ename, job, sal, d.deptno, dname, loc
FroM emp e, dept d
WHERE e.deptno = d.deptno; AND d.deptno = 20 AND e.sal > (SELECT AVG(sal) FROM emp);

-- 다중행 서브쿼리
-- 서브쿼리 실행결과가 여래 개로 나오는 거
-- IN : 매인 쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치하면 true
-- ANY(SOME) : 매인 쿼리의 조건식을 만족하는 서브퀄의 결과가 하나 이상이면 true
-- ALL : 서브퀄의 결과가 모두 만족하면
-- EXISTS : 서브퀄의 결과가 하나라도 만족하면 모두 조회

-- 부서별 최고급여보다 큰 사원 조회
-- 단일 행 하위 절의에 2개 이상의 행이 리턴되었습니다.(연결기호론 불가)
SELECT *
FROM emp
WHERE sal >
(SELECT max(sal) FROM emp group by deptno);

SELECT *
FROM emp
WHERE sal IN
(SELECT max(sal) FROM emp group by deptno);

-- ANY(SOME)
SELECT *
FROM emp
WHERE sal = ANY
(SELECT max(sal) FROM emp group by deptno);

-- 30번 부서 사원들의 최고급여보다 적은 사원 조회
SELECT *
FROM emp
WHERE sal < ANY
(SELECT max(sal) FROM emp WHERE deptno=30);

SELECT *
FROM emp
WHERE sal < ANY
(SELECT sal FROM emp WHERE deptno=30);

-- ALL
SELECT *
FROM emp
WHERE sal < ALL
(SELECT sal FROM emp WHERE deptno=30);

SELECT *
FROM emp
WHERE sal > ALL
(SELECT sal FROM emp WHERE deptno=30);

-- EXISTS
SELECT * FROM emp WHERE EXISTS (select dname from dept where deptno = 10);
SELECT * FROM emp WHERE EXISTS (select dname from dept where deptno = 50);

-- 문제 전체 사원 중 ALLEN과 같은 직책인 사원들의 사원정보, 부서정보 출력하기
-- enmae, empno, sal, deptnom, dname
SELECT ename, empno, job, sal, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno AND e.job
IN(select job from emp where ename = 'ALLEN');

-- 전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원정보, 부서정보, 급여등급
-- 출력하기(급여가 많은 순으로 정렬하되 급여가 같은 경우 사원번호를 오름차순으로 정렬)
SELECT ename, empno, job, sal, d.deptno, d.dname, s.grade
FROM emp e, dept d, salgrade s
WHERE e.deptno = d.deptno AND e.sal BETWEEN s.losal AND s.hisal AND e.sal
> (select avg(sal) from emp)
order by e.sal desc, e.empno asc;

-- 비교할 열이 여러 개인 다중열 서브쿼리

SELECT *
FROM emp
WHERE (deptno, sal) IN (SELECT deptno, max(sal) FROM emp group by deptno);

-- FROM절 서브쿼리(인라인 뷰)
SELECT empno, ename, d.deptno, dname, loc
FROM (SELECT * FROM emp WHERE deptno=10) e10, (SELECT * FROM dept) d
WHERE e10.deptno = d.deptno;

-- INSERT 사용하는 서브쿼리
-- values 절은 사용하지 않음
-- 데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치해야 한다.
-- 데이터가 추가되는 테이블의 자료형과 서브쿼리의 자료형이 일치해야 한다.



-- emp테이블에서 salgrade 테이블을 참조하여 급여 등급이 1인 사원만을 emp_temp
-- 에 추가
SELECT * 
FROM emp e, salgrade s
WHERE e.sal BETWEEN s.losal and s.hisla and s.grade = 1;


INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
SELECT e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno
FROM emp e, salgrade s
WHERE e.sal BETWEEN s.losal and s.hisal and s.grade = 1;

-- UPDATE 서브쿼리
SELECT * FROM dept_temp;

-- 40번 부서 이름과 지역 수정 (dept 테이블의 deptno = 30인 지역명, 부서명 추출 후)
SELECT dname, loc
FROM dept
WHERE deptno = 30;

UPDATE dept_temp
SET (dname, loc) = (select dname, loc from dept WHERE deptno=30)
WHERE deptno = 40;

UPDATE dept_temp
SET loc = 'SEOUL'
WHERE deptno = (select deptno from dept_temp where dname = 'ACCOUNTING')

-- delete 서브쿼리

SELECT * FROM emp_temp;

--  급여 등급이 3등급이고 30번 부서인 사원들만 삭제

DELETE dept_temp
WHERE empno IN (select empno
from emp_temp E, salgrade S 
where E.sal BETWEEN S.losal and S.hisal and S.grade =3
and deptno =30);

-- 실습 1
create table exam_emp as select * from emp;

create table exam_dept as select * from dept;

create table exam_salgrade as select * from salgrade;

--insert into exam_emp values();









-- 트랜잭션
-- 하나의 단위로 데이터를 처리
create table dept_tcl as select * from dept;

select * from dept_tcl;

-- 트랜잭션 과 관련있는 명령어 실행
INSERT INTO dept_tcl values(50, 'DATABASE', 'seoul');

update dept_tcl set loc = 'BUSAN' where deptno = 40;

delete from dept_tcl where dname = 'RESERCH';

--

-- 수행된 명령 취소
ROLLBACK;

-- 수행된 명령 최종 반영
commit;

select * from dept_tcl;

-- 세션 : 어떤 활동을 위한 시간, 기간
--       데이터베이스 접속을 시작으로 여러 데이터베이스에서 관련 작업을 
--       수행한 후 접속을 종료하기까지 전체 기간

delete from dept_tcl where deptno = 50;

select * from dept_tcl;

commit;

UPDATE dept_tcl
SET loc = 'SEOUL'
WHERE deptno = 30;




