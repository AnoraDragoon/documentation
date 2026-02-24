# Mac OS commands

## Helpful commands

Open Chromium to deploy Angular migration on local

```sh
open -n -a /Applications/Chromium.app --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security
```

Securely transferring files and directories between two locations over an SSH (Secure Shell) connection.

```sh
# scp [options] <source> <destination>
scp root@remote.domain.server.url:/data/docker-compose.yml .
```

Flags

- i: It is used to specify the ssh private key file.

    ```sh
    scp -i ~/.ssh/id_rsa script.js root@remote.domain.server.url:/usr/admin/workspace
    ```

---

## Command discovery

### which

Locate the executable file associated with a command by searching the `PATH`.

#### Syntax

```sh
which <command>
which -a <command>
```

#### Examples

```sh
# Find location of a command
which python
# Output: /usr/bin/python

# Find all occurrences in PATH
which -a python
# Output: 
# /usr/bin/python
# /usr/local/bin/python

# Check if command exists
which git
# Output: /usr/bin/git (if installed)
# Output: (nothing) if not found

# Multiple commands
which node npm git
```

#### Notes

- Returns the first match found in `PATH`
- Use `-a` flag to see all matches
- Exit code 0 if found, 1 if not found (useful for scripts)

#### Common use in scripts

```sh
if which python3 > /dev/null 2>&1; then
    echo "Python 3 is installed"
else
    echo "Python 3 not found"
fi
```
