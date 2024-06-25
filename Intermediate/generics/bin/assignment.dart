import 'package:generics/payroll.dart';
import 'package:generics/cashier.dart';
import 'package:generics/manager.dart';
// import 'package:generics/employee.dart';

void main(List<String> args) 
{
  Manager boss = new Manager();
  Cashier jack = new Cashier();

  Payroll payroll = new Payroll();
  payroll.add(boss);
  payroll.add(jack);

  payroll.print();

}

/*
  Make the following classes

  Employee

  Manager – inherit employee

  Cashier – inherit employee

  Payroll – use generics to allow only descendants of the employee class

  Both the Cashier and Manager classes should have a “sayHello” function that prints the class name.

  The payroll class should allow adding to an internal list, and a “print” function that calls the “sayHello” of each item in the internal list  
*/