# 🧠 AI_CONTEXT.md — [PROJECT_NAME]

> **🚨 AI: อ่าน HANDOFF.md ก่อนไฟล์นี้เสมอ!**  
> **Template Version**: v1.0.0 (จาก Ai-Agent-Framework)  
> **Global Knowledge Version**: v1.0.0  
> **อัพเดทล่าสุด**: [YYYY-MM-DD]

---

## 🚨 คำสั่งแรก: อ่านตามลำดับ

0. 🔄 `HANDOFF.md` — **อ่านก่อนเลย!** สถานะปัจจุบัน + สิ่งที่ยังค้าง
1. ⭐ `docs/05_AI_GUIDELINES.md` — กฎ กติกา ข้อปฏิบัติ
2. 👤 `skills/owner_profile.md` — ตัวตนเจ้าของ
3. 📋 `docs/01_PROJECT_OVERVIEW.md` — ภาพรวมโปรเจค
4. 🗺️ `docs/04_ROADMAP_AND_TASKS.md` — ตอนนี้ทำถึงไหน
5. 🏗️ `docs/02_ARCHITECTURE_AND_STACK.md` — สถาปัตยกรรม
6. 🗄️ `docs/03_DATABASE_SCHEMA.md` — โครงสร้างข้อมูล

---

## 📌 Project Identity

| รายการ | ข้อมูล |
|--------|--------|
| **ชื่อโปรเจค** | [PROJECT_NAME] |
| **คำอธิบาย** | [PROJECT_DESCRIPTION] |
| **เวอร์ชัน** | 0.1.0 |
| **สถานะ** | 🟡 Phase 1: Planning |
| **เจ้าของ** | [OWNER_NAME] ([OWNER_EMAIL]) |
| **โดเมน** | [DOMAIN] |
| **Stack** | [STACK — ยังไม่ตัดสินใจ] |

---

## ⚡ Global Rules (ใช้ทุกโปรเจค)

1. 🗣️ **ภาษา**: สื่อสารเป็นไทย | โค้ดเป็นอังกฤษ | comment โค้ดเป็นไทย
2. 💰 **ค่าใช้จ่าย**: FREE TIER เท่านั้น
3. 🔒 **ความปลอดภัย**: ห้ามเก็บ secrets ในโค้ด
4. 📝 **บันทึก**: ข้อมูลใหม่จากเจ้าของ → บันทึกลงเอกสารทันที
5. 🔄 **Handoff**: จบ session → อัพเดท `HANDOFF.md` ก่อนจบ
6. 👤 **Owner Profile**: ได้ข้อมูลใหม่เกี่ยวกับเจ้าของ → อัพเดท `skills/owner_profile.md`
7. 🗺️ **Roadmap**: ทำงานเสร็จ → อัพเดท `docs/04_ROADMAP_AND_TASKS.md`
8. ❓ **ไม่แน่ใจ → ถามก่อนทำ**

---

## 📁 โครงสร้างโปรเจค

```
[PROJECT_NAME]/
├── AI_CONTEXT.md          ← คุณอยู่ที่นี่ (Hub)
├── HANDOFF.md             ← อ่านก่อนเลย!
├── AGENTS.md / CLAUDE.md / GEMINI.md / .cursorrules / ...
├── docs/
│   ├── 01_PROJECT_OVERVIEW.md
│   ├── 02_ARCHITECTURE_AND_STACK.md
│   ├── 03_DATABASE_SCHEMA.md
│   ├── 04_ROADMAP_AND_TASKS.md
│   ├── 05_AI_GUIDELINES.md
│   └── 06_LEGACY_SYSTEM_ANALYSIS.md
├── skills/
│   ├── README.md
│   └── owner_profile.md
└── src/ (สร้างเมื่อตัดสินใจ Stack แล้ว)
```

---

## 🔌 Infrastructure

| ส่วน | รายละเอียด |
|------|-----------|
| **Domain** | [DOMAIN] |
| **Hosting** | [HOSTING] |
| **Database** | [DATABASE] |
| **Auth** | [AUTH] |

---

## 🔄 สิ่งที่ต้องตัดสินใจ (รอเจ้าของ)

- [ ] [DECISION_1]
- [ ] [DECISION_2]

---

## 🧠 Global Knowledge Reference

> โปรเจคนี้สร้างจาก Template v1.0.0 ของ `Ai-Agent-Framework`  
> Global rules snapshot อยู่ใน: `skills/owner_profile.md`, `docs/05_AI_GUIDELINES.md`  
> ถ้าต้องการ upgrade → ดู `Ai-Agent-Framework/` เวอร์ชันใหม่
