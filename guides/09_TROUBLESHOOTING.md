# 🔧 Guide 09: Troubleshooting

> ปัญหาที่พบบ่อยและวิธีแก้

---

## ❓ "AI ไม่อ่าน AI_CONTEXT.md"

**สาเหตุ**: IDE ไม่รู้จัก config file  
**วิธีแก้**: ตรวจสอบว่ามี IDE config file ที่ถูกต้อง:
- Cursor/Antigravity → `.cursorrules`
- Claude Code → `CLAUDE.md`
- Codex → `AGENTS.md`
- Gemini CLI → `GEMINI.md`

---

## ❓ "แชทหายไปเมื่อปิด IDE"

**เป็นเรื่องปกติ!** ข้อมูลอยู่ใน `HANDOFF.md` ไม่ใช่ในแชท  
**วิธีแก้**: พิมพ์ "ทำงานต่อ" → AI จะอ่าน HANDOFF.md อัตโนมัติ  
**ป้องกัน**: ก่อนปิด IDE → บอก AI ว่า "อัพเดท HANDOFF.md"

---

## ❓ "AI ลืมสิ่งที่เคยบอก"

**สาเหตุ**: ข้อมูลอยู่แค่ในแชท ไม่ได้บันทึกลงเอกสาร  
**วิธีแก้**: ตรวจว่า AI กฎได้อัพเดท:
1. `HANDOFF.md` (สถานะ session)
2. `skills/owner_profile.md` (ข้อมูลเจ้าของ)
3. `docs/04_ROADMAP_AND_TASKS.md` (ความคืบหน้า)

---

## ❓ "อัพเดท knowledge แล้วโค้ดพัง"

**ไม่ควรเกิด!** ถ้าเกิด = knowledge มี code-specific content  
**กฎ**: Global knowledge = AI behavior only (ไม่แตะ code logic)  
**วิธีแก้**: rollback knowledge version + ลบส่วนที่เป็น code-specific ออก

---

## ❓ "BRAIN_INTAKE ดึงข้อมูลซ้ำ"

**วิธีแก้**: ใส่ `ช่วงเวลา` ทุกครั้ง:
```
BRAIN_INTAKE
ช่วงเวลา: 2026-04-30 ถึง 2026-05-15
batch: incremental
```
ดู `brain-inbox/extraction-log.md` ว่าเคย extract ช่วงไหนไปแล้ว

---

## ❓ "new owner อยากใช้ framework แต่มีข้อมูล YourName อยู่"

**วิธีแก้**: ใช้คำสั่ง `RESET_IDENTITY`  
หรือ manual: rename `knowledge/` → `knowledge-YourName/` แล้ว rename `knowledge-empty/` → `knowledge/`
