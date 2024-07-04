# Digest

Dalam konteks kode ini, `Digest` adalah sebuah kelas yang disediakan oleh paket `pointycastle` dalam bahasa pemrograman Dart. Kelas `Digest` digunakan untuk melakukan operasi hashing, yang merupakan proses mengonversi data input menjadi nilai hash yang unik dengan panjang tetap.

Fungsi utama dari kelas `Digest` adalah:

1. **Memilih algoritma hashing**: Saat membuat instance `Digest`, Anda perlu menentukan algoritma hashing yang akan digunakan, seperti 'SHA-256', 'SHA-512', atau algoritma hashing lainnya yang didukung oleh paket `pointycastle`.
2. **Memproses data input**: Kelas `Digest` menyediakan metode `process` yang menerima data input dalam bentuk `Uint8List` (daftar byte). Metode ini akan menerapkan algoritma hashing yang telah dipilih pada data input tersebut dan menghasilkan nilai hash dalam bentuk `Uint8List`.
3. **Menghasilkan nilai hash**: Setelah data input diproses menggunakan metode `process`, kelas `Digest` akan menghasilkan nilai hash dalam bentuk `Uint8List`. Nilai hash ini merupakan representasi unik dari data input yang telah dihash menggunakan algoritma hashing yang dipilih.

Dalam kode yang diberikan, instance `Digest` dibuat dengan algoritma hashing 'SHA-256', yang merupakan salah satu algoritma hashing kriptografi yang paling banyak digunakan dan dianggap aman. Nilai hash yang dihasilkan oleh SHA-256 memiliki panjang 256 bit atau 32 byte.

Dengan menggunakan kelas `Digest`, kode dapat menghasilkan nilai hash yang unik dan konsisten untuk setiap data input yang diberikan. Nilai hash ini dapat digunakan untuk berbagai tujuan, seperti memeriksa integritas data, menyimpan kata sandi dengan aman, atau membuat identitas unik untuk data tertentu.

---

# Uint8List

Dalam bahasa pemrograman Dart, `Uint8List` adalah sebuah tipe data yang merepresentasikan daftar (list) byte yang tidak bertanda (unsigned). Setiap elemen dalam `Uint8List` adalah sebuah bilangan bulat 8-bit yang nilainya berkisar antara 0 hingga 255.

Fungsi utama dari `Uint8List` adalah:

1. **Menyimpan data biner**: `Uint8List` digunakan untuk menyimpan dan memanipulasi data biner, seperti data gambar, audio, atau data terenkripsi. Data biner biasanya diwakili dalam bentuk byte, dan `Uint8List` menyediakan cara yang efisien untuk menangani data seperti itu.
2. **Operasi bit-level**: Karena `Uint8List` menyimpan data dalam bentuk byte, operasi bit-level seperti penggeseran bit (bit shifting), operasi logika bit (AND, OR, XOR), dan lain-lain dapat dilakukan dengan mudah pada data yang disimpan dalam `Uint8List`.
3. **Kompatibilitas dengan library eksternal**: Banyak library eksternal, terutama yang berkaitan dengan kriptografi, pemrosesan data biner, atau komunikasi jaringan, menggunakan `Uint8List` sebagai format data input dan output. Dengan menggunakan `Uint8List`, kode Dart dapat dengan mudah berinteraksi dengan library-library tersebut.

Dalam konteks kode yang diberikan, `Uint8List` digunakan dalam dua langkah:

1. `Uint8List data = new Uint8List.fromList(utf8.encode(value));`: Pada baris ini, string input `value` dikonversi menjadi daftar byte menggunakan `utf8.encode`. Hasilnya kemudian digunakan untuk membuat instance `Uint8List` baru yang berisi data byte tersebut.
2. `Uint8List hash = digest.process(data);`: Pada baris ini, instance `Digest` yang telah dibuat sebelumnya digunakan untuk memproses `data` (yang merupakan `Uint8List` dari string input) menggunakan algoritma hashing yang telah dipilih. Hasilnya adalah `Uint8List` baru yang berisi nilai hash dari data input.

Dengan menggunakan `Uint8List`, kode dapat dengan mudah menangani data biner dan melakukan operasi hashing pada data tersebut. Nilai hash yang dihasilkan juga disimpan dalam bentuk `Uint8List`, yang memungkinkan untuk diproses lebih lanjut atau digunakan dalam operasi lain yang melibatkan data biner.