/* 
SELECT문 BASIC 실습
AS : 칼럼의 별칭을 지정해준다.(생략도 가능)
- 효과 : 컬럼 별칭을 사용하면 SELECT 젃에 기술된 내용과 동일하게 표시되는 실행 결과 헤더
부분을 변경할 수 있음
*/

-- 1. EMPLOYEE 테이블에서 이름, 1년급여, 총소득을 출력해라. 

SELECT  EMP_NAME AS 이름,
        SALARY * 12 AS "1년 급여",
        ( SALARY + (SALARY * BONUS_PCT)) * 12 AS 총소득
FROM    EMPLOYEE;

/* 
Literal(리터럴) : 임의로 지정한 문자열
SELECT절에 사용하면 테이블에 졲재하는 데이터처럼 사용할 수 있다
리터럴은 Result Set의 모든행에 반복적으로표시됨
*/

-- 2. EMPLOYEE 테이블에서 아이디, 이름, 근무여부는 재직으로 출력해라
SELECT  EMP_ID,
        EMP_NAME,
        '재직' AS 근무여부
FROM    EMPLOYEE ;

/* 
DISTINCT: 컬럼에 포함된 중복 값을 한번씩맊 표시하고자 할 때 사용
? SELECT 젃에 1회맊 기술
? 컬럼 별로 적용 불가능
? 여러 개 컬럼을 조회하는 경우에는 조회 대상 컬럼들의 조합 결과를 기준으로 중복 여부 판단
*/

-- 3.EMPLOYEE 테이블에서 DEPT_ID를 중복없이 출력해라
SELECT DISTINCT DEPT_ID
FROM    EMPLOYEE;

-- 4.EMPLOYEE 테이블에서 JOB_ID 와 DEPT_ID를 중복없이 출력해라
SELECT DISTINCT JOB_ID, DEPT_ID
FROM    EMPLOYEE;

-- 5.EMPLOYEE 테이블에서 부서번호가 90인 직원의 이름과 부서를 출력해라
SELECT  EMP_NAME AS 이름,
        DEPT_ID AS 부서
FROM    EMPLOYEE
WHERE   DEPT_ID = 90;

-- 6. EMPLOYEE 테이블에서 SALARY 값 이 4000000보다 큰 직원의 이름과 급여를 출력해라 
SELECT  EMP_NAME AS 이름,
        SALARY AS 급여
FROM    EMPLOYEE
WHERE   SALARY > 4000000;

-- 7.  EMPLOYEE 테이블에서 부서 번호가 '90'이고 급여를 2000000보다 많이 받는 부서원 이름과 부서 번호, 급여를 출력해라.
SELECT  EMP_NAME AS 이름,
        DEPT_ID AS 부서,
        SALARY AS 급여
FROM    EMPLOYEE
WHERE   DEPT_ID = '90'
AND     SALARY > 2000000;

-- 8.  EMPLOYEE 테이블에서 '90' 부서나 '20' 부서에 소속된 부서원 이름, 부서 코드, 급여를 출력해라.
SELECT  EMP_NAME AS 이름,
        DEPT_ID AS 부서,
        SALARY AS 급여
FROM    EMPLOYEE
WHERE   DEPT_ID = '90'
OR      DEPT_ID = '20';


/* 
연결연산자('||') : 여러 컬럼을 하나의 컬럼인 것처럼 연결하거나, 컬럼과 리터럴을 연결할 수 있다.
*/

-- 9. 직원번호, 직원이름, 급여를 연결하여 출력해라.
SELECT  EMP_ID||EMP_NAME||SALARY
FROM    EMPLOYEE;


-- 10. 컬럼과 리터럴을 연결한 경우 - (직원이름)의 월급은(급여)원입니다. 형식으로 출력해라
SELECT  EMP_NAME||'의 월급은'||SALARY||'원 입니다.'
FROM    EMPLOYEE;

/*
논리연산자(AND, OR, NOT)
AND : 여러 조건이 동시에 TRUE 일 경우에맊 TRUE 값 반환
OR : 여러 조건들 중에 어느 하나의 조건맊 TRUE이면 TRUE 값 반환
NOT: 조건에 대한 반대 값으로 반환 (NULL 예외)

비교연산자 
= : 같다
>, < : 크다/작다
>= , <= : 크거나 같다/ 작거나 같다 
<> , !=, ^= : 같지 않다
BETWEEN AND : 특정 범위에 포함되는지 비교
LIKE/NOT LIKE : 문자 패턴을 비교
IS NULL / IS NOT NULL :  NULL 여부 비교
IN :  비교 값 목록에 포함되는지 여부 비교

*/

-- 11. 급여를 3,500,000원 보다 맋이 받고 5,500,000원 보다 적게 받는 직원 이름과 급여 조회
SELECT  EMP_NAME,
        SALARY
FROM    EMPLOYEE
WHERE   SALARY BETWEEN 3500000 AND 5500000;

-- 12. '김'씨 성을 가짂 직원 이름과 급여 조회해라
SELECT  EMP_NAME, SALARY
FROM    EMPLOYEE
WHERE   EMP_NAME LIKE '김%';

-- 13. 9000번 대 4자리 국번의 전화번호를 사용하는 직원 전화번호 조회헤라
SELECT  EMP_NAME, PHONE
FROM    EMPLOYEE
WHERE   PHONE LIKE '___9_______';

--14. EMAIL ID 중 '_' 앞 자리가 3자리인 직원 조회해라
SELECT  *
FROM    EMPLOYEE
WHERE   EMAIL LIKE '___\_%' ESCAPE '\';

--15. 관리자도 없고 부서 배치도 받지 않은 직원 이름 조회해라
SELECT *
FROM    EMPLOYEE
WHERE   DEPT_ID IS NOT NULL
AND     MGR_ID IS NOT NULL;

--16.60번 부서나 90번 부서원들의 이름, 부서 코드, 급여 조회해라
SELECT  *
FROM    EMPLOYEE
WHERE   DEPT_ID IN ('60', '90');

-- 17. 20번 또는 90번 부서원 중 급여를 3000000원 보다 맋이 받는 직원 이름, 급여, 부서코드를 조회해라
SELECT  *
FROM    EMPLOYEE
WHERE   (DEPT_ID = '20'
OR      DEPT_ID = '90')
AND     SALARY >= 3000000 ;

/*BASIC SELECT 문제 */
--1. 춘 기술대학교의 학과 이름과 계열을 표시하시오. 단, 출력 헤더는 "학과 명", "계열" 으로 표시하도록 한다.
SELECT  DEPARTMENT_NAME AS "학과 명", 
        CATEGORY AS 계열
FROM    TB_DEPARTMENT ;

--2. 학과의 학과 정원을 다음과 같은 형태로 화면에 출력핚다.
SELECT  DEPARTMENT_NAME||'의 정원은 '||CAPACITY||'명 입니다.' AS "학과별 정원"
FROM    TB_DEPARTMENT;

--3. "국어국문학과" 에 다니는 여학생 중 현재 휴학중인 여학생을 찾아달라는 요청이 들어왔다. 누구인가? 
-- (국문학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서 찾아 내도록 하자)

SELECT  STUDENT_NAME
FROM    TB_STUDENT
WHERE   ABSENCE_YN = 'Y'
AND     STUDENT_SSN LIKE '_______2%'
AND     DEPARTMENT_NO = '001';

--4. 도서관에서 대출 도서 장기 연체자 들을 찾아 이름을 게시하고자 한다. 
--그 대상자들의 학번이 다음과 같을 때 대상자들을 찾는 적절한 SQL 구문을 작성하시오.
-- A513079, A513090, A513091, A513110, A513119

SELECT  STUDENT_NAME
FROM    TB_STUDENT 
WHERE   STUDENT_NO IN ('A513079','A513090','A513091','A513110','A513119');


--5. 입학정원이 20 명 이상 30 명 이하인 학과들의 학과 이름과 계열을 출력하시오.

SELECT  DEPARTMENT_NAME,CATEGORY
FROM    TB_DEPARTMENT
WHERE   CAPACITY BETWEEN 20 AND 30 ;

--6. 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속 학과를 가지고 있다. 
--그럼 춘기술대학교 총장의 이름을 알아낼 수 있는 SQL 문장을 작성하시오.

SELECT  PROFESSOR_NAME
FROM    TB_PROFESSOR
WHERE   DEPARTMENT_NO IS NULL;

--7. 혹시 젂산상의 착오로 학과가 지정되어 있지 않은 학생이 있는지 확인하고자 한다. 
-- 어떠한 SQL 문장을 사용하면 될 것인지 작성하시오.
SELECT  *
FROM    TB_STUDENT
WHERE   DEPARTMENT_NO IS NULL;

--8. 수강신청을 하려고 핚다. 선수과목 여부를 확인해야 하는데, 선수과목이 존재하는 과목들은 어떤 과목인지 과목번호를 조회해보시오.

SELECT  CLASS_NO
FROM    TB_CLASS
WHERE   PREATTENDING_CLASS_NO IS NOT NULL;

--9. 춘 대학에는 어떤 계열(CATEGORY)들이 있는지 조회해보시오.

SELECT  DISTINCT CATEGORY
FROM    TB_DEPARTMENT;

--10. 02 학번 전주 거주자들의 모임을 만들려고 한다.
-- 휴학한 사람들은 제외한 재학중인 학생들의 학번, 이름, 주민번호를 출력하는 구문을 작성하시오

SELECT  STUDENT_NO
        ,STUDENT_NAME
        ,STUDENT_SSN
FROM    TB_STUDENT
WHERE   STUDENT_ADDRESS LIKE '전주시%'
AND     ABSENCE_YN = 'N'
AND     ENTRANCE_DATE LIKE '02%';

/* ADDITIONAL SELECT*/

SELECT  LENGTH(CHARTYPE),
        LENGTH(VARCHARTYPE)
FROM    COLUMN_LENGTH;

-- id@vcc.com중에 vcc의 마지막 c의 위치를 구해라
SELECT  EMAIL,
        INSTR( EMAIL, 'c',-1,2 ) AS 위치
FROM    EMPLOYEE;

-- id@vcc.com중에 vcc의 마지막 c의 위치를 구해라 (다른방법)
SELECT  EMAIL,
        INSTR( EMAIL, 'c', INSTR(EMAIL,'.')-1) AS 위치
FROM    EMPLOYEE;


SELECT  EMAIL AS 원본데이터,
        LENGTH(EMAIL) AS 원본길이,
        RPAD(EMAIL, 20, '.') AS 적용결과,
        LENGTH(LPAD(EMAIL, 20, '.')) AS 결과길이
FROM    EMPLOYEE;

-- 문자열 다루기 실습
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
        SUBSTR(HIRE_DATE,1,2)||'년 '||SUBSTR(HIRE_DATE,4,2)||'월 '||SUBSTR(HIRE_DATE,7,2)||'일' AS 입사일
FROM    EMPLOYEE ;