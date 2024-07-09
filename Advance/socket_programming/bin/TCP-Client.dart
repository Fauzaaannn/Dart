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