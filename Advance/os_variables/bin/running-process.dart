import 'dart:io';

void main(List<String> args) 
{
  // List all files in a directory - Linux specific
  Process.run('notepad', ['']).then((ProcessResult results){ // notepad for windows just for example
    print(results.stdout);
    print('Exit code: ${results.exitCode}');
  });
}

/*
  What is a Process ?
  → when you have a program, it's in an executable file.
  → a process is a copy of that executable running in memory
*/

/*
  Process.run('notepad', ['']).then((ProcessResult results){
    print(results.stdout);
    print('Exit code: ${results.exitCode}');
  });

  Process.run('notepad', [''])
  → this is the actual executable file that we're going to create a process of called 'notepad' (notepad for windows for example)
  → this has to be in you path or otherwise you have to include the full path (di posisi penulisan executable file ('notepad'))
    full path => C:/Windows/System32/notepad.exe
  →  [''] arguments, arguments are something that you send to the program

  print(results.stdout);
  → stdout => standard output, that's console output, it's just text that's being pumped out of the program

  print('Exit code: ${results.exitCode}');
  → exit code are a handy way a process is telling the operating system what's going on
  typically 0 means it's all good, anything else is an error and have a specific error code that matches that error

*/