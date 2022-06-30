import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_test/view/pages/authentication_screen/authentication_screen.dart';
import 'package:zartek_test/view/pages/home_screen/home_screen.dart';

void main() {
  Future.delayed(const Duration(seconds: 2), () {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo', home: HomeScreen(),
          // AuthenticationScreen(),
        );
      },
    );
  }
}
