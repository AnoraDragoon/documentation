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