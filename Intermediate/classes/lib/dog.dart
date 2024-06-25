// ignore_for_file: prefer_initializing_formals

class Dog 
{
  int age = 1;
  String name = 'fiddo';

  Dog(int age, String name) {
    this.age = age; // pointer into the existing object
    this.name = name;
  }

  int AgeinDogYears() => age * 7;

}

// what 'this' does is it defines that it's part of the actual object, not part of the function
// 'this' is actually a pointer to the object in memory in which we created