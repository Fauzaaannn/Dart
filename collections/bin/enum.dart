// ignore: camel_case_types
enum colors { red, green, blue }
// harus dideklarasikan di luar main function, tidak bisa di dalam main function

void main(List<String> args) {
  print(colors.values);
  print(colors.red);
}
// colors disini adalah variable, untuk menggunakannya, kita harus mengetikkan colors.values (red, green, blue)