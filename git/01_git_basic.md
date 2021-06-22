# git basic

git의 기초를 배워요



## WARNING

1. Home 폴더(~)를 리포로 업그레이드 하지 않는다.

2.  리포 안에 리포를 만들지 않는다.(리포의 하위 폴더에서 `git init`  하지 않는다, 리포의 하위폴더로 리포인 파일 이동하는 것도 안된다)

   

### 저장소 초기화하기

```$ git init
$ git init
```



### 저장소를 일반 디렉토리로 되돌리기

```
$ rm -rf .git
```



### 파일 상태 확인

```
$ git status
```

- 빨간색으로 표시되는 파일은 commit에 포함되지 않음
- 초록색으로 표시되는 파일은 commit에 포함됨
- 변경사항이 없는 파일은 표시되지 않음



### STAGE에 올리기(staging)

특정 파일만 스테이지에 올리기

```
$ git add <file_name>
```

현재 위치의 모든 파일을 스테이지에 올리기

```
$ git add .
```



### commit을 통해 스냅샷 저장하기

```
$ git commit -m 'message'
```



### commit log 확인하기

```
$ git log
$ git log --oneline
```



### 스테이지에서 내리기

``` 
$ git restore --staged <file name>
```



### 마지막 commit의 모습으로 복구하기

``` 
$ git restore <file_name>
```



### commit 로그 확인하기

```
$ git log
$ git log --oneline
```



### 리모트 연결하기

```
$ git remote add <name> <URL>

#리모트 삭제하기
$ git remote remove <name>

#리모트 이름 바꾸기
$ git remote rename <old_name> <new_name>
```



### 리모트 PUSH하기

리모트에 업로드

``` 
$ git push <name> <branch>
```



### 리모트에서 최초 CLONE 받기

리모트 리포 내용을 그대로 복제 (환경이 바뀌고 최초에 처음에만 clone 으로 함! -Why? 리포안에 리포가 있으면 안되는데 clone 2번하면 리포안에 리포가 생성되기 때문에 )

``` 
$ git clone <url> 
```

참고) <url> - 깃허브 홈페이지에서 리포안에 코드 다운받는 곳에서 url 복사한 것 

### 리모트에서 PULL하기

리모트에서 다운로드

``` 
$ git pull <name> <branch>
ex) git pull origin master
```



### 강의장 <=> 집 공부 / 프로젝트 시나리오

> 앉을때 PULL , 일어설 때 PUSH
>
> Sit pull, Stand push

1. 집에서 기상

2. 강의장 도착

3. 공부/ TIL 정리

   ​	1. `commit`

4. 강의종료

5. 집도착
6. 복습
   1. (처음이라면) `clone`
   2. `pull`
   3. `commit`
7. 복습 끝
   1. `commit`
   2. `push`
8. 잠
9. 1번으로 이동



