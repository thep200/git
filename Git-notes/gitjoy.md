# Git command tips and guides

## Setup
### Setup username and email
```
git config --global user.name [Your_Name]
git config user.name   									: Show username
git config --global user.email  [Your Email Git]
git config user.email  									: Show email address
```

### Thay đổi editor default 
> Editor mặc định của git là command vim, được sử dụng ví dụ như lúc ta sửa message trong `git commit --amend`.
```
git config --global core.editor "code --wait"		: Thay đổi editor
git config --global -e 								: Sử dụng editor
```

## Repository
### Clone
```
git clone [link_repository]		: Clone một repo về local
```

### Link folder với một repository
> **Notes** : Link remote từ một folder với một repository trống.
```
git init 													: Khởi tạo .git file
git remote add origin [link_repository]						: Link remote của folder với repository trống
git fetch --all | git fetch | git pull | git pull --all		: Cập nhật tất cả các branch
git pull origin [name_branch]								: Đẩy nhật dữ liệu vào local
git add . | git add --all | git add -A
git commit -m "message"
git push origin [name_branch]
```
> Sử dụng `git push --set-upstream origin [name_branch]` để set stream với một branch lần sau chỉ cần dùng `git push` trên branch đó.

### Thực hiện pull, fetch dữ liệu từ một repository về một folder trống trên local
> **Note** : tên của folder không cần thiết phải cùng tên với repository.
```
git init
git remote add origin [link_repository]
git fetch --all | git fetch | git pull | git pull --all
git branch -a | -r 											: Kiểm tra tên các branch có trong remote.
git pull origin [name_branch]
```

### Tạo liên kết với một folder đã có sẵn
> **Note** : The folder that link must to has the same name as a repository.
```
git init 
git remote add origin [Link_repo]   : Link to the repository
git remote -v                       : Check the link
git fetch
git checkout [Name_branch]
git pull                            : synchronized with server
```

## Git remote
> **Note** : Mặc định khi ta tạo một repo thì nó sẽ đặt tên remote là origin.
```
git remote -v 		: Kiểm tra remote
git remote rename origin [New_name] 	: Rename một remote
git remote add [New_name] [Link_repo] 	: Thêm mới một remote *new_name thường là origin*, sau khi có remote rồi thì sử dụng `git fetch` để lấy dữ liệu về
```

## Pull & fetch
```
git pull			: Cập nhập thay đổi từ remote và merge ngay với local.
git fetch			: Cập nhập thay đổi từ remote và giữ nguyên không merge ngay với local *một phiên bản an toàn hơn của `git pull`* phải merge thủ công. 
```

## Add
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

### Git commit amend
> **Note** Git sẽ show editor để ta sửa message (mặc định là vim của git)
> - :q : Để thoát editor
> - :w : Để lưu file
> - :wq : Để lưu lại và thoát editor
```
git commit --amend -m [Message]		: Ghi đè lên Commit cuối cùng (git sẽ không show editor khi dùng lệnh này ---> nên dùng)
git commit --amend					: (git sẽ show editor khi dùng lệnh này =)))
git push -f 						: Push lên server khi dùng "git commit --amend" 
```

### Show commits
```
git log : Show tất cả các commit (Enter để xem chi tiết và gõ "q" để quay lại)
gitk    : Show tất cả commit nhưng có UI
```

### Back to commit (reset)
```
git reflog                   									: Show tất cả các commit đã từng thực hiện **(tất cả)**
git reset --hard | --soft | --keep | --mixed [ID_commit] 		: Back lại commit có id là [ID_commit] *id commit được lấy trong* `git reflog`
git push origin [Name_branch] -f 								: Push lên server khi dùng "git reset --hard"
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
```

### Rename branch
```
git branch -m [new_name] [old_name]			: Rename branch khi đang ở một branch khác
git branch -m [new_name]					: Rename branch hiện tại khi đang ở branch hiện tại.
git push origin [new_name]					: Push lên server khi rename branch
git push origin :[old_name]					: Xóa branch cũ bị rename trên server
```

### Del branch
> **Note** : Phải switch branch trước khi muốn xóa branch hiện tại.
```
git branch -d [Name_branch]     : Xóa một branch trên local
git push origin :[Name_branch]  : Update thay đổi lên server
```

## Merge & rebase
### Merge
```
git merge [name_branch]		: Merge branch với branch hiện tại (sẽ không update các thay đổi của branch hiện tại vào branch mới)
```

### Rebase
```
git rebase [name_branch]
```

## Squash
> Gộp các commit chỉ định thành 1 commit *Sạch commit khi thực hiện pr (pull request)*
```
Step1: git log 	: Show tất cả các commit (Enter để xem chi tiết và gõ "q" để quay lại)
Step2: git rebase --interactive (or -i) HEAD~n : Gộp n commit mới nhất thành 1 commit mới (commit thứ n cũ nhất sẽ được squash)
Step3: *git sẽ show editor để pick những cái nào mình sẽ định gộp gõ *s* vào trước Id commit để đánh dấu cái cần gộp*
Step4: *git sẽ show tiếp một editor nữa để sửa message cho commit mới gộp (đặt tên cho commit mới gộp)*
Step5: git push origin [Name_branch] -f : Push lên server
Step6: git log	: Để kiểm tra lại
```
> **Notes** : chú ý một só điểm sau khi thực hiện squash:
> -	Thứ tự của commit ở `git log` từ trên xuống là mới nhất đến cũ nhất.
> - Thứ tự của commit ở Editor từ trên xuống là cũ nhất đến mới nhất.
> - Git chỉ thực hiện squash gộp các commit mới nhất vào commit cũ nhất.
> - Cũ nhất là commit thứ n cũ nhất.

## Git stash
> Sử dụng khi ta đột ngột cần quay lại làm một task cũ đã commited trước đó và phải bỏ dở task hiện tại. `git stach` lưu công việc còn làm dở và stash để apply lại sau.
```
git stash save 					: Lưu công việc đang làm dở vào stask
git stash list 					: Show danh sách các stack đã lưu
git stash show -p 				: Xem chi tiết thay đổi
git stash apply stash@{id} 		: Apply stack đã lưu vào code hiện tại
```
> **Note** : Để quay lại làm một task cũ ta có thể kết hợp sử dụng `git reset`.

## Git cherry-pick
> Sử dụng khi chúng ta cần pick một vài commit cụ thể vào branch hiện tại.  `git cherry-pick` command. 
> - `git cherry-pick (--continue | --skip | --abort | --quit)`

> - Id commit được lấy từ `git log` hoặc `git reflog` từ branch chứa commit mình muốn pick tới branch hiện tại.
> - Trên windows nên thêm *^^* khi muốn pick các commit liền kề, và id commit nên lấy trong `git log`
> Trên branch ***master**
```
git cherry-pick [id_commit]                     : Pick commit từ id
git cherry-pick [Name_branch]~n                 : n mới nhất từ branch
git cherry-pick ID_commit(a)^...ID_commit(e)     : Pick các commit liền kề nhau (a, b, c, d,..., e) ---> Bỏ ^ nếu không muốn lấy commit a.
```

## Thực hiện commit trên 2 branch cùng một thời điểm
> Ví dụ thực hiện
> Trên branch ***[Name_branch]**
```
*Một commit được tạo mới*
git checkout [Name_branch]   	: Chuyển sang branch mới
```
> Trên branch ***master**
```
git cherry-pick [Name_branch]         : Pick commit mới nhất trên master và branch hiện tại
git push origin master
```
