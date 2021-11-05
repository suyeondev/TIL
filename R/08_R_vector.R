print(letters)
print(LETTERS)
month.abb
month.name

paste("a","b","c", sep =' ')
paste('a','b','c',sep='-')
paste('a','b','c')

name <- 'jslim'
print(name)

#cat으로 실행시
myFunc <- function(){
  total <- 0
  cat('append ...')
  for(i in 1:10){
    total <- total + i
    cat(i, "...")
  }
  cat("End!!", "\n")
  return(total)
}

myFunc()

#print로 실행시
myFunc <- function(){
  total <- 0
  print('append ...')
  for(i in 1:10){
    total <- total + i
    print(i)
  }
  print("End!!")
  return(total)
}
myFunc()

x <- c(0,1,4,9,16)
avg <- sum(x) / length(x)
avg

mean(x)

x <- 1:10
x

y <-x^2
y

z<- 1:10
z

plot(x,y)
#상관계수
cor(x,y)
mode(x)
typeof(x)
ex_vec <- c(TRUE,FALSE,TRUE,FALSE)
typeof(ex_vec)
mode(ex_vec)

str_vec <- c('가나다','라마바','사아자')
typeof(str_vec)
mode(str_vec)
str(str_vec)


sample_na_vec <- NULL
print(sample_na_vec)

sample_null_Vec <- NULL
print(sample_null_Vec)
is.null(sample_null_Vec)

over_vec = c(1,2,3,c(1,2,3))
over_vec
over_vec2
typeof(over_vec)

?seq
seq(1,10,2)
seq(1,10,length.out = 5)

ex_seq_vec <- seq(1,100,by = 3)
ex_seq_vec

#indexing 할 수 있다!
#조건식 and(&) , or(|)
ex_seq_vec [2]
ex_seq_vec[length(ex_seq_vec)-4]
ex_seq_vec[ex_seq_vec >= 10 & ex_seq_vec<30]
ex_seq_vec
ex_seq_vec[seq(1,length(ex_seq_vec),2)]

#벡터의 각 셀에 이름을 부여할 수 있다

x<-c(1,3,5)
col <- c('feature01','feature02','feature03')
names(x)<-col
x["feature01"]

x[c(1,3)]
x[c('feature01','feature03')]
names(x)[1]

#음수 인덱스를 사용해 특정 요소만 제외할 수 있다.
x[-1]
x[-2]
x[c(-1,-3)] 

#길이 length(), nrow(), NROW()
length(x)
nrow(x)
NROW(x)

#벡터의 연산 %in% - 어떤 값이 벡터에 포함되어 있는지를 알려주는 연산자

a_vec <- 'a' %in% c('a','b','c')
a_vec
b_vec <- 'A' %in% c('a','b','c')
b_vec

#setdiff()차집합, union()합집합, intersect()교집합, setequal()집합간의 비교
setdiff(c("a","b","c"),c("a","b"))
union(c('a','b','c'),c('a','b'))
intersect(c('a','b','c'),c('a','b'))
setequal(c('a','b','c'),c('a','b'))
setequal(c('a','b','c'),c('a','b','c'))
setequal(c('a','b','c'),c('a','b','d'))



# 100에서 200으로 구성된 벡터 sampleVec를 생성한 다음
# 각 문제를 수행하는 코드를 작성하세요~

# 문제01] 인덱스가 10번째인 값을 출력하세요

sampleVec <- c(seq(100,200,1))
sampleVec
sampleVec[10]

?head
head(sampleVec,10)

# 문제02] 끝에서 10개의 값을 잘라내어 출력하세요
tail(sampleVec,10)
sampleVec[(length(sampleVec)-10):length(sampleVec)]

# 문제03] 홀수만 출력하세요
sampleVec[sampleVec%%2 == 1]

# 문제04] 3의 배수만 출력하세요(%% 나머지 연산자)
sampleVec[sampleVec%%3 ==0]

# 문제05] 앞에서 20개의 값을 잘라내어 변수 d.20에 저장하고 d.20값을 출력
d.20 <- head(sampleVec,20)
d.30 <- sampleVec[1:20]
d.30
d.20
# 문제06] d.20의 5번째 값을 제외한 나머지 값들을 출력
d.20[-5]
# 문제07] d.20의 5,7,9번째 값을 제외한 나머지 값들을 출력
d.20[c(-5,-7,-9)]

?month.name
absent <- c(10,8,14,15,9,10,15,12,9,7,8,7)
names(absent) <- month.name
absent

# 5월(MAY)의 결석생 수를 출력하시오.
absent['May']
# 7월(JUL), 9월(SEP)의 결석생 수를 출력하시오.
absent[c("July","September")]
# 상반기(1~6월)의 결석생 수의 합계를 출력하시오.
sum(absent[c(1:6)])
# 하반기(7~12월)의 결석생 수의 평균을 출력하시오.
mean(absent[c(7:12)])


#논리형 벡터(T,F)
# & ,|,!(not)
c(T,F,T,TRUE,FALSE)
!c(T,F,T,TRUE,FALSE)
c(T,F,T)&c(TRUE,TRUE,TRUE)
xor(c(T,F,F),c(TRUE,TRUE,FALSE))
?runif
x <- runif(3)
x
any(x>0.8)
all(x<0.8)

#문자형 벡터
c('a','b','c','d','e')
"a">"b"
strVec <- c("H","S","T","N","O")
strVec[3] >strVec[5]


paste("May I","help u?")


paste(month.abb,1:12,c("st","nd","rd",rep("th",9)),sep ="")

# [정규표현식(regular expression)]

# *  0 or more.
# +  1 or more.
# ?  0 or 1.
# .  무엇이든 한 글자를 의미
# ^  시작 문자 지정 
# ex) ^[abc] abc중 한 단어 포함한 것으로 시작
# [^] 해당 문자를 제외한 모든 것 ex) [^abc] a,b,c 는 빼고
# $  끝 문자 지정
# [a-z] 알파벳 소문자 중 1개
# [A-Z] 알파벳 대문자 중 1개
# [0-9] 모든 숫자 중 1개
# [a-zA-Z] 모든 알파벳 중 1개
# [가-힣] 모든 한글 중 1개
# [^가-힣] 모든 한글을 제외한 모든 것
# [:punct:] 구두점 문자, ! " # $ % & ’ ( ) * + , - . / : ; < = > ? @ [ ] ^ _ ` { | } ~.
# [:alpha:] 알파벳 대소문자, 동등한 표현 [A-z]
# [:lower:] 영문 소문자, 동등한 표현 [a-z]
# [:upper:] 영문 대문자, 동등한 표현 [A-Z].
# [:digit:] 숫자, 0,1,2,3,4,5,6,7,8,9,
# [:xdigit:] 16진수  [0-9A-Fa-f]
# [:alnum:] 알파벳 숫자 문자, 동등한 표현[A-z0-9].
# [:cntrl:] \n, \r 같은 제어문자, 동등한 표현[\x00-\x1F\x7F].
# [:graph:] 그래픽 (사람이 읽을 수 있는) 문자, 동등한 표현
# [:print:] 출력가능한 문자, 동등한 표현
# [:space:] 공백 문자: 탭, 개행문자, 수직탭, 공백, 복귀문자, 서식이송
# [:blank:] 간격 문자, 즉 스페이스와 탭.


#grep
?grep

strVec <- c("gender","height","age","weight","eight")
#ei로 시작하는 값을 추출한다면
grep("^ei",strVec) #인덱스인 5가 출력됨
grep("^EI",strVec,ignore.case =T ,value =T)

#ei를 포함하는 값을 추출한다면
grep("ei",strVec,value =T)
grep("+ei+",strVec,value =T)
strVec[grep("ei",strVec)]

txtVec <-c("BigData","Bigdata","bigdata","Data","dataMining","class1","class2")
txtVec

#시작문자를 지정 ^
# 문자의 노출 횟수 +  1 or more
# 소문자 b로시작하는 데이터를 추출한다면?
grep("^b+",txtVec,value = T,ignore.case = F)

#big 문자열이 있는 요소를 찾아 해당 문자열을 bigger라는 단어로 대체
gsub("+big+","bigger",txtVec,ignore.case =T)

#숫자를 제거하고 싶다면?
gsub("[0-9]","",txtVec)
gsub("[[:digit:]]","",txtVec)
