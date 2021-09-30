-- EMPLOYEE_ID가 176인 사람의 LAST_NAME과 DEPARTMENT_ID 조회
SELECT last_name, department_id FROM employees WHERE employee_id = 176;
-->,<,>=,<= 사용
--salary가 12000이상 되는 직원들의 last_name, salary 조회
SELECT last_name, salary FROM employees WHERE salary >=12000;

--salary가 5000~12000의 범위 이외인 사원들의 last_name, slary 조회
SELECT last_name, salary FROM employees WHERE salary < 5000 OR salary > 12000;

