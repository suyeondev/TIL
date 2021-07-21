

# 06. 파이썬 반복문 - For, While



## For 반복문

- 반복 횟수가 정해져 있을 때 주로 사용한다.

### for 와  range 사용하기

- 형식  

  - **for 변수 in range(횟수):**

  ​					**반복할 코드**

  - **for 변수 in str | dict | list:**

    ​			**반복할 코드**

```python
# 문자열을 1글자씩 띄어쓰기해서 가져오기
>>>endingMsg = "see you next week"
>>>for char in endingMsg : # char 변수가 endingMsg에서 1글자씩 가져온다.
    	print(char, end =" ") # end =' ' 로 띄어쓰기해서 출력 가능하다.
s e e   y o u   n e x t   w e e k 

# 리스트에 있는 요소의 count
>>>cnt_list = [1,2,2,3,3,3,4,5,5,5,5,5,'one','one','two','3','3']
>>>freq = {} # 딕셔너리 생성
>>>for i in cnt_list : # 변수 i를 루프 인덱스라고도 부르며 index의 첫 머리글자를 따서 i를 주로 사용한다.
    	if i in freq : 
        	freq[i] += 1 # freq 딕셔너리에 이미 있다면 빈도수를 + 1 연산
    	else : 
        	freq[i] = 1 # freq 딕셔너리에 없다면 빈도수에 1 할당
print('freq : ' ,freq)
freq :  {1: 1, 2: 2, 3: 3, 4: 1, 5: 5, 'one': 2, 'two': 1, '3': 2}
    
# range(10)은 0부터 9까지!
>>>for v1 in range(10):
    	print('v1 is ', v1)
v1 is  0
v1 is  1
v1 is  2
v1 is  3
v1 is  4
v1 is  5
v1 is  6
v1 is  7
v1 is  8
v1 is  9    
```



### for문과 if

```python

# 올림픽은 4년에 1번 개최
# 2000 ~ 2050년 사이의 올림픽이 개최되는 년도 출력
# 한 줄에 5개년도씩 출력
>>>cnt = 0
>>>for year in range(2000,2051,4): # 2000년부터 2051년까지 4년단위로!
    	cnt += 1 # index 번호를 세기 위해
    	if cnt % 5 == 0: 
        	print(year, end='\n') # index 번호가 5의 배수인 경우엔 개행
    	else:
        	print(year, end= '\t')
2000	2004	2008	2012	2016
2020	2024	2028	2032	2036
2040	2044	2048	
# 아래 리스트에서 세글자 이상인 문자만 출력한다면?
>>>tmpList = ['I', 'AM', 'study', 'PYTHON','language', '!']
>>>for i in tmpList:
    	if len(i) >= 3:
        	print(i)
        
study
PYTHON
language

#대문자인 문자들만 출력
# isupper() : 대문자인 경우만 true
for e in tmpList :
    if e.isupper():
        print(e)
I
AM
PYTHON

#확장자를 제외하고 파일 이름만 출력?
#split()
exList = ['greeting.py','ex01.py','intro.hwp','bigdata.doc']

for i in range(len(exList)):
    print(exList[i].split('.')[0])
greeting
ex01
intro
bigdata


# 구구단
# 출력형식 2 * 1 = 2, 2 * 2 = 4

for i in range(2,10):
    if i == 5 :
        continue # 조건에 만족하는 부분만 스킵하고 루프를 도는 거라 5단만 출력X
    for cnt in range(1,10):
        print('{} * {} = {}'.format(i, cnt, i*cnt),end = '\t')
    print()

# 인덱스 번호와 요소의 값을 확인할 수 있는 enumerate()
tmpList = ['greeting.py','ex01.py','intro.hwp','bigdata.doc']
for idx, value in enumerate(tmpList):
    print('{} 번째 인덱스이고, 값은 {} 입니다.'.format(idx, value))

# 분류정확도
answer = [1, 0, 2, 1, 0]
pridct = [1, 0, 2, 0, 0]
acc = 0
for i in range(len(answer)):
    fit = answer[i] == pridct[i]
    acc += int(fit) * 20

print('분류정확도는 {}% 입니다.'.format(acc))

# for ~ else
numbers = [14, 3, 4, 7, 45, 17, 8, 65, 34]

for num in numbers:
    if num == 17:
        print('found : ' ,17)
        break
else :
    print('Not found', 1)
    
# 이중for루프
apartments=[['101호','102호'],['201호','202호'],['301호','302호']]

for row in apartments:
    for col in row:
        print(col)
    print('-------')
    
# while~
dogNames =[]
isFlag = True

while dogNames :
    print('while')
print('outer while')   # dogNames가 빈리스트라 False이므로 while문 안에 print문은 실행X, while문 밖의 print문 실행됨


dogNames =[]
isFlag = True

while isFlag:
    name = input('애완견의 이름을 입력하세요(종료시 엔터키 입력):')
    if name == "":
        #isFlag = False도 가능 # 마지막 null값도 리스트에 포함됨
        break # 마지막 null값 포함 안됨.
    dogNames.append(name)
print('outer while: ' , dogNames )

# while 이용한 guessGame

from random import randint
answer = randint(1,100)
tries = 1
while tries <= 10:
    guess = int(input('1~100사이의 숫자를 입력하세요 : '))
    if guess == answer:
        break
    elif guess > answer:
        print('down')
    else:
        print('up')
    tries += 1
print('정답 {} , 시도 횟수{} '.format(answer, tries))


tmpList = [('name', 'jslim'), ('age', 20), ('address', 'seoul')]
for (key, value) in tmpList :
    print('{}, {}'.format(key,value))


tmpList = [1,2,3,4,5,6,7,8,9]
myList = []
for e in tmpList :
    myList.append(e**2)
print(myList)

tmpList = [1,2,3,4,5,6,7,8,9]
myList1 = [e**2 for e in tmpList ]
print(myList1)


```