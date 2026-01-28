# Documetación del Tutorial

## Referencia del vide

<https://youtu.be/CV_Uf3Dq-EU>

## Notas

### Comandos más comunes de Docker

- Run an Image:

```sh
docker run image_name:tag
```

- The tag is optional and default tag is latest.
Example:

```sh
docker run -e POSTGRES_PASSWORD=password postgres
```

- Some times run command require extra params. In this case `-e` is to set environment vars.
- Download Image

```sh
docker pull image_name
```

- Get Image list

```sh
docker images
```

```sh
docker images | Head
```

- Get Container list (Only running)

```sh
docker ps
```

- List all container ()

```sh
docker ps -a
```

- Check logs

```sh
docker logs container_id_o_name
```

- Execute a command inside the container

```sh
docker exec -it container_id_o_name command
```

Example:

```sh
docker exec -it j1hg234j2hg34 sh
```

- Stop a container

```sh
docker stop container_id_o_name [...container_id_o_name]
```

- Start a container

```sh
docker start container_id_o_name
```

- Run an image on background

```sh
docker run -d container_id_o_name
```

### Escribiendo Dockerfile

- El nombre del archivo tiene que ser extrictamente: "Dockerfile" sin extensión.
- La imagen parte de una imagen base:
  - Se intenta instalar una imagen lo más cercana a lo que nosotros necesitamos, que incluya las dependencias, etc.
    - Reutilizar trabajo.
    - Evitar resolver problemas ya resueltos.
    - Reutilizar optimización y buenas prácticas.
    - Intentar utilizar imagenes oficiales.
- Las imagenes contienen en su tag pueden especificar varias varias cosas:
  - Versión y distribución de sistema operativo.
  - Versión y distribución de las dependencias.
- Es una buena práctica usar un tag especifico en lugar de latest: para utilizar la misma imagen a lo largo del tiempo.

- Estructura del Dockerfile
  - Dockerfile example:

    ```
    # syntax=docker/dockerfile:1
    FROM ubuntu:18.04
    COPY . /app
    RUN make /app
    CMD python /app/app.py
    ```

- ``FROM`` creates a layer from the ubuntu:18.04 Docker image.
- ``COPY`` adds files from your Docker client’s current directory.
- ``RUN`` builds your application with make.
- ``CMD`` specifies what command to run within the container.
- ``WORKDIR`` define el directorio de trabajo. Define la ruta declarada como ruta base relativa en el contenedor.
- ``CMD`` vs ``ENTRYPOINT``

### Construyendo una imagen a partir de un Dockerfile (docker build)

### Usando puertos en Docker

```sh
docker run -d -p <port_lh>:<port_cn> <image_id_o_name>
```

### Volumenes en Docker

- Run an image using a volume (-v).
  A volume is a bidirectional link between your local computer and the container. Useful to keep data after container destruction.

```sh
docker run -d -v <local_dir>:<container_dir> -p <port_lh>:<port_cn> <image_id_o_name>
```

### Docker build and docker push

To push image to docker hub, it is importan tag the image correctly.
The image tag should contain namespace or user / image name : tag or version.
Image tag should be unique on docker hub.

```sh
docker tag <image_id> <image_full_name_and_tag>
```

### Multi Container

- Create docker network

```sh
docker network create <network_name>
```

- Run image in docker network

```sh
docker run -d \
  --network <network_name> --network-alias mysql \
  -v todo-mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=todos \
  mysql:5.7
```

### Docker compose

The only requirement is to have docker compose installed.

- Docker compose file:

```yml
# file://docker-compose.yaml
version: '3.7'

services:
# docker run -dp 3000:3000 --network app-todo -e MYSQL_HOST=mysql -e MYSQL_USER=root -e MYSQL_PASSWORD=secret -e MYSQL_DB=todos
  app:
    image: anoradragoon/getting-started:v2
    ports:
      - 3000:3000
    environment:
      MYSQL_HOST:mysql 
      MYSQL_USER: root 
      MYSQL_PASSWORD: secret 
      MYSQL_DB: todos

# docker run --network app-todo --network-alias mysql -e MYSQL_DATABASE=todos -e MYSQL_ROOT_PASSWORD=secret -v ~/docker/mysql-data:/var/lib/mysql mysql:8.0.13
  mysql:
    image: mysql:8.0.13
    environment:
      MYSQL_DATABASE: todos
      MYSQL_ROOT_PASSWORD: secret
    volumes:
      - ~/docker/mysql-data:/var/lib/mysql
```

- Run docker-compose file:

```sh
docker-compose up -d
```

- Shutdown every container in docker-compose file

```sh
docker-compose down
```

## Legend

- container_id_o_name: It means container id or name could be used.
- image_id_o_name: It means image id or name could be used.
- port_lh: locahost port
- port_cn: container port
