import '../models/counter.dart';

class CounterController {
  Counter counter = Counter(0);

  int get value {
    return counter.value;
  }

  void increment() {
    counter.value++;
  }

  void decrement() {
    counter.value--;
  }
  void reset(){
    counter.value=0;
  }
}
