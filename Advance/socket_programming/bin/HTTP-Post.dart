import 'package:http/http.dart' as http;

void main(List<String> args) async
{
  var url = Uri.parse('http://httpbin.org/post');
  var response = await http.post(url, body: 'name=Fauzan&color=blue');

  print("Response status code: ${response.statusCode}");
  print('Response Body ${response.body}');
}