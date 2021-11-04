--#1. 다음 설정을 참조하여 CUSTOMERS, ORDERS, PRODUCTS, ORDERDETAIL 테이블을 생성하라.

CREATE TABLE CUSTOMERS (
    CNO NUMBER(5) PRIMARY KEY,
    CNAME VARCHAR2(10) NOT NULL,
    ADDRESS VARCHAR2(50) NOT NULL,
    EMAIL VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(20) NOT NULL );


CREATE TABLE ORDERS (
    ORDERNO NUMBER(10) PRIMARY KEY,
    ORDERDATE VARCHAR2(10) DEFAULT SYSDATE NOT NULL,
    ADDRESS VARCHAR2(50) NOT NULL,
    PHONE VARCHAR2(20) NOT NULL,
    STATUS VARCHAR2(20) CHECK(STATUS IN ('결제완료', '배송중', '배송완료')),
    CNO NUMBER(5) NOT NULL,
    FOREIGN KEY(CNO) REFERENCES CUSTOMERS(CNO));
    
CREATE TABLE PRODUCTS (
    PNO NUMBER(5) PRIMARY KEY,
    PNAME VARCHAR2(20) NOT NULL,
    COST NUMBER(8) DEFAULT 0 NOT NULL ,
    STOCK NUMBER(5) DEFAULT 0 NOT NULL);


CREATE TABLE ORDERDETAIL(
    ORDERNO NUMBER(10), 
    PNO NUMBER(5),
    QTY NUMBER(5) DEFAULT 0,
    COST NUMBER(8) DEFAULT 0,
    PRIMARY KEY (ORDERNO, PNO),
    FOREIGN KEY (ORDERNO) REFERENCES ORDERS(ORDERNO),
    FOREIGN KEY (PNO) REFERENCES PRODUCTS(PNO));


--#2. PRODUCTS 테이블에 다음 데이터를 입력하시오.
INSERT INTO PRODUCTS VALUES (1001, '삼양라면', 1000, 200) ;
INSERT INTO PRODUCTS VALUES (1002, '새우깡', 1500, 500) ;
INSERT INTO PRODUCTS VALUES (1003, '월드콘', 2000, 350) ;
INSERT INTO PRODUCTS VALUES (1004, '빼빼로', 2000, 700) ;
INSERT INTO PRODUCTS VALUES (1005, '코카콜라', 1800, 550) ;
INSERT INTO PRODUCTS VALUES (1006, '환타', 1600, 300) ;
COMMIT;


--#3. CUSTOMERS 테이블에 다음 데이터를 입력하시오.

INSERT INTO CUSTOMERS VALUES (101, '김철수', '서울 강남구', 'cskim@naver.com', '899-6666');
INSERT INTO CUSTOMERS VALUES (102, '이영희', '부산 서면', 'yhlee@empal.com', '355-8882');
INSERT INTO CUSTOMERS VALUES (103, '최진국', '제주 동광양', 'jkchoi@gmail.com', '852-5764');
INSERT INTO CUSTOMERS VALUES (104, '강준호', '강릉 홍제동', 'jhkang@hanmail.com', '559-7777');
INSERT INTO CUSTOMERS VALUES (105, '민병국', '대전 전민동', 'bgmin@hotmail.com', '559-8741');
INSERT INTO CUSTOMERS VALUES (106, '오민수', '광주 북구', 'msoh@microsoft.com', '542-9988');
COMMIT;

--#4. 다음과 같은 주문 정보를 ORDERS 테이블과 ORDERDETAIL 테이블에 입력하시오.
-- CNO는 CUSTOMERS 테이블에서 검색하여 입력할 것.
-- ORDERS에 1건,ORDERDETAIL에 1건을 입력한다
-- "김철수(101)가 3일 전에 삼양라면(1001)을 개당 1000원에 50개 주문하였다."

INSERT INTO ORDERS (ORDERNO, ORDERDATE, ADDRESS, PHONE, STATUS, CNO)
    VALUES (1, SYSDATE-3, '서울 강남구', '899-6666', '결제완료', (SELECT CNO FROM CUSTOMERS WHERE CNAME = '김철수'));

INSERT INTO ORDERDETAIL (ORDERNO, PNO, QTY, COST)   
    VALUES (1, (SELECT PNO FROM PRODUCTS WHERE PNAME ='삼양라면'), 
                    50, 1000);

----
SELECT * FROM ORDERS;  -- ORDERNO, ORDERDATE, ADDRESS, PHONE, STATUS, CNO
SELECT * FROM ORDERDETAIL;  -- ORDERNO, PNO, QTY, COST
SELECT * FROM CUSTOMERS;  --- CNO, CNAME, ADDRESS, EMAIL, PHONE
SELECT * FROM PRODUCTS;  ---PNO, PNAME, COST, STOCK
---
                    
--#5.위와 같은 주문 정보에서 해당 상품의 재고(stock)를 수정하시오.
-- "삼양라면(1001)의 재고를 150(=200-50)개로 변경한다."
                    
UPDATE PRODUCTS
SET STOCK = 150
WHERE PNO = '1001';

--#6. 다음과 같은 주문 정보를 orders 테이블과 orderdetail 테이블에 입력하시오. CNO는 CUSTOMERS 테이블에서 검색하여 입력할 것
-- orders에 1건, orderdetail에 2건을 입력한다.
-- "이영희(102)가 이틀전에 새우깡(1002)을 개당 1500원에 100개, 월드콘(1003)을 개당 2000원에 150개 주문하였다"

INSERT INTO ORDERS (ORDERNO, ORDERDATE, ADDRESS, PHONE, STATUS, CNO)
    VALUES (2, SYSDATE-2, '부산 수영구', '337-5000', '결제완료', (SELECT CNO FROM CUSTOMERS WHERE CNAME = '이영희'));

INSERT INTO ORDERDETAIL (ORDERNO, PNO, QTY, COST)   
    VALUES (2, (SELECT PNO FROM PRODUCTS WHERE PNAME ='새우깡'), 
                    100, 1500);

INSERT INTO ORDERDETAIL (ORDERNO, PNO, QTY, COST)   
    VALUES (2, (SELECT PNO FROM PRODUCTS WHERE PNAME ='월드콘'), 
                    150, 2000);


--#7.위와 같은 주문 정보에서 해당 상품의 재고를 수정하시오.
-- "새우깡(1002)의 재고를 400(=500-100)개로 변경한다"
-- "월드콘(1003)의 재고를 200(=350-150)개로 변경한다"

UPDATE PRODUCTS
SET STOCK = 400
WHERE PNO = '1002';

UPDATE PRODUCTS
SET STOCK = 200
WHERE PNO = '1003';


--#8. 다음과 같은 주문 정보를 orders 테이블과 orderdetail 테이블에 입력하시오. CNO는 CUSTOMERS 테이블에서 검색하여 입력할 것.
-- ORDERS에 1건, ORDERDETAIL에 2건 입력한다.
-- "오민수(106)가 어제 빼빼로(1004)를 개당 2000원에 100개, 코카콜라(1005)를 개당 1800원에 50개 주문하였다"

INSERT INTO ORDERS (ORDERNO, ORDERDATE, ADDRESS, PHONE, STATUS, CNO)
    VALUES (3, SYSDATE-1, '광주 북구', '652-2277', '결제완료', (SELECT CNO FROM CUSTOMERS WHERE CNAME = '오민수'));

INSERT INTO ORDERDETAIL (ORDERNO, PNO, QTY, COST)   
    VALUES (3, (SELECT PNO FROM PRODUCTS WHERE PNAME ='빼빼로'), 
                    100, 2000);

INSERT INTO ORDERDETAIL (ORDERNO, PNO, QTY, COST)   
    VALUES (3, (SELECT PNO FROM PRODUCTS WHERE PNAME ='코카콜라'), 
                    50, 1800);


--#9. 위와 같은 주문 정보에서 해당 상품의 재고를 수정하시오.
-- "빼뺴로(1004)의 재고를 600(=700-100)개로 변경한다"
-- "코카콜라(1005)의 재고를 500(=550-50)개로 변경한다"

UPDATE PRODUCTS
SET STOCK = 600
WHERE PNO = '1004';

UPDATE PRODUCTS
SET STOCK = 500
WHERE PNO = '1005';


--#10.다음과 같은 전체 주문 목록을 출력하는 문장을 작성하시오.

SELECT A.ORDERDATE, 
              C.CNAME, 
              A.ADDRESS, 
              A.PHONE, 
              A.STATUS, 
              D.PNAME, 
              D.COST, B.QTY,
              D.COST*B.QTY AS "COST*QTY"
FROM ORDERS A
JOIN ORDERDETAIL B USING (ORDERNO)
JOIN CUSTOMERS C USING (CNO)
JOIN PRODUCTS D USING (PNO);

--#11. 다음과 같이 일별 매출목록을 출력하는 문장을 작성하시오.

SELECT A.ORDERDATE, 
            SUM(D.COST*B.QTY)
FROM ORDERS A
JOIN ORDERDETAIL B USING (ORDERNO)
JOIN CUSTOMERS C USING (CNO)
JOIN PRODUCTS D USING (PNO)
GROUP BY A.ORDERDATE
ORDER BY 1;

--#12. 다음과 같은 신규 상품 정보를 PRODUCTS 테이블에 입력하시오.
-- "제품번호는 1007, 상품명은 목캔디, 단가는 3000원, 재고는 500개이다. 

INSERT INTO PRODUCTS VALUES (1007, '목캔디', 3000, 500) ;


--#13. 다음과 같은 4번 주문 정보를 입력하고, 재고를 적절히 수정하시오. 
-- 주문 정보를 입력하고, 10번 문제에서 작성한 문장으로 검색하면 다음과 같다.
-- "최진국(103)이 오늘 목캔디(1007)를 개당 3000원에 200개 주문하였으며, 배송지의 주소는 제주 동광양이며, 연락처는 352-4657이고, 결제가 완료된 상태이다"
--- 주문 정보 입력 
INSERT INTO ORDERS (ORDERNO, ORDERDATE, ADDRESS, PHONE, STATUS, CNO)
    VALUES (4, SYSDATE, '제주 동광양', '352-4657', '결제완료', (SELECT CNO FROM CUSTOMERS WHERE CNAME = '최진국'));


INSERT INTO ORDERDETAIL (ORDERNO, PNO, QTY, COST)   
    VALUES (4, (SELECT PNO FROM PRODUCTS WHERE PNAME ='목캔디'), 
                    200, 3000);

--- 재고 수정
UPDATE PRODUCTS
SET STOCK = (500-200)
WHERE PNO = '1007';


--- 재고 확인
SELECT * FROM PRODUCTS;


--- 전체 주문상태 확인
SELECT A.ORDERDATE, 
              C.CNAME, 
              A.ADDRESS, 
              A.PHONE, 
              A.STATUS, 
              D.PNAME, 
              D.COST, B.QTY,
              D.COST*B.QTY AS "COST*QTY"
FROM ORDERS A
JOIN ORDERDETAIL B USING (ORDERNO)
JOIN CUSTOMERS C USING (CNO)
JOIN PRODUCTS D USING (PNO);

