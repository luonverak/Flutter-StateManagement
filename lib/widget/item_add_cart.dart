import 'package:flutter/material.dart';

import '../model/product.dart';

Widget itemAddCard(Product product) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black,
            offset: Offset(0, 5),
          )
        ],
      ),
      height: 150,
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(product.image),
                  ),
                ),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                product.name,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Price : \$${product.price}',
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(Icons.remove),
                    ),
                  ),
                  Text('${product.counter}'),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(Icons.add)),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}
