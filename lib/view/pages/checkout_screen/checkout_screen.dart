import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_test/const/app_colors.dart';
import 'package:zartek_test/view/pages/home_screen/widgets/menu_item.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: const BoxDecoration(),
          child: Container(
            //padding: EdgeInsets.all(13),
            height: 70.h,
            decoration: BoxDecoration(
                // border: Border.all(
                //  // color: Colors.red, // red as border color
                // ),
                ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.kdarkGreen,
                      borderRadius: BorderRadius.circular(5)),
                  height: 50,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      '2 Dishes - 2 items',
                      style: TextStyle(
                          color: AppColors.kWhite, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            VegLogo(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      'Total Amount',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('INR 105.10'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
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
        child: const Text('Place Order'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
