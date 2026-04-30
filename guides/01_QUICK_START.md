# 🚀 Guide 01: เริ่มต้นใช้งาน (Quick Start)

> **อ่านก่อน**: คู่มือนี้อธิบายภาพรวมทั้งหมดของ Ai-Agent-Framework  
> **เวลาอ่าน**: ~5 นาที

---

## ระบบนี้คืออะไร?

**Ai-Agent-Framework** คือ "ศูนย์บัญชาการ" สำหรับจัดการ:
- 🧠 **องค์ความรู้กลาง** ที่ใช้ร่วมกันทุกโปรเจค
- 📋 **แม่แบบโปรเจค** สำหรับสร้างโปรเจคใหม่แบบมีมาตรฐาน
- 🔄 **Feedback Loop** ที่ดึงบทเรียนจากแต่ละโปรเจคกลับมาเพิ่ม knowledge

---

## ใช้เมื่อไหร่? (3 กรณีเท่านั้น)

| กรณี | เปิด Ai-Agent-Framework? | ทำอะไร |
|------|:---------------------:|--------|
| ทำงานในโปรเจค P3 | ❌ ไม่ต้อง | เปิดแค่ P3 workspace |
| สร้างโปรเจคใหม่ | ✅ เปิดที่นี่ | ใช้คำสั่ง `CREATE_PROJECT` |
| อัพเดท knowledge | ✅ เปิดที่นี่ | ใช้คำสั่ง `BRAIN_INTAKE` → review → approve |

---

## โครงสร้างภาพรวม

```
C:\Users\YourName\Projects\
│
├── 🤖 Ai-Agent-Framework/   ← ศูนย์บัญชาการ (เปิดเมื่อจัดการ global)
│
├── 🏥 YourProject/        ← โปรเจค A (workspace แยก, repo แยก)
├── 🏠 AnotherProject/         ← โปรเจค B (workspace แยก, repo แยก)
└── 📱 ProjectC/            ← โปรเจค C (workspace แยก, repo แยก)
```

> **กฎสำคัญ**: แต่ละโปรเจคเป็น workspace อิสระ, git repo แยก, ทำงานแยก

---

## 5 นาทีแรก — ทำอะไรก่อน?

### ถ้าเพิ่งมาใหม่:
1. อ่านไฟล์นี้ (เสร็จแล้ว ✅)
2. อ่าน [สร้างโปรเจคใหม่](02_CREATE_NEW_PROJECT.md) — เมื่อต้องการเริ่มโปรเจค
3. อ่าน [ระบบ AI Memory](03_AI_MEMORY_SYSTEM.md) — เพื่อเข้าใจว่าทำไมต้องมีระบบนี้

### ถ้าต้องการสร้างโปรเจค:
**วิธีเร็ว** (แนะนำ):
```powershell
.\scripts\windows\create-project.ps1
```
**วิธี manual** → ไปอ่าน [Guide 02: สร้างโปรเจคใหม่](02_CREATE_NEW_PROJECT.md)

---

## คำศัพท์สำคัญ

| คำ | หมายความว่า |
|----|-----------|
| **Knowledge** | ความรู้กลาง (global-rules + patterns + skills) |
| **Template** | แม่แบบโปรเจค ที่ copy ไปใช้ได้เลย |
| **Brain Inbox** | จุดรับข้อมูลดิบจากโปรเจค ก่อนกรองและ review |
| **Pending Review** | ข้อมูลที่รอคนตรวจสอบก่อนใส่ global |
| **Snapshot** | สำเนาของ knowledge ที่ copy ไปใช้ในโปรเจค |
| **Hub & Spoke** | รูปแบบ: AI_CONTEXT.md เป็นศูนย์กลาง, IDE configs ชี้มาที่ Hub |
| **HANDOFF.md** | ไฟล์ส่งต่อความจำระหว่าง session / IDE / Account |
