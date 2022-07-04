import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zartek_test/services/bindings/authentication_screen_binding.dart';
import 'package:zartek_test/services/bindings/home_screen_binding.dart';
import 'package:zartek_test/view/pages/authentication_screen/authentication_screen.dart';
import 'package:zartek_test/view/pages/home_screen/home_screen.dart';

class SplashController extends GetxController {
  late GoogleSignIn googleSignIn;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onReady() async {
    googleSignIn = GoogleSignIn();
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });
    super.onReady();
  }

  void handleAuthStateChanged(isLoggedIn) {
    if (isLoggedIn) {
      Get.offAll(
          binding: HomeBinding(),
          () => HomeScreen(),
          arguments: firebaseAuth.currentUser);
    } else {
      Get.offAll(
        binding: AuthenticationBinding(),
        () => AuthenticationScreen(),
      );
    }
  }
}
