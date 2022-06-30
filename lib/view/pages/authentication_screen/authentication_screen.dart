import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_test/const/app_colors.dart';
import 'package:zartek_test/view/pages/home_screen/home_screen.dart';
import 'widgets/authentication_screen_widgets.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/firebase.jpg"),
            SizedBox(height: 25.h),
            CustomButton(
                buttonColor: AppColors.kBlue,
                buttonText: 'Google',
                leadingWidget: CustomIcon().smallGoogleLogo(),
                onTap: () {
                  Get.to(const HomeScreen());
                }),
            SizedBox(height: 1.h),
            CustomButton(
                buttonColor: AppColors.kLightGreen,
                buttonText: 'Phone',
                leadingWidget: CustomIcon().phoneIcon(),
                onTap: () {})
          ],
        ),
      ),
    );
  }
}
