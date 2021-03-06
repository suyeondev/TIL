# 프로그래밍기초



## 1. 프로그래밍이란?

컴퓨터에 명령을 내리는 방법



**기계어**

- 기계가 이해하기 쉬운 언어 

- 2진수로 표현



**어셈블리언어**

- 기계어와 1대1로 대응
- 기계어보다 인간이 읽기 쉬움



**고급언어 ㆍ구조화언어	**

- 인간의 가독성을 배려한 언어로 이해하기 쉬움
- C언어



**함수형 언어**

- 처리를 함수로 정의하고 함수를 조합해 프로그램을 구성
- Haskell



**객체지향**

- 기능의 재이용성을 촉진하고자 데이터와 처리를 하나로 묶음
- Java



**컴파일 언어 vs 인터프리터 언어**

- 컴파일 언어 : 명령을 기계에 전달하기 전에 반드시 한번 기계가 이해할 수 있는 형식으로 정리해서 넘기는 언어

- 인터프리터 언어 : 순차적으로 기계에 내린 명령의 결과를 확인할 수 있게 한 언어 

|           | 컴파일러                                                     | 인터프리터                                                   |
| --------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 번역방법  | 프로그램 전체 번역                                           | 실행되는 줄 단위 번역                                        |
| 장점      | 한번 컴파일한 후에는 매번 빠른 시간내에 전체 실행 가능       | 번역 과정이 비교적 간단하고 대화형 언어에 편리함             |
| 단점      | 프로그램의 일부를 수정하는 경우에도 전체 프로그램을 다시 컴파일해야 함 | 실행할 때마다 매번 기계어로 바꾸는 과정을 다시 수행해야 하므로 항상 인터프리터가 필요함 |
| 출력물    | 오브젝트 파일                                                | 즉시 실행                                                    |
| 언어 종류 | FORTRAN, COBOL, C, C++                                       | PYTHON                                                       |



**소스코드 실행과정 비교**

-  컴파일 언어

소스코드 ----> 컴파일러 ------------> 기계어 --------> CPU/메모리

​										   컴파일				  실행

-  인터프리터 언어

소스코드 ---> 인터프리터 ---------------------------> CPU/메모리

​											  바로 번역 및 실행			



## 2. 데이터형과 데이터 구조

데이터 형 : 변수의 형을 말한다.

ex) 정수, 실수, 문자열, 논리형 등

데이터 구조 : 변수를 하나로 묶은 것

ex) 리스트, 사전, 데이터프레임 등

[참고문헌] - 그림으로 배우는 데이터과학 Data Science - 히사노 료헤이, 키와키 타이치 지음 김성훈 옮김

 

## 3. 함수ㆍ 값 전달 ㆍ 참조 전달

#### 함수 : 프로그램 안의 처리를 하나로 묶은 것.

- 입력, 처리, 반환값 3가지로 구성



#### 값 전달 vs 참조 전달

**값 전달** : 오브젝트를 복사해서 전달한다.

```python
S = ['dog', 'cat','camel']
def PrintLast(x):
	out=""
    for i in range(len(x)):
        print(x[i])
        if i == len(x)-1:
            out=x[i]
        x[1]="fish"
        return out
# 파이썬은 참조전달이 기본으로 되어있어 값전달을 이용할때는 copy라는 외부 라이브러리 이용
PrintLast(copy.deppcopy(S)) # S는 ['dog', 'cat','camel'] 그대로이다
```

장점 : 함수안에서 그 오브젝트를 변경하더라도 함수 밖에 있는 오브젝트는 원래 그대로라는 편의성이 있다.

단점 : 반면에 함수를 호출할 때마다 같은 오브젝트를 복사해서 전달하므로 큰 오브젝트를 입력으로 전달할때는 낭비되는 영역이 커진다.



**참조전달** : 오브젝트의 복사본을 만들지 않는다.

```python
S = ['dog', 'cat','camel']
def PrintLast(x):
	out=""
    for i in range(len(x)):
        print(x[i])
        if i == len(x)-1:
            out=x[i]
        x[1]="fish"
        return out

PrintLast(S) # S는 ['dog', 'fish','camel'] 로 변경되어 버린다.
```

장점 : 큰 오브젝트라도 낭비되는 메모리가 크지 않다.

단점 : 오브젝트를 무심코 변경해버리면 함수밖에서도 그 오브젝트가 변경되는 부작용이 있어 실수하기가 쉽다.



## 4. 라이브러리 이용에 대해서

행렬연산 					---->  Numpy, SciPy

그리기 						---->  matplotlib, seaborn, NetworkX

데이터프레임 처리	 ---->  Pandas

머신러닝 					---->  scikit-learn

토픽모델 					---->  gensim

딥러닝 						---->  Pytorch, TensorFlow



## 5. 버전 관리 시스템

중간규모의 프로그램이라도 보통 여러개의 파일로 구성되므로 파일을 직접 관리하기가 어려워진다.

특히, 나중에 버그가 발견되기라도 해서 이전 코드로 돌아가고 싶어도 에디터의 Undo 기능만으로는 한계가 있다.

이런 필요에 의해 생겨난 것이 **버전관리 시스템**이다.



고전적으로는 CVS나 SVN이 유명하지만, 최근 **Git**이 널리 쓰이고 있다.

버전관리 시스템의 도입은 개인 프로그램 개발에도 유용하지만, **많은 인원이 개발하는 환경에선 이제 필수!** 



Git을 이용할 경우, 인터넷 상에서 간단히 코드를 관리하고 공유할 수 있다.

이를 위한 온라인 서비스가 **Github**나 **Bibucket**이다. 



또한, 프로그래밍의 기술적인 문제 해결에는 **Stack Overflow**로 대표되는 인터넷상의 질문 게시판이 매우 유용하다! 



[참고문헌] - 그림으로 배우는 데이터과학 Data Science - 히사노 료헤이, 키와키 타이치 지음 김성훈 옮김

 
