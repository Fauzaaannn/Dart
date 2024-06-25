import 'car.dart';

class RaceCar extends Car 
{
  RaceCar() 
  {
    this.hasWheels = true;
    this.hasHorn = true;
  }
  // we get this properties because we inheriting. but the properties aren't even set (in car.dart)

  // void honk() => print('beep beep');
  void honk() 
  {
    print('honk in racecar');
    super.honk();
    // error because it doesn't have an implementation, it's just simply an abstract term, therefore it doesn't exist
  }
}

// that's the difference between abstraction and interface, abstraction you are actually inheriting