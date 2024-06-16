void main(List<String> args) {
  int age = 43;

  if (age == 43) {
    // print('your age is 43 and has bills ${hasBills}');
    // error karena variable hasBills tidak ada di scope ini 
  } else {
    bool hasBills = true;
    print('your age is ${age} and has bills ${hasBills}');
  }
}

// scope is where a variable lives
// everytime you see these brackets {}, think this is a scope
// it's just simply a bubble that a variable can live in
// variable has to be used in the scope in which it's declared
