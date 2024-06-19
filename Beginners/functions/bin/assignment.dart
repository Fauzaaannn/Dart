import 'dart:io';

void main(List<String> args) {
  count(input());
}

int input() {
  print('enter a max number');
  int? input = int.tryParse(stdin.readLineSync()!);
  print('--------------');
  return input ?? 0;
}

void count(int max) {
  for (int i = 1; i <= max; i++) {
    print(i);
    while (i == max / 2) {
      print('halfway there');
      break;
    }
  }
}
