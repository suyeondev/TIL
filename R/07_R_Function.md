# 07. Function 

### 제어구문 - if, switch

- if 

- if - else 

- if - else if - else

  - 형식 

    - **if (조건식 -T/F를 return해야함){**

      **}else if (조건식){**

      **}else if(조건식){**

      **}else{**

      **}**

- 단일조건일 경우, **ifelse(조건, T일때, F일때)**

```R
# if-else 예시
> score <- 55
> if(score >= 60){
    print("합격")
  }else{
    print("불합격")
  }
[1] "불합격"

# if - else if - else 예시
# scan() - console로부터 데이터 입력받는 함수

>grade <-""

>if (score >= 90){
   grade <-"A"
 }else if(score>=80){
   grade <-"B"
 }else if(score>=70){
   grade <-"C"
 }else if(score>=60){
   grade <-"D"
 }else {
   grade <-"F"
 }
>grade
[1] "F"

>cat("당신의 점수는", score,"점이고, 당신의 학점은 ",grade,"입니다.")
당신의 점수는 55 점이고, 당신의 학점은  F 입니다.

>sprintf("당신의 점수는 %d 이고, 당신의 학점은 %s입니다",score,grade)
[1] "당신의 점수는 55 이고, 당신의 학점은 F입니다"

# ifelse 예시  ->입력도 벡터고, 출력도 벡터일때만 가능!
#주민번호를 가지고 남자 여자를 구분한다면?
>user.ssn<- "000101-1xxxxxx"
>str_sub(user.ssn,8)
>gender <- substr(user.ssn,8,8)

>ifelse(gender =='1'|gender =='3','남자','여자')
[1] "남자"

# ifelse 예시2
# 평균을 구한다면?
na.vec <-c(96,91,100,88,90,NA,95,100,NA,90)

ifelse(sum(is.na(na.vec))>=1, mean(na.vec,na.rm =T))
[1] 93.75

```

#### switch 함수





- **switch(data,case 구문,case 구문,case 구문)** 동등비교의 조건

  

```R
> switch('name03',
+        'name01'=30,
+        'name02'=40,
+        'name03'=50)
[1] 50

```



### 반복구문 - for, while, do - while

#### for 반복문

##### 형식 : for(변수 in 시퀀스 값){
##### 			}

```R
>user.sum = 0
>for(n in 1:10){
   user.sum <- user.sum + n
}
user.sum
[1] 55

>for(idx in 1:10){
   if(idx %% 2 != 0){
     cat(idx,'\t')

  }
}
1 	3 	5 	7 	9 

# 1~100사이에 홀수, 짝수의 합을 출력한다면?

>odd_sum <- 0
>even_sum <- 0
>for(idx in 1:100){
   if(idx %%2 != 0){
     odd_sum <- odd_sum +idx
    
   }else{
     even_sum <- even_sum + idx
   }
 }
>cat("odd_sum= ",odd_sum,"even_sum = " ,even_sum)
odd_sum=  2500 even_sum =  2550

```

- 중복 for 반복문

  형식:  for(){ #행에 대한 인덱스

  ​				for(){ #열에 대한 인덱스

  ​				}

  ​			}

```R
>for(i in 2:9){
   cat('row i = ' , i ,'\n')
   for(j in 1:9){
    
     cat (i , '*',j ,'=',(i*j),"\t")
   }
   cat('\n')
 }

row i =  2 
2 * 1 = 2 	2 * 2 = 4 	2 * 3 = 6 	2 * 4 = 8 	2 * 5 = 10 	2 * 6 = 12 	2 * 7 = 14 	2 * 8 = 16 	2 * 9 = 18 	
row i =  3 
3 * 1 = 3 	3 * 2 = 6 	3 * 3 = 9 	3 * 4 = 12 	3 * 5 = 15 	3 * 6 = 18 	3 * 7 = 21 	3 * 8 = 24 	3 * 9 = 27 	
row i =  4 
4 * 1 = 4 	4 * 2 = 8 	4 * 3 = 12 	4 * 4 = 16 	4 * 5 = 20 	4 * 6 = 24 	4 * 7 = 28 	4 * 8 = 32 	4 * 9 = 36 	
row i =  5 
5 * 1 = 5 	5 * 2 = 10 	5 * 3 = 15 	5 * 4 = 20 	5 * 5 = 25 	5 * 6 = 30 	5 * 7 = 35 	5 * 8 = 40 	5 * 9 = 45 	
row i =  6 
6 * 1 = 6 	6 * 2 = 12 	6 * 3 = 18 	6 * 4 = 24 	6 * 5 = 30 	6 * 6 = 36 	6 * 7 = 42 	6 * 8 = 48 	6 * 9 = 54 	
row i =  7 
7 * 1 = 7 	7 * 2 = 14 	7 * 3 = 21 	7 * 4 = 28 	7 * 5 = 35 	7 * 6 = 42 	7 * 7 = 49 	7 * 8 = 56 	7 * 9 = 63 	
row i =  8 
8 * 1 = 8 	8 * 2 = 16 	8 * 3 = 24 	8 * 4 = 32 	8 * 5 = 40 	8 * 6 = 48 	8 * 7 = 56 	8 * 8 = 64 	8 * 9 = 72 	
row i =  9 
9 * 1 = 9 	9 * 2 = 18 	9 * 3 = 27 	9 * 4 = 36 	9 * 5 = 45 	9 * 6 = 54 	9 * 7 = 63 	9 * 8 = 72 	9 * 9 = 81 

```

#### while 구문

- while(조건식)  : 조건식에 만족할때만 loop를 돈다. 만족 안할 시엔 빠져나감. 
-  *** 주의! while loop 안에 변수에 대한 증감이 필요!**

```R
idx<-1
while(idx<=10){
  print(idx)
  idx = idx + 1
}
[1] 1
[1] 2
[1] 3
[1] 4
[1] 5
[1] 6
[1] 7
[1] 8
[1] 9
[1] 10
```



- break : break만나면 루프 탈출.

- next : continue의 의미로 해당 루프 다시 돌게 만든다 -> 뒷문장은 실행안됨.

- repeat : 반복해줌.

  

```R
>idx<-1
  while(idx <= 10){
    print(idx)
    if(idx %% 2 != 0){
      break
      
    }
    idx = idx +1
 }
[1] 1

idx <- 1
repeat{
  print(idx)
  if (idx >= 10){
    break
  }
  idx<-idx+1
}
[1] 1
[1] 2
[1] 3
[1] 4
[1] 5
[1] 6
[1] 7
[1] 8
[1] 9
[1] 10
```

