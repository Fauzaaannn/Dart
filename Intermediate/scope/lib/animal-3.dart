class Animal 
{
  String _name = "";
  int _age = 0;

  Animal(String name, int age)
  {
    _name = name;
    _age = age;
  }

  String get name => _name; // getter
  void set name(String value) => _name = value; // setter

  int get age => _age; // getter
  void set age(int value) => _age = value * 7; // setter
}