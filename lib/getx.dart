import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataClass extends GetxController {
  @override
  void onReady() {
    super.onReady();
    inputHeight.value = 700.0;
    inputWidth.value = 1250.0;
    scale.value = 1;
    bottomColor.value = const Color.fromARGB(150, 0, 140, 255);
    modeIconRotation.value = 1;
    clickedThemeButton.value = Get.isDarkMode;
  }

  final inputHeight = 0.0.obs;
  final inputWidth = 0.0.obs;
  final outputHeight = 0.0.obs;
  final outputWidth = 0.0.obs;
  final scale = 0.0.obs;

  final rotation = 0.0.obs;
  final floatingButtonText = "AI".obs;
  final floatingButtonClicked = false.obs;
  final floatingButtonActive = true.obs;

  void changeInputValues(double valueHeight, double valueWidth) {
    inputHeight.value = valueHeight;
    inputWidth.value = valueWidth;
  }

  void changeOutputValues(double valueHeight, double valueWidth) {
    outputHeight.value = valueHeight;
    outputWidth.value = valueWidth;
  }

  void changeFloatingRotation(bool valueIncreaseOrDecrease) {
    if (valueIncreaseOrDecrease) {
      rotation.value++;
    } else {
      rotation.value--;
    }
  }

  void changeFloatingButtonText(String buttonText) {
    floatingButtonText.value = buttonText;
  }

  void changeFloatingButtonClicked(bool buttonClicked) {
    floatingButtonClicked.value = buttonClicked;
  }

  void changeFloatingButtonActive(bool buttonActive) {
    floatingButtonActive.value = buttonActive;
  }

  //gradient background

  List<Color> colorList = const [
    Color.fromARGB(150, 255, 17, 0),
    Color.fromARGB(150, 0, 140, 255),
    Color.fromARGB(150, 0, 255, 8),
    Color.fromARGB(150, 255, 230, 0),
    Color.fromARGB(149, 169, 0, 185),
    Color.fromARGB(149, 42, 244, 255),
    Color.fromARGB(149, 51, 35, 7),
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
    Alignment.center
  ];

  final indexColorAndAlignment = 0.obs;
  final bottomColor = const Color.fromARGB(150, 255, 17, 0).obs;
  final topColor = const Color.fromARGB(149, 1, 133, 43).obs;
  final begin = Alignment.bottomLeft.obs;
  final end = Alignment.topRight.obs;

  void changeColorAndAlignment() {
    indexColorAndAlignment.value++;
    // animate the color
    bottomColor.value =
        colorList[indexColorAndAlignment.value % colorList.length];
    topColor.value =
        colorList[(indexColorAndAlignment.value + 1) % colorList.length];

    //// animate the alignment
    begin.value =
        alignmentList[indexColorAndAlignment.value % alignmentList.length];
    end.value = alignmentList[
        (indexColorAndAlignment.value + 2) % alignmentList.length];
  }

  final modeIconRotation = 0.0.obs;
  final clickedThemeButton = true.obs;

  void changeModeIconRotation(bool clicked) {
    modeIconRotation.value++;
    clickedThemeButton.value = clicked;
  }
}
