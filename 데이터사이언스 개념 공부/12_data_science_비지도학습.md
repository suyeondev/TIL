# 비지도 학습

## K-평균 알고리즘

비지도 학습의 일종으로 클러스터링(군집)이 있다.



### K-means clustering algorithm이란?

목표는 같은 클러스터 내의 데이터 점끼리의 거리가 짧아지도록 데이터를 주어진 수의 클러스터로 분류하는 것이다.

각 클러스터와 거리 차이의 분산을 최소화하는 방식으로 동작한다. 레이블이 달려 있지 않은 입력 데이터에 레이블을 달아주는 역할을 수행한다. 



#### K-평균 알고리즘에 의한 근사해 구하기

1. 라벨을 랜덤하게 붙인다.
2. 중심점을 정한다.
3. 라벨을 다시 칠한다.
4. 중심점 계산, 각 라벨의 갱신을 반복한다



#### k-평균 알고리즘 한계점

- 클러스터 개수 k값을 입력 파라미터로 지정해주어야 한다.
  - 따라서, k값을 어떻게 주느냐에 따라 클러스터링의 결과가 극명하게 달라지며, 좋지 못한 결과를 보여줄 가능성이 있다.

- 이상값 (outlier) 에 민감하다.
  -  중심점을 갱신하는 과정에서 클러스터 내의 전체 평균 값을 크게 왜곡시킬 수 있다. 





## 계층적 클러스터링

하나하나의 데이터를 근접한 데이터와 결합함으로써 바텀업 방식으로 클러스터링 하는 방법이다.

K-평균 알고리즘과 달리 군집 수를 사전에 정하지 않아도 학습을 수행할 수 있습니다. 개체들이 결합되는 순서를 나타내는 트리형태의 구조인 **덴드로그램(Dendrogram)** 덕분이다.

![덴드로그램 예시](http://i.imgur.com/gsCJHjS.png)

사진 출처 : https://ratsgo.github.io/machine%20learning/2017/04/18/HC/



#### 계층적 클러스터링 순서

1. 클러스터 수를 데이터 수와 똑같이 설정하고, 가장 가까운 2개를 하나로 만든다.
2. 거리를 높이로 해서 클러스터를 결합했는지 기록한다.
3. 새로 만들어진 클러스터는 클러스터 내 데이터 중심점을 대표점으로 하여 새로 설정하고 남은 클러스터와 데이터점과의 거리를 다시 계산한다.
4. 이 과정을 반복한다.



## 주성분 분석

#### 주성분 분석이란?

다수의 변수를 소수로 줄여 데이터를 다시 표현하는 방법, 일반적으로 차원감소라고 부른다.

원래 변수에 상관관계가 없으면 유효한 방법은 아니지만, 주가의 시계열 등 변수 개수와 비교해 분산을 낳는 주요인이 적을 때 매우 효과적인 방법이 됩니다.



주성분 분석의 경우 분산을 많이 설명하는 것이 좋은 표현이다.

두 변수로 표현된 데이터를 하나의 변수로 다시 표현할 때 가장 간단한 방법은 한쪽 변수의 축을 사용하는 것입니다. 우선 데이터의 분산이 가장 커지도록 최초의 축을 그리고, 두번째 이후는 최초의 축에 직교한다는 제약 아래서 데이터의 분산이 가장 커지도록 축을 그립니다. 마지막 축은 첫 번째와 두 번째 축 양쪽에 직교하는 축으로서 자동으로 정해진다.



#### 주성분 분석과 특잇값 분해

주성분 분석은 공분산 행렬의 고유값 문제로서 풀 수 있다.
$$
\displaystyle\sum = V_p ∧ V_p^t
$$
∧는 행렬의 주대각선 성분을 제외한 모든 성분이 0이 되는 대각행렬이고, Vp의 각열은 고유벡터라고 불리는 것이 된다. 이행렬을 이용해서  XVp와 곱하면 주성분과 같은 변환을 할 수 있다.  차원을 줄일 경우는 Vp의 몇 개 열만 이요한다.



**주성분 분석과 특잇값 분해는 부호가 일치하지 않을 가능성을 빼면 기본적으로 같아진다.** 특잇값 분해로 생각하면 원 데이터 X를 행렬 분해하는 모습을 알 수 있다.



원래 행렬 X에 대해서도 행렬 분해할 수 있다. 이를 **특잇값 분해**라고 부른다.
$$
X = USV_s^T
$$
여기서 S는 대각선 성분을 제외한 모든 성분이 0인 대각행렬, U와 Vs는 유니타리 행렬(unitary matrix)로 불리는 전치행렬과 역행렬이 일치하는 특수한 행렬이다. 



∧의 대각성분에 (n-1)을 곱한 것과 S의 대각성분의 제곱은 완전히 일치한다. 또 Vs와 Vp는 부호관계가 일치하지 않을 가능성이 있따는 점만 제외하면 값은 일치한다. 



**따라서, 주성분 분석과 특잇값 분해는 수학적으로 비슷한 문제를 해결하고 있따는 것을 알 수 있다.**





[참고문헌] - 그림으로 배우는 데이터과학 Data Science - 히사노 료헤이, 키와키 타이치 지음 김성훈 옮김

