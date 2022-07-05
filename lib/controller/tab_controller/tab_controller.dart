import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek_test/controller/home_controller.dart';

class HomeScreenTabs extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;

  static HomeController homeController = Get.find<HomeController>();

  // checkEmpty(){
  //   log(homeController.productList[0].tableMenuList!.length.toString());
  // }

  final List<Tab> tabs = List<Tab>.generate(
    homeController.productList[0].tableMenuList!.length,
    (index) => Tab(
      text: homeController.productList[0].tableMenuList![index].menuCategory,
    ),
  ).obs;

  final List<Tab> waitingTabs = List<Tab>.generate(
      6,
      (index) => const Tab(
            text: 'Loading...',
          )).obs;

  @override
  void onInit() {
    controller = TabController(
        length: homeController.productList[0].tableMenuList!.isEmpty
            ? 0
            : homeController.productList[0].tableMenuList!.length,
        vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}


  // void futile() {
  //   log(homeController.productList.length.toString());
  // }