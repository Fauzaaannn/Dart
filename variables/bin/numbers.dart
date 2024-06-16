void main(List<String> args) {
  // Numbers
  num age = 2;
  print(age);
  // num bisa digunakan untuk segala bentuk angka, tetapi tidak bisa string

  // Integers
  int people = 6;
  print(people);

  // Doubles
  double temperature = 32.5;
  print(temperature);

  // Parse an integer
  int test = int.parse('12');
  print(test);

  // anonymus function
  // int err = int.parse('12.09', onError: (source) => 0); 
  int err = int.tryParse('12.09') ?? 0; // penulisan yang benar dari yg di atas
  print('err = ${err}');
  /*
  fungsinya adalah memanggil int class (int.parse) memanggil parse function, memberikan argument (12.09)
  dan jika itu tidak bekerja (error), call on error (anonymus function) dengan argument (source) dengan nilai 0
  */

  // math
  int dogYears = 10;
  int dogAge = people * dogYears;
  print('Your age in dog years is: ${dogAge}');

}
