import 'dart:io';
import 'dart:convert';

void main(List<String> args) {
  String data = '';

  for (int i = 0; i < 100; i++) {
    data = data + 'Hello World\r\n';
  }

  // Original Data
  List<int> original = utf8.encode(data);

  // Compress data
  List<int> compression = gzip.encode(original);

  // Decompress data
  List<int> decompress = gzip.decode(compression);

  // print('utf8 original: ${original}');
  print('Original data: ${original.length} bytes');
  print('Compressed data: ${compression.length} bytes');
  print('Decompress data: ${decompress.length} bytes');

  String decoded = utf8.decode(decompress);
  assert(data == decoded);

  print(decoded);
}

// GZIP is just a set of algorithms that compress data

/*
  so why would you compress data?
  → let's say you want to send a lot of data accross the internet, why send 1300 bytes when you can send 44?
  → remember, the internet or your network is much slower than your actual computer and processor, so that's why you would do that and
  → and sometimes you want to compress data to put it onto the file system
*/

/*
  UTF8 Encode 
  → The line of code utf8.encode(data) is responsible for converting a string of text into a list of integers representing the bytes 
    of that string encoded in the UTF-8 format.
*/

/*
  The purpose of this code is to prepare a string of text for compression using the GZIP algorithm. 
  The GZIP algorithm operates on binary data, so the string needs to be converted into a sequence of bytes before it can be compressed.
*/