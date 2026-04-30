# 📚 Knowledge Base — v0.0.0

> **โฟลเดอร์นี้คือองค์ความรู้ทั้งหมด**  
> สลับเวอร์ชันได้ด้วยการ: rename โฟลเดอร์นี้ → วางโฟลเดอร์ใหม่ชื่อ `knowledge/` แทน  
> เวอร์ชัน: **v0.0.0** (ยังไม่ได้เทรน) | อัพเดทล่าสุด: 2026-05-01

---

## โครงสร้าง

```
knowledge/
├── README.md              ← คุณอยู่ที่นี่
├── global-rules/          ← ตัวตน + นโยบาย + วิธีคิด (ทุกโปรเจค)
│   ├── owner_identity.md  ← [PLACEHOLDER] กรอกข้อมูลเจ้าของ
│   ├── ai_collaboration.md
│   └── cost_policy.md
├── patterns/              ← Architecture + Design patterns
│   └── .gitkeep           ← (ว่าง — รอเพิ่มจากประสบการณ์)
└── skills/                ← How-to เฉพาะทาง
    └── .gitkeep           ← (ว่าง — รอ extract จากโปรเจค)
```

---

## วิธีอัพเกรด Knowledge Version

```
1. Rename: knowledge/ → knowledge-vX.Y.Z-backup/
2. Copy โฟลเดอร์ใหม่เข้ามา ชื่อ: knowledge/
3. อัพเดท VERSION.md
4. Git commit + tag
```

> ⚠️ **กฎ**: knowledge/ มีได้แค่ **1 โฟลเดอร์ที่ active** เสมอ  
> โฟลเดอร์ backup ให้ใช้ชื่อ `knowledge-vX.Y.Z-backup/`
