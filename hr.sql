CREATE TABLE Manager (
    UserID varchar(20),
    Password varchar(100));

INSERT INTO Manager VALUES ('kim', '0123');
    
CREATE TABLE Tour(
    category varchar(5) not null,
    spot varchar(100) not null,
    name varchar(20),
    tel varchar(20) not null,
    address varchar(100) not null,
    pay_adult varchar(10),
    pay_child varchar(10),
    pay_elder varchar(10));
ALTER TABLE Tour MODIFY(category varchar2(20));
    DROP TABLE Tour;
    
SELECT * FROM Manager;
SELECT * FROM Tour;
INSERT INTO Tour VALUES ('산','우암산', '?', '043-200-2834', '청원구 우암동', 'free', 'free', 'free');
INSERT INTO Tour VALUES ('캠핑','금관숲 캠핑장', '관리사무실', '010-****-****', '상당구 미원면 금관리 336-4', '2,000원', '1,000원', '2,000원');
INSERT INTO Tour VALUES ('박물관','국립청주박물관', '신영호', '043-229-6300', '상당구 명암로 143', 'free', 'free', 'free');
INSERT INTO Tour VALUES ('기타','청남대', '강성환', '043-220-6412', '상당구 문의면 청남대길 646', '5,000', '3,000', '5,000');
commit;