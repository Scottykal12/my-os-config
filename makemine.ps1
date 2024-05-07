New-Item -ItemType Directory .\config-os
Set-Location .\config-os

# install code steam and galaxy
winget install Microsoft.VisualStudioCode
winget install Valve.Steam
winget install GOG.Galaxy
winget install Google.Chrome
winget install Meta.Oculus
winget install Git.Git
winget install WinSCP.WinSCP
winget install Malwarebytes.Malwarebytes

# git commands may not work before reload of terminal
git config --global user.name Scott Kalinec
git config --global user.email scottykal12@gmail.com

Invoke-WebRequest -Uri https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe
.\GoogleDriveSetup.exe


# emulation
# retroarch
Invoke-WebRequest -Uri https://buildbot.libretro.com/stable/1.17.0/windows/x86_64/RetroArch-Win64-setup.exe -OutFile retroarch.exe
.\retroarch.exe

# emulationstation
Invoke-WebRequest -Uri https://emulationstation.org/downloads/releases/emulationstation_win32_latest.exe -OutFile emu.exe
.\emu.exe

Remove-Item -Path $env:USERPROFILE\.emulationstation\es_systems.cfg
Invoke-WebRequest -Uri https://raw.githubusercontent.com/Scottykal12/my-os-config/main/es_systems.cfg -OutFile $env:USERPROFILE\.emulationstation\es_systems.cfg

foreach ($i in Get-Content .\paths.txt) {
    New-Item -ItemType Directory $env:USERPROFILE$i
}
