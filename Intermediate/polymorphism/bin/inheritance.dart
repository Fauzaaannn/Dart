import 'package:polymorphism/feline.dart';

void main(List<String> args) {
  Feline cat = new Feline();

  cat.breath();

  cat.test();
}

// extends is a special keyword and it's pretty self-explanatory
// we're going to take the animal class and extend it, meaning add more properties to it