# Git command tips and guides

## Setup git
### Thay đổi editor 
> Editor mặc định của git là command vim, được sử dụng ví dụ như lúc ta sửa message trong `git commit --amend`.
```
git config --global core.editor "code --wait"		: Thay đổi editor
git config --global -e 								: Sử dụng editor
```


## Setup and check username and email.
**Setup**

```
git config --global user.name [Your_Name]
git config --global user.email  [Your Email Git]
```

**Check**

```
git config user.name   : Show username
git config user.email  : Show email address
```

## Clone a repository
```
git clone [link_repository]		: Clone một repo về
git pull						: Pull bản mới nhất về
```

## Link a exists folder to the repository

> **Note** : The folder that link must to has the same name as a repository.

```
git init 
git remote add origin [Link_repo]   : Link to the repository
git remote -v                       : Check the link
git fetch
git checkout [Name_branch]
git pull                            : synchronized with server
```

## Push file
### Git add
```
git status						: Check trạng thái thay đổi các file trong folder
git add --all					: Add tất cả các file vào staging area
git add -A 						: Viết tắt của "git add --all"
git add .						: Add tất cả file tại thư mục hiện tại
git restore --staged .			: unadd các file trong thư mục đã chọn
```

### Git commit
```
git commit -m [Message]				: Thực hiện commit
git push origin [Name_branch]		: Push lên server (sau lần push đầu thì từ các lần sau có thể dùng "git push" cho ngắn gọn)
```

#### Git amend
> **Note** Git sẽ show editor để ta sửa message (mặc định là vim)
> Sử dụng 'a' để chuyển mode insert rồi sửa message
> Sử dụng 'Esc' đê thoát mode insert
> Sử dụng ':q' để thoát hoặc ':!q' để thoát ra và lưu lại
```
git commit --amend -m [Message]		: Ghi đè lên Commit cuối cùng (git sẽ không show editor khi dùng lệnh này ---> nên dùng)
git commit --amend					: (git sẽ show editor khi dùng lệnh này =)))
git push -f 						: Push lên server khi dùng "git commit --amend" 
```


## Branch
### Switch branch
```
git checkout [Name_branch]      : Chuyển sang branch mới
git switch [Name_branch]        : Chuyển sang branch mới
git branch                      : Show tên branch hiện tại
git branch -a                   : show list các branch
```

### Create branch
```
git branch [Name_branch]					: Tạo một branch mới
git checkout -b [Name_branch]				: Tạo và switch sang branch mới tạo
git branch -m [new_name] [old_name]			: Rename branch khi đang ở một branch khác
git branch -m [new_name]					: Rename branch hiện tại khi đang ở branch hiện tại.
```

### Del branch
```
git branch -d [Name_branch]     : Xóa một branch
git push origin :[Name_branch]  : Update thay đổi lên server
```



## Reset commit and Unreset commit
```
git log : Show tất cả các commit (Enter để xem chi tiết và gõ "q" để quay lại)
gitk    : Show tất cả commit nhưng có UI
```

> **Note** : From the git log command, we can get the ID for each commit.

```
git reset --hard [ID_commit] : Turn back commit that has ID specified and this command useful even the file has deleted by (Shift + Del)
git reflog                   : Show all commits that uesed to done even used git reset before.
```

> **Note** : From `git reflog` command we can get the ID for all commits.

```
git reset HEAD@{n}              : Unreset with n can get by the command git reflog.
git push -f                     
```


## Merge and solve conflict git
### Merge

```
git merge [name_branch]		: Merge branch với branch hiện tại (sẽ không update các thay đổi của branch hiện tại vào branch mới)
git rebase [name_branch]
```
**Solve conflict**

> **Note** : Edit file that requested
 
 ```
 git add .
 git push
 ```


## Git cherry-pick
> **Note** : Sometimes we need to add `one` or `some` commit from sub-branch to main-branch that time we can use the `git cherry-pick` command. 

***master**

```
git cherry-pick [id_commit]                     : Add commit that has ID specified to the branch master.
git cherry-pick [Name_branch]~n                 : n is numbers of commits
git cherry-pick [ID_commit(a) ... ID_commit(b)]
```


## Commit on two branch in the same time
***master**

```
git commit -m [Message] 
git push
git checkout [Name_branch]
```

***[Name_branch]**

```
git cherry-pick master         : This command 'll get the latest commit in master to add. 
git push origin [Name_branch]
```

