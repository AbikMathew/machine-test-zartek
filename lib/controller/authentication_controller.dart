import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zartek_test/controller/splash_controller.dart';
import 'package:zartek_test/view/widgets/custom_fullscreen_dialog.dart';

class AuthenticationController extends GetxController {
  SplashController splashController = Get.find<SplashController>();

  void login() async {
    CustomFullscreenDialog.showDialog();
    GoogleSignInAccount? googleSignInAccount =
        await splashController.googleSignIn.signIn();
    if (googleSignInAccount == null) {
      CustomFullscreenDialog.cancelDialog();
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await splashController.firebaseAuth.signInWithCredential(oAuthCredential);
      CustomFullscreenDialog.cancelDialog();
    }
  }
}
