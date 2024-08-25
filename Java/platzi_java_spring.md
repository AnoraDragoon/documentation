# Curso de Java Spring

## Instalacion de ambiente (3 - 5)

## Instalación de ambiente de desarrollo: Windows (3)

## Instalación de ambiente de desarrollo: Linux Ubuntu (4)

## Instalación de ambiente de desarrollo: macOS (5)

## Creando aplicaciones autocontenidas con Spring Initializer (6)

En este proyecto usamos Gradle

> **Nota:** Existen equivalencia entre los comandos de Maven y Gradle para muchas funcionalidades. Como instalar dependencias y ejecutar la aplicación.

Instalar dependencias:

- Maven

    ```sh
    mvn clean install
    ```

- Gradle

    ```sh
    .\gradlew clean build
    ```

Ejecutar la aplicación:

- Maven

    ```sh
    mvn spring-boot:run
    ```

- Gradle

    ```sh
    .\gradlew bootRun
    ```

## Conocer Spring Data (11)

## Implementar la anotación @Repository (18)

## ¿Qué es el patrón Data Mapper y qué resuelve? (19)

Documentation: <https://mapstruct.org/>

MapStruct Plugin for Intellij Idea : <https://plugins.jetbrains.com/plugin/10036-mapstruct-support>

## Inyección de dependencias (22)

Documentación: <https://reflectoring.io/constructor-injection/>

La inyección de dependencias se gestiona con el decorador `@Autowired`, pero para poder utilizarlo la clase a inyectar tiene que ser un componente de Spring.

En los casos que nos competen:

- `ProductoCrudRepository` no es un componente de Spring en si mismo, pero hereda de `CrudRepository` que si lo es gracias al decorador: `@NoRepositoryBean`.
- `ProductMapper` es un componente de Spring ya que su decorador `@Mapper` lo incluye de manera dínamica como componente de Spring por medio del atributo: `componentModel = "spring"`.

## Desplegar nuestra API desde la ventana de comandos (32)

### Opciones de Gradle

Etremo derecho del ID (IntelliJ IDEA) > Gradle: Abre el panel de opciones de Gradle, a la derecha.

Opciones a utilizar:

- Project_name > Tasks > application > bootRun: Ejecuta la applicación por medio del IDE.
- Project_name > Tasks > build > bootJar: Construye el .jar de nuestro proyecto.

> **Nota:** La versión se especifica en el archivo `build.gradle`.

### Ejecución del ejecutable por terminal

Commando:

```sh
java -jar <application/path>
```

Flags:

- `-Xmx2048m`: Tamaño en memoria asginado a la aplicación.
- `-Dspring.profile.active=pdn`: Asignar perfil `pdn`.
- `-Dserver.port=88`: Asignar puerto.

> **Nota:** Las propiedades de la applicación que se definen en el fichero: `src/resources/application.properties` se pueden estableser o sobreescribir en el momento de la ejecución. Solo se necesita agregarlo como una flag en el comando anteponiendo una `D` mayuscula.
> Ejemplo:`spring.profile.active=pdn` => `-Dspring.profile.active=pdn`
