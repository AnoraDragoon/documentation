# Descubrimiento de comandos en Windows (PowerShell)

## Objetivo

Explicar qué hace cada comando para localizar ejecutables o comandos disponibles:

- **Get-Command**
- **where / where.exe**

## Resumen rápido

| Comando | Entorno | ¿Qué devuelve? |
| --------- | --------- | ---------------- |
| `Get-Command <nombre>` | PowerShell | Cmdlet, alias, función o aplicación resoluble |
| `where.exe <nombre>` | Windows (CMD/PowerShell) | Todas las rutas de ejecutables en PATH |

---

## 1. Get-Command

Comando principal en PowerShell para identificar cómo se resolverá un nombre.

### Sintaxis básica (Get-Command)

```powershell
Get-Command <nombre>
Get-Command -Name <patrón>
Get-Command -Type <tipo>
```

### Ejemplos comunes (Get-Command)

```powershell
# Buscar un comando específico
Get-Command notepad

# Buscar con comodines
Get-Command *process*

# Filtrar por tipo
Get-Command -Type Cmdlet -Name *Service*
Get-Command -Type Application -Name python*

# Ver ruta completa
(Get-Command python).Source

# Verificar si existe
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host "Git está instalado"
}
```

**Notas:**

- Muestra tipo: `Application`, `Cmdlet`, `Alias`, `Function`
- Respeta orden de resolución: alias → función → cmdlet → ejecutable
- Para ver todas las rutas, usar `where.exe`

---

## 2 where.exe

Busca **todas** las coincidencias de ejecutables en las rutas del `PATH`.

### Sintaxis básica (where.exe)

```cmd
where.exe <nombre>
where.exe /R <directorio> <patrón>
```

### Ejemplos comunes (where.exe)

```powershell
# Buscar todas las versiones de Python
where.exe python

# Buscar con patrón
where.exe python*

# Buscar recursivamente en directorio
where.exe /R C:\Program* *.exe

# Verificar ubicaciones de comandos
where.exe cmd
where.exe git
```

#### ⚠️ Nota importante

En PowerShell, `where` es alias de `Where-Object`. **Usar siempre `where.exe`:**

```powershell
# ❌ Puede ejecutar Where-Object
where python

# ✅ Correcto
where.exe python
```

---

## Casos prácticos

### ¿Qué versión se ejecutará?

```powershell
Get-Command python      # Primera coincidencia
where.exe python        # Todas las versiones
```

### ¿Dónde está instalado?

```powershell
(Get-Command git).Source
where.exe git
```

### Verificar existencia antes de usar

```powershell
if (Get-Command dotnet -ErrorAction SilentlyContinue) {
    dotnet --version
} else {
    Write-Host ".NET SDK no está instalado"
}
```

---

## Comparación con Unix/Linux

| Unix/Linux | Windows PowerShell | Función |
| ------------ | ------------------- | --------- |
| `which` | `Get-Command` + `.Source` | Primera ruta del comando |
| `which -a` | `where.exe` | Todas las rutas en PATH |
| `type` | `Get-Command` | Tipo y ubicación |

---

## Mejores prácticas

1. ✅ Usar `Get-Command` para identificar cmdlets, funciones y aliases
2. ✅ Usar `where.exe` (con `.exe`) para encontrar ejecutables
3. ✅ Combinar ambos para información completa:

   ```powershell
   Get-Command python
   where.exe python
   ```

4. ⚠️ Evitar `where` sin `.exe` en PowerShell
5. 📝 En scripts, verificar existencia con `-ErrorAction SilentlyContinue`
