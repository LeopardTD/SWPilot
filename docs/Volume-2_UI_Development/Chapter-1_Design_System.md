# Chapter 1 — Design System & Branding Identity

## Tujuan

Dokumen ini mendefinisikan identitas visual, panduan merek (branding), dan Design System yang akan digunakan di seluruh aplikasi SWPilot. Konsistensi visual sangat penting untuk memberikan pengalaman pengguna yang premium, modern, dan bernuansa *cyberpunk*.

---

# Identitas Project

## Nama & Tagline

- **Nama Aplikasi:** SWPilot
- **Tagline Utama:** Level 999 Daily Automation
- **Alternatif Tagline:**
  - *Automation Beyond Limits*
  - *Smart Daily Login Automation*
  - *Cyber Automation Engine*
  - *Built for Daily Precision*

---

# Konsep Branding

## Tema Visual

Aplikasi dirancang dengan estetika:
- **Cyberpunk**
- **Hacker / Terminal**
- **Futuristic**
- **Neon Glow**
- **Minimalis & Clean**

Tujuan utamanya adalah menciptakan nuansa seperti alat canggih (hacker tool) namun tetap mudah dioperasikan, memberikan kesan bahwa *Automation Engine* bekerja layaknya "Silver Wolf Lv999" tanpa melanggar hak cipta aset resmi.

---

# Palet Warna

Skema warna sangat bergantung pada *dark mode* (latar belakang gelap) dengan sorotan neon.

| Warna | Hex Code | Penggunaan Utama |
| :--- | :--- | :--- |
| **Neon Purple 1** | `#8B5CF6` | Primary Accent, Glow effect, Button Background |
| **Neon Purple 2** | `#A855F7` | Hover State, Active Element, Gradient Secondary |
| **Cyan** | `#22D3EE` | Secondary Accent, Success State, Information |
| **Dark Gray 1** | `#0F172A` | Primary Background (App Scaffold) |
| **Dark Gray 2** | `#111827` | Surface, Card Background, Dialogs |
| **White** | `#FFFFFF` | Primary Text, High-emphasis elements |

---

# Identitas Visual & Logo

## Logo

Logo SWPilot menggunakan elemen berikut agar terlihat orisinal:
- Huruf "SW" bergaya *digital/monospace*.
- Ikon *autopilot*, *crosshair*, atau *target lock*.
- Elemen sirkuit elektronik minimalis.
- Efek *glitch* ringan pada transisi atau _splash screen_.
- Mengandalkan garis luar (outline) bercahaya *neon ungu*.

> [!CAUTION]
> Hindari penggunaan ilustrasi atau aset resmi karakter Silver Wolf dari HoYoverse. Gunakan gaya *cyberpunk* dan warna serupa yang *mengingatkan* pada karakternya, bukan salinannya.

---

# Maskot: Pilot Wolf

Untuk memberikan kepribadian pada aplikasi, SWPilot menggunakan maskot orisinal bernama **Pilot Wolf**.

Karakteristik:
- **Spesies:** Serigala Cyber / Serigala Robotik.
- **Mata:** Menyala dengan warna neon ungu (`#8B5CF6`).
- **Aksesoris:** Mengenakan headset futuristik dan jaket *hacker*.
- **VFX:** Dikelilingi oleh efek *pixel* / *glitch* digital.
- **Fungsi:** Digunakan pada ilustrasi _Empty State_, _Loading Screen_, dan panduan *onboarding*.

---

# Tipografi dan Copywriting

Gaya komunikasi UI akan dibuat ringkas, *to-the-point*, dan menyerupai output terminal komputer.

## Slogan Teks UI

Pendekatan 1:
```text
SWPilot
Level 999 Daily Automation

Automate.
Collect.
Repeat.
```

Pendekatan 2 (Terminal Style):
```text
SWPilot
> LOGIN
> CLAIM
> COMPLETE
Automation Engine
```

---

# Panduan UI Components (Draft)

- **Button:** Sudut sedikit tajam (radius kecil), latar belakang gelap dengan border neon, menyala (glow) saat ditekan.
- **Cards:** Latar belakang `#111827`, border tipis transparan putih, bayangan drop shadow ungu saat melayang (hover/active).
- **Font:** Prioritaskan *sans-serif* modern dan *monospace* (seperti Fira Code atau JetBrains Mono) untuk angka atau log proses.

---

# Checklist

- [ ] Memahami identitas visual SWPilot.
- [ ] Menerapkan palet warna pada tema Flutter.
- [ ] Membuat logo berbasis teks/vektor sederhana dengan efek neon.
- [ ] Menjaga orisinalitas aset.

---

# Next Chapter

Chapter 2 — UI Architecture (TBA)
