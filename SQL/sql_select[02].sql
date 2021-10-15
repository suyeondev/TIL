-- DUAL테이블로 연습해보기.

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
        ADD_MONTHS(HIRE_DATE,120) AS "입사후 10년되는 날짜"
FROM    EMPLOYEE;   

--사원테이블에서 근속년수가 20년 이상인 사원의 정보를 조회한다면?
SELECT  HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12) AS 근속년수
FROM    EMPLOYEE
WHERE   MONTHS_BETWEEN(SYSDATE,HIRE_DATE) >= 240;

-- DUAL 테이블을 활용해서 원하는 형태로 날짜와 시간 출력해보기 
SELECT TO_CHAR(SYSDATE, 'PM HH24:MI:SS') FROM DUAL;

SELECT TO_CHAR(SYSDATE,'MON DY,YYY') FROM DUAL;

SELECT TO_CHAR(SYSDATE,'YYYY-fmMM-DD DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-fmDD DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'Year,Q') FROM DUAL;

SELECT  EMP_NAME,
        TO_CHAR(HIRE_DATE,'YYYY"년" MM"월" DD"일"')
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

SELECT SYSDATE AS 현재,
        '95/10/27' AS 입력,
        TO_CHAR(TO_DATE('95/10/27','YY/MM/DD'),'YYYY/MM/DD') AS YY형식1,
        TO_CHAR(TO_DATE('95/10/27','YY/MM/DD'),'RRRR/MM/DD') AS YY형식2,
        TO_CHAR(TO_DATE('95/10/27','RR/MM/DD'),'YYYY/MM/DD') AS RR형식1,
        TO_CHAR(TO_DATE('95/10/27','RR/MM/DD'),'RRRR/MM/DD') AS RR형식2
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
/*NULL에 대한 전체 계산 결과는 NULL이라서*/

SELECT  EMP_NAME, 
        (SALARY*12)+((SALARY*12)*NVL(BONUS_PCT,0))
FROM    EMPLOYEE
WHERE   SALARY > 3500000;

SELECT  EMP_NAME,
        EMP_NO,
        DECODE(SUBSTR(EMP_NO,8,1),'1','남','여') AS 성별
FROM    EMPLOYEE;

SELECT  EMP_ID, EMP_NAME,
        DECODE(MGR_ID, NULL, '없음', MGR_ID) AS 관리자
FROM    EMPLOYEE
WHERE   JOB_ID = 'J4';

SELECT  EMP_ID, EMP_NAME,
        NVL(MGR_ID, '없음') AS 관리자
FROM    EMPLOYEE
WHERE   JOB_ID = 'J4';

-- 사원테이블에서 사원의 직급에 따른 인상급여를 조회하려고 한다.
-- 직급이 J1은 10% 인상, J2는 20%인상한 사원의 이름 직급, 인상급여를 조회한다면?

SELECT  EMP_NAME, 
        JOB_ID,
        SALARY,
        DECODE(JOB_ID, 'J1', SALARY*1.1, 'J2', SALARY*1.2, SALARY) AS 인상급여
FROM    EMPLOYEE;

SELECT  EMP_NAME,
        JOB_ID,
        SALARY,
        CASE WHEN JOB_ID = 'J1' THEN SALARY*1.1 
             WHEN JOB_ID = 'J2' THEN SALARY*1.2 
             ELSE SALARY 
        END AS 인상급여
FROM    EMPLOYEE;

--사원테이블에서 급여정보를 가지고 급여등급을 조회하려고 한다
--급여가 3000000이하면 C, 4000000 이하면 B, 4000000 이상이면 A등급인 사원의 이름,급여,급여등급을 조회한다면?
--정렬을 위해서는 ORDER BY 기준컬럼 [ASC | DESC]
SELECT  EMP_NAME,
        SALARY,
        CASE WHEN SALARY <= 3000000 THEN 'C'
             WHEN SALARY <= 4000000 THEN 'B'
             ELSE 'A'     
        END AS 급여등급
FROM    EMPLOYEE
ORDER BY 급여등급, SALARY DESC;

--사원테이블에서 직원의 이름, 이메일, 이메일아이디를 조회한다면?
SELECT  EMP_NAME,
        EMAIL,
        SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1) AS "EMAIL ID"
FROM    EMPLOYEE;

SELECT  SUM(SALARY), SUM(DISTINCT SALARY)
FROM    EMPLOYEE
WHERE   DEPT_ID = '50'
OR      DEPT_ID IS NULL;

/*ADDITIONAL SELECT -합수 */
--1. 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른순으로 표시하는 SQL 문장을 작성하시오.
--( 단, 헤더는 "학번", "이름", "입학년도" 가 표시되도록 한다.)
SELECT  STUDENT_NO,
        STUDENT_NAME,
        TO_CHAR(ENTRANCE_DATE,'YYYY-MM-DD') AS 입학년도
FROM    TB_STUDENT
WHERE   DEPARTMENT_NO = '002'
ORDER BY 입학년도;

--2. 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 한 명 있다고 한다. 
--그 교수의 이름과 주민번호를 화면에 출력하는 SQL 문장을 작성해 보자.
--(* 이때 올바르게 작성한 SQL 문장의 결과 값이 예상과 다르게 나올 수 있다. 원인이 무엇일지 생각해볼 것)

SELECT  PROFESSOR_NAME,
        PROFESSOR_SSN
FROM    TB_PROFESSOR
WHERE   LENGTH(PROFESSOR_NAME) != 3
ORDER BY LENGTH(PROFESSOR_NAME) ASC;

--3. 춘 기술대학교의 남자 교수들의 이름과 나이를 출력하는 SQL 문장을 작성하시오. 
-- 단이때 나이가 적은 사람에서 많은 사람 순서로 화면에 출력되도록 맊드시오. 
--(단, 교수 중 2000 년 이후 출생자는 없으며 출력 헤더는 "교수이름", "나이"로 핚다. 나이는 ‘만’으로 계산핚다.)

SELECT  PROFESSOR_NAME AS 교수이름,
        TRUNC(MONTHS_BETWEEN(SYSDATE,TO_DATE(SUBSTR(PROFESSOR_SSN,1,6),'RR/MM/DD'))/12,0) AS 나이
FROM    TB_PROFESSOR
ORDER BY 나이;

/*3번 정답*/
SELECT  PROFESSOR_NAME AS 교수이름,
        TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-TO_NUMBER('19'||SUBSTR(PROFESSOR_SSN,1,2)) AS 나이
FROM    TB_PROFESSOR
ORDER BY    나이;

--4. 교수들의 이름 중 성을 제외핚 이름맊 출력하는 SQL 문장을 작성하시오. 
-- 출력 헤더는 `이름` 이 찍히도록 한다. (성이 2 자인 경우는 교수는 없다고 가정하시오)

SELECT  SUBSTR(PROFESSOR_NAME,-2,2) AS 이름
FROM    TB_PROFESSOR;

--5. 춘 기술대학교의 재수생 입학자를 구하려고 한다. 어떻게 찾아낼 것인가?
-- 이때, 19 살에 입학하면 재수를 하지 않은 것으로 간주한다.
-- 1차 시도
SELECT  STUDENT_NO,
        STUDENT_NAME
        
FROM    TB_STUDENT

WHERE   TRUNC(MONTHS_BETWEEN(ENTRANCE_DATE,TO_DATE(SUBSTR(STUDENT_SSN,1,6),'RR/MM/DD'))/12,0)!= 19;
-- 2차 시도
SELECT *
FROM    TB_STUDENT;
WHERE  ((CASE WHEN SUBSTR(ENTRANCE_DATE,1,1)=0 THEN 20 
        ELSE 19 END || 
        TO_NUMBER(SUBSTR(ENTRANCE_DATE,1,2))) - TO_NUMBER((TO_CHAR(TO_DATE(SUBSTR(STUDENT_SSN,1,6),'RR/MM/DD'),'YYYY')))!=19;
/*5번 정답*/
SELECT  STUDENT_NO,
        STUDENT_NAME
FROM    TB_STUDENT
WHERE   TO_NUMBER(TO_CHAR(ENTRANCE_DATE, 'YYYY'))  - TO_NUMBER(TO_CHAR(TO_DATE(SUBSTR(STUDENT_SSN, 1, 2), 'RR'), 'YYYY')) > 19
ORDER BY 1;


-- 6. 2020년 크리스마스는 무슨 요일인가?
SELECT  TO_CHAR(TO_DATE('20201225','YYYYMMDD'),'DAY')
FROM    DUAL;


-- 7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') 은 각각 몇 년 몇월 몇 일을 의미핛까?
-- 또 TO_DATE('99/10/11','RR/MM/DD'), TO_DATE('49/10/11','RR/MM/DD') 은 각각 몇 년 몇 월 몇 일을 의미핛까?

SELECT  TO_CHAR(TO_DATE('99/10/11','YY/MM/DD'),'YYYY/MM/DD'),
        TO_CHAR(TO_DATE('49/10/11','YY/MM/DD'),'YYYY/MM/DD'),
        TO_CHAR(TO_DATE('99/10/11','RR/MM/DD'),'YYYY/MM/DD'),
        TO_CHAR(TO_DATE('49/10/11','RR/MM/DD'),'YYYY/MM/DD')
FROM    DUAL;
/*RETURN: 2099,2049,1999,2049*/

-- 8. 춘 기술대학교의 2000 년도 이후 입학자들은 학번이 A 로 시작하게 되어있다.
-- 2000 년도이전 학번을 받은 학생들의 학번과 이름을 보여주는 SQL 문장을 작성하시오.
SELECT  STUDENT_NO,
        STUDENT_NAME
FROM    TB_STUDENT
WHERE   STUDENT_NO NOT LIKE 'A%'
ORDER BY 1;

-- 9. 학번이 A517178 인 한아름 학생의 학점 총 평점을 구하는 SQL 문을 작성하시오.
-- 단, 이때 출력 화면의 헤더는 "평점" 이라고 찍히게 하고, 점수는 반올림하여 소수점 이하 한자리까지만 표시한다.

SELECT  ROUND(AVG(POINT),1) AS 평점
FROM    TB_GRADE
WHERE   STUDENT_NO = 'A517178'
GROUP BY    STUDENT_NO;

-- 10. 학과별 학생수를 구하여 "학과번호", "학생수(명)" 의 형태로 헤더를 만들어 결과값이 출력되도록 하시오.

SELECT  DEPARTMENT_NO,
        COUNT(STUDENT_NO) AS "학생수(명)"
FROM    TB_STUDENT
GROUP BY    DEPARTMENT_NO
ORDER BY    DEPARTMENT_NO;


-- 11. 지도 교수를 배정받지 못한 학생의 수는 몇 명 정도 되는 알아내는 SQL 문을 작성하시오.

SELECT  COUNT(*)
FROM    TB_STUDENT
WHERE   COACH_PROFESSOR_NO IS NULL;

-- 12. 학번이 A112113 인 김고운 학생의 년도 별 평점을 구하는 SQL 문을 작성하시오. 
-- 단, 이때 출력 화면의 헤더는 "년도", "년도 별 평점" 이라고 찍히게 하고, 점수는 반올림하여 소수점 이하 한 자리까지만 표시한다.
SELECT  SUBSTR(TERM_NO,1,4) AS 년도,
        ROUND(AVG(POINT),1)
FROM    TB_GRADE
WHERE   STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY SUBSTR(TERM_NO,1,4);

-- 13. 학과 별 휴학생 수를 파악하고자 한다. 학과 번호와 휴학생 수를 표시하는 SQL 문장을 작성하시오.

SELECT  DEPARTMENT_NO AS "학과코드명",
        COUNT(CASE WHEN ABSENCE_YN = 'Y' THEN 1 ELSE 0 END)
FROM    TB_STUDENT
GROUP BY    DEPARTMENT_NO
ORDER BY    DEPARTMENT_NO;