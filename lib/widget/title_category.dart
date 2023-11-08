import 'package:flutter/material.dart';

class TitleCategory extends StatelessWidget {
  const TitleCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'asset/icons/coffee.png',
            width: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'ប្រភេទកាហ្វេ​ និង​ នំ',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontFamily: 'Fasthland',
            ),
          ),
        ],
      ),
    );
  }
}
