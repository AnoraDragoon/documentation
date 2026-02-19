# Documetación del Tutorial

## Referencia del vide

<https://youtu.be/CV_Uf3Dq-EU>

## Notas

### Comandos más comunes de Docker

#### Run an Image

```bash
docker run nginx:1.25
```

The tag is optional and default tag is `latest`.

**Example with environment variables:**

```bash
# Run PostgreSQL with password
docker run -e POSTGRES_PASSWORD=mySecretPass123 postgres:15
```

**Parameters explained:**

- `-e POSTGRES_PASSWORD=mySecretPass123` - Sets environment variable for PostgreSQL password
- `postgres:15` - Uses PostgreSQL version 15 image

#### Download Image

```bash
# Download nginx image
docker pull nginx:1.25

# Download latest version
docker pull redis
```

#### Get Image List

```bash
# List all images
docker images

# Show only first few results
docker images | head
```

**Example output:**

```
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
nginx         1.25      a6bd71f48f68   2 weeks ago    187MB
postgres      15        9f3ec01f884d   3 weeks ago    412MB
redis         latest    7614ae9453d1   4 weeks ago    117MB
```

#### Get Container List

```bash
# Show only running containers
docker ps

# Show all containers (including stopped)
docker ps -a
```

**Example output:**

```
CONTAINER ID   IMAGE          STATUS         PORTS                    NAMES
f3a52c1b8d9e   nginx:1.25     Up 2 hours     0.0.0.0:8080->80/tcp     web-server
a1b2c3d4e5f6   postgres:15    Up 30 minutes  0.0.0.0:5432->5432/tcp   my-database
```

#### Check Logs

```bash
# View logs by container ID
docker logs f3a52c1b8d9e

# View logs by container name
docker logs web-server

# Follow logs in real-time
docker logs -f web-server
```

#### Execute Command Inside Container

```bash
# Open shell in container using container ID
docker exec -it f3a52c1b8d9e sh

# Open bash in container using name
docker exec -it web-server bash

# Run single command
docker exec web-server ls -la /usr/share/nginx/html
```

**Parameters explained:**

- `-it` - Interactive terminal mode
- `sh` or `bash` - Opens a shell inside the container

#### Stop Container

```bash
# Stop single container
docker stop web-server

# Stop multiple containers at once
docker stop web-server my-database redis-cache
```

#### Start Container

```bash
# Start previously stopped container
docker start web-server
```

#### Run Image in Background

```bash
# Run nginx in detached mode (background)
docker run -d nginx:1.25

# Run with name
docker run -d --name my-web-server nginx:1.25
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

#### Estructura del Dockerfile

**Dockerfile example:**

```dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu:18.04
COPY . /app
RUN make /app
CMD python /app/app.py
```

**Instructions explained:**

- `FROM ubuntu:18.04` - Creates a layer from the ubuntu:18.04 Docker image
- `COPY . /app` - Adds files from your Docker client's current directory
- `RUN make /app` - Builds your application with make
- `CMD python /app/app.py` - Specifies what command to run within the container
- `WORKDIR /app` - Define el directorio de trabajo. Define la ruta declarada como ruta base relativa en el contenedor

**Real-world Node.js example:**

```dockerfile
# syntax=docker/dockerfile:1
FROM node:18-alpine
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "server.js"]
```

### Construyendo una imagen a partir de un Dockerfile (docker build)

```bash
# Build image with tag
docker build -t my-app:1.0 .

# Build with custom Dockerfile name
docker build -t my-app:latest -f Dockerfile.prod .
```

**Parameters explained:**

- `-t my-app:1.0` - Tags the image with name "my-app" and version "1.0"
- `.` - Build context (current directory)

### Usando puertos en Docker

```bash
# Run nginx mapping port 8080 on host to port 80 in container
docker run -d -p 8080:80 nginx:1.25

# Run multiple port mappings
docker run -d -p 8080:80 -p 8443:443 nginx:1.25

# Run with name
docker run -d --name web-server -p 8080:80 nginx:1.25
```

**Parameters explained:**

- `-d` - Run in detached mode (background)
- `-p 8080:80` - Maps localhost port 8080 to container port 80
- Access the server at: `http://localhost:8080`

### Volumenes en Docker

Run an image using a volume (`-v`). A volume is a bidirectional link between your local computer and the container. Useful to keep data after container destruction.

```bash
# Run nginx with volume mount
docker run -d \
  -v /home/user/website:/usr/share/nginx/html \
  -p 8080:80 \
  nginx:1.25

# Run PostgreSQL with persistent data
docker run -d \
  --name my-postgres \
  -v /var/lib/postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  -e POSTGRES_PASSWORD=mySecretPass123 \
  postgres:15

# Use Docker named volume
docker run -d \
  -v my-data-volume:/data \
  -p 8080:80 \
  my-app:1.0
```

**Parameters explained:**

- `-v /home/user/website:/usr/share/nginx/html` - Mounts local directory into container
  - Left side (`/home/user/website`) - Your local directory
  - Right side (`/usr/share/nginx/html`) - Container directory
- `-v my-data-volume:/data` - Uses Docker managed volume (not a local path)

### Docker build and docker push

To push image to docker hub, it is important to tag the image correctly.
The image tag should contain namespace or user / image name : tag or version.
Image tag should be unique on docker hub.

```bash
# Tag existing image for Docker Hub
docker tag my-app:1.0 username/my-app:1.0

# Tag as latest version
docker tag my-app:1.0 username/my-app:latest

# Push to Docker Hub
docker push username/my-app:1.0
docker push username/my-app:latest
```

**Example workflow:**

```bash
# Build your image
docker build -t my-node-app:1.0 .

# Tag for Docker Hub (replace 'johndoe' with your username)
docker tag my-node-app:1.0 johndoe/my-node-app:1.0
docker tag my-node-app:1.0 johndoe/my-node-app:latest

# Login to Docker Hub
docker login

# Push images
docker push johndoe/my-node-app:1.0
docker push johndoe/my-node-app:latest
```

### Multi Container

#### Create Docker Network

```bash
# Create custom network
docker network create todo-network

# List networks
docker network ls
```

#### Run Image in Docker Network

```bash
# Run MySQL in custom network
docker run -d \
  --name mysql-db \
  --network todo-network \
  --network-alias mysql \
  -v todo-mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=secret \
  -e MYSQL_DATABASE=todos \
  mysql:5.7

# Run application container in same network
docker run -d \
  --name todo-app \
  --network todo-network \
  -p 3000:3000 \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  my-todo-app:1.0
```

**Parameters explained:**

- `--network todo-network` - Connects container to custom network
- `--network-alias mysql` - Gives container a DNS name within the network
- Containers in same network can communicate using their names/aliases

### Docker Compose

The only requirement is to have docker compose installed.

#### Docker Compose File

```yaml
# docker-compose.yml
version: '3.7'

services:
  app:
    image: johndoe/getting-started:v2
    ports:
      - 3000:3000
    environment:
      MYSQL_HOST: mysql
      MYSQL_USER: root
      MYSQL_PASSWORD: secret
      MYSQL_DB: todos
    depends_on:
      - mysql

  mysql:
    image: mysql:8.0.13
    environment:
      MYSQL_DATABASE: todos
      MYSQL_ROOT_PASSWORD: secret
    volumes:
      - mysql-data:/var/lib/mysql

volumes:
  mysql-data:
```

**Equivalent docker run commands:**

```bash
# Application container
docker run -d \
  --name app \
  -p 3000:3000 \
  --network app-network \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  johndoe/getting-started:v2

# MySQL container
docker run -d \
  --name mysql \
  --network app-network \
  -e MYSQL_DATABASE=todos \
  -e MYSQL_ROOT_PASSWORD=secret \
  -v mysql-data:/var/lib/mysql \
  mysql:8.0.13
```

#### Run Docker Compose

```bash
# Start all services in background
docker-compose up -d

# View logs
docker-compose logs

# View logs for specific service
docker-compose logs app
docker-compose logs mysql

# Follow logs in real-time
docker-compose logs -f
```

#### Shutdown Docker Compose

```bash
# Stop and remove all containers
docker-compose down

# Stop, remove containers and volumes
docker-compose down -v
```

## Common Docker Patterns

### Full Stack Application Example

```bash
# Run full MERN stack with volumes and networks
docker network create mern-network

# MongoDB
docker run -d \
  --name mongodb \
  --network mern-network \
  -v mongo-data:/data/db \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=secret123 \
  mongo:6

# Node.js Backend
docker run -d \
  --name backend-api \
  --network mern-network \
  -p 5000:5000 \
  -e MONGODB_URI=mongodb://admin:secret123@mongodb:27017 \
  my-backend:1.0

# React Frontend
docker run -d \
  --name frontend \
  -p 3000:80 \
  my-frontend:1.0
```

### Development Environment Example

```yaml
# docker-compose.dev.yml
version: '3.7'

services:
  web:
    build: .
    ports:
      - 3000:3000
    volumes:
      - .:/app
      - /app/node_modules
    environment:
      - NODE_ENV=development
    command: npm run dev

  database:
    image: postgres:15
    ports:
      - 5432:5432
    environment:
      POSTGRES_DB: myapp_dev
      POSTGRES_USER: developer
      POSTGRES_PASSWORD: dev123
    volumes:
      - postgres-dev-data:/var/lib/postgresql/data

volumes:
  postgres-dev-data:
```

```bash
# Start development environment
docker-compose -f docker-compose.dev.yml up -d

# View logs
docker-compose -f docker-compose.dev.yml logs -f web
```
