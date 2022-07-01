import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_test/const/app_colors.dart';

class ItemCountButton extends StatelessWidget {
  const ItemCountButton({Key? key}) : super(key: key);
  final int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 35.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.kLightGreen,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.remove,
              color: AppColors.kWhite,
            ),
          ),
          Text(
            count.toString(),
            style: const TextStyle(
              color: AppColors.kWhite,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: AppColors.kWhite,
            ),
          )
        ],
      ),
    );
  }
}
