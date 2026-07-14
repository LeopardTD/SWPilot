# Chapter 1 — System Architecture

## Tujuan

Dokumen ini menjelaskan arsitektur sistem SWPilot secara menyeluruh sebagai dasar pengembangan aplikasi. Arsitektur ini menjadi acuan dalam proses perancangan, implementasi, pengujian, dan pemeliharaan aplikasi agar setiap komponen memiliki tanggung jawab yang jelas dan saling terintegrasi dengan baik.

---

# Gambaran Umum

SWPilot merupakan aplikasi Android yang dikembangkan menggunakan Flutter sebagai antarmuka utama dan Kotlin sebagai implementasi fitur-fitur native Android. Aplikasi ini dirancang untuk membantu pengguna melakukan proses login harian HoYoLab secara otomatis melalui Accessibility Service yang dikendalikan oleh Automation Engine.

Untuk menjalankan proses otomatis secara terjadwal, aplikasi memanfaatkan WorkManager. Seluruh aktivitas penting akan dicatat oleh Logger sehingga proses otomatisasi dapat dipantau dan dievaluasi apabila terjadi kesalahan.

Arsitektur ini menerapkan prinsip modular sehingga setiap komponen dapat dikembangkan, diuji, dan dipelihara secara terpisah.

---

# Tujuan Arsitektur

Arsitektur SWPilot dirancang dengan tujuan:

- Memisahkan tampilan (UI) dari Business Logic.
- Memisahkan kode Flutter dan Native Android.
- Memudahkan penambahan fitur baru.
- Mempermudah proses debugging.
- Mempermudah proses pengujian.
- Menghasilkan struktur proyek yang mudah dipahami.
- Menjaga konsistensi kode selama pengembangan.

---

# Komponen Utama Sistem

## Flutter UI

Flutter berfungsi sebagai antarmuka utama aplikasi yang digunakan pengguna untuk melakukan konfigurasi, melihat status otomatisasi, mengelola akun, serta mengakses seluruh fitur aplikasi.

Flutter hanya bertanggung jawab terhadap tampilan dan interaksi pengguna tanpa menangani proses otomatisasi secara langsung.

---

## Method Channel

Method Channel merupakan jembatan komunikasi antara Flutter dan Native Android (Kotlin).

Komponen ini memungkinkan Flutter memanggil fungsi-fungsi native Android seperti:

- Menjalankan Accessibility Service
- Mengakses WorkManager
- Mengelola Notification
- Mengambil status service
- Menjalankan automation engine

---

## Native Android (Kotlin)

Native Android menangani seluruh fitur Android yang tidak dapat dilakukan langsung oleh Flutter.

Beberapa tanggung jawabnya meliputi:

- Accessibility Service
- Background Service
- WorkManager
- Notification
- Permission Management

---

## Accessibility Service

Accessibility Service merupakan komponen inti yang bertugas mengendalikan interaksi dengan aplikasi HoYoLab.

Fungsi utama:

- Mendeteksi tampilan layar
- Menemukan tombol
- Melakukan klik otomatis
- Mengisi data login
- Membaca perubahan halaman
- Menyelesaikan proses login

---

## Automation Engine

Automation Engine merupakan pusat logika otomatisasi.

Komponen ini menentukan:

- Langkah berikutnya
- Kondisi berhasil
- Kondisi gagal
- Retry
- Delay
- Timeout
- Recovery

Automation Engine tidak berhubungan langsung dengan UI.

---

## WorkManager

WorkManager digunakan untuk menjalankan tugas otomatis secara terjadwal walaupun aplikasi tidak sedang dibuka.

Contohnya:

- Login harian otomatis
- Pemeriksaan jadwal
- Sinkronisasi data
- Menjalankan Automation Engine

---

## Local Storage

Local Storage digunakan untuk menyimpan data lokal seperti:

- Konfigurasi aplikasi
- Pengaturan pengguna
- Daftar akun
- Riwayat login
- Jadwal otomatisasi
- Preferensi aplikasi

---

## Logger

Logger mencatat seluruh aktivitas sistem.

Contoh informasi yang disimpan:

- Waktu login
- Status login
- Error
- Retry
- Durasi proses
- Riwayat automation

Logger membantu proses debugging dan analisis apabila terjadi kegagalan.

---

# Diagram Arsitektur

```text
                 +-----------------------+
                 |      Flutter UI       |
                 +-----------+-----------+
                             |
                             |
                     Method Channel
                             |
                 +-----------+-----------+
                 |   Native Android      |
                 |       (Kotlin)        |
                 +-----------+-----------+
                             |
      +----------------------+----------------------+
      |                      |                      |
      |                      |                      |
+-------------+     +----------------+     +---------------+
|Accessibility|     | WorkManager    |     | Notification  |
|   Service   |     |                |     |    Manager    |
+------+------+     +-------+--------+     +-------+-------+
       |                    |                      |
       +--------------------+----------------------+
                            |
                    +-------+-------+
                    | Automation    |
                    |    Engine     |
                    +-------+--------+
                            |
                    +-------+--------+
                    | Local Storage  |
                    +-------+--------+
                            |
                    +-------+--------+
                    |    Logger      |
                    +-------+--------+
                            |
                    +-------+--------+
                    | HoYoLab App    |
                    +----------------+
```

---

# Alur Kerja Sistem

1. Pengguna membuka aplikasi SWPilot.
2. Flutter menampilkan antarmuka aplikasi.
3. Pengguna memilih akun dan jadwal otomatisasi.
4. Flutter mengirimkan perintah ke Native Android melalui Method Channel.
5. Native Android menjalankan Accessibility Service.
6. Automation Engine mengatur urutan proses login.
7. Accessibility Service melakukan interaksi dengan aplikasi HoYoLab.
8. Hasil proses dikirim kembali ke Flutter.
9. Logger menyimpan seluruh aktivitas.
10. Pengguna dapat melihat status otomatisasi melalui aplikasi.

---

# Prinsip Arsitektur

Pengembangan SWPilot mengikuti beberapa prinsip berikut:

- Separation of Concerns
- Modular Architecture
- Reusable Components
- Low Coupling
- High Cohesion
- Maintainable Code
- Scalable Structure
- Testable Components

---

# Keuntungan Arsitektur Ini

Dengan menggunakan arsitektur ini, SWPilot memiliki beberapa keuntungan:

- Struktur proyek lebih rapi.
- Setiap komponen memiliki tanggung jawab yang jelas.
- Mudah dikembangkan di masa depan.
- Mudah melakukan debugging.
- Mudah melakukan pengujian.
- Risiko perubahan kode menjadi lebih kecil.
- Dokumentasi lebih mudah dipahami oleh anggota tim baru.

---

# Checklist

- [ ] Memahami tujuan arsitektur.
- [ ] Memahami fungsi setiap komponen.
- [ ] Memahami hubungan antar komponen.
- [ ] Memahami alur kerja sistem.
- [ ] Memahami prinsip pengembangan yang digunakan.

---

# Next Chapter

Chapter 2 — Folder Structure