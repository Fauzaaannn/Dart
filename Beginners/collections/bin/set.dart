// Set = unordered, and do not contain duplicates

void main(List<String> args) {
  
  Set<int> numbers = new Set<int>();
  numbers.add(2);
  numbers.add(1);
  numbers.add(3);
  numbers.add(1); // added twice - duplicate not printed
  print(numbers);

}