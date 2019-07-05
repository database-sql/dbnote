# 2019-07-04 ���ǳ�Ʈ
database lecture note

## ���������� �ʿ��� ����
* �� ���� ���� �������� �ذ��� �� ���� �� ���� ���ǰ� �ʿ��ϴ�.
   * ex) �浿�� �޿����� ���� �޿��� �޴� ����� �˻��϶�.
* �̸� �ϳ��� ���� �������� ������ �� ���������� �����Ѵ�.

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

### ������ ��������
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

### ����(���� ���� �޿��� �޴� ������ �̸��� �޿��� �˻�)
* �μ��� ���� �޿��� �˻��ϵ� �μ����� 60�� �μ��� ���� �޿����ٴ� ū ���� �˻��϶�.
   * ���������� ������� �ʰ� �Ѵٸ� ����, �μ� ���̵� 60�� �μ��� ���� �޿��� �˻��Ѵ�.

#### STEP 1. �μ� ���̵� 60�� �μ��� ���� �޿��� �˻��Ѵ�. (4200)
````
SELECT MIN(salary)
FROM employees
WHERE department_id = 60;
````
#### STEP 2. 4200���� ū �޿�(�μ�)
````
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 4200;
````
#### �������� �̿�(STEP 1. + STEP 2.)
````
SELECT department_id, MIN (salary) 
FROM employees
GROUP BY department_id
HAVING MIN (salary) > (
SELECT MIN (salary)
FROM employees
WHERE department_id = 60);
````

#### �μ��� �ִ� �޿��� ���� �ݾ��� �޿��� �޴� ���� �̸��� �޿��� ��ȸ
````
SELECT last_name, salary
FROM employees
WHERE salary IN(
SELECT MAX(salary)
FROM employees
GROUP BY department_id);
````

## TABLE SPACE �����
1. TABLE SPACE (file�� ���·� ����)
2. USER ����

### ���̺� �����̽� ����� ����(syntax)
````
create tablespace ���̺����̽��̸�
datafile '���������ϰ��'
size �ʱ������
autoextend on next �ڵ�����������
maxsize �ִ������;*/
/*create tablespace madang
datafile 'D:\HongGilDong\madang.dbf'
size 50M
autoextend on next 10M
maxsize unlimited;
````
### ����� ���� �����
````
create user ���̵� identified by ��й�ȣ default tablespace;
````

* ��ȣ ����
````
sqlplus / as sysdba
alter user system identified by 1234;
````
->user altered

### ���� �ο��ϱ�
````
grant ���Ѹ���Ʈ to ���̵�;
````
* ����.
  * connect:�α��� ����
  * resource: �ڿ��� ����� �� �ִ� ����
  * dba: db ������ ����

### table space ���� (�ǽ�)
````
create tablespace madang
datafile 'D:\HongGilDong\madang.dbf'
size 50M
autoextend on next 10M
maxsize unlimited;
````

* table ����
````
drop tablespace madang;
````

### USER ����
````
create user madang identified by madang
default tablespace madang;
````

### ������ ���� �ο�
````
grant connect, resource, dba to madang;
````

### Book ���̺� ���� (�ǽ�)
````
CREATE TABLE book(
    bookid number(3),
    bookname varchar2(50)not null,
    publisher varchar2(20)not null,
    price number(8),
    primary key (bookid)
);
````

### ���ڵ� INSERTION
````
INSERT ����
INSERT INTO tablename
VALUES(�� ����Ʈ);
````

* UPDATE
````
UPDATE book
SET price = 30000;
-- Ư�� ���ڵ带 �����Ϸ��� WHERE ���
````

### Book ���̺� INSERT(�ǽ�)
````
INSERT INTO book VALUES(1, '�౸�� ����', '�½�����', 7000);
INSERT INTO book VALUES(2, '�౸�ƴ� ����', '������', 13000);
INSERT INTO book VALUES(3, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO book VALUES(4, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO book VALUES(5, '�ǰ� ����', '�½�����', 8000);
INSERT INTO book VALUES(6, '���� �ܰ躰���', '�½�����', 6000);
INSERT INTO book VALUES(7, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO book VALUES(8, '�߱��� ��Ź��', '�̻�̵��', 13000);
INSERT INTO book VALUES(9, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

### Customer ���̺� ����
````
CREATE TABLE customer(
	custid number(3),
	name varchar2(20) not null,
	address varchar2(50) not null,
	phone varchar2 (20),
	primary key (custid)
);

### Customer ���̺� INSERT
````
INSERT INTO customer VALUES(1, '������', '���� ��ü��Ÿ', '000-5000-0001');
INSERT INTO customer VALUES(2, '�迬��', '���ѹα� ����', '000-6000-0001');
INSERT INTO customer VALUES(3, '��̶�', '���ѹα� ������', '000-7000-0001');
INSERT INTO customer VALUES(4, '�߽ż�', '�̱� Ŭ������', '000-7000-0001');
INSERT INTO customer VALUES(5, '�ڼ���', '���ѹα� ����', NULL);
````

### Orders ���̺� ����
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

### �ܷ�Ű�� �����ϴ� ���̺��� ����
````
CREATE TABLE...(
    ��Ű�Ӽ���
    ....
    �ܷ�Ű�Ӽ���
    .....
    PRIMARY KEY(��Ű�Ӽ���),
    FOREIGN KEY �ܷ�Ű�Ӽ��� REFERNCES ���̺��̸�(�Ӽ��̸�)
)*/
/*CREATE TABLE orders(
    ....
    cutid number(3),
    ....
    FOREIGN KEY custid REFERENCES customer(custid),
);
````

### Orders ���̺� INSERT
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

