import 'dart:io';

void main(List<String> args) {
  check(age());
}

int age() {
  print('input age');
  try {
    return int.parse(stdin.readLineSync()!);
  } catch (e) {
    print('not a number');
    return 0;
  }
}

void check(int age) {
  try {
    if (age < 18) {
      throw Exception('too young');
    } else if (age > 99) {
      throw Exception('too old');
    }
    print('you may continue');
  } on NoSuchMethodError {
    print('Sorry no such method');
  } catch (e) {
    print('Error: ${e.toString()}');
  } finally {
    print('Good Bye');
  }
}
