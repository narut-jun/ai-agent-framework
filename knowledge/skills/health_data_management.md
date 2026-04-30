# 🔧 Skill: Health Data Management

> **How-to สำหรับจัดการข้อมูลสุขภาพ**  
> ดึงจากประสบการณ์จริงกับโปรเจค WebappHealth  
> อัพเดทล่าสุด: 2026-05-01 | Knowledge v1.0.0

---

## 📌 ข้อมูลสุขภาพที่ติดตาม

| ประเภท | ข้อมูลที่เก็บ | อุปกรณ์ | วิธี Input |
|--------|------------|--------|-----------|
| **ความดันโลหิต** | SYS, DIA, Pulse | Omron HEM-7156-A | กรอกมือ |
| **ออกซิเจนในเลือด** | SpO2, Pulse Rate | Yuwell YX310 | กรอกมือ |
| **น้ำหนัก/ร่างกาย** | Weight, BMI, Body Fat | Huawei Scale 3 | กรอกมือ / Sync |
| **ECG** | Heart rhythm, PDF report | KardiaMobile 6L | อัพโหลดไฟล์ PDF |
| **Blood Glucose** | Glucose level | (อนาคต) | กรอกมือ |
| **Sleep** | Duration, Quality | (อนาคต) | Sync via Health Connect |

---

## 📅 Date Handling (สำคัญมาก!)

| บริบท | รูปแบบ | ตัวอย่าง |
|-------|--------|---------|
| **Database/API** | ค.ศ. ISO 8601 | `2026-05-01T14:30:00Z` |
| **UI แสดงผล** | พ.ศ. dd/MM/yyyy | `01/05/2569` |
| **แปลง ค.ศ.→พ.ศ.** | + 543 | 2026 → 2569 |
| **แปลง พ.ศ.→ค.ศ.** | - 543 | 2569 → 2026 |

```javascript
// ตัวอย่างการแปลง
const toBuddhistYear = (ceYear) => ceYear + 543;
const toCEYear = (beYear) => beYear - 543;

// แสดง พ.ศ.
const formatThaiDate = (isoDate) => {
  const d = new Date(isoDate);
  const day = d.getDate().toString().padStart(2, '0');
  const month = (d.getMonth() + 1).toString().padStart(2, '0');
  const year = toBuddhistYear(d.getFullYear());
  return `${day}/${month}/${year}`;
};
```

---

## 👥 Multi-User Design

- ระบบนี้ใช้สำหรับ **ครอบครัว** (ไม่ใช่แค่คนเดียว)
- ต้องมี **User Selector** เพื่อเลือกดูข้อมูลแต่ละคน
- ชื่อ Sheet เดิม: `DBWebAppMom_INUSE` → บ่งบอกว่าเริ่มใช้กับแม่
- ต้องมีระบบ **Auth** เพื่อป้องกันข้อมูลสุขภาพ

---

## 🔒 ความปลอดภัยของข้อมูลสุขภาพ

> ⚠️ ข้อมูลสุขภาพ = **ข้อมูลส่วนบุคคลที่มีความอ่อนไหว**

### กฎ:
1. ห้ามเก็บข้อมูลสุขภาพใน **plain text** ที่ไม่มีการป้องกัน
2. ต้องใช้ **HTTPS** เสมอ
3. ต้องมีระบบ **Authentication** ก่อนดูข้อมูล
4. ห้าม log ข้อมูลสุขภาพใน console/debug output
5. ห้าม commit ข้อมูลสุขภาพจริงขึ้น GitHub

---

## 🏥 Legacy System (Google Apps Script)

| รายการ | ข้อมูล |
|--------|--------|
| **GAS URL** | `https://script.google.com/macros/s/AKfycbw.../exec` |
| **Database** | Google Sheet `DBWebAppMom_INUSE` |
| **Custom Domain** | `jim.oniijun.com` → CNAME → `oniijun-jim-app.pages.dev` |
| **สถานะ** | ใช้งานอยู่ — กำลังวางแผนย้าย |

### Migration Notes:
- ข้อมูลเดิมอยู่ใน Google Sheets → ต้อง export เป็น CSV/JSON
- GAS code อยู่ใน `AppScriptCode/` (อ้างอิงเท่านั้น ห้ามแก้!)
- ต้องรองรับ backward compatibility ระหว่าง migration
