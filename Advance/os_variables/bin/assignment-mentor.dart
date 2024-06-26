import 'dart:io';

void main(List<String> args) 
{
  if (Platform.isAndroid) print('This is android'); 
  if (Platform.isFuchsia) print('This is Fuchsia'); 
  if (Platform.isIOS) print('This is IOS'); 
  if (Platform.isLinux) print('This is Linux'); 
  if (Platform.isMacOS) print('This is MacOS'); 
  if (Platform.isWindows) print('This is Windows'); 

  print(Platform.environment['PATH']);
}