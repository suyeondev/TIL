# DDL (Data Definition Language)

데이터정의어라고 하며 테이블 외에도 뷰, 인덱스, 시퀀스 등 을 생성하고 삭제, 수정하는데 사용된다.

## 테이블 생성 (CREATE)



**CREATE  TABLE  table_name (**

​			**column_name1	datatype(size)	[option],**

​			**column_name2	datatype(size)	[option],**

​			**column_name3	datatype(size)	[option],**

​			**…** 

​			**[TABLE_CONSTRAINT]**

**);**



- **table_name** : 테이블 이름을 명시한다.

- **column_name1**, **column_name2** : 각각에 맞는 칼럼 이름을 명시한다.

  - <span style ="color:red">**테이블과 칼럼 이름을 정의할 때 제약사항**</span>

    - 30byte를 넘지 않게

    - 언더스코어(_), 문자, 숫자를 사용할 수 있지만, 이름의 첫문자는 반드시 문자로 시작해야 한다.

      

- **datatype(size)** : 칼럼의 데이터 유형과 크기를 명시한다.

  - 오라클에서 제공하는 대표적인 데이터형

  | 데이터 유형 | 데이터형        | 설명                                                         |
  | :---------: | :-------------- | :----------------------------------------------------------- |
  |   문자형    | CHAR(n)         | 고정 길이 문자, 최대 2000byte                                |
  |             | VARCHAR2(n)     | 가변 길이 문자, 최대 4000byte                                |
  |   숫자형    | NUMBER[(p,[s])] | p(1~38,디폴트값은 38)와 s(-84~127,디폴트값은 0)는 십진수 기준, 최대 22byte |
  |   날짜형    | DATE            | BC 4712년 1월 1일부터 9999년 12월 31일 까지 년, 월, 일, 시, 분, 초까지 입력 가능 |



- **[option]** : 각 칼럼들의 제약사항을 명시한다.	

  - 여러 개일 경우 띄어쓰기로 구분하여 나열! 
  -  단, **기본값 먼저 지정**해줘야함!

  - **DEFAULT default_value**  - 기본값을 지정

  - **PRIMARY KEY**                   - 기본키를 지정

  - **REFERENCES**  <span style ="color:ORANGE">**table_name**</span>( <span style ="color:BLUE">**column_name**</span>) - 외래키를 지정

    ​						  └><span style ="color:ORANGE"> **참조할 테이블이름** </span> └> <span style ="color:BLUE">**참조할 칼럼 이름**</span>

  - **NOT NULL**         

    - NULL?     데이터가 없음을 의미                 

    - NULL값을 허용하지 않을 때 = 반드시 값이 들어가야 할 때

      

- **[TABLE_CONSTRAINT]** : 테이블의 제약사항을 명시한다.

  - 기본키를 하나 이상의 컬럼으로 지정할 경우 -> Composite PRIMARY KEY 라고 부른다. 이 경우엔 OPTION부분에선 지정X,

    TABLE_CONSTRAINT부분에서 지정해야함!

    - **PRIMARY KEY(column_name1,column_name2)**

      

  - Composite Primary Key를 외래키로 참조할때, 각각 단독으로 지정X 

    - FOREIGN KEY (column_name1,column_name2)  REFERENCES table_name(column_name3,column_name4) - 2개의 칼럼을 외래키로 지정한 경우 

  - CHECK   값에 범위제한을 주는 경우에 사용!(고정값으로 제한)

    -  EX1) **CHECK(CATEGORY IN('드라마','코미디','액션','아동','SF','다큐멘터리'))**  
    - EX2) **CHECK(POINT >= 5)**

  - UNIQUE - 유일키로 지정

  - NOT NULL은 OPTION부분에서!

###  추가 설명

- PRIMARY KEY - 테이블에서 유일한 값을 식별하는 역할을 하며 테이블 당 1개만 만들 수 있다.

  - 2개 이상의 칼럼을 하나의 기본키로 지정해서 1테이블당 1개!

  - 기본키 칼럼에는 반드시 NOT NULL 을 명시해야함.

  - 기본키에  중복된 값을 입력하면 오라클은 오류를 반환하며 해당 입력작업은 취소된다. 

    

### 테이블 생성 예시

**CREATE TABLE    RENTAL(**
    **BOOK_DATE   DATE        DEFAULT SYSDATE,**
    **MEMBER_ID   NUMBER(10)  REFERENCES MEMBER(MEMBER_ID),**
    **COPY_ID     NUMBER(10) ,** 
    **TITLE_ID    NUMBER(10) ,**
    **ACT_RET_DATE    DATE,**
    **EXP_RET_DATE    DATE    DEFAULT SYSDATE+2,**
    **FOREIGN KEY(COPY_ID, TITLE_ID) REFERENCES TITLE_COPY(COPY_ID,TITLE_ID),**
    **PRIMARY KEY( BOOK_DATE, MEMBER_ID, COPY_ID, TITLE_ID)**
**);**

## 테이블 삭제 (DROP)



**DROP  TABLE  table_name;**

단, 다른테이블과 참조관계나, 제약관계에 있다면,

**DROP TABLE 테이블 이름 [CASCADE CONSTRAINTS]**  로 작성해줘야 삭제 가능



## 테이블 변경(ALTER)

**ALTER TABLE table_name;**

 - 칼럼 추가(ADD)

   	- **ALTER TABLE table_name ADD (column_name datatype(size));**

 - 칼럼 수정(MODIFY)

   	- **ALTER TABLE table_name MODIFY(column_name datatype(size));**

 - 칼럼 삭제(DROP)

   	- **ALTER TABLE table_name DROP COLUMN column_name;**

 - 칼럼이름변경(RENAME)

    - **ALTER TABLE table_name RENAME COLUMN 이전컬럼이름 TO 바꿀컬럼이름;**

      

