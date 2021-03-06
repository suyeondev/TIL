# 최적화 방법

## 최적화란?

정해진 조건 아래서 목적 함수를 최대화 혹은 최소화하는 해를 구하는 것

![볼록_비볼록문제](https://user-images.githubusercontent.com/86271820/152306112-d5f69130-4de2-4109-a27c-afdac5d02964.jpg)

- 볼록 함수 (Convex)
  - 전체에 커다란 봉우리가 하나 있다 ⇒ 전체 최적해를 계산하기 편하다, 함수의 어느 위치에 있든 전체 최적해의 방향을 국소적 정보로 알 수 있다는 특성이 있다.

- 비 볼록함수 (Non-Convex)
  - 전체 최적해가 아니지만, 국소적으로 최적해가 되는 해를 국부 최적해라고 부른다.
  - 현실 문제는 국부 최적해를 포함하는 경우가 많아 비볼록 문제인 경우가 많다.



## 경사법

최급강하법 : 적절하게 정한 초기값부터 시작해 함수 f의 1차 미분정보만 이용하여 조금씩 최적해에 접근하는 방법.

해의 수정 폭을 제어하는 파라미터를 학습률이라고 한다.



학습률

- 지나치게 높으면 최적해 부근에서 왔다갔다를 반복하게 되고, 

- 작으면 최적해에 도달하는 데에 오랜시간이 걸리게 된다.

  ⇒  **학습률을 적절히 설정하는 것이 중요!**



## 조합최적화 - 최소 전역 트리

조합 등 미분 가능한 함수를 정의하기 어려운 문제를 대상으로 한 최적화 문제도 존재한다.



최소 전역트리문제란? 

송전선 설계등에 응용되는 문제로, 발전소끼리 연결하는 비용이 주어졌을때 전체를 연결하는 총비용이 가장 낮아지도록 모든 발전소를 연결하는 방법을 찾는 것이다. 



**발전소간의 거리**

|      | A    | B    | C    | D    | E    | F    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| A    | 0    | 11   | 3    | 5    | 1    | 5    |
| B    | 11   | 0    | 4    | 5    | 7    | 2    |
| C    | 3    | 4    | 0    | 4    | 3    | 4    |
| D    | 5    | 5    | 4    | 0    | 7    | 5    |
| E    | 6    | 9    | 7    | 3    | 6    | 4    |
| F    | 1    | 7    | 3    | 7    | 0    | 11   |
| G    | 5    | 2    | 4    | 5    | 11   | 0    |

발전소 두 개를 연결하는 방법 : (7*6)/2 = 21가지

전체를 연결하기 위해서는 적절한 여섯 개의 변을 만들 필요가 있다. 

약 5.4만 가지 경우에서 최적의 연결법을 찾는다.



**계산량이 적은 해법을 내는 것이 조합 최적화의 포인트!** 



최소 전역 문제의 경우, 

1. 어떤 발전소를 임의로 선택 (A 선택시)
2. 그곳에서 가장 가까운 발전소를 선택 (A와 가장 가까운 F 선택)
3. A와 F에서 나온 송전선중 A, F 이외와 연결되는 송전선 중 가장 작은 것을 선택(C를 선택하게 됨)
4. 위 과정을 반복하면서 차례로 증가해 간다. **(프림 알고리즘)**



## 조합 최적화 - 배낭 문제

배낭 문제란?

무게와 가치를 알고 있는 n개의 상품중 배낭에 담을 수 있는 최대 무게가 K이하라는 제약을 지키면서도 가치의 합이 최대가 되는 상품 조합을 찾는 문제

![배낭문제_수학식](https://user-images.githubusercontent.com/86271820/152306287-75794c6d-3954-4eb9-8c76-166b1bf976c4.jpg)

동적 계획법으로 푸는 것이 일반적이다. 

분할 정복법과 마찬가지로 문제를 부분 문제로 나누어 푸는 방법

상품을 포함할 때는 중량만큼 오른쪽 아래로 이동한 칸에 새로 포함할 상품의 가치를 더하고, 바로 위 칸과 비교해 큰쪽을 선택한다.



| 상품 | A    | B    | C    | D    | E    |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 중량 | 1    | 3    | 2    | 7    | 4    |
| 가치 | 3    | 2    | 4    | 6    | 3    |



|        | 0    | 1    | 2    | 3    | 4    | 5    | 6     | 7      | 8      | 9      |
| ------ | ---- | ---- | ---- | ---- | ---- | ---- | ----- | ------ | ------ | ------ |
| 비었음 | 0    | 0    | 0    | 0    | 0    | 0    | 0     | 0      | 0      | 0      |
| A      | 0    | 3 A  | 3 A  | 3 A  | 3 A  | 3 A  | 3 A   | 3 A    | 3 A    | 3 A    |
| B      | 0    | 3 A  | 3 A  | 3 A  | 5 AB | 5 AB | 5 AB  | 5 AB   | 5 AB   | 5 AB   |
| C      | 0    | 3 A  | 4 C  | 7 AC | 7 AC | 7 AC | 9 ABC | 9 ABC  | 9 ABC  | 9 ABC  |
| D      | 0    | 3 A  | 4 C  | 7 AC | 7 AC | 7 AC | 9 ABC | 9 ABC  | 9 ABC  | 10 CD  |
| F      | 0    | 3 A  | 4 C  | 7 AC | 7 AC | 7 AC | 9 ABC | 10 ACE | 10 ACE | 10 ACE |

위에서부터 차례로 포함할지 판정한다.	

A,C,E를 배낭에 담는다면, 중량은 7이고 가치는 10

C,D를 배낭에 담는다면, 중량이 9이고 가치가 10이다. 



동적 계획법을 이용함으로써 전체 O(2^n)에서 계산량이 O(nK)가 된다.

5AB[참고문헌] - 그림으로 배우는 데이터과학 Data Science - 히사노 료헤이, 키와키 타이치 지음 김성훈 옮김

 