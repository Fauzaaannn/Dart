import 'house.dart';
import 'hotel.dart';

// jika menggunakan mixin maka memakai 'with', jika menggunakan interfaces maka memakai 'implements'
class BnB extends House with Hotel
{
  int guests = 1;
  int rooms = 1;

  BnB(int guest, int room) 
  {
    this.guests = guest;
    this.rooms = room;
  }

  void ringDoorbell()
  {
    print('Ringing Door Bell room $rooms with $guests guests');
  }
}