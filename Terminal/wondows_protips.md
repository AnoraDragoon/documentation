# PROTIPS FOR WINDOWS SYSTEM

## Find Wi-Fi Saved Password in Windows 11

Run a PowerShell terminal as Administrator

### Show All Wi-Fi Profiles

```powershell
netsh wlan show profiles
```

**Example Output:**
```
Profiles on interface Wi-Fi:

User profiles
-------------
    All User Profile     : HomeNetwork_5G
    All User Profile     : CoffeeShop_Guest
    All User Profile     : Office_Corporate
```

### Show Wi-Fi Password for Specific Network

```powershell
# Example: Retrieve password for "HomeNetwork_5G"
netsh wlan show profile name="HomeNetwork_5G" key=clear
```

**Example Output:**

```txt
Security settings
-----------------
    Authentication         : WPA2-Personal
    Cipher                 : CCMP
    Security key           : Present
    Key Content            : MySecurePassword123
```

**The password will be shown in the "Key Content" field.**

### Real-World Examples

```powershell
# Home network
netsh wlan show profile name="HomeNetwork_5G" key=clear

# Office network
netsh wlan show profile name="Office_Corporate" key=clear

# Guest network
netsh wlan show profile name="CoffeeShop_Guest" key=clear
```

### Tips

- **Network names with spaces** must be enclosed in quotes
- The **key=clear** parameter reveals the actual password (without it, you'll only see asterisks)
- You must run PowerShell **as Administrator** or the command will fail
- If the profile name doesn't exist, you'll get an error message

### Quick One-Liner

```powershell
# List all profiles and their passwords at once
(netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)}
```
