import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemagement/view/home_screen.dart';

import '../controller/controller.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});
  MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter GetX Screen 2'),
      ),
      body: Center(
        child: GetBuilder<MyController>(
          builder: (controller) => Text(
            '${controller.counter}',
            style: const TextStyle(fontSize: 35),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              myController.increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              myController.decrement();
            },
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
