# 🤝 AI Collaboration Rules — Narut

> กฎการทำงานกับ AI — ทุก AI ทุก IDE ต้องปฏิบัติตาม  
> อัพเดทล่าสุด: 2026-05-01 | Knowledge v1.0.0

---

## 🗣️ ภาษา

| บริบท | ภาษา |
|-------|------|
| **สื่อสารกับเจ้าของ** | ไทย |
| **ชื่อตัวแปร / Functions** | English (camelCase) |
| **Components** | English (PascalCase) |
| **Constants** | English (UPPER_SNAKE_CASE) |
| **DB Columns** | English (snake_case) |
| **Code comments** | ไทย |
| **UI labels (ผู้ใช้เห็น)** | ไทย |
| **Commit messages** | English (Conventional Commits) |

---

## 📝 การบันทึก (สำคัญมาก!)

> ⚠️ **กฎเหล็ก**: ทุกข้อมูลที่เจ้าของให้ → ต้องบันทึกลงเอกสาร ห้ามลืม!

| เหตุการณ์ | สิ่งที่ต้องทำ |
|----------|------------|
| ได้ข้อมูลใหม่เกี่ยวกับเจ้าของ | อัพเดท `skills/owner_profile.md` |
| ทำงานเสร็จ | อัพเดท `docs/04_ROADMAP_AND_TASKS.md` |
| มีการเปลี่ยนแปลงสำคัญ | อัพเดท `CHANGELOG.md` |
| เปลี่ยนโครงสร้าง DB | อัพเดท `docs/03_DATABASE_SCHEMA.md` |
| ตัดสินใจเรื่องสำคัญ | บันทึกลง `docs/02_ARCHITECTURE_AND_STACK.md` |
| จบ Session | อัพเดท `HANDOFF.md` **ทุกครั้ง** |

---

## 🎯 การตัดสินใจ

| ขนาดเรื่อง | ตัวอย่าง | ทำอย่างไร |
|-----------|---------|----------|
| **เล็ก** | ตั้งชื่อตัวแปร, formatting | ตัดสินใจเอง |
| **ปานกลาง** | เลือก library, design pattern | แนะนำพร้อมเหตุผล แล้วทำ |
| **ใหญ่** | Architecture, Stack, ค่าใช้จ่าย | **ต้องถามก่อน ห้ามทำเอง** |

---

## 🔄 Workflow สำหรับ AI

### เมื่อได้รับงานใหม่:
1. อ่าน `HANDOFF.md` (สถานะ session ล่าสุด)
2. อ่าน `AI_CONTEXT.md` → ตามลำดับเอกสารที่กำหนด
3. ตรวจสอบ Roadmap ว่าอยู่ Phase ไหน
4. วางแผน → นำเสนอแผน → รอ approval (ถ้าเรื่องใหญ่)
5. ลงมือทำ
6. ทดสอบ
7. อัพเดทเอกสาร (Roadmap, CHANGELOG, etc.)
8. สรุปผลให้เจ้าของโปรเจค

### เมื่อพบปัญหา:
1. อธิบายปัญหาให้ชัด
2. เสนอทางเลือก (อย่างน้อย 2 ทาง)
3. แนะนำทางที่ดีที่สุดพร้อมเหตุผล
4. รอการตัดสินใจ (ถ้าเป็นเรื่องใหญ่)

---

## ⚙️ Technical Conventions

### Naming Conventions

| สิ่งที่ตั้งชื่อ | รูปแบบ | ตัวอย่าง |
|----------------|--------|---------| 
| File/Folder | kebab-case | `vitals-record.js` |
| Component | PascalCase | `VitalsForm` |
| Function | camelCase | `getVitalsData()` |
| Variable | camelCase | `recordDate` |
| Constant | UPPER_SNAKE | `MAX_RECORDS` |
| DB Column | snake_case | `record_date` |
| CSS Class | kebab-case | `.card-header` |
| API Endpoint | kebab-case | `/api/vitals-records` |

### Date Handling
- **Database**: เก็บเป็น ค.ศ. (ISO 8601) เสมอ
- **Frontend**: แสดงเป็น พ.ศ. (dd/MM/yyyy) เสมอ
- **แปลง**: ค.ศ. → พ.ศ. = +543 | พ.ศ. → ค.ศ. = -543

### API Design
- ใช้ RESTful conventions
- Response format: `{ success: boolean, data?: any, error?: string }`
- ใช้ HTTP status codes ที่ถูกต้อง

---

## ❌ สิ่งที่ห้ามทำ (Don'ts)

1. ❌ ห้ามใช้ paid API/service โดยไม่ได้อนุญาต
2. ❌ ห้ามเก็บ credentials/secrets ใน source code — ใช้ environment variables
3. ❌ ห้าม commit ไฟล์ .env
4. ❌ ห้าม hardcode URL ที่เปลี่ยนได้ — ใช้ env variable
5. ❌ ห้ามข้าม Phase ใน Roadmap โดยไม่ได้รับ approval
6. ❌ ห้ามตัดสินใจเรื่อง Stack/Architecture เอง
7. ❌ ห้ามลืมอัพเดทเอกสาร
8. ❌ ห้ามนำข้อมูลส่วนตัวเจ้าของใส่ public repository

---

## ✅ สิ่งที่ควรทำ (Do's)

1. ✅ อัพเดท Roadmap ทุกครั้งที่ทำงานเสร็จ
2. ✅ เขียน commit message ที่สื่อความหมาย (Conventional Commits)
3. ✅ ทดสอบก่อน deploy ทุกครั้ง
4. ✅ แนะนำเรื่อง performance, security, UX เชิงรุก
5. ✅ สรุปงานที่ทำให้เจ้าของโปรเจคเมื่อจบ session
6. ✅ ใช้ skills ที่มีอยู่แล้วแทนการเริ่มต้นใหม่
7. ✅ ให้ข้อมูลใหม่ที่เรียนรู้ได้ → บันทึกลง owner_profile.md ทันที
