# 04. 데이터 수집 



## 데이터 수집 방법

### 1. 원시 자료 입력하기

원시 자료  입력? 

- R 환경에서 분석할 데이터 값을 직접 입력하여 저장하는 것.

- 데이터를 변수에 할당하는 방식으로 구성한다.

  ```R
  ID <- c(1,2,3,4,5)
  AGE <- c(50,33,23,39,14)
  DATA <- data.frame(ID = ID,
                     AGE = AGE)
  DATA
  # 실행 결과
    ID AGE
  1  1  50
  2  2  33
  3  3  23
  4  4  39
  5  5  14
  ```

  

## 2. 외부파일 불러오기

### 👉엑셀파일 불러오기

- 엑셀파일을 불러올 때는 read_excel() 함수를 사용한다.

- read_excel() 함수는 readxl 패키지에 포함되어 있어 패키지를 설치하고 로드해야함!

  ```R
  install.packages("readxl") # readxl 패키지 설치
  library(readxl) # readxl 패키지 로드
  
  # 파일의 경로를 통해 읽어오는 방법 
  excel_data1 <- read_excel("C:/Rstudy/data_ex.xls") # data_ex.xls파일을 excel_data1로 저장
  View(excel_data1) # excel_data1 조회
  
  # 파일을 직접 선택해서 읽어오는 방법 
  excel_data2 <- read_excel(file.choose()) # file.choose() 함수를 통해 파일 직접 선택이 가능하다
  ```

🌟TIP! 

- 엑셀 파일에 시트탭이 여러개 있다면 기본값으로 첫번째 시트를 가져온다.

- 다른 시트의 데이터를 가져오려면?

  ```R
  read_excel(file.choose(),sheet = 2) # sheet = 옵션에 가져올 시트의 위치를 입력!
  ```

  

### 👉 텍스트 파일 불러오기

- **read.table("원시데이터")** : txt파일 불러오는 함수.

  - header : 원시데이터에서 1행이 변수명인지 아닌지 판단 	

    - 1행이 변수명이면 header = TRUE)

  - skip : 특정 행까지 제외하고 데이터 가져오기 

    - 3행부터 가져오려면 skip = 2 (2행까지는 스킵하고 3행부터 가져온다는 의미)

  - nrows : 특정 행까지 데이터 가져오기

    - 7행까지 가져오려면 nrows = 7

  - sep : 데이터 구분자 지정

    - 쉼표로 구분된 데이터가 있다면  sep = ","

      

  ```R
  tmp_txt <- read.table(file.choose()) #read.table 함수로 txt파일 불러서 tmp.txt 변수에 저장
  class(tmp_txt)
  # 실행 결과
  [1] "data.frame"   # read.tabe함수로 텍스트 파일을 데이터 프레임형으로 가져온다는 것 확인 가능!
  
  tmp_txt
  # 실행 결과
      V1  V2  V3   V4
  1  ID SEX AGE AREA		 #header 부분이 데이터로 들어가버림.
  2   1   F  50 서울
  3   2   M  40 경기
  4   3   F  28 제주
  5   4   M  50 서울
  6   5   M  27 서울
  7   6   F  23 서울
  8   7   F  56 경기
  9   8   F  47 서울
  10  9   M  20 인천
  11 10   F  38 경기
  
  tmp_txt1 <- read.table(file.choose(),
                        header = T,    # header =T : header가 알맞게 나옴.
                        nrows = 7,     # 행 7줄만 가져오기
                        sep = "\t")    # tab으로 구분하여 가져오기
  tmp_txt1 
  # 실행 결과
    ID SEX AGE AREA
  1  1   F  50 서울
  2  2   M  40 경기
  3  3   F  28 제주
  4  4   M  50 서울
  5  5   M  27 서울
  6  6   F  23 서울
  7  7   F  56 경기
  
  # 데이터 불러올때 열이름 부여해서 header로 가져올 수 있음.
  colname <-  c("ID","GENDER","AGE","AREA") # 부여할 열 이름 벡터로 생성.
  tmp.txt <- read.table(file.choose(),	
                        col.names = colname)	# col.names 옵션으로 열이름 부여
  
  ```

  

### 👉 데이터 저장하고 불러오기

- RDA 파일로 저장하고 불러오기

  - R 전용파일인 *.rda파일로 저장할 때엔 save() 함수 사용!

    - **save( 데이터 세트, file = "파일명" )**

  - *.rda파일 불러올 때는 load() 함수 사용!

    - **load( "경로 / 파일명" )**

      

  ```R
  ID <- c(1,2,3,4,5)
  AGE <- c(50,33,23,39,14)
  DATA <- data.frame(ID = ID,
                     AGE = AGE)
  
  save(DATA, file = "data_ex.rda") # DATA 데이터 세트를 data_ex.rda파일로 저장
  
  load("C:/Rstudy/data_ex.rda") # data_ex.rda 파일 불러오기
  View(data_ex) # data_ex 조회
  ```



- 데이터를 csv 또는 txt파일로 저장할때 

  - **write.파일형식()**

    - csv 파일을 저장할 때
      - **write.csv()**

    - txt 파일을 저장할 때
      - **write.table()**

    ```R
    ID <- c(1,2,3,4,5)
    AGE <- c(50,33,23,39,14)
    DATA <- data.frame(ID = ID,
                       AGE = AGE)
    write.csv(DATA, file = "C:/Rstudy/data_ex.csv") # DATA 데이터세트를 data_ex.csv 파일로 저장
    write.table(DATA, file = "C:/Rstudy/data_ex.txt" ) # DATA 데이터세트를 data_ex.txt 파일로 저장
    
    # quote = FALSE 옵션을 추가하면 큰따옴표 없이 저장 가능!
    ```

    