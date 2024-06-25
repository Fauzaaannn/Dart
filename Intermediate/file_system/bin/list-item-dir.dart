import 'dart:io';

void main(List<String> args) 
{
  Directory dir = Directory.current; // a directory pointing to the current directory
  print(dir.path);  

  // so what we want to do here is we want to say recursive
  List<FileSystemEntity> list = dir.listSync(recursive: true); 
  print('Entries in list: ${list.length}');

  // then we want to list each item in the directory
  list.forEach((FileSystemEntity value){
    FileStat stat = value.statSync();
    print('Path: ${value.path}');
    print('Type: ${stat.type}');
    print('Changed: ${stat.changed}');
    print('Modified: ${stat.modified}');
    print('Accessed: ${stat.accessed}');
    print('Mode: ${stat.mode}'); // mode is a special number that denotes the system access you have to it
    print('Size: ${stat.size}');
    print('');
  });
}

  /* 
  Stats: is a special type of variable
    → it really just has some of the internal file properties 
    → this is taken directly from the operating system 

  Value:
    → this is a file system entity, and from here we can get the path exists
    → the stat which we're using, we can delete it, we can rename it, and you can see 
    these are very simple functions.
    → for example, deleteSync => just simply called it and we can delete the file 
    → you can also rename it, which is a lot like moving it from one location to another
  */

  /* Code Explain
  Here's how the code achieves its purpose:
    1. It creates a Directory object dir that represents the current directory.
    2. It prints the path of the current directory using dir.path.
    3. It creates a list list that contains all the files and directories present in the current directory 
    and its subdirectories by calling dir.listSync(recursive: true). 
    The recursive: true argument tells the function to include subdirectories as well.
    4. It prints the number of entries (files and directories) in the list.
    5. It then iterates over each entry in the list using a forEach loop.
    6. For each entry, it creates a FileStat object stat that contains the properties of the file or directory by calling value.statSync(), 
    where value is the current entry in the loop.
    7. It then prints the properties of the file or directory, such as path, type, last modified time, last accessed time, 
    file mode, and file size, using the stat object.
  */

  /* FileSystemEntity
    In the code you provided, FileSystemEntity is used as the type for the elements in the list variable. 
    This means that the list can contain instances of both File and Directory objects, representing the files and directories 
    in the current directory and its subdirectories.

    By using the FileSystemEntity class and its subclasses, the code can work with files and directories in a consistent and unified manner, 
    without having to worry about the specific type (file or directory) of each entry in the list.
  */

