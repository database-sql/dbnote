# 2019-07-04 강의노트
database lecture note

## 서브쿼리가 필요한 이유
* 한 번의 질의 구문으로 해결할 수 없을 두 번의 질의가 필요하다.
   * ex) 길동의 급여보다 많은 급여를 받는 사람을 검색하라.
* 이를 하나의 질의 구문으로 구성할 때 서브쿼리를 구성한다.

### STEP 1.
````
SELECT salary 
FROM employees
WHERE last_name = 'Kochhar';
````
````
SELECT salary 
FROM employees
WHERE salary > 17000;
````

### STEP 2.
````
SELECT last_name, salary
FROM employees
WHERE salary > (
SELECT salary 
FROM employees
WHERE last_name = 'Kochhar');
````

### 단일행 서브쿼리
````
SELECT last_name, department_id, salary 
FROM employees
WHERE department_id = (
SELECT department_id
FROM employees
WHERE employee_id = 101)
AND salary > (
SELECT salary
FROM employees
WHERE employee_id = 141);
````

### 연습(가장 많은 급여를 받는 직원의 이름과 급여를 검색)
* 부서별 최저 급여를 검색하되 부서명이 60인 부서의 최저 급여보다는 큰 값만 검색하라.
   * 서브쿼리를 사용하지 않고 한다면 먼저, 부서 아이디가 60인 부서의 최저 급여를 검색한다.

#### STEP 1. 부서 아이디가 60인 부서의 최저 급여를 검색한다. (4200)
````
SELECT MIN(salary)
FROM employees
WHERE department_id = 60;
````
#### STEP 2. 4200보다 큰 급여(부서)
````
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 4200;
````
#### 서브쿼리 이용(STEP 1. + STEP 2.)
````
SELECT department_id, MIN (salary) 
FROM employees
GROUP BY department_id
HAVING MIN (salary) > (
SELECT MIN (salary)
FROM employees
WHERE department_id = 60);
````

#### 부서별 최대 급여와 같은 금액의 급여를 받는 직원 이름과 급여액 조회
````
SELECT last_name, salary
FROM employees
WHERE salary IN(
SELECT MAX(salary)
FROM employees
GROUP BY department_id);
````

## TABLE SPACE 만들기
1. TABLE SPACE (file의 형태로 존재)
2. USER 생성

### 테이블 스페이스 만들기 구문(syntax)
````
create tablespace 테이블스페이스이름
datafile '데이터파일경로'
size 초기사이즈
autoextend on next 자동증가사이즈
maxsize 최대사이즈;*/
/*create tablespace madang
datafile 'D:\HongGilDong\madang.dbf'
size 50M
autoextend on next 10M
maxsize unlimited;
````
### 사용자 계정 만들기
````
create user 아이디 identified by 비밀번호 default tablespace;
````

* 암호 변경
````
sqlplus / as sysdba
alter user system identified by 1234;
````
->user altered

### 권한 부여하기
````
grant 권한리스트 to 아이디;
````
* 참고.
  * connect:로그인 권한
  * resource: 자원을 사용할 수 있는 권한
  * dba: db 관리자 권한

### table space 생성 (실습)
````
create tablespace madang
datafile 'D:\HongGilDong\madang.dbf'
size 50M
autoextend on next 10M
maxsize unlimited;
````

* table 삭제
````
drop tablespace madang;
````

### USER 생성
````
create user madang identified by madang
default tablespace madang;
````

### 관리자 권한 부여
````
grant connect, resource, dba to madang;
````

### Book 테이블 생성 (실습)
````
CREATE TABLE book(
    bookid number(3),
    bookname varchar2(50)not null,
    publisher varchar2(20)not null,
    price number(8),
    primary key (bookid)
);
````

### 레코드 INSERTION
````
INSERT 구문
INSERT INTO tablename
VALUES(값 리스트);
````

* UPDATE
````
UPDATE book
SET price = 30000;
-- 특정 레코드를 수정하려면 WHERE 사용
````

### Book 테이블 INSERT(실습)
````
INSERT INTO book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO book VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO book VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

### Customer 테이블 생성
````
CREATE TABLE customer(
	custid number(3),
	name varchar2(20) not null,
	address varchar2(50) not null,
	phone varchar2 (20),
	primary key (custid)
);

### Customer 테이블 INSERT
````
INSERT INTO customer VALUES(1, '박지성', '영국 맨체스타', '000-5000-0001');
INSERT INTO customer VALUES(2, '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO customer VALUES(3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO customer VALUES(4, '추신수', '미국 클리블랜드', '000-7000-0001');
INSERT INTO customer VALUES(5, '박세리', '대한민국 대전', NULL);
````

### Orders 테이블 생성
````
CREATE TABLE orders(
    orderid number(3),
    custid number(3)REFERENCES customer(custid),
    bookid number(3)REFERENCES book(bookid),
    saleprice number(8),
    orderdate DATE,
    primary key (orderid)
);
````

### 외래키를 포함하는 테이블의 정의
````
CREATE TABLE...(
    주키속성명
    ....
    외래키속성명
    .....
    PRIMARY KEY(주키속성명),
    FOREIGN KEY 외래키속성명 REFERNCES 테이블이름(속성이름)
)*/
/*CREATE TABLE orders(
    ....
    cutid number(3),
    ....
    FOREIGN KEY custid REFERENCES customer(custid),
);
````

### Orders 테이블 INSERT
````
INSERT INTO orders VALUES(1, 1, 1, 6000, TO_DATE('2014-07-01','yyyy-mm-dd'));
INSERT INTO orders VALUES(2, 1, 3, 21000, TO_DATE('2014-07-03','yyyy-mm-dd'));
INSERT INTO orders VALUES(3, 2, 5, 8000, TO_DATE('2014-07-03', 'yyyy-mm-dd'));
INSERT INTO orders VALUES(4, 3, 6, 6000, TO_DATE('2014-07-04', 'yyyy-mm-dd'));
INSERT INTO orders VALUES(5, 4, 7, 20000, TO_DATE('2014-07-05', 'yyyy-mm-dd'));
INSERT INTO orders VALUES(6, 1, 2, 12000, TO_DATE('2014-07-07', 'yyyy-mm-dd'));
INSERT INTO orders VALUES(7, 4, 8, 13000, TO_DATE('2014-07-07', 'yyyy-mm-dd'));
INSERT INTO orders VALUES(8, 3, 10, 12000, TO_DATE('2014-07-08', 'yyyy-mm-dd'));
INSERT INTO orders VALUES(9, 2, 10, 7000, TO_DATE('2014-07-09', 'yyyy-mm-dd'));
INSERT INTO orders VALUES(10, 3, 8, 13000, TO_DATE('2014-07-10', 'yyyy-mm-dd'));
````

