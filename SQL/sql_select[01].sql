/* 
SELECT�� BASIC �ǽ�
AS : Į���� ��Ī�� �������ش�.(������ ����)
- ȿ�� : �÷� ��Ī�� ����ϸ� SELECT ���� ����� ����� �����ϰ� ǥ�õǴ� ���� ��� ���
�κ��� ������ �� ����
*/

-- 1. EMPLOYEE ���̺��� �̸�, 1��޿�, �Ѽҵ��� ����ض�. 

SELECT  EMP_NAME AS �̸�,
        SALARY * 12 AS "1�� �޿�",
        ( SALARY + (SALARY * BONUS_PCT)) * 12 AS �Ѽҵ�
FROM    EMPLOYEE;

/* 
Literal(���ͷ�) : ���Ƿ� ������ ���ڿ�
SELECT���� ����ϸ� ���̺� �����ϴ� ������ó�� ����� �� �ִ�
���ͷ��� Result Set�� ����࿡ �ݺ�������ǥ�õ�
*/

-- 2. EMPLOYEE ���̺��� ���̵�, �̸�, �ٹ����δ� �������� ����ض�
SELECT  EMP_ID,
        EMP_NAME,
        '����' AS �ٹ�����
FROM    EMPLOYEE ;

/* 
DISTINCT: �÷��� ���Ե� �ߺ� ���� �ѹ����� ǥ���ϰ��� �� �� ���
? SELECT ���� 1ȸ�� ���
? �÷� ���� ���� �Ұ���
? ���� �� �÷��� ��ȸ�ϴ� ��쿡�� ��ȸ ��� �÷����� ���� ����� �������� �ߺ� ���� �Ǵ�
*/

-- 3.EMPLOYEE ���̺��� DEPT_ID�� �ߺ����� ����ض�
SELECT DISTINCT DEPT_ID
FROM    EMPLOYEE;

-- 4.EMPLOYEE ���̺��� JOB_ID �� DEPT_ID�� �ߺ����� ����ض�
SELECT DISTINCT JOB_ID, DEPT_ID
FROM    EMPLOYEE;

-- 5.EMPLOYEE ���̺��� �μ���ȣ�� 90�� ������ �̸��� �μ��� ����ض�
SELECT  EMP_NAME AS �̸�,
        DEPT_ID AS �μ�
FROM    EMPLOYEE
WHERE   DEPT_ID = 90;

-- 6. EMPLOYEE ���̺��� SALARY �� �� 4000000���� ū ������ �̸��� �޿��� ����ض� 
SELECT  EMP_NAME AS �̸�,
        SALARY AS �޿�
FROM    EMPLOYEE
WHERE   SALARY > 4000000;

-- 7.  EMPLOYEE ���̺��� �μ� ��ȣ�� '90'�̰� �޿��� 2000000���� ���� �޴� �μ��� �̸��� �μ� ��ȣ, �޿��� ����ض�.
SELECT  EMP_NAME AS �̸�,
        DEPT_ID AS �μ�,
        SALARY AS �޿�
FROM    EMPLOYEE
WHERE   DEPT_ID = '90'
AND     SALARY > 2000000;

-- 8.  EMPLOYEE ���̺��� '90' �μ��� '20' �μ��� �Ҽӵ� �μ��� �̸�, �μ� �ڵ�, �޿��� ����ض�.
SELECT  EMP_NAME AS �̸�,
        DEPT_ID AS �μ�,
        SALARY AS �޿�
FROM    EMPLOYEE
WHERE   DEPT_ID = '90'
OR      DEPT_ID = '20';


/* 
���Ῥ����('||') : ���� �÷��� �ϳ��� �÷��� ��ó�� �����ϰų�, �÷��� ���ͷ��� ������ �� �ִ�.
*/

-- 9. ������ȣ, �����̸�, �޿��� �����Ͽ� ����ض�.
SELECT  EMP_ID||EMP_NAME||SALARY
FROM    EMPLOYEE;


-- 10. �÷��� ���ͷ��� ������ ��� - (�����̸�)�� ������(�޿�)���Դϴ�. �������� ����ض�
SELECT  EMP_NAME||'�� ������'||SALARY||'�� �Դϴ�.'
FROM    EMPLOYEE;

/*
��������(AND, OR, NOT)
AND : ���� ������ ���ÿ� TRUE �� ��쿡�� TRUE �� ��ȯ
OR : ���� ���ǵ� �߿� ��� �ϳ��� ���ǐ� TRUE�̸� TRUE �� ��ȯ
NOT: ���ǿ� ���� �ݴ� ������ ��ȯ (NULL ����)

�񱳿����� 
= : ����
>, < : ũ��/�۴�
>= , <= : ũ�ų� ����/ �۰ų� ���� 
<> , !=, ^= : ���� �ʴ�
BETWEEN AND : Ư�� ������ ���ԵǴ��� ��
LIKE/NOT LIKE : ���� ������ ��
IS NULL / IS NOT NULL :  NULL ���� ��
IN :  �� �� ��Ͽ� ���ԵǴ��� ���� ��

*/

-- 11. �޿��� 3,500,000�� ���� ���� �ް� 5,500,000�� ���� ���� �޴� ���� �̸��� �޿� ��ȸ
SELECT  EMP_NAME,
        SALARY
FROM    EMPLOYEE
WHERE   SALARY BETWEEN 3500000 AND 5500000;

-- 12. '��'�� ���� ���� ���� �̸��� �޿� ��ȸ�ض�
SELECT  EMP_NAME, SALARY
FROM    EMPLOYEE
WHERE   EMP_NAME LIKE '��%';

-- 13. 9000�� �� 4�ڸ� ������ ��ȭ��ȣ�� ����ϴ� ���� ��ȭ��ȣ ��ȸ���
SELECT  EMP_NAME, PHONE
FROM    EMPLOYEE
WHERE   PHONE LIKE '___9_______';

--14. EMAIL ID �� '_' �� �ڸ��� 3�ڸ��� ���� ��ȸ�ض�
SELECT  *
FROM    EMPLOYEE
WHERE   EMAIL LIKE '___\_%' ESCAPE '\';

--15. �����ڵ� ���� �μ� ��ġ�� ���� ���� ���� �̸� ��ȸ�ض�
SELECT *
FROM    EMPLOYEE
WHERE   DEPT_ID IS NOT NULL
AND     MGR_ID IS NOT NULL;

--16.60�� �μ��� 90�� �μ������� �̸�, �μ� �ڵ�, �޿� ��ȸ�ض�
SELECT  *
FROM    EMPLOYEE
WHERE   DEPT_ID IN ('60', '90');

-- 17. 20�� �Ǵ� 90�� �μ��� �� �޿��� 3000000�� ���� ���� �޴� ���� �̸�, �޿�, �μ��ڵ带 ��ȸ�ض�
SELECT  *
FROM    EMPLOYEE
WHERE   (DEPT_ID = '20'
OR      DEPT_ID = '90')
AND     SALARY >= 3000000 ;

/*BASIC SELECT ���� */
--1. �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭" ���� ǥ���ϵ��� �Ѵ�.
SELECT  DEPARTMENT_NAME AS "�а� ��", 
        CATEGORY AS �迭
FROM    TB_DEPARTMENT ;

--2. �а��� �а� ������ ������ ���� ���·� ȭ�鿡 �������.
SELECT  DEPARTMENT_NAME||'�� ������ '||CAPACITY||'�� �Դϴ�.' AS "�а��� ����"
FROM    TB_DEPARTMENT;

--3. "������а�" �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û�� ���Դ�. �����ΰ�? 
-- (�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã�� ������ ����)

SELECT  STUDENT_NAME
FROM    TB_STUDENT
WHERE   ABSENCE_YN = 'Y'
AND     STUDENT_SSN LIKE '_______2%'
AND     DEPARTMENT_NO = '001';

--4. ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� �Ѵ�. 
--�� ����ڵ��� �й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�.
-- A513079, A513090, A513091, A513110, A513119

SELECT  STUDENT_NAME
FROM    TB_STUDENT 
WHERE   STUDENT_NO IN ('A513079','A513090','A513091','A513110','A513119');


--5. ���������� 20 �� �̻� 30 �� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.

SELECT  DEPARTMENT_NAME,CATEGORY
FROM    TB_DEPARTMENT
WHERE   CAPACITY BETWEEN 20 AND 30 ;

--6. �� ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�. 
--�׷� �������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ������ �ۼ��Ͻÿ�.

SELECT  PROFESSOR_NAME
FROM    TB_PROFESSOR
WHERE   DEPARTMENT_NO IS NULL;

--7. Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� �Ѵ�. 
-- ��� SQL ������ ����ϸ� �� ������ �ۼ��Ͻÿ�.
SELECT  *
FROM    TB_STUDENT
WHERE   DEPARTMENT_NO IS NULL;

--8. ������û�� �Ϸ��� ����. �������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ� ������� � �������� �����ȣ�� ��ȸ�غ��ÿ�.

SELECT  CLASS_NO
FROM    TB_CLASS
WHERE   PREATTENDING_CLASS_NO IS NOT NULL;

--9. �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�غ��ÿ�.

SELECT  DISTINCT CATEGORY
FROM    TB_DEPARTMENT;

--10. 02 �й� ���� �����ڵ��� ������ ������� �Ѵ�.
-- ������ ������� ������ �������� �л����� �й�, �̸�, �ֹι�ȣ�� ����ϴ� ������ �ۼ��Ͻÿ�

SELECT  STUDENT_NO
        ,STUDENT_NAME
        ,STUDENT_SSN
FROM    TB_STUDENT
WHERE   STUDENT_ADDRESS LIKE '���ֽ�%'
AND     ABSENCE_YN = 'N'
AND     ENTRANCE_DATE LIKE '02%';

/* ADDITIONAL SELECT*/

SELECT  LENGTH(CHARTYPE),
        LENGTH(VARCHARTYPE)
FROM    COLUMN_LENGTH;

-- id@vcc.com�߿� vcc�� ������ c�� ��ġ�� ���ض�
SELECT  EMAIL,
        INSTR( EMAIL, 'c',-1,2 ) AS ��ġ
FROM    EMPLOYEE;

-- id@vcc.com�߿� vcc�� ������ c�� ��ġ�� ���ض� (�ٸ����)
SELECT  EMAIL,
        INSTR( EMAIL, 'c', INSTR(EMAIL,'.')-1) AS ��ġ
FROM    EMPLOYEE;


SELECT  EMAIL AS ����������,
        LENGTH(EMAIL) AS ��������,
        RPAD(EMAIL, 20, '.') AS ������,
        LENGTH(LPAD(EMAIL, 20, '.')) AS �������
FROM    EMPLOYEE;

-- ���ڿ� �ٷ�� �ǽ�
SELECT  TRIM('123123Tech123','123') 
FROM    DUAL;

SELECT  TRIM(TRAILING '1' FROM '11111TECH111')
FROM    DUAL;

SELECT SUBSTR('This is a test', 6,2) 
FROM DUAL;

SELECT SUBSTR('This is a test', 6) 
FROM DUAL;

SELECT SUBSTR('TechOnTheNet', -6,3) 
FROM DUAL;

SELECT  EMP_NAME,
        SUBSTR(HIRE_DATE,1,2)||'�� '||SUBSTR(HIRE_DATE,4,2)||'�� '||SUBSTR(HIRE_DATE,7,2)||'��' AS �Ի���
FROM    EMPLOYEE ;