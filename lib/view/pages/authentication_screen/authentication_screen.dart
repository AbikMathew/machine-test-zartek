import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_test/const/app_colors.dart';
import 'package:zartek_test/controller/authentication_controller.dart';
import 'package:zartek_test/view/pages/home_screen/home_screen.dart';
import 'widgets/authentication_screen_widgets.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({Key? key}) : super(key: key);

  AuthenticationController controller = Get.find<AuthenticationController>();
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
                  controller.login();
                }),
            SizedBox(height: 1.h),
            CustomButton(
                buttonColor: AppColors.kLightGreen,
                buttonText: 'Phone',
                leadingWidget: CustomIcon().phoneIcon(),
                onTap: () {
                //  Get.to(HomeScreen(),binding: );
                })
          ],
        ),
      ),
    );
  }
}
