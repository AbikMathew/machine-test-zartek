import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zartek_test/controller/splash_controller.dart';

class HomeController extends GetxController {
  SplashController splashController = Get.find<SplashController>();

  late User user;
  
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
