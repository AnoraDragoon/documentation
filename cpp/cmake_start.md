# Documentación Técnica: Uso de CMake para Proyectos de C++ en Windows y VS Code

## 1. Introducción a CMake

**CMake** no es un compilador; es un **generador de sistemas de construcción** (build system generator). Su propósito principal es abstraer las diferencias entre plataformas (Windows, Linux, macOS) y compiladores (MSVC, GCC, Clang).

A partir de un archivo de configuración plano llamado `CMakeLists.txt`, CMake genera los archivos específicos necesarios para que herramientas de construcción de alto rendimiento como **Ninja** o entornos como Visual Studio compilen tu código.

---

## 2. El Flujo de Trabajo en Dos Fases

A diferencia de los comandos tradicionales de compilación directa (`g++` o `cl`), CMake divide el proceso en dos etapas estrictas:

```text

[Código Fuente + CMakeLists.txt]
│
▼

1. Configuración (cmake -S . -B build -G "Ninja")
│
▼
[Archivos de Construcción en /build]
│
▼
2. Construcción (cmake --build build)
│
▼
[Ejecutable Final]

```

### Fase 1: Configuración (`Configure`)

Lee el `CMakeLists.txt`, detecta el compilador del sistema (ej. MSVC `amd64`) y genera los archivos intermedios.

* **Comando por terminal:**

```bash
cmake -S . -B build -G "Ninja"
```

* **Significado de las banderas:**
* `-S .`: Indica que el código fuente (`Source`) está en el directorio actual.
* `-B build`: Indica que los archivos generados se almacenarán en una carpeta llamada `build`.
* `-G "Ninja"`: Selecciona a **Ninja** como el motor de ejecución rápida de compilación.

### Fase 2: Construcción (`Build`)

Toma los archivos generados en la fase anterior, invoca al compilador (MSVC `cl.exe`) y genera los archivos binarios finales (`.obj`, `.exe`).

* **Comando por terminal:**

```bash
cmake --build build
```

---

## 3. Estructura de un Proyecto Estándar con CMake

Para mantener la portabilidad y preparar el proyecto de cara a futuras compilaciones en consolas, se recomienda la siguiente estructura de directorios:

```text
/mi_proyecto
├── .vscode/          # Configuraciones del editor (settings.json)
├── build/            # Carpeta generada automáticamente (excluir de Git)
├── src/              # Archivos de código fuente (.cpp)
├── include/          # Archivos de cabecera (.h / .hpp)
└── CMakeLists.txt    # Archivo central de configuración de CMake

```

---

## 4. Estructura del Archivo `CMakeLists.txt` (Ejemplo Base)

Este archivo define las reglas de compilación, el estándar del lenguaje y los ejecutables del proyecto:

```cmake
# 1. Versión mínima requerida de CMake
cmake_minimum_required(VERSION 3.10)

# 2. Nombre del proyecto y versión
project(MiJuegoConsola VERSION 1.0)

# 3. Establecer el estándar de C++ moderno (Requerido C++17 o superior para motores)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# 4. Definir los archivos ejecutables y sus fuentes asociadas
add_executable(
    MiJuegoExec
    src/main.cpp
)

```

---

## 5. Integración con VS Code y Extensión CMake Tools

Para automatizar este flujo sin depender exclusivamente de la línea de comandos, se utiliza la extensión **CMake Tools** en VS Code combinada con un entorno de terminal optimizado.

### A. Configuración de la Terminal Integrada (`settings.json`)

Para asegurar que VS Code lance siempre las herramientas de compilación de 64 bits (`x64`) de MSVC:

```json
"terminal.integrated.profiles.windows": {
    "MSVC x64 Dev Tools": {
        "path": "cmd.exe",
        "args": [
            "/k",
            "C:\\Program Files\\Microsoft Visual Studio\\2022\\BuildTools\\VC\\Auxiliary\\Build\\vcvarsall.bat",
            "x64"
        ]
    }
},
"terminal.integrated.defaultProfile.windows": "MSVC x64 Dev Tools"

```

### B. Selección del Kit en CMake Tools

1. Presiona `Ctrl + Shift + P` y escribe `CMake: Select a Kit`.
2. Selecciona el kit nativo de 64 bits detectado (por ejemplo, **`Visual Studio Build Tools - amd64`**).
3. La extensión automatizará la fase de configuración cada vez que modifiques el `CMakeLists.txt` y te permitirá compilar haciendo clic en el icono del martillo (**Build**) en la barra de estado inferior.

---

## 6. Buenas Prácticas para Proyectos Multiplataforma / Consolas

* **Evita dependencias nativas directas:** No incluyas llamadas a librerías propietarias de un solo sistema operativo (como `<windows.h>`) en la lógica central del juego. Aísla dichas llamadas en una Capa de Abstracción de Hardware (HAL).
* **Compilación Cruzada Simulada:** Aunque desarrolles en Windows usando MSVC, prueba compilar periódicamente utilizando **Clang** mediante CMake. Esto ayuda a detectar violaciones del estándar C++ que podrían fallar al exportar a sistemas basados en Unix (PlayStation o Nintendo Switch).
* **Gestión Limpia:** Nunca subas la carpeta `build/` a sistemas de control de versiones como Git. Debe ser generada localmente en cada máquina de desarrollo.
