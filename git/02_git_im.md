# Git Intermediate

git의 중급과정



### commit 메시지 바꾸기

직전 커밋만 바꿀 수 있음

```
$ git commit --amend
# VIM 화면 등장 => 메시지 수정 후 :wq 하면 커밋 메시지 수정
```



## .gitignore

git이 관리하길 원치 않는 파일 / 폴더들을 정리한 파일

https://www.toptal.com/developers/gitignore로 접속하여 원하는 내용을 적고, `.gitignore` 파일에 복사(`ctrl`+`a` => `ctrl` +` c`), 붙여넣기

한개의 repo당 1개의 .gitignore 파일과 1개의 README 파일 필요!

## Local Branching

브랜치를 만들게(따게)되면, 현재 브랜치의 모든 상황을 복사하여, 평행세계를 만든다.

*주의!	 브랜치를 가지로 이해하면 X,

​			 맨 마지막 커밋을 가리키는 거라고 생각 O



## create branch

```
#브랜치 생성 (폴더위치 신경 안써도 됨)
$ git branch <new-branch-name>

#브랜치 목록 확인
$ git branch

#브랜치 이동
$ git switch <branch-name>

#브랜치 병합
$ git merge <branch-name>
master 브랜치는 실험적이면 X, 안정적이어야 함!
추가로 만든 브랜치로 실험을 하고, 성공하면 master 브랜치를 움직이면 되는데 merge로 병합하기!

# 브랜치 생성후 이동 
$ git switch -c <new_branch_name>
```

### delete branch

```
# merge 완료된 브랜치 삭제
$ git branch -d <branch_name>

# merge 미완료된 브랜치 강제 삭제
$ git branch -D <branch_name>
```



### merge(두개의 브랜치를 병합)

1. Fast forwarding(꽃길)

   혼자 브랜치 사용하여 작업할 때 대부분의 경우

   ```
   (master)
   $ git branch aaa
   $ git switch aaa
   
   (aaa)
   $
   #... 내용 수정...
   
   (aaa)
   $ git add .
   $ git commit -m 'aaa'
   $ git switch master
   
   (master)
   $ git merge aaa
   ```

   

2. Conflict - Auto merge(충돌 & 자동병합)

   다른사람들과 작업시 충돌이 발생함!

   충돌시,  어떤 것과도 연결되지 않은 새로운 커밋을 만들어 최종본을 만드려면 master가 가리키게 해야함. 그래서 master와 새 커밋을 연결해주면 됨. 자동으로 커밋이 작성되면서 병합됨.=> git merge <다른 브랜치이름>

   1. `a` 브랜치에서 커밋

   2. `master`브랜치에서 커밋

   3. `(master) $ git merge a`

   4. 운이 좋아 두 커밋이 겹치지 않음

   5. 자동으로 merge 완료

      

3. Conflict - Manual merge(충돌 & 수동병합)

    1. `a` 브랜치에서 커밋

    2. `master`브랜치에서 커밋

    3. `(master) $ git merge a`

    4. 두 커밋이 겹치는 구간이 있음

    5. 수동으로 충돌 해결 후 저장

    6. 직접 `git add . `,`git commit -m 'message'`

       

## Remote Branching



## 협업 Collaborating

1. 조장이 리모트  리포생성
   1. `README.md`,`.gitignore`생성하며 리포 생성
   2. settings > manage access 에서 팀원 추가
2. 모든 팀원이 리모트 리포 clone
3. 브랜치 생성 후 각자 개발 진행 
4. 개발 진행 완료후 **해당 브랜치 내용**을 remote로 push(`git push origin <branch name>`)
5. 코드 작성자가 remote에서 PullRequest(MergeRequest)=>결재 요청을 진행
6. 팀의 합의에 따라 변경내용을 master로 merge
   1. 충돌(conflict)이 난다면, 논의후 `Resolve conflicts`로 리모트에서 직접 수정
   2. `commit merge`로 확정
7. 팀원들은 local master 에서 `git pull origin master`를 통해 모든 변경 내용 PULL
8. 3번으로 돌아가 반복진행

