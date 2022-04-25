# Git command tricks and guides


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


## .Gitignore
> **Note** : The files' name that has appeared in this list is going to `ignore` in the process work of git.

> **Note** :  Use `git-bash` to create this file.

```
touch : .gitignore
```

## Clone a repository
```
git clone [Link_gitrepo]
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
```
git add --all
git add .
git add -A
git status
git commit -m [Message]
git push origin [Name_branch]
```

## Commands basic with branch
```
git branch                      : Show current branch
git branch -a                   : Show list branch
git branch [Name_branch]        : Create a new branch
git branch -d [Name_branch]     : Del a branch
git push origin :[Name_branch]  : Update changes to server
git checkout [Name_branch]      : Switch another branch
git checkout -b [Name_branch]   : Create a new branch and jump to that
```

## Reset commit and Unreset commit
```
git log : Show the history commit
gitk    : Show the history commit but with UI.
```

> **Note** : From the git log command, we can get the ID for each commit.

```
git reset --hard [ID_commit] : Turn back commit that has ID specified and this command useful even the file has deleted by (Shift + Del)
git reflog                   : Show all commits that uesed to done even used git reset before.
```

> **Note** : From `git reflog` command we can get the ID for all commits.

```
git commit --amend -m [Message] : Commit modify on the latest commit
git reset HEAD@{n}              : Unreset with n can get by the command git reflog.
git push -f                     
```


## Merge and solve conflict git
**Merge**

```
git merge [Name_branch]
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