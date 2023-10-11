# Curso de Fundamentos de TypeScript

No vamos a instalar TypeScript de manera global, sino solo para el proyecto, ya que normalmente así se hace en mundo real. Se trabaja por proyecto.

- Creamos una carpeta para nuestro proyecto
```
mkdir ts-project && cd ts-project
```
- Abrimos nuestro editor de código desde la ubicación de la carpeta del proyecto.
- Crearemos los siguientes archivos:
    - Un archivo .gitignore en el editor o desde la terminal. Para su contenido, podemos utilizar la página gitignore.io. En nuestro programa necesitaremos las siguientes especificaciones:
        Windows, macOS, Linux, Node
        Luego copiamos lo que nos genera la web y lo pegamos en nuestro gitignore desde nuestro editor de código.
    - Un archivo .editorconfig (opcional), si estás usando Visual Studio Code (muchos editores e IDEs lo utilizan ya sea de forma nativa o con una extensión o pluging), con el fin de dar una configuración simple y sencilla a la hora de ejecutar código:
- Necistaremos también tener creado una carpeta de nombre src dentro de nuestro proyecto
```
mkdir src
```
- Ahora crearemos nuestro archivo package.json de manera simple desde la terminal y dentro de la ruta del proyecto:
```
npm init -y
```
- Finalmente, instalemos TypeScript 😊. Desde la terminal y dentro de la ruta del proyecto, ejecuta:
```
npm install typescript --save-dev
```
Para verificar la versión instalada:
```
npx tsc --version
```