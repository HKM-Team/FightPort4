@echo off
setlocal
chcp 65001 >nul
title FightPort 4 V2 - Atualizador Inteligente do OptiScaler
color 0B

echo ==============================================================================
echo        FIGHTPORT 4 V2 - SISTEMA INTELIGENTE DE ATUALIZACAO DO OPTISCALER
echo ==============================================================================
echo.

set "SCRIPT_DIR=%~dp0"
set "ROOT_DIR=%SCRIPT_DIR%.."

echo [1/3] Verificando e finalizando processos do jogo...
taskkill /F /IM sacredfire-game.exe /IM UFC4.exe /IM shadps4.exe 2>nul
echo Processos verificados com sucesso.
echo.

echo [2/3] Iniciando atualizacao dos arquivos do OptiScaler...
echo.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%update_optiscaler.ps1" %*

echo.
echo ==============================================================================
echo Operacao concluida. O terminal sera fechado em 4 segundos...
echo ==============================================================================
ping -n 4 127.0.0.1 >nul
exit /b 0
