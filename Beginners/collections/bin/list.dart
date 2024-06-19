void main(List<String> args) {
  List test = [1, 2, 3, 4, 5]; // mirip dengan array
  print('Length = ${test.length}'); // how many item in the list
  print(
      'first item is ${test[0]}'); // mangambil nilai pertama - zero base index

  // print(test.elementAt(312)); // out of range error

  List<dynamic> things = []; // array
  things.add(1); // int
  things.add('cats'); // string
  things.add(true); // boolean
  print(things);

  /*
  - List<dynamic> specifies that the variable things will be a list that can hold elements of any data type (dynamic).
  - things is the name of the variable being declared.
  - = [] initializes the variable things with an empty list.
  */

  // List<int> numbers = new List<int>(); - memiliki arti yang sama dengan baris yang dibawah
  List<int> numbers = []; // variable type integers
  numbers.add(2);
  numbers.add(1);
  numbers.add(3);
  print(numbers);
  // numbers.add('cats'); - error karena tipe data yang diperbolehkan hanya integer

}
