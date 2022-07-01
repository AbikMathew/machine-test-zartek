import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_test/const/app_colors.dart';
import '../../../widgets/text_widgets.dart';
import 'item_count_button.dart';

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      height: 23.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VegLogo(),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Heading(text: 'Spinach Salad'),
                SizedBox(height: 0.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SubHeading(text: 'SAR 7.95'),
                    SubHeading(text: '15 Calories'),
                  ],
                ),
                SizedBox(height: 1.h),
                SizedBox(
                  width: 70.w,
                  child: const DescriptionText(
                      text:
                          'Here comes the names of differet food items that taste really wellthe names of differet food items that taste really well but hard to pronounce which are great'),
                ),
                SizedBox(height: 2.h),
                const ItemCountButton()
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5),
            child: FoodImage(),
          )
        ],
      ),
    );
  }
}

class FoodImage extends StatelessWidget {
  const FoodImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 10.h,
        width: 20.w,
        child: Image.asset('assets/images/food_image.jpg'));
  }
}

class VegLogo extends StatelessWidget {
  const VegLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kLightGreen),
      ),
      child: const Padding(
        padding: EdgeInsets.all(1.0),
        child: CircleAvatar(
          backgroundColor: AppColors.kLightGreen,
        ),
      ),
    );
  }
}
