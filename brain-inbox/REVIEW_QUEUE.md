# 📥 Brain Inbox — รับความรู้จากโปรเจคต่างๆ

> **นี่คือจุดรวมของความรู้ดิบจากทุกโปรเจค**  
> ก่อนนำไปใส่ knowledge/ ต้องผ่าน Human Review ก่อนเสมอ

---

## 📊 สถานะ Review Queue

| สถานะ | จำนวน |
|-------|-------|
| ⏳ รอ Review | 0 |
| ✅ Approved (รอ commit) | 0 |
| ❌ Rejected | 0 |

*อัพเดทล่าสุด: 2026-04-30*

---

## 📂 โครงสร้าง Brain Inbox

```
brain-inbox/
├── REVIEW_QUEUE.md          ← คุณอยู่ที่นี่ (สรุปสิ่งที่รอ review)
├── pending-review/          ← ไฟล์ดิบรอ Human ตรวจ
│   └── YYYY-MM-DD_PROJECT_TOPIC.md
├── approved/                ← Human approve แล้ว รอ commit ลง knowledge/
│   └── ...
├── rejected/                ← ตัดทิ้ง (เก็บไว้เพื่อ audit)
│   └── ...
└── extraction-log.md        ← บันทึกประวัติการ extract ทั้งหมด
```

---

## 📋 Pending Review (ต้องตรวจ)

*ยังไม่มีรายการ*

---

## ✅ Approved (รอ commit ลง knowledge/)

*ยังไม่มีรายการ*

---

## 📖 วิธีใช้งาน

### รับข้อมูลใหม่เข้า inbox:
พิมพ์ให้ AI:
```
BRAIN_INTAKE จาก [PROJECT_NAME]
ประเภท: [brain_log / handoff_summary / manual_note / pattern_found]
เนื้อหา: [วางเนื้อหาที่ต้องการ extract]
```

### Human Review Process:
1. เปิดไฟล์ใน `pending-review/`
2. อ่านและแก้ไขเนื้อหา
3. ถ้า OK → บอก AI: `APPROVE_KNOWLEDGE [FILENAME] ประเภท [global-rules/knowledge/skills]`
4. ถ้าไม่ OK → ลบทิ้งหรือย้ายไป `rejected/`

### การจัดประเภทความรู้:
| ประเภท | ลักษณะ | ใส่ที่ |
|--------|--------|-------|
| **global-rules** | ตัวตน, นโยบาย, วิธีคิด | `knowledge/global-rules/` |
| **knowledge** | pattern, architecture | `knowledge/patterns/` |
| **skills** | how-to, step-by-step | `knowledge/skills/` |
