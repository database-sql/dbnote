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
INSERT INTO Tour VALUES ('��','��ϻ�', '?', '043-200-2834', 'û���� ��ϵ�', 'free', 'free', 'free');
INSERT INTO Tour VALUES ('ķ��','�ݰ��� ķ����', '�����繫��', '010-****-****', '��籸 �̿��� �ݰ��� 336-4', '2,000��', '1,000��', '2,000��');
INSERT INTO Tour VALUES ('�ڹ���','����û�ֹڹ���', '�ſ�ȣ', '043-229-6300', '��籸 ��Ϸ� 143', 'free', 'free', 'free');
INSERT INTO Tour VALUES ('��Ÿ','û����', '����ȯ', '043-220-6412', '��籸 ���Ǹ� û����� 646', '5,000', '3,000', '5,000');
commit;