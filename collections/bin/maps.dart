void main(List<String> args) {
  // Map = key value pair
  // maps allow you to do is add things into the collection and no need to know their index
  // just simply call them by name through the key

  // Map people = {'dad' : 'jack', 'son' : 'bryan', 'daughter' : 'elena'};

  Map<String, String> people = new Map<String, String>();
  people.putIfAbsent('dad', () => 'jack');
  // people.putIfAbsent('son', () => 'bryan');
  // people.putIfAbsent('daughter', () => 'elena');

  print(people);
  print('keys are ${people.keys}');
  print('values are ${people.values}');

  print('dad is ${people['dad']}');
  print('son is ${people['son']}');

  // Map() -> <K, V>
  // pada contoh di atas key nya adalah dad, son, daughter
  // dan value nya adalah jack, bryan, elena
}
