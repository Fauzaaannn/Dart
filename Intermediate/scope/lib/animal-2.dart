// public and private scope

class Animal 
{
  String _name = '';
  int _age = 0;
  String breed = '';

  Animal(String name, int age, String breed)
  {
    this._name = name;
    _age = age;
    this.breed = breed;
  }

  void sayHello() => print('hello my name is $_name I am $_age years old and I am a $breed');

  void _display(String message) { // private function
    print('message = $message');
  }

  void saySomething(String message) => _display(message);

  // private variables are allowed within a class and within the descendants of a class
}

// underscore means they are private, they can't be used outside of this class