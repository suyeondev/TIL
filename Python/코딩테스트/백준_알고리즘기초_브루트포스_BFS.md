# 코딩테스트 준비 - Python



출처 : 백준 알고리즘 문제 [Baekjoon Online Judge](https://www.acmicpc.net/)



## 알고리즘 기초 2/2 - BFS



#### 610 -  문제번호 : 1697

 ##### 제목 : 숨바꼭질

- 문제 : 수빈이는 동생과 숨바꼭질을 하고 있다. 수빈이는 현재 점 N(0 ≤ N ≤ 100,000)에 있고, 동생은 점 K(0 ≤ K ≤ 100,000)에 있다. 수빈이는 걷거나 순간이동을 할 수 있다. 만약, 수빈이의 위치가 X일 때 걷는다면 1초 후에 X-1 또는 X+1로 이동하게 된다. 순간이동을 하는 경우에는 1초 후에 2*X의 위치로 이동하게 된다.

  수빈이와 동생의 위치가 주어졌을 때, 수빈이가 동생을 찾을 수 있는 가장 빠른 시간이 몇 초 후인지 구하는 프로그램을 작성하시오.

- 입력 : 첫 번째 줄에 수빈이가 있는 위치 N과 동생이 있는 위치 K가 주어진다. N과 K는 정수이다.

- 출력 : 수빈이가 동생을 찾는 가장 빠른 시간을 출력한다.

- 예제 입력

  ```
  5 17
  ```

- 예제 출력1

  ```
  4
  ```

- 제출 코드

```python
import sys
from collections import deque
input = sys.stdin.readline
n, k = map(int, input().split())

def bfs():
    q = deque()
    q.append(n)

    while q:
        x = q.popleft()
        if x == k:
            print(dist[x])
            break
        for nx in (x-1, x+1, x*2):
            if 0 <= nx <= MAX and not dist[nx]:
                dist[nx] = dist[x] + 1
                q.append(nx)
MAX = 10 ** 5 # 시간초과 나지않게 수 제한
dist = [0] * (MAX +1) # 이동한 거리를 알기 위한 변수

bfs()
```

 



#### 610 -  문제번호 : 13913

 ##### 제목 : 숨바꼭질 4

- 문제 : 수빈이는 동생과 숨바꼭질을 하고 있다. 수빈이는 현재 점 N(0 ≤ N ≤ 100,000)에 있고, 동생은 점 K(0 ≤ K ≤ 100,000)에 있다. 수빈이는 걷거나 순간이동을 할 수 있다. 만약, 수빈이의 위치가 X일 때 걷는다면 1초 후에 X-1 또는 X+1로 이동하게 된다. 순간이동을 하는 경우에는 1초 후에 2*X의 위치로 이동하게 된다.

  수빈이와 동생의 위치가 주어졌을 때, 수빈이가 동생을 찾을 수 있는 가장 빠른 시간이 몇 초 후인지 구하는 프로그램을 작성하시오.

- 입력 : 첫 번째 줄에 수빈이가 있는 위치 N과 동생이 있는 위치 K가 주어진다. N과 K는 정수이다.

- 출력 : 첫째 줄에 수빈이가 동생을 찾는 가장 빠른 시간을 출력한다.

  둘째 줄에 어떻게 이동해야 하는지 공백으로 구분해 출력한다.

- 예제 입력

  ```
  5 17
  ```

- 예제 출력1

  ```
  4
  5 10 9 18 17
  ```

- 제출 코드

```python
import sys
from collections import deque
input = sys.stdin.readline
n, k = map(int, input().split())

def path(x):
    arr=[]
    temp = x
    for _ in range(dist[x]+1):
        arr.append(temp)
        temp = move[temp]
    print(' '.join(map(str, arr[::-1])))

def bfs():
    q = deque()
    q.append(n)

    while q:
        x = q.popleft()

        if x == k:
            print(dist[x])
            path(x)
            break
        for nx in (x-1, x+1, x*2):
            if 0 <= nx <= MAX and not dist[nx]:
                dist[nx] = dist[x] + 1
                q.append(nx)
                move[nx] = x
MAX = 10 ** 5
dist = [0] * (MAX +1)
move = [0] * (MAX +1)
bfs()

```

 