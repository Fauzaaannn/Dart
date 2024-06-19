void main(List<String> args) {
  try {
    int? age;
    int dogYears = 7;

    if (age == null) {
      throw Exception('Age is null');
    }

    print(age * dogYears);
  } on NoSuchMethodError {
    print('Sorry no such method');
  } catch (e) {
    print('unknown error: ${e.toString()}');
  } finally {
    print('completed');
  }
}
