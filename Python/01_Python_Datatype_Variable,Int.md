# 01. 파이썬 자료형 - 변수, 숫자형

## 자료형의 종류

- 파이썬의 기본 자료형 : 숫자, 문자열, 불, 리스트, 튜플, 딕셔너리, 집합, 변수
  - 자료에 대한 타입 : 숫자, 문자열, 불
  - 어떤 값을 담는 자료 구조: 변수, 리스트, 튜플 , 딕셔너리, 집합



## 변수(Variable)란?

- 어떤 값을 가리키기 위한 **'식별자'**로 어떠한 값에 이름을 붙여준 것.



### 변수명 작성 방법
- Camel Case  →  function, method 만들때 (ex. numberOfCollege)
- Pascal Case → class 만들때 (ex. NumberOfCollege)
- Snake Case → variable, method, function 만들때(ex. number_of_college)
-  Camel case를 쓰던 Snake case를 쓰던지는 취향의 차이다! 



### 변수명 작성시 주의사항

- 변수는 숫자로 시작할 수 없다.

- 알파벳, 밑줄문자( _ ) , 숫자 등으로 구성

- 예약어는 변수명으로 사용 불가.

- 허용되는 특수문자 : _ , $

- 대소문자를 구분한다!

  

### 변수에 담을 수 있는 자료형

- Numeric 
- Sequence
- Text Sequence
- Set
- Mapping(dict , tuple)
- Boolean
- Class(Object Oriented Programming)



### 변수 사용

- 파이썬 변수는 별도 타입을 지정하지 않는다. 
  - 최초 대입하는 값에 의해 결정된다 ! 
  - 실행 중에 변수 타입 바꿀 수 있다.  → type() 함수로 변수 타입 확인해 볼 수 있다.



## 숫자형

- 정수형(int)  ex) 1, 2, -2 
- 실수형(float) ex) 1.24,  -21.34 
- 컴퓨터식 지수 표현 방식 ex) 4.24e10, 4.24e-10 
- 8 진수 ex) 0o37
- 16 진수 ex) 0x7A



#### 숫자형의 사칙연산이 가능하다

| 기호 | 기능   |
| ---- | ------ |
| +    | 더하기 |
| -    | 빼기   |
| *    | 곱하기 |
| /    | 나누기 |
| //   | 몫     |
| %    | 나머지 |
| **   | 제곱   |

```python
# % 연산자
>>>7 % 3
1

# ** 연산자
>>> a = 2
>>> b = 3
>>> a ** b  # a의 b제곱
8
```
