import 'package:pointycastle/pointycastle.dart';
import 'dart:typed_data';
import 'dart:math';

void main(List<String> args) 
{
  print(randomBytes(8));
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

// AUTO SEED means that like the salt, it's going to be randomize it to an extent 
// ParametersWithIV stands for parameters with initialization vector

/*
  rnd.seed(params);

  → now what we do here with seeding is we're taking these parameters (params) and adding them in
*/

/*
  The difference between a random number and a cryptographically secure random number is that you can actually predict 
  to a certain extent the randomness of the cryptography
*/

/*
  There are some minor flaws in this, as there are with any cryptographic program

  for example 
  → we're saying var random = new Random();
    what if this dart version of random isn't actually random?
  → well then you can do what is called a numbers prediction, meaning you can kind of guess what is going to happen
  → that's why you doing chaining (AES/CTR/AUTO-SEED-PRNG) to try and avoid that
*/

/*
  What would you use this for?
  → key generation, we just talked about building a secure password, sometimes you can't trust the user to build a secure password
    sometimes you need to generate one yourself, that's when you would do something like this
*/

/*
  1. Membuat sebuah daftar (list) integer 16 byte acak dengan final key = new Uint8List(16);. Ini akan menjadi kunci kriptografi.

  2. Membuat objek KeyParameter dengan final keyParams = new KeyParameter(key);. Objek ini menyimpan kunci kriptografi yang baru saja dibuat.

  3. Membuat vektor inisialisasi (IV) baru dengan new Uint8List(16), yaitu daftar integer 16 byte acak lainnya.

  4. Membuat objek ParametersWithIV dengan final params = new ParametersWithIV(keyParams, new Uint8List(16));. 
    Objek ini menyimpan kunci kriptografi (keyParams) dan vektor inisialisasi (IV) yang baru saja dibuat.

  5. Menyemai (seed) objek SecureRandom dengan rnd.seed(params);. Objek SecureRandom ini akan menggunakan kunci kriptografi dan 
    IV yang disimpan dalam params sebagai nilai awal untuk menghasilkan bilangan acak yang aman secara kriptografi.
*/

/*
  1. rnd disemai dengan kunci kriptografi dan vektor inisialisasi menggunakan rnd.seed(params).
  2. Pengacakan tambahan dilakukan pada rnd dengan memanggil rnd.nextUint8() sejumlah iterasi acak.
  3. rnd.nextBytes(length) dipanggil untuk menghasilkan daftar byte acak dengan panjang length.
  4. Daftar byte acak ini dikembalikan sebagai output dari fungsi randomBytes.
*/