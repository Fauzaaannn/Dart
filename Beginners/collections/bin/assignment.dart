import 'dart:io';

void main(List<String> args) {
  List<dynamic> people = [];
  people.add('jack');
  people.add('john');
  people.add('elena');

  stdout.write("what is the number of the person you want to call? \r\n");
  int index = int.tryParse(stdin.readLineSync()!) ?? 0;

  // print("the name is ${people[index]}");
  print("the name is ${people.elementAt(index)}");
}

/*
  - stdin.readLineSync() reads a line of input from the console. The user is expected to enter a number as input.

  - int.tryParse(stdin.readLineSync()!) attempts to parse the input string (the line read from the console) into an integer value. If the input is a valid integer, it returns the corresponding integer value. If the input is not a valid integer, it returns null.
  
  - The ?? operator is the null-coalescing operator in Dart. It checks if the value on the left side is null. If it is, it assigns the value on the right side to the variable. In this case, if int.tryParse(stdin.readLineSync()!) returns null (meaning the user input is not a valid integer), the value 0 is assigned to index.
*/ 
