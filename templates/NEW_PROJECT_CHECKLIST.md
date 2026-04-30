# ✅ NEW_PROJECT_CHECKLIST.md — เริ่มโปรเจคใหม่

> อ่านและทำตาม checklist นี้ทุกครั้งเมื่อเริ่มโปรเจคใหม่

---

## ⚡ TL;DR

### วิธีที่ 1: ใช้ Script (แนะนำ ⭐)
```powershell
.\scripts\windows\create-project.ps1
# Script จะถามชื่อ, path, คำอธิบาย + copy template + แก้ placeholder + git init ให้อัตโนมัติ
```

### วิธีที่ 2: Manual
```
1. Copy templates/project-template/ → ProjectName/
2. แก้ไข placeholder ใน AI_CONTEXT.md และไฟล์ docs/ ทั้งหมด
3. git init + git add . + git commit
4. เริ่มทำงาน!
```

---

## 📋 Checklist ละเอียด

### Phase A: Setup Files (ข้ามได้ถ้าใช้ create-project.ps1 แล้ว)
- [ ] Copy `Ai-Agent-Framework/templates/project-template/` → `../ProjectName/`
- [ ] แก้ไข `AI_CONTEXT.md` — ชื่อโปรเจค, domain, stack, เจ้าของ
- [ ] แก้ไข `HANDOFF.md` — ล้าง session log เก่า, ใส่ "เพิ่งเริ่มโปรเจค"
- [ ] แก้ไข `docs/01_PROJECT_OVERVIEW.md` — ภาพรวมโปรเจค
- [ ] แก้ไข `docs/02_ARCHITECTURE_AND_STACK.md` — stack ที่เลือก
- [ ] แก้ไข `docs/04_ROADMAP_AND_TASKS.md` — เป้าหมายและ milestone

### Phase B: Version Control
- [ ] `git init` ใน ProjectName/
- [ ] ตรวจสอบ `.gitignore` ให้ครอบคลุม (node_modules, .env, secrets)
- [ ] `git add .` + `git commit -m "init: project setup from template v1.0.0"`
- [ ] สร้าง GitHub repo (ถ้าต้องการ) + `git push`

### Phase C: AI Collaboration Setup
- [ ] ยืนยันว่าไฟล์ต่อไปนี้มีครบ:
  - [ ] `AGENTS.md` (Codex)
  - [ ] `CLAUDE.md` (Claude Code)
  - [ ] `GEMINI.md` (Gemini CLI)
  - [ ] `.cursorrules` (Cursor/Antigravity)
  - [ ] `.windsurfrules` (Windsurf)
  - [ ] `.clinerules` (Cline)
  - [ ] `.github/copilot-instructions.md` (Copilot)
  - [ ] `.amazonq/rules/project-context.md` (Amazon Q)
- [ ] ทดสอบเปิดโปรเจคใน IDE → AI ต้องอ่าน AI_CONTEXT.md ได้

### Phase D: ก่อนเริ่มทำงานจริง
- [ ] AI อ่าน `HANDOFF.md` แล้ว (รู้สถานะโปรเจค)
- [ ] AI อ่าน `skills/owner_profile.md` แล้ว (รู้ตัวตนเจ้าของ)
- [ ] กำหนด milestone แรกใน `docs/04_ROADMAP_AND_TASKS.md`

---

## 📝 Template Version ที่ใช้

| รายการ | ค่า |
|--------|-----|
| **Template Version** | v1.0.0 |
| **สร้างจาก** | Ai-Agent-Framework |
| **วันที่ copy** | (ใส่วันที่ copy) |
| **Global Version** | (ดู git tag ใน Ai-Agent-Framework) |

> **หมายเหตุ**: บันทึก template version ไว้เพื่อให้รู้ว่าโปรเจคนี้ใช้ global knowledge เวอร์ชันไหน
> เมื่อ global อัพเดท สามารถเลือก pull version ใหม่มาแทนที่ได้ถ้าต้องการ
