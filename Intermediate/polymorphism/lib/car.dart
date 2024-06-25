abstract class Car 
{
  late bool hasWheels; // abstract properties
  late bool hasHorn; // abstract properties

  // void honk();

  void honk() => print('honk called in car');
}

/* 
  abstract is an abstract concept, basically what you're building is not a class, but more of a concept. it's similar to an interface but you can actually inherit from it
*/