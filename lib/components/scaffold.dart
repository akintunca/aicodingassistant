import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx.dart';
import 'floating_button.dart';
import 'input_box.dart';
import 'output_box.dart';
import 'theme_button.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputTextController = TextEditingController();
    final controller = Get.put(DataClass());
    return Scaffold(
        floatingActionButton: const CustomFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(
          children: [
            Obx(() => AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  onEnd: () {
                    controller.changeColorAndAlignment();
                  },
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: controller.begin.value,
                          end: controller.end.value,
                          colors: [
                        controller.bottomColor.value,
                        controller.topColor.value
                      ])),
                )),
            const ThemeButton(),
            Obx(() => MyCustomInputBox(
                controller: inputTextController,
                height: controller.inputHeight.value,
                width: controller.inputWidth.value,
                text:
                    "Hello 👋, I am an AI coding assistant. You can ask me anything related to the programming languages you use.")),
            Obx(() => MyCustomOutputBox(
                clicked: controller.floatingButtonClicked.value,
                height: controller.outputWidth.value,
                width: controller.outputWidth.value,
                text: inputTextController.text))
          ],
        ));
  }
}
