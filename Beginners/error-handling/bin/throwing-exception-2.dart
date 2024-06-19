void main(List<String> args) {
  try {
    String? name;

    // This will throw a NoSuchMethodError because name is null
    print(name!.length);
  }
  on NoSuchMethodError {
    print('Sorry no such method');
  }
  catch (e) {
    print('unknown error: ${e.toString()}');
  }
  finally {
    print('completed');
  }
}
