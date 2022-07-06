import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek_test/controller/splash_controller.dart';
import 'package:zartek_test/model/fail.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  SplashController splashController = Get.find<SplashController>();

  List<Product>? product;
  late TabController tabController;
  late List<Tab> tabs;
  var isDataLoading = false.obs;
  late User user;

  @override
  void onInit() async {
    isDataLoading(true);

    super.onInit();
    var products = await getProductApi();

    tabController =
        TabController(length: products![0].tableMenuList!.length, vsync: this);
    tabs = List<Tab>.generate(
      products![0].tableMenuList!.length,
      (index) => Tab(
        text: products![0].tableMenuList![index].menuCategory,
      ),
    ).obs;
    user = Get.arguments;
  }

  getProductApi() async {
    String url = 'https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad';
    try {
      isDataLoading(true);
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        isDataLoading(false);

        final products = productFromJson(json.encode(response.data));
        product = products;
        return products;

      }
    } catch (e) {
      log('Error occured: $e');
    }
  }

  void logout() async {
    await splashController.googleSignIn.disconnect();
    await splashController.firebaseAuth.signOut();
  }
}
