# GIT Commands

## Basics
```
git status
```
```
git add .
```
```
git commit -m "<commit comment>"
```
```
git push
```
```
git pull
```

## Info
```
git --version
```
```
git status
```
```
git show
```
```
git show <commit hash>
```
```
git show --name-status <commit hash>
```
```
git show --name-status <commit hash> -- <path>
```
```
git log
```
```
git log --stat
```
```
git log --all --graph --decorate --oneline
```
```
git log -- <path>
```
```
git log -p -- <path>
```
```
git branch
```
```
git branch --merged
```
```
git branch -a
```
```
git branch | grep <pattern>
```
```
git reflog --no-abbrev
```
```
git remote
```
```
git remote -v
```

- Diff
```
git diff
```
```
git diff --name-status <branch name>
```
```
git diff <branch name> -- <path>
```

## Repository actions

- initialization
```
git clone <repository route>
```
```
git init
```
- config
```
git remote add <repository name> <URL>
```
- upload
```
git push --set-upstream <repository name> <branch name>
```
```
git push
```
- download
```
git pull
```
```
git pull <repository name> <branch name>
```
```
git fetch
```
```
git fetch --prune
```
```
git pull origin master --allow-unrelated-histories
```

## Branches actions

```
git branch <branch name>
```
```
git checkout <branch name>
```
```
git checkout -b <branch name>
```
```
git branch -D <branch name>
```
```
git branch -D $(git branch | grep <pattern>)
```
```
git merge <repository name> <branch name> --allow-unrelated-histories
```

## Config

### Global

```
git config --global user.email "<user@email.com>"
```
```
git config --global user.name "<User Name>"
```
### Local
```
git config --local user.email "<user@email.com>"
```
```
git config --local user.name "<User Name>"
```

## Advance
```
git commit --amend
```
```
git reset HEAD
```
```
git update-index <file_name>
```
```
git update-index --skip-worktree <file_name>
```
```
git update-index --no-skip-worktree <file_name>
```
```
git ls-files -v|grep '^S'
```