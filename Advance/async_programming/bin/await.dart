import 'dart:io';
import 'dart:async';

void main(List<String> args) async {
  print('Starting');

  File file = await appendFile();

  print('Appended to file ${file.path}');

  print('*** END');
}

Future<File> appendFile() {
  File file = new File(Directory.current.path + 'date.txt');
  DateTime now = DateTime.now();

  return file.writeAsString(now.toString() + '\r\n', mode: FileMode.append);
}

/*  Analisa Fungsi 
  Future<File> appendFile()
  → we have a function that's going to return a future (Future) 
    not the actual object, but the object when it's returned will be a file ( <File> )

  return file.writeAsString(now.toString() + '\r\n', mode: FileMode.append);
  → here we're actually returning the future to the file object 
  → file.writeAsString(now.toString(), this will return the future right here 
*/

/*
  File file = await appendFile();

  Await
  → what this will do is we'll say we want a file variable call this function (appendFile)
    but this function is going to return a future, not the actual object

  → so it's going to say, OK, Grab the future (Future) and wait for the object to be provided ( <File> )
  → once it's provided, handle executions to the variable now be filled

  → so what the await keyword really does is tells in asynchronous function to wait until the object the future promising
    is provided and it actually slows things down into a synchronized manner
*/