import 'dart:io';
import 'dart:convert';

void main(List<String> args) {
  final zlib = testCompressor(ZLibCodec());
  final gzip = testCompressor(GZipCodec());

  print('zlib = ${zlib}');
  print('gzip = ${gzip}');
}

String generateData() {
  String data = "";

  for (int i = 0; i < 1000; i++) {
    data = data + 'Hello World';
  }

  return data;
}

int testCompressor(var codec) {
  String data = generateData();

  List<int> original = utf8.encode(data);
  List<int> compressed = codec.encode(original);
  List<int> decompressed = codec.decode(compressed);

  print('testing ${codec.toString()}');
  print("original: ${original.length}");
  print("compressed: ${compressed.length}");
  print("decompressed: ${decompressed.length}");
  // print(decompressed);

  print('');

  String decoded = utf8.decode(decompressed);
  assert(data == decoded);
  // print(decoded);

  return compressed.length;
}

/*
  tradeoff
  → gzip is slightly faster
  → zlib has a better compression ratio
  → speed and compression ratio is always the tradeoff when working with different codecs 
*/

/* 
  String decoded = utf8.decode(decompressed);
  assert(data == decoded);

  Logic and Algorithm:

  → The utf8.decode(decompressed) line converts the decompressed list of integers back into a string using the UTF-8 encoding. 
    This string represents the decompressed data.

  → The assert(data == decoded) line compares the original data string with the decoded string (which is the decompressed data). 
    If the two strings are not equal, the assertion will fail, and an error will be raised.
*/

/*
  String decoded = utf8.decode(decompressed);
  assert(data == decoded);

  Important Logic Flows and Data Transformations:

  → The original data is first converted to a list of integers using utf8.encode(data).
  → This list of integers is then compressed using the codec.encode(original) method, resulting in the compressed list.
  → The compressed list is decompressed using the codec.decode(compressed) method, resulting in the decompressed list.
  → Finally, the decompressed list is converted back to a string using utf8.decode(decompressed), 
    and this string is compared with the original data string to ensure that the compression and decompression process did not alter the data.
*/