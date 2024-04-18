New-Item -ItemType Directory .\config-os
Set-Location .\config-os

# install code steam and galaxy
winget install Microsoft.VisualStudioCode
winget intall Valve.Steam
winget install GOG.Galaxy
winget install Google.Chrome

# emulation
# retroarch
Invoke-WebRequest -Uri https://buildbot.libretro.com/stable/1.16.0/windows/x86_64/RetroArch-Win64-setup.exe -OutFile retroarch.exe
.\retroarch

# emulationstation
Invoke-WebRequest -Uri https://emulationstation.org/downloads/releases/emulationstation_win32_latest.exe -OutFile emu.exe
.\emu.exe

Remove-Item -OutFile $env:USERPROFILE\.emulationstation\es_systems.cfg
Invoke-WebRequest -Uri https://raw.githubusercontent.com/Scottykal12/my-os-config/main/es_systems.cfg -OutFile $env:USERPROFILE\.emulationstation\es_systems.cfg

foreach ($i in Get-Content .\paths.txt) {
    New-Item -ItemType Directory $env:USERPROFILE$i
}
