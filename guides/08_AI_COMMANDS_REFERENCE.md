# 🎮 Guide 08: คำสั่ง AI ทั้งหมด (Quick Reference)

> รายการคำสั่งสำหรับใช้ใน Ai-Agent-Framework workspace

---

| คำสั่ง | หน้าที่ | ข้อมูลที่ต้องให้ |
|--------|---------|----------------|
| `CREATE_PROJECT` | สร้างโปรเจคใหม่จาก template | ชื่อ, path, คำอธิบาย |
| `BRAIN_INTAKE` | รับความรู้จากโปรเจค | ชื่อโปรเจค, ช่วงเวลา, batch, เนื้อหา |
| `SHOW_REVIEW_QUEUE` | ดูรายการรอ review | — |
| `APPROVE_KNOWLEDGE` | Approve → ย้ายเข้า knowledge | ชื่อไฟล์, ประเภท |
| `BUMP_KNOWLEDGE_VERSION` | อัพ knowledge version | vX.Y.Z, changelog |
| `PUSH_KNOWLEDGE_TO_PROJECT` | Push ไปโปรเจค | project path, version |
| `SYSTEM_STATUS` | ดูสถานะทั้งระบบ | — |
| `ROLLBACK_KNOWLEDGE` | ย้อน knowledge version | vX.Y.Z |
| `RESET_IDENTITY` | เปลี่ยนเจ้าของ (ล้าง personal data) | — |

รายละเอียดเต็ม → ดู [`COMMANDS.md`](../COMMANDS.md)
