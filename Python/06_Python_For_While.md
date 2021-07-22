

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

# 대문자인 문자들만 출력
# isupper() : 대문자인 경우만 true
>>>for e in tmpList :
    	if e.isupper():
        	print(e)
I
AM
PYTHON

# 확장자를 제외하고 파일 이름만 출력?
# split()함수 이용
>>>exList = ['greeting.py','ex01.py','intro.hwp','bigdata.doc']

>>>for i in range(len(exList)):
    	print(exList[i].split('.')[0])
greeting
ex01
intro
bigdata


# 구구단 (2단부터 9단까지)
# 출력형식 2 * 1 = 2, 2 * 2 = 4

>>>for i in range(2,10):
    	for cnt in range(1,10):
   			print('{} * {} = {}'.format(i, cnt, i*cnt),end = '\t')
    		print()
            
2 * 1 = 2	2 * 2 = 4	2 * 3 = 6	2 * 4 = 8	2 * 5 = 10	2 * 6 = 12	2 * 7 = 14	2 * 8 = 16	2 * 9 = 18	
3 * 1 = 3	3 * 2 = 6	3 * 3 = 9	3 * 4 = 12	3 * 5 = 15	3 * 6 = 18	3 * 7 = 21	3 * 8 = 24	3 * 9 = 27	
4 * 1 = 4	4 * 2 = 8	4 * 3 = 12	4 * 4 = 16	4 * 5 = 20	4 * 6 = 24	4 * 7 = 28	4 * 8 = 32	4 * 9 = 36	
5 * 1 = 5	5 * 2 = 10	5 * 3 = 15	5 * 4 = 20	5 * 5 = 25	5 * 6 = 30	5 * 7 = 35	5 * 8 = 40	5 * 9 = 45	
6 * 1 = 6	6 * 2 = 12	6 * 3 = 18	6 * 4 = 24	6 * 5 = 30	6 * 6 = 36	6 * 7 = 42	6 * 8 = 48	6 * 9 = 54	
7 * 1 = 7	7 * 2 = 14	7 * 3 = 21	7 * 4 = 28	7 * 5 = 35	7 * 6 = 42	7 * 7 = 49	7 * 8 = 56	7 * 9 = 63	
8 * 1 = 8	8 * 2 = 16	8 * 3 = 24	8 * 4 = 32	8 * 5 = 40	8 * 6 = 48	8 * 7 = 56	8 * 8 = 64	8 * 9 = 72	
9 * 1 = 9	9 * 2 = 18	9 * 3 = 27	9 * 4 = 36	9 * 5 = 45	9 * 6 = 54	9 * 7 = 63	9 * 8 = 72	9 * 9 = 81	


# 인덱스 번호와 요소의 값을 확인할 수 있는 enumerate()
>>>tmpList = ['greeting.py','ex01.py','intro.hwp','bigdata.doc']
>>>for idx, value in enumerate(tmpList):
    	print('{} 번째 인덱스이고, 값은 {} 입니다.'.format(idx, value))
0 번째 인덱스이고, 값은 greeting.py 입니다.
1 번째 인덱스이고, 값은 ex01.py 입니다.
2 번째 인덱스이고, 값은 intro.hwp 입니다.
3 번째 인덱스이고, 값은 bigdata.doc 입니다.


# for ~ else 
>>>numbers = [14, 3, 4, 7, 45, 17, 8, 65, 34]
>>>for num in numbers:
    	if num == 17:
        	print('found : ' ,17)
        	break
	else :
    	print('Not found', 1)

found :  17    
    
# 이중for루프
>>>apartments=[['101호','102호'],['201호','202호'],['301호','302호']]
>>>for row in apartments: # 층수 불러오기
    	for col in row: # 호수 불러오기
        	print(col) 
    	print('-------')
101호
102호
-------
201호
202호
-------
301호
302호
-------
    
```



## while 반복문

- 조건식으로만 동작하며 반복할 코드 안에 조건식에 영향을 주는 변화식이 들어간다.

- 실행과정

  - 초기식부터 시작해서 조건식이 참(True)일 경우 반복할 코드 및 변화식을 수행하고 다시 조건식 판별해서 참이면 코드를 계속 반복, 거짓이면 반복문을 끝내고 다음 코드 실행한다.

- **반복 횟수가 정해지지 않았을 때 주로 사용!**

- 형식

  ​	**초기식**

  ​	**while(조건식):**

  ​		**반복할 코드**

  ​		**변화식**

  

  ```python
  # 1부터 10까지 합 구해보기
  >>>i = 1 # 초기식1
  >>>sum = 0 # 초기식2
  >>>while i <= 10: # 조건식
      	sum += i # 반복할 코드
      	i += 1 # 변화식
  >>>print(sum)
  55
  
  # 조건식에 빈리스트를 준다면? (hint : 빈리스트는 False로 인지한다.)
  dogNames =[]  # dogNames라는 빈리스트 생성
  while dogNames : # dogNames가 빈리스트라 False이므로 while문 안에 print문은 실행X, while문 밖의 print문만 실행됨
      print('while')
  print('outer while') 
  'outer while'
  
  # while문을 활용해 반려견 이름을 입력받아 dogNames리스트에 추가하기
  >>>dogNames =[]
  >>>isFlag = True
  
  >>>while isFlag:
      	name = input('반려견의 이름을 입력하세요(종료시 엔터키 입력):')
      	if name == "": # 이름으로 null값 들어올 경우
          	#isFlag = False도 가능 # 마지막 null값도 리스트에 포함됨
          	break # 마지막 null값 포함 안됨.
      	dogNames.append(name)
  print('dogName list: ' , dogNames )
  
  반려견의 이름을 입력하세요(종료시 엔터키 입력):>? 초코
  반려견의 이름을 입력하세요(종료시 엔터키 입력):>? 포포
  반려견의 이름을 입력하세요(종료시 엔터키 입력):>? 모카
  반려견의 이름을 입력하세요(종료시 엔터키 입력):>? 
  dogName list:  ['초코', '포포', '모카']
  ```



#### while 이용한 guessGame 만들어보기

```python
>>>from random import randint
>>>answer = randint(1,100) # 1부터 100중에 랜덤숫자 1개 생성
>>>tries = 1 # 시도 횟수를 나타내줄 변수 생성
>>>while tries <= 10: # 10번안에 맞추기
    	guess = int(input('1~100사이의 숫자를 입력하세요 : '))
    	if guess == answer:
        	break
    	elif guess > answer:
        	print('down')
    	else:
        	print('up')
    	tries += 1
print('정답 : {} , 시도 횟수 : {} '.format(answer, tries))


1~100사이의 숫자를 입력하세요 : >? 50
up
1~100사이의 숫자를 입력하세요 : >? 80
down
1~100사이의 숫자를 입력하세요 : >? 70
up
1~100사이의 숫자를 입력하세요 : >? 75
up
1~100사이의 숫자를 입력하세요 : >? 79
down
1~100사이의 숫자를 입력하세요 : >? 78
down
1~100사이의 숫자를 입력하세요 : >? 77
정답 :  77 , 시도 횟수 : 7
```



### break, continue로 반복문 제어하기

- break : 제어흐름 중단 (반복문에서 빠져 나오기 위해 사용)  

- continue : 제어흐름 유지, 코드 실행만 건너뜀

```python
# for에서 break로 반복문 끝내기
for i in range(100):    # 0부터 99까지 반복
    print(i)
    if i == 10:    # i가 10일 때
        break
0
1
2
3
4
5
6
7
8
9
10

# while에서 break로 반복문 끝내기
>>>i = 0
>>>while True:    # 무한 루프
		print(i)
    	i += 1          # i를 1씩 증가시킴
    	if i == 10:    # i가 10일 때
        	break 		# 반복문을 끝냄.   
        
0
1
2
3
4
5
6
7
8
9

# for에서 continue로 코드 실행 건너뛰기
for i in range(10):
    if i == 5: # 5일때 코드 실행 건너뛰기
        continue 
    print(i) # 5만빼고 출력됨.
0
1
2
3
4
6
7
8
9

# while 반복문에서 continue로 코드 실행 건너뛰기
i = 0
while i < 10: 	# i가 0부터 9인 경우까지
    i += 1
    if i == 5: # 5일때 코드 실행 건너뜀
        continue
    print(i)
1
2
3
4
6
7
8
9
10

```
