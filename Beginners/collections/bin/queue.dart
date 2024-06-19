import 'dart:collection';

void main(List<String> args) {
  // ordered, no index, add and remove from the start and end

  Queue items = new Queue();
  items.add(1);
  items.add(3);
  items.add(2);
  items.removeFirst(); // remove first item
  items.removeLast(); // remove last item

  print(items);
}
