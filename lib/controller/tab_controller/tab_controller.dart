import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenTabs extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;

  final List<Tab> tabs = const <Tab>[
    Tab(
      text: 'Tab 1',
    ),
    Tab(
      text: 'Tab 2',
    ),
    Tab(
      text: 'Tab 3',
    ),
  ];
  @override
  void onInit() {
    controller = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
