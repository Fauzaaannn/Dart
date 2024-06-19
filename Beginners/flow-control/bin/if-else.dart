void main(List<String> args) {
  int age = 21;

  if (age == 43) {
    print("your age is ${age}");
  }

  if (age != 43) {
    print("your age is not 43");
  }

  if (age < 18) {
    print('you are a minor');
    if (age < 13) {
      print('you are not even a teenager');
    }
  }

  if (age > 65) {
    print('you are a senior');
    if (age > 102) {
      print('you are lucky to be alive');
    }
  }

  if (age == 21) {
    print('this is your special year');
  } else {
    print('this is just a normal year');
    if (age < 21) {
      print('you are a minor');
    } else {
      print('you are an adult');
    }
  }

  // polymorphic code = it means code can change based on the input that it's given
}
