# Chapter 2 — Folder Structure

## Tujuan

Dokumen ini menjelaskan struktur folder utama SWPilot beserta fungsi setiap direktori. Struktur yang baik akan mempermudah pengembangan, pemeliharaan, dan penambahan fitur di masa mendatang.

---

# Prinsip Penyusunan Folder

Struktur proyek dirancang berdasarkan prinsip:

- Modular
- Mudah dipahami
- Mudah dipelihara
- Memisahkan tanggung jawab setiap komponen
- Mendukung pengembangan jangka panjang

---

# Struktur Folder Project

```text
SWPilot/
│
├── docs/
├── prompts/
├── assets/
├── references/
├── notes/
└── source/
```

---

# Struktur Source Code

```text
source/

flutter_app/
│
├── android/
├── ios/
├── lib/
│
├── core/
├── features/
├── shared/
├── services/
├── repositories/
├── models/
├── widgets/
├── theme/
├── animations/
└── utils/
```

---

# Penjelasan Folder

## core

Berisi komponen inti aplikasi seperti konfigurasi, dependency injection, constants, helper, dan utilities global.

---

## features

Berisi seluruh fitur utama aplikasi.

Contoh:

- Dashboard
- Login
- Settings
- Automation
- Statistics

Setiap fitur memiliki folder tersendiri sehingga mudah dikembangkan.

---

## shared

Berisi komponen yang digunakan bersama oleh seluruh fitur.

Contoh:

- Shared Widget
- Shared Dialog
- Shared Component
- Shared Extension

---

## services

Berisi service yang menangani komunikasi dengan platform Android maupun layanan internal aplikasi.

---

## repositories

Mengelola akses data sehingga Business Logic tidak berhubungan langsung dengan penyimpanan data.

---

## models

Berisi seluruh model data yang digunakan aplikasi.

---

## widgets

Berisi widget yang dapat digunakan ulang oleh berbagai fitur.

---

## theme

Berisi konfigurasi warna, typography, spacing, radius, icon theme, dan style aplikasi.

---

## animations

Berisi seluruh animasi yang digunakan aplikasi.

---

## utils

Berisi helper dan utility tambahan.

---

# Struktur Dokumentasi

Folder docs dibagi menjadi beberapa volume:

- Volume 0 — Project Architecture
- Volume 1 — Setup and Foundation
- Volume 2 — UI Development
- Volume 3 — Native Android
- Volume 4 — Automation
- Volume 5 — Testing
- Volume 6 — Release

---

# Checklist

- [ ] Memahami struktur folder.
- [ ] Memahami fungsi setiap folder.
- [ ] Memahami struktur source code.

---

# Next Chapter

Chapter 3 — Feature Modules