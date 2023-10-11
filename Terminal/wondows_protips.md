# PROTIPS FOR WINDOWS SYSTEM

## Find Wi-Fi saved password in Windows 11

Run a PowerShell terminal as Administrator

- Show Wi-Fi profiles
```
netsh wlan show profiles
```

- Show Wi-Fi password for specific network profiles
```
netsh wlan show profile name=<Wi-Fi-Profile> key=clear
```
