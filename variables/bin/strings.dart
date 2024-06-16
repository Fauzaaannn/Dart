// ignore_for_file: unnecessary_brace_in_string_interps

void main(List<String> args) {
  // String hello = "hello world";
  // print('hello world');
  // print(hello);

  String name = "Fauzan Abderrasheed";
  print('Hello ${name}');

  // get a substring
  String firstname = name.substring(0, 6);
  print('firstname = ${firstname}');

  // get the index of a string for last name
  int index = name.indexOf(' ');
  String lastname = name.substring(index).trim(); // index (spasi) sebagai index end
  print('lastname = ${lastname}');

  // get the index of a string for first name
  int index2 = name.indexOf(' ');
  String firstname2 = name.substring(0, index2); // 0 sebagai index start, index2 (spasi) sebagai index end
  print('firstname = ${firstname2}');

  // get the length of a string
  print(name.length);

  // Contains or Search
  print(name.contains('Fauzan'));
  // apakah pada variabel name memiliki characters 'Fauzan' (contains di dalam (''))

  // Create a List
  List parts = name.split(' '); // separate it into individual words or substrings based on a specified delimiter (in this case, a space character ' ').
  print(parts);
  print(parts[0]);
  print(parts[1]);

}
