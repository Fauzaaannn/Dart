import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/pointycastle.dart';

void main(List<String> args) 
{
  String password = "password"  ;

  var salt = createUint8ListFromString('salt');
  var pkcs = new KeyDerivator('SHA-1/HMAC/PBKDF2');
  var params = new Pbkdf2Parameters(salt, 100, 16);

  pkcs.init(params); // inisialisasi KeyDerivator with Pbkdf2Parameters

  Uint8List key = pkcs.process(createUint8ListFromString(password));

  display('Key value', key);
}

Uint8List createUint8ListFromString(String value) 
=> new Uint8List.fromList(utf8.encode(value));

void display(String title, Uint8List value)
{
  print(title);
  print(value);
  print(base64Encode(value));
  print(' ');
}

/*
  What is salt?

  → Well, let's say you write a program and your friend writes a program and you use the same algorithm, 
    well you're gonna get the same key, the same result, and it's not very secure. 
  → so what the salt does is actually takes the same algorithm and randomize it a bit
  → so think of the salt as like a key for the key or a initializer.
*/

/*
  1. Salt dan password yang awalnya berupa string, dikonversi menjadi Uint8List (daftar byte)
    menggunakan fungsi createUint8ListFromString.

  2. Objek Pbkdf2Parameters dibuat dengan menggunakan salt, jumlah iterasi (100), 
    dan panjang kunci yang diinginkan (16 byte).

  3. Objek KeyDerivator yang menggunakan algoritma PBKDF2 diinisialisasi dengan parameter-parameter dari Pbkdf2Parameters.

  4. KeyDerivator kemudian mengeksekusi algoritma PBKDF2 dengan menggunakan password (dalam bentuk Uint8List) 
    dan salt yang telah disiapkan sebelumnya.

  5. Proses ini menghasilkan sebuah kunci kriptografi (cryptographic key) dalam bentuk Uint8List yang lebih aman 
    dan kuat dibandingkan hanya menggunakan password saja.
*/

/* Output
  Key value
  [133, 149, 215, 174, 160, 231, 201, 82, 163, 90, 249, 168, 56, 204, 107, 57]
  hZXXrqDnyVKjWvmoOMxrOQ==
*/