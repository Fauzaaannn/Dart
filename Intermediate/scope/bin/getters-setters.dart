import 'package:scope/animal-3.dart';

void main(List<String> args) {
  Animal dog = new Animal('Tom', 6);

  dog.name = 'fiddo'; // setter
  print(dog.name); // getter

  print('before setter: ${dog.age}'); // getter
  dog.age = 4; // setter
  print('after setter: ${dog.age}'); // getter
}