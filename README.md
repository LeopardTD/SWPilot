# SWPilot

Aplikasi Android berbasis Flutter untuk otomatisasi login harian pada game HoYoverse menggunakan Android Accessibility Service.

## Struktur Repositori

Repositori ini terbagi menjadi dua bagian utama:

- **[docs/](file:///d:/Project/SWPilot/docs/)**: Berisi dokumentasi developer lengkap (Developer Handbook) yang disusun dalam beberapa volume (Setup, UI, Native Android, Automation Engine, dll.).
- **[source/swpilot/](file:///d:/Project/SWPilot/source/swpilot/)**: Berisi kode sumber proyek Flutter untuk aplikasi SWPilot.

## Teknologi & Fitur Utama

- **Flutter & Dart**: Antarmuka pengguna modern dengan tema *dark mode Cyberpunk* dan animasi mulus.
- **Android Accessibility Service**: Menjalankan proses login game secara otomatis di latar belakang.
- **WorkManager**: Menjadwalkan tugas otomatisasi secara periodik dan efisien.
- **GoRouter**: Manajemen navigasi aplikasi yang modular.
- **Riverpod**: Manajemen state yang tangguh dan teruji.

## Cara Menjalankan Proyek Lokal

1. Pastikan Anda telah menginstal [Flutter SDK](https://flutter.dev) (versi >= 3.12.2).
2. Masuk ke direktori proyek:
   ```bash
   cd source/swpilot
   ```
3. Unduh dependensi:
   ```bash
   flutter pub get
   ```
4. Jalankan pengujian (tests):
   ```bash
   flutter test
   ```
5. Jalankan aplikasi pada perangkat emulator/fisik Android:
   ```bash
   flutter run
   ```
