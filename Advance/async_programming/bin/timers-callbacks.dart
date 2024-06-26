import 'dart:async';

int counter = 0;
// synchronous callbacks
void main(List<String> args) 
{
  Duration duration = new Duration(seconds: 1);
  Timer timer = new Timer.periodic(duration, timeout);
  print(timer);
  print('Started ${getTime()}');
}

void timeout(Timer timer) // even functions are object
{
  print('Timeout: ${getTime()}');

  counter++;
  if(counter >= 5) timer.cancel();
}

String getTime()
{
  DateTime dt = new DateTime.now();
  return dt.toString();
}

/*
  timer is a very simple class, but what it does is actually pretty ingenious.
  your computer is filled with timers, whether you realize it or not
  → you see little mouse cursor flashing on the screen, that's a timer.
  → you see the mouse moving across the screen, that's a callback in the operating system.
*/

/*
  Timer 
  → if you just do timer, it's only going to fire one time

  Timer.periodic(Duration duration, void callback(Timer timer))
  → if you do timer.periodic, it's going to fire over and over again for the duration.
*/