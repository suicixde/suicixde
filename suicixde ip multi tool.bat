@echo off
chcp 65001
title IP.BOOT MULITOOL
color 3

:menu
cls
 echo ███▄ ▄███▓ █    ██  ██▓  ▄▄▄█████▓ ██▓   ▄▄▄█████▓ ▒█████   ▒█████   ██▓    
echo ▓██▒▀█▀ ██▒ ██  ▓██▒▓██▒  ▓  ██▒ ▓▒▓██▒   ▓  ██▒ ▓▒▒██▒  ██▒▒██▒  ██▒▓██▒    
echo ▓██    ▓██░▓██  ▒██░▒██░  ▒ ▓██░ ▒░▒██▒   ▒ ▓██░ ▒░▒██░  ██▒▒██░  ██▒▒██░    
echo ▒██    ▒██ ▓▓█  ░██░▒██░  ░ ▓██▓ ░ ░██░   ░ ▓██▓ ░ ▒██   ██░▒██   ██░▒██░    
echo ▒██▒   ░██▒▒▒█████▓ ░██████▒▒██▒ ░ ░██░     ▒██▒ ░ ░ ████▓▒░░ ████▓▒░░██████▒
echo  ░ ▒░   ░  ░░▒▓▒ ▒ ▒ ░ ▒░▓  ░▒ ░░   ░▓       ▒ ░░   ░ ▒░▒░▒░ ░ ▒░▒░▒░ ░ ▒░▓  ░
echo ░  ░      ░░░▒░ ░ ░ ░ ░ ▒  ░  ░     ▒ ░       ░      ░ ▒ ▒░   ░ ▒ ▒░ ░ ░ ▒  ░
echo ░      ░    ░░░ ░ ░   ░ ░   ░       ▒ ░     ░      ░ ░ ░ ▒  ░ ░ ░ ▒    ░ ░   
echo        ░      ░         ░  ░        ░                  ░ ░      ░ ░      ░  ░
echo.


                                                                            
echo ╔══════════════════════════════════════════════════════════════════╗
echo ║                                                                  ║
echo ║┍━━━━━━━ ☽【❖】☾ ━━━━━━━┑                                         
echo ║ (1). IP Configuration                                            ║
echo ║ (2). Ping an IP Address                                          ║    
echo ║ (3). Generate Nitro Codes                                        ║
echo ║ (4). URL Shortener                                               ║ 
echo ║ (5). Grab IP Info and Send to Webhook                            ║
echo ║ (6). IP Geo Lookup                                               ║
echo ║ (7). Exit                                                        ║
echo ╚══════════════════════════════════════════════════════════════════╝
set /p choice=Enter your choice: 

if "%choice%"=="1" goto check_ip
if "%choice%"=="2" goto ping_ip
if "%choice%"=="3" goto generate_nitro
if "%choice%"=="4" goto url_shortener
if "%choice%"=="5" goto grabipsendwebhook
if "%choice%"=="6" goto ipgeolookup
if "%choice%"=="7" exit
goto menu

:check_ip
ipconfig
pause
goto menu

:ping_ip
set /p target_ip=Enter the IP address to ping: 
ping %target_ip%
pause
goto menu

:generate_nitro
@echo off
setlocal enabledelayedexpansion
python -c "import random,string;print('\n'.join(['https://discord.gift/' + ''.join(random.choices(string.ascii_uppercase + string.digits, k=16)) for _ in range(10)]))"
pause
goto menu

:url_shortener
set /p url=Enter the URL to shorten: 
echo Shortened URL: http://tinyurl.com/api-create.php?url=%url%
pause
goto menu

:grabipsendwebhook
cls
echo ██████████████████████ Grab IP Info and Send to Webhook ██████████████████████
echo.
set /p webhook=Enter your webhook URL: 

:: Ensure a webhook URL is provided
if "%webhook%"=="" (
    echo Please enter a valid Discord webhook URL.
    pause
    goto menu
)

:: Grab IP info and save it to a file
ipconfig >ip.txt

:: Send the contents of the file to the webhook using curl
curl -X POST -H "Content-Type: application/json" -d "{\"content\":\"IP Configuration:\n\`\`\`$(type ip.txt)\`\`\`\"}" %webhook%

:: Cleanup: Delete the temporary IP file
del ip.txt

echo.
pause
goto menu

:ipgeolookup
cls
echo ██████████████████████ IP Geo Lookup ██████████████████████
echo.
set /p ip=Enter an IP address to lookup: 

:: You can add the code for IP geo lookup here
:: For example, you can use a command like "curl" to fetch geo information for the IP
:: Ensure that you have curl installed and available in your system

:: Example using curl (ensure curl is installed):
curl https://ipinfo.io/%ip%/json

echo.
pause
goto menu