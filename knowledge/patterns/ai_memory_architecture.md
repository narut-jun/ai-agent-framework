# 🧠 AI Memory Architecture Pattern

> **Pattern สำหรับออกแบบระบบ AI Config/Memory ที่ portable ข้าม IDE/Account**  
> สร้างโดย: Narut | อัพเดทล่าสุด: 2026-05-01 | Knowledge v1.0.0

---

## 📌 ปัญหาที่แก้

| ปัญหา | วิธีแก้ |
|-------|--------|
| AI ลืมทุกอย่างเมื่อเปลี่ยน session | `HANDOFF.md` — Episodic Memory ที่ persist ข้าม session |
| เปลี่ยน IDE แล้วเสียบริบททั้งหมด | **Hub & Spoke Pattern** — config files ชี้มาที่ `AI_CONTEXT.md` |
| ไม่มีมาตรฐานโครงสร้างโปรเจค | **Project Template** พร้อม IDE config ครบ 8 ตัว |
| Knowledge กระจายตามโปรเจค | **Centralized Knowledge** + version control |
| AI ไม่รู้จัก preference เจ้าของ | **Owner Profile + Global Rules** ข้ามทุกโปรเจค |

---

## 🏗️ Hub & Spoke Pattern

```
     AGENTS.md ─────┐
     CLAUDE.md ─────┤
     GEMINI.md ─────┤
  .cursorrules ─────┼──→ AI_CONTEXT.md ──→ docs/ + skills/
.windsurfrules ─────┤         (Hub)          (ข้อมูลจริง)
   .clinerules ─────┤
copilot-inst.  ─────┤
.amazonq/rules ─────┘
```

### หลักการ:
1. **AI_CONTEXT.md** เป็น Hub — มีลำดับเอกสารที่ต้องอ่าน
2. **IDE config files** เป็น Spoke — แค่ชี้ไปที่ Hub
3. ข้อมูลจริงอยู่ใน **docs/** และ **skills/** เท่านั้น

### ข้อดี:
- แก้ไขที่เดียว (`AI_CONTEXT.md`) → ทุก IDE ได้ข้อมูลเดียวกัน
- ไม่ต้อง sync ข้อมูลข้ามไฟล์
- เปลี่ยน IDE ได้ทันที ไม่เสียบริบท

---

## 📚 Memory Layers

```
Layer 1: System Prompt (ไม่แก้ได้ — แต่ละ IDE กำหนดเอง)
    ↓
Layer 2: User Rules (IDE settings — ผูกกับ account)
    ↓  
Layer 3: Knowledge Items (Smart Memory — ผูกกับ account)
    ↓
Layer 4: Conversation History (ผูกกับ account)
    ↓
Layer 5: Project Files ← ★ PORTABLE! อยู่ตรงนี้
         (.cursorrules, AI_CONTEXT.md, docs/, skills/)
```

> ⚠️ **Layer 2-4 หายเมื่อเปลี่ยน IDE/Account**  
> ดังนั้น **ข้อมูลสำคัญทั้งหมดต้องอยู่ใน Layer 5 (Project Files)**

---

## 🔄 Memory Types ที่ Implement

| Memory Type | AI Term | ไฟล์ที่เก็บ | ลักษณะ |
|------------|---------|-----------|--------|
| **Episodic** | Session memory | `HANDOFF.md` | สรุป session ล่าสุด, สถานะ, สิ่งที่ค้าง |
| **Semantic** | Factual knowledge | `docs/`, `skills/` | ข้อเท็จจริงเกี่ยวกับโปรเจค |
| **Procedural** | How-to knowledge | `docs/05_AI_GUIDELINES.md` | วิธีการทำงาน, กฎ, ขั้นตอน |
| **Identity** | Owner knowledge | `skills/owner_profile.md` | ตัวตน, ความต้องการ, preference |

---

## 🗂️ Snapshot vs Pointer

ใช้ **Snapshot Pattern** เท่านั้น:

| วิธี | อธิบาย | ใช้ไหม? |
|------|-------|:------:|
| **Snapshot** | Copy knowledge เข้าโปรเจค (อิสระ) | ✅ ใช้ |
| **Pointer** | โปรเจคชี้ไปที่ centralized knowledge | ❌ ไม่ใช้ |

### เหตุผล:
- Snapshot = โปรเจคทำงานได้ด้วยตัวเอง ไม่ต้องพึ่งพา framework
- Deploy ปลอดภัย — ไม่มี breaking change จาก knowledge update
- Git clone มาก็ใช้ได้ทันที

---

## 🔧 วิธีใช้ Pattern นี้ในโปรเจคใหม่

1. ใช้ `scripts/windows/create-project.ps1` หรือ `scripts/mac-linux/create-project.sh`
2. Script จะ copy template + replace placeholders ให้อัตโนมัติ
3. เปิด IDE → AI อ่าน config file → ชี้ไป AI_CONTEXT.md → เข้าใจโปรเจคทันที
4. ก่อนปิด IDE → บอก AI ว่า "อัพเดท HANDOFF.md" → session ถัดไปจะต่อเนื่อง

---

## 📋 IDE Config Coverage

| # | ไฟล์ | สำหรับ IDE |
|---|------|-----------|
| 1 | `AI_CONTEXT.md` | ⭐ ทุก IDE (Hub) |
| 2 | `AGENTS.md` | OpenAI Codex |
| 3 | `CLAUDE.md` | Claude Code/CLI |
| 4 | `GEMINI.md` | Gemini CLI |
| 5 | `.cursorrules` | Cursor / Antigravity |
| 6 | `.windsurfrules` | Windsurf |
| 7 | `.clinerules` | Cline / Roo |
| 8 | `.github/copilot-instructions.md` | GitHub Copilot |
| 9 | `.amazonq/rules/project-context.md` | Amazon Q Developer |
