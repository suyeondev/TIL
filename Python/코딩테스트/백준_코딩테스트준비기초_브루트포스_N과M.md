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

