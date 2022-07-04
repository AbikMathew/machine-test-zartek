import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:zartek_test/const/app_colors.dart';
import 'package:zartek_test/view/pages/authentication_screen/widgets/authentication_screen_widgets.dart';
import 'package:zartek_test/view/pages/home_screen/widgets/item_count_button.dart';
import 'package:zartek_test/view/pages/home_screen/widgets/menu_item.dart';
import 'package:zartek_test/view/widgets/text_widgets.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary',
            style: TextStyle(color: AppColors.kLightGrey)),
        backgroundColor: AppColors.kWhite,
        iconTheme: const IconThemeData(
          color: AppColors.kLightGrey,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: const BoxDecoration(),
          child: Container(
            //padding: EdgeInsets.all(13),
            height: 70.h,
            decoration: const BoxDecoration(
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
                    children: const [
                      CartItem(
                        name: 'Gobi Manchurian',
                        calories: 250,
                        price: 25,
                      ),
                      CartItem(
                        name: 'Gobi Manchurian',
                        calories: 250,
                        price: 25,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

class CartItem extends StatelessWidget {
  const CartItem(
      {Key? key,
      required this.name,
      required this.price,
      required this.calories})
      : super(key: key);

  final String name;
  final double price;
  final double calories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              flex: 1,
              child: VegLogo(),
            ),
            const SizedBox(width: 6),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Heading(text: name),
                  SubHeading(text: '$price'),
                  SubHeading(text: '$calories calories'),
                ],
              ),
            ),
            const SizedBox(width: 6),
            const Expanded(
              flex: 6,
              child: ItemCountButton(
                color: AppColors.kdarkGreen,
              ),
            ),
            const SizedBox(width: 6),
            const Expanded(
              flex: 4,
              child: const SubHeading(text: 'INR: 45.00'),
            ),
          ],
        ),
        Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
