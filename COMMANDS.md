# 🎮 COMMANDS.md — AI Command Center

> **เปิดไฟล์นี้เมื่อต้องการสั่งงาน Ai-Agent-Framework**  
> บอก AI ว่าต้องการทำ command ไหน แล้ว AI จะดำเนินการให้

---

## 📋 รายการคำสั่งที่ใช้ได้

### 🆕 A. สร้างโปรเจคใหม่
```
Command: CREATE_PROJECT
ต้องการข้อมูล:
  - ชื่อโปรเจค: [PROJECT_NAME]
  - Path ที่ต้องการสร้าง: [PATH] (เช่น C:\Users\YourName\Projects\ProjectName)
  - คำอธิบายสั้น: [DESCRIPTION]
  - Domain (ถ้ามี): [DOMAIN]

AI จะ:
  1. Copy templates/project-template/ → [PATH]
  2. แก้ไข placeholder ทั้งหมดในไฟล์
  3. สร้าง HANDOFF.md เริ่มต้น
  4. อัพเดท knowledge-version.md ในโปรเจคใหม่
  5. เพิ่มโปรเจคในตาราง projects ของ VERSION.md
```

---

### 📥 B. รับข้อมูลจากโปรเจคเข้า Brain Inbox
```
Command: BRAIN_INTAKE
ต้องการข้อมูล:
  - ชื่อโปรเจค: [PROJECT_NAME]
  - ประเภทข้อมูล: [brain_log / handoff / manual_note / pattern_found]
  - ช่วงเวลา: [FROM_DATE] ถึง [TO_DATE] (เพื่อไม่ดึงข้อมูลซ้ำ)
  - batch: [initial / incremental] (ครั้งแรก หรือ เพิ่มเติม)
  - เนื้อหา: [วาง content หรือ path ของไฟล์]

AI จะ:
  1. สร้างไฟล์ใน brain-inbox/pending-review/
  2. ตั้งชื่อ: YYYY-MM-DD_[PROJECT]_[batch]_[TOPIC].md
  3. จัดหมวดหมู่เบื้องต้น (skill/knowledge/rule)
  4. อัพเดท brain-inbox/REVIEW_QUEUE.md
  5. บันทึก date range ใน extraction-log.md (ป้องกันดึงซ้ำ)
```

---

### 👀 C. ดูคิวที่รอ Human Review
```
Command: SHOW_REVIEW_QUEUE

AI จะ:
  1. แสดงรายการไฟล์ทั้งหมดใน brain-inbox/pending-review/
  2. เรียงตาม: วันที่ | โปรเจค | ประเภท
  3. แสดงสรุปสั้นของแต่ละไฟล์
```

---

### ✅ D. Approve และย้ายเข้า Knowledge
```
Command: APPROVE_KNOWLEDGE
ต้องการข้อมูล:
  - ชื่อไฟล์ใน pending-review: [FILENAME]
  - ประเภท: [global-rules / patterns / skills]
  - ชื่อไฟล์ปลายทาง: [TARGET_FILENAME]

AI จะ:
  1. ย้ายจาก pending-review/ → knowledge/[ประเภท]/
  2. อัพเดท brain-inbox/REVIEW_QUEUE.md (mark done)
  3. บันทึกใน extraction-log.md
```

---

### 🔄 E. อัพเดท Knowledge Version ใหม่
```
Command: BUMP_KNOWLEDGE_VERSION
ต้องการข้อมูล:
  - เวอร์ชันใหม่: [vX.Y.Z]
  - changelog สั้นๆ: [WHAT_CHANGED]

AI จะ:
  1. อัพเดท VERSION.md (เพิ่ม entry ใหม่)
  2. Git commit: "knowledge: bump to vX.Y.Z - [WHAT_CHANGED]"
  3. Git tag: vX.Y.Z
```

---

### 📤 F. Push Knowledge Update ไปยังโปรเจค
```
Command: PUSH_KNOWLEDGE_TO_PROJECT
ต้องการข้อมูล:
  - โปรเจคที่ต้องการอัพเดท: [PROJECT_PATH]
  - เวอร์ชัน knowledge ที่จะใช้: [vX.Y.Z หรือ "latest"]

AI จะ:
  1. ตรวจสอบ knowledge version ปัจจุบันของโปรเจค
  2. แสดง diff ว่ามีไฟล์อะไรเปลี่ยนไปบ้าง
  3. Copy knowledge/[files] → [PROJECT_PATH]/skills/ และ docs/05_AI_GUIDELINES.md
  4. อัพเดท [PROJECT_PATH]/knowledge-version.md
  5. แจ้งให้ทำ git commit ในโปรเจคนั้น
```

---

### 📊 G. ดูสถานะทั้งระบบ
```
Command: SYSTEM_STATUS

AI จะแสดง:
  - Knowledge version ปัจจุบัน
  - จำนวนไฟล์ใน pending-review
  - รายการโปรเจคทั้งหมด + knowledge version ที่ใช้อยู่
  - สิ่งที่ค้างใน extraction-log
```

---

### 🕰️ H. ย้อน Knowledge Version
```
Command: ROLLBACK_KNOWLEDGE
ต้องการข้อมูล:
  - เวอร์ชันที่ต้องการย้อนกลับ: [vX.Y.Z]

AI จะ:
  1. git checkout [vX.Y.Z] -- knowledge/
  2. อัพเดท VERSION.md (เพิ่ม rollback entry)
  3. แจ้งว่าโปรเจคไหนบ้างที่อาจได้รับผลกระทบ
```

---

### 🧹 I. Reset Identity (สำหรับเปลี่ยนเจ้าของ)
```
Command: RESET_IDENTITY

AI จะ:
  1. Rename knowledge/ → knowledge-[OLD_OWNER]-backup/
  2. Copy knowledge-empty/ → knowledge/
  3. ล้างข้อมูลส่วนตัวใน templates/ (เปลี่ยนเป็น placeholder)
  4. อัพเดท VERSION.md (reset entry)
  5. แจ้งเจ้าของใหม่ให้กรอกข้อมูลใน knowledge/global-rules/owner_identity.md
```

---

## 💡 ตัวอย่างการใช้งาน

```
ผู้ใช้: "CREATE_PROJECT ชื่อ HealthTracker 
         path: C:\Users\YourName\Projects\HealthTracker
         คำอธิบาย: แอพติดตามสุขภาพส่วนตัว"

AI: (ดำเนินการตาม command CREATE_PROJECT)
```

```
ผู้ใช้: "BRAIN_INTAKE จาก YourProject
         ช่วงเวลา: 2026-04-30 ถึง 2026-05-15
         batch: incremental
         ประเภท: pattern_found
         เนื้อหา: เจอวิธีใช้ Cloudflare D1 ที่ดีมาก คือ..."

AI: (สร้างไฟล์ใน pending-review/ พร้อมบันทึก date range ใน extraction-log)
```
