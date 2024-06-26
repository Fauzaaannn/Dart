import 'dart:io';
import 'dart:async';

void main(List<String> args) 
{
  String path = Directory.current.path + "/test.txt";
  print('Appending to ${path}');

  File file = new File(path);

  Future<RandomAccessFile> f = file.open(mode: FileMode.append);

  f.then((RandomAccessFile raf) {
    print('File has been opened!');

    raf.writeString('Hello World').then((value) {
      print('file has been appended');

    }).catchError(() => print('An error occurred')).whenComplete(() => raf.close());
  });

  print('**** The End');
}

// Future is a promise, it's a generic type
/*
  What does future really do?
  → the future says you're going to get a specific type of object, in this case is a random access file
    but you're not going to get it right away because it's asynchronous, you're going to have to wait for it
*/

/* Output
  Appending to E:\udemy_dart\Advance\async_programming\bin/test.txt
  **** The End
  File has been opened!
  file has been appended

  → you can see how it says appending and then we have this, but immediately jumps to 'the end'
  → but then it says the file has been opened, the file has been appended.

  ----------------------------------------------------------------------------------------------------------------------------
  So what is going on here?
  ----------------------------------------------------------------------------------------------------------------------------
  String path = Directory.current.path + "/test.txt";
  print('Appending to ${path}');

  File file = new File(path);

  → this executes, then

  Future<RandomAccessFile> f = file.open(mode: FileMode.append);

  → because this is executing in a asynchronous mode, you can tell because it's working with a Future,
    it immediately handles execution of the program back over here ( <RandomAccessFile> )
  → so it jumps back to line eleven and then off to the side memory
  → all of the future code is running:

  Future<RandomAccessFile> f = file.open(mode: FileMode.append);

  f.then((RandomAccessFile raf) {
    print('File has been opened!');

    raf.writeString('Hello World').then((value) {
      print('file has been appended');

    }).catchError(() => print('An error occurred')).whenComplete(() => raf.close());
  });

  → So this code is running effectively at the same time
*/

/*
  be careful when working with futures, always use the 'then' keyword and just understand that the catchError 
  and when complete is equivalent to the try catch block
*/