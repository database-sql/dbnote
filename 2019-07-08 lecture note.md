# 2019-07-08 강의노트
database lecture note

## view: 가상의 테이블(실제 데이터 x, 질의구문으로만 이루어짐)
* materialized view - 실제 데이터를 가지고 있음

### 1. view의 종류
* 단순뷰(simple view) - 뷰생성 서브쿼리에 조인, 조건없이 1개의 테이블로부터 만들어지는 뷰
* 복합뷰(complex view) - 뷰생성 서브쿼리에 여러개의 테이블이 조인되어 생성되는 뷰
* 인라인뷰(inline view) - 해당 질의에서만 필요한 뷰일 경우 FROM절에 서브쿼리를 바로 적어서 사용하는 뷰

### 2. view의 생성
````
CREATE [OR REPLACE] view 뷰네임
AS
    subquery
    [WITH READ ONLY]
````    

* 뷰 생성 (연습)
````
CREATE TABLE o_tbl(a NUMBER, b NUMBER, c NUMBER);
````
### 3. 뷰 수정
````
CREATE OR REPLACE VIEW view1
AS
  SELECT a, b
  FROM o_tbl;
````
* 뷰 INSERTION
````  
INSERT INTO view1 VALUES(1,2);
````
* view에 INSERTION을 하면 original table에 입력됨.

### 4. 뷰 수정 [READ ONLY]
````
CREATE OR REPLACE VIEW view2
AS
    SELECT a, b
    FROM o_tbl
WITH READ ONLY;
-- 이후에 INSERTION 시도할 경우 (오류)
INSERT INTO view2 VALUES(99,99); -> 오류
````

* 사용자가 정의한 view들을 가지고 있는 테이블
````
SELECT * FROM user_views;
````

#### 연습문제 6번 (p. 252)
* (1) 판매가격이 20,000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 highorders뷰 생성
````
CREATE OR REPLACE VIEW highorders
AS
SELECT b.bookid, b.bookname, c.name, b.publisher, o.saleprice
FROM book b, customer c, orders o
WHERE o.custid = c.custid
AND o.bookid = b.bookid
AND o.saleprice >= 20000;
````

* (2) 생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 SQL 문을 작성
````
SELECT bookname "도서이름", name "고객이름"
FROM highoders;
````

* (3) highorders뷰를 변경, 판매가격 속성 삭제, 삭제 후 (2)번 SQL문을 다시 수행 
````
CREATE OR REPLACE VIEW highorders
AS
SELECT b.bookid, b.bookname, c.name, b.publisher
FROM book b, customer c, orders o
WHERE o.custid = c.custid
AND o.bookid = b.bookid;
````
* index : 정보를 찾아가는 수단
* binary tree - 이진 트리, 이등분하며 정보를 찾아가는 방법
* 속성의 선택도 낮음 -> 속성의 모든 값이 다르다는 뜻

* OLTP (Online Transaction Processing) - 여러 과정(또는 연산)이 하나의 단위 프로세스로 실행되도록 하는 프로세스
* OLAP (Online Analytical Processing) - 다차원으로 이루어진 데이터로부터 통계적인 요약정보를 제공할 수 있는 기술

### 인덱스 생성
````
CREATE [REVERSE] |[UNIQUE] INDEX 인덱스 이름]
ON 테이블이름 (컬럼 [ASC|DESC] [{컬럼 [ASC | DESC]} ...])[;]
````
* 실습
````
CREATE INDEX idx_test_no ON test(no);
````
#### 연습(인덱스)
* programming (10,000개 데이터 삽입)
````
BEGIN
    FOR i IN 1..10000 LOOP
        INSERT INTO test VALUES(i);
    END LOOP;
    COMMIT;
END;
/
````

#### 인덱스의 상태를 조회하는 방법
````
ANALYZE INDEX idx_test_no VALIDATE STRUCTURE;
SELECT (del_lf_rows_len / lf_rows_len)* 100 BALANCE
FROM index_stats
WHERE name='IDX_TEST_NO';
````

### INDEX 삭제(연습)
````
DELETE FROM test
WHERE no BETWEEN 2500 AND 6500;
````

### 인덱스를 리빌드(연습)
````
ALTER INDEX idx_test_no REBUILD;
````
### MySql 사용(MySql workbench 설치)
* mysql  
   * use : database 생성
   * show: oracle 에서의 SELECT
   * Administrative roles(메뉴) - 권한 설정, 하는 작업에 따라 설정.
* charset/collation : data를 incoding 하는 방식 지정, 설정(안할 경우 글씨 깨짐)

### Oracle과의 차이점
* MySql에서는 Database가 여러 개이기 때문에 만들 때 지정해주어야 함.
* MySql에서는 Database 를 스키마로 지칭.

### 구문 차이점 확인
* www.oracletutorial.org
* www.mysqltutorial.org

### 정규화 과정
* 자료 중복으로 인한 아노말리 최소화