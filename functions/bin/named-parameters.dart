void main(List<String> args) {
  int footage = squareFeet(length: 10, width: 5); // calling parameter by their name
  print(footage);
  download('myfile'); // optional named
  download('myfile2', port: 90);
}
// it doesn't matter which order we put this in, we can just simply call them

int squareFeet({required int width, required int length}) {
  return width * length;
}

void download(String file, {int port = 80}) { // assigning value to the port
  print('Download ${file} on port ${port}');
}
