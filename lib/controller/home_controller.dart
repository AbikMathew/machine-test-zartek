import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek_test/controller/splash_controller.dart';
import 'package:zartek_test/model/fail.dart';
import 'package:zartek_test/services/api_services/api_services.dart';

class HomeController extends GetxController {
  SplashController splashController = Get.find<SplashController>();

  var productList = <Product>[].obs;
  late User user;

  @override
  void onInit() async {
    super.onInit();
    productList.value = await getProduct();
    user = Get.arguments;
  }

  Future<List<Product>> getProduct() async {
    var result = await ApiServices.getProduct();

    log(result.toString());

    if (result != null) {
      productList.assignAll(result);
      return productList.value;
    }
    return productList;
  }

  void logout() async {
    await splashController.googleSignIn.disconnect();
    await splashController.firebaseAuth.signOut();
  }
}
