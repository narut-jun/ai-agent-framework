# =============================================================================
# create-project.ps1 — สร้างโปรเจคใหม่จาก template
# Ai-Agent-Framework v1.0.0
# วิธีใช้: .\scripts\create-project.ps1
# =============================================================================

# --- ตั้งค่า encoding สำหรับภาษาไทย ---
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

# --- หา path ของ framework ---
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$frameworkDir = Split-Path -Parent $scriptDir
$templateDir = Join-Path $frameworkDir "templates\project-template"
$configPath = Join-Path $scriptDir "config.json"
$configExamplePath = Join-Path $scriptDir "config.example.json"

# --- ฟังก์ชันช่วย ---
function Write-Header {
    param([string]$text)
    Write-Host ""
    Write-Host "======================================" -ForegroundColor Cyan
    Write-Host "  $text" -ForegroundColor Cyan
    Write-Host "======================================" -ForegroundColor Cyan
    Write-Host ""
}

function Write-Step {
    param([string]$step, [string]$text)
    Write-Host "[$step] " -ForegroundColor Yellow -NoNewline
    Write-Host $text
}

function Write-Success {
    param([string]$text)
    Write-Host "[OK] " -ForegroundColor Green -NoNewline
    Write-Host $text
}

function Write-Err {
    param([string]$text)
    Write-Host "[ERROR] " -ForegroundColor Red -NoNewline
    Write-Host $text
}

# --- ตรวจสอบ config.json ---
function Ensure-Config {
    if (-not (Test-Path $configPath)) {
        Write-Host ""
        Write-Host "  config.json not found" -ForegroundColor Yellow
        Write-Host "  Creating from config.example.json..." -ForegroundColor Yellow

        if (Test-Path $configExamplePath) {
            Copy-Item $configExamplePath $configPath
            Write-Success "config.json created at: $configPath"
            Write-Host "  Edit this file to set your owner info and preferences." -ForegroundColor Gray
        } else {
            # สร้าง config พื้นฐานเลย
            $defaultConfig = @{
                owner = @{
                    name = ""
                    email = ""
                    language = "th"
                }
                paths = @{
                    default_project_dir = (Split-Path -Parent $frameworkDir)
                    framework_dir = "auto"
                }
                ai = @{
                    provider = "none"
                    api_key = ""
                    api_url = ""
                    model = ""
                }
            }
            $defaultConfig | ConvertTo-Json -Depth 4 | Set-Content $configPath -Encoding UTF8
            Write-Success "config.json created with defaults"
        }
        Write-Host ""
    }
    return (Get-Content $configPath -Raw | ConvertFrom-Json)
}

# --- ตรวจสอบ template ---
function Check-Template {
    if (-not (Test-Path $templateDir)) {
        Write-Err "Template not found at: $templateDir"
        Write-Host "  Make sure you run this script from within the Ai-Agent-Framework folder." -ForegroundColor Gray
        exit 1
    }
}

# --- Main ---
Write-Header "Ai-Agent-Framework: Create New Project"

# ตรวจ template
Check-Template

# โหลด config
$config = Ensure-Config

# กำหนด default path
$defaultDir = if ($config.paths.default_project_dir) { $config.paths.default_project_dir } else { Split-Path -Parent $frameworkDir }
$defaultOwner = if ($config.owner.name) { $config.owner.name } else { "" }
$defaultEmail = if ($config.owner.email) { $config.owner.email } else { "" }

# --- ถามข้อมูล ---
Write-Step "1/5" "Project Name (English, a-z 0-9 - _ only)"
$projectName = Read-Host "     Project Name"
if ([string]::IsNullOrWhiteSpace($projectName)) {
    Write-Err "Project name is required!"
    exit 1
}
if ($projectName -match '[^a-zA-Z0-9_\-]') {
    Write-Err "Project name must be alphanumeric (a-z, 0-9, -, _ only). No spaces or special chars."
    exit 1
}

Write-Step "2/5" "Project Path (folder to create)"
Write-Host "     Default: $defaultDir\$projectName" -ForegroundColor Gray
$projectPath = Read-Host "     Path (Enter = default)"
if ([string]::IsNullOrWhiteSpace($projectPath)) {
    $projectPath = Join-Path $defaultDir $projectName
}

Write-Step "3/5" "Project Description (short, Thai or English)"
$projectDesc = Read-Host "     Description"
if ([string]::IsNullOrWhiteSpace($projectDesc)) {
    $projectDesc = $projectName
}

Write-Step "4/5" "Owner Name"
if ($defaultOwner) { Write-Host "     Default: $defaultOwner" -ForegroundColor Gray }
$ownerName = Read-Host "     Owner Name (Enter = default)"
if ([string]::IsNullOrWhiteSpace($ownerName)) { $ownerName = $defaultOwner }

Write-Step "5/5" "Owner Email"
if ($defaultEmail) { Write-Host "     Default: $defaultEmail" -ForegroundColor Gray }
$ownerEmail = Read-Host "     Owner Email (Enter = default)"
if ([string]::IsNullOrWhiteSpace($ownerEmail)) { $ownerEmail = $defaultEmail }

# --- ยืนยัน ---
Write-Host ""
Write-Host "--- Confirm ---" -ForegroundColor Yellow
Write-Host "  Project:     $projectName"
Write-Host "  Path:        $projectPath"
Write-Host "  Description: $projectDesc"
Write-Host "  Owner:       $ownerName ($ownerEmail)"
Write-Host ""
$confirm = Read-Host "  Create project? (y/n)"
if ($confirm -ne "y" -and $confirm -ne "Y") {
    Write-Host "  Cancelled." -ForegroundColor Yellow
    exit 0
}

# --- สร้างโปรเจค ---
Write-Host ""

# ตรวจว่า path ยังไม่มี
if (Test-Path $projectPath) {
    Write-Err "Path already exists: $projectPath"
    exit 1
}

# Copy template
Write-Step "..." "Copying template..."
Copy-Item $templateDir $projectPath -Recurse -Force
Write-Success "Template copied to: $projectPath"

# Replace placeholders ในทุกไฟล์
Write-Step "..." "Replacing placeholders..."
$today = Get-Date -Format "yyyy-MM-dd"
$files = Get-ChildItem $projectPath -Recurse -File -Include "*.md","*.cursorrules","*.windsurfrules","*.clinerules"

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if ($content) {
        $lang = if ($config.owner.language -eq 'th') { 'Thai' } elseif ($config.owner.language -eq 'en') { 'English' } else { $config.owner.language }
        $newContent = $content `
            -replace '\[PROJECT_NAME\]', $projectName `
            -replace '\[PROJECT_DESCRIPTION\]', $projectDesc `
            -replace '\[OWNER_NAME\]', $ownerName `
            -replace '\[OWNER_EMAIL\]', $ownerEmail `
            -replace '\[YYYY-MM-DD\]', $today `
            -replace '\[DOMAIN\]', '(not set)' `
            -replace '\[LANGUAGE\]', $lang `
            -replace '\[DATE\]', $today

        if ($newContent -ne $content) {
            Set-Content $file.FullName $newContent -NoNewline -Encoding UTF8
        }
    }
}
Write-Success "Placeholders replaced in all files"

# อัพเดท knowledge-version.md
$kvPath = Join-Path $projectPath "knowledge-version.md"
if (Test-Path $kvPath) {
    $kvContent = Get-Content $kvPath -Raw
    $kvContent = $kvContent -replace '\[AI_NAME / Manual\]', 'create-project.ps1'
    Set-Content $kvPath $kvContent -NoNewline -Encoding UTF8
}

# --- git init (ถาม) ---
Write-Host ""
$doGit = Read-Host "  Initialize Git repository? (y/n, default=y)"
if ($doGit -ne "n" -and $doGit -ne "N") {
    Push-Location $projectPath
    git init 2>&1 | Out-Null
    git add . 2>&1 | Out-Null
    git commit -m "init: project setup from Ai-Agent-Framework template v1.0.0" 2>&1 | Out-Null
    Pop-Location
    Write-Success "Git initialized + first commit done"
}

# --- สรุป ---
Write-Host ""
Write-Header "Project Created Successfully!"
Write-Host "  Name:  $projectName"
Write-Host "  Path:  $projectPath"
Write-Host ""
Write-Host "  Next steps:" -ForegroundColor Yellow
Write-Host "  1. Open $projectPath in your IDE"
Write-Host "  2. Edit AI_CONTEXT.md to fill in remaining details"
Write-Host "  3. Start building!"
Write-Host ""
