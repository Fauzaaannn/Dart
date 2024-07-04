import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:pointycastle/pointycastle.dart';

void main(List<String> args) 
{
  final keybytes = randomBytes(16);
  final key = new KeyParameter(keybytes);
  final iv = randomBytes(8); // Initialization Vector
  final params = new ParametersWithIV(key, iv);

  StreamCipher cipher = new StreamCipher("Salsa20");
  
  cipher.init(true, params); 
  // Encrypt
  String plaintext = 'hello world';
  Uint8List plain_data = createUint8ListFromString(plaintext); 
  Uint8List encrypted_data = cipher.process(plain_data);

  // Decrypt
  cipher.reset();
  cipher.init(false, params);
  Uint8List decrypted_data = cipher.process(encrypted_data);

  Digest digest = new Digest('SHA-256');  
  assert(base64.encode(digest.process(plain_data)) == base64.encode(decrypted_data));

  print('it works');

  displayUint8List('Plain Text', plain_data);
  displayUint8List('Encrypted Data', encrypted_data);
  displayUint8List('Decrypted Data', decrypted_data);
}

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

  final key = new Uint8List(16); 
  final keyParams = new KeyParameter(key); 
  final params = new ParametersWithIV(keyParams, new Uint8List(16));

  rnd.seed(params);

  // Pengacakan Random Number kedua
  var random = new Random();
  for (int i = 0; i < random.nextInt(255); i++) 
  {
    rnd.nextUint8();
  }

  var bytes = rnd.nextBytes(length);
  return bytes;
}