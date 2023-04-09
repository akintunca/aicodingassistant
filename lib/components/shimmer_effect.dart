import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
    baseColor: Get.isDarkMode
        ? const Color.fromARGB(255, 75, 75, 75)
        : const Color.fromARGB(255, 235, 235, 235),
    highlightColor: Get.isDarkMode
        ? const Color.fromARGB(255, 100, 100, 100)
        : const Color.fromARGB(255, 205, 205, 205),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          for (var i = 0; i < MediaQuery.of(context).size.width / 70; i++)
            Padding(
              padding: const EdgeInsets.fromLTRB(12.5, 2, 12.5, 2),
              child: Container(
                  width: Random().nextDouble() * MediaQuery.of(context).size.width / 1.3,
                  height: 13,
                  color: Colors.white),
            ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
        ],
      ),
    ));
  }
}
