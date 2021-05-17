# This file contains the commands git popular and advance

Một số tip và commands git hay sử dụng.


## Thiết lập và kiểm tra username và gmail.

**Thiết lập**
- git config --global user.name [Your_Name]
- git config --global user.email  [Your Email Git]

**Kiểm tra**
- git config user.name   : Kiểm tra user_name đang sử dụng
- git config user.email   : Kiểm tra email đang sử dụng

## .Gitignore

> **Note** : Các file có tên trong danh sách này sẽ bị **lờ** qua khi thao tác với repo

> **Note** :  Sử dụng **git-bash** để tạo file này

- touch : .gitignore



## Clone một repo về local

- git clone [Link_gitrepo]

## Liên kết một Folder có sẵn với một Repo
> **Note** : folder có sẵn phải cùng tên với repo
- git init 
- git remote add origin [Link_repo] 
- git remote -v 
- git fetch
- git checkout [Name_branch]
- git pull : Đồng bộ ở local với server

## Push file
- git add --all
- git add .
- git add -A
- git status
- git commit -m [Message]
- git push origin [Name_branch]

## Các thao tác cơ bản với branch
- git branch : Xem branch hiện tại
- git branch -a : Show danh sách các branch hiện có
- git branch [Name_branch] : Tạo một branch mới
- git branch -d [Name_branch] : Xóa branch
- git push origin :[Name_branch] : Cập nhật việc xóa branch đó trên server
- git checkout [Name_branch] : Chuyển đến một branch khác
- git checkout -b [Name_branch] : Tạo một branch mới và nhảy sang branch đó luôn

## Reset commit và Unreset commit
- git log : Xem lại lịch sử commit.
- gitk : Xem lại lịch sử commit với giao diện đồ họa.

> **Note** : từ lệnh git log ta có thể xem cái ID của từng commit.

- git reset --hard [ID_commit] : quay lại commit có ID tương ứng, có tác với cả với **Shift + del**.
- git reflog : Xem lại tất cả các commit từng thực hiên ngay cả khi đã dùng **git reset**.

> **Note** : từ câu lệnh **git reflog** ta có thể lấy được tất cả các ID commit.

- git commit --amend -m [Message] : Thực hiện ghi đè lên commit cuối cùng.
- git reset HEAD@{n} : Unreset một reset trước đó **n có thể tìm thấy ở câu lệnh git reflog**
- git push -f : Lưu các thay đổi lên server

## Git cherry-pick

> **Note** : Đôi lúc chúng ta chỉ muốn lấy **một** hoặc **một vài** commit ở branch phụ vào branch chính thì đó là lúc chúng ta sử dụng câu lệnh **git cherry-pick**.

***master**

- git cherry-pick [id_commit] : Lấy commit có id chỉ định vào branch chính
- git cherry-pick [Name_branch]~n : **n** là số thứ tự commit
- git cherry-pick [ID_commit(a) ... ID_commit(b)] : Lấy các commit có ID liền nhau từ **a đến b**

## Thực hiện commit trên 2 branch cùng một lúc

***master**
```
- git commit -m [Message] 
- git push
- git checkout [Name_branch]
```

```python
[i for i in range(10)]
```
***[Name_branch]**

- git cherry-pick master : Câu lệnh này sẽ lấy commit cuối cùng của **master** để add. 
- git push origin [Name_branch]
