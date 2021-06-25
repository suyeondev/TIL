# SQL_Basic

## SQL이란? 

<span style ="color:blue">**S**</span>tructured <span style ="color:blue">**Q**</span>uery <span style ="color:blue">**L**</span>anguage 의 약자로 

- RDBMS로 소통하는 프로그래밍 언어

- **구조화**된 혹은 **구조적**인 __질의 언어__

- 데이터를 한 건씩 처리하는 게 아니라 조건에 맞는 **데이터 전체**를 한번에 처리하는 **집합적 언어**



## SQL의 종류

- DDL(Data Definition Language) - 데이터 정의어

  - CREATE : 객체를 생성

  - DROP : 객체를 삭제(제거)

  - ALTER : 객체를 변경

  - TRUNCATE TABLE : 테이블에 있는 모든 데이터를 삭제 

  - RENAME : 객체 이름을 변경 

    

- DML(Data Manipulation Language) - 데이터 조작어

  - SELECT : 테이블이나 뷰에서 데이터를 조회

  - INSERT : 데이터를 입력

  - UPDATE : 기존에 저장된 데이터를 수정

  - DELETE : 테이블에 있는 데이터를 삭제

  - MERGE : 조건에 따라 INSERT와 UPDATE 수행

    

|                     TRUNCATE TABLE                      |                 DELETE                  |
| :-----------------------------------------------------: | :-------------------------------------: |
|                           DDL                           |                   DML                   |
| 테이블에 있는 모든 데이터 삭제 DELETE보다 속도는 빠른편 | 조건에 맞는 데이터만 선별해서 삭제 가능 |
|                       복원 불가능                       |                복원 가능                |



- TCL(Transaction Control Language) - 트랜젝션 제어어

  - 실수를 방지하기 위해 한번 더 체크하는 기능을 수행

  - COMMIT : DML로 변경된 데이터를 DB에 적용

    ``` sql
    # COMMIT 구문 실행해야 삭제된 내용이 최종 DB에 적용됨.
    COMMIT ;
    ```

  - ROLLBACK : DML로 변경된 데이터를 변경 이전 상태로 되돌린다. (복원)

    ``` SQL
    # ROLLBACK문 실행하면 실수하기 전 상태로 돌아갈 수 있음.
    ROLLBACK ;
    ```



🌟TIP ! 

​	같은 DB에 여러명 접속해서 작업할때, 1명이 UPDATE한 내용이 COMMIT이 안되면 동일한 UPDATE를 사용할 수 없다! 

👉 WHY? 

​	아직 LOCK이 걸려있는 상태(=Table에 아직 반영이 안되서 Data가 동일한 상태)이기 때문에  덮어쓸 수 없게 하기 위해!

👉 SOLUTION?

​	먼저 UPDATE한 사람이 ROLLBACK 또는 COMMIT을 해야 한다!



- DCL(Data Control Language) - 데이터 제어어
  - GRANT : 객체에 대한 권한을 할당
  - REVOKE : 객체에 할당된 권한을 회수

