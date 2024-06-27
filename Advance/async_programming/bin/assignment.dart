import 'dart:io';
import 'dart:async';

void main(List<String> args) async
{
  File file = new File(Directory.current.path + '/assignment.txt');

  print('Appending');
  await appendToFile(file.path, 'Hello World');

  String fileContent = await readFile(file.path);
  print(fileContent);

  print('Done');
}

Future<void> appendToFile(String filePath, String content) async
{
  File file = File(filePath);
  await file.writeAsString(content, mode: FileMode.append);
}

Future<String> readFile(String filePath) async
{
  File file = File(filePath);
  return await file.readAsString();
}