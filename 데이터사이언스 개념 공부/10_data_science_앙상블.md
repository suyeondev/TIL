# 앙상블 학습

## 앙상블 학습이란?

약한 학습기란?

- 그다지 성능이 나오지 않는 모델



 앙상블 학습이란?

- 약한 학습기를 잘 조합함으로써 예측 정밀도가 높은 모델을 만드는 것.



앙상블 학습을 할 때 약한 학습기로서 자주 선택되는 것이 트리라고 불리는 기법이다.

**트리**는 회귀 문제를 대상으로 할 경우 **회귀 트리**라고 부르고, 두 값을 다룰 경우는 **결정 트리**라고 부른다.

트리를 기반으로 하는 기법은 선형회귀 모델과 같은 수준으로 해석성이 있는 모델이지만,  쉽게 **과적합하는 경향이 있어 예측 정밀도면에서 제 성능이 나오지 않는다.** 

그러나, **앙상블을 활용하면 놀랄만큼 정밀도를 낼 수 있게된다.**



## 회귀트리, 부트스트랩, 배깅

#### 회귀 트리란?

- 특징량을 이용해 데이터를 몇개의 그룹으로 나누고 그룹의 평균 값을 예측값으로 하는 방법.

  

회귀트리의 문제점 : 분산이 크다.

데이터셋을 몇 번씩 샘플링하고 각 데이터셋으로 회귀트리를 추정해, 각 모델의 예측 평균값을 예측값으로 사용할 수 있다면? 

⇒ 단일 회귀 트리보다 좋아진다.



#### 여기서 사용하는 것이 **부트스트랩**이다.



- 부트스트랩 방법
  1. N개 있는 원본 데이터에서 복원 샘플링으로 N개 데이터를 샘플링
  2. 샘플링한 각 데이터로 모델 추정
  3. 이 과정을 여러 번 반복해서 추정 결과의 평균값 등을 취한다 

부트스트랩은 이 과정을 몇 번이나 반복해서 추정한 파라미터의 통계량을 이용하는 방법이다.

 교차검증법처럼 매우 효과적이라는 사실이 널리 알려져 있고, 파라미터의 신뢰구간(불확실성) 계산에도 자주 사용된다.



#### 배깅이란?

복원 샘플링으로 작성한 데이터에 회귀 트리를 적용한다.

그 모델로부터의 예측 평균값을 예측값으로 한다.



이러한 과정을 통해 **예측 정밀도를 높이는 것이 앙상블 학습의 핵심**이다.



## 랜덤 포레스트

#### 랜덤 포레스트란?

배깅을 약간 확장한 방법

배깅의 문제점 : 표본마다 추정 결과가 서로 비슷해져 버린다.

이 점에 주목해서 표본마다 회귀 트리를 **추정할 때 사용하는 변수도 랜덤하게 선택하는 것이 랜덤 포레스트**이다.



데이터 셋에서 특징량의 수가 p개 있을 때, 일반적으로 **√p 개의 변수를 선택하면 좋은 결과를 얻을 수 있다**고 한다.



추정 결과마다 중요성을 계산하고 그 평균값을 변수의 중요성으로 판정하는 일이 많다.



## 그래디언트 부스팅

#### 그래디언트 부스팅이란?

목표 변수에서 각 회귀 트리의 추정 결과를 조금씩 빼서 남은 잔차에 대해 반복해서 회귀트리를 추정하고 최종적으로 추정한 회귀 트리의 결과를 조합하는 방법.



그래디언트 부스팅의 핵심 : 비교적 깊이가 얕은 회귀 트리를 반복적으로 학습해 조금씩 추정 정밀도를 높여가는 것.



주의할 점 : 랜덤 포레스트와 달리, 트리의 최대수 B가 너무 크면 과적합하는 경향이 있다는 것.





[참고문헌] - 그림으로 배우는 데이터과학 Data Science - 히사노 료헤이, 키와키 타이치 지음 김성훈 옮김

