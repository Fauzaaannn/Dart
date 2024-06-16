main(List<String> args) {
  test();
  sayHello('Fauzan');

  print('your age in dog years is ${dogYears(5)}');

  int wall1 = squareFeet(20, 30);
  int wall2 = squareFeet(25, 35);
  int wall3 = squareFeet(10, 20);
  int wall4 = squareFeet(15, 25);
  int ceiling = squareFeet(20, 10);

  double paint = paintNeeded(wall1, wall2, wall3, wall4, ceiling);
  print('You ${paint} gallons of paint');
}

void test() {
  print("testing");
}

void sayHello(String name) {
  print('Hello there ${name}');
}

int dogYears(int age) {
  return age * 7; // return a value
}

int squareFeet(int width, int length) {
  return width * length;
}

double paintNeeded(int wall1, int wall2, int wall3, int wall4, int ceiling) {
  int footage = wall1 + wall2 + wall3 + wall4 + ceiling;
  return footage / 30;
}

// what function do is they break up scope 