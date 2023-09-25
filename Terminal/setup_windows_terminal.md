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

Color scheme example for terminal: https://github.com/Richienb/windows-terminal-snazzy/blob/main/snazzy.json

- Goback to terminal and:
- Color schemes > choose scheme > Click on Set as default.
- Appearance > Use acrylic material in the tab row > On. (I don't like it)

### Intall a prompt theme

- Install winget (App Installer) from Microsoft Store.
- Run next commnad:
```
winget install JanDeDobbeleer.OhMyPosh -s winget
```

### Install custom fonts

- Run windows terminal as administrator.
- Run next command:
```
oh-my-posh font install
```
- Select a font.
<br>
Documentation recomend: "Meslo".
<br>
Tutorial use: "FiraCode".

- Restart windows terminal as user.
- Profiles > Defaults > Appearance > Font Face = "MesloLGL Nerd Font Mono".
<br>
Tutorial use: "FiraCode Nerd Font Mono".

### Activate prompt theme

- Init Oh my posh theme
```
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json"
```

- Previews command throw another command and it is required run it.

```
(@(& 'C:/Users/DragoonLord/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='C:\Users\DragoonLord\AppData\Local\Programs\oh-my-posh\themes\jandedobbeleer.omp.json' --print) -join "`n") | Invoke-Expression
```

- Show Oh my posh themes
```
Get-PoshThemes 
```

- Ctrl+click on theme name to open theme file.

- Run next command to open Shell Profile file:
```
notepad $PROFILE
```

If your notepad show a modal message like this: "The system cannot find the path specified."
<br>
It is necessary to run another command first.
```
New-Item -Path $PROFILE -Type File -Force
```

- After that it is possible open `$PROFILE` with Notepad or VSCode.
<br>
From Terminal or Win+R run:
<!-- <br> -->
``notepad $PROFILE`` or ``code $PROFILE``

- Type configuration command into PowerShell profile file:
<br>
`$HOME_ROOT` : User root
<br>
`$PoshThemes_name` : theme file name.

```
(@(& '$HOME_ROOT/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='C:\Users\DragoonLord\AppData\Local\Programs\oh-my-posh\themes\$PoshThemes_name.omp.json' --print) -join "`n") | Invoke-Expression
```

### Install and activate icons gallery

- Run next command to install icons module PSGallery.

```
Install-Module -name Terminal-Icons -Repository PSGallery
```

- Run next command to Activate icons module PSGallery.

```
Import-Module Terminal-Icons
```

To persist this change when terminal start it is necessary add this configuration to terminal profile file.
- Open profile file located:
<br>
`$HOME_ROOT\PowerShell\Microsoft.PowerShell_profile.ps1`

```
notepad $PROFILE
```
- And add a new line:
<br>
```Import-Module Terminal-Icons```

- To show Read line option as a list run:
```
Set-PSReadLineOption -PredictionViewStyle ListView
```

- To have this option available wen terminal start add above line to profile file and restart terminal.