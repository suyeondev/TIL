# 04. 파이썬 자료형 - 딕셔너리, 집합

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
  - **set()** : set함수 안에 자료형이 list형이어야 함.

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

