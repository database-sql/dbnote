# 2019-07-10 ���� ��Ʈ
database lecture note

## �̻�����
### �����̻�(deletion anomaly)
* ���� ���� �� ���� ����� �ٸ� �������� ���������� �����Ǵ� ����

### �����̻�(insertion anomaly)
* ���� ���� �� Ư�� �Ӽ��� �ش��ϴ� ���� ���� NULL ���� �Է��ؾ� �ϴ� �����̴�.

### �����̻�(update anomaly)
* ���� ���� �� �ߺ��� �������� �Ϻθ� �����Ǿ� �������� ����ġ ������ �Ͼ�� �����̴�.

#### �̻������� ��
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
-- summer table ��ȸ
SELECT * FROM summer;
````
##### �����̻�
* ���� 7-1 200�� �л��� �����б� ������û�� ����Ͻÿ�.
````
-- C���� ������ ��ȸ
SELECT price "C ������"
FROM summer
WHERE class='C';
*/

-- 200�� �л��� ������û ���
DELETE FROM summer
WHERE sid=200;

-- C ���� ������ �ٽ� ��ȸ
SELECT price "C ������"
FROM summer
WHERE class='C';
````

##### �����̻�
* ���� 7-2 �����б⿡ ���ο� �ڹ� ���¸� �����Ͻÿ�.
````
-- �ڹ� ���� ����
INSERT INTO summer VALUES (NULL, 'JAVA', 25000);

-- summer table ��ȸ
-- NULL�� ���� �ִ� ��� ������ ����: ������ 5�������� �����л��� �� 4����
SELECT COUNT(*) "�����ο�"
FROM summer;

SELECT COUNT(sid) "�����ο�"
FROM summer;

SELECT COUNT(*) "�����ο�"
FROM summer
WHERE sid IS NOT NULL;
````

##### �����̻�
* ���� 7-3 FORTRAN ������ �����Ḧ 20,000������ 15,000������ �����Ͻÿ�.
````
-- FORTRAN ���� ������ ����
UPDATE summer
SET price=20000
WHERE class='FORTRAN';

SELECT DISTINCT price "FORTRAN ������"
FROM summer
WHERE class='FORTRAN';

-- ������ ����ġ�� �߻��ϴ� ���(FORTRAN ������ �����ᰡ �� �Ǹ� ������)
UPDATE summer
SET price=15000
WHERE class='FORTRAN' AND sid=100;

-- �� ��� FORTRAN �����Ḧ ��ȸ�ϸ� �� ���� ����
SELECT DISTINCT price "FORTRAN ������"
FROM summer
WHERE class='FORTRAN';
````

#### ������ �����б� ���� ���̺�
````
-- summer price ���̺� ����
CREATE TABLE summerprice(
class varchar2(20),
price number
);

INSERT INTO summerprice VALUES ('FORTRAN', 20000);
INSERT INTO summerprice VALUES ('PASCAL', 15000);
INSERT INTO summerprice VALUES ('C', 10000);

SELECT *
FROM summerprice;

-- summerenroll ���̺� ����
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

##### �����̻� ����
* ���� 7-4 200�� �л��� �����б� ������û�� ����Ͻÿ�.
````
SELECT price "C ������"
FROM summerprice
WHERE class='C';

DELETE FROM summerenroll
WHERE sid=200;

-- C ������ �����ᰡ �����ϴ��� Ȯ��
SELECT price "C ������"
FROM summerprice
WHERE class='C';
````

##### �����̻� ����
* ���� 7-5 �����б⿡ ���ο� �ڹ� ���¸� �����Ͻÿ�.
````
-- �ڹ� ���� ����, NULL ���� �Է��� �ʿ� ����
INSERT INTO summerprice VALUES ('JAVA', 25000);
````
##### �����̻� ����
* ���� 7-6 FORTRAN ������ �����Ḧ 20,000������ 15,000������ �����Ͻÿ�.
````
-- �����̻� ����
UPDATE summerprice
SET price=15000
WHERE class='FORTRAN';

SELECT price "FORTRAN ������"
FROM summerprice
WHERE class='FORTRAN';
````

## �Լ� ���Ӽ�(FD, Functional Dependency)
> �����̼��� �Ӽ� ���� �Լ������� �����ϴ� ����
* � �Ӽ� A�� ���� �˸� �ٸ� �Ӽ� B�� ���� �����ϰ� �������� �������踦 �Ӽ� B�� �Ӽ� A�� �����Ѵ�.(dependent)
* �Ǵ� �Ӽ� A�� �Ӽ� B�� �����Ѵ�.(determine)

### �Լ� ���Ӽ� ��Ģ
* �κ����� ��Ģ: �а��� (�а�, �ּ�)�� �κ����� �Ӽ��̹Ƿ�, '(�а�, �ּ�)->�а�' ����
* ���� ��Ģ: '�л���ȣ->�л��̸�'�̹Ƿ� �����̸��� �߰��Ͽ�, '(�л���ȣ, �����̸�)->(�л��̸�,�����̸�)' ����
* ���� ��Ģ: '�л���ȣ->�а�', '�а�->�а��繫��'�̹Ƿ� �����Ģ�� �����Ͽ�, '�л���ȣ->�а��繫��' ����
* ���� ��Ģ: '�л���ȣ->�л��̸�', '�л���ȣ->�ּ�'�̹Ƿ� ���� ��Ģ�� �����Ͽ�, '�л���ȣ->(�л��̸�, �ּ�)' ����
* ���� ��Ģ: '�л���ȣ->(�л��̸�, �ּ�)'�̹Ƿ� �����Ͽ�, '�л���ȣ->�л��̸�', '�л���ȣ->�ּ�'����
* �������� ��Ģ: '�л��̸�->�л���ȣ'(�л��̸��� ���� ��찡 ���ٰ� �����Ѵ�), '(�����̸�, �л���ȣ)->����'�̹Ƿ� �������� ��Ģ�� �����Ͽ�, '(�����̸�, �л��̸�)'->����' ����

### �Լ� ���Ӽ��� �⺻Ű
> �⺻Ű�� �����̼��� ��� �Ӽ��� ���� ������(determinant).

## ����ȭ
> �̻������� �߻��ϴ� �����̼��� �����Ͽ� �̸� ���ִ� ����.

### �� 1������
> �����̼��� �Ӽ� ���� ���ڰ��̾�� �Ѵٴ� ����.
* Definition
````
A relation in which the intersection of each row and column constraints one and only one value.
````

### �� 2������
> �����̼� R�� �� 1�������̰� �⺻Ű�� �ƴ� �Ӽ��� �⺻Ű�� ���� �Լ� ������ �� �� 2�������̶�� �Ѵ�.
````
A relation that is in first normal form and every non-primary key attribute is fully functionally dependent on the primary key.
````
* ���� �Լ� ����(full functional dependency)
   * A�� B�� �����̼� R�� �Ӽ��̰� A->B ���Ӽ��� ������ ��, B�� A�� �Ӽ� ��ü�� �Լ� �����ϰ� �κ� ���� �Ӽ��� �Լ� �������� ���� ��� ���� �Լ� �����̶�� �Ѵ�.
> �� 2�������� �����ϱ� ���ؼ��� ���� �Լ� ������ ������ �����ؾ� �Ѵ�.

### �� 3������
> �����̼� R�� �� 2 �������̰� �⺻Ű�� �ƴ� �Ӽ��� �⺻Ű�� ��������(non-transitive)���� ������ ��(���� ����) �� 3�������̶�� �Ѵ�. ������ �����̶� A->B, B->C�� ������ �� A->C�� �����Ǵ� �Լ� ���Ӽ��� ���Ѵ�.
````
A relation that is in first and second normal form and in which no non-primary key is transitively dependent on the primary key.
````

### BCNF(Boyce Codd Normal Form)
> �����̼�R���� �Լ� ���Ӽ� X->Y�� ������ �� ��� ������ X�� �ĺ�Ű�̸� BCNF �������̶�� �Ѵ�.
````
A relation is in BCNF if and only if every determinant is a candidate key.
````

## ��Ÿ
* java ��ġ (����)
* java.sun.com -> jdk download -> jre download

* ��ġ �� ���� ���α׷�(cmd)
   * javac -version
   * java -version
> ���ʷ� �Է� ��, ���� ��ġ Ȯ��

* eclipse ��ġ
   * https://www.eclipse.org
   * Eclipse IDE for Enterprise Java Developers ���� �ٿ�ε�