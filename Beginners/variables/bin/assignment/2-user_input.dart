import 'dart:io';

void main(List<String> args) {
  stdout.write("what is your first name?\r\n");
  String? firstname = stdin.readLineSync();

  stdout.write("what is your last name?\r\n");
  String? lastname = stdin.readLineSync();

  stdout.write("your name is ${firstname} ${lastname}\r\n");

}