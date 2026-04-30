# =============================================================================
# show-status.ps1 — แสดงสถานะระบบ Ai-Agent-Framework
# วิธีใช้: .\scripts\show-status.ps1
# =============================================================================

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$frameworkDir = Split-Path -Parent $scriptDir

function Write-Header {
    param([string]$text)
    Write-Host ""
    Write-Host "======================================" -ForegroundColor Cyan
    Write-Host "  $text" -ForegroundColor Cyan
    Write-Host "======================================" -ForegroundColor Cyan
}

# --- Framework Info ---
Write-Header "Ai-Agent-Framework Status"

# อ่าน VERSION.md
$versionFile = Join-Path $frameworkDir "VERSION.md"
if (Test-Path $versionFile) {
    $vContent = Get-Content $versionFile -Raw
    if ($vContent -match 'Framework Version.*?\|\s*(v[\d.]+)') { 
        Write-Host "  Framework Version: $($Matches[1])" -ForegroundColor Green
    }
    if ($vContent -match 'Knowledge Version.*?\|\s*(v[\d.]+)') {
        Write-Host "  Knowledge Version: $($Matches[1])" -ForegroundColor Green
    }
}

# --- Knowledge Files ---
Write-Host ""
Write-Host "  Knowledge Files:" -ForegroundColor Yellow

$knowledgeDir = Join-Path $frameworkDir "knowledge"
$subDirs = @("global-rules", "patterns", "skills")
foreach ($sub in $subDirs) {
    $dir = Join-Path $knowledgeDir $sub
    if (Test-Path $dir) {
        $count = (Get-ChildItem $dir -File -Filter "*.md" -ErrorAction SilentlyContinue | Measure-Object).Count
        $icon = if ($count -gt 0) { "[+]" } else { "[ ]" }
        Write-Host "    $icon $sub/: $count files" -ForegroundColor $(if ($count -gt 0) { "Green" } else { "Gray" })
    }
}

# --- Brain Inbox ---
Write-Host ""
Write-Host "  Brain Inbox:" -ForegroundColor Yellow

$inboxDir = Join-Path $frameworkDir "brain-inbox"
$pendingDir = Join-Path $inboxDir "pending-review"
$approvedDir = Join-Path $inboxDir "approved"
$rejectedDir = Join-Path $inboxDir "rejected"

$pendingCount = if (Test-Path $pendingDir) { (Get-ChildItem $pendingDir -File -ErrorAction SilentlyContinue | Measure-Object).Count } else { 0 }
$approvedCount = if (Test-Path $approvedDir) { (Get-ChildItem $approvedDir -File -ErrorAction SilentlyContinue | Measure-Object).Count } else { 0 }
$rejectedCount = if (Test-Path $rejectedDir) { (Get-ChildItem $rejectedDir -File -ErrorAction SilentlyContinue | Measure-Object).Count } else { 0 }

$pendingColor = if ($pendingCount -gt 0) { "Yellow" } else { "Gray" }
Write-Host "    Pending Review: $pendingCount" -ForegroundColor $pendingColor
Write-Host "    Approved:       $approvedCount" -ForegroundColor Gray
Write-Host "    Rejected:       $rejectedCount" -ForegroundColor Gray

# --- Projects ---
Write-Host ""
Write-Host "  Projects (sibling folders):" -ForegroundColor Yellow

# --- แสดงเฉพาะ sibling ที่ไม่ใช่ framework เอง ---
$projectsDir = Split-Path -Parent $frameworkDir
$siblings = Get-ChildItem $projectsDir -Directory | Where-Object { $_.Name -ne "Ai-Agent-Framework" }

foreach ($sibling in $siblings) {
    $hasContext = Test-Path (Join-Path $sibling.FullName "AI_CONTEXT.md")
    $hasHandoff = Test-Path (Join-Path $sibling.FullName "HANDOFF.md")
    
    if ($hasContext) {
        $icon = "[ Framework Project ]"
        $color = "Green"
    } else {
        $icon = "[ Other ]"
        $color = "Gray"
    }
    Write-Host "    $icon $($sibling.Name)" -ForegroundColor $color
}

# --- Config ---
Write-Host ""
Write-Host "  Config:" -ForegroundColor Yellow
$configPath = Join-Path $scriptDir "config.json"
if (Test-Path $configPath) {
    $cfg = Get-Content $configPath -Raw | ConvertFrom-Json
    Write-Host "    Owner: $($cfg.owner.name)" -ForegroundColor Green
    Write-Host "    AI Provider: $($cfg.ai.provider)" -ForegroundColor $(if ($cfg.ai.provider -eq "none") { "Gray" } else { "Green" })
} else {
    Write-Host "    config.json: not found (run create-project.ps1 to create)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""
