# GIT Commands

## Basics

Show current status.
```
git status
```

Add current directory to staging area
```
git add .
```

Make a commit with a message.
```
git commit -m "<commit comment>"
```

Update remote brach with local commited changes on current branch.
```
git push
```

Update local status with remote changes from server on current branch.
```
git pull
```

## Info

### General

Get GIT version.
```
git --version
```

### Work status

Show current status.
```
git status
```

Show last commit changes.
```
git show
```

Show commit changes from specific commit.
```
git show <commit hash>
```

Show commit changes from specific commit.
```
git show --name-status <commit hash>
```

Show commit changes from specific commit and for specific path.
```
git show --name-status <commit hash> -- <path>
```

### History

Show current branch history.
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
git reflog --no-abbrev
```

To search the commit log (across all branches) for the given text:
```
git log --all --grep='Build 0051'
```

To do so while ignoring case in the grep search:
```
git log --all -i --grep='Build 0051'
```

To search the actual content of commits through a repo's history, use:
```
git grep 'Build 0051' $(git rev-list --all)
```

To show all instances of the given text, the containing file name, and the commit sha1.
<br>
And to do this while ignoring case, use:
```
git grep -i 'Build 0051' $(git rev-list --all)
```

> Note: that this searches the entire content of the commit at each stage, and not just the diff changes. To search just the diff changes, use one of the following:

```
git log -S[searchTerm]
git log -G[searchTerm]
```

Finally, as a last resort in case your commit is dangling and not connected to history at all, you can search the reflog itself with the -g flag (short for --walk-reflogs):
```
git log -g --grep='Build 0051'
```

### Branches

List local branches
```
git branch
```

List local merged branches
```
git branch --merged
```

List all branches, including remote branches
```
git branch -a
```

List local branches that match a pattern
```
git branch | grep <pattern>
```

### Remote

List repositories.
```
git remote
```

List repositories (verbose) URLs.
```
git remote -v
```

### Compare
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

### Initialization

Clone a project from a repository
```
git clone <repository route>
```

Initialize a new repository
```
git init
```

### Config

```
git remote add <repository name> <URL>
```

### Remote

#### Upload

```
git push --set-upstream <repository name> <branch name>
```
```
git push
```

#### Download

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
git ls-files -v | grep '^S'
```

## Stash

```
git stash save --keep-index --include-untracked
```
```
git stash drop
```
```
git restore <path/to/file/to/revert>
```
```
git checkout -- <path/to/file/to/revert>
```
