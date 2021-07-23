# 파이썬 연습문제 #1



- mpg data 문제 분석 연습
  - 코드 수정 필요!! 

```python
import operator

import mpg as m
from statistics import mean

mpgList = []

with open('./data/mpg.txt','r',encoding='UTF-8') as file:
    file.readline() # 첫번째 라인 버린것.
    line = file.readline()
    while line != '':
        data = line.strip('\n').split(',')
        instance = m.Mpg(data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],data[8],data[9],data[10])
        mpgList.append(instance)
        #print(data)
        line = file.readline().strip('\n')


# 1. displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중
# 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 확인하세요.

def question01():
    displ04= []
    displ05= []
    for instance in mpgList:
        if float(instance.getDispl()) <= 4:
            displ04.append(int(instance.getHwy()))
        elif float(instance.getDispl()) >= 5:
            displ05.append(int(instance.getHwy()))
    print("문제 1번. under 4 mean:",mean(displ04))
    print("문제 1번. over 5 mean:", mean(displ05))
    if mean(displ04)> mean(displ05):
        print('문제 1번. 배기량 4의 연비가 더 좋습니다.')
    else:
        print('문제 1번. 배기량 5의 연비가 더 좋습니다.')

question01()

'''
def question01() :
    displ04 = []
    displ05 = []
    for instance in mpgList:
        if float(instance.getDispl()) <= 4:
            displ04.append(int(instance.getHwy()))
        if float(instance.getDispl()) >= 5:
            displ05.append(int(instance.getHwy()))
    print('4 - ', mean(displ04))
    print('5 - ', mean(displ05))
    if mean(displ04) > mean(displ05) :
        print('배기량 4의 연비가 더 좋습니다.')
    else:
        print('배기량 5의 연비가 더 좋습니다.')

'''
# 2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 한다.
# "audi"와 "toyota" 중 어느 manufacturer(제조회사)의 cty(도시 연비)가
# 평균적으로 더 높은지 확인하세요.

def question02():
    audi = []
    toyota = []
    for instance in mpgList:
        if instance.getManufacturer() =='audi':
            audi.append(int(instance.getCty()))
        elif instance.getManufacturer() == 'toyota':
            toyota.append(int(instance.getCty()))
    print("문제2번. audi's cty mean : ", mean(audi))
    print("문제2번. toyota's cty mean : ", mean(toyota))
    if(mean(audi) > mean(toyota)):
        print("문제2번. audi의 도시 연비가 더 좋습니다.")
    else:
        print("문제2번. toyota의 도시 연비가 더 좋습니다.")

question02()


# 3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 한다.
# 이 회사들의 데이터를 추출한 후 hwy(고속도로 연비) 평균을 구하세요.

def question03():
    chevrolet = []
    ford = []
    honda = []

    for instance in mpgList:
        if instance.getManufacturer() == 'chevrolet':
            chevrolet.append(int(instance.getHwy()))
        elif instance.getManufacturer() == 'ford':
            ford.append(int(instance.getHwy()))
        elif instance.getManufacturer() == 'honda':
            honda.append(int(instance.getHwy()))
    print("문제 3번. chevrolet's hwy mean : {}, ford's hwy mean : {}, honda's hwy mean : {} ".format(mean(chevrolet), mean(ford), mean(honda)))
    if max(mean(chevrolet), mean(ford), mean(honda)) == mean(chevrolet):
        print("문제 3번. 고속도로 연비가 가장 좋은 제조사는 chevrolet입니다.")
    elif max(mean(chevrolet), mean(ford), mean(honda)) == mean(ford):
        print("문제 3번. 고속도로 연비가 가장 좋은 제조사는 ford입니다.")
    else:
        print("문제 3번. 고속도로 연비가 가장 좋은 제조사는 honda입니다.")

question03()

# 4. "audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가
# 높은지 알아보려고 한다. "audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는
# 자동차의 데이터를 출력하세요.

def question04():
    audi = [] #manufacturer,model,displ,year,cyl,trans,drv,cty,hwy,fl,class
    cnt = 0
    for instance in mpgList:
        if instance.getManufacturer() == 'audi':
            audi.append([instance.getManufacturer(),instance.getModel(), instance.getDispl(),instance.getYear(),instance.getCyl(),instance.getTrans(),instance.getDrv(),instance.getCty(),instance.getHwy(),instance.getFl(),instance.getCls()])
    result = reversed(sorted(audi, key =lambda audi : audi[8] ))
    for i in result:
        print("문제 4번. audi에서 생산한 자동차중 hwy {}위 : {}".format(cnt+1,i))
        cnt += 1
        if cnt == 5:
            break

question04()


# 5. mpg 데이터는 연비를 나타내는 변수가 2개입니다.
# 두 변수를 각각 활용하는 대신 하나의 통합 연비 변수를 만들어 사용하려 합니다.
# 평균 연비 변수는 두 연비(고속도로와 도시)의 평균을 이용합니다.
# 회사별로 "suv" 자동차의 평균 연비를 구한후 내림차순으로 정렬한 후 1~5위까지 데이터를 출력하세요.
from collections import defaultdict
def question05():
    suv_list = []
    manu_dict = {}

    for instance in mpgList:
        if instance.getCls() == 'suv':
            suv_list.append(instance)

    for instance in suv_list:
        avgs = (int(instance.getHwy()) + int(instance.getCty())) / 2
        if instance.getManufacturer() in manu_dict:
            manu_dict[instance.getManufacturer()] += avgs
        else:
            manu_dict[instance.getManufacturer()] = 0
        result = sorted(manu_dict.items(), key = operator.itemgetter(1),reverse = True)
    print("문제 5번. suv 자동차의 평균 연비 top5 (model,평균연비) : ",result[:5])


question05()

# 6. mpg 데이터의 class는 "suv", "compact" 등 자동차의 특징에 따라
# 일곱 종류로 분류한 변수입니다. 어떤 차종의 도시 연비가 높은지 비교하려 합니다.
# class별 cty 평균을 구하고 cty 평균이 높은 순으로 정렬해 출력하세요.
#
def question06():
    class_dict = defaultdict(list)

    for instance in mpgList:
        class_dict[instance.getCls()].append(int(instance.getCty()))

    cty_list = list(class_dict.values())
    class_dict['compact'] = mean(cty_list[0])
    class_dict['midsize'] = mean(cty_list[1])
    class_dict['suv'] = mean(cty_list[2])
    class_dict['2seater'] = mean(cty_list[3])
    class_dict['minivan'] = mean(cty_list[4])
    class_dict['pickup'] = mean(cty_list[5])
    class_dict['subcompact'] = mean(cty_list[6])
    result = sorted(class_dict.items(), key=operator.itemgetter(1), reverse=True)

    print("문제 6번. class별 cty 평균이 높은 순 : ",result)

question06()

# 7. 어떤 회사 자동차의 hwy(고속도로 연비)가 가장 높은지 알아보려 합니다.
# # hwy(고속도로 연비) 평균이 가장 높은 회사 세 곳을 출력하세요.

def question07():
    manu_dict = defaultdict(list)

    for instance in mpgList:
        manu_dict[instance.getManufacturer()].append(int(instance.getHwy()))

    hwy_list = list(manu_dict.values())
    manu_dict['audi'] = mean(hwy_list[0])
    manu_dict['chevrolet'] = mean(hwy_list[1])
    manu_dict['dodge'] = mean(hwy_list[2])
    manu_dict['ford'] = mean(hwy_list[3])
    manu_dict['honda'] = mean(hwy_list[4])
    manu_dict['hyundai'] = mean(hwy_list[5])
    manu_dict['jeep'] = mean(hwy_list[6])
    manu_dict['land rover'] = mean(hwy_list[7])
    manu_dict['lincoln'] = mean(hwy_list[8])
    manu_dict['mercury'] = mean(hwy_list[9])
    manu_dict['nissan'] = mean(hwy_list[10])
    manu_dict['pontiac'] = mean(hwy_list[11])
    manu_dict['subaru'] = mean(hwy_list[12])
    manu_dict['toyota'] = mean(hwy_list[13])
    manu_dict['volkswagen'] = mean(hwy_list[14])

    result = sorted(manu_dict.items(), key=operator.itemgetter(1), reverse=True)

    print("문제 7번. hwy(고속도로 연비) 평균이 가장 높은 회사 세 곳 : ",result[:3])
question07()


# 8. 어떤 회사에서 "compact" 차종을 가장 많이 생산하는지 알아보려고 합니다.
# 각 회사별 "compact" 차종 수를 내림차순으로 정렬해 출력하세요.

def question08():
    manu_dict = {}
    for instance in mpgList:
        if instance.getCls()=='compact':
            if instance.getManufacturer() in manu_dict:
                manu_dict[instance.getManufacturer()] += 1
            else:
                manu_dict[instance.getManufacturer()] = 0

    result = sorted(manu_dict.items(), key=operator.itemgetter(1), reverse=True)
    print("문제 8번. 각 회사별  'compact' 차종 수 : ",result)



question08()
```