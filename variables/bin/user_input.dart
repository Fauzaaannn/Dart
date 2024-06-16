import 'dart:io'; // allows input and output - sama seperti <stdio.h> di bahasa C
// import 'dart:async'; // synchronous and asynchronous code

// asynchronous operation are thing that can be done at the same time, dan kebanyakan IO adalah asynchronous
// synchronous operation are thing that can be done one after the other, happen in a certain order
void main(List<String> args) {
  stdout.write('what is your name?\r\n');
  // \r\n adalah escape sequence - hard return - new line feed

  // stdout.write('what is your name?\r');
  // \r = output ada, tetapi cursor jadi dalam 1 baris yang sama

  // stdout.write('what is your name?\n');
  // new line = output ada

  String? name = stdin.readLineSync();
  stdout.write('your name is ${name}\r\n');
  // readLineSync() = read a line of input from the user synchronously -> meaning it will block your program until that function has completed
  // mirip dengan scanf() dalam C

   name!.isEmpty ? stderr.write('name is empty') : stdout.write('your name is ${name}\r\n');
  // penggunaan standard error
}
