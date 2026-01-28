# GIT Commands

## Basics

Show current status.

```sh
git status
```

Add current directory to staging area

```sh
git add .
```

Make a commit with a message.

```sh
git commit -m "<commit comment>"
```

Update remote brach with local commited changes on current branch.

```sh
git push
```

Update local status with remote changes from server on current branch.

```sh
git pull
```

## Info

### General

Get GIT version.

```sh
git --version
```

### Work status

Show current status.

```sh
git status
```

Show last commit changes.

```sh
git show
```

Show commit changes from specific commit.

```sh
git show <commit hash>
```

Show commit changes from specific commit.

```sh
git show --name-status <commit hash>
```

Show commit changes from specific commit and for specific path.

```sh
git show --name-status <commit hash> -- <path>
```

### History

Show current branch history.

```sh
git log
```

```sh
git log --stat
```

```sh
git log --all --graph --decorate --oneline
```

```sh
git log -- <path>
```

```sh
git log -p -- <path>
```

```sh
git reflog --no-abbrev
```

To search the commit log (across all branches) for the given text:

```sh
git log --all --grep='Build 0051'
```

To do so while ignoring case in the grep search:

```sh
git log --all -i --grep='Build 0051'
```

To search the actual content of commits through a repo's history, use:

```sh
git grep 'Build 0051' $(git rev-list --all)
```

To show all instances of the given text, the containing file name, and the commit sha1.\
And to do this while ignoring case, use:

```sh
git grep -i 'Build 0051' $(git rev-list --all)
```

> Note: that this searches the entire content of the commit at each stage, and not just the diff changes. To search just the diff changes, use one of the following:

```sh
git log -S[searchTerm]
git log -G[searchTerm]
```

Finally, as a last resort in case your commit is dangling and not connected to history at all, you can search the reflog itself with the -g flag (short for --walk-reflogs):

```sh
git log -g --grep='Build 0051'
```

### Branches

List local branches

```sh
git branch
```

List local merged branches

```sh
git branch --merged
```

List all branches, including remote branches

```sh
git branch -a
```

List local branches that match a pattern

```sh
git branch | grep <pattern>
```

### Remote

List repositories.

```sh
git remote
```

List repositories (verbose) URLs.

```sh
git remote -v
```

### Compare

```sh
git diff
```

```sh
git diff --name-status <branch name>
```

```sh
git diff <branch name> -- <path>
```

## Repository actions

### Initialization

Clone a project from a repository

```sh
git clone <repository route>
```

Initialize a new repository

```sh
git init
```

### Config

```bash
git remote add <repository name> <URL>
```

### Remote

#### Upload

```sh
git push --set-upstream <repository name> <branch name>
```

```sh
git push
```

#### Download

```sh
git pull
```

```sh
git pull <repository name> <branch name>
```

```sh
git fetch
```

```sh
git fetch --prune
```

```sh
git pull origin master --allow-unrelated-histories
```

## Branches actions

```sh
git branch <branch name>
```

```sh
git checkout <branch name>
```

```sh
git checkout -b <branch name>
```

```sh
git branch -D <branch name>
```

```sh
git branch -D $(git branch | grep <pattern>)
```

```sh
git merge <repository name> <branch name> --allow-unrelated-histories
```

## Config

### Global

```sh
git config --global user.email "<user@email.com>"
```

```sh
git config --global user.name "<User Name>"
```

### Local

```sh
git config --local user.email "<user@email.com>"
```

```sh
git config --local user.name "<User Name>"
```

## Advance

```sh
git commit --amend
```

```sh
git reset HEAD
```

```sh
git update-index <file_name>
```

```sh
git update-index --skip-worktree <file_name>
```

```sh
git update-index --no-skip-worktree <file_name>
```

```sh
git ls-files -v | grep '^S'
```

## Stash

```sh
git stash save --keep-index --include-untracked
```

```sh
git stash drop
```

```sh
git restore <path/to/file/to/revert>
```

```sh
git checkout -- <path/to/file/to/revert>
```
