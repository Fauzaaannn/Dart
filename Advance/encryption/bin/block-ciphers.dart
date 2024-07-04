import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:pointycastle/pointycastle.dart';

// AES → Advanced Encryption Standard
void main(List<String> args) 
{
  final key = randomBytes(16);
  final params = new KeyParameter(key);

  BlockCipher cipher = new BlockCipher("AES");
  cipher.init(true, params);

  // Encrypt
  String plaintext = 'Hello World';
  Uint8List plain_data = createUint8ListFromString(plaintext.padRight(cipher.blockSize)); // PAD - THIS IS NOT 1000 PERCENT SECURE
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

  print(utf8.decode(decrypted_data).trim());
  // the trim is simply because there is a padding (padRight(cipher.blockSize))
  // if you use cryptographically secure pad, you're going to have to actually trim it differently
  // meaning you're going to do a mid or actually get a subset of the string.
}

/*
  So, what a block cipher does is instead of stream of data, it takes a block of data and it expects that data will be in specific blocks.
  and what it will do is it has different modes, depending on how you use the modes, depends on how each block is ciphered.
*/

/*
  Uint8List plain_data = createUint8ListFromString(plaintext.padRight(cipher.blockSize)); // PAD - THIS IS NOT 1000 PERCENT SECURE

  and here is why
  → you should use a cryptographic padding 
  → you could pad it with just random data and add a bit to the front to tell you how big it is (blockSize) (like the example above)
    but there ae cryptographic patterns that go along with this 
*/

// From Deriving Keys
Uint8List createUint8ListFromString(String value) 
=> new Uint8List.fromList(utf8.encode(value));

void displayUint8List(String title, Uint8List value)
{
  print(title);
  print(value);
  print(base64Encode(value));
  print(' ');
}

// From Secure Random Number
Uint8List randomBytes(int length)
{
  final rnd = new SecureRandom("AES/CTR/AUTO-SEED-PRNG");

  final key = new Uint8List(16); // Kunci Kriptografi
  final keyParams = new KeyParameter(key); // yang menyimpan kunci kriptografi
  final params = new ParametersWithIV(keyParams, new Uint8List(16));
  // menyimpan kunci kriptografi dan IV yang baru saja dibuat

  rnd.seed(params);

  // Pengacakan Random Number kedua
  var random = new Random();
  for (int i = 0; i < random.nextInt(255); i++) 
  {
    rnd.nextUint8();
  }
  // grab a random number between 0 and 255, and grab the number

  var bytes = rnd.nextBytes(length);
  return bytes;
}