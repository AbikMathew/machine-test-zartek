import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFullscreenDialog {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
          onWillPop: () => Future.value(false),
          child: const Center(
            child: CircularProgressIndicator(),
          )),
      barrierDismissible: false,
      useSafeArea: true,
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}
