# 05. 데이터 가공

## 데이터 분석의 기초, 연산자

### 산술연산자

|    산술연산자    |  기능  |
| :--------------: | :----: |
|      **+**       | 더하기 |
|      **-**       |  빼기  |
|      *****       | 곱하기 |
|      **/**       | 나누기 |
|     **%/%**      |   몫   |
|      **%%**      | 나머지 |
| **\**  또는  ^** |  제곱  |

### 비교 연산자

- 다양한 데이터를 서로 비교하여 TRUE 또는 FALSE와 같은 진리 값을 반환할 때 사용한다.

| 비교연산자 |         기능         |
| :--------: | :------------------: |
|   **>**    |    크다 ( 초과 )     |
|   **>=**   | 크거나 같다 ( 이상 ) |
|   **<**    |    작다 ( 미만 )     |
|   **<=**   | 작거나 같다 ( 이하 ) |
|   **==**   |         같다         |
|   **!=**   |      같지 않다       |



### 논리연산자  (= 불연산자 Boolean Operator)(TRUE, FALSE, T, F)

- 비교연산자를 통해 얻은 진리값을 다시 연산할 때 사용한다. 

| **논리연산자** |    **기능**    |
| :------------: | :------------: |
|     **&**      | 그리고 ( and ) |
|     **\|**     |  또는 ( or )   |



## 분석을 위한 데이터 기본 정리

### 데이터 파악 함수 사용하기

| 데이터 파악 함수 |    활용 예시     |                         설명                         |
| :--------------: | :--------------: | :--------------------------------------------------: |
|    **View()**    | View(데이터세트) |       View 창을 통해 데이터 세트의 데이터 확인       |
|    **str()**     | str(데이터세트)  |  데이터 세트에 있는 변수의 속성과 데이터 형태 확인   |
|    **dim()**     | dim(데이터세트)  | 데이터 세트의 행과 열을 확인하여 데이터 프레임 확인  |
|     **ls()**     |  ls(데이터세트)  | 데이터세트의 변수 항목을 리스트로 만듦 (변수명 확인) |



### 변수명 변경하기

- rename() :  변수 명을 변경해주는 함수!

  - **rename(데이터 세트, 새 변수명 = 기존 변수명)**
  - 새 변수명과 기존 변수명 위치 혼동하지 않기!!! 
  - rename 함수만 실행하고 데이터세트에 <- 으로 반영해주지 않으면, 데이터세트에 결과 적용X

  

### 파생변수 생성하기

- 파생 변수 생성: 보유한 데이터를 기반으로 연산 작업 등을 이용해 새로운 결과를 얻고, 그 결과로 새로운 변수를 생성하는 것.

- 변수의 특징에 따라 다양한 시각으로 분석할 수 있도록 추가로 생성하는 변수! 

  - 데이터 연산방식

    - 기존 데이터 세트에 있는 변수간 연산으로 새로운 변수를 도출할 때 사용.

      ```R
      exdata$x1<- exdata$x2 + exdata$x3 # exdata 데이터 세트에서 x2와 x3를 더해서 exdata데이터세트의 x1변수로 추가.
      ```

  - 변수 변환 방식

    - 기존 데이터를 기준으로 조건에 따라 새로운 값을 부여하여 새로운 변수를 생성.

    - **ifelse( 조건절, 참일 때 값, 거짓일 때 값 )**

      ```R
      # exdata 데이터 세트에서 age 변수 값이 50 이상이면 "Y" 50 미만이면 "N"값으로 exdata 데이터 세트에 age50_YN 변수 생성
      exdata$age50_YN <- ifelse(exdata$age >= 50, "Y", "N") 
      ```


- **mutate 함수**

  - **mutate( 데이터 세트 , 추가할 열 이름 = 조건1, ... )**

  - mutate함수의 장점 - mutate()를 통해 새로 만든 파생변수를 생성과 동시에 바로 인자로 다시 넣어서 사용 가능

    - transform함수도 새로운 열 추가 가능!  But, 생성과 동시에 사용할수는 없음.

    - **transform( 데이터 세트,추가할 열 이름 = 조건1, ... )**

      ```R
      mutate(exdata, mpg_rank = rank(mpg)) # exdata에 mpg_rank열을 추가하고, rank()함수로 mpg 열의 순위를 구한 후 할당
      ```

      



## 데이터 추출부터 정제까지, 데이터 전처리

#### 데이터 전처리 과정에 필요한 dplyr 패키지 설치

```R
install.packages("dplyr") # dplyr 패키지 설치
library(dplyr) # dplyr 패키지 로드
```



#### 필요한 데이터 추출하기

|     함수     |              설명               |
| :----------: | :-----------------------------: |
| **select()** | 원하는 데이터의 변수 ( 열) 선택 |
| **filter()** |       조건에 맞는 행 추출       |



- **select 함수**

  - **select ( 데이터세트, 변수명)**  
  - 주로 특정 열을 선택한다고 이해하면 쉽다!
  - 데이터세트 - dataframe 또는 tibble 형식
  - **%>%** 연산자 : 파이프 연산자 라고 하며, dplyr 패키지에 포함된 기능중 하나. 
    - 여러번 실행해야 하는 복잡한 코드를 한번에 처리할 수 있게 연결해주는 연산자.

  ```R
  # 선택한 변수 추출하기
  select(exdata,ID) # exdata에서 ID변수만 추출.
  select(exdata,(ID:AGE)) # : 를 사용해서 연속되는 열을 추출 가능.
  
  # %>% 연산자 사용시,
  exdata %>%
  	select(ID) # %>%로 연결되어 있어 select 함수 안에 데이터세트 명시 안해줘도 된다.
  
  # 선택한 변수만 제외하고 추출하기
  exdata %>%
  	select(-ID,-AGE) # exdata 데이터 세트에서 ID,AGE 변수를 제외하고 추출
  ```

  

- **filter 함수**

  - **filter( 조건절 )**

  - 필요한 조건을 지정하여 조건에 맞는 데이터만 추출하여 분석할 때 활용.

  - 조건절의 데이터가 문자형(chr)일 때는 작은따옴표(' ') 또는 큰따옴표(" ")를 반드시 붙여야 한다. 

  - 숫자형일 때는 따옴표 생략!

    ```R
    # exdata 데이터 세트에서 AREA(지역)가 서울이고, AGE(나이)가 50 이상인 경우만 추출.
    exdata %>%
    	filter(AREA == '서울' & AGE >= 50) # & 연산자를 사용하여 앞뒤 조건이 모두 만족할 때만 추출. 
    ```

    

#### 데이터 정렬하기

| 데이터 정렬 방식 |    정렬 함수    |              설명               |
| :--------------: | :-------------: | :-----------------------------: |
|     오름차순     |    arrange()    | 지정한 변수를 오름차순으로 정렬 |
|     내림차순     | arrange(desc()) | 지정한 변수를 내림차순으로 정렬 |

- **arrange 함수**

  - **arrange(데이터, 기준열1,기준열2, ... )**

  - 기본값이 오름차순 정렬이므로 정렬하려는 변수가 숫자형이면 MISSING(NA) , 음수, 0 , 양수 순으로 정렬.

  - 문자형이면 빈칸부터 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]_…순으로 정렬된다.

    ```R
    # exdata 데이터 세트의 AGE, ID변수를 오름차순 정렬
    exdata %>%
    	arrange(AGE,ID)
    
    # exdata 데이터 세트의 AMT 변수를 기준으로 내림차순 정렬
    exdata %>%
    	arrange(desc(AMT))
    
    # 변수 중첩 정렬하기 - exdata 데이터세트의 AGE 변수는 오름차순, ID 변수는 내름차순 정렬
    exdata %>%
    	arrange(AGE,desc(ID))
    ```

    

#### 데이터 요약하기

- **summarise 함수** 

  - 통계량을 구할 수 있는 함수.  Dataframe으로 결과값이 반환된다.

  - **summarise( 새변수명 = FUN(변수명) )**

    ```R
    # exdata 데이터 세트의 Y17_AMT(17년도 이용 금액) 변수 값 합계를 TOTAL_Y17_AMT 변수로 도출.
    exdata %>%
    	summarise(TOTAL_Y17_AMT = sum(Y17_AMT)) 
    ```

    

- **group_by 함수**

  - **group_by( 변수명 )**

  - 해당 변수를 기준으로 그룹을 만들어 주는 함수.

    ```R
    # exdata 데이터 세트의 AREA(지역) 변수 값 별로 Y17_AMT(17년도 이용 금액)를 더해 SUM_Y17_AMT 변수로 도출
    exdata %>%
    	group_by(AREA) %>%
    		summarise(SUM_Y17_AMT = sum(Y17_AMT))
    ```

    

#### 데이터 결합하기

- **rbind(), cbind(), merge()**

  - **rbind() 함수** :  행 결합 (위 + 아래) 

    - **rbind( 데이터 세트 1, 데이터 세트 2)**

    - rbind() 를 하기 위해서는 결합하려는 **두개의 데이터 세트의 열의 개수와 속성, 이름이 같아야 사용 가능!**

      ```R
      d1 <- data.frame(id = c("id1","id2","id3"),
                       age = c(10,20,30))
      d2 <- data.frame(id = c("id4","id5","id6"),
                       age =c(15,25,35) )
      
      rbind(d1, d2)
      # 실행 결과 
         id age
      1 id1  10
      2 id2  20
      3 id3  30
      4 id4  15
      5 id5  25
      6 id6  35
      ```

  - **cbind() 함수** : 열 결합 (왼쪽 + 오른쪽)

    - **cbind( 데이터 세트 1 + 데이터 세트 2 )**

    - cbind() 를 하기 위해서는 결합하려는 **두개의 데이터 세트의 행의 개수와 행이 서로 동일 대상이어야 사용 가능!** 

      ```R
      d1 <- data.frame(id = c("id1","id2","id3"),
                       age = c(10,20,30))
      d3 <- data.frame(gender = c("F","M","F"),
                       area = c("서울","경기도","강원도") )
      cbind(d1,d3)
      # 실행 결과
         id age gender   area
      1 id1  10      F   서울
      2 id2  20      M  경기도
      3 id3  30      F  강원도
      
      ```

  - **merge() 함수** :  동일 key 값 기준 결합 

    - **merge( 데이터 세트 1 , 데이터 세트 2 , by = 'key')**

    - 서로 다른 순서로 저장되어 있는 데이터라고 해도,  동일한 data 칼럼의 이름이 있으면 공통 칼럼을 내부적으로 찾아서 연결해준다. 단, 공통의 기준을 잡을 수 있는 컬럼이 있어야함.

    - 만약, 공통의 기준으로 잡을 수 있는 컬럼이 있지만, 이름이 다를땐 colnames함수를 활용해서 이름 같게 해주는 과정 필요 => 전처리 과정 중 하나! 

      ```R
      d1 <- data.frame(id = c("id1","id2","id3"),
                       age = c(10,20,30))
      d4 <- data.frame(id = c("id2","id1","id3"),
                       area = c("서울","경기도","강원도"))
      merge(d1 , d4)
      # 실행 결과     # d4의 id의 순서가 달랐지만, key값인 id 기준으로 잘 매칭된 것 확인 가능
         id age   area
      1 id1  10  경기도
      2 id2  20   서울
      3 id3  30  강원도
      ```

      

- **join() 함수 **: key값을 기준으로 두개의 프레임을 병합

  - **join(data1, data2, by = 공통되는 기준칼럼명, type= 어떤 join할건지 )**

    - type에 들어갈 수 있는 값 : **inner (join), left (join), right (join), full (join)**
    - type = 'inner' : 기준 key가 같은 경우만 join
    - type = 'left'  : 왼쪽 dataframe의 key값 기준으로 join
    - type = 'right' : 오른쪽 dataframe의 key값 기준으로 join
    - type = 'full'  : 양쪽 dataframe의 key값 모두 포함해서 join
    - by = 기준칼럼명 : 병합해서 여러개 가능, composite key처럼!
      - ex) by = c('id','gender') 

    ```R 
    tmp.x.df <- data.frame(
      id=c(1,2,3,4,5),
      height = c(160,175,180,177,194)
    )
    tmp.y.df <- data.frame(
      id=c(5,4,3,2,1),
      weight = c(55, 77, 90,78,95)
    )
    # id를 기준으로 inner join.
    inner.df <- plyr::join(tmp.x.df, tmp.y.df, by = 'id', type = 'inner') # plyr::join : plyr 패키지의 join함수를 지칭해주는 것. 
    
    inner.df
    # 실행 결과
      id height weight
    1  1    160     95
    2  2    175     78
    3  3    180     90
    4  4    177     77
    5  5    194     55
    ```