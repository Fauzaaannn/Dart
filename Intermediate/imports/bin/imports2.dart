import 'package:http/http.dart' as http;

void main(List<String> args) {
  var url = Uri.parse("http://www.voidrealms.com");

  http.get(url).then((response) { // asynchronous
    print('Response status code: ${response.statusCode}'); // 200 means OK
    print('Response body: ${response.body}');
  }); 
}

// synchronous means one at a time, asynchronous means many at once