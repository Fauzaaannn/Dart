import 'package:imports/imports.dart' as mycode;
// dart is taking this file and converting all of whats in that file into what's called a class in memory 
// the sayHello class is being called and we're calling that as mycode 

import 'dart:convert';

void main(List<String> arguments) {
  mycode.sayHello();

  String myvalue = 'Hello World!';
  List<int> ebytes = utf8.encode(myvalue);
  String encoded = base64Encode(ebytes);

  print('encoded : ${encoded}');

  List<int> dbytes = base64Decode(encoded);
  String decoded = utf8.decode(dbytes);

  print('decoded : ${decoded}');
}

// base64 encoding = what it does is it takes a series of characters and encodes them in a specific format.
// encyrption is meants to be strong, encoding is meant to be weak
/* 
  the reason you would encode is so that the accepting program of the data would know what format 
  it's in and knows how to handle it, and there aren't any problems in between your program and another 
*/

/* 
  sometimes you will need the base64 code things just to keep thing s little more secure within your application
  but be mindful this is not a form of encyption 
*/

/* 
  1. First, it takes the input string myvalue and converts it into a list of integers using the utf8.encode() function. 
  Each integer in the list represents a single character from the input string, encoded using the UTF-8 character encoding.

  2. Next, it passes this list of integers to the base64Encode() function, which performs the Base64 encoding algorithm 
  on the binary data represented by the list of integers.

  3. The base64Encode() function converts the binary data into a string of printable ASCII characters, 
  using a specific set of 64 characters (hence the name "Base64"). This encoded string is then stored in the encoded variable.

*/