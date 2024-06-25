// ignore_for_file: unnecessary_new

import 'package:classes/employee-2.dart';

void main(List<String> args) 
{
  Employee emp1 = new Employee('Fauzan', 'Manager');
  Employee emp2 = new Employee('Jack', 'Progammer');
  
  emp1.sayHello();
  emp2.sayHello();
}