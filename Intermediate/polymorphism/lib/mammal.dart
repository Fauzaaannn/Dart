import 'package:polymorphism/animal.dart';

class Mamal extends Animal
{
  bool hasHair = true;
  bool hasBackbone = true;
  bool isWarmBlooded = true;

  void walk() => print('walking');

  void test() 
  {
    print('testing in mamal');
    // super.test();
  }
}

// extends is a special keyword and it's pretty self-explanatory
// we're going to take the Animal class and extend it, meaning add more properties to it