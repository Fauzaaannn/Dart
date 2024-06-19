void main(List<String> args) {
  // int age = 43;
  var dogyears = calcYears;
  var catyears = calcYears;
  // nilai variable = nilai functions
  // menjadi memiliki fungsi yang sama

  print('Your age in dog years is ${dogyears(age: 43, multiplier: 7)}');
  print('Your age in cat years is ${catyears(age: 43, multiplier: 12)}');
}

int calcYears({required int age, required int multiplier}) {
  return age * multiplier;
}
