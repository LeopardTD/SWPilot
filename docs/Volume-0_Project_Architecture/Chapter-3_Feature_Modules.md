# Chapter 3 — Feature Modules

## Tujuan

Dokumen ini menjelaskan seluruh modul utama yang akan dikembangkan pada SWPilot beserta tanggung jawab masing-masing modul.

---

# Daftar Modul

## Dashboard

Menampilkan ringkasan informasi aplikasi seperti:

- Status Service
- Jadwal berikutnya
- Statistik Login
- Quick Action

---

## Account Management

Mengelola akun HoYoLab.

Fitur:

- Tambah akun
- Edit akun
- Hapus akun
- Pilih akun aktif

---

## Automation

Mengatur proses otomatisasi login harian.

Fitur:

- Start Automation
- Stop Automation
- Retry
- Delay
- Timeout

---

## Scheduler

Mengatur jadwal otomatis.

Contoh:

- Login setiap hari
- Login pada jam tertentu
- Menjalankan WorkManager

---

## Statistics

Menampilkan statistik penggunaan.

Contoh:

- Total Login
- Success Rate
- Failed Login
- Automation History

---

## Settings

Mengatur konfigurasi aplikasi.

Contoh:

- Theme
- Notification
- Accessibility
- Delay
- Log Level

---

## Logger

Mencatat seluruh aktivitas sistem.

---

## Notification

Mengirim notifikasi kepada pengguna.

---

# Hubungan Antar Modul

```text
Dashboard
│
├── Account
├── Automation
├── Statistics
├── Scheduler
└── Settings

Automation
│
├── Accessibility
├── Logger
└── Notification
```

---

# Prinsip Modular

- Setiap modul berdiri sendiri.
- Tidak saling bergantung secara langsung.
- Komunikasi dilakukan melalui service atau repository.
- Mudah ditambahkan tanpa mengubah modul lain.

---

# Checklist

- [ ] Memahami seluruh modul.
- [ ] Memahami hubungan antar modul.
- [ ] Memahami tanggung jawab masing-masing modul.

---

# Next Chapter

Chapter 4 — Data Flow