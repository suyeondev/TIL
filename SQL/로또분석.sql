/*
로또 데이터 분석

데이터 : 로또 회차별 당첨번호 (1회 - 1006회)
데이터 출처 : 나눔로또 홈페이지에서 엑셀형태로 다운로드

*/

-- 테이블 생성
-- 방법 : 데이터임포트 마법사기능을 활용하여 테이블을 생성하고 엑셀형식의 데이터를 임포트하였다.
-- lotto_info : 회차, 추첨일, 당첨번호1, 당첨번호2, 당첨번호3, 당첨번호4, 당첨번호5, 당첨번호6, 보너스번호까지의 정보를 담고있는 테이블
-- lotto_detail : 회차, 추첨일, 1등 당첨자수, 2등 당첨자수, 3등 당첨자수, 4등 당첨자수, 5등 당첨자수,1등 당첨금액, 2등 당첨금액, 3등 당첨금액, 4등 당첨금액, 5등 당첨금액 까지의 정보를 담고있는 테이블


-- 지금까지 당첨번호중 중복 번호가 있는지 조회해보기
SELECT 당첨번호1 ,당첨번호2, 당첨번호3, 당첨번호4, 당첨번호5,당첨번호6, COUNT(*)
FROM lotto_info
GROUP BY 당첨번호1 ,당첨번호2, 당첨번호3, 당첨번호4, 당첨번호5,당첨번호6
HAVING COUNT(*) > 1;

-- 결론 : 1회부터 1006회까지 당첨번호가 중복된적은 한번도 없다.

-- 보너스번호를 제외하고, 가장 많이 당첨된 당첨번호 조회
SELECT  lotto_num, SUM(cnt) AS cnt   
FROM (SELECT 당첨번호1 AS lotto_num, COUNT(*) AS cnt 
        FROM lotto_info
        GROUP BY 당첨번호1
        
        UNION ALL
        
        SELECT 당첨번호2 AS lotto_num, COUNT(*) AS cnt 
        FROM lotto_info
        GROUP BY 당첨번호2
        
        UNION ALL

        SELECT 당첨번호3 AS lotto_num, COUNT(*) AS cnt 
        FROM lotto_info
        GROUP BY 당첨번호3
        
        UNION ALL
        
        SELECT 당첨번호4 AS lotto_num, COUNT(*) AS cnt 
        FROM lotto_info
        GROUP BY 당첨번호4
        
        UNION ALL
        
        SELECT 당첨번호5 AS lotto_num, COUNT(*) AS cnt 
        FROM lotto_info
        GROUP BY 당첨번호5
        
        UNION ALL
        
        SELECT 당첨번호6 AS lotto_num, COUNT(*) AS cnt 
        FROM lotto_info
        GROUP BY 당첨번호6
    )
GROUP BY lotto_num
ORDER BY 2 DESC;

/* 가장 많이 당첨된 번호 조회 결과  
 34번 : 152회
 18번 : 148회
 27번 : 146회
 43번 : 146회
 17번 : 145회
*/


-- 가장 많은 당첨금이 나온 회차와 번호, 금액조회
SELECT D.회차, D.당첨금액_1등, D.당첨자수_1등, I.당첨번호1, I.당첨번호2, I.당첨번호3, I.당첨번호4, I.당첨번호5, I.당첨번호6, I.보너스번호
FROM lotto_detail D
JOIN lotto_info I ON (D.회차 = I.회차)
ORDER BY 2 DESC;

-- 가장 적은 1등 당첨금이 나온 회차와 번호, 금액조회
SELECT D.회차, D.당첨금액_1등, D.당첨자수_1등, I.당첨번호1, I.당첨번호2, I.당첨번호3, I.당첨번호4, I.당첨번호5, I.당첨번호6, I.보너스번호
FROM lotto_detail D
JOIN lotto_info I ON (D.회차 = I.회차)
ORDER BY 2 ;
/* 가장 많은 당첨금이 나온 회차는 19회차로 407억 2295만 9400원의 당첨금액이 한명에게 돌아갔다.
19회차의 당첨번호는 6,30,38,39,40,43,26(보너스번호)이었다.
반면에 가장 적은 당첨금이 나온 회차는 546회차였고, 4억 593만 9950원의 당청금액이 30명에게 돌아갔다.(1등이 아무도 없는 경우는 제외했을때)
*/