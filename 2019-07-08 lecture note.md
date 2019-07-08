# 2019-07-08 ���ǳ�Ʈ
database lecture note

## view: ������ ���̺�(���� ������ x, ���Ǳ������θ� �̷����)
* materialized view - ���� �����͸� ������ ����

### 1. view�� ����
* �ܼ���(simple view) - ����� ���������� ����, ���Ǿ��� 1���� ���̺�κ��� ��������� ��
* ���պ�(complex view) - ����� ���������� �������� ���̺��� ���εǾ� �����Ǵ� ��
* �ζ��κ�(inline view) - �ش� ���ǿ����� �ʿ��� ���� ��� FROM���� ���������� �ٷ� ��� ����ϴ� ��

### 2. view�� ����
````
CREATE [OR REPLACE] view �����
AS
    subquery
    [WITH READ ONLY]
````    

* �� ���� (����)
````
CREATE TABLE o_tbl(a NUMBER, b NUMBER, c NUMBER);
````
### 3. �� ����
````
CREATE OR REPLACE VIEW view1
AS
  SELECT a, b
  FROM o_tbl;
````
* �� INSERTION
````  
INSERT INTO view1 VALUES(1,2);
````
* view�� INSERTION�� �ϸ� original table�� �Էµ�.

### 4. �� ���� [READ ONLY]
````
CREATE OR REPLACE VIEW view2
AS
    SELECT a, b
    FROM o_tbl
WITH READ ONLY;
-- ���Ŀ� INSERTION �õ��� ��� (����)
INSERT INTO view2 VALUES(99,99); -> ����
````

* ����ڰ� ������ view���� ������ �ִ� ���̺�
````
SELECT * FROM user_views;
````

#### �������� 6�� (p. 252)
* (1) �ǸŰ����� 20,000�� �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ� highorders�� ����
````
CREATE OR REPLACE VIEW highorders
AS
SELECT b.bookid, b.bookname, c.name, b.publisher, o.saleprice
FROM book b, customer c, orders o
WHERE o.custid = c.custid
AND o.bookid = b.bookid
AND o.saleprice >= 20000;
````

* (2) ������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ�
````
SELECT bookname "�����̸�", name "���̸�"
FROM highoders;
````

* (3) highorders�並 ����, �ǸŰ��� �Ӽ� ����, ���� �� (2)�� SQL���� �ٽ� ���� 
````
CREATE OR REPLACE VIEW highorders
AS
SELECT b.bookid, b.bookname, c.name, b.publisher
FROM book b, customer c, orders o
WHERE o.custid = c.custid
AND o.bookid = b.bookid;
````
* index : ������ ã�ư��� ����
* binary tree - ���� Ʈ��, �̵���ϸ� ������ ã�ư��� ���
* �Ӽ��� ���õ� ���� -> �Ӽ��� ��� ���� �ٸ��ٴ� ��

* OLTP (Online Transaction Processing) - ���� ����(�Ǵ� ����)�� �ϳ��� ���� ���μ����� ����ǵ��� �ϴ� ���μ���
* OLAP (Online Analytical Processing) - ���������� �̷���� �����ͷκ��� ������� ��������� ������ �� �ִ� ���

### �ε��� ����
````
CREATE [REVERSE] |[UNIQUE] INDEX �ε��� �̸�]
ON ���̺��̸� (�÷� [ASC|DESC] [{�÷� [ASC | DESC]} ...])[;]
````
* �ǽ�
````
CREATE INDEX idx_test_no ON test(no);
````
#### ����(�ε���)
* programming (10,000�� ������ ����)
````
BEGIN
    FOR i IN 1..10000 LOOP
        INSERT INTO test VALUES(i);
    END LOOP;
    COMMIT;
END;
/
````

#### �ε����� ���¸� ��ȸ�ϴ� ���
````
ANALYZE INDEX idx_test_no VALIDATE STRUCTURE;
SELECT (del_lf_rows_len / lf_rows_len)* 100 BALANCE
FROM index_stats
WHERE name='IDX_TEST_NO';
````

### INDEX ����(����)
````
DELETE FROM test
WHERE no BETWEEN 2500 AND 6500;
````

### �ε����� ������(����)
````
ALTER INDEX idx_test_no REBUILD;
````
### MySql ���(MySql workbench ��ġ)
* mysql  
   * use : database ����
   * show: oracle ������ SELECT
   * Administrative roles(�޴�) - ���� ����, �ϴ� �۾��� ���� ����.
* charset/collation : data�� incoding �ϴ� ��� ����, ����(���� ��� �۾� ����)

### Oracle���� ������
* MySql������ Database�� ���� ���̱� ������ ���� �� �������־�� ��.
* MySql������ Database �� ��Ű���� ��Ī.

### ���� ������ Ȯ��
* www.oracletutorial.org
* www.mysqltutorial.org

### ����ȭ ����
* �ڷ� �ߺ����� ���� �Ƴ븻�� �ּ�ȭ