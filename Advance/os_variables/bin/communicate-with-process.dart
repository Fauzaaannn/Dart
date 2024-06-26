import 'dart:io';
import 'dart:convert';

void main(List<String> args) 
{ // Asynchronous
  //Windows Specific
  Process.start('powershell', []).then((Process process) {
    // transform the output 
    process.stdout.transform(utf8.decoder).listen((data) {
      print(data);
    });

    // send to the process
    process.stdin.writeln('Hello World'); 
    // process.stdin.writeln('Write-Output "Hello World"');

    // Stop the process 
    // Process.killPid(process.pid); - Linux Specific
    process.stdin.close();

    // get the exit code
    process.exitCode.then((int code) {
      print('Exit Code: ${code}');

      //exit 
      exit(0);
    });
  });
}

/*
  process.stdout.transform(utf8.decoder)
  → it takes any output from the standard output and automatically decodes it.
    we don't have to call it every single time, it's done under the hood

  listen((data) {
    print(data);
  });
  → now we're going to listen to the output and want to say data and we just want to print that data out

  Process.killPid(process.pid);
  → it sends the kill signal to the process that can actually hurt some processes
*/