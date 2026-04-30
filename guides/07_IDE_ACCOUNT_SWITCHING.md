# 🔀 Guide 07: การสลับ IDE & Account

> ทำงานต่อเนื่องเมื่อเปลี่ยน IDE หรือ Account

---

## เปลี่ยน IDE (เช่น Antigravity → Claude Code)

**ไม่ต้องทำอะไรพิเศษ!** เพราะ:
- IDE ใหม่อ่าน config file ของตัวเอง (CLAUDE.md)
- ชี้ไป AI_CONTEXT.md → ได้ context ครบ
- อ่าน HANDOFF.md → รู้สถานะล่าสุด

## เปลี่ยน Account (สลับ quota)

**ขั้นตอน:**
1. **ก่อนเปลี่ยน**: บอก AI ว่า "อัพเดท HANDOFF.md จะปิดแล้ว"
2. **เปลี่ยน Account** ใน IDE
3. **หลังเปลี่ยน**: พิมพ์ "ทำงานต่อ" → AI อ่าน HANDOFF.md อัตโนมัติ

## ปิด IDE แล้วเปิดใหม่

แชทจะหายไป → **เป็นเรื่องปกติ!**  
พิมพ์ "ทำงานต่อ" → AI อ่าน .cursorrules → AI_CONTEXT.md → HANDOFF.md → ได้ context ครบ

## ย้ายเครื่อง

ถ้า project อยู่ใน Google Drive หรือ Git:
- Clone/Sync → เปิดใน IDE → ทำงานต่อได้ทันที

## ไฟล์ที่ทำให้ระบบนี้ทำงานได้

| ไฟล์ | ทำหน้าที่ |
|------|---------|
| `HANDOFF.md` | เก็บ "ตอนนี้ทำถึงไหน" |
| `AI_CONTEXT.md` | เก็บ "โปรเจคนี้คืออะไร" |
| `skills/owner_profile.md` | เก็บ "เจ้าของเป็นใคร ชอบอะไร" |
| IDE config files | เก็บ "ไปอ่านที่ไหน" |
