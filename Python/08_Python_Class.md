# 파이썬 클래스(Class)

```python
# 학습목표 : 객체지향 (oop)
# class vs instance
# 함수기반의 객체지향 - 클래스의 개념 또한 포함
# 함수 < 클래스(변수, 함수) < 모듈 < (xxx.py) < 패키지(package)

'''
클래스 ?
-함수의 모음
-역할 : 여러개의 함수와 공유 자료(변수)를 묶어서 관리하는 템플릿
-구성 : 멤버 = 변수 + 함수(메서드) + 생성자(initialize : 초기화 함수)

실세계  -> vertual environment
object --> instance

클래스 - 인스턴스를 만들어 내는 템플릿.
각각의 인스턴스는 같은 클래스에서 만들어졌어도 프로그램내의 주소번지가 다르기 때문에 다른 걸로 본다.
클래스에 정의된 변수와 함수는 클래스의 소유가 아닌 인스턴스의 소유이다.
-> 클래스에 정의된 변수와 함수를 사용하기 위해선 선행조건으로 인스턴스가 만들어져야함.

인스턴스 생성시 클래스를 호출해주면 됨.
self : 인스턴스 소유라는 것을 알려주는 것.
'''

from bigdata.oop.oop_day05 import *

# 인스턴스 생성
# instance = Person()
# instance.변수
# instance.함수()

# perName = '임정섭'
# perAge = 27
# perGender = 'M'
#
# def doing():
#     print('{} 는 나이가 {}이며 성별은 {}이고 일하고 있다.'.format(perName, perAge, perGender))
#
# doing()
#
# perObj = Person('임정섭', 49, 'M') # initializer를 호출.
# perObj.doing()
# print(perObj.name)
# print(perObj.age)
# print(perObj.gender)
#
# perObj02 = Person('섭섭해', 29, 'F')
# perObj02.doing()
# print(perObj02.name)
# print(perObj02.age)
# print(perObj02.gender)
#
# perList = []
# perList.append(Person('임정섭', 49, 'M'))
# perList.append(Person('섭섭해', 29, 'F'))
#
# for obj in perList:
#     #print(dir(obj))
#     print(obj.perInfo())
#
# obj01 = Person('임정섭', 49, 'M')
# obj01.printClsVar()
# Person.name = 100 # 새로운 클래스 소유의 name이라는 변수를 새로 만든거라 의미가 다름.
#
# Person.cls_var = 4.5 # 단 클래스 소유의 변수를 수정하게 되면 값의 일관성이 사라지므로 데이터가 변하면 안되는 위험성이 있어서 이런 방식으로 수정하지 않는다.
# obj01.printClsVar()
#
# Person.classFunc()

# Person.perInfo() 오류남. -> why? 인스턴스 소유의 함수라 클래스 이름으로 접근 불가.
#
# empObj01 = Employee('jslim', 1000 )
# print(empObj01.getSalary())
#
# empObj02 = Employee('조수연', 1200 )
# print(empObj02.getSalary())
#
# # 급여 인상
# empObj01.incrementSalary()
# empObj02.incrementSalary()
# print(empObj01.getSalary())
# print(empObj02.getSalary())
#
# # 인상률 변경
# Employee.changeRate(1.5)
#
# # 급여 다시 인상
# empObj01.incrementSalary()
# empObj02.incrementSalary()
# print(empObj01.getSalary())
# print(empObj02.getSalary())

#
# empObj01 = Employee('jslim', 1000 )
# print(empObj01.getSalary()) # 1000원인거 확인
# empObj01.incrementSalary()  # 10% 인상
# print(empObj01.getSalary()) # 10% 인상 확인
# empObj01.instanceRate((1.5)) # 50% 인상으로  비율값 수정
# empObj01.incrementSalary() # 50% 인상
# print(empObj01.getSalary()) # 50% 인상 확인
#
# empObj02 = Employee('조수연', 1200 )
# print(empObj02.getSalary()) # 1200원인거 확인
# empObj02.incrementSalary() # 비율이 원래 클래스변수 값인 1.1 이 아니라 1.5로 적용되버림
# print(empObj02.getSalary()) # empObj01관련해서 작업할때 클래스소유의 변수값이 수정되어  버려서 수정된 값이 적용된 것.
# # 이렇게 할시에 데이터의 일관성을 유지할 수 없어서 제대로 만들 수 없다면 클래스 변수 사용안하는 것 추천.

# myDreamCar = Car('티코', 4, 4000)
# myDreamCar.carInfo()

# [실습]
# caller 쪽에서 객체생성후
account = Account('441-2919-1234' , 500000, 0.073)
account.accountInfo()
account.withDraw(600000)
account.deposit(200000)
account.accountInfo()
account.withDraw(600000)
account.accountInfo()
print("현재 잔액의 이자를 포함한 금액")
account.printInterestRate()


from bigdata.inheritance.oop_inheritance import *

obj = MyDate()
obj.year = -2021
print(obj.year)
# 년도가 음수일수는 없으니까 이렇게 수정되면 곤란하니까
# 캡슐화(은닉화)해서 바뀌면 치명적일수 있는 데이터를 보호해주는 것.

# private vs public

sub = Sub() # 자식클래스로 만들어줘야 부모클래스까지 이용 가능. 부모클래스를 인스턴스로 생성시엔 자식클래스 이용 불가능
echo = sub.sayEcho('jslim') # 상속을 하게 되면 부모의 요소를 가져다 쓸 수 있다.
print('caller :' , echo)  # sub클래스에 아무것도 없지만, sup클래스를 상속받아서 sup클래스의 sayEcho함수 사용 가능.
# 부모, 자식클래스에 같은 이름의 함수가 있다면 자기자신것 먼저 호출후에 없으면 부모클래스의 함수 호출함.

child = Child01('jslim','instructor', 32)
print(child.display())

# PersonVO, StudentVO, TeacherVO
perList = []
perList.append(StudentVO('한태형', 30, '경기도', '1992' ))
perList.append(StudentVO('조수연', 25, '서울', '2016'))
perList.append(TeacherVO('임섭순', 31, '광주','python'))

for obj in perList:
    if isinstance(obj,StudentVO):
        print(obj.stuInfo())
    else:
        print(obj.teaInfo())

```

