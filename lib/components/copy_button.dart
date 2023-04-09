import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CopyButton extends StatelessWidget {
  final String data;
  const CopyButton({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => copyResult(data),
        icon: const Icon(Icons.copy_outlined));
  }
}

void copyResult(String text) {
  List<String> words = text.split(" ");
  String firstTenWords = words.take(10).join(" ");
  Clipboard.setData(ClipboardData(text: text)).then((value) {
    Get.showSnackbar(
      GetSnackBar(
        padding: const EdgeInsets.all(10),
        backgroundColor: const Color.fromARGB(100, 130, 130, 130),
        borderRadius: 10,
        maxWidth: 500,
        title: "Copied Successfully!",
        message: "---> $firstTenWords...",
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
        barBlur: 5,
      ),
    );
  });
}
