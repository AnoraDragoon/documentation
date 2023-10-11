# Terminal

## Aprendiendo a caminar en la terminal (3/23)

### File system

La carpeta con el símbolo "``/``" es la raíz, ahí es donde comienza todo el sistema de ficheros (el equivalente en Windows podría ser el fichero “``C:\``”). Dentro de esta carpeta hay varios ficheros, el que nos importa en este momento es el “Home”.

``
miguelangel@DESKTOP-3R804MK:~$
``
- ``miguelangel`` : es el nombre del usuario que está activo. En tu caso aparecerá el nombre del usuario que esté activo en tu computadora.
- ``DESKTOP-3R804MK`` : es el nombre que el sistema operativo le dio a la computadora. En este caso se usa Windows y ese es el nombre que en la instalación Windows le asignó al dispositivo. Si usas Linux aparecerá el nombre del PC que hayas colocado en la instalación.
- ``~`` : es la carpeta en la que te encuentras y ahora es cuando empiezan las confusiones porque en el esquema no estaba una carpeta con ese símbolo. Más adelante verás como todo tiene sentido.
- ``$`` : significa que somos un usuario normal y no un root o un superusuario. Más adelante hablaremos más acerca de esto.

### Commands

Conocer la ruta actual (Paht working directory)
```
pwd
```

Move to a directory (Change directory)
```
cd <dir_path>
```

Show dir content (List)
```
ls
```

- Flags for ls:
    - ``-a`` : (all) Muestra todos los elementos (files/directories) incluyendo los ocultos.
    - ``-l`` : (Long) Muestra los elementos y detalles en formato tabulado.
    - ``-h <dir_name>`` : (Human Readable)


## Manipulando archivos y directorios (4/23)

Cómo crear un directorio (mkdir)
```
mkdir <dir_name>
```

También puedes crear varios directorios al mismo tiempo.
```
mkdir <dir_name> <dir_name>
```

Cómo crear archivos (touch)
```
touch <file_name> <file_name> <file_name>
```

Copy a file or directory
```
cp ${origin dir/file name} ${destiny dir/file name}
```

Move a file or directory
```
mv ${origin dir/file name} ${destiny dir path}
```

Remove file
```
rm <file_name> <file_name> ...
```

Remove directory
```
rm -r <dir_name> <dir_name> ...
```

- El comando rm tiene varias opciones (Flags). Las más usadas son:
    - ``-i`` (de interactive) te pregunta si estás seguro de eliminar el archivo
    - ``-r`` (de recursive) elimina todo lo que esté dentro de una carpeta
    - ``-f`` or ``--force`` (de force) fuerza a borrar todo.

## Explorando el contenido de nuestros archivos (5/23)

### Vistazo rápido al contenido usando los comandos Head y Tail

```
head -n 20 proyecto.html
```
```
less <file_dir>
```

``-n`` : Es una flag para los comandos `head` y `more` y se utiliza para espesificar al numero de lineas a visualizar.

- less Details

Ahora tendrás una especie de interfaz gráfica donde podrás inspeccionar el documento. Puedes usar las flechas y el scroll para moverte arriba y abajo.
Además, puedes buscar palabras dentro del documento. Si presionas la tecla slash “`/`”, en la parte de abajo se habilitará un cuadro donde podrás buscar palabras, solo escribe y presiona enter.
Para salir de la interfaz de less presiona “`q`”.

### Tabla de comandos
| Syntax | Description |
| --- | ----------- |
| head | Muestra las primeras 10 líneas |
| tail | Muestra las últimas 10 líneas |
| less | Muestra todo el contenido dentro de la consola |
| xdg-open | Abre un programa para inspeccionar ese archivo |
| nautilus | Abre en la interfaz de ventanas la carpeta que selecciones |

## ¿Qué es un comando? (6/23)

### Un comando pueden significar cuatro cosas:

Un programa ejecutable
Un comando de utilidad de la shell. Esto es un programa en sí mismo, que puede tener funciones. Ejemplo cd
Una función de shell. Son funciones de shell externas al comando de utilidad. Ejemplo mkdir
Un alias. Un ejemplo es `ls`

### Ejemplos de comandos básicos de la terminal

- ``type <comando>``: Nos permite conocer qué tipo de comando es 🤔.
- ``alias <alias>="<secuencia de comandos>"``: Nos permite crear comandos. Son temporales, se borran al cerrar la terminal 👶🏼.
- ``help <comando>``: Nos permite consultar un poco de documentación de un comando 📄.
- ``man <comando>``: De manual, nos permite conocer mucha más información de un comando.
- ``info <comando>``: Similar al anterior, pero un poco resumido y con otro formato.
- ``whatis <comando>``: Describe un comando en una sola línea ☺️. No funciona con todos.

Si cerramos y volvemos a abrir la terminal, el alias creado con el comando alias se pierde.

### Documentation

[Comandos que debes conocer.](https://platzi.com/blog/41-comandos-terminal/)

## Personalizar la terminal de comandos (21/23)

1. Instala Tilix
```
sudo apt install tilix
```

2. Instala ZSH
```
sudo apt install zsh
```

Comando para dejar por DEFECTO la shell de bash o zsh:
<br>
``chsh -s $(which bash)`` or ``chsh -s $(which zsh)``

Para cambiar entre bash y zsh en el momento o reinicial la shell actual:
<br>
``exec bash`` or ``exec zsh``

3. Personaliza funcionalidades y colores
Ahora, puedes ponerle funcionalidades y colores con OH-MY-ZSH
```
sh-c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

4. Usa Power Level
<br>
Vamos a instalarle un tema (powerLevel10K):
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Documentation: https://github.com/romkatv/powerlevel10k#powerlevel10k

Agregar powerlevel10 a ZSH:
```
vim ~/.zshrc
```

``ZSH_THEME="powerlevel10k/powerlevel10k"``

Reconfigurar Powerlevel10k
```
p10k configure
```

### Documentation

- [Plati blog terminal](https://platzi.com/blog/terminal-en-big-sur-mas-bonita-que-nunca/)
- [Tilix&Color](https://gnunn1.github.io/tilix-web/)
- [iTerm2 - MacOS](https://iterm2.com/)
- [Oh My Zsh](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [Personaliza tu terminal con Oh My ZSH y Powerlevel10k | codevars](https://www.edevars.com/blog/personalizar-terminal)