# ==============================================================================
# FightPort 4 V2 - Script de Mapeamento e Atualização Inteligente do OptiScaler
# ==============================================================================
param(
    [string]$SourcePath = "",
    [object]$AutoDetect = $true,
    [object]$CloseGame = $true,
    [object]$Relaunch = $true
)

# Normalização flexível de parâmetros booleanos
$AutoDetect = if ($AutoDetect -is [bool]) { $AutoDetect } elseif ($AutoDetect -is [System.Management.Automation.SwitchParameter]) { $AutoDetect.IsPresent } else { "$AutoDetect".ToLower() -in @("1", "true", "yes", "sim") }
$CloseGame  = if ($CloseGame -is [bool])  { $CloseGame }  elseif ($CloseGame -is [System.Management.Automation.SwitchParameter])  { $CloseGame.IsPresent }  else { "$CloseGame".ToLower() -in @("1", "true", "yes", "sim") }
$Relaunch   = if ($Relaunch -is [bool])   { $Relaunch }   elseif ($Relaunch -is [System.Management.Automation.SwitchParameter])   { $Relaunch.IsPresent }   else { "$Relaunch".ToLower() -in @("1", "true", "yes", "sim") }

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "       FIGHTPORT 4 V2 - ATUALIZADOR INTELIGENTE DO OPTISCALER          " -ForegroundColor Yellow
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ""

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$GameBin = Join-Path $Root "games\UFC4\bin"
$GameOptiScalerDir = Join-Path $GameBin "OptiScaler"
$LauncherExe = Join-Path $Root "FightPort4.exe"

# 1. Finalizar processos do jogo e emulador se abertos
$ProcessesToKill = @("sacredfire-game", "sacredfire-game.exe", "UFC4", "UFC4.exe", "shadps4", "shadps4.exe")
if ($CloseGame) {
    Write-Host "[1/6] Verificando e finalizando instâncias do jogo em execução..." -ForegroundColor Yellow
    foreach ($p in $ProcessesToKill) {
        $found = Get-Process -Name $p -ErrorAction SilentlyContinue
        if ($found) {
            Write-Host "  -> Fechando processo: $($found.Name) (PID: $($found.Id))..." -ForegroundColor Red
            Stop-Process -InputObject $found -Force -ErrorAction SilentlyContinue
            Start-Sleep -Milliseconds 500
        }
    }
    Write-Host "  Processos finalizados com sucesso." -ForegroundColor Green
}

# 2. Localizar arquivos de atualização
$SourceDir = ""
if ($SourcePath -and (Test-Path $SourcePath)) {
    $SourceDir = $SourcePath
} elseif ($AutoDetect) {
    Write-Host "[2/6] Procurando pastas de atualização do OptiScaler no sistema..." -ForegroundColor Yellow
    $ParentDir = Split-Path -Parent $Root
    $Candidates = Get-ChildItem -Path $ParentDir -Directory -Filter "OptiScaler*" | Sort-Object LastWriteTime -Descending
    if ($Candidates.Count -gt 0) {
        $SourceDir = $Candidates[0].FullName
        Write-Host "  -> Pasta local mais recente encontrada: $SourceDir" -ForegroundColor Cyan
    }
}

# Opção de buscar via GitHub se nenhuma pasta local ou sob solicitação
if (-not $SourceDir -or -not (Test-Path $SourceDir)) {
    Write-Host "  Consultando releases oficiais do GitHub (cdozdil/OptiScaler)..." -ForegroundColor Yellow
    try {
        $rel = Invoke-RestMethod -Uri "https://api.github.com/repos/cdozdil/OptiScaler/releases/latest" -Headers @{"User-Agent"="FightPort4"}
        Write-Host "  -> Versão online mais recente: $($rel.tag_name)" -ForegroundColor Green
        $zipAsset = $rel.assets | Where-Object { $_.name -like "*.zip" -and $_.name -notlike "*sdk*" } | Select-Object -First 1
        if ($zipAsset) {
            $ParentDir = Split-Path -Parent $Root
            $dlZip = Join-Path $ParentDir $zipAsset.name
            $extractTarget = Join-Path $ParentDir ("OptiScaler_" + $rel.tag_name)
            Write-Host "  Baixando $($zipAsset.browser_download_url)..." -ForegroundColor Yellow
            Invoke-WebRequest -Uri $zipAsset.browser_download_url -OutFile $dlZip
            Write-Host "  Extraindo pacote..." -ForegroundColor Yellow
            Expand-Archive -Path $dlZip -DestinationPath $extractTarget -Force
            Remove-Item $dlZip -Force -ErrorAction SilentlyContinue
            $SourceDir = $extractTarget
            Write-Host "  Download concluído com sucesso!" -ForegroundColor Green
        }
    } catch {
        Write-Host "  Não foi possível consultar o GitHub online: $($_.Exception.Message)" -ForegroundColor DarkGray
    }
}

if (-not $SourceDir -or -not (Test-Path $SourceDir)) {
    Write-Host "ATENÇÃO: Nenhuma pasta de atualização foi encontrada automaticamente." -ForegroundColor Yellow
    Write-Host "Digite o caminho completo da pasta com a nova versão do OptiScaler:"
    $InputPath = Read-Host
    if ([string]::IsNullOrWhiteSpace($InputPath) -or -not (Test-Path $InputPath)) {
        Write-Host "Operação cancelada pelo usuário." -ForegroundColor Red
        exit 1
    }
    $SourceDir = $InputPath
}

Write-Host "  Origem validada: $SourceDir" -ForegroundColor Green

# 3. Criar Backup de Segurança Completo
$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$BackupDir = Join-Path $GameBin "backups\OptiScaler_Backup_$Timestamp"
Write-Host "[3/6] Criando backup de segurança dos arquivos atuais em: $BackupDir..." -ForegroundColor Yellow
New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null

$FilesToBackup = @("winmm.dll", "OptiScaler.dll", "OptiScaler.ini", "nvngx.dll_dlssnr.dll", "nvngx.dll", "_nvngx.dll", "nvngx_dlss.dll", "nvngx_dlssd.dll", "nvngx_dlssg.dll", "nvngx_dlssnr.dll", "libxess.dll")
foreach ($f in $FilesToBackup) {
    $srcFile = Join-Path $GameBin $f
    if (Test-Path $srcFile) {
        Copy-Item -Path $srcFile -Destination $BackupDir -Force
        Write-Host "  -> Backup criado: $f" -ForegroundColor DarkGray
    }
}
if (Test-Path $GameOptiScalerDir) {
    Copy-Item -Path $GameOptiScalerDir -Destination (Join-Path $BackupDir "OptiScaler") -Recurse -Force
    Write-Host "  -> Backup criado: pasta OptiScaler\" -ForegroundColor DarkGray
}

# 4. Limpeza de DLLs conflitantes antigas
Write-Host "[4/6] Verificando e limpando arquivos legados..." -ForegroundColor Yellow
$LegacyFiles = @(
    (Join-Path $GameOptiScalerDir "fg_kernels.dll"),
    (Join-Path $GameOptiScalerDir "sr_kernels.dll"),
    (Join-Path $GameOptiScalerDir "xefg_kernels.dll"),
    (Join-Path $GameBin "OptiScaler.asi"),
    (Join-Path $GameBin "nvapi64.dll")
)
foreach ($lf in $LegacyFiles) {
    if (Test-Path $lf) {
        Remove-Item -Path $lf -Force -ErrorAction SilentlyContinue
        Write-Host "  -> Removido arquivo legado: $(Split-Path $lf -Leaf)" -ForegroundColor DarkYellow
    }
}

# 5. Mapeamento e Substituição Restrita de Arquivos do OptiScaler
Write-Host "[5/6] Mapeando e instalando arquivos do OptiScaler..." -ForegroundColor Yellow

# Lista estrita de arquivos permitidos na raiz (NUNCA sobrescreve executáveis ou DLLs do jogo/emulador)
$AllowedRootFiles = @(
    "winmm.dll",
    "OptiScaler.dll",
    "OptiScaler.ini",
    "nvngx.dll_dlssnr.dll",
    "nvngx.dll",
    "_nvngx.dll",
    "nvngx_dlss.dll",
    "nvngx_dlssd.dll",
    "nvngx_dlssg.dll",
    "nvngx_dlssnr.dll",
    "libxess.dll",
    "libxess_dx11.dll",
    "dlssg_to_fsr3_amd_is_better.dll",
    "dlss-enabler-headless.dll"
)

# OptiScaler.dll -> Copia como winmm.dll (loader hook primário) e OptiScaler.dll
$NewOptiDll = Join-Path $SourceDir "OptiScaler.dll"
if (Test-Path $NewOptiDll) {
    $TargetWinmm = Join-Path $GameBin "winmm.dll"
    $TargetOpti = Join-Path $GameBin "OptiScaler.dll"
    Copy-Item -Path $NewOptiDll -Destination $TargetWinmm -Force
    Copy-Item -Path $NewOptiDll -Destination $TargetOpti -Force
    $sz = (Get-Item $NewOptiDll).Length
    Write-Host "  [OK] winmm.dll (hook de inicialização) atualizado ($sz bytes)" -ForegroundColor Green
    Write-Host "  [OK] OptiScaler.dll atualizado ($sz bytes)" -ForegroundColor Green
}

# Copiar outros arquivos permitidos da raiz do pacote de atualização
foreach ($rf in $AllowedRootFiles) {
    if ($rf -in @("winmm.dll", "OptiScaler.dll")) { continue }
    $srcCandidate = Join-Path $SourceDir $rf
    if (Test-Path $srcCandidate) {
        Copy-Item -Path $srcCandidate -Destination (Join-Path $GameBin $rf) -Force
        Write-Host "  [OK] $rf atualizado com sucesso" -ForegroundColor Green
    }
}

# Sincronizar configurações do OptiScaler.ini (garantir LogToFile ativo)
$TargetIni = Join-Path $GameBin "OptiScaler.ini"
if (Test-Path $TargetIni) {
    try {
        (Get-Content $TargetIni) -replace '^LogToFile\s*=.*', 'LogToFile=true' -replace '^LogLevel\s*=.*', 'LogLevel=2' | Set-Content $TargetIni
    } catch {}
}

# Subpasta OptiScaler\ (FFX, XeSS, XeFG, D3D12Core, LUTs, streamline)
$NewOptiDir = Join-Path $SourceDir "OptiScaler"
if (Test-Path $NewOptiDir) {
    if (-not (Test-Path $GameOptiScalerDir)) {
        New-Item -ItemType Directory -Path $GameOptiScalerDir -Force | Out-Null
    }
    
    Get-ChildItem -Path $NewOptiDir -Recurse | ForEach-Object {
        $relPath = $_.FullName.Substring($NewOptiDir.Length).TrimStart("\", "/")
        $targetPath = Join-Path $GameOptiScalerDir $relPath
        if ($_.PSIsContainer) {
            if (-not (Test-Path $targetPath)) { New-Item -ItemType Directory -Path $targetPath -Force | Out-Null }
        } else {
            $parent = Split-Path -Parent $targetPath
            if (-not (Test-Path $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
            Copy-Item -Path $_.FullName -Destination $targetPath -Force
            Write-Host "  -> Sincronizado: OptiScaler\$relPath" -ForegroundColor DarkGray
        }
    }
    Write-Host "  [OK] Subpasta OptiScaler\ sincronizada com sucesso" -ForegroundColor Green
}

# Subpasta Licenses\
$NewLicDir = Join-Path $SourceDir "Licenses"
if (Test-Path $NewLicDir) {
    $TargetLicDir = Join-Path $GameBin "Licenses"
    if (-not (Test-Path $TargetLicDir)) { New-Item -ItemType Directory -Path $TargetLicDir -Force | Out-Null }
    Copy-Item -Path (Join-Path $NewLicDir "*") -Destination $TargetLicDir -Recurse -Force
    Write-Host "  [OK] Arquivos de licença atualizados" -ForegroundColor DarkGray
}



Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "           ATUALIZAÇÃO DO OPTISCALER CONCLUÍDA COM SUCESSO!            " -ForegroundColor Green
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ""

if ($Relaunch) {
    Write-Host "[6/6] Reiniciando o FightPort 4 Launcher..." -ForegroundColor Yellow
    Start-Sleep -Seconds 1
    if (Test-Path $LauncherExe) {
        Start-Process -FilePath $LauncherExe
        Write-Host "  -> Launcher reiniciado!" -ForegroundColor Green
    }
}
