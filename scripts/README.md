# 📁 scripts/ — เครื่องมือสำหรับ Ai-Agent-Framework

> รวม scripts ที่ช่วยให้ใช้งาน framework ได้ง่ายขึ้น  
> รันจาก command line โดยไม่ต้องเปิด IDE  
> 🔄 **รองรับ Cross-Platform**: มีโฟลเดอร์แยกสำหรับ Windows และ Mac/Linux

---

## ⚡ Quick Start

### สำหรับ Windows (PowerShell)
```powershell
# สร้างโปรเจคใหม่
.\scripts\windows\create-project.ps1

# ดูสถานะระบบ
.\scripts\windows\show-status.ps1
```

### สำหรับ Mac / Linux (Bash)
```bash
# สร้างโปรเจคใหม่
./scripts/mac-linux/create-project.sh

# ดูสถานะระบบ
./scripts/mac-linux/show-status.sh
```

---

## 📋 โครงสร้างโฟลเดอร์ Scripts

| โฟลเดอร์/ไฟล์ | หน้าที่ |
|--------------|---------|
| `windows/` | Scripts สำหรับ Windows PowerShell (`.ps1`) |
| `mac-linux/` | Scripts สำหรับ macOS และ Linux (`.sh`) |
| `config.example.json` | ตัวอย่าง config (copy เป็น `config.json` แล้วใส่ค่าจริง) |

---

## ⚙️ ตั้งค่า config.json

1. Script จะสร้าง `config.json` ให้อัตโนมัติเมื่อรันครั้งแรก
2. หรือ copy เอง: `copy config.example.json config.json`
3. แก้ไขค่าใน `config.json` ตามจริง

### AI Provider ที่รองรับ

| Provider | api_url | ค่าใช้จ่าย | หมายเหตุ |
|----------|---------|:----------:|---------|
| `none` | — | ฟรี | ไม่ใช้ AI API (แค่ copy template) |
| `gemini` | googleapis.com | ฟรี/ถูก | แนะนำ: gemini-2.0-flash |
| `claude` | anthropic.com | มีค่าใช้จ่าย | claude-sonnet |
| `openai` | openai.com | มีค่าใช้จ่าย | gpt-4o-mini |
| `ollama` | localhost:11434 | **ฟรี 100%** | ต้องติดตั้ง Ollama + โหลด model |

### ใช้ Ollama (ฟรี 100%):
```
1. ติดตั้ง: https://ollama.com
2. โหลด model: ollama pull llama3
3. ตั้งค่า config.json:
   "provider": "ollama"
   "api_url": "http://localhost:11434/api"
   "model": "llama3"
```

---

## 🔒 ความปลอดภัย

> ⚠️ `config.json` มี API key → **ห้ามอัพขึ้น Git!**  
> ไฟล์นี้อยู่ใน `.gitignore` แล้ว  
> ใช้ `config.example.json` เป็น template แทน

> 🚨 **Google Drive Warning**: ถ้า framework อยู่ใน Google Drive  
> `config.json` จะ **sync ขึ้น cloud อัตโนมัติ!**  
> ถ้าใส่ API key → ควรใช้ **environment variable** แทน  
> หรือเก็บ `config.json` ไว้ **นอก Google Drive**
