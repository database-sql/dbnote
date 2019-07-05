# 2019-07-05 ���ǳ�Ʈ
database lecture note

## ������ : ������ �̿��Ͽ� �����ϴ� ����� ����ϴ� ���
* �ñ׸� : ������
* ����: ��������
* ��: ������
* īƼ�� ���δ�Ʈ(cartesian product) : cross join
* PRIMARY KEY�� NULL���� ������� ����.
* UNIQUE�� NULL ���� ���. �Ӽ� �ߺ� ���� ��� X.
* CHECK : ������ �� �� ����.
* cascade �� : ����

## Githib
* Github: �����۾��� �ϸ� ���� ������ �� �� �ִ� ����
   * ���ͳ� �� ���� �۾��� �÷��� ���� ��� �������� �׼��� �ϰ� �ٸ� ������ �ڷḦ ������ �� �ִ�.
* md: mark down, HTML file�� �����ϰ� ǥ���ϴ� ���


## ���̺� ����(+��������, Constraint)
````
CREATE TABLE ex (
    id NUMBER(3),
    name VARCHAR(30) CONSTRAINT CNAME_unique UNIQUE,
    salary NUMBER(7) CONSTRAINT CNAME_check CHECK(salary BETWEEN 300 AND 1000),
    primary key(id)
);
````

## ���ڵ� INSERTION (with Constraints)
````
INSERT INTO ex VALUES(1, 'ȫ�浿', 300);
INSERT INTO ex VALUES(2, �ڹ���, 2000);
INSERT INTO ex VALUES(3, '������', 500);
````

* ���̺� �̸� ����
```` 
RENAME example TO ex;
````


* ���̺� �÷��� �߰�
```` 
ALTER TABLE ADD(���ο� �÷� �̸� Ÿ��)
````
````
ALTER TABLE ex ADD(dept_id number(3));
````


* ���̺� ����
````
DROP TABLE ex;
````

* ���̺� Ȯ��(describe)
```` 
desc ex;
````

* �÷� ����
````
ALTER TABLE ex MODIFY(name varchar(50));
````

* �÷� ����
````
ALTER TABLE ex DROP COLUMN dept_id;
````

* �÷� �̸� ����
````
ALTER TABLE ex RENAME COLUMN salary TO pay;
````

* ������ ������ ��� ���� ���� ��ȸ
````
SELECT constraint_name FROM user_constraints;
````
