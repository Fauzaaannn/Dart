class Animal {
  String _name = '';
  // that underscore means that it is private variable, meaning that it is not accessible outside of the class
  // it's only accessible within this scope block

/* default constructor
  Animal() {
    print('constructed');
    _name = 'Fauzan';
  }
  // constructor → (), example → Animal()
*/

  Animal(String name) {
    _name = name;
  }

  void sayHello() {
    if(_name.isEmpty) {
    print('Hello');
    } else {
      print('Hello, $_name nice to meet you');
    }
  }
}