# ============================================================================
# MängelLog — Automatisierter Submission Checklist Runner
# Fuehrt alle 10 Tests aus und gibt einen strukturierten Bericht aus.
#
# Verwendung:
#   .\run_tests.ps1                          # Erster verbundener Device
#   .\run_tests.ps1 -DeviceId emulator-5554  # Bestimmter Emulator
#   .\run_tests.ps1 -ListDevices             # Zeigt verfuegbare Geraete
# ============================================================================

param(
    [string]$DeviceId = "",
    [switch]$ListDevices
)

$env:JAVA_HOME          = 'C:\jdk17'
$env:ANDROID_HOME       = 'C:\Users\User\AppData\Local\Android\Sdk'
$env:ANDROID_SDK_ROOT   = 'C:\Users\User\AppData\Local\Android\Sdk'
$env:PATH               = 'C:\jdk17\bin;C:\Users\User\.puro\bin;C:\Users\User\.puro\envs\stable\flutter\bin;' + $env:PATH
$puro = 'C:\Users\User\AppData\Local\Microsoft\WinGet\Packages\pingbird.Puro_Microsoft.Winget.Source_8wekyb3d8bbwe\puro.exe'

Set-Location $PSScriptRoot

# ── Geraete auflisten ────────────────────────────────────────────────────────
if ($ListDevices) {
    Write-Host ""
    Write-Host "Verfuegbare Geraete:" -ForegroundColor Cyan
    & $puro flutter devices
    Write-Host ""
    Write-Host "Verwendung: .\run_tests.ps1 -DeviceId <ID>" -ForegroundColor Yellow
    exit 0
}

# ── Geraeteflag bauen ────────────────────────────────────────────────────────
$deviceFlag = @()
if ($DeviceId -ne "") {
    $deviceFlag = @("-d", $DeviceId)
    Write-Host "Zielgeraet: $DeviceId" -ForegroundColor Cyan
} else {
    Write-Host "Zielgeraet: erster verfuegbarer Device" -ForegroundColor Cyan
}

# ── Header ───────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "======================================================" -ForegroundColor Magenta
Write-Host "  MaengelLog — Submission Checklist Tests" -ForegroundColor Magenta
Write-Host "  $(Get-Date -Format 'dd.MM.yyyy HH:mm')" -ForegroundColor Magenta
Write-Host "======================================================" -ForegroundColor Magenta
Write-Host ""

# ── flutter pub get ──────────────────────────────────────────────────────────
Write-Host ">>> flutter pub get..." -ForegroundColor Gray
& $puro flutter pub get *>&1 | Where-Object { $_ -match "^(Got|Resolving|Downloading)" }

# ── Tests ausfuehren ─────────────────────────────────────────────────────────
Write-Host ""
Write-Host ">>> Starte Integration Tests..." -ForegroundColor Yellow
Write-Host ""

$startTime = Get-Date

$testOutput = & $puro flutter test @deviceFlag `
    integration_test/submission_checklist_test.dart `
    --reporter expanded `
    *>&1

$exitCode  = $LASTEXITCODE
$duration  = [math]::Round(((Get-Date) - $startTime).TotalSeconds, 1)

# ── Ausgabe verarbeiten ───────────────────────────────────────────────────────
$passed  = @()
$failed  = @()
$skipped = @()

foreach ($line in $testOutput) {
    $lineStr = "$line"
    Write-Host $lineStr

    if ($lineStr -match '✅ PASS: (.+)')     { $passed  += $Matches[1] }
    if ($lineStr -match '\[E\]|FAILED|Error') { $failed += $lineStr }
}

# ── Ergebnisbericht ───────────────────────────────────────────────────────────
Write-Host ""
Write-Host "======================================================" -ForegroundColor Magenta
Write-Host "  TESTERGEBNIS" -ForegroundColor Magenta
Write-Host "======================================================" -ForegroundColor Magenta
Write-Host "  Dauer:       ${duration}s"
Write-Host "  Bestanden:   $($passed.Count)" -ForegroundColor Green
Write-Host "  Fehlerhaft:  $($failed.Count)" -ForegroundColor $(if ($failed.Count -gt 0) { 'Red' } else { 'Green' })
Write-Host ""

# Einzelne bestandene Tests auflisten
if ($passed.Count -gt 0) {
    Write-Host "  Bestandene Tests:" -ForegroundColor Green
    foreach ($p in $passed) {
        Write-Host "    ✅  $p" -ForegroundColor Green
    }
    Write-Host ""
}

# Fehlgeschlagene Tests
if ($failed.Count -gt 0) {
    Write-Host "  FEHLER:" -ForegroundColor Red
    foreach ($f in $failed) {
        Write-Host "    ❌  $f" -ForegroundColor Red
    }
    Write-Host ""
}

# Gesamtstatus
if ($exitCode -eq 0) {
    Write-Host "  >>> ALLE TESTS BESTANDEN — App ist release-ready!" -ForegroundColor Green
    Write-Host ""
    Write-Host "  Naechste Schritte:" -ForegroundColor Cyan
    Write-Host "    1. AAB hochladen: build\app\outputs\bundle\release\app-release.aab"
    Write-Host "    2. In-App-Produkt anlegen: maengellog_pdf_lifetime"
    Write-Host "    3. AdMob Test-IDs durch echte ersetzen"
    Write-Host "    4. Store-Listing befuellen (store_assets\play_console_metadata.json)"
} else {
    Write-Host "  >>> TESTS FEHLGESCHLAGEN — Bitte Fehler beheben" -ForegroundColor Red
    Write-Host ""
    Write-Host "  Tipps:" -ForegroundColor Yellow
    Write-Host "    - Emulator auf Deutsch stellen: Settings > Language > Deutsch"
    Write-Host "    - Sicherstellen dass kein anderer Flutter-Prozess laeuft"
    Write-Host "    - Detailliert: flutter test --reporter verbose"
}

Write-Host "======================================================" -ForegroundColor Magenta
Write-Host ""

exit $exitCode
