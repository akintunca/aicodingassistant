import 'package:flutter/material.dart';

class MyCustomInputBox extends StatelessWidget {
  final TextEditingController controller;
  final double height;
  final double width;
  final String text;

  const MyCustomInputBox(
      {super.key,
      required this.controller,
      required this.height,
      required this.width,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(75),
      child: Align(
        alignment: Alignment.center,
        child: AnimatedContainer(
          height: height,
          width: width,
          curve: Curves.easeInOutCubicEmphasized,
          duration: const Duration(milliseconds: 1500),
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(10),
            child: Form(
                child: TextFormField(
              decoration: InputDecoration(counterText: "", hintText: text),
              controller: controller,
              minLines: 50,
              maxLines: 50,
              maxLength: 5000,
            )),
          ),
        ),
      ),
    );
  }
}
