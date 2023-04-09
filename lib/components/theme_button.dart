import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../getx.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DataClass());
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
          width: 100,
          height: 100,
          child: IconButton(
            icon: Obx(() => AnimatedRotation(
                  duration: const Duration(seconds: 1),
                  turns: controller.modeIconRotation.value,
                  child: Icon(
                    controller.clickedThemeButton.value
                        ? Icons.light_mode
                        : Icons.dark_mode,
                    size: 35,
                    color: controller.clickedThemeButton.value
                        ? const Color.fromARGB(255, 255, 235, 58)
                        : const Color.fromARGB(255, 220, 220, 220),
                  ),
                )),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('themeModeValuePref', Get.isDarkMode);

              if (controller.clickedThemeButton.value) {
                Get.changeThemeMode(ThemeMode.light);
                controller.changeModeIconRotation(false);
              } else {
                Get.changeThemeMode(ThemeMode.dark);
                controller.changeModeIconRotation(true);
              }
            },
          )),
    );
  }
}
