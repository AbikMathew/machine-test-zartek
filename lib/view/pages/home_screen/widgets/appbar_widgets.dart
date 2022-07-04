import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zartek_test/view/pages/checkout_screen/checkout_screen.dart';
import '../../../../const/app_colors.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.menu,
        color: AppColors.kLightGrey,
        size: 30,
      ),
    );
  }
}

class CartIcon extends StatelessWidget {
  const CartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 8),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          IconButton(
            onPressed: () {},
            // => Get.to(
            //   const CheckoutScreen(),
            // ),
            icon: const Icon(Icons.shopping_cart),
            color: AppColors.kLightGrey,
            iconSize: 34,
          ),
          const CircleAvatar(
            backgroundColor: AppColors.kRed,
            radius: 9,
            child: Text(
              '19',
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
