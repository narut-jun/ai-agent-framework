# ✅ Guide 05: Human Review Process

> **ใช้เมื่อ**: มีไฟล์ใน `brain-inbox/pending-review/` ที่ต้องตรวจ  
> **ทำโดย**: เจ้าของ (Human) เท่านั้น — AI ห้าม approve เอง

---

## ทำไมต้องมี Human Review?

AI แยกข้อมูลดี/แย่ไม่ออก 100% → ต้องใช้คนกรอง

```
brain/ (ดิบ) → AI สกัด → pending-review/ → 👤 Human ตรวจ
                                               ├── ✅ approved/
                                               └── ❌ rejected/
```

---

## ขั้นตอน Review

### 1. ดูว่ามีอะไรรอ
```
SHOW_REVIEW_QUEUE
```
หรือเปิด `brain-inbox/REVIEW_QUEUE.md` ดูตรง

### 2. เปิดไฟล์ใน `pending-review/` อ่าน

**Checklist:**
- [ ] ข้อมูลถูกต้องไหม?
- [ ] มีประโยชน์ข้ามโปรเจคไหม? (ถ้าเฉพาะโปรเจค → ไม่ใส่ global)
- [ ] ประเภทถูกไหม? (global-rules / patterns / skills)
- [ ] มี error หรือ bias ที่ต้องแก้ไหม?

### 3. แก้ไขเนื้อหา (ถ้าจำเป็น)
- ลบส่วนที่เป็น noise / ข้อมูลผิด
- เพิ่มบริบทที่ขาด

### 4. ตัดสินใจ

**Approve:**
```
APPROVE_KNOWLEDGE
ไฟล์: [FILENAME]
ประเภท: [global-rules / patterns / skills]
ชื่อปลายทาง: [TARGET_FILENAME]
```

**Reject:** ลบ หรือย้ายไป `brain-inbox/rejected/`

---

## การจัดประเภท

| ถ้าเนื้อหาเป็น... | ประเภท | ตัวอย่าง |
|-------------------|--------|---------|
| ตัวตน, นโยบาย, วิธีคิดทั่วไป | `global-rules` | "Free Tier เท่านั้น" |
| Architecture, design pattern | `patterns` | Hub & Spoke |
| วิธีทำอะไรบางอย่างเฉพาะ | `skills` | วิธี deploy Worker |
