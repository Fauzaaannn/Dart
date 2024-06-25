import 'package:polymorphism/mammal.dart';

class Feline extends Mamal 
{
  bool hasClaws = true;

  void growl() => print('groow');

  @override
  void test() 
  {
    print('testing in feline');
    super.test();
    // super is the class we inheriting from, in this case it's the Mamal class
    // so we actually calling the test function in the Mamal class
  }
}

// extends is a special keyword and it's pretty self-explanatory
// we're going to take the Mamal class and extend it, meaning add more properties to it

/*
  always remember that super is a way of accessing the class you're inheriting from
*/