# Setting Up Environment Variables on Windows 11

## Overview

Environment variables are key-value pairs that configure system and application behavior. This guide shows how to create environment variables using both the Windows UI and terminal commands.

---

## Method 1: Windows 11 UI (Persistent)

### Steps

1. **Open System Properties**
   - Press `Win + X` and select **System**
   - Click **Advanced system settings** on the right panel
   - OR search for "Environment Variables" in the Start menu

2. **Access Environment Variables Dialog**
   - Click **Environment Variables** button at the bottom

3. **Add New Variable**
   - Under **User variables** (for current user only):
     - Click **New**
     - Variable name: `WORKSPACE`
     - Variable value: `D:\workspace`
     - Click **OK**

   - Under **System variables** (for all users - requires admin):
     - Click **New**
     - Variable name: `WORKSPACE`
     - Variable value: `D:\workspace`
     - Click **OK**

4. **Apply Changes**
   - Click **OK** on all dialogs
   - **Restart any open terminals** for changes to take effect

### Verification 1

```powershell
# Check if variable exists
echo $env:WORKSPACE
# Output: D:\workspace
```

---

## Method 2: PowerShell Terminal (Persistent)

### Set User-Level Environment Variable

```powershell
# Set environment variable for current user
[System.Environment]::SetEnvironmentVariable('WORKSPACE', 'D:\workspace', 'User')

# Reload environment variables in current session
$env:WORKSPACE = [System.Environment]::GetEnvironmentVariable('WORKSPACE', 'User')
```

### Set System-Level Environment Variable (Requires Admin)

```powershell
# Run PowerShell as Administrator, then:
[System.Environment]::SetEnvironmentVariable('WORKSPACE', 'D:\workspace', 'Machine')

# Reload in current session
$env:WORKSPACE = [System.Environment]::GetEnvironmentVariable('WORKSPACE', 'Machine')
```

### Verification 2

```powershell
# Check variable value
$env:WORKSPACE

# List all environment variables containing "WORKSPACE"
Get-ChildItem Env: | Where-Object { $_.Name -like '*WORKSPACE*' }
```

---

## Method 3: Session-Only (Temporary)

### PowerShell

```powershell
# Set for current PowerShell session only (lost when terminal closes)
$env:WORKSPACE = "D:\workspace"

# Verify
echo $env:WORKSPACE
```

### Command Prompt (CMD)

```cmd
REM Set for current CMD session only
set WORKSPACE=D:\workspace

REM Verify
echo %WORKSPACE%
```

---

## Setting Up PowerShell Aliases

### Temporary Alias (Current Session)

```powershell
# Create a shorthand variable
$WORKSPACE = $env:WORKSPACE

# Use it
cd $WORKSPACE
```

### Persistent Alias (PowerShell Profile)

1. **Check if profile exists**

```powershell
Test-Path $PROFILE
# If False, create it:
New-Item -Path $PROFILE -Type File -Force
```

1. **Edit PowerShell profile**

```powershell
notepad $PROFILE
```

> **Tip:** If you use VS Code, a better option is:
>
> ```powershell
> code $PROFILE.CurrentUserAllHosts
> ```
>
> This opens the current user profile for all hosts (`profile.ps1`) instead of only `Microsoft.PowerShell_profile.ps1`.

1. **Add alias to profile**

```powershell
# PowerShell Profile Content
# Create shorthand variable from environment variable
$WORKSPACE = $env:WORKSPACE

# Optional: Function to change to workspace directory
function GoToWorkspace { Set-Location $env:WORKSPACE }
Set-Alias -Name workspace -Value GoToWorkspace
```

1. **Reload profile**

```powershell
. $PROFILE
```

1. **Usage**

```powershell
# Use the variable
cd $WORKSPACE

# Or use the function/alias
workspace
```

---

## Common Environment Variables

| Variable | Purpose | Example Value |
| -------- | ------- | ------------- |
| `WORKSPACE` | Development workspace | `D:\workspace` |
| `PATH` | Executable locations | Existing + new paths |
| `JAVA_HOME` | Java installation | `C:\Program Files\Java\jdk-17` |
| `NODE_HOME` | Node.js installation | `C:\Program Files\nodejs` |

---

## Troubleshooting

### Changes Not Reflecting

**Problem**: Environment variable not recognized after setting

**Solutions**:

- Restart your terminal/PowerShell window
- Log out and log back in (for system-wide changes)
- Restart Windows (for stubborn cases)

### Permission Denied

**Problem**: Cannot set system-level variables

**Solution**: Run PowerShell as Administrator

- Press `Win + X`
- Select **Windows PowerShell (Admin)** or **Terminal (Admin)**

### Accessing Variables in Different Shells

```powershell
# PowerShell
$env:WORKSPACE

# Command Prompt (CMD)
%WORKSPACE%

# Git Bash / WSL
echo $WORKSPACE
```

---

## Best Practices

1. **User vs System Variables**
   - Use **User** variables for personal settings
   - Use **System** variables only when needed by all users

2. **Naming Conventions**
   - Use UPPERCASE for environment variables
   - Use descriptive names (avoid single letters)

3. **Path Variables**
   - When adding to `PATH`, append with semicolon:

     ```powershell
     $currentPath = [Environment]::GetEnvironmentVariable('PATH', 'User')
     [Environment]::SetEnvironmentVariable('PATH', "$currentPath;D:\workspace\bin", 'User')
     ```

4. **Security**
   - Never store sensitive data (passwords, API keys) in user/system environment variables
   - Use secure credential management tools instead

---

## Quick Reference

```powershell
# Set persistent user variable
[Environment]::SetEnvironmentVariable('WORKSPACE', 'D:\workspace', 'User')

# Set session-only variable
$env:WORKSPACE = "D:\workspace"

# Check variable
echo $env:WORKSPACE

# Remove variable
[Environment]::SetEnvironmentVariable('WORKSPACE', $null, 'User')
```
