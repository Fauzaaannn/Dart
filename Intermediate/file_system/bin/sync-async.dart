import 'dart:io';

void main(List<String> args) 
{
  String path = '/';
  Directory dir = new Directory(path);
  // we're creating a class and we're giving it a path as part of the constructor

  if (dir.existsSync()) 
  {
    print('exist');
  } else {
    print('Not Found');
  }
}

/*
  IO is both synchronous or asynchronous, and the difference between the two is very complex.

  1. synchronous means things will happen one at a time. everyone has to wait their turn.
  2. asynchronous means things can happen at the same time. is like opening the floodgates at a parade or at a party. 
  everybody just comes streaming into the room all at once. 
*/

/*
  existsSync() 
  → this directory exist sync meaning we want this to wait. 
  → once this executes, then our code begins to run.
*/