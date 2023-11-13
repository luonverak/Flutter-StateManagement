import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemagement/model/product.dart';
import 'package:statemagement/view/home_screen.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key, required this.product});
  final Product product;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
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
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height / 2.4,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Hero(
                    tag: widget.product.id,
                    child: Image.asset(
                      widget.product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 85, 154),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Get.to(HomeScreen());
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 85, 154),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Price ${widget.product.price}\$',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        backgroundColor: const Color.fromARGB(255, 0, 85, 154),
                        onPressed: () {
                          setState(() {
                            (widget.product.counter > 1)
                                ? widget.product.counter--
                                : print('Error');
                          });
                        },
                        child: const Icon(Icons.remove),
                      ),
                      FloatingActionButton(
                        backgroundColor: const Color.fromARGB(255, 0, 85, 154),
                        onPressed: () {},
                        child: Text(
                          '${widget.product.counter}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: const Color.fromARGB(255, 0, 85, 154),
                        onPressed: () {
                          setState(() {
                            widget.product.counter++;
                          });
                        },
                        child: const Icon(Icons.add),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
