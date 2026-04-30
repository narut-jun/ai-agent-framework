# 🤖 AI_CONTEXT.md — Ai-Agent-Framework

> **🚨 AI: นี่คือ workspace สำหรับจัดการ Global Framework**  
> **ไม่ใช่โปรเจคพัฒนา software** — ใช้สำหรับ: สร้างโปรเจคใหม่, จัดการ knowledge, version control  
> Framework Version: v1.0.0  
> อัพเดทล่าสุด: 2026-05-01

---

## 🚨 คำสั่งแรก: อ่านตามลำดับ

1. **`COMMANDS.md`** — รายการคำสั่งที่ใช้ได้ทั้งหมด (เปิดดูก่อนทำงาน)
2. **`VERSION.md`** — Framework + Knowledge version ปัจจุบัน
3. **`brain-inbox/REVIEW_QUEUE.md`** — สิ่งที่รอ Human Review
4. **`knowledge/README.md`** — โครงสร้างองค์ความรู้

---

## 🎯 หน้าที่ของ Workspace นี้

| งาน | Command |
|-----|---------|
| สร้างโปรเจคใหม่ | `CREATE_PROJECT` หรือ `scripts/windows/create-project.ps1` |
| รับ knowledge จากโปรเจค | `BRAIN_INTAKE` |
| ดูคิว Human Review | `SHOW_REVIEW_QUEUE` |
| Approve knowledge | `APPROVE_KNOWLEDGE` |
| Bump version | `BUMP_KNOWLEDGE_VERSION` |
| Push knowledge ไปโปรเจค | `PUSH_KNOWLEDGE_TO_PROJECT` |
| Rollback version | `ROLLBACK_KNOWLEDGE` |
| ดูสถานะทั้งระบบ | `SYSTEM_STATUS` หรือ `scripts/windows/show-status.ps1` |
| Reset ตัวตน (เปลี่ยนเจ้าของ) | `RESET_IDENTITY` |

---

## 📁 โครงสร้าง

```
Ai-Agent-Framework/
├── AI_CONTEXT.md          ← คุณอยู่ที่นี่
├── COMMANDS.md            ← เมนูคำสั่ง AI 9 คำสั่ง
├── VERSION.md             ← Framework + Knowledge version
├── README.md              ← คำอธิบาย (GitHub)
├── LICENSE                ← MIT License
│
├── scripts/               ← 🔧 เครื่องมือ CLI
├── guides/                ← 📚 คู่มือ 9 บท
├── knowledge/             ← ⭐ องค์ความรู้ (สลับได้ทั้งก้อน)
├── knowledge-empty/       ← Template เปล่า (สำหรับ RESET_IDENTITY)
├── brain-inbox/           ← รับ/กรอง ความรู้จากโปรเจค
└── templates/             ← แม่แบบโปรเจค
```

---

## 🌐 GitHub

- **Repo**: Public, MIT License
- **Author**: Narut Rungruangbangchan ([narut-jun](https://github.com/narut-jun)) · narut.jun@gmail.com
- **แต่ละโปรเจค**: แยก repo อิสระ ไม่ nested กัน

---

## ⚙️ Global Rules (สำหรับ workspace นี้)
- สื่อสารเป็น **ภาษาไทย** (เปลี่ยนได้ใน knowledge/global-rules/)
- จบ session → อัพเดท `VERSION.md` ถ้ามีการเปลี่ยนแปลง
- ห้าม commit knowledge ลง global โดยไม่ผ่าน Human Review
