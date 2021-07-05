# 03.Datatype 2



## 행렬(Matrix)

- 단일형이며 행과 열로 구성된 2차원 데이터.

### 행렬 생성하기

- **matrix( 변수명,  nrow = 행개수,  ncol = 열개수  ,dimnames = NULL)**

  - dimnames로 행 이름과 열 이름을 부여할 수 있다.
  - ex ) dimnames = list(c("r1","r2"),c("c1","c2"))  *단, list형태로 줘야함!
  - 행의 이름과 열의 이름을 이용해서 인덱싱 가능!

  ```R
  x <- c(1,2,3,4)
  matrix(x, nrow =2, ncol =2 ) #변수 x를 2*2행렬로 구성
  # 실행결과
       [,1] [,2]
  [1,]    1    3
  [2,]    2    4
  
  class(matrix(x, nrow =2, ncol =2 )) # datatype 알아보기 위해 class함수 사용
  # 실행결과
  [1] "matrix" "array" 
  
  y <- matrix(c(1:4)) #nrow,ncol 생략한 경우 열을 기준으로 데이터가 생성됨.
  y
  # 실행결과  
       [,1]
  [1,]    1
  [2,]    2
  [3,]    3
  [4,]    4
  
  y <- matrix(c(1:4),nrow =2, byrow =T) #byrow =T를 쓰면 행을 기준으로 데이터가 생성됨.
  y
  # 실행결과
       [,1] [,2]
  [1,]    1    2
  [2,]    3    4
  
  
  # rbind()함수로 matrix 만들기 -> 행을 기준으로 만든다.
  x <- rbind(c(1,2,3),c(4,5,6))
  x
  # 실행결과
       [,1] [,2] [,3]
  [1,]    1    2    3
  [2,]    4    5    6
  
  # cbind()함수로 matrix 만들기 -> 열을 기준으로 만든다.
  x <- cbind(c(1,2,3),c(4,5,6))
  x
  # 실행결과
       [,1] [,2]
  [1,]    1    4
  [2,]    2    5
  [3,]    3    6
  ```

- <span style="color:blue">**t()**</span> , <span style="color:blue">**row()**</span>, <span style="color:blue">**col()**</span> 함수

  - t() 	 : 행과 열을 전환해주는 함수
  - row() : row의 index번호를 알려주는 함수
  -  col()  : column의 index번호를 알려주는 함수

  

- 데이터 접근 방법

  - **변수 이름[행 인덱스, 열 인덱스]**   -> matrix형으로 리턴

    - 행 인덱스와 열 인덱스를 비워놓는다는 건 전체행과 전체열을 의미

    ```R
    var01 <- matrix(c(1:9),3,3)
    var01
    # 실행 결과
         [,1] [,2] [,3]
    [1,]    1    4    7
    [2,]    2    5    8
    [3,]    3    6    9
    
    var01[c(1:2),2] #1,2행에 대한 2열의 성분만 출력
    # 실행 결과
    [1] 4 5
    #하나 이상일때는 c()로 자료구조의 형태로 써줘야함!
    
    #1행은 표시X, 1열과 3열에 대한 정보만 추출
    var01[-1,c(1,3)] #-로 해당 인덱스번호의 열이나 행을 제외가능
    
    #특정행만 가져오는건 특정행을 제외하는 것도 가능하다는 의미!
    var01[-c(1:2),]
    [1] 3 6 9
    
    #boolean값으로도 가능
    class(var01[-1,c(T,F,T)])
    
    # integer로 나오는 return값을 matrix로 return받고 싶다면?
    class(var05[, -c(1,3)])
    # 실행결과
    [1] "integer"
    
    class(var05[,2,drop=F]) #인덱싱 할때, drop = F 명시!
    # 실행결과
    [1] "matrix" "array" 
    
    #dimnames로 준 행이름과, 열이름으로도 인덱싱 가능!
    ```

  

- 행렬에 대한 연산이 가능하다

  - ex) 곱하기( ***** ) , 나누기 ( **/** ), 더하기( **+** ), 빼기 ( **-** )

  ``` R
  x<- matrix((1:9), nrow = 3, ncol = 3)
  x
  # 실행 결과
       [,1] [,2] [,3]
  [1,]    1    4    7
  [2,]    2    5    8
  [3,]    3    6    9
  
  x * 2 # x이 각 요소에 2를 곱하기
  # 실행 결과 
       [,1] [,2] [,3]
  [1,]    2    8   14
  [2,]    4   10   16
  [3,]    6   12   18
  
  # 행렬과 행렬을 곱하기도 가능
  y <- matrix((1:9), nrow = 3, ncol = 3)
  x*y
  # 실행 결과
       [,1] [,2] [,3]
  [1,]    1   16   49
  [2,]    4   25   64
  [3,]    9   36   81
  
  # 행렬곱도 가능
  x %*% y
  # 실행 결과
       [,1] [,2] [,3]
  [1,]   30   66  102
  [2,]   36   81  126
  [3,]   42   96  150
  # 행렬곱할때, 앞행렬의 열의개수와 뒷행렬의 행의 개수가 같아야 함
  ```

- <span style="color:blue">**apply()**</span>함수 :vector 또는 matrix를 데이터로 받아서 임의의 함수를 적용한 결과를 얻는 함수

  - **apply( data,  방향,  함수 )**

    - 방향:  **1** → 행,  **2** → 열
    - 함수:  함수이름만 작성 ex) sum , mean

    ```R
    mat01 = matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3)
    mat02 = matrix(c(1,2,3,4,5,6,7,8,9), ncol = 3)
    
    apply(mat01, 1, sum) #행의 합
    # 실행 결과
    [1] 12 15 18
    
    apply(mat01, 2, sum) #열의 합
    # 실행 결과
    [1]  6 15 24   #vector로 나옴
    
    apply(mat01, 2, max) #열의 최대값
    # 실행 결과
    [1] 3 6 9
    ```

- <span style="color:blue">**rowSums()**</span>, <span style="color:blue">**colSums()**</span>, <span style="color:blue">**rowMeans()**</span>, <span style="color:blue">**colMeans()**</span> 함수 

  - 이 함수들 사용시 apply 안써도 가능!

    

- <span style="color:blue">**order()**</span> :정렬해주는 함수

  ```R
  order(iris[,1], decreasing = T)  # iris 데이터의 첫번째 열을 기준으로 내림차순 정렬한 순서를 index로 반환
  iris[order(iris[,1], decreasing = T),] #반환된 인덱스를 다시 행인덱스로 넣어준것 
  #→ 내림차순 정렬된 순서에 맞게 iris data가 재정렬 된상태
  
  #모든 데이터는 벡터를 이용해서 만든다
  ```

  

## 배열(Array) 

- 행렬을 n차원으로 확대한 구조로 단일형 데이터이다.

### 배열 생성하기

- **array( 변수명 , dim = c( 행 수, 열 수, 차원 수 ))**

- 2차원 배열은 matrix와 구별하기 어려워서 matrix array라고 나오지만, 3차원 배열부터는 array라고 나온다!

  ```R
  arr2 <- array(1:12, dim = c(3,4))	2차원 배열
  # 실행 결과
       [,1] [,2] [,3] [,4]
  [1,]    1    4    7   10
  [2,]    2    5    8   11
  [3,]    3    6    9   12
  
  class(arr2)
  # 실행 결과
  [1] "matrix" "array"		
  
  arr3 <- array(1:12,dim = c(2,2,3)) #C(2,2,3)에서 마지막 자리가 차원을 의미
                                 	  #3이라서 3차원배열
  arr3
  # 실행 결과
  , , 1
  
       [,1] [,2]
  [1,]    1    3
  [2,]    2    4
  
  , , 2
  
       [,1] [,2]
  [1,]    5    7
  [2,]    6    8
  
  , , 3
  
       [,1] [,2]
  [1,]    9   11
  [2,]   10   12
  
  class(arr3)
  # 실행 결과
  [1] "array"
  ```



- 데이터 접근 방법

  - 3차원배열 이름 [행번호, 열번호, 차원번호] 으로 값에 접근이 가능하다.

    ``` R
    arr3[1,1,2]
    # 실행 결과
    [1] 5
    
    arr3[1,1,] # 만약 차원의 요소를 주지 않으면 각차원값들 모두 나옴.
    # 실행 결과
    [1] 1 5 9
    ```

  - apply와 같은 연산 가능!

    ```R
    apply(arr3,2,mean)	#열의 값의 평균 
    # 실행 결과
    [1] 5.5 7.5
    apply(arr3,c(1,2),mean)	#행과 열의 값의 평균
    # 실행 결과
         [,1] [,2]
    [1,]    5    7
    [2,]    6    8
    ```

  - **dim()** 함수 : data의 정보를 반환해주는 함수

    ```R
    class(iris3) # 3차원 배열
    # 실행 결과
    [1] "array"
    
    dim(iris3)  
    [1] 50  4  3
    ##-->50은 행의 개수 4는 열의 개수 3은 차원의 개수
    ```

    

## 리스트(list)

- 1차원이며 다중형 데이터이다.

- 숫자형과 문자형 등 여러가지 데이터형을 동시에 포함할 수 있는 데이터 세트.

-  key = value로 담는 자료형.

  ```R
  exList <- list(name = "조수연" , age = 25)	# 리스트 생성
  # 실행 결과   #$뒤에 key값이 나오는 것 확인할 수 있다.
  $name
  [1] "조수연"
  
  $age
  [1] 25
  
  str(exList) #리스트의 구조
  # 실행 결과 
  List of 2
   $ name: chr "조수연"   # 문자형 데이터와 숫자형 데이터 2가지로 데이터형으로 구성된 리스트
   $ age : num 25
  
  #key값이 없는 경우.
  exList1 <- list(1:4,rep(3:5,2),"dog")
  exList1
  # 실행 결과    #key값이 없어 [[1]]과 같이 번호로 대체된 것 확인할 수 있다.
  [[1]]
  [1] 1 2 3 4
  
  [[2]]
  [1] 3 4 5 3 4 5
  
  [[3]]
  [1] "dog"
  
  str(exList1)
  # 실행 결과 
  List of 3
   $ : int [1:4] 1 2 3 4
   $ : int [1:6] 3 4 5 3 4 5
   $ : chr "dog"
  
  # 리스트가 리스트 중첩도 가능!
  overList <- list(a=list(c(1,2,3)),
                   b=list(c(1,2,3,4)))
  # 실행 결과 
  $a
  $a[[1]]
  [1] 1 2 3
  
  
  $b
  $b[[1]]
  [1] 1 2 3 4
  
  str(overList)
  # 실행 결과
  List of 2
   $ a:List of 1          
    ..$ : num [1:3] 1 2 3   #중첩되어 있고 키값이 없는 형태
   $ b:List of 1
    ..$ : num [1:4] 1 2 3 4
  
  ```



- 데이터 접근 방법

  - 여러 개의 벡터들이 컬럼이 되는 것!
    - 타입이 다른 벡터들이 하나의 리스트가 되어 만들어질 수 있다.
  - list의 요소를 가져올때는 key 값으로 접근해서 인덱싱해야 함.
    - key로 접근하면 벡터가 되서 그때부터 인덱싱이 가능하다.

  ```R
  # key를 활용한 정보는 $ 기호로 연결
  
  overList <- list(a=list(c(1,2,3)),
                   b=list(c(1,2,3,4)))
  
  # 내부의 리스트에 키값이 없을 경우,
  overList$a[[1]] #이런식으로 접근 가능
  # 실행 결과
  [1] 1 2 3
  
  overList2 <- list(a=list(e=c(1,2,3)),
                   b=list(f=c(1,2,3,4))) 
  overList2
  # 실행 결과
  $a        
  $a$e		
  [1] 1 2 3
  
  
  $b
  $b$f
  [1] 1 2 3 4
  
  str(overList2)
  List of 2
   $ a:List of 1
    ..$ e: num [1:3] 1 2 3  # 중첩되어있고 키값이 있는 상태
   $ b:List of 1
    ..$ f: num [1:4] 1 2 3 4
  
  # 내부의 리스트에 키값이 있을 경우엔 $와 키값을 활용해 접근가능!
  overList2$a$e
  # 실행 결과
  [1] 1 2 3
  
  
  userInfo <- list(name = 'suyeon',
                   address ='경기도',
                   tel     ='010-1111-1111',
                   age     = 25,
                   marraige= F)
  userInfo[1] 
  # 실행 결과
  $name
  [1] "suyeon"  # list형으로 반환 (서브리스트) 
  
  userInfo[[c(1,1)]] # 다시 인덱스로 접근해야 value값으로 받을 수 있음!
  # 실행 결과 
  [1] "jslim"  #vector형으로 반환
  
  userInfo$name
  # 실행 결과
  [1] "suyeon" #vector형으로 반환
  
  ```

  - 값 변경하고 싶을때 - 해당 값 인덱싱하고 assign해주면 됨

    ```R
    userInfo$age[1] <- 30 # 25->30 으로 변경
    userInfo$age
    # 실행 결과     
    [1] 30
    ```

  - 새로운 키, 값을 추가 - **list_name $ key_name  <-  c( key값 , vluae값 )**

    ```R
    userInfo$id <- "syeon"
    str(userInfo)
    # 실행 결과
    List of 6
     $ name    : chr "suyeon"
     $ address : chr "경기도"
     $ tel     : chr "010-1111-1111"
     $ age     : num 30
     $ marraige: logi FALSE
     $ id      : chr  "syeon"
    ```

    

## 데이터 프레임(Data Frame)

- 실제 업무에서 가장 많이 사용하는 데이터 세트
- 숫자형 벡터, 무자형 벡터 등 서로 다른 형태의 데이터를 묶을 수 있는 다중형 데이터 세트.
- **data.frame( 변수명 1 , 변수명 2 , ... , 변수명 n)**

