# 🔄 Guide 06: Version Management

> อัพเกรด, ย้อน version, push knowledge ไปยังโปรเจค  
> ⚠️ Framework version กับ Knowledge version **แยกกัน**

---

## 2 เวอร์ชันที่ต้องรู้

| | Framework Version | Knowledge Version |
|--|---|---|
| **คืออะไร** | โครงสร้าง (templates, commands, guides) | เนื้อหา (rules, patterns, skills) |
| **เปลี่ยนเมื่อ** | เพิ่ม command, แก้ template | เพิ่ม skill, แก้ rules |
| **ความถี่** | นานๆ ครั้ง | บ่อย (ทุก milestone) |
| **ดูที่** | VERSION.md → Framework section | VERSION.md → Knowledge section |

---

## Bump Knowledge Version
```
BUMP_KNOWLEDGE_VERSION
เวอร์ชัน: v1.1.0
changelog: เพิ่ม Cloudflare D1 patterns จาก YourProject
```

## Push ไปโปรเจค
```
PUSH_KNOWLEDGE_TO_PROJECT
โปรเจค: C:\Users\YourName\Projects\YourProject
เวอร์ชัน: latest
```

## Rollback
```
ROLLBACK_KNOWLEDGE
เวอร์ชัน: v1.0.0
```

---

## วิธีสลับ Knowledge ด้วยตัวเอง (Manual)

```
1. Rename: knowledge/ → knowledge-v1.0.0-backup/
2. วางโฟลเดอร์ knowledge/ ใหม่เข้ามา (ชื่อ knowledge/)
3. อัพเดท VERSION.md
4. Git commit + tag
```

---

## Framework Version

Framework version bump เมื่อ: เพิ่ม guide ใหม่, เพิ่ม command, เปลี่ยนโครงสร้าง template  
→ แก้ใน VERSION.md + git tag
