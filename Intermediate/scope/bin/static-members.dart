import 'package:scope/animal-4.dart';

void main(List<String> args) {
  Animal cat = new Animal();
  Animal dog = new Animal();
  Animal bird = new Animal();
  Animal fish = new Animal();

  Animal.run();
}

// because its static it doesn't have a 'this' keyword