import 'package:classes/classes.dart' as classes;
import 'package:classes/myclass.dart';

void main(List<String> arguments) {
  
  // create an instance of the class
  MyClass mine = new MyClass();
  MyClass yours = new MyClass();
  mine.sayHello('Fauzan');
  yours.sayHello('Femy');

  // Not really a class
  print(classes.calculate());
}

// class is a template, it's a blueprint for an object
// so what is the difference between a class and an object?
// class is just the template, from that template we can spawn an infinite number of objects

/*
  MyClass mine = new MyClass();
  
  what this does under the hood is it takes that template (MyClass) gives it a name (mine)
  and makes a new one (new) and puts it out in memory via the new keyword
*/