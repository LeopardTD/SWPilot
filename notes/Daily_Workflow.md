# Panduan Alur Kerja Harian SWPilot (Stop & Start Project)

Dokumen ini berisi panduan langkah-demi-langkah yang harus dilakukan saat Anda ingin menyelesaikan pekerjaan hari ini dan saat ingin memulainya kembali besok, guna mencegah masalah penguncian file (*file locking*) dan cache Gradle/Kotlin di Windows.

---

## 1. Saat Ingin Menghentikan Pekerjaan (Closing/Stop)

Lakukan langkah-langkah ini sebelum menutup laptop atau mematikan komputer:

### Langkah A: Hentikan Proses Aplikasi Flutter
Jika aplikasi sedang berjalan di terminal/IDE:
* Tekan tombol **`q`** di terminal yang menjalankan `flutter run` untuk menghentikan koneksi debug secara aman.

### Langkah B: Hentikan Gradle Daemon di Latar Belakang (PENTING!)
Proses Java/Gradle sering kali tetap berjalan di latar belakang dan mengunci file cache. Hentikan daemons secara paksa dengan cara:
1. Buka terminal, masuk ke direktori Android proyek:
   ```powershell
   cd d:/Project/SWPilot/source/swpilot/android
   ```
2. Jalankan perintah stop:
   ```powershell
   ./gradlew.bat --stop
   ```
   *(Ini akan menghentikan seluruh proses Java compiler latar belakang secara aman sehingga tidak ada file yang terkunci).*

### Langkah C: Matikan Emulator
Tutup emulator Android Studio secara aman agar tidak memakan RAM/CPU komputer Anda selama tidak digunakan.

### Langkah D: Commit Pekerjaan Anda (Git)
Simpan perubahan hari ini agar tidak hilang:
```powershell
cd d:/Project/SWPilot
git status
git add .
git commit -m "feat/fix/docs: rangkuman perubahan hari ini"
```

---

## 2. Saat Ingin Memulai Pekerjaan Kembali Besok (Start/Resume)

Lakukan langkah-langkah ini untuk memulai dengan segar dan tanpa error:

### Langkah A: Buka Folder Proyek yang Tepat
* Pastikan Anda membuka folder **`D:\Project\SWPilot\source\swpilot`** secara langsung di Android Studio (agar plugin Flutter & Dart serta tombol Run hijau aktif otomatis).

### Langkah B: Jalankan Emulator Android
* Buka **Device Manager** di Android Studio dan jalankan emulator Anda, ATAU jalankan perintah berikut di terminal:
  ```powershell
  flutter emulators --launch SWPilot
  ```
* Tunggu sampai emulator menyala dan menampilkan layar beranda Android sepenuhnya.

### Langkah C: Jalankan Aplikasi
* Klik tombol **Play (segitiga hijau)** di Android Studio, ATAU jalankan perintah di terminal:
  ```powershell
  cd source/swpilot
  flutter run
  ```

---

## 3. Protokol Penyelamatan (Jika Terjadi Error Kompilasi/Cache)

Jika suatu saat Anda mendapatkan error build seperti `assembleDebug failed` or `Could not close incremental caches`, **jangan panik**. Cukup jalankan urutan perintah pembersihan berikut di terminal:

```powershell
# 1. Masuk ke folder Android dan hentikan paksa Gradle daemon
cd d:/Project/SWPilot/source/swpilot/android
./gradlew.bat --stop

# 2. Kembali ke folder root Flutter
cd ..

# 3. Bersihkan seluruh file build sementara
flutter clean

# 4. Unduh kembali dependensi bersih
flutter pub get

# 5. Jalankan kembali aplikasi ke emulator Anda
flutter run
```
Dengan mengikuti protokol ini, proyek Anda akan selalu berjalan bersih dan bebas dari bentrok cache Kotlin multi-drive di Windows.
