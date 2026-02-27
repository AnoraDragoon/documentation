# 🛠️ Guía de Configuración: C++ Profesional en Windows + VS Code

## 1. Instalación del Compilador (MSVC)

Para Windows y consolas (Xbox), el estándar es **MSVC**. No instalaremos el IDE completo de Visual Studio, sino sus herramientas de línea de comandos.

- **Herramienta:** [Visual Studio Build Tools](https://www.google.com/search?q=https://visualstudio.microsoft.com/visual-cpp-build-tools/).
- **Componente necesario:** "Desarrollo de escritorio con C++" (asegurarse de que incluya el SDK de Windows y las herramientas de MSVC).
- **Verificación:** Abrir `x64 Native Tools Command Prompt` y ejecutar:

```bash
cl /Bv

```

_Debe indicar "for x64" al final._

---

## 2. Herramientas de Construcción (CMake & Ninja)

Para que el proyecto sea portable y rápido, usamos un generador y un ejecutor de construcción.

### A. CMake (El Arquitecto)

1. Descarga el instalador de [cmake.org](https://cmake.org/download/).
2. **Importante:** Selecciona "Add CMake to the system PATH for all users".
3. Permite definir el proyecto en un archivo `CMakeLists.txt` independiente del IDE.

### B. Ninja (El Obrero Rápido)

1. Descarga `ninja.exe` desde su [GitHub oficial](https://github.com/ninja-build/ninja/releases).
2. Colócalo en una carpeta (ej. `C:\DevTools\ninja.exe`).
3. Agrega esa carpeta a las **Variables de Entorno del Sistema (PATH)**.
4. Ninja es preferido en la industria por ser mucho más rápido que los Makefiles tradicionales.

---

## 3. Configuración de VS Code

Para evitar depender de menús complejos, configuramos la terminal integrada para que cargue el compilador automáticamente.

### Extensiones Imprescindibles

- **C/C++ (Microsoft):** Para autocompletado y depuración.
- **CMake Tools (Microsoft):** Para gestionar el ciclo de vida del proyecto.

### Perfil de Terminal Automático

Edita tu `settings.json` en VS Code para que siempre inicie en modo 64 bits:

```json
"terminal.integrated.profiles.windows": {
    "MSVC x64": {
        "path": "cmd.exe",
        "args": [
            "/k",
            "C:\\Program Files\\Microsoft Visual Studio\\2022\\BuildTools\\VC\\Auxiliary\\Build\\vcvarsall.bat",
            "x64"
        ]
    }
},
"terminal.integrated.defaultProfile.windows": "MSVC x64"

```

En mi caso concreto es:

```json
"terminal.integrated.profiles.windows": {
    "MSVC x64 Dev Tools": {
        "path": "cmd.exe",
        "args": [
            "/k",
            "C:\\Program Files (x86)\\Microsoft Visual Studio\\18\\BuildTools\\VC\\Auxiliary\\Build\\vcvarsall.bat",
            "x64" // Especifica que queremos el entorno de 64-bit
        ],
        "icon": "terminal-cmd"
    },
    "PowerShell": {
        "source": "PowerShell",
        "icon": "terminal-powershell"
    }
}
```

---

## 4. Estructura de un Proyecto Estándar

Para que tu código sea compilable en otras plataformas, mantén esta estructura mínima:

```text
/mi_proyecto
├── .vscode/          # Configuración del editor
├── build/            # Archivos generados (Ignorar en Git)
├── src/              # Código fuente (.cpp)
├── include/          # Cabeceras (.h)
└── CMakeLists.txt    # El "cerebro" del proyecto

```

### Ejemplo de `CMakeLists.txt` base

```cmake
cmake_minimum_required(VERSION 3.10)
project(MiJuegoConsoleReady VERSION 1.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_executable(GameExecutable src/main.cpp)

```

---

## 5. El Flujo de Trabajo (Workflow)

Este es el proceso que seguirás cada vez que desarrolles:

1. **Configurar (Una vez):** CMake escanea el sistema y elige a Ninja y MSVC.

```bash
cmake -S . -B build -G "Ninja"

```

1. **Construir (Cada vez que cambies código):** Ninja compila solo lo necesario.

```bash
cmake --build build

```

1. **Ejecutar:**

```bash
./build/GameExecutable.exe

```

---

## 🎯 Consejos para Portabilidad a Consolas

- **Evita librerías exclusivas de Windows:** No uses `<windows.h>` a menos que esté dentro de una capa de abstracción.
- **Usa Clang ocasionalmente:** Aunque estés en Windows, intenta compilar con Clang de vez en cuando (vía CMake) para detectar errores que MSVC ignora y que aparecerán en PlayStation o Switch.
- **Gestión de Memoria:** En consolas, la memoria es finita. Acostúmbrate a monitorizar el uso de recursos desde el inicio.
