import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DataClass());
    return Obx(
      () => AnimatedScale(
        duration: const Duration(milliseconds: 1500),
        scale: controller.scale.value,
        curve: Curves.easeInOutCubicEmphasized,
        child: AnimatedRotation(
          curve: Curves.bounceOut,
          duration: const Duration(milliseconds: 1500),
          turns: controller.rotation.value,
          child: FloatingActionButton.extended(
              label: Text(
                controller.floatingButtonText.value,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: () {
                if (controller.floatingButtonActive.value) {
                  controller.changeFloatingButtonActive(false);
                  Future.delayed(const Duration(seconds: 3), () {
                    controller.changeFloatingButtonActive(true);
                  });
                  if (controller.floatingButtonClicked.value) {
                    Future.delayed(const Duration(milliseconds: 1500), () {
                      controller.changeInputValues(700, 1250);
                    });
                    controller.changeOutputValues(0, 0);
                    controller.changeFloatingRotation(false);
                    controller.changeFloatingButtonText("AI");
                    controller.changeFloatingButtonClicked(false);
                  } else {
                    Future.delayed(
                      const Duration(milliseconds: 1500),
                      () {
                        controller.changeOutputValues(700, 1250);
                        controller.changeFloatingButtonClicked(true);
                      },
                    );
                    controller.changeInputValues(0, 0);
                    controller.changeFloatingRotation(true);
                    controller.changeFloatingButtonText("X");
                  }
                } else {
                  null;
                }
              },
              elevation: 10),
        ),
      ),
    );
  }
}
