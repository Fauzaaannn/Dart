void main(List<String> args) {
  int value;
  int init = 1;
  int max = 5;

  value = init;

  do {
    print('value in do loop is ${value}');
    value++; // increment
  } while (value <= max);
  // kerjakan yang ada dalam scope do
  // while kondisi () false = continue to run (back to do)
  // while kondisi () true = stop
  print('done with do loop');

  value = init;

  while (value <= max) {
    print('value in while loop is ${value}');
    value++;
  }

  print('done with while loop');

  // infinite loops
  value = init;
  do {
    print('value = ${value}');
    value++;

    // add flow control
    if (value == 5) {
      print('value is 5');
      continue;
    }

    if (value > 5) {
      print('value is greater than 5');
      break;
    }
  } while (true);

  print('finished');
}

// the do loop will always run its block first
// while loop will always evaluate first and then run

// if you want to run at least one time, use do
// if you want evaluate first before it does any running, use while