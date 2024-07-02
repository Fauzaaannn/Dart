import 'dart:typed_data';
import 'dart:convert';
import 'package:pointycastle/pointycastle.dart';

void main(List<String> args) 
{
  Digest digest = new Digest('SHA-256');  

  String value = 'Hello World';

  Uint8List data = new Uint8List.fromList(utf8.encode(value));
  Uint8List hash = digest.process(data);

  print(hash);
  print(base64Encode(hash)); // encoding is not encryption
}

// Uint8List → Unsigned Integer Eight bit list

/*
  So, what are we doing here?

  → we're taking that string (hello world), encoding it with utf8
    and then shoving it into an Unsigned Integer Eight bit list
*/

/*
  Now, Why do we have to do this?

  → Because it's expecting the data in a specific format
*/

/*
  What is the difference between encryption and encoding?

  → encoding is meant to be encoded and decoded very easily, there is really zero protection there
    you are just flipping bits around and putting them in a different format.
  
  → encryption is meant to hide the data
  → encryption is meant to be encrypted and decrypted, there is a lot of protection there.
*/

/*
  Here's how the code achieves its purpose:

  1.First, an instance of the Digest class is created with the algorithm 'SHA-256',
    which specifies that the SHA-256 hashing algorithm will be used.

  2.The input string value is converted into a byte array (Uint8List) using the utf8.encode function. 
    This step is necessary because the hashing algorithm operates on byte data, not directly on strings.

  3.The digest.process function is called with the byte array as input, which performs the actual hashing operation using the SHA-256 algorithm. 
    The result is a new byte array (Uint8List) containing the hash value.

  4.The hash value byte array is printed to the console using print(hash).

  5.Additionally, the hash value byte array is converted to a Base64-encoded string using the base64Encode function, 
  and this encoded string is also printed to the console.
*/
