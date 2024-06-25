class Animal 
{ // Lexical Scope
  String name = "unknown";

  Animal(String name) 
  { // child scope
    // String name = 'hello';
    name = name;
    // this.name = name;

    print(this.name);
  }
}

// variabel yang ada pada lexical scope bisa dipakai di dalam child scope karena child scope ada di dalam lexical scope