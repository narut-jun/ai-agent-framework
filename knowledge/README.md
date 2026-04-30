# 📚 Knowledge Base — v1.0.0 (Narut)

> **โฟลเดอร์นี้คือองค์ความรู้ทั้งหมดของ Narut**  
> สลับเวอร์ชันได้ด้วยการ: rename โฟลเดอร์นี้ → วางโฟลเดอร์ใหม่ชื่อ `knowledge/` แทน  
> เวอร์ชัน: **v1.0.0** | เจ้าของ: **Narut** | อัพเดทล่าสุด: 2026-05-01

---

## โครงสร้าง

```
knowledge/
├── README.md                        ← คุณอยู่ที่นี่
├── global-rules/                    ← ตัวตน + นโยบาย + วิธีคิด (ทุกโปรเจค)
│   ├── owner_identity.md            ← ข้อมูลเจ้าของ + preferences
│   ├── ai_collaboration.md          ← กฎการทำงานกับ AI + conventions
│   └── cost_policy.md               ← นโยบาย Free Tier + approved services
├── patterns/                        ← Architecture + Design patterns
│   └── ai_memory_architecture.md    ← Hub & Spoke + Memory Layers
└── skills/                          ← How-to เฉพาะทาง
    ├── cloudflare_stack.md           ← Cloudflare (Pages/Workers/D1/R2/KV/AI)
    ├── health_data_management.md     ← จัดการข้อมูลสุขภาพ + อุปกรณ์
    └── room_rental_architecture.md   ← สถาปัตยกรรม Smart Rental System
```

---

## สรุปเนื้อหา

| โฟลเดอร์ | จำนวนไฟล์ | เนื้อหา |
|----------|:---------:|--------|
| **global-rules** | 3 | ตัวตน Narut, กฎ AI, นโยบาย Free Tier |
| **patterns** | 1 | Hub & Spoke, Memory Layers, Snapshot Pattern |
| **skills** | 3 | Cloudflare Stack, Health Data, Room Rental |

---

## แหล่งข้อมูลที่ใช้สร้าง v1.0.0

- WebappHealth project (AI_CONTEXT, skills/owner_profile, docs/05_AI_GUIDELINES)
- room-rental project v1.19.2 (README, schema.sql, wrangler.toml)
- Antigravity brain conversations (9+ sessions, 2026-04-17 ถึง 2026-05-01)

---

## วิธีอัพเกรด Knowledge Version

```
1. Rename: knowledge/ → knowledge-v1.0.0-backup/
2. Copy โฟลเดอร์ใหม่เข้ามา ชื่อ: knowledge/
3. อัพเดท VERSION.md
4. Git commit + tag
```

> ⚠️ **กฎ**: knowledge/ มีได้แค่ **1 โฟลเดอร์ที่ active** เสมอ  
> โฟลเดอร์ backup ให้ใช้ชื่อ `knowledge-vX.Y.Z-backup/`
