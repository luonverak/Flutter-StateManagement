import 'package:get/get.dart';

class MyController extends GetxController {
  RxInt counter = 0.obs;
  Future increment() async {
    counter++;
    update();
  }

  Future decrement() async {
    counter--;
    update();
  }
}
