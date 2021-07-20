# 02. 파이썬 자료형 - 문자열

## 문자열 자료형

### 문자열 자료형을 만드는 방법

```python
"Hello" # 큰따옴표 활용
'Python' # 작은따옴표 활용	
"""Hello Python""" # 큰따옴표*3
'''Life is too short, you need python''' # 작은따옴표 *3
```

🌟주의! -  문자열 내부에 작은 따옴표가 들어가면, 큰따옴표로 감싸줘야함!  (반대로도 가능)  또는, 문자열 내부의 따옴표 앞에 \를 붙여주면 가능!



### 문자열의 연산

```python
# + 연산
>>>a = 'Hi'
>>>b = "Python"
>>>print( a + ' ' + b ) # ' ' - 띄어쓰기 의미
Hi Python

# * 연산
>>>a = 'Hi'
>>>print(a * 10)
HiHiHiHiHiHiHiHiHiHi
```



### 문자열의 인덱싱 ( indexing ) 과  슬라이싱( slicing )이 가능하다.

- **파이썬의 인덱스 번호**는 1이 아닌 **0부터 시작!**  
- **마지막 인덱스 번호**는 **-1** 또는 **len( 변수명 ) -1**
- 슬라이싱 할때,  **변수명 [start : end-1 : step]** == **변수명 [ 이상 : 미만 : 간격 ]**
  - start 생략하면 처음부터, end-1 생략하면 마지막까지, step 간격이 1로 인식된다. 

```python
>>>a = "Life is too short, you need python"

# dir() - 구조를 보는 함수
# len() - 공백을 포함한 문자열 길이
# type() - 자료형을 확인하는 함수
>>>print(a, type(a), len(a))
Life is too short, you need python <class 'str'> 34

# 파이썬에선 -(마이너스)가 맨 마지막 인덱스 번호 의미
>>>print(a[-1]) #마지막 인덱스 번호에 해당하는 문자열 프린트하라는 의미
n

>>>print(a[0:4]) # 인덱스 0번부터 3번까지 가져오라는 의미! 
Life

>>>b = "123456789"
>>>print(b[::2]) # 홀수만 출력
13579

>>>print(b[1::2]) # 짝수만 출력
2468

>>>print(b[::-1]) # 역순으로 출력
987654321

>>>print(b[::-2]) # 역순으로 2칸 간격으로 출력
97531
```



### format 

- %s : 문자열
- %c : 문자 1개
- %d : 정수
- %f : 부동소수
- %o : 8진수
- %x : 16진수

```python
>>>print('{} {}'.format('one','two'))
one two

>>>print('{1} {0}'.format('one','two')) # {}안에 인덱스 번호 부여해서 formating 가능!
two one

>>print('저는 {area}사는 {age}살 입니다.'.format(age = 25, area = "경기도" )) # {}안에 변수명도 부여 가능!, 순서가 달라도 됨!
저는 경기도사는 25살 입니다.

>>print('%s %d' % ('one', 100)) # %로 시작했으니까 연결고리는 %로 해야함
one 100

>>>age = 25
>>>a = f"나는 {age}살입니다"   # 이런식으로도 포맷팅 가능!
>>>print(a)
나는 25살입니다
```



#### 정렬과 공백

```python
# 자리수 지정 & 정렬
# %길이s
>>>print('%10s' % 'hi') # 10자리를 지정해주고, 그 안에 오른쪽 정렬로 문자열 넣어줌.
        hi

>>>print('%-10s' % 'hi') # 10자리 지정해주고, 숫자가 음수라서 왼쪽 정렬로 문자열 넣어줌.
hi        

>>>print('%5s' % 'pythonGood') # 자리수 지정하더라도 문자열의 길이가 길면 그대로 출력된다. but,문자열에 포함된 대괄호 개수 보다 format안에 들어 있는 값의 수가 적으면 에러
pythonGood 

# format을 활용한 정렬
# '{인덱스:<길이}'.format(값) : 왼쪽 정렬 - 인덱스는 생략가능!
# '{인덱스:>길이}'.format(값) : 오른쪽 정렬 

>>>print('{:_>10}'.format('nice')) # 비어있는 것을 _로 표시하겠다.
______nice

>>>print('{:^10}'.format('nice')) #중앙정렬
   nice   
    
>>>print('%d' % 100)
100

#  %자리수.소수점 남기는 자리수f % 숫자
>>>print('%6.3f' % 3.14159)  #총 자리수는 6이고, 소수점 3자리까지만 반올림해서 표현.
 3.142

# 절삭. (.뒤에 원하는 자리만큼 숫자)
>>>print('%.5s'  % 'pythonstudy') # 5자리 확보해서 5자리 이후부터는 절삭
pytho

>>>print('{:10.5}'.format('pythonstudy'))  #10자리를 확보해서 5자리까지만 두고 절삭
'pytho     '

>>>print('{:.5}'.format('pythonstudy')) # 5자리까지 절삭
pytho

# 둘다 같은 결과!
>>>print('%4d' % 42) 
  42
>>>print('{:4d}'.format(42))
  42
```



#### 문자열 함수

- **count** : 문자열 개수 세기
  - **''문자열".count( '개수를 셀 문자/문자열' )**  : 현재 문자열에서 개수를 셀 특정 문자열이 몇번 나오는지 알아내준다.

```python
>>>a = "Hello Python"
>>>print(a.count('o'))
2

b="Hello Hello Hello Hello python"
print(b.count('Hello'))
4
```



- **replace** : 문자열 바꾸기
  - **replace('바꿀문자열', '새문자열')** : 문자열 안에 문자열을 다른 문자열로 변경한다.
  - 문자열 자체는 변경하지 않으며 바뀐 결과를 반환한다 ( 변수에 재할당안한 경우)

```python
>>>phone_number = "010-4603-2283"
>>>print(phone_number.replace('-'," ")) # - 를 공백으로 변경
010 4603 2283 

>>dumStr = "sakliafjkdlsjfijeljflajka"
>>print(dumStr.replace('a',"A")) # a를 대문자 A로 변경
sAkliAfjkdlsjfijeljflAjkA
```



- **lower, upper**
  - "문자열".lower() : 문자열 안에  문자를 모두 소문자로 변경한다.
  - "문자열".upper() : 문자열 안에  문자를 모두 대문자로 변경한다.

```python
>>> 'PYTHON'.lower() # 소문자로 변경
'python'

>>> 'python'.upper() # 대문자로 변경
'PYTHON'

```



- **strip(), rstrip(), lstrip()** 
  - **strip()** : 문자열에서 양쪽에 있는 연속된 모든 공백 제거
    - **strip('삭제할 문자들')** : 삭제할 문자들을 문자열 형태로 넣어주면 문자열 양쪽에 있는 해당 문자 삭제
  - **rstrip()** : 문자열에서 오른쪽에 있는 연속된 모든 공백 제거
    - **rstrip('삭제할 문자들')** : 삭제할 문자들을 문자열 형태로 넣어주면 문자열 오른쪽에 있는 해당 문자 삭제
  - **lstrip()** : 문자열에서 왼쪽에 있는 연속된 모든 공백 제거
    - **lstrip('삭제할 문자들')** : 삭제할 문자들을 문자열 형태로 넣어주면 문자열 왼쪽에 있는 해당 문자 삭제

```python
>>>a = "   hello, python!!!   "
>>>print(a.strip())  # 양쪽 공백제거
hello, python!!!

>>>print(a.rstrip()) # 오른쪽 공백 제거
   hello, python!!!
    
>>>print(a.lstrip()) # 왼쪽 공백 제거
hello, python!!!   

>>>print(a.strip(', !')) # 양쪽에서 , 공백 ! 제거
hello, python # 양쪽에서 연속된 상태의 공백과 해당문자 제거가 가능해서 문자열 가운데의 ,와 공백은 제거가 안됨.

>>>print(a.rstrip(', !')) # 오른쪽에서 , 공백 ! 제거
   hello, python # 오른쪽의 연속된 상태의 공백과 !만 제거됨.
>>>print(a.lstrip(' hello')) # 왼쪽에서 공백 hello 제거
, python!!!    # 왼쪽의 연속된 상태의 공백과 hello 제거됨

# 구두점을 간단히 삭제하기 - string 모듈의 puctuation엔 모든 구두점이 다 들어있어 이걸 활용해 삭제
>>>import string
>>>print(a.strip(string.punctuation + ' '))
hello, python # 양쪽의 연속된 구두점과 공백 제거
```



- **find()** : 문자열 위치 찾기
  - **find( '찾을 문자열' )** : 문자열에서 특정 문자열을 찾아서 인덱스를 반환하고, 문자열이 없으면 -1 반환한다.
    - 왼쪽에서부터 문자열 찾는데 같은 문자열이 여러 개 일 경우 처음 찾은 문자열의 인덱스 반환한다.

```python
>>>url ='http://www.naver.com'
>>>print(url.find('com')) # com의 위치 찾기
17 #인덱스 반환됨.

# 문자열에서 com을 반환 받고 싶다면?
>>>print(url[url.find('com'):])
com # 문자열에서 com의 인덱스 찾아서 그 인덱스부터 마지막 인덱스까지 슬라이싱함.
```



- **split()** : 문자열 분리하기
  - **split()** : 공백을 기준으로 문자열을 분리하여 리스트로 만든다.
  - **split( '기준문자열' )** : 기준문자열로 문자열을 분리하여 리스트로 만든다.

```python
>>> a = "A B C D E F G"
>>> print(a.split()) # 공백을 기준으로 분리
['A', 'B', 'C', 'D', 'E', 'F', 'G'] # 리스트로 반환

>>>url ='http://www.naver.com'
>>>print(url.split('.')) # .을 기준으로 분리
['http://www', 'naver', 'com']
```



- **join()** : 문자열 연결하기
  - **"문자열1".join("문자열2")** :문자열 2를 슬라이싱해서 문자열 1로 연결해준다.
  - **"구분자 문자열".join(리스트)** : 구분자 문자열과 문자열 리스트의 요소를 연결하여 문자열로 만든다. (split의 반대)

```python
>>>x = '::'
>>>y = 'abcd'
>>>>print(x.join(y)) # y의 문자열을 슬라이싱해서 x로 연결
a::b::c::d
>>>print(y.join(x)) # x의 문자열을 슬라이싱해서 y로 연결
:abcd:
        
>>>print(' '.join(['A','B','C','D','E'])) # 각 리스트 요소 사이에 구분자 문자열인 공백을 넣고 문자열로 만듦.
A B C D E

>>>print('-'.join(['A','B','C','D','E'])) # 구분자 문자열이 - 인경우.
A-B-C-D-E
```



## 불 (boolean)

- 참(True)  , 거짓(False)을 나타낸다.
- 논리연산자 (**not, and, or**)
- 비교 연산자 (**&, |, ~**) → 이진법 계산.
-  "",[],(),{},0, None -> **비어있는 것들을 False로 간주!**
- **0이 아닌 숫자를 모두 True로 인지**

```python
# bool함수 활용해서 True, False 판단.
>>>print('bool(0):', bool(0)) # 0이니까 False
bool(0): False
>>>print('bool(1):', bool(1)) # 0이 아니라서 True
bool(1): True

 
a = 5 # 이진수로 표현시, 0101
b = 0 # 이진수로 표현시, 0000    
>>>print('bitwise a&b', bool(a&b)) # a&b는 0이 리턴되어 bool함수 사용시, False
bitwise a&b False
>>>print('bitwise a&b', bool(a|b)) # a|b는 0이 아닌 값이므로, True 리턴
bitwise a&b True

>>>tmpList = []
>>>print('bool(tmpList) : ', bool(tmpList)) # 빈 리스트라서 False리턴
bool(tmpList) :  False
# TIP! 해당 리스트, 튜플, 딕셔너리 등이 비어있는지 아닌지를 판별하기 위해 bool함수 사용 가능


trueFlag = True
falseFlag = False
>>>print('int(trueFlag) : ', int(trueFlag)) 
int(trueFlag) :  1 # True라서 1이 리턴
>>>print('int(falseFlag) : ', int(falseFlag)) 
int(falseFlag) :  0 # False라서 0이 리턴
>>>print( 'and연산 :', trueFlag and falseFlag , trueFlag & falseFlag) # True & False => False
and연산 : False False
>>>print( 'or연산', trueFlag or falseFlag , trueFlag | falseFlag) # True | False => True
or연산 True True
>>>print( 'not연산',  not trueFlag, ~trueFlag ) # not연산 False -2 리턴되서 ~trueFlag는 사용하지 않는것 추천
not연산 False -2

```
