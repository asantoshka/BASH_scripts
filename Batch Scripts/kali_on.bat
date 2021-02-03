@echo off
"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm Kali --type headless
echo "Waiting for the VM to come alive on the network"
:while
ping -n 1 192.168.1.105 | find "TTL=" >nul
if errorlevel 1 (
    goto :while
) else (
    ssh sam@192.168.1.105
)

