# 코딩테스트 준비 - Python



출처 : 백준 알고리즘 문제 [Baekjoon Online Judge](https://www.acmicpc.net/)



## 알고리즘 기초 2/2 - 브루트 포스(N과 M)



#### 510 -  문제번호 : 15649

 ##### 제목 : N과 M (1)

- 문제 : 자연수 N과 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.

  - 1부터 N까지 자연수 중에서 중복 없이 M개를 고른 수열

- 입력 : 첫째 줄에 자연수 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력1

  ```
  4 2
  ```

- 예제 출력1

  ```
  1 2
  1 3
  1 4
  2 1
  2 3
  2 4
  3 1
  3 2
  3 4
  4 1
  4 2
  4 3
  ```

- 제출 코드

```python
import sys
n, m = map(int, sys.stdin.readline().split())

s = []

def dfs():
    if len(s) == m: # 길이가 m인 수열이어야 해서
        print(' '.join(map(str,s)))
        return
    for i in range(1, n+1):
        if i not in s: # 중복된 숫자는 X
            s.append(i)
            dfs()
            s.pop()
dfs()
```

 만약 n=5, m=2라면 밑과 같은 형태로 진행될 것이다.

   s : [1] -> [1,2] -> [1] -> [1,3] -> [1] -> [1,4] -> [1] -> [1,5]

​			출력  pop(2) 출력  pop(3) 출력  pop(4) 출력  pop(5) 출력



#### 510 -  문제번호 15650

 ##### 제목 : N과 M (2)

- 문제 : 자연수 N과 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.

  - 1부터 N까지 자연수 중에서 중복 없이 M개를 고른 수열
  - 고른 수열은 오름차순이어야 한다.

- 입력 : 첫째 줄에 자연수 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력1

  ```
  4 2
  ```

- 예제 출력1

  ```
  1 2
  1 3
  1 4
  2 3
  2 4
  3 4
  ```

- 제출 코드

```python
import sys
n, m = map(int, sys.stdin.readline().split())

s = []

def dfs():
    if len(s) == m:  # 길이가 m인 수열이어야 해서
        print(' '.join(map(str,s)))
        return
    for i in range(1, n+1): # 중복된 숫자는 X
        if i not in s:
            if not s: # 첫째자리수는 리스트에 추가
                s.append(i)
                dfs()
                s.pop()
            if s:
                if i > s[-1]: # 바로 윗자리수보다 큰경우만 append
                    s.append(i)
                    dfs()
                    s.pop()
                elif i <= s[-1]:
                    pass
dfs()
```



#### 510 -  문제번호 15651

 ##### 제목 : N과 M (3)

- 문제 : 자연수 N과 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.

  - 1부터 N까지 자연수 중에서 M개를 고른 수열
  - 같은 수를 여러 번 골라도 된다.

- 입력 : 첫째 줄에 자연수 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 7)

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력1

  ```
  4 2
  ```

- 예제 출력1

  ```
  1 1
  1 2
  1 3
  1 4
  2 1
  2 2
  2 3
  2 4
  3 1
  3 2
  3 3
  3 4
  4 1
  4 2
  4 3
  4 4
  ```

- 제출 코드

```python
import sys
n, m = map(int, sys.stdin.readline().split())

s = []

def dfs():
    if len(s) == m:
        print(' '.join(map(str,s)))
        return
    for i in range(1, n+1): # 중복제거하는 조건 제거
        s.append(i)
        dfs()
        s.pop()
dfs()
```



#### 510 -  문제번호 15652

 ##### 제목 : N과 M (4)

- 문제 : 자연수 N과 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.

  - 1부터 N까지 자연수 중에서 M개를 고른 수열
  - 같은 수를 여러 번 골라도 된다.
  - 고른 수열은 비내림차순이어야 한다.
    - 길이가 K인 수열 A가 A1 ≤ A2 ≤ ... ≤ AK-1 ≤ AK를 만족하면, 비내림차순이라고 한다.

- 입력 : 첫째 줄에 자연수 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력1

  ```
  4 2
  ```

- 예제 출력1

  ```
  1 1
  1 2
  1 3
  1 4
  2 2
  2 3
  2 4
  3 3
  3 4
  4 4
  ```

- 제출 코드

```python
import sys
n, m = map(int, sys.stdin.readline().split())
s = []

def dfs():
    if len(s) == m:
        print(' '.join(map(str,s)))
        return
    for i in range(1, n+1):
        if not s:
            s.append(i)
            dfs()
            s.pop()

        elif s:
            if i >= s[-1]:
                s.append(i)
                dfs()
                s.pop()
            elif i < s[-1]: # 바로 위자리수가 i보다 작은 경우는 출력 X
                pass
dfs()
```



#### 510 -  문제번호 15654

 ##### 제목 : N과 M (5)

- 문제 : N개의 자연수와 자연수 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오. N개의 자연수는 모두 다른 수이다.

  - N개의 자연수 중에서 M개를 고른 수열

- 입력 : 첫째 줄에 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)

  둘째 줄에 N개의 수가 주어진다. 입력으로 주어지는 수는 10,000보다 작거나 같은 자연수이다.

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력1

  ```
  4 2
  9 8 7 1
  ```

- 예제 출력1

  ```
  1 7
  1 8
  1 9
  7 1
  7 8
  7 9
  8 1
  8 7
  8 9
  9 1
  9 7
  9 8
  ```

- 제출 코드

```python
import sys
n, m = map(int, sys.stdin.readline().split())
num = list(map(int,sys.stdin.readline().split()))
num.sort() # 사전순으로 증가하는 순서로 출력하기 위해 정렬
s = []

def dfs():
    if len(s) == m:
        print(' '.join(map(str,s)))
        return
    for i in num:
        if i not in s: # 중복되지 않는 조건
            s.append(i)
            dfs()
            s.pop()

        elif i in s: 
            pass
dfs()
```



#### 510 -  문제번호 15655

 ##### 제목 : N과 M (6)

- 문제 : N개의 자연수와 자연수 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오. N개의 자연수는 모두 다른 수이다.

  - N개의 자연수 중에서 M개를 고른 수열
  - 고른 수열은 오름차순이어야 한다.

- 입력 : 첫째 줄에 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)

  둘째 줄에 N개의 수가 주어진다. 입력으로 주어지는 수는 10,000보다 작거나 같은 자연수이다.

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력1

  ```
  4 2
  9 8 7 1
  ```

- 예제 출력1

  ```
  1 7
  1 8
  1 9
  7 8
  7 9
  8 9
  ```

- 제출 코드

```python
import sys
n, m = map(int, sys.stdin.readline().split())
num = list(map(int,sys.stdin.readline().split()))
num.sort() # 오름차순으로 출력을 위해
visited = [False]*(max(num)+1) # 방문했는지 확인을 위한 리스트
s = [] # 출력을 위한 리스트

def dfs(depth, idx, n, m):
    if depth == m:
        print(' '.join(map(str,s)))
        return
    for i in range(idx, len(num)):
        if not visited[i]: # 만약 해당 원소가 방문하지 않았다면
            visited[i] = True # 방문한 것으로 바꿔주고
            s.append(num[i]) # 그 값을 추가
            dfs(depth+1, i+1, n, m) # 다시 깊이 + 1 해준 다음 다시 재귀
            visited[i] = False # 다 돌았으면 방문 안한것으로 False로 수정
            s.pop()

dfs(0,0,n,m)
```



#### 510 -  문제번호 15656

 ##### 제목 : N과 M (7)

- 문제 : N개의 자연수와 자연수 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오. N개의 자연수는 모두 다른 수이다.

  - N개의 자연수 중에서 M개를 고른 수열
  - 같은 수를 여러 번 골라도 된다.

- 입력 : 첫째 줄에 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 7)

  둘째 줄에 N개의 수가 주어진다. 입력으로 주어지는 수는 10,000보다 작거나 같은 자연수이다.

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력1

  ```
  4 2
  9 8 7 1
  ```

- 예제 출력1

  ```
  1 1
  1 7
  1 8
  1 9
  7 1
  7 7
  7 8
  7 9
  8 1
  8 7
  8 8
  8 9
  9 1
  9 7
  9 8
  9 9
  ```

- 제출 코드

```python
import sys
n, m = map(int, sys.stdin.readline().split())
num = list(map(int,sys.stdin.readline().split()))
num.sort()
s = []

def dfs():
    if len(s) == m:
        print(' '.join(map(str,s)))
        return
    for i in num:
        s.append(i)
        dfs()
        s.pop()
dfs()
```



#### 510 -  문제번호 15657

 ##### 제목 : N과 M (8)

- 문제 : N개의 자연수와 자연수 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오. N개의 자연수는 모두 다른 수이다.

  - N개의 자연수 중에서 M개를 고른 수열
  - 같은 수를 여러 번 골라도 된다.
  - 고른 수열은 비내림차순이어야 한다.
    - 길이가 K인 수열 A가 A1 ≤ A2 ≤ ... ≤ AK-1 ≤ AK를 만족하면, 비내림차순이라고 한다.

- 입력 : 첫째 줄에 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)

  둘째 줄에 N개의 수가 주어진다. 입력으로 주어지는 수는 10,000보다 작거나 같은 자연수이다.

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력1

  ```
  4 2
  9 8 7 1
  ```

- 예제 출력1

  ```
  1 1
  1 7
  1 8
  1 9
  7 7
  7 8
  7 9
  8 8
  8 9
  9 9
  ```

- 제출 코드

```python
import sys
n, m = map(int, sys.stdin.readline().split())
num = list(map(int,sys.stdin.readline().split()))
num.sort()
s = []

def dfs():
    if len(s) == m:
        print(' '.join(map(str,s)))
        return
    for i in num:
        if s:
            if i >= s[-1]: # 윗자리수와 같거나 큰 경우에만 추가
                s.append(i)
                dfs()
                s.pop()
            elif i < s[-1]:
                pass
        elif not s: 
            s.append(i)
            dfs()
            s.pop()
dfs()
```





#### 510 -  문제번호 15663

 ##### 제목 : N과 M (9)

- 문제 : N개의 자연수와 자연수 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.

  - N개의 자연수 중에서 M개를 고른 수열

- 입력 : 첫째 줄에 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)

  둘째 줄에 N개의 수가 주어진다. 입력으로 주어지는 수는 10,000보다 작거나 같은 자연수이다.

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력1

  ```
  4 2
  9 7 9 1
  ```

- 예제 출력1

  ```
  1 7
  1 9
  7 1
  7 9
  9 1
  9 7
  9 9
  ```

- 제출 코드

```python
import sys
n, m = map(int, sys.stdin.readline().split())
num = list(map(int,sys.stdin.readline().split()))
num.sort()
s = []
answer=[]
visited = [False] * n

def dfs(idx):
    if len(s) == m:
        print(' '.join(map(str,s)))
        return
    check = 0
    for i in range(n):
        if not visited[i] and check != num[i]:
            visited[i] = True
            s.append(num[i])
            check = num[i]
            dfs(idx + 1)
            visited[i] = False
            s.pop()
dfs(0)
```



#### 510 -  문제번호 15664

 ##### 제목 : N과 M (10)

- 문제 : N개의 자연수와 자연수 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.

  - N개의 자연수 중에서 M개를 고른 수열
  - 고른 수열은 비내림차순이어야 한다.
    - 길이가 K인 수열 A가 A1 ≤ A2 ≤ ... ≤ AK-1 ≤ AK를 만족하면, 비내림차순이라고 한다.

- 입력 : 첫째 줄에 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)

  둘째 줄에 N개의 수가 주어진다. 입력으로 주어지는 수는 10,000보다 작거나 같은 자연수이다

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력1

  ```
  4 2
  9 7 9 1
  ```

- 예제 출력1

  ```
  1 7
  1 9
  7 9
  9 9
  ```

- 제출 코드

```python
import sys
n, m = map(int, sys.stdin.readline().split())
num = list(map(int,sys.stdin.readline().split()))
num.sort()
s = []
visited = [False] * n

def dfs(idx):
    if len(s) == m:
        print(' '.join(map(str,s)))
        return
    check = 0
    for i in range(idx, n):
        if not visited[i] and check != num[i]:
            visited[i] = True
            s.append(num[i])
            check = num[i]
            dfs(i + 1)
            visited[i] = False
            s.pop()

dfs(0)
```



#### 510 -  문제번호 15665

 ##### 제목 : N과 M (11)

- 문제 : N개의 자연수와 자연수 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.

  - N개의 자연수 중에서 M개를 고른 수열
  - 같은 수를 여러 번 골라도 된다.

- 입력 : 첫째 줄에 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 7)

  둘째 줄에 N개의 수가 주어진다. 입력으로 주어지는 수는 10,000보다 작거나 같은 자연수이다.

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력1

  ```
  4 2
  9 7 9 1
  ```

- 예제 출력1

  ```
  1 1
  1 7
  1 9
  7 1
  7 7
  7 9
  9 1
  9 7
  9 9
  ```

- 제출 코드

```python
import sys
n, m = map(int, sys.stdin.readline().split())
num = list(map(int,sys.stdin.readline().split()))
num.sort()
s = []

def dfs():
    if len(s) == m:
        print(' '.join(map(str,s)))
        return
    check = 0
    for i in range(n):
        if check != num[i]:
            s.append(num[i])
            check = num[i]
            dfs()
            s.pop()
dfs()
```

1. 비내림차순 조건을 위해 사용했던 idx로 range 조절 방법 제거
2. 같은 수를 여러번 골라도 되니까 visited 방법 제거



#### 510 -  문제번호 15666

 ##### 제목 : N과 M (12)

- 문제 :

- N개의 자연수와 자연수 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.

  - N개의 자연수 중에서 M개를 고른 수열
  - 같은 수를 여러 번 골라도 된다.
  - 고른 수열은 비내림차순이어야 한다.
    - 길이가 K인 수열 A가 A1 ≤ A2 ≤ ... ≤ AK-1 ≤ AK를 만족하면, 비내림차순이라고 한다.

- 입력 : 첫째 줄에 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)

  둘째 줄에 N개의 수가 주어진다. 입력으로 주어지는 수는 10,000보다 작거나 같은 자연수이다.

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력1

  ```
  4 2
  9 7 9 1
  ```

- 예제 출력1

  ```
  1 1
  1 7
  1 9
  7 7
  7 9
  9 9
  ```

- 제출 코드

```python
import sys
n, m = map(int, sys.stdin.readline().split())
num = list(map(int,sys.stdin.readline().split()))
num.sort()
s = []

def dfs(idx):
    if len(s) == m:
        print(' '.join(map(str,s)))
        return
    check = 0
    for i in range(idx, n):
        if check != num[i]:
            s.append(num[i])
            check = num[i]
            dfs(i)
            s.pop()
dfs(0)
```

1. 비내림차순 조건을 위해 사용했던 idx로 range 조절 방법 다시 추가

   
