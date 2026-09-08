# 🛠️ Guía de Compilación con MSVC (Microsoft Visual C++)

Esta documentación detalla cómo transformar código fuente C++ en un ejecutable utilizando las herramientas de línea de comandos de Visual Studio (`cl.exe`).

## 📋 Requisitos Previos

Para que estos comandos funcionen, deben ejecutarse desde el **Developer Command Prompt** de Visual Studio. Esto asegura que el compilador (`cl`) y el enlazador (`link`) estén en el `PATH` del sistema.

---

## 🚀 1. Compilación en un solo paso

Es la forma más común y rápida para proyectos pequeños. El compilador realiza el preprocesamiento, la compilación y el enlazado de forma automática.

**Comando:**

```bash
cl /EHsc main.cpp
```

* **Resultado:** Genera `main.obj` (temporal) y el ejecutable final `main.exe`.
* **Flag `/EHsc`:** Habilita el manejo de excepciones estándar de C++, asegurando que los objetos se destruyan correctamente si ocurre un error.

---

## 🔍 2. Proceso Detallado (Paso a Paso)

Dividir el proceso es útil para entender cómo se construye el software o para compilar proyectos con múltiples archivos de forma eficiente.

### Paso A: Preprocesamiento

El compilador lee las directivas (`#include`, `#define`) y expande el código.

* **Comando:** `cl /P main.cpp`
* **Resultado:** Archivo `main.i`. Contiene miles de líneas de código (tu código + el contenido de las librerías expandido).

### Paso B: Compilación (Generación del Objeto)

Traduce el código C++ a código máquina, pero sin resolver las direcciones de memoria de funciones externas.

* **Comando:** `cl /c /EHsc main.cpp`
* **Flag `/c`:** Indica "Compilar únicamente, no llamar al enlazador".
* **Resultado:** Archivo **`main.obj`**. Este es el equivalente al `.o` en sistemas Linux/GCC.

### Paso C: Enlazado (Linking)

Une los archivos objeto (`.obj`) con las librerías del sistema (como la librería estándar de C++) para crear el ejecutable.

* **Comando:** `link main.obj`
* **Resultado:** Archivo **`main.exe`**.

---

## 📊 Comparativa de Extensiones

| Etapa | Extensión MSVC (Windows) | Extensión GCC (Linux/MinGW) |
| :--- | :--- | :--- |
| **Código Fuente** | `.cpp` | `.cpp` / `.cc` |
| **Preprocesado** | `.i` | `.i` |
| **Código Objeto** | `.obj` | `.o` |
| **Ejecutable** | `.exe` | Ninguna (o `.out`) |

---

## 🛠️ Flags (Banderas) Esenciales

| Flag | Descripción |
| :--- | :--- |
| `/EHsc` | **Obligatoria.** Manejo de excepciones estándar y limpieza de memoria. |
| `/W4` | Muestra todos los avisos (warnings) importantes para escribir código limpio. |
| `/O2` | Optimiza el código para que el ejecutable sea más rápido. |
| `/Fe:nombre` | Permite cambiar el nombre del ejecutable resultante (ej: `/Fe:MiPrograma`). |

---

> **Nota:** Si tienes varios archivos (ej: `main.cpp` y `funciones.cpp`), puedes compilarlos juntos con:  
> `cl /EHsc main.cpp funciones.cpp`

---

## 1. Debug vs. Release (Optimización y Símbolos)

Cuando desarrollas, necesitas ver qué pasa dentro del código (Debug). Cuando entregas el programa, quieres que vuele (Release).

### Modo Debug (Depuración)

Se usa la flag **/Zi** para generar símbolos de depuración (un archivo `.pdb`) y **/Od** para desactivar optimizaciones (así el código que ves en el depurador coincide exactamente con lo que se ejecuta).

* **Comando:** `cl /EHsc /Zi /Od main.cpp`
* **Resultado:** Un `.exe` más lento y pesado, pero "analizable".

### Modo Release (Producción)

Se usa **/O2** para optimizar la velocidad (o **/Os** para tamaño) y se omiten los símbolos de depuración.

* **Comando:** `cl /EHsc /O2 main.cpp`
* **Resultado:** Un `.exe` muy rápido y ligero.

---

## 2. Librerías: (Buildtime/Runtime Library)

MSVC usa la bandera **/MT** o **/MD** para decidir cómo tratar la **C++ Standard Library**.

### Enlazado Estático (`/MT`) -> Mayor Portabilidad

Mete las funciones de la librería estándar *dentro* de tu `.exe`.

* **Pros:** El programa funcionará en casi cualquier Windows aunque no tenga instalados los "Visual C++ Redistributables".
* **Contras:** El archivo `.exe` es mucho más grande.
* **Comando:** `cl /EHsc /MT main.cpp`

### Enlazado Dinámico (`/MD`) -> Menor Tamaño

El `.exe` busca las librerías en el sistema operativo (archivos `.dll`).

* **Pros:** El `.exe` es diminuto (pocos KB).
* **Contras:** Si el usuario no tiene instalado el "Redistributable" de Visual Studio, el programa dará error de "Falta msvcp140.dll".
* **Comando:** `cl /EHsc /MD main.cpp`

---

## 📝 Resumen de banderas combinadas

Normalmente, usarás una de estas combinaciones:

| Objetivo | Flags recomendadas | Notas |
| :--- | :--- | :--- |
| **Debug Estándar** | `/Zi /Od /MDd` | `d` al final de `MD` indica versión debug de la librería. |
| **Release portable** | `/O2 /MT` | El "todo en uno" para enviar a un amigo. |
| **Release ligero** | `/O2 /MD` | Estándar para aplicaciones que se instalan con un instalador. |

---

### Un detalle curioso sobre `/MT`

Si usas `/MT`, notarás que un "Hello World" pasa de pesar unos **12 KB** a pesar unos **150 KB** o más. Parece poco, pero en programas reales, esa diferencia de incluir o no las librerías base es lo que define si tu programa es "autónomo".
