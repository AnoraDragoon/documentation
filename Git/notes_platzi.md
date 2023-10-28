# Curso Profesional de Git y GitHub

## Introducción

Le indicaremos a Git que queremos crear un nuevo repositorio para utilizar su sistema de control de versiones.
Solo debemos posicionarnos en la carpeta raíz de nuestro proyecto y ejecutar el comando:
```
git init
```

Recuerda que al ejecutar este comando (y de aquí en adelante) vamos a tener una nueva carpeta oculta llamada ``.git``.
<br>
Con toda la base de datos con cambios atómicos en nuestro proyecto.

Recuerda que Git está optimizado para trabajar en equipo, por lo tanto, debemos darle un poco de información sobre nosotros.
<br>
No debemos hacerlo todas las veces que ejecutamos un comando, basta con ejecutar solo una sola vez los siguientes comandos con tu información:

```sh
git config --global <user.email> # tu@email.com
```
```sh
git config --global <user.name> # Tu Nombre
```

Existen muchas otras configuraciones de Git que puedes encontrar ejecutando el comando
```
git config --list
```

(o solo git config para ver una explicación más detallada).

Si quieres ver los archivos ocultos de una carpeta puedes habilitar la opción de ``Vista > Mostrar u ocultar > Elementos ocultos`` (en Windows).
O ejecutar el comando: ``ls -a``.

## Comandos para iniciar tu repositorio con Git

Para inicializar el repositorio git y el staged.
```
git init
```

Enviar el archivo al staged.
```
git add <path>
```

Ver el estado, si se requiere agregar al starget o si se requiere commit.
```
git status
```

Para ver las posibles configuraciones.
```
git conf
```

Para ver la lista de configuraciones hechas.
```
git conf --list
```

Para mostrar las configuraciones y sus rutas.
```
git conf --list --show-origin
```

Para eliminar el archivo del staged(ram).
```
git rm --cached nombre_del_archivo.txt
```

Para eliminar del repositorio.
```
git rm nombre_del_archivo.txt
```

Si por algún motivo te equivocaste en el nombre o email que configuraste al principio, lo puedes modificar de la siguiente manera:
```sh
git config --global --replace-all <user.name> # Aquí va tu nombre modificado
```

O si lo deseas eliminar y añadir uno nuevo.
```sh
git config --global --unset-all <user.name>
```

Elimina el nombre del usuario.
```bash
git config --global --add <user.name> # Aquí va tu nombre
```

## Comandos para analizar cambios en GIT

Inicializar el repositorio.
```
git init
```

Agregar el archivo al repositorio.
```
git add <nombre_de_archivo.extensión>
```

Agregamos los cambios para el repositorio.
```sh
git commit -m “Mensaje”
```

Agregar los cambios de la carpeta en la que nos encontramos agregar todo.
```
git add
```

Visualizar cambios.
```
git status
```

Histórico de cambios con detalles.
```
git log <nombre_de_archivos.extensión>
```

Envía a otro repositorio remoto lo que estamos haciendo.
```
git push
```

Traer repositorio remoto.
```
git pull
```

## Commandos de basicos de terminal útiles

Listado de carpetas en donde me encuentro. Es decir, como emplear dir en windows.
```
ls
```

Ubicación actual.
```
pwd
```

Make directory nueva carpeta.
```
mkdir <dir-path>
```

Crear archivo vacío.
```
touch <archivo.extensión>
```

Muestra el contenido del archivo.
```
cat archivo.extensión
```

Historial de comandos utilizados durante esa sesión.
```
history
```

Eliminación de archivo.
```
rm <archivo.extensión>
```

Ayuda sobre el comando.
```
comando --help
```

Traer cambios realizados.
```
git checkout
```

Se utiliza para devolver el archivo que se tiene en ram. Cuando escribimos git add, lo devuelve a estado natural mientras está en staging.
```
git rm --cached <archivo.extensión>
```

Muestra la lista de configuración de git.
```
git config --list
```

Rutas de acceso a la configuración de git.
```
git config --list --show-origin
```

Muestra la historia del archivo.
```
git log archivo.extensión
```

## CONCEPTS

- Working directory
<br>
El working directory es una copia de una versión del proyecto. Estos archivos se sacan de la base de datos comprimida en el directorio de git y se colocan en el disco para que los puedas usar o modificar.

- Staging area
<br>
Es un área que almacena información acerca de lo que va a ir en tu próxima confirmación. A veces se le denomina índice (index).

- Git directory
<br>
.git : En el repository se almacenan los metadatos y la base de datos de los objetos para tu proyecto. Es la parte más importante de git (carpeta .git) y es lo que se copia cuando clonas un repositorio desde otra computadora.

## Volver en el tiempo en nuestro repositorio utilizando reset y checkout

### Git Reset

- Elimina los cambios hasta el staging area
```
git reset --soft [SHA 1]
```
- Elimina los cambios hasta el working area
```
git reset --mixed [SHA 1]
```
- Regresa hasta el commit del [SHA-1]
```
git reset --hard [SHA 1]
```

## Setting up SSH Key

- Mac:
```
pbcopy < ~/.ssh/id_rsa.pub
```
- Windows (Git Bash):
```
clip < ~/.ssh/id_rsa.pub
```
- Linux (Ubuntu):
```
cat ~/.ssh/id_rsa.pub
```

## Setting up remote URL

``git remote set-url <remote-name> <url-ssh-del-repositorio-en-github>``
```
git remote set-url origin git@github.com:AnoraDragoon/documentation.git
```

URL to config public ssh key in github
<br>
https://github.com/settings/keys


## Tags y versiones en Git y GitHub (23/43)

Crear un nuevo tag y asignarlo a un commit:
```
git tag -a nombre-del-tag id-del-commit
```
Borrar un tag en el repositorio local:
```
git tag -d nombre-del-tag.
```
Listar los tags de nuestro repositorio local:
```
git tag o git show-ref --tags.
```
Publicar un tag en el repositorio remoto:
```
git push origin --tags.
```
Borrar un tag del repositorio remoto:
```
git tag -d nombre-del-tag y git push origin :refs/tags/<tag-name>
```

## Alias:

```
alias git_tree="git log --all --graph --decorate --oneline"
```

### Alias solo para git

Local project:
```
git config alias.git_tree "log --all --graph --decorate --oneline"
```
Global:
```
git config --global alias.git_tree "log --all --graph --decorate --oneline"
```
To run the alias:
```
git git_tree
```

### Git log options
- `--all` :
- `--graph` :
- `--decorate` :
- `--oneline` :
- `--stat` :


## Manejo de ramas en GitHub (24/43)

### Comandos para manejo de ramas en GitHub

Crear una rama:
```
git branch <branchName>
```
Movernos a otra rama:
```
git checkout <branchName>
```
Crear una rama en el repositorio local:
```
git branch <nombre-de-la-rama>
```
```
git checkout -b <nombre-de-la-rama>
```
Publicar una rama local al repositorio remoto:
```
git push origin <nombre-de-la-rama>
```

## Configurar múltiples colaboradores en un repositorio de GitHub (25/43)

Cómo agregar colaboradores en Github
<br>
``Repositorio > Settings > Collaborators``
<br>
añadir el email o username de los nuevos colaboradores.

Hacer un commit con el nuevo mensaje que queremos, esto nos abre el editor de texto de la terminal:
```
git commit —amend
```
Corregimos el mensaje
Traer el repositorio remoto
```
git pull origin master
```
Ejecutar el cambio
```
git push --set-upstream origin master
```


## Utilizando Pull Requests en GitHub (28/43)

Pull request es una funcionalidad de Github (en Gitlab llamada merge request y en Bitbucket push request), en la que un colaborador pide que revisen sus cambios antes de hacer merge a una rama, normalmente master (ahora conocida como main).
Al hacer un pull request, se genera una conversación que pueden seguir los demás usuarios del repositorio, así como autorizar y rechazar los cambios.

## Cómo se realiza un pull request
Se trabaja en una rama paralela los cambios que se desean.
```
git checkout -b <rama>
```

Se hace un commit a la rama.
```
git commit -am '<Comentario>'
```

Se suben al remoto los cambios.
```
git push origin <rama>
```

En GitHub se hace el pull request comparando la rama master con la rama del fix.
Uno, o varios colaboradores revisan que el código sea correcto y dan feedback (en el chat del pull request).

El colaborador hace los cambios que desea en la rama y lo vuelve a subir al remoto (automáticamente jala la historia de los cambios que se hagan en la rama, en remoto).
Se aceptan los cambios en GitHub.
Se hace merge a master desde GitHub.

## Creando un Fork, contribuyendo a un repositorio (29/43)

Un fork es una bifurcación del repositorio completo.
<br>
Los forks son una característica única de GitHub.
<br>
Crea una copia exacta del estado actual de un repositorio directamente en GitHub, de la cual eres propietario.

Agregar nuevo repositorio remoto.
```
git remote add <nombre_del_remoto> <url_del_remoto>
```
Hacer pull y push desde el nuevo remoto.
```
git pull <remoto> <rama>
```
```
git push <remoto> <rama>
```

## Git Stash: Guardar cambios en memoria y recuperarlos después (36/43)

El stashed nos sirve para guardar cambios para después, Es una lista de estados que nos guarda algunos cambios que hicimos en Staging para poder cambiar de rama o branch sin perder el trabajo que todavía no guardamos en un commit.
<br>
Ésto es especialmente útil porque hay veces que no se permite cambiar de rama, ésto porque tenemos cambios sin guardar, no siempre es un cambio lo suficientemente bueno como para hacer un commit, pero no queremos perder ese código en el que estuvimos trabajando.
<br>
El stashed nos permite cambiar de ramas, hacer cambios, trabajar en otras cosas y, más adelante, retomar el trabajo con los archivos que teníamos en Staging, pero que podemos recuperar, ya que los guardamos en el Stash.

Save an stash.
```
git stash
```
```
git stash save "mensaje identificador del elemento del stashed"
```

Save an stash including files not tracked.
```
git stash -u
```

To list stash elements.
```
git stash list
```

### Obtener elementos del stash

El stashed se comporta como una Stack de datos comportándose de manera tipo LIFO (del inglés Last In, First Out, «último en entrar, primero en salir»), así podemos acceder al método pop.

Get Stash on current HEAD
```
git stash pop
```

Get specific stash element
```
git stash pop stash@{<stash_number>}
```
```
git stash apply stash@{<num_stash>}
```

Create branch from stash
```
git stash branch <nombre_de_la_rama>
```
```
git stash branch nombre_de_rama stash@{<stash_number>}
```

Remove top of stash list
```
git stash drop
```

Remove an specific element
```
git stash drop stash@{<stash_number>}
```

Remove all
```
git stash clear
```