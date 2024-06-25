// public and private scope
import 'package:scope/animal-2.dart';

void main(List<String> args) {
  Animal cat = new Animal('Bob', 16, 'Short Hair');

  cat.breed = 'mixed';
  // cat._name = 'tom'; // error because this is a private variables
  // cat._display('hello'); // error because this is a private function
  cat.sayHello();
  cat.saySomething('meow');
}
