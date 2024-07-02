// Compress some data using GZIP or ZLIB and write it to a file, then decompress it and print it on the screen.

import 'dart:io';
import 'dart:convert';

void main(List<String> args) 
{
  String compressed = Directory.current.path + '/compressed.txt';

  File file = new File(compressed);
  file.createSync();
  file.writeAsBytesSync(gzip.encode(utf8.encode('Hello World')));

  print(utf8.decode(gzip.decode(file.readAsBytesSync())));
}

/*
  Here's how the code achieves its purpose:

  1. First, it constructs the file path for the compressed file by combining the current directory path with the filename 'compressed.txt'.
  2. It creates a new file at the specified path using File.createSync().
  3. The string 'Hello World' is converted to a list of bytes using utf8.encode().
  4. The list of bytes is compressed using the GZIP algorithm with gzip.encode().
  5. The compressed data is written to the file using file.writeAsBytesSync().
  6. The compressed data is read from the file using file.readAsBytesSync().
  7. The compressed data is decompressed using gzip.decode().
  8. The decompressed data, which is a list of bytes, is converted back to a string using utf8.decode().
  9. Finally, the decompressed string is printed to the console using print().
*/