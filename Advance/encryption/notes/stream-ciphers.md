```dart
import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:pointycastle/pointycastle.dart';

void main(List<String> args) 
{
  final keybytes = randomBytes(16);
  final key = new KeyParameter(keybytes);
  final iv = randomBytes(8);
  final params = new ParametersWithIV(key, iv);

  StreamCipher cipher = new StreamCipher("Salsa20");
  // cipher.init(forEncryption, params);
  // forEncryption = true → enkripsi
  // forEncryption = false → dekripsi
  
  cipher.init(true, params); // Initialize the StreamCipher with the parameters
  // Encrypt
  String plaintext = 'hello world';
  Uint8List plain_data = createUint8ListFromString(plaintext);
  Uint8List encrypted_data = cipher.process(plain_data);

  // Decrypt
  cipher.reset();
  cipher.init(false, params);
  Uint8List decrypted_data = cipher.process(encrypted_data);

  displayUint8List('Plain Text', plain_data);
  displayUint8List('Encrypted Data', encrypted_data);
  displayUint8List('Decrypted Data', decrypted_data);

  // Make sure they match
  Function eq = const ListEquality().equals;
  assert(eq(plain_data, decrypted_data));

  print(utf8.decode(decrypted_data));
}

// StreamCipher → is this going to take the data as it comes, think of it as like a literal stream, 
// but instead of water, it's a stream of data

Uint8List createUint8ListFromString(String value) 
=> new Uint8List.fromList(utf8.encode(value));

void displayUint8List(String title, Uint8List value)
{
  print(title);
  print(value);
  print(base64Encode(value));
  print(' ');
}

Uint8List randomBytes(int length)
{
  final rnd = new SecureRandom("AES/CTR/AUTO-SEED-PRNG");

  final key = new Uint8List(16); // Kunci Kriptografi
  final keyParams = new KeyParameter(key); // yang menyimpan kunci kriptografi
  final params = new ParametersWithIV(keyParams, new Uint8List(16));
  // menyimpan kunci kriptografi dan IV yang baru saja dibuat

  rnd.seed(params);

  var random = new Random();
  for (int i = 0; i < random.nextInt(255); i++) 
  {
    rnd.nextUint8();
  }
  // grab a random number between 0 and 255, and grab the number

  var bytes = rnd.nextBytes(length);
  return bytes;
}
```

---

# StreamCiphers

Dalam konteks kode yang diberikan, objek `StreamCipher` adalah objek yang digunakan untuk melakukan enkripsi dan dekripsi data menggunakan algoritma stream cipher. Objek ini merupakan bagian dari library `pointycastle` yang diimpor di awal kode.

Fungsi utama dari objek `StreamCipher` adalah:

1. **Inisialisasi algoritma stream cipher**: Objek `StreamCipher` diinisialisasi dengan nama algoritma stream cipher yang akan digunakan, dalam kasus ini adalah "Salsa20". Contoh:

```dart
StreamCipher cipher = new StreamCipher("Salsa20");

```

1. **Mengatur mode operasi (enkripsi atau dekripsi)**: Objek `StreamCipher` dapat diinisialisasi untuk mode enkripsi atau dekripsi menggunakan metode `init()`. Metode ini menerima dua argumen: `forEncryption` (boolean) yang menentukan mode operasi, dan `params` (objek `ParametersWithIV`) yang berisi kunci enkripsi dan vektor inisialisasi (IV). Contoh:

```dart
cipher.init(true, params); // Mode enkripsi
cipher.init(false, params); // Mode dekripsi

```

1. **Enkripsi dan dekripsi data**: Setelah diinisialisasi dengan mode operasi yang diinginkan, objek `StreamCipher` dapat digunakan untuk mengenkripsi atau mendekripsi data menggunakan metode `process()`. Metode ini menerima daftar byte (`Uint8List`) sebagai input dan mengembalikan daftar byte yang telah dienkripsi atau didekripsi. Contoh:

```dart
Uint8List encrypted_data = cipher.process(plain_data); // Enkripsi
Uint8List decrypted_data = cipher.process(encrypted_data); // Dekripsi

```

1. **Reset state internal**: Objek `StreamCipher` memiliki metode `reset()` yang digunakan untuk mengembalikan state internal objek ke keadaan awal. Ini diperlukan sebelum menginisialisasi ulang objek dengan mode operasi yang berbeda (enkripsi atau dekripsi).

Jadi, objek `StreamCipher` bertindak sebagai antarmuka untuk menggunakan algoritma stream cipher dalam melakukan enkripsi dan dekripsi data. Objek ini memungkinkan pengguna untuk memilih algoritma stream cipher yang diinginkan, mengatur mode operasi (enkripsi atau dekripsi), dan melakukan enkripsi atau dekripsi data menggunakan metode `process()`. Objek ini juga menyediakan metode `reset()` untuk mengembalikan state internal objek ke keadaan awal sebelum diinisialisasi ulang dengan mode operasi yang berbeda.

## Secara Umum

Secara umum, objek `StreamCipher` adalah sebuah objek atau kelas yang digunakan untuk melakukan enkripsi dan dekripsi data menggunakan algoritma stream cipher.

Stream cipher adalah jenis algoritma kriptografi yang mengenkripsi data secara kontinyu, satu bit atau satu byte pada satu waktu, menggunakan kunci kriptografi dan vektor inisialisasi (IV). Algoritma ini berbeda dengan algoritma blok cipher yang mengenkripsi data dalam blok-blok dengan ukuran tetap.

Objek `StreamCipher` biasanya menyediakan metode atau fungsi untuk:

1. **Inisialisasi algoritma stream cipher**: Objek `StreamCipher` perlu diinisialisasi dengan algoritma stream cipher tertentu yang akan digunakan, seperti AES-CTR, ChaCha20, atau RC4.
2. **Mengatur mode operasi (enkripsi atau dekripsi)**: Objek `StreamCipher` dapat diatur untuk mode enkripsi atau dekripsi, tergantung pada operasi yang akan dilakukan.
3. **Mengatur kunci kriptografi dan vektor inisialisasi (IV)**: Objek `StreamCipher` perlu diatur dengan kunci kriptografi dan vektor inisialisasi (IV) yang akan digunakan dalam proses enkripsi atau dekripsi.
4. **Enkripsi dan dekripsi data**: Objek `StreamCipher` menyediakan metode atau fungsi untuk mengenkripsi atau mendekripsi data menggunakan algoritma stream cipher yang telah diinisialisasi sebelumnya.
5. **Reset state internal**: Objek `StreamCipher` mungkin memiliki metode atau fungsi untuk mereset state internal objek, yang diperlukan sebelum menginisialisasi ulang objek dengan konfigurasi yang berbeda.

Jadi, secara umum, objek `StreamCipher` bertindak sebagai antarmuka atau abstraksi untuk menggunakan algoritma stream cipher dalam melakukan enkripsi dan dekripsi data secara aman. Objek ini memungkinkan pengguna untuk memilih algoritma stream cipher yang diinginkan, mengatur kunci kriptografi dan vektor inisialisasi, serta melakukan enkripsi atau dekripsi data dengan mudah.

---

# Process

Berdasarkan konteks kode yang diberikan, metode `process()` adalah metode yang dimiliki oleh objek `StreamCipher` yang digunakan untuk mengenkripsi atau mendekripsi data biner (Uint8List) menggunakan algoritma stream cipher yang telah diinisialisasi sebelumnya.

Dalam kode ini, metode `process()` dipanggil dengan argumen `plain_data` (daftar byte dari plaintext) untuk mengenkripsi data tersebut:

```dart
Uint8List encrypted_data = cipher.process(plain_data);

```

Metode `process()` akan mengambil daftar byte `plain_data` sebagai input, dan mengenkripsinya menggunakan algoritma stream cipher yang telah diinisialisasi sebelumnya (dalam kasus ini, algoritma Salsa20). Hasilnya adalah daftar byte yang terenkripsi, yang kemudian disimpan dalam variabel `encrypted_data`.

Metode `process()` juga dapat digunakan untuk mendekripsi data yang telah dienkripsi sebelumnya. Dalam kode ini, setelah mengenkripsi data, objek `cipher` direset dan diinisialisasi kembali untuk mode dekripsi:

```dart
cipher.reset();
cipher.init(false, params);
Uint8List decrypted_data = cipher.process(encrypted_data);

```

Pada baris terakhir, metode `process()` dipanggil dengan argumen `encrypted_data` (data yang telah dienkripsi sebelumnya). Metode ini akan mendekripsi data tersebut menggunakan algoritma stream cipher yang telah diinisialisasi untuk mode dekripsi, dan menghasilkan daftar byte yang terdekripsi, yang kemudian disimpan dalam variabel `decrypted_data`.

Jadi, secara umum, metode `process()` digunakan untuk mengenkripsi atau mendekripsi data biner (Uint8List) menggunakan algoritma stream cipher yang telah diinisialisasi sebelumnya. Metode ini mengambil daftar byte sebagai input, dan menghasilkan daftar byte yang terenkripsi atau terdekripsi sebagai output, tergantung pada mode operasi (enkripsi atau dekripsi) yang telah diinisialisasi pada objek `StreamCipher`.

## Cara mengatur process untuk enkripsi dan dekripsi

Berdasarkan kode yang diberikan, untuk mengatur metode `process()` agar dapat melakukan enkripsi atau dekripsi, kita perlu menginisialisasi objek `StreamCipher` dengan mode operasi yang sesuai sebelum memanggil metode `process()`.

Dalam kode ini, inisialisasi mode operasi dilakukan dengan memanggil metode `init()` pada objek `StreamCipher`. Metode `init()` menerima dua argumen:

1. `forEncryption` (boolean): `true` untuk mode enkripsi, `false` untuk mode dekripsi.
2. `params` (objek `ParametersWithIV`): objek yang berisi kunci enkripsi dan vektor inisialisasi (IV) yang digunakan oleh algoritma stream cipher.

Untuk enkripsi, kode melakukan inisialisasi seperti ini:

```dart
StreamCipher cipher = new StreamCipher("Salsa20");
cipher.init(true, params); // enkripsi (true)

```

Argumen `true` pada `cipher.init(true, params)` menginstruksikan objek `StreamCipher` untuk diinisialisasi dalam mode enkripsi.

Setelah diinisialisasi dalam mode enkripsi, kita dapat memanggil `cipher.process(plain_data)` untuk mengenkripsi data `plain_data`.

Untuk dekripsi, kode melakukan inisialisasi seperti ini:

```dart
cipher.reset();
cipher.init(false, params); // dekripsi (false)
Uint8List decrypted_data = cipher.process(encrypted_data);

```

Pertama, objek `StreamCipher` direset dengan `cipher.reset()`. Kemudian, objek diinisialisasi dalam mode dekripsi dengan `cipher.init(false, params)`. Argumen `false` menginstruksikan objek `StreamCipher` untuk diinisialisasi dalam mode dekripsi.

Setelah diinisialisasi dalam mode dekripsi, kita dapat memanggil `cipher.process(encrypted_data)` untuk mendekripsi data `encrypted_data` yang sebelumnya telah dienkripsi.

Jadi, untuk mengatur metode `process()` agar dapat melakukan enkripsi atau dekripsi, kita perlu menginisialisasi objek `StreamCipher` dengan mode operasi yang sesuai (enkripsi atau dekripsi) menggunakan metode `init()` sebelum memanggil metode `process()`. Argumen `forEncryption` pada `init()` diatur menjadi `true` untuk enkripsi, dan `false` untuk dekripsi.

---

# Reset

Berdasarkan konteks kode yang diberikan, fungsi `reset()` digunakan untuk mereset keadaan objek `StreamCipher` sebelum melakukan operasi dekripsi.

Dalam kode ini, setelah melakukan enkripsi dengan memanggil `cipher.process(plain_data)`, objek `StreamCipher` direset dengan memanggil `cipher.reset()`:

```dart
// Encrypt
Uint8List encrypted_data = cipher.process(plain_data);

// Decrypt
cipher.reset();
cipher.init(false, params);
Uint8List decrypted_data = cipher.process(encrypted_data);

```

Pemanggilan `cipher.reset()` diperlukan sebelum melakukan operasi dekripsi karena objek `StreamCipher` mempertahankan state internal yang digunakan selama proses enkripsi atau dekripsi. Jika tidak direset, state internal tersebut dapat memengaruhi operasi dekripsi yang akan dilakukan selanjutnya.

Dengan memanggil `reset()`, objek `StreamCipher` akan mengembalikan state internalnya ke keadaan awal, sehingga siap untuk diinisialisasi kembali dengan mode operasi yang berbeda (dalam kasus ini, mode dekripsi).

Setelah objek `StreamCipher` direset dengan `cipher.reset()`, kode kemudian menginisialisasi ulang objek tersebut dalam mode dekripsi dengan memanggil `cipher.init(false, params)`. Dengan demikian, objek `StreamCipher` siap untuk melakukan operasi dekripsi dengan memanggil `cipher.process(encrypted_data)`.

Jadi, fungsi utama dari `reset()` adalah untuk mengembalikan state internal objek `StreamCipher` ke keadaan awal, sehingga objek tersebut dapat diinisialisasi ulang dengan mode operasi yang berbeda (enkripsi atau dekripsi) tanpa dipengaruhi oleh state internal sebelumnya.

---

# Pengecekan Kesamaan data

```dart
Function eq = const ListEquality().equals;
  assert(eq(plain_data, decrypted_data));
```

Bagian program ini berfungsi untuk memverifikasi apakah data yang didekripsi (`decrypted_data`) sama persis dengan data plaintext asli (`plain_data`). Ini dilakukan untuk memastikan bahwa proses enkripsi dan dekripsi berjalan dengan benar.

Berikut adalah penjelasan lebih rinci tentang cara kerja bagian program tersebut:

1. `Function eq = const ListEquality().equals;`
    - Baris ini mendefinisikan sebuah variabel `eq` yang berisi referensi ke fungsi `equals` dari objek `ListEquality`.
    - `ListEquality` adalah kelas yang disediakan oleh package `collection` dalam Dart, yang diimpor di awal kode dengan `import 'package:collection/collection.dart';`.
    - Kelas `ListEquality` menyediakan metode `equals` yang dapat digunakan untuk membandingkan dua daftar (list) secara nilai-per-nilai.
    - Dengan menggunakan `const ListEquality().equals`, kita mendapatkan referensi ke fungsi `equals` yang dapat digunakan untuk membandingkan dua daftar secara nilai-per-nilai.
2. `assert(eq(plain_data, decrypted_data));`
    - Baris ini menggunakan pernyataan `assert` dalam Dart, yang digunakan untuk memverifikasi kondisi tertentu dalam mode debug.
    - `eq(plain_data, decrypted_data)` memanggil fungsi `equals` dari `ListEquality` dengan argumen `plain_data` dan `decrypted_data`.
    - Fungsi `equals` akan membandingkan setiap nilai dalam `plain_data` dan `decrypted_data` secara berurutan.
    - Jika semua nilai dalam `plain_data` dan `decrypted_data` sama persis, maka fungsi `equals` akan mengembalikan `true`.
    - Pernyataan `assert(eq(plain_data, decrypted_data))` akan menghasilkan kesalahan (exception) jika kondisi di dalam tanda kurung (`eq(plain_data, decrypted_data)`) bernilai `false`.

Jadi, bagian program ini menggunakan `ListEquality` untuk membandingkan setiap byte dalam `plain_data` (data plaintext asli) dan `decrypted_data` (data yang telah didekripsi). Jika semua byte dalam `plain_data` dan `decrypted_data` sama persis, maka proses enkripsi dan dekripsi dianggap berhasil. Namun, jika terdapat perbedaan dalam nilai byte antara `plain_data` dan `decrypted_data`, maka pernyataan `assert` akan menghasilkan kesalahan, yang menandakan bahwa proses enkripsi atau dekripsi tidak berjalan dengan benar.

Dengan demikian, bagian program ini bertindak sebagai verifikasi untuk memastikan bahwa data yang didekripsi sama persis dengan data plaintext asli, sehingga kita dapat yakin bahwa algoritma stream cipher yang digunakan berfungsi dengan baik.