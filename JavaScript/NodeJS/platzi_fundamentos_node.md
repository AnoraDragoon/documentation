# Notes

## Módulos nativos de NodeJS

| Módulo                 | Descripción                                                                                                                                                |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **fs** (`File System`) | Permite interactuar con el sistema de archivos. Puedes leer, escribir, eliminar y modificar archivos/directorios de forma síncrona o asíncrona.            |
| **path**               | Ofrece utilidades para trabajar con rutas de archivos y directorios (normalización, unión, extensión, etc.), de forma independiente del sistema operativo. |
| **http**               | Proporciona funcionalidad para crear servidores HTTP y manejar solicitudes/respuestas. Base de muchos frameworks como Express.                             |
| **https**              | Similar a `http`, pero con soporte para conexiones seguras mediante SSL/TLS.                                                                               |
| **os**                 | Permite obtener información del sistema operativo, como CPU, memoria libre, plataforma, uptime, etc. Útil para diagnósticos o logs.                        |
| **events**             | Implementa un patrón de EventEmitter, útil para manejar eventos personalizados y asincronía basada en eventos.                                             |
| **stream**             | Soporte para flujos de datos (streams) como lectura/escritura de archivos o sockets. Crucial para eficiencia en manejo de grandes volúmenes de datos.      |
| **buffer**             | Permite manejar datos binarios de forma eficiente en memoria. Comúnmente usado en streams o protocolos binarios.                                           |
| **crypto**             | Proporciona funcionalidades de criptografía (hashing, cifrado, generación de claves, etc.). Ideal para seguridad y autenticación.                          |
| **util**               | Contiene utilidades varias: `promisify`, `inherits`, `inspect`, etc. Apoya tareas comunes en desarrollo.                                                   |
| **child\_process**     | Permite crear y controlar procesos hijos, útil para ejecutar comandos del sistema o scripts externos.                                                      |
| **cluster**            | Facilita la creación de procesos hijos para balancear carga entre CPUs, útil para apps Node.js en producción.                                              |
| **net**                | Proporciona una API para crear servidores y clientes TCP/IPC de bajo nivel. Base para otros protocolos como HTTP.                                          |
| **url**                | Permite parsear, construir y manipular URLs de forma sencilla. Útil para manejar parámetros de consulta o rutas.                                           |
| **querystring**        | Facilita la manipulación de strings de consulta (`?foo=bar&baz=qux`). Menos usado desde la introducción de `URLSearchParams`.                              |
| **zlib**               | Proporciona compresión y descompresión de datos usando algoritmos como gzip y deflate. Útil para optimizar tráfico web.                                    |
| **dns**                | Permite realizar resoluciones DNS. Útil para personalizar la lógica de resolución de nombres en red.                                                       |
| **timers**             | Implementa temporizadores como `setTimeout`, `setInterval`, etc. Aunque están en el ámbito global, también forman parte del módulo `timers`.               |
| **readline**           | Proporciona una interfaz para leer datos línea por línea desde flujos (como stdin). Ideal para CLI.                                                        |
