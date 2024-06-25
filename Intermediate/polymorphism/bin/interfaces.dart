import 'package:polymorphism/manager.dart';

void main(List<String> args) {
  Manager bob = new Manager();

  bob.test();
}

// what is going on under the hood?
/*
  we have the manager class, we're implementing the interfaces, meaning we have to have all theses properties (in the manager.dart) 
*/