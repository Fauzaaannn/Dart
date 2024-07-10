import 'package:http/http.dart' as http;

void main(List<String> args) async
{
  var url = Uri.parse('http://httpbin.org');
  var response = await http.get(url);

  print('Response status ${response.statusCode}');
  print('Response body ${response.body}');
}

/* Get and Post
  → 'get' will actually literally get the page  
  → 'post' will post data to it but still return a value
*/

/* HTTP
  → HTTP is a protocol that is used to transfer data between a client and a server.
  → a 200 is acceptable, anything beyond 200 is gonna be an error or some kind.
*/