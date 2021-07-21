# 05. 파이썬 제어구문 - IF

## If 조건문 

- 조건문은 특정 조건일 때 코드를 실행하는 문법으로 조건문 사용시, 조건에 따라 다른 코드 실행이 가능하다.

- if 구문 - if, elif, else

- 들여쓰기(Indent)가 중요!!

- 블럭을 정의할 때는 콜론(:) 사용!

- 조건이 참일 경우에만 블럭의 내용 수행.

- **if 조건문1 :**

  ​	 **실행문1**  # 조건문 1이 만족하는 경우에 실행

  **elif 조건문2:**

  ​	 **실행문2**  # 조건문 1에 만족하지 않고, 조건문 2에 만족하는 경우에 실행

  **else :**

   	**실행문3**  # 조건문 1, 2 에 모두 만족하지 않을 경우에 실행

```python
# 조건 부분에 ""이 들어간다면?
>>>if "": 
    print('pass') # error는 안남. -> 빈 리스트는 False기 때문에 error는 안나지만 블럭 내용은 수행X-> 'pass' 출력X

# input()함수로 문자열을 입력받아 변수에 저장후, if 조건문 실행.
score = int(input("정수를 입력하세요 : ")) # input()함수는 문자열을 리턴하기 때문에 숫자값과 비교를 위해 int()함수 사용해줘야함.
>>>if score >= 60 :
    	print('pass')
	else:
    	print('fail')
정수를 입력하세요 : >? 20 # score로 20 입력
fail # 60 미만이므로 fail

정수를 입력하세요 : >? 60 # score로 60 입력
pass # 60 이상이므로 pass

# 문제 1    
# 윤년을 구해본다면?
# 윤년의 조건 : 4의 배수이고 100의 배수가 아니거나 400의 배수일때
year = int(input("연도를 입력하세요 : "))
if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0) :
    print('윤년입니다.')
else:
    print('평년입니다.')

# 문제 1-1
# input() 함수를 이용해서 연도와 월을 입력받아 해당 년도가 윤년일 경우, 
# 2월달의 마지막일은 29일, 평년일 경우 2월의 마지막은 28일
# 출력의 형식은 xxxx년 x월 마지막일은 xx일 입니다.

year = int(input('년도 입력: '))
month = int(input('달 입력 : '))

# 방법 1 - month를 기준으로 조건 작성.
if month == 2: 
    if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0) : # if 중첩문
        lastday = 29
        print('{}년 {}월 마지막일은 {}일 입니다.'.format(year,month,lastday))
    else:
        lastday = 28
        print('{}년 {}월 마지막일은 {}일 입니다.'.format(year,month,lastday))

elif month in [1, 3, 5, 7, 8, 10, 12]:
    lastday = 31
    print('{}년 {}월 마지막일은 {}일 입니다.'.format(year,month,lastday))
else:
    lastday = 30
    print('{}년 {}월 마지막일은 {}일 입니다.'.format(year,month,lastday))


# 방법 2 - 마지막 날짜를 list로 만들어서 조건에 맞게 match.
year_month      = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
leap_year_month = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
if ( year % 4 == 0 and year % 100 != 0 ) :
    print('{} 년 {} 월 마지막 일은 {} 입니다'.format(year , month , leap_year_month[month - 1]))
elif ( year % 400 == 0 ) :
    print('{} 년 {} 월 마지막 일은 {} 입니다'.format(year , month , leap_year_month[month - 1]))
else :
    print('{} 년 {} 월 마지막 일은 {} 입니다'.format(year, month, year_month[month - 1]))

# 방법 3 - month를 기준으로 조건작성
year = int(input('년도 입력'))
month = int(input('달 입력'))
list31 = [1,3,5,7,8,10,12]
if month != 2:
    if month in list31:
        print("{}년 {}의 마지막 달은 31일 입니다".format(year,month))
    else:
        print("{}년 {}의 마지막 달은 30일 입니다".format(year, month))
else:
    if (year%4==0 and year%100 !=0) or year%400 ==0:
        print("{}년 {}의 마지막 달은 27일 입니다".format(year, month))
    else:
        print("{}년 {}의 마지막 달은 28일 입니다".format(year, month))


```



### if ~ in | not in 구문 

- in 연산자를 활용해 **들어있나 확인하는 조건**

```python
# 예시 - 계절에 맞는 과일 추천
>>>fruits = {'봄':'딸기','여름':'수박','가을':'사과','겨울':'귤'}
>>>season = input('계절 입력: ')
>>>if season in fruits :
    	print(fruits.get(season))
	else :
    	print('정확한 계절을 입력하세요.')
        
계절 입력: >? 봄
딸기

계절 입력: >? 보
정확한 계절을 입력하세요.

```



### 중첩 if 조건문

- if를 중첩해서 **if 안에 if 문 사용이 가능**하다!
- **들여쓰기에 주의**해야 한다! 
- 들여쓰기가 같은 줄은 같은 블럭으로 인지

```python
# A를 받은 학생중 평균점수에 따른 장학금 기준 리턴.
>>>grade = 'A'
>>>avg = int(input('평균점수를 입력하세요'))
>>>if grade == 'A':
    	if avg >= 95 :
        	print("장학금 100%")
    	elif avg >= 90 : 
        	print('장학금 90%')
        
평균점수를 입력하세요>? 95
장학금 100%

평균점수를 입력하세요>? 92
장학금 90%
```



### 3항 연산자 : 조건식, 참 , 거짓

- 형식 : **변수 = 참 if 조건식 else 거짓**

```python
# if-else문 사용할 때
>>>num = 9
>>>if num >= 5 :
    	result = num * 2
	else :
    	result = num + 2
18

# 3항 연산자 사용할 때 - 더 간결하게 작성 가능
>>>num = 9
>>>result = num * 2 if num >= 5 else num * 2
>>>print(result)
18

# 문제 1 - 주민번호로 성별을 판별해본다면? (3항 연산자 사용)
serialNum = input("주민번호를 입력하세요 ex)xxxxxx-1xxxxxx")
gender = serialNum.split('-')[1][0] # input받은 문자열을 -를 기준으로 두부분으로 분리후 뒷부분의 0번째 인덱스 가져온 것
result = '남자입니다' if (gender == '1'or gender == '3') else '여자입니다' 
print(result)

주민번호를 입력하세요 ex)xxxxxx-1xxxxxx>? 000000-3000000
남자입니다

주민번호를 입력하세요 ex)xxxxxx-1xxxxxx>? 000000-4000000
여자입니다
```



#### [실습문제]

-  1~10 사이의 난수를 생성하고 숫자를 맞춰보는 Guess Game 만들어보기

```python

from random import randint

answer = randint(1,100) # 1 ~ 100중에 난수 생성
for i in range(1,11):
    guess = int(input('1~100 사이의 숫자를 입력하세요 : ')) # 숫자 입력받기
    if guess == answer:
        print('정답입니다! 정답시도 횟수 : {}, 정답 : {} '.format(i, answer))
        break  # 정답을 맞췄을 경우 for 반복문을 빠져나가게 해줌.
    elif guess < answer:
        print('숫자가 작습니다. 더 큰 숫자를 넣어주세요')
    else:
        print('숫자가 큽니다. 더 작은 숫자를 넣어주세요.')

print('정답은 {} 입니다.'.format(answer))

```

