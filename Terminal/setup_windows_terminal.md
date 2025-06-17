# Setting Windows Terminal

## Documentation

- [Hola Mundo Channel: configurando terminal en Windows 11](https://www.youtube.com/watch?v=6SGIFVJ5Izs)
- [Oh My Posh](https://ohmyposh.dev/docs)

## Tutorial

### Pre-Requirements

It is necessary Windows 10 or higher.

Applications:

- Windows Terminal
- PowerShell
- winget (App Installer)

Make sure if Pre-Requirements are installed. It is possible install them from Microsoft Store.

### Start setting

- Open `Terminal` and go to `Settings` on tab row dropdown.
- Startup > Default profile = PowerShell
- Startup > Default terminal application = Windows Terminal
- Save

On windows terminal look for `Open JSON file` and on JSON file:

- `settings.json` > `schemes` add a new scheme.

Color scheme example for terminal: <https://github.com/Richienb/windows-terminal-snazzy/blob/main/snazzy.json>

- Goback to terminal and:
- Color schemes > choose scheme > Click on Set as default.
- Appearance > Use acrylic material in the tab row > On. (I don't like it)

### Intall a prompt theme

- Install winget (App Installer) from Microsoft Store.
- Run next commnad:

```sh
winget install JanDeDobbeleer.OhMyPosh -s winget
```

> Now it is possible to install OhMyPosh from Microsoft Store

### Install custom fonts

- Run windows terminal as administrator.
- Run next command:

```sh
oh-my-posh font install
```

- Select a font.
\
Documentation recomend: "Meslo".
\
Tutorial use: "FiraCode".

- Restart windows terminal as user.
- Profiles > Defaults > Appearance > Font Face = "MesloLGL Nerd Font Mono".
\
Tutorial use: "FiraCode Nerd Font Mono".

> It is possible to install favorite font as command param

```sh
oh-my-posh font install meslo
```

- Visual Studio Code
  Tu use installed font into VSCode terminal it is required to add next line into `settings.json`
  `"terminal.integrated.fontFamily": "MesloLGL Nerd Font Mono"`

### Activate prompt theme

- Init Oh my posh theme

```sh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json"
```

> My favorite theme is: `$env:POSH_THEMES_PATH/zash.omp.json`

- Previews command throw another command and it is required run it.

> **Note:** Deprecated

```pwsh
(@(& 'C:/Users/DragoonLord/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='C:\Users\DragoonLord\AppData\Local\Programs\oh-my-posh\themes\jandedobbeleer.omp.json' --print) -join "`n") | Invoke-Expression
```

> **Note:** Deprecated

- Show Oh my posh themes

```sh
Get-PoshThemes 
```

- Ctrl+click on theme name to open theme file.
- Run next command to open Shell Profile file:

```sh
notepad $PROFILE
```

If your notepad show a modal message like this: "The system cannot find the path specified."
\
It is necessary to run another command first.

```sh
New-Item -Path $PROFILE -Type File -Force
```

- After that it is possible open `$PROFILE` with Notepad or VSCode.
\
From Terminal or Win+R run:
<!-- \ -->
``notepad $PROFILE`` or ``code $PROFILE``

- Type configuration command into PowerShell profile file:
\
`$HOME_ROOT` : User root
\
`$PoshThemes_name` : theme file name.

> **Note:** Better options `code $PROFILE.CurrentUserAllHosts`

```sh
code $PROFILE.CurrentUserAllHosts
```

### Install and activate icons gallery

- Run next command to install icons module PSGallery.

```sh
Install-Module -name Terminal-Icons -Repository PSGallery
```

- Run next command to Activate icons module PSGallery.

```sh
Import-Module Terminal-Icons
```

To persist this change when terminal start it is necessary add this configuration to terminal profile file.

- Open profile file located:
\
`$HOME_ROOT\PowerShell\Microsoft.PowerShell_profile.ps1`

> **Note:** Deprecated for me. Currently I use:

`$HOME_ROOT\PowerShell\profile.ps1`

```sh
notepad $PROFILE
```

- And add a new line:
\
```Import-Module Terminal-Icons```

- To show Read line option as a list run:

```sh
Set-PSReadLineOption -PredictionViewStyle ListView
```

- To have this option available wen terminal start add above line to profile file and restart terminal.

Finally profile version: `profile.ps1`

```sh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/zash.omp.json" | Invoke-Expression
Import-Module Terminal-Icons
Set-PSReadLineOption -PredictionViewStyle ListView
```
