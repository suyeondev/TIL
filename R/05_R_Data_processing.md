# 05. 데이터 가공

#산술연산자
# <-, =, +, -, * , / : 나누기, %% : 나머지, %/% :몫, ^:제곱
#관계연산자
# == :동등비교, != :같지않다, >, >=, < <=
#논리연산자(TRUE, FALSE, T, F)
# &,|,xor

# 제어구문 & 반복구문
# 제어구문 - if, switch
# 반복구문 - for, while, do - while

# if ,if - else ,if - else if - else
# 단일조건일 경우 ifelse(조건, T일때, F일때)
data.logical <- T

#if(조건식 -T/F를 return해야함.){
#  
#}else{
#  
#}

if(data.logical){
  print("true")
}else{
  print("false")
}
score <- 55
if(score >= 60){
  print("합격")
}else{
  print("불합격")
}

#scan() - console로부터 데이터 입력받는 함수

grade <-""

if (score >= 90){
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
grade

cat("당신의 점수는", score,"점이고, 당신의 학점은 ",grade,"입니다.")
sprintf("당신의 점수는 %d 이고, 당신의 학점은 %s입니다",score,grade)

#주민번호를 가지고 남자 여자를 구분한다면?
user.ssn<- "730910-1xxxxxx"
str_sub(user.ssn,8)
gender <- substr(user.ssn,8,8)

if(gender == '1' |gender =='3'){
  print('남자')
}else{
  print('여자')
}


#ifelse  ->입력도 벡터고, 출력도 벡터일때만 가능!
ifelse(gender =='1'|gender =='3','남자','여자')

scores <- c(96,91,100,88,90)
ifelse(scores >= 90, 'pass', 'fail')

#평균을 구한다면?
na.vec <-c(96,91,100,88,90,NA,95,100,NA,90)


ifelse(sum(is.na(na.vec))>=1, mean(na.vec,na.rm =T))
ifelse(is.na(na.vec), mean(na.vec,na.rm =T), mean(na.vec))
#외부파일 불러오기
tmp.csv <- read.csv(file.choose())
str(tmp.csv)

tmp.csv$q5
q6<-ifelse(tmp.csv$q5 >=3 ,"bigger","smaller")
table(tmp.csv$q5)
#파일에 칼럼추가 (전처리과정 중 하나)
tmp.csv$q6 <- q6
#factor로 바꿔줌
tmp.csv$q6 <- as.factor(tmp.csv$q6)
str(tmp.csv)
table(tmp.csv$q6) #빈도수 
with(tmp.csv, tapply(q5,q6,sum))

tmp.csv <- read.csv(file.choose())
str(tmp.csv)
#특정 행을 가져와야 한다면, 조건에 만족하는 행 index얻어와야한다.
x <- c(1,2,3,4,5,6,7)
x

which(x==6) #x가 6인 값의 인덱스번호 리턴
tmp.csv[which(tmp.csv$State == 'Hawaii'),]


#switch(data,case 구문,case 구문,case 구문) 동등비교의 조건
user.name <- scan(what = character())  #what = 으로 들어올수 있는 데이터 형 지정해주는 것.
user.name

switch(user.name,
       '섭섭해'=30,
       '입정섭'=40,
       '임섭순'=50)

#반복문 - for
#for(변수 in 시퀀스 값){
#
#}
user.sum = 0
for(n in 1:10){
  user.sum <- user.sum + n
}
user.sum

for(idx in 1:10){
  if(idx %% 2 != 0){
    cat(idx,'\t')

  }
}

# 1~100사이에 홀수, 짝수의 합을 출력한다면?
odd_sum <- 0
even_sum <- 0
for(idx in 1:100){
  if(idx %%2 != 0){
    odd_sum <- odd_sum +idx
    
  }else{
    even_sum <- even_sum + idx
  }
}
cat("odd_sum= ",odd_sum,"even_sum = " ,even_sum)

setequal(c('a','b','c'),c('a','b'))

