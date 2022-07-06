import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_test/const/app_colors.dart';
import '../../../../controller/home_controller.dart';
import '../../../widgets/text_widgets.dart';
import 'item_count_button.dart';
import 'package:get/get.dart';

class CustomMenuItem extends StatelessWidget {
  CustomMenuItem({
    Key? key,
    required this.catDishIndex,
  }) : super(key: key);

  final HomeController controller = Get.find<HomeController>();
  final int catDishIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      cacheExtent: 10000,
      separatorBuilder: ((context, index) => const Divider(
            thickness: 1,
          )),
      itemCount: controller
          .product![0].tableMenuList![catDishIndex].categoryDishes!.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          height: 24.h,
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
                    Heading(
                        text: controller
                            .product![0]
                            .tableMenuList![catDishIndex]
                            .categoryDishes![index]
                            .dishName),
                    SizedBox(height: 0.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubHeading(
                            text:
                                'INR ${controller.product![0].tableMenuList![catDishIndex].categoryDishes![index].dishPrice}'),
                        SubHeading(
                            text:
                                '${controller.product![0].tableMenuList![catDishIndex].categoryDishes![index].dishCalories} calories'),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    SizedBox(
                      width: 70.w,
                      child: DescriptionText(
                          text: controller
                              .product![0]
                              .tableMenuList![catDishIndex]
                              .categoryDishes![index]
                              .dishDescription),
                    ),
                    SizedBox(height: 2.h),
                    const ItemCountButton(
                      color: AppColors.kLightGreen,
                    ),
                    SizedBox(height: 1.h),
                    customizationAvailable(index)
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
      },
    );
  }

  Widget customizationAvailable(int index) {
    final addOnCat = controller.product![0].tableMenuList![catDishIndex]
        .categoryDishes![index].addonCat;

    if (addOnCat!.isEmpty) {
      return SizedBox();
    } else
      return const Text(
        'Customization Available',
        style: TextStyle(color: AppColors.kRed),
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
