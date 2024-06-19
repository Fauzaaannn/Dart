void main(List<String> args) {
  print("starting");
  int age = 15;
  assert(age == 43);
  print(AssertionError("Age is not 43"));
  print("finished");
}

// what assert does is actually determines if something is true