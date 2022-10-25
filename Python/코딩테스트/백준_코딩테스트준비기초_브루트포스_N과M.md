# 코딩테스트 준비 - Python



출처 : 백준 알고리즘 문제 [Baekjoon Online Judge](https://www.acmicpc.net/)



## 코딩테스트 준비 기초 - 브루투 포스 N과 M



#### 문제번호 : 15649

 ##### 제목 : N과 M(1)

- 문제 : 자연수 N과 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.

  - 1부터 N까지 자연수 중에서 중복 없이 M개를 고른 수열

- 입력 : 첫째 줄에 자연수 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력

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
input = sys.stdin.readline
n, m = map(int, input().split())
ans = []
visited = [False] * (n + 1)
def dfs(num):
    if num == m:
        print(' '.join(map(str,ans)))
    for i in range(1,n+1):
        if not visited[i]:
            visited[i] = True
            ans.append(i)
            dfs(num + 1)
            visited[i] = False
            ans.pop()
dfs(0)
```



#### 문제번호 : 15650

 ##### 제목 : N과 M(2)

- 문제 : 자연수 N과 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.

  - 1부터 N까지 자연수 중에서 중복 없이 M개를 고른 수열
  - 고른 수열은 오름차순이어야 한다.

- 입력 : 첫째 줄에 자연수 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력

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
input = sys.stdin.readline

def dfs(arr, idx):
    if len(arr) == M:
        print(*arr)
        return

    for i in range(idx, N):
        if not lst[i] in arr:
            arr.append(lst[i])
            dfs(arr, i+1)
            arr.pop()


N, M = map(int, input().split())
lst = [i for i in range(1, N+1)]
dfs([], 0)
```



#### 문제번호 : 15651

 ##### 제목 : N과 M(3)

- 문제 : 자연수 N과 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.

  - 1부터 N까지 자연수 중에서 M개를 고른 수열
  - 같은 수를 여러 번 골라도 된다.

- 입력 : 첫째 줄에 자연수 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 7)

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력

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
n,m= map(int,input().split())
 
s = []
 
def dfs():
    if len(s)==m:
        print(' '.join(map(str,s)))
        return
    
    for i in range(1,n+1):
        s.append(i)
        dfs()
        s.pop()
dfs()
```



#### 문제번호 : 15652

 ##### 제목 : N과 M(4)

- 문제 : 자연수 N과 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.

  - 1부터 N까지 자연수 중에서 M개를 고른 수열
  - 같은 수를 여러 번 골라도 된다.
  - 고른 수열은 비내림차순이어야 한다.
    - 길이가 K인 수열 A가 A1 ≤ A2 ≤ ... ≤ AK-1 ≤ AK를 만족하면, 비내림차순이라고 한다.

- 입력 : 첫째 줄에 자연수 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력

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
n,m= map(int,input().split())
 
s = []
 
def dfs(start):
    if len(s)==m:
        print(' '.join(map(str,s)))
        return
    
    for i in range(start,n+1):
        s.append(i)
        dfs(i)
        s.pop()
dfs(1)
```



#### 문제번호 : 15654

 ##### 제목 : N과 M(5)

- 문제 : N개의 자연수와 자연수 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오. N개의 자연수는 모두 다른 수이다.

  - N개의 자연수 중에서 M개를 고른 수열

- 입력 : 첫째 줄에 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)

  둘째 줄에 N개의 수가 주어진다. 입력으로 주어지는 수는 10,000보다 작거나 같은 자연수이다.

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력

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
input = sys.stdin.readline

n,m = map(int,input().split())
nums = [int(x) for x in input().split()]
nums.sort()
s=[]
def dfs(d):
    if d == m:
        print(' '.join(map(str,s)))
        return
    for i in range(n):
        if nums[i] in s:
            continue
        s.append(nums[i])
        dfs(d + 1)
        s.pop()
dfs(0)
```



#### 문제번호 : 15655

 ##### 제목 : N과 M(6)

- 문제 : N개의 자연수와 자연수 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오. N개의 자연수는 모두 다른 수이다.

  - N개의 자연수 중에서 M개를 고른 수열
  - 고른 수열은 오름차순이어야 한다.

- 입력 : 첫째 줄에 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)

  둘째 줄에 N개의 수가 주어진다. 입력으로 주어지는 수는 10,000보다 작거나 같은 자연수이다.

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력

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
input = sys.stdin.readline
n,m = map(int,input().split())
arr = sorted(list(map(int,input().split())))
s=[]
def dfs(idx, d):
    if d == m:
        print(' '.join(map(str, s)))
        return
    for i in range(idx, n):
        idx += 1
        s.append(arr[i])
        dfs(idx, d + 1)
        s.pop()
dfs(0,0)
```



#### 문제번호 : 15656

 ##### 제목 : N과 M(7)

- 문제 : N개의 자연수와 자연수 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오. N개의 자연수는 모두 다른 수이다.

  - N개의 자연수 중에서 M개를 고른 수열
  - 같은 수를 여러 번 골라도 된다.

- 입력 : 첫째 줄에 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 7)

  둘째 줄에 N개의 수가 주어진다. 입력으로 주어지는 수는 10,000보다 작거나 같은 자연수이다.

- 출력 : 한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

  수열은 사전 순으로 증가하는 순서로 출력해야 한다.

- 예제 입력

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
input = sys.stdin.readline
n,m = map(int,input().split())
arr = sorted(list(map(int,input().split())))
s=[]
def dfs(d):
    if d == m:
        print(' '.join(map(str, s)))
        return
    for i in range(n):
        s.append(arr[i])
        dfs(d + 1)
        s.pop()
dfs(0)
```

