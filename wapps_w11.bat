@echo off
chcp 65001 >nul

:: ======================================================
::  Script de instalação básica para Windows 11 (20 apps)
::  Usa o Windows Package Manager (winget)
:: ======================================================

:: Auto-elevar se nao estiver em modo administrador (fltmc falha sem admin)
fltmc >nul 2>&1
if %errorlevel% NEQ 0 (
    echo.
    echo  [!] A pedir permissao de administrador...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    if %errorlevel% NEQ 0 (
        echo  [!] Elevacao cancelada ou falhou. Executa manualmente como admin.
        pause
    )
    exit /b
)

:: Verificar se o winget existe
where winget >nul 2>&1
if %errorlevel% NEQ 0 (
    echo.
    echo  [!] O Windows Package Manager (winget) nao foi encontrado.
    echo      Garante que tens o "App Installer" instalado pela Microsoft Store.
    echo.
    pause
    exit /b 1
)

:MENU
cls
echo ======================================================
echo            PACK BASICO WINDOWS 11 (WINGET)
echo ======================================================
echo.
echo  1 - Instalar TUDO (20 apps recomendadas)
echo  2 - Escolher apps uma a uma
echo  3 - Atualizar todas as apps instaladas (winget upgrade --all)
echo  0 - Sair
echo.
set /p OPCAO="Escolhe uma opcao: "

if "%OPCAO%"=="1" goto INSTALL_ALL
if "%OPCAO%"=="2" goto MENU_APPS
if "%OPCAO%"=="3" goto UPGRADE_ALL
if "%OPCAO%"=="0" goto FIM
goto MENU

:: -----------------------------
::  INSTALAR PACK COMPLETO
:: -----------------------------
:INSTALL_ALL
call :APP_01
call :APP_02
call :APP_03
call :APP_04
call :APP_05
call :APP_06
call :APP_07
call :APP_08
call :APP_09
call :APP_10
call :APP_11
call :APP_12
call :APP_13
call :APP_14
call :APP_15
call :APP_16
call :APP_17
call :APP_18
call :APP_19
call :APP_20
echo.
echo  [OK] Pack completo instalado (ou ja estava instalado).
pause
goto MENU

:: -----------------------------
::  MENU INDIVIDUAL
:: -----------------------------
:MENU_APPS
cls
echo ======================================================
echo             INSTALAR APPS INDIVIDUAIS
echo ======================================================
echo  1  - Google Chrome
echo  2  - Mozilla Firefox
echo  3  - 7-Zip
echo  4  - VLC Media Player
echo  5  - SumatraPDF
echo  6  - Notepad++
echo  7  - Spotify
echo  8  - Discord
echo  9  - WhatsApp Desktop
echo 10  - OBS Studio
echo 11  - ImageGlass (visualizador de imagens)
echo 12  - Microsoft PowerToys
echo 13  - Everything (pesquisa instantanea)
echo 14  - LibreOffice
echo 15  - CrystalDiskInfo (saude do disco)
echo 16  - Steam
echo 17  - Zoom
echo 18  - ShareX (capturas de ecran)
echo 19  - GIMP (editor de imagem)
echo 20  - Slack
echo  0  - Voltar ao menu principal
echo.
set /p APP="Escolhe o numero da app: "

if "%APP%"=="0"  goto MENU
if "%APP%"=="1"  call :APP_01 & goto MENU_APPS
if "%APP%"=="2"  call :APP_02 & goto MENU_APPS
if "%APP%"=="3"  call :APP_03 & goto MENU_APPS
if "%APP%"=="4"  call :APP_04 & goto MENU_APPS
if "%APP%"=="5"  call :APP_05 & goto MENU_APPS
if "%APP%"=="6"  call :APP_06 & goto MENU_APPS
if "%APP%"=="7"  call :APP_07 & goto MENU_APPS
if "%APP%"=="8"  call :APP_08 & goto MENU_APPS
if "%APP%"=="9"  call :APP_09 & goto MENU_APPS
if "%APP%"=="10" call :APP_10 & goto MENU_APPS
if "%APP%"=="11" call :APP_11 & goto MENU_APPS
if "%APP%"=="12" call :APP_12 & goto MENU_APPS
if "%APP%"=="13" call :APP_13 & goto MENU_APPS
if "%APP%"=="14" call :APP_14 & goto MENU_APPS
if "%APP%"=="15" call :APP_15 & goto MENU_APPS
if "%APP%"=="16" call :APP_16 & goto MENU_APPS
if "%APP%"=="17" call :APP_17 & goto MENU_APPS
if "%APP%"=="18" call :APP_18 & goto MENU_APPS
if "%APP%"=="19" call :APP_19 & goto MENU_APPS
if "%APP%"=="20" call :APP_20 & goto MENU_APPS
goto MENU_APPS

:: -----------------------------
::  FUNCOES DE INSTALACAO
:: -----------------------------
:INSTALL
echo.
echo  ==^> %~2
winget install -e --id %1 --accept-source-agreements --accept-package-agreements
echo.
goto :eof

:APP_01
call :INSTALL Google.Chrome "Google Chrome"
goto :eof

:APP_02
call :INSTALL Mozilla.Firefox "Mozilla Firefox"
goto :eof

:APP_03
call :INSTALL 7zip.7zip "7-Zip"
goto :eof

:APP_04
call :INSTALL VideoLAN.VLC "VLC Media Player"
goto :eof

:APP_05
call :INSTALL SumatraPDF.SumatraPDF "SumatraPDF (leitor PDF leve)"
goto :eof

:APP_06
call :INSTALL Notepad++.Notepad++ "Notepad++ (editor de texto)"
goto :eof

:APP_07
call :INSTALL Spotify.Spotify "Spotify"
goto :eof

:APP_08
call :INSTALL Discord.Discord "Discord"
goto :eof

:APP_09
call :INSTALL WhatsApp.WhatsApp "WhatsApp Desktop"
goto :eof

:APP_10
call :INSTALL OBSProject.OBSStudio "OBS Studio"
goto :eof

:APP_11
call :INSTALL DuongDieuPhap.ImageGlass "ImageGlass"
goto :eof

:APP_12
call :INSTALL Microsoft.PowerToys "Microsoft PowerToys"
goto :eof

:APP_13
call :INSTALL voidtools.Everything "Everything (pesquisa ficheiros)"
goto :eof

:APP_14
call :INSTALL TheDocumentFoundation.LibreOffice "LibreOffice"
goto :eof

:APP_15
call :INSTALL CrystalDewWorld.CrystalDiskInfo "CrystalDiskInfo (saude do disco)"
goto :eof

:APP_16
call :INSTALL Valve.Steam "Steam"
goto :eof

:APP_17
call :INSTALL Zoom.Zoom "Zoom"
goto :eof

:APP_18
call :INSTALL ShareX.ShareX "ShareX (capturas de ecran)"
goto :eof

:APP_19
call :INSTALL GIMP.GIMP "GIMP (editor de imagem)"
goto :eof

:APP_20
call :INSTALL SlackTechnologies.Slack "Slack"
goto :eof

:: -----------------------------
::  UPGRADE DE TODAS AS APPS
:: -----------------------------
:UPGRADE_ALL
echo.
echo  [*] A atualizar todas as apps geridas pelo winget...
winget upgrade --all --accept-source-agreements --accept-package-agreements
echo.
pause
goto MENU

:FIM
echo.
echo  Feito. Fecha a janela ou carrega numa tecla para sair.
pause >nul
exit /b 0
