import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zartek_test/controller/splash_controller.dart';
import 'package:zartek_test/model/api_model1.dart';

class HomeController extends GetxController {
  SplashController splashController = Get.find<SplashController>();

  late User user;
  var productList = <Products>[].obs;
  @override
  void onInit() {
    super.onInit();
    user = Get.arguments;
  }


  void logout() async {
    await splashController.googleSignIn.disconnect();
    await splashController.firebaseAuth.signOut();
  }
}
