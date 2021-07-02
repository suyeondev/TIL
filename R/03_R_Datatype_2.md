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

  



