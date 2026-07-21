# SWPilot - Project TODO List

## Persiapan Lingkungan Kerja (Besok)
- [ ] Buka Android Studio pada folder `D:\Project\SWPilot\source\swpilot`.
- [ ] Pastikan plugin **Flutter** dan **Dart** sudah terinstal & aktif di Android Studio.
- [ ] Jalankan emulator `SWPilot` dan jalankan aplikasi (`flutter run`).

## Pengambangan Fitur Lanjutan (Milestone Berikutnya)
- [ ] **Fitur Settings**:
  - [ ] Buat layout halaman Settings di `lib/features/settings/presentation/pages/settings_page.dart`.
  - [ ] Tambahkan konfigurasi akun HoYoverse (kredensial, cookies, dll.).
  - [ ] Tambahkan opsi konfigurasi waktu eksekusi otomatisasi.
- [ ] **State Management**:
  - [ ] Hubungkan UI Dashboard (status aktif engine, riwayat login, statistik) dengan data riil dari state Riverpod.
  - [ ] Integrasikan `SharedPreferences` untuk menyimpan konfigurasi lokal.
- [ ] **Integrasi Native Android (Volume 3)**:
  - [ ] Buat kerangka kelas `AccessibilityService` di Kotlin (`android/`).
  - [ ] Implementasikan `Method Channel` di Flutter & Native Android untuk komunikasi dua arah.
  - [ ] Integrasikan `WorkManager` untuk penjadwalan berkala.
- [ ] **Dokumentasi & Testing**:
  - [ ] Lengkapi dokumen draf di folder `docs/Volume-2_UI_Development/` dan `docs/Volume-3_Native_Android/`.
  - [ ] Tulis widget test tambahan untuk halaman Settings.
