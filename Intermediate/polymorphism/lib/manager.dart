import 'employee.dart';

class Manager implements Employee
{
  String name = 'Bob';

  // void test() => print('I am a manager'); 
  void test()
  {
    print('test in the manager class');
    print(super.toString());
    /*
      test in the manager class
      Instance of 'Manager'

      this is an instance of manager, meaning it really doesn't have a super
    */
  }
}

/*
  Missing concrete implementations of 'Employee.test', 'getter Employee.name', and 'setter Employee.name'. 
  Try implementing the missing methods, or make the class abstract.
*/

// what it means is we are now implementing an interface, the contract between the two classes,
// when we implement the interface (in this case is Employee) we have to have all of the getters, setters and function

// ------------------------------------------------------------------------------------------------

/*
  so what is going on under the hood is we're not actually inheriting, we're implementing.
  the difference between the two is subtle yet profound

  when you inherit, you inherit all the properties of what you're inheriting
  when you implement, you have to implement them yourself
*/