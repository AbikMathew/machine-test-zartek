import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../const/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.buttonColor,
      required this.buttonText,
      required this.leadingWidget,
      required this.onTap})
      : super(key: key);
  final Color buttonColor;
  final String buttonText;
  final Widget leadingWidget;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 8.h,
        width: 85.w,
        padding: EdgeInsets.only(
          left: 7.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.h),
          color: buttonColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leadingWidget,
            Padding(
              padding: EdgeInsets.only(right: 35.w),
              child: Text(buttonText,
                  style: const TextStyle(
                    color: AppColors.kWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIcon {
  Icon phoneIcon() {
    return const Icon(
      Icons.phone,
      color: AppColors.kWhite,
    );
  }

  Container smallGoogleLogo() {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset('assets/images/google-color.png'),
      ),
    );
  }
}
