import 'dart:io';

void main(List<String> args) 
{
  Directory dir = Directory.current;
  print(dir.path);

  File file = new File(dir.path + '/myfile.txt'); // making a text file in the current directory

  writeFile(file);
  readFile(file);
}

void writeFile(File file)
{
  // Append, Write
  RandomAccessFile raf = file.openSync(mode: FileMode.write);
  raf.writeStringSync('Hello World!\r\nHow are you today?');
  raf.flushSync();
  raf.closeSync();
}

void readFile(File file)
{
  if(!file.existsSync())
  {
    print('file not found');
    return;
  }

  print('Reading String....');
  print(file.readAsStringSync());

  print('Reading Bytes...');
  List values = file.readAsBytesSync();
  values.forEach((value) => print(value)); 
}

/* 
  Append
  → Append will append to the end of the file

  Write
  → Write will overwrite the file
  → completely erase the file and start over.

  RandomAccessFile
  → it's an old term that really means you can access the file from anywhere in the file. 
  → you can open it up and then pick and choose anywhere in the file you want.
*/

/* 
  void writeFile(File file)
  {
  // Append, Write
  RandomAccessFile raf = file.openSync(mode: FileMode.append);
  raf.writeStringSync('Hello World!\r\n How are you today?');
  raf.flushSync();
  raf.closeSync();
  }

  → RandomAccessFile raf = file.openSync(mode: FileMode.append);
  first we create a random access file
  we open it with a specific mode (openSync)
  in this case, we're append (FileMode.append), meaning it's going to keep the file's contents and keep writing to it over and over again

  → raf.writeStringSync('Hello World!\r\n How are you today?');
  then we're going to actually write String sync and we're just going to write this string.

  → raf.flushSync();
  you should note flushSync really is not needed because closeSync calls flush in the background (ref.closeSync)

  → raf.closeSync();
  close calls flush, but we're going to just show it here for illustrative purposes

*/

/*
  file access works with a buffer. a buffer is a little section of memory
  when you're putting information into the file, it may not get written to the disk immediately
  therefore you have it flush it down
*/

/*
  void readFile(File file)
  {
  if(!file.existsSync())
  {
    print('file not found');
    return;
  }

  print('Reading String....');
  print(file.readAsStringSync());

  print('Reading Bytes...');
  List values = file.readAsBytesSync();
  values.forEach((value) => print(value)); 
  }

  explain the code:
  first, read the file (readFile)

  → if(!file.existsSync())
  if the file does not exist, then file not found and just exit right out this function

  → print(file.readAsStringSync());
  we're going to actually read as string synchronously

  → List values = file.readAsBytesSync();
  we're going to read the bytes and we're going to get a list of integers from the readAsBytesSync function

  → values.forEach((value) => print(value));
  values forEach, and then just going to print out each value.

*/