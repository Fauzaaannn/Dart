import 'dart:io';

void main(List<String> args) {
  displayResults(askUser());
}

int askUser() {
  print('enter a max number');
  String? input = stdin.readLineSync();
  if (input == null) {
    print('error entering a number');
    return 0;
  }
  print('------------------');
  return int.parse(input);
}

void displayResults(int max) {
  double half = max / 2;

  for (int i = 1; i <= max; i++) {
    print(i);
    if (i == half.round()) {
      print('half way there');
    }
  }
}
