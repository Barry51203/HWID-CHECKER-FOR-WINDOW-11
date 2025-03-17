@echo off 
mode con: cols=86 lines=59
TITLE HWID Checker v2.0 by CARFTY MRFKER
Color d

setlocal EnableDelayedExpansion

set "animation="
set "animation2=Developed by CARFTY MRFKER."
set "percentage=0"

for /L %%i in (1,1,10) do (
    echo Loading...
    set /a "percentage=percentage+10"
    set "animation=!animation!="
    set "animation2=!animation2:~1!!animation2:~0,1!"
    echo -------------+
    echo !animation! !percentage! percent
    echo -------------+
    echo !animation2!
    timeout /nobreak /t 1 >nul
    cls
)

echo Loading complete!
cls
ECHO "+=============================================================================+"
ECHO "?                                                                            ?"
ECHO "?                .o88b.  .d8b.  d8888b. d88888b d888888b db    db            ?"
ECHO "?               d8P  Y8 d8' `8b 88  `8D 88'     `~~88~~' `8b  d8'            ?"
ECHO "?               8P      88ooo88 88oobY' 88ooo      88     `8bd8'             ?"
ECHO "?               8b      88~~~88 88`8b   88~~~      88       88               ?"
ECHO "?               Y8b  d8 88   88 88 `88. 88         88       88               ?"
ECHO "?                 88P'  YP   YP 88  YD  YP         YP       YP               ?"
ECHO "?                                                                            ?"
ECHO "+=============================================================================+"
ECHO "?                                                                            ?"
echo "?		      : HWID CHECKER TOOLS v 3.0                               ?"
echo "?		      : Developed by CARFTY MRFKER.                            ?"
echo "?		      : 2.0 @ 12-11-2023                                       ?"
echo "?		      : 0.0 @ 0-0-0000                                         ?"
ECHO "?                                                                            ?"
ECHO "+=============================================================================+"

REM Run HWID Checker
color e
ECHO [+] Checking HWID...
    
echo [!] DISK DRIVE
powershell -Command "Get-WmiObject -Class Win32_DiskDrive | Select-Object Model, SerialNumber"
if errorlevel 1 (
    echo Error: Unable to get disk drive information.
    pause
    exit
)

echo [!] CPU Serialnumber   
powershell -Command "Get-WmiObject -Class Win32_Processor | Select-Object SerialNumber"
if errorlevel 1 (
    echo Error: Unable to get CPU serial number.
    pause
    exit
)

echo [!] CPU Processorid        
powershell -Command "Get-WmiObject -Class Win32_Processor | Select-Object ProcessorId"
if errorlevel 1 (
    echo Error: Unable to get CPU processor ID.
    pause
    exit
)

echo [!] BIOS          
powershell -Command "Get-WmiObject -Class Win32_BIOS | Select-Object SerialNumber"
if errorlevel 1 (
    echo Error: Unable to get BIOS serial number.
    pause
    exit
)

echo [!] Motherboard   
powershell -Command "Get-WmiObject -Class Win32_BaseBoard | Select-Object SerialNumber"
if errorlevel 1 (
    echo Error: Unable to get motherboard serial number.
    pause
    exit
)

echo [!] Ram Serialnumber           
powershell -Command "Get-WmiObject -Class Win32_PhysicalMemory | Select-Object SerialNumber"
if errorlevel 1 (
    echo Error: Unable to get RAM serial number.
    pause
    exit
)

echo [!] smBIOS UUID
powershell -Command "Get-WmiObject -Class Win32_ComputerSystemProduct | Select-Object UUID"
if errorlevel 1 (
    echo Error: Unable to get smBIOS UUID.
    pause
    exit
)

echo [!] MAC Address
powershell -Command "Get-NetAdapter | Select-Object MacAddress"
if errorlevel 1 (
    echo Error: Unable to get MAC address.
    pause
    exit
)

echo [!] Developed by CARFTY MRFKER
pause>nul
exit
