// ignore_for_file: file_names, unnecessary_brace_in_string_interps

void main(List<String> args) {
  // sayHello('Fauzan');
  sayHello();
  download('myfile.txt');
  download('myfile2.txt', true);
}

void sayHello([String name = '']) {
  if (name.isNotEmpty) {
    name = name.padLeft(name.length + 1); // takes the name and add space in front of it
  }
  print('Hello${name}');
}
// the brackets [] denote that this is optional
// inside the brackets are the default value

void download(String file, [bool open = false]) {
  print('Downloading ${file}');
  if (open) {print('Opening ${file}');}
}
// optional parameters [] have to come at the end of all the other parameters