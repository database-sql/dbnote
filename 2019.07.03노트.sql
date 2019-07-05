-- SELECT 구문
-- SELECT [ALL | DISTINCT] 속성이름(들) 컬럼리스트
-- FROM 테이블 이름
-- employees 테이블로부터 아이디, 성, 이름을 조회하는 질의문

-- 테이블의 특정 컬럼을 검색할 경우
/*SELECT employee_id, last_name
FROM employees ;*/

-- 컬럼 별칭 사용의 예
/*SELECT last_name AS name, employee_id empid, salary*12 “Annual Salary”
FROM employees ;*/

-- '|' vertical bar (연결 연산자)
-- 컬럼또는문자를다른컬럼과연결할때사용
/*SELECT last_name ||'는(은) 부서'|| department_id || '에서 근무합니다.' AS "근무부서확인"
FROM employees ;*/

/*SELECT last_name ||' '|| first_name AS "Name"
FROM employees;*/

-- 테이블의 특정 컬럼을 검색할 경우
/*SELECT employee_id, last_name, first_name
FROM employees;*/

-- 급여순으로 이름과 급여를 검색하시오. 
/*SELECT last_name, salary
FROM employees
ORDER by salary;*/

-- 연산자 우선순위
/*SELECT last_name, 12*salary+100
FROM employees;*/

/*SELECT last_name, 12*(salary+100)
FROM employees;*/

-- 산술연산에서의 NULL값
-- 연산하고자 하는 값 중 하나라도 NULL값을 가지면 연산의 결과는 무조건 NULL
/*SELECT last_name, 12*salary*commission_pct
FROM employees;*/

-- DISTINCT (중복회피)
/*SELECT DISTINCT department_id
FROM employees;*/

-- WHERE 절 사용의 예
/*SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id = 90; -> 문자일 경우 ' 사용(대소문자 구분, 데이터 그대로 입력)*/

-- 문자 및 날짜값 비교의 예 (pattern)
/*SELECT employee_id, last_name, job_id
FROM employees
WHERE last_name LIKE 'K%';*/

-- _: 하나의 문자
/*SELECT employee_id, last_name, job_id
FROM employees
WHERE last_name LIKE '__a%';*/

-- 비교 연산자 사용의 예
/*SELECT employee_id, last_name, salary
FROM employees
WHERE salary >= 2500 AND salary <= 3000;*/
-- AND, OR, NOT 논리연산자

-- 비교 연산자(BETWEEN)
/*SELECT employee_id, last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3000;*/

-- 비교 연산자(IN)
/*SELECT employee_id, last_name, salary
FROM employees
WHERE salary=2400 OR salary=2500 OR salary=3000;*/
-- WHERE salary IN (2400, 2500, 3000); ()안의 숫자 크기 순서x*/

-- 비교 연산자(IS NULL)
/*SELECT employee_id, last_name, commission_pct
FROM employees
WHERE commission_pct IS NULL;*/

-- 내림차순
/*SELECT employee_id, last_name, salary
FROM employees
ORDER BY salary DESC;*/

-- 논리 연산자(AND)
/*SELECT employee_id, last_name, salary
FROM employees
WHERE salary > 8000
AND last_name LIKE '%K%';*/

-- 여러 칼럼을 통한 정렬
/*SELECT employee_id, last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC, last_name;*/

-- 소문자 처리
/*SELECT LOWER(last_name), last_name
FROM employees;*/

-- 결합
/*SELECT CONCAT(first_name, last_name)
FROM employees;*/

-- 별표시(왼쪽부터, 전체 10자리)
/*SELECT last_name, LPAD(salary, 10, '*')
FROM employees;*/

-- 문자 함수의 종류(p. 208)
-- LOWER
/*SELECT employee_id, LOWER(last_name)
FROM employees;*/

-- UPPER, INITCAP
/*SELECT UPPER(first_name) AS "이름", LOWER(last_name) AS "성", INITCAP(email)
FROM employees;*/

-- CONCAT
/*SELECT first_name, last_name, CONCAT(first_name, last_name) AS "이름"
FROM employees;*/

-- substr
/*SELECT first_name, substr(first_name,3), substr(first_name,-3), substr(first_name, 2, 3), substr(first_name, -4, 3)
FROM employees;*/

-- 숫자 함수의 종류(p. 206)
-- 날짜, 시간 함수의 종류(p. 211)
-- daytime의 주요인자(p. 212)

-- TO_CHAR(date, datetime)
/*SELECT last_name, hire_date, TO_CHAR(hire_date, 'yyyy mon dd day')
FROM employees;*/

-- NVL
/*SELECT last_name, NVL(manager_id, '999')
FROM employees;*/

-- NVL2
/*SELECT employee_id, last_name, salary, manager_id, NVL2(manager_id, '부서있음', '부서없음') "배치부서"
FROM employees ;*/

-- NULLIF(a,b)
/*SELECT NULLIF(LENGTH(first_name), LENGTH(last_name))name
FROM employees;*/ 
--WHERE ROWNUM <=10;
--WHERE last_name = 'Chen';

-- substr : 어디서부터 몇 번째까지 잘라내겠다는 뜻
-- 아스키 코드: 미국ANSI에서 표준화한 정보교환용 7비트 부호체계

-- dual
--SELECT 5*4 FROM dual;

-- 그룹함수(숫자 데이터)
/*SELECT ROUND(AVG(salary), 0), SUM(salary), MAX(salary), MIN(salary)
FROM employees
WHERE department_id = 90 ;*/

-- 날짜 데이터
/*SELECT MAX(hire_date), MIN(hire_date)
FROM employees ;*/

/*SELECT COUNT(employee_id)
FROM employees
WHERE department_id = 60 ;*/

-- 평균
/*SELECT AVG(commission_pct)
FROM employees ;*/

/*SELECT AVG (NVL (commission_pct, 0))
FROM employees ;*/

-- 평균 이후에 반올림(두 자리)
/*SELECT department_id, ROUND(AVG(salary), 0)
FROM employees
GROUP BY department_id ;*/

-- 평균 이후에 반올림(두 자리), 단위 표시
/*SELECT department_id, TO_CHAR(ROUND(AVG(salary), 2), '99,999')
FROM employees
GROUP BY department_id ;*/

-- HAVING 절 
/*SELECT job_id, AVG(salary)
FROM employees
GROUP BY job_id
HAVING AVG(salary) > 4000;*/

-- CROSS Join - 다 연결

--Equi Join
/*SELECT c.country_name, r.region_name
FROM countries c, regions r
WHERE c.region_id = r.region_id;*/

-- 같은 속성: 속성명이 같고, 도메인이 같은 

/*SELECT e.employee_id, e.last_name, e.department_id, 
       d.department_id, d.department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id;*/

-- Equi join (조건 외에 검색 조건 추가)
/*SELECT e.employee_id, e.last_name, e.department_id, 
       d.department_id, d.department_name 
FROM employees e, departments d 
WHERE e.department_id = d.department_id 
      AND last_name = 'King';*/
      
/* n개 테이블 연결
SELECT n개
FROM n개
WHERE n-1개(AND로 연결)*/

-- Cross Join (두 테이블의 값을 무조건 조인)
/*SELECT last_name, department_name
FROM employees CROSS JOIN departments;*/

-- natural join = join , 같은 표현

-- LEFT Outer Join
/*SELECT e.last_name, e.department_id, d.department_name
FROM employees e
LEFT OUTER JOIN departments d
ON (e.department_id = d.department_id );*/

-- Right Outer Join
/*SELECT e.last_name, e.department_id, d.department_name
FROM employees e
RIGHT OUTER JOIN departments d
ON (e.department_id = d.department_id );*/

-- 웹앱 모바일은 단말기로서의 역할만 함.

