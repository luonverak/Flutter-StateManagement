import 'package:get/get.dart';

import '../model/product.dart';

class MyController extends GetxController {
  RxList<Product> rxList = <Product>[].obs;
  void addItem(Product product) {
    rxList.add(product);
    update();
  }
}
