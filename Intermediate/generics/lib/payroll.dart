import 'employee.dart';

class Payroll<T extends Employee>
{
  List<T> _employees = <T>[];

  void add(T value) => _employees.add(value);

  void print()
  {
    _employees.forEach((T value) {
      value.sayHello();
    });
  }
}