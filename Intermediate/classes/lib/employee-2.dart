// ignore_for_file: prefer_initializing_formals, unnecessary_brace_in_string_interps

class Employee {
  String name = ''; // untuk menyimpan nilai
  String position = '';

  Employee(String name, String position) { // hal pertama yang dijalankan
    this.name = name;
    this.position = position;
  }

  void sayHello() => print('${name} is a ${position}'); // function → perintah yang digunakan untuk membuat output
}
