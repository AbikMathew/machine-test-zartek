import 'package:flutter/material.dart';
import 'package:zartek_test/const/app_colors.dart';
import 'widgets/appbar_cart_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: AppColors.kLightGrey,
          size: 30,
        ),
        actions: const [
          AppbarCartIcon(),
        ],
        backgroundColor: AppColors.kWhite,
      ),
    );
  }
}
