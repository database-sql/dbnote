# 2019-07-03 ���ǳ�Ʈ(2�� ����)
database lecture note 

## SELECT ����
### SELECT
```` SELECT [ALL | DISTINCT] �Ӽ��̸�(��) �÷�����Ʈ
FROM ���̺� �̸�
employees ���̺�κ��� ���̵�, ��, �̸��� ��ȸ�ϴ� ���ǹ�
````

### DISTINCT (�ߺ�ȸ��)
````SELECT DISTINCT department_id
FROM employees;
````

### ���̺��� Ư�� �÷��� �˻��� ���
````SELECT employee_id, last_name
FROM employees ;
````

����) �޿������� �̸��� �޿��� �˻��Ͻÿ�.
````SELECT last_name, salary
FROM employees
ORDER by salary;
````

### �÷� ��Ī ����� ��
````SELECT last_name AS name, employee_id empid, salary*12 ��Annual Salary��
FROM employees ;
````

### �÷� �Ǵ� ���ڸ� �ٸ� �÷��� �����Ҷ� ���(������)
````SELECT last_name ||' '|| first_name AS "Name"
  FROM employees;

  SELECT last_name ||'��(��) �μ�'|| department_id || '���� �ٹ��մϴ�.' AS "�ٹ��μ�Ȯ��"
  FROM employees ;
````
'|' :vertical bar (���� ������)

### ������ �켱����
````SELECT last_name, 12*salary+100
  FROM employees;

  SELECT last_name, 12*(salary+100)
  FROM employees;
````
* ������꿡���� NULL��
* �����ϰ��� �ϴ� �� �� �ϳ��� NULL���� ������ ������ ����� ������ NULL

### �� ������ ����� ��(AND, OR, NOT ��������)
````SELECT employee_id, last_name, salary
  FROM employees
  WHERE salary >= 2500 AND salary <= 3000;
````

### �� ������(BETWEEN)
````SELECT employee_id, last_name, salary
  FROM employees
  WHERE salary BETWEEN 2500 AND 3000;
````

### �� ������(IN)
```` SELECT employee_id, last_name, salary
  FROM employees
  WHERE salary=2400 OR salary=2500 OR salary=3000;
  -- WHERE salary IN (2400, 2500, 3000); ()���� ���� ũ�� ����x
````

### �� ������(IS NULL)
```` SELECT employee_id, last_name, commission_pct
  FROM employees
  WHERE commission_pct IS NULL;
````

### �� ������(AND)
```` SELECT employee_id, last_name, salary
  FROM employees
  WHERE salary > 8000
  AND last_name LIKE '%K%';
````

### ���� Į���� ���� ����
```` SELECT employee_id, last_name, department_id, salary
  FROM employees
  ORDER BY department_id, salary DESC, last_name;
````

### ��������
```` SELECT employee_id, last_name, salary
  FROM employees
  ORDER BY salary DESC;
````

### ����
#### �ҹ��� ó��
````SELECT LOWER(last_name), last_name
  FROM employees;
````

#### ����
```` SELECT CONCAT(first_name, last_name)
  FROM employees;
````

#### ��ǥ��(���ʺ���, ��ü 10�ڸ�)
```` SELECT last_name, LPAD(salary, 10, '*')
  FROM employees;
````

### ���� �Լ��� ����(���� p.208)
#### LOWER
```` SELECT employee_id, LOWER(last_name)
  FROM employees;
````

#### UPPER, INITCAP
```` SELECT UPPER(first_name) AS "�̸�", LOWER(last_name) AS "��", INITCAP(email)
  FROM employees;
````

#### CONCAT
```` SELECT first_name, last_name, CONCAT(first_name, last_name) AS "�̸�"
  FROM employees;
````

#### substr (��𼭺��� �� ��°���� �߶󳻰ڴٴ� ��)
```` SELECT first_name, substr(first_name,3), substr(first_name,-3), substr(first_name, 2, 3), substr(first_name, -4, 3)
  FROM employees;
````

* ���� �Լ��� ����(p. 206)
* ��¥, �ð� �Լ��� ���� (p. 211)
* daytime�� �ֿ�����(p. 212)

### �� ��
#### TO_CHAR(date, datetime)
````SELECT last_name, hire_date, TO_CHAR(hire_date, 'yyyy mon dd day')
  FROM employees;
````

#### NVL
````SELECT last_name, NVL(manager_id, '999')
  FROM employees;
````

#### NVL2
````SELECT employee_id, last_name, salary, manager_id, NVL2(manager_id, '�μ�����', '�μ�����') "��ġ�μ�"
  FROM employees ;
````

#### NULLIF(a,b)
````SELECT NULLIF(LENGTH(first_name), LENGTH(last_name))name
  FROM employees;
  --WHERE ROWNUM <=10;
  --WHERE last_name = 'Chen';  
````

* �ƽ�Ű �ڵ�: �̱�ANSI���� ǥ��ȭ�� ������ȯ�� 7��Ʈ ��ȣü��

### dual (���� ���̺�)
````SELECT 5*4 FROM dual;
````

### ���� ������(�ݿø� ����)
````SELECT ROUND(AVG(salary), 0), SUM(salary), MAX(salary), MIN(salary)
  FROM employees
  WHERE department_id = 90 ;

  SELECT COUNT(employee_id)
  FROM employees
  WHERE department_id = 60 ;
````

### �ݿø�, ���� ǥ��
````SELECT department_id, TO_CHAR(ROUND(AVG(salary), 2), '99,999')
  FROM employees
  GROUP BY department_id ;
````

### HAVING ��
````SELECT job_id, AVG(salary)
  FROM employees
  GROUP BY job_id
  HAVING AVG(salary) > 4000;
````

### Equi Join
````SELECT c.country_name, r.region_name
  FROM countries c, regions r
  WHERE c.region_id = r.region_id;
````

### Equi join (���� �ܿ� �˻� ���� �߰�)
````SELECT e.employee_id, e.last_name, e.department_id, 
       d.department_id, d.department_name 
  FROM employees e, departments d 
  WHERE e.department_id = d.department_id 
      AND last_name = 'King';
````
* ���� �Ӽ�: �Ӽ����� ����, �������� ����

* n�� ���̺� ����
````SELECT n��
  FROM n��
  WHERE n-1��(AND�� ����);
````

### Cross Join (�� ���̺��� ���� ������ ����)
```` SELECT last_name, department_name
  FROM employees CROSS JOIN departments;
````
* Cross Join - �� ����

### LEFT Outer Join
````SELECT e.last_name, e.department_id, d.department_name
  FROM employees e
  LEFT OUTER JOIN departments d
  ON (e.department_id = d.department_id );
````

### Right Outer Join
````SELECT e.last_name, e.department_id, d.department_name
  FROM employees e
  RIGHT OUTER JOIN departments d
  ON (e.department_id = d.department_id );
````

* ���� ������� �ܸ���μ��� ���Ҹ� ��.