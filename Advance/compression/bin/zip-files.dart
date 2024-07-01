import 'dart:io';
// import 'dart:convert';
import 'package:archive/archive.dart';
import 'package:path/path.dart' as p;

void main(List<String> args) 
{
  List<String> files = [];
  Directory.current.listSync().forEach((FileSystemEntity fse) {
    if(fse.statSync().type == FileSystemEntityType.file) 
    {
      files.add(fse.path);
    }
  });

  String zipfile = r'E:\udemy_dart\Advance\test\test.zip';

  zip(files, zipfile);

  unzip(zipfile, r'E:\udemy_dart\Advance\test\decompressed');
}

void zip(List<String> files, String file)
{
  Archive archive = new Archive();
  // Archive → a collection of files that can be compressed or decompressed

  files.forEach((String path) { // files disini sudah menjadi parameter sebagai List dengan tipe String
    File file = new File(path);

    ArchiveFile archiveFile = new ArchiveFile(p.basename(path), file.lengthSync(), file.readAsBytesSync());
    archive.addFile(archiveFile);
  });

  // ZipEncoder adalah sebuah kelas yang disediakan oleh package archive dalam Dart. 
  // Kelas ini digunakan untuk mengenkode objek Archive menjadi format file zip.

  ZipEncoder encoder = new ZipEncoder();
  File f = new File(file);
  f.writeAsBytesSync(encoder.encode(archive)!.toList());
  
  // Objek Archive yang diberikan sebagai parameter adalah objek yang telah diisi dengan objek ArchiveFile sebelumnya.
  // Metode encode mengembalikan objek Encoder yang merupakan representasi dari data terenkode.

  print('Compressed');
}

void unzip(String zip, String path)
{
  File file = File(zip);

  Archive archive = new ZipDecoder().decodeBytes(file.readAsBytesSync());

  archive.forEach((ArchiveFile archiveFile ) {
    File file = new File(path + '/' + archiveFile.name);
    file.createSync(recursive: true);
    file.writeAsBytesSync(archiveFile.content);
  });

  print('Decompressed');
}

/*
  ArchiveFile archiveFile = new ArchiveFile(p.basename(path), file.lengthSync(), file.readAsBytesSync());

  → so what this does here is it makes a record and archive file goes into the archive, So we're making a zip record if you will.
  → it's a bit abstracted because we don't know if we're working with the zip or whatever
  → so the archiveFile has the path (p.basename(path)), the length in bytes (file.lengthSync()), and the actual bytes (file.readAsBytesSync())
*/