import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:pointycastle/pointycastle.dart';

void main(List<String> args) 
{
  final keybytes = randomBytes(16);
  final key = new KeyParameter(keybytes);
  final iv = randomBytes(8); // Initialization Vector
  final params = new ParametersWithIV(key, iv);

  StreamCipher cipher = new StreamCipher("Salsa20");

  // cipher.init(forEncryption, params);
  // forEncryption = true → mode enkripsi
  // forEncryption = false → mode dekripsi
  
  cipher.init(true, params); // Initialize the StreamCipher with the parameters
  // Encrypt
  String plaintext = 'hello world';
  Uint8List plain_data = createUint8ListFromString(plaintext); // membuat Uint8List secara acak menggunakan Secure Random Number
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