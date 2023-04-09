import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
                text: inputTextController.text)),
                Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () => launchLink("https://github.com/akintunca/aicodingassistant"),
                child: Container(
                    alignment: Alignment.center,
                    width: 110,
                    height: 20,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(57, 43, 255, 0),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "by Akın Tunca",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 50, 50, 50),
                          fontSize: 15),
                    )),
              ),
            )
          ],
        ));
  }
}

Future<void> launchLink(url) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}