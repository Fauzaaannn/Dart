class Animal 
{
  static int _counter = 0;
  // 2. meaning this is the same variable, no matter how many instances of this class you have
  // 3. whereas if you omitted static and you just had this, each class would have its own copy of this variable
  
  Animal() 
  {
    _counter++;
    print('There are ${_counter} of us');
  }

  static void speak()
  {
    print('speaking');
    run();
  }

  static void run()
  {
    print('running');
  }

}

// 1. what static does is it shared across all instances of the class
// 4. because it's static it doesn't actually exist in an instance of the class, it exists in the blueprint itself
