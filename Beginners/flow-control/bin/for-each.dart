void main(List<String> args) {
  List people = ['jack', 'john', 'elena'];

  print(people);

  for (int i = 0; i < people.length; i++) {
    print('Persons at ${i} is ${people[i]}');
  }

  people.forEach((person) {
    print('Person is ${person}');
  });
}
