import 'dart:io';
import 'dart:async';

void main(List<String> args) {
  Directory dir = Directory.current;
  print(dir.path);

  File file = new File(dir.path + '/assignment.txt');

  writeFile(file);
  readFile(file);
  deleteFile(file);
}

void writeFile(File file) {
  // Append, Write
  RandomAccessFile raf = file.openSync(mode: FileMode.write);
  raf.writeStringSync('Hello World!');
  raf.flushSync();
  raf.closeSync();
}

void readFile(File file) {
  if (!file.existsSync()) {
    print('file not found');
    return;
  }

  print('Reading String....');
  print(file.readAsStringSync());

  print('Reading Bytes...');
  List values = file.readAsBytesSync();
  values.forEach((value) => print(value));
}

Future<void> deleteFile(File file) async {
  if (file.existsSync()) {
    await Future.delayed(Duration(seconds: 10));
    print('Deleting File...');
    file.deleteSync();
  } else {
    print('file not found');
  }
}
