import 'package:path/path.dart' as path;

void main(List<String> args) {
  var directory = 'E:\\udemy_dart\\Intermediate\\imports\bin';
  var filename = 'imports.dart';

  var fullpath = path.join(directory, filename);

  print(fullpath);
}