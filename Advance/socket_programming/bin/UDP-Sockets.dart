import 'dart:io';
import 'dart:convert';

void main(List<String> args) 
{
  var data = 'Hello World';

  List<int> dataToSend = utf8.encode(data); // necessary for sending data over the network.
  int port = 3000; // port number

  // Server
  RawDatagramSocket.bind(InternetAddress.loopbackIPv4, port).then((RawDatagramSocket udpSocket) {
    udpSocket.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.read) {
        Datagram? dg = udpSocket.receive(); // read the data
        if (dg != null) {
          print(utf8.decode(dg.data)); // decode it to string
        }
      }
    });

    // Client
    udpSocket.send(dataToSend, InternetAddress.loopbackIPv4, port);
    print('Sent');

    // The client is created by sending the encoded data using the udpSocket.send function, which takes the data to be sent, 
    // the IP address of the recipient (in this case, the loopback IP address), and the port number.
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

/*
  The output of the code is the message "Sent" printed to the console by the client, 
  and the received message "Hello World" printed to the console by the server.
*/