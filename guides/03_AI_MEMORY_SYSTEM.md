# 🧠 Guide 03: ระบบ AI Memory & Config

> **ใช้เมื่อ**: ต้องการเข้าใจว่าทำไมต้องมีระบบนี้ และมันทำงานอย่างไร  
> **ที่มา**: ออกแบบจาก YourProject session 2026-04-30

---

## ปัญหาที่แก้ไข

```
❌ ก่อนมีระบบนี้:
- เปลี่ยน IDE → AI ลืมทุกอย่าง
- เปลี่ยน Account → ความจำหายหมด
- เริ่มโปรเจคใหม่ → ต้องตั้งค่าใหม่ตั้งแต่ต้น
- AI ทำงานแล้วไม่จด → ข้อมูลหายไปกับ chat

✅ หลังมีระบบนี้:
- เปลี่ยน IDE → AI อ่าน config file ของ IDE นั้น → ชี้ไป AI_CONTEXT.md → ได้ context ครบ
- เปลี่ยน Account → ข้อมูลอยู่ใน project files ไม่ผูกกับ account
- เริ่มโปรเจคใหม่ → copy template แล้วแก้ placeholder
- ทุก session → อัพเดท HANDOFF.md ก่อนจบ
```

---

## 3 ประเภทของ Memory

```
┌─────────────────────────────────────────────────────┐
│  Episodic Memory (สิ่งที่เกิดขึ้น)                   │
│  ├── Raw: .gemini/brain/ (ไม่ portable, ผูก account) │
│  └── Summary: HANDOFF.md (portable! ✅)               │
├─────────────────────────────────────────────────────┤
│  Semantic Memory (ความรู้/กฎ)                        │
│  ├── Global: Ai-Agent-Framework/knowledge/             │
│  └── Project: ProjectName/docs/ + skills/            │
├─────────────────────────────────────────────────────┤
│  Procedural Memory (วิธีทำ)                          │
│  ├── Global: Ai-Agent-Framework/knowledge/skills/      │
│  └── Project: ProjectName/skills/                    │
└─────────────────────────────────────────────────────┘
```

---

## Hub & Spoke Pattern

ทุก AI IDE มี config file ของตัวเอง แต่ทั้งหมดชี้ไปที่ **AI_CONTEXT.md** (Hub):

```
AGENTS.md      ──┐
CLAUDE.md      ──┤
GEMINI.md      ──┤
.cursorrules   ──┼──►  AI_CONTEXT.md (Hub)  ──►  docs/ + skills/
.windsurfrules ──┤           │
.clinerules    ──┤           └──► HANDOFF.md (สถานะปัจจุบัน)
copilot-inst.  ──┤
.amazonq/      ──┘
```

**ทำไมต้องมีหลายไฟล์?** เพราะแต่ละ IDE อ่านไฟล์คนละชื่อ:
- Cursor/Antigravity อ่าน `.cursorrules`
- Claude Code อ่าน `CLAUDE.md`  
- Codex อ่าน `AGENTS.md`
- ฯลฯ

---

## Snapshot vs Pointer (ทำไมใช้ Snapshot)

| | Pointer (อ่านจาก global ตรงๆ) | **Snapshot (copy ตอนสร้าง)** ✅ |
|--|------|------|
| Production safety | ❌ global เปลี่ยน = โปรเจคพัง | ✅ แยกกัน, ไม่กระทบ |
| Version control | ❌ ย้อนยาก | ✅ แต่ละโปรเจค pin version |
| อัพเดทง่าย | ✅ แก้ที่เดียว | ⚠️ ต้อง push ทีละโปรเจค |

**สรุป**: เลือก **Snapshot** เพราะปลอดภัยกว่า — global อัพเดทไม่กระทบโปรเจคที่ deploy ไปแล้ว

---

## ข้อสำคัญ: Global = AI Behavior Only

```
✅ Global knowledge ควรเป็น:           ❌ ห้ามเป็น:
- วิธีสื่อสาร                          - business logic
- naming convention                     - API endpoint
- นโยบาย Free Tier                      - database schema
- วิธีบันทึกเอกสาร                     - code เฉพาะโปรเจค
```

**เหตุผล**: ถ้า global rules มีผลต่อโค้ดโดยตรง → อัพเดท global อาจทำให้โค้ด production พัง
