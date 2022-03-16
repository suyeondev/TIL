/*
������ �м�
���� ���� : ������ ���� SQL

--������ ����--
�ڷ�� :	������ܺ� ��������Ȳ
��ó	: ���䱳���
�ڷᱸ��Ⱓ : 1980 ~ 2020
������Ʈ �ֱ� : �ų�
���� ������Ʈ�� : 2022.02.14
������ǥ	: ��� �߻��Ǽ�(��), ����ڼ�(��)

*/

-- ���̺� ����
CREATE TABLE traffic_accident 
(
    year                NUMBER          NOT NULL,  -- ����
    trans_type          VARCHAR2(30)    NOT NULL,  -- �������       
    total_acct_num      NUMBER,                    -- ��� �Ǽ�
    death_person_num    NUMBER,                     -- ����� �� 
    PRIMARY KEY (year, trans_type)
);

-- ������ �Է� (1980-2020)
insert into traffic_accident values(1980,'�ڵ���',120182,5608);
insert into traffic_accident values(1981,'�ڵ���',123373,5804);
insert into traffic_accident values(1982,'�ڵ���',141128,6110);
insert into traffic_accident values(1983,'�ڵ���',170026,6834);
insert into traffic_accident values(1984,'�ڵ���',134335,7468);
insert into traffic_accident values(1985,'�ڵ���',146836,7522);
insert into traffic_accident values(1986,'�ڵ���',153777,7702);
insert into traffic_accident values(1987,'�ڵ���',175661,7206);
insert into traffic_accident values(1988,'�ڵ���',225062,11563);
insert into traffic_accident values(1989,'�ڵ���',255787,12603);
insert into traffic_accident values(1990,'�ڵ���',255303,12325);
insert into traffic_accident values(1991,'�ڵ���',265964,13429);
insert into traffic_accident values(1992,'�ڵ���',257194,11640);
insert into traffic_accident values(1993,'�ڵ���',260921,10402);
insert into traffic_accident values(1994,'�ڵ���',266107,10087);
insert into traffic_accident values(1995,'�ڵ���',248865,10323);
insert into traffic_accident values(1996,'�ڵ���',265052,12653);
insert into traffic_accident values(1997,'�ڵ���',246452,11603);
insert into traffic_accident values(1998,'�ڵ���',239721,9057);
insert into traffic_accident values(1999,'�ڵ���',275938,9353);
insert into traffic_accident values(2000,'�ڵ���',290481,10236);
insert into traffic_accident values(2001,'�ڵ���',260579,8097);
insert into traffic_accident values(2002,'�ڵ���',231026,7222);
insert into traffic_accident values(2003,'�ڵ���',240832,7212);
insert into traffic_accident values(2004,'�ڵ���',220755,6563);
insert into traffic_accident values(2005,'�ڵ���',214171,6376);
insert into traffic_accident values(2006,'�ڵ���',213745,6327);
insert into traffic_accident values(2007,'�ڵ���',211662,6166);
insert into traffic_accident values(2008,'�ڵ���',215822,5870);
insert into traffic_accident values(2009,'�ڵ���',231990,5838);
insert into traffic_accident values(2010,'�ڵ���',226878,5505);
insert into traffic_accident values(2011,'�ڵ���',221711,5229);
insert into traffic_accident values(2012,'�ڵ���',223656,5392);
insert into traffic_accident values(2013,'�ڵ���',215354,5092);
insert into traffic_accident values(2014,'�ڵ���',223552,4762);
insert into traffic_accident values(2015,'�ڵ���',232035,4621);
insert into traffic_accident values(2016,'�ڵ���',220917,4292);
insert into traffic_accident values(2017,'�ڵ���',216335,4185);
insert into traffic_accident values(2018,'�ڵ���',217148,3781);
insert into traffic_accident values(2019,'�ڵ���',229600,3349);
insert into traffic_accident values(2020,'�ڵ���',209654,3081);
insert into traffic_accident values(1980,'ö��',2136,778);
insert into traffic_accident values(1981,'ö��',1894,858);
insert into traffic_accident values(1982,'ö��',1849,755);
insert into traffic_accident values(1983,'ö��',1932,714);
insert into traffic_accident values(1984,'ö��',1816,755);
insert into traffic_accident values(1985,'ö��',1811,738);
insert into traffic_accident values(1986,'ö��',1845,689);
insert into traffic_accident values(1987,'ö��',1739,717);
insert into traffic_accident values(1988,'ö��',1847,697);
insert into traffic_accident values(1989,'ö��',1812,693);
insert into traffic_accident values(1990,'ö��',1707,606);
insert into traffic_accident values(1991,'ö��',1813,588);
insert into traffic_accident values(1992,'ö��',1694,522);
insert into traffic_accident values(1993,'ö��',1611,573);
insert into traffic_accident values(1994,'ö��',1541,478);
insert into traffic_accident values(1995,'ö��',1344,366);
insert into traffic_accident values(1996,'ö��',1051,352);
insert into traffic_accident values(1997,'ö��',937,337);
insert into traffic_accident values(1998,'ö��',956,349);
insert into traffic_accident values(1999,'ö��',761,314);
insert into traffic_accident values(2000,'ö��',640,252);
insert into traffic_accident values(2001,'ö��',571,245);
insert into traffic_accident values(2002,'ö��',599,265);
insert into traffic_accident values(2003,'ö��',743,503);
insert into traffic_accident values(2004,'ö��',596,243);
insert into traffic_accident values(2005,'ö��',386,201);
insert into traffic_accident values(2006,'ö��',329,171);
insert into traffic_accident values(2007,'ö��',429,192);
insert into traffic_accident values(2008,'ö��',408,159);
insert into traffic_accident values(2009,'ö��',382,161);
insert into traffic_accident values(2010,'ö��',317,135);
insert into traffic_accident values(2011,'ö��',277,124);
insert into traffic_accident values(2012,'ö��',250,108);
insert into traffic_accident values(2013,'ö��',232,96);
insert into traffic_accident values(2014,'ö��',209,80);
insert into traffic_accident values(2015,'ö��',138,76);
insert into traffic_accident values(2016,'ö��',123,62);
insert into traffic_accident values(2017,'ö��',105,51);
insert into traffic_accident values(2018,'ö��',98,40);
insert into traffic_accident values(2019,'ö��',72,29);
insert into traffic_accident values(2020,'ö��',58,0);
insert into traffic_accident values(1980,'����ö',7,4);
insert into traffic_accident values(1981,'����ö',15,7);
insert into traffic_accident values(1982,'����ö',8,4);
insert into traffic_accident values(1983,'����ö',9,5);
insert into traffic_accident values(1984,'����ö',13,9);
insert into traffic_accident values(1985,'����ö',12,3);
insert into traffic_accident values(1986,'����ö',17,12);
insert into traffic_accident values(1987,'����ö',31,9);
insert into traffic_accident values(1988,'����ö',62,15);
insert into traffic_accident values(1989,'����ö',34,11);
insert into traffic_accident values(1990,'����ö',33,15);
insert into traffic_accident values(1991,'����ö',34,20);
insert into traffic_accident values(1992,'����ö',29,17);
insert into traffic_accident values(1993,'����ö',20,11);
insert into traffic_accident values(1994,'����ö',18,12);
insert into traffic_accident values(1995,'����ö',19,12);
insert into traffic_accident values(1996,'����ö',29,18);
insert into traffic_accident values(1997,'����ö',27,18);
insert into traffic_accident values(1998,'����ö',48,24);
insert into traffic_accident values(1999,'����ö',54,35);
insert into traffic_accident values(2000,'����ö',48,28);
insert into traffic_accident values(2001,'����ö',60,40);
insert into traffic_accident values(2002,'����ö',56,36);
insert into traffic_accident values(2003,'����ö',103,256);
insert into traffic_accident values(2004,'����ö',88,51);
insert into traffic_accident values(2005,'����ö',92,55);
insert into traffic_accident values(2006,'����ö',79,44);
insert into traffic_accident values(2007,'����ö',83,59);
insert into traffic_accident values(2008,'����ö',63,39);
insert into traffic_accident values(2009,'����ö',60,34);
insert into traffic_accident values(2010,'����ö',17,9);
insert into traffic_accident values(2011,'����ö',0,0);
insert into traffic_accident values(2012,'����ö',0,0);
insert into traffic_accident values(2013,'����ö',0,0);
insert into traffic_accident values(2014,'����ö',0,0);
insert into traffic_accident values(2015,'����ö',0,0);
insert into traffic_accident values(2016,'����ö',0,0);
insert into traffic_accident values(2017,'����ö',0,0);
insert into traffic_accident values(2018,'����ö',0,0);
insert into traffic_accident values(2019,'����ö',0,0);
insert into traffic_accident values(2020,'����ö',0,0);
insert into traffic_accident values(1980,'����',255,147);
insert into traffic_accident values(1981,'����',336,123);
insert into traffic_accident values(1982,'����',301,42);
insert into traffic_accident values(1983,'����',300,74);
insert into traffic_accident values(1984,'����',486,143);
insert into traffic_accident values(1985,'����',408,242);
insert into traffic_accident values(1986,'����',429,175);
insert into traffic_accident values(1987,'����',533,477);
insert into traffic_accident values(1988,'����',438,309);
insert into traffic_accident values(1989,'����',479,194);
insert into traffic_accident values(1990,'����',515,154);
insert into traffic_accident values(1991,'����',555,153);
insert into traffic_accident values(1992,'����',476,195);
insert into traffic_accident values(1993,'����',529,430);
insert into traffic_accident values(1994,'����',699,209);
insert into traffic_accident values(1995,'����',709,190);
insert into traffic_accident values(1996,'����',661,147);
insert into traffic_accident values(1997,'����',840,227);
insert into traffic_accident values(1998,'����',772,143);
insert into traffic_accident values(1999,'����',849,164);
insert into traffic_accident values(2000,'����',634,149);
insert into traffic_accident values(2001,'����',610,174);
insert into traffic_accident values(2002,'����',557,185);
insert into traffic_accident values(2003,'����',531,119);
insert into traffic_accident values(2004,'����',804,205);
insert into traffic_accident values(2005,'����',658,186);
insert into traffic_accident values(2006,'����',657,134);
insert into traffic_accident values(2007,'����',566,136);
insert into traffic_accident values(2008,'����',948,116);
insert into traffic_accident values(2009,'����',1815,148);
insert into traffic_accident values(2010,'����',1627,170);
insert into traffic_accident values(2011,'����',1809,158);
insert into traffic_accident values(2012,'����',1573,122);
insert into traffic_accident values(2013,'����',1093,101);
insert into traffic_accident values(2014,'����',1330,467);
insert into traffic_accident values(2015,'����',2101,100);
insert into traffic_accident values(2016,'����',2307,118);
insert into traffic_accident values(2017,'����',2582,145);
insert into traffic_accident values(2018,'����',2671,102);
insert into traffic_accident values(2019,'����',2971,98);
insert into traffic_accident values(2020,'����',3156,126);
insert into traffic_accident values(1980,'�װ���',4,17);
insert into traffic_accident values(1981,'�װ���',2,0);
insert into traffic_accident values(1982,'�װ���',0,0);
insert into traffic_accident values(1983,'�װ���',5,276);
insert into traffic_accident values(1984,'�װ���',1,5);
insert into traffic_accident values(1985,'�װ���',1,2);
insert into traffic_accident values(1986,'�װ���',1,3);
insert into traffic_accident values(1987,'�װ���',1,115);
insert into traffic_accident values(1988,'�װ���',2,3);
insert into traffic_accident values(1989,'�װ���',3,94);
insert into traffic_accident values(1990,'�װ���',1,2);
insert into traffic_accident values(1991,'�װ���',3,0);
insert into traffic_accident values(1992,'�װ���',3,1);
insert into traffic_accident values(1993,'�װ���',3,73);
insert into traffic_accident values(1994,'�װ���',2,0);
insert into traffic_accident values(1995,'�װ���',0,0);
insert into traffic_accident values(1996,'�װ���',2,1);
insert into traffic_accident values(1997,'�װ���',4,232);
insert into traffic_accident values(1998,'�װ���',3,0);
insert into traffic_accident values(1999,'�װ���',3,12);
insert into traffic_accident values(2000,'�װ���',3,0);
insert into traffic_accident values(2001,'�װ���',5,9);
insert into traffic_accident values(2002,'�װ���',4,1);
insert into traffic_accident values(2003,'�װ���',5,1);
insert into traffic_accident values(2004,'�װ���',3,2);
insert into traffic_accident values(2005,'�װ���',10,5);
insert into traffic_accident values(2006,'�װ���',6,1);
insert into traffic_accident values(2007,'�װ���',8,4);
insert into traffic_accident values(2008,'�װ���',6,3);
insert into traffic_accident values(2009,'�װ���',13,14);
insert into traffic_accident values(2010,'�װ���',7,1);
insert into traffic_accident values(2011,'�װ���',14,14);
insert into traffic_accident values(2012,'�װ���',9,6);
insert into traffic_accident values(2013,'�װ���',13,12);
insert into traffic_accident values(2014,'�װ���',5,6);
insert into traffic_accident values(2015,'�װ���',11,3);
insert into traffic_accident values(2016,'�װ���',18,17);
insert into traffic_accident values(2017,'�װ���',5,2);
insert into traffic_accident values(2018,'�װ���',4,1);
insert into traffic_accident values(2019,'�װ���',3,7);
insert into traffic_accident values(2020,'�װ���',5,3);

commit;

-- ������ Ȯ�� (�� 205���� ������ �Էµ� �� Ȯ�� �Ϸ�)
SELECT * 
FROM traffic_accident;


-- ����, ������ܺ� �� ��� �Ǽ� ��ȸ
-- 19080-2020����� 5���� ������ܺ� ��� �Ǽ��� ����� �� �����Ͱ� ����ִ�.
-- 10�� ������ ������ �����غ���! 
-- 2020���� 2020�� �ڷ�ۿ� �����Ƿ� 2020������ ǥ��! 
SELECT CASE WHEN YEAR BETWEEN 1980 AND 1989 THEN '1980���'
            WHEN YEAR BETWEEN 1990 AND 1999 THEN '1990���'
            WHEN YEAR BETWEEN 2000 AND 2009 THEN '2000���'
            WHEN YEAR BETWEEN 2010 AND 2019 THEN '2010���'
            WHEN YEAR = 2020 THEN '2020��'
        END AS YEARS,
        TRANS_TYPE,
        SUM(TOTAL_ACCT_NUM)AS ���Ǽ�,
        SUM(DEATH_PERSON_NUM)AS ����Ǽ�        
FROM    traffic_accident
GROUP BY CASE WHEN YEAR BETWEEN 1980 AND 1989 THEN '1980���'
              WHEN YEAR BETWEEN 1990 AND 1999 THEN '1990���'
              WHEN YEAR BETWEEN 2000 AND 2009 THEN '2000���'
              WHEN YEAR BETWEEN 2010 AND 2019 THEN '2010���'
              WHEN YEAR = 2020 THEN '2020��'
        END,
        TRANS_TYPE
ORDER BY 1,2;

-- ���뺰 ���Ǽ� ���� �м�
-- ���븦 �÷����·� ��ȸ�ϱ�

SELECT  TRANS_TYPE,
        SUM(CASE WHEN YEAR BETWEEN 1980 AND 1989 THEN TOTAL_ACCT_NUM END) AS "1980���",
        SUM(CASE WHEN YEAR BETWEEN 1990 AND 1999 THEN TOTAL_ACCT_NUM END) AS "1990���",
        SUM(CASE WHEN YEAR BETWEEN 2000 AND 2009 THEN TOTAL_ACCT_NUM END) AS "2000���",
        SUM(CASE WHEN YEAR BETWEEN 2010 AND 2019 THEN TOTAL_ACCT_NUM END) AS "2010���"
FROM traffic_accident
GROUP BY TRANS_TYPE
ORDER BY TRANS_TYPE;


/*
        1980���     1990���   2000���      2010���   
����	    3965	    6605	    7780	    20064	  
�ڵ���	1646167	    2581517	    2331063	    2227186 	
����ö	208	        311	        732	        17	        
ö��	    18681	    13415	    5083	    1821       	
�װ���	20	        24	        63	        89	        

������ ��� ���Ǽ��� ������ ������ ���� �� �� �ְ�, 2000��뿡�� 2010�⵵�� �Ѿ�鼭 ũ�� �����ߴ�. -������ ���� �þ�鼭 ��� �Ǽ��� �þ ������ ������.
�ڵ����� ��쿡�� 1990����� �� 2�鸸���̻����� ���� ���� ������ �����ϰ� �ִ�.
����ö�� 2000��뿡 ���� 2010��뿡 17������ ũ�� �����ߴ�.
ö���� ������ �����ϴ� ���̸� ���̰� �ִ�.
�װ���� 2010��뿡 89������ ��� ������ ���� Ȯ���� �� �ִ�. - �װ��Ⱑ ���� �þ�鼭 ��� �Ǽ��� �þ ������ ������.
*/

-- ���뺰 ������ܺ� ����� �� ���� �м�
-- ���븦 �÷����·� ��ȸ�ϱ�

SELECT  TRANS_TYPE,
        SUM(CASE WHEN YEAR BETWEEN 1980 AND 1989 THEN DEATH_PERSON_NUM END) AS "1980���",
        SUM(CASE WHEN YEAR BETWEEN 1990 AND 1999 THEN DEATH_PERSON_NUM END) AS "1990���",
        SUM(CASE WHEN YEAR BETWEEN 2000 AND 2009 THEN DEATH_PERSON_NUM END) AS "2000���",
        SUM(CASE WHEN YEAR BETWEEN 2010 AND 2019 THEN DEATH_PERSON_NUM END) AS "2010���"        
FROM traffic_accident
GROUP BY TRANS_TYPE
ORDER BY TRANS_TYPE;

/*
        1980���   1990���     2000���     2010���
����	    1926	    2012	    1552	    1581
�ڵ���	78420	    110872	    69907	    46208
����ö	79	        182	        642	        9
ö��	    7394	    4485	    2392	    801
�װ���	515	        321	        40	        69

�ڵ����� ���� ����ڼ��� ���� ū ������ �����߰�, ö�� ���� ���� ����ڼ��� �����߼��� ���̰� �ִ�.

*/


-- ������ܺ� ���� ���� ����ڼ��� �߻��� ���� ���ϱ�

SELECT YEAR,
       TRANS_TYPE,
       TOTAL_ACCT_NUM,
       DEATH_PERSON_NUM
FROM  traffic_accident
WHERE DEATH_PERSON_NUM IN (SELECT MAX(DEATH_PERSON_NUM) FROM traffic_accident GROUP BY TRANS_TYPE);


-- �ٸ� ���
SELECT a.*
FROM traffic_accident a,
    (SELECT trans_type, MAX(death_person_num) death_per
        FROM traffic_accident
        GROUP BY trans_type
        ) b
WHERE a.trans_type = b.trans_type
AND a.death_person_num = b.death_per;


/*
YEAR    TRANS_TYPE  ���Ǽ�    ����ڼ�
1991	�ڵ���	    265964	    13429
1981	ö��	        1894	    858
2003	����ö	    103	        256
1987	����	        533	        477
1983	�װ���	    5	        276

�ڵ����� 1991��, ö���� 1981��, ����ö�� 2003��, ������ 1987��, �װ���� 1983�⿡ �ִ� ����ڰ� �߻��ߴ�.
����ö�� ��� 2003�⿡ �뱸 ����ö ��� �߻��� ����ڰ� ���� �߻��߰�,
�װ����� ��� 1983�⿡ �����װ� �����Ⱑ ���ҷ� �����⿡ �ǰݵǾ� ž���� ������ ����� ���� ����ڰ� ���� �߻��ߴ�.
*/