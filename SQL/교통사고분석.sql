/*
교통사고 분석
참고 문헌 : 누구나 쉽게 SQL

--데이터 설명--
자료명 :	교통수단별 교통사고현황
출처	: 국토교통부
자료구축기간 : 1980 ~ 2020
업데이트 주기 : 매년
최종 업데이트일 : 2022.02.14
제공지표	: 사고 발생건수(건), 사망자수(인)

*/

-- 테이블 생성
CREATE TABLE traffic_accident 
(
    year                NUMBER          NOT NULL,  -- 연도
    trans_type          VARCHAR2(30)    NOT NULL,  -- 교통수단       
    total_acct_num      NUMBER,                    -- 사고 건수
    death_person_num    NUMBER,                     -- 사망자 수 
    PRIMARY KEY (year, trans_type)
);

-- 데이터 입력 (1980-2020)
insert into traffic_accident values(1980,'자동차',120182,5608);
insert into traffic_accident values(1981,'자동차',123373,5804);
insert into traffic_accident values(1982,'자동차',141128,6110);
insert into traffic_accident values(1983,'자동차',170026,6834);
insert into traffic_accident values(1984,'자동차',134335,7468);
insert into traffic_accident values(1985,'자동차',146836,7522);
insert into traffic_accident values(1986,'자동차',153777,7702);
insert into traffic_accident values(1987,'자동차',175661,7206);
insert into traffic_accident values(1988,'자동차',225062,11563);
insert into traffic_accident values(1989,'자동차',255787,12603);
insert into traffic_accident values(1990,'자동차',255303,12325);
insert into traffic_accident values(1991,'자동차',265964,13429);
insert into traffic_accident values(1992,'자동차',257194,11640);
insert into traffic_accident values(1993,'자동차',260921,10402);
insert into traffic_accident values(1994,'자동차',266107,10087);
insert into traffic_accident values(1995,'자동차',248865,10323);
insert into traffic_accident values(1996,'자동차',265052,12653);
insert into traffic_accident values(1997,'자동차',246452,11603);
insert into traffic_accident values(1998,'자동차',239721,9057);
insert into traffic_accident values(1999,'자동차',275938,9353);
insert into traffic_accident values(2000,'자동차',290481,10236);
insert into traffic_accident values(2001,'자동차',260579,8097);
insert into traffic_accident values(2002,'자동차',231026,7222);
insert into traffic_accident values(2003,'자동차',240832,7212);
insert into traffic_accident values(2004,'자동차',220755,6563);
insert into traffic_accident values(2005,'자동차',214171,6376);
insert into traffic_accident values(2006,'자동차',213745,6327);
insert into traffic_accident values(2007,'자동차',211662,6166);
insert into traffic_accident values(2008,'자동차',215822,5870);
insert into traffic_accident values(2009,'자동차',231990,5838);
insert into traffic_accident values(2010,'자동차',226878,5505);
insert into traffic_accident values(2011,'자동차',221711,5229);
insert into traffic_accident values(2012,'자동차',223656,5392);
insert into traffic_accident values(2013,'자동차',215354,5092);
insert into traffic_accident values(2014,'자동차',223552,4762);
insert into traffic_accident values(2015,'자동차',232035,4621);
insert into traffic_accident values(2016,'자동차',220917,4292);
insert into traffic_accident values(2017,'자동차',216335,4185);
insert into traffic_accident values(2018,'자동차',217148,3781);
insert into traffic_accident values(2019,'자동차',229600,3349);
insert into traffic_accident values(2020,'자동차',209654,3081);
insert into traffic_accident values(1980,'철도',2136,778);
insert into traffic_accident values(1981,'철도',1894,858);
insert into traffic_accident values(1982,'철도',1849,755);
insert into traffic_accident values(1983,'철도',1932,714);
insert into traffic_accident values(1984,'철도',1816,755);
insert into traffic_accident values(1985,'철도',1811,738);
insert into traffic_accident values(1986,'철도',1845,689);
insert into traffic_accident values(1987,'철도',1739,717);
insert into traffic_accident values(1988,'철도',1847,697);
insert into traffic_accident values(1989,'철도',1812,693);
insert into traffic_accident values(1990,'철도',1707,606);
insert into traffic_accident values(1991,'철도',1813,588);
insert into traffic_accident values(1992,'철도',1694,522);
insert into traffic_accident values(1993,'철도',1611,573);
insert into traffic_accident values(1994,'철도',1541,478);
insert into traffic_accident values(1995,'철도',1344,366);
insert into traffic_accident values(1996,'철도',1051,352);
insert into traffic_accident values(1997,'철도',937,337);
insert into traffic_accident values(1998,'철도',956,349);
insert into traffic_accident values(1999,'철도',761,314);
insert into traffic_accident values(2000,'철도',640,252);
insert into traffic_accident values(2001,'철도',571,245);
insert into traffic_accident values(2002,'철도',599,265);
insert into traffic_accident values(2003,'철도',743,503);
insert into traffic_accident values(2004,'철도',596,243);
insert into traffic_accident values(2005,'철도',386,201);
insert into traffic_accident values(2006,'철도',329,171);
insert into traffic_accident values(2007,'철도',429,192);
insert into traffic_accident values(2008,'철도',408,159);
insert into traffic_accident values(2009,'철도',382,161);
insert into traffic_accident values(2010,'철도',317,135);
insert into traffic_accident values(2011,'철도',277,124);
insert into traffic_accident values(2012,'철도',250,108);
insert into traffic_accident values(2013,'철도',232,96);
insert into traffic_accident values(2014,'철도',209,80);
insert into traffic_accident values(2015,'철도',138,76);
insert into traffic_accident values(2016,'철도',123,62);
insert into traffic_accident values(2017,'철도',105,51);
insert into traffic_accident values(2018,'철도',98,40);
insert into traffic_accident values(2019,'철도',72,29);
insert into traffic_accident values(2020,'철도',58,0);
insert into traffic_accident values(1980,'지하철',7,4);
insert into traffic_accident values(1981,'지하철',15,7);
insert into traffic_accident values(1982,'지하철',8,4);
insert into traffic_accident values(1983,'지하철',9,5);
insert into traffic_accident values(1984,'지하철',13,9);
insert into traffic_accident values(1985,'지하철',12,3);
insert into traffic_accident values(1986,'지하철',17,12);
insert into traffic_accident values(1987,'지하철',31,9);
insert into traffic_accident values(1988,'지하철',62,15);
insert into traffic_accident values(1989,'지하철',34,11);
insert into traffic_accident values(1990,'지하철',33,15);
insert into traffic_accident values(1991,'지하철',34,20);
insert into traffic_accident values(1992,'지하철',29,17);
insert into traffic_accident values(1993,'지하철',20,11);
insert into traffic_accident values(1994,'지하철',18,12);
insert into traffic_accident values(1995,'지하철',19,12);
insert into traffic_accident values(1996,'지하철',29,18);
insert into traffic_accident values(1997,'지하철',27,18);
insert into traffic_accident values(1998,'지하철',48,24);
insert into traffic_accident values(1999,'지하철',54,35);
insert into traffic_accident values(2000,'지하철',48,28);
insert into traffic_accident values(2001,'지하철',60,40);
insert into traffic_accident values(2002,'지하철',56,36);
insert into traffic_accident values(2003,'지하철',103,256);
insert into traffic_accident values(2004,'지하철',88,51);
insert into traffic_accident values(2005,'지하철',92,55);
insert into traffic_accident values(2006,'지하철',79,44);
insert into traffic_accident values(2007,'지하철',83,59);
insert into traffic_accident values(2008,'지하철',63,39);
insert into traffic_accident values(2009,'지하철',60,34);
insert into traffic_accident values(2010,'지하철',17,9);
insert into traffic_accident values(2011,'지하철',0,0);
insert into traffic_accident values(2012,'지하철',0,0);
insert into traffic_accident values(2013,'지하철',0,0);
insert into traffic_accident values(2014,'지하철',0,0);
insert into traffic_accident values(2015,'지하철',0,0);
insert into traffic_accident values(2016,'지하철',0,0);
insert into traffic_accident values(2017,'지하철',0,0);
insert into traffic_accident values(2018,'지하철',0,0);
insert into traffic_accident values(2019,'지하철',0,0);
insert into traffic_accident values(2020,'지하철',0,0);
insert into traffic_accident values(1980,'선박',255,147);
insert into traffic_accident values(1981,'선박',336,123);
insert into traffic_accident values(1982,'선박',301,42);
insert into traffic_accident values(1983,'선박',300,74);
insert into traffic_accident values(1984,'선박',486,143);
insert into traffic_accident values(1985,'선박',408,242);
insert into traffic_accident values(1986,'선박',429,175);
insert into traffic_accident values(1987,'선박',533,477);
insert into traffic_accident values(1988,'선박',438,309);
insert into traffic_accident values(1989,'선박',479,194);
insert into traffic_accident values(1990,'선박',515,154);
insert into traffic_accident values(1991,'선박',555,153);
insert into traffic_accident values(1992,'선박',476,195);
insert into traffic_accident values(1993,'선박',529,430);
insert into traffic_accident values(1994,'선박',699,209);
insert into traffic_accident values(1995,'선박',709,190);
insert into traffic_accident values(1996,'선박',661,147);
insert into traffic_accident values(1997,'선박',840,227);
insert into traffic_accident values(1998,'선박',772,143);
insert into traffic_accident values(1999,'선박',849,164);
insert into traffic_accident values(2000,'선박',634,149);
insert into traffic_accident values(2001,'선박',610,174);
insert into traffic_accident values(2002,'선박',557,185);
insert into traffic_accident values(2003,'선박',531,119);
insert into traffic_accident values(2004,'선박',804,205);
insert into traffic_accident values(2005,'선박',658,186);
insert into traffic_accident values(2006,'선박',657,134);
insert into traffic_accident values(2007,'선박',566,136);
insert into traffic_accident values(2008,'선박',948,116);
insert into traffic_accident values(2009,'선박',1815,148);
insert into traffic_accident values(2010,'선박',1627,170);
insert into traffic_accident values(2011,'선박',1809,158);
insert into traffic_accident values(2012,'선박',1573,122);
insert into traffic_accident values(2013,'선박',1093,101);
insert into traffic_accident values(2014,'선박',1330,467);
insert into traffic_accident values(2015,'선박',2101,100);
insert into traffic_accident values(2016,'선박',2307,118);
insert into traffic_accident values(2017,'선박',2582,145);
insert into traffic_accident values(2018,'선박',2671,102);
insert into traffic_accident values(2019,'선박',2971,98);
insert into traffic_accident values(2020,'선박',3156,126);
insert into traffic_accident values(1980,'항공기',4,17);
insert into traffic_accident values(1981,'항공기',2,0);
insert into traffic_accident values(1982,'항공기',0,0);
insert into traffic_accident values(1983,'항공기',5,276);
insert into traffic_accident values(1984,'항공기',1,5);
insert into traffic_accident values(1985,'항공기',1,2);
insert into traffic_accident values(1986,'항공기',1,3);
insert into traffic_accident values(1987,'항공기',1,115);
insert into traffic_accident values(1988,'항공기',2,3);
insert into traffic_accident values(1989,'항공기',3,94);
insert into traffic_accident values(1990,'항공기',1,2);
insert into traffic_accident values(1991,'항공기',3,0);
insert into traffic_accident values(1992,'항공기',3,1);
insert into traffic_accident values(1993,'항공기',3,73);
insert into traffic_accident values(1994,'항공기',2,0);
insert into traffic_accident values(1995,'항공기',0,0);
insert into traffic_accident values(1996,'항공기',2,1);
insert into traffic_accident values(1997,'항공기',4,232);
insert into traffic_accident values(1998,'항공기',3,0);
insert into traffic_accident values(1999,'항공기',3,12);
insert into traffic_accident values(2000,'항공기',3,0);
insert into traffic_accident values(2001,'항공기',5,9);
insert into traffic_accident values(2002,'항공기',4,1);
insert into traffic_accident values(2003,'항공기',5,1);
insert into traffic_accident values(2004,'항공기',3,2);
insert into traffic_accident values(2005,'항공기',10,5);
insert into traffic_accident values(2006,'항공기',6,1);
insert into traffic_accident values(2007,'항공기',8,4);
insert into traffic_accident values(2008,'항공기',6,3);
insert into traffic_accident values(2009,'항공기',13,14);
insert into traffic_accident values(2010,'항공기',7,1);
insert into traffic_accident values(2011,'항공기',14,14);
insert into traffic_accident values(2012,'항공기',9,6);
insert into traffic_accident values(2013,'항공기',13,12);
insert into traffic_accident values(2014,'항공기',5,6);
insert into traffic_accident values(2015,'항공기',11,3);
insert into traffic_accident values(2016,'항공기',18,17);
insert into traffic_accident values(2017,'항공기',5,2);
insert into traffic_accident values(2018,'항공기',4,1);
insert into traffic_accident values(2019,'항공기',3,7);
insert into traffic_accident values(2020,'항공기',5,3);

commit;

-- 데이터 확인 (총 205개의 데이터 입력된 것 확인 완료)
SELECT * 
FROM traffic_accident;