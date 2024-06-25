import 'dart:io';

void main(List<String> args) {
  Directory dir = Directory.systemTemp.createTempSync();

  print(dir.path);

  if (dir.existsSync()) // if the directory exists synchronously
  {
    print('Removing ${dir.path}');
    dir.deleteSync(); // delete it synchronously
  } else {
    print('Could not find ${dir.path}');
  }
}

/*
  Directory dir = Directory.systemTemp.createTempSync();

  What's going on in this code ?
  → we've got a directory class that we're using from the dart IO package.
  → we're making it dir, we're going to say Directory, and then we're calling the static object system (systemTemp.createTempSync())
  → so we're going to create a temporary directory synchronously.
*/
