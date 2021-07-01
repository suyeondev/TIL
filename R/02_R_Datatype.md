# 02. R Datatype

## 단일형과 다중형

- 단일형 : 숫자형 또는 문자형과 같이 한가지 데이터 형태로만 구성된 데이터
  - 벡터(vector), 행렬(matrix), 배열(array)

- 다중형 : 숫자 데이터 또는 문자 데이터 등 여러가지 데이터 형태로 구성된 데이터
  - 리스트(list), 데이터 프레임(dataframe)

|  구분  | 1차원  |     2차원     | 3차원 |
| :----: | :----: | :-----------: | :---: |
| 단일형 |  벡터  |     행렬      | 배열  |
| 다중형 | 리스트 | 데이터 프레임 |   -   |



😊TIP! 변수의 데이터 형 확인하고 싶을 때 

- <span style="color:blue">**typeof**</span>( 변수이름 )
- <span style="color:blue">**mode**</span>( 변수이름 )
- <span style="color:blue">**class**</span>( 변수이름 )
- <span style="color:blue">**str**</span>( 변수이름 )  ---> 변수의 데이터 구조까지 확인 가능 = 데이터 형, 데이터 길이, 데이터 값

🌟Data를 다루기 위해선 class확인 수시로! 

🌟어떤 DataType을 return값으로 받는지가 중요!



##  벡터(Vector)

- <span style="color:red">**데이터 구조의 가장 기본 형태**</span>
- 1차원이며 동일한 데이터 형태로 구성된 데이터
- 데이터 형으로  숫자형(Numeric), 정수형(Integer), 문자형(Character), 논리형(Logical)을 가질 수 있다.

 

### 숫자형 벡터(Numeric Vector)

- 실수형 벡터(double Vector)라고도 부름

- 숫자형 벡터 생성 방법

  - <span style="color:blue">**c()**</span> 함수를 활용하여 생성한다.

    ```R
    ex_vector <- c( -1,0,2)	# 숫자데이터 -1, 0, 1 을 ex_vector 변수에 할당하여 데이터 생성
    ex_vector	# ex_vector 변수 조회
    
    # 실행 결과
    [1] -1 0 1
    ```

  - 벡터는 중첩해도 생성이 가능하다.

    ``` R
    ex_over_vec = c(1,2,3,c(1,2,3))
    ```

  - 숫자형 벡터 데이터 생성시 start : end 형태로도 가능하다.

    ``` R
    x <- 1:10
    x
    # 실행결과
    [1]  1  2  3  4  5  6  7  8  9 10
    ```

  - <span style="color:blue">**rep()**</span> 함수를 활용해서 반복된 값의 벡터를 만들 수 있다.

    ```R
    rep(x,times)  # x엔 반복할 값, times엔 반복할 횟수
    rep(1:5,5)
    # 실행결과
    [1] 12345 12345 12345 12345 12345
    rep(1:5,each = 5) #each의 값만큼 각각 반복
    # 실행결과
    [1] 11111 22222 33333 44444 55555
    ```

  - <span style="color:blue">**seq() **</span>함수로 벡터 만들기

    ``` R
    seq(from,to,by) #from엔 시작값, to엔 끝값, by엔 step값으로 증가할 값.
    seq(1,10,2)
    # 실행결과
    [1] 1 3 5 7 9
    seq(1,10,length.out =5)  #length.out =5 step이 자동으로 정해져서 5개 출력
    # 실행결과
    [1] 1.00 3.25 5.50 7.75 10.00
    ```

  - 인덱싱이 가능하다!

    ```R
    ex_seq <- seq(1,100,by =3) # 함수 사용해서 assign 하는 것도 가능!
    ex_seq
    # 실행결과
    [1]   1   4   7  10  13  16  19  22  25  28  31  34  37  40  43  46
    [17]  49  52  55  58  61  64  67  70  73  76  79  82  85  88  91  94
    [33]  97 100
    
    ex_seq[1]  # 1번 index 번호에 해당하는 값 호출
    # 실행결과
    [1] 1
    
    ex_seq[length(ex_seq) - 4] #length(ex_seq)는 맨 마지막 번호를 의미
    # 실행결과
    [1] 88
    
    # 조건식으로 인덱싱을 주는 것도 가능!
    ex_seq[ex_seq>=10 & ex_seq <= 30] # & : and, | : or 을 의미
    # 실행결과
    [1] 10 13 16 19 22 25 28
    
    # 음수 인덱스를 사용해 특정 요소만 제외가능!
    x <- c(1,2,3)
    x[c(-1,-3)] #1번과 3번 인덱스의 값 제외하고 출력 
    # 실행결과
    [1] 2 
    ```

  - 벡터의 각 셀에 이름을 부여할 수 있다.

    ```R
    x<-c(1,2,3)
    col<-c('c1','c2','c3')
    names(x) <- col #names() : 이름을 부여하는 함수
    x
    # 실행결과
    c1 c2 c3 
     1  2  3 
    x["c1"] # 이름으로도 인덱싱이 가능.
    # 실행결과
    c1 
     1 
    
    #이름으로 슬라이싱 X -> 나열해줘야함.
    ```

  - <span style="color:blue">**length()**</span>, <span style="color:blue">**nrow()**</span>, <span style="color:blue">**NROW()**</span> 함수

    ```R
    x<-c(1,2,3)
    length(x)		# x의 길이
    # 실행결과
    [1] 3
    nrow(x)			# Matrix에서 행의 개수 		
    # 실행결과
    NULL			# vector이기 때문에 NULL값 나옴.
    NROW(x)			# 행의 개수
    # 실행결과
    [1] 3
    ```

  - 벡터는 벡터끼리 연산이 가능하다.

    - %in% : 어떤 값이 벡터에 포함되어 있는 지를 알려주는 연산자.

      ```R
      ex_val <- 'a' %in% c('a','b','c')
      ex_val
      # 실행결과
      [1] TRUE
      ex_val2 <- 'A' %in% c('a','b','c')
      ex_val2
      # 실행결과
      [1] FALSE    # R은 대소문자를 구별하기 때문에 FALSE
      ```

    - <span style="color:blue">**union()**</span>: 합집합 , <span style="color:blue">**setdiff() **</span>: 차집합 , <span style="color:blue">**intersect()**</span> :교집합 , <span style="color:blue">**setequal()**</span> : 집한간의 비교

      - setequal() 는 TRUE/FALSE 값 리턴

      ``` R
      setdiff(c('a','b','c'),c('a','b'))
      # 실행결과
      [1] "c"
      union(c('a','b','c'),c('a','b'))
      # 실행결과
      [1] "a" "b" "c"
      intersect(c('a','b','c'),c('a','b'))
      # 실행결과
      [1] "a" "b"
      setequal(c('a','b','c'),c('a','b'))  
      # 실행결과
      [1] FALSE		#완벽하게 같을때에 TRUE값 리턴!
      ```

      

    


### 문자형 벡터 

 - 문자로 이뤄진 데이터.

 - 문자 데이터를 " " 또는 ' ' 로 감싼 형식( " "과 ' ' 구분X) 으로 구성한다. 

 - "a" >"b" 이런식의 비교가 가능하다

   	- why? 아스키코드에 근거해서 각문자에 할당된 숫자가 존재하기 때문.

   

   #### [정규표현식(regular expression)] : 텍스트의 패턴을 찾을 때 사용

   <span style="color:yellowgreen">*****</span>   0 or more.

   <span style="color:yellowgreen">**+**</span>   1 or more.

   <span style="color:yellowgreen">**?**</span>    0 or 1.

   <span style="color:yellowgreen">**.**</span>    무엇이든 한 글자를 의미

   <span style="color:yellowgreen">**^ **</span>  시작 문자 지정 

   <span style="color:yellowgreen">**^[abc]**</span>  abc중 한 단어 포함한 것으로 시작

   <span style="color:yellowgreen">**[^]**</span> 해당 문자를 제외한 모든 것  ex)`[^abc]`  : a,b,c 는 빼고

   <span style="color:yellowgreen">**$**</span>  끝 문자 지정

   <span style="color:yellowgreen">**[a-z]**</span> 알파벳 소문자 중 1개

   <span style="color:yellowgreen">**[A-Z]**</span> 알파벳 대문자 중 1개

   <span style="color:yellowgreen">**[0-9]**</span> 모든 숫자 중 1개

   <span style="color:yellowgreen">**[a-zA-Z] **</span>모든 알파벳 중 1개

   <span style="color:yellowgreen">**[가-힣]**</span> 모든 한글 중 1개

   <span style="color:yellowgreen">**[^가-힣]**</span> 모든 한글을 제외한 모든 것

   <span style="color:yellowgreen">**[:punct:]**</span> 구두점 문자, ! " # $ % & ’ ( ) * + , - . / : ; < = > ? @ [ ] ^ _ ` { | } ~.

   <span style="color:yellowgreen">**[:alpha:]**</span> 알파벳 대소문자, 동등한 표현 [A-z]

   <span style="color:yellowgreen">**[:lower:] **</span>영문 소문자, 동등한 표현 [a-z]

   <span style="color:yellowgreen">**[:upper:] **</span>영문 대문자, 동등한 표현 [A-Z].

   <span style="color:yellowgreen">**[:digit:] **</span>숫자, 0,1,2,3,4,5,6,7,8,9,

   <span style="color:yellowgreen">**[:xdigit:] **</span>16진수  [0-9A-Fa-f]

   <span style="color:yellowgreen">**[:alnum:]**</span> 알파벳 숫자 문자, 동등한 표현[A-z0-9].

   <span style="color:yellowgreen">**[:cntrl:]**</span> \n, \r 같은 제어문자, 동등한 표현[\x00-\x1F\x7F].

   <span style="color:yellowgreen">**[:graph:] **</span>그래픽 (사람이 읽을 수 있는) 문자, 동등한 표현

   <span style="color:yellowgreen">**[:print:]**</span> 출력가능한 문자, 동등한 표현

   <span style="color:yellowgreen">**[:space:]**</span> 공백 문자: 탭, 개행문자, 수직탭, 공백, 복귀문자, 서식이송

   <span style="color:yellowgreen">**[:blank:]**</span> 간격 문자, 즉 스페이스와 탭.

   

#### 문자열을 다루는 함수

 - <span style="color:blue">**grep()**</span> , <span style="color:blue">**grepl()**</span> :  x라는 문자열에서 해당 패턴이 존재하는가를 알아보는 함수

    -  **grep(pattern, x, ignore.case = F, value = F)**    → index를 return
        -  ignore.case = T 일경우엔 대소문자 구분 X
        -  value = T 일경우엔  → value값(=문자열)을 return
    -  **grepl(pattern, x, ignore.case = F)**   →TRUE / FALSE를 return

   ``` R
   strVec <- c("gender","height","age","weight","eight")
   # ei로 시작하는 값을 추출한다면
   grep("^ei",strVec) 
   # 실행결과 →인덱스인 5가 출력됨 
   [1] 5
   grep("^EI",strVec,ignore.case =T ,value =T) 
   # 실행결과 → value = T 이므로, 해당인덱스의 value인 eight이 출력됨
   [1] "eight"
   # ei를 포함하는 값을 추출한다면
   grep("ei",strVec,value =T)
   grep("+ei+",strVec,value =T)
   strVec[grep("ei",strVec)]
   # 실행결과 → 모두 같은 결과
   [1] "height" "weight" "eight"
   
   txtVec <-c("BigData","Bigdata","bigdata","Data","dataMining","class1","class2")
   txtVec
   
   # 소문자 b로시작하는 데이터를 추출한다면?
   grep("^b+",txtVec,value = T,ignore.case = F) 
   # +는 sql에서 %와 비슷. 문자의 노출 횟수가 1보다 크다는 의미
   # 실행결과
   [1] "bigdata"
   ```

-  <span style="color:blue">**gsub() **</span>: 해당 패턴을 가지는 문자열을 x에서 발견하여, replacement로 바꿔주는 함수

   - **gsub(pattern, replacement, x, ignore.case = F)**

   ``` R
   txtVec <-c("BigData","Bigdata","bigdata","Data","dataMining","class1","class2")
   
   # big 문자열이 있는 요소를 찾아 해당 문자열을 bigger라는 단어로 대체(대소문자 구별X)
   gsub("+big+","bigger",txtVec,ignore.case =T)
   # 실행결과
   [1] "biggerData" "biggerdata" "biggerdata" "Data"       "dataMining"
   [6] "class1"     "class2" 
   
   # 숫자를 제거하고 싶다면?  
   gsub("[0-9]","",txtVec) 
   gsub("[[:digit:]]","",txtVec) # [:digit:]의 경우, 대괄호에 한번 더 감싸줘야함.
   # 실행결과 (두식 모두 같은 결과임)
   [1] "BigData"    "Bigdata"    "bigdata"    "Data"       "dataMining"
   [6] "class"      "class"
   ```

   

-  <span style="color:blue">**substr()**</span> : 문자열에서 시작위치과 끝위치를 정하여 추출해내는 함수

    - **substr(x, start, stop)**
    - **str_sub(x, start, end)** - substr() 과 같은 역할!

   ``` R
   greetingMsg <- "hi, bigdata is very important"
   substr(greetingMsg,5,11) # index가 5번째부터 11번째까지의 문자열 추출. 
   # 실행결과
   [1] "bigdata"
   ```

-  <span style="color:blue">**strsplit()**</span> : 문자열을 쪼개는 함수

   -  **strsplit(x, split)**   
   -  split에 해당하는 문자를 기준으로 쪼갠다.

   ```R
   greetingMsg <- "hi, bigdata is very important"
   strsplit(greetingMsg, ",") # , 를 기준으로 쪼개는 것.
   # 실행결과
   [[1]]
   [1] "hi"                         " bigdata is very important"
   *주의! return값이 리스트! 
   ```

-  <span style="color:blue">**str_extract()**</span> : 단어에서 pattern만 뽑아서 pattern에 일치하는 값만 반환 

-  <span style="color:blue">**str_extract_all() **</span>: 해당하는 pattern만 뽑아서 list로 반환

   ``` R
   str_extract("abc123def456","[0-9]{3}")	# 문자열의 첫부분부터 처음으로 만난 패턴만 출력
   # 실행결과
   [1] "123"
   str_extract_all("abc123def456","[0-9]{3}") # 문자열전체에서 숫자pattern 전부 뽑아서 출력
   # 실행결과
   [[1]]
   [1] "123" "456"
   str_extract_all("abc123def456","[a-zA-z]{3}") #문자열전체에서 문자pattern 전부 뽑아서 출력
   # 실행결과
   [[1]]
   [1] "abc" "def"
   
   # 메타문자
   # 단어 : \\w
   # 숫자 : \\d
   # 특수문자 : \\해당 특수문자
   # 엔터키 : \n , 탭키 : \t
   # [] :  1회를 의미, {n} :  n반복
   
   ssn <- "730910-1234567"
   str_extract_all(ssn,"[0-9]{6}-[1-4][0-9]{6}")
   str_extract_all(ssn,"\\d{6}-[1-4]\\d{6}")
   # 실행결과 (두식의 결과 같음)
   [[1]]
   [1] "730910-1234567"
   ```



### 논리형벡터

 - TRUE, FALSE 라는 논리값으로 이루어진 데이터 (T, F도 가능)

 - 주로 데이터 값을 비교할 때 사용

 - 논리연산자 - & , | , ! (not) , xor ( 같지 않으면  T, 같으면 F)  

   ``` R
   c(T,F,T,TRUE,FALSE)
   # 실행결과
   [1]  TRUE FALSE  TRUE  TRUE FALSE
   !c(T,F,T,TRUE,FALSE) # 반대값 반환
   # 실행결과
   [1] FALSE  TRUE FALSE FALSE  TRUE
   c(T,F,T)&c(TRUE,TRUE,TRUE) # T&T → T,  T&F→ F,  F&F → F 
   # 실행결과
   [1]  TRUE FALSE  TRUE
   xor(c(T,F,F),c(TRUE,TRUE,FALSE)) 
   # 실행결과
   [1] FALSE  TRUE FALSE
   ```

- <span style="color:blue">**runif()**</span> : 최소값과 최대값 사이에 n개의 숫자 랜덤으로 생성.

  - **runif( n , min = 0 , max = 1)**

  ```R
  x <- runif(3) # 0 과 1사이 3개의 숫자 랜덤으로 생성
  x
  # 실행결과
  [1] 0.5110596 0.9267253 0.2912163
  any(x>0.8) # 1개라도 0.8 이상이면 TRUE
  # 실행결과
  [1] TRUE
  all(x<0.8) # 모든 값이 0.8 이하이면 TRUE
  # 실행결과
  [1] FALSE
  ```

  













