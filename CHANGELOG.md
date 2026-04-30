# 📝 CHANGELOG.md — Ai-Agent-Framework

> บันทึกการเปลี่ยนแปลงของ Framework

---

## [v1.0.0] — 2026-04-30

### Added
- สร้าง framework ทั้งหมดจาก scratch
- `knowledge/` — global-rules (3 ไฟล์) + patterns (1 ไฟล์) + skills
- `knowledge-empty/` — template เปล่าสำหรับเปลี่ยนเจ้าของ
- `brain-inbox/` — ระบบรับ/กรอง/review ความรู้จากโปรเจค
- `templates/project-template/` — แม่แบบโปรเจคพร้อม IDE configs 8 ตัว
- `guides/` — คู่มือ 9 บท
- `scripts/` — CLI tools (create-project.ps1, show-status.ps1)
- `COMMANDS.md` — 9 คำสั่ง AI
- `VERSION.md` — dual versioning (Framework + Knowledge)
- `LICENSE` — MIT License
- `.gitignore` — root level

### Design Decisions
- **Snapshot ไม่ใช่ Pointer** — ปลอดภัยสำหรับ production
- **Sibling repos** — แต่ละโปรเจคเปิดแยก ไม่ nested
- **Milestone-based extraction** — ไม่ extract ทุก session
- **knowledge/ สลับได้ทั้งก้อน** — rename เก่า วางใหม่
- **Global = AI behavior only** — ไม่แตะ code logic
- **Two-layer correction** — AI extract + Human review
