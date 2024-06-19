void main(List<String> args) {
  // {}{print('hello');};

  List<String> people = ['john', 'jack', 'fred'];
  people.forEach(print);

  print('------------------------');

  people.forEach((String name) {
    print(name);
  });

  print('------------------------');

  people.where((String name) {
    switch (name) {
      case 'john':
        return true;

      case 'fred':
        return false;

      case 'jack':
        return true;

      default:
        return false;
    }
  }).forEach(print);
}

// ------------------------------------------------------------------------------- //
void anonymous(List<String> args) {
  () {}(); // This is an anonymous function that does nothing
}
// dart doesn't throw an error neither does the IDE, it's a valid function
// anonymous function sometimes called an internal function