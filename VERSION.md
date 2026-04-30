# 📦 VERSION.md — Version Tracking

> **ไฟล์เดียว 2 เวอร์ชัน**: Framework (โครงสร้าง) + Knowledge (เนื้อหา)

---

## 🏷️ Version ปัจจุบัน

| รายการ | ค่า |
|--------|-----|
| **Framework Version** | v1.0.0 |
| **Knowledge Version** | v0.0.0 (empty — ยังไม่ได้เทรน) |
| **อัพเดทล่าสุด** | 2026-05-01 |

> **หมายเหตุ**: Framework v0.x.x = development, v1.0.0 = first stable release  
> Knowledge version แยกจาก framework — bump คนละเวลา

---

## 📋 Framework Version History

| Version | วันที่ | สิ่งที่เปลี่ยน |
|---------|--------|--------------|
| **v1.0.0** | 2026-05-01 | Initial release: knowledge/, brain-inbox/, templates/, guides/, scripts/, COMMANDS |

---

## 📋 Knowledge Version History

| Version | วันที่ | สิ่งที่เพิ่ม | Owner |
|---------|--------|------------|-------|
| *(empty — fill this after training your knowledge)* | | | |

---

## 📤 Deployment Log (โปรเจคที่ใช้ Knowledge Version ไหน)

| โปรเจค | Framework | Knowledge | อัพเดทเมื่อ | หมายเหตุ |
|--------|-----------|-----------|-----------|---------|
| *(add your projects here)* | | | | |

---

## 🔧 วิธี Upgrade

### Knowledge ในโปรเจค:
```
PUSH_KNOWLEDGE_TO_PROJECT
  โปรเจค: [PROJECT_PATH]
  เวอร์ชัน: latest
```

### Knowledge ทั้งก้อน (manual):
```
1. Rename: knowledge/ → knowledge-vX.Y.Z-backup/
2. Copy knowledge/ ใหม่เข้ามา
3. อัพเดท VERSION.md
```

## 🕰️ Rollback
```bash
git checkout vX.Y.Z -- knowledge/
```
