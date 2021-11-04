--#1. ���� ������ �����Ͽ� CUSTOMERS, ORDERS, PRODUCTS, ORDERDETAIL ���̺��� �����϶�.

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
    STATUS VARCHAR2(20) CHECK(STATUS IN ('�����Ϸ�', '�����', '��ۿϷ�')),
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


--#2. PRODUCTS ���̺� ���� �����͸� �Է��Ͻÿ�.
INSERT INTO PRODUCTS VALUES (1001, '�����', 1000, 200) ;
INSERT INTO PRODUCTS VALUES (1002, '�����', 1500, 500) ;
INSERT INTO PRODUCTS VALUES (1003, '������', 2000, 350) ;
INSERT INTO PRODUCTS VALUES (1004, '������', 2000, 700) ;
INSERT INTO PRODUCTS VALUES (1005, '��ī�ݶ�', 1800, 550) ;
INSERT INTO PRODUCTS VALUES (1006, 'ȯŸ', 1600, 300) ;
COMMIT;


--#3. CUSTOMERS ���̺� ���� �����͸� �Է��Ͻÿ�.

INSERT INTO CUSTOMERS VALUES (101, '��ö��', '���� ������', 'cskim@naver.com', '899-6666');
INSERT INTO CUSTOMERS VALUES (102, '�̿���', '�λ� ����', 'yhlee@empal.com', '355-8882');
INSERT INTO CUSTOMERS VALUES (103, '������', '���� ������', 'jkchoi@gmail.com', '852-5764');
INSERT INTO CUSTOMERS VALUES (104, '����ȣ', '���� ȫ����', 'jhkang@hanmail.com', '559-7777');
INSERT INTO CUSTOMERS VALUES (105, '�κ���', '���� ���ε�', 'bgmin@hotmail.com', '559-8741');
INSERT INTO CUSTOMERS VALUES (106, '���μ�', '���� �ϱ�', 'msoh@microsoft.com', '542-9988');
COMMIT;

--#4. ������ ���� �ֹ� ������ ORDERS ���̺�� ORDERDETAIL ���̺� �Է��Ͻÿ�.
-- CNO�� CUSTOMERS ���̺��� �˻��Ͽ� �Է��� ��.
-- ORDERS�� 1��,ORDERDETAIL�� 1���� �Է��Ѵ�
-- "��ö��(101)�� 3�� ���� �����(1001)�� ���� 1000���� 50�� �ֹ��Ͽ���."

INSERT INTO ORDERS (ORDERNO, ORDERDATE, ADDRESS, PHONE, STATUS, CNO)
    VALUES (1, SYSDATE-3, '���� ������', '899-6666', '�����Ϸ�', (SELECT CNO FROM CUSTOMERS WHERE CNAME = '��ö��'));

INSERT INTO ORDERDETAIL (ORDERNO, PNO, QTY, COST)   
    VALUES (1, (SELECT PNO FROM PRODUCTS WHERE PNAME ='�����'), 
                    50, 1000);

----
SELECT * FROM ORDERS;  -- ORDERNO, ORDERDATE, ADDRESS, PHONE, STATUS, CNO
SELECT * FROM ORDERDETAIL;  -- ORDERNO, PNO, QTY, COST
SELECT * FROM CUSTOMERS;  --- CNO, CNAME, ADDRESS, EMAIL, PHONE
SELECT * FROM PRODUCTS;  ---PNO, PNAME, COST, STOCK
---
                    
--#5.���� ���� �ֹ� �������� �ش� ��ǰ�� ���(stock)�� �����Ͻÿ�.
-- "�����(1001)�� ��� 150(=200-50)���� �����Ѵ�."
                    
UPDATE PRODUCTS
SET STOCK = 150
WHERE PNO = '1001';

--#6. ������ ���� �ֹ� ������ orders ���̺�� orderdetail ���̺� �Է��Ͻÿ�. CNO�� CUSTOMERS ���̺��� �˻��Ͽ� �Է��� ��
-- orders�� 1��, orderdetail�� 2���� �Է��Ѵ�.
-- "�̿���(102)�� ��Ʋ���� �����(1002)�� ���� 1500���� 100��, ������(1003)�� ���� 2000���� 150�� �ֹ��Ͽ���"

INSERT INTO ORDERS (ORDERNO, ORDERDATE, ADDRESS, PHONE, STATUS, CNO)
    VALUES (2, SYSDATE-2, '�λ� ������', '337-5000', '�����Ϸ�', (SELECT CNO FROM CUSTOMERS WHERE CNAME = '�̿���'));

INSERT INTO ORDERDETAIL (ORDERNO, PNO, QTY, COST)   
    VALUES (2, (SELECT PNO FROM PRODUCTS WHERE PNAME ='�����'), 
                    100, 1500);

INSERT INTO ORDERDETAIL (ORDERNO, PNO, QTY, COST)   
    VALUES (2, (SELECT PNO FROM PRODUCTS WHERE PNAME ='������'), 
                    150, 2000);


--#7.���� ���� �ֹ� �������� �ش� ��ǰ�� ��� �����Ͻÿ�.
-- "�����(1002)�� ��� 400(=500-100)���� �����Ѵ�"
-- "������(1003)�� ��� 200(=350-150)���� �����Ѵ�"

UPDATE PRODUCTS
SET STOCK = 400
WHERE PNO = '1002';

UPDATE PRODUCTS
SET STOCK = 200
WHERE PNO = '1003';


--#8. ������ ���� �ֹ� ������ orders ���̺�� orderdetail ���̺� �Է��Ͻÿ�. CNO�� CUSTOMERS ���̺��� �˻��Ͽ� �Է��� ��.
-- ORDERS�� 1��, ORDERDETAIL�� 2�� �Է��Ѵ�.
-- "���μ�(106)�� ���� ������(1004)�� ���� 2000���� 100��, ��ī�ݶ�(1005)�� ���� 1800���� 50�� �ֹ��Ͽ���"

INSERT INTO ORDERS (ORDERNO, ORDERDATE, ADDRESS, PHONE, STATUS, CNO)
    VALUES (3, SYSDATE-1, '���� �ϱ�', '652-2277', '�����Ϸ�', (SELECT CNO FROM CUSTOMERS WHERE CNAME = '���μ�'));

INSERT INTO ORDERDETAIL (ORDERNO, PNO, QTY, COST)   
    VALUES (3, (SELECT PNO FROM PRODUCTS WHERE PNAME ='������'), 
                    100, 2000);

INSERT INTO ORDERDETAIL (ORDERNO, PNO, QTY, COST)   
    VALUES (3, (SELECT PNO FROM PRODUCTS WHERE PNAME ='��ī�ݶ�'), 
                    50, 1800);


--#9. ���� ���� �ֹ� �������� �ش� ��ǰ�� ��� �����Ͻÿ�.
-- "������(1004)�� ��� 600(=700-100)���� �����Ѵ�"
-- "��ī�ݶ�(1005)�� ��� 500(=550-50)���� �����Ѵ�"

UPDATE PRODUCTS
SET STOCK = 600
WHERE PNO = '1004';

UPDATE PRODUCTS
SET STOCK = 500
WHERE PNO = '1005';


--#10.������ ���� ��ü �ֹ� ����� ����ϴ� ������ �ۼ��Ͻÿ�.

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

--#11. ������ ���� �Ϻ� �������� ����ϴ� ������ �ۼ��Ͻÿ�.

SELECT A.ORDERDATE, 
            SUM(D.COST*B.QTY)
FROM ORDERS A
JOIN ORDERDETAIL B USING (ORDERNO)
JOIN CUSTOMERS C USING (CNO)
JOIN PRODUCTS D USING (PNO)
GROUP BY A.ORDERDATE
ORDER BY 1;

--#12. ������ ���� �ű� ��ǰ ������ PRODUCTS ���̺� �Է��Ͻÿ�.
-- "��ǰ��ȣ�� 1007, ��ǰ���� ��ĵ��, �ܰ��� 3000��, ���� 500���̴�. 

INSERT INTO PRODUCTS VALUES (1007, '��ĵ��', 3000, 500) ;


--#13. ������ ���� 4�� �ֹ� ������ �Է��ϰ�, ��� ������ �����Ͻÿ�. 
-- �ֹ� ������ �Է��ϰ�, 10�� �������� �ۼ��� �������� �˻��ϸ� ������ ����.
-- "������(103)�� ���� ��ĵ��(1007)�� ���� 3000���� 200�� �ֹ��Ͽ�����, ������� �ּҴ� ���� �������̸�, ����ó�� 352-4657�̰�, ������ �Ϸ�� �����̴�"
--- �ֹ� ���� �Է� 
INSERT INTO ORDERS (ORDERNO, ORDERDATE, ADDRESS, PHONE, STATUS, CNO)
    VALUES (4, SYSDATE, '���� ������', '352-4657', '�����Ϸ�', (SELECT CNO FROM CUSTOMERS WHERE CNAME = '������'));


INSERT INTO ORDERDETAIL (ORDERNO, PNO, QTY, COST)   
    VALUES (4, (SELECT PNO FROM PRODUCTS WHERE PNAME ='��ĵ��'), 
                    200, 3000);

--- ��� ����
UPDATE PRODUCTS
SET STOCK = (500-200)
WHERE PNO = '1007';


--- ��� Ȯ��
SELECT * FROM PRODUCTS;


--- ��ü �ֹ����� Ȯ��
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

