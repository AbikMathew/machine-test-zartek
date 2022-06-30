import 'package:flutter/material.dart';
import '../../../../const/app_colors.dart';

class AppbarCartIcon extends StatelessWidget {
  const AppbarCartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 8),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: const [
          Icon(Icons.shopping_cart, color: AppColors.kLightGrey, size: 34),
          CircleAvatar(
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
