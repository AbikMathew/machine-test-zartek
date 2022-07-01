import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_test/const/app_colors.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.kdarkGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.0),
          ),
          minimumSize: Size(88.w, 50),
          maximumSize: Size(90.w, 50),
        ),
        onPressed: () {},
        child: Text('Place Order'),
      ),
      // FloatingActionButton(
      //   isExtended: true,
      //   onPressed: () {},
      //   child: Text('Place Order'),
      // ),
      //TextButton(onPressed: (){}, child: Text('Place Order'),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
