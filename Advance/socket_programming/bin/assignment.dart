import 'package:http/http.dart' as http;

void main(List<String> args) async
{
  var url = Uri.parse('http://httpbin.org');
  var response = await http.get(url);

  print('Response status ${response.statusCode}');
  print('Response body length ${response.body.length}');
}
