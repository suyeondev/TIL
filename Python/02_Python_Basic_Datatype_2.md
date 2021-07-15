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





# 같은 값을 가진 리스트지만, 각 다른 변수에 할당되어 주소값이 다르므로, 다른 리스트이다.
list01 = [1,2,3]
list02 = [1,2,3]
print('object address : ' , id(list01), id(list02))

# is 연산자 : 객체의 주소값을 비교
print('객체의 주소값을 비교', list01 is list02) # 주소값이 다르기 때문에 Fasle 리턴
# 변수의 값을 또 다른 변수에 할당할 수 있다.
list03 = list01 # list01의 주소값을 받는 것. 하나의 변수를 같이 참조하는 것.
print('객체의 주소값을 비교', list01 is list03)  # True 리턴

list03.append('jslim')
print(list01) # list03가 같은 주소를 참조하게 되면서 같은 주소번지를 참조해서 list01을 프린트 해도 jslim이 추가된 상태.

# copy함수를 이용해서 변수를 할당하면, 다른 주소 값을 가져서 원본데이터에 영향이 가지 않는다.
from copy import copy

list04 = copy(list01)
print('object address : ', id(list01), id(list04) ,list01 is list04)


# 중첩 리스트 (inner list)
# [ [], [] ]
# 중첩리스트도 인덱싱 슬라이싱 가능
a = ['a', 'b', 'c']
b = [10 , 3.14 , True , 'string' , a]
print('inner list - ', b[-1][1:]) # list에서 단일 값이 아닌 경우를 슬라이싱할 경우 list로 반환.

# range() : 숫자를 sequence하게 return해줌
tmpRange = range(1,11,2)
print('range - ',tmpRange , 10 in tmpRange) # index가 0부터 시작이라 9까지만 있어서 10은 없어서 False반환

# tap으로 들여쓰기해줘야 함.
# 파이썬은 중괄호 없어서, : 으로 블록 만들어주는 것.
for idx in tmpRange :
    print(idx, end='\t')
#import는 모듈을 가져오는 것. 각 모듈안에 함수들이 있음
import random

tmpList = []
for idx in range(5) :
    tmpList.append(random.randint(1,5))

print('tmpList - ', tmpList)

if 4 in tmpList :
    print('ok')
else :
    print('fail')


'''
list comprehension
list안 for 구문 포함
변수 = [ 실행문 for 변수 in 열거형객체]
for루프에서 실행문을 돈 결과를 변수에 할당가능
변수 = [ 실행문 for 변수 in 열거형객체 if 조건식]
'''

x = [2,4,1,5,3]
# x ** 2 -- error

result = [value ** 2 for value in x if value % 3 ==0]
print('comprehension result -', result)


for i in x :
     x = i * i
print(x)

# for + list
result = []
for value in x :
    calc = value ** 2
    if calc % 3 == 0:
        result.append(calc)
print('for + list result - ', result)

# range() 함수를 이용해서 1~100 사이의 3의 배수만 출력해본다면?
# list Comprehension

result = [value for value in range(1,101) if value % 3 == 0 ]
print(result)

result= []
for num in range(1,101) :
    if num % 3 == 0 :
        result.append(num)

print('3의 배수 result - ' , result )
# range를 사용하다가 type에 문제가 있을 수 있어서 list를 씌워줘서 형변환 해주는 게 좋다.
list(range(1,101))

# 튜플 (tuple)
# 순서O, 중복O  => 인덱싱과 슬라이싱이 가능하다.
# 수정X, 삭제X - 불변 (immutable)
# 읽기 전용
# 선언 방법 - (), tuple()

myTuple = (3,) # 요소가 하나일때 ,를 안주면 int형으로 받아들여서 꼭 , 줘야함.
print(myTuple, type(myTuple))

# 소괄호 안줘도 tuple로 만들기 가능
myTuple = 1,2,3,4,5
print(myTuple, type(myTuple))
print( myTuple[0:2], myTuple[0])

# 수정, 삭제 불가
# myTuple[0] = 10
#print(myTuple) # TypeError: 'tuple' object does not support item assignment 라는 오류가 뜸.
myTuple = 1,2,3,4,5
myList= list(myTuple) # 이런식으로 리스트로 만들어줘서 새로운 변수에 담으면 수정, 삭제 가능
myList[0] = 10
print('append - ' , myList)


print('index -' , myTuple.index(4))
print('count - ', myTuple.count(4))

# 1 ~ 99까지의 정수 중 짝수만 튜플에 저장한다면?

data = tuple(range(2,100,2) )
print(data, type(data))


# Packing, Unpacking

a,b,c = (1,2,3)
print(a,b,c, type(a))

packing = ('최동렬' , '조수연' ,'강려명' ,'섭섭이')
# unpaking 할때는 좌변과 우변의 개수가 맞아야 함! - 각각의 변수에 풀어놓는 걸 unpacking이라고 함.
k,j,g,s =packing
print(k,j,g,s)

# 좌변과 우변의 개수가 안맞는데도 가능한 경우가 있음 , * 사용하면 개수가 같지 않더라도 unpacking이 가능하다.

a,b,*c = (0,1,2,3,4,5) # *를 붙여준 함수에 나머지 할당
print(a,b,c, type(a), type(b), type(c)) # 0 1 [2, 3, 4, 5] <class 'int'> <class 'int'> <class 'list'>

a, *b, c = (0,1,2,3,4,5) # 알아서 내부적으로 개수 맞춰줌. *붙여준 변수에 나머지 개수를 할당.
print(a, b, c, type(a), type(b), type(c)) # 0 [1, 2, 3, 4] 5 <class 'int'> <class 'list'> <class 'int'>

# dict(key : value)
# 순서X , 키 중복 허용 X
# 수정O , 삭제O
# 만드는 방법 : {} , dict{}
# 순서가 없어서 인덱싱이 안됨 -> key값으로 데이터에 접근해야함.

tmpDict = {}
print(tmpDict, type(tmpDict))

tmpDict = {
    'name' : 'jslim',
    'address' : 'seoul'
}
# in 연산자
# 키 유무 검사할 수 있다.
print('name' in tmpDict) # True 리턴
print('birth' in tmpDict) # False 리턴

iceDict = {
    'melona'    : [300, 20],
    'bibibig'   : [400,20],
    'bravo'     : [100, 50]
}
print(iceDict,type(iceDict))
# 키로 접근 가능
iceDict['melona'] #[300, 20]로 반환 이값은 리스트 이므로 인덱싱 가능

print('메로나의 가격은 %d 이고 수량은 %d 개입니다.' % (iceDict['melona'][0],iceDict['melona'][1]))
print('메로나의 가격은 {} 이고 수량은 {} 개입니다.'.format(iceDict['melona'][0],iceDict['melona'][1]))

# 메로나 가격을 인상한다
iceDict['melona'][0] = iceDict['melona'][0] * 1.1
print(iceDict)
#dict()로 dictionary 만드는 방법
tmpDict = dict([
    ('city','seoul'), ('age','27')
])

tmpDict = dict(
    city = 'seoul',
    age = 27
)
print(tmpDict, type(tmpDict))
print('key를 이용한 값 출력 - ', tmpDict['city'])
# print('key를 이용한 값 출력 - ', tmpDict.get[0]) --error 순서가 없으니까 이런식의 인덱싱 불가능
print('key를 이용한 값 출력 - ', tmpDict.get('address')) # get함수 이용하여 가져올수도 있는데 해당 key 값이 없을때 None 출력

# 요소를 추가한다면?
tmpDict.update({'name' : 'jslim'})
print('update - ', tmpDict, type(tmpDict))

# zip
# 아래 두개의 튜플을 하나의 딕셔너리로 만들고 싶다면?
keys = ('apple','pear','peach')
vals = (1000,1500,2000)
# zip모를때 forloop활용해서
zipDict ={}
for i in range(len(keys)):
    zipDict.update( {keys[i] : vals[i]} )

print('zipDict - ' , zipDict, type(zipDict))

#zip 알때 단, zip 사용할때는 개수가 같아야함! - 리스트의 경우에도 사용 가능
zipDict = dict(zip(keys, vals))
print('zipDict - ' , zipDict, type(zipDict))


tmpDict = dict([
    ('city','seoul'), ('age','27')
])
print(dir(tmpDict))

# dict_keys, dict_values
# dict_items - key,value 한꺼번에 가져오기
print(tmpDict)

for key in tmpDict.keys():
    print(key)
for value in tmpDict.values():
    print(value)

for key, value in tmpDict.items():
    print(key, value)  # 내부적으로 언패킹한것.

for key, value in tmpDict.items():
    print('{} : {}'.format(key, value))
    
# 없애기 - clear() 함수 활용해서 다 없애기
tmpDict.clear()
print(tmpDict) 
# pop - 요소를 꺼내고 없애는 것

# set : 집합의 자료형
# 순서X, 중복 허용X -> 필터링 하기 좋음
# 선언 방법1 : {} - 키 없이 원소만 나열 되어 있는 경우엔 set으로 봄
# 선언 방법 2 : set() - set함수 안에 자료형이 list형이어야 함.

tmpSet = {1,2,3,3,3,3,'jslim'} # 다른 데이터형도 가능
print(tmpSet,type(tmpSet))  #{1, 2, 3} <class 'set'> 중복되어 있는 3 값이 1번만 나옴.

#set함수 안에 자료형이 list형이어야 함.

tmpSet = set([1,2,3,4,4,'jslim'])
print(tmpSet, type(tmpSet))
# print(tmpSet[0]) -- error  순서가 없어서 인덱싱X

tmpT = tuple(tmpSet)
print(tmpT,type(tmpT))
print(tmpT,type(tmpT))
tmpL = list(tmpT)
print(tmpL, type(tmpL))

s01 = set([1,2,3,4,5,6])
s02 = set([4,5,6,7,8,9])

# 교집합(intersection) & , 합집합(union) | , 차집합(difference) -
print('교집합(intersection) - ',s01.intersection(s02) ,s01&s02)
print('합집합(union) - ', s01.union(s02), s01|s02)
print('차집합(difference) - ', s01.difference(s02), s01-s02)

gender = ['남','남','남','여','남','여','남']
sgender = set(gender)
print(sgender) # {'남', '여'} 리턴

lgender = list(sgender) # 다시 list로 만들어서 indexing 가능하다.
print(lgender)

lst = list(range(1,101))
print('lst - ',lst)
slst = set(lst)
print('slst - ' , slst )

for value in slst:
    print(value, end = ' ')

# 단어의 빈도수를 구해보자
# {love : 2, jslim :2, cat : 2, word : 1, lucky:3}
word_dict = {}
word_list = ['love','jslim','cat','cat','jslim', 'word','love','lucky','lucky','lucky']
word_keys = set(word_list)
word_values = [word_list.count(word) for word in word_keys]
word_dict = dict(zip(word_keys, word_values))
print(word_dict)

word_keys = set(word_list)

word_Dict = dict(zip(word_keys, word_vals))

wc = {}
for word in word_list:
    wc[word] = wc.get(word, 0 ) +1
print('wc' ,wc)

# case 01
dict(zip(set(word_list),[word_list.count(i) for i in set(word_list)]))

# case 02
word_set = list(set(word_list))
tmpDict ={}
for i in word_set :
    tmpDict.update({i : word_list.count(i)})

print(tmpDict)

# case 03
word_list = ['love','jslim','cat','cat','jslim','word','love','lucky','lucky','lucky']
word_set = set(word_list)

word_cnt = {}
for word in word_set:
    cnt = 0
    for i in range(len(word_list)):
        if word_list[i] == word:
            cnt +=1
    word_cnt[word] = cnt
print(word_cnt)