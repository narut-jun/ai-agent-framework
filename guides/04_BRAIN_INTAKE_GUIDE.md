# 📥 Guide 04: นำความรู้เข้า Brain Inbox

> **ใช้เมื่อ**: ทำงานในโปรเจคแล้วเจอ pattern/ความรู้ที่น่าจะใช้ซ้ำข้ามโปรเจคได้  
> **เปิดที่**: Ai-Agent-Framework workspace

---

## เมื่อไหร่ควร Extract? (3 Triggers)

| Trigger | เมื่อไหร่ | ตัวอย่าง |
|---------|---------|---------|
| 🤖 **AI Flag** | AI เจอ insight ระหว่างทำงาน | "เจอวิธีใช้ Cloudflare D1 ที่ดี" |
| 🏁 **Milestone** | จบ Phase หรือ Feature สำคัญ | จบ Phase 2 ของ YourProject |
| 👤 **Manual** | เจ้าของสั่งเอง | "เอาความรู้วันนี้ไปใส่ global" |

> ⚠️ **ไม่ต้อง extract ทุก session** — ทำเมื่อมีของดีพอจะใช้ซ้ำ

---

## วิธีนำเข้า

### ผ่าน AI Command:
```
BRAIN_INTAKE
จาก: YourProject
ประเภท: pattern_found
เนื้อหา: [วางเนื้อหาที่ต้องการ extract]
```

### ด้วยตัวเอง (Manual):
1. สร้างไฟล์ใน `brain-inbox/pending-review/`
2. ตั้งชื่อ: `2026-04-30_YourProject_cloudflare_pattern.md`
3. ใส่เนื้อหา + ระบุประเภทที่คิดว่าเป็น (skill/knowledge/rule)

---

## การตั้งชื่อไฟล์

```
YYYY-MM-DD_[PROJECT]_[TOPIC].md
ตัวอย่าง:
  2026-04-30_YourProject_ai_memory_pattern.md
  2026-05-15_roomrental_cloudflare_d1_tips.md
```

---

## หลังนำเข้าแล้ว

ไฟล์จะอยู่ใน `brain-inbox/pending-review/` → รอ Human Review  
→ ดูขั้นตอน review ใน [Guide 05: Human Review](05_HUMAN_REVIEW_GUIDE.md)
