import 'dart:io';

void main(List<String> arguments) 
{
  print('OS: ${Platform.operatingSystem} ${Platform.version}'); // prints the OS version

  if(Platform.isLinux) // do something for specific OS 
  {
    print('Run Linux code');
  } else {
    print('Run Normal code');
  }

  print('Path: ${Platform.script.path}'); // the path where you're executing from
  print('Dart: ${Platform.executable}'); // the path of the dart executable or dart SDK

  // Environmental variables including the path variable
  print('Env: '); 
  Platform.environment.keys.forEach((key) {
    print('${key} ${Platform.environment[key]}');
  });
}
