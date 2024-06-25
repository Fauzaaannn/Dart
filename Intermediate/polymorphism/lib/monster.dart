import 'package:polymorphism/feline.dart';
import 'package:polymorphism/dragon.dart';
import 'package:polymorphism/ghost.dart';

class Monster extends Feline with Ghost, Dragon {
  bool glowInDark = true;

  @override
  void test() {
    print('Test called in Monster');
    super.test();
  }
}
