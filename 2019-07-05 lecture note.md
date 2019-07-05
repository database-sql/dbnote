# 2019-07-05 강의노트
database lecture note

## 관계대수 : 연산을 이용하여 질의하는 방법을 기술하는 언어
* 시그마 : 셀렉션
* 파이: 프로젝션
* 로: 리네임
* 카티전 프로덕트(cartesian product) : cross join
* PRIMARY KEY는 NULL값을 허용하지 않음.
* UNIQUE는 NULL 값을 허용. 속성 중복 값은 허용 X.
* CHECK : 조건을 줄 수 있음.
* cascade 뜻 : 종속

## Githib
* Github: 공동작업을 하며 버전 관리를 할 수 있는 도구
   * 인터넷 상에 나의 작업을 올려서 언제 어느 곳에서나 액세스 하고 다른 사람들과 자료를 공유할 수 있다.
* md: mark down, HTML file을 심플하게 표현하는 방식


## 테이블 생성(+제약조건, Constraint)
````
CREATE TABLE ex (
    id NUMBER(3),
    name VARCHAR(30) CONSTRAINT CNAME_unique UNIQUE,
    salary NUMBER(7) CONSTRAINT CNAME_check CHECK(salary BETWEEN 300 AND 1000),
    primary key(id)
);
````

## 레코드 INSERTION (with Constraints)
````
INSERT INTO ex VALUES(1, '홍길동', 300);
INSERT INTO ex VALUES(2, 박문수, 2000);
INSERT INTO ex VALUES(3, '성춘향', 500);
````

* 테이블 이름 변경
```` 
RENAME example TO ex;
````


* 테이블에 컬럼을 추가
```` 
ALTER TABLE ADD(새로운 컬럼 이름 타입)
````
````
ALTER TABLE ex ADD(dept_id number(3));
````


* 테이블 삭제
````
DROP TABLE ex;
````

* 테이블 확인(describe)
```` 
desc ex;
````

* 컬럼 수정
````
ALTER TABLE ex MODIFY(name varchar(50));
````

* 컬럼 삭제
````
ALTER TABLE ex DROP COLUMN dept_id;
````

* 컬럼 이름 변경
````
ALTER TABLE ex RENAME COLUMN salary TO pay;
````

* 유저가 소유한 모든 제약 조건 조회
````
SELECT constraint_name FROM user_constraints;
````
