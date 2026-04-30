# 💰 Cost & Service Policy — Narut

> นโยบายค่าใช้จ่ายสำหรับทุกโปรเจค  
> อัพเดทล่าสุด: 2026-05-01 | Knowledge v1.0.0

---

## 🚨 นโยบายหลัก

> **FREE TIER เท่านั้น** — ห้ามใช้ paid service โดยไม่ได้รับอนุญาตจากเจ้าของ

### กฎ:
1. ทุก service ที่เลือกต้องมี **Free Tier ที่เพียงพอ**
2. ถ้าจำเป็นต้องจ่ายเงิน → **แจ้งก่อนทำ** พร้อมทางเลือกฟรี
3. ระบุค่าใช้จ่ายที่อาจเกิดขึ้นทุกครั้งที่แนะนำ service
4. ต้อง **เปรียบเทียบราคา** อย่างน้อย 2-3 ตัวเลือก

---

## ✅ บริการที่ใช้งาน (Approved)

| Service | ใช้เพื่อ | ราคา | โปรเจค |
|---------|---------|------|--------|
| **Cloudflare Pages** | Hosting, Domain | ฟรี | WebappHealth, barnchan.com |
| **Cloudflare Workers** | Backend/API | ฟรี (100k req/day) | barnchan.com |
| **Cloudflare D1** | Database (SQLite) | ฟรี (5M reads/day) | barnchan.com |
| **GitHub** | Source code, Version control | ฟรี | ทุกโปรเจค |
| **Google Sheets** | Legacy Database | ฟรี | WebappHealth (ระบบเดิม) |
| **Google Apps Script** | Legacy Backend | ฟรี | WebappHealth (ระบบเดิม) |

---

## 🔮 บริการที่อาจใช้ในอนาคต

| Service | ใช้เพื่อ | ราคา | สถานะ |
|---------|---------|------|-------|
| Cloudflare R2 | File storage (ECG PDF) | ฟรี (10GB) | ยังไม่ตัดสินใจ |
| Supabase | Alternative DB | ฟรี tier | ยังไม่ตัดสินใจ |
| Ollama | Local AI model | ฟรี 100% | พิจารณา |
| Gemini API | AI analysis | ฟรี tier | ยังไม่ตัดสินใจ |

---

## ❌ บริการที่ห้ามใช้ (ไม่มี Free Tier หรือแพงเกินไป)

- AWS (ยกเว้นได้รับอนุมัติเฉพาะ)
- Vercel Pro
- PlanetScale (ยกเลิก Free Tier แล้ว)
- Firebase Blaze (ถ้าเกิน Free Tier)
- OpenAI API (ยกเว้นได้รับอนุมัติ)

---

## 💡 แนวทางการประเมิน Service ใหม่

เมื่อ AI ต้องการแนะนำ service ใหม่ ให้ตอบคำถามเหล่านี้:

1. **มี Free Tier หรือไม่?** → ถ้าไม่มี = ห้ามใช้
2. **Free Tier เพียงพอกับ Scale ของเราไหม?** → ต้องประเมินการใช้งานจริง
3. **มีทางเลือกอื่นที่ฟรีหรือถูกกว่าไหม?** → ต้องเปรียบเทียบ
4. **ถ้า Free Tier หมด จะเป็นอย่างไร?** → ต้องมี exit plan
5. **Lock-in มากแค่ไหน?** → ต้องย้ายออกได้ง่าย
