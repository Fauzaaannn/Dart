void main(List<String> args) {
  int age = 70;

  switch (age) {
    case 18:
      print('you are a teenager');
      break;

    case 21:
      print('you are an adult');
      break;

    case 65:
      print('you are old');
      break;

    default: // if it's none of the above
      print('nothing special about this age');
      break;
  }
  // break here is breaking out from the switch scope, like a jailbreak
  // you use switch case when you have specific values
  // and this works really well with the enum
  print('Finished');
}
