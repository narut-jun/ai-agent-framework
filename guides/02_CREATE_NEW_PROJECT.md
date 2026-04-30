# 🆕 Guide 02: สร้างโปรเจคใหม่

> **ใช้เมื่อ**: ต้องการเริ่มโปรเจคใหม่จาก template  
> **เวลาทำ**: ~10 นาที

---

## วิธีที่ 0: ใช้ Script (แนะนำ ⭐)

```powershell
.\scripts\windows\create-project.ps1
```
Script จะถาม: ชื่อ → path → คำอธิบาย → เจ้าของ → copy template + แก้ placeholder + git init ให้อัตโนมัติ

---

## วิธีที่ 1: ให้ AI ทำ

### ขั้นตอน:
1. เปิด **Ai-Agent-Framework** ใน IDE
2. พิมพ์ให้ AI:

```
CREATE_PROJECT
ชื่อ: [PROJECT_NAME]
path: C:\Users\YourName\Projects\[PROJECT_NAME]
คำอธิบาย: [PROJECT_DESCRIPTION]
domain: [DOMAIN หรือ "ยังไม่มี"]
```

3. AI จะ:
   - Copy template ไปยัง path ที่ระบุ
   - แก้ไข placeholder ทั้งหมด (ชื่อ, คำอธิบาย, domain)
   - เพิ่มโปรเจคในตาราง VERSION.md
   - อัพเดท VERSION.md deployment log

4. **ปิด** Ai-Agent-Framework
5. **เปิด** โปรเจคใหม่ใน IDE (เปิดแยก!)
6. ใน terminal: `git init && git add . && git commit -m "init: from template v1.0.0"`

---

## วิธีที่ 2: ทำเอง (Manual)

### ขั้นตอน:

1. **Copy โฟลเดอร์ template**
```
จาก: Ai-Agent-Framework/templates/project-template/
ไปที่: C:\Users\YourName\Projects\[PROJECT_NAME]\
```

2. **แก้ไข placeholder** ในไฟล์เหล่านี้:

| ไฟล์ | Placeholder ที่ต้องแก้ |
|------|----------------------|
| `AI_CONTEXT.md` | `[PROJECT_NAME]`, `[PROJECT_DESCRIPTION]`, `[DOMAIN]`, `[STACK]` |
| `HANDOFF.md` | `[PROJECT_NAME]`, `[YYYY-MM-DD]`, `[CURRENT_TASK]` |
| `AGENTS.md` | `[PROJECT_NAME]` |
| `CLAUDE.md` | `[PROJECT_NAME]` |
| `GEMINI.md` | `[PROJECT_NAME]` |
| `.cursorrules` | `[PROJECT_NAME]`, `[PROJECT_DESCRIPTION]` |
| `.windsurfrules` | `[PROJECT_NAME]` |
| `.clinerules` | `[PROJECT_NAME]` |
| `.github/copilot-instructions.md` | `[PROJECT_NAME]` |
| `.amazonq/rules/project-context.md` | `[PROJECT_NAME]` |
| `knowledge-version.md` | `[YYYY-MM-DD]` |
| `docs/01_PROJECT_OVERVIEW.md` | `[PROJECT_NAME]`, `[PROJECT_DESCRIPTION]` |
| `skills/owner_profile.md` | `[PROJECT_NAME]` |

3. **ตั้ง Git**
```bash
cd [PROJECT_NAME]
git init
git add .
git commit -m "init: project setup from template v1.0.0"
```

4. **เปิดใน IDE** → ทดสอบว่า AI อ่าน AI_CONTEXT.md ได้

---

## ✅ Checklist หลังสร้าง

- [ ] Placeholder ทั้งหมดถูกแก้ไขแล้ว
- [ ] Git repo initialized
- [ ] IDE อ่าน AI_CONTEXT.md ได้
- [ ] HANDOFF.md มี session แรก
- [ ] knowledge-version.md ระบุ version ที่ใช้

---

## ⚠️ ข้อควรระวัง

- **ห้าม** สร้างโปรเจคใหม่ภายใน Ai-Agent-Framework/ (ต้องเป็น sibling folder)
- **ห้าม** ใช้ pointer ไปอ่าน global โดยตรง (ใช้ snapshot/copy เท่านั้น)
- **ต้อง** บันทึก knowledge-version.md ว่า copy จาก version ไหน
