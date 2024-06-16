// Use a loop to count to 10. Print each number on the screen. At the 5th loop, print out "half way there".

void main(List<String> args) {
  for (int i = 1; i <= 10; i++) {
    print(i);
    while (i == 5) {
      print('halfway there');
      break;
    }
  }
}
