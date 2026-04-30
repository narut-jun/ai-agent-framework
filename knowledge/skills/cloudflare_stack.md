# 🔧 Skill: Cloudflare Stack

> **How-to สำหรับการใช้ Cloudflare ใน Free Tier**  
> ดึงจากประสบการณ์จริงของ Narut กับ 2 โปรเจค  
> อัพเดทล่าสุด: 2026-05-01 | Knowledge v1.0.0

---

## 📌 Cloudflare Services ที่ใช้จริง

| Service | ใช้เพื่อ | Free Tier | โปรเจค |
|---------|---------|-----------|--------|
| **Pages** | Static hosting + custom domain | ไม่จำกัด | WebappHealth, barnchan.com |
| **Workers** | API / Backend logic | 100k req/day | barnchan.com |
| **D1** | SQLite database | 5M reads/day, 100k writes/day | barnchan.com |
| **R2** | Object storage (รูป, สลิป, backups) | 10GB, 10M reads/mo | barnchan.com |
| **KV** | Key-Value config storage | 100k reads/day | barnchan.com |
| **Workers AI** | AI Vision (OCR สแกนเอกสาร) | 10k neurons/day | barnchan.com |
| **Turnstile** | Bot/brute-force protection | ฟรีไม่จำกัด | barnchan.com |
| **DNS** | Domain management | ฟรี | oniijun.com, barnchan.com |

---

## 🌐 Domain Setup Pattern

### CNAME สำหรับ subdomain:
```
subdomain.oniijun.com → CNAME → project-name.pages.dev
```

### ตัวอย่างจริง:
```
jim.oniijun.com → CNAME → oniijun-jim-app.pages.dev
```

### วิธีตั้งค่า:
1. ไปที่ Cloudflare Dashboard → DNS
2. เพิ่ม CNAME record
3. ตั้ง SSL/TLS เป็น Full
4. Pages → Custom domains → เพิ่ม subdomain

---

## 🚀 Deployment Pattern

### Cloudflare Pages (Static):
```bash
# ใช้ wrangler CLI
npx wrangler pages deploy ./dist --project-name=my-app
```

### Cloudflare Workers (API):
```bash
# ใช้ wrangler.toml config
npx wrangler deploy
```

### Environment Variables:
```toml
# wrangler.toml
[vars]
ENVIRONMENT = "production"

# secrets (ห้ามใส่ใน toml!)
# ใช้: npx wrangler secret put API_KEY
```

---

## ⚠️ ข้อควรระวัง

1. **Free Tier Limits**: 
   - Workers: 100k requests/day, 10ms CPU time per request
   - D1: 5M row reads/day, 100k writes/day
   - Pages: 500 builds/month
   
2. **ห้าม commit wrangler.toml ที่มี secrets** — ใช้ `wrangler secret` แทน

3. **Custom Domain + Google Drive**: ถ้าโปรเจคอยู่ใน Google Drive ต้องระวังเรื่อง path ที่มี space

4. **D1 Limitations**: 
   - ไม่รองรับ JOIN ที่ซับซ้อน (ใช้ SQLite)
   - Max 10GB per database
   - ไม่มี real-time subscriptions

---

## 📋 Checklist ก่อน Deploy

- [ ] ตรวจสอบ wrangler.toml ว่าไม่มี secrets
- [ ] ตั้ง environment variables ผ่าน Cloudflare Dashboard
- [ ] ทดสอบ locally ด้วย `wrangler dev`
- [ ] ตรวจสอบ DNS propagation (cloudflare มักจะเร็ว)
- [ ] เช็ค SSL certificate ทำงานถูกต้อง
