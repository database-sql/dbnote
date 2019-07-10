# 2019-07-10 강의 노트
database lecture note

## 이상현상
### 삭제이상(deletion anomaly)
* 투플 삭제 시 같이 저장된 다른 정보까지 연쇄적으로 삭제되는 현상

### 삽입이상(insertion anomaly)
* 투플 삽입 시 특정 속성에 해당하는 값이 없어 NULL 값을 입력해야 하는 현상이다.

### 수정이상(update anomaly)
* 투플 수정 시 중복된 데이터의 일부만 수정되어 데이터의 불일치 문제가 일어나는 현상이다.

#### 이상현상의 예
````
CREATE TABLE summer(
sid number,
class varchar2(20),
price number
);
INSERT INTO summer VALUES (100,'FORTRAN', 20000);
INSERT INTO summer VALUES (150,'PASCAL', 15000);
INSERT INTO summer VALUES (200,'C', 10000);
INSERT INTO summer VALUES (250,'FORTRAN', 20000);
-- summer table 조회
SELECT * FROM summer;
````
##### 삭제이상
* 질의 7-1 200번 학생의 계절학기 수강신청을 취소하시오.
````
-- C강좌 수강료 조회
SELECT price "C 수강료"
FROM summer
WHERE class='C';
*/

-- 200번 학생의 수강신청 취소
DELETE FROM summer
WHERE sid=200;

-- C 강좌 수강료 다시 조회
SELECT price "C 수강료"
FROM summer
WHERE class='C';
````

##### 삽입이상
* 질의 7-2 계절학기에 새로운 자바 강좌를 개설하시오.
````
-- 자바 강좌 삽입
INSERT INTO summer VALUES (NULL, 'JAVA', 25000);

-- summer table 조회
-- NULL이 같이 있는 경우 주의할 질의: 투플은 5개이지만 수강학생은 총 4명임
SELECT COUNT(*) "수강인원"
FROM summer;

SELECT COUNT(sid) "수강인원"
FROM summer;

SELECT COUNT(*) "수강인원"
FROM summer
WHERE sid IS NOT NULL;
````

##### 수정이상
* 질의 7-3 FORTRAN 강좌의 수강료를 20,000원에서 15,000원으로 수정하시오.
````
-- FORTRAN 강좌 수강료 수정
UPDATE summer
SET price=20000
WHERE class='FORTRAN';

SELECT DISTINCT price "FORTRAN 수강료"
FROM summer
WHERE class='FORTRAN';

-- 데이터 불일치가 발생하는 경우(FORTRAN 강좌의 수강료가 한 건만 수정됨)
UPDATE summer
SET price=15000
WHERE class='FORTRAN' AND sid=100;

-- 그 결과 FORTRAN 수강료를 조회하면 두 건이 나옴
SELECT DISTINCT price "FORTRAN 수강료"
FROM summer
WHERE class='FORTRAN';
````

#### 수정된 계절학기 수강 테이블
````
-- summer price 테이블 생성
CREATE TABLE summerprice(
class varchar2(20),
price number
);

INSERT INTO summerprice VALUES ('FORTRAN', 20000);
INSERT INTO summerprice VALUES ('PASCAL', 15000);
INSERT INTO summerprice VALUES ('C', 10000);

SELECT *
FROM summerprice;

-- summerenroll 테이블 생성
CREATE TABLE summerenroll(
sid number,
class varchar2(20)
);
INSERT INTO summerenroll VALUES (100, 'FORTRAN');
INSERT INTO summerenroll VALUES (150, 'PASCAL');
INSERT INTO summerenroll VALUES (200, 'C');
INSERT INTO summerenroll VALUES (250, 'FORTRAN');

SELECT *
FROM summerenroll;
````

##### 삭제이상 없음
* 질의 7-4 200번 학생의 계절학기 수강신청을 취소하시오.
````
SELECT price "C 수강료"
FROM summerprice
WHERE class='C';

DELETE FROM summerenroll
WHERE sid=200;

-- C 강좌의 수강료가 존재하는지 확인
SELECT price "C 수강료"
FROM summerprice
WHERE class='C';
````

##### 삽입이상 없음
* 질의 7-5 계절학기에 새로운 자바 강좌를 개설하시오.
````
-- 자바 강좌 삽입, NULL 값을 입력할 필요 없음
INSERT INTO summerprice VALUES ('JAVA', 25000);
````
##### 수정이상 없음
* 질의 7-6 FORTRAN 강좌의 수강료를 20,000원에서 15,000원으로 수정하시오.
````
-- 수정이상 없음
UPDATE summerprice
SET price=15000
WHERE class='FORTRAN';

SELECT price "FORTRAN 수강료"
FROM summerprice
WHERE class='FORTRAN';
````

## 함수 종속성(FD, Functional Dependency)
> 릴레이션의 속성 간에 함수적으로 종속하는 성질
* 어떤 속성 A의 값을 알면 다른 속성 B의 값이 유일하게 정해지는 의존관계를 속성 B는 속성 A에 종속한다.(dependent)
* 또는 속성 A는 속성 B를 결정한다.(determine)

### 함수 종속성 규칙
* 부분집합 규칙: 학과는 (학과, 주소)의 부분집합 속성이므로, '(학과, 주소)->학과' 성립
* 증가 규칙: '학생번호->학생이름'이므로 강좌이름을 추가하여, '(학생번호, 강좌이름)->(학생이름,강좌이름)' 성립
* 이행 규칙: '학생번호->학과', '학과->학과사무실'이므로 이행규칙을 적용하여, '학생번호->학과사무실' 성립
* 결합 규칙: '학생번호->학생이름', '학생번호->주소'이므로 결합 규칙을 적용하여, '학생번호->(학생이름, 주소)' 성립
* 분해 규칙: '학생번호->(학생이름, 주소)'이므로 분해하여, '학생번호->학생이름', '학생번호->주소'성립
* 유사이행 규칙: '학생이름->학생번호'(학생이름이 같은 경우가 없다고 가정한다), '(강좌이름, 학생번호)->성적'이므로 유사이행 규칙을 적용하여, '(강좌이름, 학생이름)'->성적' 성립

### 함수 종속성과 기본키
> 기본키는 릴레이션의 모든 속성에 대해 결정자(determinant).

## 정규화
> 이상현상이 발생하는 릴레이션을 분해하여 이를 없애는 과정.

### 제 1정규형
> 릴레이션의 속성 값이 원자값이어야 한다는 조건.
* Definition
````
A relation in which the intersection of each row and column constraints one and only one value.
````

### 제 2정규형
> 릴레이션 R이 제 1정규형이고 기본키가 아닌 속성이 기본키에 완전 함수 종속일 때 제 2정규형이라고 한다.
````
A relation that is in first normal form and every non-primary key attribute is fully functionally dependent on the primary key.
````
* 완전 함수 종속(full functional dependency)
   * A와 B가 릴레이션 R의 속성이고 A->B 종속성이 성립할 때, B가 A의 속성 전체에 함수 종속하고 부분 집합 속성에 함수 종속하지 않을 경우 완전 함수 종속이라고 한다.
> 제 2정규형을 이해하기 위해서는 완전 함수 종속의 개념을 이해해야 한다.

### 제 3정규형
> 릴레이션 R이 제 2 정규형이고 기본키가 아닌 속성이 기본키에 비이행적(non-transitive)으로 종속할 때(직접 종속) 제 3정규형이라고 한다. 이행적 종속이란 A->B, B->C가 성립할 때 A->C가 성립되는 함수 종속성을 말한다.
````
A relation that is in first and second normal form and in which no non-primary key is transitively dependent on the primary key.
````

### BCNF(Boyce Codd Normal Form)
> 릴레이션R에서 함수 종속성 X->Y가 성립할 때 모든 결정자 X가 후보키이면 BCNF 정규형이라고 한다.
````
A relation is in BCNF if and only if every determinant is a candidate key.
````

## 기타
* java 설치 (순서)
* java.sun.com -> jdk download -> jre download

* 설치 후 실행 프로그램(cmd)
   * javac -version
   * java -version
> 차례로 입력 후, 정상 설치 확인

* eclipse 설치
   * https://www.eclipse.org
   * Eclipse IDE for Enterprise Java Developers 에서 다운로드