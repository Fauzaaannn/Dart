void main(List<String> arguments) {
  List<int> numbers = <int>[];
  numbers.addAll([1, 2, 3, 4, 5]);
  print(numbers);

  List<String> strings = <String>[];
  strings.addAll(['a', 'b', 'c', 'd', 'e']);
  print(strings);

  add<int>(1, 2);
  add<double>(1.6, 2.09);
  // add<String>('hello', 'world');

  addNumbers<int>(1, 2);
  addNumbers<double>(1.6, 2.09);
  // addNumbers<String>('hello', 'world');

  // you can see how the same code can run either numbers or strings → that is called generic
  // basically the code can handle different type depending on what you want it to do
}

// Simple Example
void add<T extends num>(T a, T b) {
  print(a + b);
}

// why are we using T? because that is the generic that we've given it <T>
// it's just simply a number that represents a type

// More complex example
void addNumbers<T extends num>(T a, T b) {
  print(a + b);
}
// T is going to be any class that extends number class, this would include integers and doubles 