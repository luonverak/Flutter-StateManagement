import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemagement/model/product.dart';
import 'package:statemagement/view/home_screen.dart';

import '../controller/controller.dart';
import '../widget/item_add_cart.dart';

class CardScreen extends StatelessWidget {
  CardScreen({super.key});
  final MyController myController = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 70, 70, 70),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(300),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(HomeScreen());
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              'My Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 2.5,
                            ),
                            Text(
                              'Total item: ${myController.rxList.length}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150, left: 8, right: 8),
                  child: Positioned(
                    child: SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: myController.rxList.length,
                        itemBuilder: (context, index) =>
                            itemAddCard(myController.rxList[index]),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
