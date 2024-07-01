# FileSystemEntity

Dalam Dart, `FileSystemEntity` dan `FileSystemEntityType` adalah bagian dari library `dart:io` yang digunakan untuk bekerja dengan file system.

1. **FileSystemEntity** `FileSystemEntity` adalah kelas abstrak yang merepresentasikan entitas dalam file system, seperti file atau direktori. Kelas ini menyediakan metode-metode untuk mengakses informasi tentang entitas tersebut, seperti nama, path, tipe, dan lain-lain. Contoh penggunaan `FileSystemEntity` adalah saat Anda ingin melakukan operasi pada file atau direktori tanpa membedakan apakah itu file atau direktori.
2. **FileSystemEntityType** `FileSystemEntityType` adalah enum yang digunakan untuk menentukan tipe dari `FileSystemEntity`. Enum ini memiliki dua nilai:
- `FileSystemEntityType.file`: Menunjukkan bahwa entitas tersebut adalah file.
- `FileSystemEntityType.directory`: Menunjukkan bahwa entitas tersebut adalah direktori.

Dalam kode yang Anda berikan, `FileSystemEntity` digunakan untuk mewakili setiap entitas (file atau direktori) dalam direktori saat ini (`Directory.current`). Kemudian, `FileSystemEntityType` digunakan untuk memeriksa apakah entitas tersebut adalah file atau direktori dengan menggunakan `fse.statSync().type`.

```dart
Directory.current.listSync().forEach((FileSystemEntity fse) {
  if(fse.statSync().type == FileSystemEntityType.file) {
    files.add(fse.path);
  }
});

```

Dalam kode di atas, `listSync()` mengembalikan daftar `FileSystemEntity` yang ada dalam direktori saat ini. Kemudian, untuk setiap `FileSystemEntity` (`fse`), kode memeriksa apakah `fse` adalah file dengan menggunakan `fse.statSync().type == FileSystemEntityType.file`. Jika benar, maka path dari file tersebut (`fse.path`) ditambahkan ke daftar `files`.

Jadi, perbedaan utama antara `FileSystemEntity` dan `FileSystemEntityType` adalah:

- `FileSystemEntity` adalah kelas abstrak yang merepresentasikan entitas file system (file atau direktori).
- `FileSystemEntityType` adalah enum yang digunakan untuk menentukan apakah `FileSystemEntity` tersebut adalah file atau direktori.

---

# statSync()

Dalam konteks `dart:io`, `statSync()` adalah sebuah metode yang digunakan untuk mendapatkan informasi tentang sebuah `FileSystemEntity` (file atau direktori) secara sinkron (synchronous).

Metode `statSync()` mengembalikan sebuah objek `FileStat` yang berisi informasi detail tentang entitas file system tersebut, seperti:

- `type`: Tipe dari entitas file system (file atau direktori), diwakili oleh `FileSystemEntityType`.
- `mode`: Mode akses dari entitas file system (baca, tulis, eksekusi).
- `size`: Ukuran dari entitas file system dalam byte (jika entitas adalah file).
- `modified`, `accessed`, `changed`: Waktu terakhir entitas file system dimodifikasi, diakses, atau diubah.

Dalam kode yang Anda berikan, `statSync()` digunakan untuk mendapatkan tipe dari `FileSystemEntity` (`fse`) dengan mengakses properti `type` dari objek `FileStat` yang dikembalikan oleh `fse.statSync()`.

```dart
if (fse.statSync().type == FileSystemEntityType.file) {
  // ...
}

```

Dengan menggunakan `statSync()`, kode dapat membedakan apakah `FileSystemEntity` tersebut adalah file atau direktori, dan kemudian melakukan operasi yang sesuai (dalam kasus ini, menambahkan path file ke daftar `files`).

Perlu diingat bahwa `statSync()` adalah metode sinkron, yang berarti kode akan menunggu hingga operasi selesai sebelum melanjutkan ke baris berikutnya. Jika Anda ingin mendapatkan informasi tentang `FileSystemEntity` secara asinkron (non-blocking), Anda dapat menggunakan metode `stat()` yang mengembalikan objek `Future<FileStat>`.

---

# Archive

`Archive` adalah sebuah kelas yang disediakan oleh package `archive` dalam Dart. Kelas ini digunakan untuk merepresentasikan sebuah archive (seperti file zip, tar, atau format archive lainnya) secara internal.

Dalam kode yang Anda berikan, `Archive` digunakan pada baris berikut:

```dart
Archive archive = new Archive();

```

Fungsi utama dari `Archive` adalah sebagai wadah untuk menyimpan daftar file yang akan dimasukkan ke dalam archive. Setiap file direpresentasikan oleh objek `ArchiveFile` yang berisi informasi seperti nama file, ukuran file, dan isi file.

Objek `Archive` memiliki metode `addFile` yang digunakan untuk menambahkan objek `ArchiveFile` ke dalam daftar file yang akan dimasukkan ke dalam archive. Dalam kode Anda, metode `addFile` digunakan seperti ini:

```dart
archive.addFile(archiveFile);

```

Di mana `archiveFile` adalah objek `ArchiveFile` yang telah dibuat sebelumnya.

Setelah semua file yang diinginkan telah ditambahkan ke dalam objek `Archive`, objek tersebut kemudian dapat dienkode menjadi format archive yang sebenarnya (seperti file zip) menggunakan encoder yang sesuai (seperti `ZipEncoder`).

Jadi, secara umum, fungsi utama dari `Archive` adalah:

1. Menyediakan wadah untuk menyimpan daftar file yang akan dimasukkan ke dalam archive.
2. Memungkinkan penambahan file ke dalam daftar file menggunakan metode `addFile`.
3. Menyediakan representasi internal dari archive yang dapat dienkode menjadi format archive yang sebenarnya (seperti file zip) menggunakan encoder yang sesuai.

Dengan demikian, `Archive` bertindak sebagai abstraksi yang memudahkan proses pembuatan archive dengan menyediakan cara untuk merepresentasikan file-file yang akan dimasukkan ke dalam archive tersebut, sebelum akhirnya dienkode menjadi format archive yang sebenarnya.

---

# ArchiveFile

`ArchiveFile` adalah sebuah kelas yang disediakan oleh package `archive` dalam Dart. Kelas ini digunakan untuk merepresentasikan sebuah file yang akan dimasukkan ke dalam sebuah archive (seperti file zip, tar, atau format archive lainnya).

Ketika membuat objek `ArchiveFile`, Anda perlu memberikan tiga parameter:

1. **Nama file**: Ini adalah nama file yang akan ditampilkan dalam archive.
2. **Panjang file**: Ini adalah ukuran file dalam byte.
3. **Isi file**: Ini adalah data biner dari isi file yang akan dimasukkan ke dalam archive.

Dalam kode yang Anda berikan, objek `ArchiveFile` dibuat dengan menggunakan konstruktor berikut:

```dart
ArchiveFile archiveFile = new ArchiveFile(p.basename(path), file.lengthSync(), file.readAsBytesSync());

```

- `p.basename(path)` mengambil nama file dari path yang diberikan.
- `file.lengthSync()` mendapatkan ukuran file dalam byte secara sinkron.
- `file.readAsBytesSync()` membaca isi file sebagai daftar byte secara sinkron.

Setelah objek `ArchiveFile` dibuat, objek tersebut kemudian ditambahkan ke dalam objek `Archive` yang merupakan representasi dari archive yang akan dibuat.

```dart
archive.addFile(archiveFile);

```

Dengan demikian, `ArchiveFile` bertindak sebagai wadah untuk menyimpan informasi tentang file yang akan dimasukkan ke dalam archive, seperti nama file, ukuran file, dan isi file. Objek `ArchiveFile` ini kemudian dapat digunakan oleh encoder (seperti `ZipEncoder`) untuk membuat archive yang sebenarnya.

Jadi, `ArchiveFile` adalah abstraksi yang memudahkan proses pembuatan archive dengan menyediakan cara untuk merepresentasikan file-file yang akan dimasukkan ke dalam archive tersebut.

# Loop zip

```dart
files.forEach((String path) { // files disini sudah menjadi parameter sebagai List dengan tipe String
    File file = new File(path);

    ArchiveFile archiveFile = new ArchiveFile(p.basename(path), file.lengthSync(), file.readAsBytesSync());
    archive.addFile(archiveFile);
  });
```

Bagian program tersebut merupakan bagian dari fungsi `zip` yang bertujuan untuk membuat file zip dari daftar file yang diberikan. Berikut penjelasan untuk setiap baris kode:

1. `files.forEach((String path) {`
    - Ini adalah perulangan `forEach` yang akan mengiterasi setiap elemen dalam daftar `files` yang berisi path file.
2. `File file = new File(path);`
    - Membuat objek `File` baru dari `path` yang sedang diiterasi. Objek `File` ini digunakan untuk mengakses data file tersebut.
3. `ArchiveFile archiveFile = new ArchiveFile(p.basename(path), file.lengthSync(), file.readAsBytesSync());`
    - Membuat objek `ArchiveFile` baru yang merupakan representasi dari file yang akan dimasukkan ke dalam archive (file zip).
    - `p.basename(path)` mengambil nama file dari `path` yang diberikan.
    - `file.lengthSync()` mendapatkan ukuran file dalam byte secara sinkron.
    - `file.readAsBytesSync()` membaca isi file sebagai daftar byte secara sinkron.
4. `archive.addFile(archiveFile);`
    - Menambahkan `archiveFile` yang telah dibuat ke dalam objek `archive` yang merupakan representasi dari file zip yang akan dibuat.

Jadi, secara keseluruhan, bagian program tersebut melakukan iterasi pada setiap file dalam daftar `files`, membuat objek `File` dari path file tersebut, membuat objek `ArchiveFile` yang berisi informasi file (nama, ukuran, dan isi file), dan menambahkan `ArchiveFile` tersebut ke dalam objek `archive` yang merupakan file zip yang sedang dibuat.

Setelah perulangan selesai, objek `archive` akan berisi semua file yang akan dimasukkan ke dalam file zip. Kemudian, objek `archive` ini akan dienkode menjadi file zip menggunakan `ZipEncoder` dan ditulis ke dalam file zip yang ditentukan.

---

# ZipEncoder

`ZipEncoder` adalah sebuah kelas yang disediakan oleh package `archive` dalam Dart. Kelas ini digunakan untuk mengenkode objek `Archive` menjadi format file zip.

Dalam kode yang Anda berikan, `ZipEncoder` digunakan pada baris berikut:

```dart
ZipEncoder encoder = new ZipEncoder();
File f = new File(file);
f.writeAsBytesSync(encoder.encode(archive)!.toList());

```

Berikut adalah penjelasan fungsi dari `ZipEncoder`:

1. `ZipEncoder encoder = new ZipEncoder();`
    - Membuat objek `ZipEncoder` baru.
2. `encoder.encode(archive)`
    - Metode `encode` pada objek `ZipEncoder` digunakan untuk mengenkode objek `Archive` yang berisi daftar file yang akan dimasukkan ke dalam file zip.
    - Objek `Archive` yang diberikan sebagai parameter adalah objek yang telah diisi dengan objek `ArchiveFile` sebelumnya.
    - Metode `encode` mengembalikan objek `Encoder` yang merupakan representasi dari data terenkode.
3. `encoder.encode(archive)!.toList()`
    - Operator `!` digunakan untuk memastikan bahwa `encode` tidak mengembalikan `null`.
    - Metode `toList()` digunakan untuk mengonversi objek `Encoder` menjadi daftar byte yang merupakan representasi biner dari file zip yang dienkode.
4. `f.writeAsBytesSync(encoder.encode(archive)!.toList());`
    - Objek `File` `f` dibuat dengan path file zip yang ditentukan.
    - Metode `writeAsBytesSync` digunakan untuk menulis daftar byte yang dihasilkan oleh `ZipEncoder` ke dalam file zip tersebut secara sinkron.

Jadi, `ZipEncoder` bertanggung jawab untuk mengonversi objek `Archive` yang berisi daftar file menjadi format file zip yang valid. Hasil enkode ini kemudian ditulis ke dalam file zip yang ditentukan menggunakan metode `writeAsBytesSync` pada objek `File`.

Dengan demikian, `ZipEncoder` memungkinkan Anda untuk membuat file zip dari daftar file yang diberikan dengan menggunakan objek `Archive` sebagai representasi internal dari file-file yang akan dimasukkan ke dalam file zip.

## Secara sederhana ZipEncoder

Secara sederhana, fungsi dari masing-masing komponen tersebut adalah:

1. **ZipEncoder()**
    - Digunakan untuk mengenkode objek `Archive` menjadi format file zip yang valid.
    - Bertindak sebagai "pengompresi" yang mengonversi data menjadi format zip.
2. **Archive**
    - Merupakan representasi internal dari daftar file yang akan dimasukkan ke dalam file zip.
    - Berisi kumpulan objek `ArchiveFile` yang mewakili setiap file yang akan dikompresi.
3. **f.writeAsBytesSync(encoder.encode(archive)!.toList());**
    - `encoder.encode(archive)` mengenkode objek `Archive` menjadi format zip menggunakan `ZipEncoder`.
    - `encoder.encode(archive)!.toList()` mengonversi hasil enkode menjadi daftar byte yang merupakan representasi biner dari file zip.
    - `f.writeAsBytesSync(...)` menulis daftar byte tersebut ke dalam file zip yang ditentukan secara sinkron.

Jadi, secara garis besar, proses yang terjadi adalah:

1. Daftar file yang akan dikompresi direpresentasikan dalam objek `Archive`.
2. Objek `Archive` tersebut dienkode menjadi format zip menggunakan `ZipEncoder`.
3. Hasil enkode (dalam bentuk daftar byte) ditulis ke dalam file zip yang ditentukan.

Dengan demikian, `ZipEncoder` bertindak sebagai "pengompresi" yang mengonversi data menjadi format zip, `Archive` mewakili data yang akan dikompresi, dan perintah `writeAsBytesSync` digunakan untuk menyimpan hasil kompresi ke dalam file zip yang ditentukan.

---

# Loop unzip

Program tersebut merupakan bagian dari fungsi `unzip` yang bertujuan untuk mengekstrak file-file dari sebuah file zip ke dalam sebuah direktori tujuan.

Berikut penjelasan untuk setiap baris kode:

1. `archive.forEach((ArchiveFile archiveFile ) {`
    - Ini adalah perulangan `forEach` yang akan mengiterasi setiap `ArchiveFile` yang ada di dalam objek `archive` yang merupakan representasi dari file zip.
2. `File file = new File(path + '/' + archiveFile.name);`
    - Membuat objek `File` baru dengan path yang terdiri dari `path` (direktori tujuan) dan `archiveFile.name` (nama file yang akan diekstrak).
3. `file.createSync(recursive: true);`
    - Membuat file atau direktori (jika diperlukan) secara sinkron di path yang telah ditentukan sebelumnya.
    - Opsi `recursive: true` memungkinkan pembuatan direktori secara rekursif jika direktori induk belum ada.
4. `file.writeAsBytesSync(archiveFile.content);`
    - Menulis isi dari `archiveFile.content` (yang merupakan data biner dari file yang diekstrak) ke dalam file yang telah dibuat sebelumnya secara sinkron.

Jadi, secara keseluruhan, bagian program tersebut melakukan iterasi pada setiap `ArchiveFile` yang ada di dalam objek `archive` (file zip). Untuk setiap `ArchiveFile`, program membuat file atau direktori di path yang ditentukan (direktori tujuan + nama file), dan kemudian menulis isi dari `ArchiveFile` ke dalam file tersebut.

Setelah perulangan selesai, semua file yang ada di dalam file zip akan diekstrak ke dalam direktori tujuan yang ditentukan, dengan struktur direktori yang sama seperti dalam file zip.

Perlu diingat bahwa operasi `createSync` dan `writeAsBytesSync` adalah operasi sinkron, yang berarti program akan menunggu hingga operasi selesai sebelum melanjutkan ke iterasi berikutnya atau keluar dari perulangan.

## recursive: true

Maksud dari opsi `recursive: true` dalam `file.createSync(recursive: true)` adalah memungkinkan pembuatan direktori secara rekursif (bertingkat) jika direktori induk (parent directory) dari direktori yang ingin dibuat belum ada.

Misalnya, Anda ingin membuat sebuah file dengan path `C:/Users/user/Documents/folder1/folder2/file.txt`. Namun, direktori `folder1` dan `folder2` belum ada di dalam direktori `Documents`.

Jika Anda menggunakan `file.createSync()` tanpa opsi `recursive: true`, maka operasi tersebut akan gagal karena direktori induk (`folder1` dan `folder2`) belum ada.

Namun, dengan menggunakan `file.createSync(recursive: true)`, Dart akan secara otomatis membuat direktori `folder1` dan `folder2` terlebih dahulu sebelum membuat file `file.txt`. Ini dilakukan secara rekursif, artinya Dart akan membuat direktori induk (`folder1`) terlebih dahulu, kemudian membuat direktori di dalamnya (`folder2`), dan akhirnya membuat file `file.txt` di dalam direktori `folder2`.

Jadi, opsi `recursive: true` memungkinkan Anda untuk membuat struktur direktori yang kompleks secara otomatis tanpa harus membuat setiap direktori induk secara manual terlebih dahulu. Ini sangat berguna dalam kasus seperti mengekstrak file zip yang mungkin memiliki struktur direktori yang rumit di dalamnya.

---

# ZipDecoder

`ZipDecoder` adalah sebuah kelas yang disediakan oleh package `archive` dalam Dart. Kelas ini digunakan untuk mendekode data biner dalam format zip menjadi objek `Archive` yang merupakan representasi internal dari file-file yang terkandung di dalam file zip.

Dalam kode yang Anda berikan, `ZipDecoder` digunakan pada baris berikut:

```dart
Archive archive = new ZipDecoder().decodeBytes(file.readAsBytesSync());

```

Fungsi utama dari `ZipDecoder` adalah:

1. **Mendekode data biner dalam format zip**
    - Metode `decodeBytes` pada objek `ZipDecoder` digunakan untuk mendekode data biner (dalam bentuk daftar byte) menjadi objek `Archive`.
    - Dalam contoh kode di atas, `file.readAsBytesSync()` membaca isi dari file zip sebagai daftar byte, yang kemudian didekode menggunakan `decodeBytes`.
2. **Menghasilkan objek `Archive`**
    - Hasil dari proses dekode adalah objek `Archive` yang berisi daftar file yang terkandung dalam file zip.
    - Setiap file direpresentasikan sebagai objek `ArchiveFile` yang berisi informasi seperti nama file, ukuran file, dan isi file.

Objek `Archive` yang dihasilkan oleh `ZipDecoder` kemudian dapat digunakan untuk mengakses dan mengekstrak file-file yang terkandung di dalam file zip, seperti yang dilakukan pada bagian program lain yang Anda tunjukkan sebelumnya.

Jadi, `ZipDecoder` bertindak sebagai "pendekode" yang mengonversi data biner dari file zip menjadi representasi internal (`Archive`) yang dapat digunakan untuk mengakses dan mengekstrak file-file di dalamnya.

Dengan demikian, `ZipDecoder` merupakan pasangan dari `ZipEncoder` yang digunakan untuk mengenkode objek `Archive` menjadi format file zip. Keduanya bekerja sama untuk memungkinkan pembuatan dan ekstraksi file zip dalam Dart.

## Secara sederhana ZipDecoder

Secara sederhana, fungsi dari masing-masing komponen tersebut adalah:

1. **ZipDecoder()**
    - Digunakan untuk mendekode file zip menjadi objek `Archive`.
    - Bertindak sebagai "pemecah" yang mengonversi data zip menjadi representasi internal.
2. **Archive**
    - Merupakan representasi internal dari daftar file yang terkandung dalam file zip.
    - Berisi kumpulan objek `ArchiveFile` yang mewakili setiap file yang diekstrak.
3. **file.readAsBytesSync()**
    - Membaca isi dari file zip sebagai daftar byte secara sinkron.
    - Menghasilkan data biner yang akan didekode oleh `ZipDecoder`.
4. **decodeBytes(file.readAsBytesSync())**
    - Metode `decodeBytes` pada `ZipDecoder` digunakan untuk mendekode daftar byte yang dibaca dari file zip.
    - Menghasilkan objek `Archive` yang berisi daftar file yang diekstrak dari file zip.

Jadi, secara garis besar, proses yang terjadi adalah:

1. File zip dibaca sebagai daftar byte menggunakan `file.readAsBytesSync()`.
2. Daftar byte tersebut didekode menjadi objek `Archive` menggunakan `ZipDecoder().decodeBytes()`.
3. Objek `Archive` berisi daftar file yang diekstrak dari file zip, dengan setiap file direpresentasikan sebagai objek `ArchiveFile`.

Dengan demikian, `ZipDecoder` bertindak sebagai "pemecah" yang mengonversi data zip menjadi representasi internal (`Archive`) yang dapat digunakan untuk mengakses dan mengekstrak file-file di dalamnya.