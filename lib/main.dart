import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek_test/services/bindings/authentication_screen_binding.dart';
import 'package:zartek_test/services/bindings/splash_screen_binding.dart';
import 'package:zartek_test/view/pages/home_screen/home_screen.dart';
import 'package:sizer/sizer.dart';
import 'services/bindings/home_screen_binding.dart';
import 'view/pages/splash_screen/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // HomeBinding().dependecies();
  // Future.delayed(const Duration(seconds: 2), () {
  //   runApp(const MyApp());
  // });
  SplashBinding().dependencies();
  // Get.lazyPut<HomeScreenTabs>(() => HomeScreenTabs());
  // AuthenticationBinding().dependencies();
  // HomeBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: SplashScreen(),
          //home: CheckoutScreen(),
        );
      },
    );
  }
}
