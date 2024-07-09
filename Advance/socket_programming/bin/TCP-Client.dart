import 'dart:io';

void main(List<String> args) async
{
  var socket = await Socket.connect('127.0.0.1', 3000);
  print('Connected');
  socket.write('Hello World');
  print('Sent, Closing');
  await socket.close();
  print('Closed');
}

/* Output

  Listening
  InternetAddress('127.0.0.1', IPv4):52419 = Hello World

*/

/* 
  Notice how socket.write is synchronous and socket.close is asynchronous?
  → 'send' is usually a very quick function and it returns very quickly
  → where as 'close' can actually take some time to shut all that down.
  
  you don't want to stall your application out
  → Typically what happens is the data will go out to the TCP stack on the computer and the operating system
    will handle the data push out so we don't have to worry about it
*/