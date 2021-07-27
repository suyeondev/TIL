# 07. 파이썬 함수 (Function)

## 함수란?

- 특정 용도의 코드를 한곳에 모아 이름을 붙인 것.

- 입력값을 가지고 어떤 일을 수행한 다음, 그 결과물을 내어놓는 역할을 한다.

  

### 함수를 사용하는 이유?

- 코드의 용도를 구분할 수 있다.

- 코드를 재사용할 수 있어 반복을 줄여 효율적이다.

- 실수를 줄일 수 있다.

  

### 함수의 구조

```python
def 함수명 (매개변수):
    수행할 코드1
    수행할 코드2
    ...
```



### 함수 호출방법

- 함수이름 () | 함수이름(인수1, 인수2)
- **매개변수 (parameter)** : 함수에 입력으로 전달된 값을 받는 변수. 
- **인수(arguments)** : 함수를 호출할 때 전달하는 입력값.
- **함수를 정의하고 호출해야함!** 정의안하고 호출 먼저하면 함수가 정의되지 않았다는 에러 발생!

```python
>>>def printHello(): # Hello를 출력하는 함수
...    	print("Hello!")
# printHello함수 호출하기
>>>printHello() # 인수가 없는 함수 호출할 때
Hello!



>>>def add(a,b): # a,b 가 매개변수
...    	return a+b
# add함수 호출하기
>>>print(add(2,3)) # 인수가 있는 함수 호출할때, 2,3이 인수.
5
```



### 함수의 형태

입력값 ---> 함수 ---> 결과값

- 일반적인 함수

  - 입력값 O, 결과값 X
  - 사용법 : 결과값을 받을 변수 = 함수이름(입력인수1, 입력인수2

  ```python
  # 일반적인 함수 예시
  >>>def add(a, b): 
      	result = a + b 
      	return result
  # 사용 예시    
  >>>a = add(2,3)
  >>>print(a)
  5
  ```

  

- 입력값이 없는 함수

  - 입력값 X, 결과값 O
  - 사용법 : 결과값을 받을변수 = 함수이름()

  ```python
  # 입력값이 없는 함수 예시
  >>>def Hello():
      	return "Hello"
  # 사용 예시   
  >>>a = Hello()
  >>>print(a)
  Hello
  ```

  

- 결과값이 없는 함수

  - 입력값 O, 결과값 X
  - 사용법 : 함수이름(입력인수1 , 입력인수2)
  - 결과값은 return명령어로만 돌려받을 수 있다!
    - **return명령어 없다면 결과값 없다!**

  ```python
  # 결과값이 없는 함수 예시
  >>>def add(a,b):
      	print("{}와 {}의 합은 {}입니다.".format(a,b,a+b))
  # 사용 예시
  >>>add(2,3)
  2와 3의 합은 5입니다. 
  
  >>>a = add(2,3)
  >>>print(a)
  None # 결과값이 없기 때문에 None
  ```

  

- 입력값도 결과값도 없는 함수

  - 입력값 X, 결과값 X
  - 사용법 :  함수이름()

  ```python
  # 입력값도 결과값도 없는 함수 예시
  >>>def Hello():
      	print("Hello")
      
  # 사용 예시
  >>>Hello()
  Hello
  ```



### 입력값이 여러개인 경우





### 함수에서 값을 여러개 반환하기





```python
# function : 사용자 정의 함수를 만들어본다면?
from bigdata.study.userFunc import *
# from bigdata.study import userFunc으로 모듈을 임포트해주는 것도 가능
# 단, printGreeting함수 사용하려면 모듈을 import해서 userFunc.printGreeting() 이런식으로 사용해야함
# 그래서 주로 from부분에 모듈까지 가져오는 경우가 많음.
# 특정함수를 가져오고 싶으면 import 뒤에 열거하면 되고, 다 가져오고 싶으면 *를 사용하면 ok
printGreeting()
printCoin()
result = mySum(1,2,3)
print('call mySum()', result)

msg = returnMsg(10)
print('msg : ' ,msg)
print(printCoin()) # 함수가 리턴값이 없을땐 None이 같이 출력

# 변수의 스코프
data = [1,3,5,7,9]
tot = 0

def totalCalc(data):
    for d in data:
        global tot # 전역변수 선언해주는 것.
        tot += d
    return tot

print(totalCalc(data))
print(tot)

oddSum , evenSum = countSum(1,1000)
print( oddSum,evenSum)

print('makeurl call' ,makeUrl('naver'))

url = ['naver', 'google','samsung']
urlList = makeUrl(url)
print(urlList)

# 입력 문자열을 한줄에 다섯글자씩 출력하는 print_5line(string)함수 작성
print_5line('아이엠어보이유알어걸')

# 숫자로 구성된 리스트를 입력받아, 짝수들을 추출하여 리스트로 반환하는 pickupEven 함수를 구현하라

myList = [3,4, 10, 23, 34, 3, 6]
print('result : ',pickupEven(myList))

argsTuple('kim','jo','choi')

userStatistic('SUM',1,2,3,4,5)
userStatistic('AVG',1,2,3,4,5)
userStatistic('STD',1,2,3,)


kwargsDict(name = 'jslim')
kwargsDict(name = 'jslim',name1 = 'parksu')
kwargsDict(name = 'jslim',name1 = 'parksu', name2 = 'cho')

personInfo(77, 178, name='jslim' ,address='seoul',gender = 'M')

# 전체혼합
mixtype(10,20,'kim','lim','park','cho', age1 = 20, age2 = 30, age3 = 40)

# lambda 함수
# lambda 인자 : 구현부
lambdaFunc =lambda x, y: x*y
lambdaFunc(10,20)
# 함수내에 함수가 들어가도 된다.
# 함수에 함수를 인자로 넣어줄 수 있다.
def func_final(x,y,func):
    print(">>>>", x*y,func)
func_final(10,20,lambda x, y : x*y)

# Hint 어떤 타입을 넣어야 되고 어떤 타입이 리턴되는지 힌트를 주는 것.
def tot_length(word : str, num: int) -> int:
    return len(word)*num
print('hint : ', tot_length('i love you', 10))

def tot_length2(word : str, num : int) -> None:
    print('hint:', len(word)*num)

# 인자로 넘겨받은 년도에서 윤년에 해당하는 년도만 한줄에 5개씩 출력
leap_year_list = leay_year_loop(1900,2021)

cnt = 0
for i in range(len(leap_year_list)):
    print(leap_year_list[i], end = '\t')
    cnt += 1
    if cnt % 5 == 0 :
        print()
        
```