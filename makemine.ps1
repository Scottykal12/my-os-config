New-Item .\config-os
Set-Location .\config-os

# install code steam and galaxy
wingit install Microsoft.VisualStudioCode
wingit intall Valve.Steam
winget install GOG.Galaxy
winget install Google.Chrome

# emustation
Invoke-WebRequest -Uri https://emulationstation.org/downloads/releases/emulationstation_win32_latest.exe -OutFile emu.exe
.\emu.exe
