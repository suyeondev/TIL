-- DUAL���̺�� �����غ���.

SELECT  ROUND(125.315)
FROM    DUAL;

SELECT  ROUND(125.315,1)
FROM    DUAL;

SELECT  ROUND(125.315,-1)
FROM    DUAL;

SELECT  ROUND(125.315,3)
FROM    DUAL;

SELECT  ROUND(125.315,2)
FROM    DUAL;

SELECT  SYSDATE
FROM    DUAL ;

SELECT  HIRE_DATE,
        ADD_MONTHS(HIRE_DATE,120) AS "�Ի��� 10��Ǵ� ��¥"
FROM    EMPLOYEE;   

--������̺��� �ټӳ���� 20�� �̻��� ����� ������ ��ȸ�Ѵٸ�?
SELECT  HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12) AS �ټӳ��
FROM    EMPLOYEE
WHERE   MONTHS_BETWEEN(SYSDATE,HIRE_DATE) >= 240;

-- DUAL ���̺��� Ȱ���ؼ� ���ϴ� ���·� ��¥�� �ð� ����غ��� 
SELECT TO_CHAR(SYSDATE, 'PM HH24:MI:SS') FROM DUAL;

SELECT TO_CHAR(SYSDATE,'MON DY,YYY') FROM DUAL;

SELECT TO_CHAR(SYSDATE,'YYYY-fmMM-DD DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-fmDD DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'Year,Q') FROM DUAL;

SELECT  EMP_NAME,
        TO_CHAR(HIRE_DATE,'YYYY"��" MM"��" DD"��"')
FROM    EMPLOYEE;

SELECT  EMP_NAME
FROM    EMPLOYEE
WHERE   HIRE_DATE = '04/04/30';

SELECT  EMP_NAME
FROM    EMPLOYEE
WHERE   TO_CHAR(HIRE_DATE) = '90/04/01';

SELECT TO_DATE('20100101','YYYYMMDD') FROM DUAL;
SELECT TO_CHAR('20100101','YYY,MON') FROM DUAL;
SELECT TO_CHAR(TO_DATE('20100101','YYYYMMDD'),'YYYY,MON') FROM DUAL;
SELECT TO_DATE('041030 143000','YYMMDD HH24MISS') FROM DUAL;
SELECT TO_CHAR(TO_DATE('041030 143000','YYMMDD HH24MISS'),'DD-MON-YY HH:MI:SS PM') FROM DUAL;
SELECT TO_DATE('980630','YYMMDD') FROM DUAL;
SELECT TO_CHAR(TO_DATE('980630','YYMMDD'),'YYYY.MM.DD') FROM DUAL;

SELECT SYSDATE AS ����,
        '95/10/27' AS �Է�,
        TO_CHAR(TO_DATE('95/10/27','YY/MM/DD'),'YYYY/MM/DD') AS YY����1,
        TO_CHAR(TO_DATE('95/10/27','YY/MM/DD'),'RRRR/MM/DD') AS YY����2,
        TO_CHAR(TO_DATE('95/10/27','RR/MM/DD'),'YYYY/MM/DD') AS RR����1,
        TO_CHAR(TO_DATE('95/10/27','RR/MM/DD'),'RRRR/MM/DD') AS RR����2
FROM    DUAL;


SELECT  EMP_NO,
        SUBSTR(EMP_NO, 1, 6) + SUBSTR(EMP_NO, 8,7)
FROM    EMPLOYEE;

SELECT  EMP_NAME, SALARY, NVL(BONUS_PCT,0)
FROM    EMPLOYEE
WHERE   SALARY > 3500000;

SELECT  EMP_NAME, 
        (SALARY*12) + ((SALARY*12)*BONUS_PCT)
FROM    EMPLOYEE
WHERE   SALARY > 3500000;
/*NULL�� ���� ��ü ��� ����� NULL�̶�*/

SELECT  EMP_NAME, 
        (SALARY*12)+((SALARY*12)*NVL(BONUS_PCT,0))
FROM    EMPLOYEE
WHERE   SALARY > 3500000;

SELECT  EMP_NAME,
        EMP_NO,
        DECODE(SUBSTR(EMP_NO,8,1),'1','��','��') AS ����
FROM    EMPLOYEE;

SELECT  EMP_ID, EMP_NAME,
        DECODE(MGR_ID, NULL, '����', MGR_ID) AS ������
FROM    EMPLOYEE
WHERE   JOB_ID = 'J4';

SELECT  EMP_ID, EMP_NAME,
        NVL(MGR_ID, '����') AS ������
FROM    EMPLOYEE
WHERE   JOB_ID = 'J4';

-- ������̺��� ����� ���޿� ���� �λ�޿��� ��ȸ�Ϸ��� �Ѵ�.
-- ������ J1�� 10% �λ�, J2�� 20%�λ��� ����� �̸� ����, �λ�޿��� ��ȸ�Ѵٸ�?

SELECT  EMP_NAME, 
        JOB_ID,
        SALARY,
        DECODE(JOB_ID, 'J1', SALARY*1.1, 'J2', SALARY*1.2, SALARY) AS �λ�޿�
FROM    EMPLOYEE;

SELECT  EMP_NAME,
        JOB_ID,
        SALARY,
        CASE WHEN JOB_ID = 'J1' THEN SALARY*1.1 
             WHEN JOB_ID = 'J2' THEN SALARY*1.2 
             ELSE SALARY 
        END AS �λ�޿�
FROM    EMPLOYEE;

--������̺��� �޿������� ������ �޿������ ��ȸ�Ϸ��� �Ѵ�
--�޿��� 3000000���ϸ� C, 4000000 ���ϸ� B, 4000000 �̻��̸� A����� ����� �̸�,�޿�,�޿������ ��ȸ�Ѵٸ�?
--������ ���ؼ��� ORDER BY �����÷� [ASC | DESC]
SELECT  EMP_NAME,
        SALARY,
        CASE WHEN SALARY <= 3000000 THEN 'C'
             WHEN SALARY <= 4000000 THEN 'B'
             ELSE 'A'     
        END AS �޿����
FROM    EMPLOYEE
ORDER BY �޿����, SALARY DESC;

--������̺��� ������ �̸�, �̸���, �̸��Ͼ��̵� ��ȸ�Ѵٸ�?
SELECT  EMP_NAME,
        EMAIL,
        SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1) AS "EMAIL ID"
FROM    EMPLOYEE;

SELECT  SUM(SALARY), SUM(DISTINCT SALARY)
FROM    EMPLOYEE
WHERE   DEPT_ID = '50'
OR      DEPT_ID IS NULL;

/*ADDITIONAL SELECT -�ռ� */
--1. ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ���������� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
--( ��, ����� "�й�", "�̸�", "���г⵵" �� ǥ�õǵ��� �Ѵ�.)
SELECT  STUDENT_NO,
        STUDENT_NAME,
        TO_CHAR(ENTRANCE_DATE,'YYYY-MM-DD') AS ���г⵵
FROM    TB_STUDENT
WHERE   DEPARTMENT_NO = '002'
ORDER BY ���г⵵;

--2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� �Ѵ�. 
--�� ������ �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����.
--(* �̶� �ùٸ��� �ۼ��� SQL ������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��)

SELECT  PROFESSOR_NAME,
        PROFESSOR_SSN
FROM    TB_PROFESSOR
WHERE   LENGTH(PROFESSOR_NAME) != 3
ORDER BY LENGTH(PROFESSOR_NAME) ASC;

--3. �� ������б��� ���� �������� �̸��� ���̸� ����ϴ� SQL ������ �ۼ��Ͻÿ�. 
-- ���̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�. 
--(��, ���� �� 2000 �� ���� ����ڴ� ������ ��� ����� "�����̸�", "����"�� ����. ���̴� ���������� �������.)

SELECT  PROFESSOR_NAME AS �����̸�,
        TRUNC(MONTHS_BETWEEN(SYSDATE,TO_DATE(SUBSTR(PROFESSOR_SSN,1,6),'RR/MM/DD'))/12,0) AS ����
FROM    TB_PROFESSOR
ORDER BY ����;

/*3�� ����*/
SELECT  PROFESSOR_NAME AS �����̸�,
        TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-TO_NUMBER('19'||SUBSTR(PROFESSOR_SSN,1,2)) AS ����
FROM    TB_PROFESSOR
ORDER BY    ����;

--4. �������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. 
-- ��� ����� `�̸�` �� �������� �Ѵ�. (���� 2 ���� ���� ������ ���ٰ� �����Ͻÿ�)

SELECT  SUBSTR(PROFESSOR_NAME,-2,2) AS �̸�
FROM    TB_PROFESSOR;

--5. �� ������б��� ����� �����ڸ� ���Ϸ��� �Ѵ�. ��� ã�Ƴ� ���ΰ�?
-- �̶�, 19 �쿡 �����ϸ� ����� ���� ���� ������ �����Ѵ�.
-- 1�� �õ�
SELECT  STUDENT_NO,
        STUDENT_NAME
        
FROM    TB_STUDENT

WHERE   TRUNC(MONTHS_BETWEEN(ENTRANCE_DATE,TO_DATE(SUBSTR(STUDENT_SSN,1,6),'RR/MM/DD'))/12,0)!= 19;
-- 2�� �õ�
SELECT *
FROM    TB_STUDENT;
WHERE  ((CASE WHEN SUBSTR(ENTRANCE_DATE,1,1)=0 THEN 20 
        ELSE 19 END || 
        TO_NUMBER(SUBSTR(ENTRANCE_DATE,1,2))) - TO_NUMBER((TO_CHAR(TO_DATE(SUBSTR(STUDENT_SSN,1,6),'RR/MM/DD'),'YYYY')))!=19;
/*5�� ����*/
SELECT  STUDENT_NO,
        STUDENT_NAME
FROM    TB_STUDENT
WHERE   TO_NUMBER(TO_CHAR(ENTRANCE_DATE, 'YYYY'))  - TO_NUMBER(TO_CHAR(TO_DATE(SUBSTR(STUDENT_SSN, 1, 2), 'RR'), 'YYYY')) > 19
ORDER BY 1;


-- 6. 2020�� ũ���������� ���� �����ΰ�?
SELECT  TO_CHAR(TO_DATE('20201225','YYYYMMDD'),'DAY')
FROM    DUAL;


-- 7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') �� ���� �� �� ��� �� ���� �ǹ�����?
-- �� TO_DATE('99/10/11','RR/MM/DD'), TO_DATE('49/10/11','RR/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ�����?

SELECT  TO_CHAR(TO_DATE('99/10/11','YY/MM/DD'),'YYYY/MM/DD'),
        TO_CHAR(TO_DATE('49/10/11','YY/MM/DD'),'YYYY/MM/DD'),
        TO_CHAR(TO_DATE('99/10/11','RR/MM/DD'),'YYYY/MM/DD'),
        TO_CHAR(TO_DATE('49/10/11','RR/MM/DD'),'YYYY/MM/DD')
FROM    DUAL;
/*RETURN: 2099,2049,1999,2049*/

-- 8. �� ������б��� 2000 �⵵ ���� �����ڵ��� �й��� A �� �����ϰ� �Ǿ��ִ�.
-- 2000 �⵵���� �й��� ���� �л����� �й��� �̸��� �����ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT  STUDENT_NO,
        STUDENT_NAME
FROM    TB_STUDENT
WHERE   STUDENT_NO NOT LIKE 'A%'
ORDER BY 1;

-- 9. �й��� A517178 �� �ѾƸ� �л��� ���� �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�.
-- ��, �̶� ��� ȭ���� ����� "����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� ���ڸ������� ǥ���Ѵ�.

SELECT  ROUND(AVG(POINT),1) AS ����
FROM    TB_GRADE
WHERE   STUDENT_NO = 'A517178'
GROUP BY    STUDENT_NO;

-- 10. �а��� �л����� ���Ͽ� "�а���ȣ", "�л���(��)" �� ���·� ����� ����� ������� ��µǵ��� �Ͻÿ�.

SELECT  DEPARTMENT_NO,
        COUNT(STUDENT_NO) AS "�л���(��)"
FROM    TB_STUDENT
GROUP BY    DEPARTMENT_NO
ORDER BY    DEPARTMENT_NO;


-- 11. ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ� �˾Ƴ��� SQL ���� �ۼ��Ͻÿ�.

SELECT  COUNT(*)
FROM    TB_STUDENT
WHERE   COACH_PROFESSOR_NO IS NULL;

-- 12. �й��� A112113 �� ���� �л��� �⵵ �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. 
-- ��, �̶� ��� ȭ���� ����� "�⵵", "�⵵ �� ����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� �� �ڸ������� ǥ���Ѵ�.
SELECT  SUBSTR(TERM_NO,1,4) AS �⵵,
        ROUND(AVG(POINT),1)
FROM    TB_GRADE
WHERE   STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY SUBSTR(TERM_NO,1,4);

-- 13. �а� �� ���л� ���� �ľ��ϰ��� �Ѵ�. �а� ��ȣ�� ���л� ���� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.

SELECT  DEPARTMENT_NO AS "�а��ڵ��",
        COUNT(CASE WHEN ABSENCE_YN = 'Y' THEN 1 ELSE 0 END)
FROM    TB_STUDENT
GROUP BY    DEPARTMENT_NO
ORDER BY    DEPARTMENT_NO;