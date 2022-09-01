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

 

#### 610 -  문제번호 : 14226

 ##### 제목 : 이모티콘

- 문제 : 영선이는 매우 기쁘기 때문에, 효빈이에게 스마일 이모티콘을 S개 보내려고 한다.

  영선이는 이미 화면에 이모티콘 1개를 입력했다. 이제, 다음과 같은 3가지 연산만 사용해서 이모티콘을 S개 만들어 보려고 한다.

  1. 화면에 있는 이모티콘을 모두 복사해서 클립보드에 저장한다.
  2. 클립보드에 있는 모든 이모티콘을 화면에 붙여넣기 한다.
  3. 화면에 있는 이모티콘 중 하나를 삭제한다.

  모든 연산은 1초가 걸린다. 또, 클립보드에 이모티콘을 복사하면 이전에 클립보드에 있던 내용은 덮어쓰기가 된다. 클립보드가 비어있는 상태에는 붙여넣기를 할 수 없으며, 일부만 클립보드에 복사할 수는 없다. 또한, 클립보드에 있는 이모티콘 중 일부를 삭제할 수 없다. 화면에 이모티콘을 붙여넣기 하면, 클립보드에 있는 이모티콘의 개수가 화면에 추가된다.

  영선이가 S개의 이모티콘을 화면에 만드는데 걸리는 시간의 최솟값을 구하는 프로그램을 작성하시오.

- 입력 : 첫째 줄에 S (2 ≤ S ≤ 1000) 가 주어진다.

- 출력 : 첫째 줄에 이모티콘을 S개 만들기 위해 필요한 시간의 최솟값을 출력한다.

- 예제 입력

  ```
  2
  ```

- 예제 출력1

  ```
  2
  ```

- 제출 코드

```python
import sys
from collections import deque
input = sys.stdin.readline
s = int(input())
q = deque()
 # 초기 화면 이모티콘 개수, 클립보드 이모티콘 개수
q.append((1,0))
dist = [[-1]*(s+1) for _ in range(s+1)]
dist[1][0] = 0
while q:
    n, c = q.popleft()
    if dist[n][n] == -1: # 방문하지 않았으면
        dist[n][n] = dist[n][c] + 1 #  모든 연산은 1초가 걸리니 모든 경로의 가중치는 1이다.
        q.append((n,n))
    if n + c <= s and dist[n + c][c] == -1:
        dist[n+c][c] = dist[n][c] + 1
        q.append((n+c, c))
    if n-1 >= 0 and dist[n-1][c] == -1:
        dist[n-1][c] = dist[n][c] + 1
        q.append((n-1,c))
answer = -1
for i in range(s+1):
    if dist[s][i] != -1:
        if answer == -1 or answer > dist[s][i]:
            answer = dist[s][i]
print(answer)

```

 

- 걸리는 시간의 최솟값을 구한다. 즉, 최단시간을 구해야하니 BFS로 풀면 된다.



#### 610 -  문제번호 : 13549

 ##### 제목 : 숨바꼭질 3

- 문제 : 수빈이는 동생과 숨바꼭질을 하고 있다. 수빈이는 현재 점 N(0 ≤ N ≤ 100,000)에 있고, 동생은 점 K(0 ≤ K ≤ 100,000)에 있다. 수빈이는 걷거나 순간이동을 할 수 있다. 만약, 수빈이의 위치가 X일 때 걷는다면 1초 후에 X-1 또는 X+1로 이동하게 된다. 순간이동을 하는 경우에는 0초 후에 2*X의 위치로 이동하게 된다.

  수빈이와 동생의 위치가 주어졌을 때, 수빈이가 동생을 찾을 수 있는 가장 빠른 시간이 몇 초 후인지 구하는 프로그램을 작성하시오.

- 입력 : 첫 번째 줄에 수빈이가 있는 위치 N과 동생이 있는 위치 K가 주어진다. N과 K는 정수이다.

- 출력 : 수빈이가 동생을 찾는 가장 빠른 시간을 출력한다.

- 예제 입력

  ```
  5 17
  ```

- 예제 출력1

  ```
  2
  ```

- 제출 코드

```python
from collections import deque

n, k = map(int, input().split())  # n: 수빈이가 있는 위치, k: 동생이 있는 위치
q = deque()
q.append(n)
visited = [-1 for _ in range(100001)]
visited[n] = 0

while q:
    s = q.popleft()
    if s == k:
        print(visited[s])
        break
    if 0 <= s-1 < 100001 and visited[s-1] == -1:
        visited[s-1] = visited[s] + 1
        q.append(s-1)
    if 0 < s*2 < 100001 and visited[s*2] == -1:
        visited[s*2] = visited[s]
        q.appendleft(s*2)  # 2*s 가 다른 연산보다 더 높은 우선순위를 가지기 위함
    if 0 <= s+1 < 100001 and visited[s+1] == -1:
        visited[s+1] = visited[s] + 1
        q.append(s+1)

```

 

- 다시 풀어보기! 