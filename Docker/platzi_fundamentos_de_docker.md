# Fundamentos de Docker

## De mi imagen a un contenedor usando CLI (8/19)

Next command execute a docker image as a container: `docker run <image_ref>`
<br>
There are some options:
-  `-it` : Show container outputs.
-  `--rm` : Remove container if exists.
-  `-p` : Allows to specify ports.
-  `-d` : Execute container as a daemon.
-  `--name` : Allows to specify container name.


## Inspección y capas de un contenedor

```sh
docker inspect <container_ref>
```

> **Note:** `<container_ref>` could be "container_ID", "container_name".
