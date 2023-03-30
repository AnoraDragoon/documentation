# Terminal

## Aprendiendo a caminar en la terminal (3/23)
### File system
La carpeta con el símbolo “/” es la raíz, ahí es donde comienza todo el sistema de ficheros (el equivalente en Windows podría ser el fichero “C:\”). Dentro de esta carpeta hay varios ficheros, el que nos importa en este momento es el “Home”.

miguelangel@DESKTOP-3R804MK:~$
- miguelangel es el nombre del usuario que está activo. En tu caso aparecerá el nombre del usuario que esté activo en tu computadora.
- DESKTOP-3R804MK es el nombre que el sistema operativo le dio a la computadora. En este caso se usa Windows y ese es el nombre que en la instalación Windows le asignó al dispositivo. Si usas Linux aparecerá el nombre del PC que hayas colocado en la instalación.
- ~ es la carpeta en la que te encuentras y ahora es cuando empiezan las confusiones porque en el esquema no estaba una carpeta con ese símbolo. Más adelante verás como todo tiene sentido.
- Por último, $ significa que somos un usuario normal y no un root o un superusuario. Más adelante hablaremos más acerca de esto.

### Commands
Conocer la ruta actual (Paht working directory)
$ pwd
Move to a directory (Change directory)
$ cd ${dir path}
Show dir content (List)
$ ls
- Flags for ls:
    -a: (all) Muestra todos los elementos (files/directories) incluyendo los ocultos.
    -l: (Long) Muestra los elementos y detalles en formato tabulado.
    -h: (Human Readable)


## Manipulando archivos y directorios (4/23)

Cómo crear un directorio (mkdir)
$ mkdir ${dir name}
También puedes crear varios directorios al mismo tiempo.
$ mkdir ${dir name} ${dir name}
Cómo crear archivos (touch)
$ touch ${file name} ${file name} ${file name}
Copy a file or directory
$ cp ${origin dir/file name} ${destiny dir/file name}
Move a file or directory
$ mv ${origin dir/file name} ${destiny dir path}
Remove file
$ rm ${file name} ${file name} ...
Remove directory
$ rm -r ${dir name} ${dir name} ...
- El comando rm tiene varias opciones (Flags). Las más usadas son:
    -i (de interactive) te pregunta si estás seguro de eliminar el archivo
    -r (de recursive) elimina todo lo que esté dentro de una carpeta
    -f or --force (de force) fuerza a borrar todo.

## Explorando el contenido de nuestros archivos (5/23)