# 🔧 Skill: Room Rental System Architecture

> **How-to สำหรับระบบจัดการหอพัก (Smart Rental System)**  
> ดึงจากประสบการณ์จริงกับโปรเจค room-rental v1.19.2  
> อัพเดทล่าสุด: 2026-05-01 | Knowledge v1.0.0

---

## 📌 สถาปัตยกรรม: Serverless 100%

### Tech Stack

| ส่วน | เทคโนโลยี | หน้าที่ |
|------|----------|--------|
| **Frontend** | HTML5 + CSS3 + Vanilla JS (ES6+) | ไม่ใช้ Framework |
| **Hosting** | Cloudflare Pages | Static files + CDN |
| **Backend/API** | Cloudflare Pages Functions | Serverless API |
| **Database** | Cloudflare D1 (SQLite) | ฐานข้อมูลหลัก |
| **File Storage** | Cloudflare R2 | รูปภาพ, สลิป, เอกสาร |
| **Config Storage** | Cloudflare Workers KV | Settings, API Keys |
| **AI Vision** | Cloudflare Workers AI (Llama 3.2) | สแกน OCR บัตรประชาชน |
| **Slip Verification** | SlipOk API | ตรวจสอบสลิปโอนเงิน |
| **Bot Protection** | Cloudflare Turnstile | ป้องกัน brute-force |

### Libraries ที่ใช้ (Frontend)
- `Sortable.js` — Drag & Drop จัดเรียงห้อง
- `Cropper.js` — ครอบตัดรูปภาพก่อนอัพโหลด

---

## 🗂️ โครงสร้างหน้าเว็บ

| ไฟล์ | หน้าที่ | ผู้ใช้ |
|------|--------|-------|
| `index.html` | แสดงห้องว่างสำหรับคนทั่วไป | Public |
| `login.html` | หน้า Login (Turnstile protected) | Admin/Tenant |
| `admin.html` | แผงควบคุมหลังบ้าน | Admin |
| `portal.html` | ระบบสำหรับผู้เช่า (Self-service) | Tenant |

---

## 🗄️ Database Schema (D1 SQLite)

### ตารางหลัก:
| ตาราง | หน้าที่ | ความสัมพันธ์ |
|-------|--------|------------|
| `admins` | ผู้ดูแลระบบ (role: master/superadmin/admin) | — |
| `rooms` | ห้องพัก (เลขห้อง, อาคาร, ราคา, สถานะ) | — |
| `tenants` | ผู้เช่า (ข้อมูลส่วนตัว, login, token) | — |
| `contracts` | สัญญาเช่า (ห้อง + ผู้เช่า + ราคา) | FK: rooms, tenants |
| `contract_tenants` | ผู้เช่าร่วมสัญญา (Many-to-Many) | FK: contracts, tenants |
| `invoices` | บิลค่าเช่ารายเดือน | FK: contracts |
| `expenses` | รายจ่ายของหอพัก | — |
| `activity_log` | Audit Trail (ประวัติการใช้งาน) | FK: admins |

### Security Design:
- **Password Hashing**: Double Hashing = SHA-256 + HMAC-SHA256 with Pepper (ENCRYPTION_MASTER_KEY)
- **Tenant Password**: AES-GCM Encryption (ciphertext + IV)
- **Admin Auth**: JWT Token (configurable expiry)
- **Tenant Auth**: Quick Token via special link หรือ phone + password
- **Soft Delete**: ใช้ `deleted_at` column แทนการลบจริง

---

## 🔄 Multi-Environment Pattern

| ทรัพยากร | Production | Preview/Staging |
|----------|-----------|-----------------|
| D1 Database | `room-rental-db` | `room-rental-db-test` |
| R2 Bucket | `room-rental-images` | `room-rental-images-test` |
| KV Namespace | Production ID | Preview ID |
| URL | `room-rental.pages.dev` | `preview.room-rental.pages.dev` |

### วิธี Deploy:
```bash
npm run deploy:prod      # Production
npm run deploy:preview   # Staging
npm run deploy:all       # ทั้งสอง
npm run deploy:local     # Local dev
```

---

## ⏰ Cron Worker Pattern

ระบบใช้ **Cloudflare Worker แยก** เป็น Cron Trigger:
- รันทุกเที่ยงคืน (17:00 UTC = 00:00 Bangkok)
- ทำ 3 อย่าง: Housekeeping (ลบ log > 90 วัน), Auto Backup (D1 → R2), Smart Billing (วันที่ 1 ของเดือน)
- มีโหมด `force_billing=true` สำหรับ override

---

## 📋 Patterns ที่น่าสนใจ

### 1. Version Sync Pattern
ใช้ `version-sync.js` + `version.txt` เพื่อ sync เวอร์ชันไปทุกที่ (Service Worker cache, HTML meta)

### 2. KV-based Settings Pattern
แทนที่จะเก็บ settings ใน D1 → เก็บใน KV Namespace ภายใต้ key `integrations` (JSON)
- ลด latency
- รองรับ JSON ซับซ้อน
- ไม่ต้องทำ migration

### 3. Client-side Image Compression
บีบอัดรูปภาพฝั่ง Client ก่อนอัพโหลด → ประหยัด bandwidth + storage

### 4. R2 Folder Structure
```
room-rental-images/
├── profiles/      ← รูปโปรไฟล์ผู้เช่า
├── slips/         ← สลิปโอนเงิน
├── docs/          ← เอกสารสัญญา
├── rooms/         ← รูปห้องพัก
└── backups/       ← D1 database backups
```

### 5. Audit Trail Pattern
บันทึกทุก action ลง `activity_log` → สอดคล้อง พ.ร.บ. คอมพิวเตอร์
- เก็บ: admin_id, action, table_name, row_id, details (JSON), IP, User-Agent

---

## 🔒 Security Checklist

- [x] HMAC-SHA256 password hashing with Pepper
- [x] AES-GCM encryption สำหรับ tenant passwords
- [x] JWT token authentication
- [x] Cloudflare Turnstile (bot protection)
- [x] Soft delete (ไม่ลบข้อมูลจริง)
- [x] Activity logs (audit trail)
- [x] .gitignore for wrangler.toml, .dev.vars
- [x] Multi-environment (Production แยกจาก Preview)

---

## 💡 บทเรียนสำคัญจากโปรเจค

1. **Vanilla JS ทำได้ไกลมาก** — ไม่ต้อง React/Vue ก็สร้าง Full-stack app ได้
2. **KV > D1 สำหรับ settings** — เร็วกว่า, ไม่ต้อง migration
3. **Workers AI ใช้ได้ฟรี** — สแกนเอกสารได้โดยไม่ต้องจ่ายเงิน
4. **Multi-environment สำคัญ** — แยก DB/Storage ออก 100% ป้องกันข้อมูลจริงเสียหาย
5. **Version sync ช่วยเรื่อง cache** — Service Worker + cache busting
