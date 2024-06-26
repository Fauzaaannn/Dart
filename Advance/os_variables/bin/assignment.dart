import 'dart:io';

void main(List<String> args) 
{
  print('OS: ${Platform.operatingSystem} ${Platform.version}');

  print('Env: '); 
  Platform.environment.keys.forEach((key) {
    print('${Platform.environment[key]}');
  });  
}