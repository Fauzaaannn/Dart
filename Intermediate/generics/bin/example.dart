void main(List<String> args) {
  List<num> values = [1, 2, 3, 4, 5];

  print(add(10, values));
}

T add<T extends num>(T value, List<T> items) {
  num ret = value;
  items.forEach((value) {
    ret = ret + value;
  });

  return ret as T;
}

/* 
  1. we are making a generic function, we can see that is generic because it has these <T extends num> little brackets with anything in it
  2. we have a type we're defining as T and it's extending the number of class
  3. also it's going to return that same type
  4. we're taking initial value and a list of items that also have that same type
*/