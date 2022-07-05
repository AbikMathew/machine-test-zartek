import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zartek_test/controller/splash_controller.dart';
import 'package:zartek_test/services/api_services/api_services.dart';

class HomeController extends GetxController {
  SplashController splashController = Get.find<SplashController>();
//  HomeController homeController = Get.find<HomeController>();

  late User user;
  // List<Products> productList = <Products>[].obs;
  @override
  void onInit() {
    super.onInit();
    user = Get.arguments;
    ApiServices().getProduct();
  }

  void logout() async {
    await splashController.googleSignIn.disconnect();
    await splashController.firebaseAuth.signOut();
  }
}
