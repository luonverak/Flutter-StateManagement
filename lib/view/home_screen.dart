import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:statemagement/model/product.dart';

import '../controller/controller.dart';
import '../widget/title_app.dart';
import '../widget/title_category.dart';
import 'cart_screen.dart';
import 'detail_screen.dart';

final List<String> list = ['asset/images/coffee.webp'];

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController controller = TextEditingController();
  final MyController myController = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: ListView(
          children: [
            const TitleApp(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.05,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: controller,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'ស្វែងរកទំនិញ',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Hanuman',
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CarouselSlider.builder(
                  itemCount: listProduct.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      GestureDetector(
                    onTap: () {
                      Get.to(
                        DetailProduct(
                          product: listProduct[itemIndex],
                        ),
                      );
                    },
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        listProduct[itemIndex].image,
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    aspectRatio: 16 / 29,
                    viewportFraction: 0.85,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 8),
                    autoPlayAnimationDuration: const Duration(seconds: 8),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.8,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TitleCategory(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                  childAspectRatio: 1 / 1.5,
                  children: List.generate(
                    listProduct.length,
                    (index) => itemProduct(
                      listProduct[index],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Get.to(CardScreen());
        },
        child: badges.Badge(
          badgeContent: Text('${myController.rxList.length}'),
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.blueAccent,
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget itemProduct(Product product) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(
              DetailProduct(
                product: product,
              ),
            );
          },
          child: Hero(
            tag: product.id,
            child: Container(
              width: double.infinity / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(product.image),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromARGB(134, 255, 255, 255),
            ),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          ),
        ),
        Positioned(
          child: Container(
            decoration: const BoxDecoration(
                // color: Color.fromARGB(108, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 255, 255),
                    blurRadius: 35,
                  )
                ]),
            height: 45,
            width: double.infinity / 2.11,
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 6, right: 5),
                child: GestureDetector(
                  onTap: () {
                    myController.addItem(product);
                  },
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.blueAccent,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
