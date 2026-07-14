# Chapter 4 — Data Flow

## Tujuan

Dokumen ini menjelaskan bagaimana data mengalir di dalam sistem SWPilot mulai dari interaksi pengguna hingga proses otomatisasi selesai.

---

# Alur Data

1. Pengguna membuka aplikasi.
2. Flutter menampilkan Dashboard.
3. Pengguna memilih akun.
4. Flutter mengirim perintah ke Native Android.
5. Native Android menjalankan Automation Engine.
6. Automation Engine mengendalikan Accessibility Service.
7. Accessibility Service melakukan interaksi dengan aplikasi HoYoLab.
8. Hasil dikembalikan ke Flutter.
9. Logger mencatat aktivitas.
10. Dashboard memperbarui status.

---

# Diagram Data Flow

```text
User
 │
 ▼
Flutter UI
 │
 ▼
Method Channel
 │
 ▼
Native Android
 │
 ▼
Automation Engine
 │
 ▼
Accessibility Service
 │
 ▼
HoYoLab App
 │
 ▼
Result
 │
 ▼
Logger
 │
 ▼
Flutter UI
```

---

# Prinsip Data Flow

- Data mengalir satu arah.
- UI tidak mengakses Android secara langsung.
- Seluruh komunikasi menggunakan Method Channel.
- Logger mencatat seluruh proses.

---

# Checklist

- [ ] Memahami alur data.
- [ ] Memahami komunikasi antar komponen.
- [ ] Memahami proses otomatisasi.

---

# Next Chapter

Chapter 5 — Project Roadmap