# 01. 파이썬 기초 - 자료형2

## 리스트( list )

- 요소들이 연속적으로 저장되는 형태의 자료형, 변수 여러개를 묶는 역할이다. 
- 순서 O , 중복 허용 O, 수정 , 삭제 가능
- index는 0부터!
- array 아니고, R의 Vector와 유사하다.
- 요소로 또 다른 리스트를 저장할 수 있다.
- list ,어떤 형의 요소든 다 담을 수 있음 -> 단일형 X



### 리스트 선언 방법

- 변수에 값을 저장할 때 **[ ]**(대괄호)로 묶어주면 리스트가 되며 각 값은 **,**(콤마)로 구분해준다.
- 리스트는 문자열, 정수 ,실수, 불등 모든 자료형을 저장할 수 있으며, 자료형을 섞어서 저장해도 된다.

- **리스트명 = [ 값, 값, 값]**
- **리스트명 = list()** 
- **리스트 = list(range(횟수))** | **리스트 = list( range( 시작, 끝 ,증가폭 ) )**  : range() 함수 활용해서 만들기도 가능!
  - **range(횟수)**  0부터 횟수 -1만큼의 연속된 숫자 생성.
    - ex) range(10) : 0부터 9까지 숫자 생성. →[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  - **range(시작, 끝)** : 시작부터 끝 -1 까지의 숫자 생성.
    - ex) range(2,11) : 2부터 10까지 숫자 생성 →[2, 3, 4, 5, 6, 7, 8, 9, 10]
  - **range( 시작, 끝 ,증가폭 )** : 시작부터 끝 -1 까지 증가폭만큼 증가하는 숫자 생성.
    - ex) range(1,11,2) : 1부터 10까지 2씩 증가하는 숫자 생성 → [1, 3, 5, 7, 9]
    - 증가폭이 음수면 해당 값만큼 숫자가 감소.

```python
# 리스트 선언 방식
>>>dumyList1 = [] # 요소가 0개인 dumyList 생성
>>>dumyList2 = list()  # 요소가 0개인 dumyList 생성
>>>print(dumyList1, dumyList2)
[] []

>>>dumyList = [1,2,3,4,'Hi',['Hello' ,'Python','Hi']] # 리스트 중첩 가능
>>>print(dumyList, type(dumyList)) 
[1, 2, 3, 4, 'Hi', ['Hello', 'Python', 'Hi']] <class 'list'> # type이 list인 것 확인 가능!

>>>print(dumyList[5][1]) # 중첩된 내부 리스트에 인덱싱으로 접근 가능!
Python

>>>print(dumyList[-1][1:3]) # 중첩된 내부 리스트에 슬라이싱도 가능! [1:2]가 아니라 [1:3]으로 해야함!
['Python', 'Hi']

# range를 사용해서 리스트 만들기
>>>range(0,10) # 0부터 9까지 숫자 생성. range(10)이랑 같은 의미.
>>>for i in range(0,10) :
...    print(i, end ='\t')
...
0	1	2	3	4	5	6	7	8	9

>>>c= list(range(10))
>>>print(c)
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]


#list도 연산이 가능하다

>>>x = [1,2,3]
>>>y = [4,5]

>>>z = x+y
>>>print(z, type(z)) 
[1, 2, 3, 4, 5] <class 'list'>  #각 요소의 합이 아닌 연결하는 연산이 수행됨. 행렬이 아니기 때문에! type도 list임

>>>print(z[0])
1
>>>z[0]= 10 #인덱스 한 값에 할당하면 재할당되서 수정이 됨.
>>>print(z) 
[10, 2, 3, 4, 5]  

num_list = [1,2,3,4,5,6,7]

>>>print('max : ', max(num_list)) # 최댓값
max :  7
>>>print('min : ', min(num_list)) # 최솟값
min :  1
>>>print('sum : ', sum(num_list)) # 합계
sum :  28
>>>print('mean : ', sum(num_list) / len(num_list)) # 평균구하는 함수 적용X , sum과 len 함수 활용해야함.
mean :  4.0
```



### 리스트에 요소 추가하기

|     함수      |                  기능                   |
| :-----------: | :-------------------------------------: |
| **append ()** | 요소 하나를 리스트에 마지막 요소로 추가 |
| **extend ()** |         리스트를 연결하여 확장          |
| **insert ()** |         특정 인덱스에 요소 추가         |

- **append( )** 함수

  - **리스트명.append( 요소 )**

  - 메서드를 호출한 리스트가 변경되며 새 리스트는 생성되지 않는다.

  - 빈 리스트에 값 추가도 가능!

    

- **extend()** 함수 

  - **리스트명.extend( 리스트 )**

  - 리스트 끝에 다른 리스트를 연결하여 리스트를 확장한다.

  - 호출한 리스트가 변경되며 새 리스트는 생성되지 않는다.

  - extend를 사용하면 리스트의 길이는 extend에 전달된 리스트의 길이만큼 증가한다.

    

- **insert( )**함수

  - **리스트명.insert( 인덱스, 요소 )**
  - 리스트의 특정 인덱스에 요소 하나를 추가한다.
    - **insert(0,** **요소)**: 리스트의 맨 처음에 요소를 추가
    - **insert( len( 리스트 ),  요소 )**: 리스트 끝에 요소를 추가
    - insert에 리스트를 넣으면 append처럼 리스트 안에 리스트가 들어간다. **(리스트 중첩)**

  ```python
  # append()로 요소 추가
  >>>z = [1, 2, 3, 4, 5]
  >>>z.append(7)
  >>>print(z)
  [1, 2, 3, 4, 5, 7]
  
  # extend로 리스트 [9,10] 연결
  >>>z.extend([9,10])
  >>>print(z)
  [1, 2, 3, 4, 5, 7, 9, 10]
  
  # insert()로 0번째 인덱스에 6을 추가
  >>>z.insert(0,6)
  >>>print(z)
  [6, 1, 2, 3, 4, 5, 7]
  ```

  

### 리스트에서 요소 삭제하기

| 함수         | 기능                                       |
| ------------ | ------------------------------------------ |
| **pop()**    | 마지막 요소 또는 특정 인덱스의 요소를 삭제 |
| **del()**    | 특정 인덱스의 요소를 삭제                  |
| **remove()** | 특정 값을 찾아서 삭제                      |

- **pop()** 함수

  - **리스트명.pop() :** 리스트의 **마지막 요소를 삭제**한 뒤 **삭제한 요소를 반환.**

  - **리스트명.pop( 인덱스 )** : **해당 인덱스의 요소를 삭제**한 뒤 **삭제한 요소를 반환**

    

- **del()** 함수

  - **리스트명.del( 인덱스 )** : **해당 인덱스의 요소를 삭제**



- **remove()** 함수

  - **리스트명.remove( 값 )** : 리스트에서 특정 값을 찾아서 삭제

  - 만약 리스트에 **같은 값이 여러개 있을 경우 처음 찾은 값을 삭제.**

    

  ```python
  # pop()함수로 요소 제거
  >>>z = [6, 1, 2, 3, 4, 5, 7, 9, 10] # z 리스트 생성
  >>>z.pop() # pop함수로 마지막 요소 제거
  10  # 삭제된 요소 반환된 것
  
  >>>print(z)
  [6, 1, 2, 3, 4, 5, 7, 9]
  
  >>>z.pop(0) # pop함수로 0번째 인덱스 요소 제거
  6 # 0번째 인덱스의 요소 삭제후 반환된 것.
  
  >>>print(z)
  [1, 2, 3, 4, 5, 7, 9]
  
  # del함수 사용해서 특정 인덱스 요소 제거
  >>>del z[0] # 0번째 인덱스의 요소 삭제
  >>>print(z)
  [2, 3, 4, 5, 7, 9]
  
  # remove함수로 4 제거
  >>>z.remove(4)
  >>>print(z)
  [2, 3, 5, 7, 9]
  
  # remove함수로 같은값이 여러개인 요소 제거
  >>>a = [1, 2, 3, 6, 3, 4, 5] 
  >>>a.remove(3) # 3 제거
  >>>print(a)
  [1, 2, 6, 3, 4, 5] # 왼쪽부터 처음 찾은 3 삭제
  ```



### 특정 값의 인덱스 구하기

- **index()** 함수
  - **리스트명.index( 값 )**
  - 리스트에서 특정 값의 인덱스를 구한다.
  - 같은 값이 여러개일 경우 처음 찾은 인덱스를 반환한다. (가장 작은 인덱스)

```python
>>> a = [1, 2, 3, 4, 2, 4]
>>> a.index(2) # 2의 인덱스 번호중 가장 작은 인덱스는 1이다.
1
```



### 특정 값의 개수 구하기

- **count()** 함수
  - **리스트명. count( 값 )**
  - 리스트에서 특정 값의 개수를 구한다.

```python
>>> a = [10, 20, 30, 15, 20, 40]
>>> print(a.count(20))
2
```



### 리스트의 순서를 뒤집기

- **reverse()** 함수
- **리스트명.reverse()** : 역순으로 정렬

```python
>>>a = [1, 2, 3, 4, 5]
>>>a.reverse() # a 리스트를 역순으로 정렬
>>>print(a)
[5, 4, 3, 2, 1]
```



### 리스트의 요소를 정렬하기

- **sort()** 함수

  - 리스트의 요소를 오름차순으로 정렬한다.(기본)

  - **리스트명.sort() | 리스트명.sort(reverse = False)** : 오름차순 정렬

  - **리스트명.sort(reverse = True)** : 내림차순 정렬

    

```python
>>>a = [1, 8, 4, 20, 5, 32] # a 리스트 생성
>>>a.sort() # 오름차순으로 정렬
>>>print(a)
[1, 4, 5, 8, 20, 32]

>>>a.sort(reverse=True) # 내림차순으로 정렬
>>>print(a)
[32, 20, 8, 5, 4, 1]
```



### 리스트의 할당과 복사

- **리스트 할당** : 변수의 값을 또 다른 변수에 할당할 수 있다 → 리스트를 만든 뒤 다른 변수에 할당이 가능하다. 

```python
# 리스트 a, b, c 비교
>>>a = [1,2,3] 
>>>b = [1,2,3]
>>>c = a # 변수 c에 리스트 a를 할당 = 리스트 a의 주소값을 받는 것 = 하나의 변수를 같이 참조하는 것. 

>>>print('a의 주소: ', id(a), 'b의 주소 : ', id(b), 'c의 주소 : ',id(c)) # a, b, c의 주소 비교
a의 주소:  2312234375744 b의 주소 :  2312233802432 c의 주소 :  2312234375744  # c는 리스트 a를 할당한 거라 a와 주소 동일하다.

# is 연산자 : 객체의 주소값을 비교
>>>print(a is b) # a와 b가 같은 리스트인지 확인
False # a와 b는 같은 값을 가진 리스트이지만, 각 다른 변수에 할당되어 주소값이 다르므로, 다른 리스트이다.

>>>print(a is c)
True # 같은 주소값을 참조하고 있기 때문에 같은 리스트이다.

>>>a[0] = 6 # a리스트의 0번째 인덱스 값을 6으로 수정.
>>>print( a, b, c)
[6, 2, 3] [1, 2, 3] [6, 2, 3] # a와 b는 다른 리스트라 b는 수정이 안되지만, a와 c는 같은 리스트라 동시에 수정되었다. 
            
  
```

- **리스트 복사**  : **copy**함수를 이용해서 변수를 할당하면, 복사가 되어 다른 주소 값을 가져서 원본데이터에 영향이 가지 않는다.

```python
from copy import copy
>>>a = [1,2,3] 
>>>b = copy(a) # copy 함수로 리스트 복사
>>>print(a is b) 
False # copy함수로 리스트 복사해서 서로 다른 리스트기 때문에 다른 주소값을 가지고 있다.

>>>b[0] = 6 # a리스트 요소 수정
>>>print(a, b)
[1, 2, 3] [6, 2, 3] # b만 수정된 것 확인할 수 있다. 
```



### 중첩 리스트 (inner list)

- [ [], [] ]

- 중첩리스트도 인덱싱, 슬라이싱 가능

  ```python
  >>>a = ['a', 'b', 'c']
  >>>b = [10 , 3.14 , True , 'string' , a] # 변수를 활용해서 다른 리스트의 요소로 할당 가능! → 중첩리스트
  >>>print( b[-1][1:]) # b 리스트의 마지막 요소인 a리스트에서 인덱스 1번부터 끝까지 가져오기
  ['b', 'c']#list에서 단일 값이 아닌 경우를 슬라이싱할 경우 list로 반환.
  ```



### List comprehension

- list안 for 구문 포함한 것 

- **변수 = [ 실행문 for 변수 in 열거형객체]**

- for루프에서 실행문을 돈 결과를 변수에 할당가능

- **변수 = [ 실행문 for 변수 in 열거형객체 if 조건식]** : if함수로 조건식도 활용 가능

  ```python
  # 리스트 x의 각 요소에 제곱을 해주고 싶다면?
  >>>x = [2,4,1,5,3]
  >>>print( x ** 2)  # 파이썬의 리스트는 행렬이 아니기 때문에 오류 발생.
  TypeError: unsupported operand type(s) for ** or pow(): 'list' and 'int'
  
  # list comprehension 활용한 방법!
  >>>result = [value ** 2 for value in x] # x의 각 요소에 제곱해서 result 변수에 리스트로 할당
  >>>print('comprehension result :', result)
  comprehension result : [4, 16, 1, 25, 9]     
  
  # if함수를 활용해, 3의 배수인 요소만 반환
  >>>result = [value ** 2 for value in x if value % 3 ==0]
  >>>print('comprehension result :', result)
  comprehension result : [9]
      
  # 다른 방법! - for문으로 반복을 통해 x리스트의 요소를 제곱하고 3의 배수인 경우만빈 리스트인 result에 할당
  
  >>>result = []
  >>>for value in x :
      	calc = value ** 2 # 제곱한 값을 calc에 할당
      	if calc % 3 == 0:
          	result.append(calc)
  >>>print(result)
  [9]
  ```



- 연습문제  - range() 함수를 이용해서 1~100 사이의 3의 배수만 출력해본다면?

  ```python
  # 방법1.list Comprehension 활용
  >>>result = [value for value in range(1,101) if value % 3 == 0]
  >>>print(result)
  [3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 84, 87, 90, 93, 96, 99]
  
  # 방법2. for문 활용
  >>>result = []
  >>>for i in range(1,101) :
      	if i % 3 == 0 :
          	result.append(i)
  >>>print(result)
  [3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 84, 87, 90, 93, 96, 99]
  ```

👉참고 !  - range를 사용하다가 type에 문제가 있을 수 있어서 list를 씌워줘서 형변환 해줘야하는 경우도 있음. ex) list(range(1,101))



## 튜플 (tuple)

- 순서O, 중복O → 인덱싱과 슬라이싱이 가능하다.

- 수정X, 삭제X  → **불변 (immutable)**

- 읽기 전용

- 선언 방법 :  **(),  tuple()** 각 값은 콤마( , ) 로 구분해준다.

  ```python
  >>>a = (3)
  >>>b = (3,) # 요소가 하나일때 ,를 안주면 int형으로 받아들여서 꼭 , 줘야함.
  >>>print(a,b, type(a), type (b), end=' ')
  3 (3,) <class 'int'> <class 'tuple'> 
  
  # 소괄호 안줘도 tuple로 만들기 가능
  >>>myTuple = 1,2,3,4,5
  >>>print(myTuple, type(myTuple))
  (1, 2, 3, 4, 5) <class 'tuple'>
  
  >>>print( myTuple[0:2], myTuple[0])
  (1, 2) 1
  
  # 수정, 삭제 불가
  
  # myTuple[0] = 10
  
  #print(myTuple) # TypeError: 'tuple' object does not support item assignment 라는 오류가 뜸.
  >>>myTuple = 1,2,3,4,5
  >>>myList= list(myTuple) # 이런식으로 리스트로 만들어줘서 새로운 변수에 담으면 수정, 삭제 가능
  myList[0] = 10
  >>>print('append - ' , myList) # 수정사항 확인.
  append -  [10, 2, 3, 4, 5]
  >>>print('4의 index' , myTuple.index(4)) # myTuple에서 4의 index
  4의 index 3
  >>>print('4의 개수', myTuple.count(4))  # myTuple에서 4의 개수
  4의 개수 1
  
  # 1 ~ 99까지의 정수 중 짝수만 튜플에 저장한다면?
  >>>data = tuple(range(2,100,2) )
  >>>print(data, type(data))
  (2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98) <class 'tuple'>
  
  ```
  
  

#### Packing, Unpacking

- 리스트와 튜플을 사용하면, 변수 여러 개를 한번에 만들 수 있다. 
- **packing** : 변수에 리스트 또는 튜플을 할당하는 과정.
- **unpacking** : 리스트와 튜플의 요소를 변수 여러개에 할당하는 것 ⇒각각의 변수에 풀어놓는 것.
  - unpacking할때 주의사항!
    - 변수의 개수와 리스트 또는 튜플의 요소 개수가 같아야 한다 ⇒**좌변과 우변의 개수가 같아야 함!**
    - 좌변과 우변의 개수가 안맞는데도 가능한 경우가 있음 , *** 사용하면 개수가 같지 않더라도 unpacking이 가능!**

```python
# packing & unpacking

>>>a = (1,2,3) # packing
>>>b,c,d = (4,5,6) # unpacking
>>>print(a,b,c,d, type(a), type(b))
(1, 2, 3) 4 5 6 <class 'tuple'> <class 'int'> # packing으로 할당한 것은 타입이 tuple이고, unpacking으로 할당한 것은 int형인 것을 알 수 있다.

# 좌변과 우변의 개수가 다른데도 가능한 경우
a,b,*c = (0,1,2,3,4,5) # *를 붙여준 함수에 나머지 할당
print(a,b,c, type(a), type(b), type(c)) 
0 1 [2, 3, 4, 5] <class 'int'> <class 'int'> <class 'list'>

a, *b, c = (0,1,2,3,4,5) # 알아서 내부적으로 개수 맞춰줌. *없는 변수들은 각각 1개씩 할당 후 *붙여준 변수에 나머지 개수를 할당.
print(a, b, c, type(a), type(b), type(c)) 
0 [1, 2, 3, 4] 5 <class 'int'> <class 'list'> <class 'int'>
```



# dictionary {key : value}
- 순서X , 키 중복 허용 X (키 - 값은 1:1대응)
  - 순서가 없어서 **인덱싱이 불가능! → key값으로 데이터에 접근해야함.**

- 수정O , 삭제O

- 선언 방법 : **{} , dict()**
  - **딕셔너리 = { 키1 : 값1, 키2 : 값2}**
  - **딕셔너리 = dict( 키1 = 값1, 키2 = 값2 )**
  - **딕셔너리 = dict(zip([키1, 키2], [값1, 값2] ))**
  - **딕셔너리 = dict( [ (키1, 값1), (키2, 값2) ] )**
  - 중괄호{ } 안에 **키 : 값** 형식으로 저장하며 각 키와 값은 콤마( , ) 로 구분
  - 키에는 리스트, 딕셔너리 사용X

```python
>>>exDict = {} # 빈 딕셔너리 할당
>>>print(exDict, type(exDict)) # 빈딕셔너리 출력, 타입확인
{} <class 'dict'>

>>>exDict1 = {
    'one' : 1, 'two': 2, 'three' : 3, 'four' : 4
}
>>>print(exDict1, type(exDcit1)) 
{'one': 1, 'two': 2, 'three': 3, 'four': 4} <class 'dict'>

# dict함수로 dictionary만들기
>>>exDict2 = dict(one = 1, two = 2, three = 3, four = 4)
>>>print(exDict2,type(exDict2))
{'one': 1, 'two': 2, 'three': 3, 'four': 4} <class 'dict'>

# key값이 중복된다면?
>>>exDict3 = {
    'one' : 1, 'one' : 5 ,'two': 2, 'three' : 3, 'four' : 4
}
>>>print(exDict3, type(exDict3))
{'one': 5, 'two': 2, 'three': 3, 'four': 4} <class 'dict'> # 키가 중복되면 중복되는 값 중 가장 뒤에 있던 값만 사용.
```

#### in 연산자

- 키 유무 검사할 수 있다.

  ```python
  >>>fruitDict = {
      'melon'    : ['멜론',20000,'green'], # 영어명 : [한글명,가격(1개),색] 
      'apple'   : ['사과',3000,'red'],
      'orange'     : ['오렌지',1000,'yellow']
  }
  >>>print(type(fruitDict))
  <class 'dict'>
  
  >>>print('melona' in fruitDict) # melona라는 키값이 있는 지 확인
  False
  
  >>>print('apple' in fruitDict)
  True
  
  # 데이터 접근 방식 -> 키로 접근 가능!
  >>>print(fruitDict[0])
  KeyError: 0 # 딕셔너리는 인덱싱이 불가능해서 키에러가 발생.
  
  >>>print(fruitDict.get('address')) # get함수 이용하여 가져올수도 있음.
  None #해당 key 값이 없을때 None 출력
  >>>print(fruitDict['melon'], type(fruitDict['melon']))
  ['멜론', 20000, 'green'] <class 'list'> # 리스트로 반환되기 때문에 인덱싱이 가능하다!
  
  
  >>>print('멜론은 %s색이고, 1개 기준 가격은 %d입니다.' % (fruitDict['melon'][2],fruitDict['melon'][1]))
  멜론은 green색이고, 1개 기준 가격은 20000입니다.
  
  #format방식으로
  print('멜론은 {}색이고, 1개 기준 가격은 {}입니다.'.format(fruitDict['melon'][2],fruitDict['melon'][1]))
  멜론은 green색이고, 1개 기준 가격은 20000입니다.
  
  # 사과 가격을 10% 인상시키려면? 
  >>>fruitDict['apple'][1] = fruitDict['apple'][1] * 1.1
  >>>print(fruitDict)
  {'melon': ['멜론', 20000, 'green'], 'apple': ['사과', 3300.0000000000005, 'red'], 'orange': ['오렌지', 1000, 'yellow']}
  
  # 요소를 추가한다면?
  >>>fruitDict.update({'grape' : ['포도',10000,'purple']})
  >>>print(fruitDict)
  {'melon': ['멜론', 20000, 'green'], 'apple': ['사과', 3300.0000000000005, 'red'], 'orange': ['오렌지', 1000, 'yellow'], 'grape': ['포도', 10000, 'purple']}
  
  ```

  

#### zip 함수 

- 반복가능한 객체 여러개를 넣으면 요소 순서대로 튜플로 묶어서 zip객체를 반환.

```python
#아래 두개의 튜플을 하나의 딕셔너리로 만들고 싶다면?
keys = ('apple','pear','peach')
vals = (1000,1500,2000)

# zip 사용X, forloop활용해서
>>>zipDict ={}
>>>for i in range(len(keys)):
    	zipDict.update( {keys[i] : vals[i]} )

>>>print(zipDict, type(zipDict))
{'apple': 1000, 'pear': 1500, 'peach': 2000} <class 'dict'>

#zip 사용할때. 단, zip 사용할때는 개수가 같아야함! - 리스트의 경우에도 사용 가능
>>>zipDict2 = dict(zip(keys, vals))
>>>print(zipDict2, type(zipDict2))
{'apple': 1000, 'pear': 1500, 'peach': 2000} <class 'dict'>

```



#### dict_keys() , dict_values(), dict_items()

- dict_keys() : key값 가져오기
- dict_values() : value값 가져오기
- dict_items() : key,value 한꺼번에 가져오기

```python
zipDcit = {'apple': 1000, 'pear': 1500, 'peach': 2000}

>>>for key in zipDict.keys():
    	print(key)
apple
pear
peach

>>>for value in zipDict.values():
    	print(value)
1000
1500
2000

>>>for key, value in zipDict.items():
    	print(key, value)  # 내부적으로 언패킹한것.
apple 1000
pear 1500
peach 2000

>>>for key, value in zipDict.items():
    	print('{} : {}'.format(key, value))
apple : 1000
pear : 1500
peach : 2000

    
```



#### 삭제 - pop() , clear()

- **pop ()** : 요소를 꺼내고 없애는 것
- **clear()** : 다 없애기

```python
# pop함수 사용해서 삭제
>>>zipDcit = {'apple': 1000, 'pear': 1500, 'peach': 2000}
>>>zipDict.pop('apple') # apple 삭제
1000 #value값 반환 후 삭제라서 반환된 것

>>>print(zipDict)
{'pear': 1500, 'peach': 2000}

# clear함수 사용해서 삭제
>>>zipDict.clear() # zipDict 내용 다 삭제
>>>print(zipDict)
{} # 빈 딕셔너리 출력됨.
```



# set : 집합의 자료형
- 순서X, 중복 허용X → 필터링 하기 좋음 , 인덱싱은 불가능

- 선언 방법 : **{} , set()**
  - **{}** :  키 없이 원소만 나열 되어 있는 경우엔 set으로 봄
  -  **set()** : set함수 안에 자료형이 list형이어야 함.

```python 
# {} 사용해서 set선언
>>>tmpSet = {1,2,3,3,3,3,'가나다라'} # 다른 데이터형도 가능
>>>print(tmpSet,type(tmpSet))  
{1, 2, 3, '가나다라'} <class 'set'> # 중복되어 있는 3 값이 1번만 나옴.

# set()로 set선언 - set함수 안에 자료형이 list형이어야 함.
>>>tmpSet1 = set([1,2,3,4,4,'가나다라'])
>>>print(tmpSet1, type(tmpSet1))
{1, 2, 3, 4, '가나다라'} <class 'set'>

>>>print(tmpSet[0]) 
TypeError: 'set' object is not subscriptable # 순서가 없어서 인덱싱X

>>>tmpT = tuple(tmpSet) # set을 tuple로 변환.
>>>print(tmpT,type(tmpT))
(1, 2, 3, '가나다라') <class 'tuple'>

>>>tmpL = list(tmpT) # tmpL을 list로 변환. 
>>>print(tmpL, type(tmpL))
[1, 2, 3, '가나다라'] <class 'list'>
```



#### 교집합(intersection) & , 합집합(union) | , 차집합(difference) -

```python
>>>s01 = set([1,2,3,4,5,6])
>>>s02 = set([4,5,6,7,8,9])

>>>print('교집합 : ',s01.intersection(s02) ,s01&s02)
교집합 :  {4, 5, 6} {4, 5, 6}

>>>print('합집합 : ', s01.union(s02), s01|s02)
합집합 :  {1, 2, 3, 4, 5, 6, 7, 8, 9} {1, 2, 3, 4, 5, 6, 7, 8, 9}

>>>print('차집합 : ', s01.difference(s02), s01-s02)
차집합 :  {1, 2, 3} {1, 2, 3}


>>>gender = ['남','남','남','여','남','여','남']
>>>sgender = set(gender)
>>>print(sgender) 
{'남', '여'} # 중복되는 값은 1번만 

>>>lgender = list(sgender) # 다시 list로 만들어서 indexing 가능하다.
>>>print(lgender)
['남', '여']

>>>exlist = list(range(1,5)) # exlist생성
>>>print('exlist:', exlist)
exlist: [1, 2, 3, 4, 5]
    
>>>exset = set(exlist) # exlist를 set으로 변환 
>>>print('exset:', exset)
exset: {1, 2, 3, 4, 5}
```

