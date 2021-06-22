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
$ git log --online
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

리모트 리포 내용을 그대로 복제

``` 
$ git clone <url> 
```







### 리모트에서 PULL하기

리모트에서 다운로드

