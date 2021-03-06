# 데이터 분석 프로젝트 

## 주제 : 코로나 19로 인한 관광,여행 산업의 변화 분석



###  목표 : 전국 주요관광지점 입장객 통계를 분석하여 코로나 19가 국내 관광지점 운영에 미친 영향 확인해보기.



#### 1.분석할 데이터 이해해보기

- 통계자료 : 주요 관광지점 입장객 통계 

- 조사 대상: 전국 관광지점의  입장객 수

- 목적 : 주요 관광지점 입장객 통계의 생산 및 배포를 통해 관광객 수요 추정 및 관광시설 공급 판단의 기초자료로 활용

  

- 유의사항 :  개별 관광지점에 대한 입장객 수로 특정 지역을 방문한 관광객 총량과 상이하다. 주요 관광지점 입장객 통계작성지침 변경에 따라 2013년 1월 이후부터는 추정 방식을 이용하여 입장객 수 집계가 이루어지는 관광지점의 통계는 제공하지 않는다.

  해당 지역의 입장객 수의 합 ![image-20210812150800887](R_data_analysis_project1.assets/image-20210812150800887.png) 해당 지역에 방문한 관광객 총량

  ⇒ 대략적인 관광객 수요 추정 및 관광시설의 공급판단의 자료로 활용 가능, 대략적인 입장객의 변화추이와 관광객 수요도를 살펴볼 예정. 

  

- 관광지점 표기 순서 

  - 광역지자체 순서 : 통계청의 한국 행정구역 분류(19. 1. 1.)의 코드별 순서 

  - 개별 관광지점 순서 : 유료관광지점 가나다, 무료관광지점 가나다 순 

    

- 표기 부호 

  - [ - ] : 무응답 

  - [ 0 ] : 해당 기간에 입장객이 없는 경우 

    

- 단위 및 수록 기간 
  - 입장객 수의 단위 : 명 
  - 수록 기간 : 2019년 1월 1일 ~ 2019년 12월 31일 

- 집계 방식 
  - 유료 관광지점 : 관광지점의 입장권 및 관람권 발권내역을 근거로 하여 입장객 수를 조사하는 방식 또는 관광시설 이용 시 이용료를 징수하여 그 내역으로 입장객 수를 조사하는 방식으로 유료측정 (총원), 유료측정(내·외국인 구분)으로 집계 
  - 무료 관광지점 : 기계식조사(게이트 설치, 센서 설치, 무인계측기 설치), 무료입장권 발매 및 CCTV를 동반한 인력식조사, 사전 예약제도 등의 방식으로 조사 유형에 따라 무료측정(총원), 무료 측정(내·외국인 구분)으로 집계 

- 용어 정의 

  - 관광지점 : ｢관광진흥법｣ 등 관광관련 법령(표1 참조)을 근거로 분류된 주요 관광지점 중 지자체 관광진흥 정책상 중요하다고 판단하는 대표지점으로서 관광목적의 비일상적 이용이 주된 목적인 시설 또는 공간을 의미함

  - 입장객 : 관광목적으로 관광지점에 입장한 사람

    

    - 제외 대상 

      ① 관광지점 안에 거주하는 지역주민 

      ② 관광지점 내에서 영리적 활동을 업으로 하는 자(1회성 활동 제외) 

      ③ 관광지점 관리·운영을 위한 근무자 

      ④ 특수목적 방문자(경찰관, 환경미화원 등)

      ⑤ 단순 통과를 목적으로 하는 자 등은 관광목적의 입장객이 아니므로 집계 대상에서 제외함 

    -  예외 사항 

      ① 관광지점에서 일시적 영리활동을 하는 자(이벤트·상설 프로그램 등 행사 관계자, 영화 촬영 등 집계지 점을 영리적 활동 공간으로 사용하기 위해 일시적으로 방문한 자) 

      ② 관광목적으로 관광지점을 방문한 지역주민은 ‘입장객’에 포함하여 집계함 

      

  - 입장객 수 : 관광지점에 입장한 사람(입장객)의 수를 의미함(객관적 방법으로 입장객 수를 측정하고 근거자료를 구비하여 증명할 수 있어야함)

##### <분석방향> 

1. 조사 관광지점 수 비교

- 코로나 전후 전국 조사지점 수 변화가 있는지? (증가? 감소?)

- 지역별 조사지점 수 변화

2. 입장객 비교

- 코로나로 입장객 수의 변화가 있는가?

- 어느 지역이 입장객 수 감소 타격이 가장 큰가?

- 어느 지역이 타격이 가장 적었나?

3. 내국인 관광객과 외국인 관광객의 비교.

- 코로나 전후 내국인 관광객과 외국인 관광객 증감 추이 (전국, 지역별)

- 내국인관광객에게 인기있는 관광지 상위 5위

- 외국인관광객에게 인기있는 관광지 상위 5위



