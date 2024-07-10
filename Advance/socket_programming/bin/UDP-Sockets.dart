import 'dart:io';
import 'dart:convert';

void main(List<String> args) 
{
  var data = 'Hello World';

  List<int> dataToSend = utf8.encode(data);
  int port = 3000;

  // Server
  RawDatagramSocket.bind(InternetAddress.loopbackIPv4, port).then((RawDatagramSocket udpSocket) {
    udpSocket.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.read) {
        Datagram? dg = udpSocket.receive();
        if (dg != null) {
          print(utf8.decode(dg.data));
        }
      }
    });

    // Client
    udpSocket.send(dataToSend, InternetAddress.loopbackIPv4, port);
    print('Sent');
  });
}

/*
  The difference between TCP and UDP is that UDP does not require that three way handshake,
  there is no actual connection between the sockets, it just sends the data out and hopes for the best
*/

/*
  You don't have a connection, why you need a port?
  because think of a port is like a road, they need to be on the same road. Think of it as two cars passing each other on the highway.
  they both roll down their windows and wave at each other.
*/

/*
  Data gram is a little data gram of information that you send to another computer. 
  For example if you ping a computer, you're actually sending a datagram.
*/

/*
  So what is happening here is we building our server (// Server), and we just simply listening (udpSocket.listen)
  and when data comes in, we're going to grab that datagram off the udpSocket.receive (Datagram? dg = udpSocket.receive();) 
  and then we just going to print it out.

  The client however (// Client) is just sending a datagram to the server (udpSocket.send), there is no connection either because
  this is all UDP and it's just going to throw it out onto the network and see what happens.
*/