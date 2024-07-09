import 'dart:io';
import 'dart:convert';

void main(List<String> args) async
{
  var serverSocket = await ServerSocket.bind('127.0.0.1', 3000);
  print('Listening');

  await for (var socket in serverSocket)
  {
    socket.listen((List<int> values) {
      print('${socket.remoteAddress}:${socket.remotePort} = ${utf8.decode(values)}');
    });
  }
}

/* What are Sockets?
  So think of your computer as a giant telephone book. And in that book are all the numbers, all the things you could ever want.
  Each one of those numbers is called a port. So different programs can listen and communicate on different ports.
  
  For example, FTP 21 Web traffic typically port 80 things of that nature, those are called known ports.
  And then there's unknown ports. and there is a lot of them (for example the output of this program)

  So understand that the source has an address and a port and the destination has an address and a port.
  when those line up, you have what's called the communications channel. 

  There are 2 ways of communicating, there is TCP and UDP. 
  → there's a difference between the two in that TCP requires a connection (quoddy fingers?) with a three way handshake and that's what we've done
  → UPD does not require connection. it just throw the data out there and doesn't care if it's received or not. 
*/

/*
  What we've just experimented on is what is called a TCP server, meaning it listens for incoming connections and takes that data and does
  something with it. Whenever you view of webpage, you're actually talking to a TCP server. 
*/
