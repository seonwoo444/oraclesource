--employees 테이블의 전체 내용 조회
SELECT * FROM employees;

--employees 테이블의 first_name, last_name, job_id만 조회
SELECT first_name, last_name, job_id FROM employees;

-- 20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 DEPARTMENT_ID 오름차순 조회
SELECT last_name, department_id FROM employees WHERE department_id IN (20,50);
--COMMISSION_PCT를 받는 모든 사원들의 LAST_NAME, SALARY, COMMISSION_PCT조회
--단, SALARY 내림차순, COMMISSION_PCT 내림차순
SELECT last_name, salary, commission_pct FROM employees WHERE commission_pct > 0 
ORDER BY salary DESC, commission_pct DESC;

--SALARY가 2500,3500,7000이 아니며 JOB_ID가 SA_REP, ST_CLERK 사원 조회
SELECT * FROM employees WHERE salary NOT IN(2500, 3500, 7000) AND job_id IN ('SA_REP','ST_CLERK');
--2008/02/20 ~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME, EMPLOYEE_ID,HIRE_DATE
--조회한다. HIRE_DATE 내림차순 조회
SELECT LAST_NAME, EMPLOYEE_ID,HIRE_DATE FROM employees WHERE hire_date >= '2008-02-20' AND
hire_date <= '2008-05-01' ORDER BY hire_date DESC;

--2004년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE 조회
--HIRE_DATE 오름차순 조회
SELECT LAST_NAME, HIRE_DATE FROM employees WHERE hire_date >= '2004-01-01' AND hire_date <= '2004-12-31'
ORDER BY hire_date ASC;

--salary가 5000~12000의 범위 이외인 사원들의 last_name, slary 조회
SELECT last_name, salary FROM employees WHERE salary NOT BETWEEN 5000 AND 12000;
-- 20번 및 50번 부서에서 근무하며 salary가 5000~12000의 사이인
--모든 사원들의 LAST_NAME 및 DEPARTMENT_ID 오름차순 조회
SELECT LAST_NAME, DEPARTMENT_ID, salary FROM employees WHERE department_id IN(20,50) AND
salary BETWEEN 5000 AND 12000 ORDER BY last_name ASC, department_id asc;
--2008/02/20 ~ 2008/05/01 사이에 고용된 사원들의 LAST_NAME, EMPLOYEE_ID,HIRE_DATE
--조회한다. HIRE_DATE 내림차순 조회
SELECT LAST_NAME, EMPLOYEE_ID,HIRE_DATE FROM employees WHERE hire_date BETWEEN '2008-02-20' AND
'2008-05-01' ORDER BY hire_date DESC;
--2004년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE 조회
--HIRE_DATE 오름차순 조회
SELECT LAST_NAME, HIRE_DATE FROM employees WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY hire_date ASC;
 
--LIKE
--2004년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE 조회
--HIRE_DATE 오름차순 조회
SELECT
    LAST_NAME, HIRE_DATE FROM employees WHERE hire_date LIKE '04%' ORDER BY hire_date;
--LAST_NAME에 u가 포함되는 사번 및 LAST_NAME 조회
SELECT
    employee_id, last_name FROM employees WHERE last_name LIKE'%u%';
--last_name의 4번째 글자가 a인 사원들의 last_name 조회
SELECT employee_id, last_name FROM employees WHERE last_name LIKE'___a';
--last_name에 글자가 a혹은 e 글자가 들어있는 사원들의 last_name 조회한 후
--last_name 오름차순 조회
SELECT last_name FROM employees WHERE last_name LIKE'%a%' OR last_name LIKE '%e%' ORDER BY last_name;

--last_name에 글자가 a와 e도 들어있는 사원들의 last_name 조회한 후
--last_name 오름차순 조회
SELECT last_name FROM employees WHERE last_name LIKE '%a%e%' OR last_name LIKE '%e%a%' ORDER BY last_name;

-- manager_id가 없는 사원들의 last_name, job_id 조회
SELECT last_name, job_id, manager_id FROM employees WHERE manager_id IS NULL;

--job_id가 ST_CLERK인 사원의 department_id 조회(단, 부서번호가 null인 것 제외)
SELECT
    DISTINCT department_id FROM employees WHERE job_id = 'ST_CLERK' AND department_id IS NOT NULL ;
--commission_pct가 null 이 아닌 사원들 중에서 commission = salary * commission_pct 를 구한 후
--employee_id, frist_name, job_id, commission 조회
SELECT
   employee_id, first_name, job_id, salary * commission_pct AS commission  FROM employees 
   WHERE commission_pct IS NOT NULL;
   
--   실습
SELECT 
last_name, 
salary,
decode(TRUNC(salary/2000,0), 0, 0.00, 1,0.09, 2, 0.02, 3, 0.03, 4, 0.04, 5, 0.42, 6, 0.44, 0.45) AS TAX_RATE
FROM employees WHERE department_id = 80;

-- 사원들의 최대급여와 최소 급여의 차이를 조회
SELECT MAX(salary)- MIN(salary) AS GAP FROM employees;

-- 매니저로 근무하는 사원들의 총 수 조회(단, MANAGER_ID 중복 제거)
SELECT
    COUNT(DISTINCT manager_id) FROM employees;   
   

   
   
   
   
   
   
   
   
   