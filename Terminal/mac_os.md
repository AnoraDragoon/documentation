# Mac OS commands

## Helpful commands

Open Chromium to deploy Angular migration on local
```sh
open -n -a /Applications/Chromium.app --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security
```

Securely transferring files and directories between two locations over an SSH (Secure Shell) connection.
```sh
# scp [options] <source> <destination>
scp root@horizon-app.tt085int.dev.sicpa.io:/data/docker-compose.yml .
```