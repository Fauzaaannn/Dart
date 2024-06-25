import 'dart:io';

void main(List<String> args) 
{
  Directory dir = Directory.current;
  File file = new File(dir.path + '/assignment.txt');

  file.writeAsStringSync('Hello World');
  print(file.readAsStringSync());

  file.deleteSync();
}